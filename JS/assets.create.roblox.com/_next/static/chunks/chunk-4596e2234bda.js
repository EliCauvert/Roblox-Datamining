;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "659491bd-cc8f-6474-f2e7-2dea642ccbb3")
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
}, 805386, e => {
    "use strict";
    e.s(["MAX_TABLE_METRIC_COLUMNS", 0, 8])
}, 834046, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(157310),
        n = e.i(252842),
        a = e.i(704066),
        i = e.i(533968);
    let o = {
            experienceHasPerformanceMonitoringAccess: !1,
            userCanViewAnalyticsForUniverse: !1,
            userCanManageAnalyticsAlertForUniverse: !1,
            canSaveCustomDashboards: !1,
            experienceHasExperimentationMinDau: !1,
            experienceHasNoInGameExperiment: !1,
            experienceHasInsightsAccess: !1
        },
        s = e => ({
            experienceHasPerformanceMonitoringAccess: !0 === e.experienceHasPerformanceMonitoringAccess,
            userCanViewAnalyticsForUniverse: !0 === e.userCanViewAnalyticsForUniverse,
            userCanManageAnalyticsAlertForUniverse: !0 === e.userCanManageAnalyticsAlertForUniverse,
            canSaveCustomDashboards: !0 === e.canSaveCustomDashboards,
            experienceHasExperimentationMinDau: !0 === e.experienceHasExperimentationMinDau,
            experienceHasNoInGameExperiment: !0 === e.experienceHasNoInGameExperiment,
            experienceHasInsightsAccess: !0 === e.experienceHasInsightsAccess
        });
    e.s(["useAnalyticsExperiencePermissions", 0, e => {
        let c = void 0 !== e && e > 0 ? e : void 0,
            u = (0, r.useQuery)({
                queryKey: ["analytics-permissions", null != c ? c : "invalid-experience"],
                queryFn: async () => {
                    if (void 0 === c) throw Error("Feature permissions require a valid universe id.");
                    try {
                        return await a.developerAnalyticsAggregationsClient.getfeaturePermissionsGetFeaturePermission({
                            universeId: c
                        })
                    } catch (t) {
                        var e;
                        if ((null == (e = (0, i.getResponseFromError)(t)) ? void 0 : e.status) === n.StatusCodes.FORBIDDEN) return o;
                        throw t
                    }
                },
                select: s,
                enabled: void 0 !== c,
                staleTime: 1 / 0
            });
        return (0, t.useMemo)(() => {
            var e;
            return {
                ...null != (e = u.data) ? e : o,
                isPending: u.isPending,
                isError: u.isError
            }
        }, [u.data, u.isError, u.isPending])
    }])
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
    for (var A = f(m, 0), b = A.b, D = A.r, C = new l(32768), w = 0; w < 32768; ++w) {
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
        N = S(I, 5, 0),
        M = S(I, 5, 1),
        V = function(e) {
            for (var t = e[0], r = 1; r < e.length; ++r) e[r] > t && (t = e[r]);
            return t
        },
        O = function(e, t, r) {
            var n = t / 8 | 0;
            return (e[n] | e[n + 1] << 8) >> (7 & t) & r
        },
        U = function(e, t) {
            var r = t / 8 | 0;
            return (e[r] | e[r + 1] << 8 | e[r + 2] << 16) >> (7 & t)
        },
        P = function(e) {
            return (e + 7) / 8 | 0
        },
        k = function(e, t, r) {
            return (null == t || t < 0) && (t = 0), (null == r || r > e.length) && (r = e.length), new u(e.subarray(t, r))
        },
        B = ["unexpected EOF", "invalid block type", "invalid length/literal", "invalid distance", "stream finished", "no stream handler", , "no callback", "invalid UTF-8 data", "extra field too long", "date not in range 1980-2099", "filename too long", "stream finishing", "invalid zip data"],
        x = function(e, t, r) {
            var n = Error(t || B[e]);
            if (n.code = e, Error.captureStackTrace && Error.captureStackTrace(n, x), !r) throw n;
            return n
        },
        H = function(e, t, r, n) {
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
                A = t.d,
                D = t.m,
                C = t.n,
                w = 8 * a;
            do {
                if (!v) {
                    d = O(e, f, 1);
                    var T = O(e, f + 1, 3);
                    if (f += 3, T)
                        if (1 == T) v = _, A = M, D = 9, C = 5;
                        else if (2 == T) {
                        var E = O(e, f, 31) + 257,
                            I = O(e, f + 10, 15) + 4,
                            R = E + O(e, f + 5, 31) + 1;
                        f += 14;
                        for (var N = new u(R), B = new u(19), H = 0; H < I; ++H) B[p[H]] = O(e, f + 3 * H, 7);
                        f += 3 * I;
                        for (var G = V(B), Q = (1 << G) - 1, L = S(B, G, 1), H = 0; H < R;) {
                            var F = L[O(e, f, Q)];
                            f += 15 & F;
                            var K = F >> 4;
                            if (K < 16) N[H++] = K;
                            else {
                                var j = 0,
                                    z = 0;
                                for (16 == K ? (z = 3 + O(e, f, 3), f += 2, j = N[H - 1]) : 17 == K ? (z = 3 + O(e, f, 7), f += 3) : 18 == K && (z = 11 + O(e, f, 127), f += 7); z--;) N[H++] = j
                            }
                        }
                        var Y = N.subarray(0, E),
                            q = N.subarray(E);
                        D = V(Y), C = V(q), v = S(Y, D, 1), A = S(q, C, 1)
                    } else x(1);
                    else {
                        var K = P(f) + 4,
                            X = e[K - 4] | e[K - 3] << 8,
                            W = K + X;
                        if (W > a) {
                            c && x(0);
                            break
                        }
                        s && l(y + X), r.set(e.subarray(K, W), y), t.b = y += X, t.p = f = 8 * W, t.f = d;
                        continue
                    }
                    if (f > w) {
                        c && x(0);
                        break
                    }
                }
                s && l(y + 131072);
                for (var $ = (1 << D) - 1, J = (1 << C) - 1, Z = f;; Z = f) {
                    var j = v[U(e, f) & $],
                        ee = j >> 4;
                    if ((f += 15 & j) > w) {
                        c && x(0);
                        break
                    }
                    if (j || x(2), ee < 256) r[y++] = ee;
                    else if (256 == ee) {
                        Z = f, v = null;
                        break
                    } else {
                        var et = ee - 254;
                        if (ee > 264) {
                            var H = ee - 257,
                                er = h[H];
                            et = O(e, f, (1 << er) - 1) + g[H], f += er
                        }
                        var en = A[U(e, f) & J],
                            ea = en >> 4;
                        en || x(3), f += 15 & en;
                        var q = b[ea];
                        if (ea > 3) {
                            var er = m[ea];
                            q += U(e, f) & (1 << er) - 1, f += er
                        }
                        if (f > w) {
                            c && x(0);
                            break
                        }
                        s && l(y + 131072);
                        var ei = y + et;
                        if (y < q) {
                            var eo = i - q,
                                es = Math.min(q, ei);
                            for (eo + y < 0 && x(3); y < es; ++y) r[y] = n[eo + y]
                        }
                        for (; y < ei; ++y) r[y] = r[y - q]
                    }
                }
                t.l = v, t.p = Z, t.b = y, t.f = d, v && (d = 1, t.m = D, t.d = A, t.n = C)
            } while (!d) return y != r.length && o ? k(r, 0, y) : r.subarray(0, y)
        },
        G = function(e, t, r) {
            r <<= 7 & t;
            var n = t / 8 | 0;
            e[n] |= r, e[n + 1] |= r >> 8
        },
        Q = function(e, t, r) {
            r <<= 7 & t;
            var n = t / 8 | 0;
            e[n] |= r, e[n + 1] |= r >> 8, e[n + 2] |= r >> 16
        },
        L = function(e, t) {
            for (var r = [], n = 0; n < e.length; ++n) e[n] && r.push({
                s: n,
                f: e[n]
            });
            var a = r.length,
                i = r.slice();
            if (!a) return {
                t: X,
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
                y = F(r[h - 1], f, 0);
            if (y > t) {
                var n = 0,
                    g = 0,
                    v = y - t,
                    A = 1 << v;
                for (i.sort(function(e, t) {
                        return f[t.s] - f[e.s] || e.f - t.f
                    }); n < a; ++n) {
                    var b = i[n].s;
                    if (f[b] > t) g += A - (1 << y - f[b]), f[b] = t;
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
        F = function(e, t, r) {
            return -1 == e.s ? Math.max(F(e.l, t, r + 1), F(e.r, t, r + 1)) : t[e.s] = r
        },
        K = function(e) {
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
        Y = function(e, t, r, n, a, i, o, s, c, u, d) {
            G(t, d++, r), ++a[256];
            for (var f, y, g, v, A = L(a, 15), b = A.t, D = A.l, C = L(i, 15), w = C.t, T = C.l, _ = K(b), M = _.c, V = _.n, O = K(w), U = O.c, P = O.n, k = new l(19), B = 0; B < M.length; ++B) ++k[31 & M[B]];
            for (var B = 0; B < U.length; ++B) ++k[31 & U[B]];
            for (var x = L(k, 7), H = x.t, F = x.l, Y = 19; Y > 4 && !H[p[Y - 1]]; --Y);
            var q = u + 5 << 3,
                X = j(a, E) + j(i, I) + o,
                W = j(a, b) + j(i, w) + o + 14 + 3 * Y + j(k, H) + 2 * k[16] + 3 * k[17] + 7 * k[18];
            if (c >= 0 && q <= X && q <= W) return z(t, d, e.subarray(c, c + u));
            if (G(t, d, 1 + (W < X)), d += 2, W < X) {
                f = S(b, D, 0), y = b, g = S(w, T, 0), v = w;
                var $ = S(H, F, 0);
                G(t, d, V - 257), G(t, d + 5, P - 1), G(t, d + 10, Y - 4), d += 14;
                for (var B = 0; B < Y; ++B) G(t, d + 3 * B, H[p[B]]);
                d += 3 * Y;
                for (var J = [M, U], Z = 0; Z < 2; ++Z)
                    for (var ee = J[Z], B = 0; B < ee.length; ++B) {
                        var et = 31 & ee[B];
                        G(t, d, $[et]), d += H[et], et > 15 && (G(t, d, ee[B] >> 5 & 127), d += ee[B] >> 12)
                    }
            } else f = R, y = E, g = N, v = I;
            for (var B = 0; B < s; ++B) {
                var er = n[B];
                if (er > 255) {
                    var et = er >> 18 & 31;
                    Q(t, d, f[et + 257]), d += y[et + 257], et > 7 && (G(t, d, er >> 23 & 31), d += h[et]);
                    var en = 31 & er;
                    Q(t, d, g[en]), d += v[en], en > 3 && (Q(t, d, er >> 5 & 8191), d += m[en])
                } else Q(t, d, f[er]), d += y[er]
            }
            return Q(t, d, f[256]), d + y[256]
        },
        q = new d([65540, 131080, 131088, 131104, 262176, 1048704, 1048832, 2114560, 2117632]),
        X = new u(0),
        W = function(e, t, r, n, a, i) {
            var o = i.z || e.length,
                s = new u(n + o + 5 * (1 + Math.ceil(o / 7e3)) + a),
                c = s.subarray(n, s.length - a),
                p = i.l,
                f = 7 & (i.r || 0);
            if (t) {
                f && (c[0] = i.r >> 3);
                for (var y = q[t - 1], g = y >> 13, A = 8191 & y, b = (1 << r) - 1, C = i.p || new l(32768), w = i.h || new l(b + 1), T = Math.ceil(r / 3), S = 2 * T, E = function(t) {
                        return (e[t] ^ e[t + 1] << T ^ e[t + 2] << S) & b
                    }, I = new d(25e3), R = new l(288), _ = new l(32), N = 0, M = 0, V = i.i || 0, O = 0, U = i.w || 0, B = 0; V + 2 < o; ++V) {
                    var x = E(V),
                        H = 32767 & V,
                        G = w[x];
                    if (C[H] = G, w[x] = H, U <= V) {
                        var Q = o - V;
                        if ((N > 7e3 || O > 24576) && (Q > 423 || !p)) {
                            f = Y(e, c, 0, I, R, _, M, O, B, V - B, f), O = N = M = 0, B = V;
                            for (var L = 0; L < 286; ++L) R[L] = 0;
                            for (var L = 0; L < 30; ++L) _[L] = 0
                        }
                        var F = 2,
                            K = 0,
                            j = A,
                            X = H - G & 32767;
                        if (Q > 2 && x == E(V - X))
                            for (var W = Math.min(g, Q) - 1, $ = Math.min(32767, V), J = Math.min(258, Q); X <= $ && --j && H != G;) {
                                if (e[V + F] == e[V + F - X]) {
                                    for (var Z = 0; Z < J && e[V + Z] == e[V + Z - X]; ++Z);
                                    if (Z > F) {
                                        if (F = Z, K = X, Z > W) break;
                                        for (var ee = Math.min(X, Z - 2), et = 0, L = 0; L < ee; ++L) {
                                            var er = V - X + L & 32767,
                                                en = C[er],
                                                ea = er - en & 32767;
                                            ea > et && (et = ea, G = er)
                                        }
                                    }
                                }
                                G = C[H = G], X += H - G & 32767
                            }
                        if (K) {
                            I[O++] = 0x10000000 | v[F] << 18 | D[K];
                            var ei = 31 & v[F],
                                eo = 31 & D[K];
                            M += h[ei] + m[eo], ++R[257 + ei], ++_[eo], U = V + F, ++N
                        } else I[O++] = e[V], ++R[e[V]]
                    }
                }
                for (V = Math.max(V, U); V < o; ++V) I[O++] = e[V], ++R[e[V]];
                f = Y(e, c, p, I, R, _, M, O, B, V - B, f), p || (i.r = 7 & f | c[f / 8 | 0] << 3, f -= 7, i.h = w, i.p = C, i.i = V, i.w = U)
            } else {
                for (var V = i.w || 0; V < o + p; V += 65535) {
                    var es = V + 65535;
                    es >= o && (c[f / 8 | 0] = p, es = o), f = z(c, f + 1, e.subarray(V, es))
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
            return W(e, null == t.level ? 6 : t.level, null == t.mem ? a.l ? Math.ceil(1.5 * Math.max(8, Math.min(13, Math.log(e.length)))) : 20 : 12 + t.mem, r, n, a)
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
            return [u, l, d, h, m, p, g, b, _, M, C, B, S, V, O, U, P, k, x, H, eN, el, ed]
        },
        es = function() {
            return [u, l, d, h, m, p, v, D, R, E, N, I, C, q, X, S, G, Q, L, F, K, j, z, Y, P, k, W, ee, eI, el]
        },
        ec = function() {
            return [eA, eb]
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
                t.ondata || x(5), s && t.ondata(x(4, 0, 1), null, !!r), t.queuedSize += e.length, c.postMessage([e, s = r], e.buffer instanceof ArrayBuffer ? [e.buffer] : [])
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
        eA = function(e) {
            (31 != e[0] || 139 != e[1] || 8 != e[2]) && x(6, "invalid gzip data");
            var t = e[3],
                r = 10;
            4 & t && (r += (e[10] | e[11] << 8) + 2);
            for (var n = (t >> 3 & 1) + (t >> 4 & 1); n > 0; n -= !e[r++]);
            return r + (2 & t)
        },
        eb = function(e) {
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
            return ((15 & e[0]) != 8 || e[0] >> 4 > 7 || (e[0] << 8 | e[1]) % 31) && x(6, "invalid zlib data"), (e[1] >> 5 & 1) == +!t && x(6, "invalid zlib data: " + (32 & e[1] ? "need" : "unexpected") + " dictionary"), (e[1] >> 3 & 4) + 2
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
                this.ondata || x(5), this.s.l && x(4);
                var r = e.length + this.s.z;
                if (r > this.b.length) {
                    if (r > 2 * this.b.length - 32768) {
                        var n = new u(-32768 & r);
                        n.set(this.b.subarray(0, this.s.z)), this.b = n
                    }
                    var a = this.b.length - this.s.z;
                    this.b.set(e.subarray(0, a), this.s.z), this.s.z = this.b.length, this.p(this.b, !1), this.b.set(this.b.subarray(-32768)), this.b.set(e.subarray(a), 32768), this.s.z = e.length - a + 32768, this.s.i = 32766, this.s.w = 32768
                } else this.b.set(e, this.s.z), this.s.z += e.length;
                this.s.l = 1 & t, (this.s.z > this.s.w + 8191 || t) && (this.p(this.b, t || !1), this.s.w = this.s.i, this.s.i -= 2), t && (this.s = this.o = {}, this.b = X)
            }, e.prototype.flush = function(e) {
                if (this.ondata || x(5), this.s.l && x(4), this.p(this.b, !1), this.s.w = this.s.i, this.s.i -= 2, e) {
                    var t = new u(6);
                    t[0] = this.s.r >> 3;
                    var r = z(t, this.s.r, X);
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
                if (this.ondata || x(5), this.d && x(4), this.p.length) {
                    if (e.length) {
                        var t = new u(this.p.length + e.length);
                        t.set(this.p), t.set(e, this.p.length), this.p = t
                    }
                } else this.p = e
            }, e.prototype.c = function(e) {
                this.s.i = +(this.d = e || !1);
                var t = this.s.b,
                    r = H(this.p, this.s, this.o);
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

    function eN(e, t) {
        return H(e, {
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
    var eM = function() {
            function e(e, t) {
                this.v = 1, this.r = 0, eR.call(this, e, t)
            }
            return e.prototype.push = function(e, t) {
                if (eR.prototype.e.call(this, e), this.r += e.length, this.v) {
                    var r = this.p.subarray(this.v - 1),
                        n = r.length > 3 ? eA(r) : 4;
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
        eV = function(e, t) {
            var r = this;
            em([eo, ec, function() {
                return [eh, eR, eM]
            }], this, eT.call(this, e, t), function(e) {
                var t = new eM(e.data);
                t.onmember = function(e) {
                    return postMessage(e)
                }, onmessage = eh(t)
            }, 9, 0, function(e) {
                return r.onmember && r.onmember(e)
            })
        },
        eO = (function() {
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
                t && (this.p.length < 4 && x(6, "invalid zlib data"), this.p = this.p.subarray(0, -4)), eR.prototype.c.call(this, t)
            }, e
        }()),
        eU = function(e, t) {
            em([eo, eu, function() {
                return [eh, eR, eO]
            }], this, eT.call(this, e, t), function(e) {
                onmessage = eh(new eO(e.data))
            }, 11, 0)
        },
        eP = function() {
            function e(e, t) {
                this.o = eT.call(this, e, t) || {}, this.G = eM, this.I = eR, this.Z = eO
            }
            return e.prototype.i = function() {
                var e = this;
                this.s.ondata = function(t, r) {
                    e.ondata(t, r)
                }
            }, e.prototype.push = function(e, t) {
                if (this.ondata || x(5), this.s) this.s.push(e, t);
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
        eP.call(this, e, t), this.queuedSize = 0, this.G = eV, this.I = e_, this.Z = eU
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
    var eB = "u" > typeof TextEncoder && new TextEncoder,
        ex = "u" > typeof TextDecoder && new TextDecoder,
        eH = 0;
    try {
        ex.decode(X, {
            stream: !0
        }), eH = 1
    } catch (e) {}
    var eG = function(e) {
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

    function eQ(e, t) {
        if (t) {
            for (var r = new u(e.length), n = 0; n < e.length; ++n) r[n] = e.charCodeAt(n);
            return r
        }
        if (eB) return eB.encode(e);
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

    function eL(e, t) {
        if (t) {
            for (var r = "", n = 0; n < e.length; n += 16384) r += String.fromCharCode.apply(null, e.subarray(n, n + 16384));
            return r
        }
        if (ex) return ex.decode(e);
        var a = eG(e),
            i = a.s,
            r = a.r;
        return r.length && x(8), i
    }(function(e) {
        this.ondata = e, eH ? this.t = new TextDecoder : this.p = X
    }).prototype.push = function(e, t) {
        if (this.ondata || x(5), t = !!t, this.t) {
            this.ondata(this.t.decode(e, {
                stream: !0
            }), t), t && (this.t.decode().length && x(8), this.t = null);
            return
        }
        this.p || x(4);
        var r = new u(this.p.length + e.length);
        r.set(this.p), r.set(e, this.p.length);
        var n = eG(r),
            a = n.s,
            i = n.r;
        t ? (i.length && x(8), this.p = null) : this.p = i, this.ondata(a, t)
    }, (function(e) {
        this.ondata = e
    }).prototype.push = function(e, t) {
        this.ondata || x(5), this.d && x(4), this.ondata(eQ(e), this.d = t || !1)
    };
    var eF = function(e) {
            return 1 == e ? 3 : e < 6 ? 2 : +(9 == e)
        },
        eK = function(e, t, r, n, a, i, o) {
            var s = 0xffffffff == a,
                c = 0xffffffff == i,
                u = 0xffffffff == o,
                l = t + r;
            if (n && s + c + u) {
                for (; t + 4 < l; t += 4 + ep(e, t + 2))
                    if (1 == ep(e, t)) return [s ? ey(e, t + 4 + 8 * c) : a, c ? ey(e, t + 4) : i, u ? ey(e, t + 4 + 8 * (c + s)) : o, 1];
                n < 2 && x(13)
            }
            return [a, i, o, 0]
        },
        ej = function(e) {
            var t = 0;
            if (e)
                for (var r in e) {
                    var n = e[r].length;
                    n > 65535 && x(9), t += n + 4
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
            if ((m < 0 || m > 119) && x(10), eg(e, t, m << 25 | h.getMonth() + 1 << 21 | h.getDate() << 16 | h.getHours() << 11 | h.getMinutes() << 5 | h.getSeconds() >> 1), t += 4, -1 != i && (eg(e, t, r.crc), eg(e, t + 4, i < 0 ? -i - 2 : i), eg(e, t + 8, r.size)), eg(e, t + 12, c), eg(e, t + 14, d), t += 16, null != o && (eg(e, t, l), eg(e, t + 6, r.attrs), eg(e, t + 10, o), t += 14), e.set(n, t), t += c, d)
                for (var p in u) {
                    var f = u[p],
                        y = f.length;
                    eg(e, t, +p), eg(e, t + 2, y), e.set(f, t + 4), t += 4 + y
                }
            return l && (e.set(s, t), t += l), t
        },
        eY = function(e, t, r, n, a) {
            eg(e, t, 0x6054b50), eg(e, t + 8, r), eg(e, t + 10, r), eg(e, t + 12, n), eg(e, t + 16, a)
        },
        eq = function() {
            function e(e) {
                this.filename = e, this.c = J(), this.size = 0, this.compression = 0
            }
            return e.prototype.process = function(e, t) {
                this.ondata(null, e, t)
            }, e.prototype.push = function(e, t) {
                this.ondata || x(5), this.c.p(e), this.size += e.length, t && (this.crc = this.c.d()), this.process(e, t || !1)
            }, e
        }();

    function eX(e, t) {
        var r = this;
        t || (t = {}), eq.call(this, e), this.d = new eS(t, function(e, t) {
            r.ondata(null, e, t)
        }), this.compression = 8, this.flag = eF(t.level)
    }

    function eW(e, t) {
        var r = this;
        t || (t = {}), eq.call(this, e), this.d = new eE(t, function(e, t, n) {
            r.ondata(e, t, n)
        }), this.compression = 8, this.flag = eF(t.level), this.terminate = this.d.terminate
    }

    function e$(e) {
        this.ondata = e, this.u = [], this.d = 1
    }
    eX.prototype.process = function(e, t) {
        try {
            this.d.push(e, t)
        } catch (e) {
            this.ondata(e, null, t)
        }
    }, eX.prototype.push = function(e, t) {
        eq.prototype.push.call(this, e, t)
    }, eW.prototype.process = function(e, t) {
        this.d.push(e, t)
    }, eW.prototype.push = function(e, t) {
        eq.prototype.push.call(this, e, t)
    }, e$.prototype.add = function(e) {
        var t = this;
        if (this.ondata || x(5), 2 & this.d) this.ondata(x(4 + (1 & this.d) * 8, 0, 1), null, !1);
        else {
            var r = eQ(e.filename),
                n = r.length,
                a = e.comment,
                i = a && eQ(a),
                o = n != e.filename.length || i && a.length != i.length,
                s = n + ej(e.extra) + 30;
            n > 65535 && this.ondata(x(11, 0, 1), null, !1);
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
        2 & this.d ? this.ondata(x(4 + (1 & this.d) * 8, 0, 1), null, !0) : (this.d ? this.e() : this.u.push({
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
        }, this.p = X
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
        if (this.onfile || x(5), this.p || x(4), this.c > 0) {
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
                                g = eL(c.subarray(o + 30, o += 30 + a), !(2048 & t)),
                                v = eK(c, o, u, 2, f, y, 0),
                                A = v[0],
                                b = v[1],
                                D = v[3];
                            8 & t && (A = -1 - D), o += u, m.c = A;
                            var C = {
                                name: g,
                                compression: n,
                                start: function() {
                                    if (C.ondata || x(5), A) {
                                        var e = r.o[n];
                                        e || C.ondata(x(14, "unknown compression type " + n, 1), null, !1), (h = A < 0 ? new e(g) : new e(g, A, b)).ondata = function(e, t, r) {
                                            C.ondata(e, t, r)
                                        };
                                        for (var t = 0; t < p.length; t++) {
                                            var a = p[t];
                                            h.push(a, !1)
                                        }
                                        r.k[0] == p && r.c ? r.d = h : h.push(X, !0)
                                    } else C.ondata(null, X, !0)
                                },
                                terminate: function() {
                                    h && h.terminate && h.terminate()
                                }
                            };
                            A >= 0 && (C.size = A, C.originalSize = b), m.onfile(C)
                        }
                        return "break"
                    }
                    if (d) {
                        if (0x8074b50 == e) return s = o += 12 + (-2 == d && 8), i = 3, m.c = 0, "break";
                        else if (0x2014b50 == e) return s = o -= 4, i = 3, m.c = 0, "break"
                    }
                }(); ++o);
            if (this.p = X, d < 0) {
                var p = i ? c.subarray(0, s - 12 - (-2 == d && 8) - (0x8074b50 == ef(c, s - 16) && 4)) : c.subarray(0, o);
                h ? h.push(p, !!i) : this.k[+(2 == i)].push(p)
            }
            if (2 & i) return this.push(c.subarray(o), t);
            this.p = c.subarray(o)
        }
        t && (this.c && x(13), this.p = null)
    }, e1.prototype.register = function(e) {
        this.o[e.compression] = e
    }, "function" == typeof queueMicrotask && queueMicrotask;
    let e2 = e => (e => {
            let t = "";
            for (let r = 0; r < e.length; r += 32768) t += String.fromCharCode(...e.subarray(r, r + 32768));
            return btoa(t).replaceAll("+", "-").replaceAll("/", "_").replace(/=+$/u, "")
        })(eI(eQ(e))),
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
                let e = eL(eN(r));
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
}, 283561, 466386, e => {
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
    }], 283561);
    var n = e.i(759283);
    e.s(["parseExperienceUniverseIdFromRouter", 0, e => {
        if (!e.pathname.includes("/creations/experiences/")) return n.uninitializedUniverseId;
        let t = e.query.id;
        if ("string" != typeof t) return n.uninitializedUniverseId;
        let r = Number.parseInt(t, 10);
        return !Number.isFinite(r) || r <= 0 ? n.uninitializedUniverseId : r
    }], 466386)
}, 964956, e => {
    "use strict";
    e.s(["DETAIL_STALE_TIME_MS", 0, 3e4, "LIST_STALE_TIME_MS", 0, 3e4, "customDashboardQueryKeys", 0, {
        universe: e => ["custom-dashboards", "universe", e],
        list: (e, t) => {
            var r, n;
            let a = ["custom-dashboards", "universe", e, "list"];
            return t ? [...a, null != (r = t.pageSize) ? r : null, null != (n = t.pageToken) ? n : null] : a
        },
        listInfinite: (e, t) => ["custom-dashboards", "universe", e, "list", "infinite", null != t ? t : null],
        pinned: e => ["custom-dashboards", "universe", e, "pinned"],
        detail: (e, t) => ["custom-dashboards", "universe", e, "detail", t],
        suggestedName: e => ["custom-dashboards", "universe", e, "suggested-name"]
    }])
}, 650040, 379843, 318727, 413311, e => {
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

    function i(e) {
        return e.tiles
    }

    function o(e) {
        return e.columnCount
    }
    e.s(["BACKEND_DOCUMENT_WRITE_SCHEMA_VERSION", 0, 1, "CUSTOM_DASHBOARD_CHART_TYPES", 0, r, "CUSTOM_DASHBOARD_CURRENT_SCHEMA_VERSION", 0, 1, "CustomDashboardSummaryCardAggregation", 0, {
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
    }, "LOCAL_STORAGE_DOCUMENT_SCHEMA_VERSION", 0, 1, "MAX_CHART_TILES_PER_DASHBOARD", 0, 12, "MAX_DASHBOARDS_PER_UNIVERSE", 0, 16, "MAX_DASHBOARD_DESCRIPTION_LENGTH", 0, 280, "MAX_DASHBOARD_NAME_LENGTH", 0, 80, "MAX_PINNED_DASHBOARDS", 0, 5, "MAX_SUMMARY_CARDS_PER_DASHBOARD", 0, 6, "MAX_TILES_PER_ROW", 0, 2, "MAX_TILE_TITLE_LENGTH", 0, 80, "READABLE_BACKEND_DOCUMENT_SCHEMA_VERSIONS", 0, [1, 2], "SummaryCardTitleSource", 0, {
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
        c = e => "Component" === e.type && "Chart" === e.component.type ? e.component.chart : null;

    function u(e) {
        return e.flatMap(e => {
            let t;
            if ("Component" === e.type) {
                let t = c(e);
                return t ? [{
                    columnCount: 1,
                    tiles: [t]
                }] : []
            }
            let r = (t = e.children.map(c)).length > 0 && t.every(e => null !== e) ? t.filter(e => null !== e) : null;
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
            return u(e.children)
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
                c = o(e),
                u = 1 === c ? 2 : 1;
            (a.forEach((e, a) => {
                t.push({
                    kind: "tile",
                    tileId: e.tileId,
                    tile: e,
                    rowIndex: n,
                    itemIndex: a,
                    order: r,
                    columnSpan: u
                }), r += 1
            }), !(c <= a.length)) && (t.push({
                kind: "empty-slot",
                emptySlotId: "".concat(s).concat(n),
                rowIndex: n,
                order: r,
                columnSpan: 1
            }), r += 1)
        }), t
    }, "selectChartRowsFromLayoutNodes", 0, u], 413311);
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

    function A(e) {
        return d(e).bodyNodes.flatMap(e => {
            if (v(e) && ("Flex" === e.type || "Grid" === e.type)) return e.children.map(g).filter(e => null !== e);
            let t = g(e);
            return t ? [t] : []
        })
    }
    e.s(["getChartRows", 0, function(e) {
        return u(d(e).bodyNodes.filter(e => !v(e)))
    }, "getDashboardSurface", 0, d, "getSummaryCards", 0, A, "withChartRows", 0, function(e, t) {
        let r = d(e),
            n = A(e);
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
}, 479236, 322172, e => {
    "use strict";
    var t = e.i(221628),
        r = e.i(416340),
        n = e.i(589624),
        a = e.i(692734),
        i = e.i(118413),
        o = e.i(834046),
        s = e.i(759283),
        c = e.i(283561),
        u = e.i(466386),
        l = e.i(721281),
        d = e.i(650040),
        h = e.i(379843),
        m = e.i(296150),
        p = e.i(743209),
        f = e.i(436025),
        y = e.i(593431),
        g = e.i(582078),
        v = e.i(852209),
        A = e.i(482922),
        b = e.i(31611),
        D = e.i(531007),
        C = e.i(11517),
        w = e.i(302610),
        T = e.i(787202),
        S = e.i(646877);
    let E = {
            [D.ChartType.Spline]: 1,
            [D.ChartType.Area]: 2,
            [D.ChartType.DurationSpline]: 7,
            [D.ChartType.DurationArea]: 8,
            [D.ChartType.Bar]: 3,
            [D.ChartType.Column]: 4,
            [D.ChartType.Pie]: 5,
            [D.ChartType.Table]: 6
        },
        I = {
            DASHBOARD_CHART_TYPE_SPLINE: D.ChartType.Spline,
            DASHBOARD_CHART_TYPE_AREA: D.ChartType.Area,
            DASHBOARD_CHART_TYPE_DURATION_SPLINE: D.ChartType.DurationSpline,
            DASHBOARD_CHART_TYPE_DURATION_AREA: D.ChartType.DurationArea,
            DASHBOARD_CHART_TYPE_BAR: D.ChartType.Bar,
            DASHBOARD_CHART_TYPE_COLUMN: D.ChartType.Column,
            DASHBOARD_CHART_TYPE_PIE: D.ChartType.Pie,
            DASHBOARD_CHART_TYPE_TABLE: D.ChartType.Table,
            1: D.ChartType.Spline,
            2: D.ChartType.Area,
            7: D.ChartType.DurationSpline,
            8: D.ChartType.DurationArea,
            3: D.ChartType.Bar,
            4: D.ChartType.Column,
            5: D.ChartType.Pie,
            6: D.ChartType.Table
        },
        R = {
            Cumulative: 1,
            Minute: 2,
            HalfHour: 3,
            Hour: 4,
            Day: 5,
            Week: 6
        },
        _ = {
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
        N = {
            [b.RAQIV2MetricGranularity.None]: 1,
            [b.RAQIV2MetricGranularity.OneMinute]: 2,
            [b.RAQIV2MetricGranularity.HalfHour]: 3,
            [b.RAQIV2MetricGranularity.OneHour]: 4,
            [b.RAQIV2MetricGranularity.OneDay]: 5,
            [b.RAQIV2MetricGranularity.OneWeek]: 6
        },
        M = {
            DASHBOARD_GRANULARITY_CUMULATIVE: b.RAQIV2MetricGranularity.None,
            DASHBOARD_GRANULARITY_MINUTE: b.RAQIV2MetricGranularity.OneMinute,
            DASHBOARD_GRANULARITY_HALF_HOUR: b.RAQIV2MetricGranularity.HalfHour,
            DASHBOARD_GRANULARITY_HOUR: b.RAQIV2MetricGranularity.OneHour,
            DASHBOARD_GRANULARITY_DAY: b.RAQIV2MetricGranularity.OneDay,
            DASHBOARD_GRANULARITY_WEEK: b.RAQIV2MetricGranularity.OneWeek,
            1: b.RAQIV2MetricGranularity.None,
            2: b.RAQIV2MetricGranularity.OneMinute,
            3: b.RAQIV2MetricGranularity.HalfHour,
            4: b.RAQIV2MetricGranularity.OneHour,
            5: b.RAQIV2MetricGranularity.OneDay,
            6: b.RAQIV2MetricGranularity.OneWeek
        },
        V = {
            [b.RAQIV2AggregationType.Sum]: 1,
            [b.RAQIV2AggregationType.Count]: 2,
            [b.RAQIV2AggregationType.Average]: 3,
            [b.RAQIV2AggregationType.Min]: 4,
            [b.RAQIV2AggregationType.Max]: 5,
            [b.RAQIV2AggregationType.CountUser]: 7,
            [b.RAQIV2AggregationType.AveragePerUser]: 25,
            [b.RAQIV2PercentileType.AVG]: 10,
            [b.RAQIV2PercentileType.P10]: 11,
            [b.RAQIV2PercentileType.P50]: 12,
            [b.RAQIV2PercentileType.P90]: 13,
            [h.CustomDashboardSummaryCardAggregation.Total]: 20,
            [h.CustomDashboardSummaryCardAggregation.AverageOverTimePeriod]: 21,
            [h.CustomDashboardSummaryCardAggregation.MostRecentDataPoint]: 22,
            [h.CustomDashboardSummaryCardAggregation.Median]: 23,
            [h.CustomDashboardSummaryCardAggregation.Cumulative]: 24,
            [h.CustomDashboardSummaryCardAggregation.AveragePerUniqueUser]: 25
        },
        O = {
            DASHBOARD_AGGREGATION_SUM: b.RAQIV2AggregationType.Sum,
            DASHBOARD_AGGREGATION_COUNT: b.RAQIV2AggregationType.Count,
            DASHBOARD_AGGREGATION_AVERAGE: b.RAQIV2AggregationType.Average,
            DASHBOARD_AGGREGATION_MIN: b.RAQIV2AggregationType.Min,
            DASHBOARD_AGGREGATION_MAX: b.RAQIV2AggregationType.Max,
            DASHBOARD_AGGREGATION_DISTINCT_COUNT: b.RAQIV2AggregationType.CountUser,
            DASHBOARD_AGGREGATION_UNIQUE_COUNT: b.RAQIV2AggregationType.CountUser,
            DASHBOARD_AGGREGATION_PERCENTILE_AVG: b.RAQIV2PercentileType.AVG,
            DASHBOARD_AGGREGATION_PERCENTILE_P10: b.RAQIV2PercentileType.P10,
            DASHBOARD_AGGREGATION_PERCENTILE_P50: b.RAQIV2PercentileType.P50,
            DASHBOARD_AGGREGATION_PERCENTILE_P90: b.RAQIV2PercentileType.P90,
            DASHBOARD_AGGREGATION_TOTAL: h.CustomDashboardSummaryCardAggregation.Total,
            DASHBOARD_AGGREGATION_AVERAGE_OVER_TIME_PERIOD: h.CustomDashboardSummaryCardAggregation.AverageOverTimePeriod,
            DASHBOARD_AGGREGATION_MOST_RECENT_DATA_POINT: h.CustomDashboardSummaryCardAggregation.MostRecentDataPoint,
            DASHBOARD_AGGREGATION_MEDIAN: h.CustomDashboardSummaryCardAggregation.Median,
            DASHBOARD_AGGREGATION_CUMULATIVE: h.CustomDashboardSummaryCardAggregation.Cumulative,
            DASHBOARD_AGGREGATION_AVERAGE_PER_UNIQUE_USER: b.RAQIV2AggregationType.AveragePerUser,
            1: b.RAQIV2AggregationType.Sum,
            2: b.RAQIV2AggregationType.Count,
            3: b.RAQIV2AggregationType.Average,
            4: b.RAQIV2AggregationType.Min,
            5: b.RAQIV2AggregationType.Max,
            6: b.RAQIV2AggregationType.CountUser,
            7: b.RAQIV2AggregationType.CountUser,
            10: b.RAQIV2PercentileType.AVG,
            11: b.RAQIV2PercentileType.P10,
            12: b.RAQIV2PercentileType.P50,
            13: b.RAQIV2PercentileType.P90,
            20: h.CustomDashboardSummaryCardAggregation.Total,
            21: h.CustomDashboardSummaryCardAggregation.AverageOverTimePeriod,
            22: h.CustomDashboardSummaryCardAggregation.MostRecentDataPoint,
            23: h.CustomDashboardSummaryCardAggregation.Median,
            24: h.CustomDashboardSummaryCardAggregation.Cumulative,
            25: b.RAQIV2AggregationType.AveragePerUser
        },
        U = {
            [h.SummaryCardTitleSource.Auto]: 1,
            [h.SummaryCardTitleSource.Custom]: 2
        },
        P = {
            DASHBOARD_TITLE_SOURCE_AUTO: h.SummaryCardTitleSource.Auto,
            DASHBOARD_TITLE_SOURCE_CUSTOM: h.SummaryCardTitleSource.Custom,
            1: h.SummaryCardTitleSource.Auto,
            2: h.SummaryCardTitleSource.Custom
        },
        k = {
            none: 1,
            weekly: 2
        },
        B = {
            DASHBOARD_CHART_SMOOTHING_NONE: "none",
            DASHBOARD_CHART_SMOOTHING_WEEKLY: "weekly",
            1: "none",
            2: "weekly"
        };

    function x(e) {
        return "object" == typeof e && null !== e && !Array.isArray(e)
    }

    function H(e) {
        return String(e)
    }

    function G(e) {
        throw new c.CustomDashboardValidationError("backendContract", e)
    }

    function Q(e, t, r) {
        let n = t[H(e)];
        return void 0 === n && G("Unsupported ".concat(r, " value ").concat(String(e), ".")), n
    }

    function L(e, t, r) {
        let n = t[H(e)];
        return void 0 === n && G("Unsupported backend ".concat(r, " value ").concat(String(e), ".")), n
    }

    function F(e) {
        let t = new Date(e).toISOString();
        return Number.isNaN(Date.parse(t)) && G("Timestamp is outside the supported RFC3339 range."), t
    }

    function K(e, t) {
        if ("string" == typeof e) {
            let r = Date.parse(e);
            return Number.isFinite(r) || G("".concat(t, " is not a valid timestamp.")), r
        }
        if (x(e)) {
            var r, n;
            let a = Number(null != (r = e.seconds) ? r : 0),
                i = Number(null != (n = e.nanos) ? n : 0);
            return Number.isFinite(a) && Number.isFinite(i) || G("".concat(t, " is not a valid timestamp.")), 1e3 * a + Math.floor(i / 1e6)
        }
        return G("".concat(t, " is not a valid timestamp."))
    }

    function j(e) {
        return e.map(e => ({
            dimensionKey: e.dimension,
            values: [...e.values]
        }))
    }

    function z(e, t) {
        return null == e ? [] : (Array.isArray(e) || G("".concat(t, " must be an array.")), e.map((e, r) => {
            var n, a;
            x(e) || G("".concat(t, "[").concat(r, "] must be an object."));
            let i = null != (n = null != (a = e.dimensionKey) ? a : e.dimension_key) ? n : e.dimension;
            ("string" != typeof i || 0 === i.length) && G("".concat(t, "[").concat(r, "].dimensionKey must be a non-empty string."));
            let {
                values: o
            } = e;
            return Array.isArray(o) && o.every(e => "string" == typeof e) || G("".concat(t, "[").concat(r, "].values must be an array of strings.")), {
                dimension: i,
                values: o
            }
        }))
    }

    function Y(e, t, r) {
        if (null != e) return Array.isArray(e) && e.every(e => "string" == typeof e) || G("".concat(t, " must be an array of strings.")), e.map((e, n) => r(e) ? e : G("".concat(t, "[").concat(n, "] is unsupported.")))
    }

    function q(e, t) {
        var r;
        return (r = e.dimension) !== b.RAQIV2Dimension.CustomEventName && (0, S.isCanonicalRAQIV2Dimension)(r) ? {
            dimension: e.dimension,
            values: [...e.values]
        } : G("".concat(t, " contains an unsupported dimension."))
    }

    function X(e) {
        if (e && 0 !== e.length) return e.map(e => ({
            pseudoDimensionKey: e.pseudoDimensionKey,
            variantKey: e.variantKey
        }))
    }

    function W(e) {
        if (Array.isArray(e) && 0 !== e.length) return e.map((e, t) => {
            var r, n;
            x(e) || G("variantSelections[".concat(t, "] must be an object."));
            let a = null != (r = e.pseudoDimensionKey) ? r : e.pseudo_dimension_key,
                i = null != (n = e.variantKey) ? n : e.variant_key;
            return ("string" != typeof a || "string" != typeof i) && G("variantSelections[".concat(t, "] is missing keys.")), {
                pseudoDimensionKey: a,
                variantKey: i
            }
        })
    }

    function $(e) {
        if (!e || 0 === e.length) return;
        let t = null,
            r = null,
            n = b.RAQIV2UIPseudoDimension.AggregationType,
            a = b.RAQIV2UIPseudoDimension.PercentileType;
        for (let i of e) i.pseudoDimensionKey === n && ((0, S.isRAQIV2AggregationType)(i.variantKey) || G("Unsupported aggregation variant ".concat(i.variantKey, ".")), t = i.variantKey), i.pseudoDimensionKey === a && ((0, S.isRAQIV2PercentileType)(i.variantKey) || G("Unsupported percentile variant ".concat(i.variantKey, ".")), r = i.variantKey);
        if (null !== t || null !== r) return {
            aggregationType: t,
            percentile: r
        }
    }

    function J(e) {
        let t = X(e.variantSelections);
        if (e.computedMetric) {
            var r;
            return {
                computedMetric: {
                    sources: (r = e.computedMetric).sources.map(e => {
                        let t = e.metric,
                            r = X(function(e) {
                                if (!e) return;
                                let t = [];
                                return e.aggregationType && t.push({
                                    pseudoDimensionKey: b.RAQIV2UIPseudoDimension.AggregationType,
                                    variantKey: e.aggregationType
                                }), e.percentile && t.push({
                                    pseudoDimensionKey: b.RAQIV2UIPseudoDimension.PercentileType,
                                    variantKey: e.percentile
                                }), t.length > 0 ? t : void 0
                            }(e.pseudoDimensionValues)),
                            n = e.filters ? j(e.filters) : void 0;
                        return (0, C.isCustomEventsAtomicMetricLike)(t) ? {
                            sourceKey: e.key,
                            metric: {
                                customEventMetric: {
                                    metricKey: t.metric,
                                    customEventName: t.customEventName,
                                    ...t.aggregationType ? {
                                        aggregation: Q(t.aggregationType, V, "aggregation")
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

    function Z(e, t) {
        var r, n, a;
        x(e) || G("".concat(t, " must be an object."));
        let i = W(null != (r = e.variantSelections) ? r : e.variant_selections),
            o = null != (n = e.computedMetric) ? n : e.computed_metric;
        if (void 0 !== o) return {
            computedMetric: function(e, t) {
                x(e) || G("".concat(t, " must be an object."));
                let {
                    sources: r,
                    formula: n,
                    displayName: a,
                    l7Smoothing: i
                } = e;
                Array.isArray(r) && 0 !== r.length && "string" == typeof n || G("".concat(t, " is not a valid computed metric."));
                let [o, ...s] = r.map((e, r) => {
                    var n, a, i, o, s, c, u, l, d;
                    let h, m, p;
                    x(e) || G("".concat(t, ".sources[").concat(r, "] must be an object."));
                    let f = null != (n = null != (a = e.sourceKey) ? a : e.source_key) ? n : e.key;
                    ("string" != typeof f || 0 === f.length) && G("".concat(t, ".sources[").concat(r, "].sourceKey must be set."));
                    let y = void 0 === e.filters ? void 0 : z(e.filters, "".concat(t, ".sources[").concat(r, "].filters")),
                        g = W(null != (i = e.variantSelections) ? i : e.variant_selections),
                        v = e.metric,
                        A = null != (o = e.metricKey) ? o : e.metric_key;
                    if (void 0 !== v && void 0 !== A && G("".concat(t, ".sources[").concat(r, "] must not contain both metric and metricKey representations.")), void 0 !== A)
                        if ("string" != typeof A && G("".concat(t, ".sources[").concat(r, "].metricKey must be a string.")), A === b.RAQIV2UIMetric.CustomEventsV2) {
                            let e = null != (s = null == y ? void 0 : y.filter(e => e.dimension === b.RAQIV2Dimension.CustomEventName)) ? s : [],
                                n = e[0],
                                a = null == n ? void 0 : n.values[0];
                            (1 !== e.length || (null == n ? void 0 : n.values.length) !== 1 || "string" != typeof a || 0 === a.trim().length) && G("".concat(t, ".sources[").concat(r, "] must contain exactly one non-empty ") + "".concat(b.RAQIV2Dimension.CustomEventName, " filter for a canonical custom event."));
                            let i = null != (c = null == g ? void 0 : g.filter(e => e.pseudoDimensionKey === b.RAQIV2UIPseudoDimension.AggregationType)) ? c : [];
                            1 !== i.length && G("".concat(t, ".sources[").concat(r, "] must contain exactly one ") + "".concat(b.RAQIV2UIPseudoDimension.AggregationType, " selection for a canonical custom event."));
                            let o = i[0];
                            o && (0, S.isRAQIV2AggregationType)(o.variantKey) || G("".concat(t, ".sources[").concat(r, "] has an invalid custom-event aggregation.")), h = {
                                metric: b.RAQIV2UIMetric.CustomEventsV2,
                                customEventName: a,
                                aggregationType: o.variantKey
                            }, m = null == y ? void 0 : y.filter(e => e.dimension !== b.RAQIV2Dimension.CustomEventName).map(e => q(e, "".concat(t, ".sources[").concat(r, "].filters"))), p = $(null == g ? void 0 : g.filter(e => e.pseudoDimensionKey !== b.RAQIV2UIPseudoDimension.AggregationType))
                        } else(0, S.isMetricKey)(A) || G("".concat(t, ".sources[").concat(r, "].metricKey is unsupported.")), h = A, m = null == y ? void 0 : y.map(e => q(e, "".concat(t, ".sources[").concat(r, "].filters"))), p = $(g);
                    else {
                        x(v) || G("".concat(t, ".sources[").concat(r, "] must contain either metric or metricKey."));
                        let e = null != (u = v.customEventMetric) ? u : v.custom_event_metric;
                        if (x(e)) {
                            let n, a = null != (l = e.customEventName) ? l : e.custom_event_name;
                            ("string" != typeof a || 0 === a.trim().length) && G("".concat(t, ".sources[").concat(r, "].metric.customEventMetric is invalid.")), h = {
                                metric: b.RAQIV2UIMetric.CustomEventsV2,
                                customEventName: a,
                                ...void 0 !== e.aggregation ? {
                                    aggregationType: (n = L(e.aggregation, O, "aggregation"), (0, S.isRAQIV2AggregationType)(n) ? n : G("Unsupported custom-event aggregation ".concat(n, ".")))
                                } : {}
                            }
                        } else {
                            let e = null != (d = v.metricKey) ? d : v.metric_key;
                            "string" != typeof e && G("".concat(t, ".sources[").concat(r, "].metric.metricKey must be set.")), (0, S.isMetricKey)(e) || G("".concat(t, ".sources[").concat(r, "].metric.metricKey is unsupported.")), h = e
                        }
                        m = null == y ? void 0 : y.map(e => q(e, "".concat(t, ".sources[").concat(r, "].filters"))), p = $(x(e) ? null == g ? void 0 : g.filter(e => e.pseudoDimensionKey !== b.RAQIV2UIPseudoDimension.AggregationType) : g)
                    }
                    return {
                        key: f,
                        metric: h,
                        ...void 0 !== m ? {
                            filters: m
                        } : {},
                        ...void 0 !== p ? {
                            pseudoDimensionValues: p
                        } : {}
                    }
                });
                return o || G("".concat(t, ".sources must be non-empty.")), {
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
        return ("string" != typeof s || 0 === s.length) && G("".concat(t, ".metricKey must be set.")), {
            metricKey: (0, S.isMetricKey)(s) ? s : G("".concat(t, ".metricKey is not a supported numeric metric.")),
            variantSelections: i
        }
    }

    function ee(e, t) {
        var r, n, a, i, o, s, c, u, l;
        let d;
        if (null == e) return {};
        x(e) || G("".concat(t, " must be an object."));
        let h = x(e.granularity) ? null != (r = e.granularity.fixed) ? r : e.granularity : void 0,
            m = x(h) ? h.granularity : void 0,
            p = void 0 === m ? void 0 : M[H(m)],
            f = null != (n = e.annotationOptions) ? n : e.annotation_options,
            y = x(f) ? (d = null != (u = Y(null != (l = f.defaultAnnotationTypeKeys) ? l : f.default_annotation_type_keys, "".concat(t, ".annotationOptions.defaultAnnotationTypeKeys"), S.isDefaultAnnotationType)) ? u : [], {
                supportedAnnotationTypes: (0, w.resolveCustomDashboardSupportedAnnotationTypes)(d),
                defaultAnnotationTypes: d,
                showAnnotationsControl: "boolean" == typeof f.showAnnotationsControl ? f.showAnnotationsControl : "boolean" != typeof f.show_annotations_control || f.show_annotations_control
            }) : void 0,
            g = null != (a = e.defaultFilters) ? a : e.default_filters,
            v = void 0 === g ? void 0 : z(g, "".concat(t, ".defaultFilters")),
            A = Y(null != (i = e.filterDimensionKeys) ? i : e.filter_dimension_keys, "".concat(t, ".filterDimensionKeys"), S.isCanonicalRAQIV2Dimension),
            b = Y(null != (o = e.breakdownDimensionKeys) ? o : e.breakdown_dimension_keys, "".concat(t, ".breakdownDimensionKeys"), S.isCanonicalRAQIV2Dimension),
            D = Y(null != (s = e.defaultBreakdownDimensionKeys) ? s : e.default_breakdown_dimension_keys, "".concat(t, ".defaultBreakdownDimensionKeys"), S.isDefaultBreakdownDimension);
        return {
            timeRangeOptions: function(e, t) {
                var r, n;
                if (null == e) return;
                if (x(e) || G("".concat(t, " must be an object.")), void 0 !== e.none) return {
                    type: "None"
                };
                let a = null != (r = e.dateRange) ? r : e.date_range;
                if (void 0 !== a) return x(a) || G("".concat(t, ".dateRange must be an object.")), {
                    type: "DateRange",
                    defaultSelection: function(e, t) {
                        var r, n, a, i;
                        if (null == e) return;
                        x(e) || G("".concat(t, " must be an object."));
                        let o = null != (r = e.relativeRangeKey) ? r : e.relative_range_key;
                        if ("string" == typeof o) return (0, S.isDateRangeType)(o) || G("".concat(t, ".relativeRangeKey is unsupported.")), {
                            type: "Relative",
                            rangeType: o
                        };
                        let s = null != (n = e.customRange) ? n : e.custom_range;
                        if (x(s)) return {
                            type: "Custom",
                            startTimeMs: K(null != (a = s.startTime) ? a : s.start_time, "".concat(t, ".customRange.startTime")),
                            endTimeMs: K(null != (i = s.endTime) ? i : s.end_time, "".concat(t, ".customRange.endTime"))
                        }
                    }(null != (n = a.defaultSelection) ? n : a.default_selection, "".concat(t, ".dateRange.defaultSelection"))
                }
            }(null != (c = e.timeRangeOptions) ? c : e.time_range_options, "".concat(t, ".timeRangeOptions")),
            filterDimensions: A,
            defaultFilters: v,
            breakdownDimensions: b,
            defaultBreakdown: D,
            defaultGranularity: p,
            annotationOptions: y
        }
    }

    function et(e) {
        return {
            metric: J(e.metric),
            seriesKey: e.seriesKey,
            ...e.filters ? {
                filters: j(e.filters)
            } : {},
            ...e.aggregation ? {
                aggregation: Q(e.aggregation, V, "aggregation")
            } : {}
        }
    }

    function er(e, t) {
        var r, n, a, i;
        x(e) || G("".concat(t, " must be an object."));
        let o = null != (r = e.summaryCard) ? r : e.summary_card;
        if (void 0 !== o) {
            let e, r;
            return {
                type: "Component",
                component: {
                    type: "SummaryCard",
                    summaryCard: (n = "".concat(t, ".summaryCard"), x(o) || G("".concat(n, " must be an object.")), ("string" != typeof(e = null != (a = o.tileId) ? a : o.tile_id) || 0 === e.length) && G("".concat(n, ".tileId must be set.")), r = null != (i = o.titleSource) ? i : o.title_source, {
                        type: "SummaryCard",
                        tileId: e,
                        ..."string" == typeof o.title ? {
                            title: o.title
                        } : {},
                        metric: Z(o.metric, "".concat(n, ".metric")),
                        aggregation: L(o.aggregation, O, "aggregation"),
                        filters: z(o.filters, "".concat(n, ".filters")),
                        ...void 0 !== r ? {
                            titleSource: L(r, P, "titleSource")
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
                    let s, c;
                    x(e) || G("".concat(t, " must be an object."));
                    let u = null != (r = e.tileId) ? r : e.tile_id;
                    ("string" != typeof u || 0 === u.length) && G("".concat(t, ".tileId must be set."));
                    let l = null != (n = e.dataSpec) ? n : e.data_spec,
                        d = null != (a = e.chartSpec) ? a : e.chart_spec;
                    x(l) && x(d) || G("".concat(t, " must include dataSpec and chartSpec.")), Array.isArray(l.metrics) || G("".concat(t, ".dataSpec.metrics must be an array."));
                    let m = L(null != (i = d.chartType) ? i : d.chart_type, I, "chartType"),
                        p = l.granularity,
                        f = d.smoothing;
                    if (void 0 !== l.aggregation) {
                        let e = L(l.aggregation, O, "aggregation");
                        (0, S.isChartAggregation)(e) || G("Unsupported chart aggregation ".concat(e, ".")), s = e
                    }
                    let y = null != (o = l.breakdownDimensionKeys) ? o : l.breakdown_dimension_keys;
                    Array.isArray(y) && (y.every(e => "string" == typeof e) || G("".concat(t, ".dataSpec.breakdownDimensionKeys must contain strings.")), c = y);
                    let g = void 0 !== p ? L(p, _, "granularity") : h.DEFAULT_CHART_GRANULARITY;
                    return {
                        type: "Chart",
                        tileId: u,
                        ..."string" == typeof e.title ? {
                            title: e.title
                        } : {},
                        dataSpec: {
                            metrics: l.metrics.map((e, r) => {
                                var n, a;
                                let i, o;
                                return n = "".concat(t, ".dataSpec.metrics[").concat(r, "]"), x(e) || G("".concat(n, " must be an object.")), ("string" != typeof(i = null != (a = e.seriesKey) ? a : e.series_key) || 0 === i.length) && G("".concat(n, ".seriesKey must be set.")), {
                                    metric: Z(e.metric, "".concat(n, ".metric")),
                                    seriesKey: i,
                                    ...void 0 === e.filters ? {} : {
                                        filters: z(e.filters, "".concat(n, ".filters"))
                                    },
                                    ...void 0 !== e.aggregation ? {
                                        aggregation: (o = L(e.aggregation, O, "aggregation"), (0, S.isChartAggregation)(o) ? o : G("Unsupported chart aggregation ".concat(o, ".")))
                                    } : {}
                                }
                            }),
                            ...void 0 !== s ? {
                                aggregation: s
                            } : {},
                            ...void 0 !== c ? {
                                breakdownDimensions: c
                            } : {},
                            granularity: g,
                            filters: z(l.filters, "".concat(t, ".dataSpec.filters"))
                        },
                        chartSpec: {
                            chartType: m,
                            overlays: function(e) {
                                var t, r, n, a;
                                if (!x(e)) return;
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
                            }(d.overlays),
                            ...void 0 !== f ? {
                                smoothing: L(f, B, "smoothing")
                            } : {}
                        }
                    }
                }(s, "".concat(t, ".chart"))
            }
        } : G("".concat(t, " must set chart or summaryCard."))
    }

    function en(e) {
        switch (e.type) {
            case "Component":
                var t, r, n, a, i, o;
                let s, c, u;
                return {
                    component: "SummaryCard" === (t = e.component).type ? {
                        summaryCard: {
                            tileId: (r = t.summaryCard).tileId,
                            ...void 0 !== r.title ? {
                                title: r.title
                            } : {},
                            metric: J(r.metric),
                            aggregation: Q(r.aggregation, V, "aggregation"),
                            filters: j(r.filters),
                            titleSource: Q(null != (n = r.titleSource) ? n : h.SummaryCardTitleSource.Auto, U, "titleSource")
                        }
                    } : {
                        chart: (s = function(e) {
                            if (!e) return;
                            let t = {};
                            return void 0 !== e.genreBenchmark && (t.genreBenchmark = e.genreBenchmark), void 0 !== e.similarExperienceBenchmark && (t.similarExperienceBenchmark = e.similarExperienceBenchmark), void 0 !== e.topExperienceBenchmark && (t.topExperienceBenchmark = e.topExperienceBenchmark), void 0 !== e.previousPeriod && ("boolean" != typeof e.previousPeriod && G("Backend v1 cannot persist configured previous-period comparison offsets."), t.previousPeriod = e.previousPeriod), void 0 !== e.quota && (t.quota = e.quota), Object.keys(t).length > 0 ? t : void 0
                        }((a = t.chart).chartSpec.overlays), c = null == (o = a.dataSpec.metrics[0]) ? void 0 : o.metric, u = null != (i = a.dataSpec.aggregation) ? i : void 0 !== c ? (0, T.resolveDefaultChartAggregation)(c) : b.RAQIV2AggregationType.Average, {
                            tileId: a.tileId,
                            ...void 0 !== a.title ? {
                                title: a.title
                            } : {},
                            dataSpec: {
                                metrics: a.dataSpec.metrics.map(et),
                                aggregation: Q(u, V, "aggregation"),
                                ...a.dataSpec.breakdownDimensions ? {
                                    breakdownDimensionKeys: [...a.dataSpec.breakdownDimensions]
                                } : {},
                                granularity: Q(a.dataSpec.granularity, R, "granularity"),
                                filters: j(a.dataSpec.filters)
                            },
                            chartSpec: {
                                chartType: Q(a.chartSpec.chartType, E, "chartType"),
                                ...s ? {
                                    overlays: s
                                } : {},
                                ...a.chartSpec.smoothing ? {
                                    smoothing: Q(a.chartSpec.smoothing, k, "smoothing")
                                } : {}
                            }
                        })
                    }
                };
            case "Stack":
                return {
                    stack: {
                        children: e.children.map(en)
                    }
                };
            case "Flex":
                return {
                    flex: {
                        children: e.children.map(en)
                    }
                };
            case "Grid":
                return {
                    grid: {
                        columnCount: e.columnCount,
                        children: e.children.map(en)
                    }
                };
            default:
                return G("Unsupported layout node ".concat(JSON.stringify(e), "."))
        }
    }

    function ea(e, t) {
        var r, n;
        if (x(e) || G("".concat(t, " must be an object.")), "string" == typeof e.type) {
            if ("Component" === e.type) return er(e.component, "".concat(t, ".component"));
            if ("Stack" === e.type || "Flex" === e.type) return Array.isArray(e.children) || G("".concat(t, ".children must be an array.")), {
                type: e.type,
                children: e.children.map((e, r) => ea(e, "".concat(t, ".children[").concat(r, "]")))
            };
            if ("Grid" === e.type) {
                Array.isArray(e.children) || G("".concat(t, ".children must be an array."));
                let n = null != (r = e.columnCount) ? r : e.column_count;
                return 1 !== n && 2 !== n && G("".concat(t, ".columnCount must be 1 or 2.")), {
                    type: "Grid",
                    columnCount: n,
                    children: e.children.map((e, r) => ea(e, "".concat(t, ".children[").concat(r, "]")))
                }
            }
        }
        if (void 0 !== e.component) return er(e.component, "".concat(t, ".component"));
        if (void 0 !== e.stack) return x(e.stack) && Array.isArray(e.stack.children) || G("".concat(t, ".stack.children must be an array.")), {
            type: "Stack",
            children: e.stack.children.map((e, r) => ea(e, "".concat(t, ".stack.children[").concat(r, "]")))
        };
        if (void 0 !== e.flex) return x(e.flex) && Array.isArray(e.flex.children) || G("".concat(t, ".flex.children must be an array.")), {
            type: "Flex",
            children: e.flex.children.map((e, r) => ea(e, "".concat(t, ".flex.children[").concat(r, "]")))
        };
        if (void 0 !== e.grid) {
            x(e.grid) && Array.isArray(e.grid.children) || G("".concat(t, ".grid.children must be an array."));
            let r = null != (n = e.grid.columnCount) ? n : e.grid.column_count;
            return 1 !== r && 2 !== r && G("".concat(t, ".grid.columnCount must be 1 or 2.")), {
                type: "Grid",
                columnCount: r,
                children: e.grid.children.map((e, r) => ea(e, "".concat(t, ".grid.children[").concat(r, "]")))
            }
        }
        return G("".concat(t, " must set component, stack, flex, or grid."))
    }

    function ei(e) {
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

    function eo(e) {
        let t = "number" == typeof e ? e : "string" == typeof e && e.trim().length > 0 ? Number(e) : NaN;
        return Number.isSafeInteger(t) && t > 0 ? t : void 0
    }

    function es(e) {
        var t;
        return null != (t = e.dashboardId) ? t : ""
    }

    function ec(e) {
        var t, r;
        let n;
        return {
            schemaVersion: h.BACKEND_DOCUMENT_WRITE_SCHEMA_VERSION,
            config: {
                page: ((t = e.page).mode !== h.DashboardPageMode.Untabbed && G("Only untabbed dashboard pages can be serialized to the backend."), {
                    untabbed: {
                        surface: {
                            resourceTypeKeys: [1],
                            controls: (n = (r = t.surface.controls).defaultGranularity ? N[r.defaultGranularity] : void 0, {
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
                                                            startTime: F(t.startTimeMs),
                                                            endTime: F(t.endTimeMs)
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
                                    defaultFilters: j(r.defaultFilters)
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
                            bodyNodes: t.surface.bodyNodes.map(en)
                        }
                    }
                })
            }
        }
    }

    function eu(e) {
        var t, r, n, a, i, o, s;
        let c, u, l = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : h.EMPTY_DASHBOARD_CONFIG,
            d = es(e),
            m = null != (t = eo(e.universeId)) ? t : 0,
            p = null != (r = ei(e.createdTime)) ? r : new Date(0).toISOString(),
            f = null != (n = ei(e.updatedTime)) ? n : p,
            y = ei(e.publishedTime),
            g = !0 === e.isPinned,
            v = e.createdBy,
            A = e.updatedBy,
            b = eo(null == v ? void 0 : v.userId),
            D = eo(null == A ? void 0 : A.userId);
        return (0, S.validateCustomDashboardDocument)({
            id: d,
            schemaVersion: h.LOCAL_STORAGE_DOCUMENT_SCHEMA_VERSION,
            universeId: m,
            name: (0, S.validateDashboardName)(null != (a = e.name) ? a : ""),
            description: (0, S.validateDashboardDescription)(null != (i = e.description) ? i : void 0),
            status: (c = (o = e).latestPublishedDocumentId, u = null != (s = o.latestPublishedVersion) ? s : 0, c || u > 0 ? "published" : "draft"),
            isPinned: g,
            pinnedAt: g ? ei(e.pinnedTime) : void 0,
            createdAt: p,
            updatedAt: f,
            publishedAt: y,
            createdByUserId: null != b ? b : 0,
            createdByUsername: "",
            ...void 0 !== D ? {
                updatedByUserId: D
            } : {},
            config: l
        })
    }

    function el(e) {
        if (!e.metadata) throw Error("Custom dashboard API response is missing metadata.");
        return eu(e.metadata, function(e) {
            var t;
            let r;
            return e ? (x(e) || G("Backend custom dashboard document is missing config."), (r = null != (t = e.schemaVersion) ? t : e.schema_version) !== h.READABLE_BACKEND_DOCUMENT_SCHEMA_VERSIONS[0] && r !== h.READABLE_BACKEND_DOCUMENT_SCHEMA_VERSIONS[1] && G("Unsupported backend custom dashboard schema version ".concat(String(r), ".")), x(e.config) || G("Backend custom dashboard document is missing config."), x(e.config.page) || G("config.page must be an object."), (0, S.validateCustomDashboardConfig)({
                page: function(e, t) {
                    var r, n, a;
                    if (x(e) || G("".concat(t, " must be an object.")), e.mode === h.DashboardPageMode.Untabbed) {
                        let r = e.surface;
                        x(r) || G("".concat(t, ".surface must be an object."));
                        let n = null != (a = r.bodyNodes) ? a : r.body_nodes;
                        return Array.isArray(n) || G("".concat(t, ".surface.bodyNodes must be an array.")), {
                            mode: h.DashboardPageMode.Untabbed,
                            surface: {
                                controls: ee(r.controls, "".concat(t, ".surface.controls")),
                                bodyNodes: n.map((e, r) => ea(e, "".concat(t, ".surface.bodyNodes[").concat(r, "]")))
                            }
                        }
                    }
                    let i = e.untabbed;
                    x(i) || G("".concat(t, ".untabbed must be an object."));
                    let o = i.surface;
                    x(o) || G("".concat(t, ".untabbed.surface must be an object."));
                    let s = null != (r = null != (n = o.bodyNodes) ? n : o.body_nodes) ? r : [];
                    return Array.isArray(s) || G("".concat(t, ".untabbed.surface.bodyNodes must be an array.")), {
                        mode: h.DashboardPageMode.Untabbed,
                        surface: {
                            controls: ee(o.controls, "".concat(t, ".untabbed.surface.controls")),
                            bodyNodes: s.map((e, r) => ea(e, "".concat(t, ".untabbed.surface.bodyNodes[").concat(r, "]")))
                        }
                    }
                }(e.config.page, "config.page")
            }, {
                enforceTileCaps: !1
            })) : h.EMPTY_DASHBOARD_CONFIG
        }(e.document))
    }

    function ed(e, t) {
        return "".concat(e, ":").concat(t)
    }
    let eh = class {
        async list(e, t) {
            return this.withApiErrors(e, void 0, async () => {
                var r, n, a;
                this.ensureAvailable();
                let i = t ? await this.client.listDashboards(e, t) : await this.listAllDashboards(e),
                    o = (null != (r = i.dashboards) ? r : []).map(t => (this.rememberMetadata(e, t), eu(t)));
                return {
                    items: (0, y.sortDashboardsForList)(o),
                    canEditCustomDashboards: (null == (a = i.capabilities) ? void 0 : a.canEdit) === !0,
                    capabilities: i.capabilities,
                    migrationFailedCount: 0,
                    nextPageToken: t && null != (n = i.nextPageToken) ? n : void 0
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
        async get(e, t) {
            return this.withApiErrors(e, t, async () => {
                this.ensureAvailable();
                let r = await this.client.getDashboard({
                    universeId: e,
                    dashboardId: t
                });
                return this.rememberMetadata(e, r.metadata), el(r)
            })
        }
        async getVersion(e, t) {
            return this.withApiErrors(e, t, async () => {
                var r, n;
                this.ensureAvailable();
                let a = this.tokens.get(ed(e, t));
                return a ? a.revision : (await this.get(e, t), null != (r = null == (n = this.tokens.get(ed(e, t))) ? void 0 : n.revision) ? r : null)
            })
        }
        async create(e) {
            return this.withApiErrors(e.universeId, void 0, async () => {
                var t;
                this.ensureAvailable();
                let r = null != (t = e.config) ? t : h.EMPTY_DASHBOARD_CONFIG,
                    n = await this.client.createDashboard({
                        universeId: e.universeId,
                        name: e.name,
                        description: e.description,
                        document: ec(r)
                    });
                this.rememberMetadata(e.universeId, n.metadata);
                let a = el(n);
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
                if (!s && !c) return this.get(e, t);
                let u = await this.ensureTokens(e, t),
                    l = null == n ? void 0 : n.expectedVersion;
                if (void 0 !== o) {
                    let r = await this.client.publishDashboard({
                        universeId: e,
                        dashboardId: t,
                        expectedHeadEtag: this.requireHeadEtag(u, t, l),
                        document: ec(o),
                        ...s ? {
                            metadataPatch: i
                        } : {}
                    });
                    this.rememberMetadata(e, r.metadata), a = el(r)
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
                let a = await this.get(e, t),
                    {
                        config: i,
                        tile: o
                    } = (0, m.addChartTileToConfig)({
                        config: a.config,
                        tile: r.tile,
                        nextTileId: (0, f.createTileId)()
                    }),
                    s = await this.ensureTokens(e, t),
                    c = await this.client.publishDashboard({
                        universeId: e,
                        dashboardId: t,
                        expectedHeadEtag: this.requireHeadEtag(s, t, null == n ? void 0 : n.expectedVersion),
                        document: ec(i)
                    });
                this.rememberMetadata(e, c.metadata);
                let u = el(c);
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
                }), this.tokens.delete(ed(e, t)), this.emit({
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
                let [i, o] = await Promise.all([this.get(e, t), this.list(e)]), s = this.dedupeName(i.name, o.items.map(e => e.name)), c = await this.client.duplicateDashboard({
                    universeId: e,
                    dashboardId: t,
                    destinationUniverseId: e,
                    name: s
                });
                this.rememberMetadata(e, c.metadata);
                let u = el(c),
                    l = (r = u.config, n = (0, d.getSummaryCards)(r).map(e => (0, p.cloneTileWithNewId)(e)), a = (0, d.getChartRows)(r).map(e => ({
                        ...e,
                        tiles: e.tiles.map(e => (0, p.cloneTileWithNewId)(e))
                    })), (0, d.withChartRows)((0, d.withSummaryCards)(r, n), a));
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
                let h = await this.ensureTokens(e, u.id),
                    m = await this.client.publishDashboard({
                        universeId: e,
                        dashboardId: u.id,
                        expectedHeadEtag: this.requireHeadEtag(h, u.id),
                        document: ec(l)
                    });
                this.rememberMetadata(e, m.metadata);
                let f = el(m);
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
                let n = await this.get(e, t),
                    a = await this.ensureTokens(e, t),
                    i = await this.client.publishDashboard({
                        universeId: e,
                        dashboardId: t,
                        expectedHeadEtag: this.requireHeadEtag(a, t, null == r ? void 0 : r.expectedVersion),
                        document: ec(n.config)
                    });
                this.rememberMetadata(e, i.metadata);
                let o = el(i);
                return this.emit({
                    universeId: e,
                    dashboardId: t,
                    eventType: "publish"
                }), o
            })
        }
        async unpublish(e, t) {
            return this.withApiErrors(e, t, async () => {
                throw this.ensureAvailable(), new c.CustomDashboardNotAvailableError
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
            return (0, g.suggestDefaultName)(t.items.map(e => e.name))
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
                if (n = e, !(e instanceof c.CustomDashboardVersionConflictError) || 2 === a) throw e
            }
            throw n
        }
        async ensureTokens(e, t) {
            let r = this.tokens.get(ed(e, t));
            if (r) return r;
            await this.get(e, t);
            let n = this.tokens.get(ed(e, t));
            if (!n) throw new c.CustomDashboardVersionConflictError(t);
            return n
        }
        rememberMetadata(e, t) {
            var r, n;
            let a = t ? es(t) : "",
                i = ed(e, a),
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
            if (!n) throw new c.CustomDashboardVersionConflictError(t);
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
            return r.has(n) ? (0, g.findUnusedNumberedName)(t, t => "".concat(e, " (copy ").concat(t, ")"), g.DUPLICATE_COPY_NUMBERED_SUFFIX_START) : n
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
            if (this.disposed) throw new c.CustomDashboardNotAvailableError
        }
        async withApiErrors(e, t, r) {
            try {
                return await r()
            } catch (n) {
                let r = (0, A.mapCustomDashboardsApiError)(n, t);
                throw r instanceof c.CustomDashboardVersionConflictError && void 0 !== e && t && await this.refreshTokens(e, t), r
            }
        }
        constructor(e = (0, v.createDefaultCustomDashboardsApiClient)()) {
            (0, l._)(this, "client", void 0), (0, l._)(this, "listeners", new Set), (0, l._)(this, "tokens", new Map), (0, l._)(this, "disposed", !1), this.client = e
        }
    };

    function em(e) {
        return e instanceof c.CustomDashboardNotFoundError
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
            hybridOrigin: "localCopy"
        }
    }

    function ey(e) {
        return {
            ...e,
            hybridOrigin: "server"
        }
    }
    let eg = class {
            async list(e, t) {
                let [r, n] = await Promise.all([this.apiService.list(e, t), this.localService.list(e)]);
                return {
                    items: r.items.map(ey),
                    canEditCustomDashboards: r.canEditCustomDashboards,
                    capabilities: n.capabilities,
                    localItems: n.items.map(ef),
                    nextPageToken: r.nextPageToken,
                    migrationFailedCount: r.migrationFailedCount + n.migrationFailedCount
                }
            }
            listPinned(e) {
                return this.apiService.listPinned(e)
            }
            async get(e, t) {
                try {
                    return ep(await this.localService.get(e, t))
                } catch (e) {
                    if (!em(e)) throw e
                }
                return {
                    ...await this.apiService.get(e, t),
                    hybridOrigin: "server"
                }
            }
            async create(e) {
                return ep(await this.localService.create(e))
            }
            async createAndPublish(e) {
                return ep(await this.localService.createAndPublish(e))
            }
            async update(e, t, r, n) {
                return await this.ensureLocalDashboard(e, t), ep(await this.localService.update(e, t, r, n))
            }
            async addChartTile(e, t, r, n) {
                await this.ensureLocalDashboard(e, t);
                let a = await this.localService.addChartTile(e, t, r, n);
                return {
                    ...a,
                    document: ep(a.document)
                }
            }
            async delete(e, t) {
                await this.ensureLocalDashboard(e, t), await this.localService.delete(e, t)
            }
            async duplicate(e, t, r) {
                try {
                    return await this.ensureLocalDashboard(e, t), ep(await this.localService.duplicate(e, t, r))
                } catch (e) {
                    if (!em(e) && !(e instanceof c.CustomDashboardNotAvailableError)) throw e
                }
                return this.forkApiDashboardToLocal(e, t, r)
            }
            async forkApiDashboardToLocal(e, t, r) {
                var n, a, i;
                let o, s, c, u, l = await this.apiService.get(e, t),
                    h = await this.localService.list(e);
                return ep(await this.localService.create({
                    universeId: e,
                    name: (n = h.items.map(e => e.name), a = l.name, o = (0, g.clipDashboardName)("".concat(a).concat(" (local copy)")), (s = new Set(Array.from(n, e => e.trim()))).has(o) ? (0, g.findUnusedNumberedName)(s, e => (0, g.clipDashboardName)("".concat(a, " (local copy ").concat(e, ")")), g.DUPLICATE_COPY_NUMBERED_SUFFIX_START) : o),
                    description: l.description,
                    createdByUserId: r.createdByUserId,
                    createdByUsername: r.createdByUsername,
                    config: (i = l.config, c = (0, d.getSummaryCards)(i).map(e => (0, p.cloneTileWithNewId)(e)), u = (0, d.getChartRows)(i).map(e => ({
                        ...e,
                        tiles: e.tiles.map(e => (0, p.cloneTileWithNewId)(e))
                    })), (0, d.withChartRows)((0, d.withSummaryCards)(i, c), u))
                }))
            }
            async publish(e, t, r) {
                return await this.ensureLocalDashboard(e, t), ep(await this.localService.publish(e, t, r))
            }
            async unpublish(e, t) {
                return await this.ensureLocalDashboard(e, t), ep(await this.localService.unpublish(e, t))
            }
            async pin(e, t) {
                return await this.ensureLocalDashboard(e, t), ep(await this.localService.pin(e, t))
            }
            async unpin(e, t) {
                return await this.ensureLocalDashboard(e, t), ep(await this.localService.unpin(e, t))
            }
            async suggestDefaultName(e) {
                return this.localService.suggestDefaultName(e)
            }
            async getVersion(e, t) {
                try {
                    await this.ensureLocalDashboard(e, t)
                } catch (e) {
                    if (e instanceof c.CustomDashboardNotAvailableError) return null;
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
                    return ep(await this.localService.get(e, t))
                } catch (e) {
                    if (em(e)) throw new c.CustomDashboardNotAvailableError;
                    throw e
                }
            }
            constructor(e) {
                (0, l._)(this, "localService", void 0), (0, l._)(this, "apiService", void 0), this.localService = e.localService, this.apiService = e.apiService
            }
        },
        ev = {
            isoNow: () => new Date().toISOString()
        };
    var eA = e.i(730530),
        eb = e.i(881670);
    let eD = {
        first: "(copy)",
        numbered: e => "(copy ".concat(e, ")")
    };

    function eC(e, t) {
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
            first: e.tPendingTranslation("(copy)", "Suffix appended to a duplicated dashboard name when the first copy is free; a leading space is added when concatenating with the base name", (0, eA.translationKey)("Label.CustomDashboards.DuplicateName.FirstSuffix", eb.TranslationNamespace.Analytics)),
            numbered: t => e.tPendingTranslation("(copy {n})", "Suffix appended when a duplicate dashboard name collides; {n} is the disambiguation number (2, 3, …); a leading space is added when concatenating with the base name", (0, eA.translationKey)("Label.CustomDashboards.DuplicateName.NumberedSuffix", eb.TranslationNamespace.Analytics), {
                n: String(t)
            })
        }
    }, "testOnlyEnglishDuplicateDashboardNameSuffixes", 0, eD], 322172);
    let ew = class {
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
                if ((null != (t = null == (r = this.peekUniverseMap(e)) ? void 0 : r.size) ? t : 0) >= h.MAX_DASHBOARDS_PER_UNIVERSE) throw new c.CustomDashboardQuotaExceededError("Universe ".concat(e, " is at the per-universe cap of ").concat(h.MAX_DASHBOARDS_PER_UNIVERSE, " dashboards. Delete one to create another."))
            }
            assertUnderPinnedCap(e, t) {
                let r = this.peekUniverseMap(e);
                if (r && Array.from(r.values()).filter(e => e.document.isPinned && e.document.id !== t).length >= h.MAX_PINNED_DASHBOARDS) throw new c.CustomDashboardQuotaExceededError("Universe ".concat(e, " is at the pinned-dashboard cap of ").concat(h.MAX_PINNED_DASHBOARDS, ". Unpin one to pin another."))
            }
            loadOrThrow(e, t) {
                let r = this.peekUniverseMap(e),
                    n = null == r ? void 0 : r.get(t);
                if (!r || !n) throw new c.CustomDashboardNotFoundError(t);
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
                if ((null == a ? void 0 : a.expectedVersion) !== void 0 && a.expectedVersion !== o.version) throw new c.CustomDashboardVersionConflictError(t);
                let s = this.clock.isoNow(),
                    u = {
                        ...o.document,
                        ...n(s),
                        updatedAt: s
                    };
                return i.set(t, {
                    document: u,
                    version: o.version + 1
                }), this.emit({
                    universeId: e,
                    dashboardId: t,
                    eventType: r
                }), u
            }
            async applyUpdateMutation(e, t, r, n, a) {
                let {
                    universeMap: i,
                    record: o
                } = this.loadOrThrow(e, t);
                if ((null == a ? void 0 : a.expectedVersion) !== void 0 && a.expectedVersion !== o.version) throw new c.CustomDashboardVersionConflictError(t);
                let {
                    document: s,
                    result: u
                } = n(o, this.clock.isoNow());
                return i.set(t, {
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
                    ...eC(r ? (0, y.sortDashboardsForList)([...r.values()].map(e => e.document)) : [], t),
                    capabilities: h.LOCAL_DASHBOARD_LIST_CAPABILITIES,
                    migrationFailedCount: 0
                }
            }
            async listPinned(e) {
                let t = this.peekUniverseMap(e);
                return t ? (0, y.sortDashboardsForList)([...t.values()].map(e => e.document)).filter(e => e.isPinned).map(e => {
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
                let r = (0, S.validateDashboardName)(e.name),
                    n = (0, S.validateDashboardDescription)(e.description),
                    a = void 0 !== e.config ? (0, S.validateCustomDashboardConfig)(e.config) : h.EMPTY_DASHBOARD_CONFIG,
                    i = this.clock.isoNow(),
                    o = {
                        id: this.idFactory.nextDashboardId(),
                        schemaVersion: h.CUSTOM_DASHBOARD_CURRENT_SCHEMA_VERSION,
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
                if ((null == n ? void 0 : n.expectedVersion) !== void 0 && n.expectedVersion !== i.version) throw new c.CustomDashboardVersionConflictError(t);
                let o = void 0 !== r.name ? (0, S.validateDashboardName)(r.name) : i.document.name,
                    s = void 0 !== r.description ? (0, S.validateDashboardDescription)(r.description) : i.document.description,
                    u = void 0 !== r.config ? (0, S.validateCustomDashboardConfig)(r.config) : i.document.config,
                    l = {
                        ...i.document,
                        name: o,
                        description: s,
                        config: u,
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
                    } = (0, m.addChartTileToConfig)({
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
                    s = (0, d.getSummaryCards)(n.config).map(e => (0, p.cloneTileWithNewId)(e, o)),
                    c = (0, d.getChartRows)(n.config).map(e => ({
                        ...e,
                        tiles: e.tiles.map(e => (0, p.cloneTileWithNewId)(e, o))
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
                        config: (0, d.withChartRows)((0, d.withSummaryCards)(n.config, s), c)
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
                return (0, g.suggestDefaultName)(t ? [...t.values()].map(e => e.document.name) : [])
            }
            subscribe(e) {
                return this.listeners.add(e), () => {
                    this.listeners.delete(e)
                }
            }
            dedupeName(e, t) {
                let r = this.peekUniverseMap(e),
                    n = r ? [...r.values()].map(e => e.document.name) : [];
                return (0, g.buildDuplicateDashboardName)(n, t, this.duplicateNameSuffixes)
            }
            constructor(e = {}) {
                var t, r, n;
                (0, l._)(this, "store", new Map), (0, l._)(this, "listeners", new Set), (0, l._)(this, "clock", void 0), (0, l._)(this, "idFactory", void 0), (0, l._)(this, "duplicateNameSuffixes", void 0), this.clock = null != (t = e.clock) ? t : ev, this.idFactory = null != (r = e.idFactory) ? r : f.defaultIdFactory, this.duplicateNameSuffixes = null != (n = e.duplicateNameSuffixes) ? n : eD
            }
        },
        eT = [{
            fromVersion: 0,
            toVersion: 1,
            description: "v0 → v1 identity: alpha records had no schemaVersion field but were v1-shaped.",
            migrate: e => e
        }];
    var eS = e.i(115232);
    let eE = "creator-hub:custom-dashboards:v1:universe:",
        eI = /^\d+$/;

    function eR(e) {
        return "".concat(eE).concat(e)
    }

    function e_(e, t, r) {
        let n = "".concat("creator-hub:custom-dashboards:v1:unreadable:universe:").concat(t);
        try {
            e.setItem(n, r)
        } catch (e) {}
        return {
            ok: !1,
            unreadableSidecarKey: n
        }
    }

    function eN(e, t, r, n) {
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
                }(e)) throw new c.CustomDashboardQuotaExceededError;
            if (e instanceof c.CustomDashboardStorageWriteError) throw e;
            throw new c.CustomDashboardStorageWriteError(e)
        }
    }

    function eM(e, t) {
        if (Object.keys(t).length >= h.MAX_DASHBOARDS_PER_UNIVERSE) throw new c.CustomDashboardQuotaExceededError("Universe ".concat(e, " is at the per-universe cap of ").concat(h.MAX_DASHBOARDS_PER_UNIVERSE, " dashboards. Delete one to create another."))
    }
    let eV = class {
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
                if (this.disposed) throw new c.CustomDashboardNotAvailableError;
                let e = function() {
                    try {
                        var e;
                        return null != (e = window.localStorage) ? e : null
                    } catch (e) {
                        return null
                    }
                }();
                if (!e) throw new c.CustomDashboardNotAvailableError;
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
                eM(e, t)
            }
            readMaterialised(e) {
                var t, r, n;
                let a, i, o, s, u = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "throwOnUnreadable",
                    l = this.requireStorage(),
                    d = l.getItem(eR(e)),
                    m = this.materialisedByUniverse.get(e);
                if (m && m.rawString === d) return {
                    storage: l,
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
                        return e_(e, t, r)
                    }
                    return (0, eS.isRecord)(n) && (0, eS.isRecord)(n.records) ? {
                        ok: !0,
                        bucket: {
                            records: n.records
                        }
                    } : e_(e, t, r)
                }(l, e, d);
                if (!p.ok) {
                    if (this.storageUnreadableByUniverse.set(e, p.unreadableSidecarKey), "throwOnUnreadable" === u) throw new c.CustomDashboardStorageUnreadableError(p.unreadableSidecarKey);
                    return {
                        storage: l,
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
                    let [n, u] = t;
                    if (!u || "object" != typeof u) {
                        i[n] = {
                            version: 1,
                            migrationFailed: !0,
                            reason: "record was not an object",
                            raw: u
                        }, o.push({
                            id: n,
                            reason: "record was not an object",
                            code: "OTHER"
                        });
                        return
                    }
                    if ((0, eS.isRecord)(u) && !0 === u.migrationFailed) {
                        i[n] = u, o.push({
                            id: n,
                            reason: u.reason,
                            code: "OTHER"
                        });
                        return
                    }
                    if (!(0, eS.isRecord)(u) || "number" != typeof u.version || !("document" in u)) {
                        i[n] = {
                            version: 1,
                            migrationFailed: !0,
                            reason: "record was not a live persisted record",
                            raw: u
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
                    } = u, m = (0, eS.isRecord)(l) ? l : {}, p = "number" == typeof m.schemaVersion ? m.schemaVersion : void 0;
                    try {
                        let t = (r = {
                            schemaVersion: p,
                            ...m
                        }, function(e, t, r) {
                            let n = {
                                    ...e
                                },
                                a = "number" == typeof e.schemaVersion ? e.schemaVersion : 0;
                            if (a > r) throw new c.CustomDashboardUnsupportedSchemaError(a, r);
                            let i = a,
                                o = t.length + 1,
                                s = 0;
                            for (; i < r && s < o;) {
                                let e = i,
                                    a = t.find(t => t.fromVersion === e);
                                if (!a) throw new c.CustomDashboardMigrationGapError(e, r);
                                let o = a.migrate(n),
                                    u = o.schemaVersion;
                                if ("number" == typeof u && u !== e && u !== a.toVersion) throw new c.CustomDashboardMigrationGapError(e, r, "Migration step ".concat(e, " → ").concat(a.toVersion, " produced schemaVersion ").concat(u, "."));
                                n = {
                                    ...o,
                                    schemaVersion: a.toVersion
                                }, i = a.toVersion, s += 1
                            }
                            if (i !== r) throw new c.CustomDashboardMigrationGapError(i, r, "Migration pipeline did not converge after ".concat(s, " steps (stopped at version ").concat(i, ")."));
                            return {
                                ...n,
                                schemaVersion: r
                            }
                        }(r, eT, h.CUSTOM_DASHBOARD_CURRENT_SCHEMA_VERSION));
                        p !== t.schemaVersion && (s = !0);
                        let u = (0, S.validateCustomDashboardDocument)({
                            ...t,
                            universeId: e
                        });
                        if (u.id !== n) {
                            let e = 'bucket key "'.concat(n, '" does not match document.id "').concat(u.id, '"');
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
                        a[u.id] = {
                            document: u,
                            version: "number" == typeof d ? d : 1
                        }
                    } catch (r) {
                        let e = r instanceof c.CustomDashboardUnsupportedSchemaError,
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
                    eN(l, e, f, y);
                    let t = l.getItem(eR(e));
                    this.materialisedByUniverse.set(e, {
                        rawString: t,
                        records: f,
                        quarantine: y
                    })
                } catch (e) {
                    null == (n = this.onPersistError) || n.call(this, e)
                } else this.materialisedByUniverse.set(e, {
                    rawString: d,
                    records: f,
                    quarantine: y
                });
                return {
                    storage: l,
                    records: f,
                    quarantine: y
                }
            }
            async list(e, t) {
                var r, n;
                let {
                    records: a
                } = this.readMaterialised(e), i = (0, y.sortDashboardsForList)(Object.values(a).map(e => e.document)), o = null != (r = null == (n = this.corruptedByUniverse.get(e)) ? void 0 : n.length) ? r : 0;
                return {
                    ...eC(i, t),
                    capabilities: h.LOCAL_DASHBOARD_LIST_CAPABILITIES,
                    migrationFailedCount: o
                }
            }
            async listPinned(e) {
                let {
                    records: t
                } = this.readMaterialised(e);
                return (0, y.sortDashboardsForList)(Object.values(t).map(e => e.document)).filter(e => e.isPinned).map(e => {
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
                if (!n) throw new c.CustomDashboardNotFoundError(t);
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
                eN(r, e, i, a);
                let s = r.getItem(eR(e));
                return this.materialisedByUniverse.set(e, {
                    rawString: s,
                    records: i,
                    quarantine: a
                }), o
            }
            insertNewDocument(e, t) {
                this.assertUnderUniverseCap(e.universeId);
                let r = (0, S.validateDashboardName)(e.name),
                    n = (0, S.validateDashboardDescription)(e.description),
                    a = void 0 !== e.config ? (0, S.validateCustomDashboardConfig)(e.config) : h.EMPTY_DASHBOARD_CONFIG,
                    i = this.clock.isoNow(),
                    o = {
                        id: this.idFactory.nextDashboardId(),
                        schemaVersion: h.CUSTOM_DASHBOARD_CURRENT_SCHEMA_VERSION,
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
                return this.commit(e.universeId, t => (eM(e.universeId, t), {
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
                return void 0 !== r.name && (a.name = (0, S.validateDashboardName)(r.name)), void 0 !== r.description && (a.description = (0, S.validateDashboardDescription)(r.description)), void 0 !== r.config && (a.config = (0, S.validateCustomDashboardConfig)(r.config)), this.applyMutation(e, t, "update", () => ({
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
                    if (!a) throw new c.CustomDashboardNotFoundError(t);
                    if ((null == n ? void 0 : n.expectedVersion) !== void 0 && n.expectedVersion !== a.version) throw new c.CustomDashboardVersionConflictError(t);
                    let {
                        config: i,
                        tile: o
                    } = (0, m.addChartTileToConfig)({
                        config: a.document.config,
                        tile: r.tile,
                        nextTileId: this.idFactory.nextTileId()
                    }), s = this.clock.isoNow(), u = {
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
                                document: u,
                                version: a.version + 1
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
                }), a
            }
            async delete(e, t) {
                this.commit(e, e => {
                    if (!e[t]) throw new c.CustomDashboardNotFoundError(t);
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
                    if (!i) throw new c.CustomDashboardNotFoundError(t);
                    eM(e, n);
                    let o = Object.values(n).map(e => e.document.name),
                        s = (0, g.buildDuplicateDashboardName)(o, i.name, this.duplicateNameSuffixes),
                        u = this.clock.isoNow(),
                        l = () => this.idFactory.nextTileId(),
                        h = (0, d.getSummaryCards)(i.config).map(e => (0, p.cloneTileWithNewId)(e, l)),
                        m = (0, d.getChartRows)(i.config).map(e => ({
                            ...e,
                            tiles: e.tiles.map(e => (0, p.cloneTileWithNewId)(e, l))
                        })),
                        f = {
                            ...i,
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
                            config: (0, d.withChartRows)((0, d.withSummaryCards)(i.config, h), m)
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
                    if (!n) throw new c.CustomDashboardNotFoundError(t);
                    if (Object.values(r).filter(e => e.document.isPinned && e.document.id !== t).length >= h.MAX_PINNED_DASHBOARDS) throw new c.CustomDashboardQuotaExceededError("Universe ".concat(e, " is at the pinned-dashboard cap of ").concat(h.MAX_PINNED_DASHBOARDS, ". Unpin one to pin another."));
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
                return (0, g.suggestDefaultName)(Object.values(t).map(e => e.document.name))
            }
            subscribe(e) {
                return this.disposed ? () => void 0 : (this.ensureStorageListener(), this.listeners.add(e), () => {
                    this.listeners.delete(e)
                })
            }
            async applyMutation(e, t, r, n, a) {
                let i = this.commit(e, e => {
                    let r = e[t];
                    if (!r) throw new c.CustomDashboardNotFoundError(t);
                    if ((null == a ? void 0 : a.expectedVersion) !== void 0 && a.expectedVersion !== r.version) throw new c.CustomDashboardVersionConflictError(t);
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
                (0, l._)(this, "listeners", new Set), (0, l._)(this, "storageListenerAttached", !1), (0, l._)(this, "disposed", !1), (0, l._)(this, "corruptedByUniverse", new Map), (0, l._)(this, "storageUnreadableByUniverse", new Map), (0, l._)(this, "materialisedByUniverse", new Map), (0, l._)(this, "clock", void 0), (0, l._)(this, "idFactory", void 0), (0, l._)(this, "onPersistError", void 0), (0, l._)(this, "duplicateNameSuffixes", void 0), (0, l._)(this, "handleStorageEvent", e => {
                    if (!e.key) return;
                    let t = function(e) {
                        if (!e.startsWith(eE)) return null;
                        let t = e.slice(eE.length);
                        if (!eI.test(t)) return null;
                        let r = Number(t);
                        return Number.isSafeInteger(r) ? r : null
                    }(e.key);
                    null !== t && (this.materialisedByUniverse.delete(t), this.emit({
                        universeId: t,
                        eventType: "external"
                    }))
                }), this.clock = null != (t = e.clock) ? t : ev, this.onPersistError = e.onPersistError, this.idFactory = null != (r = e.idFactory) ? r : f.defaultIdFactory, this.duplicateNameSuffixes = null != (n = e.duplicateNameSuffixes) ? n : eD
            }
        },
        eO = class {
            list(e, t) {
                return this.inner.list(e, t)
            }
            listPinned(e) {
                return this.inner.listPinned(e)
            }
            get(e, t) {
                return this.inner.get(e, t)
            }
            async create(e) {
                throw new c.CustomDashboardNotAvailableError
            }
            async createAndPublish(e) {
                throw new c.CustomDashboardNotAvailableError
            }
            async update(e, t, r, n) {
                throw new c.CustomDashboardNotAvailableError
            }
            async addChartTile(e, t, r, n) {
                throw new c.CustomDashboardNotAvailableError
            }
            async delete(e, t) {
                throw new c.CustomDashboardNotAvailableError
            }
            async duplicate(e, t, r) {
                throw new c.CustomDashboardNotAvailableError
            }
            async publish(e, t, r) {
                throw new c.CustomDashboardNotAvailableError
            }
            async unpublish(e, t) {
                throw new c.CustomDashboardNotAvailableError
            }
            async pin(e, t) {
                throw new c.CustomDashboardNotAvailableError
            }
            async unpin(e, t) {
                throw new c.CustomDashboardNotAvailableError
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
                (0, l._)(this, "inner", void 0), this.inner = e
            }
        },
        eU = {
            list: async () => ({
                items: [],
                migrationFailedCount: 0
            }),
            listPinned: async () => [],
            async get() {
                throw new c.CustomDashboardNotAvailableError
            },
            async create() {
                throw new c.CustomDashboardNotAvailableError
            },
            async createAndPublish() {
                throw new c.CustomDashboardNotAvailableError
            },
            async update() {
                throw new c.CustomDashboardNotAvailableError
            },
            async addChartTile() {
                throw new c.CustomDashboardNotAvailableError
            },
            async delete() {
                throw new c.CustomDashboardNotAvailableError
            },
            async duplicate() {
                throw new c.CustomDashboardNotAvailableError
            },
            async publish() {
                throw new c.CustomDashboardNotAvailableError
            },
            async unpublish() {
                throw new c.CustomDashboardNotAvailableError
            },
            async pin() {
                throw new c.CustomDashboardNotAvailableError
            },
            async unpin() {
                throw new c.CustomDashboardNotAvailableError
            },
            async suggestDefaultName() {
                throw new c.CustomDashboardNotAvailableError
            },
            getVersion: async () => null,
            subscribe: () => () => void 0
        },
        eP = (0, r.createContext)(null);
    e.s(["CustomDashboardServiceProvider", 0, e => {
        let {
            service: n,
            canMutateDashboards: a = !0,
            isApiBacked: i = !1,
            children: o
        } = e, s = (0, r.useRef)(new Map), c = (0, r.useCallback)(e => {
            let t;
            if (n) return n;
            let r = e.canSaveCustomDashboards ? "api:writable" : e.isLocalStorageEnabled ? "hybrid" : "api:readonly",
                a = s.current.get(r);
            if (a) return a;
            let i = (t = new eh((0, v.createDefaultCustomDashboardsApiClient)()), e.canSaveCustomDashboards ? t : e.isLocalStorageEnabled ? new eg({
                apiService: t,
                localService: function() {
                    try {
                        if (window.localStorage) return new eV
                    } catch (e) {}
                    return new ew
                }()
            }) : new eO(t));
            return s.current.set(r, i), i
        }, [n]), u = null != n ? n : eU;
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
            service: u,
            isReady: void 0 !== n,
            isApiBacked: !!n && i,
            canMutateDashboards: !!n && a,
            getServiceForConfig: c
        }), [a, c, i, u, n]);
        return (0, t.jsx)(eP.Provider, {
            value: l,
            children: o
        })
    }, "UniverseFlaggedCustomDashboardProvider", 0, e => {
        let {
            children: c
        } = e, l = (0, r.useContext)(eP);
        if (!l) throw Error("UniverseFlaggedCustomDashboardProvider must be used within CustomDashboardServiceProvider.");
        let d = (0, u.parseExperienceUniverseIdFromRouter)((0, n.useRouter)()),
            {
                canSaveCustomDashboards: h,
                isPending: m,
                isError: p
            } = (0, o.useAnalyticsExperiencePermissions)(d),
            {
                ready: f,
                value: y
            } = (0, a.useFlag)(i.isCustomDashboardsLocalStorageEnabled),
            g = d === s.uninitializedUniverseId || !m || p,
            v = (0, r.useMemo)(() => f && g ? {
                isLocalStorageEnabled: y,
                canSaveCustomDashboards: !p && h
            } : null, [h, y, f, p, g]),
            A = (0, r.useMemo)(() => v ? l.getServiceForConfig(v) : l.service, [l, v]),
            b = (0, r.useMemo)(() => v ? v.isLocalStorageEnabled || v.canSaveCustomDashboards : l.canMutateDashboards, [l.canMutateDashboards, v]),
            D = (0, r.useMemo)(() => ({
                ...l,
                service: A,
                isReady: null !== v,
                isApiBacked: null !== v,
                canMutateDashboards: b
            }), [b, l, v, A]);
        return (0, t.jsx)(eP.Provider, {
            value: D,
            children: c
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
        o = e.i(805386),
        s = e.i(908374),
        c = e.i(545154),
        u = e.i(283561),
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
    let A = /^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(?:\.\d{3})?Z$/;

    function b(e) {
        return "object" == typeof e && null !== e && !Array.isArray(e)
    }

    function D(e, t) {
        if (!b(e)) throw new u.CustomDashboardValidationError(t, "".concat(t, " must be an object."));
        return e
    }

    function C(e, t) {
        if ("string" != typeof e) throw new u.CustomDashboardValidationError(t, "".concat(t, " must be a string."));
        return e
    }

    function w(e, t) {
        let r = C(e, t);
        if (0 === r.length) throw new u.CustomDashboardValidationError(t, "".concat(t, " must be non-empty."));
        return r
    }

    function T(e, t) {
        if ("number" != typeof e || !Number.isFinite(e)) throw new u.CustomDashboardValidationError(t, "".concat(t, " must be a finite number."));
        return e
    }

    function S(e, t) {
        if ("boolean" == typeof e) return e;
        if (void 0 === e) return;
        let r = D(e, t);
        return {
            relativeOffset: function(e, t) {
                if (void 0 !== e) {
                    if ("string" == typeof e && v.ComparisonOffset.some(t => t === e)) return e;
                    throw new u.CustomDashboardValidationError(t, "".concat(t, " must be a valid comparison offset."))
                }
            }(r.relativeOffset, "".concat(t, ".relativeOffset")),
            customStartTimeMs: function(e, t) {
                if (void 0 !== e) return T(e, t)
            }(r.customStartTimeMs, "".concat(t, ".customStartTimeMs"))
        }
    }

    function E(e, t) {
        if ("boolean" != typeof e) throw new u.CustomDashboardValidationError(t, "".concat(t, " must be a boolean."));
        return e
    }

    function I(e, t) {
        let r = C(e, t),
            n = Date.parse(r);
        if (!A.test(r) || !Number.isFinite(n)) throw new u.CustomDashboardValidationError(t, "".concat(t, " must be an ISO-8601 timestamp."));
        return r
    }

    function R(e) {
        return (t, r) => {
            let n;
            return null != t && (n = e(t, r)), n
        }
    }
    let _ = R(I),
        N = R(w),
        M = R(E);

    function V(e) {
        return e.trim()
    }
    e.s(["asBoolean", 0, E, "asIsoTimestamp", 0, I, "asNonEmptyString", 0, w, "asNumber", 0, T, "asOptionalIsoTimestamp", 0, _, "asOptionalNonEmptyString", 0, N, "asRecord", 0, D, "asString", 0, C, "isRecord", 0, b, "optional", 0, R, "trimmed", 0, V, "validateOptionalBoolean", 0, M, "validatePreviousPeriodOverlay", 0, S], 115232);
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
    let eo = R(function(e, t) {
            let r = C(e, t);
            if (!ee(r)) throw new u.CustomDashboardValidationError(t, "".concat(t, ' "').concat(r, '" is not a known chart aggregation.'));
            return r
        }),
        es = R(function(e, t) {
            if ("none" !== e && "weekly" !== e) throw new u.CustomDashboardValidationError(t, "".concat(t, ' must be "none" or "weekly".'));
            return e
        }),
        ec = R(function(e, t) {
            let r = C(e, t);
            if (r !== l.SummaryCardTitleSource.Auto && r !== l.SummaryCardTitleSource.Custom) throw new u.CustomDashboardValidationError(t, "".concat(t, ' must be "Auto" or "Custom".'));
            return r
        });

    function eu(e, t) {
        let r = D(e, t),
            n = w(r.pseudoDimensionKey, "".concat(t, ".pseudoDimensionKey"));
        if (n !== K && n !== j) throw new u.CustomDashboardValidationError("".concat(t, ".pseudoDimensionKey"), "".concat(t, ".pseudoDimensionKey must be a supported pseudo-dimension key."));
        let a = w(r.variantKey, "".concat(t, ".variantKey"));
        if (n === K && !en(a)) throw new u.CustomDashboardValidationError("".concat(t, ".variantKey"), "".concat(t, ".variantKey must be a known RAQI percentile for PercentileType."));
        if (n === j && !er(a)) throw new u.CustomDashboardValidationError("".concat(t, ".variantKey"), "".concat(t, ".variantKey must be a known RAQI aggregation for AggregationType."));
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
            }(e)) throw new u.CustomDashboardValidationError(t, "".concat(t, " contains unsupported control characters."));
        return e
    }

    function ed(e) {
        let t = el(V(e), "name");
        if (0 === t.length) throw new u.CustomDashboardValidationError("name", "Dashboard name is required.");
        if (t.length > l.MAX_DASHBOARD_NAME_LENGTH) throw new u.CustomDashboardValidationError("name", "Dashboard name cannot exceed ".concat(l.MAX_DASHBOARD_NAME_LENGTH, " characters."));
        return t
    }

    function eh(e) {
        if (void 0 === e) return;
        let t = el(V(e), "description");
        if (t.length > l.MAX_DASHBOARD_DESCRIPTION_LENGTH) throw new u.CustomDashboardValidationError("description", "Description cannot exceed ".concat(l.MAX_DASHBOARD_DESCRIPTION_LENGTH, " characters."));
        return 0 === t.length ? void 0 : t
    }

    function em(e, t) {
        if (null == e) return [];
        if (!Array.isArray(e)) throw new u.CustomDashboardValidationError(t, "".concat(t, " must be an array."));
        return e.map((e, r) => {
            let n = D(e, "".concat(t, "[").concat(r, "]")),
                a = el(w(n.dimension, "".concat(t, "[").concat(r, "].dimension")), "".concat(t, "[").concat(r, "].dimension")),
                {
                    values: i
                } = n;
            if (!Array.isArray(i) || 0 === i.length || !i.every(ei)) throw new u.CustomDashboardValidationError("".concat(t, "[").concat(r, "].values"), "".concat(t, "[").concat(r, "].values must be a non-empty array of non-empty strings."));
            return {
                dimension: a,
                values: i.map((e, n) => el(e, "".concat(t, "[").concat(r, "].values[").concat(n, "]")))
            }
        })
    }

    function ep(e, t) {
        if (null == e) throw new u.CustomDashboardValidationError(t, "".concat(t, " must be an array."));
        return em(e, t)
    }

    function ef(e, t) {
        if (null == e) return;
        let r = el(V(C(e, t)), t);
        if (r.length > l.MAX_TILE_TITLE_LENGTH) throw new u.CustomDashboardValidationError(t, "Tile title cannot exceed ".concat(l.MAX_TILE_TITLE_LENGTH, " characters."));
        return 0 === r.length ? void 0 : r
    }

    function ey(e, t) {
        if (null == e) return;
        if (!Array.isArray(e)) throw new u.CustomDashboardValidationError(t, "".concat(t, " must be an array."));
        let r = e.map((e, r) => {
            let n = w(e, "".concat(t, "[").concat(r, "]"));
            if (!$(n)) throw new u.CustomDashboardValidationError("".concat(t, "[").concat(r, "]"), "".concat(t, "[").concat(r, "] must be a canonical RAQI dimension."));
            return n
        });
        return r.length > 0 ? r : void 0
    }

    function eg(e, t) {
        if (null == e) return;
        if (!Array.isArray(e)) throw new u.CustomDashboardValidationError(t, "".concat(t, " must be an array."));
        let r = e.map((e, r) => {
            let n = w(e, "".concat(t, "[").concat(r, "]"));
            if (!Z(n)) throw new u.CustomDashboardValidationError("".concat(t, "[").concat(r, "]"), "".concat(t, "[").concat(r, "] must be a known annotation type."));
            return n
        });
        return r.length > 0 ? r : void 0
    }

    function ev(e, t) {
        let r, n = D(e, t),
            a = (r = eb(n.variantSelections, "".concat(t, ".variantSelections"), eu)).length > 0 ? r : void 0;
        if (void 0 !== n.metricKey && null !== n.metricKey && void 0 !== n.computedMetric && null !== n.computedMetric) throw new u.CustomDashboardValidationError(t, "".concat(t, " must not include both metricKey and computedMetric."));
        return void 0 !== n.computedMetric && null !== n.computedMetric ? {
            computedMetric: function(e, t) {
                if (! function(e) {
                        if (!b(e)) return !1;
                        let {
                            sources: t,
                            formula: r,
                            name: n,
                            l7Smoothing: a
                        } = e;
                        return !!Array.isArray(t) && 0 !== t.length && "string" == typeof r && 0 !== r.trim().length && (void 0 === n || "string" == typeof n) && (void 0 === a || "boolean" == typeof a) && t.every(e => b(e) && "string" == typeof e.key && e.key.length > 0 && void 0 !== e.metric)
                    }(e)) throw new u.CustomDashboardValidationError(t, "".concat(t, " must be a computed metric object."));
                let r = (0, c.serializeComputedMetricToQueryParam)(e),
                    n = (0, c.deserializeComputedMetricFromQueryParam)(r);
                if (!r || !n) throw new u.CustomDashboardValidationError(t, "".concat(t, " is not a supported computed metric."));
                return n
            }(n.computedMetric, "".concat(t, ".computedMetric")),
            variantSelections: a
        } : {
            metricKey: function(e, t) {
                let r = C(e, t);
                if (!ea(r)) throw new u.CustomDashboardValidationError(t, "".concat(t, ' "').concat(r, '" is not a known RAQI metric.'));
                return r
            }(n.metricKey, "".concat(t, ".metricKey")),
            variantSelections: a
        }
    }

    function eA(e, t) {
        let r = D(e, t);
        return {
            metric: ev(r.metric, "".concat(t, ".metric")),
            seriesKey: el(w(r.seriesKey, "".concat(t, ".seriesKey")), "".concat(t, ".seriesKey")),
            displayName: void 0 !== r.displayName && null !== r.displayName ? el(V(C(r.displayName, "".concat(t, ".displayName"))), "".concat(t, ".displayName")) : void 0,
            aggregation: eo(r.aggregation, "".concat(t, ".aggregation")),
            filters: void 0 === r.filters ? void 0 : ep(r.filters, "".concat(t, ".filters"))
        }
    }

    function eb(e, t, r) {
        if (null == e) return [];
        if (!Array.isArray(e)) throw new u.CustomDashboardValidationError(t, "".concat(t, " must be an array."));
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
                        if ("Chart" !== r.type) throw new u.CustomDashboardValidationError("".concat(t, ".type"), "".concat(t, '.type must be "Chart".'));
                        return function(e, t) {
                            let r = D(e.dataSpec, "".concat(t, ".dataSpec")),
                                n = D(e.chartSpec, "".concat(t, ".chartSpec")),
                                i = C(n.chartType, "".concat(t, ".chartSpec.chartType"));
                            if (!X(k, i)) throw new u.CustomDashboardValidationError("".concat(t, ".chartSpec.chartType"), "".concat(t, '.chartSpec.chartType "').concat(i, '" is not supported.'));
                            let s = b(n.overlays) ? n.overlays : void 0,
                                c = s ? {
                                    genreBenchmark: M(s.genreBenchmark, "".concat(t, ".chartSpec.overlays.genreBenchmark")),
                                    similarExperienceBenchmark: M(s.similarExperienceBenchmark, "".concat(t, ".chartSpec.overlays.similarExperienceBenchmark")),
                                    topExperienceBenchmark: M(s.topExperienceBenchmark, "".concat(t, ".chartSpec.overlays.topExperienceBenchmark")),
                                    previousPeriod: S(s.previousPeriod, "".concat(t, ".chartSpec.overlays.previousPeriod")),
                                    quota: M(s.quota, "".concat(t, ".chartSpec.overlays.quota"))
                                } : void 0,
                                l = eb(r.metrics, "".concat(t, ".dataSpec.metrics"), eA),
                                d = i === a.ChartType.Table;
                            if (!d && 1 !== l.length) throw new u.CustomDashboardValidationError("".concat(t, ".dataSpec.metrics"), "".concat(t, ".dataSpec.metrics must contain exactly one metric."));
                            if (d && (l.length < 1 || l.length > o.MAX_TABLE_METRIC_COLUMNS)) throw new u.CustomDashboardValidationError("".concat(t, ".dataSpec.metrics"), "".concat(t, ".dataSpec.metrics must contain between 1 and ").concat(o.MAX_TABLE_METRIC_COLUMNS, " metrics for table charts."));
                            let h = r.breakdownDimensions,
                                m = null == h ? void 0 : eb(h, "".concat(t, ".dataSpec.breakdownDimensions"), (e, t) => {
                                    var r;
                                    let n = null != (r = N(e, t)) ? r : "";
                                    if (n.length > 0 && !J(n)) throw new u.CustomDashboardValidationError(t, "".concat(t, " must be a persistable breakdown dimension."));
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
                                        if (!X(P, r)) throw new u.CustomDashboardValidationError(t, "".concat(t, ' "').concat(r, '" is not a known time interval.'));
                                        return r
                                    }(r.granularity, "".concat(t, ".dataSpec.granularity")),
                                    filters: ep(r.filters, "".concat(t, ".dataSpec.filters"))
                                },
                                chartSpec: {
                                    chartType: i,
                                    overlays: c,
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
                        if ("SummaryCard" !== r.type) throw new u.CustomDashboardValidationError("".concat(t, ".type"), "".concat(t, '.type must be "SummaryCard".'));
                        let n = b(r.overlays) ? r.overlays : void 0,
                            a = ev(r.metric, "".concat(t, ".metric")),
                            i = function(e, t) {
                                let r = C(e, t);
                                if (!(X(O, r) || x.test(r))) throw new u.CustomDashboardValidationError(t, "".concat(t, ' "').concat(r, '" is not a known summary-card aggregation.'));
                                return r
                            }(r.aggregation, "".concat(t, ".aggregation")),
                            o = a.metricKey ? g(a.metricKey, i) : i;
                        if (!o) throw new u.CustomDashboardValidationError("".concat(t, ".aggregation"), "".concat(t, ".aggregation is not supported by the selected metric."));
                        return {
                            type: "SummaryCard",
                            tileId: w(r.tileId, "".concat(t, ".tileId")),
                            title: ef(r.title, "".concat(t, ".title")),
                            titleSource: ec(r.titleSource, "".concat(t, ".titleSource")),
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
            throw new u.CustomDashboardValidationError("".concat(t, ".component.type"), "".concat(t, '.component.type must be "Chart" or "SummaryCard".'))
        }
        if ("Grid" === r.type) {
            let e = r.columnCount;
            if (1 !== e && 2 !== e) throw new u.CustomDashboardValidationError("".concat(t, ".columnCount"), "".concat(t, ".columnCount must be 1 or 2."));
            let n = eb(r.children, "".concat(t, ".children"), eD);
            if (0 === n.length || n.length > e && !n.every(d)) throw new u.CustomDashboardValidationError("".concat(t, ".children"), "".concat(t, ".children must contain between 1 and ").concat(e, " child node(s)."));
            return {
                type: "Grid",
                columnCount: e,
                children: n
            }
        }
        if ("Flex" === r.type || "Stack" === r.type) return {
            type: r.type,
            children: eb(r.children, "".concat(t, ".children"), eD)
        };
        throw new u.CustomDashboardValidationError("".concat(t, ".type"), "".concat(t, '.type must be "Component", "Grid", "Flex", or "Stack".'))
    }

    function eC(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
            {
                enforceTileCaps: r = !0
            } = t,
            a = D(e, "config"),
            i = D(a.page, "config.page");
        if (i.mode !== l.DashboardPageMode.Untabbed) throw new u.CustomDashboardValidationError("config.page.mode", 'config.page.mode must be "Untabbed" in v1.');
        let o = D(i.surface, "config.page.surface"),
            s = eb(o.bodyNodes, "config.page.surface.bodyNodes", eD),
            c = new Set,
            d = 0,
            h = 0,
            f = (e, t, r) => {
                if (c.has(e)) throw new u.CustomDashboardValidationError(r, 'Duplicate tileId "'.concat(e, '".'));
                c.add(e), "Chart" === t ? h += 1 : d += 1
            };
        if (s.forEach((e, t) => (function e(t, r, n) {
                "Component" === t.type ? r("Chart" === t.component.type ? t.component.chart.tileId : t.component.summaryCard.tileId, t.component.type, "".concat(n, ".component.").concat("Chart" === t.component.type ? "chart" : "summaryCard", ".tileId")) : t.children.forEach((t, a) => e(t, r, "".concat(n, ".children[").concat(a, "]")))
            })(e, f, "config.page.surface.bodyNodes[".concat(t, "]"))), r) {
            if (d > l.MAX_SUMMARY_CARDS_PER_DASHBOARD) throw new u.CustomDashboardValidationError("config.page.surface.bodyNodes", "A dashboard may have at most ".concat(l.MAX_SUMMARY_CARDS_PER_DASHBOARD, " summary cards."));
            if (h > l.MAX_CHART_TILES_PER_DASHBOARD) throw new u.CustomDashboardValidationError("config.page.surface.bodyNodes", "A dashboard may have at most ".concat(l.MAX_CHART_TILES_PER_DASHBOARD, " chart tiles."))
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
                                if ("DateRange" !== r.type) throw new u.CustomDashboardValidationError("".concat(t, ".type"), "".concat(t, '.type must be "None" or "DateRange".'));
                                return {
                                    type: "DateRange",
                                    defaultSelection: function(e, t) {
                                        if (null == e) return;
                                        let r = D(e, t);
                                        if ("Relative" === r.type) {
                                            if (!et(r.rangeType) || r.rangeType === n.RAQIV2DateRangeType.Custom) throw new u.CustomDashboardValidationError("".concat(t, ".rangeType"), "".concat(t, ".rangeType must be a preset date range."));
                                            if (!m(r.rangeType)) throw new u.CustomDashboardValidationError("".concat(t, ".rangeType"), "".concat(t, ".rangeType must span less than ").concat(56, " days."));
                                            return {
                                                type: "Relative",
                                                rangeType: r.rangeType
                                            }
                                        }
                                        if ("Custom" === r.type) {
                                            let e = T(r.startTimeMs, "".concat(t, ".startTimeMs")),
                                                n = T(r.endTimeMs, "".concat(t, ".endTimeMs"));
                                            if (e > n) throw new u.CustomDashboardValidationError(t, "".concat(t, " custom startTimeMs must be before endTimeMs."));
                                            if (!p(e, n)) throw new u.CustomDashboardValidationError(t, "".concat(t, " custom date range must span less than ").concat(56, " days."));
                                            return {
                                                type: "Custom",
                                                startTimeMs: e,
                                                endTimeMs: n
                                            }
                                        }
                                        throw new u.CustomDashboardValidationError("".concat(t, ".type"), "".concat(t, '.type must be "Relative" or "Custom".'))
                                    }(r.defaultSelection, "".concat(t, ".defaultSelection"))
                                }
                            }(a.timeRangeOptions, "".concat(t, ".timeRangeOptions")),
                            filterDimensions: ey(a.filterDimensions, "".concat(t, ".filterDimensions")),
                            defaultFilters: (r = em(a.defaultFilters, "".concat(t, ".defaultFilters"))).length > 0 ? r : void 0,
                            breakdownDimensions: ey(a.breakdownDimensions, "".concat(t, ".breakdownDimensions")),
                            defaultBreakdown: function(e, t) {
                                if (null == e) return;
                                if (!Array.isArray(e)) throw new u.CustomDashboardValidationError(t, "".concat(t, " must be an array."));
                                let r = e.map((e, r) => {
                                    let n = w(e, "".concat(t, "[").concat(r, "]"));
                                    if (!W(n)) throw new u.CustomDashboardValidationError("".concat(t, "[").concat(r, "]"), "".concat(t, "[").concat(r, "] must be a known RAQI dimension."));
                                    return n
                                });
                                return r.length > 0 ? r : void 0
                            }(a.defaultBreakdown, "".concat(t, ".defaultBreakdown")),
                            defaultGranularity: function(e, t) {
                                if (null == e) return;
                                let r = w(e, t);
                                if (!L.includes(r)) throw new u.CustomDashboardValidationError(t, "".concat(t, " must be a known granularity."));
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
        var t;
        let r, n = D(e, "document");
        if (n.schemaVersion !== l.CUSTOM_DASHBOARD_CURRENT_SCHEMA_VERSION) throw new u.CustomDashboardValidationError("schemaVersion", "schemaVersion must equal ".concat(l.CUSTOM_DASHBOARD_CURRENT_SCHEMA_VERSION, " (got ").concat(String(n.schemaVersion), "). Run applyMigrations first."));
        let {
            status: a
        } = n;
        if (!("string" == typeof a && X(B, a))) throw new u.CustomDashboardValidationError("status", 'status must be "draft" or "published".');
        void 0 !== n.description && null !== n.description && (r = eh(C(n.description, "description")));
        let i = E(n.isPinned, "isPinned"),
            o = i ? _(n.pinnedAt, "pinnedAt") : void 0;
        if (void 0 === n.config || null === n.config) throw new u.CustomDashboardValidationError("config", "config is required. Service-layer create() must substitute EMPTY_DASHBOARD_CONFIG before validation.");
        return {
            ...n,
            id: w(n.id, "id"),
            schemaVersion: l.CUSTOM_DASHBOARD_CURRENT_SCHEMA_VERSION,
            universeId: T(n.universeId, "universeId"),
            name: ed(C(n.name, "name")),
            description: r,
            status: a,
            isPinned: i,
            pinnedAt: o,
            createdAt: I(n.createdAt, "createdAt"),
            updatedAt: I(n.updatedAt, "updatedAt"),
            publishedAt: _(n.publishedAt, "publishedAt"),
            createdByUserId: T(n.createdByUserId, "createdByUserId"),
            createdByUsername: C(null != (t = n.createdByUsername) ? t : "", "createdByUsername"),
            updatedByUserId: R(T)(n.updatedByUserId, "updatedByUserId"),
            updatedByUsername: R(w)(n.updatedByUsername, "updatedByUsername"),
            config: eC(n.config, {
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
    var n = e.i(379843);

    function a(e) {
        return e.length > n.MAX_DASHBOARD_NAME_LENGTH ? e.slice(0, n.MAX_DASHBOARD_NAME_LENGTH) : e
    }

    function i(e, t) {
        let r = n.MAX_DASHBOARD_NAME_LENGTH - t.length;
        return r <= 0 ? "" : e.length > r ? e.slice(0, r) : e
    }

    function o(e, t) {
        let r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 1,
            n = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : 1e3,
            a = new Set(Array.from(e, e => e.trim())),
            i = Math.max(1, r),
            o = 0;
        for (; a.has(t(i)) && o < n;) i += 1, o += 1;
        return t(i)
    }
    e.s(["DUPLICATE_COPY_NUMBERED_SUFFIX_START", 0, 2, "buildDuplicateDashboardName", 0, function(e, t, r) {
        let n = new Set(Array.from(e, e => e.trim())),
            s = " ".concat(r.first),
            c = "".concat(i(t, s)).concat(s);
        return n.has(c) ? a(o(e, e => {
            let n = " ".concat(r.numbered(e));
            return "".concat(i(t, n)).concat(n)
        }, 2, 1e3)) : c
    }, "clipDashboardName", 0, a, "findUnusedNumberedName", 0, o, "suggestDefaultName", 0, function(e) {
        return a(o(e, e => "Dashboard #".concat(e)))
    }], 582078);
    var s = e.i(721281),
        c = e.i(619130),
        u = e.i(650502);
    let l = (0, c.default)({
        baseUrl: (0, u.getBEDEV2ServiceBasePath)("analytics-custom-dashboards"),
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

    function m(e) {
        return "object" == typeof e && null !== e && !Array.isArray(e)
    }

    function p(e, t) {
        var r, n, a, i;
        let o = null != (r = null == e ? void 0 : e.status) ? r : 0,
            s = function(e) {
                if (!m(e)) return;
                let {
                    code: t,
                    message: r,
                    error: n,
                    details: a
                } = e, i = function(e) {
                    if (!m(e)) return;
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
        throw new d(o, c, s)
    }
    e.s(["CustomDashboardsApiRequestError", 0, d, "createDefaultCustomDashboardsApiClient", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : l;
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
                return (a || !n) && p(i, a), n
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
                return (n || !r) && p(a, n), r
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
                return (o || !i) && p(s, o), null != (r = i.dashboard) ? r : {}
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
                return (c || !s) && p(u, c), null != (r = s.dashboard) ? r : {}
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
                        patch: h(o)
                    }
                });
                return (c || !s) && p(u, c), null != (r = s.metadata) ? r : {}
            },
            async publishDashboard(t) {
                var r;
                let {
                    universeId: n,
                    dashboardId: a,
                    expectedHeadEtag: i,
                    document: o,
                    metadataPatch: s
                } = t, c = void 0 === s ? void 0 : h(s), u = {
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
                    response: m
                } = await e.POST("/v1/universes/{universeId}/custom-dashboards/{dashboardId}/publish", {
                    params: {
                        path: {
                            universeId: n,
                            dashboardId: a
                        }
                    },
                    body: u
                });
                return (d || !l) && p(m, d), null != (r = l.dashboard) ? r : {}
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
                return (c || !s) && p(u, c), null != (r = s.dashboard) ? r : {}
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
                a && p(i, a)
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
                if ((o || !i) && p(s, o), "boolean" != typeof i.isFiltered) {
                    var c;
                    throw new d(null != (c = null == s ? void 0 : s.status) ? c : 0, "Response is missing isFiltered")
                }
                return {
                    isFiltered: i.isFiltered
                }
            }
        }
    }], 852209);
    var f = e.i(283561);
    e.s(["mapCustomDashboardsApiError", 0, function(e, t) {
        var r, n, a, i, o, s, c, u, l;
        if (e instanceof f.CustomDashboardServiceError) return e;
        if (!(e instanceof d)) return new f.CustomDashboardStorageWriteError(e);
        let h = null != (i = null != (o = null == (s = e.body) ? void 0 : s.message) ? o : null == (u = e.body) || null == (c = u.error) ? void 0 : c.message) ? i : e.message,
            m = (null != (l = "".concat(null != h ? h : "", " ").concat(null != (r = null == (a = e.body) || null == (n = a.error) ? void 0 : n.status) ? r : "")) ? l : "").toUpperCase().replaceAll("-", "_");
        return 404 === e.status || m.includes("NOT_FOUND") ? new f.CustomDashboardNotFoundError(null != t ? t : "unknown") : 409 === e.status || m.includes("VERSION_CONFLICT") || m.includes("CONFLICT") ? new f.CustomDashboardVersionConflictError(null != t ? t : "unknown") : 429 === e.status || m.includes("QUOTA_EXCEEDED") || m.includes("RESOURCE_EXHAUSTED") ? new f.CustomDashboardQuotaExceededError(h) : 401 === e.status || m.includes("UNAUTHENTICATED") ? new f.CustomDashboardUnauthenticatedError(h) : 403 === e.status || m.includes("PERMISSION_DENIED") ? new f.CustomDashboardPermissionDeniedError(h) : 400 === e.status || m.includes("VALIDATION_FAILED") || m.includes("INVALID_ARGUMENT") ? new f.CustomDashboardValidationError("document", null != h ? h : "Invalid custom dashboard.") : 503 === e.status || m.includes("UNAVAILABLE") ? new f.CustomDashboardNotAvailableError : new f.CustomDashboardStorageWriteError(e)
    }], 482922);
    var y = e.i(36826);
    let g = {
        supportedAnnotationTypes: [y.AnnotationType.PlaceIcon, y.AnnotationType.PlaceThumbnail, y.AnnotationType.PlaceVideo, y.AnnotationType.PlaceVersion, y.AnnotationType.Benchmark, y.AnnotationType.LiveEvent, y.AnnotationType.CustomMatchmaking, y.AnnotationType.RetentionCorhortDisclaimer, y.AnnotationType.ConfigVersion, y.AnnotationType.Announcement],
        defaultAnnotationTypes: [],
        showAnnotationsControl: !0
    };
    e.s(["CUSTOM_DASHBOARD_SURFACE_ANNOTATION_OPTIONS", 0, g, "resolveCustomDashboardSupportedAnnotationTypes", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [],
            t = g.supportedAnnotationTypes,
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

//# debugId=659491bd-cc8f-6474-f2e7-2dea642ccbb3
//# sourceMappingURL=154bs-2w8ccq5.js.map