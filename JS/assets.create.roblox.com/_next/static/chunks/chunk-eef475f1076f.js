;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "89008704-49fa-f185-d0f8-9850e5aa814c")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 522829, e => {
    "use strict";
    var t, r = e.i(846854);
    let n = (0, e.i(272593).createClientConfiguration)("developer-analytics-aggregations", "bedev2"),
        a = new r.UniverseAnalyticsAggregationsApi(n),
        i = new r.FeaturePermissionsApi(n),
        o = new r.AnalyticsHomeApi(n);
    r.Dimension.AgeGroup, r.Dimension.AgeGroup, r.Dimension.Locale, r.Dimension.Locale, r.Dimension.OperatingSystem, r.Dimension.OperatingSystem, r.Dimension.Platform, r.Dimension.Platform, r.Dimension.Country, r.Dimension.Country, r.Dimension.Gender, r.Dimension.Gender, r.Dimension.TopLocales, r.Dimension.TopLocales, r.Dimension.TopCountries, r.Dimension.TopCountries, r.Dimension.IsNewUser, r.Dimension.IsNewUser, r.Dimension.SessionTimeBucket, r.Dimension.SessionTimeBucket, r.Dimension.Product, r.Dimension.Product, r.Dimension.Product, r.Dimension.Product, r.Dimension.RevenueSource, r.Dimension.RevenueSource;
    var s = ((t = s || {}).OnboardInviteUsers = "OnboardInviteUsers", t.OnboardImproveCoreLoop = "OnboardImproveCoreLoop", t.OnboardRegularUpdates = "OnboardRegularUpdates", t);
    e.s(["StaticInsightType", () => s, "default", 0, {
        getUniverseAnalyticsAggregationsMetadata: () => a.universeAnalyticsAggregationsGetMetadata(),
        getfeaturePermissionsGetFeaturePermission: e => i.featurePermissionsGetFeaturePermission(e),
        getfeaturePermissionsGetFeatureFlags: e => i.featurePermissionsGetFeatureFlags(e),
        getAnalyticsHomeTabOrder: e => o.analyticsHomeGetAnalyticsHomeTabOrder(e)
    }])
}, 704066, e => {
    "use strict";
    var t = e.i(522829);
    e.s(["developerAnalyticsAggregationsClient", () => t.default])
}, 494315, e => {
    "use strict";
    e.s(["MAX_TABLE_METRIC_COLUMNS", 0, 8])
}, 834046, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(157310),
        n = e.i(704066);
    let a = {
            experienceHasPerformanceMonitoringAccess: !1,
            userCanViewAnalyticsForUniverse: !1,
            userCanManageAnalyticsAlertForUniverse: !1,
            canSaveCustomDashboards: !1,
            experienceHasExperimentationMinDau: !1,
            experienceHasNoInGameExperiment: !1
        },
        i = e => ({
            experienceHasPerformanceMonitoringAccess: !0 === e.experienceHasPerformanceMonitoringAccess,
            userCanViewAnalyticsForUniverse: !0 === e.userCanViewAnalyticsForUniverse,
            userCanManageAnalyticsAlertForUniverse: !0 === e.userCanManageAnalyticsAlertForUniverse,
            canSaveCustomDashboards: !0 === e.canSaveCustomDashboards,
            experienceHasExperimentationMinDau: !0 === e.experienceHasExperimentationMinDau,
            experienceHasNoInGameExperiment: !0 === e.experienceHasNoInGameExperiment
        });
    e.s(["useAnalyticsExperiencePermissions", 0, e => {
        let o = void 0 !== e && e > 0 ? e : void 0,
            s = (0, r.useQuery)({
                queryKey: ["analytics-permissions", null != o ? o : "invalid-experience"],
                queryFn: () => n.developerAnalyticsAggregationsClient.getfeaturePermissionsGetFeaturePermission(void 0 === o ? {} : {
                    universeId: o
                }),
                select: i,
                enabled: void 0 !== o,
                staleTime: 1 / 0
            });
        return (0, t.useMemo)(() => {
            var e;
            return {
                ...null != (e = s.data) ? e : a,
                isPending: s.isPending,
                isError: s.isError
            }
        }, [s.data, s.isError, s.isPending])
    }])
}, 545154, 595028, e => {
    "use strict";
    var t = e.i(507786),
        r = {},
        n = function(e, t, n, a, i) {
            var o = new Worker(r[t] || (r[t] = URL.createObjectURL(new Blob([e + ';addEventListener("error",function(e){e=e.error;postMessage({$e$:[e.message,e.code,e.stack]})})'], {
                type: "text/javascript"
            }))));
            return o.onmessage = function(e) {
                var t = e.data,
                    r = t.$e$;
                if (r) {
                    var n = Error(r[0]);
                    n.code = r[1], n.stack = r[2], i(n, null)
                } else i(null, t)
            }, o.postMessage(n, a), o
        },
        a = Uint8Array,
        i = Uint16Array,
        o = Int32Array,
        s = new a([0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 0, 0, 0, 0]),
        u = new a([0, 0, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11, 11, 12, 12, 13, 13, 0, 0]),
        c = new a([16, 17, 18, 0, 8, 7, 9, 6, 10, 5, 11, 4, 12, 3, 13, 2, 14, 1, 15]),
        l = function(e, t) {
            for (var r = new i(31), n = 0; n < 31; ++n) r[n] = t += 1 << e[n - 1];
            for (var a = new o(r[30]), n = 1; n < 30; ++n)
                for (var s = r[n]; s < r[n + 1]; ++s) a[s] = s - r[n] << 5 | n;
            return {
                b: r,
                r: a
            }
        },
        d = l(s, 2),
        h = d.b,
        m = d.r;
    h[28] = 258, m[258] = 28;
    for (var p = l(u, 0), f = p.b, y = p.r, g = new i(32768), v = 0; v < 32768; ++v) {
        var b = (43690 & v) >> 1 | (21845 & v) << 1;
        b = (61680 & (b = (52428 & b) >> 2 | (13107 & b) << 2)) >> 4 | (3855 & b) << 4, g[v] = ((65280 & b) >> 8 | (255 & b) << 8) >> 1
    }
    for (var A = function(e, t, r) {
            for (var n, a = e.length, o = 0, s = new i(t); o < a; ++o) e[o] && ++s[e[o] - 1];
            var u = new i(t);
            for (o = 1; o < t; ++o) u[o] = u[o - 1] + s[o - 1] << 1;
            if (r) {
                n = new i(1 << t);
                var c = 15 - t;
                for (o = 0; o < a; ++o)
                    if (e[o])
                        for (var l = o << 4 | e[o], d = t - e[o], h = u[e[o] - 1]++ << d, m = h | (1 << d) - 1; h <= m; ++h) n[g[h] >> c] = l
            } else
                for (n = new i(a), o = 0; o < a; ++o) e[o] && (n[o] = g[u[e[o] - 1]++] >> 15 - e[o]);
            return n
        }, D = new a(288), v = 0; v < 144; ++v) D[v] = 8;
    for (var v = 144; v < 256; ++v) D[v] = 9;
    for (var v = 256; v < 280; ++v) D[v] = 7;
    for (var v = 280; v < 288; ++v) D[v] = 8;
    for (var C = new a(32), v = 0; v < 32; ++v) C[v] = 5;
    var w = A(D, 9, 0),
        S = A(D, 9, 1),
        T = A(C, 5, 0),
        E = A(C, 5, 1),
        R = function(e) {
            for (var t = e[0], r = 1; r < e.length; ++r) e[r] > t && (t = e[r]);
            return t
        },
        I = function(e, t, r) {
            var n = t / 8 | 0;
            return (e[n] | e[n + 1] << 8) >> (7 & t) & r
        },
        _ = function(e, t) {
            var r = t / 8 | 0;
            return (e[r] | e[r + 1] << 8 | e[r + 2] << 16) >> (7 & t)
        },
        N = function(e) {
            return (e + 7) / 8 | 0
        },
        M = function(e, t, r) {
            return (null == t || t < 0) && (t = 0), (null == r || r > e.length) && (r = e.length), new a(e.subarray(t, r))
        },
        V = ["unexpected EOF", "invalid block type", "invalid length/literal", "invalid distance", "stream finished", "no stream handler", , "no callback", "invalid UTF-8 data", "extra field too long", "date not in range 1980-2099", "filename too long", "stream finishing", "invalid zip data"],
        O = function(e, t, r) {
            var n = Error(t || V[e]);
            if (n.code = e, Error.captureStackTrace && Error.captureStackTrace(n, O), !r) throw n;
            return n
        },
        U = function(e, t, r, n) {
            var i = e.length,
                o = n ? n.length : 0;
            if (!i || t.f && !t.l) return r || new a(0);
            var l = !r,
                d = l || 2 != t.i,
                m = t.i;
            l && (r = new a(3 * i));
            var p = function(e) {
                    var t = r.length;
                    if (e > t) {
                        var n = new a(Math.max(2 * t, e));
                        n.set(r), r = n
                    }
                },
                y = t.f || 0,
                g = t.p || 0,
                v = t.b || 0,
                b = t.l,
                D = t.d,
                C = t.m,
                w = t.n,
                T = 8 * i;
            do {
                if (!b) {
                    y = I(e, g, 1);
                    var V = I(e, g + 1, 3);
                    if (g += 3, V)
                        if (1 == V) b = S, D = E, C = 9, w = 5;
                        else if (2 == V) {
                        var U = I(e, g, 31) + 257,
                            P = I(e, g + 10, 15) + 4,
                            k = U + I(e, g + 5, 31) + 1;
                        g += 14;
                        for (var B = new a(k), x = new a(19), H = 0; H < P; ++H) x[c[H]] = I(e, g + 3 * H, 7);
                        g += 3 * P;
                        for (var G = R(x), Q = (1 << G) - 1, L = A(x, G, 1), H = 0; H < k;) {
                            var F = L[I(e, g, Q)];
                            g += 15 & F;
                            var K = F >> 4;
                            if (K < 16) B[H++] = K;
                            else {
                                var j = 0,
                                    z = 0;
                                for (16 == K ? (z = 3 + I(e, g, 3), g += 2, j = B[H - 1]) : 17 == K ? (z = 3 + I(e, g, 7), g += 3) : 18 == K && (z = 11 + I(e, g, 127), g += 7); z--;) B[H++] = j
                            }
                        }
                        var Y = B.subarray(0, U),
                            q = B.subarray(U);
                        C = R(Y), w = R(q), b = A(Y, C, 1), D = A(q, w, 1)
                    } else O(1);
                    else {
                        var K = N(g) + 4,
                            X = e[K - 4] | e[K - 3] << 8,
                            W = K + X;
                        if (W > i) {
                            m && O(0);
                            break
                        }
                        d && p(v + X), r.set(e.subarray(K, W), v), t.b = v += X, t.p = g = 8 * W, t.f = y;
                        continue
                    }
                    if (g > T) {
                        m && O(0);
                        break
                    }
                }
                d && p(v + 131072);
                for (var $ = (1 << C) - 1, J = (1 << w) - 1, Z = g;; Z = g) {
                    var j = b[_(e, g) & $],
                        ee = j >> 4;
                    if ((g += 15 & j) > T) {
                        m && O(0);
                        break
                    }
                    if (j || O(2), ee < 256) r[v++] = ee;
                    else if (256 == ee) {
                        Z = g, b = null;
                        break
                    } else {
                        var et = ee - 254;
                        if (ee > 264) {
                            var H = ee - 257,
                                er = s[H];
                            et = I(e, g, (1 << er) - 1) + h[H], g += er
                        }
                        var en = D[_(e, g) & J],
                            ea = en >> 4;
                        en || O(3), g += 15 & en;
                        var q = f[ea];
                        if (ea > 3) {
                            var er = u[ea];
                            q += _(e, g) & (1 << er) - 1, g += er
                        }
                        if (g > T) {
                            m && O(0);
                            break
                        }
                        d && p(v + 131072);
                        var ei = v + et;
                        if (v < q) {
                            var eo = o - q,
                                es = Math.min(q, ei);
                            for (eo + v < 0 && O(3); v < es; ++v) r[v] = n[eo + v]
                        }
                        for (; v < ei; ++v) r[v] = r[v - q]
                    }
                }
                t.l = b, t.p = Z, t.b = v, t.f = y, b && (y = 1, t.m = C, t.d = D, t.n = w)
            } while (!y) return v != r.length && l ? M(r, 0, v) : r.subarray(0, v)
        },
        P = function(e, t, r) {
            r <<= 7 & t;
            var n = t / 8 | 0;
            e[n] |= r, e[n + 1] |= r >> 8
        },
        k = function(e, t, r) {
            r <<= 7 & t;
            var n = t / 8 | 0;
            e[n] |= r, e[n + 1] |= r >> 8, e[n + 2] |= r >> 16
        },
        B = function(e, t) {
            for (var r = [], n = 0; n < e.length; ++n) e[n] && r.push({
                s: n,
                f: e[n]
            });
            var o = r.length,
                s = r.slice();
            if (!o) return {
                t: K,
                l: 0
            };
            if (1 == o) {
                var u = new a(r[0].s + 1);
                return u[r[0].s] = 1, {
                    t: u,
                    l: 1
                }
            }
            r.sort(function(e, t) {
                return e.f - t.f
            }), r.push({
                s: -1,
                f: 25001
            });
            var c = r[0],
                l = r[1],
                d = 0,
                h = 1,
                m = 2;
            for (r[0] = {
                    s: -1,
                    f: c.f + l.f,
                    l: c,
                    r: l
                }; h != o - 1;) c = r[r[d].f < r[m].f ? d++ : m++], l = r[d != h && r[d].f < r[m].f ? d++ : m++], r[h++] = {
                s: -1,
                f: c.f + l.f,
                l: c,
                r: l
            };
            for (var p = s[0].s, n = 1; n < o; ++n) s[n].s > p && (p = s[n].s);
            var f = new i(p + 1),
                y = x(r[h - 1], f, 0);
            if (y > t) {
                var n = 0,
                    g = 0,
                    v = y - t,
                    b = 1 << v;
                for (s.sort(function(e, t) {
                        return f[t.s] - f[e.s] || e.f - t.f
                    }); n < o; ++n) {
                    var A = s[n].s;
                    if (f[A] > t) g += b - (1 << y - f[A]), f[A] = t;
                    else break
                }
                for (g >>= v; g > 0;) {
                    var D = s[n].s;
                    f[D] < t ? g -= 1 << t - f[D]++ - 1 : ++n
                }
                for (; n >= 0 && g; --n) {
                    var C = s[n].s;
                    f[C] == t && (--f[C], ++g)
                }
                y = t
            }
            return {
                t: new a(f),
                l: y
            }
        },
        x = function(e, t, r) {
            return -1 == e.s ? Math.max(x(e.l, t, r + 1), x(e.r, t, r + 1)) : t[e.s] = r
        },
        H = function(e) {
            for (var t = e.length; t && !e[--t];);
            for (var r = new i(++t), n = 0, a = e[0], o = 1, s = function(e) {
                    r[n++] = e
                }, u = 1; u <= t; ++u)
                if (e[u] == a && u != t) ++o;
                else {
                    if (!a && o > 2) {
                        for (; o > 138; o -= 138) s(32754);
                        o > 2 && (s(o > 10 ? o - 11 << 5 | 28690 : o - 3 << 5 | 12305), o = 0)
                    } else if (o > 3) {
                        for (s(a), --o; o > 6; o -= 6) s(8304);
                        o > 2 && (s(o - 3 << 5 | 8208), o = 0)
                    }
                    for (; o--;) s(a);
                    o = 1, a = e[u]
                } return {
                c: r.subarray(0, n),
                n: t
            }
        },
        G = function(e, t) {
            for (var r = 0, n = 0; n < t.length; ++n) r += e[n] * t[n];
            return r
        },
        Q = function(e, t, r) {
            var n = r.length,
                a = N(t + 2);
            e[a] = 255 & n, e[a + 1] = n >> 8, e[a + 2] = 255 ^ e[a], e[a + 3] = 255 ^ e[a + 1];
            for (var i = 0; i < n; ++i) e[a + i + 4] = r[i];
            return (a + 4 + n) * 8
        },
        L = function(e, t, r, n, a, o, l, d, h, m, p) {
            P(t, p++, r), ++a[256];
            for (var f, y, g, v, b = B(a, 15), S = b.t, E = b.l, R = B(o, 15), I = R.t, _ = R.l, N = H(S), M = N.c, V = N.n, O = H(I), U = O.c, x = O.n, L = new i(19), F = 0; F < M.length; ++F) ++L[31 & M[F]];
            for (var F = 0; F < U.length; ++F) ++L[31 & U[F]];
            for (var K = B(L, 7), j = K.t, z = K.l, Y = 19; Y > 4 && !j[c[Y - 1]]; --Y);
            var q = m + 5 << 3,
                X = G(a, D) + G(o, C) + l,
                W = G(a, S) + G(o, I) + l + 14 + 3 * Y + G(L, j) + 2 * L[16] + 3 * L[17] + 7 * L[18];
            if (h >= 0 && q <= X && q <= W) return Q(t, p, e.subarray(h, h + m));
            if (P(t, p, 1 + (W < X)), p += 2, W < X) {
                f = A(S, E, 0), y = S, g = A(I, _, 0), v = I;
                var $ = A(j, z, 0);
                P(t, p, V - 257), P(t, p + 5, x - 1), P(t, p + 10, Y - 4), p += 14;
                for (var F = 0; F < Y; ++F) P(t, p + 3 * F, j[c[F]]);
                p += 3 * Y;
                for (var J = [M, U], Z = 0; Z < 2; ++Z)
                    for (var ee = J[Z], F = 0; F < ee.length; ++F) {
                        var et = 31 & ee[F];
                        P(t, p, $[et]), p += j[et], et > 15 && (P(t, p, ee[F] >> 5 & 127), p += ee[F] >> 12)
                    }
            } else f = w, y = D, g = T, v = C;
            for (var F = 0; F < d; ++F) {
                var er = n[F];
                if (er > 255) {
                    var et = er >> 18 & 31;
                    k(t, p, f[et + 257]), p += y[et + 257], et > 7 && (P(t, p, er >> 23 & 31), p += s[et]);
                    var en = 31 & er;
                    k(t, p, g[en]), p += v[en], en > 3 && (k(t, p, er >> 5 & 8191), p += u[en])
                } else k(t, p, f[er]), p += y[er]
            }
            return k(t, p, f[256]), p + y[256]
        },
        F = new o([65540, 131080, 131088, 131104, 262176, 1048704, 1048832, 2114560, 2117632]),
        K = new a(0),
        j = function(e, t, r, n, c, l) {
            var d = l.z || e.length,
                h = new a(n + d + 5 * (1 + Math.ceil(d / 7e3)) + c),
                p = h.subarray(n, h.length - c),
                f = l.l,
                g = 7 & (l.r || 0);
            if (t) {
                g && (p[0] = l.r >> 3);
                for (var v = F[t - 1], b = v >> 13, A = 8191 & v, D = (1 << r) - 1, C = l.p || new i(32768), w = l.h || new i(D + 1), S = Math.ceil(r / 3), T = 2 * S, E = function(t) {
                        return (e[t] ^ e[t + 1] << S ^ e[t + 2] << T) & D
                    }, R = new o(25e3), I = new i(288), _ = new i(32), V = 0, O = 0, U = l.i || 0, P = 0, k = l.w || 0, B = 0; U + 2 < d; ++U) {
                    var x = E(U),
                        H = 32767 & U,
                        G = w[x];
                    if (C[H] = G, w[x] = H, k <= U) {
                        var K = d - U;
                        if ((V > 7e3 || P > 24576) && (K > 423 || !f)) {
                            g = L(e, p, 0, R, I, _, O, P, B, U - B, g), P = V = O = 0, B = U;
                            for (var j = 0; j < 286; ++j) I[j] = 0;
                            for (var j = 0; j < 30; ++j) _[j] = 0
                        }
                        var z = 2,
                            Y = 0,
                            q = A,
                            X = H - G & 32767;
                        if (K > 2 && x == E(U - X))
                            for (var W = Math.min(b, K) - 1, $ = Math.min(32767, U), J = Math.min(258, K); X <= $ && --q && H != G;) {
                                if (e[U + z] == e[U + z - X]) {
                                    for (var Z = 0; Z < J && e[U + Z] == e[U + Z - X]; ++Z);
                                    if (Z > z) {
                                        if (z = Z, Y = X, Z > W) break;
                                        for (var ee = Math.min(X, Z - 2), et = 0, j = 0; j < ee; ++j) {
                                            var er = U - X + j & 32767,
                                                en = C[er],
                                                ea = er - en & 32767;
                                            ea > et && (et = ea, G = er)
                                        }
                                    }
                                }
                                G = C[H = G], X += H - G & 32767
                            }
                        if (Y) {
                            R[P++] = 0x10000000 | m[z] << 18 | y[Y];
                            var ei = 31 & m[z],
                                eo = 31 & y[Y];
                            O += s[ei] + u[eo], ++I[257 + ei], ++_[eo], k = U + z, ++V
                        } else R[P++] = e[U], ++I[e[U]]
                    }
                }
                for (U = Math.max(U, k); U < d; ++U) R[P++] = e[U], ++I[e[U]];
                g = L(e, p, f, R, I, _, O, P, B, U - B, g), f || (l.r = 7 & g | p[g / 8 | 0] << 3, g -= 7, l.h = w, l.p = C, l.i = U, l.w = k)
            } else {
                for (var U = l.w || 0; U < d + f; U += 65535) {
                    var es = U + 65535;
                    es >= d && (p[g / 8 | 0] = f, es = d), g = Q(p, g + 1, e.subarray(U, es))
                }
                l.i = d
            }
            return M(h, 0, n + N(g) + c)
        },
        z = function() {
            for (var e = new Int32Array(256), t = 0; t < 256; ++t) {
                for (var r = t, n = 9; --n;) r = (1 & r && -0x12477ce0) ^ r >>> 1;
                e[t] = r
            }
            return e
        }(),
        Y = function() {
            var e = -1;
            return {
                p: function(t) {
                    for (var r = e, n = 0; n < t.length; ++n) r = z[255 & r ^ t[n]] ^ r >>> 8;
                    e = r
                },
                d: function() {
                    return ~e
                }
            }
        },
        q = function() {
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
        X = function(e, t, r, n, i) {
            if (!i && (i = {
                    l: 1
                }, t.dictionary)) {
                var o = t.dictionary.subarray(-32768),
                    s = new a(o.length + e.length);
                s.set(o), s.set(e, o.length), e = s, i.w = o.length
            }
            return j(e, null == t.level ? 6 : t.level, null == t.mem ? i.l ? Math.ceil(1.5 * Math.max(8, Math.min(13, Math.log(e.length)))) : 20 : 12 + t.mem, r, n, i)
        },
        W = function(e, t) {
            var r = {};
            for (var n in e) r[n] = e[n];
            for (var n in t) r[n] = t[n];
            return r
        },
        $ = function(e, t, r) {
            for (var n = e(), a = e.toString(), i = a.slice(a.indexOf("[") + 1, a.lastIndexOf("]")).replace(/\s+/g, "").split(","), o = 0; o < n.length; ++o) {
                var s = n[o],
                    u = i[o];
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
        J = [],
        Z = function(e) {
            var t = [];
            for (var r in e) e[r].buffer && t.push((e[r] = new e[r].constructor(e[r])).buffer);
            return t
        },
        ee = function(e, t, r, a) {
            if (!J[r]) {
                for (var i = "", o = {}, s = e.length - 1, u = 0; u < s; ++u) i = $(e[u], i, o);
                J[r] = {
                    c: $(e[s], i, o),
                    e: o
                }
            }
            var c = W({}, J[r].e);
            return n(J[r].c + ";onmessage=function(e){for(var k in e.data)self[k]=e.data[k];onmessage=" + t.toString() + "}", r, c, Z(c), a)
        },
        et = function() {
            return [a, i, o, s, u, c, h, f, S, E, g, V, A, R, I, _, N, M, O, U, eT, ei, eo]
        },
        er = function() {
            return [a, i, o, s, u, c, m, y, w, D, T, C, g, F, K, A, P, k, B, x, H, G, Q, L, N, M, j, X, eC, ei]
        },
        en = function() {
            return [ep, ef]
        },
        ea = function() {
            return [ev]
        },
        ei = function(e) {
            return postMessage(e, [e.buffer])
        },
        eo = function(e) {
            return e && {
                out: e.size && new a(e.size),
                dictionary: e.dictionary
            }
        },
        es = function(e) {
            return e.ondata = function(e, t) {
                    return postMessage([e, t], [e.buffer])
                },
                function(t) {
                    t.data[0] ? (e.push(t.data[0], t.data[1]), postMessage([t.data[0].length])) : e.flush(t.data[1])
                }
        },
        eu = function(e, t, r, n, a, i, o) {
            var s, u = ee(e, n, a, function(e, r) {
                e ? (u.terminate(), t.ondata.call(t, e)) : Array.isArray(r) ? 1 == r.length ? (t.queuedSize -= r[0], t.ondrain && t.ondrain(r[0])) : (r[1] && u.terminate(), t.ondata.call(t, e, r[0], r[1])) : o(r)
            });
            u.postMessage(r), t.queuedSize = 0, t.push = function(e, r) {
                t.ondata || O(5), s && t.ondata(O(4, 0, 1), null, !!r), t.queuedSize += e.length, u.postMessage([e, s = r], e.buffer instanceof ArrayBuffer ? [e.buffer] : [])
            }, t.terminate = function() {
                u.terminate()
            }, i && (t.flush = function(e) {
                u.postMessage([0, e])
            })
        },
        ec = function(e, t) {
            return e[t] | e[t + 1] << 8
        },
        el = function(e, t) {
            return (e[t] | e[t + 1] << 8 | e[t + 2] << 16 | e[t + 3] << 24) >>> 0
        },
        ed = function(e, t) {
            return el(e, t) + 0x100000000 * el(e, t + 4)
        },
        eh = function(e, t, r) {
            for (; r; ++t) e[t] = r, r >>>= 8
        },
        em = function(e, t) {
            var r = t.filename;
            if (e[0] = 31, e[1] = 139, e[2] = 8, e[8] = t.level < 2 ? 4 : 2 * (9 == t.level), e[9] = 3, 0 != t.mtime && eh(e, 4, Math.floor(new Date(t.mtime || Date.now()) / 1e3)), r) {
                e[3] = 8;
                for (var n = 0; n <= r.length; ++n) e[n + 10] = r.charCodeAt(n)
            }
        },
        ep = function(e) {
            (31 != e[0] || 139 != e[1] || 8 != e[2]) && O(6, "invalid gzip data");
            var t = e[3],
                r = 10;
            4 & t && (r += (e[10] | e[11] << 8) + 2);
            for (var n = (t >> 3 & 1) + (t >> 4 & 1); n > 0; n -= !e[r++]);
            return r + (2 & t)
        },
        ef = function(e) {
            var t = e.length;
            return (e[t - 4] | e[t - 3] << 8 | e[t - 2] << 16 | e[t - 1] << 24) >>> 0
        },
        ey = function(e) {
            return 10 + (e.filename ? e.filename.length + 1 : 0)
        },
        eg = function(e, t) {
            var r = t.level;
            if (e[0] = 120, e[1] = (0 == r ? 0 : r < 6 ? 1 : 9 == r ? 3 : 2) << 6 | (t.dictionary && 32), e[1] |= 31 - (e[0] << 8 | e[1]) % 31, t.dictionary) {
                var n = q();
                n.p(t.dictionary), eh(e, 2, n.d())
            }
        },
        ev = function(e, t) {
            return ((15 & e[0]) != 8 || e[0] >> 4 > 7 || (e[0] << 8 | e[1]) % 31) && O(6, "invalid zlib data"), (e[1] >> 5 & 1) == +!t && O(6, "invalid zlib data: " + (32 & e[1] ? "need" : "unexpected") + " dictionary"), (e[1] >> 3 & 4) + 2
        };

    function eb(e, t) {
        return "function" == typeof e && (t = e, e = {}), this.ondata = t, e
    }
    var eA = function() {
            function e(e, t) {
                if ("function" == typeof e && (t = e, e = {}), this.ondata = t, this.o = e || {}, this.s = {
                        l: 0,
                        i: 32768,
                        w: 32768,
                        z: 32768
                    }, this.b = new a(98304), this.o.dictionary) {
                    var r = this.o.dictionary.subarray(-32768);
                    this.b.set(r, 32768 - r.length), this.s.i = 32768 - r.length
                }
            }
            return e.prototype.p = function(e, t) {
                this.ondata(X(e, this.o, 0, 0, this.s), t)
            }, e.prototype.push = function(e, t) {
                this.ondata || O(5), this.s.l && O(4);
                var r = e.length + this.s.z;
                if (r > this.b.length) {
                    if (r > 2 * this.b.length - 32768) {
                        var n = new a(-32768 & r);
                        n.set(this.b.subarray(0, this.s.z)), this.b = n
                    }
                    var i = this.b.length - this.s.z;
                    this.b.set(e.subarray(0, i), this.s.z), this.s.z = this.b.length, this.p(this.b, !1), this.b.set(this.b.subarray(-32768)), this.b.set(e.subarray(i), 32768), this.s.z = e.length - i + 32768, this.s.i = 32766, this.s.w = 32768
                } else this.b.set(e, this.s.z), this.s.z += e.length;
                this.s.l = 1 & t, (this.s.z > this.s.w + 8191 || t) && (this.p(this.b, t || !1), this.s.w = this.s.i, this.s.i -= 2), t && (this.s = this.o = {}, this.b = K)
            }, e.prototype.flush = function(e) {
                if (this.ondata || O(5), this.s.l && O(4), this.p(this.b, !1), this.s.w = this.s.i, this.s.i -= 2, e) {
                    var t = new a(6);
                    t[0] = this.s.r >> 3;
                    var r = Q(t, this.s.r, K);
                    this.s.r = 0, this.ondata(t.subarray(0, r >> 3), !1)
                }
            }, e
        }(),
        eD = function(e, t) {
            eu([er, function() {
                return [es, eA]
            }], this, eb.call(this, e, t), function(e) {
                onmessage = es(new eA(e.data))
            }, 6, 1)
        };

    function eC(e, t) {
        return X(e, t || {}, 0, 0)
    }
    var ew = function() {
            function e(e, t) {
                "function" == typeof e && (t = e, e = {}), this.ondata = t;
                var r = e && e.dictionary && e.dictionary.subarray(-32768);
                this.s = {
                    i: 0,
                    b: r ? r.length : 0
                }, this.o = new a(32768), this.p = new a(0), r && this.o.set(r)
            }
            return e.prototype.e = function(e) {
                if (this.ondata || O(5), this.d && O(4), this.p.length) {
                    if (e.length) {
                        var t = new a(this.p.length + e.length);
                        t.set(this.p), t.set(e, this.p.length), this.p = t
                    }
                } else this.p = e
            }, e.prototype.c = function(e) {
                this.s.i = +(this.d = e || !1);
                var t = this.s.b,
                    r = U(this.p, this.s, this.o);
                this.ondata(M(r, t, this.s.b), this.d), this.o = M(r, this.s.b - 32768), this.s.b = this.o.length, this.p = M(this.p, this.s.p / 8 | 0), this.s.p &= 7
            }, e.prototype.push = function(e, t) {
                this.e(e), this.c(t)
            }, e
        }(),
        eS = function(e, t) {
            eu([et, function() {
                return [es, ew]
            }], this, eb.call(this, e, t), function(e) {
                onmessage = es(new ew(e.data))
            }, 7, 0)
        };

    function eT(e, t) {
        return U(e, {
            i: 2
        }, t && t.out, t && t.dictionary)
    }(function() {
        function e(e, t) {
            this.c = Y(), this.l = 0, this.v = 1, eA.call(this, e, t)
        }
        e.prototype.push = function(e, t) {
            this.c.p(e), this.l += e.length, eA.prototype.push.call(this, e, t)
        }, e.prototype.p = function(e, t) {
            var r = X(e, this.o, this.v && ey(this.o), t && 8, this.s);
            this.v && (em(r, this.o), this.v = 0), t && (eh(r, r.length - 8, this.c.d()), eh(r, r.length - 4, this.l)), this.ondata(r, t)
        }, e.prototype.flush = function(e) {
            eA.prototype.flush.call(this, e)
        }
    })();
    var eE = function() {
            function e(e, t) {
                this.v = 1, this.r = 0, ew.call(this, e, t)
            }
            return e.prototype.push = function(e, t) {
                if (ew.prototype.e.call(this, e), this.r += e.length, this.v) {
                    var r = this.p.subarray(this.v - 1),
                        n = r.length > 3 ? ep(r) : 4;
                    if (n > r.length) {
                        if (!t) return
                    } else this.v > 1 && this.onmember && this.onmember(this.r - r.length);
                    this.p = r.subarray(n), this.v = 0
                }
                ew.prototype.c.call(this, 0), this.s.f && !this.s.l ? (this.v = N(this.s.p) + 9, this.s = {
                    i: 0
                }, this.o = new a(0), this.push(new a(0), t)) : t && ew.prototype.c.call(this, t)
            }, e
        }(),
        eR = function(e, t) {
            var r = this;
            eu([et, en, function() {
                return [es, ew, eE]
            }], this, eb.call(this, e, t), function(e) {
                var t = new eE(e.data);
                t.onmember = function(e) {
                    return postMessage(e)
                }, onmessage = es(t)
            }, 9, 0, function(e) {
                return r.onmember && r.onmember(e)
            })
        },
        eI = (function() {
            function e(e, t) {
                this.c = q(), this.v = 1, eA.call(this, e, t)
            }
            e.prototype.push = function(e, t) {
                this.c.p(e), eA.prototype.push.call(this, e, t)
            }, e.prototype.p = function(e, t) {
                var r = X(e, this.o, this.v && (this.o.dictionary ? 6 : 2), t && 4, this.s);
                this.v && (eg(r, this.o), this.v = 0), t && eh(r, r.length - 4, this.c.d()), this.ondata(r, t)
            }, e.prototype.flush = function(e) {
                eA.prototype.flush.call(this, e)
            }
        }(), function() {
            function e(e, t) {
                ew.call(this, e, t), this.v = e && e.dictionary ? 2 : 1
            }
            return e.prototype.push = function(e, t) {
                if (ew.prototype.e.call(this, e), this.v) {
                    if (this.p.length < 6 && !t) return;
                    this.p = this.p.subarray(ev(this.p, this.v - 1)), this.v = 0
                }
                t && (this.p.length < 4 && O(6, "invalid zlib data"), this.p = this.p.subarray(0, -4)), ew.prototype.c.call(this, t)
            }, e
        }()),
        e_ = function(e, t) {
            eu([et, ea, function() {
                return [es, ew, eI]
            }], this, eb.call(this, e, t), function(e) {
                onmessage = es(new eI(e.data))
            }, 11, 0)
        },
        eN = function() {
            function e(e, t) {
                this.o = eb.call(this, e, t) || {}, this.G = eE, this.I = ew, this.Z = eI
            }
            return e.prototype.i = function() {
                var e = this;
                this.s.ondata = function(t, r) {
                    e.ondata(t, r)
                }
            }, e.prototype.push = function(e, t) {
                if (this.ondata || O(5), this.s) this.s.push(e, t);
                else {
                    if (this.p && this.p.length) {
                        var r = new a(this.p.length + e.length);
                        r.set(this.p), r.set(e, this.p.length)
                    } else this.p = e;
                    this.p.length > 2 && (this.s = 31 == this.p[0] && 139 == this.p[1] && 8 == this.p[2] ? new this.G(this.o) : (15 & this.p[0]) != 8 || this.p[0] >> 4 > 7 || (this.p[0] << 8 | this.p[1]) % 31 ? new this.I(this.o) : new this.Z(this.o), this.i(), this.s.push(this.p, t), this.p = null)
                }
            }, e
        }();

    function eM(e, t) {
        eN.call(this, e, t), this.queuedSize = 0, this.G = eR, this.I = eS, this.Z = e_
    }
    eM.prototype.i = function() {
        var e = this;
        this.s.ondata = function(t, r, n) {
            e.ondata(t, r, n)
        }, this.s.ondrain = function(t) {
            e.queuedSize -= t, e.ondrain && e.ondrain(t)
        }
    }, eM.prototype.push = function(e, t) {
        this.queuedSize += e.length, eN.prototype.push.call(this, e, t)
    };
    var eV = "u" > typeof TextEncoder && new TextEncoder,
        eO = "u" > typeof TextDecoder && new TextDecoder,
        eU = 0;
    try {
        eO.decode(K, {
            stream: !0
        }), eU = 1
    } catch (e) {}
    var eP = function(e) {
        for (var t = "", r = 0;;) {
            var n = e[r++],
                a = (n > 127) + (n > 223) + (n > 239);
            if (r + a > e.length) return {
                s: t,
                r: M(e, r - 1)
            };
            a ? 3 == a ? t += String.fromCharCode(55296 | (n = ((15 & n) << 18 | (63 & e[r++]) << 12 | (63 & e[r++]) << 6 | 63 & e[r++]) - 65536) >> 10, 56320 | 1023 & n) : 1 & a ? t += String.fromCharCode((31 & n) << 6 | 63 & e[r++]) : t += String.fromCharCode((15 & n) << 12 | (63 & e[r++]) << 6 | 63 & e[r++]) : t += String.fromCharCode(n)
        }
    };

    function ek(e, t) {
        if (t) {
            for (var r = new a(e.length), n = 0; n < e.length; ++n) r[n] = e.charCodeAt(n);
            return r
        }
        if (eV) return eV.encode(e);
        for (var i = e.length, o = new a(e.length + (e.length >> 1)), s = 0, u = function(e) {
                o[s++] = e
            }, n = 0; n < i; ++n) {
            if (s + 5 > o.length) {
                var c = new a(s + 8 + (i - n << 1));
                c.set(o), o = c
            }
            var l = e.charCodeAt(n);
            l < 128 || t ? u(l) : (l < 2048 ? u(192 | l >> 6) : (l > 55295 && l < 57344 ? (u(240 | (l = 65536 + (1047552 & l) | 1023 & e.charCodeAt(++n)) >> 18), u(128 | l >> 12 & 63)) : u(224 | l >> 12), u(128 | l >> 6 & 63)), u(128 | 63 & l))
        }
        return M(o, 0, s)
    }

    function eB(e, t) {
        if (t) {
            for (var r = "", n = 0; n < e.length; n += 16384) r += String.fromCharCode.apply(null, e.subarray(n, n + 16384));
            return r
        }
        if (eO) return eO.decode(e);
        var a = eP(e),
            i = a.s,
            r = a.r;
        return r.length && O(8), i
    }(function(e) {
        this.ondata = e, eU ? this.t = new TextDecoder : this.p = K
    }).prototype.push = function(e, t) {
        if (this.ondata || O(5), t = !!t, this.t) {
            this.ondata(this.t.decode(e, {
                stream: !0
            }), t), t && (this.t.decode().length && O(8), this.t = null);
            return
        }
        this.p || O(4);
        var r = new a(this.p.length + e.length);
        r.set(this.p), r.set(e, this.p.length);
        var n = eP(r),
            i = n.s,
            o = n.r;
        t ? (o.length && O(8), this.p = null) : this.p = o, this.ondata(i, t)
    }, (function(e) {
        this.ondata = e
    }).prototype.push = function(e, t) {
        this.ondata || O(5), this.d && O(4), this.ondata(ek(e), this.d = t || !1)
    };
    var ex = function(e) {
            return 1 == e ? 3 : e < 6 ? 2 : +(9 == e)
        },
        eH = function(e, t, r, n, a, i, o) {
            var s = 0xffffffff == a,
                u = 0xffffffff == i,
                c = 0xffffffff == o,
                l = t + r;
            if (n && s + u + c) {
                for (; t + 4 < l; t += 4 + ec(e, t + 2))
                    if (1 == ec(e, t)) return [s ? ed(e, t + 4 + 8 * u) : a, u ? ed(e, t + 4) : i, c ? ed(e, t + 4 + 8 * (u + s)) : o, 1];
                n < 2 && O(13)
            }
            return [a, i, o, 0]
        },
        eG = function(e) {
            var t = 0;
            if (e)
                for (var r in e) {
                    var n = e[r].length;
                    n > 65535 && O(9), t += n + 4
                }
            return t
        },
        eQ = function(e, t, r, n, a, i, o, s) {
            var u = n.length,
                c = r.extra,
                l = s && s.length,
                d = eG(c);
            eh(e, t, null != o ? 0x2014b50 : 0x4034b50), t += 4, null != o && (e[t++] = 20, e[t++] = r.os), e[t] = 20, t += 2, e[t++] = r.flag << 1 | (i < 0 && 8), e[t++] = a && 8, e[t++] = 255 & r.compression, e[t++] = r.compression >> 8;
            var h = new Date(null == r.mtime ? Date.now() : r.mtime),
                m = h.getFullYear() - 1980;
            if ((m < 0 || m > 119) && O(10), eh(e, t, m << 25 | h.getMonth() + 1 << 21 | h.getDate() << 16 | h.getHours() << 11 | h.getMinutes() << 5 | h.getSeconds() >> 1), t += 4, -1 != i && (eh(e, t, r.crc), eh(e, t + 4, i < 0 ? -i - 2 : i), eh(e, t + 8, r.size)), eh(e, t + 12, u), eh(e, t + 14, d), t += 16, null != o && (eh(e, t, l), eh(e, t + 6, r.attrs), eh(e, t + 10, o), t += 14), e.set(n, t), t += u, d)
                for (var p in c) {
                    var f = c[p],
                        y = f.length;
                    eh(e, t, +p), eh(e, t + 2, y), e.set(f, t + 4), t += 4 + y
                }
            return l && (e.set(s, t), t += l), t
        },
        eL = function(e, t, r, n, a) {
            eh(e, t, 0x6054b50), eh(e, t + 8, r), eh(e, t + 10, r), eh(e, t + 12, n), eh(e, t + 16, a)
        },
        eF = function() {
            function e(e) {
                this.filename = e, this.c = Y(), this.size = 0, this.compression = 0
            }
            return e.prototype.process = function(e, t) {
                this.ondata(null, e, t)
            }, e.prototype.push = function(e, t) {
                this.ondata || O(5), this.c.p(e), this.size += e.length, t && (this.crc = this.c.d()), this.process(e, t || !1)
            }, e
        }();

    function eK(e, t) {
        var r = this;
        t || (t = {}), eF.call(this, e), this.d = new eA(t, function(e, t) {
            r.ondata(null, e, t)
        }), this.compression = 8, this.flag = ex(t.level)
    }

    function ej(e, t) {
        var r = this;
        t || (t = {}), eF.call(this, e), this.d = new eD(t, function(e, t, n) {
            r.ondata(e, t, n)
        }), this.compression = 8, this.flag = ex(t.level), this.terminate = this.d.terminate
    }

    function ez(e) {
        this.ondata = e, this.u = [], this.d = 1
    }
    eK.prototype.process = function(e, t) {
        try {
            this.d.push(e, t)
        } catch (e) {
            this.ondata(e, null, t)
        }
    }, eK.prototype.push = function(e, t) {
        eF.prototype.push.call(this, e, t)
    }, ej.prototype.process = function(e, t) {
        this.d.push(e, t)
    }, ej.prototype.push = function(e, t) {
        eF.prototype.push.call(this, e, t)
    }, ez.prototype.add = function(e) {
        var t = this;
        if (this.ondata || O(5), 2 & this.d) this.ondata(O(4 + (1 & this.d) * 8, 0, 1), null, !1);
        else {
            var r = ek(e.filename),
                n = r.length,
                i = e.comment,
                o = i && ek(i),
                s = n != e.filename.length || o && i.length != o.length,
                u = n + eG(e.extra) + 30;
            n > 65535 && this.ondata(O(11, 0, 1), null, !1);
            var c = new a(u);
            eQ(c, 0, e, r, s, -1);
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
                p = W(e, {
                    f: r,
                    u: s,
                    o: o,
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
            e.ondata = function(r, n, i) {
                if (r) t.ondata(r, n, i), t.terminate();
                else if (f += n.length, l.push(n), i) {
                    var o = new a(16);
                    eh(o, 0, 0x8074b50), eh(o, 4, e.crc), eh(o, 8, f), eh(o, 12, e.size), l.push(o), p.c = f, p.b = u + f + 16, p.crc = e.crc, p.size = e.size, h && p.r(), h = 1
                } else h && d()
            }, this.u.push(p)
        }
    }, ez.prototype.end = function() {
        var e = this;
        2 & this.d ? this.ondata(O(4 + (1 & this.d) * 8, 0, 1), null, !0) : (this.d ? this.e() : this.u.push({
            r: function() {
                1 & e.d && (e.u.splice(-1, 1), e.e())
            },
            t: function() {}
        }), this.d = 3)
    }, ez.prototype.e = function() {
        for (var e = 0, t = 0, r = 0, n = 0, i = this.u; n < i.length; n++) {
            var o = i[n];
            r += 46 + o.f.length + eG(o.extra) + (o.o ? o.o.length : 0)
        }
        for (var s = new a(r + 22), u = 0, c = this.u; u < c.length; u++) {
            var o = c[u];
            eQ(s, e, o, o.f, o.u, -o.c - 2, t, o.o), e += 46 + o.f.length + eG(o.extra) + (o.o ? o.o.length : 0), t += o.b
        }
        eL(s, e, this.u.length, r, t), this.ondata(null, s, !0), this.d = 2
    }, ez.prototype.terminate = function() {
        for (var e = 0, t = this.u; e < t.length; e++) t[e].t();
        this.d = 2
    };
    var eY = function() {
        function e() {}
        return e.prototype.push = function(e, t) {
            this.ondata(null, e, t)
        }, e.compression = 0, e
    }();

    function eq() {
        var e = this;
        this.i = new ew(function(t, r) {
            e.ondata(null, t, r)
        })
    }

    function eX(e, t) {
        var r = this;
        t < 32e4 ? this.i = new ew(function(e, t) {
            r.ondata(null, e, t)
        }) : (this.i = new eS(function(e, t, n) {
            r.ondata(e, t, n)
        }), this.terminate = this.i.terminate)
    }

    function eW(e) {
        this.onfile = e, this.k = [], this.o = {
            0: eY
        }, this.p = K
    }
    eq.prototype.push = function(e, t) {
        try {
            this.i.push(e, t)
        } catch (e) {
            this.ondata(e, null, t)
        }
    }, eq.compression = 8, eX.prototype.push = function(e, t) {
        this.i.terminate && (e = M(e, 0)), this.i.push(e, t)
    }, eX.compression = 8, eW.prototype.push = function(e, t) {
        var r = this;
        if (this.onfile || O(5), this.p || O(4), this.c > 0) {
            var n = Math.min(this.c, e.length),
                i = e.subarray(0, n);
            if (this.c -= n, this.d ? this.d.push(i, !this.c) : this.k[0].push(i), (e = e.subarray(n)).length) return this.push(e, t)
        } else {
            var o = 0,
                s = 0,
                u = void 0,
                c = void 0;
            this.p.length ? e.length ? ((c = new a(this.p.length + e.length)).set(this.p), c.set(e, this.p.length)) : c = this.p : c = e;
            for (var l = c.length, d = this.c, h = d && this.d, m = this; s < l - 4 && "break" !== function() {
                    var e = el(c, s);
                    if (0x4034b50 == e) {
                        o = 1, u = s, m.d = null, m.c = 0;
                        var t = ec(c, s + 6),
                            n = ec(c, s + 8),
                            a = ec(c, s + 26),
                            i = ec(c, s + 28);
                        if (l > s + 30 + a + i) {
                            var h, p = [];
                            m.k.unshift(p), o = 2;
                            var f = el(c, s + 18),
                                y = el(c, s + 22),
                                g = eB(c.subarray(s + 30, s += 30 + a), !(2048 & t)),
                                v = eH(c, s, i, 2, f, y, 0),
                                b = v[0],
                                A = v[1],
                                D = v[3];
                            8 & t && (b = -1 - D), s += i, m.c = b;
                            var C = {
                                name: g,
                                compression: n,
                                start: function() {
                                    if (C.ondata || O(5), b) {
                                        var e = r.o[n];
                                        e || C.ondata(O(14, "unknown compression type " + n, 1), null, !1), (h = b < 0 ? new e(g) : new e(g, b, A)).ondata = function(e, t, r) {
                                            C.ondata(e, t, r)
                                        };
                                        for (var t = 0; t < p.length; t++) {
                                            var a = p[t];
                                            h.push(a, !1)
                                        }
                                        r.k[0] == p && r.c ? r.d = h : h.push(K, !0)
                                    } else C.ondata(null, K, !0)
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
                        if (0x8074b50 == e) return u = s += 12 + (-2 == d && 8), o = 3, m.c = 0, "break";
                        else if (0x2014b50 == e) return u = s -= 4, o = 3, m.c = 0, "break"
                    }
                }(); ++s);
            if (this.p = K, d < 0) {
                var p = o ? c.subarray(0, u - 12 - (-2 == d && 8) - (0x8074b50 == el(c, u - 16) && 4)) : c.subarray(0, s);
                h ? h.push(p, !!o) : this.k[+(2 == o)].push(p)
            }
            if (2 & o) return this.push(c.subarray(s), t);
            this.p = c.subarray(s)
        }
        t && (this.c && O(13), this.p = null)
    }, eW.prototype.register = function(e) {
        this.o[e.compression] = e
    }, "function" == typeof queueMicrotask && queueMicrotask;
    var e$ = e.i(31611),
        eJ = e.i(739167),
        eZ = e.i(847579),
        e0 = e.i(927868),
        e1 = e.i(908374),
        e2 = e.i(973005),
        e3 = e.i(11517),
        e5 = eZ;
    e.s(["RAQIV2FilterOperation", () => e5.AnalyticsQueryGatewayAPIFilterOperation], 595028);
    var e5 = eZ,
        e8 = e.i(721281);
    class e6 extends Error {
        constructor(e, t, r, n) {
            super(null != n ? n : "unsupported-version" === e ? "Document version ".concat(t, " is not supported; target version ").concat(r, ".") : "No migration path from version ".concat(t, " to version ").concat(r, ".")), (0, e8._)(this, "kind", void 0), (0, e8._)(this, "fromVersion", void 0), (0, e8._)(this, "targetVersion", void 0), this.name = "VersionedMigrationError", this.kind = e, this.fromVersion = t, this.targetVersion = r
        }
    }
    let e4 = (e, t) => new e6("unsupported-version", e, t),
        e7 = (e, t, r) => new e6("migration-gap", e, t, r),
        e9 = e => !!e && "object" == typeof e && !Array.isArray(e),
        te = e => {
            if (!e9(e)) return 2;
            let {
                v: t
            } = e;
            return void 0 === t ? 1 : "number" == typeof t ? t : 3
        },
        tt = (e, t) => e9(e) ? {
            ...e,
            v: t
        } : e,
        tr = e => {
            let t, r;
            if (!e9(e)) return e;
            let n = e.f;
            if (!Array.isArray(n)) return e;
            let {
                customEventName: a,
                realFilters: i
            } = (r = n.filter(e => {
                var r, n;
                let a, i;
                return !(e9(r = e) && r.dimension === e$.RAQIV2Dimension.CustomEventName && Array.isArray(a = r.values) && a.every(e => "string" == typeof e) && (void 0 === r.operation || ("string" == typeof(i = n = r.operation) || "number" == typeof i) && (0, e0.isValidEnumValue)(e5.AnalyticsQueryGatewayAPIFilterOperation, n) && n !== e5.AnalyticsQueryGatewayAPIFilterOperation.Invalid)) || (null != t || (t = e.values[0]), !1)
            }), {
                customEventName: t,
                realFilters: r.length > 0 ? r : void 0
            });
            return {
                ...e,
                ...i ? {
                    f: i
                } : {
                    f: void 0
                },
                ...void 0 === e.c && a ? {
                    c: a
                } : {}
            }
        },
        tn = [{
            fromVersion: 1,
            toVersion: 2,
            description: "Lift CustomEventName filters into source identity",
            migrate: e => e9(e) && Array.isArray(e.s) ? {
                ...e,
                s: e.s.map(tr)
            } : e
        }],
        ta = "cm2.",
        ti = e => "string" == typeof e && e.trim().length > 0,
        to = e => ti(e) && (0, e1.isNumericUIMetric)(e),
        ts = e => "string" == typeof e || "number" == typeof e,
        tu = e => {
            let t = (0, e3.getUIMetricFromAtomicMetricLike)(e.metric);
            if (!to(t)) return (0, eJ.default)('Cannot serialize non-numeric computed metric source "'.concat(String(t), '".')), null;
            let r = {
                k: e.key,
                m: t
            };
            e.filters && e.filters.length > 0 && (r.f = [...e.filters]), (0, e3.isCustomEventsAtomicMetricLike)(e.metric) && (r.c = e.metric.customEventName);
            let n = ((e, t) => {
                if (!e && !t) return;
                let r = {};
                if (null != t ? t : null == e ? void 0 : e.aggregationType) {
                    var n;
                    r.a = null != (n = null != t ? t : null == e ? void 0 : e.aggregationType) ? n : void 0
                }
                return (null == e ? void 0 : e.percentile) && (r.p = e.percentile), Object.keys(r).length > 0 ? r : void 0
            })(e.pseudoDimensionValues, (0, e3.isCustomEventsAtomicMetricLike)(e.metric) ? e.metric.aggregationType : void 0);
            return n && (r.p = n), r
        },
        tc = e => {
            let t, r = (e => {
                var t, r;
                if (e && (void 0 !== e.a || void 0 !== e.p)) return {
                    aggregationType: null != (t = e.a) ? t : null,
                    percentile: null != (r = e.p) ? r : null
                }
            })(e.p);
            if (e.m === e$.RAQIV2UIMetric.CustomEventsV2) {
                var n;
                let r = e.c;
                if (!r) return null;
                t = {
                    metric: e.m,
                    customEventName: r,
                    ...(null == (n = e.p) ? void 0 : n.a) ? {
                        aggregationType: e.p.a
                    } : {}
                }
            } else t = e.m;
            return {
                key: e.k,
                metric: t,
                filters: e.f,
                ...r && r.percentile ? {
                    pseudoDimensionValues: {
                        aggregationType: null,
                        percentile: r.percentile
                    }
                } : {}
            }
        };
    e.s(["deserializeComputedMetricFromQueryParam", 0, e => {
        if (!e || e.length > 4096 || !e.startsWith(ta)) return null;
        let r = (e => {
            let r = (e => {
                if (!ti(e) || !/^[A-Za-z0-9_-]+$/u.test(e)) return null;
                let r = e.replaceAll("-", "+").replaceAll("_", "/"),
                    n = "".concat(r).concat("=".repeat((4 - r.length % 4) % 4));
                try {
                    if (void 0 !== t.Buffer) return new Uint8Array(t.Buffer.from(n, "base64"));
                    let e = atob(n),
                        r = new Uint8Array(e.length);
                    for (let t = 0; t < e.length; t += 1) r[t] = e.charCodeAt(t);
                    return r
                } catch (e) {
                    return null
                }
            })(e);
            if (!r) return null;
            try {
                let e = eB(eT(r));
                if (e.length > 4096) return null;
                return e
            } catch (e) {
                return null
            }
        })(e.slice(ta.length));
        if (!r) return null;
        let n = (e => {
            try {
                return JSON.parse(e)
            } catch (e) {
                return null
            }
        })(r);
        if (null === n) return null;
        let a = (e => {
            try {
                return (e => {
                    let {
                        document: t,
                        registry: r,
                        targetVersion: n,
                        getVersion: a,
                        setVersion: i,
                        createUnsupportedVersionError: o = e4,
                        createMigrationGapError: s = e7
                    } = e, u = t, c = a(t);
                    if (c > n) throw o(c, n);
                    let l = c,
                        d = r.length + 1,
                        h = 0;
                    for (; l < n && h < d;) {
                        let e = l,
                            t = r.find(t => t.fromVersion === e);
                        if (!t) throw s(e, n);
                        let o = t.migrate(u),
                            c = a(o);
                        if (c !== e && c !== t.toVersion) throw s(e, n, "Migration step ".concat(e, " -> ").concat(t.toVersion, " produced version ").concat(c, "."));
                        u = i(o, t.toVersion), l = t.toVersion, h += 1
                    }
                    if (l !== n) throw s(l, n, "Migration pipeline did not converge after ".concat(h, " steps (stopped at version ").concat(l, ")."));
                    return i(u, n)
                })({
                    document: e,
                    registry: tn,
                    targetVersion: 2,
                    getVersion: te,
                    setVersion: tt
                })
            } catch (e) {
                return null
            }
        })(n);
        if (!(a && "object" == typeof a && 2 === a.v && Array.isArray(a.s) && 0 !== a.s.length && ti(a.f) && (void 0 === a.n || "string" == typeof a.n) && a.s.every(e => {
                var t, r;
                let n;
                return !(!(t = e) || "object" != typeof t || Array.isArray(t)) && !!ti(t.k) && !!to(t.m) && (void 0 === t.f || !!(Array.isArray(n = t.f) && n.every(e => (e => {
                    if (!e || "object" != typeof e) return !1;
                    let {
                        dimension: t,
                        values: r,
                        operation: n
                    } = e;
                    return !(!ts(t) || !(0, e0.isValidEnumValue)(e$.RAQIV2Dimension, t) || (0, e2.default)(t)) && t !== e$.RAQIV2Dimension.CustomEventName && Array.isArray(r) && r.every(e => "string" == typeof e) && (void 0 === n || ts(n) && (0, e0.isValidEnumValue)(eZ.AnalyticsQueryGatewayAPIFilterOperation, n) && n !== eZ.AnalyticsQueryGatewayAPIFilterOperation.Invalid)
                })(e)))) && (void 0 === t.c || !!ti(t.c)) && (void 0 === t.p || !!((r = t.p) && "object" == typeof r && (void 0 === r.a || ts(r.a) && (0, e0.isValidEnumValue)(e$.RAQIV2AggregationType, r.a)) && (void 0 === r.p || ts(r.p) && (0, e0.isValidEnumValue)(e$.RAQIV2PercentileType, r.p)) && 1))
            }))) return null;
        let [i, ...o] = a.s, s = tc(i), u = [];
        for (let e of o) {
            let t = tc(e);
            if (!t) return null;
            u.push(t)
        }
        return s ? {
            sources: [s, ...u],
            formula: a.f,
            name: ti(a.n) ? a.n : void 0,
            l7Smoothing: 1 === a.l
        } : null
    }, "serializeComputedMetricToQueryParam", 0, e => {
        let t = [];
        for (let r of e.sources) {
            let e = tu(r);
            if (!e) return null;
            t.push(e)
        }
        let r = {
            v: 2,
            s: t,
            f: e.formula,
            n: ti(e.name) ? e.name.trim() : void 0,
            l: e.l7Smoothing ? 1 : void 0
        };
        return "".concat(ta).concat((e => {
            let t = "";
            for (let r = 0; r < e.length; r += 32768) t += String.fromCharCode(...e.subarray(r, r + 32768));
            return btoa(t).replaceAll("+", "-").replaceAll("/", "_").replace(/=+$/u, "")
        })(eC(ek(JSON.stringify(r)))))
    }], 545154)
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
    e.s(["DETAIL_STALE_TIME_MS", 0, 3e4, "LIST_STALE_TIME_MS", 0, 3e4, "customDashboardQueryKeys", 0, {
        universe: e => ["custom-dashboards", "universe", e],
        list: (e, t) => {
            var r, n;
            let a = ["custom-dashboards", "universe", e, "list"];
            return t ? [...a, null != (r = t.pageSize) ? r : null, null != (n = t.pageToken) ? n : null] : a
        },
        detail: (e, t) => ["custom-dashboards", "universe", e, "detail", t],
        suggestedName: e => ["custom-dashboards", "universe", e, "suggested-name"]
    }])
}, 650040, 379843, 318727, 413311, e => {
    "use strict";
    var t = e.i(531007);
    let r = [t.ChartType.Spline, t.ChartType.Area, t.ChartType.Bar, t.ChartType.Column, t.ChartType.Pie, t.ChartType.Table],
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

    function i(e) {
        return e.tiles
    }

    function o(e) {
        return e.columnCount
    }
    e.s(["CUSTOM_DASHBOARD_CHART_TYPES", 0, r, "CUSTOM_DASHBOARD_CURRENT_SCHEMA_VERSION", 0, 1, "CustomDashboardSummaryCardAggregation", 0, {
        AverageOverTimePeriod: "AverageOverTimePeriod",
        AveragePerUniqueUser: "AveragePerUniqueUser",
        MostRecentDataPoint: "MostRecentDataPoint",
        Total: "Total",
        Median: "Median",
        Cumulative: "Cumulative"
    }, "DEFAULT_CHART_GRANULARITY", 0, "Day", "DashboardPageMode", 0, n, "EMPTY_DASHBOARD_CONFIG", 0, a, "LOCAL_DASHBOARD_LIST_CAPABILITIES", 0, {
        limits: {
            maxDashboardsPerUniverse: 16
        }
    }, "MAX_CHART_TILES_PER_DASHBOARD", 0, 12, "MAX_DASHBOARDS_PER_UNIVERSE", 0, 16, "MAX_DASHBOARD_DESCRIPTION_LENGTH", 0, 280, "MAX_DASHBOARD_NAME_LENGTH", 0, 80, "MAX_PINNED_DASHBOARDS", 0, 5, "MAX_SUMMARY_CARDS_PER_DASHBOARD", 0, 6, "MAX_TILES_PER_ROW", 0, 2, "MAX_TILE_TITLE_LENGTH", 0, 80, "SummaryCardTitleSource", 0, {
        Auto: "Auto",
        Custom: "Custom"
    }], 379843), e.s(["getChartRowColumnCount", 0, o, "getChartRowTiles", 0, i, "halfWidthRow", 0, function(e) {
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
    let s = "chart-empty-slot:",
        u = e => "Component" === e.type && "Chart" === e.component.type ? e.component.chart : null;

    function c(e) {
        return e.flatMap(e => {
            let t;
            if ("Component" === e.type) {
                let t = u(e);
                return t ? [{
                    columnCount: 1,
                    tiles: [t]
                }] : []
            }
            let r = (t = e.children.map(u)).length > 0 && t.every(e => null !== e) ? t.filter(e => null !== e) : null;
            if (r) return function(e, t) {
                if (0 === e.length) return [];
                let r = 1 === t ? 1 : 2;
                if (1 === r) return e.map(e => ({
                    columnCount: r,
                    tiles: [e]
                }));
                let n = [];
                for (let t = 0; t < e.length; t += 2) n.push({
                    columnCount: r,
                    tiles: e.slice(t, t + 2)
                });
                return n
            }(r, "Grid" === e.type ? 1 === e.columnCount ? 1 : 2 : r.length > 1 ? 2 : 1);
            return c(e.children)
        })
    }
    e.s(["getEmptyChartSlotTarget", 0, e => {
        if (!(null == e ? void 0 : e.startsWith(s))) return null;
        let t = Number.parseInt(e.slice(s.length), 10);
        return Number.isInteger(t) && t >= 0 ? {
            rowIndex: t
        } : null
    }, "selectChartPlacements", 0, function(e) {
        let t = [],
            r = 0;
        return e.forEach((e, n) => {
            let a = i(e),
                u = o(e),
                c = 1 === u ? 2 : 1;
            (a.forEach((e, a) => {
                t.push({
                    kind: "tile",
                    tileId: e.tileId,
                    tile: e,
                    rowIndex: n,
                    itemIndex: a,
                    order: r,
                    columnSpan: c
                }), r += 1
            }), !(u <= a.length)) && (t.push({
                kind: "empty-slot",
                emptySlotId: "".concat(s).concat(n),
                rowIndex: n,
                order: r,
                columnSpan: 1
            }), r += 1)
        }), t
    }, "selectChartRowsFromLayoutNodes", 0, c], 413311);
    let l = [];

    function d(e) {
        return e.page.surface
    }

    function h(e, t) {
        return {
            ...e,
            page: {
                mode: n.Untabbed,
                surface: t
            }
        }
    }

    function m(e) {
        return {
            type: "Component",
            component: {
                type: "Chart",
                chart: e
            }
        }
    }

    function p(e) {
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
            children: e.map(p)
        }
    }

    function y(e) {
        return {
            type: "Grid",
            columnCount: e.columnCount,
            children: e.tiles.map(m)
        }
    }

    function g(e) {
        let t = "Component" === e.type ? e.component : null;
        return (null == t ? void 0 : t.type) === "SummaryCard" ? t.summaryCard : null
    }

    function v(e) {
        return ("Flex" === e.type || "Grid" === e.type) && e.children.length > 0 && e.children.every(e => null !== g(e))
    }

    function b(e) {
        return d(e).bodyNodes.flatMap(e => {
            if (v(e) && ("Flex" === e.type || "Grid" === e.type)) return e.children.map(g).filter(e => null !== e);
            let t = g(e);
            return t ? [t] : []
        })
    }
    e.s(["getChartRows", 0, function(e) {
        return c(d(e).bodyNodes.filter(e => !v(e)))
    }, "getDashboardSurface", 0, d, "getSummaryCards", 0, b, "withChartRows", 0, function(e, t) {
        let r = d(e),
            n = b(e);
        return h(e, {
            ...r,
            bodyNodes: [...n.length > 0 ? [f(n)] : l, ...t.map(y)]
        })
    }, "withDashboardSurface", 0, h, "withSummaryCards", 0, function(e, t) {
        let r = d(e);
        return h(e, {
            ...r,
            bodyNodes: [...t.length > 0 ? [f(t)] : l, ...d(e).bodyNodes.filter(e => !v(e) && null === g(e))]
        })
    }], 650040)
}, 479236, 743209, 322172, e => {
    "use strict";
    var t = e.i(221628),
        r = e.i(416340),
        n = e.i(237401),
        a = e.i(692734),
        i = e.i(118413),
        o = e.i(834046),
        s = e.i(759283),
        u = e.i(283561),
        c = e.i(721281),
        l = e.i(379843),
        d = e.i(296150),
        h = e.i(436025),
        m = e.i(593431),
        p = e.i(10560),
        f = e.i(852209),
        y = e.i(482922),
        g = e.i(31611),
        v = e.i(531007),
        b = e.i(11517),
        A = e.i(302610),
        D = e.i(787202),
        C = e.i(646877);
    let w = {
            [v.ChartType.Spline]: 1,
            [v.ChartType.Area]: 2,
            [v.ChartType.Bar]: 3,
            [v.ChartType.Column]: 4,
            [v.ChartType.Pie]: 5,
            [v.ChartType.Table]: 6
        },
        S = {
            DASHBOARD_CHART_TYPE_SPLINE: v.ChartType.Spline,
            DASHBOARD_CHART_TYPE_AREA: v.ChartType.Area,
            DASHBOARD_CHART_TYPE_BAR: v.ChartType.Bar,
            DASHBOARD_CHART_TYPE_COLUMN: v.ChartType.Column,
            DASHBOARD_CHART_TYPE_PIE: v.ChartType.Pie,
            DASHBOARD_CHART_TYPE_TABLE: v.ChartType.Table,
            1: v.ChartType.Spline,
            2: v.ChartType.Area,
            3: v.ChartType.Bar,
            4: v.ChartType.Column,
            5: v.ChartType.Pie,
            6: v.ChartType.Table
        },
        T = {
            Cumulative: 1,
            Minute: 2,
            HalfHour: 3,
            Hour: 4,
            Day: 5,
            Week: 6
        },
        E = {
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
        R = {
            [g.RAQIV2MetricGranularity.None]: 1,
            [g.RAQIV2MetricGranularity.OneMinute]: 2,
            [g.RAQIV2MetricGranularity.HalfHour]: 3,
            [g.RAQIV2MetricGranularity.OneHour]: 4,
            [g.RAQIV2MetricGranularity.OneDay]: 5,
            [g.RAQIV2MetricGranularity.OneWeek]: 6
        },
        I = {
            DASHBOARD_GRANULARITY_CUMULATIVE: g.RAQIV2MetricGranularity.None,
            DASHBOARD_GRANULARITY_MINUTE: g.RAQIV2MetricGranularity.OneMinute,
            DASHBOARD_GRANULARITY_HALF_HOUR: g.RAQIV2MetricGranularity.HalfHour,
            DASHBOARD_GRANULARITY_HOUR: g.RAQIV2MetricGranularity.OneHour,
            DASHBOARD_GRANULARITY_DAY: g.RAQIV2MetricGranularity.OneDay,
            DASHBOARD_GRANULARITY_WEEK: g.RAQIV2MetricGranularity.OneWeek,
            1: g.RAQIV2MetricGranularity.None,
            2: g.RAQIV2MetricGranularity.OneMinute,
            3: g.RAQIV2MetricGranularity.HalfHour,
            4: g.RAQIV2MetricGranularity.OneHour,
            5: g.RAQIV2MetricGranularity.OneDay,
            6: g.RAQIV2MetricGranularity.OneWeek
        },
        _ = {
            [g.RAQIV2AggregationType.Sum]: 1,
            [g.RAQIV2AggregationType.Count]: 2,
            [g.RAQIV2AggregationType.Average]: 3,
            [g.RAQIV2AggregationType.Min]: 4,
            [g.RAQIV2AggregationType.Max]: 5,
            [g.RAQIV2AggregationType.CountUser]: 7,
            [g.RAQIV2AggregationType.AveragePerUser]: 25,
            [g.RAQIV2PercentileType.AVG]: 10,
            [g.RAQIV2PercentileType.P10]: 11,
            [g.RAQIV2PercentileType.P50]: 12,
            [g.RAQIV2PercentileType.P90]: 13,
            [l.CustomDashboardSummaryCardAggregation.Total]: 20,
            [l.CustomDashboardSummaryCardAggregation.AverageOverTimePeriod]: 21,
            [l.CustomDashboardSummaryCardAggregation.MostRecentDataPoint]: 22,
            [l.CustomDashboardSummaryCardAggregation.Median]: 23,
            [l.CustomDashboardSummaryCardAggregation.Cumulative]: 24,
            [l.CustomDashboardSummaryCardAggregation.AveragePerUniqueUser]: 25
        },
        N = {
            DASHBOARD_AGGREGATION_SUM: g.RAQIV2AggregationType.Sum,
            DASHBOARD_AGGREGATION_COUNT: g.RAQIV2AggregationType.Count,
            DASHBOARD_AGGREGATION_AVERAGE: g.RAQIV2AggregationType.Average,
            DASHBOARD_AGGREGATION_MIN: g.RAQIV2AggregationType.Min,
            DASHBOARD_AGGREGATION_MAX: g.RAQIV2AggregationType.Max,
            DASHBOARD_AGGREGATION_DISTINCT_COUNT: g.RAQIV2AggregationType.CountUser,
            DASHBOARD_AGGREGATION_UNIQUE_COUNT: g.RAQIV2AggregationType.CountUser,
            DASHBOARD_AGGREGATION_PERCENTILE_AVG: g.RAQIV2PercentileType.AVG,
            DASHBOARD_AGGREGATION_PERCENTILE_P10: g.RAQIV2PercentileType.P10,
            DASHBOARD_AGGREGATION_PERCENTILE_P50: g.RAQIV2PercentileType.P50,
            DASHBOARD_AGGREGATION_PERCENTILE_P90: g.RAQIV2PercentileType.P90,
            DASHBOARD_AGGREGATION_TOTAL: l.CustomDashboardSummaryCardAggregation.Total,
            DASHBOARD_AGGREGATION_AVERAGE_OVER_TIME_PERIOD: l.CustomDashboardSummaryCardAggregation.AverageOverTimePeriod,
            DASHBOARD_AGGREGATION_MOST_RECENT_DATA_POINT: l.CustomDashboardSummaryCardAggregation.MostRecentDataPoint,
            DASHBOARD_AGGREGATION_MEDIAN: l.CustomDashboardSummaryCardAggregation.Median,
            DASHBOARD_AGGREGATION_CUMULATIVE: l.CustomDashboardSummaryCardAggregation.Cumulative,
            DASHBOARD_AGGREGATION_AVERAGE_PER_UNIQUE_USER: g.RAQIV2AggregationType.AveragePerUser,
            1: g.RAQIV2AggregationType.Sum,
            2: g.RAQIV2AggregationType.Count,
            3: g.RAQIV2AggregationType.Average,
            4: g.RAQIV2AggregationType.Min,
            5: g.RAQIV2AggregationType.Max,
            6: g.RAQIV2AggregationType.CountUser,
            7: g.RAQIV2AggregationType.CountUser,
            10: g.RAQIV2PercentileType.AVG,
            11: g.RAQIV2PercentileType.P10,
            12: g.RAQIV2PercentileType.P50,
            13: g.RAQIV2PercentileType.P90,
            20: l.CustomDashboardSummaryCardAggregation.Total,
            21: l.CustomDashboardSummaryCardAggregation.AverageOverTimePeriod,
            22: l.CustomDashboardSummaryCardAggregation.MostRecentDataPoint,
            23: l.CustomDashboardSummaryCardAggregation.Median,
            24: l.CustomDashboardSummaryCardAggregation.Cumulative,
            25: g.RAQIV2AggregationType.AveragePerUser
        },
        M = {
            [l.SummaryCardTitleSource.Auto]: 1,
            [l.SummaryCardTitleSource.Custom]: 2
        },
        V = {
            DASHBOARD_TITLE_SOURCE_AUTO: l.SummaryCardTitleSource.Auto,
            DASHBOARD_TITLE_SOURCE_CUSTOM: l.SummaryCardTitleSource.Custom,
            1: l.SummaryCardTitleSource.Auto,
            2: l.SummaryCardTitleSource.Custom
        },
        O = {
            none: 1,
            weekly: 2
        },
        U = {
            DASHBOARD_CHART_SMOOTHING_NONE: "none",
            DASHBOARD_CHART_SMOOTHING_WEEKLY: "weekly",
            1: "none",
            2: "weekly"
        };

    function P(e) {
        return "object" == typeof e && null !== e && !Array.isArray(e)
    }

    function k(e) {
        return String(e)
    }

    function B(e) {
        throw TypeError(e)
    }

    function x(e, t, r) {
        let n = t[k(e)];
        return void 0 === n && B("Unsupported ".concat(r, " value ").concat(String(e), ".")), n
    }

    function H(e, t, r) {
        let n = t[k(e)];
        return void 0 === n && B("Unsupported backend ".concat(r, " value ").concat(String(e), ".")), n
    }

    function G(e) {
        let t = new Date(e).toISOString();
        return Number.isNaN(Date.parse(t)) && B("Timestamp is outside the supported RFC3339 range."), t
    }

    function Q(e, t) {
        if ("string" == typeof e) {
            let r = Date.parse(e);
            return Number.isFinite(r) || B("".concat(t, " is not a valid timestamp.")), r
        }
        if (P(e)) {
            var r, n;
            let a = Number(null != (r = e.seconds) ? r : 0),
                i = Number(null != (n = e.nanos) ? n : 0);
            return Number.isFinite(a) && Number.isFinite(i) || B("".concat(t, " is not a valid timestamp.")), 1e3 * a + Math.floor(i / 1e6)
        }
        return B("".concat(t, " is not a valid timestamp."))
    }

    function L(e) {
        return e.map(e => ({
            dimensionKey: e.dimension,
            values: [...e.values]
        }))
    }

    function F(e, t) {
        return null == e ? [] : (Array.isArray(e) || B("".concat(t, " must be an array.")), e.map((e, r) => {
            var n, a;
            P(e) || B("".concat(t, "[").concat(r, "] must be an object."));
            let i = null != (n = null != (a = e.dimensionKey) ? a : e.dimension_key) ? n : e.dimension;
            ("string" != typeof i || 0 === i.length) && B("".concat(t, "[").concat(r, "].dimensionKey must be a non-empty string."));
            let {
                values: o
            } = e;
            return Array.isArray(o) && o.every(e => "string" == typeof e) || B("".concat(t, "[").concat(r, "].values must be an array of strings.")), {
                dimension: i,
                values: o
            }
        }))
    }

    function K(e, t, r) {
        if (null != e) return Array.isArray(e) && e.every(e => "string" == typeof e) || B("".concat(t, " must be an array of strings.")), e.map((e, n) => r(e) ? e : B("".concat(t, "[").concat(n, "] is unsupported.")))
    }
    let j = g.RAQIV2Dimension.CustomEventName;

    function z(e) {
        if (e && 0 !== e.length) return e.map(e => ({
            pseudoDimensionKey: e.pseudoDimensionKey,
            variantKey: e.variantKey
        }))
    }

    function Y(e) {
        if (Array.isArray(e) && 0 !== e.length) return e.map((e, t) => {
            var r, n;
            P(e) || B("variantSelections[".concat(t, "] must be an object."));
            let a = null != (r = e.pseudoDimensionKey) ? r : e.pseudo_dimension_key,
                i = null != (n = e.variantKey) ? n : e.variant_key;
            return ("string" != typeof a || "string" != typeof i) && B("variantSelections[".concat(t, "] is missing keys.")), {
                pseudoDimensionKey: a,
                variantKey: i
            }
        })
    }

    function q(e) {
        let t = z(e.variantSelections);
        if (e.computedMetric) {
            var r;
            return {
                computedMetric: {
                    sources: (r = e.computedMetric).sources.map(e => {
                        let t = e.metric,
                            r = z(function(e) {
                                if (!e) return;
                                let t = [];
                                return e.aggregationType && t.push({
                                    pseudoDimensionKey: g.RAQIV2UIPseudoDimension.AggregationType,
                                    variantKey: e.aggregationType
                                }), e.percentile && t.push({
                                    pseudoDimensionKey: g.RAQIV2UIPseudoDimension.PercentileType,
                                    variantKey: e.percentile
                                }), t.length > 0 ? t : void 0
                            }(e.pseudoDimensionValues)),
                            n = e.filters ? L(e.filters) : void 0;
                        return (0, b.isCustomEventsAtomicMetricLike)(t) ? {
                            sourceKey: e.key,
                            metric: {
                                customEventMetric: {
                                    metricKey: t.metric,
                                    customEventName: t.customEventName,
                                    ...t.aggregationType ? {
                                        aggregation: x(t.aggregationType, _, "aggregation")
                                    } : {}
                                }
                            },
                            ...n ? {
                                filters: n
                            } : {},
                            ...r ? {
                                variantSelections: r
                            } : {}
                        } : {
                            sourceKey: e.key,
                            metric: {
                                metricKey: t
                            },
                            ...n ? {
                                filters: n
                            } : {},
                            ...r ? {
                                variantSelections: r
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

    function X(e, t) {
        var r, n, a;
        P(e) || B("".concat(t, " must be an object."));
        let i = Y(null != (r = e.variantSelections) ? r : e.variant_selections),
            o = null != (n = e.computedMetric) ? n : e.computed_metric;
        if (void 0 !== o) return {
            computedMetric: function(e, t) {
                P(e) || B("".concat(t, " must be an object."));
                let {
                    sources: r,
                    formula: n,
                    displayName: a,
                    l7Smoothing: i
                } = e;
                Array.isArray(r) && 0 !== r.length && "string" == typeof n || B("".concat(t, " is not a valid computed metric."));
                let [o, ...s] = r.map((e, r) => {
                    var n, a, i, o, s, u;
                    let c;
                    P(e) || B("".concat(t, ".sources[").concat(r, "] must be an object."));
                    let l = null != (n = null != (a = e.sourceKey) ? a : e.source_key) ? n : e.key;
                    ("string" != typeof l || 0 === l.length) && B("".concat(t, ".sources[").concat(r, "].sourceKey must be set."));
                    let d = e.metric;
                    P(d) || B("".concat(t, ".sources[").concat(r, "].metric must be an object."));
                    let h = null != (i = d.customEventMetric) ? i : d.custom_event_metric;
                    if (P(h)) {
                        let e, n = null != (s = h.customEventName) ? s : h.custom_event_name;
                        "string" != typeof n && B("".concat(t, ".sources[").concat(r, "].metric.customEventMetric is invalid.")), c = {
                            metric: g.RAQIV2UIMetric.CustomEventsV2,
                            customEventName: n,
                            ...void 0 !== h.aggregation ? {
                                aggregationType: (e = H(h.aggregation, N, "aggregation"), (0, C.isRAQIV2AggregationType)(e) ? e : B("Unsupported custom-event aggregation ".concat(e, ".")))
                            } : {}
                        }
                    } else {
                        let e = null != (u = d.metricKey) ? u : d.metric_key;
                        "string" != typeof e && B("".concat(t, ".sources[").concat(r, "].metric.metricKey must be set.")), (0, C.isMetricKey)(e) || B("".concat(t, ".sources[").concat(r, "].metric.metricKey is unsupported.")), c = e
                    }
                    let m = void 0 === e.filters ? void 0 : F(e.filters, "".concat(t, ".sources[").concat(r, "].filters")),
                        p = null == m ? void 0 : m.map(e => {
                            var n, a;
                            return n = "".concat(t, ".sources[").concat(r, "].filters"), (a = e.dimension) !== j && (0, C.isCanonicalRAQIV2Dimension)(a) ? {
                                dimension: e.dimension,
                                values: [...e.values]
                            } : B("".concat(n, " contains an unsupported dimension."))
                        });
                    return {
                        key: l,
                        metric: c,
                        ...void 0 !== p ? {
                            filters: p
                        } : {},
                        pseudoDimensionValues: function(e) {
                            if (!e || 0 === e.length) return;
                            let t = null,
                                r = null,
                                n = g.RAQIV2UIPseudoDimension.AggregationType,
                                a = g.RAQIV2UIPseudoDimension.PercentileType;
                            for (let i of e) i.pseudoDimensionKey === n && ((0, C.isRAQIV2AggregationType)(i.variantKey) || B("Unsupported aggregation variant ".concat(i.variantKey, ".")), t = i.variantKey), i.pseudoDimensionKey === a && ((0, C.isRAQIV2PercentileType)(i.variantKey) || B("Unsupported percentile variant ".concat(i.variantKey, ".")), r = i.variantKey);
                            if (null !== t || null !== r) return {
                                aggregationType: t,
                                percentile: r
                            }
                        }(Y(null != (o = e.variantSelections) ? o : e.variant_selections))
                    }
                });
                return o || B("".concat(t, ".sources must be non-empty.")), {
                    sources: [o, ...s],
                    formula: n,
                    ..."string" == typeof a ? {
                        name: a
                    } : {},
                    ..."boolean" == typeof i ? {
                        l7Smoothing: i
                    } : {}
                }
            }(o, "".concat(t, ".computedMetric")),
            variantSelections: i
        };
        let s = null != (a = e.metricKey) ? a : e.metric_key;
        return ("string" != typeof s || 0 === s.length) && B("".concat(t, ".metricKey must be set.")), {
            metricKey: (0, C.isMetricKey)(s) ? s : B("".concat(t, ".metricKey is not a supported numeric metric.")),
            variantSelections: i
        }
    }

    function W(e, t) {
        var r, n, a, i, o, s, u, c, l;
        let d;
        if (null == e) return {};
        P(e) || B("".concat(t, " must be an object."));
        let h = P(e.granularity) ? null != (r = e.granularity.fixed) ? r : e.granularity : void 0,
            m = P(h) ? h.granularity : void 0,
            p = void 0 === m ? void 0 : I[k(m)],
            f = null != (n = e.annotationOptions) ? n : e.annotation_options,
            y = P(f) ? (d = null != (c = K(null != (l = f.defaultAnnotationTypeKeys) ? l : f.default_annotation_type_keys, "".concat(t, ".annotationOptions.defaultAnnotationTypeKeys"), C.isDefaultAnnotationType)) ? c : [], {
                supportedAnnotationTypes: (0, A.resolveCustomDashboardSupportedAnnotationTypes)(d),
                defaultAnnotationTypes: d,
                showAnnotationsControl: "boolean" == typeof f.showAnnotationsControl ? f.showAnnotationsControl : "boolean" != typeof f.show_annotations_control || f.show_annotations_control
            }) : void 0,
            g = null != (a = e.defaultFilters) ? a : e.default_filters,
            v = void 0 === g ? void 0 : F(g, "".concat(t, ".defaultFilters")),
            b = K(null != (i = e.filterDimensionKeys) ? i : e.filter_dimension_keys, "".concat(t, ".filterDimensionKeys"), C.isCanonicalRAQIV2Dimension),
            D = K(null != (o = e.breakdownDimensionKeys) ? o : e.breakdown_dimension_keys, "".concat(t, ".breakdownDimensionKeys"), C.isCanonicalRAQIV2Dimension),
            w = K(null != (s = e.defaultBreakdownDimensionKeys) ? s : e.default_breakdown_dimension_keys, "".concat(t, ".defaultBreakdownDimensionKeys"), C.isDefaultBreakdownDimension);
        return {
            timeRangeOptions: function(e, t) {
                var r, n;
                if (null == e) return;
                if (P(e) || B("".concat(t, " must be an object.")), void 0 !== e.none) return {
                    type: "None"
                };
                let a = null != (r = e.dateRange) ? r : e.date_range;
                if (void 0 !== a) return P(a) || B("".concat(t, ".dateRange must be an object.")), {
                    type: "DateRange",
                    defaultSelection: function(e, t) {
                        var r, n, a, i;
                        if (null == e) return;
                        P(e) || B("".concat(t, " must be an object."));
                        let o = null != (r = e.relativeRangeKey) ? r : e.relative_range_key;
                        if ("string" == typeof o) return (0, C.isDateRangeType)(o) || B("".concat(t, ".relativeRangeKey is unsupported.")), {
                            type: "Relative",
                            rangeType: o
                        };
                        let s = null != (n = e.customRange) ? n : e.custom_range;
                        if (P(s)) return {
                            type: "Custom",
                            startTimeMs: Q(null != (a = s.startTime) ? a : s.start_time, "".concat(t, ".customRange.startTime")),
                            endTimeMs: Q(null != (i = s.endTime) ? i : s.end_time, "".concat(t, ".customRange.endTime"))
                        }
                    }(null != (n = a.defaultSelection) ? n : a.default_selection, "".concat(t, ".dateRange.defaultSelection"))
                }
            }(null != (u = e.timeRangeOptions) ? u : e.time_range_options, "".concat(t, ".timeRangeOptions")),
            filterDimensions: b,
            defaultFilters: v,
            breakdownDimensions: D,
            defaultBreakdown: w,
            defaultGranularity: p,
            annotationOptions: y
        }
    }

    function $(e) {
        return {
            metric: q(e.metric),
            seriesKey: e.seriesKey,
            ...e.aggregation ? {
                aggregation: x(e.aggregation, _, "aggregation")
            } : {}
        }
    }

    function J(e, t) {
        var r, n, a, i;
        P(e) || B("".concat(t, " must be an object."));
        let o = null != (r = e.summaryCard) ? r : e.summary_card;
        if (void 0 !== o) {
            let e, r;
            return {
                type: "Component",
                component: {
                    type: "SummaryCard",
                    summaryCard: (n = "".concat(t, ".summaryCard"), P(o) || B("".concat(n, " must be an object.")), ("string" != typeof(e = null != (a = o.tileId) ? a : o.tile_id) || 0 === e.length) && B("".concat(n, ".tileId must be set.")), r = null != (i = o.titleSource) ? i : o.title_source, {
                        type: "SummaryCard",
                        tileId: e,
                        ..."string" == typeof o.title ? {
                            title: o.title
                        } : {},
                        metric: X(o.metric, "".concat(n, ".metric")),
                        aggregation: H(o.aggregation, N, "aggregation"),
                        filters: F(o.filters, "".concat(n, ".filters")),
                        ...void 0 !== r ? {
                            titleSource: H(r, V, "titleSource")
                        } : {}
                    })
                }
            }
        }
        let s = e.chart;
        return void 0 !== s ? {
            type: "Component",
            component: {
                type: "Chart",
                chart: function(e, t) {
                    var r, n, a, i, o;
                    let s, u;
                    P(e) || B("".concat(t, " must be an object."));
                    let c = null != (r = e.tileId) ? r : e.tile_id;
                    ("string" != typeof c || 0 === c.length) && B("".concat(t, ".tileId must be set."));
                    let d = null != (n = e.dataSpec) ? n : e.data_spec,
                        h = null != (a = e.chartSpec) ? a : e.chart_spec;
                    P(d) && P(h) || B("".concat(t, " must include dataSpec and chartSpec.")), Array.isArray(d.metrics) || B("".concat(t, ".dataSpec.metrics must be an array."));
                    let m = H(null != (i = h.chartType) ? i : h.chart_type, S, "chartType"),
                        p = d.granularity,
                        f = h.smoothing;
                    if (void 0 !== d.aggregation) {
                        let e = H(d.aggregation, N, "aggregation");
                        (0, C.isChartAggregation)(e) || B("Unsupported chart aggregation ".concat(e, ".")), s = e
                    }
                    let y = null != (o = d.breakdownDimensionKeys) ? o : d.breakdown_dimension_keys;
                    Array.isArray(y) && (y.every(e => "string" == typeof e) || B("".concat(t, ".dataSpec.breakdownDimensionKeys must contain strings.")), u = y);
                    let g = void 0 !== p ? H(p, E, "granularity") : l.DEFAULT_CHART_GRANULARITY;
                    return {
                        type: "Chart",
                        tileId: c,
                        ..."string" == typeof e.title ? {
                            title: e.title
                        } : {},
                        dataSpec: {
                            metrics: d.metrics.map((e, r) => {
                                var n, a;
                                let i, o;
                                return n = "".concat(t, ".dataSpec.metrics[").concat(r, "]"), P(e) || B("".concat(n, " must be an object.")), ("string" != typeof(i = null != (a = e.seriesKey) ? a : e.series_key) || 0 === i.length) && B("".concat(n, ".seriesKey must be set.")), {
                                    metric: X(e.metric, "".concat(n, ".metric")),
                                    seriesKey: i,
                                    ...void 0 !== e.aggregation ? {
                                        aggregation: (o = H(e.aggregation, N, "aggregation"), (0, C.isChartAggregation)(o) ? o : B("Unsupported chart aggregation ".concat(o, ".")))
                                    } : {}
                                }
                            }),
                            ...void 0 !== s ? {
                                aggregation: s
                            } : {},
                            ...void 0 !== u ? {
                                breakdownDimensions: u
                            } : {},
                            granularity: g,
                            filters: F(d.filters, "".concat(t, ".dataSpec.filters"))
                        },
                        chartSpec: {
                            chartType: m,
                            overlays: function(e) {
                                var t, r, n, a;
                                if (!P(e)) return;
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
                                smoothing: H(f, U, "smoothing")
                            } : {}
                        }
                    }
                }(s, "".concat(t, ".chart"))
            }
        } : B("".concat(t, " must set chart or summaryCard."))
    }

    function Z(e) {
        switch (e.type) {
            case "Component":
                var t, r, n, a, i, o;
                let s, u, c;
                return {
                    component: "SummaryCard" === (t = e.component).type ? {
                        summaryCard: {
                            tileId: (r = t.summaryCard).tileId,
                            ...void 0 !== r.title ? {
                                title: r.title
                            } : {},
                            metric: q(r.metric),
                            aggregation: x(r.aggregation, _, "aggregation"),
                            filters: L(r.filters),
                            titleSource: x(null != (n = r.titleSource) ? n : l.SummaryCardTitleSource.Auto, M, "titleSource")
                        }
                    } : {
                        chart: (s = function(e) {
                            if (!e) return;
                            let t = {};
                            return void 0 !== e.genreBenchmark && (t.genreBenchmark = e.genreBenchmark), void 0 !== e.similarExperienceBenchmark && (t.similarExperienceBenchmark = e.similarExperienceBenchmark), void 0 !== e.topExperienceBenchmark && (t.topExperienceBenchmark = e.topExperienceBenchmark), void 0 !== e.previousPeriod && ("boolean" != typeof e.previousPeriod && B("Backend v1 cannot persist configured previous-period comparison offsets."), t.previousPeriod = e.previousPeriod), void 0 !== e.quota && (t.quota = e.quota), Object.keys(t).length > 0 ? t : void 0
                        }((a = t.chart).chartSpec.overlays), u = null == (o = a.dataSpec.metrics[0]) ? void 0 : o.metric, c = null != (i = a.dataSpec.aggregation) ? i : void 0 !== u ? (0, D.resolveDefaultChartAggregation)(u) : g.RAQIV2AggregationType.Average, {
                            tileId: a.tileId,
                            ...void 0 !== a.title ? {
                                title: a.title
                            } : {},
                            dataSpec: {
                                metrics: a.dataSpec.metrics.map($),
                                aggregation: x(c, _, "aggregation"),
                                ...a.dataSpec.breakdownDimensions ? {
                                    breakdownDimensionKeys: [...a.dataSpec.breakdownDimensions]
                                } : {},
                                granularity: x(a.dataSpec.granularity, T, "granularity"),
                                filters: L(a.dataSpec.filters)
                            },
                            chartSpec: {
                                chartType: x(a.chartSpec.chartType, w, "chartType"),
                                ...s ? {
                                    overlays: s
                                } : {},
                                ...a.chartSpec.smoothing ? {
                                    smoothing: x(a.chartSpec.smoothing, O, "smoothing")
                                } : {}
                            }
                        })
                    }
                };
            case "Stack":
                return {
                    stack: {
                        children: e.children.map(Z)
                    }
                };
            case "Flex":
                return {
                    flex: {
                        children: e.children.map(Z)
                    }
                };
            case "Grid":
                return {
                    grid: {
                        columnCount: e.columnCount,
                        children: e.children.map(Z)
                    }
                };
            default:
                return B("Unsupported layout node ".concat(JSON.stringify(e), "."))
        }
    }

    function ee(e, t) {
        var r, n;
        if (P(e) || B("".concat(t, " must be an object.")), "string" == typeof e.type) {
            if ("Component" === e.type) return J(e.component, "".concat(t, ".component"));
            if ("Stack" === e.type || "Flex" === e.type) return Array.isArray(e.children) || B("".concat(t, ".children must be an array.")), {
                type: e.type,
                children: e.children.map((e, r) => ee(e, "".concat(t, ".children[").concat(r, "]")))
            };
            if ("Grid" === e.type) {
                Array.isArray(e.children) || B("".concat(t, ".children must be an array."));
                let n = null != (r = e.columnCount) ? r : e.column_count;
                return 1 !== n && 2 !== n && B("".concat(t, ".columnCount must be 1 or 2.")), {
                    type: "Grid",
                    columnCount: n,
                    children: e.children.map((e, r) => ee(e, "".concat(t, ".children[").concat(r, "]")))
                }
            }
        }
        if (void 0 !== e.component) return J(e.component, "".concat(t, ".component"));
        if (void 0 !== e.stack) return P(e.stack) && Array.isArray(e.stack.children) || B("".concat(t, ".stack.children must be an array.")), {
            type: "Stack",
            children: e.stack.children.map((e, r) => ee(e, "".concat(t, ".stack.children[").concat(r, "]")))
        };
        if (void 0 !== e.flex) return P(e.flex) && Array.isArray(e.flex.children) || B("".concat(t, ".flex.children must be an array.")), {
            type: "Flex",
            children: e.flex.children.map((e, r) => ee(e, "".concat(t, ".flex.children[").concat(r, "]")))
        };
        if (void 0 !== e.grid) {
            P(e.grid) && Array.isArray(e.grid.children) || B("".concat(t, ".grid.children must be an array."));
            let r = null != (n = e.grid.columnCount) ? n : e.grid.column_count;
            return 1 !== r && 2 !== r && B("".concat(t, ".grid.columnCount must be 1 or 2.")), {
                type: "Grid",
                columnCount: r,
                children: e.grid.children.map((e, r) => ee(e, "".concat(t, ".grid.children[").concat(r, "]")))
            }
        }
        return B("".concat(t, " must set component, stack, flex, or grid."))
    }

    function et(e) {
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

    function er(e) {
        let t = "number" == typeof e ? e : "string" == typeof e && e.trim().length > 0 ? Number(e) : NaN;
        return Number.isSafeInteger(t) && t > 0 ? t : void 0
    }

    function en(e) {
        var t;
        return null != (t = e.dashboardId) ? t : ""
    }

    function ea(e) {
        var t, r;
        let n;
        return {
            schemaVersion: l.CUSTOM_DASHBOARD_CURRENT_SCHEMA_VERSION,
            config: {
                page: ((t = e.page).mode !== l.DashboardPageMode.Untabbed && B("Only untabbed dashboard pages can be serialized to the backend."), {
                    untabbed: {
                        surface: {
                            resourceTypeKeys: [1],
                            controls: (n = (r = t.surface.controls).defaultGranularity ? R[r.defaultGranularity] : void 0, {
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
                                                            startTime: G(t.startTimeMs),
                                                            endTime: G(t.endTimeMs)
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
                                    defaultFilters: L(r.defaultFilters)
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
                            bodyNodes: t.surface.bodyNodes.map(Z)
                        }
                    }
                })
            }
        }
    }

    function ei(e) {
        var t, r, n, a, i, o, s;
        let u, c, d = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : l.EMPTY_DASHBOARD_CONFIG,
            h = en(e),
            m = null != (t = e.universeId) ? t : 0,
            p = null != (r = et(e.createdTime)) ? r : new Date(0).toISOString(),
            f = null != (n = et(e.updatedTime)) ? n : p,
            y = et(e.publishedTime),
            g = !0 === e.isPinned,
            v = e.createdBy,
            b = e.updatedBy,
            A = er(null == v ? void 0 : v.userId),
            D = er(null == b ? void 0 : b.userId);
        return {
            id: h,
            schemaVersion: l.CUSTOM_DASHBOARD_CURRENT_SCHEMA_VERSION,
            universeId: m,
            name: (0, C.validateDashboardName)(null != (a = e.name) ? a : ""),
            description: (0, C.validateDashboardDescription)(null != (i = e.description) ? i : void 0),
            status: (u = (o = e).latestPublishedDocumentId, c = null != (s = o.latestPublishedVersion) ? s : 0, u || c > 0 ? "published" : "draft"),
            isPinned: g,
            pinnedAt: g ? et(e.pinnedTime) : void 0,
            createdAt: p,
            updatedAt: f,
            publishedAt: y,
            createdByUserId: null != A ? A : 0,
            createdByUsername: "",
            ...void 0 !== D ? {
                updatedByUserId: D
            } : {},
            config: d
        }
    }

    function eo(e) {
        if (!e.metadata) throw Error("Custom dashboard API response is missing metadata.");
        return ei(e.metadata, function(e) {
            var t;
            let r;
            return e ? (P(e) || B("Backend custom dashboard document is missing config."), (r = null != (t = e.schemaVersion) ? t : e.schema_version) !== l.CUSTOM_DASHBOARD_CURRENT_SCHEMA_VERSION && B("Unsupported backend custom dashboard schema version ".concat(String(r), ".")), P(e.config) || B("Backend custom dashboard document is missing config."), P(e.config.page) || B("config.page must be an object."), (0, C.validateCustomDashboardConfig)({
                page: function(e, t) {
                    var r, n, a;
                    if (P(e) || B("".concat(t, " must be an object.")), e.mode === l.DashboardPageMode.Untabbed) {
                        let r = e.surface;
                        P(r) || B("".concat(t, ".surface must be an object."));
                        let n = null != (a = r.bodyNodes) ? a : r.body_nodes;
                        return Array.isArray(n) || B("".concat(t, ".surface.bodyNodes must be an array.")), {
                            mode: l.DashboardPageMode.Untabbed,
                            surface: {
                                controls: W(r.controls, "".concat(t, ".surface.controls")),
                                bodyNodes: n.map((e, r) => ee(e, "".concat(t, ".surface.bodyNodes[").concat(r, "]")))
                            }
                        }
                    }
                    let i = e.untabbed;
                    P(i) || B("".concat(t, ".untabbed must be an object."));
                    let o = i.surface;
                    P(o) || B("".concat(t, ".untabbed.surface must be an object."));
                    let s = null != (r = null != (n = o.bodyNodes) ? n : o.body_nodes) ? r : [];
                    return Array.isArray(s) || B("".concat(t, ".untabbed.surface.bodyNodes must be an array.")), {
                        mode: l.DashboardPageMode.Untabbed,
                        surface: {
                            controls: W(o.controls, "".concat(t, ".untabbed.surface.controls")),
                            bodyNodes: s.map((e, r) => ee(e, "".concat(t, ".untabbed.surface.bodyNodes[").concat(r, "]")))
                        }
                    }
                }(e.config.page, "config.page")
            }, {
                enforceTileCaps: !1
            })) : l.EMPTY_DASHBOARD_CONFIG
        }(e.document))
    }

    function es(e, t) {
        return "".concat(e, ":").concat(t)
    }
    let eu = class {
        async list(e, t) {
            return this.withApiErrors(e, void 0, async () => {
                var r, n, a;
                this.ensureAvailable();
                let i = t ? await this.client.listDashboards(e, t) : await this.listAllDashboards(e),
                    o = (null != (r = i.dashboards) ? r : []).map(t => (this.rememberMetadata(e, t), ei(t)));
                return {
                    items: (0, m.sortDashboardsForList)(o),
                    canEditCustomDashboards: (null == (a = i.capabilities) ? void 0 : a.canEdit) === !0,
                    capabilities: i.capabilities,
                    migrationFailedCount: 0,
                    nextPageToken: t && null != (n = i.nextPageToken) ? n : void 0
                }
            })
        }
        async get(e, t) {
            return this.withApiErrors(e, t, async () => {
                this.ensureAvailable();
                let r = await this.client.getDashboard({
                    universeId: e,
                    dashboardId: t
                });
                return this.rememberMetadata(e, r.metadata), eo(r)
            })
        }
        async getVersion(e, t) {
            return this.withApiErrors(e, t, async () => {
                var r, n;
                this.ensureAvailable();
                let a = this.tokens.get(es(e, t));
                return a ? a.revision : (await this.get(e, t), null != (r = null == (n = this.tokens.get(es(e, t))) ? void 0 : n.revision) ? r : null)
            })
        }
        async create(e) {
            return this.withApiErrors(e.universeId, void 0, async () => {
                var t;
                this.ensureAvailable();
                let r = null != (t = e.config) ? t : l.EMPTY_DASHBOARD_CONFIG,
                    n = await this.client.createDashboard({
                        universeId: e.universeId,
                        name: e.name,
                        description: e.description,
                        document: ea(r)
                    });
                this.rememberMetadata(e.universeId, n.metadata);
                let a = eo(n);
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
                } = r, s = void 0 !== i.name || void 0 !== i.description, u = void 0 !== o;
                if (!s && !u) return this.get(e, t);
                let c = await this.ensureTokens(e, t),
                    l = null == n ? void 0 : n.expectedVersion;
                if (void 0 !== o) {
                    let r = await this.client.publishDashboard({
                        universeId: e,
                        dashboardId: t,
                        expectedHeadEtag: this.requireHeadEtag(c, t, l),
                        document: ea(o),
                        ...s ? {
                            metadataPatch: i
                        } : {}
                    });
                    this.rememberMetadata(e, r.metadata), a = eo(r)
                } else if (s) {
                    let r = await this.client.updateDashboardMetadata({
                        universeId: e,
                        dashboardId: t,
                        expectedHeadEtag: this.requireHeadEtag(c, t, l),
                        patch: i
                    });
                    this.rememberMetadata(e, r)
                }
                return this.emit({
                    universeId: e,
                    dashboardId: t,
                    eventType: "update"
                }), null != a ? a : this.get(e, t)
            })
        }
        async createAndPublish(e) {
            let t = await this.create(e);
            try {
                return await this.publish(e.universeId, t.id)
            } catch (r) {
                try {
                    let r = await this.get(e.universeId, t.id);
                    if ("published" === r.status) return r;
                    return await this.publish(e.universeId, t.id)
                } catch (e) {
                    throw r
                }
            }
        }
        async addChartTile(e, t, r, n) {
            return this.withApiErrors(e, t, async () => {
                this.ensureAvailable();
                let a = await this.get(e, t),
                    {
                        config: i,
                        tile: o
                    } = (0, d.addChartTileToConfig)({
                        config: a.config,
                        tile: r.tile,
                        nextTileId: (0, h.createTileId)()
                    }),
                    s = await this.ensureTokens(e, t),
                    u = await this.client.publishDashboard({
                        universeId: e,
                        dashboardId: t,
                        expectedHeadEtag: this.requireHeadEtag(s, t, null == n ? void 0 : n.expectedVersion),
                        document: ea(i)
                    });
                this.rememberMetadata(e, u.metadata);
                let c = eo(u);
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
                }), this.tokens.delete(es(e, t)), this.emit({
                    universeId: e,
                    dashboardId: t,
                    eventType: "delete"
                })
            })
        }
        async duplicate(e, t, r) {
            return this.withApiErrors(e, t, async () => {
                this.ensureAvailable();
                let [r, n] = await Promise.all([this.get(e, t), this.list(e)]), a = this.dedupeName(r.name, n.items.map(e => e.name)), i = await this.client.duplicateDashboard({
                    universeId: e,
                    dashboardId: t,
                    destinationUniverseId: e,
                    name: a
                });
                this.rememberMetadata(e, i.metadata);
                let o = eo(i);
                return this.emit({
                    universeId: e,
                    dashboardId: o.id,
                    eventType: "duplicate"
                }), o
            })
        }
        async publish(e, t, r) {
            return this.withApiErrors(e, t, async () => {
                this.ensureAvailable();
                let n = await this.get(e, t),
                    a = await this.ensureTokens(e, t),
                    i = await this.client.publishDashboard({
                        universeId: e,
                        dashboardId: t,
                        expectedHeadEtag: this.requireHeadEtag(a, t, null == r ? void 0 : r.expectedVersion),
                        document: ea(n.config)
                    });
                this.rememberMetadata(e, i.metadata);
                let o = eo(i);
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
            let t = await this.list(e);
            return (0, p.suggestDefaultName)(t.items.map(e => e.name))
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
                    }), this.get(e, t)
                })
            } catch (e) {
                if (n = e, !(e instanceof u.CustomDashboardVersionConflictError) || 2 === a) throw e
            }
            throw n
        }
        async ensureTokens(e, t) {
            let r = this.tokens.get(es(e, t));
            if (r) return r;
            await this.get(e, t);
            let n = this.tokens.get(es(e, t));
            if (!n) throw new u.CustomDashboardVersionConflictError(t);
            return n
        }
        rememberMetadata(e, t) {
            var r, n;
            let a = t ? en(t) : "",
                i = es(e, a),
                o = this.tokens.get(i),
                s = t && null != (n = t.headEtag) ? n : void 0,
                u = o && o.headEtag === s ? o.revision : (null != (r = null == o ? void 0 : o.revision) ? r : 0) + 1,
                c = new Map(null == o ? void 0 : o.headEtagsByRevision);
            s && c.set(u, s);
            let l = {
                headEtag: s,
                revision: u,
                headEtagsByRevision: c
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
            return r.has(n) ? (0, p.findUnusedNumberedName)(t, t => "".concat(e, " (copy ").concat(t, ")"), p.DUPLICATE_COPY_NUMBERED_SUFFIX_START) : n
        }
        async listAllDashboards(e, t) {
            var r, n;
            let a = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : [],
                i = arguments.length > 3 ? arguments[3] : void 0,
                o = await this.client.listDashboards(e, t ? {
                    pageToken: t
                } : void 0),
                s = [...a, ...null != (r = o.dashboards) ? r : []],
                u = null != (n = o.nextPageToken) ? n : void 0,
                c = null != i ? i : o.capabilities;
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
            if (this.disposed) throw new u.CustomDashboardNotAvailableError
        }
        async withApiErrors(e, t, r) {
            try {
                return await r()
            } catch (n) {
                let r = (0, y.mapCustomDashboardsApiError)(n, t);
                throw r instanceof u.CustomDashboardVersionConflictError && void 0 !== e && t && await this.refreshTokens(e, t), r
            }
        }
        constructor(e = (0, f.createDefaultCustomDashboardsApiClient)()) {
            (0, c._)(this, "client", void 0), (0, c._)(this, "listeners", new Set), (0, c._)(this, "tokens", new Map), (0, c._)(this, "disposed", !1), this.client = e
        }
    };
    var ec = e.i(650040),
        el = e.i(718389);

    function ed(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : h.createTileId;
        return {
            ...(0, el.default)(e),
            tileId: t()
        }
    }

    function eh(e) {
        return e instanceof u.CustomDashboardNotFoundError
    }

    function em(e) {
        return {
            ...e,
            hybridOrigin: "localCopy"
        }
    }

    function ep(e) {
        return {
            ...e,
            hybridOrigin: "localCopy"
        }
    }

    function ef(e) {
        return {
            ...e,
            hybridOrigin: "server"
        }
    }
    e.s(["cloneTileWithNewId", 0, ed], 743209);
    let ey = class {
            async list(e, t) {
                let [r, n] = await Promise.all([this.apiService.list(e, t), this.localService.list(e)]);
                return {
                    items: r.items.map(ef),
                    canEditCustomDashboards: r.canEditCustomDashboards,
                    capabilities: n.capabilities,
                    localItems: n.items.map(ep),
                    nextPageToken: r.nextPageToken,
                    migrationFailedCount: r.migrationFailedCount + n.migrationFailedCount
                }
            }
            async get(e, t) {
                try {
                    return em(await this.localService.get(e, t))
                } catch (e) {
                    if (!eh(e)) throw e
                }
                return {
                    ...await this.apiService.get(e, t),
                    hybridOrigin: "server"
                }
            }
            async create(e) {
                return em(await this.localService.create(e))
            }
            async createAndPublish(e) {
                return em(await this.localService.createAndPublish(e))
            }
            async update(e, t, r, n) {
                return await this.ensureLocalDashboard(e, t), em(await this.localService.update(e, t, r, n))
            }
            async addChartTile(e, t, r, n) {
                await this.ensureLocalDashboard(e, t);
                let a = await this.localService.addChartTile(e, t, r, n);
                return {
                    ...a,
                    document: em(a.document)
                }
            }
            async delete(e, t) {
                await this.ensureLocalDashboard(e, t), await this.localService.delete(e, t)
            }
            async duplicate(e, t, r) {
                try {
                    return await this.ensureLocalDashboard(e, t), em(await this.localService.duplicate(e, t, r))
                } catch (e) {
                    if (!eh(e) && !(e instanceof u.CustomDashboardNotAvailableError)) throw e
                }
                return this.forkApiDashboardToLocal(e, t, r)
            }
            async forkApiDashboardToLocal(e, t, r) {
                var n, a, i;
                let o, s, u, c, l = await this.apiService.get(e, t),
                    d = await this.localService.list(e);
                return em(await this.localService.create({
                    universeId: e,
                    name: (n = d.items.map(e => e.name), a = l.name, o = (0, p.clipDashboardName)("".concat(a).concat(" (local copy)")), (s = new Set(Array.from(n, e => e.trim()))).has(o) ? (0, p.findUnusedNumberedName)(s, e => (0, p.clipDashboardName)("".concat(a, " (local copy ").concat(e, ")")), p.DUPLICATE_COPY_NUMBERED_SUFFIX_START) : o),
                    description: l.description,
                    createdByUserId: r.createdByUserId,
                    createdByUsername: r.createdByUsername,
                    config: (i = l.config, u = (0, ec.getSummaryCards)(i).map(e => ed(e)), c = (0, ec.getChartRows)(i).map(e => ({
                        ...e,
                        tiles: e.tiles.map(e => ed(e))
                    })), (0, ec.withChartRows)((0, ec.withSummaryCards)(i, u), c))
                }))
            }
            async publish(e, t, r) {
                return await this.ensureLocalDashboard(e, t), em(await this.localService.publish(e, t, r))
            }
            async unpublish(e, t) {
                return await this.ensureLocalDashboard(e, t), em(await this.localService.unpublish(e, t))
            }
            async pin(e, t) {
                return await this.ensureLocalDashboard(e, t), em(await this.localService.pin(e, t))
            }
            async unpin(e, t) {
                return await this.ensureLocalDashboard(e, t), em(await this.localService.unpin(e, t))
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
                    return em(await this.localService.get(e, t))
                } catch (e) {
                    if (eh(e)) throw new u.CustomDashboardNotAvailableError;
                    throw e
                }
            }
            constructor(e) {
                (0, c._)(this, "localService", void 0), (0, c._)(this, "apiService", void 0), this.localService = e.localService, this.apiService = e.apiService
            }
        },
        eg = {
            isoNow: () => new Date().toISOString()
        };
    var ev = e.i(730530),
        eb = e.i(881670);
    let eA = {
        first: "(copy)",
        numbered: e => "(copy ".concat(e, ")")
    };

    function eD(e, t) {
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
            first: e.tPendingTranslation("(copy)", "Suffix appended to a duplicated dashboard name when the first copy is free; a leading space is added when concatenating with the base name", (0, ev.translationKey)("Label.CustomDashboards.DuplicateName.FirstSuffix", eb.TranslationNamespace.Analytics)),
            numbered: t => e.tPendingTranslation("(copy {n})", "Suffix appended when a duplicate dashboard name collides; {n} is the disambiguation number (2, 3, …); a leading space is added when concatenating with the base name", (0, ev.translationKey)("Label.CustomDashboards.DuplicateName.NumberedSuffix", eb.TranslationNamespace.Analytics), {
                n: String(t)
            })
        }
    }, "testOnlyEnglishDuplicateDashboardNameSuffixes", 0, eA], 322172);
    let eC = class {
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
                if ((null != (t = null == (r = this.peekUniverseMap(e)) ? void 0 : r.size) ? t : 0) >= l.MAX_DASHBOARDS_PER_UNIVERSE) throw new u.CustomDashboardQuotaExceededError("Universe ".concat(e, " is at the per-universe cap of ").concat(l.MAX_DASHBOARDS_PER_UNIVERSE, " dashboards. Delete one to create another."))
            }
            assertUnderPinnedCap(e, t) {
                let r = this.peekUniverseMap(e);
                if (r && Array.from(r.values()).filter(e => e.document.isPinned && e.document.id !== t).length >= l.MAX_PINNED_DASHBOARDS) throw new u.CustomDashboardQuotaExceededError("Universe ".concat(e, " is at the pinned-dashboard cap of ").concat(l.MAX_PINNED_DASHBOARDS, ". Unpin one to pin another."))
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
                    ...eD(r ? (0, m.sortDashboardsForList)([...r.values()].map(e => e.document)) : [], t),
                    capabilities: l.LOCAL_DASHBOARD_LIST_CAPABILITIES,
                    migrationFailedCount: 0
                }
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
                let r = (0, C.validateDashboardName)(e.name),
                    n = (0, C.validateDashboardDescription)(e.description),
                    a = void 0 !== e.config ? (0, C.validateCustomDashboardConfig)(e.config) : l.EMPTY_DASHBOARD_CONFIG,
                    i = this.clock.isoNow(),
                    o = {
                        id: this.idFactory.nextDashboardId(),
                        schemaVersion: l.CUSTOM_DASHBOARD_CURRENT_SCHEMA_VERSION,
                        universeId: e.universeId,
                        name: r,
                        description: n,
                        status: t,
                        isPinned: !1,
                        createdAt: i,
                        updatedAt: i,
                        ..."published" === t ? {
                            publishedAt: i
                        } : {},
                        createdByUserId: e.createdByUserId,
                        createdByUsername: e.createdByUsername,
                        updatedByUserId: e.createdByUserId,
                        updatedByUsername: e.createdByUsername,
                        config: a
                    };
                return this.getOrCreateUniverseMap(e.universeId).set(o.id, {
                    document: o,
                    version: 1
                }), this.emit({
                    universeId: e.universeId,
                    dashboardId: o.id,
                    eventType: "create"
                }), o
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
                } = this.loadOrThrow(e, t);
                if ((null == n ? void 0 : n.expectedVersion) !== void 0 && n.expectedVersion !== i.version) throw new u.CustomDashboardVersionConflictError(t);
                let o = void 0 !== r.name ? (0, C.validateDashboardName)(r.name) : i.document.name,
                    s = void 0 !== r.description ? (0, C.validateDashboardDescription)(r.description) : i.document.description,
                    c = void 0 !== r.config ? (0, C.validateCustomDashboardConfig)(r.config) : i.document.config,
                    l = {
                        ...i.document,
                        name: o,
                        description: s,
                        config: c,
                        updatedAt: this.clock.isoNow(),
                        ...(null == n ? void 0 : n.actor) ? {
                            updatedByUserId: n.actor.userId,
                            updatedByUsername: n.actor.username
                        } : {}
                    };
                return a.set(t, {
                    document: l,
                    version: i.version + 1
                }), this.emit({
                    universeId: e,
                    dashboardId: t,
                    eventType: "update"
                }), l
            }
            async addChartTile(e, t, r, n) {
                return this.applyUpdateMutation(e, t, "add-chart-tile", (e, t) => {
                    let {
                        config: a,
                        tile: i
                    } = (0, d.addChartTileToConfig)({
                        config: e.document.config,
                        tile: r.tile,
                        nextTileId: this.idFactory.nextTileId()
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
                    s = (0, ec.getSummaryCards)(n.config).map(e => ed(e, o)),
                    u = (0, ec.getChartRows)(n.config).map(e => ({
                        ...e,
                        tiles: e.tiles.map(e => ed(e, o))
                    })),
                    c = {
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
                        config: (0, ec.withChartRows)((0, ec.withSummaryCards)(n.config, s), u)
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
                return (0, p.suggestDefaultName)(t ? [...t.values()].map(e => e.document.name) : [])
            }
            subscribe(e) {
                return this.listeners.add(e), () => {
                    this.listeners.delete(e)
                }
            }
            dedupeName(e, t) {
                let r = this.peekUniverseMap(e),
                    n = r ? [...r.values()].map(e => e.document.name) : [];
                return (0, p.buildDuplicateDashboardName)(n, t, this.duplicateNameSuffixes)
            }
            constructor(e = {}) {
                var t, r, n;
                (0, c._)(this, "store", new Map), (0, c._)(this, "listeners", new Set), (0, c._)(this, "clock", void 0), (0, c._)(this, "idFactory", void 0), (0, c._)(this, "duplicateNameSuffixes", void 0), this.clock = null != (t = e.clock) ? t : eg, this.idFactory = null != (r = e.idFactory) ? r : h.defaultIdFactory, this.duplicateNameSuffixes = null != (n = e.duplicateNameSuffixes) ? n : eA
            }
        },
        ew = [{
            fromVersion: 0,
            toVersion: 1,
            description: "v0 → v1 identity: alpha records had no schemaVersion field but were v1-shaped.",
            migrate: e => e
        }];
    var eS = e.i(115232);
    let eT = "creator-hub:custom-dashboards:v1:universe:",
        eE = /^\d+$/;

    function eR(e) {
        return "".concat(eT).concat(e)
    }

    function eI(e, t, r) {
        let n = "".concat("creator-hub:custom-dashboards:v1:unreadable:universe:").concat(t);
        try {
            e.setItem(n, r)
        } catch (e) {}
        return {
            ok: !1,
            unreadableSidecarKey: n
        }
    }

    function e_(e, t, r, n) {
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
            e.setItem(eR(t), JSON.stringify({
                records: a
            }))
        } catch (e) {
            if (function(e) {
                    if (!(0, eS.isRecord)(e)) return !1;
                    let t = e.code,
                        r = e.name;
                    return 22 === t || "QuotaExceededError" === r || "NS_ERROR_DOM_QUOTA_REACHED" === r
                }(e)) throw new u.CustomDashboardQuotaExceededError;
            if (e instanceof u.CustomDashboardStorageWriteError) throw e;
            throw new u.CustomDashboardStorageWriteError(e)
        }
    }

    function eN(e, t) {
        if (Object.keys(t).length >= l.MAX_DASHBOARDS_PER_UNIVERSE) throw new u.CustomDashboardQuotaExceededError("Universe ".concat(e, " is at the per-universe cap of ").concat(l.MAX_DASHBOARDS_PER_UNIVERSE, " dashboards. Delete one to create another."))
    }
    let eM = class {
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
                eN(e, t)
            }
            readMaterialised(e) {
                var t, r, n;
                let a, i, o, s, c = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "throwOnUnreadable",
                    d = this.requireStorage(),
                    h = d.getItem(eR(e)),
                    m = this.materialisedByUniverse.get(e);
                if (m && m.rawString === h) return {
                    storage: d,
                    records: m.records,
                    quarantine: m.quarantine
                };
                let p = function(e, t, r) {
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
                        return eI(e, t, r)
                    }
                    return (0, eS.isRecord)(n) && (0, eS.isRecord)(n.records) ? {
                        ok: !0,
                        bucket: {
                            records: n.records
                        }
                    } : eI(e, t, r)
                }(d, e, h);
                if (!p.ok) {
                    if (this.storageUnreadableByUniverse.set(e, p.unreadableSidecarKey), "throwOnUnreadable" === c) throw new u.CustomDashboardStorageUnreadableError(p.unreadableSidecarKey);
                    return {
                        storage: d,
                        records: {},
                        quarantine: {}
                    }
                }
                this.storageUnreadableByUniverse.delete(e);
                let {
                    records: f,
                    quarantine: y,
                    corrupted: g,
                    mutatedOnRead: v
                } = (t = p.bucket, a = {}, i = {}, o = [], s = !1, Object.entries(null != (r = t.records) ? r : {}).forEach(t => {
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
                    if ((0, eS.isRecord)(c) && !0 === c.migrationFailed) {
                        i[n] = c, o.push({
                            id: n,
                            reason: c.reason,
                            code: "OTHER"
                        });
                        return
                    }
                    if (!(0, eS.isRecord)(c) || "number" != typeof c.version || !("document" in c)) {
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
                        document: d,
                        version: h
                    } = c, m = (0, eS.isRecord)(d) ? d : {}, p = "number" == typeof m.schemaVersion ? m.schemaVersion : void 0;
                    try {
                        let t = (r = {
                            schemaVersion: p,
                            ...m
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
                        }(r, ew, l.CUSTOM_DASHBOARD_CURRENT_SCHEMA_VERSION));
                        p !== t.schemaVersion && (s = !0);
                        let c = (0, C.validateCustomDashboardDocument)({
                            ...t,
                            universeId: e
                        });
                        if (c.id !== n) {
                            let e = 'bucket key "'.concat(n, '" does not match document.id "').concat(c.id, '"');
                            i[n] = {
                                version: "number" == typeof h ? h : 1,
                                migrationFailed: !0,
                                reason: e,
                                raw: d
                            }, o.push({
                                id: n,
                                reason: e,
                                code: "OTHER"
                            }), s = !0;
                            return
                        }
                        a[c.id] = {
                            document: c,
                            version: "number" == typeof h ? h : 1
                        }
                    } catch (r) {
                        let e = r instanceof u.CustomDashboardUnsupportedSchemaError,
                            t = r instanceof Error ? r.message : String(r);
                        i[n] = {
                            version: "number" == typeof h ? h : 1,
                            migrationFailed: !0,
                            reason: t,
                            raw: d
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
                    e_(d, e, f, y);
                    let t = d.getItem(eR(e));
                    this.materialisedByUniverse.set(e, {
                        rawString: t,
                        records: f,
                        quarantine: y
                    })
                } catch (e) {
                    null == (n = this.onPersistError) || n.call(this, e)
                } else this.materialisedByUniverse.set(e, {
                    rawString: h,
                    records: f,
                    quarantine: y
                });
                return {
                    storage: d,
                    records: f,
                    quarantine: y
                }
            }
            async list(e, t) {
                var r, n;
                let {
                    records: a
                } = this.readMaterialised(e), i = (0, m.sortDashboardsForList)(Object.values(a).map(e => e.document)), o = null != (r = null == (n = this.corruptedByUniverse.get(e)) ? void 0 : n.length) ? r : 0;
                return {
                    ...eD(i, t),
                    capabilities: l.LOCAL_DASHBOARD_LIST_CAPABILITIES,
                    migrationFailedCount: o
                }
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
                e_(r, e, i, a);
                let s = r.getItem(eR(e));
                return this.materialisedByUniverse.set(e, {
                    rawString: s,
                    records: i,
                    quarantine: a
                }), o
            }
            insertNewDocument(e, t) {
                this.assertUnderUniverseCap(e.universeId);
                let r = (0, C.validateDashboardName)(e.name),
                    n = (0, C.validateDashboardDescription)(e.description),
                    a = void 0 !== e.config ? (0, C.validateCustomDashboardConfig)(e.config) : l.EMPTY_DASHBOARD_CONFIG,
                    i = this.clock.isoNow(),
                    o = {
                        id: this.idFactory.nextDashboardId(),
                        schemaVersion: l.CUSTOM_DASHBOARD_CURRENT_SCHEMA_VERSION,
                        universeId: e.universeId,
                        name: r,
                        description: n,
                        status: t,
                        isPinned: !1,
                        createdAt: i,
                        updatedAt: i,
                        ..."published" === t ? {
                            publishedAt: i
                        } : {},
                        createdByUserId: e.createdByUserId,
                        createdByUsername: e.createdByUsername,
                        updatedByUserId: e.createdByUserId,
                        updatedByUsername: e.createdByUsername,
                        config: a
                    };
                return this.commit(e.universeId, t => (eN(e.universeId, t), {
                    next: {
                        ...t,
                        [o.id]: {
                            document: o,
                            version: 1
                        }
                    },
                    result: void 0
                })), this.emit({
                    universeId: e.universeId,
                    dashboardId: o.id,
                    eventType: "create"
                }), o
            }
            async create(e) {
                return this.insertNewDocument(e, "draft")
            }
            async createAndPublish(e) {
                return this.insertNewDocument(e, "published")
            }
            async update(e, t, r, n) {
                let a = {};
                return void 0 !== r.name && (a.name = (0, C.validateDashboardName)(r.name)), void 0 !== r.description && (a.description = (0, C.validateDashboardDescription)(r.description)), void 0 !== r.config && (a.config = (0, C.validateCustomDashboardConfig)(r.config)), this.applyMutation(e, t, "update", () => ({
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
                let a = this.commit(e, e => {
                    let a = e[t];
                    if (!a) throw new u.CustomDashboardNotFoundError(t);
                    if ((null == n ? void 0 : n.expectedVersion) !== void 0 && n.expectedVersion !== a.version) throw new u.CustomDashboardVersionConflictError(t);
                    let {
                        config: i,
                        tile: o
                    } = (0, d.addChartTileToConfig)({
                        config: a.document.config,
                        tile: r.tile,
                        nextTileId: this.idFactory.nextTileId()
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
                    eN(e, n);
                    let o = Object.values(n).map(e => e.document.name),
                        s = (0, p.buildDuplicateDashboardName)(o, i.name, this.duplicateNameSuffixes),
                        c = this.clock.isoNow(),
                        l = () => this.idFactory.nextTileId(),
                        d = (0, ec.getSummaryCards)(i.config).map(e => ed(e, l)),
                        h = (0, ec.getChartRows)(i.config).map(e => ({
                            ...e,
                            tiles: e.tiles.map(e => ed(e, l))
                        })),
                        m = {
                            ...i,
                            id: this.idFactory.nextDashboardId(),
                            name: s,
                            status: "draft",
                            isPinned: !1,
                            pinnedAt: void 0,
                            publishedAt: void 0,
                            createdAt: c,
                            updatedAt: c,
                            createdByUserId: r.createdByUserId,
                            createdByUsername: r.createdByUsername,
                            updatedByUserId: r.createdByUserId,
                            updatedByUsername: r.createdByUsername,
                            config: (0, ec.withChartRows)((0, ec.withSummaryCards)(i.config, d), h)
                        };
                    return {
                        next: {
                            ...n,
                            [m.id]: {
                                document: m,
                                version: 1
                            }
                        },
                        result: m
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
                    if (Object.values(r).filter(e => e.document.isPinned && e.document.id !== t).length >= l.MAX_PINNED_DASHBOARDS) throw new u.CustomDashboardQuotaExceededError("Universe ".concat(e, " is at the pinned-dashboard cap of ").concat(l.MAX_PINNED_DASHBOARDS, ". Unpin one to pin another."));
                    let a = this.clock.isoNow(),
                        i = {
                            ...n.document,
                            isPinned: !0,
                            pinnedAt: a,
                            updatedAt: a
                        };
                    return {
                        next: {
                            ...r,
                            [t]: {
                                document: i,
                                version: n.version + 1
                            }
                        },
                        result: i
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
                return (0, p.suggestDefaultName)(Object.values(t).map(e => e.document.name))
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
                var t, r, n;
                (0, c._)(this, "listeners", new Set), (0, c._)(this, "storageListenerAttached", !1), (0, c._)(this, "disposed", !1), (0, c._)(this, "corruptedByUniverse", new Map), (0, c._)(this, "storageUnreadableByUniverse", new Map), (0, c._)(this, "materialisedByUniverse", new Map), (0, c._)(this, "clock", void 0), (0, c._)(this, "idFactory", void 0), (0, c._)(this, "onPersistError", void 0), (0, c._)(this, "duplicateNameSuffixes", void 0), (0, c._)(this, "handleStorageEvent", e => {
                    if (!e.key) return;
                    let t = function(e) {
                        if (!e.startsWith(eT)) return null;
                        let t = e.slice(eT.length);
                        if (!eE.test(t)) return null;
                        let r = Number(t);
                        return Number.isSafeInteger(r) ? r : null
                    }(e.key);
                    null !== t && (this.materialisedByUniverse.delete(t), this.emit({
                        universeId: t,
                        eventType: "external"
                    }))
                }), this.clock = null != (t = e.clock) ? t : eg, this.onPersistError = e.onPersistError, this.idFactory = null != (r = e.idFactory) ? r : h.defaultIdFactory, this.duplicateNameSuffixes = null != (n = e.duplicateNameSuffixes) ? n : eA
            }
        },
        eV = class {
            list(e, t) {
                return this.inner.list(e, t)
            }
            get(e, t) {
                return this.inner.get(e, t)
            }
            async create(e) {
                throw new u.CustomDashboardNotAvailableError
            }
            async createAndPublish(e) {
                throw new u.CustomDashboardNotAvailableError
            }
            async update(e, t, r, n) {
                throw new u.CustomDashboardNotAvailableError
            }
            async addChartTile(e, t, r, n) {
                throw new u.CustomDashboardNotAvailableError
            }
            async delete(e, t) {
                throw new u.CustomDashboardNotAvailableError
            }
            async duplicate(e, t, r) {
                throw new u.CustomDashboardNotAvailableError
            }
            async publish(e, t, r) {
                throw new u.CustomDashboardNotAvailableError
            }
            async unpublish(e, t) {
                throw new u.CustomDashboardNotAvailableError
            }
            async pin(e, t) {
                throw new u.CustomDashboardNotAvailableError
            }
            async unpin(e, t) {
                throw new u.CustomDashboardNotAvailableError
            }
            suggestDefaultName(e) {
                return this.inner.suggestDefaultName(e)
            }
            getVersion(e, t) {
                return this.inner.getVersion(e, t)
            }
            subscribe(e) {
                return this.inner.subscribe(e)
            }
            dispose() {
                var e, t;
                null == (e = (t = this.inner).dispose) || e.call(t)
            }
            constructor(e) {
                (0, c._)(this, "inner", void 0), this.inner = e
            }
        },
        eO = {
            list: async () => ({
                items: [],
                migrationFailedCount: 0
            }),
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
        };

    function eU() {
        try {
            if (window.localStorage) return new eM
        } catch (e) {}
        return new eC
    }
    let eP = (0, r.createContext)(null);
    e.s(["CustomDashboardServiceProvider", 0, e => {
        let {
            service: n,
            canMutateDashboards: a = !0,
            isApiBacked: i = !1,
            children: o
        } = e, s = (0, r.useRef)(new Map), u = (0, r.useCallback)(e => {
            var t;
            if (n) return n;
            let r = (t = e).isEnabled ? t.isApiBackendEnabled ? t.canSaveCustomDashboards ? "enabled:api:writable" : t.isLocalStorageEnabled ? "enabled:hybrid" : "enabled:api:readonly" : t.isLocalStorageEnabled ? "enabled:localStorage" : "enabled:inMemory" : "disabled",
                a = s.current.get(r);
            if (a) return a;
            let i = function(e) {
                if (!e.isEnabled) return eO;
                if (e.isApiBackendEnabled) {
                    let t = new eu((0, f.createDefaultCustomDashboardsApiClient)());
                    return e.canSaveCustomDashboards ? t : e.isLocalStorageEnabled ? new ey({
                        apiService: t,
                        localService: eU()
                    }) : new eV(t)
                }
                return e.isLocalStorageEnabled ? eU() : new eC
            }(e);
            return s.current.set(r, i), i
        }, [n]), c = null != n ? n : eO;
        (0, r.useEffect)(() => {
            let e = s.current;
            return () => {
                e.forEach(e => {
                    var t;
                    return null == (t = e.dispose) ? void 0 : t.call(e)
                }), e.clear()
            }
        }, []);
        let l = (0, r.useMemo)(() => ({
            service: c,
            isReady: void 0 !== n,
            isApiBacked: !!n && i,
            canMutateDashboards: !!n && a,
            getServiceForConfig: u
        }), [a, u, i, c, n]);
        return (0, t.jsx)(eP.Provider, {
            value: l,
            children: o
        })
    }, "UniverseFlaggedCustomDashboardProvider", 0, e => {
        let {
            children: u
        } = e, c = (0, r.useContext)(eP);
        if (!c) throw Error("UniverseFlaggedCustomDashboardProvider must be used within CustomDashboardServiceProvider.");
        let l = function() {
                let e = (0, n.useRouter)().query.id;
                if ("string" == typeof e) {
                    let t = Number.parseInt(e, 10);
                    if (Number.isFinite(t) && t > 0) return t
                }
                return s.uninitializedUniverseId
            }(),
            {
                canSaveCustomDashboards: d,
                isPending: h,
                isError: m
            } = (0, o.useAnalyticsExperiencePermissions)(l),
            {
                ready: p,
                value: f
            } = (0, a.useFlag)(i.isCustomDashboardsEnabled, {
                universeId: l
            }),
            {
                ready: y,
                value: g
            } = (0, a.useFlag)(i.isCustomDashboardsLocalStorageEnabled),
            {
                ready: v,
                value: b
            } = (0, a.useFlag)(i.isCustomDashboardsApiBackendEnabled, {
                universeId: l
            }),
            A = p && y && v,
            D = !b || l === s.uninitializedUniverseId || !h || m,
            C = (0, r.useMemo)(() => A && D ? {
                isEnabled: f,
                isLocalStorageEnabled: g,
                isApiBackendEnabled: b,
                canSaveCustomDashboards: !m && d
            } : null, [d, A, b, f, g, m, D]),
            w = (0, r.useMemo)(() => C ? c.getServiceForConfig(C) : c.service, [c, C]),
            S = (0, r.useMemo)(() => C ? !!C.isEnabled && (!C.isApiBackendEnabled || C.canSaveCustomDashboards || C.isLocalStorageEnabled) : c.canMutateDashboards, [c.canMutateDashboards, C]),
            T = (0, r.useMemo)(() => {
                var e;
                return {
                    ...c,
                    service: w,
                    isReady: null !== C,
                    isApiBacked: null != (e = null == C ? void 0 : C.isApiBackendEnabled) && e,
                    canMutateDashboards: S
                }
            }, [S, c, C, w]);
        return (0, t.jsx)(eP.Provider, {
            value: T,
            children: u
        })
    }, "useCanMutateCustomDashboards", 0, function() {
        let e = (0, r.useContext)(eP);
        if (!e) throw Error("useCanMutateCustomDashboards() must be used within a CustomDashboardServiceProvider.");
        return e.canMutateDashboards
    }, "useCustomDashboardService", 0, function() {
        let e = (0, r.useContext)(eP);
        if (!e) throw Error("useCustomDashboardService() must be used within a CustomDashboardServiceProvider.");
        return e.service
    }, "useCustomDashboardsBackendState", 0, function() {
        let e = (0, r.useContext)(eP);
        if (!e) throw Error("useCustomDashboardsBackendState() must be used within CustomDashboardServiceProvider.");
        return {
            isReady: e.isReady,
            isApiBacked: e.isApiBacked
        }
    }, "useOptionalCanMutateCustomDashboards", 0, function() {
        var e, t;
        return null != (e = null == (t = (0, r.useContext)(eP)) ? void 0 : t.canMutateDashboards) && e
    }, "useOptionalCustomDashboardService", 0, function() {
        var e, t;
        return null != (e = null == (t = (0, r.useContext)(eP)) ? void 0 : t.service) ? e : null
    }, "useOptionalCustomDashboardsBackendState", 0, function() {
        var e, t;
        let n = (0, r.useContext)(eP);
        return {
            isReady: null != (e = null == n ? void 0 : n.isReady) && e,
            isApiBacked: null != (t = null == n ? void 0 : n.isApiBacked) && t
        }
    }], 479236)
}, 296150, 102716, 377396, 98949, 115232, 646877, e => {
    "use strict";
    var t = e.i(650040),
        r = e.i(318727),
        n = e.i(31611),
        a = e.i(531007),
        i = e.i(36826),
        o = e.i(494315),
        s = e.i(908374),
        u = e.i(545154),
        c = e.i(283561),
        l = e.i(379843);

    function d(e) {
        return "Component" === e.type && "SummaryCard" === e.component.type
    }
    e.s(["isSummaryCardLayoutNode", 0, d], 102716);
    let h = new Set([n.RAQIV2DateRangeType.Last1Hour, n.RAQIV2DateRangeType.Last1Day, n.RAQIV2DateRangeType.Last3Days, n.RAQIV2DateRangeType.Last7Days, n.RAQIV2DateRangeType.Last28Days, n.RAQIV2DateRangeType.Last56Days, n.RAQIV2DateRangeType.Custom]);

    function m(e) {
        return h.has(e)
    }

    function p(e, t) {
        let r = t - e;
        return r >= 0 && r < 48384e5
    }
    e.s(["CUSTOM_DASHBOARD_SAVED_DATE_RANGE_LIMIT_DAYS", 0, 56, "constrainCustomDashboardEditorDateRange", 0, function(e, t) {
        return p(e.getTime(), t.getTime()) ? {
            startDate: e,
            endDate: t
        } : {
            startDate: new Date(t.getTime() - 4752e6),
            endDate: t
        }
    }, "filterSupportedCustomDashboardSavedDateRangeTypes", 0, function(e) {
        return e.filter(m)
    }, "isCustomDashboardSavedDateRangeDurationValid", 0, p, "isSupportedCustomDashboardSavedDateRangeType", 0, m], 377396);
    let f = n.RAQIV2MetricGranularity.OneDay;

    function y(e, t) {
        return n.RAQIV2MetricToSupportedGranularities[e].includes(t === l.CustomDashboardSummaryCardAggregation.Cumulative ? n.RAQIV2MetricGranularity.None : f)
    }

    function g(e, t) {
        return y(e, t) ? t : y(e, l.CustomDashboardSummaryCardAggregation.AverageOverTimePeriod) ? l.CustomDashboardSummaryCardAggregation.AverageOverTimePeriod : y(e, l.CustomDashboardSummaryCardAggregation.Cumulative) ? l.CustomDashboardSummaryCardAggregation.Cumulative : null
    }
    e.s(["SUMMARY_CARD_TIME_SERIES_GRANULARITY", 0, f, "isSummaryCardAggregationSupported", 0, y, "resolveSupportedSummaryCardAggregation", 0, g], 98949);
    var v = e.i(956154);
    let b = /^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(?:\.\d{3})?Z$/;

    function A(e) {
        return "object" == typeof e && null !== e && !Array.isArray(e)
    }

    function D(e, t) {
        if (!A(e)) throw new c.CustomDashboardValidationError(t, "".concat(t, " must be an object."));
        return e
    }

    function C(e, t) {
        if ("string" != typeof e) throw new c.CustomDashboardValidationError(t, "".concat(t, " must be a string."));
        return e
    }

    function w(e, t) {
        let r = C(e, t);
        if (0 === r.length) throw new c.CustomDashboardValidationError(t, "".concat(t, " must be non-empty."));
        return r
    }

    function S(e, t) {
        if ("number" != typeof e || !Number.isFinite(e)) throw new c.CustomDashboardValidationError(t, "".concat(t, " must be a finite number."));
        return e
    }

    function T(e, t) {
        if ("boolean" == typeof e) return e;
        if (void 0 === e) return;
        let r = D(e, t);
        return {
            relativeOffset: function(e, t) {
                if (void 0 !== e) {
                    if ("string" == typeof e && v.ComparisonOffset.some(t => t === e)) return e;
                    throw new c.CustomDashboardValidationError(t, "".concat(t, " must be a valid comparison offset."))
                }
            }(r.relativeOffset, "".concat(t, ".relativeOffset")),
            customStartTimeMs: function(e, t) {
                if (void 0 !== e) return S(e, t)
            }(r.customStartTimeMs, "".concat(t, ".customStartTimeMs"))
        }
    }

    function E(e, t) {
        if ("boolean" != typeof e) throw new c.CustomDashboardValidationError(t, "".concat(t, " must be a boolean."));
        return e
    }

    function R(e, t) {
        let r = C(e, t),
            n = Date.parse(r);
        if (!b.test(r) || !Number.isFinite(n)) throw new c.CustomDashboardValidationError(t, "".concat(t, " must be an ISO-8601 timestamp."));
        return r
    }

    function I(e) {
        return (t, r) => {
            let n;
            return null != t && (n = e(t, r)), n
        }
    }
    let _ = I(R),
        N = I(w),
        M = I(E);

    function V(e) {
        return e.trim()
    }
    e.s(["asBoolean", 0, E, "asIsoTimestamp", 0, R, "asNonEmptyString", 0, w, "asNumber", 0, S, "asOptionalIsoTimestamp", 0, _, "asOptionalNonEmptyString", 0, N, "asRecord", 0, D, "asString", 0, C, "isRecord", 0, A, "optional", 0, I, "trimmed", 0, V, "validateOptionalBoolean", 0, M, "validatePreviousPeriodOverlay", 0, T], 115232);
    let O = new Set([l.CustomDashboardSummaryCardAggregation.AverageOverTimePeriod, l.CustomDashboardSummaryCardAggregation.MostRecentDataPoint, l.CustomDashboardSummaryCardAggregation.Total, n.RAQIV2AggregationType.Average, n.RAQIV2AggregationType.AveragePerUser, n.RAQIV2AggregationType.Count, n.RAQIV2AggregationType.CountUser, n.RAQIV2AggregationType.Max, n.RAQIV2AggregationType.Min, n.RAQIV2AggregationType.Sum, l.CustomDashboardSummaryCardAggregation.Median, l.CustomDashboardSummaryCardAggregation.Cumulative, n.RAQIV2PercentileType.AVG, n.RAQIV2PercentileType.P10, n.RAQIV2PercentileType.P50, n.RAQIV2PercentileType.P90]),
        U = new Set([n.RAQIV2AggregationType.Average, n.RAQIV2AggregationType.AveragePerUser, n.RAQIV2AggregationType.Count, n.RAQIV2AggregationType.CountUser, n.RAQIV2AggregationType.Max, n.RAQIV2AggregationType.Min, n.RAQIV2AggregationType.Sum, n.RAQIV2PercentileType.AVG, n.RAQIV2PercentileType.P10, n.RAQIV2PercentileType.P50, n.RAQIV2PercentileType.P90]),
        P = new Set(["Cumulative", "Day", "Week", "Hour", "HalfHour", "Minute"]),
        k = new Set(l.CUSTOM_DASHBOARD_CHART_TYPES),
        B = new Set(["draft", "published"]),
        x = /^Percentile\d+$/,
        H = new Set(Object.values(n.RAQIV2DateRangeType)),
        G = Object.values(n.RAQIV2Dimension),
        Q = Object.values(n.RAQIV2UIPseudoDimension),
        L = Object.values(n.RAQIV2MetricGranularity),
        F = Object.values(i.AnnotationType),
        K = n.RAQIV2UIPseudoDimension.PercentileType,
        j = n.RAQIV2UIPseudoDimension.AggregationType,
        z = n.RAQIV2UIPseudoDimension.LatestPlaceVersion,
        Y = new Set(Object.values(n.RAQIV2AggregationType)),
        q = new Set(Object.values(n.RAQIV2PercentileType));

    function X(e, t) {
        for (let r of e)
            if (r === t) return !0;
        return !1
    }

    function W(e) {
        return G.includes(e) || Q.includes(e)
    }

    function $(e) {
        return G.includes(e)
    }

    function J(e) {
        return $(e) || e === z || e === K || e === j
    }

    function Z(e) {
        return F.includes(e)
    }

    function ee(e) {
        return X(U, e) || x.test(e)
    }

    function et(e) {
        return "string" == typeof e && H.has(e)
    }

    function er(e) {
        return "string" == typeof e && X(Y, e)
    }

    function en(e) {
        return "string" == typeof e && X(q, e)
    }

    function ea(e) {
        return (0, s.isNumericUIMetric)(e)
    }

    function ei(e) {
        return "string" == typeof e && e.length > 0
    }
    let eo = I(function(e, t) {
            let r = C(e, t);
            if (!ee(r)) throw new c.CustomDashboardValidationError(t, "".concat(t, ' "').concat(r, '" is not a known chart aggregation.'));
            return r
        }),
        es = I(function(e, t) {
            if ("none" !== e && "weekly" !== e) throw new c.CustomDashboardValidationError(t, "".concat(t, ' must be "none" or "weekly".'));
            return e
        }),
        eu = I(function(e, t) {
            let r = C(e, t);
            if (r !== l.SummaryCardTitleSource.Auto && r !== l.SummaryCardTitleSource.Custom) throw new c.CustomDashboardValidationError(t, "".concat(t, ' must be "Auto" or "Custom".'));
            return r
        });

    function ec(e, t) {
        let r = D(e, t),
            n = w(r.pseudoDimensionKey, "".concat(t, ".pseudoDimensionKey"));
        if (n !== K && n !== j) throw new c.CustomDashboardValidationError("".concat(t, ".pseudoDimensionKey"), "".concat(t, ".pseudoDimensionKey must be a supported pseudo-dimension key."));
        let a = w(r.variantKey, "".concat(t, ".variantKey"));
        if (n === K && !en(a)) throw new c.CustomDashboardValidationError("".concat(t, ".variantKey"), "".concat(t, ".variantKey must be a known RAQI percentile for PercentileType."));
        if (n === j && !er(a)) throw new c.CustomDashboardValidationError("".concat(t, ".variantKey"), "".concat(t, ".variantKey must be a known RAQI aggregation for AggregationType."));
        return {
            pseudoDimensionKey: n,
            variantKey: a
        }
    }

    function el(e, t) {
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

    function ed(e) {
        let t = el(V(e), "name");
        if (0 === t.length) throw new c.CustomDashboardValidationError("name", "Dashboard name is required.");
        if (t.length > l.MAX_DASHBOARD_NAME_LENGTH) throw new c.CustomDashboardValidationError("name", "Dashboard name cannot exceed ".concat(l.MAX_DASHBOARD_NAME_LENGTH, " characters."));
        return t
    }

    function eh(e) {
        if (void 0 === e) return;
        let t = el(V(e), "description");
        if (t.length > l.MAX_DASHBOARD_DESCRIPTION_LENGTH) throw new c.CustomDashboardValidationError("description", "Description cannot exceed ".concat(l.MAX_DASHBOARD_DESCRIPTION_LENGTH, " characters."));
        return 0 === t.length ? void 0 : t
    }

    function em(e, t) {
        if (null == e) return [];
        if (!Array.isArray(e)) throw new c.CustomDashboardValidationError(t, "".concat(t, " must be an array."));
        return e.map((e, r) => {
            let n = D(e, "".concat(t, "[").concat(r, "]")),
                a = el(w(n.dimension, "".concat(t, "[").concat(r, "].dimension")), "".concat(t, "[").concat(r, "].dimension")),
                {
                    values: i
                } = n;
            if (!Array.isArray(i) || 0 === i.length || !i.every(ei)) throw new c.CustomDashboardValidationError("".concat(t, "[").concat(r, "].values"), "".concat(t, "[").concat(r, "].values must be a non-empty array of non-empty strings."));
            return {
                dimension: a,
                values: i.map((e, n) => el(e, "".concat(t, "[").concat(r, "].values[").concat(n, "]")))
            }
        })
    }

    function ep(e, t) {
        if (null == e) throw new c.CustomDashboardValidationError(t, "".concat(t, " must be an array."));
        return em(e, t)
    }

    function ef(e, t) {
        if (null == e) return;
        let r = el(V(C(e, t)), t);
        if (r.length > l.MAX_TILE_TITLE_LENGTH) throw new c.CustomDashboardValidationError(t, "Tile title cannot exceed ".concat(l.MAX_TILE_TITLE_LENGTH, " characters."));
        return 0 === r.length ? void 0 : r
    }

    function ey(e, t) {
        if (null == e) return;
        if (!Array.isArray(e)) throw new c.CustomDashboardValidationError(t, "".concat(t, " must be an array."));
        let r = e.map((e, r) => {
            let n = w(e, "".concat(t, "[").concat(r, "]"));
            if (!$(n)) throw new c.CustomDashboardValidationError("".concat(t, "[").concat(r, "]"), "".concat(t, "[").concat(r, "] must be a canonical RAQI dimension."));
            return n
        });
        return r.length > 0 ? r : void 0
    }

    function eg(e, t) {
        if (null == e) return;
        if (!Array.isArray(e)) throw new c.CustomDashboardValidationError(t, "".concat(t, " must be an array."));
        let r = e.map((e, r) => {
            let n = w(e, "".concat(t, "[").concat(r, "]"));
            if (!Z(n)) throw new c.CustomDashboardValidationError("".concat(t, "[").concat(r, "]"), "".concat(t, "[").concat(r, "] must be a known annotation type."));
            return n
        });
        return r.length > 0 ? r : void 0
    }

    function ev(e, t) {
        let r, n = D(e, t),
            a = (r = eA(n.variantSelections, "".concat(t, ".variantSelections"), ec)).length > 0 ? r : void 0;
        if (void 0 !== n.metricKey && null !== n.metricKey && void 0 !== n.computedMetric && null !== n.computedMetric) throw new c.CustomDashboardValidationError(t, "".concat(t, " must not include both metricKey and computedMetric."));
        return void 0 !== n.computedMetric && null !== n.computedMetric ? {
            computedMetric: function(e, t) {
                if (! function(e) {
                        if (!A(e)) return !1;
                        let {
                            sources: t,
                            formula: r,
                            name: n,
                            l7Smoothing: a
                        } = e;
                        return !!Array.isArray(t) && 0 !== t.length && "string" == typeof r && 0 !== r.trim().length && (void 0 === n || "string" == typeof n) && (void 0 === a || "boolean" == typeof a) && t.every(e => A(e) && "string" == typeof e.key && e.key.length > 0 && void 0 !== e.metric)
                    }(e)) throw new c.CustomDashboardValidationError(t, "".concat(t, " must be a computed metric object."));
                let r = (0, u.serializeComputedMetricToQueryParam)(e),
                    n = (0, u.deserializeComputedMetricFromQueryParam)(r);
                if (!r || !n) throw new c.CustomDashboardValidationError(t, "".concat(t, " is not a supported computed metric."));
                return n
            }(n.computedMetric, "".concat(t, ".computedMetric")),
            variantSelections: a
        } : {
            metricKey: function(e, t) {
                let r = C(e, t);
                if (!ea(r)) throw new c.CustomDashboardValidationError(t, "".concat(t, ' "').concat(r, '" is not a known RAQI metric.'));
                return r
            }(n.metricKey, "".concat(t, ".metricKey")),
            variantSelections: a
        }
    }

    function eb(e, t) {
        let r = D(e, t);
        return {
            metric: ev(r.metric, "".concat(t, ".metric")),
            seriesKey: el(w(r.seriesKey, "".concat(t, ".seriesKey")), "".concat(t, ".seriesKey")),
            displayName: void 0 !== r.displayName && null !== r.displayName ? el(V(C(r.displayName, "".concat(t, ".displayName"))), "".concat(t, ".displayName")) : void 0,
            aggregation: eo(r.aggregation, "".concat(t, ".aggregation"))
        }
    }

    function eA(e, t, r) {
        if (null == e) return [];
        if (!Array.isArray(e)) throw new c.CustomDashboardValidationError(t, "".concat(t, " must be an array."));
        return e.map((e, n) => r(e, "".concat(t, "[").concat(n, "]")))
    }

    function eD(e, t) {
        let r = D(e, t);
        if ("Component" === r.type) {
            let e = D(r.component, "".concat(t, ".component"));
            if ("Chart" === e.type) return {
                type: "Component",
                component: {
                    type: "Chart",
                    chart: function(e, t) {
                        let r = D(e, t);
                        if ("Chart" !== r.type) throw new c.CustomDashboardValidationError("".concat(t, ".type"), "".concat(t, '.type must be "Chart".'));
                        return function(e, t) {
                            let r = D(e.dataSpec, "".concat(t, ".dataSpec")),
                                n = D(e.chartSpec, "".concat(t, ".chartSpec")),
                                i = C(n.chartType, "".concat(t, ".chartSpec.chartType"));
                            if (!X(k, i)) throw new c.CustomDashboardValidationError("".concat(t, ".chartSpec.chartType"), "".concat(t, '.chartSpec.chartType "').concat(i, '" is not supported.'));
                            let s = A(n.overlays) ? n.overlays : void 0,
                                u = s ? {
                                    genreBenchmark: M(s.genreBenchmark, "".concat(t, ".chartSpec.overlays.genreBenchmark")),
                                    similarExperienceBenchmark: M(s.similarExperienceBenchmark, "".concat(t, ".chartSpec.overlays.similarExperienceBenchmark")),
                                    topExperienceBenchmark: M(s.topExperienceBenchmark, "".concat(t, ".chartSpec.overlays.topExperienceBenchmark")),
                                    previousPeriod: T(s.previousPeriod, "".concat(t, ".chartSpec.overlays.previousPeriod")),
                                    quota: M(s.quota, "".concat(t, ".chartSpec.overlays.quota"))
                                } : void 0,
                                l = eA(r.metrics, "".concat(t, ".dataSpec.metrics"), eb),
                                d = i === a.ChartType.Table;
                            if (!d && 1 !== l.length) throw new c.CustomDashboardValidationError("".concat(t, ".dataSpec.metrics"), "".concat(t, ".dataSpec.metrics must contain exactly one metric."));
                            if (d && (l.length < 1 || l.length > o.MAX_TABLE_METRIC_COLUMNS)) throw new c.CustomDashboardValidationError("".concat(t, ".dataSpec.metrics"), "".concat(t, ".dataSpec.metrics must contain between 1 and ").concat(o.MAX_TABLE_METRIC_COLUMNS, " metrics for table charts."));
                            let h = r.breakdownDimensions,
                                m = null == h ? void 0 : eA(h, "".concat(t, ".dataSpec.breakdownDimensions"), (e, t) => {
                                    var r;
                                    let n = null != (r = N(e, t)) ? r : "";
                                    if (n.length > 0 && !J(n)) throw new c.CustomDashboardValidationError(t, "".concat(t, " must be a persistable breakdown dimension."));
                                    return n
                                }).filter(e => e.length > 0);
                            return {
                                type: "Chart",
                                tileId: w(e.tileId, "".concat(t, ".tileId")),
                                title: ef(e.title, "".concat(t, ".title")),
                                dataSpec: {
                                    metrics: l,
                                    aggregation: eo(r.aggregation, "".concat(t, ".dataSpec.aggregation")),
                                    breakdownDimensions: m,
                                    granularity: function(e, t) {
                                        let r = C(e, t);
                                        if (!X(P, r)) throw new c.CustomDashboardValidationError(t, "".concat(t, ' "').concat(r, '" is not a known time interval.'));
                                        return r
                                    }(r.granularity, "".concat(t, ".dataSpec.granularity")),
                                    filters: ep(r.filters, "".concat(t, ".dataSpec.filters"))
                                },
                                chartSpec: {
                                    chartType: i,
                                    overlays: u,
                                    smoothing: es(n.smoothing, "".concat(t, ".chartSpec.smoothing"))
                                }
                            }
                        }(r, t)
                    }(e.chart, "".concat(t, ".component.chart"))
                }
            };
            if ("SummaryCard" === e.type) return {
                type: "Component",
                component: {
                    type: "SummaryCard",
                    summaryCard: function(e, t) {
                        let r = D(e, t);
                        if ("SummaryCard" !== r.type) throw new c.CustomDashboardValidationError("".concat(t, ".type"), "".concat(t, '.type must be "SummaryCard".'));
                        let n = A(r.overlays) ? r.overlays : void 0,
                            a = ev(r.metric, "".concat(t, ".metric")),
                            i = function(e, t) {
                                let r = C(e, t);
                                if (!(X(O, r) || x.test(r))) throw new c.CustomDashboardValidationError(t, "".concat(t, ' "').concat(r, '" is not a known summary-card aggregation.'));
                                return r
                            }(r.aggregation, "".concat(t, ".aggregation")),
                            o = a.metricKey ? g(a.metricKey, i) : i;
                        if (!o) throw new c.CustomDashboardValidationError("".concat(t, ".aggregation"), "".concat(t, ".aggregation is not supported by the selected metric."));
                        return {
                            type: "SummaryCard",
                            tileId: w(r.tileId, "".concat(t, ".tileId")),
                            title: ef(r.title, "".concat(t, ".title")),
                            titleSource: eu(r.titleSource, "".concat(t, ".titleSource")),
                            metric: a,
                            aggregation: o,
                            overlays: n ? {
                                periodOverPeriod: M(n.periodOverPeriod, "".concat(t, ".overlays.periodOverPeriod"))
                            } : void 0,
                            filters: ep(r.filters, "".concat(t, ".filters"))
                        }
                    }(e.summaryCard, "".concat(t, ".component.summaryCard"))
                }
            };
            throw new c.CustomDashboardValidationError("".concat(t, ".component.type"), "".concat(t, '.component.type must be "Chart" or "SummaryCard".'))
        }
        if ("Grid" === r.type) {
            let e = r.columnCount;
            if (1 !== e && 2 !== e) throw new c.CustomDashboardValidationError("".concat(t, ".columnCount"), "".concat(t, ".columnCount must be 1 or 2."));
            let n = eA(r.children, "".concat(t, ".children"), eD);
            if (0 === n.length || n.length > e && !n.every(d)) throw new c.CustomDashboardValidationError("".concat(t, ".children"), "".concat(t, ".children must contain between 1 and ").concat(e, " child node(s)."));
            return {
                type: "Grid",
                columnCount: e,
                children: n
            }
        }
        if ("Flex" === r.type || "Stack" === r.type) return {
            type: r.type,
            children: eA(r.children, "".concat(t, ".children"), eD)
        };
        throw new c.CustomDashboardValidationError("".concat(t, ".type"), "".concat(t, '.type must be "Component", "Grid", "Flex", or "Stack".'))
    }

    function eC(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
            {
                enforceTileCaps: r = !0
            } = t,
            a = D(e, "config"),
            i = D(a.page, "config.page");
        if (i.mode !== l.DashboardPageMode.Untabbed) throw new c.CustomDashboardValidationError("config.page.mode", 'config.page.mode must be "Untabbed" in v1.');
        let o = D(i.surface, "config.page.surface"),
            s = eA(o.bodyNodes, "config.page.surface.bodyNodes", eD),
            u = new Set,
            d = 0,
            h = 0,
            f = (e, t, r) => {
                if (u.has(e)) throw new c.CustomDashboardValidationError(r, 'Duplicate tileId "'.concat(e, '".'));
                u.add(e), "Chart" === t ? h += 1 : d += 1
            };
        if (s.forEach((e, t) => (function e(t, r, n) {
                "Component" === t.type ? r("Chart" === t.component.type ? t.component.chart.tileId : t.component.summaryCard.tileId, t.component.type, "".concat(n, ".component.").concat("Chart" === t.component.type ? "chart" : "summaryCard", ".tileId")) : t.children.forEach((t, a) => e(t, r, "".concat(n, ".children[").concat(a, "]")))
            })(e, f, "config.page.surface.bodyNodes[".concat(t, "]"))), r) {
            if (d > l.MAX_SUMMARY_CARDS_PER_DASHBOARD) throw new c.CustomDashboardValidationError("config.page.surface.bodyNodes", "A dashboard may have at most ".concat(l.MAX_SUMMARY_CARDS_PER_DASHBOARD, " summary cards."));
            if (h > l.MAX_CHART_TILES_PER_DASHBOARD) throw new c.CustomDashboardValidationError("config.page.surface.bodyNodes", "A dashboard may have at most ".concat(l.MAX_CHART_TILES_PER_DASHBOARD, " chart tiles."))
        }
        return {
            page: {
                mode: l.DashboardPageMode.Untabbed,
                surface: {
                    controls: function(e, t) {
                        let r;
                        if (null == e) return {};
                        let a = D(e, t);
                        return {
                            timeRangeOptions: function(e, t) {
                                if (null == e) return;
                                let r = D(e, t);
                                if ("None" === r.type) return {
                                    type: "None"
                                };
                                if ("DateRange" !== r.type) throw new c.CustomDashboardValidationError("".concat(t, ".type"), "".concat(t, '.type must be "None" or "DateRange".'));
                                return {
                                    type: "DateRange",
                                    defaultSelection: function(e, t) {
                                        if (null == e) return;
                                        let r = D(e, t);
                                        if ("Relative" === r.type) {
                                            if (!et(r.rangeType) || r.rangeType === n.RAQIV2DateRangeType.Custom) throw new c.CustomDashboardValidationError("".concat(t, ".rangeType"), "".concat(t, ".rangeType must be a preset date range."));
                                            if (!m(r.rangeType)) throw new c.CustomDashboardValidationError("".concat(t, ".rangeType"), "".concat(t, ".rangeType must span less than ").concat(56, " days."));
                                            return {
                                                type: "Relative",
                                                rangeType: r.rangeType
                                            }
                                        }
                                        if ("Custom" === r.type) {
                                            let e = S(r.startTimeMs, "".concat(t, ".startTimeMs")),
                                                n = S(r.endTimeMs, "".concat(t, ".endTimeMs"));
                                            if (e > n) throw new c.CustomDashboardValidationError(t, "".concat(t, " custom startTimeMs must be before endTimeMs."));
                                            if (!p(e, n)) throw new c.CustomDashboardValidationError(t, "".concat(t, " custom date range must span less than ").concat(56, " days."));
                                            return {
                                                type: "Custom",
                                                startTimeMs: e,
                                                endTimeMs: n
                                            }
                                        }
                                        throw new c.CustomDashboardValidationError("".concat(t, ".type"), "".concat(t, '.type must be "Relative" or "Custom".'))
                                    }(r.defaultSelection, "".concat(t, ".defaultSelection"))
                                }
                            }(a.timeRangeOptions, "".concat(t, ".timeRangeOptions")),
                            filterDimensions: ey(a.filterDimensions, "".concat(t, ".filterDimensions")),
                            defaultFilters: (r = em(a.defaultFilters, "".concat(t, ".defaultFilters"))).length > 0 ? r : void 0,
                            breakdownDimensions: ey(a.breakdownDimensions, "".concat(t, ".breakdownDimensions")),
                            defaultBreakdown: function(e, t) {
                                if (null == e) return;
                                if (!Array.isArray(e)) throw new c.CustomDashboardValidationError(t, "".concat(t, " must be an array."));
                                let r = e.map((e, r) => {
                                    let n = w(e, "".concat(t, "[").concat(r, "]"));
                                    if (!W(n)) throw new c.CustomDashboardValidationError("".concat(t, "[").concat(r, "]"), "".concat(t, "[").concat(r, "] must be a known RAQI dimension."));
                                    return n
                                });
                                return r.length > 0 ? r : void 0
                            }(a.defaultBreakdown, "".concat(t, ".defaultBreakdown")),
                            defaultGranularity: function(e, t) {
                                if (null == e) return;
                                let r = w(e, t);
                                if (!L.includes(r)) throw new c.CustomDashboardValidationError(t, "".concat(t, " must be a known granularity."));
                                return r
                            }(a.defaultGranularity, "".concat(t, ".defaultGranularity")),
                            annotationOptions: function(e, t) {
                                var r, n;
                                if (null == e) return;
                                let a = D(e, t);
                                return {
                                    supportedAnnotationTypes: null != (r = eg(a.supportedAnnotationTypes, "".concat(t, ".supportedAnnotationTypes"))) ? r : [],
                                    defaultAnnotationTypes: null != (n = eg(a.defaultAnnotationTypes, "".concat(t, ".defaultAnnotationTypes"))) ? n : [],
                                    showAnnotationsControl: void 0 === a.showAnnotationsControl || null === a.showAnnotationsControl || E(a.showAnnotationsControl, "".concat(t, ".showAnnotationsControl"))
                                }
                            }(a.annotationOptions, "".concat(t, ".annotationOptions"))
                        }
                    }(o.controls, "config.page.surface.controls"),
                    bodyNodes: s
                }
            }
        }
    }
    e.s(["isCanonicalRAQIV2Dimension", 0, $, "isChartAggregation", 0, ee, "isDateRangeType", 0, et, "isDefaultAnnotationType", 0, Z, "isDefaultBreakdownDimension", 0, W, "isMetricKey", 0, ea, "isPersistableBreakdownDimension", 0, J, "isRAQIV2AggregationType", 0, er, "isRAQIV2PercentileType", 0, en, "validateCustomDashboardConfig", 0, eC, "validateCustomDashboardDocument", 0, function(e) {
        let t, r = D(e, "document");
        if (r.schemaVersion !== l.CUSTOM_DASHBOARD_CURRENT_SCHEMA_VERSION) throw new c.CustomDashboardValidationError("schemaVersion", "schemaVersion must equal ".concat(l.CUSTOM_DASHBOARD_CURRENT_SCHEMA_VERSION, " (got ").concat(String(r.schemaVersion), "). Run applyMigrations first."));
        let {
            status: n
        } = r;
        if (!("string" == typeof n && X(B, n))) throw new c.CustomDashboardValidationError("status", 'status must be "draft" or "published".');
        void 0 !== r.description && null !== r.description && (t = eh(C(r.description, "description")));
        let a = E(r.isPinned, "isPinned"),
            i = a ? _(r.pinnedAt, "pinnedAt") : void 0;
        if (void 0 === r.config || null === r.config) throw new c.CustomDashboardValidationError("config", "config is required. Service-layer create() must substitute EMPTY_DASHBOARD_CONFIG before validation.");
        return {
            id: w(r.id, "id"),
            schemaVersion: l.CUSTOM_DASHBOARD_CURRENT_SCHEMA_VERSION,
            universeId: S(r.universeId, "universeId"),
            name: ed(C(r.name, "name")),
            description: t,
            status: n,
            isPinned: a,
            pinnedAt: i,
            createdAt: R(r.createdAt, "createdAt"),
            updatedAt: R(r.updatedAt, "updatedAt"),
            publishedAt: _(r.publishedAt, "publishedAt"),
            createdByUserId: S(r.createdByUserId, "createdByUserId"),
            createdByUsername: w(r.createdByUsername, "createdByUsername"),
            updatedByUserId: I(S)(r.updatedByUserId, "updatedByUserId"),
            updatedByUsername: I(w)(r.updatedByUsername, "updatedByUsername"),
            config: eC(r.config, {
                enforceTileCaps: !1
            })
        }
    }, "validateDashboardDescription", 0, eh, "validateDashboardName", 0, ed], 646877), e.s(["addChartTileToConfig", 0, function(e) {
        let {
            config: n,
            tile: a,
            nextTileId: i
        } = e, o = {
            ...a,
            tileId: i
        };
        return {
            config: eC((0, t.withChartRows)(n, [...(0, t.getChartRows)(n), (0, r.singleTileRow)(o)])),
            tile: o
        }
    }], 296150)
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
        let u = function(e) {
            var r;
            for (let n of null != (r = e.variantSelections) ? r : [])
                if (n.pseudoDimensionKey === i && (0, a.isValidEnumValue)(t.RAQIV2AggregationType, n.variantKey) || n.pseudoDimensionKey === o && (0, a.isValidEnumValue)(t.RAQIV2PercentileType, n.variantKey)) return n.variantKey
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
}, 593431, 10560, 852209, 482922, 302610, e => {
    "use strict";
    e.s(["sortDashboardsForList", 0, function(e) {
        return e.toSorted((e, t) => e.isPinned !== t.isPinned ? e.isPinned ? -1 : 1 : e.updatedAt !== t.updatedAt ? e.updatedAt < t.updatedAt ? 1 : -1 : e.id === t.id ? 0 : e.id < t.id ? -1 : 1)
    }], 593431);
    var t = e.i(379843);

    function r(e) {
        return e.length > t.MAX_DASHBOARD_NAME_LENGTH ? e.slice(0, t.MAX_DASHBOARD_NAME_LENGTH) : e
    }

    function n(e, r) {
        let n = t.MAX_DASHBOARD_NAME_LENGTH - r.length;
        return n <= 0 ? "" : e.length > n ? e.slice(0, n) : e
    }

    function a(e, t) {
        let r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 1,
            n = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : 1e3,
            a = new Set(Array.from(e, e => e.trim())),
            i = Math.max(1, r),
            o = 0;
        for (; a.has(t(i)) && o < n;) i += 1, o += 1;
        return t(i)
    }
    e.s(["DUPLICATE_COPY_NUMBERED_SUFFIX_START", 0, 2, "buildDuplicateDashboardName", 0, function(e, t, i) {
        let o = new Set(Array.from(e, e => e.trim())),
            s = " ".concat(i.first),
            u = "".concat(n(t, s)).concat(s);
        return o.has(u) ? r(a(e, e => {
            let r = " ".concat(i.numbered(e));
            return "".concat(n(t, r)).concat(r)
        }, 2, 1e3)) : u
    }, "clipDashboardName", 0, r, "findUnusedNumberedName", 0, a, "suggestDefaultName", 0, function(e) {
        return r(a(e, e => "Dashboard #".concat(e)))
    }], 10560);
    var i = e.i(721281),
        o = e.i(619130),
        s = e.i(650502);
    let u = (0, o.default)({
        baseUrl: (0, s.getBEDEV2ServiceBasePath)("analytics-custom-dashboards"),
        credentials: "include",
        enableMrRouter: !0
    });
    class c extends Error {
        constructor(e, t, r) {
            super(t), (0, i._)(this, "status", void 0), (0, i._)(this, "body", void 0), this.name = "CustomDashboardsApiRequestError", this.status = e, this.body = r
        }
    }

    function l(e) {
        let t = {};
        return void 0 !== e.name && (t.name = e.name), void 0 !== e.description && (t.description = e.description), void 0 !== e.isPinned && (t.isPinned = e.isPinned), t
    }

    function d(e) {
        return "object" == typeof e && null !== e && !Array.isArray(e)
    }

    function h(e, t) {
        var r, n, a, i;
        let o = null != (r = null == e ? void 0 : e.status) ? r : 0,
            s = function(e) {
                if (!d(e)) return;
                let {
                    code: t,
                    message: r,
                    error: n,
                    details: a
                } = e, i = function(e) {
                    if (!d(e)) return;
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
            u = null != (n = null != (a = null == s ? void 0 : s.message) ? a : null == s || null == (i = s.error) ? void 0 : i.message) ? n : "HTTP ".concat(o);
        throw new c(o, u, s)
    }
    e.s(["CustomDashboardsApiRequestError", 0, c, "createDefaultCustomDashboardsApiClient", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : u;
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
                return (a || !n) && h(i, a), n
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
                return (o || !i) && h(s, o), null != (r = i.dashboard) ? r : {}
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
                        name: a,
                        description: i,
                        document: o
                    }
                });
                return (u || !s) && h(c, u), null != (r = s.dashboard) ? r : {}
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
                    error: u,
                    response: c
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
                        patch: l(o)
                    }
                });
                return (u || !s) && h(c, u), null != (r = s.metadata) ? r : {}
            },
            async publishDashboard(t) {
                var r;
                let {
                    universeId: n,
                    dashboardId: a,
                    expectedHeadEtag: i,
                    document: o,
                    metadataPatch: s
                } = t, u = void 0 === s ? void 0 : l(s), c = {
                    universeId: n,
                    dashboardId: a,
                    expectedHeadEtag: i,
                    document: o,
                    ...void 0 !== u && Object.keys(u).length > 0 ? {
                        metadataPatch: u
                    } : {}
                }, {
                    data: d,
                    error: m,
                    response: p
                } = await e.POST("/v1/universes/{universeId}/custom-dashboards/{dashboardId}/publish", {
                    params: {
                        path: {
                            universeId: n,
                            dashboardId: a
                        }
                    },
                    body: c
                });
                return (m || !d) && h(p, m), null != (r = d.dashboard) ? r : {}
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
                    error: u,
                    response: c
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
                return (u || !s) && h(c, u), null != (r = s.dashboard) ? r : {}
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
                a && h(i, a)
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
                if ((o || !i) && h(s, o), "boolean" != typeof i.isFiltered) {
                    var u;
                    throw new c(null != (u = null == s ? void 0 : s.status) ? u : 0, "Response is missing isFiltered")
                }
                return {
                    isFiltered: i.isFiltered
                }
            }
        }
    }], 852209);
    var m = e.i(283561);
    e.s(["mapCustomDashboardsApiError", 0, function(e, t) {
        var r, n, a, i, o, s, u, l, d;
        if (e instanceof m.CustomDashboardServiceError) return e;
        if (!(e instanceof c)) return new m.CustomDashboardStorageWriteError(e);
        let h = null != (i = null != (o = null == (s = e.body) ? void 0 : s.message) ? o : null == (l = e.body) || null == (u = l.error) ? void 0 : u.message) ? i : e.message,
            p = (null != (d = "".concat(null != h ? h : "", " ").concat(null != (r = null == (a = e.body) || null == (n = a.error) ? void 0 : n.status) ? r : "")) ? d : "").toUpperCase().replaceAll("-", "_");
        return 404 === e.status || p.includes("NOT_FOUND") ? new m.CustomDashboardNotFoundError(null != t ? t : "unknown") : 409 === e.status || p.includes("VERSION_CONFLICT") || p.includes("CONFLICT") ? new m.CustomDashboardVersionConflictError(null != t ? t : "unknown") : 429 === e.status || p.includes("QUOTA_EXCEEDED") || p.includes("RESOURCE_EXHAUSTED") ? new m.CustomDashboardQuotaExceededError(h) : 401 === e.status || p.includes("UNAUTHENTICATED") ? new m.CustomDashboardUnauthenticatedError(h) : 403 === e.status || p.includes("PERMISSION_DENIED") ? new m.CustomDashboardPermissionDeniedError(h) : 400 === e.status || p.includes("VALIDATION_FAILED") || p.includes("INVALID_ARGUMENT") ? new m.CustomDashboardValidationError("document", null != h ? h : "Invalid custom dashboard.") : 503 === e.status || p.includes("UNAVAILABLE") ? new m.CustomDashboardNotAvailableError : new m.CustomDashboardStorageWriteError(e)
    }], 482922);
    var p = e.i(36826);
    let f = {
        supportedAnnotationTypes: [p.AnnotationType.PlaceIcon, p.AnnotationType.PlaceThumbnail, p.AnnotationType.PlaceVideo, p.AnnotationType.PlaceVersion, p.AnnotationType.Benchmark, p.AnnotationType.LiveEvent, p.AnnotationType.CustomMatchmaking, p.AnnotationType.RetentionCorhortDisclaimer, p.AnnotationType.ConfigVersion, p.AnnotationType.Announcement],
        defaultAnnotationTypes: [],
        showAnnotationsControl: !0
    };
    e.s(["CUSTOM_DASHBOARD_SURFACE_ANNOTATION_OPTIONS", 0, f, "resolveCustomDashboardSupportedAnnotationTypes", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [],
            t = f.supportedAnnotationTypes,
            r = e.filter(e => !t.includes(e));
        return 0 === r.length ? [...t] : [...t, ...r]
    }], 302610)
}]);

//# debugId=89008704-49fa-f185-d0f8-9850e5aa814c
//# sourceMappingURL=0gxk1a_1hli8w.js.map