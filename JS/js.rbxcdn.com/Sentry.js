! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "d21bae3b43c1f148afba1f5969c11f9e848947a4"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "1f1acad8-a72a-4c89-9d47-0bb4374f8bf9", e._sentryDebugIdIdentifier = "sentry-dbid-1f1acad8-a72a-4c89-9d47-0bb4374f8bf9")
    } catch (e) {}
}(),
function() {
    var e = {
            913: function(e, t, n) {
                "use strict";

                function r() {
                    return "u" > typeof __SENTRY_BROWSER_BUNDLE__ && !!__SENTRY_BROWSER_BUNDLE__
                }

                function a() {
                    return "npm"
                }
                n.d(t, {
                    Z: function() {
                        return r
                    },
                    e: function() {
                        return a
                    }
                })
            },
            432: function(e, t, n) {
                "use strict";
                n.d(t, {
                    w: function() {
                        return i
                    }
                });
                var r = n(913);
                e = n.hmd(e);
                var a = n(773);

                function i() {
                    return !(0, r.Z)() && "[object process]" === Object.prototype.toString.call(void 0 !== a ? a : 0)
                }
            },
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
                    var t, n, i = s(e),
                        o = i[0],
                        u = i[1],
                        l = new a((o + u) * 3 / 4 - u),
                        c = 0,
                        f = u > 0 ? o - 4 : o;
                    for (n = 0; n < f; n += 4) t = r[e.charCodeAt(n)] << 18 | r[e.charCodeAt(n + 1)] << 12 | r[e.charCodeAt(n + 2)] << 6 | r[e.charCodeAt(n + 3)], l[c++] = t >> 16 & 255, l[c++] = t >> 8 & 255, l[c++] = 255 & t;
                    return 2 === u && (t = r[e.charCodeAt(n)] << 2 | r[e.charCodeAt(n + 1)] >> 4, l[c++] = 255 & t), 1 === u && (t = r[e.charCodeAt(n)] << 10 | r[e.charCodeAt(n + 1)] << 4 | r[e.charCodeAt(n + 2)] >> 2, l[c++] = t >> 8 & 255, l[c++] = 255 & t), l
                }, t.fromByteArray = function(e) {
                    for (var t, r = e.length, a = r % 3, i = [], o = 0, u = r - a; o < u; o += 16383) i.push(function(e, t, r) {
                        for (var a, i = [], o = t; o < r; o += 3) a = (e[o] << 16 & 0xff0000) + (e[o + 1] << 8 & 65280) + (255 & e[o + 2]), i.push(n[a >> 18 & 63] + n[a >> 12 & 63] + n[a >> 6 & 63] + n[63 & a]);
                        return i.join("")
                    }(e, o, o + 16383 > u ? u : o + 16383));
                    return 1 === a ? i.push(n[(t = e[r - 1]) >> 2] + n[t << 4 & 63] + "==") : 2 === a && i.push(n[(t = (e[r - 2] << 8) + e[r - 1]) >> 10] + n[t >> 4 & 63] + n[t << 2 & 63] + "="), i.join("")
                };
                for (var n = [], r = [], a = "u" > typeof Uint8Array ? Uint8Array : Array, i = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", o = 0, u = i.length; o < u; ++o) n[o] = i[o], r[i.charCodeAt(o)] = o;

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
                    a = n(844),
                    i = n(742),
                    o = n(619),
                    u = "function" == typeof Symbol && "function" == typeof Symbol.for ? Symbol.for("nodejs.util.inspect.custom") : null;

                function s(e) {
                    if (e > 0x7fffffff) throw RangeError('The value "' + e + '" is invalid for option "size"');
                    var t = new Uint8Array(e);
                    return Object.setPrototypeOf(t, l.prototype), t
                }

                function l(e, t, n) {
                    if ("number" == typeof e) {
                        if ("string" == typeof t) throw TypeError('The "string" argument must be of type string. Received type number');
                        return d(e)
                    }
                    return c(e, t, n)
                }

                function c(e, t, n) {
                    if ("string" == typeof e) {
                        var r = e,
                            i = t;
                        if (("string" != typeof i || "" === i) && (i = "utf8"), !l.isEncoding(i)) throw TypeError("Unknown encoding: " + i);
                        var o = 0 | h(r, i),
                            u = s(o),
                            c = u.write(r, i);
                        return c !== o && (u = u.slice(0, c)), u
                    }
                    if (ArrayBuffer.isView(e)) {
                        var f = e;
                        if (O(f, Uint8Array)) {
                            var d = new Uint8Array(f);
                            return v(d.buffer, d.byteOffset, d.byteLength)
                        }
                        return p(f)
                    }
                    if (null == e) throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type " + (void 0 === e ? "undefined" : a._(e)));
                    if (O(e, ArrayBuffer) || e && O(e.buffer, ArrayBuffer) || "u" > typeof SharedArrayBuffer && (O(e, SharedArrayBuffer) || e && O(e.buffer, SharedArrayBuffer))) return v(e, t, n);
                    if ("number" == typeof e) throw TypeError('The "value" argument must not be of type number. Received type number');
                    var g = e.valueOf && e.valueOf();
                    if (null != g && g !== e) return l.from(g, t, n);
                    var y = function(e) {
                        if (l.isBuffer(e)) {
                            var t = 0 | m(e.length),
                                n = s(t);
                            return 0 === n.length || e.copy(n, 0, 0, t), n
                        }
                        return void 0 !== e.length ? "number" != typeof e.length || function(e) {
                            return e != e
                        }(e.length) ? s(0) : p(e) : "Buffer" === e.type && Array.isArray(e.data) ? p(e.data) : void 0
                    }(e);
                    if (y) return y;
                    if ("u" > typeof Symbol && null != Symbol.toPrimitive && "function" == typeof e[Symbol.toPrimitive]) return l.from(e[Symbol.toPrimitive]("string"), t, n);
                    throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type " + (void 0 === e ? "undefined" : a._(e)))
                }

                function f(e) {
                    if ("number" != typeof e) throw TypeError('"size" argument must be of type number');
                    if (e < 0) throw RangeError('The value "' + e + '" is invalid for option "size"')
                }

                function d(e) {
                    return f(e), s(e < 0 ? 0 : 0 | m(e))
                }

                function p(e) {
                    for (var t = e.length < 0 ? 0 : 0 | m(e.length), n = s(t), r = 0; r < t; r += 1) n[r] = 255 & e[r];
                    return n
                }

                function v(e, t, n) {
                    var r;
                    if (t < 0 || e.byteLength < t) throw RangeError('"offset" is outside of buffer bounds');
                    if (e.byteLength < t + (n || 0)) throw RangeError('"length" is outside of buffer bounds');
                    return Object.setPrototypeOf(r = void 0 === t && void 0 === n ? new Uint8Array(e) : void 0 === n ? new Uint8Array(e, t) : new Uint8Array(e, t, n), l.prototype), r
                }

                function m(e) {
                    if (e >= 0x7fffffff) throw RangeError("Attempt to allocate Buffer larger than maximum size: 0x7fffffff bytes");
                    return 0 | e
                }

                function h(e, t) {
                    if (l.isBuffer(e)) return e.length;
                    if (ArrayBuffer.isView(e) || O(e, ArrayBuffer)) return e.byteLength;
                    if ("string" != typeof e) throw TypeError('The "string" argument must be one of type string, Buffer, or ArrayBuffer. Received type ' + (void 0 === e ? "undefined" : a._(e)));
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
                            return k(e).length;
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
                            if (i) return r ? -1 : k(e).length;
                            t = ("" + t).toLowerCase(), i = !0
                    }
                }

                function g(e, t, n) {
                    var r, a, o, u = !1;
                    if ((void 0 === t || t < 0) && (t = 0), t > this.length || ((void 0 === n || n > this.length) && (n = this.length), n <= 0 || (n >>>= 0) <= (t >>>= 0))) return "";
                    for (e || (e = "utf8");;) switch (e) {
                        case "hex":
                            return function(e, t, n) {
                                var r = e.length;
                                (!t || t < 0) && (t = 0), (!n || n < 0 || n > r) && (n = r);
                                for (var a = "", i = t; i < n; ++i) a += V[e[i]];
                                return a
                            }(this, t, n);
                        case "utf8":
                        case "utf-8":
                            return E(this, t, n);
                        case "ascii":
                            return function(e, t, n) {
                                var r = "";
                                n = Math.min(e.length, n);
                                for (var a = t; a < n; ++a) r += String.fromCharCode(127 & e[a]);
                                return r
                            }(this, t, n);
                        case "latin1":
                        case "binary":
                            return function(e, t, n) {
                                var r = "";
                                n = Math.min(e.length, n);
                                for (var a = t; a < n; ++a) r += String.fromCharCode(e[a]);
                                return r
                            }(this, t, n);
                        case "base64":
                            return r = this, a = t, o = n, 0 === a && o === r.length ? i.fromByteArray(r) : i.fromByteArray(r.slice(a, o));
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return function(e, t, n) {
                                for (var r = e.slice(t, n), a = "", i = 0; i < r.length - 1; i += 2) a += String.fromCharCode(r[i] + 256 * r[i + 1]);
                                return a
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

                function b(e, t, n, r, a) {
                    var i;
                    if (0 === e.length) return -1;
                    if ("string" == typeof n ? (r = n, n = 0) : n > 0x7fffffff ? n = 0x7fffffff : n < -0x80000000 && (n = -0x80000000), (i = n *= 1) != i && (n = a ? 0 : e.length - 1), n < 0 && (n = e.length + n), n >= e.length)
                        if (a) return -1;
                        else n = e.length - 1;
                    else if (n < 0)
                        if (!a) return -1;
                        else n = 0;
                    if ("string" == typeof t && (t = l.from(t, r)), l.isBuffer(t)) return 0 === t.length ? -1 : _(e, t, n, r, a);
                    if ("number" == typeof t) {
                        if (t &= 255, "function" == typeof Uint8Array.prototype.indexOf)
                            if (a) return Uint8Array.prototype.indexOf.call(e, t, n);
                            else return Uint8Array.prototype.lastIndexOf.call(e, t, n);
                        return _(e, [t], n, r, a)
                    }
                    throw TypeError("val must be string, number or Buffer")
                }

                function _(e, t, n, r, a) {
                    var i, o = 1,
                        u = e.length,
                        s = t.length;
                    if (void 0 !== r && ("ucs2" === (r = String(r).toLowerCase()) || "ucs-2" === r || "utf16le" === r || "utf-16le" === r)) {
                        if (e.length < 2 || t.length < 2) return -1;
                        o = 2, u /= 2, s /= 2, n /= 2
                    }

                    function l(e, t) {
                        return 1 === o ? e[t] : e.readUInt16BE(t * o)
                    }
                    if (a) {
                        var c = -1;
                        for (i = n; i < u; i++)
                            if (l(e, i) === l(t, -1 === c ? 0 : i - c)) {
                                if (-1 === c && (c = i), i - c + 1 === s) return c * o
                            } else - 1 !== c && (i -= i - c), c = -1
                    } else
                        for (n + s > u && (n = u - s), i = n; i >= 0; i--) {
                            for (var f = !0, d = 0; d < s; d++)
                                if (l(e, i + d) !== l(t, d)) {
                                    f = !1;
                                    break
                                } if (f) return i
                        }
                    return -1
                }

                function E(e, t, n) {
                    n = Math.min(e.length, n);
                    for (var r = [], a = t; a < n;) {
                        var i, o, u, s, l = e[a],
                            c = null,
                            f = l > 239 ? 4 : l > 223 ? 3 : l > 191 ? 2 : 1;
                        if (a + f <= n) switch (f) {
                            case 1:
                                l < 128 && (c = l);
                                break;
                            case 2:
                                (192 & (i = e[a + 1])) == 128 && (s = (31 & l) << 6 | 63 & i) > 127 && (c = s);
                                break;
                            case 3:
                                i = e[a + 1], o = e[a + 2], (192 & i) == 128 && (192 & o) == 128 && (s = (15 & l) << 12 | (63 & i) << 6 | 63 & o) > 2047 && (s < 55296 || s > 57343) && (c = s);
                                break;
                            case 4:
                                i = e[a + 1], o = e[a + 2], u = e[a + 3], (192 & i) == 128 && (192 & o) == 128 && (192 & u) == 128 && (s = (15 & l) << 18 | (63 & i) << 12 | (63 & o) << 6 | 63 & u) > 65535 && s < 1114112 && (c = s)
                        }
                        null === c ? (c = 65533, f = 1) : c > 65535 && (c -= 65536, r.push(c >>> 10 & 1023 | 55296), c = 56320 | 1023 & c), r.push(c), a += f
                    }
                    var d = r,
                        p = d.length;
                    if (p <= 4096) return String.fromCharCode.apply(String, d);
                    for (var v = "", m = 0; m < p;) v += String.fromCharCode.apply(String, d.slice(m, m += 4096));
                    return v
                }

                function S(e, t, n) {
                    if (e % 1 != 0 || e < 0) throw RangeError("offset is not uint");
                    if (e + t > n) throw RangeError("Trying to access beyond buffer length")
                }

                function w(e, t, n, r, a, i) {
                    if (!l.isBuffer(e)) throw TypeError('"buffer" argument must be a Buffer instance');
                    if (t > a || t < i) throw RangeError('"value" argument is out of bounds');
                    if (n + r > e.length) throw RangeError("Index out of range")
                }

                function T(e, t, n, r, a, i) {
                    if (n + r > e.length || n < 0) throw RangeError("Index out of range")
                }

                function I(e, t, n, r, a) {
                    return t *= 1, n >>>= 0, a || T(e, t, n, 4, 34028234663852886e22, -34028234663852886e22), o.write(e, t, n, r, 23, 4), n + 4
                }

                function N(e, t, n, r, a) {
                    return t *= 1, n >>>= 0, a || T(e, t, n, 8, 17976931348623157e292, -17976931348623157e292), o.write(e, t, n, r, 52, 8), n + 8
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
                }), l.poolSize = 8192, l.from = function(e, t, n) {
                    return c(e, t, n)
                }, Object.setPrototypeOf(l.prototype, Uint8Array.prototype), Object.setPrototypeOf(l, Uint8Array), l.alloc = function(e, t, n) {
                    return (f(e), e <= 0) ? s(e) : void 0 !== t ? "string" == typeof n ? s(e).fill(t, n) : s(e).fill(t) : s(e)
                }, l.allocUnsafe = function(e) {
                    return d(e)
                }, l.allocUnsafeSlow = function(e) {
                    return d(e)
                }, l.isBuffer = function(e) {
                    return null != e && !0 === e._isBuffer && e !== l.prototype
                }, l.compare = function(e, t) {
                    if (O(e, Uint8Array) && (e = l.from(e, e.offset, e.byteLength)), O(t, Uint8Array) && (t = l.from(t, t.offset, t.byteLength)), !l.isBuffer(e) || !l.isBuffer(t)) throw TypeError('The "buf1", "buf2" arguments must be one of type Buffer or Uint8Array');
                    if (e === t) return 0;
                    for (var n = e.length, r = t.length, a = 0, i = Math.min(n, r); a < i; ++a)
                        if (e[a] !== t[a]) {
                            n = e[a], r = t[a];
                            break
                        } return n < r ? -1 : +(r < n)
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
                        for (n = 0, t = 0; n < e.length; ++n) t += e[n].length;
                    var n, r = l.allocUnsafe(t),
                        a = 0;
                    for (n = 0; n < e.length; ++n) {
                        var i = e[n];
                        if (O(i, Uint8Array)) a + i.length > r.length ? l.from(i).copy(r, a) : Uint8Array.prototype.set.call(r, i, a);
                        else if (l.isBuffer(i)) i.copy(r, a);
                        else throw TypeError('"list" argument must be an Array of Buffers');
                        a += i.length
                    }
                    return r
                }, l.byteLength = h, l.prototype._isBuffer = !0, l.prototype.swap16 = function() {
                    var e = this.length;
                    if (e % 2 != 0) throw RangeError("Buffer size must be a multiple of 16-bits");
                    for (var t = 0; t < e; t += 2) y(this, t, t + 1);
                    return this
                }, l.prototype.swap32 = function() {
                    var e = this.length;
                    if (e % 4 != 0) throw RangeError("Buffer size must be a multiple of 32-bits");
                    for (var t = 0; t < e; t += 4) y(this, t, t + 3), y(this, t + 1, t + 2);
                    return this
                }, l.prototype.swap64 = function() {
                    var e = this.length;
                    if (e % 8 != 0) throw RangeError("Buffer size must be a multiple of 64-bits");
                    for (var t = 0; t < e; t += 8) y(this, t, t + 7), y(this, t + 1, t + 6), y(this, t + 2, t + 5), y(this, t + 3, t + 4);
                    return this
                }, l.prototype.toString = function() {
                    var e = this.length;
                    return 0 === e ? "" : 0 == arguments.length ? E(this, 0, e) : g.apply(this, arguments)
                }, l.prototype.toLocaleString = l.prototype.toString, l.prototype.equals = function(e) {
                    if (!l.isBuffer(e)) throw TypeError("Argument must be a Buffer");
                    return this === e || 0 === l.compare(this, e)
                }, l.prototype.inspect = function() {
                    var e = "",
                        n = t.INSPECT_MAX_BYTES;
                    return e = this.toString("hex", 0, n).replace(/(.{2})/g, "$1 ").trim(), this.length > n && (e += " ... "), "<Buffer " + e + ">"
                }, u && (l.prototype[u] = l.prototype.inspect), l.prototype.compare = function(e, t, n, r, i) {
                    if (O(e, Uint8Array) && (e = l.from(e, e.offset, e.byteLength)), !l.isBuffer(e)) throw TypeError('The "target" argument must be one of type Buffer or Uint8Array. Received type ' + (void 0 === e ? "undefined" : a._(e)));
                    if (void 0 === t && (t = 0), void 0 === n && (n = e ? e.length : 0), void 0 === r && (r = 0), void 0 === i && (i = this.length), t < 0 || n > e.length || r < 0 || i > this.length) throw RangeError("out of range index");
                    if (r >= i && t >= n) return 0;
                    if (r >= i) return -1;
                    if (t >= n) return 1;
                    if (t >>>= 0, n >>>= 0, r >>>= 0, i >>>= 0, this === e) return 0;
                    for (var o = i - r, u = n - t, s = Math.min(o, u), c = this.slice(r, i), f = e.slice(t, n), d = 0; d < s; ++d)
                        if (c[d] !== f[d]) {
                            o = c[d], u = f[d];
                            break
                        } return o < u ? -1 : +(u < o)
                }, l.prototype.includes = function(e, t, n) {
                    return -1 !== this.indexOf(e, t, n)
                }, l.prototype.indexOf = function(e, t, n) {
                    return b(this, e, t, n, !0)
                }, l.prototype.lastIndexOf = function(e, t, n) {
                    return b(this, e, t, n, !1)
                }, l.prototype.write = function(e, t, n, r) {
                    if (void 0 === t) r = "utf8", n = this.length, t = 0;
                    else if (void 0 === n && "string" == typeof t) r = t, n = this.length, t = 0;
                    else if (isFinite(t)) t >>>= 0, isFinite(n) ? (n >>>= 0, void 0 === r && (r = "utf8")) : (r = n, n = void 0);
                    else throw Error("Buffer.write(string, encoding, offset[, length]) is no longer supported");
                    var a, i, o, u, s, l, c, f, d = this.length - t;
                    if ((void 0 === n || n > d) && (n = d), e.length > 0 && (n < 0 || t < 0) || t > this.length) throw RangeError("Attempt to write outside buffer bounds");
                    r || (r = "utf8");
                    for (var p = !1;;) switch (r) {
                        case "hex":
                            return function(e, t, n, r) {
                                n = Number(n) || 0;
                                var a = e.length - n;
                                r ? (r = Number(r)) > a && (r = a) : r = a;
                                var i = t.length;
                                r > i / 2 && (r = i / 2);
                                for (var o = 0; o < r; ++o) {
                                    var u, s = parseInt(t.substr(2 * o, 2), 16);
                                    if ((u = s) != u) break;
                                    e[n + o] = s
                                }
                                return o
                            }(this, e, t, n);
                        case "utf8":
                        case "utf-8":
                            return a = t, i = n, R(k(e, this.length - a), this, a, i);
                        case "ascii":
                        case "latin1":
                        case "binary":
                            return o = t, u = n, R(function(e) {
                                for (var t = [], n = 0; n < e.length; ++n) t.push(255 & e.charCodeAt(n));
                                return t
                            }(e), this, o, u);
                        case "base64":
                            return s = t, l = n, R(x(e), this, s, l);
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return c = t, f = n, R(function(e, t) {
                                for (var n, r, a = [], i = 0; i < e.length && !((t -= 2) < 0); ++i) r = (n = e.charCodeAt(i)) >> 8, a.push(n % 256), a.push(r);
                                return a
                            }(e, this.length - c), this, c, f);
                        default:
                            if (p) throw TypeError("Unknown encoding: " + r);
                            r = ("" + r).toLowerCase(), p = !0
                    }
                }, l.prototype.toJSON = function() {
                    return {
                        type: "Buffer",
                        data: Array.prototype.slice.call(this._arr || this, 0)
                    }
                }, l.prototype.slice = function(e, t) {
                    var n = this.length;
                    e = ~~e, t = void 0 === t ? n : ~~t, e < 0 ? (e += n) < 0 && (e = 0) : e > n && (e = n), t < 0 ? (t += n) < 0 && (t = 0) : t > n && (t = n), t < e && (t = e);
                    var r = this.subarray(e, t);
                    return Object.setPrototypeOf(r, l.prototype), r
                }, l.prototype.readUintLE = l.prototype.readUIntLE = function(e, t, n) {
                    e >>>= 0, t >>>= 0, n || S(e, t, this.length);
                    for (var r = this[e], a = 1, i = 0; ++i < t && (a *= 256);) r += this[e + i] * a;
                    return r
                }, l.prototype.readUintBE = l.prototype.readUIntBE = function(e, t, n) {
                    e >>>= 0, t >>>= 0, n || S(e, t, this.length);
                    for (var r = this[e + --t], a = 1; t > 0 && (a *= 256);) r += this[e + --t] * a;
                    return r
                }, l.prototype.readUint8 = l.prototype.readUInt8 = function(e, t) {
                    return e >>>= 0, t || S(e, 1, this.length), this[e]
                }, l.prototype.readUint16LE = l.prototype.readUInt16LE = function(e, t) {
                    return e >>>= 0, t || S(e, 2, this.length), this[e] | this[e + 1] << 8
                }, l.prototype.readUint16BE = l.prototype.readUInt16BE = function(e, t) {
                    return e >>>= 0, t || S(e, 2, this.length), this[e] << 8 | this[e + 1]
                }, l.prototype.readUint32LE = l.prototype.readUInt32LE = function(e, t) {
                    return e >>>= 0, t || S(e, 4, this.length), (this[e] | this[e + 1] << 8 | this[e + 2] << 16) + 0x1000000 * this[e + 3]
                }, l.prototype.readUint32BE = l.prototype.readUInt32BE = function(e, t) {
                    return e >>>= 0, t || S(e, 4, this.length), 0x1000000 * this[e] + (this[e + 1] << 16 | this[e + 2] << 8 | this[e + 3])
                }, l.prototype.readIntLE = function(e, t, n) {
                    e >>>= 0, t >>>= 0, n || S(e, t, this.length);
                    for (var r = this[e], a = 1, i = 0; ++i < t && (a *= 256);) r += this[e + i] * a;
                    return r >= (a *= 128) && (r -= Math.pow(2, 8 * t)), r
                }, l.prototype.readIntBE = function(e, t, n) {
                    e >>>= 0, t >>>= 0, n || S(e, t, this.length);
                    for (var r = t, a = 1, i = this[e + --r]; r > 0 && (a *= 256);) i += this[e + --r] * a;
                    return i >= (a *= 128) && (i -= Math.pow(2, 8 * t)), i
                }, l.prototype.readInt8 = function(e, t) {
                    return (e >>>= 0, t || S(e, 1, this.length), 128 & this[e]) ? -((255 - this[e] + 1) * 1) : this[e]
                }, l.prototype.readInt16LE = function(e, t) {
                    e >>>= 0, t || S(e, 2, this.length);
                    var n = this[e] | this[e + 1] << 8;
                    return 32768 & n ? 0xffff0000 | n : n
                }, l.prototype.readInt16BE = function(e, t) {
                    e >>>= 0, t || S(e, 2, this.length);
                    var n = this[e + 1] | this[e] << 8;
                    return 32768 & n ? 0xffff0000 | n : n
                }, l.prototype.readInt32LE = function(e, t) {
                    return e >>>= 0, t || S(e, 4, this.length), this[e] | this[e + 1] << 8 | this[e + 2] << 16 | this[e + 3] << 24
                }, l.prototype.readInt32BE = function(e, t) {
                    return e >>>= 0, t || S(e, 4, this.length), this[e] << 24 | this[e + 1] << 16 | this[e + 2] << 8 | this[e + 3]
                }, l.prototype.readFloatLE = function(e, t) {
                    return e >>>= 0, t || S(e, 4, this.length), o.read(this, e, !0, 23, 4)
                }, l.prototype.readFloatBE = function(e, t) {
                    return e >>>= 0, t || S(e, 4, this.length), o.read(this, e, !1, 23, 4)
                }, l.prototype.readDoubleLE = function(e, t) {
                    return e >>>= 0, t || S(e, 8, this.length), o.read(this, e, !0, 52, 8)
                }, l.prototype.readDoubleBE = function(e, t) {
                    return e >>>= 0, t || S(e, 8, this.length), o.read(this, e, !1, 52, 8)
                }, l.prototype.writeUintLE = l.prototype.writeUIntLE = function(e, t, n, r) {
                    if (e *= 1, t >>>= 0, n >>>= 0, !r) {
                        var a = Math.pow(2, 8 * n) - 1;
                        w(this, e, t, n, a, 0)
                    }
                    var i = 1,
                        o = 0;
                    for (this[t] = 255 & e; ++o < n && (i *= 256);) this[t + o] = e / i & 255;
                    return t + n
                }, l.prototype.writeUintBE = l.prototype.writeUIntBE = function(e, t, n, r) {
                    if (e *= 1, t >>>= 0, n >>>= 0, !r) {
                        var a = Math.pow(2, 8 * n) - 1;
                        w(this, e, t, n, a, 0)
                    }
                    var i = n - 1,
                        o = 1;
                    for (this[t + i] = 255 & e; --i >= 0 && (o *= 256);) this[t + i] = e / o & 255;
                    return t + n
                }, l.prototype.writeUint8 = l.prototype.writeUInt8 = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || w(this, e, t, 1, 255, 0), this[t] = 255 & e, t + 1
                }, l.prototype.writeUint16LE = l.prototype.writeUInt16LE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || w(this, e, t, 2, 65535, 0), this[t] = 255 & e, this[t + 1] = e >>> 8, t + 2
                }, l.prototype.writeUint16BE = l.prototype.writeUInt16BE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || w(this, e, t, 2, 65535, 0), this[t] = e >>> 8, this[t + 1] = 255 & e, t + 2
                }, l.prototype.writeUint32LE = l.prototype.writeUInt32LE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || w(this, e, t, 4, 0xffffffff, 0), this[t + 3] = e >>> 24, this[t + 2] = e >>> 16, this[t + 1] = e >>> 8, this[t] = 255 & e, t + 4
                }, l.prototype.writeUint32BE = l.prototype.writeUInt32BE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || w(this, e, t, 4, 0xffffffff, 0), this[t] = e >>> 24, this[t + 1] = e >>> 16, this[t + 2] = e >>> 8, this[t + 3] = 255 & e, t + 4
                }, l.prototype.writeIntLE = function(e, t, n, r) {
                    if (e *= 1, t >>>= 0, !r) {
                        var a = Math.pow(2, 8 * n - 1);
                        w(this, e, t, n, a - 1, -a)
                    }
                    var i = 0,
                        o = 1,
                        u = 0;
                    for (this[t] = 255 & e; ++i < n && (o *= 256);) e < 0 && 0 === u && 0 !== this[t + i - 1] && (u = 1), this[t + i] = (e / o | 0) - u & 255;
                    return t + n
                }, l.prototype.writeIntBE = function(e, t, n, r) {
                    if (e *= 1, t >>>= 0, !r) {
                        var a = Math.pow(2, 8 * n - 1);
                        w(this, e, t, n, a - 1, -a)
                    }
                    var i = n - 1,
                        o = 1,
                        u = 0;
                    for (this[t + i] = 255 & e; --i >= 0 && (o *= 256);) e < 0 && 0 === u && 0 !== this[t + i + 1] && (u = 1), this[t + i] = (e / o | 0) - u & 255;
                    return t + n
                }, l.prototype.writeInt8 = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || w(this, e, t, 1, 127, -128), e < 0 && (e = 255 + e + 1), this[t] = 255 & e, t + 1
                }, l.prototype.writeInt16LE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || w(this, e, t, 2, 32767, -32768), this[t] = 255 & e, this[t + 1] = e >>> 8, t + 2
                }, l.prototype.writeInt16BE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || w(this, e, t, 2, 32767, -32768), this[t] = e >>> 8, this[t + 1] = 255 & e, t + 2
                }, l.prototype.writeInt32LE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || w(this, e, t, 4, 0x7fffffff, -0x80000000), this[t] = 255 & e, this[t + 1] = e >>> 8, this[t + 2] = e >>> 16, this[t + 3] = e >>> 24, t + 4
                }, l.prototype.writeInt32BE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || w(this, e, t, 4, 0x7fffffff, -0x80000000), e < 0 && (e = 0xffffffff + e + 1), this[t] = e >>> 24, this[t + 1] = e >>> 16, this[t + 2] = e >>> 8, this[t + 3] = 255 & e, t + 4
                }, l.prototype.writeFloatLE = function(e, t, n) {
                    return I(this, e, t, !0, n)
                }, l.prototype.writeFloatBE = function(e, t, n) {
                    return I(this, e, t, !1, n)
                }, l.prototype.writeDoubleLE = function(e, t, n) {
                    return N(this, e, t, !0, n)
                }, l.prototype.writeDoubleBE = function(e, t, n) {
                    return N(this, e, t, !1, n)
                }, l.prototype.copy = function(e, t, n, r) {
                    if (!l.isBuffer(e)) throw TypeError("argument should be a Buffer");
                    if (n || (n = 0), r || 0 === r || (r = this.length), t >= e.length && (t = e.length), t || (t = 0), r > 0 && r < n && (r = n), r === n || 0 === e.length || 0 === this.length) return 0;
                    if (t < 0) throw RangeError("targetStart out of bounds");
                    if (n < 0 || n >= this.length) throw RangeError("Index out of range");
                    if (r < 0) throw RangeError("sourceEnd out of bounds");
                    r > this.length && (r = this.length), e.length - t < r - n && (r = e.length - t + n);
                    var a = r - n;
                    return this === e && "function" == typeof Uint8Array.prototype.copyWithin ? this.copyWithin(t, n, r) : Uint8Array.prototype.set.call(e, this.subarray(n, r), t), a
                }, l.prototype.fill = function(e, t, n, r) {
                    if ("string" == typeof e) {
                        if ("string" == typeof t ? (r = t, t = 0, n = this.length) : "string" == typeof n && (r = n, n = this.length), void 0 !== r && "string" != typeof r) throw TypeError("encoding must be a string");
                        if ("string" == typeof r && !l.isEncoding(r)) throw TypeError("Unknown encoding: " + r);
                        if (1 === e.length) {
                            var a, i = e.charCodeAt(0);
                            ("utf8" === r && i < 128 || "latin1" === r) && (e = i)
                        }
                    } else "number" == typeof e ? e &= 255 : "boolean" == typeof e && (e = Number(e));
                    if (t < 0 || this.length < t || this.length < n) throw RangeError("Out of range index");
                    if (n <= t) return this;
                    if (t >>>= 0, n = void 0 === n ? this.length : n >>> 0, e || (e = 0), "number" == typeof e)
                        for (a = t; a < n; ++a) this[a] = e;
                    else {
                        var o = l.isBuffer(e) ? e : l.from(e, r),
                            u = o.length;
                        if (0 === u) throw TypeError('The value "' + e + '" is invalid for argument "value"');
                        for (a = 0; a < n - t; ++a) this[a + t] = o[a % u]
                    }
                    return this
                };
                var A = /[^+/0-9A-Za-z-_]/g;

                function k(e, t) {
                    t = t || 1 / 0;
                    for (var n, r = e.length, a = null, i = [], o = 0; o < r; ++o) {
                        if ((n = e.charCodeAt(o)) > 55295 && n < 57344) {
                            if (!a) {
                                if (n > 56319 || o + 1 === r) {
                                    (t -= 3) > -1 && i.push(239, 191, 189);
                                    continue
                                }
                                a = n;
                                continue
                            }
                            if (n < 56320) {
                                (t -= 3) > -1 && i.push(239, 191, 189), a = n;
                                continue
                            }
                            n = (a - 55296 << 10 | n - 56320) + 65536
                        } else a && (t -= 3) > -1 && i.push(239, 191, 189);
                        if (a = null, n < 128) {
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

                function x(e) {
                    return i.toByteArray(function(e) {
                        if ((e = (e = e.split("=")[0]).trim().replace(A, "")).length < 2) return "";
                        for (; e.length % 4 != 0;) e += "=";
                        return e
                    }(e))
                }

                function R(e, t, n, r) {
                    for (var a = 0; a < r && !(a + n >= t.length) && !(a >= e.length); ++a) t[a + n] = e[a];
                    return a
                }

                function O(e, t) {
                    return r._(e, t) || null != e && null != e.constructor && null != e.constructor.name && e.constructor.name === t.name
                }
                var V = function() {
                    for (var e = "0123456789abcdef", t = Array(256), n = 0; n < 16; ++n)
                        for (var r = 16 * n, a = 0; a < 16; ++a) t[r + a] = e[n] + e[a];
                    return t
                }()
            },
            619: function(e, t) {
                /*! ieee754. BSD-3-Clause License. Feross Aboukhadijeh <https://feross.org/opensource> */
                t.read = function(e, t, n, r, a) {
                    var i, o, u = 8 * a - r - 1,
                        s = (1 << u) - 1,
                        l = s >> 1,
                        c = -7,
                        f = n ? a - 1 : 0,
                        d = n ? -1 : 1,
                        p = e[t + f];
                    for (f += d, i = p & (1 << -c) - 1, p >>= -c, c += u; c > 0; i = 256 * i + e[t + f], f += d, c -= 8);
                    for (o = i & (1 << -c) - 1, i >>= -c, c += r; c > 0; o = 256 * o + e[t + f], f += d, c -= 8);
                    if (0 === i) i = 1 - l;
                    else {
                        if (i === s) return o ? NaN : 1 / 0 * (p ? -1 : 1);
                        o += Math.pow(2, r), i -= l
                    }
                    return (p ? -1 : 1) * o * Math.pow(2, i - r)
                }, t.write = function(e, t, n, r, a, i) {
                    var o, u, s, l = 8 * i - a - 1,
                        c = (1 << l) - 1,
                        f = c >> 1,
                        d = 5960464477539062e-23 * (23 === a),
                        p = r ? 0 : i - 1,
                        v = r ? 1 : -1,
                        m = +(t < 0 || 0 === t && 1 / t < 0);
                    for (isNaN(t = Math.abs(t)) || t === 1 / 0 ? (u = +!!isNaN(t), o = c) : (o = Math.floor(Math.log(t) / Math.LN2), t * (s = Math.pow(2, -o)) < 1 && (o--, s *= 2), o + f >= 1 ? t += d / s : t += d * Math.pow(2, 1 - f), t * s >= 2 && (o++, s /= 2), o + f >= c ? (u = 0, o = c) : o + f >= 1 ? (u = (t * s - 1) * Math.pow(2, a), o += f) : (u = t * Math.pow(2, f - 1) * Math.pow(2, a), o = 0)); a >= 8; e[n + p] = 255 & u, p += v, u /= 256, a -= 8);
                    for (o = o << a | u, l += a; l > 0; e[n + p] = 255 & o, p += v, o /= 256, l -= 8);
                    e[n + p - v] |= 128 * m
                }
            },
            773: function(e, t) {
                "use strict";
                Object.defineProperty(t, "__esModule", {
                    value: !0
                });
                var n, r, a, i = {
                        exports: {}
                    },
                    o = i.exports = {};

                function u() {
                    throw Error("setTimeout has not been defined")
                }

                function s() {
                    throw Error("clearTimeout has not been defined")
                }
                try {
                    n = "function" == typeof setTimeout ? setTimeout : u
                } catch (e) {
                    n = u
                }
                try {
                    r = "function" == typeof clearTimeout ? clearTimeout : s
                } catch (e) {
                    r = s
                }

                function l(e) {
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
                var c = [],
                    f = !1,
                    d = -1;

                function p() {
                    f && a && (f = !1, a.length ? c = a.concat(c) : d = -1, c.length && v())
                }

                function v() {
                    if (!f) {
                        var e = l(p);
                        f = !0;
                        for (var t = c.length; t;) {
                            for (a = c, c = []; ++d < t;) a && a[d].run();
                            d = -1, t = c.length
                        }
                        a = null, f = !1,
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

                function h() {}

                function g() {}
                o.nextTick = function(e) {
                    var t = Array(arguments.length - 1);
                    if (arguments.length > 1)
                        for (var n = 1; n < arguments.length; n++) t[n - 1] = arguments[n];
                    c.push(new m(e, t)), 1 !== c.length || f || l(v)
                }, m.prototype.run = function() {
                    this.fun.apply(null, this.array)
                }, o.title = "browser", o.browser = !0, o.env = {}, o.argv = [], o.version = "", o.versions = {}, o.on = h, o.addListener = h, o.once = h, o.off = h, o.removeListener = h, o.removeAllListeners = h, o.emit = h, o.prependListener = h, o.prependOnceListener = h, o.listeners = function(e) {
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
                var y = i.exports.browser,
                    b = i.exports.binding,
                    _ = {},
                    E = "browser",
                    S = "browser",
                    w = "browser",
                    T = [],
                    I = {
                        nextTick: i.exports.nextTick,
                        title: i.exports.title,
                        browser: y,
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
                        emitWarning: g,
                        prependListener: i.exports.prependListener,
                        prependOnceListener: i.exports.prependOnceListener,
                        listeners: i.exports.listeners,
                        binding: b,
                        cwd: i.exports.cwd,
                        chdir: i.exports.chdir,
                        umask: i.exports.umask,
                        exit: g,
                        pid: 1,
                        features: _,
                        kill: g,
                        dlopen: g,
                        uptime: g,
                        memoryUsage: g,
                        uvCounters: g,
                        platform: E,
                        arch: S,
                        execPath: w,
                        execArgv: T
                    };
                t.addListener = i.exports.addListener, t.arch = S, t.argv = i.exports.argv, t.binding = b, t.browser = y, t.chdir = i.exports.chdir, t.cwd = i.exports.cwd, t.default = I, t.dlopen = g, t.emit = i.exports.emit, t.emitWarning = g, t.env = i.exports.env, t.execArgv = T, t.execPath = w, t.exit = g, t.features = _, t.kill = g, t.listeners = i.exports.listeners, t.memoryUsage = g, t.nextTick = i.exports.nextTick, t.off = i.exports.off, t.on = i.exports.on, t.once = i.exports.once, t.pid = 1, t.platform = E, t.prependListener = i.exports.prependListener, t.prependOnceListener = i.exports.prependOnceListener, t.removeAllListeners = i.exports.removeAllListeners, t.removeListener = i.exports.removeListener, t.title = i.exports.title, t.umask = i.exports.umask, t.uptime = g, t.uvCounters = g, t.version = i.exports.version, t.versions = i.exports.versions, e.exports = I
            },
            848: function(e, t, n) {
                "use strict";
                var r = n(564).Buffer,
                    a = n(844),
                    i = void 0 !== r,
                    o = /"(?:_|\\u005[Ff])(?:_|\\u005[Ff])(?:p|\\u0070)(?:r|\\u0072)(?:o|\\u006[Ff])(?:t|\\u0074)(?:o|\\u006[Ff])(?:_|\\u005[Ff])(?:_|\\u005[Ff])"\s*:/,
                    u = /"(?:c|\\u0063)(?:o|\\u006[Ff])(?:n|\\u006[Ee])(?:s|\\u0073)(?:t|\\u0074)(?:r|\\u0072)(?:u|\\u0075)(?:c|\\u0063)(?:t|\\u0074)(?:o|\\u006[Ff])(?:r|\\u0072)"\s*:/;

                function s(e, t, n) {
                    null == n && null !== t && (void 0 === t ? "undefined" : a._(t)) === "object" && (n = t, t = void 0), i && r.isBuffer(e) && (e = e.toString()), e && 65279 === e.charCodeAt(0) && (e = e.slice(1));
                    var s = JSON.parse(e, t);
                    if (null === s || (void 0 === s ? "undefined" : a._(s)) !== "object") return s;
                    var c = n && n.protoAction || "error",
                        f = n && n.constructorAction || "error";
                    if ("ignore" === c && "ignore" === f) return s;
                    if ("ignore" !== c && "ignore" !== f) {
                        if (!1 === o.test(e) && !1 === u.test(e)) return s
                    } else if ("ignore" !== c && "ignore" === f) {
                        if (!1 === o.test(e)) return s
                    } else if (!1 === u.test(e)) return s;
                    return l(s, {
                        protoAction: c,
                        constructorAction: f,
                        safe: n && n.safe
                    })
                }

                function l(e) {
                    for (var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, n = t.protoAction, r = void 0 === n ? "error" : n, i = t.constructorAction, o = void 0 === i ? "error" : i, u = t.safe, s = [e]; s.length;) {
                        var l = s;
                        s = [];
                        var c = !0,
                            f = !1,
                            d = void 0;
                        try {
                            for (var p, v = l[Symbol.iterator](); !(c = (p = v.next()).done); c = !0) {
                                var m = p.value;
                                if ("ignore" !== r && Object.prototype.hasOwnProperty.call(m, "__proto__")) {
                                    if (!0 === u) return null;
                                    if ("error" === r) throw SyntaxError("Object contains forbidden prototype property");
                                    delete m.__proto__
                                }
                                if ("ignore" !== o && Object.prototype.hasOwnProperty.call(m, "constructor") && null !== m.constructor && "object" === a._(m.constructor) && Object.prototype.hasOwnProperty.call(m.constructor, "prototype")) {
                                    if (!0 === u) return null;
                                    if ("error" === o) throw SyntaxError("Object contains forbidden prototype property");
                                    delete m.constructor
                                }
                                for (var h in m) {
                                    var g = m[h];
                                    g && (void 0 === g ? "undefined" : a._(g)) === "object" && s.push(g)
                                }
                            }
                        } catch (e) {
                            f = !0, d = e
                        } finally {
                            try {
                                c || null == v.return || v.return()
                            } finally {
                                if (f) throw d
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
                }, e.exports.scan = l
            }
        },
        t = {};

    function n(r) {
        var a = t[r];
        if (void 0 !== a) return a.exports;
        var i = t[r] = {
            id: r,
            loaded: !1,
            exports: {}
        };
        return e[r](i, i.exports, n), i.loaded = !0, i.exports
    }
    n.n = function(e) {
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
        }, n.hmd = function(e) {
            return (e = Object.create(e)).children || (e.children = []), Object.defineProperty(e, "exports", {
                enumerable: !0,
                set: function() {
                    throw Error("ES Modules may not assign module.exports or exports.*, Use ESM export syntax, instead: " + e.id)
                }
            }), e
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
        }, n.rv = function() {
            return "1.7.12"
        }, n.ruid = "bundler=rspack@1.7.12",
        function() {
            "use strict";
            var e, t, r, a, i, o, u, s, l, c, f, d, p, v, m, h, g, y, b, _, E, S, w, T, I, N, A, k, x, R, O, V, C, Z, B, L, F, P, X, U, W, D, Y, G, j, M, z, J, K, H, Q, q, $, ee, et, en, er, ea, ei, eo, eu, es, el, ec, ef, ed, ep, ev, em, eh, eg, ey, eb, e_, eE, eS, ew, eT, eI, eN, eA, ek, ex, eR, eO, eV, eC, eZ, eB, eL, eF, eP, eX, eU, eW = n(784);

            function eD(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function eY(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        eD(e, t, n[t])
                    })
                }
                return e
            }

            function eG(e, t) {
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

            function ej(e) {
                if (Array.isArray(e)) return e
            }

            function eM() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function ez(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function eJ(e, t) {
                if (e) {
                    if ("string" == typeof e) return ez(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return ez(e, t)
                }
            }

            function eK(e, t) {
                return ej(e) || function(e, t) {
                    var n, r, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var i = [],
                            o = !0,
                            u = !1;
                        try {
                            for (a = a.call(e); !(o = (n = a.next()).done) && (i.push(n.value), !t || i.length !== t); o = !0);
                        } catch (e) {
                            u = !0, r = e
                        } finally {
                            try {
                                o || null == a.return || a.return()
                            } finally {
                                if (u) throw r
                            }
                        }
                        return i
                    }
                }(e, t) || eJ(e, t) || eM()
            }
            var eH = "10.50.0",
                eQ = globalThis;

            function eq() {
                return e$(eQ), eQ
            }

            function e$(e) {
                var t = e.__SENTRY__ = e.__SENTRY__ || {};
                return t.version = t.version || eH, t[eH] = t[eH] || {}
            }

            function e0(e, t) {
                var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : eQ,
                    r = n.__SENTRY__ = n.__SENTRY__ || {},
                    a = r[eH] = r[eH] || {};
                return a[e] || (a[e] = t())
            }

            function e1(e, t) {
                if (!(0, eW._)(e, t)) throw TypeError("Cannot call a class as a function")
            }

            function e2(e, t) {
                for (var n = 0; n < t.length; n++) {
                    var r = t[n];
                    r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
                }
            }

            function e3(e, t, n) {
                return t && e2(e.prototype, t), n && e2(e, n), e
            }

            function e5(e) {
                if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
            }

            function e9(e) {
                return function(e) {
                    if (Array.isArray(e)) return ez(e)
                }(e) || e5(e) || eJ(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var e4 = "u" < typeof __SENTRY_DEBUG__ || __SENTRY_DEBUG__,
                e8 = n(844),
                e6 = Object.prototype.toString;

            function e7(e) {
                switch (e6.call(e)) {
                    case "[object Error]":
                    case "[object Exception]":
                    case "[object DOMException]":
                    case "[object WebAssembly.Exception]":
                        return !0;
                    default:
                        return tl(e, Error)
                }
            }

            function te(e, t) {
                return e6.call(e) === "[object ".concat(t, "]")
            }

            function tt(e) {
                return te(e, "ErrorEvent")
            }

            function tn(e) {
                return te(e, "DOMError")
            }

            function tr(e) {
                return te(e, "String")
            }

            function ta(e) {
                return (void 0 === e ? "undefined" : (0, e8._)(e)) === "object" && null !== e && "__sentry_template_string__" in e && "__sentry_template_values__" in e
            }

            function ti(e) {
                return null === e || ta(e) || (void 0 === e ? "undefined" : (0, e8._)(e)) !== "object" && "function" != typeof e
            }

            function to(e) {
                return te(e, "Object")
            }

            function tu(e) {
                return "u" > typeof Event && tl(e, Event)
            }

            function ts(e) {
                return !!((null == e ? void 0 : e.then) && "function" == typeof e.then)
            }

            function tl(e, t) {
                try {
                    return (0, eW._)(e, t)
                } catch (e) {
                    return !1
                }
            }

            function tc(e) {
                return !!((void 0 === e ? "undefined" : (0, e8._)(e)) === "object" && null !== e && (e.__isVue || e._isVue || e.__v_isVNode))
            }

            function tf(e) {
                return "u" > typeof Request && tl(e, Request)
            }

            function td(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                if (!e) return "<unknown>";
                try {
                    for (var n, r = e, a = [], i = 0, o = 0, u = Array.isArray(t) ? t : t.keyAttrs, s = !Array.isArray(t) && t.maxStringLength || 80; r && i++ < 5 && (n = function(e, t) {
                            var n = [];
                            if (!(null == e ? void 0 : e.tagName)) return "";
                            if (eQ.HTMLElement && (0, eW._)(e, HTMLElement) && e.dataset) {
                                if (e.dataset.sentryComponent) return e.dataset.sentryComponent;
                                if (e.dataset.sentryElement) return e.dataset.sentryElement
                            }
                            n.push(e.tagName.toLowerCase());
                            var r = (null == t ? void 0 : t.length) ? t.filter(function(t) {
                                return e.getAttribute(t)
                            }).map(function(t) {
                                return [t, e.getAttribute(t)]
                            }) : null;
                            if (null == r ? void 0 : r.length) r.forEach(function(e) {
                                n.push("[".concat(e[0], '="').concat(e[1], '"]'))
                            });
                            else {
                                e.id && n.push("#".concat(e.id));
                                var a = e.className;
                                if (a && tr(a)) {
                                    var i = a.split(/\s+/),
                                        o = !0,
                                        u = !1,
                                        s = void 0;
                                    try {
                                        for (var l, c = i[Symbol.iterator](); !(o = (l = c.next()).done); o = !0) {
                                            var f = l.value;
                                            n.push(".".concat(f))
                                        }
                                    } catch (e) {
                                        u = !0, s = e
                                    } finally {
                                        try {
                                            o || null == c.return || c.return()
                                        } finally {
                                            if (u) throw s
                                        }
                                    }
                                }
                            }
                            for (var d = 0, p = ["aria-label", "type", "name", "title", "alt"]; d < p.length; d++) {
                                var v = p[d],
                                    m = e.getAttribute(v);
                                m && n.push("[".concat(v, '="').concat(m, '"]'))
                            }
                            return n.join("")
                        }(r, u), "html" !== n && (!(i > 1) || !(o + 3 * a.length + n.length >= s)));) a.push(n), o += n.length, r = r.parentNode;
                    return a.reverse().join(" > ")
                } catch (e) {
                    return "<unknown>"
                }
            }

            function tp() {
                try {
                    return eQ.document.location.href
                } catch (e) {
                    return ""
                }
            }

            function tv(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 5;
                if (!eQ.HTMLElement) return null;
                for (var n = e, r = 0; r < t && n; r++) {
                    if ((0, eW._)(n, HTMLElement)) {
                        if (n.dataset.sentryComponent) return n.dataset.sentryComponent;
                        if (n.dataset.sentryElement) return n.dataset.sentryElement
                    }
                    n = n.parentNode
                }
                return null
            }
            var tm = ["debug", "info", "warn", "error", "log", "assert", "trace"],
                th = {};

            function tg(e) {
                if (!("console" in eQ)) return e();
                var t = eQ.console,
                    n = {},
                    r = Object.keys(th);
                r.forEach(function(e) {
                    var r = th[e];
                    n[e] = t[e], t[e] = r
                });
                try {
                    return e()
                } finally {
                    r.forEach(function(e) {
                        t[e] = n[e]
                    })
                }
            }

            function ty() {
                return t_().enabled
            }

            function tb(e) {
                for (var t = arguments.length, n = Array(t > 1 ? t - 1 : 0), r = 1; r < t; r++) n[r - 1] = arguments[r];
                e4 && ty() && tg(function() {
                    var t;
                    (t = eQ.console)[e].apply(t, ["".concat("Sentry Logger ", "[").concat(e, "]:")].concat(e9(n)))
                })
            }

            function t_() {
                return e4 ? e0("loggerSettings", function() {
                    return {
                        enabled: !1
                    }
                }) : {
                    enabled: !1
                }
            }
            var tE = {
                enable: function() {
                    t_().enabled = !0
                },
                disable: function() {
                    t_().enabled = !1
                },
                isEnabled: ty,
                log: function() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    tb.apply(void 0, ["log"].concat(e9(t)))
                },
                warn: function() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    tb.apply(void 0, ["warn"].concat(e9(t)))
                },
                error: function() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    tb.apply(void 0, ["error"].concat(e9(t)))
                }
            };

            function tS(e, t, n) {
                if (t in e) {
                    var r = e[t];
                    if ("function" == typeof r) {
                        var a = n(r);
                        "function" == typeof a && tT(a, r);
                        try {
                            e[t] = a
                        } catch (n) {
                            e4 && tE.log('Failed to replace method "'.concat(t, '" in object'), e)
                        }
                    }
                }
            }

            function tw(e, t, n) {
                try {
                    Object.defineProperty(e, t, {
                        value: n,
                        writable: !0,
                        configurable: !0
                    })
                } catch (n) {
                    e4 && tE.log('Failed to add non-enumerable property "'.concat(t, '" to object'), e)
                }
            }

            function tT(e, t) {
                try {
                    var n = t.prototype || {};
                    e.prototype = t.prototype = n, tw(e, "__sentry_original__", t)
                } catch (e) {}
            }

            function tI(e) {
                return e.__sentry_original__
            }

            function tN(e) {
                if (e7(e)) return eY({
                    message: e.message,
                    name: e.name,
                    stack: e.stack
                }, tk(e));
                if (!tu(e)) return e;
                var t = eY({
                    type: e.type,
                    target: tA(e.target),
                    currentTarget: tA(e.currentTarget)
                }, tk(e));
                return "u" > typeof CustomEvent && tl(e, CustomEvent) && (t.detail = e.detail), t
            }

            function tA(e) {
                try {
                    return "u" > typeof Element && tl(e, Element) ? td(e) : Object.prototype.toString.call(e)
                } catch (e) {
                    return "<unknown>"
                }
            }

            function tk(e) {
                return (void 0 === e ? "undefined" : (0, e8._)(e)) === "object" && null !== e ? Object.fromEntries(Object.entries(e)) : {}
            }

            function tx(e) {
                if (void 0 !== j) return j ? j(e) : e();
                var t = Symbol.for("__SENTRY_SAFE_RANDOM_ID_WRAPPER__");
                return t in eQ && "function" == typeof eQ[t] ? (j = eQ[t])(e) : (j = null, e())
            }

            function tR() {
                return tx(function() {
                    return Math.random()
                })
            }

            function tO() {
                return tx(function() {
                    return Date.now()
                })
            }

            function tV() {
                var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : eQ.crypto || eQ.msCrypto;
                try {
                    if (null == e ? void 0 : e.randomUUID) return tx(function() {
                        return e.randomUUID()
                    }).replace(/-/g, "")
                } catch (e) {}
                return M || (M = "10000000100040008000100000000000"), M.replace(/[018]/g, function(e) {
                    return (e ^ (15 & 16 * tR()) >> e / 4).toString(16)
                })
            }

            function tC(e) {
                var t, n;
                return null == (n = e.exception) || null == (t = n.values) ? void 0 : t[0]
            }

            function tZ(e) {
                var t = e.message,
                    n = e.event_id;
                if (t) return t;
                var r = tC(e);
                return r ? r.type && r.value ? "".concat(r.type, ": ").concat(r.value) : r.type || r.value || n || "<unknown>" : n || "<unknown>"
            }

            function tB(e, t, n) {
                var r = e.exception = e.exception || {},
                    a = r.values = r.values || [],
                    i = a[0] = a[0] || {};
                i.value || (i.value = t || ""), i.type || (i.type = n || "Error")
            }

            function tL(e, t) {
                var n = tC(e);
                if (n) {
                    var r = n.mechanism;
                    if (n.mechanism = eY({}, {
                            type: "generic",
                            handled: !0
                        }, r, t), t && "data" in t) {
                        var a = eY({}, null == r ? void 0 : r.data, t.data);
                        n.mechanism.data = a
                    }
                }
            }

            function tF(e) {
                if (function(e) {
                        try {
                            return e.__sentry_captured__
                        } catch (e) {}
                    }(e)) return !0;
                try {
                    tw(e, "__sentry_captured__", !0)
                } catch (e) {}
                return !1
            }

            function tP() {
                return tO() / 1e3
            }

            function tX() {
                return (null != z ? z : z = function() {
                    var e = eQ.performance;
                    if (!(null == e ? void 0 : e.now) || !e.timeOrigin) return tP;
                    var t = e.timeOrigin;
                    return function() {
                        return (t + tx(function() {
                            return e.now()
                        })) / 1e3
                    }
                }())()
            }
            var tU = null;

            function tW() {
                return null === tU && (tU = function() {
                    var e, t = eQ.performance;
                    if (null == t ? void 0 : t.now) {
                        var n = tx(function() {
                                return t.now()
                            }),
                            r = tO(),
                            a = t.timeOrigin;
                        if ("number" == typeof a && 3e5 > Math.abs(a + n - r)) return a;
                        var i = null == (e = t.timing) ? void 0 : e.navigationStart;
                        return "number" == typeof i && 3e5 > Math.abs(i + n - r) ? i : r - n
                    }
                }()), tU
            }

            function tD(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                if (t.user && (!e.ipAddress && t.user.ip_address && (e.ipAddress = t.user.ip_address), e.did || t.did || (e.did = t.user.id || t.user.email || t.user.username)), e.timestamp = t.timestamp || tX(), t.abnormal_mechanism && (e.abnormal_mechanism = t.abnormal_mechanism), t.ignoreDuration && (e.ignoreDuration = t.ignoreDuration), t.sid && (e.sid = 32 === t.sid.length ? t.sid : tV()), void 0 !== t.init && (e.init = t.init), !e.did && t.did && (e.did = "".concat(t.did)), "number" == typeof t.started && (e.started = t.started), e.ignoreDuration) e.duration = void 0;
                else if ("number" == typeof t.duration) e.duration = t.duration;
                else {
                    var n = e.timestamp - e.started;
                    e.duration = n >= 0 ? n : 0
                }
                t.release && (e.release = t.release), t.environment && (e.environment = t.environment), !e.ipAddress && t.ipAddress && (e.ipAddress = t.ipAddress), !e.userAgent && t.userAgent && (e.userAgent = t.userAgent), "number" == typeof t.errors && (e.errors = t.errors), t.status && (e.status = t.status)
            }

            function tY(e, t) {
                var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 2;
                if (!t || (void 0 === t ? "undefined" : (0, e8._)(t)) !== "object" || n <= 0) return t;
                if (e && 0 === Object.keys(t).length) return e;
                var r = eY({}, e);
                for (var a in t) Object.prototype.hasOwnProperty.call(t, a) && (r[a] = tY(r[a], t[a], n - 1));
                return r
            }

            function tG() {
                return tV().substring(16)
            }
            var tj = "_sentrySpan";

            function tM(e, t) {
                t ? tw(e, tj, t) : delete e[tj]
            }
            var tz = /\(error: (.*)\)/,
                tJ = /captureMessage|captureException/;

            function tK() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                var r = t.sort(function(e, t) {
                    return e[0] - t[0]
                }).map(function(e) {
                    return e[1]
                });
                return function(e) {
                    for (var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0, n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 0, a = [], i = e.split("\n"), o = t; o < i.length; o++) {
                        var u = i[o];
                        u.length > 1024 && (u = u.slice(0, 1024));
                        var s = tz.test(u) ? u.replace(tz, "$1") : u;
                        if (!s.includes("Error: ")) {
                            var l = !0,
                                c = !1,
                                f = void 0;
                            try {
                                for (var d, p = r[Symbol.iterator](); !(l = (d = p.next()).done); l = !0) {
                                    var v = (0, d.value)(s);
                                    if (v) {
                                        a.push(v);
                                        break
                                    }
                                }
                            } catch (e) {
                                c = !0, f = e
                            } finally {
                                try {
                                    l || null == p.return || p.return()
                                } finally {
                                    if (c) throw f
                                }
                            }
                            if (a.length >= 50 + n) break
                        }
                    }
                    var m = a.slice(n);
                    if (!m.length) return [];
                    var h = Array.from(m);
                    return /sentryWrapped/.test(tH(h).function || "") && h.pop(), h.reverse(), tJ.test(tH(h).function || "") && (h.pop(), tJ.test(tH(h).function || "") && h.pop()), h.slice(0, 50).map(function(e) {
                        return eG(eY({}, e), {
                            filename: e.filename || tH(h).filename,
                            function: e.function || "?"
                        })
                    })
                }
            }

            function tH(e) {
                return e[e.length - 1] || {}
            }
            var tQ = "<anonymous>";

            function tq(e) {
                try {
                    if (!e || "function" != typeof e) return tQ;
                    return e.name || tQ
                } catch (e) {
                    return tQ
                }
            }

            function t$(e) {
                var t = e.exception;
                if (t) {
                    var n = [];
                    try {
                        return t.values.forEach(function(e) {
                            e.stacktrace.frames && n.push.apply(n, e9(e.stacktrace.frames))
                        }), n
                    } catch (e) {}
                }
            }

            function t0(e) {
                return "__v_isVNode" in e && e.__v_isVNode ? "[VueVNode]" : "[VueViewModel]"
            }

            function t1(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
                return "string" != typeof e || 0 === t || e.length <= t ? e : "".concat(e.slice(0, t), "...")
            }

            function t2(e, t) {
                if (!Array.isArray(e)) return "";
                for (var n = [], r = 0; r < e.length; r++) {
                    var a = e[r];
                    try {
                        tc(a) ? n.push(t0(a)) : n.push(String(a))
                    } catch (e) {
                        n.push("[value cannot be serialized]")
                    }
                }
                return n.join(t)
            }

            function t3(e, t) {
                var n = arguments.length > 2 && void 0 !== arguments[2] && arguments[2];
                return !!tr(e) && (te(t, "RegExp") ? t.test(e) : tr(t) ? n ? e === t : e.includes(t) : "function" == typeof t && t(e))
            }

            function t5(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                    n = arguments.length > 2 && void 0 !== arguments[2] && arguments[2];
                return t.some(function(t) {
                    return t3(e, t, n)
                })
            }
            var t9 = function() {
                    function e() {
                        e1(this, e), this._notifyingListeners = !1, this._scopeListeners = [], this._eventProcessors = [], this._breadcrumbs = [], this._attachments = [], this._user = {}, this._tags = {}, this._attributes = {}, this._extra = {}, this._contexts = {}, this._sdkProcessingMetadata = {}, this._propagationContext = {
                            traceId: tV(),
                            sampleRand: tR()
                        }
                    }
                    return e3(e, [{
                        key: "clone",
                        value: function() {
                            var t = new e;
                            return t._breadcrumbs = e9(this._breadcrumbs), t._tags = eY({}, this._tags), t._attributes = eY({}, this._attributes), t._extra = eY({}, this._extra), t._contexts = eY({}, this._contexts), this._contexts.flags && (t._contexts.flags = {
                                values: e9(this._contexts.flags.values)
                            }), t._user = this._user, t._level = this._level, t._session = this._session, t._transactionName = this._transactionName, t._fingerprint = this._fingerprint, t._eventProcessors = e9(this._eventProcessors), t._attachments = e9(this._attachments), t._sdkProcessingMetadata = eY({}, this._sdkProcessingMetadata), t._propagationContext = eY({}, this._propagationContext), t._client = this._client, t._lastEventId = this._lastEventId, t._conversationId = this._conversationId, tM(t, this[tj]), t
                        }
                    }, {
                        key: "setClient",
                        value: function(e) {
                            this._client = e
                        }
                    }, {
                        key: "setLastEventId",
                        value: function(e) {
                            this._lastEventId = e
                        }
                    }, {
                        key: "getClient",
                        value: function() {
                            return this._client
                        }
                    }, {
                        key: "lastEventId",
                        value: function() {
                            return this._lastEventId
                        }
                    }, {
                        key: "addScopeListener",
                        value: function(e) {
                            this._scopeListeners.push(e)
                        }
                    }, {
                        key: "addEventProcessor",
                        value: function(e) {
                            return this._eventProcessors.push(e), this
                        }
                    }, {
                        key: "setUser",
                        value: function(e) {
                            return this._user = e || {
                                email: void 0,
                                id: void 0,
                                ip_address: void 0,
                                username: void 0
                            }, this._session && tD(this._session, {
                                user: e
                            }), this._notifyScopeListeners(), this
                        }
                    }, {
                        key: "getUser",
                        value: function() {
                            return this._user
                        }
                    }, {
                        key: "setConversationId",
                        value: function(e) {
                            return this._conversationId = e || void 0, this._notifyScopeListeners(), this
                        }
                    }, {
                        key: "setTags",
                        value: function(e) {
                            return this._tags = eY({}, this._tags, e), this._notifyScopeListeners(), this
                        }
                    }, {
                        key: "setTag",
                        value: function(e, t) {
                            return this.setTags(eD({}, e, t))
                        }
                    }, {
                        key: "setAttributes",
                        value: function(e) {
                            return this._attributes = eY({}, this._attributes, e), this._notifyScopeListeners(), this
                        }
                    }, {
                        key: "setAttribute",
                        value: function(e, t) {
                            return this.setAttributes(eD({}, e, t))
                        }
                    }, {
                        key: "removeAttribute",
                        value: function(e) {
                            return e in this._attributes && (delete this._attributes[e], this._notifyScopeListeners()), this
                        }
                    }, {
                        key: "setExtras",
                        value: function(e) {
                            return this._extra = eY({}, this._extra, e), this._notifyScopeListeners(), this
                        }
                    }, {
                        key: "setExtra",
                        value: function(e, t) {
                            return this._extra = eG(eY({}, this._extra), eD({}, e, t)), this._notifyScopeListeners(), this
                        }
                    }, {
                        key: "setFingerprint",
                        value: function(e) {
                            return this._fingerprint = e, this._notifyScopeListeners(), this
                        }
                    }, {
                        key: "setLevel",
                        value: function(e) {
                            return this._level = e, this._notifyScopeListeners(), this
                        }
                    }, {
                        key: "setTransactionName",
                        value: function(e) {
                            return this._transactionName = e, this._notifyScopeListeners(), this
                        }
                    }, {
                        key: "setContext",
                        value: function(e, t) {
                            return null === t ? delete this._contexts[e] : this._contexts[e] = t, this._notifyScopeListeners(), this
                        }
                    }, {
                        key: "setSession",
                        value: function(e) {
                            return e ? this._session = e : delete this._session, this._notifyScopeListeners(), this
                        }
                    }, {
                        key: "getSession",
                        value: function() {
                            return this._session
                        }
                    }, {
                        key: "update",
                        value: function(t) {
                            if (!t) return this;
                            var n = "function" == typeof t ? t(this) : t,
                                r = ((0, eW._)(n, e) ? n.getScopeData() : to(n) ? t : void 0) || {},
                                a = r.tags,
                                i = r.attributes,
                                o = r.extra,
                                u = r.user,
                                s = r.contexts,
                                l = r.level,
                                c = r.fingerprint,
                                f = void 0 === c ? [] : c,
                                d = r.propagationContext,
                                p = r.conversationId;
                            return this._tags = eY({}, this._tags, a), this._attributes = eY({}, this._attributes, i), this._extra = eY({}, this._extra, o), this._contexts = eY({}, this._contexts, s), u && Object.keys(u).length && (this._user = u), l && (this._level = l), f.length && (this._fingerprint = f), d && (this._propagationContext = d), p && (this._conversationId = p), this
                        }
                    }, {
                        key: "clear",
                        value: function() {
                            return this._breadcrumbs = [], this._tags = {}, this._attributes = {}, this._extra = {}, this._user = {}, this._contexts = {}, this._level = void 0, this._transactionName = void 0, this._fingerprint = void 0, this._session = void 0, this._conversationId = void 0, tM(this, void 0), this._attachments = [], this.setPropagationContext({
                                traceId: tV(),
                                sampleRand: tR()
                            }), this._notifyScopeListeners(), this
                        }
                    }, {
                        key: "addBreadcrumb",
                        value: function(e, t) {
                            var n, r = "number" == typeof t ? t : 100;
                            if (r <= 0) return this;
                            var a = eG(eY({
                                timestamp: tP()
                            }, e), {
                                message: e.message ? t1(e.message, 2048) : e.message
                            });
                            return this._breadcrumbs.push(a), this._breadcrumbs.length > r && (this._breadcrumbs = this._breadcrumbs.slice(-r), null == (n = this._client) || n.recordDroppedEvent("buffer_overflow", "log_item")), this._notifyScopeListeners(), this
                        }
                    }, {
                        key: "getLastBreadcrumb",
                        value: function() {
                            return this._breadcrumbs[this._breadcrumbs.length - 1]
                        }
                    }, {
                        key: "clearBreadcrumbs",
                        value: function() {
                            return this._breadcrumbs = [], this._notifyScopeListeners(), this
                        }
                    }, {
                        key: "addAttachment",
                        value: function(e) {
                            return this._attachments.push(e), this
                        }
                    }, {
                        key: "clearAttachments",
                        value: function() {
                            return this._attachments = [], this
                        }
                    }, {
                        key: "getScopeData",
                        value: function() {
                            return {
                                breadcrumbs: this._breadcrumbs,
                                attachments: this._attachments,
                                contexts: this._contexts,
                                tags: this._tags,
                                attributes: this._attributes,
                                extra: this._extra,
                                user: this._user,
                                level: this._level,
                                fingerprint: this._fingerprint || [],
                                eventProcessors: this._eventProcessors,
                                propagationContext: this._propagationContext,
                                sdkProcessingMetadata: this._sdkProcessingMetadata,
                                transactionName: this._transactionName,
                                span: this[tj],
                                conversationId: this._conversationId
                            }
                        }
                    }, {
                        key: "setSDKProcessingMetadata",
                        value: function(e) {
                            return this._sdkProcessingMetadata = tY(this._sdkProcessingMetadata, e, 2), this
                        }
                    }, {
                        key: "setPropagationContext",
                        value: function(e) {
                            return this._propagationContext = e, this
                        }
                    }, {
                        key: "getPropagationContext",
                        value: function() {
                            return this._propagationContext
                        }
                    }, {
                        key: "captureException",
                        value: function(e, t) {
                            var n = (null == t ? void 0 : t.event_id) || tV();
                            if (!this._client) return e4 && tE.warn("No client configured on scope - will not capture exception!"), n;
                            var r = Error("Sentry syntheticException");
                            return this._client.captureException(e, eG(eY({
                                originalException: e,
                                syntheticException: r
                            }, t), {
                                event_id: n
                            }), this), n
                        }
                    }, {
                        key: "captureMessage",
                        value: function(e, t, n) {
                            var r, a = (null == n ? void 0 : n.event_id) || tV();
                            if (!this._client) return e4 && tE.warn("No client configured on scope - will not capture message!"), a;
                            var i = null != (r = null == n ? void 0 : n.syntheticException) ? r : Error(e);
                            return this._client.captureMessage(e, t, eG(eY({
                                originalException: e,
                                syntheticException: i
                            }, n), {
                                event_id: a
                            }), this), a
                        }
                    }, {
                        key: "captureEvent",
                        value: function(e, t) {
                            var n = e.event_id || (null == t ? void 0 : t.event_id) || tV();
                            return this._client ? this._client.captureEvent(e, eG(eY({}, t), {
                                event_id: n
                            }), this) : e4 && tE.warn("No client configured on scope - will not capture event!"), n
                        }
                    }, {
                        key: "_notifyScopeListeners",
                        value: function() {
                            var e = this;
                            this._notifyingListeners || (this._notifyingListeners = !0, this._scopeListeners.forEach(function(t) {
                                t(e)
                            }), this._notifyingListeners = !1)
                        }
                    }]), e
                }(),
                t4 = function(e) {
                    return (0, eW._)(e, Promise) && !e[t8]
                },
                t8 = Symbol("chained PromiseLike"),
                t6 = function(e, t, n) {
                    var r = e.then(function(e) {
                        return t(e), e
                    }, function(e) {
                        throw n(e), e
                    });
                    return t4(r) && t4(e) ? r : t7(e, r)
                },
                t7 = function(e, t) {
                    var n = !1;
                    for (var r in e) ! function(r) {
                        if (!(r in t)) {
                            n = !0;
                            var a = e[r];
                            "function" == typeof a ? Object.defineProperty(t, r, {
                                value: function() {
                                    for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                    return a.apply(e, n)
                                },
                                enumerable: !0,
                                configurable: !0,
                                writable: !0
                            }) : t[r] = a
                        }
                    }(r);
                    return n && Object.assign(t, eD({}, t8, !0)), t
                },
                ne = function() {
                    function e(t, n) {
                        var r, a;
                        e1(this, e), r = t || new t9, a = n || new t9, this._stack = [{
                            scope: r
                        }], this._isolationScope = a
                    }
                    return e3(e, [{
                        key: "withScope",
                        value: function(e) {
                            var t, n = this,
                                r = this._pushScope();
                            try {
                                t = e(r)
                            } catch (e) {
                                throw this._popScope(), e
                            }
                            return ts(t) ? t6(t, function() {
                                return n._popScope()
                            }, function() {
                                return n._popScope()
                            }) : (this._popScope(), t)
                        }
                    }, {
                        key: "getClient",
                        value: function() {
                            return this.getStackTop().client
                        }
                    }, {
                        key: "getScope",
                        value: function() {
                            return this.getStackTop().scope
                        }
                    }, {
                        key: "getIsolationScope",
                        value: function() {
                            return this._isolationScope
                        }
                    }, {
                        key: "getStackTop",
                        value: function() {
                            return this._stack[this._stack.length - 1]
                        }
                    }, {
                        key: "_pushScope",
                        value: function() {
                            var e = this.getScope().clone();
                            return this._stack.push({
                                client: this.getClient(),
                                scope: e
                            }), e
                        }
                    }, {
                        key: "_popScope",
                        value: function() {
                            return !(this._stack.length <= 1) && !!this._stack.pop()
                        }
                    }]), e
                }();

            function nt() {
                var e = e$(eq());
                return e.stack = e.stack || new ne(e0("defaultCurrentScope", function() {
                    return new t9
                }), e0("defaultIsolationScope", function() {
                    return new t9
                }))
            }

            function nn(e) {
                return nt().withScope(e)
            }

            function nr(e, t) {
                var n = nt();
                return n.withScope(function() {
                    return n.getStackTop().scope = e, t(e)
                })
            }

            function na(e) {
                return nt().withScope(function() {
                    return e(nt().getIsolationScope())
                })
            }

            function ni(e) {
                var t = e$(e);
                return t.acs ? t.acs : {
                    withIsolationScope: na,
                    withScope: nn,
                    withSetScope: nr,
                    withSetIsolationScope: function(e, t) {
                        return na(t)
                    },
                    getCurrentScope: function() {
                        return nt().getScope()
                    },
                    getIsolationScope: function() {
                        return nt().getIsolationScope()
                    }
                }
            }

            function no() {
                return ni(eq()).getCurrentScope()
            }

            function nu() {
                return ni(eq()).getIsolationScope()
            }

            function ns() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                var r = ni(eq());
                if (2 === t.length) {
                    var a = eK(t, 2),
                        i = a[0],
                        o = a[1];
                    return i ? r.withSetScope(i, o) : r.withScope(o)
                }
                return r.withScope(t[0])
            }

            function nl() {
                return no().getClient()
            }
            var nc = "sentry.source",
                nf = "sentry.sample_rate",
                nd = "sentry.previous_trace_sample_rate",
                np = "sentry.op",
                nv = "sentry.origin",
                nm = "sentry.idle_span_finish_reason",
                nh = "sentry.measurement_unit",
                ng = "sentry.measurement_value",
                ny = "sentry.custom_span_name",
                nb = "sentry.profile_id",
                n_ = "sentry.exclusive_time";

            function nE(e) {
                if ("boolean" == typeof __SENTRY_TRACING__ && !__SENTRY_TRACING__) return !1;
                var t, n = e || (null == (t = nl()) ? void 0 : t.getOptions());
                return !!n && (null != n.tracesSampleRate || !!n.tracesSampler)
            }

            function nS(e) {
                tE.log("Ignoring span ".concat(e.op, " - ").concat(e.description, " because it matches `ignoreSpans`."))
            }

            function nw(e, t) {
                if (!(null == t ? void 0 : t.length) || !e.description) return !1;
                var n = !0,
                    r = !1,
                    a = void 0;
                try {
                    for (var i, o = t[Symbol.iterator](); !(n = (i = o.next()).done); n = !0) {
                        var u, s = i.value;
                        if (u = s, "string" == typeof u || (0, eW._)(u, RegExp)) {
                            if (t3(e.description, s)) return e4 && nS(e), !0;
                            continue
                        }
                        if (s.name || s.op) {
                            var l = !s.name || t3(e.description, s.name),
                                c = !s.op || e.op && t3(e.op, s.op);
                            if (l && c) return e4 && nS(e), !0
                        }
                    }
                } catch (e) {
                    r = !0, a = e
                } finally {
                    try {
                        n || null == o.return || o.return()
                    } finally {
                        if (r) throw a
                    }
                }
                return !1
            }

            function nT(e) {
                return "stream" === e.getOptions().traceLifecycle
            }

            function nI(e) {
                if ("boolean" == typeof e) return Number(e);
                var t = "string" == typeof e ? parseFloat(e) : e;
                if (!("number" != typeof t || isNaN(t)) && !(t < 0) && !(t > 1)) return t
            }

            function nN(e, t) {
                e.setAttribute("http.response.status_code", t);
                var n = function(e) {
                    if (e < 400 && e >= 100) return {
                        code: 1
                    };
                    if (e >= 400 && e < 500) switch (e) {
                        case 401:
                            return {
                                code: 2, message: "unauthenticated"
                            };
                        case 403:
                            return {
                                code: 2, message: "permission_denied"
                            };
                        case 404:
                            return {
                                code: 2, message: "not_found"
                            };
                        case 409:
                            return {
                                code: 2, message: "already_exists"
                            };
                        case 413:
                            return {
                                code: 2, message: "failed_precondition"
                            };
                        case 429:
                            return {
                                code: 2, message: "resource_exhausted"
                            };
                        case 499:
                            return {
                                code: 2, message: "cancelled"
                            };
                        default:
                            return {
                                code: 2, message: "invalid_argument"
                            }
                    }
                    if (e >= 500 && e < 600) switch (e) {
                        case 501:
                            return {
                                code: 2, message: "unimplemented"
                            };
                        case 503:
                            return {
                                code: 2, message: "unavailable"
                            };
                        case 504:
                            return {
                                code: 2, message: "deadline_exceeded"
                            }
                    }
                    return {
                        code: 2,
                        message: "internal_error"
                    }
                }(t);
                "unknown_error" !== n.message && e.setStatus(n)
            }
            var nA = "_sentryScope",
                nk = "_sentryIsolationScope";

            function nx(e) {
                return {
                    scope: e[nA],
                    isolationScope: function(e) {
                        if (e) {
                            if ((void 0 === e ? "undefined" : (0, e8._)(e)) === "object" && "deref" in e && "function" == typeof e.deref) try {
                                return e.deref()
                            } catch (e) {
                                return
                            }
                            return e
                        }
                    }(e[nk])
                }
            }
            var nR = "sentry-";

            function nO(e) {
                var t = function(e) {
                    if (e && (tr(e) || Array.isArray(e))) return Array.isArray(e) ? e.reduce(function(e, t) {
                        return Object.entries(nV(t)).forEach(function(t) {
                            var n = eK(t, 2),
                                r = n[0],
                                a = n[1];
                            e[r] = a
                        }), e
                    }, {}) : nV(e)
                }(e);
                if (t) {
                    var n = Object.entries(t).reduce(function(e, t) {
                        var n = eK(t, 2),
                            r = n[0],
                            a = n[1];
                        return r.startsWith(nR) && (e[r.slice(nR.length)] = a), e
                    }, {});
                    return Object.keys(n).length > 0 ? n : void 0
                }
            }

            function nV(e) {
                return e.split(",").map(function(e) {
                    var t = e.indexOf("=");
                    return -1 === t ? [] : [e.slice(0, t), e.slice(t + 1)].map(function(e) {
                        try {
                            return decodeURIComponent(e.trim())
                        } catch (e) {
                            return
                        }
                    })
                }).reduce(function(e, t) {
                    var n = eK(t, 2),
                        r = n[0],
                        a = n[1];
                    return r && a && (e[r] = a), e
                }, {})
            }
            var nC = RegExp("^[ \\t]*([0-9a-f]{32})?-?([0-9a-f]{16})?-?([01])?[ \\t]*$");

            function nZ() {
                var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : tV(),
                    t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : tG(),
                    n = arguments.length > 2 ? arguments[2] : void 0,
                    r = "";
                return void 0 !== n && (r = n ? "-1" : "-0"), "".concat(e, "-").concat(t).concat(r)
            }

            function nB() {
                var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : tV(),
                    t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : tG(),
                    n = arguments.length > 2 ? arguments[2] : void 0;
                return "00-".concat(e, "-").concat(t, "-").concat(n ? "01" : "00")
            }
            var nL = !1;

            function nF(e) {
                return e && e.length > 0 ? e.map(function(e) {
                    var t = e.context,
                        n = t.spanId,
                        r = t.traceId,
                        a = t.traceFlags,
                        i = function(e, t) {
                            if (null == e) return {};
                            var n, r, a, i = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (a = 0, n = Reflect.ownKeys(Object(e)); a < n.length; a++) r = n[a], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                                return i
                            }
                            if (i = function(e, t) {
                                    if (null == e) return {};
                                    var n, r, a = {},
                                        i = Object.getOwnPropertyNames(e);
                                    for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                    return a
                                }(e, t), Object.getOwnPropertySymbols)
                                for (a = 0, n = Object.getOwnPropertySymbols(e); a < n.length; a++) r = n[a], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                            return i
                        }(t, ["spanId", "traceId", "traceFlags"]);
                    return eY({
                        span_id: n,
                        trace_id: r,
                        sampled: 1 === a,
                        attributes: e.attributes
                    }, i)
                }) : void 0
            }

            function nP(e) {
                return (null == e ? void 0 : e.length) ? e.map(function(e) {
                    var t = e.context;
                    return {
                        span_id: t.spanId,
                        trace_id: t.traceId,
                        sampled: 1 === t.traceFlags,
                        attributes: e.attributes
                    }
                }) : void 0
            }

            function nX(e) {
                return "number" == typeof e ? nU(e) : Array.isArray(e) ? e[0] + e[1] / 1e9 : (0, eW._)(e, Date) ? nU(e.getTime()) : tX()
            }

            function nU(e) {
                return e > 0x2540be3ff ? e / 1e3 : e
            }

            function nW(e) {
                if (nj(e)) return e.getSpanJSON();
                var t = e.spanContext(),
                    n = t.spanId,
                    r = t.traceId;
                if (nG(e)) {
                    var a = e.attributes,
                        i = e.startTime,
                        o = e.name,
                        u = e.endTime,
                        s = e.status,
                        l = e.links;
                    return {
                        span_id: n,
                        trace_id: r,
                        data: a,
                        description: o,
                        parent_span_id: nY(e),
                        start_timestamp: nX(i),
                        timestamp: nX(u) || void 0,
                        status: nz(s),
                        op: a[np],
                        origin: a[nv],
                        links: nF(l)
                    }
                }
                return {
                    span_id: n,
                    trace_id: r,
                    start_timestamp: 0,
                    data: {}
                }
            }

            function nD(e) {
                if (nj(e)) return e.getStreamedSpanJSON();
                var t = e.spanContext(),
                    n = t.spanId,
                    r = t.traceId;
                if (nG(e)) {
                    var a = e.attributes,
                        i = e.startTime,
                        o = e.name,
                        u = e.endTime,
                        s = e.status,
                        l = e.links;
                    return {
                        name: o,
                        span_id: n,
                        trace_id: r,
                        parent_span_id: nY(e),
                        start_timestamp: nX(i),
                        end_timestamp: nX(u),
                        is_segment: e === n0(e),
                        status: nJ(s),
                        attributes: a,
                        links: nP(l)
                    }
                }
                return {
                    span_id: n,
                    trace_id: r,
                    start_timestamp: 0,
                    name: "",
                    end_timestamp: 0,
                    status: "ok",
                    is_segment: e === n0(e)
                }
            }

            function nY(e) {
                var t;
                return "parentSpanId" in e ? e.parentSpanId : "parentSpanContext" in e ? null == (t = e.parentSpanContext) ? void 0 : t.spanId : void 0
            }

            function nG(e) {
                return !!e.attributes && !!e.startTime && !!e.name && !!e.endTime && !!e.status
            }

            function nj(e) {
                return "function" == typeof e.getSpanJSON
            }

            function nM(e) {
                return 1 === e.spanContext().traceFlags
            }

            function nz(e) {
                if (e && 0 !== e.code) return 1 === e.code ? "ok" : e.message || "internal_error"
            }

            function nJ(e) {
                return e && 1 !== e.code && 0 !== e.code && "cancelled" !== e.message ? "error" : "ok"
            }
            var nK = "_sentryChildSpans",
                nH = "_sentryRootSpan";

            function nQ(e, t) {
                var n = e[nH] || e;
                tw(t, nH, n), e[nK] ? e[nK].add(t) : tw(e, nK, new Set([t]))
            }

            function nq(e) {
                var t = new Set;
                return ! function e(n) {
                    if (!t.has(n) && nM(n)) {
                        t.add(n);
                        var r = n[nK] ? Array.from(n[nK]) : [],
                            a = !0,
                            i = !1,
                            o = void 0;
                        try {
                            for (var u, s = r[Symbol.iterator](); !(a = (u = s.next()).done); a = !0) {
                                var l = u.value;
                                e(l)
                            }
                        } catch (e) {
                            i = !0, o = e
                        } finally {
                            try {
                                a || null == s.return || s.return()
                            } finally {
                                if (i) throw o
                            }
                        }
                    }
                }(e), Array.from(t)
            }
            var n$ = n0;

            function n0(e) {
                return e[nH] || e
            }

            function n1() {
                var e = ni(eq());
                return e.getActiveSpan ? e.getActiveSpan() : no()[tj]
            }

            function n2() {
                nL || (tg(function() {
                    console.warn("[Sentry] Returning null from `beforeSendSpan` is disallowed. To drop certain spans, configure the respective integrations directly or use `ignoreSpans`.")
                }), nL = !0)
            }
            var n3 = "production",
                n5 = /^o(\d+)\./,
                n9 = /^(?:(\w+):)\/\/(?:(\w+)(?::(\w+)?)?@)((?:\[[:.%\w]+\]|[\w.-]+))(?::(\d+))?\/(.+)/;

            function n4(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                    n = e.host,
                    r = e.path,
                    a = e.pass,
                    i = e.port,
                    o = e.projectId,
                    u = e.protocol,
                    s = e.publicKey;
                return "".concat(u, "://").concat(s).concat(t && a ? ":".concat(a) : "") + "@".concat(n).concat(i ? ":".concat(i) : "", "/").concat(r ? "".concat(r, "/") : r).concat(o)
            }

            function n8(e) {
                var t = n9.exec(e);
                if (!t) return void tg(function() {
                    console.error("Invalid Sentry Dsn: ".concat(e))
                });
                var n = eK(t.slice(1), 6),
                    r = n[0],
                    a = n[1],
                    i = n[2],
                    o = n[3],
                    u = n[4],
                    s = n[5],
                    l = "",
                    c = void 0 === s ? "" : s,
                    f = c.split("/");
                if (f.length > 1 && (l = f.slice(0, -1).join("/"), c = f.pop()), c) {
                    var d = c.match(/^\d+/);
                    d && (c = d[0])
                }
                return n6({
                    host: void 0 === o ? "" : o,
                    pass: void 0 === i ? "" : i,
                    path: l,
                    projectId: c,
                    port: void 0 === u ? "" : u,
                    protocol: r,
                    publicKey: a
                })
            }

            function n6(e) {
                return {
                    protocol: e.protocol,
                    publicKey: e.publicKey || "",
                    pass: e.pass || "",
                    host: e.host,
                    port: e.port || "",
                    path: e.path || "",
                    projectId: e.projectId
                }
            }
            var n7 = "_frozenDsc";

            function re(e, t) {
                var n, r, a, i, o, u = t.getOptions(),
                    s = (t.getDsn() || {}).publicKey,
                    l = {
                        environment: u.environment || n3,
                        release: u.release,
                        public_key: s,
                        trace_id: e,
                        org_id: (i = (n = t).getOptions(), o = (n.getDsn() || {}).host, i.orgId ? a = String(i.orgId) : o && (a = null == (r = o.match(n5)) ? void 0 : r[1]), a)
                    };
                return t.emit("createDsc", l), l
            }

            function rt(e, t) {
                var n = t.getPropagationContext();
                return n.dsc || re(n.traceId, e)
            }

            function rn(e) {
                var t, n, r, a, i, o = nl();
                if (!o) return {};
                var u = n$(e),
                    s = nW(u),
                    l = s.data,
                    c = u.spanContext().traceState,
                    f = null != (t = null != (n = null == c ? void 0 : c.get("sentry.sample_rate")) ? n : l[nf]) ? t : l[nd];

                function d(e) {
                    return ("number" == typeof f || "string" == typeof f) && (e.sample_rate = "".concat(f)), e
                }
                var p = u[n7];
                if (p) return d(p);
                var v = null == c ? void 0 : c.get("sentry.dsc"),
                    m = v && nO(v);
                if (m) return d(m);
                var h = re(e.spanContext().traceId, o),
                    g = null != (r = l[nc]) ? r : l["sentry.span.source"],
                    y = s.description;
                return "url" !== g && y && (h.transaction = y), nE() && (h.sampled = String(nM(u)), h.sample_rand = null != (a = null == c ? void 0 : c.get("sentry.sample_rand")) ? a : null == (i = nx(u).scope) ? void 0 : i.getPropagationContext().sampleRand.toString()), d(h), o.emit("createDsc", h, u), h
            }
            var rr = function() {
                function e() {
                    var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                    e1(this, e), this._traceId = t.traceId || tV(), this._spanId = t.spanId || tG(), this.dropReason = t.dropReason
                }
                return e3(e, [{
                    key: "spanContext",
                    value: function() {
                        return {
                            spanId: this._spanId,
                            traceId: this._traceId,
                            traceFlags: 0
                        }
                    }
                }, {
                    key: "end",
                    value: function(e) {}
                }, {
                    key: "setAttribute",
                    value: function(e, t) {
                        return this
                    }
                }, {
                    key: "setAttributes",
                    value: function(e) {
                        return this
                    }
                }, {
                    key: "setStatus",
                    value: function(e) {
                        return this
                    }
                }, {
                    key: "updateName",
                    value: function(e) {
                        return this
                    }
                }, {
                    key: "isRecording",
                    value: function() {
                        return !1
                    }
                }, {
                    key: "addEvent",
                    value: function(e, t, n) {
                        return this
                    }
                }, {
                    key: "addLink",
                    value: function(e) {
                        return this
                    }
                }, {
                    key: "addLinks",
                    value: function(e) {
                        return this
                    }
                }, {
                    key: "recordException",
                    value: function(e, t) {}
                }]), e
            }();

            function ra(e) {
                return !!e && "function" == typeof e && "_streamed" in e && !!e._streamed
            }

            function ri(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 100,
                    r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : Infinity;
                try {
                    return function e(t, r) {
                        var a, i = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : Infinity,
                            o = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : Infinity,
                            u = arguments.length > 4 && void 0 !== arguments[4] ? arguments[4] : (a = new WeakSet, [function(e) {
                                return !!a.has(e) || (a.add(e), !1)
                            }, function(e) {
                                a.delete(e)
                            }]),
                            s = eK(u, 2),
                            l = s[0],
                            c = s[1];
                        if (null == r || ["boolean", "string"].includes(void 0 === r ? "undefined" : (0, e8._)(r)) || "number" == typeof r && Number.isFinite(r)) return r;
                        var f = function(e, t) {
                            try {
                                if ("domain" === e && t && (void 0 === t ? "undefined" : (0, e8._)(t)) === "object" && t._events) return "[Domain]";
                                if ("domainEmitter" === e) return "[DomainEmitter]";
                                if (void 0 !== n.g && t === n.g) return "[Global]";
                                if ("u" > typeof window && t === window) return "[Window]";
                                if ("u" > typeof document && t === document) return "[Document]";
                                if (tc(t)) return t0(t);
                                if (to(t) && "nativeEvent" in t && "preventDefault" in t && "stopPropagation" in t) return "[SyntheticEvent]";
                                if ("number" == typeof t && !Number.isFinite(t)) return "[".concat(t, "]");
                                if ("function" == typeof t) return "[Function: ".concat(tq(t), "]");
                                if ((void 0 === t ? "undefined" : (0, e8._)(t)) === "symbol") return "[".concat(String(t), "]");
                                if ((void 0 === t ? "undefined" : (0, e8._)(t)) === "bigint") return "[BigInt: ".concat(String(t), "]");
                                var r, a, i = (r = t, a = Object.getPrototypeOf(r), (null == a ? void 0 : a.constructor) ? a.constructor.name : "null prototype");
                                if (/^HTML(\w*)Element$/.test(i)) return "[HTMLElement: ".concat(i, "]");
                                return "[object ".concat(i, "]")
                            } catch (e) {
                                return "**non-serializable** (".concat(e, ")")
                            }
                        }(t, r);
                        if (!f.startsWith("[object ")) return f;
                        if (r.__sentry_skip_normalization__) return r;
                        var d = "number" == typeof r.__sentry_override_normalization_depth__ ? r.__sentry_override_normalization_depth__ : i;
                        if (0 === d) return f.replace("object ", "");
                        if (l(r)) return "[Circular ~]";
                        if (r && "function" == typeof r.toJSON) try {
                            var p = r.toJSON();
                            return e("", p, d - 1, o, u)
                        } catch (e) {}
                        var v = Array.isArray(r) ? [] : {},
                            m = 0,
                            h = tN(r);
                        for (var g in h)
                            if (Object.prototype.hasOwnProperty.call(h, g)) {
                                if (m >= o) {
                                    v[g] = "[MaxProperties ~]";
                                    break
                                }
                                var y = h[g];
                                v[g] = e(g, y, d - 1, o, u), m++
                            } return c(r), v
                    }("", e, t, r)
                } catch (e) {
                    return {
                        ERROR: "**non-serializable** (".concat(e, ")")
                    }
                }
            }

            function ro(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [];
                return [e, t]
            }

            function ru(e, t) {
                var n = e[1],
                    r = !0,
                    a = !1,
                    i = void 0;
                try {
                    for (var o, u = n[Symbol.iterator](); !(r = (o = u.next()).done); r = !0) {
                        var s = o.value,
                            l = s[0].type;
                        if (t(s, l)) return !0
                    }
                } catch (e) {
                    a = !0, i = e
                } finally {
                    try {
                        r || null == u.return || u.return()
                    } finally {
                        if (a) throw i
                    }
                }
                return !1
            }

            function rs(e, t) {
                return ru(e, function(e, n) {
                    return t.includes(n)
                })
            }

            function rl(e) {
                var t = e$(eQ);
                return t.encodePolyfill ? t.encodePolyfill(e) : new TextEncoder().encode(e)
            }

            function rc(e) {
                var t = eK(e, 2),
                    n = t[0],
                    r = t[1],
                    a = JSON.stringify(n);

                function i(e) {
                    "string" == typeof a ? a = "string" == typeof e ? a + e : [rl(a), e] : a.push("string" == typeof e ? rl(e) : e)
                }
                var o = !0,
                    u = !1,
                    s = void 0;
                try {
                    for (var l, c = r[Symbol.iterator](); !(o = (l = c.next()).done); o = !0) {
                        var f = l.value,
                            d = eK(f, 2),
                            p = d[0],
                            v = d[1];
                        if (i("\n".concat(JSON.stringify(p), "\n")), "string" == typeof v || (0, eW._)(v, Uint8Array)) i(v);
                        else {
                            var m = void 0;
                            try {
                                m = JSON.stringify(v)
                            } catch (e) {
                                m = JSON.stringify(ri(v))
                            }
                            i(m)
                        }
                    }
                } catch (e) {
                    u = !0, s = e
                } finally {
                    try {
                        o || null == c.return || c.return()
                    } finally {
                        if (u) throw s
                    }
                }
                return "string" == typeof a ? a : function(e) {
                    var t = new Uint8Array(e.reduce(function(e, t) {
                            return e + t.length
                        }, 0)),
                        n = 0,
                        r = !0,
                        a = !1,
                        i = void 0;
                    try {
                        for (var o, u = e[Symbol.iterator](); !(r = (o = u.next()).done); r = !0) {
                            var s = o.value;
                            t.set(s, n), n += s.length
                        }
                    } catch (e) {
                        a = !0, i = e
                    } finally {
                        try {
                            r || null == u.return || u.return()
                        } finally {
                            if (a) throw i
                        }
                    }
                    return t
                }(a)
            }
            var rf = {
                sessions: "session",
                event: "error",
                client_report: "internal",
                user_report: "default",
                profile_chunk: "profile",
                replay_event: "replay",
                replay_recording: "replay",
                check_in: "monitor",
                raw_security: "security",
                log: "log_item",
                trace_metric: "metric"
            };

            function rd(e) {
                return e in rf ? rf[e] : e
            }

            function rp(e) {
                if (null == e ? void 0 : e.sdk) {
                    var t = e.sdk;
                    return {
                        name: t.name,
                        version: t.version
                    }
                }
            }

            function rv(e) {
                if (e && 0 !== e.length) {
                    var t = {};
                    return e.forEach(function(e) {
                        var n = e.attributes || {},
                            r = n[nh],
                            a = n[ng];
                        "string" == typeof r && "number" == typeof a && (t[e.name] = {
                            value: a,
                            unit: r
                        })
                    }), t
                }
            }
            var rm = function() {
                function e() {
                    var t, n = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                    e1(this, e), this._traceId = n.traceId || tV(), this._spanId = n.spanId || tG(), this._startTime = n.startTimestamp || tX(), this._links = n.links, this._attributes = {}, this.setAttributes(eY((eD(t = {}, nv, "manual"), eD(t, np, n.op), t), n.attributes)), this._name = n.name, n.parentSpanId && (this._parentSpanId = n.parentSpanId), "sampled" in n && (this._sampled = n.sampled), n.endTimestamp && (this._endTime = n.endTimestamp), this._events = [], this._isStandaloneSpan = n.isStandalone, this._endTime && this._onSpanEnded()
                }
                return e3(e, [{
                    key: "addLink",
                    value: function(e) {
                        return this._links ? this._links.push(e) : this._links = [e], this
                    }
                }, {
                    key: "addLinks",
                    value: function(e) {
                        if (this._links) {
                            var t;
                            (t = this._links).push.apply(t, e9(e))
                        } else this._links = e;
                        return this
                    }
                }, {
                    key: "recordException",
                    value: function(e, t) {}
                }, {
                    key: "spanContext",
                    value: function() {
                        return {
                            spanId: this._spanId,
                            traceId: this._traceId,
                            traceFlags: +!!this._sampled
                        }
                    }
                }, {
                    key: "setAttribute",
                    value: function(e, t) {
                        return void 0 === t ? delete this._attributes[e] : this._attributes[e] = t, this
                    }
                }, {
                    key: "setAttributes",
                    value: function(e) {
                        var t = this;
                        return Object.keys(e).forEach(function(n) {
                            return t.setAttribute(n, e[n])
                        }), this
                    }
                }, {
                    key: "updateStartTime",
                    value: function(e) {
                        this._startTime = nX(e)
                    }
                }, {
                    key: "setStatus",
                    value: function(e) {
                        return this._status = e, this
                    }
                }, {
                    key: "updateName",
                    value: function(e) {
                        return this._name = e, this.setAttribute(nc, "custom"), this
                    }
                }, {
                    key: "end",
                    value: function(e) {
                        this._endTime || (this._endTime = nX(e), function(e) {
                            if (e4) {
                                var t = nW(e),
                                    n = t.description,
                                    r = t.op,
                                    a = e.spanContext().spanId,
                                    i = n$(e) === e,
                                    o = '[Tracing] Finishing "'.concat(void 0 === r ? "< unknown op >" : r, '" ').concat(i ? "root " : "", 'span "').concat(void 0 === n ? "< unknown name >" : n, '" with ID ').concat(a);
                                tE.log(o)
                            }
                        }(this), this._onSpanEnded())
                    }
                }, {
                    key: "getSpanJSON",
                    value: function() {
                        return {
                            data: this._attributes,
                            description: this._name,
                            op: this._attributes[np],
                            parent_span_id: this._parentSpanId,
                            span_id: this._spanId,
                            start_timestamp: this._startTime,
                            status: nz(this._status),
                            timestamp: this._endTime,
                            trace_id: this._traceId,
                            origin: this._attributes[nv],
                            profile_id: this._attributes[nb],
                            exclusive_time: this._attributes[n_],
                            measurements: rv(this._events),
                            is_segment: this._isStandaloneSpan && n$(this) === this || void 0,
                            segment_id: this._isStandaloneSpan ? n$(this).spanContext().spanId : void 0,
                            links: nF(this._links)
                        }
                    }
                }, {
                    key: "getStreamedSpanJSON",
                    value: function() {
                        var e, t;
                        return {
                            name: null != (e = this._name) ? e : "",
                            span_id: this._spanId,
                            trace_id: this._traceId,
                            parent_span_id: this._parentSpanId,
                            start_timestamp: this._startTime,
                            end_timestamp: null != (t = this._endTime) ? t : this._startTime,
                            is_segment: this._isStandaloneSpan || this === n$(this),
                            status: nJ(this._status),
                            attributes: this._attributes,
                            links: nP(this._links)
                        }
                    }
                }, {
                    key: "isRecording",
                    value: function() {
                        return !this._endTime && !!this._sampled
                    }
                }, {
                    key: "addEvent",
                    value: function(e, t, n) {
                        e4 && tE.log("[Tracing] Adding an event to span:", e);
                        var r = rh(t) ? t : n || tX(),
                            a = rh(t) ? {} : t || {},
                            i = {
                                name: e,
                                time: nX(r),
                                attributes: a
                            };
                        return this._events.push(i), this
                    }
                }, {
                    key: "isStandaloneSpan",
                    value: function() {
                        return !!this._isStandaloneSpan
                    }
                }, {
                    key: "_onSpanEnded",
                    value: function() {
                        var e = nl();
                        if (e && (e.emit("spanEnd", this), this._isStandaloneSpan || e.emit("afterSpanEnd", this)), this._isStandaloneSpan || this === n$(this)) {
                            if (this._isStandaloneSpan) return void(this._sampled ? function(e) {
                                var t = nl();
                                if (t) {
                                    var n = e[1];
                                    if (!n || 0 === n.length) return t.recordDroppedEvent("before_send", "span");
                                    t.sendEnvelope(e)
                                }
                            }(function(e, t) {
                                var n = rn(e[0]),
                                    r = null == t ? void 0 : t.getDsn(),
                                    a = null == t ? void 0 : t.getOptions().tunnel,
                                    i = eY({
                                        sent_at: new Date().toISOString()
                                    }, !!n.trace_id && !!n.public_key && {
                                        trace: n
                                    }, !!a && r && {
                                        dsn: n4(r)
                                    }),
                                    o = (null == t ? void 0 : t.getOptions()) || {},
                                    u = o.beforeSendSpan,
                                    s = o.ignoreSpans,
                                    l = (null == s ? void 0 : s.length) ? e.filter(function(e) {
                                        return !nw(nW(e), s)
                                    }) : e,
                                    c = e.length - l.length;
                                c && (null == t || t.recordDroppedEvent("before_send", "span", c));
                                var f = u ? function(e) {
                                        var t = nW(e),
                                            n = ra(u) ? t : u(t);
                                        return n || (n2(), t)
                                    } : nW,
                                    d = [],
                                    p = !0,
                                    v = !1,
                                    m = void 0;
                                try {
                                    for (var h, g = l[Symbol.iterator](); !(p = (h = g.next()).done); p = !0) {
                                        var y = h.value,
                                            b = f(y);
                                        b && d.push([{
                                            type: "span"
                                        }, b])
                                    }
                                } catch (e) {
                                    v = !0, m = e
                                } finally {
                                    try {
                                        p || null == g.return || g.return()
                                    } finally {
                                        if (v) throw m
                                    }
                                }
                                return ro(i, d)
                            }([this], e)) : (e4 && tE.log("[Tracing] Discarding standalone span because its trace was not chosen to be sampled."), e && e.recordDroppedEvent("sample_rate", "span")));
                            if (e && nT(e)) return void e.emit("afterSegmentSpanEnd", this);
                            var t = this._convertSpanToTransaction();
                            t && (nx(this).scope || no()).captureEvent(t)
                        }
                    }
                }, {
                    key: "_convertSpanToTransaction",
                    value: function() {
                        var e, t = this;
                        if (rg(nW(this))) {
                            this._name || (e4 && tE.warn("Transaction has no name, falling back to `<unlabeled transaction>`."), this._name = "<unlabeled transaction>");
                            var n = nx(this),
                                r = n.scope,
                                a = n.isolationScope,
                                i = null == r || null == (e = r.getScopeData().sdkProcessingMetadata) ? void 0 : e.normalizedRequest;
                            if (!0 === this._sampled) {
                                var o, u, s, l, c, f, d = nq(this).filter(function(e) {
                                        var n;
                                        return e !== t && (n = e, !((0, eW._)(n, rm) && n.isStandaloneSpan()))
                                    }).map(function(e) {
                                        return nW(e)
                                    }).filter(rg),
                                    p = this._attributes[nc];
                                delete this._attributes[ny], d.forEach(function(e) {
                                    delete e.data[ny]
                                });
                                var v = eY({
                                        contexts: {
                                            trace: (u = (o = this.spanContext()).spanId, s = o.traceId, c = (l = nW(this)).data, f = l.op, {
                                                parent_span_id: l.parent_span_id,
                                                span_id: u,
                                                trace_id: s,
                                                data: c,
                                                op: f,
                                                status: l.status,
                                                origin: l.origin,
                                                links: l.links
                                            })
                                        },
                                        spans: d.length > 1e3 ? d.sort(function(e, t) {
                                            return e.start_timestamp - t.start_timestamp
                                        }).slice(0, 1e3) : d,
                                        start_timestamp: this._startTime,
                                        timestamp: this._endTime,
                                        transaction: this._name,
                                        type: "transaction",
                                        sdkProcessingMetadata: {
                                            capturedSpanScope: r,
                                            capturedSpanIsolationScope: a,
                                            dynamicSamplingContext: rn(this)
                                        },
                                        request: i
                                    }, p && {
                                        transaction_info: {
                                            source: p
                                        }
                                    }),
                                    m = rv(this._events);
                                return m && Object.keys(m).length && (e4 && tE.log("[Measurements] Adding measurements to transaction event", JSON.stringify(m, void 0, 2)), v.measurements = m), v
                            }
                        }
                    }
                }]), e
            }();

            function rh(e) {
                return e && "number" == typeof e || (0, eW._)(e, Date) || Array.isArray(e)
            }

            function rg(e) {
                return !!e.start_timestamp && !!e.timestamp && !!e.span_id && !!e.trace_id
            }

            function ry(e) {
                var t = ni(eq());
                if (t.startInactiveSpan) return t.startInactiveSpan(e);
                var n = rE(e),
                    r = e.forceTransaction,
                    a = e.parentSpan;
                return (e.scope ? function(t) {
                    return ns(e.scope, t)
                } : void 0 !== a ? function(e) {
                    return rb(a, e)
                } : function(e) {
                    return e()
                })(function() {
                    var t = no(),
                        i = rw(t, a),
                        o = nl();
                    return e.onlyIfParent && !i ? (null == o || o.recordDroppedEvent("no_parent_span", "span"), new rr) : r_({
                        parentSpan: i,
                        spanArguments: n,
                        forceTransaction: r,
                        scope: t
                    })
                })
            }

            function rb(e, t) {
                var n = ni(eq());
                return n.withActiveSpan ? n.withActiveSpan(e, t) : ns(function(n) {
                    return tM(n, e || void 0), t(n)
                })
            }

            function r_(e) {
                var t, n, r, a, i, o, u, s, l, c, f, d, p, v, m, h, g, y = e.parentSpan,
                    b = e.spanArguments,
                    _ = e.forceTransaction,
                    E = e.scope;
                if (!nE()) {
                    var S = new rr;
                    if (_ || !y) {
                        var w = eY({
                            sampled: "false",
                            sample_rate: "0",
                            transaction: b.name
                        }, rn(S));
                        tw(S, n7, w)
                    }
                    return S
                }
                var T = nl();
                if (t = T, n = b, a = null == t ? void 0 : t.getOptions().ignoreSpans, t && nT(t) && (null == a ? void 0 : a.length) && nw({
                        description: n.name || "",
                        op: (null == (r = n.attributes) ? void 0 : r[np]) || n.op
                    }, a)) return rT(E) || null == T || T.recordDroppedEvent("ignored", "span"), new rr({
                    dropReason: "ignored",
                    traceId: null != (h = null == y ? void 0 : y.spanContext().traceId) ? h : E.getPropagationContext().traceId
                });
                var I = nu();
                if (y && !_) {
                    i = y, o = E, u = b, l = (s = i.spanContext()).spanId, c = s.traceId, p = (d = !(f = rT(o)) && nM(i)) ? new rm(eG(eY({}, u), {
                        parentSpanId: l,
                        traceId: c,
                        sampled: d
                    })) : new rr({
                        traceId: c
                    }), nQ(i, p), (v = nl()) && (nT(v) && (0, eW._)(p, rr) && ((0, eW._)(i, rr) && i.dropReason ? (p.dropReason = i.dropReason, v.recordDroppedEvent(i.dropReason, "span")) : f || (p.dropReason = "sample_rate", v.recordDroppedEvent("sample_rate", "span"))), v.emit("spanStart", p), u.endTimestamp && (v.emit("spanEnd", p), v.emit("afterSpanEnd", p))), nQ(y, g = p)
                } else if (y) {
                    var N = rn(y),
                        A = y.spanContext(),
                        k = A.traceId,
                        x = A.spanId,
                        R = nM(y);
                    tw(g = rS(eY({
                        traceId: k,
                        parentSpanId: x
                    }, b), E, R), n7, N)
                } else {
                    var O = eY({}, I.getPropagationContext(), E.getPropagationContext()),
                        V = O.traceId,
                        C = O.dsc,
                        Z = O.parentSpanId,
                        B = O.sampled;
                    g = rS(eY({
                        traceId: V,
                        parentSpanId: Z
                    }, b), E, B), C && tw(g, n7, C)
                }
                return ! function(e) {
                    if (e4) {
                        var t = nW(e),
                            n = t.description,
                            r = t.op,
                            a = t.parent_span_id,
                            i = e.spanContext().spanId,
                            o = nM(e),
                            u = n$(e),
                            s = u === e,
                            l = "[Tracing] Starting ".concat(o ? "sampled" : "unsampled", " ").concat(s ? "root " : "", "span"),
                            c = ["op: ".concat(void 0 === r ? "< unknown op >" : r), "name: ".concat(void 0 === n ? "< unknown name >" : n), "ID: ".concat(i)];
                        if (a && c.push("parent ID: ".concat(a)), !s) {
                            var f = nW(u),
                                d = f.op,
                                p = f.description;
                            c.push("root ID: ".concat(u.spanContext().spanId)), d && c.push("root op: ".concat(d)), p && c.push("root description: ".concat(p))
                        }
                        tE.log("".concat(l, "\n  ").concat(c.join("\n  ")))
                    }
                }(g), (m = g) && (tw(m, nk, function(e) {
                    try {
                        var t = eQ.WeakRef;
                        if ("function" == typeof t) return new t(e)
                    } catch (e) {}
                    return e
                }(I)), tw(m, nA, E)), g
            }

            function rE(e) {
                var t = eY({
                    isStandalone: (e.experimental || {}).standalone
                }, e);
                if (e.startTime) {
                    var n = eY({}, t);
                    return n.startTimestamp = nX(e.startTime), delete n.startTime, n
                }
                return t
            }

            function rS(e, t, n) {
                var r, a, i, o = nl(),
                    u = (null == o ? void 0 : o.getOptions()) || {},
                    s = e.name,
                    l = void 0 === s ? "" : s,
                    c = {
                        spanAttributes: eY({}, e.attributes),
                        spanName: l,
                        parentSampled: n
                    };
                null == o || o.emit("beforeSampling", c, {
                    decision: !1
                });
                var f = null != (r = c.parentSampled) ? r : n,
                    d = c.spanAttributes,
                    p = t.getPropagationContext(),
                    v = rT(t),
                    m = eK(v ? [!1] : function(e, t, n) {
                        if (!nE(e)) return [!1];
                        var r, a = void 0;
                        "function" == typeof e.tracesSampler ? (r = e.tracesSampler(eG(eY({}, t), {
                            inheritOrSampleWith: function(e) {
                                return "number" == typeof t.parentSampleRate ? t.parentSampleRate : "boolean" == typeof t.parentSampled ? Number(t.parentSampled) : e
                            }
                        })), a = !0) : void 0 !== t.parentSampled ? r = t.parentSampled : void 0 !== e.tracesSampleRate && (r = e.tracesSampleRate, a = !0);
                        var i = nI(r);
                        if (void 0 === i) return e4 && tE.warn("[Tracing] Discarding root span because of invalid sample rate. Sample rate must be a boolean or a number between 0 and 1. Got ".concat(JSON.stringify(r), " of type ").concat(JSON.stringify(void 0 === r ? "undefined" : (0, e8._)(r)), ".")), [!1];
                        if (!i) return e4 && tE.log("[Tracing] Discarding transaction because ".concat("function" == typeof e.tracesSampler ? "tracesSampler returned 0 or false" : "a negative sampling decision was inherited or tracesSampleRate is set to 0")), [!1, i, a];
                        var o = n < i;
                        return !o && e4 && tE.log("[Tracing] Discarding transaction because it's not included in the random sample (sampling rate = ".concat(Number(r), ")")), [o, i, a]
                    }(u, {
                        name: l,
                        parentSampled: f,
                        attributes: d,
                        parentSampleRate: nI(null == (a = p.dsc) ? void 0 : a.sample_rate)
                    }, p.sampleRand), 3),
                    h = m[0],
                    g = m[1],
                    y = m[2],
                    b = new rm(eG(eY({}, e), {
                        attributes: eY((eD(i = {}, nc, "custom"), eD(i, nf, void 0 !== g && y ? g : void 0), i), d),
                        sampled: h
                    }));
                return h || !o || v || (e4 && tE.log("[Tracing] Discarding root span because its trace was not chosen to be sampled."), o.recordDroppedEvent("sample_rate", nT(o) ? "span" : "transaction")), o && o.emit("spanStart", b), b
            }

            function rw(e, t) {
                if (t) return t;
                if (null !== t) {
                    var n = e[tj];
                    if (n) {
                        var r = nl();
                        return (r ? r.getOptions() : {}).parentSpanIsAlwaysRootSpan ? n$(n) : n
                    }
                }
            }

            function rT(e) {
                return !0 === e.getScopeData().sdkProcessingMetadata.__SENTRY_SUPPRESS_TRACING__
            }

            function rI(e, t, n, r, a, i, o) {
                try {
                    var u = e[i](o),
                        s = u.value
                } catch (e) {
                    n(e);
                    return
                }
                u.done ? t(s) : Promise.resolve(s).then(r, a)
            }

            function rN(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, a) {
                        var i = e.apply(t, n);

                        function o(e) {
                            rI(i, r, a, o, u, "next", e)
                        }

                        function u(e) {
                            rI(i, r, a, o, u, "throw", e)
                        }
                        o(void 0)
                    })
                }
            }

            function rA(e, t) {
                var n, r, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    u = Object.defineProperty;
                return u(o, "next", {
                    value: s(0)
                }), u(o, "throw", {
                    value: s(1)
                }), u(o, "return", {
                    value: s(2)
                }), "function" == typeof Symbol && u(o, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), o;

                function s(u) {
                    return function(s) {
                        var l = [u, s];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; o && (o = 0, l[0] && (i = 0)), i;) try {
                            if (n = 1, r && (a = 2 & l[0] ? r.return : l[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, l[1])).done) return a;
                            switch (r = 0, a && (l = [2 & l[0], a.value]), l[0]) {
                                case 0:
                                case 1:
                                    a = l;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: l[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, r = l[1], l = [0];
                                    continue;
                                case 7:
                                    l = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === l[0] && (!a || l[1] > a[0] && l[1] < a[3])) {
                                        i.label = l[1];
                                        break
                                    }
                                    if (6 === l[0] && i.label < a[1]) {
                                        i.label = a[1], a = l;
                                        break
                                    }
                                    if (a && i.label < a[2]) {
                                        i.label = a[2], i.ops.push(l);
                                        break
                                    }
                                    a[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            l = t.call(e, i)
                        } catch (e) {
                            l = [6, e], r = 0
                        } finally {
                            n = a = 0
                        }
                        if (5 & l[0]) throw l[1];
                        return {
                            value: l[0] ? l[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function rk(e) {
                return new rR(function(t) {
                    t(e)
                })
            }

            function rx(e) {
                return new rR(function(t, n) {
                    n(e)
                })
            }
            var rR = function() {
                function e(t) {
                    e1(this, e), this._state = 0, this._handlers = [], this._runExecutor(t)
                }
                return e3(e, [{
                    key: "then",
                    value: function(t, n) {
                        var r = this;
                        return new e(function(e, a) {
                            r._handlers.push([!1, function(n) {
                                if (t) try {
                                    e(t(n))
                                } catch (e) {
                                    a(e)
                                } else e(n)
                            }, function(t) {
                                if (n) try {
                                    e(n(t))
                                } catch (e) {
                                    a(e)
                                } else a(t)
                            }]), r._executeHandlers()
                        })
                    }
                }, {
                    key: "catch",
                    value: function(e) {
                        return this.then(function(e) {
                            return e
                        }, e)
                    }
                }, {
                    key: "finally",
                    value: function(t) {
                        var n = this;
                        return new e(function(e, r) {
                            var a, i;
                            return n.then(function(e) {
                                i = !1, a = e, t && t()
                            }, function(e) {
                                i = !0, a = e, t && t()
                            }).then(function() {
                                i ? r(a) : e(a)
                            })
                        })
                    }
                }, {
                    key: "_executeHandlers",
                    value: function() {
                        var e = this;
                        if (0 !== this._state) {
                            var t = this._handlers.slice();
                            this._handlers = [], t.forEach(function(t) {
                                t[0] || (1 === e._state && t[1](e._value), 2 === e._state && t[2](e._value), t[0] = !0)
                            })
                        }
                    }
                }, {
                    key: "_runExecutor",
                    value: function(e) {
                        var t = this,
                            n = function(e, n) {
                                if (0 === t._state) {
                                    if (ts(n)) return void n.then(r, a);
                                    t._state = e, t._value = n, t._executeHandlers()
                                }
                            },
                            r = function(e) {
                                n(1, e)
                            },
                            a = function(e) {
                                n(2, e)
                            };
                        try {
                            e(r, a)
                        } catch (e) {
                            a(e)
                        }
                    }
                }]), e
            }();

            function rO(e, t) {
                var n = t.extra,
                    r = t.tags,
                    a = t.attributes,
                    i = t.user,
                    o = t.contexts,
                    u = t.level,
                    s = t.sdkProcessingMetadata,
                    l = t.breadcrumbs,
                    c = t.fingerprint,
                    f = t.eventProcessors,
                    d = t.attachments,
                    p = t.propagationContext,
                    v = t.transactionName,
                    m = t.span;
                rV(e, "extra", n), rV(e, "tags", r), rV(e, "attributes", a), rV(e, "user", i), rV(e, "contexts", o), e.sdkProcessingMetadata = tY(e.sdkProcessingMetadata, s, 2), u && (e.level = u), v && (e.transactionName = v), m && (e.span = m), l.length && (e.breadcrumbs = e9(e.breadcrumbs).concat(e9(l))), c.length && (e.fingerprint = e9(e.fingerprint).concat(e9(c))), f.length && (e.eventProcessors = e9(e.eventProcessors).concat(e9(f))), d.length && (e.attachments = e9(e.attachments).concat(e9(d))), e.propagationContext = eY({}, e.propagationContext, p)
            }

            function rV(e, t, n) {
                e[t] = tY(e[t], n, 1)
            }

            function rC(e, t) {
                var n = e0("globalScope", function() {
                    return new t9
                }).getScopeData();
                return e && rO(n, e.getScopeData()), t && rO(n, t.getScopeData()), n
            }
            var rZ = ["user", "level", "extra", "contexts", "tags", "fingerprint", "propagationContext"];

            function rB(e, t) {
                return no().captureException(e, function(e) {
                    if (e) {
                        var t;
                        return (t = e, (0, eW._)(t, t9) || "function" == typeof t || Object.keys(e).some(function(e) {
                            return rZ.includes(e)
                        })) ? {
                            captureContext: e
                        } : e
                    }
                }(t))
            }

            function rL(e, t) {
                return no().captureEvent(e, t)
            }

            function rF(e, t) {
                nu().setTag(e, t)
            }

            function rP(e) {
                var t, n, r, a = nu(),
                    i = rC(a, no()).user,
                    o = (eQ.navigator || {}).userAgent,
                    u = (t = eY({
                        user: i
                    }, o && {
                        userAgent: o
                    }, e), n = tX(), r = {
                        sid: tV(),
                        init: !0,
                        timestamp: n,
                        started: n,
                        duration: 0,
                        status: "ok",
                        errors: 0,
                        ignoreDuration: !1,
                        toJSON: function() {
                            var e;
                            return e = r, {
                                sid: "".concat(e.sid),
                                init: e.init,
                                started: new Date(1e3 * e.started).toISOString(),
                                timestamp: new Date(1e3 * e.timestamp).toISOString(),
                                status: e.status,
                                errors: e.errors,
                                did: "number" == typeof e.did || "string" == typeof e.did ? "".concat(e.did) : void 0,
                                duration: e.duration,
                                abnormal_mechanism: e.abnormal_mechanism,
                                attrs: {
                                    release: e.release,
                                    environment: e.environment,
                                    ip_address: e.ipAddress,
                                    user_agent: e.userAgent
                                }
                            }
                        }
                    }, t && tD(r, t), r),
                    s = a.getSession();
                return (null == s ? void 0 : s.status) === "ok" && tD(s, {
                    status: "exited"
                }), rX(), a.setSession(u), u
            }

            function rX() {
                var e, t = nu(),
                    n = no().getSession() || t.getSession();
                n && (e = {}, "ok" === n.status && (e = {
                    status: "exited"
                }), tD(n, e)), rU(), t.setSession()
            }

            function rU() {
                var e = nu(),
                    t = nl(),
                    n = e.getSession();
                n && t && t.captureSession(n)
            }

            function rW() {
                var e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
                e ? rX() : rU()
            }
            var rD = [];

            function rY(e, t) {
                var n = !0,
                    r = !1,
                    a = void 0;
                try {
                    for (var i, o = t[Symbol.iterator](); !(n = (i = o.next()).done); n = !0) {
                        var u = i.value;
                        (null == u ? void 0 : u.afterAllSetup) && u.afterAllSetup(e)
                    }
                } catch (e) {
                    r = !0, a = e
                } finally {
                    try {
                        n || null == o.return || o.return()
                    } finally {
                        if (r) throw a
                    }
                }
            }

            function rG(e, t, n) {
                if (n[t.name]) {
                    e4 && tE.log("Integration skipped because it was already installed: ".concat(t.name));
                    return
                }
                if (n[t.name] = t, rD.includes(t.name) || "function" != typeof t.setupOnce || (t.setupOnce(), rD.push(t.name)), t.setup && "function" == typeof t.setup && t.setup(e), "function" == typeof t.preprocessEvent) {
                    var r = t.preprocessEvent.bind(t);
                    e.on("preprocessEvent", function(t, n) {
                        return r(t, n, e)
                    })
                }
                if ("function" == typeof t.processEvent) {
                    var a = t.processEvent.bind(t),
                        i = Object.assign(function(t, n) {
                            return a(t, n, e)
                        }, {
                            id: t.name
                        });
                    e.addEventProcessor(i)
                } ["processSpan", "processSegmentSpan"].forEach(function(n) {
                    var r = t[n];
                    "function" == typeof r && e.on(n, function(n) {
                        return r.call(t, n, e)
                    })
                }), e4 && tE.log("Integration installed: ".concat(t.name))
            }

            function rj(e) {
                var t = [];
                e.message && t.push(e.message);
                try {
                    var n = e.exception.values[e.exception.values.length - 1];
                    (null == n ? void 0 : n.value) && (t.push(n.value), n.type && t.push("".concat(n.type, ": ").concat(n.value)))
                } catch (e) {}
                return t
            }
            var rM = [/^Script error\.?$/, /^Javascript error: Script error\.? on line 0$/, /^ResizeObserver loop completed with undelivered notifications.$/, /^Cannot redefine property: googletag$/, /^Can't find variable: gmo$/, /^undefined is not an object \(evaluating 'a\.[A-Z]'\)$/, /can't redefine non-configurable property "solana"/, /vv\(\)\.getRestrictions is not a function/, /Can't find variable: _AutofillCallbackHandler/, /Object Not Found Matching Id:\d+, MethodName:simulateEvent/, /^Java exception was raised during method invocation$/],
                rz = function() {
                    var e, t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                    return {
                        name: "EventFilters",
                        setup: function(n) {
                            e = rK(t, n.getOptions())
                        },
                        processEvent: function(n, r, a) {
                            return e || (e = rK(t, a.getOptions())), ! function(e, t) {
                                if (e.type) {
                                    if ("transaction" === e.type && function(e, t) {
                                            if (!(null == t ? void 0 : t.length)) return !1;
                                            var n = e.transaction;
                                            return !!n && t5(n, t)
                                        }(e, t.ignoreTransactions)) return e4 && tE.warn("Event dropped due to being matched by `ignoreTransactions` option.\nEvent: ".concat(tZ(e))), !0
                                } else {
                                    var n, r, a, i, o;
                                    if (n = e, (null == (r = t.ignoreErrors) ? void 0 : r.length) && rj(n).some(function(e) {
                                            return t5(e, r)
                                        })) return e4 && tE.warn("Event dropped due to being matched by `ignoreErrors` option.\nEvent: ".concat(tZ(e))), !0;
                                    if ((null == (o = (a = e).exception) || null == (i = o.values) ? void 0 : i.length) && !a.message && !a.exception.values.some(function(e) {
                                            return e.stacktrace || e.type && "Error" !== e.type || e.value
                                        })) return e4 && tE.warn("Event dropped due to not having an error message, error type or stacktrace.\nEvent: ".concat(tZ(e))), !0;
                                    if (function(e, t) {
                                            if (!(null == t ? void 0 : t.length)) return !1;
                                            var n = rH(e);
                                            return !!n && t5(n, t)
                                        }(e, t.denyUrls)) return e4 && tE.warn("Event dropped due to being matched by `denyUrls` option.\nEvent: ".concat(tZ(e), ".\nUrl: ").concat(rH(e))), !0;
                                    if (! function(e, t) {
                                            if (!(null == t ? void 0 : t.length)) return !0;
                                            var n = rH(e);
                                            return !n || t5(n, t)
                                        }(e, t.allowUrls)) return e4 && tE.warn("Event dropped due to not being matched by `allowUrls` option.\nEvent: ".concat(tZ(e), ".\nUrl: ").concat(rH(e))), !0
                                }
                                return !1
                            }(n, e) ? n : null
                        }
                    }
                },
                rJ = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                    return eG(eY({}, rz(e)), {
                        name: "InboundFilters"
                    })
                };

            function rK() {
                var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                    t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                return {
                    allowUrls: e9(e.allowUrls || []).concat(e9(t.allowUrls || [])),
                    denyUrls: e9(e.denyUrls || []).concat(e9(t.denyUrls || [])),
                    ignoreErrors: e9(e.ignoreErrors || []).concat(e9(t.ignoreErrors || []), e9(e.disableErrorDefaults ? [] : rM)),
                    ignoreTransactions: e9(e.ignoreTransactions || []).concat(e9(t.ignoreTransactions || []))
                }
            }

            function rH(e) {
                try {
                    var t, n, r, a = e9(null != (t = null == (n = e.exception) ? void 0 : n.values) ? t : []).reverse().find(function(e) {
                            var t, n, r;
                            return (null == (t = e.mechanism) ? void 0 : t.parent_id) === void 0 && (null == (r = e.stacktrace) || null == (n = r.frames) ? void 0 : n.length)
                        }),
                        i = null == a || null == (r = a.stacktrace) ? void 0 : r.frames;
                    return i ? function() {
                        for (var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [], t = e.length - 1; t >= 0; t--) {
                            var n = e[t];
                            if (n && "<anonymous>" !== n.filename && "[native code]" !== n.filename) return n.filename || null
                        }
                        return null
                    }(i) : null
                } catch (t) {
                    return e4 && tE.error("Cannot extract url for event ".concat(tZ(e))), null
                }
            }
            var rQ = new WeakMap,
                rq = function() {
                    var e;
                    return {
                        name: "Dedupe",
                        processEvent: function(t) {
                            if (t.type) return t;
                            try {
                                var n, r, a, i, o, u, s, l, c, f;
                                if (n = t, (r = e) && (a = n, i = r, o = a.message, u = i.message, (o || u) && (!o || u) && (o || !u) && o === u && r0(a, i) && r$(a, i) && 1 || (s = n, l = r, c = r1(l), f = r1(s), c && f && c.type === f.type && c.value === f.value && r0(s, l) && r$(s, l)))) return e4 && tE.warn("Event dropped due to being a duplicate of previously captured event."), null
                            } catch (e) {}
                            return e = t
                        }
                    }
                };

            function r$(e, t) {
                var n = t$(e),
                    r = t$(t);
                if (!n && !r) return !0;
                if (n && !r || !n && r || r.length !== n.length) return !1;
                for (var a = 0; a < r.length; a++) {
                    var i = r[a],
                        o = n[a];
                    if (i.filename !== o.filename || i.lineno !== o.lineno || i.colno !== o.colno || i.function !== o.function) return !1
                }
                return !0
            }

            function r0(e, t) {
                var n = e.fingerprint,
                    r = t.fingerprint;
                if (!n && !r) return !0;
                if (n && !r || !n && r) return !1;
                try {
                    return n.join("") === r.join("")
                } catch (e) {
                    return !1
                }
            }

            function r1(e) {
                var t, n;
                return null == (n = e.exception) || null == (t = n.values) ? void 0 : t[0]
            }

            function r2(e) {
                return (r2 = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function r3() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (r3 = function() {
                    return !!e
                })()
            }

            function r5(e, t, n) {
                t = r2(t);
                var r = r3() ? Reflect.construct(t, n || [], r2(e).constructor) : t.apply(e, n);
                if (r && ("object" === (0, e8._)(r) || "function" == typeof r)) return r;
                if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                return e
            }

            function r9(e, t, n) {
                return (r9 = "u" > typeof Reflect && Reflect.get ? Reflect.get : function(e, t, n) {
                    var r = function(e, t) {
                        for (; !Object.prototype.hasOwnProperty.call(e, t) && null !== (e = r2(e)););
                        return e
                    }(e, t);
                    if (r) {
                        var a = Object.getOwnPropertyDescriptor(r, t);
                        return a.get ? a.get.call(n || e) : a.value
                    }
                })(e, t, n || e)
            }

            function r4(e, t) {
                return (r4 = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function r8(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Super expression must either be null or a function");
                e.prototype = Object.create(t && t.prototype, {
                    constructor: {
                        value: e,
                        writable: !0,
                        configurable: !0
                    }
                }), t && r4(e, t)
            }
            var r6 = n(913);

            function r7(e, t) {
                var n, r, a = null != (r = null != t ? t : (n = e, ae().get(n))) ? r : [];
                if (0 !== a.length) {
                    var i, o, u, s, l = e.getOptions(),
                        c = (i = l._metadata, o = l.tunnel, u = e.getDsn(), s = {}, (null == i ? void 0 : i.sdk) && (s.sdk = {
                            name: i.sdk.name,
                            version: i.sdk.version
                        }), o && u && (s.dsn = n4(u)), ro(s, [
                            [{
                                type: "log",
                                item_count: a.length,
                                content_type: "application/vnd.sentry.items.log+json"
                            }, {
                                items: a
                            }]
                        ]));
                    ae().set(e, []), e.emit("flushLogs"), e.sendEnvelope(c)
                }
            }

            function ae() {
                return e0("clientToLogBufferMap", function() {
                    return new WeakMap
                })
            }

            function at(e, t) {
                var n, r, a = null != (r = null != t ? t : (n = e, an().get(n))) ? r : [];
                if (0 !== a.length) {
                    var i, o, u, s, l = e.getOptions(),
                        c = (i = l._metadata, o = l.tunnel, u = e.getDsn(), s = {}, (null == i ? void 0 : i.sdk) && (s.sdk = {
                            name: i.sdk.name,
                            version: i.sdk.version
                        }), o && u && (s.dsn = n4(u)), ro(s, [
                            [{
                                type: "trace_metric",
                                item_count: a.length,
                                content_type: "application/vnd.sentry.items.trace-metric+json"
                            }, {
                                items: a
                            }]
                        ]));
                    an().set(e, []), e.emit("flushMetrics"), e.sendEnvelope(c)
                }
            }

            function an() {
                return e0("clientToMetricBufferMap", function() {
                    return new WeakMap
                })
            }

            function ar(e) {
                if ("aggregates" in e) {
                    var t;
                    (null == (t = e.attrs) ? void 0 : t.ip_address) === void 0 && (e.attrs = eG(eY({}, e.attrs), {
                        ip_address: "{{auto}}"
                    }))
                } else void 0 === e.ipAddress && (e.ipAddress = "{{auto}}")
            }

            function aa(e, t, n) {
                var r, a, i;
                return t || "".concat("".concat((r = e.protocol ? "".concat(e.protocol, ":") : "", a = e.port ? ":".concat(e.port) : "", "".concat(r, "//").concat(e.host).concat(a).concat(e.path ? "/".concat(e.path) : "", "/api/"))).concat(e.projectId, "/envelope/"), "?").concat((i = {
                    sentry_version: "7"
                }, e.publicKey && (i.sentry_key = e.publicKey), n && (i.sentry_client = "".concat(n.name, "/").concat(n.version)), new URLSearchParams(i).toString()))
            }

            function ai(e) {
                return (void 0 === e ? "undefined" : (0, e8._)(e)) === "object" && "function" == typeof e.unref && e.unref(), e
            }
            var ao = Symbol.for("SentryBufferFullError");

            function au() {
                var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : 100,
                    t = new Set;
                return {
                    get $() {
                        return Array.from(t)
                    },
                    add: function(n) {
                        if (!(t.size < e)) return rx(ao);
                        var r = n();
                        return t.add(r), r.then(function() {
                            t.delete(r)
                        }, function() {
                            t.delete(r)
                        }), r
                    },
                    drain: function(e) {
                        if (!t.size) return rk(!0);
                        var n = Promise.allSettled(Array.from(t)).then(function() {
                            return !0
                        });
                        return e ? Promise.race([n, new Promise(function(t) {
                            return ai(setTimeout(function() {
                                return t(!1)
                            }, e))
                        })]) : n
                    }
                }
            }

            function as(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : tO(),
                    n = parseInt("".concat(e), 10);
                if (!isNaN(n)) return 1e3 * n;
                var r = Date.parse("".concat(e));
                return isNaN(r) ? 6e4 : r - t
            }
            var al = "Not capturing exception because it's already been captured.",
                ac = "Discarded session because of missing or non-string release",
                af = Symbol.for("SentryInternalError"),
                ad = Symbol.for("SentryDoNotSendEventError");

            function ap(e) {
                return eD({
                    message: e
                }, af, !0)
            }

            function av(e) {
                return eD({
                    message: e
                }, ad, !0)
            }

            function am(e) {
                return !!e && (void 0 === e ? "undefined" : (0, e8._)(e)) === "object" && af in e
            }

            function ah(e) {
                return !!e && (void 0 === e ? "undefined" : (0, e8._)(e)) === "object" && ad in e
            }

            function ag(e, t, n, r, a) {
                var i, o = 0,
                    u = !1;
                e.on(n, function() {
                    o = 0, clearTimeout(i), u = !1
                }), e.on(t, function(t) {
                    (o += r(t)) >= 8e5 ? a(e) : u || (u = !0, i = ai(setTimeout(function() {
                        a(e)
                    }, 5e3)))
                }), e.on("flush", function() {
                    a(e)
                })
            }
            var ay = function() {
                function e(t) {
                    if (e1(this, e), this._options = t, this._integrations = {}, this._numProcessing = 0, this._outcomes = {}, this._hooks = {}, this._eventProcessors = [], this._promiseBuffer = au(null != (n = null == (o = t.transportOptions) ? void 0 : o.bufferSize) ? n : 64), t.dsn ? this._dsn = function(e) {
                            var t = "string" == typeof e ? n8(e) : n6(e);
                            if (t && function(e) {
                                    if (!e4) return !0;
                                    var t = e.port,
                                        n = e.projectId,
                                        r = e.protocol;
                                    return !["protocol", "publicKey", "host", "projectId"].find(function(t) {
                                        return !e[t] && (tE.error("Invalid Sentry Dsn: ".concat(t, " missing")), !0)
                                    }) && (n.match(/^\d+$/) ? "http" !== r && "https" !== r ? (tE.error("Invalid Sentry Dsn: Invalid protocol ".concat(r)), !1) : !(t && isNaN(parseInt(t, 10))) || (tE.error("Invalid Sentry Dsn: Invalid port ".concat(t)), !1) : (tE.error("Invalid Sentry Dsn: Invalid projectId ".concat(n)), !1))
                                }(t)) return t
                        }(t.dsn) : e4 && tE.warn("No DSN provided, client will not send events."), this._dsn) {
                        var n, r, a, i, o, u, s, l = aa(this._dsn, t.tunnel, t._metadata ? t._metadata.sdk : void 0);
                        this._transport = t.transport(eG(eY({
                            tunnel: this._options.tunnel,
                            recordDroppedEvent: this.recordDroppedEvent.bind(this)
                        }, t.transportOptions), {
                            url: l
                        }))
                    }
                    this._options.enableLogs = null != (r = this._options.enableLogs) ? r : null == (u = this._options._experiments) ? void 0 : u.enableLogs, this._options.enableLogs && ag(this, "afterCaptureLog", "flushLogs", aw, r7), (null == (a = null != (i = this._options.enableMetrics) ? i : null == (s = this._options._experiments) ? void 0 : s.enableMetrics) || a) && ag(this, "afterCaptureMetric", "flushMetrics", aS, at)
                }
                return e3(e, [{
                    key: "captureException",
                    value: function(e, t, n) {
                        var r = this,
                            a = tV();
                        if (tF(e)) return e4 && tE.log(al), a;
                        var i = eY({
                            event_id: a
                        }, t);
                        return this._process(function() {
                            return r.eventFromException(e, i).then(function(e) {
                                return r._captureEvent(e, i, n)
                            }).then(function(e) {
                                return e
                            })
                        }, "error"), i.event_id
                    }
                }, {
                    key: "captureMessage",
                    value: function(e, t, n, r) {
                        var a = this,
                            i = eY({
                                event_id: tV()
                            }, n),
                            o = ta(e) ? e : String(e),
                            u = ti(e),
                            s = u ? this.eventFromMessage(o, t, i) : this.eventFromException(e, i);
                        return this._process(function() {
                            return s.then(function(e) {
                                return a._captureEvent(e, i, r)
                            })
                        }, u ? "unknown" : "error"), i.event_id
                    }
                }, {
                    key: "captureEvent",
                    value: function(e, t, n) {
                        var r = this,
                            a = tV();
                        if ((null == t ? void 0 : t.originalException) && tF(t.originalException)) return e4 && tE.log(al), a;
                        var i = eY({
                                event_id: a
                            }, t),
                            o = e.sdkProcessingMetadata || {},
                            u = o.capturedSpanScope,
                            s = o.capturedSpanIsolationScope,
                            l = ab(e.type);
                        return this._process(function() {
                            return r._captureEvent(e, i, u || n, s)
                        }, l), i.event_id
                    }
                }, {
                    key: "captureSession",
                    value: function(e) {
                        this.sendSession(e), tD(e, {
                            init: !1
                        })
                    }
                }, {
                    key: "getDsn",
                    value: function() {
                        return this._dsn
                    }
                }, {
                    key: "getOptions",
                    value: function() {
                        return this._options
                    }
                }, {
                    key: "getSdkMetadata",
                    value: function() {
                        return this._options._metadata
                    }
                }, {
                    key: "getTransport",
                    value: function() {
                        return this._transport
                    }
                }, {
                    key: "flush",
                    value: function(e) {
                        return rN(function() {
                            var t, n, r;
                            return rA(this, function(a) {
                                switch (a.label) {
                                    case 0:
                                        if (!(t = this._transport)) return [2, !0];
                                        return this.emit("flush"), [4, this._isClientDoneProcessing(e)];
                                    case 1:
                                        return n = a.sent(), [4, t.flush(e)];
                                    case 2:
                                        return r = a.sent(), [2, n && r]
                                }
                            })
                        }).call(this)
                    }
                }, {
                    key: "close",
                    value: function(e) {
                        return rN(function() {
                            var t;
                            return rA(this, function(n) {
                                switch (n.label) {
                                    case 0:
                                        return r7(this), [4, this.flush(e)];
                                    case 1:
                                        return t = n.sent(), this.getOptions().enabled = !1, this.emit("close"), [2, t]
                                }
                            })
                        }).call(this)
                    }
                }, {
                    key: "getEventProcessors",
                    value: function() {
                        return this._eventProcessors
                    }
                }, {
                    key: "addEventProcessor",
                    value: function(e) {
                        this._eventProcessors.push(e)
                    }
                }, {
                    key: "init",
                    value: function() {
                        (this._isEnabled() || this._options.integrations.some(function(e) {
                            return e.name.startsWith("Spotlight")
                        })) && this._setupIntegrations()
                    }
                }, {
                    key: "getIntegrationByName",
                    value: function(e) {
                        return this._integrations[e]
                    }
                }, {
                    key: "addIntegration",
                    value: function(e) {
                        var t = this._integrations[e.name];
                        !t && e.beforeSetup && e.beforeSetup(this), rG(this, e, this._integrations), t || rY(this, [e])
                    }
                }, {
                    key: "sendEvent",
                    value: function(e) {
                        var t = this,
                            n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                        this.emit("beforeSendEvent", e, n);
                        var r = (u = this._dsn, s = this._options._metadata, l = this._options.tunnel, c = rp(s), f = e.type && "replay_event" !== e.type ? e.type : "event", ! function(e, t) {
                                if (t) {
                                    var n, r, a, i, o = e.sdk || {};
                                    e.sdk = eG(eY({}, o), {
                                        name: o.name || t.name,
                                        version: o.version || t.version,
                                        integrations: e9((null == (n = e.sdk) ? void 0 : n.integrations) || []).concat(e9(t.integrations || [])),
                                        packages: e9((null == (r = e.sdk) ? void 0 : r.packages) || []).concat(e9(t.packages || [])),
                                        settings: (null == (a = e.sdk) ? void 0 : a.settings) || t.settings ? eY({}, null == (i = e.sdk) ? void 0 : i.settings, t.settings) : void 0
                                    })
                                }
                            }(e, null == s ? void 0 : s.sdk), p = null == (d = e.sdkProcessingMetadata) ? void 0 : d.dynamicSamplingContext, v = eY({
                                event_id: e.event_id,
                                sent_at: new Date().toISOString()
                            }, c && {
                                sdk: c
                            }, !!l && u && {
                                dsn: n4(u)
                            }, p && {
                                trace: p
                            }), delete e.sdkProcessingMetadata, ro(v, [
                                [{
                                    type: f
                                }, e]
                            ])),
                            a = !0,
                            i = !1,
                            o = void 0;
                        try {
                            for (var u, s, l, c, f, d, p, v, m, h = (n.attachments || [])[Symbol.iterator](); !(a = (m = h.next()).done); a = !0) {
                                var g = m.value;
                                r = function(e, t) {
                                    var n = eK(e, 2);
                                    return [n[0], e9(n[1]).concat([t])]
                                }(r, function(e) {
                                    var t = "string" == typeof e.data ? rl(e.data) : e.data;
                                    return [{
                                        type: "attachment",
                                        length: t.length,
                                        filename: e.filename,
                                        content_type: e.contentType,
                                        attachment_type: e.attachmentType
                                    }, t]
                                }(g))
                            }
                        } catch (e) {
                            i = !0, o = e
                        } finally {
                            try {
                                a || null == h.return || h.return()
                            } finally {
                                if (i) throw o
                            }
                        }
                        this.sendEnvelope(r).then(function(n) {
                            return t.emit("afterSendEvent", e, n)
                        })
                    }
                }, {
                    key: "sendSession",
                    value: function(e) {
                        var t, n, r, a, i = this._options,
                            o = i.release,
                            u = i.environment,
                            s = void 0 === u ? n3 : u;
                        if ("aggregates" in e) {
                            var l = e.attrs || {};
                            if (!l.release && !o) {
                                e4 && tE.warn(ac);
                                return
                            }
                            l.release = l.release || o, l.environment = l.environment || s, e.attrs = l
                        } else {
                            if (!e.release && !o) {
                                e4 && tE.warn(ac);
                                return
                            }
                            e.release = e.release || o, e.environment = e.environment || s
                        }
                        this.emit("beforeSendSession", e);
                        var c = (t = this._dsn, n = this._options._metadata, r = this._options.tunnel, a = rp(n), ro(eY({
                            sent_at: new Date().toISOString()
                        }, a && {
                            sdk: a
                        }, !!r && t && {
                            dsn: n4(t)
                        }), ["aggregates" in e ? [{
                            type: "sessions"
                        }, e] : [{
                            type: "session"
                        }, e.toJSON()]]));
                        this.sendEnvelope(c)
                    }
                }, {
                    key: "recordDroppedEvent",
                    value: function(e, t) {
                        var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 1;
                        if (this._options.sendClientReports) {
                            var r = "".concat(e, ":").concat(t);
                            e4 && tE.log('Recording outcome: "'.concat(r, '"').concat(n > 1 ? " (".concat(n, " times)") : "")), this._outcomes[r] = (this._outcomes[r] || 0) + n
                        }
                    }
                }, {
                    key: "on",
                    value: function(e, t) {
                        var n = this._hooks[e] = this._hooks[e] || new Set,
                            r = function() {
                                for (var e = arguments.length, n = Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                                return t.apply(void 0, e9(n))
                            };
                        return n.add(r),
                            function() {
                                n.delete(r)
                            }
                    }
                }, {
                    key: "emit",
                    value: function(e) {
                        for (var t = arguments.length, n = Array(t > 1 ? t - 1 : 0), r = 1; r < t; r++) n[r - 1] = arguments[r];
                        var a = this._hooks[e];
                        a && a.forEach(function(e) {
                            return e.apply(void 0, e9(n))
                        })
                    }
                }, {
                    key: "sendEnvelope",
                    value: function(e) {
                        return rN(function() {
                            var t;
                            return rA(this, function(n) {
                                switch (n.label) {
                                    case 0:
                                        if (this.emit("beforeEnvelope", e), !(this._isEnabled() && this._transport)) return [3, 4];
                                        n.label = 1;
                                    case 1:
                                        return n.trys.push([1, 3, , 4]), [4, this._transport.send(e)];
                                    case 2:
                                        return [2, n.sent()];
                                    case 3:
                                        return t = n.sent(), e4 && tE.error("Error while sending envelope:", t), [2, {}];
                                    case 4:
                                        return e4 && tE.error("Transport disabled"), [2, {}]
                                }
                            })
                        }).call(this)
                    }
                }, {
                    key: "dispose",
                    value: function() {}
                }, {
                    key: "_setupIntegrations",
                    value: function() {
                        var e, t, n = this._options.integrations;
                        this._integrations = (e = this, t = {}, n.forEach(function(t) {
                            (null == t ? void 0 : t.beforeSetup) && t.beforeSetup(e)
                        }), n.forEach(function(n) {
                            n && rG(e, n, t)
                        }), t), rY(this, n)
                    }
                }, {
                    key: "_updateSessionFromEvent",
                    value: function(e, t) {
                        var n = "fatal" === t.level,
                            r = !1,
                            a = null == (l = t.exception) ? void 0 : l.values;
                        if (a) {
                            r = !0, n = !1;
                            var i = !0,
                                o = !1,
                                u = void 0;
                            try {
                                for (var s, l, c, f = a[Symbol.iterator](); !(i = (c = f.next()).done); i = !0)
                                    if ((null == (s = c.value.mechanism) ? void 0 : s.handled) === !1) {
                                        n = !0;
                                        break
                                    }
                            } catch (e) {
                                o = !0, u = e
                            } finally {
                                try {
                                    i || null == f.return || f.return()
                                } finally {
                                    if (o) throw u
                                }
                            }
                        }
                        var d = "ok" === e.status;
                        (d && 0 === e.errors || d && n) && (tD(e, eG(eY({}, n && {
                            status: "crashed"
                        }), {
                            errors: e.errors || Number(r || n)
                        })), this.captureSession(e))
                    }
                }, {
                    key: "_isClientDoneProcessing",
                    value: function(e) {
                        return rN(function() {
                            var t;
                            return rA(this, function(n) {
                                switch (n.label) {
                                    case 0:
                                        t = 0, n.label = 1;
                                    case 1:
                                        if (!(!e || t < e)) return [3, 3];
                                        return [4, new Promise(function(e) {
                                            return setTimeout(e, 1)
                                        })];
                                    case 2:
                                        if (n.sent(), !this._numProcessing) return [2, !0];
                                        return t++, [3, 1];
                                    case 3:
                                        return [2, !1]
                                }
                            })
                        }).call(this)
                    }
                }, {
                    key: "_isEnabled",
                    value: function() {
                        return !1 !== this.getOptions().enabled && void 0 !== this._transport
                    }
                }, {
                    key: "_prepareEvent",
                    value: function(e, t, n, r) {
                        var a, i, o, u, s, l, c, f, d, p, v, m, h, g, y, b, _, E, S, w, T, I, N, A, k, x, R, O, V, C, Z, B, L, F, P, X, U, W, D, Y, G, j, M, z, $, ee = this,
                            et = this.getOptions(),
                            en = Object.keys(this._integrations);
                        return !t.integrations && (null == en ? void 0 : en.length) && (t.integrations = en), this.emit("preprocessEvent", e, t), e.type || r.setLastEventId(e.event_id || t.event_id), (B = void 0 === (Z = et.normalizeDepth) ? 3 : Z, F = void 0 === (L = et.normalizeMaxBreadth) ? 1e3 : L, P = eG(eY({}, e), {
                            event_id: e.event_id || t.event_id || tV(),
                            timestamp: e.timestamp || tP()
                        }), X = t.integrations || et.integrations.map(function(e) {
                            return e.name
                        }), a = P, s = (i = et).environment, l = i.release, c = i.dist, f = i.maxValueLength, a.environment = a.environment || s || n3, !a.release && l && (a.release = l), !a.dist && c && (a.dist = c), (null == (d = a.request) ? void 0 : d.url) && f && (d.url = t1(d.url, f)), f && (null == (u = a.exception) || null == (o = u.values) || o.forEach(function(e) {
                            e.value && (e.value = t1(e.value, f))
                        })), p = P, (v = X).length > 0 && (p.sdk = p.sdk || {}, p.sdk.integrations = e9(p.sdk.integrations || []).concat(e9(v))), this && this.emit("applyFrameMetadata", e), void 0 === e.type && (m = P, y = function(e) {
                            var t = eQ._sentryDebugIds,
                                n = eQ._debugIds;
                            if (!t && !n) return {};
                            var r = t ? Object.keys(t) : [],
                                a = n ? Object.keys(n) : [];
                            if (q && r.length === H && a.length === Q) return q;
                            H = r.length, Q = a.length, q = {}, K || (K = {});
                            var i = function(t, n) {
                                var r = !0,
                                    a = !1,
                                    i = void 0;
                                try {
                                    for (var o, u = t[Symbol.iterator](); !(r = (o = u.next()).done); r = !0) {
                                        var s = o.value,
                                            l = n[s],
                                            c = null == K ? void 0 : K[s];
                                        if (c && q && l) q[c[0]] = l, K && (K[s] = [c[0], l]);
                                        else if (l)
                                            for (var f = e(s), d = f.length - 1; d >= 0; d--) {
                                                var p = f[d],
                                                    v = null == p ? void 0 : p.filename;
                                                if (v && q && K) {
                                                    q[v] = l, K[s] = [v, l];
                                                    break
                                                }
                                            }
                                    }
                                } catch (e) {
                                    a = !0, i = e
                                } finally {
                                    try {
                                        r || null == u.return || u.return()
                                    } finally {
                                        if (a) throw i
                                    }
                                }
                            };
                            return t && i(r, t), n && i(a, n), q
                        }(et.stackParser), null == (g = m.exception) || null == (h = g.values) || h.forEach(function(e) {
                            var t, n;
                            null == (n = e.stacktrace) || null == (t = n.frames) || t.forEach(function(e) {
                                e.filename && (e.debug_id = y[e.filename])
                            })
                        })), U = function(e, t) {
                            if (!t) return e;
                            var n = e ? e.clone() : new t9;
                            return n.update(t), n
                        }(n, t.captureContext), t.mechanism && tL(P, t.mechanism), W = this ? this.getEventProcessors() : [], D = rC(r, U), (Y = e9(t.attachments || []).concat(e9(D.attachments))).length && (t.attachments = Y), G = D.fingerprint, j = D.span, M = D.breadcrumbs, z = D.sdkProcessingMetadata, b = P, E = (_ = D).extra, S = _.tags, w = _.user, T = _.contexts, I = _.level, N = _.transactionName, Object.keys(E).length && (b.extra = eY({}, E, b.extra)), Object.keys(S).length && (b.tags = eY({}, S, b.tags)), Object.keys(w).length && (b.user = eY({}, w, b.user)), Object.keys(T).length && (b.contexts = eY({}, T, b.contexts)), I && (b.level = I), N && "transaction" !== b.type && (b.transaction = N), j && function(e, t) {
                            e.contexts = eY({
                                trace: (r = (n = t.spanContext()).spanId, a = n.traceId, o = (i = n.isRemote) ? r : nW(t).parent_span_id, u = nx(t).scope, {
                                    parent_span_id: o,
                                    span_id: i ? (null == u ? void 0 : u.getPropagationContext().propagationSpanId) || tG() : r,
                                    trace_id: a
                                })
                            }, e.contexts), e.sdkProcessingMetadata = eY({
                                dynamicSamplingContext: rn(t)
                            }, e.sdkProcessingMetadata);
                            var n, r, a, i, o, u, s = nW(n$(t)).description;
                            s && !e.transaction && "transaction" === e.type && (e.transaction = s)
                        }(P, j), A = P, k = G, A.fingerprint = A.fingerprint ? Array.isArray(A.fingerprint) ? A.fingerprint : [A.fingerprint] : [], k && (A.fingerprint = A.fingerprint.concat(k)), A.fingerprint.length || delete A.fingerprint, x = P, R = M, O = e9(x.breadcrumbs || []).concat(e9(R)), x.breadcrumbs = O.length ? O : void 0, V = P, C = z, V.sdkProcessingMetadata = eY({}, V.sdkProcessingMetadata, C), $ = e9(W).concat(e9(D.eventProcessors)), (t.data && !0 === t.data.__sentry__ ? rk(P) : function(e, t, n) {
                            var r = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : 0;
                            try {
                                var a = function e(t, n, r, a) {
                                    var i = r[a];
                                    if (!t || !i) return t;
                                    var o = i(eY({}, t), n);
                                    return (e4 && null === o && tE.log('Event processor "'.concat(i.id || "?", '" dropped event')), ts(o)) ? o.then(function(t) {
                                        return e(t, n, r, a + 1)
                                    }) : e(o, n, r, a + 1)
                                }(t, n, e, r);
                                return ts(a) ? a : rk(a)
                            } catch (e) {
                                return rx(e)
                            }
                        }($, P, t)).then(function(e) {
                            return (e && function(e) {
                                var t, n, r = {};
                                if (null == (n = e.exception) || null == (t = n.values) || t.forEach(function(e) {
                                        var t, n;
                                        null == (n = e.stacktrace) || null == (t = n.frames) || t.forEach(function(e) {
                                            e.debug_id && (e.abs_path ? r[e.abs_path] = e.debug_id : e.filename && (r[e.filename] = e.debug_id), delete e.debug_id)
                                        })
                                    }), 0 !== Object.keys(r).length) {
                                    e.debug_meta = e.debug_meta || {}, e.debug_meta.images = e.debug_meta.images || [];
                                    var a = e.debug_meta.images;
                                    Object.entries(r).forEach(function(e) {
                                        var t = eK(e, 2),
                                            n = t[0],
                                            r = t[1];
                                        a.push({
                                            type: "sourcemap",
                                            code_file: n,
                                            debug_id: r
                                        })
                                    })
                                }
                            }(e), "number" == typeof B && B > 0) ? function(e, t, n) {
                                if (!e) return null;
                                var r, a, i = eY({}, e, e.breadcrumbs && {
                                    breadcrumbs: e.breadcrumbs.map(function(e) {
                                        return eY({}, e, e.data && {
                                            data: ri(e.data, t, n)
                                        })
                                    })
                                }, e.user && {
                                    user: ri(e.user, t, n)
                                }, e.contexts && {
                                    contexts: ri(e.contexts, t, n)
                                }, e.extra && {
                                    extra: ri(e.extra, t, n)
                                });
                                return (null == (r = e.contexts) ? void 0 : r.trace) && i.contexts && (i.contexts.trace = e.contexts.trace, e.contexts.trace.data && (i.contexts.trace.data = ri(e.contexts.trace.data, t, n))), e.spans && (i.spans = e.spans.map(function(e) {
                                    return eY({}, e, e.data && {
                                        data: ri(e.data, t, n)
                                    })
                                })), (null == (a = e.contexts) ? void 0 : a.flags) && i.contexts && (i.contexts.flags = ri(e.contexts.flags, 3, n)), i
                            }(e, B, F) : e
                        })).then(function(e) {
                            var r;
                            return null === e ? e : (ee.emit("postprocessEvent", e, t), e.contexts = eY({
                                trace: eY({}, null == (r = e.contexts) ? void 0 : r.trace, function(e) {
                                    var t = null == J ? void 0 : J();
                                    if (t) return {
                                        trace_id: t.traceId,
                                        span_id: t.spanId
                                    };
                                    var n = e.getPropagationContext(),
                                        r = n.traceId,
                                        a = n.parentSpanId,
                                        i = {
                                            trace_id: r,
                                            span_id: n.propagationSpanId || tG()
                                        };
                                    return a && (i.parent_span_id = a), i
                                }(n))
                            }, e.contexts), e.sdkProcessingMetadata = eY({
                                dynamicSamplingContext: rt(ee, n)
                            }, e.sdkProcessingMetadata), e)
                        })
                    }
                }, {
                    key: "_captureEvent",
                    value: function(e) {
                        var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                            n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : no(),
                            r = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : nu();
                        return e4 && a_(e) && tE.log("Captured error event `".concat(rj(e)[0] || "<unknown>", "`")), this._processEvent(e, t, n, r).then(function(e) {
                            return e.event_id
                        }, function(e) {
                            e4 && (ah(e) ? tE.log(e.message) : am(e) ? tE.warn(e.message) : tE.warn(e))
                        })
                    }
                }, {
                    key: "_processEvent",
                    value: function(e, t, n, r) {
                        var a = this,
                            i = this.getOptions(),
                            o = i.sampleRate,
                            u = aE(e),
                            s = a_(e),
                            l = e.type || "error",
                            c = "before send for type `".concat(l, "`"),
                            f = void 0 === o ? void 0 : nI(o);
                        if (s && "number" == typeof f && tR() > f) return this.recordDroppedEvent("sample_rate", "error"), rx(av("Discarding event because it's not included in the random sample (sampling rate = ".concat(o, ")")));
                        var d = ab(e.type);
                        return this._prepareEvent(e, t, n, r).then(function(e) {
                            var n;
                            if (null === e) throw a.recordDroppedEvent("event_processor", d), av("An event processor returned `null`, will not send event.");
                            return (null == (n = t.data) ? void 0 : n.__sentry__) === !0 ? e : function(e, t) {
                                var n = "".concat(t, " must return `null` or a valid event.");
                                if (ts(e)) return e.then(function(e) {
                                    if (!to(e) && null !== e) throw ap(n);
                                    return e
                                }, function(e) {
                                    throw ap("".concat(t, " rejected with ").concat(e))
                                });
                                if (!to(e) && null !== e) throw ap(n);
                                return e
                            }(function(e, t, n, r) {
                                var a = t.beforeSend,
                                    i = t.beforeSendTransaction,
                                    o = t.ignoreSpans,
                                    u = !ra(t.beforeSendSpan) && t.beforeSendSpan,
                                    s = n;
                                if (a_(s) && a) return a(s, r);
                                if (aE(s)) {
                                    if (u || o) {
                                        var l = (m = (v = null != (f = null == (p = (c = s).contexts) ? void 0 : p.trace) ? f : {}).trace_id, h = v.parent_span_id, g = v.span_id, y = v.status, b = v.origin, _ = v.data, E = v.op, {
                                            data: null != _ ? _ : {},
                                            description: c.transaction,
                                            op: E,
                                            parent_span_id: h,
                                            span_id: null != g ? g : "",
                                            start_timestamp: null != (d = c.start_timestamp) ? d : 0,
                                            status: y,
                                            timestamp: c.timestamp,
                                            trace_id: null != m ? m : "",
                                            origin: b,
                                            profile_id: null == _ ? void 0 : _[nb],
                                            exclusive_time: null == _ ? void 0 : _[n_],
                                            measurements: c.measurements,
                                            is_segment: !0
                                        });
                                        if ((null == o ? void 0 : o.length) && nw(l, o)) return null;
                                        if (u) {
                                            var c, f, d, p, v, m, h, g, y, b, _, E, S = u(l);
                                            S ? s = tY(n, {
                                                type: "transaction",
                                                timestamp: S.timestamp,
                                                start_timestamp: S.start_timestamp,
                                                transaction: S.description,
                                                contexts: {
                                                    trace: {
                                                        trace_id: S.trace_id,
                                                        span_id: S.span_id,
                                                        parent_span_id: S.parent_span_id,
                                                        op: S.op,
                                                        status: S.status,
                                                        origin: S.origin,
                                                        data: eY({}, S.data, S.profile_id && eD({}, nb, S.profile_id), S.exclusive_time && eD({}, n_, S.exclusive_time))
                                                    }
                                                },
                                                measurements: S.measurements
                                            }) : n2()
                                        }
                                        if (s.spans) {
                                            var w = [],
                                                T = s.spans,
                                                I = !0,
                                                N = !1,
                                                A = void 0;
                                            try {
                                                for (var k, x = T[Symbol.iterator](); !(I = (k = x.next()).done); I = !0) {
                                                    var R = k.value;
                                                    if ((null == o ? void 0 : o.length) && nw(R, o)) {
                                                        ! function(e, t) {
                                                            var n = t.parent_span_id,
                                                                r = t.span_id;
                                                            if (n) {
                                                                var a = !0,
                                                                    i = !1,
                                                                    o = void 0;
                                                                try {
                                                                    for (var u, s = e[Symbol.iterator](); !(a = (u = s.next()).done); a = !0) {
                                                                        var l = u.value;
                                                                        l.parent_span_id === r && (l.parent_span_id = n)
                                                                    }
                                                                } catch (e) {
                                                                    i = !0, o = e
                                                                } finally {
                                                                    try {
                                                                        a || null == s.return || s.return()
                                                                    } finally {
                                                                        if (i) throw o
                                                                    }
                                                                }
                                                            }
                                                        }(T, R);
                                                        continue
                                                    }
                                                    if (u) {
                                                        var O = u(R);
                                                        O ? w.push(O) : (n2(), w.push(R))
                                                    } else w.push(R)
                                                }
                                            } catch (e) {
                                                N = !0, A = e
                                            } finally {
                                                try {
                                                    I || null == x.return || x.return()
                                                } finally {
                                                    if (N) throw A
                                                }
                                            }
                                            var V = s.spans.length - w.length;
                                            V && e.recordDroppedEvent("before_send", "span", V), s.spans = w
                                        }
                                    }
                                    if (i) {
                                        if (s.spans) {
                                            var C = s.spans.length;
                                            s.sdkProcessingMetadata = eG(eY({}, n.sdkProcessingMetadata), {
                                                spanCountBeforeProcessing: C
                                            })
                                        }
                                        return i(s, r)
                                    }
                                }
                                return s
                            }(a, i, e, t), c)
                        }).then(function(i) {
                            if (null === i) {
                                if (a.recordDroppedEvent("before_send", d), u) {
                                    var o = 1 + (e.spans || []).length;
                                    a.recordDroppedEvent("before_send", "span", o)
                                }
                                throw av("".concat(c, " returned `null`, will not send event."))
                            }
                            var l = n.getSession() || r.getSession();
                            if (s && l && a._updateSessionFromEvent(l, i), u) {
                                var f, p = ((null == (f = i.sdkProcessingMetadata) ? void 0 : f.spanCountBeforeProcessing) || 0) - (i.spans ? i.spans.length : 0);
                                p > 0 && a.recordDroppedEvent("before_send", "span", p)
                            }
                            var v = i.transaction_info;
                            return u && v && i.transaction !== e.transaction && (i.transaction_info = eG(eY({}, v), {
                                source: "custom"
                            })), a.sendEvent(i, t), i
                        }).then(null, function(e) {
                            if (ah(e) || am(e)) throw e;
                            throw a.captureException(e, {
                                mechanism: {
                                    handled: !1,
                                    type: "internal"
                                },
                                data: {
                                    __sentry__: !0
                                },
                                originalException: e
                            }), ap("Event processing pipeline threw an error, original event will not be sent. Details have been sent as a new event.\nReason: ".concat(e))
                        })
                    }
                }, {
                    key: "_process",
                    value: function(e, t) {
                        var n = this;
                        this._numProcessing++, this._promiseBuffer.add(e).then(function(e) {
                            return n._numProcessing--, e
                        }, function(e) {
                            return n._numProcessing--, e === ao && n.recordDroppedEvent("queue_overflow", t), e
                        })
                    }
                }, {
                    key: "_clearOutcomes",
                    value: function() {
                        var e = this._outcomes;
                        return this._outcomes = {}, Object.entries(e).map(function(e) {
                            var t = eK(e, 2),
                                n = t[0],
                                r = t[1],
                                a = eK(n.split(":"), 2);
                            return {
                                reason: a[0],
                                category: a[1],
                                quantity: r
                            }
                        })
                    }
                }, {
                    key: "_flushOutcomes",
                    value: function() {
                        e4 && tE.log("Flushing outcomes...");
                        var e, t = this._clearOutcomes();
                        if (0 === t.length) {
                            e4 && tE.log("No outcomes to send");
                            return
                        }
                        if (!this._dsn) {
                            e4 && tE.log("No dsn provided, will not send outcomes");
                            return
                        }
                        e4 && tE.log("Sending outcomes:", t);
                        var n = ro((e = this._options.tunnel && n4(this._dsn)) ? {
                            dsn: e
                        } : {}, [
                            [{
                                type: "client_report"
                            }, {
                                timestamp: tP(),
                                discarded_events: t
                            }]
                        ]);
                        this.sendEnvelope(n)
                    }
                }]), e
            }();

            function ab(e) {
                return "replay_event" === e ? "replay" : e || "error"
            }

            function a_(e) {
                return void 0 === e.type
            }

            function aE(e) {
                return "transaction" === e.type
            }

            function aS(e) {
                var t = 0;
                return e.name && (t += 2 * e.name.length), (t += 8) + aT(e.attributes)
            }

            function aw(e) {
                var t = 0;
                return e.message && (t += 2 * e.message.length), t + aT(e.attributes)
            }

            function aT(e) {
                if (!e) return 0;
                var t = 0;
                return Object.values(e).forEach(function(e) {
                    Array.isArray(e) ? t += e.length * aI(e[0]) : ti(e) ? t += aI(e) : t += 100
                }), t
            }

            function aI(e) {
                return "string" == typeof e ? 2 * e.length : "number" == typeof e ? 8 : 4 * ("boolean" == typeof e)
            }

            function aN(e) {
                return e7(e) && "__sentry_fetch_url_host__" in e && "string" == typeof e.__sentry_fetch_url_host__ ? "".concat(e.message, " (").concat(e.__sentry_fetch_url_host__, ")") : e.message
            }

            function aA(e, t) {
                var n, r, a, i, o = ax(e, t),
                    u = {
                        type: !(r = null == (n = t) ? void 0 : n.name) && aO(n) ? n.message && Array.isArray(n.message) && 2 == n.message.length ? n.message[0] : "WebAssembly.Exception" : r,
                        value: (i = null == (a = t) ? void 0 : a.message, aO(a) ? Array.isArray(a.message) && 2 == a.message.length ? a.message[1] : "wasm exception" : i ? i.error && "string" == typeof i.error.message ? aN(i.error) : aN(a) : "No error message")
                    };
                return o.length && (u.stacktrace = {
                    frames: o
                }), void 0 === u.type && "" === u.value && (u.value = "Unrecoverable error caught"), u
            }

            function ak(e, t) {
                return {
                    exception: {
                        values: [aA(e, t)]
                    }
                }
            }

            function ax(e, t) {
                var n, r, a = t.stacktrace || t.stack || "",
                    i = (n = t) && aR.test(n.message) ? 1 : 0,
                    o = "number" == typeof(r = t).framesToPop ? r.framesToPop : 0;
                try {
                    return e(a, i, o)
                } catch (e) {}
                return []
            }
            var aR = /Minified React error #\d+;/i;

            function aO(e) {
                return "u" > typeof WebAssembly && void 0 !== WebAssembly.Exception && (0, eW._)(e, WebAssembly.Exception)
            }

            function aV(e, t, n, r, a) {
                var i;
                if (tt(t) && t.error) return ak(e, t.error);
                if (tn(t) || te(t, "DOMException")) {
                    if ("stack" in t) i = ak(e, t);
                    else {
                        var o = t.name || (tn(t) ? "DOMError" : "DOMException"),
                            u = t.message ? "".concat(o, ": ").concat(t.message) : o;
                        tB(i = aC(e, u, n, r), u)
                    }
                    return "code" in t && (i.tags = eG(eY({}, i.tags), {
                        "DOMException.code": "".concat(t.code)
                    })), i
                }
                return e7(t) ? ak(e, t) : (to(t) || tu(t) ? tL(i = function(e, t, n, r) {
                    var a = nl(),
                        i = null == a ? void 0 : a.getOptions().normalizeDepth,
                        o = Object.values(t).find(function(e) {
                            return (0, eW._)(e, Error)
                        }),
                        u = {
                            __serialized__: function e(t) {
                                var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 3,
                                    r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 102400,
                                    a = ri(t, n);
                                return ~-encodeURI(JSON.stringify(a)).split(/%..|./).length > r ? e(t, n - 1, r) : a
                            }(t, i)
                        };
                    if (o) return {
                        exception: {
                            values: [aA(e, o)]
                        },
                        extra: u
                    };
                    var s = {
                        exception: {
                            values: [{
                                type: tu(t) ? t.constructor.name : r ? "UnhandledRejection" : "Error",
                                value: function(e, t) {
                                    var n, r = t.isUnhandledRejection,
                                        a = ((n = Object.keys(tN(e))).sort(), n[0] ? n.join(", ") : "[object has no keys]"),
                                        i = r ? "promise rejection" : "exception";
                                    if (tt(e)) return "Event `ErrorEvent` captured as ".concat(i, " with message `").concat(e.message, "`");
                                    if (tu(e)) {
                                        var o = function(e) {
                                            try {
                                                var t = Object.getPrototypeOf(e);
                                                return t ? t.constructor.name : void 0
                                            } catch (e) {}
                                        }(e);
                                        return "Event `".concat(o, "` (type=").concat(e.type, ") captured as ").concat(i)
                                    }
                                    return "Object captured as ".concat(i, " with keys: ").concat(a)
                                }(t, {
                                    isUnhandledRejection: r
                                })
                            }]
                        },
                        extra: u
                    };
                    if (n) {
                        var l = ax(e, n);
                        l.length && (s.exception.values[0].stacktrace = {
                            frames: l
                        })
                    }
                    return s
                }(e, t, n, a), {
                    synthetic: !0
                }) : (tB(i = aC(e, t, n, r), "".concat(t), void 0), tL(i, {
                    synthetic: !0
                })), i)
            }

            function aC(e, t, n, r) {
                var a = {};
                if (r && n) {
                    var i = ax(e, n);
                    i.length && (a.exception = {
                        values: [{
                            value: t,
                            stacktrace: {
                                frames: i
                            }
                        }]
                    }), tL(a, {
                        synthetic: !0
                    })
                }
                return ta(t) ? a.logentry = {
                    message: t.__sentry_template_string__,
                    params: t.__sentry_template_values__
                } : a.message = t, a
            }
            var aZ = 0;

            function aB(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                if ("function" != typeof e) return e;
                try {
                    var n = e.__sentry_wrapped__;
                    if (n)
                        if ("function" == typeof n) return n;
                        else return e;
                    if (tI(e)) return e
                } catch (t) {
                    return e
                }
                var r = function() {
                    for (var n = arguments.length, r = Array(n), a = 0; a < n; a++) r[a] = arguments[a];
                    try {
                        var i = r.map(function(e) {
                            return aB(e, t)
                        });
                        return e.apply(this, i)
                    } catch (e) {
                        throw aZ++, setTimeout(function() {
                            aZ--
                        }), ns(function(n) {
                            n.addEventProcessor(function(e) {
                                return t.mechanism && (tB(e, void 0, void 0), tL(e, t.mechanism)), e.extra = eG(eY({}, e.extra), {
                                    arguments: r
                                }), e
                            }), rB(e)
                        }), e
                    }
                };
                try {
                    for (var a in e) Object.prototype.hasOwnProperty.call(e, a) && (r[a] = e[a])
                } catch (e) {}
                tT(r, e), tw(e, "__sentry_wrapped__", r);
                try {
                    Object.getOwnPropertyDescriptor(r, "name").configurable && Object.defineProperty(r, "name", {
                        get: function() {
                            return e.name
                        }
                    })
                } catch (e) {}
                return r
            }

            function aL() {
                var e = tp(),
                    t = (eQ.document || {}).referrer,
                    n = (eQ.navigator || {}).userAgent;
                return {
                    url: e,
                    headers: eY({}, t && {
                        Referer: t
                    }, n && {
                        "User-Agent": n
                    })
                }
            }
            var aF = function(e) {
                    function t(e) {
                        e1(this, t);
                        var n, r, a, i, o, u = (n = e, eY({
                            release: "string" == typeof __SENTRY_RELEASE__ ? __SENTRY_RELEASE__ : null == (r = eQ.SENTRY_RELEASE) ? void 0 : r.id,
                            sendClientReports: !0,
                            parentSpanIsAlwaysRootSpan: !0
                        }, n));
                        ! function(e, t) {
                            var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : [t],
                                r = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : "npm",
                                a = (e._metadata = e._metadata || {}).sdk = e._metadata.sdk || {};
                            a.name || (a.name = "sentry.javascript.".concat(t), a.packages = n.map(function(e) {
                                return {
                                    name: "".concat(r, ":@sentry/").concat(e),
                                    version: eH
                                }
                            }), a.version = eH)
                        }(u, "browser", ["browser"], eQ.SENTRY_SDK_SOURCE || (0, r6.e)()), (null == (o = u._metadata) ? void 0 : o.sdk) && (u._metadata.sdk.settings = eY({
                            infer_ip: u.sendDefaultPii ? "auto" : "never"
                        }, u._metadata.sdk.settings));
                        var s = (a = r5(this, t, [u]))._options,
                            l = s.sendDefaultPii,
                            c = s.sendClientReports,
                            f = s.enableLogs,
                            d = s._experiments,
                            p = s.enableMetrics,
                            v = null == (i = null != p ? p : null == d ? void 0 : d.enableMetrics) || i;
                        return eQ.document && (c || f || v) && eQ.document.addEventListener("visibilitychange", function() {
                            "hidden" === eQ.document.visibilityState && (c && a._flushOutcomes(), f && r7(a), v && at(a))
                        }), l && a.on("beforeSendSession", ar), a
                    }
                    return r8(t, e), e3(t, [{
                        key: "eventFromException",
                        value: function(e, t) {
                            var n, r, a;
                            return n = this._options.stackParser, r = this._options.attachStacktrace, tL(a = aV(n, e, (null == t ? void 0 : t.syntheticException) || void 0, r)), a.level = "error", (null == t ? void 0 : t.event_id) && (a.event_id = t.event_id), rk(a)
                        }
                    }, {
                        key: "eventFromMessage",
                        value: function(e) {
                            var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "info",
                                n = arguments.length > 2 ? arguments[2] : void 0;
                            return function(e, t) {
                                var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "info",
                                    r = arguments.length > 3 ? arguments[3] : void 0,
                                    a = arguments.length > 4 ? arguments[4] : void 0,
                                    i = aC(e, t, (null == r ? void 0 : r.syntheticException) || void 0, a);
                                return i.level = n, (null == r ? void 0 : r.event_id) && (i.event_id = r.event_id), rk(i)
                            }(this._options.stackParser, e, t, n, this._options.attachStacktrace)
                        }
                    }, {
                        key: "_prepareEvent",
                        value: function(e, n, r, a) {
                            return e.platform = e.platform || "javascript", r9(r2(t.prototype), "_prepareEvent", this).call(this, e, n, r, a)
                        }
                    }]), t
                }(ay),
                aP = {},
                aX = {};

            function aU(e, t) {
                aP[e] = aP[e] || [], aP[e].push(t)
            }

            function aW(e, t) {
                if (!aX[e]) {
                    aX[e] = !0;
                    try {
                        t()
                    } catch (t) {
                        e4 && tE.error("Error while instrumenting ".concat(e), t)
                    }
                }
            }

            function aD(e, t) {
                var n = e && aP[e];
                if (n) {
                    var r = !0,
                        a = !1,
                        i = void 0;
                    try {
                        for (var o, u = n[Symbol.iterator](); !(r = (o = u.next()).done); r = !0) {
                            var s = o.value;
                            try {
                                s(t)
                            } catch (t) {
                                e4 && tE.error("Error while triggering instrumentation handler.\nType: ".concat(e, "\nName: ").concat(tq(s), "\nError:"), t)
                            }
                        }
                    } catch (e) {
                        a = !0, i = e
                    } finally {
                        try {
                            r || null == u.return || u.return()
                        } finally {
                            if (a) throw i
                        }
                    }
                }
            }

            function aY() {
                "console" in eQ && tm.forEach(function(e) {
                    e in eQ.console && tS(eQ.console, e, function(t) {
                        return th[e] = t,
                            function() {
                                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                aD("console", {
                                    args: n,
                                    level: e
                                });
                                var a = th[e];
                                null == a || a.apply(eQ.console, n)
                            }
                    })
                })
            }

            function aG(e) {
                return e && /^function\s+\w+\(\)\s+\{\s+\[native code\]\s+\}$/.test(e.toString())
            }

            function aj(e, t) {
                var n = "fetch";
                aU(n, e), aW(n, function() {
                    return aM(void 0, t)
                })
            }

            function aM(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
                (!t || function() {
                    if ("string" == typeof EdgeRuntime) return !0;
                    if (! function() {
                            if (!("fetch" in eQ)) return !1;
                            try {
                                return new Headers, new Request("data:,"), new Response, !0
                            } catch (e) {
                                return !1
                            }
                        }()) return !1;
                    if (aG(eQ.fetch)) return !0;
                    var e = !1,
                        t = eQ.document;
                    if (t && "function" == typeof t.createElement) try {
                        var n, r = t.createElement("iframe");
                        r.hidden = !0, t.head.appendChild(r), (null == (n = r.contentWindow) ? void 0 : n.fetch) && (e = aG(r.contentWindow.fetch)), t.head.removeChild(r)
                    } catch (e) {
                        e4 && tE.warn("Could not create sandbox iframe for pure fetch check, bailing to window.fetch: ", e)
                    }
                    return e
                }()) && tS(eQ, "fetch", function(t) {
                    return function() {
                        for (var n = arguments.length, r = Array(n), a = 0; a < n; a++) r[a] = arguments[a];
                        var i = Error(),
                            o = function(e) {
                                if (0 === e.length) return {
                                    method: "GET",
                                    url: ""
                                };
                                if (2 === e.length) {
                                    var t = eK(e, 2),
                                        n = t[0],
                                        r = t[1];
                                    return {
                                        url: aK(n),
                                        method: aJ(r, "method") ? String(r.method).toUpperCase() : tf(n) && aJ(n, "method") ? String(n.method).toUpperCase() : "GET"
                                    }
                                }
                                var a = e[0];
                                return {
                                    url: aK(a),
                                    method: aJ(a, "method") ? String(a.method).toUpperCase() : "GET"
                                }
                            }(r),
                            u = {
                                args: r,
                                fetchData: {
                                    method: o.method,
                                    url: o.url
                                },
                                startTimestamp: 1e3 * tX(),
                                virtualError: i,
                                headers: function(e) {
                                    var t = eK(e, 2),
                                        n = t[0],
                                        r = t[1];
                                    try {
                                        if ((void 0 === r ? "undefined" : (0, e8._)(r)) === "object" && null !== r && "headers" in r && r.headers) return new Headers(r.headers);
                                        if (tf(n)) return new Headers(n.headers)
                                    } catch (e) {}
                                }(r)
                            };
                        return e || aD("fetch", eY({}, u)), t.apply(eQ, r).then(function(t) {
                            return rN(function() {
                                return rA(this, function(n) {
                                    return e ? e(t) : aD("fetch", eG(eY({}, u), {
                                        endTimestamp: 1e3 * tX(),
                                        response: t
                                    })), [2, t]
                                })
                            })()
                        }, function(e) {
                            aD("fetch", eG(eY({}, u), {
                                endTimestamp: 1e3 * tX(),
                                error: e
                            })), e7(e) && void 0 === e.stack && (e.stack = i.stack, tw(e, "framesToPop", 1));
                            var t, n = nl(),
                                r = null != (t = null == n ? void 0 : n.getOptions().enhanceFetchErrorMessages) ? t : "always";
                            if (!1 !== r && (0, eW._)(e, TypeError) && ("Failed to fetch" === e.message || "Load failed" === e.message || "NetworkError when attempting to fetch resource." === e.message)) try {
                                var a = new URL(u.fetchData.url).host;
                                "always" === r ? e.message = "".concat(e.message, " (").concat(a, ")") : tw(e, "__sentry_fetch_url_host__", a)
                            } catch (e) {}
                            throw e
                        })
                    }
                })
            }

            function az(e) {
                var t, n, r;
                try {
                    t = e.clone()
                } catch (e) {
                    return
                }
                n = t, r = function() {
                    aD("fetch-body-resolved", {
                        endTimestamp: 1e3 * tX(),
                        response: e
                    })
                }, rN(function() {
                    var e, t, a, i, o, u;
                    return rA(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (!(null == n ? void 0 : n.body)) return [3, 8];
                                t = (e = n.body).getReader(), a = setTimeout(function() {
                                    e.cancel().then(null, function() {})
                                }, 9e4), i = !0, s.label = 1;
                            case 1:
                                if (!i) return [3, 7];
                                o = void 0, s.label = 2;
                            case 2:
                                return s.trys.push([2, 4, 5, 6]), o = setTimeout(function() {
                                    e.cancel().then(null, function() {})
                                }, 5e3), [4, t.read()];
                            case 3:
                                return u = s.sent().done, clearTimeout(o), u && (r(), i = !1), [3, 6];
                            case 4:
                                return s.sent(), i = !1, [3, 6];
                            case 5:
                                return clearTimeout(o), [7];
                            case 6:
                                return [3, 1];
                            case 7:
                                clearTimeout(a), t.releaseLock(), e.cancel().then(null, function() {}), s.label = 8;
                            case 8:
                                return [2]
                        }
                    })
                })()
            }

            function aJ(e, t) {
                return !!e && (void 0 === e ? "undefined" : (0, e8._)(e)) === "object" && !!e[t]
            }

            function aK(e) {
                return "string" == typeof e ? e : e ? aJ(e, "url") ? e.url : e.toString ? e.toString() : "" : ""
            }

            function aH(e, t) {
                var n = nl(),
                    r = nu();
                if (n) {
                    var a = n.getOptions(),
                        i = a.beforeBreadcrumb,
                        o = void 0 === i ? null : i,
                        u = a.maxBreadcrumbs,
                        s = void 0 === u ? 100 : u;
                    if (!(s <= 0)) {
                        var l = eY({
                                timestamp: tP()
                            }, e),
                            c = o ? tg(function() {
                                return o(l, t)
                            }) : l;
                        null !== c && (n.emit && n.emit("beforeAddBreadcrumb", c, t), r.addBreadcrumb(c, s))
                    }
                }
            }

            function aQ(e) {
                if (void 0 !== e) return e >= 400 && e < 500 ? "warning" : e >= 500 ? "error" : void 0
            }

            function aq(e) {
                return "isRelative" in e
            }

            function a$(e, t) {
                var n = 0 >= e.indexOf("://") && 0 !== e.indexOf("//"),
                    r = null != t ? t : n ? "thismessage:/" : void 0;
                try {
                    if ("canParse" in URL && !URL.canParse(e, r)) return;
                    var a = new URL(e, r);
                    if (n) return {
                        isRelative: n,
                        pathname: a.pathname,
                        search: a.search,
                        hash: a.hash
                    };
                    return a
                } catch (e) {}
            }

            function a0(e) {
                if (!e) return {};
                var t = e.match(/^(([^:/?#]+):)?(\/\/([^/?#]*))?([^?#]*)(\?([^#]*))?(#(.*))?$/);
                if (!t) return {};
                var n = t[6] || "",
                    r = t[8] || "";
                return {
                    host: t[4],
                    path: t[5],
                    protocol: t[2],
                    search: n,
                    hash: r,
                    relative: t[5] + n + r
                }
            }

            function a1(e) {
                var t = !(arguments.length > 1) || void 0 === arguments[1] || arguments[1];
                if (e.startsWith("data:")) {
                    var n = e.match(/^data:([^;,]+)/),
                        r = n ? n[1] : "text/plain",
                        a = e.includes(";base64,"),
                        i = e.indexOf(","),
                        o = "";
                    if (t && -1 !== i) {
                        var u = e.slice(i + 1);
                        o = u.length > 10 ? "".concat(u.slice(0, 10), "... [truncated]") : u
                    }
                    return "data:".concat(r).concat(a ? ",base64" : "").concat(o ? ",".concat(o) : "")
                }
                return e
            }

            function a2() {
                if (eQ.document) {
                    var e = aD.bind(null, "dom"),
                        t = a3(e, !0);
                    eQ.document.addEventListener("click", t, !1), eQ.document.addEventListener("keypress", t, !1), ["EventTarget", "Node"].forEach(function(t) {
                        var n, r, a = null == (n = eQ[t]) ? void 0 : n.prototype;
                        (null == a || null == (r = a.hasOwnProperty) ? void 0 : r.call(a, "addEventListener")) && (tS(a, "addEventListener", function(t) {
                            return function(n, r, a) {
                                if ("click" === n || "keypress" == n) try {
                                    var i = this.__sentry_instrumentation_handlers__ = this.__sentry_instrumentation_handlers__ || {},
                                        o = i[n] = i[n] || {
                                            refCount: 0
                                        };
                                    if (!o.handler) {
                                        var u = a3(e);
                                        o.handler = u, t.call(this, n, u, a)
                                    }
                                    o.refCount++
                                } catch (e) {}
                                return t.call(this, n, r, a)
                            }
                        }), tS(a, "removeEventListener", function(e) {
                            return function(t, n, r) {
                                if ("click" === t || "keypress" == t) try {
                                    var a = this.__sentry_instrumentation_handlers__ || {},
                                        i = a[t];
                                    i && (i.refCount--, i.refCount <= 0 && (e.call(this, t, i.handler, r), i.handler = void 0, delete a[t]), 0 === Object.keys(a).length && delete this.__sentry_instrumentation_handlers__)
                                } catch (e) {}
                                return e.call(this, t, n, r)
                            }
                        }))
                    })
                }
            }

            function a3(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
                return function(n) {
                    if (n && !n._sentryCaptured) {
                        var r, a = function(e) {
                            try {
                                return e.target
                            } catch (e) {
                                return null
                            }
                        }(n);
                        if (r = n.type, "keypress" !== r || null != a && a.tagName && ("INPUT" === a.tagName || "TEXTAREA" === a.tagName || a.isContentEditable || 0)) {
                            tw(n, "_sentryCaptured", !0), a && !a._sentryId && tw(a, "_sentryId", tV());
                            var i = "keypress" === n.type ? "input" : n.type;
                            ! function(e) {
                                if (e.type !== et) return !1;
                                try {
                                    if (!e.target || e.target._sentryId !== en) return !1
                                } catch (e) {}
                                return !0
                            }(n) && (e({
                                event: n,
                                name: i,
                                global: t
                            }), et = n.type, en = a ? a._sentryId : void 0), clearTimeout(ee), ee = eQ.setTimeout(function() {
                                en = void 0, et = void 0
                            }, 1e3)
                        }
                    }
                }
            }
            var a5 = "__sentry_xhr_v3__";

            function a9(e) {
                aU("xhr", e), aW("xhr", a4)
            }

            function a4() {
                if (eQ.XMLHttpRequest) {
                    var e = XMLHttpRequest.prototype;
                    e.open = new Proxy(e.open, {
                        apply: function(e, t, n) {
                            var r = Error(),
                                a = 1e3 * tX(),
                                i = tr(n[0]) ? n[0].toUpperCase() : void 0,
                                o = function(e) {
                                    if (tr(e)) return e;
                                    try {
                                        return e.toString()
                                    } catch (e) {}
                                }(n[1]);
                            if (!i || !o) return e.apply(t, n);
                            t[a5] = {
                                method: i,
                                url: o,
                                request_headers: {}
                            }, "POST" === i && o.match(/sentry_key/) && (t.__sentry_own_request__ = !0);
                            var u = function() {
                                var e = t[a5];
                                if (e && 4 === t.readyState) {
                                    try {
                                        e.status_code = t.status
                                    } catch (e) {}
                                    aD("xhr", {
                                        endTimestamp: 1e3 * tX(),
                                        startTimestamp: a,
                                        xhr: t,
                                        virtualError: r
                                    })
                                }
                            };
                            return "onreadystatechange" in t && "function" == typeof t.onreadystatechange ? t.onreadystatechange = new Proxy(t.onreadystatechange, {
                                apply: function(e, t, n) {
                                    return u(), e.apply(t, n)
                                }
                            }) : t.addEventListener("readystatechange", u), t.setRequestHeader = new Proxy(t.setRequestHeader, {
                                apply: function(e, t, n) {
                                    var r = eK(n, 2),
                                        a = r[0],
                                        i = r[1],
                                        o = t[a5];
                                    return o && tr(a) && tr(i) && (o.request_headers[a.toLowerCase()] = i), e.apply(t, n)
                                }
                            }), e.apply(t, n)
                        }
                    }), e.send = new Proxy(e.send, {
                        apply: function(e, t, n) {
                            var r = t[a5];
                            return r && (void 0 !== n[0] && (r.body = n[0]), aD("xhr", {
                                startTimestamp: 1e3 * tX(),
                                xhr: t
                            })), e.apply(t, n)
                        }
                    })
                }
            }

            function a8(e) {
                var t = "history";
                aU(t, e), aW(t, a6)
            }

            function a6() {
                function e(e) {
                    return function() {
                        for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                        var a = n.length > 2 ? n[2] : void 0;
                        if (a) {
                            var i = er,
                                o = function(e) {
                                    try {
                                        return new URL(e, eQ.location.origin).toString()
                                    } catch (t) {
                                        return e
                                    }
                                }(String(a));
                            if (er = o, i === o) return e.apply(this, n);
                            aD("history", {
                                from: i,
                                to: o
                            })
                        }
                        return e.apply(this, n)
                    }
                }
                eQ.addEventListener("popstate", function() {
                    var e = eQ.location.href,
                        t = er;
                    er = e, t !== e && aD("history", {
                        from: t,
                        to: e
                    })
                }), "history" in eQ && eQ.history && (tS(eQ.history, "pushState", e), tS(eQ.history, "replaceState", e))
            }
            var a7 = "u" < typeof __SENTRY_DEBUG__ || __SENTRY_DEBUG__,
                ie = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        t = eY({
                            console: !0,
                            dom: !0,
                            fetch: !0,
                            history: !0,
                            sentry: !0,
                            xhr: !0
                        }, e);
                    return {
                        name: "Breadcrumbs",
                        setup: function(e) {
                            var n, r, a, i, o, u, s;
                            t.console && (n = e, aU("console", function(e) {
                                if (nl() === n) {
                                    var t, r = {
                                        category: "console",
                                        data: {
                                            arguments: e.args,
                                            logger: "console"
                                        },
                                        level: "warn" === (t = e.level) ? "warning" : ["fatal", "error", "warning", "log", "info", "debug"].includes(t) ? t : "log",
                                        message: t2(e.args, " ")
                                    };
                                    if ("assert" === e.level)
                                        if (!1 !== e.args[0]) return;
                                        else r.message = "Assertion failed: ".concat(t2(e.args.slice(1), " ") || "console.assert"), r.data.arguments = e.args.slice(1);
                                    aH(r, {
                                        input: e.args,
                                        level: e.level
                                    })
                                }
                            }), aW("console", aY)), t.dom && (aU("dom", (r = e, a = t.dom, function(e) {
                                if (nl() === r) {
                                    var t, n, i = (void 0 === a ? "undefined" : (0, e8._)(a)) === "object" ? a.serializeAttribute : void 0,
                                        o = (void 0 === a ? "undefined" : (0, e8._)(a)) === "object" && "number" == typeof a.maxStringLength ? a.maxStringLength : void 0;
                                    o && o > 1024 && (a7 && tE.warn("`dom.maxStringLength` cannot exceed ".concat(1024, ", but a value of ").concat(o, " was configured. Sentry will use ").concat(1024, " instead.")), o = 1024), "string" == typeof i && (i = [i]);
                                    try {
                                        var u, s = e.event,
                                            l = (u = s) && u.target ? s.target : s;
                                        t = td(l, {
                                            keyAttrs: i,
                                            maxStringLength: o
                                        }), n = tv(l)
                                    } catch (e) {
                                        t = "<unknown>"
                                    }
                                    if (0 !== t.length) {
                                        var c = {
                                            category: "ui.".concat(e.name),
                                            message: t
                                        };
                                        n && (c.data = {
                                            "ui.component_name": n
                                        }), aH(c, {
                                            event: e.event,
                                            name: e.name,
                                            global: e.global
                                        })
                                    }
                                }
                            })), aW("dom", a2)), t.xhr && a9((i = e, function(e) {
                                if (nl() === i) {
                                    var t = e.startTimestamp,
                                        n = e.endTimestamp,
                                        r = e.xhr[a5];
                                    if (t && n && r) {
                                        var a = r.method,
                                            o = r.url,
                                            u = r.status_code,
                                            s = r.body,
                                            l = {
                                                xhr: e.xhr,
                                                input: s,
                                                startTimestamp: t,
                                                endTimestamp: n
                                            },
                                            c = {
                                                category: "xhr",
                                                data: {
                                                    method: a,
                                                    url: o,
                                                    status_code: u
                                                },
                                                type: "http",
                                                level: aQ(u)
                                            };
                                        i.emit("beforeOutgoingRequestBreadcrumb", c, l), aH(c, l)
                                    }
                                }
                            })), t.fetch && aj((o = e, function(e) {
                                if (nl() === o) {
                                    var t = e.startTimestamp,
                                        n = e.endTimestamp;
                                    if (n && (!e.fetchData.url.match(/sentry_key/) || "POST" !== e.fetchData.method))
                                        if (e.error) {
                                            var r = {
                                                    data: e.error,
                                                    input: e.args,
                                                    startTimestamp: t,
                                                    endTimestamp: n
                                                },
                                                a = {
                                                    category: "fetch",
                                                    data: e.fetchData,
                                                    level: "error",
                                                    type: "http"
                                                };
                                            o.emit("beforeOutgoingRequestBreadcrumb", a, r), aH(a, r)
                                        } else {
                                            var i = e.response,
                                                u = eG(eY({}, e.fetchData), {
                                                    status_code: null == i ? void 0 : i.status
                                                }),
                                                s = {
                                                    input: e.args,
                                                    response: i,
                                                    startTimestamp: t,
                                                    endTimestamp: n
                                                },
                                                l = {
                                                    category: "fetch",
                                                    data: u,
                                                    type: "http",
                                                    level: aQ(u.status_code)
                                                };
                                            o.emit("beforeOutgoingRequestBreadcrumb", l, s), aH(l, s)
                                        }
                                }
                            })), t.history && a8((u = e, function(e) {
                                if (nl() === u) {
                                    var t = e.from,
                                        n = e.to,
                                        r = a0(eQ.location.href),
                                        a = t ? a0(t) : void 0,
                                        i = a0(n);
                                    (null == a ? void 0 : a.path) || (a = r), r.protocol === i.protocol && r.host === i.host && (n = i.relative), r.protocol === a.protocol && r.host === a.host && (t = a.relative), aH({
                                        category: "navigation",
                                        data: {
                                            from: t,
                                            to: n
                                        }
                                    })
                                }
                            })), t.sentry && e.on("beforeSendEvent", (s = e, function(e) {
                                nl() === s && aH({
                                    category: "sentry.".concat("transaction" === e.type ? "transaction" : "event"),
                                    event_id: e.event_id,
                                    level: e.level,
                                    message: tZ(e)
                                }, {
                                    event: e
                                })
                            }))
                        }
                    }
                },
                it = "EventTarget,Window,Node,ApplicationCache,AudioTrackList,BroadcastChannel,ChannelMergerNode,CryptoOperation,EventSource,FileReader,HTMLUnknownElement,IDBDatabase,IDBRequest,IDBTransaction,KeyOperation,MediaController,MessagePort,ModalWindow,Notification,SVGElementInstance,Screen,SharedWorker,TextTrack,TextTrackCue,TextTrackList,WebSocket,WebSocketWorker,Worker,XMLHttpRequest,XMLHttpRequestEventTarget,XMLHttpRequestUpload".split(","),
                ir = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        t = eY({
                            XMLHttpRequest: !0,
                            eventTarget: !0,
                            requestAnimationFrame: !0,
                            setInterval: !0,
                            setTimeout: !0,
                            unregisterOriginalCallbacks: !1
                        }, e);
                    return {
                        name: "BrowserApiErrors",
                        setupOnce: function() {
                            t.setTimeout && tS(eQ, "setTimeout", ia), t.setInterval && tS(eQ, "setInterval", ia), t.requestAnimationFrame && tS(eQ, "requestAnimationFrame", ii), t.XMLHttpRequest && "XMLHttpRequest" in eQ && tS(XMLHttpRequest.prototype, "send", io);
                            var e = t.eventTarget;
                            e && (Array.isArray(e) ? e : it).forEach(function(e) {
                                var n, r, a, i, o;
                                return n = e, r = t, void((null == (o = null == (a = eQ[n]) ? void 0 : a.prototype) || null == (i = o.hasOwnProperty) ? void 0 : i.call(o, "addEventListener")) && (tS(o, "addEventListener", function(e) {
                                    return function(t, a, i) {
                                        var o, u, s, l;
                                        try {
                                            o = a, "function" == typeof o.handleEvent && (a.handleEvent = aB(a.handleEvent, {
                                                mechanism: {
                                                    data: {
                                                        handler: tq(a),
                                                        target: n
                                                    },
                                                    handled: !1,
                                                    type: "auto.browser.browserapierrors.handleEvent"
                                                }
                                            }))
                                        } catch (e) {}
                                        return r.unregisterOriginalCallbacks && (u = this, s = t, l = a, u && (void 0 === u ? "undefined" : (0, e8._)(u)) === "object" && "removeEventListener" in u && "function" == typeof u.removeEventListener && u.removeEventListener(s, l)), e.apply(this, [t, aB(a, {
                                            mechanism: {
                                                data: {
                                                    handler: tq(a),
                                                    target: n
                                                },
                                                handled: !1,
                                                type: "auto.browser.browserapierrors.addEventListener"
                                            }
                                        }), i])
                                    }
                                }), tS(o, "removeEventListener", function(e) {
                                    return function(t, n, r) {
                                        try {
                                            var a = n.__sentry_wrapped__;
                                            a && e.call(this, t, a, r)
                                        } catch (e) {}
                                        return e.call(this, t, n, r)
                                    }
                                })))
                            })
                        }
                    }
                };

            function ia(e) {
                return function() {
                    for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                    var a = n[0];
                    return n[0] = aB(a, {
                        mechanism: {
                            handled: !1,
                            type: "auto.browser.browserapierrors.".concat(tq(e))
                        }
                    }), e.apply(this, n)
                }
            }

            function ii(e) {
                return function(t) {
                    return e.apply(this, [aB(t, {
                        mechanism: {
                            data: {
                                handler: tq(e)
                            },
                            handled: !1,
                            type: "auto.browser.browserapierrors.requestAnimationFrame"
                        }
                    })])
                }
            }

            function io(e) {
                return function() {
                    for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                    var a = this;
                    return ["onload", "onerror", "onprogress", "onreadystatechange"].forEach(function(e) {
                        e in a && "function" == typeof a[e] && tS(a, e, function(t) {
                            var n = {
                                    mechanism: {
                                        data: {
                                            handler: tq(t)
                                        },
                                        handled: !1,
                                        type: "auto.browser.browserapierrors.xhr.".concat(e)
                                    }
                                },
                                r = tI(t);
                            return r && (n.mechanism.data.handler = tq(r)), aB(t, n)
                        })
                    }), e.apply(this, n)
                }
            }
            var iu = function() {
                var e, t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                    n = null != (e = t.lifecycle) ? e : "route";
                return {
                    name: "BrowserSession",
                    setupOnce: function() {
                        if (void 0 === eQ.document) {
                            a7 && tE.warn("Using the `browserSessionIntegration` in non-browser environments is not supported.");
                            return
                        }
                        rP({
                            ignoreDuration: !0
                        }), rW();
                        var e = nu(),
                            t = e.getUser();
                        e.addScopeListener(function(e) {
                            var n = e.getUser();
                            ((null == t ? void 0 : t.id) !== (null == n ? void 0 : n.id) || (null == t ? void 0 : t.ip_address) !== (null == n ? void 0 : n.ip_address)) && (rW(), t = n)
                        }), "route" === n && a8(function(e) {
                            e.from !== e.to && (rP({
                                ignoreDuration: !0
                            }), rW())
                        })
                    }
                }
            };

            function is() {
                try {
                    var e = eQ.Intl;
                    if (!e) return;
                    var t = e.DateTimeFormat().resolvedOptions();
                    return {
                        locale: t.locale,
                        timezone: t.timeZone,
                        calendar: t.calendar
                    }
                } catch (e) {
                    return
                }
            }
            var il = null;

            function ic(e) {
                var t = "error";
                aU(t, e), aW(t, id)
            }

            function id() {
                il = eQ.onerror, eQ.onerror = function(e, t, n, r, a) {
                    return aD("error", {
                        column: r,
                        error: a,
                        line: n,
                        msg: e,
                        url: t
                    }), !!il && il.apply(this, arguments)
                }, eQ.onerror.__SENTRY_INSTRUMENTED__ = !0
            }
            var ip = null;

            function iv(e) {
                var t = "unhandledrejection";
                aU(t, e), aW(t, im)
            }

            function im() {
                ip = eQ.onunhandledrejection, eQ.onunhandledrejection = function(e) {
                    return aD("unhandledrejection", e), !ip || ip.apply(this, arguments)
                }, eQ.onunhandledrejection.__SENTRY_INSTRUMENTED__ = !0
            }
            var ih = function() {
                var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                    t = eY({
                        onerror: !0,
                        onunhandledrejection: !0
                    }, e);
                return {
                    name: "GlobalHandlers",
                    setupOnce: function() {
                        Error.stackTraceLimit = 50
                    },
                    setup: function(e) {
                        var n, r;
                        t.onerror && (n = e, ic(function(e) {
                            var t = iy(),
                                r = t.stackParser,
                                a = t.attachStacktrace;
                            if (!(nl() !== n || aZ > 0)) {
                                var i, o, u, s, l, c, f, d, p, v, m = e.msg,
                                    h = e.url,
                                    g = e.line,
                                    y = e.column,
                                    b = e.error,
                                    _ = (i = aV(r, b || m, void 0, a, !1), o = h, u = g, s = y, 0 === (v = (p = (d = (f = (c = i.exception = i.exception || {}).values = c.values || [])[0] = f[0] || {}).stacktrace = d.stacktrace || {}).frames = p.frames || []).length && v.push({
                                        colno: s,
                                        lineno: u,
                                        filename: null != (l = function(e) {
                                            if (tr(e) && 0 !== e.length) return e.startsWith("data:") ? "<".concat(a1(e, !1), ">") : e
                                        }(o)) ? l : tp(),
                                        function: "?",
                                        in_app: !0
                                    }), i);
                                _.level = "error", rL(_, {
                                    originalException: b,
                                    mechanism: {
                                        handled: !1,
                                        type: "auto.browser.global_handlers.onerror"
                                    }
                                })
                            }
                        }), ig("onerror")), t.onunhandledrejection && (r = e, iv(function(e) {
                            var t = iy(),
                                n = t.stackParser,
                                a = t.attachStacktrace;
                            if (!(nl() !== r || aZ > 0)) {
                                var i, o = function(e) {
                                        if (ti(e)) return e;
                                        try {
                                            if ("reason" in e) return e.reason;
                                            if ("detail" in e && "reason" in e.detail) return e.detail.reason
                                        } catch (e) {}
                                        return e
                                    }(e),
                                    u = ti(o) ? (i = o, {
                                        exception: {
                                            values: [{
                                                type: "UnhandledRejection",
                                                value: "Non-Error promise rejection captured with value: ".concat(String(i))
                                            }]
                                        }
                                    }) : aV(n, o, void 0, a, !0);
                                u.level = "error", rL(u, {
                                    originalException: o,
                                    mechanism: {
                                        handled: !1,
                                        type: "auto.browser.global_handlers.onunhandledrejection"
                                    }
                                })
                            }
                        }), ig("onunhandledrejection"))
                    }
                }
            };

            function ig(e) {
                a7 && tE.log("Global Handler attached: ".concat(e))
            }

            function iy() {
                var e = nl();
                return (null == e ? void 0 : e.getOptions()) || {
                    stackParser: function() {
                        return []
                    },
                    attachStacktrace: !1
                }
            }

            function ib(e) {
                return Array.isArray(e.errors)
            }

            function i_(e, t, n) {
                e.mechanism = eG(eY({
                    handled: !0,
                    type: "auto.core.linked_errors"
                }, ib(n) && {
                    is_exception_group: !0
                }, e.mechanism), {
                    exception_id: t
                })
            }

            function iE(e, t, n, r) {
                e.mechanism = eG(eY({
                    handled: !0
                }, e.mechanism), {
                    type: "chained",
                    source: t,
                    exception_id: n,
                    parent_id: r
                })
            }
            var iS = function() {
                var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                    t = e.limit || 5,
                    n = e.key || "cause";
                return {
                    name: "LinkedErrors",
                    preprocessEvent: function(e, r, a) {
                        var i = a.getOptions().stackParser;
                        if ((null == (o = e.exception) ? void 0 : o.values) && r && tl(r.originalException, Error)) {
                            var o, u = e.exception.values.length > 0 ? e.exception.values[e.exception.values.length - 1] : void 0;
                            u && (e.exception.values = function e(t, n, r, a, i, o, u, s) {
                                if (o.length >= r + 1) return o;
                                var l = e9(o);
                                if (tl(a[i], Error)) {
                                    i_(u, s, a);
                                    var c = t(n, a[i]),
                                        f = l.length;
                                    iE(c, i, f, s), l = e(t, n, r, a[i], i, [c].concat(e9(l)), c, f)
                                }
                                return ib(a) && a.errors.forEach(function(o, c) {
                                    if (tl(o, Error)) {
                                        i_(u, s, a);
                                        var f = t(n, o),
                                            d = l.length;
                                        iE(f, "errors[".concat(c, "]"), d, s), l = e(t, n, r, o, i, [f].concat(e9(l)), f, d)
                                    }
                                }), l
                            }(aA, i, t, r.originalException, n, e.exception.values, u, 0))
                        }
                    }
                }
            };

            function iw(e, t, n, r) {
                var a = {
                    filename: e,
                    function: "<anonymous>" === t ? "?" : t,
                    in_app: !0
                };
                return void 0 !== n && (a.lineno = n), void 0 !== r && (a.colno = r), a
            }
            var iT = /^\s*at (\S+?)(?::(\d+))(?::(\d+))\s*$/i,
                iI = /^\s*at (?:(.+?\)(?: \[.+\])?|.*?) ?\((?:address at )?)?(?:async )?((?:<anonymous>|[-a-z]+:|.*bundle|\/)?.*?)(?::(\d+))?(?::(\d+))?\)?\s*$/i,
                iN = /\((\S*)(?::(\d+))(?::(\d+))\)/,
                iA = /at (.+?) ?\(data:(.+?),/,
                ik = [30, function(e) {
                    var t = e.match(iA);
                    if (t) return {
                        filename: "<data:".concat(t[2], ">"),
                        function: t[1]
                    };
                    var n = iT.exec(e);
                    if (n) {
                        var r = eK(n, 4);
                        return iw(r[1], "?", +r[2], +r[3])
                    }
                    var a = iI.exec(e);
                    if (a) {
                        if ((null == (i = a[2]) ? void 0 : i.indexOf("eval")) === 0) {
                            var i, o = iN.exec(a[2]);
                            o && (a[2] = o[1], a[3] = o[2], a[4] = o[3])
                        }
                        var u = eK(iC(a[1] || "?", a[2]), 2),
                            s = u[0];
                        return iw(u[1], s, a[3] ? +a[3] : void 0, a[4] ? +a[4] : void 0)
                    }
                }],
                ix = /^\s*(.*?)(?:\((.*?)\))?(?:^|@)?((?:[-a-z]+)?:\/.*?|\[native code\]|[^@]*(?:bundle|\d+\.js)|\/[\w\-. /=]+)(?::(\d+))?(?::(\d+))?\s*$/i,
                iR = /(\S+) line (\d+)(?: > eval line \d+)* > eval/i,
                iO = [50, function(e) {
                    var t = ix.exec(e);
                    if (t) {
                        if (t[3] && t[3].indexOf(" > eval") > -1) {
                            var n, r = iR.exec(t[3]);
                            r && (t[1] = t[1] || "eval", t[3] = r[1], t[4] = r[2], t[5] = "")
                        }
                        var a = t[3],
                            i = t[1] || "?";
                        return i = (n = eK(iC(i, a), 2))[0], iw(a = n[1], i, t[4] ? +t[4] : void 0, t[5] ? +t[5] : void 0)
                    }
                }],
                iV = tK.apply(void 0, e9([ik, iO])),
                iC = function(e, t) {
                    var n = -1 !== e.indexOf("safari-extension"),
                        r = -1 !== e.indexOf("safari-web-extension");
                    return n || r ? [-1 !== e.indexOf("@") ? e.split("@")[0] : "?", n ? "safari-extension:".concat(t) : "safari-web-extension:".concat(t)] : [e, t]
                },
                iZ = "u" < typeof __SENTRY_DEBUG__ || __SENTRY_DEBUG__,
                iB = {};

            function iL(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : function(e) {
                        var t = iB[e];
                        if (t) return t;
                        var n = eQ[e];
                        if (aG(n)) return iB[e] = n.bind(eQ);
                        var r = eQ.document;
                        if (r && "function" == typeof r.createElement) try {
                            var a = r.createElement("iframe");
                            a.hidden = !0, r.head.appendChild(a);
                            var i = a.contentWindow;
                            (null == i ? void 0 : i[e]) && (n = i[e]), r.head.removeChild(a)
                        } catch (t) {
                            iZ && tE.warn("Could not create sandbox iframe for ".concat(e, " check, bailing to window.").concat(e, ": "), t)
                        }
                        return n ? iB[e] = n.bind(eQ) : n
                    }("fetch"),
                    n = 0,
                    r = 0;
                return function(e, t) {
                    var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : au(e.bufferSize || 64),
                        r = {};
                    return {
                        send: function(a) {
                            var i = [];
                            if (ru(a, function(t, n) {
                                    var a = rd(n);
                                    ! function(e, t) {
                                        var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : tO();
                                        return (e[t] || e.all || 0) > n
                                    }(r, a) ? i.push(t): e.recordDroppedEvent("ratelimit_backoff", a)
                                }), 0 === i.length) return Promise.resolve({});
                            var o = ro(a[0], i),
                                u = function(t) {
                                    if (rs(o, ["client_report"])) {
                                        e4 && tE.warn("Dropping client report. Will not send outcomes (reason: ".concat(t, ")."));
                                        return
                                    }
                                    ru(o, function(n, r) {
                                        e.recordDroppedEvent(t, rd(r))
                                    })
                                };
                            return n.add(function() {
                                return t({
                                    body: rc(o)
                                }).then(function(e) {
                                    return 413 === e.statusCode ? (e4 && tE.error("Sentry responded with status code 413. Envelope was discarded due to exceeding size limits."), u("send_error")) : (e4 && void 0 !== e.statusCode && (e.statusCode < 200 || e.statusCode >= 300) && tE.warn("Sentry responded with status code ".concat(e.statusCode, " to sent event.")), r = function(e, t) {
                                        var n = t.statusCode,
                                            r = t.headers,
                                            a = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : tO(),
                                            i = eY({}, e),
                                            o = null == r ? void 0 : r["x-sentry-rate-limits"],
                                            u = null == r ? void 0 : r["retry-after"];
                                        if (o) {
                                            var s = !0,
                                                l = !1,
                                                c = void 0;
                                            try {
                                                for (var f, d = o.trim().split(",")[Symbol.iterator](); !(s = (f = d.next()).done); s = !0) {
                                                    var p = f.value,
                                                        v = eK(p.split(":", 5), 5),
                                                        m = v[0],
                                                        h = v[1],
                                                        g = v[4],
                                                        y = parseInt(m, 10),
                                                        b = (isNaN(y) ? 60 : y) * 1e3;
                                                    if (h) {
                                                        var _ = !0,
                                                            E = !1,
                                                            S = void 0;
                                                        try {
                                                            for (var w, T = h.split(";")[Symbol.iterator](); !(_ = (w = T.next()).done); _ = !0) {
                                                                var I = w.value;
                                                                "metric_bucket" === I ? (!g || g.split(";").includes("custom")) && (i[I] = a + b) : i[I] = a + b
                                                            }
                                                        } catch (e) {
                                                            E = !0, S = e
                                                        } finally {
                                                            try {
                                                                _ || null == T.return || T.return()
                                                            } finally {
                                                                if (E) throw S
                                                            }
                                                        }
                                                    } else i.all = a + b
                                                }
                                            } catch (e) {
                                                l = !0, c = e
                                            } finally {
                                                try {
                                                    s || null == d.return || d.return()
                                                } finally {
                                                    if (l) throw c
                                                }
                                            }
                                        } else u ? i.all = a + as(u, a) : 429 === n && (i.all = a + 6e4);
                                        return i
                                    }(r, e)), e
                                }, function(e) {
                                    throw u("network_error"), e4 && tE.error("Encountered error running transport request:", e), e
                                })
                            }).then(function(e) {
                                return e
                            }, function(e) {
                                if (e === ao) return e4 && tE.error("Skipped sending event because buffer is full."), u("queue_overflow"), Promise.resolve({});
                                throw e
                            })
                        },
                        flush: function(e) {
                            return n.drain(e)
                        }
                    }
                }(e, function(a) {
                    return rN(function() {
                        var i, o, u, s;
                        return rA(this, function(l) {
                            switch (l.label) {
                                case 0:
                                    i = a.body.length, n += i, r++, o = eY({
                                        body: a.body,
                                        method: "POST",
                                        referrerPolicy: "strict-origin",
                                        headers: e.headers,
                                        keepalive: n <= 6e4 && r < 15
                                    }, e.fetchOptions), l.label = 1;
                                case 1:
                                    return l.trys.push([1, 3, 4, 5]), [4, t(e.url, o)];
                                case 2:
                                    return [2, {
                                        statusCode: (u = l.sent()).status,
                                        headers: {
                                            "x-sentry-rate-limits": u.headers.get("X-Sentry-Rate-Limits"),
                                            "retry-after": u.headers.get("Retry-After")
                                        }
                                    }];
                                case 3:
                                    throw s = l.sent(), iB.fetch = void 0, s;
                                case 4:
                                    return n -= i, r--, [7];
                                case 5:
                                    return [2]
                            }
                        })
                    })()
                }, au(e.bufferSize || 40))
            }
            var iF = {
                idleTimeout: 1e3,
                finalTimeout: 3e4,
                childSpanTimeout: 15e3
            };

            function iP(e) {
                var t, n, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    a = new Map,
                    i = !1,
                    o = "externalFinish",
                    u = !r.disableAutoFinish,
                    s = [],
                    l = r.idleTimeout,
                    c = void 0 === l ? iF.idleTimeout : l,
                    f = r.finalTimeout,
                    d = void 0 === f ? iF.finalTimeout : f,
                    p = r.childSpanTimeout,
                    v = void 0 === p ? iF.childSpanTimeout : p,
                    m = r.beforeSpanEnd,
                    h = r.trimIdleSpanEndTimestamp,
                    g = void 0 === h || h,
                    y = nl();
                if (!y || !nE()) {
                    var b = new rr,
                        _ = eY({
                            sample_rate: "0",
                            sampled: "false"
                        }, rn(b));
                    return tw(b, n7, _), b
                }
                var E = no(),
                    S = n1(),
                    w = (t = ry(e), tM(no(), t), e4 && tE.log("[Tracing] Started span is an idle span"), t);

                function T() {
                    n && (clearTimeout(n), n = void 0)
                }

                function I(e) {
                    T(), n = setTimeout(function() {
                        !i && 0 === a.size && u && (o = "idleTimeout", w.end(e))
                    }, c)
                }

                function N(e) {
                    n = setTimeout(function() {
                        !i && u && (o = "heartbeatFailed", w.end(e))
                    }, v)
                }

                function A(e) {
                    i = !0, a.clear(), s.forEach(function(e) {
                        return e()
                    }), tM(E, S);
                    var t = nW(w);
                    if (t.start_timestamp) {
                        t.data[nm] || w.setAttribute(nm, o);
                        var n = t.status;
                        n && "unknown" !== n || w.setStatus({
                            code: 1
                        }), tE.log('[Tracing] Idle span "'.concat(t.op, '" finished'));
                        var r = nq(w).filter(function(e) {
                                return e !== w
                            }),
                            u = 0;
                        r.forEach(function(t) {
                            t.isRecording() && (t.setStatus({
                                code: 2,
                                message: "cancelled"
                            }), t.end(e), e4 && tE.log("[Tracing] Cancelling span since span ended early", JSON.stringify(t, void 0, 2)));
                            var n = nW(t),
                                r = n.timestamp,
                                a = n.start_timestamp,
                                i = void 0 === a ? 0 : a,
                                o = i <= e,
                                s = (void 0 === r ? 0 : r) - i <= (d + c) / 1e3;
                            if (e4) {
                                var l = JSON.stringify(t, void 0, 2);
                                o ? s || tE.log("[Tracing] Discarding span since it finished after idle span final timeout", l) : tE.log("[Tracing] Discarding span since it happened after idle span was finished", l)
                            }(!s || !o) && (w[nK] && w[nK].delete(t), u++)
                        }), u > 0 && w.setAttribute("sentry.idle_span_discarded_spans", u)
                    }
                }
                return w.end = new Proxy(w.end, {
                    apply: function(e, t, n) {
                        if (m && m(w), !(0, eW._)(t, rr)) {
                            var r = ej(n) || e5(n) || eJ(n) || eM(),
                                a = r[0],
                                i = r.slice(1),
                                o = nX(a || tX()),
                                u = nq(w).filter(function(e) {
                                    return e !== w
                                }),
                                s = nW(w);
                            if (!u.length || !g) return A(o), Reflect.apply(e, t, [o].concat(e9(i)));
                            var l = y.getOptions().ignoreSpans,
                                c = null == u ? void 0 : u.reduce(function(e, t) {
                                    var n = nW(t);
                                    return !n.timestamp || l && nw(n, l) ? e : e ? Math.max(e, n.timestamp) : n.timestamp
                                }, void 0),
                                f = s.start_timestamp,
                                p = Math.min(f ? f + d / 1e3 : 1 / 0, Math.max(f || -1 / 0, Math.min(o, c || 1 / 0)));
                            return A(p), Reflect.apply(e, t, [p].concat(e9(i)))
                        }
                    }
                }), s.push(y.on("spanStart", function(e) {
                    if (!(i || e === w || nW(e).timestamp || (0, eW._)(e, rm) && e.isStandaloneSpan())) {
                        var t;
                        nq(w).includes(e) && (t = e.spanContext().spanId, T(), a.set(t, !0), N(tX() + v / 1e3))
                    }
                })), s.push(y.on("spanEnd", function(e) {
                    if (!i) {
                        var t;
                        t = e.spanContext().spanId, a.has(t) && a.delete(t), 0 === a.size && I(tX() + c / 1e3)
                    }
                })), s.push(y.on("idleSpanEnableAutoFinish", function(e) {
                    e === w && (u = !0, I(), a.size && N())
                })), r.disableAutoFinish || I(), setTimeout(function() {
                    i || (w.setStatus({
                        code: 2,
                        message: "deadline_exceeded"
                    }), o = "finalTimeout", w.end())
                }, d), w
            }
            var iX = !1,
                iU = function(e, t, n, r) {
                    var a, i;
                    return function(o) {
                        if (t.value >= 0 && (o || r) && ((i = t.value - (null != a ? a : 0)) || void 0 === a)) {
                            var u;
                            a = t.value, t.delta = i, u = t.value, t.rating = u > n[1] ? "poor" : u > n[0] ? "needs-improvement" : "good", e(t)
                        }
                    }
                },
                iW = function() {
                    var e, t, n = !(arguments.length > 0) || void 0 === arguments[0] || arguments[0],
                        r = null == (t = eQ.performance) || null == (e = t.getEntriesByType) ? void 0 : e.call(t, "navigation")[0];
                    if (!n || r && r.responseStart > 0 && r.responseStart < performance.now()) return r
                },
                iD = function() {
                    var e, t = iW();
                    return null != (e = null == t ? void 0 : t.activationStart) ? e : 0
                };

            function iY(e, t, n) {
                eQ.document && eQ.addEventListener(e, t, n)
            }

            function iG(e, t, n) {
                eQ.document && eQ.removeEventListener(e, t, n)
            }
            var ij = -1,
                iM = new Set,
                iz = function() {
                    var e, t;
                    return (null == (e = eQ.document) ? void 0 : e.visibilityState) !== "hidden" || (null == (t = eQ.document) ? void 0 : t.prerendering) ? 1 / 0 : 0
                },
                iJ = function(e) {
                    var t;
                    if (("pagehide" === e.type || (null == (t = eQ.document) ? void 0 : t.visibilityState) === "hidden") && ij > -1) {
                        if ("visibilitychange" === e.type || "pagehide" === e.type) {
                            var n = !0,
                                r = !1,
                                a = void 0;
                            try {
                                for (var i, o = iM[Symbol.iterator](); !(n = (i = o.next()).done); n = !0)(0, i.value)()
                            } catch (e) {
                                r = !0, a = e
                            } finally {
                                try {
                                    n || null == o.return || o.return()
                                } finally {
                                    if (r) throw a
                                }
                            }
                        }
                        isFinite(ij) || (ij = "visibilitychange" === e.type ? e.timeStamp : 0, iG("prerenderingchange", iJ, !0))
                    }
                },
                iK = function() {
                    if (eQ.document && ij < 0) {
                        var e, t = iD(),
                            n = eQ.document.prerendering || null == (e = globalThis.performance.getEntriesByType("visibility-state").filter(function(e) {
                                return "hidden" === e.name && e.startTime > t
                            })[0]) ? void 0 : e.startTime;
                        ij = null != n ? n : iz(), iY("visibilitychange", iJ, !0), iY("pagehide", iJ, !0), iY("prerenderingchange", iJ, !0)
                    }
                    return {
                        get firstHiddenTime() {
                            return ij
                        },
                        onHidden: function(e) {
                            iM.add(e)
                        }
                    }
                },
                iH = function(e) {
                    var t, n, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : -1,
                        a = iW(),
                        i = "navigate";
                    return a && ((null == (t = eQ.document) ? void 0 : t.prerendering) || iD() > 0 ? i = "prerender" : (null == (n = eQ.document) ? void 0 : n.wasDiscarded) ? i = "restore" : a.type && (i = a.type.replace(/_/g, "-"))), {
                        name: e,
                        value: r,
                        rating: "good",
                        delta: 0,
                        entries: [],
                        id: "v5-".concat(Date.now(), "-").concat(Math.floor(Math.random() * (9e12 - 1)) + 1e12),
                        navigationType: i
                    }
                },
                iQ = new WeakMap;

            function iq(e, t) {
                try {
                    return iQ.get(e) || iQ.set(e, new t), iQ.get(e)
                } catch (e) {
                    return new t
                }
            }
            var i$ = function() {
                    function e() {
                        e1(this, e), e.prototype.__init.call(this), e.prototype.__init2.call(this)
                    }
                    return e3(e, [{
                        key: "__init",
                        value: function() {
                            this._sessionValue = 0
                        }
                    }, {
                        key: "__init2",
                        value: function() {
                            this._sessionEntries = []
                        }
                    }, {
                        key: "_processEntry",
                        value: function(e) {
                            if (!e.hadRecentInput) {
                                var t, n = this._sessionEntries[0],
                                    r = this._sessionEntries[this._sessionEntries.length - 1];
                                this._sessionValue && n && r && e.startTime - r.startTime < 1e3 && e.startTime - n.startTime < 5e3 ? (this._sessionValue += e.value, this._sessionEntries.push(e)) : (this._sessionValue = e.value, this._sessionEntries = [e]), null == (t = this._onAfterProcessingUnexpectedShift) || t.call(this, e)
                            }
                        }
                    }]), e
                }(),
                i0 = function(e, t) {
                    var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
                    try {
                        if (PerformanceObserver.supportedEntryTypes.includes(e)) {
                            var r = new PerformanceObserver(function(e) {
                                Promise.resolve().then(function() {
                                    t(e.getEntries())
                                })
                            });
                            return r.observe(eY({
                                type: e,
                                buffered: !0
                            }, n)), r
                        }
                    } catch (e) {}
                },
                i1 = function(e) {
                    var t = !1;
                    return function() {
                        t || (e(), t = !0)
                    }
                },
                i2 = function(e) {
                    var t;
                    (null == (t = eQ.document) ? void 0 : t.prerendering) ? addEventListener("prerenderingchange", function() {
                        return e()
                    }, !0): e()
                },
                i3 = [1800, 3e3],
                i5 = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                    i2(function() {
                        var n, r = iK(),
                            a = iH("FCP"),
                            i = i0("paint", function(e) {
                                var t = !0,
                                    o = !1,
                                    u = void 0;
                                try {
                                    for (var s, l = e[Symbol.iterator](); !(t = (s = l.next()).done); t = !0) {
                                        var c = s.value;
                                        "first-contentful-paint" === c.name && (i.disconnect(), c.startTime < r.firstHiddenTime && (a.value = Math.max(c.startTime - iD(), 0), a.entries.push(c), n(!0)))
                                    }
                                } catch (e) {
                                    o = !0, u = e
                                } finally {
                                    try {
                                        t || null == l.return || l.return()
                                    } finally {
                                        if (o) throw u
                                    }
                                }
                            });
                        i && (n = iU(e, a, i3, t.reportAllChanges))
                    })
                },
                i9 = [.1, .25],
                i4 = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                    i5(i1(function() {
                        var n, r, a = iH("CLS", 0),
                            i = iK(),
                            o = iq(t, i$),
                            u = function(e) {
                                var t = !0,
                                    r = !1,
                                    i = void 0;
                                try {
                                    for (var u, s = e[Symbol.iterator](); !(t = (u = s.next()).done); t = !0) {
                                        var l = u.value;
                                        o._processEntry(l)
                                    }
                                } catch (e) {
                                    r = !0, i = e
                                } finally {
                                    try {
                                        t || null == s.return || s.return()
                                    } finally {
                                        if (r) throw i
                                    }
                                }
                                o._sessionValue > a.value && (a.value = o._sessionValue, a.entries = o._sessionEntries, n())
                            },
                            s = i0("layout-shift", u);
                        s && (n = iU(e, a, i9, t.reportAllChanges), i.onHidden(function() {
                            u(s.takeRecords()), n(!0)
                        }), null == eQ || null == (r = eQ.setTimeout) || r.call(eQ, n))
                    }))
                },
                i8 = 0,
                i6 = 1 / 0,
                i7 = 0,
                oe = function(e) {
                    e.forEach(function(e) {
                        e.interactionId && (i6 = Math.min(i6, e.interactionId), i8 = (i7 = Math.max(i7, e.interactionId)) ? (i7 - i6) / 7 + 1 : 0)
                    })
                },
                ot = function() {
                    return ea ? i8 : performance.interactionCount || 0
                },
                on = function() {
                    "interactionCount" in performance || ea || (ea = i0("event", oe, {
                        type: "event",
                        buffered: !0,
                        durationThreshold: 0
                    }))
                },
                or = 0,
                oa = function() {
                    function e() {
                        e1(this, e), e.prototype.__init.call(this), e.prototype.__init2.call(this)
                    }
                    return e3(e, [{
                        key: "__init",
                        value: function() {
                            this._longestInteractionList = []
                        }
                    }, {
                        key: "__init2",
                        value: function() {
                            this._longestInteractionMap = new Map
                        }
                    }, {
                        key: "_resetInteractions",
                        value: function() {
                            or = ot(), this._longestInteractionList.length = 0, this._longestInteractionMap.clear()
                        }
                    }, {
                        key: "_estimateP98LongestInteraction",
                        value: function() {
                            var e = Math.min(this._longestInteractionList.length - 1, Math.floor((ot() - or) / 50));
                            return this._longestInteractionList[e]
                        }
                    }, {
                        key: "_processEntry",
                        value: function(e) {
                            if (null == (u = this._onBeforeProcessingEntry) || u.call(this, e), e.interactionId || "first-input" === e.entryType) {
                                var t = this._longestInteractionList.at(-1),
                                    n = this._longestInteractionMap.get(e.interactionId);
                                if (n || this._longestInteractionList.length < 10 || e.duration > t._latency) {
                                    if (n ? e.duration > n._latency ? (n.entries = [e], n._latency = e.duration) : e.duration === n._latency && e.startTime === n.entries[0].startTime && n.entries.push(e) : (n = {
                                            id: e.interactionId,
                                            entries: [e],
                                            _latency: e.duration
                                        }, this._longestInteractionMap.set(n.id, n), this._longestInteractionList.push(n)), this._longestInteractionList.sort(function(e, t) {
                                            return t._latency - e._latency
                                        }), this._longestInteractionList.length > 10) {
                                        var r = this._longestInteractionList.splice(10),
                                            a = !0,
                                            i = !1,
                                            o = void 0;
                                        try {
                                            for (var u, s, l, c = r[Symbol.iterator](); !(a = (l = c.next()).done); a = !0) {
                                                var f = l.value;
                                                this._longestInteractionMap.delete(f.id)
                                            }
                                        } catch (e) {
                                            i = !0, o = e
                                        } finally {
                                            try {
                                                a || null == c.return || c.return()
                                            } finally {
                                                if (i) throw o
                                            }
                                        }
                                    }
                                    null == (s = this._onAfterProcessingINPCandidate) || s.call(this, n)
                                }
                            }
                        }
                    }]), e
                }(),
                oi = function(e) {
                    var t, n = eQ.requestIdleCallback || eQ.setTimeout;
                    (null == (t = eQ.document) ? void 0 : t.visibilityState) === "hidden" ? e(): (iY("visibilitychange", e = i1(e), {
                        once: !0,
                        capture: !0
                    }), iY("pagehide", e, {
                        once: !0,
                        capture: !0
                    }), n(function() {
                        e(), iG("visibilitychange", e, {
                            capture: !0
                        }), iG("pagehide", e, {
                            capture: !0
                        })
                    }))
                },
                oo = [200, 500],
                ou = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                    if (globalThis.PerformanceEventTiming && "interactionId" in PerformanceEventTiming.prototype) {
                        var n = iK();
                        i2(function() {
                            on();
                            var r, a, i = iH("INP"),
                                o = iq(t, oa),
                                u = function(e) {
                                    oi(function() {
                                        var t = !0,
                                            n = !1,
                                            r = void 0;
                                        try {
                                            for (var u, s = e[Symbol.iterator](); !(t = (u = s.next()).done); t = !0) {
                                                var l = u.value;
                                                o._processEntry(l)
                                            }
                                        } catch (e) {
                                            n = !0, r = e
                                        } finally {
                                            try {
                                                t || null == s.return || s.return()
                                            } finally {
                                                if (n) throw r
                                            }
                                        }
                                        var c = o._estimateP98LongestInteraction();
                                        c && c._latency !== i.value && (i.value = c._latency, i.entries = c.entries, a())
                                    })
                                },
                                s = i0("event", u, {
                                    durationThreshold: null != (r = t.durationThreshold) ? r : 40
                                });
                            a = iU(e, i, oo, t.reportAllChanges), s && (s.observe({
                                type: "first-input",
                                buffered: !0
                            }), n.onHidden(function() {
                                u(s.takeRecords()), a(!0)
                            }))
                        })
                    }
                },
                os = function() {
                    function e() {
                        e1(this, e)
                    }
                    return e3(e, [{
                        key: "_processEntry",
                        value: function(e) {
                            var t;
                            null == (t = this._onBeforeProcessingEntry) || t.call(this, e)
                        }
                    }]), e
                }(),
                ol = [2500, 4e3],
                oc = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                    i2(function() {
                        var n, r = iK(),
                            a = iH("LCP"),
                            i = iq(t, os),
                            o = function(e) {
                                t.reportAllChanges || (e = e.slice(-1));
                                var o = !0,
                                    u = !1,
                                    s = void 0;
                                try {
                                    for (var l, c = e[Symbol.iterator](); !(o = (l = c.next()).done); o = !0) {
                                        var f = l.value;
                                        i._processEntry(f), f.startTime < r.firstHiddenTime && (a.value = Math.max(f.startTime - iD(), 0), a.entries = [f], n())
                                    }
                                } catch (e) {
                                    u = !0, s = e
                                } finally {
                                    try {
                                        o || null == c.return || c.return()
                                    } finally {
                                        if (u) throw s
                                    }
                                }
                            },
                            u = i0("largest-contentful-paint", o);
                        if (u) {
                            n = iU(e, a, ol, t.reportAllChanges);
                            for (var s = i1(function() {
                                    o(u.takeRecords()), u.disconnect(), n(!0)
                                }), l = function(e) {
                                    e.isTrusted && (oi(s), iG(e.type, l, {
                                        capture: !0
                                    }))
                                }, c = 0, f = ["keydown", "click", "visibilitychange"]; c < f.length; c++) iY(f[c], l, {
                                capture: !0
                            })
                        }
                    })
                },
                of = [800, 1800],
                od = function(e) {
                    var t, n;
                    (null == (t = eQ.document) ? void 0 : t.prerendering) ? i2(function() {
                        return od(e)
                    }): (null == (n = eQ.document) ? void 0 : n.readyState) !== "complete" ? addEventListener("load", function() {
                        return od(e)
                    }, !0) : setTimeout(e)
                },
                op = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                        n = iH("TTFB"),
                        r = iU(e, n, of, t.reportAllChanges);
                    od(function() {
                        var e = iW();
                        e && (n.value = Math.max(e.responseStart - iD(), 0), n.entries = [e], r(!0))
                    })
                },
                ov = {},
                om = {};

            function oh(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
                return oI("cls", e, oE, ei, t)
            }

            function og(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
                return oI("lcp", e, oS, eo, t)
            }

            function oy(e) {
                return oI("inp", e, oT, es)
            }

            function ob(e, t) {
                var n, r;
                return oN(e, t), om[e] || (r = {}, "event" === (n = e) && (r.durationThreshold = 0), i0(n, function(e) {
                    o_(n, {
                        entries: e
                    })
                }, r), om[e] = !0), oA(e, t)
            }

            function o_(e, t) {
                var n = ov[e];
                if (null == n ? void 0 : n.length) {
                    var r = !0,
                        a = !1,
                        i = void 0;
                    try {
                        for (var o, u = n[Symbol.iterator](); !(r = (o = u.next()).done); r = !0) {
                            var s = o.value;
                            try {
                                s(t)
                            } catch (t) {
                                iZ && tE.error("Error while triggering instrumentation handler.\nType: ".concat(e, "\nName: ").concat(tq(s), "\nError:"), t)
                            }
                        }
                    } catch (e) {
                        a = !0, i = e
                    } finally {
                        try {
                            r || null == u.return || u.return()
                        } finally {
                            if (a) throw i
                        }
                    }
                }
            }

            function oE() {
                return i4(function(e) {
                    o_("cls", {
                        metric: e
                    }), ei = e
                }, {
                    reportAllChanges: !0
                })
            }

            function oS() {
                return oc(function(e) {
                    o_("lcp", {
                        metric: e
                    }), eo = e
                }, {
                    reportAllChanges: !0
                })
            }

            function ow() {
                return op(function(e) {
                    o_("ttfb", {
                        metric: e
                    }), eu = e
                })
            }

            function oT() {
                return ou(function(e) {
                    o_("inp", {
                        metric: e
                    }), es = e
                })
            }

            function oI(e, t, n, r) {
                var a, i = arguments.length > 4 && void 0 !== arguments[4] && arguments[4];
                return oN(e, t), om[e] || (a = n(), om[e] = !0), r && t({
                    metric: r
                }), oA(e, t, i ? a : void 0)
            }

            function oN(e, t) {
                ov[e] = ov[e] || [], ov[e].push(t)
            }

            function oA(e, t, n) {
                return function() {
                    n && n();
                    var r = ov[e];
                    if (r) {
                        var a = r.indexOf(t); - 1 !== a && r.splice(a, 1)
                    }
                }
            }

            function ok() {
                return (ok = Object.assign || function(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var n = arguments[t];
                        for (var r in n) Object.prototype.hasOwnProperty.call(n, r) && (e[r] = n[r])
                    }
                    return e
                }).apply(this, arguments)
            }
            var ox = function(e) {
                var t = function(t) {
                    var n;
                    ("pagehide" === t.type || (null == (n = eQ.document) ? void 0 : n.visibilityState) === "hidden") && e(t)
                };
                iY("visibilitychange", t, {
                    capture: !0,
                    once: !0
                }), iY("pagehide", t, {
                    capture: !0,
                    once: !0
                })
            };

            function oR(e) {
                return "number" == typeof e && isFinite(e)
            }

            function oO(e, t, n, r) {
                var a = r;
                if (null == a) throw TypeError("Cannot destructure " + a);
                var i = ok({}, r),
                    o = nW(e).start_timestamp;
                return o && o > t && "function" == typeof e.updateStartTime && e.updateStartTime(t), rb(e, function() {
                    var e = ry(eY({
                        startTime: t
                    }, i));
                    return e && e.end(n), e
                })
            }

            function oV(e) {
                var t, n, r = nl();
                if (r) {
                    var a = e.name,
                        i = e.transaction,
                        o = e.attributes,
                        u = e.startTime,
                        s = r.getOptions(),
                        l = s.release,
                        c = s.environment,
                        f = s.sendDefaultPii,
                        d = r.getIntegrationByName("Replay"),
                        p = null == d ? void 0 : d.getReplayId(),
                        v = no(),
                        m = v.getUser(),
                        h = void 0 !== m ? m.email || m.id || m.ip_address : void 0;
                    try {
                        n = v.getScopeData().contexts.profile.profile_id
                    } catch (e) {}
                    return ry({
                        name: a,
                        attributes: eY({
                            release: l,
                            environment: c,
                            user: h || void 0,
                            profile_id: n || void 0,
                            replay_id: p || void 0,
                            transaction: i,
                            "user_agent.original": null == (t = eQ.navigator) ? void 0 : t.userAgent,
                            "client.address": f ? "{{auto}}" : void 0
                        }, o),
                        startTime: u,
                        experimental: {
                            standalone: !0
                        }
                    })
                }
            }

            function oC() {
                return eQ.addEventListener && eQ.performance
            }

            function oZ(e) {
                return e / 1e3
            }

            function oB(e) {
                try {
                    return PerformanceObserver.supportedEntryTypes.includes(e)
                } catch (e) {
                    return !1
                }
            }

            function oL(e, t) {
                var n, r = !1;

                function a(e) {
                    !r && n && t(e, n.spanContext().spanId, n), r = !0
                }
                ox(function() {
                    a("pagehide")
                });
                var i = e.on("beforeStartNavigationSpan", function(e, t) {
                        (null == t ? void 0 : t.isRedirect) || (a("navigation"), i(), o())
                    }),
                    o = e.on("afterStartPageLoadSpan", function(e) {
                        n = e, o()
                    })
            }

            function oF(e) {
                return null != e && e > 0 && e <= 6e4
            }

            function oP(e) {
                return e ? ((tW() || performance.timeOrigin) + e) / 1e3 : e
            }

            function oX(e) {
                var t, n = {};
                if (void 0 != e.nextHopProtocol) {
                    var r = function(e) {
                            var t = "unknown",
                                n = "unknown",
                                r = "",
                                a = !0,
                                i = !1,
                                o = void 0;
                            try {
                                for (var u, s = e[Symbol.iterator](); !(a = (u = s.next()).done); a = !0) {
                                    var l, c = u.value;
                                    if ("/" === c) {
                                        t = (l = eK(e.split("/"), 2))[0], n = l[1];
                                        break
                                    }
                                    if (!isNaN(Number(c))) {
                                        t = "h" === r ? "http" : r, n = e.split(r)[1];
                                        break
                                    }
                                    r += c
                                }
                            } catch (e) {
                                i = !0, o = e
                            } finally {
                                try {
                                    a || null == s.return || s.return()
                                } finally {
                                    if (i) throw o
                                }
                            }
                            return r === e && (t = r), {
                                name: t,
                                version: n
                            }
                        }(e.nextHopProtocol),
                        a = r.name,
                        i = r.version;
                    n["network.protocol.version"] = i, n["network.protocol.name"] = a
                }
                return tW() || (null == (t = oC()) ? void 0 : t.timeOrigin) ? Object.fromEntries(Object.entries(eG(eY({}, n), {
                    "http.request.redirect_start": oP(e.redirectStart),
                    "http.request.redirect_end": oP(e.redirectEnd),
                    "http.request.worker_start": oP(e.workerStart),
                    "http.request.fetch_start": oP(e.fetchStart),
                    "http.request.domain_lookup_start": oP(e.domainLookupStart),
                    "http.request.domain_lookup_end": oP(e.domainLookupEnd),
                    "http.request.connect_start": oP(e.connectStart),
                    "http.request.secure_connection_start": oP(e.secureConnectionStart),
                    "http.request.connection_end": oP(e.connectEnd),
                    "http.request.request_start": oP(e.requestStart),
                    "http.request.response_start": oP(e.responseStart),
                    "http.request.response_end": oP(e.responseEnd),
                    "http.request.time_to_first_byte": null != e.responseStart ? e.responseStart / 1e3 : void 0
                })).filter(function(e) {
                    return null != eK(e, 2)[1]
                })) : n
            }
            var oU = 0,
                oW = {};

            function oD(e, t, n, r) {
                var a, i = arguments.length > 4 && void 0 !== arguments[4] ? arguments[4] : n,
                    o = t["secureConnection" === (a = n) ? "connectEnd" : "fetch" === a ? "domainLookupStart" : "".concat(a, "End")],
                    u = t["".concat(n, "Start")];
                u && o && oO(e, r + oZ(u), r + oZ(o), {
                    op: "browser.".concat(i),
                    name: t.name,
                    attributes: eY(eD({}, nv, "auto.ui.browser.metrics"), "redirect" === n && null != t.redirectCount ? {
                        "http.redirect_count": t.redirectCount
                    } : {})
                })
            }
            var oY = n(432),
                oG = [],
                oj = new Map,
                oM = new Map,
                oz = {
                    click: "click",
                    pointerdown: "click",
                    pointerup: "click",
                    mousedown: "click",
                    mouseup: "click",
                    touchstart: "click",
                    touchend: "click",
                    mouseover: "hover",
                    mouseout: "hover",
                    mouseenter: "hover",
                    mouseleave: "hover",
                    pointerover: "hover",
                    pointerout: "hover",
                    pointerenter: "hover",
                    pointerleave: "hover",
                    dragstart: "drag",
                    dragend: "drag",
                    drag: "drag",
                    dragenter: "drag",
                    dragleave: "drag",
                    dragover: "drag",
                    drop: "drag",
                    keydown: "press",
                    keyup: "press",
                    keypress: "press",
                    input: "press"
                },
                oJ = function(e) {
                    var t, n, r = e.metric;
                    if (void 0 != r.value) {
                        var a = oZ(r.value);
                        if (!(a > 60)) {
                            var i = r.entries.find(function(e) {
                                return e.duration === r.value && oz[e.name]
                            });
                            if (i) {
                                var o = i.interactionId,
                                    u = oz[i.name],
                                    s = oZ(tW() + i.startTime),
                                    l = n1(),
                                    c = l ? n$(l) : void 0,
                                    f = null != o ? oj.get(o) : void 0,
                                    d = (null == f ? void 0 : f.span) || c,
                                    p = d ? nW(d).description : no().getScopeData().transactionName,
                                    v = oV({
                                        name: (null == f ? void 0 : f.elementName) || td(i.target),
                                        transaction: p,
                                        attributes: (eD(t = {}, nv, "auto.http.browser.inp"), eD(t, np, "ui.interaction.".concat(u)), eD(t, n_, i.duration), t),
                                        startTime: s
                                    });
                                v && (v.addEvent("inp", (eD(n = {}, nh, "millisecond"), eD(n, ng, r.value), n)), v.end(s + a))
                            }
                        }
                    }
                };

            function oK(e) {
                var t, n, r, a = e.name,
                    i = e.op,
                    o = e.origin,
                    u = e.metricName,
                    s = e.value,
                    l = e.attributes,
                    c = e.parentSpan,
                    f = e.reportEvent,
                    d = e.startTime,
                    p = e.endTime,
                    v = no().getScopeData().transactionName,
                    m = eY((eD(r = {}, nv, o), eD(r, np, i), eD(r, n_, 0), eD(r, "browser.web_vital.".concat(u, ".value"), s), eD(r, "sentry.transaction", v), eD(r, "user_agent.original", null == (t = eQ.navigator) ? void 0 : t.userAgent), r), l);
                c && (null == (n = nD(c).attributes) ? void 0 : n[np]) === "pageload" && (m["sentry.pageload.span_id"] = c.spanContext().spanId), f && (m["browser.web_vital.".concat(u, ".report_event")] = f);
                var h = ry({
                    name: a,
                    attributes: m,
                    startTime: d,
                    parentSpan: c
                });
                h && h.end(null != p ? p : d)
            }
            var oH = "sentry_previous_trace";

            function oQ(e) {
                return 1 === e.traceFlags
            }

            function oq() {
                var e, t, n, r, a, i, o, u, s, l = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                    c = l.client || nl();
                if (!((null == (o = nl()) ? void 0 : o.getOptions().enabled) !== !1 && (null == o ? void 0 : o.getTransport())) || !c) return {};
                var f = ni(eq());
                if (f.getTraceData) return f.getTraceData(l);
                var d = l.scope || no(),
                    p = l.span || n1();
                if (!p && void 0 !== J) return {};
                var v = p ? nZ((u = p.spanContext()).traceId, u.spanId, nM(p)) : (t = (e = d.getPropagationContext()).traceId, n = e.sampled, nZ(t, e.propagationSpanId, n)),
                    m = function(e) {
                        if (e) {
                            var t = Object.entries(e).reduce(function(e, t) {
                                var n = eK(t, 2),
                                    r = n[0],
                                    a = n[1];
                                return a && (e["".concat(nR).concat(r)] = a), e
                            }, {});
                            return 0 !== Object.keys(t).length ? Object.entries(t).reduce(function(e, t, n) {
                                var r = eK(t, 2),
                                    a = r[0],
                                    i = r[1],
                                    o = "".concat(encodeURIComponent(a), "=").concat(encodeURIComponent(i)),
                                    u = 0 === n ? o : "".concat(e, ",").concat(o);
                                return u.length > 8192 ? (e4 && tE.warn("Not adding key: ".concat(a, " with val: ").concat(i, " to baggage header due to exceeding baggage size limits.")), e) : u
                            }, "") : void 0
                        }
                    }(p ? rn(p) : rt(c, d));
                if (!nC.test(v)) return tE.warn("Invalid sentry-trace data. Cannot generate trace data"), {};
                var h = {
                    "sentry-trace": v,
                    baggage: m
                };
                return l.propagateTraceparent && (h.traceparent = p ? nB((s = p.spanContext()).traceId, s.spanId, nM(p)) : (a = (r = d.getPropagationContext()).traceId, i = r.sampled, nB(a, r.propagationSpanId, i))), h
            }

            function o$(e) {
                return "string" == typeof e && e.split(",").some(function(e) {
                    return e.trim().startsWith(nR)
                })
            }

            function o0(e, t, n, r) {
                var a, i = (eD(a = {
                    url: a1(e),
                    type: "fetch",
                    "http.method": n
                }, nv, r), eD(a, np, "http.client"), a);
                return t && (aq(t) || (i["http.url"] = a1(t.href), i["server.address"] = t.host), t.search && (i["http.query"] = t.search), t.hash && (i["http.fragment"] = t.hash)), i
            }

            function o1(e) {
                try {
                    return new URL(e, eQ.location.origin).href
                } catch (e) {
                    return
                }
            }

            function o2(e) {
                try {
                    return new Headers(e)
                } catch (e) {
                    return
                }
            }
            Symbol.for("sentry__originalRequestBody");
            var o3 = new WeakMap,
                o5 = new Map,
                o9 = {
                    traceFetch: !0,
                    traceXHR: !0,
                    enableHTTPTimings: !0,
                    trackFetchStreamPerformance: !1
                };

            function o4(e, t) {
                var n = nW(e).data.url;
                if (n && "string" == typeof n) {
                    var r = function() {
                        setTimeout(i)
                    };
                    if (nT(t)) {
                        var a = e.end.bind(e);
                        e.end = function(e) {
                            var t = null != e ? e : tX(),
                                n = !1,
                                o = function() {
                                    n || (n = !0, setTimeout(i), a(t), clearTimeout(u))
                                };
                            r = o;
                            var u = setTimeout(o, 300)
                        }
                    }
                    var i = ob("resource", function(t) {
                        t.entries.forEach(function(t) {
                            "resource" === t.entryType && "initiatorType" in t && "string" == typeof t.nextHopProtocol && ("fetch" === t.initiatorType || "xmlhttprequest" === t.initiatorType) && t.name.endsWith(n) && (e.setAttributes(oX(t)), r())
                        })
                    })
                }
            }
            var o8 = /Googlebot|Google-InspectionTool|Storebot-Google|Bingbot|Slurp|DuckDuckBot|Baiduspider|YandexBot|Facebot|facebookexternalhit|LinkedInBot|Twitterbot|Applebot/i,
                o6 = eY(eG(eY({}, iF), {
                    instrumentNavigation: !0,
                    instrumentPageLoad: !0,
                    markBackgroundSpan: !0,
                    enableLongTask: !0,
                    enableLongAnimationFrame: !0,
                    enableInp: !0,
                    ignoreResourceSpans: [],
                    ignorePerformanceApiSpans: [],
                    detectRedirects: !0,
                    linkPreviousTrace: "in-memory",
                    consistentTraceSampling: !1,
                    enableReportPageLoaded: !1,
                    _experiments: {}
                }), o9);

            function o7(e) {
                var t = eQ.document,
                    n = null == t ? void 0 : t.querySelector("meta[name=".concat(e, "]"));
                return (null == n ? void 0 : n.getAttribute("content")) || void 0
            }

            function ue(e) {
                var t, n, r, a = null == (n = eQ.performance) || null == (t = n.getEntriesByType) ? void 0 : t.call(n, "navigation")[0],
                    i = null == a || null == (r = a.serverTiming) ? void 0 : r.find(function(t) {
                        return t.name === e
                    });
                return null == i ? void 0 : i.description
            }
            var ut = "_sentry_idleSpan",
                un = window.HeaderScripts,
                ur = window.Roblox["core-scripts"].meta.device,
                ua = window.Roblox["core-scripts"].meta.environment;

            function ui(e, t, n) {
                return (ui = r3() ? Reflect.construct : function(e, t, n) {
                    var r = [null];
                    r.push.apply(r, t);
                    var a = new(Function.bind.apply(e, r));
                    return n && r4(a, n.prototype), a
                }).apply(null, arguments)
            }

            function uo(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (uo = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, n)
                    }

                    function n() {
                        return ui(e, arguments, r2(this).constructor)
                    }
                    return n.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: n,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), r4(n, e)
                })(e)
            }
            n(848);
            var uu = function() {
                    function e(t) {
                        e1(this, e), eD(this, "value", void 0), this.value = t
                    }
                    return e3(e, [{
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
                            return ul.fromResult(this.cast())
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
                us = function() {
                    function e(t) {
                        e1(this, e), eD(this, "error", void 0), this.error = t
                    }
                    return e3(e, [{
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
                            return ul.fromResult(this.cast())
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
            (ef || (ef = {})).all = function(e) {
                var t = e.findIndex(function(e) {
                    return e.isErr()
                });
                return -1 === t ? new uu(e.map(function(e) {
                    return e.getOrNull()
                })) : e[t]
            };
            var ul = function() {
                function e(t) {
                    e1(this, e), eD(this, "promise", void 0), this.promise = t
                }
                return e3(e, [{
                    key: "map",
                    value: function(t) {
                        return new e(this.promise.then(function(e) {
                            return rN(function() {
                                var n, r;
                                return rA(this, function(a) {
                                    switch (a.label) {
                                        case 0:
                                            if (!e.isOk()) return [3, 2];
                                            return r = uu.bind, [4, t(e.value)];
                                        case 1:
                                            return n = new(r.apply(uu, [void 0, a.sent()])), [3, 3];
                                        case 2:
                                            n = e.cast(), a.label = 3;
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
                            return rN(function() {
                                var n, r;
                                return rA(this, function(a) {
                                    switch (a.label) {
                                        case 0:
                                            if (!e.isErr()) return [3, 2];
                                            return r = us.bind, [4, t(e.error)];
                                        case 1:
                                            return n = new(r.apply(us, [void 0, a.sent()])), [3, 3];
                                        case 2:
                                            n = e.cast(), a.label = 3;
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
                            return (0, eW._)(r, e) ? r.promise : r
                        }))
                    }
                }, {
                    key: "orElse",
                    value: function(t) {
                        return new e(this.promise.then(function(n) {
                            if (n.isOk()) return n.cast();
                            var r = t(n.error);
                            return (0, eW._)(r, e) ? r.promise : r
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
                            return new uu(e)
                        }).catch(function(e) {
                            return new us(n(e))
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
                        return (0, eW._)(t, e) ? t : (0, eW._)(t, Promise) ? e.fromPromiseResult(t) : e.fromResult(t)
                    }
                }, {
                    key: "fn",
                    value: function(t) {
                        return function() {
                            for (var n = arguments.length, r = Array(n), a = 0; a < n; a++) r[a] = arguments[a];
                            return e.fromPromiseResult(t.apply(void 0, e9(r)))
                        }
                    }
                }, {
                    key: "all",
                    value: function(t) {
                        return new e(Promise.all(t).then(ef.all))
                    }
                }]), e
            }();
            uo(Error);
            var uc = function(e) {
                    function t(e) {
                        var n;
                        return e1(this, t), eD(n = r5(this, t, [e.message, {
                            cause: e
                        }]), "cause", void 0), n.cause = e, n
                    }
                    return r8(t, e), t
                }(uo(Error)),
                uf = function(e, t) {
                    try {
                        var n;
                        return n = JSON.stringify(e, void 0, t), new uu(n)
                    } catch (e) {
                        return new us(new uc(e))
                    }
                };

            function ud(e) {
                return null == e || Number.isNaN(e) ? String(Math.trunc(1e6 * performance.timeOrigin + 1e6 * performance.now())) : String(Math.trunc(1e9 * e))
            }

            function up(e) {
                var t = [],
                    n = !0,
                    r = !1,
                    a = void 0;
                try {
                    for (var i, o = e[Symbol.iterator](); !(n = (i = o.next()).done); n = !0) {
                        var u = i.value,
                            s = !0,
                            l = !1,
                            c = void 0;
                        try {
                            for (var f, d = (null == u || (void 0 === u ? "undefined" : (0, e8._)(u)) !== "object" ? [] : Object.entries(u))[Symbol.iterator](); !(s = (f = d.next()).done); s = !0) {
                                var p = eK(f.value, 2),
                                    v = p[0],
                                    m = p[1];
                                null != m && t.push({
                                    key: v,
                                    value: function e(t) {
                                        switch (void 0 === t ? "undefined" : (0, e8._)(t)) {
                                            case "string":
                                                return {
                                                    stringValue: t
                                                };
                                            case "boolean":
                                                return {
                                                    boolValue: t
                                                };
                                            case "number":
                                                return Number.isInteger(t) ? {
                                                    intValue: String(t)
                                                } : {
                                                    doubleValue: t
                                                };
                                            case "object":
                                                if (null === t) return {
                                                    stringValue: "null"
                                                };
                                                if (Array.isArray(t)) return {
                                                    arrayValue: {
                                                        values: t.map(e)
                                                    }
                                                };
                                                return {
                                                    kvlistValue: {
                                                        values: Object.entries(t).map(function(t) {
                                                            var n = eK(t, 2);
                                                            return {
                                                                key: n[0],
                                                                value: e(n[1])
                                                            }
                                                        })
                                                    }
                                                };
                                            case "bigint":
                                                return {
                                                    intValue: String(t)
                                                };
                                            case "symbol":
                                            default:
                                                return {
                                                    stringValue: String(t)
                                                };
                                            case "undefined":
                                                return {
                                                    stringValue: "undefined"
                                                };
                                            case "function":
                                                return {
                                                    stringValue: "[Function]"
                                                }
                                        }
                                    }(m)
                                })
                            }
                        } catch (e) {
                            l = !0, c = e
                        } finally {
                            try {
                                s || null == d.return || d.return()
                            } finally {
                                if (l) throw c
                            }
                        }
                    }
                } catch (e) {
                    r = !0, a = e
                } finally {
                    try {
                        n || null == o.return || o.return()
                    } finally {
                        if (r) throw a
                    }
                }
                return t
            }
            var uv = function(e) {
                return null == e || "" === e ? void 0 : e
            };

            function um(e) {
                if (!e) return {
                    code: 0
                };
                var t = e.toLowerCase();
                return "ok" === t ? {
                    code: 1
                } : ["cancelled", "unknown_error", "invalid_argument", "deadline_exceeded", "not_found", "already_exists", "permission_denied", "resource_exhausted", "failed_precondition", "aborted", "out_of_range", "unimplemented", "internal_error", "unavailable", "data_loss", "unauthenticated"].includes(t) ? {
                    code: 2,
                    message: e
                } : {
                    code: 0
                }
            }

            function uh(e) {
                if (!e) return 1;
                var t = e.toLowerCase();
                return t.includes("http") || t.includes("fetch") || t.includes("xhr") || t.includes("db") || t.includes("query") || t.includes("sql") ? 3 : t.includes("server") || t.includes("request") ? 2 : t.includes("publish") || t.includes("send") || t.includes("produce") ? 4 : t.includes("consume") || t.includes("receive") || t.includes("process") ? 5 : 1
            }
            var ug = new Set(["ttfb", "lcp", "fcp", "cls"]);

            function uy(e, t, n) {
                function r(n, r) {
                    var a, i;
                    for (var u in Object.defineProperty(n, "_zod", {
                            value: null != (a = n._zod) ? a : {},
                            enumerable: !1
                        }), null != (i = n._zod).traits || (i.traits = new Set), n._zod.traits.add(e), t(n, r), o.prototype) u in n || Object.defineProperty(n, u, {
                        value: o.prototype[u].bind(n)
                    });
                    n._zod.constr = o, n._zod.def = r
                }
                var a, i = function(e) {
                    function t() {
                        return e1(this, t), r5(this, t, arguments)
                    }
                    return r8(t, e), t
                }(null != (a = null == n ? void 0 : n.Parent) ? a : Object);

                function o(e) {
                    var t = (null == n ? void 0 : n.Parent) ? new i : this;
                    r(t, e), null != (l = t._zod).deferred || (l.deferred = []);
                    var a = !0,
                        o = !1,
                        u = void 0;
                    try {
                        for (var s, l, c, f = t._zod.deferred[Symbol.iterator](); !(a = (c = f.next()).done); a = !0)(0, c.value)()
                    } catch (e) {
                        o = !0, u = e
                    } finally {
                        try {
                            a || null == f.return || f.return()
                        } finally {
                            if (o) throw u
                        }
                    }
                    return t
                }
                return Object.defineProperty(i, "name", {
                    value: e
                }), Object.defineProperty(o, "init", {
                    value: r
                }), Object.defineProperty(o, Symbol.hasInstance, {
                    value: function(t) {
                        var r, a;
                        return !!((null == n ? void 0 : n.Parent) && (0, eW._)(t, n.Parent)) || (null == t || null == (a = t._zod) || null == (r = a.traits) ? void 0 : r.has(e))
                    }
                }), Object.defineProperty(o, "name", {
                    value: e
                }), o
            }
            Object.freeze({
                status: "aborted"
            }), Symbol("zod_brand");
            var ub = function(e) {
                    function t() {
                        return e1(this, t), r5(this, t, ["Encountered Promise during synchronous parse. Use .parseAsync() instead."])
                    }
                    return r8(t, e), t
                }(uo(Error)),
                u_ = function(e) {
                    function t(e) {
                        var n;
                        return e1(this, t), (n = r5(this, t, ["Encountered unidirectional transform during encode: ".concat(e)])).name = "ZodEncodeError", n
                    }
                    return r8(t, e), t
                }(uo(Error)),
                uE = {};

            function uS(e) {
                return e && Object.assign(uE, e), uE
            }

            function uw(e, t) {
                return (void 0 === t ? "undefined" : (0, e8._)(t)) === "bigint" ? t.toString() : t
            }

            function uT(e) {
                return {
                    get value() {
                        var t = e();
                        return Object.defineProperty(this, "value", {
                            value: t
                        }), t
                    }
                }
            }
            var uI = Symbol("evaluating");

            function uN(e, t, n) {
                var r = void 0;
                Object.defineProperty(e, t, {
                    get: function() {
                        if (r !== uI) return void 0 === r && (r = uI, r = n()), r
                    },
                    set: function(n) {
                        Object.defineProperty(e, t, {
                            value: n
                        })
                    },
                    configurable: !0
                })
            }
            var uA = "captureStackTrace" in Error ? Error.captureStackTrace : function() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n]
            };

            function uk(e) {
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
                return (delete e.message, "string" == typeof e.error) ? eG(eY({}, e), {
                    error: function() {
                        return e.error
                    }
                }) : e
            }

            function ux(e) {
                var t, n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
                if (!0 === e.aborted) return !0;
                for (var r = n; r < e.issues.length; r++)
                    if ((null == (t = e.issues[r]) ? void 0 : t.continue) !== !0) return !0;
                return !1
            }

            function uR(e) {
                return "string" == typeof e ? e : null == e ? void 0 : e.message
            }

            function uO(e, t, n) {
                var r, a, i, o, u, s, l, c, f, d, p, v = eG(eY({}, e), {
                    path: null != (r = e.path) ? r : []
                });
                return e.message || (v.message = null != (a = null != (i = null != (o = null != (u = uR(null == (c = e.inst) || null == (l = c._zod.def) || null == (s = l.error) ? void 0 : s.call(l, e))) ? u : uR(null == t || null == (f = t.error) ? void 0 : f.call(t, e))) ? o : uR(null == (d = n.customError) ? void 0 : d.call(n, e))) ? i : uR(null == (p = n.localeError) ? void 0 : p.call(n, e))) ? a : "Invalid input"), delete v.inst, delete v.continue, (null == t ? void 0 : t.reportInput) || delete v.input, v
            }
            uT(function() {
                var e, t;
                if ("u" > typeof navigator && (null == (t = navigator) || null == (e = t.userAgent) ? void 0 : e.includes("Cloudflare"))) return !1;
                try {
                    return Function(""), !0
                } catch (e) {
                    return !1
                }
            });
            var uV = function(e, t) {
                    e.name = "$ZodError", Object.defineProperty(e, "_zod", {
                        value: e._zod,
                        enumerable: !1
                    }), Object.defineProperty(e, "issues", {
                        value: t,
                        enumerable: !1
                    }), e.message = JSON.stringify(t, uw, 2), Object.defineProperty(e, "toString", {
                        value: function() {
                            return e.message
                        },
                        enumerable: !1
                    })
                },
                uC = uy("$ZodError", uV),
                uZ = uy("$ZodError", uV, {
                    Parent: Error
                }),
                uB = (e = uZ, function(t, n, r, a) {
                    var i = r ? Object.assign(r, {
                            async: !1
                        }) : {
                            async: !1
                        },
                        o = t._zod.run({
                            value: n,
                            issues: []
                        }, i);
                    if ((0, eW._)(o, Promise)) throw new ub;
                    if (o.issues.length) {
                        var u, s = new(null != (u = null == a ? void 0 : a.Err) ? u : e)(o.issues.map(function(e) {
                            return uO(e, i, uS())
                        }));
                        throw uA(s, null == a ? void 0 : a.callee), s
                    }
                    return o.value
                }),
                uL = (t = uZ, function(e, n, r, a) {
                    return rN(function() {
                        var i, o, u, s;
                        return rA(this, function(l) {
                            switch (l.label) {
                                case 0:
                                    if (i = r ? Object.assign(r, {
                                            async: !0
                                        }) : {
                                            async: !0
                                        }, o = e._zod.run({
                                            value: n,
                                            issues: []
                                        }, i), !(0, eW._)(o, Promise)) return [3, 2];
                                    return [4, o];
                                case 1:
                                    o = l.sent(), l.label = 2;
                                case 2:
                                    if (o.issues.length) throw uA(s = new(null != (u = null == a ? void 0 : a.Err) ? u : t)(o.issues.map(function(e) {
                                        return uO(e, i, uS())
                                    })), null == a ? void 0 : a.callee), s;
                                    return [2, o.value]
                            }
                        })
                    })()
                }),
                uF = (r = uZ, function(e, t, n) {
                    var a = n ? eG(eY({}, n), {
                            async: !1
                        }) : {
                            async: !1
                        },
                        i = e._zod.run({
                            value: t,
                            issues: []
                        }, a);
                    if ((0, eW._)(i, Promise)) throw new ub;
                    return i.issues.length ? {
                        success: !1,
                        error: new(null != r ? r : uC)(i.issues.map(function(e) {
                            return uO(e, a, uS())
                        }))
                    } : {
                        success: !0,
                        data: i.value
                    }
                }),
                uP = (a = uZ, function(e, t, n) {
                    return rN(function() {
                        var r, i;
                        return rA(this, function(o) {
                            switch (o.label) {
                                case 0:
                                    if (r = n ? Object.assign(n, {
                                            async: !0
                                        }) : {
                                            async: !0
                                        }, i = e._zod.run({
                                            value: t,
                                            issues: []
                                        }, r), !(0, eW._)(i, Promise)) return [3, 2];
                                    return [4, i];
                                case 1:
                                    i = o.sent(), o.label = 2;
                                case 2:
                                    return [2, i.issues.length ? {
                                        success: !1,
                                        error: new a(i.issues.map(function(e) {
                                            return uO(e, r, uS())
                                        }))
                                    } : {
                                        success: !0,
                                        data: i.value
                                    }]
                            }
                        })
                    })()
                });
            RegExp('^[^\\s@"]{1,64}@[^\\s@]{1,255}$', "u");
            var uX = function(e) {
                    var t, n, r = e ? "[\\s\\S]{".concat(null != (t = null == e ? void 0 : e.minimum) ? t : 0, ",").concat(null != (n = null == e ? void 0 : e.maximum) ? n : "", "}") : "[\\s\\S]*";
                    return new RegExp("^".concat(r, "$"))
                },
                uU = /^(?:true|false)$/i,
                uW = uy("$ZodCheck", function(e, t) {
                    var n;
                    null != e._zod || (e._zod = {}), e._zod.def = t, null != (n = e._zod).onattach || (n.onattach = [])
                }),
                uD = uy("$ZodCheckOverwrite", function(e, t) {
                    uW.init(e, t), e._zod.check = function(e) {
                        e.value = t.tx(e.value)
                    }
                }),
                uY = {
                    major: 4,
                    minor: 1,
                    patch: 11
                },
                uG = uy("$ZodType", function(e, t) {
                    null != e || (e = {}), e._zod.def = t, e._zod.bag = e._zod.bag || {}, e._zod.version = uY;
                    var n, r = e9(null != (u = e._zod.def.checks) ? u : []);
                    e._zod.traits.has("$ZodCheck") && r.unshift(e);
                    var a = !0,
                        i = !1,
                        o = void 0;
                    try {
                        for (var u, s, l, c = r[Symbol.iterator](); !(a = (l = c.next()).done); a = !0) {
                            var f = l.value,
                                d = !0,
                                p = !1,
                                v = void 0;
                            try {
                                for (var m, h = f._zod.onattach[Symbol.iterator](); !(d = (m = h.next()).done); d = !0)(0, m.value)(e)
                            } catch (e) {
                                p = !0, v = e
                            } finally {
                                try {
                                    d || null == h.return || h.return()
                                } finally {
                                    if (p) throw v
                                }
                            }
                        }
                    } catch (e) {
                        i = !0, o = e
                    } finally {
                        try {
                            a || null == c.return || c.return()
                        } finally {
                            if (i) throw o
                        }
                    }
                    if (0 === r.length) null != (s = e._zod).deferred || (s.deferred = []), null == (n = e._zod.deferred) || n.push(function() {
                        e._zod.run = e._zod.parse
                    });
                    else {
                        var g = function(e, t, n) {
                                var r = ux(e),
                                    a = !0,
                                    i = !1,
                                    o = void 0;
                                try {
                                    for (var u, s, l = t[Symbol.iterator](); !(a = (s = l.next()).done); a = !0) ! function() {
                                        var t = s.value;
                                        if (t._zod.def.when) {
                                            if (!t._zod.def.when(e)) return
                                        } else if (r) return;
                                        var a = e.issues.length,
                                            i = t._zod.check(e);
                                        if ((0, eW._)(i, Promise) && (null == n ? void 0 : n.async) === !1) throw new ub;
                                        if (u || (0, eW._)(i, Promise)) u = (null != u ? u : Promise.resolve()).then(function() {
                                            return rN(function() {
                                                return rA(this, function(t) {
                                                    switch (t.label) {
                                                        case 0:
                                                            return [4, i];
                                                        case 1:
                                                            if (t.sent(), e.issues.length === a) return [2];
                                                            return r || (r = ux(e, a)), [2]
                                                    }
                                                })
                                            })()
                                        });
                                        else {
                                            if (e.issues.length === a) return;
                                            r || (r = ux(e, a))
                                        }
                                    }()
                                } catch (e) {
                                    i = !0, o = e
                                } finally {
                                    try {
                                        a || null == l.return || l.return()
                                    } finally {
                                        if (i) throw o
                                    }
                                }
                                return u ? u.then(function() {
                                    return e
                                }) : e
                            },
                            y = function(t, n, a) {
                                if (ux(t)) return t.aborted = !0, t;
                                var i = g(n, r, a);
                                if ((0, eW._)(i, Promise)) {
                                    if (!1 === a.async) throw new ub;
                                    return i.then(function(t) {
                                        return e._zod.parse(t, a)
                                    })
                                }
                                return e._zod.parse(i, a)
                            };
                        e._zod.run = function(t, n) {
                            if (n.skipChecks) return e._zod.parse(t, n);
                            if ("backward" === n.direction) {
                                var a = e._zod.parse({
                                    value: t.value,
                                    issues: []
                                }, eG(eY({}, n), {
                                    skipChecks: !0
                                }));
                                return (0, eW._)(a, Promise) ? a.then(function(e) {
                                    return y(e, t, n)
                                }) : y(a, t, n)
                            }
                            var i = e._zod.parse(t, n);
                            if ((0, eW._)(i, Promise)) {
                                if (!1 === n.async) throw new ub;
                                return i.then(function(e) {
                                    return g(e, r, n)
                                })
                            }
                            return g(i, r, n)
                        }
                    }
                    e["~standard"] = {
                        validate: function(t) {
                            try {
                                var n, r = uF(e, t);
                                return r.success ? {
                                    value: r.data
                                } : {
                                    issues: null == (n = r.error) ? void 0 : n.issues
                                }
                            } catch (n) {
                                return uP(e, t).then(function(e) {
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
                uj = uy("$ZodString", function(e, t) {
                    var n, r, a;
                    uG.init(e, t), e._zod.pattern = null != (n = e9(null != (r = null == e || null == (a = e._zod.bag) ? void 0 : a.patterns) ? r : []).pop()) ? n : uX(e._zod.bag), e._zod.parse = function(n, r) {
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
                }),
                uM = uy("$ZodBoolean", function(e, t) {
                    uG.init(e, t), e._zod.pattern = uU, e._zod.parse = function(n, r) {
                        if (t.coerce) try {
                            n.value = !!n.value
                        } catch (e) {}
                        var a = n.value;
                        return "boolean" == typeof a || n.issues.push({
                            expected: "boolean",
                            code: "invalid_type",
                            input: a,
                            inst: e
                        }), n
                    }
                });

            function uz(e, t, n, r) {
                if (e.issues.length) {
                    var a;
                    (a = t.issues).push.apply(a, e9(e.issues.map(function(e) {
                        return null != e.path || (e.path = []), e.path.unshift(n), e
                    })))
                }
                void 0 === e.value ? n in r && (t.value[n] = void 0) : t.value[n] = e.value
            }
            var uJ = uy("$ZodObject", function(e, t) {
                uG.init(e, t);
                var n, r = Object.getOwnPropertyDescriptor(t, "shape");
                if (!(null == r ? void 0 : r.get)) {
                    var a = t.shape;
                    Object.defineProperty(t, "shape", {
                        get: function() {
                            var e = eY({}, a);
                            return Object.defineProperty(t, "shape", {
                                value: e
                            }), e
                        }
                    })
                }
                var i = uT(function() {
                    return function(e) {
                        var t, n = Object.keys(e.shape),
                            r = !0,
                            a = !1,
                            i = void 0;
                        try {
                            for (var o, u = n[Symbol.iterator](); !(r = (o = u.next()).done); r = !0) {
                                var s, l, c, f, d = o.value;
                                if (!(null == (f = e.shape) || null == (c = f[d]) || null == (l = c._zod) || null == (s = l.traits) ? void 0 : s.has("$ZodType"))) throw Error('Invalid element at key "'.concat(d, '": expected a Zod schema'))
                            }
                        } catch (e) {
                            a = !0, i = e
                        } finally {
                            try {
                                r || null == u.return || u.return()
                            } finally {
                                if (a) throw i
                            }
                        }
                        var p = Object.keys(t = e.shape).filter(function(e) {
                            return "optional" === t[e]._zod.optin && "optional" === t[e]._zod.optout
                        });
                        return eG(eY({}, e), {
                            keys: n,
                            keySet: new Set(n),
                            numKeys: n.length,
                            optionalKeys: new Set(p)
                        })
                    }(t)
                });
                uN(e._zod, "propValues", function() {
                    var e = t.shape,
                        n = {};
                    for (var r in e) {
                        var a = e[r]._zod;
                        if (a.values) {
                            null != n[r] || (n[r] = new Set);
                            var i = !0,
                                o = !1,
                                u = void 0;
                            try {
                                for (var s, l, c = a.values[Symbol.iterator](); !(i = (l = c.next()).done); i = !0) {
                                    var f = l.value;
                                    n[r].add(f)
                                }
                            } catch (e) {
                                o = !0, u = e
                            } finally {
                                try {
                                    i || null == c.return || c.return()
                                } finally {
                                    if (o) throw u
                                }
                            }
                        }
                    }
                    return n
                });
                var o = t.catchall;
                e._zod.parse = function(t, r) {
                    null != n || (n = i.value);
                    var a = t.value;
                    if (!((void 0 === (d = a) ? "undefined" : (0, e8._)(d)) === "object" && null !== d && !Array.isArray(d))) return t.issues.push({
                        expected: "object",
                        code: "invalid_type",
                        input: a,
                        inst: e
                    }), t;
                    t.value = {};
                    var u = [],
                        s = n.shape,
                        l = !0,
                        c = !1,
                        f = void 0;
                    try {
                        for (var d, p, v = n.keys[Symbol.iterator](); !(l = (p = v.next()).done); l = !0) ! function() {
                            var e = p.value,
                                n = s[e]._zod.run({
                                    value: a[e],
                                    issues: []
                                }, r);
                            (0, eW._)(n, Promise) ? u.push(n.then(function(n) {
                                return uz(n, t, e, a)
                            })): uz(n, t, e, a)
                        }()
                    } catch (e) {
                        c = !0, f = e
                    } finally {
                        try {
                            l || null == v.return || v.return()
                        } finally {
                            if (c) throw f
                        }
                    }
                    return o ? function(e, t, n, r, a, i) {
                        var o = [],
                            u = a.keySet,
                            s = a.catchall._zod,
                            l = s.def.type,
                            c = !0,
                            f = !1,
                            d = void 0;
                        try {
                            for (var p, v = Object.keys(t)[Symbol.iterator](); !(c = (p = v.next()).done); c = !0) ! function() {
                                var a = p.value;
                                if (!u.has(a)) {
                                    if ("never" === l) return o.push(a);
                                    var i = s.run({
                                        value: t[a],
                                        issues: []
                                    }, r);
                                    (0, eW._)(i, Promise) ? e.push(i.then(function(e) {
                                        return uz(e, n, a, t)
                                    })): uz(i, n, a, t)
                                }
                            }()
                        } catch (e) {
                            f = !0, d = e
                        } finally {
                            try {
                                c || null == v.return || v.return()
                            } finally {
                                if (f) throw d
                            }
                        }
                        return (o.length && n.issues.push({
                            code: "unrecognized_keys",
                            keys: o,
                            input: t,
                            inst: i
                        }), e.length) ? Promise.all(e).then(function() {
                            return n
                        }) : n
                    }(u, a, t, r, i.value, e) : u.length ? Promise.all(u).then(function() {
                        return t
                    }) : t
                }
            });

            function uK(e, t, n, r) {
                var a = !0,
                    i = !1,
                    o = void 0;
                try {
                    for (var u, s = e[Symbol.iterator](); !(a = (u = s.next()).done); a = !0) {
                        var l = u.value;
                        if (0 === l.issues.length) return t.value = l.value, t
                    }
                } catch (e) {
                    i = !0, o = e
                } finally {
                    try {
                        a || null == s.return || s.return()
                    } finally {
                        if (i) throw o
                    }
                }
                var c = e.filter(function(e) {
                    return !ux(e)
                });
                return 1 === c.length ? (t.value = c[0].value, c[0]) : (t.issues.push({
                    code: "invalid_union",
                    input: t.value,
                    inst: n,
                    errors: e.map(function(e) {
                        return e.issues.map(function(e) {
                            return uO(e, r, uS())
                        })
                    })
                }), t)
            }
            var uH = uy("$ZodUnion", function(e, t) {
                    uG.init(e, t), uN(e._zod, "optin", function() {
                        return t.options.some(function(e) {
                            return "optional" === e._zod.optin
                        }) ? "optional" : void 0
                    }), uN(e._zod, "optout", function() {
                        return t.options.some(function(e) {
                            return "optional" === e._zod.optout
                        }) ? "optional" : void 0
                    }), uN(e._zod, "values", function() {
                        if (t.options.every(function(e) {
                                return e._zod.values
                            })) return new Set(t.options.flatMap(function(e) {
                            return Array.from(e._zod.values)
                        }))
                    }), uN(e._zod, "pattern", function() {
                        if (t.options.every(function(e) {
                                return e._zod.pattern
                            })) {
                            var e = t.options.map(function(e) {
                                return e._zod.pattern
                            });
                            return new RegExp("^(".concat(e.map(function(e) {
                                var t, n, r;
                                return n = +!!(t = e.source).startsWith("^"), r = t.endsWith("$") ? t.length - 1 : t.length, t.slice(n, r)
                            }).join("|"), ")$"))
                        }
                    });
                    var n = 1 === t.options.length,
                        r = t.options[0]._zod.run;
                    e._zod.parse = function(a, i) {
                        if (n) return r(a, i);
                        var o = !1,
                            u = [],
                            s = !0,
                            l = !1,
                            c = void 0;
                        try {
                            for (var f, d = t.options[Symbol.iterator](); !(s = (f = d.next()).done); s = !0) {
                                var p = f.value._zod.run({
                                    value: a.value,
                                    issues: []
                                }, i);
                                if ((0, eW._)(p, Promise)) u.push(p), o = !0;
                                else {
                                    if (0 === p.issues.length) return p;
                                    u.push(p)
                                }
                            }
                        } catch (e) {
                            l = !0, c = e
                        } finally {
                            try {
                                s || null == d.return || d.return()
                            } finally {
                                if (l) throw c
                            }
                        }
                        return o ? Promise.all(u).then(function(t) {
                            return uK(t, a, e, i)
                        }) : uK(u, a, e, i)
                    }
                }),
                uQ = uy("$ZodTransform", function(e, t) {
                    uG.init(e, t), e._zod.parse = function(n, r) {
                        if ("backward" === r.direction) throw new u_(e.constructor.name);
                        var a = t.transform(n.value, n);
                        if (r.async) return ((0, eW._)(a, Promise) ? a : Promise.resolve(a)).then(function(e) {
                            return n.value = e, n
                        });
                        if ((0, eW._)(a, Promise)) throw new ub;
                        return n.value = a, n
                    }
                }),
                uq = uy("$ZodCatch", function(e, t) {
                    uG.init(e, t), uN(e._zod, "optin", function() {
                        return t.innerType._zod.optin
                    }), uN(e._zod, "optout", function() {
                        return t.innerType._zod.optout
                    }), uN(e._zod, "values", function() {
                        return t.innerType._zod.values
                    }), e._zod.parse = function(e, n) {
                        if ("backward" === n.direction) return t.innerType._zod.run(e, n);
                        var r = t.innerType._zod.run(e, n);
                        return (0, eW._)(r, Promise) ? r.then(function(r) {
                            return e.value = r.value, r.issues.length && (e.value = t.catchValue(eG(eY({}, e), {
                                error: {
                                    issues: r.issues.map(function(e) {
                                        return uO(e, n, uS())
                                    })
                                },
                                input: e.value
                            })), e.issues = []), e
                        }) : (e.value = r.value, r.issues.length && (e.value = t.catchValue(eG(eY({}, e), {
                            error: {
                                issues: r.issues.map(function(e) {
                                    return uO(e, n, uS())
                                })
                            },
                            input: e.value
                        })), e.issues = []), e)
                    }
                }),
                u$ = uy("$ZodPipe", function(e, t) {
                    uG.init(e, t), uN(e._zod, "values", function() {
                        return t.in._zod.values
                    }), uN(e._zod, "optin", function() {
                        return t.in._zod.optin
                    }), uN(e._zod, "optout", function() {
                        return t.out._zod.optout
                    }), uN(e._zod, "propValues", function() {
                        return t.in._zod.propValues
                    }), e._zod.parse = function(e, n) {
                        if ("backward" === n.direction) {
                            var r = t.out._zod.run(e, n);
                            return (0, eW._)(r, Promise) ? r.then(function(e) {
                                return u0(e, t.in, n)
                            }) : u0(r, t.in, n)
                        }
                        var a = t.in._zod.run(e, n);
                        return (0, eW._)(a, Promise) ? a.then(function(e) {
                            return u0(e, t.out, n)
                        }) : u0(a, t.out, n)
                    }
                });

            function u0(e, t, n) {
                return e.issues.length ? (e.aborted = !0, e) : t._zod.run({
                    value: e.value,
                    issues: e.issues
                }, n)
            }
            var u1 = uy("$ZodCodec", function(e, t) {
                uG.init(e, t), uN(e._zod, "values", function() {
                    return t.in._zod.values
                }), uN(e._zod, "optin", function() {
                    return t.in._zod.optin
                }), uN(e._zod, "optout", function() {
                    return t.out._zod.optout
                }), uN(e._zod, "propValues", function() {
                    return t.in._zod.propValues
                }), e._zod.parse = function(e, n) {
                    if ("forward" === (n.direction || "forward")) {
                        var r = t.in._zod.run(e, n);
                        return (0, eW._)(r, Promise) ? r.then(function(e) {
                            return u2(e, t, n)
                        }) : u2(r, t, n)
                    }
                    var a = t.out._zod.run(e, n);
                    return (0, eW._)(a, Promise) ? a.then(function(e) {
                        return u2(e, t, n)
                    }) : u2(a, t, n)
                }
            });

            function u2(e, t, n) {
                if (e.issues.length) return e.aborted = !0, e;
                if ("forward" === (n.direction || "forward")) {
                    var r = t.transform(e.value, e);
                    return (0, eW._)(r, Promise) ? r.then(function(r) {
                        return u3(e, r, t.out, n)
                    }) : u3(e, r, t.out, n)
                }
                var a = t.reverseTransform(e.value, e);
                return (0, eW._)(a, Promise) ? a.then(function(r) {
                    return u3(e, r, t.in, n)
                }) : u3(e, a, t.in, n)
            }

            function u3(e, t, n, r) {
                return e.issues.length ? (e.aborted = !0, e) : n._zod.run({
                    value: t,
                    issues: e.issues
                }, r)
            }

            function u5(e, t) {
                var n, r, a, i, o, u = uk(t),
                    s = null != (n = u.truthy) ? n : ["true", "1", "yes", "on", "y", "enabled"],
                    l = null != (r = u.falsy) ? r : ["false", "0", "no", "off", "n", "disabled"];
                "sensitive" !== u.case && (s = s.map(function(e) {
                    return "string" == typeof e ? e.toLowerCase() : e
                }), l = l.map(function(e) {
                    return "string" == typeof e ? e.toLowerCase() : e
                }));
                var c = new Set(s),
                    f = new Set(l),
                    d = null != (a = e.Codec) ? a : u1,
                    p = null != (i = e.Boolean) ? i : uM,
                    v = new d({
                        type: "pipe",
                        in: new(null != (o = e.String) ? o : uj)({
                            type: "string",
                            error: u.error
                        }),
                        out: new p({
                            type: "boolean",
                            error: u.error
                        }),
                        transform: function(e, t) {
                            var n = e;
                            return "sensitive" !== u.case && (n = n.toLowerCase()), !!c.has(n) || !f.has(n) && (t.issues.push({
                                code: "invalid_value",
                                expected: "stringbool",
                                values: e9(c).concat(e9(f)),
                                input: t.value,
                                inst: v,
                                continue: !1
                            }), {})
                        },
                        reverseTransform: function(e, t) {
                            return !0 === e ? s[0] || "true" : l[0] || "false"
                        },
                        error: u.error
                    });
                return v
            }
            Symbol("ZodOutput"), Symbol("ZodInput");
            var u9 = uy("ZodMiniType", function(e, t) {
                    if (!e._zod) throw Error("Uninitialized schema in ZodMiniType.");
                    uG.init(e, t), e.def = t, e.type = t.type, e.parse = function(t, n) {
                        return uB(e, t, n, {
                            callee: e.parse
                        })
                    }, e.safeParse = function(t, n) {
                        return uF(e, t, n)
                    }, e.parseAsync = function(t, n) {
                        return rN(function() {
                            return rA(this, function(r) {
                                return [2, uL(e, t, n, {
                                    callee: e.parseAsync
                                })]
                            })
                        })()
                    }, e.safeParseAsync = function(t, n) {
                        return rN(function() {
                            return rA(this, function(r) {
                                return [2, uP(e, t, n)]
                            })
                        })()
                    }, e.check = function() {
                        for (var n, r = arguments.length, a = Array(r), i = 0; i < r; i++) a[i] = arguments[i];
                        return e.clone(eG(eY({}, t), {
                            checks: e9(null != (n = t.checks) ? n : []).concat(e9(a.map(function(e) {
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
                u4 = uy("ZodMiniString", function(e, t) {
                    uj.init(e, t), u9.init(e, t)
                }),
                u8 = uy("ZodMiniBoolean", function(e, t) {
                    uM.init(e, t), u9.init(e, t)
                }),
                u6 = uy("ZodMiniObject", function(e, t) {
                    uJ.init(e, t), u9.init(e, t), uN(e, "shape", function() {
                        return t.shape
                    })
                }),
                u7 = uy("ZodMiniUnion", function(e, t) {
                    uH.init(e, t), u9.init(e, t)
                }),
                se = uy("ZodMiniTransform", function(e, t) {
                    uQ.init(e, t), u9.init(e, t)
                });

            function st(e) {
                return new se({
                    type: "transform",
                    transform: e
                })
            }
            var sn = uy("ZodMiniCatch", function(e, t) {
                uq.init(e, t), u9.init(e, t)
            });

            function sr(e, t) {
                return new sn({
                    type: "catch",
                    innerType: e,
                    catchValue: "function" == typeof t ? t : function() {
                        return t
                    }
                })
            }
            var sa = uy("ZodMiniPipe", function(e, t) {
                u$.init(e, t), u9.init(e, t)
            });

            function si(e, t) {
                return new sa({
                    type: "pipe",
                    in: e,
                    out: t
                })
            }
            var so = uy("ZodMiniCodec", function(e, t) {
                    sa.init(e, t), u1.init(e, t)
                }),
                su = sr((l = [new u8(eY({
                    type: "boolean"
                }, uk(void 0))), function() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    return u5.apply(void 0, [{
                        Codec: so,
                        Boolean: u8,
                        String: u4
                    }].concat(e9(t)))
                }({
                    truthy: ["true"],
                    falsy: ["false"]
                })], new u7(eY({
                    type: "union",
                    options: l
                }, uk(void 0)))), !1),
                ss = function(e, t) {
                    var n = new Map(e.map(function(e) {
                        return [e.toLowerCase(), e]
                    }));
                    return si(sr(new u4(eY({
                        type: "string"
                    }, uk(void 0))).check(new uD({
                        check: "overwrite",
                        tx: function(e) {
                            return e.toLowerCase()
                        }
                    })), t.toLowerCase()), st(function(e) {
                        var r;
                        return null != (r = n.get(e)) ? r : t
                    }))
                },
                sl = {
                    isUwpApp: "isUWPApp",
                    isPcgdkApp: "isPcGdkApp"
                },
                sc = new u6(eY({
                    type: "object",
                    shape: {
                        browser: ss(["chrome", "edge", "firefox", "safari", "unknown"], "unknown"),
                        operatingSystem: ss(["ios", "android", "osx", "windows", "windowsPhone", "xboxOne", "xboxOneSTx", "playStation", "chromeOS", "unknown"], "unknown"),
                        deviceType: ss(["computer", "tablet", "phone", "console", "vr", "unknown"], "unknown"),
                        appType: ss(["android", "ios", "xbox", "uwp", "amazon", "win32", "universalApp", "unknown"], "unknown"),
                        isInApp: su,
                        isDesktop: su,
                        isPhone: su,
                        isTablet: su,
                        isConsole: su,
                        isAndroidApp: su,
                        isIosApp: su,
                        isUWPApp: su,
                        isXboxApp: su,
                        isAmazonApp: su,
                        isWin32App: su,
                        isStudio: su,
                        isIosDevice: su,
                        isAndroidDevice: su,
                        isUniversalApp: su,
                        isChromeOs: su,
                        isSamsungGalaxyStoreApp: su,
                        isPcGdkApp: su,
                        isMac: su,
                        isWindows: su
                    }
                }, uk(void 0))),
                sf = Object.assign(si(st(function(e) {
                    if (!((void 0 === e ? "undefined" : (0, e8._)(e)) === "object" && null != e && !Array.isArray(e))) return e;
                    var t = eY({}, e),
                        n = !0,
                        r = !1,
                        a = void 0;
                    try {
                        for (var i, o = Object.entries(sl)[Symbol.iterator](); !(n = (i = o.next()).done); n = !0) {
                            var u = eK(i.value, 2),
                                s = u[0],
                                l = u[1];
                            void 0 === t[l] && void 0 !== t[s] && (t[l] = t[s])
                        }
                    } catch (e) {
                        r = !0, a = e
                    } finally {
                        try {
                            n || null == o.return || o.return()
                        } finally {
                            if (r) throw a
                        }
                    }
                    return t
                }), sc), {
                    shape: sc.shape
                }),
                sd = {
                    browser: "unknown",
                    deviceType: "unknown",
                    operatingSystem: "unknown",
                    appType: "unknown",
                    isInApp: !1,
                    isDesktop: !1,
                    isPhone: !1,
                    isTablet: !1,
                    isConsole: !1,
                    isAndroidApp: !1,
                    isIosApp: !1,
                    isUWPApp: !1,
                    isXboxApp: !1,
                    isAmazonApp: !1,
                    isWin32App: !1,
                    isStudio: !1,
                    isIosDevice: !1,
                    isAndroidDevice: !1,
                    isUniversalApp: !1,
                    isChromeOs: !1,
                    isPcGdkApp: !1,
                    isSamsungGalaxyStoreApp: !1,
                    isMac: !1,
                    isWindows: !1
                },
                sp = function(e) {
                    return /Firefox\/|FxiOS\//i.test(e) ? "firefox" : /Edg(?:e|A|iOS)?\//i.test(e) ? "edge" : /Chrome\/|CriOS\//i.test(e) ? "chrome" : /Safari\//i.test(e) ? "safari" : "unknown"
                },
                sv = "sitetest3",
                sm = "https://otel-collector-otlp-http-sitetest3.simulpong.com/v1/traces";

            function sh(e, t) {
                var n = null == t ? void 0 : t.domain;
                if (null != n) {
                    var r = eK(n.split("."), 1)[0],
                        a = null == r ? void 0 : r.trim().toLowerCase();
                    return {
                        production: (null == t ? void 0 : t.isTestingSite) === "false",
                        domainName: null != a && a.length > 0 ? a : sv
                    }
                }
                if ("localhost" === e) return {
                    production: !1,
                    domainName: sv
                };
                var i = e.toLowerCase().split("."),
                    o = i.slice(-2).join("."),
                    u = i.find(function(e) {
                        return e.startsWith("sitetest")
                    });
                return "roblox.com" === o || "simulprod.com" === o || "rblx.org" === o ? {
                    production: !0,
                    domainName: "roblox"
                } : null != u ? {
                    production: !1,
                    domainName: u
                } : {
                    production: !1,
                    domainName: sv
                }
            }
            var sg = window.Roblox["core-scripts"].environmentUrls,
                sy = n.n(sg),
                sb = -1,
                s_ = function() {
                    return sb
                },
                sE = function(e) {
                    addEventListener("pageshow", function(t) {
                        t.persisted && (sb = t.timeStamp, e(t))
                    }, !0)
                },
                sS = function(e, t, n, r) {
                    var a, i;
                    return function(o) {
                        var u;
                        t.value >= 0 && (o || r) && ((i = t.value - (null != a ? a : 0)) || void 0 === a) && (a = t.value, t.delta = i, u = t.value, t.rating = u > n[1] ? "poor" : u > n[0] ? "needs-improvement" : "good", e(t))
                    }
                },
                sw = function(e) {
                    requestAnimationFrame(function() {
                        return requestAnimationFrame(e)
                    })
                },
                sT = function() {
                    var e = performance.getEntriesByType("navigation")[0];
                    if (e && e.responseStart > 0 && e.responseStart < performance.now()) return e
                },
                sI = function() {
                    var e, t;
                    return null != (e = null == (t = sT()) ? void 0 : t.activationStart) ? e : 0
                },
                sN = -1,
                sA = new Set,
                sk = function() {
                    return "hidden" !== document.visibilityState || document.prerendering ? 1 / 0 : 0
                },
                sx = function(e) {
                    if ("hidden" === document.visibilityState) {
                        var t = !0,
                            n = !1,
                            r = void 0;
                        if ("visibilitychange" === e.type) try {
                            for (var a, i = sA[Symbol.iterator](); !(t = (a = i.next()).done); t = !0)(0, a.value)()
                        } catch (e) {
                            n = !0, r = e
                        } finally {
                            try {
                                t || null == i.return || i.return()
                            } finally {
                                if (n) throw r
                            }
                        }
                        isFinite(sN) || (sN = "visibilitychange" === e.type ? e.timeStamp : 0, removeEventListener("prerenderingchange", sx, !0))
                    }
                },
                sR = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
                    if (e && (sN = 1 / 0), sN < 0) {
                        var t, n = sI(),
                            r = document.prerendering || null == (t = globalThis.performance.getEntriesByType("visibility-state").find(function(e) {
                                return "hidden" === e.name && e.startTime >= n
                            })) ? void 0 : t.startTime;
                        sN = null != r ? r : sk(), addEventListener("visibilitychange", sx, !0), addEventListener("prerenderingchange", sx, !0), sE(function() {
                            setTimeout(function() {
                                sN = sk()
                            })
                        })
                    }
                    return {
                        get firstHiddenTime() {
                            return sN
                        },
                        onHidden: function(e) {
                            sA.add(e)
                        }
                    }
                },
                sO = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : -1,
                        n = arguments.length > 2 ? arguments[2] : void 0,
                        r = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : 0,
                        a = arguments.length > 4 ? arguments[4] : void 0,
                        i = arguments.length > 5 ? arguments[5] : void 0,
                        o = arguments.length > 6 ? arguments[6] : void 0,
                        u = sT(),
                        s = (null == u ? void 0 : u.navigationId) || 0,
                        l = "navigate";
                    return n ? l = n : s_() >= 0 ? l = "back-forward-cache" : u && (document.prerendering || sI() > 0 ? l = "prerender" : document.wasDiscarded ? l = "restore" : u.type && (l = u.type.replace(/_/g, "-"))), {
                        name: e,
                        value: t,
                        rating: "good",
                        delta: 0,
                        entries: [],
                        id: "v6-".concat(Date.now(), "-").concat(Math.floor(0x82f79cd8fff * Math.random()) + 1e12),
                        navigationType: l,
                        navigationId: r || s,
                        navigationInteractionId: a,
                        navigationURL: i || (null == u ? void 0 : u.name),
                        navigationStartTime: o || 0
                    }
                },
                sV = new WeakMap;

            function sC(e, t) {
                var n = sV.get(t);
                return n || (n = new WeakMap, sV.set(t, n)), n.get(e) || n.set(e, new t), n.get(e)
            }
            var sZ = function() {
                    function e() {
                        e1(this, e), eD(this, "t", void 0), eD(this, "i", 0), eD(this, "o", [])
                    }
                    return e3(e, [{
                        key: "h",
                        value: function(e) {
                            if (!e.hadRecentInput) {
                                var t, n = this.o[0],
                                    r = this.o.at(-1);
                                this.i && n && r && e.startTime - r.startTime < 1e3 && e.startTime - n.startTime < 5e3 ? (this.i += e.value, this.o.push(e)) : (this.i = e.value, this.o = [e]), null == (t = this.t) || t.call(this, e)
                            }
                        }
                    }]), e
                }(),
                sB = function(e, t) {
                    var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
                    try {
                        var r = e.filter(function(e) {
                            return PerformanceObserver.supportedEntryTypes.includes(e)
                        });
                        if (r.length > 0) {
                            var a = new PerformanceObserver(function(e) {
                                    queueMicrotask(function() {
                                        var n = e.getEntries();
                                        r.length > 1 && n.sort(function(e, t) {
                                            return e.startTime + e.duration - (t.startTime + t.duration)
                                        }), t(n)
                                    })
                                }),
                                i = !0,
                                o = !1,
                                u = void 0;
                            try {
                                for (var s, l = r[Symbol.iterator](); !(i = (s = l.next()).done); i = !0) {
                                    var c = s.value;
                                    a.observe(eY({
                                        type: c,
                                        buffered: !0
                                    }, n))
                                }
                            } catch (e) {
                                o = !0, u = e
                            } finally {
                                try {
                                    i || null == l.return || l.return()
                                } finally {
                                    if (o) throw u
                                }
                            }
                            return a
                        }
                    } catch (e) {}
                },
                sL = function(e) {
                    var t, n, r;
                    return (null == (t = globalThis.PerformanceObserver) ? void 0 : t.supportedEntryTypes.includes("soft-navigation")) && "function" == typeof(null == (r = globalThis.PerformanceSoftNavigation) || null == (n = r.prototype) ? void 0 : n.getLargestInteractionContentfulPaint) && e && e.reportSoftNavs
                },
                sF = function(e, t) {
                    if (e.set(t.navigationId, t), e.size > 2) {
                        var n = e.keys().next().value;
                        void 0 !== n && e.delete(n)
                    }
                },
                sP = function(e) {
                    var t = !1;
                    return function() {
                        t || (e(), t = !0)
                    }
                },
                sX = function e() {
                    e1(this, e), eD(this, "l", void 0)
                },
                sU = function(e) {
                    document.prerendering ? addEventListener("prerenderingchange", e, !0) : e()
                },
                sW = [1800, 3e3],
                sD = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                        n = sL(t);
                    sU(function() {
                        var r, a = sC(t, sX),
                            i = sR(),
                            o = sO("FCP"),
                            u = sB(["paint"], function(e) {
                                var t = !0,
                                    n = !1,
                                    a = void 0;
                                try {
                                    for (var s, l = e[Symbol.iterator](); !(t = (s = l.next()).done); t = !0) {
                                        var c = s.value;
                                        "first-contentful-paint" === c.name && (u.disconnect(), c.startTime < i.firstHiddenTime && (o.value = Math.max(c.startTime - sI(), 0), o.entries.push(c), o.navigationId = c.navigationId || o.navigationId, r(!0)))
                                    }
                                } catch (e) {
                                    n = !0, a = e
                                } finally {
                                    try {
                                        t || null == l.return || l.return()
                                    } finally {
                                        if (n) throw a
                                    }
                                }
                            });
                        u && (r = sS(e, o, sW, t.reportAllChanges), sE(function(n) {
                            r = sS(e, o = sO("FCP", -1, "back-forward-cache", o.navigationId, o.navigationInteractionId, o.navigationURL, s_()), sW, t.reportAllChanges), sw(function() {
                                o.value = performance.now() - n.timeStamp, r(!0)
                            })
                        })), n && sB(["soft-navigation"], function(n) {
                            n.forEach(function(n) {
                                a.l && n.navigationId && sF(a.l, n), (r = sS(e, o = sO("FCP", Math.max((n.presentationTime || n.paintTime || 0) - n.startTime, 0), "soft-navigation", n.navigationId, n.interactionId, n.name, n.startTime), sW, t.reportAllChanges))(!0)
                            })
                        }, t)
                    })
                },
                sY = [.1, .25],
                sG = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                        n = sR();
                    sD(sP(function() {
                        var r, a = sO("CLS", 0),
                            i = sC(t, sZ),
                            o = function(n, o, u, s, l) {
                                a = sO("CLS", 0, n, o, u, s, l), i.i = 0, r = sS(e, a, sY, t.reportAllChanges)
                            },
                            u = function() {
                                var e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
                                i.i > a.value && (a.value = i.i, a.entries = i.o), r(e)
                            },
                            s = function(e) {
                                u(!0), o("soft-navigation", e.navigationId, e.interactionId, e.name, e.startTime)
                            },
                            l = function(e) {
                                var t = !0,
                                    n = !1,
                                    r = void 0;
                                try {
                                    for (var a, o = e[Symbol.iterator](); !(t = (a = o.next()).done); t = !0) {
                                        var l = a.value;
                                        "soft-navigation" !== l.entryType ? i.h(l) : s(l)
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
                                u()
                            },
                            c = ["layout-shift"];
                        sL(t) && c.push("soft-navigation");
                        var f = sB(c, l);
                        f && (r = sS(e, a, sY, t.reportAllChanges), n.onHidden(function() {
                            l(f.takeRecords()), r(!0)
                        }), sE(function() {
                            o("back-forward-cache", a.navigationId, a.navigationInteractionId, a.navigationURL, s_()), sw(r)
                        }), setTimeout(r))
                    }))
                },
                sj = 0,
                sM = 1 / 0,
                sz = 0,
                sJ = function(e) {
                    var t = !0,
                        n = !1,
                        r = void 0;
                    try {
                        for (var a, i = e[Symbol.iterator](); !(t = (a = i.next()).done); t = !0) {
                            var o = a.value;
                            o.interactionId && (sM = Math.min(sM, o.interactionId), sj = (sz = Math.max(sz, o.interactionId)) ? (sz - sM) / 7 + 1 : 0)
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
                },
                sK = function() {
                    var e;
                    return ed ? sj : null != (e = performance.interactionCount) ? e : 0
                },
                sH = function() {
                    "interactionCount" in performance || ed || (ed = sB(["event"], sJ, {
                        durationThreshold: 0
                    }))
                },
                sQ = 0,
                sq = function() {
                    function e() {
                        e1(this, e), eD(this, "u", []), eD(this, "v", new Map), eD(this, "m", void 0), eD(this, "p", void 0)
                    }
                    return e3(e, [{
                        key: "T",
                        value: function() {
                            sQ = sK(), this.u.length = 0, this.v.clear()
                        }
                    }, {
                        key: "M",
                        value: function(e) {
                            var t = sK() - sQ,
                                n = Math.min(this.u.length - 1, Math.floor(t / 50));
                            return t && -1 === n && ("soft-navigation" === e || "back-forward-cache" === e) ? {
                                _: 8,
                                id: -1,
                                entries: []
                            } : this.u[n]
                        }
                    }, {
                        key: "h",
                        value: function(e) {
                            if (null == (u = this.m) || u.call(this, e), e.interactionId || "first-input" === e.entryType) {
                                var t = this.u.at(-1),
                                    n = this.v.get(e.interactionId);
                                if (n || this.u.length < 10 || e.duration > t._) {
                                    if (n ? e.duration > n._ ? (n.entries = [e], n._ = e.duration) : e.duration === n._ && e.startTime === n.entries[0].startTime && n.entries.push(e) : (n = {
                                            id: e.interactionId,
                                            entries: [e],
                                            _: e.duration
                                        }, this.v.set(n.id, n), this.u.push(n)), this.u.sort(function(e, t) {
                                            return t._ - e._
                                        }), this.u.length > 10) {
                                        var r = this.u.splice(10),
                                            a = !0,
                                            i = !1,
                                            o = void 0;
                                        try {
                                            for (var u, s, l, c = r[Symbol.iterator](); !(a = (l = c.next()).done); a = !0) {
                                                var f = l.value;
                                                this.v.delete(f.id)
                                            }
                                        } catch (e) {
                                            i = !0, o = e
                                        } finally {
                                            try {
                                                a || null == c.return || c.return()
                                            } finally {
                                                if (i) throw o
                                            }
                                        }
                                    }
                                    null == (s = this.p) || s.call(this, n)
                                }
                            }
                        }
                    }]), e
                }(),
                s$ = function(e) {
                    var t = 1e3 * ("requestIdleCallback" in globalThis),
                        n = globalThis.requestIdleCallback || setTimeout,
                        r = globalThis.cancelIdleCallback || clearTimeout;
                    if ("hidden" === document.visibilityState) e();
                    else {
                        var a = sP(e),
                            i = -1,
                            o = function() {
                                r(i), a()
                            };
                        addEventListener("visibilitychange", o, {
                            once: !0,
                            capture: !0
                        }), i = n(function() {
                            removeEventListener("visibilitychange", o, {
                                capture: !0
                            }), a()
                        }, {
                            timeout: t
                        })
                    }
                },
                s0 = [200, 500],
                s1 = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                    if (globalThis.PerformanceEventTiming && "interactionId" in PerformanceEventTiming.prototype) {
                        var n = sR();
                        sU(function() {
                            sH();
                            var r, a, i = sO("INP"),
                                o = sC(t, sq),
                                u = function(n, r, u, s, l) {
                                    o.T(), a = sS(e, i = sO("INP", -1, n, r, u, s, l), s0, t.reportAllChanges)
                                },
                                s = function() {
                                    var e = o.M(i.navigationType);
                                    e && e._ !== i.value && (i.value = e._, i.entries = e.entries, a())
                                },
                                l = function(e) {
                                    s(), a(!0), u("soft-navigation", e.navigationId, e.interactionId, e.name, e.startTime)
                                },
                                c = function(e) {
                                    var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
                                    s$(function() {
                                        var n = !0,
                                            r = !1,
                                            i = void 0;
                                        try {
                                            for (var u, c = e[Symbol.iterator](); !(n = (u = c.next()).done); n = !0) {
                                                var f = u.value;
                                                "soft-navigation" !== f.entryType ? o.h(f) : l(f)
                                            }
                                        } catch (e) {
                                            r = !0, i = e
                                        } finally {
                                            try {
                                                n || null == c.return || c.return()
                                            } finally {
                                                if (r) throw i
                                            }
                                        }
                                        s(), t && a(!0)
                                    })
                                },
                                f = ["event", "first-input"];
                            sL(t) && f.push("soft-navigation");
                            var d = sB(f, c, eG(eY({}, t), {
                                durationThreshold: null != (r = t.durationThreshold) ? r : 40
                            }));
                            a = sS(e, i, s0, t.reportAllChanges), d && (n.onHidden(function() {
                                c(d.takeRecords(), !0)
                            }), sE(function() {
                                u("back-forward-cache", i.navigationId, i.navigationInteractionId, i.navigationURL, s_())
                            }))
                        })
                    }
                },
                s2 = function() {
                    function e() {
                        e1(this, e), eD(this, "m", void 0), eD(this, "l", void 0)
                    }
                    return e3(e, [{
                        key: "h",
                        value: function(e) {
                            var t;
                            null == (t = this.m) || t.call(this, e)
                        }
                    }]), e
                }(),
                s3 = [2500, 4e3],
                s5 = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                        n = !1,
                        r = sL(t);
                    sU(function() {
                        var a, i = sR(),
                            o = sO("LCP"),
                            u = sC(t, s2),
                            s = function(r, u, s, l, c) {
                                a = sS(e, o = sO("LCP", -1, r, u, s, l, c), s3, t.reportAllChanges), n = !1, "soft-navigation" === r && (i = sR(!0))
                            },
                            l = function(e) {
                                u.l && e.navigationId && sF(u.l, e), n || a(!0), s("soft-navigation", e.navigationId, e.interactionId, e.name, e.startTime);
                                var t, r = null == (t = e.getLargestInteractionContentfulPaint) ? void 0 : t.call(e);
                                r && c([r])
                            },
                            c = function(e) {
                                t.reportAllChanges || r || (e = e.slice(-1));
                                var n = !0,
                                    s = !1,
                                    c = void 0;
                                try {
                                    for (var f, d = e[Symbol.iterator](); !(n = (f = d.next()).done); n = !0) {
                                        var p = f.value;
                                        if (p) {
                                            if ("soft-navigation" === p.entryType) {
                                                l(p);
                                                continue
                                            }
                                            var v, m = 0,
                                                h = [],
                                                g = p.startTime;
                                            if ("largest-contentful-paint" === p.entryType) m = Math.max(p.startTime - sI(), 0), u.h(p), h = [p];
                                            else if ("interaction-contentful-paint" === p.entryType) {
                                                if (!o.navigationId || "interactionId" in p && p.interactionId != o.navigationInteractionId) continue;
                                                g = (null == (v = p.largestContentfulPaint) ? void 0 : v.renderTime) || 0, m = Math.max(g - p.startTime, 0), p.largestContentfulPaint && (u.h(p.largestContentfulPaint), h = [p.largestContentfulPaint])
                                            }
                                            g < i.firstHiddenTime && (o.value = m, o.entries = h, a())
                                        }
                                    }
                                } catch (e) {
                                    s = !0, c = e
                                } finally {
                                    try {
                                        n || null == d.return || d.return()
                                    } finally {
                                        if (s) throw c
                                    }
                                }
                            },
                            f = ["largest-contentful-paint"];
                        r && f.push("interaction-contentful-paint", "soft-navigation");
                        var d = sB(f, c);
                        if (d) {
                            a = sS(e, o, s3, t.reportAllChanges);
                            var p = ["keydown", "click", "visibilitychange"],
                                v = function(e) {
                                    if (e.isTrusted && !n) {
                                        var t = o.id;
                                        s$(function() {
                                            if (!n) {
                                                if (!r) {
                                                    d.disconnect();
                                                    var e = !0,
                                                        i = !1,
                                                        u = void 0;
                                                    try {
                                                        for (var s, l = p[Symbol.iterator](); !(e = (s = l.next()).done); e = !0) {
                                                            var c = s.value;
                                                            removeEventListener(c, v, {
                                                                capture: !0
                                                            })
                                                        }
                                                    } catch (e) {
                                                        i = !0, u = e
                                                    } finally {
                                                        try {
                                                            e || null == l.return || l.return()
                                                        } finally {
                                                            if (i) throw u
                                                        }
                                                    }
                                                }
                                                t === o.id && (n = !0, a(!0))
                                            }
                                        })
                                    }
                                },
                                m = !0,
                                h = !1,
                                g = void 0;
                            try {
                                for (var y, b = p[Symbol.iterator](); !(m = (y = b.next()).done); m = !0) {
                                    var _ = y.value;
                                    addEventListener(_, v, {
                                        capture: !0
                                    })
                                }
                            } catch (e) {
                                h = !0, g = e
                            } finally {
                                try {
                                    m || null == b.return || b.return()
                                } finally {
                                    if (h) throw g
                                }
                            }
                            sE(function(r) {
                                s("back-forward-cache", o.navigationId, o.navigationInteractionId, o.navigationURL, s_()), a = sS(e, o, s3, t.reportAllChanges), sw(function() {
                                    o.value = performance.now() - r.timeStamp, n = !0, a(!0)
                                })
                            })
                        }
                    })
                },
                s9 = [800, 1800],
                s4 = function(e) {
                    document.prerendering ? sU(function() {
                        return s4(e)
                    }) : "complete" !== document.readyState ? addEventListener("load", function() {
                        return s4(e)
                    }, !0) : setTimeout(e)
                },
                s8 = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                        n = sL(t),
                        r = sO("TTFB"),
                        a = sS(e, r, s9, t.reportAllChanges);
                    s4(function() {
                        var i = sT();
                        if (i) {
                            var o = i.responseStart;
                            r.value = Math.max(o - sI(), 0), r.entries = [i], a(!0), sE(function() {
                                (a = sS(e, r = sO("TTFB", 0, "back-forward-cache", r.navigationId, r.navigationInteractionId, r.navigationURL, s_()), s9, t.reportAllChanges))(!0)
                            }), n && sB(["soft-navigation"], function(n) {
                                n.forEach(function(n) {
                                    n.navigationId && ((r = sO("TTFB", 0, "soft-navigation", n.navigationId, n.interactionId, n.name, n.startTime)).entries = [n], (a = sS(e, r, s9, t.reportAllChanges))(!0))
                                })
                            }, t)
                        }
                    })
                },
                s6 = function(e) {
                    try {
                        return BigInt(e)
                    } catch (e) {
                        return null
                    }
                },
                s7 = function(e) {
                    if (!e.trim()) return null;
                    try {
                        return BigInt(e)
                    } catch (e) {
                        return null
                    }
                };

            function le(e) {
                for (var t = !1, n = [], r = 0; r < e.length; r++) {
                    var a = e.charAt(r);
                    switch (a) {
                        case "_":
                            t = !0;
                            break;
                        case "0":
                        case "1":
                        case "2":
                        case "3":
                        case "4":
                        case "5":
                        case "6":
                        case "7":
                        case "8":
                        case "9":
                            n.push(a), t = !1;
                            break;
                        default:
                            t && (t = !1, a = a.toUpperCase()), n.push(a)
                    }
                }
                return n.join("")
            }
            var lt = new Set(["constructor", "toString", "toJSON", "valueOf"]);

            function ln(e) {
                return lt.has(e) ? e + "$" : e
            }

            function lr() {
                for (var e = 0, t = 0, n = 0; n < 28; n += 7) {
                    var r = this.buf[this.pos++];
                    if (e |= (127 & r) << n, (128 & r) == 0) return this.assertBounds(), [e, t]
                }
                var a = this.buf[this.pos++];
                if (e |= (15 & a) << 28, t = (112 & a) >> 4, (128 & a) == 0) return this.assertBounds(), [e, t];
                for (var i = 3; i <= 31; i += 7) {
                    var o = this.buf[this.pos++];
                    if (t |= (127 & o) << i, (128 & o) == 0) return this.assertBounds(), [e, t]
                }
                throw Error("invalid varint")
            }

            function la(e, t, n) {
                for (var r = 0; r < 28; r += 7) {
                    var a = e >>> r,
                        i = a >>> 7 != 0 || 0 != t,
                        o = (i ? 128 | a : a) & 255;
                    if (n.push(o), !i) return
                }
                var u = e >>> 28 & 15 | (7 & t) << 4,
                    s = t >> 3 != 0;
                if (n.push((s ? 128 | u : u) & 255), s) {
                    for (var l = 3; l < 31; l += 7) {
                        var c = t >>> l,
                            f = c >>> 7 != 0,
                            d = (f ? 128 | c : c) & 255;
                        if (n.push(d), !f) return
                    }
                    n.push(t >>> 31 & 1)
                }
            }

            function li(e) {
                var t = "-" === e[0];
                t && (e = e.slice(1));
                var n = 0,
                    r = 0;

                function a(t, a) {
                    var i = Number(e.slice(t, a));
                    r *= 1e6, (n = 1e6 * n + i) >= 0x100000000 && (r += n / 0x100000000 | 0, n %= 0x100000000)
                }
                return a(-24, -18), a(-18, -12), a(-12, -6), a(-6), t ? ls(n, r) : lu(n, r)
            }

            function lo(e, t) {
                if (e = (n = {
                        lo: e >>> 0,
                        hi: t >>> 0
                    }).lo, (t = n.hi) <= 2097151) return String(0x100000000 * t + e);
                var n, r = 0xffffff & e,
                    a = (e >>> 24 | t << 8) & 0xffffff,
                    i = t >> 16 & 65535,
                    o = r + 6777216 * a + 6710656 * i,
                    u = a + 8147497 * i,
                    s = 2 * i;
                return o >= 1e7 && (u += Math.floor(o / 1e7), o %= 1e7), u >= 1e7 && (s += Math.floor(u / 1e7), u %= 1e7), s.toString() + ll(u) + ll(o)
            }

            function lu(e, t) {
                return {
                    lo: 0 | e,
                    hi: 0 | t
                }
            }

            function ls(e, t) {
                return t = ~t, e ? e = ~e + 1 : t += 1, lu(e, t)
            }
            var ll = function(e) {
                var t = String(e);
                return "0000000".slice(t.length) + t
            };

            function lc(e, t) {
                if (e >= 0) {
                    for (; e > 127;) t.push(127 & e | 128), e >>>= 7;
                    t.push(e)
                } else {
                    for (var n = 0; n < 9; n++) t.push(127 & e | 128), e >>= 7;
                    t.push(1)
                }
            }

            function lf() {
                var e = this.buf[this.pos++],
                    t = 127 & e;
                if ((128 & e) == 0 || (t |= (127 & (e = this.buf[this.pos++])) << 7, (128 & e) == 0) || (t |= (127 & (e = this.buf[this.pos++])) << 14, (128 & e) == 0) || (t |= (127 & (e = this.buf[this.pos++])) << 21, (128 & e) == 0)) return this.assertBounds(), t;
                t |= (15 & (e = this.buf[this.pos++])) << 28;
                for (var n = 5;
                    (128 & e) != 0 && n < 10; n++) e = this.buf[this.pos++];
                if ((128 & e) != 0) throw Error("invalid varint");
                return this.assertBounds(), t >>> 0
            }
            var ld = n(773),
                lp = function() {
                    var e = new DataView(new ArrayBuffer(8));
                    if ("function" == typeof BigInt && "function" == typeof e.getBigInt64 && "function" == typeof e.getBigUint64 && "function" == typeof e.setBigInt64 && "function" == typeof e.setBigUint64 && (globalThis.Deno || globalThis.Bun || (void 0 === ld ? "undefined" : (0, e8._)(ld)) != "object" || "object" != (0, e8._)(ld.env) || "1" !== ld.env.BUF_BIGINT_DISABLE)) {
                        var t = BigInt("-9223372036854775808"),
                            n = BigInt("9223372036854775807"),
                            r = BigInt("0"),
                            a = BigInt("18446744073709551615");
                        return {
                            zero: BigInt(0),
                            supported: !0,
                            parse: function(e) {
                                var r = (void 0 === e ? "undefined" : (0, e8._)(e)) == "bigint" ? e : BigInt(e);
                                if (r > n || r < t) throw Error("invalid int64: ".concat(e));
                                return r
                            },
                            uParse: function(e) {
                                var t = (void 0 === e ? "undefined" : (0, e8._)(e)) == "bigint" ? e : BigInt(e);
                                if (t > a || t < r) throw Error("invalid uint64: ".concat(e));
                                return t
                            },
                            enc: function(t) {
                                return e.setBigInt64(0, this.parse(t), !0), {
                                    lo: e.getInt32(0, !0),
                                    hi: e.getInt32(4, !0)
                                }
                            },
                            uEnc: function(t) {
                                return e.setBigInt64(0, this.uParse(t), !0), {
                                    lo: e.getInt32(0, !0),
                                    hi: e.getInt32(4, !0)
                                }
                            },
                            dec: function(t, n) {
                                return e.setInt32(0, t, !0), e.setInt32(4, n, !0), e.getBigInt64(0, !0)
                            },
                            uDec: function(t, n) {
                                return e.setInt32(0, t, !0), e.setInt32(4, n, !0), e.getBigUint64(0, !0)
                            }
                        }
                    }
                    return {
                        zero: "0",
                        supported: !1,
                        parse: function(e) {
                            return "string" != typeof e && (e = e.toString()), lv(e), e
                        },
                        uParse: function(e) {
                            return "string" != typeof e && (e = e.toString()), lm(e), e
                        },
                        enc: function(e) {
                            return "string" != typeof e && (e = e.toString()), lv(e), li(e)
                        },
                        uEnc: function(e) {
                            return "string" != typeof e && (e = e.toString()), lm(e), li(e)
                        },
                        dec: function(e, t) {
                            var n, r, a;
                            return (r = 0x80000000 & (n = lu(e, t)).hi) && (n = ls(n.lo, n.hi)), a = lo(n.lo, n.hi), r ? "-" + a : a
                        },
                        uDec: function(e, t) {
                            return lo(e, t)
                        }
                    }
                }();

            function lv(e) {
                if (!/^-?[0-9]+$/.test(e)) throw Error("invalid int64: " + e)
            }

            function lm(e) {
                if (!/^[0-9]+$/.test(e)) throw Error("invalid uint64: " + e)
            }

            function lh(e, t) {
                switch (e) {
                    case em.STRING:
                        return "";
                    case em.BOOL:
                        return !1;
                    case em.DOUBLE:
                    case em.FLOAT:
                        return 0;
                    case em.INT64:
                    case em.UINT64:
                    case em.SFIXED64:
                    case em.FIXED64:
                    case em.SINT64:
                        return t ? "0" : lp.zero;
                    case em.BYTES:
                        return new Uint8Array(0);
                    default:
                        return 0
                }
            }(c = em || (em = {}))[c.DOUBLE = 1] = "DOUBLE", c[c.FLOAT = 2] = "FLOAT", c[c.INT64 = 3] = "INT64", c[c.UINT64 = 4] = "UINT64", c[c.INT32 = 5] = "INT32", c[c.FIXED64 = 6] = "FIXED64", c[c.FIXED32 = 7] = "FIXED32", c[c.BOOL = 8] = "BOOL", c[c.STRING = 9] = "STRING", c[c.BYTES = 12] = "BYTES", c[c.UINT32 = 13] = "UINT32", c[c.SFIXED32 = 15] = "SFIXED32", c[c.SFIXED64 = 16] = "SFIXED64", c[c.SINT32 = 17] = "SINT32", c[c.SINT64 = 18] = "SINT64";
            var lg = Symbol.for("reflect unsafe local");

            function ly(e, t) {
                var n = e[t.localName].case;
                return void 0 === n ? n : t.fields.find(function(e) {
                    return e.localName === n
                })
            }

            function lb(e, t) {
                return Object.prototype.hasOwnProperty.call(e, t) && void 0 !== e[t]
            }

            function l_(e, t) {
                if (t.oneof) {
                    var n = e[t.oneof.localName];
                    return n.case === t.localName ? n.value : void 0
                }
                return e[t.localName]
            }

            function lE(e, t, n) {
                t.oneof ? e[t.oneof.localName] = {
                    case: t.localName,
                    value: n
                } : e[t.localName] = n
            }

            function lS(e) {
                var t = !0,
                    n = !1,
                    r = void 0;
                try {
                    for (var a, i = e.field[Symbol.iterator](); !(t = (a = i.next()).done); t = !0) {
                        var o = a.value;
                        lb(o, "jsonName") || (o.jsonName = le(o.name))
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
                e.nestedType.forEach(lS)
            }

            function lw(e) {
                var t = "function" == typeof Symbol && Symbol.iterator,
                    n = t && e[t],
                    r = 0;
                if (n) return n.call(e);
                if (e && "number" == typeof e.length) return {
                    next: function() {
                        return e && r >= e.length && (e = void 0), {
                            value: e && e[r++],
                            done: !e
                        }
                    }
                };
                throw TypeError(t ? "Object is not iterable." : "Symbol.iterator is not defined.")
            }

            function lT() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                var r = (u = new Map, s = new Map, l = new Map, f = {}, eD(c = {
                    kind: "registry",
                    types: u,
                    extendees: s
                }, Symbol.iterator, function() {
                    return u.values()
                }), f.files = f.files || {}, f.files.get = function() {
                    return l.values()
                }, eD(c, "addFile", function(e, t, n) {
                    if (l.set(e.proto.name, e), !t) {
                        var r = !0,
                            a = !1,
                            i = void 0;
                        try {
                            for (var o, u = (function e(t) {
                                    var n, r, a, i, o, u, s, l, c, f, d, p, v;
                                    return rA(this, function(m) {
                                        switch (m.label) {
                                            case 0:
                                                switch (t.kind) {
                                                    case "file":
                                                        return [3, 1];
                                                    case "message":
                                                        return [3, 14]
                                                }
                                                return [3, 26];
                                            case 1:
                                                n = !0, r = !1, a = void 0, m.label = 2;
                                            case 2:
                                                m.trys.push([2, 8, 9, 10]), i = t.messages[Symbol.iterator](), m.label = 3;
                                            case 3:
                                                if (n = (o = i.next()).done) return [3, 7];
                                                return [4, u = o.value];
                                            case 4:
                                                return m.sent(), [5, lw(e(u))];
                                            case 5:
                                                m.sent(), m.label = 6;
                                            case 6:
                                                return n = !0, [3, 3];
                                            case 7:
                                                return [3, 10];
                                            case 8:
                                                return s = m.sent(), r = !0, a = s, [3, 10];
                                            case 9:
                                                try {
                                                    n || null == i.return || i.return()
                                                } finally {
                                                    if (r) throw a
                                                }
                                                return [7];
                                            case 10:
                                                return [5, lw(t.enums)];
                                            case 11:
                                                return m.sent(), [5, lw(t.services)];
                                            case 12:
                                                return m.sent(), [5, lw(t.extensions)];
                                            case 13:
                                                return m.sent(), [3, 26];
                                            case 14:
                                                l = !0, c = !1, f = void 0, m.label = 15;
                                            case 15:
                                                m.trys.push([15, 21, 22, 23]), d = t.nestedMessages[Symbol.iterator](), m.label = 16;
                                            case 16:
                                                if (l = (p = d.next()).done) return [3, 20];
                                                return [4, v = p.value];
                                            case 17:
                                                return m.sent(), [5, lw(e(v))];
                                            case 18:
                                                m.sent(), m.label = 19;
                                            case 19:
                                                return l = !0, [3, 16];
                                            case 20:
                                                return [3, 23];
                                            case 21:
                                                return s = m.sent(), c = !0, f = s, [3, 23];
                                            case 22:
                                                try {
                                                    l || null == d.return || d.return()
                                                } finally {
                                                    if (c) throw f
                                                }
                                                return [7];
                                            case 23:
                                                return [5, lw(t.nestedEnums)];
                                            case 24:
                                                return m.sent(), [5, lw(t.nestedExtensions)];
                                            case 25:
                                                return m.sent(), [3, 26];
                                            case 26:
                                                return [2]
                                        }
                                    })
                                })(e)[Symbol.iterator](); !(r = (o = u.next()).done); r = !0) {
                                var s = o.value;
                                this.add(s)
                            }
                        } catch (e) {
                            a = !0, i = e
                        } finally {
                            try {
                                r || null == u.return || u.return()
                            } finally {
                                if (a) throw i
                            }
                        }
                    }
                    if (n) {
                        var c = !0,
                            f = !1,
                            d = void 0;
                        try {
                            for (var p, v = e.dependencies[Symbol.iterator](); !(c = (p = v.next()).done); c = !0) {
                                var m = p.value;
                                this.addFile(m, t, n)
                            }
                        } catch (e) {
                            f = !0, d = e
                        } finally {
                            try {
                                c || null == v.return || v.return()
                            } finally {
                                if (f) throw d
                            }
                        }
                    }
                }), eD(c, "add", function(e) {
                    if ("extension" == e.kind) {
                        var t = s.get(e.extendee.typeName);
                        t || s.set(e.extendee.typeName, t = new Map), t.set(e.number, e)
                    }
                    u.set(e.typeName, e)
                }), eD(c, "get", function(e) {
                    return u.get(e)
                }), eD(c, "getFile", function(e) {
                    return l.get(e)
                }), eD(c, "getMessage", function(e) {
                    var t = u.get(e);
                    return (null == t ? void 0 : t.kind) == "message" ? t : void 0
                }), eD(c, "getEnum", function(e) {
                    var t = u.get(e);
                    return (null == t ? void 0 : t.kind) == "enum" ? t : void 0
                }), eD(c, "getExtension", function(e) {
                    var t = u.get(e);
                    return (null == t ? void 0 : t.kind) == "extension" ? t : void 0
                }), eD(c, "getExtensionFor", function(e, t) {
                    var n;
                    return null == (n = s.get(e.typeName)) ? void 0 : n.get(t)
                }), eD(c, "getService", function(e) {
                    var t = u.get(e);
                    return (null == t ? void 0 : t.kind) == "service" ? t : void 0
                }), function(e, t) {
                    for (var n in t) {
                        var r = t[n];
                        r.configurable = r.enumerable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, n, r)
                    }
                    if (Object.getOwnPropertySymbols)
                        for (var a = Object.getOwnPropertySymbols(t), i = 0; i < a.length; i++) {
                            var o = a[i],
                                r = t[o];
                            r.configurable = r.enumerable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, o, r)
                        }
                }(c, f), c);
                if (!t.length) return r;
                if ("$typeName" in t[0] && "google.protobuf.FileDescriptorSet" == t[0].$typeName) {
                    var a = !0,
                        i = !1,
                        o = void 0;
                    try {
                        for (var u, s, l, c, f, d, p = t[0].file[Symbol.iterator](); !(a = (d = p.next()).done); a = !0) {
                            var v = d.value;
                            lN(v, r)
                        }
                    } catch (e) {
                        i = !0, o = e
                    } finally {
                        try {
                            a || null == p.return || p.return()
                        } finally {
                            if (i) throw o
                        }
                    }
                    return r
                }
                if ("$typeName" in t[0]) {
                    var m = t[0],
                        h = t[1],
                        g = new Set,
                        y = !0,
                        b = !1,
                        _ = void 0;
                    try {
                        for (var E, S = [m].concat(e9(function e(t) {
                                var n = [],
                                    a = !0,
                                    i = !1,
                                    o = void 0;
                                try {
                                    for (var u, s = t.dependency[Symbol.iterator](); !(a = (u = s.next()).done); a = !0) {
                                        var l = u.value;
                                        if (void 0 == r.getFile(l) && !g.has(l)) {
                                            var c = h(l);
                                            if (!c) throw Error("Unable to resolve ".concat(l, ", imported by ").concat(t.name));
                                            "kind" in c ? r.addFile(c, !1, !0) : (g.add(c.name), n.push(c))
                                        }
                                    }
                                } catch (e) {
                                    i = !0, o = e
                                } finally {
                                    try {
                                        a || null == s.return || s.return()
                                    } finally {
                                        if (i) throw o
                                    }
                                }
                                return n.concat.apply(n, e9(n.map(e)))
                            }(m))).reverse()[Symbol.iterator](); !(y = (E = S.next()).done); y = !0) {
                            var w = E.value;
                            lN(w, r)
                        }
                    } catch (e) {
                        b = !0, _ = e
                    } finally {
                        try {
                            y || null == S.return || S.return()
                        } finally {
                            if (b) throw _
                        }
                    }
                } else {
                    var T = !0,
                        I = !1,
                        N = void 0;
                    try {
                        for (var A, k = t[Symbol.iterator](); !(T = (A = k.next()).done); T = !0) {
                            var x = A.value,
                                R = !0,
                                O = !1,
                                V = void 0;
                            try {
                                for (var C, Z = x.files[Symbol.iterator](); !(R = (C = Z.next()).done); R = !0) {
                                    var B = C.value;
                                    r.addFile(B)
                                }
                            } catch (e) {
                                O = !0, V = e
                            } finally {
                                try {
                                    R || null == Z.return || Z.return()
                                } finally {
                                    if (O) throw V
                                }
                            }
                        }
                    } catch (e) {
                        I = !0, N = e
                    } finally {
                        try {
                            T || null == k.return || k.return()
                        } finally {
                            if (I) throw N
                        }
                    }
                }
                return r
            }
            var lI = {
                998: {
                    fieldPresence: 1,
                    enumType: 2,
                    repeatedFieldEncoding: 2,
                    utf8Validation: 3,
                    messageEncoding: 1,
                    jsonFormat: 2,
                    enforceNamingStyle: 2,
                    defaultSymbolVisibility: 1
                },
                999: {
                    fieldPresence: 2,
                    enumType: 1,
                    repeatedFieldEncoding: 1,
                    utf8Validation: 2,
                    messageEncoding: 1,
                    jsonFormat: 1,
                    enforceNamingStyle: 2,
                    defaultSymbolVisibility: 1
                },
                1e3: {
                    fieldPresence: 1,
                    enumType: 1,
                    repeatedFieldEncoding: 1,
                    utf8Validation: 2,
                    messageEncoding: 1,
                    jsonFormat: 1,
                    enforceNamingStyle: 2,
                    defaultSymbolVisibility: 1
                },
                1001: {
                    fieldPresence: 1,
                    enumType: 1,
                    repeatedFieldEncoding: 1,
                    utf8Validation: 2,
                    messageEncoding: 1,
                    jsonFormat: 1,
                    enforceNamingStyle: 1,
                    defaultSymbolVisibility: 2
                }
            };

            function lN(e, t) {
                var n = {
                        kind: "file",
                        proto: e,
                        deprecated: null != (f = null == (c = e.options) ? void 0 : c.deprecated) && f,
                        edition: function(e) {
                            switch (e.syntax) {
                                case "":
                                case "proto2":
                                    return 998;
                                case "proto3":
                                    return 999;
                                case "editions":
                                    if (9999 === e.edition) return 1001;
                                    if (e.edition in lI) return e.edition;
                                    throw Error("".concat(e.name, ": unsupported edition"));
                                default:
                                    throw Error("".concat(e.name, ': unsupported syntax "').concat(e.syntax, '"'))
                            }
                        }(e),
                        name: e.name.replace(/\.proto$/, ""),
                        dependencies: (s = e, l = t, s.dependency.map(function(e) {
                            var t = l.getFile(e);
                            if (!t) throw Error("Cannot find ".concat(e, ", imported by ").concat(s.name));
                            return t
                        })),
                        enums: [],
                        messages: [],
                        extensions: [],
                        services: [],
                        toString: function() {
                            return "file ".concat(e.name)
                        }
                    },
                    r = new Map,
                    a = {
                        get: function(e) {
                            return r.get(e)
                        },
                        add: function(e) {
                            var t;
                            lB((null == (t = e.proto.options) ? void 0 : t.mapEntry) === !0), r.set(e.typeName, e)
                        }
                    },
                    i = !0,
                    o = !1,
                    u = void 0;
                try {
                    for (var s, l, c, f, d, p = e.enumType[Symbol.iterator](); !(i = (d = p.next()).done); i = !0) {
                        var v = d.value;
                        lx(v, n, void 0, t)
                    }
                } catch (e) {
                    o = !0, u = e
                } finally {
                    try {
                        i || null == p.return || p.return()
                    } finally {
                        if (o) throw u
                    }
                }
                var m = !0,
                    h = !1,
                    g = void 0;
                try {
                    for (var y, b = e.messageType[Symbol.iterator](); !(m = (y = b.next()).done); m = !0) {
                        var _ = y.value;
                        ! function e(t, n, r, a, i) {
                            var o = {
                                kind: "message",
                                proto: t,
                                deprecated: null != (f = null == (c = t.options) ? void 0 : c.deprecated) && f,
                                file: n,
                                parent: r,
                                name: t.name,
                                typeName: lO(t, r, n),
                                fields: [],
                                field: {},
                                oneofs: [],
                                members: [],
                                nestedEnums: [],
                                nestedMessages: [],
                                nestedExtensions: [],
                                toString: function() {
                                    return "message ".concat(this.typeName)
                                }
                            };
                            (null == (d = t.options) ? void 0 : d.mapEntry) === !0 ? i.add(o) : ((null != (p = null == r ? void 0 : r.nestedMessages) ? p : n.messages).push(o), a.add(o));
                            var u = !0,
                                s = !1,
                                l = void 0;
                            try {
                                for (var c, f, d, p, v, m = t.enumType[Symbol.iterator](); !(u = (v = m.next()).done); u = !0) {
                                    var h = v.value;
                                    lx(h, n, o, a)
                                }
                            } catch (e) {
                                s = !0, l = e
                            } finally {
                                try {
                                    u || null == m.return || m.return()
                                } finally {
                                    if (s) throw l
                                }
                            }
                            var g = !0,
                                y = !1,
                                b = void 0;
                            try {
                                for (var _, E = t.nestedType[Symbol.iterator](); !(g = (_ = E.next()).done); g = !0) {
                                    var S = _.value;
                                    e(S, n, o, a, i)
                                }
                            } catch (e) {
                                y = !0, b = e
                            } finally {
                                try {
                                    g || null == E.return || E.return()
                                } finally {
                                    if (y) throw b
                                }
                            }
                        }(_, n, void 0, t, a)
                    }
                } catch (e) {
                    h = !0, g = e
                } finally {
                    try {
                        m || null == b.return || b.return()
                    } finally {
                        if (h) throw g
                    }
                }
                var E = !0,
                    S = !1,
                    w = void 0;
                try {
                    for (var T, I = e.service[Symbol.iterator](); !(E = (T = I.next()).done); E = !0) {
                        var N = T.value;
                        ! function(e, t, n) {
                            var r = {
                                kind: "service",
                                proto: e,
                                deprecated: null != (s = null == (u = e.options) ? void 0 : u.deprecated) && s,
                                file: t,
                                name: e.name,
                                typeName: lO(e, void 0, t),
                                methods: [],
                                method: {},
                                toString: function() {
                                    return "service ".concat(this.typeName)
                                }
                            };
                            t.services.push(r), n.add(r);
                            var a = !0,
                                i = !1,
                                o = void 0;
                            try {
                                for (var u, s, l, c = e.method[Symbol.iterator](); !(a = (l = c.next()).done); a = !0) {
                                    var f = l.value,
                                        d = function(e, t, n) {
                                            var r, a, i, o, u = e.clientStreaming && e.serverStreaming ? "bidi_streaming" : e.clientStreaming ? "client_streaming" : e.serverStreaming ? "server_streaming" : "unary",
                                                s = n.getMessage(lV(e.inputType)),
                                                l = n.getMessage(lV(e.outputType));
                                            lB(s, "invalid MethodDescriptorProto: input_type ".concat(e.inputType, " not found")), lB(l, "invalid MethodDescriptorProto: output_type ".concat(e.inputType, " not found"));
                                            var c = e.name;
                                            return {
                                                kind: "rpc",
                                                proto: e,
                                                deprecated: null != (a = null == (r = e.options) ? void 0 : r.deprecated) && a,
                                                parent: t,
                                                name: c,
                                                localName: ln(c.length ? ln(c[0].toLowerCase() + c.substring(1)) : c),
                                                methodKind: u,
                                                input: s,
                                                output: l,
                                                idempotency: null != (o = null == (i = e.options) ? void 0 : i.idempotencyLevel) ? o : 0,
                                                toString: function() {
                                                    return "rpc ".concat(t.typeName, ".").concat(c)
                                                }
                                            }
                                        }(f, r, n);
                                    r.methods.push(d), r.method[d.localName] = d
                                }
                            } catch (e) {
                                i = !0, o = e
                            } finally {
                                try {
                                    a || null == c.return || c.return()
                                } finally {
                                    if (i) throw o
                                }
                            }
                        }(N, n, t)
                    }
                } catch (e) {
                    S = !0, w = e
                } finally {
                    try {
                        E || null == I.return || I.return()
                    } finally {
                        if (S) throw w
                    }
                }
                lA(n, t);
                var A = !0,
                    k = !1,
                    x = void 0;
                try {
                    for (var R, O = r.values()[Symbol.iterator](); !(A = (R = O.next()).done); A = !0) {
                        var V = R.value;
                        lk(V, t, a)
                    }
                } catch (e) {
                    k = !0, x = e
                } finally {
                    try {
                        A || null == O.return || O.return()
                    } finally {
                        if (k) throw x
                    }
                }
                var C = !0,
                    Z = !1,
                    B = void 0;
                try {
                    for (var L, F = n.messages[Symbol.iterator](); !(C = (L = F.next()).done); C = !0) {
                        var P = L.value;
                        lk(P, t, a), lA(P, t)
                    }
                } catch (e) {
                    Z = !0, B = e
                } finally {
                    try {
                        C || null == F.return || F.return()
                    } finally {
                        if (Z) throw B
                    }
                }
                t.addFile(n, !0)
            }

            function lA(e, t) {
                switch (e.kind) {
                    case "file":
                        var n = !0,
                            r = !1,
                            a = void 0;
                        try {
                            for (var i, o = e.proto.extension[Symbol.iterator](); !(n = (i = o.next()).done); n = !0) {
                                var u = i.value,
                                    s = lR(u, e, t);
                                e.extensions.push(s), t.add(s)
                            }
                        } catch (e) {
                            r = !0, a = e
                        } finally {
                            try {
                                n || null == o.return || o.return()
                            } finally {
                                if (r) throw a
                            }
                        }
                        break;
                    case "message":
                        var l = !0,
                            c = !1,
                            f = void 0;
                        try {
                            for (var d, p = e.proto.extension[Symbol.iterator](); !(l = (d = p.next()).done); l = !0) {
                                var v = d.value,
                                    m = lR(v, e, t);
                                e.nestedExtensions.push(m), t.add(m)
                            }
                        } catch (e) {
                            c = !0, f = e
                        } finally {
                            try {
                                l || null == p.return || p.return()
                            } finally {
                                if (c) throw f
                            }
                        }
                        var h = !0,
                            g = !1,
                            y = void 0;
                        try {
                            for (var b, _ = e.nestedMessages[Symbol.iterator](); !(h = (b = _.next()).done); h = !0) {
                                var E = b.value;
                                lA(E, t)
                            }
                        } catch (e) {
                            g = !0, y = e
                        } finally {
                            try {
                                h || null == _.return || _.return()
                            } finally {
                                if (g) throw y
                            }
                        }
                }
            }

            function lk(e, t, n) {
                var r = e.proto.oneofDecl.map(function(t) {
                        var n, r;
                        return {
                            kind: "oneof",
                            proto: n = t,
                            deprecated: !1,
                            parent: r = e,
                            fields: [],
                            name: n.name,
                            localName: ln(le(n.name)),
                            toString: function() {
                                return "oneof ".concat(r.typeName, ".").concat(this.name)
                            }
                        }
                    }),
                    a = new Set,
                    i = !0,
                    o = !1,
                    u = void 0;
                try {
                    for (var s, l = e.proto.field[Symbol.iterator](); !(i = (s = l.next()).done); i = !0) {
                        var c = s.value,
                            f = function(e, t) {
                                if (lb(e, "oneofIndex") && !e.proto3Optional) {
                                    var n = t[e.oneofIndex];
                                    return lB(n, "invalid FieldDescriptorProto: oneof #".concat(e.oneofIndex, " for field #").concat(e.number, " not found")), n
                                }
                            }(c, r),
                            d = lR(c, e, t, f, n);
                        e.fields.push(d), e.field[d.localName] = d, void 0 === f ? e.members.push(d) : (f.fields.push(d), a.has(f) || (a.add(f), e.members.push(f)))
                    }
                } catch (e) {
                    o = !0, u = e
                } finally {
                    try {
                        i || null == l.return || l.return()
                    } finally {
                        if (o) throw u
                    }
                }
                var p = !0,
                    v = !1,
                    m = void 0;
                try {
                    for (var h, g = r.filter(function(e) {
                            return a.has(e)
                        })[Symbol.iterator](); !(p = (h = g.next()).done); p = !0) {
                        var y = h.value;
                        e.oneofs.push(y)
                    }
                } catch (e) {
                    v = !0, m = e
                } finally {
                    try {
                        p || null == g.return || g.return()
                    } finally {
                        if (v) throw m
                    }
                }
                var b = !0,
                    _ = !1,
                    E = void 0;
                try {
                    for (var S, w = e.nestedMessages[Symbol.iterator](); !(b = (S = w.next()).done); b = !0) {
                        var T = S.value;
                        lk(T, t, n)
                    }
                } catch (e) {
                    _ = !0, E = e
                } finally {
                    try {
                        b || null == w.return || w.return()
                    } finally {
                        if (_) throw E
                    }
                }
            }

            function lx(e, t, n, r) {
                var a = function(e, t) {
                        var n = ((o = e).substring(0, 1) + o.substring(1).replace(/[A-Z]/g, function(e) {
                                return "_" + e
                            })).toLowerCase() + "_",
                            r = !0,
                            a = !1,
                            i = void 0;
                        try {
                            for (var o, u, s = t[Symbol.iterator](); !(r = (u = s.next()).done); r = !0) {
                                var l = u.value;
                                if (!l.name.toLowerCase().startsWith(n)) return;
                                var c = l.name.substring(n.length);
                                if (0 == c.length || /^\d/.test(c)) return
                            }
                        } catch (e) {
                            a = !0, i = e
                        } finally {
                            try {
                                r || null == s.return || s.return()
                            } finally {
                                if (a) throw i
                            }
                        }
                        return n
                    }(e.name, e.value),
                    i = {
                        kind: "enum",
                        proto: e,
                        deprecated: null != (d = null == (f = e.options) ? void 0 : f.deprecated) && d,
                        file: t,
                        parent: n,
                        open: !0,
                        name: e.name,
                        typeName: lO(e, n, t),
                        value: {},
                        values: [],
                        sharedPrefix: a,
                        toString: function() {
                            return "enum ".concat(this.typeName)
                        }
                    };
                i.open = 1 == lZ("enumType", {
                    proto: (l = i).proto,
                    parent: null != (c = l.parent) ? c : l.file
                }), r.add(i);
                var o = !0,
                    u = !1,
                    s = void 0;
                try {
                    for (var l, c, f, d, p, v, m, h, g = e.value[Symbol.iterator](); !(o = (h = g.next()).done); o = !0) ! function() {
                        var e = h.value,
                            t = e.name;
                        i.values.push(i.value[e.number] = {
                            kind: "enum_value",
                            proto: e,
                            deprecated: null != (v = null == (p = e.options) ? void 0 : p.deprecated) && v,
                            parent: i,
                            name: t,
                            localName: ln(void 0 == a ? t : t.substring(a.length)),
                            number: e.number,
                            toString: function() {
                                return "enum value ".concat(i.typeName, ".").concat(t)
                            }
                        })
                    }()
                } catch (e) {
                    u = !0, s = e
                } finally {
                    try {
                        o || null == g.return || g.return()
                    } finally {
                        if (u) throw s
                    }
                }(null != (m = null == n ? void 0 : n.nestedEnums) ? m : t.enums).push(i)
            }

            function lR(e, t, n, r, a) {
                var i, o, u, s = void 0 === a,
                    l = {
                        kind: "field",
                        proto: e,
                        deprecated: null != (o = null == (i = e.options) ? void 0 : i.deprecated) && o,
                        name: e.name,
                        number: e.number,
                        scalar: void 0,
                        message: void 0,
                        enum: void 0,
                        presence: function(e, t, n, r) {
                            if (2 == e.label) return 3;
                            if (3 == e.label) return 2;
                            if (t || e.proto3Optional || n) return 1;
                            var a = lZ("fieldPresence", {
                                proto: e,
                                parent: r
                            });
                            return 2 == a && (11 == e.type || 10 == e.type) ? 1 : a
                        }(e, r, s, t),
                        utf8Validation: 2 == lZ("utf8Validation", {
                            proto: e,
                            parent: t
                        }),
                        listKind: void 0,
                        mapKind: void 0,
                        mapKey: void 0,
                        delimitedEncoding: void 0,
                        packed: void 0,
                        longAsString: !1,
                        getDefaultValue: void 0
                    };
                if (s) {
                    var c = "file" == t.kind ? t : t.file,
                        f = "file" == t.kind ? void 0 : t,
                        d = lO(e, f, c);
                    l.kind = "extension", l.file = c, l.parent = f, l.oneof = void 0, l.typeName = d, l.jsonName = "[".concat(d, "]"), l.toString = function() {
                        return "extension ".concat(d)
                    };
                    var p = n.getMessage(lV(e.extendee));
                    lB(p, "invalid FieldDescriptorProto: extendee ".concat(e.extendee, " not found")), l.extendee = p
                } else lB("message" == t.kind), l.parent = t, l.oneof = r, l.localName = r ? le(e.name) : ln(le(e.name)), l.jsonName = e.jsonName, l.toString = function() {
                    return "field ".concat(t.typeName, ".").concat(e.name)
                };
                var v = e.label,
                    m = e.type,
                    h = null == (u = e.options) ? void 0 : u.jstype;
                if (3 === v) {
                    var g = 11 == m ? null == a ? void 0 : a.get(lV(e.typeName)) : void 0;
                    if (g) {
                        l.fieldKind = "map";
                        var y, b, _, E = (b = (y = g).fields.find(function(e) {
                                return 1 === e.number
                            }), _ = y.fields.find(function(e) {
                                return 2 === e.number
                            }), lB(b && "scalar" == b.fieldKind && b.scalar != em.BYTES && b.scalar != em.FLOAT && b.scalar != em.DOUBLE && _ && "list" != _.fieldKind && "map" != _.fieldKind), {
                                key: b,
                                value: _
                            }),
                            S = E.key,
                            w = E.value;
                        return l.mapKey = S.scalar, l.mapKind = w.fieldKind, l.message = w.message, l.delimitedEncoding = !1, l.enum = w.enum, l.scalar = w.scalar, l
                    }
                    switch (l.fieldKind = "list", m) {
                        case 11:
                        case 10:
                            l.listKind = "message", l.message = n.getMessage(lV(e.typeName)), lB(l.message), l.delimitedEncoding = lC(e, t);
                            break;
                        case 14:
                            l.listKind = "enum", l.enum = n.getEnum(lV(e.typeName)), lB(l.enum);
                            break;
                        default:
                            l.listKind = "scalar", l.scalar = m, l.longAsString = 1 == h
                    }
                    return l.packed = function(e, t) {
                        if (3 != e.label) return !1;
                        switch (e.type) {
                            case 9:
                            case 12:
                            case 10:
                            case 11:
                                return !1
                        }
                        var n = e.options;
                        return n && lb(n, "packed") ? n.packed : 1 == lZ("repeatedFieldEncoding", {
                            proto: e,
                            parent: t
                        })
                    }(e, t), l
                }
                switch (m) {
                    case 11:
                    case 10:
                        l.fieldKind = "message", l.message = n.getMessage(lV(e.typeName)), lB(l.message, "invalid FieldDescriptorProto: type_name ".concat(e.typeName, " not found")), l.delimitedEncoding = lC(e, t), l.getDefaultValue = function() {};
                        break;
                    case 14:
                        var T = n.getEnum(lV(e.typeName));
                        lB(void 0 !== T, "invalid FieldDescriptorProto: type_name ".concat(e.typeName, " not found")), l.fieldKind = "enum", l.enum = n.getEnum(lV(e.typeName)), l.getDefaultValue = function() {
                            return lb(e, "defaultValue") ? function(e, t) {
                                var n = e.values.find(function(e) {
                                    return e.name === t
                                });
                                if (!n) throw Error("cannot parse ".concat(e, " default value: ").concat(t));
                                return n.number
                            }(T, e.defaultValue) : void 0
                        };
                        break;
                    default:
                        l.fieldKind = "scalar", l.scalar = m, l.longAsString = 1 == h, l.getDefaultValue = function() {
                            return lb(e, "defaultValue") ? function(e, t) {
                                switch (e) {
                                    case em.STRING:
                                        return t;
                                    case em.BYTES:
                                        var n = function(e) {
                                            for (var t = [], n = {
                                                    tail: e,
                                                    c: "",
                                                    next: function() {
                                                        return 0 != this.tail.length && (this.c = this.tail[0], this.tail = this.tail.substring(1), !0)
                                                    },
                                                    take: function(e) {
                                                        if (this.tail.length >= e) {
                                                            var t = this.tail.substring(0, e);
                                                            return this.tail = this.tail.substring(e), t
                                                        }
                                                        return !1
                                                    }
                                                }; n.next();)
                                                if ("\\" === n.c) {
                                                    if (n.next()) switch (n.c) {
                                                        case "\\":
                                                            t.push(n.c.charCodeAt(0));
                                                            break;
                                                        case "b":
                                                            t.push(8);
                                                            break;
                                                        case "f":
                                                            t.push(12);
                                                            break;
                                                        case "n":
                                                            t.push(10);
                                                            break;
                                                        case "r":
                                                            t.push(13);
                                                            break;
                                                        case "t":
                                                            t.push(9);
                                                            break;
                                                        case "v":
                                                            t.push(11);
                                                            break;
                                                        case "0":
                                                        case "1":
                                                        case "2":
                                                        case "3":
                                                        case "4":
                                                        case "5":
                                                        case "6":
                                                        case "7":
                                                            var r = n.c,
                                                                a = n.take(2);
                                                            if (!1 === a) return !1;
                                                            var i = parseInt(r + a, 8);
                                                            if (Number.isNaN(i)) return !1;
                                                            t.push(i);
                                                            break;
                                                        case "x":
                                                            var o = n.c,
                                                                u = n.take(2);
                                                            if (!1 === u) return !1;
                                                            var s = parseInt(o + u, 16);
                                                            if (Number.isNaN(s)) return !1;
                                                            t.push(s);
                                                            break;
                                                        case "u":
                                                            var l = n.c,
                                                                c = n.take(4);
                                                            if (!1 === c) return !1;
                                                            var f = parseInt(l + c, 16);
                                                            if (Number.isNaN(f)) return !1;
                                                            var d = new Uint8Array(4);
                                                            new DataView(d.buffer).setInt32(0, f, !0), t.push(d[0], d[1], d[2], d[3]);
                                                            break;
                                                        case "U":
                                                            var p = n.c,
                                                                v = n.take(8);
                                                            if (!1 === v) return !1;
                                                            var m = lp.uEnc(p + v),
                                                                h = new Uint8Array(8),
                                                                g = new DataView(h.buffer);
                                                            g.setInt32(0, m.lo, !0), g.setInt32(4, m.hi, !0), t.push(h[0], h[1], h[2], h[3], h[4], h[5], h[6], h[7])
                                                    }
                                                } else t.push(n.c.charCodeAt(0));
                                            return new Uint8Array(t)
                                        }(t);
                                        if (!1 === n) throw Error("cannot parse ".concat(em[e], " default value: ").concat(t));
                                        return n;
                                    case em.INT64:
                                    case em.SFIXED64:
                                    case em.SINT64:
                                        return lp.parse(t);
                                    case em.UINT64:
                                    case em.FIXED64:
                                        return lp.uParse(t);
                                    case em.DOUBLE:
                                    case em.FLOAT:
                                        switch (t) {
                                            case "inf":
                                                return 1 / 0;
                                            case "-inf":
                                                return -1 / 0;
                                            case "nan":
                                                return NaN;
                                            default:
                                                return parseFloat(t)
                                        }
                                    case em.BOOL:
                                        return "true" === t;
                                    case em.INT32:
                                    case em.UINT32:
                                    case em.SINT32:
                                    case em.FIXED32:
                                    case em.SFIXED32:
                                        return parseInt(t, 10)
                                }
                            }(m, e.defaultValue) : void 0
                        }
                }
                return l
            }

            function lO(e, t, n) {
                return t ? "".concat(t.typeName, ".").concat(e.name) : n.proto.package.length > 0 ? "".concat(n.proto.package, ".").concat(e.name) : "".concat(e.name)
            }

            function lV(e) {
                return e.startsWith(".") ? e.substring(1) : e
            }

            function lC(e, t) {
                return 10 == e.type || 2 == lZ("messageEncoding", {
                    proto: e,
                    parent: t
                })
            }

            function lZ(e, t) {
                var n, r, a = null == (n = t.proto.options) ? void 0 : n.features;
                if (a) {
                    var i = a[e];
                    if (0 != i) return i
                }
                if ("kind" in t) {
                    if ("message" == t.kind) return lZ(e, null != (r = t.parent) ? r : t.file);
                    var o = lI[t.edition];
                    if (!o) throw Error("feature default for edition ".concat(t.edition, " not found"));
                    return o[e]
                }
                return lZ(e, t.parent)
            }

            function lB(e, t) {
                if (!e) throw Error(t)
            }

            function lL(e) {
                var t, n, r, a, i, o, u, s;
                return Object.assign(Object.create({
                    visibility: 0
                }), {
                    $typeName: "google.protobuf.DescriptorProto",
                    name: e.name,
                    field: null != (n = null == (t = e.field) ? void 0 : t.map(lF)) ? n : [],
                    extension: [],
                    nestedType: null != (a = null == (r = e.nestedType) ? void 0 : r.map(lL)) ? a : [],
                    enumType: null != (o = null == (i = e.enumType) ? void 0 : i.map(lP)) ? o : [],
                    extensionRange: null != (s = null == (u = e.extensionRange) ? void 0 : u.map(function(e) {
                        return Object.assign({
                            $typeName: "google.protobuf.DescriptorProto.ExtensionRange"
                        }, e)
                    })) ? s : [],
                    oneofDecl: [],
                    reservedRange: [],
                    reservedName: []
                })
            }

            function lF(e) {
                var t, n, r, a;
                return Object.assign(Object.create({
                    label: 1,
                    typeName: "",
                    extendee: "",
                    defaultValue: "",
                    oneofIndex: 0,
                    jsonName: "",
                    proto3Optional: !1
                }), Object.assign(Object.assign({
                    $typeName: "google.protobuf.FieldDescriptorProto"
                }, e), {
                    options: e.options ? (t = e.options, Object.assign(Object.create({
                        ctype: 0,
                        packed: !1,
                        jstype: 0,
                        lazy: !1,
                        unverifiedLazy: !1,
                        deprecated: !1,
                        weak: !1,
                        debugRedact: !1,
                        retention: 0
                    }), Object.assign(Object.assign({
                        $typeName: "google.protobuf.FieldOptions"
                    }, t), {
                        targets: null != (n = t.targets) ? n : [],
                        editionDefaults: null != (a = null == (r = t.editionDefaults) ? void 0 : r.map(function(e) {
                            return Object.assign({
                                $typeName: "google.protobuf.FieldOptions.EditionDefault"
                            }, e)
                        })) ? a : [],
                        uninterpretedOption: []
                    }))) : void 0
                }))
            }

            function lP(e) {
                return Object.assign(Object.create({
                    visibility: 0
                }), {
                    $typeName: "google.protobuf.EnumDescriptorProto",
                    name: e.name,
                    reservedName: [],
                    reservedRange: [],
                    value: e.value.map(function(e) {
                        return Object.assign({
                            $typeName: "google.protobuf.EnumValueDescriptorProto"
                        }, e)
                    })
                })
            }

            function lX(e, t) {
                for (var n = arguments.length, r = Array(n > 2 ? n - 2 : 0), a = 2; a < n; a++) r[a - 2] = arguments[a];
                return r.reduce(function(e, t) {
                    return e.nestedMessages[t]
                }, e.messages[t])
            }
            var lU = ((i = {
                    name: "google/protobuf/descriptor.proto",
                    package: "google.protobuf",
                    messageType: [{
                        name: "FileDescriptorSet",
                        field: [{
                            name: "file",
                            number: 1,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.FileDescriptorProto"
                        }],
                        extensionRange: [{
                            start: 536e6,
                            end: 0x1ff2b601
                        }]
                    }, {
                        name: "FileDescriptorProto",
                        field: [{
                            name: "name",
                            number: 1,
                            type: 9,
                            label: 1
                        }, {
                            name: "package",
                            number: 2,
                            type: 9,
                            label: 1
                        }, {
                            name: "dependency",
                            number: 3,
                            type: 9,
                            label: 3
                        }, {
                            name: "public_dependency",
                            number: 10,
                            type: 5,
                            label: 3
                        }, {
                            name: "weak_dependency",
                            number: 11,
                            type: 5,
                            label: 3
                        }, {
                            name: "option_dependency",
                            number: 15,
                            type: 9,
                            label: 3
                        }, {
                            name: "message_type",
                            number: 4,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.DescriptorProto"
                        }, {
                            name: "enum_type",
                            number: 5,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.EnumDescriptorProto"
                        }, {
                            name: "service",
                            number: 6,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.ServiceDescriptorProto"
                        }, {
                            name: "extension",
                            number: 7,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.FieldDescriptorProto"
                        }, {
                            name: "options",
                            number: 8,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.FileOptions"
                        }, {
                            name: "source_code_info",
                            number: 9,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.SourceCodeInfo"
                        }, {
                            name: "syntax",
                            number: 12,
                            type: 9,
                            label: 1
                        }, {
                            name: "edition",
                            number: 14,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.Edition"
                        }]
                    }, {
                        name: "DescriptorProto",
                        field: [{
                            name: "name",
                            number: 1,
                            type: 9,
                            label: 1
                        }, {
                            name: "field",
                            number: 2,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.FieldDescriptorProto"
                        }, {
                            name: "extension",
                            number: 6,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.FieldDescriptorProto"
                        }, {
                            name: "nested_type",
                            number: 3,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.DescriptorProto"
                        }, {
                            name: "enum_type",
                            number: 4,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.EnumDescriptorProto"
                        }, {
                            name: "extension_range",
                            number: 5,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.DescriptorProto.ExtensionRange"
                        }, {
                            name: "oneof_decl",
                            number: 8,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.OneofDescriptorProto"
                        }, {
                            name: "options",
                            number: 7,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.MessageOptions"
                        }, {
                            name: "reserved_range",
                            number: 9,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.DescriptorProto.ReservedRange"
                        }, {
                            name: "reserved_name",
                            number: 10,
                            type: 9,
                            label: 3
                        }, {
                            name: "visibility",
                            number: 11,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.SymbolVisibility"
                        }],
                        nestedType: [{
                            name: "ExtensionRange",
                            field: [{
                                name: "start",
                                number: 1,
                                type: 5,
                                label: 1
                            }, {
                                name: "end",
                                number: 2,
                                type: 5,
                                label: 1
                            }, {
                                name: "options",
                                number: 3,
                                type: 11,
                                label: 1,
                                typeName: ".google.protobuf.ExtensionRangeOptions"
                            }]
                        }, {
                            name: "ReservedRange",
                            field: [{
                                name: "start",
                                number: 1,
                                type: 5,
                                label: 1
                            }, {
                                name: "end",
                                number: 2,
                                type: 5,
                                label: 1
                            }]
                        }]
                    }, {
                        name: "ExtensionRangeOptions",
                        field: [{
                            name: "uninterpreted_option",
                            number: 999,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.UninterpretedOption"
                        }, {
                            name: "declaration",
                            number: 2,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.ExtensionRangeOptions.Declaration",
                            options: {
                                retention: 2
                            }
                        }, {
                            name: "features",
                            number: 50,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.FeatureSet"
                        }, {
                            name: "verification",
                            number: 3,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.ExtensionRangeOptions.VerificationState",
                            defaultValue: "UNVERIFIED",
                            options: {
                                retention: 2
                            }
                        }],
                        nestedType: [{
                            name: "Declaration",
                            field: [{
                                name: "number",
                                number: 1,
                                type: 5,
                                label: 1
                            }, {
                                name: "full_name",
                                number: 2,
                                type: 9,
                                label: 1
                            }, {
                                name: "type",
                                number: 3,
                                type: 9,
                                label: 1
                            }, {
                                name: "reserved",
                                number: 5,
                                type: 8,
                                label: 1
                            }, {
                                name: "repeated",
                                number: 6,
                                type: 8,
                                label: 1
                            }]
                        }],
                        enumType: [{
                            name: "VerificationState",
                            value: [{
                                name: "DECLARATION",
                                number: 0
                            }, {
                                name: "UNVERIFIED",
                                number: 1
                            }]
                        }],
                        extensionRange: [{
                            start: 1e3,
                            end: 0x20000000
                        }]
                    }, {
                        name: "FieldDescriptorProto",
                        field: [{
                            name: "name",
                            number: 1,
                            type: 9,
                            label: 1
                        }, {
                            name: "number",
                            number: 3,
                            type: 5,
                            label: 1
                        }, {
                            name: "label",
                            number: 4,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.FieldDescriptorProto.Label"
                        }, {
                            name: "type",
                            number: 5,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.FieldDescriptorProto.Type"
                        }, {
                            name: "type_name",
                            number: 6,
                            type: 9,
                            label: 1
                        }, {
                            name: "extendee",
                            number: 2,
                            type: 9,
                            label: 1
                        }, {
                            name: "default_value",
                            number: 7,
                            type: 9,
                            label: 1
                        }, {
                            name: "oneof_index",
                            number: 9,
                            type: 5,
                            label: 1
                        }, {
                            name: "json_name",
                            number: 10,
                            type: 9,
                            label: 1
                        }, {
                            name: "options",
                            number: 8,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.FieldOptions"
                        }, {
                            name: "proto3_optional",
                            number: 17,
                            type: 8,
                            label: 1
                        }],
                        enumType: [{
                            name: "Type",
                            value: [{
                                name: "TYPE_DOUBLE",
                                number: 1
                            }, {
                                name: "TYPE_FLOAT",
                                number: 2
                            }, {
                                name: "TYPE_INT64",
                                number: 3
                            }, {
                                name: "TYPE_UINT64",
                                number: 4
                            }, {
                                name: "TYPE_INT32",
                                number: 5
                            }, {
                                name: "TYPE_FIXED64",
                                number: 6
                            }, {
                                name: "TYPE_FIXED32",
                                number: 7
                            }, {
                                name: "TYPE_BOOL",
                                number: 8
                            }, {
                                name: "TYPE_STRING",
                                number: 9
                            }, {
                                name: "TYPE_GROUP",
                                number: 10
                            }, {
                                name: "TYPE_MESSAGE",
                                number: 11
                            }, {
                                name: "TYPE_BYTES",
                                number: 12
                            }, {
                                name: "TYPE_UINT32",
                                number: 13
                            }, {
                                name: "TYPE_ENUM",
                                number: 14
                            }, {
                                name: "TYPE_SFIXED32",
                                number: 15
                            }, {
                                name: "TYPE_SFIXED64",
                                number: 16
                            }, {
                                name: "TYPE_SINT32",
                                number: 17
                            }, {
                                name: "TYPE_SINT64",
                                number: 18
                            }]
                        }, {
                            name: "Label",
                            value: [{
                                name: "LABEL_OPTIONAL",
                                number: 1
                            }, {
                                name: "LABEL_REPEATED",
                                number: 3
                            }, {
                                name: "LABEL_REQUIRED",
                                number: 2
                            }]
                        }]
                    }, {
                        name: "OneofDescriptorProto",
                        field: [{
                            name: "name",
                            number: 1,
                            type: 9,
                            label: 1
                        }, {
                            name: "options",
                            number: 2,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.OneofOptions"
                        }]
                    }, {
                        name: "EnumDescriptorProto",
                        field: [{
                            name: "name",
                            number: 1,
                            type: 9,
                            label: 1
                        }, {
                            name: "value",
                            number: 2,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.EnumValueDescriptorProto"
                        }, {
                            name: "options",
                            number: 3,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.EnumOptions"
                        }, {
                            name: "reserved_range",
                            number: 4,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.EnumDescriptorProto.EnumReservedRange"
                        }, {
                            name: "reserved_name",
                            number: 5,
                            type: 9,
                            label: 3
                        }, {
                            name: "visibility",
                            number: 6,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.SymbolVisibility"
                        }],
                        nestedType: [{
                            name: "EnumReservedRange",
                            field: [{
                                name: "start",
                                number: 1,
                                type: 5,
                                label: 1
                            }, {
                                name: "end",
                                number: 2,
                                type: 5,
                                label: 1
                            }]
                        }]
                    }, {
                        name: "EnumValueDescriptorProto",
                        field: [{
                            name: "name",
                            number: 1,
                            type: 9,
                            label: 1
                        }, {
                            name: "number",
                            number: 2,
                            type: 5,
                            label: 1
                        }, {
                            name: "options",
                            number: 3,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.EnumValueOptions"
                        }]
                    }, {
                        name: "ServiceDescriptorProto",
                        field: [{
                            name: "name",
                            number: 1,
                            type: 9,
                            label: 1
                        }, {
                            name: "method",
                            number: 2,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.MethodDescriptorProto"
                        }, {
                            name: "options",
                            number: 3,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.ServiceOptions"
                        }]
                    }, {
                        name: "MethodDescriptorProto",
                        field: [{
                            name: "name",
                            number: 1,
                            type: 9,
                            label: 1
                        }, {
                            name: "input_type",
                            number: 2,
                            type: 9,
                            label: 1
                        }, {
                            name: "output_type",
                            number: 3,
                            type: 9,
                            label: 1
                        }, {
                            name: "options",
                            number: 4,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.MethodOptions"
                        }, {
                            name: "client_streaming",
                            number: 5,
                            type: 8,
                            label: 1,
                            defaultValue: "false"
                        }, {
                            name: "server_streaming",
                            number: 6,
                            type: 8,
                            label: 1,
                            defaultValue: "false"
                        }]
                    }, {
                        name: "FileOptions",
                        field: [{
                            name: "java_package",
                            number: 1,
                            type: 9,
                            label: 1
                        }, {
                            name: "java_outer_classname",
                            number: 8,
                            type: 9,
                            label: 1
                        }, {
                            name: "java_multiple_files",
                            number: 10,
                            type: 8,
                            label: 1,
                            defaultValue: "false",
                            options: {}
                        }, {
                            name: "java_generate_equals_and_hash",
                            number: 20,
                            type: 8,
                            label: 1,
                            options: {
                                deprecated: !0
                            }
                        }, {
                            name: "java_string_check_utf8",
                            number: 27,
                            type: 8,
                            label: 1,
                            defaultValue: "false"
                        }, {
                            name: "optimize_for",
                            number: 9,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.FileOptions.OptimizeMode",
                            defaultValue: "SPEED"
                        }, {
                            name: "go_package",
                            number: 11,
                            type: 9,
                            label: 1
                        }, {
                            name: "cc_generic_services",
                            number: 16,
                            type: 8,
                            label: 1,
                            defaultValue: "false"
                        }, {
                            name: "java_generic_services",
                            number: 17,
                            type: 8,
                            label: 1,
                            defaultValue: "false"
                        }, {
                            name: "py_generic_services",
                            number: 18,
                            type: 8,
                            label: 1,
                            defaultValue: "false"
                        }, {
                            name: "deprecated",
                            number: 23,
                            type: 8,
                            label: 1,
                            defaultValue: "false"
                        }, {
                            name: "cc_enable_arenas",
                            number: 31,
                            type: 8,
                            label: 1,
                            defaultValue: "true"
                        }, {
                            name: "objc_class_prefix",
                            number: 36,
                            type: 9,
                            label: 1
                        }, {
                            name: "csharp_namespace",
                            number: 37,
                            type: 9,
                            label: 1
                        }, {
                            name: "swift_prefix",
                            number: 39,
                            type: 9,
                            label: 1
                        }, {
                            name: "php_class_prefix",
                            number: 40,
                            type: 9,
                            label: 1
                        }, {
                            name: "php_namespace",
                            number: 41,
                            type: 9,
                            label: 1
                        }, {
                            name: "php_metadata_namespace",
                            number: 44,
                            type: 9,
                            label: 1
                        }, {
                            name: "ruby_package",
                            number: 45,
                            type: 9,
                            label: 1
                        }, {
                            name: "features",
                            number: 50,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.FeatureSet"
                        }, {
                            name: "uninterpreted_option",
                            number: 999,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.UninterpretedOption"
                        }],
                        enumType: [{
                            name: "OptimizeMode",
                            value: [{
                                name: "SPEED",
                                number: 1
                            }, {
                                name: "CODE_SIZE",
                                number: 2
                            }, {
                                name: "LITE_RUNTIME",
                                number: 3
                            }]
                        }],
                        extensionRange: [{
                            start: 1e3,
                            end: 0x20000000
                        }]
                    }, {
                        name: "MessageOptions",
                        field: [{
                            name: "message_set_wire_format",
                            number: 1,
                            type: 8,
                            label: 1,
                            defaultValue: "false"
                        }, {
                            name: "no_standard_descriptor_accessor",
                            number: 2,
                            type: 8,
                            label: 1,
                            defaultValue: "false"
                        }, {
                            name: "deprecated",
                            number: 3,
                            type: 8,
                            label: 1,
                            defaultValue: "false"
                        }, {
                            name: "map_entry",
                            number: 7,
                            type: 8,
                            label: 1
                        }, {
                            name: "deprecated_legacy_json_field_conflicts",
                            number: 11,
                            type: 8,
                            label: 1,
                            options: {
                                deprecated: !0
                            }
                        }, {
                            name: "features",
                            number: 12,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.FeatureSet"
                        }, {
                            name: "uninterpreted_option",
                            number: 999,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.UninterpretedOption"
                        }],
                        extensionRange: [{
                            start: 1e3,
                            end: 0x20000000
                        }]
                    }, {
                        name: "FieldOptions",
                        field: [{
                            name: "ctype",
                            number: 1,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.FieldOptions.CType",
                            defaultValue: "STRING"
                        }, {
                            name: "packed",
                            number: 2,
                            type: 8,
                            label: 1
                        }, {
                            name: "jstype",
                            number: 6,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.FieldOptions.JSType",
                            defaultValue: "JS_NORMAL"
                        }, {
                            name: "lazy",
                            number: 5,
                            type: 8,
                            label: 1,
                            defaultValue: "false"
                        }, {
                            name: "unverified_lazy",
                            number: 15,
                            type: 8,
                            label: 1,
                            defaultValue: "false"
                        }, {
                            name: "deprecated",
                            number: 3,
                            type: 8,
                            label: 1,
                            defaultValue: "false"
                        }, {
                            name: "weak",
                            number: 10,
                            type: 8,
                            label: 1,
                            defaultValue: "false",
                            options: {
                                deprecated: !0
                            }
                        }, {
                            name: "debug_redact",
                            number: 16,
                            type: 8,
                            label: 1,
                            defaultValue: "false"
                        }, {
                            name: "retention",
                            number: 17,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.FieldOptions.OptionRetention"
                        }, {
                            name: "targets",
                            number: 19,
                            type: 14,
                            label: 3,
                            typeName: ".google.protobuf.FieldOptions.OptionTargetType"
                        }, {
                            name: "edition_defaults",
                            number: 20,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.FieldOptions.EditionDefault"
                        }, {
                            name: "features",
                            number: 21,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.FeatureSet"
                        }, {
                            name: "feature_support",
                            number: 22,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.FieldOptions.FeatureSupport"
                        }, {
                            name: "uninterpreted_option",
                            number: 999,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.UninterpretedOption"
                        }],
                        nestedType: [{
                            name: "EditionDefault",
                            field: [{
                                name: "edition",
                                number: 3,
                                type: 14,
                                label: 1,
                                typeName: ".google.protobuf.Edition"
                            }, {
                                name: "value",
                                number: 2,
                                type: 9,
                                label: 1
                            }]
                        }, {
                            name: "FeatureSupport",
                            field: [{
                                name: "edition_introduced",
                                number: 1,
                                type: 14,
                                label: 1,
                                typeName: ".google.protobuf.Edition"
                            }, {
                                name: "edition_deprecated",
                                number: 2,
                                type: 14,
                                label: 1,
                                typeName: ".google.protobuf.Edition"
                            }, {
                                name: "deprecation_warning",
                                number: 3,
                                type: 9,
                                label: 1
                            }, {
                                name: "edition_removed",
                                number: 4,
                                type: 14,
                                label: 1,
                                typeName: ".google.protobuf.Edition"
                            }, {
                                name: "removal_error",
                                number: 5,
                                type: 9,
                                label: 1
                            }]
                        }],
                        enumType: [{
                            name: "CType",
                            value: [{
                                name: "STRING",
                                number: 0
                            }, {
                                name: "CORD",
                                number: 1
                            }, {
                                name: "STRING_PIECE",
                                number: 2
                            }]
                        }, {
                            name: "JSType",
                            value: [{
                                name: "JS_NORMAL",
                                number: 0
                            }, {
                                name: "JS_STRING",
                                number: 1
                            }, {
                                name: "JS_NUMBER",
                                number: 2
                            }]
                        }, {
                            name: "OptionRetention",
                            value: [{
                                name: "RETENTION_UNKNOWN",
                                number: 0
                            }, {
                                name: "RETENTION_RUNTIME",
                                number: 1
                            }, {
                                name: "RETENTION_SOURCE",
                                number: 2
                            }]
                        }, {
                            name: "OptionTargetType",
                            value: [{
                                name: "TARGET_TYPE_UNKNOWN",
                                number: 0
                            }, {
                                name: "TARGET_TYPE_FILE",
                                number: 1
                            }, {
                                name: "TARGET_TYPE_EXTENSION_RANGE",
                                number: 2
                            }, {
                                name: "TARGET_TYPE_MESSAGE",
                                number: 3
                            }, {
                                name: "TARGET_TYPE_FIELD",
                                number: 4
                            }, {
                                name: "TARGET_TYPE_ONEOF",
                                number: 5
                            }, {
                                name: "TARGET_TYPE_ENUM",
                                number: 6
                            }, {
                                name: "TARGET_TYPE_ENUM_ENTRY",
                                number: 7
                            }, {
                                name: "TARGET_TYPE_SERVICE",
                                number: 8
                            }, {
                                name: "TARGET_TYPE_METHOD",
                                number: 9
                            }]
                        }],
                        extensionRange: [{
                            start: 1e3,
                            end: 0x20000000
                        }]
                    }, {
                        name: "OneofOptions",
                        field: [{
                            name: "features",
                            number: 1,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.FeatureSet"
                        }, {
                            name: "uninterpreted_option",
                            number: 999,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.UninterpretedOption"
                        }],
                        extensionRange: [{
                            start: 1e3,
                            end: 0x20000000
                        }]
                    }, {
                        name: "EnumOptions",
                        field: [{
                            name: "allow_alias",
                            number: 2,
                            type: 8,
                            label: 1
                        }, {
                            name: "deprecated",
                            number: 3,
                            type: 8,
                            label: 1,
                            defaultValue: "false"
                        }, {
                            name: "deprecated_legacy_json_field_conflicts",
                            number: 6,
                            type: 8,
                            label: 1,
                            options: {
                                deprecated: !0
                            }
                        }, {
                            name: "features",
                            number: 7,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.FeatureSet"
                        }, {
                            name: "uninterpreted_option",
                            number: 999,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.UninterpretedOption"
                        }],
                        extensionRange: [{
                            start: 1e3,
                            end: 0x20000000
                        }]
                    }, {
                        name: "EnumValueOptions",
                        field: [{
                            name: "deprecated",
                            number: 1,
                            type: 8,
                            label: 1,
                            defaultValue: "false"
                        }, {
                            name: "features",
                            number: 2,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.FeatureSet"
                        }, {
                            name: "debug_redact",
                            number: 3,
                            type: 8,
                            label: 1,
                            defaultValue: "false"
                        }, {
                            name: "feature_support",
                            number: 4,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.FieldOptions.FeatureSupport"
                        }, {
                            name: "uninterpreted_option",
                            number: 999,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.UninterpretedOption"
                        }],
                        extensionRange: [{
                            start: 1e3,
                            end: 0x20000000
                        }]
                    }, {
                        name: "ServiceOptions",
                        field: [{
                            name: "features",
                            number: 34,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.FeatureSet"
                        }, {
                            name: "deprecated",
                            number: 33,
                            type: 8,
                            label: 1,
                            defaultValue: "false"
                        }, {
                            name: "uninterpreted_option",
                            number: 999,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.UninterpretedOption"
                        }],
                        extensionRange: [{
                            start: 1e3,
                            end: 0x20000000
                        }]
                    }, {
                        name: "MethodOptions",
                        field: [{
                            name: "deprecated",
                            number: 33,
                            type: 8,
                            label: 1,
                            defaultValue: "false"
                        }, {
                            name: "idempotency_level",
                            number: 34,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.MethodOptions.IdempotencyLevel",
                            defaultValue: "IDEMPOTENCY_UNKNOWN"
                        }, {
                            name: "features",
                            number: 35,
                            type: 11,
                            label: 1,
                            typeName: ".google.protobuf.FeatureSet"
                        }, {
                            name: "uninterpreted_option",
                            number: 999,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.UninterpretedOption"
                        }],
                        enumType: [{
                            name: "IdempotencyLevel",
                            value: [{
                                name: "IDEMPOTENCY_UNKNOWN",
                                number: 0
                            }, {
                                name: "NO_SIDE_EFFECTS",
                                number: 1
                            }, {
                                name: "IDEMPOTENT",
                                number: 2
                            }]
                        }],
                        extensionRange: [{
                            start: 1e3,
                            end: 0x20000000
                        }]
                    }, {
                        name: "UninterpretedOption",
                        field: [{
                            name: "name",
                            number: 2,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.UninterpretedOption.NamePart"
                        }, {
                            name: "identifier_value",
                            number: 3,
                            type: 9,
                            label: 1
                        }, {
                            name: "positive_int_value",
                            number: 4,
                            type: 4,
                            label: 1
                        }, {
                            name: "negative_int_value",
                            number: 5,
                            type: 3,
                            label: 1
                        }, {
                            name: "double_value",
                            number: 6,
                            type: 1,
                            label: 1
                        }, {
                            name: "string_value",
                            number: 7,
                            type: 12,
                            label: 1
                        }, {
                            name: "aggregate_value",
                            number: 8,
                            type: 9,
                            label: 1
                        }],
                        nestedType: [{
                            name: "NamePart",
                            field: [{
                                name: "name_part",
                                number: 1,
                                type: 9,
                                label: 2
                            }, {
                                name: "is_extension",
                                number: 2,
                                type: 8,
                                label: 2
                            }]
                        }]
                    }, {
                        name: "FeatureSet",
                        field: [{
                            name: "field_presence",
                            number: 1,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.FeatureSet.FieldPresence",
                            options: {
                                retention: 1,
                                targets: [4, 1],
                                editionDefaults: [{
                                    value: "EXPLICIT",
                                    edition: 900
                                }, {
                                    value: "IMPLICIT",
                                    edition: 999
                                }, {
                                    value: "EXPLICIT",
                                    edition: 1e3
                                }]
                            }
                        }, {
                            name: "enum_type",
                            number: 2,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.FeatureSet.EnumType",
                            options: {
                                retention: 1,
                                targets: [6, 1],
                                editionDefaults: [{
                                    value: "CLOSED",
                                    edition: 900
                                }, {
                                    value: "OPEN",
                                    edition: 999
                                }]
                            }
                        }, {
                            name: "repeated_field_encoding",
                            number: 3,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.FeatureSet.RepeatedFieldEncoding",
                            options: {
                                retention: 1,
                                targets: [4, 1],
                                editionDefaults: [{
                                    value: "EXPANDED",
                                    edition: 900
                                }, {
                                    value: "PACKED",
                                    edition: 999
                                }]
                            }
                        }, {
                            name: "utf8_validation",
                            number: 4,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.FeatureSet.Utf8Validation",
                            options: {
                                retention: 1,
                                targets: [4, 1],
                                editionDefaults: [{
                                    value: "NONE",
                                    edition: 900
                                }, {
                                    value: "VERIFY",
                                    edition: 999
                                }]
                            }
                        }, {
                            name: "message_encoding",
                            number: 5,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.FeatureSet.MessageEncoding",
                            options: {
                                retention: 1,
                                targets: [4, 1],
                                editionDefaults: [{
                                    value: "LENGTH_PREFIXED",
                                    edition: 900
                                }]
                            }
                        }, {
                            name: "json_format",
                            number: 6,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.FeatureSet.JsonFormat",
                            options: {
                                retention: 1,
                                targets: [3, 6, 1],
                                editionDefaults: [{
                                    value: "LEGACY_BEST_EFFORT",
                                    edition: 900
                                }, {
                                    value: "ALLOW",
                                    edition: 999
                                }]
                            }
                        }, {
                            name: "enforce_naming_style",
                            number: 7,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.FeatureSet.EnforceNamingStyle",
                            options: {
                                retention: 2,
                                targets: [1, 2, 3, 4, 5, 6, 7, 8, 9],
                                editionDefaults: [{
                                    value: "STYLE_LEGACY",
                                    edition: 900
                                }, {
                                    value: "STYLE2024",
                                    edition: 1001
                                }]
                            }
                        }, {
                            name: "default_symbol_visibility",
                            number: 8,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.FeatureSet.VisibilityFeature.DefaultSymbolVisibility",
                            options: {
                                retention: 2,
                                targets: [1],
                                editionDefaults: [{
                                    value: "EXPORT_ALL",
                                    edition: 900
                                }, {
                                    value: "EXPORT_TOP_LEVEL",
                                    edition: 1001
                                }]
                            }
                        }],
                        nestedType: [{
                            name: "VisibilityFeature",
                            enumType: [{
                                name: "DefaultSymbolVisibility",
                                value: [{
                                    name: "DEFAULT_SYMBOL_VISIBILITY_UNKNOWN",
                                    number: 0
                                }, {
                                    name: "EXPORT_ALL",
                                    number: 1
                                }, {
                                    name: "EXPORT_TOP_LEVEL",
                                    number: 2
                                }, {
                                    name: "LOCAL_ALL",
                                    number: 3
                                }, {
                                    name: "STRICT",
                                    number: 4
                                }]
                            }]
                        }],
                        enumType: [{
                            name: "FieldPresence",
                            value: [{
                                name: "FIELD_PRESENCE_UNKNOWN",
                                number: 0
                            }, {
                                name: "EXPLICIT",
                                number: 1
                            }, {
                                name: "IMPLICIT",
                                number: 2
                            }, {
                                name: "LEGACY_REQUIRED",
                                number: 3
                            }]
                        }, {
                            name: "EnumType",
                            value: [{
                                name: "ENUM_TYPE_UNKNOWN",
                                number: 0
                            }, {
                                name: "OPEN",
                                number: 1
                            }, {
                                name: "CLOSED",
                                number: 2
                            }]
                        }, {
                            name: "RepeatedFieldEncoding",
                            value: [{
                                name: "REPEATED_FIELD_ENCODING_UNKNOWN",
                                number: 0
                            }, {
                                name: "PACKED",
                                number: 1
                            }, {
                                name: "EXPANDED",
                                number: 2
                            }]
                        }, {
                            name: "Utf8Validation",
                            value: [{
                                name: "UTF8_VALIDATION_UNKNOWN",
                                number: 0
                            }, {
                                name: "VERIFY",
                                number: 2
                            }, {
                                name: "NONE",
                                number: 3
                            }]
                        }, {
                            name: "MessageEncoding",
                            value: [{
                                name: "MESSAGE_ENCODING_UNKNOWN",
                                number: 0
                            }, {
                                name: "LENGTH_PREFIXED",
                                number: 1
                            }, {
                                name: "DELIMITED",
                                number: 2
                            }]
                        }, {
                            name: "JsonFormat",
                            value: [{
                                name: "JSON_FORMAT_UNKNOWN",
                                number: 0
                            }, {
                                name: "ALLOW",
                                number: 1
                            }, {
                                name: "LEGACY_BEST_EFFORT",
                                number: 2
                            }]
                        }, {
                            name: "EnforceNamingStyle",
                            value: [{
                                name: "ENFORCE_NAMING_STYLE_UNKNOWN",
                                number: 0
                            }, {
                                name: "STYLE2024",
                                number: 1
                            }, {
                                name: "STYLE_LEGACY",
                                number: 2
                            }]
                        }],
                        extensionRange: [{
                            start: 1e3,
                            end: 9995
                        }, {
                            start: 9995,
                            end: 1e4
                        }, {
                            start: 1e4,
                            end: 10001
                        }]
                    }, {
                        name: "FeatureSetDefaults",
                        field: [{
                            name: "defaults",
                            number: 1,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.FeatureSetDefaults.FeatureSetEditionDefault"
                        }, {
                            name: "minimum_edition",
                            number: 4,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.Edition"
                        }, {
                            name: "maximum_edition",
                            number: 5,
                            type: 14,
                            label: 1,
                            typeName: ".google.protobuf.Edition"
                        }],
                        nestedType: [{
                            name: "FeatureSetEditionDefault",
                            field: [{
                                name: "edition",
                                number: 3,
                                type: 14,
                                label: 1,
                                typeName: ".google.protobuf.Edition"
                            }, {
                                name: "overridable_features",
                                number: 4,
                                type: 11,
                                label: 1,
                                typeName: ".google.protobuf.FeatureSet"
                            }, {
                                name: "fixed_features",
                                number: 5,
                                type: 11,
                                label: 1,
                                typeName: ".google.protobuf.FeatureSet"
                            }]
                        }]
                    }, {
                        name: "SourceCodeInfo",
                        field: [{
                            name: "location",
                            number: 1,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.SourceCodeInfo.Location"
                        }],
                        nestedType: [{
                            name: "Location",
                            field: [{
                                name: "path",
                                number: 1,
                                type: 5,
                                label: 3,
                                options: {
                                    packed: !0
                                }
                            }, {
                                name: "span",
                                number: 2,
                                type: 5,
                                label: 3,
                                options: {
                                    packed: !0
                                }
                            }, {
                                name: "leading_comments",
                                number: 3,
                                type: 9,
                                label: 1
                            }, {
                                name: "trailing_comments",
                                number: 4,
                                type: 9,
                                label: 1
                            }, {
                                name: "leading_detached_comments",
                                number: 6,
                                type: 9,
                                label: 3
                            }]
                        }],
                        extensionRange: [{
                            start: 536e6,
                            end: 0x1ff2b601
                        }]
                    }, {
                        name: "GeneratedCodeInfo",
                        field: [{
                            name: "annotation",
                            number: 1,
                            type: 11,
                            label: 3,
                            typeName: ".google.protobuf.GeneratedCodeInfo.Annotation"
                        }],
                        nestedType: [{
                            name: "Annotation",
                            field: [{
                                name: "path",
                                number: 1,
                                type: 5,
                                label: 3,
                                options: {
                                    packed: !0
                                }
                            }, {
                                name: "source_file",
                                number: 2,
                                type: 9,
                                label: 1
                            }, {
                                name: "begin",
                                number: 3,
                                type: 5,
                                label: 1
                            }, {
                                name: "end",
                                number: 4,
                                type: 5,
                                label: 1
                            }, {
                                name: "semantic",
                                number: 5,
                                type: 14,
                                label: 1,
                                typeName: ".google.protobuf.GeneratedCodeInfo.Annotation.Semantic"
                            }],
                            enumType: [{
                                name: "Semantic",
                                value: [{
                                    name: "NONE",
                                    number: 0
                                }, {
                                    name: "SET",
                                    number: 1
                                }, {
                                    name: "ALIAS",
                                    number: 2
                                }]
                            }]
                        }]
                    }],
                    enumType: [{
                        name: "Edition",
                        value: [{
                            name: "EDITION_UNKNOWN",
                            number: 0
                        }, {
                            name: "EDITION_LEGACY",
                            number: 900
                        }, {
                            name: "EDITION_PROTO2",
                            number: 998
                        }, {
                            name: "EDITION_PROTO3",
                            number: 999
                        }, {
                            name: "EDITION_2023",
                            number: 1e3
                        }, {
                            name: "EDITION_2024",
                            number: 1001
                        }, {
                            name: "EDITION_UNSTABLE",
                            number: 9999
                        }, {
                            name: "EDITION_1_TEST_ONLY",
                            number: 1
                        }, {
                            name: "EDITION_2_TEST_ONLY",
                            number: 2
                        }, {
                            name: "EDITION_99997_TEST_ONLY",
                            number: 99997
                        }, {
                            name: "EDITION_99998_TEST_ONLY",
                            number: 99998
                        }, {
                            name: "EDITION_99999_TEST_ONLY",
                            number: 99999
                        }, {
                            name: "EDITION_MAX",
                            number: 0x7fffffff
                        }]
                    }, {
                        name: "SymbolVisibility",
                        value: [{
                            name: "VISIBILITY_UNSET",
                            number: 0
                        }, {
                            name: "VISIBILITY_LOCAL",
                            number: 1
                        }, {
                            name: "VISIBILITY_EXPORT",
                            number: 2
                        }]
                    }]
                }, f = Object.assign(Object.create({
                    syntax: "",
                    edition: 0
                }), Object.assign(Object.assign({
                    $typeName: "google.protobuf.FileDescriptorProto",
                    dependency: [],
                    publicDependency: [],
                    weakDependency: [],
                    optionDependency: [],
                    service: [],
                    extension: []
                }, i), {
                    messageType: i.messageType.map(lL),
                    enumType: i.enumType.map(lP)
                }))).messageType.forEach(lS), lT(f, function() {}).getFile(f.name)),
                lW = lX(lU, 1);

            function lD(e, t) {
                return !!(null !== e && (void 0 === e ? "undefined" : (0, e8._)(e)) == "object" && "$typeName" in e && "string" == typeof e.$typeName) && (void 0 === t || t.typeName === e.$typeName)
            }(d = eh || (eh = {}))[d.DECLARATION = 0] = "DECLARATION", d[d.UNVERIFIED = 1] = "UNVERIFIED", (p = eg || (eg = {}))[p.DOUBLE = 1] = "DOUBLE", p[p.FLOAT = 2] = "FLOAT", p[p.INT64 = 3] = "INT64", p[p.UINT64 = 4] = "UINT64", p[p.INT32 = 5] = "INT32", p[p.FIXED64 = 6] = "FIXED64", p[p.FIXED32 = 7] = "FIXED32", p[p.BOOL = 8] = "BOOL", p[p.STRING = 9] = "STRING", p[p.GROUP = 10] = "GROUP", p[p.MESSAGE = 11] = "MESSAGE", p[p.BYTES = 12] = "BYTES", p[p.UINT32 = 13] = "UINT32", p[p.ENUM = 14] = "ENUM", p[p.SFIXED32 = 15] = "SFIXED32", p[p.SFIXED64 = 16] = "SFIXED64", p[p.SINT32 = 17] = "SINT32", p[p.SINT64 = 18] = "SINT64", (v = ey || (ey = {}))[v.OPTIONAL = 1] = "OPTIONAL", v[v.REPEATED = 3] = "REPEATED", v[v.REQUIRED = 2] = "REQUIRED", (m = eb || (eb = {}))[m.SPEED = 1] = "SPEED", m[m.CODE_SIZE = 2] = "CODE_SIZE", m[m.LITE_RUNTIME = 3] = "LITE_RUNTIME", (h = e_ || (e_ = {}))[h.STRING = 0] = "STRING", h[h.CORD = 1] = "CORD", h[h.STRING_PIECE = 2] = "STRING_PIECE", (g = eE || (eE = {}))[g.JS_NORMAL = 0] = "JS_NORMAL", g[g.JS_STRING = 1] = "JS_STRING", g[g.JS_NUMBER = 2] = "JS_NUMBER", (y = eS || (eS = {}))[y.RETENTION_UNKNOWN = 0] = "RETENTION_UNKNOWN", y[y.RETENTION_RUNTIME = 1] = "RETENTION_RUNTIME", y[y.RETENTION_SOURCE = 2] = "RETENTION_SOURCE", (b = ew || (ew = {}))[b.TARGET_TYPE_UNKNOWN = 0] = "TARGET_TYPE_UNKNOWN", b[b.TARGET_TYPE_FILE = 1] = "TARGET_TYPE_FILE", b[b.TARGET_TYPE_EXTENSION_RANGE = 2] = "TARGET_TYPE_EXTENSION_RANGE", b[b.TARGET_TYPE_MESSAGE = 3] = "TARGET_TYPE_MESSAGE", b[b.TARGET_TYPE_FIELD = 4] = "TARGET_TYPE_FIELD", b[b.TARGET_TYPE_ONEOF = 5] = "TARGET_TYPE_ONEOF", b[b.TARGET_TYPE_ENUM = 6] = "TARGET_TYPE_ENUM", b[b.TARGET_TYPE_ENUM_ENTRY = 7] = "TARGET_TYPE_ENUM_ENTRY", b[b.TARGET_TYPE_SERVICE = 8] = "TARGET_TYPE_SERVICE", b[b.TARGET_TYPE_METHOD = 9] = "TARGET_TYPE_METHOD", (_ = eT || (eT = {}))[_.IDEMPOTENCY_UNKNOWN = 0] = "IDEMPOTENCY_UNKNOWN", _[_.NO_SIDE_EFFECTS = 1] = "NO_SIDE_EFFECTS", _[_.IDEMPOTENT = 2] = "IDEMPOTENT", (E = eI || (eI = {}))[E.DEFAULT_SYMBOL_VISIBILITY_UNKNOWN = 0] = "DEFAULT_SYMBOL_VISIBILITY_UNKNOWN", E[E.EXPORT_ALL = 1] = "EXPORT_ALL", E[E.EXPORT_TOP_LEVEL = 2] = "EXPORT_TOP_LEVEL", E[E.LOCAL_ALL = 3] = "LOCAL_ALL", E[E.STRICT = 4] = "STRICT", (S = eN || (eN = {}))[S.FIELD_PRESENCE_UNKNOWN = 0] = "FIELD_PRESENCE_UNKNOWN", S[S.EXPLICIT = 1] = "EXPLICIT", S[S.IMPLICIT = 2] = "IMPLICIT", S[S.LEGACY_REQUIRED = 3] = "LEGACY_REQUIRED", (w = eA || (eA = {}))[w.ENUM_TYPE_UNKNOWN = 0] = "ENUM_TYPE_UNKNOWN", w[w.OPEN = 1] = "OPEN", w[w.CLOSED = 2] = "CLOSED", (T = ek || (ek = {}))[T.REPEATED_FIELD_ENCODING_UNKNOWN = 0] = "REPEATED_FIELD_ENCODING_UNKNOWN", T[T.PACKED = 1] = "PACKED", T[T.EXPANDED = 2] = "EXPANDED", (I = ex || (ex = {}))[I.UTF8_VALIDATION_UNKNOWN = 0] = "UTF8_VALIDATION_UNKNOWN", I[I.VERIFY = 2] = "VERIFY", I[I.NONE = 3] = "NONE", (N = eR || (eR = {}))[N.MESSAGE_ENCODING_UNKNOWN = 0] = "MESSAGE_ENCODING_UNKNOWN", N[N.LENGTH_PREFIXED = 1] = "LENGTH_PREFIXED", N[N.DELIMITED = 2] = "DELIMITED", (A = eO || (eO = {}))[A.JSON_FORMAT_UNKNOWN = 0] = "JSON_FORMAT_UNKNOWN", A[A.ALLOW = 1] = "ALLOW", A[A.LEGACY_BEST_EFFORT = 2] = "LEGACY_BEST_EFFORT", (k = eV || (eV = {}))[k.ENFORCE_NAMING_STYLE_UNKNOWN = 0] = "ENFORCE_NAMING_STYLE_UNKNOWN", k[k.STYLE2024 = 1] = "STYLE2024", k[k.STYLE_LEGACY = 2] = "STYLE_LEGACY", (x = eC || (eC = {}))[x.NONE = 0] = "NONE", x[x.SET = 1] = "SET", x[x.ALIAS = 2] = "ALIAS", (R = eZ || (eZ = {}))[R.EDITION_UNKNOWN = 0] = "EDITION_UNKNOWN", R[R.EDITION_LEGACY = 900] = "EDITION_LEGACY", R[R.EDITION_PROTO2 = 998] = "EDITION_PROTO2", R[R.EDITION_PROTO3 = 999] = "EDITION_PROTO3", R[R.EDITION_2023 = 1e3] = "EDITION_2023", R[R.EDITION_2024 = 1001] = "EDITION_2024", R[R.EDITION_UNSTABLE = 9999] = "EDITION_UNSTABLE", R[R.EDITION_1_TEST_ONLY = 1] = "EDITION_1_TEST_ONLY", R[R.EDITION_2_TEST_ONLY = 2] = "EDITION_2_TEST_ONLY", R[R.EDITION_99997_TEST_ONLY = 99997] = "EDITION_99997_TEST_ONLY", R[R.EDITION_99998_TEST_ONLY = 99998] = "EDITION_99998_TEST_ONLY", R[R.EDITION_99999_TEST_ONLY = 99999] = "EDITION_99999_TEST_ONLY", R[R.EDITION_MAX = 0x7fffffff] = "EDITION_MAX", (O = eB || (eB = {}))[O.VISIBILITY_UNSET = 0] = "VISIBILITY_UNSET", O[O.VISIBILITY_LOCAL = 1] = "VISIBILITY_LOCAL", O[O.VISIBILITY_EXPORT = 2] = "VISIBILITY_EXPORT";
            var lY = function(e) {
                function t(e, n) {
                    var r, a = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "FieldValueInvalidError";
                    return e1(this, t), (r = r5(this, t, [n])).name = a, r.field = function() {
                        return e
                    }, r
                }
                return r8(t, e), t
            }(uo(Error));

            function lG(e) {
                return null !== e && (void 0 === e ? "undefined" : (0, e8._)(e)) == "object" && !Array.isArray(e)
            }

            function lj(e, t) {
                var n, r, a, i;
                if (lG(e) && lg in e && "add" in e && "field" in e && "function" == typeof e.field) {
                    if (void 0 !== t) {
                        var o = e.field();
                        return t.listKind == o.listKind && t.scalar === o.scalar && (null == (n = t.message) ? void 0 : n.typeName) === (null == (r = o.message) ? void 0 : r.typeName) && (null == (a = t.enum) ? void 0 : a.typeName) === (null == (i = o.enum) ? void 0 : i.typeName)
                    }
                    return !0
                }
                return !1
            }

            function lM(e, t) {
                var n, r, a, i;
                if (lG(e) && lg in e && "has" in e && "field" in e && "function" == typeof e.field) {
                    if (void 0 !== t) {
                        var o = e.field();
                        return t.mapKey === o.mapKey && t.mapKind == o.mapKind && t.scalar === o.scalar && (null == (n = t.message) ? void 0 : n.typeName) === (null == (r = o.message) ? void 0 : r.typeName) && (null == (a = t.enum) ? void 0 : a.typeName) === (null == (i = o.enum) ? void 0 : i.typeName)
                    }
                    return !0
                }
                return !1
            }

            function lz(e, t) {
                return lG(e) && lg in e && "desc" in e && lG(e.desc) && "message" === e.desc.kind && (void 0 === t || e.desc.typeName == t.typeName)
            }
            var lJ = Symbol.for("@bufbuild/protobuf/text-encoding");

            function lK() {
                if (void 0 == globalThis[lJ]) {
                    var e, t = new globalThis.TextEncoder,
                        n = new globalThis.TextDecoder;
                    globalThis[lJ] = {
                        encodeUtf8: function(e) {
                            return t.encode(e)
                        },
                        decodeUtf8: function(t, r) {
                            return r ? (void 0 === e && (e = new globalThis.TextDecoder("utf-8", {
                                fatal: !0
                            })), e.decode(t)) : n.decode(t)
                        },
                        checkUtf8: function(e) {
                            try {
                                return encodeURIComponent(e), !0
                            } catch (e) {
                                return !1
                            }
                        }
                    }
                }
                return globalThis[lJ]
            }(V = eL || (eL = {}))[V.Varint = 0] = "Varint", V[V.Bit64 = 1] = "Bit64", V[V.LengthDelimited = 2] = "LengthDelimited", V[V.StartGroup = 3] = "StartGroup", V[V.EndGroup = 4] = "EndGroup", V[V.Bit32 = 5] = "Bit32";
            var lH = function() {
                    function e() {
                        var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : lK().encodeUtf8;
                        e1(this, e), this.encodeUtf8 = t, this.stack = [], this.chunks = [], this.buf = []
                    }
                    return e3(e, [{
                        key: "finish",
                        value: function() {
                            this.buf.length && (this.chunks.push(new Uint8Array(this.buf)), this.buf = []);
                            for (var e = 0, t = 0; t < this.chunks.length; t++) e += this.chunks[t].length;
                            for (var n = new Uint8Array(e), r = 0, a = 0; a < this.chunks.length; a++) n.set(this.chunks[a], r), r += this.chunks[a].length;
                            return this.chunks = [], n
                        }
                    }, {
                        key: "fork",
                        value: function() {
                            return this.stack.push({
                                chunks: this.chunks,
                                buf: this.buf
                            }), this.chunks = [], this.buf = [], this
                        }
                    }, {
                        key: "join",
                        value: function() {
                            var e = this.finish(),
                                t = this.stack.pop();
                            if (!t) throw Error("invalid state, fork stack empty");
                            return this.chunks = t.chunks, this.buf = t.buf, this.uint32(e.byteLength), this.raw(e)
                        }
                    }, {
                        key: "tag",
                        value: function(e, t) {
                            return this.uint32((e << 3 | t) >>> 0)
                        }
                    }, {
                        key: "raw",
                        value: function(e) {
                            return this.buf.length && (this.chunks.push(new Uint8Array(this.buf)), this.buf = []), this.chunks.push(e), this
                        }
                    }, {
                        key: "uint32",
                        value: function(e) {
                            for (l$(e); e > 127;) this.buf.push(127 & e | 128), e >>>= 7;
                            return this.buf.push(e), this
                        }
                    }, {
                        key: "int32",
                        value: function(e) {
                            return lq(e), lc(e, this.buf), this
                        }
                    }, {
                        key: "bool",
                        value: function(e) {
                            return this.buf.push(+!!e), this
                        }
                    }, {
                        key: "bytes",
                        value: function(e) {
                            return this.uint32(e.byteLength), this.raw(e)
                        }
                    }, {
                        key: "string",
                        value: function(e) {
                            var t = this.encodeUtf8(e);
                            return this.uint32(t.byteLength), this.raw(t)
                        }
                    }, {
                        key: "float",
                        value: function(e) {
                            var t = e;
                            if ("string" == typeof t) {
                                var n = t;
                                if (Number.isNaN(t = Number(t)) && "NaN" !== n) throw Error("invalid float32: " + n)
                            } else if ("number" != typeof t) throw Error("invalid float32: " + (void 0 === t ? "undefined" : (0, e8._)(t)));
                            if (Number.isFinite(t) && (t > 34028234663852886e22 || t < -34028234663852886e22)) throw Error("invalid float32: " + t);
                            var r = new Uint8Array(4);
                            return new DataView(r.buffer).setFloat32(0, e, !0), this.raw(r)
                        }
                    }, {
                        key: "double",
                        value: function(e) {
                            var t = new Uint8Array(8);
                            return new DataView(t.buffer).setFloat64(0, e, !0), this.raw(t)
                        }
                    }, {
                        key: "fixed32",
                        value: function(e) {
                            l$(e);
                            var t = new Uint8Array(4);
                            return new DataView(t.buffer).setUint32(0, e, !0), this.raw(t)
                        }
                    }, {
                        key: "sfixed32",
                        value: function(e) {
                            lq(e);
                            var t = new Uint8Array(4);
                            return new DataView(t.buffer).setInt32(0, e, !0), this.raw(t)
                        }
                    }, {
                        key: "sint32",
                        value: function(e) {
                            return lq(e), lc(e = (e << 1 ^ e >> 31) >>> 0, this.buf), this
                        }
                    }, {
                        key: "sfixed64",
                        value: function(e) {
                            var t = new Uint8Array(8),
                                n = new DataView(t.buffer),
                                r = lp.enc(e);
                            return n.setInt32(0, r.lo, !0), n.setInt32(4, r.hi, !0), this.raw(t)
                        }
                    }, {
                        key: "fixed64",
                        value: function(e) {
                            var t = new Uint8Array(8),
                                n = new DataView(t.buffer),
                                r = lp.uEnc(e);
                            return n.setInt32(0, r.lo, !0), n.setInt32(4, r.hi, !0), this.raw(t)
                        }
                    }, {
                        key: "int64",
                        value: function(e) {
                            var t = lp.enc(e);
                            return la(t.lo, t.hi, this.buf), this
                        }
                    }, {
                        key: "sint64",
                        value: function(e) {
                            var t = lp.enc(e),
                                n = t.hi >> 31;
                            return la(t.lo << 1 ^ n, (t.hi << 1 | t.lo >>> 31) ^ n, this.buf), this
                        }
                    }, {
                        key: "uint64",
                        value: function(e) {
                            var t = lp.uEnc(e);
                            return la(t.lo, t.hi, this.buf), this
                        }
                    }]), e
                }(),
                lQ = function() {
                    function e(t) {
                        var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : lK().decodeUtf8;
                        e1(this, e), this.decodeUtf8 = n, this.varint64 = lr, this.uint32 = lf, this.buf = t, this.len = t.length, this.pos = 0, this.view = new DataView(t.buffer, t.byteOffset, t.byteLength)
                    }
                    return e3(e, [{
                        key: "tag",
                        value: function() {
                            var e = this.pos,
                                t = this.uint32(),
                                n = this.pos - e;
                            if (n > 5 || 5 == n && this.buf[this.pos - 1] > 15) throw Error("illegal tag: varint overflows uint32");
                            var r = t >>> 3,
                                a = 7 & t;
                            if (r <= 0 || a > 5) throw Error("illegal tag: field no " + r + " wire type " + a);
                            return [r, a]
                        }
                    }, {
                        key: "skip",
                        value: function(e, t) {
                            var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 100,
                                r = this.pos;
                            switch (e) {
                                case eL.Varint:
                                    for (; 128 & this.buf[this.pos++];);
                                    break;
                                case eL.Bit64:
                                    this.pos += 4;
                                case eL.Bit32:
                                    this.pos += 4;
                                    break;
                                case eL.LengthDelimited:
                                    var a = this.uint32();
                                    this.pos += a;
                                    break;
                                case eL.StartGroup:
                                    if (n <= 0) throw Error("maximum recursion depth reached");
                                    for (;;) {
                                        var i = eK(this.tag(), 2),
                                            o = i[0],
                                            u = i[1];
                                        if (u === eL.EndGroup) {
                                            if (void 0 !== t && o !== t) throw Error("invalid end group tag");
                                            break
                                        }
                                        this.skip(u, o, n - 1)
                                    }
                                    break;
                                default:
                                    throw Error("cant skip wire type " + e)
                            }
                            return this.assertBounds(), this.buf.subarray(r, this.pos)
                        }
                    }, {
                        key: "assertBounds",
                        value: function() {
                            if (this.pos > this.len) throw RangeError("premature EOF")
                        }
                    }, {
                        key: "int32",
                        value: function() {
                            return 0 | this.uint32()
                        }
                    }, {
                        key: "sint32",
                        value: function() {
                            var e = this.uint32();
                            return e >>> 1 ^ -(1 & e)
                        }
                    }, {
                        key: "int64",
                        value: function() {
                            return lp.dec.apply(lp, e9(this.varint64()))
                        }
                    }, {
                        key: "uint64",
                        value: function() {
                            return lp.uDec.apply(lp, e9(this.varint64()))
                        }
                    }, {
                        key: "sint64",
                        value: function() {
                            var e = eK(this.varint64(), 2),
                                t = e[0],
                                n = e[1],
                                r = -(1 & t);
                            return t = (t >>> 1 | (1 & n) << 31) ^ r, n = n >>> 1 ^ r, lp.dec(t, n)
                        }
                    }, {
                        key: "bool",
                        value: function() {
                            var e = eK(this.varint64(), 2),
                                t = e[0],
                                n = e[1];
                            return 0 !== t || 0 !== n
                        }
                    }, {
                        key: "fixed32",
                        value: function() {
                            return this.view.getUint32((this.pos += 4) - 4, !0)
                        }
                    }, {
                        key: "sfixed32",
                        value: function() {
                            return this.view.getInt32((this.pos += 4) - 4, !0)
                        }
                    }, {
                        key: "fixed64",
                        value: function() {
                            return lp.uDec(this.sfixed32(), this.sfixed32())
                        }
                    }, {
                        key: "sfixed64",
                        value: function() {
                            return lp.dec(this.sfixed32(), this.sfixed32())
                        }
                    }, {
                        key: "float",
                        value: function() {
                            return this.view.getFloat32((this.pos += 4) - 4, !0)
                        }
                    }, {
                        key: "double",
                        value: function() {
                            return this.view.getFloat64((this.pos += 8) - 8, !0)
                        }
                    }, {
                        key: "bytes",
                        value: function() {
                            var e = this.uint32(),
                                t = this.pos;
                            return this.pos += e, this.assertBounds(), this.buf.subarray(t, t + e)
                        }
                    }, {
                        key: "string",
                        value: function(e) {
                            return this.decodeUtf8(this.bytes(), e)
                        }
                    }]), e
                }();

            function lq(e) {
                if ("string" == typeof e) e = Number(e);
                else if ("number" != typeof e) throw Error("invalid int32: " + (void 0 === e ? "undefined" : (0, e8._)(e)));
                if (!Number.isInteger(e) || e > 0x7fffffff || e < -0x80000000) throw Error("invalid int32: " + e)
            }

            function l$(e) {
                if ("string" == typeof e) e = Number(e);
                else if ("number" != typeof e) throw Error("invalid uint32: " + (void 0 === e ? "undefined" : (0, e8._)(e)));
                if (!Number.isInteger(e) || e > 0xffffffff || e < 0) throw Error("invalid uint32: " + e)
            }

            function l0(e, t, n) {
                var r = l1(e, n);
                if (!0 !== r) return new lY(e, "list item #".concat(t + 1, ": ").concat(l3(e, n, r)))
            }

            function l1(e, t) {
                return void 0 !== e.scalar ? l2(t, e.scalar) : void 0 !== e.enum ? e.enum.open ? l2(t, em.INT32) : e.enum.values.some(function(e) {
                    return e.number === t
                }) : lz(t, e.message)
            }

            function l2(e, t) {
                switch (t) {
                    case em.DOUBLE:
                        return "number" == typeof e;
                    case em.FLOAT:
                        if ("number" != typeof e) return !1;
                        if (Number.isNaN(e) || !Number.isFinite(e)) return !0;
                        if (e > 34028234663852886e22 || e < -34028234663852886e22) return "".concat(e.toFixed(), " out of range");
                        return !0;
                    case em.INT32:
                    case em.SFIXED32:
                    case em.SINT32:
                        if ("number" != typeof e || !Number.isInteger(e)) return !1;
                        if (e > 0x7fffffff || e < -0x80000000) return "".concat(e.toFixed(), " out of range");
                        return !0;
                    case em.FIXED32:
                    case em.UINT32:
                        if ("number" != typeof e || !Number.isInteger(e)) return !1;
                        if (e > 0xffffffff || e < 0) return "".concat(e.toFixed(), " out of range");
                        return !0;
                    case em.BOOL:
                        return "boolean" == typeof e;
                    case em.STRING:
                        if ("string" != typeof e) return !1;
                        return lK().checkUtf8(e) || "invalid UTF8";
                    case em.BYTES:
                        return (0, eW._)(e, Uint8Array);
                    case em.INT64:
                    case em.SFIXED64:
                    case em.SINT64:
                        if ((void 0 === e ? "undefined" : (0, e8._)(e)) == "bigint" || "number" == typeof e || "string" == typeof e && e.length > 0) try {
                            return lp.parse(e), !0
                        } catch (t) {
                            return "".concat(e, " out of range")
                        }
                        return !1;
                    case em.FIXED64:
                    case em.UINT64:
                        if ((void 0 === e ? "undefined" : (0, e8._)(e)) == "bigint" || "number" == typeof e || "string" == typeof e && e.length > 0) try {
                            return lp.uParse(e), !0
                        } catch (t) {
                            return "".concat(e, " out of range")
                        }
                        return !1
                }
            }

            function l3(e, t, n) {
                return (n = "string" == typeof n ? ": ".concat(n) : ", got ".concat(l5(t)), void 0 !== e.scalar) ? "expected ".concat(function(e) {
                    switch (e) {
                        case em.STRING:
                            return "string";
                        case em.BOOL:
                            return "boolean";
                        case em.INT64:
                        case em.SINT64:
                        case em.SFIXED64:
                            return "bigint (int64)";
                        case em.UINT64:
                        case em.FIXED64:
                            return "bigint (uint64)";
                        case em.BYTES:
                            return "Uint8Array";
                        case em.DOUBLE:
                            return "number (float64)";
                        case em.FLOAT:
                            return "number (float32)";
                        case em.FIXED32:
                        case em.UINT32:
                            return "number (uint32)";
                        case em.INT32:
                        case em.SFIXED32:
                        case em.SINT32:
                            return "number (int32)"
                    }
                }(e.scalar)) + n : void 0 !== e.enum ? "expected ".concat(e.enum.toString()) + n : "expected ".concat(l9(e.message)) + n
            }

            function l5(e) {
                switch (void 0 === e ? "undefined" : (0, e8._)(e)) {
                    case "object":
                        if (null === e) return "null";
                        if ((0, eW._)(e, Uint8Array)) return "Uint8Array(".concat(e.length, ")");
                        if (Array.isArray(e)) return "Array(".concat(e.length, ")");
                        if (lj(e)) return l4(e.field());
                        if (lM(e)) return l8(e.field());
                        if (lz(e)) return l9(e.desc);
                        if (lD(e)) return "message ".concat(e.$typeName);
                        return "object";
                    case "string":
                        return e.length > 30 ? "string" : '"'.concat(e.split('"').join('\\"'), '"');
                    case "boolean":
                    case "number":
                        return String(e);
                    case "bigint":
                        return String(e) + "n";
                    default:
                        return void 0 === e ? "undefined" : (0, e8._)(e)
                }
            }

            function l9(e) {
                return "ReflectMessage (".concat(e.typeName, ")")
            }

            function l4(e) {
                switch (e.listKind) {
                    case "message":
                        return "ReflectList (".concat(e.message.toString(), ")");
                    case "enum":
                        return "ReflectList (".concat(e.enum.toString(), ")");
                    case "scalar":
                        return "ReflectList (".concat(em[e.scalar], ")")
                }
            }

            function l8(e) {
                switch (e.mapKind) {
                    case "message":
                        return "ReflectMap (".concat(em[e.mapKey], ", ").concat(e.message.toString(), ")");
                    case "enum":
                        return "ReflectMap (".concat(em[e.mapKey], ", ").concat(e.enum.toString(), ")");
                    case "scalar":
                        return "ReflectMap (".concat(em[e.mapKey], ", ").concat(em[e.scalar], ")")
                }
            }

            function l6(e) {
                var t = e.fields[0];
                return l7(e.typeName) && void 0 !== t && "scalar" == t.fieldKind && "value" == t.name && 1 == t.number
            }

            function l7(e) {
                return e.startsWith("google.protobuf.") && ["DoubleValue", "FloatValue", "Int64Value", "UInt64Value", "Int32Value", "UInt32Value", "BoolValue", "StringValue", "BytesValue"].includes(e.substring(16))
            }

            function ce(e, t) {
                if (lD(t, e)) return t;
                var n = function(e) {
                    var t;
                    if (function(e) {
                            switch (e.file.edition) {
                                case 999:
                                    return !1;
                                case 998:
                                    return !0;
                                default:
                                    return e.fields.some(function(e) {
                                        return 2 != e.presence && "message" != e.fieldKind && !e.oneof
                                    })
                            }
                        }(e)) {
                        var n = co.get(e);
                        if (n) o = n.prototype, u = n.members;
                        else {
                            o = {}, u = new Set;
                            var r = !0,
                                a = !1,
                                i = void 0;
                            try {
                                for (var o, u, s, l = e.members[Symbol.iterator](); !(r = (s = l.next()).done); r = !0) {
                                    var c = s.value;
                                    "oneof" != c.kind && ("scalar" == c.fieldKind || "enum" == c.fieldKind) && 2 != c.presence && (u.add(c), o[c.localName] = cu(c))
                                }
                            } catch (e) {
                                a = !0, i = e
                            } finally {
                                try {
                                    r || null == l.return || l.return()
                                } finally {
                                    if (a) throw i
                                }
                            }
                            co.set(e, {
                                prototype: o,
                                members: u
                            })
                        }(t = Object.create(o)).$typeName = e.typeName;
                        var f = !0,
                            d = !1,
                            p = void 0;
                        try {
                            for (var v, m = e.members[Symbol.iterator](); !(f = (v = m.next()).done); f = !0) {
                                var h = v.value;
                                if (!u.has(h)) {
                                    if ("field" == h.kind && ("message" == h.fieldKind || ("scalar" == h.fieldKind || "enum" == h.fieldKind) && 2 != h.presence)) continue;
                                    t[h.localName] = cu(h)
                                }
                            }
                        } catch (e) {
                            d = !0, p = e
                        } finally {
                            try {
                                f || null == m.return || m.return()
                            } finally {
                                if (d) throw p
                            }
                        }
                    } else {
                        t = {
                            $typeName: e.typeName
                        };
                        var g = !0,
                            y = !1,
                            b = void 0;
                        try {
                            for (var _, E = e.members[Symbol.iterator](); !(g = (_ = E.next()).done); g = !0) {
                                var S = _.value;
                                ("oneof" == S.kind || 2 == S.presence) && (t[S.localName] = cu(S))
                            }
                        } catch (e) {
                            y = !0, b = e
                        } finally {
                            try {
                                g || null == E.return || E.return()
                            } finally {
                                if (y) throw b
                            }
                        }
                    }
                    return t
                }(e);
                return void 0 !== t && function(e, t, n) {
                    var r = !0,
                        a = !1,
                        i = void 0;
                    try {
                        for (var o, u = e.members[Symbol.iterator](); !(r = (o = u.next()).done); r = !0) {
                            var s = o.value,
                                l = n[s.localName];
                            if (null != l) {
                                var c = void 0;
                                if ("oneof" == s.kind) {
                                    var f = ly(n, s);
                                    if (!f) continue;
                                    c = f, l = l_(n, f)
                                } else c = s;
                                switch (c.fieldKind) {
                                    case "message":
                                        l = cn(c, l);
                                        break;
                                    case "scalar":
                                        l = ct(c, l);
                                        break;
                                    case "list":
                                        l = function(e, t) {
                                            if (Array.isArray(t)) {
                                                if (e.scalar == em.BYTES) return t.map(cr);
                                                if ("message" == e.listKind) return t.map(function(t) {
                                                    return cn(e, t)
                                                })
                                            }
                                            return t
                                        }(c, l);
                                        break;
                                    case "map":
                                        l = function(e, t) {
                                            if (lG(t)) {
                                                if (e.scalar == em.BYTES) return ca(t, cr);
                                                if ("message" == e.mapKind) return ca(t, function(t) {
                                                    return cn(e, t)
                                                })
                                            }
                                            return t
                                        }(c, l)
                                }
                                lE(t, c, l)
                            }
                        }
                    } catch (e) {
                        a = !0, i = e
                    } finally {
                        try {
                            r || null == u.return || u.return()
                        } finally {
                            if (a) throw i
                        }
                    }
                }(e, n, t), n
            }

            function ct(e, t) {
                return e.scalar == em.BYTES ? cr(t) : t
            }

            function cn(e, t) {
                if ("message" == e.fieldKind && !e.oneof && l6(e.message)) return ct(e.message.fields[0], t);
                if (lG(t)) {
                    if ("google.protobuf.Struct" == e.message.typeName && "google.protobuf.Value" !== e.parent.typeName) return t;
                    if (!lD(t, e.message)) return ce(e.message, t)
                }
                return t
            }

            function cr(e) {
                return Array.isArray(e) ? new Uint8Array(e) : e
            }

            function ca(e, t) {
                var n = {},
                    r = !0,
                    a = !1,
                    i = void 0;
                try {
                    for (var o, u = Object.entries(e)[Symbol.iterator](); !(r = (o = u.next()).done); r = !0) {
                        var s = o.value;
                        n[s[0]] = t(s[1])
                    }
                } catch (e) {
                    a = !0, i = e
                } finally {
                    try {
                        r || null == u.return || u.return()
                    } finally {
                        if (a) throw i
                    }
                }
                return n
            }
            var ci = Symbol(),
                co = new WeakMap;

            function cu(e) {
                if ("oneof" == e.kind) return {
                    case: void 0
                };
                if ("list" == e.fieldKind) return [];
                if ("map" == e.fieldKind) return {};
                if ("message" == e.fieldKind) return ci;
                var t = e.getDefaultValue();
                return void 0 !== t ? "scalar" == e.fieldKind && e.longAsString ? t.toString() : t : "scalar" == e.fieldKind ? lh(e.scalar, e.longAsString) : e.enum.values[0].number
            }

            function cs(e, t) {
                var n = !(arguments.length > 2) || void 0 === arguments[2] || arguments[2];
                return new cc(e, t, n)
            }
            var cl = new WeakMap,
                cc = function() {
                    function e(t, n) {
                        var r = !(arguments.length > 2) || void 0 === arguments[2] || arguments[2];
                        e1(this, e), this.lists = new Map, this.maps = new Map, this.check = r, this.desc = t, this.message = this[lg] = null != n ? n : ce(t), this.fields = t.fields, this.oneofs = t.oneofs, this.members = t.members
                    }
                    return e3(e, [{
                        key: "sortedFields",
                        get: function() {
                            var e = cl.get(this.desc);
                            if (e) return e;
                            var t = this.desc.fields.concat().sort(function(e, t) {
                                return e.number - t.number
                            });
                            return cl.set(this.desc, t), t
                        }
                    }, {
                        key: "findNumber",
                        value: function(e) {
                            return this._fieldsByNumber || (this._fieldsByNumber = new Map(this.desc.fields.map(function(e) {
                                return [e.number, e]
                            }))), this._fieldsByNumber.get(e)
                        }
                    }, {
                        key: "oneofCase",
                        value: function(e) {
                            return cf(this.message, e), ly(this.message, e)
                        }
                    }, {
                        key: "isSet",
                        value: function(e) {
                            cf(this.message, e);
                            var t = this.message,
                                n = e.localName;
                            if (e.oneof) return t[e.oneof.localName].case === n;
                            if (2 != e.presence) return void 0 !== t[n] && Object.prototype.hasOwnProperty.call(t, n);
                            switch (e.fieldKind) {
                                case "list":
                                    return t[n].length > 0;
                                case "map":
                                    return Object.keys(t[n]).length > 0;
                                case "scalar":
                                    return ! function(e, t) {
                                        switch (e) {
                                            case em.BOOL:
                                                return !1 === t;
                                            case em.STRING:
                                                return "" === t;
                                            case em.BYTES:
                                                return (0, eW._)(t, Uint8Array) && !t.byteLength;
                                            case em.DOUBLE:
                                            case em.FLOAT:
                                                return Object.is(t, 0);
                                            default:
                                                return 0 == t
                                        }
                                    }(e.scalar, t[n]);
                                case "enum":
                                    return t[n] !== e.enum.values[0].number
                            }
                            throw Error("message field with implicit presence")
                        }
                    }, {
                        key: "clear",
                        value: function(e) {
                            cf(this.message, e);
                            var t = this.message,
                                n = e.localName;
                            if (e.oneof) {
                                var r = e.oneof.localName;
                                t[r].case === n && (t[r] = {
                                    case: void 0
                                })
                            } else if (2 != e.presence) delete t[n];
                            else switch (e.fieldKind) {
                                case "map":
                                    t[n] = {};
                                    break;
                                case "list":
                                    t[n] = [];
                                    break;
                                case "enum":
                                    t[n] = e.enum.values[0].number;
                                    break;
                                case "scalar":
                                    t[n] = lh(e.scalar, e.longAsString)
                            }
                        }
                    }, {
                        key: "get",
                        value: function(e) {
                            cf(this.message, e);
                            var t = l_(this.message, e);
                            switch (e.fieldKind) {
                                case "list":
                                    var n = this.lists.get(e);
                                    return n && n[lg] === t || this.lists.set(e, n = new cd(e, t, this.check)), n;
                                case "map":
                                    var r = this.maps.get(e);
                                    return r && r[lg] === t || this.maps.set(e, r = new cp(e, t, this.check)), r;
                                case "message":
                                    return cm(e, t, this.check);
                                case "scalar":
                                    return void 0 === t ? lh(e.scalar, !1) : cE(e, t);
                                case "enum":
                                    return null != t ? t : e.enum.values[0].number
                            }
                        }
                    }, {
                        key: "set",
                        value: function(e, t) {
                            if (cf(this.message, e), this.check) {
                                var n, r = function(e, t) {
                                    var n, r = "list" == e.fieldKind ? lj(t, e) : "map" == e.fieldKind ? lM(t, e) : l1(e, t);
                                    if (!0 !== r) {
                                        switch (e.fieldKind) {
                                            case "list":
                                                n = "expected ".concat(l4(e), ", got ").concat(l5(t));
                                                break;
                                            case "map":
                                                n = "expected ".concat(l8(e), ", got ").concat(l5(t));
                                                break;
                                            default:
                                                n = l3(e, t, r)
                                        }
                                        return new lY(e, n)
                                    }
                                }(e, t);
                                if (r) throw r
                            }
                            n = "message" == e.fieldKind ? cv(e, t) : lM(t) || lj(t) ? t[lg] : cS(e, t), lE(this.message, e, n)
                        }
                    }, {
                        key: "getUnknown",
                        value: function() {
                            return this.message.$unknown
                        }
                    }, {
                        key: "setUnknown",
                        value: function(e) {
                            this.message.$unknown = e
                        }
                    }]), e
                }();

            function cf(e, t) {
                if (t.parent.typeName !== e.$typeName) throw new lY(t, "cannot use ".concat(t.toString(), " with message ").concat(e.$typeName), "ForeignFieldError")
            }
            var cd = function() {
                    function e(t, n, r) {
                        e1(this, e), this._field = t, this._arr = this[lg] = n, this.check = r
                    }
                    return e3(e, [{
                        key: "field",
                        value: function() {
                            return this._field
                        }
                    }, {
                        key: "size",
                        get: function() {
                            return this._arr.length
                        }
                    }, {
                        key: "get",
                        value: function(e) {
                            var t = this._arr[e];
                            return void 0 === t ? void 0 : cg(this._field, t, this.check)
                        }
                    }, {
                        key: "set",
                        value: function(e, t) {
                            if (e < 0 || e >= this._arr.length) throw new lY(this._field, "list item #".concat(e + 1, ": out of range"));
                            if (this.check) {
                                var n = l0(this._field, e, t);
                                if (n) throw n
                            }
                            this._arr[e] = ch(this._field, t)
                        }
                    }, {
                        key: "add",
                        value: function(e) {
                            if (this.check) {
                                var t = l0(this._field, this._arr.length, e);
                                if (t) throw t
                            }
                            this._arr.push(ch(this._field, e))
                        }
                    }, {
                        key: "clear",
                        value: function() {
                            this._arr.splice(0, this._arr.length)
                        }
                    }, {
                        key: Symbol.iterator,
                        value: function() {
                            return this.values()
                        }
                    }, {
                        key: "keys",
                        value: function() {
                            return this._arr.keys()
                        }
                    }, {
                        key: "values",
                        value: function() {
                            var e, t, n, r, a, i, o;
                            return rA(this, function(u) {
                                switch (u.label) {
                                    case 0:
                                        e = !0, t = !1, n = void 0, u.label = 1;
                                    case 1:
                                        u.trys.push([1, 6, 7, 8]), r = this._arr[Symbol.iterator](), u.label = 2;
                                    case 2:
                                        if (e = (a = r.next()).done) return [3, 5];
                                        return i = a.value, [4, cg(this._field, i, this.check)];
                                    case 3:
                                        u.sent(), u.label = 4;
                                    case 4:
                                        return e = !0, [3, 2];
                                    case 5:
                                        return [3, 8];
                                    case 6:
                                        return o = u.sent(), t = !0, n = o, [3, 8];
                                    case 7:
                                        try {
                                            e || null == r.return || r.return()
                                        } finally {
                                            if (t) throw n
                                        }
                                        return [7];
                                    case 8:
                                        return [2]
                                }
                            })
                        }
                    }, {
                        key: "entries",
                        value: function() {
                            var e;
                            return rA(this, function(t) {
                                switch (t.label) {
                                    case 0:
                                        e = 0, t.label = 1;
                                    case 1:
                                        if (!(e < this._arr.length)) return [3, 4];
                                        return [4, [e, cg(this._field, this._arr[e], this.check)]];
                                    case 2:
                                        t.sent(), t.label = 3;
                                    case 3:
                                        return e++, [3, 1];
                                    case 4:
                                        return [2]
                                }
                            })
                        }
                    }]), e
                }(),
                cp = function() {
                    function e(t, n) {
                        var r = !(arguments.length > 2) || void 0 === arguments[2] || arguments[2];
                        e1(this, e), this.obj = this[lg] = null != n ? n : {}, this.check = r, this._field = t
                    }
                    return e3(e, [{
                        key: "field",
                        value: function() {
                            return this._field
                        }
                    }, {
                        key: "set",
                        value: function(e, t) {
                            if (this.check) {
                                var n, r, a = function(e, t, n) {
                                    var r = l2(t, e.mapKey);
                                    if (!0 !== r) return new lY(e, "invalid map key: ".concat(l3({
                                        scalar: e.mapKey
                                    }, t, r)));
                                    var a = l1(e, n);
                                    if (!0 !== a) return new lY(e, "map entry ".concat(l5(t), ": ").concat(l3(e, n, a)))
                                }(this._field, e, t);
                                if (a) throw a
                            }
                            return this.obj[cb(e)] = (n = this._field, r = t, "message" == n.mapKind ? cv(n, r) : cS(n, r)), this
                        }
                    }, {
                        key: "delete",
                        value: function(e) {
                            var t = cb(e),
                                n = Object.prototype.hasOwnProperty.call(this.obj, t);
                            return n && delete this.obj[t], n
                        }
                    }, {
                        key: "clear",
                        value: function() {
                            var e = !0,
                                t = !1,
                                n = void 0;
                            try {
                                for (var r, a = Object.keys(this.obj)[Symbol.iterator](); !(e = (r = a.next()).done); e = !0) {
                                    var i = r.value;
                                    delete this.obj[i]
                                }
                            } catch (e) {
                                t = !0, n = e
                            } finally {
                                try {
                                    e || null == a.return || a.return()
                                } finally {
                                    if (t) throw n
                                }
                            }
                        }
                    }, {
                        key: "get",
                        value: function(e) {
                            var t = this.obj[cb(e)];
                            return void 0 !== t && (t = cy(this._field, t, this.check)), t
                        }
                    }, {
                        key: "has",
                        value: function(e) {
                            return Object.prototype.hasOwnProperty.call(this.obj, cb(e))
                        }
                    }, {
                        key: "keys",
                        value: function() {
                            var e, t, n, r, a, i;
                            return rA(this, function(o) {
                                switch (o.label) {
                                    case 0:
                                        e = !0, t = !1, n = void 0, o.label = 1;
                                    case 1:
                                        o.trys.push([1, 6, 7, 8]), r = Object.keys(this.obj)[Symbol.iterator](), o.label = 2;
                                    case 2:
                                        if (e = (a = r.next()).done) return [3, 5];
                                        return [4, c_(a.value, this._field.mapKey)];
                                    case 3:
                                        o.sent(), o.label = 4;
                                    case 4:
                                        return e = !0, [3, 2];
                                    case 5:
                                        return [3, 8];
                                    case 6:
                                        return i = o.sent(), t = !0, n = i, [3, 8];
                                    case 7:
                                        try {
                                            e || null == r.return || r.return()
                                        } finally {
                                            if (t) throw n
                                        }
                                        return [7];
                                    case 8:
                                        return [2]
                                }
                            })
                        }
                    }, {
                        key: "entries",
                        value: function() {
                            var e, t, n, r, a, i, o;
                            return rA(this, function(u) {
                                switch (u.label) {
                                    case 0:
                                        e = !0, t = !1, n = void 0, u.label = 1;
                                    case 1:
                                        u.trys.push([1, 6, 7, 8]), r = Object.entries(this.obj)[Symbol.iterator](), u.label = 2;
                                    case 2:
                                        if (e = (a = r.next()).done) return [3, 5];
                                        return [4, [c_((i = a.value)[0], this._field.mapKey), cy(this._field, i[1], this.check)]];
                                    case 3:
                                        u.sent(), u.label = 4;
                                    case 4:
                                        return e = !0, [3, 2];
                                    case 5:
                                        return [3, 8];
                                    case 6:
                                        return o = u.sent(), t = !0, n = o, [3, 8];
                                    case 7:
                                        try {
                                            e || null == r.return || r.return()
                                        } finally {
                                            if (t) throw n
                                        }
                                        return [7];
                                    case 8:
                                        return [2]
                                }
                            })
                        }
                    }, {
                        key: Symbol.iterator,
                        value: function() {
                            return this.entries()
                        }
                    }, {
                        key: "size",
                        get: function() {
                            return Object.keys(this.obj).length
                        }
                    }, {
                        key: "values",
                        value: function() {
                            var e, t, n, r, a, i, o;
                            return rA(this, function(u) {
                                switch (u.label) {
                                    case 0:
                                        e = !0, t = !1, n = void 0, u.label = 1;
                                    case 1:
                                        u.trys.push([1, 6, 7, 8]), r = Object.values(this.obj)[Symbol.iterator](), u.label = 2;
                                    case 2:
                                        if (e = (a = r.next()).done) return [3, 5];
                                        return i = a.value, [4, cy(this._field, i, this.check)];
                                    case 3:
                                        u.sent(), u.label = 4;
                                    case 4:
                                        return e = !0, [3, 2];
                                    case 5:
                                        return [3, 8];
                                    case 6:
                                        return o = u.sent(), t = !0, n = o, [3, 8];
                                    case 7:
                                        try {
                                            e || null == r.return || r.return()
                                        } finally {
                                            if (t) throw n
                                        }
                                        return [7];
                                    case 8:
                                        return [2]
                                }
                            })
                        }
                    }, {
                        key: "forEach",
                        value: function(e, t) {
                            var n = !0,
                                r = !1,
                                a = void 0;
                            try {
                                for (var i, o = this.entries()[Symbol.iterator](); !(n = (i = o.next()).done); n = !0) {
                                    var u = i.value;
                                    e.call(t, u[1], u[0], this)
                                }
                            } catch (e) {
                                r = !0, a = e
                            } finally {
                                try {
                                    n || null == o.return || o.return()
                                } finally {
                                    if (r) throw a
                                }
                            }
                        }
                    }]), e
                }();

            function cv(e, t) {
                return lz(t) ? l7(t.message.$typeName) && !e.oneof && "message" == e.fieldKind ? t.message.value : "google.protobuf.Struct" == t.desc.typeName && "google.protobuf.Value" != e.parent.typeName ? function e(t) {
                    var n = {},
                        r = !0,
                        a = !1,
                        i = void 0;
                    try {
                        for (var o, u = Object.entries(t.fields)[Symbol.iterator](); !(r = (o = u.next()).done); r = !0) {
                            var s = eK(o.value, 2),
                                l = s[0],
                                c = s[1];
                            n[l] = function t(n) {
                                switch (n.kind.case) {
                                    case "structValue":
                                        return e(n.kind.value);
                                    case "listValue":
                                        return n.kind.value.values.map(t);
                                    case "nullValue":
                                    case void 0:
                                        return null;
                                    default:
                                        return n.kind.value
                                }
                            }(c)
                        }
                    } catch (e) {
                        a = !0, i = e
                    } finally {
                        try {
                            r || null == u.return || u.return()
                        } finally {
                            if (a) throw i
                        }
                    }
                    return n
                }(t.message) : t.message : t
            }

            function cm(e, t, n) {
                return void 0 !== t && (l6(e.message) && !e.oneof && "message" == e.fieldKind ? t = {
                    $typeName: e.message.typeName,
                    value: cE(e.message.fields[0], t)
                } : "google.protobuf.Struct" == e.message.typeName && "google.protobuf.Value" != e.parent.typeName && lG(t) && (t = function e(t) {
                    var n = {
                        $typeName: "google.protobuf.Struct",
                        fields: {}
                    };
                    if (lG(t)) {
                        var r = !0,
                            a = !1,
                            i = void 0;
                        try {
                            for (var o, u = Object.entries(t)[Symbol.iterator](); !(r = (o = u.next()).done); r = !0) {
                                var s = eK(o.value, 2),
                                    l = s[0],
                                    c = s[1];
                                n.fields[l] = function t(n) {
                                    var r = {
                                        $typeName: "google.protobuf.Value",
                                        kind: {
                                            case: void 0
                                        }
                                    };
                                    switch (void 0 === n ? "undefined" : (0, e8._)(n)) {
                                        case "number":
                                            r.kind = {
                                                case: "numberValue",
                                                value: n
                                            };
                                            break;
                                        case "string":
                                            r.kind = {
                                                case: "stringValue",
                                                value: n
                                            };
                                            break;
                                        case "boolean":
                                            r.kind = {
                                                case: "boolValue",
                                                value: n
                                            };
                                            break;
                                        case "object":
                                            if (null === n) r.kind = {
                                                case: "nullValue",
                                                value: 0
                                            };
                                            else if (Array.isArray(n)) {
                                                var a = {
                                                    $typeName: "google.protobuf.ListValue",
                                                    values: []
                                                };
                                                if (Array.isArray(n)) {
                                                    var i = !0,
                                                        o = !1,
                                                        u = void 0;
                                                    try {
                                                        for (var s, l = n[Symbol.iterator](); !(i = (s = l.next()).done); i = !0) {
                                                            var c = s.value;
                                                            a.values.push(t(c))
                                                        }
                                                    } catch (e) {
                                                        o = !0, u = e
                                                    } finally {
                                                        try {
                                                            i || null == l.return || l.return()
                                                        } finally {
                                                            if (o) throw u
                                                        }
                                                    }
                                                }
                                                r.kind = {
                                                    case: "listValue",
                                                    value: a
                                                }
                                            } else r.kind = {
                                                case: "structValue",
                                                value: e(n)
                                            }
                                    }
                                    return r
                                }(c)
                            }
                        } catch (e) {
                            a = !0, i = e
                        } finally {
                            try {
                                r || null == u.return || u.return()
                            } finally {
                                if (a) throw i
                            }
                        }
                    }
                    return n
                }(t))), new cc(e.message, t, n)
            }

            function ch(e, t) {
                return "message" == e.listKind ? cv(e, t) : cS(e, t)
            }

            function cg(e, t, n) {
                return "message" == e.listKind ? cm(e, t, n) : cE(e, t)
            }

            function cy(e, t, n) {
                return "message" == e.mapKind ? cm(e, t, n) : t
            }

            function cb(e) {
                return "string" == typeof e || "number" == typeof e ? e : String(e)
            }

            function c_(e, t) {
                switch (t) {
                    case em.STRING:
                        break;
                    case em.INT32:
                    case em.FIXED32:
                    case em.UINT32:
                    case em.SFIXED32:
                    case em.SINT32:
                        var n = Number.parseInt(e);
                        if (Number.isFinite(n)) return n;
                        break;
                    case em.BOOL:
                        switch (e) {
                            case "true":
                                return !0;
                            case "false":
                                return !1
                        }
                        break;
                    case em.UINT64:
                    case em.FIXED64:
                        try {
                            return lp.uParse(e)
                        } catch (e) {}
                        break;
                    default:
                        try {
                            return lp.parse(e)
                        } catch (e) {}
                }
                return e
            }

            function cE(e, t) {
                switch (e.scalar) {
                    case em.INT64:
                    case em.SFIXED64:
                    case em.SINT64:
                        "longAsString" in e && e.longAsString && "string" == typeof t && (t = lp.parse(t));
                        break;
                    case em.FIXED64:
                    case em.UINT64:
                        "longAsString" in e && e.longAsString && "string" == typeof t && (t = lp.uParse(t))
                }
                return t
            }

            function cS(e, t) {
                switch (e.scalar) {
                    case em.INT64:
                    case em.SFIXED64:
                    case em.SINT64:
                        "longAsString" in e && e.longAsString ? t = String(t) : ("string" == typeof t || "number" == typeof t) && (t = lp.parse(t));
                        break;
                    case em.FIXED64:
                    case em.UINT64:
                        "longAsString" in e && e.longAsString ? t = String(t) : ("string" == typeof t || "number" == typeof t) && (t = lp.uParse(t))
                }
                return t
            }

            function cw(e, t, n, r, a) {
                if (++n.depth > n.recursionLimit) throw Error("cannot decode ".concat(e.desc, " from binary: maximum recursion depth of ").concat(n.recursionLimit, " reached"));
                for (var i = r ? t.len : t.pos + a, o = null != (u = e.getUnknown()) ? u : []; t.pos < i && (s = (c = eK(t.tag(), 2))[0], l = c[1], !r || l != eL.EndGroup);) {
                    var u, s, l, c, f = e.findNumber(s);
                    if (!f) {
                        var d = n.recursionLimit - n.depth,
                            p = t.skip(l, s, d);
                        n.readUnknownFields && o.push({
                            no: s,
                            wireType: l,
                            data: p
                        });
                        continue
                    }! function(e, t, n, r, a) {
                        var i;
                        switch (n.fieldKind) {
                            case "scalar":
                                e.set(n, cI(t, n.scalar, n.utf8Validation));
                                break;
                            case "enum":
                                var o = cI(t, em.INT32);
                                if (n.enum.open) e.set(n, o);
                                else if (n.enum.values.some(function(e) {
                                        return e.number === o
                                    })) e.set(n, o);
                                else if (a.readUnknownFields) {
                                    var u = [];
                                    lc(o, u);
                                    var s = null != (i = e.getUnknown()) ? i : [];
                                    s.push({
                                        no: n.number,
                                        wireType: r,
                                        data: new Uint8Array(u)
                                    }), e.setUnknown(s)
                                }
                                break;
                            case "message":
                                e.set(n, cT(t, a, n, e.get(n)));
                                break;
                            case "list":
                                ! function(e, t, n, r) {
                                    var a, i = n.field();
                                    if ("message" === i.listKind) return n.add(cT(e, r, i));
                                    var o = null != (a = i.scalar) ? a : em.INT32;
                                    if (t != eL.LengthDelimited || o == em.STRING || o == em.BYTES) return n.add(cI(e, o, i.utf8Validation));
                                    for (var u = e.uint32() + e.pos; e.pos < u;) n.add(cI(e, o, i.utf8Validation))
                                }(t, r, e.get(n), a);
                                break;
                            case "map":
                                ! function(e, t, n) {
                                    for (var r, a, i = t.field(), o = e.uint32(), u = e.pos + o; e.pos < u;) switch (eK(e.tag(), 1)[0]) {
                                        case 1:
                                            r = cI(e, i.mapKey, i.utf8Validation);
                                            break;
                                        case 2:
                                            switch (i.mapKind) {
                                                case "scalar":
                                                    a = cI(e, i.scalar, i.utf8Validation);
                                                    break;
                                                case "enum":
                                                    a = e.int32();
                                                    break;
                                                case "message":
                                                    a = cT(e, n, i)
                                            }
                                    }
                                    if (void 0 === r && (r = lh(i.mapKey, !1)), void 0 === a) switch (i.mapKind) {
                                        case "scalar":
                                            a = lh(i.scalar, !1);
                                            break;
                                        case "enum":
                                            a = i.enum.values[0].number;
                                            break;
                                        case "message":
                                            a = cs(i.message, void 0, !1)
                                    }
                                    t.set(r, a)
                                }(t, e.get(n), a)
                        }
                    }(e, t, f, l, n)
                }
                if (r && (l != eL.EndGroup || s !== a)) throw Error("invalid end group tag");
                o.length > 0 && e.setUnknown(o), n.depth--
            }

            function cT(e, t, n, r) {
                var a = n.delimitedEncoding,
                    i = null != r ? r : cs(n.message, void 0, !1);
                return cw(i, e, t, a, a ? n.number : e.uint32()), i
            }

            function cI(e, t) {
                var n = arguments.length > 2 && void 0 !== arguments[2] && arguments[2];
                switch (t) {
                    case em.STRING:
                        return e.string(n);
                    case em.BOOL:
                        return e.bool();
                    case em.DOUBLE:
                        return e.double();
                    case em.FLOAT:
                        return e.float();
                    case em.INT32:
                        return e.int32();
                    case em.INT64:
                        return e.int64();
                    case em.UINT64:
                        return e.uint64();
                    case em.FIXED64:
                        return e.fixed64();
                    case em.BYTES:
                        return e.bytes();
                    case em.FIXED32:
                        return e.fixed32();
                    case em.SFIXED32:
                        return e.sfixed32();
                    case em.SFIXED64:
                        return e.sfixed64();
                    case em.SINT64:
                        return e.sint64();
                    case em.UINT32:
                        return e.uint32();
                    case em.SINT32:
                        return e.sint32()
                }
            }

            function cN(e, t) {
                var n, r, a, i, o = (n = lW, r = function(e) {
                    var t = function() {
                            if (!ev) {
                                ev = [];
                                for (var e = (ep || (ep = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".split("")).slice(0, -2).concat("-", "_"), ep), t = 0; t < e.length; t++) ev[e[t].charCodeAt(0)] = t;
                                ev[45] = e.indexOf("+"), ev[95] = e.indexOf("/")
                            }
                            return ev
                        }(),
                        n = 3 * e.length / 4;
                    "=" == e[e.length - 2] ? n -= 2 : "=" == e[e.length - 1] && (n -= 1);
                    for (var r, a = new Uint8Array(n), i = 0, o = 0, u = 0, s = 0; s < e.length; s++) {
                        if (void 0 === (r = t[e.charCodeAt(s)])) switch (e[s]) {
                            case "=":
                                o = 0;
                            case "\n":
                            case "\r":
                            case "	":
                            case " ":
                                continue;
                            default:
                                throw Error("invalid base64 string")
                        }
                        switch (o) {
                            case 0:
                                u = r, o = 1;
                                break;
                            case 1:
                                a[i++] = u << 2 | (48 & r) >> 4, u = r, o = 2;
                                break;
                            case 2:
                                a[i++] = (15 & u) << 4 | (60 & r) >> 2, u = r, o = 3;
                                break;
                            case 3:
                                a[i++] = (3 & u) << 6 | r, o = 0
                        }
                    }
                    if (1 == o) throw Error("invalid base64 string");
                    return a.subarray(0, i)
                }(e), cw(a = cs(n, void 0, !1), new lQ(r), Object.assign(Object.assign({
                    readUnknownFields: !0,
                    recursionLimit: 100
                }, void 0), {
                    depth: 0
                }), !1, r.byteLength), a.message);
                return o.messageType.forEach(lS), o.dependency = null != (i = null == t ? void 0 : t.map(function(e) {
                    return e.proto.name
                })) ? i : [], lT(o, function(e) {
                    return null == t ? void 0 : t.find(function(t) {
                        return t.proto.name === e
                    })
                }).getFile(o.name)
            }
            var cA = cN("Ch9ldmVudC9ldmVudF9maWVsZF9vcHRpb25zLnByb3RvEgVldmVudCIlCgtKc29uT3B0aW9ucxIWCg5wYXJhbWV0ZXJfbmFtZRgBIAEoCSI6CgxGcm9zdE9wdGlvbnMSFAoMaXNfdHRsX2ZpZWxkGAEgASgIEhQKDGlzX3RpbWVzdGFtcBgCIAEoCCIjCgtTaW5rT3B0aW9ucxIUCgxpc19rZXlfZmllbGQYASABKAgiKQoQRXZlbnRNZXRhT3B0aW9ucxIVCg1pc19ldmVudF90aW1lGAEgASgIIskFCg5BdWdtZW50T3B0aW9ucxIcChRkZXJpdmVfdXNlcl9rZXlfZnJvbRgBIAEoCRIhChhhZGRfYWNjb3VudF9jb3VudHJ5X2NvZGUY7wcgASgIEhgKD2FkZF9hZ2VfYnJhY2tldBjrByABKAgSIAoXYWRkX2FwcGxpY2FibGVfcG9saWNpZXMY8QcgASgIEh0KFGFkZF9hcHBsaWNhdGlvbl9uYW1lGPcHIAEoCBIcChNhZGRfYXV0aF9zZXNzaW9uX2lkGPgHIAEoCBIiChlhZGRfYXV0aGVudGljYXRlZF91c2VyX2lkGOwHIAEoCBIjChphZGRfYXV0aGVudGljYXRlZF91c2VyX2tleRj1ByABKAgSHwoWYWRkX2Jyb3dzZXJfdHJhY2tlcl9pZBjqByABKAgSJQocYWRkX2Vudmlyb25tZW50X2FiYnJldmlhdGlvbhjwByABKAgSGQoQYWRkX2V2ZW50X3RhcmdldBjRDyABKAgSFwoOYWRkX2V2ZW50X3R5cGUY0g8gASgIEh0KFGFkZF9odHRwX2ZpbmdlcnByaW50GPkHIAEoCBIaChFhZGRfcGxhdGZvcm1fdHlwZRjpByABKAgSHQoUYWRkX3BsYXRmb3JtX3R5cGVfaWQY/AcgASgIEhAKB2FkZF9yY2MY9gcgASgIEiEKGGFkZF9yZXF1ZXN0X2NvdW50cnlfY29kZRjuByABKAgSFwoOYWRkX3JlcXVlc3RfaXAY7QcgASgIEiEKGGFkZF90ZW5jZW50X2FjY2Vzc190b2tlbhjzByABKAgSHAoTYWRkX3RlbmNlbnRfb3Blbl9pZBjyByABKAgSHAoTYWRkX3Rsc19maW5nZXJwcmludBj6ByABKAgSFwoOYWRkX3VzZXJfYWdlbnQY9AcgASgIEhgKD2FkZF91c2VyX29yaWdpbhj7ByABKAgiSgoKUElJT3B0aW9ucxISCgppc191c2VyX2lkGAEgASgIEhMKC2lzX3VzZXJfa2V5GAMgASgIEhMKC3BvbGljeV90YWdzGAIgAygJIkYKFENvbXBhdGliaWxpdHlPcHRpb25zEhcKD2lzX2V2ZW50X3RhcmdldBgBIAEoCBIVCg1pc19ldmVudF90eXBlGAIgASgIIk4KGkZyb3N0RmVhdHVyZUxvZ2dpbmdPcHRpb25zEhcKD3JlZ2lzdGVyZWRfbmFtZRgBIAEoCRIXCg9mZWF0dXJlX3NlcnZpY2UYAiABKAkiSAoaRnJvc3RGZWF0dXJlU2VydmljZU9wdGlvbnMSFAoMZmVhdHVyZV92aWV3GAEgASgJEhQKDGZlYXR1cmVfbmFtZRgCIAEoCTpMCgRtZXRhEh0uZ29vZ2xlLnByb3RvYnVmLkZpZWxkT3B0aW9ucxjhpxIgASgLMhcuZXZlbnQuRXZlbnRNZXRhT3B0aW9uc1IEbWV0YTpQCgdhdWdtZW50Eh0uZ29vZ2xlLnByb3RvYnVmLkZpZWxkT3B0aW9ucxjipxIgASgLMhUuZXZlbnQuQXVnbWVudE9wdGlvbnNSB2F1Z21lbnQ6RAoDcGlpEh0uZ29vZ2xlLnByb3RvYnVmLkZpZWxkT3B0aW9ucxjjpxIgASgLMhEuZXZlbnQuUElJT3B0aW9uc1IDcGlpOkcKBGpzb24SHS5nb29nbGUucHJvdG9idWYuRmllbGRPcHRpb25zGOSnEiABKAsyEi5ldmVudC5Kc29uT3B0aW9uc1IEanNvbjpHCgRzaW5rEh0uZ29vZ2xlLnByb3RvYnVmLkZpZWxkT3B0aW9ucxjlpxIgASgLMhIuZXZlbnQuU2lua09wdGlvbnNSBHNpbms6SgoFZnJvc3QSHS5nb29nbGUucHJvdG9idWYuRmllbGRPcHRpb25zGOanEiABKAsyEy5ldmVudC5Gcm9zdE9wdGlvbnNSBWZyb3N0OmIKDWNvbXBhdGliaWxpdHkSHS5nb29nbGUucHJvdG9idWYuRmllbGRPcHRpb25zGOenEiABKAsyGy5ldmVudC5Db21wYXRpYmlsaXR5T3B0aW9uc1INY29tcGF0aWJpbGl0eTp2ChVmcm9zdF9mZWF0dXJlX2xvZ2dpbmcSHS5nb29nbGUucHJvdG9idWYuRmllbGRPcHRpb25zGOinEiABKAsyIS5ldmVudC5Gcm9zdEZlYXR1cmVMb2dnaW5nT3B0aW9uc1ITZnJvc3RGZWF0dXJlTG9nZ2luZzp2ChVmcm9zdF9mZWF0dXJlX3NlcnZpY2USHS5nb29nbGUucHJvdG9idWYuRmllbGRPcHRpb25zGOmnEiABKAsyIS5ldmVudC5Gcm9zdEZlYXR1cmVTZXJ2aWNlT3B0aW9uc1ITZnJvc3RGZWF0dXJlU2VydmljZUI9Wi5naXRodWIucmJ4LmNvbS9yb2Jsb3gvc2NoZW1hLXByb3RvZ2VuL2dvL2V2ZW50ogIKTk9UX0lOX1VTRWIGcHJvdG8z", [lU]),
                ck = cN("ChtldmVudC91c2VyX2V2ZW50X2Jhc2UucHJvdG8SBWV2ZW50It4HCg1Vc2VyRXZlbnRCYXNlEiUKB3VzZXJfaWQYASABKANCD5K+kgED4D4Bmr6SAQIIAUgAiAEBEiYKCHVzZXJfa2V5GAIgASgJQg+SvpIBA6g/AZq+kgECGAFIAYgBARIgCgljbGllbnRfaXAYAyABKAlCCJK+kgED6D4BSAKIAQESIQoKdXNlcl9hZ2VudBgEIAEoCUIIkr6SAQOgPwFIA4gBARInChBwbGF0Zm9ybV90eXBlX2lkGAUgASgDQgiSvpIBA+A/AUgEiAEBEikKEmJyb3dzZXJfdHJhY2tlcl9pZBgGIAEoA0IIkr6SAQPQPgFIBYgBARIoChFpc190cnVzdGVkX3NvdXJjZRgHIAEoCEIIkr6SAQOwPwFIBogBARIiCgt1c2VyX29yaWdpbhgIIAEoCUIIkr6SAQPYPwFIB4gBARIdCgZ0YXJnZXQYCSABKAlCCJK+kgEDiH0BSAiIAQESIQoKZXZlbnRfdHlwZRgKIAEoCUIIkr6SAQOQfQFICYgBARIfCghhcHBfbmFtZRgLIAEoCUIIkr6SAQO4PwFICogBARIxChtpbmdlc3Rpb25fdGltZV9taWxsaXNlY29uZHMYDCABKANCB4q+kgECCAFIC4gBARJEChFldmVudF9zdHJlYW1fdGFncxgNIAMoCzIpLmV2ZW50LlVzZXJFdmVudEJhc2UuRXZlbnRTdHJlYW1UYWdzRW50cnkSJgoPYXV0aF9zZXNzaW9uX2lkGA4gASgJQgiSvpIBA8A/AUgMiAEBEicKEGh0dHBfZmluZ2VycHJpbnQYDyABKAlCCJK+kgEDyD8BSA2IAQESJgoPdGxzX2ZpbmdlcnByaW50GBAgASgJQgiSvpIBA9A/AUgOiAEBGjYKFEV2ZW50U3RyZWFtVGFnc0VudHJ5EgsKA2tleRgBIAEoCRINCgV2YWx1ZRgCIAEoCToCOAFCCgoIX3VzZXJfaWRCCwoJX3VzZXJfa2V5QgwKCl9jbGllbnRfaXBCDQoLX3VzZXJfYWdlbnRCEwoRX3BsYXRmb3JtX3R5cGVfaWRCFQoTX2Jyb3dzZXJfdHJhY2tlcl9pZEIUChJfaXNfdHJ1c3RlZF9zb3VyY2VCDgoMX3VzZXJfb3JpZ2luQgkKB190YXJnZXRCDQoLX2V2ZW50X3R5cGVCCwoJX2FwcF9uYW1lQh4KHF9pbmdlc3Rpb25fdGltZV9taWxsaXNlY29uZHNCEgoQX2F1dGhfc2Vzc2lvbl9pZEITChFfaHR0cF9maW5nZXJwcmludEISChBfdGxzX2ZpbmdlcnByaW50QjBaLmdpdGh1Yi5yYnguY29tL3JvYmxveC9zY2hlbWEtcHJvdG9nZW4vZ28vZXZlbnRiBnByb3RvMw", [cA]),
                cx = cN("CjFldmVudHN0cmVhbS9jb3JlL2hpdmVfdGFibGVfbWVzc2FnZV9vcHRpb25zLnByb3RvEhBldmVudHN0cmVhbS5jb3JlIuoBChBIaXZlVGFibGVPcHRpb25zEg4KBnNjaGVtYRgBIAEoCRIMCgRuYW1lGAIgASgJEjEKBHR5cGUYAyABKA4yHy5ldmVudHN0cmVhbS5jb3JlLkhpdmVUYWJsZVR5cGVCAhgBEhcKD3BhcnRpdGlvbl9vcmRlchgEIAEoCRIpCiFyZXRlbnRpb25fb2Zfd2FybV9zdG9yYWdlX2luX2RheXMYBSABKAMSKQohcmV0ZW50aW9uX29mX2NvbGRfc3RvcmFnZV9pbl9kYXlzGAYgASgDEhYKDmRhdGFfbGFrZV9uYW1lGAcgASgJIo4CCgxLYWZrYU9wdGlvbnMSFgoObnVtX3BhcnRpdGlvbnMYASABKAUSHgoWbnVtX3BhcnRpdGlvbnNfc3RhZ2luZxgCIAEoBRIcChRwYXJ0aXRpb25fa2V5X2ZpZWxkcxgDIAMoCRIfChdvbWl0X3NjaGVtYV9yZWdpc3RyeV9pZBgEIAEoCBIyCgtjb21wcmVzc2lvbhgFIAEoDjIdLmV2ZW50c3RyZWFtLmNvcmUuQ29tcHJlc3Npb24SFgoOcWFhc19uYW1lc3BhY2UYBiABKAkSHQoVYWxsb3dfdW5zYWZlX2RlbGl2ZXJ5GAcgASgIEhwKFGFsbG93ZWRfaW5fdHJheV9tb2RlGAggASgIInsKEURhdGFWb2x1bWVPcHRpb25zEiQKHGV4cGVjdGVkX3BlYWtfZXZlbnRzX3Blcl9zZWMYASABKAMSKwojZXhwZWN0ZWRfbWF4X3NpemVfb2ZfZXZlbnRfaW5fYnl0ZXMYAiABKAMSEwoLc2FtcGxlX3JhdGUYAyABKAIizAIKEERhdGFNb2RlbE9wdGlvbnMSLQoJZGF0YV90aWVyGAEgASgOMhouZXZlbnRzdHJlYW0uY29yZS5EYXRhVGllchISCgZvd25lcnMYAiADKAlCAhgBEhgKDG9uY2FsbF90ZWFtcxgDIAMoCUICGAESGgoScHJvZHVjZXJfYXBwX25hbWVzGAQgAygJEhoKEmNvbnN1bWVyX2FwcF9uYW1lcxgFIAMoCRIcChRhZ2dyZWdhdGVfZGltZW5zaW9ucxgGIAMoCRImCgVvd25lchgHIAEoCzIXLmV2ZW50c3RyZWFtLmNvcmUuT3duZXISFgoOc2xhY2tfY2hhbm5lbHMYCCADKAkSGgoScGFnZXJkdXR5X3NlcnZpY2VzGAkgAygJEg4KBmVtYWlscxgKIAMoCRIZChFwb2ludHNfb2ZfY29udGFjdBgLIAMoCSKvBAoLRXZlbnRTY2hlbWESEwoLc2NoZW1hX25hbWUYASABKAkSMAoLZXZlbnRfdHlwZXMYAiADKAsyGy5ldmVudHN0cmVhbS5jb3JlLkV2ZW50VHlwZRIzCg1lYWFzX2VudGl0aWVzGAcgAygLMhwuZXZlbnRzdHJlYW0uY29yZS5FYWFzRW50aXR5EjgKD2RhdGFiYXNlX3RhYmxlcxgIIAMoCzIfLmV2ZW50c3RyZWFtLmNvcmUuRGF0YWJhc2VUYWJsZRJHChBzaW5rX2Rlc3RpbmF0aW9uGAMgASgOMi0uZXZlbnRzdHJlYW0uY29yZS5FdmVudFNjaGVtYS5TaW5rRGVzdGluYXRpb24SMQoJZGF0YV90aWVyGAQgASgOMhouZXZlbnRzdHJlYW0uY29yZS5EYXRhVGllckICGAESEQoFb3duZXIYBSABKAlCAhgBEhMKC2thZmthX3RvcGljGAYgASgJIsUBCg9TaW5rRGVzdGluYXRpb24SCAoETk9ORRAAEhUKDUZJUkVIT1NFX09OTFkQARoCCAESEgoKS0FGS0FfT05MWRACGgIIARIaChJGSVJFSE9TRV9BTkRfS0FGS0EQAxoCCAESIwobRklSRUhPU0VfQU5EX0tBRktBX0FORF9RQUFTEAQaAggBEhYKDktBRktBX0FORF9RQUFTEAUaAggBEg0KCVFBQVNfT05MWRAGEhUKEUZJUkVIT1NFX0FORF9RQUFTEAcisQIKCUV2ZW50VHlwZRIOCgZ0YXJnZXQYASABKAkSDAoEbmFtZRgCIAEoCRJLChBmaWVsZFJlZ2V4RmlsdGVyGAMgAygLMjEuZXZlbnRzdHJlYW0uY29yZS5FdmVudFR5cGUuRmllbGRSZWdleEZpbHRlckVudHJ5EkAKDWNvbXBhdGliaWxpdHkYBCABKA4yKS5ldmVudHN0cmVhbS5jb3JlLkV2ZW50VHlwZS5Db21wYXRpYmlsaXR5GjcKFUZpZWxkUmVnZXhGaWx0ZXJFbnRyeRILCgNrZXkYASABKAkSDQoFdmFsdWUYAiABKAk6AjgBIj4KDUNvbXBhdGliaWxpdHkSCwoHREVGQVVMVBAAEiAKHERVQUxfV1JJVEVfVE9fRVZFTlRTX1BBUlFVRVQQASI8CgpFYWFzRW50aXR5EhgKEGZ1bGxfZW50aXR5X25hbWUYASABKAkSFAoMZW50aXR5X2dyb3VwGAIgASgJIlEKDURhdGFiYXNlVGFibGUSFQoNZGF0YWJhc2VfbmFtZRgBIAEoCRISCgp0YWJsZV9uYW1lGAIgASgJEhUKDWRhdGFiYXNlX3R5cGUYAyABKAkijAEKBU93bmVyEgsKA29yZxgBIAEoCRIMCgR0ZWFtGAIgASgJEhAKA3BvZBgDIAEoCUgAiAEBEhMKBnJvc19pZBgEIAEoA0gBiAEBEhsKDmJ1c2luZXNzX2dyb3VwGAUgASgJSAKIAQFCBgoEX3BvZEIJCgdfcm9zX2lkQhEKD19idXNpbmVzc19ncm91cCKkAQoLQXV0aE9wdGlvbnMSPgoMYXV0aF9tZXRob2RzGAEgAygOMiguZXZlbnRzdHJlYW0uY29yZS5BdXRoT3B0aW9ucy5BdXRoTWV0aG9kIlUKCkF1dGhNZXRob2QSCwoHTk9fQVVUSBAAEgwKCElOVEVSTkFMEAESBwoDUkNDEAISFgoSQVVUSEVOVElDQVRFRF9VU0VSEAMSCwoHQVBJX0tFWRAEIpwCCgtHZHByT3B0aW9ucxI5CgNwaWkYASABKA4yJy5ldmVudHN0cmVhbS5jb3JlLkdkcHJPcHRpb25zLlBpaU1ldGhvZEgAiAEBEiEKFGNkY19hcmNoaXZlcl9lbmFibGVkGAIgASgISAGIAQEijQEKCVBpaU1ldGhvZBIRCg1TRVRfVVNFUl9LRVlTEAASEAoMU0VUX1VTRVJfSURTEAESOAo0QlJFQUtfR0RQUl9DT01QTElBTkNFX0FORF9TRVRfQk9USF9VU0VSX0lEU19BTkRfS0VZUxACEiEKHVNFVF9ORUlUSEVSX1VTRVJfS0VZU19OT1JfSURTEANCBgoEX3BpaUIXChVfY2RjX2FyY2hpdmVyX2VuYWJsZWQqQAoNSGl2ZVRhYmxlVHlwZRILCgdVTktOT1dOEAASDgoKV1dXX0xFR0FDWRABEhIKDkVWRU5UU1RSRUFNX1YxEAIqIwoLQ29tcHJlc3Npb24SCAoETk9ORRAAEgoKBlNOQVBQWRABKlcKCERhdGFUaWVyEhAKDFRJRVJfREVGQVVMVBAAEg0KCVRJRVJfWkVSTxABEgwKCFRJRVJfT05FEAISDAoIVElFUl9UV08QAxIOCgpUSUVSX1RIUkVFEAQ6WwoFdGFibGUSHy5nb29nbGUucHJvdG9idWYuTWVzc2FnZU9wdGlvbnMYya8SIAEoCzIiLmV2ZW50c3RyZWFtLmNvcmUuSGl2ZVRhYmxlT3B0aW9uc1IFdGFibGU6VwoFa2Fma2ESHy5nb29nbGUucHJvdG9idWYuTWVzc2FnZU9wdGlvbnMYyq8SIAEoCzIeLmV2ZW50c3RyZWFtLmNvcmUuS2Fma2FPcHRpb25zUgVrYWZrYTpnCgtkYXRhX3ZvbHVtZRIfLmdvb2dsZS5wcm90b2J1Zi5NZXNzYWdlT3B0aW9ucxjLrxIgASgLMiMuZXZlbnRzdHJlYW0uY29yZS5EYXRhVm9sdW1lT3B0aW9uc1IKZGF0YVZvbHVtZTpkCgpkYXRhX21vZGVsEh8uZ29vZ2xlLnByb3RvYnVmLk1lc3NhZ2VPcHRpb25zGMyvEiABKAsyIi5ldmVudHN0cmVhbS5jb3JlLkRhdGFNb2RlbE9wdGlvbnNSCWRhdGFNb2RlbDpnCg5zY2hlbWFfbWFwcGluZxIfLmdvb2dsZS5wcm90b2J1Zi5NZXNzYWdlT3B0aW9ucxjNrxIgASgLMh0uZXZlbnRzdHJlYW0uY29yZS5FdmVudFNjaGVtYVINc2NoZW1hTWFwcGluZzpUCgRhdXRoEh8uZ29vZ2xlLnByb3RvYnVmLk1lc3NhZ2VPcHRpb25zGM6vEiABKAsyHS5ldmVudHN0cmVhbS5jb3JlLkF1dGhPcHRpb25zUgRhdXRoOlQKBGdkcHISHy5nb29nbGUucHJvdG9idWYuTWVzc2FnZU9wdGlvbnMYz68SIAEoCzIdLmV2ZW50c3RyZWFtLmNvcmUuR2Rwck9wdGlvbnNSBGdkcHJCO1o5Z2l0aHViLnJieC5jb20vcm9ibG94L3NjaGVtYS1wcm90b2dlbi9nby9ldmVudHN0cmVhbS9jb3JlYgZwcm90bzM", [lU]),
                cR = lX(cN("CiBldmVudHN0cmVhbS93ZWIvd2ViX3ZpdGFscy5wcm90bxIXZXZlbnRzdHJlYW0uZXZlbnRpbmdlc3QitQUKCVdlYlZpdGFscxInCg9sb2NhbF90aW1lc3RhbXAYASABKAlCCaK+kgEECgJsdEgAiAEBEi0KD3VzZXJfZXZlbnRfYmFzZRgCIAEoCzIULmV2ZW50LlVzZXJFdmVudEJhc2USHgoEcGFnZRgDIAEoCUILor6SAQYKBHBhZ2VIAYgBARIcCgN1cmwYBCABKAlCCqK+kgEFCgN1cmxIAogBARIfCgZsY3BfbXMYBSABKAFCCqK+kgEFCgNsY3BIA4gBARIfCgZmY3BfbXMYBiABKAFCCqK+kgEFCgNmY3BIBIgBARIhCgd0dGZiX21zGAcgASgBQguivpIBBgoEdHRmYkgFiAEBEhwKA2NscxgIIAEoAUIKor6SAQUKA2Nsc0gGiAEBEh8KBmlucF9tcxgJIAEoAUIKor6SAQUKA2lucEgHiAEBEjMKD3JlbmRlcl9wbGF0Zm9ybRgKIAEoCUIVor6SARAKDnJlbmRlclBsYXRmb3JtSAiIAQE6ygHK/JIBIwoMaW5nZXN0X3Byb3RvEgp3ZWJfdml0YWxzIgdkcyxob3Vy2vySAQYIiCcQgATi/JIBUCIDd3d3OjMKBFVzZXISDUNvbnN1bWVyIEFwcHMaGVBsYXRmb3JtcyAtIFdlYiAmIEJhY2tlbmQguRNCCyNjcC1iYWNrZW5kSgdQSDNQS01Y6vySATYKIGV2ZW50c3RyZWFtL3dlYi93ZWJfdml0YWxzLnByb3RvEhAKA3d3dxIJd2ViVml0YWxzGAf6/JIBAggBQhIKEF9sb2NhbF90aW1lc3RhbXBCBwoFX3BhZ2VCBgoEX3VybEIJCgdfbGNwX21zQgkKB19mY3BfbXNCCgoIX3R0ZmJfbXNCBgoEX2Nsc0IJCgdfaW5wX21zQhIKEF9yZW5kZXJfcGxhdGZvcm1COlo4Z2l0aHViLnJieC5jb20vcm9ibG94L3NjaGVtYS1wcm90b2dlbi9nby9ldmVudHN0cmVhbS93ZWJiBnByb3RvMw", [cA, ck, cx]), 0),
                cO = {
                    writeUnknownFields: !0
                };

            function cV(e, t, n) {
                return cC(new lH, n ? Object.assign(Object.assign({}, cO), n) : cO, cs(e, t)).finish()
            }

            function cC(e, t, n) {
                var r = !0,
                    a = !1,
                    i = void 0;
                try {
                    for (var o, u, s = n.sortedFields[Symbol.iterator](); !(r = (u = s.next()).done); r = !0) {
                        var l = u.value;
                        if (!n.isSet(l)) {
                            if (3 == l.presence) throw Error("cannot encode ".concat(l, " to binary: required field not set"));
                            continue
                        }! function(e, t, n, r) {
                            var a;
                            switch (r.fieldKind) {
                                case "scalar":
                                case "enum":
                                    cZ(e, n.desc.typeName, r.name, null != (a = r.scalar) ? a : em.INT32, r.number, n.get(r));
                                    break;
                                case "list":
                                    ! function(e, t, n, r) {
                                        if ("message" == n.listKind) {
                                            var a = !0,
                                                i = !1,
                                                o = void 0;
                                            try {
                                                for (var u, s, l = r[Symbol.iterator](); !(a = (s = l.next()).done); a = !0) {
                                                    var c = s.value;
                                                    cB(e, t, n, c)
                                                }
                                            } catch (e) {
                                                i = !0, o = e
                                            } finally {
                                                try {
                                                    a || null == l.return || l.return()
                                                } finally {
                                                    if (i) throw o
                                                }
                                            }
                                            return
                                        }
                                        var f = null != (u = n.scalar) ? u : em.INT32;
                                        if (n.packed) {
                                            if (!r.size) return;
                                            e.tag(n.number, eL.LengthDelimited).fork();
                                            var d = !0,
                                                p = !1,
                                                v = void 0;
                                            try {
                                                for (var m, h = r[Symbol.iterator](); !(d = (m = h.next()).done); d = !0) {
                                                    var g = m.value;
                                                    cL(e, n.parent.typeName, n.name, f, g)
                                                }
                                            } catch (e) {
                                                p = !0, v = e
                                            } finally {
                                                try {
                                                    d || null == h.return || h.return()
                                                } finally {
                                                    if (p) throw v
                                                }
                                            }
                                            e.join();
                                            return
                                        }
                                        var y = !0,
                                            b = !1,
                                            _ = void 0;
                                        try {
                                            for (var E, S = r[Symbol.iterator](); !(y = (E = S.next()).done); y = !0) {
                                                var w = E.value;
                                                cZ(e, n.parent.typeName, n.name, f, n.number, w)
                                            }
                                        } catch (e) {
                                            b = !0, _ = e
                                        } finally {
                                            try {
                                                y || null == S.return || S.return()
                                            } finally {
                                                if (b) throw _
                                            }
                                        }
                                    }(e, t, r, n.get(r));
                                    break;
                                case "message":
                                    cB(e, t, r, n.get(r));
                                    break;
                                case "map":
                                    var i = !0,
                                        o = !1,
                                        u = void 0;
                                    try {
                                        for (var s, l = n.get(r)[Symbol.iterator](); !(i = (s = l.next()).done); i = !0) {
                                            var c = eK(s.value, 2),
                                                f = c[0],
                                                d = c[1];
                                            ! function(e, t, n, r, a) {
                                                var i;
                                                switch (e.tag(n.number, eL.LengthDelimited).fork(), cZ(e, n.parent.typeName, n.name, n.mapKey, 1, r), n.mapKind) {
                                                    case "scalar":
                                                    case "enum":
                                                        cZ(e, n.parent.typeName, n.name, null != (i = n.scalar) ? i : em.INT32, 2, a);
                                                        break;
                                                    case "message":
                                                        cC(e.tag(2, eL.LengthDelimited).fork(), t, a).join()
                                                }
                                                e.join()
                                            }(e, t, r, f, d)
                                        }
                                    } catch (e) {
                                        o = !0, u = e
                                    } finally {
                                        try {
                                            i || null == l.return || l.return()
                                        } finally {
                                            if (o) throw u
                                        }
                                    }
                            }
                        }(e, t, n, l)
                    }
                } catch (e) {
                    a = !0, i = e
                } finally {
                    try {
                        r || null == s.return || s.return()
                    } finally {
                        if (a) throw i
                    }
                }
                if (t.writeUnknownFields) {
                    var c = !0,
                        f = !1,
                        d = void 0;
                    try {
                        for (var p, v = (null != (o = n.getUnknown()) ? o : [])[Symbol.iterator](); !(c = (p = v.next()).done); c = !0) {
                            var m = p.value,
                                h = m.no,
                                g = m.wireType,
                                y = m.data;
                            e.tag(h, g).raw(y)
                        }
                    } catch (e) {
                        f = !0, d = e
                    } finally {
                        try {
                            c || null == v.return || v.return()
                        } finally {
                            if (f) throw d
                        }
                    }
                }
                return e
            }

            function cZ(e, t, n, r, a, i) {
                cL(e.tag(a, function(e) {
                    switch (e) {
                        case em.BYTES:
                        case em.STRING:
                            return eL.LengthDelimited;
                        case em.DOUBLE:
                        case em.FIXED64:
                        case em.SFIXED64:
                            return eL.Bit64;
                        case em.FIXED32:
                        case em.SFIXED32:
                        case em.FLOAT:
                            return eL.Bit32;
                        default:
                            return eL.Varint
                    }
                }(r)), t, n, r, i)
            }

            function cB(e, t, n, r) {
                n.delimitedEncoding ? cC(e.tag(n.number, eL.StartGroup), t, r).tag(n.number, eL.EndGroup) : cC(e.tag(n.number, eL.LengthDelimited).fork(), t, r).join()
            }

            function cL(e, t, n, r, a) {
                try {
                    switch (r) {
                        case em.STRING:
                            e.string(a);
                            break;
                        case em.BOOL:
                            e.bool(a);
                            break;
                        case em.DOUBLE:
                            e.double(a);
                            break;
                        case em.FLOAT:
                            e.float(a);
                            break;
                        case em.INT32:
                            e.int32(a);
                            break;
                        case em.INT64:
                            e.int64(a);
                            break;
                        case em.UINT64:
                            e.uint64(a);
                            break;
                        case em.FIXED64:
                            e.fixed64(a);
                            break;
                        case em.BYTES:
                            e.bytes(a);
                            break;
                        case em.FIXED32:
                            e.fixed32(a);
                            break;
                        case em.SFIXED32:
                            e.sfixed32(a);
                            break;
                        case em.SFIXED64:
                            e.sfixed64(a);
                            break;
                        case em.SINT64:
                            e.sint64(a);
                            break;
                        case em.UINT32:
                            e.uint32(a);
                            break;
                        case em.SINT32:
                            e.sint32(a)
                    }
                } catch (e) {
                    if ((0, eW._)(e, Error)) throw Error("cannot encode field ".concat(t, ".").concat(n, " to binary: ").concat(e.message));
                    throw e
                }
            }
            var cF = Uint8Array,
                cP = Uint16Array,
                cX = Int32Array,
                cU = new cF([0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 0, 0, 0, 0]),
                cW = new cF([0, 0, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11, 11, 12, 12, 13, 13, 0, 0]),
                cD = new cF([16, 17, 18, 0, 8, 7, 9, 6, 10, 5, 11, 4, 12, 3, 13, 2, 14, 1, 15]),
                cY = function(e, t) {
                    for (var n = new cP(31), r = 0; r < 31; ++r) n[r] = t += 1 << e[r - 1];
                    for (var a = new cX(n[30]), r = 1; r < 30; ++r)
                        for (var i = n[r]; i < n[r + 1]; ++i) a[i] = i - n[r] << 5 | r;
                    return {
                        b: n,
                        r: a
                    }
                },
                cG = cY(cU, 2),
                cj = cG.b,
                cM = cG.r;
            cj[28] = 258, cM[258] = 28;
            for (var cz = cY(cW, 0), cJ = (cz.b, cz.r), cK = new cP(32768), cH = 0; cH < 32768; ++cH) {
                var cQ = (43690 & cH) >> 1 | (21845 & cH) << 1;
                cQ = (61680 & (cQ = (52428 & cQ) >> 2 | (13107 & cQ) << 2)) >> 4 | (3855 & cQ) << 4, cK[cH] = ((65280 & cQ) >> 8 | (255 & cQ) << 8) >> 1
            }
            for (var cq = function(e, t, n) {
                    for (var r, a = e.length, i = 0, o = new cP(t); i < a; ++i) e[i] && ++o[e[i] - 1];
                    var u = new cP(t);
                    for (i = 1; i < t; ++i) u[i] = u[i - 1] + o[i - 1] << 1;
                    if (n) {
                        r = new cP(1 << t);
                        var s = 15 - t;
                        for (i = 0; i < a; ++i)
                            if (e[i])
                                for (var l = i << 4 | e[i], c = t - e[i], f = u[e[i] - 1]++ << c, d = f | (1 << c) - 1; f <= d; ++f) r[cK[f] >> s] = l
                    } else
                        for (i = 0, r = new cP(a); i < a; ++i) e[i] && (r[i] = cK[u[e[i] - 1]++] >> 15 - e[i]);
                    return r
                }, c$ = new cF(288), cH = 0; cH < 144; ++cH) c$[cH] = 8;
            for (var cH = 144; cH < 256; ++cH) c$[cH] = 9;
            for (var cH = 256; cH < 280; ++cH) c$[cH] = 7;
            for (var cH = 280; cH < 288; ++cH) c$[cH] = 8;
            for (var c0 = new cF(32), cH = 0; cH < 32; ++cH) c0[cH] = 5;
            var c1 = cq(c$, 9, 0),
                c2 = cq(c0, 5, 0),
                c3 = function(e) {
                    return (e + 7) / 8 | 0
                },
                c5 = function(e, t, n) {
                    n <<= 7 & t;
                    var r = t / 8 | 0;
                    e[r] |= n, e[r + 1] |= n >> 8
                },
                c9 = function(e, t, n) {
                    n <<= 7 & t;
                    var r = t / 8 | 0;
                    e[r] |= n, e[r + 1] |= n >> 8, e[r + 2] |= n >> 16
                },
                c4 = function(e, t) {
                    for (var n = [], r = 0; r < e.length; ++r) e[r] && n.push({
                        s: r,
                        f: e[r]
                    });
                    var a = n.length,
                        i = n.slice();
                    if (!a) return {
                        t: fr,
                        l: 0
                    };
                    if (1 == a) {
                        var o = new cF(n[0].s + 1);
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
                    var u = n[0],
                        s = n[1],
                        l = 0,
                        c = 1,
                        f = 2;
                    for (n[0] = {
                            s: -1,
                            f: u.f + s.f,
                            l: u,
                            r: s
                        }; c != a - 1;) u = n[n[l].f < n[f].f ? l++ : f++], s = n[l != c && n[l].f < n[f].f ? l++ : f++], n[c++] = {
                        s: -1,
                        f: u.f + s.f,
                        l: u,
                        r: s
                    };
                    for (var d = i[0].s, r = 1; r < a; ++r) i[r].s > d && (d = i[r].s);
                    var p = new cP(d + 1),
                        v = c8(n[c - 1], p, 0);
                    if (v > t) {
                        var r = 0,
                            m = 0,
                            h = v - t,
                            g = 1 << h;
                        for (i.sort(function(e, t) {
                                return p[t.s] - p[e.s] || e.f - t.f
                            }); r < a; ++r) {
                            var y = i[r].s;
                            if (p[y] > t) m += g - (1 << v - p[y]), p[y] = t;
                            else break
                        }
                        for (m >>= h; m > 0;) {
                            var b = i[r].s;
                            p[b] < t ? m -= 1 << t - p[b]++ - 1 : ++r
                        }
                        for (; r >= 0 && m; --r) {
                            var _ = i[r].s;
                            p[_] == t && (--p[_], ++m)
                        }
                        v = t
                    }
                    return {
                        t: new cF(p),
                        l: v
                    }
                },
                c8 = function(e, t, n) {
                    return -1 == e.s ? Math.max(c8(e.l, t, n + 1), c8(e.r, t, n + 1)) : t[e.s] = n
                },
                c6 = function(e) {
                    for (var t = e.length; t && !e[--t];);
                    for (var n = new cP(++t), r = 0, a = e[0], i = 1, o = function(e) {
                            n[r++] = e
                        }, u = 1; u <= t; ++u)
                        if (e[u] == a && u != t) ++i;
                        else {
                            if (!a && i > 2) {
                                for (; i > 138; i -= 138) o(32754);
                                i > 2 && (o(i > 10 ? i - 11 << 5 | 28690 : i - 3 << 5 | 12305), i = 0)
                            } else if (i > 3) {
                                for (o(a), --i; i > 6; i -= 6) o(8304);
                                i > 2 && (o(i - 3 << 5 | 8208), i = 0)
                            }
                            for (; i--;) o(a);
                            i = 1, a = e[u]
                        } return {
                        c: n.subarray(0, r),
                        n: t
                    }
                },
                c7 = function(e, t) {
                    for (var n = 0, r = 0; r < t.length; ++r) n += e[r] * t[r];
                    return n
                },
                fe = function(e, t, n) {
                    var r = n.length,
                        a = c3(t + 2);
                    e[a] = 255 & r, e[a + 1] = r >> 8, e[a + 2] = 255 ^ e[a], e[a + 3] = 255 ^ e[a + 1];
                    for (var i = 0; i < r; ++i) e[a + i + 4] = n[i];
                    return (a + 4 + r) * 8
                },
                ft = function(e, t, n, r, a, i, o, u, s, l, c) {
                    c5(t, c++, n), ++a[256];
                    for (var f, d, p, v, m = c4(a, 15), h = m.t, g = m.l, y = c4(i, 15), b = y.t, _ = y.l, E = c6(h), S = E.c, w = E.n, T = c6(b), I = T.c, N = T.n, A = new cP(19), k = 0; k < S.length; ++k) ++A[31 & S[k]];
                    for (var k = 0; k < I.length; ++k) ++A[31 & I[k]];
                    for (var x = c4(A, 7), R = x.t, O = x.l, V = 19; V > 4 && !R[cD[V - 1]]; --V);
                    var C = l + 5 << 3,
                        Z = c7(a, c$) + c7(i, c0) + o,
                        B = c7(a, h) + c7(i, b) + o + 14 + 3 * V + c7(A, R) + 2 * A[16] + 3 * A[17] + 7 * A[18];
                    if (s >= 0 && C <= Z && C <= B) return fe(t, c, e.subarray(s, s + l));
                    if (c5(t, c, 1 + (B < Z)), c += 2, B < Z) {
                        f = cq(h, g, 0), d = h, p = cq(b, _, 0), v = b;
                        var L = cq(R, O, 0);
                        c5(t, c, w - 257), c5(t, c + 5, N - 1), c5(t, c + 10, V - 4), c += 14;
                        for (var k = 0; k < V; ++k) c5(t, c + 3 * k, R[cD[k]]);
                        c += 3 * V;
                        for (var F = [S, I], P = 0; P < 2; ++P)
                            for (var X = F[P], k = 0; k < X.length; ++k) {
                                var U = 31 & X[k];
                                c5(t, c, L[U]), c += R[U], U > 15 && (c5(t, c, X[k] >> 5 & 127), c += X[k] >> 12)
                            }
                    } else f = c1, d = c$, p = c2, v = c0;
                    for (var k = 0; k < u; ++k) {
                        var W = r[k];
                        if (W > 255) {
                            var U = W >> 18 & 31;
                            c9(t, c, f[U + 257]), c += d[U + 257], U > 7 && (c5(t, c, W >> 23 & 31), c += cU[U]);
                            var D = 31 & W;
                            c9(t, c, p[D]), c += v[D], D > 3 && (c9(t, c, W >> 5 & 8191), c += cW[D])
                        } else c9(t, c, f[W]), c += d[W]
                    }
                    return c9(t, c, f[256]), c + d[256]
                },
                fn = new cX([65540, 131080, 131088, 131104, 262176, 1048704, 1048832, 2114560, 2117632]),
                fr = new cF(0),
                fa = function(e, t, n, r, a, i) {
                    var o, u, s = i.z || e.length,
                        l = new cF(r + s + 5 * (1 + Math.ceil(s / 7e3)) + a),
                        c = l.subarray(r, l.length - a),
                        f = i.l,
                        d = 7 & (i.r || 0);
                    if (t) {
                        d && (c[0] = i.r >> 3);
                        for (var p = fn[t - 1], v = p >> 13, m = 8191 & p, h = (1 << n) - 1, g = i.p || new cP(32768), y = i.h || new cP(h + 1), b = Math.ceil(n / 3), _ = 2 * b, E = function(t) {
                                return (e[t] ^ e[t + 1] << b ^ e[t + 2] << _) & h
                            }, S = new cX(25e3), w = new cP(288), T = new cP(32), I = 0, N = 0, A = i.i || 0, k = 0, x = i.w || 0, R = 0; A + 2 < s; ++A) {
                            var O = E(A),
                                V = 32767 & A,
                                C = y[O];
                            if (g[V] = C, y[O] = V, x <= A) {
                                var Z = s - A;
                                if ((I > 7e3 || k > 24576) && (Z > 423 || !f)) {
                                    d = ft(e, c, 0, S, w, T, N, k, R, A - R, d), k = I = N = 0, R = A;
                                    for (var B = 0; B < 286; ++B) w[B] = 0;
                                    for (var B = 0; B < 30; ++B) T[B] = 0
                                }
                                var L = 2,
                                    F = 0,
                                    P = m,
                                    X = V - C & 32767;
                                if (Z > 2 && O == E(A - X))
                                    for (var U = Math.min(v, Z) - 1, W = Math.min(32767, A), D = Math.min(258, Z); X <= W && --P && V != C;) {
                                        if (e[A + L] == e[A + L - X]) {
                                            for (var Y = 0; Y < D && e[A + Y] == e[A + Y - X]; ++Y);
                                            if (Y > L) {
                                                if (L = Y, F = X, Y > U) break;
                                                for (var G = Math.min(X, Y - 2), j = 0, B = 0; B < G; ++B) {
                                                    var M = A - X + B & 32767,
                                                        z = g[M],
                                                        J = M - z & 32767;
                                                    J > j && (j = J, C = M)
                                                }
                                            }
                                        }
                                        C = g[V = C], X += V - C & 32767
                                    }
                                if (F) {
                                    S[k++] = 0x10000000 | cM[L] << 18 | cJ[F];
                                    var K = 31 & cM[L],
                                        H = 31 & cJ[F];
                                    N += cU[K] + cW[H], ++w[257 + K], ++T[H], x = A + L, ++I
                                } else S[k++] = e[A], ++w[e[A]]
                            }
                        }
                        for (A = Math.max(A, x); A < s; ++A) S[k++] = e[A], ++w[e[A]];
                        d = ft(e, c, f, S, w, T, N, k, R, A - R, d), f || (i.r = 7 & d | c[d / 8 | 0] << 3, d -= 7, i.h = y, i.p = g, i.i = A, i.w = x)
                    } else {
                        for (var A = i.w || 0; A < s + f; A += 65535) {
                            var Q = A + 65535;
                            Q >= s && (c[d / 8 | 0] = f, Q = s), d = fe(c, d + 1, e.subarray(A, Q))
                        }
                        i.i = s
                    }
                    return o = 0, u = r + c3(d) + a, (null == o || o < 0) && (o = 0), (null == u || u > l.length) && (u = l.length), new cF(l.subarray(o, u))
                },
                fi = function() {
                    for (var e = new Int32Array(256), t = 0; t < 256; ++t) {
                        for (var n = t, r = 9; --r;) n = (1 & n && -0x12477ce0) ^ n >>> 1;
                        e[t] = n
                    }
                    return e
                }(),
                fo = function() {
                    var e = -1;
                    return {
                        p: function(t) {
                            for (var n = e, r = 0; r < t.length; ++r) n = fi[255 & n ^ t[r]] ^ n >>> 8;
                            e = n
                        },
                        d: function() {
                            return ~e
                        }
                    }
                },
                fu = function(e, t, n, r, a) {
                    if (!a && (a = {
                            l: 1
                        }, t.dictionary)) {
                        var i = t.dictionary.subarray(-32768),
                            o = new cF(i.length + e.length);
                        o.set(i), o.set(e, i.length), e = o, a.w = i.length
                    }
                    return fa(e, null == t.level ? 6 : t.level, null == t.mem ? a.l ? Math.ceil(1.5 * Math.max(8, Math.min(13, Math.log(e.length)))) : 20 : 12 + t.mem, n, r, a)
                },
                fs = function(e, t, n) {
                    for (; n; ++t) e[t] = n, n >>>= 8
                },
                fl = function(e, t) {
                    var n = t.filename;
                    if (e[0] = 31, e[1] = 139, e[2] = 8, e[8] = t.level < 2 ? 4 : 2 * (9 == t.level), e[9] = 3, 0 != t.mtime && fs(e, 4, Math.floor(new Date(t.mtime || Date.now()) / 1e3)), n) {
                        e[3] = 8;
                        for (var r = 0; r <= n.length; ++r) e[r + 10] = n.charCodeAt(r)
                    }
                };

            function fc(e, t) {
                t || (t = {});
                var n, r = fo(),
                    a = e.length;
                r.p(e);
                var i = fu(e, t, 10 + ((n = t).filename ? n.filename.length + 1 : 0), 8),
                    o = i.length;
                return fl(i, t), fs(i, o - 8, r.d()), fs(i, o - 4, a), i
            }
            var ff = "u" > typeof TextDecoder && new TextDecoder;
            try {
                ff.decode(fr, {
                    stream: !0
                })
            } catch (e) {}
            "function" == typeof queueMicrotask && queueMicrotask;
            var fd = cN("ChVnb29nbGUvYXBpL2h0dHAucHJvdG8SCmdvb2dsZS5hcGkiVAoESHR0cBIjCgVydWxlcxgBIAMoCzIULmdvb2dsZS5hcGkuSHR0cFJ1bGUSJwofZnVsbHlfZGVjb2RlX3Jlc2VydmVkX2V4cGFuc2lvbhgCIAEoCCKBAgoISHR0cFJ1bGUSEAoIc2VsZWN0b3IYASABKAkSDQoDZ2V0GAIgASgJSAASDQoDcHV0GAMgASgJSAASDgoEcG9zdBgEIAEoCUgAEhAKBmRlbGV0ZRgFIAEoCUgAEg8KBXBhdGNoGAYgASgJSAASLwoGY3VzdG9tGAggASgLMh0uZ29vZ2xlLmFwaS5DdXN0b21IdHRwUGF0dGVybkgAEgwKBGJvZHkYByABKAkSFQoNcmVzcG9uc2VfYm9keRgMIAEoCRIxChNhZGRpdGlvbmFsX2JpbmRpbmdzGAsgAygLMhQuZ29vZ2xlLmFwaS5IdHRwUnVsZUIJCgdwYXR0ZXJuIi8KEUN1c3RvbUh0dHBQYXR0ZXJuEgwKBGtpbmQYASABKAkSDAoEcGF0aBgCIAEoCUJqCg5jb20uZ29vZ2xlLmFwaUIJSHR0cFByb3RvUAFaQWdvb2dsZS5nb2xhbmcub3JnL2dlbnByb3RvL2dvb2dsZWFwaXMvYXBpL2Fubm90YXRpb25zO2Fubm90YXRpb25z+AEBogIER0FQSWIGcHJvdG8z"),
                fp = cN("Chxnb29nbGUvYXBpL2Fubm90YXRpb25zLnByb3RvEgpnb29nbGUuYXBpOksKBGh0dHASHi5nb29nbGUucHJvdG9idWYuTWV0aG9kT3B0aW9ucxiwyrwiIAEoCzIULmdvb2dsZS5hcGkuSHR0cFJ1bGVSBGh0dHBCbgoOY29tLmdvb2dsZS5hcGlCEEFubm90YXRpb25zUHJvdG9QAVpBZ29vZ2xlLmdvbGFuZy5vcmcvZ2VucHJvdG8vZ29vZ2xlYXBpcy9hcGkvYW5ub3RhdGlvbnM7YW5ub3RhdGlvbnOiAgRHQVBJYgZwcm90bzM", [fd, lU]),
                fv = cN("Cllyb2Jsb3gvZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QvZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QvdjEvZXhwZXJpZW5jZV9zaWduYWxzX2luZ2VzdC5wcm90bxI5cm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxIoIBCgVFdmVudBIOCgZzb3VyY2UYASABKAkSDwoHcGF5bG9hZBgCIAEoDBJYCgpyb2Jsb3hfY3R4GAMgASgLMkQucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLlJvYmxveEN0eCKfAQoJUm9ibG94Q3R4EmIKB2hlYWRlcnMYASADKAsyUS5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuUm9ibG94Q3R4LkhlYWRlcnNFbnRyeRouCgxIZWFkZXJzRW50cnkSCwoDa2V5GAEgASgJEg0KBXZhbHVlGAIgASgJOgI4ASJLCgZTb3VyY2USDAoEbmFtZRgBIAEoCRITCgtrYWZrYV90b3BpYxgCIAEoCRIPCgdibG9ja2VkGAMgASgIEg0KBW5vdGVzGAQgASgJIl0KB1NvdXJjZXMSUgoHc291cmNlcxgBIAMoCzJBLnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MS5Tb3VyY2UiGwoIUmVzcG9uc2USDwoHbWVzc2FnZRgCIAEoCULPAQo9Y29tLnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MUIcRXhwZXJpZW5jZVNpZ25hbHNJbmdlc3RQcm90b1ABWjJleHBlcmllbmNlc2lnbmFsc2luZ2VzdC9leHBlcmllbmNlc2lnbmFsc2luZ2VzdC92MaoCOVJvYmxveC5FeHBlcmllbmNlU2lnbmFsc0luZ2VzdC5FeHBlcmllbmNlU2lnbmFsc0luZ2VzdC5WMWIGcHJvdG8z"),
                fm = cN("Ch1yb2Jsb3gvcHJvdG9idWYvb3B0aW9ucy5wcm90bxIPcm9ibG94LnByb3RvYnVmIoQBChZTZXJ2aWNlQ29udHJhY3RPcHRpb25zEg8KB3B1Ymxpc2gYASABKAgSIwobY3NoYXJwX2dlbmVyYXRlX3NlcnZlcl9zdHViGAIgASgIEjQKLGludDY0X2lkX3dyYXBwZXJfZW50aXR5X2lkX2NzaGFycF9jb252ZXJzaW9uGAMgASgJOnQKEXNlcnZpY2VfY29udHJhY3RzEhwuZ29vZ2xlLnByb3RvYnVmLkZpbGVPcHRpb25zGNCGAyABKAsyJy5yb2Jsb3gucHJvdG9idWYuU2VydmljZUNvbnRyYWN0T3B0aW9uc1IQc2VydmljZUNvbnRyYWN0czo9CglzZW5zaXRpdmUSHS5nb29nbGUucHJvdG9idWYuRmllbGRPcHRpb25zGNGGAyABKAhSCXNlbnNpdGl2ZTpACglzcWxfdmFsdWUSIS5nb29nbGUucHJvdG9idWYuRW51bVZhbHVlT3B0aW9ucxji1AMgASgJUghzcWxWYWx1ZUIRWg9yb2Jsb3gvcHJvdG9idWZiBnByb3RvMw", [lU]),
                fh = cN("Cl1yb2Jsb3gvZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QvZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QvdjEvZXhwZXJpZW5jZV9zaWduYWxzX2luZ2VzdF9hcGkucHJvdG8SOXJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MSJkChBTZW5kQmF0Y2hSZXF1ZXN0ElAKBmV2ZW50cxgBIAMoCzJALnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MS5FdmVudCITChFTZW5kQmF0Y2hSZXNwb25zZSKZAgoZU2VuZE9wdGltaXplZEJhdGNoUmVxdWVzdBJyCgtzdWJfYmF0Y2hlcxgBIAMoCzJdLnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MS5TZW5kT3B0aW1pemVkQmF0Y2hSZXF1ZXN0LlN1YkJhdGNoGocBCghTdWJCYXRjaBIOCgZzb3VyY2UYASABKAkSEAoIcGF5bG9hZHMYAiADKAwSWQoLcm9ibG94X2N0eHMYAyADKAsyRC5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuUm9ibG94Q3R4IhwKGlNlbmRPcHRpbWl6ZWRCYXRjaFJlc3BvbnNlIpYBChdTZW5kVW5pZm9ybUJhdGNoUmVxdWVzdBIOCgZzb3VyY2UYASABKAkSEAoIcGF5bG9hZHMYAiADKAwSWQoLcm9ibG94X2N0eHMYAyADKAsyRC5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuUm9ibG94Q3R4IhoKGFNlbmRVbmlmb3JtQmF0Y2hSZXNwb25zZSJjChBTZW5kRXZlbnRSZXF1ZXN0Ek8KBWV2ZW50GAEgASgLMkAucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLkV2ZW50IhMKEVNlbmRFdmVudFJlc3BvbnNlIhQKEkxpc3RTb3VyY2VzUmVxdWVzdCJpChNMaXN0U291cmNlc1Jlc3BvbnNlElIKB3NvdXJjZXMYASADKAsyQS5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuU291cmNlIiAKEEdldFNvdXJjZVJlcXVlc3QSDAoEbmFtZRgBIAEoCSJmChFHZXRTb3VyY2VSZXNwb25zZRJRCgZzb3VyY2UYASABKAsyQS5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuU291cmNlImgKE0NyZWF0ZVNvdXJjZVJlcXVlc3QSUQoGc291cmNlGAEgASgLMkEucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLlNvdXJjZSJpChRDcmVhdGVTb3VyY2VSZXNwb25zZRJRCgZzb3VyY2UYASABKAsyQS5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuU291cmNlIo0BChNVcGRhdGVTb3VyY2VSZXF1ZXN0EgwKBG5hbWUYASABKAkSGAoLa2Fma2FfdG9waWMYAiABKAlIAIgBARIUCgdibG9ja2VkGAMgASgISAGIAQESEgoFbm90ZXMYBCABKAlIAogBAUIOCgxfa2Fma2FfdG9waWNCCgoIX2Jsb2NrZWRCCAoGX25vdGVzImkKFFVwZGF0ZVNvdXJjZVJlc3BvbnNlElEKBnNvdXJjZRgBIAEoCzJBLnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MS5Tb3VyY2UiIwoTRGVsZXRlU291cmNlUmVxdWVzdBIMCgRuYW1lGAEgASgJIicKFERlbGV0ZVNvdXJjZVJlc3BvbnNlEg8KB2RlbGV0ZWQYASABKAgiIgoSVG91Y2hTb3VyY2VSZXF1ZXN0EgwKBG5hbWUYASABKAkiaAoTVG91Y2hTb3VyY2VSZXNwb25zZRJRCgZzb3VyY2UYASABKAsyQS5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuU291cmNlMqgQChpFeHBlcmllbmNlU2lnbmFsc0luZ2VzdEFQSRK9AQoJU2VuZEJhdGNoEksucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLlNlbmRCYXRjaFJlcXVlc3QaTC5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuU2VuZEJhdGNoUmVzcG9uc2UiFYLT5JMCDyIKL3YxL2V2ZW50czoBKhLiAQoSU2VuZE9wdGltaXplZEJhdGNoElQucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLlNlbmRPcHRpbWl6ZWRCYXRjaFJlcXVlc3QaVS5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuU2VuZE9wdGltaXplZEJhdGNoUmVzcG9uc2UiH4LT5JMCGSIUL3YxL2V2ZW50cy9vcHRpbWl6ZWQ6ASoS2gEKEFNlbmRVbmlmb3JtQmF0Y2gSUi5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuU2VuZFVuaWZvcm1CYXRjaFJlcXVlc3QaUy5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuU2VuZFVuaWZvcm1CYXRjaFJlc3BvbnNlIh2C0+STAhciEi92MS9ldmVudHMvdW5pZm9ybToBKhLEAQoJU2VuZEV2ZW50Eksucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLlNlbmRFdmVudFJlcXVlc3QaTC5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuU2VuZEV2ZW50UmVzcG9uc2UiHILT5JMCFiIRL3YxL2V2ZW50cy9zaW5nbGU6ASoSwQEKC0xpc3RTb3VyY2VzEk0ucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLkxpc3RTb3VyY2VzUmVxdWVzdBpOLnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MS5MaXN0U291cmNlc1Jlc3BvbnNlIhOC0+STAg0SCy92MS9zb3VyY2VzEsIBCglHZXRTb3VyY2USSy5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuR2V0U291cmNlUmVxdWVzdBpMLnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MS5HZXRTb3VyY2VSZXNwb25zZSIagtPkkwIUEhIvdjEvc291cmNlcy97bmFtZX0SxwEKDENyZWF0ZVNvdXJjZRJOLnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MS5DcmVhdGVTb3VyY2VSZXF1ZXN0Gk8ucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLkNyZWF0ZVNvdXJjZVJlc3BvbnNlIhaC0+STAhAiCy92MS9zb3VyY2VzOgEqEs4BCgxVcGRhdGVTb3VyY2USTi5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuVXBkYXRlU291cmNlUmVxdWVzdBpPLnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MS5VcGRhdGVTb3VyY2VSZXNwb25zZSIdgtPkkwIXMhIvdjEvc291cmNlcy97bmFtZX06ASoSywEKDERlbGV0ZVNvdXJjZRJOLnJvYmxveC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC5leHBlcmllbmNlc2lnbmFsc2luZ2VzdC52MS5EZWxldGVTb3VyY2VSZXF1ZXN0Gk8ucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLkRlbGV0ZVNvdXJjZVJlc3BvbnNlIhqC0+STAhQqEi92MS9zb3VyY2VzL3tuYW1lfRLOAQoLVG91Y2hTb3VyY2USTS5yb2Jsb3guZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QuZXhwZXJpZW5jZXNpZ25hbHNpbmdlc3QudjEuVG91Y2hTb3VyY2VSZXF1ZXN0Gk4ucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxLlRvdWNoU291cmNlUmVzcG9uc2UiIILT5JMCGiIYL3YxL3NvdXJjZXMve25hbWV9L3RvdWNoQtgBCj1jb20ucm9ibG94LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0LnYxQh9FeHBlcmllbmNlU2lnbmFsc0luZ2VzdEFwaVByb3RvUAFaMmV4cGVyaWVuY2VzaWduYWxzaW5nZXN0L2V4cGVyaWVuY2VzaWduYWxzaW5nZXN0L3YxqgI5Um9ibG94LkV4cGVyaWVuY2VTaWduYWxzSW5nZXN0LkV4cGVyaWVuY2VTaWduYWxzSW5nZXN0LlYxgrUYAggBYgZwcm90bzM", [fp, fv, fm]),
                fg = lX(fh, 2),
                fy = lX(fh, 2, 0),
                fb = lX(fh, 6),
                f_ = function() {
                    function e() {
                        var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                            n = t.baseUrl;
                        e1(this, e), eD(this, "baseUrl", void 0), this.baseUrl = (void 0 === n ? "https://apis.roblox.com" : n).replace(/\/$/, "") + "/experience-signals-ingest/public"
                    }
                    return e3(e, [{
                        key: "sendEvent",
                        value: function(e, t) {
                            return rN(function() {
                                var n, r, a;
                                return rA(this, function(i) {
                                    switch (i.label) {
                                        case 0:
                                            return i.trys.push([0, 2, , 3]), n = cV(e, ce(e, t), {
                                                writeUnknownFields: !1
                                            }), r = ce(fb, {
                                                event: {
                                                    source: e.typeName,
                                                    payload: n
                                                }
                                            }), [4, fetch("".concat(this.baseUrl, "/v1/events/single"), {
                                                method: "POST",
                                                headers: {
                                                    "Content-Type": "application/x-protobuf",
                                                    "Content-Encoding": "gzip"
                                                },
                                                body: fc(cV(fb, r, {
                                                    writeUnknownFields: !1
                                                })),
                                                credentials: "include",
                                                keepalive: !0
                                            })];
                                        case 1:
                                            if (!(a = i.sent()).ok) throw Error("status ".concat(a.status));
                                            return [3, 3];
                                        case 2:
                                            return console.error("EventStream failed to send event:", i.sent()), [3, 3];
                                        case 3:
                                            return [2]
                                    }
                                })
                            }).call(this)
                        }
                    }, {
                        key: "sendBatch",
                        value: function(e) {
                            return rN(function() {
                                var t, n, r, a, i, o, u, s, l, c, f;
                                return rA(this, function(d) {
                                    switch (d.label) {
                                        case 0:
                                            d.trys.push([0, 2, , 3]), t = new Map, n = !0, r = !1, a = void 0;
                                            try {
                                                for (i = e[Symbol.iterator](); !(n = (o = i.next()).done); n = !0) s = (u = o.value).schema.typeName, t.has(s) || t.set(s, []), t.get(s).push(u)
                                            } catch (e) {
                                                r = !0, a = e
                                            } finally {
                                                try {
                                                    n || null == i.return || i.return()
                                                } finally {
                                                    if (r) throw a
                                                }
                                            }
                                            return l = Array.from(t.entries()).map(function(e) {
                                                var t = eK(e, 2),
                                                    n = t[0],
                                                    r = t[1].map(function(e) {
                                                        var t = e.schema;
                                                        return cV(t, ce(t, e.msg), {
                                                            writeUnknownFields: !1
                                                        })
                                                    });
                                                return ce(fy, {
                                                    source: n,
                                                    payloads: r
                                                })
                                            }), c = ce(fg, {
                                                subBatches: l
                                            }), [4, fetch("".concat(this.baseUrl, "/v1/events/optimized"), {
                                                method: "POST",
                                                headers: {
                                                    "Content-Type": "application/x-protobuf",
                                                    "Content-Encoding": "gzip"
                                                },
                                                body: fc(cV(fg, c, {
                                                    writeUnknownFields: !1
                                                })),
                                                credentials: "include",
                                                keepalive: !0
                                            })];
                                        case 1:
                                            if (!(f = d.sent()).ok) throw Error("status ".concat(f.status));
                                            return [3, 3];
                                        case 2:
                                            return console.error("EventStream failed to send batch events:", d.sent()), [3, 3];
                                        case 3:
                                            return [2]
                                    }
                                })
                            }).call(this)
                        }
                    }]), e
                }();

            function fE() {
                return null != eF || (eF = "".concat(sy().apiGatewayUrl.replace(/\/$/, ""), "/experience-signals-ingest/public")), eF
            }
            var fS = function() {};

            function fw(e, t) {
                fetch("".concat(fE()).concat(e), {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/x-protobuf"
                    },
                    body: t,
                    credentials: "include",
                    keepalive: !0
                }).catch(fS)
            }

            function fT(e, t) {
                rN(function() {
                    var e, n, r, a, i, o, u, s, l, c, f, d, p;
                    return rA(this, function(v) {
                        switch (v.label) {
                            case 0:
                                if ("u" < typeof CompressionStream) return [2, {
                                    body: t.buffer,
                                    compressed: !1
                                }];
                                return (n = (e = new CompressionStream("gzip")).writable.getWriter()).write(t).catch(fS), n.close().catch(fS), r = [], [4, (a = e.readable.getReader()).read()];
                            case 1:
                                i = v.sent(), v.label = 2;
                            case 2:
                                if (i.done) return [3, 4];
                                return r.push(i.value), [4, a.read()];
                            case 3:
                                return i = v.sent(), [3, 2];
                            case 4:
                                o = new Uint8Array(r.reduce(function(e, t) {
                                    return e + t.length
                                }, 0)), u = 0, s = !0, l = !1, c = void 0;
                                try {
                                    for (f = r[Symbol.iterator](); !(s = (d = f.next()).done); s = !0) p = d.value, o.set(p, u), u += p.length
                                } catch (e) {
                                    l = !0, c = e
                                } finally {
                                    try {
                                        s || null == f.return || f.return()
                                    } finally {
                                        if (l) throw c
                                    }
                                }
                                return [2, {
                                    body: o.buffer,
                                    compressed: !0
                                }]
                        }
                    })
                })().then(function(t) {
                    var n = t.body,
                        r = t.compressed,
                        a = {
                            "Content-Type": "application/x-protobuf"
                        };
                    return r && (a["Content-Encoding"] = "gzip"), fetch("".concat(fE()).concat(e), {
                        method: "POST",
                        headers: a,
                        body: n,
                        credentials: "include",
                        keepalive: !0
                    })
                }).catch(fS)
            }
            var fI = function(e, t) {
                    return e << 3 | t
                },
                fN = fI(1, 2),
                fA = fI(2, 2),
                fk = fI(5, 2),
                fx = fI(6, 2),
                fR = fI(8, 2),
                fO = fI(1, 2),
                fV = fI(2, 1),
                fC = fI(3, 0),
                fZ = fI(5, 2),
                fB = fI(1, 2),
                fL = fI(2, 1),
                fF = fI(3, 0),
                fP = fI(4, 2),
                fX = fI(5, 2),
                fU = fI(6, 0),
                fW = fI(8, 2),
                fD = fI(4, 0),
                fY = fI(6, 2),
                fG = fI(7, 2),
                fj = fI(1, 0),
                fM = fI(2, 2),
                fz = fI(1, 2),
                fJ = fI(2, 2),
                fK = fI(1, 2),
                fH = fI(1, 2),
                fQ = fI(2, 2),
                fq = fI(1, 2),
                f$ = "eventstream.enginetelemetry.EngineTelemetryBatchEvent",
                f0 = new TextEncoder,
                f1 = function() {
                    function e() {
                        e1(this, e), eD(this, "buf", [])
                    }
                    return e3(e, [{
                        key: "writeVarint",
                        value: function(e) {
                            var t = (void 0 === e ? "undefined" : (0, e8._)(e)) === "bigint" ? e : BigInt(Math.trunc(e));
                            for (t < BigInt(0) && (t += BigInt(1) << BigInt(64)); t > BigInt(127);) this.buf.push(128 | Number(t & BigInt(127))), t >>= BigInt(7);
                            this.buf.push(Number(t))
                        }
                    }, {
                        key: "writeString",
                        value: function(e) {
                            var t = f0.encode(e);
                            this.writeVarint(t.length);
                            var n = !0,
                                r = !1,
                                a = void 0;
                            try {
                                for (var i, o = t[Symbol.iterator](); !(n = (i = o.next()).done); n = !0) {
                                    var u = i.value;
                                    this.buf.push(u)
                                }
                            } catch (e) {
                                r = !0, a = e
                            } finally {
                                try {
                                    n || null == o.return || o.return()
                                } finally {
                                    if (r) throw a
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
                                for (var a, i = e[Symbol.iterator](); !(t = (a = i.next()).done); t = !0) {
                                    var o = a.value;
                                    this.buf.push(o)
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

            function f2(e, t, n) {
                var r = new f1;
                return r.writeVarint(fI(1, 2)), r.writeString(e), r.writeVarint(t), n(r), r.toBytes()
            }

            function f3(e) {
                var t = new f1,
                    n = !0,
                    r = !1,
                    a = void 0;
                try {
                    for (var i, o = Object.entries(e)[Symbol.iterator](); !(n = (i = o.next()).done); n = !0) ! function() {
                        var e = eK(i.value, 2),
                            n = e[0],
                            r = e[1];
                        if ("string" == typeof r) {
                            var a = f2(n, fI(2, 2), function(e) {
                                e.writeString(r)
                            });
                            t.writeVarint(fk), t.writeBytes(a)
                        } else if ("boolean" == typeof r) {
                            var o = f2(n, fI(2, 0), function(e) {
                                e.writeVarint(+!!r)
                            });
                            t.writeVarint(fx), t.writeBytes(o)
                        } else if ((void 0 === r ? "undefined" : (0, e8._)(r)) === "bigint") {
                            var u = f2(n, fI(2, 0), function(e) {
                                e.writeVarint(r)
                            });
                            t.writeVarint(fA), t.writeBytes(u)
                        } else if ("number" == typeof r)
                            if (Number.isFinite(r))
                                if (Number.isInteger(r) && r >= -0x80000000 && r <= 0x7fffffff) {
                                    var s = f2(n, fI(2, 0), function(e) {
                                        e.writeVarint(r)
                                    });
                                    t.writeVarint(fN), t.writeBytes(s)
                                } else if (Number.isInteger(r)) {
                            var l = f2(n, fI(2, 0), function(e) {
                                e.writeVarint(BigInt(r))
                            });
                            t.writeVarint(fA), t.writeBytes(l)
                        } else {
                            var c = f2(n, fI(2, 1), function(e) {
                                e.writeDouble(r)
                            });
                            t.writeVarint(fR), t.writeBytes(c)
                        } else {
                            var f = f2(n, fI(2, 2), function(e) {
                                e.writeString(String(r))
                            });
                            t.writeVarint(fk), t.writeBytes(f)
                        }
                    }()
                } catch (e) {
                    r = !0, a = e
                } finally {
                    try {
                        n || null == o.return || o.return()
                    } finally {
                        if (r) throw a
                    }
                }
                return t.toBytes()
            }

            function f5(e) {
                var t = new f1;
                if (t.writeVarint(fO), t.writeString(e.name), t.writeVarint(fV), t.writeDouble(e.value), t.writeVarint(fC), t.writeVarint(e.timestampMs), e.attributes && Object.keys(e.attributes).length > 0) {
                    var n = f3(e.attributes);
                    t.writeVarint(fZ), t.writeBytes(n)
                }
                return t.toBytes()
            }

            function f9(e) {
                var t = new f1;
                if (t.writeVarint(fB), t.writeString(e.name), t.writeVarint(fL), t.writeDouble(e.sum), t.writeVarint(fF), t.writeVarint(e.count), e.countsInBuckets.length > 0) {
                    var n = new f1,
                        r = !0,
                        a = !1,
                        i = void 0;
                    try {
                        for (var o, u = e.countsInBuckets[Symbol.iterator](); !(r = (o = u.next()).done); r = !0) {
                            var s = o.value;
                            n.writeVarint(s)
                        }
                    } catch (e) {
                        a = !0, i = e
                    } finally {
                        try {
                            r || null == u.return || u.return()
                        } finally {
                            if (a) throw i
                        }
                    }
                    var l = n.toBytes();
                    t.writeVarint(fP), t.writeBytes(l)
                }
                if (e.bucketIndices.length > 0) {
                    var c = new f1,
                        f = !0,
                        d = !1,
                        p = void 0;
                    try {
                        for (var v, m = e.bucketIndices[Symbol.iterator](); !(f = (v = m.next()).done); f = !0) {
                            var h = v.value;
                            c.writeVarint(h)
                        }
                    } catch (e) {
                        d = !0, p = e
                    } finally {
                        try {
                            f || null == m.return || m.return()
                        } finally {
                            if (d) throw p
                        }
                    }
                    var g = c.toBytes();
                    t.writeVarint(fX), t.writeBytes(g)
                }
                if (t.writeVarint(fU), t.writeVarint(e.timestampMs), e.attributes && Object.keys(e.attributes).length > 0) {
                    var y = f3(e.attributes);
                    t.writeVarint(fW), t.writeBytes(y)
                }
                return t.toBytes()
            }

            function f4(e, t, n) {
                var r = new f1;
                r.writeVarint(fD), r.writeVarint(n);
                var a = !0,
                    i = !1,
                    o = void 0;
                try {
                    for (var u, s = e[Symbol.iterator](); !(a = (u = s.next()).done); a = !0) {
                        var l = u.value;
                        r.writeVarint(fY), r.writeBytes(l)
                    }
                } catch (e) {
                    i = !0, o = e
                } finally {
                    try {
                        a || null == s.return || s.return()
                    } finally {
                        if (i) throw o
                    }
                }
                var c = !0,
                    f = !1,
                    d = void 0;
                try {
                    for (var p, v = t[Symbol.iterator](); !(c = (p = v.next()).done); c = !0) {
                        var m = p.value;
                        r.writeVarint(fG), r.writeBytes(m)
                    }
                } catch (e) {
                    f = !0, d = e
                } finally {
                    try {
                        c || null == v.return || v.return()
                    } finally {
                        if (f) throw d
                    }
                }
                return r.toBytes()
            }

            function f8(e, t, n, r, a) {
                var i = new f1;
                i.writeVarint(fj), i.writeVarint(r), i.writeVarint(fM), i.writeString(a), i.writeVarint(fD), i.writeVarint(n);
                var o = !0,
                    u = !1,
                    s = void 0;
                try {
                    for (var l, c = e[Symbol.iterator](); !(o = (l = c.next()).done); o = !0) {
                        var f = l.value;
                        i.writeVarint(fY), i.writeBytes(f)
                    }
                } catch (e) {
                    u = !0, s = e
                } finally {
                    try {
                        o || null == c.return || c.return()
                    } finally {
                        if (u) throw s
                    }
                }
                var d = !0,
                    p = !1,
                    v = void 0;
                try {
                    for (var m, h = t[Symbol.iterator](); !(d = (m = h.next()).done); d = !0) {
                        var g = m.value;
                        i.writeVarint(fG), i.writeBytes(g)
                    }
                } catch (e) {
                    p = !0, v = e
                } finally {
                    try {
                        d || null == h.return || h.return()
                    } finally {
                        if (p) throw v
                    }
                }
                return i.toBytes()
            }

            function f6(e) {
                var t = new f1;
                t.writeVarint(fz), t.writeString(f$), t.writeVarint(fJ), t.writeBytes(e);
                var n = t.toBytes(),
                    r = new f1;
                return r.writeVarint(fK), r.writeBytes(n), r.toBytes()
            }

            function f7(e) {
                var t = new f1;
                t.writeVarint(fH), t.writeString(f$);
                var n = !0,
                    r = !1,
                    a = void 0;
                try {
                    for (var i, o = e[Symbol.iterator](); !(n = (i = o.next()).done); n = !0) {
                        var u = i.value;
                        t.writeVarint(fQ), t.writeBytes(u)
                    }
                } catch (e) {
                    r = !0, a = e
                } finally {
                    try {
                        n || null == o.return || o.return()
                    } finally {
                        if (r) throw a
                    }
                }
                var s = t.toBytes(),
                    l = new f1;
                return l.writeVarint(fq), l.writeBytes(s), l.toBytes()
            }
            var de = /^[a-zA-Z_][a-zA-Z0-9_]*$/;

            function dt(e) {
                return de.test(e)
            }
            var dn = [],
                dr = !1,
                da = !1;

            function di() {
                var e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0],
                    t = !0,
                    n = !1,
                    r = void 0;
                try {
                    for (var a, i = dn[Symbol.iterator](); !(t = (a = i.next()).done); t = !0)(0, a.value)(e)
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
            var du = globalThis.window,
                ds = globalThis.document,
                dl = globalThis.navigator,
                dc = void 0 === ds ? void 0 : ds,
                df = null == (void 0 === du ? void 0 : du) || void 0 === dl ? void 0 : dl,
                dd = function() {
                    if (null == dc) return sd;
                    var e = dc.querySelector('meta[name="device-meta"]');
                    if (null != e) {
                        var t, n = sf.safeParse(e.dataset);
                        if (n.success) return eG(eY({}, n.data), {
                            browser: "unknown" === n.data.browser ? sp(null != (t = null == df ? void 0 : df.userAgent) ? t : "") : n.data.browser
                        })
                    }
                    return sd
                },
                dp = function(e, t) {
                    var n, r, a = null != (n = t.flushIntervalMs) ? n : 5e3;

                    function i(e, n) {
                        t.onError ? t.onError(e, n) : console.error(e, n)
                    }
                    if (!dt(e)) return i('@rbx/web-telemetry: invalid featureName "'.concat(e, '"'), {
                            name: e
                        }),
                        function() {};
                    var o = new Map;

                    function u() {
                        var e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
                        if (0 !== o.size) {
                            var t = o;
                            o = new Map;
                            var n = BigInt(Date.now()),
                                r = Array.from(t.values(), function(e) {
                                    var t = function(e) {
                                            var t = [],
                                                n = [],
                                                r = !0,
                                                a = !1,
                                                i = void 0;
                                            try {
                                                for (var o, u = e[Symbol.iterator](); !(r = (o = u.next()).done); r = !0) {
                                                    var s = eK(o.value, 2),
                                                        l = s[0],
                                                        c = s[1];
                                                    c > 0 && (t.push(l), n.push(BigInt(c)))
                                                }
                                            } catch (e) {
                                                a = !0, i = e
                                            } finally {
                                                try {
                                                    r || null == u.return || u.return()
                                                } finally {
                                                    if (a) throw i
                                                }
                                            }
                                            return {
                                                bucketIndices: t,
                                                countsInBuckets: n
                                            }
                                        }(e.bucketCounts),
                                        r = t.bucketIndices,
                                        a = t.countsInBuckets;
                                    return {
                                        name: e.name,
                                        sum: e.sum,
                                        count: BigInt(e.count),
                                        bucketIndices: r,
                                        countsInBuckets: a,
                                        timestampMs: n,
                                        attributes: e.attributes
                                    }
                                }),
                                a = BigInt(1),
                                i = "u" > typeof crypto && "function" == typeof crypto.randomUUID ? crypto.randomUUID() : "web-telemetry-".concat(Date.now(), "-").concat(Math.random().toString(16).slice(2));
                            e || da || "u" > typeof document && "hidden" === document.visibilityState ? fw("/v1/events/optimized", f7([f8([], r.map(f9), n, a, i)]).buffer) : fT("/v1/events/optimized", f7([f8([], r.map(f9), n, a, i)]))
                        }
                    }
                    return dn.push(u), dr || ("u" > typeof document && document.addEventListener("visibilitychange", function() {
                            "hidden" === document.visibilityState && di()
                        }), "u" > typeof window && window.addEventListener("beforeunload", function() {
                            da = !0, di()
                        }), dr = !0),
                        function(t, n, s) {
                            var l, c = "".concat(e, "_").concat(t);
                            if (! function(e, t) {
                                    if (!dt(e)) return !1;
                                    if (t) {
                                        var n = !0,
                                            r = !1,
                                            a = void 0;
                                        try {
                                            for (var i, o = Object.keys(t)[Symbol.iterator](); !(n = (i = o.next()).done); n = !0) {
                                                var u = i.value;
                                                if (!dt(u)) return !1
                                            }
                                        } catch (e) {
                                            r = !0, a = e
                                        } finally {
                                            try {
                                                n || null == o.return || o.return()
                                            } finally {
                                                if (r) throw a
                                            }
                                        }
                                    }
                                    return !0
                                }(c, n)) return void i("@rbx/web-telemetry: invalid event name or attribute key", {
                                name: t
                            });
                            var f = null != s ? s : 0;
                            if (!Number.isFinite(f)) return void i("@rbx/web-telemetry: value must be a finite number", {
                                name: t
                            });
                            var d = n && Object.keys(n).length > 0 ? n : void 0,
                                p = function(e, t) {
                                    if (!t || 0 === Object.keys(t).length) return e;
                                    var n = Object.keys(t).sort().map(function(e) {
                                        return "".concat(e, "=").concat(t[e])
                                    }).join("&");
                                    return "".concat(e, "|").concat(n)
                                }(c, d),
                                v = o.get(p);
                            v || (v = {
                                name: c,
                                attributes: d,
                                sum: 0,
                                count: 0,
                                bucketCounts: new Map
                            }, o.set(p, v)), v.sum += f, v.count += 1;
                            var m = function(e) {
                                if (e <= 0) return -1;
                                if (e < 1e-4) return 1;
                                if (e > 1e11) return 272;
                                var t = Math.log10(e),
                                    n = Math.floor((t - -4) * 18);
                                return 1e-9 > Math.abs((t - -4) * 18 - n) && n > 0 && (n -= 1), n + 2
                            }(f);
                            v.bucketCounts.set(m, (null != (l = v.bucketCounts.get(m)) ? l : 0) + 1),
                                function e() {
                                    void 0 === r && (r = setTimeout(function() {
                                        r = void 0, u(), o.size > 0 && e()
                                    }, a))
                                }()
                        }
                }("WWW_PageTelemetry", {}),
                dv = {
                    ServerList: .001,
                    Home: .003,
                    Profile: .003,
                    GameDetail: .004,
                    Friends: .004,
                    Settings: .006,
                    Login: .015,
                    GroupDetails: .015,
                    LeanerRobuxRedesignModel: .02,
                    robuxRedesign: .025,
                    ConfigurePrivateServer: .025,
                    Avatar: .025,
                    Support: .1,
                    GroupSearch: .1,
                    VerifyEmail: .1,
                    NotApproved: .1,
                    PostPurchase: .1,
                    CrossDeviceLoginConfirmCode: .15,
                    PreAuthLanding_NonAPAC: .15,
                    RefundAgreementPage: .15,
                    MobileAppCreateAccount: .15,
                    PaymentMethods: .15,
                    ShopGiftCards: .2,
                    VirtualEventDetails: .2,
                    BundleDetail: .25,
                    SecurityFeedback: .25,
                    Redeem: .25,
                    giftCardsLanding: .5,
                    PreAuthLanding_Three_Sorts: .5,
                    Create_Community: .5,
                    SafetySupportPage: .5,
                    CreditCardVerificationPage: .5,
                    ModerationPortalPage: 1,
                    Abuse_Report_Platform: 1,
                    AccountSwitcherIframe: 1,
                    AvatarUpsell: 1,
                    BraintreePayment: 1,
                    GiftingProducts: 1,
                    LoginRedirect: 1,
                    LookDetail: 1,
                    NativeAdsList: 1,
                    NuveiPayment: 1,
                    PreAuthLanding: 1,
                    PreAuthLanding_APAC: 1,
                    ResetPassword: 1,
                    SecurityNotification: 1,
                    Sitemap: 1,
                    SongDetails: 1,
                    SupportCenter: 1,
                    SupportedBrowsers: 1,
                    XsollaPayment: 1,
                    SduiLandingPage_action: 1,
                    SduiLandingPage_adventure: 1,
                    SduiLandingPage_education: 1,
                    SduiLandingPage_first_person_shooters: 1,
                    SduiLandingPage_horror: 1,
                    SduiLandingPage_party_casual: 1,
                    SduiLandingPage_puzzle: 1,
                    SduiLandingPage_roleplaying_games: 1,
                    SduiLandingPage_shooter: 1,
                    SduiLandingPage_simulation: 1,
                    SduiLandingPage_social: 1,
                    SduiLandingPage_sports: 1,
                    SduiLandingPage_strategy: 1,
                    SduiLandingPage_survival: 1,
                    SduiLandingPage_the_hunt_roblox_20: 1
                },
                dm = /[^A-Za-z0-9_]/g,
                dh = {
                    ttfb: "TTFB",
                    fcp: "FCP",
                    lcp: "LCP",
                    inp: "INP",
                    cls: "CLS"
                };

            function dg(e) {
                return new Promise(function(t, n) {
                    e.oncomplete = e.onsuccess = function() {
                        return t(e.result)
                    }, e.onabort = e.onerror = function() {
                        return n(e.error)
                    }
                })
            }

            function dy(e) {
                return dg(e.getAllKeys())
            }

            function db(e) {
                var t;

                function n() {
                    var n, r, a, i;
                    return void 0 == t && (n = e.dbName || "sentry-offline", r = e.storeName || "queue", (a = indexedDB.open(n)).onupgradeneeded = function() {
                        return a.result.createObjectStore(r)
                    }, i = dg(a), t = function(e) {
                        return i.then(function(t) {
                            return e(t.transaction(r, "readwrite").objectStore(r))
                        })
                    }), t
                }
                return {
                    push: function(t) {
                        return rN(function() {
                            var r;
                            return rA(this, function(a) {
                                switch (a.label) {
                                    case 0:
                                        var i, o;
                                        return a.trys.push([0, 2, , 3]), r = rc(t), [4, (i = n(), o = e.maxQueueSize || 30, i(function(e) {
                                            return dy(e).then(function(t) {
                                                var n;
                                                if (!(t.length >= o)) return e.put(r, (n = Math).max.apply(n, e9(t).concat([0])) + 1), dg(e.transaction)
                                            })
                                        }))];
                                    case 1:
                                    case 2:
                                        return a.sent(), [3, 3];
                                    case 3:
                                        return [2]
                                }
                            })
                        })()
                    },
                    unshift: function(t) {
                        return rN(function() {
                            var r;
                            return rA(this, function(a) {
                                switch (a.label) {
                                    case 0:
                                        var i, o;
                                        return a.trys.push([0, 2, , 3]), r = rc(t), [4, (i = n(), o = e.maxQueueSize || 30, i(function(e) {
                                            return dy(e).then(function(t) {
                                                var n;
                                                if (!(t.length >= o)) return e.put(r, (n = Math).min.apply(n, e9(t).concat([0])) - 1), dg(e.transaction)
                                            })
                                        }))];
                                    case 1:
                                    case 2:
                                        return a.sent(), [3, 3];
                                    case 3:
                                        return [2]
                                }
                            })
                        })()
                    },
                    shift: function() {
                        return rN(function() {
                            var e;
                            return rA(this, function(t) {
                                switch (t.label) {
                                    case 0:
                                        return t.trys.push([0, 2, , 3]), [4, n()(function(e) {
                                            return dy(e).then(function(t) {
                                                var n = t[0];
                                                if (null != n) return dg(e.get(n)).then(function(t) {
                                                    return e.delete(n), dg(e.transaction).then(function() {
                                                        return t
                                                    })
                                                })
                                            })
                                        })];
                                    case 1:
                                        if (e = t.sent()) return [2, function(e) {
                                            var t = "string" == typeof e ? rl(e) : e;

                                            function n(e) {
                                                var n = t.subarray(0, e);
                                                return t = t.subarray(e + 1), n
                                            }

                                            function r() {
                                                var e, r, a = t.indexOf(10);
                                                return a < 0 && (a = t.length), JSON.parse((e = n(a), (r = e$(eQ)).decodePolyfill ? r.decodePolyfill(e) : new TextDecoder().decode(e)))
                                            }
                                            for (var a = r(), i = []; t.length;) {
                                                var o = r(),
                                                    u = "number" == typeof o.length ? o.length : void 0;
                                                i.push([o, u ? n(u) : r()])
                                            }
                                            return [a, i]
                                        }(e)];
                                        return [3, 3];
                                    case 2:
                                        return t.sent(), [3, 3];
                                    case 3:
                                        return [2, void 0]
                                }
                            })
                        })()
                    }
                }
            }
            var d_ = "MULTIPLEXED_TRANSPORT_EXTRA_KEY";

            function dE(e, t) {
                var n;
                return ru(e, function(e, r) {
                    return t.includes(r) && (n = Array.isArray(e) ? e[1] : void 0), !!n
                }), n
            }
            var dS = window.Roblox["core-lib"].url.index,
                dw = [/get663\.com/i, /\bg663/i],
                dT = [/extensions\//i, /^chrome(-extensions?)?:\/\//i, /^moz-extension:\/\//i, /^safari(-web)?-extension:\/\//i, /^blob:/i, /^https?:\/\/arkoselabs\.(roblox\.com|sitetest\d\.robloxlabs\.com)\//i, /^https?:\/\/([a-z0-9-]+\.)*(arkoselabs|funcaptcha)\.com\//i].concat(e9(dw)),
                dI = e9(dw).concat([/Failed to fetch \(get663\.com\)/i, /WKWebView API client did not respond to this postMessage/i, /ResizeObserver loop limit exceeded/i, /ResizeObserver loop completed with undelivered notifications/i, /^Script error\.?$/i, /Non-Error promise rejection captured with value: (undefined|null)$/i]),
                dN = /^(?:Failed to fetch|Load failed|NetworkError when attempting to fetch resource\.) \(([^)]+)\)$/i,
                dA = e9(dS.defaultUrlOptions.domainAllowlist).concat([".rbxcdn.com", ".simulpong.com"]),
                dk = /^\/[a-z]{2}(?:-[a-z]{2})\//i,
                dx = /^\/home\/?$/i,
                dR = /^\/users\/[^/]+\/profile/i,
                dO = /^\/users\/[^/]+\/friends/i,
                dV = /^\/communities\/[^/]+\/[^/]+/i,
                dC = /^\/mobile-app-upgrades\/.*/i,
                dZ = /^\/upgrades\/.*/i,
                dB = /^\/login-redirect(?:\/[^?]*)?(?:\?.*)?$/i,
                dL = /^\/(?:[^/]+\/)?download$/i,
                dF = /^\/spotlight\/.*/i,
                dP = function(e) {
                    return e < 0 ? 0 : e > 1 ? 1 : e
                };

            function dX(e) {
                return (e || "").toLowerCase().replace(dk, "/")
            }

            function dU(e, t) {
                var n;
                return dx.test(e) && (n = dP(.1 * t)), dR.test(e) && (n = dP(.2 * t)), dO.test(e) && (n = dP(.2 * t)), dV.test(e) && (n = dP(.2 * t)), dC.test(e) && (n = .005), dZ.test(e) && (n = .005), dB.test(e) && (n = 1), dL.test(e) && (n = 1), dF.test(e) && (n = .1), null != n ? n : t
            }
            var dW = [],
                dD = ["css.rbxcdn.com", "static.rbxcdn.com", "js.rbxcdn.com", "tr.rbxcdn.com", "metrics.roblox.com", "images.rbxcdn.com"],
                dY = [".woff2", ".woff"],
                dG = new Set(["resource.link", "resource.script", "resource.css", "resource.img", "resource.iframe"]),
                dj = [],
                dM = !1,
                dz = !1;

            function dJ(e, t) {
                var n = e.map(function(e) {
                        return {
                            name: e.name,
                            value: e.value,
                            timestampMs: e.timestampMs,
                            attributes: e.attributes
                        }
                    }),
                    r = BigInt(Date.now());
                !0 === t || dz || "u" > typeof document && "hidden" === document.visibilityState ? fw("/v1/events/single", f6(f4(n.map(f5), [], r)).buffer) : fT("/v1/events/single", f6(f4(n.map(f5), [], r)))
            }

            function dK() {
                var e = !0,
                    t = !1,
                    n = void 0;
                try {
                    for (var r, a = dj[Symbol.iterator](); !(e = (r = a.next()).done); e = !0) {
                        var i = r.value.splice(0);
                        0 !== i.length && dJ(i, !0)
                    }
                } catch (e) {
                    t = !0, n = e
                } finally {
                    try {
                        e || null == a.return || a.return()
                    } finally {
                        if (t) throw n
                    }
                }
            }
            var dH = function(e) {
                    var t, n = Math.max(1, 10),
                        r = 250;

                    function a(e, t) {
                        console.error(e, t)
                    }
                    if (!dt(e)) return a('@rbx/web-telemetry: invalid featureName "'.concat(e, '"'), {
                            name: e
                        }),
                        function() {};
                    var i = [];
                    return dj.push(i), dM || ("u" > typeof document && document.addEventListener("visibilitychange", function() {
                            "hidden" === document.visibilityState && dK()
                        }), "u" > typeof window && window.addEventListener("beforeunload", function() {
                            dz = !0, dK()
                        }), dM = !0),
                        function(o, u, s) {
                            var l = "".concat(e, "_").concat(o);
                            if (! function(e, t) {
                                    if (!dt(e)) return !1;
                                    if (t) {
                                        var n = !0,
                                            r = !1,
                                            a = void 0;
                                        try {
                                            for (var i, o = Object.keys(t)[Symbol.iterator](); !(n = (i = o.next()).done); n = !0) {
                                                var u = i.value;
                                                if (!dt(u)) return !1
                                            }
                                        } catch (e) {
                                            r = !0, a = e
                                        } finally {
                                            try {
                                                n || null == o.return || o.return()
                                            } finally {
                                                if (r) throw a
                                            }
                                        }
                                    }
                                    return !0
                                }(l, u)) return void a("@rbx/web-telemetry: invalid event name or attribute key", {
                                name: o,
                                attributes: u
                            });
                            var c = null != s ? s : 1;
                            if (!Number.isFinite(c)) return void a("@rbx/web-telemetry: value must be a finite number", {
                                name: o,
                                attributes: u
                            });
                            var f = u && Object.keys(u).length > 0 ? u : void 0;
                            i.push({
                                name: l,
                                attributes: f,
                                value: c,
                                timestampMs: BigInt(Date.now())
                            }), i.length >= n ? (void 0 !== t && (clearTimeout(t), t = void 0), dJ(i.splice(0, n))) : void 0 === t && (t = setTimeout(function() {
                                for (t = void 0; i.length > 0;) dJ(i.splice(0, n))
                            }, r))
                        }
                }("WWW_PageTelemetry"),
                dQ = new Set(["ServerList"]),
                dq = function() {
                    var e = document.querySelector('meta[name="page-meta"]');
                    return null == e ? void 0 : e.dataset.internalPageName
                },
                d$ = function() {
                    try {
                        var e = dq();
                        e && !dQ.has(e) && dH("PageViewed", {
                            internalPageName: e
                        })
                    } catch (e) {}
                };
            "loading" === document.readyState ? document.addEventListener("DOMContentLoaded", d$) : d$(), "u" > typeof window && (window.Sentry = {
                startSpan: function(e, t) {
                    var n = ni(eq());
                    if (n.startSpan) return n.startSpan(e, t);
                    var r = rE(e),
                        a = e.forceTransaction,
                        i = e.parentSpan,
                        o = e.scope;
                    return ns(null == o ? void 0 : o.clone(), function() {
                        var n;
                        return (void 0 !== (n = i) ? function(e) {
                            return rb(n, e)
                        } : function(e) {
                            return e()
                        })(function() {
                            var n, o = no(),
                                u = rw(o, i),
                                s = nl(),
                                l = e.onlyIfParent && !u,
                                c = l ? new rr : r_({
                                    parentSpan: u,
                                    spanArguments: r,
                                    forceTransaction: a,
                                    scope: o
                                });
                            return l && (null == s || s.recordDroppedEvent("no_parent_span", "span")), n = c, (0, eW._)(n, rr) && "ignored" === n.dropReason && u || tM(o, c),
                                function(e, t) {
                                    var n, r, a, i, o, u = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : function() {},
                                        s = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : function() {};
                                    try {
                                        o = e()
                                    } catch (e) {
                                        throw t(e), u(), e
                                    }
                                    return n = o, r = t, a = u, i = s, ts(n) ? t6(n, function(e) {
                                        a(), i(e)
                                    }, function(e) {
                                        r(e), a()
                                    }) : (a(), i(n), n)
                                }(function() {
                                    return t(c)
                                }, function() {
                                    var e = nW(c).status;
                                    c.isRecording() && (!e || "ok" === e) && c.setStatus({
                                        code: 2,
                                        message: "internal_error"
                                    })
                                }, function() {
                                    c.end()
                                })
                        })
                    })
                },
                getActiveSpan: n1,
                flush: function(e) {
                    return rN(function() {
                        var t;
                        return rA(this, function(n) {
                            return (t = nl()) ? [2, t.flush(e)] : (e4 && tE.warn("Cannot flush events. No client defined."), [2, Promise.resolve(!1)])
                        })
                    })()
                },
                captureException: rB
            });
            var d0 = document.querySelector('meta[name="sentry-meta"]'),
                d1 = document.querySelector('meta[name="environment-meta"]'),
                d2 = null != (eU = null == d0 ? void 0 : d0.dataset) ? eU : {},
                d3 = d2.dsn,
                d5 = d2.envName,
                d9 = d2.sampleRate,
                d4 = d2.tracesSampleRate,
                d8 = null != d3 ? d3 : "https://24df60727c94bd0aa14ab1269d104a21@o293668.ingest.us.sentry.io/4509158985826304",
                d6 = (B = (Z = sh(window.location.hostname, null == d1 ? void 0 : d1.dataset)).production, L = Z.domainName, B ? "https://tracing.roblox.com/v1/traces" : null != (C = ({
                    sitetest1: "https://otel-collector-otlp-http-sitetest1-snc3.simulpong.com/v1/traces",
                    sitetest2: "https://otel-collector-otlp-http-sitetest2-snc2.simulpong.com/v1/traces",
                    sitetest3: sm
                })[L.toLowerCase()]) ? C : sm),
                d7 = sh(window.location.hostname, null == d1 ? void 0 : d1.dataset).production ? "https://bcafd66a36fdc3df18b1666ccfdbfaec@sentry-relay.rbxinfra.com/21" : "https://ee6f913759705f6d51358229e4278e56@sentry.stage.rbx.com/24",
                pe = null == d9 ? .001 : parseFloat(d9),
                pt = null == d4 ? 0 : parseFloat(d4),
                pn = 0 === pt,
                pr = !pn && (0, ua.isTestSite)(),
                pa = pr ? 1 : Math.min(pt, .008),
                pi = un.authenticatedUser,
                po = function() {
                    return document.querySelector('meta[name="page-meta"]')
                },
                pu = (0, ur.getDeviceMeta)(),
                ps = {
                    deviceInfo: {
                        deviceType: sf.shape.deviceType.parse(null == pu ? void 0 : pu.deviceType),
                        browser: sp(navigator.userAgent)
                    },
                    requestCountryCode: (s = null != (F = null == (P = null != (o = null == (u = document.querySelector('meta[name="request-context-data"]')) ? void 0 : u.dataset) ? o : null) ? void 0 : P.requestCountryCode) ? F : "", /^[A-Za-z]{2}$/.test(s) ? s.toUpperCase() : "")
                };
            ! function() {
                var e, t, n, r = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                    a = !r.skipBrowserExtensionCheck && !! function() {
                        if (void 0 === eQ.window || eQ.nw) return !1;
                        var e, t = eQ.chrome || eQ.browser;
                        if (!(null == t || null == (e = t.runtime) ? void 0 : e.id)) return !1;
                        var n = tp();
                        return !(eQ === eQ.top && /^(?:chrome-extension|moz-extension|ms-browser-extension|safari-web-extension):\/\//.test(n))
                    }() && (a7 && tg(function() {
                        console.error("[Sentry] You cannot use Sentry.init() in a browser extension, see: https://docs.sentry.io/platforms/javascript/best-practices/browser-extensions/")
                    }), !0),
                    i = null == r.defaultIntegrations ? [rJ(), {
                        name: "FunctionToString",
                        setupOnce: function() {
                            $ = Function.prototype.toString;
                            try {
                                Function.prototype.toString = function() {
                                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                    var r = tI(this),
                                        a = rQ.has(nl()) && void 0 !== r ? r : this;
                                    return $.apply(a, t)
                                }
                            } catch (e) {}
                        },
                        setup: function(e) {
                            rQ.set(e, !0)
                        }
                    }, {
                        name: "ConversationId",
                        setup: function(e) {
                            e.on("spanStart", function(e) {
                                var t = no().getScopeData(),
                                    n = nu().getScopeData(),
                                    r = t.conversationId || n.conversationId;
                                if (r) {
                                    var a = nW(e),
                                        i = a.op,
                                        o = a.data,
                                        u = a.description;
                                    if (!(null == i ? void 0 : i.startsWith("gen_ai.")) && !o["ai.operationId"] && !(null == u ? void 0 : u.startsWith("ai."))) return;
                                    e.setAttribute("gen_ai.conversation.id", r)
                                }
                            })
                        }
                    }, ir(), ie(), ih(), iS(), rq(), {
                        name: "HttpContext",
                        preprocessEvent: function(e) {
                            if (eQ.navigator || eQ.location || eQ.document) {
                                var t, n = aL(),
                                    r = eY({}, n.headers, null == (t = e.request) ? void 0 : t.headers);
                                e.request = eG(eY({}, n, e.request), {
                                    headers: r
                                })
                            }
                        }
                    }, {
                        name: "CultureContext",
                        preprocessEvent: function(e) {
                            var t, n = is();
                            n && (e.contexts = eG(eY({}, e.contexts), {
                                culture: eY({}, n, null == (t = e.contexts) ? void 0 : t.culture)
                            }))
                        },
                        processSegmentSpan: function(e) {
                            var t = is();
                            t && (e.attributes = eY({
                                "culture.locale": t.locale,
                                "culture.timezone": t.timezone,
                                "culture.calendar": t.calendar
                            }, e.attributes))
                        }
                    }, iu()] : r.defaultIntegrations,
                    o = eG(eY({}, r), {
                        enabled: !a && r.enabled,
                        stackParser: Array.isArray(t = r.stackParser || iV) ? tK.apply(void 0, e9(t)) : t,
                        integrations: function(e) {
                            var t, n, r = e.defaultIntegrations || [],
                                a = e.integrations;
                            if (r.forEach(function(e) {
                                    e.isDefaultInstance = !0
                                }), Array.isArray(a)) n = e9(r).concat(e9(a));
                            else if ("function" == typeof a) {
                                var i = a(r);
                                n = Array.isArray(i) ? i : [i]
                            } else n = r;
                            return t = {}, n.forEach(function(e) {
                                var n = e.name,
                                    r = t[n];
                                r && !r.isDefaultInstance && e.isDefaultInstance || (t[n] = e)
                            }), Object.values(t)
                        }({
                            integrations: r.integrations,
                            defaultIntegrations: i
                        }),
                        transport: r.transport || iL
                    });
                !0 === o.debug && (e4 ? tE.enable() : tg(function() {
                    console.warn("[Sentry] Cannot initialize SDK with `debug` option using a non-debug bundle.")
                })), no().update(o.initialScope), e = n = new aF(o), no().setClient(e), n.init()
            }({
                dsn: d8,
                integrations: [function() {
                    var e, t, n, r, a = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        i = function(e, n) {
                            var a = !(arguments.length > 2) || void 0 === arguments[2] || arguments[2],
                                i = "pageload" === n.op,
                                s = n.name,
                                l = h ? h(n) : n,
                                c = l.attributes || {};
                            if (s !== l.name && (c[nc] = "custom", l.attributes = c), !a) {
                                var f = tP();
                                ry(eG(eY({}, l), {
                                    startTime: f
                                })).end(f);
                                return
                            }
                            o.name = l.name, o.source = c[nc];
                            var d = iP(l, {
                                idleTimeout: g,
                                finalTimeout: y,
                                childSpanTimeout: b,
                                disableAutoFinish: i,
                                beforeSpanEnd: function(n) {
                                    null == t || t();
                                    var a = nT(e);
                                    ! function(e, t) {
                                        var n = oC(),
                                            r = tW();
                                        if ((null == n ? void 0 : n.getEntries) && r) {
                                            var a = t.spanStreamingEnabled,
                                                i = t.ignorePerformanceApiSpans,
                                                o = t.ignoreResourceSpans,
                                                u = t.recordClsOnPageloadSpan,
                                                s = t.recordLcpOnPageloadSpan,
                                                l = oZ(r),
                                                c = n.getEntries(),
                                                f = nW(e),
                                                d = f.op,
                                                p = f.start_timestamp;
                                            if (c.slice(oU).forEach(function(t) {
                                                    var n, r, a, u, s, c, f, v, m, h = oZ(t.startTime),
                                                        g = oZ(Math.max(0, t.duration));
                                                    if ("navigation" !== d || !p || !(l + h < p)) switch (t.entryType) {
                                                        case "navigation":
                                                            n = e, r = t, a = l, ["unloadEvent", "redirect", "domContentLoadedEvent", "loadEvent", "connect"].forEach(function(e) {
                                                                oD(n, r, e, a)
                                                            }), oD(n, r, "secureConnection", a, "TLS/SSL"), oD(n, r, "fetch", a, "cache"), oD(n, r, "domainLookup", a, "DNS"), u = n, s = r, f = (c = a) + oZ(s.requestStart), v = c + oZ(s.responseEnd), m = c + oZ(s.responseStart), s.responseEnd && (oO(u, f, v, {
                                                                op: "browser.request",
                                                                name: s.name,
                                                                attributes: eD({}, nv, "auto.ui.browser.metrics")
                                                            }), oO(u, m, v, {
                                                                op: "browser.response",
                                                                name: s.name,
                                                                attributes: eD({}, nv, "auto.ui.browser.metrics")
                                                            }));
                                                            break;
                                                        case "mark":
                                                        case "paint":
                                                        case "measure":
                                                            ! function(e, t, n, r, a, i) {
                                                                if (! function(e) {
                                                                        if ((null == e ? void 0 : e.entryType) === "measure") try {
                                                                            return "Components ⚛" === e.detail.devtools.track
                                                                        } catch (e) {
                                                                            return
                                                                        }
                                                                    }(t) && !(["mark", "measure"].includes(t.entryType) && t5(t.name, i))) {
                                                                    var o = iW(!1),
                                                                        u = a + Math.max(n, oZ(o ? o.requestStart : 0)),
                                                                        s = a + n,
                                                                        l = s + r,
                                                                        c = eD({}, nv, "auto.resource.browser.metrics");
                                                                    u !== s && (c["sentry.browser.measure_happened_before_request"] = !0, c["sentry.browser.measure_start_time"] = u),
                                                                        function(e, t) {
                                                                            try {
                                                                                var n = t.detail;
                                                                                if (!n) return;
                                                                                if ((void 0 === n ? "undefined" : (0, e8._)(n)) === "object") {
                                                                                    var r = !0,
                                                                                        a = !1,
                                                                                        i = void 0;
                                                                                    try {
                                                                                        for (var o, u = Object.entries(n)[Symbol.iterator](); !(r = (o = u.next()).done); r = !0) {
                                                                                            var s = eK(o.value, 2),
                                                                                                l = s[0],
                                                                                                c = s[1];
                                                                                            if (c && ti(c)) e["sentry.browser.measure.detail.".concat(l)] = c;
                                                                                            else if (void 0 !== c) try {
                                                                                                e["sentry.browser.measure.detail.".concat(l)] = JSON.stringify(c)
                                                                                            } catch (e) {}
                                                                                        }
                                                                                    } catch (e) {
                                                                                        a = !0, i = e
                                                                                    } finally {
                                                                                        try {
                                                                                            r || null == u.return || u.return()
                                                                                        } finally {
                                                                                            if (a) throw i
                                                                                        }
                                                                                    }
                                                                                    return
                                                                                }
                                                                                if (ti(n)) {
                                                                                    e["sentry.browser.measure.detail"] = n;
                                                                                    return
                                                                                }
                                                                                try {
                                                                                    e["sentry.browser.measure.detail"] = JSON.stringify(n)
                                                                                } catch (e) {}
                                                                            } catch (e) {}
                                                                        }(c, t), u <= l && oO(e, u, l, {
                                                                            name: t.name,
                                                                            op: t.entryType,
                                                                            attributes: c
                                                                        })
                                                                }
                                                            }(e, t, h, g, l, i);
                                                            var y = iK(),
                                                                b = t.startTime < y.firstHiddenTime;
                                                            "first-paint" === t.name && b && (oW.fp = {
                                                                value: t.startTime,
                                                                unit: "millisecond"
                                                            }), "first-contentful-paint" === t.name && b && (oW.fcp = {
                                                                value: t.startTime,
                                                                unit: "millisecond"
                                                            });
                                                            break;
                                                        case "resource":
                                                            ! function(e, t, n, r, a, i, o) {
                                                                if ("xmlhttprequest" !== t.initiatorType && "fetch" !== t.initiatorType) {
                                                                    var u = t.initiatorType ? "resource.".concat(t.initiatorType) : "resource.other";
                                                                    if (null == o || !o.includes(u)) {
                                                                        var s, l, c = eD({}, nv, "auto.resource.browser.metrics"),
                                                                            f = a0(n);
                                                                        f.protocol && (c["url.scheme"] = f.protocol.split(":").pop()), f.host && (c["server.address"] = f.host), c["url.same_origin"] = n.includes(eQ.location.origin), s = t, l = c, [
                                                                            ["responseStatus", "http.response.status_code"],
                                                                            ["transferSize", "http.response_transfer_size"],
                                                                            ["encodedBodySize", "http.response_content_length"],
                                                                            ["decodedBodySize", "http.decoded_response_content_length"],
                                                                            ["renderBlockingStatus", "resource.render_blocking_status"],
                                                                            ["deliveryType", "http.response_delivery_type"]
                                                                        ].forEach(function(e) {
                                                                            var t = eK(e, 2),
                                                                                n = t[0],
                                                                                r = t[1],
                                                                                a = s[n];
                                                                            null != a && ("number" == typeof a && a < 0x7fffffff || "string" == typeof a) && (l[r] = a)
                                                                        });
                                                                        var d = eY({}, c, oX(t)),
                                                                            p = i + r;
                                                                        oO(e, p, p + a, {
                                                                            name: n.replace(eQ.location.origin, ""),
                                                                            op: u,
                                                                            attributes: d
                                                                        })
                                                                    }
                                                                }
                                                            }(e, t, t.name, h, g, l, o)
                                                    }
                                                }), oU = Math.max(c.length - 1, 0), function(e, t) {
                                                    var n = eQ.navigator;
                                                    if (n) {
                                                        var r = n.connection;
                                                        r && (r.effectiveType && e.setAttribute(t ? "network.connection.effective_type" : "effectiveConnectionType", r.effectiveType), r.type && e.setAttribute(t ? "network.connection.type" : "connectionType", r.type), oR(r.rtt) && (oW["connection.rtt"] = {
                                                            value: r.rtt,
                                                            unit: "millisecond"
                                                        }, t && e.setAttribute("network.connection.rtt", r.rtt))), oR(n.deviceMemory) && (t ? e.setAttribute("device.memory.estimated_capacity", n.deviceMemory) : e.setAttribute("deviceMemory", "".concat(n.deviceMemory, " GB"))), oR(n.hardwareConcurrency) && (t ? e.setAttribute("device.processor_count", n.hardwareConcurrency) : e.setAttribute("hardwareConcurrency", String(n.hardwareConcurrency)))
                                                    }
                                                }(e, a), "pageload" === d) {
                                                if (function(e) {
                                                        var t = iW(!1);
                                                        if (t) {
                                                            var n = t.responseStart,
                                                                r = t.requestStart;
                                                            r <= n && (e["ttfb.requestTime"] = {
                                                                value: n - r,
                                                                unit: "millisecond"
                                                            })
                                                        }
                                                    }(oW), a) {
                                                    var v, m, h = function(t, n, r) {
                                                        var a = null != r ? r : "browser.web_vital.".concat(t, ".value");
                                                        e.setAttribute(a, n), iZ && tE.log("Setting web vital attribute", eD({}, a, n), "on pageload span")
                                                    };
                                                    ["ttfb", "fp", "fcp"].forEach(function(e) {
                                                        oW[e] && h(e, oW[e].value)
                                                    }), oW["ttfb.requestTime"] && h("ttfb.requestTime", oW["ttfb.requestTime"].value, "browser.web_vital.ttfb.request_time")
                                                } else {
                                                    u || delete oW.cls, s || delete oW.lcp, Object.entries(oW).forEach(function(e) {
                                                        var t = eK(e, 2),
                                                            n = t[0],
                                                            r = t[1];
                                                        ! function(e, t, n) {
                                                            var r, a = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : n1(),
                                                                i = a && n$(a);
                                                            i && (e4 && tE.log("[Measurement] Setting measurement on root span: ".concat(e, " = ").concat(t, " ").concat(n)), i.addEvent(e, (eD(r = {}, ng, t), eD(r, nh, n), r)))
                                                        }(n, r.value, r.unit)
                                                    }), v = e, m = t, el && m.recordLcpOnPageloadSpan && (el.element && v.setAttribute("lcp.element", td(el.element)), el.id && v.setAttribute("lcp.id", el.id), el.url && v.setAttribute("lcp.url", el.url.trim().slice(0, 200)), null != el.loadTime && v.setAttribute("lcp.loadTime", el.loadTime), null != el.renderTime && v.setAttribute("lcp.renderTime", el.renderTime), v.setAttribute("lcp.size", el.size)), (null == ec ? void 0 : ec.sources) && m.recordClsOnPageloadSpan && ec.sources.forEach(function(e, t) {
                                                        return v.setAttribute("cls.source.".concat(t + 1), td(e.node))
                                                    })
                                                }
                                                e.setAttribute(a ? "browser.performance.time_origin" : "performance.timeOrigin", l), e.setAttribute(a ? "browser.performance.navigation.activation_start" : "performance.activationStart", iD())
                                            }
                                            el = void 0, ec = void 0, oW = {}
                                        }
                                    }(n, {
                                        recordClsOnPageloadSpan: !a && !v,
                                        recordLcpOnPageloadSpan: !a && !m,
                                        ignoreResourceSpans: N,
                                        ignorePerformanceApiSpans: A,
                                        spanStreamingEnabled: a
                                    }), tw(e, ut, void 0);
                                    var o = no(),
                                        u = o.getPropagationContext();
                                    o.setPropagationContext(eG(eY({}, u), {
                                        traceId: d.spanContext().traceId,
                                        sampled: nM(d),
                                        dsc: rn(n)
                                    })), i && (r = void 0)
                                },
                                trimIdleSpanEndTimestamp: !C
                            });

                            function p() {
                                u && ["interactive", "complete"].includes(u.readyState) && e.emit("idleSpanEnableAutoFinish", d)
                            }
                            i && C && (r = d), tw(e, ut, d), i && !C && u && (u.addEventListener("readystatechange", function() {
                                p()
                            }), p())
                        };
                    "enableElementTiming" in a && tg(function() {
                        console.warn("[Sentry] `enableElementTiming` is deprecated and no longer has any effect. Use the standalone `elementTimingIntegration` instead.")
                    });
                    var o = {
                            name: void 0,
                            source: void 0
                        },
                        u = eQ.document,
                        s = eY({}, o6, a),
                        l = s.enableInp,
                        c = s.enableLongTask,
                        f = s.enableLongAnimationFrame,
                        d = s._experiments,
                        p = d.enableInteractions,
                        v = d.enableStandaloneClsSpans,
                        m = d.enableStandaloneLcpSpans,
                        h = s.beforeStartSpan,
                        g = s.idleTimeout,
                        y = s.finalTimeout,
                        b = s.childSpanTimeout,
                        _ = s.markBackgroundSpan,
                        E = s.traceFetch,
                        S = s.traceXHR,
                        w = s.trackFetchStreamPerformance,
                        T = s.shouldCreateSpanForRequest,
                        I = s.enableHTTPTimings,
                        N = s.ignoreResourceSpans,
                        A = s.ignorePerformanceApiSpans,
                        k = s.instrumentPageLoad,
                        x = s.instrumentNavigation,
                        R = s.detectRedirects,
                        O = s.linkPreviousTrace,
                        V = s.consistentTraceSampling,
                        C = s.enableReportPageLoaded,
                        Z = s.onRequestSpanStart,
                        B = s.onRequestSpanEnd,
                        L = !!(null == (e = eQ.navigator) ? void 0 : e.userAgent) && o8.test(e.userAgent);
                    return {
                        name: "BrowserTracing",
                        setup: function(e) {
                            if (L) {
                                a7 && tE.log("[Tracing] Skipping browserTracingIntegration setup for bot user agent.");
                                return
                            }

                            function a() {
                                var e = n1(),
                                    t = e && n$(e);
                                if (t) {
                                    var n = "internal_error";
                                    e4 && tE.log("[Tracing] Root span: ".concat(n, " -> Global error occurred")), t.setStatus({
                                        code: 2,
                                        message: n
                                    })
                                }
                            }
                            iX || (a.tag = "sentry_tracingErrorCallback", iX = !0, ic(a), iv(a));
                            var o, s = nT(e);
                            if (t = function(e) {
                                    var t = e.recordClsStandaloneSpans,
                                        n = e.recordLcpStandaloneSpans,
                                        r = e.client,
                                        a = oC();
                                    if (a && tW()) {
                                        a.mark && eQ.performance.mark("sentry-tracing-init");
                                        var i = n ? function(e) {
                                                var t, n = 0;
                                                if (oB("largest-contentful-paint")) {
                                                    var r = og(function(e) {
                                                        var r = e.metric,
                                                            a = r.entries[r.entries.length - 1];
                                                        a && oF(r.value) && (n = r.value, t = a)
                                                    }, !0);
                                                    oL(e, function(e, a) {
                                                        (function(e, t, n, r) {
                                                            if (oF(e)) {
                                                                iZ && tE.log("Sending LCP span (".concat(e, ")"));
                                                                var a, i, o = oZ((tW() || 0) + ((null == t ? void 0 : t.startTime) || 0)),
                                                                    u = no().getScopeData().transactionName,
                                                                    s = t ? td(t.element) : "Largest contentful paint",
                                                                    l = (eD(a = {}, nv, "auto.http.browser.lcp"), eD(a, np, "ui.webvital.lcp"), eD(a, n_, 0), eD(a, "sentry.pageload.span_id", n), eD(a, "sentry.report_event", r), a);
                                                                t && (t.element && (l["lcp.element"] = td(t.element)), t.id && (l["lcp.id"] = t.id), t.url && (l["lcp.url"] = t.url), null != t.loadTime && (l["lcp.loadTime"] = t.loadTime), null != t.renderTime && (l["lcp.renderTime"] = t.renderTime), null != t.size && (l["lcp.size"] = t.size));
                                                                var c = oV({
                                                                    name: s,
                                                                    transaction: u,
                                                                    attributes: l,
                                                                    startTime: o
                                                                });
                                                                c && (c.addEvent("lcp", (eD(i = {}, nh, "millisecond"), eD(i, ng, e), i)), c.end(o))
                                                            }
                                                        })(n, t, a, e), r()
                                                    })
                                                }
                                            }(r) : !1 === n ? og(function(e) {
                                                var t = e.metric,
                                                    n = t.entries[t.entries.length - 1];
                                                n && oF(t.value) && (oW.lcp = {
                                                    value: t.value,
                                                    unit: "millisecond"
                                                }, el = n)
                                            }, !0) : void 0,
                                            o = t ? function(e) {
                                                var t, n = 0;
                                                if (oB("layout-shift")) {
                                                    var r = oh(function(e) {
                                                        var r = e.metric,
                                                            a = r.entries[r.entries.length - 1];
                                                        a && (n = r.value, t = a)
                                                    }, !0);
                                                    oL(e, function(e, a) {
                                                        var i, o, u, s, l, c, f, d, p, v, m, h;
                                                        i = n, o = t, u = a, s = e, iZ && tE.log("Sending CLS span (".concat(i, ")")), d = o ? oZ((tW() || 0) + o.startTime) : tX(), p = no().getScopeData().transactionName, v = o ? td(null == (l = o.sources[0]) ? void 0 : l.node) : "Layout shift", m = (eD(c = {}, nv, "auto.http.browser.cls"), eD(c, np, "ui.webvital.cls"), eD(c, n_, 0), eD(c, "sentry.pageload.span_id", u), eD(c, "sentry.report_event", s), c), (null == o ? void 0 : o.sources) && o.sources.forEach(function(e, t) {
                                                            m["cls.source.".concat(t + 1)] = td(e.node)
                                                        }), (h = oV({
                                                            name: v,
                                                            transaction: p,
                                                            attributes: m,
                                                            startTime: d
                                                        })) && (h.addEvent("cls", (eD(f = {}, nh, ""), eD(f, ng, i), f)), h.end(d)), r()
                                                    })
                                                }
                                            }(r) : !1 === t ? oh(function(e) {
                                                var t = e.metric,
                                                    n = t.entries[t.entries.length - 1];
                                                n && (oW.cls = {
                                                    value: t.value,
                                                    unit: ""
                                                }, ec = n)
                                            }, !0) : void 0,
                                            u = oI("ttfb", function(e) {
                                                var t = e.metric;
                                                t.entries[t.entries.length - 1] && (oW.ttfb = {
                                                    value: t.value,
                                                    unit: "millisecond"
                                                })
                                            }, ow, eu);
                                        return function() {
                                            u(), null == i || i(), null == o || o()
                                        }
                                    }
                                    return function() {}
                                }({
                                    recordClsStandaloneSpans: s ? void 0 : v || !1,
                                    recordLcpStandaloneSpans: s ? void 0 : m || !1,
                                    client: e
                                }), s) {
                                var d, h = 0;
                                if (oB("largest-contentful-paint")) {
                                    var g = og(function(e) {
                                        var t = e.metric,
                                            n = t.entries[t.entries.length - 1];
                                        n && oF(t.value) && (h = t.value, d = n)
                                    }, !0);
                                    oL(e, function(e, t, n) {
                                        (function(e, t, n, r) {
                                            if (oF(e)) {
                                                iZ && tE.log("Sending LCP span (".concat(e, ")"));
                                                var a = tW() || 0,
                                                    i = oZ(a),
                                                    o = oZ(a + ((null == t ? void 0 : t.startTime) || 0)),
                                                    u = t ? td(t.element) : "Largest contentful paint",
                                                    s = {};
                                                (null == t ? void 0 : t.element) && (s["browser.web_vital.lcp.element"] = td(t.element)), (null == t ? void 0 : t.id) && (s["browser.web_vital.lcp.id"] = t.id), (null == t ? void 0 : t.url) && (s["browser.web_vital.lcp.url"] = t.url), (null == t ? void 0 : t.loadTime) != null && (s["browser.web_vital.lcp.load_time"] = t.loadTime), (null == t ? void 0 : t.renderTime) != null && (s["browser.web_vital.lcp.render_time"] = t.renderTime), (null == t ? void 0 : t.size) != null && (s["browser.web_vital.lcp.size"] = t.size), oK({
                                                    name: u,
                                                    op: "ui.webvital.lcp",
                                                    origin: "auto.http.browser.lcp",
                                                    metricName: "lcp",
                                                    value: e,
                                                    attributes: s,
                                                    parentSpan: n,
                                                    reportEvent: r,
                                                    startTime: i,
                                                    endTime: o
                                                })
                                            }
                                        })(h, d, n, e), g()
                                    })
                                }
                                var y, b = 0;
                                if (oB("layout-shift")) {
                                    var _ = oh(function(e) {
                                        var t = e.metric,
                                            n = t.entries[t.entries.length - 1];
                                        n && (b = t.value, y = n)
                                    }, !0);
                                    oL(e, function(e, t, n) {
                                        var r, a, i, o, u, s, l, c;
                                        r = b, a = y, i = n, o = e, iZ && tE.log("Sending CLS span (".concat(r, ")")), s = a ? oZ((tW() || 0) + a.startTime) : tX(), l = a ? td(null == (u = a.sources[0]) ? void 0 : u.node) : "Layout shift", c = {}, (null == a ? void 0 : a.sources) && a.sources.forEach(function(e, t) {
                                            c["browser.web_vital.cls.source.".concat(t + 1)] = td(e.node)
                                        }), oK({
                                            name: l,
                                            op: "ui.webvital.cls",
                                            origin: "auto.http.browser.cls",
                                            metricName: "cls",
                                            value: r,
                                            attributes: c,
                                            parentSpan: i,
                                            reportEvent: o,
                                            startTime: s
                                        }), _()
                                    })
                                }
                                l && oC() && tW() && oy(function(e) {
                                    var t = e.metric;
                                    if (!(null == t.value || oZ(t.value) > 60)) {
                                        var n, r, a, i, o, u, s, l, c, f, d, p, v = t.entries.find(function(e) {
                                            return e.duration === t.value && oz[e.name]
                                        });
                                        v && (n = t.value, r = v, iZ && tE.log("Sending INP span (".concat(n, ")")), o = oZ(tW() + r.startTime), u = oZ(n), s = oz[r.name], l = null != (a = r.interactionId) ? oj.get(a) : void 0, f = (c = n1()) ? n$(c) : void 0, p = (d = (null == l ? void 0 : l.span) || f) ? nD(d).name : no().getScopeData().transactionName, oK({
                                            name: (null == l ? void 0 : l.elementName) || td(r.target),
                                            op: "ui.interaction.".concat(s),
                                            origin: "auto.http.browser.inp",
                                            metricName: "inp",
                                            value: n,
                                            attributes: (eD(i = {}, n_, r.duration), eD(i, "sentry.transaction", p), i),
                                            startTime: o,
                                            endTime: o + u,
                                            parentSpan: d
                                        }))
                                    }
                                })
                            } else l && function() {
                                if (oC() && tW()) void oy(oJ)
                            }();
                            if (f && eQ.PerformanceObserver && (null == (o = PerformanceObserver.supportedEntryTypes) ? void 0 : o.includes("long-animation-frame")) ? new PerformanceObserver(function(e) {
                                    var t = n1();
                                    if (t) {
                                        var n = !0,
                                            r = !1,
                                            a = void 0;
                                        try {
                                            for (var i, o = e.getEntries()[Symbol.iterator](); !(n = (i = o.next()).done); n = !0) {
                                                var u = i.value;
                                                if (u.scripts[0]) {
                                                    var s = oZ(tW() + u.startTime),
                                                        l = nW(t),
                                                        c = l.start_timestamp,
                                                        f = l.op;
                                                    if ("navigation" !== f || !c || !(s < c)) {
                                                        var d = oZ(u.duration),
                                                            p = eD({}, nv, "auto.ui.browser.metrics"),
                                                            v = u.scripts[0],
                                                            m = v.invoker,
                                                            h = v.invokerType,
                                                            g = v.sourceURL,
                                                            y = v.sourceFunctionName,
                                                            b = v.sourceCharPosition;
                                                        p["browser.script.invoker"] = m, p["browser.script.invoker_type"] = h, g && (p["code.filepath"] = g), y && (p["code.function"] = y), -1 !== b && (p["browser.script.source_char_position"] = b), oO(t, s, s + d, {
                                                            name: "Main UI thread blocked",
                                                            op: "ui.long-animation-frame",
                                                            attributes: p
                                                        })
                                                    }
                                                }
                                            }
                                        } catch (e) {
                                            r = !0, a = e
                                        } finally {
                                            try {
                                                n || null == o.return || o.return()
                                            } finally {
                                                if (r) throw a
                                            }
                                        }
                                    }
                                }).observe({
                                    type: "long-animation-frame",
                                    buffered: !0
                                }) : c && ob("longtask", function(e) {
                                    var t = e.entries,
                                        n = n1();
                                    if (n) {
                                        var r = nW(n),
                                            a = r.op,
                                            i = r.start_timestamp,
                                            o = !0,
                                            u = !1,
                                            s = void 0;
                                        try {
                                            for (var l, c = t[Symbol.iterator](); !(o = (l = c.next()).done); o = !0) {
                                                var f = l.value,
                                                    d = oZ(tW() + f.startTime),
                                                    p = oZ(f.duration);
                                                "navigation" === a && i && d < i || oO(n, d, d + p, {
                                                    name: "Main UI thread blocked",
                                                    op: "ui.long-task",
                                                    attributes: eD({}, nv, "auto.ui.browser.metrics")
                                                })
                                            }
                                        } catch (e) {
                                            u = !0, s = e
                                        } finally {
                                            try {
                                                o || null == c.return || c.return()
                                            } finally {
                                                if (u) throw s
                                            }
                                        }
                                    }
                                }), p && ob("event", function(e) {
                                    var t = e.entries,
                                        n = n1();
                                    if (n) {
                                        var r = !0,
                                            a = !1,
                                            i = void 0;
                                        try {
                                            for (var o, u = t[Symbol.iterator](); !(r = (o = u.next()).done); r = !0) {
                                                var s = o.value;
                                                if ("click" === s.name) {
                                                    var l = oZ(tW() + s.startTime),
                                                        c = oZ(s.duration),
                                                        f = {
                                                            name: td(s.target),
                                                            op: "ui.interaction.".concat(s.name),
                                                            startTime: l,
                                                            attributes: eD({}, nv, "auto.ui.browser.metrics")
                                                        },
                                                        d = tv(s.target);
                                                    d && (f.attributes["ui.component_name"] = d), oO(n, l, l + c, f)
                                                }
                                            }
                                        } catch (e) {
                                            a = !0, i = e
                                        } finally {
                                            try {
                                                r || null == u.return || u.return()
                                            } finally {
                                                if (a) throw i
                                            }
                                        }
                                    }
                                }), R && u) {
                                var E = function() {
                                    n = tX()
                                };
                                addEventListener("click", E, {
                                    capture: !0
                                }), addEventListener("keydown", E, {
                                    capture: !0,
                                    passive: !0
                                })
                            }

                            function S() {
                                var t = e[ut];
                                t && !nW(t).timestamp && (a7 && tE.log("[Tracing] Finishing current active span with op: ".concat(nW(t).op)), t.setAttribute(nm, "cancelled"), t.end())
                            }
                            e.on("startNavigationSpan", function(t, r) {
                                if (nl() === e) {
                                    if (null == r ? void 0 : r.isRedirect) {
                                        a7 && tE.warn("[Tracing] Detected redirect, navigation span will not be the root span, but a child span."), i(e, eY({
                                            op: "navigation.redirect"
                                        }, t), !1);
                                        return
                                    }
                                    n = void 0, S(), nu().setPropagationContext({
                                        traceId: tV(),
                                        sampleRand: Math.random(),
                                        propagationSpanId: nE() ? void 0 : tG()
                                    });
                                    var a = no();
                                    a.setPropagationContext({
                                        traceId: tV(),
                                        sampleRand: Math.random(),
                                        propagationSpanId: nE() ? void 0 : tG()
                                    }), a.setSDKProcessingMetadata({
                                        normalizedRequest: void 0
                                    }), i(e, eG(eY({
                                        op: "navigation"
                                    }, t), {
                                        parentSpan: null,
                                        forceTransaction: !0
                                    }))
                                }
                            }), e.on("startPageLoadSpan", function(t) {
                                var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                                if (nl() === e) {
                                    S();
                                    var r = function(e, t) {
                                            var n = function(e) {
                                                    if (e) {
                                                        var t, n = e.match(nC);
                                                        if (n) return "1" === n[3] ? t = !0 : "0" === n[3] && (t = !1), {
                                                            traceId: n[1],
                                                            parentSampled: t,
                                                            parentSpanId: n[2]
                                                        }
                                                    }
                                                }(e),
                                                r = nO(t);
                                            if (!(null == n ? void 0 : n.traceId)) return {
                                                traceId: tV(),
                                                sampleRand: tR()
                                            };
                                            var a = function(e, t) {
                                                var n = nI(null == t ? void 0 : t.sample_rand);
                                                if (void 0 !== n) return n;
                                                var r = nI(null == t ? void 0 : t.sample_rate);
                                                return r && (null == e ? void 0 : e.parentSampled) !== void 0 ? e.parentSampled ? tR() * r : r + tR() * (1 - r) : tR()
                                            }(n, r);
                                            return r && (r.sample_rand = a.toString()), {
                                                traceId: n.traceId,
                                                parentSpanId: n.parentSpanId,
                                                sampled: n.parentSampled,
                                                dsc: r || {},
                                                sampleRand: a
                                            }
                                        }(n.sentryTrace || o7("sentry-trace") || ue("sentry-trace"), n.baggage || o7("baggage") || ue("baggage")),
                                        a = no();
                                    a.setPropagationContext(r), nE() || (a.getPropagationContext().propagationSpanId = tG()), a.setSDKProcessingMetadata({
                                        normalizedRequest: aL()
                                    }), i(e, eY({
                                        op: "pageload"
                                    }, t))
                                }
                            }), e.on("endPageloadSpan", function() {
                                C && r && (r.setAttribute(nm, "reportPageLoaded"), r.end())
                            })
                        },
                        afterAllSetup: function(e) {
                            if (!L) {
                                var t, r, a, i, u, s, c = tp();
                                if ("off" !== O && (h = (m = {
                                        linkPreviousTrace: O,
                                        consistentTraceSampling: V
                                    }).linkPreviousTrace, N = m.consistentTraceSampling, C = (A = "session-storage" === h) ? function() {
                                        try {
                                            var e, t = null == (e = eQ.sessionStorage) ? void 0 : e.getItem(oH);
                                            return JSON.parse(t)
                                        } catch (e) {
                                            return
                                        }
                                    }() : void 0, e.on("spanStart", function(e) {
                                        if (n$(e) === e) {
                                            var t = no().getPropagationContext();
                                            C = function(e, t, n) {
                                                var r = nW(t),
                                                    a = {
                                                        spanContext: t.spanContext(),
                                                        startTimestamp: r.start_timestamp,
                                                        sampleRate: function() {
                                                            try {
                                                                var e, t, a;
                                                                return null != (e = Number(null == (t = n.dsc) ? void 0 : t.sample_rate)) ? e : Number(null == (a = r.data) ? void 0 : a[nf])
                                                            } catch (e) {
                                                                return 0
                                                            }
                                                        }(),
                                                        sampleRand: n.sampleRand
                                                    };
                                                if (!e) return a;
                                                var i = e.spanContext;
                                                return i.traceId === r.trace_id ? e : (Date.now() / 1e3 - e.startTimestamp <= 3600 && (a7 && tE.log("Adding previous_trace `".concat(JSON.stringify(i), "` link to span `").concat(JSON.stringify(eY({
                                                    op: r.op
                                                }, t.spanContext())), "`")), t.addLink({
                                                    context: i,
                                                    attributes: eD({}, "sentry.link.type", "previous_trace")
                                                }), t.setAttribute("sentry.previous_trace", "".concat(i.traceId, "-").concat(i.spanId, "-").concat(+!!oQ(i)))), a)
                                            }(C, e, t), A && function(e) {
                                                try {
                                                    eQ.sessionStorage.setItem(oH, JSON.stringify(e))
                                                } catch (e) {
                                                    a7 && tE.warn("Could not store previous trace in sessionStorage", e)
                                                }
                                            }(C)
                                        }
                                    }), F = !0, N && e.on("beforeSampling", function(e) {
                                        if (C) {
                                            var t = no(),
                                                n = t.getPropagationContext();
                                            if (F && n.parentSpanId) {
                                                F = !1;
                                                return
                                            }
                                            t.setPropagationContext(eG(eY({}, n), {
                                                dsc: eG(eY({}, n.dsc), {
                                                    sample_rate: String(C.sampleRate),
                                                    sampled: String(oQ(C.spanContext))
                                                }),
                                                sampleRand: C.sampleRand
                                            })), e.parentSampled = oQ(C.spanContext), e.parentSampleRate = C.sampleRate, e.spanAttributes = eG(eY({}, e.spanAttributes), eD({}, nd, C.sampleRate))
                                        }
                                    })), eQ.location) {
                                    if (k) {
                                        var f, d, v, m, h, N, A, C, F, P, X = tW();
                                        f = e, d = {
                                            name: eQ.location.pathname,
                                            startTime: X ? X / 1e3 : void 0,
                                            attributes: (eD(P = {}, nc, "url"), eD(P, nv, "auto.pageload.browser"), P)
                                        }, f.emit("startPageLoadSpan", d, void 0), no().setTransactionName(d.name), (v = f[ut]) && f.emit("afterStartPageLoadSpan", v)
                                    }
                                    x && a8(function(t) {
                                        var r, a, i, o, u, s, l, f, d, p, v, m = t.to;
                                        if (void 0 === t.from && (null == c ? void 0 : c.indexOf(m)) !== -1) {
                                            c = void 0;
                                            return
                                        }
                                        c = void 0;
                                        var h = a$(m),
                                            g = e[ut],
                                            y = g && R && (r = g, a = n, i = nW(r), !((o = tP()) - i.start_timestamp > 1.5) && (!a || !(o - a <= 1.5)));
                                        u = e, s = {
                                            name: (null == h ? void 0 : h.pathname) || eQ.location.pathname,
                                            attributes: (eD(v = {}, nc, "url"), eD(v, nv, "auto.navigation.browser"), v)
                                        }, f = (l = {
                                            url: m,
                                            isRedirect: y
                                        }).url, d = l.isRedirect, u.emit("beforeStartNavigationSpan", s, {
                                            isRedirect: d
                                        }), u.emit("startNavigationSpan", s, {
                                            isRedirect: d
                                        }), (p = no()).setTransactionName(s.name), f && !d && p.setSDKProcessingMetadata({
                                            normalizedRequest: eG(eY({}, aL()), {
                                                url: f
                                            })
                                        }), u[ut]
                                    })
                                }
                                _ && (eQ.document ? eQ.document.addEventListener("visibilitychange", function() {
                                        var e = n1();
                                        if (e) {
                                            var t = n$(e);
                                            if (eQ.document.hidden && t) {
                                                var n = "cancelled",
                                                    r = nW(t),
                                                    a = r.op,
                                                    i = r.status;
                                                a7 && tE.log("[Tracing] Transaction: ".concat(n, " -> since tab moved to the background, op: ").concat(a)), i || t.setStatus({
                                                    code: 2,
                                                    message: n
                                                }), t.setAttribute("sentry.cancellation_reason", "document.hidden"), t.end()
                                            }
                                        }
                                    }) : a7 && tE.warn("[Tracing] Could not set up background tab detection due to lack of global document")), p && (t = e, r = g, a = y, i = b, u = o, eQ.document && addEventListener("click", function() {
                                        var e = "ui.action.click",
                                            n = t[ut];
                                        if (n && ["navigation", "pageload"].includes(nW(n).op)) {
                                            a7 && tE.warn("[Tracing] Did not create ".concat(e, " span because a pageload or navigation span is in progress."));
                                            return
                                        }
                                        if (s && (s.setAttribute(nm, "interactionInterrupted"), s.end(), s = void 0), !u.name) {
                                            a7 && tE.warn("[Tracing] Did not create ".concat(e, " transaction because _latestRouteName is missing."));
                                            return
                                        }
                                        s = iP({
                                            name: u.name,
                                            op: e,
                                            attributes: eD({}, nc, u.source || "url")
                                        }, {
                                            idleTimeout: r,
                                            finalTimeout: a,
                                            childSpanTimeout: i
                                        })
                                    }, {
                                        capture: !0
                                    })), l && function() {
                                        var e, t = Object.keys(oz);

                                        function n(e) {
                                            var t = e.target;
                                            if (t) {
                                                var n = td(t),
                                                    r = Math.round(e.timeStamp);
                                                if (oM.set(r, n), oM.size > 50) {
                                                    var a = oM.keys().next().value;
                                                    void 0 !== a && oM.delete(a)
                                                }
                                            }
                                        }
                                        "u" > typeof window && (!(0, oY.w)() || (null == (e = eQ.process) ? void 0 : e.type) === "renderer") && t.forEach(function(e) {
                                            eQ.addEventListener(e, n, {
                                                capture: !0,
                                                passive: !0
                                            })
                                        });
                                        var r = function(e) {
                                            var t = e.entries,
                                                n = n1(),
                                                r = n && n$(n);
                                            t.forEach(function(e) {
                                                if ("duration" in e) {
                                                    var t = e.interactionId;
                                                    if (null != t && !oj.has(t)) {
                                                        var n = e.target ? td(e.target) : function(e) {
                                                            var t = Math.round(e.startTime),
                                                                n = oM.get(t);
                                                            if (!n)
                                                                for (var r = -5; r <= 5; r++) {
                                                                    var a = oM.get(t + r);
                                                                    if (a) {
                                                                        n = a;
                                                                        break
                                                                    }
                                                                }
                                                            return n || "<unknown>"
                                                        }(e);
                                                        if (oG.length > 10) {
                                                            var a = oG.shift();
                                                            oj.delete(a)
                                                        }
                                                        oG.push(t), oj.set(t, {
                                                            span: r,
                                                            elementName: n
                                                        })
                                                    }
                                                }
                                            })
                                        };
                                        ob("event", r), ob("first-input", r)
                                    }(),
                                    function(e, t) {
                                        var n = eY({}, o9, t),
                                            r = n.traceFetch,
                                            a = n.traceXHR,
                                            i = n.trackFetchStreamPerformance,
                                            o = n.shouldCreateSpanForRequest,
                                            u = n.enableHTTPTimings,
                                            s = n.tracePropagationTargets,
                                            l = n.onRequestSpanStart,
                                            c = n.onRequestSpanEnd,
                                            f = "function" == typeof o ? o : function(e) {
                                                return !0
                                            },
                                            d = function(e) {
                                                return function(e, t) {
                                                    var n = tp();
                                                    if (n) {
                                                        try {
                                                            r = new URL(e, n), a = new URL(n).origin
                                                        } catch (e) {
                                                            return !1
                                                        }
                                                        var r, a, i = r.origin === a;
                                                        return t ? t5(r.toString(), t) || i && t5(r.pathname, t) : i
                                                    }
                                                    var o = !!e.match(/^\/(?!\/)/);
                                                    return t ? t5(e, t) : o
                                                }(e, s)
                                            },
                                            p = {},
                                            v = e.getOptions().propagateTraceparent;
                                        r && (e.addEventProcessor(function(e) {
                                            return "transaction" === e.type && e.spans && e.spans.forEach(function(e) {
                                                if ("http.client" === e.op) {
                                                    var t = o5.get(e.span_id);
                                                    t && (e.timestamp = t / 1e3, o5.delete(e.span_id))
                                                }
                                            }), e
                                        }), i && (aU("fetch-body-resolved", function(e) {
                                            if (e.response) {
                                                var t = o3.get(e.response);
                                                t && e.endTimestamp && o5.set(t, e.endTimestamp)
                                            }
                                        }), aW("fetch-body-resolved", function() {
                                            return aM(az)
                                        })), aj(function(t) {
                                            var n = function(e, t, n, r, a) {
                                                if (e.fetchData) {
                                                    var i = e.fetchData,
                                                        o = i.method,
                                                        u = i.url,
                                                        s = nE() && t(u);
                                                    if (e.endTimestamp) {
                                                        var l, c, f, d, p, v = e.fetchData.__span;
                                                        if (!v) return;
                                                        var m = r[v];
                                                        m && (s && (function(e, t) {
                                                            if (t.response) {
                                                                nN(e, t.response.status);
                                                                var n, r, a = null == (r = t.response) || null == (n = r.headers) ? void 0 : n.get("content-length");
                                                                if (a) {
                                                                    var i = parseInt(a);
                                                                    i > 0 && e.setAttribute("http.response_content_length", i)
                                                                }
                                                            } else t.error && e.setStatus({
                                                                code: 2,
                                                                message: "internal_error"
                                                            });
                                                            e.end()
                                                        }(m, e), l = m, c = e, null == (p = (void 0 === (f = a) ? "undefined" : (0, e8._)(f)) === "object" && null !== f ? f.onRequestSpanEnd : void 0) || p(l, {
                                                            headers: null == (d = c.response) ? void 0 : d.headers,
                                                            error: c.error
                                                        })), delete r[v]);
                                                        return
                                                    }
                                                    var h = (void 0 === a ? "undefined" : (0, e8._)(a)) === "object" ? a : {
                                                            spanOrigin: a
                                                        },
                                                        g = h.spanOrigin,
                                                        y = h.propagateTraceparent,
                                                        b = nl(),
                                                        _ = !!n1(),
                                                        E = s && _ ? ry(function(e, t, n) {
                                                            if (e.startsWith("data:")) {
                                                                var r = a1(e);
                                                                return {
                                                                    name: "".concat(t, " ").concat(r),
                                                                    attributes: o0(e, void 0, t, n)
                                                                }
                                                            }
                                                            var a = a$(e),
                                                                i = a ? function(e) {
                                                                    if (aq(e)) return e.pathname;
                                                                    var t = new URL(e);
                                                                    return t.search = "", t.hash = "", ["80", "443"].includes(t.port) && (t.port = ""), t.password && (t.password = "%filtered%"), t.username && (t.username = "%filtered%"), t.toString()
                                                                }(a) : e;
                                                            return {
                                                                name: "".concat(t, " ").concat(i),
                                                                attributes: o0(e, a, t, n)
                                                            }
                                                        }(u, o, void 0 === g ? "auto.http.browser" : g)) : new rr;
                                                    if (s && !_ && (null == b || b.recordDroppedEvent("no_parent_span", "span")), e.fetchData.__span = E.spanContext().spanId, r[E.spanContext().spanId] = E, n(e.fetchData.url)) {
                                                        var S = e.args[0],
                                                            w = eY({}, e.args[1] || {}),
                                                            T = function(e, t, n, r) {
                                                                var a = oq({
                                                                        span: n,
                                                                        propagateTraceparent: r
                                                                    }),
                                                                    i = a["sentry-trace"],
                                                                    o = a.baggage,
                                                                    u = a.traceparent;
                                                                if (i) {
                                                                    var s, l, c = t.headers || (tf(e) ? e.headers : void 0);
                                                                    if (!c) return eY({}, a);
                                                                    if (s = c, "u" > typeof Headers && tl(s, Headers)) {
                                                                        var f = new Headers(c);
                                                                        if (f.get("sentry-trace") || f.set("sentry-trace", i), r && u && !f.get("traceparent") && f.set("traceparent", u), o) {
                                                                            var d = f.get("baggage");
                                                                            d ? o$(d) || f.set("baggage", "".concat(d, ",").concat(o)) : f.set("baggage", o)
                                                                        }
                                                                        return f
                                                                    }
                                                                    if (Array.isArray(l = c) && l.every(function(e) {
                                                                            return Array.isArray(e) && 2 === e.length && "string" == typeof e[0]
                                                                        })) {
                                                                        var p = e9(c);
                                                                        p.find(function(e) {
                                                                            return "sentry-trace" === e[0]
                                                                        }) || p.push(["sentry-trace", i]), r && u && !p.find(function(e) {
                                                                            return "traceparent" === e[0]
                                                                        }) && p.push(["traceparent", u]);
                                                                        var v = c.find(function(e) {
                                                                            return "baggage" === e[0] && "string" == typeof e[1] && o$(e[1])
                                                                        });
                                                                        return o && !v && p.push(["baggage", o]), p
                                                                    } else {
                                                                        var m = "sentry-trace" in c ? c["sentry-trace"] : void 0,
                                                                            h = "traceparent" in c ? c.traceparent : void 0,
                                                                            g = "baggage" in c ? c.baggage : void 0,
                                                                            y = g ? Array.isArray(g) ? e9(g) : [g] : [],
                                                                            b = g && (Array.isArray(g) ? g.find(function(e) {
                                                                                return o$(e)
                                                                            }) : o$(g));
                                                                        o && !b && y.push(o);
                                                                        var _ = Object.assign({}, c, {
                                                                            "sentry-trace": null != m ? m : i,
                                                                            baggage: y.length > 0 ? y.join(",") : void 0
                                                                        });
                                                                        return r && u && !h && (_.traceparent = u), _
                                                                    }
                                                                }
                                                            }(S, w, nE() && _ ? E : void 0, void 0 !== y && y);
                                                        T && (e.args[1] = w, w.headers = T)
                                                    }
                                                    if (b) {
                                                        var I = {
                                                            input: e.args,
                                                            response: e.response,
                                                            startTimestamp: e.startTimestamp,
                                                            endTimestamp: e.endTimestamp
                                                        };
                                                        b.emit("beforeOutgoingRequestSpan", E, I)
                                                    }
                                                    return E
                                                }
                                            }(t, f, d, p, {
                                                propagateTraceparent: v,
                                                onRequestSpanEnd: c
                                            });
                                            if (t.response && t.fetchData.__span && o3.set(t.response, t.fetchData.__span), n) {
                                                var r = o1(t.fetchData.url),
                                                    a = r ? a0(r).host : void 0;
                                                n.setAttributes({
                                                    "http.url": r ? a1(r) : void 0,
                                                    "server.address": a
                                                }), u && o4(n, e), null == l || l(n, {
                                                    headers: t.headers
                                                })
                                            }
                                        })), a && a9(function(t) {
                                            var n, r = function(e, t, n, r, a, i) {
                                                var o, u = e.xhr,
                                                    s = null == u ? void 0 : u[a5];
                                                if (u && !u.__sentry_own_request__ && s) {
                                                    var l, c, f, d, p, v, m = s.url,
                                                        h = s.method,
                                                        g = nE() && t(m);
                                                    if (e.endTimestamp) {
                                                        var y = u.__sentry_xhr_span_id__;
                                                        if (!y) return;
                                                        var b = r[y];
                                                        b && (g && void 0 !== s.status_code && (nN(b, s.status_code), b.end(), null == i || i(b, {
                                                            headers: o2(function(e) {
                                                                var t;
                                                                try {
                                                                    t = e.getAllResponseHeaders()
                                                                } catch (t) {
                                                                    return iZ && tE.error(t, "Failed to get xhr response headers", e), {}
                                                                }
                                                                return t ? t.split("\r\n").reduce(function(e, t) {
                                                                    var n = eK(t.split(": "), 2),
                                                                        r = n[0],
                                                                        a = n[1];
                                                                    return a && (e[r.toLowerCase()] = a), e
                                                                }, {}) : {}
                                                            }(u)),
                                                            error: e.error
                                                        })), delete r[y]);
                                                        return
                                                    }
                                                    var _ = o1(m),
                                                        E = _ ? a0(_) : a0(m),
                                                        S = a1(m.split(/[?#]/, 1)[0]),
                                                        w = nl(),
                                                        T = !!n1(),
                                                        I = g && T ? ry({
                                                            name: "".concat(h, " ").concat(S),
                                                            attributes: eY((eD(o = {
                                                                url: a1(m),
                                                                type: "xhr",
                                                                "http.method": h,
                                                                "http.url": _ ? a1(_) : void 0,
                                                                "server.address": null == E ? void 0 : E.host
                                                            }, nv, "auto.http.browser"), eD(o, np, "http.client"), o), (null == E ? void 0 : E.search) && {
                                                                "http.query": null == E ? void 0 : E.search
                                                            }, (null == E ? void 0 : E.hash) && {
                                                                "http.fragment": null == E ? void 0 : E.hash
                                                            })
                                                        }) : new rr;
                                                    return g && !T && (null == w || w.recordDroppedEvent("no_parent_span", "span")), u.__sentry_xhr_span_id__ = I.spanContext().spanId, r[u.__sentry_xhr_span_id__] = I, n(m) && (l = u, c = nE() && T ? I : void 0, d = (f = oq({
                                                        span: c,
                                                        propagateTraceparent: a
                                                    }))["sentry-trace"], p = f.baggage, v = f.traceparent, d && function(e, t, n, r) {
                                                        var a, i = null == (a = e.__sentry_xhr_v3__) ? void 0 : a.request_headers;
                                                        if ((null == i || !i["sentry-trace"]) && e.setRequestHeader) try {
                                                            if (e.setRequestHeader("sentry-trace", t), !r || (null == i ? void 0 : i.traceparent) || e.setRequestHeader("traceparent", r), n) {
                                                                var o = null == i ? void 0 : i.baggage;
                                                                o && o.split(",").some(function(e) {
                                                                    return e.trim().startsWith("sentry-")
                                                                }) || e.setRequestHeader("baggage", n)
                                                            }
                                                        } catch (e) {}
                                                    }(l, d, p, v)), w && w.emit("beforeOutgoingRequestSpan", I, e), I
                                                }
                                            }(t, f, d, p, v, c);
                                            r && (u && o4(r, e), null == l || l(r, {
                                                headers: o2(null == (n = t.xhr.__sentry_xhr_v3__) ? void 0 : n.request_headers)
                                            }))
                                        })
                                    }(e, {
                                        traceFetch: E,
                                        traceXHR: S,
                                        trackFetchStreamPerformance: w,
                                        tracePropagationTargets: e.getOptions().tracePropagationTargets,
                                        shouldCreateSpanForRequest: T,
                                        enableHTTPTimings: I,
                                        onRequestSpanStart: Z,
                                        onRequestSpanEnd: B
                                    })
                            }
                        }
                    }
                }({
                    detectRedirects: !0
                })],
                environment: null != d5 ? d5 : "staging",
                tracesSampleRate: pa,
                tracesSampler: pn ? void 0 : function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                        n = dP(e);
                    return function(e) {
                        return void 0 !== e.parentSampled ? +!!e.parentSampled : t ? n : dU(dX(e.name || ("u" > typeof window ? window.location.pathname : "") || ""), n)
                    }
                }(pa, pr),
                sampleRate: (U = pe < 0 ? 0 : pe > 1 ? 1 : pe, W = window.location.pathname.replace(/^\/[a-z]{2}(?:-[a-z]{2})\//i, "/"), void 0 !== (D = null == (X = Object.values({
                    PreAuthLandingPageRegex: {
                        pattern: /^\/$/i,
                        sampleRate: 1
                    },
                    PaymentTeamPagesRegex: {
                        pattern: /^\/(?:upgrades|redeem)(?:\/|$)/i,
                        sampleRate: 1
                    },
                    SpotlightPageRegex: {
                        pattern: /^\/spotlight\/.*/i,
                        sampleRate: 1
                    }
                }).find(function(e) {
                    return e.pattern.test(W)
                })) ? void 0 : X.sampleRate) ? D : U),
                replaysOnErrorSampleRate: pe,
                denyUrls: dT,
                ignoreErrors: dI,
                beforeSend: function(e) {
                    var t, n, r, a, i, o;
                    return (o = null != (n = null == (r = (t = e).breadcrumbs) ? void 0 : r.map(function(e) {
                        var t = null != e.data ? uf(e.data).getOrDefault("") : "";
                        return [e.message, t].filter(Boolean).join(" ")
                    }).join(" ")) ? n : "").length > 0 && dw.some(function(e) {
                        return e.test(o)
                    }) || null != (i = null == (a = t.exception) ? void 0 : a.values) && 0 !== i.length && i.every(function(e) {
                        if ("TypeError" !== e.type) return !1;
                        var t, n, r, a = null == (r = dN.exec(null != (n = e.value) ? n : "")) ? void 0 : r[1];
                        return null != a && (t = a.replace(/:\d+$/, "").toLowerCase(), !dA.some(function(e) {
                            return e.startsWith(".") ? t === e.slice(1) || t.endsWith(e) : t === e
                        }))
                    }) ? null : e
                },
                beforeSendTransaction: function(e) {
                    ! function(e, t, n) {
                        try {
                            var r, a = function(e, t) {
                                var n = null != (b = null == (E = e.contexts) ? void 0 : E.trace) ? b : {},
                                    r = null == (S = e.contexts) ? void 0 : S.otel,
                                    a = n.trace_id,
                                    i = n.span_id,
                                    o = n.parent_span_id;
                                if (!a) return null;
                                var u = e9((null == r ? void 0 : r.resource) ? up([r.resource]) : up([{
                                        "service.name": "web"
                                    }, e.environment ? {
                                        "deployment.environment": e.environment
                                    } : void 0, {
                                        "telemetry.sdk.name": "@sentry/browser"
                                    }, e.release ? {
                                        "telemetry.sdk.version": e.release
                                    } : void 0])).concat(e9(up([{
                                        "device.type": uv(null == t || null == (g = t.deviceInfo) ? void 0 : g.deviceType),
                                        "browser.name": uv(null == t || null == (y = t.deviceInfo) ? void 0 : y.browser),
                                        "geo.country.iso_code": uv(null == t ? void 0 : t.requestCountryCode)
                                    }]))),
                                    s = [],
                                    l = null == (T = e.contexts) || null == (w = T.trace) ? void 0 : w.op,
                                    c = null == (N = e.contexts) || null == (I = N.trace) ? void 0 : I.status,
                                    f = function(e) {
                                        if (!e || (void 0 === e ? "undefined" : (0, e8._)(e)) !== "object") return [];
                                        var t = [],
                                            n = !0,
                                            r = !1,
                                            a = void 0;
                                        try {
                                            for (var i, o = Object.entries(e)[Symbol.iterator](); !(n = (i = o.next()).done); n = !0) {
                                                var u = eK(i.value, 2),
                                                    s = u[0],
                                                    l = u[1];
                                                if ("number" == typeof l.value && ug.has(s)) {
                                                    var c = "cls" === s ? 1e3 * l.value : l.value;
                                                    t.push({
                                                        key: "browser.web_vital.".concat(s),
                                                        value: {
                                                            intValue: String(Math.round(c))
                                                        }
                                                    })
                                                }
                                            }
                                        } catch (e) {
                                            r = !0, a = e
                                        } finally {
                                            try {
                                                n || null == o.return || o.return()
                                            } finally {
                                                if (r) throw a
                                            }
                                        }
                                        return t
                                    }(e.measurements),
                                    d = (null == r ? void 0 : r.attributes) ? e9(up([r.attributes])).concat(e9(f)) : e9(up([e.tags, {
                                        "sentry.transaction": e.transaction
                                    }, {
                                        "sentry.op": l
                                    }, l ? {
                                        op: l
                                    } : void 0, e.platform ? {
                                        platform: e.platform
                                    } : void 0, e.release ? {
                                        release: e.release
                                    } : void 0, "boolean" == typeof n.sampled ? {
                                        sampled: n.sampled
                                    } : void 0])).concat(e9(f));
                                s.push({
                                    traceId: a,
                                    spanId: null != i ? i : "0000000000000000",
                                    parentSpanId: o,
                                    name: null != (_ = e.transaction) ? _ : "unknown",
                                    kind: uh(l),
                                    startTimeUnixNano: ud(e.start_timestamp),
                                    endTimeUnixNano: ud(e.timestamp),
                                    attributes: d,
                                    status: um(c)
                                });
                                var p = Array.isArray(e.spans) ? e.spans : [],
                                    v = !0,
                                    m = !1,
                                    h = void 0;
                                try {
                                    for (var g, y, b, _, E, S, w, T, I, N, A, k, x = p[Symbol.iterator](); !(v = (k = x.next()).done); v = !0) {
                                        var R, O, V, C, Z = k.value,
                                            B = null != (R = null != (O = Z.description) ? O : Z.op) ? R : "unknown",
                                            L = Z.op,
                                            F = Z.status,
                                            P = up([Z.data, Z.tags, L ? {
                                                op: L
                                            } : void 0, {
                                                "sentry.op": L
                                            }]),
                                            X = {
                                                traceId: a,
                                                spanId: null != (V = Z.span_id) ? V : "0000000000000000",
                                                parentSpanId: null != (C = Z.parent_span_id) ? C : i,
                                                name: B,
                                                kind: uh(L),
                                                startTimeUnixNano: ud(Z.start_timestamp),
                                                endTimeUnixNano: ud(Z.timestamp),
                                                attributes: P,
                                                status: um(F)
                                            };
                                        s.push(X)
                                    }
                                } catch (e) {
                                    m = !0, h = e
                                } finally {
                                    try {
                                        v || null == x.return || x.return()
                                    } finally {
                                        if (m) throw h
                                    }
                                }
                                return {
                                    resourceSpans: [{
                                        resource: {
                                            attributes: u
                                        },
                                        scopeSpans: [{
                                            scope: {
                                                name: "@sentry/browser",
                                                version: null == (A = e.sdk) ? void 0 : A.version
                                            },
                                            spans: s
                                        }]
                                    }]
                                }
                            }(t, n);
                            if (null == a) return;
                            (r = uf(a)).isErr() || fetch(e, {
                                method: "POST",
                                body: r.value,
                                headers: {
                                    "content-type": "application/json"
                                }
                            }).then(function(e) {
                                e.ok || console.error("[OTEL DEBUG] Failed to send:", e.status, e.statusText)
                            }, function(e) {
                                console.error("[OTEL DEBUG] Fetch error:", e)
                            }).catch(function(e) {
                                console.error("[OTEL DEBUG] Catch error:", e)
                            })
                        } catch (e) {
                            console.error("[OTEL DEBUG] sendToOtel error:", e)
                        }
                    }(d6, e, ps);
                    var t, n, r, a, i, o, u = "u" > typeof window ? window.location.pathname : "",
                        s = dX(null != (t = e.transaction) ? t : u);
                    if (! function(e, t, n, r) {
                            if (r) return !0;
                            var a = dU(t, 5e-4),
                                i = dU(t, n);
                            return (e ? parseInt(e.slice(0, 8), 16) / 0x100000000 : Math.random()) < a / i
                        }(null != (n = null == (a = e.contexts) || null == (r = a.trace) ? void 0 : r.trace_id) ? n : "", s, pa, null == (o = e.sdkProcessingMetadata) || null == (i = o.capturedSpanScope) ? void 0 : i.getPropagationContext().sampled)) return null;
                    var l = function(e) {
                        if (!e.spans) return e;
                        var t = e.spans.filter(function(e) {
                            return null == e.op || !dG.has(e.op)
                        });
                        return eG(eY({}, e), {
                            spans: t
                        })
                    }(function(e) {
                        if (!e.spans) return e;
                        var t = e.spans.filter(function(e) {
                            if ("http.client" !== e.op) return !0;
                            var t, n, r = "string" == typeof(n = null != (t = e.description) ? t : e.data.url) ? n : void 0;
                            return null == r || dW.some(function(e) {
                                return e.test(r)
                            })
                        });
                        return eG(eY({}, e), {
                            spans: t
                        })
                    }(e));
                    if (!l.spans) return l;
                    var c = l.spans.filter(function(e) {
                        var t;
                        if ("http.client" === e.op || (null == (t = e.op) ? void 0 : t.startsWith("resource."))) {
                            var n, r = null != (n = e.description) ? n : e.data.url;
                            if ("string" == typeof r) return !(! function(e) {
                                if (!e.includes("css.rbxcdn.com")) return !1;
                                try {
                                    var t = new URL(e).pathname.toLowerCase();
                                    return dY.some(function(e) {
                                        return t.endsWith(e)
                                    })
                                } catch (t) {
                                    return /\.woff2?(?:[?#]|$)/i.test(e)
                                }
                            }(r) && dD.some(function(e) {
                                return r.includes(e)
                            }))
                        }
                        return !0
                    });
                    return eG(eY({}, l), {
                        spans: c
                    })
                },
                transport: (Y = function(e) {
                    return (function() {
                        var e, t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : iL;
                        return e = function(e) {
                                function t() {
                                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                    e4 && tE.log.apply(tE, ["[Offline]:"].concat(e9(t)))
                                }
                                return function(n) {
                                    var r, a = function(e) {
                                            r && clearTimeout(r), r = ai(setTimeout(function() {
                                                return rN(function() {
                                                    var e;
                                                    return rA(this, function(n) {
                                                        switch (n.label) {
                                                            case 0:
                                                                return r = void 0, [4, s.shift()];
                                                            case 1:
                                                                return (e = n.sent()) && (t("Attempting to send previously queued event"), e[0].sent_at = new Date().toISOString(), o(e, !0).catch(function(e) {
                                                                    t("Failed to retry sending", e)
                                                                })), [2]
                                                        }
                                                    })
                                                })()
                                            }, e))
                                        },
                                        i = function() {
                                            r || (a(l), l = Math.min(2 * l, 36e5))
                                        },
                                        o = function(e) {
                                            var r = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
                                            return rN(function() {
                                                var o, c, f, d, p, v;
                                                return rA(this, function(m) {
                                                    switch (m.label) {
                                                        case 0:
                                                            if (!(!r && rs(e, ["replay_event", "replay_recording"]))) return [3, 2];
                                                            return [4, s.push(e)];
                                                        case 1:
                                                            return m.sent(), a(100), [2, {}];
                                                        case 2:
                                                            if (m.trys.push([2, 6, , 14]), !(o = n.shouldSend)) return [3, 4];
                                                            return [4, n.shouldSend(e)];
                                                        case 3:
                                                            o = !1 === m.sent(), m.label = 4;
                                                        case 4:
                                                            if (o) throw Error("Envelope not sent because `shouldSend` callback returned false");
                                                            return [4, u.send(e)];
                                                        case 5:
                                                            if (c = m.sent(), f = 100, c) {
                                                                if (null == (d = c.headers) ? void 0 : d["retry-after"]) f = as(c.headers["retry-after"]);
                                                                else if (null == (p = c.headers) ? void 0 : p["x-sentry-rate-limits"]) f = 6e4;
                                                                else if ((c.statusCode || 0) >= 400) return [2, c]
                                                            }
                                                            return a(f), l = 5e3, [2, c];
                                                        case 6:
                                                            var h, g;
                                                            return [4, (h = v = m.sent(), g = l, !rs(e, ["client_report"]) && (!n.shouldStore || n.shouldStore(e, h, g)))];
                                                        case 7:
                                                            if (!m.sent()) return [3, 12];
                                                            if (!r) return [3, 9];
                                                            return [4, s.unshift(e)];
                                                        case 8:
                                                            return m.sent(), [3, 11];
                                                        case 9:
                                                            return [4, s.push(e)];
                                                        case 10:
                                                            m.sent(), m.label = 11;
                                                        case 11:
                                                            return i(), t("Error sending. Event queued.", v), [2, {}];
                                                        case 12:
                                                            throw v;
                                                        case 13:
                                                            return [3, 14];
                                                        case 14:
                                                            return [2]
                                                    }
                                                })
                                            })()
                                        },
                                        u = e(n);
                                    if (!n.createStore) throw Error("No `createStore` function was provided");
                                    var s = n.createStore(n),
                                        l = 5e3;
                                    return n.flushAtStartup && i(), {
                                        send: o,
                                        flush: function(e) {
                                            return void 0 === e && (l = 5e3, a(100)), u.flush(e)
                                        }
                                    }
                                }
                            }(t),
                            function(t) {
                                var n = e(eG(eY({}, t), {
                                    createStore: db
                                }));
                                return eQ.addEventListener("online", function(e) {
                                    return rN(function() {
                                        return rA(this, function(e) {
                                            switch (e.label) {
                                                case 0:
                                                    return [4, n.flush()];
                                                case 1:
                                                    return e.sent(), [2]
                                            }
                                        })
                                    })()
                                }), n
                            }
                    })(iL)(eG(eY({}, e), {
                        dbName: "sentry-offline:".concat(e.url)
                    }))
                }, G = function(e) {
                    var t = [d8];
                    return e.getEvent(["event"]) && t.push(d7), t
                }, function(e) {
                    var t = function(t, n) {
                            var a = n ? "".concat(t, ":").concat(n) : t,
                                i = r.get(a);
                            if (!i) {
                                var o = n8(t);
                                if (!o) return;
                                var u = aa(o, e.tunnel);
                                i = n ? function(e) {
                                    var t = Y(e);
                                    return eG(eY({}, t), {
                                        send: function(e) {
                                            return rN(function() {
                                                var r;
                                                return rA(this, function(a) {
                                                    return (r = dE(e, ["event", "transaction", "profile", "replay_event"])) && (r.release = n), [2, t.send(e)]
                                                })
                                            })()
                                        }
                                    })
                                }(eG(eY({}, e), {
                                    url: u
                                })) : Y(eG(eY({}, e), {
                                    url: u
                                })), r.set(a, i)
                            }
                            return [t, i]
                        },
                        n = Y(e),
                        r = new Map,
                        a = G || function(e) {
                            var t, n = e.getEvent();
                            return (null == n || null == (t = n.extra) ? void 0 : t[d_]) && Array.isArray(n.extra[d_]) ? n.extra[d_] : []
                        };
                    return {
                        send: function(e) {
                            return rN(function() {
                                var r;

                                function i(t) {
                                    return dE(e, (null == t ? void 0 : t.length) ? t : ["event"])
                                }
                                return rA(this, function(o) {
                                    switch (o.label) {
                                        case 0:
                                            return [4, Promise.all(((r = a({
                                                envelope: e,
                                                getEvent: i
                                            }).map(function(e) {
                                                return "string" == typeof e ? t(e, void 0) : t(e.dsn, e.release)
                                            }).filter(function(e) {
                                                return !!e
                                            })).length ? r : [
                                                ["", n]
                                            ]).map(function(t) {
                                                var n = eK(t, 2),
                                                    r = n[0];
                                                return n[1].send(ro(r ? eG(eY({}, e[0]), {
                                                    dsn: r
                                                }) : e[0], e[1]))
                                            }))];
                                        case 1:
                                            return [2, o.sent()[0]]
                                    }
                                })
                            })()
                        },
                        flush: function(e) {
                            return rN(function() {
                                return rA(this, function(t) {
                                    switch (t.label) {
                                        case 0:
                                            return [4, Promise.all(e9(r.values()).concat([n]).map(function(t) {
                                                return t.flush(e)
                                            }))];
                                        case 1:
                                            return [2, t.sent().every(function(e) {
                                                return e
                                            })]
                                    }
                                })
                            })()
                        }
                    }
                })
            }),
            function(e, t, n, r) {
                if ("u" > typeof window) {
                    var a, i = {},
                        o = function(e) {
                            return function(t) {
                                null != a || (a = n()), i[e] = {
                                    value: t.value
                                }
                            }
                        };
                    s5(o("lcp")), sD(o("fcp")), s8(o("ttfb")), sG(o("cls")), s1(o("inp"));
                    var u = !1,
                        s = function() {
                            if (!u) {
                                u = !0;
                                var o = function(e) {
                                    if (null == e.ttfb && 0 !== Object.keys(e).length && "u" > typeof performance) {
                                        var t = eK(performance.getEntriesByType("navigation"), 1)[0];
                                        if (t && t.responseStart > 0) {
                                            var n, r = null != (n = t.activationStart) ? n : 0;
                                            return {
                                                value: Math.max(t.responseStart - r, 0)
                                            }
                                        }
                                    }
                                }(i);
                                o && (i.ttfb = o);
                                var s = n();
                                ! function(e, t, n, r, a, i) {
                                    if (t) {
                                        var o, u, s, l, c, f = null == (o = t.lcp) ? void 0 : o.value,
                                            d = null == (u = t.fcp) ? void 0 : u.value,
                                            p = null == (s = t.ttfb) ? void 0 : s.value,
                                            v = null == (l = t.cls) ? void 0 : l.value,
                                            m = null == (c = t.inp) ? void 0 : c.value;
                                        if ([f, d, p, v, m].some(function(e) {
                                                return "number" == typeof e
                                            })) try {
                                            ((null == eP || eX !== e) && (eP = new f_({
                                                baseUrl: e
                                            }), eX = e), eP).sendEvent(cR, {
                                                    localTimestamp: new Date().toISOString(),
                                                    userEventBase: {
                                                        userId: function(e) {
                                                            var t;
                                                            if (null != e) return (void 0 === e ? "undefined" : (0, e8._)(e)) === "bigint" ? e : null != (t = "number" == typeof e ? s6(e) : s7(e)) ? t : void 0
                                                        }(n)
                                                    },
                                                    page: r,
                                                    url: "u" < typeof window ? void 0 : window.location.href,
                                                    lcpMs: f,
                                                    fcpMs: d,
                                                    ttfbMs: p,
                                                    cls: v,
                                                    inpMs: m,
                                                    renderPlatform: i
                                                }).catch(function() {}),
                                                function(e, t, n) {
                                                    if (e) {
                                                        var r = (void 0 === t || "" === t ? "Unknown" : t).replace(dm, "_");
                                                        if (!(Math.random() >= (null != (c = dv[r]) ? c : .05))) {
                                                            var a = dd(),
                                                                i = {
                                                                    appType: a.appType,
                                                                    browser: a.browser,
                                                                    host: n
                                                                },
                                                                o = !1,
                                                                u = !0,
                                                                s = !1,
                                                                l = void 0;
                                                            try {
                                                                for (var c, f, d = Object.entries(dh)[Symbol.iterator](); !(u = (f = d.next()).done); u = !0) {
                                                                    var p, v = eK(f.value, 2),
                                                                        m = v[0],
                                                                        h = v[1],
                                                                        g = null == (p = e[m]) ? void 0 : p.value;
                                                                    "number" == typeof g && (dp("PagePerf_".concat(h, "_").concat(r), i, g), o = !0)
                                                                }
                                                            } catch (e) {
                                                                s = !0, l = e
                                                            } finally {
                                                                try {
                                                                    u || null == d.return || d.return()
                                                                } finally {
                                                                    if (s) throw l
                                                                }
                                                            }
                                                            o && di(!0)
                                                        }
                                                    }
                                                }(t, a, i)
                                        } catch (e) {
                                            console.error("[PERF] Failed to send web vitals:", e)
                                        }
                                    }
                                }(e, i, t(), s, null != a ? a : s, r)
                            }
                        };
                    document.addEventListener("visibilitychange", function() {
                        "hidden" === document.visibilityState && s()
                    }), window.addEventListener("pagehide", s)
                }
            }(sy().apiGatewayUrl, function() {
                return null == pi ? void 0 : pi.id
            }, function() {
                var e;
                return null == (e = po()) ? void 0 : e.dataset.internalPageName
            }, "dotnet");
            var pl = function() {
                e = {
                    id: null != (t = null == pi || null == (r = pi.id) ? void 0 : r.toString()) ? t : "-1",
                    username: null != (n = null == pi ? void 0 : pi.name) ? n : "unknown"
                }, nu().setUser(e);
                var e, t, n, r, a = po();
                (null == a ? void 0 : a.dataset.internalPageName) && rF("internal-page-name", a.dataset.internalPageName);
                var i = new MutationObserver(function(e) {
                    e.forEach(function(e) {
                        if ("attributes" === e.type && "data-internal-page-name" === e.attributeName && (0, eW._)(e.target, HTMLMetaElement)) {
                            var t = e.target.dataset.internalPageName;
                            t && rF("internal-page-name", t)
                        }
                    })
                });
                a && i.observe(a, {
                    attributes: !0,
                    attributeFilter: ["data-internal-page-name"]
                })
            };
            "loading" === document.readyState ? document.addEventListener("DOMContentLoaded", pl) : pl()
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected(document.currentScript && document.currentScript.getAttribute("data-bundlename") || "Sentry");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/sentry-5a647380f782ba26.js.map