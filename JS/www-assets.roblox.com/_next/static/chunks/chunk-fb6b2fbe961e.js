;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "c8fe8180-1458-36ac-32b3-39fa020e61d1")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 357355, r => {
    "use strict";
    let t = globalThis.window,
        e = globalThis.document,
        n = globalThis.navigator,
        o = void 0 === t ? void 0 : t;
    r.s(["document", 0, void 0 === e ? void 0 : e, "navigator", 0, null == o || void 0 === n ? void 0 : n, "window", 0, o])
}, 28199, (r, t, e) => {
    var n = {
            675: function(r, t) {
                "use strict";
                t.byteLength = function(r) {
                    var t = u(r),
                        e = t[0],
                        n = t[1];
                    return (e + n) * 3 / 4 - n
                }, t.toByteArray = function(r) {
                    var t, e, i = u(r),
                        s = i[0],
                        a = i[1],
                        f = new o((s + a) * 3 / 4 - a),
                        h = 0,
                        l = a > 0 ? s - 4 : s;
                    for (e = 0; e < l; e += 4) t = n[r.charCodeAt(e)] << 18 | n[r.charCodeAt(e + 1)] << 12 | n[r.charCodeAt(e + 2)] << 6 | n[r.charCodeAt(e + 3)], f[h++] = t >> 16 & 255, f[h++] = t >> 8 & 255, f[h++] = 255 & t;
                    return 2 === a && (t = n[r.charCodeAt(e)] << 2 | n[r.charCodeAt(e + 1)] >> 4, f[h++] = 255 & t), 1 === a && (t = n[r.charCodeAt(e)] << 10 | n[r.charCodeAt(e + 1)] << 4 | n[r.charCodeAt(e + 2)] >> 2, f[h++] = t >> 8 & 255, f[h++] = 255 & t), f
                }, t.fromByteArray = function(r) {
                    for (var t, n = r.length, o = n % 3, i = [], s = 0, a = n - o; s < a; s += 16383) i.push(function(r, t, n) {
                        for (var o, i = [], s = t; s < n; s += 3) o = (r[s] << 16 & 0xff0000) + (r[s + 1] << 8 & 65280) + (255 & r[s + 2]), i.push(e[o >> 18 & 63] + e[o >> 12 & 63] + e[o >> 6 & 63] + e[63 & o]);
                        return i.join("")
                    }(r, s, s + 16383 > a ? a : s + 16383));
                    return 1 === o ? i.push(e[(t = r[n - 1]) >> 2] + e[t << 4 & 63] + "==") : 2 === o && i.push(e[(t = (r[n - 2] << 8) + r[n - 1]) >> 10] + e[t >> 4 & 63] + e[t << 2 & 63] + "="), i.join("")
                };
                for (var e = [], n = [], o = "u" > typeof Uint8Array ? Uint8Array : Array, i = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", s = 0, a = i.length; s < a; ++s) e[s] = i[s], n[i.charCodeAt(s)] = s;

                function u(r) {
                    var t = r.length;
                    if (t % 4 > 0) throw Error("Invalid string. Length must be a multiple of 4");
                    var e = r.indexOf("="); - 1 === e && (e = t);
                    var n = e === t ? 0 : 4 - e % 4;
                    return [e, n]
                }
                n[45] = 62, n[95] = 63
            },
            72: function(r, t, e) {
                "use strict";
                var n = e(675),
                    o = e(783),
                    i = "function" == typeof Symbol && "function" == typeof Symbol.for ? Symbol.for("nodejs.util.inspect.custom") : null;

                function s(r) {
                    if (r > 0x7fffffff) throw RangeError('The value "' + r + '" is invalid for option "size"');
                    var t = new Uint8Array(r);
                    return Object.setPrototypeOf(t, a.prototype), t
                }

                function a(r, t, e) {
                    if ("number" == typeof r) {
                        if ("string" == typeof t) throw TypeError('The "string" argument must be of type string. Received type number');
                        return h(r)
                    }
                    return u(r, t, e)
                }

                function u(r, t, e) {
                    if ("string" == typeof r) {
                        var n = r,
                            o = t;
                        if (("string" != typeof o || "" === o) && (o = "utf8"), !a.isEncoding(o)) throw TypeError("Unknown encoding: " + o);
                        var i = 0 | p(n, o),
                            u = s(i),
                            f = u.write(n, o);
                        return f !== i && (u = u.slice(0, f)), u
                    }
                    if (ArrayBuffer.isView(r)) return l(r);
                    if (null == r) throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type " + typeof r);
                    if (R(r, ArrayBuffer) || r && R(r.buffer, ArrayBuffer) || "u" > typeof SharedArrayBuffer && (R(r, SharedArrayBuffer) || r && R(r.buffer, SharedArrayBuffer))) return function(r, t, e) {
                        var n;
                        if (t < 0 || r.byteLength < t) throw RangeError('"offset" is outside of buffer bounds');
                        if (r.byteLength < t + (e || 0)) throw RangeError('"length" is outside of buffer bounds');
                        return Object.setPrototypeOf(n = void 0 === t && void 0 === e ? new Uint8Array(r) : void 0 === e ? new Uint8Array(r, t) : new Uint8Array(r, t, e), a.prototype), n
                    }(r, t, e);
                    if ("number" == typeof r) throw TypeError('The "value" argument must not be of type number. Received type number');
                    var h = r.valueOf && r.valueOf();
                    if (null != h && h !== r) return a.from(h, t, e);
                    var y = function(r) {
                        if (a.isBuffer(r)) {
                            var t = 0 | c(r.length),
                                e = s(t);
                            return 0 === e.length || r.copy(e, 0, 0, t), e
                        }
                        return void 0 !== r.length ? "number" != typeof r.length || function(r) {
                            return r != r
                        }(r.length) ? s(0) : l(r) : "Buffer" === r.type && Array.isArray(r.data) ? l(r.data) : void 0
                    }(r);
                    if (y) return y;
                    if ("u" > typeof Symbol && null != Symbol.toPrimitive && "function" == typeof r[Symbol.toPrimitive]) return a.from(r[Symbol.toPrimitive]("string"), t, e);
                    throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type " + typeof r)
                }

                function f(r) {
                    if ("number" != typeof r) throw TypeError('"size" argument must be of type number');
                    if (r < 0) throw RangeError('The value "' + r + '" is invalid for option "size"')
                }

                function h(r) {
                    return f(r), s(r < 0 ? 0 : 0 | c(r))
                }

                function l(r) {
                    for (var t = r.length < 0 ? 0 : 0 | c(r.length), e = s(t), n = 0; n < t; n += 1) e[n] = 255 & r[n];
                    return e
                }
                t.Buffer = a, t.SlowBuffer = function(r) {
                    return +r != r && (r = 0), a.alloc(+r)
                }, t.INSPECT_MAX_BYTES = 50, t.kMaxLength = 0x7fffffff, a.TYPED_ARRAY_SUPPORT = function() {
                    try {
                        var r = new Uint8Array(1),
                            t = {
                                foo: function() {
                                    return 42
                                }
                            };
                        return Object.setPrototypeOf(t, Uint8Array.prototype), Object.setPrototypeOf(r, t), 42 === r.foo()
                    } catch (r) {
                        return !1
                    }
                }(), !a.TYPED_ARRAY_SUPPORT && "u" > typeof console && "function" == typeof console.error && console.error("This browser lacks typed array (Uint8Array) support which is required by `buffer` v5.x. Use `buffer` v4.x if you require old browser support."), Object.defineProperty(a.prototype, "parent", {
                    enumerable: !0,
                    get: function() {
                        if (a.isBuffer(this)) return this.buffer
                    }
                }), Object.defineProperty(a.prototype, "offset", {
                    enumerable: !0,
                    get: function() {
                        if (a.isBuffer(this)) return this.byteOffset
                    }
                }), a.poolSize = 8192, a.from = function(r, t, e) {
                    return u(r, t, e)
                }, Object.setPrototypeOf(a.prototype, Uint8Array.prototype), Object.setPrototypeOf(a, Uint8Array), a.alloc = function(r, t, e) {
                    return (f(r), r <= 0) ? s(r) : void 0 !== t ? "string" == typeof e ? s(r).fill(t, e) : s(r).fill(t) : s(r)
                }, a.allocUnsafe = function(r) {
                    return h(r)
                }, a.allocUnsafeSlow = function(r) {
                    return h(r)
                };

                function c(r) {
                    if (r >= 0x7fffffff) throw RangeError("Attempt to allocate Buffer larger than maximum size: 0x7fffffff bytes");
                    return 0 | r
                }

                function p(r, t) {
                    if (a.isBuffer(r)) return r.length;
                    if (ArrayBuffer.isView(r) || R(r, ArrayBuffer)) return r.byteLength;
                    if ("string" != typeof r) throw TypeError('The "string" argument must be one of type string, Buffer, or ArrayBuffer. Received type ' + typeof r);
                    var e = r.length,
                        n = arguments.length > 2 && !0 === arguments[2];
                    if (!n && 0 === e) return 0;
                    for (var o = !1;;) switch (t) {
                        case "ascii":
                        case "latin1":
                        case "binary":
                            return e;
                        case "utf8":
                        case "utf-8":
                            return P(r).length;
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return 2 * e;
                        case "hex":
                            return e >>> 1;
                        case "base64":
                            return B(r).length;
                        default:
                            if (o) return n ? -1 : P(r).length;
                            t = ("" + t).toLowerCase(), o = !0
                    }
                }

                function y(r, t, e) {
                    var o, i, s, a = !1;
                    if ((void 0 === t || t < 0) && (t = 0), t > this.length || ((void 0 === e || e > this.length) && (e = this.length), e <= 0 || (e >>>= 0) <= (t >>>= 0))) return "";
                    for (r || (r = "utf8");;) switch (r) {
                        case "hex":
                            return function(r, t, e) {
                                var n = r.length;
                                (!t || t < 0) && (t = 0), (!e || e < 0 || e > n) && (e = n);
                                for (var o = "", i = t; i < e; ++i) o += L[r[i]];
                                return o
                            }(this, t, e);
                        case "utf8":
                        case "utf-8":
                            return v(this, t, e);
                        case "ascii":
                            return function(r, t, e) {
                                var n = "";
                                e = Math.min(r.length, e);
                                for (var o = t; o < e; ++o) n += String.fromCharCode(127 & r[o]);
                                return n
                            }(this, t, e);
                        case "latin1":
                        case "binary":
                            return function(r, t, e) {
                                var n = "";
                                e = Math.min(r.length, e);
                                for (var o = t; o < e; ++o) n += String.fromCharCode(r[o]);
                                return n
                            }(this, t, e);
                        case "base64":
                            return o = this, i = t, s = e, 0 === i && s === o.length ? n.fromByteArray(o) : n.fromByteArray(o.slice(i, s));
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return function(r, t, e) {
                                for (var n = r.slice(t, e), o = "", i = 0; i < n.length; i += 2) o += String.fromCharCode(n[i] + 256 * n[i + 1]);
                                return o
                            }(this, t, e);
                        default:
                            if (a) throw TypeError("Unknown encoding: " + r);
                            r = (r + "").toLowerCase(), a = !0
                    }
                }

                function g(r, t, e) {
                    var n = r[t];
                    r[t] = r[e], r[e] = n
                }

                function d(r, t, e, n, o) {
                    var i;
                    if (0 === r.length) return -1;
                    if ("string" == typeof e ? (n = e, e = 0) : e > 0x7fffffff ? e = 0x7fffffff : e < -0x80000000 && (e = -0x80000000), (i = e *= 1) != i && (e = o ? 0 : r.length - 1), e < 0 && (e = r.length + e), e >= r.length)
                        if (o) return -1;
                        else e = r.length - 1;
                    else if (e < 0)
                        if (!o) return -1;
                        else e = 0;
                    if ("string" == typeof t && (t = a.from(t, n)), a.isBuffer(t)) return 0 === t.length ? -1 : m(r, t, e, n, o);
                    if ("number" == typeof t) {
                        if (t &= 255, "function" == typeof Uint8Array.prototype.indexOf)
                            if (o) return Uint8Array.prototype.indexOf.call(r, t, e);
                            else return Uint8Array.prototype.lastIndexOf.call(r, t, e);
                        return m(r, [t], e, n, o)
                    }
                    throw TypeError("val must be string, number or Buffer")
                }

                function m(r, t, e, n, o) {
                    var i, s = 1,
                        a = r.length,
                        u = t.length;
                    if (void 0 !== n && ("ucs2" === (n = String(n).toLowerCase()) || "ucs-2" === n || "utf16le" === n || "utf-16le" === n)) {
                        if (r.length < 2 || t.length < 2) return -1;
                        s = 2, a /= 2, u /= 2, e /= 2
                    }

                    function f(r, t) {
                        return 1 === s ? r[t] : r.readUInt16BE(t * s)
                    }
                    if (o) {
                        var h = -1;
                        for (i = e; i < a; i++)
                            if (f(r, i) === f(t, -1 === h ? 0 : i - h)) {
                                if (-1 === h && (h = i), i - h + 1 === u) return h * s
                            } else - 1 !== h && (i -= i - h), h = -1
                    } else
                        for (e + u > a && (e = a - u), i = e; i >= 0; i--) {
                            for (var l = !0, c = 0; c < u; c++)
                                if (f(r, i + c) !== f(t, c)) {
                                    l = !1;
                                    break
                                } if (l) return i
                        }
                    return -1
                }
                a.isBuffer = function(r) {
                    return null != r && !0 === r._isBuffer && r !== a.prototype
                }, a.compare = function(r, t) {
                    if (R(r, Uint8Array) && (r = a.from(r, r.offset, r.byteLength)), R(t, Uint8Array) && (t = a.from(t, t.offset, t.byteLength)), !a.isBuffer(r) || !a.isBuffer(t)) throw TypeError('The "buf1", "buf2" arguments must be one of type Buffer or Uint8Array');
                    if (r === t) return 0;
                    for (var e = r.length, n = t.length, o = 0, i = Math.min(e, n); o < i; ++o)
                        if (r[o] !== t[o]) {
                            e = r[o], n = t[o];
                            break
                        } return e < n ? -1 : +(n < e)
                }, a.isEncoding = function(r) {
                    switch (String(r).toLowerCase()) {
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
                }, a.concat = function(r, t) {
                    if (!Array.isArray(r)) throw TypeError('"list" argument must be an Array of Buffers');
                    if (0 === r.length) return a.alloc(0);
                    if (void 0 === t)
                        for (e = 0, t = 0; e < r.length; ++e) t += r[e].length;
                    var e, n = a.allocUnsafe(t),
                        o = 0;
                    for (e = 0; e < r.length; ++e) {
                        var i = r[e];
                        if (R(i, Uint8Array) && (i = a.from(i)), !a.isBuffer(i)) throw TypeError('"list" argument must be an Array of Buffers');
                        i.copy(n, o), o += i.length
                    }
                    return n
                }, a.byteLength = p, a.prototype._isBuffer = !0, a.prototype.swap16 = function() {
                    var r = this.length;
                    if (r % 2 != 0) throw RangeError("Buffer size must be a multiple of 16-bits");
                    for (var t = 0; t < r; t += 2) g(this, t, t + 1);
                    return this
                }, a.prototype.swap32 = function() {
                    var r = this.length;
                    if (r % 4 != 0) throw RangeError("Buffer size must be a multiple of 32-bits");
                    for (var t = 0; t < r; t += 4) g(this, t, t + 3), g(this, t + 1, t + 2);
                    return this
                }, a.prototype.swap64 = function() {
                    var r = this.length;
                    if (r % 8 != 0) throw RangeError("Buffer size must be a multiple of 64-bits");
                    for (var t = 0; t < r; t += 8) g(this, t, t + 7), g(this, t + 1, t + 6), g(this, t + 2, t + 5), g(this, t + 3, t + 4);
                    return this
                }, a.prototype.toString = function() {
                    var r = this.length;
                    return 0 === r ? "" : 0 == arguments.length ? v(this, 0, r) : y.apply(this, arguments)
                }, a.prototype.toLocaleString = a.prototype.toString, a.prototype.equals = function(r) {
                    if (!a.isBuffer(r)) throw TypeError("Argument must be a Buffer");
                    return this === r || 0 === a.compare(this, r)
                }, a.prototype.inspect = function() {
                    var r = "",
                        e = t.INSPECT_MAX_BYTES;
                    return r = this.toString("hex", 0, e).replace(/(.{2})/g, "$1 ").trim(), this.length > e && (r += " ... "), "<Buffer " + r + ">"
                }, i && (a.prototype[i] = a.prototype.inspect), a.prototype.compare = function(r, t, e, n, o) {
                    if (R(r, Uint8Array) && (r = a.from(r, r.offset, r.byteLength)), !a.isBuffer(r)) throw TypeError('The "target" argument must be one of type Buffer or Uint8Array. Received type ' + typeof r);
                    if (void 0 === t && (t = 0), void 0 === e && (e = r ? r.length : 0), void 0 === n && (n = 0), void 0 === o && (o = this.length), t < 0 || e > r.length || n < 0 || o > this.length) throw RangeError("out of range index");
                    if (n >= o && t >= e) return 0;
                    if (n >= o) return -1;
                    if (t >= e) return 1;
                    if (t >>>= 0, e >>>= 0, n >>>= 0, o >>>= 0, this === r) return 0;
                    for (var i = o - n, s = e - t, u = Math.min(i, s), f = this.slice(n, o), h = r.slice(t, e), l = 0; l < u; ++l)
                        if (f[l] !== h[l]) {
                            i = f[l], s = h[l];
                            break
                        } return i < s ? -1 : +(s < i)
                }, a.prototype.includes = function(r, t, e) {
                    return -1 !== this.indexOf(r, t, e)
                }, a.prototype.indexOf = function(r, t, e) {
                    return d(this, r, t, e, !0)
                }, a.prototype.lastIndexOf = function(r, t, e) {
                    return d(this, r, t, e, !1)
                };

                function v(r, t, e) {
                    e = Math.min(r.length, e);
                    for (var n = [], o = t; o < e;) {
                        var i, s, a, u, f = r[o],
                            h = null,
                            l = f > 239 ? 4 : f > 223 ? 3 : f > 191 ? 2 : 1;
                        if (o + l <= e) switch (l) {
                            case 1:
                                f < 128 && (h = f);
                                break;
                            case 2:
                                (192 & (i = r[o + 1])) == 128 && (u = (31 & f) << 6 | 63 & i) > 127 && (h = u);
                                break;
                            case 3:
                                i = r[o + 1], s = r[o + 2], (192 & i) == 128 && (192 & s) == 128 && (u = (15 & f) << 12 | (63 & i) << 6 | 63 & s) > 2047 && (u < 55296 || u > 57343) && (h = u);
                                break;
                            case 4:
                                i = r[o + 1], s = r[o + 2], a = r[o + 3], (192 & i) == 128 && (192 & s) == 128 && (192 & a) == 128 && (u = (15 & f) << 18 | (63 & i) << 12 | (63 & s) << 6 | 63 & a) > 65535 && u < 1114112 && (h = u)
                        }
                        null === h ? (h = 65533, l = 1) : h > 65535 && (h -= 65536, n.push(h >>> 10 & 1023 | 55296), h = 56320 | 1023 & h), n.push(h), o += l
                    }
                    var c = n,
                        p = c.length;
                    if (p <= 4096) return String.fromCharCode.apply(String, c);
                    for (var y = "", g = 0; g < p;) y += String.fromCharCode.apply(String, c.slice(g, g += 4096));
                    return y
                }

                function w(r, t, e) {
                    if (r % 1 != 0 || r < 0) throw RangeError("offset is not uint");
                    if (r + t > e) throw RangeError("Trying to access beyond buffer length")
                }

                function b(r, t, e, n, o, i) {
                    if (!a.isBuffer(r)) throw TypeError('"buffer" argument must be a Buffer instance');
                    if (t > o || t < i) throw RangeError('"value" argument is out of bounds');
                    if (e + n > r.length) throw RangeError("Index out of range")
                }

                function E(r, t, e, n, o, i) {
                    if (e + n > r.length || e < 0) throw RangeError("Index out of range")
                }

                function A(r, t, e, n, i) {
                    return t *= 1, e >>>= 0, i || E(r, t, e, 4, 34028234663852886e22, -34028234663852886e22), o.write(r, t, e, n, 23, 4), e + 4
                }

                function U(r, t, e, n, i) {
                    return t *= 1, e >>>= 0, i || E(r, t, e, 8, 17976931348623157e292, -17976931348623157e292), o.write(r, t, e, n, 52, 8), e + 8
                }
                a.prototype.write = function(r, t, e, n) {
                    if (void 0 === t) n = "utf8", e = this.length, t = 0;
                    else if (void 0 === e && "string" == typeof t) n = t, e = this.length, t = 0;
                    else if (isFinite(t)) t >>>= 0, isFinite(e) ? (e >>>= 0, void 0 === n && (n = "utf8")) : (n = e, e = void 0);
                    else throw Error("Buffer.write(string, encoding, offset[, length]) is no longer supported");
                    var o, i, s, a, u, f, h, l, c = this.length - t;
                    if ((void 0 === e || e > c) && (e = c), r.length > 0 && (e < 0 || t < 0) || t > this.length) throw RangeError("Attempt to write outside buffer bounds");
                    n || (n = "utf8");
                    for (var p = !1;;) switch (n) {
                        case "hex":
                            return function(r, t, e, n) {
                                e = Number(e) || 0;
                                var o = r.length - e;
                                n ? (n = Number(n)) > o && (n = o) : n = o;
                                var i = t.length;
                                n > i / 2 && (n = i / 2);
                                for (var s = 0; s < n; ++s) {
                                    var a, u = parseInt(t.substr(2 * s, 2), 16);
                                    if ((a = u) != a) break;
                                    r[e + s] = u
                                }
                                return s
                            }(this, r, t, e);
                        case "utf8":
                        case "utf-8":
                            return o = t, i = e, S(P(r, this.length - o), this, o, i);
                        case "ascii":
                            return s = t, a = e, S(x(r), this, s, a);
                        case "latin1":
                        case "binary":
                            return function(r, t, e, n) {
                                return S(x(t), r, e, n)
                            }(this, r, t, e);
                        case "base64":
                            return u = t, f = e, S(B(r), this, u, f);
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return h = t, l = e, S(function(r, t) {
                                for (var e, n, o = [], i = 0; i < r.length && !((t -= 2) < 0); ++i) n = (e = r.charCodeAt(i)) >> 8, o.push(e % 256), o.push(n);
                                return o
                            }(r, this.length - h), this, h, l);
                        default:
                            if (p) throw TypeError("Unknown encoding: " + n);
                            n = ("" + n).toLowerCase(), p = !0
                    }
                }, a.prototype.toJSON = function() {
                    return {
                        type: "Buffer",
                        data: Array.prototype.slice.call(this._arr || this, 0)
                    }
                }, a.prototype.slice = function(r, t) {
                    var e = this.length;
                    r = ~~r, t = void 0 === t ? e : ~~t, r < 0 ? (r += e) < 0 && (r = 0) : r > e && (r = e), t < 0 ? (t += e) < 0 && (t = 0) : t > e && (t = e), t < r && (t = r);
                    var n = this.subarray(r, t);
                    return Object.setPrototypeOf(n, a.prototype), n
                }, a.prototype.readUIntLE = function(r, t, e) {
                    r >>>= 0, t >>>= 0, e || w(r, t, this.length);
                    for (var n = this[r], o = 1, i = 0; ++i < t && (o *= 256);) n += this[r + i] * o;
                    return n
                }, a.prototype.readUIntBE = function(r, t, e) {
                    r >>>= 0, t >>>= 0, e || w(r, t, this.length);
                    for (var n = this[r + --t], o = 1; t > 0 && (o *= 256);) n += this[r + --t] * o;
                    return n
                }, a.prototype.readUInt8 = function(r, t) {
                    return r >>>= 0, t || w(r, 1, this.length), this[r]
                }, a.prototype.readUInt16LE = function(r, t) {
                    return r >>>= 0, t || w(r, 2, this.length), this[r] | this[r + 1] << 8
                }, a.prototype.readUInt16BE = function(r, t) {
                    return r >>>= 0, t || w(r, 2, this.length), this[r] << 8 | this[r + 1]
                }, a.prototype.readUInt32LE = function(r, t) {
                    return r >>>= 0, t || w(r, 4, this.length), (this[r] | this[r + 1] << 8 | this[r + 2] << 16) + 0x1000000 * this[r + 3]
                }, a.prototype.readUInt32BE = function(r, t) {
                    return r >>>= 0, t || w(r, 4, this.length), 0x1000000 * this[r] + (this[r + 1] << 16 | this[r + 2] << 8 | this[r + 3])
                }, a.prototype.readIntLE = function(r, t, e) {
                    r >>>= 0, t >>>= 0, e || w(r, t, this.length);
                    for (var n = this[r], o = 1, i = 0; ++i < t && (o *= 256);) n += this[r + i] * o;
                    return n >= (o *= 128) && (n -= Math.pow(2, 8 * t)), n
                }, a.prototype.readIntBE = function(r, t, e) {
                    r >>>= 0, t >>>= 0, e || w(r, t, this.length);
                    for (var n = t, o = 1, i = this[r + --n]; n > 0 && (o *= 256);) i += this[r + --n] * o;
                    return i >= (o *= 128) && (i -= Math.pow(2, 8 * t)), i
                }, a.prototype.readInt8 = function(r, t) {
                    return (r >>>= 0, t || w(r, 1, this.length), 128 & this[r]) ? -((255 - this[r] + 1) * 1) : this[r]
                }, a.prototype.readInt16LE = function(r, t) {
                    r >>>= 0, t || w(r, 2, this.length);
                    var e = this[r] | this[r + 1] << 8;
                    return 32768 & e ? 0xffff0000 | e : e
                }, a.prototype.readInt16BE = function(r, t) {
                    r >>>= 0, t || w(r, 2, this.length);
                    var e = this[r + 1] | this[r] << 8;
                    return 32768 & e ? 0xffff0000 | e : e
                }, a.prototype.readInt32LE = function(r, t) {
                    return r >>>= 0, t || w(r, 4, this.length), this[r] | this[r + 1] << 8 | this[r + 2] << 16 | this[r + 3] << 24
                }, a.prototype.readInt32BE = function(r, t) {
                    return r >>>= 0, t || w(r, 4, this.length), this[r] << 24 | this[r + 1] << 16 | this[r + 2] << 8 | this[r + 3]
                }, a.prototype.readFloatLE = function(r, t) {
                    return r >>>= 0, t || w(r, 4, this.length), o.read(this, r, !0, 23, 4)
                }, a.prototype.readFloatBE = function(r, t) {
                    return r >>>= 0, t || w(r, 4, this.length), o.read(this, r, !1, 23, 4)
                }, a.prototype.readDoubleLE = function(r, t) {
                    return r >>>= 0, t || w(r, 8, this.length), o.read(this, r, !0, 52, 8)
                }, a.prototype.readDoubleBE = function(r, t) {
                    return r >>>= 0, t || w(r, 8, this.length), o.read(this, r, !1, 52, 8)
                }, a.prototype.writeUIntLE = function(r, t, e, n) {
                    if (r *= 1, t >>>= 0, e >>>= 0, !n) {
                        var o = Math.pow(2, 8 * e) - 1;
                        b(this, r, t, e, o, 0)
                    }
                    var i = 1,
                        s = 0;
                    for (this[t] = 255 & r; ++s < e && (i *= 256);) this[t + s] = r / i & 255;
                    return t + e
                }, a.prototype.writeUIntBE = function(r, t, e, n) {
                    if (r *= 1, t >>>= 0, e >>>= 0, !n) {
                        var o = Math.pow(2, 8 * e) - 1;
                        b(this, r, t, e, o, 0)
                    }
                    var i = e - 1,
                        s = 1;
                    for (this[t + i] = 255 & r; --i >= 0 && (s *= 256);) this[t + i] = r / s & 255;
                    return t + e
                }, a.prototype.writeUInt8 = function(r, t, e) {
                    return r *= 1, t >>>= 0, e || b(this, r, t, 1, 255, 0), this[t] = 255 & r, t + 1
                }, a.prototype.writeUInt16LE = function(r, t, e) {
                    return r *= 1, t >>>= 0, e || b(this, r, t, 2, 65535, 0), this[t] = 255 & r, this[t + 1] = r >>> 8, t + 2
                }, a.prototype.writeUInt16BE = function(r, t, e) {
                    return r *= 1, t >>>= 0, e || b(this, r, t, 2, 65535, 0), this[t] = r >>> 8, this[t + 1] = 255 & r, t + 2
                }, a.prototype.writeUInt32LE = function(r, t, e) {
                    return r *= 1, t >>>= 0, e || b(this, r, t, 4, 0xffffffff, 0), this[t + 3] = r >>> 24, this[t + 2] = r >>> 16, this[t + 1] = r >>> 8, this[t] = 255 & r, t + 4
                }, a.prototype.writeUInt32BE = function(r, t, e) {
                    return r *= 1, t >>>= 0, e || b(this, r, t, 4, 0xffffffff, 0), this[t] = r >>> 24, this[t + 1] = r >>> 16, this[t + 2] = r >>> 8, this[t + 3] = 255 & r, t + 4
                }, a.prototype.writeIntLE = function(r, t, e, n) {
                    if (r *= 1, t >>>= 0, !n) {
                        var o = Math.pow(2, 8 * e - 1);
                        b(this, r, t, e, o - 1, -o)
                    }
                    var i = 0,
                        s = 1,
                        a = 0;
                    for (this[t] = 255 & r; ++i < e && (s *= 256);) r < 0 && 0 === a && 0 !== this[t + i - 1] && (a = 1), this[t + i] = (r / s | 0) - a & 255;
                    return t + e
                }, a.prototype.writeIntBE = function(r, t, e, n) {
                    if (r *= 1, t >>>= 0, !n) {
                        var o = Math.pow(2, 8 * e - 1);
                        b(this, r, t, e, o - 1, -o)
                    }
                    var i = e - 1,
                        s = 1,
                        a = 0;
                    for (this[t + i] = 255 & r; --i >= 0 && (s *= 256);) r < 0 && 0 === a && 0 !== this[t + i + 1] && (a = 1), this[t + i] = (r / s | 0) - a & 255;
                    return t + e
                }, a.prototype.writeInt8 = function(r, t, e) {
                    return r *= 1, t >>>= 0, e || b(this, r, t, 1, 127, -128), r < 0 && (r = 255 + r + 1), this[t] = 255 & r, t + 1
                }, a.prototype.writeInt16LE = function(r, t, e) {
                    return r *= 1, t >>>= 0, e || b(this, r, t, 2, 32767, -32768), this[t] = 255 & r, this[t + 1] = r >>> 8, t + 2
                }, a.prototype.writeInt16BE = function(r, t, e) {
                    return r *= 1, t >>>= 0, e || b(this, r, t, 2, 32767, -32768), this[t] = r >>> 8, this[t + 1] = 255 & r, t + 2
                }, a.prototype.writeInt32LE = function(r, t, e) {
                    return r *= 1, t >>>= 0, e || b(this, r, t, 4, 0x7fffffff, -0x80000000), this[t] = 255 & r, this[t + 1] = r >>> 8, this[t + 2] = r >>> 16, this[t + 3] = r >>> 24, t + 4
                }, a.prototype.writeInt32BE = function(r, t, e) {
                    return r *= 1, t >>>= 0, e || b(this, r, t, 4, 0x7fffffff, -0x80000000), r < 0 && (r = 0xffffffff + r + 1), this[t] = r >>> 24, this[t + 1] = r >>> 16, this[t + 2] = r >>> 8, this[t + 3] = 255 & r, t + 4
                }, a.prototype.writeFloatLE = function(r, t, e) {
                    return A(this, r, t, !0, e)
                }, a.prototype.writeFloatBE = function(r, t, e) {
                    return A(this, r, t, !1, e)
                }, a.prototype.writeDoubleLE = function(r, t, e) {
                    return U(this, r, t, !0, e)
                }, a.prototype.writeDoubleBE = function(r, t, e) {
                    return U(this, r, t, !1, e)
                }, a.prototype.copy = function(r, t, e, n) {
                    if (!a.isBuffer(r)) throw TypeError("argument should be a Buffer");
                    if (e || (e = 0), n || 0 === n || (n = this.length), t >= r.length && (t = r.length), t || (t = 0), n > 0 && n < e && (n = e), n === e || 0 === r.length || 0 === this.length) return 0;
                    if (t < 0) throw RangeError("targetStart out of bounds");
                    if (e < 0 || e >= this.length) throw RangeError("Index out of range");
                    if (n < 0) throw RangeError("sourceEnd out of bounds");
                    n > this.length && (n = this.length), r.length - t < n - e && (n = r.length - t + e);
                    var o = n - e;
                    if (this === r && "function" == typeof Uint8Array.prototype.copyWithin) this.copyWithin(t, e, n);
                    else if (this === r && e < t && t < n)
                        for (var i = o - 1; i >= 0; --i) r[i + t] = this[i + e];
                    else Uint8Array.prototype.set.call(r, this.subarray(e, n), t);
                    return o
                }, a.prototype.fill = function(r, t, e, n) {
                    if ("string" == typeof r) {
                        if ("string" == typeof t ? (n = t, t = 0, e = this.length) : "string" == typeof e && (n = e, e = this.length), void 0 !== n && "string" != typeof n) throw TypeError("encoding must be a string");
                        if ("string" == typeof n && !a.isEncoding(n)) throw TypeError("Unknown encoding: " + n);
                        if (1 === r.length) {
                            var o, i = r.charCodeAt(0);
                            ("utf8" === n && i < 128 || "latin1" === n) && (r = i)
                        }
                    } else "number" == typeof r ? r &= 255 : "boolean" == typeof r && (r = Number(r));
                    if (t < 0 || this.length < t || this.length < e) throw RangeError("Out of range index");
                    if (e <= t) return this;
                    if (t >>>= 0, e = void 0 === e ? this.length : e >>> 0, r || (r = 0), "number" == typeof r)
                        for (o = t; o < e; ++o) this[o] = r;
                    else {
                        var s = a.isBuffer(r) ? r : a.from(r, n),
                            u = s.length;
                        if (0 === u) throw TypeError('The value "' + r + '" is invalid for argument "value"');
                        for (o = 0; o < e - t; ++o) this[o + t] = s[o % u]
                    }
                    return this
                };
                var O = /[^+/0-9A-Za-z-_]/g;

                function P(r, t) {
                    t = t || 1 / 0;
                    for (var e, n = r.length, o = null, i = [], s = 0; s < n; ++s) {
                        if ((e = r.charCodeAt(s)) > 55295 && e < 57344) {
                            if (!o) {
                                if (e > 56319 || s + 1 === n) {
                                    (t -= 3) > -1 && i.push(239, 191, 189);
                                    continue
                                }
                                o = e;
                                continue
                            }
                            if (e < 56320) {
                                (t -= 3) > -1 && i.push(239, 191, 189), o = e;
                                continue
                            }
                            e = (o - 55296 << 10 | e - 56320) + 65536
                        } else o && (t -= 3) > -1 && i.push(239, 191, 189);
                        if (o = null, e < 128) {
                            if ((t -= 1) < 0) break;
                            i.push(e)
                        } else if (e < 2048) {
                            if ((t -= 2) < 0) break;
                            i.push(e >> 6 | 192, 63 & e | 128)
                        } else if (e < 65536) {
                            if ((t -= 3) < 0) break;
                            i.push(e >> 12 | 224, e >> 6 & 63 | 128, 63 & e | 128)
                        } else if (e < 1114112) {
                            if ((t -= 4) < 0) break;
                            i.push(e >> 18 | 240, e >> 12 & 63 | 128, e >> 6 & 63 | 128, 63 & e | 128)
                        } else throw Error("Invalid code point")
                    }
                    return i
                }

                function x(r) {
                    for (var t = [], e = 0; e < r.length; ++e) t.push(255 & r.charCodeAt(e));
                    return t
                }

                function B(r) {
                    return n.toByteArray(function(r) {
                        if ((r = (r = r.split("=")[0]).trim().replace(O, "")).length < 2) return "";
                        for (; r.length % 4 != 0;) r += "=";
                        return r
                    }(r))
                }

                function S(r, t, e, n) {
                    for (var o = 0; o < n && !(o + e >= t.length) && !(o >= r.length); ++o) t[o + e] = r[o];
                    return o
                }

                function R(r, t) {
                    return r instanceof t || null != r && null != r.constructor && null != r.constructor.name && r.constructor.name === t.name
                }
                var L = function() {
                    for (var r = "0123456789abcdef", t = Array(256), e = 0; e < 16; ++e)
                        for (var n = 16 * e, o = 0; o < 16; ++o) t[n + o] = r[e] + r[o];
                    return t
                }()
            },
            783: function(r, t) {
                t.read = function(r, t, e, n, o) {
                    var i, s, a = 8 * o - n - 1,
                        u = (1 << a) - 1,
                        f = u >> 1,
                        h = -7,
                        l = e ? o - 1 : 0,
                        c = e ? -1 : 1,
                        p = r[t + l];
                    for (l += c, i = p & (1 << -h) - 1, p >>= -h, h += a; h > 0; i = 256 * i + r[t + l], l += c, h -= 8);
                    for (s = i & (1 << -h) - 1, i >>= -h, h += n; h > 0; s = 256 * s + r[t + l], l += c, h -= 8);
                    if (0 === i) i = 1 - f;
                    else {
                        if (i === u) return s ? NaN : 1 / 0 * (p ? -1 : 1);
                        s += Math.pow(2, n), i -= f
                    }
                    return (p ? -1 : 1) * s * Math.pow(2, i - n)
                }, t.write = function(r, t, e, n, o, i) {
                    var s, a, u, f = 8 * i - o - 1,
                        h = (1 << f) - 1,
                        l = h >> 1,
                        c = 5960464477539062e-23 * (23 === o),
                        p = n ? 0 : i - 1,
                        y = n ? 1 : -1,
                        g = +(t < 0 || 0 === t && 1 / t < 0);
                    for (isNaN(t = Math.abs(t)) || t === 1 / 0 ? (a = +!!isNaN(t), s = h) : (s = Math.floor(Math.log(t) / Math.LN2), t * (u = Math.pow(2, -s)) < 1 && (s--, u *= 2), s + l >= 1 ? t += c / u : t += c * Math.pow(2, 1 - l), t * u >= 2 && (s++, u /= 2), s + l >= h ? (a = 0, s = h) : s + l >= 1 ? (a = (t * u - 1) * Math.pow(2, o), s += l) : (a = t * Math.pow(2, l - 1) * Math.pow(2, o), s = 0)); o >= 8; r[e + p] = 255 & a, p += y, a /= 256, o -= 8);
                    for (s = s << o | a, f += o; f > 0; r[e + p] = 255 & s, p += y, s /= 256, f -= 8);
                    r[e + p - y] |= 128 * g
                }
            }
        },
        o = {};

    function i(r) {
        var t = o[r];
        if (void 0 !== t) return t.exports;
        var e = o[r] = {
                exports: {}
            },
            s = !0;
        try {
            n[r](e, e.exports, i), s = !1
        } finally {
            s && delete o[r]
        }
        return e.exports
    }
    i.ab = "/ROOT/node_modules/.pnpm/next@16.2.6_patch_hash=2889283f843aeb9b88db5fd798b6e589c78c4b38fab3ccd115a3f784da4f1be8_5143821f351443e644013a4d37024e4a/node_modules/next/dist/compiled/buffer/", t.exports = i(72)
}, 878598, (r, t, e) => {
    "use strict";
    var n = r.i(28199);
    let o = void 0 !== n.Buffer,
        i = /"(?:_|\\u005[Ff])(?:_|\\u005[Ff])(?:p|\\u0070)(?:r|\\u0072)(?:o|\\u006[Ff])(?:t|\\u0074)(?:o|\\u006[Ff])(?:_|\\u005[Ff])(?:_|\\u005[Ff])"\s*:/,
        s = /"(?:c|\\u0063)(?:o|\\u006[Ff])(?:n|\\u006[Ee])(?:s|\\u0073)(?:t|\\u0074)(?:r|\\u0072)(?:u|\\u0075)(?:c|\\u0063)(?:t|\\u0074)(?:o|\\u006[Ff])(?:r|\\u0072)"\s*:/;

    function a(r, t, e) {
        null == e && null !== t && "object" == typeof t && (e = t, t = void 0), o && n.Buffer.isBuffer(r) && (r = r.toString()), r && 65279 === r.charCodeAt(0) && (r = r.slice(1));
        let a = JSON.parse(r, t);
        if (null === a || "object" != typeof a) return a;
        let f = e && e.protoAction || "error",
            h = e && e.constructorAction || "error";
        if ("ignore" === f && "ignore" === h) return a;
        if ("ignore" !== f && "ignore" !== h) {
            if (!1 === i.test(r) && !1 === s.test(r)) return a
        } else if ("ignore" !== f && "ignore" === h) {
            if (!1 === i.test(r)) return a
        } else if (!1 === s.test(r)) return a;
        return u(a, {
            protoAction: f,
            constructorAction: h,
            safe: e && e.safe
        })
    }

    function u(r) {
        let {
            protoAction: t = "error",
            constructorAction: e = "error",
            safe: n
        } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, o = [r];
        for (; o.length;) {
            let r = o;
            for (let i of (o = [], r)) {
                if ("ignore" !== t && Object.prototype.hasOwnProperty.call(i, "__proto__")) {
                    if (!0 === n) return null;
                    if ("error" === t) throw SyntaxError("Object contains forbidden prototype property");
                    delete i.__proto__
                }
                if ("ignore" !== e && Object.prototype.hasOwnProperty.call(i, "constructor") && null !== i.constructor && "object" == typeof i.constructor && Object.prototype.hasOwnProperty.call(i.constructor, "prototype")) {
                    if (!0 === n) return null;
                    if ("error" === e) throw SyntaxError("Object contains forbidden prototype property");
                    delete i.constructor
                }
                for (let r in i) {
                    let t = i[r];
                    t && "object" == typeof t && o.push(t)
                }
            }
        }
        return r
    }

    function f(r, t, e) {
        let {
            stackTraceLimit: n
        } = Error;
        Error.stackTraceLimit = 0;
        try {
            return a(r, t, e)
        } finally {
            Error.stackTraceLimit = n
        }
    }
    t.exports = f, t.exports.default = f, t.exports.parse = f, t.exports.safeParse = function(r, t) {
        let {
            stackTraceLimit: e
        } = Error;
        Error.stackTraceLimit = 0;
        try {
            return a(r, t, {
                safe: !0
            })
        } catch {
            return
        } finally {
            Error.stackTraceLimit = e
        }
    }, t.exports.scan = u
}, 723941, 240549, r => {
    "use strict";
    var t = r.i(868275),
        e = r.i(878598),
        n = r.i(360702);
    let o = (r, t) => {
        let e = r.safeParse(t);
        return e.success ? (0, n.ok)(e.data) : (0, n.err)(e.error)
    };
    r.s(["zodSafeParse", 0, o, "zodSafeParseAsync", 0, (r, t) => n.AsyncResult.fromPromiseResult(r.safeParseAsync(t).then(r => r.success ? (0, n.ok)(r.data) : (0, n.err)(r.error)))], 240549);
    class i extends Error {
        constructor(r) {
            super(r.error.message, {
                cause: r
            }), (0, t._)(this, "cause", void 0), this.cause = r
        }
    }
    class s extends Error {
        constructor(r) {
            super(r.message, {
                cause: r
            }), (0, t._)(this, "cause", void 0), this.cause = r
        }
    }
    let a = r => {
        let t;
        try {
            t = JSON.parse(r)
        } catch (r) {
            return (0, n.err)(new i({
                code: "Syntax",
                error: r
            }))
        }
        if (null != t && "object" == typeof t) try {
            (0, e.scan)(t)
        } catch (r) {
            return (0, n.err)(new i({
                code: "PrototypeProperty",
                error: r
            }))
        }
        return (0, n.ok)(t)
    };
    r.s(["JsonDeserializationError", 0, i, "deserialize", 0, (r, t) => a(t).andThen(t => o(r, t).mapErr(r => new i({
        code: "Validation",
        error: r
    }))), "deserializeUntyped", 0, r => a(r), "serialize", 0, (r, t) => {
        try {
            return (0, n.ok)(JSON.stringify(r, void 0, t))
        } catch (r) {
            return (0, n.err)(new s(r))
        }
    }], 723941)
}, 868275, 360702, r => {
    "use strict";
    var t;

    function e(r, t, e) {
        return t in r ? Object.defineProperty(r, t, {
            value: e,
            enumerable: !0,
            configurable: !0,
            writable: !0
        }) : r[t] = e, r
    }
    r.s(["_", 0, e], 868275);
    class n {
        cast() {
            return this
        }
        isOk() {
            return !0
        }
        isErr() {
            return !1
        }
        map(r) {
            return new n(r(this.value))
        }
        mapErr(r) {
            return this.cast()
        }
        andThen(r) {
            return r(this.value)
        }
        andThenAsync(r) {
            return r(this.value)
        }
        orElse(r) {
            return this.cast()
        }
        orElseAsync(r) {
            return i.fromResult(this.cast())
        }
        inspect(r) {
            return r(this.value), this
        }
        inspectErr(r) {
            return this
        }
        match(r, t) {
            return r(this.value)
        }
        getOrDefault(r) {
            return this.value
        }
        getOrNull() {
            return this.value
        }
        getOrElse(r) {
            return this.value
        }
        getOrThrow() {
            return this.value
        }
        getErrOrNull() {
            return null
        }
        constructor(r) {
            e(this, "value", void 0), this.value = r
        }
    }
    class o {
        cast() {
            return this
        }
        isOk() {
            return !1
        }
        isErr() {
            return !0
        }
        map(r) {
            return this.cast()
        }
        mapErr(r) {
            return new o(r(this.error))
        }
        andThen(r) {
            return this.cast()
        }
        andThenAsync(r) {
            return i.fromResult(this.cast())
        }
        orElse(r) {
            return r(this.error)
        }
        orElseAsync(r) {
            return r(this.error)
        }
        inspect(r) {
            return this
        }
        inspectErr(r) {
            return r(this.error), this
        }
        match(r, t) {
            return t(this.error)
        }
        getOrDefault(r) {
            return r
        }
        getOrNull() {
            return null
        }
        getOrElse(r) {
            return r()
        }
        getOrThrow() {
            throw this.error
        }
        getErrOrNull() {
            return this.error
        }
        constructor(r) {
            e(this, "error", void 0), this.error = r
        }
    }(t || (t = {})).all = r => {
        let t = r.findIndex(r => r.isErr());
        return -1 === t ? new n(r.map(r => r.getOrNull())) : r[t]
    };
    class i {
        static fromResult(r) {
            return new i(Promise.resolve(r))
        }
        static fromPromise(r, t) {
            return new i(r.then(r => new n(r)).catch(r => new o(t(r))))
        }
        static fromPromiseResult(r) {
            return new i(r)
        }
        static fromExecutor(r) {
            return new i(new Promise(t => {
                r(t)
            }))
        }
        static from(r) {
            return r instanceof i ? r : r instanceof Promise ? i.fromPromiseResult(r) : i.fromResult(r)
        }
        static fn(r) {
            return function() {
                for (var t = arguments.length, e = Array(t), n = 0; n < t; n++) e[n] = arguments[n];
                return i.fromPromiseResult(r(...e))
            }
        }
        static all(r) {
            return new i(Promise.all(r).then(t.all))
        }
        map(r) {
            return new i(this.promise.then(async t => t.isOk() ? new n(await r(t.value)) : t.cast()))
        }
        mapErr(r) {
            return new i(this.promise.then(async t => t.isErr() ? new o(await r(t.error)) : t.cast()))
        }
        andThen(r) {
            return new i(this.promise.then(t => {
                if (t.isErr()) return t.cast();
                let e = r(t.value);
                return e instanceof i ? e.promise : e
            }))
        }
        orElse(r) {
            return new i(this.promise.then(t => {
                if (t.isOk()) return t.cast();
                let e = r(t.error);
                return e instanceof i ? e.promise : e
            }))
        }
        then(r, t) {
            return this.promise.then(r, t)
        }
        inspect(r) {
            return new i(this.promise.then(t => (t.isOk() && r(t.value), t)))
        }
        inspectErr(r) {
            return new i(this.promise.then(t => (t.isErr() && r(t.error), t)))
        }
        match(r, t) {
            return this.promise.then(e => e.match(r, t))
        }
        getOrDefault(r) {
            return this.promise.then(t => t.getOrDefault(r))
        }
        getOrNull() {
            return this.promise.then(r => r.getOrNull())
        }
        getOrElse(r) {
            return this.promise.then(t => t.getOrElse(r))
        }
        getOrThrow() {
            return this.promise.then(r => r.getOrThrow())
        }
        getErrOrNull() {
            return this.promise.then(r => r.getErrOrNull())
        }
        constructor(r) {
            e(this, "promise", void 0), this.promise = r
        }
    }
    let s = r => new n(r),
        a = r => new o(r);
    r.s(["AsyncResult", 0, i, "err", 0, a, "errAsync", 0, r => i.fromResult(a(r)), "ok", 0, s, "okAsync", 0, r => i.fromResult(s(r)), "tryCatch", 0, (r, t) => {
        try {
            return s(r())
        } catch (r) {
            return a(t(r))
        }
    }], 360702)
}, 473897, r => {
    "use strict";
    r.s(["downcast", 0, r => r])
}, 574999, r => {
    "use strict";
    var t = r.i(868275);
    r.s(["BaseUrl", 0, class {
        get href() {
            return this.url.href
        }
        get scheme() {
            return this.url.protocol
        }
        get authority() {
            return this.url.host
        }
        get host() {
            return this.url.hostname
        }
        get port() {
            return this.url.port
        }
        get path() {
            return this.url.pathname
        }
        get query() {
            return this.url.search
        }
        get fragment() {
            return this.url.hash
        }
        toMutable() {
            return new URL(this.url)
        }
        toString() {
            return this.url.toString()
        }
        toJson() {
            return this.url.toJSON()
        }
        constructor(r, e) {
            (0, t._)(this, "url", void 0), (0, t._)(this, "searchParams", void 0), this.url = r, this.searchParams = e
        }
    }])
}, 851460, r => {
    "use strict";
    var t = r.i(868275),
        e = r.i(473897);
    let n = r => (0, e.downcast)(new URLSearchParams(r)),
        o = r => String(r),
        i = ["__proto__", "prototype", "constructor"],
        s = r => n([...r.entries()].filter(r => {
            let [t, e] = r;
            return !i.includes(t) && !i.includes(e)
        }));
    class a {
        static fromUnique(r) {
            return new a(r)
        }
        static internalFromUniqueURLSearchParams(r) {
            return a.fromUnique(r)
        }
        static new(r) {
            let t, e = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
            if (r instanceof a) return r;
            let i = n((Array.isArray(t = r) ? t : Object.entries(t)).map(r => {
                let [t, e] = r;
                return [t, o(e)]
            }));
            return a.fromUnique(e ? s(i) : i)
        }
        static fromURLSearchParams(r) {
            let t = !(arguments.length > 1) || void 0 === arguments[1] || arguments[1];
            return a.fromUnique(t ? s(r) : n(r))
        }
        static parse(r) {
            let t = !(arguments.length > 1) || void 0 === arguments[1] || arguments[1],
                e = n(r);
            return a.fromUnique(t ? s(e) : e)
        }
        resolveName(r, t) {
            if ("caseSensitive" === t || this.searchParams.has(r)) return r;
            let e = r.toLowerCase();
            for (let r of this.searchParams.keys())
                if (r.toLowerCase() === e) return r;
            return r
        }
        get size() {
            return this.searchParams.size
        }
        get(r) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "caseInsensitive";
            return this.searchParams.get(this.resolveName(r, t))
        }
        getAll(r) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "caseInsensitive";
            if ("caseSensitive" === t) return this.searchParams.getAll(r);
            let e = r.toLowerCase();
            return [...this.searchParams.entries()].filter(r => {
                let [t] = r;
                return t.toLowerCase() === e
            }).map(r => {
                let [, t] = r;
                return t
            })
        }
        has(r, t) {
            let e = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "caseInsensitive";
            return this.searchParams.has(this.resolveName(r, e), void 0 === t ? void 0 : o(t))
        }
        copyAndAppend(r, t) {
            let e = n(this.searchParams);
            return e.append(r, o(t)), a.fromUnique(e)
        }
        copyAndAppendAll(r) {
            let t = r instanceof URLSearchParams || r instanceof a || Array.isArray(r) ? r : Object.entries(r);
            return a.new([...this.searchParams, ...t])
        }
        copyAndSet(r, t) {
            let e = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "caseInsensitive";
            if ("caseSensitive" === e) {
                let e = n(this.searchParams);
                return e.set(r, o(t)), a.fromUnique(e)
            }
            let i = r.toLowerCase(),
                s = [],
                u = !1;
            for (let [e, n] of this.searchParams.entries()) e.toLowerCase() !== i ? s.push([e, n]) : u || (s.push([r, o(t)]), u = !0);
            return u || s.push([r, o(t)]), a.fromUnique(n(s))
        }
        copyAndDelete(r, t) {
            let e = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "caseInsensitive",
                i = r.toLowerCase(),
                s = void 0 === t ? void 0 : o(t),
                u = t => {
                    let [n, o] = t;
                    return ("caseSensitive" === e ? n === r : n.toLowerCase() === i) && (void 0 === s || o === s)
                },
                f = [...this.searchParams.entries()];
            return f.some(u) ? a.fromUnique(n(f.filter(r => !u(r)))) : this
        }
        toSorted() {
            let r = n(this.searchParams);
            return r.sort(), a.fromUnique(r)
        }
        toMutable() {
            return new URLSearchParams(this.searchParams)
        }
        toString() {
            return this.searchParams.toString()
        } [Symbol.iterator]() {
            return this.searchParams[Symbol.iterator]()
        }
        entries() {
            return this.searchParams.entries()
        }
        keys() {
            return this.searchParams.keys()
        }
        values() {
            return this.searchParams.values()
        }
        constructor(r) {
            (0, t._)(this, "searchParams", void 0), this.searchParams = r
        }
    }(0, t._)(a, "empty", a.fromUnique(n(""))), r.s(["UrlSearchParams", 0, a, "possiblyMaliciousParameters", 0, i])
}, 682259, r => {
    "use strict";
    r.s(["arrayIncludes", 0, (r, t) => r.includes(t), "isStringEnum", 0, (r, t) => Object.values(r).includes(t), "recordGet", 0, (r, t) => Object.hasOwn(r, t) ? r[t] : void 0])
}, 246382, r => {
    "use strict";
    var t = r.i(868275),
        e = r.i(360702),
        n = r.i(473897),
        o = r.i(682259),
        i = r.i(851460);
    let s = r => {
        switch (r.code) {
            case "ForbiddenScheme":
                return `forbidden scheme: ${r.scheme}`;
            case "ForbiddenHost":
                return `forbidden host: ${r.host}`;
            case "InvalidUrl":
                return "invalid URL"
        }
    };
    class a extends Error {
        constructor(r) {
            super(s(r), {
                cause: r
            }), (0, t._)(this, "cause", void 0), this.cause = r
        }
    }
    class u extends Error {
        constructor(r) {
            super(s(r), {
                cause: r
            }), (0, t._)(this, "cause", void 0), this.cause = r
        }
    }
    let f = r => (0, n.downcast)(new URL(r)),
        h = (r, t, s) => {
            let {
                schemeAllowlist: a,
                domainAllowlist: u,
                sanitize: f
            } = t;
            if (r.password = "", r.username = "", !(0, o.arrayIncludes)(a, r.protocol)) return (0, e.err)({
                code: "ForbiddenScheme",
                scheme: r.protocol
            });
            if (!u.some(t => t.startsWith(".") ? r.hostname.endsWith(t) || r.hostname === t.substring(1) : r.hostname === t)) return (0, e.err)({
                code: "ForbiddenHost",
                host: r.host
            });
            if (f) {
                let t = i.UrlSearchParams.fromURLSearchParams(r.searchParams);
                return r.search = t.toString(), (0, e.ok)(s(r, t))
            }
            let h = i.UrlSearchParams.internalFromUniqueURLSearchParams((0, n.downcast)(r.searchParams));
            return (0, e.ok)(s(r, h))
        };
    r.s(["cloneURL", 0, f, "fromURLWithRequiredOptions", 0, (r, t, e) => h(f(r), t, e).mapErr(r => new a(r)), "parseWithRequiredOptions", 0, (r, t, o) => (r => {
        try {
            return (0, e.ok)((0, n.downcast)(new URL(r)))
        } catch {
            return (0, e.err)(new u({
                code: "InvalidUrl"
            }))
        }
    })(r).andThen(r => h(r, t, o).mapErr(r => new u(r)))])
}, 587541, r => {
    "use strict";
    var t = r.i(574999),
        e = r.i(851460),
        n = r.i(246382);
    let o = ["https:"],
        i = {
            schemeAllowlist: o,
            domainAllowlist: [".roblox.com", ".robloxlabs.com", ".robloxapp.vnggames.com", "roblox.qq.com", "localhost"],
            sanitize: !0
        };
    class s extends t.BaseUrl {
        static new(r, t) {
            return r.port = "", new s(r, t)
        }
        static fromURLWithOptions(r, t) {
            return (0, n.fromURLWithRequiredOptions)(r, {
                ...i,
                ...t,
                schemeAllowlist: o
            }, s.new)
        }
        static fromURL(r) {
            return (0, n.fromURLWithRequiredOptions)(r, i, s.new)
        }
        static parseWithOptions(r, t) {
            return (0, n.parseWithRequiredOptions)(r, {
                ...i,
                ...t,
                schemeAllowlist: o
            }, s.new)
        }
        static parse(r) {
            return (0, n.parseWithRequiredOptions)(r, i, s.new)
        }
        get scheme() {
            return super.scheme
        }
        get port() {
            return super.port
        }
        with(r) {
            let {
                path: t,
                searchParams: o,
                fragment: i
            } = r;
            if (null == t && null == o && null == i) return this;
            let a = (0, n.cloneURL)(this.url);
            if (null != t && (a.pathname = t), null != i && (a.hash = i), null != o) {
                let r = e.UrlSearchParams.new(o);
                return a.search = r.toString(), new s(a, r)
            }
            return new s(a, this.searchParams)
        }
        withPath(r) {
            let t = (0, n.cloneURL)(this.url);
            return t.pathname = r, new s(t, this.searchParams)
        }
        withSearchParams(r) {
            let t = e.UrlSearchParams.new(r),
                o = (0, n.cloneURL)(this.url);
            return o.search = t.toString(), new s(o, t)
        }
        withSearchParamsAppended(r) {
            let t = this.searchParams.copyAndAppendAll(r),
                e = (0, n.cloneURL)(this.url);
            return e.search = t.toString(), new s(e, t)
        }
        withFragment(r) {
            let t = (0, n.cloneURL)(this.url);
            return t.hash = r, new s(t, this.searchParams)
        }
        constructor(r, t) {
            super(r, t)
        }
    }
    r.s(["Url", 0, s, "defaultUrlOptions", 0, i])
}, 577896, 152972, r => {
    "use strict";
    var t = r.i(682259),
        e = r.i(723941);
    let n = {
            nodeEnv: "production",
            robloxEnv: "production"
        },
        o = document.documentElement.dataset.env,
        i = null == o ? null : e.deserializeUntyped(o).getOrNull(),
        {
            nodeEnv: s,
            robloxEnv: a,
            ...u
        } = null == i || "object" != typeof i || Array.isArray(i) ? n : {
            ...n,
            ...i
        };
    r.s(["nodeEnv", 0, s, "robloxEnv", 0, a], 152972);
    let f = ["robloxapp.vnggames.com"],
        h = {
            sitetest3: "sitetest3.robloxlabs.com",
            sitetest2: "sitetest2.robloxlabs.com",
            sitetest1: "sitetest1.robloxlabs.com",
            production: "roblox.com"
        } [a];
    r.s(["defaultRootDomain", 0, h, "resolveDomain", 0, r => (0, t.arrayIncludes)(f, r) ? r : h], 577896)
}, 519003, 815079, r => {
    "use strict";
    var t = r.i(357355),
        e = r.i(577896),
        n = r.i(587541),
        o = r.i(152972);
    let i = (r, t) => n.Url.parse(`https://${r}.${t}`).getOrThrow(),
        s = n.Url.parseWithOptions("https://apis.rbxcdn.com", {
            domainAllowlist: ["apis.rbxcdn.com"]
        }).getOrThrow(),
        a = new Map,
        u = r => {
            let t = a.get(r);
            if (void 0 === t) {
                let e;
                e = i("apis", r), t = {
                    rootDomain: r,
                    wwwRoblox: i("www", r),
                    apiGateway: e,
                    apiGatewayCdn: "production" === o.robloxEnv ? s : e,
                    metricsApi: i("metrics", r),
                    authApi: i("auth", r),
                    localeApi: i("locale", r),
                    eventStreamApi: i("ecsv2", r)
                }, a.set(r, t)
            }
            return t
        },
        {
            rootDomain: f,
            wwwRoblox: h,
            apiGateway: l,
            apiGatewayCdn: c,
            metricsApi: p,
            authApi: y,
            localeApi: g,
            eventStreamApi: d
        } = u(e.defaultRootDomain);
    i("create", e.defaultRootDomain), n.Url.parse("https://corp.roblox.com").getOrThrow(), r.s(["baseUrlsForDomain", 0, u, "wwwRoblox", 0, h], 815079), r.s(["getPageBaseUrls", 0, () => u((0, e.resolveDomain)(t.document?.documentElement.dataset.domain))], 519003)
}]);

//# debugId=c8fe8180-1458-36ac-32b3-39fa020e61d1
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/0esqmkyyxbc3c.js.map