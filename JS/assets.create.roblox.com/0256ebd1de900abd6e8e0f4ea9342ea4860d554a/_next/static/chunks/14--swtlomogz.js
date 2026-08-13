;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "038aedd4-6cdd-90c7-6eca-a0cdbd55886f")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 138726, e => {
    "use strict";
    var t = e.i(221628),
        n = e.i(416340),
        r = e.i(237401),
        i = e.i(458451),
        o = e.i(969687),
        s = e.i(119636),
        a = e.i(706442),
        l = e.i(71375),
        u = e.i(829425);
    let c = (0, a.makeStyles)()(e => ({
        loading: {
            width: "50%",
            maxWidth: 250,
            margin: "250px auto"
        },
        background: {
            ...(0, o.getWebViewLoadingStyles)(),
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
            children: o
        } = e, {
            classes: {
                loading: a,
                content: d,
                background: f
            }
        } = c(), {
            status: g,
            login: v
        } = (0, i.useRobloxAuthentication)();
        return ((0, n.useEffect)(() => {
            "unauthenticated" === g && v(), "logged-out" === g && r.default.push(u.creatorHub.getUrl())
        }, [v, g]), "initial" === g || "loading" === g) ? (0, t.jsx)("div", {
            className: f,
            children: (0, t.jsx)("div", {
                className: d,
                children: (0, t.jsx)(s.LinearProgress, {
                    classes: {
                        root: a
                    },
                    title: "loading"
                })
            })
        }) : "error" === g ? (0, t.jsx)("div", {
            className: f,
            children: (0, t.jsx)("div", {
                className: d,
                children: (0, t.jsx)(l.default, {
                    onReload: () => {
                        r.default.reload()
                    }
                })
            })
        }) : (0, t.jsx)(t.Fragment, {
            children: o
        })
    }])
}, 776344, e => {
    "use strict";
    var t = e.i(221628),
        n = e.i(416340),
        r = e.i(706442),
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
                    flex: v,
                    ...h
                },
                cx: m
            } = o({
                gap: f
            });
            return (0, t.jsx)("div", {
                ref: n,
                id: r,
                className: m(v, h.gap, s, null == a ? void 0 : a.root, h["flexDirection".concat((0, i.snakeToPascalCase)(null != l ? l : ""))], h["flexWrap".concat((0, i.snakeToPascalCase)(null != u ? u : ""))], h["alignItems".concat((0, i.snakeToPascalCase)(null != d ? d : ""))], h["justifyContent".concat((0, i.snakeToPascalCase)(null != c ? c : ""))]),
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
        r = e.i(666554),
        i = e.i(318974),
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
    e.s(["AdsManagerUrl", 0, r, "getAccountSecurityUrl", 0, () => "".concat(n, "/my/account#!/security"), "getAccountSettingsUrl", 0, () => "".concat(n, "/my/account#!/info"), "getAdvertiseAssetUrl", 0, e => "".concat(r, "?targetId=").concat(e, "&targetType=Asset"), "getAdvertisePassUrl", 0, e => "".concat(r, "?targetId=").concat(e, "&targetType=GamePass"), "getAppealsPortalUrl", 0, () => "".concat(n, "/report-appeals#"), "getBadgeUrl", 0, e => "".concat(n, "/badges/").concat(e), "getBundleUrl", 0, e => "".concat(n, "/bundles/").concat(e), "getCatalogUrl", 0, e => "".concat(n, "/catalog/").concat(e), "getConfigureGroupRevenueSalesUrl", 0, e => "".concat(n, "/groups/configure?id=").concat(e, "#!/revenue/sales"), "getConfigureGroupRolesUrl", 0, e => "".concat(n, "/groups/configure?id=").concat(e, "#!/roles"), "getCreatorUrl", 0, (e, n) => e === t.default.Group ? i(n) : o(n), "getEventUrl", 0, e => "".concat(n, "/events/").concat(e), "getFriendsUrl", 0, e => "".concat(n, "/users/").concat(e, "/friends#!/friends"), "getGameDetailsUrl", 0, e => "".concat(n, "/games/").concat(e), "getGamePassUrl", 0, e => "".concat(n, "/game-pass/").concat(e), "getGroupUrl", 0, i, "getHomeUrl", 0, () => "".concat(n, "/home"), "getLegacyGroupTransactionsUrl", 0, e => "".concat(n, "/groups/configure?id=").concat(e, "#!/revenue/sales"), "getLegacyTransactionsUrl", 0, () => "".concat(n, "/transactions"), "getLookUrl", 0, e => "".concat(n, "/looks/").concat(e), "getSponsorAvatarItemsUrl", 0, () => "".concat(n, "/sponsorships/list#!/avatar-items"), "getSponsorExperienceCreateUrl", 0, e => "".concat(r, "/create?universeId=").concat(e), "getSponsorExperienceUrl", 0, e => "".concat(r, "?universeId=").concat(e), "getSupportFormUrl", 0, () => "".concat(n, "/support"), "getTermsUrl", 0, () => "".concat(n, "/info/terms"), "getTransactionsUrl", 0, () => "".concat(n, "/transactions"), "getUrl", 0, () => n, "getUserUrl", 0, o])
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
            var h = [],
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
                } : t || {}).entropy ? [e, v(r)] : null == e ? function() {
                    try {
                        var e;
                        return o && (e = o.randomBytes) ? e = e(256) : (e = new Uint8Array(256), (n.crypto || n.msCrypto).getRandomValues(e)), v(e)
                    } catch (e) {
                        var t = n.navigator,
                            i = t && t.plugins;
                        return [+new Date, n, i, n.screen, v(r)]
                    }
                }() : e, 3), h),
                p = new d(h),
                x = function() {
                    for (var e = p.g(6), t = a, n = 0; e < l;) e = (e + n) * 256, t *= 256, n = p.g(1);
                    for (; e >= u;) e /= 2, t /= 2, n >>>= 1;
                    return (e + n) / t
                };
            return x.int32 = function() {
                return 0 | p.g(4)
            }, x.quick = function() {
                return p.g(4) / 0x100000000
            }, x.double = x, g(v(p.S), r), (t.pass || c || function(e, t, n, r) {
                return (r && (r.S && f(r, p), e.state = function() {
                    return f(p, {})
                }), n) ? (i[s] = e, t) : e
            })(x, m, "global" in t ? t.global : this == i, t.state)
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
            return v(t)
        }

        function v(e) {
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
}, 969687, e => {
    "use strict";
    var t, n, r, i, o, s, a, l = e.i(2226),
        u = e.i(721281),
        c = e.i(252842),
        d = e.i(79187),
        f = e.i(416340),
        g = e.i(80768),
        v = e.i(533414),
        h = ((i = {}).TIMED_OUT = "TIMED_OUT", i.WEBVIEW_NOT_INITIALIZED = "WEBVIEW_NOT_INITIALIZED", i.WEBVIEW_NOT_FOUND = "WEBVIEW_NOT_FOUND", i.INVALID_MESSAGE = "INVALID_MESSAGE", i);
    class m extends Error {
        constructor(e, t, n) {
            let r = "MessageBusError, code: ".concat(e);
            t && (r += ", eventName: ".concat(t)), n && (r += ", type: ".concat(n)), super(r), (0, u._)(this, "code", void 0), (0, u._)(this, "eventName", void 0), (0, u._)(this, "eventType", void 0), this.code = e, this.eventName = t, this.eventType = n
        }
    }
    var p = ((o = p || {}).DarkFoundation = "darkFoundation", o.LightFoundation = "lightFoundation", o);
    let x = "darkFoundation";
    var w = ((s = {}).Fire = "fire", s.Response = "response", s.Request = "request", s);

    function b() {
        var e, t, n, r, i, o;
        let s = null == (t = window) || null == (e = t.navigator) ? void 0 : e.userAgent;
        return (null == (r = window) || null == (n = r.rbx) ? void 0 : n.studio.isPrewarm) !== !0 && (null == (o = window) || null == (i = o.rbx) ? void 0 : i.postMessage) !== void 0 && void 0 !== s && s.includes("RobloxStudio")
    }
    class y {
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
    let E = d.Locale.English;
    class S {
        getStudioConfiguration() {
            var e;
            if (!b() || !(null == (e = window.rbx) ? void 0 : e.messageBus)) throw new m(h.WEBVIEW_NOT_INITIALIZED);
            let t = window.rbx.studio;
            return Object.values(d.Locale).includes(t.locale) || (console.warn("Locale: ".concat(t.locale, " is not valid. Defaulting to ").concat(E, ".")), t.locale = E), Object.values(p).includes(t.theme) || (console.warn("Theme: ".concat(t.theme, " is not valid. Defaulting to ").concat(x, ".")), t.theme = x), t
        }
        getOrCreateEventListenersMap(e) {
            let t = e.events;
            if (t) return t;
            let n = new Map;
            return e.events = n, n
        }
        loadWebView() {
            var e, t, n, r;
            if (!b() || !(null == (e = window.rbx) ? void 0 : e.messageBus)) throw new m(h.WEBVIEW_NOT_INITIALIZED);
            if ((null == (t = window.rbx) ? void 0 : t.postMessageFrameUrl) && (null == (r = window.webkit) || null == (n = r.messageHandlers) ? void 0 : n.roblox)) {
                let e = new y(window.rbx.postMessageFrameUrl);
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
            if (!b() || !(null == (r = window.rbx) ? void 0 : r.postMessage)) throw new m(h.WEBVIEW_NOT_FOUND, e, t.type);
            let i = JSON.stringify(t),
                o = JSON.stringify(n);
            if (i.includes("|")) throw new m(h.INVALID_MESSAGE, e, t.type);
            let s = "1|".concat(e, "|").concat(i, "|").concat(o);
            window.rbx.postMessage("messageBusEvent", s)
        }
        setListenerInternal(e, t, n) {
            var r;
            let i = null == (r = window.rbx) ? void 0 : r.messageBus;
            if (!b() || !i) throw new m(h.WEBVIEW_NOT_FOUND, String(e));
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
            if (!b() || !r) throw new m(h.WEBVIEW_NOT_FOUND, String(e));
            let i = this.getFullEventName(e),
                o = (e, n) => {
                    var r;
                    let o = null != (r = t(e)) ? r : {};
                    n.type === w.Request && this.postMessage(i, {
                        type: w.Response,
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
            if (!b()) throw new m(h.WEBVIEW_NOT_FOUND, String(e), w.Request);
            let i = n => new Promise(r => {
                    let i = (t, i) => {
                        this.removeListenerInternal(e, n), r(t)
                    };
                    this.setListenerInternal(e, i, n), this.postMessage(this.getFullEventName(e), {
                        type: w.Request,
                        uuid: n
                    }, t)
                }),
                o = c.uuidService.generateRandomUuid();
            return r <= 0 ? i(o) : Promise.race([new Promise((t, i) => {
                n = setTimeout(() => {
                    this.removeListenerInternal(e, o), i(new m(h.TIMED_OUT, String(e), w.Request))
                }, r)
            }), i(o).then(e => (n && clearTimeout(n), e))])
        }
        fire(e, t) {
            if (!b()) throw new m(h.WEBVIEW_NOT_FOUND, String(e), w.Fire);
            let n = c.uuidService.generateRandomUuid();
            this.postMessage(this.getFullEventName(e), {
                type: w.Fire,
                uuid: n
            }, t)
        }
        constructor(e) {
            (0, u._)(this, "namespace", void 0), this.namespace = e.namespace
        }
    }
    var C = ((a = {}).changeTheme = "internal:changeTheme", a.changeVolume = "internal:changeVolume", a.init = "internal:init", a.deprecatedSendAnalyticsCounterEvent = "sendAnalyticsCounterEvent", a.deprecatedSendAnalyticsEvent = "sendAnalyticsEvent", a);

    function T(e, t) {
        let n = e.getElementsByTagName("video"),
            r = e.getElementsByTagName("audio");
        n.length > 0 && Array.from(n).forEach(e => {
            e.volume = t
        }), r.length > 0 && Array.from(r).forEach(e => {
            e.volume = t
        })
    }
    let L = [];

    function I() {
        var e, t;
        null == (t = window.rbx) || null == (e = t.postMessage) || e.call(t, "loadprogress", "afterInteractive")
    }(null == (t = window.rbx) ? void 0 : t.postMessage) && (null == (r = window.rbx) || null == (n = r.postMessage) || n.call(r, "loadprogress", "beforeInteractive"), "loading" === document.readyState ? document.addEventListener("DOMContentLoaded", I, {
        once: !0
    }) : I()), e.s(["BaseMessageBus", 0, S, "StudioTheme", 0, p, "StudioWebViewMessageBusConnector", 0, function(e) {
        var t, n;
        let {
            children: r,
            useContextHook: i,
            capabilities: o = L
        } = e, {
            isWebView: s,
            getStudioConfiguration: a,
            setStudioThemeOverride: l,
            initHandshake: u,
            removeListener: c,
            setListener: d,
            loadWebView: v,
            studioVersion: h
        } = i(), m = (0, f.useRef)(s && null != (t = a().volume) ? t : 1), p = (0, f.useRef)(s ? (n = () => m.current, new MutationObserver(e => {
            e.forEach(e => {
                "childList" === e.type && e.addedNodes.forEach(e => {
                    e instanceof Element && (("AUDIO" === e.tagName || "VIDEO" === e.tagName) && (e.volume = n()), e.children.length > 0 && T(e, n()))
                })
            })
        })) : null), x = (0, f.useCallback)(e => {
            let {
                theme: t
            } = e;
            l(t)
        }, [l]), w = (0, f.useCallback)(e => {
            let {
                volume: t
            } = e;
            m.current = t, T(document.body, t)
        }, []);
        return (0, f.useEffect)(() => {
            var e;
            g.setTag("isWebView", s), s && (T(document.body, m.current), null == (e = p.current) || e.observe(document.body, {
                childList: !0,
                subtree: !0
            }), window.addEventListener("dragover", e => e.preventDefault(), !0), window.addEventListener("drop", e => e.preventDefault(), !0))
        }, [s]), (0, f.useEffect)(() => {
            s && h && g.setTag("studioVersion", h)
        }, [s, h]), (0, f.useEffect)(() => {
            if (s) {
                var e;
                void 0 === (null == (e = window.rbx) ? void 0 : e.messageBus.dispatchEvent) && v();
                let t = d(C.changeTheme, x),
                    n = d(C.changeVolume, w);
                return () => {
                    c(C.changeTheme, t), c(C.changeVolume, n)
                }
            }
            return () => {}
        }, [x, w, s, v, c, d]), (0, f.useEffect)(() => {
            (async () => {
                s && await u({
                    capabilities: o
                })
            })()
        }, [s, u, o]), f.default.createElement(f.default.Fragment, null, r)
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
            MockMessageBus: r
        } = e, i = (0, f.createContext)(null), o = new S({
            namespace: t
        }), s = (e => {
            let {
                context: t,
                bus: n,
                useSearchParams: r,
                MockMessageBus: i
            } = e;
            return function(e) {
                let {
                    children: o
                } = e, [s, a] = (0, f.useState)(b()), u = r(), [c, d] = (0, v.useSessionStorage)("mock_web_view", null), g = (0, f.useRef)(null), h = (0, f.useMemo)(() => c ? (g.current || (g.current = new i), g.current) : n, [c]), m = (0, f.useCallback)((e, t, n) => h.call(e, t, n), [h]), w = (0, f.useCallback)((e, t) => {
                    h.fire(e, t)
                }, [h]), y = (0, f.useCallback)(() => h.getStudioConfiguration(), [h]), [E, S] = (0, f.useState)(null), C = (0, f.useCallback)(async e => {
                    let t = await h.initHandshake(e);
                    return S(t), t
                }, [h]), T = (0, f.useCallback)(() => {
                    h.loadWebView()
                }, [h]), L = (0, f.useMemo)(() => {
                    var e;
                    return !!(null == (e = window.rbx) ? void 0 : e.studio.isPrewarm)
                }, []), I = (0, f.useMemo)(() => {
                    var e, t;
                    let n;
                    return void 0 === (n = null == (t = window) || null == (e = t.navigator) ? void 0 : e.deviceMemory) || n >= 8
                }, []), M = (0, f.useMemo)(() => (function() {
                    var e, t;
                    let n = null == (t = window) || null == (e = t.navigator) ? void 0 : e.userAgent;
                    if (!n) return "";
                    let r = n.match(/RobloxApp\/([\d.]+)/);
                    return r && r.length > 1 ? r[1] : ""
                })(), []), U = (0, f.useCallback)((e, t) => h.setListener(e, t), [h]), k = (0, f.useCallback)((e, t) => {
                    h.removeListener(e, t)
                }, [h]), [F, N] = (0, v.useSessionStorage)("web_view_theme_override", null);
                (0, f.useEffect)(() => {
                    let e = u.get("mockWebview");
                    if ("true" === l.default.env.NEXT_PUBLIC_MOCK_WEB_VIEW || "true" === e) {
                        d(!0), a(!0);
                        let e = u.get("theme");
                        e && N(e.includes("light") ? p.LightFoundation : p.DarkFoundation)
                    } else "false" === e ? (d(!1), a(b())) : null === c ? a(b()) : a(c)
                }, [c, u, d, a, N]);
                let _ = (0, f.useMemo)(() => {
                        let e = s && 1 ? y().theme : x;
                        return null != F ? F : e
                    }, [y, s, F]),
                    W = (0, f.useMemo)(() => ({
                        call: m,
                        currentStudioTheme: _,
                        fire: w,
                        getStudioConfiguration: y,
                        initHandshake: C,
                        initHandshakeResponse: E,
                        isPrewarm: L,
                        isRecommendedSpecOrAbove: I,
                        isWebView: s,
                        isWebViewAvailable: s,
                        loadWebView: T,
                        removeListener: k,
                        setListener: U,
                        setStudioThemeOverride: N,
                        studioVersion: M
                    }), [m, w, y, C, E, L, I, s, T, k, U, N, _, M]);
                return f.default.createElement(t.Provider, {
                    value: W
                }, o)
            }
        })({
            bus: o,
            context: i,
            MockMessageBus: r,
            useSearchParams: n
        });
        return {
            bus: o,
            context: i,
            provider: s,
            useContextHook: () => {
                let e = (0, f.useContext)(i);
                if (!e) throw Error("StudioWebViewMessageBusProviderContext not found");
                return e
            }
        }
    }])
}]);

//# debugId=038aedd4-6cdd-90c7-6eca-a0cdbd55886f
//# sourceMappingURL=3sa9soi0goww2.js.map