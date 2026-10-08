;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "35bac514-5ca5-7355-07df-bf392f40ef0e")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 138726, e => {
    "use strict";
    var t = e.i(221628),
        n = e.i(416340),
        r = e.i(589624),
        i = e.i(458451),
        o = e.i(725924),
        s = e.i(969687),
        a = e.i(794472),
        l = e.i(697973),
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
                background: g
            }
        } = d(), {
            status: h,
            login: v
        } = (0, i.useRobloxAuthentication)(), m = (0, o.usePolyfills)();
        return ((0, n.useEffect)(() => {
            "unauthenticated" === h && v(), "logged-out" === h && r.default.push(c.creatorHub.getUrl())
        }, [v, h]), "initial" !== h && "loading" !== h && m) ? "error" === h ? (0, t.jsx)("div", {
            className: g,
            children: (0, t.jsx)("div", {
                className: f,
                children: (0, t.jsx)(u.default, {
                    onReload: () => {
                        r.default.reload()
                    }
                })
            })
        }) : (0, t.jsx)(t.Fragment, {
            children: s
        }) : (0, t.jsx)("div", {
            className: g,
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
        r = e.i(697973),
        i = e.i(982690);
    let o = (0, r.makeStyles)()((e, t) => {
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
                id: r,
                className: s,
                classes: a,
                flexDirection: l,
                flexWrap: u,
                justifyContent: c,
                alignItems: d,
                gap: f = 0,
                children: g
            } = e, {
                classes: {
                    flex: h,
                    ...v
                },
                cx: m
            } = o({
                gap: f
            });
            return (0, t.jsx)("div", {
                ref: n,
                id: r,
                className: m(h, v.gap, s, null == a ? void 0 : a.root, v["flexDirection".concat((0, i.snakeToPascalCase)(null != l ? l : ""))], v["flexWrap".concat((0, i.snakeToPascalCase)(null != u ? u : ""))], v["alignItems".concat((0, i.snakeToPascalCase)(null != d ? d : ""))], v["justifyContent".concat((0, i.snakeToPascalCase)(null != c ? c : ""))]),
                children: g
            })
        });
    s.displayName = "Flex", e.s(["Flex", 0, s, "default", 0, s])
}, 462863, e => {
    "use strict";
    var t = e.i(221628),
        n = e.i(921394);
    e.s(["default", 0, e => {
        let {
            lightSrc: r,
            darkSrc: i,
            alt: o,
            ...s
        } = e, {
            themeMode: a
        } = (0, n.useThemeMode)();
        return (0, t.jsx)("img", {
            src: "dark" === a && null != i ? i : r,
            alt: o,
            ...s
        })
    }])
}, 71375, e => {
    "use strict";
    var t = e.i(221628),
        n = e.i(429884),
        r = e.i(127792),
        i = e.i(858517),
        o = e.i(79187),
        s = e.i(921394),
        a = e.i(881670);
    let l = (0, o.withTranslation)(e => {
        let {
            onReload: o
        } = e, {
            themeMode: a
        } = (0, s.useThemeMode)(), l = "dark" === a ? r.default : i.default;
        return (0, t.jsx)(n.LoadError, {
            src: l,
            onReload: o
        })
    }, [a.TranslationNamespace.Error]);
    e.s(["default", 0, l])
}, 191685, e => {
    "use strict";
    var t = e.i(17829);
    let n = "https://www.".concat("roblox.com"),
        r = "https://advertise.".concat("roblox.com"),
        i = e => "".concat(n, "/groups/").concat(e),
        o = e => "".concat(n, "/users/").concat(e, "/profile");
    e.s(["AdsManagerUrl", 0, r, "BUY_ROBUX_CTX_CREATOR_HUB", 0, "creatorhub", "getAccountSecurityUrl", 0, () => "".concat(n, "/my/account#!/security"), "getAccountSettingsUrl", 0, () => "".concat(n, "/my/account#!/info"), "getAppealsPortalUrl", 0, () => "".concat(n, "/report-appeals#"), "getBadgeUrl", 0, e => "".concat(n, "/badges/").concat(e), "getBundleUrl", 0, e => "".concat(n, "/bundles/").concat(e), "getBuyRobuxUrl", 0, e => "".concat(n, "/upgrades/robux?ctx=").concat(encodeURIComponent(e)), "getCatalogUrl", 0, e => "".concat(n, "/catalog/").concat(e), "getCommunitiesUrl", 0, e => "".concat(n, "/communities/").concat(e), "getConfigureGroupRevenueSalesUrl", 0, e => "".concat(n, "/groups/configure?id=").concat(e, "#!/revenue/sales"), "getConfigureGroupRolesUrl", 0, e => "".concat(n, "/groups/configure?id=").concat(e, "#!/roles"), "getCreatorUrl", 0, (e, n) => e === t.default.Group ? i(n) : o(n), "getEventUrl", 0, e => "".concat(n, "/events/").concat(e), "getGameDetailsUrl", 0, e => "".concat(n, "/games/").concat(e), "getGamePassUrl", 0, e => "".concat(n, "/game-pass/").concat(e), "getGroupUrl", 0, i, "getHomeUrl", 0, () => "".concat(n, "/home"), "getLegacyGroupTransactionsUrl", 0, e => "".concat(n, "/groups/configure?id=").concat(e, "#!/revenue/sales"), "getLegacyTransactionsUrl", 0, () => "".concat(n, "/transactions"), "getLookUrl", 0, e => "".concat(n, "/looks/").concat(e), "getSponsorAvatarItemsUrl", 0, () => "".concat(n, "/sponsorships/list#!/avatar-items"), "getSponsorExperienceCreateUrl", 0, e => "".concat(r, "/create?universeId=").concat(e), "getSponsorExperienceUrl", 0, e => "".concat(r, "?universeId=").concat(e), "getSupportFormUrl", 0, () => "".concat(n, "/support"), "getTermsUrl", 0, () => "".concat(n, "/info/terms"), "getTransactionsUrl", 0, () => "".concat(n, "/transactions"), "getUrl", 0, () => n, "getUserUrl", 0, o])
}, 982690, e => {
    "use strict";
    var t = e.i(851439);
    e.i(252842);
    var n = void 0;
    e.s(["alpha", 0, (e, t) => t < 16 ? "".concat(e, "0").concat(t.toString(16)) : "".concat(e).concat(t.toString(16)), "arrayToChunks", 0, (e, t) => {
        let n = [];
        for (let r = 0; r < e.length; r += t) {
            let i = e.slice(r, r + t);
            n.push(i)
        }
        return n
    }, "capitalizeFirstLetter", 0, (e, t) => 0 === t.length ? t : t.charAt(0).toLocaleUpperCase(e || "en-US") + t.slice(1).toLocaleLowerCase(e || "en-US"), "dayToMs", 0, e => 60 * e * 144e4, "debounce", 0, function(e) {
        let t, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 300;
        return [function() {
            for (var i = arguments.length, o = Array(i), s = 0; s < i; s++) o[s] = arguments[s];
            clearTimeout(t), t = setTimeout(() => {
                e.apply(n, o)
            }, r)
        }, () => {
            clearTimeout(t)
        }]
    }, "getRecordEntries", 0, e => Object.entries(e), "isNonEmptyString", 0, e => "string" == typeof e && e.trim().length > 0, "shuffle", 0, (e, n) => {
        let r = (0, t.default)(n),
            i = [...e],
            o = e.length;
        for (; o;) {
            let e = Math.floor(r() * o),
                t = i[o -= 1];
            i[o] = i[e], i[e] = t
        }
        return i
    }, "snakeToPascalCase", 0, e => e.split("-").reduce((e, t) => {
        var n;
        return e + (null != (n = t[0]) ? n : "").toUpperCase() + t.slice(1)
    }, ""), "throttle", 0, function(e, t) {
        let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "leading_and_trailing",
            r = null,
            i = null,
            o = null,
            s = () => !!i && (e.call(o, ...i), i = null, o = null, !0),
            a = () => {
                r = null, ("trailing" === n || "leading_and_trailing" === n) && s() && (r = setTimeout(a, t))
            };
        return [function() {
            for (var e = arguments.length, l = Array(e), u = 0; u < e; u++) l[u] = arguments[u];
            i = l, o = this, r || (("leading" === n || "leading_and_trailing" === n) && s(), r = setTimeout(a, t))
        }, () => {
            r && (clearTimeout(r), r = null)
        }]
    }])
}, 688412, (e, t, n) => {
    ! function(t, n, r) {
        function i(e) {
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

        function s(e, t) {
            var n = new i(e),
                r = t && t.state,
                s = n.next;
            return s.int32 = function() {
                return 0x100000000 * n.next() | 0
            }, s.double = function() {
                return s() + (2097152 * s() | 0) * 11102230246251565e-32
            }, s.quick = s, r && ("object" == typeof r && o(r, n), s.state = function() {
                return o(n, {})
            }), s
        }
        if (n && n.exports) n.exports = s;
        else if (r && r.amd) e.r, void 0 !== s && e.v(s);
        else this.alea = s
    }(e.e, t, "function" == typeof define && define)
}, 589535, (e, t, n) => {
    ! function(t, n, r) {
        function i(e) {
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

        function s(e, t) {
            var n = new i(e),
                r = t && t.state,
                s = function() {
                    return (n.next() >>> 0) / 0x100000000
                };
            return s.double = function() {
                do var e = ((n.next() >>> 11) + (n.next() >>> 0) / 0x100000000) / 2097152; while (0 === e) return e
            }, s.int32 = n.next, s.quick = s, r && ("object" == typeof r && o(r, n), s.state = function() {
                return o(n, {})
            }), s
        }
        if (n && n.exports) n.exports = s;
        else if (r && r.amd) e.r, void 0 !== s && e.v(s);
        else this.xor128 = s
    }(e.e, t, "function" == typeof define && define)
}, 516501, (e, t, n) => {
    ! function(t, n, r) {
        function i(e) {
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

        function s(e, t) {
            var n = new i(e),
                r = t && t.state,
                s = function() {
                    return (n.next() >>> 0) / 0x100000000
                };
            return s.double = function() {
                do var e = ((n.next() >>> 11) + (n.next() >>> 0) / 0x100000000) / 2097152; while (0 === e) return e
            }, s.int32 = n.next, s.quick = s, r && ("object" == typeof r && o(r, n), s.state = function() {
                return o(n, {})
            }), s
        }
        if (n && n.exports) n.exports = s;
        else if (r && r.amd) e.r, void 0 !== s && e.v(s);
        else this.xorwow = s
    }(e.e, t, "function" == typeof define && define)
}, 216692, (e, t, n) => {
    ! function(t, n, r) {
        function i(e) {
            var t = this;
            t.next = function() {
                var e, n, r = t.x,
                    i = t.i;
                return e = r[i], e ^= e >>> 7, n = e ^ e << 24 ^ ((e = r[i + 1 & 7]) ^ e >>> 10) ^ ((e = r[i + 3 & 7]) ^ e >>> 3) ^ ((e = r[i + 4 & 7]) ^ e << 7), e = r[i + 7 & 7], e ^= e << 13, n ^= e ^ e << 9, r[i] = n, t.i = i + 1 & 7, n
            };
            var n, r = e,
                i = [];
            if (r === (0 | r)) i[0] = r;
            else
                for (n = 0, r = "" + r; n < r.length; ++n) i[7 & n] = i[7 & n] << 15 ^ r.charCodeAt(n) + i[n + 1 & 7] << 13;
            for (; i.length < 8;) i.push(0);
            for (n = 0; n < 8 && 0 === i[n]; ++n);
            for (8 == n ? i[7] = -1 : i[n], t.x = i, t.i = 0, n = 256; n > 0; --n) t.next()
        }

        function o(e, t) {
            return t.x = e.x.slice(), t.i = e.i, t
        }

        function s(e, t) {
            null == e && (e = +new Date);
            var n = new i(e),
                r = t && t.state,
                s = function() {
                    return (n.next() >>> 0) / 0x100000000
                };
            return s.double = function() {
                do var e = ((n.next() >>> 11) + (n.next() >>> 0) / 0x100000000) / 2097152; while (0 === e) return e
            }, s.int32 = n.next, s.quick = s, r && (r.x && o(r, n), s.state = function() {
                return o(n, {})
            }), s
        }
        if (n && n.exports) n.exports = s;
        else if (r && r.amd) e.r, void 0 !== s && e.v(s);
        else this.xorshift7 = s
    }(e.e, t, "function" == typeof define && define)
}, 684912, (e, t, n) => {
    ! function(t, n, r) {
        function i(e) {
            var t = this;
            t.next = function() {
                var e, n, r = t.w,
                    i = t.X,
                    o = t.i;
                return t.w = r = r + 0x61c88647 | 0, n = i[o + 34 & 127], e = i[o = o + 1 & 127], n ^= n << 13, e ^= e << 17, n ^= n >>> 15, e ^= e >>> 12, n = i[o] = n ^ e, t.i = o, n + (r ^ r >>> 16) | 0
            }, ! function(e, t) {
                var n, r, i, o, s, a = [],
                    l = 128;
                for (t === (0 | t) ? (r = t, t = null) : (t += "\0", r = 0, l = Math.max(l, t.length)), i = 0, o = -32; o < l; ++o) t && (r ^= t.charCodeAt((o + 32) % t.length)), 0 === o && (s = r), r ^= r << 10, r ^= r >>> 15, r ^= r << 4, r ^= r >>> 13, o >= 0 && (s = s + 0x61c88647 | 0, i = 0 == (n = a[127 & o] ^= r + s) ? i + 1 : 0);
                for (i >= 128 && (a[127 & (t && t.length || 0)] = -1), i = 127, o = 512; o > 0; --o) r = a[i + 34 & 127], n = a[i = i + 1 & 127], r ^= r << 13, n ^= n << 17, r ^= r >>> 15, n ^= n >>> 12, a[i] = r ^ n;
                e.w = s, e.X = a, e.i = i
            }(t, e)
        }

        function o(e, t) {
            return t.i = e.i, t.w = e.w, t.X = e.X.slice(), t
        }

        function s(e, t) {
            null == e && (e = +new Date);
            var n = new i(e),
                r = t && t.state,
                s = function() {
                    return (n.next() >>> 0) / 0x100000000
                };
            return s.double = function() {
                do var e = ((n.next() >>> 11) + (n.next() >>> 0) / 0x100000000) / 2097152; while (0 === e) return e
            }, s.int32 = n.next, s.quick = s, r && (r.X && o(r, n), s.state = function() {
                return o(n, {})
            }), s
        }
        if (n && n.exports) n.exports = s;
        else if (r && r.amd) e.r, void 0 !== s && e.v(s);
        else this.xor4096 = s
    }(e.e, t, "function" == typeof define && define)
}, 646024, (e, t, n) => {
    ! function(t, n, r) {
        function i(e) {
            var t = this,
                n = "";
            t.next = function() {
                var e = t.b,
                    n = t.c,
                    r = t.d,
                    i = t.a;
                return e = e << 25 ^ e >>> 7 ^ n, n = n - r | 0, r = r << 24 ^ r >>> 8 ^ i, i = i - e | 0, t.b = e = e << 20 ^ e >>> 12 ^ n, t.c = n = n - r | 0, t.d = r << 16 ^ n >>> 16 ^ i, t.a = i - e | 0
            }, t.a = 0, t.b = 0, t.c = -0x61c88647, t.d = 0x517cc1b7, e === Math.floor(e) ? (t.a = e / 0x100000000 | 0, t.b = 0 | e) : n += e;
            for (var r = 0; r < n.length + 20; r++) t.b ^= n.charCodeAt(r), t.next()
        }

        function o(e, t) {
            return t.a = e.a, t.b = e.b, t.c = e.c, t.d = e.d, t
        }

        function s(e, t) {
            var n = new i(e),
                r = t && t.state,
                s = function() {
                    return (n.next() >>> 0) / 0x100000000
                };
            return s.double = function() {
                do var e = ((n.next() >>> 11) + (n.next() >>> 0) / 0x100000000) / 2097152; while (0 === e) return e
            }, s.int32 = n.next, s.quick = s, r && ("object" == typeof r && o(r, n), s.state = function() {
                return o(n, {})
            }), s
        }
        if (n && n.exports) n.exports = s;
        else if (r && r.amd) e.r, void 0 !== s && e.v(s);
        else this.tychei = s
    }(e.e, t, "function" == typeof define && define)
}, 491098, (e, t, n) => {
    ! function(n, r, i) {
        var o, s = "random",
            a = i.pow(256, 6),
            l = i.pow(2, 52),
            u = 2 * l;

        function c(e, t, c) {
            var v = [],
                m = g(function e(t, n) {
                    var r, i = [],
                        o = typeof t;
                    if (n && "object" == o)
                        for (r in t) try {
                            i.push(e(t[r], n - 1))
                        } catch (e) {}
                    return i.length ? i : "string" == o ? t : t + "\0"
                }((t = !0 == t ? {
                    entropy: !0
                } : t || {}).entropy ? [e, h(r)] : null == e ? function() {
                    try {
                        var e;
                        return o && (e = o.randomBytes) ? e = e(256) : (e = new Uint8Array(256), (n.crypto || n.msCrypto).getRandomValues(e)), h(e)
                    } catch (e) {
                        var t = n.navigator,
                            i = t && t.plugins;
                        return [+new Date, n, i, n.screen, h(r)]
                    }
                }() : e, 3), v),
                p = new d(v),
                w = function() {
                    for (var e = p.g(6), t = a, n = 0; e < l;) e = (e + n) * 256, t *= 256, n = p.g(1);
                    for (; e >= u;) e /= 2, t /= 2, n >>>= 1;
                    return (e + n) / t
                };
            return w.int32 = function() {
                return 0 | p.g(4)
            }, w.quick = function() {
                return p.g(4) / 0x100000000
            }, w.double = w, g(h(p.S), r), (t.pass || c || function(e, t, n, r) {
                return (r && (r.S && f(r, p), e.state = function() {
                    return f(p, {})
                }), n) ? (i[s] = e, t) : e
            })(w, m, "global" in t ? t.global : this == i, t.state)
        }

        function d(e) {
            var t, n = e.length,
                r = this,
                i = 0,
                o = r.i = r.j = 0,
                s = r.S = [];
            for (n || (e = [n++]); i < 256;) s[i] = i++;
            for (i = 0; i < 256; i++) s[i] = s[o = 255 & o + e[i % n] + (t = s[i])], s[o] = t;
            (r.g = function(e) {
                for (var t, n = 0, i = r.i, o = r.j, s = r.S; e--;) t = s[i = 255 & i + 1], n = 256 * n + s[255 & (s[i] = s[o = 255 & o + t]) + (s[o] = t)];
                return r.i = i, r.j = o, n
            })(256)
        }

        function f(e, t) {
            return t.i = e.i, t.j = e.j, t.S = e.S.slice(), t
        }

        function g(e, t) {
            for (var n, r = e + "", i = 0; i < r.length;) t[255 & i] = 255 & (n ^= 19 * t[255 & i]) + r.charCodeAt(i++);
            return h(t)
        }

        function h(e) {
            return String.fromCharCode.apply(0, e)
        }
        if (g(i.random(), r), t.exports) {
            t.exports = c;
            try {
                o = {}
            } catch (e) {}
        } else if ("function" == typeof define && define.amd) e.r, void 0 !== c && e.v(c);
        else i["seed" + s] = c
    }("u" > typeof self ? self : e.e, [], Math)
}, 851439, (e, t, n) => {
    var r = e.r(688412),
        i = e.r(589535),
        o = e.r(516501),
        s = e.r(216692),
        a = e.r(684912),
        l = e.r(646024),
        u = e.r(491098);
    u.alea = r, u.xor128 = i, u.xorwow = o, u.xorshift7 = s, u.xor4096 = a, u.tychei = l, t.exports = u
}, 725924, e => {
    "use strict";
    let t, n;
    var r, i, o = e.i(416340);
    let s = "u" > typeof Intl,
        a = !s || void 0 === Intl.Locale,
        l = !s || void 0 === Intl.RelativeTimeFormat,
        u = !s || void 0 === Intl.PluralRules,
        c = !s || void 0 === Intl.DisplayNames,
        d = "function" != typeof window.ResizeObserver,
        f = (r = a || l || u || c || d, i = function() {
            return Promise.all([(a ? e.A(361318).then(function(e) {
                return e.p
            }) : Promise.resolve()).then(() => Promise.all([l ? e.A(950511).then(function(e) {
                return e.p
            }).then(() => e.A(874521)) : null, u ? e.A(684498).then(function(e) {
                return e.p
            }).then(() => e.A(104943)) : null, c ? e.A(951862).then(() => e.A(890267)) : null])), d ? e.A(956827) : null])
        }, t = !1, n = r ? i().catch(() => {}).then(() => {
            t = !0
        }) : null, function() {
            let [e, r] = (0, o.useState)(!n || t);
            return (0, o.useEffect)(() => {
                n && !e && n.then(() => r(!0))
            }, [e]), e
        });
    e.s(["usePolyfills", 0, f], 725924)
}, 969687, e => {
    "use strict";
    var t, n, r, i, o, s, a, l = e.i(92794),
        u = e.i(721281),
        c = e.i(252842),
        d = e.i(79187),
        f = e.i(416340),
        g = e.i(80768),
        h = e.i(533414),
        v = ((i = {}).TIMED_OUT = "TIMED_OUT", i.WEBVIEW_NOT_INITIALIZED = "WEBVIEW_NOT_INITIALIZED", i.WEBVIEW_NOT_FOUND = "WEBVIEW_NOT_FOUND", i.INVALID_MESSAGE = "INVALID_MESSAGE", i);
    class m extends Error {
        constructor(e, t, n) {
            let r = "MessageBusError, code: ".concat(e);
            t && (r += ", eventName: ".concat(t)), n && (r += ", type: ".concat(n)), super(r), (0, u._)(this, "code", void 0), (0, u._)(this, "eventName", void 0), (0, u._)(this, "eventType", void 0), this.code = e, this.eventName = t, this.eventType = n
        }
    }
    var p = ((o = p || {}).DarkFoundation = "darkFoundation", o.LightFoundation = "lightFoundation", o);
    let w = "darkFoundation";
    var x = ((s = {}).Fire = "fire", s.Response = "response", s.Request = "request", s);

    function b() {
        var e, t, n, r, i, o;
        let s = null == (t = window) || null == (e = t.navigator) ? void 0 : e.userAgent;
        return (null == (r = window) || null == (n = r.rbx) ? void 0 : n.studio.isPrewarm) !== !0 && (null == (o = window) || null == (i = o.rbx) ? void 0 : i.postMessage) !== void 0 && void 0 !== s && s.includes("RobloxStudio")
    }

    function y() {
        var e, t, n, r;
        return (null != (e = null == (r = window) || null == (n = r.rbx) || null == (t = n.studio) ? void 0 : t.osPlatform) ? e : "").toLowerCase().startsWith("win")
    }
    class E {
        enqueueMessage(e) {
            this.queue.push(e), this.debouncedFlush()
        }
        flush() {
            let e = "".concat(this.url, "?"),
                t = 0;
            for (let n of this.queue) {
                let r = e + "msg".concat(t, "=").concat(encodeURIComponent(n), "&");
                if (r.length > this.maxUrlLength) {
                    if (t > 0) {
                        this.queue = this.queue.slice(t), this.postFrameMessage(e), this.debouncedFlush();
                        return
                    }
                    console.warn("Message too large: (".concat(r.length, "), attempting to send anyway")), this.queue = this.queue.slice(1), this.postFrameMessage(r), this.queue.length > 0 && this.debouncedFlush();
                    return
                }
                e = r, t += 1
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
                frameRemoveDelay: r = 10,
                maxUrlLength: i = 64e3
            } = t;
            this.url = e, this.frameRemoveDelay = r, this.maxUrlLength = i, [this.debouncedFlush] = (0, c.debounce)(() => this.flush(), n)
        }
    }
    let S = d.Locale.English;
    class C {
        getStudioConfiguration() {
            var e;
            if (!b() || !(null == (e = window.rbx) ? void 0 : e.messageBus)) throw new m(v.WEBVIEW_NOT_INITIALIZED);
            let t = window.rbx.studio;
            return Object.values(d.Locale).includes(t.locale) || (console.warn("Locale: ".concat(t.locale, " is not valid. Defaulting to ").concat(S, ".")), t.locale = S), Object.values(p).includes(t.theme) || (console.warn("Theme: ".concat(t.theme, " is not valid. Defaulting to ").concat(w, ".")), t.theme = w), t
        }
        getOrCreateEventListenersMap(e) {
            let t = e.events;
            if (t) return t;
            let n = new Map;
            return e.events = n, n
        }
        loadWebView() {
            var e, t, n, r;
            if (!b() || !(null == (e = window.rbx) ? void 0 : e.messageBus)) throw new m(v.WEBVIEW_NOT_INITIALIZED);
            if ((null == (t = window.rbx) ? void 0 : t.postMessageFrameUrl) && (null == (r = window.webkit) || null == (n = r.messageHandlers) ? void 0 : n.roblox)) {
                let e = new E(window.rbx.postMessageFrameUrl);
                window.webkit.messageHandlers.roblox.postMessage = t => {
                    e.enqueueMessage(t)
                }
            }
            let i = this.getOrCreateEventListenersMap(window.rbx.messageBus);
            window.rbx.messageBus = {
                dispatchEvent: (e, t, n) => {
                    let r = i.get(e),
                        o = null == r ? void 0 : r.uuidSpecificListeners,
                        s = null == r ? void 0 : r.generalListeners;
                    if (void 0 !== o) {
                        var a;
                        let e = o.get(null != (a = t.uuid) ? a : "");
                        e && e(n, t)
                    }
                    void 0 !== s && s.forEach(e => e(n, t))
                },
                events: i
            }
        }
        async initHandshake(e) {
            return this.call("internal:init", e, 0)
        }
        getFullEventName(e) {
            return String(e).includes("internal") ? e.toString() : "".concat(this.namespace, ":").concat(String(e))
        }
        postMessage(e, t, n) {
            var r;
            if (!b() || !(null == (r = window.rbx) ? void 0 : r.postMessage)) throw new m(v.WEBVIEW_NOT_FOUND, e, t.type);
            let i = JSON.stringify(t),
                o = JSON.stringify(n);
            if (i.includes("|")) throw new m(v.INVALID_MESSAGE, e, t.type);
            let s = "1|".concat(e, "|").concat(i, "|").concat(o);
            window.rbx.postMessage("messageBusEvent", s)
        }
        setListenerInternal(e, t, n) {
            var r;
            let i = null == (r = window.rbx) ? void 0 : r.messageBus;
            if (!b() || !i) throw new m(v.WEBVIEW_NOT_FOUND, String(e));
            let o = this.getFullEventName(e),
                s = this.getOrCreateEventListenersMap(i),
                a = new Map,
                l = s.get(o);
            l ? l.uuidSpecificListeners ? a = l.uuidSpecificListeners : l.uuidSpecificListeners = a : s.set(o, {
                uuidSpecificListeners: a,
                generalListeners: []
            }), a.set(n, t)
        }
        removeListenerInternal(e, t) {
            var n;
            let r = this.getFullEventName(e),
                i = null == (n = window.rbx) ? void 0 : n.messageBus.events;
            if (!i) return;
            let o = i.get(r),
                s = null == o ? void 0 : o.uuidSpecificListeners;
            void 0 !== s && s.has(t) && s.delete(t)
        }
        setListener(e, t) {
            var n;
            let r = null == (n = window.rbx) ? void 0 : n.messageBus;
            if (!b() || !r) throw new m(v.WEBVIEW_NOT_FOUND, String(e));
            let i = this.getFullEventName(e),
                o = (e, n) => {
                    var r;
                    let o = null != (r = t(e)) ? r : {};
                    n.type === x.Request && this.postMessage(i, {
                        type: x.Response,
                        uuid: n.uuid
                    }, o)
                },
                s = this.getOrCreateEventListenersMap(r),
                a = [],
                l = s.get(i);
            return l ? l.generalListeners ? a = l.generalListeners : l.generalListeners = a : s.set(i, {
                uuidSpecificListeners: new Map,
                generalListeners: a
            }), a.push(o), o
        }
        removeListener(e, t) {
            var n;
            let r = this.getFullEventName(e),
                i = null == (n = window.rbx) ? void 0 : n.messageBus.events;
            if (!i) return;
            let o = i.get(r),
                s = null == o ? void 0 : o.generalListeners;
            if (void 0 === s || 0 === s.length) return;
            let a = s.indexOf(t);
            a > -1 && s.splice(a, 1)
        }
        async call(e, t) {
            let n, r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 3e3;
            if (!b()) throw new m(v.WEBVIEW_NOT_FOUND, String(e), x.Request);
            let i = n => new Promise(r => {
                    let i = (t, i) => {
                        this.removeListenerInternal(e, n), r(t)
                    };
                    this.setListenerInternal(e, i, n), this.postMessage(this.getFullEventName(e), {
                        type: x.Request,
                        uuid: n
                    }, t)
                }),
                o = c.uuidService.generateRandomUuid();
            return r <= 0 ? i(o) : Promise.race([new Promise((t, i) => {
                n = setTimeout(() => {
                    this.removeListenerInternal(e, o), i(new m(v.TIMED_OUT, String(e), x.Request))
                }, r)
            }), i(o).then(e => (n && clearTimeout(n), e))])
        }
        fire(e, t) {
            if (!b()) throw new m(v.WEBVIEW_NOT_FOUND, String(e), x.Fire);
            let n = c.uuidService.generateRandomUuid();
            this.postMessage(this.getFullEventName(e), {
                type: x.Fire,
                uuid: n
            }, t)
        }
        constructor(e) {
            (0, u._)(this, "namespace", void 0), this.namespace = e.namespace
        }
    }
    var L = ((a = {}).changeTheme = "internal:changeTheme", a.changeVolume = "internal:changeVolume", a.hideSnackbar = "internal:hideSnackbar", a.init = "internal:init", a.showSnackbar = "internal:showSnackbar", a.deprecatedSendAnalyticsCounterEvent = "sendAnalyticsCounterEvent", a.deprecatedSendAnalyticsEvent = "sendAnalyticsEvent", a);

    function T(e, t) {
        let n = e.getElementsByTagName("video"),
            r = e.getElementsByTagName("audio");
        n.length > 0 && Array.from(n).forEach(e => {
            e.volume = t
        }), r.length > 0 && Array.from(r).forEach(e => {
            e.volume = t
        })
    }
    let M = !1,
        I = e => {
            var t;
            return null != (t = Object.values(d.Locale).find(t => t === e)) ? t : null
        },
        k = () => {
            var e, t, n;
            (null == (e = window.rbx) ? void 0 : e.postMessage) && !M && (M = !0, null == (n = window.rbx) || null == (t = n.postMessage) || t.call(n, "loadprogress", "afterInteractive"))
        },
        _ = () => {
            "loading" === document.readyState ? document.addEventListener("DOMContentLoaded", k, {
                once: !0
            }) : k()
        };
    (null == (t = window.rbx) ? void 0 : t.postMessage) && (null == (r = window.rbx) || null == (n = r.postMessage) || n.call(r, "loadprogress", "beforeInteractive"), y() || _());
    let U = [],
        W = !1;

    function F() {}
    let A = () => () => F;
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
            var t, n, r, i, o, s;
            super({
                namespace: e
            }), (0, u._)(this, "studioConfiguration", void 0), (0, u._)(this, "loadWebView", F), (0, u._)(this, "setListener", A), (0, u._)(this, "fire", F), this.studioConfiguration = {
                theme: p.DarkFoundation,
                locale: d.Locale.English,
                isPrewarm: !1
            }, window.rbx = {
                ...window.rbx,
                studio: null != (t = null == (i = window.rbx) ? void 0 : i.studio) ? t : this.studioConfiguration,
                messageBus: null != (n = null == (o = window.rbx) ? void 0 : o.messageBus) ? n : {
                    events: new Map,
                    dispatchEvent: F
                },
                postMessage: null != (r = null == (s = window.rbx) ? void 0 : s.postMessage) ? r : F
            }
        }
    }, "StudioTheme", 0, p, "StudioWebViewMessageBusConnector", 0, function(e) {
        var t, n;
        let {
            children: r,
            useContextHook: i,
            capabilities: o = U,
            isReadyToInitialize: s
        } = e, {
            isWebView: a,
            getStudioConfiguration: l,
            setStudioThemeOverride: u,
            initHandshake: c,
            removeListener: d,
            setListener: h,
            loadWebView: v,
            studioVersion: m
        } = i(), p = (0, f.useRef)(a && null != (t = l().volume) ? t : 1), w = (0, f.useRef)(a ? (n = () => p.current, new MutationObserver(e => {
            e.forEach(e => {
                "childList" === e.type && e.addedNodes.forEach(e => {
                    e instanceof Element && (("AUDIO" === e.tagName || "VIDEO" === e.tagName) && (e.volume = n()), e.children.length > 0 && T(e, n()))
                })
            })
        })) : null), x = (0, f.useCallback)(e => {
            let {
                theme: t
            } = e;
            u(t)
        }, [u]), b = (0, f.useCallback)(e => {
            let {
                volume: t
            } = e;
            p.current = t, T(document.body, t)
        }, [p]);
        return (0, f.useEffect)(() => {
            var e;
            g.setTag("isWebView", a), a && (T(document.body, p.current), null == (e = w.current) || e.observe(document.body, {
                childList: !0,
                subtree: !0
            }), window.addEventListener("dragover", e => e.preventDefault(), !0), window.addEventListener("drop", e => e.preventDefault(), !0))
        }, [a]), (0, f.useEffect)(() => {
            a && m && g.setTag("studioVersion", m)
        }, [a, m]), (0, f.useEffect)(() => {
            if (a) {
                var e;
                void 0 === (null == (e = window.rbx) ? void 0 : e.messageBus.dispatchEvent) && v();
                let t = h(L.changeTheme, x),
                    n = h(L.changeVolume, b);
                return () => {
                    d(L.changeTheme, t), d(L.changeVolume, n)
                }
            }
            return () => {}
        }, [x, b, a, v, d, h]), (0, f.useEffect)(() => {
            !a || W || y() && !1 === s || (W = !0, _(), c({
                capabilities: o
            }))
        }, [a, c, o, s]), f.default.createElement(f.default.Fragment, null, r)
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
            MockMessageBus: r,
            defaultToMockWebView: i = !1
        } = e, o = (0, f.createContext)(null), s = new C({
            namespace: t
        }), a = (e => {
            let {
                context: t,
                bus: n,
                useSearchParams: r,
                MockMessageBus: i,
                defaultToMockWebView: o
            } = e;
            return function(e) {
                let {
                    children: s
                } = e, a = (0, f.useMemo)(() => b(), []), u = r(), [c, g] = (0, h.useSessionStorage)("mock_web_view", null), v = (0, f.useRef)(null), m = !a && (!0 === c || o), x = a || m, y = (0, f.useMemo)(() => m ? (null != v.current || (v.current = new i), v.current) : n, [m]), E = (0, f.useCallback)((e, t, n) => y.call(e, t, n), [y]), S = (0, f.useCallback)((e, t) => {
                    y.fire(e, t)
                }, [y]), C = (0, f.useCallback)(() => y.getStudioConfiguration(), [y]), [L, T] = (0, f.useState)(null), M = (0, f.useCallback)(async e => {
                    let t = await y.initHandshake(e);
                    return T(t), t
                }, [y]), k = (0, f.useCallback)(() => {
                    y.loadWebView()
                }, [y]), _ = (0, f.useMemo)(() => {
                    var e;
                    return !!(null == (e = window.rbx) ? void 0 : e.studio.isPrewarm)
                }, []), U = (0, f.useMemo)(() => {
                    var e, t;
                    let n;
                    return void 0 === (n = null == (t = window) || null == (e = t.navigator) ? void 0 : e.deviceMemory) || n >= 8
                }, []), W = (0, f.useMemo)(() => (function() {
                    var e, t;
                    let n = null == (t = window) || null == (e = t.navigator) ? void 0 : e.userAgent;
                    if (!n) return "";
                    let r = n.match(/RobloxApp\/([\d.]+)/);
                    return r && r.length > 1 ? r[1] : ""
                })(), []), F = (0, f.useCallback)((e, t) => y.setListener(e, t), [y]), A = (0, f.useCallback)((e, t) => {
                    y.removeListener(e, t)
                }, [y]), [N, B] = (0, h.useSessionStorage)("web_view_theme_override", null), [D, O] = (0, h.useSessionStorage)("web_view_locale_override", null), R = u.get("locale"), V = I(R);
                (0, f.useEffect)(() => {
                    let e = u.get("mockWebview"),
                        t = "true" === l.default.env.NEXT_PUBLIC_MOCK_WEB_VIEW || "true" === e;
                    if (a || (t ? g(!0) : "false" === e && g(!1)), m) {
                        let e = u.get("theme");
                        e && B(e.includes("light") ? p.LightFoundation : p.DarkFoundation), V ? O(V) : R && console.warn("Ignoring unsupported mocked Studio locale: ".concat(R))
                    }
                }, [a, u, g, R, V, O, B, m]);
                let j = (0, f.useMemo)(() => {
                        let e = x && 1 ? C().theme : w;
                        return null != N ? N : e
                    }, [C, x, N]),
                    P = (0, f.useMemo)(() => {
                        var e;
                        let t = x && 1 ? C().locale : d.Locale.English;
                        return m && null != (e = null != V ? V : I(D)) ? e : t
                    }, [C, m, x, V, D]),
                    q = (0, f.useMemo)(() => ({
                        call: E,
                        currentStudioLocale: P,
                        currentStudioTheme: j,
                        fire: S,
                        getStudioConfiguration: C,
                        initHandshake: M,
                        initHandshakeResponse: L,
                        isPrewarm: _,
                        isRecommendedSpecOrAbove: U,
                        isWebView: x,
                        isWebViewAvailable: x,
                        loadWebView: k,
                        removeListener: A,
                        setListener: F,
                        setStudioThemeOverride: B,
                        studioVersion: W
                    }), [E, P, S, C, M, L, _, U, x, k, A, F, B, j, W]);
                return f.default.createElement(t.Provider, {
                    value: q
                }, s)
            }
        })({
            bus: s,
            context: o,
            defaultToMockWebView: i,
            MockMessageBus: r,
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

//# debugId=35bac514-5ca5-7355-07df-bf392f40ef0e
//# sourceMappingURL=1egs974esj4a3.js.map