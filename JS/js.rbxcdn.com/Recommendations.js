! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "8187897d96712e42cdcdae699024286581f76629"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "b9988eac-6966-4838-afff-bc470e7d2277", e._sentryDebugIdIdentifier = "sentry-dbid-b9988eac-6966-4838-afff-bc470e7d2277")
    } catch (e) {}
}(),
function() {
    var e = {
            611: function(e) {
                function t(e) {
                    return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
                }!
                /*!
                	Copyright (c) 2018 Jed Watson.
                	Licensed under the MIT License (MIT), see
                	http://jedwatson.github.io/classnames
                */
                function() {
                    "use strict";
                    var r = {}.hasOwnProperty;

                    function n() {
                        for (var e = "", i = 0; i < arguments.length; i++) {
                            var o = arguments[i];
                            o && (e = a(e, function(e) {
                                if ("string" == typeof e || "number" == typeof e) return e;
                                if ((void 0 === e ? "undefined" : t(e)) !== "object") return "";
                                if (Array.isArray(e)) return n.apply(null, e);
                                if (e.toString !== Object.prototype.toString && !e.toString.toString().includes("[native code]")) return e.toString();
                                var i = "";
                                for (var o in e) r.call(e, o) && e[o] && (i = a(i, o));
                                return i
                            }(o)))
                        }
                        return e
                    }

                    function a(e, t) {
                        return t ? e ? e + " " + t : e + t : e
                    }
                    e.exports ? (n.default = n, e.exports = n) : "function" == typeof define && "object" === t(define.amd) && define.amd ? define("classnames", [], function() {
                        return n
                    }) : window.classNames = n
                }()
            },
            773: function(e, t) {
                "use strict";
                Object.defineProperty(t, "__esModule", {
                    value: !0
                });
                var r, n, a, i = {
                        exports: {}
                    },
                    o = i.exports = {};

                function c() {
                    throw Error("setTimeout has not been defined")
                }

                function l() {
                    throw Error("clearTimeout has not been defined")
                }
                try {
                    r = "function" == typeof setTimeout ? setTimeout : c
                } catch (e) {
                    r = c
                }
                try {
                    n = "function" == typeof clearTimeout ? clearTimeout : l
                } catch (e) {
                    n = l
                }

                function s(e) {
                    if (r === setTimeout) return setTimeout(e, 0);
                    if ((r === c || !r) && setTimeout) return r = setTimeout, setTimeout(e, 0);
                    try {
                        return r(e, 0)
                    } catch (t) {
                        try {
                            return r.call(null, e, 0)
                        } catch (t) {
                            return r.call(this, e, 0)
                        }
                    }
                }
                var u = [],
                    d = !1,
                    m = -1;

                function p() {
                    d && a && (d = !1, a.length ? u = a.concat(u) : m = -1, u.length && f())
                }

                function f() {
                    if (!d) {
                        var e = s(p);
                        d = !0;
                        for (var t = u.length; t;) {
                            for (a = u, u = []; ++m < t;) a && a[m].run();
                            m = -1, t = u.length
                        }
                        a = null, d = !1,
                            function(e) {
                                if (n === clearTimeout) return clearTimeout(e);
                                if ((n === l || !n) && clearTimeout) return n = clearTimeout, clearTimeout(e);
                                try {
                                    n(e)
                                } catch (t) {
                                    try {
                                        return n.call(null, e)
                                    } catch (t) {
                                        return n.call(this, e)
                                    }
                                }
                            }(e)
                    }
                }

                function y(e, t) {
                    this.fun = e, this.array = t
                }

                function b() {}

                function v() {}
                o.nextTick = function(e) {
                    var t = Array(arguments.length - 1);
                    if (arguments.length > 1)
                        for (var r = 1; r < arguments.length; r++) t[r - 1] = arguments[r];
                    u.push(new y(e, t)), 1 !== u.length || d || s(f)
                }, y.prototype.run = function() {
                    this.fun.apply(null, this.array)
                }, o.title = "browser", o.browser = !0, o.env = {}, o.argv = [], o.version = "", o.versions = {}, o.on = b, o.addListener = b, o.once = b, o.off = b, o.removeListener = b, o.removeAllListeners = b, o.emit = b, o.prependListener = b, o.prependOnceListener = b, o.listeners = function(e) {
                    return []
                }, o.binding = function(e) {
                    throw Error("process.binding is not supported")
                }, o.cwd = function() {
                    return "/"
                }, o.chdir = function(e) {
                    throw Error("process.chdir is not supported")
                }, o.umask = function() {
                    return 0
                };
                var g = i.exports.browser,
                    h = i.exports.binding,
                    w = {},
                    x = "browser",
                    C = "browser",
                    S = "browser",
                    T = [],
                    I = {
                        nextTick: i.exports.nextTick,
                        title: i.exports.title,
                        browser: g,
                        env: i.exports.env,
                        argv: i.exports.argv,
                        version: i.exports.version,
                        versions: i.exports.versions,
                        on: i.exports.on,
                        addListener: i.exports.addListener,
                        once: i.exports.once,
                        off: i.exports.off,
                        removeListener: i.exports.removeListener,
                        removeAllListeners: i.exports.removeAllListeners,
                        emit: i.exports.emit,
                        emitWarning: v,
                        prependListener: i.exports.prependListener,
                        prependOnceListener: i.exports.prependOnceListener,
                        listeners: i.exports.listeners,
                        binding: h,
                        cwd: i.exports.cwd,
                        chdir: i.exports.chdir,
                        umask: i.exports.umask,
                        exit: v,
                        pid: 1,
                        features: w,
                        kill: v,
                        dlopen: v,
                        uptime: v,
                        memoryUsage: v,
                        uvCounters: v,
                        platform: x,
                        arch: C,
                        execPath: S,
                        execArgv: T
                    };
                t.addListener = i.exports.addListener, t.arch = C, t.argv = i.exports.argv, t.binding = h, t.browser = g, t.chdir = i.exports.chdir, t.cwd = i.exports.cwd, t.default = I, t.dlopen = v, t.emit = i.exports.emit, t.emitWarning = v, t.env = i.exports.env, t.execArgv = T, t.execPath = S, t.exit = v, t.features = w, t.kill = v, t.listeners = i.exports.listeners, t.memoryUsage = v, t.nextTick = i.exports.nextTick, t.off = i.exports.off, t.on = i.exports.on, t.once = i.exports.once, t.pid = 1, t.platform = x, t.prependListener = i.exports.prependListener, t.prependOnceListener = i.exports.prependOnceListener, t.removeAllListeners = i.exports.removeAllListeners, t.removeListener = i.exports.removeListener, t.title = i.exports.title, t.umask = i.exports.umask, t.uptime = v, t.uvCounters = v, t.version = i.exports.version, t.versions = i.exports.versions, e.exports = I
            }
        },
        t = {};

    function r(n) {
        var a = t[n];
        if (void 0 !== a) return a.exports;
        var i = t[n] = {
            exports: {}
        };
        return e[n](i, i.exports, r), i.exports
    }
    r.m = e, r.n = function(e) {
            var t = e && e.__esModule ? function() {
                return e.default
            } : function() {
                return e
            };
            return r.d(t, {
                a: t
            }), t
        }, r.d = function(e, t) {
            for (var n in t) r.o(t, n) && !r.o(e, n) && Object.defineProperty(e, n, {
                enumerable: !0,
                get: t[n]
            })
        }, r.o = function(e, t) {
            return Object.prototype.hasOwnProperty.call(e, t)
        }, r.r = function(e) {
            "u" > typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
                value: "Module"
            }), Object.defineProperty(e, "__esModule", {
                value: !0
            })
        }, r.rv = function() {
            return "1.7.12"
        }, r.ruid = "bundler=rspack@1.7.12",
        function() {
            "use strict";
            var e, t, n, a = window.ReactJSX,
                i = window.React,
                o = r.n(i),
                c = window.Roblox["core-scripts"].util.ready,
                l = r.n(c),
                s = window.Roblox["core-scripts"].react,
                u = window.Roblox["core-scripts"].endpoints,
                d = window.RobloxBadges,
                m = window.Roblox["core-scripts"].environmentUrls,
                p = r.n(m),
                f = window.Roblox["core-scripts"].format.string,
                y = window.RobloxThumbnails,
                b = window.ReactStyleGuide,
                v = window.Roblox["core-scripts"].http.http,
                g = window.Roblox["core-lib"].http.index,
                h = window.Roblox["core-lib"].url.index;

            function w(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function x(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var i = [],
                            o = !0,
                            c = !1;
                        try {
                            for (a = a.call(e); !(o = (r = a.next()).done) && (i.push(r.value), !t || i.length !== t); o = !0);
                        } catch (e) {
                            c = !0, n = e
                        } finally {
                            try {
                                o || null == a.return || a.return()
                            } finally {
                                if (c) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return w(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return w(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var C = "true" === r(773).env.NEXT_PUBLIC_IS_NEXTJS ? {
                    get: function(e, t) {
                        var r = h.Url.parse(e.url).getOrThrow();
                        return t && (r = r.withSearchParams(Object.entries(t).filter(function(e) {
                            return null != x(e, 2)[1]
                        }).map(function(e) {
                            var t = x(e, 2);
                            return [t[0], String(t[1])]
                        }))), g.getUntyped(r, {
                            credentials: "include"
                        }).getOrThrow()
                    }
                } : {
                    get: function(e, t) {
                        return v.get(e, t).then(function(e) {
                            return e.data
                        })
                    }
                },
                S = 2,
                T = 21,
                I = 34,
                k = 9,
                P = "catalog",
                O = "bundles",
                j = ["CatalogItem"],
                A = {
                    0: {
                        64: "/catalog?Category=3&Subcategory=58",
                        65: "/catalog?Category=3&Subcategory=59",
                        68: "/catalog?Category=3&Subcategory=62",
                        67: "/catalog?Category=3&Subcategory=61",
                        66: "/catalog?Category=3&Subcategory=60",
                        69: "/catalog?Category=3&Subcategory=63",
                        72: "/catalog?Category=3&Subcategory=65",
                        70: "/catalog?Category=3&Subcategory=64",
                        71: "/catalog?Category=3&Subcategory=64",
                        11: "/catalog?Category=3&Subcategory=56",
                        12: "/catalog?Category=3&Subcategory=57",
                        2: "/catalog?Category=3&Subcategory=55",
                        8: "/catalog?Category=11&Subcategory=54",
                        42: "/catalog?Category=11&Subcategory=21",
                        43: "/catalog?Category=11&Subcategory=22",
                        44: "/catalog?Category=11&Subcategory=23",
                        45: "/catalog?Category=11&Subcategory=24",
                        46: "/catalog?Category=11&Subcategory=25",
                        47: "/catalog?Category=11&Subcategory=26",
                        19: "/catalog?Category=11&Subcategory=5",
                        41: "/catalog?Category=4&Subcategory=20",
                        17: "/catalog?Category=4&Subcategory=15",
                        18: "/catalog?Category=4&Subcategory=10",
                        61: "/catalog?Category=12&Subcategory=39",
                        55: "/catalog?Category=12&Subcategory=38",
                        53: "/catalog?Category=12&Subcategory=38",
                        50: "/catalog?Category=12&Subcategory=38",
                        52: "/catalog?Category=12&Subcategory=38",
                        54: "/catalog?Category=12&Subcategory=38",
                        48: "/catalog?Category=12&Subcategory=38",
                        51: "/catalog?Category=12&Subcategory=38"
                    },
                    2: {
                        1: "/catalog?Category=17",
                        4: "/catalog?Category=4&Subcategory=66"
                    }
                };

            function E(e, t, r, n, a, i, o) {
                try {
                    var c = e[i](o),
                        l = c.value
                } catch (e) {
                    r(e);
                    return
                }
                c.done ? t(l) : Promise.resolve(l).then(n, a)
            }

            function R(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, a) {
                        var i = e.apply(t, r);

                        function o(e) {
                            E(i, n, a, o, c, "next", e)
                        }

                        function c(e) {
                            E(i, n, a, o, c, "throw", e)
                        }
                        o(void 0)
                    })
                }
            }

            function N(e, t) {
                var r, n, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    c = Object.defineProperty;
                return c(o, "next", {
                    value: l(0)
                }), c(o, "throw", {
                    value: l(1)
                }), c(o, "return", {
                    value: l(2)
                }), "function" == typeof Symbol && c(o, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), o;

                function l(c) {
                    return function(l) {
                        var s = [c, l];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; o && (o = 0, s[0] && (i = 0)), i;) try {
                            if (r = 1, n && (a = 2 & s[0] ? n.return : s[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, s[1])).done) return a;
                            switch (n = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                case 0:
                                case 1:
                                    a = s;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, n = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                        i.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && i.label < a[1]) {
                                        i.label = a[1], a = s;
                                        break
                                    }
                                    if (a && i.label < a[2]) {
                                        i.label = a[2], i.ops.push(s);
                                        break
                                    }
                                    a[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            s = t.call(e, i)
                        } catch (e) {
                            s = [6, e], n = 0
                        } finally {
                            r = a = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var L = function() {
                    var e;

                    function t() {
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function")
                    }
                    return e = [{
                            key: "getSeoUrl",
                            value: function(e, t, r) {
                                return (0, u.getAbsoluteUrl)("/".concat(e, "/").concat(t, "/").concat((0, f.formatSeoName)(r) || "unnamed"))
                            }
                        }, {
                            key: "getBundleUrl",
                            value: function(e, r) {
                                return t.getSeoUrl(O, e, r)
                            }
                        }, {
                            key: "getAssetUrl",
                            value: function(e, r) {
                                return t.getSeoUrl(P, e, r)
                            }
                        }, {
                            key: "getAudioUrl",
                            value: function(e, t) {
                                return 3 === t ? (0, u.getAbsoluteUrl)("/library/".concat(e)) : null
                            }
                        }, {
                            key: "getProfileLink",
                            value: function(e) {
                                return (0, u.getAbsoluteUrl)("/users/".concat(e, "/profile"))
                            }
                        }, {
                            key: "getCreatorProfileLink",
                            value: function(e, t, r) {
                                return "Group" === t ? (0, u.getAbsoluteUrl)("/groups/".concat(e, "/").concat((0, f.formatSeoName)(r))) : (0, u.getAbsoluteUrl)("/users/".concat(e, "/profile"))
                            }
                        }, {
                            key: "isRecommendationAllowed",
                            value: function(e, t) {
                                return e === S || t > 0 && t !== T && t !== I
                            }
                        }, {
                            key: "translateBundleResultFromItemDetails",
                            value: function(e) {
                                var r, n = {
                                    name: e.creatorName,
                                    creatorType: e.creatorType,
                                    creatorId: e.creatorTargetId
                                };
                                return {
                                    id: e.id,
                                    name: e.name,
                                    price: e.price,
                                    lowestPrice: e.lowestPrice,
                                    absoluteUrl: t.getBundleUrl(e.id, e.name),
                                    audioUrl: null,
                                    urlType: O,
                                    creator: {
                                        id: e.creatorTargetId,
                                        name: e.creatorName,
                                        nameForDisplay: t.getNameForDisplay(n),
                                        type: e.creatorType,
                                        profileLink: t.getCreatorProfileLink(e.creatorTargetId, e.creatorType, e.creatorName)
                                    },
                                    thumbnail: {
                                        type: y.ThumbnailTypes.bundleThumbnail
                                    },
                                    product: {
                                        id: null,
                                        isForSale: !(null == (r = e.itemStatus) ? void 0 : r.includes("Offsale")),
                                        isFree: 0 === e.price,
                                        noPriceText: e.priceStatus || ""
                                    },
                                    creatorHasVerifiedBadge: e.creatorHasVerifiedBadge,
                                    itemType: "Bundle",
                                    itemRestrictions: e.itemRestrictions,
                                    itemRestrictionIcon: b.ItemCardUtils.mapItemRestrictionIcons(e.itemRestrictions, "Bundle").itemRestrictionIcon,
                                    priceStatus: e.priceStatus,
                                    unitsAvailableForConsumption: e.unitsAvailableForConsumption
                                }
                            }
                        }, {
                            key: "beginUpdateRecommendedItems",
                            value: function(e, r, n, a, i) {
                                return R(function() {
                                    var o, c, l, s, u;
                                    return N(this, function(d) {
                                        switch (d.label) {
                                            case 0:
                                                return o = 2 === r ? t.buildUrlParamsV2(null, null, e, a, -1 !== n ? n : null) : t.buildUrlParamsV2(n, e, null, a, null), c = t.buildUrlV2(i), [4, C.get(c, o)];
                                            case 1:
                                                if (s = null == (l = d.sent()) ? void 0 : l.data) return [2, ((null == (u = s[0]) ? void 0 : u.itemType) === "Bundle" ? 2 : 1) == 2 ? s.map(function(e) {
                                                    return t.translateBundleResultFromItemDetails(e)
                                                }) : s.map(function(e) {
                                                    return t.translateAssetResultFromItemDetails(e)
                                                })];
                                                return [2, []]
                                        }
                                    })
                                })()
                            }
                        }, {
                            key: "getCatalogMetadata",
                            value: function() {
                                return R(function() {
                                    return N(this, function(e) {
                                        return [2, C.get({
                                            url: "".concat(p().catalogApi.replace(/\/$/, ""), "/v1/catalog/metadata")
                                        }, {
                                            params: {
                                                retryable: !0,
                                                withCredentials: !0
                                            }
                                        })]
                                    })
                                })()
                            }
                        }, {
                            key: "getRecommendationMetadata",
                            value: function(e) {
                                var t = {
                                    url: "".concat(p().catalogApi.replace(/\/$/, ""), "/v1/recommendations/metadata")
                                };
                                return C.get(t, {
                                    page: e
                                }).then(function(e) {
                                    var t = function(e) {
                                        for (var t = 1; t < arguments.length; t++) {
                                            var r = null != arguments[t] ? arguments[t] : {},
                                                n = Object.keys(r);
                                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                                return Object.getOwnPropertyDescriptor(r, e).enumerable
                                            }))), n.forEach(function(t) {
                                                var n;
                                                n = r[t], t in e ? Object.defineProperty(e, t, {
                                                    value: n,
                                                    enumerable: !0,
                                                    configurable: !0,
                                                    writable: !0
                                                }) : e[t] = n
                                            })
                                        }
                                        return e
                                    }({}, e);
                                    if (t) {
                                        var r = t.numOfRecommendationsDisplayed;
                                        t.numberOfItems = r
                                    }
                                    return t
                                })
                            }
                        }, {
                            key: "translateAssetResultFromItemDetails",
                            value: function(e) {
                                var r, n = e.creatorName,
                                    a = e.assetType,
                                    i = {
                                        name: e.creatorName,
                                        creatorType: e.creatorType,
                                        creatorId: e.creatorTargetId
                                    },
                                    o = a === k ? y.ThumbnailTypes.placeGameIcon : y.ThumbnailTypes.assetThumbnail;
                                return {
                                    id: e.id,
                                    name: e.name,
                                    price: e.price,
                                    lowestPrice: e.lowestPrice,
                                    absoluteUrl: t.getAssetUrl(e.id, e.name),
                                    audioUrl: t.getAudioUrl(e.id, e.assetType),
                                    hasResellers: !!e.hasResellers,
                                    saleLocationType: e.saleLocationType,
                                    urlType: P,
                                    creator: {
                                        id: e.creatorTargetId,
                                        name: n,
                                        nameForDisplay: t.getNameForDisplay(i),
                                        type: e.creatorType,
                                        profileLink: t.getCreatorProfileLink(e.creatorTargetId, e.creatorType, e.creatorName)
                                    },
                                    thumbnail: {
                                        type: o
                                    },
                                    product: {
                                        id: null,
                                        isForSale: !(null == (r = e.itemStatus) ? void 0 : r.includes("Offsale")),
                                        isFree: 0 === e.price,
                                        noPriceText: e.priceStatus || ""
                                    },
                                    creatorHasVerifiedBadge: e.creatorHasVerifiedBadge,
                                    itemType: "Asset",
                                    itemRestrictions: e.itemRestrictions,
                                    itemRestrictionIcon: b.ItemCardUtils.mapItemRestrictionIcons(e.itemRestrictions, "Asset").itemRestrictionIcon,
                                    priceStatus: e.priceStatus,
                                    unitsAvailableForConsumption: e.unitsAvailableForConsumption,
                                    itemStatus: e.itemStatus
                                }
                            }
                        }, {
                            key: "buildUrlV2",
                            value: function(e) {
                                return {
                                    url: "".concat(p().catalogApi.replace(/\/$/, ""), "/v2/recommendations/").concat(e),
                                    withCredentials: !0
                                }
                            }
                        }, {
                            key: "buildUrlParamsV2",
                            value: function(e, t, r, n, a) {
                                return {
                                    assetTypeId: e,
                                    assetId: t,
                                    bundleId: r,
                                    numItems: n,
                                    bundleTypeId: a,
                                    details: !0
                                }
                            }
                        }, {
                            key: "escapeHtml",
                            value: function(e) {
                                var t = document.createElement("div");
                                return e && (t.innerText = e, t.textContent = e), t.innerHTML || ""
                            }
                        }, {
                            key: "getNameForDisplay",
                            value: function(e) {
                                return t.escapeHtml(e.name)
                            }
                        }],
                        function(e, t) {
                            for (var r = 0; r < t.length; r++) {
                                var n = t[r];
                                n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                            }
                        }(t, e), t
                }(),
                D = window.Roblox.ExperimentationService,
                B = r.n(D);

            function U(e, t, r, n, a, i, o) {
                try {
                    var c = e[i](o),
                        l = c.value
                } catch (e) {
                    r(e);
                    return
                }
                c.done ? t(l) : Promise.resolve(l).then(n, a)
            }
            var F = function(e, t, r) {
                    var n;
                    return (n = function() {
                        var e;
                        return function(e, t) {
                            var r, n, a, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & a[0]) throw a[1];
                                        return a[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                c = Object.defineProperty;
                            return c(o, "next", {
                                value: l(0)
                            }), c(o, "throw", {
                                value: l(1)
                            }), c(o, "return", {
                                value: l(2)
                            }), "function" == typeof Symbol && c(o, Symbol.iterator, {
                                value: function() {
                                    return this
                                }
                            }), o;

                            function l(c) {
                                return function(l) {
                                    var s = [c, l];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; o && (o = 0, s[0] && (i = 0)), i;) try {
                                        if (r = 1, n && (a = 2 & s[0] ? n.return : s[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, s[1])).done) return a;
                                        switch (n = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                            case 0:
                                            case 1:
                                                a = s;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: s[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, n = s[1], s = [0];
                                                continue;
                                            case 7:
                                                s = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                                    i.label = s[1];
                                                    break
                                                }
                                                if (6 === s[0] && i.label < a[1]) {
                                                    i.label = a[1], a = s;
                                                    break
                                                }
                                                if (a && i.label < a[2]) {
                                                    i.label = a[2], i.ops.push(s);
                                                    break
                                                }
                                                a[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        s = t.call(e, i)
                                    } catch (e) {
                                        s = [6, e], n = 0
                                    } finally {
                                        r = a = 0
                                    }
                                    if (5 & s[0]) throw s[1];
                                    return {
                                        value: s[0] ? s[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(r) {
                            return (e = B().getAllValuesForLayer(t)).then(function() {
                                B().logLayerExposure(t)
                            }), [2, e]
                        })
                    }, function() {
                        var e = this,
                            t = arguments;
                        return new Promise(function(r, a) {
                            var i = n.apply(e, t);

                            function o(e) {
                                U(i, r, a, o, c, "next", e)
                            }

                            function c(e) {
                                U(i, r, a, o, c, "throw", e)
                            }
                            o(void 0)
                        })
                    })()
                },
                M = (p().apiGatewayUrl.replace(/\/$/, ""), ["recommendationNumRows", "recommendationPageName"]),
                V = ["complimentaryItemRecommendationsEnabled", "displayPurchaseButtonLeft"],
                _ = ["recommendationNumRows"],
                W = "AvatarMarketplace.UI",
                H = "AvatarMarketplace.RecommendationsAndSearch.Web",
                G = "AvatarMarketplace.RelevanceRecommendations",
                $ = r(611),
                X = r.n($),
                q = window.Roblox["core-scripts"].format.number,
                J = function(e) {
                    return "premiumPrice" in e ? e.premiumPrice : void 0
                },
                z = function(e) {
                    return null != J(e)
                },
                Y = function(e) {
                    var t = e.item,
                        r = e.translate,
                        n = e.isPremiumIconOnItemTilesEnabled,
                        i = e.isPremiumPriceOnItemTilesEnabled,
                        o = void 0 !== i && i && z(t) ? J(t) : t.lowestPrice ? t.lowestPrice : t.price,
                        c = ("saleLocationType" in t ? t.saleLocationType : void 0) !== "ExperiencesDevApiOnly" || "hasResellers" in t && t.hasResellers,
                        l = c && !!(o || t.lowestPrice),
                        s = c && !!o && !t.lowestPrice,
                        u = c && !!t.lowestPrice,
                        d = void 0 !== n && n && z(t);
                    return (0, a.jsxs)("div", {
                        className: "item-card-container recommended-item-link",
                        children: [(0, a.jsxs)("a", {
                            href: t.absoluteUrl,
                            className: "item-card-link",
                            children: [(0, a.jsxs)("div", {
                                className: "item-card-thumb-container",
                                children: [(0, a.jsx)(y.Thumbnail2d, {
                                    containerClass: "item-card-thumb",
                                    type: t.thumbnail.type,
                                    targetId: t.id
                                }), (0, a.jsx)("span", {
                                    className: X()("restriction-icon", t.itemRestrictionIcon),
                                    style: t.itemRestrictionIcon ? void 0 : {
                                        display: "none"
                                    }
                                })]
                            }), (0, a.jsxs)("div", {
                                className: "item-card-name recommended-name",
                                title: t.name,
                                children: [d && (0, a.jsx)("span", {
                                    className: "icon-premium-small"
                                }), (0, a.jsx)("span", {
                                    children: t.name
                                })]
                            })]
                        }), t.audioUrl && (0, a.jsx)("div", {
                            className: "MediaPlayerControls",
                            children: (0, a.jsx)("div", {
                                className: "MediaPlayerIcon icon-play",
                                "data-mediathumb-url": t.audioUrl
                            })
                        }), (0, a.jsxs)("div", {
                            className: "recommended-creator-container",
                            children: [t.creator && (0, a.jsx)("div", {
                                className: "text-overflow item-card-creator recommended-creator",
                                children: (0, a.jsx)("span", {
                                    className: "text-overflow",
                                    dangerouslySetInnerHTML: {
                                        __html: r("Label.ByCreatorLink", {
                                            linkStart: "<a target=_self class='creator-name text-link' href='".concat(t.creator.profileLink, "'>"),
                                            linkEnd: "</a>",
                                            creator: t.creator.nameForDisplay
                                        })
                                    }
                                })
                            }), t.creatorHasVerifiedBadge && (0, a.jsx)("span", {
                                className: "verified-badge-icon-item-recommendations",
                                "data-size": "Title",
                                "data-overrideimgclass": "verified-badge-icon-item-recommendations-rendered"
                            })]
                        }), (0, a.jsxs)("div", {
                            className: "text-overflow item-card-price",
                            children: [(0, a.jsx)("span", {
                                className: "icon-robux-16x16",
                                style: l ? void 0 : {
                                    display: "none"
                                }
                            }), (0, a.jsx)("span", {
                                className: "text-robux-tile",
                                style: s ? void 0 : {
                                    display: "none"
                                },
                                children: o ? (0, q.abbreviateNumber)(o) : ""
                            }), (0, a.jsx)("span", {
                                className: "text-robux-tile",
                                style: u ? void 0 : {
                                    display: "none"
                                },
                                children: t.lowestPrice ? (0, q.abbreviateNumber)(t.lowestPrice) : ""
                            }), (0, a.jsx)("h4", {
                                className: "text text-label",
                                style: l ? {
                                    display: "none"
                                } : void 0,
                                children: t.product.noPriceText.length > 0 && (0, a.jsx)("span", {
                                    className: X()("text-overflow", "font-caption-body", {
                                        "text-robux-tile": t.product.isFree
                                    }),
                                    children: t.product.noPriceText
                                })
                            })]
                        })]
                    })
                },
                K = function(e) {
                    var t = e.items,
                        r = e.showSeeAllButton,
                        n = e.seeAllHref,
                        i = e.singleRow,
                        o = e.moreByCreatorEnabled,
                        c = e.complimentary,
                        l = e.displayCount,
                        u = e.listRef,
                        d = e.numberOfItems,
                        m = e.isPremiumIconOnItemTilesEnabled,
                        p = e.isPremiumPriceOnItemTilesEnabled,
                        f = (0, s.useTranslation)().translate;
                    return (0, a.jsxs)("div", {
                        children: [(0, a.jsx)("div", {
                            id: "complimentary-items-recommendations-container",
                            "data-target-id": c.targetId,
                            "data-is-bundle": c.isBundle
                        }), c.enabled && (0, a.jsx)("div", {
                            className: "complimentary-items-divider"
                        }), (0, a.jsx)("div", {
                            className: "current-items",
                            style: t.length > 0 ? void 0 : {
                                display: "none"
                            },
                            children: (0, a.jsxs)("div", {
                                className: "container-list layer recommendations-container",
                                children: [(0, a.jsxs)("div", {
                                    className: "container-header recommendations-header",
                                    children: [(0, a.jsx)("h2", {
                                        children: (0, a.jsx)("span", {
                                            children: f("Heading.RecommendedTitle")
                                        })
                                    }), r && (0, a.jsx)("a", {
                                        className: "see-all-button see-all-link-icon btn-secondary-xs",
                                        href: n,
                                        children: f("Action.SeeAll")
                                    })]
                                }), (0, a.jsx)("div", {
                                    className: "recommended-items-slider",
                                    children: (0, a.jsx)("ul", {
                                        ref: u,
                                        className: X()("hlist", "item-cards", "recommended-items", {
                                            "item-cards-embed": (null != d ? d : 0) < 7,
                                            "single-row": i
                                        }),
                                        children: (l ? t.slice(0, l) : t).map(function(e) {
                                            return (0, a.jsx)("li", {
                                                className: "list-item item-card recommended-item",
                                                children: (0, a.jsx)(Y, {
                                                    item: e,
                                                    translate: f,
                                                    isPremiumIconOnItemTilesEnabled: m,
                                                    isPremiumPriceOnItemTilesEnabled: p
                                                })
                                            }, e.id)
                                        })
                                    })
                                })]
                            })
                        }), o && (0, a.jsx)("div", {
                            className: "item-list"
                        })]
                    })
                };

            function Q(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function Z(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function ee(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function et(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var i = [],
                            o = !0,
                            c = !1;
                        try {
                            for (a = a.call(e); !(o = (r = a.next()).done) && (i.push(r.value), !t || i.length !== t); o = !0);
                        } catch (e) {
                            c = !0, n = e
                        } finally {
                            try {
                                o || null == a.return || a.return()
                            } finally {
                                if (c) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || er(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function er(e, t) {
                if (e) {
                    if ("string" == typeof e) return Q(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return Q(e, t)
                }
            }
            var en = function(e) {
                    var t, r, n = e.recommendationType,
                        o = e.recommendationSubtype,
                        c = e.pageName,
                        l = e.showSeeAllButton,
                        m = e.displayCount,
                        p = e.fetchCount,
                        f = e.onItemClick;
                    (0, s.useTranslation)().translate;
                    var y = et((0, i.useState)([]), 2),
                        b = y[0],
                        v = y[1],
                        g = et((0, i.useState)(1), 2),
                        h = g[0],
                        w = g[1],
                        x = et((0, i.useState)(""), 2),
                        C = x[0],
                        S = x[1],
                        T = et((0, i.useState)(!1), 2),
                        I = T[0];
                    T[1];
                    var k = et((0, i.useState)({
                            enabled: !1,
                            targetId: void 0,
                            isBundle: !1,
                            displayPurchaseButtonLeft: !1
                        }), 2),
                        P = k[0],
                        O = k[1],
                        E = et((0, i.useState)({
                            currentPageName: null,
                            isMetaDataLoaded: !1
                        }), 2),
                        R = E[0],
                        N = E[1],
                        D = et((0, i.useState)(0), 2),
                        B = D[0],
                        U = D[1],
                        $ = et((0, i.useState)(""), 2),
                        X = $[0],
                        q = $[1],
                        J = function() {
                            v([])
                        };
                    (0, i.useEffect)(function() {
                        try {
                            (0, d.initRobloxBadgesFrameworkAgnostic)({
                                overrideIconClass: "verified-badge-icon-item-recommendations"
                            })
                        } catch (e) {}
                    }, [b]);
                    var z = function(e, t) {
                            L.beginUpdateRecommendedItems(0, n, o, null != p ? p : t, e).then(function(e) {
                                v(e)
                            }, function() {
                                console.debug(" ------ beginUpdateRecommendedItems error -------")
                            })
                        },
                        Y = function() {
                            window.dispatchEvent(new CustomEvent("complimentary-items:render", {
                                detail: {
                                    targetId: P.targetId,
                                    isBundle: P.isBundle,
                                    displayPurchaseButtonLeft: P.displayPurchaseButtonLeft
                                }
                            }))
                        },
                        en = function() {
                            j.includes(c) && F(1, H, V).then(function(e) {
                                if ((null == e ? void 0 : e.complimentaryItemRecommendationsEnabled) !== void 0) {
                                    var t = e.complimentaryItemRecommendationsEnabled;
                                    t && (O({
                                        enabled: t,
                                        targetId: 0,
                                        isBundle: "bundles" === X,
                                        displayPurchaseButtonLeft: e.displayPurchaseButtonLeft
                                    }), Y())
                                }
                            })
                        },
                        ea = function() {
                            F(1, G, _)
                        },
                        ei = function() {
                            L.isRecommendationAllowed(n, o) ? R.currentPageName !== c ? (S((0, u.getAbsoluteUrl)("/catalog")), N(function(e) {
                                return ee(Z({}, e), {
                                    currentPageName: c
                                })
                            }), L.getRecommendationMetadata(c).then(function(e) {
                                var t = e.numberOfItems;
                                U(t), q(e.subject), L.getCatalogMetadata().then(function(r) {
                                    if (N(function(e) {
                                            return ee(Z({}, e), {
                                                isPremiumIconOnItemTilesEnabled: r.isPremiumIconOnItemTilesEnabled,
                                                isPremiumPriceOnItemTilesEnabled: r.isPremiumPriceOnItemTilesEnabled,
                                                isMetaDataLoaded: !0
                                            })
                                        }), en(), ea(), t) {
                                        var n = h;
                                        F(1, W, M).then(function(e) {
                                            var t;
                                            (null == e || null == (t = e.recommendationPageName) ? void 0 : t.includes(c)) && (null == e ? void 0 : e.recommendationNumRows) && w(n = e.recommendationNumRows)
                                        }).finally(function() {
                                            z(e.subject, t * n)
                                        })
                                    }
                                }, function() {
                                    console.debug(" ------ getCatalogMetadata error -------")
                                })
                            }, function() {
                                console.debug(" ------ getRecommendationsMetadata error -------")
                            })) : R.isMetaDataLoaded && B && z(X, B * h) : J()
                        };
                    (0, i.useEffect)(function() {
                        ei()
                    }, []);
                    var eo = (0, i.useRef)(!1);
                    (0, i.useEffect)(function() {
                        if (!eo.current) {
                            eo.current = !0;
                            return
                        }
                        J(), ei()
                    }, [n, o]);
                    var ec = (0, i.useRef)(null);
                    return (0, i.useEffect)(function() {
                        var e = ec.current;
                        if (e) {
                            var t = function(t) {
                                var r = t.target.closest(".item-card");
                                if (r) {
                                    var a, i = ((function(e) {
                                            if (Array.isArray(e)) return Q(e)
                                        })(a = e.querySelectorAll(".item-card")) || function(e) {
                                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                        }(a) || er(a) || function() {
                                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                        }()).indexOf(r),
                                        c = i >= 0 ? b[i] : void 0;
                                    null == f || f({
                                        recommendationType: n,
                                        recommendationSubtype: o,
                                        position: i,
                                        itemId: null == c ? void 0 : c.id,
                                        itemType: null == c ? void 0 : c.itemType
                                    })
                                }
                            };
                            return e.addEventListener("click", t),
                                function() {
                                    e.removeEventListener("click", t)
                                }
                        }
                    }, [b, n, o, f]), (0, a.jsx)(K, {
                        items: b,
                        showSeeAllButton: l,
                        seeAllHref: (null == (t = A[r = n || 0]) ? void 0 : t[o]) ? A[r][o] : C,
                        singleRow: h <= 1,
                        moreByCreatorEnabled: I,
                        complimentary: P,
                        displayCount: m,
                        listRef: ec,
                        numberOfItems: B,
                        isPremiumIconOnItemTilesEnabled: R.isPremiumIconOnItemTilesEnabled,
                        isPremiumPriceOnItemTilesEnabled: R.isPremiumPriceOnItemTilesEnabled
                    })
                },
                ea = JSON.parse('{"P":["Feature.Recommendations","Feature.Catalog"]}'),
                ei = window.HeaderScripts,
                eo = window.RobloxItemPurchase,
                ec = window.Roblox,
                el = window.CoreUtilities,
                es = {
                    asset: "asset",
                    bundle: "bundle"
                },
                eu = "Success",
                ed = "AlreadyOwned",
                em = "Limited",
                ep = {
                    assetRootUrlTemplate: "catalog",
                    bundleRootUrlTemplate: "bundles",
                    getRecommendations: {
                        url: "".concat(p().catalogApi, "/v2/recommendations/complement-assets"),
                        retryable: !0,
                        withCredentials: !0
                    },
                    postItemDetails: {
                        url: "".concat(p().catalogApi, "/v1/catalog/items/details"),
                        retryable: !0,
                        withCredentials: !0
                    },
                    getItemOwnershipUrl: function(e, t, r) {
                        return "".concat(p().inventoryApi, "/v1/users/").concat(e, "/items/").concat(t, "/").concat(r, "/is-owned")
                    }
                },
                ef = function(e, t, r) {
                    var n = {
                        url: ep.getItemOwnershipUrl(e, t, r),
                        retryable: !0,
                        withCredentials: !0
                    };
                    return el.httpService.get(n)
                },
                ey = window.Roblox["core-scripts"].eventStream,
                eb = window.Roblox["core-scripts"].meta.device,
                ev = window.EventTracker,
                eg = ((e = {})[e.View = 0] = "View", e[e.Click = 1] = "Click", e[e.Error = 2] = "Error", e),
                eh = ((t = {})[t.Web = 0] = "Web", t[t.MobileWeb = 1] = "MobileWeb", t),
                ew = function() {
                    var e = (0, eb.getDeviceMeta)();
                    return !!(null == e ? void 0 : e.isPhone) || !!(null == e ? void 0 : e.isTablet) || (null == e ? void 0 : e.deviceType) === "phone"
                },
                ex = function(e) {
                    var t = e.itemName,
                        r = e.counterName,
                        n = e.metaData,
                        a = e.actionType,
                        i = void 0 === a ? eg.View : a,
                        o = e.excludeCounter,
                        c = e.excludeTelemetry,
                        l = sessionStorage.getItem("AXAnalyticsDebugLogging"),
                        s = ew(),
                        u = "AXTracking_".concat(s ? "Mweb" : "Web");
                    if (!(void 0 !== o && o)) {
                        var d = r ? "".concat(u, "_").concat(r) : "".concat(u, "_").concat(t);
                        (0, ev.fireEvent)(d), l && console.log("AXAnalyticsService.sendCounter", d)
                    }
                    if (!(void 0 !== c && c)) {
                        var m = function(e) {
                            for (var t = 1; t < arguments.length; t++) {
                                var r = null != arguments[t] ? arguments[t] : {},
                                    n = Object.keys(r);
                                "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                    return Object.getOwnPropertyDescriptor(r, e).enumerable
                                }))), n.forEach(function(t) {
                                    var n;
                                    n = r[t], t in e ? Object.defineProperty(e, t, {
                                        value: n,
                                        enumerable: !0,
                                        configurable: !0,
                                        writable: !0
                                    }) : e[t] = n
                                })
                            }
                            return e
                        }({
                            item_name: t,
                            action_type: i,
                            platform: s ? eh.MobileWeb : eh.Web
                        }, n);
                        (0, ey.sendEventWithTarget)("userJourneyAction", "RobloxWWW", m), l && console.log("AXAnalyticsService.sendEvent", m)
                    }
                },
                eC = function(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var r = null != arguments[t] ? arguments[t] : {},
                            n = Object.keys(r);
                        "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                            return Object.getOwnPropertyDescriptor(r, e).enumerable
                        }))), n.forEach(function(t) {
                            var n;
                            n = r[t], t in e ? Object.defineProperty(e, t, {
                                value: n,
                                enumerable: !0,
                                configurable: !0,
                                writable: !0
                            }) : e[t] = n
                        })
                    }
                    return e
                }({}, {
                    CatalogView: "CatalogView"
                }, {
                    CatalogSearchView: "CatalogSearchView"
                }, {
                    CatalogFiltersApplied: "CatalogFiltersApplied"
                }, {
                    CatalogSearchFiltersApplied: "CatalogSearchFiltersApplied"
                }, {
                    AvatarEditorView: "AvatarEditorView",
                    AvatarEditorChangeAvatar: "AvatarEditorChangeAvatar",
                    AvatarEditorReactMigrationEnabled: "AvatarEditorReactMigrationEnabled",
                    AvatarEditorReactMigrationControlGroup: "AvatarEditorReactMigrationControlGroup"
                }, {
                    AvatarEditorFirstEditClick: "AvatarEditorFirstEditClick",
                    AvatarEditorEditClick: "AvatarEditorEditClick",
                    AvatarEditorEquipClick: "AvatarEditorEquipClick",
                    AvatarEditorUnequipClick: "AvatarEditorUnequipClick",
                    AvatarEditorBodyColorChangeClick: "AvatarEditorBodyColorChangeClick",
                    AvatarEditorScaleChangeClick: "AvatarEditorScaleChangeClick",
                    AvatarEditorTypeChangeClick: "AvatarEditorTypeChangeClick",
                    AvatarEditorAdvancedEditorClick: "AvatarEditorAdvancedEditorClick",
                    AvatarEditorEmoteChangeClick: "AvatarEditorEmoteChangeClick",
                    AvatarEditorRecommendationClick: "AvatarEditorRecommendationClick",
                    AvatarEditorGetMoreClick: "AvatarEditorGetMoreClick",
                    AvatarEditorOutfitCreatedClick: "AvatarEditorOutfitCreatedClick",
                    AvatarEditorOutfitDeletedClick: "AvatarEditorOutfitDeletedClick",
                    AvatarEditorOutfitEditedClick: "AvatarEditorOutfitEditedClick"
                }, {
                    CatalogItemDetailsView: "CatalogItemDetailsView",
                    CatalogLookDetailsView: "CatalogLookDetailsView",
                    PurchaseSuccessAsset: "PurchaseSuccessAsset",
                    PurchaseSuccessBundle: "PurchaseSuccessBundle",
                    PurchaseSuccess: "PurchaseSuccess",
                    PurchaseSuccessShoppingCart: "PurchaseSuccessShoppingCart",
                    PurchaseErrorShoppingCart: "PurchaseErrorShoppingCart",
                    PurchaseSuccessLook: "PurchaseSuccessLook",
                    PurchaseSuccessDirectResale: "PurchaseSuccessDirectResale",
                    PurchaseSuccessTimedOptionRepurchase: "PurchaseSuccessTimedOptionRepurchase"
                }, {
                    CatalogRevampEnabledWithRobuxInThumbnail: "CatalogRevampEnabledWithRobuxInThumbnail",
                    CatalogRevampEnabledWithoutRobuxInThumbnail: "CatalogRevampEnabledWithoutRobuxInThumbnail",
                    CatalogRevampControlGroup: "CatalogRevampControlGroup"
                }, {
                    ItemCardClick: "ItemCardClick",
                    CatalogFilterClick: "CatalogFilterClick",
                    CatalogSearchClick: "CatalogSearchClick",
                    CatalogPaginationClick: "CatalogPaginationClick",
                    ShoppingCartAddClick: "ShoppingCartAddClick",
                    ShoppingCartRemoveClick: "ShoppingCartRemoveClick",
                    ShoppingCartOpenClick: "ShoppingCartOpenClick",
                    ShoppingCartCloseClick: "ShoppingCartCloseClick",
                    PurchaseButtonClick: "PurchaseButtonClick"
                }, {
                    TradePageView: "tradePageView",
                    TradeInitiated: "tradeInitiated",
                    TradeCompleted: "tradeCompleted",
                    TradeDeclined: "tradeDeclined",
                    TradeCanceled: "tradeCanceled",
                    TradeCountered: "tradeCountered",
                    TradeViewed: "tradeViewed",
                    TradeCenterFirstVisit: "tradeCenterFirstVisit",
                    TradeFilterClick: "tradeFilterClick",
                    TradeHowToTradeClick: "tradeHowToTradeClick",
                    TradeBannerDismiss: "tradeBannerDismiss",
                    TradeProfileClick: "tradeProfileClick"
                }),
                eS = ((n = {}).Catalog = "Catalog", n.ItemDetailsRecommendations = "ItemDetailsRecommendations", n.ItemDetailsBundleContents = "ItemDetailsBundleContents", n.ComplimentaryItemRecommendations = "ComplimentaryItemRecommendations", n.LookDetailsContents = "LookDetailsContents", n),
                eT = function(e, t) {
                    e && ex({
                        itemName: e,
                        actionType: eg.Click,
                        metaData: t ? {
                            metaData: JSON.stringify(t)
                        } : void 0
                    })
                },
                eI = function(e, t) {
                    eT(eC.ItemCardClick, {
                        source: e,
                        itemId: t.itemId,
                        itemType: t.itemType
                    })
                },
                ek = function(e) {
                    var t, r = e.item,
                        n = e.selectedItems,
                        i = e.disabledItemsRecord,
                        c = e.onCheckClicked,
                        l = (0, s.useTranslation)().translate,
                        u = void 0 === i[r.id] || !i[r.id].isOwned && !i[r.id].noSellers;
                    return (0, a.jsx)(o().Fragment, {
                        children: (0, a.jsxs)("div", {
                            className: "complimentary-item-recommendations-item-card",
                            children: [u && (0, a.jsxs)("div", {
                                className: "checkbox purchase-checkbox-container",
                                children: [(0, a.jsx)("input", {
                                    className: "input-checkbox",
                                    id: "checkbox-".concat(r.id),
                                    type: "checkbox",
                                    checked: null == n ? void 0 : n.includes(r),
                                    onChange: function() {
                                        c(r.id)
                                    },
                                    disabled: !u
                                }), (0, a.jsx)("label", {
                                    htmlFor: "checkbox-".concat(r.id)
                                })]
                            }), (0, a.jsx)("div", {
                                style: {
                                    display: "contents"
                                },
                                onClick: function() {
                                    return eI(eS.ComplimentaryItemRecommendations, {
                                        itemId: r.id,
                                        itemType: r.itemType
                                    })
                                },
                                children: (0, a.jsx)(b.ItemCard, {
                                    id: r.id,
                                    name: r.name,
                                    type: r.itemType,
                                    creatorName: r.creatorName,
                                    creatorType: r.creatorType,
                                    creatorTargetId: r.creatorTargetId,
                                    price: r.price,
                                    lowestPrice: r.lowestPrice,
                                    unitsAvailableForConsumption: r.unitsAvailableForConsumption,
                                    itemStatus: r.itemStatus,
                                    priceStatus: r.priceStatus,
                                    premiumPricing: null == (t = r.premiumPricing) ? void 0 : t.premiumPriceInRobux,
                                    itemRestrictions: r.itemRestrictions,
                                    thumbnail2d: (0, a.jsx)("div", {
                                        children: (0, a.jsx)(y.Thumbnail2d, {
                                            type: b.ItemCardUtils.checkIfBundle(r.itemType) ? y.ThumbnailTypes.bundleThumbnail : y.ThumbnailTypes.assetThumbnail,
                                            targetId: r.id,
                                            size: y.DefaultThumbnailSize
                                        })
                                    })
                                })
                            }), i[r.id] && i[r.id].isOwned && (0, a.jsxs)("div", {
                                className: "item-owned",
                                children: [(0, a.jsx)("span", {
                                    className: "item-owned-icon"
                                }), (0, a.jsx)("span", {
                                    className: "item-owned-text",
                                    children: l("Label.ItemOwned")
                                })]
                            })]
                        })
                    })
                },
                eP = el.numberFormat.getNumberFormat;

            function eO(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ej(e, t, r, n, a, i, o) {
                try {
                    var c = e[i](o),
                        l = c.value
                } catch (e) {
                    r(e);
                    return
                }
                c.done ? t(l) : Promise.resolve(l).then(n, a)
            }

            function eA(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, a) {
                        var i = e.apply(t, r);

                        function o(e) {
                            ej(i, n, a, o, c, "next", e)
                        }

                        function c(e) {
                            ej(i, n, a, o, c, "throw", e)
                        }
                        o(void 0)
                    })
                }
            }

            function eE(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var i = [],
                            o = !0,
                            c = !1;
                        try {
                            for (a = a.call(e); !(o = (r = a.next()).done) && (i.push(r.value), !t || i.length !== t); o = !0);
                        } catch (e) {
                            c = !0, n = e
                        } finally {
                            try {
                                o || null == a.return || a.return()
                            } finally {
                                if (c) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return eO(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return eO(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function eR(e, t) {
                var r, n, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    c = Object.defineProperty;
                return c(o, "next", {
                    value: l(0)
                }), c(o, "throw", {
                    value: l(1)
                }), c(o, "return", {
                    value: l(2)
                }), "function" == typeof Symbol && c(o, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), o;

                function l(c) {
                    return function(l) {
                        var s = [c, l];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; o && (o = 0, s[0] && (i = 0)), i;) try {
                            if (r = 1, n && (a = 2 & s[0] ? n.return : s[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, s[1])).done) return a;
                            switch (n = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                case 0:
                                case 1:
                                    a = s;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, n = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                        i.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && i.label < a[1]) {
                                        i.label = a[1], a = s;
                                        break
                                    }
                                    if (a && i.label < a[2]) {
                                        i.label = a[2], i.ops.push(s);
                                        break
                                    }
                                    a[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            s = t.call(e, i)
                        } catch (e) {
                            s = [6, e], n = 0
                        } finally {
                            r = a = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var eN = function(e) {
                var t = e.itemId,
                    r = e.isBundle,
                    n = e.displayPurchaseButtonLeft,
                    c = e.systemFeedbackService,
                    l = (0, s.useTranslation)().translate,
                    u = eE((0, i.useState)(), 2),
                    d = u[0],
                    m = u[1],
                    p = eE((0, i.useState)(), 2),
                    f = p[0],
                    y = p[1],
                    b = eE((0, i.useState)(), 2),
                    v = b[0],
                    g = b[1],
                    h = eE((0, i.useState)(), 2),
                    w = h[0],
                    x = h[1],
                    C = eE((0, i.useState)(), 2),
                    S = C[0],
                    T = C[1],
                    I = eE((0, i.useState)({}), 2),
                    k = I[0],
                    P = I[1],
                    O = eE((0, i.useState)(), 2),
                    j = O[0],
                    A = O[1],
                    E = eE((0, i.useState)({}), 2),
                    R = E[0],
                    N = E[1],
                    L = eE((0, i.useState)(!1), 2),
                    D = L[0],
                    B = L[1],
                    U = (0, i.useCallback)(function(e) {
                        var t;
                        return t = e, el.httpService.get(ep.getRecommendations, {
                            assetId: t,
                            numItems: 140
                        })
                    }, []),
                    F = (0, i.useCallback)(function(e) {
                        return ec.ItemDetailsHydrationService.getItemDetails(e)
                    }, []),
                    M = (0, i.useCallback)(function(e, t, r) {
                        return eA(function() {
                            return eR(this, function(n) {
                                switch (n.label) {
                                    case 0:
                                        return [4, ef(e, t, r)];
                                    case 1:
                                        return [2, {
                                            response: n.sent(),
                                            itemTargetId: r
                                        }]
                                }
                            })
                        })()
                    }, []),
                    V = (0, i.useCallback)(function(e) {
                        return void 0 === e ? 0 : ei.authenticatedUser.isPremiumUser && void 0 !== e.premiumPricing && e.premiumPricing.premiumPriceInRobux >= 0 ? e.premiumPricing.premiumPriceInRobux : void 0 !== e.lowestPrice && e.lowestPrice >= 0 ? e.lowestPrice : void 0 === e.price ? 0 : e.price
                    }, []),
                    _ = (0, i.useCallback)(function() {
                        var e = 0;
                        d && (null == S ? void 0 : S.includes(d)) && (!k[d.id] || !k[d.id].isOwned && !k[d.id].noSellers) && (e += V(d)), void 0 !== v && v.forEach(function(t) {
                            null == S || !S.includes(t) || k[t.id] && (k[t.id].isOwned || k[t.id].noSellers) || (e += V(t))
                        }), A(e)
                    }, [k, V, d, v, S]),
                    W = (0, i.useCallback)(function(e) {
                        return eA(function() {
                            return eR(this, function(t) {
                                switch (t.label) {
                                    case 0:
                                        if (!ei.authenticatedUser.isAuthenticated) return [2, {
                                            id: e,
                                            isOwned: !1
                                        }];
                                        if (void 0 !== R[e]) return [2, {
                                            id: e,
                                            isOwned: R[e]
                                        }];
                                        return [4, M(ei.authenticatedUser.id, r ? es.bundle : es.asset, e)];
                                    case 1:
                                        if (!t.sent().response.data) return [2, {
                                            id: e,
                                            isOwned: !1
                                        }];
                                        return [2, {
                                            id: e,
                                            isOwned: !0
                                        }]
                                }
                            })
                        })()
                    }, []),
                    H = (0, i.useCallback)(function(e) {
                        var r = {};
                        Object.assign(r, w), r[e] = !r[e];
                        var n = 0,
                            a = [];
                        !r[t] || !d || k[d.id] && (k[d.id].isOwned || k[d.id].noSellers) || (n += V(d), a.push(d)), void 0 !== v && v.forEach(function(e) {
                            !r[e.id] || k[e.id] && (k[e.id].isOwned || k[e.id].noSellers) || (n += V(e), a.push(e))
                        }), x(r), T(a)
                    }, [k, V, d, t, w, v]);
                (0, i.useEffect)(function() {
                    U(t).then(function(e) {
                        eA(function() {
                            var t, n, a, i, o, c, l, s, u;
                            return eR(this, function(d) {
                                switch (d.label) {
                                    case 0:
                                        t = 5, n = 0, a = [], i = R, d.label = 1;
                                    case 1:
                                        if (!(n < e.data.data.length && a.length < t)) return [3, 7];
                                        o = n + t, c = e.data.data.slice(n, o), d.label = 2;
                                    case 2:
                                        if (d.trys.push([2, 5, , 6]), !(c.length > 0)) return [3, 4];
                                        return [4, Promise.all(c.map(function(e) {
                                            return M(ei.authenticatedUser.id, r ? es.bundle : es.asset, e)
                                        }))];
                                    case 3:
                                        d.sent().forEach(function(e) {
                                            if (i[e.itemTargetId] = e.response.data, a.length < t && !e.response.data) {
                                                var n = {
                                                    id: e.itemTargetId,
                                                    itemType: r ? es.bundle : es.asset
                                                };
                                                a.push(n)
                                            }
                                        }), d.label = 4;
                                    case 4:
                                        return n += t, [3, 6];
                                    case 5:
                                        return d.sent(), n = e.data.data.length, [3, 6];
                                    case 6:
                                        return [3, 1];
                                    case 7:
                                        if ((l = t - a.length) > 0)
                                            for (s = 0; s < l; s++) u = {
                                                id: e.data.data[s],
                                                itemType: r ? es.bundle : es.asset
                                            }, a.push(u);
                                        return N(i), y(a), [2]
                                }
                            })
                        })().catch(function() {
                            B(!0)
                        })
                    }).catch(function() {
                        B(!0)
                    })
                }, []), (0, i.useEffect)(function() {
                    if (void 0 !== f) {
                        var e = es.asset;
                        r && (e = es.bundle);
                        var n = [],
                            a = [],
                            i = {},
                            o = 0,
                            c = {
                                id: t,
                                itemType: e
                            };
                        f.forEach(function(e) {
                            n.push(e), a.push(), i[e.id] = o, o += 1
                        }), n.push(c), a.push(), F(n).then(function(e) {
                            var r = 0,
                                n = {},
                                o = [];
                            e.forEach(function(e) {
                                var c, l = i[e.id];
                                r += V(e), n[e.id] = !0, e.id !== t ? a[l] = e : m(e), (null == (c = e.priceStatus) ? void 0 : c.includes("Off Sale")) && void 0 === e.lowestPrice ? k && void 0 === k[e.id] ? k[e.id] = {
                                    noSellers: !0
                                } : k[e.id].noSellers = !0 : k[e.id] && k[e.id].isOwned || o.push(e)
                            }), T(o), P(k), x(n), g(a)
                        }).catch(function() {
                            console.warn("error")
                        })
                    }
                }, [r, t, F, f]), (0, i.useEffect)(function() {
                    if (d && v) {
                        var e = [];
                        e.push(d.id), v.forEach(function(t) {
                            e.push(t.id)
                        }), eA(function() {
                            var t, r, n, a, i;
                            return eR(this, function(o) {
                                switch (o.label) {
                                    case 0:
                                        return t = R, [4, Promise.all(e.map(function(e) {
                                            return W(e)
                                        }))];
                                    case 1:
                                        return r = o.sent(), n = [], a = k, r.forEach(function(e) {
                                            if (t[e.id] = e.isOwned, e.isOwned && (d && e.id === d.id && !d.itemRestrictions.includes(em) && (n.push(d), a && void 0 === a[e.id] ? a[e.id] = {
                                                    isOwned: !0
                                                } : a[e.id].isOwned = !0), void 0 !== v)) {
                                                var r = v.find(function(t) {
                                                    return t.id === e.id
                                                });
                                                r && !r.itemRestrictions.includes(em) && (n.push(r), a && void 0 === a[e.id] ? a[e.id] = {
                                                    isOwned: !0
                                                } : a[e.id].isOwned = !0)
                                            }
                                        }), N(t), S && (i = S, n.forEach(function(e) {
                                            var t = i.indexOf(e);
                                            t > -1 && i.splice(t, 1)
                                        }), T(i.slice())), P(a), [2]
                                }
                            })
                        })().catch(function() {
                            B(!0)
                        })
                    }
                }, [d, v]), (0, i.useEffect)(function() {
                    d && v && _()
                }, [d, v, S, _]);
                var G = (0, i.useCallback)(function(e) {
                    var t = 0;
                    e.forEach(function(e) {
                        if (d && e.data.itemData.assetId === d.id) {
                            if ((e.data.reason === eu || e.data.reason === ed) && (t += 1, !d.itemRestrictions.includes(em)) && (k && void 0 === k[e.data.itemData.assetId] ? k[e.data.itemData.assetId] = {
                                    isOwned: !0
                                } : k[e.data.itemData.assetId].isOwned = !0, R[e.data.itemData.assetId] = !0, S)) {
                                var r = S.indexOf(d);
                                r > -1 && S.splice(r, 1)
                            }
                        } else if (void 0 !== v && (e.data.reason === eu || e.data.reason === ed)) {
                            t += 1;
                            var n = v.find(function(t) {
                                return t.id === e.data.itemData.assetId
                            });
                            if (n && !n.itemRestrictions.includes(em) && (k && void 0 === k[e.data.itemData.assetId] ? k[e.data.itemData.assetId] = {
                                    isOwned: !0
                                } : k[e.data.itemData.assetId].isOwned = !0, R[e.data.itemData.assetId] = !0, S)) {
                                var a = S.indexOf(n);
                                a > -1 && S.splice(a, 1)
                            }
                        }
                    }), S && T(S.slice()), P(k), N(R), t === e.length && window.location.reload()
                }, [k, d, R, v, S]);
                if (void 0 === d || void 0 === v || v.length < 1 || void 0 === S || D) return (0, a.jsx)("div", {});
                var $ = new Map;
                return (0, a.jsx)(o().Fragment, {
                    children: (0, a.jsxs)("div", {
                        className: "complimentary-items-recommendations-container layer",
                        id: "populated-complimentary-items-recommendations",
                        children: [(0, a.jsx)("div", {
                            className: "complimentary-items-carousel-title",
                            children: (0, a.jsx)("h1", {
                                className: "font-header-1",
                                children: l("Heading.BuyItWith")
                            })
                        }), (0, a.jsxs)("div", {
                            className: "complimentary-items-carousel",
                            children: [(0, a.jsx)(ek, {
                                item: d,
                                selectedItems: S,
                                disabledItemsRecord: k,
                                onCheckClicked: H
                            }), (0, a.jsx)("div", {
                                className: "plus-icon-container",
                                children: (0, a.jsx)("span", {
                                    className: "plus-icon"
                                })
                            }), v.map(function(e) {
                                return (0, a.jsx)(ek, {
                                    item: e,
                                    selectedItems: S,
                                    disabledItemsRecord: k,
                                    onCheckClicked: H
                                })
                            })]
                        }), n && (0, a.jsxs)("div", {
                            className: "purchase-container",
                            children: [(0, a.jsx)("span", {
                                className: "purchase-element",
                                children: (0, a.jsx)(eo.BatchBuyPriceContainer, {
                                    items: S,
                                    purchaseMetadata: $,
                                    onTransactionComplete: G,
                                    systemFeedbackService: c
                                })
                            }), (0, a.jsx)("span", {
                                className: "purchase-element price-total",
                                children: (0, a.jsxs)("div", {
                                    className: "text-robux-tile",
                                    children: [l("Label.Total"), (0, a.jsx)("span", {
                                        className: "icon-robux-16x16"
                                    }), (0, a.jsx)("span", {
                                        className: "text-robux-tile",
                                        children: eP(j || 0)
                                    })]
                                })
                            })]
                        }), !n && (0, a.jsxs)("div", {
                            className: "purchase-container-right",
                            children: [(0, a.jsx)("span", {
                                className: "purchase-element price-total",
                                children: (0, a.jsxs)("div", {
                                    className: "text-robux-tile",
                                    children: [l("Label.Total"), (0, a.jsx)("span", {
                                        className: "icon-robux-16x16"
                                    }), (0, a.jsx)("span", {
                                        className: "text-robux-tile",
                                        children: eP(j || 0)
                                    })]
                                })
                            }), (0, a.jsx)("span", {
                                className: "purchase-element",
                                children: (0, a.jsx)(eo.BatchBuyPriceContainer, {
                                    items: S,
                                    purchaseMetadata: $,
                                    onTransactionComplete: G,
                                    systemFeedbackService: c
                                })
                            })]
                        })]
                    })
                })
            };

            function eL(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var eD = function(e) {
                var t, r = e.itemId,
                    n = e.isBundle,
                    i = e.displayPurchaseButtonLeft,
                    c = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = (0, b.createSystemFeedback)()) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var a = [],
                                i = !0,
                                o = !1;
                            try {
                                for (n = n.call(e); !(i = (t = n.next()).done) && (a.push(t.value), 2 !== a.length); i = !0);
                            } catch (e) {
                                o = !0, r = e
                            } finally {
                                try {
                                    i || null == n.return || n.return()
                                } finally {
                                    if (o) throw r
                                }
                            }
                            return a
                        }
                    }(t) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return eL(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return eL(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    l = c[0],
                    s = c[1];
                return (0, a.jsxs)(o().Fragment, {
                    children: [(0, a.jsx)(eN, {
                        itemId: r,
                        isBundle: n,
                        displayPurchaseButtonLeft: i,
                        systemFeedbackService: s
                    }), (0, a.jsx)(l, {})]
                })
            };

            function eB(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var eU = function(e, t) {
                    var r;
                    return (null == (r = e.getAttribute(t)) ? void 0 : r.toString().toLowerCase()) === "true"
                },
                eF = function(e, t) {
                    var r = Number(e.getAttribute(t));
                    return Number.isFinite(r) ? r : 0
                },
                eM = function(e) {
                    var t;
                    return {
                        recommendationType: eF(e, "data-recommendation-type"),
                        recommendationSubtype: eF(e, "data-recommendation-subtype"),
                        pageName: null != (t = e.getAttribute("data-page-name")) ? t : "",
                        available: eU(e, "data-recommendation-available")
                    }
                },
                eV = function(e) {
                    var t, r = e.element,
                        n = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, i.useState)(function() {
                            return eM(r)
                        })) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var a = [],
                                    i = !0,
                                    o = !1;
                                try {
                                    for (n = n.call(e); !(i = (t = n.next()).done) && (a.push(t.value), 2 !== a.length); i = !0);
                                } catch (e) {
                                    o = !0, r = e
                                } finally {
                                    try {
                                        i || null == n.return || n.return()
                                    } finally {
                                        if (o) throw r
                                    }
                                }
                                return a
                            }
                        }(t) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return eB(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return eB(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        o = n[0],
                        c = n[1];
                    return ((0, i.useEffect)(function() {
                        var e = function(e) {
                            var t, r = null != (t = e.detail) ? t : {};
                            c(function(e) {
                                return function(e) {
                                    for (var t = 1; t < arguments.length; t++) {
                                        var r = null != arguments[t] ? arguments[t] : {},
                                            n = Object.keys(r);
                                        "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                            return Object.getOwnPropertyDescriptor(r, e).enumerable
                                        }))), n.forEach(function(t) {
                                            var n;
                                            n = r[t], t in e ? Object.defineProperty(e, t, {
                                                value: n,
                                                enumerable: !0,
                                                configurable: !0,
                                                writable: !0
                                            }) : e[t] = n
                                        })
                                    }
                                    return e
                                }({}, e, r)
                            })
                        };
                        return window.addEventListener("recommendations:render", e),
                            function() {
                                return window.removeEventListener("recommendations:render", e)
                            }
                    }, []), o.available) ? (0, a.jsx)(en, {
                        recommendationType: o.recommendationType,
                        recommendationSubtype: o.recommendationSubtype,
                        pageName: o.pageName,
                        showSeeAllButton: !1
                    }) : null
                };
            l()(function() {
                ! function e() {
                    var t = document.getElementById("item-recommendations-container");
                    t ? (0, s.renderWithErrorBoundary)((0, a.jsx)(s.TranslationProvider, {
                        config: ea.P,
                        children: (0, a.jsx)(eV, {
                            element: t
                        })
                    }), t) : window.requestAnimationFrame(e)
                }(), window.addEventListener("complimentary-items:render", function(e) {
                    var t, r = e.detail;
                    r && (t = document.getElementById("complimentary-items-recommendations-container")) && (0, s.renderWithErrorBoundary)((0, a.jsx)(s.TranslationProvider, {
                        config: ea.P,
                        children: (0, a.jsx)(eD, {
                            itemId: r.targetId,
                            isBundle: r.isBundle,
                            displayPurchaseButtonLeft: r.displayPurchaseButtonLeft
                        })
                    }), t)
                })
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("Recommendations");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/recommendations-c1235c3bcc8b19a8.js.map