;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "5bb06c68-0651-4f30-27bc-b7af82458a5b")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 805386, e => {
    "use strict";
    e.s(["MAX_TABLE_METRIC_COLUMNS", 0, 8])
}, 545154, 456954, 390463, e => {
    "use strict";
    var t = e.i(31611),
        r = e.i(739167),
        n = e.i(446362),
        i = e.i(927868),
        a = e.i(908374),
        o = e.i(836047),
        s = {},
        u = function(e, t, r, n, i) {
            var a = new Worker(s[t] || (s[t] = URL.createObjectURL(new Blob([e + ';addEventListener("error",function(e){e=e.error;postMessage({$e$:[e.message,e.code,e.stack]})})'], {
                type: "text/javascript"
            }))));
            return a.onmessage = function(e) {
                var t = e.data,
                    r = t.$e$;
                if (r) {
                    var n = Error(r[0]);
                    n.code = r[1], n.stack = r[2], i(n, null)
                } else i(null, t)
            }, a.postMessage(r, n), a
        },
        c = Uint8Array,
        l = Uint16Array,
        d = Int32Array,
        h = new c([0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 0, 0, 0, 0]),
        f = new c([0, 0, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11, 11, 12, 12, 13, 13, 0, 0]),
        p = new c([16, 17, 18, 0, 8, 7, 9, 6, 10, 5, 11, 4, 12, 3, 13, 2, 14, 1, 15]),
        m = function(e, t) {
            for (var r = new l(31), n = 0; n < 31; ++n) r[n] = t += 1 << e[n - 1];
            for (var i = new d(r[30]), n = 1; n < 30; ++n)
                for (var a = r[n]; a < r[n + 1]; ++a) i[a] = a - r[n] << 5 | n;
            return {
                b: r,
                r: i
            }
        },
        y = m(h, 2),
        g = y.b,
        v = y.r;
    g[28] = 258, v[258] = 28;
    for (var b = m(f, 0), A = b.b, D = b.r, C = new l(32768), w = 0; w < 32768; ++w) {
        var T = (43690 & w) >> 1 | (21845 & w) << 1;
        T = (61680 & (T = (52428 & T) >> 2 | (13107 & T) << 2)) >> 4 | (3855 & T) << 4, C[w] = ((65280 & T) >> 8 | (255 & T) << 8) >> 1
    }
    for (var E = function(e, t, r) {
            for (var n, i = e.length, a = 0, o = new l(t); a < i; ++a) e[a] && ++o[e[a] - 1];
            var s = new l(t);
            for (a = 1; a < t; ++a) s[a] = s[a - 1] + o[a - 1] << 1;
            if (r) {
                n = new l(1 << t);
                var u = 15 - t;
                for (a = 0; a < i; ++a)
                    if (e[a])
                        for (var c = a << 4 | e[a], d = t - e[a], h = s[e[a] - 1]++ << d, f = h | (1 << d) - 1; h <= f; ++h) n[C[h] >> u] = c
            } else
                for (n = new l(i), a = 0; a < i; ++a) e[a] && (n[a] = C[s[e[a] - 1]++] >> 15 - e[a]);
            return n
        }, S = new c(288), w = 0; w < 144; ++w) S[w] = 8;
    for (var w = 144; w < 256; ++w) S[w] = 9;
    for (var w = 256; w < 280; ++w) S[w] = 7;
    for (var w = 280; w < 288; ++w) S[w] = 8;
    for (var I = new c(32), w = 0; w < 32; ++w) I[w] = 5;
    var R = E(S, 9, 0),
        _ = E(S, 9, 1),
        V = E(I, 5, 0),
        O = E(I, 5, 1),
        U = function(e) {
            for (var t = e[0], r = 1; r < e.length; ++r) e[r] > t && (t = e[r]);
            return t
        },
        N = function(e, t, r) {
            var n = t / 8 | 0;
            return (e[n] | e[n + 1] << 8) >> (7 & t) & r
        },
        P = function(e, t) {
            var r = t / 8 | 0;
            return (e[r] | e[r + 1] << 8 | e[r + 2] << 16) >> (7 & t)
        },
        M = function(e) {
            return (e + 7) / 8 | 0
        },
        x = function(e, t, r) {
            return (null == t || t < 0) && (t = 0), (null == r || r > e.length) && (r = e.length), new c(e.subarray(t, r))
        },
        B = ["unexpected EOF", "invalid block type", "invalid length/literal", "invalid distance", "stream finished", "no stream handler", , "no callback", "invalid UTF-8 data", "extra field too long", "date not in range 1980-2099", "filename too long", "stream finishing", "invalid zip data"],
        k = function(e, t, r) {
            var n = Error(t || B[e]);
            if (n.code = e, Error.captureStackTrace && Error.captureStackTrace(n, k), !r) throw n;
            return n
        },
        L = function(e, t, r, n) {
            var i = e.length,
                a = n ? n.length : 0;
            if (!i || t.f && !t.l) return r || new c(0);
            var o = !r,
                s = o || 2 != t.i,
                u = t.i;
            o && (r = new c(3 * i));
            var l = function(e) {
                    var t = r.length;
                    if (e > t) {
                        var n = new c(Math.max(2 * t, e));
                        n.set(r), r = n
                    }
                },
                d = t.f || 0,
                m = t.p || 0,
                y = t.b || 0,
                v = t.l,
                b = t.d,
                D = t.m,
                C = t.n,
                w = 8 * i;
            do {
                if (!v) {
                    d = N(e, m, 1);
                    var T = N(e, m + 1, 3);
                    if (m += 3, T)
                        if (1 == T) v = _, b = O, D = 9, C = 5;
                        else if (2 == T) {
                        var S = N(e, m, 31) + 257,
                            I = N(e, m + 10, 15) + 4,
                            R = S + N(e, m + 5, 31) + 1;
                        m += 14;
                        for (var V = new c(R), B = new c(19), L = 0; L < I; ++L) B[p[L]] = N(e, m + 3 * L, 7);
                        m += 3 * I;
                        for (var Q = U(B), G = (1 << Q) - 1, H = E(B, Q, 1), L = 0; L < R;) {
                            var F = H[N(e, m, G)];
                            m += 15 & F;
                            var K = F >> 4;
                            if (K < 16) V[L++] = K;
                            else {
                                var j = 0,
                                    z = 0;
                                for (16 == K ? (z = 3 + N(e, m, 3), m += 2, j = V[L - 1]) : 17 == K ? (z = 3 + N(e, m, 7), m += 3) : 18 == K && (z = 11 + N(e, m, 127), m += 7); z--;) V[L++] = j
                            }
                        }
                        var Y = V.subarray(0, S),
                            W = V.subarray(S);
                        D = U(Y), C = U(W), v = E(Y, D, 1), b = E(W, C, 1)
                    } else k(1);
                    else {
                        var K = M(m) + 4,
                            q = e[K - 4] | e[K - 3] << 8,
                            X = K + q;
                        if (X > i) {
                            u && k(0);
                            break
                        }
                        s && l(y + q), r.set(e.subarray(K, X), y), t.b = y += q, t.p = m = 8 * X, t.f = d;
                        continue
                    }
                    if (m > w) {
                        u && k(0);
                        break
                    }
                }
                s && l(y + 131072);
                for (var $ = (1 << D) - 1, J = (1 << C) - 1, Z = m;; Z = m) {
                    var j = v[P(e, m) & $],
                        ee = j >> 4;
                    if ((m += 15 & j) > w) {
                        u && k(0);
                        break
                    }
                    if (j || k(2), ee < 256) r[y++] = ee;
                    else if (256 == ee) {
                        Z = m, v = null;
                        break
                    } else {
                        var et = ee - 254;
                        if (ee > 264) {
                            var L = ee - 257,
                                er = h[L];
                            et = N(e, m, (1 << er) - 1) + g[L], m += er
                        }
                        var en = b[P(e, m) & J],
                            ei = en >> 4;
                        en || k(3), m += 15 & en;
                        var W = A[ei];
                        if (ei > 3) {
                            var er = f[ei];
                            W += P(e, m) & (1 << er) - 1, m += er
                        }
                        if (m > w) {
                            u && k(0);
                            break
                        }
                        s && l(y + 131072);
                        var ea = y + et;
                        if (y < W) {
                            var eo = a - W,
                                es = Math.min(W, ea);
                            for (eo + y < 0 && k(3); y < es; ++y) r[y] = n[eo + y]
                        }
                        for (; y < ea; ++y) r[y] = r[y - W]
                    }
                }
                t.l = v, t.p = Z, t.b = y, t.f = d, v && (d = 1, t.m = D, t.d = b, t.n = C)
            } while (!d) return y != r.length && o ? x(r, 0, y) : r.subarray(0, y)
        },
        Q = function(e, t, r) {
            r <<= 7 & t;
            var n = t / 8 | 0;
            e[n] |= r, e[n + 1] |= r >> 8
        },
        G = function(e, t, r) {
            r <<= 7 & t;
            var n = t / 8 | 0;
            e[n] |= r, e[n + 1] |= r >> 8, e[n + 2] |= r >> 16
        },
        H = function(e, t) {
            for (var r = [], n = 0; n < e.length; ++n) e[n] && r.push({
                s: n,
                f: e[n]
            });
            var i = r.length,
                a = r.slice();
            if (!i) return {
                t: q,
                l: 0
            };
            if (1 == i) {
                var o = new c(r[0].s + 1);
                return o[r[0].s] = 1, {
                    t: o,
                    l: 1
                }
            }
            r.sort(function(e, t) {
                return e.f - t.f
            }), r.push({
                s: -1,
                f: 25001
            });
            var s = r[0],
                u = r[1],
                d = 0,
                h = 1,
                f = 2;
            for (r[0] = {
                    s: -1,
                    f: s.f + u.f,
                    l: s,
                    r: u
                }; h != i - 1;) s = r[r[d].f < r[f].f ? d++ : f++], u = r[d != h && r[d].f < r[f].f ? d++ : f++], r[h++] = {
                s: -1,
                f: s.f + u.f,
                l: s,
                r: u
            };
            for (var p = a[0].s, n = 1; n < i; ++n) a[n].s > p && (p = a[n].s);
            var m = new l(p + 1),
                y = F(r[h - 1], m, 0);
            if (y > t) {
                var n = 0,
                    g = 0,
                    v = y - t,
                    b = 1 << v;
                for (a.sort(function(e, t) {
                        return m[t.s] - m[e.s] || e.f - t.f
                    }); n < i; ++n) {
                    var A = a[n].s;
                    if (m[A] > t) g += b - (1 << y - m[A]), m[A] = t;
                    else break
                }
                for (g >>= v; g > 0;) {
                    var D = a[n].s;
                    m[D] < t ? g -= 1 << t - m[D]++ - 1 : ++n
                }
                for (; n >= 0 && g; --n) {
                    var C = a[n].s;
                    m[C] == t && (--m[C], ++g)
                }
                y = t
            }
            return {
                t: new c(m),
                l: y
            }
        },
        F = function(e, t, r) {
            return -1 == e.s ? Math.max(F(e.l, t, r + 1), F(e.r, t, r + 1)) : t[e.s] = r
        },
        K = function(e) {
            for (var t = e.length; t && !e[--t];);
            for (var r = new l(++t), n = 0, i = e[0], a = 1, o = function(e) {
                    r[n++] = e
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
                c: r.subarray(0, n),
                n: t
            }
        },
        j = function(e, t) {
            for (var r = 0, n = 0; n < t.length; ++n) r += e[n] * t[n];
            return r
        },
        z = function(e, t, r) {
            var n = r.length,
                i = M(t + 2);
            e[i] = 255 & n, e[i + 1] = n >> 8, e[i + 2] = 255 ^ e[i], e[i + 3] = 255 ^ e[i + 1];
            for (var a = 0; a < n; ++a) e[i + a + 4] = r[a];
            return (i + 4 + n) * 8
        },
        Y = function(e, t, r, n, i, a, o, s, u, c, d) {
            Q(t, d++, r), ++i[256];
            for (var m, y, g, v, b = H(i, 15), A = b.t, D = b.l, C = H(a, 15), w = C.t, T = C.l, _ = K(A), O = _.c, U = _.n, N = K(w), P = N.c, M = N.n, x = new l(19), B = 0; B < O.length; ++B) ++x[31 & O[B]];
            for (var B = 0; B < P.length; ++B) ++x[31 & P[B]];
            for (var k = H(x, 7), L = k.t, F = k.l, Y = 19; Y > 4 && !L[p[Y - 1]]; --Y);
            var W = c + 5 << 3,
                q = j(i, S) + j(a, I) + o,
                X = j(i, A) + j(a, w) + o + 14 + 3 * Y + j(x, L) + 2 * x[16] + 3 * x[17] + 7 * x[18];
            if (u >= 0 && W <= q && W <= X) return z(t, d, e.subarray(u, u + c));
            if (Q(t, d, 1 + (X < q)), d += 2, X < q) {
                m = E(A, D, 0), y = A, g = E(w, T, 0), v = w;
                var $ = E(L, F, 0);
                Q(t, d, U - 257), Q(t, d + 5, M - 1), Q(t, d + 10, Y - 4), d += 14;
                for (var B = 0; B < Y; ++B) Q(t, d + 3 * B, L[p[B]]);
                d += 3 * Y;
                for (var J = [O, P], Z = 0; Z < 2; ++Z)
                    for (var ee = J[Z], B = 0; B < ee.length; ++B) {
                        var et = 31 & ee[B];
                        Q(t, d, $[et]), d += L[et], et > 15 && (Q(t, d, ee[B] >> 5 & 127), d += ee[B] >> 12)
                    }
            } else m = R, y = S, g = V, v = I;
            for (var B = 0; B < s; ++B) {
                var er = n[B];
                if (er > 255) {
                    var et = er >> 18 & 31;
                    G(t, d, m[et + 257]), d += y[et + 257], et > 7 && (Q(t, d, er >> 23 & 31), d += h[et]);
                    var en = 31 & er;
                    G(t, d, g[en]), d += v[en], en > 3 && (G(t, d, er >> 5 & 8191), d += f[en])
                } else G(t, d, m[er]), d += y[er]
            }
            return G(t, d, m[256]), d + y[256]
        },
        W = new d([65540, 131080, 131088, 131104, 262176, 1048704, 1048832, 2114560, 2117632]),
        q = new c(0),
        X = function(e, t, r, n, i, a) {
            var o = a.z || e.length,
                s = new c(n + o + 5 * (1 + Math.ceil(o / 7e3)) + i),
                u = s.subarray(n, s.length - i),
                p = a.l,
                m = 7 & (a.r || 0);
            if (t) {
                m && (u[0] = a.r >> 3);
                for (var y = W[t - 1], g = y >> 13, b = 8191 & y, A = (1 << r) - 1, C = a.p || new l(32768), w = a.h || new l(A + 1), T = Math.ceil(r / 3), E = 2 * T, S = function(t) {
                        return (e[t] ^ e[t + 1] << T ^ e[t + 2] << E) & A
                    }, I = new d(25e3), R = new l(288), _ = new l(32), V = 0, O = 0, U = a.i || 0, N = 0, P = a.w || 0, B = 0; U + 2 < o; ++U) {
                    var k = S(U),
                        L = 32767 & U,
                        Q = w[k];
                    if (C[L] = Q, w[k] = L, P <= U) {
                        var G = o - U;
                        if ((V > 7e3 || N > 24576) && (G > 423 || !p)) {
                            m = Y(e, u, 0, I, R, _, O, N, B, U - B, m), N = V = O = 0, B = U;
                            for (var H = 0; H < 286; ++H) R[H] = 0;
                            for (var H = 0; H < 30; ++H) _[H] = 0
                        }
                        var F = 2,
                            K = 0,
                            j = b,
                            q = L - Q & 32767;
                        if (G > 2 && k == S(U - q))
                            for (var X = Math.min(g, G) - 1, $ = Math.min(32767, U), J = Math.min(258, G); q <= $ && --j && L != Q;) {
                                if (e[U + F] == e[U + F - q]) {
                                    for (var Z = 0; Z < J && e[U + Z] == e[U + Z - q]; ++Z);
                                    if (Z > F) {
                                        if (F = Z, K = q, Z > X) break;
                                        for (var ee = Math.min(q, Z - 2), et = 0, H = 0; H < ee; ++H) {
                                            var er = U - q + H & 32767,
                                                en = C[er],
                                                ei = er - en & 32767;
                                            ei > et && (et = ei, Q = er)
                                        }
                                    }
                                }
                                Q = C[L = Q], q += L - Q & 32767
                            }
                        if (K) {
                            I[N++] = 0x10000000 | v[F] << 18 | D[K];
                            var ea = 31 & v[F],
                                eo = 31 & D[K];
                            O += h[ea] + f[eo], ++R[257 + ea], ++_[eo], P = U + F, ++V
                        } else I[N++] = e[U], ++R[e[U]]
                    }
                }
                for (U = Math.max(U, P); U < o; ++U) I[N++] = e[U], ++R[e[U]];
                m = Y(e, u, p, I, R, _, O, N, B, U - B, m), p || (a.r = 7 & m | u[m / 8 | 0] << 3, m -= 7, a.h = w, a.p = C, a.i = U, a.w = P)
            } else {
                for (var U = a.w || 0; U < o + p; U += 65535) {
                    var es = U + 65535;
                    es >= o && (u[m / 8 | 0] = p, es = o), m = z(u, m + 1, e.subarray(U, es))
                }
                a.i = o
            }
            return x(s, 0, n + M(m) + i)
        },
        $ = function() {
            for (var e = new Int32Array(256), t = 0; t < 256; ++t) {
                for (var r = t, n = 9; --n;) r = (1 & r && -0x12477ce0) ^ r >>> 1;
                e[t] = r
            }
            return e
        }(),
        J = function() {
            var e = -1;
            return {
                p: function(t) {
                    for (var r = e, n = 0; n < t.length; ++n) r = $[255 & r ^ t[n]] ^ r >>> 8;
                    e = r
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
                p: function(r) {
                    for (var n = e, i = t, a = 0 | r.length, o = 0; o != a;) {
                        for (var s = Math.min(o + 2655, a); o < s; ++o) i += n += r[o];
                        n = (65535 & n) + 15 * (n >> 16), i = (65535 & i) + 15 * (i >> 16)
                    }
                    e = n, t = i
                },
                d: function() {
                    return e %= 65521, t %= 65521, (255 & e) << 24 | (65280 & e) << 8 | (255 & t) << 8 | t >> 8
                }
            }
        },
        ee = function(e, t, r, n, i) {
            if (!i && (i = {
                    l: 1
                }, t.dictionary)) {
                var a = t.dictionary.subarray(-32768),
                    o = new c(a.length + e.length);
                o.set(a), o.set(e, a.length), e = o, i.w = a.length
            }
            return X(e, null == t.level ? 6 : t.level, null == t.mem ? i.l ? Math.ceil(1.5 * Math.max(8, Math.min(13, Math.log(e.length)))) : 20 : 12 + t.mem, r, n, i)
        },
        et = function(e, t) {
            var r = {};
            for (var n in e) r[n] = e[n];
            for (var n in t) r[n] = t[n];
            return r
        },
        er = function(e, t, r) {
            for (var n = e(), i = e.toString(), a = i.slice(i.indexOf("[") + 1, i.lastIndexOf("]")).replace(/\s+/g, "").split(","), o = 0; o < n.length; ++o) {
                var s = n[o],
                    u = a[o];
                if ("function" == typeof s) {
                    t += ";" + u + "=";
                    var c = s.toString();
                    if (s.prototype)
                        if (-1 != c.indexOf("[native code]")) {
                            var l = c.indexOf(" ", 8) + 1;
                            t += c.slice(l, c.indexOf("(", l))
                        } else
                            for (var d in t += c, s.prototype) t += ";" + u + ".prototype." + d + "=" + s.prototype[d].toString();
                    else t += c
                } else r[u] = s
            }
            return t
        },
        en = [],
        ei = function(e) {
            var t = [];
            for (var r in e) e[r].buffer && t.push((e[r] = new e[r].constructor(e[r])).buffer);
            return t
        },
        ea = function(e, t, r, n) {
            if (!en[r]) {
                for (var i = "", a = {}, o = e.length - 1, s = 0; s < o; ++s) i = er(e[s], i, a);
                en[r] = {
                    c: er(e[o], i, a),
                    e: a
                }
            }
            var c = et({}, en[r].e);
            return u(en[r].c + ";onmessage=function(e){for(var k in e.data)self[k]=e.data[k];onmessage=" + t.toString() + "}", r, c, ei(c), n)
        },
        eo = function() {
            return [c, l, d, h, f, p, g, A, _, O, C, B, E, U, N, P, M, x, k, L, eV, el, ed]
        },
        es = function() {
            return [c, l, d, h, f, p, v, D, R, S, V, I, C, W, q, E, Q, G, H, F, K, j, z, Y, M, x, X, ee, eI, el]
        },
        eu = function() {
            return [eb, eA]
        },
        ec = function() {
            return [ew]
        },
        el = function(e) {
            return postMessage(e, [e.buffer])
        },
        ed = function(e) {
            return e && {
                out: e.size && new c(e.size),
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
        ef = function(e, t, r, n, i, a, o) {
            var s, u = ea(e, n, i, function(e, r) {
                e ? (u.terminate(), t.ondata.call(t, e)) : Array.isArray(r) ? 1 == r.length ? (t.queuedSize -= r[0], t.ondrain && t.ondrain(r[0])) : (r[1] && u.terminate(), t.ondata.call(t, e, r[0], r[1])) : o(r)
            });
            u.postMessage(r), t.queuedSize = 0, t.push = function(e, r) {
                t.ondata || k(5), s && t.ondata(k(4, 0, 1), null, !!r), t.queuedSize += e.length, u.postMessage([e, s = r], e.buffer instanceof ArrayBuffer ? [e.buffer] : [])
            }, t.terminate = function() {
                u.terminate()
            }, a && (t.flush = function(e) {
                u.postMessage([0, e])
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
        eg = function(e, t, r) {
            for (; r; ++t) e[t] = r, r >>>= 8
        },
        ev = function(e, t) {
            var r = t.filename;
            if (e[0] = 31, e[1] = 139, e[2] = 8, e[8] = t.level < 2 ? 4 : 2 * (9 == t.level), e[9] = 3, 0 != t.mtime && eg(e, 4, Math.floor(new Date(t.mtime || Date.now()) / 1e3)), r) {
                e[3] = 8;
                for (var n = 0; n <= r.length; ++n) e[n + 10] = r.charCodeAt(n)
            }
        },
        eb = function(e) {
            (31 != e[0] || 139 != e[1] || 8 != e[2]) && k(6, "invalid gzip data");
            var t = e[3],
                r = 10;
            4 & t && (r += (e[10] | e[11] << 8) + 2);
            for (var n = (t >> 3 & 1) + (t >> 4 & 1); n > 0; n -= !e[r++]);
            return r + (2 & t)
        },
        eA = function(e) {
            var t = e.length;
            return (e[t - 4] | e[t - 3] << 8 | e[t - 2] << 16 | e[t - 1] << 24) >>> 0
        },
        eD = function(e) {
            return 10 + (e.filename ? e.filename.length + 1 : 0)
        },
        eC = function(e, t) {
            var r = t.level;
            if (e[0] = 120, e[1] = (0 == r ? 0 : r < 6 ? 1 : 9 == r ? 3 : 2) << 6 | (t.dictionary && 32), e[1] |= 31 - (e[0] << 8 | e[1]) % 31, t.dictionary) {
                var n = Z();
                n.p(t.dictionary), eg(e, 2, n.d())
            }
        },
        ew = function(e, t) {
            return ((15 & e[0]) != 8 || e[0] >> 4 > 7 || (e[0] << 8 | e[1]) % 31) && k(6, "invalid zlib data"), (e[1] >> 5 & 1) == +!t && k(6, "invalid zlib data: " + (32 & e[1] ? "need" : "unexpected") + " dictionary"), (e[1] >> 3 & 4) + 2
        };

    function eT(e, t) {
        return "function" == typeof e && (t = e, e = {}), this.ondata = t, e
    }
    var eE = function() {
            function e(e, t) {
                if ("function" == typeof e && (t = e, e = {}), this.ondata = t, this.o = e || {}, this.s = {
                        l: 0,
                        i: 32768,
                        w: 32768,
                        z: 32768
                    }, this.b = new c(98304), this.o.dictionary) {
                    var r = this.o.dictionary.subarray(-32768);
                    this.b.set(r, 32768 - r.length), this.s.i = 32768 - r.length
                }
            }
            return e.prototype.p = function(e, t) {
                this.ondata(ee(e, this.o, 0, 0, this.s), t)
            }, e.prototype.push = function(e, t) {
                this.ondata || k(5), this.s.l && k(4);
                var r = e.length + this.s.z;
                if (r > this.b.length) {
                    if (r > 2 * this.b.length - 32768) {
                        var n = new c(-32768 & r);
                        n.set(this.b.subarray(0, this.s.z)), this.b = n
                    }
                    var i = this.b.length - this.s.z;
                    this.b.set(e.subarray(0, i), this.s.z), this.s.z = this.b.length, this.p(this.b, !1), this.b.set(this.b.subarray(-32768)), this.b.set(e.subarray(i), 32768), this.s.z = e.length - i + 32768, this.s.i = 32766, this.s.w = 32768
                } else this.b.set(e, this.s.z), this.s.z += e.length;
                this.s.l = 1 & t, (this.s.z > this.s.w + 8191 || t) && (this.p(this.b, t || !1), this.s.w = this.s.i, this.s.i -= 2), t && (this.s = this.o = {}, this.b = q)
            }, e.prototype.flush = function(e) {
                if (this.ondata || k(5), this.s.l && k(4), this.p(this.b, !1), this.s.w = this.s.i, this.s.i -= 2, e) {
                    var t = new c(6);
                    t[0] = this.s.r >> 3;
                    var r = z(t, this.s.r, q);
                    this.s.r = 0, this.ondata(t.subarray(0, r >> 3), !1)
                }
            }, e
        }(),
        eS = function(e, t) {
            ef([es, function() {
                return [eh, eE]
            }], this, eT.call(this, e, t), function(e) {
                onmessage = eh(new eE(e.data))
            }, 6, 1)
        };

    function eI(e, t) {
        return ee(e, t || {}, 0, 0)
    }
    var eR = function() {
            function e(e, t) {
                "function" == typeof e && (t = e, e = {}), this.ondata = t;
                var r = e && e.dictionary && e.dictionary.subarray(-32768);
                this.s = {
                    i: 0,
                    b: r ? r.length : 0
                }, this.o = new c(32768), this.p = new c(0), r && this.o.set(r)
            }
            return e.prototype.e = function(e) {
                if (this.ondata || k(5), this.d && k(4), this.p.length) {
                    if (e.length) {
                        var t = new c(this.p.length + e.length);
                        t.set(this.p), t.set(e, this.p.length), this.p = t
                    }
                } else this.p = e
            }, e.prototype.c = function(e) {
                this.s.i = +(this.d = e || !1);
                var t = this.s.b,
                    r = L(this.p, this.s, this.o);
                this.ondata(x(r, t, this.s.b), this.d), this.o = x(r, this.s.b - 32768), this.s.b = this.o.length, this.p = x(this.p, this.s.p / 8 | 0), this.s.p &= 7
            }, e.prototype.push = function(e, t) {
                this.e(e), this.c(t)
            }, e
        }(),
        e_ = function(e, t) {
            ef([eo, function() {
                return [eh, eR]
            }], this, eT.call(this, e, t), function(e) {
                onmessage = eh(new eR(e.data))
            }, 7, 0)
        };

    function eV(e, t) {
        return L(e, {
            i: 2
        }, t && t.out, t && t.dictionary)
    }(function() {
        function e(e, t) {
            this.c = J(), this.l = 0, this.v = 1, eE.call(this, e, t)
        }
        e.prototype.push = function(e, t) {
            this.c.p(e), this.l += e.length, eE.prototype.push.call(this, e, t)
        }, e.prototype.p = function(e, t) {
            var r = ee(e, this.o, this.v && eD(this.o), t && 8, this.s);
            this.v && (ev(r, this.o), this.v = 0), t && (eg(r, r.length - 8, this.c.d()), eg(r, r.length - 4, this.l)), this.ondata(r, t)
        }, e.prototype.flush = function(e) {
            eE.prototype.flush.call(this, e)
        }
    })();
    var eO = function() {
            function e(e, t) {
                this.v = 1, this.r = 0, eR.call(this, e, t)
            }
            return e.prototype.push = function(e, t) {
                if (eR.prototype.e.call(this, e), this.r += e.length, this.v) {
                    var r = this.p.subarray(this.v - 1),
                        n = r.length > 3 ? eb(r) : 4;
                    if (n > r.length) {
                        if (!t) return
                    } else this.v > 1 && this.onmember && this.onmember(this.r - r.length);
                    this.p = r.subarray(n), this.v = 0
                }
                eR.prototype.c.call(this, 0), this.s.f && !this.s.l ? (this.v = M(this.s.p) + 9, this.s = {
                    i: 0
                }, this.o = new c(0), this.push(new c(0), t)) : t && eR.prototype.c.call(this, t)
            }, e
        }(),
        eU = function(e, t) {
            var r = this;
            ef([eo, eu, function() {
                return [eh, eR, eO]
            }], this, eT.call(this, e, t), function(e) {
                var t = new eO(e.data);
                t.onmember = function(e) {
                    return postMessage(e)
                }, onmessage = eh(t)
            }, 9, 0, function(e) {
                return r.onmember && r.onmember(e)
            })
        },
        eN = (function() {
            function e(e, t) {
                this.c = Z(), this.v = 1, eE.call(this, e, t)
            }
            e.prototype.push = function(e, t) {
                this.c.p(e), eE.prototype.push.call(this, e, t)
            }, e.prototype.p = function(e, t) {
                var r = ee(e, this.o, this.v && (this.o.dictionary ? 6 : 2), t && 4, this.s);
                this.v && (eC(r, this.o), this.v = 0), t && eg(r, r.length - 4, this.c.d()), this.ondata(r, t)
            }, e.prototype.flush = function(e) {
                eE.prototype.flush.call(this, e)
            }
        }(), function() {
            function e(e, t) {
                eR.call(this, e, t), this.v = e && e.dictionary ? 2 : 1
            }
            return e.prototype.push = function(e, t) {
                if (eR.prototype.e.call(this, e), this.v) {
                    if (this.p.length < 6 && !t) return;
                    this.p = this.p.subarray(ew(this.p, this.v - 1)), this.v = 0
                }
                t && (this.p.length < 4 && k(6, "invalid zlib data"), this.p = this.p.subarray(0, -4)), eR.prototype.c.call(this, t)
            }, e
        }()),
        eP = function(e, t) {
            ef([eo, ec, function() {
                return [eh, eR, eN]
            }], this, eT.call(this, e, t), function(e) {
                onmessage = eh(new eN(e.data))
            }, 11, 0)
        },
        eM = function() {
            function e(e, t) {
                this.o = eT.call(this, e, t) || {}, this.G = eO, this.I = eR, this.Z = eN
            }
            return e.prototype.i = function() {
                var e = this;
                this.s.ondata = function(t, r) {
                    e.ondata(t, r)
                }
            }, e.prototype.push = function(e, t) {
                if (this.ondata || k(5), this.s) this.s.push(e, t);
                else {
                    if (this.p && this.p.length) {
                        var r = new c(this.p.length + e.length);
                        r.set(this.p), r.set(e, this.p.length)
                    } else this.p = e;
                    this.p.length > 2 && (this.s = 31 == this.p[0] && 139 == this.p[1] && 8 == this.p[2] ? new this.G(this.o) : (15 & this.p[0]) != 8 || this.p[0] >> 4 > 7 || (this.p[0] << 8 | this.p[1]) % 31 ? new this.I(this.o) : new this.Z(this.o), this.i(), this.s.push(this.p, t), this.p = null)
                }
            }, e
        }();

    function ex(e, t) {
        eM.call(this, e, t), this.queuedSize = 0, this.G = eU, this.I = e_, this.Z = eP
    }
    ex.prototype.i = function() {
        var e = this;
        this.s.ondata = function(t, r, n) {
            e.ondata(t, r, n)
        }, this.s.ondrain = function(t) {
            e.queuedSize -= t, e.ondrain && e.ondrain(t)
        }
    }, ex.prototype.push = function(e, t) {
        this.queuedSize += e.length, eM.prototype.push.call(this, e, t)
    };
    var eB = "u" > typeof TextEncoder && new TextEncoder,
        ek = "u" > typeof TextDecoder && new TextDecoder,
        eL = 0;
    try {
        ek.decode(q, {
            stream: !0
        }), eL = 1
    } catch (e) {}
    var eQ = function(e) {
        for (var t = "", r = 0;;) {
            var n = e[r++],
                i = (n > 127) + (n > 223) + (n > 239);
            if (r + i > e.length) return {
                s: t,
                r: x(e, r - 1)
            };
            i ? 3 == i ? t += String.fromCharCode(55296 | (n = ((15 & n) << 18 | (63 & e[r++]) << 12 | (63 & e[r++]) << 6 | 63 & e[r++]) - 65536) >> 10, 56320 | 1023 & n) : 1 & i ? t += String.fromCharCode((31 & n) << 6 | 63 & e[r++]) : t += String.fromCharCode((15 & n) << 12 | (63 & e[r++]) << 6 | 63 & e[r++]) : t += String.fromCharCode(n)
        }
    };

    function eG(e, t) {
        if (t) {
            for (var r = new c(e.length), n = 0; n < e.length; ++n) r[n] = e.charCodeAt(n);
            return r
        }
        if (eB) return eB.encode(e);
        for (var i = e.length, a = new c(e.length + (e.length >> 1)), o = 0, s = function(e) {
                a[o++] = e
            }, n = 0; n < i; ++n) {
            if (o + 5 > a.length) {
                var u = new c(o + 8 + (i - n << 1));
                u.set(a), a = u
            }
            var l = e.charCodeAt(n);
            l < 128 || t ? s(l) : (l < 2048 ? s(192 | l >> 6) : (l > 55295 && l < 57344 ? (s(240 | (l = 65536 + (1047552 & l) | 1023 & e.charCodeAt(++n)) >> 18), s(128 | l >> 12 & 63)) : s(224 | l >> 12), s(128 | l >> 6 & 63)), s(128 | 63 & l))
        }
        return x(a, 0, o)
    }

    function eH(e, t) {
        if (t) {
            for (var r = "", n = 0; n < e.length; n += 16384) r += String.fromCharCode.apply(null, e.subarray(n, n + 16384));
            return r
        }
        if (ek) return ek.decode(e);
        var i = eQ(e),
            a = i.s,
            r = i.r;
        return r.length && k(8), a
    }(function(e) {
        this.ondata = e, eL ? this.t = new TextDecoder : this.p = q
    }).prototype.push = function(e, t) {
        if (this.ondata || k(5), t = !!t, this.t) {
            this.ondata(this.t.decode(e, {
                stream: !0
            }), t), t && (this.t.decode().length && k(8), this.t = null);
            return
        }
        this.p || k(4);
        var r = new c(this.p.length + e.length);
        r.set(this.p), r.set(e, this.p.length);
        var n = eQ(r),
            i = n.s,
            a = n.r;
        t ? (a.length && k(8), this.p = null) : this.p = a, this.ondata(i, t)
    }, (function(e) {
        this.ondata = e
    }).prototype.push = function(e, t) {
        this.ondata || k(5), this.d && k(4), this.ondata(eG(e), this.d = t || !1)
    };
    var eF = function(e) {
            return 1 == e ? 3 : e < 6 ? 2 : +(9 == e)
        },
        eK = function(e, t, r, n, i, a, o) {
            var s = 0xffffffff == i,
                u = 0xffffffff == a,
                c = 0xffffffff == o,
                l = t + r;
            if (n && s + u + c) {
                for (; t + 4 < l; t += 4 + ep(e, t + 2))
                    if (1 == ep(e, t)) return [s ? ey(e, t + 4 + 8 * u) : i, u ? ey(e, t + 4) : a, c ? ey(e, t + 4 + 8 * (u + s)) : o, 1];
                n < 2 && k(13)
            }
            return [i, a, o, 0]
        },
        ej = function(e) {
            var t = 0;
            if (e)
                for (var r in e) {
                    var n = e[r].length;
                    n > 65535 && k(9), t += n + 4
                }
            return t
        },
        ez = function(e, t, r, n, i, a, o, s) {
            var u = n.length,
                c = r.extra,
                l = s && s.length,
                d = ej(c);
            eg(e, t, null != o ? 0x2014b50 : 0x4034b50), t += 4, null != o && (e[t++] = 20, e[t++] = r.os), e[t] = 20, t += 2, e[t++] = r.flag << 1 | (a < 0 && 8), e[t++] = i && 8, e[t++] = 255 & r.compression, e[t++] = r.compression >> 8;
            var h = new Date(null == r.mtime ? Date.now() : r.mtime),
                f = h.getFullYear() - 1980;
            if ((f < 0 || f > 119) && k(10), eg(e, t, f << 25 | h.getMonth() + 1 << 21 | h.getDate() << 16 | h.getHours() << 11 | h.getMinutes() << 5 | h.getSeconds() >> 1), t += 4, -1 != a && (eg(e, t, r.crc), eg(e, t + 4, a < 0 ? -a - 2 : a), eg(e, t + 8, r.size)), eg(e, t + 12, u), eg(e, t + 14, d), t += 16, null != o && (eg(e, t, l), eg(e, t + 6, r.attrs), eg(e, t + 10, o), t += 14), e.set(n, t), t += u, d)
                for (var p in c) {
                    var m = c[p],
                        y = m.length;
                    eg(e, t, +p), eg(e, t + 2, y), e.set(m, t + 4), t += 4 + y
                }
            return l && (e.set(s, t), t += l), t
        },
        eY = function(e, t, r, n, i) {
            eg(e, t, 0x6054b50), eg(e, t + 8, r), eg(e, t + 10, r), eg(e, t + 12, n), eg(e, t + 16, i)
        },
        eW = function() {
            function e(e) {
                this.filename = e, this.c = J(), this.size = 0, this.compression = 0
            }
            return e.prototype.process = function(e, t) {
                this.ondata(null, e, t)
            }, e.prototype.push = function(e, t) {
                this.ondata || k(5), this.c.p(e), this.size += e.length, t && (this.crc = this.c.d()), this.process(e, t || !1)
            }, e
        }();

    function eq(e, t) {
        var r = this;
        t || (t = {}), eW.call(this, e), this.d = new eE(t, function(e, t) {
            r.ondata(null, e, t)
        }), this.compression = 8, this.flag = eF(t.level)
    }

    function eX(e, t) {
        var r = this;
        t || (t = {}), eW.call(this, e), this.d = new eS(t, function(e, t, n) {
            r.ondata(e, t, n)
        }), this.compression = 8, this.flag = eF(t.level), this.terminate = this.d.terminate
    }

    function e$(e) {
        this.ondata = e, this.u = [], this.d = 1
    }
    eq.prototype.process = function(e, t) {
        try {
            this.d.push(e, t)
        } catch (e) {
            this.ondata(e, null, t)
        }
    }, eq.prototype.push = function(e, t) {
        eW.prototype.push.call(this, e, t)
    }, eX.prototype.process = function(e, t) {
        this.d.push(e, t)
    }, eX.prototype.push = function(e, t) {
        eW.prototype.push.call(this, e, t)
    }, e$.prototype.add = function(e) {
        var t = this;
        if (this.ondata || k(5), 2 & this.d) this.ondata(k(4 + (1 & this.d) * 8, 0, 1), null, !1);
        else {
            var r = eG(e.filename),
                n = r.length,
                i = e.comment,
                a = i && eG(i),
                o = n != e.filename.length || a && i.length != a.length,
                s = n + ej(e.extra) + 30;
            n > 65535 && this.ondata(k(11, 0, 1), null, !1);
            var u = new c(s);
            ez(u, 0, e, r, o, -1);
            var l = [u],
                d = function() {
                    for (var e = 0, r = l; e < r.length; e++) {
                        var n = r[e];
                        t.ondata(null, n, !1)
                    }
                    l = []
                },
                h = this.d;
            this.d = 0;
            var f = this.u.length,
                p = et(e, {
                    f: r,
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
            e.ondata = function(r, n, i) {
                if (r) t.ondata(r, n, i), t.terminate();
                else if (m += n.length, l.push(n), i) {
                    var a = new c(16);
                    eg(a, 0, 0x8074b50), eg(a, 4, e.crc), eg(a, 8, m), eg(a, 12, e.size), l.push(a), p.c = m, p.b = s + m + 16, p.crc = e.crc, p.size = e.size, h && p.r(), h = 1
                } else h && d()
            }, this.u.push(p)
        }
    }, e$.prototype.end = function() {
        var e = this;
        2 & this.d ? this.ondata(k(4 + (1 & this.d) * 8, 0, 1), null, !0) : (this.d ? this.e() : this.u.push({
            r: function() {
                1 & e.d && (e.u.splice(-1, 1), e.e())
            },
            t: function() {}
        }), this.d = 3)
    }, e$.prototype.e = function() {
        for (var e = 0, t = 0, r = 0, n = 0, i = this.u; n < i.length; n++) {
            var a = i[n];
            r += 46 + a.f.length + ej(a.extra) + (a.o ? a.o.length : 0)
        }
        for (var o = new c(r + 22), s = 0, u = this.u; s < u.length; s++) {
            var a = u[s];
            ez(o, e, a, a.f, a.u, -a.c - 2, t, a.o), e += 46 + a.f.length + ej(a.extra) + (a.o ? a.o.length : 0), t += a.b
        }
        eY(o, e, this.u.length, r, t), this.ondata(null, o, !0), this.d = 2
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
        this.i = new eR(function(t, r) {
            e.ondata(null, t, r)
        })
    }

    function e0(e, t) {
        var r = this;
        t < 32e4 ? this.i = new eR(function(e, t) {
            r.ondata(null, e, t)
        }) : (this.i = new e_(function(e, t, n) {
            r.ondata(e, t, n)
        }), this.terminate = this.i.terminate)
    }

    function e1(e) {
        this.onfile = e, this.k = [], this.o = {
            0: eJ
        }, this.p = q
    }
    eZ.prototype.push = function(e, t) {
        try {
            this.i.push(e, t)
        } catch (e) {
            this.ondata(e, null, t)
        }
    }, eZ.compression = 8, e0.prototype.push = function(e, t) {
        this.i.terminate && (e = x(e, 0)), this.i.push(e, t)
    }, e0.compression = 8, e1.prototype.push = function(e, t) {
        var r = this;
        if (this.onfile || k(5), this.p || k(4), this.c > 0) {
            var n = Math.min(this.c, e.length),
                i = e.subarray(0, n);
            if (this.c -= n, this.d ? this.d.push(i, !this.c) : this.k[0].push(i), (e = e.subarray(n)).length) return this.push(e, t)
        } else {
            var a = 0,
                o = 0,
                s = void 0,
                u = void 0;
            this.p.length ? e.length ? ((u = new c(this.p.length + e.length)).set(this.p), u.set(e, this.p.length)) : u = this.p : u = e;
            for (var l = u.length, d = this.c, h = d && this.d, f = this; o < l - 4 && "break" !== function() {
                    var e = em(u, o);
                    if (0x4034b50 == e) {
                        a = 1, s = o, f.d = null, f.c = 0;
                        var t = ep(u, o + 6),
                            n = ep(u, o + 8),
                            i = ep(u, o + 26),
                            c = ep(u, o + 28);
                        if (l > o + 30 + i + c) {
                            var h, p = [];
                            f.k.unshift(p), a = 2;
                            var m = em(u, o + 18),
                                y = em(u, o + 22),
                                g = eH(u.subarray(o + 30, o += 30 + i), !(2048 & t)),
                                v = eK(u, o, c, 2, m, y, 0),
                                b = v[0],
                                A = v[1],
                                D = v[3];
                            8 & t && (b = -1 - D), o += c, f.c = b;
                            var C = {
                                name: g,
                                compression: n,
                                start: function() {
                                    if (C.ondata || k(5), b) {
                                        var e = r.o[n];
                                        e || C.ondata(k(14, "unknown compression type " + n, 1), null, !1), (h = b < 0 ? new e(g) : new e(g, b, A)).ondata = function(e, t, r) {
                                            C.ondata(e, t, r)
                                        };
                                        for (var t = 0; t < p.length; t++) {
                                            var i = p[t];
                                            h.push(i, !1)
                                        }
                                        r.k[0] == p && r.c ? r.d = h : h.push(q, !0)
                                    } else C.ondata(null, q, !0)
                                },
                                terminate: function() {
                                    h && h.terminate && h.terminate()
                                }
                            };
                            b >= 0 && (C.size = b, C.originalSize = A), f.onfile(C)
                        }
                        return "break"
                    }
                    if (d) {
                        if (0x8074b50 == e) return s = o += 12 + (-2 == d && 8), a = 3, f.c = 0, "break";
                        else if (0x2014b50 == e) return s = o -= 4, a = 3, f.c = 0, "break"
                    }
                }(); ++o);
            if (this.p = q, d < 0) {
                var p = a ? u.subarray(0, s - 12 - (-2 == d && 8) - (0x8074b50 == em(u, s - 16) && 4)) : u.subarray(0, o);
                h ? h.push(p, !!a) : this.k[+(2 == a)].push(p)
            }
            if (2 & a) return this.push(u.subarray(o), t);
            this.p = u.subarray(o)
        }
        t && (this.c && k(13), this.p = null)
    }, e1.prototype.register = function(e) {
        this.o[e.compression] = e
    }, "function" == typeof queueMicrotask && queueMicrotask;
    let e2 = e => (e => {
            let t = "";
            for (let r = 0; r < e.length; r += 32768) t += String.fromCharCode(...e.subarray(r, r + 32768));
            return btoa(t).replaceAll("+", "-").replaceAll("/", "_").replace(/=+$/u, "")
        })(eI(eG(e))),
        e3 = (e, t) => {
            let r = (e => {
                if (!e || !/^[A-Za-z0-9_-]+$/u.test(e)) return null;
                let t = e.replaceAll("-", "+").replaceAll("_", "/"),
                    r = "".concat(t).concat("=".repeat((4 - t.length % 4) % 4));
                try {
                    if (void 0 !== o.Buffer) return new Uint8Array(o.Buffer.from(r, "base64"));
                    let e = atob(r),
                        t = new Uint8Array(e.length);
                    for (let r = 0; r < e.length; r += 1) t[r] = e.charCodeAt(r);
                    return t
                } catch (e) {
                    return null
                }
            })(e);
            if (!r) return null;
            try {
                let e = eH(eV(r));
                return e.length <= t ? e : null
            } catch (e) {
                return null
            }
        };
    e.s(["compressQueryParamPayload", 0, e2, "decompressQueryParamPayload", 0, e3], 456954);
    var e5 = e.i(973005),
        e8 = e.i(11517),
        e6 = n;
    e.s(["RAQIV2FilterOperation", () => e6.AnalyticsQueryGatewayAPIFilterOperation], 390463);
    var e6 = n,
        e4 = e.i(721281);
    class e7 extends Error {
        constructor(e, t, r, n) {
            super(null != n ? n : "unsupported-version" === e ? "Document version ".concat(t, " is not supported; target version ").concat(r, ".") : "No migration path from version ".concat(t, " to version ").concat(r, ".")), (0, e4._)(this, "kind", void 0), (0, e4._)(this, "fromVersion", void 0), (0, e4._)(this, "targetVersion", void 0), this.name = "VersionedMigrationError", this.kind = e, this.fromVersion = t, this.targetVersion = r
        }
    }
    let e9 = (e, t) => new e7("unsupported-version", e, t),
        te = (e, t, r) => new e7("migration-gap", e, t, r),
        tt = e => !!e && "object" == typeof e && !Array.isArray(e),
        tr = e => {
            if (!tt(e)) return 2;
            let {
                v: t
            } = e;
            return void 0 === t ? 1 : "number" == typeof t ? t : 3
        },
        tn = (e, t) => tt(e) ? {
            ...e,
            v: t
        } : e,
        ti = e => {
            let r, n;
            if (!tt(e)) return e;
            let a = e.f;
            if (!Array.isArray(a)) return e;
            let {
                customEventName: o,
                realFilters: s
            } = (n = a.filter(e => {
                var n, a;
                let o, s;
                return !(tt(n = e) && n.dimension === t.RAQIV2Dimension.CustomEventName && Array.isArray(o = n.values) && o.every(e => "string" == typeof e) && (void 0 === n.operation || ("string" == typeof(s = a = n.operation) || "number" == typeof s) && (0, i.isValidEnumValue)(e6.AnalyticsQueryGatewayAPIFilterOperation, a) && a !== e6.AnalyticsQueryGatewayAPIFilterOperation.Invalid)) || (null != r || (r = e.values[0]), !1)
            }), {
                customEventName: r,
                realFilters: n.length > 0 ? n : void 0
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
        tu = e => ts(e) && (0, a.isNumericUIMetric)(e),
        tc = e => "string" == typeof e || "number" == typeof e,
        tl = e => {
            let t = (0, e8.getUIMetricFromAtomicMetricLike)(e.metric);
            if (!tu(t)) return (0, r.default)('Cannot serialize non-numeric computed metric source "'.concat(String(t), '".')), null;
            let n = {
                k: e.key,
                m: t
            };
            e.filters && e.filters.length > 0 && (n.f = [...e.filters]), (0, e8.isCustomEventsAtomicMetricLike)(e.metric) && (n.c = e.metric.customEventName);
            let i = ((e, t) => {
                if (!e && !t) return;
                let r = {};
                if (null != t ? t : null == e ? void 0 : e.aggregationType) {
                    var n;
                    r.a = null != (n = null != t ? t : null == e ? void 0 : e.aggregationType) ? n : void 0
                }
                return (null == e ? void 0 : e.percentile) && (r.p = e.percentile), Object.keys(r).length > 0 ? r : void 0
            })(e.pseudoDimensionValues, (0, e8.isCustomEventsAtomicMetricLike)(e.metric) ? e.metric.aggregationType : void 0);
            return i && (n.p = i), n
        },
        td = e => {
            let r, n = (e => {
                var t, r;
                if (e && (void 0 !== e.a || void 0 !== e.p)) return {
                    aggregationType: null != (t = e.a) ? t : null,
                    percentile: null != (r = e.p) ? r : null
                }
            })(e.p);
            if (e.m === t.RAQIV2UIMetric.CustomEventsV2) {
                var i;
                let t = e.c;
                if (!t) return null;
                r = {
                    metric: e.m,
                    customEventName: t,
                    ...(null == (i = e.p) ? void 0 : i.a) ? {
                        aggregationType: e.p.a
                    } : {}
                }
            } else r = e.m;
            return {
                key: e.k,
                metric: r,
                filters: e.f,
                ...n && n.percentile ? {
                    pseudoDimensionValues: {
                        aggregationType: null,
                        percentile: n.percentile
                    }
                } : {}
            }
        };
    e.s(["deserializeComputedMetricFromQueryParam", 0, e => {
        if (!e || e.length > 4096 || !e.startsWith(to)) return null;
        let r = e3(e.slice(to.length), 4096);
        if (!r) return null;
        let a = (e => {
            try {
                return JSON.parse(e)
            } catch (e) {
                return null
            }
        })(r);
        if (null === a) return null;
        let o = (e => {
            try {
                return (e => {
                    let {
                        document: t,
                        registry: r,
                        targetVersion: n,
                        getVersion: i,
                        setVersion: a,
                        createUnsupportedVersionError: o = e9,
                        createMigrationGapError: s = te
                    } = e, u = t, c = i(t);
                    if (c > n) throw o(c, n);
                    let l = c,
                        d = r.length + 1,
                        h = 0;
                    for (; l < n && h < d;) {
                        let e = l,
                            t = r.find(t => t.fromVersion === e);
                        if (!t) throw s(e, n);
                        let o = t.migrate(u),
                            c = i(o);
                        if (c !== e && c !== t.toVersion) throw s(e, n, "Migration step ".concat(e, " -> ").concat(t.toVersion, " produced version ").concat(c, "."));
                        u = a(o, t.toVersion), l = t.toVersion, h += 1
                    }
                    if (l !== n) throw s(l, n, "Migration pipeline did not converge after ".concat(h, " steps (stopped at version ").concat(l, ")."));
                    return a(u, n)
                })({
                    document: e,
                    registry: ta,
                    targetVersion: 2,
                    getVersion: tr,
                    setVersion: tn
                })
            } catch (e) {
                return null
            }
        })(a);
        if (!(o && "object" == typeof o && 2 === o.v && Array.isArray(o.s) && 0 !== o.s.length && ts(o.f) && (void 0 === o.n || "string" == typeof o.n) && o.s.every(e => {
                var r, a;
                let o;
                return !(!(r = e) || "object" != typeof r || Array.isArray(r)) && !!ts(r.k) && !!tu(r.m) && (void 0 === r.f || !!(Array.isArray(o = r.f) && o.every(e => (e => {
                    if (!e || "object" != typeof e) return !1;
                    let {
                        dimension: r,
                        values: a,
                        operation: o
                    } = e;
                    return !(!tc(r) || !(0, i.isValidEnumValue)(t.RAQIV2Dimension, r) || (0, e5.default)(r)) && r !== t.RAQIV2Dimension.CustomEventName && Array.isArray(a) && a.every(e => "string" == typeof e) && (void 0 === o || tc(o) && (0, i.isValidEnumValue)(n.AnalyticsQueryGatewayAPIFilterOperation, o) && o !== n.AnalyticsQueryGatewayAPIFilterOperation.Invalid)
                })(e)))) && (void 0 === r.c || !!ts(r.c)) && (void 0 === r.p || !!((a = r.p) && "object" == typeof a && (void 0 === a.a || tc(a.a) && (0, i.isValidEnumValue)(t.RAQIV2AggregationType, a.a)) && (void 0 === a.p || tc(a.p) && (0, i.isValidEnumValue)(t.RAQIV2PercentileType, a.p)) && 1))
            }))) return null;
        let [s, ...u] = o.s, c = td(s), l = [];
        for (let e of u) {
            let t = td(e);
            if (!t) return null;
            l.push(t)
        }
        return c ? {
            sources: [c, ...l],
            formula: o.f,
            name: ts(o.n) ? o.n : void 0,
            l7Smoothing: 1 === o.l
        } : null
    }, "serializeComputedMetricToQueryParam", 0, e => {
        let t = [];
        for (let r of e.sources) {
            let e = tl(r);
            if (!e) return null;
            t.push(e)
        }
        let r = {
            v: 2,
            s: t,
            f: e.formula,
            n: ts(e.name) ? e.name.trim() : void 0,
            l: e.l7Smoothing ? 1 : void 0
        };
        return "".concat(to).concat(e2(JSON.stringify(r)))
    }], 545154)
}, 841383, e => {
    "use strict";
    var t = e.i(31611);
    let r = new Set([t.RAQIV2Metric.ForwardD1Retention, t.RAQIV2Metric.ForwardD7Retention, t.RAQIV2Metric.ForwardD30Retention]),
        n = t.RAQIV2MetricToSupportedGranularities,
        i = e => {
            let i = n[e];
            return i && r.has(e) ? i.filter(e => e !== t.RAQIV2MetricGranularity.None) : i
        };
    e.s(["getSelectableGranularitiesForMetric", 0, i, "isGranularitySelectableForMetric", 0, (e, t) => {
        var r, n;
        return null != (r = null == (n = i(e)) ? void 0 : n.includes(t)) && r
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
        r = ["maxDashboardsPerUniverse", "maxPinnedDashboardsPerUniverse", "maxSummaryCardsPerDashboard", "maxChartTilesPerDashboard", "maxTableMetricColumns", "maxDashboardNameLength", "maxDashboardDescriptionLength", "maxTileTitleLength"];

    function n(e) {
        return "object" == typeof e && null !== e && !Array.isArray(e)
    }
    e.s(["DENIED_DASHBOARD_CAPABILITIES", 0, t, "parseDashboardCapabilities", 0, function(e) {
        return n(e) ? {
            canCreate: !0 === e.canCreate,
            canEdit: !0 === e.canEdit,
            canPublish: !0 === e.canPublish,
            canDelete: !0 === e.canDelete,
            limits: function(e) {
                if (!n(e)) return {};
                let t = {};
                return r.forEach(r => {
                    var n;
                    let i = "number" == typeof(n = e[r]) && Number.isSafeInteger(n) && n > 0 ? n : void 0;
                    void 0 !== i && (t[r] = i)
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
            maxTableMetricColumns: e.i(805386).MAX_TABLE_METRIC_COLUMNS
        },
        r = {
            maxDashboardsPerUniverse: t.maxDashboardsPerUniverse,
            maxPinnedDashboardsPerUniverse: 5,
            maxSummaryCardsPerDashboard: t.maxSummaryCardsPerDashboard,
            maxChartTilesPerDashboard: t.maxChartTilesPerDashboard,
            maxTableMetricColumns: 8,
            maxDashboardNameLength: 80,
            maxDashboardDescriptionLength: 280,
            maxTileTitleLength: 80
        };

    function n(e) {
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

    function i(e, n) {
        var i;
        return void 0 === n ? r[e] : Math.min(n, null != (i = t[e]) ? i : n)
    }
    e.s(["CONSERVATIVE_DASHBOARD_LIMITS", 0, r, "MAX_TILES_PER_ROW", 0, 2, "resolveEffectiveDashboardLimits", 0, n, "resolveHybridDashboardLimits", 0, function(e) {
        var t;
        return {
            ...n(null != (t = null == e ? void 0 : e.limits) ? t : {}),
            maxDashboardsPerUniverse: 1 / 0
        }
    }])
}, 283561, e => {
    "use strict";
    var t = e.i(721281);
    class r extends Error {
        constructor(e, r, n) {
            super(r, n), (0, t._)(this, "code", void 0), this.name = new.target.name, this.code = e
        }
    }
    e.s(["CustomDashboardMigrationGapError", 0, class extends r {
        constructor(e, r, n) {
            super("MIGRATION_GAP", null != n ? n : "No migration step registered for schema version ".concat(e, " → ").concat(r, ".")), (0, t._)(this, "fromVersion", void 0), (0, t._)(this, "currentVersion", void 0), this.fromVersion = e, this.currentVersion = r
        }
    }, "CustomDashboardNotAvailableError", 0, class extends r {
        constructor() {
            super("NOT_AVAILABLE", "Custom dashboards are not available in this context.")
        }
    }, "CustomDashboardNotFoundError", 0, class extends r {
        constructor(e) {
            super("NOT_FOUND", "Custom dashboard ".concat(e, " was not found.")), (0, t._)(this, "dashboardId", void 0), this.dashboardId = e
        }
    }, "CustomDashboardPermissionDeniedError", 0, class extends r {
        constructor(e) {
            super("PERMISSION_DENIED", null != e ? e : "You do not have permission to modify this dashboard.")
        }
    }, "CustomDashboardQuotaExceededError", 0, class extends r {
        constructor(e) {
            super("QUOTA_EXCEEDED", null != e ? e : "Custom dashboard quota has been exceeded. Delete a dashboard and try again.")
        }
    }, "CustomDashboardServiceError", 0, r, "CustomDashboardStorageUnreadableError", 0, class extends r {
        constructor(e, r) {
            super("STORAGE_UNREADABLE", 'Custom dashboard storage is unreadable; raw bytes preserved at "'.concat(e, '".'), void 0 !== r ? {
                cause: r
            } : void 0), (0, t._)(this, "sidecarKey", void 0), this.sidecarKey = e
        }
    }, "CustomDashboardStorageWriteError", 0, class extends r {
        constructor(e) {
            super("STORAGE_WRITE_FAILED", "Failed to write custom dashboard storage.", void 0 !== e ? {
                cause: e
            } : void 0)
        }
    }, "CustomDashboardUnauthenticatedError", 0, class extends r {
        constructor(e) {
            super("UNAUTHENTICATED", null != e ? e : "Sign in to continue using custom dashboards.")
        }
    }, "CustomDashboardUnsupportedSchemaError", 0, class extends r {
        constructor(e, r) {
            super("UNSUPPORTED_NEWER_SCHEMA", "Stored custom dashboard schema v".concat(e, " is newer than the client's v").concat(r, ".")), (0, t._)(this, "schemaVersion", void 0), (0, t._)(this, "currentVersion", void 0), this.schemaVersion = e, this.currentVersion = r
        }
    }, "CustomDashboardValidationError", 0, class extends r {
        constructor(e, r) {
            super("VALIDATION", r), (0, t._)(this, "field", void 0), this.field = e
        }
    }, "CustomDashboardVersionConflictError", 0, class extends r {
        constructor(e) {
            super("VERSION_CONFLICT", "Custom dashboard ".concat(e, " has been modified elsewhere. Reload to continue.")), (0, t._)(this, "dashboardId", void 0), this.dashboardId = e
        }
    }])
}, 964956, e => {
    "use strict";
    e.s(["CAPABILITIES_STALE_TIME_MS", 0, 3e5, "DETAIL_STALE_TIME_MS", 0, 3e4, "LIST_STALE_TIME_MS", 0, 3e4, "customDashboardQueryKeys", 0, {
        universe: e => ["custom-dashboards", "universe", e],
        list: (e, t) => {
            var r, n;
            let i = ["custom-dashboards", "universe", e, "list"];
            return t ? [...i, null != (r = t.pageSize) ? r : null, null != (n = t.pageToken) ? n : null] : i
        },
        listInfinite: (e, t) => ["custom-dashboards", "universe", e, "list", "infinite", null != t ? t : null],
        pinned: e => ["custom-dashboards", "universe", e, "pinned"],
        detail: (e, t) => ["custom-dashboards", "universe", e, "detail", t],
        suggestedName: e => ["custom-dashboards", "universe", e, "suggested-name"],
        capabilities: e => ["custom-dashboards", "universe", e, "capabilities"]
    }])
}, 258576, 466386, e => {
    "use strict";
    var t = e.i(157310),
        r = e.i(257969),
        n = e.i(964956);
    e.s(["useDashboardCapabilitiesQuery", 0, function(e, i, a) {
        var o;
        let s = (0, t.useQuery)({
            queryKey: n.customDashboardQueryKeys.capabilities(e),
            queryFn: () => {
                var t, n;
                return null != (t = null == (n = i.getCapabilities) ? void 0 : n.call(i, e)) ? t : Promise.resolve(r.DENIED_DASHBOARD_CAPABILITIES)
            },
            staleTime: n.CAPABILITIES_STALE_TIME_MS,
            refetchOnWindowFocus: !0,
            enabled: a.enabled && Number.isFinite(e) && e > 0
        });
        return {
            capabilities: null != (o = s.data) ? o : r.DENIED_DASHBOARD_CAPABILITIES,
            isResolved: void 0 !== s.data,
            isError: s.isError && void 0 === s.data
        }
    }], 258576);
    var i = e.i(759283);
    e.s(["parseExperienceUniverseIdFromRouter", 0, e => {
        if (!e.pathname.includes("/creations/experiences/")) return i.uninitializedUniverseId;
        let t = e.query.id;
        if ("string" != typeof t) return i.uninitializedUniverseId;
        let r = Number.parseInt(t, 10);
        return !Number.isFinite(r) || r <= 0 ? i.uninitializedUniverseId : r
    }], 466386)
}, 650040, 318727, 413311, e => {
    "use strict";
    var t = e.i(379843),
        r = e.i(731197);

    function n(e) {
        return e.tiles
    }

    function i(e) {
        return e.columnCount
    }
    e.s(["getChartRowColumnCount", 0, i, "getChartRowTiles", 0, n, "halfWidthRow", 0, function(e) {
        return {
            tiles: [e],
            columnCount: 2
        }
    }, "singleTileRow", 0, function(e) {
        return {
            tiles: [e],
            columnCount: 1
        }
    }, "twoTileRow", 0, function(e, t) {
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
            let n = (t = e.children.map(o)).length > 0 && t.every(e => null !== e) ? t.filter(e => null !== e) : null;
            if (n) return function(e, t) {
                if (0 === e.length) return [];
                let n = 1 === t ? 1 : r.MAX_TILES_PER_ROW;
                if (1 === n) return e.map(e => ({
                    columnCount: n,
                    tiles: [e]
                }));
                let i = [];
                for (let t = 0; t < e.length; t += r.MAX_TILES_PER_ROW) i.push({
                    columnCount: n,
                    tiles: e.slice(t, t + r.MAX_TILES_PER_ROW)
                });
                return i
            }(n, "Grid" === e.type ? 1 === e.columnCount ? 1 : r.MAX_TILES_PER_ROW : n.length > 1 ? r.MAX_TILES_PER_ROW : 1);
            return s(e.children)
        })
    }
    e.s(["getEmptyChartSlotTarget", 0, e => {
        if (!(null == e ? void 0 : e.startsWith(a))) return null;
        let t = Number.parseInt(e.slice(a.length), 10);
        return Number.isInteger(t) && t >= 0 ? {
            rowIndex: t
        } : null
    }, "selectChartPlacements", 0, function(e) {
        let t = [],
            r = 0;
        return e.forEach((e, o) => {
            let s = n(e),
                u = i(e),
                c = 1 === u ? 2 : 1;
            (s.forEach((e, n) => {
                t.push({
                    kind: "tile",
                    tileId: e.tileId,
                    tile: e,
                    rowIndex: o,
                    itemIndex: n,
                    order: r,
                    columnSpan: c
                }), r += 1
            }), !(u <= s.length)) && (t.push({
                kind: "empty-slot",
                emptySlotId: "".concat(a).concat(o),
                rowIndex: o,
                order: r,
                columnSpan: 1
            }), r += 1)
        }), t
    }, "selectChartRowsFromLayoutNodes", 0, s], 413311);
    let u = [];

    function c(e) {
        return e.page.surface
    }

    function l(e, r) {
        return {
            ...e,
            page: {
                mode: t.DashboardPageMode.Untabbed,
                surface: r
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

    function g(e) {
        return c(e).bodyNodes.flatMap(e => {
            if (y(e) && ("Flex" === e.type || "Grid" === e.type)) return e.children.map(m).filter(e => null !== e);
            let t = m(e);
            return t ? [t] : []
        })
    }
    e.s(["getChartRows", 0, function(e) {
        return s(c(e).bodyNodes.filter(e => !y(e)))
    }, "getDashboardSurface", 0, c, "getSummaryCards", 0, g, "withChartRows", 0, function(e, t) {
        let r = c(e),
            n = g(e);
        return l(e, {
            ...r,
            bodyNodes: [...n.length > 0 ? [f(n)] : u, ...t.map(p)]
        })
    }, "withDashboardSurface", 0, l, "withSummaryCards", 0, function(e, t) {
        let r = c(e);
        return l(e, {
            ...r,
            bodyNodes: [...t.length > 0 ? [f(t)] : u, ...c(e).bodyNodes.filter(e => !y(e) && null === m(e))]
        })
    }], 650040)
}, 479236, 322172, e => {
    "use strict";
    var t = e.i(221628),
        r = e.i(999061),
        n = e.i(416340),
        i = e.i(589624),
        a = e.i(795621),
        o = e.i(500758),
        s = e.i(118413),
        u = e.i(257969),
        c = e.i(731197),
        l = e.i(283561),
        d = e.i(964956),
        h = e.i(258576),
        f = e.i(466386),
        p = e.i(721281),
        m = e.i(650040),
        y = e.i(379843),
        g = e.i(296150),
        v = e.i(743209),
        b = e.i(436025),
        A = e.i(593431),
        D = e.i(582078),
        C = e.i(852209),
        w = e.i(482922),
        T = e.i(31611),
        E = e.i(531007),
        S = e.i(11517),
        I = e.i(405005),
        R = e.i(302610),
        _ = e.i(787202),
        V = e.i(646877);
    let O = y.READABLE_BACKEND_DOCUMENT_SCHEMA_VERSIONS,
        U = {
            [E.ChartType.Spline]: 1,
            [E.ChartType.Area]: 2,
            [E.ChartType.DurationSpline]: 7,
            [E.ChartType.DurationArea]: 8,
            [E.ChartType.Bar]: 3,
            [E.ChartType.Column]: 4,
            [E.ChartType.Pie]: 5,
            [E.ChartType.Table]: 6
        },
        N = {
            DASHBOARD_CHART_TYPE_SPLINE: E.ChartType.Spline,
            DASHBOARD_CHART_TYPE_AREA: E.ChartType.Area,
            DASHBOARD_CHART_TYPE_DURATION_SPLINE: E.ChartType.DurationSpline,
            DASHBOARD_CHART_TYPE_DURATION_AREA: E.ChartType.DurationArea,
            DASHBOARD_CHART_TYPE_BAR: E.ChartType.Bar,
            DASHBOARD_CHART_TYPE_COLUMN: E.ChartType.Column,
            DASHBOARD_CHART_TYPE_PIE: E.ChartType.Pie,
            DASHBOARD_CHART_TYPE_TABLE: E.ChartType.Table,
            1: E.ChartType.Spline,
            2: E.ChartType.Area,
            7: E.ChartType.DurationSpline,
            8: E.ChartType.DurationArea,
            3: E.ChartType.Bar,
            4: E.ChartType.Column,
            5: E.ChartType.Pie,
            6: E.ChartType.Table
        },
        P = {
            Cumulative: 1,
            Minute: 2,
            HalfHour: 3,
            Hour: 4,
            Day: 5,
            Week: 6
        },
        M = {
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
        x = {
            [T.RAQIV2MetricGranularity.None]: 1,
            [T.RAQIV2MetricGranularity.OneMinute]: 2,
            [T.RAQIV2MetricGranularity.HalfHour]: 3,
            [T.RAQIV2MetricGranularity.OneHour]: 4,
            [T.RAQIV2MetricGranularity.OneDay]: 5,
            [T.RAQIV2MetricGranularity.OneWeek]: 6
        },
        B = {
            DASHBOARD_GRANULARITY_CUMULATIVE: T.RAQIV2MetricGranularity.None,
            DASHBOARD_GRANULARITY_MINUTE: T.RAQIV2MetricGranularity.OneMinute,
            DASHBOARD_GRANULARITY_HALF_HOUR: T.RAQIV2MetricGranularity.HalfHour,
            DASHBOARD_GRANULARITY_HOUR: T.RAQIV2MetricGranularity.OneHour,
            DASHBOARD_GRANULARITY_DAY: T.RAQIV2MetricGranularity.OneDay,
            DASHBOARD_GRANULARITY_WEEK: T.RAQIV2MetricGranularity.OneWeek,
            1: T.RAQIV2MetricGranularity.None,
            2: T.RAQIV2MetricGranularity.OneMinute,
            3: T.RAQIV2MetricGranularity.HalfHour,
            4: T.RAQIV2MetricGranularity.OneHour,
            5: T.RAQIV2MetricGranularity.OneDay,
            6: T.RAQIV2MetricGranularity.OneWeek
        },
        k = {
            [T.RAQIV2AggregationType.Sum]: 1,
            [T.RAQIV2AggregationType.Count]: 2,
            [T.RAQIV2AggregationType.Average]: 3,
            [T.RAQIV2AggregationType.Min]: 4,
            [T.RAQIV2AggregationType.Max]: 5,
            [T.RAQIV2AggregationType.CountUser]: 7,
            [T.RAQIV2AggregationType.AveragePerUser]: 25,
            [T.RAQIV2PercentileType.AVG]: 10,
            [T.RAQIV2PercentileType.P10]: 11,
            [T.RAQIV2PercentileType.P50]: 12,
            [T.RAQIV2PercentileType.P90]: 13,
            [y.CustomDashboardSummaryCardAggregation.Total]: 20,
            [y.CustomDashboardSummaryCardAggregation.AverageOverTimePeriod]: 21,
            [y.CustomDashboardSummaryCardAggregation.MostRecentDataPoint]: 22,
            [y.CustomDashboardSummaryCardAggregation.Median]: 23,
            [y.CustomDashboardSummaryCardAggregation.Cumulative]: 24,
            [y.CustomDashboardSummaryCardAggregation.AveragePerUniqueUser]: 25
        },
        L = {
            DASHBOARD_AGGREGATION_SUM: T.RAQIV2AggregationType.Sum,
            DASHBOARD_AGGREGATION_COUNT: T.RAQIV2AggregationType.Count,
            DASHBOARD_AGGREGATION_AVERAGE: T.RAQIV2AggregationType.Average,
            DASHBOARD_AGGREGATION_MIN: T.RAQIV2AggregationType.Min,
            DASHBOARD_AGGREGATION_MAX: T.RAQIV2AggregationType.Max,
            DASHBOARD_AGGREGATION_DISTINCT_COUNT: T.RAQIV2AggregationType.CountUser,
            DASHBOARD_AGGREGATION_UNIQUE_COUNT: T.RAQIV2AggregationType.CountUser,
            DASHBOARD_AGGREGATION_PERCENTILE_AVG: T.RAQIV2PercentileType.AVG,
            DASHBOARD_AGGREGATION_PERCENTILE_P10: T.RAQIV2PercentileType.P10,
            DASHBOARD_AGGREGATION_PERCENTILE_P50: T.RAQIV2PercentileType.P50,
            DASHBOARD_AGGREGATION_PERCENTILE_P90: T.RAQIV2PercentileType.P90,
            DASHBOARD_AGGREGATION_TOTAL: y.CustomDashboardSummaryCardAggregation.Total,
            DASHBOARD_AGGREGATION_AVERAGE_OVER_TIME_PERIOD: y.CustomDashboardSummaryCardAggregation.AverageOverTimePeriod,
            DASHBOARD_AGGREGATION_MOST_RECENT_DATA_POINT: y.CustomDashboardSummaryCardAggregation.MostRecentDataPoint,
            DASHBOARD_AGGREGATION_MEDIAN: y.CustomDashboardSummaryCardAggregation.Median,
            DASHBOARD_AGGREGATION_CUMULATIVE: y.CustomDashboardSummaryCardAggregation.Cumulative,
            DASHBOARD_AGGREGATION_AVERAGE_PER_UNIQUE_USER: T.RAQIV2AggregationType.AveragePerUser,
            1: T.RAQIV2AggregationType.Sum,
            2: T.RAQIV2AggregationType.Count,
            3: T.RAQIV2AggregationType.Average,
            4: T.RAQIV2AggregationType.Min,
            5: T.RAQIV2AggregationType.Max,
            6: T.RAQIV2AggregationType.CountUser,
            7: T.RAQIV2AggregationType.CountUser,
            10: T.RAQIV2PercentileType.AVG,
            11: T.RAQIV2PercentileType.P10,
            12: T.RAQIV2PercentileType.P50,
            13: T.RAQIV2PercentileType.P90,
            20: y.CustomDashboardSummaryCardAggregation.Total,
            21: y.CustomDashboardSummaryCardAggregation.AverageOverTimePeriod,
            22: y.CustomDashboardSummaryCardAggregation.MostRecentDataPoint,
            23: y.CustomDashboardSummaryCardAggregation.Median,
            24: y.CustomDashboardSummaryCardAggregation.Cumulative,
            25: T.RAQIV2AggregationType.AveragePerUser
        },
        Q = {
            [y.SummaryCardTitleSource.Auto]: 1,
            [y.SummaryCardTitleSource.Custom]: 2
        },
        G = {
            DASHBOARD_TITLE_SOURCE_AUTO: y.SummaryCardTitleSource.Auto,
            DASHBOARD_TITLE_SOURCE_CUSTOM: y.SummaryCardTitleSource.Custom,
            1: y.SummaryCardTitleSource.Auto,
            2: y.SummaryCardTitleSource.Custom
        },
        H = {
            none: 1,
            weekly: 2
        },
        F = {
            DASHBOARD_CHART_SMOOTHING_NONE: "none",
            DASHBOARD_CHART_SMOOTHING_WEEKLY: "weekly",
            1: "none",
            2: "weekly"
        };

    function K(e) {
        return "object" == typeof e && null !== e && !Array.isArray(e)
    }

    function j(e) {
        return String(e)
    }

    function z(e) {
        throw new l.CustomDashboardValidationError("backendContract", e)
    }

    function Y(e, t, r) {
        let n = t[j(e)];
        return void 0 === n && z("Unsupported ".concat(r, " value ").concat(String(e), ".")), n
    }

    function W(e, t, r) {
        let n = t[j(e)];
        return void 0 === n && z("Unsupported backend ".concat(r, " value ").concat(String(e), ".")), n
    }

    function q(e) {
        let t = new Date(e).toISOString();
        return Number.isNaN(Date.parse(t)) && z("Timestamp is outside the supported RFC3339 range."), t
    }

    function X(e, t) {
        if ("string" == typeof e) {
            let r = Date.parse(e);
            return Number.isFinite(r) || z("".concat(t, " is not a valid timestamp.")), r
        }
        if (K(e)) {
            var r, n;
            let i = Number(null != (r = e.seconds) ? r : 0),
                a = Number(null != (n = e.nanos) ? n : 0);
            return Number.isFinite(i) && Number.isFinite(a) || z("".concat(t, " is not a valid timestamp.")), 1e3 * i + Math.floor(a / 1e6)
        }
        return z("".concat(t, " is not a valid timestamp."))
    }

    function $(e) {
        return e.map(e => ({
            dimensionKey: e.dimension,
            values: [...e.values]
        }))
    }

    function J(e, t) {
        return null == e ? [] : (Array.isArray(e) || z("".concat(t, " must be an array.")), e.map((e, r) => {
            var n, i;
            K(e) || z("".concat(t, "[").concat(r, "] must be an object."));
            let a = null != (n = null != (i = e.dimensionKey) ? i : e.dimension_key) ? n : e.dimension;
            ("string" != typeof a || 0 === a.length) && z("".concat(t, "[").concat(r, "].dimensionKey must be a non-empty string."));
            let {
                values: o
            } = e;
            return Array.isArray(o) && o.every(e => "string" == typeof e) || z("".concat(t, "[").concat(r, "].values must be an array of strings.")), {
                dimension: a,
                values: o
            }
        }))
    }

    function Z(e, t, r) {
        if (null != e) return Array.isArray(e) && e.every(e => "string" == typeof e) || z("".concat(t, " must be an array of strings.")), e.map((e, n) => r(e) ? e : z("".concat(t, "[").concat(n, "] is unsupported.")))
    }

    function ee(e, t) {
        var r;
        return (r = e.dimension) !== T.RAQIV2Dimension.CustomEventName && (0, V.isCanonicalRAQIV2Dimension)(r) ? {
            dimension: e.dimension,
            values: [...e.values]
        } : z("".concat(t, " contains an unsupported dimension."))
    }

    function et(e) {
        if (e && 0 !== e.length) return e.map(e => {
            let {
                pseudoDimensionKey: t,
                variantKey: r
            } = e, n = t === T.RAQIV2UIPseudoDimension.AggregationType ? T.RAQIV2UIPseudoDimension.AggregationType : t === T.RAQIV2UIPseudoDimension.PercentileType ? T.RAQIV2UIPseudoDimension.PercentileType : z("Unsupported metric variant dimension ".concat(t, "."));
            return {
                pseudoDimensionKey: n,
                variantKey: (0, I.getStableVariantKey)(n, r)
            }
        })
    }

    function er(e, t) {
        if (Array.isArray(e) && 0 !== e.length) return e.map((e, r) => {
            var n, i;
            let a, o, {
                    pseudoDimensionKey: s,
                    variantKey: u
                } = (K(e) || z("variantSelections[".concat(r, "] must be an object.")), a = null != (n = e.pseudoDimensionKey) ? n : e.pseudo_dimension_key, o = null != (i = e.variantKey) ? i : e.variant_key, ("string" != typeof a || "string" != typeof o) && z("variantSelections[".concat(r, "] is missing keys.")), {
                    pseudoDimensionKey: a,
                    variantKey: o
                }),
                c = s === T.RAQIV2UIPseudoDimension.AggregationType,
                l = s === T.RAQIV2UIPseudoDimension.PercentileType,
                d = c ? Object.values(T.RAQIV2AggregationType).find(e => (0, I.getStableVariantKey)(T.RAQIV2UIPseudoDimension.AggregationType, e) === u) : l ? Object.values(T.RAQIV2PercentileType).find(e => (0, I.getStableVariantKey)(T.RAQIV2UIPseudoDimension.PercentileType, e) === u) : void 0;
            return 3 === t && (c || l) && !d && z("Unsupported ".concat(c ? "aggregation" : "percentile", " variant ").concat(u, ".")), {
                pseudoDimensionKey: s,
                variantKey: null != d ? d : u
            }
        })
    }

    function en(e) {
        if (!e || 0 === e.length) return;
        let t = null,
            r = null,
            n = T.RAQIV2UIPseudoDimension.AggregationType,
            i = T.RAQIV2UIPseudoDimension.PercentileType;
        for (let a of e) a.pseudoDimensionKey === n && ((0, V.isRAQIV2AggregationType)(a.variantKey) || z("Unsupported aggregation variant ".concat(a.variantKey, ".")), t = a.variantKey), a.pseudoDimensionKey === i && ((0, V.isRAQIV2PercentileType)(a.variantKey) || z("Unsupported percentile variant ".concat(a.variantKey, ".")), r = a.variantKey);
        if (null !== t || null !== r) return {
            aggregationType: t,
            percentile: r
        }
    }

    function ei(e) {
        let t = et(e.variantSelections);
        if (e.computedMetric) {
            var r;
            return {
                computedMetric: {
                    sources: (r = e.computedMetric).sources.map(e => {
                        let t = e.metric,
                            r = function(e) {
                                if (!e) return;
                                let t = [];
                                return e.aggregationType && t.push({
                                    pseudoDimensionKey: T.RAQIV2UIPseudoDimension.AggregationType,
                                    variantKey: e.aggregationType
                                }), e.percentile && t.push({
                                    pseudoDimensionKey: T.RAQIV2UIPseudoDimension.PercentileType,
                                    variantKey: e.percentile
                                }), t.length > 0 ? t : void 0
                            }(e.pseudoDimensionValues),
                            n = e.filters ? $(e.filters) : void 0;
                        if ((0, S.isCustomEventsAtomicMetricLike)(t)) {
                            let i = et([...t.aggregationType ? [{
                                pseudoDimensionKey: T.RAQIV2UIPseudoDimension.AggregationType,
                                variantKey: t.aggregationType
                            }] : [], ...(null != r ? r : []).filter(e => e.pseudoDimensionKey !== T.RAQIV2UIPseudoDimension.AggregationType)]);
                            return {
                                sourceKey: e.key,
                                metricKey: t.metric,
                                filters: [{
                                    dimensionKey: T.RAQIV2Dimension.CustomEventName,
                                    values: [t.customEventName]
                                }, ...null != n ? n : []],
                                ...i ? {
                                    variantSelections: i
                                } : {}
                            }
                        }
                        let i = et(r);
                        return {
                            sourceKey: e.key,
                            metricKey: t,
                            ...n ? {
                                filters: n
                            } : {},
                            ...i ? {
                                variantSelections: i
                            } : {}
                        }
                    }),
                    formula: r.formula,
                    ...void 0 !== r.name ? {
                        displayName: r.name
                    } : {},
                    ...void 0 !== r.l7Smoothing ? {
                        l7Smoothing: r.l7Smoothing
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

    function ea(e, t, r) {
        var n, i, a;
        K(e) || z("".concat(t, " must be an object."));
        let o = er(null != (n = e.variantSelections) ? n : e.variant_selections, r),
            s = null != (i = e.computedMetric) ? i : e.computed_metric;
        if (void 0 !== s) return {
            computedMetric: function(e, t, r) {
                K(e) || z("".concat(t, " must be an object."));
                let {
                    sources: n,
                    formula: i,
                    displayName: a,
                    l7Smoothing: o
                } = e;
                Array.isArray(n) && 0 !== n.length && "string" == typeof i || z("".concat(t, " is not a valid computed metric."));
                let [s, ...u] = n.map((e, n) => {
                    var i, a, o, s, u, c, l, d, h;
                    let f, p, m;
                    K(e) || z("".concat(t, ".sources[").concat(n, "] must be an object."));
                    let y = null != (i = null != (a = e.sourceKey) ? a : e.source_key) ? i : e.key;
                    ("string" != typeof y || 0 === y.length) && z("".concat(t, ".sources[").concat(n, "].sourceKey must be set."));
                    let g = void 0 === e.filters ? void 0 : J(e.filters, "".concat(t, ".sources[").concat(n, "].filters")),
                        v = er(null != (o = e.variantSelections) ? o : e.variant_selections, r),
                        b = e.metric,
                        A = null != (s = e.metricKey) ? s : e.metric_key;
                    if (void 0 !== b && void 0 !== A && z("".concat(t, ".sources[").concat(n, "] must not contain both metric and metricKey representations.")), void 0 !== A)
                        if ("string" != typeof A && z("".concat(t, ".sources[").concat(n, "].metricKey must be a string.")), A === T.RAQIV2UIMetric.CustomEventsV2) {
                            let e = null != (u = null == g ? void 0 : g.filter(e => e.dimension === T.RAQIV2Dimension.CustomEventName)) ? u : [],
                                r = e[0],
                                i = null == r ? void 0 : r.values[0];
                            (1 !== e.length || (null == r ? void 0 : r.values.length) !== 1 || "string" != typeof i || 0 === i.trim().length) && z("".concat(t, ".sources[").concat(n, "] must contain exactly one non-empty ") + "".concat(T.RAQIV2Dimension.CustomEventName, " filter for a canonical custom event."));
                            let a = null != (c = null == v ? void 0 : v.filter(e => e.pseudoDimensionKey === T.RAQIV2UIPseudoDimension.AggregationType)) ? c : [];
                            a.length > 1 && z("".concat(t, ".sources[").concat(n, "] must not contain multiple ") + "".concat(T.RAQIV2UIPseudoDimension.AggregationType, " selections for a canonical custom event."));
                            let o = a[0],
                                s = null == o ? void 0 : o.variantKey;
                            void 0 === s || (0, V.isRAQIV2AggregationType)(s) || z("".concat(t, ".sources[").concat(n, "] has an invalid custom-event aggregation.")), f = {
                                metric: T.RAQIV2UIMetric.CustomEventsV2,
                                customEventName: i,
                                ...void 0 !== s ? {
                                    aggregationType: s
                                } : {}
                            }, p = null == g ? void 0 : g.filter(e => e.dimension !== T.RAQIV2Dimension.CustomEventName).map(e => ee(e, "".concat(t, ".sources[").concat(n, "].filters"))), m = en(null == v ? void 0 : v.filter(e => e.pseudoDimensionKey !== T.RAQIV2UIPseudoDimension.AggregationType))
                        } else(0, V.isMetricKey)(A) || z("".concat(t, ".sources[").concat(n, "].metricKey is unsupported.")), f = A, p = null == g ? void 0 : g.map(e => ee(e, "".concat(t, ".sources[").concat(n, "].filters"))), m = en(v);
                    else {
                        K(b) || z("".concat(t, ".sources[").concat(n, "] must contain either metric or metricKey."));
                        let e = null != (l = b.customEventMetric) ? l : b.custom_event_metric;
                        if (K(e)) {
                            let r, i = null != (d = e.customEventName) ? d : e.custom_event_name;
                            ("string" != typeof i || 0 === i.trim().length) && z("".concat(t, ".sources[").concat(n, "].metric.customEventMetric is invalid.")), f = {
                                metric: T.RAQIV2UIMetric.CustomEventsV2,
                                customEventName: i,
                                ...void 0 !== e.aggregation ? {
                                    aggregationType: (r = W(e.aggregation, L, "aggregation"), (0, V.isRAQIV2AggregationType)(r) ? r : z("Unsupported custom-event aggregation ".concat(r, ".")))
                                } : {}
                            }
                        } else {
                            let e = null != (h = b.metricKey) ? h : b.metric_key;
                            "string" != typeof e && z("".concat(t, ".sources[").concat(n, "].metric.metricKey must be set.")), (0, V.isMetricKey)(e) || z("".concat(t, ".sources[").concat(n, "].metric.metricKey is unsupported.")), f = e
                        }
                        p = null == g ? void 0 : g.map(e => ee(e, "".concat(t, ".sources[").concat(n, "].filters"))), m = en(K(e) ? null == v ? void 0 : v.filter(e => e.pseudoDimensionKey !== T.RAQIV2UIPseudoDimension.AggregationType) : v)
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
                return s || z("".concat(t, ".sources must be non-empty.")), {
                    sources: [s, ...u],
                    formula: i,
                    ..."string" == typeof a ? {
                        name: a
                    } : {},
                    ..."boolean" == typeof o ? {
                        l7Smoothing: o
                    } : {}
                }
            }(s, "".concat(t, ".computedMetric"), r),
            variantSelections: o
        };
        let u = null != (a = e.metricKey) ? a : e.metric_key;
        return ("string" != typeof u || 0 === u.length) && z("".concat(t, ".metricKey must be set.")), {
            metricKey: (0, V.isMetricKey)(u) ? u : z("".concat(t, ".metricKey is not a supported numeric metric.")),
            variantSelections: o
        }
    }

    function eo(e, t) {
        var r, n, i, a, o, s, u, c, l;
        let d;
        if (null == e) return {};
        K(e) || z("".concat(t, " must be an object."));
        let h = K(e.granularity) ? null != (r = e.granularity.fixed) ? r : e.granularity : void 0,
            f = K(h) ? h.granularity : void 0,
            p = void 0 === f ? void 0 : B[j(f)],
            m = null != (n = e.annotationOptions) ? n : e.annotation_options,
            y = K(m) ? (d = null != (c = Z(null != (l = m.defaultAnnotationTypeKeys) ? l : m.default_annotation_type_keys, "".concat(t, ".annotationOptions.defaultAnnotationTypeKeys"), V.isDefaultAnnotationType)) ? c : [], {
                supportedAnnotationTypes: (0, R.resolveCustomDashboardSupportedAnnotationTypes)(d),
                defaultAnnotationTypes: d,
                showAnnotationsControl: "boolean" == typeof m.showAnnotationsControl ? m.showAnnotationsControl : "boolean" != typeof m.show_annotations_control || m.show_annotations_control
            }) : void 0,
            g = null != (i = e.defaultFilters) ? i : e.default_filters,
            v = void 0 === g ? void 0 : J(g, "".concat(t, ".defaultFilters")),
            b = Z(null != (a = e.filterDimensionKeys) ? a : e.filter_dimension_keys, "".concat(t, ".filterDimensionKeys"), V.isCanonicalRAQIV2Dimension),
            A = Z(null != (o = e.breakdownDimensionKeys) ? o : e.breakdown_dimension_keys, "".concat(t, ".breakdownDimensionKeys"), V.isCanonicalRAQIV2Dimension),
            D = Z(null != (s = e.defaultBreakdownDimensionKeys) ? s : e.default_breakdown_dimension_keys, "".concat(t, ".defaultBreakdownDimensionKeys"), V.isDefaultBreakdownDimension);
        return {
            timeRangeOptions: function(e, t) {
                var r, n;
                if (null == e) return;
                if (K(e) || z("".concat(t, " must be an object.")), void 0 !== e.none) return {
                    type: "None"
                };
                let i = null != (r = e.dateRange) ? r : e.date_range;
                if (void 0 !== i) return K(i) || z("".concat(t, ".dateRange must be an object.")), {
                    type: "DateRange",
                    defaultSelection: function(e, t) {
                        var r, n, i, a;
                        if (null == e) return;
                        K(e) || z("".concat(t, " must be an object."));
                        let o = null != (r = e.relativeRangeKey) ? r : e.relative_range_key;
                        if ("string" == typeof o) return (0, V.isDateRangeType)(o) || z("".concat(t, ".relativeRangeKey is unsupported.")), {
                            type: "Relative",
                            rangeType: o
                        };
                        let s = null != (n = e.customRange) ? n : e.custom_range;
                        if (K(s)) return {
                            type: "Custom",
                            startTimeMs: X(null != (i = s.startTime) ? i : s.start_time, "".concat(t, ".customRange.startTime")),
                            endTimeMs: X(null != (a = s.endTime) ? a : s.end_time, "".concat(t, ".customRange.endTime"))
                        }
                    }(null != (n = i.defaultSelection) ? n : i.default_selection, "".concat(t, ".dateRange.defaultSelection"))
                }
            }(null != (u = e.timeRangeOptions) ? u : e.time_range_options, "".concat(t, ".timeRangeOptions")),
            filterDimensions: b,
            defaultFilters: v,
            breakdownDimensions: A,
            defaultBreakdown: D,
            defaultGranularity: p,
            annotationOptions: y
        }
    }

    function es(e) {
        return {
            metric: ei(e.metric),
            seriesKey: e.seriesKey,
            ...e.filters ? {
                filters: $(e.filters)
            } : {},
            ...e.aggregation ? {
                aggregation: Y(e.aggregation, k, "aggregation")
            } : {}
        }
    }

    function eu(e, t, r) {
        var n, i, a, o;
        K(e) || z("".concat(t, " must be an object."));
        let s = null != (n = e.summaryCard) ? n : e.summary_card;
        if (void 0 !== s) {
            let e, n;
            return {
                type: "Component",
                component: {
                    type: "SummaryCard",
                    summaryCard: (i = "".concat(t, ".summaryCard"), K(s) || z("".concat(i, " must be an object.")), ("string" != typeof(e = null != (a = s.tileId) ? a : s.tile_id) || 0 === e.length) && z("".concat(i, ".tileId must be set.")), n = null != (o = s.titleSource) ? o : s.title_source, {
                        type: "SummaryCard",
                        tileId: e,
                        ..."string" == typeof s.title ? {
                            title: s.title
                        } : {},
                        metric: ea(s.metric, "".concat(i, ".metric"), r),
                        aggregation: W(s.aggregation, L, "aggregation"),
                        filters: J(s.filters, "".concat(i, ".filters")),
                        ...void 0 !== n ? {
                            titleSource: W(n, G, "titleSource")
                        } : {}
                    })
                }
            }
        }
        let u = e.chart;
        return void 0 !== u ? {
            type: "Component",
            component: {
                type: "Chart",
                chart: function(e, t, r) {
                    var n, i, a, o, s;
                    let u, c;
                    K(e) || z("".concat(t, " must be an object."));
                    let l = null != (n = e.tileId) ? n : e.tile_id;
                    ("string" != typeof l || 0 === l.length) && z("".concat(t, ".tileId must be set."));
                    let d = null != (i = e.dataSpec) ? i : e.data_spec,
                        h = null != (a = e.chartSpec) ? a : e.chart_spec;
                    K(d) && K(h) || z("".concat(t, " must include dataSpec and chartSpec.")), Array.isArray(d.metrics) || z("".concat(t, ".dataSpec.metrics must be an array."));
                    let f = W(null != (o = h.chartType) ? o : h.chart_type, N, "chartType"),
                        p = d.granularity,
                        m = h.smoothing;
                    if (void 0 !== d.aggregation) {
                        let e = W(d.aggregation, L, "aggregation");
                        (0, V.isChartAggregation)(e) || z("Unsupported chart aggregation ".concat(e, ".")), u = e
                    }
                    let g = null != (s = d.breakdownDimensionKeys) ? s : d.breakdown_dimension_keys;
                    Array.isArray(g) && (g.every(e => "string" == typeof e) || z("".concat(t, ".dataSpec.breakdownDimensionKeys must contain strings.")), c = g);
                    let v = void 0 !== p ? W(p, M, "granularity") : y.DEFAULT_CHART_GRANULARITY;
                    return {
                        type: "Chart",
                        tileId: l,
                        ..."string" == typeof e.title ? {
                            title: e.title
                        } : {},
                        dataSpec: {
                            metrics: d.metrics.map((e, n) => {
                                var i, a;
                                let o, s;
                                return i = "".concat(t, ".dataSpec.metrics[").concat(n, "]"), K(e) || z("".concat(i, " must be an object.")), ("string" != typeof(o = null != (a = e.seriesKey) ? a : e.series_key) || 0 === o.length) && z("".concat(i, ".seriesKey must be set.")), {
                                    metric: ea(e.metric, "".concat(i, ".metric"), r),
                                    seriesKey: o,
                                    ...void 0 === e.filters ? {} : {
                                        filters: J(e.filters, "".concat(i, ".filters"))
                                    },
                                    ...void 0 !== e.aggregation ? {
                                        aggregation: (s = W(e.aggregation, L, "aggregation"), (0, V.isChartAggregation)(s) ? s : z("Unsupported chart aggregation ".concat(s, ".")))
                                    } : {}
                                }
                            }),
                            ...void 0 !== u ? {
                                aggregation: u
                            } : {},
                            ...void 0 !== c ? {
                                breakdownDimensions: c
                            } : {},
                            granularity: v,
                            filters: J(d.filters, "".concat(t, ".dataSpec.filters"))
                        },
                        chartSpec: {
                            chartType: f,
                            overlays: function(e) {
                                var t, r, n, i;
                                if (!K(e)) return;
                                let a = {
                                    ..."boolean" == typeof e.genreBenchmark || "boolean" == typeof e.genre_benchmark ? {
                                        genreBenchmark: !!(null != (t = e.genreBenchmark) ? t : e.genre_benchmark)
                                    } : {},
                                    ..."boolean" == typeof e.similarExperienceBenchmark || "boolean" == typeof e.similar_experience_benchmark ? {
                                        similarExperienceBenchmark: !!(null != (r = e.similarExperienceBenchmark) ? r : e.similar_experience_benchmark)
                                    } : {},
                                    ..."boolean" == typeof e.topExperienceBenchmark || "boolean" == typeof e.top_experience_benchmark ? {
                                        topExperienceBenchmark: !!(null != (n = e.topExperienceBenchmark) ? n : e.top_experience_benchmark)
                                    } : {},
                                    ..."boolean" == typeof e.previousPeriod || "boolean" == typeof e.previous_period ? {
                                        previousPeriod: !!(null != (i = e.previousPeriod) ? i : e.previous_period)
                                    } : {},
                                    ..."boolean" == typeof e.quota ? {
                                        quota: e.quota
                                    } : {}
                                };
                                return Object.keys(a).length > 0 ? a : void 0
                            }(h.overlays),
                            ...void 0 !== m ? {
                                smoothing: W(m, F, "smoothing")
                            } : {}
                        }
                    }
                }(u, "".concat(t, ".chart"), r)
            }
        } : z("".concat(t, " must set chart or summaryCard."))
    }

    function ec(e) {
        switch (e.type) {
            case "Component":
                var t, r, n, i, a, o;
                let s, u, c;
                return {
                    component: "SummaryCard" === (t = e.component).type ? {
                        summaryCard: {
                            tileId: (r = t.summaryCard).tileId,
                            ...void 0 !== r.title ? {
                                title: r.title
                            } : {},
                            metric: ei(r.metric),
                            aggregation: Y(r.aggregation, k, "aggregation"),
                            filters: $(r.filters),
                            titleSource: Y(null != (n = r.titleSource) ? n : y.SummaryCardTitleSource.Auto, Q, "titleSource")
                        }
                    } : {
                        chart: (s = function(e) {
                            if (!e) return;
                            let t = {};
                            return void 0 !== e.genreBenchmark && (t.genreBenchmark = e.genreBenchmark), void 0 !== e.similarExperienceBenchmark && (t.similarExperienceBenchmark = e.similarExperienceBenchmark), void 0 !== e.topExperienceBenchmark && (t.topExperienceBenchmark = e.topExperienceBenchmark), void 0 !== e.previousPeriod && ("boolean" != typeof e.previousPeriod && z("Backend v1 cannot persist configured previous-period comparison offsets."), t.previousPeriod = e.previousPeriod), void 0 !== e.quota && (t.quota = e.quota), Object.keys(t).length > 0 ? t : void 0
                        }((i = t.chart).chartSpec.overlays), u = null == (o = i.dataSpec.metrics[0]) ? void 0 : o.metric, c = null != (a = i.dataSpec.aggregation) ? a : void 0 !== u ? (0, _.resolveDefaultChartAggregation)(u) : T.RAQIV2AggregationType.Average, {
                            tileId: i.tileId,
                            ...void 0 !== i.title ? {
                                title: i.title
                            } : {},
                            dataSpec: {
                                metrics: i.dataSpec.metrics.map(es),
                                aggregation: Y(c, k, "aggregation"),
                                ...i.dataSpec.breakdownDimensions ? {
                                    breakdownDimensionKeys: [...i.dataSpec.breakdownDimensions]
                                } : {},
                                granularity: Y(i.dataSpec.granularity, P, "granularity"),
                                filters: $(i.dataSpec.filters)
                            },
                            chartSpec: {
                                chartType: Y(i.chartSpec.chartType, U, "chartType"),
                                ...s ? {
                                    overlays: s
                                } : {},
                                ...i.chartSpec.smoothing ? {
                                    smoothing: Y(i.chartSpec.smoothing, H, "smoothing")
                                } : {}
                            }
                        })
                    }
                };
            case "Stack":
                return {
                    stack: {
                        children: e.children.map(ec)
                    }
                };
            case "Flex":
                return {
                    flex: {
                        children: e.children.map(ec)
                    }
                };
            case "Grid":
                return {
                    grid: {
                        columnCount: e.columnCount,
                        children: e.children.map(ec)
                    }
                };
            default:
                return z("Unsupported layout node ".concat(JSON.stringify(e), "."))
        }
    }

    function el(e, t, r) {
        var n, i;
        if (K(e) || z("".concat(t, " must be an object.")), "string" == typeof e.type) {
            if ("Component" === e.type) return eu(e.component, "".concat(t, ".component"), r);
            if ("Stack" === e.type || "Flex" === e.type) return Array.isArray(e.children) || z("".concat(t, ".children must be an array.")), {
                type: e.type,
                children: e.children.map((e, n) => el(e, "".concat(t, ".children[").concat(n, "]"), r))
            };
            if ("Grid" === e.type) {
                Array.isArray(e.children) || z("".concat(t, ".children must be an array."));
                let i = null != (n = e.columnCount) ? n : e.column_count;
                return 1 !== i && 2 !== i && z("".concat(t, ".columnCount must be 1 or 2.")), {
                    type: "Grid",
                    columnCount: i,
                    children: e.children.map((e, n) => el(e, "".concat(t, ".children[").concat(n, "]"), r))
                }
            }
        }
        if (void 0 !== e.component) return eu(e.component, "".concat(t, ".component"), r);
        if (void 0 !== e.stack) return K(e.stack) && Array.isArray(e.stack.children) || z("".concat(t, ".stack.children must be an array.")), {
            type: "Stack",
            children: e.stack.children.map((e, n) => el(e, "".concat(t, ".stack.children[").concat(n, "]"), r))
        };
        if (void 0 !== e.flex) return K(e.flex) && Array.isArray(e.flex.children) || z("".concat(t, ".flex.children must be an array.")), {
            type: "Flex",
            children: e.flex.children.map((e, n) => el(e, "".concat(t, ".flex.children[").concat(n, "]"), r))
        };
        if (void 0 !== e.grid) {
            K(e.grid) && Array.isArray(e.grid.children) || z("".concat(t, ".grid.children must be an array."));
            let n = null != (i = e.grid.columnCount) ? i : e.grid.column_count;
            return 1 !== n && 2 !== n && z("".concat(t, ".grid.columnCount must be 1 or 2.")), {
                type: "Grid",
                columnCount: n,
                children: e.grid.children.map((e, n) => el(e, "".concat(t, ".grid.children[").concat(n, "]"), r))
            }
        }
        return z("".concat(t, " must set component, stack, flex, or grid."))
    }

    function ed(e) {
        var t, r;
        let n;
        return {
            schemaVersion: y.BACKEND_DOCUMENT_WRITE_SCHEMA_VERSION,
            config: {
                page: ((t = e.page).mode !== y.DashboardPageMode.Untabbed && z("Only untabbed dashboard pages can be serialized to the backend."), {
                    untabbed: {
                        surface: {
                            resourceTypeKeys: [1],
                            controls: (n = (r = t.surface.controls).defaultGranularity ? x[r.defaultGranularity] : void 0, {
                                ...r.timeRangeOptions ? {
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
                                                            startTime: q(t.startTimeMs),
                                                            endTime: q(t.endTimeMs)
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        return {
                                            dateRange: {}
                                        }
                                    }(r.timeRangeOptions)
                                } : {},
                                ...r.filterDimensions ? {
                                    filterDimensionKeys: [...r.filterDimensions]
                                } : {},
                                ...r.defaultFilters ? {
                                    defaultFilters: $(r.defaultFilters)
                                } : {},
                                ...r.breakdownDimensions ? {
                                    breakdownDimensionKeys: [...r.breakdownDimensions]
                                } : {},
                                ...r.defaultBreakdown ? {
                                    defaultBreakdownDimensionKeys: [...r.defaultBreakdown]
                                } : {},
                                ...void 0 !== n ? {
                                    granularity: {
                                        fixed: {
                                            granularity: n
                                        }
                                    }
                                } : {},
                                ...r.annotationOptions ? {
                                    annotationOptions: {
                                        defaultAnnotationTypeKeys: [...r.annotationOptions.defaultAnnotationTypes],
                                        showAnnotationsControl: r.annotationOptions.showAnnotationsControl
                                    }
                                } : {}
                            }),
                            bodyNodes: t.surface.bodyNodes.map(ec)
                        }
                    }
                })
            }
        }
    }

    function eh(e) {
        var t;
        K(e) || z("Backend custom dashboard document is missing config.");
        let r = K(e) ? null != (t = e.schemaVersion) ? t : e.schema_version : void 0;
        return "number" == typeof r && O.includes(r) || z("Unsupported backend custom dashboard schema version ".concat(String(r), ".")), K(e.config) || z("Backend custom dashboard document is missing config."), K(e.config.page) || z("config.page must be an object."), (0, V.validateCustomDashboardConfig)({
            page: function(e, t, r) {
                var n, i, a;
                if (K(e) || z("".concat(t, " must be an object.")), e.mode === y.DashboardPageMode.Untabbed) {
                    let n = e.surface;
                    K(n) || z("".concat(t, ".surface must be an object."));
                    let i = null != (a = n.bodyNodes) ? a : n.body_nodes;
                    return Array.isArray(i) || z("".concat(t, ".surface.bodyNodes must be an array.")), {
                        mode: y.DashboardPageMode.Untabbed,
                        surface: {
                            controls: eo(n.controls, "".concat(t, ".surface.controls")),
                            bodyNodes: i.map((e, n) => el(e, "".concat(t, ".surface.bodyNodes[").concat(n, "]"), r))
                        }
                    }
                }
                let o = e.untabbed;
                K(o) || z("".concat(t, ".untabbed must be an object."));
                let s = o.surface;
                K(s) || z("".concat(t, ".untabbed.surface must be an object."));
                let u = null != (n = null != (i = s.bodyNodes) ? i : s.body_nodes) ? n : [];
                return Array.isArray(u) || z("".concat(t, ".untabbed.surface.bodyNodes must be an array.")), {
                    mode: y.DashboardPageMode.Untabbed,
                    surface: {
                        controls: eo(s.controls, "".concat(t, ".untabbed.surface.controls")),
                        bodyNodes: u.map((e, n) => el(e, "".concat(t, ".untabbed.surface.bodyNodes[").concat(n, "]"), r))
                    }
                }
            }(e.config.page, "config.page", r)
        }, {
            limits: null
        })
    }

    function ef(e) {
        if ("string" == typeof e) return e;
        if (!("object" == typeof e && null !== e && !Array.isArray(e))) return;
        let {
            seconds: t
        } = e;
        if ("number" == typeof t || "string" == typeof t) {
            let r = "number" == typeof t ? t : Number(t),
                n = e.nanos,
                i = "number" == typeof n ? n : "string" == typeof n ? Number(n) : 0;
            if (Number.isFinite(r) && Number.isFinite(i)) return new Date(1e3 * r + Math.floor(i / 1e6)).toISOString()
        }
    }

    function ep(e) {
        let t = "number" == typeof e ? e : "string" == typeof e && e.trim().length > 0 ? Number(e) : NaN;
        return Number.isSafeInteger(t) && t > 0 ? t : void 0
    }

    function em(e) {
        var t;
        return null != (t = e.dashboardId) ? t : ""
    }

    function ey(e) {
        var t, r, n, i, a, o, s;
        let u, c, l = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : y.EMPTY_DASHBOARD_CONFIG,
            d = em(e),
            h = null != (t = ep(e.universeId)) ? t : 0,
            f = null != (r = ef(e.createdTime)) ? r : new Date(0).toISOString(),
            p = null != (n = ef(e.updatedTime)) ? n : f,
            m = ef(e.publishedTime),
            g = !0 === e.isPinned,
            v = e.createdBy,
            b = e.updatedBy,
            A = ep(null == v ? void 0 : v.userId),
            D = ep(null == b ? void 0 : b.userId);
        return (0, V.validateCustomDashboardDocument)({
            id: d,
            schemaVersion: y.LOCAL_STORAGE_DOCUMENT_SCHEMA_VERSION,
            universeId: h,
            name: (0, V.validateDashboardName)(null != (i = e.name) ? i : "", null),
            description: (0, V.validateDashboardDescription)(null != (a = e.description) ? a : void 0, null),
            status: (u = (o = e).latestPublishedDocumentId, c = null != (s = o.latestPublishedVersion) ? s : 0, u || c > 0 ? "published" : "draft"),
            isPinned: g,
            pinnedAt: g ? ef(e.pinnedTime) : void 0,
            createdAt: f,
            updatedAt: p,
            publishedAt: m,
            createdByUserId: null != A ? A : 0,
            createdByUsername: "",
            ...void 0 !== D ? {
                updatedByUserId: D
            } : {},
            config: l
        })
    }

    function eg(e) {
        var t;
        if (!e.metadata) throw Error("Custom dashboard API response is missing metadata.");
        return ey(e.metadata, (t = e.document) ? eh(t) : y.EMPTY_DASHBOARD_CONFIG)
    }

    function ev(e, t) {
        return "".concat(e, ":").concat(t)
    }
    let eb = class {
        async list(e, t) {
            return this.withApiErrors(e, void 0, async () => {
                var r, n;
                this.ensureAvailable();
                let i = t ? await this.client.listDashboards(e, t) : await this.listAllDashboards(e),
                    a = (null != (r = i.dashboards) ? r : []).map(t => (this.rememberMetadata(e, t), ey(t)));
                return {
                    items: (0, A.sortDashboardsForList)(a),
                    migrationFailedCount: 0,
                    nextPageToken: t && null != (n = i.nextPageToken) ? n : void 0,
                    capabilities: void 0 === i.capabilities ? void 0 : (0, u.parseDashboardCapabilities)(i.capabilities)
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
                return (0, u.parseDashboardCapabilities)(t)
            })
        }
        async get(e, t) {
            return this.withApiErrors(e, t, async () => (this.ensureAvailable(), this.read(e, t)))
        }
        async read(e, t) {
            let r = await this.client.getDashboard({
                universeId: e,
                dashboardId: t
            });
            return this.rememberMetadata(e, r.metadata), eg(r)
        }
        async getVersion(e, t) {
            return this.withApiErrors(e, t, async () => {
                var r, n;
                this.ensureAvailable();
                let i = this.tokens.get(ev(e, t));
                return i ? i.revision : (await this.read(e, t), null != (r = null == (n = this.tokens.get(ev(e, t))) ? void 0 : n.revision) ? r : null)
            })
        }
        async create(e) {
            return this.withApiErrors(e.universeId, void 0, async () => {
                var t;
                this.ensureAvailable();
                let r = null != (t = e.config) ? t : y.EMPTY_DASHBOARD_CONFIG,
                    n = await this.client.createDashboard({
                        universeId: e.universeId,
                        name: e.name,
                        description: e.description,
                        document: ed(r)
                    });
                this.rememberMetadata(e.universeId, n.metadata);
                let i = eg(n);
                return this.emit({
                    universeId: e.universeId,
                    dashboardId: i.id,
                    eventType: "create"
                }), i
            })
        }
        async update(e, t, r, n) {
            return this.withApiErrors(e, t, async () => {
                let i;
                this.ensureAvailable();
                let a = {};
                void 0 !== r.name && (a.name = r.name), void 0 !== r.description && (a.description = r.description);
                let {
                    config: o
                } = r, s = void 0 !== a.name || void 0 !== a.description, u = void 0 !== o;
                if (!s && !u) return this.read(e, t);
                let c = await this.ensureTokens(e, t),
                    l = null == n ? void 0 : n.expectedVersion;
                if (void 0 !== o) {
                    let r = await this.client.publishDashboard({
                        universeId: e,
                        dashboardId: t,
                        expectedHeadEtag: this.requireHeadEtag(c, t, l),
                        document: ed(o),
                        ...s ? {
                            metadataPatch: a
                        } : {}
                    });
                    this.rememberMetadata(e, r.metadata), i = eg(r)
                } else if (s) {
                    let r = await this.client.updateDashboardMetadata({
                        universeId: e,
                        dashboardId: t,
                        expectedHeadEtag: this.requireHeadEtag(c, t, l),
                        patch: a
                    });
                    this.rememberMetadata(e, r)
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
            } catch (r) {
                try {
                    let r = await this.read(e.universeId, t.id);
                    if ("published" === r.status) return r;
                    await this.delete(e.universeId, t.id)
                } catch (e) {
                    console.warn("ApiCustomDashboardService createAndPublish: could not confirm publish status; leftover draft may exist", {
                        dashboardId: t.id,
                        publishError: r,
                        confirmError: e
                    })
                }
                throw r
            }
        }
        async addChartTile(e, t, r, n) {
            return this.withApiErrors(e, t, async () => {
                this.ensureAvailable();
                let i = await this.read(e, t),
                    {
                        config: a,
                        tile: o
                    } = (0, g.addChartTileToConfig)({
                        config: i.config,
                        tile: r.tile,
                        nextTileId: (0, b.createTileId)(),
                        limits: r.limits
                    }),
                    s = await this.ensureTokens(e, t),
                    u = await this.client.publishDashboard({
                        universeId: e,
                        dashboardId: t,
                        expectedHeadEtag: this.requireHeadEtag(s, t, null == n ? void 0 : n.expectedVersion),
                        document: ed(a)
                    });
                this.rememberMetadata(e, u.metadata);
                let c = eg(u);
                return this.emit({
                    universeId: e,
                    dashboardId: t,
                    eventType: "add-chart-tile"
                }), {
                    document: c,
                    tile: o
                }
            })
        }
        async delete(e, t) {
            return this.withApiErrors(e, t, async () => {
                this.ensureAvailable(), await this.client.deleteDashboard({
                    universeId: e,
                    dashboardId: t
                }), this.tokens.delete(ev(e, t)), this.emit({
                    universeId: e,
                    dashboardId: t,
                    eventType: "delete"
                })
            })
        }
        async duplicate(e, t, r) {
            return this.withApiErrors(e, t, async () => {
                var r;
                let n, i;
                this.ensureAvailable();
                let [a, o] = await Promise.all([this.read(e, t), this.list(e)]), s = this.dedupeName(a.name, o.items.map(e => e.name)), u = await this.client.duplicateDashboard({
                    universeId: e,
                    dashboardId: t,
                    destinationUniverseId: e,
                    name: s
                });
                this.rememberMetadata(e, u.metadata);
                let c = eg(u),
                    l = (r = c.config, n = (0, m.getSummaryCards)(r).map(e => (0, v.cloneTileWithNewId)(e)), i = (0, m.getChartRows)(r).map(e => ({
                        ...e,
                        tiles: e.tiles.map(e => (0, v.cloneTileWithNewId)(e))
                    })), (0, m.withChartRows)((0, m.withSummaryCards)(r, n), i));
                if ("published" !== c.status) {
                    let t = {
                        ...c,
                        config: l
                    };
                    return this.emit({
                        universeId: e,
                        dashboardId: t.id,
                        eventType: "duplicate"
                    }), t
                }
                let d = await this.ensureTokens(e, c.id),
                    h = await this.client.publishDashboard({
                        universeId: e,
                        dashboardId: c.id,
                        expectedHeadEtag: this.requireHeadEtag(d, c.id),
                        document: ed(l)
                    });
                this.rememberMetadata(e, h.metadata);
                let f = eg(h);
                return this.emit({
                    universeId: e,
                    dashboardId: f.id,
                    eventType: "duplicate"
                }), f
            })
        }
        async publish(e, t, r) {
            return this.withApiErrors(e, t, async () => {
                this.ensureAvailable();
                let n = await this.read(e, t),
                    i = await this.ensureTokens(e, t),
                    a = await this.client.publishDashboard({
                        universeId: e,
                        dashboardId: t,
                        expectedHeadEtag: this.requireHeadEtag(i, t, null == r ? void 0 : r.expectedVersion),
                        document: ed(n.config)
                    });
                this.rememberMetadata(e, a.metadata);
                let o = eg(a);
                return this.emit({
                    universeId: e,
                    dashboardId: t,
                    eventType: "publish"
                }), o
            })
        }
        async unpublish(e, t) {
            return this.withApiErrors(e, t, async () => {
                throw this.ensureAvailable(), new l.CustomDashboardNotAvailableError
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
            return (0, D.suggestDefaultName)(t.items.map(e => e.name))
        }
        subscribe(e) {
            return this.ensureAvailable(), this.listeners.add(e), () => {
                this.listeners.delete(e)
            }
        }
        dispose() {
            this.disposed = !0, this.listeners.clear(), this.tokens.clear()
        }
        async updatePinned(e, t, r) {
            let n;
            this.ensureAvailable();
            for (let i = 0; i < 3; i += 1) try {
                return await this.withApiErrors(e, t, async () => {
                    this.ensureAvailable();
                    let n = await this.ensureTokens(e, t),
                        i = await this.client.updateDashboardMetadata({
                            universeId: e,
                            dashboardId: t,
                            expectedHeadEtag: this.requireHeadEtag(n, t),
                            patch: {
                                isPinned: r
                            }
                        });
                    return this.rememberMetadata(e, i), this.emit({
                        universeId: e,
                        dashboardId: t,
                        eventType: r ? "pin" : "unpin"
                    }), this.read(e, t)
                })
            } catch (e) {
                if (n = e, !(e instanceof l.CustomDashboardVersionConflictError) || 2 === i) throw e
            }
            throw n
        }
        async ensureTokens(e, t) {
            let r = this.tokens.get(ev(e, t));
            if (r) return r;
            await this.read(e, t);
            let n = this.tokens.get(ev(e, t));
            if (!n) throw new l.CustomDashboardVersionConflictError(t);
            return n
        }
        rememberMetadata(e, t) {
            var r, n;
            let i = t ? em(t) : "",
                a = ev(e, i),
                o = this.tokens.get(a),
                s = t && null != (n = t.headEtag) ? n : void 0,
                u = o && o.headEtag === s ? o.revision : (null != (r = null == o ? void 0 : o.revision) ? r : 0) + 1,
                c = new Map(null == o ? void 0 : o.headEtagsByRevision);
            s && c.set(u, s);
            let l = {
                headEtag: s,
                revision: u,
                headEtagsByRevision: c
            };
            return i && this.tokens.set(a, l), l
        }
        requireHeadEtag(e, t, r) {
            let n = void 0 === r ? e.headEtag : e.headEtagsByRevision.get(r);
            if (!n) throw new l.CustomDashboardVersionConflictError(t);
            return n
        }
        async refreshTokens(e, t) {
            try {
                let r = await this.client.getDashboard({
                    universeId: e,
                    dashboardId: t
                });
                this.rememberMetadata(e, r.metadata)
            } catch (e) {}
        }
        dedupeName(e, t) {
            let r = new Set(t.map(e => e.trim())),
                n = "".concat(e, " (copy)");
            return r.has(n) ? (0, D.findUnusedNumberedName)(t, t => "".concat(e, " (copy ").concat(t, ")"), D.DUPLICATE_COPY_NUMBERED_SUFFIX_START) : n
        }
        async listAllDashboards(e, t) {
            var r, n;
            let i = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : [],
                a = arguments.length > 3 ? arguments[3] : void 0,
                o = await this.client.listDashboards(e, t ? {
                    pageToken: t
                } : void 0),
                s = [...i, ...null != (r = o.dashboards) ? r : []],
                u = null != (n = o.nextPageToken) ? n : void 0,
                c = null != a ? a : o.capabilities;
            return u ? this.listAllDashboards(e, u, s, c) : {
                dashboards: s,
                ...void 0 === c ? {} : {
                    capabilities: c
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
            if (this.disposed) throw new l.CustomDashboardNotAvailableError
        }
        async withApiErrors(e, t, r) {
            try {
                return await r()
            } catch (n) {
                let r = (0, w.mapCustomDashboardsApiError)(n, t);
                throw r instanceof l.CustomDashboardVersionConflictError && void 0 !== e && t && await this.refreshTokens(e, t), r
            }
        }
        constructor(e = (0, C.createDefaultCustomDashboardsApiClient)()) {
            (0, p._)(this, "pagesOnServer", !0), (0, p._)(this, "client", void 0), (0, p._)(this, "listeners", new Set), (0, p._)(this, "tokens", new Map), (0, p._)(this, "disposed", !1), this.client = e
        }
    };

    function eA(e) {
        return e instanceof l.CustomDashboardNotFoundError
    }

    function eD(e) {
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

    function ew(e) {
        return {
            ...e,
            hybridOrigin: "server"
        }
    }
    let eT = class {
            async list(e, t) {
                var r;
                let [n, i] = await Promise.all([this.apiService.list(e, t), this.localService.list(e)]);
                return {
                    items: n.items.map(ew),
                    capabilities: null != (r = n.capabilities) ? r : u.DENIED_DASHBOARD_CAPABILITIES,
                    localItems: i.items.map(eC),
                    nextPageToken: n.nextPageToken,
                    migrationFailedCount: n.migrationFailedCount + i.migrationFailedCount
                }
            }
            listPinned(e) {
                return this.apiService.listPinned(e)
            }
            async getCapabilities(e) {
                var t, r, n;
                return null != (t = null == (r = (n = this.apiService).getCapabilities) ? void 0 : r.call(n, e)) ? t : u.DENIED_DASHBOARD_CAPABILITIES
            }
            async get(e, t) {
                try {
                    return eD(await this.localService.get(e, t))
                } catch (e) {
                    if (!eA(e)) throw e
                }
                return {
                    ...await this.apiService.get(e, t),
                    hybridOrigin: "server"
                }
            }
            async create(e) {
                return eD(await this.localService.create(e))
            }
            async createAndPublish(e) {
                return eD(await this.localService.createAndPublish(e))
            }
            async update(e, t, r, n) {
                return await this.ensureLocalDashboard(e, t), eD(await this.localService.update(e, t, r, n))
            }
            async addChartTile(e, t, r, n) {
                await this.ensureLocalDashboard(e, t);
                let i = await this.localService.addChartTile(e, t, r, n);
                return {
                    ...i,
                    document: eD(i.document)
                }
            }
            async delete(e, t) {
                await this.ensureLocalDashboard(e, t), await this.localService.delete(e, t)
            }
            async duplicate(e, t, r) {
                try {
                    return await this.ensureLocalDashboard(e, t), eD(await this.localService.duplicate(e, t, r))
                } catch (e) {
                    if (!eA(e) && !(e instanceof l.CustomDashboardNotAvailableError)) throw e
                }
                return this.forkApiDashboardToLocal(e, t, r)
            }
            async forkApiDashboardToLocal(e, t, r) {
                var n, i, a;
                let o, s, u, c, l = await this.apiService.get(e, t),
                    d = await this.localService.list(e);
                return eD(await this.localService.create({
                    universeId: e,
                    name: (n = d.items.map(e => e.name), i = l.name, o = (0, D.clipDashboardName)("".concat(i).concat(" (local copy)")), (s = new Set(Array.from(n, e => e.trim()))).has(o) ? (0, D.findUnusedNumberedName)(s, e => (0, D.clipDashboardName)("".concat(i, " (local copy ").concat(e, ")")), D.DUPLICATE_COPY_NUMBERED_SUFFIX_START) : o),
                    description: l.description,
                    createdByUserId: r.createdByUserId,
                    createdByUsername: r.createdByUsername,
                    config: (a = l.config, u = (0, m.getSummaryCards)(a).map(e => (0, v.cloneTileWithNewId)(e)), c = (0, m.getChartRows)(a).map(e => ({
                        ...e,
                        tiles: e.tiles.map(e => (0, v.cloneTileWithNewId)(e))
                    })), (0, m.withChartRows)((0, m.withSummaryCards)(a, u), c))
                }))
            }
            async publish(e, t, r) {
                return await this.ensureLocalDashboard(e, t), eD(await this.localService.publish(e, t, r))
            }
            async unpublish(e, t) {
                return await this.ensureLocalDashboard(e, t), eD(await this.localService.unpublish(e, t))
            }
            async pin(e, t) {
                return await this.ensureLocalDashboard(e, t), eD(await this.localService.pin(e, t))
            }
            async unpin(e, t) {
                return await this.ensureLocalDashboard(e, t), eD(await this.localService.unpin(e, t))
            }
            async suggestDefaultName(e) {
                return this.localService.suggestDefaultName(e)
            }
            async getVersion(e, t) {
                try {
                    await this.ensureLocalDashboard(e, t)
                } catch (e) {
                    if (e instanceof l.CustomDashboardNotAvailableError) return null;
                    throw e
                }
                return this.localService.getVersion(e, t)
            }
            subscribe(e) {
                let t = this.localService.subscribe(e),
                    r = this.apiService.subscribe(e);
                return () => {
                    t(), r()
                }
            }
            dispose() {
                var e, t, r, n;
                null == (e = (t = this.localService).dispose) || e.call(t), null == (r = (n = this.apiService).dispose) || r.call(n)
            }
            async ensureLocalDashboard(e, t) {
                try {
                    return eD(await this.localService.get(e, t))
                } catch (e) {
                    if (eA(e)) throw new l.CustomDashboardNotAvailableError;
                    throw e
                }
            }
            constructor(e) {
                (0, p._)(this, "pagesOnServer", !0), (0, p._)(this, "localService", void 0), (0, p._)(this, "apiService", void 0), this.localService = e.localService, this.apiService = e.apiService
            }
        },
        eE = {
            isoNow: () => new Date().toISOString()
        };
    var eS = e.i(730530),
        eI = e.i(881670);
    let eR = {
        first: "(copy)",
        numbered: e => "(copy ".concat(e, ")")
    };

    function e_(e, t) {
        let r = null == t ? void 0 : t.pageSize;
        if (void 0 === r || r <= 0) return {
            items: e
        };
        let n = function(e) {
                if (!e) return 0;
                let t = Number(e);
                return Number.isFinite(t) && t >= 0 ? Math.floor(t) : 0
            }(null == t ? void 0 : t.pageToken),
            i = n + r;
        return {
            items: e.slice(n, i),
            nextPageToken: i < e.length ? String(i) : void 0
        }
    }
    e.s(["createDuplicateDashboardNameSuffixes", 0, function(e) {
        return {
            first: e.tPendingTranslation("(copy)", "Suffix appended to a duplicated dashboard name when the first copy is free; a leading space is added when concatenating with the base name", (0, eS.translationKey)("Label.CustomDashboards.DuplicateName.FirstSuffix", eI.TranslationNamespace.Analytics)),
            numbered: t => e.tPendingTranslation("(copy {n})", "Suffix appended when a duplicate dashboard name collides; {n} is the disambiguation number (2, 3, …); a leading space is added when concatenating with the base name", (0, eS.translationKey)("Label.CustomDashboards.DuplicateName.NumberedSuffix", eI.TranslationNamespace.Analytics), {
                n: String(t)
            })
        }
    }, "testOnlyEnglishDuplicateDashboardNameSuffixes", 0, eR], 322172);
    let eV = class {
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
                var t, r;
                let n = null != (t = null == (r = this.peekUniverseMap(e)) ? void 0 : r.size) ? t : 0,
                    i = this.getLimits(e).maxDashboardsPerUniverse;
                if (n >= i) throw new l.CustomDashboardQuotaExceededError("Universe ".concat(e, " is at the per-universe cap of ").concat(i, " dashboards. Delete one to create another."))
            }
            assertUnderPinnedCap(e, t) {
                let r = this.peekUniverseMap(e);
                if (!r) return;
                let n = Array.from(r.values()).filter(e => e.document.isPinned && e.document.id !== t).length,
                    i = this.getLimits(e).maxPinnedDashboardsPerUniverse;
                if (n >= i) throw new l.CustomDashboardQuotaExceededError("Universe ".concat(e, " is at the pinned-dashboard cap of ").concat(i, ". Unpin one to pin another."))
            }
            loadOrThrow(e, t) {
                let r = this.peekUniverseMap(e),
                    n = null == r ? void 0 : r.get(t);
                if (!r || !n) throw new l.CustomDashboardNotFoundError(t);
                return {
                    universeMap: r,
                    record: n
                }
            }
            async applyMutation(e, t, r, n, i) {
                let {
                    universeMap: a,
                    record: o
                } = this.loadOrThrow(e, t);
                if ((null == i ? void 0 : i.expectedVersion) !== void 0 && i.expectedVersion !== o.version) throw new l.CustomDashboardVersionConflictError(t);
                let s = this.clock.isoNow(),
                    u = {
                        ...o.document,
                        ...n(s),
                        updatedAt: s
                    };
                return a.set(t, {
                    document: u,
                    version: o.version + 1
                }), this.emit({
                    universeId: e,
                    dashboardId: t,
                    eventType: r
                }), u
            }
            async applyUpdateMutation(e, t, r, n, i) {
                let {
                    universeMap: a,
                    record: o
                } = this.loadOrThrow(e, t);
                if ((null == i ? void 0 : i.expectedVersion) !== void 0 && i.expectedVersion !== o.version) throw new l.CustomDashboardVersionConflictError(t);
                let {
                    document: s,
                    result: u
                } = n(o, this.clock.isoNow());
                return a.set(t, {
                    document: s,
                    version: o.version + 1
                }), this.emit({
                    universeId: e,
                    dashboardId: t,
                    eventType: r
                }), u
            }
            async list(e, t) {
                let r = this.peekUniverseMap(e);
                return {
                    ...e_(r ? (0, A.sortDashboardsForList)([...r.values()].map(e => e.document)) : [], t),
                    migrationFailedCount: 0
                }
            }
            async listPinned(e) {
                let t = this.peekUniverseMap(e);
                return t ? (0, A.sortDashboardsForList)([...t.values()].map(e => e.document)).filter(e => e.isPinned).map(e => {
                    let {
                        id: t,
                        name: r
                    } = e;
                    return {
                        id: t,
                        name: r
                    }
                }) : []
            }
            async get(e, t) {
                return this.loadOrThrow(e, t).record.document
            }
            async getVersion(e, t) {
                var r, n, i;
                return null != (r = null == (i = this.peekUniverseMap(e)) || null == (n = i.get(t)) ? void 0 : n.version) ? r : null
            }
            insertNewDocument(e, t) {
                this.assertUnderUniverseCap(e.universeId);
                let r = this.getLimits(e.universeId),
                    n = (0, V.validateDashboardName)(e.name, r),
                    i = (0, V.validateDashboardDescription)(e.description, r),
                    a = void 0 !== e.config ? (0, V.validateCustomDashboardConfig)(e.config, {
                        limits: r
                    }) : y.EMPTY_DASHBOARD_CONFIG,
                    o = this.clock.isoNow(),
                    s = {
                        id: this.idFactory.nextDashboardId(),
                        schemaVersion: y.LOCAL_STORAGE_DOCUMENT_SCHEMA_VERSION,
                        universeId: e.universeId,
                        name: n,
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
            async update(e, t, r, n) {
                let {
                    universeMap: i,
                    record: a
                } = this.loadOrThrow(e, t), o = this.getLimits(e);
                if ((null == n ? void 0 : n.expectedVersion) !== void 0 && n.expectedVersion !== a.version) throw new l.CustomDashboardVersionConflictError(t);
                let s = void 0 !== r.name ? (0, V.validateDashboardName)(r.name, o) : a.document.name,
                    u = void 0 !== r.description ? (0, V.validateDashboardDescription)(r.description, o) : a.document.description,
                    c = void 0 !== r.config ? (0, V.validateCustomDashboardConfig)(r.config, {
                        limits: o
                    }) : a.document.config,
                    d = {
                        ...a.document,
                        name: s,
                        description: u,
                        config: c,
                        updatedAt: this.clock.isoNow(),
                        ...(null == n ? void 0 : n.actor) ? {
                            updatedByUserId: n.actor.userId,
                            updatedByUsername: n.actor.username
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
            async addChartTile(e, t, r, n) {
                return this.applyUpdateMutation(e, t, "add-chart-tile", (e, t) => {
                    let {
                        config: i,
                        tile: a
                    } = (0, g.addChartTileToConfig)({
                        config: e.document.config,
                        tile: r.tile,
                        nextTileId: this.idFactory.nextTileId(),
                        limits: r.limits
                    }), o = {
                        ...e.document,
                        config: i,
                        updatedAt: t,
                        ...(null == n ? void 0 : n.actor) ? {
                            updatedByUserId: n.actor.userId,
                            updatedByUsername: n.actor.username
                        } : {}
                    };
                    return {
                        document: o,
                        result: {
                            document: o,
                            tile: a
                        }
                    }
                }, n)
            }
            async delete(e, t) {
                let {
                    universeMap: r
                } = this.loadOrThrow(e, t);
                r.delete(t), this.emit({
                    universeId: e,
                    dashboardId: t,
                    eventType: "delete"
                })
            }
            async duplicate(e, t, r) {
                let n = this.loadOrThrow(e, t).record.document;
                this.assertUnderUniverseCap(e);
                let i = this.clock.isoNow(),
                    a = this.dedupeName(e, n.name),
                    o = () => this.idFactory.nextTileId(),
                    s = (0, m.getSummaryCards)(n.config).map(e => (0, v.cloneTileWithNewId)(e, o)),
                    u = (0, m.getChartRows)(n.config).map(e => ({
                        ...e,
                        tiles: e.tiles.map(e => (0, v.cloneTileWithNewId)(e, o))
                    })),
                    c = {
                        ...n,
                        id: this.idFactory.nextDashboardId(),
                        name: a,
                        status: "draft",
                        isPinned: !1,
                        pinnedAt: void 0,
                        publishedAt: void 0,
                        createdAt: i,
                        updatedAt: i,
                        createdByUserId: r.createdByUserId,
                        createdByUsername: r.createdByUsername,
                        updatedByUserId: r.createdByUserId,
                        updatedByUsername: r.createdByUsername,
                        config: (0, m.withChartRows)((0, m.withSummaryCards)(n.config, s), u)
                    };
                return this.getOrCreateUniverseMap(e).set(c.id, {
                    document: c,
                    version: 1
                }), this.emit({
                    universeId: e,
                    dashboardId: c.id,
                    eventType: "duplicate"
                }), c
            }
            async publish(e, t, r) {
                return this.applyMutation(e, t, "publish", e => ({
                    status: "published",
                    publishedAt: e
                }), r)
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
                return (0, D.suggestDefaultName)(t ? [...t.values()].map(e => e.document.name) : [])
            }
            subscribe(e) {
                return this.listeners.add(e), () => {
                    this.listeners.delete(e)
                }
            }
            dedupeName(e, t) {
                let r = this.peekUniverseMap(e),
                    n = r ? [...r.values()].map(e => e.document.name) : [];
                return (0, D.buildDuplicateDashboardName)(n, t, this.duplicateNameSuffixes)
            }
            constructor(e = {}) {
                var t, r, n, i, a;
                (0, p._)(this, "pagesOnServer", void 0), (0, p._)(this, "store", new Map), (0, p._)(this, "listeners", new Set), (0, p._)(this, "clock", void 0), (0, p._)(this, "idFactory", void 0), (0, p._)(this, "duplicateNameSuffixes", void 0), (0, p._)(this, "getLimits", void 0), this.getLimits = null != (t = e.getLimits) ? t : () => c.CONSERVATIVE_DASHBOARD_LIMITS, this.clock = null != (r = e.clock) ? r : eE, this.idFactory = null != (n = e.idFactory) ? n : b.defaultIdFactory, this.duplicateNameSuffixes = null != (i = e.duplicateNameSuffixes) ? i : eR, this.pagesOnServer = null != (a = e.pagesOnServer) && a
            }
        },
        eO = [{
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
                ...ed((0, V.validateCustomDashboardConfig)(e.config, {
                    limits: null
                }))
            })
        }];
    var eU = e.i(115232);
    let eN = "creator-hub:custom-dashboards:v1:universe:",
        eP = /^\d+$/;

    function eM(e) {
        return "".concat(eN).concat(e)
    }

    function ex(e, t, r) {
        let n = "".concat("creator-hub:custom-dashboards:v1:unreadable:universe:").concat(t);
        try {
            e.setItem(n, r)
        } catch (e) {}
        return {
            ok: !1,
            unreadableSidecarKey: n
        }
    }

    function eB(e, t, r, n) {
        let i = {};
        Object.entries(r).forEach(e => {
            let [t, r] = e;
            i[t] = {
                document: {
                    ...r.document,
                    ...ed(r.document.config)
                },
                version: r.version
            }
        }), Object.entries(n).forEach(e => {
            let [t, r] = e;
            t in i || (i[t] = r)
        });
        try {
            e.setItem(eM(t), JSON.stringify({
                records: i
            }))
        } catch (e) {
            if (function(e) {
                    if (!(0, eU.isRecord)(e)) return !1;
                    let t = e.code,
                        r = e.name;
                    return 22 === t || "QuotaExceededError" === r || "NS_ERROR_DOM_QUOTA_REACHED" === r
                }(e)) throw new l.CustomDashboardQuotaExceededError;
            if (e instanceof l.CustomDashboardStorageWriteError) throw e;
            throw new l.CustomDashboardStorageWriteError(e)
        }
    }

    function ek(e, t, r) {
        if (Object.keys(t).length >= r) throw new l.CustomDashboardQuotaExceededError("Universe ".concat(e, " is at the per-universe cap of ").concat(r, " dashboards. Delete one to create another."))
    }
    let eL = class {
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
                if (this.disposed) throw new l.CustomDashboardNotAvailableError;
                let e = function() {
                    try {
                        var e;
                        return null != (e = window.localStorage) ? e : null
                    } catch (e) {
                        return null
                    }
                }();
                if (!e) throw new l.CustomDashboardNotAvailableError;
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
                ek(e, t, this.getLimits(e).maxDashboardsPerUniverse)
            }
            readMaterialised(e) {
                var t, r, n;
                let i, a, o, s, u = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "throwOnUnreadable",
                    c = this.requireStorage(),
                    d = c.getItem(eM(e)),
                    h = this.materialisedByUniverse.get(e);
                if (h && h.rawString === d) return {
                    storage: c,
                    records: h.records,
                    quarantine: h.quarantine
                };
                let f = function(e, t, r) {
                    let n;
                    if (!r) return {
                        ok: !0,
                        bucket: {
                            records: {}
                        }
                    };
                    try {
                        n = JSON.parse(r)
                    } catch (n) {
                        return ex(e, t, r)
                    }
                    return (0, eU.isRecord)(n) && (0, eU.isRecord)(n.records) ? {
                        ok: !0,
                        bucket: {
                            records: n.records
                        }
                    } : ex(e, t, r)
                }(c, e, d);
                if (!f.ok) {
                    if (this.storageUnreadableByUniverse.set(e, f.unreadableSidecarKey), "throwOnUnreadable" === u) throw new l.CustomDashboardStorageUnreadableError(f.unreadableSidecarKey);
                    return {
                        storage: c,
                        records: {},
                        quarantine: {}
                    }
                }
                this.storageUnreadableByUniverse.delete(e);
                let {
                    records: p,
                    quarantine: m,
                    corrupted: g,
                    mutatedOnRead: v
                } = (t = f.bucket, i = {}, a = {}, o = [], s = !1, Object.entries(null != (r = t.records) ? r : {}).forEach(t => {
                    var r, n, u;
                    let [c, d] = t;
                    if (!d || "object" != typeof d) {
                        a[c] = {
                            version: 1,
                            migrationFailed: !0,
                            reason: "record was not an object",
                            raw: d
                        }, o.push({
                            id: c,
                            reason: "record was not an object",
                            code: "OTHER"
                        });
                        return
                    }
                    if (r = d, (0, eU.isRecord)(r) && !0 === r.migrationFailed) {
                        if (! function(e) {
                                if (!(0, eU.isRecord)(e.raw) || "number" != typeof e.raw.schemaVersion) return !1;
                                let {
                                    schemaVersion: t
                                } = e.raw;
                                if (t > y.LOCAL_STORAGE_DOCUMENT_SCHEMA_VERSION) return !1;
                                if ("NEWER" === e.code) return !0;
                                let r = /^Stored custom dashboard schema v(\d+) is newer than the client's v(\d+)\.$/.exec(e.reason);
                                return null !== r && Number(r[1]) === t && Number(r[2]) < t
                            }(d)) {
                            a[c] = d, o.push({
                                id: c,
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
                    if (n = d, !(0, eU.isRecord)(n) || "number" != typeof n.version || !("document" in n)) {
                        a[c] = {
                            version: 1,
                            migrationFailed: !0,
                            reason: "record was not a live persisted record",
                            raw: d
                        }, o.push({
                            id: c,
                            reason: "record was not a live persisted record",
                            code: "OTHER"
                        });
                        return
                    }
                    let {
                        document: h,
                        version: f
                    } = d, p = (0, eU.isRecord)(h) ? h : {}, m = "number" == typeof p.schemaVersion ? p.schemaVersion : void 0;
                    try {
                        let t = (u = {
                            schemaVersion: m,
                            ...p
                        }, function(e, t, r) {
                            let n = {
                                    ...e
                                },
                                i = "number" == typeof e.schemaVersion ? e.schemaVersion : 0;
                            if (i > r) throw new l.CustomDashboardUnsupportedSchemaError(i, r);
                            let a = i,
                                o = t.length + 1,
                                s = 0;
                            for (; a < r && s < o;) {
                                let e = a,
                                    i = t.find(t => t.fromVersion === e);
                                if (!i) throw new l.CustomDashboardMigrationGapError(e, r);
                                let o = i.migrate(n),
                                    u = o.schemaVersion;
                                if ("number" == typeof u && u !== e && u !== i.toVersion) throw new l.CustomDashboardMigrationGapError(e, r, "Migration step ".concat(e, " → ").concat(i.toVersion, " produced schemaVersion ").concat(u, "."));
                                n = {
                                    ...o,
                                    schemaVersion: i.toVersion
                                }, a = i.toVersion, s += 1
                            }
                            if (a !== r) throw new l.CustomDashboardMigrationGapError(a, r, "Migration pipeline did not converge after ".concat(s, " steps (stopped at version ").concat(a, ")."));
                            return {
                                ...n,
                                schemaVersion: r
                            }
                        }(u, eO, y.LOCAL_STORAGE_DOCUMENT_SCHEMA_VERSION));
                        m !== t.schemaVersion && (s = !0);
                        let r = (0, V.validateCustomDashboardDocument)({
                            ...t,
                            universeId: e,
                            config: eh(t)
                        });
                        if (r.id !== c) {
                            let e = 'bucket key "'.concat(c, '" does not match document.id "').concat(r.id, '"');
                            a[c] = {
                                version: "number" == typeof f ? f : 1,
                                migrationFailed: !0,
                                reason: e,
                                raw: h
                            }, o.push({
                                id: c,
                                reason: e,
                                code: "OTHER"
                            }), s = !0;
                            return
                        }
                        i[r.id] = {
                            document: r,
                            version: "number" == typeof f ? f : 1
                        }
                    } catch (r) {
                        let e = r instanceof l.CustomDashboardUnsupportedSchemaError,
                            t = r instanceof Error ? r.message : String(r);
                        a[c] = {
                            version: "number" == typeof f ? f : 1,
                            migrationFailed: !0,
                            reason: t,
                            code: e ? "NEWER" : "OTHER",
                            raw: h
                        }, o.push({
                            id: c,
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
                if (this.corruptedByUniverse.set(e, g), v) try {
                    eB(c, e, p, m);
                    let t = c.getItem(eM(e));
                    this.materialisedByUniverse.set(e, {
                        rawString: t,
                        records: p,
                        quarantine: m
                    })
                } catch (e) {
                    null == (n = this.onPersistError) || n.call(this, e)
                } else this.materialisedByUniverse.set(e, {
                    rawString: d,
                    records: p,
                    quarantine: m
                });
                return {
                    storage: c,
                    records: p,
                    quarantine: m
                }
            }
            async list(e, t) {
                var r, n;
                let {
                    records: i
                } = this.readMaterialised(e), a = (0, A.sortDashboardsForList)(Object.values(i).map(e => e.document)), o = null != (r = null == (n = this.corruptedByUniverse.get(e)) ? void 0 : n.length) ? r : 0;
                return {
                    ...e_(a, t),
                    migrationFailedCount: o
                }
            }
            async listPinned(e) {
                let {
                    records: t
                } = this.readMaterialised(e);
                return (0, A.sortDashboardsForList)(Object.values(t).map(e => e.document)).filter(e => e.isPinned).map(e => {
                    let {
                        id: t,
                        name: r
                    } = e;
                    return {
                        id: t,
                        name: r
                    }
                })
            }
            async get(e, t) {
                let {
                    records: r
                } = this.readMaterialised(e), n = r[t];
                if (!n) throw new l.CustomDashboardNotFoundError(t);
                return n.document
            }
            async getVersion(e, t) {
                var r, n;
                let {
                    records: i
                } = this.readMaterialised(e);
                return null != (r = null == (n = i[t]) ? void 0 : n.version) ? r : null
            }
            commit(e, t) {
                let {
                    storage: r,
                    records: n,
                    quarantine: i
                } = this.readMaterialised(e), {
                    next: a,
                    result: o
                } = t(n, i);
                eB(r, e, a, i);
                let s = r.getItem(eM(e));
                return this.materialisedByUniverse.set(e, {
                    rawString: s,
                    records: a,
                    quarantine: i
                }), o
            }
            insertNewDocument(e, t) {
                this.assertUnderUniverseCap(e.universeId);
                let r = this.getLimits(e.universeId),
                    n = (0, V.validateDashboardName)(e.name, r),
                    i = (0, V.validateDashboardDescription)(e.description, r),
                    a = void 0 !== e.config ? (0, V.validateCustomDashboardConfig)(e.config, {
                        limits: r
                    }) : y.EMPTY_DASHBOARD_CONFIG,
                    o = this.clock.isoNow(),
                    s = {
                        id: this.idFactory.nextDashboardId(),
                        schemaVersion: y.LOCAL_STORAGE_DOCUMENT_SCHEMA_VERSION,
                        universeId: e.universeId,
                        name: n,
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
                return this.commit(e.universeId, t => (ek(e.universeId, t, r.maxDashboardsPerUniverse), {
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
            async update(e, t, r, n) {
                let i = this.getLimits(e),
                    a = {};
                return void 0 !== r.name && (a.name = (0, V.validateDashboardName)(r.name, i)), void 0 !== r.description && (a.description = (0, V.validateDashboardDescription)(r.description, i)), void 0 !== r.config && (a.config = (0, V.validateCustomDashboardConfig)(r.config, {
                    limits: i
                })), this.applyMutation(e, t, "update", () => ({
                    ...a,
                    ...(null == n ? void 0 : n.actor) ? {
                        updatedByUserId: n.actor.userId,
                        updatedByUsername: n.actor.username
                    } : {}
                }), {
                    expectedVersion: null == n ? void 0 : n.expectedVersion
                })
            }
            async addChartTile(e, t, r, n) {
                let i = this.commit(e, e => {
                    let i = e[t];
                    if (!i) throw new l.CustomDashboardNotFoundError(t);
                    if ((null == n ? void 0 : n.expectedVersion) !== void 0 && n.expectedVersion !== i.version) throw new l.CustomDashboardVersionConflictError(t);
                    let {
                        config: a,
                        tile: o
                    } = (0, g.addChartTileToConfig)({
                        config: i.document.config,
                        tile: r.tile,
                        nextTileId: this.idFactory.nextTileId(),
                        limits: r.limits
                    }), s = this.clock.isoNow(), u = {
                        ...i.document,
                        config: a,
                        updatedAt: s,
                        ...(null == n ? void 0 : n.actor) ? {
                            updatedByUserId: n.actor.userId,
                            updatedByUsername: n.actor.username
                        } : {}
                    };
                    return {
                        next: {
                            ...e,
                            [t]: {
                                document: u,
                                version: i.version + 1
                            }
                        },
                        result: {
                            document: u,
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
                    if (!e[t]) throw new l.CustomDashboardNotFoundError(t);
                    let r = {
                        ...e
                    };
                    return delete r[t], {
                        next: r,
                        result: void 0
                    }
                }), this.emit({
                    universeId: e,
                    dashboardId: t,
                    eventType: "delete"
                })
            }
            async duplicate(e, t, r) {
                this.assertUnderUniverseCap(e);
                let n = this.commit(e, n => {
                    var i;
                    let a = null == (i = n[t]) ? void 0 : i.document;
                    if (!a) throw new l.CustomDashboardNotFoundError(t);
                    ek(e, n, this.getLimits(e).maxDashboardsPerUniverse);
                    let o = Object.values(n).map(e => e.document.name),
                        s = (0, D.buildDuplicateDashboardName)(o, a.name, this.duplicateNameSuffixes),
                        u = this.clock.isoNow(),
                        c = () => this.idFactory.nextTileId(),
                        d = (0, m.getSummaryCards)(a.config).map(e => (0, v.cloneTileWithNewId)(e, c)),
                        h = (0, m.getChartRows)(a.config).map(e => ({
                            ...e,
                            tiles: e.tiles.map(e => (0, v.cloneTileWithNewId)(e, c))
                        })),
                        f = {
                            ...a,
                            id: this.idFactory.nextDashboardId(),
                            name: s,
                            status: "draft",
                            isPinned: !1,
                            pinnedAt: void 0,
                            publishedAt: void 0,
                            createdAt: u,
                            updatedAt: u,
                            createdByUserId: r.createdByUserId,
                            createdByUsername: r.createdByUsername,
                            updatedByUserId: r.createdByUserId,
                            updatedByUsername: r.createdByUsername,
                            config: (0, m.withChartRows)((0, m.withSummaryCards)(a.config, d), h)
                        };
                    return {
                        next: {
                            ...n,
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
                    dashboardId: n.id,
                    eventType: "duplicate"
                }), n
            }
            async publish(e, t, r) {
                return this.applyMutation(e, t, "publish", e => ({
                    status: "published",
                    publishedAt: e
                }), r)
            }
            async unpublish(e, t) {
                return this.applyMutation(e, t, "unpublish", () => ({
                    status: "draft"
                }))
            }
            async pin(e, t) {
                let r = this.commit(e, r => {
                    let n = r[t];
                    if (!n) throw new l.CustomDashboardNotFoundError(t);
                    var i = this.getLimits(e).maxPinnedDashboardsPerUniverse;
                    if (Object.values(r).filter(e => e.document.isPinned && e.document.id !== t).length >= i) throw new l.CustomDashboardQuotaExceededError("Universe ".concat(e, " is at the pinned-dashboard cap of ").concat(i, ". Unpin one to pin another."));
                    let a = this.clock.isoNow(),
                        o = {
                            ...n.document,
                            isPinned: !0,
                            pinnedAt: a,
                            updatedAt: a
                        };
                    return {
                        next: {
                            ...r,
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
                    eventType: "pin"
                }), r
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
                return (0, D.suggestDefaultName)(Object.values(t).map(e => e.document.name))
            }
            subscribe(e) {
                return this.disposed ? () => void 0 : (this.ensureStorageListener(), this.listeners.add(e), () => {
                    this.listeners.delete(e)
                })
            }
            async applyMutation(e, t, r, n, i) {
                let a = this.commit(e, e => {
                    let r = e[t];
                    if (!r) throw new l.CustomDashboardNotFoundError(t);
                    if ((null == i ? void 0 : i.expectedVersion) !== void 0 && i.expectedVersion !== r.version) throw new l.CustomDashboardVersionConflictError(t);
                    let a = this.clock.isoNow(),
                        o = {
                            ...r.document,
                            ...n(a),
                            updatedAt: a
                        };
                    return {
                        next: {
                            ...e,
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
                    eventType: r
                }), a
            }
            constructor(e = {}) {
                var t, r, n, i;
                (0, p._)(this, "listeners", new Set), (0, p._)(this, "storageListenerAttached", !1), (0, p._)(this, "disposed", !1), (0, p._)(this, "corruptedByUniverse", new Map), (0, p._)(this, "storageUnreadableByUniverse", new Map), (0, p._)(this, "materialisedByUniverse", new Map), (0, p._)(this, "clock", void 0), (0, p._)(this, "idFactory", void 0), (0, p._)(this, "onPersistError", void 0), (0, p._)(this, "duplicateNameSuffixes", void 0), (0, p._)(this, "getLimits", void 0), (0, p._)(this, "handleStorageEvent", e => {
                    if (!e.key) return;
                    let t = function(e) {
                        if (!e.startsWith(eN)) return null;
                        let t = e.slice(eN.length);
                        if (!eP.test(t)) return null;
                        let r = Number(t);
                        return Number.isSafeInteger(r) ? r : null
                    }(e.key);
                    null !== t && (this.materialisedByUniverse.delete(t), this.emit({
                        universeId: t,
                        eventType: "external"
                    }))
                }), this.getLimits = null != (t = e.getLimits) ? t : () => c.CONSERVATIVE_DASHBOARD_LIMITS, this.clock = null != (r = e.clock) ? r : eE, this.onPersistError = e.onPersistError, this.idFactory = null != (n = e.idFactory) ? n : b.defaultIdFactory, this.duplicateNameSuffixes = null != (i = e.duplicateNameSuffixes) ? i : eR
            }
        },
        eQ = {
            canCreate: !1,
            canEdit: !1,
            canPublish: !1,
            canDelete: !1
        },
        eG = {
            actions: eQ,
            limits: (0, c.resolveEffectiveDashboardLimits)(u.DENIED_DASHBOARD_CAPABILITIES.limits),
            isResolved: !1
        },
        eH = {
            ...eG,
            isResolved: !0
        },
        eF = {
            ...eH,
            actions: {
                canCreate: !0,
                canEdit: !0,
                canPublish: !0,
                canDelete: !0
            }
        },
        eK = {
            kind: "fixed",
            state: eG
        },
        ej = {
            list: async () => ({
                items: [],
                migrationFailedCount: 0
            }),
            listPinned: async () => [],
            async get() {
                throw new l.CustomDashboardNotAvailableError
            },
            async create() {
                throw new l.CustomDashboardNotAvailableError
            },
            async createAndPublish() {
                throw new l.CustomDashboardNotAvailableError
            },
            async update() {
                throw new l.CustomDashboardNotAvailableError
            },
            async addChartTile() {
                throw new l.CustomDashboardNotAvailableError
            },
            async delete() {
                throw new l.CustomDashboardNotAvailableError
            },
            async duplicate() {
                throw new l.CustomDashboardNotAvailableError
            },
            async publish() {
                throw new l.CustomDashboardNotAvailableError
            },
            async unpublish() {
                throw new l.CustomDashboardNotAvailableError
            },
            async pin() {
                throw new l.CustomDashboardNotAvailableError
            },
            async unpin() {
                throw new l.CustomDashboardNotAvailableError
            },
            async suggestDefaultName() {
                throw new l.CustomDashboardNotAvailableError
            },
            getVersion: async () => null,
            subscribe: () => () => void 0
        },
        ez = (0, n.createContext)(null),
        eY = (0, n.createContext)(!1);

    function eW(e, t) {
        var i, a, o;
        let s, u, l = (0, r.c)(9),
            d = (0, n.useContext)(eY),
            f = null != (i = null == e ? void 0 : e.capabilitySource) ? i : eK,
            p = "fixed" === f.kind ? null : f,
            m = "server" === f.kind && t && !d;
        l[0] !== m ? (s = {
            enabled: m
        }, l[0] = m, l[1] = s) : s = l[1];
        let {
            capabilities: y,
            isResolved: g,
            isError: v
        } = (0, h.useDashboardCapabilitiesQuery)(null != (a = null == p ? void 0 : p.universeId) ? a : 0, null != (o = null == e ? void 0 : e.backends.api) ? o : ej, s);
        return l[2] !== y || l[3] !== v || l[4] !== g || l[5] !== f.isBackendChosen || l[6] !== f.kind || l[7] !== f.state ? (u = "fixed" === f.kind ? f.state : "hybrid" === f.kind ? {
            ...eF,
            limits: (0, c.resolveHybridDashboardLimits)(g ? y : void 0)
        } : function(e, t) {
            let {
                capabilities: r,
                isResolved: n,
                isError: i
            } = e;
            return t ? i ? eH : {
                actions: {
                    canCreate: r.canCreate,
                    canEdit: r.canEdit,
                    canPublish: r.canPublish,
                    canDelete: r.canDelete
                },
                limits: (0, c.resolveEffectiveDashboardLimits)(r.limits),
                isResolved: n
            } : eG
        }({
            capabilities: y,
            isResolved: g,
            isError: v
        }, f.isBackendChosen), l[2] = y, l[3] = v, l[4] = g, l[5] = f.isBackendChosen, l[6] = f.kind, l[7] = f.state, l[8] = u) : u = l[8], u
    }
    e.s(["CustomDashboardCapabilitiesFromList", 0, e => {
        let n, i = (0, r.c)(2),
            {
                children: a
            } = e;
        return i[0] !== a ? (n = (0, t.jsx)(eY.Provider, {
            value: !0,
            children: a
        }), i[0] = a, i[1] = n) : n = i[1], n
    }, "CustomDashboardServiceProvider", 0, e => {
        let i, o, s, u, l, h = (0, r.c)(22),
            {
                service: f,
                canMutateDashboards: p,
                children: m
            } = e,
            y = (0, a.useQueryClient)();
        h[0] !== y ? (i = () => {
            let e, t, r;
            return e = new eb((0, C.createDefaultCustomDashboardsApiClient)()), t = null, r = e => (0, c.resolveHybridDashboardLimits)(y.getQueryData(d.customDashboardQueryKeys.capabilities(e))), {
                api: e,
                getHybrid: () => (null != t || (t = new eT({
                    apiService: e,
                    localService: function(e) {
                        try {
                            if (window.localStorage) return new eL({
                                getLimits: e
                            })
                        } catch (e) {}
                        return new eV({
                            getLimits: e
                        })
                    }(r)
                })), t),
                dispose: () => {
                    null == t || t.dispose(), e.dispose()
                }
            }
        }, h[0] = y, h[1] = i) : i = h[1];
        let [g] = (0, n.useState)(i);
        h[2] !== g.dispose ? (o = () => g.dispose, h[2] = g.dispose, h[3] = o) : o = h[3], h[4] !== g ? (s = [g], h[4] = g, h[5] = s) : s = h[5], (0, n.useEffect)(o, s);
        e: {
            let e, t, r, n;
            if (!f) {
                let e;
                h[6] !== g ? (e = {
                    service: ej,
                    isReady: !1,
                    capabilitySource: eK,
                    backends: g
                }, h[6] = g, h[7] = e) : e = h[7], u = e;
                break e
            }
            let i = void 0 === p || p ? eF : eH;h[8] !== i ? (e = {
                kind: "fixed",
                state: i
            }, h[8] = i, h[9] = e) : e = h[9],
            h[10] !== f ? (t = () => f, h[10] = f, h[11] = t) : t = h[11],
            h[12] !== f || h[13] !== t ? (r = {
                api: f,
                getHybrid: t
            }, h[12] = f, h[13] = t, h[14] = r) : r = h[14],
            h[15] !== f || h[16] !== e || h[17] !== r ? (n = {
                service: f,
                isReady: !0,
                capabilitySource: e,
                backends: r
            }, h[15] = f, h[16] = e, h[17] = r, h[18] = n) : n = h[18],
            u = n
        }
        let v = u;
        return h[19] !== m || h[20] !== v ? (l = (0, t.jsx)(ez.Provider, {
            value: v,
            children: m
        }), h[19] = m, h[20] = v, h[21] = l) : l = h[21], l
    }, "UniverseFlaggedCustomDashboardProvider", 0, e => {
        let a, u, c, l, d, p, m = (0, r.c)(26),
            {
                children: y
            } = e,
            g = (0, n.useContext)(ez);
        if (!g) throw Error("UniverseFlaggedCustomDashboardProvider must be used within CustomDashboardServiceProvider.");
        let v = (d = (0, r.c)(2), p = (0, i.useRouter)(), d[0] !== p ? (l = (0, f.parseExperienceUniverseIdFromRouter)(p), d[0] = p, d[1] = l) : l = d[1], l),
            b = Number.isFinite(v) && v > 0,
            {
                ready: A,
                value: D
            } = (0, o.useFlag)(s.isCustomDashboardsLocalStorageEnabled),
            C = A && D,
            {
                backends: w
            } = g;
        m[0] !== C ? (a = {
            enabled: C
        }, m[0] = C, m[1] = a) : a = m[1];
        let T = function(e) {
                let {
                    isFlagReady: t,
                    isHybridCandidate: r,
                    hasUniverse: n,
                    capabilitiesQuery: {
                        capabilities: i,
                        isResolved: a,
                        isError: o
                    }
                } = e;
                return t ? r ? !n || a || o ? !o && n && (i.canCreate || i.canEdit) ? "api" : "hybrid" : "pending" : "api" : "pending"
            }({
                isFlagReady: A,
                isHybridCandidate: C,
                hasUniverse: b,
                capabilitiesQuery: (0, h.useDashboardCapabilitiesQuery)(v, w.api, a)
            }),
            [E, S] = (0, n.useState)(null);
        "pending" !== T && (null == E ? void 0 : E.universeId) !== v && S({
            universeId: v,
            mode: T
        });
        let I = (null == E ? void 0 : E.universeId) === v ? E.mode : T;
        e: {
            let e, t;
            if ("hybrid" === I) {
                let e, t, r;
                m[2] !== w ? (e = w.getHybrid(), m[2] = w, m[3] = e) : e = m[3], m[4] !== v ? (t = {
                    kind: "hybrid",
                    universeId: v
                }, m[4] = v, m[5] = t) : t = m[5], m[6] !== w || m[7] !== e || m[8] !== t ? (r = {
                    backends: w,
                    service: e,
                    isReady: !0,
                    capabilitySource: t
                }, m[6] = w, m[7] = e, m[8] = t, m[9] = r) : r = m[9], u = r;
                break e
            }
            if ("api" === I) {
                let e, t;
                m[10] !== b || m[11] !== v ? (e = b ? {
                    kind: "server",
                    universeId: v,
                    isBackendChosen: !0
                } : {
                    kind: "fixed",
                    state: eH
                }, m[10] = b, m[11] = v, m[12] = e) : e = m[12], m[13] !== w || m[14] !== e ? (t = {
                    backends: w,
                    service: w.api,
                    isReady: !0,
                    capabilitySource: e
                }, m[13] = w, m[14] = e, m[15] = t) : t = m[15], u = t;
                break e
            }
            m[16] !== b || m[17] !== v ? (e = b ? {
                kind: "server",
                universeId: v,
                isBackendChosen: !1
            } : eK, m[16] = b, m[17] = v, m[18] = e) : e = m[18],
            m[19] !== w || m[20] !== g.service || m[21] !== e ? (t = {
                backends: w,
                service: g.service,
                isReady: !1,
                capabilitySource: e
            }, m[19] = w, m[20] = g.service, m[21] = e, m[22] = t) : t = m[22],
            u = t
        }
        let R = u;
        return m[23] !== y || m[24] !== R ? (c = (0, t.jsx)(ez.Provider, {
            value: R,
            children: y
        }), m[23] = y, m[24] = R, m[25] = c) : c = m[25], c
    }, "useCustomDashboardActions", 0, function() {
        let e = (0, n.useContext)(ez),
            {
                actions: t
            } = eW(e, !0);
        if (!e) throw Error("useCustomDashboardActions() must be used within a CustomDashboardServiceProvider.");
        return t
    }, "useCustomDashboardActionsResolved", 0, function() {
        let e = (0, n.useContext)(ez),
            {
                isResolved: t
            } = eW(e, !0);
        if (!e) throw Error("useCustomDashboardActionsResolved() must be used within a CustomDashboardServiceProvider.");
        return t
    }, "useCustomDashboardLimits", 0, function() {
        let e = (0, n.useContext)(ez),
            {
                limits: t
            } = eW(e, !0);
        if (!e) throw Error("useCustomDashboardLimits() must be used within a CustomDashboardServiceProvider.");
        return t
    }, "useCustomDashboardService", 0, function() {
        let e = (0, n.useContext)(ez);
        if (!e) throw Error("useCustomDashboardService() must be used within a CustomDashboardServiceProvider.");
        return e.service
    }, "useCustomDashboardsBackendState", 0, function() {
        let e, t = (0, r.c)(2),
            i = (0, n.useContext)(ez);
        if (!i) throw Error("useCustomDashboardsBackendState() must be used within CustomDashboardServiceProvider.");
        return t[0] !== i.isReady ? (e = {
            isReady: i.isReady
        }, t[0] = i.isReady, t[1] = e) : e = t[1], e
    }, "useOptionalCustomDashboardActionState", 0, function(e) {
        let t, i = (0, r.c)(4),
            {
                isRequested: a
            } = e,
            o = (0, n.useContext)(ez),
            {
                actions: s,
                isResolved: u
            } = eW(o, a);
        return i[0] !== s || i[1] !== o || i[2] !== u ? (t = o ? {
            actions: s,
            isResolved: u
        } : {
            actions: eQ,
            isResolved: !0
        }, i[0] = s, i[1] = o, i[2] = u, i[3] = t) : t = i[3], t
    }, "useOptionalCustomDashboardService", 0, function() {
        var e, t;
        return null != (e = null == (t = (0, n.useContext)(ez)) ? void 0 : t.service) ? e : null
    }, "useOptionalCustomDashboardsBackendState", 0, function() {
        var e;
        let t, i = (0, r.c)(2),
            a = (0, n.useContext)(ez),
            o = null != (e = null == a ? void 0 : a.isReady) && e;
        return i[0] !== o ? (t = {
            isReady: o
        }, i[0] = o, i[1] = t) : t = i[1], t
    }], 479236)
}, 379843, e => {
    "use strict";
    var t = e.i(531007);
    let r = [t.ChartType.Spline, t.ChartType.Area, t.ChartType.DurationSpline, t.ChartType.DurationArea, t.ChartType.Bar, t.ChartType.Column, t.ChartType.Pie, t.ChartType.Table],
        n = {
            Untabbed: "Untabbed"
        },
        i = {
            page: {
                mode: n.Untabbed,
                surface: {
                    controls: {},
                    bodyNodes: []
                }
            }
        };
    e.s(["BACKEND_DOCUMENT_WRITE_SCHEMA_VERSION", 0, 3, "CUSTOM_DASHBOARD_CHART_TYPES", 0, r, "CustomDashboardSummaryCardAggregation", 0, {
        AverageOverTimePeriod: "AverageOverTimePeriod",
        AveragePerUniqueUser: "AveragePerUniqueUser",
        MostRecentDataPoint: "MostRecentDataPoint",
        Total: "Total",
        Median: "Median",
        Cumulative: "Cumulative"
    }, "DEFAULT_CHART_GRANULARITY", 0, "Day", "DashboardPageMode", 0, n, "EMPTY_DASHBOARD_CONFIG", 0, i, "LOCAL_STORAGE_DOCUMENT_SCHEMA_VERSION", 0, 3, "READABLE_BACKEND_DOCUMENT_SCHEMA_VERSIONS", 0, [1, 2, 3], "SummaryCardTitleSource", 0, {
        Auto: "Auto",
        Custom: "Custom"
    }])
}, 296150, 98949, 115232, 646877, e => {
    "use strict";
    var t = e.i(650040),
        r = e.i(318727),
        n = e.i(31611),
        i = e.i(531007),
        a = e.i(36826),
        o = e.i(908374),
        s = e.i(545154),
        u = e.i(731197),
        c = e.i(283561),
        l = e.i(379843),
        d = e.i(102716),
        h = e.i(377396),
        f = e.i(841383);
    let p = n.RAQIV2MetricGranularity.OneDay;

    function m(e, t) {
        return (0, f.isGranularitySelectableForMetric)(e, t === l.CustomDashboardSummaryCardAggregation.Cumulative ? n.RAQIV2MetricGranularity.None : p)
    }

    function y(e, t) {
        return m(e, t) ? t : m(e, l.CustomDashboardSummaryCardAggregation.AverageOverTimePeriod) ? l.CustomDashboardSummaryCardAggregation.AverageOverTimePeriod : m(e, l.CustomDashboardSummaryCardAggregation.Cumulative) ? l.CustomDashboardSummaryCardAggregation.Cumulative : null
    }
    e.s(["SUMMARY_CARD_TIME_SERIES_GRANULARITY", 0, p, "isSummaryCardAggregationSupported", 0, m, "resolveSupportedSummaryCardAggregation", 0, y], 98949);
    var g = e.i(956154);
    let v = /^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(?:\.\d{3})?Z$/;

    function b(e) {
        return "object" == typeof e && null !== e && !Array.isArray(e)
    }

    function A(e, t) {
        if (!b(e)) throw new c.CustomDashboardValidationError(t, "".concat(t, " must be an object."));
        return e
    }

    function D(e, t) {
        if ("string" != typeof e) throw new c.CustomDashboardValidationError(t, "".concat(t, " must be a string."));
        return e
    }

    function C(e, t) {
        let r = D(e, t);
        if (0 === r.length) throw new c.CustomDashboardValidationError(t, "".concat(t, " must be non-empty."));
        return r
    }

    function w(e, t) {
        if ("number" != typeof e || !Number.isFinite(e)) throw new c.CustomDashboardValidationError(t, "".concat(t, " must be a finite number."));
        return e
    }

    function T(e, t) {
        if ("boolean" == typeof e) return e;
        if (void 0 === e) return;
        let r = A(e, t);
        return {
            relativeOffset: function(e, t) {
                if (void 0 !== e) {
                    if ("string" == typeof e && g.ComparisonOffset.some(t => t === e)) return e;
                    throw new c.CustomDashboardValidationError(t, "".concat(t, " must be a valid comparison offset."))
                }
            }(r.relativeOffset, "".concat(t, ".relativeOffset")),
            customStartTimeMs: function(e, t) {
                if (void 0 !== e) return w(e, t)
            }(r.customStartTimeMs, "".concat(t, ".customStartTimeMs"))
        }
    }

    function E(e, t) {
        if ("boolean" != typeof e) throw new c.CustomDashboardValidationError(t, "".concat(t, " must be a boolean."));
        return e
    }

    function S(e, t) {
        let r = D(e, t),
            n = Date.parse(r);
        if (!v.test(r) || !Number.isFinite(n)) throw new c.CustomDashboardValidationError(t, "".concat(t, " must be an ISO-8601 timestamp."));
        return r
    }

    function I(e) {
        return (t, r) => {
            let n;
            return null != t && (n = e(t, r)), n
        }
    }
    let R = I(S),
        _ = I(C),
        V = I(E);

    function O(e) {
        return e.trim()
    }
    e.s(["asBoolean", 0, E, "asIsoTimestamp", 0, S, "asNonEmptyString", 0, C, "asNumber", 0, w, "asOptionalIsoTimestamp", 0, R, "asOptionalNonEmptyString", 0, _, "asRecord", 0, A, "asString", 0, D, "isRecord", 0, b, "optional", 0, I, "trimmed", 0, O, "validateOptionalBoolean", 0, V, "validatePreviousPeriodOverlay", 0, T], 115232);
    let U = new Set([l.CustomDashboardSummaryCardAggregation.AverageOverTimePeriod, l.CustomDashboardSummaryCardAggregation.MostRecentDataPoint, l.CustomDashboardSummaryCardAggregation.Total, n.RAQIV2AggregationType.Average, n.RAQIV2AggregationType.AveragePerUser, n.RAQIV2AggregationType.Count, n.RAQIV2AggregationType.CountUser, n.RAQIV2AggregationType.Max, n.RAQIV2AggregationType.Min, n.RAQIV2AggregationType.Sum, l.CustomDashboardSummaryCardAggregation.Median, l.CustomDashboardSummaryCardAggregation.Cumulative, n.RAQIV2PercentileType.AVG, n.RAQIV2PercentileType.P10, n.RAQIV2PercentileType.P50, n.RAQIV2PercentileType.P90]),
        N = new Set([n.RAQIV2AggregationType.Average, n.RAQIV2AggregationType.AveragePerUser, n.RAQIV2AggregationType.Count, n.RAQIV2AggregationType.CountUser, n.RAQIV2AggregationType.Max, n.RAQIV2AggregationType.Min, n.RAQIV2AggregationType.Sum, n.RAQIV2PercentileType.AVG, n.RAQIV2PercentileType.P10, n.RAQIV2PercentileType.P50, n.RAQIV2PercentileType.P90]),
        P = new Set(["Cumulative", "Day", "Week", "Hour", "HalfHour", "Minute"]),
        M = new Set(l.CUSTOM_DASHBOARD_CHART_TYPES),
        x = new Set(["draft", "published"]),
        B = /^Percentile\d+$/,
        k = new Set(Object.values(n.RAQIV2DateRangeType)),
        L = Object.values(n.RAQIV2Dimension),
        Q = Object.values(n.RAQIV2UIPseudoDimension),
        G = Object.values(n.RAQIV2MetricGranularity),
        H = Object.values(a.AnnotationType),
        F = n.RAQIV2UIPseudoDimension.PercentileType,
        K = n.RAQIV2UIPseudoDimension.AggregationType,
        j = n.RAQIV2UIPseudoDimension.LatestPlaceVersion,
        z = new Set(Object.values(n.RAQIV2AggregationType)),
        Y = new Set(Object.values(n.RAQIV2PercentileType));

    function W(e, t) {
        for (let r of e)
            if (r === t) return !0;
        return !1
    }

    function q(e) {
        return L.includes(e) || Q.includes(e)
    }

    function X(e) {
        return L.includes(e)
    }

    function $(e) {
        return X(e) || e === j || e === F || e === K
    }

    function J(e) {
        return H.includes(e)
    }

    function Z(e) {
        return W(N, e) || B.test(e)
    }

    function ee(e) {
        return "string" == typeof e && k.has(e)
    }

    function et(e) {
        return "string" == typeof e && W(z, e)
    }

    function er(e) {
        return "string" == typeof e && W(Y, e)
    }

    function en(e) {
        return (0, o.isNumericUIMetric)(e)
    }

    function ei(e) {
        return "string" == typeof e && e.length > 0
    }
    let ea = I(function(e, t) {
            let r = D(e, t);
            if (!Z(r)) throw new c.CustomDashboardValidationError(t, "".concat(t, ' "').concat(r, '" is not a known chart aggregation.'));
            return r
        }),
        eo = I(function(e, t) {
            if ("none" !== e && "weekly" !== e) throw new c.CustomDashboardValidationError(t, "".concat(t, ' must be "none" or "weekly".'));
            return e
        }),
        es = I(function(e, t) {
            let r = D(e, t);
            if (r !== l.SummaryCardTitleSource.Auto && r !== l.SummaryCardTitleSource.Custom) throw new c.CustomDashboardValidationError(t, "".concat(t, ' must be "Auto" or "Custom".'));
            return r
        });

    function eu(e, t) {
        let r = A(e, t),
            n = C(r.pseudoDimensionKey, "".concat(t, ".pseudoDimensionKey"));
        if (n !== F && n !== K) throw new c.CustomDashboardValidationError("".concat(t, ".pseudoDimensionKey"), "".concat(t, ".pseudoDimensionKey must be a supported pseudo-dimension key."));
        let i = C(r.variantKey, "".concat(t, ".variantKey"));
        if (n === F && !er(i)) throw new c.CustomDashboardValidationError("".concat(t, ".variantKey"), "".concat(t, ".variantKey must be a known RAQI percentile for PercentileType."));
        if (n === K && !et(i)) throw new c.CustomDashboardValidationError("".concat(t, ".variantKey"), "".concat(t, ".variantKey must be a known RAQI aggregation for AggregationType."));
        return {
            pseudoDimensionKey: n,
            variantKey: i
        }
    }

    function ec(e, t) {
        if (function(e) {
                for (let t of e) {
                    let e = t.codePointAt(0);
                    if (void 0 === e) continue;
                    let r = e <= 31 && 9 !== e && 10 !== e && 13 !== e || 127 === e,
                        n = e >= 8234 && e <= 8238 || e >= 8294 && e <= 8297;
                    if (r || n) return !0
                }
                return !1
            }(e)) throw new c.CustomDashboardValidationError(t, "".concat(t, " contains unsupported control characters."));
        return e
    }

    function el(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : u.CONSERVATIVE_DASHBOARD_LIMITS,
            r = ec(O(e), "name");
        if (0 === r.length) throw new c.CustomDashboardValidationError("name", "Dashboard name is required.");
        if (t && r.length > t.maxDashboardNameLength) throw new c.CustomDashboardValidationError("name", "Dashboard name cannot exceed ".concat(t.maxDashboardNameLength, " characters."));
        return r
    }

    function ed(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : u.CONSERVATIVE_DASHBOARD_LIMITS;
        if (void 0 === e) return;
        let r = ec(O(e), "description");
        if (t && r.length > t.maxDashboardDescriptionLength) throw new c.CustomDashboardValidationError("description", "Description cannot exceed ".concat(t.maxDashboardDescriptionLength, " characters."));
        return 0 === r.length ? void 0 : r
    }

    function eh(e, t) {
        if (null == e) return [];
        if (!Array.isArray(e)) throw new c.CustomDashboardValidationError(t, "".concat(t, " must be an array."));
        return e.map((e, r) => {
            let n = A(e, "".concat(t, "[").concat(r, "]")),
                i = ec(C(n.dimension, "".concat(t, "[").concat(r, "].dimension")), "".concat(t, "[").concat(r, "].dimension")),
                {
                    values: a
                } = n;
            if (!Array.isArray(a) || 0 === a.length || !a.every(ei)) throw new c.CustomDashboardValidationError("".concat(t, "[").concat(r, "].values"), "".concat(t, "[").concat(r, "].values must be a non-empty array of non-empty strings."));
            return {
                dimension: i,
                values: a.map((e, n) => ec(e, "".concat(t, "[").concat(r, "].values[").concat(n, "]")))
            }
        })
    }

    function ef(e, t) {
        if (null == e) throw new c.CustomDashboardValidationError(t, "".concat(t, " must be an array."));
        return eh(e, t)
    }

    function ep(e, t, r) {
        if (null == e) return;
        let n = ec(O(D(e, t)), t);
        if (r && n.length > r.maxTileTitleLength) throw new c.CustomDashboardValidationError(t, "Tile title cannot exceed ".concat(r.maxTileTitleLength, " characters."));
        return 0 === n.length ? void 0 : n
    }

    function em(e, t) {
        if (null == e) return;
        if (!Array.isArray(e)) throw new c.CustomDashboardValidationError(t, "".concat(t, " must be an array."));
        let r = e.map((e, r) => {
            let n = C(e, "".concat(t, "[").concat(r, "]"));
            if (!X(n)) throw new c.CustomDashboardValidationError("".concat(t, "[").concat(r, "]"), "".concat(t, "[").concat(r, "] must be a canonical RAQI dimension."));
            return n
        });
        return r.length > 0 ? r : void 0
    }

    function ey(e, t) {
        if (null == e) return;
        if (!Array.isArray(e)) throw new c.CustomDashboardValidationError(t, "".concat(t, " must be an array."));
        let r = e.map((e, r) => {
            let n = C(e, "".concat(t, "[").concat(r, "]"));
            if (!J(n)) throw new c.CustomDashboardValidationError("".concat(t, "[").concat(r, "]"), "".concat(t, "[").concat(r, "] must be a known annotation type."));
            return n
        });
        return r.length > 0 ? r : void 0
    }

    function eg(e, t) {
        let r, n = A(e, t),
            i = (r = eb(n.variantSelections, "".concat(t, ".variantSelections"), eu)).length > 0 ? r : void 0;
        if (void 0 !== n.metricKey && null !== n.metricKey && void 0 !== n.computedMetric && null !== n.computedMetric) throw new c.CustomDashboardValidationError(t, "".concat(t, " must not include both metricKey and computedMetric."));
        return void 0 !== n.computedMetric && null !== n.computedMetric ? {
            computedMetric: function(e, t) {
                if (! function(e) {
                        if (!b(e)) return !1;
                        let {
                            sources: t,
                            formula: r,
                            name: n,
                            l7Smoothing: i
                        } = e;
                        return !!Array.isArray(t) && 0 !== t.length && "string" == typeof r && 0 !== r.trim().length && (void 0 === n || "string" == typeof n) && (void 0 === i || "boolean" == typeof i) && t.every(e => b(e) && "string" == typeof e.key && e.key.length > 0 && void 0 !== e.metric)
                    }(e)) throw new c.CustomDashboardValidationError(t, "".concat(t, " must be a computed metric object."));
                let r = (0, s.serializeComputedMetricToQueryParam)(e),
                    n = (0, s.deserializeComputedMetricFromQueryParam)(r);
                if (!r || !n) throw new c.CustomDashboardValidationError(t, "".concat(t, " is not a supported computed metric."));
                return n
            }(n.computedMetric, "".concat(t, ".computedMetric")),
            variantSelections: i
        } : {
            metricKey: function(e, t) {
                let r = D(e, t);
                if (!en(r)) throw new c.CustomDashboardValidationError(t, "".concat(t, ' "').concat(r, '" is not a known RAQI metric.'));
                return r
            }(n.metricKey, "".concat(t, ".metricKey")),
            variantSelections: i
        }
    }

    function ev(e, t) {
        let r = A(e, t);
        return {
            metric: eg(r.metric, "".concat(t, ".metric")),
            seriesKey: ec(C(r.seriesKey, "".concat(t, ".seriesKey")), "".concat(t, ".seriesKey")),
            displayName: void 0 !== r.displayName && null !== r.displayName ? ec(O(D(r.displayName, "".concat(t, ".displayName"))), "".concat(t, ".displayName")) : void 0,
            aggregation: ea(r.aggregation, "".concat(t, ".aggregation")),
            filters: void 0 === r.filters ? void 0 : ef(r.filters, "".concat(t, ".filters"))
        }
    }

    function eb(e, t, r) {
        if (null == e) return [];
        if (!Array.isArray(e)) throw new c.CustomDashboardValidationError(t, "".concat(t, " must be an array."));
        return e.map((e, n) => r(e, "".concat(t, "[").concat(n, "]")))
    }

    function eA(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
            {
                limits: r = u.CONSERVATIVE_DASHBOARD_LIMITS
            } = t,
            a = A(e, "config"),
            o = A(a.page, "config.page");
        if (o.mode !== l.DashboardPageMode.Untabbed) throw new c.CustomDashboardValidationError("config.page.mode", 'config.page.mode must be "Untabbed" in v1.');
        let s = A(o.surface, "config.page.surface"),
            f = eb(s.bodyNodes, "config.page.surface.bodyNodes", (e, t) => (function e(t, r, n) {
                let a = A(t, r),
                    o = (t, r) => e(t, r, n);
                if ("Component" === a.type) {
                    let e = A(a.component, "".concat(r, ".component"));
                    if ("Chart" === e.type) return {
                        type: "Component",
                        component: {
                            type: "Chart",
                            chart: function(e, t, r) {
                                let n = A(e, t);
                                if ("Chart" !== n.type) throw new c.CustomDashboardValidationError("".concat(t, ".type"), "".concat(t, '.type must be "Chart".'));
                                return function(e, t, r) {
                                    let n = A(e.dataSpec, "".concat(t, ".dataSpec")),
                                        a = A(e.chartSpec, "".concat(t, ".chartSpec")),
                                        o = D(a.chartType, "".concat(t, ".chartSpec.chartType"));
                                    if (!W(M, o)) throw new c.CustomDashboardValidationError("".concat(t, ".chartSpec.chartType"), "".concat(t, '.chartSpec.chartType "').concat(o, '" is not supported.'));
                                    let s = b(a.overlays) ? a.overlays : void 0,
                                        u = s ? {
                                            genreBenchmark: V(s.genreBenchmark, "".concat(t, ".chartSpec.overlays.genreBenchmark")),
                                            similarExperienceBenchmark: V(s.similarExperienceBenchmark, "".concat(t, ".chartSpec.overlays.similarExperienceBenchmark")),
                                            topExperienceBenchmark: V(s.topExperienceBenchmark, "".concat(t, ".chartSpec.overlays.topExperienceBenchmark")),
                                            previousPeriod: T(s.previousPeriod, "".concat(t, ".chartSpec.overlays.previousPeriod")),
                                            quota: V(s.quota, "".concat(t, ".chartSpec.overlays.quota"))
                                        } : void 0,
                                        l = eb(n.metrics, "".concat(t, ".dataSpec.metrics"), ev),
                                        d = o === i.ChartType.Table;
                                    if (!d && 1 !== l.length) throw new c.CustomDashboardValidationError("".concat(t, ".dataSpec.metrics"), "".concat(t, ".dataSpec.metrics must contain exactly one metric."));
                                    if (d && l.length < 1) throw new c.CustomDashboardValidationError("".concat(t, ".dataSpec.metrics"), "".concat(t, ".dataSpec.metrics must contain at least 1 metric for table charts."));
                                    if (d && r && l.length > r.maxTableMetricColumns) throw new c.CustomDashboardValidationError("".concat(t, ".dataSpec.metrics"), "".concat(t, ".dataSpec.metrics must contain between 1 and ").concat(r.maxTableMetricColumns, " metrics for table charts."));
                                    let h = n.breakdownDimensions,
                                        f = null == h ? void 0 : eb(h, "".concat(t, ".dataSpec.breakdownDimensions"), (e, t) => {
                                            var r;
                                            let n = null != (r = _(e, t)) ? r : "";
                                            if (n.length > 0 && !$(n)) throw new c.CustomDashboardValidationError(t, "".concat(t, " must be a persistable breakdown dimension."));
                                            return n
                                        }).filter(e => e.length > 0);
                                    return {
                                        type: "Chart",
                                        tileId: C(e.tileId, "".concat(t, ".tileId")),
                                        title: ep(e.title, "".concat(t, ".title"), r),
                                        dataSpec: {
                                            metrics: l,
                                            aggregation: ea(n.aggregation, "".concat(t, ".dataSpec.aggregation")),
                                            breakdownDimensions: f,
                                            granularity: function(e, t) {
                                                let r = D(e, t);
                                                if (!W(P, r)) throw new c.CustomDashboardValidationError(t, "".concat(t, ' "').concat(r, '" is not a known time interval.'));
                                                return r
                                            }(n.granularity, "".concat(t, ".dataSpec.granularity")),
                                            filters: ef(n.filters, "".concat(t, ".dataSpec.filters"))
                                        },
                                        chartSpec: {
                                            chartType: o,
                                            overlays: u,
                                            smoothing: eo(a.smoothing, "".concat(t, ".chartSpec.smoothing"))
                                        }
                                    }
                                }(n, t, r)
                            }(e.chart, "".concat(r, ".component.chart"), n)
                        }
                    };
                    if ("SummaryCard" === e.type) return {
                        type: "Component",
                        component: {
                            type: "SummaryCard",
                            summaryCard: function(e, t, r) {
                                let n = A(e, t);
                                if ("SummaryCard" !== n.type) throw new c.CustomDashboardValidationError("".concat(t, ".type"), "".concat(t, '.type must be "SummaryCard".'));
                                let i = b(n.overlays) ? n.overlays : void 0,
                                    a = eg(n.metric, "".concat(t, ".metric")),
                                    o = function(e, t) {
                                        let r = D(e, t);
                                        if (!(W(U, r) || B.test(r))) throw new c.CustomDashboardValidationError(t, "".concat(t, ' "').concat(r, '" is not a known summary-card aggregation.'));
                                        return r
                                    }(n.aggregation, "".concat(t, ".aggregation")),
                                    s = a.metricKey ? y(a.metricKey, o) : o;
                                if (!s) throw new c.CustomDashboardValidationError("".concat(t, ".aggregation"), "".concat(t, ".aggregation is not supported by the selected metric."));
                                return {
                                    type: "SummaryCard",
                                    tileId: C(n.tileId, "".concat(t, ".tileId")),
                                    title: ep(n.title, "".concat(t, ".title"), r),
                                    titleSource: es(n.titleSource, "".concat(t, ".titleSource")),
                                    metric: a,
                                    aggregation: s,
                                    overlays: i ? {
                                        periodOverPeriod: V(i.periodOverPeriod, "".concat(t, ".overlays.periodOverPeriod"))
                                    } : void 0,
                                    filters: ef(n.filters, "".concat(t, ".filters"))
                                }
                            }(e.summaryCard, "".concat(r, ".component.summaryCard"), n)
                        }
                    };
                    throw new c.CustomDashboardValidationError("".concat(r, ".component.type"), "".concat(r, '.component.type must be "Chart" or "SummaryCard".'))
                }
                if ("Grid" === a.type) {
                    let e = a.columnCount;
                    if (1 !== e && 2 !== e) throw new c.CustomDashboardValidationError("".concat(r, ".columnCount"), "".concat(r, ".columnCount must be 1 or 2."));
                    let t = eb(a.children, "".concat(r, ".children"), o);
                    if (0 === t.length || t.length > e && !t.every(d.isSummaryCardLayoutNode)) throw new c.CustomDashboardValidationError("".concat(r, ".children"), "".concat(r, ".children must contain between 1 and ").concat(e, " child node(s)."));
                    return {
                        type: "Grid",
                        columnCount: e,
                        children: t
                    }
                }
                if ("Flex" === a.type || "Stack" === a.type) return {
                    type: a.type,
                    children: eb(a.children, "".concat(r, ".children"), o)
                };
                throw new c.CustomDashboardValidationError("".concat(r, ".type"), "".concat(r, '.type must be "Component", "Grid", "Flex", or "Stack".'))
            })(e, t, r)),
            p = new Set,
            m = 0,
            g = 0,
            v = (e, t, r) => {
                if (p.has(e)) throw new c.CustomDashboardValidationError(r, 'Duplicate tileId "'.concat(e, '".'));
                p.add(e), "Chart" === t ? g += 1 : m += 1
            };
        if (f.forEach((e, t) => (function e(t, r, n) {
                "Component" === t.type ? r("Chart" === t.component.type ? t.component.chart.tileId : t.component.summaryCard.tileId, t.component.type, "".concat(n, ".component.").concat("Chart" === t.component.type ? "chart" : "summaryCard", ".tileId")) : t.children.forEach((t, i) => e(t, r, "".concat(n, ".children[").concat(i, "]")))
            })(e, v, "config.page.surface.bodyNodes[".concat(t, "]"))), r) {
            if (m > r.maxSummaryCardsPerDashboard) throw new c.CustomDashboardValidationError("config.page.surface.bodyNodes", "A dashboard may have at most ".concat(r.maxSummaryCardsPerDashboard, " summary cards."));
            if (g > r.maxChartTilesPerDashboard) throw new c.CustomDashboardValidationError("config.page.surface.bodyNodes", "A dashboard may have at most ".concat(r.maxChartTilesPerDashboard, " chart tiles."))
        }
        return {
            page: {
                mode: l.DashboardPageMode.Untabbed,
                surface: {
                    controls: function(e, t) {
                        let r;
                        if (null == e) return {};
                        let i = A(e, t);
                        return {
                            timeRangeOptions: function(e, t) {
                                if (null == e) return;
                                let r = A(e, t);
                                if ("None" === r.type) return {
                                    type: "None"
                                };
                                if ("DateRange" !== r.type) throw new c.CustomDashboardValidationError("".concat(t, ".type"), "".concat(t, '.type must be "None" or "DateRange".'));
                                return {
                                    type: "DateRange",
                                    defaultSelection: function(e, t) {
                                        if (null == e) return;
                                        let r = A(e, t);
                                        if ("Relative" === r.type) {
                                            if (!ee(r.rangeType) || r.rangeType === n.RAQIV2DateRangeType.Custom) throw new c.CustomDashboardValidationError("".concat(t, ".rangeType"), "".concat(t, ".rangeType must be a preset date range."));
                                            if (!(0, h.isSupportedCustomDashboardSavedDateRangeType)(r.rangeType)) throw new c.CustomDashboardValidationError("".concat(t, ".rangeType"), "".concat(t, ".rangeType must span less than ").concat(h.CUSTOM_DASHBOARD_SAVED_DATE_RANGE_LIMIT_DAYS, " days."));
                                            return {
                                                type: "Relative",
                                                rangeType: r.rangeType
                                            }
                                        }
                                        if ("Custom" === r.type) {
                                            let e = w(r.startTimeMs, "".concat(t, ".startTimeMs")),
                                                n = w(r.endTimeMs, "".concat(t, ".endTimeMs"));
                                            if (e > n) throw new c.CustomDashboardValidationError(t, "".concat(t, " custom startTimeMs must be before endTimeMs."));
                                            if (!(0, h.isCustomDashboardSavedDateRangeDurationValid)(e, n)) throw new c.CustomDashboardValidationError(t, "".concat(t, " custom date range must span less than ").concat(h.CUSTOM_DASHBOARD_SAVED_DATE_RANGE_LIMIT_DAYS, " days."));
                                            return {
                                                type: "Custom",
                                                startTimeMs: e,
                                                endTimeMs: n
                                            }
                                        }
                                        throw new c.CustomDashboardValidationError("".concat(t, ".type"), "".concat(t, '.type must be "Relative" or "Custom".'))
                                    }(r.defaultSelection, "".concat(t, ".defaultSelection"))
                                }
                            }(i.timeRangeOptions, "".concat(t, ".timeRangeOptions")),
                            filterDimensions: em(i.filterDimensions, "".concat(t, ".filterDimensions")),
                            defaultFilters: (r = eh(i.defaultFilters, "".concat(t, ".defaultFilters"))).length > 0 ? r : void 0,
                            breakdownDimensions: em(i.breakdownDimensions, "".concat(t, ".breakdownDimensions")),
                            defaultBreakdown: function(e, t) {
                                if (null == e) return;
                                if (!Array.isArray(e)) throw new c.CustomDashboardValidationError(t, "".concat(t, " must be an array."));
                                let r = e.map((e, r) => {
                                    let n = C(e, "".concat(t, "[").concat(r, "]"));
                                    if (!q(n)) throw new c.CustomDashboardValidationError("".concat(t, "[").concat(r, "]"), "".concat(t, "[").concat(r, "] must be a known RAQI dimension."));
                                    return n
                                });
                                return r.length > 0 ? r : void 0
                            }(i.defaultBreakdown, "".concat(t, ".defaultBreakdown")),
                            defaultGranularity: function(e, t) {
                                if (null == e) return;
                                let r = C(e, t);
                                if (!G.includes(r)) throw new c.CustomDashboardValidationError(t, "".concat(t, " must be a known granularity."));
                                return r
                            }(i.defaultGranularity, "".concat(t, ".defaultGranularity")),
                            annotationOptions: function(e, t) {
                                var r, n;
                                if (null == e) return;
                                let i = A(e, t);
                                return {
                                    supportedAnnotationTypes: null != (r = ey(i.supportedAnnotationTypes, "".concat(t, ".supportedAnnotationTypes"))) ? r : [],
                                    defaultAnnotationTypes: null != (n = ey(i.defaultAnnotationTypes, "".concat(t, ".defaultAnnotationTypes"))) ? n : [],
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
    e.s(["isCanonicalRAQIV2Dimension", 0, X, "isChartAggregation", 0, Z, "isDateRangeType", 0, ee, "isDefaultAnnotationType", 0, J, "isDefaultBreakdownDimension", 0, q, "isMetricKey", 0, en, "isPersistableBreakdownDimension", 0, $, "isRAQIV2AggregationType", 0, et, "isRAQIV2PercentileType", 0, er, "validateCustomDashboardConfig", 0, eA, "validateCustomDashboardDocument", 0, function(e) {
        var t;
        let r, n = A(e, "document");
        if (n.schemaVersion !== l.LOCAL_STORAGE_DOCUMENT_SCHEMA_VERSION) throw new c.CustomDashboardValidationError("schemaVersion", "schemaVersion must equal ".concat(l.LOCAL_STORAGE_DOCUMENT_SCHEMA_VERSION, " (got ").concat(String(n.schemaVersion), "). Run applyMigrations first."));
        let {
            status: i
        } = n;
        if (!("string" == typeof i && W(x, i))) throw new c.CustomDashboardValidationError("status", 'status must be "draft" or "published".');
        void 0 !== n.description && null !== n.description && (r = ed(D(n.description, "description"), null));
        let a = E(n.isPinned, "isPinned"),
            o = a ? R(n.pinnedAt, "pinnedAt") : void 0;
        if (void 0 === n.config || null === n.config) throw new c.CustomDashboardValidationError("config", "config is required. Service-layer create() must substitute EMPTY_DASHBOARD_CONFIG before validation.");
        return {
            ...n,
            id: C(n.id, "id"),
            schemaVersion: l.LOCAL_STORAGE_DOCUMENT_SCHEMA_VERSION,
            universeId: w(n.universeId, "universeId"),
            name: el(D(n.name, "name"), null),
            description: r,
            status: i,
            isPinned: a,
            pinnedAt: o,
            createdAt: S(n.createdAt, "createdAt"),
            updatedAt: S(n.updatedAt, "updatedAt"),
            publishedAt: R(n.publishedAt, "publishedAt"),
            createdByUserId: w(n.createdByUserId, "createdByUserId"),
            createdByUsername: D(null != (t = n.createdByUsername) ? t : "", "createdByUsername"),
            updatedByUserId: I(w)(n.updatedByUserId, "updatedByUserId"),
            updatedByUsername: I(C)(n.updatedByUsername, "updatedByUsername"),
            config: eA(n.config, {
                limits: null
            })
        }
    }, "validateDashboardDescription", 0, ed, "validateDashboardName", 0, el], 646877), e.s(["addChartTileToConfig", 0, function(e) {
        let {
            config: n,
            tile: i,
            nextTileId: a,
            limits: o
        } = e, s = {
            ...i,
            tileId: a
        };
        return {
            config: eA((0, t.withChartRows)(n, [...(0, t.getChartRows)(n), (0, r.singleTileRow)(s)]), {
                limits: o
            }),
            tile: s
        }
    }], 296150)
}, 743209, 593431, 582078, 852209, 482922, 302610, e => {
    "use strict";
    var t = e.i(718389),
        r = e.i(436025);
    e.s(["cloneTileWithNewId", 0, function(e) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : r.createTileId;
        return {
            ...(0, t.default)(e),
            tileId: n()
        }
    }], 743209), e.s(["sortDashboardsForList", 0, function(e) {
        return e.toSorted((e, t) => e.isPinned !== t.isPinned ? e.isPinned ? -1 : 1 : e.updatedAt !== t.updatedAt ? e.updatedAt < t.updatedAt ? 1 : -1 : e.id === t.id ? 0 : e.id < t.id ? -1 : 1)
    }], 593431);
    let n = e.i(731197).CONSERVATIVE_DASHBOARD_LIMITS.maxDashboardNameLength;

    function i(e) {
        return e.length > n ? e.slice(0, n) : e
    }

    function a(e, t) {
        let r = n - t.length;
        return r <= 0 ? "" : e.length > r ? e.slice(0, r) : e
    }

    function o(e, t) {
        let r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 1,
            n = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : 1e3,
            i = new Set(Array.from(e, e => e.trim())),
            a = Math.max(1, r),
            o = 0;
        for (; i.has(t(a)) && o < n;) a += 1, o += 1;
        return t(a)
    }
    e.s(["DUPLICATE_COPY_NUMBERED_SUFFIX_START", 0, 2, "buildDuplicateDashboardName", 0, function(e, t, r) {
        let n = new Set(Array.from(e, e => e.trim())),
            s = " ".concat(r.first),
            u = "".concat(a(t, s)).concat(s);
        return n.has(u) ? i(o(e, e => {
            let n = " ".concat(r.numbered(e));
            return "".concat(a(t, n)).concat(n)
        }, 2, 1e3)) : u
    }, "clipDashboardName", 0, i, "findUnusedNumberedName", 0, o, "suggestDefaultName", 0, function(e) {
        return i(o(e, e => "Dashboard #".concat(e)))
    }], 582078);
    var s = e.i(721281),
        u = e.i(546699),
        c = e.i(650502);
    let l = (0, u.default)({
        baseUrl: (0, c.getBEDEV2ServiceBasePath)("analytics-custom-dashboards"),
        credentials: "include",
        enableMrRouter: !0
    });
    class d extends Error {
        constructor(e, t, r) {
            super(t), (0, s._)(this, "status", void 0), (0, s._)(this, "body", void 0), this.name = "CustomDashboardsApiRequestError", this.status = e, this.body = r
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
            message: r,
            status: n
        } = e;
        return {
            ..."string" == typeof t || "number" == typeof t ? {
                code: t
            } : {},
            ..."string" == typeof r ? {
                message: r
            } : {},
            ..."string" == typeof n ? {
                status: n
            } : {}
        }
    }

    function m(e, t) {
        var r, n, i, a, o;
        let s = null != (r = null == e ? void 0 : e.status) ? r : 0,
            u = function(e) {
                if (!f(e)) return;
                let {
                    code: t,
                    reason: r,
                    message: n,
                    errors: i,
                    error: a,
                    details: o
                } = e, s = p(a), u = Array.isArray(i) ? i[0] : void 0, c = p(u);
                return {
                    ..."string" == typeof t || "number" == typeof t ? {
                        code: t
                    } : {},
                    ..."string" == typeof r || "number" == typeof r ? {
                        reason: r
                    } : {},
                    ..."string" == typeof n ? {
                        message: n
                    } : {},
                    ...c && f(u) ? {
                        errors: [{
                            ...c,
                            ...f(u.details) ? {
                                details: u.details
                            } : {},
                            ..."string" == typeof u.referenceId ? {
                                referenceId: u.referenceId
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
            c = null != (n = [null == u || null == (a = u.errors) || null == (i = a[0]) ? void 0 : i.message, null == u ? void 0 : u.message, null == u || null == (o = u.error) ? void 0 : o.message].find(e => null == e ? void 0 : e.trim())) ? n : "HTTP ".concat(s);
        throw new d(s, c, u)
    }
    e.s(["CustomDashboardsApiRequestError", 0, d, "createDefaultCustomDashboardsApiClient", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : l;
        return {
            async listDashboards(t, r) {
                let {
                    data: n,
                    error: i,
                    response: a
                } = await e.GET("/v1/universes/{universeId}/custom-dashboards", {
                    params: {
                        path: {
                            universeId: t
                        },
                        query: {
                            pageSize: null == r ? void 0 : r.pageSize,
                            pageToken: null == r ? void 0 : r.pageToken
                        }
                    }
                });
                return (i || !n) && m(a, i), n
            },
            async listPinnedDashboards(t) {
                let {
                    data: r,
                    error: n,
                    response: i
                } = await e.GET("/v1/universes/{universeId}/custom-dashboards/pinned", {
                    params: {
                        path: {
                            universeId: t
                        }
                    }
                });
                return (n || !r) && m(i, n), r
            },
            async getDashboardCapabilities(t) {
                var r;
                let {
                    data: n,
                    error: i,
                    response: a
                } = await e.GET("/v1/universes/{universeId}/custom-dashboards/capabilities", {
                    params: {
                        path: {
                            universeId: t
                        }
                    }
                });
                return (i || !n) && m(a, i), null != (r = n.capabilities) ? r : {}
            },
            async getDashboard(t) {
                var r;
                let {
                    universeId: n,
                    dashboardId: i
                } = t, {
                    data: a,
                    error: o,
                    response: s
                } = await e.GET("/v1/universes/{universeId}/custom-dashboards/{dashboardId}", {
                    params: {
                        path: {
                            universeId: n,
                            dashboardId: i
                        }
                    }
                });
                return (o || !a) && m(s, o), null != (r = a.dashboard) ? r : {}
            },
            async createDashboard(t) {
                var r;
                let {
                    universeId: n,
                    name: i,
                    description: a,
                    document: o
                } = t, {
                    data: s,
                    error: u,
                    response: c
                } = await e.POST("/v1/universes/{universeId}/custom-dashboards", {
                    params: {
                        path: {
                            universeId: n
                        }
                    },
                    body: {
                        universeId: n,
                        name: i,
                        description: a,
                        document: o
                    }
                });
                return (u || !s) && m(c, u), null != (r = s.dashboard) ? r : {}
            },
            async updateDashboardMetadata(t) {
                var r;
                let {
                    universeId: n,
                    dashboardId: i,
                    expectedHeadEtag: a,
                    patch: o
                } = t, {
                    data: s,
                    error: u,
                    response: c
                } = await e.PATCH("/v1/universes/{universeId}/custom-dashboards/{dashboardId}/metadata", {
                    params: {
                        path: {
                            universeId: n,
                            dashboardId: i
                        }
                    },
                    body: {
                        universeId: n,
                        dashboardId: i,
                        expectedHeadEtag: a,
                        patch: h(o)
                    }
                });
                return (u || !s) && m(c, u), null != (r = s.metadata) ? r : {}
            },
            async publishDashboard(t) {
                var r;
                let {
                    universeId: n,
                    dashboardId: i,
                    expectedHeadEtag: a,
                    document: o,
                    metadataPatch: s
                } = t, u = void 0 === s ? void 0 : h(s), c = {
                    universeId: n,
                    dashboardId: i,
                    expectedHeadEtag: a,
                    document: o,
                    ...void 0 !== u && Object.keys(u).length > 0 ? {
                        metadataPatch: u
                    } : {}
                }, {
                    data: l,
                    error: d,
                    response: f
                } = await e.POST("/v1/universes/{universeId}/custom-dashboards/{dashboardId}/publish", {
                    params: {
                        path: {
                            universeId: n,
                            dashboardId: i
                        }
                    },
                    body: c
                });
                return (d || !l) && m(f, d), null != (r = l.dashboard) ? r : {}
            },
            async duplicateDashboard(t) {
                var r;
                let {
                    universeId: n,
                    dashboardId: i,
                    destinationUniverseId: a,
                    name: o
                } = t, {
                    data: s,
                    error: u,
                    response: c
                } = await e.POST("/v1/universes/{universeId}/custom-dashboards/{dashboardId}/duplicate", {
                    params: {
                        path: {
                            universeId: n,
                            dashboardId: i
                        }
                    },
                    body: {
                        destinationUniverseId: a,
                        name: o
                    }
                });
                return (u || !s) && m(c, u), null != (r = s.dashboard) ? r : {}
            },
            async deleteDashboard(t) {
                let {
                    universeId: r,
                    dashboardId: n
                } = t, {
                    error: i,
                    response: a
                } = await e.POST("/v1/universes/{universeId}/custom-dashboards/{dashboardId}/delete", {
                    params: {
                        path: {
                            universeId: r,
                            dashboardId: n
                        }
                    },
                    body: {
                        universeId: r,
                        dashboardId: n
                    }
                });
                i && m(a, i)
            },
            async filterDashboardText(t) {
                let {
                    universeId: r,
                    text: n,
                    format: i
                } = t, {
                    data: a,
                    error: o,
                    response: s
                } = await e.POST("/v1/universes/{universeId}/custom-dashboard-text/filter", {
                    params: {
                        path: {
                            universeId: r
                        }
                    },
                    body: {
                        universeId: r,
                        text: n,
                        format: "description" === i ? 2 : 1
                    }
                });
                if ((o || !a) && m(s, o), "boolean" != typeof a.isFiltered) {
                    var u;
                    throw new d(null != (u = null == s ? void 0 : s.status) ? u : 0, "Response is missing isFiltered")
                }
                return {
                    isFiltered: a.isFiltered
                }
            }
        }
    }], 852209);
    var y = e.i(283561);

    function g(e) {
        return (null != e ? e : "").toUpperCase().replaceAll("-", "_")
    }

    function v(e, t, r, n) {
        return 404 === e || t.includes("NOT_FOUND") ? new y.CustomDashboardNotFoundError(null != n ? n : "unknown") : 409 === e || t.includes("VERSION_CONFLICT") || t.includes("CONFLICT") ? new y.CustomDashboardVersionConflictError(null != n ? n : "unknown") : 429 === e || t.includes("QUOTA_EXCEEDED") || t.includes("RESOURCE_EXHAUSTED") ? new y.CustomDashboardQuotaExceededError(r) : 401 === e || t.includes("UNAUTHENTICATED") ? new y.CustomDashboardUnauthenticatedError(r) : 403 === e || t.includes("PERMISSION_DENIED") ? new y.CustomDashboardPermissionDeniedError(r) : 400 === e || t.includes("VALIDATION_FAILED") || t.includes("INVALID_ARGUMENT") ? new y.CustomDashboardValidationError("document", null != r ? r : "Invalid custom dashboard.") : 503 === e || t.includes("UNAVAILABLE") ? new y.CustomDashboardNotAvailableError : void 0
    }
    e.s(["mapCustomDashboardsApiError", 0, function(e, t) {
        var r, n, i, a, o, s, u, c, l, h, f, p, m, b, A, D, C;
        if (e instanceof y.CustomDashboardServiceError) return e;
        if (!(e instanceof d)) return new y.CustomDashboardStorageWriteError(e);
        let w = [null == (b = e.body) || null == (m = b.errors) || null == (p = m[0]) ? void 0 : p.message, null == (A = e.body) ? void 0 : A.message, null == (C = e.body) || null == (D = C.error) ? void 0 : D.message, e.message].find(e => null == e ? void 0 : e.trim()),
            T = null != (r = null == (c = e.body) || null == (u = c.errors) || null == (s = u[0]) || null == (o = s.details) ? void 0 : o.reason) ? r : null == (l = e.body) ? void 0 : l.reason,
            E = g("".concat(null != (n = null == (f = e.body) || null == (h = f.error) ? void 0 : h.status) ? n : "", " ").concat("string" == typeof T ? T : ""));
        return null != (i = null != (a = v(e.status, E, w, t)) ? a : v(0, g(w), w, t)) ? i : new y.CustomDashboardStorageWriteError(e)
    }], 482922);
    var b = e.i(36826);
    let A = {
        supportedAnnotationTypes: [b.AnnotationType.PlaceIcon, b.AnnotationType.PlaceThumbnail, b.AnnotationType.PlaceVideo, b.AnnotationType.PlaceVersion, b.AnnotationType.Benchmark, b.AnnotationType.LiveEvent, b.AnnotationType.CustomMatchmaking, b.AnnotationType.RetentionCorhortDisclaimer, b.AnnotationType.ConfigVersion, b.AnnotationType.Announcement],
        defaultAnnotationTypes: [],
        showAnnotationsControl: !0
    };
    e.s(["CUSTOM_DASHBOARD_SURFACE_ANNOTATION_OPTIONS", 0, A, "resolveCustomDashboardSupportedAnnotationTypes", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [],
            t = A.supportedAnnotationTypes,
            r = e.filter(e => !t.includes(e));
        return 0 === r.length ? [...t] : [...t, ...r]
    }], 302610)
}, 436025, e => {
    "use strict";

    function t() {
        return crypto.randomUUID()
    }

    function r() {
        return "tile_".concat(t())
    }
    e.s(["createTileId", 0, r, "defaultIdFactory", 0, {
        nextTileId: r,
        nextDashboardId: function() {
            return "dsh_".concat(t())
        }
    }])
}, 102716, 377396, e => {
    "use strict";
    e.s(["isSummaryCardLayoutNode", 0, function(e) {
        return "Component" === e.type && "SummaryCard" === e.component.type
    }], 102716);
    var t = e.i(31611);
    let r = new Set([t.RAQIV2DateRangeType.Last1Hour, t.RAQIV2DateRangeType.Last1Day, t.RAQIV2DateRangeType.Last3Days, t.RAQIV2DateRangeType.Last7Days, t.RAQIV2DateRangeType.Last28Days, t.RAQIV2DateRangeType.Last56Days, t.RAQIV2DateRangeType.Custom]);

    function n(e) {
        return r.has(e)
    }

    function i(e, t) {
        let r = t - e;
        return r >= 0 && r < 48384e5
    }
    e.s(["CUSTOM_DASHBOARD_SAVED_DATE_RANGE_LIMIT_DAYS", 0, 56, "constrainCustomDashboardEditorDateRange", 0, function(e, t) {
        return i(e.getTime(), t.getTime()) ? {
            startDate: e,
            endDate: t
        } : {
            startDate: new Date(t.getTime() - 4752e6),
            endDate: t
        }
    }, "filterSupportedCustomDashboardSavedDateRangeTypes", 0, function(e) {
        return e.filter(n)
    }, "isCustomDashboardSavedDateRangeDurationValid", 0, i, "isSupportedCustomDashboardSavedDateRangeType", 0, n], 377396)
}, 787202, e => {
    "use strict";
    var t = e.i(31611),
        r = e.i(11517),
        n = e.i(339923),
        i = e.i(927868);
    let a = t.RAQIV2UIPseudoDimension.AggregationType,
        o = t.RAQIV2UIPseudoDimension.PercentileType,
        s = t.RAQIV2AggregationType.Average;
    e.s(["resolveDefaultChartAggregation", 0, function(e) {
        let u = function(e) {
            var r;
            for (let n of null != (r = e.variantSelections) ? r : [])
                if (n.pseudoDimensionKey === a && (0, i.isValidEnumValue)(t.RAQIV2AggregationType, n.variantKey) || n.pseudoDimensionKey === o && (0, i.isValidEnumValue)(t.RAQIV2PercentileType, n.variantKey)) return n.variantKey
        }(e);
        if (void 0 !== u) return u;
        if (e.computedMetric) {
            let [n] = e.computedMetric.sources;
            if (n && (0, r.isCustomEventsAtomicMetricLike)(n.metric)) {
                var c;
                return null != (c = n.metric.aggregationType) ? c : t.RAQIV2AggregationType.Sum
            }
            return s
        }
        return void 0 !== e.metricKey ? (0, n.getIsAverageAggregationMetric)(e.metricKey) ? t.RAQIV2AggregationType.Average : t.RAQIV2AggregationType.Sum : s
    }])
}, 836047, (e, t, r) => {
    var n = {
            872: function(e, t) {
                "use strict";
                t.byteLength = function(e) {
                    var t = u(e),
                        r = t[0],
                        n = t[1];
                    return (r + n) * 3 / 4 - n
                }, t.toByteArray = function(e) {
                    var t, r, a = u(e),
                        o = a[0],
                        s = a[1],
                        c = new i((o + s) * 3 / 4 - s),
                        l = 0,
                        d = s > 0 ? o - 4 : o;
                    for (r = 0; r < d; r += 4) t = n[e.charCodeAt(r)] << 18 | n[e.charCodeAt(r + 1)] << 12 | n[e.charCodeAt(r + 2)] << 6 | n[e.charCodeAt(r + 3)], c[l++] = t >> 16 & 255, c[l++] = t >> 8 & 255, c[l++] = 255 & t;
                    return 2 === s && (t = n[e.charCodeAt(r)] << 2 | n[e.charCodeAt(r + 1)] >> 4, c[l++] = 255 & t), 1 === s && (t = n[e.charCodeAt(r)] << 10 | n[e.charCodeAt(r + 1)] << 4 | n[e.charCodeAt(r + 2)] >> 2, c[l++] = t >> 8 & 255, c[l++] = 255 & t), c
                }, t.fromByteArray = function(e) {
                    for (var t, n = e.length, i = n % 3, a = [], o = 0, s = n - i; o < s; o += 16383) a.push(function(e, t, n) {
                        for (var i, a = [], o = t; o < n; o += 3) i = (e[o] << 16 & 0xff0000) + (e[o + 1] << 8 & 65280) + (255 & e[o + 2]), a.push(r[i >> 18 & 63] + r[i >> 12 & 63] + r[i >> 6 & 63] + r[63 & i]);
                        return a.join("")
                    }(e, o, o + 16383 > s ? s : o + 16383));
                    return 1 === i ? a.push(r[(t = e[n - 1]) >> 2] + r[t << 4 & 63] + "==") : 2 === i && a.push(r[(t = (e[n - 2] << 8) + e[n - 1]) >> 10] + r[t >> 4 & 63] + r[t << 2 & 63] + "="), a.join("")
                };
                for (var r = [], n = [], i = "u" > typeof Uint8Array ? Uint8Array : Array, a = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", o = 0, s = a.length; o < s; ++o) r[o] = a[o], n[a.charCodeAt(o)] = o;

                function u(e) {
                    var t = e.length;
                    if (t % 4 > 0) throw Error("Invalid string. Length must be a multiple of 4");
                    var r = e.indexOf("="); - 1 === r && (r = t);
                    var n = r === t ? 0 : 4 - r % 4;
                    return [r, n]
                }
                n[45] = 62, n[95] = 63
            },
            230: function(e, t, r) {
                "use strict";
                var n = r(872),
                    i = r(321),
                    a = "function" == typeof Symbol && "function" == typeof Symbol.for ? Symbol.for("nodejs.util.inspect.custom") : null;

                function o(e) {
                    if (e > 0x7fffffff) throw RangeError('The value "' + e + '" is invalid for option "size"');
                    var t = new Uint8Array(e);
                    return Object.setPrototypeOf(t, s.prototype), t
                }

                function s(e, t, r) {
                    if ("number" == typeof e) {
                        if ("string" == typeof t) throw TypeError('The "string" argument must be of type string. Received type number');
                        return l(e)
                    }
                    return u(e, t, r)
                }

                function u(e, t, r) {
                    if ("string" == typeof e) {
                        var n = e,
                            i = t;
                        if (("string" != typeof i || "" === i) && (i = "utf8"), !s.isEncoding(i)) throw TypeError("Unknown encoding: " + i);
                        var a = 0 | f(n, i),
                            u = o(a),
                            c = u.write(n, i);
                        return c !== a && (u = u.slice(0, c)), u
                    }
                    if (ArrayBuffer.isView(e)) return d(e);
                    if (null == e) throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type " + typeof e);
                    if (_(e, ArrayBuffer) || e && _(e.buffer, ArrayBuffer) || "u" > typeof SharedArrayBuffer && (_(e, SharedArrayBuffer) || e && _(e.buffer, SharedArrayBuffer))) return function(e, t, r) {
                        var n;
                        if (t < 0 || e.byteLength < t) throw RangeError('"offset" is outside of buffer bounds');
                        if (e.byteLength < t + (r || 0)) throw RangeError('"length" is outside of buffer bounds');
                        return Object.setPrototypeOf(n = void 0 === t && void 0 === r ? new Uint8Array(e) : void 0 === r ? new Uint8Array(e, t) : new Uint8Array(e, t, r), s.prototype), n
                    }(e, t, r);
                    if ("number" == typeof e) throw TypeError('The "value" argument must not be of type number. Received type number');
                    var l = e.valueOf && e.valueOf();
                    if (null != l && l !== e) return s.from(l, t, r);
                    var p = function(e) {
                        if (s.isBuffer(e)) {
                            var t = 0 | h(e.length),
                                r = o(t);
                            return 0 === r.length || e.copy(r, 0, 0, t), r
                        }
                        return void 0 !== e.length ? "number" != typeof e.length || function(e) {
                            return e != e
                        }(e.length) ? o(0) : d(e) : "Buffer" === e.type && Array.isArray(e.data) ? d(e.data) : void 0
                    }(e);
                    if (p) return p;
                    if ("u" > typeof Symbol && null != Symbol.toPrimitive && "function" == typeof e[Symbol.toPrimitive]) return s.from(e[Symbol.toPrimitive]("string"), t, r);
                    throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type " + typeof e)
                }

                function c(e) {
                    if ("number" != typeof e) throw TypeError('"size" argument must be of type number');
                    if (e < 0) throw RangeError('The value "' + e + '" is invalid for option "size"')
                }

                function l(e) {
                    return c(e), o(e < 0 ? 0 : 0 | h(e))
                }

                function d(e) {
                    for (var t = e.length < 0 ? 0 : 0 | h(e.length), r = o(t), n = 0; n < t; n += 1) r[n] = 255 & e[n];
                    return r
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
                }), s.poolSize = 8192, s.from = function(e, t, r) {
                    return u(e, t, r)
                }, Object.setPrototypeOf(s.prototype, Uint8Array.prototype), Object.setPrototypeOf(s, Uint8Array), s.alloc = function(e, t, r) {
                    return (c(e), e <= 0) ? o(e) : void 0 !== t ? "string" == typeof r ? o(e).fill(t, r) : o(e).fill(t) : o(e)
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
                    if (ArrayBuffer.isView(e) || _(e, ArrayBuffer)) return e.byteLength;
                    if ("string" != typeof e) throw TypeError('The "string" argument must be one of type string, Buffer, or ArrayBuffer. Received type ' + typeof e);
                    var r = e.length,
                        n = arguments.length > 2 && !0 === arguments[2];
                    if (!n && 0 === r) return 0;
                    for (var i = !1;;) switch (t) {
                        case "ascii":
                        case "latin1":
                        case "binary":
                            return r;
                        case "utf8":
                        case "utf-8":
                            return E(e).length;
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return 2 * r;
                        case "hex":
                            return r >>> 1;
                        case "base64":
                            return I(e).length;
                        default:
                            if (i) return n ? -1 : E(e).length;
                            t = ("" + t).toLowerCase(), i = !0
                    }
                }

                function p(e, t, r) {
                    var i, a, o, s = !1;
                    if ((void 0 === t || t < 0) && (t = 0), t > this.length || ((void 0 === r || r > this.length) && (r = this.length), r <= 0 || (r >>>= 0) <= (t >>>= 0))) return "";
                    for (e || (e = "utf8");;) switch (e) {
                        case "hex":
                            return function(e, t, r) {
                                var n = e.length;
                                (!t || t < 0) && (t = 0), (!r || r < 0 || r > n) && (r = n);
                                for (var i = "", a = t; a < r; ++a) i += V[e[a]];
                                return i
                            }(this, t, r);
                        case "utf8":
                        case "utf-8":
                            return v(this, t, r);
                        case "ascii":
                            return function(e, t, r) {
                                var n = "";
                                r = Math.min(e.length, r);
                                for (var i = t; i < r; ++i) n += String.fromCharCode(127 & e[i]);
                                return n
                            }(this, t, r);
                        case "latin1":
                        case "binary":
                            return function(e, t, r) {
                                var n = "";
                                r = Math.min(e.length, r);
                                for (var i = t; i < r; ++i) n += String.fromCharCode(e[i]);
                                return n
                            }(this, t, r);
                        case "base64":
                            return i = this, a = t, o = r, 0 === a && o === i.length ? n.fromByteArray(i) : n.fromByteArray(i.slice(a, o));
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return function(e, t, r) {
                                for (var n = e.slice(t, r), i = "", a = 0; a < n.length; a += 2) i += String.fromCharCode(n[a] + 256 * n[a + 1]);
                                return i
                            }(this, t, r);
                        default:
                            if (s) throw TypeError("Unknown encoding: " + e);
                            e = (e + "").toLowerCase(), s = !0
                    }
                }

                function m(e, t, r) {
                    var n = e[t];
                    e[t] = e[r], e[r] = n
                }

                function y(e, t, r, n, i) {
                    var a;
                    if (0 === e.length) return -1;
                    if ("string" == typeof r ? (n = r, r = 0) : r > 0x7fffffff ? r = 0x7fffffff : r < -0x80000000 && (r = -0x80000000), (a = r *= 1) != a && (r = i ? 0 : e.length - 1), r < 0 && (r = e.length + r), r >= e.length)
                        if (i) return -1;
                        else r = e.length - 1;
                    else if (r < 0)
                        if (!i) return -1;
                        else r = 0;
                    if ("string" == typeof t && (t = s.from(t, n)), s.isBuffer(t)) return 0 === t.length ? -1 : g(e, t, r, n, i);
                    if ("number" == typeof t) {
                        if (t &= 255, "function" == typeof Uint8Array.prototype.indexOf)
                            if (i) return Uint8Array.prototype.indexOf.call(e, t, r);
                            else return Uint8Array.prototype.lastIndexOf.call(e, t, r);
                        return g(e, [t], r, n, i)
                    }
                    throw TypeError("val must be string, number or Buffer")
                }

                function g(e, t, r, n, i) {
                    var a, o = 1,
                        s = e.length,
                        u = t.length;
                    if (void 0 !== n && ("ucs2" === (n = String(n).toLowerCase()) || "ucs-2" === n || "utf16le" === n || "utf-16le" === n)) {
                        if (e.length < 2 || t.length < 2) return -1;
                        o = 2, s /= 2, u /= 2, r /= 2
                    }

                    function c(e, t) {
                        return 1 === o ? e[t] : e.readUInt16BE(t * o)
                    }
                    if (i) {
                        var l = -1;
                        for (a = r; a < s; a++)
                            if (c(e, a) === c(t, -1 === l ? 0 : a - l)) {
                                if (-1 === l && (l = a), a - l + 1 === u) return l * o
                            } else - 1 !== l && (a -= a - l), l = -1
                    } else
                        for (r + u > s && (r = s - u), a = r; a >= 0; a--) {
                            for (var d = !0, h = 0; h < u; h++)
                                if (c(e, a + h) !== c(t, h)) {
                                    d = !1;
                                    break
                                } if (d) return a
                        }
                    return -1
                }
                s.isBuffer = function(e) {
                    return null != e && !0 === e._isBuffer && e !== s.prototype
                }, s.compare = function(e, t) {
                    if (_(e, Uint8Array) && (e = s.from(e, e.offset, e.byteLength)), _(t, Uint8Array) && (t = s.from(t, t.offset, t.byteLength)), !s.isBuffer(e) || !s.isBuffer(t)) throw TypeError('The "buf1", "buf2" arguments must be one of type Buffer or Uint8Array');
                    if (e === t) return 0;
                    for (var r = e.length, n = t.length, i = 0, a = Math.min(r, n); i < a; ++i)
                        if (e[i] !== t[i]) {
                            r = e[i], n = t[i];
                            break
                        } return r < n ? -1 : +(n < r)
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
                        for (r = 0, t = 0; r < e.length; ++r) t += e[r].length;
                    var r, n = s.allocUnsafe(t),
                        i = 0;
                    for (r = 0; r < e.length; ++r) {
                        var a = e[r];
                        if (_(a, Uint8Array) && (a = s.from(a)), !s.isBuffer(a)) throw TypeError('"list" argument must be an Array of Buffers');
                        a.copy(n, i), i += a.length
                    }
                    return n
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
                    return 0 === e ? "" : 0 == arguments.length ? v(this, 0, e) : p.apply(this, arguments)
                }, s.prototype.toLocaleString = s.prototype.toString, s.prototype.equals = function(e) {
                    if (!s.isBuffer(e)) throw TypeError("Argument must be a Buffer");
                    return this === e || 0 === s.compare(this, e)
                }, s.prototype.inspect = function() {
                    var e = "",
                        r = t.INSPECT_MAX_BYTES;
                    return e = this.toString("hex", 0, r).replace(/(.{2})/g, "$1 ").trim(), this.length > r && (e += " ... "), "<Buffer " + e + ">"
                }, a && (s.prototype[a] = s.prototype.inspect), s.prototype.compare = function(e, t, r, n, i) {
                    if (_(e, Uint8Array) && (e = s.from(e, e.offset, e.byteLength)), !s.isBuffer(e)) throw TypeError('The "target" argument must be one of type Buffer or Uint8Array. Received type ' + typeof e);
                    if (void 0 === t && (t = 0), void 0 === r && (r = e ? e.length : 0), void 0 === n && (n = 0), void 0 === i && (i = this.length), t < 0 || r > e.length || n < 0 || i > this.length) throw RangeError("out of range index");
                    if (n >= i && t >= r) return 0;
                    if (n >= i) return -1;
                    if (t >= r) return 1;
                    if (t >>>= 0, r >>>= 0, n >>>= 0, i >>>= 0, this === e) return 0;
                    for (var a = i - n, o = r - t, u = Math.min(a, o), c = this.slice(n, i), l = e.slice(t, r), d = 0; d < u; ++d)
                        if (c[d] !== l[d]) {
                            a = c[d], o = l[d];
                            break
                        } return a < o ? -1 : +(o < a)
                }, s.prototype.includes = function(e, t, r) {
                    return -1 !== this.indexOf(e, t, r)
                }, s.prototype.indexOf = function(e, t, r) {
                    return y(this, e, t, r, !0)
                }, s.prototype.lastIndexOf = function(e, t, r) {
                    return y(this, e, t, r, !1)
                };

                function v(e, t, r) {
                    r = Math.min(e.length, r);
                    for (var n = [], i = t; i < r;) {
                        var a, o, s, u, c = e[i],
                            l = null,
                            d = c > 239 ? 4 : c > 223 ? 3 : c > 191 ? 2 : 1;
                        if (i + d <= r) switch (d) {
                            case 1:
                                c < 128 && (l = c);
                                break;
                            case 2:
                                (192 & (a = e[i + 1])) == 128 && (u = (31 & c) << 6 | 63 & a) > 127 && (l = u);
                                break;
                            case 3:
                                a = e[i + 1], o = e[i + 2], (192 & a) == 128 && (192 & o) == 128 && (u = (15 & c) << 12 | (63 & a) << 6 | 63 & o) > 2047 && (u < 55296 || u > 57343) && (l = u);
                                break;
                            case 4:
                                a = e[i + 1], o = e[i + 2], s = e[i + 3], (192 & a) == 128 && (192 & o) == 128 && (192 & s) == 128 && (u = (15 & c) << 18 | (63 & a) << 12 | (63 & o) << 6 | 63 & s) > 65535 && u < 1114112 && (l = u)
                        }
                        null === l ? (l = 65533, d = 1) : l > 65535 && (l -= 65536, n.push(l >>> 10 & 1023 | 55296), l = 56320 | 1023 & l), n.push(l), i += d
                    }
                    var h = n,
                        f = h.length;
                    if (f <= 4096) return String.fromCharCode.apply(String, h);
                    for (var p = "", m = 0; m < f;) p += String.fromCharCode.apply(String, h.slice(m, m += 4096));
                    return p
                }

                function b(e, t, r) {
                    if (e % 1 != 0 || e < 0) throw RangeError("offset is not uint");
                    if (e + t > r) throw RangeError("Trying to access beyond buffer length")
                }

                function A(e, t, r, n, i, a) {
                    if (!s.isBuffer(e)) throw TypeError('"buffer" argument must be a Buffer instance');
                    if (t > i || t < a) throw RangeError('"value" argument is out of bounds');
                    if (r + n > e.length) throw RangeError("Index out of range")
                }

                function D(e, t, r, n, i, a) {
                    if (r + n > e.length || r < 0) throw RangeError("Index out of range")
                }

                function C(e, t, r, n, a) {
                    return t *= 1, r >>>= 0, a || D(e, t, r, 4, 34028234663852886e22, -34028234663852886e22), i.write(e, t, r, n, 23, 4), r + 4
                }

                function w(e, t, r, n, a) {
                    return t *= 1, r >>>= 0, a || D(e, t, r, 8, 17976931348623157e292, -17976931348623157e292), i.write(e, t, r, n, 52, 8), r + 8
                }
                s.prototype.write = function(e, t, r, n) {
                    if (void 0 === t) n = "utf8", r = this.length, t = 0;
                    else if (void 0 === r && "string" == typeof t) n = t, r = this.length, t = 0;
                    else if (isFinite(t)) t >>>= 0, isFinite(r) ? (r >>>= 0, void 0 === n && (n = "utf8")) : (n = r, r = void 0);
                    else throw Error("Buffer.write(string, encoding, offset[, length]) is no longer supported");
                    var i, a, o, s, u, c, l, d, h = this.length - t;
                    if ((void 0 === r || r > h) && (r = h), e.length > 0 && (r < 0 || t < 0) || t > this.length) throw RangeError("Attempt to write outside buffer bounds");
                    n || (n = "utf8");
                    for (var f = !1;;) switch (n) {
                        case "hex":
                            return function(e, t, r, n) {
                                r = Number(r) || 0;
                                var i = e.length - r;
                                n ? (n = Number(n)) > i && (n = i) : n = i;
                                var a = t.length;
                                n > a / 2 && (n = a / 2);
                                for (var o = 0; o < n; ++o) {
                                    var s, u = parseInt(t.substr(2 * o, 2), 16);
                                    if ((s = u) != s) break;
                                    e[r + o] = u
                                }
                                return o
                            }(this, e, t, r);
                        case "utf8":
                        case "utf-8":
                            return i = t, a = r, R(E(e, this.length - i), this, i, a);
                        case "ascii":
                            return o = t, s = r, R(S(e), this, o, s);
                        case "latin1":
                        case "binary":
                            return function(e, t, r, n) {
                                return R(S(t), e, r, n)
                            }(this, e, t, r);
                        case "base64":
                            return u = t, c = r, R(I(e), this, u, c);
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return l = t, d = r, R(function(e, t) {
                                for (var r, n, i = [], a = 0; a < e.length && !((t -= 2) < 0); ++a) n = (r = e.charCodeAt(a)) >> 8, i.push(r % 256), i.push(n);
                                return i
                            }(e, this.length - l), this, l, d);
                        default:
                            if (f) throw TypeError("Unknown encoding: " + n);
                            n = ("" + n).toLowerCase(), f = !0
                    }
                }, s.prototype.toJSON = function() {
                    return {
                        type: "Buffer",
                        data: Array.prototype.slice.call(this._arr || this, 0)
                    }
                }, s.prototype.slice = function(e, t) {
                    var r = this.length;
                    e = ~~e, t = void 0 === t ? r : ~~t, e < 0 ? (e += r) < 0 && (e = 0) : e > r && (e = r), t < 0 ? (t += r) < 0 && (t = 0) : t > r && (t = r), t < e && (t = e);
                    var n = this.subarray(e, t);
                    return Object.setPrototypeOf(n, s.prototype), n
                }, s.prototype.readUIntLE = function(e, t, r) {
                    e >>>= 0, t >>>= 0, r || b(e, t, this.length);
                    for (var n = this[e], i = 1, a = 0; ++a < t && (i *= 256);) n += this[e + a] * i;
                    return n
                }, s.prototype.readUIntBE = function(e, t, r) {
                    e >>>= 0, t >>>= 0, r || b(e, t, this.length);
                    for (var n = this[e + --t], i = 1; t > 0 && (i *= 256);) n += this[e + --t] * i;
                    return n
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
                }, s.prototype.readIntLE = function(e, t, r) {
                    e >>>= 0, t >>>= 0, r || b(e, t, this.length);
                    for (var n = this[e], i = 1, a = 0; ++a < t && (i *= 256);) n += this[e + a] * i;
                    return n >= (i *= 128) && (n -= Math.pow(2, 8 * t)), n
                }, s.prototype.readIntBE = function(e, t, r) {
                    e >>>= 0, t >>>= 0, r || b(e, t, this.length);
                    for (var n = t, i = 1, a = this[e + --n]; n > 0 && (i *= 256);) a += this[e + --n] * i;
                    return a >= (i *= 128) && (a -= Math.pow(2, 8 * t)), a
                }, s.prototype.readInt8 = function(e, t) {
                    return (e >>>= 0, t || b(e, 1, this.length), 128 & this[e]) ? -((255 - this[e] + 1) * 1) : this[e]
                }, s.prototype.readInt16LE = function(e, t) {
                    e >>>= 0, t || b(e, 2, this.length);
                    var r = this[e] | this[e + 1] << 8;
                    return 32768 & r ? 0xffff0000 | r : r
                }, s.prototype.readInt16BE = function(e, t) {
                    e >>>= 0, t || b(e, 2, this.length);
                    var r = this[e + 1] | this[e] << 8;
                    return 32768 & r ? 0xffff0000 | r : r
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
                }, s.prototype.writeUIntLE = function(e, t, r, n) {
                    if (e *= 1, t >>>= 0, r >>>= 0, !n) {
                        var i = Math.pow(2, 8 * r) - 1;
                        A(this, e, t, r, i, 0)
                    }
                    var a = 1,
                        o = 0;
                    for (this[t] = 255 & e; ++o < r && (a *= 256);) this[t + o] = e / a & 255;
                    return t + r
                }, s.prototype.writeUIntBE = function(e, t, r, n) {
                    if (e *= 1, t >>>= 0, r >>>= 0, !n) {
                        var i = Math.pow(2, 8 * r) - 1;
                        A(this, e, t, r, i, 0)
                    }
                    var a = r - 1,
                        o = 1;
                    for (this[t + a] = 255 & e; --a >= 0 && (o *= 256);) this[t + a] = e / o & 255;
                    return t + r
                }, s.prototype.writeUInt8 = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || A(this, e, t, 1, 255, 0), this[t] = 255 & e, t + 1
                }, s.prototype.writeUInt16LE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || A(this, e, t, 2, 65535, 0), this[t] = 255 & e, this[t + 1] = e >>> 8, t + 2
                }, s.prototype.writeUInt16BE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || A(this, e, t, 2, 65535, 0), this[t] = e >>> 8, this[t + 1] = 255 & e, t + 2
                }, s.prototype.writeUInt32LE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || A(this, e, t, 4, 0xffffffff, 0), this[t + 3] = e >>> 24, this[t + 2] = e >>> 16, this[t + 1] = e >>> 8, this[t] = 255 & e, t + 4
                }, s.prototype.writeUInt32BE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || A(this, e, t, 4, 0xffffffff, 0), this[t] = e >>> 24, this[t + 1] = e >>> 16, this[t + 2] = e >>> 8, this[t + 3] = 255 & e, t + 4
                }, s.prototype.writeIntLE = function(e, t, r, n) {
                    if (e *= 1, t >>>= 0, !n) {
                        var i = Math.pow(2, 8 * r - 1);
                        A(this, e, t, r, i - 1, -i)
                    }
                    var a = 0,
                        o = 1,
                        s = 0;
                    for (this[t] = 255 & e; ++a < r && (o *= 256);) e < 0 && 0 === s && 0 !== this[t + a - 1] && (s = 1), this[t + a] = (e / o | 0) - s & 255;
                    return t + r
                }, s.prototype.writeIntBE = function(e, t, r, n) {
                    if (e *= 1, t >>>= 0, !n) {
                        var i = Math.pow(2, 8 * r - 1);
                        A(this, e, t, r, i - 1, -i)
                    }
                    var a = r - 1,
                        o = 1,
                        s = 0;
                    for (this[t + a] = 255 & e; --a >= 0 && (o *= 256);) e < 0 && 0 === s && 0 !== this[t + a + 1] && (s = 1), this[t + a] = (e / o | 0) - s & 255;
                    return t + r
                }, s.prototype.writeInt8 = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || A(this, e, t, 1, 127, -128), e < 0 && (e = 255 + e + 1), this[t] = 255 & e, t + 1
                }, s.prototype.writeInt16LE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || A(this, e, t, 2, 32767, -32768), this[t] = 255 & e, this[t + 1] = e >>> 8, t + 2
                }, s.prototype.writeInt16BE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || A(this, e, t, 2, 32767, -32768), this[t] = e >>> 8, this[t + 1] = 255 & e, t + 2
                }, s.prototype.writeInt32LE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || A(this, e, t, 4, 0x7fffffff, -0x80000000), this[t] = 255 & e, this[t + 1] = e >>> 8, this[t + 2] = e >>> 16, this[t + 3] = e >>> 24, t + 4
                }, s.prototype.writeInt32BE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || A(this, e, t, 4, 0x7fffffff, -0x80000000), e < 0 && (e = 0xffffffff + e + 1), this[t] = e >>> 24, this[t + 1] = e >>> 16, this[t + 2] = e >>> 8, this[t + 3] = 255 & e, t + 4
                }, s.prototype.writeFloatLE = function(e, t, r) {
                    return C(this, e, t, !0, r)
                }, s.prototype.writeFloatBE = function(e, t, r) {
                    return C(this, e, t, !1, r)
                }, s.prototype.writeDoubleLE = function(e, t, r) {
                    return w(this, e, t, !0, r)
                }, s.prototype.writeDoubleBE = function(e, t, r) {
                    return w(this, e, t, !1, r)
                }, s.prototype.copy = function(e, t, r, n) {
                    if (!s.isBuffer(e)) throw TypeError("argument should be a Buffer");
                    if (r || (r = 0), n || 0 === n || (n = this.length), t >= e.length && (t = e.length), t || (t = 0), n > 0 && n < r && (n = r), n === r || 0 === e.length || 0 === this.length) return 0;
                    if (t < 0) throw RangeError("targetStart out of bounds");
                    if (r < 0 || r >= this.length) throw RangeError("Index out of range");
                    if (n < 0) throw RangeError("sourceEnd out of bounds");
                    n > this.length && (n = this.length), e.length - t < n - r && (n = e.length - t + r);
                    var i = n - r;
                    if (this === e && "function" == typeof Uint8Array.prototype.copyWithin) this.copyWithin(t, r, n);
                    else if (this === e && r < t && t < n)
                        for (var a = i - 1; a >= 0; --a) e[a + t] = this[a + r];
                    else Uint8Array.prototype.set.call(e, this.subarray(r, n), t);
                    return i
                }, s.prototype.fill = function(e, t, r, n) {
                    if ("string" == typeof e) {
                        if ("string" == typeof t ? (n = t, t = 0, r = this.length) : "string" == typeof r && (n = r, r = this.length), void 0 !== n && "string" != typeof n) throw TypeError("encoding must be a string");
                        if ("string" == typeof n && !s.isEncoding(n)) throw TypeError("Unknown encoding: " + n);
                        if (1 === e.length) {
                            var i, a = e.charCodeAt(0);
                            ("utf8" === n && a < 128 || "latin1" === n) && (e = a)
                        }
                    } else "number" == typeof e ? e &= 255 : "boolean" == typeof e && (e = Number(e));
                    if (t < 0 || this.length < t || this.length < r) throw RangeError("Out of range index");
                    if (r <= t) return this;
                    if (t >>>= 0, r = void 0 === r ? this.length : r >>> 0, e || (e = 0), "number" == typeof e)
                        for (i = t; i < r; ++i) this[i] = e;
                    else {
                        var o = s.isBuffer(e) ? e : s.from(e, n),
                            u = o.length;
                        if (0 === u) throw TypeError('The value "' + e + '" is invalid for argument "value"');
                        for (i = 0; i < r - t; ++i) this[i + t] = o[i % u]
                    }
                    return this
                };
                var T = /[^+/0-9A-Za-z-_]/g;

                function E(e, t) {
                    t = t || 1 / 0;
                    for (var r, n = e.length, i = null, a = [], o = 0; o < n; ++o) {
                        if ((r = e.charCodeAt(o)) > 55295 && r < 57344) {
                            if (!i) {
                                if (r > 56319 || o + 1 === n) {
                                    (t -= 3) > -1 && a.push(239, 191, 189);
                                    continue
                                }
                                i = r;
                                continue
                            }
                            if (r < 56320) {
                                (t -= 3) > -1 && a.push(239, 191, 189), i = r;
                                continue
                            }
                            r = (i - 55296 << 10 | r - 56320) + 65536
                        } else i && (t -= 3) > -1 && a.push(239, 191, 189);
                        if (i = null, r < 128) {
                            if ((t -= 1) < 0) break;
                            a.push(r)
                        } else if (r < 2048) {
                            if ((t -= 2) < 0) break;
                            a.push(r >> 6 | 192, 63 & r | 128)
                        } else if (r < 65536) {
                            if ((t -= 3) < 0) break;
                            a.push(r >> 12 | 224, r >> 6 & 63 | 128, 63 & r | 128)
                        } else if (r < 1114112) {
                            if ((t -= 4) < 0) break;
                            a.push(r >> 18 | 240, r >> 12 & 63 | 128, r >> 6 & 63 | 128, 63 & r | 128)
                        } else throw Error("Invalid code point")
                    }
                    return a
                }

                function S(e) {
                    for (var t = [], r = 0; r < e.length; ++r) t.push(255 & e.charCodeAt(r));
                    return t
                }

                function I(e) {
                    return n.toByteArray(function(e) {
                        if ((e = (e = e.split("=")[0]).trim().replace(T, "")).length < 2) return "";
                        for (; e.length % 4 != 0;) e += "=";
                        return e
                    }(e))
                }

                function R(e, t, r, n) {
                    for (var i = 0; i < n && !(i + r >= t.length) && !(i >= e.length); ++i) t[i + r] = e[i];
                    return i
                }

                function _(e, t) {
                    return e instanceof t || null != e && null != e.constructor && null != e.constructor.name && e.constructor.name === t.name
                }
                var V = function() {
                    for (var e = "0123456789abcdef", t = Array(256), r = 0; r < 16; ++r)
                        for (var n = 16 * r, i = 0; i < 16; ++i) t[n + i] = e[r] + e[i];
                    return t
                }()
            },
            321: function(e, t) {
                t.read = function(e, t, r, n, i) {
                    var a, o, s = 8 * i - n - 1,
                        u = (1 << s) - 1,
                        c = u >> 1,
                        l = -7,
                        d = r ? i - 1 : 0,
                        h = r ? -1 : 1,
                        f = e[t + d];
                    for (d += h, a = f & (1 << -l) - 1, f >>= -l, l += s; l > 0; a = 256 * a + e[t + d], d += h, l -= 8);
                    for (o = a & (1 << -l) - 1, a >>= -l, l += n; l > 0; o = 256 * o + e[t + d], d += h, l -= 8);
                    if (0 === a) a = 1 - c;
                    else {
                        if (a === u) return o ? NaN : 1 / 0 * (f ? -1 : 1);
                        o += Math.pow(2, n), a -= c
                    }
                    return (f ? -1 : 1) * o * Math.pow(2, a - n)
                }, t.write = function(e, t, r, n, i, a) {
                    var o, s, u, c = 8 * a - i - 1,
                        l = (1 << c) - 1,
                        d = l >> 1,
                        h = 5960464477539062e-23 * (23 === i),
                        f = n ? 0 : a - 1,
                        p = n ? 1 : -1,
                        m = +(t < 0 || 0 === t && 1 / t < 0);
                    for (isNaN(t = Math.abs(t)) || t === 1 / 0 ? (s = +!!isNaN(t), o = l) : (o = Math.floor(Math.log(t) / Math.LN2), t * (u = Math.pow(2, -o)) < 1 && (o--, u *= 2), o + d >= 1 ? t += h / u : t += h * Math.pow(2, 1 - d), t * u >= 2 && (o++, u /= 2), o + d >= l ? (s = 0, o = l) : o + d >= 1 ? (s = (t * u - 1) * Math.pow(2, i), o += d) : (s = t * Math.pow(2, d - 1) * Math.pow(2, i), o = 0)); i >= 8; e[r + f] = 255 & s, f += p, s /= 256, i -= 8);
                    for (o = o << i | s, c += i; c > 0; e[r + f] = 255 & o, f += p, o /= 256, c -= 8);
                    e[r + f - p] |= 128 * m
                }
            }
        },
        i = {};

    function a(e) {
        var t = i[e];
        if (void 0 !== t) return t.exports;
        var r = i[e] = {
                exports: {}
            },
            o = !0;
        try {
            n[e](r, r.exports, a), o = !1
        } finally {
            o && delete i[e]
        }
        return r.exports
    }
    a.ab = "/ROOT/node_modules/.pnpm/next@16.3.0_@babel+core@7.29.0_supports-color@8.1.1__@opentelemetry+api@1.9.1_@playwrig_2bf1aa2500abc393a8e8c0b283d26d6e/node_modules/next/dist/compiled/buffer/", t.exports = a(230)
}]);

//# debugId=5bb06c68-0651-4f30-27bc-b7af82458a5b
//# sourceMappingURL=2kg5tubmj842m.js.map