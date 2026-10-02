;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "8a3b2759-39d4-a96e-eb70-42d1096e275e")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 805386, e => {
    "use strict";
    e.s(["MAX_TABLE_METRIC_COLUMNS", 0, 8])
}, 545154, 456954, 726023, e => {
    "use strict";
    var t = e.i(31611),
        r = e.i(739167),
        n = e.i(448321),
        a = e.i(927868),
        i = e.i(908374),
        o = e.i(836047),
        s = {},
        c = function(e, t, r, n, a) {
            var i = new Worker(s[t] || (s[t] = URL.createObjectURL(new Blob([e + ';addEventListener("error",function(e){e=e.error;postMessage({$e$:[e.message,e.code,e.stack]})})'], {
                type: "text/javascript"
            }))));
            return i.onmessage = function(e) {
                var t = e.data,
                    r = t.$e$;
                if (r) {
                    var n = Error(r[0]);
                    n.code = r[1], n.stack = r[2], a(n, null)
                } else a(null, t)
            }, i.postMessage(r, n), i
        },
        u = Uint8Array,
        l = Uint16Array,
        d = Int32Array,
        h = new u([0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 0, 0, 0, 0]),
        m = new u([0, 0, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11, 11, 12, 12, 13, 13, 0, 0]),
        p = new u([16, 17, 18, 0, 8, 7, 9, 6, 10, 5, 11, 4, 12, 3, 13, 2, 14, 1, 15]),
        f = function(e, t) {
            for (var r = new l(31), n = 0; n < 31; ++n) r[n] = t += 1 << e[n - 1];
            for (var a = new d(r[30]), n = 1; n < 30; ++n)
                for (var i = r[n]; i < r[n + 1]; ++i) a[i] = i - r[n] << 5 | n;
            return {
                b: r,
                r: a
            }
        },
        y = f(h, 2),
        g = y.b,
        v = y.r;
    g[28] = 258, v[258] = 28;
    for (var b = f(m, 0), A = b.b, D = b.r, C = new l(32768), w = 0; w < 32768; ++w) {
        var T = (43690 & w) >> 1 | (21845 & w) << 1;
        T = (61680 & (T = (52428 & T) >> 2 | (13107 & T) << 2)) >> 4 | (3855 & T) << 4, C[w] = ((65280 & T) >> 8 | (255 & T) << 8) >> 1
    }
    for (var S = function(e, t, r) {
            for (var n, a = e.length, i = 0, o = new l(t); i < a; ++i) e[i] && ++o[e[i] - 1];
            var s = new l(t);
            for (i = 1; i < t; ++i) s[i] = s[i - 1] + o[i - 1] << 1;
            if (r) {
                n = new l(1 << t);
                var c = 15 - t;
                for (i = 0; i < a; ++i)
                    if (e[i])
                        for (var u = i << 4 | e[i], d = t - e[i], h = s[e[i] - 1]++ << d, m = h | (1 << d) - 1; h <= m; ++h) n[C[h] >> c] = u
            } else
                for (n = new l(a), i = 0; i < a; ++i) e[i] && (n[i] = C[s[e[i] - 1]++] >> 15 - e[i]);
            return n
        }, E = new u(288), w = 0; w < 144; ++w) E[w] = 8;
    for (var w = 144; w < 256; ++w) E[w] = 9;
    for (var w = 256; w < 280; ++w) E[w] = 7;
    for (var w = 280; w < 288; ++w) E[w] = 8;
    for (var I = new u(32), w = 0; w < 32; ++w) I[w] = 5;
    var R = S(E, 9, 0),
        _ = S(E, 9, 1),
        V = S(I, 5, 0),
        O = S(I, 5, 1),
        N = function(e) {
            for (var t = e[0], r = 1; r < e.length; ++r) e[r] > t && (t = e[r]);
            return t
        },
        U = function(e, t, r) {
            var n = t / 8 | 0;
            return (e[n] | e[n + 1] << 8) >> (7 & t) & r
        },
        M = function(e, t) {
            var r = t / 8 | 0;
            return (e[r] | e[r + 1] << 8 | e[r + 2] << 16) >> (7 & t)
        },
        P = function(e) {
            return (e + 7) / 8 | 0
        },
        k = function(e, t, r) {
            return (null == t || t < 0) && (t = 0), (null == r || r > e.length) && (r = e.length), new u(e.subarray(t, r))
        },
        x = ["unexpected EOF", "invalid block type", "invalid length/literal", "invalid distance", "stream finished", "no stream handler", , "no callback", "invalid UTF-8 data", "extra field too long", "date not in range 1980-2099", "filename too long", "stream finishing", "invalid zip data"],
        B = function(e, t, r) {
            var n = Error(t || x[e]);
            if (n.code = e, Error.captureStackTrace && Error.captureStackTrace(n, B), !r) throw n;
            return n
        },
        L = function(e, t, r, n) {
            var a = e.length,
                i = n ? n.length : 0;
            if (!a || t.f && !t.l) return r || new u(0);
            var o = !r,
                s = o || 2 != t.i,
                c = t.i;
            o && (r = new u(3 * a));
            var l = function(e) {
                    var t = r.length;
                    if (e > t) {
                        var n = new u(Math.max(2 * t, e));
                        n.set(r), r = n
                    }
                },
                d = t.f || 0,
                f = t.p || 0,
                y = t.b || 0,
                v = t.l,
                b = t.d,
                D = t.m,
                C = t.n,
                w = 8 * a;
            do {
                if (!v) {
                    d = U(e, f, 1);
                    var T = U(e, f + 1, 3);
                    if (f += 3, T)
                        if (1 == T) v = _, b = O, D = 9, C = 5;
                        else if (2 == T) {
                        var E = U(e, f, 31) + 257,
                            I = U(e, f + 10, 15) + 4,
                            R = E + U(e, f + 5, 31) + 1;
                        f += 14;
                        for (var V = new u(R), x = new u(19), L = 0; L < I; ++L) x[p[L]] = U(e, f + 3 * L, 7);
                        f += 3 * I;
                        for (var Q = N(x), H = (1 << Q) - 1, G = S(x, Q, 1), L = 0; L < R;) {
                            var K = G[U(e, f, H)];
                            f += 15 & K;
                            var F = K >> 4;
                            if (F < 16) V[L++] = F;
                            else {
                                var j = 0,
                                    z = 0;
                                for (16 == F ? (z = 3 + U(e, f, 3), f += 2, j = V[L - 1]) : 17 == F ? (z = 3 + U(e, f, 7), f += 3) : 18 == F && (z = 11 + U(e, f, 127), f += 7); z--;) V[L++] = j
                            }
                        }
                        var q = V.subarray(0, E),
                            Y = V.subarray(E);
                        D = N(q), C = N(Y), v = S(q, D, 1), b = S(Y, C, 1)
                    } else B(1);
                    else {
                        var F = P(f) + 4,
                            W = e[F - 4] | e[F - 3] << 8,
                            X = F + W;
                        if (X > a) {
                            c && B(0);
                            break
                        }
                        s && l(y + W), r.set(e.subarray(F, X), y), t.b = y += W, t.p = f = 8 * X, t.f = d;
                        continue
                    }
                    if (f > w) {
                        c && B(0);
                        break
                    }
                }
                s && l(y + 131072);
                for (var $ = (1 << D) - 1, J = (1 << C) - 1, Z = f;; Z = f) {
                    var j = v[M(e, f) & $],
                        ee = j >> 4;
                    if ((f += 15 & j) > w) {
                        c && B(0);
                        break
                    }
                    if (j || B(2), ee < 256) r[y++] = ee;
                    else if (256 == ee) {
                        Z = f, v = null;
                        break
                    } else {
                        var et = ee - 254;
                        if (ee > 264) {
                            var L = ee - 257,
                                er = h[L];
                            et = U(e, f, (1 << er) - 1) + g[L], f += er
                        }
                        var en = b[M(e, f) & J],
                            ea = en >> 4;
                        en || B(3), f += 15 & en;
                        var Y = A[ea];
                        if (ea > 3) {
                            var er = m[ea];
                            Y += M(e, f) & (1 << er) - 1, f += er
                        }
                        if (f > w) {
                            c && B(0);
                            break
                        }
                        s && l(y + 131072);
                        var ei = y + et;
                        if (y < Y) {
                            var eo = i - Y,
                                es = Math.min(Y, ei);
                            for (eo + y < 0 && B(3); y < es; ++y) r[y] = n[eo + y]
                        }
                        for (; y < ei; ++y) r[y] = r[y - Y]
                    }
                }
                t.l = v, t.p = Z, t.b = y, t.f = d, v && (d = 1, t.m = D, t.d = b, t.n = C)
            } while (!d) return y != r.length && o ? k(r, 0, y) : r.subarray(0, y)
        },
        Q = function(e, t, r) {
            r <<= 7 & t;
            var n = t / 8 | 0;
            e[n] |= r, e[n + 1] |= r >> 8
        },
        H = function(e, t, r) {
            r <<= 7 & t;
            var n = t / 8 | 0;
            e[n] |= r, e[n + 1] |= r >> 8, e[n + 2] |= r >> 16
        },
        G = function(e, t) {
            for (var r = [], n = 0; n < e.length; ++n) e[n] && r.push({
                s: n,
                f: e[n]
            });
            var a = r.length,
                i = r.slice();
            if (!a) return {
                t: W,
                l: 0
            };
            if (1 == a) {
                var o = new u(r[0].s + 1);
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
                c = r[1],
                d = 0,
                h = 1,
                m = 2;
            for (r[0] = {
                    s: -1,
                    f: s.f + c.f,
                    l: s,
                    r: c
                }; h != a - 1;) s = r[r[d].f < r[m].f ? d++ : m++], c = r[d != h && r[d].f < r[m].f ? d++ : m++], r[h++] = {
                s: -1,
                f: s.f + c.f,
                l: s,
                r: c
            };
            for (var p = i[0].s, n = 1; n < a; ++n) i[n].s > p && (p = i[n].s);
            var f = new l(p + 1),
                y = K(r[h - 1], f, 0);
            if (y > t) {
                var n = 0,
                    g = 0,
                    v = y - t,
                    b = 1 << v;
                for (i.sort(function(e, t) {
                        return f[t.s] - f[e.s] || e.f - t.f
                    }); n < a; ++n) {
                    var A = i[n].s;
                    if (f[A] > t) g += b - (1 << y - f[A]), f[A] = t;
                    else break
                }
                for (g >>= v; g > 0;) {
                    var D = i[n].s;
                    f[D] < t ? g -= 1 << t - f[D]++ - 1 : ++n
                }
                for (; n >= 0 && g; --n) {
                    var C = i[n].s;
                    f[C] == t && (--f[C], ++g)
                }
                y = t
            }
            return {
                t: new u(f),
                l: y
            }
        },
        K = function(e, t, r) {
            return -1 == e.s ? Math.max(K(e.l, t, r + 1), K(e.r, t, r + 1)) : t[e.s] = r
        },
        F = function(e) {
            for (var t = e.length; t && !e[--t];);
            for (var r = new l(++t), n = 0, a = e[0], i = 1, o = function(e) {
                    r[n++] = e
                }, s = 1; s <= t; ++s)
                if (e[s] == a && s != t) ++i;
                else {
                    if (!a && i > 2) {
                        for (; i > 138; i -= 138) o(32754);
                        i > 2 && (o(i > 10 ? i - 11 << 5 | 28690 : i - 3 << 5 | 12305), i = 0)
                    } else if (i > 3) {
                        for (o(a), --i; i > 6; i -= 6) o(8304);
                        i > 2 && (o(i - 3 << 5 | 8208), i = 0)
                    }
                    for (; i--;) o(a);
                    i = 1, a = e[s]
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
                a = P(t + 2);
            e[a] = 255 & n, e[a + 1] = n >> 8, e[a + 2] = 255 ^ e[a], e[a + 3] = 255 ^ e[a + 1];
            for (var i = 0; i < n; ++i) e[a + i + 4] = r[i];
            return (a + 4 + n) * 8
        },
        q = function(e, t, r, n, a, i, o, s, c, u, d) {
            Q(t, d++, r), ++a[256];
            for (var f, y, g, v, b = G(a, 15), A = b.t, D = b.l, C = G(i, 15), w = C.t, T = C.l, _ = F(A), O = _.c, N = _.n, U = F(w), M = U.c, P = U.n, k = new l(19), x = 0; x < O.length; ++x) ++k[31 & O[x]];
            for (var x = 0; x < M.length; ++x) ++k[31 & M[x]];
            for (var B = G(k, 7), L = B.t, K = B.l, q = 19; q > 4 && !L[p[q - 1]]; --q);
            var Y = u + 5 << 3,
                W = j(a, E) + j(i, I) + o,
                X = j(a, A) + j(i, w) + o + 14 + 3 * q + j(k, L) + 2 * k[16] + 3 * k[17] + 7 * k[18];
            if (c >= 0 && Y <= W && Y <= X) return z(t, d, e.subarray(c, c + u));
            if (Q(t, d, 1 + (X < W)), d += 2, X < W) {
                f = S(A, D, 0), y = A, g = S(w, T, 0), v = w;
                var $ = S(L, K, 0);
                Q(t, d, N - 257), Q(t, d + 5, P - 1), Q(t, d + 10, q - 4), d += 14;
                for (var x = 0; x < q; ++x) Q(t, d + 3 * x, L[p[x]]);
                d += 3 * q;
                for (var J = [O, M], Z = 0; Z < 2; ++Z)
                    for (var ee = J[Z], x = 0; x < ee.length; ++x) {
                        var et = 31 & ee[x];
                        Q(t, d, $[et]), d += L[et], et > 15 && (Q(t, d, ee[x] >> 5 & 127), d += ee[x] >> 12)
                    }
            } else f = R, y = E, g = V, v = I;
            for (var x = 0; x < s; ++x) {
                var er = n[x];
                if (er > 255) {
                    var et = er >> 18 & 31;
                    H(t, d, f[et + 257]), d += y[et + 257], et > 7 && (Q(t, d, er >> 23 & 31), d += h[et]);
                    var en = 31 & er;
                    H(t, d, g[en]), d += v[en], en > 3 && (H(t, d, er >> 5 & 8191), d += m[en])
                } else H(t, d, f[er]), d += y[er]
            }
            return H(t, d, f[256]), d + y[256]
        },
        Y = new d([65540, 131080, 131088, 131104, 262176, 1048704, 1048832, 2114560, 2117632]),
        W = new u(0),
        X = function(e, t, r, n, a, i) {
            var o = i.z || e.length,
                s = new u(n + o + 5 * (1 + Math.ceil(o / 7e3)) + a),
                c = s.subarray(n, s.length - a),
                p = i.l,
                f = 7 & (i.r || 0);
            if (t) {
                f && (c[0] = i.r >> 3);
                for (var y = Y[t - 1], g = y >> 13, b = 8191 & y, A = (1 << r) - 1, C = i.p || new l(32768), w = i.h || new l(A + 1), T = Math.ceil(r / 3), S = 2 * T, E = function(t) {
                        return (e[t] ^ e[t + 1] << T ^ e[t + 2] << S) & A
                    }, I = new d(25e3), R = new l(288), _ = new l(32), V = 0, O = 0, N = i.i || 0, U = 0, M = i.w || 0, x = 0; N + 2 < o; ++N) {
                    var B = E(N),
                        L = 32767 & N,
                        Q = w[B];
                    if (C[L] = Q, w[B] = L, M <= N) {
                        var H = o - N;
                        if ((V > 7e3 || U > 24576) && (H > 423 || !p)) {
                            f = q(e, c, 0, I, R, _, O, U, x, N - x, f), U = V = O = 0, x = N;
                            for (var G = 0; G < 286; ++G) R[G] = 0;
                            for (var G = 0; G < 30; ++G) _[G] = 0
                        }
                        var K = 2,
                            F = 0,
                            j = b,
                            W = L - Q & 32767;
                        if (H > 2 && B == E(N - W))
                            for (var X = Math.min(g, H) - 1, $ = Math.min(32767, N), J = Math.min(258, H); W <= $ && --j && L != Q;) {
                                if (e[N + K] == e[N + K - W]) {
                                    for (var Z = 0; Z < J && e[N + Z] == e[N + Z - W]; ++Z);
                                    if (Z > K) {
                                        if (K = Z, F = W, Z > X) break;
                                        for (var ee = Math.min(W, Z - 2), et = 0, G = 0; G < ee; ++G) {
                                            var er = N - W + G & 32767,
                                                en = C[er],
                                                ea = er - en & 32767;
                                            ea > et && (et = ea, Q = er)
                                        }
                                    }
                                }
                                Q = C[L = Q], W += L - Q & 32767
                            }
                        if (F) {
                            I[U++] = 0x10000000 | v[K] << 18 | D[F];
                            var ei = 31 & v[K],
                                eo = 31 & D[F];
                            O += h[ei] + m[eo], ++R[257 + ei], ++_[eo], M = N + K, ++V
                        } else I[U++] = e[N], ++R[e[N]]
                    }
                }
                for (N = Math.max(N, M); N < o; ++N) I[U++] = e[N], ++R[e[N]];
                f = q(e, c, p, I, R, _, O, U, x, N - x, f), p || (i.r = 7 & f | c[f / 8 | 0] << 3, f -= 7, i.h = w, i.p = C, i.i = N, i.w = M)
            } else {
                for (var N = i.w || 0; N < o + p; N += 65535) {
                    var es = N + 65535;
                    es >= o && (c[f / 8 | 0] = p, es = o), f = z(c, f + 1, e.subarray(N, es))
                }
                i.i = o
            }
            return k(s, 0, n + P(f) + a)
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
                    for (var n = e, a = t, i = 0 | r.length, o = 0; o != i;) {
                        for (var s = Math.min(o + 2655, i); o < s; ++o) a += n += r[o];
                        n = (65535 & n) + 15 * (n >> 16), a = (65535 & a) + 15 * (a >> 16)
                    }
                    e = n, t = a
                },
                d: function() {
                    return e %= 65521, t %= 65521, (255 & e) << 24 | (65280 & e) << 8 | (255 & t) << 8 | t >> 8
                }
            }
        },
        ee = function(e, t, r, n, a) {
            if (!a && (a = {
                    l: 1
                }, t.dictionary)) {
                var i = t.dictionary.subarray(-32768),
                    o = new u(i.length + e.length);
                o.set(i), o.set(e, i.length), e = o, a.w = i.length
            }
            return X(e, null == t.level ? 6 : t.level, null == t.mem ? a.l ? Math.ceil(1.5 * Math.max(8, Math.min(13, Math.log(e.length)))) : 20 : 12 + t.mem, r, n, a)
        },
        et = function(e, t) {
            var r = {};
            for (var n in e) r[n] = e[n];
            for (var n in t) r[n] = t[n];
            return r
        },
        er = function(e, t, r) {
            for (var n = e(), a = e.toString(), i = a.slice(a.indexOf("[") + 1, a.lastIndexOf("]")).replace(/\s+/g, "").split(","), o = 0; o < n.length; ++o) {
                var s = n[o],
                    c = i[o];
                if ("function" == typeof s) {
                    t += ";" + c + "=";
                    var u = s.toString();
                    if (s.prototype)
                        if (-1 != u.indexOf("[native code]")) {
                            var l = u.indexOf(" ", 8) + 1;
                            t += u.slice(l, u.indexOf("(", l))
                        } else
                            for (var d in t += u, s.prototype) t += ";" + c + ".prototype." + d + "=" + s.prototype[d].toString();
                    else t += u
                } else r[c] = s
            }
            return t
        },
        en = [],
        ea = function(e) {
            var t = [];
            for (var r in e) e[r].buffer && t.push((e[r] = new e[r].constructor(e[r])).buffer);
            return t
        },
        ei = function(e, t, r, n) {
            if (!en[r]) {
                for (var a = "", i = {}, o = e.length - 1, s = 0; s < o; ++s) a = er(e[s], a, i);
                en[r] = {
                    c: er(e[o], a, i),
                    e: i
                }
            }
            var u = et({}, en[r].e);
            return c(en[r].c + ";onmessage=function(e){for(var k in e.data)self[k]=e.data[k];onmessage=" + t.toString() + "}", r, u, ea(u), n)
        },
        eo = function() {
            return [u, l, d, h, m, p, g, A, _, O, C, x, S, N, U, M, P, k, B, L, eV, el, ed]
        },
        es = function() {
            return [u, l, d, h, m, p, v, D, R, E, V, I, C, Y, W, S, Q, H, G, K, F, j, z, q, P, k, X, ee, eI, el]
        },
        ec = function() {
            return [eb, eA]
        },
        eu = function() {
            return [ew]
        },
        el = function(e) {
            return postMessage(e, [e.buffer])
        },
        ed = function(e) {
            return e && {
                out: e.size && new u(e.size),
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
        em = function(e, t, r, n, a, i, o) {
            var s, c = ei(e, n, a, function(e, r) {
                e ? (c.terminate(), t.ondata.call(t, e)) : Array.isArray(r) ? 1 == r.length ? (t.queuedSize -= r[0], t.ondrain && t.ondrain(r[0])) : (r[1] && c.terminate(), t.ondata.call(t, e, r[0], r[1])) : o(r)
            });
            c.postMessage(r), t.queuedSize = 0, t.push = function(e, r) {
                t.ondata || B(5), s && t.ondata(B(4, 0, 1), null, !!r), t.queuedSize += e.length, c.postMessage([e, s = r], e.buffer instanceof ArrayBuffer ? [e.buffer] : [])
            }, t.terminate = function() {
                c.terminate()
            }, i && (t.flush = function(e) {
                c.postMessage([0, e])
            })
        },
        ep = function(e, t) {
            return e[t] | e[t + 1] << 8
        },
        ef = function(e, t) {
            return (e[t] | e[t + 1] << 8 | e[t + 2] << 16 | e[t + 3] << 24) >>> 0
        },
        ey = function(e, t) {
            return ef(e, t) + 0x100000000 * ef(e, t + 4)
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
            (31 != e[0] || 139 != e[1] || 8 != e[2]) && B(6, "invalid gzip data");
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
            return ((15 & e[0]) != 8 || e[0] >> 4 > 7 || (e[0] << 8 | e[1]) % 31) && B(6, "invalid zlib data"), (e[1] >> 5 & 1) == +!t && B(6, "invalid zlib data: " + (32 & e[1] ? "need" : "unexpected") + " dictionary"), (e[1] >> 3 & 4) + 2
        };

    function eT(e, t) {
        return "function" == typeof e && (t = e, e = {}), this.ondata = t, e
    }
    var eS = function() {
            function e(e, t) {
                if ("function" == typeof e && (t = e, e = {}), this.ondata = t, this.o = e || {}, this.s = {
                        l: 0,
                        i: 32768,
                        w: 32768,
                        z: 32768
                    }, this.b = new u(98304), this.o.dictionary) {
                    var r = this.o.dictionary.subarray(-32768);
                    this.b.set(r, 32768 - r.length), this.s.i = 32768 - r.length
                }
            }
            return e.prototype.p = function(e, t) {
                this.ondata(ee(e, this.o, 0, 0, this.s), t)
            }, e.prototype.push = function(e, t) {
                this.ondata || B(5), this.s.l && B(4);
                var r = e.length + this.s.z;
                if (r > this.b.length) {
                    if (r > 2 * this.b.length - 32768) {
                        var n = new u(-32768 & r);
                        n.set(this.b.subarray(0, this.s.z)), this.b = n
                    }
                    var a = this.b.length - this.s.z;
                    this.b.set(e.subarray(0, a), this.s.z), this.s.z = this.b.length, this.p(this.b, !1), this.b.set(this.b.subarray(-32768)), this.b.set(e.subarray(a), 32768), this.s.z = e.length - a + 32768, this.s.i = 32766, this.s.w = 32768
                } else this.b.set(e, this.s.z), this.s.z += e.length;
                this.s.l = 1 & t, (this.s.z > this.s.w + 8191 || t) && (this.p(this.b, t || !1), this.s.w = this.s.i, this.s.i -= 2), t && (this.s = this.o = {}, this.b = W)
            }, e.prototype.flush = function(e) {
                if (this.ondata || B(5), this.s.l && B(4), this.p(this.b, !1), this.s.w = this.s.i, this.s.i -= 2, e) {
                    var t = new u(6);
                    t[0] = this.s.r >> 3;
                    var r = z(t, this.s.r, W);
                    this.s.r = 0, this.ondata(t.subarray(0, r >> 3), !1)
                }
            }, e
        }(),
        eE = function(e, t) {
            em([es, function() {
                return [eh, eS]
            }], this, eT.call(this, e, t), function(e) {
                onmessage = eh(new eS(e.data))
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
                }, this.o = new u(32768), this.p = new u(0), r && this.o.set(r)
            }
            return e.prototype.e = function(e) {
                if (this.ondata || B(5), this.d && B(4), this.p.length) {
                    if (e.length) {
                        var t = new u(this.p.length + e.length);
                        t.set(this.p), t.set(e, this.p.length), this.p = t
                    }
                } else this.p = e
            }, e.prototype.c = function(e) {
                this.s.i = +(this.d = e || !1);
                var t = this.s.b,
                    r = L(this.p, this.s, this.o);
                this.ondata(k(r, t, this.s.b), this.d), this.o = k(r, this.s.b - 32768), this.s.b = this.o.length, this.p = k(this.p, this.s.p / 8 | 0), this.s.p &= 7
            }, e.prototype.push = function(e, t) {
                this.e(e), this.c(t)
            }, e
        }(),
        e_ = function(e, t) {
            em([eo, function() {
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
            this.c = J(), this.l = 0, this.v = 1, eS.call(this, e, t)
        }
        e.prototype.push = function(e, t) {
            this.c.p(e), this.l += e.length, eS.prototype.push.call(this, e, t)
        }, e.prototype.p = function(e, t) {
            var r = ee(e, this.o, this.v && eD(this.o), t && 8, this.s);
            this.v && (ev(r, this.o), this.v = 0), t && (eg(r, r.length - 8, this.c.d()), eg(r, r.length - 4, this.l)), this.ondata(r, t)
        }, e.prototype.flush = function(e) {
            eS.prototype.flush.call(this, e)
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
                eR.prototype.c.call(this, 0), this.s.f && !this.s.l ? (this.v = P(this.s.p) + 9, this.s = {
                    i: 0
                }, this.o = new u(0), this.push(new u(0), t)) : t && eR.prototype.c.call(this, t)
            }, e
        }(),
        eN = function(e, t) {
            var r = this;
            em([eo, ec, function() {
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
        eU = (function() {
            function e(e, t) {
                this.c = Z(), this.v = 1, eS.call(this, e, t)
            }
            e.prototype.push = function(e, t) {
                this.c.p(e), eS.prototype.push.call(this, e, t)
            }, e.prototype.p = function(e, t) {
                var r = ee(e, this.o, this.v && (this.o.dictionary ? 6 : 2), t && 4, this.s);
                this.v && (eC(r, this.o), this.v = 0), t && eg(r, r.length - 4, this.c.d()), this.ondata(r, t)
            }, e.prototype.flush = function(e) {
                eS.prototype.flush.call(this, e)
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
                t && (this.p.length < 4 && B(6, "invalid zlib data"), this.p = this.p.subarray(0, -4)), eR.prototype.c.call(this, t)
            }, e
        }()),
        eM = function(e, t) {
            em([eo, eu, function() {
                return [eh, eR, eU]
            }], this, eT.call(this, e, t), function(e) {
                onmessage = eh(new eU(e.data))
            }, 11, 0)
        },
        eP = function() {
            function e(e, t) {
                this.o = eT.call(this, e, t) || {}, this.G = eO, this.I = eR, this.Z = eU
            }
            return e.prototype.i = function() {
                var e = this;
                this.s.ondata = function(t, r) {
                    e.ondata(t, r)
                }
            }, e.prototype.push = function(e, t) {
                if (this.ondata || B(5), this.s) this.s.push(e, t);
                else {
                    if (this.p && this.p.length) {
                        var r = new u(this.p.length + e.length);
                        r.set(this.p), r.set(e, this.p.length)
                    } else this.p = e;
                    this.p.length > 2 && (this.s = 31 == this.p[0] && 139 == this.p[1] && 8 == this.p[2] ? new this.G(this.o) : (15 & this.p[0]) != 8 || this.p[0] >> 4 > 7 || (this.p[0] << 8 | this.p[1]) % 31 ? new this.I(this.o) : new this.Z(this.o), this.i(), this.s.push(this.p, t), this.p = null)
                }
            }, e
        }();

    function ek(e, t) {
        eP.call(this, e, t), this.queuedSize = 0, this.G = eN, this.I = e_, this.Z = eM
    }
    ek.prototype.i = function() {
        var e = this;
        this.s.ondata = function(t, r, n) {
            e.ondata(t, r, n)
        }, this.s.ondrain = function(t) {
            e.queuedSize -= t, e.ondrain && e.ondrain(t)
        }
    }, ek.prototype.push = function(e, t) {
        this.queuedSize += e.length, eP.prototype.push.call(this, e, t)
    };
    var ex = "u" > typeof TextEncoder && new TextEncoder,
        eB = "u" > typeof TextDecoder && new TextDecoder,
        eL = 0;
    try {
        eB.decode(W, {
            stream: !0
        }), eL = 1
    } catch (e) {}
    var eQ = function(e) {
        for (var t = "", r = 0;;) {
            var n = e[r++],
                a = (n > 127) + (n > 223) + (n > 239);
            if (r + a > e.length) return {
                s: t,
                r: k(e, r - 1)
            };
            a ? 3 == a ? t += String.fromCharCode(55296 | (n = ((15 & n) << 18 | (63 & e[r++]) << 12 | (63 & e[r++]) << 6 | 63 & e[r++]) - 65536) >> 10, 56320 | 1023 & n) : 1 & a ? t += String.fromCharCode((31 & n) << 6 | 63 & e[r++]) : t += String.fromCharCode((15 & n) << 12 | (63 & e[r++]) << 6 | 63 & e[r++]) : t += String.fromCharCode(n)
        }
    };

    function eH(e, t) {
        if (t) {
            for (var r = new u(e.length), n = 0; n < e.length; ++n) r[n] = e.charCodeAt(n);
            return r
        }
        if (ex) return ex.encode(e);
        for (var a = e.length, i = new u(e.length + (e.length >> 1)), o = 0, s = function(e) {
                i[o++] = e
            }, n = 0; n < a; ++n) {
            if (o + 5 > i.length) {
                var c = new u(o + 8 + (a - n << 1));
                c.set(i), i = c
            }
            var l = e.charCodeAt(n);
            l < 128 || t ? s(l) : (l < 2048 ? s(192 | l >> 6) : (l > 55295 && l < 57344 ? (s(240 | (l = 65536 + (1047552 & l) | 1023 & e.charCodeAt(++n)) >> 18), s(128 | l >> 12 & 63)) : s(224 | l >> 12), s(128 | l >> 6 & 63)), s(128 | 63 & l))
        }
        return k(i, 0, o)
    }

    function eG(e, t) {
        if (t) {
            for (var r = "", n = 0; n < e.length; n += 16384) r += String.fromCharCode.apply(null, e.subarray(n, n + 16384));
            return r
        }
        if (eB) return eB.decode(e);
        var a = eQ(e),
            i = a.s,
            r = a.r;
        return r.length && B(8), i
    }(function(e) {
        this.ondata = e, eL ? this.t = new TextDecoder : this.p = W
    }).prototype.push = function(e, t) {
        if (this.ondata || B(5), t = !!t, this.t) {
            this.ondata(this.t.decode(e, {
                stream: !0
            }), t), t && (this.t.decode().length && B(8), this.t = null);
            return
        }
        this.p || B(4);
        var r = new u(this.p.length + e.length);
        r.set(this.p), r.set(e, this.p.length);
        var n = eQ(r),
            a = n.s,
            i = n.r;
        t ? (i.length && B(8), this.p = null) : this.p = i, this.ondata(a, t)
    }, (function(e) {
        this.ondata = e
    }).prototype.push = function(e, t) {
        this.ondata || B(5), this.d && B(4), this.ondata(eH(e), this.d = t || !1)
    };
    var eK = function(e) {
            return 1 == e ? 3 : e < 6 ? 2 : +(9 == e)
        },
        eF = function(e, t, r, n, a, i, o) {
            var s = 0xffffffff == a,
                c = 0xffffffff == i,
                u = 0xffffffff == o,
                l = t + r;
            if (n && s + c + u) {
                for (; t + 4 < l; t += 4 + ep(e, t + 2))
                    if (1 == ep(e, t)) return [s ? ey(e, t + 4 + 8 * c) : a, c ? ey(e, t + 4) : i, u ? ey(e, t + 4 + 8 * (c + s)) : o, 1];
                n < 2 && B(13)
            }
            return [a, i, o, 0]
        },
        ej = function(e) {
            var t = 0;
            if (e)
                for (var r in e) {
                    var n = e[r].length;
                    n > 65535 && B(9), t += n + 4
                }
            return t
        },
        ez = function(e, t, r, n, a, i, o, s) {
            var c = n.length,
                u = r.extra,
                l = s && s.length,
                d = ej(u);
            eg(e, t, null != o ? 0x2014b50 : 0x4034b50), t += 4, null != o && (e[t++] = 20, e[t++] = r.os), e[t] = 20, t += 2, e[t++] = r.flag << 1 | (i < 0 && 8), e[t++] = a && 8, e[t++] = 255 & r.compression, e[t++] = r.compression >> 8;
            var h = new Date(null == r.mtime ? Date.now() : r.mtime),
                m = h.getFullYear() - 1980;
            if ((m < 0 || m > 119) && B(10), eg(e, t, m << 25 | h.getMonth() + 1 << 21 | h.getDate() << 16 | h.getHours() << 11 | h.getMinutes() << 5 | h.getSeconds() >> 1), t += 4, -1 != i && (eg(e, t, r.crc), eg(e, t + 4, i < 0 ? -i - 2 : i), eg(e, t + 8, r.size)), eg(e, t + 12, c), eg(e, t + 14, d), t += 16, null != o && (eg(e, t, l), eg(e, t + 6, r.attrs), eg(e, t + 10, o), t += 14), e.set(n, t), t += c, d)
                for (var p in u) {
                    var f = u[p],
                        y = f.length;
                    eg(e, t, +p), eg(e, t + 2, y), e.set(f, t + 4), t += 4 + y
                }
            return l && (e.set(s, t), t += l), t
        },
        eq = function(e, t, r, n, a) {
            eg(e, t, 0x6054b50), eg(e, t + 8, r), eg(e, t + 10, r), eg(e, t + 12, n), eg(e, t + 16, a)
        },
        eY = function() {
            function e(e) {
                this.filename = e, this.c = J(), this.size = 0, this.compression = 0
            }
            return e.prototype.process = function(e, t) {
                this.ondata(null, e, t)
            }, e.prototype.push = function(e, t) {
                this.ondata || B(5), this.c.p(e), this.size += e.length, t && (this.crc = this.c.d()), this.process(e, t || !1)
            }, e
        }();

    function eW(e, t) {
        var r = this;
        t || (t = {}), eY.call(this, e), this.d = new eS(t, function(e, t) {
            r.ondata(null, e, t)
        }), this.compression = 8, this.flag = eK(t.level)
    }

    function eX(e, t) {
        var r = this;
        t || (t = {}), eY.call(this, e), this.d = new eE(t, function(e, t, n) {
            r.ondata(e, t, n)
        }), this.compression = 8, this.flag = eK(t.level), this.terminate = this.d.terminate
    }

    function e$(e) {
        this.ondata = e, this.u = [], this.d = 1
    }
    eW.prototype.process = function(e, t) {
        try {
            this.d.push(e, t)
        } catch (e) {
            this.ondata(e, null, t)
        }
    }, eW.prototype.push = function(e, t) {
        eY.prototype.push.call(this, e, t)
    }, eX.prototype.process = function(e, t) {
        this.d.push(e, t)
    }, eX.prototype.push = function(e, t) {
        eY.prototype.push.call(this, e, t)
    }, e$.prototype.add = function(e) {
        var t = this;
        if (this.ondata || B(5), 2 & this.d) this.ondata(B(4 + (1 & this.d) * 8, 0, 1), null, !1);
        else {
            var r = eH(e.filename),
                n = r.length,
                a = e.comment,
                i = a && eH(a),
                o = n != e.filename.length || i && a.length != i.length,
                s = n + ej(e.extra) + 30;
            n > 65535 && this.ondata(B(11, 0, 1), null, !1);
            var c = new u(s);
            ez(c, 0, e, r, o, -1);
            var l = [c],
                d = function() {
                    for (var e = 0, r = l; e < r.length; e++) {
                        var n = r[e];
                        t.ondata(null, n, !1)
                    }
                    l = []
                },
                h = this.d;
            this.d = 0;
            var m = this.u.length,
                p = et(e, {
                    f: r,
                    u: o,
                    o: i,
                    t: function() {
                        e.terminate && e.terminate()
                    },
                    r: function() {
                        if (d(), h) {
                            var e = t.u[m + 1];
                            e ? e.r() : t.d = 1
                        }
                        h = 1
                    }
                }),
                f = 0;
            e.ondata = function(r, n, a) {
                if (r) t.ondata(r, n, a), t.terminate();
                else if (f += n.length, l.push(n), a) {
                    var i = new u(16);
                    eg(i, 0, 0x8074b50), eg(i, 4, e.crc), eg(i, 8, f), eg(i, 12, e.size), l.push(i), p.c = f, p.b = s + f + 16, p.crc = e.crc, p.size = e.size, h && p.r(), h = 1
                } else h && d()
            }, this.u.push(p)
        }
    }, e$.prototype.end = function() {
        var e = this;
        2 & this.d ? this.ondata(B(4 + (1 & this.d) * 8, 0, 1), null, !0) : (this.d ? this.e() : this.u.push({
            r: function() {
                1 & e.d && (e.u.splice(-1, 1), e.e())
            },
            t: function() {}
        }), this.d = 3)
    }, e$.prototype.e = function() {
        for (var e = 0, t = 0, r = 0, n = 0, a = this.u; n < a.length; n++) {
            var i = a[n];
            r += 46 + i.f.length + ej(i.extra) + (i.o ? i.o.length : 0)
        }
        for (var o = new u(r + 22), s = 0, c = this.u; s < c.length; s++) {
            var i = c[s];
            ez(o, e, i, i.f, i.u, -i.c - 2, t, i.o), e += 46 + i.f.length + ej(i.extra) + (i.o ? i.o.length : 0), t += i.b
        }
        eq(o, e, this.u.length, r, t), this.ondata(null, o, !0), this.d = 2
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
        }, this.p = W
    }
    eZ.prototype.push = function(e, t) {
        try {
            this.i.push(e, t)
        } catch (e) {
            this.ondata(e, null, t)
        }
    }, eZ.compression = 8, e0.prototype.push = function(e, t) {
        this.i.terminate && (e = k(e, 0)), this.i.push(e, t)
    }, e0.compression = 8, e1.prototype.push = function(e, t) {
        var r = this;
        if (this.onfile || B(5), this.p || B(4), this.c > 0) {
            var n = Math.min(this.c, e.length),
                a = e.subarray(0, n);
            if (this.c -= n, this.d ? this.d.push(a, !this.c) : this.k[0].push(a), (e = e.subarray(n)).length) return this.push(e, t)
        } else {
            var i = 0,
                o = 0,
                s = void 0,
                c = void 0;
            this.p.length ? e.length ? ((c = new u(this.p.length + e.length)).set(this.p), c.set(e, this.p.length)) : c = this.p : c = e;
            for (var l = c.length, d = this.c, h = d && this.d, m = this; o < l - 4 && "break" !== function() {
                    var e = ef(c, o);
                    if (0x4034b50 == e) {
                        i = 1, s = o, m.d = null, m.c = 0;
                        var t = ep(c, o + 6),
                            n = ep(c, o + 8),
                            a = ep(c, o + 26),
                            u = ep(c, o + 28);
                        if (l > o + 30 + a + u) {
                            var h, p = [];
                            m.k.unshift(p), i = 2;
                            var f = ef(c, o + 18),
                                y = ef(c, o + 22),
                                g = eG(c.subarray(o + 30, o += 30 + a), !(2048 & t)),
                                v = eF(c, o, u, 2, f, y, 0),
                                b = v[0],
                                A = v[1],
                                D = v[3];
                            8 & t && (b = -1 - D), o += u, m.c = b;
                            var C = {
                                name: g,
                                compression: n,
                                start: function() {
                                    if (C.ondata || B(5), b) {
                                        var e = r.o[n];
                                        e || C.ondata(B(14, "unknown compression type " + n, 1), null, !1), (h = b < 0 ? new e(g) : new e(g, b, A)).ondata = function(e, t, r) {
                                            C.ondata(e, t, r)
                                        };
                                        for (var t = 0; t < p.length; t++) {
                                            var a = p[t];
                                            h.push(a, !1)
                                        }
                                        r.k[0] == p && r.c ? r.d = h : h.push(W, !0)
                                    } else C.ondata(null, W, !0)
                                },
                                terminate: function() {
                                    h && h.terminate && h.terminate()
                                }
                            };
                            b >= 0 && (C.size = b, C.originalSize = A), m.onfile(C)
                        }
                        return "break"
                    }
                    if (d) {
                        if (0x8074b50 == e) return s = o += 12 + (-2 == d && 8), i = 3, m.c = 0, "break";
                        else if (0x2014b50 == e) return s = o -= 4, i = 3, m.c = 0, "break"
                    }
                }(); ++o);
            if (this.p = W, d < 0) {
                var p = i ? c.subarray(0, s - 12 - (-2 == d && 8) - (0x8074b50 == ef(c, s - 16) && 4)) : c.subarray(0, o);
                h ? h.push(p, !!i) : this.k[+(2 == i)].push(p)
            }
            if (2 & i) return this.push(c.subarray(o), t);
            this.p = c.subarray(o)
        }
        t && (this.c && B(13), this.p = null)
    }, e1.prototype.register = function(e) {
        this.o[e.compression] = e
    }, "function" == typeof queueMicrotask && queueMicrotask;
    let e2 = e => (e => {
            let t = "";
            for (let r = 0; r < e.length; r += 32768) t += String.fromCharCode(...e.subarray(r, r + 32768));
            return btoa(t).replaceAll("+", "-").replaceAll("/", "_").replace(/=+$/u, "")
        })(eI(eH(e))),
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
                let e = eG(eV(r));
                return e.length <= t ? e : null
            } catch (e) {
                return null
            }
        };
    e.s(["compressQueryParamPayload", 0, e2, "decompressQueryParamPayload", 0, e3], 456954);
    var e5 = e.i(973005),
        e8 = e.i(11517),
        e6 = n;
    e.s(["RAQIV2FilterOperation", () => e6.AnalyticsQueryGatewayAPIFilterOperation], 726023);
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
        ta = e => {
            let r, n;
            if (!tt(e)) return e;
            let i = e.f;
            if (!Array.isArray(i)) return e;
            let {
                customEventName: o,
                realFilters: s
            } = (n = i.filter(e => {
                var n, i;
                let o, s;
                return !(tt(n = e) && n.dimension === t.RAQIV2Dimension.CustomEventName && Array.isArray(o = n.values) && o.every(e => "string" == typeof e) && (void 0 === n.operation || ("string" == typeof(s = i = n.operation) || "number" == typeof s) && (0, a.isValidEnumValue)(e6.AnalyticsQueryGatewayAPIFilterOperation, i) && i !== e6.AnalyticsQueryGatewayAPIFilterOperation.Invalid)) || (null != r || (r = e.values[0]), !1)
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
        ti = [{
            fromVersion: 1,
            toVersion: 2,
            description: "Lift CustomEventName filters into source identity",
            migrate: e => tt(e) && Array.isArray(e.s) ? {
                ...e,
                s: e.s.map(ta)
            } : e
        }],
        to = "cm2.",
        ts = e => "string" == typeof e && e.trim().length > 0,
        tc = e => ts(e) && (0, i.isNumericUIMetric)(e),
        tu = e => "string" == typeof e || "number" == typeof e,
        tl = e => {
            let t = (0, e8.getUIMetricFromAtomicMetricLike)(e.metric);
            if (!tc(t)) return (0, r.default)('Cannot serialize non-numeric computed metric source "'.concat(String(t), '".')), null;
            let n = {
                k: e.key,
                m: t
            };
            e.filters && e.filters.length > 0 && (n.f = [...e.filters]), (0, e8.isCustomEventsAtomicMetricLike)(e.metric) && (n.c = e.metric.customEventName);
            let a = ((e, t) => {
                if (!e && !t) return;
                let r = {};
                if (null != t ? t : null == e ? void 0 : e.aggregationType) {
                    var n;
                    r.a = null != (n = null != t ? t : null == e ? void 0 : e.aggregationType) ? n : void 0
                }
                return (null == e ? void 0 : e.percentile) && (r.p = e.percentile), Object.keys(r).length > 0 ? r : void 0
            })(e.pseudoDimensionValues, (0, e8.isCustomEventsAtomicMetricLike)(e.metric) ? e.metric.aggregationType : void 0);
            return a && (n.p = a), n
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
                var a;
                let t = e.c;
                if (!t) return null;
                r = {
                    metric: e.m,
                    customEventName: t,
                    ...(null == (a = e.p) ? void 0 : a.a) ? {
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
        let i = (e => {
            try {
                return JSON.parse(e)
            } catch (e) {
                return null
            }
        })(r);
        if (null === i) return null;
        let o = (e => {
            try {
                return (e => {
                    let {
                        document: t,
                        registry: r,
                        targetVersion: n,
                        getVersion: a,
                        setVersion: i,
                        createUnsupportedVersionError: o = e9,
                        createMigrationGapError: s = te
                    } = e, c = t, u = a(t);
                    if (u > n) throw o(u, n);
                    let l = u,
                        d = r.length + 1,
                        h = 0;
                    for (; l < n && h < d;) {
                        let e = l,
                            t = r.find(t => t.fromVersion === e);
                        if (!t) throw s(e, n);
                        let o = t.migrate(c),
                            u = a(o);
                        if (u !== e && u !== t.toVersion) throw s(e, n, "Migration step ".concat(e, " -> ").concat(t.toVersion, " produced version ").concat(u, "."));
                        c = i(o, t.toVersion), l = t.toVersion, h += 1
                    }
                    if (l !== n) throw s(l, n, "Migration pipeline did not converge after ".concat(h, " steps (stopped at version ").concat(l, ")."));
                    return i(c, n)
                })({
                    document: e,
                    registry: ti,
                    targetVersion: 2,
                    getVersion: tr,
                    setVersion: tn
                })
            } catch (e) {
                return null
            }
        })(i);
        if (!(o && "object" == typeof o && 2 === o.v && Array.isArray(o.s) && 0 !== o.s.length && ts(o.f) && (void 0 === o.n || "string" == typeof o.n) && o.s.every(e => {
                var r, i;
                let o;
                return !(!(r = e) || "object" != typeof r || Array.isArray(r)) && !!ts(r.k) && !!tc(r.m) && (void 0 === r.f || !!(Array.isArray(o = r.f) && o.every(e => (e => {
                    if (!e || "object" != typeof e) return !1;
                    let {
                        dimension: r,
                        values: i,
                        operation: o
                    } = e;
                    return !(!tu(r) || !(0, a.isValidEnumValue)(t.RAQIV2Dimension, r) || (0, e5.default)(r)) && r !== t.RAQIV2Dimension.CustomEventName && Array.isArray(i) && i.every(e => "string" == typeof e) && (void 0 === o || tu(o) && (0, a.isValidEnumValue)(n.AnalyticsQueryGatewayAPIFilterOperation, o) && o !== n.AnalyticsQueryGatewayAPIFilterOperation.Invalid)
                })(e)))) && (void 0 === r.c || !!ts(r.c)) && (void 0 === r.p || !!((i = r.p) && "object" == typeof i && (void 0 === i.a || tu(i.a) && (0, a.isValidEnumValue)(t.RAQIV2AggregationType, i.a)) && (void 0 === i.p || tu(i.p) && (0, a.isValidEnumValue)(t.RAQIV2PercentileType, i.p)) && 1))
            }))) return null;
        let [s, ...c] = o.s, u = td(s), l = [];
        for (let e of c) {
            let t = td(e);
            if (!t) return null;
            l.push(t)
        }
        return u ? {
            sources: [u, ...l],
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
}, 509434, 102716, 377396, 98949, 115232, 646877, e => {
    "use strict";
    var t = e.i(31611),
        r = e.i(531007),
        n = e.i(11517),
        a = e.i(302610),
        i = e.i(283561),
        o = e.i(379843),
        s = e.i(787202),
        c = e.i(36826),
        u = e.i(908374),
        l = e.i(545154),
        d = e.i(731197);

    function h(e) {
        return "Component" === e.type && "SummaryCard" === e.component.type
    }
    e.s(["isSummaryCardLayoutNode", 0, h], 102716);
    let m = new Set([t.RAQIV2DateRangeType.Last1Hour, t.RAQIV2DateRangeType.Last1Day, t.RAQIV2DateRangeType.Last3Days, t.RAQIV2DateRangeType.Last7Days, t.RAQIV2DateRangeType.Last28Days, t.RAQIV2DateRangeType.Last56Days, t.RAQIV2DateRangeType.Custom]);

    function p(e) {
        return m.has(e)
    }

    function f(e, t) {
        let r = t - e;
        return r >= 0 && r < 48384e5
    }
    e.s(["CUSTOM_DASHBOARD_SAVED_DATE_RANGE_LIMIT_DAYS", 0, 56, "constrainCustomDashboardEditorDateRange", 0, function(e, t) {
        return f(e.getTime(), t.getTime()) ? {
            startDate: e,
            endDate: t
        } : {
            startDate: new Date(t.getTime() - 4752e6),
            endDate: t
        }
    }, "filterSupportedCustomDashboardSavedDateRangeTypes", 0, function(e) {
        return e.filter(p)
    }, "isCustomDashboardSavedDateRangeDurationValid", 0, f, "isSupportedCustomDashboardSavedDateRangeType", 0, p], 377396);
    let y = t.RAQIV2MetricGranularity.OneDay;

    function g(e, r) {
        return t.RAQIV2MetricToSupportedGranularities[e].includes(r === o.CustomDashboardSummaryCardAggregation.Cumulative ? t.RAQIV2MetricGranularity.None : y)
    }

    function v(e, t) {
        return g(e, t) ? t : g(e, o.CustomDashboardSummaryCardAggregation.AverageOverTimePeriod) ? o.CustomDashboardSummaryCardAggregation.AverageOverTimePeriod : g(e, o.CustomDashboardSummaryCardAggregation.Cumulative) ? o.CustomDashboardSummaryCardAggregation.Cumulative : null
    }
    e.s(["SUMMARY_CARD_TIME_SERIES_GRANULARITY", 0, y, "isSummaryCardAggregationSupported", 0, g, "resolveSupportedSummaryCardAggregation", 0, v], 98949);
    var b = e.i(956154);
    let A = /^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(?:\.\d{3})?Z$/;

    function D(e) {
        return "object" == typeof e && null !== e && !Array.isArray(e)
    }

    function C(e, t) {
        if (!D(e)) throw new i.CustomDashboardValidationError(t, "".concat(t, " must be an object."));
        return e
    }

    function w(e, t) {
        if ("string" != typeof e) throw new i.CustomDashboardValidationError(t, "".concat(t, " must be a string."));
        return e
    }

    function T(e, t) {
        let r = w(e, t);
        if (0 === r.length) throw new i.CustomDashboardValidationError(t, "".concat(t, " must be non-empty."));
        return r
    }

    function S(e, t) {
        if ("number" != typeof e || !Number.isFinite(e)) throw new i.CustomDashboardValidationError(t, "".concat(t, " must be a finite number."));
        return e
    }

    function E(e, t) {
        if ("boolean" == typeof e) return e;
        if (void 0 === e) return;
        let r = C(e, t);
        return {
            relativeOffset: function(e, t) {
                if (void 0 !== e) {
                    if ("string" == typeof e && b.ComparisonOffset.some(t => t === e)) return e;
                    throw new i.CustomDashboardValidationError(t, "".concat(t, " must be a valid comparison offset."))
                }
            }(r.relativeOffset, "".concat(t, ".relativeOffset")),
            customStartTimeMs: function(e, t) {
                if (void 0 !== e) return S(e, t)
            }(r.customStartTimeMs, "".concat(t, ".customStartTimeMs"))
        }
    }

    function I(e, t) {
        if ("boolean" != typeof e) throw new i.CustomDashboardValidationError(t, "".concat(t, " must be a boolean."));
        return e
    }

    function R(e, t) {
        let r = w(e, t),
            n = Date.parse(r);
        if (!A.test(r) || !Number.isFinite(n)) throw new i.CustomDashboardValidationError(t, "".concat(t, " must be an ISO-8601 timestamp."));
        return r
    }

    function _(e) {
        return (t, r) => {
            let n;
            return null != t && (n = e(t, r)), n
        }
    }
    let V = _(R),
        O = _(T),
        N = _(I);

    function U(e) {
        return e.trim()
    }
    e.s(["asBoolean", 0, I, "asIsoTimestamp", 0, R, "asNonEmptyString", 0, T, "asNumber", 0, S, "asOptionalIsoTimestamp", 0, V, "asOptionalNonEmptyString", 0, O, "asRecord", 0, C, "asString", 0, w, "isRecord", 0, D, "optional", 0, _, "trimmed", 0, U, "validateOptionalBoolean", 0, N, "validatePreviousPeriodOverlay", 0, E], 115232);
    let M = new Set([o.CustomDashboardSummaryCardAggregation.AverageOverTimePeriod, o.CustomDashboardSummaryCardAggregation.MostRecentDataPoint, o.CustomDashboardSummaryCardAggregation.Total, t.RAQIV2AggregationType.Average, t.RAQIV2AggregationType.AveragePerUser, t.RAQIV2AggregationType.Count, t.RAQIV2AggregationType.CountUser, t.RAQIV2AggregationType.Max, t.RAQIV2AggregationType.Min, t.RAQIV2AggregationType.Sum, o.CustomDashboardSummaryCardAggregation.Median, o.CustomDashboardSummaryCardAggregation.Cumulative, t.RAQIV2PercentileType.AVG, t.RAQIV2PercentileType.P10, t.RAQIV2PercentileType.P50, t.RAQIV2PercentileType.P90]),
        P = new Set([t.RAQIV2AggregationType.Average, t.RAQIV2AggregationType.AveragePerUser, t.RAQIV2AggregationType.Count, t.RAQIV2AggregationType.CountUser, t.RAQIV2AggregationType.Max, t.RAQIV2AggregationType.Min, t.RAQIV2AggregationType.Sum, t.RAQIV2PercentileType.AVG, t.RAQIV2PercentileType.P10, t.RAQIV2PercentileType.P50, t.RAQIV2PercentileType.P90]),
        k = new Set(["Cumulative", "Day", "Week", "Hour", "HalfHour", "Minute"]),
        x = new Set(o.CUSTOM_DASHBOARD_CHART_TYPES),
        B = new Set(["draft", "published"]),
        L = /^Percentile\d+$/,
        Q = new Set(Object.values(t.RAQIV2DateRangeType)),
        H = Object.values(t.RAQIV2Dimension),
        G = Object.values(t.RAQIV2UIPseudoDimension),
        K = Object.values(t.RAQIV2MetricGranularity),
        F = Object.values(c.AnnotationType),
        j = t.RAQIV2UIPseudoDimension.PercentileType,
        z = t.RAQIV2UIPseudoDimension.AggregationType,
        q = t.RAQIV2UIPseudoDimension.LatestPlaceVersion,
        Y = new Set(Object.values(t.RAQIV2AggregationType)),
        W = new Set(Object.values(t.RAQIV2PercentileType));

    function X(e, t) {
        for (let r of e)
            if (r === t) return !0;
        return !1
    }

    function $(e) {
        return H.includes(e) || G.includes(e)
    }

    function J(e) {
        return H.includes(e)
    }

    function Z(e) {
        return J(e) || e === q || e === j || e === z
    }

    function ee(e) {
        return F.includes(e)
    }

    function et(e) {
        return X(P, e) || L.test(e)
    }

    function er(e) {
        return "string" == typeof e && Q.has(e)
    }

    function en(e) {
        return "string" == typeof e && X(Y, e)
    }

    function ea(e) {
        return "string" == typeof e && X(W, e)
    }

    function ei(e) {
        return (0, u.isNumericUIMetric)(e)
    }

    function eo(e) {
        return "string" == typeof e && e.length > 0
    }
    let es = _(function(e, t) {
            let r = w(e, t);
            if (!et(r)) throw new i.CustomDashboardValidationError(t, "".concat(t, ' "').concat(r, '" is not a known chart aggregation.'));
            return r
        }),
        ec = _(function(e, t) {
            if ("none" !== e && "weekly" !== e) throw new i.CustomDashboardValidationError(t, "".concat(t, ' must be "none" or "weekly".'));
            return e
        }),
        eu = _(function(e, t) {
            let r = w(e, t);
            if (r !== o.SummaryCardTitleSource.Auto && r !== o.SummaryCardTitleSource.Custom) throw new i.CustomDashboardValidationError(t, "".concat(t, ' must be "Auto" or "Custom".'));
            return r
        });

    function el(e, t) {
        let r = C(e, t),
            n = T(r.pseudoDimensionKey, "".concat(t, ".pseudoDimensionKey"));
        if (n !== j && n !== z) throw new i.CustomDashboardValidationError("".concat(t, ".pseudoDimensionKey"), "".concat(t, ".pseudoDimensionKey must be a supported pseudo-dimension key."));
        let a = T(r.variantKey, "".concat(t, ".variantKey"));
        if (n === j && !ea(a)) throw new i.CustomDashboardValidationError("".concat(t, ".variantKey"), "".concat(t, ".variantKey must be a known RAQI percentile for PercentileType."));
        if (n === z && !en(a)) throw new i.CustomDashboardValidationError("".concat(t, ".variantKey"), "".concat(t, ".variantKey must be a known RAQI aggregation for AggregationType."));
        return {
            pseudoDimensionKey: n,
            variantKey: a
        }
    }

    function ed(e, t) {
        if (function(e) {
                for (let t of e) {
                    let e = t.codePointAt(0);
                    if (void 0 === e) continue;
                    let r = e <= 31 && 9 !== e && 10 !== e && 13 !== e || 127 === e,
                        n = e >= 8234 && e <= 8238 || e >= 8294 && e <= 8297;
                    if (r || n) return !0
                }
                return !1
            }(e)) throw new i.CustomDashboardValidationError(t, "".concat(t, " contains unsupported control characters."));
        return e
    }

    function eh(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : d.CONSERVATIVE_DASHBOARD_LIMITS,
            r = ed(U(e), "name");
        if (0 === r.length) throw new i.CustomDashboardValidationError("name", "Dashboard name is required.");
        if (t && r.length > t.maxDashboardNameLength) throw new i.CustomDashboardValidationError("name", "Dashboard name cannot exceed ".concat(t.maxDashboardNameLength, " characters."));
        return r
    }

    function em(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : d.CONSERVATIVE_DASHBOARD_LIMITS;
        if (void 0 === e) return;
        let r = ed(U(e), "description");
        if (t && r.length > t.maxDashboardDescriptionLength) throw new i.CustomDashboardValidationError("description", "Description cannot exceed ".concat(t.maxDashboardDescriptionLength, " characters."));
        return 0 === r.length ? void 0 : r
    }

    function ep(e, t) {
        if (null == e) return [];
        if (!Array.isArray(e)) throw new i.CustomDashboardValidationError(t, "".concat(t, " must be an array."));
        return e.map((e, r) => {
            let n = C(e, "".concat(t, "[").concat(r, "]")),
                a = ed(T(n.dimension, "".concat(t, "[").concat(r, "].dimension")), "".concat(t, "[").concat(r, "].dimension")),
                {
                    values: o
                } = n;
            if (!Array.isArray(o) || 0 === o.length || !o.every(eo)) throw new i.CustomDashboardValidationError("".concat(t, "[").concat(r, "].values"), "".concat(t, "[").concat(r, "].values must be a non-empty array of non-empty strings."));
            return {
                dimension: a,
                values: o.map((e, n) => ed(e, "".concat(t, "[").concat(r, "].values[").concat(n, "]")))
            }
        })
    }

    function ef(e, t) {
        if (null == e) throw new i.CustomDashboardValidationError(t, "".concat(t, " must be an array."));
        return ep(e, t)
    }

    function ey(e, t, r) {
        if (null == e) return;
        let n = ed(U(w(e, t)), t);
        if (r && n.length > r.maxTileTitleLength) throw new i.CustomDashboardValidationError(t, "Tile title cannot exceed ".concat(r.maxTileTitleLength, " characters."));
        return 0 === n.length ? void 0 : n
    }

    function eg(e, t) {
        if (null == e) return;
        if (!Array.isArray(e)) throw new i.CustomDashboardValidationError(t, "".concat(t, " must be an array."));
        let r = e.map((e, r) => {
            let n = T(e, "".concat(t, "[").concat(r, "]"));
            if (!J(n)) throw new i.CustomDashboardValidationError("".concat(t, "[").concat(r, "]"), "".concat(t, "[").concat(r, "] must be a canonical RAQI dimension."));
            return n
        });
        return r.length > 0 ? r : void 0
    }

    function ev(e, t) {
        if (null == e) return;
        if (!Array.isArray(e)) throw new i.CustomDashboardValidationError(t, "".concat(t, " must be an array."));
        let r = e.map((e, r) => {
            let n = T(e, "".concat(t, "[").concat(r, "]"));
            if (!ee(n)) throw new i.CustomDashboardValidationError("".concat(t, "[").concat(r, "]"), "".concat(t, "[").concat(r, "] must be a known annotation type."));
            return n
        });
        return r.length > 0 ? r : void 0
    }

    function eb(e, t) {
        let r, n = C(e, t),
            a = (r = eD(n.variantSelections, "".concat(t, ".variantSelections"), el)).length > 0 ? r : void 0;
        if (void 0 !== n.metricKey && null !== n.metricKey && void 0 !== n.computedMetric && null !== n.computedMetric) throw new i.CustomDashboardValidationError(t, "".concat(t, " must not include both metricKey and computedMetric."));
        return void 0 !== n.computedMetric && null !== n.computedMetric ? {
            computedMetric: function(e, t) {
                if (! function(e) {
                        if (!D(e)) return !1;
                        let {
                            sources: t,
                            formula: r,
                            name: n,
                            l7Smoothing: a
                        } = e;
                        return !!Array.isArray(t) && 0 !== t.length && "string" == typeof r && 0 !== r.trim().length && (void 0 === n || "string" == typeof n) && (void 0 === a || "boolean" == typeof a) && t.every(e => D(e) && "string" == typeof e.key && e.key.length > 0 && void 0 !== e.metric)
                    }(e)) throw new i.CustomDashboardValidationError(t, "".concat(t, " must be a computed metric object."));
                let r = (0, l.serializeComputedMetricToQueryParam)(e),
                    n = (0, l.deserializeComputedMetricFromQueryParam)(r);
                if (!r || !n) throw new i.CustomDashboardValidationError(t, "".concat(t, " is not a supported computed metric."));
                return n
            }(n.computedMetric, "".concat(t, ".computedMetric")),
            variantSelections: a
        } : {
            metricKey: function(e, t) {
                let r = w(e, t);
                if (!ei(r)) throw new i.CustomDashboardValidationError(t, "".concat(t, ' "').concat(r, '" is not a known RAQI metric.'));
                return r
            }(n.metricKey, "".concat(t, ".metricKey")),
            variantSelections: a
        }
    }

    function eA(e, t) {
        let r = C(e, t);
        return {
            metric: eb(r.metric, "".concat(t, ".metric")),
            seriesKey: ed(T(r.seriesKey, "".concat(t, ".seriesKey")), "".concat(t, ".seriesKey")),
            displayName: void 0 !== r.displayName && null !== r.displayName ? ed(U(w(r.displayName, "".concat(t, ".displayName"))), "".concat(t, ".displayName")) : void 0,
            aggregation: es(r.aggregation, "".concat(t, ".aggregation")),
            filters: void 0 === r.filters ? void 0 : ef(r.filters, "".concat(t, ".filters"))
        }
    }

    function eD(e, t, r) {
        if (null == e) return [];
        if (!Array.isArray(e)) throw new i.CustomDashboardValidationError(t, "".concat(t, " must be an array."));
        return e.map((e, n) => r(e, "".concat(t, "[").concat(n, "]")))
    }

    function eC(e) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
            {
                limits: a = d.CONSERVATIVE_DASHBOARD_LIMITS
            } = n,
            s = C(e, "config"),
            c = C(s.page, "config.page");
        if (c.mode !== o.DashboardPageMode.Untabbed) throw new i.CustomDashboardValidationError("config.page.mode", 'config.page.mode must be "Untabbed" in v1.');
        let u = C(c.surface, "config.page.surface"),
            l = eD(u.bodyNodes, "config.page.surface.bodyNodes", (e, t) => (function e(t, n, a) {
                let o = C(t, n),
                    s = (t, r) => e(t, r, a);
                if ("Component" === o.type) {
                    let e = C(o.component, "".concat(n, ".component"));
                    if ("Chart" === e.type) return {
                        type: "Component",
                        component: {
                            type: "Chart",
                            chart: function(e, t, n) {
                                let a = C(e, t);
                                if ("Chart" !== a.type) throw new i.CustomDashboardValidationError("".concat(t, ".type"), "".concat(t, '.type must be "Chart".'));
                                return function(e, t, n) {
                                    let a = C(e.dataSpec, "".concat(t, ".dataSpec")),
                                        o = C(e.chartSpec, "".concat(t, ".chartSpec")),
                                        s = w(o.chartType, "".concat(t, ".chartSpec.chartType"));
                                    if (!X(x, s)) throw new i.CustomDashboardValidationError("".concat(t, ".chartSpec.chartType"), "".concat(t, '.chartSpec.chartType "').concat(s, '" is not supported.'));
                                    let c = D(o.overlays) ? o.overlays : void 0,
                                        u = c ? {
                                            genreBenchmark: N(c.genreBenchmark, "".concat(t, ".chartSpec.overlays.genreBenchmark")),
                                            similarExperienceBenchmark: N(c.similarExperienceBenchmark, "".concat(t, ".chartSpec.overlays.similarExperienceBenchmark")),
                                            topExperienceBenchmark: N(c.topExperienceBenchmark, "".concat(t, ".chartSpec.overlays.topExperienceBenchmark")),
                                            previousPeriod: E(c.previousPeriod, "".concat(t, ".chartSpec.overlays.previousPeriod")),
                                            quota: N(c.quota, "".concat(t, ".chartSpec.overlays.quota"))
                                        } : void 0,
                                        l = eD(a.metrics, "".concat(t, ".dataSpec.metrics"), eA),
                                        d = s === r.ChartType.Table;
                                    if (!d && 1 !== l.length) throw new i.CustomDashboardValidationError("".concat(t, ".dataSpec.metrics"), "".concat(t, ".dataSpec.metrics must contain exactly one metric."));
                                    if (d && l.length < 1) throw new i.CustomDashboardValidationError("".concat(t, ".dataSpec.metrics"), "".concat(t, ".dataSpec.metrics must contain at least 1 metric for table charts."));
                                    if (d && n && l.length > n.maxTableMetricColumns) throw new i.CustomDashboardValidationError("".concat(t, ".dataSpec.metrics"), "".concat(t, ".dataSpec.metrics must contain between 1 and ").concat(n.maxTableMetricColumns, " metrics for table charts."));
                                    let h = a.breakdownDimensions,
                                        m = null == h ? void 0 : eD(h, "".concat(t, ".dataSpec.breakdownDimensions"), (e, t) => {
                                            var r;
                                            let n = null != (r = O(e, t)) ? r : "";
                                            if (n.length > 0 && !Z(n)) throw new i.CustomDashboardValidationError(t, "".concat(t, " must be a persistable breakdown dimension."));
                                            return n
                                        }).filter(e => e.length > 0);
                                    return {
                                        type: "Chart",
                                        tileId: T(e.tileId, "".concat(t, ".tileId")),
                                        title: ey(e.title, "".concat(t, ".title"), n),
                                        dataSpec: {
                                            metrics: l,
                                            aggregation: es(a.aggregation, "".concat(t, ".dataSpec.aggregation")),
                                            breakdownDimensions: m,
                                            granularity: function(e, t) {
                                                let r = w(e, t);
                                                if (!X(k, r)) throw new i.CustomDashboardValidationError(t, "".concat(t, ' "').concat(r, '" is not a known time interval.'));
                                                return r
                                            }(a.granularity, "".concat(t, ".dataSpec.granularity")),
                                            filters: ef(a.filters, "".concat(t, ".dataSpec.filters"))
                                        },
                                        chartSpec: {
                                            chartType: s,
                                            overlays: u,
                                            smoothing: ec(o.smoothing, "".concat(t, ".chartSpec.smoothing"))
                                        }
                                    }
                                }(a, t, n)
                            }(e.chart, "".concat(n, ".component.chart"), a)
                        }
                    };
                    if ("SummaryCard" === e.type) return {
                        type: "Component",
                        component: {
                            type: "SummaryCard",
                            summaryCard: function(e, t, r) {
                                let n = C(e, t);
                                if ("SummaryCard" !== n.type) throw new i.CustomDashboardValidationError("".concat(t, ".type"), "".concat(t, '.type must be "SummaryCard".'));
                                let a = D(n.overlays) ? n.overlays : void 0,
                                    o = eb(n.metric, "".concat(t, ".metric")),
                                    s = function(e, t) {
                                        let r = w(e, t);
                                        if (!(X(M, r) || L.test(r))) throw new i.CustomDashboardValidationError(t, "".concat(t, ' "').concat(r, '" is not a known summary-card aggregation.'));
                                        return r
                                    }(n.aggregation, "".concat(t, ".aggregation")),
                                    c = o.metricKey ? v(o.metricKey, s) : s;
                                if (!c) throw new i.CustomDashboardValidationError("".concat(t, ".aggregation"), "".concat(t, ".aggregation is not supported by the selected metric."));
                                return {
                                    type: "SummaryCard",
                                    tileId: T(n.tileId, "".concat(t, ".tileId")),
                                    title: ey(n.title, "".concat(t, ".title"), r),
                                    titleSource: eu(n.titleSource, "".concat(t, ".titleSource")),
                                    metric: o,
                                    aggregation: c,
                                    overlays: a ? {
                                        periodOverPeriod: N(a.periodOverPeriod, "".concat(t, ".overlays.periodOverPeriod"))
                                    } : void 0,
                                    filters: ef(n.filters, "".concat(t, ".filters"))
                                }
                            }(e.summaryCard, "".concat(n, ".component.summaryCard"), a)
                        }
                    };
                    throw new i.CustomDashboardValidationError("".concat(n, ".component.type"), "".concat(n, '.component.type must be "Chart" or "SummaryCard".'))
                }
                if ("Grid" === o.type) {
                    let e = o.columnCount;
                    if (1 !== e && 2 !== e) throw new i.CustomDashboardValidationError("".concat(n, ".columnCount"), "".concat(n, ".columnCount must be 1 or 2."));
                    let t = eD(o.children, "".concat(n, ".children"), s);
                    if (0 === t.length || t.length > e && !t.every(h)) throw new i.CustomDashboardValidationError("".concat(n, ".children"), "".concat(n, ".children must contain between 1 and ").concat(e, " child node(s)."));
                    return {
                        type: "Grid",
                        columnCount: e,
                        children: t
                    }
                }
                if ("Flex" === o.type || "Stack" === o.type) return {
                    type: o.type,
                    children: eD(o.children, "".concat(n, ".children"), s)
                };
                throw new i.CustomDashboardValidationError("".concat(n, ".type"), "".concat(n, '.type must be "Component", "Grid", "Flex", or "Stack".'))
            })(e, t, a)),
            m = new Set,
            y = 0,
            g = 0,
            b = (e, t, r) => {
                if (m.has(e)) throw new i.CustomDashboardValidationError(r, 'Duplicate tileId "'.concat(e, '".'));
                m.add(e), "Chart" === t ? g += 1 : y += 1
            };
        if (l.forEach((e, t) => (function e(t, r, n) {
                "Component" === t.type ? r("Chart" === t.component.type ? t.component.chart.tileId : t.component.summaryCard.tileId, t.component.type, "".concat(n, ".component.").concat("Chart" === t.component.type ? "chart" : "summaryCard", ".tileId")) : t.children.forEach((t, a) => e(t, r, "".concat(n, ".children[").concat(a, "]")))
            })(e, b, "config.page.surface.bodyNodes[".concat(t, "]"))), a) {
            if (y > a.maxSummaryCardsPerDashboard) throw new i.CustomDashboardValidationError("config.page.surface.bodyNodes", "A dashboard may have at most ".concat(a.maxSummaryCardsPerDashboard, " summary cards."));
            if (g > a.maxChartTilesPerDashboard) throw new i.CustomDashboardValidationError("config.page.surface.bodyNodes", "A dashboard may have at most ".concat(a.maxChartTilesPerDashboard, " chart tiles."))
        }
        return {
            page: {
                mode: o.DashboardPageMode.Untabbed,
                surface: {
                    controls: function(e, r) {
                        let n;
                        if (null == e) return {};
                        let a = C(e, r);
                        return {
                            timeRangeOptions: function(e, r) {
                                if (null == e) return;
                                let n = C(e, r);
                                if ("None" === n.type) return {
                                    type: "None"
                                };
                                if ("DateRange" !== n.type) throw new i.CustomDashboardValidationError("".concat(r, ".type"), "".concat(r, '.type must be "None" or "DateRange".'));
                                return {
                                    type: "DateRange",
                                    defaultSelection: function(e, r) {
                                        if (null == e) return;
                                        let n = C(e, r);
                                        if ("Relative" === n.type) {
                                            if (!er(n.rangeType) || n.rangeType === t.RAQIV2DateRangeType.Custom) throw new i.CustomDashboardValidationError("".concat(r, ".rangeType"), "".concat(r, ".rangeType must be a preset date range."));
                                            if (!p(n.rangeType)) throw new i.CustomDashboardValidationError("".concat(r, ".rangeType"), "".concat(r, ".rangeType must span less than ").concat(56, " days."));
                                            return {
                                                type: "Relative",
                                                rangeType: n.rangeType
                                            }
                                        }
                                        if ("Custom" === n.type) {
                                            let e = S(n.startTimeMs, "".concat(r, ".startTimeMs")),
                                                t = S(n.endTimeMs, "".concat(r, ".endTimeMs"));
                                            if (e > t) throw new i.CustomDashboardValidationError(r, "".concat(r, " custom startTimeMs must be before endTimeMs."));
                                            if (!f(e, t)) throw new i.CustomDashboardValidationError(r, "".concat(r, " custom date range must span less than ").concat(56, " days."));
                                            return {
                                                type: "Custom",
                                                startTimeMs: e,
                                                endTimeMs: t
                                            }
                                        }
                                        throw new i.CustomDashboardValidationError("".concat(r, ".type"), "".concat(r, '.type must be "Relative" or "Custom".'))
                                    }(n.defaultSelection, "".concat(r, ".defaultSelection"))
                                }
                            }(a.timeRangeOptions, "".concat(r, ".timeRangeOptions")),
                            filterDimensions: eg(a.filterDimensions, "".concat(r, ".filterDimensions")),
                            defaultFilters: (n = ep(a.defaultFilters, "".concat(r, ".defaultFilters"))).length > 0 ? n : void 0,
                            breakdownDimensions: eg(a.breakdownDimensions, "".concat(r, ".breakdownDimensions")),
                            defaultBreakdown: function(e, t) {
                                if (null == e) return;
                                if (!Array.isArray(e)) throw new i.CustomDashboardValidationError(t, "".concat(t, " must be an array."));
                                let r = e.map((e, r) => {
                                    let n = T(e, "".concat(t, "[").concat(r, "]"));
                                    if (!$(n)) throw new i.CustomDashboardValidationError("".concat(t, "[").concat(r, "]"), "".concat(t, "[").concat(r, "] must be a known RAQI dimension."));
                                    return n
                                });
                                return r.length > 0 ? r : void 0
                            }(a.defaultBreakdown, "".concat(r, ".defaultBreakdown")),
                            defaultGranularity: function(e, t) {
                                if (null == e) return;
                                let r = T(e, t);
                                if (!K.includes(r)) throw new i.CustomDashboardValidationError(t, "".concat(t, " must be a known granularity."));
                                return r
                            }(a.defaultGranularity, "".concat(r, ".defaultGranularity")),
                            annotationOptions: function(e, t) {
                                var r, n;
                                if (null == e) return;
                                let a = C(e, t);
                                return {
                                    supportedAnnotationTypes: null != (r = ev(a.supportedAnnotationTypes, "".concat(t, ".supportedAnnotationTypes"))) ? r : [],
                                    defaultAnnotationTypes: null != (n = ev(a.defaultAnnotationTypes, "".concat(t, ".defaultAnnotationTypes"))) ? n : [],
                                    showAnnotationsControl: void 0 === a.showAnnotationsControl || null === a.showAnnotationsControl || I(a.showAnnotationsControl, "".concat(t, ".showAnnotationsControl"))
                                }
                            }(a.annotationOptions, "".concat(r, ".annotationOptions"))
                        }
                    }(u.controls, "config.page.surface.controls"),
                    bodyNodes: l
                }
            }
        }
    }
    e.s(["isCanonicalRAQIV2Dimension", 0, J, "isChartAggregation", 0, et, "isDateRangeType", 0, er, "isDefaultAnnotationType", 0, ee, "isDefaultBreakdownDimension", 0, $, "isMetricKey", 0, ei, "isPersistableBreakdownDimension", 0, Z, "isRAQIV2AggregationType", 0, en, "isRAQIV2PercentileType", 0, ea, "validateCustomDashboardConfig", 0, eC, "validateCustomDashboardDocument", 0, function(e) {
        var t;
        let r, n = C(e, "document");
        if (n.schemaVersion !== o.LOCAL_STORAGE_DOCUMENT_SCHEMA_VERSION) throw new i.CustomDashboardValidationError("schemaVersion", "schemaVersion must equal ".concat(o.LOCAL_STORAGE_DOCUMENT_SCHEMA_VERSION, " (got ").concat(String(n.schemaVersion), "). Run applyMigrations first."));
        let {
            status: a
        } = n;
        if (!("string" == typeof a && X(B, a))) throw new i.CustomDashboardValidationError("status", 'status must be "draft" or "published".');
        void 0 !== n.description && null !== n.description && (r = em(w(n.description, "description"), null));
        let s = I(n.isPinned, "isPinned"),
            c = s ? V(n.pinnedAt, "pinnedAt") : void 0;
        if (void 0 === n.config || null === n.config) throw new i.CustomDashboardValidationError("config", "config is required. Service-layer create() must substitute EMPTY_DASHBOARD_CONFIG before validation.");
        return {
            ...n,
            id: T(n.id, "id"),
            schemaVersion: o.LOCAL_STORAGE_DOCUMENT_SCHEMA_VERSION,
            universeId: S(n.universeId, "universeId"),
            name: eh(w(n.name, "name"), null),
            description: r,
            status: a,
            isPinned: s,
            pinnedAt: c,
            createdAt: R(n.createdAt, "createdAt"),
            updatedAt: R(n.updatedAt, "updatedAt"),
            publishedAt: V(n.publishedAt, "publishedAt"),
            createdByUserId: S(n.createdByUserId, "createdByUserId"),
            createdByUsername: w(null != (t = n.createdByUsername) ? t : "", "createdByUsername"),
            updatedByUserId: _(S)(n.updatedByUserId, "updatedByUserId"),
            updatedByUsername: _(T)(n.updatedByUsername, "updatedByUsername"),
            config: eC(n.config, {
                limits: null
            })
        }
    }, "validateDashboardDescription", 0, em, "validateDashboardName", 0, eh], 646877);
    let ew = {
            [r.ChartType.Spline]: 1,
            [r.ChartType.Area]: 2,
            [r.ChartType.DurationSpline]: 7,
            [r.ChartType.DurationArea]: 8,
            [r.ChartType.Bar]: 3,
            [r.ChartType.Column]: 4,
            [r.ChartType.Pie]: 5,
            [r.ChartType.Table]: 6
        },
        eT = {
            DASHBOARD_CHART_TYPE_SPLINE: r.ChartType.Spline,
            DASHBOARD_CHART_TYPE_AREA: r.ChartType.Area,
            DASHBOARD_CHART_TYPE_DURATION_SPLINE: r.ChartType.DurationSpline,
            DASHBOARD_CHART_TYPE_DURATION_AREA: r.ChartType.DurationArea,
            DASHBOARD_CHART_TYPE_BAR: r.ChartType.Bar,
            DASHBOARD_CHART_TYPE_COLUMN: r.ChartType.Column,
            DASHBOARD_CHART_TYPE_PIE: r.ChartType.Pie,
            DASHBOARD_CHART_TYPE_TABLE: r.ChartType.Table,
            1: r.ChartType.Spline,
            2: r.ChartType.Area,
            7: r.ChartType.DurationSpline,
            8: r.ChartType.DurationArea,
            3: r.ChartType.Bar,
            4: r.ChartType.Column,
            5: r.ChartType.Pie,
            6: r.ChartType.Table
        },
        eS = {
            Cumulative: 1,
            Minute: 2,
            HalfHour: 3,
            Hour: 4,
            Day: 5,
            Week: 6
        },
        eE = {
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
        eI = {
            [t.RAQIV2MetricGranularity.None]: 1,
            [t.RAQIV2MetricGranularity.OneMinute]: 2,
            [t.RAQIV2MetricGranularity.HalfHour]: 3,
            [t.RAQIV2MetricGranularity.OneHour]: 4,
            [t.RAQIV2MetricGranularity.OneDay]: 5,
            [t.RAQIV2MetricGranularity.OneWeek]: 6
        },
        eR = {
            DASHBOARD_GRANULARITY_CUMULATIVE: t.RAQIV2MetricGranularity.None,
            DASHBOARD_GRANULARITY_MINUTE: t.RAQIV2MetricGranularity.OneMinute,
            DASHBOARD_GRANULARITY_HALF_HOUR: t.RAQIV2MetricGranularity.HalfHour,
            DASHBOARD_GRANULARITY_HOUR: t.RAQIV2MetricGranularity.OneHour,
            DASHBOARD_GRANULARITY_DAY: t.RAQIV2MetricGranularity.OneDay,
            DASHBOARD_GRANULARITY_WEEK: t.RAQIV2MetricGranularity.OneWeek,
            1: t.RAQIV2MetricGranularity.None,
            2: t.RAQIV2MetricGranularity.OneMinute,
            3: t.RAQIV2MetricGranularity.HalfHour,
            4: t.RAQIV2MetricGranularity.OneHour,
            5: t.RAQIV2MetricGranularity.OneDay,
            6: t.RAQIV2MetricGranularity.OneWeek
        },
        e_ = {
            [t.RAQIV2AggregationType.Sum]: 1,
            [t.RAQIV2AggregationType.Count]: 2,
            [t.RAQIV2AggregationType.Average]: 3,
            [t.RAQIV2AggregationType.Min]: 4,
            [t.RAQIV2AggregationType.Max]: 5,
            [t.RAQIV2AggregationType.CountUser]: 7,
            [t.RAQIV2AggregationType.AveragePerUser]: 25,
            [t.RAQIV2PercentileType.AVG]: 10,
            [t.RAQIV2PercentileType.P10]: 11,
            [t.RAQIV2PercentileType.P50]: 12,
            [t.RAQIV2PercentileType.P90]: 13,
            [o.CustomDashboardSummaryCardAggregation.Total]: 20,
            [o.CustomDashboardSummaryCardAggregation.AverageOverTimePeriod]: 21,
            [o.CustomDashboardSummaryCardAggregation.MostRecentDataPoint]: 22,
            [o.CustomDashboardSummaryCardAggregation.Median]: 23,
            [o.CustomDashboardSummaryCardAggregation.Cumulative]: 24,
            [o.CustomDashboardSummaryCardAggregation.AveragePerUniqueUser]: 25
        },
        eV = {
            DASHBOARD_AGGREGATION_SUM: t.RAQIV2AggregationType.Sum,
            DASHBOARD_AGGREGATION_COUNT: t.RAQIV2AggregationType.Count,
            DASHBOARD_AGGREGATION_AVERAGE: t.RAQIV2AggregationType.Average,
            DASHBOARD_AGGREGATION_MIN: t.RAQIV2AggregationType.Min,
            DASHBOARD_AGGREGATION_MAX: t.RAQIV2AggregationType.Max,
            DASHBOARD_AGGREGATION_DISTINCT_COUNT: t.RAQIV2AggregationType.CountUser,
            DASHBOARD_AGGREGATION_UNIQUE_COUNT: t.RAQIV2AggregationType.CountUser,
            DASHBOARD_AGGREGATION_PERCENTILE_AVG: t.RAQIV2PercentileType.AVG,
            DASHBOARD_AGGREGATION_PERCENTILE_P10: t.RAQIV2PercentileType.P10,
            DASHBOARD_AGGREGATION_PERCENTILE_P50: t.RAQIV2PercentileType.P50,
            DASHBOARD_AGGREGATION_PERCENTILE_P90: t.RAQIV2PercentileType.P90,
            DASHBOARD_AGGREGATION_TOTAL: o.CustomDashboardSummaryCardAggregation.Total,
            DASHBOARD_AGGREGATION_AVERAGE_OVER_TIME_PERIOD: o.CustomDashboardSummaryCardAggregation.AverageOverTimePeriod,
            DASHBOARD_AGGREGATION_MOST_RECENT_DATA_POINT: o.CustomDashboardSummaryCardAggregation.MostRecentDataPoint,
            DASHBOARD_AGGREGATION_MEDIAN: o.CustomDashboardSummaryCardAggregation.Median,
            DASHBOARD_AGGREGATION_CUMULATIVE: o.CustomDashboardSummaryCardAggregation.Cumulative,
            DASHBOARD_AGGREGATION_AVERAGE_PER_UNIQUE_USER: t.RAQIV2AggregationType.AveragePerUser,
            1: t.RAQIV2AggregationType.Sum,
            2: t.RAQIV2AggregationType.Count,
            3: t.RAQIV2AggregationType.Average,
            4: t.RAQIV2AggregationType.Min,
            5: t.RAQIV2AggregationType.Max,
            6: t.RAQIV2AggregationType.CountUser,
            7: t.RAQIV2AggregationType.CountUser,
            10: t.RAQIV2PercentileType.AVG,
            11: t.RAQIV2PercentileType.P10,
            12: t.RAQIV2PercentileType.P50,
            13: t.RAQIV2PercentileType.P90,
            20: o.CustomDashboardSummaryCardAggregation.Total,
            21: o.CustomDashboardSummaryCardAggregation.AverageOverTimePeriod,
            22: o.CustomDashboardSummaryCardAggregation.MostRecentDataPoint,
            23: o.CustomDashboardSummaryCardAggregation.Median,
            24: o.CustomDashboardSummaryCardAggregation.Cumulative,
            25: t.RAQIV2AggregationType.AveragePerUser
        },
        eO = {
            [o.SummaryCardTitleSource.Auto]: 1,
            [o.SummaryCardTitleSource.Custom]: 2
        },
        eN = {
            DASHBOARD_TITLE_SOURCE_AUTO: o.SummaryCardTitleSource.Auto,
            DASHBOARD_TITLE_SOURCE_CUSTOM: o.SummaryCardTitleSource.Custom,
            1: o.SummaryCardTitleSource.Auto,
            2: o.SummaryCardTitleSource.Custom
        },
        eU = {
            none: 1,
            weekly: 2
        },
        eM = {
            DASHBOARD_CHART_SMOOTHING_NONE: "none",
            DASHBOARD_CHART_SMOOTHING_WEEKLY: "weekly",
            1: "none",
            2: "weekly"
        };

    function eP(e) {
        return "object" == typeof e && null !== e && !Array.isArray(e)
    }

    function ek(e) {
        return String(e)
    }

    function ex(e) {
        throw new i.CustomDashboardValidationError("backendContract", e)
    }

    function eB(e, t, r) {
        let n = t[ek(e)];
        return void 0 === n && ex("Unsupported ".concat(r, " value ").concat(String(e), ".")), n
    }

    function eL(e, t, r) {
        let n = t[ek(e)];
        return void 0 === n && ex("Unsupported backend ".concat(r, " value ").concat(String(e), ".")), n
    }

    function eQ(e) {
        let t = new Date(e).toISOString();
        return Number.isNaN(Date.parse(t)) && ex("Timestamp is outside the supported RFC3339 range."), t
    }

    function eH(e, t) {
        if ("string" == typeof e) {
            let r = Date.parse(e);
            return Number.isFinite(r) || ex("".concat(t, " is not a valid timestamp.")), r
        }
        if (eP(e)) {
            var r, n;
            let a = Number(null != (r = e.seconds) ? r : 0),
                i = Number(null != (n = e.nanos) ? n : 0);
            return Number.isFinite(a) && Number.isFinite(i) || ex("".concat(t, " is not a valid timestamp.")), 1e3 * a + Math.floor(i / 1e6)
        }
        return ex("".concat(t, " is not a valid timestamp."))
    }

    function eG(e) {
        return e.map(e => ({
            dimensionKey: e.dimension,
            values: [...e.values]
        }))
    }

    function eK(e, t) {
        return null == e ? [] : (Array.isArray(e) || ex("".concat(t, " must be an array.")), e.map((e, r) => {
            var n, a;
            eP(e) || ex("".concat(t, "[").concat(r, "] must be an object."));
            let i = null != (n = null != (a = e.dimensionKey) ? a : e.dimension_key) ? n : e.dimension;
            ("string" != typeof i || 0 === i.length) && ex("".concat(t, "[").concat(r, "].dimensionKey must be a non-empty string."));
            let {
                values: o
            } = e;
            return Array.isArray(o) && o.every(e => "string" == typeof e) || ex("".concat(t, "[").concat(r, "].values must be an array of strings.")), {
                dimension: i,
                values: o
            }
        }))
    }

    function eF(e, t, r) {
        if (null != e) return Array.isArray(e) && e.every(e => "string" == typeof e) || ex("".concat(t, " must be an array of strings.")), e.map((e, n) => r(e) ? e : ex("".concat(t, "[").concat(n, "] is unsupported.")))
    }

    function ej(e, r) {
        var n;
        return (n = e.dimension) !== t.RAQIV2Dimension.CustomEventName && J(n) ? {
            dimension: e.dimension,
            values: [...e.values]
        } : ex("".concat(r, " contains an unsupported dimension."))
    }

    function ez(e) {
        if (e && 0 !== e.length) return e.map(e => ({
            pseudoDimensionKey: e.pseudoDimensionKey,
            variantKey: e.variantKey
        }))
    }
    let eq = {
        SUM: t.RAQIV2AggregationType.Sum,
        COUNT: t.RAQIV2AggregationType.Count,
        AVERAGE: t.RAQIV2AggregationType.Average,
        MIN: t.RAQIV2AggregationType.Min,
        MAX: t.RAQIV2AggregationType.Max,
        COUNT_USER: t.RAQIV2AggregationType.CountUser,
        AVERAGE_PER_USER: t.RAQIV2AggregationType.AveragePerUser
    };

    function eY(e) {
        return Object.hasOwn(eq, e) ? eq[e] : void 0
    }

    function eW(e) {
        if (Array.isArray(e) && 0 !== e.length) return e.map((e, r) => {
            var n, a;
            let i, o, {
                    pseudoDimensionKey: s,
                    variantKey: c
                } = (eP(e) || ex("variantSelections[".concat(r, "] must be an object.")), i = null != (n = e.pseudoDimensionKey) ? n : e.pseudo_dimension_key, o = null != (a = e.variantKey) ? a : e.variant_key, ("string" != typeof i || "string" != typeof o) && ex("variantSelections[".concat(r, "] is missing keys.")), {
                    pseudoDimensionKey: i,
                    variantKey: o
                }),
                u = s === t.RAQIV2UIPseudoDimension.AggregationType ? eY(c) : void 0;
            return {
                pseudoDimensionKey: s,
                variantKey: null != u ? u : c
            }
        })
    }

    function eX(e) {
        if (!e || 0 === e.length) return;
        let r = null,
            n = null,
            a = t.RAQIV2UIPseudoDimension.AggregationType,
            i = t.RAQIV2UIPseudoDimension.PercentileType;
        for (let t of e) t.pseudoDimensionKey === a && (en(t.variantKey) || ex("Unsupported aggregation variant ".concat(t.variantKey, ".")), r = t.variantKey), t.pseudoDimensionKey === i && (ea(t.variantKey) || ex("Unsupported percentile variant ".concat(t.variantKey, ".")), n = t.variantKey);
        if (null !== r || null !== n) return {
            aggregationType: r,
            percentile: n
        }
    }

    function e$(e) {
        let r = ez(e.variantSelections);
        if (e.computedMetric) {
            var a;
            return {
                computedMetric: {
                    sources: (a = e.computedMetric).sources.map(e => {
                        let r = e.metric,
                            a = ez(function(e) {
                                if (!e) return;
                                let r = [];
                                return e.aggregationType && r.push({
                                    pseudoDimensionKey: t.RAQIV2UIPseudoDimension.AggregationType,
                                    variantKey: e.aggregationType
                                }), e.percentile && r.push({
                                    pseudoDimensionKey: t.RAQIV2UIPseudoDimension.PercentileType,
                                    variantKey: e.percentile
                                }), r.length > 0 ? r : void 0
                            }(e.pseudoDimensionValues)),
                            i = e.filters ? eG(e.filters) : void 0;
                        return (0, n.isCustomEventsAtomicMetricLike)(r) ? {
                            sourceKey: e.key,
                            metric: {
                                customEventMetric: {
                                    metricKey: r.metric,
                                    customEventName: r.customEventName,
                                    ...r.aggregationType ? {
                                        aggregation: eB(r.aggregationType, e_, "aggregation")
                                    } : {}
                                }
                            },
                            ...i ? {
                                filters: i
                            } : {},
                            ...a ? {
                                variantSelections: a
                            } : {}
                        } : {
                            sourceKey: e.key,
                            metric: {
                                metricKey: r
                            },
                            ...i ? {
                                filters: i
                            } : {},
                            ...a ? {
                                variantSelections: a
                            } : {}
                        }
                    }),
                    formula: a.formula,
                    ...void 0 !== a.name ? {
                        displayName: a.name
                    } : {},
                    ...void 0 !== a.l7Smoothing ? {
                        l7Smoothing: a.l7Smoothing
                    } : {}
                },
                ...r ? {
                    variantSelections: r
                } : {}
            }
        }
        return {
            metricKey: e.metricKey,
            ...r ? {
                variantSelections: r
            } : {}
        }
    }

    function eJ(e, r) {
        var n, a, i;
        eP(e) || ex("".concat(r, " must be an object."));
        let o = eW(null != (n = e.variantSelections) ? n : e.variant_selections),
            s = null != (a = e.computedMetric) ? a : e.computed_metric;
        if (void 0 !== s) return {
            computedMetric: function(e, r) {
                eP(e) || ex("".concat(r, " must be an object."));
                let {
                    sources: n,
                    formula: a,
                    displayName: i,
                    l7Smoothing: o
                } = e;
                Array.isArray(n) && 0 !== n.length && "string" == typeof a || ex("".concat(r, " is not a valid computed metric."));
                let [s, ...c] = n.map((e, n) => {
                    var a, i, o, s, c, u, l, d, h;
                    let m, p, f;
                    eP(e) || ex("".concat(r, ".sources[").concat(n, "] must be an object."));
                    let y = null != (a = null != (i = e.sourceKey) ? i : e.source_key) ? a : e.key;
                    ("string" != typeof y || 0 === y.length) && ex("".concat(r, ".sources[").concat(n, "].sourceKey must be set."));
                    let g = void 0 === e.filters ? void 0 : eK(e.filters, "".concat(r, ".sources[").concat(n, "].filters")),
                        v = eW(null != (o = e.variantSelections) ? o : e.variant_selections),
                        b = e.metric,
                        A = null != (s = e.metricKey) ? s : e.metric_key;
                    if (void 0 !== b && void 0 !== A && ex("".concat(r, ".sources[").concat(n, "] must not contain both metric and metricKey representations.")), void 0 !== A)
                        if ("string" != typeof A && ex("".concat(r, ".sources[").concat(n, "].metricKey must be a string.")), A === t.RAQIV2UIMetric.CustomEventsV2) {
                            let e = null != (c = null == g ? void 0 : g.filter(e => e.dimension === t.RAQIV2Dimension.CustomEventName)) ? c : [],
                                a = e[0],
                                i = null == a ? void 0 : a.values[0];
                            (1 !== e.length || (null == a ? void 0 : a.values.length) !== 1 || "string" != typeof i || 0 === i.trim().length) && ex("".concat(r, ".sources[").concat(n, "] must contain exactly one non-empty ") + "".concat(t.RAQIV2Dimension.CustomEventName, " filter for a canonical custom event."));
                            let o = null != (u = null == v ? void 0 : v.filter(e => e.pseudoDimensionKey === t.RAQIV2UIPseudoDimension.AggregationType)) ? u : [];
                            1 !== o.length && ex("".concat(r, ".sources[").concat(n, "] must contain exactly one ") + "".concat(t.RAQIV2UIPseudoDimension.AggregationType, " selection for a canonical custom event."));
                            let s = o[0];
                            s && en(s.variantKey) || ex("".concat(r, ".sources[").concat(n, "] has an invalid custom-event aggregation.")), m = {
                                metric: t.RAQIV2UIMetric.CustomEventsV2,
                                customEventName: i,
                                aggregationType: s.variantKey
                            }, p = null == g ? void 0 : g.filter(e => e.dimension !== t.RAQIV2Dimension.CustomEventName).map(e => ej(e, "".concat(r, ".sources[").concat(n, "].filters"))), f = eX(null == v ? void 0 : v.filter(e => e.pseudoDimensionKey !== t.RAQIV2UIPseudoDimension.AggregationType))
                        } else ei(A) || ex("".concat(r, ".sources[").concat(n, "].metricKey is unsupported.")), m = A, p = null == g ? void 0 : g.map(e => ej(e, "".concat(r, ".sources[").concat(n, "].filters"))), f = eX(v);
                    else {
                        eP(b) || ex("".concat(r, ".sources[").concat(n, "] must contain either metric or metricKey."));
                        let e = null != (l = b.customEventMetric) ? l : b.custom_event_metric;
                        if (eP(e)) {
                            let a, i = null != (d = e.customEventName) ? d : e.custom_event_name;
                            ("string" != typeof i || 0 === i.trim().length) && ex("".concat(r, ".sources[").concat(n, "].metric.customEventMetric is invalid.")), m = {
                                metric: t.RAQIV2UIMetric.CustomEventsV2,
                                customEventName: i,
                                ...void 0 !== e.aggregation ? {
                                    aggregationType: en(a = eL(e.aggregation, eV, "aggregation")) ? a : ex("Unsupported custom-event aggregation ".concat(a, "."))
                                } : {}
                            }
                        } else {
                            let e = null != (h = b.metricKey) ? h : b.metric_key;
                            "string" != typeof e && ex("".concat(r, ".sources[").concat(n, "].metric.metricKey must be set.")), ei(e) || ex("".concat(r, ".sources[").concat(n, "].metric.metricKey is unsupported.")), m = e
                        }
                        p = null == g ? void 0 : g.map(e => ej(e, "".concat(r, ".sources[").concat(n, "].filters"))), f = eX(eP(e) ? null == v ? void 0 : v.filter(e => e.pseudoDimensionKey !== t.RAQIV2UIPseudoDimension.AggregationType) : v)
                    }
                    return {
                        key: y,
                        metric: m,
                        ...void 0 !== p ? {
                            filters: p
                        } : {},
                        ...void 0 !== f ? {
                            pseudoDimensionValues: f
                        } : {}
                    }
                });
                return s || ex("".concat(r, ".sources must be non-empty.")), {
                    sources: [s, ...c],
                    formula: a,
                    ..."string" == typeof i ? {
                        name: i
                    } : {},
                    ..."boolean" == typeof o ? {
                        l7Smoothing: o
                    } : {}
                }
            }(s, "".concat(r, ".computedMetric")),
            variantSelections: o
        };
        let c = null != (i = e.metricKey) ? i : e.metric_key;
        return ("string" != typeof c || 0 === c.length) && ex("".concat(r, ".metricKey must be set.")), {
            metricKey: ei(c) ? c : ex("".concat(r, ".metricKey is not a supported numeric metric.")),
            variantSelections: o
        }
    }

    function eZ(e, t) {
        var r, n, i, o, s, c, u, l, d;
        let h;
        if (null == e) return {};
        eP(e) || ex("".concat(t, " must be an object."));
        let m = eP(e.granularity) ? null != (r = e.granularity.fixed) ? r : e.granularity : void 0,
            p = eP(m) ? m.granularity : void 0,
            f = void 0 === p ? void 0 : eR[ek(p)],
            y = null != (n = e.annotationOptions) ? n : e.annotation_options,
            g = eP(y) ? (h = null != (l = eF(null != (d = y.defaultAnnotationTypeKeys) ? d : y.default_annotation_type_keys, "".concat(t, ".annotationOptions.defaultAnnotationTypeKeys"), ee)) ? l : [], {
                supportedAnnotationTypes: (0, a.resolveCustomDashboardSupportedAnnotationTypes)(h),
                defaultAnnotationTypes: h,
                showAnnotationsControl: "boolean" == typeof y.showAnnotationsControl ? y.showAnnotationsControl : "boolean" != typeof y.show_annotations_control || y.show_annotations_control
            }) : void 0,
            v = null != (i = e.defaultFilters) ? i : e.default_filters,
            b = void 0 === v ? void 0 : eK(v, "".concat(t, ".defaultFilters")),
            A = eF(null != (o = e.filterDimensionKeys) ? o : e.filter_dimension_keys, "".concat(t, ".filterDimensionKeys"), J),
            D = eF(null != (s = e.breakdownDimensionKeys) ? s : e.breakdown_dimension_keys, "".concat(t, ".breakdownDimensionKeys"), J),
            C = eF(null != (c = e.defaultBreakdownDimensionKeys) ? c : e.default_breakdown_dimension_keys, "".concat(t, ".defaultBreakdownDimensionKeys"), $);
        return {
            timeRangeOptions: function(e, t) {
                var r, n;
                if (null == e) return;
                if (eP(e) || ex("".concat(t, " must be an object.")), void 0 !== e.none) return {
                    type: "None"
                };
                let a = null != (r = e.dateRange) ? r : e.date_range;
                if (void 0 !== a) return eP(a) || ex("".concat(t, ".dateRange must be an object.")), {
                    type: "DateRange",
                    defaultSelection: function(e, t) {
                        var r, n, a, i;
                        if (null == e) return;
                        eP(e) || ex("".concat(t, " must be an object."));
                        let o = null != (r = e.relativeRangeKey) ? r : e.relative_range_key;
                        if ("string" == typeof o) return er(o) || ex("".concat(t, ".relativeRangeKey is unsupported.")), {
                            type: "Relative",
                            rangeType: o
                        };
                        let s = null != (n = e.customRange) ? n : e.custom_range;
                        if (eP(s)) return {
                            type: "Custom",
                            startTimeMs: eH(null != (a = s.startTime) ? a : s.start_time, "".concat(t, ".customRange.startTime")),
                            endTimeMs: eH(null != (i = s.endTime) ? i : s.end_time, "".concat(t, ".customRange.endTime"))
                        }
                    }(null != (n = a.defaultSelection) ? n : a.default_selection, "".concat(t, ".dateRange.defaultSelection"))
                }
            }(null != (u = e.timeRangeOptions) ? u : e.time_range_options, "".concat(t, ".timeRangeOptions")),
            filterDimensions: A,
            defaultFilters: b,
            breakdownDimensions: D,
            defaultBreakdown: C,
            defaultGranularity: f,
            annotationOptions: g
        }
    }

    function e0(e) {
        return {
            metric: e$(e.metric),
            seriesKey: e.seriesKey,
            ...e.filters ? {
                filters: eG(e.filters)
            } : {},
            ...e.aggregation ? {
                aggregation: eB(e.aggregation, e_, "aggregation")
            } : {}
        }
    }

    function e1(e, t) {
        var r, n, a, i;
        eP(e) || ex("".concat(t, " must be an object."));
        let s = null != (r = e.summaryCard) ? r : e.summary_card;
        if (void 0 !== s) {
            let e, r;
            return {
                type: "Component",
                component: {
                    type: "SummaryCard",
                    summaryCard: (n = "".concat(t, ".summaryCard"), eP(s) || ex("".concat(n, " must be an object.")), ("string" != typeof(e = null != (a = s.tileId) ? a : s.tile_id) || 0 === e.length) && ex("".concat(n, ".tileId must be set.")), r = null != (i = s.titleSource) ? i : s.title_source, {
                        type: "SummaryCard",
                        tileId: e,
                        ..."string" == typeof s.title ? {
                            title: s.title
                        } : {},
                        metric: eJ(s.metric, "".concat(n, ".metric")),
                        aggregation: eL(s.aggregation, eV, "aggregation"),
                        filters: eK(s.filters, "".concat(n, ".filters")),
                        ...void 0 !== r ? {
                            titleSource: eL(r, eN, "titleSource")
                        } : {}
                    })
                }
            }
        }
        let c = e.chart;
        return void 0 !== c ? {
            type: "Component",
            component: {
                type: "Chart",
                chart: function(e, t) {
                    var r, n, a, i, s;
                    let c, u;
                    eP(e) || ex("".concat(t, " must be an object."));
                    let l = null != (r = e.tileId) ? r : e.tile_id;
                    ("string" != typeof l || 0 === l.length) && ex("".concat(t, ".tileId must be set."));
                    let d = null != (n = e.dataSpec) ? n : e.data_spec,
                        h = null != (a = e.chartSpec) ? a : e.chart_spec;
                    eP(d) && eP(h) || ex("".concat(t, " must include dataSpec and chartSpec.")), Array.isArray(d.metrics) || ex("".concat(t, ".dataSpec.metrics must be an array."));
                    let m = eL(null != (i = h.chartType) ? i : h.chart_type, eT, "chartType"),
                        p = d.granularity,
                        f = h.smoothing;
                    if (void 0 !== d.aggregation) {
                        let e = eL(d.aggregation, eV, "aggregation");
                        et(e) || ex("Unsupported chart aggregation ".concat(e, ".")), c = e
                    }
                    let y = null != (s = d.breakdownDimensionKeys) ? s : d.breakdown_dimension_keys;
                    Array.isArray(y) && (y.every(e => "string" == typeof e) || ex("".concat(t, ".dataSpec.breakdownDimensionKeys must contain strings.")), u = y);
                    let g = void 0 !== p ? eL(p, eE, "granularity") : o.DEFAULT_CHART_GRANULARITY;
                    return {
                        type: "Chart",
                        tileId: l,
                        ..."string" == typeof e.title ? {
                            title: e.title
                        } : {},
                        dataSpec: {
                            metrics: d.metrics.map((e, r) => {
                                var n, a;
                                let i, o;
                                return n = "".concat(t, ".dataSpec.metrics[").concat(r, "]"), eP(e) || ex("".concat(n, " must be an object.")), ("string" != typeof(i = null != (a = e.seriesKey) ? a : e.series_key) || 0 === i.length) && ex("".concat(n, ".seriesKey must be set.")), {
                                    metric: eJ(e.metric, "".concat(n, ".metric")),
                                    seriesKey: i,
                                    ...void 0 === e.filters ? {} : {
                                        filters: eK(e.filters, "".concat(n, ".filters"))
                                    },
                                    ...void 0 !== e.aggregation ? {
                                        aggregation: et(o = eL(e.aggregation, eV, "aggregation")) ? o : ex("Unsupported chart aggregation ".concat(o, "."))
                                    } : {}
                                }
                            }),
                            ...void 0 !== c ? {
                                aggregation: c
                            } : {},
                            ...void 0 !== u ? {
                                breakdownDimensions: u
                            } : {},
                            granularity: g,
                            filters: eK(d.filters, "".concat(t, ".dataSpec.filters"))
                        },
                        chartSpec: {
                            chartType: m,
                            overlays: function(e) {
                                var t, r, n, a;
                                if (!eP(e)) return;
                                let i = {
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
                                        previousPeriod: !!(null != (a = e.previousPeriod) ? a : e.previous_period)
                                    } : {},
                                    ..."boolean" == typeof e.quota ? {
                                        quota: e.quota
                                    } : {}
                                };
                                return Object.keys(i).length > 0 ? i : void 0
                            }(h.overlays),
                            ...void 0 !== f ? {
                                smoothing: eL(f, eM, "smoothing")
                            } : {}
                        }
                    }
                }(c, "".concat(t, ".chart"))
            }
        } : ex("".concat(t, " must set chart or summaryCard."))
    }

    function e2(e) {
        switch (e.type) {
            case "Component":
                var r, n, a, i, c, u;
                let l, d, h;
                return {
                    component: "SummaryCard" === (r = e.component).type ? {
                        summaryCard: {
                            tileId: (n = r.summaryCard).tileId,
                            ...void 0 !== n.title ? {
                                title: n.title
                            } : {},
                            metric: e$(n.metric),
                            aggregation: eB(n.aggregation, e_, "aggregation"),
                            filters: eG(n.filters),
                            titleSource: eB(null != (a = n.titleSource) ? a : o.SummaryCardTitleSource.Auto, eO, "titleSource")
                        }
                    } : {
                        chart: (l = function(e) {
                            if (!e) return;
                            let t = {};
                            return void 0 !== e.genreBenchmark && (t.genreBenchmark = e.genreBenchmark), void 0 !== e.similarExperienceBenchmark && (t.similarExperienceBenchmark = e.similarExperienceBenchmark), void 0 !== e.topExperienceBenchmark && (t.topExperienceBenchmark = e.topExperienceBenchmark), void 0 !== e.previousPeriod && ("boolean" != typeof e.previousPeriod && ex("Backend v1 cannot persist configured previous-period comparison offsets."), t.previousPeriod = e.previousPeriod), void 0 !== e.quota && (t.quota = e.quota), Object.keys(t).length > 0 ? t : void 0
                        }((i = r.chart).chartSpec.overlays), d = null == (u = i.dataSpec.metrics[0]) ? void 0 : u.metric, h = null != (c = i.dataSpec.aggregation) ? c : void 0 !== d ? (0, s.resolveDefaultChartAggregation)(d) : t.RAQIV2AggregationType.Average, {
                            tileId: i.tileId,
                            ...void 0 !== i.title ? {
                                title: i.title
                            } : {},
                            dataSpec: {
                                metrics: i.dataSpec.metrics.map(e0),
                                aggregation: eB(h, e_, "aggregation"),
                                ...i.dataSpec.breakdownDimensions ? {
                                    breakdownDimensionKeys: [...i.dataSpec.breakdownDimensions]
                                } : {},
                                granularity: eB(i.dataSpec.granularity, eS, "granularity"),
                                filters: eG(i.dataSpec.filters)
                            },
                            chartSpec: {
                                chartType: eB(i.chartSpec.chartType, ew, "chartType"),
                                ...l ? {
                                    overlays: l
                                } : {},
                                ...i.chartSpec.smoothing ? {
                                    smoothing: eB(i.chartSpec.smoothing, eU, "smoothing")
                                } : {}
                            }
                        })
                    }
                };
            case "Stack":
                return {
                    stack: {
                        children: e.children.map(e2)
                    }
                };
            case "Flex":
                return {
                    flex: {
                        children: e.children.map(e2)
                    }
                };
            case "Grid":
                return {
                    grid: {
                        columnCount: e.columnCount,
                        children: e.children.map(e2)
                    }
                };
            default:
                return ex("Unsupported layout node ".concat(JSON.stringify(e), "."))
        }
    }

    function e3(e, t) {
        var r, n;
        if (eP(e) || ex("".concat(t, " must be an object.")), "string" == typeof e.type) {
            if ("Component" === e.type) return e1(e.component, "".concat(t, ".component"));
            if ("Stack" === e.type || "Flex" === e.type) return Array.isArray(e.children) || ex("".concat(t, ".children must be an array.")), {
                type: e.type,
                children: e.children.map((e, r) => e3(e, "".concat(t, ".children[").concat(r, "]")))
            };
            if ("Grid" === e.type) {
                Array.isArray(e.children) || ex("".concat(t, ".children must be an array."));
                let n = null != (r = e.columnCount) ? r : e.column_count;
                return 1 !== n && 2 !== n && ex("".concat(t, ".columnCount must be 1 or 2.")), {
                    type: "Grid",
                    columnCount: n,
                    children: e.children.map((e, r) => e3(e, "".concat(t, ".children[").concat(r, "]")))
                }
            }
        }
        if (void 0 !== e.component) return e1(e.component, "".concat(t, ".component"));
        if (void 0 !== e.stack) return eP(e.stack) && Array.isArray(e.stack.children) || ex("".concat(t, ".stack.children must be an array.")), {
            type: "Stack",
            children: e.stack.children.map((e, r) => e3(e, "".concat(t, ".stack.children[").concat(r, "]")))
        };
        if (void 0 !== e.flex) return eP(e.flex) && Array.isArray(e.flex.children) || ex("".concat(t, ".flex.children must be an array.")), {
            type: "Flex",
            children: e.flex.children.map((e, r) => e3(e, "".concat(t, ".flex.children[").concat(r, "]")))
        };
        if (void 0 !== e.grid) {
            eP(e.grid) && Array.isArray(e.grid.children) || ex("".concat(t, ".grid.children must be an array."));
            let r = null != (n = e.grid.columnCount) ? n : e.grid.column_count;
            return 1 !== r && 2 !== r && ex("".concat(t, ".grid.columnCount must be 1 or 2.")), {
                type: "Grid",
                columnCount: r,
                children: e.grid.children.map((e, r) => e3(e, "".concat(t, ".grid.children[").concat(r, "]")))
            }
        }
        return ex("".concat(t, " must set component, stack, flex, or grid."))
    }
    e.s(["backendDocumentHasUpperSnakeAggregationVariants", 0, function(e) {
        return function e(r) {
            var n, a;
            if (Array.isArray(r)) return r.some(e);
            if (!eP(r)) return !1;
            let i = null != (n = r.pseudoDimensionKey) ? n : r.pseudo_dimension_key,
                o = null != (a = r.variantKey) ? a : r.variant_key;
            return "string" == typeof i && "string" == typeof o && i === t.RAQIV2UIPseudoDimension.AggregationType && void 0 !== eY(o) || Object.values(r).some(e)
        }(e)
    }, "backendDocumentToCustomDashboardConfig", 0, function(e) {
        var t;
        eP(e) || ex("Backend custom dashboard document is missing config.");
        let r = null != (t = e.schemaVersion) ? t : e.schema_version;
        return r !== o.READABLE_BACKEND_DOCUMENT_SCHEMA_VERSIONS[0] && r !== o.READABLE_BACKEND_DOCUMENT_SCHEMA_VERSIONS[1] && ex("Unsupported backend custom dashboard schema version ".concat(String(r), ".")), eP(e.config) || ex("Backend custom dashboard document is missing config."), eP(e.config.page) || ex("config.page must be an object."), eC({
            page: function(e, t) {
                var r, n, a;
                if (eP(e) || ex("".concat(t, " must be an object.")), e.mode === o.DashboardPageMode.Untabbed) {
                    let r = e.surface;
                    eP(r) || ex("".concat(t, ".surface must be an object."));
                    let n = null != (a = r.bodyNodes) ? a : r.body_nodes;
                    return Array.isArray(n) || ex("".concat(t, ".surface.bodyNodes must be an array.")), {
                        mode: o.DashboardPageMode.Untabbed,
                        surface: {
                            controls: eZ(r.controls, "".concat(t, ".surface.controls")),
                            bodyNodes: n.map((e, r) => e3(e, "".concat(t, ".surface.bodyNodes[").concat(r, "]")))
                        }
                    }
                }
                let i = e.untabbed;
                eP(i) || ex("".concat(t, ".untabbed must be an object."));
                let s = i.surface;
                eP(s) || ex("".concat(t, ".untabbed.surface must be an object."));
                let c = null != (r = null != (n = s.bodyNodes) ? n : s.body_nodes) ? r : [];
                return Array.isArray(c) || ex("".concat(t, ".untabbed.surface.bodyNodes must be an array.")), {
                    mode: o.DashboardPageMode.Untabbed,
                    surface: {
                        controls: eZ(s.controls, "".concat(t, ".untabbed.surface.controls")),
                        bodyNodes: c.map((e, r) => e3(e, "".concat(t, ".untabbed.surface.bodyNodes[").concat(r, "]")))
                    }
                }
            }(e.config.page, "config.page")
        }, {
            limits: null
        })
    }, "customDashboardConfigToBackendDocument", 0, function(e) {
        var t, r;
        let n;
        return {
            schemaVersion: o.BACKEND_DOCUMENT_WRITE_SCHEMA_VERSION,
            config: {
                page: ((t = e.page).mode !== o.DashboardPageMode.Untabbed && ex("Only untabbed dashboard pages can be serialized to the backend."), {
                    untabbed: {
                        surface: {
                            resourceTypeKeys: [1],
                            controls: (n = (r = t.surface.controls).defaultGranularity ? eI[r.defaultGranularity] : void 0, {
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
                                                            startTime: eQ(t.startTimeMs),
                                                            endTime: eQ(t.endTimeMs)
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
                                    defaultFilters: eG(r.defaultFilters)
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
                            bodyNodes: t.surface.bodyNodes.map(e2)
                        }
                    }
                })
            }
        }
    }], 509434)
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
                    let a = "number" == typeof(n = e[r]) && Number.isSafeInteger(n) && n > 0 ? n : void 0;
                    void 0 !== a && (t[r] = a)
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
            maxDashboardsPerUniverse: a("maxDashboardsPerUniverse", e.maxDashboardsPerUniverse),
            maxPinnedDashboardsPerUniverse: a("maxPinnedDashboardsPerUniverse", e.maxPinnedDashboardsPerUniverse),
            maxSummaryCardsPerDashboard: a("maxSummaryCardsPerDashboard", e.maxSummaryCardsPerDashboard),
            maxChartTilesPerDashboard: a("maxChartTilesPerDashboard", e.maxChartTilesPerDashboard),
            maxTableMetricColumns: a("maxTableMetricColumns", e.maxTableMetricColumns),
            maxDashboardNameLength: a("maxDashboardNameLength", e.maxDashboardNameLength),
            maxDashboardDescriptionLength: a("maxDashboardDescriptionLength", e.maxDashboardDescriptionLength),
            maxTileTitleLength: a("maxTileTitleLength", e.maxTileTitleLength)
        }
    }

    function a(e, n) {
        var a;
        return void 0 === n ? r[e] : Math.min(n, null != (a = t[e]) ? a : n)
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
            let a = ["custom-dashboards", "universe", e, "list"];
            return t ? [...a, null != (r = t.pageSize) ? r : null, null != (n = t.pageToken) ? n : null] : a
        },
        listInfinite: (e, t) => ["custom-dashboards", "universe", e, "list", "infinite", null != t ? t : null],
        pinned: e => ["custom-dashboards", "universe", e, "pinned"],
        detail: (e, t) => ["custom-dashboards", "universe", e, "detail", t],
        suggestedName: e => ["custom-dashboards", "universe", e, "suggested-name"],
        capabilities: e => ["custom-dashboards", "universe", e, "capabilities"]
    }])
}, 258576, 466386, 302610, e => {
    "use strict";
    var t = e.i(157310),
        r = e.i(257969),
        n = e.i(964956);
    e.s(["useDashboardCapabilitiesQuery", 0, function(e, a, i) {
        var o;
        let s = (0, t.useQuery)({
            queryKey: n.customDashboardQueryKeys.capabilities(e),
            queryFn: () => {
                var t, n;
                return null != (t = null == (n = a.getCapabilities) ? void 0 : n.call(a, e)) ? t : Promise.resolve(r.DENIED_DASHBOARD_CAPABILITIES)
            },
            staleTime: n.CAPABILITIES_STALE_TIME_MS,
            refetchOnWindowFocus: !0,
            enabled: i.enabled && Number.isFinite(e) && e > 0
        });
        return {
            capabilities: null != (o = s.data) ? o : r.DENIED_DASHBOARD_CAPABILITIES,
            isResolved: void 0 !== s.data,
            isError: s.isError && void 0 === s.data
        }
    }], 258576);
    var a = e.i(759283);
    e.s(["parseExperienceUniverseIdFromRouter", 0, e => {
        if (!e.pathname.includes("/creations/experiences/")) return a.uninitializedUniverseId;
        let t = e.query.id;
        if ("string" != typeof t) return a.uninitializedUniverseId;
        let r = Number.parseInt(t, 10);
        return !Number.isFinite(r) || r <= 0 ? a.uninitializedUniverseId : r
    }], 466386);
    var i = e.i(36826);
    let o = {
        supportedAnnotationTypes: [i.AnnotationType.PlaceIcon, i.AnnotationType.PlaceThumbnail, i.AnnotationType.PlaceVideo, i.AnnotationType.PlaceVersion, i.AnnotationType.Benchmark, i.AnnotationType.LiveEvent, i.AnnotationType.CustomMatchmaking, i.AnnotationType.RetentionCorhortDisclaimer, i.AnnotationType.ConfigVersion, i.AnnotationType.Announcement],
        defaultAnnotationTypes: [],
        showAnnotationsControl: !0
    };
    e.s(["CUSTOM_DASHBOARD_SURFACE_ANNOTATION_OPTIONS", 0, o, "resolveCustomDashboardSupportedAnnotationTypes", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [],
            t = o.supportedAnnotationTypes,
            r = e.filter(e => !t.includes(e));
        return 0 === r.length ? [...t] : [...t, ...r]
    }], 302610)
}, 650040, 318727, 413311, e => {
    "use strict";
    var t = e.i(379843),
        r = e.i(731197);

    function n(e) {
        return e.tiles
    }

    function a(e) {
        return e.columnCount
    }
    e.s(["getChartRowColumnCount", 0, a, "getChartRowTiles", 0, n, "halfWidthRow", 0, function(e) {
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
    let i = "chart-empty-slot:",
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
                let a = [];
                for (let t = 0; t < e.length; t += r.MAX_TILES_PER_ROW) a.push({
                    columnCount: n,
                    tiles: e.slice(t, t + r.MAX_TILES_PER_ROW)
                });
                return a
            }(n, "Grid" === e.type ? 1 === e.columnCount ? 1 : r.MAX_TILES_PER_ROW : n.length > 1 ? r.MAX_TILES_PER_ROW : 1);
            return s(e.children)
        })
    }
    e.s(["getEmptyChartSlotTarget", 0, e => {
        if (!(null == e ? void 0 : e.startsWith(i))) return null;
        let t = Number.parseInt(e.slice(i.length), 10);
        return Number.isInteger(t) && t >= 0 ? {
            rowIndex: t
        } : null
    }, "selectChartPlacements", 0, function(e) {
        let t = [],
            r = 0;
        return e.forEach((e, o) => {
            let s = n(e),
                c = a(e),
                u = 1 === c ? 2 : 1;
            (s.forEach((e, n) => {
                t.push({
                    kind: "tile",
                    tileId: e.tileId,
                    tile: e,
                    rowIndex: o,
                    itemIndex: n,
                    order: r,
                    columnSpan: u
                }), r += 1
            }), !(c <= s.length)) && (t.push({
                kind: "empty-slot",
                emptySlotId: "".concat(i).concat(o),
                rowIndex: o,
                order: r,
                columnSpan: 1
            }), r += 1)
        }), t
    }, "selectChartRowsFromLayoutNodes", 0, s], 413311);
    let c = [];

    function u(e) {
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

    function m(e) {
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

    function f(e) {
        let t = "Component" === e.type ? e.component : null;
        return (null == t ? void 0 : t.type) === "SummaryCard" ? t.summaryCard : null
    }

    function y(e) {
        return ("Flex" === e.type || "Grid" === e.type) && e.children.length > 0 && e.children.every(e => null !== f(e))
    }

    function g(e) {
        return u(e).bodyNodes.flatMap(e => {
            if (y(e) && ("Flex" === e.type || "Grid" === e.type)) return e.children.map(f).filter(e => null !== e);
            let t = f(e);
            return t ? [t] : []
        })
    }
    e.s(["getChartRows", 0, function(e) {
        return s(u(e).bodyNodes.filter(e => !y(e)))
    }, "getDashboardSurface", 0, u, "getSummaryCards", 0, g, "withChartRows", 0, function(e, t) {
        let r = u(e),
            n = g(e);
        return l(e, {
            ...r,
            bodyNodes: [...n.length > 0 ? [m(n)] : c, ...t.map(p)]
        })
    }, "withDashboardSurface", 0, l, "withSummaryCards", 0, function(e, t) {
        let r = u(e);
        return l(e, {
            ...r,
            bodyNodes: [...t.length > 0 ? [m(t)] : c, ...u(e).bodyNodes.filter(e => !y(e) && null === f(e))]
        })
    }], 650040)
}, 479236, 743209, 593431, 582078, 852209, 322172, e => {
    "use strict";
    var t = e.i(221628),
        r = e.i(416340),
        n = e.i(589624),
        a = e.i(795621),
        i = e.i(692734),
        o = e.i(118413),
        s = e.i(257969),
        c = e.i(731197),
        u = e.i(283561),
        l = e.i(964956),
        d = e.i(258576),
        h = e.i(466386),
        m = e.i(721281),
        p = e.i(509434),
        f = e.i(650040),
        y = e.i(379843),
        g = e.i(296150),
        v = e.i(718389),
        b = e.i(436025);

    function A(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : b.createTileId;
        return {
            ...(0, v.default)(e),
            tileId: t()
        }
    }

    function D(e) {
        return e.toSorted((e, t) => e.isPinned !== t.isPinned ? e.isPinned ? -1 : 1 : e.updatedAt !== t.updatedAt ? e.updatedAt < t.updatedAt ? 1 : -1 : e.id === t.id ? 0 : e.id < t.id ? -1 : 1)
    }
    e.s(["cloneTileWithNewId", 0, A], 743209), e.s(["sortDashboardsForList", 0, D], 593431);
    let C = c.CONSERVATIVE_DASHBOARD_LIMITS.maxDashboardNameLength;

    function w(e) {
        return e.length > C ? e.slice(0, C) : e
    }

    function T(e, t) {
        let r = C - t.length;
        return r <= 0 ? "" : e.length > r ? e.slice(0, r) : e
    }

    function S(e, t) {
        let r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 1,
            n = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : 1e3,
            a = new Set(Array.from(e, e => e.trim())),
            i = Math.max(1, r),
            o = 0;
        for (; a.has(t(i)) && o < n;) i += 1, o += 1;
        return t(i)
    }

    function E(e, t, r) {
        let n = new Set(Array.from(e, e => e.trim())),
            a = " ".concat(r.first),
            i = "".concat(T(t, a)).concat(a);
        return n.has(i) ? w(S(e, e => {
            let n = " ".concat(r.numbered(e));
            return "".concat(T(t, n)).concat(n)
        }, 2, 1e3)) : i
    }

    function I(e) {
        return w(S(e, e => "Dashboard #".concat(e)))
    }
    e.s(["DUPLICATE_COPY_NUMBERED_SUFFIX_START", 0, 2, "buildDuplicateDashboardName", 0, E, "clipDashboardName", 0, w, "findUnusedNumberedName", 0, S, "suggestDefaultName", 0, I], 582078);
    var R = e.i(619130),
        _ = e.i(650502);
    let V = (0, R.default)({
        baseUrl: (0, _.getBEDEV2ServiceBasePath)("analytics-custom-dashboards"),
        credentials: "include",
        enableMrRouter: !0
    });
    class O extends Error {
        constructor(e, t, r) {
            super(t), (0, m._)(this, "status", void 0), (0, m._)(this, "body", void 0), this.name = "CustomDashboardsApiRequestError", this.status = e, this.body = r
        }
    }

    function N(e) {
        let t = {};
        return void 0 !== e.name && (t.name = e.name), void 0 !== e.description && (t.description = e.description), void 0 !== e.isPinned && (t.isPinned = e.isPinned), t
    }

    function U(e) {
        return "object" == typeof e && null !== e && !Array.isArray(e)
    }

    function M(e, t) {
        var r, n, a, i;
        let o = null != (r = null == e ? void 0 : e.status) ? r : 0,
            s = function(e) {
                if (!U(e)) return;
                let {
                    code: t,
                    message: r,
                    error: n,
                    details: a
                } = e, i = function(e) {
                    if (!U(e)) return;
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
                }(n);
                return {
                    ..."string" == typeof t || "number" == typeof t ? {
                        code: t
                    } : {},
                    ..."string" == typeof r ? {
                        message: r
                    } : {},
                    ...i ? {
                        error: i
                    } : {},
                    ...Array.isArray(a) ? {
                        details: a
                    } : {}
                }
            }(t),
            c = null != (n = null != (a = null == s ? void 0 : s.message) ? a : null == s || null == (i = s.error) ? void 0 : i.message) ? n : "HTTP ".concat(o);
        throw new O(o, c, s)
    }

    function P() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : V;
        return {
            async listDashboards(t, r) {
                let {
                    data: n,
                    error: a,
                    response: i
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
                return (a || !n) && M(i, a), n
            },
            async listPinnedDashboards(t) {
                let {
                    data: r,
                    error: n,
                    response: a
                } = await e.GET("/v1/universes/{universeId}/custom-dashboards/pinned", {
                    params: {
                        path: {
                            universeId: t
                        }
                    }
                });
                return (n || !r) && M(a, n), r
            },
            async getDashboardCapabilities(t) {
                var r;
                let {
                    data: n,
                    error: a,
                    response: i
                } = await e.GET("/v1/universes/{universeId}/custom-dashboards/capabilities", {
                    params: {
                        path: {
                            universeId: t
                        }
                    }
                });
                return (a || !n) && M(i, a), null != (r = n.capabilities) ? r : {}
            },
            async getDashboard(t) {
                var r;
                let {
                    universeId: n,
                    dashboardId: a
                } = t, {
                    data: i,
                    error: o,
                    response: s
                } = await e.GET("/v1/universes/{universeId}/custom-dashboards/{dashboardId}", {
                    params: {
                        path: {
                            universeId: n,
                            dashboardId: a
                        }
                    }
                });
                return (o || !i) && M(s, o), null != (r = i.dashboard) ? r : {}
            },
            async createDashboard(t) {
                var r;
                let {
                    universeId: n,
                    name: a,
                    description: i,
                    document: o
                } = t, {
                    data: s,
                    error: c,
                    response: u
                } = await e.POST("/v1/universes/{universeId}/custom-dashboards", {
                    params: {
                        path: {
                            universeId: n
                        }
                    },
                    body: {
                        universeId: n,
                        name: a,
                        description: i,
                        document: o
                    }
                });
                return (c || !s) && M(u, c), null != (r = s.dashboard) ? r : {}
            },
            async updateDashboardMetadata(t) {
                var r;
                let {
                    universeId: n,
                    dashboardId: a,
                    expectedHeadEtag: i,
                    patch: o
                } = t, {
                    data: s,
                    error: c,
                    response: u
                } = await e.PATCH("/v1/universes/{universeId}/custom-dashboards/{dashboardId}/metadata", {
                    params: {
                        path: {
                            universeId: n,
                            dashboardId: a
                        }
                    },
                    body: {
                        universeId: n,
                        dashboardId: a,
                        expectedHeadEtag: i,
                        patch: N(o)
                    }
                });
                return (c || !s) && M(u, c), null != (r = s.metadata) ? r : {}
            },
            async publishDashboard(t) {
                var r;
                let {
                    universeId: n,
                    dashboardId: a,
                    expectedHeadEtag: i,
                    document: o,
                    metadataPatch: s
                } = t, c = void 0 === s ? void 0 : N(s), u = {
                    universeId: n,
                    dashboardId: a,
                    expectedHeadEtag: i,
                    document: o,
                    ...void 0 !== c && Object.keys(c).length > 0 ? {
                        metadataPatch: c
                    } : {}
                }, {
                    data: l,
                    error: d,
                    response: h
                } = await e.POST("/v1/universes/{universeId}/custom-dashboards/{dashboardId}/publish", {
                    params: {
                        path: {
                            universeId: n,
                            dashboardId: a
                        }
                    },
                    body: u
                });
                return (d || !l) && M(h, d), null != (r = l.dashboard) ? r : {}
            },
            async duplicateDashboard(t) {
                var r;
                let {
                    universeId: n,
                    dashboardId: a,
                    destinationUniverseId: i,
                    name: o
                } = t, {
                    data: s,
                    error: c,
                    response: u
                } = await e.POST("/v1/universes/{universeId}/custom-dashboards/{dashboardId}/duplicate", {
                    params: {
                        path: {
                            universeId: n,
                            dashboardId: a
                        }
                    },
                    body: {
                        destinationUniverseId: i,
                        name: o
                    }
                });
                return (c || !s) && M(u, c), null != (r = s.dashboard) ? r : {}
            },
            async deleteDashboard(t) {
                let {
                    universeId: r,
                    dashboardId: n
                } = t, {
                    error: a,
                    response: i
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
                a && M(i, a)
            },
            async filterDashboardText(t) {
                let {
                    universeId: r,
                    text: n,
                    format: a
                } = t, {
                    data: i,
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
                        format: "description" === a ? 2 : 1
                    }
                });
                if ((o || !i) && M(s, o), "boolean" != typeof i.isFiltered) {
                    var c;
                    throw new O(null != (c = null == s ? void 0 : s.status) ? c : 0, "Response is missing isFiltered")
                }
                return {
                    isFiltered: i.isFiltered
                }
            }
        }
    }
    e.s(["CustomDashboardsApiRequestError", 0, O, "createDefaultCustomDashboardsApiClient", 0, P], 852209);
    var k = e.i(646877);

    function x(e) {
        if ("string" == typeof e) return e;
        if (!("object" == typeof e && null !== e && !Array.isArray(e))) return;
        let {
            seconds: t
        } = e;
        if ("number" == typeof t || "string" == typeof t) {
            let r = "number" == typeof t ? t : Number(t),
                n = e.nanos,
                a = "number" == typeof n ? n : "string" == typeof n ? Number(n) : 0;
            if (Number.isFinite(r) && Number.isFinite(a)) return new Date(1e3 * r + Math.floor(a / 1e6)).toISOString()
        }
    }

    function B(e) {
        let t = "number" == typeof e ? e : "string" == typeof e && e.trim().length > 0 ? Number(e) : NaN;
        return Number.isSafeInteger(t) && t > 0 ? t : void 0
    }

    function L(e) {
        var t;
        return null != (t = e.dashboardId) ? t : ""
    }

    function Q(e) {
        return (0, p.customDashboardConfigToBackendDocument)(e)
    }

    function H(e) {
        var t, r, n, a, i, o, s;
        let c, u, l = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : y.EMPTY_DASHBOARD_CONFIG,
            d = L(e),
            h = null != (t = B(e.universeId)) ? t : 0,
            m = null != (r = x(e.createdTime)) ? r : new Date(0).toISOString(),
            p = null != (n = x(e.updatedTime)) ? n : m,
            f = x(e.publishedTime),
            g = !0 === e.isPinned,
            v = e.createdBy,
            b = e.updatedBy,
            A = B(null == v ? void 0 : v.userId),
            D = B(null == b ? void 0 : b.userId);
        return (0, k.validateCustomDashboardDocument)({
            id: d,
            schemaVersion: y.LOCAL_STORAGE_DOCUMENT_SCHEMA_VERSION,
            universeId: h,
            name: (0, k.validateDashboardName)(null != (a = e.name) ? a : "", null),
            description: (0, k.validateDashboardDescription)(null != (i = e.description) ? i : void 0, null),
            status: (c = (o = e).latestPublishedDocumentId, u = null != (s = o.latestPublishedVersion) ? s : 0, c || u > 0 ? "published" : "draft"),
            isPinned: g,
            pinnedAt: g ? x(e.pinnedTime) : void 0,
            createdAt: m,
            updatedAt: p,
            publishedAt: f,
            createdByUserId: null != A ? A : 0,
            createdByUsername: "",
            ...void 0 !== D ? {
                updatedByUserId: D
            } : {},
            config: l
        })
    }

    function G(e) {
        var t;
        if (!e.metadata) throw Error("Custom dashboard API response is missing metadata.");
        return H(e.metadata, (t = e.document) ? (0, p.backendDocumentToCustomDashboardConfig)(t) : y.EMPTY_DASHBOARD_CONFIG)
    }

    function K(e, t) {
        return "".concat(e, ":").concat(t)
    }
    let F = class {
        async list(e, t) {
            return this.withApiErrors(e, void 0, async () => {
                var r, n;
                this.ensureAvailable();
                let a = t ? await this.client.listDashboards(e, t) : await this.listAllDashboards(e);
                return {
                    items: D((null != (r = a.dashboards) ? r : []).map(t => (this.rememberMetadata(e, t), H(t)))),
                    migrationFailedCount: 0,
                    nextPageToken: t && null != (n = a.nextPageToken) ? n : void 0,
                    capabilities: void 0 === a.capabilities ? void 0 : (0, s.parseDashboardCapabilities)(a.capabilities)
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
                return (0, s.parseDashboardCapabilities)(t)
            })
        }
        async get(e, t) {
            return this.withApiErrors(e, t, async () => {
                this.ensureAvailable();
                let r = await this.client.getDashboard({
                        universeId: e,
                        dashboardId: t
                    }),
                    n = this.rememberMetadata(e, r.metadata),
                    a = G(r);
                if (this.shouldRepairStoredDocument(e, a, r)) {
                    var i;
                    return null != (i = await this.repairStoredDocument(e, a, n)) ? i : a
                }
                return a
            })
        }
        async read(e, t) {
            let r = await this.client.getDashboard({
                universeId: e,
                dashboardId: t
            });
            return this.rememberMetadata(e, r.metadata), G(r)
        }
        shouldRepairStoredDocument(e, t, r) {
            return this.repairLegacyDocumentsOnRead && !this.legacyDocumentRepairUnavailable && !this.legacyDocumentRepairAttempted.has(K(e, t.id)) && "published" === t.status && (0, p.backendDocumentHasUpperSnakeAggregationVariants)(r.document)
        }
        async repairStoredDocument(e, t, r) {
            this.legacyDocumentRepairAttempted.add(K(e, t.id));
            let {
                headEtag: n
            } = r, a = Q(t.config);
            if (!(!n || (0, p.backendDocumentHasUpperSnakeAggregationVariants)(a))) try {
                let r = await this.client.publishDashboard({
                    universeId: e,
                    dashboardId: t.id,
                    expectedHeadEtag: n,
                    document: a
                });
                return this.rememberMetadata(e, r.metadata), (0, p.backendDocumentHasUpperSnakeAggregationVariants)(r.document) && (this.legacyDocumentRepairUnavailable = !0), this.emit({
                    universeId: e,
                    dashboardId: t.id,
                    eventType: "update"
                }), G(r)
            } catch (e) {
                console.warn("ApiCustomDashboardService: could not repair stored dashboard document", {
                    dashboardId: t.id,
                    error: e
                });
                return
            }
        }
        async getVersion(e, t) {
            return this.withApiErrors(e, t, async () => {
                var r, n;
                this.ensureAvailable();
                let a = this.tokens.get(K(e, t));
                return a ? a.revision : (await this.read(e, t), null != (r = null == (n = this.tokens.get(K(e, t))) ? void 0 : n.revision) ? r : null)
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
                        document: Q(r)
                    });
                this.rememberMetadata(e.universeId, n.metadata);
                let a = G(n);
                return this.emit({
                    universeId: e.universeId,
                    dashboardId: a.id,
                    eventType: "create"
                }), a
            })
        }
        async update(e, t, r, n) {
            return this.withApiErrors(e, t, async () => {
                let a;
                this.ensureAvailable();
                let i = {};
                void 0 !== r.name && (i.name = r.name), void 0 !== r.description && (i.description = r.description);
                let {
                    config: o
                } = r, s = void 0 !== i.name || void 0 !== i.description, c = void 0 !== o;
                if (!s && !c) return this.read(e, t);
                let u = await this.ensureTokens(e, t),
                    l = null == n ? void 0 : n.expectedVersion;
                if (void 0 !== o) {
                    let r = await this.client.publishDashboard({
                        universeId: e,
                        dashboardId: t,
                        expectedHeadEtag: this.requireHeadEtag(u, t, l),
                        document: Q(o),
                        ...s ? {
                            metadataPatch: i
                        } : {}
                    });
                    this.rememberMetadata(e, r.metadata), a = G(r)
                } else if (s) {
                    let r = await this.client.updateDashboardMetadata({
                        universeId: e,
                        dashboardId: t,
                        expectedHeadEtag: this.requireHeadEtag(u, t, l),
                        patch: i
                    });
                    this.rememberMetadata(e, r)
                }
                return this.emit({
                    universeId: e,
                    dashboardId: t,
                    eventType: "update"
                }), null != a ? a : this.read(e, t)
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
                let a = await this.read(e, t),
                    {
                        config: i,
                        tile: o
                    } = (0, g.addChartTileToConfig)({
                        config: a.config,
                        tile: r.tile,
                        nextTileId: (0, b.createTileId)(),
                        limits: r.limits
                    }),
                    s = await this.ensureTokens(e, t),
                    c = await this.client.publishDashboard({
                        universeId: e,
                        dashboardId: t,
                        expectedHeadEtag: this.requireHeadEtag(s, t, null == n ? void 0 : n.expectedVersion),
                        document: Q(i)
                    });
                this.rememberMetadata(e, c.metadata);
                let u = G(c);
                return this.emit({
                    universeId: e,
                    dashboardId: t,
                    eventType: "add-chart-tile"
                }), {
                    document: u,
                    tile: o
                }
            })
        }
        async delete(e, t) {
            return this.withApiErrors(e, t, async () => {
                this.ensureAvailable(), await this.client.deleteDashboard({
                    universeId: e,
                    dashboardId: t
                }), this.tokens.delete(K(e, t)), this.emit({
                    universeId: e,
                    dashboardId: t,
                    eventType: "delete"
                })
            })
        }
        async duplicate(e, t, r) {
            return this.withApiErrors(e, t, async () => {
                var r;
                let n, a;
                this.ensureAvailable();
                let [i, o] = await Promise.all([this.read(e, t), this.list(e)]), s = this.dedupeName(i.name, o.items.map(e => e.name)), c = await this.client.duplicateDashboard({
                    universeId: e,
                    dashboardId: t,
                    destinationUniverseId: e,
                    name: s
                });
                this.rememberMetadata(e, c.metadata);
                let u = G(c),
                    l = (r = u.config, n = (0, f.getSummaryCards)(r).map(e => A(e)), a = (0, f.getChartRows)(r).map(e => ({
                        ...e,
                        tiles: e.tiles.map(e => A(e))
                    })), (0, f.withChartRows)((0, f.withSummaryCards)(r, n), a));
                if ("published" !== u.status) {
                    let t = {
                        ...u,
                        config: l
                    };
                    return this.emit({
                        universeId: e,
                        dashboardId: t.id,
                        eventType: "duplicate"
                    }), t
                }
                let d = await this.ensureTokens(e, u.id),
                    h = await this.client.publishDashboard({
                        universeId: e,
                        dashboardId: u.id,
                        expectedHeadEtag: this.requireHeadEtag(d, u.id),
                        document: Q(l)
                    });
                this.rememberMetadata(e, h.metadata);
                let m = G(h);
                return this.emit({
                    universeId: e,
                    dashboardId: m.id,
                    eventType: "duplicate"
                }), m
            })
        }
        async publish(e, t, r) {
            return this.withApiErrors(e, t, async () => {
                this.ensureAvailable();
                let n = await this.read(e, t),
                    a = await this.ensureTokens(e, t),
                    i = await this.client.publishDashboard({
                        universeId: e,
                        dashboardId: t,
                        expectedHeadEtag: this.requireHeadEtag(a, t, null == r ? void 0 : r.expectedVersion),
                        document: Q(n.config)
                    });
                this.rememberMetadata(e, i.metadata);
                let o = G(i);
                return this.emit({
                    universeId: e,
                    dashboardId: t,
                    eventType: "publish"
                }), o
            })
        }
        async unpublish(e, t) {
            return this.withApiErrors(e, t, async () => {
                throw this.ensureAvailable(), new u.CustomDashboardNotAvailableError
            })
        }
        async pin(e, t) {
            return this.updatePinned(e, t, !0)
        }
        async unpin(e, t) {
            return this.updatePinned(e, t, !1)
        }
        async suggestDefaultName(e) {
            return I((await this.list(e)).items.map(e => e.name))
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
            for (let a = 0; a < 3; a += 1) try {
                return await this.withApiErrors(e, t, async () => {
                    this.ensureAvailable();
                    let n = await this.ensureTokens(e, t),
                        a = await this.client.updateDashboardMetadata({
                            universeId: e,
                            dashboardId: t,
                            expectedHeadEtag: this.requireHeadEtag(n, t),
                            patch: {
                                isPinned: r
                            }
                        });
                    return this.rememberMetadata(e, a), this.emit({
                        universeId: e,
                        dashboardId: t,
                        eventType: r ? "pin" : "unpin"
                    }), this.read(e, t)
                })
            } catch (e) {
                if (n = e, !(e instanceof u.CustomDashboardVersionConflictError) || 2 === a) throw e
            }
            throw n
        }
        async ensureTokens(e, t) {
            let r = this.tokens.get(K(e, t));
            if (r) return r;
            await this.read(e, t);
            let n = this.tokens.get(K(e, t));
            if (!n) throw new u.CustomDashboardVersionConflictError(t);
            return n
        }
        rememberMetadata(e, t) {
            var r, n;
            let a = t ? L(t) : "",
                i = K(e, a),
                o = this.tokens.get(i),
                s = t && null != (n = t.headEtag) ? n : void 0,
                c = o && o.headEtag === s ? o.revision : (null != (r = null == o ? void 0 : o.revision) ? r : 0) + 1,
                u = new Map(null == o ? void 0 : o.headEtagsByRevision);
            s && u.set(c, s);
            let l = {
                headEtag: s,
                revision: c,
                headEtagsByRevision: u
            };
            return a && this.tokens.set(i, l), l
        }
        requireHeadEtag(e, t, r) {
            let n = void 0 === r ? e.headEtag : e.headEtagsByRevision.get(r);
            if (!n) throw new u.CustomDashboardVersionConflictError(t);
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
            return r.has(n) ? S(t, t => "".concat(e, " (copy ").concat(t, ")"), 2) : n
        }
        async listAllDashboards(e, t) {
            var r, n;
            let a = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : [],
                i = arguments.length > 3 ? arguments[3] : void 0,
                o = await this.client.listDashboards(e, t ? {
                    pageToken: t
                } : void 0),
                s = [...a, ...null != (r = o.dashboards) ? r : []],
                c = null != (n = o.nextPageToken) ? n : void 0,
                u = null != i ? i : o.capabilities;
            return c ? this.listAllDashboards(e, c, s, u) : {
                dashboards: s,
                ...void 0 === u ? {} : {
                    capabilities: u
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
            if (this.disposed) throw new u.CustomDashboardNotAvailableError
        }
        async withApiErrors(e, t, r) {
            try {
                return await r()
            } catch (n) {
                let r = function(e, t) {
                    var r, n, a, i, o, s, c, l, d;
                    if (e instanceof u.CustomDashboardServiceError) return e;
                    if (!(e instanceof O)) return new u.CustomDashboardStorageWriteError(e);
                    let h = null != (i = null != (o = null == (s = e.body) ? void 0 : s.message) ? o : null == (l = e.body) || null == (c = l.error) ? void 0 : c.message) ? i : e.message,
                        m = (null != (d = "".concat(null != h ? h : "", " ").concat(null != (r = null == (a = e.body) || null == (n = a.error) ? void 0 : n.status) ? r : "")) ? d : "").toUpperCase().replaceAll("-", "_");
                    return 404 === e.status || m.includes("NOT_FOUND") ? new u.CustomDashboardNotFoundError(null != t ? t : "unknown") : 409 === e.status || m.includes("VERSION_CONFLICT") || m.includes("CONFLICT") ? new u.CustomDashboardVersionConflictError(null != t ? t : "unknown") : 429 === e.status || m.includes("QUOTA_EXCEEDED") || m.includes("RESOURCE_EXHAUSTED") ? new u.CustomDashboardQuotaExceededError(h) : 401 === e.status || m.includes("UNAUTHENTICATED") ? new u.CustomDashboardUnauthenticatedError(h) : 403 === e.status || m.includes("PERMISSION_DENIED") ? new u.CustomDashboardPermissionDeniedError(h) : 400 === e.status || m.includes("VALIDATION_FAILED") || m.includes("INVALID_ARGUMENT") ? new u.CustomDashboardValidationError("document", null != h ? h : "Invalid custom dashboard.") : 503 === e.status || m.includes("UNAVAILABLE") ? new u.CustomDashboardNotAvailableError : new u.CustomDashboardStorageWriteError(e)
                }(n, t);
                throw r instanceof u.CustomDashboardVersionConflictError && void 0 !== e && t && await this.refreshTokens(e, t), r
            }
        }
        constructor(e = P(), t = {}) {
            (0, m._)(this, "pagesOnServer", !0), (0, m._)(this, "client", void 0), (0, m._)(this, "listeners", new Set), (0, m._)(this, "tokens", new Map), (0, m._)(this, "disposed", !1), (0, m._)(this, "repairLegacyDocumentsOnRead", void 0), (0, m._)(this, "legacyDocumentRepairUnavailable", !1), (0, m._)(this, "legacyDocumentRepairAttempted", new Set), this.client = e, this.repairLegacyDocumentsOnRead = !0 === t.repairLegacyDocumentsOnRead
        }
    };

    function j(e) {
        return e instanceof u.CustomDashboardNotFoundError
    }

    function z(e) {
        return {
            ...e,
            hybridOrigin: "localCopy"
        }
    }

    function q(e) {
        return {
            ...e,
            hybridOrigin: "localCopy"
        }
    }

    function Y(e) {
        return {
            ...e,
            hybridOrigin: "server"
        }
    }
    let W = class {
            async list(e, t) {
                var r;
                let [n, a] = await Promise.all([this.apiService.list(e, t), this.localService.list(e)]);
                return {
                    items: n.items.map(Y),
                    capabilities: null != (r = n.capabilities) ? r : s.DENIED_DASHBOARD_CAPABILITIES,
                    localItems: a.items.map(q),
                    nextPageToken: n.nextPageToken,
                    migrationFailedCount: n.migrationFailedCount + a.migrationFailedCount
                }
            }
            listPinned(e) {
                return this.apiService.listPinned(e)
            }
            async getCapabilities(e) {
                var t, r, n;
                return null != (t = null == (r = (n = this.apiService).getCapabilities) ? void 0 : r.call(n, e)) ? t : s.DENIED_DASHBOARD_CAPABILITIES
            }
            async get(e, t) {
                try {
                    return z(await this.localService.get(e, t))
                } catch (e) {
                    if (!j(e)) throw e
                }
                return {
                    ...await this.apiService.get(e, t),
                    hybridOrigin: "server"
                }
            }
            async create(e) {
                return z(await this.localService.create(e))
            }
            async createAndPublish(e) {
                return z(await this.localService.createAndPublish(e))
            }
            async update(e, t, r, n) {
                return await this.ensureLocalDashboard(e, t), z(await this.localService.update(e, t, r, n))
            }
            async addChartTile(e, t, r, n) {
                await this.ensureLocalDashboard(e, t);
                let a = await this.localService.addChartTile(e, t, r, n);
                return {
                    ...a,
                    document: z(a.document)
                }
            }
            async delete(e, t) {
                await this.ensureLocalDashboard(e, t), await this.localService.delete(e, t)
            }
            async duplicate(e, t, r) {
                try {
                    return await this.ensureLocalDashboard(e, t), z(await this.localService.duplicate(e, t, r))
                } catch (e) {
                    if (!j(e) && !(e instanceof u.CustomDashboardNotAvailableError)) throw e
                }
                return this.forkApiDashboardToLocal(e, t, r)
            }
            async forkApiDashboardToLocal(e, t, r) {
                var n, a, i;
                let o, s, c, u, l = await this.apiService.get(e, t),
                    d = await this.localService.list(e);
                return z(await this.localService.create({
                    universeId: e,
                    name: (n = d.items.map(e => e.name), a = l.name, o = w("".concat(a).concat(" (local copy)")), (s = new Set(Array.from(n, e => e.trim()))).has(o) ? S(s, e => w("".concat(a, " (local copy ").concat(e, ")")), 2) : o),
                    description: l.description,
                    createdByUserId: r.createdByUserId,
                    createdByUsername: r.createdByUsername,
                    config: (i = l.config, c = (0, f.getSummaryCards)(i).map(e => A(e)), u = (0, f.getChartRows)(i).map(e => ({
                        ...e,
                        tiles: e.tiles.map(e => A(e))
                    })), (0, f.withChartRows)((0, f.withSummaryCards)(i, c), u))
                }))
            }
            async publish(e, t, r) {
                return await this.ensureLocalDashboard(e, t), z(await this.localService.publish(e, t, r))
            }
            async unpublish(e, t) {
                return await this.ensureLocalDashboard(e, t), z(await this.localService.unpublish(e, t))
            }
            async pin(e, t) {
                return await this.ensureLocalDashboard(e, t), z(await this.localService.pin(e, t))
            }
            async unpin(e, t) {
                return await this.ensureLocalDashboard(e, t), z(await this.localService.unpin(e, t))
            }
            async suggestDefaultName(e) {
                return this.localService.suggestDefaultName(e)
            }
            async getVersion(e, t) {
                try {
                    await this.ensureLocalDashboard(e, t)
                } catch (e) {
                    if (e instanceof u.CustomDashboardNotAvailableError) return null;
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
                    return z(await this.localService.get(e, t))
                } catch (e) {
                    if (j(e)) throw new u.CustomDashboardNotAvailableError;
                    throw e
                }
            }
            constructor(e) {
                (0, m._)(this, "pagesOnServer", !0), (0, m._)(this, "localService", void 0), (0, m._)(this, "apiService", void 0), this.localService = e.localService, this.apiService = e.apiService
            }
        },
        X = {
            isoNow: () => new Date().toISOString()
        };
    var $ = e.i(730530),
        J = e.i(881670);
    let Z = {
        first: "(copy)",
        numbered: e => "(copy ".concat(e, ")")
    };

    function ee(e, t) {
        let r = null == t ? void 0 : t.pageSize;
        if (void 0 === r || r <= 0) return {
            items: e
        };
        let n = function(e) {
                if (!e) return 0;
                let t = Number(e);
                return Number.isFinite(t) && t >= 0 ? Math.floor(t) : 0
            }(null == t ? void 0 : t.pageToken),
            a = n + r;
        return {
            items: e.slice(n, a),
            nextPageToken: a < e.length ? String(a) : void 0
        }
    }
    e.s(["createDuplicateDashboardNameSuffixes", 0, function(e) {
        return {
            first: e.tPendingTranslation("(copy)", "Suffix appended to a duplicated dashboard name when the first copy is free; a leading space is added when concatenating with the base name", (0, $.translationKey)("Label.CustomDashboards.DuplicateName.FirstSuffix", J.TranslationNamespace.Analytics)),
            numbered: t => e.tPendingTranslation("(copy {n})", "Suffix appended when a duplicate dashboard name collides; {n} is the disambiguation number (2, 3, …); a leading space is added when concatenating with the base name", (0, $.translationKey)("Label.CustomDashboards.DuplicateName.NumberedSuffix", J.TranslationNamespace.Analytics), {
                n: String(t)
            })
        }
    }, "testOnlyEnglishDuplicateDashboardNameSuffixes", 0, Z], 322172);
    let et = class {
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
                    a = this.getLimits(e).maxDashboardsPerUniverse;
                if (n >= a) throw new u.CustomDashboardQuotaExceededError("Universe ".concat(e, " is at the per-universe cap of ").concat(a, " dashboards. Delete one to create another."))
            }
            assertUnderPinnedCap(e, t) {
                let r = this.peekUniverseMap(e);
                if (!r) return;
                let n = Array.from(r.values()).filter(e => e.document.isPinned && e.document.id !== t).length,
                    a = this.getLimits(e).maxPinnedDashboardsPerUniverse;
                if (n >= a) throw new u.CustomDashboardQuotaExceededError("Universe ".concat(e, " is at the pinned-dashboard cap of ").concat(a, ". Unpin one to pin another."))
            }
            loadOrThrow(e, t) {
                let r = this.peekUniverseMap(e),
                    n = null == r ? void 0 : r.get(t);
                if (!r || !n) throw new u.CustomDashboardNotFoundError(t);
                return {
                    universeMap: r,
                    record: n
                }
            }
            async applyMutation(e, t, r, n, a) {
                let {
                    universeMap: i,
                    record: o
                } = this.loadOrThrow(e, t);
                if ((null == a ? void 0 : a.expectedVersion) !== void 0 && a.expectedVersion !== o.version) throw new u.CustomDashboardVersionConflictError(t);
                let s = this.clock.isoNow(),
                    c = {
                        ...o.document,
                        ...n(s),
                        updatedAt: s
                    };
                return i.set(t, {
                    document: c,
                    version: o.version + 1
                }), this.emit({
                    universeId: e,
                    dashboardId: t,
                    eventType: r
                }), c
            }
            async applyUpdateMutation(e, t, r, n, a) {
                let {
                    universeMap: i,
                    record: o
                } = this.loadOrThrow(e, t);
                if ((null == a ? void 0 : a.expectedVersion) !== void 0 && a.expectedVersion !== o.version) throw new u.CustomDashboardVersionConflictError(t);
                let {
                    document: s,
                    result: c
                } = n(o, this.clock.isoNow());
                return i.set(t, {
                    document: s,
                    version: o.version + 1
                }), this.emit({
                    universeId: e,
                    dashboardId: t,
                    eventType: r
                }), c
            }
            async list(e, t) {
                let r = this.peekUniverseMap(e);
                return {
                    ...ee(r ? D([...r.values()].map(e => e.document)) : [], t),
                    migrationFailedCount: 0
                }
            }
            async listPinned(e) {
                let t = this.peekUniverseMap(e);
                return t ? D([...t.values()].map(e => e.document)).filter(e => e.isPinned).map(e => {
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
                var r, n, a;
                return null != (r = null == (a = this.peekUniverseMap(e)) || null == (n = a.get(t)) ? void 0 : n.version) ? r : null
            }
            insertNewDocument(e, t) {
                this.assertUnderUniverseCap(e.universeId);
                let r = this.getLimits(e.universeId),
                    n = (0, k.validateDashboardName)(e.name, r),
                    a = (0, k.validateDashboardDescription)(e.description, r),
                    i = void 0 !== e.config ? (0, k.validateCustomDashboardConfig)(e.config, {
                        limits: r
                    }) : y.EMPTY_DASHBOARD_CONFIG,
                    o = this.clock.isoNow(),
                    s = {
                        id: this.idFactory.nextDashboardId(),
                        schemaVersion: y.LOCAL_STORAGE_DOCUMENT_SCHEMA_VERSION,
                        universeId: e.universeId,
                        name: n,
                        description: a,
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
                        config: i
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
                    universeMap: a,
                    record: i
                } = this.loadOrThrow(e, t), o = this.getLimits(e);
                if ((null == n ? void 0 : n.expectedVersion) !== void 0 && n.expectedVersion !== i.version) throw new u.CustomDashboardVersionConflictError(t);
                let s = void 0 !== r.name ? (0, k.validateDashboardName)(r.name, o) : i.document.name,
                    c = void 0 !== r.description ? (0, k.validateDashboardDescription)(r.description, o) : i.document.description,
                    l = void 0 !== r.config ? (0, k.validateCustomDashboardConfig)(r.config, {
                        limits: o
                    }) : i.document.config,
                    d = {
                        ...i.document,
                        name: s,
                        description: c,
                        config: l,
                        updatedAt: this.clock.isoNow(),
                        ...(null == n ? void 0 : n.actor) ? {
                            updatedByUserId: n.actor.userId,
                            updatedByUsername: n.actor.username
                        } : {}
                    };
                return a.set(t, {
                    document: d,
                    version: i.version + 1
                }), this.emit({
                    universeId: e,
                    dashboardId: t,
                    eventType: "update"
                }), d
            }
            async addChartTile(e, t, r, n) {
                return this.applyUpdateMutation(e, t, "add-chart-tile", (e, t) => {
                    let {
                        config: a,
                        tile: i
                    } = (0, g.addChartTileToConfig)({
                        config: e.document.config,
                        tile: r.tile,
                        nextTileId: this.idFactory.nextTileId(),
                        limits: r.limits
                    }), o = {
                        ...e.document,
                        config: a,
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
                            tile: i
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
                let a = this.clock.isoNow(),
                    i = this.dedupeName(e, n.name),
                    o = () => this.idFactory.nextTileId(),
                    s = (0, f.getSummaryCards)(n.config).map(e => A(e, o)),
                    c = (0, f.getChartRows)(n.config).map(e => ({
                        ...e,
                        tiles: e.tiles.map(e => A(e, o))
                    })),
                    u = {
                        ...n,
                        id: this.idFactory.nextDashboardId(),
                        name: i,
                        status: "draft",
                        isPinned: !1,
                        pinnedAt: void 0,
                        publishedAt: void 0,
                        createdAt: a,
                        updatedAt: a,
                        createdByUserId: r.createdByUserId,
                        createdByUsername: r.createdByUsername,
                        updatedByUserId: r.createdByUserId,
                        updatedByUsername: r.createdByUsername,
                        config: (0, f.withChartRows)((0, f.withSummaryCards)(n.config, s), c)
                    };
                return this.getOrCreateUniverseMap(e).set(u.id, {
                    document: u,
                    version: 1
                }), this.emit({
                    universeId: e,
                    dashboardId: u.id,
                    eventType: "duplicate"
                }), u
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
                return I(t ? [...t.values()].map(e => e.document.name) : [])
            }
            subscribe(e) {
                return this.listeners.add(e), () => {
                    this.listeners.delete(e)
                }
            }
            dedupeName(e, t) {
                let r = this.peekUniverseMap(e);
                return E(r ? [...r.values()].map(e => e.document.name) : [], t, this.duplicateNameSuffixes)
            }
            constructor(e = {}) {
                var t, r, n, a, i;
                (0, m._)(this, "pagesOnServer", void 0), (0, m._)(this, "store", new Map), (0, m._)(this, "listeners", new Set), (0, m._)(this, "clock", void 0), (0, m._)(this, "idFactory", void 0), (0, m._)(this, "duplicateNameSuffixes", void 0), (0, m._)(this, "getLimits", void 0), this.getLimits = null != (t = e.getLimits) ? t : () => c.CONSERVATIVE_DASHBOARD_LIMITS, this.clock = null != (r = e.clock) ? r : X, this.idFactory = null != (n = e.idFactory) ? n : b.defaultIdFactory, this.duplicateNameSuffixes = null != (a = e.duplicateNameSuffixes) ? a : Z, this.pagesOnServer = null != (i = e.pagesOnServer) && i
            }
        },
        er = [{
            fromVersion: 0,
            toVersion: 1,
            description: "v0 → v1 identity: alpha records had no schemaVersion field but were v1-shaped.",
            migrate: e => e
        }];
    var en = e.i(115232);
    let ea = "creator-hub:custom-dashboards:v1:universe:",
        ei = /^\d+$/;

    function eo(e) {
        return "".concat(ea).concat(e)
    }

    function es(e, t, r) {
        let n = "".concat("creator-hub:custom-dashboards:v1:unreadable:universe:").concat(t);
        try {
            e.setItem(n, r)
        } catch (e) {}
        return {
            ok: !1,
            unreadableSidecarKey: n
        }
    }

    function ec(e, t, r, n) {
        let a = {};
        Object.entries(r).forEach(e => {
            let [t, r] = e;
            a[t] = {
                document: r.document,
                version: r.version
            }
        }), Object.entries(n).forEach(e => {
            let [t, r] = e;
            t in a || (a[t] = r)
        });
        try {
            e.setItem(eo(t), JSON.stringify({
                records: a
            }))
        } catch (e) {
            if (function(e) {
                    if (!(0, en.isRecord)(e)) return !1;
                    let t = e.code,
                        r = e.name;
                    return 22 === t || "QuotaExceededError" === r || "NS_ERROR_DOM_QUOTA_REACHED" === r
                }(e)) throw new u.CustomDashboardQuotaExceededError;
            if (e instanceof u.CustomDashboardStorageWriteError) throw e;
            throw new u.CustomDashboardStorageWriteError(e)
        }
    }

    function eu(e, t, r) {
        if (Object.keys(t).length >= r) throw new u.CustomDashboardQuotaExceededError("Universe ".concat(e, " is at the per-universe cap of ").concat(r, " dashboards. Delete one to create another."))
    }
    let el = class {
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
                if (this.disposed) throw new u.CustomDashboardNotAvailableError;
                let e = function() {
                    try {
                        var e;
                        return null != (e = window.localStorage) ? e : null
                    } catch (e) {
                        return null
                    }
                }();
                if (!e) throw new u.CustomDashboardNotAvailableError;
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
                eu(e, t, this.getLimits(e).maxDashboardsPerUniverse)
            }
            readMaterialised(e) {
                var t, r, n;
                let a, i, o, s, c = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "throwOnUnreadable",
                    l = this.requireStorage(),
                    d = l.getItem(eo(e)),
                    h = this.materialisedByUniverse.get(e);
                if (h && h.rawString === d) return {
                    storage: l,
                    records: h.records,
                    quarantine: h.quarantine
                };
                let m = function(e, t, r) {
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
                        return es(e, t, r)
                    }
                    return (0, en.isRecord)(n) && (0, en.isRecord)(n.records) ? {
                        ok: !0,
                        bucket: {
                            records: n.records
                        }
                    } : es(e, t, r)
                }(l, e, d);
                if (!m.ok) {
                    if (this.storageUnreadableByUniverse.set(e, m.unreadableSidecarKey), "throwOnUnreadable" === c) throw new u.CustomDashboardStorageUnreadableError(m.unreadableSidecarKey);
                    return {
                        storage: l,
                        records: {},
                        quarantine: {}
                    }
                }
                this.storageUnreadableByUniverse.delete(e);
                let {
                    records: p,
                    quarantine: f,
                    corrupted: g,
                    mutatedOnRead: v
                } = (t = m.bucket, a = {}, i = {}, o = [], s = !1, Object.entries(null != (r = t.records) ? r : {}).forEach(t => {
                    var r;
                    let [n, c] = t;
                    if (!c || "object" != typeof c) {
                        i[n] = {
                            version: 1,
                            migrationFailed: !0,
                            reason: "record was not an object",
                            raw: c
                        }, o.push({
                            id: n,
                            reason: "record was not an object",
                            code: "OTHER"
                        });
                        return
                    }
                    if ((0, en.isRecord)(c) && !0 === c.migrationFailed) {
                        i[n] = c, o.push({
                            id: n,
                            reason: c.reason,
                            code: "OTHER"
                        });
                        return
                    }
                    if (!(0, en.isRecord)(c) || "number" != typeof c.version || !("document" in c)) {
                        i[n] = {
                            version: 1,
                            migrationFailed: !0,
                            reason: "record was not a live persisted record",
                            raw: c
                        }, o.push({
                            id: n,
                            reason: "record was not a live persisted record",
                            code: "OTHER"
                        });
                        return
                    }
                    let {
                        document: l,
                        version: d
                    } = c, h = (0, en.isRecord)(l) ? l : {}, m = "number" == typeof h.schemaVersion ? h.schemaVersion : void 0;
                    try {
                        let t = (r = {
                            schemaVersion: m,
                            ...h
                        }, function(e, t, r) {
                            let n = {
                                    ...e
                                },
                                a = "number" == typeof e.schemaVersion ? e.schemaVersion : 0;
                            if (a > r) throw new u.CustomDashboardUnsupportedSchemaError(a, r);
                            let i = a,
                                o = t.length + 1,
                                s = 0;
                            for (; i < r && s < o;) {
                                let e = i,
                                    a = t.find(t => t.fromVersion === e);
                                if (!a) throw new u.CustomDashboardMigrationGapError(e, r);
                                let o = a.migrate(n),
                                    c = o.schemaVersion;
                                if ("number" == typeof c && c !== e && c !== a.toVersion) throw new u.CustomDashboardMigrationGapError(e, r, "Migration step ".concat(e, " → ").concat(a.toVersion, " produced schemaVersion ").concat(c, "."));
                                n = {
                                    ...o,
                                    schemaVersion: a.toVersion
                                }, i = a.toVersion, s += 1
                            }
                            if (i !== r) throw new u.CustomDashboardMigrationGapError(i, r, "Migration pipeline did not converge after ".concat(s, " steps (stopped at version ").concat(i, ")."));
                            return {
                                ...n,
                                schemaVersion: r
                            }
                        }(r, er, y.CUSTOM_DASHBOARD_CURRENT_SCHEMA_VERSION));
                        m !== t.schemaVersion && (s = !0);
                        let c = (0, k.validateCustomDashboardDocument)({
                            ...t,
                            universeId: e
                        });
                        if (c.id !== n) {
                            let e = 'bucket key "'.concat(n, '" does not match document.id "').concat(c.id, '"');
                            i[n] = {
                                version: "number" == typeof d ? d : 1,
                                migrationFailed: !0,
                                reason: e,
                                raw: l
                            }, o.push({
                                id: n,
                                reason: e,
                                code: "OTHER"
                            }), s = !0;
                            return
                        }
                        a[c.id] = {
                            document: c,
                            version: "number" == typeof d ? d : 1
                        }
                    } catch (r) {
                        let e = r instanceof u.CustomDashboardUnsupportedSchemaError,
                            t = r instanceof Error ? r.message : String(r);
                        i[n] = {
                            version: "number" == typeof d ? d : 1,
                            migrationFailed: !0,
                            reason: t,
                            raw: l
                        }, o.push({
                            id: n,
                            reason: t,
                            code: e ? "NEWER" : "OTHER"
                        }), s = !0
                    }
                }), {
                    records: a,
                    quarantine: i,
                    corrupted: o,
                    mutatedOnRead: s
                });
                if (this.corruptedByUniverse.set(e, g), v) try {
                    ec(l, e, p, f);
                    let t = l.getItem(eo(e));
                    this.materialisedByUniverse.set(e, {
                        rawString: t,
                        records: p,
                        quarantine: f
                    })
                } catch (e) {
                    null == (n = this.onPersistError) || n.call(this, e)
                } else this.materialisedByUniverse.set(e, {
                    rawString: d,
                    records: p,
                    quarantine: f
                });
                return {
                    storage: l,
                    records: p,
                    quarantine: f
                }
            }
            async list(e, t) {
                var r, n;
                let {
                    records: a
                } = this.readMaterialised(e), i = D(Object.values(a).map(e => e.document)), o = null != (r = null == (n = this.corruptedByUniverse.get(e)) ? void 0 : n.length) ? r : 0;
                return {
                    ...ee(i, t),
                    migrationFailedCount: o
                }
            }
            async listPinned(e) {
                let {
                    records: t
                } = this.readMaterialised(e);
                return D(Object.values(t).map(e => e.document)).filter(e => e.isPinned).map(e => {
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
                if (!n) throw new u.CustomDashboardNotFoundError(t);
                return n.document
            }
            async getVersion(e, t) {
                var r, n;
                let {
                    records: a
                } = this.readMaterialised(e);
                return null != (r = null == (n = a[t]) ? void 0 : n.version) ? r : null
            }
            commit(e, t) {
                let {
                    storage: r,
                    records: n,
                    quarantine: a
                } = this.readMaterialised(e), {
                    next: i,
                    result: o
                } = t(n, a);
                ec(r, e, i, a);
                let s = r.getItem(eo(e));
                return this.materialisedByUniverse.set(e, {
                    rawString: s,
                    records: i,
                    quarantine: a
                }), o
            }
            insertNewDocument(e, t) {
                this.assertUnderUniverseCap(e.universeId);
                let r = this.getLimits(e.universeId),
                    n = (0, k.validateDashboardName)(e.name, r),
                    a = (0, k.validateDashboardDescription)(e.description, r),
                    i = void 0 !== e.config ? (0, k.validateCustomDashboardConfig)(e.config, {
                        limits: r
                    }) : y.EMPTY_DASHBOARD_CONFIG,
                    o = this.clock.isoNow(),
                    s = {
                        id: this.idFactory.nextDashboardId(),
                        schemaVersion: y.LOCAL_STORAGE_DOCUMENT_SCHEMA_VERSION,
                        universeId: e.universeId,
                        name: n,
                        description: a,
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
                        config: i
                    };
                return this.commit(e.universeId, t => (eu(e.universeId, t, r.maxDashboardsPerUniverse), {
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
                let a = this.getLimits(e),
                    i = {};
                return void 0 !== r.name && (i.name = (0, k.validateDashboardName)(r.name, a)), void 0 !== r.description && (i.description = (0, k.validateDashboardDescription)(r.description, a)), void 0 !== r.config && (i.config = (0, k.validateCustomDashboardConfig)(r.config, {
                    limits: a
                })), this.applyMutation(e, t, "update", () => ({
                    ...i,
                    ...(null == n ? void 0 : n.actor) ? {
                        updatedByUserId: n.actor.userId,
                        updatedByUsername: n.actor.username
                    } : {}
                }), {
                    expectedVersion: null == n ? void 0 : n.expectedVersion
                })
            }
            async addChartTile(e, t, r, n) {
                let a = this.commit(e, e => {
                    let a = e[t];
                    if (!a) throw new u.CustomDashboardNotFoundError(t);
                    if ((null == n ? void 0 : n.expectedVersion) !== void 0 && n.expectedVersion !== a.version) throw new u.CustomDashboardVersionConflictError(t);
                    let {
                        config: i,
                        tile: o
                    } = (0, g.addChartTileToConfig)({
                        config: a.document.config,
                        tile: r.tile,
                        nextTileId: this.idFactory.nextTileId(),
                        limits: r.limits
                    }), s = this.clock.isoNow(), c = {
                        ...a.document,
                        config: i,
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
                                document: c,
                                version: a.version + 1
                            }
                        },
                        result: {
                            document: c,
                            tile: o
                        }
                    }
                });
                return this.emit({
                    universeId: e,
                    dashboardId: t,
                    eventType: "add-chart-tile"
                }), a
            }
            async delete(e, t) {
                this.commit(e, e => {
                    if (!e[t]) throw new u.CustomDashboardNotFoundError(t);
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
                    var a;
                    let i = null == (a = n[t]) ? void 0 : a.document;
                    if (!i) throw new u.CustomDashboardNotFoundError(t);
                    eu(e, n, this.getLimits(e).maxDashboardsPerUniverse);
                    let o = E(Object.values(n).map(e => e.document.name), i.name, this.duplicateNameSuffixes),
                        s = this.clock.isoNow(),
                        c = () => this.idFactory.nextTileId(),
                        l = (0, f.getSummaryCards)(i.config).map(e => A(e, c)),
                        d = (0, f.getChartRows)(i.config).map(e => ({
                            ...e,
                            tiles: e.tiles.map(e => A(e, c))
                        })),
                        h = {
                            ...i,
                            id: this.idFactory.nextDashboardId(),
                            name: o,
                            status: "draft",
                            isPinned: !1,
                            pinnedAt: void 0,
                            publishedAt: void 0,
                            createdAt: s,
                            updatedAt: s,
                            createdByUserId: r.createdByUserId,
                            createdByUsername: r.createdByUsername,
                            updatedByUserId: r.createdByUserId,
                            updatedByUsername: r.createdByUsername,
                            config: (0, f.withChartRows)((0, f.withSummaryCards)(i.config, l), d)
                        };
                    return {
                        next: {
                            ...n,
                            [h.id]: {
                                document: h,
                                version: 1
                            }
                        },
                        result: h
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
                    if (!n) throw new u.CustomDashboardNotFoundError(t);
                    var a = this.getLimits(e).maxPinnedDashboardsPerUniverse;
                    if (Object.values(r).filter(e => e.document.isPinned && e.document.id !== t).length >= a) throw new u.CustomDashboardQuotaExceededError("Universe ".concat(e, " is at the pinned-dashboard cap of ").concat(a, ". Unpin one to pin another."));
                    let i = this.clock.isoNow(),
                        o = {
                            ...n.document,
                            isPinned: !0,
                            pinnedAt: i,
                            updatedAt: i
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
                return I(Object.values(t).map(e => e.document.name))
            }
            subscribe(e) {
                return this.disposed ? () => void 0 : (this.ensureStorageListener(), this.listeners.add(e), () => {
                    this.listeners.delete(e)
                })
            }
            async applyMutation(e, t, r, n, a) {
                let i = this.commit(e, e => {
                    let r = e[t];
                    if (!r) throw new u.CustomDashboardNotFoundError(t);
                    if ((null == a ? void 0 : a.expectedVersion) !== void 0 && a.expectedVersion !== r.version) throw new u.CustomDashboardVersionConflictError(t);
                    let i = this.clock.isoNow(),
                        o = {
                            ...r.document,
                            ...n(i),
                            updatedAt: i
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
                }), i
            }
            constructor(e = {}) {
                var t, r, n, a;
                (0, m._)(this, "listeners", new Set), (0, m._)(this, "storageListenerAttached", !1), (0, m._)(this, "disposed", !1), (0, m._)(this, "corruptedByUniverse", new Map), (0, m._)(this, "storageUnreadableByUniverse", new Map), (0, m._)(this, "materialisedByUniverse", new Map), (0, m._)(this, "clock", void 0), (0, m._)(this, "idFactory", void 0), (0, m._)(this, "onPersistError", void 0), (0, m._)(this, "duplicateNameSuffixes", void 0), (0, m._)(this, "getLimits", void 0), (0, m._)(this, "handleStorageEvent", e => {
                    if (!e.key) return;
                    let t = function(e) {
                        if (!e.startsWith(ea)) return null;
                        let t = e.slice(ea.length);
                        if (!ei.test(t)) return null;
                        let r = Number(t);
                        return Number.isSafeInteger(r) ? r : null
                    }(e.key);
                    null !== t && (this.materialisedByUniverse.delete(t), this.emit({
                        universeId: t,
                        eventType: "external"
                    }))
                }), this.getLimits = null != (t = e.getLimits) ? t : () => c.CONSERVATIVE_DASHBOARD_LIMITS, this.clock = null != (r = e.clock) ? r : X, this.onPersistError = e.onPersistError, this.idFactory = null != (n = e.idFactory) ? n : b.defaultIdFactory, this.duplicateNameSuffixes = null != (a = e.duplicateNameSuffixes) ? a : Z
            }
        },
        ed = {
            canCreate: !1,
            canEdit: !1,
            canPublish: !1,
            canDelete: !1
        },
        eh = {
            actions: ed,
            limits: (0, c.resolveEffectiveDashboardLimits)(s.DENIED_DASHBOARD_CAPABILITIES.limits),
            isResolved: !1
        },
        em = {
            ...eh,
            isResolved: !0
        },
        ep = {
            ...em,
            actions: {
                canCreate: !0,
                canEdit: !0,
                canPublish: !0,
                canDelete: !0
            }
        },
        ef = {
            kind: "fixed",
            state: eh
        },
        ey = {
            list: async () => ({
                items: [],
                migrationFailedCount: 0
            }),
            listPinned: async () => [],
            async get() {
                throw new u.CustomDashboardNotAvailableError
            },
            async create() {
                throw new u.CustomDashboardNotAvailableError
            },
            async createAndPublish() {
                throw new u.CustomDashboardNotAvailableError
            },
            async update() {
                throw new u.CustomDashboardNotAvailableError
            },
            async addChartTile() {
                throw new u.CustomDashboardNotAvailableError
            },
            async delete() {
                throw new u.CustomDashboardNotAvailableError
            },
            async duplicate() {
                throw new u.CustomDashboardNotAvailableError
            },
            async publish() {
                throw new u.CustomDashboardNotAvailableError
            },
            async unpublish() {
                throw new u.CustomDashboardNotAvailableError
            },
            async pin() {
                throw new u.CustomDashboardNotAvailableError
            },
            async unpin() {
                throw new u.CustomDashboardNotAvailableError
            },
            async suggestDefaultName() {
                throw new u.CustomDashboardNotAvailableError
            },
            getVersion: async () => null,
            subscribe: () => () => void 0
        },
        eg = (0, r.createContext)(null),
        ev = (0, r.createContext)(!1);

    function eb(e, t) {
        var n, a, i;
        let o = (0, r.useContext)(ev),
            s = null != (n = null == e ? void 0 : e.capabilitySource) ? n : ef,
            u = "fixed" === s.kind ? null : s,
            {
                capabilities: l,
                isResolved: h,
                isError: m
            } = (0, d.useDashboardCapabilitiesQuery)(null != (a = null == u ? void 0 : u.universeId) ? a : 0, null != (i = null == e ? void 0 : e.backends.api) ? i : ey, {
                enabled: "server" === s.kind && t && !o
            });
        return (0, r.useMemo)(() => "fixed" === s.kind ? s.state : "hybrid" === s.kind ? {
            ...ep,
            limits: (0, c.resolveHybridDashboardLimits)(h ? l : void 0)
        } : function(e, t) {
            let {
                capabilities: r,
                isResolved: n,
                isError: a
            } = e;
            return t ? a ? em : {
                actions: {
                    canCreate: r.canCreate,
                    canEdit: r.canEdit,
                    canPublish: r.canPublish,
                    canDelete: r.canDelete
                },
                limits: (0, c.resolveEffectiveDashboardLimits)(r.limits),
                isResolved: n
            } : eh
        }({
            capabilities: l,
            isResolved: h,
            isError: m
        }, s.isBackendChosen), [l, m, h, s])
    }
    e.s(["CustomDashboardCapabilitiesFromList", 0, e => {
        let {
            children: r
        } = e;
        return (0, t.jsx)(ev.Provider, {
            value: !0,
            children: r
        })
    }, "CustomDashboardServiceProvider", 0, e => {
        let {
            service: n,
            canMutateDashboards: i = !0,
            children: o
        } = e, s = (0, a.useQueryClient)(), [u] = (0, r.useState)(() => {
            let e, t, r;
            return e = new F(P(), {
                repairLegacyDocumentsOnRead: !0
            }), t = null, r = e => (0, c.resolveHybridDashboardLimits)(s.getQueryData(l.customDashboardQueryKeys.capabilities(e))), {
                api: e,
                getHybrid: () => (null != t || (t = new W({
                    apiService: e,
                    localService: function(e) {
                        try {
                            if (window.localStorage) return new el({
                                getLimits: e
                            })
                        } catch (e) {}
                        return new et({
                            getLimits: e
                        })
                    }(r)
                })), t),
                dispose: () => {
                    null == t || t.dispose(), e.dispose()
                }
            }
        });
        (0, r.useEffect)(() => u.dispose, [u]);
        let d = (0, r.useMemo)(() => n ? {
            service: n,
            isReady: !0,
            capabilitySource: {
                kind: "fixed",
                state: i ? ep : em
            },
            backends: {
                api: n,
                getHybrid: () => n
            }
        } : {
            service: ey,
            isReady: !1,
            capabilitySource: ef,
            backends: u
        }, [i, u, n]);
        return (0, t.jsx)(eg.Provider, {
            value: d,
            children: o
        })
    }, "UniverseFlaggedCustomDashboardProvider", 0, e => {
        let {
            children: a
        } = e, s = (0, r.useContext)(eg);
        if (!s) throw Error("UniverseFlaggedCustomDashboardProvider must be used within CustomDashboardServiceProvider.");
        let c = (0, h.parseExperienceUniverseIdFromRouter)((0, n.useRouter)()),
            u = Number.isFinite(c) && c > 0,
            {
                ready: l,
                value: m
            } = (0, i.useFlag)(o.isCustomDashboardsLocalStorageEnabled),
            p = l && m,
            {
                backends: f
            } = s,
            y = (0, d.useDashboardCapabilitiesQuery)(c, f.api, {
                enabled: p
            }),
            g = function(e) {
                let {
                    isFlagReady: t,
                    isHybridCandidate: r,
                    hasUniverse: n,
                    capabilitiesQuery: {
                        capabilities: a,
                        isResolved: i,
                        isError: o
                    }
                } = e;
                return t ? r ? !n || i || o ? !o && n && (a.canCreate || a.canEdit) ? "api" : "hybrid" : "pending" : "api" : "pending"
            }({
                isFlagReady: l,
                isHybridCandidate: p,
                hasUniverse: u,
                capabilitiesQuery: y
            }),
            [v, b] = (0, r.useState)(null);
        "pending" !== g && (null == v ? void 0 : v.universeId) !== c && b({
            universeId: c,
            mode: g
        });
        let A = (null == v ? void 0 : v.universeId) === c ? v.mode : g,
            D = (0, r.useMemo)(() => "hybrid" === A ? {
                backends: f,
                service: f.getHybrid(),
                isReady: !0,
                capabilitySource: {
                    kind: "hybrid",
                    universeId: c
                }
            } : "api" === A ? {
                backends: f,
                service: f.api,
                isReady: !0,
                capabilitySource: u ? {
                    kind: "server",
                    universeId: c,
                    isBackendChosen: !0
                } : {
                    kind: "fixed",
                    state: em
                }
            } : {
                backends: f,
                service: s.service,
                isReady: !1,
                capabilitySource: u ? {
                    kind: "server",
                    universeId: c,
                    isBackendChosen: !1
                } : ef
            }, [A, f, u, s.service, c]);
        return (0, t.jsx)(eg.Provider, {
            value: D,
            children: a
        })
    }, "useCustomDashboardActions", 0, function() {
        let e = (0, r.useContext)(eg),
            {
                actions: t
            } = eb(e, !0);
        if (!e) throw Error("useCustomDashboardActions() must be used within a CustomDashboardServiceProvider.");
        return t
    }, "useCustomDashboardActionsResolved", 0, function() {
        let e = (0, r.useContext)(eg),
            {
                isResolved: t
            } = eb(e, !0);
        if (!e) throw Error("useCustomDashboardActionsResolved() must be used within a CustomDashboardServiceProvider.");
        return t
    }, "useCustomDashboardLimits", 0, function() {
        let e = (0, r.useContext)(eg),
            {
                limits: t
            } = eb(e, !0);
        if (!e) throw Error("useCustomDashboardLimits() must be used within a CustomDashboardServiceProvider.");
        return t
    }, "useCustomDashboardService", 0, function() {
        let e = (0, r.useContext)(eg);
        if (!e) throw Error("useCustomDashboardService() must be used within a CustomDashboardServiceProvider.");
        return e.service
    }, "useCustomDashboardsBackendState", 0, function() {
        let e = (0, r.useContext)(eg);
        if (!e) throw Error("useCustomDashboardsBackendState() must be used within CustomDashboardServiceProvider.");
        return {
            isReady: e.isReady
        }
    }, "useOptionalCustomDashboardActionState", 0, function(e) {
        let {
            isRequested: t
        } = e, n = (0, r.useContext)(eg), {
            actions: a,
            isResolved: i
        } = eb(n, t);
        return (0, r.useMemo)(() => n ? {
            actions: a,
            isResolved: i
        } : {
            actions: ed,
            isResolved: !0
        }, [a, n, i])
    }, "useOptionalCustomDashboardService", 0, function() {
        var e, t;
        return null != (e = null == (t = (0, r.useContext)(eg)) ? void 0 : t.service) ? e : null
    }, "useOptionalCustomDashboardsBackendState", 0, function() {
        var e;
        let t = (0, r.useContext)(eg);
        return {
            isReady: null != (e = null == t ? void 0 : t.isReady) && e
        }
    }], 479236)
}, 379843, e => {
    "use strict";
    var t = e.i(531007);
    let r = [t.ChartType.Spline, t.ChartType.Area, t.ChartType.DurationSpline, t.ChartType.DurationArea, t.ChartType.Bar, t.ChartType.Column, t.ChartType.Pie, t.ChartType.Table],
        n = {
            Untabbed: "Untabbed"
        },
        a = {
            page: {
                mode: n.Untabbed,
                surface: {
                    controls: {},
                    bodyNodes: []
                }
            }
        };
    e.s(["BACKEND_DOCUMENT_WRITE_SCHEMA_VERSION", 0, 1, "CUSTOM_DASHBOARD_CHART_TYPES", 0, r, "CUSTOM_DASHBOARD_CURRENT_SCHEMA_VERSION", 0, 1, "CustomDashboardSummaryCardAggregation", 0, {
        AverageOverTimePeriod: "AverageOverTimePeriod",
        AveragePerUniqueUser: "AveragePerUniqueUser",
        MostRecentDataPoint: "MostRecentDataPoint",
        Total: "Total",
        Median: "Median",
        Cumulative: "Cumulative"
    }, "DEFAULT_CHART_GRANULARITY", 0, "Day", "DashboardPageMode", 0, n, "EMPTY_DASHBOARD_CONFIG", 0, a, "LOCAL_STORAGE_DOCUMENT_SCHEMA_VERSION", 0, 1, "READABLE_BACKEND_DOCUMENT_SCHEMA_VERSIONS", 0, [1, 2], "SummaryCardTitleSource", 0, {
        Auto: "Auto",
        Custom: "Custom"
    }])
}, 296150, e => {
    "use strict";
    var t = e.i(650040),
        r = e.i(318727),
        n = e.i(646877);
    e.s(["addChartTileToConfig", 0, function(e) {
        let {
            config: a,
            tile: i,
            nextTileId: o,
            limits: s
        } = e, c = {
            ...i,
            tileId: o
        };
        return {
            config: (0, n.validateCustomDashboardConfig)((0, t.withChartRows)(a, [...(0, t.getChartRows)(a), (0, r.singleTileRow)(c)]), {
                limits: s
            }),
            tile: c
        }
    }])
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
}, 787202, e => {
    "use strict";
    var t = e.i(31611),
        r = e.i(11517),
        n = e.i(339923),
        a = e.i(927868);
    let i = t.RAQIV2UIPseudoDimension.AggregationType,
        o = t.RAQIV2UIPseudoDimension.PercentileType,
        s = t.RAQIV2AggregationType.Average;
    e.s(["resolveDefaultChartAggregation", 0, function(e) {
        let c = function(e) {
            var r;
            for (let n of null != (r = e.variantSelections) ? r : [])
                if (n.pseudoDimensionKey === i && (0, a.isValidEnumValue)(t.RAQIV2AggregationType, n.variantKey) || n.pseudoDimensionKey === o && (0, a.isValidEnumValue)(t.RAQIV2PercentileType, n.variantKey)) return n.variantKey
        }(e);
        if (void 0 !== c) return c;
        if (e.computedMetric) {
            let [n] = e.computedMetric.sources;
            if (n && (0, r.isCustomEventsAtomicMetricLike)(n.metric)) {
                var u;
                return null != (u = n.metric.aggregationType) ? u : t.RAQIV2AggregationType.Sum
            }
            return s
        }
        return void 0 !== e.metricKey ? (0, n.getIsAverageAggregationMetric)(e.metricKey) ? t.RAQIV2AggregationType.Average : t.RAQIV2AggregationType.Sum : s
    }])
}]);

//# debugId=8a3b2759-39d4-a96e-eb70-42d1096e275e
//# sourceMappingURL=0tqq50d15e106.js.map