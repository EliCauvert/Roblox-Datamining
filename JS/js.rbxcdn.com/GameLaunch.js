! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "9e536e0c6a6effeb64da23c99f8f0b81a0bdacac"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "5e3ec819-c186-4222-ae41-7f6710e853e3", e._sentryDebugIdIdentifier = "sentry-dbid-5e3ec819-c186-4222-ae41-7f6710e853e3")
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
                    var t = u(e),
                        n = t[0],
                        r = t[1];
                    return (n + r) * 3 / 4 - r
                }, t.toByteArray = function(e) {
                    var t, n, i = u(e),
                        o = i[0],
                        l = i[1],
                        s = new a((o + l) * 3 / 4 - l),
                        c = 0,
                        d = l > 0 ? o - 4 : o;
                    for (n = 0; n < d; n += 4) t = r[e.charCodeAt(n)] << 18 | r[e.charCodeAt(n + 1)] << 12 | r[e.charCodeAt(n + 2)] << 6 | r[e.charCodeAt(n + 3)], s[c++] = t >> 16 & 255, s[c++] = t >> 8 & 255, s[c++] = 255 & t;
                    return 2 === l && (t = r[e.charCodeAt(n)] << 2 | r[e.charCodeAt(n + 1)] >> 4, s[c++] = 255 & t), 1 === l && (t = r[e.charCodeAt(n)] << 10 | r[e.charCodeAt(n + 1)] << 4 | r[e.charCodeAt(n + 2)] >> 2, s[c++] = t >> 8 & 255, s[c++] = 255 & t), s
                }, t.fromByteArray = function(e) {
                    for (var t, r = e.length, a = r % 3, i = [], o = 0, l = r - a; o < l; o += 16383) i.push(function(e, t, r) {
                        for (var a, i = [], o = t; o < r; o += 3) a = (e[o] << 16 & 0xff0000) + (e[o + 1] << 8 & 65280) + (255 & e[o + 2]), i.push(n[a >> 18 & 63] + n[a >> 12 & 63] + n[a >> 6 & 63] + n[63 & a]);
                        return i.join("")
                    }(e, o, o + 16383 > l ? l : o + 16383));
                    return 1 === a ? i.push(n[(t = e[r - 1]) >> 2] + n[t << 4 & 63] + "==") : 2 === a && i.push(n[(t = (e[r - 2] << 8) + e[r - 1]) >> 10] + n[t >> 4 & 63] + n[t << 2 & 63] + "="), i.join("")
                };
                for (var n = [], r = [], a = "u" > typeof Uint8Array ? Uint8Array : Array, i = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", o = 0, l = i.length; o < l; ++o) n[o] = i[o], r[i.charCodeAt(o)] = o;

                function u(e) {
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
                    l = "function" == typeof Symbol && "function" == typeof Symbol.for ? Symbol.for("nodejs.util.inspect.custom") : null;

                function u(e) {
                    if (e > 0x7fffffff) throw RangeError('The value "' + e + '" is invalid for option "size"');
                    var t = new Uint8Array(e);
                    return Object.setPrototypeOf(t, s.prototype), t
                }

                function s(e, t, n) {
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
                        if (("string" != typeof i || "" === i) && (i = "utf8"), !s.isEncoding(i)) throw TypeError("Unknown encoding: " + i);
                        var o = 0 | v(r, i),
                            l = u(o),
                            c = l.write(r, i);
                        return c !== o && (l = l.slice(0, c)), l
                    }
                    if (ArrayBuffer.isView(e)) {
                        var d = e;
                        if (_(d, Uint8Array)) {
                            var f = new Uint8Array(d);
                            return p(f.buffer, f.byteOffset, f.byteLength)
                        }
                        return h(d)
                    }
                    if (null == e) throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type " + (void 0 === e ? "undefined" : a._(e)));
                    if (_(e, ArrayBuffer) || e && _(e.buffer, ArrayBuffer) || "u" > typeof SharedArrayBuffer && (_(e, SharedArrayBuffer) || e && _(e.buffer, SharedArrayBuffer))) return p(e, t, n);
                    if ("number" == typeof e) throw TypeError('The "value" argument must not be of type number. Received type number');
                    var y = e.valueOf && e.valueOf();
                    if (null != y && y !== e) return s.from(y, t, n);
                    var g = function(e) {
                        if (s.isBuffer(e)) {
                            var t = 0 | m(e.length),
                                n = u(t);
                            return 0 === n.length || e.copy(n, 0, 0, t), n
                        }
                        return void 0 !== e.length ? "number" != typeof e.length || function(e) {
                            return e != e
                        }(e.length) ? u(0) : h(e) : "Buffer" === e.type && Array.isArray(e.data) ? h(e.data) : void 0
                    }(e);
                    if (g) return g;
                    if ("u" > typeof Symbol && null != Symbol.toPrimitive && "function" == typeof e[Symbol.toPrimitive]) return s.from(e[Symbol.toPrimitive]("string"), t, n);
                    throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type " + (void 0 === e ? "undefined" : a._(e)))
                }

                function d(e) {
                    if ("number" != typeof e) throw TypeError('"size" argument must be of type number');
                    if (e < 0) throw RangeError('The value "' + e + '" is invalid for option "size"')
                }

                function f(e) {
                    return d(e), u(e < 0 ? 0 : 0 | m(e))
                }

                function h(e) {
                    for (var t = e.length < 0 ? 0 : 0 | m(e.length), n = u(t), r = 0; r < t; r += 1) n[r] = 255 & e[r];
                    return n
                }

                function p(e, t, n) {
                    var r;
                    if (t < 0 || e.byteLength < t) throw RangeError('"offset" is outside of buffer bounds');
                    if (e.byteLength < t + (n || 0)) throw RangeError('"length" is outside of buffer bounds');
                    return Object.setPrototypeOf(r = void 0 === t && void 0 === n ? new Uint8Array(e) : void 0 === n ? new Uint8Array(e, t) : new Uint8Array(e, t, n), s.prototype), r
                }

                function m(e) {
                    if (e >= 0x7fffffff) throw RangeError("Attempt to allocate Buffer larger than maximum size: 0x7fffffff bytes");
                    return 0 | e
                }

                function v(e, t) {
                    if (s.isBuffer(e)) return e.length;
                    if (ArrayBuffer.isView(e) || _(e, ArrayBuffer)) return e.byteLength;
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
                            if (i) return r ? -1 : T(e).length;
                            t = ("" + t).toLowerCase(), i = !0
                    }
                }

                function y(e, t, n) {
                    var r, a, o, l = !1;
                    if ((void 0 === t || t < 0) && (t = 0), t > this.length || ((void 0 === n || n > this.length) && (n = this.length), n <= 0 || (n >>>= 0) <= (t >>>= 0))) return "";
                    for (e || (e = "utf8");;) switch (e) {
                        case "hex":
                            return function(e, t, n) {
                                var r = e.length;
                                (!t || t < 0) && (t = 0), (!n || n < 0 || n > r) && (n = r);
                                for (var a = "", i = t; i < n; ++i) a += N[e[i]];
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
                            if (l) throw TypeError("Unknown encoding: " + e);
                            e = (e + "").toLowerCase(), l = !0
                    }
                }

                function g(e, t, n) {
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
                    if ("string" == typeof t && (t = s.from(t, r)), s.isBuffer(t)) return 0 === t.length ? -1 : w(e, t, n, r, a);
                    if ("number" == typeof t) {
                        if (t &= 255, "function" == typeof Uint8Array.prototype.indexOf)
                            if (a) return Uint8Array.prototype.indexOf.call(e, t, n);
                            else return Uint8Array.prototype.lastIndexOf.call(e, t, n);
                        return w(e, [t], n, r, a)
                    }
                    throw TypeError("val must be string, number or Buffer")
                }

                function w(e, t, n, r, a) {
                    var i, o = 1,
                        l = e.length,
                        u = t.length;
                    if (void 0 !== r && ("ucs2" === (r = String(r).toLowerCase()) || "ucs-2" === r || "utf16le" === r || "utf-16le" === r)) {
                        if (e.length < 2 || t.length < 2) return -1;
                        o = 2, l /= 2, u /= 2, n /= 2
                    }

                    function s(e, t) {
                        return 1 === o ? e[t] : e.readUInt16BE(t * o)
                    }
                    if (a) {
                        var c = -1;
                        for (i = n; i < l; i++)
                            if (s(e, i) === s(t, -1 === c ? 0 : i - c)) {
                                if (-1 === c && (c = i), i - c + 1 === u) return c * o
                            } else - 1 !== c && (i -= i - c), c = -1
                    } else
                        for (n + u > l && (n = l - u), i = n; i >= 0; i--) {
                            for (var d = !0, f = 0; f < u; f++)
                                if (s(e, i + f) !== s(t, f)) {
                                    d = !1;
                                    break
                                } if (d) return i
                        }
                    return -1
                }

                function E(e, t, n) {
                    n = Math.min(e.length, n);
                    for (var r = [], a = t; a < n;) {
                        var i, o, l, u, s = e[a],
                            c = null,
                            d = s > 239 ? 4 : s > 223 ? 3 : s > 191 ? 2 : 1;
                        if (a + d <= n) switch (d) {
                            case 1:
                                s < 128 && (c = s);
                                break;
                            case 2:
                                (192 & (i = e[a + 1])) == 128 && (u = (31 & s) << 6 | 63 & i) > 127 && (c = u);
                                break;
                            case 3:
                                i = e[a + 1], o = e[a + 2], (192 & i) == 128 && (192 & o) == 128 && (u = (15 & s) << 12 | (63 & i) << 6 | 63 & o) > 2047 && (u < 55296 || u > 57343) && (c = u);
                                break;
                            case 4:
                                i = e[a + 1], o = e[a + 2], l = e[a + 3], (192 & i) == 128 && (192 & o) == 128 && (192 & l) == 128 && (u = (15 & s) << 18 | (63 & i) << 12 | (63 & o) << 6 | 63 & l) > 65535 && u < 1114112 && (c = u)
                        }
                        null === c ? (c = 65533, d = 1) : c > 65535 && (c -= 65536, r.push(c >>> 10 & 1023 | 55296), c = 56320 | 1023 & c), r.push(c), a += d
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

                function x(e, t, n, r, a, i) {
                    if (!s.isBuffer(e)) throw TypeError('"buffer" argument must be a Buffer instance');
                    if (t > a || t < i) throw RangeError('"value" argument is out of bounds');
                    if (n + r > e.length) throw RangeError("Index out of range")
                }

                function S(e, t, n, r, a, i) {
                    if (n + r > e.length || n < 0) throw RangeError("Index out of range")
                }

                function I(e, t, n, r, a) {
                    return t *= 1, n >>>= 0, a || S(e, t, n, 4, 34028234663852886e22, -34028234663852886e22), o.write(e, t, n, r, 23, 4), n + 4
                }

                function A(e, t, n, r, a) {
                    return t *= 1, n >>>= 0, a || S(e, t, n, 8, 17976931348623157e292, -17976931348623157e292), o.write(e, t, n, r, 52, 8), n + 8
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
                    return (d(e), e <= 0) ? u(e) : void 0 !== t ? "string" == typeof n ? u(e).fill(t, n) : u(e).fill(t) : u(e)
                }, s.allocUnsafe = function(e) {
                    return f(e)
                }, s.allocUnsafeSlow = function(e) {
                    return f(e)
                }, s.isBuffer = function(e) {
                    return null != e && !0 === e._isBuffer && e !== s.prototype
                }, s.compare = function(e, t) {
                    if (_(e, Uint8Array) && (e = s.from(e, e.offset, e.byteLength)), _(t, Uint8Array) && (t = s.from(t, t.offset, t.byteLength)), !s.isBuffer(e) || !s.isBuffer(t)) throw TypeError('The "buf1", "buf2" arguments must be one of type Buffer or Uint8Array');
                    if (e === t) return 0;
                    for (var n = e.length, r = t.length, a = 0, i = Math.min(n, r); a < i; ++a)
                        if (e[a] !== t[a]) {
                            n = e[a], r = t[a];
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
                        a = 0;
                    for (n = 0; n < e.length; ++n) {
                        var i = e[n];
                        if (_(i, Uint8Array)) a + i.length > r.length ? s.from(i).copy(r, a) : Uint8Array.prototype.set.call(r, i, a);
                        else if (s.isBuffer(i)) i.copy(r, a);
                        else throw TypeError('"list" argument must be an Array of Buffers');
                        a += i.length
                    }
                    return r
                }, s.byteLength = v, s.prototype._isBuffer = !0, s.prototype.swap16 = function() {
                    var e = this.length;
                    if (e % 2 != 0) throw RangeError("Buffer size must be a multiple of 16-bits");
                    for (var t = 0; t < e; t += 2) g(this, t, t + 1);
                    return this
                }, s.prototype.swap32 = function() {
                    var e = this.length;
                    if (e % 4 != 0) throw RangeError("Buffer size must be a multiple of 32-bits");
                    for (var t = 0; t < e; t += 4) g(this, t, t + 3), g(this, t + 1, t + 2);
                    return this
                }, s.prototype.swap64 = function() {
                    var e = this.length;
                    if (e % 8 != 0) throw RangeError("Buffer size must be a multiple of 64-bits");
                    for (var t = 0; t < e; t += 8) g(this, t, t + 7), g(this, t + 1, t + 6), g(this, t + 2, t + 5), g(this, t + 3, t + 4);
                    return this
                }, s.prototype.toString = function() {
                    var e = this.length;
                    return 0 === e ? "" : 0 == arguments.length ? E(this, 0, e) : y.apply(this, arguments)
                }, s.prototype.toLocaleString = s.prototype.toString, s.prototype.equals = function(e) {
                    if (!s.isBuffer(e)) throw TypeError("Argument must be a Buffer");
                    return this === e || 0 === s.compare(this, e)
                }, s.prototype.inspect = function() {
                    var e = "",
                        n = t.INSPECT_MAX_BYTES;
                    return e = this.toString("hex", 0, n).replace(/(.{2})/g, "$1 ").trim(), this.length > n && (e += " ... "), "<Buffer " + e + ">"
                }, l && (s.prototype[l] = s.prototype.inspect), s.prototype.compare = function(e, t, n, r, i) {
                    if (_(e, Uint8Array) && (e = s.from(e, e.offset, e.byteLength)), !s.isBuffer(e)) throw TypeError('The "target" argument must be one of type Buffer or Uint8Array. Received type ' + (void 0 === e ? "undefined" : a._(e)));
                    if (void 0 === t && (t = 0), void 0 === n && (n = e ? e.length : 0), void 0 === r && (r = 0), void 0 === i && (i = this.length), t < 0 || n > e.length || r < 0 || i > this.length) throw RangeError("out of range index");
                    if (r >= i && t >= n) return 0;
                    if (r >= i) return -1;
                    if (t >= n) return 1;
                    if (t >>>= 0, n >>>= 0, r >>>= 0, i >>>= 0, this === e) return 0;
                    for (var o = i - r, l = n - t, u = Math.min(o, l), c = this.slice(r, i), d = e.slice(t, n), f = 0; f < u; ++f)
                        if (c[f] !== d[f]) {
                            o = c[f], l = d[f];
                            break
                        } return o < l ? -1 : +(l < o)
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
                    var a, i, o, l, u, s, c, d, f = this.length - t;
                    if ((void 0 === n || n > f) && (n = f), e.length > 0 && (n < 0 || t < 0) || t > this.length) throw RangeError("Attempt to write outside buffer bounds");
                    r || (r = "utf8");
                    for (var h = !1;;) switch (r) {
                        case "hex":
                            return function(e, t, n, r) {
                                n = Number(n) || 0;
                                var a = e.length - n;
                                r ? (r = Number(r)) > a && (r = a) : r = a;
                                var i = t.length;
                                r > i / 2 && (r = i / 2);
                                for (var o = 0; o < r; ++o) {
                                    var l, u = parseInt(t.substr(2 * o, 2), 16);
                                    if ((l = u) != l) break;
                                    e[n + o] = u
                                }
                                return o
                            }(this, e, t, n);
                        case "utf8":
                        case "utf-8":
                            return a = t, i = n, O(T(e, this.length - a), this, a, i);
                        case "ascii":
                        case "latin1":
                        case "binary":
                            return o = t, l = n, O(function(e) {
                                for (var t = [], n = 0; n < e.length; ++n) t.push(255 & e.charCodeAt(n));
                                return t
                            }(e), this, o, l);
                        case "base64":
                            return u = t, s = n, O(k(e), this, u, s);
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return c = t, d = n, O(function(e, t) {
                                for (var n, r, a = [], i = 0; i < e.length && !((t -= 2) < 0); ++i) r = (n = e.charCodeAt(i)) >> 8, a.push(n % 256), a.push(r);
                                return a
                            }(e, this.length - c), this, c, d);
                        default:
                            if (h) throw TypeError("Unknown encoding: " + r);
                            r = ("" + r).toLowerCase(), h = !0
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
                    e >>>= 0, t >>>= 0, n || P(e, t, this.length);
                    for (var r = this[e], a = 1, i = 0; ++i < t && (a *= 256);) r += this[e + i] * a;
                    return r
                }, s.prototype.readUintBE = s.prototype.readUIntBE = function(e, t, n) {
                    e >>>= 0, t >>>= 0, n || P(e, t, this.length);
                    for (var r = this[e + --t], a = 1; t > 0 && (a *= 256);) r += this[e + --t] * a;
                    return r
                }, s.prototype.readUint8 = s.prototype.readUInt8 = function(e, t) {
                    return e >>>= 0, t || P(e, 1, this.length), this[e]
                }, s.prototype.readUint16LE = s.prototype.readUInt16LE = function(e, t) {
                    return e >>>= 0, t || P(e, 2, this.length), this[e] | this[e + 1] << 8
                }, s.prototype.readUint16BE = s.prototype.readUInt16BE = function(e, t) {
                    return e >>>= 0, t || P(e, 2, this.length), this[e] << 8 | this[e + 1]
                }, s.prototype.readUint32LE = s.prototype.readUInt32LE = function(e, t) {
                    return e >>>= 0, t || P(e, 4, this.length), (this[e] | this[e + 1] << 8 | this[e + 2] << 16) + 0x1000000 * this[e + 3]
                }, s.prototype.readUint32BE = s.prototype.readUInt32BE = function(e, t) {
                    return e >>>= 0, t || P(e, 4, this.length), 0x1000000 * this[e] + (this[e + 1] << 16 | this[e + 2] << 8 | this[e + 3])
                }, s.prototype.readIntLE = function(e, t, n) {
                    e >>>= 0, t >>>= 0, n || P(e, t, this.length);
                    for (var r = this[e], a = 1, i = 0; ++i < t && (a *= 256);) r += this[e + i] * a;
                    return r >= (a *= 128) && (r -= Math.pow(2, 8 * t)), r
                }, s.prototype.readIntBE = function(e, t, n) {
                    e >>>= 0, t >>>= 0, n || P(e, t, this.length);
                    for (var r = t, a = 1, i = this[e + --r]; r > 0 && (a *= 256);) i += this[e + --r] * a;
                    return i >= (a *= 128) && (i -= Math.pow(2, 8 * t)), i
                }, s.prototype.readInt8 = function(e, t) {
                    return (e >>>= 0, t || P(e, 1, this.length), 128 & this[e]) ? -((255 - this[e] + 1) * 1) : this[e]
                }, s.prototype.readInt16LE = function(e, t) {
                    e >>>= 0, t || P(e, 2, this.length);
                    var n = this[e] | this[e + 1] << 8;
                    return 32768 & n ? 0xffff0000 | n : n
                }, s.prototype.readInt16BE = function(e, t) {
                    e >>>= 0, t || P(e, 2, this.length);
                    var n = this[e + 1] | this[e] << 8;
                    return 32768 & n ? 0xffff0000 | n : n
                }, s.prototype.readInt32LE = function(e, t) {
                    return e >>>= 0, t || P(e, 4, this.length), this[e] | this[e + 1] << 8 | this[e + 2] << 16 | this[e + 3] << 24
                }, s.prototype.readInt32BE = function(e, t) {
                    return e >>>= 0, t || P(e, 4, this.length), this[e] << 24 | this[e + 1] << 16 | this[e + 2] << 8 | this[e + 3]
                }, s.prototype.readFloatLE = function(e, t) {
                    return e >>>= 0, t || P(e, 4, this.length), o.read(this, e, !0, 23, 4)
                }, s.prototype.readFloatBE = function(e, t) {
                    return e >>>= 0, t || P(e, 4, this.length), o.read(this, e, !1, 23, 4)
                }, s.prototype.readDoubleLE = function(e, t) {
                    return e >>>= 0, t || P(e, 8, this.length), o.read(this, e, !0, 52, 8)
                }, s.prototype.readDoubleBE = function(e, t) {
                    return e >>>= 0, t || P(e, 8, this.length), o.read(this, e, !1, 52, 8)
                }, s.prototype.writeUintLE = s.prototype.writeUIntLE = function(e, t, n, r) {
                    if (e *= 1, t >>>= 0, n >>>= 0, !r) {
                        var a = Math.pow(2, 8 * n) - 1;
                        x(this, e, t, n, a, 0)
                    }
                    var i = 1,
                        o = 0;
                    for (this[t] = 255 & e; ++o < n && (i *= 256);) this[t + o] = e / i & 255;
                    return t + n
                }, s.prototype.writeUintBE = s.prototype.writeUIntBE = function(e, t, n, r) {
                    if (e *= 1, t >>>= 0, n >>>= 0, !r) {
                        var a = Math.pow(2, 8 * n) - 1;
                        x(this, e, t, n, a, 0)
                    }
                    var i = n - 1,
                        o = 1;
                    for (this[t + i] = 255 & e; --i >= 0 && (o *= 256);) this[t + i] = e / o & 255;
                    return t + n
                }, s.prototype.writeUint8 = s.prototype.writeUInt8 = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || x(this, e, t, 1, 255, 0), this[t] = 255 & e, t + 1
                }, s.prototype.writeUint16LE = s.prototype.writeUInt16LE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || x(this, e, t, 2, 65535, 0), this[t] = 255 & e, this[t + 1] = e >>> 8, t + 2
                }, s.prototype.writeUint16BE = s.prototype.writeUInt16BE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || x(this, e, t, 2, 65535, 0), this[t] = e >>> 8, this[t + 1] = 255 & e, t + 2
                }, s.prototype.writeUint32LE = s.prototype.writeUInt32LE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || x(this, e, t, 4, 0xffffffff, 0), this[t + 3] = e >>> 24, this[t + 2] = e >>> 16, this[t + 1] = e >>> 8, this[t] = 255 & e, t + 4
                }, s.prototype.writeUint32BE = s.prototype.writeUInt32BE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || x(this, e, t, 4, 0xffffffff, 0), this[t] = e >>> 24, this[t + 1] = e >>> 16, this[t + 2] = e >>> 8, this[t + 3] = 255 & e, t + 4
                }, s.prototype.writeIntLE = function(e, t, n, r) {
                    if (e *= 1, t >>>= 0, !r) {
                        var a = Math.pow(2, 8 * n - 1);
                        x(this, e, t, n, a - 1, -a)
                    }
                    var i = 0,
                        o = 1,
                        l = 0;
                    for (this[t] = 255 & e; ++i < n && (o *= 256);) e < 0 && 0 === l && 0 !== this[t + i - 1] && (l = 1), this[t + i] = (e / o | 0) - l & 255;
                    return t + n
                }, s.prototype.writeIntBE = function(e, t, n, r) {
                    if (e *= 1, t >>>= 0, !r) {
                        var a = Math.pow(2, 8 * n - 1);
                        x(this, e, t, n, a - 1, -a)
                    }
                    var i = n - 1,
                        o = 1,
                        l = 0;
                    for (this[t + i] = 255 & e; --i >= 0 && (o *= 256);) e < 0 && 0 === l && 0 !== this[t + i + 1] && (l = 1), this[t + i] = (e / o | 0) - l & 255;
                    return t + n
                }, s.prototype.writeInt8 = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || x(this, e, t, 1, 127, -128), e < 0 && (e = 255 + e + 1), this[t] = 255 & e, t + 1
                }, s.prototype.writeInt16LE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || x(this, e, t, 2, 32767, -32768), this[t] = 255 & e, this[t + 1] = e >>> 8, t + 2
                }, s.prototype.writeInt16BE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || x(this, e, t, 2, 32767, -32768), this[t] = e >>> 8, this[t + 1] = 255 & e, t + 2
                }, s.prototype.writeInt32LE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || x(this, e, t, 4, 0x7fffffff, -0x80000000), this[t] = 255 & e, this[t + 1] = e >>> 8, this[t + 2] = e >>> 16, this[t + 3] = e >>> 24, t + 4
                }, s.prototype.writeInt32BE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || x(this, e, t, 4, 0x7fffffff, -0x80000000), e < 0 && (e = 0xffffffff + e + 1), this[t] = e >>> 24, this[t + 1] = e >>> 16, this[t + 2] = e >>> 8, this[t + 3] = 255 & e, t + 4
                }, s.prototype.writeFloatLE = function(e, t, n) {
                    return I(this, e, t, !0, n)
                }, s.prototype.writeFloatBE = function(e, t, n) {
                    return I(this, e, t, !1, n)
                }, s.prototype.writeDoubleLE = function(e, t, n) {
                    return A(this, e, t, !0, n)
                }, s.prototype.writeDoubleBE = function(e, t, n) {
                    return A(this, e, t, !1, n)
                }, s.prototype.copy = function(e, t, n, r) {
                    if (!s.isBuffer(e)) throw TypeError("argument should be a Buffer");
                    if (n || (n = 0), r || 0 === r || (r = this.length), t >= e.length && (t = e.length), t || (t = 0), r > 0 && r < n && (r = n), r === n || 0 === e.length || 0 === this.length) return 0;
                    if (t < 0) throw RangeError("targetStart out of bounds");
                    if (n < 0 || n >= this.length) throw RangeError("Index out of range");
                    if (r < 0) throw RangeError("sourceEnd out of bounds");
                    r > this.length && (r = this.length), e.length - t < r - n && (r = e.length - t + n);
                    var a = r - n;
                    return this === e && "function" == typeof Uint8Array.prototype.copyWithin ? this.copyWithin(t, n, r) : Uint8Array.prototype.set.call(e, this.subarray(n, r), t), a
                }, s.prototype.fill = function(e, t, n, r) {
                    if ("string" == typeof e) {
                        if ("string" == typeof t ? (r = t, t = 0, n = this.length) : "string" == typeof n && (r = n, n = this.length), void 0 !== r && "string" != typeof r) throw TypeError("encoding must be a string");
                        if ("string" == typeof r && !s.isEncoding(r)) throw TypeError("Unknown encoding: " + r);
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
                        var o = s.isBuffer(e) ? e : s.from(e, r),
                            l = o.length;
                        if (0 === l) throw TypeError('The value "' + e + '" is invalid for argument "value"');
                        for (a = 0; a < n - t; ++a) this[a + t] = o[a % l]
                    }
                    return this
                };
                var C = /[^+/0-9A-Za-z-_]/g;

                function T(e, t) {
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

                function k(e) {
                    return i.toByteArray(function(e) {
                        if ((e = (e = e.split("=")[0]).trim().replace(C, "")).length < 2) return "";
                        for (; e.length % 4 != 0;) e += "=";
                        return e
                    }(e))
                }

                function O(e, t, n, r) {
                    for (var a = 0; a < r && !(a + n >= t.length) && !(a >= e.length); ++a) t[a + n] = e[a];
                    return a
                }

                function _(e, t) {
                    return r._(e, t) || null != e && null != e.constructor && null != e.constructor.name && e.constructor.name === t.name
                }
                var N = function() {
                    for (var e = "0123456789abcdef", t = Array(256), n = 0; n < 16; ++n)
                        for (var r = 16 * n, a = 0; a < 16; ++a) t[r + a] = e[n] + e[a];
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
                            var o = arguments[i];
                            o && (e = a(e, function(e) {
                                if ("string" == typeof e || "number" == typeof e) return e;
                                if ((void 0 === e ? "undefined" : r._(e)) !== "object") return "";
                                if (Array.isArray(e)) return n.apply(null, e);
                                if (e.toString !== Object.prototype.toString && !e.toString.toString().includes("[native code]")) return e.toString();
                                var i = "";
                                for (var o in e) t.call(e, o) && e[o] && (i = a(i, o));
                                return i
                            }(o)))
                        }
                        return e
                    }

                    function a(e, t) {
                        return t ? e ? e + " " + t : e + t : e
                    }
                    e.exports ? (n.default = n, e.exports = n) : "function" == typeof define && "object" === r._(define.amd) && define.amd ? define("classnames", [], function() {
                        return n
                    }) : window.classNames = n
                }()
            },
            619: function(e, t) {
                /*! ieee754. BSD-3-Clause License. Feross Aboukhadijeh <https://feross.org/opensource> */
                t.read = function(e, t, n, r, a) {
                    var i, o, l = 8 * a - r - 1,
                        u = (1 << l) - 1,
                        s = u >> 1,
                        c = -7,
                        d = n ? a - 1 : 0,
                        f = n ? -1 : 1,
                        h = e[t + d];
                    for (d += f, i = h & (1 << -c) - 1, h >>= -c, c += l; c > 0; i = 256 * i + e[t + d], d += f, c -= 8);
                    for (o = i & (1 << -c) - 1, i >>= -c, c += r; c > 0; o = 256 * o + e[t + d], d += f, c -= 8);
                    if (0 === i) i = 1 - s;
                    else {
                        if (i === u) return o ? NaN : 1 / 0 * (h ? -1 : 1);
                        o += Math.pow(2, r), i -= s
                    }
                    return (h ? -1 : 1) * o * Math.pow(2, i - r)
                }, t.write = function(e, t, n, r, a, i) {
                    var o, l, u, s = 8 * i - a - 1,
                        c = (1 << s) - 1,
                        d = c >> 1,
                        f = 5960464477539062e-23 * (23 === a),
                        h = r ? 0 : i - 1,
                        p = r ? 1 : -1,
                        m = +(t < 0 || 0 === t && 1 / t < 0);
                    for (isNaN(t = Math.abs(t)) || t === 1 / 0 ? (l = +!!isNaN(t), o = c) : (o = Math.floor(Math.log(t) / Math.LN2), t * (u = Math.pow(2, -o)) < 1 && (o--, u *= 2), o + d >= 1 ? t += f / u : t += f * Math.pow(2, 1 - d), t * u >= 2 && (o++, u /= 2), o + d >= c ? (l = 0, o = c) : o + d >= 1 ? (l = (t * u - 1) * Math.pow(2, a), o += d) : (l = t * Math.pow(2, d - 1) * Math.pow(2, a), o = 0)); a >= 8; e[n + h] = 255 & l, h += p, l /= 256, a -= 8);
                    for (o = o << a | l, s += a; s > 0; e[n + h] = 255 & o, h += p, o /= 256, s -= 8);
                    e[n + h - p] |= 128 * m
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

                function l() {
                    throw Error("setTimeout has not been defined")
                }

                function u() {
                    throw Error("clearTimeout has not been defined")
                }
                try {
                    n = "function" == typeof setTimeout ? setTimeout : l
                } catch (e) {
                    n = l
                }
                try {
                    r = "function" == typeof clearTimeout ? clearTimeout : u
                } catch (e) {
                    r = u
                }

                function s(e) {
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
                    d && a && (d = !1, a.length ? c = a.concat(c) : f = -1, c.length && p())
                }

                function p() {
                    if (!d) {
                        var e = s(h);
                        d = !0;
                        for (var t = c.length; t;) {
                            for (a = c, c = []; ++f < t;) a && a[f].run();
                            f = -1, t = c.length
                        }
                        a = null, d = !1,
                            function(e) {
                                if (r === clearTimeout) return clearTimeout(e);
                                if ((r === u || !r) && clearTimeout) return r = clearTimeout, clearTimeout(e);
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
                    c.push(new m(e, t)), 1 !== c.length || d || s(p)
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
                var g = i.exports.browser,
                    b = i.exports.binding,
                    w = {},
                    E = "browser",
                    P = "browser",
                    x = "browser",
                    S = [],
                    I = {
                        nextTick: i.exports.nextTick,
                        title: i.exports.title,
                        browser: g,
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
                        emitWarning: y,
                        prependListener: i.exports.prependListener,
                        prependOnceListener: i.exports.prependOnceListener,
                        listeners: i.exports.listeners,
                        binding: b,
                        cwd: i.exports.cwd,
                        chdir: i.exports.chdir,
                        umask: i.exports.umask,
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
                        execPath: x,
                        execArgv: S
                    };
                t.addListener = i.exports.addListener, t.arch = P, t.argv = i.exports.argv, t.binding = b, t.browser = g, t.chdir = i.exports.chdir, t.cwd = i.exports.cwd, t.default = I, t.dlopen = y, t.emit = i.exports.emit, t.emitWarning = y, t.env = i.exports.env, t.execArgv = S, t.execPath = x, t.exit = y, t.features = w, t.kill = y, t.listeners = i.exports.listeners, t.memoryUsage = y, t.nextTick = i.exports.nextTick, t.off = i.exports.off, t.on = i.exports.on, t.once = i.exports.once, t.pid = 1, t.platform = E, t.prependListener = i.exports.prependListener, t.prependOnceListener = i.exports.prependOnceListener, t.removeAllListeners = i.exports.removeAllListeners, t.removeListener = i.exports.removeListener, t.title = i.exports.title, t.umask = i.exports.umask, t.uptime = y, t.uvCounters = y, t.version = i.exports.version, t.versions = i.exports.versions, e.exports = I
            },
            467: function(e, t, n) {
                "use strict";
                var r = n(564).Buffer,
                    a = n(844),
                    i = void 0 !== r,
                    o = /"(?:_|\\u005[Ff])(?:_|\\u005[Ff])(?:p|\\u0070)(?:r|\\u0072)(?:o|\\u006[Ff])(?:t|\\u0074)(?:o|\\u006[Ff])(?:_|\\u005[Ff])(?:_|\\u005[Ff])"\s*:/,
                    l = /"(?:c|\\u0063)(?:o|\\u006[Ff])(?:n|\\u006[Ee])(?:s|\\u0073)(?:t|\\u0074)(?:r|\\u0072)(?:u|\\u0075)(?:c|\\u0063)(?:t|\\u0074)(?:o|\\u006[Ff])(?:r|\\u0072)"\s*:/;

                function u(e, t, n) {
                    null == n && null !== t && (void 0 === t ? "undefined" : a._(t)) === "object" && (n = t, t = void 0), i && r.isBuffer(e) && (e = e.toString()), e && 65279 === e.charCodeAt(0) && (e = e.slice(1));
                    var u = JSON.parse(e, t);
                    if (null === u || (void 0 === u ? "undefined" : a._(u)) !== "object") return u;
                    var c = n && n.protoAction || "error",
                        d = n && n.constructorAction || "error";
                    if ("ignore" === c && "ignore" === d) return u;
                    if ("ignore" !== c && "ignore" !== d) {
                        if (!1 === o.test(e) && !1 === l.test(e)) return u
                    } else if ("ignore" !== c && "ignore" === d) {
                        if (!1 === o.test(e)) return u
                    } else if (!1 === l.test(e)) return u;
                    return s(u, {
                        protoAction: c,
                        constructorAction: d,
                        safe: n && n.safe
                    })
                }

                function s(e) {
                    for (var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, n = t.protoAction, r = void 0 === n ? "error" : n, i = t.constructorAction, o = void 0 === i ? "error" : i, l = t.safe, u = [e]; u.length;) {
                        var s = u;
                        u = [];
                        var c = !0,
                            d = !1,
                            f = void 0;
                        try {
                            for (var h, p = s[Symbol.iterator](); !(c = (h = p.next()).done); c = !0) {
                                var m = h.value;
                                if ("ignore" !== r && Object.prototype.hasOwnProperty.call(m, "__proto__")) {
                                    if (!0 === l) return null;
                                    if ("error" === r) throw SyntaxError("Object contains forbidden prototype property");
                                    delete m.__proto__
                                }
                                if ("ignore" !== o && Object.prototype.hasOwnProperty.call(m, "constructor") && null !== m.constructor && "object" === a._(m.constructor) && Object.prototype.hasOwnProperty.call(m.constructor, "prototype")) {
                                    if (!0 === l) return null;
                                    if ("error" === o) throw SyntaxError("Object contains forbidden prototype property");
                                    delete m.constructor
                                }
                                for (var v in m) {
                                    var y = m[v];
                                    y && (void 0 === y ? "undefined" : a._(y)) === "object" && u.push(y)
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
                        return u(e, t, n)
                    } finally {
                        Error.stackTraceLimit = r
                    }
                }
                e.exports = c, e.exports.default = c, e.exports.parse = c, e.exports.safeParse = function(e, t) {
                    var n = Error.stackTraceLimit;
                    Error.stackTraceLimit = 0;
                    try {
                        return u(e, t, {
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
        var a = t[r];
        if (void 0 !== a) return a.exports;
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
        }, n.o = function(e, t) {
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
            var e, t, r, a, i, o, l, u, s, c, d, f, h, p, m, v, y, g, b, w, E, P, x, S, I, A, C, T, k, O, _, N, L, B, R, U, D, M, j, F, H, G, z, V, W, q, K, Z, Y, J, X, $, Q, ee, et, en, er, ea, ei, eo, el, eu, es, ec, ed = window.jQuery,
                ef = n.n(ed),
                eh = window.Roblox;

            function ep(e, t, n, r, a, i, o) {
                try {
                    var l = e[i](o),
                        u = l.value
                } catch (e) {
                    n(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(r, a)
            }

            function em(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, a) {
                        var i = e.apply(t, n);

                        function o(e) {
                            ep(i, r, a, o, l, "next", e)
                        }

                        function l(e) {
                            ep(i, r, a, o, l, "throw", e)
                        }
                        o(void 0)
                    })
                }
            }

            function ev(e, t) {
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
                    l = Object.defineProperty;
                return l(o, "next", {
                    value: u(0)
                }), l(o, "throw", {
                    value: u(1)
                }), l(o, "return", {
                    value: u(2)
                }), "function" == typeof Symbol && l(o, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), o;

                function u(l) {
                    return function(u) {
                        var s = [l, u];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; o && (o = 0, s[0] && (i = 0)), i;) try {
                            if (n = 1, r && (a = 2 & s[0] ? r.return : s[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, s[1])).done) return a;
                            switch (r = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                case 0:
                                case 1:
                                    a = s;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, r = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                        i.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && i.label < a[1]) {
                                        i.label = a[1], a = s;
                                        break
                                    }
                                    if (a && i.label < a[2]) {
                                        i.label = a[2], i.ops.push(s);
                                        break
                                    }
                                    a[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            s = t.call(e, i)
                        } catch (e) {
                            s = [6, e], r = 0
                        } finally {
                            n = a = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var ey = window.React,
                eg = n.n(ey),
                eb = window.TanstackQuery;

            function ew(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function eE(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        ew(e, t, n[t])
                    })
                }
                return e
            }
            var eP = window.Roblox["core-scripts"].environmentUrls,
                ex = n.n(eP),
                eS = window.Roblox["core-lib"].http.index,
                eI = window.Roblox["core-lib"].url.index,
                eA = function() {
                    return eI.Url.parse(ex().metricsApi).getOrThrow().withPath("/v1/games/report-event")
                },
                eC = function(e, t, n) {
                    try {
                        eS.postUntyped(e().withSearchParams(eE({
                            name: t
                        }, n)), "", {
                            credentials: "include",
                            keepalive: !0,
                            signal: AbortSignal.timeout(3e4)
                        })
                    } catch (e) {}
                },
                eT = function() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    t.forEach(function(e) {
                        eC(eA, e)
                    })
                },
                ek = window.Roblox["core-scripts"].http.http,
                eO = window.Roblox["core-scripts"].dataStore,
                e_ = n.n(eO),
                eN = window.Roblox["core-scripts"].guac,
                eL = e_().gamesDataStore,
                eB = function() {
                    return em(function() {
                        return ev(this, function(e) {
                            return [2, (0, eN.callBehaviour)("play-button-ui")]
                        })
                    })()
                },
                eR = function() {
                    var e = {
                        url: "".concat(ex().apiGatewayUrl, "/user-settings-api/v1/user-settings/settings-and-options"),
                        withCredentials: !0
                    };
                    return ek.get(e).then(function(e) {
                        return e.data
                    })
                },
                eU = function(e) {
                    var t = {
                        url: "".concat(ex().apiGatewayUrl, "/experience-guidelines-api/experience-guidelines/get-age-recommendation"),
                        withCredentials: !0
                    };
                    return ek.post(t, {
                        universeId: e
                    }).then(function(e) {
                        return e.data
                    })
                },
                eD = function(e, t) {
                    var n = {
                        url: "".concat(ex().apiGatewayUrl, "/fiat-paid-access-service/v1/purchase"),
                        withCredentials: !0,
                        retryable: !0
                    };
                    return ek.post(n, {
                        rootPlaceId: e,
                        expectedBasePriceId: t
                    }).then(function(e) {
                        var t, n;
                        return null != (n = JSON.parse(null != (t = e.data.checkoutUrl) ? t : "").checkoutUrl) ? n : ""
                    })
                };

            function eM(e, t) {
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
            var ej = {
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
                eF = (ew(en = {}, ej.UnplayableOtherReason, "UnplayableError.UnplayableOther"), ew(en, ej.TemporarilyUnavailable, "UnplayableError.TemporarilyUnavailable"), ew(en, ej.GameUnapproved, "UnplayableError.GameUnapproved"), ew(en, ej.IncorrectConfiguration, "UnplayableError.IncorrectConfiguration"), ew(en, ej.UniverseRootPlaceIsPrivate, "UnplayableError.CreatorHasntMadeAvailable"), ew(en, ej.InsufficientPermissionFriendsOnly, "UnplayableError.CreatorHasntMadeAvailable"), ew(en, ej.InsufficientPermissionGroupOnly, "UnplayableError.CreatorHasntMadeAvailable"), ew(en, ej.InsufficientPermissionEditorsOnly, "UnplayableError.UnplayableOther"), ew(en, ej.InsufficientPermissionPlayTestersOnly, "UnplayableError.UnplayableOther"), ew(en, ej.DeviceRestricted, "UnplayableError.DeviceRestrictedDefault"), ew(en, ej.FiatPurchaseDeviceRestricted, "UnplayableError.FiatPurchaseDeviceRestricted"), ew(en, ej.UnderReview, "UnplayableError.Moderated"), ew(en, ej.AccountRestricted, "UnplayableError.AccountRestricted"), ew(en, ej.ComplianceBlocked, "UnplayableError.ComplianceBlocked"), ew(en, ej.ContextualPlayabilityRegionalAvailability, "UnplayableError.ContextualPlayabilityRegionalAvailability"), ew(en, ej.ContextualPlayabilityRegionalCompliance, "UnplayableError.ContextualPlayabilityRegionalCompliance"), ew(en, ej.ContextualPlayabilityAgeRecommendationParentalControls, "UnplayableError.ContextualPlayabilityAgeRecommendationParentalControls"), ew(en, ej.ContextualPlayabilityAgeGated, "UnplayableError.ContextualPlayabilityAgeGated"), ew(en, ej.PlaceHasNoPublishedVersion, "UnplayableError.CreatorHasntMadeAvailable"), ew(en, ej.ContextualPlayabilityUnrated, "UnplayableError.ContextualPlayabilityUnrated"), ew(en, ej.ContextualPlayabilityGeneral, "UnplayableError.UnplayableOther"), ew(en, ej.ContextualPlayabilityAgeGatedByDescriptor, "UnplayableError.ContextualPlayabilityAgeGatedByDescriptor"), ew(en, ej.ContextualPlayabilityExperienceBlockedParentalControls, "UnplayableError.ContextualPlayabilityExperienceBlockedParentalControls"), ew(en, ej.ContextualPlayabilityRequireParentApproval, "UnplayableError.ContextualPlayabilityRequireParentApproval"), en),
                eH = "PlayButtonMessage.AgreeToNotice",
                eG = {
                    Unlock: "PlayButtonText.Unlock",
                    Unplayable: "PlayButtonText.Unavailable",
                    Buy: "PlayButtonText.Buy",
                    PlayDemo: "PlayButtonText.PlayDemo",
                    PlayOnWeb: "PlayButtonText.PlayOnWeb",
                    PlayOnWebBetaNotice: "PlayButtonText.PlayOnWebBetaNotice",
                    Playtest: "PlayButtonText.Playtest"
                },
                ez = function(e, t) {
                    return {
                        eventName: "playGameClicked",
                        ctx: "click",
                        properties: eM(eE({}, t), {
                            placeId: e
                        }),
                        gamePlayIntentEventCtx: "PlayButton"
                    }
                },
                eV = {
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
                eW = {
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
                eq = "gameJoinAgeCheckRequired",
                eK = "gameJoinContentMaturityLock",
                eZ = {
                    settingChange: "account_management/SettingsChange",
                    accountManagement: "account_management/AccountManagement"
                },
                eY = {
                    playabilityStatus: ej.TemporarilyUnavailable,
                    isPlayable: void 0,
                    unplayableDisplayText: void 0,
                    playableUxTreatment: void 0,
                    upsellUxTreatment: void 0,
                    demoModeAvailable: void 0,
                    privatePlaytestInfo: void 0
                },
                eJ = function(e) {
                    var t = !(arguments.length > 1) || void 0 === arguments[1] || arguments[1],
                        n = (0, eb.useQuery)({
                            queryKey: ["playabilityStatus", e],
                            queryFn: function() {
                                return em(function() {
                                    var t, n;
                                    return ev(this, function(r) {
                                        switch (r.label) {
                                            case 0:
                                                if (!e) throw eT(eV.PlayabilityStatusFetchInvalidUniverseId), Error("Invalid universe ID for playability status fetch");
                                                r.label = 1;
                                            case 1:
                                                var a;
                                                return r.trys.push([1, 3, , 4]), [4, (a = [e], em(function() {
                                                    var e;
                                                    return ev(this, function(t) {
                                                        switch (t.label) {
                                                            case 0:
                                                                return [4, eL.getPlayabilityStatus(a)];
                                                            case 1:
                                                                return [2, (void 0 === (e = t.sent().data) ? [] : e)[0]]
                                                        }
                                                    })
                                                })())];
                                            case 2:
                                                return n = r.sent(), [3, 4];
                                            case 3:
                                                throw r.sent(), eT(eV.PlayabilityStatusFetchFailed), Error("Playability status fetch failed");
                                            case 4:
                                                if (!(null == n ? void 0 : n.playabilityStatus) || void 0 === n.isPlayable) throw eT(eV.PlayabilityStatusFetchInvalidResponse), Error("Invalid playability status response");
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
                        a = n.isFetching,
                        i = n.isError,
                        o = n.refetch,
                        l = (0, ey.useCallback)(function() {
                            o()
                        }, [o]);
                    return (0, ey.useEffect)(function() {
                        var e = function(e) {
                            e.persisted && t && l()
                        };
                        return window.addEventListener("pageshow", e),
                            function() {
                                window.removeEventListener("pageshow", e)
                            }
                    }, [l, t]), (0, ey.useMemo)(function() {
                        return i ? {
                            playabilityStatus: eY.playabilityStatus,
                            isPlayable: eY.isPlayable,
                            unplayableDisplayText: eY.unplayableDisplayText,
                            playableUxTreatment: eY.playableUxTreatment,
                            upsellUxTreatment: eY.upsellUxTreatment,
                            demoModeAvailable: eY.demoModeAvailable,
                            privatePlaytestInfo: eY.privatePlaytestInfo,
                            isFetchingPlayability: a,
                            refetchPlayabilityData: l
                        } : {
                            playabilityStatus: null == r ? void 0 : r.playabilityStatus,
                            isPlayable: null == r ? void 0 : r.isPlayable,
                            unplayableDisplayText: null == r ? void 0 : r.unplayableDisplayText,
                            playableUxTreatment: null == r ? void 0 : r.playableUxTreatment,
                            upsellUxTreatment: null == r ? void 0 : r.upsellUxTreatment,
                            demoModeAvailable: null == r ? void 0 : r.demoModeAvailable,
                            privatePlaytestInfo: null == r ? void 0 : r.privatePlaytestInfo,
                            isFetchingPlayability: a,
                            refetchPlayabilityData: l
                        }
                    }, [r, i, a, l])
                };

            function eX(e, t) {
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
            }
            var e$ = window.Roblox["core-scripts"].endpoints,
                eQ = window.Roblox["core-scripts"].game,
                e0 = window.Roblox["core-scripts"].eventStream,
                e1 = window.Roblox["core-scripts"].util.url,
                e2 = "function" == typeof crypto.randomUUID,
                e3 = function() {
                    var e = new Uint8Array(16);
                    crypto.getRandomValues(e);
                    var t = Array.from(e, function(e, t) {
                        return (6 === t ? 15 & e | 64 : 8 === t ? 63 & e | 128 : e).toString(16).padStart(2, "0")
                    });
                    return "".concat(t.slice(0, 4).join(""), "-").concat(t.slice(4, 6).join(""), "-").concat(t.slice(6, 8).join(""), "-") + "".concat(t.slice(8, 10).join(""), "-").concat(t.slice(10, 16).join(""))
                },
                e5 = function() {
                    return e2 ? crypto.randomUUID() : e3()
                },
                e4 = window.Roblox["core-scripts"].meta.device,
                e6 = function(e, t, n) {
                    return new Promise(function(r) {
                        var a = new CustomEvent(e, {
                            cancelable: !0,
                            detail: t(r)
                        });
                        window.dispatchEvent(a) && r(n)
                    })
                },
                e8 = function() {
                    return null
                };

            function e7(e) {
                if (Array.isArray(e)) return e
            }

            function e9() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function te(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function tt(e, t) {
                if (e) {
                    if ("string" == typeof e) return te(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return te(e, t)
                }
            }

            function tn(e, t) {
                return e7(e) || function(e, t) {
                    var n, r, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var i = [],
                            o = !0,
                            l = !1;
                        try {
                            for (a = a.call(e); !(o = (n = a.next()).done) && (i.push(n.value), !t || i.length !== t); o = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                o || null == a.return || a.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return i
                    }
                }(e, t) || tt(e, t) || e9()
            }
            var tr = globalThis.window,
                ta = globalThis.navigator,
                ti = void 0 === tr ? void 0 : tr,
                to = null == ti || void 0 === ta ? void 0 : ta,
                tl = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : null == to ? void 0 : to.userAgent;
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

            function tu(e) {
                return (tu = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function ts() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (ts = function() {
                    return !!e
                })()
            }
            var tc = n(844);

            function td(e, t, n) {
                t = tu(t);
                var r = ts() ? Reflect.construct(t, n || [], tu(e).constructor) : t.apply(e, n);
                if (r && ("object" === (0, tc._)(r) || "function" == typeof r)) return r;
                if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                return e
            }
            var tf = n(784);

            function th(e, t) {
                if (!(0, tf._)(e, t)) throw TypeError("Cannot call a class as a function")
            }

            function tp(e, t) {
                return (tp = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function tm(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Super expression must either be null or a function");
                e.prototype = Object.create(t && t.prototype, {
                    constructor: {
                        value: e,
                        writable: !0,
                        configurable: !0
                    }
                }), t && tp(e, t)
            }

            function tv(e, t, n) {
                return (tv = ts() ? Reflect.construct : function(e, t, n) {
                    var r = [null];
                    r.push.apply(r, t);
                    var a = new(Function.bind.apply(e, r));
                    return n && tp(a, n.prototype), a
                }).apply(null, arguments)
            }

            function ty(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (ty = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, n)
                    }

                    function n() {
                        return tv(e, arguments, tu(this).constructor)
                    }
                    return n.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: n,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), tp(n, e)
                })(e)
            }

            function tg(e, t, n) {
                function r(n, r) {
                    var a, i;
                    for (var l in Object.defineProperty(n, "_zod", {
                            value: null != (a = n._zod) ? a : {},
                            enumerable: !1
                        }), null != (i = n._zod).traits || (i.traits = new Set), n._zod.traits.add(e), t(n, r), o.prototype) l in n || Object.defineProperty(n, l, {
                        value: o.prototype[l].bind(n)
                    });
                    n._zod.constr = o, n._zod.def = r
                }
                var a, i = function(e) {
                    function t() {
                        return th(this, t), td(this, t, arguments)
                    }
                    return tm(t, e), t
                }(null != (a = null == n ? void 0 : n.Parent) ? a : Object);

                function o(e) {
                    var t = (null == n ? void 0 : n.Parent) ? new i : this;
                    r(t, e), null != (s = t._zod).deferred || (s.deferred = []);
                    var a = !0,
                        o = !1,
                        l = void 0;
                    try {
                        for (var u, s, c, d = t._zod.deferred[Symbol.iterator](); !(a = (c = d.next()).done); a = !0)(0, c.value)()
                    } catch (e) {
                        o = !0, l = e
                    } finally {
                        try {
                            a || null == d.return || d.return()
                        } finally {
                            if (o) throw l
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
                        return !!((null == n ? void 0 : n.Parent) && (0, tf._)(t, n.Parent)) || (null == t || null == (a = t._zod) || null == (r = a.traits) ? void 0 : r.has(e))
                    }
                }), Object.defineProperty(o, "name", {
                    value: e
                }), o
            }
            Object.freeze({
                status: "aborted"
            }), Symbol("zod_brand");
            var tb = function(e) {
                function t() {
                    return th(this, t), td(this, t, ["Encountered Promise during synchronous parse. Use .parseAsync() instead."])
                }
                return tm(t, e), t
            }(ty(Error));
            ty(Error);
            var tw = {};

            function tE(e) {
                return e && Object.assign(tw, e), tw
            }

            function tP(e) {
                if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
            }

            function tx(e) {
                return function(e) {
                    if (Array.isArray(e)) return te(e)
                }(e) || tP(e) || tt(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tS(e, t) {
                return (void 0 === t ? "undefined" : (0, tc._)(t)) === "bigint" ? t.toString() : t
            }

            function tI(e) {
                return {
                    get value() {
                        var t = e();
                        return Object.defineProperty(this, "value", {
                            value: t
                        }), t
                    }
                }
            }

            function tA(e) {
                var t = +!!e.startsWith("^"),
                    n = e.endsWith("$") ? e.length - 1 : e.length;
                return e.slice(t, n)
            }
            var tC = Symbol("evaluating");

            function tT(e, t, n) {
                var r = void 0;
                Object.defineProperty(e, t, {
                    get: function() {
                        if (r !== tC) return void 0 === r && (r = tC, r = n()), r
                    },
                    set: function(n) {
                        Object.defineProperty(e, t, {
                            value: n
                        })
                    },
                    configurable: !0
                })
            }
            var tk = "captureStackTrace" in Error ? Error.captureStackTrace : function() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n]
            };

            function tO(e) {
                return e.replace(/[.*+?^${}()|[\]\\]/g, "\\$&")
            }

            function t_(e) {
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
                return (delete e.message, "string" == typeof e.error) ? eM(eE({}, e), {
                    error: function() {
                        return e.error
                    }
                }) : e
            }

            function tN(e) {
                var t, n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
                if (!0 === e.aborted) return !0;
                for (var r = n; r < e.issues.length; r++)
                    if ((null == (t = e.issues[r]) ? void 0 : t.continue) !== !0) return !0;
                return !1
            }

            function tL(e, t) {
                return t.map(function(t) {
                    return null != t.path || (t.path = []), t.path.unshift(e), t
                })
            }

            function tB(e) {
                return "string" == typeof e ? e : null == e ? void 0 : e.message
            }

            function tR(e, t, n) {
                var r, a, i, o, l, u, s, c, d, f, h, p = eM(eE({}, e), {
                    path: null != (r = e.path) ? r : []
                });
                return e.message || (p.message = null != (a = null != (i = null != (o = null != (l = tB(null == (c = e.inst) || null == (s = c._zod.def) || null == (u = s.error) ? void 0 : u.call(s, e))) ? l : tB(null == t || null == (d = t.error) ? void 0 : d.call(t, e))) ? o : tB(null == (f = n.customError) ? void 0 : f.call(n, e))) ? i : tB(null == (h = n.localeError) ? void 0 : h.call(n, e))) ? a : "Invalid input"), delete p.inst, delete p.continue, (null == t ? void 0 : t.reportInput) || delete p.input, p
            }
            tI(function() {
                var e, t;
                if ("u" > typeof navigator && (null == (t = navigator) || null == (e = t.userAgent) ? void 0 : e.includes("Cloudflare"))) return !1;
                try {
                    return Function(""), !0
                } catch (e) {
                    return !1
                }
            });
            var tU = function(e, t) {
                    e.name = "$ZodError", Object.defineProperty(e, "_zod", {
                        value: e._zod,
                        enumerable: !1
                    }), Object.defineProperty(e, "issues", {
                        value: t,
                        enumerable: !1
                    }), e.message = JSON.stringify(t, tS, 2), Object.defineProperty(e, "toString", {
                        value: function() {
                            return e.message
                        },
                        enumerable: !1
                    })
                },
                tD = tg("$ZodError", tU),
                tM = tg("$ZodError", tU, {
                    Parent: Error
                }),
                tj = (e = tM, function(t, n, r, a) {
                    var i = r ? Object.assign(r, {
                            async: !1
                        }) : {
                            async: !1
                        },
                        o = t._zod.run({
                            value: n,
                            issues: []
                        }, i);
                    if ((0, tf._)(o, Promise)) throw new tb;
                    if (o.issues.length) {
                        var l, u = new(null != (l = null == a ? void 0 : a.Err) ? l : e)(o.issues.map(function(e) {
                            return tR(e, i, tE())
                        }));
                        throw tk(u, null == a ? void 0 : a.callee), u
                    }
                    return o.value
                }),
                tF = (t = tM, function(e, n, r, a) {
                    return em(function() {
                        var i, o, l, u;
                        return ev(this, function(s) {
                            switch (s.label) {
                                case 0:
                                    if (i = r ? Object.assign(r, {
                                            async: !0
                                        }) : {
                                            async: !0
                                        }, o = e._zod.run({
                                            value: n,
                                            issues: []
                                        }, i), !(0, tf._)(o, Promise)) return [3, 2];
                                    return [4, o];
                                case 1:
                                    o = s.sent(), s.label = 2;
                                case 2:
                                    if (o.issues.length) throw tk(u = new(null != (l = null == a ? void 0 : a.Err) ? l : t)(o.issues.map(function(e) {
                                        return tR(e, i, tE())
                                    })), null == a ? void 0 : a.callee), u;
                                    return [2, o.value]
                            }
                        })
                    })()
                }),
                tH = (r = tM, function(e, t, n) {
                    var a = n ? eM(eE({}, n), {
                            async: !1
                        }) : {
                            async: !1
                        },
                        i = e._zod.run({
                            value: t,
                            issues: []
                        }, a);
                    if ((0, tf._)(i, Promise)) throw new tb;
                    return i.issues.length ? {
                        success: !1,
                        error: new(null != r ? r : tD)(i.issues.map(function(e) {
                            return tR(e, a, tE())
                        }))
                    } : {
                        success: !0,
                        data: i.value
                    }
                }),
                tG = (a = tM, function(e, t, n) {
                    return em(function() {
                        var r, i;
                        return ev(this, function(o) {
                            switch (o.label) {
                                case 0:
                                    if (r = n ? Object.assign(n, {
                                            async: !0
                                        }) : {
                                            async: !0
                                        }, i = e._zod.run({
                                            value: t,
                                            issues: []
                                        }, r), !(0, tf._)(i, Promise)) return [3, 2];
                                    return [4, i];
                                case 1:
                                    i = o.sent(), o.label = 2;
                                case 2:
                                    return [2, i.issues.length ? {
                                        success: !1,
                                        error: new a(i.issues.map(function(e) {
                                            return tR(e, r, tE())
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
            var tz = function(e) {
                    var t, n, r = e ? "[\\s\\S]{".concat(null != (t = null == e ? void 0 : e.minimum) ? t : 0, ",").concat(null != (n = null == e ? void 0 : e.maximum) ? n : "", "}") : "[\\s\\S]*";
                    return new RegExp("^".concat(r, "$"))
                },
                tV = {
                    major: 4,
                    minor: 1,
                    patch: 11
                },
                tW = tg("$ZodType", function(e, t) {
                    null != e || (e = {}), e._zod.def = t, e._zod.bag = e._zod.bag || {}, e._zod.version = tV;
                    var n, r = tx(null != (l = e._zod.def.checks) ? l : []);
                    e._zod.traits.has("$ZodCheck") && r.unshift(e);
                    var a = !0,
                        i = !1,
                        o = void 0;
                    try {
                        for (var l, u, s, c = r[Symbol.iterator](); !(a = (s = c.next()).done); a = !0) {
                            var d = s.value,
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
                        i = !0, o = e
                    } finally {
                        try {
                            a || null == c.return || c.return()
                        } finally {
                            if (i) throw o
                        }
                    }
                    if (0 === r.length) null != (u = e._zod).deferred || (u.deferred = []), null == (n = e._zod.deferred) || n.push(function() {
                        e._zod.run = e._zod.parse
                    });
                    else {
                        var y = function(e, t, n) {
                                var r = tN(e),
                                    a = !0,
                                    i = !1,
                                    o = void 0;
                                try {
                                    for (var l, u, s = t[Symbol.iterator](); !(a = (u = s.next()).done); a = !0) ! function() {
                                        var t = u.value;
                                        if (t._zod.def.when) {
                                            if (!t._zod.def.when(e)) return
                                        } else if (r) return;
                                        var a = e.issues.length,
                                            i = t._zod.check(e);
                                        if ((0, tf._)(i, Promise) && (null == n ? void 0 : n.async) === !1) throw new tb;
                                        if (l || (0, tf._)(i, Promise)) l = (null != l ? l : Promise.resolve()).then(function() {
                                            return em(function() {
                                                return ev(this, function(t) {
                                                    switch (t.label) {
                                                        case 0:
                                                            return [4, i];
                                                        case 1:
                                                            if (t.sent(), e.issues.length === a) return [2];
                                                            return r || (r = tN(e, a)), [2]
                                                    }
                                                })
                                            })()
                                        });
                                        else {
                                            if (e.issues.length === a) return;
                                            r || (r = tN(e, a))
                                        }
                                    }()
                                } catch (e) {
                                    i = !0, o = e
                                } finally {
                                    try {
                                        a || null == s.return || s.return()
                                    } finally {
                                        if (i) throw o
                                    }
                                }
                                return l ? l.then(function() {
                                    return e
                                }) : e
                            },
                            g = function(t, n, a) {
                                if (tN(t)) return t.aborted = !0, t;
                                var i = y(n, r, a);
                                if ((0, tf._)(i, Promise)) {
                                    if (!1 === a.async) throw new tb;
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
                                }, eM(eE({}, n), {
                                    skipChecks: !0
                                }));
                                return (0, tf._)(a, Promise) ? a.then(function(e) {
                                    return g(e, t, n)
                                }) : g(a, t, n)
                            }
                            var i = e._zod.parse(t, n);
                            if ((0, tf._)(i, Promise)) {
                                if (!1 === n.async) throw new tb;
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
                                var n, r = tH(e, t);
                                return r.success ? {
                                    value: r.data
                                } : {
                                    issues: null == (n = r.error) ? void 0 : n.issues
                                }
                            } catch (n) {
                                return tG(e, t).then(function(e) {
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
                tq = tg("$ZodString", function(e, t) {
                    var n, r, a;
                    tW.init(e, t), e._zod.pattern = null != (n = tx(null != (r = null == e || null == (a = e._zod.bag) ? void 0 : a.patterns) ? r : []).pop()) ? n : tz(e._zod.bag), e._zod.parse = function(n, r) {
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

            function tK(e, t, n) {
                if (e.issues.length) {
                    var r;
                    (r = t.issues).push.apply(r, tx(tL(n, e.issues)))
                }
                t.value[n] = e.value
            }
            var tZ = tg("$ZodArray", function(e, t) {
                tW.init(e, t), e._zod.parse = function(n, r) {
                    var a = function(e) {
                            var a = i[e],
                                l = t.element._zod.run({
                                    value: a,
                                    issues: []
                                }, r);
                            (0, tf._)(l, Promise) ? o.push(l.then(function(t) {
                                return tK(t, n, e)
                            })): tK(l, n, e)
                        },
                        i = n.value;
                    if (!Array.isArray(i)) return n.issues.push({
                        expected: "array",
                        code: "invalid_type",
                        input: i,
                        inst: e
                    }), n;
                    n.value = Array(i.length);
                    for (var o = [], l = 0; l < i.length; l++) a(l);
                    return o.length ? Promise.all(o).then(function() {
                        return n
                    }) : n
                }
            });

            function tY(e, t, n, r) {
                if (e.issues.length) {
                    var a;
                    (a = t.issues).push.apply(a, tx(tL(n, e.issues)))
                }
                void 0 === e.value ? n in r && (t.value[n] = void 0) : t.value[n] = e.value
            }
            var tJ = tg("$ZodObject", function(e, t) {
                    tW.init(e, t);
                    var n, r = Object.getOwnPropertyDescriptor(t, "shape");
                    if (!(null == r ? void 0 : r.get)) {
                        var a = t.shape;
                        Object.defineProperty(t, "shape", {
                            get: function() {
                                var e = eE({}, a);
                                return Object.defineProperty(t, "shape", {
                                    value: e
                                }), e
                            }
                        })
                    }
                    var i = tI(function() {
                        return function(e) {
                            var t, n = Object.keys(e.shape),
                                r = !0,
                                a = !1,
                                i = void 0;
                            try {
                                for (var o, l = n[Symbol.iterator](); !(r = (o = l.next()).done); r = !0) {
                                    var u, s, c, d, f = o.value;
                                    if (!(null == (d = e.shape) || null == (c = d[f]) || null == (s = c._zod) || null == (u = s.traits) ? void 0 : u.has("$ZodType"))) throw Error('Invalid element at key "'.concat(f, '": expected a Zod schema'))
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
                            var h = Object.keys(t = e.shape).filter(function(e) {
                                return "optional" === t[e]._zod.optin && "optional" === t[e]._zod.optout
                            });
                            return eM(eE({}, e), {
                                keys: n,
                                keySet: new Set(n),
                                numKeys: n.length,
                                optionalKeys: new Set(h)
                            })
                        }(t)
                    });
                    tT(e._zod, "propValues", function() {
                        var e = t.shape,
                            n = {};
                        for (var r in e) {
                            var a = e[r]._zod;
                            if (a.values) {
                                null != n[r] || (n[r] = new Set);
                                var i = !0,
                                    o = !1,
                                    l = void 0;
                                try {
                                    for (var u, s, c = a.values[Symbol.iterator](); !(i = (s = c.next()).done); i = !0) {
                                        var d = s.value;
                                        n[r].add(d)
                                    }
                                } catch (e) {
                                    o = !0, l = e
                                } finally {
                                    try {
                                        i || null == c.return || c.return()
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
                        null != n || (n = i.value);
                        var a = t.value;
                        if (!((void 0 === (f = a) ? "undefined" : (0, tc._)(f)) === "object" && null !== f && !Array.isArray(f))) return t.issues.push({
                            expected: "object",
                            code: "invalid_type",
                            input: a,
                            inst: e
                        }), t;
                        t.value = {};
                        var l = [],
                            u = n.shape,
                            s = !0,
                            c = !1,
                            d = void 0;
                        try {
                            for (var f, h, p = n.keys[Symbol.iterator](); !(s = (h = p.next()).done); s = !0) ! function() {
                                var e = h.value,
                                    n = u[e]._zod.run({
                                        value: a[e],
                                        issues: []
                                    }, r);
                                (0, tf._)(n, Promise) ? l.push(n.then(function(n) {
                                    return tY(n, t, e, a)
                                })): tY(n, t, e, a)
                            }()
                        } catch (e) {
                            c = !0, d = e
                        } finally {
                            try {
                                s || null == p.return || p.return()
                            } finally {
                                if (c) throw d
                            }
                        }
                        return o ? function(e, t, n, r, a, i) {
                            var o = [],
                                l = a.keySet,
                                u = a.catchall._zod,
                                s = u.def.type,
                                c = !0,
                                d = !1,
                                f = void 0;
                            try {
                                for (var h, p = Object.keys(t)[Symbol.iterator](); !(c = (h = p.next()).done); c = !0) ! function() {
                                    var a = h.value;
                                    if (!l.has(a)) {
                                        if ("never" === s) return o.push(a);
                                        var i = u.run({
                                            value: t[a],
                                            issues: []
                                        }, r);
                                        (0, tf._)(i, Promise) ? e.push(i.then(function(e) {
                                            return tY(e, n, a, t)
                                        })): tY(i, n, a, t)
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
                                inst: i
                            }), e.length) ? Promise.all(e).then(function() {
                                return n
                            }) : n
                        }(l, a, t, r, i.value, e) : l.length ? Promise.all(l).then(function() {
                            return t
                        }) : t
                    }
                }),
                tX = tg("$ZodLiteral", function(e, t) {
                    if (tW.init(e, t), 0 === t.values.length) throw Error("Cannot create literal schema with no valid values");
                    e._zod.values = new Set(t.values), e._zod.pattern = new RegExp("^(".concat(t.values.map(function(e) {
                        return "string" == typeof e ? tO(e) : e ? tO(e.toString()) : String(e)
                    }).join("|"), ")$")), e._zod.parse = function(n, r) {
                        var a = n.value;
                        return e._zod.values.has(a) || n.issues.push({
                            code: "invalid_value",
                            values: t.values,
                            input: a,
                            inst: e
                        }), n
                    }
                });

            function t$(e, t) {
                return e.issues.length && void 0 === t ? {
                    issues: [],
                    value: void 0
                } : e
            }
            var tQ = tg("$ZodOptional", function(e, t) {
                    tW.init(e, t), e._zod.optin = "optional", e._zod.optout = "optional", tT(e._zod, "values", function() {
                        return t.innerType._zod.values ? new Set(tx(t.innerType._zod.values).concat([void 0])) : void 0
                    }), tT(e._zod, "pattern", function() {
                        var e = t.innerType._zod.pattern;
                        return e ? new RegExp("^(".concat(tA(e.source), ")?$")) : void 0
                    }), e._zod.parse = function(e, n) {
                        if ("optional" === t.innerType._zod.optin) {
                            var r = t.innerType._zod.run(e, n);
                            return (0, tf._)(r, Promise) ? r.then(function(t) {
                                return t$(t, e.value)
                            }) : t$(r, e.value)
                        }
                        return void 0 === e.value ? e : t.innerType._zod.run(e, n)
                    }
                }),
                t0 = tg("$ZodNullable", function(e, t) {
                    tW.init(e, t), tT(e._zod, "optin", function() {
                        return t.innerType._zod.optin
                    }), tT(e._zod, "optout", function() {
                        return t.innerType._zod.optout
                    }), tT(e._zod, "pattern", function() {
                        var e = t.innerType._zod.pattern;
                        return e ? new RegExp("^(".concat(tA(e.source), "|null)$")) : void 0
                    }), tT(e._zod, "values", function() {
                        return t.innerType._zod.values ? new Set(tx(t.innerType._zod.values).concat([null])) : void 0
                    }), e._zod.parse = function(e, n) {
                        return null === e.value ? e : t.innerType._zod.run(e, n)
                    }
                });
            Symbol("ZodOutput"), Symbol("ZodInput");
            var t1 = tg("ZodMiniType", function(e, t) {
                    if (!e._zod) throw Error("Uninitialized schema in ZodMiniType.");
                    tW.init(e, t), e.def = t, e.type = t.type, e.parse = function(t, n) {
                        return tj(e, t, n, {
                            callee: e.parse
                        })
                    }, e.safeParse = function(t, n) {
                        return tH(e, t, n)
                    }, e.parseAsync = function(t, n) {
                        return em(function() {
                            return ev(this, function(r) {
                                return [2, tF(e, t, n, {
                                    callee: e.parseAsync
                                })]
                            })
                        })()
                    }, e.safeParseAsync = function(t, n) {
                        return em(function() {
                            return ev(this, function(r) {
                                return [2, tG(e, t, n)]
                            })
                        })()
                    }, e.check = function() {
                        for (var n, r = arguments.length, a = Array(r), i = 0; i < r; i++) a[i] = arguments[i];
                        return e.clone(eM(eE({}, t), {
                            checks: tx(null != (n = t.checks) ? n : []).concat(tx(a.map(function(e) {
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
                t2 = tg("ZodMiniString", function(e, t) {
                    tq.init(e, t), t1.init(e, t)
                });

            function t3(e) {
                return new t2(eE({
                    type: "string"
                }, t_(e)))
            }
            var t5 = tg("ZodMiniArray", function(e, t) {
                    tZ.init(e, t), t1.init(e, t)
                }),
                t4 = tg("ZodMiniObject", function(e, t) {
                    tJ.init(e, t), t1.init(e, t), tT(e, "shape", function() {
                        return t.shape
                    })
                });

            function t6(e, t) {
                return new t4(eE({
                    type: "object",
                    shape: null != e ? e : {}
                }, t_(t)))
            }
            var t8 = tg("ZodMiniLiteral", function(e, t) {
                    tX.init(e, t), t1.init(e, t)
                }),
                t7 = tg("ZodMiniOptional", function(e, t) {
                    tQ.init(e, t), t1.init(e, t)
                }),
                t9 = tg("ZodMiniNullable", function(e, t) {
                    t0.init(e, t), t1.init(e, t)
                });

            function ne(e, t) {
                for (var n = 0; n < t.length; n++) {
                    var r = t[n];
                    r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
                }
            }

            function nt(e, t, n) {
                return t && ne(e.prototype, t), n && ne(e, n), e
            }
            n(467);
            var nn = function() {
                    function e(t) {
                        th(this, e), ew(this, "value", void 0), this.value = t
                    }
                    return nt(e, [{
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
                            return na.fromResult(this.cast())
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
                nr = function() {
                    function e(t) {
                        th(this, e), ew(this, "error", void 0), this.error = t
                    }
                    return nt(e, [{
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
                            return na.fromResult(this.cast())
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
            (er || (er = {})).all = function(e) {
                var t = e.findIndex(function(e) {
                    return e.isErr()
                });
                return -1 === t ? new nn(e.map(function(e) {
                    return e.getOrNull()
                })) : e[t]
            };
            var na = function() {
                    function e(t) {
                        th(this, e), ew(this, "promise", void 0), this.promise = t
                    }
                    return nt(e, [{
                        key: "map",
                        value: function(t) {
                            return new e(this.promise.then(function(e) {
                                return em(function() {
                                    var n, r;
                                    return ev(this, function(a) {
                                        switch (a.label) {
                                            case 0:
                                                if (!e.isOk()) return [3, 2];
                                                return r = nn.bind, [4, t(e.value)];
                                            case 1:
                                                return n = new(r.apply(nn, [void 0, a.sent()])), [3, 3];
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
                                return em(function() {
                                    var n, r;
                                    return ev(this, function(a) {
                                        switch (a.label) {
                                            case 0:
                                                if (!e.isErr()) return [3, 2];
                                                return r = nr.bind, [4, t(e.error)];
                                            case 1:
                                                return n = new(r.apply(nr, [void 0, a.sent()])), [3, 3];
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
                                return (0, tf._)(r, e) ? r.promise : r
                            }))
                        }
                    }, {
                        key: "orElse",
                        value: function(t) {
                            return new e(this.promise.then(function(n) {
                                if (n.isOk()) return n.cast();
                                var r = t(n.error);
                                return (0, tf._)(r, e) ? r.promise : r
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
                                return new nn(e)
                            }).catch(function(e) {
                                return new nr(n(e))
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
                            return (0, tf._)(t, e) ? t : (0, tf._)(t, Promise) ? e.fromPromiseResult(t) : e.fromResult(t)
                        }
                    }, {
                        key: "fn",
                        value: function(t) {
                            return function() {
                                for (var n = arguments.length, r = Array(n), a = 0; a < n; a++) r[a] = arguments[a];
                                return e.fromPromiseResult(t.apply(void 0, tx(r)))
                            }
                        }
                    }, {
                        key: "all",
                        value: function(t) {
                            return new e(Promise.all(t).then(er.all))
                        }
                    }]), e
                }(),
                ni = function(e) {
                    return new nn(e)
                },
                no = function(e) {
                    return new nr(e)
                };
            ty(Error);
            var nl = function(e) {
                    function t(e) {
                        var n;
                        return th(this, t), ew(n = td(this, t, [e.message, {
                            cause: e
                        }]), "cause", void 0), n.cause = e, n
                    }
                    return tm(t, e), t
                }(ty(Error)),
                nu = function(e, t) {
                    try {
                        return ni(JSON.stringify(e, void 0, t))
                    } catch (e) {
                        return no(new nl(e))
                    }
                },
                ns = function(e, t) {
                    return eI.Url.parse("".concat(e.replace(/\/+$/, "")).concat(t)).getOrThrow()
                },
                nc = t6({
                    status: t3()
                }),
                nd = ["Unknown", "BootstrapperInstalling", "AppStarted", "AcquiringGame", "JoiningGame", "InGame", "LeftGame"],
                nf = function() {
                    return em(function() {
                        var e, t, n, r;
                        return ev(this, function(a) {
                            switch (a.label) {
                                case 0:
                                    return [4, eS.getUntyped(ns(ex().authApi, "/v1/client-assertion/"), {
                                        credentials: "include"
                                    })];
                                case 1:
                                    return t = a.sent(), [4, eS.fetch(ns(ex().authApi, "/v1/authentication-ticket/"), {
                                        method: "POST",
                                        credentials: "include",
                                        headers: {
                                            "content-type": "application/json"
                                        },
                                        body: nu(null != (e = t.isOk() ? t.value : null) ? e : {}).getOrThrow()
                                    })];
                                case 2:
                                    if ((n = a.sent()).isErr() || !(r = n.value.headers.get("rbx-authentication-ticket"))) return [2, void 0];
                                    return [2, r]
                            }
                        })
                    })()
                },
                nh = function(e) {
                    return "play" !== e
                },
                np = ["sitetest1.robloxlabs.com", "sitetest2.robloxlabs.com", "sitetest3.robloxlabs.com"],
                nm = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : ex().domain;
                    return np.includes(t) ? "".concat(e, "-").concat(t.split(".")[0]) : e
                },
                nv = function(e, t, n) {
                    var r = ["1", "launchmode:".concat(e.launchMode)];
                    return t && r.push("gameinfo:".concat(encodeURIComponent(t))), r.push("launchtime:".concat(String(e.launchTime))), n && (null != n.userId && r.push("distributorType:Global", "userId:".concat(String(n.userId))), r.push("browser:".concat(n.browser))), Object.entries(e.otherParams).forEach(function(e) {
                        var t = tn(e, 2),
                            n = t[0],
                            a = t[1];
                        r.push(n === a ? n : "".concat(n, ":").concat(encodeURIComponent(String(a))))
                    }), "".concat(e.protocolName, ":").concat(r.join("+"))
                },
                ny = function() {
                    var e, t, n;
                    return null != e8() || null != (e = null == (n = window.Roblox) || null == (t = n.GameLauncher) ? void 0 : t.isJoinAttemptIdEnabled()) && e
                },
                ng = function(e, t, n, r) {
                    var a = n.eventName,
                        i = n.ctx,
                        o = n.gamePlayIntentEventCtx,
                        l = n.properties,
                        u = t.rootPlaceId,
                        s = t.placeId,
                        c = t.gameInstanceId,
                        d = t.playerId,
                        f = t.joinData,
                        h = t.privateServerLinkCode,
                        p = t.referredByPlayerId,
                        m = t.isEarlyTesting;
                    if (null != s) {
                        var v = e5(),
                            y = function(e) {
                                return eE(eM(eE({}, e), {
                                    joinAttemptId: null != v ? v : e5()
                                }), o ? {
                                    joinAttemptOrigin: o
                                } : {})
                            },
                            g = function(e) {
                                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                                (0, e0.sendEventWithTarget)(a, i, eE(eM(eE({}, l), {
                                    joinAttemptId: v
                                }), t, null == r ? {} : {
                                    actionType: r
                                })), (0, e0.sendGamePlayEvent)(o, e, void 0, v, r)
                            };
                        return s === u && c ? (g(u, {
                            gameInstanceId: c
                        }), e.joinGameInstance(y({
                            placeId: s,
                            gameId: c,
                            isPlayTogetherGame: !0,
                            referredByPlayerId: p
                        }))) : u && d ? (g(u, {
                            playerId: d
                        }), e.followPlayerIntoGame(y({
                            userId: d
                        }))) : h ? (g(s), e.joinPrivateGame(y({
                            placeId: s,
                            linkCode: h
                        }))) : (g(s), e.joinMultiplayerGame(y({
                            placeId: s,
                            isPlayTogetherGame: !1,
                            launchData: null == f ? void 0 : f.launchData,
                            eventId: null == f ? void 0 : f.eventId,
                            referredByPlayerId: p,
                            isEarlyTesting: !0 === m ? "true" : void 0
                        })))
                    }
                },
                nb = function(e, t, n) {
                    var r = e8();
                    null == r ? (0, eQ.launchGame)(e, t, n) : ng(r, e, t, n)
                },
                nw = function(e) {
                    var t = e.featureName,
                        n = e.redirectLink,
                        r = e.ampFeatureCheckData,
                        a = void 0 === r ? [] : r,
                        i = e.isAsyncCall,
                        o = void 0 === i || i,
                        l = e.usePrologue,
                        u = void 0 !== l && l,
                        s = e.ampRecourseData,
                        c = void 0 === s ? null : s,
                        d = e.featureSpecificData,
                        f = e.namespace,
                        h = e.wizardIntent;
                    return e6("StartAccessManagementUpsell", function(e) {
                        return {
                            featureName: t,
                            redirectLink: null != n ? n : null,
                            ampFeatureCheckData: a,
                            isAsyncCall: o,
                            usePrologue: u,
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
                nE = "true" === n(773).env.NEXT_PUBLIC_IS_NEXTJS,
                nP = function() {
                    if (nE) return nw;
                    var e = null == ti ? void 0 : ti.Roblox.AccessManagementUpsellV2Service;
                    return e && function(t) {
                        return e.startAccessManagementUpsell(t)
                    }
                },
                nx = "AgeVerification",
                nS = "UpdatePlaytestSettings",
                nI = {
                    pid: "experiencestart_mobileweb",
                    is_retargeting: "false"
                };

            function nA(e) {
                if (!ny()) return {};
                var t = e.joinAttemptOrigin,
                    n = e.joinAttemptId;
                return {
                    joinAttemptId: n = "string" == typeof n ? n : e5(),
                    joinAttemptOrigin: t
                }
            }

            function nC(e, t, n, r) {
                n.getPlayOnWeb;
                var a = eX(n, ["getPlayOnWeb"]),
                    i = eE({
                        placeId: t
                    }, e, nA(e), a, null == r ? {} : {
                        actionType: r
                    });
                return (0, e0.sendEventWithTarget)("playGameClicked", "click", i), i
            }

            function nT(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    n = arguments.length > 2 && void 0 !== arguments[2] && arguments[2],
                    r = "".concat(ex().websiteUrl, "/games/start?placeid=").concat(e);
                if (ny()) {
                    var a = nA(t),
                        i = a.joinAttemptId,
                        o = a.joinAttemptOrigin;
                    "string" == typeof i && i.length > 0 && (r += "&joinAttemptId=".concat(i), "string" == typeof o && o.length > 0 && (r += "&joinAttemptOrigin=".concat(o)))
                }
                var l = t.launchData,
                    u = t.eventId;
                return "string" == typeof l && l.length > 0 && (r += "&launchData=".concat(l)), "string" == typeof u && u.length > 0 && (r += "&eventId=".concat(u)), n && (r += "&isEarlyTesting=true"), encodeURIComponent(r)
            }
            var nk = function(e, t, n, r) {
                    var a = arguments.length > 4 && void 0 !== arguments[4] ? arguments[4] : {},
                        i = arguments.length > 5 && void 0 !== arguments[5] ? arguments[5] : {},
                        o = arguments.length > 6 && void 0 !== arguments[6] ? arguments[6] : {},
                        l = arguments.length > 7 ? arguments[7] : void 0,
                        u = arguments.length > 8 && void 0 !== arguments[8] && arguments[8],
                        s = (0, e4.getDeviceMeta)();
                    if ((null == s ? void 0 : s.isIosDevice) || (null == s ? void 0 : s.isAndroidDevice) || (0, e4.isIos13Ipad)() || (null == s ? void 0 : s.isChromeOs)) {
                        var c = nC(a, e, i, l),
                            d = nT(e, c, u),
                            f = (0, e1.composeQueryString)(eE({}, nI, o));
                        window.open("https://ro.blox.com/Ebh5?".concat(f, "&af_dp=").concat(d, "&af_web_dp=").concat(d, "&deep_link_value=").concat(d), "_self")
                    } else {
                        var h = "0";
                        null !== window.localStorage.getItem("ref_info") && (h = function() {
                            var e = window.localStorage.getItem("ref_info");
                            if (!e) return {};
                            try {
                                return JSON.parse(atob(e))
                            } catch (e) {
                                return {}
                            }
                        }()[e]), nb((0, eQ.buildPlayGameProperties)(t, e, r, void 0, n, h, i, u), ez(e, a), l), window.localStorage.getItem("ref_info") && window.localStorage.removeItem("ref_info")
                    }
                },
                nO = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                        n = (0, e4.getDeviceMeta)();
                    if ((null == n ? void 0 : n.isIosDevice) || (null == n ? void 0 : n.isAndroidDevice) || (0, e4.isIos13Ipad)() || (null == n ? void 0 : n.isChromeOs)) {
                        var r = nC({}, e, {}),
                            a = nT(e, r),
                            i = (0, e1.composeQueryString)(eE({}, nI, t));
                        window.open("https://ro.blox.com/Ebh5?".concat(i, "&af_dp=").concat(a, "&af_web_dp=").concat(a, "&deep_link_value=").concat(a), "_self")
                    } else nb((0, eQ.buildPlayGameProperties)(void 0, e), ez(e, {}))
                },
                n_ = function() {
                    var e;
                    return null == (e = window.Roblox) ? void 0 : e.IdentityVerificationService
                },
                nN = function(e) {
                    var t = e.context,
                        n = e.pageContext;
                    return em(function() {
                        var e, r, a, i;
                        return ev(this, function(o) {
                            switch (o.label) {
                                case 0:
                                    return o.trys.push([0, 2, , 3]), a = {
                                        featureName: "TriggerAgeCheckUpsellIncludingVPC",
                                        isAsyncCall: !1,
                                        usePrologue: !1,
                                        namespace: "core_content/CoreContent",
                                        featureSpecificData: {
                                            context: "".concat(t, "-").concat(n)
                                        }
                                    }, [4, null == (r = nP()) ? void 0 : r(a)];
                                case 1:
                                    return [2, null != (e = o.sent()) && e];
                                case 2:
                                    throw i = o.sent(), eT(eV.PlayButtonUpsellAgeRestrictionVerificationError), i;
                                case 3:
                                    return [2]
                            }
                        })
                    })()
                },
                nL = function(e, t) {
                    try {
                        var n = eI.UrlSearchParams.parse(window.location.search).get("shareLinkSourceType");
                        if ((null == n ? void 0 : n.toLowerCase()) !== "experiencedetails") return;
                        (0, e0.sendEventWithTarget)("shareLinkGameJoin", "GamePlayButtonWeb", {
                            placeId: e,
                            universeId: t
                        }, e0.targetTypes.WWW)
                    } catch (e) {}
                },
                nB = function(e, t) {
                    return void 0 !== e && e !== ej.Playable && e !== ej.GuestProhibited && e !== ej.PurchaseRequired && e !== ej.ContextualPlayabilityUnverifiedSeventeenPlusUser && e !== ej.FiatPurchaseRequired && e !== ej.ContextualPlayabilityAgeCheckRequired && (e !== ej.ContextualPlayabilityAgeRecommendationParentalControls && e !== ej.ContextualPlayabilityRequireParentApproval || !t) && !0
                },
                nR = function(e, t, n, r) {
                    (0, e0.sendEvent)({
                        name: eW.eventName,
                        type: eW.eventName,
                        context: e0.eventTypes.formInteraction
                    }, {
                        universeId: e,
                        upsellName: t,
                        playabilityStatus: n,
                        pg: r
                    })
                },
                nU = function(e) {
                    return e === ej.ContextualPlayabilityUnverifiedSeventeenPlusUser || e === ej.ContextualPlayabilityAgeCheckRequired ? nx : e === ej.ContextualPlayabilityRequireParentApproval || e === ej.ContextualPlayabilityPlaytestDisabled ? nS : e === ej.ContextualPlayabilityTrustedFriendRequired ? "AddTrustedFriend" : void 0
                },
                nD = function() {
                    window.location.assign((0, e$.getAbsoluteUrl)("/my/account#!/privacy/ContentRestrictions/PrivatePlaytest"))
                },
                nM = function(e) {
                    window.location.assign((0, e$.getAbsoluteUrl)("/users/".concat(e, "/profile")))
                },
                nj = function(e) {
                    var t, n;
                    return {
                        launchData: null != (t = new URLSearchParams(window.location.search).get("launchData")) ? t : e,
                        eventId: null != (n = new URLSearchParams(window.location.search).get("eventId")) ? n : void 0
                    }
                },
                nF = function(e, t) {
                    var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                        r = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : {};
                    nL(e, t);
                    var a = nC(n, e, r, "PlayOnWebButtonClick"),
                        i = a.joinAttemptId,
                        o = a.joinAttemptOrigin;
                    return ny() && "string" == typeof i && "" !== i ? {
                        joinAttemptId: i,
                        joinAttemptOrigin: "string" == typeof o && o.length > 0 ? o : void 0
                    } : {}
                },
                nH = window.ReactJSX,
                nG = n(611),
                nz = n.n(nG),
                nV = function(e) {
                    return e
                },
                nW = function(e) {
                    if (!e.trim()) return null;
                    try {
                        return BigInt(e)
                    } catch (e) {
                        return null
                    }
                },
                nq = function(e) {
                    return e > 0 && e <= Number.MAX_SAFE_INTEGER ? nV(e.toString()) : null
                },
                nK = function(e) {
                    var t = nW(e);
                    return null == t ? null : nq(t)
                },
                nZ = "blackbird",
                nY = function(e) {
                    var t, n, r, a, i = null != (t = e.userid) ? t : e.user,
                        o = null == i ? void 0 : null != (n = nK(i)) ? n : void 0;
                    if ("string" == typeof o) return {
                        isAuthenticated: !0,
                        id: o,
                        userName: null != (r = e.name) ? r : e.userName,
                        displayName: null != (a = e.displayname) ? a : e.userDisplayName,
                        isPremiumUser: "true" === e.ispremiumuser || "true" === e.userIsPremium,
                        membership: e.membership === nZ || e.userMembership === nZ ? nZ : void 0,
                        isVerified: "true" === e.hasverifiedbadge || "true" === e.userHasVerifiedBadge,
                        isUnder13: "true" === e.isunder13 || "AgeUnder13" === e.userAgeBracket
                    }
                },
                nJ = function() {
                    if ("u" > typeof document) {
                        var e, t;
                        return nY(null != (e = null == (t = document.querySelector('meta[name="user-data"]')) ? void 0 : t.dataset) ? e : document.documentElement.dataset)
                    }
                };

            function nX(e) {
                return e7(e) || tP(e) || tt(e) || e9()
            }
            var n$ = function() {
                    for (var e, t, n = 0, r = "", a = arguments.length; n < a; n++)(e = arguments[n]) && (t = function e(t) {
                        var n, r, a = "";
                        if ("string" == typeof t || "number" == typeof t) a += t;
                        else if ("object" == (void 0 === t ? "undefined" : (0, tc._)(t)))
                            if (Array.isArray(t)) {
                                var i = t.length;
                                for (n = 0; n < i; n++) t[n] && (r = e(t[n])) && (a && (a += " "), a += r)
                            } else
                                for (r in t) t[r] && (a && (a += " "), a += r);
                        return a
                    }(e)) && (r && (r += " "), r += t);
                    return r
                },
                nQ = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                n0 = function(e) {
                    var t = e.className;
                    return eg().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: n$("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", t)
                    })
                },
                n1 = function(e) {
                    var t = e.width,
                        n = e.height;
                    return eg().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: t,
                        height: n,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, eg().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                },
                n2 = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                n3 = eg().forwardRef(function(e, t) {
                    var n = nX([e, t]),
                        r = n[0],
                        a = n.slice(1),
                        i = r.name,
                        o = r.size,
                        l = r.className,
                        u = (r.children, eX(r, ["name", "size", "className", "children"])),
                        s = tn(a, 1)[0];
                    return eg().createElement("span", eE({
                        ref: s,
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-icon",
                        className: n$("grow-0 shrink-0 basis-auto icon", i, n2[void 0 === o ? "Medium" : o], l)
                    }, u))
                });

            function n5(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function n4() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return function(e) {
                    var n = !1,
                        r = t.map(function(t) {
                            var r = n5(t, e);
                            return n || "function" != typeof r || (n = !0), r
                        });
                    if (n) return function() {
                        for (var e = 0; e < r.length; e++) {
                            var n = r[e];
                            "function" == typeof n ? n() : n5(t[e], null)
                        }
                    }
                }
            }

            function n6() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return ey.useCallback(n4.apply(void 0, tx(t)), t)
            }
            n3.displayName = "Icon";
            var n8 = Symbol.for("react.lazy"),
                n7 = ey[" use ".trim().toString()];

            function n9(e) {
                var t;
                return null != e && (void 0 === e ? "undefined" : (0, tc._)(e)) === "object" && "$$typeof" in e && e.$$typeof === n8 && "_payload" in e && (void 0 === (t = e._payload) ? "undefined" : (0, tc._)(t)) === "object" && null !== t && "then" in t
            }
            var re = ((i = ey.forwardRef(function(e, t) {
                    var n = e.children,
                        r = eX(e, ["children"]);
                    if (n9(n) && "function" == typeof n7 && (n = n7(n._payload)), ey.isValidElement(n)) {
                        var a, i, o, l, u, s = (u = (l = null == (i = Object.getOwnPropertyDescriptor((a = n).props, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? a.ref : (u = (l = null == (o = Object.getOwnPropertyDescriptor(a, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning) ? a.props.ref : a.props.ref || a.ref,
                            c = function(e, t) {
                                var n = eE({}, t);
                                for (var r in t) ! function(r) {
                                    var a = e[r],
                                        i = t[r];
                                    /^on[A-Z]/.test(r) ? a && i ? n[r] = function() {
                                        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                        var r = i.apply(void 0, tx(t));
                                        return a.apply(void 0, tx(t)), r
                                    } : a && (n[r] = a) : "style" === r ? n[r] = eE({}, a, i) : "className" === r && (n[r] = [a, i].filter(Boolean).join(" "))
                                }(r);
                                return eE({}, e, n)
                            }(r, n.props);
                        return n.type !== ey.Fragment && (c.ref = t ? n4(t, s) : s), ey.cloneElement(n, c)
                    }
                    return ey.Children.count(n) > 1 ? ey.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), m = i, (v = ey.forwardRef(function(e, t) {
                    var n = e.children,
                        r = eX(e, ["children"]);
                    n9(n) && "function" == typeof n7 && (n = n7(n._payload));
                    var a = ey.Children.toArray(n),
                        i = a.find(rn);
                    if (i) {
                        var o = i.props.children,
                            l = a.map(function(e) {
                                return e !== i ? e : ey.Children.count(o) > 1 ? ey.Children.only(null) : ey.isValidElement(o) ? o.props.children : null
                            });
                        return (0, nH.jsx)(m, eM(eE({}, r), {
                            ref: t,
                            children: ey.isValidElement(o) ? ey.cloneElement(o, void 0, l) : null
                        }))
                    }
                    return (0, nH.jsx)(m, eM(eE({}, r), {
                        ref: t,
                        children: n
                    }))
                })).displayName = "".concat("Slot", ".Slot"), v),
                rt = Symbol("radix.slottable");

            function rn(e) {
                return ey.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === rt
            }
            var rr = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                ra = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                ri = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                ro = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                rl = (0, ey.forwardRef)(function(e, t) {
                    var n = nX([e, t]),
                        r = n[0],
                        a = n.slice(1),
                        i = r.children,
                        o = r.className,
                        l = r.style,
                        u = r.isDisabled,
                        s = void 0 !== u && u,
                        c = r.isLoading,
                        d = void 0 !== c && c,
                        f = r.icon,
                        h = r.size,
                        p = void 0 === h ? "Large" : h,
                        m = r.variant,
                        v = void 0 === m ? "Emphasis" : m,
                        y = r.asChild,
                        g = eX(r, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        b = tn(a, 1)[0],
                        w = n$("foundation-web-button", s ? "opacity-[0.5]" : [nQ, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", ra[p], s ? ro[v] : ri[v], o),
                        E = eE({
                            textDecoration: "none"
                        }, l),
                        P = function(e) {
                            return eg().createElement(eg().Fragment, null, eg().createElement(n0, null), d && eg().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, eg().createElement(n1, {
                                width: rr[p],
                                height: rr[p]
                            })), eg().createElement("span", {
                                className: n$("flex items-center min-width-0", "Large" === p || "Medium" === p ? "gap-small" : "gap-xsmall", d && "invisible")
                            }, f && eg().createElement(n3, {
                                name: f,
                                size: p
                            }), eg().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, e)))
                        };
                    if (y) {
                        g.as;
                        var x = eX(g, ["as"]),
                            S = eg().Children.only(i);
                        return eg().createElement(re, eM(eE({
                            ref: b
                        }, x), {
                            className: w,
                            style: E,
                            "aria-disabled": s || void 0
                        }), eg().cloneElement(S, {}, P(S.props.children)))
                    }
                    if ("a" === g.as) {
                        g.as;
                        var I = g.href,
                            A = eX(g, ["as", "href"]);
                        return eg().createElement("a", eM(eE({
                            ref: b
                        }, A), {
                            "aria-disabled": s,
                            href: s ? void 0 : I,
                            className: w,
                            style: E
                        }), P(i))
                    }
                    g.as;
                    var C = eX(g, ["as"]);
                    return eg().createElement("button", eM(eE({
                        ref: b,
                        type: "button"
                    }, C), {
                        disabled: s,
                        className: w,
                        style: E
                    }), P(i))
                }),
                ru = window.Roblox.NavigationService,
                rs = window.Roblox.ExperimentationService,
                rc = n.n(rs),
                rd = "full",
                rf = function(e) {
                    return e === rd && "btn-full-width"
                },
                rh = {
                    display: "flex"
                },
                rp = "OneButton",
                rm = "TwoButton";

            function rv(e, t) {
                var n = t && t.cache ? t.cache : rE,
                    r = t && t.serializer ? t.serializer : rb;
                return (t && t.strategy ? t.strategy : function(e, t) {
                    var n, r, a = 1 === e.length ? ry : rg;
                    return n = t.cache.create(), r = t.serializer, a.bind(this, e, n, r)
                })(e, {
                    cache: n,
                    serializer: r
                })
            }

            function ry(e, t, n, r) {
                var a = null == r || "number" == typeof r || "boolean" == typeof r ? r : n(r),
                    i = t.get(a);
                return void 0 === i && (i = e.call(this, r), t.set(a, i)), i
            }

            function rg(e, t, n) {
                var r = Array.prototype.slice.call(arguments, 3),
                    a = n(r),
                    i = t.get(a);
                return void 0 === i && (i = e.apply(this, r), t.set(a, i)), i
            }
            var rb = function() {
                    return JSON.stringify(arguments)
                },
                rw = function() {
                    function e() {
                        th(this, e), this.cache = Object.create(null)
                    }
                    return nt(e, [{
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
                rE = {
                    create: function() {
                        return new rw
                    }
                },
                rP = {
                    variadic: function(e, t) {
                        var n, r;
                        return n = t.cache.create(), r = t.serializer, rg.bind(this, e, n, r)
                    },
                    monadic: function(e, t) {
                        var n, r;
                        return n = t.cache.create(), r = t.serializer, ry.bind(this, e, n, r)
                    }
                },
                rx = function(e) {
                    function t(e, n) {
                        th(this, t);
                        var r, a = e;
                        return n && (a += ": " + n), (r = td(this, t, [a])).code = e, n && (r.originalMessage = n), r
                    }
                    return tm(t, e), t
                }(ty(Error)),
                rS = ((y = rS || {}).MISSING_MESSAGE = "MISSING_MESSAGE", y.MISSING_FORMAT = "MISSING_FORMAT", y.ENVIRONMENT_FALLBACK = "ENVIRONMENT_FALLBACK", y.INSUFFICIENT_PATH = "INSUFFICIENT_PATH", y.INVALID_MESSAGE = "INVALID_MESSAGE", y.INVALID_KEY = "INVALID_KEY", y.FORMATTING_ERROR = "FORMATTING_ERROR", y);

            function rI(e, t) {
                return rv(e, {
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
                    strategy: rP.variadic
                })
            }

            function rA(e, t) {
                return rI(function() {
                    for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                    return tv(e, tx(n))
                }, t)
            }

            function rC() {
                return (rC = Object.assign || function(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var n = arguments[t];
                        for (var r in n) Object.prototype.hasOwnProperty.call(n, r) && (e[r] = n[r])
                    }
                    return e
                }).apply(this, arguments)
            }
            var rT = /(?:[Eec]{1,6}|G{1,5}|[Qq]{1,5}|(?:[yYur]+|U{1,5})|[ML]{1,5}|d{1,2}|D{1,3}|F{1}|[abB]{1,5}|[hkHK]{1,2}|w{1,2}|W{1}|m{1,2}|s{1,2}|[zZOvVxX]{1,4})(?=([^']*'[^']*')*[^']*$)/g,
                rk = /[\t-\r \x85\u200E\u200F\u2028\u2029]/i,
                rO = /^\.(?:(0+)(\*)?|(#+)|(0+)(#+))$/g,
                r_ = /^(@+)?(\+|#+)?[rs]?$/g,
                rN = /(\*)(0+)|(#+)(0+)|(0+)/g,
                rL = /^(0+)$/;

            function rB(e) {
                var t = {};
                return "r" === e[e.length - 1] ? t.roundingPriority = "morePrecision" : "s" === e[e.length - 1] && (t.roundingPriority = "lessPrecision"), e.replace(r_, function(e, n, r) {
                    return "string" != typeof r ? (t.minimumSignificantDigits = n.length, t.maximumSignificantDigits = n.length) : "+" === r ? t.minimumSignificantDigits = n.length : "#" === n[0] ? t.maximumSignificantDigits = n.length : (t.minimumSignificantDigits = n.length, t.maximumSignificantDigits = n.length + ("string" == typeof r ? r.length : 0)), ""
                }), t
            }

            function rR(e) {
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

            function rU(e) {
                var t = rR(e);
                return t || {}
            }
            var rD = ((g = {})[g.EXPECT_ARGUMENT_CLOSING_BRACE = 1] = "EXPECT_ARGUMENT_CLOSING_BRACE", g[g.EMPTY_ARGUMENT = 2] = "EMPTY_ARGUMENT", g[g.MALFORMED_ARGUMENT = 3] = "MALFORMED_ARGUMENT", g[g.EXPECT_ARGUMENT_TYPE = 4] = "EXPECT_ARGUMENT_TYPE", g[g.INVALID_ARGUMENT_TYPE = 5] = "INVALID_ARGUMENT_TYPE", g[g.EXPECT_ARGUMENT_STYLE = 6] = "EXPECT_ARGUMENT_STYLE", g[g.INVALID_NUMBER_SKELETON = 7] = "INVALID_NUMBER_SKELETON", g[g.INVALID_DATE_TIME_SKELETON = 8] = "INVALID_DATE_TIME_SKELETON", g[g.EXPECT_NUMBER_SKELETON = 9] = "EXPECT_NUMBER_SKELETON", g[g.EXPECT_DATE_TIME_SKELETON = 10] = "EXPECT_DATE_TIME_SKELETON", g[g.UNCLOSED_QUOTE_IN_ARGUMENT_STYLE = 11] = "UNCLOSED_QUOTE_IN_ARGUMENT_STYLE", g[g.EXPECT_SELECT_ARGUMENT_OPTIONS = 12] = "EXPECT_SELECT_ARGUMENT_OPTIONS", g[g.EXPECT_PLURAL_ARGUMENT_OFFSET_VALUE = 13] = "EXPECT_PLURAL_ARGUMENT_OFFSET_VALUE", g[g.INVALID_PLURAL_ARGUMENT_OFFSET_VALUE = 14] = "INVALID_PLURAL_ARGUMENT_OFFSET_VALUE", g[g.EXPECT_SELECT_ARGUMENT_SELECTOR = 15] = "EXPECT_SELECT_ARGUMENT_SELECTOR", g[g.EXPECT_PLURAL_ARGUMENT_SELECTOR = 16] = "EXPECT_PLURAL_ARGUMENT_SELECTOR", g[g.EXPECT_SELECT_ARGUMENT_SELECTOR_FRAGMENT = 17] = "EXPECT_SELECT_ARGUMENT_SELECTOR_FRAGMENT", g[g.EXPECT_PLURAL_ARGUMENT_SELECTOR_FRAGMENT = 18] = "EXPECT_PLURAL_ARGUMENT_SELECTOR_FRAGMENT", g[g.INVALID_PLURAL_ARGUMENT_SELECTOR = 19] = "INVALID_PLURAL_ARGUMENT_SELECTOR", g[g.DUPLICATE_PLURAL_ARGUMENT_SELECTOR = 20] = "DUPLICATE_PLURAL_ARGUMENT_SELECTOR", g[g.DUPLICATE_SELECT_ARGUMENT_SELECTOR = 21] = "DUPLICATE_SELECT_ARGUMENT_SELECTOR", g[g.MISSING_OTHER_CLAUSE = 22] = "MISSING_OTHER_CLAUSE", g[g.INVALID_TAG = 23] = "INVALID_TAG", g[g.INVALID_TAG_NAME = 25] = "INVALID_TAG_NAME", g[g.UNMATCHED_CLOSING_TAG = 26] = "UNMATCHED_CLOSING_TAG", g[g.UNCLOSED_TAG = 27] = "UNCLOSED_TAG", g);

            function rM(e) {
                return !!(e && (void 0 === e ? "undefined" : (0, tc._)(e)) === "object" && 0 === e.type)
            }

            function rj(e) {
                return !!(e && (void 0 === e ? "undefined" : (0, tc._)(e)) === "object" && 1 === e.type)
            }
            var rF = /[ \xA0\u1680\u2000-\u200A\u202F\u205F\u3000]/,
                rH = {
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
                rG = new RegExp("^".concat(rF.source, "*")),
                rz = new RegExp("".concat(rF.source, "*$"));

            function rV(e, t) {
                return {
                    start: e,
                    end: t
                }
            }
            var rW = !!Object.fromEntries,
                rq = !!String.prototype.trimStart,
                rK = !!String.prototype.trimEnd,
                rZ = rW ? Object.fromEntries : function(e) {
                    var t = {},
                        n = !0,
                        r = !1,
                        a = void 0;
                    try {
                        for (var i, o = e[Symbol.iterator](); !(n = (i = o.next()).done); n = !0) {
                            var l = tn(i.value, 2),
                                u = l[0],
                                s = l[1];
                            t[u] = s
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
                },
                rY = rq ? function(e) {
                    return e.trimStart()
                } : function(e) {
                    return e.replace(rG, "")
                },
                rJ = rK ? function(e) {
                    return e.trimEnd()
                } : function(e) {
                    return e.replace(rz, "")
                },
                rX = RegExp("([^\\u0009-\\u000D\\u0020\\u0085\\u00A0\\u1680\\u2000-\\u200A\\u2028-\\u2029\\u202F\\u205F\\u3000\\u0021-\\u002F\\u003A-\\u0040\\u005B-\\u005E\\u0060\\u007B-\\u007E\\u00A1-\\u00A7\\u00A9\\u00AB-\\u00AC\\u00AE\\u00B0-\\u00B1\\u00B6\\u00BB\\u00BF\\u00D7\\u00F7\\u2010-\\u2027\\u2030-\\u203E\\u2041-\\u2053\\u2055-\\u205E\\u2190-\\u245F\\u2500-\\u2775\\u2794-\\u2BFF\\u2E00-\\u2E7F\\u3001-\\u3003\\u3008-\\u3020\\u3030\\uFD3E-\\uFD3F\\uFE45-\\uFE46]*)", "yu"),
                r$ = function() {
                    function e(t) {
                        var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                        th(this, e), this.message = t, this.position = {
                            offset: 0,
                            line: 1,
                            column: 1
                        }, this.ignoreTag = !!n.ignoreTag, this.locale = n.locale, this.requiresOtherClause = !!n.requiresOtherClause, this.shouldParseSkeletons = !!n.shouldParseSkeletons
                    }
                    return nt(e, [{
                        key: "parse",
                        value: function() {
                            if (0 !== this.offset()) throw Error("parser can only be used once");
                            if (this.message.length > 0) {
                                var e = this.message.charCodeAt(0);
                                if (35 !== e && 39 !== e && 60 !== e && 123 !== e && 125 !== e) {
                                    var t = function(e) {
                                        if (0 === e.length) return null;
                                        for (var t = 1, n = 1, r = 0; r < e.length;) {
                                            var a = e.charCodeAt(r);
                                            switch (a) {
                                                case 35:
                                                case 39:
                                                case 60:
                                                case 123:
                                                case 125:
                                                    return null
                                            }
                                            if (10 === a) t++, n = 1, r++;
                                            else if (n++, a >= 55296 && a <= 56319 && r + 1 < e.length) {
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
                                                location: rV(n, this.clonePosition())
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
                                var a = this.char();
                                if (123 === a) {
                                    var i = this.parseArgument(e, n);
                                    if (i.err) return i;
                                    r.push(i.val)
                                } else if (125 === a && e > 0) break;
                                else if (35 === a && ("plural" === t || "selectordinal" === t)) {
                                    var o = this.clonePosition();
                                    this.bump(), r.push({
                                        type: 7,
                                        location: rV(o, this.clonePosition())
                                    })
                                } else if (60 !== a || this.ignoreTag || 47 !== this.peek())
                                    if (60 === a && !this.ignoreTag && rQ(this.peek() || 0)) {
                                        var l = this.parseTag(e, t);
                                        if (l.err) return l;
                                        r.push(l.val)
                                    } else {
                                        var u = this.parseLiteral(e, t);
                                        if (u.err) return u;
                                        r.push(u.val)
                                    }
                                else if (!n) return this.error(26, rV(this.clonePosition(), this.clonePosition()));
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
                                    location: rV(n, this.clonePosition())
                                },
                                err: null
                            };
                            if (!this.bumpIf(">")) return this.error(23, rV(n, this.clonePosition()));
                            var a = this.parseMessage(e + 1, t, !0);
                            if (a.err) return a;
                            var i = a.val,
                                o = this.clonePosition();
                            if (!this.bumpIf("</")) return this.error(27, rV(n, this.clonePosition()));
                            if (this.isEOF() || !rQ(this.char())) return this.error(23, rV(o, this.clonePosition()));
                            var l = this.clonePosition();
                            return r !== this.parseTagName() ? this.error(26, rV(l, this.clonePosition())) : (this.bumpSpace(), this.bumpIf(">")) ? {
                                val: {
                                    type: 8,
                                    value: r,
                                    children: i,
                                    location: rV(n, this.clonePosition())
                                },
                                err: null
                            } : this.error(23, rV(o, this.clonePosition()))
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
                                var a = this.tryParseQuote(t);
                                if (a) {
                                    r += a;
                                    continue
                                }
                                var i = this.tryParseUnquoted(e, t);
                                if (i) {
                                    r += i;
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
                                    location: rV(n, this.clonePosition())
                                },
                                err: null
                            }
                        }
                    }, {
                        key: "tryParseLeftAngleBracket",
                        value: function() {
                            var e;
                            return this.isEOF() || 60 !== this.char() || !this.ignoreTag && (rQ(e = this.peek() || 0) || 47 === e) ? null : (this.bump(), "<")
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
                            return (t = String).fromCodePoint.apply(t, tx(n))
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
                            if (this.bump(), this.bumpSpace(), this.isEOF()) return this.error(1, rV(n, this.clonePosition()));
                            if (125 === this.char()) return this.bump(), this.error(2, rV(n, this.clonePosition()));
                            var r = this.parseIdentifierIfPossible().value;
                            if (!r) return this.error(3, rV(n, this.clonePosition()));
                            if (this.bumpSpace(), this.isEOF()) return this.error(1, rV(n, this.clonePosition()));
                            switch (this.char()) {
                                case 125:
                                    return this.bump(), {
                                        val: {
                                            type: 1,
                                            value: r,
                                            location: rV(n, this.clonePosition())
                                        },
                                        err: null
                                    };
                                case 44:
                                    if (this.bump(), this.bumpSpace(), this.isEOF()) return this.error(1, rV(n, this.clonePosition()));
                                    return this.parseArgumentOptions(e, t, r, n);
                                default:
                                    return this.error(3, rV(n, this.clonePosition()))
                            }
                        }
                    }, {
                        key: "parseIdentifierIfPossible",
                        value: function() {
                            var e, t, n = this.clonePosition(),
                                r = this.offset(),
                                a = (e = this.message, rX.lastIndex = r, null != (t = rX.exec(e)[1]) ? t : ""),
                                i = r + a.length;
                            return this.bumpTo(i), {
                                value: a,
                                location: rV(n, this.clonePosition())
                            }
                        }
                    }, {
                        key: "parseArgumentOptions",
                        value: function(e, t, n, r) {
                            var a = this.clonePosition(),
                                i = this.parseIdentifierIfPossible().value,
                                o = this.clonePosition();
                            switch (i) {
                                case "":
                                    return this.error(4, rV(a, o));
                                case "number":
                                case "date":
                                case "time":
                                    this.bumpSpace();
                                    var l, u = null;
                                    if (this.bumpIf(",")) {
                                        this.bumpSpace();
                                        var s = this.clonePosition(),
                                            c = this.parseSimpleArgStyleIfPossible();
                                        if (c.err) return c;
                                        var d = rJ(c.val);
                                        if (0 === d.length) return this.error(6, rV(this.clonePosition(), this.clonePosition()));
                                        u = {
                                            style: d,
                                            styleLocation: rV(s, this.clonePosition())
                                        }
                                    }
                                    var f = this.tryParseArgumentClose(r);
                                    if (f.err) return f;
                                    var h = rV(r, this.clonePosition());
                                    if (u && u.style.startsWith("::")) {
                                        var p = rY(u.style.slice(2));
                                        if ("number" === i) {
                                            var m = this.parseNumberSkeletonFromString(p, u.styleLocation);
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
                                                var a = e.charAt(r);
                                                if ("j" === a) {
                                                    for (var i = 0; r + 1 < e.length && e.charAt(r + 1) === a;) i++, r++;
                                                    var o = 1 + (1 & i),
                                                        l = i < 2 ? 1 : 3 + (i >> 1),
                                                        u = function(e) {
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
                                                            return "root" !== r && (t = e.maximize().region), (rH[t || ""] || rH[r || ""] || rH["".concat(r, "-001")] || rH["001"])[0]
                                                        }(t);
                                                    for (("H" == u || "k" == u) && (l = 0); l-- > 0;) n += "a";
                                                    for (; o-- > 0;) n = u + n
                                                } else "J" === a ? n += "H" : n += a
                                            }
                                            return n
                                        }(p, this.locale)), {
                                            val: {
                                                type: "date" === i ? 3 : 4,
                                                value: n,
                                                location: h,
                                                style: {
                                                    type: 1,
                                                    pattern: y,
                                                    location: u.styleLocation,
                                                    parsedOptions: this.shouldParseSkeletons ? (v = {}, y.replace(rT, function(e) {
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
                                            type: "number" === i ? 2 : "date" === i ? 3 : 4,
                                            value: n,
                                            location: h,
                                            style: null != (l = null == u ? void 0 : u.style) ? l : null
                                        }, err: null
                                    };
                                case "plural":
                                case "selectordinal":
                                case "select":
                                    var g = this.clonePosition();
                                    if (this.bumpSpace(), !this.bumpIf(",")) return this.error(12, rV(g, eE({}, g)));
                                    this.bumpSpace();
                                    var b = this.parseIdentifierIfPossible(),
                                        w = 0;
                                    if ("select" !== i && "offset" === b.value) {
                                        if (!this.bumpIf(":")) return this.error(13, rV(this.clonePosition(), this.clonePosition()));
                                        this.bumpSpace();
                                        var E = this.tryParseDecimalInteger(13, 14);
                                        if (E.err) return E;
                                        this.bumpSpace(), b = this.parseIdentifierIfPossible(), w = E.val
                                    }
                                    var P = this.tryParsePluralOrSelectOptions(e, i, t, b);
                                    if (P.err) return P;
                                    var x = this.tryParseArgumentClose(r);
                                    if (x.err) return x;
                                    var S = rV(r, this.clonePosition());
                                    if ("select" === i) return {
                                        val: {
                                            type: 5,
                                            value: n,
                                            options: rZ(P.val),
                                            location: S
                                        },
                                        err: null
                                    };
                                    return {
                                        val: {
                                            type: 6,
                                            value: n,
                                            options: rZ(P.val),
                                            offset: w,
                                            pluralType: "plural" === i ? "cardinal" : "ordinal",
                                            location: S
                                        }, err: null
                                    };
                                default:
                                    return this.error(5, rV(a, o))
                            }
                        }
                    }, {
                        key: "tryParseArgumentClose",
                        value: function(e) {
                            return this.isEOF() || 125 !== this.char() ? this.error(1, rV(e, this.clonePosition())) : (this.bump(), {
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
                                    if (!this.bumpUntil("'")) return this.error(11, rV(n, this.clonePosition()));
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
                                    var t = e.split(rk).filter(function(e) {
                                            return e.length > 0
                                        }),
                                        n = [],
                                        r = !0,
                                        a = !1,
                                        i = void 0;
                                    try {
                                        for (var o, l = t[Symbol.iterator](); !(r = (o = l.next()).done); r = !0) {
                                            var u = o.value.split("/");
                                            if (0 === u.length) throw Error("Invalid number skeleton");
                                            var s = nX(u),
                                                c = s[0],
                                                d = s.slice(1),
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
                                        a = !0, i = e
                                    } finally {
                                        try {
                                            r || null == l.return || l.return()
                                        } finally {
                                            if (a) throw i
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
                                            a = void 0;
                                        try {
                                            for (var i, o = e[Symbol.iterator](); !(n = (i = o.next()).done); n = !0) {
                                                var l = i.value;
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
                                                        t = eE(eM(eE({}, t), {
                                                            notation: "scientific"
                                                        }), l.options.reduce(function(e, t) {
                                                            return eE({}, e, rU(t))
                                                        }, {}));
                                                        continue;
                                                    case "engineering":
                                                        t = eE(eM(eE({}, t), {
                                                            notation: "engineering"
                                                        }), l.options.reduce(function(e, t) {
                                                            return eE({}, e, rU(t))
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
                                                        l.options[0].replace(rN, function(e, n, r, a, i, o) {
                                                            if (n) t.minimumIntegerDigits = r.length;
                                                            else if (a && i) throw Error("We currently do not support maximum integer digits");
                                                            else if (o) throw Error("We currently do not support exact integer digits");
                                                            return ""
                                                        });
                                                        continue
                                                }
                                                if (rL.test(l.stem)) {
                                                    t.minimumIntegerDigits = l.stem.length;
                                                    continue
                                                }
                                                if (rO.test(l.stem)) {
                                                    if (l.options.length > 1) throw RangeError("Fraction-precision stems only accept a single optional option");
                                                    l.stem.replace(rO, function(e, n, r, a, i, o) {
                                                        return "*" === r ? t.minimumFractionDigits = n.length : a && "#" === a[0] ? t.maximumFractionDigits = a.length : i && o ? (t.minimumFractionDigits = i.length, t.maximumFractionDigits = i.length + o.length) : (t.minimumFractionDigits = n.length, t.maximumFractionDigits = n.length), ""
                                                    });
                                                    var u = l.options[0];
                                                    "w" === u ? t = eM(eE({}, t), {
                                                        trailingZeroDisplay: "stripIfInteger"
                                                    }) : u && (t = eE({}, t, rB(u)));
                                                    continue
                                                }
                                                if (r_.test(l.stem)) {
                                                    t = eE({}, t, rB(l.stem));
                                                    continue
                                                }
                                                var s = rR(l.stem);
                                                s && (t = eE({}, t, s));
                                                var c = function(e) {
                                                    var t;
                                                    if ("E" === e[0] && "E" === e[1] ? (t = {
                                                            notation: "engineering"
                                                        }, e = e.slice(2)) : "E" === e[0] && (t = {
                                                            notation: "scientific"
                                                        }, e = e.slice(1)), t) {
                                                        var n = e.slice(0, 2);
                                                        if ("+!" === n ? (t.signDisplay = "always", e = e.slice(2)) : "+?" === n && (t.signDisplay = "exceptZero", e = e.slice(2)), !rL.test(e)) throw Error("Malformed concise eng/scientific notation");
                                                        t.minimumIntegerDigits = e.length
                                                    }
                                                    return t
                                                }(l.stem);
                                                c && (t = eE({}, t, c))
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
                                    }(n) : {}
                                },
                                err: null
                            }
                        }
                    }, {
                        key: "tryParsePluralOrSelectOptions",
                        value: function(e, t, n, r) {
                            for (var a = !1, i = [], o = new Set, l = r.value, u = r.location;;) {
                                if (0 === l.length) {
                                    var s, c = this.clonePosition();
                                    if ("select" !== t && this.bumpIf("=")) {
                                        var d = this.tryParseDecimalInteger(16, 19);
                                        if (d.err) return d;
                                        u = rV(c, this.clonePosition()), l = this.message.slice(c.offset, this.offset())
                                    } else break
                                }
                                if (o.has(l)) return this.error("select" === t ? 21 : 20, u);
                                "other" === l && (a = !0), this.bumpSpace();
                                var f = this.clonePosition();
                                if (!this.bumpIf("{")) return this.error("select" === t ? 17 : 18, rV(this.clonePosition(), this.clonePosition()));
                                var h = this.parseMessage(e + 1, t, n);
                                if (h.err) return h;
                                var p = this.tryParseArgumentClose(f);
                                if (p.err) return p;
                                i.push([l, {
                                    value: h.val,
                                    location: rV(f, this.clonePosition())
                                }]), o.add(l), this.bumpSpace(), l = (s = this.parseIdentifierIfPossible()).value, u = s.location
                            }
                            return 0 === i.length ? this.error("select" === t ? 15 : 16, rV(this.clonePosition(), this.clonePosition())) : this.requiresOtherClause && !a ? this.error(22, rV(this.clonePosition(), this.clonePosition())) : {
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
                            for (var a = !1, i = 0; !this.isEOF();) {
                                var o = this.char();
                                if (o >= 48 && o <= 57) a = !0, i = 10 * i + (o - 48), this.bump();
                                else break
                            }
                            var l = rV(r, this.clonePosition());
                            return a ? Number.isSafeInteger(i *= n) ? {
                                val: i,
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

            function rQ(e) {
                return e >= 97 && e <= 122 || e >= 65 && e <= 90
            }
            var r0 = function(e) {
                    function t(e, n, r) {
                        var a;
                        return th(this, t), (a = td(this, t, [e])).code = n, a.originalMessage = r, a
                    }
                    return tm(t, e), nt(t, [{
                        key: "toString",
                        value: function() {
                            return "[formatjs Error: ".concat(this.code, "] ").concat(this.message)
                        }
                    }]), t
                }(ty(Error)),
                r1 = function(e) {
                    function t(e, n, r, a) {
                        return th(this, t), td(this, t, ['Invalid values for "'.concat(e, '": "').concat(n, '". Options are "').concat(Object.keys(r).join('", "'), '"'), "INVALID_VALUE", a])
                    }
                    return tm(t, e), t
                }(r0),
                r2 = function(e) {
                    function t(e, n, r) {
                        return th(this, t), td(this, t, ['Value for "'.concat(e, '" must be of type ').concat(n), "INVALID_VALUE", r])
                    }
                    return tm(t, e), t
                }(r0),
                r3 = function(e) {
                    function t(e, n) {
                        return th(this, t), td(this, t, ['The intl string context variable "'.concat(e, '" was not provided to the string "').concat(n, '"'), "MISSING_VALUE", n])
                    }
                    return tm(t, e), t
                }(r0);

            function r5(e) {
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
            var r4 = ((ea = function() {
                function e(t) {
                    var n, r = this,
                        a = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : e.defaultLocale,
                        i = arguments.length > 2 ? arguments[2] : void 0,
                        o = arguments.length > 3 ? arguments[3] : void 0;
                    if (th(this, e), this.formatterCache = {
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
                            return function e(t, n, r, a, i, o, l) {
                                if (1 === t.length && 0 === t[0].type) return [{
                                    type: 0,
                                    value: t[0].value
                                }];
                                var u = [],
                                    s = !0,
                                    c = !1,
                                    d = void 0;
                                try {
                                    for (var f, h = t[Symbol.iterator](); !(s = (f = h.next()).done); s = !0) {
                                        var p = f.value;
                                        if (0 === p.type) {
                                            u.push({
                                                type: 0,
                                                value: p.value
                                            });
                                            continue
                                        }
                                        if (7 === p.type) {
                                            "number" == typeof o && u.push({
                                                type: 0,
                                                value: r.getNumberFormat(n).format(o)
                                            });
                                            continue
                                        }
                                        var m = p.value;
                                        if (!(i && m in i)) throw new r3(m, l);
                                        var v = i[m];
                                        if (1 === p.type) {
                                            v && "string" != typeof v && "number" != typeof v && (void 0 === v ? "undefined" : (0, tc._)(v)) !== "bigint" || (v = "string" == typeof v || "number" == typeof v || (void 0 === v ? "undefined" : (0, tc._)(v)) === "bigint" ? String(v) : ""), u.push({
                                                type: +("string" != typeof v),
                                                value: v
                                            });
                                            continue
                                        }
                                        if (3 === p.type) {
                                            var y = "string" == typeof p.style ? a.date[p.style] : rj(p.style) ? p.style.parsedOptions : void 0;
                                            u.push({
                                                type: 0,
                                                value: r.getDateTimeFormat(n, y).format(v)
                                            });
                                            continue
                                        }
                                        if (4 === p.type) {
                                            var g = "string" == typeof p.style ? a.time[p.style] : rj(p.style) ? p.style.parsedOptions : a.time.medium;
                                            u.push({
                                                type: 0,
                                                value: r.getDateTimeFormat(n, g).format(v)
                                            });
                                            continue
                                        }
                                        if (2 === p.type) {
                                            var b = "string" == typeof p.style ? a.number[p.style] : rM(p.style) ? p.style.parsedOptions : void 0;
                                            if (b && b.scale) {
                                                var w = b.scale || 1;
                                                if ((void 0 === v ? "undefined" : (0, tc._)(v)) === "bigint") {
                                                    if (!Number.isInteger(w)) throw TypeError("Cannot apply fractional scale ".concat(w, " to bigint value. Scale must be an integer when formatting bigint."));
                                                    v *= BigInt(w)
                                                } else v *= w
                                            }
                                            u.push({
                                                type: 0,
                                                value: r.getNumberFormat(n, b).format(v)
                                            });
                                            continue
                                        }
                                        if (8 === p.type) {
                                            var E = p.children,
                                                P = p.value,
                                                x = i[P];
                                            if ("function" != typeof x) throw new r2(P, "function", l);
                                            var S = x(e(E, n, r, a, i, o).map(function(e) {
                                                return e.value
                                            }));
                                            Array.isArray(S) || (S = [S]), u.push.apply(u, tx(S.map(function(e) {
                                                return {
                                                    type: +("string" != typeof e),
                                                    value: e
                                                }
                                            })))
                                        }
                                        if (5 === p.type) {
                                            var I = v,
                                                A = (Object.prototype.hasOwnProperty.call(p.options, I) ? p.options[I] : void 0) || p.options.other;
                                            if (!A) throw new r1(p.value, v, Object.keys(p.options), l);
                                            u.push.apply(u, tx(e(A.value, n, r, a, i)));
                                            continue
                                        }
                                        if (6 === p.type) {
                                            var C = "=".concat(v),
                                                T = Object.prototype.hasOwnProperty.call(p.options, C) ? p.options[C] : void 0;
                                            if (!T) {
                                                if (!Intl.PluralRules) throw new r0('Intl.PluralRules is not available in this environment.\nTry polyfilling it using "@formatjs/intl-pluralrules"\n', "MISSING_INTL_API", l);
                                                var k = (void 0 === v ? "undefined" : (0, tc._)(v)) === "bigint" ? Number(v) : v,
                                                    O = r.getPluralRules(n, {
                                                        type: p.pluralType
                                                    }).select(k - (p.offset || 0));
                                                T = (Object.prototype.hasOwnProperty.call(p.options, O) ? p.options[O] : void 0) || p.options.other
                                            }
                                            if (!T) throw new r1(p.value, v, Object.keys(p.options), l);
                                            var _ = (void 0 === v ? "undefined" : (0, tc._)(v)) === "bigint" ? Number(v) : v;
                                            u.push.apply(u, tx(e(T.value, n, r, a, i, _ - (p.offset || 0))));
                                            continue
                                        }
                                    }
                                } catch (e) {
                                    c = !0, d = e
                                } finally {
                                    try {
                                        s || null == h.return || h.return()
                                    } finally {
                                        if (c) throw d
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
                        }, this.locales = a, this.resolvedLocale = e.resolveLocale(a), "string" == typeof t) {
                        if (this.message = t, !e.__parse) throw TypeError("IntlMessageFormat.__parse must be set to process `message` of type `string`");
                        var l = o || {},
                            u = (function(e) {
                                if (null == e) throw TypeError("Cannot destructure " + e)
                            }(l), rC({}, l));
                        this.ast = e.__parse(t, eM(eE({}, u), {
                            locale: this.resolvedLocale
                        }))
                    } else this.ast = t;
                    if (!Array.isArray(this.ast)) throw TypeError("A message must be provided as a String or AST.");
                    this.formats = (n = e.formats, i ? Object.keys(n).reduce(function(e, t) {
                        var r, a;
                        return e[t] = (r = n[t], (a = i[t]) ? eE({}, r, a, Object.keys(r).reduce(function(e, t) {
                            return e[t] = eE({}, r[t], a[t]), e
                        }, {})) : r), e
                    }, eE({}, n)) : n), this.formatters = o && o.formatters || function() {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {
                            number: {},
                            dateTime: {},
                            pluralRules: {}
                        };
                        return {
                            getNumberFormat: rv(function() {
                                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                return tv(Intl.NumberFormat, tx(t))
                            }, {
                                cache: r5(e.number),
                                strategy: rP.variadic
                            }),
                            getDateTimeFormat: rv(function() {
                                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                return tv(Intl.DateTimeFormat, tx(t))
                            }, {
                                cache: r5(e.dateTime),
                                strategy: rP.variadic
                            }),
                            getPluralRules: rv(function() {
                                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                return tv(Intl.PluralRules, tx(t))
                            }, {
                                cache: r5(e.pluralRules),
                                strategy: rP.variadic
                            })
                        }
                    }(this.formatterCache)
                }
                return nt(e, null, [{
                    key: "defaultLocale",
                    get: function() {
                        return e.memoizedDefaultLocale || (e.memoizedDefaultLocale = new Intl.NumberFormat().resolvedOptions().locale), e.memoizedDefaultLocale
                    }
                }]), e
            }()).memoizedDefaultLocale = null, ea.resolveLocale = function(e) {
                if (void 0 !== Intl.Locale) {
                    var t = Intl.NumberFormat.supportedLocalesOf(e);
                    return new Intl.Locale(t.length > 0 ? t[0] : "string" == typeof e ? e : e[0])
                }
            }, ea.__parse = function(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    n = new r$(e, t = eE({
                        shouldParseSkeletons: !0,
                        requiresOtherClause: !0
                    }, t)).parse();
                if (n.err) {
                    var r = SyntaxError(rD[n.err.kind]);
                    throw r.location = n.err.location, r.originalMessage = n.err.message, r
                }
                return (null == t ? void 0 : t.captureLocation) || function e(t) {
                    t.forEach(function(t) {
                        if (delete t.location, 5 === t.type || 6 === t.type)
                            for (var n in t.options) delete t.options[n].location, e(t.options[n].value);
                        else 2 === t.type && rM(t.style) || (3 === t.type || 4 === t.type) && rj(t.style) ? delete t.style.location : 8 === t.type && e(t.children)
                    })
                }(n.val), n.val
            }, ea.formats = {
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
            }, ea);

            function r6() {
                for (var e, t, n, r, a, i = arguments.length, o = Array(i), l = 0; l < i; l++) o[l] = arguments[l];
                var u = tn(o, 4),
                    s = (u[0], u[1]),
                    c = u[2],
                    d = u[3];
                if (Array.isArray(s)) throw new rx(rS.INVALID_MESSAGE, void 0);
                if ("object" == (void 0 === s ? "undefined" : (0, tc._)(s))) throw new rx(rS.INSUFFICIENT_PATH, void 0);
                if ("string" == typeof s) {
                    var f = c || /'[{}<#|']/.test(s) ? void 0 : s;
                    if (f) return f
                }
                var h = d.cache,
                    p = d.formats,
                    m = d.formatters,
                    v = d.globalFormats,
                    y = d.locale,
                    g = d.timeZone;
                m.getMessageFormat || (m.getMessageFormat = rI(function() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    return new r4(t[0], t[1], t[2], eE({
                        formatters: m
                    }, t[3]))
                }, h.message));
                try {
                    a = m.getMessageFormat(s, y, (e = r4.formats.date, t = r4.formats.time, n = eE({}, null == v ? void 0 : v.dateTime, null == p ? void 0 : p.dateTime), r = {
                        date: eE({}, e, n),
                        time: eE({}, t, n),
                        number: eE({}, null == v ? void 0 : v.number, null == p ? void 0 : p.number)
                    }, g && ["date", "time"].forEach(function(e) {
                        var t = r[e],
                            n = !0,
                            a = !1,
                            i = void 0;
                        try {
                            for (var o, l = Object.entries(t)[Symbol.iterator](); !(n = (o = l.next()).done); n = !0) {
                                var u = tn(o.value, 2),
                                    s = u[0],
                                    c = u[1];
                                t[s] = eE({
                                    timeZone: g
                                }, c)
                            }
                        } catch (e) {
                            a = !0, i = e
                        } finally {
                            try {
                                n || null == l.return || l.return()
                            } finally {
                                if (a) throw i
                            }
                        }
                    }), r), {
                        formatters: eM(eE({}, m), {
                            getDateTimeFormat: function(e, t) {
                                var n;
                                return m.getDateTimeFormat(e, eM(eE({}, t), {
                                    timeZone: null != (n = null == t ? void 0 : t.timeZone) ? n : g
                                }))
                            }
                        })
                    })
                } catch (e) {
                    throw new rx(rS.INVALID_MESSAGE, void 0)
                }
                var b = a.format(c);
                return (0, ey.isValidElement)(b) || Array.isArray(b) || "string" == typeof b ? b : String(b)
            }

            function r8() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return t.filter(Boolean).join(".")
            }

            function r7(e) {
                return r8(e.namespace, e.key)
            }

            function r9(e) {
                console.error(e)
            }

            function ae(e, t, n, r) {
                var a = r8(r, n);
                if (!t) throw Error(a);
                var i = t;
                return n.split(".").forEach(function(t) {
                    var n = i[t];
                    if (null == t || null == n) throw Error(a + " (".concat(e, ")"));
                    i = n
                }), i
            }
            r6.raw = !0;
            var at = (0, ey.createContext)(void 0);

            function an(e) {
                var t = e.children,
                    n = e.formats,
                    r = e.getMessageFallback,
                    a = e.locale,
                    i = e.messages,
                    o = e.now,
                    l = e.onError,
                    u = e.timeZone,
                    s = (0, ey.useContext)(at),
                    c = (0, ey.useMemo)(function() {
                        return (null == s ? void 0 : s.cache) || {
                            dateTime: {},
                            number: {},
                            message: {},
                            relativeTime: {},
                            pluralRules: {},
                            list: {},
                            displayNames: {}
                        }
                    }, [a, null == s ? void 0 : s.cache]),
                    d = (0, ey.useMemo)(function() {
                        return (null == s ? void 0 : s.formatters) || {
                            getDateTimeFormat: rA(Intl.DateTimeFormat, c.dateTime),
                            getNumberFormat: rA(Intl.NumberFormat, c.number),
                            getPluralRules: rA(Intl.PluralRules, c.pluralRules),
                            getRelativeTimeFormat: rA(Intl.RelativeTimeFormat, c.relativeTime),
                            getListFormat: rA(Intl.ListFormat, c.list),
                            getDisplayNames: rA(Intl.DisplayNames, c.displayNames)
                        }
                    }, [c, null == s ? void 0 : s.formatters]),
                    f = (0, ey.useMemo)(function() {
                        var e, t, f, h, p;
                        return eM(eE({}, (t = (e = {
                            locale: a,
                            formats: void 0 === n ? null == s ? void 0 : s.formats : n,
                            getMessageFallback: r || (null == s ? void 0 : s.getMessageFallback),
                            messages: void 0 === i ? null == s ? void 0 : s.messages : i,
                            now: o || (null == s ? void 0 : s.now),
                            onError: l || (null == s ? void 0 : s.onError),
                            timeZone: u || (null == s ? void 0 : s.timeZone)
                        }).formats, f = e.getMessageFallback, h = e.messages, p = e.onError, eM(eE({}, eX(e, ["formats", "getMessageFallback", "messages", "onError"])), {
                            formats: t || void 0,
                            messages: h || void 0,
                            onError: p || r9,
                            getMessageFallback: f || r7
                        }))), {
                            formatters: d,
                            cache: c
                        })
                    }, [c, n, d, r, a, i, o, l, s, u]);
                return (0, nH.jsx)(at.Provider, {
                    value: f,
                    children: t
                })
            }

            function ar() {
                var e = (0, ey.useContext)(at);
                if (!e) throw Error(void 0);
                return e
            }
            var aa = !1,
                ai = "u" < typeof window,
                ao = "__FN_nvfToKPAOuiV__",
                al = "__FN_END_nvfToKPAOuiV__",
                au = new RegExp("".concat(ao, "(\\d+)\\|")),
                as = new RegExp("".concat(al, "(\\d+)\\|")),
                ac = function(e, t, n) {
                    var r = eE({}, n),
                        a = {};
                    t.forEach(function(e, t) {
                        var n = t.toString(),
                            i = "".concat(ao).concat(n, "|"),
                            o = "".concat(al).concat(n, "|");
                        r[e.opening] = i, r[e.closing] = o, a[n] = {
                            start: i,
                            end: o,
                            render: e.render
                        }
                    });
                    var i = function(e) {
                            var t = [],
                                n = au.exec(e),
                                r = as.exec(e);
                            if (r && (!n || r.index < n.index)) return null;
                            if (!n) return [e];
                            n.index > 0 && t.push(e.slice(0, n.index));
                            var o = null == n[1] ? void 0 : a[n[1]];
                            if (null == o) return null;
                            var l = e.indexOf(o.end);
                            if (l < n.index + n[0].length) return null;
                            var u = i(e.slice(n.index + n[0].length, l));
                            if (null == u) return null;
                            t.push(o.render(u));
                            var s = e.slice(l + o.end.length);
                            if (s.length > 0) {
                                var c = i(s);
                                if (null == c) return null;
                                t.push.apply(t, tx(c))
                            }
                            return t
                        },
                        o = i(e(r));
                    return null == o ? null : o.filter(function(e) {
                        return "" !== e
                    }).map(function(e, t) {
                        return (0, nH.jsx)(ey.Fragment, {
                            children: e
                        }, t)
                    })
                },
                ad = function(e) {
                    return e.replaceAll(".", ":")
                };

            function af() {
                return null != ei || (ei = "".concat(ex().apiGatewayUrl.replace(/\/$/, ""), "/experience-signals-ingest/public")), ei
            }
            var ah = function() {},
                ap = function(e, t) {
                    return e << 3 | t
                },
                am = ap(1, 2),
                av = ap(2, 2),
                ay = ap(5, 2),
                ag = ap(6, 2),
                ab = ap(8, 2),
                aw = ap(1, 2),
                aE = ap(2, 1),
                aP = ap(3, 0),
                ax = ap(5, 2);
            ap(1, 2), ap(2, 1), ap(3, 0), ap(4, 2), ap(5, 2), ap(6, 0), ap(8, 2);
            var aS = ap(4, 0),
                aI = ap(6, 2),
                aA = ap(7, 2);
            ap(1, 0), ap(2, 2);
            var aC = ap(1, 2),
                aT = ap(2, 2),
                ak = ap(1, 2);
            ap(1, 2), ap(2, 2), ap(1, 2);
            var aO = new TextEncoder,
                a_ = function() {
                    function e() {
                        th(this, e), ew(this, "buf", [])
                    }
                    return nt(e, [{
                        key: "writeVarint",
                        value: function(e) {
                            var t = (void 0 === e ? "undefined" : (0, tc._)(e)) === "bigint" ? e : BigInt(Math.trunc(e));
                            for (t < BigInt(0) && (t += BigInt(1) << BigInt(64)); t > BigInt(127);) this.buf.push(128 | Number(t & BigInt(127))), t >>= BigInt(7);
                            this.buf.push(Number(t))
                        }
                    }, {
                        key: "writeString",
                        value: function(e) {
                            var t = aO.encode(e);
                            this.writeVarint(t.length);
                            var n = !0,
                                r = !1,
                                a = void 0;
                            try {
                                for (var i, o = t[Symbol.iterator](); !(n = (i = o.next()).done); n = !0) {
                                    var l = i.value;
                                    this.buf.push(l)
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

            function aN(e, t, n) {
                var r = new a_;
                return r.writeVarint(ap(1, 2)), r.writeString(e), r.writeVarint(t), n(r), r.toBytes()
            }

            function aL(e) {
                var t = new a_;
                if (t.writeVarint(aw), t.writeString(e.name), t.writeVarint(aE), t.writeDouble(e.value), t.writeVarint(aP), t.writeVarint(e.timestampMs), e.attributes && Object.keys(e.attributes).length > 0) {
                    var n = function(e) {
                        var t = new a_,
                            n = !0,
                            r = !1,
                            a = void 0;
                        try {
                            for (var i, o = Object.entries(e)[Symbol.iterator](); !(n = (i = o.next()).done); n = !0) ! function() {
                                var e = tn(i.value, 2),
                                    n = e[0],
                                    r = e[1];
                                if ("string" == typeof r) {
                                    var a = aN(n, ap(2, 2), function(e) {
                                        e.writeString(r)
                                    });
                                    t.writeVarint(ay), t.writeBytes(a)
                                } else if ("boolean" == typeof r) {
                                    var o = aN(n, ap(2, 0), function(e) {
                                        e.writeVarint(+!!r)
                                    });
                                    t.writeVarint(ag), t.writeBytes(o)
                                } else if ((void 0 === r ? "undefined" : (0, tc._)(r)) === "bigint") {
                                    var l = aN(n, ap(2, 0), function(e) {
                                        e.writeVarint(r)
                                    });
                                    t.writeVarint(av), t.writeBytes(l)
                                } else if ("number" == typeof r)
                                    if (Number.isFinite(r))
                                        if (Number.isInteger(r) && r >= -0x80000000 && r <= 0x7fffffff) {
                                            var u = aN(n, ap(2, 0), function(e) {
                                                e.writeVarint(r)
                                            });
                                            t.writeVarint(am), t.writeBytes(u)
                                        } else if (Number.isInteger(r)) {
                                    var s = aN(n, ap(2, 0), function(e) {
                                        e.writeVarint(BigInt(r))
                                    });
                                    t.writeVarint(av), t.writeBytes(s)
                                } else {
                                    var c = aN(n, ap(2, 1), function(e) {
                                        e.writeDouble(r)
                                    });
                                    t.writeVarint(ab), t.writeBytes(c)
                                } else {
                                    var d = aN(n, ap(2, 2), function(e) {
                                        e.writeString(String(r))
                                    });
                                    t.writeVarint(ay), t.writeBytes(d)
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
                    }(e.attributes);
                    t.writeVarint(ax), t.writeBytes(n)
                }
                return t.toBytes()
            }

            function aB(e, t, n) {
                var r = new a_;
                r.writeVarint(aS), r.writeVarint(n);
                var a = !0,
                    i = !1,
                    o = void 0;
                try {
                    for (var l, u = e[Symbol.iterator](); !(a = (l = u.next()).done); a = !0) {
                        var s = l.value;
                        r.writeVarint(aI), r.writeBytes(s)
                    }
                } catch (e) {
                    i = !0, o = e
                } finally {
                    try {
                        a || null == u.return || u.return()
                    } finally {
                        if (i) throw o
                    }
                }
                var c = !0,
                    d = !1,
                    f = void 0;
                try {
                    for (var h, p = t[Symbol.iterator](); !(c = (h = p.next()).done); c = !0) {
                        var m = h.value;
                        r.writeVarint(aA), r.writeBytes(m)
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

            function aR(e) {
                var t = new a_;
                t.writeVarint(aC), t.writeString("eventstream.enginetelemetry.EngineTelemetryBatchEvent"), t.writeVarint(aT), t.writeBytes(e);
                var n = t.toBytes(),
                    r = new a_;
                return r.writeVarint(ak), r.writeBytes(n), r.toBytes()
            }
            var aU = /^[a-zA-Z_][a-zA-Z0-9_]*$/;

            function aD(e) {
                return aU.test(e)
            }
            var aM = [],
                aj = !1,
                aF = !1;

            function aH(e, t) {
                var n, r, a = e.map(function(e) {
                        return {
                            name: e.name,
                            value: e.value,
                            timestampMs: e.timestampMs,
                            attributes: e.attributes
                        }
                    }),
                    i = BigInt(Date.now());
                !0 === t || aF || "u" > typeof document && "hidden" === document.visibilityState ? (n = aR(aB(a.map(aL), [], i)).buffer, fetch("".concat(af()).concat("/v1/events/single"), {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/x-protobuf"
                    },
                    body: n,
                    credentials: "include",
                    keepalive: !0
                }).catch(ah)) : (r = aR(aB(a.map(aL), [], i)), em(function() {
                    var e, t, n, a, i, o, l, u, s, c, d, f, h;
                    return ev(this, function(p) {
                        switch (p.label) {
                            case 0:
                                if ("u" < typeof CompressionStream) return [2, {
                                    body: r.buffer,
                                    compressed: !1
                                }];
                                return (t = (e = new CompressionStream("gzip")).writable.getWriter()).write(r).catch(ah), t.close().catch(ah), n = [], [4, (a = e.readable.getReader()).read()];
                            case 1:
                                i = p.sent(), p.label = 2;
                            case 2:
                                if (i.done) return [3, 4];
                                return n.push(i.value), [4, a.read()];
                            case 3:
                                return i = p.sent(), [3, 2];
                            case 4:
                                o = new Uint8Array(n.reduce(function(e, t) {
                                    return e + t.length
                                }, 0)), l = 0, u = !0, s = !1, c = void 0;
                                try {
                                    for (d = n[Symbol.iterator](); !(u = (f = d.next()).done); u = !0) h = f.value, o.set(h, l), l += h.length
                                } catch (e) {
                                    s = !0, c = e
                                } finally {
                                    try {
                                        u || null == d.return || d.return()
                                    } finally {
                                        if (s) throw c
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
                    return n && (r["Content-Encoding"] = "gzip"), fetch("".concat(af()).concat("/v1/events/single"), {
                        method: "POST",
                        headers: r,
                        body: t,
                        credentials: "include",
                        keepalive: !0
                    })
                }).catch(ah)
            }

            function aG() {
                var e = !0,
                    t = !1,
                    n = void 0;
                try {
                    for (var r, a = aM[Symbol.iterator](); !(e = (r = a.next()).done); e = !0) {
                        var i = r.value.splice(0);
                        0 !== i.length && aH(i, !0)
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

            function az(e, t) {
                var n, r, a, i = Math.max(1, null != (n = null == t ? void 0 : t.batchSize) ? n : 10),
                    o = null != (r = null == t ? void 0 : t.batchIntervalMs) ? r : 250;

                function l(e, n) {
                    (null == t ? void 0 : t.onError) ? t.onError(e, n): console.error(e, n)
                }
                if (!aD(e)) return l('@rbx/web-telemetry: invalid featureName "'.concat(e, '"'), {
                        name: e
                    }),
                    function() {};
                var u = [];
                return aM.push(u), aj || ("u" > typeof document && document.addEventListener("visibilitychange", function() {
                        "hidden" === document.visibilityState && aG()
                    }), "u" > typeof window && window.addEventListener("beforeunload", function() {
                        aF = !0, aG()
                    }), aj = !0),
                    function(t, n, r) {
                        var s = "".concat(e, "_").concat(t);
                        if (! function(e, t) {
                                if (!aD(e)) return !1;
                                if (t) {
                                    var n = !0,
                                        r = !1,
                                        a = void 0;
                                    try {
                                        for (var i, o = Object.keys(t)[Symbol.iterator](); !(n = (i = o.next()).done); n = !0) {
                                            var l = i.value;
                                            if (!aD(l)) return !1
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
                            }(s, n)) return void l("@rbx/web-telemetry: invalid event name or attribute key", {
                            name: t,
                            attributes: n
                        });
                        var c = null != r ? r : 1;
                        if (!Number.isFinite(c)) return void l("@rbx/web-telemetry: value must be a finite number", {
                            name: t,
                            attributes: n
                        });
                        var d = n && Object.keys(n).length > 0 ? n : void 0;
                        u.push({
                            name: s,
                            attributes: d,
                            value: c,
                            timestampMs: BigInt(Date.now())
                        }), u.length >= i ? (void 0 !== a && (clearTimeout(a), a = void 0), aH(u.splice(0, i))) : void 0 === a && (a = setTimeout(function() {
                            for (a = void 0; u.length > 0;) aH(u.splice(0, i))
                        }, o))
                    }
            }
            var aV = "WwwCommon",
                aW = function(e) {
                    var t = e.publish,
                        n = e.captureException,
                        r = e.featureName;

                    function a(e, t, a) {
                        if (null != a) {
                            var i = (0, tf._)(a, Error) ? a.name || "Error" : "UnknownError",
                                o = r ? "".concat(r, "_").concat(e) : e;
                            return null == n || n(a, {
                                error_counter: o
                            }), eM(eE({}, t), {
                                errorType: i
                            })
                        }
                        return t
                    }
                    return {
                        trackCounter: function() {
                            for (var e = arguments.length, n = Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                            var a = tn(n, 2);
                            t(a[0], a[1])
                        },
                        trackError: function() {
                            for (var e = arguments.length, n = Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                            var i = tn(n, 3),
                                o = i[0],
                                l = i[1],
                                u = i[2],
                                s = a(o, eM(eE({}, null != l ? l : {}), {
                                    severity: "error"
                                }), u);
                            t(o, s)
                        },
                        trackCriticalError: function() {
                            for (var e = arguments.length, n = Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                            var i = tn(n, 3),
                                o = i[0],
                                l = i[1],
                                u = i[2],
                                s = a(o, eM(eE({}, null != l ? l : {}), {
                                    severity: "critical"
                                }), u);
                            t(o, s)
                        }
                    }
                }({
                    publish: az(aV)
                });
            aW.trackCounter;
            var aq = aW.trackError;
            aW.trackCriticalError;
            var aK = function() {
                    if ("u" > typeof document) {
                        var e = document.querySelector('meta[name="page-meta"]');
                        return null == e ? void 0 : e.dataset.internalPageName
                    }
                },
                aZ = function(e) {
                    return "string" == typeof e && e.length > 0
                },
                aY = function(e, t, n) {
                    var r;
                    "u" > typeof window && aq(e, {
                        key: n,
                        namespace: t,
                        internalPageName: null != (r = aK()) ? r : "unknown"
                    })
                },
                aJ = function(e) {
                    var t, n, r, a, i, o, l, u, s, c, d, f, h, p = (t = ad(e), n = {
                        "!": ar().messages
                    }, r = t ? "!.".concat(t) : "!", i = (a = ar()).cache, o = a.formats, l = a.formatters, u = a.getMessageFallback, s = a.locale, c = a.onError, d = a.timeZone, f = n["!"], h = "!" === r ? void 0 : r.slice(2), d || aa || !ai || (aa = !0, c(new rx(rS.ENVIRONMENT_FALLBACK, void 0))), (0, ey.useMemo)(function() {
                        var e, t;
                        return t = function(e, t, n) {
                                try {
                                    if (!t) throw Error(void 0);
                                    var r = n ? ae(e, t, n) : t;
                                    if (!r) throw Error(n);
                                    return r
                                } catch (e) {
                                    return new rx(rS.MISSING_MESSAGE, e.message)
                                }
                            }((e = {
                                cache: i,
                                formatters: l,
                                getMessageFallback: u,
                                messages: f,
                                namespace: h,
                                onError: c,
                                formats: o,
                                locale: s,
                                timeZone: d
                            }).locale, e.messages, e.namespace),
                            function(e) {
                                var t = e.cache,
                                    n = e.formats,
                                    r = e.formatters,
                                    a = e.getMessageFallback,
                                    i = void 0 === a ? r7 : a,
                                    o = e.locale,
                                    l = e.messagesOrError,
                                    u = e.namespace,
                                    s = e.onError,
                                    c = e.timeZone,
                                    d = (0, tf._)(l, rx);

                                function f(e, t, n, r) {
                                    var a = new rx(t, n);
                                    return s(a), null != r ? r : i({
                                        error: a,
                                        key: e,
                                        namespace: u
                                    })
                                }

                                function h(e, a, h, p) {
                                    var m, v, y;
                                    if (d) {
                                        if (!p) return s(l), i({
                                            error: l,
                                            key: e,
                                            namespace: u
                                        });
                                        m = p
                                    } else try {
                                        m = ae(o, l, e, u)
                                    } catch (t) {
                                        if (!p) return f(e, rS.MISSING_MESSAGE, t.message, p);
                                        m = p
                                    }
                                    try {
                                        var g, b = r8(u, e);
                                        return r6(b, m, a ? (g = {}, Object.keys(a).forEach(function(e) {
                                            var t, n = 0,
                                                r = a[e];
                                            t = "function" == typeof r ? function(t) {
                                                var a = r(t);
                                                return (0, ey.isValidElement)(a) ? (0, ey.cloneElement)(a, {
                                                    key: e + n++
                                                }) : a
                                            } : r, g[e] = t
                                        }), g) : a, {
                                            cache: t,
                                            formatters: r,
                                            globalFormats: n,
                                            formats: h,
                                            locale: o,
                                            timeZone: c
                                        })
                                    } catch (t) {
                                        return (0, tf._)(t, rx) ? (v = t.code, y = t.originalMessage) : (v = rS.FORMATTING_ERROR, y = t.message), f(e, v, y, p)
                                    }
                                }

                                function p(e, t, n, r) {
                                    var a = h(e, t, n, r);
                                    return "string" != typeof a ? f(e, rS.INVALID_MESSAGE, void 0) : a
                                }
                                return p.rich = h, p.markup = function(e, t, n, r) {
                                    return h(e, t, n, r)
                                }, p.raw = function(e) {
                                    if (d) return s(l), i({
                                        error: l,
                                        key: e,
                                        namespace: u
                                    });
                                    try {
                                        return ae(o, l, e, u)
                                    } catch (t) {
                                        return f(e, rS.MISSING_MESSAGE, t.message)
                                    }
                                }, p.has = function(e) {
                                    if (d) return !1;
                                    try {
                                        return ae(o, l, e, u), !0
                                    } catch (e) {
                                        return !1
                                    }
                                }, p
                            }(eM(eE({}, e), {
                                messagesOrError: t
                            }))
                    }, [i, l, u, f, h, c, o, s, d]));
                    return (0, ey.useMemo)(function() {
                        return Object.assign(function(t, n, r) {
                            var a = ad(t);
                            return void 0 === r || p.has(a) ? p(a, n) : (aY("TranslationKeyNotFound", e, a), r)
                        }, {
                            rich: function(e, t) {
                                return p.rich(ad(e), t)
                            },
                            has: function(e) {
                                return aZ(e) && p.has(ad(e))
                            },
                            dynamic: function(t, n) {
                                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "";
                                if (!aZ(t)) return aY("TranslationKeyNotFound", e, String(t)), r;
                                var a = ad(t),
                                    i = p.has(a);
                                return i || aY("TranslationKeyNotFound", e, a), i ? p(a, n) : r
                            },
                            html: function(t, n, r) {
                                if (!aZ(t)) return aY("TranslationKeyNotFound", e, String(t)), null;
                                var a = ad(t);
                                if (!p.has(a)) return aY("TranslationKeyNotFound", e, a), null;
                                var i = ac(function(e) {
                                    return p(a, e)
                                }, n, r);
                                return null == i && aY("TranslationMalformed", e, a), i
                            }
                        })
                    }, [p, e])
                },
                aX = ["Feature.GameLaunchGuestMode", "Common.VisitGame", "CommonUI.Controls", "Feature.ExperienceDetails", "Feature.DownloadLanding", "Feature.Build", "Feature.Friends"],
                a$ = function() {
                    var e = tn(aX, 7),
                        t = e[0],
                        n = e[1],
                        r = e[2],
                        a = e[3],
                        i = e[4],
                        o = e[5],
                        l = e[6],
                        u = aJ(t),
                        s = aJ(n),
                        c = aJ(r),
                        d = aJ(a),
                        f = aJ(i),
                        h = aJ(o),
                        p = aJ(l);
                    return (0, ey.useMemo)(function() {
                        var e = [p, h, f, d, c, s, u];
                        return function(t, n, r) {
                            var a = e.find(function(e) {
                                return e.has(t)
                            });
                            return a ? a.dynamic(t, n && Object.fromEntries(Object.entries(n).filter(function(e) {
                                return "string" == typeof e[1] || "number" == typeof e[1] || (0, tf._)(e[1], Date)
                            }))) : null != r ? r : ""
                        }
                    }, [u, s, c, d, f, h, p])
                },
                aQ = function(e) {
                    var t = e.onButtonClick,
                        n = e.buttonWidth,
                        r = e.buttonClassName,
                        a = a$();
                    return (0, nH.jsxs)(eg().Fragment, {
                        children: [(0, nH.jsx)(rl, {
                            "data-testid": "play-action-needed-button",
                            variant: "Emphasis",
                            style: rh,
                            className: nz()(rf(void 0 === n ? rd : n), void 0 === r ? "btn-common-play-game-action-needed-lg game-play-button-action-needed-lg" : r),
                            onClick: t,
                            children: a(eG.Unlock)
                        }), (0, nH.jsx)("div", {
                            id: "access-management-upsell-container-v1"
                        })]
                    })
                },
                a0 = function(e) {
                    var t = e.universeId,
                        n = e.buttonClassName,
                        r = e.pageContext,
                        a = (0, ey.useCallback)(function(e) {
                            e.preventDefault(), e.stopPropagation(), eT(eV.PlayButtonUpsellExperienceApprovalTriggered), nR(t, eW.experienceApprovalUpsellName, ej.ContextualPlayabilityRequireParentApproval, r);
                            var n = nP();
                            n ? n({
                                featureName: "CanApproveExperience",
                                namespace: eZ.accountManagement,
                                isAsyncCall: !1,
                                usePrologue: !0,
                                ampRecourseData: {
                                    universeId: t,
                                    experienceManagementAction: "Approve"
                                }
                            }).catch(function() {
                                eT(eV.PlayButtonUpsellExperienceApprovalError)
                            }) : eT(eV.PlayButtonUpsellExperienceApprovalError)
                        }, [t, r]);
                    return (0, nH.jsx)(aQ, {
                        onButtonClick: a,
                        buttonClassName: n
                    })
                };
            a0.defaultProps = {
                buttonClassName: void 0
            };
            var a1 = function(e) {
                    var t = e.buttonClassName,
                        n = e.buttonWidth;
                    return (0, nH.jsx)(rl, {
                        "data-testid": "play-button-loading",
                        variant: "Emphasis",
                        isLoading: !0,
                        "aria-label": "Loading",
                        style: rh,
                        className: nz()(rf(void 0 === n ? rd : n), void 0 === t ? "btn-common-play-game-lg game-play-button-lg" : t)
                    })
                },
                a2 = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-small"
                },
                a3 = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                a5 = function(e) {
                    var t = e.variant,
                        n = e.size,
                        r = e.isCircular,
                        a = e.className,
                        i = eX(e, ["variant", "size", "isCircular", "className"]);
                    return eg().createElement("button", eE({
                        type: "button",
                        className: n$("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", nQ, a3[t], a2[n], r && "radius-circle", a)
                    }, i), eg().createElement(n0, null), eg().createElement(n3, {
                        name: "icon-regular-x",
                        size: n
                    }))
                };

            function a4(e, t) {
                var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    r = n.checkForDefaultPrevented,
                    a = void 0 === r || r;
                return function(n) {
                    if (null == e || e(n), !1 === a || !n.defaultPrevented) return null == t ? void 0 : t(n)
                }
            }

            function a6() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                var r = t[0];
                if (1 === t.length) return r;
                var a = function() {
                    var e = t.map(function(e) {
                        return {
                            useScope: e(),
                            scopeName: e.scopeName
                        }
                    });
                    return function(t) {
                        var n = e.reduce(function(e, n) {
                            var r = n.useScope,
                                a = n.scopeName;
                            return eE({}, e, r(t)["__scope".concat(a)])
                        }, {});
                        return ey.useMemo(function() {
                            return ew({}, "__scope".concat(r.scopeName), n)
                        }, [n])
                    }
                };
                return a.scopeName = r.scopeName, a
            }
            var a8 = (null == (eo = globalThis) ? void 0 : eo.document) ? ey.useLayoutEffect : function() {},
                a7 = ey[" useId ".trim().toString()] || function() {},
                a9 = 0;

            function ie(e) {
                var t = tn(ey.useState(a7()), 2),
                    n = t[0],
                    r = t[1];
                return a8(function() {
                    e || r(function(e) {
                        return null != e ? e : String(a9++)
                    })
                }, [e]), e || (n ? "radix-".concat(n) : "")
            }

            function it(e) {
                var t = ey.useRef(e);
                return ey.useEffect(function() {
                    t.current = e
                }), ey.useMemo(function() {
                    return function() {
                        for (var e, n = arguments.length, r = Array(n), a = 0; a < n; a++) r[a] = arguments[a];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(tx(r)))
                    }
                }, [])
            }
            var ir = window.RadixUI["react-dismissable-layer"],
                ia = window.RadixUI["react-focus-scope"],
                ii = window.ReactDOM,
                io = n.n(ii);

            function il(e) {
                var t, n, r = (t = e, (n = ey.forwardRef(function(e, t) {
                        var n = e.children,
                            r = eX(e, ["children"]);
                        if (ey.isValidElement(n)) {
                            var a, i, o, l, u, s = (u = (l = null == (i = Object.getOwnPropertyDescriptor((a = n).props, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? a.ref : (u = (l = null == (o = Object.getOwnPropertyDescriptor(a, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning) ? a.props.ref : a.props.ref || a.ref,
                                c = function(e, t) {
                                    var n = eE({}, t);
                                    for (var r in t) ! function(r) {
                                        var a = e[r],
                                            i = t[r];
                                        /^on[A-Z]/.test(r) ? a && i ? n[r] = function() {
                                            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                            i.apply(void 0, tx(t)), a.apply(void 0, tx(t))
                                        } : a && (n[r] = a) : "style" === r ? n[r] = eE({}, a, i) : "className" === r && (n[r] = [a, i].filter(Boolean).join(" "))
                                    }(r);
                                    return eE({}, e, n)
                                }(r, n.props);
                            return n.type !== ey.Fragment && (c.ref = t ? n4(t, s) : s), ey.cloneElement(n, c)
                        }
                        return ey.Children.count(n) > 1 ? ey.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), n),
                    a = ey.forwardRef(function(e, t) {
                        var n = e.children,
                            a = eX(e, ["children"]),
                            i = ey.Children.toArray(n),
                            o = i.find(is);
                        if (o) {
                            var l = o.props.children,
                                u = i.map(function(e) {
                                    return e !== o ? e : ey.Children.count(l) > 1 ? ey.Children.only(null) : ey.isValidElement(l) ? l.props.children : null
                                });
                            return (0, nH.jsx)(r, eM(eE({}, a), {
                                ref: t,
                                children: ey.isValidElement(l) ? ey.cloneElement(l, void 0, u) : null
                            }))
                        }
                        return (0, nH.jsx)(r, eM(eE({}, a), {
                            ref: t,
                            children: n
                        }))
                    });
                return a.displayName = "".concat(e, ".Slot"), a
            }
            var iu = Symbol("radix.slottable");

            function is(e) {
                return ey.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === iu
            }
            var ic = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
                    var n = il("Primitive.".concat(t)),
                        r = ey.forwardRef(function(e, r) {
                            var a = e.asChild,
                                i = eX(e, ["asChild"]),
                                o = a ? n : t;
                            return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, nH.jsx)(o, eM(eE({}, i), {
                                ref: r
                            }))
                        });
                    return r.displayName = "Primitive.".concat(t), eM(eE({}, e), ew({}, t, r))
                }, {}),
                id = ey.forwardRef(function(e, t) {
                    var n, r, a = e.container,
                        i = eX(e, ["container"]),
                        o = tn(ey.useState(!1), 2),
                        l = o[0],
                        u = o[1];
                    a8(function() {
                        return u(!0)
                    }, []);
                    var s = a || l && (null == (r = globalThis) || null == (n = r.document) ? void 0 : n.body);
                    return s ? io().createPortal((0, nH.jsx)(ic.div, eM(eE({}, i), {
                        ref: t
                    })), s) : null
                });
            id.displayName = "Portal";
            var ih = function(e) {
                var t, n, r, a, i, o, l, u, s, c, d, f, h, p, m, v, y, g = e.present,
                    b = e.children,
                    w = (t = g, i = (a = tn(ey.useState(), 2))[0], o = a[1], l = ey.useRef({}), u = ey.useRef(t), s = ey.useRef("none"), d = (c = tn((n = t ? "mounted" : "unmounted", r = {
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
                    }, ey.useReducer(function(e, t) {
                        var n = r[e][t];
                        return null != n ? n : e
                    }, n)), 2))[0], f = c[1], ey.useEffect(function() {
                        var e = ip(l.current);
                        s.current = "mounted" === d ? e : "none"
                    }, [d]), a8(function() {
                        var e = l.current,
                            n = u.current;
                        if (n !== t) {
                            var r = s.current,
                                a = ip(e);
                            t ? f("MOUNT") : "none" === a || (null == e ? void 0 : e.display) === "none" ? f("UNMOUNT") : n && r !== a ? f("ANIMATION_OUT") : f("UNMOUNT"), u.current = t
                        }
                    }, [t, f]), a8(function() {
                        if (i) {
                            var e, t, n = null != (e = i.ownerDocument.defaultView) ? e : window,
                                r = function(e) {
                                    var r = ip(l.current).includes(e.animationName);
                                    if (e.target === i && r && (f("ANIMATION_END"), !u.current)) {
                                        var a = i.style.animationFillMode;
                                        i.style.animationFillMode = "forwards", t = n.setTimeout(function() {
                                            "forwards" === i.style.animationFillMode && (i.style.animationFillMode = a)
                                        })
                                    }
                                },
                                a = function(e) {
                                    e.target === i && (s.current = ip(l.current))
                                };
                            return i.addEventListener("animationstart", a), i.addEventListener("animationcancel", r), i.addEventListener("animationend", r),
                                function() {
                                    n.clearTimeout(t), i.removeEventListener("animationstart", a), i.removeEventListener("animationcancel", r), i.removeEventListener("animationend", r)
                                }
                        }
                        f("ANIMATION_END")
                    }, [i, f]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(d),
                        ref: ey.useCallback(function(e) {
                            e && (l.current = getComputedStyle(e)), o(e)
                        }, [])
                    }),
                    E = "function" == typeof b ? b({
                        present: w.isPresent
                    }) : ey.Children.only(b),
                    P = n6(w.ref, (y = (v = null == (p = Object.getOwnPropertyDescriptor((h = E).props, "ref")) ? void 0 : p.get) && "isReactWarning" in v && v.isReactWarning) ? h.ref : (y = (v = null == (m = Object.getOwnPropertyDescriptor(h, "ref")) ? void 0 : m.get) && "isReactWarning" in v && v.isReactWarning) ? h.props.ref : h.props.ref || h.ref);
                return "function" == typeof b || w.isPresent ? ey.cloneElement(E, {
                    ref: P
                }) : null
            };

            function ip(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }
            ih.displayName = "Presence";
            var im = window.RadixUI["react-focus-guards"],
                iv = function() {
                    return (iv = Object.assign || function(e) {
                        for (var t, n = 1, r = arguments.length; n < r; n++)
                            for (var a in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, a) && (e[a] = t[a]);
                        return e
                    }).apply(this, arguments)
                };

            function iy(e, t) {
                var n = {};
                for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && 0 > t.indexOf(r) && (n[r] = e[r]);
                if (null != e && "function" == typeof Object.getOwnPropertySymbols)
                    for (var a = 0, r = Object.getOwnPropertySymbols(e); a < r.length; a++) 0 > t.indexOf(r[a]) && Object.prototype.propertyIsEnumerable.call(e, r[a]) && (n[r[a]] = e[r[a]]);
                return n
            }
            var ig = "right-scroll-bar-position",
                ib = "width-before-scroll-bar";

            function iw(e, t) {
                return "function" == typeof e ? e(t) : e && (e.current = t), e
            }
            var iE = "u" > typeof window ? ey.useLayoutEffect : ey.useEffect,
                iP = new WeakMap,
                ix = (void 0 === b && (b = {}), (void 0 === w && (w = function(e) {
                    return e
                }), E = [], P = !1, x = {
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
                            a = function() {
                                return Promise.resolve().then(r)
                            };
                        a(), E = {
                            push: function(e) {
                                t.push(e), a()
                            },
                            filter: function(e) {
                                return t = t.filter(e), E
                            }
                        }
                    }
                }).options = iv({
                    async: !0,
                    ssr: !1
                }, b), x),
                iS = function() {},
                iI = ey.forwardRef(function(e, t) {
                    var n, r, a, i, o = ey.useRef(null),
                        l = ey.useState({
                            onScrollCapture: iS,
                            onWheelCapture: iS,
                            onTouchMoveCapture: iS
                        }),
                        u = l[0],
                        s = l[1],
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
                        x = iy(e, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noRelative", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        S = (n = [o, t], r = function(e) {
                            return n.forEach(function(t) {
                                return iw(t, e)
                            })
                        }, (a = (0, ey.useState)(function() {
                            return {
                                value: null,
                                callback: r,
                                facade: {
                                    get current() {
                                        return a.value
                                    },
                                    set current(value) {
                                        var e = a.value;
                                        e !== value && (a.value = value, a.callback(value, e))
                                    }
                                }
                            }
                        })[0]).callback = r, i = a.facade, iE(function() {
                            var e = iP.get(i);
                            if (e) {
                                var t = new Set(e),
                                    r = new Set(n),
                                    a = i.current;
                                t.forEach(function(e) {
                                    r.has(e) || iw(e, null)
                                }), r.forEach(function(e) {
                                    t.has(e) || iw(e, a)
                                })
                            }
                            iP.set(i, n)
                        }, [n]), i),
                        I = iv(iv({}, x), u);
                    return ey.createElement(ey.Fragment, null, p && ey.createElement(v, {
                        sideCar: ix,
                        removeScrollBar: h,
                        shards: m,
                        noRelative: y,
                        noIsolation: g,
                        inert: b,
                        setCallbacks: s,
                        allowPinchZoom: !!w,
                        lockRef: o,
                        gapMode: P
                    }), c ? ey.cloneElement(ey.Children.only(d), iv(iv({}, I), {
                        ref: S
                    })) : ey.createElement(void 0 === E ? "div" : E, iv({}, I, {
                        className: f,
                        ref: S
                    }), d))
                });
            iI.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, iI.classNames = {
                fullWidth: ib,
                zeroRight: ig
            };
            var iA = function(e) {
                var t = e.sideCar,
                    n = iy(e, ["sideCar"]);
                if (!t) throw Error("Sidecar: please provide `sideCar` property to import the right car");
                var r = t.read();
                if (!r) throw Error("Sidecar medium not found");
                return ey.createElement(r, iv({}, n))
            };
            iA.isSideCarExport = !0;
            var iC = function() {
                    var e = 0,
                        t = null;
                    return {
                        add: function(r) {
                            if (0 == e && (t = function() {
                                    if (!document) return null;
                                    var e = document.createElement("style");
                                    e.type = "text/css";
                                    var t = el || n.nc;
                                    return t && e.setAttribute("nonce", t), e
                                }())) {
                                var a, i;
                                (a = t).styleSheet ? a.styleSheet.cssText = r : a.appendChild(document.createTextNode(r)), i = t, (document.head || document.getElementsByTagName("head")[0]).appendChild(i)
                            }
                            e++
                        },
                        remove: function() {
                            --e || !t || (t.parentNode && t.parentNode.removeChild(t), t = null)
                        }
                    }
                },
                iT = function() {
                    var e = iC();
                    return function(t, n) {
                        ey.useEffect(function() {
                            return e.add(t),
                                function() {
                                    e.remove()
                                }
                        }, [t && n])
                    }
                },
                ik = function() {
                    var e = iT();
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
                i_ = function(e) {
                    return parseInt(e || "", 10) || 0
                },
                iN = function(e) {
                    var t = window.getComputedStyle(document.body),
                        n = t["padding" === e ? "paddingLeft" : "marginLeft"],
                        r = t["padding" === e ? "paddingTop" : "marginTop"],
                        a = t["padding" === e ? "paddingRight" : "marginRight"];
                    return [i_(n), i_(r), i_(a)]
                },
                iL = function(e) {
                    if (void 0 === e && (e = "margin"), "u" < typeof window) return iO;
                    var t = iN(e),
                        n = document.documentElement.clientWidth,
                        r = window.innerWidth;
                    return {
                        left: t[0],
                        top: t[1],
                        right: t[2],
                        gap: Math.max(0, r - n + t[2] - t[0])
                    }
                },
                iB = ik(),
                iR = "data-scroll-locked",
                iU = function(e, t, n, r) {
                    var a = e.left,
                        i = e.top,
                        o = e.right,
                        l = e.gap;
                    return void 0 === n && (n = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(r, ";\n   padding-right: ").concat(l, "px ").concat(r, ";\n  }\n  body[").concat(iR, "] {\n    overflow: hidden ").concat(r, ";\n    overscroll-behavior: contain;\n    ").concat([t && "position: relative ".concat(r, ";"), "margin" === n && "\n    padding-left: ".concat(a, "px;\n    padding-top: ").concat(i, "px;\n    padding-right: ").concat(o, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(l, "px ").concat(r, ";\n    "), "padding" === n && "padding-right: ".concat(l, "px ").concat(r, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(ig, " {\n    right: ").concat(l, "px ").concat(r, ";\n  }\n  \n  .").concat(ib, " {\n    margin-right: ").concat(l, "px ").concat(r, ";\n  }\n  \n  .").concat(ig, " .").concat(ig, " {\n    right: 0 ").concat(r, ";\n  }\n  \n  .").concat(ib, " .").concat(ib, " {\n    margin-right: 0 ").concat(r, ";\n  }\n  \n  body[").concat(iR, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(l, "px;\n  }\n")
                },
                iD = function() {
                    var e = parseInt(document.body.getAttribute(iR) || "0", 10);
                    return isFinite(e) ? e : 0
                },
                iM = function() {
                    ey.useEffect(function() {
                        return document.body.setAttribute(iR, (iD() + 1).toString()),
                            function() {
                                var e = iD() - 1;
                                e <= 0 ? document.body.removeAttribute(iR) : document.body.setAttribute(iR, e.toString())
                            }
                    }, [])
                },
                ij = function(e) {
                    var t = e.noRelative,
                        n = e.noImportant,
                        r = e.gapMode,
                        a = void 0 === r ? "margin" : r;
                    iM();
                    var i = ey.useMemo(function() {
                        return iL(a)
                    }, [a]);
                    return ey.createElement(iB, {
                        styles: iU(i, !t, a, n ? "" : "!important")
                    })
                },
                iF = !1;
            if ("u" > typeof window) try {
                var iH = Object.defineProperty({}, "passive", {
                    get: function() {
                        return iF = !0, !0
                    }
                });
                window.addEventListener("test", iH, iH), window.removeEventListener("test", iH, iH)
            } catch (e) {
                iF = !1
            }
            var iG = !!iF && {
                    passive: !1
                },
                iz = function(e, t) {
                    if (!(0, tf._)(e, Element)) return !1;
                    var n = window.getComputedStyle(e);
                    return "hidden" !== n[t] && (n.overflowY !== n.overflowX || "TEXTAREA" === e.tagName || "visible" !== n[t])
                },
                iV = function(e, t) {
                    var n = t.ownerDocument,
                        r = t;
                    do {
                        if ("u" > typeof ShadowRoot && (0, tf._)(r, ShadowRoot) && (r = r.host), iW(e, r)) {
                            var a = iq(e, r);
                            if (a[1] > a[2]) return !0
                        }
                        r = r.parentNode
                    } while (r && r !== n.body);
                    return !1
                },
                iW = function(e, t) {
                    return "v" === e ? iz(t, "overflowY") : iz(t, "overflowX")
                },
                iq = function(e, t) {
                    return "v" === e ? [t.scrollTop, t.scrollHeight, t.clientHeight] : [t.scrollLeft, t.scrollWidth, t.clientWidth]
                },
                iK = function(e, t, n, r, a) {
                    var i, o = (i = window.getComputedStyle(t).direction, "h" === e && "rtl" === i ? -1 : 1),
                        l = o * r,
                        u = n.target,
                        s = t.contains(u),
                        c = !1,
                        d = l > 0,
                        f = 0,
                        h = 0;
                    do {
                        if (!u) break;
                        var p = iq(e, u),
                            m = p[0],
                            v = p[1] - p[2] - o * m;
                        (m || v) && iW(e, u) && (f += v, h += m);
                        var y = u.parentNode;
                        u = y && y.nodeType === Node.DOCUMENT_FRAGMENT_NODE ? y.host : y
                    } while (!s && u !== document.body || s && (t.contains(u) || t === u));
                    return d && (a && 1 > Math.abs(f) || !a && l > f) ? c = !0 : !d && (a && 1 > Math.abs(h) || !a && -l > h) && (c = !0), c
                },
                iZ = function(e) {
                    return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
                },
                iY = function(e) {
                    return [e.deltaX, e.deltaY]
                },
                iJ = function(e) {
                    return e && "current" in e ? e.current : e
                },
                iX = 0,
                i$ = [],
                iQ = (S = function(e) {
                    var t = ey.useRef([]),
                        n = ey.useRef([0, 0]),
                        r = ey.useRef(),
                        a = ey.useState(iX++)[0],
                        i = ey.useState(ik)[0],
                        o = ey.useRef(e);
                    ey.useEffect(function() {
                        o.current = e
                    }, [e]), ey.useEffect(function() {
                        if (e.inert) {
                            document.body.classList.add("block-interactivity-".concat(a));
                            var t = (function(e, t, n) {
                                if (n || 2 == arguments.length)
                                    for (var r, a = 0, i = t.length; a < i; a++) !r && a in t || (r || (r = Array.prototype.slice.call(t, 0, a)), r[a] = t[a]);
                                return e.concat(r || Array.prototype.slice.call(t))
                            })([e.lockRef.current], (e.shards || []).map(iJ), !0).filter(Boolean);
                            return t.forEach(function(e) {
                                    return e.classList.add("allow-interactivity-".concat(a))
                                }),
                                function() {
                                    document.body.classList.remove("block-interactivity-".concat(a)), t.forEach(function(e) {
                                        return e.classList.remove("allow-interactivity-".concat(a))
                                    })
                                }
                        }
                    }, [e.inert, e.lockRef.current, e.shards]);
                    var l = ey.useCallback(function(e, t) {
                            if ("touches" in e && 2 === e.touches.length || "wheel" === e.type && e.ctrlKey) return !o.current.allowPinchZoom;
                            var a, i = iZ(e),
                                l = n.current,
                                u = "deltaX" in e ? e.deltaX : l[0] - i[0],
                                s = "deltaY" in e ? e.deltaY : l[1] - i[1],
                                c = e.target,
                                d = Math.abs(u) > Math.abs(s) ? "h" : "v";
                            if ("touches" in e && "h" === d && "range" === c.type) return !1;
                            var f = iV(d, c);
                            if (!f) return !0;
                            if (f ? a = d : (a = "v" === d ? "h" : "v", f = iV(d, c)), !f) return !1;
                            if (!r.current && "changedTouches" in e && (u || s) && (r.current = a), !a) return !0;
                            var h = r.current || a;
                            return iK(h, t, e, "h" === h ? u : s, !0)
                        }, []),
                        u = ey.useCallback(function(e) {
                            if (i$.length && i$[i$.length - 1] === i) {
                                var n = "deltaY" in e ? iY(e) : iZ(e),
                                    r = t.current.filter(function(t) {
                                        var r;
                                        return t.name === e.type && (t.target === e.target || e.target === t.shadowParent) && (r = t.delta, r[0] === n[0] && r[1] === n[1])
                                    })[0];
                                if (r && r.should) {
                                    e.cancelable && e.preventDefault();
                                    return
                                }
                                if (!r) {
                                    var a = (o.current.shards || []).map(iJ).filter(Boolean).filter(function(t) {
                                        return t.contains(e.target)
                                    });
                                    (a.length > 0 ? l(e, a[0]) : !o.current.noIsolation) && e.cancelable && e.preventDefault()
                                }
                            }
                        }, []),
                        s = ey.useCallback(function(e, n, r, a) {
                            var i = {
                                name: e,
                                delta: n,
                                target: r,
                                should: a,
                                shadowParent: function(e) {
                                    for (var t = null; null !== e;)(0, tf._)(e, ShadowRoot) && (t = e.host, e = e.host), e = e.parentNode;
                                    return t
                                }(r)
                            };
                            t.current.push(i), setTimeout(function() {
                                t.current = t.current.filter(function(e) {
                                    return e !== i
                                })
                            }, 1)
                        }, []),
                        c = ey.useCallback(function(e) {
                            n.current = iZ(e), r.current = void 0
                        }, []),
                        d = ey.useCallback(function(t) {
                            s(t.type, iY(t), t.target, l(t, e.lockRef.current))
                        }, []),
                        f = ey.useCallback(function(t) {
                            s(t.type, iZ(t), t.target, l(t, e.lockRef.current))
                        }, []);
                    ey.useEffect(function() {
                        return i$.push(i), e.setCallbacks({
                                onScrollCapture: d,
                                onWheelCapture: d,
                                onTouchMoveCapture: f
                            }), document.addEventListener("wheel", u, iG), document.addEventListener("touchmove", u, iG), document.addEventListener("touchstart", c, iG),
                            function() {
                                i$ = i$.filter(function(e) {
                                    return e !== i
                                }), document.removeEventListener("wheel", u, iG), document.removeEventListener("touchmove", u, iG), document.removeEventListener("touchstart", c, iG)
                            }
                    }, []);
                    var h = e.removeScrollBar,
                        p = e.inert;
                    return ey.createElement(ey.Fragment, null, p ? ey.createElement(i, {
                        styles: "\n  .block-interactivity-".concat(a, " {pointer-events: none;}\n  .allow-interactivity-").concat(a, " {pointer-events: all;}\n")
                    }) : null, h ? ey.createElement(ij, {
                        noRelative: e.noRelative,
                        gapMode: e.gapMode
                    }) : null)
                }, ix.useMedium(S), iA),
                i0 = ey.forwardRef(function(e, t) {
                    return ey.createElement(iI, iv({}, e, {
                        ref: t,
                        sideCar: iQ
                    }))
                });
            i0.classNames = iI.classNames;
            var i1 = new WeakMap,
                i2 = new WeakMap,
                i3 = {},
                i5 = 0,
                i4 = function(e) {
                    return e && (e.host || i4(e.parentNode))
                },
                i6 = function(e, t, n, r) {
                    var a = (Array.isArray(e) ? e : [e]).map(function(e) {
                        if (t.contains(e)) return e;
                        var n = i4(e);
                        return n && t.contains(n) ? n : (console.error("aria-hidden", e, "in not contained inside", t, ". Doing nothing"), null)
                    }).filter(function(e) {
                        return !!e
                    });
                    i3[n] || (i3[n] = new WeakMap);
                    var i = i3[n],
                        o = [],
                        l = new Set,
                        u = new Set(a),
                        s = function(e) {
                            !e || l.has(e) || (l.add(e), s(e.parentNode))
                        };
                    a.forEach(s);
                    var c = function(e) {
                        !e || u.has(e) || Array.prototype.forEach.call(e.children, function(e) {
                            if (l.has(e)) c(e);
                            else try {
                                var t = e.getAttribute(r),
                                    a = null !== t && "false" !== t,
                                    u = (i1.get(e) || 0) + 1,
                                    s = (i.get(e) || 0) + 1;
                                i1.set(e, u), i.set(e, s), o.push(e), 1 === u && a && i2.set(e, !0), 1 === s && e.setAttribute(n, "true"), a || e.setAttribute(r, "true")
                            } catch (t) {
                                console.error("aria-hidden: cannot operate on ", e, t)
                            }
                        })
                    };
                    return c(t), l.clear(), i5++,
                        function() {
                            o.forEach(function(e) {
                                var t = i1.get(e) - 1,
                                    a = i.get(e) - 1;
                                i1.set(e, t), i.set(e, a), t || (i2.has(e) || e.removeAttribute(r), i2.delete(e)), a || e.removeAttribute(n)
                            }), --i5 || (i1 = new WeakMap, i1 = new WeakMap, i2 = new WeakMap, i3 = {})
                        }
                },
                i8 = function(e, t, n) {
                    void 0 === n && (n = "data-aria-hidden");
                    var r = Array.from(Array.isArray(e) ? e : [e]),
                        a = t || ("u" < typeof document ? null : (Array.isArray(e) ? e[0] : e).ownerDocument.body);
                    return a ? (r.push.apply(r, Array.from(a.querySelectorAll("[aria-live], script"))), i6(r, a, n, "aria-hidden")) : function() {
                        return null
                    }
                },
                i7 = "Dialog",
                i9 = tn(function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        n = [],
                        r = function() {
                            var t = n.map(function(e) {
                                return ey.createContext(e)
                            });
                            return function(n) {
                                var r = (null == n ? void 0 : n[e]) || t;
                                return ey.useMemo(function() {
                                    return ew({}, "__scope".concat(e), eM(eE({}, n), ew({}, e, r)))
                                }, [n, r])
                            }
                        };
                    return r.scopeName = e, [function(t, r) {
                        var a = ey.createContext(r),
                            i = n.length;
                        n = tx(n).concat([r]);
                        var o = function(t) {
                            var n, r = t.scope,
                                o = t.children,
                                l = eX(t, ["scope", "children"]),
                                u = (null == r || null == (n = r[e]) ? void 0 : n[i]) || a,
                                s = ey.useMemo(function() {
                                    return l
                                }, Object.values(l));
                            return (0, nH.jsx)(u.Provider, {
                                value: s,
                                children: o
                            })
                        };
                        return o.displayName = t + "Provider", [o, function(n, o) {
                            var l, u = (null == o || null == (l = o[e]) ? void 0 : l[i]) || a,
                                s = ey.useContext(u);
                            if (s) return s;
                            if (void 0 !== r) return r;
                            throw Error("`".concat(n, "` must be used within `").concat(t, "`"))
                        }]
                    }, a6.apply(void 0, [r].concat(tx(t)))]
                }(i7), 2),
                oe = i9[0];
            i9[1];
            var ot = tn(oe(i7), 2),
                on = ot[0],
                or = ot[1],
                oa = function(e) {
                    var t, n, r, a, i, o, l, u, s, c, d, f, h, p, m, v, y, g = e.__scopeDialog,
                        b = e.children,
                        w = e.open,
                        E = e.defaultOpen,
                        P = e.onOpenChange,
                        x = e.modal,
                        S = ey.useRef(null),
                        I = ey.useRef(null),
                        A = tn((s = (u = {
                            prop: w,
                            defaultProp: E,
                            onChange: P
                        }).prop, h = (f = tn((n = (t = {
                            defaultProp: u.defaultProp,
                            onChange: d = void 0 === (c = u.onChange) ? function() {} : c
                        }).defaultProp, r = t.onChange, i = tn(a = ey.useState(n), 1)[0], o = ey.useRef(i), l = it(r), ey.useEffect(function() {
                            o.current !== i && (l(i), o.current = i)
                        }, [i, o, l]), a), 2))[0], p = f[1], v = (m = void 0 !== s) ? s : h, y = it(d), [v, ey.useCallback(function(e) {
                            if (m) {
                                var t = "function" == typeof e ? e(s) : e;
                                t !== s && y(t)
                            } else p(e)
                        }, [m, s, p, y])]), 2),
                        C = A[0],
                        T = A[1];
                    return (0, nH.jsx)(on, {
                        scope: g,
                        triggerRef: S,
                        contentRef: I,
                        contentId: ie(),
                        titleId: ie(),
                        descriptionId: ie(),
                        open: void 0 !== C && C,
                        onOpenChange: T,
                        onOpenToggle: ey.useCallback(function() {
                            return T(function(e) {
                                return !e
                            })
                        }, [T]),
                        modal: void 0 === x || x,
                        children: b
                    })
                };
            oa.displayName = i7;
            var oi = "DialogTrigger";
            ey.forwardRef(function(e, t) {
                var n = e.__scopeDialog,
                    r = eX(e, ["__scopeDialog"]),
                    a = or(oi, n),
                    i = n6(t, a.triggerRef);
                return (0, nH.jsx)(ic.button, eM(eE({
                    type: "button",
                    "aria-haspopup": "dialog",
                    "aria-expanded": a.open,
                    "aria-controls": a.contentId,
                    "data-state": oI(a.open)
                }, r), {
                    ref: i,
                    onClick: a4(e.onClick, a.onOpenToggle)
                }))
            }).displayName = oi;
            var oo = "DialogPortal",
                ol = tn(oe(oo, {
                    forceMount: void 0
                }), 2),
                ou = ol[0],
                os = ol[1],
                oc = function(e) {
                    var t = e.__scopeDialog,
                        n = e.forceMount,
                        r = e.children,
                        a = e.container,
                        i = or(oo, t);
                    return (0, nH.jsx)(ou, {
                        scope: t,
                        forceMount: n,
                        children: ey.Children.map(r, function(e) {
                            return (0, nH.jsx)(ih, {
                                present: n || i.open,
                                children: (0, nH.jsx)(id, {
                                    asChild: !0,
                                    container: a,
                                    children: e
                                })
                            })
                        })
                    })
                };
            oc.displayName = oo;
            var od = "DialogOverlay",
                of = ey.forwardRef(function(e, t) {
                    var n = os(od, e.__scopeDialog),
                        r = e.forceMount,
                        a = void 0 === r ? n.forceMount : r,
                        i = eX(e, ["forceMount"]),
                        o = or(od, e.__scopeDialog);
                    return o.modal ? (0, nH.jsx)(ih, {
                        present: a || o.open,
                        children: (0, nH.jsx)(op, eM(eE({}, i), {
                            ref: t
                        }))
                    }) : null
                });
            of.displayName = od;
            var oh = il("DialogOverlay.RemoveScroll"),
                op = ey.forwardRef(function(e, t) {
                    var n = e.__scopeDialog,
                        r = eX(e, ["__scopeDialog"]),
                        a = or(od, n);
                    return (0, nH.jsx)(i0, {
                        as: oh,
                        allowPinchZoom: !0,
                        shards: [a.contentRef],
                        children: (0, nH.jsx)(ic.div, eM(eE({
                            "data-state": oI(a.open)
                        }, r), {
                            ref: t,
                            style: eE({
                                pointerEvents: "auto"
                            }, r.style)
                        }))
                    })
                }),
                om = "DialogContent",
                ov = ey.forwardRef(function(e, t) {
                    var n = os(om, e.__scopeDialog),
                        r = e.forceMount,
                        a = void 0 === r ? n.forceMount : r,
                        i = eX(e, ["forceMount"]),
                        o = or(om, e.__scopeDialog);
                    return (0, nH.jsx)(ih, {
                        present: a || o.open,
                        children: o.modal ? (0, nH.jsx)(oy, eM(eE({}, i), {
                            ref: t
                        })) : (0, nH.jsx)(og, eM(eE({}, i), {
                            ref: t
                        }))
                    })
                });
            ov.displayName = om;
            var oy = ey.forwardRef(function(e, t) {
                    var n = or(om, e.__scopeDialog),
                        r = ey.useRef(null),
                        a = n6(t, n.contentRef, r);
                    return ey.useEffect(function() {
                        var e = r.current;
                        if (e) return i8(e)
                    }, []), (0, nH.jsx)(ob, eM(eE({}, e), {
                        ref: a,
                        trapFocus: n.open,
                        disableOutsidePointerEvents: !0,
                        onCloseAutoFocus: a4(e.onCloseAutoFocus, function(e) {
                            var t;
                            e.preventDefault(), null == (t = n.triggerRef.current) || t.focus()
                        }),
                        onPointerDownOutside: a4(e.onPointerDownOutside, function(e) {
                            var t = e.detail.originalEvent,
                                n = 0 === t.button && !0 === t.ctrlKey;
                            (2 === t.button || n) && e.preventDefault()
                        }),
                        onFocusOutside: a4(e.onFocusOutside, function(e) {
                            return e.preventDefault()
                        })
                    }))
                }),
                og = ey.forwardRef(function(e, t) {
                    var n = or(om, e.__scopeDialog),
                        r = ey.useRef(!1),
                        a = ey.useRef(!1);
                    return (0, nH.jsx)(ob, eM(eE({}, e), {
                        ref: t,
                        trapFocus: !1,
                        disableOutsidePointerEvents: !1,
                        onCloseAutoFocus: function(t) {
                            var i, o;
                            null == (i = e.onCloseAutoFocus) || i.call(e, t), t.defaultPrevented || (r.current || null == (o = n.triggerRef.current) || o.focus(), t.preventDefault()), r.current = !1, a.current = !1
                        },
                        onInteractOutside: function(t) {
                            null == (i = e.onInteractOutside) || i.call(e, t), t.defaultPrevented || (r.current = !0, "pointerdown" === t.detail.originalEvent.type && (a.current = !0));
                            var i, o, l = t.target;
                            (null == (o = n.triggerRef.current) ? void 0 : o.contains(l)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && a.current && t.preventDefault()
                        }
                    }))
                }),
                ob = ey.forwardRef(function(e, t) {
                    var n = e.__scopeDialog,
                        r = e.trapFocus,
                        a = e.onOpenAutoFocus,
                        i = e.onCloseAutoFocus,
                        o = eX(e, ["__scopeDialog", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus"]),
                        l = or(om, n),
                        u = ey.useRef(null),
                        s = n6(t, u);
                    return (0, im.useFocusGuards)(), (0, nH.jsxs)(nH.Fragment, {
                        children: [(0, nH.jsx)(ia.FocusScope, {
                            asChild: !0,
                            loop: !0,
                            trapped: r,
                            onMountAutoFocus: a,
                            onUnmountAutoFocus: i,
                            children: (0, nH.jsx)(ir.DismissableLayer, eM(eE({
                                role: "dialog",
                                id: l.contentId,
                                "aria-describedby": l.descriptionId,
                                "aria-labelledby": l.titleId,
                                "data-state": oI(l.open)
                            }, o), {
                                ref: s,
                                onDismiss: function() {
                                    return l.onOpenChange(!1)
                                }
                            }))
                        }), (0, nH.jsxs)(nH.Fragment, {
                            children: [(0, nH.jsx)(ok, {
                                titleId: l.titleId
                            }), (0, nH.jsx)(oO, {
                                contentRef: u,
                                descriptionId: l.descriptionId
                            })]
                        })]
                    })
                }),
                ow = "DialogTitle",
                oE = ey.forwardRef(function(e, t) {
                    var n = e.__scopeDialog,
                        r = eX(e, ["__scopeDialog"]),
                        a = or(ow, n);
                    return (0, nH.jsx)(ic.h2, eM(eE({
                        id: a.titleId
                    }, r), {
                        ref: t
                    }))
                });
            oE.displayName = ow;
            var oP = "DialogDescription";
            ey.forwardRef(function(e, t) {
                var n = e.__scopeDialog,
                    r = eX(e, ["__scopeDialog"]),
                    a = or(oP, n);
                return (0, nH.jsx)(ic.p, eM(eE({
                    id: a.descriptionId
                }, r), {
                    ref: t
                }))
            }).displayName = oP;
            var ox = "DialogClose",
                oS = ey.forwardRef(function(e, t) {
                    var n = e.__scopeDialog,
                        r = eX(e, ["__scopeDialog"]),
                        a = or(ox, n);
                    return (0, nH.jsx)(ic.button, eM(eE({
                        type: "button"
                    }, r), {
                        ref: t,
                        onClick: a4(e.onClick, function() {
                            return a.onOpenChange(!1)
                        })
                    }))
                });

            function oI(e) {
                return e ? "open" : "closed"
            }
            oS.displayName = ox;
            var oA = "DialogTitleWarning",
                oC = tn((I = {
                    contentName: om,
                    titleName: ow,
                    docsSlug: "dialog"
                }, A = ey.createContext(I), (C = function(e) {
                    var t = e.children,
                        n = eX(e, ["children"]),
                        r = ey.useMemo(function() {
                            return n
                        }, Object.values(n));
                    return (0, nH.jsx)(A.Provider, {
                        value: r,
                        children: t
                    })
                }).displayName = oA + "Provider", [C, function(e) {
                    var t = ey.useContext(A);
                    if (t) return t;
                    if (void 0 !== I) return I;
                    throw Error("`".concat(e, "` must be used within `").concat(oA, "`"))
                }]), 2),
                oT = (oC[0], oC[1]),
                ok = function(e) {
                    var t = e.titleId,
                        n = oT(oA),
                        r = "`".concat(n.contentName, "` requires a `").concat(n.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(n.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(n.docsSlug);
                    return ey.useEffect(function() {
                        t && (document.getElementById(t) || console.error(r))
                    }, [r, t]), null
                },
                oO = function(e) {
                    var t = e.contentRef,
                        n = e.descriptionId,
                        r = oT("DialogDescriptionWarning"),
                        a = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(r.contentName, "}.");
                    return ey.useEffect(function() {
                        var e, r = null == (e = t.current) ? void 0 : e.getAttribute("aria-describedby");
                        n && r && (document.getElementById(n) || console.warn(a))
                    }, [a, t, n]), null
                },
                o_ = Symbol("radix.slottable");

            function oN(e) {
                return ey.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === o_
            }
            var oL = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(e, t) {
                    var n, r, a, i, o, l = (n = a = "Primitive.".concat(t), (r = ey.forwardRef(function(e, t) {
                            var n = e.children,
                                r = eX(e, ["children"]);
                            if (ey.isValidElement(n)) {
                                var a, i, o, l, u, s = (u = (l = null == (i = Object.getOwnPropertyDescriptor((a = n).props, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? a.ref : (u = (l = null == (o = Object.getOwnPropertyDescriptor(a, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning) ? a.props.ref : a.props.ref || a.ref,
                                    c = function(e, t) {
                                        var n = eE({}, t);
                                        for (var r in t) ! function(r) {
                                            var a = e[r],
                                                i = t[r];
                                            /^on[A-Z]/.test(r) ? a && i ? n[r] = function() {
                                                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                                var r = i.apply(void 0, tx(t));
                                                return a.apply(void 0, tx(t)), r
                                            } : a && (n[r] = a) : "style" === r ? n[r] = eE({}, a, i) : "className" === r && (n[r] = [a, i].filter(Boolean).join(" "))
                                        }(r);
                                        return eE({}, e, n)
                                    }(r, n.props);
                                return n.type !== ey.Fragment && (c.ref = t ? n4(t, s) : s), ey.cloneElement(n, c)
                            }
                            return ey.Children.count(n) > 1 ? ey.Children.only(null) : null
                        })).displayName = "".concat(n, ".SlotClone"), i = r, (o = ey.forwardRef(function(e, t) {
                            var n = e.children,
                                r = eX(e, ["children"]),
                                a = ey.Children.toArray(n),
                                o = a.find(oN);
                            if (o) {
                                var l = o.props.children,
                                    u = a.map(function(e) {
                                        return e !== o ? e : ey.Children.count(l) > 1 ? ey.Children.only(null) : ey.isValidElement(l) ? l.props.children : null
                                    });
                                return (0, nH.jsx)(i, eM(eE({}, r), {
                                    ref: t,
                                    children: ey.isValidElement(l) ? ey.cloneElement(l, void 0, u) : null
                                }))
                            }
                            return (0, nH.jsx)(i, eM(eE({}, r), {
                                ref: t,
                                children: n
                            }))
                        })).displayName = "".concat(a, ".Slot"), o),
                        u = ey.forwardRef(function(e, n) {
                            var r = e.asChild,
                                a = eX(e, ["asChild"]),
                                i = r ? l : t;
                            return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, nH.jsx)(i, eM(eE({}, a), {
                                ref: n
                            }))
                        });
                    return u.displayName = "Primitive.".concat(t), eM(eE({}, e), ew({}, t, u))
                }, {}),
                oB = Object.freeze({
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
                oR = ey.forwardRef(function(e, t) {
                    return (0, nH.jsx)(oL.span, eM(eE({}, e), {
                        ref: t,
                        style: eE({}, oB, e.style)
                    }))
                });
            oR.displayName = "VisuallyHidden";
            var oU = (0, ey.createContext)({
                    size: "Medium",
                    isModal: !0,
                    hasCloseAffordance: !1,
                    hasMarginTop: !0,
                    hasMarginBottom: !0,
                    hasDescription: !1,
                    type: "Default"
                }),
                oD = function() {
                    var e = (0, ey.useContext)(oU);
                    if (!e) throw Error("Dialog components must be used within a Dialog");
                    return e
                },
                oM = {
                    Small: "padding-x-large",
                    Medium: "padding-x-xlarge",
                    Large: "padding-x-xlarge"
                },
                oj = {
                    Small: "padding-top-large",
                    Medium: "padding-top-xlarge",
                    Large: "padding-top-xlarge"
                },
                oF = {
                    Small: "padding-bottom-large",
                    Medium: "padding-bottom-xlarge",
                    Large: "padding-bottom-xlarge"
                },
                oH = function(e) {
                    var t = e.open,
                        n = e.onOpenChange,
                        r = e.children,
                        a = e.size,
                        i = e.type,
                        o = void 0 === i ? "Default" : i,
                        l = e.isModal,
                        u = e.hasCloseAffordance,
                        s = e.closeLabel,
                        c = e.hasMarginTop,
                        d = void 0 === c || c,
                        f = e.hasMarginBottom,
                        h = void 0 === f || f,
                        p = e.hasDescription,
                        m = void 0 !== p && p,
                        v = e.experimentalDisablePointerEventsStylingOnBody,
                        y = void 0 !== v && v,
                        g = (0, ey.useMemo)(function() {
                            return {
                                size: a,
                                isModal: l,
                                type: o,
                                hasCloseAffordance: u,
                                closeLabel: s,
                                hasMarginTop: d,
                                hasMarginBottom: h,
                                hasDescription: m
                            }
                        }, [a, l, o, u, s, d, h, m]);
                    return (0, ey.useEffect)(function() {
                        y && setTimeout(function() {
                            Object.assign(document.body.style, {
                                pointerEvents: "unset"
                            })
                        }, 0)
                    }, [y, t]), eg().createElement(oU.Provider, {
                        value: g
                    }, eg().createElement(oa, {
                        open: t,
                        onOpenChange: n
                    }, r))
                };
            oH.displayName = "Dialog";
            var oG = function(e) {
                var t = e.children,
                    n = e.className,
                    r = e.style,
                    a = e.overlayClassName,
                    i = e.overlayStyle,
                    o = e.onOpenAutoFocus,
                    l = eX(e, ["children", "className", "style", "overlayClassName", "overlayStyle", "onOpenAutoFocus"]),
                    u = oD(),
                    s = u.size,
                    c = u.isModal,
                    d = u.hasCloseAffordance,
                    f = u.closeLabel,
                    h = u.hasDescription,
                    p = n$("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", c && "bg-common-backdrop", a),
                    m = n$("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", n);
                return eg().createElement(oc, null, eg().createElement(of, {
                    className: p,
                    style: i
                }, eg().createElement(ov, eE({
                    className: m,
                    "data-size": s,
                    style: r,
                    onOpenAutoFocus: o
                }, !h && {
                    "aria-describedby": void 0
                }, l), d && eg().createElement("div", {
                    className: "absolute foundation-web-dialog-close-container"
                }, eg().createElement(oS, {
                    asChild: !0
                }, eg().createElement(a5, {
                    variant: "OverMedia",
                    size: s,
                    isCircular: !0,
                    "aria-label": f
                }))), t)))
            };
            oG.displayName = "DialogContent";
            var oz = function(e) {
                var t = e.children,
                    n = e.className,
                    r = eX(e, ["children", "className"]),
                    a = oD(),
                    i = a.size,
                    o = a.hasMarginTop,
                    l = a.hasMarginBottom,
                    u = n$(oM[i], o && oj[i], l && oF[i], n);
                return eg().createElement("div", eE({
                    className: u
                }, r), t)
            };
            oz.displayName = "DialogBody";
            var oV = function(e) {
                var t = e.children,
                    n = e.className,
                    r = e.hidden,
                    a = eX(e, ["children", "className", "hidden"]),
                    i = eg().createElement(oE, eE({
                        className: n
                    }, a), t);
                return r ? eg().createElement(oR, null, i) : i
            };
            oV.displayName = "DialogTitle";
            var oW = function(e) {
                var t = e.children,
                    n = e.className,
                    r = eX(e, ["children", "className"]),
                    a = oD().size,
                    i = n$(oM[a], oF[a], n);
                return eg().createElement("div", eE({
                    className: i
                }, r), t)
            }; /*! @license DOMPurify 3.4.17 | (c) Cure53 and other contributors | Released under the Apache license 2.0 and Mozilla Public License 2.0 | github.com/cure53/DOMPurify/blob/3.4.17/LICENSE */
            function oq(e, t) {
                this.v = e, this.k = t
            }

            function oK(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function oZ(e) {
                var t, n;

                function r(t, n) {
                    try {
                        var i = e[t](n),
                            o = i.value,
                            l = (0, tf._)(o, oq);
                        Promise.resolve(l ? o.v : o).then(function(n) {
                            if (l) {
                                var u = "return" === t && o.k ? t : "next";
                                if (!o.k || n.done) return r(u, n);
                                n = e[u](n).value
                            }
                            a(!!i.done, n)
                        }, function(e) {
                            r("throw", e)
                        })
                    } catch (e) {
                        a(2, e)
                    }
                }

                function a(e, a) {
                    2 === e ? t.reject(a) : t.resolve({
                        value: a,
                        done: e
                    }), (t = t.next) ? r(t.key, t.arg) : n = null
                }
                this._invoke = function(e, a) {
                    return new Promise(function(i, o) {
                        var l = {
                            key: e,
                            arg: a,
                            resolve: i,
                            reject: o,
                            next: null
                        };
                        n ? n = n.next = l : (t = n = l, r(e, a))
                    })
                }, "function" != typeof e.return && (this.return = void 0)
            }
            oW.displayName = "DialogFooter", oZ.prototype["function" == typeof Symbol && Symbol.asyncIterator || "@@asyncIterator"] = function() {
                return this
            }, oZ.prototype.next = function(e) {
                return this._invoke("next", e)
            }, oZ.prototype.throw = function(e) {
                return this._invoke("throw", e)
            }, oZ.prototype.return = function(e) {
                return this._invoke("return", e)
            };
            var oY = Object.entries,
                oJ = Object.setPrototypeOf,
                oX = Object.isFrozen,
                o$ = Object.getPrototypeOf,
                oQ = Object.getOwnPropertyDescriptor,
                o0 = Object.freeze,
                o1 = Object.seal,
                o2 = Object.create,
                o3 = "u" > typeof Reflect && Reflect,
                o5 = o3.apply,
                o4 = o3.construct;
            o0 || (o0 = function(e) {
                return e
            }), o1 || (o1 = function(e) {
                return e
            }), o5 || (o5 = function(e, t) {
                for (var n = arguments.length, r = Array(n > 2 ? n - 2 : 0), a = 2; a < n; a++) r[a - 2] = arguments[a];
                return e.apply(t, r)
            }), o4 || (o4 = function(e) {
                for (var t = arguments.length, n = Array(t > 1 ? t - 1 : 0), r = 1; r < t; r++) n[r - 1] = arguments[r];
                return tv(e, tx(n))
            });
            var o6 = lw(Array.prototype.forEach);
            Array.prototype.indexOf;
            var o8 = lw(Array.prototype.lastIndexOf),
                o7 = lw(Array.prototype.pop),
                o9 = lw(Array.prototype.push),
                le = lw(Array.prototype.slice),
                lt = lw(Array.prototype.splice),
                ln = Array.isArray,
                lr = lE(Set),
                la = lw(Set.prototype.add),
                li = lw(Set.prototype.has),
                lo = lw(String.prototype.toLowerCase),
                ll = lw(String.prototype.toString),
                lu = lw(String.prototype.match),
                ls = lw(String.prototype.replace),
                lc = lw(String.prototype.indexOf),
                ld = lw(String.prototype.trim),
                lf = lw(Number.prototype.toString),
                lh = lw(Boolean.prototype.toString),
                lp = "u" < typeof BigInt ? null : lw(BigInt.prototype.toString),
                lm = "u" < typeof Symbol ? null : lw(Symbol.prototype.toString),
                lv = lw(Object.prototype.hasOwnProperty),
                ly = lw(Object.prototype.toString),
                lg = lw(RegExp.prototype.test),
                lb = lE(TypeError);

            function lw(e) {
                return function(t) {
                    (0, tf._)(t, RegExp) && (t.lastIndex = 0);
                    for (var n = arguments.length, r = Array(n > 1 ? n - 1 : 0), a = 1; a < n; a++) r[a - 1] = arguments[a];
                    return o5(e, t, r)
                }
            }

            function lE(e) {
                return function() {
                    for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                    return o4(e, n)
                }
            }

            function lP(e, t) {
                var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : lo;
                if (oJ && oJ(e, null), !ln(t)) return e;
                for (var r = t.length; r--;) {
                    var a = t[r];
                    if ("string" == typeof a) {
                        var i = n(a);
                        i !== a && (oX(t) || (t[r] = i), a = i)
                    }
                    e[a] = !0
                }
                return e
            }

            function lx(e) {
                var t = o2(null),
                    n = !0,
                    r = !1,
                    a = void 0;
                try {
                    for (var i, o = oY(e)[Symbol.iterator](); !(n = (i = o.next()).done); n = !0) {
                        var l, u = (l = i.value, function(e) {
                                if (Array.isArray(e)) return e
                            }(l) || function(e) {
                                var t = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                if (null != t) {
                                    var n, r, a, i, o = [],
                                        l = !0,
                                        u = !1;
                                    try {
                                        a = (t = t.call(e)).next, !1;
                                        for (; !(l = (n = a.call(t)).done) && (o.push(n.value), 2 !== o.length); l = !0);
                                    } catch (e) {
                                        u = !0, r = e
                                    } finally {
                                        try {
                                            if (!l && null != t.return && (i = t.return(), Object(i) !== i)) return
                                        } finally {
                                            if (u) throw r
                                        }
                                    }
                                    return o
                                }
                            }(l) || function(e) {
                                if (e) {
                                    if ("string" == typeof e) return oK(e, 2);
                                    var t = ({}).toString.call(e).slice(8, -1);
                                    return "Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t ? Array.from(e) : "Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t) ? oK(e, 2) : void 0
                                }
                            }(l) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }()),
                            s = u[0],
                            c = u[1];
                        lv(e, s) && (ln(c) ? t[s] = function(e) {
                            for (var t = 0; t < e.length; t++) lv(e, t) || (e[t] = null);
                            return e
                        }(c) : c && (void 0 === c ? "undefined" : (0, tc._)(c)) === "object" && c.constructor === Object ? t[s] = lx(c) : t[s] = c)
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

            function lS(e, t) {
                for (; null !== e;) {
                    var n = oQ(e, t);
                    if (n) {
                        if (n.get) return lw(n.get);
                        if ("function" == typeof n.value) return lw(n.value)
                    }
                    e = o$(e)
                }
                return function() {
                    return null
                }
            }
            var lI = o0(["a", "abbr", "acronym", "address", "area", "article", "aside", "audio", "b", "bdi", "bdo", "big", "blink", "blockquote", "body", "br", "button", "canvas", "caption", "center", "cite", "code", "col", "colgroup", "content", "data", "datalist", "dd", "decorator", "del", "details", "dfn", "dialog", "dir", "div", "dl", "dt", "element", "em", "fieldset", "figcaption", "figure", "font", "footer", "form", "h1", "h2", "h3", "h4", "h5", "h6", "head", "header", "hgroup", "hr", "html", "i", "img", "input", "ins", "kbd", "label", "legend", "li", "main", "map", "mark", "marquee", "menu", "menuitem", "meter", "nav", "nobr", "ol", "optgroup", "option", "output", "p", "picture", "pre", "progress", "q", "rp", "rt", "ruby", "s", "samp", "search", "section", "select", "shadow", "slot", "small", "source", "spacer", "span", "strike", "strong", "style", "sub", "summary", "sup", "table", "tbody", "td", "template", "textarea", "tfoot", "th", "thead", "time", "tr", "track", "tt", "u", "ul", "var", "video", "wbr"]),
                lA = o0(["svg", "a", "altglyph", "altglyphdef", "altglyphitem", "animatecolor", "animatemotion", "animatetransform", "circle", "clippath", "defs", "desc", "ellipse", "enterkeyhint", "exportparts", "filter", "font", "g", "glyph", "glyphref", "hkern", "image", "inputmode", "line", "lineargradient", "marker", "mask", "metadata", "mpath", "part", "path", "pattern", "polygon", "polyline", "radialgradient", "rect", "stop", "style", "switch", "symbol", "text", "textpath", "title", "tref", "tspan", "view", "vkern"]),
                lC = o0(["feBlend", "feColorMatrix", "feComponentTransfer", "feComposite", "feConvolveMatrix", "feDiffuseLighting", "feDisplacementMap", "feDistantLight", "feDropShadow", "feFlood", "feFuncA", "feFuncB", "feFuncG", "feFuncR", "feGaussianBlur", "feImage", "feMerge", "feMergeNode", "feMorphology", "feOffset", "fePointLight", "feSpecularLighting", "feSpotLight", "feTile", "feTurbulence"]),
                lT = o0(["animate", "color-profile", "cursor", "discard", "font-face", "font-face-format", "font-face-name", "font-face-src", "font-face-uri", "foreignobject", "hatch", "hatchpath", "mesh", "meshgradient", "meshpatch", "meshrow", "missing-glyph", "script", "set", "solidcolor", "unknown", "use"]),
                lk = o0(["math", "menclose", "merror", "mfenced", "mfrac", "mglyph", "mi", "mlabeledtr", "mmultiscripts", "mn", "mo", "mover", "mpadded", "mphantom", "mroot", "mrow", "ms", "mspace", "msqrt", "mstyle", "msub", "msup", "msubsup", "mtable", "mtd", "mtext", "mtr", "munder", "munderover", "mprescripts"]),
                lO = o0(["maction", "maligngroup", "malignmark", "mlongdiv", "mscarries", "mscarry", "msgroup", "mstack", "msline", "msrow", "semantics", "annotation", "annotation-xml", "mprescripts", "none"]),
                l_ = o0(["#text"]),
                lN = o0(["accept", "action", "align", "alt", "autocapitalize", "autocomplete", "autopictureinpicture", "autoplay", "background", "bgcolor", "border", "capture", "cellpadding", "cellspacing", "checked", "cite", "class", "clear", "color", "cols", "colspan", "command", "commandfor", "controls", "controlslist", "coords", "crossorigin", "datetime", "decoding", "default", "dir", "disabled", "disablepictureinpicture", "disableremoteplayback", "download", "draggable", "enctype", "enterkeyhint", "exportparts", "face", "for", "headers", "height", "hidden", "high", "href", "hreflang", "id", "inert", "inputmode", "integrity", "ismap", "kind", "label", "lang", "list", "loading", "loop", "low", "max", "maxlength", "media", "method", "min", "minlength", "multiple", "muted", "name", "nonce", "noshade", "novalidate", "nowrap", "open", "optimum", "part", "pattern", "placeholder", "playsinline", "popover", "popovertarget", "popovertargetaction", "poster", "preload", "pubdate", "radiogroup", "readonly", "rel", "required", "rev", "reversed", "role", "rows", "rowspan", "spellcheck", "scope", "selected", "shape", "size", "sizes", "slot", "span", "srclang", "start", "src", "srcset", "step", "style", "summary", "tabindex", "title", "translate", "type", "usemap", "valign", "value", "width", "wrap", "xmlns"]),
                lL = o0(["accent-height", "accumulate", "additive", "alignment-baseline", "amplitude", "ascent", "attributename", "attributetype", "azimuth", "basefrequency", "baseline-shift", "begin", "bias", "by", "class", "clip", "clippathunits", "clip-path", "clip-rule", "color", "color-interpolation", "color-interpolation-filters", "color-profile", "color-rendering", "cx", "cy", "d", "dx", "dy", "diffuseconstant", "direction", "display", "divisor", "dominant-baseline", "dur", "edgemode", "elevation", "end", "exponent", "fill", "fill-opacity", "fill-rule", "filter", "filterunits", "flood-color", "flood-opacity", "font-family", "font-size", "font-size-adjust", "font-stretch", "font-style", "font-variant", "font-weight", "fx", "fy", "g1", "g2", "glyph-name", "glyphref", "gradientunits", "gradienttransform", "height", "href", "id", "image-rendering", "in", "in2", "intercept", "k", "k1", "k2", "k3", "k4", "kerning", "keypoints", "keysplines", "keytimes", "lang", "lengthadjust", "letter-spacing", "kernelmatrix", "kernelunitlength", "lighting-color", "local", "marker-end", "marker-mid", "marker-start", "markerheight", "markerunits", "markerwidth", "maskcontentunits", "maskunits", "max", "mask", "mask-type", "media", "method", "mode", "min", "name", "numoctaves", "offset", "operator", "opacity", "order", "orient", "orientation", "origin", "overflow", "paint-order", "path", "pathlength", "patterncontentunits", "patterntransform", "patternunits", "pointer-events", "points", "preservealpha", "preserveaspectratio", "primitiveunits", "r", "rx", "ry", "radius", "refx", "refy", "repeatcount", "repeatdur", "restart", "result", "rotate", "scale", "seed", "shape-rendering", "slope", "specularconstant", "specularexponent", "spreadmethod", "startoffset", "stddeviation", "stitchtiles", "stop-color", "stop-opacity", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke", "stroke-width", "style", "surfacescale", "systemlanguage", "tabindex", "tablevalues", "targetx", "targety", "transform", "transform-origin", "text-anchor", "text-decoration", "text-orientation", "text-rendering", "textlength", "type", "u1", "u2", "unicode", "values", "vector-effect", "viewbox", "visibility", "version", "vert-adv-y", "vert-origin-x", "vert-origin-y", "width", "word-spacing", "wrap", "writing-mode", "xchannelselector", "ychannelselector", "x", "x1", "x2", "xmlns", "y", "y1", "y2", "z", "zoomandpan"]),
                lB = o0(["accent", "accentunder", "align", "bevelled", "close", "columnalign", "columnlines", "columnspacing", "columnspan", "denomalign", "depth", "dir", "display", "displaystyle", "encoding", "fence", "frame", "height", "href", "id", "largeop", "length", "linethickness", "lquote", "lspace", "mathbackground", "mathcolor", "mathsize", "mathvariant", "maxsize", "minsize", "movablelimits", "notation", "numalign", "open", "rowalign", "rowlines", "rowspacing", "rowspan", "rspace", "rquote", "scriptlevel", "scriptminsize", "scriptsizemultiplier", "selection", "separator", "separators", "stretchy", "subscriptshift", "supscriptshift", "symmetric", "voffset", "width", "xmlns"]),
                lR = o0(["xlink:href", "xml:id", "xlink:title", "xml:space", "xmlns:xlink"]),
                lU = o1(/{{[\w\W]*|^[\w\W]*}}/g),
                lD = o1(/<%[\w\W]*|^[\w\W]*%>/g),
                lM = o1(/\${[\w\W]*/g),
                lj = o1(/^data-[\-\w.\u00B7-\uFFFF]+$/),
                lF = o1(/^aria-[\-\w]+$/),
                lH = o1(/^(?:(?:(?:f|ht)tps?|mailto|tel|callto|sms|cid|xmpp|matrix):|[^a-z]|[a-z+.\-]+(?:[^a-z+.\-:]|$))/i),
                lG = o1(/^(?:\w+script|data):/i),
                lz = o1(/[\u0000-\u0020\u00A0\u1680\u180E\u2000-\u2029\u205F\u3000]/g),
                lV = o1(/^html$/i),
                lW = o1(/^[a-z][.\w]*(-[.\w]+)+$/i),
                lq = o1(/<[/\w!]/g),
                lK = o1(/<[/\w]/g),
                lZ = o1(/<\/no(script|embed|frames)/i),
                lY = o1(/\/>/i),
                lJ = o0(lP({}, ["style", "script", "xmp", "iframe", "noembed", "noframes", "plaintext", "noscript"])),
                lX = function(e, t) {
                    if ((void 0 === e ? "undefined" : (0, tc._)(e)) !== "object" || "function" != typeof e.createPolicy) return null;
                    var n = null,
                        r = "data-tt-policy-suffix";
                    t && t.hasAttribute(r) && (n = t.getAttribute(r));
                    var a = "dompurify" + (n ? "#" + n : "");
                    try {
                        return e.createPolicy(a, {
                            createHTML: function(e) {
                                return e
                            },
                            createScriptURL: function(e) {
                                return e
                            }
                        })
                    } catch (e) {
                        return console.warn("TrustedTypes policy " + a + " could not be created."), null
                    }
                },
                l$ = function() {
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
                lQ = function(e, t, n, r) {
                    return lv(e, t) && ln(e[t]) ? lP(r.base ? lx(r.base) : {}, e[t], r.transform) : n
                },
                l0 = function(e, t, n) {
                    var r = lv(e, t) ? e[t] : void 0;
                    return r && (void 0 === r ? "undefined" : (0, tc._)(r)) === "object" ? lx(r) : n()
                },
                l1 = function e() {
                    var t, n, r = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "u" < typeof window ? null : window,
                        a = function(t) {
                            return e(t)
                        };
                    if (a.version = "3.4.17", a.removed = [], !r || !r.document || 9 !== r.document.nodeType || !r.Element) return a.isSupported = !1, a;
                    var i = r.document,
                        o = i,
                        l = o.currentScript;
                    r.DocumentFragment;
                    var u = r.HTMLTemplateElement,
                        s = r.Node,
                        c = r.Element,
                        d = r.NodeFilter;
                    void 0 === r.NamedNodeMap && (r.NamedNodeMap || r.MozNamedAttrMap), r.HTMLFormElement;
                    var f = r.DOMParser,
                        h = r.trustedTypes,
                        p = c.prototype,
                        m = lS(p, "cloneNode"),
                        v = lS(p, "remove"),
                        y = lS(p, "removeAttributeNode"),
                        g = lS(p, "nextSibling"),
                        b = lS(p, "childNodes"),
                        w = lS(p, "parentNode"),
                        E = lS(p, "shadowRoot"),
                        P = lS(p, "attributes"),
                        x = s && s.prototype ? lS(s.prototype, "nodeType") : null,
                        S = s && s.prototype ? lS(s.prototype, "nodeName") : null,
                        I = s && s.prototype ? lS(s.prototype, "ownerDocument") : null,
                        A = function(e) {
                            return x ? x(e) : e.nodeType
                        },
                        C = function(e) {
                            return S ? S(e) : e.nodeName
                        },
                        T = function(e, t) {
                            for (; null !== e;) {
                                var n = oQ(e, t);
                                if (n) return n.get ? lw(n.get) : null;
                                e = o$(e)
                            }
                            return null
                        }(p, "namespaceURI"),
                        k = function(e) {
                            return T ? T(e) : e.namespaceURI
                        };
                    if ("function" == typeof u) {
                        var O = i.createElement("template");
                        O.content && O.content.ownerDocument && (i = O.content.ownerDocument)
                    }
                    var _ = "",
                        N = !1,
                        L = 0,
                        B = function() {
                            if (L > 0) throw lb('A configured TRUSTED_TYPES_POLICY callback (createHTML or createScriptURL) must not call DOMPurify.sanitize, as that causes infinite recursion. Do not pass a policy whose callbacks wrap DOMPurify as TRUSTED_TYPES_POLICY; see the "DOMPurify and Trusted Types" section of the README.')
                        },
                        R = function(e) {
                            B(), L++;
                            try {
                                return t.createHTML(e)
                            } finally {
                                L--
                            }
                        },
                        U = function(e) {
                            B(), L++;
                            try {
                                return t.createScriptURL(e)
                            } finally {
                                L--
                            }
                        },
                        D = i,
                        M = D.implementation,
                        j = D.createNodeIterator,
                        F = D.createDocumentFragment,
                        H = D.getElementsByTagName,
                        G = o.importNode,
                        z = l$();
                    a.isSupported = "function" == typeof oY && "function" == typeof w && M && void 0 !== M.createHTMLDocument;
                    var V = lH,
                        W = null,
                        q = lP({}, tx(lI).concat(tx(lA), tx(lC), tx(lk), tx(l_))),
                        K = null,
                        Z = lP({}, tx(lN).concat(tx(lL), tx(lB), tx(lR))),
                        Y = Object.seal(o2(null, {
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
                        $ = Object.seal(o2(null, {
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
                        ea = !0,
                        ei = !1,
                        eo = !1,
                        el = null,
                        eu = null,
                        es = !1,
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
                        eE = lP({}, ["annotation-xml", "audio", "colgroup", "desc", "foreignobject", "head", "iframe", "math", "mi", "mn", "mo", "ms", "mtext", "noembed", "noframes", "noscript", "plaintext", "script", "selectedcontent", "style", "svg", "template", "thead", "title", "video", "xmp"]),
                        eP = null,
                        ex = lP({}, ["audio", "video", "img", "source", "image", "track"]),
                        eS = null,
                        eI = lP({}, ["alt", "class", "for", "id", "label", "name", "pattern", "placeholder", "role", "summary", "title", "value", "style", "xmlns"]),
                        eA = "http://www.w3.org/1998/Math/MathML",
                        eC = "http://www.w3.org/2000/svg",
                        eT = "http://www.w3.org/1999/xhtml",
                        ek = eT,
                        eO = !1,
                        e_ = null,
                        eN = lP({}, [eA, eC, eT], ll),
                        eL = o0(["mi", "mo", "mn", "ms", "mtext"]),
                        eB = lP({}, eL),
                        eR = o0(["annotation-xml"]),
                        eU = lP({}, eR),
                        eD = lP({}, ["title", "style", "font", "a", "script"]),
                        eM = null,
                        ej = ["application/xhtml+xml", "text/html"],
                        eF = null,
                        eH = null,
                        eG = i.createElement("form"),
                        ez = function(e) {
                            return (0, tf._)(e, RegExp) || (0, tf._)(e, Function)
                        },
                        eV = function() {
                            var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                            if (!eH || eH !== e) {
                                e && (void 0 === e ? "undefined" : (0, tc._)(e)) === "object" || (e = {}), e = lx(e), eF = "application/xhtml+xml" === (eM = -1 === ej.indexOf(e.PARSER_MEDIA_TYPE) ? "text/html" : e.PARSER_MEDIA_TYPE) ? ll : lo, W = lQ(e, "ALLOWED_TAGS", q, {
                                    transform: eF
                                }), K = lQ(e, "ALLOWED_ATTR", Z, {
                                    transform: eF
                                }), e_ = lQ(e, "ALLOWED_NAMESPACES", eN, {
                                    transform: ll
                                }), eS = lQ(e, "ADD_URI_SAFE_ATTR", eI, {
                                    transform: eF,
                                    base: eI
                                }), eP = lQ(e, "ADD_DATA_URI_TAGS", ex, {
                                    transform: eF,
                                    base: ex
                                }), ew = lQ(e, "FORBID_CONTENTS", eE, {
                                    transform: eF
                                }), J = lQ(e, "FORBID_TAGS", lx({}), {
                                    transform: eF
                                }), X = lQ(e, "FORBID_ATTR", lx({}), {
                                    transform: eF
                                }), eb = !!lv(e, "USE_PROFILES") && (e.USE_PROFILES && "object" === (0, tc._)(e.USE_PROFILES) ? lx(e.USE_PROFILES) : e.USE_PROFILES), Q = !1 !== e.ALLOW_ARIA_ATTR, ee = !1 !== e.ALLOW_DATA_ATTR, et = e.ALLOW_UNKNOWN_PROTOCOLS || !1, en = !1 !== e.ALLOW_SELF_CLOSE_IN_ATTR, er = e.SAFE_FOR_TEMPLATES || !1, ea = !1 !== e.SAFE_FOR_XML, ei = e.WHOLE_DOCUMENT || !1, ec = e.RETURN_DOM || !1, ed = e.RETURN_DOM_FRAGMENT || !1, ef = e.RETURN_TRUSTED_TYPE || !1, es = e.FORCE_BODY || !1, eh = !1 !== e.SANITIZE_DOM, ep = e.SANITIZE_NAMED_PROPS || !1, ev = !1 !== e.KEEP_CONTENT, ey = e.IN_PLACE || !1, V = ! function(e) {
                                    try {
                                        return lg(e, ""), !0
                                    } catch (e) {
                                        return !1
                                    }
                                }(e.ALLOWED_URI_REGEXP) ? lH : e.ALLOWED_URI_REGEXP, ek = "string" == typeof e.NAMESPACE ? e.NAMESPACE : eT, eB = l0(e, "MATHML_TEXT_INTEGRATION_POINTS", function() {
                                    return lP({}, eL)
                                }), eU = l0(e, "HTML_INTEGRATION_POINTS", function() {
                                    return lP({}, eR)
                                });
                                var r = l0(e, "CUSTOM_ELEMENT_HANDLING", function() {
                                    return o2(null)
                                });
                                if (Y = o2(null), lv(r, "tagNameCheck") && ez(r.tagNameCheck) && (Y.tagNameCheck = r.tagNameCheck), lv(r, "attributeNameCheck") && ez(r.attributeNameCheck) && (Y.attributeNameCheck = r.attributeNameCheck), lv(r, "allowCustomizedBuiltInElements") && "boolean" == typeof r.allowCustomizedBuiltInElements && (Y.allowCustomizedBuiltInElements = r.allowCustomizedBuiltInElements), o1(Y), er && (ee = !1), ed && (ec = !0), eb && (W = lP({}, l_), K = o2(null), !0 === eb.html && (lP(W, lI), lP(K, lN)), !0 === eb.svg && (lP(W, lA), lP(K, lL), lP(K, lR)), !0 === eb.svgFilters && (lP(W, lC), lP(K, lL), lP(K, lR)), !0 === eb.mathMl && (lP(W, lk), lP(K, lB), lP(K, lR))), $.tagCheck = null, $.attributeCheck = null, lv(e, "ADD_TAGS") && ("function" == typeof e.ADD_TAGS ? $.tagCheck = e.ADD_TAGS : ln(e.ADD_TAGS) && (W === q && (W = lx(W)), lP(W, e.ADD_TAGS, eF))), lv(e, "ADD_ATTR") && ("function" == typeof e.ADD_ATTR ? $.attributeCheck = e.ADD_ATTR : ln(e.ADD_ATTR) && (K === Z && (K = lx(K)), lP(K, e.ADD_ATTR, eF))), lv(e, "ADD_FORBID_CONTENTS") && ln(e.ADD_FORBID_CONTENTS) && (ew === eE && (ew = lx(ew)), lP(ew, e.ADD_FORBID_CONTENTS, eF)), ev && (W["#text"] = !0), ei && lP(W, ["html", "head", "body"]), W.table && (lP(W, ["tbody"]), delete J.tbody), e.TRUSTED_TYPES_POLICY) {
                                    if ("function" != typeof e.TRUSTED_TYPES_POLICY.createHTML) throw lb('TRUSTED_TYPES_POLICY configuration option must provide a "createHTML" hook.');
                                    if ("function" != typeof e.TRUSTED_TYPES_POLICY.createScriptURL) throw lb('TRUSTED_TYPES_POLICY configuration option must provide a "createScriptURL" hook.');
                                    var a = t;
                                    t = e.TRUSTED_TYPES_POLICY;
                                    try {
                                        _ = R("")
                                    } catch (e) {
                                        throw t = a, e
                                    }
                                } else null === e.TRUSTED_TYPES_POLICY ? (t = void 0, _ = "") : (void 0 === t && (N || (n = lX(h, l), N = !0), t = n), t && "string" == typeof _ && (_ = R("")));
                                o0 && o0(e), eH = e
                            }
                        },
                        eW = lP({}, tx(lA).concat(tx(lC), tx(lT))),
                        eq = lP({}, tx(lk).concat(tx(lO))),
                        eK = function(e) {
                            var t, n, r, a, i, o, l, u, s = k(e),
                                c = lo(C(e)),
                                d = w(e);
                            return d && 1 === A(d) ? (l = {
                                namespaceURI: k(d)
                            }, u = lo(C(d))) : (l = {
                                namespaceURI: ek
                            }, u = "template"), !!e_[s] && (s === eC ? (t = l, n = u, t.namespaceURI === eT ? "svg" === c : t.namespaceURI === eA ? "svg" === c && ("annotation-xml" === n || eB[n]) : !!eW[c]) : s === eA ? (r = l, a = u, r.namespaceURI === eT ? "math" === c : r.namespaceURI === eC ? "math" === c && eU[a] : !!eq[c]) : s === eT ? (i = l, o = u, (i.namespaceURI !== eC || !!eU[o]) && (i.namespaceURI !== eA || !!eB[o]) && !eq[c] && (eD[c] || !eW[c])) : "application/xhtml+xml" === eM && !!e_[s])
                        },
                        eZ = function(e) {
                            o9(a.removed, {
                                element: e
                            });
                            try {
                                w(e).removeChild(e)
                            } catch (t) {
                                if (v(e), !w(e)) throw lb("a node selected for removal could not be detached from its tree and cannot be safely returned; refusing to sanitize in place")
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
                            t && o6(le(t), function(e) {
                                try {
                                    v(e)
                                } catch (e) {}
                            });
                            var n = 1 === A(e) ? P(e) : null;
                            if (n)
                                for (var r = n.length - 1; r >= 0; --r) {
                                    var a = n[r],
                                        i = a && a.name;
                                    "string" == typeof i && eY(e, a, i)
                                }
                        },
                        eX = function(e, t, n) {
                            if (!n) try {
                                n = t.getAttributeNode(e)
                            } catch (e) {
                                n = null
                            }
                            o9(a.removed, {
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
                                        a = r && r.name;
                                    "string" != typeof a || K[eF(a)] || eY(e, r, a)
                                }
                        },
                        eQ = function(e, t) {
                            for (var n = arguments.length > 2 && void 0 !== arguments[2] && arguments[2], r = [e]; r.length > 0;) {
                                var a = r.pop();
                                if (!1 !== t(a)) {
                                    if (n && 1 === A(a)) {
                                        var i = E(a);
                                        ti(i) && r.push(i)
                                    }
                                    var o = b(a);
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
                            var n = lr();
                            o6(e1(e), function(e) {
                                1 === A(e) && la(n, e)
                            }), o6(t, function(e) {
                                1 !== A(e) || li(n, e) || e$(e)
                            })
                        },
                        e3 = function(e, t) {
                            var n = !1;
                            return o6(a.removed, function(t) {
                                t.element && (n = n || t.element === e, e0(t.element))
                            }), e2(e, t), n
                        },
                        e5 = function(e, t) {
                            for (var n = eg, r = null, a = function() {
                                    return r || (r = lr(), o6(t, function(e) {
                                        la(r, e)
                                    })), r
                                }, i = 0;; i++) {
                                var o = function(t) {
                                    var r = e1(e),
                                        i = [e],
                                        o = !1;
                                    if (o6(r, function(e) {
                                            11 === A(e) ? o9(i, e) : o || li(n, e) || (o = li(a(), e))
                                        }), !o) return {
                                        v: void 0
                                    };
                                    if (t >= 8) throw lb("the tree kept changing during in-place sanitization; refusing to return it");
                                    o6(i, function(t, n) {
                                        e4(t, n > 0, e, a())
                                    })
                                }(i);
                                if ("object" === (0, tc._)(o)) return o.v
                            }
                        },
                        e4 = function(e, t, n, r) {
                            for (var a, i = te(e); a = i.nextNode();) !(!li(r, a) || li(eg, a)) && (t && tl(z.uponSanitizeShadowNode, a, null), tp(a, n), tE(a, n), ti(a.content) && tP(a.content))
                        },
                        e6 = function(e) {
                            eg && la(eg, e)
                        },
                        e8 = function(e, t) {
                            return !!ea && ("patchsrc" === e || "for" === e && "label" !== t && "output" !== t)
                        },
                        e7 = function(e) {
                            ea && eQ(e, function(e) {
                                var t = A(e);
                                if (7 === t || 8 === t && lg(lK, e.data)) {
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
                            if (es) e = "<remove></remove>" + e;
                            else {
                                var a = lu(e, /^[\r\n\t ]+/);
                                r = a && a[0]
                            }
                            "application/xhtml+xml" === eM && ek === eT && (e = '<html xmlns="http://www.w3.org/1999/xhtml"><head></head><body>' + e + "</body></html>");
                            var o = t ? R(e) : e;
                            if (ek === eT) try {
                                n = new f().parseFromString(o, eM)
                            } catch (e) {}
                            if (!n || !n.documentElement) {
                                n = M.createDocument(ek, "template", null);
                                try {
                                    n.documentElement.innerHTML = eO ? _ : o
                                } catch (e) {}
                            }
                            var l = n.body || n.documentElement;
                            return (e && r && l.insertBefore(i.createTextNode(r), l.childNodes[0] || null), ek === eT) ? H.call(n, ei ? "html" : "body")[0] : ei ? n.documentElement : l
                        },
                        te = function(e) {
                            var t = I ? I(e) : e.ownerDocument;
                            return j.call(t || e, e, d.SHOW_ELEMENT | d.SHOW_COMMENT | d.SHOW_TEXT | d.SHOW_PROCESSING_INSTRUCTION | d.SHOW_CDATA_SECTION, null)
                        },
                        tt = function(e) {
                            return e = ls(e, lU, " "), e = ls(e, lD, " "), e = ls(e, lM, " ")
                        },
                        tn = function(e) {
                            tr(e);
                            var t, n = null == (t = e.querySelectorAll) ? void 0 : t.call(e, "template");
                            n && o6(n, function(e) {
                                ti(e.content) && tn(e.content)
                            })
                        },
                        tr = function(e) {
                            e.normalize();
                            for (var t = I ? I(e) : e.ownerDocument, n = j.call(t || e, e, d.SHOW_TEXT | d.SHOW_COMMENT | d.SHOW_CDATA_SECTION | d.SHOW_PROCESSING_INSTRUCTION, null), r = n.nextNode(); r;) r.data = tt(r.data), r = n.nextNode()
                        },
                        ta = function(e) {
                            var t = S ? S(e) : null;
                            return "string" == typeof t && "form" === eF(t) && ("string" != typeof e.nodeName || "string" != typeof e.textContent || "function" != typeof e.removeChild || e.attributes !== P(e) || "function" != typeof e.removeAttribute || "function" != typeof e.removeAttributeNode || "function" != typeof e.getAttributeNode || "function" != typeof e.setAttribute || "string" != typeof e.namespaceURI || "function" != typeof e.insertBefore || "function" != typeof e.hasChildNodes || e.nodeType !== x(e) || e.childNodes !== b(e))
                        },
                        ti = function(e) {
                            if (!x || (void 0 === e ? "undefined" : (0, tc._)(e)) !== "object" || null === e) return !1;
                            try {
                                return 11 === x(e)
                            } catch (e) {
                                return !1
                            }
                        },
                        to = function(e) {
                            if (!x || (void 0 === e ? "undefined" : (0, tc._)(e)) !== "object" || null === e) return !1;
                            try {
                                return "number" == typeof x(e)
                            } catch (e) {
                                return !1
                            }
                        };

                    function tl(e, t, n) {
                        0 !== e.length && o6(e, function(e) {
                            e.call(a, t, n, eH)
                        })
                    }
                    var tu = function(e, t) {
                            if ((0, tf._)(e, RegExp)) return lg(e, t);
                            if ((0, tf._)(e, Function)) {
                                for (var n = arguments.length, r = Array(n > 2 ? n - 2 : 0), a = 2; a < n; a++) r[a - 2] = arguments[a];
                                return !!e.apply(void 0, [t].concat(tx(r)))
                            }
                            return !1
                        },
                        ts = function(e, t, n) {
                            if (!J[t] && ty(t) && tu(Y.tagNameCheck, t)) return !1;
                            if (ev && !ew[t] && !ew[lo(t)]) {
                                var r = w(e),
                                    a = b(e);
                                if (a && r)
                                    for (var i = a.length, o = i - 1; o >= 0; --o) {
                                        var l = e === n ? m(a[o], !0) : a[o];
                                        r.insertBefore(l, g(e))
                                    }
                            }
                            return eZ(e), !0
                        },
                        td = function(e, t, n, r) {
                            return 0 === e.length ? t : t === n || t === r ? lx(t) : t
                        },
                        th = function(e, t) {
                            return e !== t && null === w(e) && (ey && e0(e), !0)
                        },
                        tp = function(e, t) {
                            if (e6(e), tl(z.beforeSanitizeElements, e, null), th(e, t)) return !0;
                            if (ta(e)) return eZ(e), !0;
                            var n = eF(C(e));
                            if (W = td(z.uponSanitizeElement, W, q, el), tl(z.uponSanitizeElement, e, {
                                    tagName: n,
                                    allowedTags: W
                                }), th(e, t)) return !0;
                            if (ea && e.hasChildNodes() && !to(e.firstElementChild) && lg(lq, e.textContent) && lg(lq, e.innerHTML) || ea && lJ[n] && 1 === A(e) && k(e) === eT && (to(e.firstElementChild) || "string" == typeof e.textContent && lg(lq, e.textContent)) || 7 === e.nodeType || ea && 8 === e.nodeType && lg(lK, e.data)) return eZ(e), !0;
                            if (J[n] || !((0, tf._)($.tagCheck, Function) && $.tagCheck(n)) && !W[n]) {
                                var r = ts(e, n, t);
                                return !!(!1 === r && (tl(z.afterSanitizeElements, e, null), th(e, t))) || r
                            }
                            if (1 === A(e) && !eK(e) || ("noscript" === n || "noembed" === n || "noframes" === n) && lg(lZ, e.innerHTML)) return eZ(e), !0;
                            if (er && 3 === e.nodeType) {
                                var i = tt(e.textContent);
                                e.textContent !== i && (o9(a.removed, {
                                    element: e.cloneNode()
                                }), e.textContent = i)
                            }
                            return tl(z.afterSanitizeElements, e, null), th(e, t)
                        },
                        tm = function(e, t, n) {
                            if (X[t] || e8(t, e) || eh && ("id" === t || "name" === t) && (n in i || n in eG)) return !1;
                            var r = K[t] || (0, tf._)($.attributeCheck, Function) && $.attributeCheck(t, e);
                            return !!(ee && lg(lj, t) || Q && lg(lF, t)) || (r ? !(!(eS[t] || lg(V, ls(n, lz, ""))) && ("src" !== t && "xlink:href" !== t && "href" !== t || "script" === e || 0 !== lc(n, "data:") || !eP[e]) && (!et || lg(lG, ls(n, lz, "")))) || !n : ty(e) && tu(Y.tagNameCheck, e) && tu(Y.attributeNameCheck, t, e) || "is" === t && Y.allowCustomizedBuiltInElements && tu(Y.tagNameCheck, n))
                        },
                        tv = lP({}, ["annotation-xml", "color-profile", "font-face", "font-face-format", "font-face-name", "font-face-src", "font-face-uri", "missing-glyph"]),
                        ty = function(e) {
                            return !tv[lo(e)] && lg(lW, e)
                        },
                        tg = function(e, n, r, a) {
                            if (t && (void 0 === h ? "undefined" : (0, tc._)(h)) === "object" && "function" == typeof h.getAttributeType && !r) switch (h.getAttributeType(e, n)) {
                                case "TrustedHTML":
                                    return R(a);
                                case "TrustedScriptURL":
                                    return U(a)
                            }
                            return a
                        },
                        tb = function(e, t, n, r) {
                            try {
                                if (n ? e.setAttributeNS(n, t, r) : e.setAttribute(t, r), ta(e)) return eZ(e), !1;
                                return !0
                            } catch (n) {
                                return eX(t, e), !1
                            }
                        },
                        tw = function(e, t) {
                            return !!(ea && lg(/((--!?|])>)|<\/(style|script|title|xmp|textarea|noscript|iframe|noembed|noframes)/i, t)) || "attributename" === lo(e) && null !== lu(t, "href")
                        },
                        tE = function(e, t) {
                            if (tl(z.beforeSanitizeAttributes, e, null), !th(e, t)) {
                                var n = e.attributes;
                                if (!(!n || ta(e))) {
                                    for (var r = {
                                            attrName: "",
                                            attrValue: "",
                                            keepAttr: !0,
                                            allowedAttributes: K = td(z.uponSanitizeAttribute, K, Z, eu),
                                            forceKeepAttr: void 0
                                        }, i = n.length, o = eF(e.nodeName); i--;) {
                                        var l = n[i],
                                            u = l.name,
                                            s = l.namespaceURI,
                                            c = l.value,
                                            d = eF(u),
                                            f = "value" === u ? c : ld(c),
                                            h = !1;
                                        if (r.attrName = d, r.attrValue = f, r.keepAttr = !0, r.forceKeepAttr = void 0, tl(z.uponSanitizeAttribute, e, r), f = r.attrValue, ep && ("id" === d || "name" === d) && 0 !== lc(f, em) && (eX(u, e, l), f = em + f, h = !0), tw(u, f)) {
                                            eX(u, e, l);
                                            continue
                                        }
                                        if (!r.forceKeepAttr) {
                                            if (!r.keepAttr || !en && lg(lY, f) || (er && (f = tt(f)), !tm(o, d, f))) {
                                                eX(u, e, l);
                                                continue
                                            }(f = tg(o, d, s, f)) !== c && tb(e, u, s, f) && h && o7(a.removed)
                                        }
                                    }
                                    tl(z.afterSanitizeAttributes, e, null), th(e, t)
                                }
                            }
                        },
                        tP = function(e) {
                            var t = null,
                                n = te(e);
                            for (tl(z.beforeSanitizeShadowDOM, e, null); t = n.nextNode();)
                                if (tl(z.uponSanitizeShadowNode, t, null), tp(t, e), tE(t, e), ti(t.content) && tP(t.content), 1 === A(t)) {
                                    var r = E(t);
                                    ti(r) && (tS(r), tP(r))
                                } er && tr(e), tl(z.afterSanitizeShadowDOM, e, null)
                        },
                        tS = function(e) {
                            for (var t = [{
                                    node: e,
                                    shadow: null
                                }]; t.length > 0;) {
                                var n = t.pop();
                                if (n.shadow) {
                                    tP(n.shadow);
                                    continue
                                }
                                var r = n.node,
                                    a = 1 === A(r),
                                    i = b(r);
                                if (i)
                                    for (var o = i.length - 1; o >= 0; --o) t.push({
                                        node: i[o],
                                        shadow: null
                                    });
                                if (a) {
                                    var l = S ? S(r) : null;
                                    if ("string" == typeof l && "template" === eF(l)) {
                                        var u = r.content;
                                        ti(u) && t.push({
                                            node: u,
                                            shadow: null
                                        })
                                    }
                                }
                                if (a) {
                                    var s = E(r);
                                    ti(s) && t.push({
                                        node: null,
                                        shadow: s
                                    }, {
                                        node: s,
                                        shadow: null
                                    })
                                }
                            }
                        };
                    return a.sanitize = function(e) {
                        var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                            r = null,
                            i = null,
                            l = null,
                            u = null;
                        if ((eO = !e) && (e = "\x3c!--\x3e"), "string" != typeof e && !to(e) && "string" != typeof(e = function(e) {
                                switch (void 0 === e ? "undefined" : (0, tc._)(e)) {
                                    case "string":
                                        return e;
                                    case "number":
                                        return lf(e);
                                    case "boolean":
                                        return lh(e);
                                    case "bigint":
                                        return lp ? lp(e) : "0";
                                    case "symbol":
                                        return lm ? lm(e) : "Symbol()";
                                    case "undefined":
                                    default:
                                        return ly(e);
                                    case "function":
                                    case "object":
                                        if (null === e) return ly(e);
                                        var t = lS(e, "toString");
                                        if ("function" == typeof t) {
                                            var n = t(e);
                                            return "string" == typeof n ? n : ly(n)
                                        }
                                        return ly(e)
                                }
                            }(e))) throw lb("dirty is not a string, aborting");
                        if (!a.isSupported) return e;
                        eo ? (W = el, K = eu) : eV(n), (z.uponSanitizeElement.length > 0 || z.uponSanitizeAttribute.length > 0) && (W = lx(W)), z.uponSanitizeAttribute.length > 0 && (K = lx(K)), a.removed = [];
                        var s = ey && "string" != typeof e && to(e),
                            c = [],
                            d = eg;
                        if (s) {
                            e7(e);
                            var f = C(e);
                            if ("string" == typeof f) {
                                var h = eF(f);
                                if (!W[h] || J[h]) throw eJ(e), lb("root node is forbidden and cannot be sanitized in-place")
                            }
                            if (ta(e)) throw eJ(e), lb("root node is clobbered and cannot be sanitized in-place");
                            c = e1(e), eg = lr()
                        } else if (to(e)) 1 === (i = (r = e9("\x3c!----\x3e")).ownerDocument.importNode(e, !0)).nodeType && "BODY" === i.nodeName || "HTML" === i.nodeName ? r = i : r.appendChild(i), tS(r);
                        else {
                            if (!ec && !er && !ei && -1 === e.indexOf("<")) return t && ef ? R(e) : e;
                            if (!(r = e9(e))) return ec ? null : ef ? _ : ""
                        }
                        r && es && eZ(r.firstChild);
                        var p = s ? e : r;
                        try {
                            s && tS(e);
                            for (var m = te(p); l = m.nextNode();) tp(l, p), tE(l, p), ti(l.content) && tP(l.content);
                            s && e5(e, c)
                        } catch (t) {
                            throw s && (eJ(e), e3(e, c)), t
                        } finally {
                            eg = d
                        }
                        if (s) {
                            if (e3(e, c)) throw lb("a node selected for removal could not be safely returned; refusing to sanitize in place");
                            return er && tn(e), e
                        }
                        if (ec) {
                            if (er && tn(r), ed)
                                for (u = F.call(r.ownerDocument); r.firstChild;) u.appendChild(r.firstChild);
                            else u = r;
                            return (K.shadowroot || K.shadowrootmode) && (u = G.call(o, u, !0)), u
                        }
                        var v = ei ? r.outerHTML : r.innerHTML;
                        return ei && W["!doctype"] && r.ownerDocument && r.ownerDocument.doctype && r.ownerDocument.doctype.name && lg(lV, r.ownerDocument.doctype.name) && (v = "<!DOCTYPE " + r.ownerDocument.doctype.name + ">\n" + v), er && (v = tt(v)), t && ef ? R(v) : v
                    }, a.setConfig = function() {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                        eV(e), eo = !0, el = W, eu = K
                    }, a.clearConfig = function() {
                        eH = null, eo = !1, el = null, eu = null, t = n, _ = ""
                    }, a.isValidAttribute = function(e, t, n) {
                        eH || eV({});
                        var r = eF(e),
                            a = eF(t);
                        return !("string" == typeof n && (tw(t, n) || !en && lg(lY, n))) && tm(r, a, n)
                    }, a.addHook = function(e, t) {
                        "function" != typeof t || lv(z, e) && o9(z[e], t)
                    }, a.removeHook = function(e, t) {
                        if (lv(z, e)) {
                            if (void 0 !== t) {
                                var n = o8(z[e], t);
                                return -1 === n ? void 0 : lt(z[e], n, 1)[0]
                            }
                            return o7(z[e])
                        }
                    }, a.removeHooks = function(e) {
                        lv(z, e) && (z[e] = [])
                    }, a.removeAllHooks = function() {
                        z = l$()
                    }, a
                }(),
                l2 = l1.sanitize.bind(l1),
                l3 = l1.isSupported;
            l1.addHook.bind(l1), l1.removeHook.bind(l1), l1.removeHooks.bind(l1), l1.removeAllHooks.bind(l1), l1.setConfig.bind(l1), l1.clearConfig.bind(l1), l1.isValidAttribute.bind(l1), l1.version, l1.removed;
            var l5 = {
                    ADD_ATTR: ["target"]
                },
                l4 = eM(eE({}, l5), {
                    RETURN_DOM_FRAGMENT: !0
                }),
                l6 = function(e) {
                    e.setAttribute("target", "_blank"), e.setAttribute("rel", "noopener noreferrer")
                },
                l8 = function(e, t) {
                    if (!t || !l3) return l2(e, l5);
                    var n = l2(e, l4);
                    if ("string" == typeof n) return n;
                    n.querySelectorAll("a").forEach(l6);
                    var r = n.ownerDocument.createElement("div");
                    return r.appendChild(n), r.innerHTML
                },
                l7 = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                        n = t.shouldOpenLinksInNewTab;
                    return (0, ey.useMemo)(function() {
                        return l8(e, null != n && n)
                    }, [e, n])
                },
                l9 = function(e) {
                    var t = e.titleText,
                        n = e.bodyText,
                        r = e.primaryButtonText,
                        a = e.secondaryButtonText,
                        i = e.closeLabelText,
                        o = e.onPrimaryButtonClick,
                        l = e.onSecondaryButtonClick,
                        u = e.isModalOpen,
                        s = e.onCloseModal,
                        c = e.hasCloseAffordance,
                        d = e.orientButtonsVertically,
                        f = void 0 !== d && d,
                        h = l7(n, {
                            shouldOpenLinksInNewTab: !0
                        }),
                        p = r && o ? (0, nH.jsx)(rl, {
                            variant: "Emphasis",
                            size: "Medium",
                            onClick: o,
                            className: "grow basis-0",
                            children: r
                        }) : null,
                        m = a && l ? (0, nH.jsx)(rl, {
                            variant: "Standard",
                            size: "Medium",
                            onClick: l,
                            className: "grow basis-0",
                            children: a
                        }) : null;
                    return (0, nH.jsx)(oH, {
                        open: u,
                        onOpenChange: function(e) {
                            e || s()
                        },
                        size: "Medium",
                        isModal: !0,
                        hasCloseAffordance: void 0 === c || c,
                        closeLabel: i,
                        children: (0, nH.jsxs)(oG, {
                            children: [(0, nH.jsxs)(oz, {
                                className: "flex flex-col gap-large",
                                children: [(0, nH.jsx)(oV, {
                                    children: t
                                }), (0, nH.jsx)("span", {
                                    className: "[&_a]:[font-weight:700] [&_a]:underline",
                                    dangerouslySetInnerHTML: {
                                        __html: h
                                    }
                                })]
                            }), (0, nH.jsx)(oW, {
                                className: f ? "flex flex-col gap-small" : "flex gap-x-medium",
                                children: f ? (0, nH.jsxs)(ey.Fragment, {
                                    children: [p, m]
                                }) : (0, nH.jsxs)(ey.Fragment, {
                                    children: [m, p]
                                })
                            })]
                        })
                    })
                },
                ue = function(e) {
                    var t = e.isModalOpen,
                        n = e.navigateToAccountSettings,
                        r = e.closeModal,
                        a = e.translate;
                    return (0, nH.jsx)(l9, {
                        titleText: a("UpdateMaturitySettingModal.Label.Title"),
                        bodyText: a("UpdateMaturitySettingModal.Label.Body"),
                        primaryButtonText: a("UpdateMaturitySettingModal.Action.GoToSettings"),
                        secondaryButtonText: a("UpdateMaturitySettingModal.Action.Cancel"),
                        closeLabelText: a("Action.Close"),
                        onPrimaryButtonClick: n,
                        onSecondaryButtonClick: r,
                        isModalOpen: t,
                        onCloseModal: r
                    })
                },
                ut = function(e) {
                    var t = e.isModalOpen,
                        n = e.closeModal,
                        r = e.translate;
                    return (0, nH.jsx)(l9, {
                        titleText: r("RestrictedUnplayableModal.Label.Title"),
                        bodyText: r("RestrictedUnplayableModal.Label.Body"),
                        secondaryButtonText: r("RestrictedUnplayableModal.Action.Ok"),
                        closeLabelText: r("Action.Close"),
                        onSecondaryButtonClick: n,
                        isModalOpen: t,
                        onCloseModal: n
                    })
                },
                un = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                        n = !!e && !t,
                        r = (0, eb.useQuery)({
                            queryKey: ["ageRecommendation", e],
                            queryFn: function() {
                                return eU(e)
                            },
                            enabled: n
                        }),
                        a = r.data,
                        i = r.isError,
                        o = r.isLoading;
                    return {
                        ageRecommendationData: a,
                        hasError: i,
                        isLoading: n && o
                    }
                },
                ur = function(e) {
                    var t, n, r = tn((0, ey.useState)(void 0), 2),
                        a = r[0],
                        i = r[1],
                        o = tn((0, ey.useState)(!1), 2),
                        l = o[0],
                        u = o[1],
                        s = tn((0, ey.useState)(!1), 2),
                        c = s[0],
                        d = s[1];
                    (0, ey.useEffect)(function() {
                        d(!1), u(!0), eR().then(function(e) {
                            i(e.contentAgeRestriction)
                        }).catch(function() {
                            d(!0)
                        }).finally(function() {
                            u(!1)
                        })
                    }, []);
                    var f = un(e),
                        h = f.ageRecommendationData,
                        p = f.hasError,
                        m = f.isLoading;
                    return {
                        contentAgeRestriction: a,
                        contentMaturityRating: null == h || null == (n = h.ageRecommendationDetails) || null == (t = n.summary.ageRecommendation) ? void 0 : t.contentMaturity,
                        isFetching: l || m,
                        hasError: c || p
                    }
                },
                ua = function(e, t, n, r, a, i, o, l) {
                    var u = (0, eb.useQuery)({
                            queryKey: ["guacPlayButtonUI"],
                            queryFn: function() {
                                return eB()
                            },
                            staleTime: 6e4
                        }).data,
                        s = tn((0, ey.useState)(!1), 2),
                        c = s[0],
                        d = s[1],
                        f = tn((0, ey.useState)(!1), 2),
                        h = f[0],
                        p = f[1],
                        m = (0, ey.useCallback)(function() {
                            nk(e, r, a, i, o, void 0, l)
                        }, [o, i, e, a, r, l]),
                        v = (0, ey.useCallback)(function(e, r, a) {
                            return em(function() {
                                var i, o, l, s, c, f;
                                return ev(this, function(h) {
                                    switch (h.label) {
                                        case 0:
                                            if (i = function(e) {
                                                    nR(t, e, ej.ContextualPlayabilityAgeRecommendationParentalControls, n)
                                                }, a || void 0 === e || void 0 === r) return m(), eT(eV.PlayButtonUpsellUnknownSettingOrAge), i(eW.gameLaunchFallbackUpsellName), [2];
                                            if ("minimal" === r) return m(), eT(eV.PlayButtonUpsellMinimalMaturityRating), i(eW.gameLaunchFallbackUpsellName), [2];
                                            if (!(o = ({
                                                    mild: "NinePlus",
                                                    moderate: "ThirteenPlus",
                                                    restricted: "SeventeenPlus",
                                                    unrated: "ThirteenPlus"
                                                })[r])) return m(), eT(eV.PlayButtonUpsellAgeNotInMapping), i(eW.gameLaunchFallbackUpsellName), [2];
                                            if (!(l = e.options.find(function(e) {
                                                    return e.option.optionValue === o
                                                }))) return [3, 13];
                                            switch (s = l.requirement) {
                                                case "SelfUpdateSetting":
                                                    return [3, 1];
                                                case "ParentalConsent":
                                                    return [3, 2];
                                                case "ContentAgeRestrictionVerification":
                                                    return [3, 7]
                                            }
                                            return [3, 11];
                                        case 1:
                                            return d(!0), eT(eV.PlayButtonUpsellSelfUpdateSettingTriggered), i(s), [3, 12];
                                        case 2:
                                            if (eT(eV.PlayButtonUpsellAskYourParentTriggered), i(s), !(c = nP())) return eT(eV.PlayButtonUpsellParentalConsentError), [3, 12];
                                            h.label = 3;
                                        case 3:
                                            return h.trys.push([3, 5, , 6]), f = (null == u ? void 0 : u.useExperienceApprovalForParentalConsent) ? {
                                                featureName: "CanApproveExperience",
                                                namespace: eZ.accountManagement,
                                                isAsyncCall: !1,
                                                usePrologue: !0,
                                                ampRecourseData: {
                                                    universeId: t,
                                                    experienceManagementAction: "Approve"
                                                }
                                            } : {
                                                featureName: "CanChangeSetting",
                                                namespace: eZ.settingChange,
                                                isAsyncCall: !1,
                                                usePrologue: !0,
                                                ampRecourseData: {
                                                    contentAgeRestriction: l.option.optionValue
                                                }
                                            }, [4, c(f)];
                                        case 4:
                                            return h.sent(), [3, 6];
                                        case 5:
                                            return h.sent(), m(), eT(eV.PlayButtonUpsellParentalConsentError), i(eW.gameLaunchFallbackUpsellName), [3, 6];
                                        case 6:
                                        case 10:
                                            return [3, 12];
                                        case 7:
                                            return h.trys.push([7, 9, , 10]), eT(eV.PlayButtonUpsellAgeRestrictionVerificationTriggered), i(s), [4, nN({
                                                context: eK,
                                                pageContext: n
                                            })];
                                        case 8:
                                            return h.sent() && window.location.reload(), [3, 10];
                                        case 9:
                                            return h.sent(), m(), i(eW.gameLaunchFallbackUpsellName), [3, 10];
                                        case 11:
                                            m(), eT(eV.PlayButtonUpsellUnknownRequirement), i(eW.gameLaunchFallbackUpsellName), h.label = 12;
                                        case 12:
                                            return [3, 14];
                                        case 13:
                                            p(!0), eT(eV.PlayButtonUpsellRestrictedUnplayableTriggered), i(eW.restrictedUnplayableUpsellName), h.label = 14;
                                        case 14:
                                            return [2]
                                    }
                                })
                            })()
                        }, [u, m, t, n]),
                        y = (0, ey.useCallback)(function() {
                            d(!1)
                        }, []),
                        g = (0, ey.useCallback)(function() {
                            p(!1)
                        }, []);
                    return {
                        launchPlayButtonUpsell: v,
                        isSelfUpdateSettingModalOpen: c,
                        navigateToAccountSettings: (0, ey.useCallback)(function() {
                            var e = (0, e$.getAbsoluteUrl)("/my/account#!/privacy");
                            "u" > typeof window && (window.location.href = e, d(!1))
                        }, []),
                        closeSelfUpdateSettingModal: y,
                        isRestrictedUnplayableModalOpen: h,
                        closeRestrictedUnplayableModal: g
                    }
                },
                ui = function(e) {
                    var t = e.universeId,
                        n = e.buttonClassName,
                        r = e.placeId,
                        a = e.rootPlaceId,
                        i = e.privateServerLinkCode,
                        o = e.gameInstanceId,
                        l = e.eventProperties,
                        u = e.appsFlyerReferralProperties,
                        s = e.pageContext,
                        c = a$(),
                        d = ur(t),
                        f = d.contentAgeRestriction,
                        h = d.contentMaturityRating,
                        p = d.isFetching,
                        m = d.hasError,
                        v = ua(r, t, s, a, i, o, l, u),
                        y = v.launchPlayButtonUpsell,
                        g = v.isSelfUpdateSettingModalOpen,
                        b = v.navigateToAccountSettings,
                        w = v.closeSelfUpdateSettingModal,
                        E = v.isRestrictedUnplayableModalOpen,
                        P = v.closeRestrictedUnplayableModal,
                        x = (0, ey.useCallback)(function(e) {
                            e.preventDefault(), e.stopPropagation(), y(f, h, m)
                        }, [y, f, h, m]);
                    return !m && p ? (0, nH.jsx)(a1, {
                        buttonClassName: null != n ? n : "btn-common-play-game-action-needed-lg game-play-button-action-needed-lg"
                    }) : (0, nH.jsxs)(eg().Fragment, {
                        children: [(0, nH.jsx)(aQ, {
                            onButtonClick: x,
                            buttonClassName: n
                        }), g && (0, nH.jsx)(ue, {
                            isModalOpen: g,
                            navigateToAccountSettings: b,
                            closeModal: w,
                            translate: c
                        }), E && (0, nH.jsx)(ut, {
                            isModalOpen: E,
                            closeModal: P,
                            translate: c
                        })]
                    })
                };
            ui.defaultProps = {
                buttonClassName: void 0,
                rootPlaceId: void 0,
                privateServerLinkCode: void 0,
                gameInstanceId: void 0,
                eventProperties: {},
                appsFlyerReferralProperties: {}
            };
            var uo = function(e, t) {
                    var n = !(arguments.length > 2) || void 0 === arguments[2] || arguments[2],
                        r = (0, eb.useQuery)({
                            queryKey: ["purchaseProductData", e, t],
                            queryFn: function() {
                                return em(function() {
                                    var n;
                                    return ev(this, function(r) {
                                        switch (r.label) {
                                            case 0:
                                                var a, i;
                                                return [4, Promise.all([(a = [e], em(function() {
                                                    var e;
                                                    return ev(this, function(t) {
                                                        switch (t.label) {
                                                            case 0:
                                                                return [4, eL.getProductInfo(a)];
                                                            case 1:
                                                                return [2, (void 0 === (e = t.sent().data.data) ? [] : e)[0]]
                                                        }
                                                    })
                                                })()), (i = [t], em(function() {
                                                    var e;
                                                    return ev(this, function(t) {
                                                        switch (t.label) {
                                                            case 0:
                                                                return [4, eL.getPlaceDetails(i)];
                                                            case 1:
                                                                return [2, (void 0 === (e = t.sent().data) ? [] : e)[0]]
                                                        }
                                                    })
                                                })())])];
                                            case 1:
                                                return [2, {
                                                    productInfo: (n = tn.apply(void 0, [r.sent(), 2]))[0],
                                                    productDetails: n[1]
                                                }]
                                        }
                                    })
                                })()
                            },
                            enabled: n,
                            staleTime: 3e4
                        }).data,
                        a = null == r ? void 0 : r.productInfo,
                        i = null == r ? void 0 : r.productDetails;
                    return void 0 === a || void 0 === i ? {
                        isLoading: !0,
                        productInfo: void 0,
                        productDetails: void 0
                    } : {
                        isLoading: !1,
                        productInfo: a,
                        productDetails: i
                    }
                },
                ul = function(e) {
                    var t = e.buttonWidth,
                        n = e.buttonClassName,
                        r = e.iconClassName,
                        a = e.hideButtonText,
                        i = e.hideButtonIcon,
                        o = e.buttonContent,
                        l = e.onClick,
                        u = e.isPurchasing,
                        s = e.redirectUrl;
                    return s ? (0, nH.jsx)("a", {
                        href: s,
                        className: "purchase-button-link",
                        children: (0, nH.jsxs)(rl, {
                            "data-testid": "play-purchase-button",
                            variant: "Emphasis",
                            style: rh,
                            className: nz()(rf(t), n),
                            onClick: function() {
                                return null
                            },
                            isDisabled: u,
                            children: [!i && (0, nH.jsx)("span", {
                                className: r
                            }), !a && (0, nH.jsx)("span", {
                                className: "btn-text",
                                children: o
                            })]
                        })
                    }) : (0, nH.jsxs)(rl, {
                        "data-testid": "play-purchase-button",
                        variant: "Emphasis",
                        style: rh,
                        className: nz()(rf(t), n),
                        onClick: function(e) {
                            l && !u && l(e)
                        },
                        isDisabled: u,
                        children: [!i && (0, nH.jsx)("span", {
                            className: r
                        }), !a && (0, nH.jsx)("span", {
                            className: "btn-text",
                            children: o
                        })]
                    })
                };
            ul.defaultProps = {
                hideButtonText: !1,
                buttonWidth: rd,
                buttonClassName: "btn-economy-robux-white-lg game-play-button-purchase-lg",
                iconClassName: "icon-robux-white",
                hideButtonIcon: !1,
                isPurchasing: !1,
                onClick: void 0,
                redirectUrl: void 0
            };
            var uu = function(e) {
                    var t, n, r = e.universeId,
                        a = e.placeId,
                        i = e.productDetails,
                        o = e.translate,
                        l = e.iconClassName,
                        u = e.buttonWidth,
                        s = e.buttonClassName,
                        c = e.hideButtonText,
                        d = e.redirectPurchaseUrl,
                        f = e.showDefaultPurchaseText,
                        h = e.pageContext,
                        p = tn((0, ey.useState)(!1), 2),
                        m = p[0],
                        v = p[1],
                        y = (0, ey.useCallback)(function(e) {
                            return em(function() {
                                var t, n, o;
                                return ev(this, function(l) {
                                    switch (l.label) {
                                        case 0:
                                            if (e.preventDefault(), e.stopPropagation(), n = null == (t = i.fiatPurchaseData) ? void 0 : t.basePriceId, !a || !n) return [2];
                                            v(!0), l.label = 1;
                                        case 1:
                                            return l.trys.push([1, 3, 4, 5]), nR(r, eW.fiatPurchaseUpsellName, ej.FiatPurchaseRequired, h), [4, eD(a, n)];
                                        case 2:
                                            return (o = l.sent()) && (0, e1.isValidStripeCheckoutUrl)(o) && (window.location.href = o), [3, 5];
                                        case 3:
                                            return l.sent(), eT(eV.PreparePurchaseUrlError), console.error("Error preparing purchase url"), [3, 5];
                                        case 4:
                                            return v(!1), [7];
                                        case 5:
                                            return [2]
                                    }
                                })
                            })()
                        }, [a, i, r, h]);
                    return (0, nH.jsx)(ul, {
                        buttonWidth: u,
                        buttonClassName: s,
                        iconClassName: l,
                        hideButtonText: c,
                        hideButtonIcon: !0,
                        buttonContent: void 0 !== f && f ? o(eG.Buy) : null != (t = null == (n = i.fiatPurchaseData) ? void 0 : n.localizedFiatPrice) ? t : "",
                        onClick: d ? void 0 : y,
                        redirectUrl: d,
                        isPurchasing: m
                    })
                },
                us = window.RobloxItemPurchase,
                uc = ["[&::after]:[content:'']", "[&::after]:absolute", "[&::after]:inset-[0]", "[&::after]:[background:linear-gradient(90deg,var(--color-extended-white-0)_0%,var(--color-extended-white-20)_50%,var(--color-extended-white-0)_100%)]", "[&::after]:[animation:foundation-web-skeleton-shimmer_1.5s_linear_infinite]", "motion-reduce:[&::after]:[content:none]"],
                ud = (0, ey.forwardRef)(function(e, t) {
                    var n = nX([e, t]),
                        r = n[0],
                        a = n.slice(1),
                        i = r.className,
                        o = r.style,
                        l = r.variant,
                        u = void 0 === l ? "Rectangle" : l,
                        s = r.isAnimated,
                        c = r.width,
                        d = r.height,
                        f = eX(r, ["className", "style", "variant", "isAnimated", "width", "height"]),
                        h = tn(a, 1)[0],
                        p = "Text" === u,
                        m = "Circle" === u,
                        v = {};
                    return p ? (v.height = null != d ? d : "1em", v.width = null != c ? c : "100%") : (void 0 !== c && (v.width = c), void 0 !== d && (v.height = d)), eg().createElement("div", eM(eE({
                        ref: h,
                        "aria-hidden": "true",
                        "data-variant": u
                    }, f), {
                        className: n$("relative clip block bg-[var(--color-common-shimmer)]", p && "radius-xsmall", m && "radius-circle", !p && !m && "radius-small", (void 0 === s || s) && uc, i),
                        style: eE({}, v, o)
                    }))
                });
            ud.displayName = "Skeleton";
            var uf = Error("thumbnail pending"),
                uh = function(e, t) {
                    return t === uf && e < 5
                },
                up = function() {
                    var e, t;
                    return {
                        promise: new Promise(function(n, r) {
                            e = n, t = r
                        }),
                        resolve: e,
                        reject: t
                    }
                },
                um = "150x150",
                uv = "webp",
                uy = function(e) {
                    var t, n, r, a;
                    return "".concat(e.type, ":").concat(e.targetId, ":").concat(null != (t = e.size) ? t : um, ":").concat(null != (n = e.format) ? n : uv, ":").concat(null != (r = e.version) ? r : "", ":").concat(null != (a = e.headShape) ? a : "", ":").concat(e.includeBackground ? "bg" : "", ":").concat(e.includeProfileFrame ? "frame" : "")
                },
                ug = t6({
                    data: (k = t6({
                        requestId: t3(),
                        state: new t8(eE({
                            type: "literal",
                            values: Array.isArray(T = ["Completed", "Pending", "Blocked", "Error", "InReview"]) ? T : [T]
                        }, t_(void 0))),
                        imageUrl: new t7({
                            type: "optional",
                            innerType: new t9({
                                type: "nullable",
                                innerType: t3()
                            })
                        })
                    }), new t5(eE({
                        type: "array",
                        element: k
                    }, t_(void 0))))
                }),
                ub = function(e) {
                    var t = new Map;
                    return e.data.forEach(function(e) {
                        var n = e.requestId,
                            r = e.state,
                            a = e.imageUrl;
                        "Completed" === r ? t.set(n, null != a ? {
                            state: r,
                            imageUrl: a
                        } : {
                            state: "Error"
                        }) : t.set(n, null != a ? {
                            state: r,
                            imageUrl: a
                        } : {
                            state: r
                        })
                    }), t
                },
                uw = (O = {
                    delay: 50,
                    maxSize: 100
                }, _ = function(e) {
                    return em(function() {
                        var t, n;
                        return ev(this, function(r) {
                            switch (r.label) {
                                case 0:
                                    return t = eI.Url.parse(ex().thumbnailsApi).getOrThrow().withPath("/v1/batch"), n = e.map(function(e) {
                                        var t, n;
                                        return eE({
                                            requestId: uy(e),
                                            type: e.type,
                                            targetId: e.targetId,
                                            size: null != (t = e.size) ? t : um,
                                            format: null != (n = e.format) ? n : uv
                                        }, null != e.version ? {
                                            version: e.version
                                        } : {}, e.headShape ? {
                                            headShape: e.headShape
                                        } : {}, e.includeBackground ? {
                                            includeBackground: !0
                                        } : {}, e.includeProfileFrame && "AvatarHeadShot" === e.type ? {
                                            includeProfileFrame: !0
                                        } : {})
                                    }), [4, eS.post(t, n, ug, {
                                        credentials: "include",
                                        headers: {
                                            Accept: "application/json"
                                        },
                                        retry: eS.defaultBrowserRetryDelay
                                    })];
                                case 1:
                                    return [2, ub(r.sent().getOrThrow())]
                            }
                        })
                    })()
                }, N = function(e, t) {
                    var n;
                    return null != (n = e.get(uy(t))) ? n : {
                        state: "Error"
                    }
                }, o = O, l = _, s = o.delay, c = o.maxSize, d = [], f = up(), h = function() {
                    var e = f.resolve,
                        t = f.reject,
                        n = d;
                    d = [], f = up(), l(n).then(e).catch(t)
                }, L = function(e) {
                    0 === d.length && (u = setTimeout(h, s)), d.push(e);
                    var t = f.promise;
                    return null != c && d.length >= c && (clearTimeout(u), h()), t
                }, function(e) {
                    return L(e).then(function(t) {
                        return N(t, e)
                    })
                }),
                uE = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 10,
                        n = Number.parseInt(e, t);
                    return Number.isNaN(n) ? null : n
                },
                uP = function() {
                    if ("u" < typeof document) return {
                        batchSize: 100,
                        waitMs: 1e3
                    };
                    var e, t, n, r, a, i = document.getElementsByName("performance")[0],
                        o = uE(null != (e = null == i ? void 0 : i.getAttribute("data-ui-performance-metrics-batch-size")) ? e : ""),
                        l = tn((null != (t = null == i ? void 0 : i.getAttribute("data-ui-performance-metrics-batch-wait-time")) ? t : "").split(":"), 3),
                        u = l[0],
                        s = l[1],
                        c = l[2],
                        d = ((null != (n = uE(null != u ? u : "")) ? n : 0) * 3600 + (null != (r = uE(null != s ? s : "")) ? r : 0) * 60 + (null != (a = uE(null != c ? c : "")) ? a : 0)) * 1e3;
                    return {
                        batchSize: null != o ? o : 100,
                        waitMs: 0 === d ? 1e3 : d
                    }
                },
                ux = [],
                uS = !1,
                uI = function() {
                    if (uS = !1, 0 !== ux.length) {
                        var e = ux;
                        ux = [], eS.postUntyped(eI.Url.parse("".concat(ex().beaconApi, "/v1/measurements")).getOrThrow(), e, {
                            credentials: "include",
                            keepalive: !0,
                            signal: AbortSignal.timeout(3e3)
                        })
                    }
                },
                uA = function(e, t) {
                    var n = nu(t);
                    ux.push({
                        metricName: e,
                        jsonData: n.isOk() ? n.value : "{}"
                    });
                    var r = uP(),
                        a = r.batchSize,
                        i = r.waitMs;
                    ux.length >= a ? uI() : uS || (uS = !0, setTimeout(uI, i))
                },
                uC = function(e) {
                    var t, n = e.targetId,
                        r = e.type,
                        a = e.size,
                        i = e.format,
                        o = e.version,
                        l = e.headShape,
                        u = e.includeBackground,
                        s = e.includeProfileFrame,
                        c = e.altName,
                        d = e.imgClassName,
                        f = e.containerClassName,
                        h = e.onLoad,
                        p = (0, ey.useRef)(Date.now()),
                        m = (0, ey.useRef)(0),
                        v = (0, ey.useRef)(!1),
                        y = null != u ? u : (null == r ? void 0 : r.toLowerCase()) === "avatarheadshot",
                        g = (0, eb.useQuery)({
                            queryKey: ["thumbnail-2d", r, n, a, i, o, l, y, s],
                            staleTime: 1 / 0,
                            retry: uh,
                            queryFn: function() {
                                return em(function() {
                                    var e;
                                    return ev(this, function(t) {
                                        switch (t.label) {
                                            case 0:
                                                return [4, uw({
                                                    type: r,
                                                    targetId: n,
                                                    size: a,
                                                    format: i,
                                                    version: o,
                                                    headShape: l,
                                                    includeBackground: y,
                                                    includeProfileFrame: s
                                                })];
                                            case 1:
                                                if ("Pending" === (e = t.sent()).state) throw m.current += 1, uf;
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
                        x = g.isLoading;
                    (0, ey.useEffect)(function() {
                        p.current = Date.now(), m.current = 0, v.current = !1
                    }, [r, n, a, i, o, l, y, s]), (0, ey.useEffect)(function() {
                        if (!v.current) {
                            var e = "".concat(r, "_2d");
                            if (b) {
                                if (v.current = !0, uA("ThumbnailStatusCountWebapp", {
                                        Status: b.state,
                                        ThumbnailType: e
                                    }), "Completed" === b.state) {
                                    var t = m.current;
                                    uA("ThumbnailLoadDurationWebapp", {
                                        Status: "Success",
                                        ThumbnailType: e,
                                        Value: String(Date.now() - p.current)
                                    }), uA(0 === t ? "ThumbnailNoRetrySuccessWebapp" : "ThumbnailRetryWebapp", 0 === t ? {
                                        ThumbnailType: e
                                    } : {
                                        ThumbnailType: e,
                                        Value: String(t)
                                    })
                                }
                            } else w && E === uf && (v.current = !0, uA("ThumbnailTimeoutWebapp", {
                                ThumbnailType: e
                            }))
                        }
                    }, [b, w, E, r]);
                    var S = null != (t = null == b ? void 0 : b.imageUrl) ? t : null,
                        I = (null == b ? void 0 : b.state) === "Blocked" ? "icon-blocked" : (null == b ? void 0 : b.state) === "InReview" ? "icon-in-review" : (null == b ? void 0 : b.state) === "Error" ? "icon-broken" : w ? E === uf ? "icon-pending" : "icon-broken" : "",
                        A = null != P ? P : x,
                        C = ["thumbnail-2d-container float-left overflow-hidden", void 0 === f ? "" : f, I, A && "thumbnail-2d-loading"].filter(Boolean).join(" ");
                    return (0, nH.jsxs)("span", {
                        className: C,
                        children: [A && (0, nH.jsx)(ud, {
                            variant: "Rectangle",
                            width: "100%",
                            height: "100%"
                        }), null != S && (0, nH.jsx)("img", {
                            className: ["size-full", void 0 === d ? "" : d].filter(Boolean).join(" "),
                            src: S,
                            alt: void 0 === c ? "" : c,
                            onLoad: h
                        })]
                    })
                },
                uT = function(e) {
                    var t;
                    return null != (t = null == e ? void 0 : e.price.toString()) ? t : ""
                },
                uk = function(e) {
                    var t = e.universeId,
                        n = e.iconClassName,
                        r = e.buttonWidth,
                        a = e.buttonClassName,
                        i = e.hideButtonText,
                        o = e.redirectPurchaseUrl,
                        l = e.productDetails,
                        u = e.productInfo,
                        s = e.translate,
                        c = e.refetchPlayabilityStatus,
                        d = (0, ey.useRef)(void 0);
                    null != d.current || (d.current = (0, us.createItemPurchase)());
                    var f = tn(d.current, 2),
                        h = f[0],
                        p = f[1],
                        m = (0, ey.useCallback)(function(e) {
                            e.preventDefault(), e.stopPropagation(), p.start()
                        }, [p]);
                    return (0, nH.jsxs)(eg().Fragment, {
                        children: [(0, nH.jsx)(ul, {
                            buttonWidth: r,
                            buttonClassName: a,
                            iconClassName: n,
                            hideButtonText: i,
                            buttonContent: uT(u),
                            onClick: o ? void 0 : m,
                            redirectUrl: o
                        }), (0, nH.jsx)(h, {
                            translate: s,
                            productId: u.productId,
                            expectedPrice: u.price,
                            thumbnail: (0, nH.jsx)(uC, {
                                type: "GameIcon",
                                size: "150x150",
                                targetId: t,
                                imgClassName: "game-card-thumb"
                            }),
                            assetName: l.name,
                            assetType: "Place",
                            sellerName: l.builder,
                            expectedCurrency: 1,
                            expectedSellerId: u.sellerId,
                            onPurchaseSuccess: c,
                            isPlace: !0
                        })]
                    })
                },
                uO = function(e) {
                    var t = e.universeId,
                        n = e.placeId,
                        r = e.iconClassName,
                        a = void 0 === r ? "icon-robux-white" : r,
                        i = e.buttonWidth,
                        o = void 0 === i ? rd : i,
                        l = e.buttonClassName,
                        u = void 0 === l ? "btn-economy-robux-white-lg game-play-button-purchase-lg" : l,
                        s = e.refetchPlayabilityStatus,
                        c = e.hideButtonText,
                        d = void 0 !== c && c,
                        f = e.redirectPurchaseUrl,
                        h = e.playabilityStatus,
                        p = e.showDefaultPurchaseText,
                        m = e.pageContext,
                        v = a$(),
                        y = uo(t, n),
                        g = y.productInfo,
                        b = y.productDetails;
                    return y.isLoading ? (0, nH.jsx)(a1, {
                        buttonClassName: u,
                        buttonWidth: o
                    }) : "Fiat" == (h === ej.FiatPurchaseRequired && (null == b ? void 0 : b.fiatPurchaseData) ? "Fiat" : "Robux") ? (0, nH.jsx)(uu, {
                        universeId: t,
                        placeId: n,
                        iconClassName: a,
                        buttonWidth: o,
                        buttonClassName: u,
                        hideButtonText: d,
                        redirectPurchaseUrl: f,
                        productDetails: b,
                        translate: v,
                        showDefaultPurchaseText: void 0 !== p && p,
                        pageContext: m
                    }) : (0, nH.jsx)(uk, {
                        universeId: t,
                        iconClassName: a,
                        buttonWidth: o,
                        buttonClassName: u,
                        hideButtonText: d,
                        redirectPurchaseUrl: f,
                        productDetails: b,
                        productInfo: g,
                        translate: v,
                        refetchPlayabilityStatus: s
                    })
                },
                u_ = function(e) {
                    var t = e.universeId,
                        n = e.placeId,
                        r = e.rootPlaceId,
                        a = e.privateServerLinkCode,
                        i = e.gameInstanceId,
                        o = e.eventProperties,
                        l = e.appsFlyerReferralProperties,
                        u = a$(),
                        s = (0, ey.useCallback)(function(e) {
                            e.preventDefault(), e.stopPropagation(), nL(n, t);
                            var u = nj((null == o ? void 0 : o.launchData) != null ? String(o.launchData) : void 0);
                            nk(n, r, a, i, o, u, l, "DemoPlayButtonClick")
                        }, [t, n, r, a, i, o, l]),
                        c = u(eG.PlayDemo) || "Play Demo";
                    return (0, nH.jsx)("button", {
                        type: "button",
                        "data-testid": "demo-play-button",
                        className: "btn-control-lg btn-full-width demo-play-button",
                        onClick: s,
                        children: c
                    })
                },
                uN = {
                    create: function(e) {
                        var t = e.userId;
                        return em(function() {
                            return ev(this, function(e) {
                                switch (e.label) {
                                    case 0:
                                        var n;
                                        return [4, (n = "wasm-hash-v1:".concat(t), em(function() {
                                            var e, t;
                                            return ev(this, function(r) {
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
                        return em(function() {
                            return ev(this, function(n) {
                                switch (n.label) {
                                    case 0:
                                        return [4, uN.create(t)];
                                    case 1:
                                        return [2, e === n.sent()]
                                }
                            })
                        })()
                    }
                },
                uL = new Map([
                    ["3f", uN]
                ]),
                uB = az("PlayButton"),
                uR = function() {
                    uB("PlayOnWebImpression")
                },
                uU = function() {
                    uB("PlayOnWebClick")
                },
                uD = function(e) {
                    var t = e.placeId,
                        n = e.rootPlaceId,
                        r = e.universeId,
                        a = e.privateServerLinkCode,
                        i = e.gameInstanceId,
                        o = e.eventProperties,
                        l = e.wasmJoinId,
                        u = e.joinData,
                        s = void 0 === u ? nj((null == o ? void 0 : o.launchData) != null ? String(o.launchData) : void 0) : u;
                    uU();
                    var c = nF(t, r, o, s),
                        d = c.joinAttemptId,
                        f = c.joinAttemptOrigin,
                        h = new URL("".concat(ex().playWebsite, "/games/start?placeId=").concat(t));
                    s.launchData && h.searchParams.set("launchData", s.launchData), s.eventId && h.searchParams.set("eventId", s.eventId), i && t === n ? h.searchParams.set("gameInstanceId", i) : a && h.searchParams.set("privateServerLinkCode", a), d && h.searchParams.set("joinAttemptId", d), null != f && h.searchParams.set("joinAttemptOrigin", String(f)), l && h.searchParams.set("wasmJoinId", l), window.open(h.toString(), "_blank", "noopener")
                },
                uM = function(e, t) {
                    var n = null == ti ? void 0 : ti.IntersectionObserver;
                    if ("function" != typeof n) return function() {};
                    var r = e.element,
                        a = eX(e, ["element"]);
                    try {
                        var i = new n(function(e, n) {
                            var r, a = tn(e, 1)[0];
                            t(null != (r = null == a ? void 0 : a.isIntersecting) && r, n)
                        }, a);
                        return i.observe(r),
                            function() {
                                i.disconnect()
                            }
                    } catch (e) {}
                    return function() {}
                },
                uj = function(e, t, n) {
                    var r = (0, ey.useRef)(!1);
                    (0, ey.useEffect)(function() {
                        r.current = !1
                    }, [t]), (0, ey.useEffect)(function() {
                        if (n && e.current && !r.current) return uM({
                            element: e.current,
                            threshold: .5
                        }, function(e, t) {
                            e && !r.current && (r.current = !0, uR(), t.disconnect())
                        })
                    }, [e, t, n])
                },
                uF = function(e) {
                    var t = e.placeId,
                        n = e.rootPlaceId,
                        r = e.universeId,
                        a = e.privateServerLinkCode,
                        i = e.gameInstanceId,
                        o = e.eventProperties,
                        l = e.wasmJoinId,
                        u = e.playOnWebVariant,
                        s = aJ("Feature.ExperienceDetails"),
                        c = (0, ey.useRef)(null),
                        d = !!l;
                    uj(c, r, d);
                    var f = (0, ey.useCallback)(function(e) {
                        e.preventDefault(), e.stopPropagation(), uD({
                            placeId: t,
                            rootPlaceId: n,
                            universeId: r,
                            privateServerLinkCode: a,
                            gameInstanceId: i,
                            eventProperties: o,
                            wasmJoinId: l
                        })
                    }, [t, n, r, a, i, o, l]);
                    if (!d) return null;
                    var h = s.dynamic(eG.PlayOnWeb, void 0, "Play in browser"),
                        p = u === rp;
                    return (0, nH.jsxs)("div", {
                        className: "play-on-web-button-container",
                        children: [(0, nH.jsx)(rl, {
                            ref: c,
                            "data-testid": "play-on-web-button",
                            variant: p ? "Emphasis" : "Standard",
                            size: "Large",
                            style: rh,
                            className: nz()("btn-full-width play-on-web-button", p ? "btn-common-play-game-lg" : "btn-control-lg"),
                            "aria-label": p ? h : void 0,
                            onClick: f,
                            children: p ? (0, nH.jsx)("span", {
                                className: "icon-common-play"
                            }) : h
                        }), (0, nH.jsx)("span", {
                            "data-testid": "play-on-web-beta-notice",
                            className: "text-caption-medium content-muted play-on-web-beta-notice",
                            children: s.dynamic(eG.PlayOnWebBetaNotice, void 0, "Play in browser is in beta")
                        })]
                    })
                },
                uH = function(e) {
                    var t = e.activeUpsell,
                        n = e.closeUpsell,
                        r = e.creatorId,
                        a = a$(),
                        i = a("Action.Cancel") || "Cancel",
                        o = a("Action.OK") || "OK",
                        l = a("Action.Close") || "Close";
                    return (0, nH.jsxs)(eg().Fragment, {
                        children: [(0, nH.jsx)(l9, {
                            titleText: a("Action.Settings") || "Settings",
                            bodyText: a("Message.UpdateSettingsToPlaytest") || "Update your settings to join this Playtest.",
                            primaryButtonText: a("Action.OpenSettings") || "Open Settings",
                            secondaryButtonText: i,
                            closeLabelText: l,
                            onPrimaryButtonClick: function() {
                                n(), nD()
                            },
                            onSecondaryButtonClick: n,
                            isModalOpen: "settings" === t,
                            onCloseModal: n,
                            hasCloseAffordance: !1,
                            orientButtonsVertically: !0
                        }), (0, nH.jsx)(l9, {
                            titleText: a("TrustedFriend.Label.AddTrustedFriend") || "Add trusted friend",
                            bodyText: a("Message.TrustedFriendsRequiredForPlaytest") || "Add this creator as a trusted friend to join the Playtest.",
                            primaryButtonText: void 0 !== r ? a("Action.Add") || "Add" : void 0,
                            secondaryButtonText: void 0 !== r ? i : o,
                            closeLabelText: l,
                            onPrimaryButtonClick: void 0 !== r ? function() {
                                n(), nM(r)
                            } : void 0,
                            onSecondaryButtonClick: n,
                            isModalOpen: "trustedFriends" === t,
                            onCloseModal: n,
                            hasCloseAffordance: !1,
                            orientButtonsVertically: !0
                        })]
                    })
                },
                uG = function(e) {
                    var t = e.creatorId,
                        n = tn((0, ey.useState)(null), 2),
                        r = n[0],
                        a = n[1],
                        i = (0, ey.useCallback)(function() {
                            a(null)
                        }, []);
                    return {
                        openUpdatePlaytestSettingsUpsell: (0, ey.useCallback)(function() {
                            a("settings")
                        }, []),
                        openTrustedFriendsPlaytestUpsell: (0, ey.useCallback)(function() {
                            a("trustedFriends")
                        }, []),
                        playtestUpsellModals: (0, nH.jsx)(uH, {
                            activeUpsell: r,
                            closeUpsell: i,
                            creatorId: t
                        })
                    }
                },
                uz = {},
                uV = function(e) {
                    var t = e.universeId,
                        n = e.placeId,
                        r = e.rootPlaceId,
                        a = e.creatorId,
                        i = e.privatePlaytestInfo,
                        o = e.refetchPlayabilityStatus,
                        l = e.pageContext,
                        u = e.eventProperties,
                        s = void 0 === u ? uz : u,
                        c = e.appsFlyerReferralProperties,
                        d = void 0 === c ? uz : c,
                        f = a$(),
                        h = uG({
                            creatorId: a
                        }),
                        p = h.openUpdatePlaytestSettingsUpsell,
                        m = h.openTrustedFriendsPlaytestUpsell,
                        v = h.playtestUpsellModals,
                        y = (0, ey.useCallback)(function() {
                            var e = nj(null != s.launchData ? String(s.launchData) : void 0);
                            nk(n, r, void 0, void 0, s, e, d, "PlaytestPlayButtonClick", !0)
                        }, [d, s, n, r]),
                        g = (0, ey.useCallback)(function(e) {
                            if (e.preventDefault(), e.stopPropagation(), i.isPlayable) return void y();
                            var n = i.playabilityStatus,
                                r = nU(n);
                            if (void 0 !== n && void 0 !== r) {
                                if (r === nx) {
                                    nR(t, eW.ageCheckUpsellName, n, l), em(function() {
                                        return ev(this, function(e) {
                                            switch (e.label) {
                                                case 0:
                                                    return e.trys.push([0, 2, , 3]), [4, nN({
                                                        context: eq,
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
                                if (r === nS) {
                                    p(), nR(t, eW.updatePlaytestSettingsUpsellName, n, l);
                                    return
                                }
                                m(), nR(t, eW.trustedFriendRequiredUpsellName, n, l)
                            }
                        }, [y, m, p, l, i, o, t]),
                        b = f(eG.Playtest) || "Preview";
                    return (0, nH.jsxs)(eg().Fragment, {
                        children: [(0, nH.jsx)("button", {
                            type: "button",
                            "data-testid": "playtest-play-button",
                            className: "btn-control-lg btn-full-width playtest-play-button",
                            onClick: g,
                            children: b
                        }), v]
                    })
                },
                uW = function(e, t) {
                    if (void 0 === t) return null;
                    var n, r = e.find(function(e) {
                        var n = e.isEnabled,
                            r = e.primaryStatuses;
                        return n && r.has(t)
                    });
                    return null != (n = null == r ? void 0 : r.render()) ? n : null
                },
                uq = function(e) {
                    var t = e.primaryButton,
                        n = e.secondaryButton,
                        r = e.isPrimaryButtonLoading;
                    return n ? (0, nH.jsxs)("div", {
                        className: "stacked-play-buttons-container",
                        children: [(0, nH.jsx)("div", {
                            className: "stacked-play-button-primary",
                            "data-testid": "stacked-play-button-primary",
                            children: t
                        }), !(void 0 !== r && r) && n]
                    }) : t
                },
                uK = function(e) {
                    var t = e.iconClassName,
                        n = e.buttonWidth,
                        r = e.buttonClassName,
                        a = e.hideButtonText,
                        i = a$();
                    return (0, nH.jsxs)(rl, {
                        "data-testid": "play-unplayable-button",
                        variant: "Emphasis",
                        style: rh,
                        className: nz()(rf(void 0 === n ? rd : n), void 0 === r ? "btn-common-play-game-unplayable-lg game-play-button-unplayable-lg" : r),
                        isDisabled: !0,
                        onClick: function() {
                            return null
                        },
                        children: [(0, nH.jsx)("span", {
                            className: void 0 === t ? "icon-status-unavailable-secondary" : t
                        }), !(void 0 !== a && a) && (0, nH.jsx)("span", {
                            className: "btn-text",
                            children: i(eG.Unplayable)
                        })]
                    })
                },
                uZ = function(e) {
                    var t = e.treatmentData,
                        n = e.isModalOpen,
                        r = e.onConfirm,
                        a = e.onDismiss,
                        i = a$();
                    return (0, nH.jsx)(l9, {
                        titleText: t.titleText,
                        bodyText: t.bodyText,
                        primaryButtonText: t.primaryActionText,
                        secondaryButtonText: t.secondaryActionText,
                        closeLabelText: i("Action.Close"),
                        onPrimaryButtonClick: r,
                        onSecondaryButtonClick: a,
                        isModalOpen: n,
                        onCloseModal: a
                    })
                },
                uY = function(e) {
                    return !!e && "string" == typeof e.titleText && e.titleText.length > 0 && "string" == typeof e.bodyText && e.bodyText.length > 0 && "string" == typeof e.primaryActionText && e.primaryActionText.length > 0 && "string" == typeof e.secondaryActionText && e.secondaryActionText.length > 0
                },
                uJ = function(e, t, n) {
                    var r = tn((0, ey.useState)(!1), 2),
                        a = r[0],
                        i = r[1],
                        o = eJ(e),
                        l = o.playabilityStatus,
                        u = o.playableUxTreatment,
                        s = o.isFetchingPlayability,
                        c = (0, ey.useCallback)(function(t) {
                            nR(e, t, ej.Playable, n)
                        }, [e, n]);
                    return {
                        doGameLaunchWithPlayableUxTreatment: (0, ey.useCallback)(function() {
                            if (s) {
                                t(), eT(eV.PlayableUxTreatmentPlayabilityStatusStillLoading), c(eW.gameLaunchFallbackUpsellName);
                                return
                            }
                            if (l !== ej.Playable || !(null == u ? void 0 : u.treatment)) return void t();
                            if ("reconfirmLaunchModal" !== u.treatment) {
                                t(), eT(eV.PlayableUxTreatmentUnknownTreatment), c(eW.gameLaunchFallbackUpsellName);
                                return
                            }
                            if (!uY(u.data)) {
                                t(), eT(eV.PlayableUxTreatmentMalformedData), c(eW.gameLaunchFallbackUpsellName);
                                return
                            }
                            i(!0), c(eW.reconfirmLaunchModalUpsellName)
                        }, [s, l, u, t, c]),
                        playableUxTreatmentModal: (0, ey.useMemo)(function() {
                            return a && u && uY(u.data) ? (0, nH.jsx)(uZ, {
                                treatmentData: u.data,
                                isModalOpen: a,
                                onConfirm: function() {
                                    i(!1), t()
                                },
                                onDismiss: function() {
                                    i(!1)
                                }
                            }) : null
                        }, [u, a, t])
                    }
                },
                uX = function() {
                    var e, t = null == (e = nJ()) ? void 0 : e.id,
                        n = (0, eb.useQuery)({
                            queryKey: ["wasmJoinId", t],
                            queryFn: function() {
                                var e;
                                return null == t ? Promise.resolve(null) : (e = {
                                    userId: t
                                }, em(function() {
                                    var t, n, r;
                                    return ev(this, function(a) {
                                        switch (a.label) {
                                            case 0:
                                                if (!(t = uL.get("3f"))) throw Error("No scheme registered for CURRENT_SCHEME_ID 3f");
                                                return r = (n = "3f").concat, [4, t.create(e)];
                                            case 1:
                                                return [2, r.apply(n, [a.sent()])]
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
                u$ = function(e) {
                    var t = e.universeId,
                        n = e.buttonClassName,
                        r = e.playabilityStatus,
                        a = e.pageContext;
                    return (0, nH.jsx)(aQ, {
                        onButtonClick: function(e) {
                            return em(function() {
                                return ev(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            e.preventDefault(), e.stopPropagation(), n.label = 1;
                                        case 1:
                                            return n.trys.push([1, 3, , 4]), nR(t, eW.ageCheckUpsellName, r, a), [4, nN({
                                                context: eq,
                                                pageContext: a
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
                uQ = {},
                u0 = new Set([ej.PurchaseRequired, ej.FiatPurchaseRequired, ej.FiatPurchaseDeviceRestricted, ej.ContextualPlayabilityRegionalAvailability]),
                u1 = new Set(Object.values(ej).filter(function(e) {
                    return e !== ej.GuestProhibited
                })),
                u2 = new Set([ej.Playable]),
                u3 = function(e) {
                    var t = e.universeId,
                        n = e.placeId,
                        r = e.rootPlaceId,
                        a = e.privateServerLinkCode,
                        i = e.gameInstanceId,
                        o = e.status,
                        l = e.eventProperties,
                        u = void 0 === l ? uQ : l,
                        s = e.appsFlyerReferralProperties,
                        c = void 0 === s ? uQ : s,
                        d = e.iconClassName,
                        f = e.buttonWidth,
                        h = void 0 === f ? rd : f,
                        p = e.buttonClassName,
                        m = void 0 === p ? "btn-common-play-game-lg game-play-button-lg" : p,
                        v = e.disableLoadingState,
                        y = e.buttonText,
                        g = void 0 === y ? void 0 : y,
                        b = e.hideIcon,
                        w = e.analyticsCallback,
                        E = void 0 === w ? void 0 : w,
                        P = e.pageContext,
                        x = tn((0, ey.useState)(void 0), 2),
                        S = x[0],
                        I = x[1],
                        A = tn((0, ey.useState)(void 0), 2),
                        C = A[0],
                        T = A[1],
                        k = tn((0, ey.useState)(void 0), 2),
                        O = k[0],
                        _ = k[1],
                        N = tn((0, ey.useState)(void 0), 2),
                        L = N[0],
                        B = N[1],
                        R = tn((0, ey.useState)(void 0), 2),
                        U = R[0],
                        D = R[1],
                        M = tn((0, ey.useState)(void 0), 2),
                        j = M[0],
                        F = M[1],
                        H = tn((0, ey.useState)(void 0), 2),
                        G = H[0],
                        z = H[1],
                        V = tn((0, ey.useState)(void 0), 2),
                        W = V[0],
                        q = V[1],
                        K = (0, eb.useQuery)({
                            queryKey: ["getIsVNGLandingRedirectEnabled"],
                            queryFn: ru.getIsVNGLandingRedirectEnabled,
                            retry: !1
                        }).data;
                    (0, ey.useEffect)(function() {
                        em(function() {
                            var e, n;
                            return ev(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return r.trys.push([0, 2, , 3]), [4, em(function() {
                                            var e, n, r, a, i, o, l, u, s, c, d, f, h, p, m, v, y;
                                            return ev(this, function(g) {
                                                switch (g.label) {
                                                    case 0:
                                                        if (e = {
                                                                isUniverseEnabledForVoice: !1,
                                                                isUniverseEnabledForAvatarVideo: !1
                                                            }, void 0 === nJ()) return [2, {
                                                            elegibleToSeeVoiceUpsell: !1,
                                                            universePlaceVoiceEnabledSettings: e,
                                                            showAgeVerificationOverlay: !1,
                                                            showVoiceOptInOverlay: !1,
                                                            showAvatarVideoOptInOverlay: !1,
                                                            requireExplicitVoiceConsent: !0,
                                                            useCameraU13Design: !1,
                                                            useVoiceUpsellV2Design: !1
                                                        }];
                                                        return [4, eB()];
                                                    case 1:
                                                        var b;
                                                        if (r = (n = g.sent()).playButtonOverlayWebFlag, a = n.voiceOptInWebFlag, i = n.cameraOptInWebFlag, o = n.cameraOptInWebFlagU13, l = n.requireExplicitVoiceConsent, u = n.useCameraU13Design, s = n.useVoiceUpsellV2Design, !r && !(a || i)) return [2, {
                                                            elegibleToSeeVoiceUpsell: !1,
                                                            universePlaceVoiceEnabledSettings: e,
                                                            showAgeVerificationOverlay: !1,
                                                            showVoiceOptInOverlay: !1,
                                                            showAvatarVideoOptInOverlay: !1,
                                                            requireExplicitVoiceConsent: l,
                                                            useCameraU13Design: u,
                                                            useVoiceUpsellV2Design: s
                                                        }];
                                                        return [4, (b = t, em(function() {
                                                            var e;
                                                            return ev(this, function(t) {
                                                                switch (t.label) {
                                                                    case 0:
                                                                        return e = {
                                                                            withCredentials: !0,
                                                                            url: "".concat(ex().voiceApi, "/v1/settings/verify/show-age-verification-overlay/").concat(b)
                                                                        }, [4, ek.get(e)];
                                                                    case 1:
                                                                        return [2, t.sent().data]
                                                                }
                                                            })
                                                        })())];
                                                    case 2:
                                                        if (d = (c = g.sent()).showAgeVerificationOverlay, f = c.showVoiceOptInOverlay, h = c.showAvatarVideoOptInOverlay, p = c.elegibleToSeeVoiceUpsell, m = c.universePlaceVoiceEnabledSettings, v = !1, y = !1, !rc().getAllValuesForLayer) return [3, 5];
                                                        return [4, rc().getAllValuesForLayer("Voice.AvatarChat.Upsell")];
                                                    case 3:
                                                        return v = Boolean.apply(void 0, [g.sent().ShouldShowUpsell]), [4, rc().getAllValuesForLayer("Voice.AvatarChat.U13Upsell")];
                                                    case 4:
                                                        y = Boolean.apply(void 0, [g.sent().ShouldShowUpsell]), g.label = 5;
                                                    case 5:
                                                        return [2, {
                                                            elegibleToSeeVoiceUpsell: p,
                                                            universePlaceVoiceEnabledSettings: m,
                                                            showAgeVerificationOverlay: r && d,
                                                            showVoiceOptInOverlay: a && f,
                                                            showAvatarVideoOptInOverlay: h && (i && v || o && y),
                                                            requireExplicitVoiceConsent: l,
                                                            useCameraU13Design: u,
                                                            useVoiceUpsellV2Design: s
                                                        }]
                                                }
                                            })
                                        })()];
                                    case 1:
                                        return I(null != (e = (n = r.sent()).universePlaceVoiceEnabledSettings.isUniverseEnabledForVoice) && e), _(n.elegibleToSeeVoiceUpsell), T(n.showAgeVerificationOverlay), B(n.showVoiceOptInOverlay), D(n.showAvatarVideoOptInOverlay), F(n.requireExplicitVoiceConsent), z(n.useCameraU13Design), q(n.useVoiceUpsellV2Design), [3, 3];
                                    case 2:
                                        return r.sent(), eT(eV.PlayButtonShowIdentificationError), _(!1), I(!1), T(!1), B(!1), D(!1), F(!0), z(!1), q(!1), [3, 3];
                                    case 3:
                                        return [2]
                                }
                            })
                        })()
                    }, []);
                    var Z = (0, ey.useCallback)(function() {
                            nL(n, t);
                            var e = nj(null != u.launchData ? String(u.launchData) : void 0);
                            nk(n, r, a, i, u, e, c)
                        }, [n, t, u, c, r, a, i]),
                        Y = uJ(t, Z, P),
                        J = Y.doGameLaunchWithPlayableUxTreatment,
                        X = Y.playableUxTreatmentModal;
                    return void 0 !== C || void 0 !== v && v ? (0, nH.jsxs)(eg().Fragment, {
                        children: [(0, nH.jsxs)(rl, {
                            "data-testid": "play-button",
                            variant: "Emphasis",
                            style: rh,
                            className: nz()(rf(h), m),
                            onClick: function(e) {
                                return em(function() {
                                    var t;
                                    return ev(this, function(r) {
                                        var a, i, l, u;
                                        switch (r.label) {
                                            case 0:
                                                if (e.preventDefault(), e.stopPropagation(), o !== ej.Playable) return [3, 7];
                                                if (O && S && rc().getAllValuesForLayer("SocialVoice.VoiceUpsell").then(function() {
                                                        rc().logLayerExposure("SocialVoice.VoiceUpsell")
                                                    }).catch(function() {
                                                        console.error("error logging exposure event in play-join")
                                                    }), !C) return [3, 2];
                                                return [4, em(function() {
                                                    var e, t;
                                                    return ev(this, function(n) {
                                                        try {
                                                            return t = (e = n_()) ? e.startVerificationFlow() : e6("OpenIdentityVerificationModal", function(e) {
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
                                                return (t = tn.apply(void 0, [r.sent(), 2]))[0], t[1] && T(!1), [3, 6];
                                            case 2:
                                                if (!L) return [3, 4];
                                                return [4, (a = null == j || j, i = null != W && W, em(function() {
                                                    var e, t;
                                                    return ev(this, function(n) {
                                                        try {
                                                            return t = (e = n_()) ? e.showVoiceOptInOverlay(a, i) : e6("OpenVoiceOptInOverlay", function(e) {
                                                                return {
                                                                    closeCallback: function(t) {
                                                                        e(t)
                                                                    },
                                                                    requireExplicitVoiceConsent: a,
                                                                    useVoiceUpsellV2Design: i
                                                                }
                                                            }, !1), [2, t]
                                                        } catch (e) {
                                                            return [2, !1]
                                                        }
                                                    })
                                                })())];
                                            case 3:
                                                return r.sent() && B(!1), [3, 6];
                                            case 4:
                                                if (!U) return [3, 6];
                                                return [4, (l = null == j || j, u = null == G || G, em(function() {
                                                    var e, t;
                                                    return ev(this, function(n) {
                                                        try {
                                                            return t = (e = n_()) ? e.showAvatarVideoOptInOverlay(l, u) : e6("OpenCameraOptInOverlay", function(e) {
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
                                                r.sent() && D(!1), r.label = 6;
                                            case 6:
                                                return J(), [3, 8];
                                            case 7:
                                                o === ej.GuestProhibited && (K ? ru.navigateToLoginWithRedirect() : nO(n, c)), r.label = 8;
                                            case 8:
                                                return E && E(), [2]
                                        }
                                    })
                                })()
                            },
                            children: [!(void 0 !== b && b) && (0, nH.jsx)("span", {
                                className: void 0 === d ? "icon-common-play" : d
                            }), g && (0, nH.jsx)("span", {
                                className: "play-button-text",
                                children: g
                            })]
                        }), (0, nH.jsx)("div", {
                            id: "id-verification-container"
                        }), X]
                    }) : (0, nH.jsx)(a1, {
                        buttonClassName: m,
                        buttonWidth: h
                    })
                },
                u5 = function(e, t) {
                    var n = t.playabilityStatus,
                        r = t.shouldShowVpcPlayButtonUpsells,
                        a = t.shouldShowNoticeAgreementIfPlayable,
                        i = t.unplayableDisplayText;
                    if (void 0 !== n) {
                        if (n === ej.Playable && a) return {
                            message: e(eH),
                            testId: "play-contextual-message"
                        };
                        if (i) return {
                            message: i,
                            testId: "play-server-message"
                        };
                        if (n !== ej.ContextualPlayabilityCoreGated && nB(n, r)) return {
                            message: e(Object.hasOwn(eF, n) ? eF[n] : eF[ej.UnplayableOtherReason]),
                            testId: "play-error"
                        }
                    }
                },
                u4 = window.Roblox["core-scripts"].util.elementVisibility,
                u6 = function(e, t) {
                    var n = t.universeId,
                        r = t.playabilityStatus,
                        a = t.pageContext,
                        i = t.attributionId,
                        o = t.contextualMessage,
                        l = (0, ey.useRef)(!1);
                    (0, ey.useEffect)(function() {
                        l.current = !1
                    }, [n, r, a, i, o]), (0, ey.useEffect)(function() {
                        if (e.current && !l.current && o) {
                            var t = null;
                            return t = (0, u4.observeVisibility)({
                                    element: e.current,
                                    threshold: .5
                                }, function(e) {
                                    e && !l.current && (l.current = !0, (0, e0.sendEventWithTarget)("playButtonContextualMessageImpression", a, {
                                        universeId: n,
                                        playabilityStatus: r,
                                        contextualMessage: o,
                                        attributionId: i
                                    }), null == t || t(), t = null)
                                }),
                                function() {
                                    null == t || t()
                                }
                        }
                    }, [e, n, r, a, i, o])
                };

            function u8(e) {
                var t = new(ef()).Deferred;
                return eh.Hybrid.Game.launchGame(e, function() {
                    t.resolve(e)
                }), t
            }
            var u7 = {
                isJoinAttemptIdEnabled: !1,
                joinMultiplayerGame: function(e) {
                    var t = !0 === e.isPlayTogetherGame,
                        n = {
                            requestType: eh.Hybrid.Game.LAUNCH_MODES.SIMPLE_GAME,
                            placeId: e.placeId.toString(),
                            isPlayTogetherGame: t,
                            browserTrackerId: eh.Cookies.getBrowserTrackerId()
                        };
                    return e.joinAttemptId && (n.joinAttemptId = e.joinAttemptId), e.joinAttemptOrigin && (n.joinAttemptOrigin = e.joinAttemptOrigin), u8(n)
                },
                followPlayerIntoGame: function(e) {
                    var t = {
                        requestType: eh.Hybrid.Game.LAUNCH_MODES.FOLLOW_USER,
                        userId: e.userId.toString(),
                        browserTrackerId: eh.Cookies.getBrowserTrackerId()
                    };
                    return e.joinAttemptId && (t.joinAttemptId = e.joinAttemptId), e.joinAttemptOrigin && (t.joinAttemptOrigin = e.joinAttemptOrigin), u8(t)
                },
                joinGameInstance: function(e) {
                    var t = !0 === e.isPlayTogetherGame,
                        n = {
                            requestType: eh.Hybrid.Game.LAUNCH_MODES.GAME_INSTANCE,
                            placeId: e.placeId.toString(),
                            instanceId: e.gameId,
                            isPlayTogetherGame: t,
                            browserTrackerId: eh.Cookies.getBrowserTrackerId()
                        };
                    return e.joinAttemptId && (n.joinAttemptId = e.joinAttemptId), e.joinAttemptOrigin && (n.joinAttemptOrigin = e.joinAttemptOrigin), u8(n)
                },
                joinPrivateGame: function(e) {
                    var t = {
                        requestType: eh.Hybrid.Game.LAUNCH_MODES.PRIVATE_SERVER,
                        placeId: e.placeId.toString(),
                        accessCode: e.accessCode,
                        browserTrackerId: eh.Cookies.getBrowserTrackerId()
                    };
                    return e.joinAttemptId && (t.joinAttemptId = e.joinAttemptId), e.joinAttemptOrigin && (t.joinAttemptOrigin = e.joinAttemptOrigin), u8(t)
                },
                playTogetherGame: function(e) {
                    var t = {
                        requestType: eh.Hybrid.Game.LAUNCH_MODES.SIMPLE_GAME,
                        placeId: e.placeId.toString(),
                        conversationId: e.conversationId.toString(),
                        browserTrackerId: eh.Cookies.getBrowserTrackerId()
                    };
                    return e.joinAttemptId && (t.joinAttemptId = e.joinAttemptId), e.joinAttemptOrigin && (t.joinAttemptOrigin = e.joinAttemptOrigin), u8(t)
                }
            };
            ef()(document).ready(function() {
                eu = new eh.TranslationResourceProvider().getTranslationResource("Feature.GameLaunchGuestMode")
            });
            var u9 = {
                    restrictGuests: function(e) {
                        var t = new(ef()).Deferred;
                        return eh.CurrentUser.isAuthenticated ? t.resolve(e) : eh.Dialog.open({
                            titleText: eu.get("Heading.Dialog.SignUpOrLogin"),
                            bodyContent: eu.get("Description.Dialog.ConnectionsSignUpOrLogin"),
                            cssClass: "soli-modal",
                            acceptColor: eh.Dialog.green,
                            acceptText: eu.get("Action.Dialog.SignUp"),
                            declineText: eu.get("Action.Dialog.Login"),
                            onDecline: function() {
                                eh.FormEvents && eh.FormEvents.SendInteractionClick("gameDetails", "gameLaunch_login");
                                var e = "/login?returnurl=" + encodeURIComponent(window.location.origin + window.location.pathname + window.location.search);
                                window.location.href = eh.Endpoints ? eh.Endpoints.getAbsoluteUrl(e) : e
                            },
                            onAccept: function() {
                                var e;
                                eh.FormEvents && eh.FormEvents.SendInteractionClick("gameDetails", "gameLaunch_signup"), e = "/CreateAccount?returnurl=" + encodeURIComponent(window.location.origin + window.location.pathname + window.location.search), window.location.href = eh.Endpoints ? eh.Endpoints.getAbsoluteUrl(e) : e
                            }
                        }), t
                    }
                },
                se = window.CoreUtilities,
                st = {
                    gameLaunchInterface: null,
                    gameLaunchLogger: null,
                    initialized: new Promise(function(e) {
                        es = e
                    })
                };

            function sn(e, t, n) {
                var r = eM(eE({}, e), {
                    joinAttemptId: null != t ? t : se.uuidService.generateRandomUuid()
                });
                return n && (r.joinAttemptOrigin = n), r
            }

            function sr(e, t, n) {
                var r, a, i = arguments.length > 3 && void 0 !== arguments[3] && arguments[3],
                    o = arguments.length > 4 && void 0 !== arguments[4] && arguments[4],
                    l = arguments.length > 5 && void 0 !== arguments[5] && arguments[5],
                    u = arguments.length > 6 && void 0 !== arguments[6] ? arguments[6] : "",
                    s = arguments.length > 7 && void 0 !== arguments[7] ? arguments[7] : "";
                i && o && (r = {
                    url: "".concat(eh.EnvironmentUrls.gameJoinApi, "/v1/team-create-preemptive"),
                    withCredentials: !0,
                    headers: {
                        Accept: "application/json",
                        "Content-Type": "application/json"
                    }
                }, a = {
                    gameJoinAttemptId: se.uuidService.generateRandomUuid(),
                    placeId: e
                }, se.httpService.post(r, a)), st.gameLaunchInterface.editGameInStudio(e, t, n, i && l, u, s)
            }

            function sa(e, t, n, r, a, i, o, l) {
                var u = {
                    placeId: e,
                    launchData: null == i ? void 0 : i.launchData,
                    eventId: null == i ? void 0 : i.eventId,
                    isPlayTogetherGame: !0 === n,
                    referredByPlayerId: o
                };
                return !0 === l && (u.isEarlyTesting = "true"), st.gameLaunchInterface.isJoinAttemptIdEnabled && (u = sn(u, r, a)), u9.restrictGuests(u).then(function(e) {
                    return st.gameLaunchInterface.joinMultiplayerGame(e, null == i ? void 0 : i.getPlayOnWeb)
                })
            }
            ef().fn.bindGameLaunch = function() {
                return this.find(".VisitButtonPlayGLI").click(function() {
                    var e = ef()(this);
                    sa(e.attr("placeid"), e.data("is-membership-level-ok"))
                }), this.find(".VisitButtonEditGLI").click(function() {
                    var e = ef()(this);
                    sr(e.attr("placeid"), e.data("universeid"), !!e.data("allowupload"))
                }), this
            }, ef()(document).ready(function() {
                ef()("body").bindGameLaunch()
            }), Object.assign(st, {
                authenticationChecker: u9,
                joinMultiplayerGame: sa,
                openStudio: function() {
                    st.gameLaunchInterface.openStudio()
                },
                openPluginInStudio: function(e) {
                    st.gameLaunchInterface.openPluginInStudio(e)
                },
                editGameInStudio: sr,
                followPlayerIntoGame: function(e, t, n) {
                    var r = {
                        userId: e
                    };
                    return st.gameLaunchInterface.isJoinAttemptIdEnabled && (r = sn(r, t, n)), u9.restrictGuests(r).then(st.gameLaunchInterface.followPlayerIntoGame)
                },
                joinGameInstance: function(e, t, n, r, a, i, o, l) {
                    var u = {
                        placeId: e,
                        gameId: t,
                        isPlayTogetherGame: !0 === r,
                        referredByPlayerId: o
                    };
                    return st.gameLaunchInterface.isJoinAttemptIdEnabled && (u = sn(u, a, i)), u9.restrictGuests(u).then(function(e) {
                        return st.gameLaunchInterface.joinGameInstance(e, l)
                    })
                },
                joinPrivateGame: function(e, t, n, r, a, i) {
                    return em(function() {
                        var o;
                        return ev(this, function(l) {
                            switch (l.label) {
                                case 0:
                                    return [4, st.initialized];
                                case 1:
                                    return l.sent(), o = {
                                        placeId: e,
                                        accessCode: t,
                                        linkCode: n
                                    }, st.gameLaunchInterface.isJoinAttemptIdEnabled && (o = sn(o, r, a)), [2, st.gameLaunchInterface.joinPrivateGame(o, i)]
                            }
                        })
                    })()
                },
                playTogetherGame: function(e, t, n, r) {
                    var a = {
                        placeId: e,
                        conversationId: t
                    };
                    return st.gameLaunchInterface.isJoinAttemptIdEnabled && (a = sn(a, n, r)), u9.restrictGuests(a).then(st.gameLaunchInterface.playTogetherGame)
                },
                setGameLaunchInterface: function(e) {
                    st.gameLaunchInterface = e, es()
                },
                setGameLaunchLogger: function(e) {
                    st.gameLaunchLogger = e
                },
                tryAssetInStudio: function(e) {
                    st.gameLaunchInterface.tryAssetInStudio(e)
                },
                isJoinAttemptIdEnabled: function() {
                    var e;
                    return null == (e = st.gameLaunchInterface) ? void 0 : e.isJoinAttemptIdEnabled
                },
                startClientAttemptedEvent: "startClientAttempted",
                startClientFailedEvent: "startClientFailed",
                startClientSucceededEvent: "startClientSucceeded",
                beginInstallEvent: "beginInstall",
                successfulInstallEvent: "successfulInstall",
                manualDownloadEvent: "manualDownload"
            });
            var si = function(e) {
                    var t, n = "".concat(e, "="),
                        r = null == (t = document.cookie.split("; ").find(function(e) {
                            return e.startsWith(n)
                        })) ? void 0 : t.slice(n.length);
                    return null == r ? null : {
                        name: e,
                        value: decodeURIComponent(r)
                    }
                },
                so = function() {
                    var e = si("RBXcb");
                    if (null == e || "" === e.value) return !1;
                    var t = e.value.split("&").find(function(e) {
                        return "GoogleAnalytics" === e.split("=")[0]
                    });
                    return "true" === (null == t ? void 0 : t.split("=")[1])
                },
                sl = {
                    lastContext: "unknown",
                    contextCategories: {
                        joinUser: "JoinUser"
                    }
                };

            function su(e, t, n, r, a, i) {
                var o, l, u;
                null !== t && "" !== t && "unknown" !== t && (sl.lastContext = t), eh.EventStream.SendEvent(e, sl.lastContext, eE({
                    lType: "protocol",
                    pid: n,
                    refuid: r,
                    pg: (o = window.location.pathname.toLowerCase(), l = "profile", -1 !== (u = o.lastIndexOf(l)) && o.length === u + l.length ? l : 0 === o.indexOf("/develop") ? "develop" : 0 === o.indexOf("/discover") ? "games" : "gameDetail"),
                    joinAttemptId: a
                }, null != i && {
                    actionType: i
                }))
            }
            Object.assign(sl, {
                SendGamePlayIntent: function(e, t, n, r, a) {
                    su("gamePlayIntent", e, t, n, r, a), ef()(document).trigger("playButton:gamePlayIntent")
                },
                SendDevelopIntent: function(e, t) {
                    su("developIntent", e, t)
                },
                SendInstallBegin: function(e, t) {
                    su("installBegin", e, t)
                },
                SendInstallSuccess: function(e, t) {
                    su("installSuccess", e, t)
                },
                SendClientStartAttempt: function(e, t) {
                    su("clientStartAttempt", e, t)
                },
                SendClientStartSuccessWeb: function(e, t) {
                    su("clientStartSuccessWeb", e, t)
                },
                SendManualDownloadClick: function(e, t) {
                    su("manualDownload", e, t)
                }
            });
            var ss = {
                    logToConsoleEnabled: !1,
                    logToGAEnabled: !0,
                    logToEphemeralCountersEnabled: !0
                },
                sc = {};
            sc[st.startClientAttemptedEvent] = ["GameLaunchAttempt_<os>", "GameLaunchAttempt_<os>_<launchmethod>"], sc[st.startClientSucceededEvent] = ["GameLaunchSuccessWeb_<os>", "GameLaunchSuccessWeb_<os>_<launchmethod>"];
            var sd = {};
            eh.GaEventSettings.gaLaunchAttemptAndLaunchSuccessEnabled && (sd[st.startClientAttemptedEvent] = "Launch Attempt", sd[st.startClientSucceededEvent] = "Launch Success"), sd[st.beginInstallEvent] = "Install Begin", sd[st.successfulInstallEvent] = "Install Success", sd[st.manualDownloadEvent] = "Manual Download";
            var sf = {};

            function sh(e) {
                ss.logToConsoleEnabled && console.log(e)
            }

            function sp(e, t) {
                if (ss.logToEphemeralCountersEnabled) {
                    var n, r = ef()("#PlaceLauncherStatusPanel").data("os-name");
                    "Windows" === r && (r = "Win32");
                    var a = e;
                    a = (a = a.replace("<os>", r)).replace("<launchmethod>", t), (null == (n = window.EventTracker) ? void 0 : n.fireEvent) && window.EventTracker.fireEvent(a)
                }
            }

            function sm(e, t, n, r) {
                so() && void 0 !== window.GoogleAnalyticsEvents && ss.logToGAEnabled && window.GoogleAnalyticsEvents.FireEvent && window.GoogleAnalyticsEvents.FireEvent([e, t, n, r])
            }

            function sv(e, t) {
                sh("".concat(e.type, ": ").concat(JSON.stringify(t))), sc[e.type] && ef().each(sc[e.type], function(e, n) {
                    sp(n, t.launchMethod)
                }), sd[e.type] && sm(t.launchMethod, sd[e.type], t.params.launchMode, 0), sf[e.type] && sf[e.type](null, t.params.placeId)
            }
            sf[st.startClientAttemptedEvent] = sl.SendClientStartAttempt, sf[st.startClientSucceededEvent] = sl.SendClientStartSuccessWeb, sf[st.beginInstallEvent] = sl.SendInstallBegin, sf[st.successfulInstallEvent] = sl.SendInstallSuccess, sf[st.manualDownloadEvent] = sl.SendManualDownloadClick, Object.assign(ss, {
                logToConsole: sh,
                logToEphemeralCounters: sp,
                logToGA: sm
            }), ef()(document).ready(function() {
                var e = [st.startClientAttemptedEvent, st.startClientFailedEvent, st.startClientSucceededEvent, st.beginInstallEvent, st.successfulInstallEvent, st.manualDownloadEvent];
                ef()(st).on(e.join(" "), sv)
            });
            var sy = function() {
                    var e = "click";
                    ef()("body").on(e, ".VisitButtonPlay, .VisitButtonPlayGLI", function() {
                        var e, t = ef()(this);
                        if ((t.hasClass("VisitButtonPlay") || t.hasClass("VisitButtonPlayGLI")) && (e = "PlayButton"), e) {
                            var n = ef()(this).attr("placeid"),
                                r = eh.UrlParser ? eh.UrlParser.getParameterValueByName("rbxp") : null;
                            sl.SendGamePlayIntent(e, n, r)
                        }
                    }), ef()("body").on(e, ".VisitButtonEdit, .VisitButtonEditGLI", function() {
                        var e = ef()(this).attr("placeid");
                        sl.SendDevelopIntent("Edit", e)
                    }), ef()("#rbx-running-games").on(e, ".rbx-game-server-item .rbx-game-server-join", function() {
                        var e = ef()(this).data("placeid");
                        e && sl.SendGamePlayIntent("JoinInstance", e)
                    }), ef()("#rbx-friends-running-games").on(e, ".rbx-friends-game-server-item .rbx-friends-game-server-join", function() {
                        var e = ef()(this).data("placeid");
                        e && sl.SendGamePlayIntent("JoinInstance", e)
                    }), ef()("#game-instances").on(e, "#rbx-vip-servers .rbx-vip-server-item .rbx-vip-server-join", function() {
                        var e = ef()(this).data("placeid");
                        e && sl.SendGamePlayIntent("PrivateServer", e)
                    })
                },
                sg = window.Roblox["core-scripts"].react,
                sb = "u" > typeof window ? window.navigator.userAgent : "",
                sw = /Mac OS X/i.test(sb),
                sE = /Windows NT/i.test(sb);
            /Linux/i.test(sb) && /Android/i.test(sb);
            var sP = /Android/i.test(sb),
                sx = /iPhone|iPad|iPod/i.test(sb),
                sS = function(e) {
                    var t = e.alt,
                        n = void 0 === t ? "App Icon" : t,
                        r = e.className,
                        a = e.title,
                        i = e.style;
                    return eg().createElement("div", {
                        className: "app-icon-bluebg app-icon-".concat(sw ? "mac" : sE ? "windows" : sx ? "ios" : sP ? "android" : "windows", " ").concat(void 0 === r ? "" : r),
                        role: "img",
                        "aria-label": n,
                        title: (void 0 === a ? "" : a) || n,
                        style: void 0 === i ? {} : i
                    })
                },
                sI = ["Feature.GameLaunchGuestMode", "Common.VisitGame", "CommonUI.Controls", "Feature.ExperienceDetails", "Feature.DownloadLanding"],
                sA = ["Common.VisitGame", "CommonUI.Controls"],
                sC = {
                    Unknown: 1,
                    WindowsDirectDownload: 2,
                    WindowsStore: 3,
                    MacDirectDownload: 4,
                    AppleAppStore: 5,
                    GooglePlayStore: 6,
                    AmazonAppStore: 7
                },
                sT = {
                    downloadPageHeader: "Heading.DownloadPage",
                    appStoreLinksHeader: "Heading.AppStoreLinks",
                    windowsDownloadLabel: "Action.DownloadWindowsApp",
                    windowsDownloadLink: (0, e$.getAbsoluteUrl)("/download/client?os=win"),
                    macDownloadLabel: "Action.DownloadMacApp",
                    macDownloadLink: (0, e$.getAbsoluteUrl)("/download/client?os=mac"),
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
                sk = (ew(ec = {}, sC.WindowsDirectDownload, {
                    href: sT.windowsDownloadLink,
                    title: sT.windowsDownloadLabel,
                    name: "windows",
                    icon: "icon-filled-microsoft",
                    legacyIcon: "icon-logo-win",
                    isDirectDownload: !0
                }), ew(ec, sC.MacDirectDownload, {
                    href: sT.macDownloadLink,
                    title: sT.macDownloadLabel,
                    name: "mac",
                    icon: "icon-filled-apple",
                    legacyIcon: "icon-logo-apple",
                    isDirectDownload: !0
                }), ew(ec, sC.AmazonAppStore, {
                    href: sT.amazonStoreLink,
                    title: sT.androidAppDownloadLabel,
                    name: "amazonStore",
                    icon: "icon-filled-amazon",
                    legacyIcon: "icon-logo-android",
                    isDirectDownload: !1
                }), ew(ec, sC.GooglePlayStore, {
                    href: sT.googlePlayStoreLink,
                    title: sT.androidAppDownloadLabel,
                    name: "android",
                    icon: "icon-filled-android",
                    legacyIcon: "icon-logo-android",
                    isDirectDownload: !1
                }), ew(ec, sC.AppleAppStore, {
                    href: sT.appleAppStoreLink,
                    title: sT.iOSDownloadLabel,
                    name: "iOS",
                    icon: "icon-filled-apple",
                    legacyIcon: "icon-logo-apple",
                    isDirectDownload: !1
                }), ec),
                sO = function(e) {
                    var t, n = e.translate;
                    return (0, nH.jsxs)(eg().Fragment, {
                        children: [(0, nH.jsxs)("div", {
                            className: "flex flex-col gap-small",
                            children: [(0, nH.jsx)("h3", {
                                className: "text-label-large content-emphasis padding-none",
                                children: n("Heading.MobileAppDownloadOption")
                            }), (0, nH.jsx)("p", {
                                className: "text-body-medium",
                                children: n("Label.MobileAppQrCode")
                            })]
                        }), (0, nH.jsx)("div", {
                            className: "flex grow justify-center items-center bg-shift-100 radius-medium padding-x-large",
                            children: (0, nH.jsx)("div", {
                                className: "radius-medium padding-small bg-[white]",
                                children: (0, nH.jsx)("img", {
                                    className: "size-2100",
                                    src: "string" == typeof(t = "https://images.rbxcdn.com/6674b8e189bf79c6.png") ? t : t.src,
                                    alt: ""
                                })
                            })
                        })]
                    })
                },
                s_ = function() {
                    function e(t, n) {
                        th(this, e), ew(this, "url", void 0), ew(this, "searchParams", void 0), this.url = t, this.searchParams = n
                    }
                    return nt(e, [{
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
                sN = function(e) {
                    return nV(new URLSearchParams(e))
                },
                sL = function(e) {
                    return Array.isArray(e)
                },
                sB = function(e) {
                    return String(e)
                },
                sR = ["__proto__", "prototype", "constructor"],
                sU = function(e) {
                    return sN(tx(e.entries()).filter(function(e) {
                        var t = tn(e, 2),
                            n = t[0],
                            r = t[1];
                        return !sR.includes(n) && !sR.includes(r)
                    }))
                },
                sD = function() {
                    function e(t) {
                        th(this, e), ew(this, "searchParams", void 0), this.searchParams = t
                    }
                    return nt(e, [{
                        key: "resolveName",
                        value: function(e, t) {
                            if ("caseSensitive" === t || this.searchParams.has(e)) return e;
                            var n = e.toLowerCase(),
                                r = !0,
                                a = !1,
                                i = void 0;
                            try {
                                for (var o, l = this.searchParams.keys()[Symbol.iterator](); !(r = (o = l.next()).done); r = !0) {
                                    var u = o.value;
                                    if (u.toLowerCase() === n) return u
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
                            return tx(this.searchParams.entries()).filter(function(e) {
                                return tn(e, 1)[0].toLowerCase() === n
                            }).map(function(e) {
                                return tn(e, 2)[1]
                            })
                        }
                    }, {
                        key: "has",
                        value: function(e, t) {
                            var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "caseInsensitive";
                            return this.searchParams.has(this.resolveName(e, n), void 0 === t ? void 0 : sB(t))
                        }
                    }, {
                        key: "copyAndAppend",
                        value: function(t, n) {
                            var r = sN(this.searchParams);
                            return r.append(t, sB(n)), e.fromUnique(r)
                        }
                    }, {
                        key: "copyAndAppendAll",
                        value: function(t) {
                            var n = (0, tf._)(t, URLSearchParams) || (0, tf._)(t, e) || sL(t) ? t : Object.entries(t);
                            return e.new(tx(this.searchParams).concat(tx(n)))
                        }
                    }, {
                        key: "copyAndSet",
                        value: function(t, n) {
                            var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "caseInsensitive";
                            if ("caseSensitive" === r) {
                                var a = sN(this.searchParams);
                                return a.set(t, sB(n)), e.fromUnique(a)
                            }
                            var i = t.toLowerCase(),
                                o = [],
                                l = !1,
                                u = !0,
                                s = !1,
                                c = void 0;
                            try {
                                for (var d, f = this.searchParams.entries()[Symbol.iterator](); !(u = (d = f.next()).done); u = !0) {
                                    var h = tn(d.value, 2),
                                        p = h[0],
                                        m = h[1];
                                    p.toLowerCase() !== i ? o.push([p, m]) : l || (o.push([t, sB(n)]), l = !0)
                                }
                            } catch (e) {
                                s = !0, c = e
                            } finally {
                                try {
                                    u || null == f.return || f.return()
                                } finally {
                                    if (s) throw c
                                }
                            }
                            return l || o.push([t, sB(n)]), e.fromUnique(sN(o))
                        }
                    }, {
                        key: "copyAndDelete",
                        value: function(t, n) {
                            var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "caseInsensitive",
                                a = t.toLowerCase(),
                                i = void 0 === n ? void 0 : sB(n),
                                o = function(e) {
                                    var n = tn(e, 2),
                                        o = n[0],
                                        l = n[1];
                                    return ("caseSensitive" === r ? o === t : o.toLowerCase() === a) && (void 0 === i || l === i)
                                },
                                l = tx(this.searchParams.entries());
                            return l.some(o) ? e.fromUnique(sN(l.filter(function(e) {
                                return !o(e)
                            }))) : this
                        }
                    }, {
                        key: "toSorted",
                        value: function() {
                            var t = sN(this.searchParams);
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
                            if ((0, tf._)(t, e)) return t;
                            var r = sN((sL(t) ? t : Object.entries(t)).map(function(e) {
                                var t = tn(e, 2);
                                return [t[0], sB(t[1])]
                            }));
                            return e.fromUnique(n ? sU(r) : r)
                        }
                    }, {
                        key: "fromURLSearchParams",
                        value: function(t) {
                            var n = !(arguments.length > 1) || void 0 === arguments[1] || arguments[1];
                            return e.fromUnique(n ? sU(t) : sN(t))
                        }
                    }, {
                        key: "parse",
                        value: function(t) {
                            var n = !(arguments.length > 1) || void 0 === arguments[1] || arguments[1],
                                r = sN(t);
                            return e.fromUnique(n ? sU(r) : r)
                        }
                    }]), e
                }();
            ew(sD, "empty", sD.fromUnique(sN(""))), ty(Error), ty(Error);
            var sM = function(e) {
                    return nV(new URL(e))
                },
                sj = function(e) {
                    function t(e, n) {
                        return th(this, t), td(this, t, [e, n])
                    }
                    return tm(t, e), nt(t, [{
                        key: "with",
                        value: function(e) {
                            var n = e.scheme,
                                r = e.host,
                                a = e.port,
                                i = e.path,
                                o = e.searchParams,
                                l = e.fragment;
                            if (null == n && null == r && null == a && null == i && null == o && null == l) return this;
                            var u = sM(this.url);
                            if (null != n && (u.protocol = n), null != r && (u.hostname = r), null != a && (u.port = "number" == typeof a ? a.toString() : a), null != i && (u.pathname = i), null != l && (u.hash = l), null != o) {
                                var s = sD.new(o);
                                return u.search = s.toString(), new t(u, s)
                            }
                            return new t(u, this.searchParams)
                        }
                    }, {
                        key: "withScheme",
                        value: function(e) {
                            var n = sM(this.url);
                            return n.protocol = e, new t(n, this.searchParams)
                        }
                    }, {
                        key: "withHost",
                        value: function(e) {
                            var n = sM(this.url);
                            return n.hostname = e, new t(n, this.searchParams)
                        }
                    }, {
                        key: "withPort",
                        value: function(e) {
                            var n = sM(this.url);
                            return n.port = "number" == typeof e ? e.toString() : e, new t(n, this.searchParams)
                        }
                    }, {
                        key: "withPath",
                        value: function(e) {
                            var n = sM(this.url);
                            return n.pathname = e, new t(n, this.searchParams)
                        }
                    }, {
                        key: "withSearchParams",
                        value: function(e) {
                            var n = sD.new(e),
                                r = sM(this.url);
                            return r.search = n.toString(), new t(r, n)
                        }
                    }, {
                        key: "withSearchParamsAppended",
                        value: function(e) {
                            var n = this.searchParams.copyAndAppendAll(e),
                                r = sM(this.url);
                            return r.search = n.toString(), new t(r, n)
                        }
                    }, {
                        key: "withFragment",
                        value: function(e) {
                            var n = sM(this.url);
                            return n.hash = e, new t(n, this.searchParams)
                        }
                    }], [{
                        key: "new",
                        value: function(e) {
                            e.password = "", e.username = "";
                            var n = sD.internalFromUniqueURLSearchParams(nV(e.searchParams));
                            return new t(e, n)
                        }
                    }, {
                        key: "fromURL",
                        value: function(e) {
                            return t.new(sM(e))
                        }
                    }, {
                        key: "parse",
                        value: function(e) {
                            try {
                                return ni(t.new(nV(new URL(e))))
                            } catch (e) {
                                return no(e)
                            }
                        }
                    }]), t
                }(s_),
                sF = function(e) {
                    var t, n = new URLSearchParams(document.location.search).get("downloadType");
                    if (null != n) {
                        var r = sC[n];
                        if (null != r) return r
                    }
                    if (!e) return sC.Unknown;
                    var a = e4.getDeviceMeta();
                    return (null == a ? void 0 : a.isIosDevice) ? sC.AppleAppStore : (t = e, /Kindle|Silk|KFAPW|KFARWI|KFASWI|KFFOWI|KFJW|KFMEWI|KFOT|KFSAW|KFSOWI|KFTBW|KFTHW|KFTT|WFFOWI|KFAPWI/i.test(t)) ? sC.AmazonAppStore : (null == a ? void 0 : a.isAndroidDevice) ? sC.GooglePlayStore : e4.isMac() ? sC.MacDirectDownload : e4.isWindows() ? sC.WindowsDirectDownload : sC.Unknown
                },
                sH = function(e, t) {
                    (0, e0.sendEventWithTarget)(e0.eventTypes.formInteraction, "downloadV2", eE({
                        field: "".concat(e, "DownloadLink"),
                        aType: "click"
                    }, t ? {
                        source: t
                    } : {}))
                },
                sG = function(e) {
                    return Object.values(sC).some(function(t) {
                        return t === e
                    })
                },
                sz = function(e) {
                    if (null != e) {
                        if ("number" == typeof e) return sG(e) && sk[e] ? e : void 0;
                        var t = sC[e];
                        if (null != t && sk[t]) return t;
                        var n = Number(e);
                        if (Number.isInteger(n) && sG(n) && sk[n]) return n
                    }
                },
                sV = function(e) {
                    var t;
                    return null != (t = sz(e)) ? t : sF(navigator.userAgent)
                },
                sW = function() {
                    var e, t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        n = t.downloadTypeOverride,
                        r = t.translate,
                        a = sV(n),
                        i = sk[a];
                    if (i) {
                        var o = i.isDirectDownload ? i.href : null != (e = null == r ? void 0 : r(i.href)) ? e : i.href,
                            l = sj.parse(o);
                        if (!l.isErr()) return {
                            downloadType: a,
                            link: i,
                            isDirectDownload: i.isDirectDownload,
                            href: l.value,
                            icon: i.icon,
                            legacyIcon: i.legacyIcon
                        }
                    }
                },
                sq = function(e) {
                    var t = e.indexOf(".");
                    return t >= 0 ? (0, nH.jsxs)(eg().Fragment, {
                        children: [(0, nH.jsx)("span", {
                            children: e.substring(0, t + 1)
                        }), (0, nH.jsx)("span", {
                            children: e.substring(t + 1)
                        })]
                    }) : e
                },
                sK = "\x01LINK_START\x01",
                sZ = "\x01LINK_END\x01",
                sY = new RegExp("".concat(sK, "|").concat(sZ)),
                sJ = function() {
                    var e = tn(sI, 5),
                        t = e[0],
                        n = e[1],
                        r = e[2],
                        a = e[3],
                        i = e[4],
                        o = aJ(t),
                        l = aJ(n),
                        u = aJ(r),
                        s = aJ(a),
                        c = aJ(i);
                    return (0, ey.useMemo)(function() {
                        var e;
                        return e = [c, s, u, l, o],
                            function(t, n, r) {
                                var a = n && Object.fromEntries(Object.entries(n).filter(function(e) {
                                        return "string" == typeof e[1] || "number" == typeof e[1] || (0, tf._)(e[1], Date)
                                    })),
                                    i = e.find(function(e) {
                                        return e.has(t)
                                    });
                                return i ? i.dynamic(t, a) : null != r ? r : ""
                            }
                    }, [c, s, u, l, o])
                },
                sX = Error("client not started"),
                s$ = 0,
                sQ = function(e) {
                    var t = tn((0, ey.useState)(function() {
                            return s$ += 1
                        }), 1)[0],
                        n = (0, eb.useQuery)({
                            queryKey: ["client-status", t],
                            queryFn: function() {
                                return em(function() {
                                    return ev(this, function(t) {
                                        switch (t.label) {
                                            case 0:
                                                return [4, em(function() {
                                                    var e, t;
                                                    return ev(this, function(n) {
                                                        switch (n.label) {
                                                            case 0:
                                                                return [4, eS.get(ns(ex().matchmakingApi, "/v1/client-status"), nc, {
                                                                    credentials: "include"
                                                                })];
                                                            case 1:
                                                                return t = n.sent().getOrThrow().status, [2, null != (e = nd.find(function(e) {
                                                                    return e === t
                                                                })) ? e : "Unknown"]
                                                        }
                                                    })
                                                })()];
                                            case 1:
                                                if ("Unknown" === t.sent()) throw sX;
                                                return e(), [2, !0]
                                        }
                                    })
                                })()
                            },
                            retry: 2,
                            retryDelay: 2500
                        }),
                        r = n.data,
                        a = n.isError;
                    return void 0 === r && !a
                },
                s0 = function(e) {
                    var t = e.closeLabel,
                        n = e.title,
                        r = e.description,
                        a = e.button,
                        i = e.unmount;
                    return (0, nH.jsx)(oH, {
                        hasCloseAffordance: !0,
                        closeLabel: t,
                        isModal: !0,
                        open: !0,
                        size: "Medium",
                        onOpenChange: i,
                        children: (0, nH.jsxs)(oG, {
                            className: "download-dialog",
                            children: [(0, nH.jsxs)(oz, {
                                className: "flex flex-col items-center gap-xlarge",
                                children: [(0, nH.jsx)(sS, {
                                    className: "size-1600"
                                }), (0, nH.jsx)(oV, {
                                    className: "text-heading-small padding-x-xxlarge padding-y-none text-align-x-center",
                                    children: n
                                }), r && (0, nH.jsx)("p", {
                                    className: "text-body-medium text-align-x-center",
                                    children: r
                                })]
                            }), (0, nH.jsx)(oW, {
                                className: "flex",
                                children: a
                            })]
                        })
                    })
                },
                s1 = function(e) {
                    var t = e.download,
                        n = e.launchGame,
                        r = e.getPlayOnWeb,
                        a = e.unmount,
                        i = tn((0, ey.useState)(!1), 2),
                        o = i[0],
                        l = i[1],
                        u = sJ(),
                        s = sQ(a);
                    if (!o) {
                        if (r) {
                            var c = u("Action.Close");
                            if (s) return (0, nH.jsx)(s0, {
                                closeLabel: c,
                                title: u("PlayOnWebModal.Label.CheckingForRoblox", void 0, "Checking for Roblox..."),
                                button: (0, nH.jsx)(rl, {
                                    variant: "Emphasis",
                                    size: "Medium",
                                    className: "grow",
                                    isLoading: !0
                                }),
                                unmount: a
                            });
                            var d = r();
                            return d ? (0, nH.jsx)(s0, {
                                closeLabel: c,
                                title: u("PlayOnWebModal.Label.RobloxDidNotOpen", void 0, "Roblox didn't open?"),
                                description: u("PlayOnWebModal.Label.PlayInBrowserInstead", void 0, "You can play this game in your browser instead."),
                                button: (0, nH.jsx)(rl, {
                                    variant: "Emphasis",
                                    size: "Medium",
                                    className: "grow",
                                    onClick: function() {
                                        d(), a()
                                    },
                                    children: u("PlayButtonText.PlayOnWeb")
                                }),
                                unmount: a
                            }) : (0, nH.jsx)(s0, {
                                closeLabel: c,
                                title: u("Label.RobloxExciteToDownload"),
                                button: (0, nH.jsx)(rl, {
                                    variant: "Emphasis",
                                    size: "Medium",
                                    className: "grow",
                                    onClick: function() {
                                        return em(function() {
                                            var e;
                                            return ev(this, function(n) {
                                                switch (n.label) {
                                                    case 0:
                                                        try {
                                                            (e = sW()) && sH(e.link.name)
                                                        } catch (e) {}
                                                        return l(!0), [4, t()];
                                                    case 1:
                                                        return n.sent(), [2]
                                                }
                                            })
                                        })()
                                    },
                                    children: u("PlayOnWebModal.Action.Get", void 0, "Get")
                                }),
                                unmount: a
                            })
                        }
                        var f = u(s ? "Label.RobloxLoadingToPlay" : "Label.RobloxExciteToDownload");
                        return (0, nH.jsx)(oH, {
                            hasCloseAffordance: !0,
                            closeLabel: u("Action.Close"),
                            isModal: !0,
                            open: !0,
                            size: "Medium",
                            onOpenChange: a,
                            children: (0, nH.jsxs)(oG, {
                                className: "download-dialog",
                                children: [(0, nH.jsxs)(oz, {
                                    className: "flex flex-col items-center gap-xlarge",
                                    children: [(0, nH.jsx)(sS, {
                                        className: "size-1600"
                                    }), (0, nH.jsx)(oV, {
                                        className: "text-heading-small padding-x-xxlarge padding-y-none text-align-x-center flex flex-col",
                                        "aria-hidden": !0,
                                        children: s ? sq(f) : f
                                    })]
                                }), (0, nH.jsx)(oW, {
                                    className: "flex",
                                    children: s ? (0, nH.jsx)(rl, {
                                        variant: "Emphasis",
                                        size: "Medium",
                                        className: "grow",
                                        isLoading: !0
                                    }) : (0, nH.jsx)(rl, {
                                        variant: "Emphasis",
                                        size: "Medium",
                                        className: "grow",
                                        onClick: function() {
                                            return em(function() {
                                                var e;
                                                return ev(this, function(n) {
                                                    switch (n.label) {
                                                        case 0:
                                                            try {
                                                                (e = sW()) && sH(e.link.name)
                                                            } catch (e) {}
                                                            return l(!0), [4, t()];
                                                        case 1:
                                                            return n.sent(), [2]
                                                    }
                                                })
                                            })()
                                        },
                                        children: u("Title.DownloadPage")
                                    })
                                })]
                            })
                        })
                    }
                    var h = (0, e4.isMac)(),
                        p = h ? (0, e$.getAbsoluteUrl)("/download/client?os=mac") : (0, e$.getAbsoluteUrl)("/download/client?os=win");
                    return (0, nH.jsx)(oH, {
                        hasCloseAffordance: !0,
                        closeLabel: u("Action.Close"),
                        isModal: !0,
                        open: !0,
                        size: "Large",
                        onOpenChange: a,
                        children: (0, nH.jsx)(oG, {
                            className: "install-dialog",
                            children: (0, nH.jsx)(oz, {
                                className: "content-default",
                                children: (0, nH.jsxs)("div", {
                                    className: "flex flex-col gap-xlarge padding-xlarge",
                                    children: [(0, nH.jsxs)("div", {
                                        className: "flex flex-col gap-xsmall",
                                        children: [(0, nH.jsx)(oV, {
                                            className: "text-heading-medium content-emphasis padding-none",
                                            children: u("Heading.DownloadConfirmation")
                                        }), (0, nH.jsx)("p", {
                                            className: "text-body-large",
                                            dangerouslySetInnerHTML: {
                                                __html: "".concat(u("Label.FollowInstallSteps"), " ").concat(u("Label.RetryDownload", {
                                                    startLink: '<a href="'.concat(p, '" class="download-link-underline">'),
                                                    endLink: "</a>"
                                                }))
                                            }
                                        })]
                                    }), (0, nH.jsx)("div", {}), " ", (0, nH.jsxs)("div", {
                                        className: "flex gap-xxlarge",
                                        children: [(0, nH.jsxs)("section", {
                                            className: "flex flex-col fill basis-0 gap-large",
                                            children: [(0, nH.jsx)("h3", {
                                                className: "text-title-large content-emphasis padding-none",
                                                children: u("Heading.InstallInstructions")
                                            }), (0, nH.jsxs)("ol", {
                                                className: "download-instructions-list flex flex-col gap-xlarge margin-none padding-left-large text-body-medium",
                                                children: [(0, nH.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    dangerouslySetInnerHTML: {
                                                        __html: u(h ? "Response.Dialog.MacFirstInstruction" : "Response.Dialog.WindowsFirstInstruction", {
                                                            startBold: "<b>",
                                                            endBold: "</b>"
                                                        })
                                                    }
                                                }), (0, nH.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    dangerouslySetInnerHTML: {
                                                        __html: u("Response.Dialog.SecondInstruction", {
                                                            startBold: "<b>",
                                                            endBold: "</b>"
                                                        })
                                                    }
                                                }), (0, nH.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    children: u("Response.Dialog.ThirdInstruction")
                                                }), (0, nH.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    children: function() {
                                                        var e = u("Response.Dialog.FourthInstruction", {
                                                                startLink: sK,
                                                                endLink: sZ
                                                            }),
                                                            t = e.split(sY);
                                                        if (t.length < 3) return e;
                                                        var r = tn(t, 3),
                                                            a = r[0],
                                                            i = r[1],
                                                            o = r[2];
                                                        return (0, nH.jsxs)(eg().Fragment, {
                                                            children: [a, (0, nH.jsx)("button", {
                                                                type: "button",
                                                                className: "download-link-underline",
                                                                onClick: function() {
                                                                    return null == n ? void 0 : n()
                                                                },
                                                                children: i
                                                            }), o]
                                                        })
                                                    }()
                                                })]
                                            })]
                                        }), (0, nH.jsx)("div", {}), " ", (0, nH.jsx)("div", {
                                            className: "stroke-standard stroke-default"
                                        }), (0, nH.jsx)("div", {}), " ", (0, nH.jsx)("section", {
                                            className: "flex flex-col fill basis-0 gap-xxlarge",
                                            children: (0, nH.jsx)(sO, {
                                                translate: u
                                            })
                                        })]
                                    })]
                                })
                            })
                        })
                    })
                },
                s2 = function(e) {
                    var t = e.unmount,
                        n = tn(sA, 2),
                        r = n[0],
                        a = n[1],
                        i = aJ(r),
                        o = aJ(a);
                    return (0, nH.jsx)(oH, {
                        hasCloseAffordance: !1,
                        isModal: !0,
                        open: !0,
                        size: "Small",
                        onOpenChange: function(e) {
                            e || t()
                        },
                        children: (0, nH.jsxs)(oG, {
                            children: [(0, nH.jsxs)(oz, {
                                className: "flex flex-col gap-small",
                                children: [(0, nH.jsx)(oV, {
                                    className: "text-heading-small content-emphasis padding-none",
                                    children: i("Heading.ErrorStartingGame")
                                }), (0, nH.jsx)("p", {
                                    className: "text-body-medium content-default",
                                    children: i("Response.Dialog.ErrorLaunching")
                                })]
                            }), (0, nH.jsx)(oW, {
                                className: "flex",
                                children: (0, nH.jsx)(rl, {
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
                s3 = window.Roblox["core-lib"].index;
            tx(["ar-001", "de-de", "en-us", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "nl-nl", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn", "zh-cn", "zh-tw"]).concat(tx(["bg-bg", "bn-bd", "bs-ba", "cs-cz", "da-dk", "el-gr", "en-gb", "es-mx", "et-ee", "fi-fi", "fil-ph", "fr-ca", "hr-hr", "hu-hu", "ka-ge", "kk-kz", "km-kh", "lt-lt", "lv-lv", "ms-my", "my-mm", "nb-no", "pt-pt", "ro-ro", "ru-ru", "si-lk", "sk-sk", "sl-sl", "sq-al", "sr-rs", "sv-se", "uk-ua"]));
            var s5 = tx(["ar_001", "de_de", "en_us", "es_es", "fr_fr", "hi_in", "id_id", "it_it", "ja_jp", "ko_kr", "nl_nl", "pl_pl", "pt_br", "th_th", "tr_tr", "vi_vn", "zh_cn", "zh_tw"]).concat(tx(["bg_bg", "bn_bd", "bs_ba", "cs_cz", "da_dk", "el_gr", "en_gb", "es_mx", "et_ee", "fi_fi", "fil_ph", "fr_ca", "hr_hr", "hu_hu", "ka_ge", "kk_kz", "km_kh", "lt_lt", "lv_lv", "ms_my", "my_mm", "nb_no", "pt_pt", "ro_ro", "ru_ru", "si_lk", "sk_sk", "sl_sl", "sq_al", "sr_rs", "sv_se", "uk_ua"])),
                s4 = tx(["ar-001", "de-DE", "en-US", "es-ES", "fr-FR", "hi-IN", "id-ID", "it-IT", "ja-JP", "ko-KR", "nl-NL", "pl-PL", "pt-BR", "th-TH", "tr-TR", "vi-VN", "zh-CN", "zh-TW"]).concat(tx(["bg-BG", "bn-BD", "bs-BA", "cs-CZ", "da-DK", "el-GR", "en-GB", "es-MX", "et-EE", "fi-FI", "fil-PH", "fr-CA", "hr-HR", "hu-HU", "ka-GE", "kk-KZ", "km-KH", "lt-LT", "lv-LV", "ms-MY", "my-MM", "nb-NO", "pt-PT", "ro-RO", "ru-RU", "si-LK", "sk-SK", "sl-SL", "sq-AL", "sr-RS", "sv-SE", "uk-UA"]));
            tx(["ar", "de", "es", "fr", "hi", "id", "it", "ja", "ko", "nl", "pl", "pt", "th", "tr", "vi"]).concat(tx(["ar-001", "de-de", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "nl-nl", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn"]));
            var s6 = new Map([
                    ["zh_cjv", "zh_cn"]
                ]),
                s8 = function() {
                    if ("u" < typeof window) return {};
                    var e = window.Roblox;
                    return null != e ? e : {}
                },
                s7 = function(e) {
                    return Object.fromEntries(Object.entries(null != e ? e : {}).flatMap(function(e) {
                        var t = tn(e, 2),
                            n = t[0],
                            r = t[1];
                        return null == r ? [] : [
                            [ad(n), r]
                        ]
                    }))
                },
                s9 = function(e) {
                    var t = s8(),
                        n = t.Lang,
                        r = t.LangDynamic,
                        a = t.LangDynamicDefault;
                    return Object.fromEntries(e.map(function(e) {
                        return [ad(e), eE({}, s7(null == a ? void 0 : a[e]), s7(null == n ? void 0 : n[e]), s7(null == r ? void 0 : r[e]))]
                    }))
                },
                ce = function(e) {
                    var t, n, r = e.namespaces,
                        a = e.locale,
                        i = e.children,
                        o = r.join(","),
                        l = (0, ey.useMemo)(function() {
                            return s9(r)
                        }, [o]);
                    return (0, nH.jsx)(an, {
                        locale: null != a ? a : null != (t = null != (n = function() {
                            if (!("u" < typeof document)) {
                                var e = document.documentElement.lang;
                                if (e) return (0, s3.arrayIncludes)(s4, e) ? e.toLowerCase() : void 0
                            }
                        }()) ? n : function() {
                            if ("u" < typeof document) return;
                            var e, t = document.querySelector('meta[name="locale-data"]');
                            if ((0, tf._)(t, HTMLMetaElement)) {
                                var n = t.dataset.languageCode;
                                if (n) {
                                    var r = null != (e = s6.get(n)) ? e : n;
                                    if ((0, s3.arrayIncludes)(s5, r)) return r.replace("_", "-")
                                }
                            }
                        }()) ? t : "en-us",
                        messages: l,
                        children: i
                    })
                },
                ct = JSON.parse('{"P":["Feature.GameLaunchGuestMode","Common.VisitGame","CommonUI.Controls","Feature.ExperienceDetails","Feature.DownloadLanding"]}'),
                cn = window.Roblox["core-scripts"].meta.user,
                cr = function() {
                    var e, t, n;
                    return null != (e = null == (n = si("RBXEventTrackerV2")) || null == (t = n.value.match(/browserid=([^&]*)/i)) ? void 0 : t[1]) && e
                };
            ["/games/{placeId}/{placeName}", "/share-links?code={linkId}&type=ExperienceInvite"].map(function(e) {
                return new RegExp(e.replace(/\{.*?\}/g, "([^/]+)"))
            });
            var ca = "Website.DownloadFunnel",
                ci = "deeplink",
                co = ["/games/{placeId}/{placeName}", "/share-links?code={linkId}&type=ExperienceInvite"].map(function(e) {
                    return new RegExp(e.replace(/\{.*?\}/g, "([^/]+)"))
                }),
                cl = ["/share-links"],
                cu = ["ExperienceAffiliate"],
                cs = function(e) {
                    var t;
                    return cl.includes(e.pathname) && cu.includes(null != (t = e.searchParams.get("type")) ? t : "")
                },
                cc = function(e) {
                    try {
                        var t = new URL(e).searchParams.get("referralUrl");
                        if (!t) return null;
                        var n = new URL(decodeURIComponent(t));
                        if (cs(n)) return n.href;
                        return null
                    } catch (e) {
                        return null
                    }
                },
                cd = function(e, t, n) {
                    var r;
                    try {
                        null == (r = window.Roblox.EventStream) || r.SendEventWithTarget("tokenAction", "EdpDownloadRobloxInstaller", {
                            link_url: t,
                            group: ci,
                            action: "create-token-attempt",
                            status_code: n,
                            token: null != e ? e : ""
                        }, window.Roblox.EventStream.TargetTypes.WWW)
                    } catch (e) {}
                },
                cf = "".concat(ex().apiGatewayUrl, "/deferred-deep-link/token-api"),
                ch = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                    return em(function() {
                        var n, r, a, i, o, l, u, s, c;
                        return ev(this, function(d) {
                            switch (d.label) {
                                case 0:
                                    n = t.authTicket, r = t.btId, a = t.downloadSource, i = t.launchContext, o = {
                                        linkId: e,
                                        group: ci
                                    }, n && (o.authTicket = n), r && (o.btId = r), a && (o.downloadSource = a), i && (o.launchContext = i), l = {
                                        withCredentials: !0,
                                        url: "".concat(cf, "/create-token")
                                    }, d.label = 1;
                                case 1:
                                    return d.trys.push([1, 3, , 4]), [4, ek.post(l, o)];
                                case 2:
                                    return cd(c = null != (u = (s = d.sent()).data.token) ? u : null, e, s.status), [2, c];
                                case 3:
                                    return d.sent(), [2, null];
                                case 4:
                                    return [2]
                            }
                        })
                    })()
                },
                cp = az("Download"),
                cm = function(e) {
                    cp("GameJoinDeeplinkToken", {
                        outcome: e
                    })
                },
                cv = new TextEncoder,
                cy = function(e) {
                    var t;
                    return nV((t = e, nV(btoa(Array.from(cv.encode(t), function(e) {
                        return String.fromCodePoint(e)
                    }).join("")))).replace(/\+/g, "-").replace(/\//g, "_").replace(/=/g, ""))
                };
            new TextDecoder;
            var cg = ["joinAttemptOrigin", "accessCode", "linkCode", "gameId", "launchData", "eventId", "conversationId"],
                cb = function(e, t, n) {
                    var r = null == (p = sj.parse(e).getOrNull()) ? void 0 : p.searchParams;
                    if (null == r) return null;
                    var a = uE(null != (d = r.get("placeId")) ? d : "");
                    if (null == a || a <= 0) return null;
                    var i = uE(String(null != n ? n : "")),
                        o = {
                            v: 1,
                            joinType: "GameJoin",
                            placeId: a,
                            isPlayTogetherGame: "true" === r.get("isPlayTogetherGame"),
                            referredByPlayerId: null != i && i > 0 ? i : null != (f = uE(null != (h = r.get("referredByPlayerId")) ? h : "0")) ? f : 0
                        },
                        l = r.get("request");
                    l && (o.requestType = l);
                    var u = !0,
                        s = !1,
                        c = void 0;
                    try {
                        for (var d, f, h, p, m, v = cg[Symbol.iterator](); !(u = (m = v.next()).done); u = !0) {
                            var y = m.value,
                                g = r.get(y);
                            g && (o[y] = g)
                        }
                    } catch (e) {
                        s = !0, c = e
                    } finally {
                        try {
                            u || null == v.return || v.return()
                        } finally {
                            if (s) throw c
                        }
                    }
                    return t && (o.launchExp = t), cy(nu(o).value)
                },
                cw = ["Messages", "Avatar"],
                cE = function(e) {
                    var t;
                    return null != (t = cw.find(function(t) {
                        return t === e
                    })) ? t : "other"
                },
                cP = {
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
                cx = (B = az(cP.featureName), function(e, t) {
                    var n = Object.values(cP.features).some(function(t) {
                        var n;
                        return null == (n = t.counters) ? void 0 : n.some(function(t) {
                            var n;
                            return "string" != typeof t && t.name === e && (null == (n = t.dimensions) ? void 0 : n.includes("page")) === !0
                        })
                    });
                    B(e, eM(eE({}, n && null == t.page ? {
                        page: cE(aK())
                    } : {}, t), {
                        host: "dotnet"
                    }))
                }),
                cS = {
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
                cI = ["edit", "plugin", "asset"];

            function cA() {
                var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "react-dialog-container",
                    t = document.getElementById(e);
                return t ? (io().unmountComponentAtNode(t), t.innerHTML = "") : ((t = document.createElement("div")).id = e, document.body.appendChild(t)), t
            }

            function cC() {
                ef().modal.close();
                var e = cA("react-launch-failure-dialog-container");
                (0, sg.renderWithErrorBoundary)((0, nH.jsx)(ce, {
                    namespaces: ct.P,
                    children: (0, nH.jsx)(s2, {
                        unmount: function() {
                            return io().unmountComponentAtNode(e)
                        }
                    })
                }), e)
            }

            function cT(e) {
                var t = ef()("iframe#gamelaunch");
                t.length > 0 && t.remove(), t = ef()("<iframe id='gamelaunch' class='hidden'></iframe>").attr("src", e), ef()("body").append(t);
                var n = new Event("ProtocolLaunchStartSelenium");
                window.dispatchEvent(n)
            }

            function ck(e) {
                return em(function() {
                    var t, n, r;
                    return ev(this, function(a) {
                        switch (a.label) {
                            case 0:
                                var i;
                                return t = document.getElementById("downloadInstallerIFrame"), n = "/download/client", t.referrerPolicy = "no-referrer", [4, (i = window.location.toString(), em(function() {
                                    var t, n, r, a, o;
                                    return ev(this, function(l) {
                                        switch (l.label) {
                                            case 0:
                                                if (t = "", !(n = function(e) {
                                                        var t = cc(e);
                                                        if (t) return t;
                                                        var n = new URL(e);
                                                        return (n.search = "", n.hash = "", co.some(function(e) {
                                                            return e.test(n.pathname)
                                                        })) ? n.toString() : null
                                                    }(i))) return e && cm("unsupportedPage"), [2, t];
                                                return a = [n], o = [{}], [4, em(function() {
                                                    var e;
                                                    return ev(this, function(t) {
                                                        switch (t.label) {
                                                            case 0:
                                                                if (null == (0, cn.authenticatedUser)()) return [3, 2];
                                                                return [4, nf()];
                                                            case 1:
                                                                return e = t.sent(), [3, 3];
                                                            case 2:
                                                                e = void 0, t.label = 3;
                                                            case 3:
                                                                return [2, {
                                                                    authTicket: e,
                                                                    btId: cr() || void 0
                                                                }]
                                                        }
                                                    })
                                                })()];
                                            case 1:
                                                return [4, ch.apply(void 0, a.concat([eE.apply(void 0, [eM.apply(void 0, [eE.apply(void 0, o.concat([l.sent()])), {
                                                    downloadSource: "installer"
                                                }]), e ? {
                                                    launchContext: e
                                                } : {}])]))];
                                            case 2:
                                                return r = l.sent(), e && cm(r ? "minted" : "tokenFailed"), r && (t = "?".concat("token", "=").concat(r)), [2, t]
                                        }
                                    })
                                })())];
                            case 1:
                                return r = a.sent(), t.src = "".concat(n).concat(r), [2]
                        }
                    })
                })()
            }

            function cO() {
                return em(function() {
                    return ev(this, function(e) {
                        switch (e.label) {
                            case 0:
                                return ef()(st).trigger(st.manualDownloadEvent, {
                                    launchMethod: "Protocol",
                                    params: {}
                                }), [4, ck()];
                            case 1:
                                return e.sent(), [2]
                        }
                    })
                })()
            }
            var c_ = (K = null != (W = (U = (R = {
                state: cS,
                getPlaceLauncherBaseUrl: function() {
                    var e = " ";
                    return eh.Endpoints && eh.Endpoints.Urls && (e = eh.Endpoints.getAbsoluteUrl("/Game/PlaceLauncher.ashx")), "h" !== e[0] && (e = "http://".concat(window.location.host, "/Game/PlaceLauncher.ashx")), e.replace("placelauncher", "PlaceLauncher")
                },
                triggerEvent: function(e, t) {
                    return ef()(st).trigger(st["".concat(e, "Event")], t)
                },
                logToConsole: function(e) {
                    var t, n;
                    return null == (n = st.gameLaunchLogger) || null == (t = n.logToConsole) ? void 0 : t.call(n, e)
                },
                showDialog: function(e, t) {
                    return cS.showDialog(e, t)
                },
                closeDialog: function() {
                    return ef().modal.close()
                },
                showLaunchFailureDialog: cC,
                openProtocolUrl: cT
            }).state, D = R.getPlaceLauncherBaseUrl, M = R.triggerEvent, j = R.logToConsole, F = R.showDialog, H = R.closeDialog, G = R.showLaunchFailureDialog, z = R.openProtocolUrl, V = {
                getConfig: function() {
                    return {
                        placeLauncherUrl: D(),
                        robloxLocale: U.robloxLocale,
                        gameLocale: U.gameLocale,
                        playerChannel: U.playerChannel,
                        studioChannel: U.studioChannel,
                        isDuarAutoOptInEnabled: !!U.isDuarAutoOptInEnabled,
                        isDuarOptOutDisabled: !!U.isDuarOptOutDisabled,
                        isOmitPlayerChannelForWinAndMacEnabled: !!U.isOmitPlayerChannelForWinAndMacEnabled
                    }
                },
                getBrowserTrackerId: cr,
                isAuthenticated: cn.isAuthenticated,
                getUserId: cn.userId,
                isWindowsOrMac: function() {
                    return (0, e4.isWindows)() || (0, e4.isMac)()
                },
                onEvent: function(e, t) {
                    "startClientAttempted" === e && cx("GameLaunch", {
                        outcome: "attempted"
                    }), M(e, t)
                },
                installState: {
                    get: function() {
                        return U.isInstalling
                    },
                    set: function(e) {
                        U.isInstalling = e
                    }
                },
                onLaunchStarted: F,
                onLaunchSucceeded: function() {
                    cx("GameLaunch", {
                        outcome: "succeeded"
                    }), H()
                },
                onLaunchFailed: function(e) {
                    cx("GameLaunch", {
                        outcome: "failed"
                    }), console.error(e), G()
                },
                openProtocolUrl: function(e) {
                    j("launchProtocolUrl: ".concat(JSON.stringify({
                        url: e
                    }))), z(e)
                }
            }).installState) ? W : (p = !1, {
                get: function() {
                    return p
                },
                set: function(e) {
                    p = e
                }
            }), Z = null != (q = V.openProtocolUrl) ? q : function(e) {
                null == (t = document.querySelector("iframe#gamelaunch")) || t.remove();
                var t, n = document.createElement("iframe");
                n.id = "gamelaunch", n.className = "hidden", n.src = e, document.body.appendChild(n), window.dispatchEvent(new Event("ProtocolLaunchStartSelenium"))
            }, Y = function(e) {
                return {
                    launchMethod: "Protocol",
                    params: e
                }
            }, J = function(e) {
                return em(function() {
                    var t, n, r, a, i;
                    return ev(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (o.trys.push([0, 5, , 6]), t = nh(e.launchMode), n = em(function() {
                                        return ev(this, function(e) {
                                            switch (e.label) {
                                                case 0:
                                                    return [4, eS.fetch(ns(ex().matchmakingApi, "/v1/client-status"), {
                                                        method: "POST",
                                                        credentials: "include",
                                                        headers: {
                                                            "content-type": "application/json"
                                                        },
                                                        body: nu({
                                                            status: "Unknown"
                                                        }).value
                                                    })];
                                                case 1:
                                                    return e.sent().getOrThrow(), [2]
                                            }
                                        })
                                    })(), !(V.isAuthenticated() && !t)) return [3, 2];
                                return [4, Promise.all([nf(), n])];
                            case 1:
                                return r = tn.apply(void 0, [o.sent(), 1])[0], [3, 4];
                            case 2:
                                return [4, n];
                            case 3:
                                o.sent(), o.label = 4;
                            case 4:
                                return a = t ? {
                                    userId: V.isAuthenticated() ? V.getUserId() : null,
                                    browser: tl()
                                } : void 0, Z(nv(e, r, a)), V.onLaunchSucceeded(), V.onEvent("startClientSucceeded", Y(e)), K.get() && (V.onEvent("successfulInstall", Y(e)), K.set(!1)), [3, 6];
                            case 5:
                                return i = o.sent(), V.onLaunchFailed(i), [3, 6];
                            case 6:
                                return [2]
                        }
                    })
                })()
            }, X = function(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "play",
                    n = V.getConfig(),
                    r = nh(t),
                    a = eM(eE({}, e), {
                        protocolName: nm(r ? "roblox-studio" : "roblox-player"),
                        launchMode: t,
                        launchTime: Date.now()
                    }),
                    i = a.otherParams;
                i.browsertrackerid = V.getBrowserTrackerId(), i.robloxLocale = n.robloxLocale, i.gameLocale = n.gameLocale, r ? i.channel = n.studioChannel : n.isOmitPlayerChannelForWinAndMacEnabled && V.isWindowsOrMac() || (i.channel = n.playerChannel), r || !n.isDuarAutoOptInEnabled || i.LaunchExp || (i.LaunchExp = n.isDuarOptOutDisabled ? "InApp" : "PreferInApp"), V.onEvent("startClientAttempted", Y(a));
                var o = J(a);
                return V.onLaunchStarted(a, function() {
                    return J(a)
                }), o
            }, $ = function(e, t) {
                var n = function() {
                    Z(e)
                };
                V.onLaunchStarted(t, function() {
                    return n(), Promise.resolve()
                }), n()
            }, Q = function(e, t) {
                var n, r, a, i;
                return n = V.getConfig().placeLauncherUrl, r = e, a = V.getBrowserTrackerId(), i = t, "".concat(n, "?").concat(Object.entries(eE({
                    request: r,
                    browserTrackerId: a
                }, Object.fromEntries(Object.entries(i).filter(function(e) {
                    return void 0 !== tn(e, 2)[1]
                })))).map(function(e) {
                    var t = tn(e, 2),
                        n = t[0],
                        r = t[1];
                    return "".concat(encodeURIComponent(n), "=").concat(encodeURIComponent(null != r ? r : ""))
                }).join("&").replace(/%20/g, "+"))
            }, ee = function(e) {
                return null == V.onGuestLaunch || V.isAuthenticated() ? e() : (V.onGuestLaunch(), Promise.resolve())
            }, et = function(e, t, n) {
                var r, a = null == (r = V.launchInApp) ? void 0 : r.call(V, eE(eM(eE({}, e), {
                    browserTrackerId: V.getBrowserTrackerId()
                }), "string" == typeof t.joinAttemptId ? {
                    joinAttemptId: t.joinAttemptId
                } : {}, "string" == typeof t.joinAttemptOrigin ? {
                    joinAttemptOrigin: t.joinAttemptOrigin
                } : {}));
                return null != a ? a : n()
            }, {
                joinMultiplayerGame: function(e, t) {
                    return ee(function() {
                        return et({
                            requestType: "RequestGame",
                            placeId: String(e.placeId),
                            isPlayTogetherGame: !0 === e.isPlayTogetherGame
                        }, e, function() {
                            return X({
                                otherParams: {
                                    placelauncherurl: Q("RequestGame", e)
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
                    return ee(function() {
                        return et({
                            requestType: "RequestFollowUser",
                            userId: String(e.userId)
                        }, e, function() {
                            return X({
                                otherParams: {
                                    placelauncherurl: Q("RequestFollowUser", e)
                                }
                            })
                        })
                    })
                },
                joinGameInstance: function(e, t) {
                    return ee(function() {
                        return et({
                            requestType: "RequestGameJob",
                            placeId: String(e.placeId),
                            instanceId: e.gameId,
                            isPlayTogetherGame: !0 === e.isPlayTogetherGame
                        }, e, function() {
                            return X({
                                otherParams: {
                                    placelauncherurl: Q("RequestGameJob", e)
                                },
                                placeId: e.placeId,
                                isPlayTogetherGame: !0 === e.isPlayTogetherGame,
                                getPlayOnWeb: t
                            })
                        })
                    })
                },
                joinPrivateGame: function(e, t) {
                    return et(eE({
                        requestType: "RequestPrivateGame",
                        placeId: String(e.placeId)
                    }, null == e.accessCode ? {} : {
                        accessCode: e.accessCode
                    }, null == e.linkCode ? {} : {
                        linkCode: e.linkCode
                    }), e, function() {
                        return X({
                            otherParams: {
                                placelauncherurl: Q("RequestPrivateGame", e)
                            },
                            placeId: e.placeId,
                            getPlayOnWeb: t
                        })
                    })
                },
                playTogetherGame: function(e) {
                    return ee(function() {
                        return et({
                            requestType: "RequestGame",
                            placeId: String(e.placeId),
                            conversationId: String(e.conversationId)
                        }, e, function() {
                            return X({
                                otherParams: {
                                    placelauncherurl: Q("RequestPlayTogetherGame", e)
                                },
                                placeId: e.placeId,
                                conversationId: e.conversationId
                            })
                        })
                    })
                },
                openStudio: function() {
                    return X({
                        otherParams: {
                            avatar: "avatar"
                        }
                    }, "edit")
                },
                editGameInStudio: function(e) {
                    var t = e.placeId,
                        n = e.universeId,
                        r = e.startTeamTest,
                        a = void 0 !== r && r,
                        i = e.instanceId,
                        o = e.annotationId;
                    return X({
                        otherParams: eM(eE({
                            task: a ? "StartTeamTest" : "EditPlace",
                            placeId: t,
                            universeId: n
                        }, !a && i ? {
                            targetInstanceId: i
                        } : {}, !a && o ? {
                            annotationId: o
                        } : {}), {
                            avatar: "avatar"
                        }),
                        placeId: t
                    }, "edit")
                },
                tryAssetInStudio: function(e) {
                    return X({
                        otherParams: {
                            assetid: e.assetId,
                            avatar: "avatar"
                        }
                    }, "asset")
                },
                openPluginInStudio: function(e) {
                    return X({
                        otherParams: {
                            pluginid: e.pluginId,
                            avatar: "avatar"
                        }
                    }, "plugin")
                },
                startDeepLinkFlow: function(e) {
                    $(e, {})
                },
                startGameWithDeepLinkUrl: function(e, t) {
                    $(e, {
                        protocolName: nm("roblox-player"),
                        launchMode: "play",
                        otherParams: {},
                        placeId: t
                    })
                },
                beginInstall: function(e) {
                    V.onEvent("beginInstall", Y(e)), K.set(!0)
                },
                manualDownload: function() {
                    V.onEvent("manualDownload", Y({}))
                }
            });
            Object.assign(cS, {
                joinMultiplayerGame: c_.joinMultiplayerGame,
                followPlayerIntoGame: c_.followPlayerIntoGame,
                joinGameInstance: c_.joinGameInstance,
                joinPrivateGame: c_.joinPrivateGame,
                playTogetherGame: c_.playTogetherGame,
                openStudio: c_.openStudio,
                tryAssetInStudio: function(e) {
                    return c_.tryAssetInStudio({
                        assetId: e
                    })
                },
                openPluginInStudio: function(e) {
                    return c_.openPluginInStudio({
                        pluginId: e
                    })
                },
                editGameInStudio: function(e, t, n, r, a, i) {
                    return c_.editGameInStudio({
                        placeId: e,
                        universeId: t,
                        startTeamTest: r,
                        instanceId: a,
                        annotationId: i
                    })
                },
                startDeepLinkFlow: c_.startDeepLinkFlow,
                startGameWithDeepLinkUrl: c_.startGameWithDeepLinkUrl,
                manualDownload: cO,
                attachManualDownloadToLink: function() {
                    return em(function() {
                        return ev(this, function(e) {
                            return ef()("body #GameLaunchManualInstallLink").click(function() {
                                return em(function() {
                                    return ev(this, function(e) {
                                        switch (e.label) {
                                            case 0:
                                                return [4, cO()];
                                            case 1:
                                                return e.sent(), [2, !1]
                                        }
                                    })
                                })()
                            }), [2]
                        })
                    })()
                },
                startDownload: ck,
                setLocationHref: cT,
                showDialog: function(e, t) {
                    var n = cA(),
                        r = function() {
                            return io().unmountComponentAtNode(n)
                        },
                        a = cI.includes(null == e ? void 0 : e.launchMode);
                    (0, sg.renderWithErrorBoundary)((0, nH.jsx)(ce, {
                        namespaces: ct.P,
                        children: (0, nH.jsx)(eb.QueryClientProvider, {
                            client: sg.queryClient,
                            children: (0, nH.jsx)(s1, {
                                download: function() {
                                    return em(function() {
                                        var t, n, i, o;
                                        return ev(this, function(l) {
                                            switch (l.label) {
                                                case 0:
                                                    if (e.placeId && null != (t = window.localStorage.getItem("ref_info"))) {
                                                        window.localStorage.removeItem("ref_info"), n = {};
                                                        try {
                                                            n = JSON.parse(atob(t))
                                                        } catch (e) {}
                                                        e.referredByPlayerId = n[e.placeId]
                                                    }
                                                    if (ef()(st).trigger(st.beginInstallEvent, {
                                                            launchMethod: "Protocol",
                                                            params: e
                                                        }), cS.isInstalling = !0, !a) return [3, 1];
                                                    return document.getElementById("downloadInstallerIFrame").src = "/download/studio", r(), [3, 4];
                                                case 1:
                                                    var u, s, c;
                                                    return [4, (u = null == e || null == (i = e.otherParams) ? void 0 : i.placelauncherurl, s = null == e || null == (o = e.otherParams) ? void 0 : o.LaunchExp, c = null == e ? void 0 : e.referredByPlayerId, em(function() {
                                                        var e;
                                                        return ev(this, function(t) {
                                                            switch (t.label) {
                                                                case 0:
                                                                    if (null == (e = cb(null != u ? u : "", s, c))) return cm("noLaunchContext"), [2, void 0];
                                                                    return [4, em(function() {
                                                                        var e;
                                                                        return ev(this, function(t) {
                                                                            switch (t.label) {
                                                                                case 0:
                                                                                    return t.trys.push([0, 2, , 3]), [4, rc().getAllValuesForLayer(ca)];
                                                                                case 1:
                                                                                    return e = t.sent(), rc().logLayerExposure(ca), [2, !0 === e.IsGameJoinDeeplinkEnabled];
                                                                                case 2:
                                                                                    return t.sent(), [2, !1];
                                                                                case 3:
                                                                                    return [2]
                                                                            }
                                                                        })
                                                                    })()];
                                                                case 1:
                                                                    if (!t.sent()) return cm("ixpOff"), [2, void 0];
                                                                    return [2, e]
                                                            }
                                                        })
                                                    })())];
                                                case 2:
                                                    return [4, ck(l.sent())];
                                                case 3:
                                                    l.sent(), l.label = 4;
                                                case 4:
                                                    return [2]
                                            }
                                        })
                                    })()
                                },
                                launchGame: function() {
                                    return em(function() {
                                        return ev(this, function(e) {
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
                showLaunchFailureDialog: cC
            }), ef()(document).ready(function() {
                st.setGameLaunchInterface(cS);
                var e = ef()("#PlaceLauncherStatusPanel");
                cS.isJoinAttemptIdEnabled = !0, cS.robloxLocale = e.data("protocol-roblox-locale"), cS.gameLocale = e.data("protocol-game-locale");
                var t = e.data("protocol-studio-channel-name");
                "string" == typeof t && "LIVE" !== t.toUpperCase() && (cS.studioChannel = t);
                var n = e.data("protocol-player-channel-name");
                "string" == typeof n && "LIVE" !== n.toUpperCase() && (cS.playerChannel = n), cS.isDuarAutoOptInEnabled = e.data("is-duar-auto-opt-in-enabled"), cS.isDuarOptOutDisabled = e.data("is-duar-opt-out-disabled"), cS.isOmitPlayerChannelForWinAndMacEnabled = e.data("is-omit-player-channel-for-win-and-mac-enabled")
            }), Object.assign(window.Roblox, {
                AuthenticationChecker: u9,
                GameLauncher: st,
                GameLaunchLogger: ss,
                GamePlayEvents: sl,
                ProtocolHandlerClientInterface: cS,
                PlayButton: {
                    usePlayabilityStatus: eJ,
                    PlayabilityStatuses: ej,
                    launchGame: nk,
                    launchLogin: nO,
                    shouldShowUnplayableButton: nB,
                    DefaultPlayButton: function(e) {
                        var t, n = e.placeId,
                            r = e.rootPlaceId,
                            a = e.universeId,
                            i = e.privateServerLinkCode,
                            o = e.gameInstanceId,
                            l = e.refetchPlayabilityStatus,
                            u = e.playabilityStatus,
                            s = e.demoModeAvailable,
                            c = e.privatePlaytestInfo,
                            d = e.creatorId,
                            f = e.hideButtonText,
                            h = e.eventProperties,
                            p = void 0 === h ? uQ : h,
                            m = e.appsFlyerReferralProperties,
                            v = void 0 === m ? uQ : m,
                            y = e.disableLoadingState,
                            g = e.buttonClassName,
                            b = e.iconClassName,
                            w = e.purchaseIconClassName,
                            E = e.unplayableIconClassName,
                            P = e.redirectPurchaseUrl,
                            x = e.showDefaultPurchaseText,
                            S = e.shouldShowVpcPlayButtonUpsells,
                            I = e.playabilityStatusCtaOverrides,
                            A = e.pageContext,
                            C = e.playOnWebVariant,
                            T = void 0 === C ? "None" : C,
                            k = uo(a, n, u === ej.PurchaseRequired || u === ej.FiatPurchaseRequired),
                            O = k.isLoading,
                            _ = k.productInfo,
                            N = k.productDetails,
                            L = void 0 !== c && (c.isPlayable || void 0 !== nU(c.playabilityStatus)),
                            B = uX(),
                            R = B.wasmJoinId,
                            U = B.isLoading,
                            D = [{
                                isEnabled: L,
                                primaryStatuses: u1,
                                render: function() {
                                    return (0, nH.jsx)(uV, {
                                        universeId: a,
                                        placeId: n,
                                        rootPlaceId: r,
                                        creatorId: d,
                                        privatePlaytestInfo: c,
                                        refetchPlayabilityStatus: l,
                                        pageContext: A,
                                        eventProperties: p,
                                        appsFlyerReferralProperties: v
                                    })
                                }
                            }, {
                                isEnabled: !!s,
                                primaryStatuses: u0,
                                render: function() {
                                    return (0, nH.jsx)(u_, {
                                        universeId: a,
                                        placeId: n,
                                        rootPlaceId: r,
                                        privateServerLinkCode: i,
                                        gameInstanceId: o,
                                        eventProperties: p,
                                        appsFlyerReferralProperties: v
                                    })
                                }
                            }, {
                                isEnabled: T === rm,
                                primaryStatuses: u2,
                                render: function() {
                                    return (0, nH.jsx)(uF, {
                                        placeId: n,
                                        rootPlaceId: r,
                                        universeId: a,
                                        privateServerLinkCode: i,
                                        gameInstanceId: o,
                                        eventProperties: p,
                                        wasmJoinId: R,
                                        playOnWebVariant: rm
                                    })
                                }
                            }],
                            M = !1;
                        switch (u) {
                            case void 0:
                                if (!y) {
                                    t = (0, nH.jsx)(a1, {
                                        buttonClassName: g
                                    });
                                    break
                                }
                                t = (0, nH.jsx)(u3, {
                                    universeId: a,
                                    placeId: n,
                                    rootPlaceId: r,
                                    privateServerLinkCode: i,
                                    gameInstanceId: o,
                                    status: ej.Playable,
                                    eventProperties: p,
                                    appsFlyerReferralProperties: v,
                                    disableLoadingState: y,
                                    buttonClassName: g,
                                    iconClassName: b,
                                    pageContext: A
                                });
                                break;
                            case ej.GuestProhibited:
                            case ej.Playable:
                                var j = null == I ? void 0 : I[u];
                                if (void 0 !== j) {
                                    t = j;
                                    break
                                }
                                if (u === ej.Playable && T === rp) {
                                    if (U && !y) {
                                        t = (0, nH.jsx)(a1, {
                                            buttonClassName: g
                                        }), M = !0;
                                        break
                                    }
                                    if (R) {
                                        t = (0, nH.jsx)(uF, {
                                            placeId: n,
                                            rootPlaceId: r,
                                            universeId: a,
                                            privateServerLinkCode: i,
                                            gameInstanceId: o,
                                            eventProperties: p,
                                            wasmJoinId: R,
                                            playOnWebVariant: rp
                                        });
                                        break
                                    }
                                }
                                t = (0, nH.jsx)(u3, {
                                    universeId: a,
                                    placeId: n,
                                    rootPlaceId: r,
                                    privateServerLinkCode: i,
                                    gameInstanceId: o,
                                    status: u,
                                    eventProperties: p,
                                    appsFlyerReferralProperties: v,
                                    disableLoadingState: y,
                                    buttonClassName: g,
                                    iconClassName: b,
                                    pageContext: A
                                });
                                break;
                            case ej.ContextualPlayabilityUnverifiedSeventeenPlusUser:
                            case ej.ContextualPlayabilityAgeCheckRequired:
                                eT(eV.ActionNeeded), t = (0, nH.jsx)(u$, {
                                    universeId: a,
                                    buttonClassName: g,
                                    playabilityStatus: u,
                                    pageContext: A
                                });
                                break;
                            case ej.PurchaseRequired:
                            case ej.FiatPurchaseRequired:
                                var F = u === ej.FiatPurchaseRequired ? !!(null == N ? void 0 : N.fiatPurchaseData) : !!(null == _ ? void 0 : _.isForSale);
                                if (!O && !F) {
                                    eT(eV.Unplayable), t = (0, nH.jsx)(uK, {
                                        hideButtonText: f,
                                        buttonClassName: g,
                                        iconClassName: E
                                    });
                                    break
                                }
                                t = (0, nH.jsx)(uO, {
                                    refetchPlayabilityStatus: l,
                                    universeId: a,
                                    placeId: n,
                                    hideButtonText: f,
                                    buttonClassName: g,
                                    iconClassName: w,
                                    redirectPurchaseUrl: P,
                                    playabilityStatus: u,
                                    showDefaultPurchaseText: x,
                                    pageContext: A
                                }), M = O;
                                break;
                            case ej.FiatPurchaseDeviceRestricted:
                            case ej.ContextualPlayabilityRegionalAvailability:
                                eT(eV.Unplayable), t = (0, nH.jsx)(uK, {
                                    hideButtonText: f,
                                    buttonClassName: g,
                                    iconClassName: E
                                });
                                break;
                            case ej.ContextualPlayabilityAgeRecommendationParentalControls:
                                if (S) {
                                    eT(eV.ActionNeeded), t = (0, nH.jsx)(ui, {
                                        universeId: a,
                                        buttonClassName: g,
                                        placeId: n,
                                        rootPlaceId: r,
                                        privateServerLinkCode: i,
                                        gameInstanceId: o,
                                        eventProperties: p,
                                        appsFlyerReferralProperties: v,
                                        pageContext: A
                                    });
                                    break
                                }
                                eT(eV.Unplayable), t = (0, nH.jsx)(uK, {
                                    hideButtonText: f,
                                    buttonClassName: g,
                                    iconClassName: E
                                });
                                break;
                            case ej.ContextualPlayabilityRequireParentApproval:
                                if (S) {
                                    eT(eV.ActionNeeded), t = (0, nH.jsx)(a0, {
                                        universeId: a,
                                        buttonClassName: g,
                                        pageContext: A
                                    });
                                    break
                                }
                                eT(eV.Unplayable), t = (0, nH.jsx)(uK, {
                                    hideButtonText: f,
                                    buttonClassName: g,
                                    iconClassName: E
                                });
                                break;
                            case ej.UnplayableOtherReason:
                            case ej.GameUnapproved:
                            case ej.IncorrectConfiguration:
                            case ej.UniverseRootPlaceIsPrivate:
                            case ej.InsufficientPermissionFriendsOnly:
                            case ej.InsufficientPermissionGroupOnly:
                            case ej.InsufficientPermissionEditorsOnly:
                            case ej.InsufficientPermissionPlayTestersOnly:
                            case ej.DeviceRestricted:
                            case ej.UnderReview:
                            case ej.AccountRestricted:
                            case ej.TemporarilyUnavailable:
                            case ej.ComplianceBlocked:
                            case ej.ContextualPlayabilityRegionalCompliance:
                            case ej.ContextualPlayabilityAgeGated:
                            case ej.PlaceHasNoPublishedVersion:
                            case ej.ContextualPlayabilityUnrated:
                            case ej.ContextualPlayabilityGeneral:
                            case ej.ContextualPlayabilityAgeGatedByDescriptor:
                            case ej.ContextualPlayabilityExperienceBlockedParentalControls:
                            case ej.ContextualPlayabilityCoreGated:
                            case ej.ContextualPlayabilityPlaytestDisabled:
                            case ej.ContextualPlayabilityTrustedFriendRequired:
                            default:
                                eT(eV.Unplayable), t = (0, nH.jsx)(uK, {
                                    hideButtonText: f,
                                    buttonClassName: g,
                                    iconClassName: E
                                })
                        }
                        return (0, nH.jsx)(uq, {
                            primaryButton: t,
                            secondaryButton: uW(D, u),
                            isPrimaryButtonLoading: M
                        })
                    },
                    PlayButton: u3,
                    PurchaseButton: uO,
                    Error: function(e) {
                        var t = e.playabilityStatus,
                            n = e.errorClassName,
                            r = e.containerRef,
                            a = a$()(Object.hasOwn(eF, t) ? eF[t] : eF[ej.UnplayableOtherReason]);
                        return (0, nH.jsx)("span", {
                            "data-testid": "play-error",
                            className: void 0 === n ? "error-message" : n,
                            ref: r,
                            children: a
                        })
                    },
                    ContextualMessage: function(e) {
                        var t = e.playabilityStatus,
                            n = e.shouldShowVpcPlayButtonUpsells,
                            r = e.unplayableDisplayText,
                            a = e.shouldShowNoticeAgreementIfPlayable,
                            i = e.contextualMessageClassName,
                            o = e.analyticsConfig,
                            l = a$(),
                            u = (0, ey.useRef)(null),
                            s = u5(l, {
                                playabilityStatus: t,
                                shouldShowVpcPlayButtonUpsells: n,
                                shouldShowNoticeAgreementIfPlayable: a,
                                unplayableDisplayText: r
                            });
                        return (u6(u, {
                            universeId: o.universeId,
                            playabilityStatus: t,
                            pageContext: o.pageContext,
                            attributionId: o.attributionId,
                            contextualMessage: null == s ? void 0 : s.message
                        }), s) ? (0, nH.jsx)("span", {
                            ref: u,
                            "data-testid": s.testId,
                            className: void 0 === i ? "contextual-message" : i,
                            children: s.message
                        }) : null
                    }
                }
            }), ef()(document).ready(function() {
                sy();
                var e = (0, eh.DeviceMeta)();
                (e.isUWPApp || e.isUniversalApp) && (u7.isJoinAttemptIdEnabled = !0, window.Roblox.AppHybridClientInterface = u7, st.setGameLaunchInterface(u7)), st.setGameLaunchLogger(ss)
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected(document.currentScript && document.currentScript.getAttribute("data-bundlename") || "GameLaunch");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/gameLaunch-2ac8cea7406f6761.js.map