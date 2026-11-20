;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "0b4c7a04-9857-f07d-e0db-e8be949dd353")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 570098, (t, e, r) => {
    var n = {
            872: function(t, e) {
                "use strict";
                e.byteLength = function(t) {
                    var e = s(t),
                        r = e[0],
                        n = e[1];
                    return (r + n) * 3 / 4 - n
                }, e.toByteArray = function(t) {
                    var e, r, i = s(t),
                        a = i[0],
                        f = i[1],
                        u = new o((a + f) * 3 / 4 - f),
                        l = 0,
                        h = f > 0 ? a - 4 : a;
                    for (r = 0; r < h; r += 4) e = n[t.charCodeAt(r)] << 18 | n[t.charCodeAt(r + 1)] << 12 | n[t.charCodeAt(r + 2)] << 6 | n[t.charCodeAt(r + 3)], u[l++] = e >> 16 & 255, u[l++] = e >> 8 & 255, u[l++] = 255 & e;
                    return 2 === f && (e = n[t.charCodeAt(r)] << 2 | n[t.charCodeAt(r + 1)] >> 4, u[l++] = 255 & e), 1 === f && (e = n[t.charCodeAt(r)] << 10 | n[t.charCodeAt(r + 1)] << 4 | n[t.charCodeAt(r + 2)] >> 2, u[l++] = e >> 8 & 255, u[l++] = 255 & e), u
                }, e.fromByteArray = function(t) {
                    for (var e, n = t.length, o = n % 3, i = [], a = 0, f = n - o; a < f; a += 16383) i.push(function(t, e, n) {
                        for (var o, i = [], a = e; a < n; a += 3) o = (t[a] << 16 & 0xff0000) + (t[a + 1] << 8 & 65280) + (255 & t[a + 2]), i.push(r[o >> 18 & 63] + r[o >> 12 & 63] + r[o >> 6 & 63] + r[63 & o]);
                        return i.join("")
                    }(t, a, a + 16383 > f ? f : a + 16383));
                    return 1 === o ? i.push(r[(e = t[n - 1]) >> 2] + r[e << 4 & 63] + "==") : 2 === o && i.push(r[(e = (t[n - 2] << 8) + t[n - 1]) >> 10] + r[e >> 4 & 63] + r[e << 2 & 63] + "="), i.join("")
                };
                for (var r = [], n = [], o = "u" > typeof Uint8Array ? Uint8Array : Array, i = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", a = 0, f = i.length; a < f; ++a) r[a] = i[a], n[i.charCodeAt(a)] = a;

                function s(t) {
                    var e = t.length;
                    if (e % 4 > 0) throw Error("Invalid string. Length must be a multiple of 4");
                    var r = t.indexOf("="); - 1 === r && (r = e);
                    var n = r === e ? 0 : 4 - r % 4;
                    return [r, n]
                }
                n[45] = 62, n[95] = 63
            },
            230: function(t, e, r) {
                "use strict";
                var n = r(872),
                    o = r(321),
                    i = "function" == typeof Symbol && "function" == typeof Symbol.for ? Symbol.for("nodejs.util.inspect.custom") : null;

                function a(t) {
                    if (t > 0x7fffffff) throw RangeError('The value "' + t + '" is invalid for option "size"');
                    var e = new Uint8Array(t);
                    return Object.setPrototypeOf(e, f.prototype), e
                }

                function f(t, e, r) {
                    if ("number" == typeof t) {
                        if ("string" == typeof e) throw TypeError('The "string" argument must be of type string. Received type number');
                        return l(t)
                    }
                    return s(t, e, r)
                }

                function s(t, e, r) {
                    if ("string" == typeof t) {
                        var n = t,
                            o = e;
                        if (("string" != typeof o || "" === o) && (o = "utf8"), !f.isEncoding(o)) throw TypeError("Unknown encoding: " + o);
                        var i = 0 | p(n, o),
                            s = a(i),
                            u = s.write(n, o);
                        return u !== i && (s = s.slice(0, u)), s
                    }
                    if (ArrayBuffer.isView(t)) return h(t);
                    if (null == t) throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type " + typeof t);
                    if (U(t, ArrayBuffer) || t && U(t.buffer, ArrayBuffer) || "u" > typeof SharedArrayBuffer && (U(t, SharedArrayBuffer) || t && U(t.buffer, SharedArrayBuffer))) return function(t, e, r) {
                        var n;
                        if (e < 0 || t.byteLength < e) throw RangeError('"offset" is outside of buffer bounds');
                        if (t.byteLength < e + (r || 0)) throw RangeError('"length" is outside of buffer bounds');
                        return Object.setPrototypeOf(n = void 0 === e && void 0 === r ? new Uint8Array(t) : void 0 === r ? new Uint8Array(t, e) : new Uint8Array(t, e, r), f.prototype), n
                    }(t, e, r);
                    if ("number" == typeof t) throw TypeError('The "value" argument must not be of type number. Received type number');
                    var l = t.valueOf && t.valueOf();
                    if (null != l && l !== t) return f.from(l, e, r);
                    var g = function(t) {
                        if (f.isBuffer(t)) {
                            var e = 0 | c(t.length),
                                r = a(e);
                            return 0 === r.length || t.copy(r, 0, 0, e), r
                        }
                        return void 0 !== t.length ? "number" != typeof t.length || function(t) {
                            return t != t
                        }(t.length) ? a(0) : h(t) : "Buffer" === t.type && Array.isArray(t.data) ? h(t.data) : void 0
                    }(t);
                    if (g) return g;
                    if ("u" > typeof Symbol && null != Symbol.toPrimitive && "function" == typeof t[Symbol.toPrimitive]) return f.from(t[Symbol.toPrimitive]("string"), e, r);
                    throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type " + typeof t)
                }

                function u(t) {
                    if ("number" != typeof t) throw TypeError('"size" argument must be of type number');
                    if (t < 0) throw RangeError('The value "' + t + '" is invalid for option "size"')
                }

                function l(t) {
                    return u(t), a(t < 0 ? 0 : 0 | c(t))
                }

                function h(t) {
                    for (var e = t.length < 0 ? 0 : 0 | c(t.length), r = a(e), n = 0; n < e; n += 1) r[n] = 255 & t[n];
                    return r
                }
                e.Buffer = f, e.SlowBuffer = function(t) {
                    return +t != t && (t = 0), f.alloc(+t)
                }, e.INSPECT_MAX_BYTES = 50, e.kMaxLength = 0x7fffffff, f.TYPED_ARRAY_SUPPORT = function() {
                    try {
                        var t = new Uint8Array(1),
                            e = {
                                foo: function() {
                                    return 42
                                }
                            };
                        return Object.setPrototypeOf(e, Uint8Array.prototype), Object.setPrototypeOf(t, e), 42 === t.foo()
                    } catch (t) {
                        return !1
                    }
                }(), !f.TYPED_ARRAY_SUPPORT && "u" > typeof console && "function" == typeof console.error && console.error("This browser lacks typed array (Uint8Array) support which is required by `buffer` v5.x. Use `buffer` v4.x if you require old browser support."), Object.defineProperty(f.prototype, "parent", {
                    enumerable: !0,
                    get: function() {
                        if (f.isBuffer(this)) return this.buffer
                    }
                }), Object.defineProperty(f.prototype, "offset", {
                    enumerable: !0,
                    get: function() {
                        if (f.isBuffer(this)) return this.byteOffset
                    }
                }), f.poolSize = 8192, f.from = function(t, e, r) {
                    return s(t, e, r)
                }, Object.setPrototypeOf(f.prototype, Uint8Array.prototype), Object.setPrototypeOf(f, Uint8Array), f.alloc = function(t, e, r) {
                    return (u(t), t <= 0) ? a(t) : void 0 !== e ? "string" == typeof r ? a(t).fill(e, r) : a(t).fill(e) : a(t)
                }, f.allocUnsafe = function(t) {
                    return l(t)
                }, f.allocUnsafeSlow = function(t) {
                    return l(t)
                };

                function c(t) {
                    if (t >= 0x7fffffff) throw RangeError("Attempt to allocate Buffer larger than maximum size: 0x7fffffff bytes");
                    return 0 | t
                }

                function p(t, e) {
                    if (f.isBuffer(t)) return t.length;
                    if (ArrayBuffer.isView(t) || U(t, ArrayBuffer)) return t.byteLength;
                    if ("string" != typeof t) throw TypeError('The "string" argument must be one of type string, Buffer, or ArrayBuffer. Received type ' + typeof t);
                    var r = t.length,
                        n = arguments.length > 2 && !0 === arguments[2];
                    if (!n && 0 === r) return 0;
                    for (var o = !1;;) switch (e) {
                        case "ascii":
                        case "latin1":
                        case "binary":
                            return r;
                        case "utf8":
                        case "utf-8":
                            return T(t).length;
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return 2 * r;
                        case "hex":
                            return r >>> 1;
                        case "base64":
                            return C(t).length;
                        default:
                            if (o) return n ? -1 : T(t).length;
                            e = ("" + e).toLowerCase(), o = !0
                    }
                }

                function g(t, e, r) {
                    var o, i, a, f = !1;
                    if ((void 0 === e || e < 0) && (e = 0), e > this.length || ((void 0 === r || r > this.length) && (r = this.length), r <= 0 || (r >>>= 0) <= (e >>>= 0))) return "";
                    for (t || (t = "utf8");;) switch (t) {
                        case "hex":
                            return function(t, e, r) {
                                var n = t.length;
                                (!e || e < 0) && (e = 0), (!r || r < 0 || r > n) && (r = n);
                                for (var o = "", i = e; i < r; ++i) o += I[t[i]];
                                return o
                            }(this, e, r);
                        case "utf8":
                        case "utf-8":
                            return v(this, e, r);
                        case "ascii":
                            return function(t, e, r) {
                                var n = "";
                                r = Math.min(t.length, r);
                                for (var o = e; o < r; ++o) n += String.fromCharCode(127 & t[o]);
                                return n
                            }(this, e, r);
                        case "latin1":
                        case "binary":
                            return function(t, e, r) {
                                var n = "";
                                r = Math.min(t.length, r);
                                for (var o = e; o < r; ++o) n += String.fromCharCode(t[o]);
                                return n
                            }(this, e, r);
                        case "base64":
                            return o = this, i = e, a = r, 0 === i && a === o.length ? n.fromByteArray(o) : n.fromByteArray(o.slice(i, a));
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return function(t, e, r) {
                                for (var n = t.slice(e, r), o = "", i = 0; i < n.length; i += 2) o += String.fromCharCode(n[i] + 256 * n[i + 1]);
                                return o
                            }(this, e, r);
                        default:
                            if (f) throw TypeError("Unknown encoding: " + t);
                            t = (t + "").toLowerCase(), f = !0
                    }
                }

                function y(t, e, r) {
                    var n = t[e];
                    t[e] = t[r], t[r] = n
                }

                function d(t, e, r, n, o) {
                    var i;
                    if (0 === t.length) return -1;
                    if ("string" == typeof r ? (n = r, r = 0) : r > 0x7fffffff ? r = 0x7fffffff : r < -0x80000000 && (r = -0x80000000), (i = r *= 1) != i && (r = o ? 0 : t.length - 1), r < 0 && (r = t.length + r), r >= t.length)
                        if (o) return -1;
                        else r = t.length - 1;
                    else if (r < 0)
                        if (!o) return -1;
                        else r = 0;
                    if ("string" == typeof e && (e = f.from(e, n)), f.isBuffer(e)) return 0 === e.length ? -1 : m(t, e, r, n, o);
                    if ("number" == typeof e) {
                        if (e &= 255, "function" == typeof Uint8Array.prototype.indexOf)
                            if (o) return Uint8Array.prototype.indexOf.call(t, e, r);
                            else return Uint8Array.prototype.lastIndexOf.call(t, e, r);
                        return m(t, [e], r, n, o)
                    }
                    throw TypeError("val must be string, number or Buffer")
                }

                function m(t, e, r, n, o) {
                    var i, a = 1,
                        f = t.length,
                        s = e.length;
                    if (void 0 !== n && ("ucs2" === (n = String(n).toLowerCase()) || "ucs-2" === n || "utf16le" === n || "utf-16le" === n)) {
                        if (t.length < 2 || e.length < 2) return -1;
                        a = 2, f /= 2, s /= 2, r /= 2
                    }

                    function u(t, e) {
                        return 1 === a ? t[e] : t.readUInt16BE(e * a)
                    }
                    if (o) {
                        var l = -1;
                        for (i = r; i < f; i++)
                            if (u(t, i) === u(e, -1 === l ? 0 : i - l)) {
                                if (-1 === l && (l = i), i - l + 1 === s) return l * a
                            } else - 1 !== l && (i -= i - l), l = -1
                    } else
                        for (r + s > f && (r = f - s), i = r; i >= 0; i--) {
                            for (var h = !0, c = 0; c < s; c++)
                                if (u(t, i + c) !== u(e, c)) {
                                    h = !1;
                                    break
                                } if (h) return i
                        }
                    return -1
                }
                f.isBuffer = function(t) {
                    return null != t && !0 === t._isBuffer && t !== f.prototype
                }, f.compare = function(t, e) {
                    if (U(t, Uint8Array) && (t = f.from(t, t.offset, t.byteLength)), U(e, Uint8Array) && (e = f.from(e, e.offset, e.byteLength)), !f.isBuffer(t) || !f.isBuffer(e)) throw TypeError('The "buf1", "buf2" arguments must be one of type Buffer or Uint8Array');
                    if (t === e) return 0;
                    for (var r = t.length, n = e.length, o = 0, i = Math.min(r, n); o < i; ++o)
                        if (t[o] !== e[o]) {
                            r = t[o], n = e[o];
                            break
                        } return r < n ? -1 : +(n < r)
                }, f.isEncoding = function(t) {
                    switch (String(t).toLowerCase()) {
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
                }, f.concat = function(t, e) {
                    if (!Array.isArray(t)) throw TypeError('"list" argument must be an Array of Buffers');
                    if (0 === t.length) return f.alloc(0);
                    if (void 0 === e)
                        for (r = 0, e = 0; r < t.length; ++r) e += t[r].length;
                    var r, n = f.allocUnsafe(e),
                        o = 0;
                    for (r = 0; r < t.length; ++r) {
                        var i = t[r];
                        if (U(i, Uint8Array) && (i = f.from(i)), !f.isBuffer(i)) throw TypeError('"list" argument must be an Array of Buffers');
                        i.copy(n, o), o += i.length
                    }
                    return n
                }, f.byteLength = p, f.prototype._isBuffer = !0, f.prototype.swap16 = function() {
                    var t = this.length;
                    if (t % 2 != 0) throw RangeError("Buffer size must be a multiple of 16-bits");
                    for (var e = 0; e < t; e += 2) y(this, e, e + 1);
                    return this
                }, f.prototype.swap32 = function() {
                    var t = this.length;
                    if (t % 4 != 0) throw RangeError("Buffer size must be a multiple of 32-bits");
                    for (var e = 0; e < t; e += 4) y(this, e, e + 3), y(this, e + 1, e + 2);
                    return this
                }, f.prototype.swap64 = function() {
                    var t = this.length;
                    if (t % 8 != 0) throw RangeError("Buffer size must be a multiple of 64-bits");
                    for (var e = 0; e < t; e += 8) y(this, e, e + 7), y(this, e + 1, e + 6), y(this, e + 2, e + 5), y(this, e + 3, e + 4);
                    return this
                }, f.prototype.toString = function() {
                    var t = this.length;
                    return 0 === t ? "" : 0 == arguments.length ? v(this, 0, t) : g.apply(this, arguments)
                }, f.prototype.toLocaleString = f.prototype.toString, f.prototype.equals = function(t) {
                    if (!f.isBuffer(t)) throw TypeError("Argument must be a Buffer");
                    return this === t || 0 === f.compare(this, t)
                }, f.prototype.inspect = function() {
                    var t = "",
                        r = e.INSPECT_MAX_BYTES;
                    return t = this.toString("hex", 0, r).replace(/(.{2})/g, "$1 ").trim(), this.length > r && (t += " ... "), "<Buffer " + t + ">"
                }, i && (f.prototype[i] = f.prototype.inspect), f.prototype.compare = function(t, e, r, n, o) {
                    if (U(t, Uint8Array) && (t = f.from(t, t.offset, t.byteLength)), !f.isBuffer(t)) throw TypeError('The "target" argument must be one of type Buffer or Uint8Array. Received type ' + typeof t);
                    if (void 0 === e && (e = 0), void 0 === r && (r = t ? t.length : 0), void 0 === n && (n = 0), void 0 === o && (o = this.length), e < 0 || r > t.length || n < 0 || o > this.length) throw RangeError("out of range index");
                    if (n >= o && e >= r) return 0;
                    if (n >= o) return -1;
                    if (e >= r) return 1;
                    if (e >>>= 0, r >>>= 0, n >>>= 0, o >>>= 0, this === t) return 0;
                    for (var i = o - n, a = r - e, s = Math.min(i, a), u = this.slice(n, o), l = t.slice(e, r), h = 0; h < s; ++h)
                        if (u[h] !== l[h]) {
                            i = u[h], a = l[h];
                            break
                        } return i < a ? -1 : +(a < i)
                }, f.prototype.includes = function(t, e, r) {
                    return -1 !== this.indexOf(t, e, r)
                }, f.prototype.indexOf = function(t, e, r) {
                    return d(this, t, e, r, !0)
                }, f.prototype.lastIndexOf = function(t, e, r) {
                    return d(this, t, e, r, !1)
                };

                function v(t, e, r) {
                    r = Math.min(t.length, r);
                    for (var n = [], o = e; o < r;) {
                        var i, a, f, s, u = t[o],
                            l = null,
                            h = u > 239 ? 4 : u > 223 ? 3 : u > 191 ? 2 : 1;
                        if (o + h <= r) switch (h) {
                            case 1:
                                u < 128 && (l = u);
                                break;
                            case 2:
                                (192 & (i = t[o + 1])) == 128 && (s = (31 & u) << 6 | 63 & i) > 127 && (l = s);
                                break;
                            case 3:
                                i = t[o + 1], a = t[o + 2], (192 & i) == 128 && (192 & a) == 128 && (s = (15 & u) << 12 | (63 & i) << 6 | 63 & a) > 2047 && (s < 55296 || s > 57343) && (l = s);
                                break;
                            case 4:
                                i = t[o + 1], a = t[o + 2], f = t[o + 3], (192 & i) == 128 && (192 & a) == 128 && (192 & f) == 128 && (s = (15 & u) << 18 | (63 & i) << 12 | (63 & a) << 6 | 63 & f) > 65535 && s < 1114112 && (l = s)
                        }
                        null === l ? (l = 65533, h = 1) : l > 65535 && (l -= 65536, n.push(l >>> 10 & 1023 | 55296), l = 56320 | 1023 & l), n.push(l), o += h
                    }
                    var c = n,
                        p = c.length;
                    if (p <= 4096) return String.fromCharCode.apply(String, c);
                    for (var g = "", y = 0; y < p;) g += String.fromCharCode.apply(String, c.slice(y, y += 4096));
                    return g
                }

                function b(t, e, r) {
                    if (t % 1 != 0 || t < 0) throw RangeError("offset is not uint");
                    if (t + e > r) throw RangeError("Trying to access beyond buffer length")
                }

                function w(t, e, r, n, o, i) {
                    if (!f.isBuffer(t)) throw TypeError('"buffer" argument must be a Buffer instance');
                    if (e > o || e < i) throw RangeError('"value" argument is out of bounds');
                    if (r + n > t.length) throw RangeError("Index out of range")
                }

                function E(t, e, r, n, o, i) {
                    if (r + n > t.length || r < 0) throw RangeError("Index out of range")
                }

                function A(t, e, r, n, i) {
                    return e *= 1, r >>>= 0, i || E(t, e, r, 4, 34028234663852886e22, -34028234663852886e22), o.write(t, e, r, n, 23, 4), r + 4
                }

                function B(t, e, r, n, i) {
                    return e *= 1, r >>>= 0, i || E(t, e, r, 8, 17976931348623157e292, -17976931348623157e292), o.write(t, e, r, n, 52, 8), r + 8
                }
                f.prototype.write = function(t, e, r, n) {
                    if (void 0 === e) n = "utf8", r = this.length, e = 0;
                    else if (void 0 === r && "string" == typeof e) n = e, r = this.length, e = 0;
                    else if (isFinite(e)) e >>>= 0, isFinite(r) ? (r >>>= 0, void 0 === n && (n = "utf8")) : (n = r, r = void 0);
                    else throw Error("Buffer.write(string, encoding, offset[, length]) is no longer supported");
                    var o, i, a, f, s, u, l, h, c = this.length - e;
                    if ((void 0 === r || r > c) && (r = c), t.length > 0 && (r < 0 || e < 0) || e > this.length) throw RangeError("Attempt to write outside buffer bounds");
                    n || (n = "utf8");
                    for (var p = !1;;) switch (n) {
                        case "hex":
                            return function(t, e, r, n) {
                                r = Number(r) || 0;
                                var o = t.length - r;
                                n ? (n = Number(n)) > o && (n = o) : n = o;
                                var i = e.length;
                                n > i / 2 && (n = i / 2);
                                for (var a = 0; a < n; ++a) {
                                    var f, s = parseInt(e.substr(2 * a, 2), 16);
                                    if ((f = s) != f) break;
                                    t[r + a] = s
                                }
                                return a
                            }(this, t, e, r);
                        case "utf8":
                        case "utf-8":
                            return o = e, i = r, O(T(t, this.length - o), this, o, i);
                        case "ascii":
                            return a = e, f = r, O(S(t), this, a, f);
                        case "latin1":
                        case "binary":
                            return function(t, e, r, n) {
                                return O(S(e), t, r, n)
                            }(this, t, e, r);
                        case "base64":
                            return s = e, u = r, O(C(t), this, s, u);
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return l = e, h = r, O(function(t, e) {
                                for (var r, n, o = [], i = 0; i < t.length && !((e -= 2) < 0); ++i) n = (r = t.charCodeAt(i)) >> 8, o.push(r % 256), o.push(n);
                                return o
                            }(t, this.length - l), this, l, h);
                        default:
                            if (p) throw TypeError("Unknown encoding: " + n);
                            n = ("" + n).toLowerCase(), p = !0
                    }
                }, f.prototype.toJSON = function() {
                    return {
                        type: "Buffer",
                        data: Array.prototype.slice.call(this._arr || this, 0)
                    }
                }, f.prototype.slice = function(t, e) {
                    var r = this.length;
                    t = ~~t, e = void 0 === e ? r : ~~e, t < 0 ? (t += r) < 0 && (t = 0) : t > r && (t = r), e < 0 ? (e += r) < 0 && (e = 0) : e > r && (e = r), e < t && (e = t);
                    var n = this.subarray(t, e);
                    return Object.setPrototypeOf(n, f.prototype), n
                }, f.prototype.readUIntLE = function(t, e, r) {
                    t >>>= 0, e >>>= 0, r || b(t, e, this.length);
                    for (var n = this[t], o = 1, i = 0; ++i < e && (o *= 256);) n += this[t + i] * o;
                    return n
                }, f.prototype.readUIntBE = function(t, e, r) {
                    t >>>= 0, e >>>= 0, r || b(t, e, this.length);
                    for (var n = this[t + --e], o = 1; e > 0 && (o *= 256);) n += this[t + --e] * o;
                    return n
                }, f.prototype.readUInt8 = function(t, e) {
                    return t >>>= 0, e || b(t, 1, this.length), this[t]
                }, f.prototype.readUInt16LE = function(t, e) {
                    return t >>>= 0, e || b(t, 2, this.length), this[t] | this[t + 1] << 8
                }, f.prototype.readUInt16BE = function(t, e) {
                    return t >>>= 0, e || b(t, 2, this.length), this[t] << 8 | this[t + 1]
                }, f.prototype.readUInt32LE = function(t, e) {
                    return t >>>= 0, e || b(t, 4, this.length), (this[t] | this[t + 1] << 8 | this[t + 2] << 16) + 0x1000000 * this[t + 3]
                }, f.prototype.readUInt32BE = function(t, e) {
                    return t >>>= 0, e || b(t, 4, this.length), 0x1000000 * this[t] + (this[t + 1] << 16 | this[t + 2] << 8 | this[t + 3])
                }, f.prototype.readIntLE = function(t, e, r) {
                    t >>>= 0, e >>>= 0, r || b(t, e, this.length);
                    for (var n = this[t], o = 1, i = 0; ++i < e && (o *= 256);) n += this[t + i] * o;
                    return n >= (o *= 128) && (n -= Math.pow(2, 8 * e)), n
                }, f.prototype.readIntBE = function(t, e, r) {
                    t >>>= 0, e >>>= 0, r || b(t, e, this.length);
                    for (var n = e, o = 1, i = this[t + --n]; n > 0 && (o *= 256);) i += this[t + --n] * o;
                    return i >= (o *= 128) && (i -= Math.pow(2, 8 * e)), i
                }, f.prototype.readInt8 = function(t, e) {
                    return (t >>>= 0, e || b(t, 1, this.length), 128 & this[t]) ? -((255 - this[t] + 1) * 1) : this[t]
                }, f.prototype.readInt16LE = function(t, e) {
                    t >>>= 0, e || b(t, 2, this.length);
                    var r = this[t] | this[t + 1] << 8;
                    return 32768 & r ? 0xffff0000 | r : r
                }, f.prototype.readInt16BE = function(t, e) {
                    t >>>= 0, e || b(t, 2, this.length);
                    var r = this[t + 1] | this[t] << 8;
                    return 32768 & r ? 0xffff0000 | r : r
                }, f.prototype.readInt32LE = function(t, e) {
                    return t >>>= 0, e || b(t, 4, this.length), this[t] | this[t + 1] << 8 | this[t + 2] << 16 | this[t + 3] << 24
                }, f.prototype.readInt32BE = function(t, e) {
                    return t >>>= 0, e || b(t, 4, this.length), this[t] << 24 | this[t + 1] << 16 | this[t + 2] << 8 | this[t + 3]
                }, f.prototype.readFloatLE = function(t, e) {
                    return t >>>= 0, e || b(t, 4, this.length), o.read(this, t, !0, 23, 4)
                }, f.prototype.readFloatBE = function(t, e) {
                    return t >>>= 0, e || b(t, 4, this.length), o.read(this, t, !1, 23, 4)
                }, f.prototype.readDoubleLE = function(t, e) {
                    return t >>>= 0, e || b(t, 8, this.length), o.read(this, t, !0, 52, 8)
                }, f.prototype.readDoubleBE = function(t, e) {
                    return t >>>= 0, e || b(t, 8, this.length), o.read(this, t, !1, 52, 8)
                }, f.prototype.writeUIntLE = function(t, e, r, n) {
                    if (t *= 1, e >>>= 0, r >>>= 0, !n) {
                        var o = Math.pow(2, 8 * r) - 1;
                        w(this, t, e, r, o, 0)
                    }
                    var i = 1,
                        a = 0;
                    for (this[e] = 255 & t; ++a < r && (i *= 256);) this[e + a] = t / i & 255;
                    return e + r
                }, f.prototype.writeUIntBE = function(t, e, r, n) {
                    if (t *= 1, e >>>= 0, r >>>= 0, !n) {
                        var o = Math.pow(2, 8 * r) - 1;
                        w(this, t, e, r, o, 0)
                    }
                    var i = r - 1,
                        a = 1;
                    for (this[e + i] = 255 & t; --i >= 0 && (a *= 256);) this[e + i] = t / a & 255;
                    return e + r
                }, f.prototype.writeUInt8 = function(t, e, r) {
                    return t *= 1, e >>>= 0, r || w(this, t, e, 1, 255, 0), this[e] = 255 & t, e + 1
                }, f.prototype.writeUInt16LE = function(t, e, r) {
                    return t *= 1, e >>>= 0, r || w(this, t, e, 2, 65535, 0), this[e] = 255 & t, this[e + 1] = t >>> 8, e + 2
                }, f.prototype.writeUInt16BE = function(t, e, r) {
                    return t *= 1, e >>>= 0, r || w(this, t, e, 2, 65535, 0), this[e] = t >>> 8, this[e + 1] = 255 & t, e + 2
                }, f.prototype.writeUInt32LE = function(t, e, r) {
                    return t *= 1, e >>>= 0, r || w(this, t, e, 4, 0xffffffff, 0), this[e + 3] = t >>> 24, this[e + 2] = t >>> 16, this[e + 1] = t >>> 8, this[e] = 255 & t, e + 4
                }, f.prototype.writeUInt32BE = function(t, e, r) {
                    return t *= 1, e >>>= 0, r || w(this, t, e, 4, 0xffffffff, 0), this[e] = t >>> 24, this[e + 1] = t >>> 16, this[e + 2] = t >>> 8, this[e + 3] = 255 & t, e + 4
                }, f.prototype.writeIntLE = function(t, e, r, n) {
                    if (t *= 1, e >>>= 0, !n) {
                        var o = Math.pow(2, 8 * r - 1);
                        w(this, t, e, r, o - 1, -o)
                    }
                    var i = 0,
                        a = 1,
                        f = 0;
                    for (this[e] = 255 & t; ++i < r && (a *= 256);) t < 0 && 0 === f && 0 !== this[e + i - 1] && (f = 1), this[e + i] = (t / a | 0) - f & 255;
                    return e + r
                }, f.prototype.writeIntBE = function(t, e, r, n) {
                    if (t *= 1, e >>>= 0, !n) {
                        var o = Math.pow(2, 8 * r - 1);
                        w(this, t, e, r, o - 1, -o)
                    }
                    var i = r - 1,
                        a = 1,
                        f = 0;
                    for (this[e + i] = 255 & t; --i >= 0 && (a *= 256);) t < 0 && 0 === f && 0 !== this[e + i + 1] && (f = 1), this[e + i] = (t / a | 0) - f & 255;
                    return e + r
                }, f.prototype.writeInt8 = function(t, e, r) {
                    return t *= 1, e >>>= 0, r || w(this, t, e, 1, 127, -128), t < 0 && (t = 255 + t + 1), this[e] = 255 & t, e + 1
                }, f.prototype.writeInt16LE = function(t, e, r) {
                    return t *= 1, e >>>= 0, r || w(this, t, e, 2, 32767, -32768), this[e] = 255 & t, this[e + 1] = t >>> 8, e + 2
                }, f.prototype.writeInt16BE = function(t, e, r) {
                    return t *= 1, e >>>= 0, r || w(this, t, e, 2, 32767, -32768), this[e] = t >>> 8, this[e + 1] = 255 & t, e + 2
                }, f.prototype.writeInt32LE = function(t, e, r) {
                    return t *= 1, e >>>= 0, r || w(this, t, e, 4, 0x7fffffff, -0x80000000), this[e] = 255 & t, this[e + 1] = t >>> 8, this[e + 2] = t >>> 16, this[e + 3] = t >>> 24, e + 4
                }, f.prototype.writeInt32BE = function(t, e, r) {
                    return t *= 1, e >>>= 0, r || w(this, t, e, 4, 0x7fffffff, -0x80000000), t < 0 && (t = 0xffffffff + t + 1), this[e] = t >>> 24, this[e + 1] = t >>> 16, this[e + 2] = t >>> 8, this[e + 3] = 255 & t, e + 4
                }, f.prototype.writeFloatLE = function(t, e, r) {
                    return A(this, t, e, !0, r)
                }, f.prototype.writeFloatBE = function(t, e, r) {
                    return A(this, t, e, !1, r)
                }, f.prototype.writeDoubleLE = function(t, e, r) {
                    return B(this, t, e, !0, r)
                }, f.prototype.writeDoubleBE = function(t, e, r) {
                    return B(this, t, e, !1, r)
                }, f.prototype.copy = function(t, e, r, n) {
                    if (!f.isBuffer(t)) throw TypeError("argument should be a Buffer");
                    if (r || (r = 0), n || 0 === n || (n = this.length), e >= t.length && (e = t.length), e || (e = 0), n > 0 && n < r && (n = r), n === r || 0 === t.length || 0 === this.length) return 0;
                    if (e < 0) throw RangeError("targetStart out of bounds");
                    if (r < 0 || r >= this.length) throw RangeError("Index out of range");
                    if (n < 0) throw RangeError("sourceEnd out of bounds");
                    n > this.length && (n = this.length), t.length - e < n - r && (n = t.length - e + r);
                    var o = n - r;
                    if (this === t && "function" == typeof Uint8Array.prototype.copyWithin) this.copyWithin(e, r, n);
                    else if (this === t && r < e && e < n)
                        for (var i = o - 1; i >= 0; --i) t[i + e] = this[i + r];
                    else Uint8Array.prototype.set.call(t, this.subarray(r, n), e);
                    return o
                }, f.prototype.fill = function(t, e, r, n) {
                    if ("string" == typeof t) {
                        if ("string" == typeof e ? (n = e, e = 0, r = this.length) : "string" == typeof r && (n = r, r = this.length), void 0 !== n && "string" != typeof n) throw TypeError("encoding must be a string");
                        if ("string" == typeof n && !f.isEncoding(n)) throw TypeError("Unknown encoding: " + n);
                        if (1 === t.length) {
                            var o, i = t.charCodeAt(0);
                            ("utf8" === n && i < 128 || "latin1" === n) && (t = i)
                        }
                    } else "number" == typeof t ? t &= 255 : "boolean" == typeof t && (t = Number(t));
                    if (e < 0 || this.length < e || this.length < r) throw RangeError("Out of range index");
                    if (r <= e) return this;
                    if (e >>>= 0, r = void 0 === r ? this.length : r >>> 0, t || (t = 0), "number" == typeof t)
                        for (o = e; o < r; ++o) this[o] = t;
                    else {
                        var a = f.isBuffer(t) ? t : f.from(t, n),
                            s = a.length;
                        if (0 === s) throw TypeError('The value "' + t + '" is invalid for argument "value"');
                        for (o = 0; o < r - e; ++o) this[o + e] = a[o % s]
                    }
                    return this
                };
                var x = /[^+/0-9A-Za-z-_]/g;

                function T(t, e) {
                    e = e || 1 / 0;
                    for (var r, n = t.length, o = null, i = [], a = 0; a < n; ++a) {
                        if ((r = t.charCodeAt(a)) > 55295 && r < 57344) {
                            if (!o) {
                                if (r > 56319 || a + 1 === n) {
                                    (e -= 3) > -1 && i.push(239, 191, 189);
                                    continue
                                }
                                o = r;
                                continue
                            }
                            if (r < 56320) {
                                (e -= 3) > -1 && i.push(239, 191, 189), o = r;
                                continue
                            }
                            r = (o - 55296 << 10 | r - 56320) + 65536
                        } else o && (e -= 3) > -1 && i.push(239, 191, 189);
                        if (o = null, r < 128) {
                            if ((e -= 1) < 0) break;
                            i.push(r)
                        } else if (r < 2048) {
                            if ((e -= 2) < 0) break;
                            i.push(r >> 6 | 192, 63 & r | 128)
                        } else if (r < 65536) {
                            if ((e -= 3) < 0) break;
                            i.push(r >> 12 | 224, r >> 6 & 63 | 128, 63 & r | 128)
                        } else if (r < 1114112) {
                            if ((e -= 4) < 0) break;
                            i.push(r >> 18 | 240, r >> 12 & 63 | 128, r >> 6 & 63 | 128, 63 & r | 128)
                        } else throw Error("Invalid code point")
                    }
                    return i
                }

                function S(t) {
                    for (var e = [], r = 0; r < t.length; ++r) e.push(255 & t.charCodeAt(r));
                    return e
                }

                function C(t) {
                    return n.toByteArray(function(t) {
                        if ((t = (t = t.split("=")[0]).trim().replace(x, "")).length < 2) return "";
                        for (; t.length % 4 != 0;) t += "=";
                        return t
                    }(t))
                }

                function O(t, e, r, n) {
                    for (var o = 0; o < n && !(o + r >= e.length) && !(o >= t.length); ++o) e[o + r] = t[o];
                    return o
                }

                function U(t, e) {
                    return t instanceof e || null != t && null != t.constructor && null != t.constructor.name && t.constructor.name === e.name
                }
                var I = function() {
                    for (var t = "0123456789abcdef", e = Array(256), r = 0; r < 16; ++r)
                        for (var n = 16 * r, o = 0; o < 16; ++o) e[n + o] = t[r] + t[o];
                    return e
                }()
            },
            321: function(t, e) {
                e.read = function(t, e, r, n, o) {
                    var i, a, f = 8 * o - n - 1,
                        s = (1 << f) - 1,
                        u = s >> 1,
                        l = -7,
                        h = r ? o - 1 : 0,
                        c = r ? -1 : 1,
                        p = t[e + h];
                    for (h += c, i = p & (1 << -l) - 1, p >>= -l, l += f; l > 0; i = 256 * i + t[e + h], h += c, l -= 8);
                    for (a = i & (1 << -l) - 1, i >>= -l, l += n; l > 0; a = 256 * a + t[e + h], h += c, l -= 8);
                    if (0 === i) i = 1 - u;
                    else {
                        if (i === s) return a ? 0 / 0 : (p ? -1 : 1) * 2e308;
                        a += Math.pow(2, n), i -= u
                    }
                    return (p ? -1 : 1) * a * Math.pow(2, i - n)
                }, e.write = function(t, e, r, n, o, i) {
                    var a, f, s, u = 8 * i - o - 1,
                        l = (1 << u) - 1,
                        h = l >> 1,
                        c = 5960464477539062e-23 * (23 === o),
                        p = n ? 0 : i - 1,
                        g = n ? 1 : -1,
                        y = +(e < 0 || 0 === e && 1 / e < 0);
                    for (isNaN(e = Math.abs(e)) || 1 / 0 === e ? (f = +!!isNaN(e), a = l) : (a = Math.floor(Math.log(e) / Math.LN2), e * (s = Math.pow(2, -a)) < 1 && (a--, s *= 2), a + h >= 1 ? e += c / s : e += c * Math.pow(2, 1 - h), e * s >= 2 && (a++, s /= 2), a + h >= l ? (f = 0, a = l) : a + h >= 1 ? (f = (e * s - 1) * Math.pow(2, o), a += h) : (f = e * Math.pow(2, h - 1) * Math.pow(2, o), a = 0)); o >= 8; t[r + p] = 255 & f, p += g, f /= 256, o -= 8);
                    for (a = a << o | f, u += o; u > 0; t[r + p] = 255 & a, p += g, a /= 256, u -= 8);
                    t[r + p - g] |= 128 * y
                }
            }
        },
        o = {};

    function i(t) {
        var e = o[t];
        if (void 0 !== e) return e.exports;
        var r = o[t] = {
                exports: {}
            },
            a = !0;
        try {
            n[t](r, r.exports, i), a = !1
        } finally {
            a && delete o[t]
        }
        return r.exports
    }
    i.ab = "/ROOT/links/@/next/16.4.5/0de1122c89b9724448b83052600528d4b1dce37d3127900fabdf5af34275552d/node_modules/next/dist/compiled/buffer/", e.exports = i(230)
}, 12246, t => {
    "use strict";
    var e = t.i(225226),
        r = t.i(643766),
        n = t.i(26734);
    t.i(785517), t.i(860663);
    var o = (0, r.createContext)({
        ref: {
            current: null
        },
        enqueue: function() {
            throw Error("useSnackbar was invoked without SnackbarProvider")
        },
        close: function() {
            throw Error("useSnackbar was invoked without SnackbarProvider")
        }
    });
    t.s(["U", 0, function(t) {
        var i, a, f, s, u = t.children,
            l = (0, e.a)(t, ["children"]),
            h = (0, r.useRef)(null),
            c = (0, r.useState)(!1),
            p = c[0],
            g = c[1],
            y = (0, r.useState)([]),
            d = y[0],
            m = y[1],
            v = (0, r.useCallback)(function(t, r) {
                void 0 === t && (t = {}), void 0 === r && (r = function() {
                    return !0
                }), m(function(n) {
                    return (0, e.b)((0, e.b)([], n, !0), [{
                        props: t,
                        shouldClose: r
                    }], !1)
                })
            }, [m]),
            b = (0, r.useCallback)(function() {
                g(!1)
            }, [g]);
        (0, r.useEffect)(function() {
            d.length > 0 && g(!0)
        }, [d.length]);
        var w = (0, r.useMemo)(function() {
            return {
                ref: h,
                enqueue: v,
                close: b
            }
        }, [b, v]);
        return r.default.createElement(r.default.Fragment, null, r.default.createElement(o.Provider, {
            value: w
        }, u), r.default.createElement(n.S, (0, e._)({}, (null == (i = d[0]) ? void 0 : i.props) || {}, l, {
            TransitionProps: (0, e._)((0, e._)({}, (null == (f = null == (a = d[0]) ? void 0 : a.props) ? void 0 : f.TransitionProps) || {}), {
                onExited: function(t) {
                    var r, n, o, i;
                    m(function(t) {
                        var r = t.slice(1);
                        return (0, e.b)([], r, !0)
                    }), (null == (n = null == (r = d[0]) ? void 0 : r.props.TransitionProps) ? void 0 : n.onExited) && (null == (i = null == (o = d[0]) ? void 0 : o.props.TransitionProps) || i.onExited(t))
                }
            }),
            onClose: function(t, e) {
                var r, n, o;
                (null == (r = d[0]) ? void 0 : r.shouldClose(e)) && g(!1), (null == (n = d[0]) ? void 0 : n.props.onClose) && (null == (o = d[0]) || o.props.onClose(t, e))
            },
            open: p
        }), null == (s = d[0]) ? void 0 : s.props.children))
    }, "J", 0, function() {
        var t = (0, r.useContext)(o);
        return {
            ref: t.ref,
            enqueue: t.enqueue,
            close: t.close
        }
    }])
}, 523426, t => {
    "use strict";
    let e = (0, t.i(157700).e)({
        namespace: "anti-cheat",
        name: "enhancedAntiCheatAccess",
        defaultValue: !1
    });
    t.s(["f", 0, e])
}, 245299, t => {
    "use strict";
    let e = (0, t.i(157700).e)({
        namespace: "collaborative-tools",
        name: "enableEnvironments",
        defaultValue: !1
    });
    t.s(["f", 0, e])
}, 159022, t => {
    "use strict";
    let e = (0, t.i(157700).e)({
        namespace: "creator-compute",
        name: "enableComputeFunctions",
        defaultValue: !1
    });
    t.s(["f", 0, e])
}, 846130, t => {
    "use strict";
    var e = t.i(157700);
    let r = (0, e.e)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportAccountTranslationPreference",
            defaultValue: !1
        }),
        n = (0, e.e)({
            namespace: "creator-gameops",
            name: "enablePlayerSupport",
            defaultValue: !1
        }),
        o = (0, e.e)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportTicketTranslation",
            defaultValue: !1
        }),
        i = (0, e.e)({
            namespace: "creator-gameops",
            name: "enablePlayerHostedEvents",
            defaultValue: !1
        }),
        a = (0, e.e)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportCreatorTicketReroute",
            defaultValue: !1
        }),
        f = (0, e.e)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportArchive",
            defaultValue: !1
        }),
        s = (0, e.e)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportCategoryChange",
            defaultValue: !1
        }),
        u = (0, e.e)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportSpamManagement",
            defaultValue: !1
        }),
        l = (0, e.e)({
            namespace: "creator-gameops",
            name: "enableEarlyTestersUserOwnedGame",
            defaultValue: !1
        });
    t.s(["E", 0, l, "w", 0, i, "k", 0, n, "Z", 0, r, "n", 0, f, "N", 0, s, "z", 0, a, "_", 0, u, "b", 0, o])
}, 787617, t => {
    "use strict";
    var e = t.i(157700);
    let r = (0, e.e)({
            namespace: "creator-platform",
            name: "isTcsNoticeEnabled",
            defaultValue: !1
        }),
        n = (0, e.e)({
            namespace: "creator-platform",
            name: "isCreationsNavigationReorderEnabled",
            defaultValue: !1
        }),
        o = (0, e.e)({
            namespace: "creator-platform",
            name: "tryOnWebButtonEnabled",
            defaultValue: !1
        });
    t.s(["a", 0, n, "M", 0, r, "K", 0, o])
}, 481186, t => {
    "use strict";
    let e = (0, t.i(157700).e)({
        namespace: "extended-services",
        name: "isQueueServiceAnalyticsEnabled",
        defaultValue: !1
    });
    t.s(["f", 0, e])
}, 82899, t => {
    "use strict";
    let e = (0, t.i(157700).e)({
        namespace: "leaderboards",
        name: "isLeaderboardConfigsEnabled",
        defaultValue: !0
    });
    t.s(["f", 0, e])
}, 494192, t => {
    "use strict";
    let e = (0, t.i(157700).e)({
        namespace: "preset-chat",
        name: "presetChatEnabled",
        defaultValue: !1
    });
    t.s(["f", 0, e])
}, 401263, 884213, t => {
    "use strict";
    var e = t.i(643766);
    let r = /{(.+?)}/g,
        n = (t, e) => void 0 === e || 0 === Object.keys(e).length ? t : t.replace(r, (t, r) => {
            var n;
            return null != (n = e[r]) ? n : "{".concat(r, "}")
        });
    t.s(["f", 0, n], 884213);
    let o = /{(.+?)}/,
        i = /({.+?})/g,
        a = /^[a-zA-Z0-9-]+\.(?:capture-loopback\.)?chromatic\.com$/,
        f = /(?:^|\.)robloxlabs\.com$/,
        s = () => {
            let t, e = a.test(window.location.hostname),
                r = window.location.hostname.includes("localhost"),
                n = "string" == typeof(t = window.location.hostname) && f.test(t);
            return {
                isSSR: !1,
                isAllowed: e || r || n,
                isDangerous: e || n,
                preferLoadedTranslations: n
            }
        },
        u = (t, e) => e.isDangerous ? "[!!".concat(t, "!!]") : t;
    var l = t.i(730530);
    t.s(["f", 0, t => {
        let {
            ready: r,
            translate: a,
            translateHTML: f,
            translateWithNamespace: h,
            translateWithNamespaceHTML: c
        } = t, p = (0, e.useMemo)(() => ({
            ready: r,
            translate: a,
            translateHTML: f,
            translateWithNamespace: h,
            translateWithNamespaceHTML: c
        }), [r, a, f, h, c]);
        return (0, e.useMemo)(() => {
            let t = {
                ready: p.ready,
                translate: (0, l.O)(p),
                translateHTML: (0, l.t)(p),
                translateWithNamespace: p.translateWithNamespace,
                translateWithNamespaceHTML: p.translateWithNamespaceHTML
            };
            return {
                ...t,
                tPendingTranslation: (t => {
                    let {
                        ready: e,
                        translate: r
                    } = t;
                    return (t, o, i, a, f) => {
                        let l = s();
                        if (!l.isAllowed) {
                            let e = r(i, a);
                            return e || ((null == f ? void 0 : f.fallbackToEnglishWhenMissing) ? n(t, a) : e)
                        }
                        if (l.preferLoadedTranslations && e) {
                            let t = r(i, a);
                            if (t.length > 0) return t
                        }
                        return n(l.preferLoadedTranslations && !e ? t : u(t, l), a)
                    }
                })(t),
                tPendingHtmlTranslation: (t => {
                    let {
                        ready: r,
                        translateHTML: a
                    } = t;
                    return (t, f, l, h, c) => {
                        let p = s();
                        if (!p.isAllowed) return a(l, h, c);
                        if (p.preferLoadedTranslations && r) {
                            let t = a(l, h, c);
                            if ("" !== t) return t
                        }
                        return ((t, r, a) => {
                            let f, s;
                            if (void 0 === r && void 0 === a) return t;
                            let {
                                stringArgs: u,
                                htmlArgs: l
                            } = (f = {}, s = {}, void 0 === a || Object.entries(a).forEach(t => {
                                let [e, r] = t;
                                "string" == typeof r ? f[e] = r : s[e] = r
                            }), {
                                stringArgs: f,
                                htmlArgs: s
                            }), h = n(t, u), c = h.split(i).filter(t => !!t);
                            if (1 === c.length) return h;
                            let p = [...c];
                            if (0 !== Object.keys(l).length) {
                                let t = c.reduce((t, e, r) => {
                                    let n = o.exec(e);
                                    if (n) {
                                        let e = n[1];
                                        if (Object.hasOwn(l, e)) {
                                            let n = t[e];
                                            if (!n) return Object.assign(t, {
                                                [e]: [r]
                                            });
                                            n.push(r)
                                        }
                                    }
                                    return t
                                }, {});
                                Object.entries(l).forEach(e => {
                                    let [r, n] = e, o = t[r];
                                    o && o.forEach(t => {
                                        p[t] = n
                                    })
                                })
                            }
                            if (!Array.isArray(r) || 0 === r.length) return (0, e.createElement)(e.Fragment, null, ...p);
                            let g = r.reduce((t, e) => {
                                    let {
                                        opening: r,
                                        closing: n,
                                        content: o
                                    } = e;
                                    return Object.assign(t, {
                                        ["{".concat(r, "}")]: {
                                            match: "{".concat(n, "}"),
                                            content: o
                                        }
                                    })
                                }, {}),
                                y = [],
                                d = [],
                                m = [];
                            for (let t = p.shift(); void 0 !== t; t = p.shift())
                                if ("string" == typeof t && o.test(t))
                                    if (Object.hasOwn(g, t)) d.push(t), m.push(t);
                                    else {
                                        let r = d.pop();
                                        if (void 0 !== r) {
                                            let {
                                                match: n,
                                                content: o
                                            } = g[r];
                                            if (t !== n) break;
                                            let i = [],
                                                a = !1;
                                            for (; m.length > 0 && !a;) {
                                                let t = m.pop();
                                                t === r ? a = !0 : i.unshift(t)
                                            }
                                            let f = o(i.every(t => "string" == typeof t) ? i : (0, e.createElement)(e.Fragment, null, ...i));
                                            0 === m.length ? y.push(f) : m.push(f)
                                        }
                                    }
                            else 0 === m.length ? y.push(t) : m.push(t);
                            return (0, e.createElement)(e.Fragment, null, ...y)
                        })(p.preferLoadedTranslations && !r ? t : u(t, p), h, c)
                    }
                })(t)
            }
        }, [p])
    }], 401263)
}, 599306, t => {
    "use strict";
    var e = t.i(785517),
        r = t.i(870999),
        n = t.i(534516);
    let o = (0, t.i(67243).f)()({
        root: {
            flexGrow: 1,
            width: "100%",
            height: "100%",
            minHeight: 200
        }
    });
    t.s(["f", 0, () => {
        let {
            classes: {
                root: t
            }
        } = o();
        return (0, e.jsx)(r.f, {
            classes: {
                root: t
            },
            container: !0,
            justifyContent: "center",
            alignItems: "center",
            children: (0, e.jsx)(n.f, {})
        })
    }], 599306)
}, 42361, t => {
    "use strict";
    var e = t.i(67243);
    let r = {
            width: "100%",
            height: "100%"
        },
        n = "376px",
        o = "240px",
        i = (0, e.f)()(t => ({
            root: {
                ...r
            },
            background: {
                maxWidth: 1024
            },
            guestErrorArea: {
                padding: t.spacing(5, 5, 4)
            },
            loggedinErrorArea: {
                padding: t.spacing(2, 2, 4)
            },
            errorImage: {
                ...r,
                maxWidth: n,
                maxHeight: n,
                [t.breakpoints.down("Medium")]: {
                    width: o,
                    height: o
                }
            },
            textHeader: {
                paddingBottom: t.spacing(1)
            },
            guestImageArea: {
                padding: t.spacing(5, 5)
            },
            loggedinImageArea: {
                padding: t.spacing(2, 2)
            }
        }));
    t.s(["f", 0, i])
}, 761084, t => {
    "use strict";
    let e = "".concat("https://assets.create.roblox.com/ac5adf02bced7a5b5d67d1642bfb55cdcde0ab67/assets", "/common"),
        r = "".concat(e, "/error.png"),
        n = "".concat(e, "/maintenance_page.jpg");
    t.s(["v", 0, e, "z", 0, "376", "o", 0, r, "V", 0, n])
}, 250715, t => {
    "use strict";
    var e = t.i(643766),
        r = t.i(145724);
    let n = () => r.I,
        o = Symbol("unresolved-flag-context");
    t.s(["u", 0, function() {
        for (var t = arguments.length, i = Array(t), a = 0; a < t; a++) i[a] = arguments[a];
        let [f, s] = (0, e.useState)(!1), [u, l] = (0, e.useState)(null), [h, c] = (0, e.useState)(o), p = (0, e.useSyncExternalStore)(r.s, r.g, n), [g, y = {}] = i, d = Object.values(y).pop();
        return ((0, e.useEffect)(() => {
            let t = new AbortController;
            return async function() {
                try {
                    let e;
                    if (2 === i.length) {
                        let [t, r] = i;
                        e = await t(r)
                    } else {
                        let [t] = i;
                        e = await t()
                    }
                    if (t.signal.aborted) return;
                    l(e), c(d), s(!0)
                } catch (t) {}
            }(), () => {
                t.abort()
            }
        }, [g, d, p]), f && Object.is(h, d)) ? {
            ready: f,
            value: u
        } : {
            ready: !1,
            value: null
        }
    }])
}, 500758, t => {
    "use strict";
    var e = t.i(250715);
    t.s(["f", () => e.u])
}]);

//# debugId=0b4c7a04-9857-f07d-e0db-e8be949dd353
//# sourceMappingURL=3z7wsptfllag9.js.map