;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "a6e67dd0-f380-82fa-2d11-e55009a96a70")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 138726, e => {
    "use strict";
    var t = e.i(221628),
        n = e.i(416340),
        i = e.i(237401),
        r = e.i(458451),
        o = e.i(550742),
        s = e.i(969687),
        a = e.i(119636),
        l = e.i(706442),
        u = e.i(71375),
        c = e.i(829425);
    let d = (0, l.makeStyles)()(e => ({
        loading: {
            width: "50%",
            maxWidth: 250,
            margin: "250px auto"
        },
        background: {
            ...(0, s.getWebViewLoadingStyles)(),
            height: "100%",
            width: "100%",
            margin: "0"
        },
        content: {
            ".studio-webview &": {
                alignItems: "center",
                display: "flex",
                height: "100%"
            },
            maxWidth: 1500,
            width: "100%",
            margin: "auto",
            padding: 32,
            [e.breakpoints.down("XLarge")]: {
                padding: 24
            }
        }
    }));
    e.s(["default", 0, e => {
        let {
            children: s
        } = e, {
            classes: {
                loading: l,
                content: f,
                background: h
            }
        } = d(), {
            status: v,
            login: g
        } = (0, r.useRobloxAuthentication)(), m = (0, o.usePolyfills)();
        return ((0, n.useEffect)(() => {
            "unauthenticated" === v && g(), "logged-out" === v && i.default.push(c.creatorHub.getUrl())
        }, [g, v]), "initial" !== v && "loading" !== v && m) ? "error" === v ? (0, t.jsx)("div", {
            className: h,
            children: (0, t.jsx)("div", {
                className: f,
                children: (0, t.jsx)(u.default, {
                    onReload: () => {
                        i.default.reload()
                    }
                })
            })
        }) : (0, t.jsx)(t.Fragment, {
            children: s
        }) : (0, t.jsx)("div", {
            className: h,
            children: (0, t.jsx)("div", {
                className: f,
                children: (0, t.jsx)(a.LinearProgress, {
                    classes: {
                        root: l
                    },
                    title: "loading"
                })
            })
        })
    }])
}, 776344, e => {
    "use strict";
    var t = e.i(221628),
        n = e.i(416340),
        i = e.i(706442),
        r = e.i(982690);
    let o = (0, i.makeStyles)()((e, t) => {
            let {
                gap: n
            } = t;
            return {
                gap: {
                    gap: n
                },
                flex: {
                    display: "flex"
                },
                justifyContentCenter: {
                    justifyContent: "center"
                },
                justifyContentFlexStart: {
                    justifyContent: "flex-start"
                },
                justifyContentFlexEnd: {
                    justifyContent: "flex-end"
                },
                justifyContentSpaceBetween: {
                    justifyContent: "space-between"
                },
                justifyContentSpaceAround: {
                    justifyContent: "space-around"
                },
                justifyContentSpaceEvenly: {
                    justifyContent: "space-evenly"
                },
                alignItemsCenter: {
                    alignItems: "center"
                },
                alignItemsFlexStart: {
                    alignItems: "flex-start"
                },
                alignItemsFlexEnd: {
                    alignItems: "flex-end"
                },
                flexDirectionRow: {
                    flexDirection: "row"
                },
                flexDirectionRowReverse: {
                    flexDirection: "row-reverse"
                },
                flexDirectionColumn: {
                    flexDirection: "column"
                },
                flexDirectionColumnReverse: {
                    flexDirection: "column-reverse"
                },
                flexWrapWrap: {
                    flexWrap: "wrap"
                },
                flexWrapWrapReverse: {
                    flexWrap: "wrap-reverse"
                },
                flexWrapNoWrap: {
                    flexWrap: "nowrap"
                }
            }
        }),
        s = (0, n.forwardRef)((e, n) => {
            let {
                id: i,
                className: s,
                classes: a,
                flexDirection: l,
                flexWrap: u,
                justifyContent: c,
                alignItems: d,
                gap: f = 0,
                children: h
            } = e, {
                classes: {
                    flex: v,
                    ...g
                },
                cx: m
            } = o({
                gap: f
            });
            return (0, t.jsx)("div", {
                ref: n,
                id: i,
                className: m(v, g.gap, s, null == a ? void 0 : a.root, g["flexDirection".concat((0, r.snakeToPascalCase)(null != l ? l : ""))], g["flexWrap".concat((0, r.snakeToPascalCase)(null != u ? u : ""))], g["alignItems".concat((0, r.snakeToPascalCase)(null != d ? d : ""))], g["justifyContent".concat((0, r.snakeToPascalCase)(null != c ? c : ""))]),
                children: h
            })
        });
    s.displayName = "Flex", e.s(["Flex", 0, s, "default", 0, s])
}, 462863, e => {
    "use strict";
    var t = e.i(221628),
        n = e.i(921394);
    e.s(["default", 0, e => {
        let {
            lightSrc: i,
            darkSrc: r,
            alt: o,
            ...s
        } = e, {
            themeMode: a
        } = (0, n.useThemeMode)();
        return (0, t.jsx)("img", {
            src: "dark" === a && null != r ? r : i,
            alt: o,
            ...s
        })
    }])
}, 71375, e => {
    "use strict";
    var t = e.i(221628),
        n = e.i(429884),
        i = e.i(666554),
        r = e.i(318974),
        o = e.i(79187),
        s = e.i(921394),
        a = e.i(881670);
    let l = (0, o.withTranslation)(e => {
        let {
            onReload: o
        } = e, {
            themeMode: a
        } = (0, s.useThemeMode)(), l = "dark" === a ? i.default : r.default;
        return (0, t.jsx)(n.LoadError, {
            src: l,
            onReload: o
        })
    }, [a.TranslationNamespace.Error]);
    e.s(["default", 0, l])
}, 982690, e => {
    "use strict";
    var t = e.i(851439);
    e.i(252842);
    var n = void 0;
    e.s(["alpha", 0, (e, t) => t < 16 ? "".concat(e, "0").concat(t.toString(16)) : "".concat(e).concat(t.toString(16)), "arrayToChunks", 0, (e, t) => {
        let n = [];
        for (let i = 0; i < e.length; i += t) {
            let r = e.slice(i, i + t);
            n.push(r)
        }
        return n
    }, "capitalizeFirstLetter", 0, (e, t) => 0 === t.length ? t : t.charAt(0).toLocaleUpperCase(e || "en-US") + t.slice(1).toLocaleLowerCase(e || "en-US"), "dayToMs", 0, e => 60 * e * 144e4, "debounce", 0, function(e) {
        let t, i = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 300;
        return [function() {
            for (var r = arguments.length, o = Array(r), s = 0; s < r; s++) o[s] = arguments[s];
            clearTimeout(t), t = setTimeout(() => {
                e.apply(n, o)
            }, i)
        }, () => {
            clearTimeout(t)
        }]
    }, "getRecordEntries", 0, e => Object.entries(e), "isNonEmptyString", 0, e => "string" == typeof e && e.trim().length > 0, "shuffle", 0, (e, n) => {
        let i = (0, t.default)(n),
            r = [...e],
            o = e.length;
        for (; o;) {
            let e = Math.floor(i() * o),
                t = r[o -= 1];
            r[o] = r[e], r[e] = t
        }
        return r
    }, "snakeToPascalCase", 0, e => e.split("-").reduce((e, t) => {
        var n;
        return e + (null != (n = t[0]) ? n : "").toUpperCase() + t.slice(1)
    }, ""), "throttle", 0, function(e, t) {
        let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "leading_and_trailing",
            i = null,
            r = null,
            o = null,
            s = () => !!r && (e.call(o, ...r), r = null, o = null, !0),
            a = () => {
                i = null, ("trailing" === n || "leading_and_trailing" === n) && s() && (i = setTimeout(a, t))
            };
        return [function() {
            for (var e = arguments.length, l = Array(e), u = 0; u < e; u++) l[u] = arguments[u];
            r = l, o = this, i || (("leading" === n || "leading_and_trailing" === n) && s(), i = setTimeout(a, t))
        }, () => {
            i && (clearTimeout(i), i = null)
        }]
    }])
}, 688412, (e, t, n) => {
    ! function(t, n, i) {
        function r(e) {
            var t, n = this,
                i = (t = 0xefc8249d, function(e) {
                    e = String(e);
                    for (var n = 0; n < e.length; n++) {
                        var i = .02519603282416938 * (t += e.charCodeAt(n));
                        t = i >>> 0, i -= t, i *= t, t = i >>> 0, i -= t, t += 0x100000000 * i
                    }
                    return (t >>> 0) * 23283064365386963e-26
                });
            n.next = function() {
                var e = 2091639 * n.s0 + 23283064365386963e-26 * n.c;
                return n.s0 = n.s1, n.s1 = n.s2, n.s2 = e - (n.c = 0 | e)
            }, n.c = 1, n.s0 = i(" "), n.s1 = i(" "), n.s2 = i(" "), n.s0 -= i(e), n.s0 < 0 && (n.s0 += 1), n.s1 -= i(e), n.s1 < 0 && (n.s1 += 1), n.s2 -= i(e), n.s2 < 0 && (n.s2 += 1)
        }

        function o(e, t) {
            return t.c = e.c, t.s0 = e.s0, t.s1 = e.s1, t.s2 = e.s2, t
        }

        function s(e, t) {
            var n = new r(e),
                i = t && t.state,
                s = n.next;
            return s.int32 = function() {
                return 0x100000000 * n.next() | 0
            }, s.double = function() {
                return s() + (2097152 * s() | 0) * 11102230246251565e-32
            }, s.quick = s, i && ("object" == typeof i && o(i, n), s.state = function() {
                return o(n, {})
            }), s
        }
        if (n && n.exports) n.exports = s;
        else if (i && i.amd) e.r, void 0 !== s && e.v(s);
        else this.alea = s
    }(e.e, t, "function" == typeof define && define)
}, 589535, (e, t, n) => {
    ! function(t, n, i) {
        function r(e) {
            var t = this,
                n = "";
            t.x = 0, t.y = 0, t.z = 0, t.w = 0, t.next = function() {
                var e = t.x ^ t.x << 11;
                return t.x = t.y, t.y = t.z, t.z = t.w, t.w ^= t.w >>> 19 ^ e ^ e >>> 8
            }, e === (0 | e) ? t.x = e : n += e;
            for (var i = 0; i < n.length + 64; i++) t.x ^= n.charCodeAt(i), t.next()
        }

        function o(e, t) {
            return t.x = e.x, t.y = e.y, t.z = e.z, t.w = e.w, t
        }

        function s(e, t) {
            var n = new r(e),
                i = t && t.state,
                s = function() {
                    return (n.next() >>> 0) / 0x100000000
                };
            return s.double = function() {
                do var e = ((n.next() >>> 11) + (n.next() >>> 0) / 0x100000000) / 2097152; while (0 === e) return e
            }, s.int32 = n.next, s.quick = s, i && ("object" == typeof i && o(i, n), s.state = function() {
                return o(n, {})
            }), s
        }
        if (n && n.exports) n.exports = s;
        else if (i && i.amd) e.r, void 0 !== s && e.v(s);
        else this.xor128 = s
    }(e.e, t, "function" == typeof define && define)
}, 516501, (e, t, n) => {
    ! function(t, n, i) {
        function r(e) {
            var t = this,
                n = "";
            t.next = function() {
                var e = t.x ^ t.x >>> 2;
                return t.x = t.y, t.y = t.z, t.z = t.w, t.w = t.v, (t.d = t.d + 362437 | 0) + (t.v = t.v ^ t.v << 4 ^ (e ^ e << 1)) | 0
            }, t.x = 0, t.y = 0, t.z = 0, t.w = 0, t.v = 0, e === (0 | e) ? t.x = e : n += e;
            for (var i = 0; i < n.length + 64; i++) t.x ^= n.charCodeAt(i), i == n.length && (t.d = t.x << 10 ^ t.x >>> 4), t.next()
        }

        function o(e, t) {
            return t.x = e.x, t.y = e.y, t.z = e.z, t.w = e.w, t.v = e.v, t.d = e.d, t
        }

        function s(e, t) {
            var n = new r(e),
                i = t && t.state,
                s = function() {
                    return (n.next() >>> 0) / 0x100000000
                };
            return s.double = function() {
                do var e = ((n.next() >>> 11) + (n.next() >>> 0) / 0x100000000) / 2097152; while (0 === e) return e
            }, s.int32 = n.next, s.quick = s, i && ("object" == typeof i && o(i, n), s.state = function() {
                return o(n, {})
            }), s
        }
        if (n && n.exports) n.exports = s;
        else if (i && i.amd) e.r, void 0 !== s && e.v(s);
        else this.xorwow = s
    }(e.e, t, "function" == typeof define && define)
}, 216692, (e, t, n) => {
    ! function(t, n, i) {
        function r(e) {
            var t = this;
            t.next = function() {
                var e, n, i = t.x,
                    r = t.i;
                return e = i[r], e ^= e >>> 7, n = e ^ e << 24 ^ ((e = i[r + 1 & 7]) ^ e >>> 10) ^ ((e = i[r + 3 & 7]) ^ e >>> 3) ^ ((e = i[r + 4 & 7]) ^ e << 7), e = i[r + 7 & 7], e ^= e << 13, n ^= e ^ e << 9, i[r] = n, t.i = r + 1 & 7, n
            };
            var n, i = e,
                r = [];
            if (i === (0 | i)) r[0] = i;
            else
                for (n = 0, i = "" + i; n < i.length; ++n) r[7 & n] = r[7 & n] << 15 ^ i.charCodeAt(n) + r[n + 1 & 7] << 13;
            for (; r.length < 8;) r.push(0);
            for (n = 0; n < 8 && 0 === r[n]; ++n);
            for (8 == n ? r[7] = -1 : r[n], t.x = r, t.i = 0, n = 256; n > 0; --n) t.next()
        }

        function o(e, t) {
            return t.x = e.x.slice(), t.i = e.i, t
        }

        function s(e, t) {
            null == e && (e = +new Date);
            var n = new r(e),
                i = t && t.state,
                s = function() {
                    return (n.next() >>> 0) / 0x100000000
                };
            return s.double = function() {
                do var e = ((n.next() >>> 11) + (n.next() >>> 0) / 0x100000000) / 2097152; while (0 === e) return e
            }, s.int32 = n.next, s.quick = s, i && (i.x && o(i, n), s.state = function() {
                return o(n, {})
            }), s
        }
        if (n && n.exports) n.exports = s;
        else if (i && i.amd) e.r, void 0 !== s && e.v(s);
        else this.xorshift7 = s
    }(e.e, t, "function" == typeof define && define)
}, 684912, (e, t, n) => {
    ! function(t, n, i) {
        function r(e) {
            var t = this;
            t.next = function() {
                var e, n, i = t.w,
                    r = t.X,
                    o = t.i;
                return t.w = i = i + 0x61c88647 | 0, n = r[o + 34 & 127], e = r[o = o + 1 & 127], n ^= n << 13, e ^= e << 17, n ^= n >>> 15, e ^= e >>> 12, n = r[o] = n ^ e, t.i = o, n + (i ^ i >>> 16) | 0
            }, ! function(e, t) {
                var n, i, r, o, s, a = [],
                    l = 128;
                for (t === (0 | t) ? (i = t, t = null) : (t += "\0", i = 0, l = Math.max(l, t.length)), r = 0, o = -32; o < l; ++o) t && (i ^= t.charCodeAt((o + 32) % t.length)), 0 === o && (s = i), i ^= i << 10, i ^= i >>> 15, i ^= i << 4, i ^= i >>> 13, o >= 0 && (s = s + 0x61c88647 | 0, r = 0 == (n = a[127 & o] ^= i + s) ? r + 1 : 0);
                for (r >= 128 && (a[127 & (t && t.length || 0)] = -1), r = 127, o = 512; o > 0; --o) i = a[r + 34 & 127], n = a[r = r + 1 & 127], i ^= i << 13, n ^= n << 17, i ^= i >>> 15, n ^= n >>> 12, a[r] = i ^ n;
                e.w = s, e.X = a, e.i = r
            }(t, e)
        }

        function o(e, t) {
            return t.i = e.i, t.w = e.w, t.X = e.X.slice(), t
        }

        function s(e, t) {
            null == e && (e = +new Date);
            var n = new r(e),
                i = t && t.state,
                s = function() {
                    return (n.next() >>> 0) / 0x100000000
                };
            return s.double = function() {
                do var e = ((n.next() >>> 11) + (n.next() >>> 0) / 0x100000000) / 2097152; while (0 === e) return e
            }, s.int32 = n.next, s.quick = s, i && (i.X && o(i, n), s.state = function() {
                return o(n, {})
            }), s
        }
        if (n && n.exports) n.exports = s;
        else if (i && i.amd) e.r, void 0 !== s && e.v(s);
        else this.xor4096 = s
    }(e.e, t, "function" == typeof define && define)
}, 646024, (e, t, n) => {
    ! function(t, n, i) {
        function r(e) {
            var t = this,
                n = "";
            t.next = function() {
                var e = t.b,
                    n = t.c,
                    i = t.d,
                    r = t.a;
                return e = e << 25 ^ e >>> 7 ^ n, n = n - i | 0, i = i << 24 ^ i >>> 8 ^ r, r = r - e | 0, t.b = e = e << 20 ^ e >>> 12 ^ n, t.c = n = n - i | 0, t.d = i << 16 ^ n >>> 16 ^ r, t.a = r - e | 0
            }, t.a = 0, t.b = 0, t.c = -0x61c88647, t.d = 0x517cc1b7, e === Math.floor(e) ? (t.a = e / 0x100000000 | 0, t.b = 0 | e) : n += e;
            for (var i = 0; i < n.length + 20; i++) t.b ^= n.charCodeAt(i), t.next()
        }

        function o(e, t) {
            return t.a = e.a, t.b = e.b, t.c = e.c, t.d = e.d, t
        }

        function s(e, t) {
            var n = new r(e),
                i = t && t.state,
                s = function() {
                    return (n.next() >>> 0) / 0x100000000
                };
            return s.double = function() {
                do var e = ((n.next() >>> 11) + (n.next() >>> 0) / 0x100000000) / 2097152; while (0 === e) return e
            }, s.int32 = n.next, s.quick = s, i && ("object" == typeof i && o(i, n), s.state = function() {
                return o(n, {})
            }), s
        }
        if (n && n.exports) n.exports = s;
        else if (i && i.amd) e.r, void 0 !== s && e.v(s);
        else this.tychei = s
    }(e.e, t, "function" == typeof define && define)
}, 491098, (e, t, n) => {
    ! function(n, i, r) {
        var o, s = "random",
            a = r.pow(256, 6),
            l = r.pow(2, 52),
            u = 2 * l;

        function c(e, t, c) {
            var g = [],
                m = h(function e(t, n) {
                    var i, r = [],
                        o = typeof t;
                    if (n && "object" == o)
                        for (i in t) try {
                            r.push(e(t[i], n - 1))
                        } catch (e) {}
                    return r.length ? r : "string" == o ? t : t + "\0"
                }((t = !0 == t ? {
                    entropy: !0
                } : t || {}).entropy ? [e, v(i)] : null == e ? function() {
                    try {
                        var e;
                        return o && (e = o.randomBytes) ? e = e(256) : (e = new Uint8Array(256), (n.crypto || n.msCrypto).getRandomValues(e)), v(e)
                    } catch (e) {
                        var t = n.navigator,
                            r = t && t.plugins;
                        return [+new Date, n, r, n.screen, v(i)]
                    }
                }() : e, 3), g),
                w = new d(g),
                x = function() {
                    for (var e = w.g(6), t = a, n = 0; e < l;) e = (e + n) * 256, t *= 256, n = w.g(1);
                    for (; e >= u;) e /= 2, t /= 2, n >>>= 1;
                    return (e + n) / t
                };
            return x.int32 = function() {
                return 0 | w.g(4)
            }, x.quick = function() {
                return w.g(4) / 0x100000000
            }, x.double = x, h(v(w.S), i), (t.pass || c || function(e, t, n, i) {
                return (i && (i.S && f(i, w), e.state = function() {
                    return f(w, {})
                }), n) ? (r[s] = e, t) : e
            })(x, m, "global" in t ? t.global : this == r, t.state)
        }

        function d(e) {
            var t, n = e.length,
                i = this,
                r = 0,
                o = i.i = i.j = 0,
                s = i.S = [];
            for (n || (e = [n++]); r < 256;) s[r] = r++;
            for (r = 0; r < 256; r++) s[r] = s[o = 255 & o + e[r % n] + (t = s[r])], s[o] = t;
            (i.g = function(e) {
                for (var t, n = 0, r = i.i, o = i.j, s = i.S; e--;) t = s[r = 255 & r + 1], n = 256 * n + s[255 & (s[r] = s[o = 255 & o + t]) + (s[o] = t)];
                return i.i = r, i.j = o, n
            })(256)
        }

        function f(e, t) {
            return t.i = e.i, t.j = e.j, t.S = e.S.slice(), t
        }

        function h(e, t) {
            for (var n, i = e + "", r = 0; r < i.length;) t[255 & r] = 255 & (n ^= 19 * t[255 & r]) + i.charCodeAt(r++);
            return v(t)
        }

        function v(e) {
            return String.fromCharCode.apply(0, e)
        }
        if (h(r.random(), i), t.exports) {
            t.exports = c;
            try {
                o = {}
            } catch (e) {}
        } else if ("function" == typeof define && define.amd) e.r, void 0 !== c && e.v(c);
        else r["seed" + s] = c
    }("u" > typeof self ? self : e.e, [], Math)
}, 851439, (e, t, n) => {
    var i = e.r(688412),
        r = e.r(589535),
        o = e.r(516501),
        s = e.r(216692),
        a = e.r(684912),
        l = e.r(646024),
        u = e.r(491098);
    u.alea = i, u.xor128 = r, u.xorwow = o, u.xorshift7 = s, u.xor4096 = a, u.tychei = l, t.exports = u
}, 550742, e => {
    "use strict";
    let t, n;
    var i, r, o = e.i(416340);
    let s = "u" > typeof Intl,
        a = !s || void 0 === Intl.Locale,
        l = !s || void 0 === Intl.RelativeTimeFormat,
        u = !s || void 0 === Intl.PluralRules,
        c = !s || void 0 === Intl.DisplayNames,
        d = "function" != typeof window.ResizeObserver,
        f = (i = a || l || u || c || d, r = function() {
            return Promise.all([(a ? e.A(361318).then(function(e) {
                return e.p
            }) : Promise.resolve()).then(() => Promise.all([l ? e.A(950511).then(function(e) {
                return e.p
            }).then(() => e.A(874521)) : null, u ? e.A(684498).then(function(e) {
                return e.p
            }).then(() => e.A(104943)) : null, c ? e.A(951862).then(() => e.A(890267)) : null])), d ? e.A(956827) : null])
        }, t = !1, n = i ? r().catch(() => {}).then(() => {
            t = !0
        }) : null, function() {
            let [e, i] = (0, o.useState)(!n || t);
            return (0, o.useEffect)(() => {
                n && !e && n.then(() => i(!0))
            }, [e]), e
        });
    e.s(["usePolyfills", 0, f], 550742)
}, 969687, e => {
    "use strict";
    var t, n, i, r, o, s, a, l = e.i(2226),
        u = e.i(721281),
        c = e.i(252842),
        d = e.i(79187),
        f = e.i(416340),
        h = e.i(80768),
        v = e.i(533414),
        g = ((r = {}).TIMED_OUT = "TIMED_OUT", r.WEBVIEW_NOT_INITIALIZED = "WEBVIEW_NOT_INITIALIZED", r.WEBVIEW_NOT_FOUND = "WEBVIEW_NOT_FOUND", r.INVALID_MESSAGE = "INVALID_MESSAGE", r);
    class m extends Error {
        constructor(e, t, n) {
            let i = "MessageBusError, code: ".concat(e);
            t && (i += ", eventName: ".concat(t)), n && (i += ", type: ".concat(n)), super(i), (0, u._)(this, "code", void 0), (0, u._)(this, "eventName", void 0), (0, u._)(this, "eventType", void 0), this.code = e, this.eventName = t, this.eventType = n
        }
    }
    var w = ((o = w || {}).DarkFoundation = "darkFoundation", o.LightFoundation = "lightFoundation", o);
    let x = "darkFoundation";
    var p = ((s = {}).Fire = "fire", s.Response = "response", s.Request = "request", s);

    function b() {
        var e, t, n, i, r, o;
        let s = null == (t = window) || null == (e = t.navigator) ? void 0 : e.userAgent;
        return (null == (i = window) || null == (n = i.rbx) ? void 0 : n.studio.isPrewarm) !== !0 && (null == (o = window) || null == (r = o.rbx) ? void 0 : r.postMessage) !== void 0 && void 0 !== s && s.includes("RobloxStudio")
    }
    class y {
        enqueueMessage(e) {
            this.queue.push(e), this.debouncedFlush()
        }
        flush() {
            let e = "".concat(this.url, "?"),
                t = 0;
            for (let n of this.queue) {
                let i = e + "msg".concat(t, "=").concat(encodeURIComponent(n), "&");
                if (i.length > this.maxUrlLength) {
                    if (t > 0) {
                        this.queue = this.queue.slice(t), this.postFrameMessage(e), this.debouncedFlush();
                        return
                    }
                    console.warn("Message too large: (".concat(i.length, "), attempting to send anyway")), this.queue = this.queue.slice(1), this.postFrameMessage(i), this.queue.length > 0 && this.debouncedFlush();
                    return
                }
                e = i, t += 1
            }
            t > 0 && (this.queue = this.queue.slice(t), this.postFrameMessage(e))
        }
        postFrameMessage(e) {
            let t = document.createElement("iframe");
            t.style.display = "none", t.src = e, document.body.appendChild(t), setTimeout(() => {
                document.body.removeChild(t)
            }, this.frameRemoveDelay)
        }
        constructor(e, t = {}) {
            (0, u._)(this, "debouncedFlush", void 0), (0, u._)(this, "frameRemoveDelay", void 0), (0, u._)(this, "maxUrlLength", void 0), (0, u._)(this, "queue", []), (0, u._)(this, "url", void 0);
            let {
                flushInterval: n = 10,
                frameRemoveDelay: i = 10,
                maxUrlLength: r = 64e3
            } = t;
            this.url = e, this.frameRemoveDelay = i, this.maxUrlLength = r, [this.debouncedFlush] = (0, c.debounce)(() => this.flush(), n)
        }
    }
    let E = d.Locale.English;
    class C {
        getStudioConfiguration() {
            var e;
            if (!b() || !(null == (e = window.rbx) ? void 0 : e.messageBus)) throw new m(g.WEBVIEW_NOT_INITIALIZED);
            let t = window.rbx.studio;
            return Object.values(d.Locale).includes(t.locale) || (console.warn("Locale: ".concat(t.locale, " is not valid. Defaulting to ").concat(E, ".")), t.locale = E), Object.values(w).includes(t.theme) || (console.warn("Theme: ".concat(t.theme, " is not valid. Defaulting to ").concat(x, ".")), t.theme = x), t
        }
        getOrCreateEventListenersMap(e) {
            let t = e.events;
            if (t) return t;
            let n = new Map;
            return e.events = n, n
        }
        loadWebView() {
            var e, t, n, i;
            if (!b() || !(null == (e = window.rbx) ? void 0 : e.messageBus)) throw new m(g.WEBVIEW_NOT_INITIALIZED);
            if ((null == (t = window.rbx) ? void 0 : t.postMessageFrameUrl) && (null == (i = window.webkit) || null == (n = i.messageHandlers) ? void 0 : n.roblox)) {
                let e = new y(window.rbx.postMessageFrameUrl);
                window.webkit.messageHandlers.roblox.postMessage = t => {
                    e.enqueueMessage(t)
                }
            }
            let r = this.getOrCreateEventListenersMap(window.rbx.messageBus);
            window.rbx.messageBus = {
                dispatchEvent: (e, t, n) => {
                    let i = r.get(e),
                        o = null == i ? void 0 : i.uuidSpecificListeners,
                        s = null == i ? void 0 : i.generalListeners;
                    if (void 0 !== o) {
                        var a;
                        let e = o.get(null != (a = t.uuid) ? a : "");
                        e && e(n, t)
                    }
                    void 0 !== s && s.forEach(e => e(n, t))
                },
                events: r
            }
        }
        async initHandshake(e) {
            return this.call("internal:init", e, 0)
        }
        getFullEventName(e) {
            return String(e).includes("internal") ? e.toString() : "".concat(this.namespace, ":").concat(String(e))
        }
        postMessage(e, t, n) {
            var i;
            if (!b() || !(null == (i = window.rbx) ? void 0 : i.postMessage)) throw new m(g.WEBVIEW_NOT_FOUND, e, t.type);
            let r = JSON.stringify(t),
                o = JSON.stringify(n);
            if (r.includes("|")) throw new m(g.INVALID_MESSAGE, e, t.type);
            let s = "1|".concat(e, "|").concat(r, "|").concat(o);
            window.rbx.postMessage("messageBusEvent", s)
        }
        setListenerInternal(e, t, n) {
            var i;
            let r = null == (i = window.rbx) ? void 0 : i.messageBus;
            if (!b() || !r) throw new m(g.WEBVIEW_NOT_FOUND, String(e));
            let o = this.getFullEventName(e),
                s = this.getOrCreateEventListenersMap(r),
                a = new Map,
                l = s.get(o);
            l ? l.uuidSpecificListeners ? a = l.uuidSpecificListeners : l.uuidSpecificListeners = a : s.set(o, {
                uuidSpecificListeners: a,
                generalListeners: []
            }), a.set(n, t)
        }
        removeListenerInternal(e, t) {
            var n;
            let i = this.getFullEventName(e),
                r = null == (n = window.rbx) ? void 0 : n.messageBus.events;
            if (!r) return;
            let o = r.get(i),
                s = null == o ? void 0 : o.uuidSpecificListeners;
            void 0 !== s && s.has(t) && s.delete(t)
        }
        setListener(e, t) {
            var n;
            let i = null == (n = window.rbx) ? void 0 : n.messageBus;
            if (!b() || !i) throw new m(g.WEBVIEW_NOT_FOUND, String(e));
            let r = this.getFullEventName(e),
                o = (e, n) => {
                    var i;
                    let o = null != (i = t(e)) ? i : {};
                    n.type === p.Request && this.postMessage(r, {
                        type: p.Response,
                        uuid: n.uuid
                    }, o)
                },
                s = this.getOrCreateEventListenersMap(i),
                a = [],
                l = s.get(r);
            return l ? l.generalListeners ? a = l.generalListeners : l.generalListeners = a : s.set(r, {
                uuidSpecificListeners: new Map,
                generalListeners: a
            }), a.push(o), o
        }
        removeListener(e, t) {
            var n;
            let i = this.getFullEventName(e),
                r = null == (n = window.rbx) ? void 0 : n.messageBus.events;
            if (!r) return;
            let o = r.get(i),
                s = null == o ? void 0 : o.generalListeners;
            if (void 0 === s || 0 === s.length) return;
            let a = s.indexOf(t);
            a > -1 && s.splice(a, 1)
        }
        async call(e, t) {
            let n, i = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 3e3;
            if (!b()) throw new m(g.WEBVIEW_NOT_FOUND, String(e), p.Request);
            let r = n => new Promise(i => {
                    let r = (t, r) => {
                        this.removeListenerInternal(e, n), i(t)
                    };
                    this.setListenerInternal(e, r, n), this.postMessage(this.getFullEventName(e), {
                        type: p.Request,
                        uuid: n
                    }, t)
                }),
                o = c.uuidService.generateRandomUuid();
            return i <= 0 ? r(o) : Promise.race([new Promise((t, r) => {
                n = setTimeout(() => {
                    this.removeListenerInternal(e, o), r(new m(g.TIMED_OUT, String(e), p.Request))
                }, i)
            }), r(o).then(e => (n && clearTimeout(n), e))])
        }
        fire(e, t) {
            if (!b()) throw new m(g.WEBVIEW_NOT_FOUND, String(e), p.Fire);
            let n = c.uuidService.generateRandomUuid();
            this.postMessage(this.getFullEventName(e), {
                type: p.Fire,
                uuid: n
            }, t)
        }
        constructor(e) {
            (0, u._)(this, "namespace", void 0), this.namespace = e.namespace
        }
    }
    var S = ((a = {}).changeTheme = "internal:changeTheme", a.changeVolume = "internal:changeVolume", a.init = "internal:init", a.deprecatedSendAnalyticsCounterEvent = "sendAnalyticsCounterEvent", a.deprecatedSendAnalyticsEvent = "sendAnalyticsEvent", a);

    function M(e, t) {
        let n = e.getElementsByTagName("video"),
            i = e.getElementsByTagName("audio");
        n.length > 0 && Array.from(n).forEach(e => {
            e.volume = t
        }), i.length > 0 && Array.from(i).forEach(e => {
            e.volume = t
        })
    }
    let L = [];

    function T() {
        var e, t;
        null == (t = window.rbx) || null == (e = t.postMessage) || e.call(t, "loadprogress", "afterInteractive")
    }

    function I() {}(null == (t = window.rbx) ? void 0 : t.postMessage) && (null == (i = window.rbx) || null == (n = i.postMessage) || n.call(i, "loadprogress", "beforeInteractive"), "loading" === document.readyState ? document.addEventListener("DOMContentLoaded", T, {
        once: !0
    }) : T());
    let k = () => () => I;
    e.s(["StubMessageBus", 0, class extends C {
        async initHandshake(e) {
            let {
                capabilities: t
            } = e;
            return {
                capabilities: t
            }
        }
        async call() {
            return {}
        }
        getStudioConfiguration() {
            return this.studioConfiguration
        }
        constructor(e) {
            var t, n, i, r, o, s;
            super({
                namespace: e
            }), (0, u._)(this, "studioConfiguration", void 0), (0, u._)(this, "loadWebView", I), (0, u._)(this, "setListener", k), (0, u._)(this, "fire", I), this.studioConfiguration = {
                theme: w.DarkFoundation,
                locale: d.Locale.English,
                isPrewarm: !1
            }, window.rbx = {
                ...window.rbx,
                studio: null != (t = null == (r = window.rbx) ? void 0 : r.studio) ? t : this.studioConfiguration,
                messageBus: null != (n = null == (o = window.rbx) ? void 0 : o.messageBus) ? n : {
                    events: new Map,
                    dispatchEvent: I
                },
                postMessage: null != (i = null == (s = window.rbx) ? void 0 : s.postMessage) ? i : I
            }
        }
    }, "StudioTheme", 0, w, "StudioWebViewMessageBusConnector", 0, function(e) {
        var t, n;
        let {
            children: i,
            useContextHook: r,
            capabilities: o = L
        } = e, {
            isWebView: s,
            getStudioConfiguration: a,
            setStudioThemeOverride: l,
            initHandshake: u,
            removeListener: c,
            setListener: d,
            loadWebView: v,
            studioVersion: g
        } = r(), m = (0, f.useRef)(s && null != (t = a().volume) ? t : 1), w = (0, f.useRef)(s ? (n = () => m.current, new MutationObserver(e => {
            e.forEach(e => {
                "childList" === e.type && e.addedNodes.forEach(e => {
                    e instanceof Element && (("AUDIO" === e.tagName || "VIDEO" === e.tagName) && (e.volume = n()), e.children.length > 0 && M(e, n()))
                })
            })
        })) : null), x = (0, f.useCallback)(e => {
            let {
                theme: t
            } = e;
            l(t)
        }, [l]), p = (0, f.useCallback)(e => {
            let {
                volume: t
            } = e;
            m.current = t, M(document.body, t)
        }, []);
        return (0, f.useEffect)(() => {
            var e;
            h.setTag("isWebView", s), s && (M(document.body, m.current), null == (e = w.current) || e.observe(document.body, {
                childList: !0,
                subtree: !0
            }), window.addEventListener("dragover", e => e.preventDefault(), !0), window.addEventListener("drop", e => e.preventDefault(), !0))
        }, [s]), (0, f.useEffect)(() => {
            s && g && h.setTag("studioVersion", g)
        }, [s, g]), (0, f.useEffect)(() => {
            if (s) {
                var e;
                void 0 === (null == (e = window.rbx) ? void 0 : e.messageBus.dispatchEvent) && v();
                let t = d(S.changeTheme, x),
                    n = d(S.changeVolume, p);
                return () => {
                    c(S.changeTheme, t), c(S.changeVolume, n)
                }
            }
            return () => {}
        }, [x, p, s, v, c, d]), (0, f.useEffect)(() => {
            (async () => {
                s && await u({
                    capabilities: o
                })
            })()
        }, [s, u, o]), f.default.createElement(f.default.Fragment, null, i)
    }, "getWebViewLoadingStyles", 0, function() {
        let {
            lightColor: e,
            darkColor: t
        } = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
        return {
            ".studio-webview &": {
                height: "100vh",
                position: "fixed",
                width: "100vw"
            },
            ".dark-theme.studio-webview &": {
                backgroundColor: "#191A1F",
                color: t
            },
            ".light-theme.studio-webview &": {
                backgroundColor: "#FFFFFF",
                color: e
            }
        }
    }, "isWebViewAvailable", 0, b, "makeStudioWebViewMessageBusContextProvider", 0, e => {
        let {
            namespace: t,
            useSearchParams: n,
            MockMessageBus: i,
            defaultToMockWebView: r = !1
        } = e, o = (0, f.createContext)(null), s = new C({
            namespace: t
        }), a = (e => {
            let {
                context: t,
                bus: n,
                useSearchParams: i,
                MockMessageBus: r,
                defaultToMockWebView: o
            } = e;
            return function(e) {
                let {
                    children: s
                } = e, a = (0, f.useMemo)(() => b(), []), u = i(), [c, d] = (0, v.useSessionStorage)("mock_web_view", null), h = (0, f.useRef)(null), g = !a && (!0 === c || o), m = a || g, p = (0, f.useMemo)(() => g ? (null != h.current || (h.current = new r), h.current) : n, [g]), y = (0, f.useCallback)((e, t, n) => p.call(e, t, n), [p]), E = (0, f.useCallback)((e, t) => {
                    p.fire(e, t)
                }, [p]), C = (0, f.useCallback)(() => p.getStudioConfiguration(), [p]), [S, M] = (0, f.useState)(null), L = (0, f.useCallback)(async e => {
                    let t = await p.initHandshake(e);
                    return M(t), t
                }, [p]), T = (0, f.useCallback)(() => {
                    p.loadWebView()
                }, [p]), I = (0, f.useMemo)(() => {
                    var e;
                    return !!(null == (e = window.rbx) ? void 0 : e.studio.isPrewarm)
                }, []), k = (0, f.useMemo)(() => {
                    var e, t;
                    let n;
                    return void 0 === (n = null == (t = window) || null == (e = t.navigator) ? void 0 : e.deviceMemory) || n >= 8
                }, []), _ = (0, f.useMemo)(() => (function() {
                    var e, t;
                    let n = null == (t = window) || null == (e = t.navigator) ? void 0 : e.userAgent;
                    if (!n) return "";
                    let i = n.match(/RobloxApp\/([\d.]+)/);
                    return i && i.length > 1 ? i[1] : ""
                })(), []), W = (0, f.useCallback)((e, t) => p.setListener(e, t), [p]), F = (0, f.useCallback)((e, t) => {
                    p.removeListener(e, t)
                }, [p]), [N, A] = (0, v.useSessionStorage)("web_view_theme_override", null);
                (0, f.useEffect)(() => {
                    let e = u.get("mockWebview"),
                        t = "true" === l.default.env.NEXT_PUBLIC_MOCK_WEB_VIEW || "true" === e;
                    if (a || (t ? d(!0) : "false" === e && d(!1)), g) {
                        let e = u.get("theme");
                        e && A(e.includes("light") ? w.LightFoundation : w.DarkFoundation)
                    }
                }, [a, u, d, A, g]);
                let D = (0, f.useMemo)(() => {
                        let e = m && 1 ? C().theme : x;
                        return null != N ? N : e
                    }, [C, m, N]),
                    O = (0, f.useMemo)(() => ({
                        call: y,
                        currentStudioTheme: D,
                        fire: E,
                        getStudioConfiguration: C,
                        initHandshake: L,
                        initHandshakeResponse: S,
                        isPrewarm: I,
                        isRecommendedSpecOrAbove: k,
                        isWebView: m,
                        isWebViewAvailable: m,
                        loadWebView: T,
                        removeListener: F,
                        setListener: W,
                        setStudioThemeOverride: A,
                        studioVersion: _
                    }), [y, E, C, L, S, I, k, m, T, F, W, A, D, _]);
                return f.default.createElement(t.Provider, {
                    value: O
                }, s)
            }
        })({
            bus: s,
            context: o,
            defaultToMockWebView: r,
            MockMessageBus: i,
            useSearchParams: n
        });
        return {
            bus: s,
            context: o,
            provider: a,
            useContextHook: () => {
                let e = (0, f.useContext)(o);
                if (!e) throw Error("StudioWebViewMessageBusProviderContext not found");
                return e
            }
        }
    }])
}]);

//# debugId=a6e67dd0-f380-82fa-2d11-e55009a96a70
//# sourceMappingURL=1jpl6lt228tr8.js.map