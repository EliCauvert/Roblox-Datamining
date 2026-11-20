;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "f6f9403e-edbc-b497-1acd-754bbba13158")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 51173, (e, t, n) => {
    var r = e.r(583421),
        o = e.r(555318),
        i = e.r(687405),
        a = e.r(147698),
        u = e.r(685795),
        l = e.r(118694),
        s = e.r(604323);
    s.alea = r, s.xor128 = o, s.xorwow = i, s.xorshift7 = a, s.xor4096 = u, s.tychei = l, t.exports = s
}, 583421, (e, t, n) => {
    ! function(e, t, n) {
        function r(e) {
            var t, n = this,
                r = (t = 0xefc8249d, function(e) {
                    e = String(e);
                    for (var n = 0; n < e.length; n++) {
                        var r = .02519603282416938 * (t += e.charCodeAt(n));
                        t = r >>> 0, r -= t, r *= t, t = r >>> 0, r -= t, t += 0x100000000 * r
                    }
                    return (t >>> 0) * 23283064365386963e-26
                });
            n.next = function() {
                var e = 2091639 * n.s0 + 23283064365386963e-26 * n.c;
                return n.s0 = n.s1, n.s1 = n.s2, n.s2 = e - (n.c = 0 | e)
            }, n.c = 1, n.s0 = r(" "), n.s1 = r(" "), n.s2 = r(" "), n.s0 -= r(e), n.s0 < 0 && (n.s0 += 1), n.s1 -= r(e), n.s1 < 0 && (n.s1 += 1), n.s2 -= r(e), n.s2 < 0 && (n.s2 += 1)
        }

        function o(e, t) {
            return t.c = e.c, t.s0 = e.s0, t.s1 = e.s1, t.s2 = e.s2, t
        }

        function i(e, t) {
            var n = new r(e),
                i = t && t.state,
                a = n.next;
            return a.int32 = function() {
                return 0x100000000 * n.next() | 0
            }, a.double = function() {
                return a() + (2097152 * a() | 0) * 11102230246251565e-32
            }, a.quick = a, i && ("object" == typeof i && o(i, n), a.state = function() {
                return o(n, {})
            }), a
        }
        t && t.exports ? t.exports = i : n && n.amd ? n(function() {
            return i
        }) : this.alea = i
    }(e.e, t, "function" == typeof define && define)
}, 118694, (e, t, n) => {
    ! function(e, t, n) {
        function r(e) {
            var t = this,
                n = "";
            t.next = function() {
                var e = t.b,
                    n = t.c,
                    r = t.d,
                    o = t.a;
                return e = e << 25 ^ e >>> 7 ^ n, n = n - r | 0, r = r << 24 ^ r >>> 8 ^ o, o = o - e | 0, t.b = e = e << 20 ^ e >>> 12 ^ n, t.c = n = n - r | 0, t.d = r << 16 ^ n >>> 16 ^ o, t.a = o - e | 0
            }, t.a = 0, t.b = 0, t.c = -0x61c88647, t.d = 0x517cc1b7, e === Math.floor(e) ? (t.a = e / 0x100000000 | 0, t.b = 0 | e) : n += e;
            for (var r = 0; r < n.length + 20; r++) t.b ^= n.charCodeAt(r), t.next()
        }

        function o(e, t) {
            return t.a = e.a, t.b = e.b, t.c = e.c, t.d = e.d, t
        }

        function i(e, t) {
            var n = new r(e),
                i = t && t.state,
                a = function() {
                    return (n.next() >>> 0) / 0x100000000
                };
            return a.double = function() {
                do var e = ((n.next() >>> 11) + (n.next() >>> 0) / 0x100000000) / 2097152; while (0 === e) return e
            }, a.int32 = n.next, a.quick = a, i && ("object" == typeof i && o(i, n), a.state = function() {
                return o(n, {})
            }), a
        }
        t && t.exports ? t.exports = i : n && n.amd ? n(function() {
            return i
        }) : this.tychei = i
    }(e.e, t, "function" == typeof define && define)
}, 555318, (e, t, n) => {
    ! function(e, t, n) {
        function r(e) {
            var t = this,
                n = "";
            t.x = 0, t.y = 0, t.z = 0, t.w = 0, t.next = function() {
                var e = t.x ^ t.x << 11;
                return t.x = t.y, t.y = t.z, t.z = t.w, t.w ^= t.w >>> 19 ^ e ^ e >>> 8
            }, e === (0 | e) ? t.x = e : n += e;
            for (var r = 0; r < n.length + 64; r++) t.x ^= n.charCodeAt(r), t.next()
        }

        function o(e, t) {
            return t.x = e.x, t.y = e.y, t.z = e.z, t.w = e.w, t
        }

        function i(e, t) {
            var n = new r(e),
                i = t && t.state,
                a = function() {
                    return (n.next() >>> 0) / 0x100000000
                };
            return a.double = function() {
                do var e = ((n.next() >>> 11) + (n.next() >>> 0) / 0x100000000) / 2097152; while (0 === e) return e
            }, a.int32 = n.next, a.quick = a, i && ("object" == typeof i && o(i, n), a.state = function() {
                return o(n, {})
            }), a
        }
        t && t.exports ? t.exports = i : n && n.amd ? n(function() {
            return i
        }) : this.xor128 = i
    }(e.e, t, "function" == typeof define && define)
}, 685795, (e, t, n) => {
    ! function(e, t, n) {
        function r(e) {
            var t = this;
            t.next = function() {
                var e, n, r = t.w,
                    o = t.X,
                    i = t.i;
                return t.w = r = r + 0x61c88647 | 0, n = o[i + 34 & 127], e = o[i = i + 1 & 127], n ^= n << 13, e ^= e << 17, n ^= n >>> 15, e ^= e >>> 12, n = o[i] = n ^ e, t.i = i, n + (r ^ r >>> 16) | 0
            }, ! function(e, t) {
                var n, r, o, i, a, u = [],
                    l = 128;
                for (t === (0 | t) ? (r = t, t = null) : (t += "\0", r = 0, l = Math.max(l, t.length)), o = 0, i = -32; i < l; ++i) t && (r ^= t.charCodeAt((i + 32) % t.length)), 0 === i && (a = r), r ^= r << 10, r ^= r >>> 15, r ^= r << 4, r ^= r >>> 13, i >= 0 && (a = a + 0x61c88647 | 0, o = 0 == (n = u[127 & i] ^= r + a) ? o + 1 : 0);
                for (o >= 128 && (u[127 & (t && t.length || 0)] = -1), o = 127, i = 512; i > 0; --i) r = u[o + 34 & 127], n = u[o = o + 1 & 127], r ^= r << 13, n ^= n << 17, r ^= r >>> 15, n ^= n >>> 12, u[o] = r ^ n;
                e.w = a, e.X = u, e.i = o
            }(t, e)
        }

        function o(e, t) {
            return t.i = e.i, t.w = e.w, t.X = e.X.slice(), t
        }

        function i(e, t) {
            null == e && (e = +new Date);
            var n = new r(e),
                i = t && t.state,
                a = function() {
                    return (n.next() >>> 0) / 0x100000000
                };
            return a.double = function() {
                do var e = ((n.next() >>> 11) + (n.next() >>> 0) / 0x100000000) / 2097152; while (0 === e) return e
            }, a.int32 = n.next, a.quick = a, i && (i.X && o(i, n), a.state = function() {
                return o(n, {})
            }), a
        }
        t && t.exports ? t.exports = i : n && n.amd ? n(function() {
            return i
        }) : this.xor4096 = i
    }(e.e, t, "function" == typeof define && define)
}, 147698, (e, t, n) => {
    ! function(e, t, n) {
        function r(e) {
            var t = this;
            t.next = function() {
                var e, n, r = t.x,
                    o = t.i;
                return e = r[o], e ^= e >>> 7, n = e ^ e << 24 ^ ((e = r[o + 1 & 7]) ^ e >>> 10) ^ ((e = r[o + 3 & 7]) ^ e >>> 3) ^ ((e = r[o + 4 & 7]) ^ e << 7), e = r[o + 7 & 7], e ^= e << 13, n ^= e ^ e << 9, r[o] = n, t.i = o + 1 & 7, n
            };
            var n, r = e,
                o = [];
            if (r === (0 | r)) o[0] = r;
            else
                for (n = 0, r = "" + r; n < r.length; ++n) o[7 & n] = o[7 & n] << 15 ^ r.charCodeAt(n) + o[n + 1 & 7] << 13;
            for (; o.length < 8;) o.push(0);
            for (n = 0; n < 8 && 0 === o[n]; ++n);
            for (8 == n ? o[7] = -1 : o[n], t.x = o, t.i = 0, n = 256; n > 0; --n) t.next()
        }

        function o(e, t) {
            return t.x = e.x.slice(), t.i = e.i, t
        }

        function i(e, t) {
            null == e && (e = +new Date);
            var n = new r(e),
                i = t && t.state,
                a = function() {
                    return (n.next() >>> 0) / 0x100000000
                };
            return a.double = function() {
                do var e = ((n.next() >>> 11) + (n.next() >>> 0) / 0x100000000) / 2097152; while (0 === e) return e
            }, a.int32 = n.next, a.quick = a, i && (i.x && o(i, n), a.state = function() {
                return o(n, {})
            }), a
        }
        t && t.exports ? t.exports = i : n && n.amd ? n(function() {
            return i
        }) : this.xorshift7 = i
    }(e.e, t, "function" == typeof define && define)
}, 687405, (e, t, n) => {
    ! function(e, t, n) {
        function r(e) {
            var t = this,
                n = "";
            t.next = function() {
                var e = t.x ^ t.x >>> 2;
                return t.x = t.y, t.y = t.z, t.z = t.w, t.w = t.v, (t.d = t.d + 362437 | 0) + (t.v = t.v ^ t.v << 4 ^ (e ^ e << 1)) | 0
            }, t.x = 0, t.y = 0, t.z = 0, t.w = 0, t.v = 0, e === (0 | e) ? t.x = e : n += e;
            for (var r = 0; r < n.length + 64; r++) t.x ^= n.charCodeAt(r), r == n.length && (t.d = t.x << 10 ^ t.x >>> 4), t.next()
        }

        function o(e, t) {
            return t.x = e.x, t.y = e.y, t.z = e.z, t.w = e.w, t.v = e.v, t.d = e.d, t
        }

        function i(e, t) {
            var n = new r(e),
                i = t && t.state,
                a = function() {
                    return (n.next() >>> 0) / 0x100000000
                };
            return a.double = function() {
                do var e = ((n.next() >>> 11) + (n.next() >>> 0) / 0x100000000) / 2097152; while (0 === e) return e
            }, a.int32 = n.next, a.quick = a, i && ("object" == typeof i && o(i, n), a.state = function() {
                return o(n, {})
            }), a
        }
        t && t.exports ? t.exports = i : n && n.amd ? n(function() {
            return i
        }) : this.xorwow = i
    }(e.e, t, "function" == typeof define && define)
}, 604323, (e, t, n) => {
    ! function(n, r, o) {
        var i, a = "random",
            u = o.pow(256, 6),
            l = o.pow(2, 52),
            s = 2 * l;

        function c(e, t, c) {
            var v = [],
                m = g(function e(t, n) {
                    var r, o = [],
                        i = typeof t;
                    if (n && "object" == i)
                        for (r in t) try {
                            o.push(e(t[r], n - 1))
                        } catch (e) {}
                    return o.length ? o : "string" == i ? t : t + "\0"
                }((t = !0 == t ? {
                    entropy: !0
                } : t || {}).entropy ? [e, p(r)] : null == e ? function() {
                    try {
                        var e;
                        return i && (e = i.randomBytes) ? e = e(256) : (e = new Uint8Array(256), (n.crypto || n.msCrypto).getRandomValues(e)), p(e)
                    } catch (e) {
                        var t = n.navigator,
                            o = t && t.plugins;
                        return [+new Date, n, o, n.screen, p(r)]
                    }
                }() : e, 3), v),
                h = new f(v),
                x = function() {
                    for (var e = h.g(6), t = u, n = 0; e < l;) e = (e + n) * 256, t *= 256, n = h.g(1);
                    for (; e >= s;) e /= 2, t /= 2, n >>>= 1;
                    return (e + n) / t
                };
            return x.int32 = function() {
                return 0 | h.g(4)
            }, x.quick = function() {
                return h.g(4) / 0x100000000
            }, x.double = x, g(p(h.S), r), (t.pass || c || function(e, t, n, r) {
                return (r && (r.S && d(r, h), e.state = function() {
                    return d(h, {})
                }), n) ? (o[a] = e, t) : e
            })(x, m, "global" in t ? t.global : this == o, t.state)
        }

        function f(e) {
            var t, n = e.length,
                r = this,
                o = 0,
                i = r.i = r.j = 0,
                a = r.S = [];
            for (n || (e = [n++]); o < 256;) a[o] = o++;
            for (o = 0; o < 256; o++) a[o] = a[i = 255 & i + e[o % n] + (t = a[o])], a[i] = t;
            (r.g = function(e) {
                for (var t, n = 0, o = r.i, i = r.j, a = r.S; e--;) t = a[o = 255 & o + 1], n = 256 * n + a[255 & (a[o] = a[i = 255 & i + t]) + (a[i] = t)];
                return r.i = o, r.j = i, n
            })(256)
        }

        function d(e, t) {
            return t.i = e.i, t.j = e.j, t.S = e.S.slice(), t
        }

        function g(e, t) {
            for (var n, r = e + "", o = 0; o < r.length;) t[255 & o] = 255 & (n ^= 19 * t[255 & o]) + r.charCodeAt(o++);
            return p(t)
        }

        function p(e) {
            return String.fromCharCode.apply(0, e)
        }
        if (g(o.random(), r), t.exports) {
            t.exports = c;
            try {
                i = {}
            } catch (e) {}
        } else if ("function" == typeof define && define.amd) e.r, void 0 !== c && e.v(c);
        else o["seed" + a] = c
    }("u" > typeof self ? self : e.e, [], Math)
}, 776344, e => {
    "use strict";
    var t = e.i(785517),
        n = e.i(643766),
        r = e.i(67243),
        o = e.i(982690);
    let i = (0, r.f)()((e, t) => {
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
        a = (0, n.forwardRef)((e, n) => {
            let {
                id: r,
                className: a,
                classes: u,
                flexDirection: l,
                flexWrap: s,
                justifyContent: c,
                alignItems: f,
                gap: d = 0,
                children: g
            } = e, {
                classes: {
                    flex: p,
                    ...v
                },
                cx: m
            } = i({
                gap: d
            });
            return (0, t.jsx)("div", {
                ref: n,
                id: r,
                className: m(p, v.gap, a, null == u ? void 0 : u.root, v["flexDirection".concat((0, o.v)(null != l ? l : ""))], v["flexWrap".concat((0, o.v)(null != s ? s : ""))], v["alignItems".concat((0, o.v)(null != f ? f : ""))], v["justifyContent".concat((0, o.v)(null != c ? c : ""))]),
                children: g
            })
        });
    a.displayName = "Flex", e.s(["f", 0, a, "U", 0, a])
}, 462863, e => {
    "use strict";
    var t = e.i(785517),
        n = e.i(921394);
    e.s(["f", 0, e => {
        let {
            lightSrc: r,
            darkSrc: o,
            alt: i,
            ...a
        } = e, {
            themeMode: u
        } = (0, n.g)();
        return (0, t.jsx)("img", {
            src: "dark" === u && null != o ? o : r,
            alt: i,
            ...a
        })
    }])
}, 733801, e => {
    "use strict";
    var t = e.i(785517),
        n = e.i(643766),
        r = e.i(341260),
        o = e.i(252842),
        i = e.i(695841),
        a = e.i(659509),
        u = e.i(79187),
        l = e.i(870999),
        s = e.i(47277),
        c = e.i(433285),
        f = e.i(889311),
        d = e.i(776344),
        g = e.i(462863),
        p = e.i(823062),
        v = e.i(881670),
        m = e.i(729055),
        h = e.i(812073),
        x = e.i(732084),
        y = e.i(191685),
        w = e.i(726474),
        b = e.i(478137),
        U = e.i(514626),
        C = e.i(221773);
    e.s(["app", 0, U, "blog", 0, h, "creatorHub", 0, w, "events", 0, x, "getUrlForItemType", () => m.f, "studio", 0, b, "terms", 0, C, "www", 0, y], 32384);
    var A = e.i(32384),
        S = e.i(584147);
    let T = (0, e.i(67243).f)()(() => ({
            background: {
                marginTop: 68,
                marginBottom: 68
            },
            description: {
                marginTop: 6
            },
            button: {
                marginTop: 24
            }
        })),
        {
            creatorHub: {
                creatorStore: D
            }
        } = A,
        R = (0, u.K)(() => {
            let {
                translate: e,
                translateHTML: v
            } = (0, u.A)(), {
                unifiedLogger: m
            } = (0, p.X)(), {
                classes: {
                    description: h,
                    background: x,
                    button: y
                }
            } = T(), {
                asPath: w
            } = (0, r.useRouter)(), {
                headingKey: b,
                descriptionKey: U
            } = S.f[o.R.NOT_FOUND], [C, A] = (0, n.useMemo)(() => w.startsWith("/store") ? ["Label.CreatorStore", D.getUrl()] : w.startsWith("/talent") ? ["Label.TalentHub", "".concat("https://create.roblox.com", "/talent")] : w.startsWith("/docs") ? ["Label.Documentation", "".concat("https://create.roblox.com", "/docs")] : ["Label.CreatorHub", "/"], [w]);
            (0, n.useEffect)(() => {
                m.logImpressionEvent({
                    eventName: f.f.PageNotFound,
                    parameters: {
                        pathname: w,
                        productName: C,
                        productLink: A
                    }
                })
            }, [m, w, C, A]);
            let R = (0, n.useCallback)(() => {
                m.logClickEvent({
                    eventName: f.f.PageNotFoundReturnButtonClick,
                    parameters: {
                        pathname: w,
                        productName: C,
                        productLink: A
                    }
                })
            }, [m, w, C, A]);
            return (0, t.jsxs)(l.f, {
                container: !0,
                classes: {
                    root: x
                },
                direction: "column",
                alignItems: "center",
                children: [(0, t.jsx)(l.f, {
                    container: !0,
                    item: !0,
                    justifyContent: "center",
                    children: (0, t.jsx)(g.f, {
                        lightSrc: a.default,
                        darkSrc: i.default,
                        alt: "Error Illustration"
                    })
                }), (0, t.jsxs)(d.f, {
                    flexDirection: "column",
                    alignItems: "center",
                    children: [(0, t.jsx)(s.f, {
                        variant: "h4",
                        align: "center",
                        children: v(U)
                    }), (0, t.jsx)(s.f, {
                        classes: {
                            root: h
                        },
                        color: "secondary",
                        align: "center",
                        children: v(b)
                    }), (0, t.jsx)(c.f, {
                        classes: {
                            root: y
                        },
                        color: "primary",
                        href: A,
                        variant: "contained",
                        onClick: R,
                        children: e("Action.ReturnToProduct1", {
                            productLink: e(C)
                        })
                    })]
                })]
            })
        }, [v.f.Error]);
    e.s(["f", 0, R], 733801)
}, 584147, e => {
    "use strict";
    e.s(["f", 0, {
        400: {
            headingKey: "Heading.BadRequest",
            descriptionKey: "Description.BadRequest"
        },
        404: {
            headingKey: "Heading.PageNotFound",
            descriptionKey: "Description.PageNotFound"
        },
        403: {
            headingKey: "Heading.AccessDenied",
            descriptionKey: "Description.AccessDenied"
        }
    }])
}, 514626, e => {
    "use strict";
    var t = e.i(191685);
    e.s(["getEventUrl", 0, e => "https://ro.blox.com/Ebh5?pid=share&is_retargeting=true&af_dp=roblox%3A%2F%2Fnavigation%2Fevent_details%3Feventid%3D".concat(e, "&&af_web_dp=https%3A%2F%2Fwww.roblox.com%2Fevents%2F").concat(e), "getGameDetailsUrl", 0, (e, n) => {
        let r = new URLSearchParams({
            af_dp: "roblox://navigation/game_details?gameId=".concat(e),
            af_web_dp: t.getGameDetailsUrl(n)
        });
        return "".concat("https://ro.blox.com/Ebh5", "?").concat(r)
    }])
}, 812073, e => {
    "use strict";
    let t = "https://blog.".concat("roblox.com");
    e.s(["getUrl", 0, () => t])
}, 732084, e => {
    "use strict";
    let t = "https://events.".concat("roblox.com");
    e.s(["getUrl", 0, () => t])
}, 729055, e => {
    "use strict";
    var t = e.i(251622),
        n = e.i(514626),
        r = e.i(726474),
        o = e.i(191685);
    e.i(812073), e.i(732084), e.i(478137), e.i(221773), e.s(["f", 0, (e, i) => {
        switch (e) {
            case t.U.Game:
                return o.getGameDetailsUrl(i);
            case t.U.LibraryAsset:
                return r.creatorStore.getAssetUrl(i);
            case t.U.CatalogAsset:
                return o.getCatalogUrl(i);
            case t.U.Badge:
                return o.getBadgeUrl(i);
            case t.U.GamePass:
                return o.getGamePassUrl(i);
            case t.U.Event:
                return n.getEventUrl(i);
            case t.U.Bundle:
                return o.getBundleUrl(i);
            case t.U.Look:
                return o.getLookUrl(i);
            default:
                return null
        }
    }])
}, 478137, e => {
    "use strict";
    var t = e.i(252842);
    let n = "https://setup.rbxcdn.com",
        {
            windowsDownloadURL: r,
            macOSDownloadURL: o
        } = {
            windowsDownloadURL: "".concat(n, "/RobloxStudioInstaller.exe"),
            macOSDownloadURL: "".concat(n, "/mac/RobloxStudio.dmg")
        };
    e.s(["getDownloadUrl", 0, () => {
        let e = (0, t.W)();
        if (null === e) return null;
        switch (e) {
            case t.o.Windows:
                return r;
            case t.o.macOS:
                return o;
            case t.o.Linux:
            case t.o.Unix:
            case t.o.iOS:
            case t.o.Android:
            case t.o.Unknown:
            default:
                return null
        }
    }], 478137)
}, 221773, e => {
    "use strict";
    var t = e.i(260022);
    e.s(["getAccountVerificationUrl", 0, () => (0, t.h)("accountVerificationUrl", "production", "global"), "getAssetDistributionUrl", 0, () => (0, t.h)("robloxCommunityStandardsUrl", "production", "global"), "getAudioDistributionOnboardingLegalAgreementUrl", 0, () => (0, t.h)("audioUploadLicenseAgreementUrl", "production", "global"), "getAudioThumbnailModerationUrl", 0, () => (0, t.h)("audioThumbnailModerationUrl", "production", "global"), "getDataCollectionUrl", 0, () => (0, t.h)("dataCollectionOptInUrl", "production", "global"), "getGameDetailsPageDocsUrl", 0, () => (0, t.h)("gameDetailsPageDocsUrl", "production", "global"), "getSellerOnboardingLegalAgreementUrl", 0, () => (0, t.h)("creatorStoreTermsOfUseUrl", "production", "global"), "getSongEligibilityDocsUrl", 0, () => (0, t.h)("songEligibilityDocsUrl", "production", "global")])
}, 191685, 875075, e => {
    "use strict";
    var t = e.i(260022);
    let n = async e => Array.from(new Uint8Array(await crypto.subtle.digest("SHA-256", new TextEncoder().encode(e))), e => e.toString(16).padStart(2, "0")).join(""), r = {
        create: async e => {
            let {
                userId: t
            } = e;
            return (await n("wasm-hash-v1:".concat(t))).slice(0, 16)
        },
        verify: async (e, t) => e === await r.create(t)
    }, o = new Map([
        ["3f", r]
    ]), i = "wasmJoinId", a = async e => {
        let t = o.get("3f");
        if (!t) throw Error("No scheme registered for CURRENT_SCHEME_ID 3f");
        return "3f".concat(await t.create(e))
    };
    e.s(["A", 0, i, "$", 0, a], 875075);
    var u = e.i(17829);
    let l = "https://www.".concat("roblox.com"),
        s = "https://advertise.".concat("roblox.com"),
        c = e => "".concat(l, "/groups/").concat(e),
        f = e => "".concat(l, "/users/").concat(e, "/profile");
    e.s(["AdsManagerUrl", 0, s, "BUY_ROBUX_CTX_CREATOR_HUB", 0, "creatorhub", "getAccountSecurityMethodUrl", 0, e => "".concat(l, "/my/account#!/security?display=").concat(e), "getAccountSecurityUrl", 0, () => "".concat(l, "/my/account#!/security"), "getAccountSettingsUrl", 0, () => "".concat(l, "/my/account#!/info"), "getAdsCampaignDetailsUrl", 0, (e, t) => {
        let n = new URLSearchParams({
            campaignId: e
        });
        return void 0 !== t && t > 0 && n.set("universeId", String(t)), "".concat(s, "/manage?").concat(n.toString())
    }, "getAppealsPortalUrl", 0, () => "".concat(l, "/report-appeals#"), "getBadgeUrl", 0, e => "".concat(l, "/badges/").concat(e), "getBundleUrl", 0, e => "".concat(l, "/bundles/").concat(e), "getBuyRobuxUrl", 0, e => "".concat(l, "/upgrades/robux?ctx=").concat(encodeURIComponent(e)), "getCatalogUrl", 0, e => "".concat(l, "/catalog/").concat(e), "getCommunitiesUrl", 0, e => "".concat(l, "/communities/").concat(e), "getConfigureGroupRevenueSalesUrl", 0, e => "".concat(l, "/groups/configure?id=").concat(e, "#!/revenue/sales"), "getConfigureGroupRolesUrl", 0, e => "".concat(l, "/groups/configure?id=").concat(e, "#!/roles"), "getCreatorUrl", 0, (e, t) => e === u.f.Group ? c(t) : f(t), "getDeveloperProductUrl", 0, (e, t) => "".concat(l, "/developer-product/").concat(e, "/product/").concat(t), "getEventUrl", 0, e => "".concat(l, "/events/").concat(e), "getGameDetailsUrl", 0, e => "".concat(l, "/games/").concat(e), "getGamePassUrl", 0, e => "".concat(l, "/game-pass/").concat(e), "getGroupUrl", 0, c, "getHomeUrl", 0, () => "".concat(l, "/home"), "getLegacyGroupTransactionsUrl", 0, e => "".concat(l, "/groups/configure?id=").concat(e, "#!/revenue/sales"), "getLegacyTransactionsUrl", 0, () => "".concat(l, "/transactions"), "getLookUrl", 0, e => "".concat(l, "/looks/").concat(e), "getPaymentMethodsUrl", 0, e => "".concat(l, "/upgrades/paymentmethods?ap=").concat(encodeURIComponent(e)), "getPlayOnWebUrl", 0, (e, n) => "".concat((0, t.h)("playRobloxUrl", "production", "global"), "/games/start?placeId=").concat(e, "&").concat(i, "=").concat(n), "getSponsorAvatarItemsUrl", 0, () => "".concat(l, "/sponsorships/list#!/avatar-items"), "getSponsorExperienceCreateUrl", 0, e => "".concat(s, "/create?universeId=").concat(e), "getSponsorExperienceUrl", 0, e => "".concat(s, "?universeId=").concat(e), "getSupportFormUrl", 0, () => "".concat(l, "/support"), "getTermsUrl", 0, () => "".concat(l, "/info/terms"), "getTransactionsUrl", 0, () => "".concat(l, "/transactions"), "getUrl", 0, () => l, "getUserUrl", 0, f], 191685)
}, 982690, e => {
    "use strict";
    var t = e.i(51173);
    e.i(252842);
    var n = void 0;
    e.s(["_", 0, (e, t) => t < 16 ? "".concat(e, "0").concat(t.toString(16)) : "".concat(e).concat(t.toString(16)), "U", 0, (e, t) => {
        let n = [];
        for (let r = 0; r < e.length; r += t) {
            let o = e.slice(r, r + t);
            n.push(o)
        }
        return n
    }, "F", 0, (e, t) => 0 === t.length ? t : t.charAt(0).toLocaleUpperCase(e || "en-US") + t.slice(1).toLocaleLowerCase(e || "en-US"), "s", 0, e => 60 * e * 144e4, "A", 0, function(e) {
        let t, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 300;
        return [function() {
            for (var o = arguments.length, i = Array(o), a = 0; a < o; a++) i[a] = arguments[a];
            clearTimeout(t), t = setTimeout(() => {
                e.apply(n, i)
            }, r)
        }, () => {
            clearTimeout(t)
        }]
    }, "B", 0, e => Object.entries(e), "$", 0, e => "string" == typeof e && e.trim().length > 0, "Z", 0, (e, n) => {
        let r = (0, t.default)(n),
            o = [...e],
            i = e.length;
        for (; i;) {
            let e = Math.floor(r() * i),
                t = o[i -= 1];
            o[i] = o[e], o[e] = t
        }
        return o
    }, "v", 0, e => e.split("-").reduce((e, t) => {
        var n;
        return e + (null != (n = t[0]) ? n : "").toUpperCase() + t.slice(1)
    }, ""), "N", 0, function(e, t) {
        let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "leading_and_trailing",
            r = null,
            o = null,
            i = null,
            a = () => !!o && (e.call(i, ...o), o = null, i = null, !0),
            u = () => {
                r = null, ("trailing" === n || "leading_and_trailing" === n) && a() && (r = setTimeout(u, t))
            };
        return [function() {
            for (var e = arguments.length, l = Array(e), s = 0; s < e; s++) l[s] = arguments[s];
            o = l, i = this, r || (("leading" === n || "leading_and_trailing" === n) && a(), r = setTimeout(u, t))
        }, () => {
            r && (clearTimeout(r), r = null)
        }]
    }])
}, 745873, 67262, e => {
    "use strict";
    var t = e.i(785517),
        n = e.i(643766),
        r = e.i(458451),
        o = e.i(533414),
        i = e.i(910272),
        a = e.i(947024),
        u = e.i(602635),
        l = e.i(814975);
    let s = (0, e.i(272593).f)("creator-home-api", "bedev2"),
        c = new a._(s),
        f = new a.k(s),
        d = {
            groupsApi: f,
            userScreenApi: c,
            creatorHomeContentApi: new a.D(s),
            signalsApi: new a.f(s)
        };
    e.s(["f", 0, d], 67262);
    let g = function() {
        let {
            user: e
        } = (0, l.f)();
        return (0, i.f)({
            queryKey: u.E,
            enabled: !!e,
            queryFn: () => {
                let e;
                return e = {
                    surface: a.j.CreatorHub
                }, d.groupsApi.groupsListGroups(e)
            }
        })
    };
    var p = e.i(809576);
    let v = (0, n.createContext)(null);
    e.s(["e", 0, e => {
        let {
            children: i
        } = e, {
            user: a
        } = (0, r.s)(), u = (0, p.h)(), {
            data: l,
            isLoading: s,
            refetch: c
        } = g(), [f, d] = (0, o.j)("creatorHubGroups.".concat(null == a ? void 0 : a.id), null), [m, h] = (0, o.j)("creatorHubGroup.".concat(null == a ? void 0 : a.id), null), [x, y] = (0, o.j)("creatorHubGroupData.".concat(null == a ? void 0 : a.id), {}), w = (0, n.useCallback)(e => {
            h(e);
            let t = null != e ? e : "user";
            y(e => {
                let n = {
                    lastSelected: Date.now(),
                    priority: 1
                };
                if (e[t]) {
                    let {
                        priority: r,
                        lastSelected: o
                    } = e[t];
                    "number" != typeof r || Number.isNaN(r) || "number" != typeof o || Number.isNaN(o) || (n.priority = r * (1 + Math.log10(1 + 10 / Math.max(Date.now() - o, 864e5))))
                }
                return {
                    ...e,
                    [t]: n
                }
            })
        }, [h, y]), b = (0, n.useMemo)(() => {
            if (null == l ? void 0 : l.groups) return null == l ? void 0 : l.groups;
            if (null === f) return [];
            try {
                let e = "string" == typeof f ? JSON.parse(f) : f;
                return Array.isArray(e) && e.every(e => "object" == typeof e && null !== e && "id" in e && "number" == typeof e.id && "name" in e && "string" == typeof e.name && "roleSetName" in e && "string" == typeof e.roleSetName) ? e : []
            } catch (e) {
                return []
            }
        }, [f, null == l ? void 0 : l.groups]), U = (0, n.useMemo)(() => {
            var e;
            return m && null != (e = b.find(e => {
                let {
                    id: t
                } = e;
                return t === m
            })) ? e : null
        }, [m, b]), C = null == U ? void 0 : U.id, A = null == a ? void 0 : a.id, {
            data: S,
            error: T,
            isPending: D,
            refetch: R
        } = (0, p.$)(C, A), {
            data: E,
            isPending: I,
            refetch: P
        } = (0, p.V)(C, A), j = (0, n.useCallback)(() => null == C || null == A ? Promise.resolve() : Promise.all([R(), P()]), [P, R, C, A]);
        (0, n.useEffect)(() => {
            (null == a ? void 0 : a.id) && (null == l ? void 0 : l.groups) && !s && d(null == l ? void 0 : l.groups)
        }, [null == l ? void 0 : l.groups, b, s, d, null == a ? void 0 : a.id]);
        let L = (0, n.useMemo)(() => {
            var e;
            return {
                groups: b,
                currentGroup: U,
                groupData: x,
                isFetched: !s && !!A,
                refreshGroups: c,
                setCurrentGroup: w,
                ...u,
                permissions: S,
                isOwner: null != A && (null == E || null == (e = E.owner) ? void 0 : e.userId) === A,
                isPermissionsLoading: null != U && (D || I),
                permissionsError: T,
                refreshPermissions: j
            }
        }, [U, x, b, s, I, D, E, u, S, T, c, j, w, A]);
        return (0, t.jsx)(v.Provider, {
            value: L,
            children: i
        })
    }, "W", 0, () => {
        let e = (0, n.useContext)(v);
        if (null === e) throw Error("useCurrentGroup must be used within a GroupsProvider");
        return e.currentGroup
    }, "_", 0, () => {
        let e = (0, n.useContext)(v);
        if (null === e) throw Error("useGroups must be used within a GroupsProvider");
        return e
    }], 745873)
}, 809576, e => {
    "use strict";
    var t = e.i(643766),
        n = e.i(463146),
        r = e.i(910272),
        o = e.i(228096),
        i = e.i(458451),
        a = e.i(93714),
        u = e.i(272593);
    let l = new a.A((0, u.f)("groups", "bedev1"));
    async function s(e, t, n) {
        var r;
        return null != (r = (await l.v2GroupsGroupIdEntityTypeEntityIdPermissionsResolvedGet({
            groupId: e,
            entityType: t,
            entityId: n
        })).permissions) ? r : {}
    }
    async function c(e) {
        return s(e, "groups", String(e))
    }
    async function f(e) {
        let t, n = [];
        do {
            var r, o;
            let i = await l.v2GroupsGroupIdEntityTypePermissionsResolvedGet({
                groupId: e,
                entityType: "roles",
                cursor: t
            });
            n.push(...null != (r = i.data) ? r : []), t = null != (o = i.nextPageCursor) ? o : void 0
        } while (t) return n
    }
    var d = e.i(156071);
    let g = new a.A((0, u.f)("groups", "bedev1"));
    async function p(e) {
        var t;
        return null != (t = (await g.v2EntityTypeEntityIdPermissionsResolvedGet({
            entityType: "universes",
            entityId: String(e)
        })).permissions) ? t : {}
    }
    var v = e.i(759283);
    let m = (e, t) => ["groups", e, t, "resolved-permissions"],
        h = (e, t) => ["groups", e, t, "roles", "resolved-permissions"],
        x = (e, t) => ["universe-resolved-permissions", t, void 0 === e ? e : String(e)];
    e.s(["V", 0, function(e, t) {
        return (0, r.f)({
            queryKey: ["groups", e, t, "owner"],
            queryFn: e && t ? () => d.U.getGroupInfo(e) : n.V
        })
    }, "h", 0, function() {
        let {
            user: e
        } = (0, i.s)(), n = (0, o.d)(), r = null == e ? void 0 : e.id, a = (0, t.useCallback)(e => n.fetchQuery({
            queryKey: x(e, r),
            queryFn: () => p(e),
            staleTime: 6e4
        }), [n, r]), u = (0, t.useCallback)(e => n.fetchQuery({
            queryKey: m(e, r),
            queryFn: () => c(e),
            staleTime: 6e4
        }), [n, r]), l = (0, t.useCallback)(e => n.fetchQuery({
            queryKey: h(e, r),
            queryFn: () => f(e),
            staleTime: 6e4
        }), [n, r]);
        return (0, t.useMemo)(() => ({
            fetchGroupPermissions: u,
            fetchRolePermissions: l,
            fetchUniversePermissions: a
        }), [u, l, a])
    }, "$", 0, function(e, t) {
        return (0, r.f)({
            queryKey: m(e, t),
            queryFn: e && t ? () => c(e) : n.V,
            staleTime: 6e4
        })
    }, "K", 0, function(e) {
        let {
            user: t
        } = (0, i.s)(), o = null == t ? void 0 : t.id;
        return (0, r.f)({
            queryKey: h(e, o),
            queryFn: e && o ? () => f(e) : n.V,
            staleTime: 6e4
        })
    }, "u", 0, function(e) {
        return (0, r.f)({
            queryKey: ["groups", "users", e, "owns-any-group"],
            queryFn: e ? async () => {
                try {
                    let {
                        data: t
                    } = await d.U.getUsersGroupRoles(e, {
                        includeLocked: !0
                    });
                    return (null != t ? t : []).some(t => {
                        var n;
                        let {
                            group: r
                        } = t;
                        return (null == r || null == (n = r.owner) ? void 0 : n.userId) === e
                    })
                } catch (e) {
                    return null
                }
            } : n.V,
            staleTime: 6e4
        })
    }, "v", 0, function(e) {
        let {
            user: t
        } = (0, i.s)(), o = null == t ? void 0 : t.id;
        return (0, r.f)({
            queryKey: x(e, o),
            queryFn: void 0 !== e && e !== v.h ? () => p(e) : n.V,
            staleTime: 6e4
        })
    }], 809576)
}, 725924, e => {
    "use strict";
    let t, n;
    var r, o, i = e.i(643766);
    let a = "u" > typeof Intl,
        u = !a || void 0 === Intl.Locale,
        l = !a || void 0 === Intl.RelativeTimeFormat,
        s = !a || void 0 === Intl.PluralRules,
        c = !a || void 0 === Intl.DisplayNames,
        f = "function" != typeof window.ResizeObserver,
        d = (r = u || l || s || c || f, o = function() {
            return Promise.all([(u ? e.A(361318).then(function(e) {
                return e.p
            }) : Promise.resolve()).then(() => Promise.all([l ? e.A(950511).then(function(e) {
                return e.p
            }).then(() => e.A(874521)) : null, s ? e.A(684498).then(function(e) {
                return e.p
            }).then(() => e.A(104943)) : null, c ? e.A(951862).then(() => e.A(890267)) : null])), f ? e.A(956827) : null])
        }, t = !1, n = r ? o().catch(() => {}).then(() => {
            t = !0
        }) : null, function() {
            let [e, r] = (0, i.useState)(!n || t);
            return (0, i.useEffect)(() => {
                n && !e && n.then(() => r(!0))
            }, [e]), e
        });
    e.s(["f", 0, d], 725924)
}, 823062, e => {
    "use strict";
    var t = e.i(643766),
        n = e.i(544761);
    let r = (0, t.createContext)(null),
        o = [],
        i = ["pageload", "click", "impression", "hover", "webvitals", "apivitals", "formvitals", "error", "session"],
        a = new Set(["TTFB", "FCP", "LCP", "FID", "CLS", "INP"]);

    function u() {
        let e = (0, t.useContext)(r);
        if (null === e) throw Error("useUnifiedLoggerProvider must be used within a UnifiedLoggerProvider");
        return e
    }
    let l = () => null;
    e.s(["d", 0, e => {
        var u;
        let {
            children: l,
            unifiedLogger: s,
            pageLoggerConfig: c,
            path: f,
            url: d,
            isReady: g = !0,
            getPageLoadPath: p
        } = e, v = null != (u = null == c ? void 0 : c.tags) ? u : o, m = null == c ? void 0 : c.rosId, h = (0, t.useMemo)(() => ({
            tags: v,
            rosId: m,
            path: f,
            url: d,
            isReady: g
        }), [v, m, f, d, g]), x = (0, t.useRef)(h), y = (0, t.useRef)(h), w = (0, t.useRef)(p);
        (0, t.useLayoutEffect)(() => {
            w.current = p
        }, [p]), (0, t.useLayoutEffect)(() => {
            y.current = h, void 0 === x.current.path && void 0 !== h.path && (x.current = {
                ...x.current,
                path: h.path
            })
        }, [h]), (0, t.useLayoutEffect)(() => {
            let e = e => {
                var t;
                let r;
                if (e instanceof n.W && void 0 !== e.pageContext) return;
                let o = (r = null == (t = e.parameters) ? void 0 : t.metricName, "webvitals" === e.eventType && void 0 !== r && a.has(r)) ? x.current : y.current,
                    i = "pageload" === e.eventType && w.current ? w.current() : o.path;
                void 0 !== i && (e.parameters = {
                    ...e.parameters,
                    path: i
                }), o.tags.forEach(t => e.addTag(t)), void 0 !== o.rosId && e.addTag("owner: ".concat(o.rosId))
            };
            return i.forEach(t => {
                s.events.on(t, e)
            }), () => {
                i.forEach(t => {
                    s.events.off(t, e)
                })
            }
        }, [s]);
        let b = (0, t.useMemo)(() => ({
            unifiedLogger: s,
            pageContext: h
        }), [s, h]);
        return t.default.createElement(r.Provider, {
            value: b
        }, l)
    }, "W", 0, function() {
        return (0, t.useContext)(r)
    }, "G", 0, e => {
        let {
            unifiedLogger: n,
            pageContext: r
        } = u(), {
            path: o,
            url: i,
            isReady: a
        } = r, s = n.pageSettledTracker, c = (0, t.useSyncExternalStore)(s.subscribe, s.getSnapshot, l);
        (0, t.useEffect)(() => {
            if (!c || c.isNavigating || !a || !o || !i || !e || c.url.split(/[?#]/)[0] !== i.split(/[?#]/)[0]) return;
            let t = new URL(o, window.location.origin).pathname,
                r = requestAnimationFrame(() => {
                    r = requestAnimationFrame(() => {
                        n.logPageSettledEvent({
                            navigationId: c.id,
                            page: t,
                            outcome: e
                        })
                    })
                });
            return () => cancelAnimationFrame(r)
        }, [c, a, i, o, e, n])
    }, "X", 0, u])
}]);

//# debugId=f6f9403e-edbc-b497-1acd-754bbba13158
//# sourceMappingURL=0b5j1omt4wgtq.js.map