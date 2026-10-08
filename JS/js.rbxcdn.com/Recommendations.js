! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "af947ccc401fe718a8c871e5c237dab8d591fec7"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "aef7e900-dc8c-4dec-95e1-3a55d8ca9ae4", e._sentryDebugIdIdentifier = "sentry-dbid-aef7e900-dc8c-4dec-95e1-3a55d8ca9ae4")
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

                function l() {
                    throw Error("setTimeout has not been defined")
                }

                function c() {
                    throw Error("clearTimeout has not been defined")
                }
                try {
                    r = "function" == typeof setTimeout ? setTimeout : l
                } catch (e) {
                    r = l
                }
                try {
                    n = "function" == typeof clearTimeout ? clearTimeout : c
                } catch (e) {
                    n = c
                }

                function s(e) {
                    if (r === setTimeout) return setTimeout(e, 0);
                    if ((r === l || !r) && setTimeout) return r = setTimeout, setTimeout(e, 0);
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

                function f() {
                    d && a && (d = !1, a.length ? u = a.concat(u) : m = -1, u.length && p())
                }

                function p() {
                    if (!d) {
                        var e = s(f);
                        d = !0;
                        for (var t = u.length; t;) {
                            for (a = u, u = []; ++m < t;) a && a[m].run();
                            m = -1, t = u.length
                        }
                        a = null, d = !1,
                            function(e) {
                                if (n === clearTimeout) return clearTimeout(e);
                                if ((n === c || !n) && clearTimeout) return n = clearTimeout, clearTimeout(e);
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
                    u.push(new y(e, t)), 1 !== u.length || d || s(p)
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
                    S = "browser",
                    C = "browser",
                    O = [],
                    j = {
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
                        arch: S,
                        execPath: C,
                        execArgv: O
                    };
                t.addListener = i.exports.addListener, t.arch = S, t.argv = i.exports.argv, t.binding = h, t.browser = g, t.chdir = i.exports.chdir, t.cwd = i.exports.cwd, t.default = j, t.dlopen = v, t.emit = i.exports.emit, t.emitWarning = v, t.env = i.exports.env, t.execArgv = O, t.execPath = C, t.exit = v, t.features = w, t.kill = v, t.listeners = i.exports.listeners, t.memoryUsage = v, t.nextTick = i.exports.nextTick, t.off = i.exports.off, t.on = i.exports.on, t.once = i.exports.once, t.pid = 1, t.platform = x, t.prependListener = i.exports.prependListener, t.prependOnceListener = i.exports.prependOnceListener, t.removeAllListeners = i.exports.removeAllListeners, t.removeListener = i.exports.removeListener, t.title = i.exports.title, t.umask = i.exports.umask, t.uptime = v, t.uvCounters = v, t.version = i.exports.version, t.versions = i.exports.versions, e.exports = j
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
                l = window.Roblox["core-scripts"].util.ready,
                c = r.n(l),
                s = window.Roblox["core-scripts"].react,
                u = window.Roblox["core-scripts"].endpoints,
                d = window.RobloxBadges,
                m = window.Roblox["core-scripts"].environmentUrls,
                f = r.n(m),
                p = window.Roblox["core-scripts"].format.string,
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
                            l = !1;
                        try {
                            for (a = a.call(e); !(o = (r = a.next()).done) && (i.push(r.value), !t || i.length !== t); o = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                o || null == a.return || a.return()
                            } finally {
                                if (l) throw n
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
            var S = "true" === r(773).env.NEXT_PUBLIC_IS_NEXTJS ? {
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
                C = 2,
                O = 21,
                j = 34,
                P = 9,
                T = "catalog",
                I = "bundles",
                k = ["CatalogItem"],
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
                    var l = e[i](o),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, a)
            }

            function R(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, a) {
                        var i = e.apply(t, r);

                        function o(e) {
                            E(i, n, a, o, l, "next", e)
                        }

                        function l(e) {
                            E(i, n, a, o, l, "throw", e)
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
                    l = Object.defineProperty;
                return l(o, "next", {
                    value: c(0)
                }), l(o, "throw", {
                    value: c(1)
                }), l(o, "return", {
                    value: c(2)
                }), "function" == typeof Symbol && l(o, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), o;

                function c(l) {
                    return function(c) {
                        var s = [l, c];
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
                                return (0, u.getAbsoluteUrl)("/".concat(e, "/").concat(t, "/").concat((0, p.formatSeoName)(r) || "unnamed"))
                            }
                        }, {
                            key: "getBundleUrl",
                            value: function(e, r) {
                                return t.getSeoUrl(I, e, r)
                            }
                        }, {
                            key: "getAssetUrl",
                            value: function(e, r) {
                                return t.getSeoUrl(T, e, r)
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
                                return "Group" === t ? (0, u.getAbsoluteUrl)("/groups/".concat(e, "/").concat((0, p.formatSeoName)(r))) : (0, u.getAbsoluteUrl)("/users/".concat(e, "/profile"))
                            }
                        }, {
                            key: "isRecommendationAllowed",
                            value: function(e, t) {
                                return e === C || t > 0 && t !== O && t !== j
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
                                    urlType: I,
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
                                    unitsAvailableForConsumption: e.unitsAvailableForConsumption,
                                    license: e.license
                                }
                            }
                        }, {
                            key: "beginUpdateRecommendedItems",
                            value: function(e, r, n, a, i) {
                                return R(function() {
                                    var o, l, c, s, u;
                                    return N(this, function(d) {
                                        switch (d.label) {
                                            case 0:
                                                return o = 2 === r ? t.buildUrlParamsV2(null, null, e, a, -1 !== n ? n : null) : t.buildUrlParamsV2(n, e, null, a, null), l = t.buildUrlV2(i), [4, S.get(l, o)];
                                            case 1:
                                                if (s = null == (c = d.sent()) ? void 0 : c.data) return [2, ((null == (u = s[0]) ? void 0 : u.itemType) === "Bundle" ? 2 : 1) == 2 ? s.map(function(e) {
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
                                        return [2, S.get({
                                            url: "".concat(f().catalogApi.replace(/\/$/, ""), "/v1/catalog/metadata")
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
                                    url: "".concat(f().catalogApi.replace(/\/$/, ""), "/v1/recommendations/metadata")
                                };
                                return S.get(t, {
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
                                    o = a === P ? y.ThumbnailTypes.placeGameIcon : y.ThumbnailTypes.assetThumbnail;
                                return {
                                    id: e.id,
                                    name: e.name,
                                    price: e.price,
                                    lowestPrice: e.lowestPrice,
                                    absoluteUrl: t.getAssetUrl(e.id, e.name),
                                    audioUrl: t.getAudioUrl(e.id, e.assetType),
                                    hasResellers: !!e.hasResellers,
                                    saleLocationType: e.saleLocationType,
                                    urlType: T,
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
                                    itemStatus: e.itemStatus,
                                    license: e.license
                                }
                            }
                        }, {
                            key: "buildUrlV2",
                            value: function(e) {
                                return {
                                    url: "".concat(f().catalogApi.replace(/\/$/, ""), "/v2/recommendations/").concat(e),
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
                    var l = e[i](o),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, a)
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
                                l = Object.defineProperty;
                            return l(o, "next", {
                                value: c(0)
                            }), l(o, "throw", {
                                value: c(1)
                            }), l(o, "return", {
                                value: c(2)
                            }), "function" == typeof Symbol && l(o, Symbol.iterator, {
                                value: function() {
                                    return this
                                }
                            }), o;

                            function c(l) {
                                return function(c) {
                                    var s = [l, c];
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
                                U(i, r, a, o, l, "next", e)
                            }

                            function l(e) {
                                U(i, r, a, o, l, "throw", e)
                            }
                            o(void 0)
                        })
                    })()
                },
                M = (f().apiGatewayUrl.replace(/\/$/, ""), ["recommendationNumRows", "recommendationPageName"]),
                _ = ["complimentaryItemRecommendationsEnabled", "displayPurchaseButtonLeft"],
                V = ["recommendationNumRows"],
                W = "AvatarMarketplace.UI",
                z = "AvatarMarketplace.RecommendationsAndSearch.Web",
                X = "AvatarMarketplace.RelevanceRecommendations",
                H = r(611),
                G = r.n(H),
                $ = window.Roblox["core-scripts"].format.number,
                q = function() {
                    for (var e, t, r = 0, n = "", a = arguments.length; r < a; r++)(e = arguments[r]) && (t = function e(t) {
                        var r, n, a = "";
                        if ("string" == typeof t || "number" == typeof t) a += t;
                        else if ("object" == (void 0 === t ? "undefined" : t && "u" > typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t))
                            if (Array.isArray(t)) {
                                var i = t.length;
                                for (r = 0; r < i; r++) t[r] && (n = e(t[r])) && (a && (a += " "), a += n)
                            } else
                                for (n in t) t[n] && (a && (a += " "), a += n);
                        return a
                    }(e)) && (n && (n += " "), n += t);
                    return n
                };

            function J(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function K(e) {
                if (Array.isArray(e)) return e
            }

            function Y() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function Q(e, t) {
                if (e) {
                    if ("string" == typeof e) return J(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return J(e, t)
                }
            }
            var Z = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                ee = o().forwardRef(function(e, t) {
                    var r, n = K(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || Q(r) || Y(),
                        a = n[0],
                        i = n.slice(1),
                        l = a.name,
                        c = a.size,
                        s = a.className,
                        u = (a.children, function(e, t) {
                            if (null == e) return {};
                            var r, n, a, i = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (a = 0, r = Reflect.ownKeys(Object(e)); a < r.length; a++) n = r[a], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                                return i
                            }
                            if (i = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, a = {},
                                        i = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (a[r] = e[r]);
                                    return a
                                }(e, t), Object.getOwnPropertySymbols)
                                for (a = 0, r = Object.getOwnPropertySymbols(e); a < r.length; a++) n = r[a], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                            return i
                        }(a, ["name", "size", "className", "children"])),
                        d = (K(i) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var a = [],
                                    i = !0,
                                    o = !1;
                                try {
                                    for (n = n.call(e); !(i = (t = n.next()).done) && (a.push(t.value), 1 !== a.length); i = !0);
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
                        }(i) || Q(i, 1) || Y())[0];
                    return o().createElement("span", function(e) {
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
                        ref: d,
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-icon",
                        className: q("grow-0 shrink-0 basis-auto icon", l, Z[void 0 === c ? "Medium" : c], s)
                    }, u))
                });

            function et(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function er(e) {
                if (Array.isArray(e)) return e
            }

            function en() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function ea(e, t) {
                if (e) {
                    if ("string" == typeof e) return et(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return et(e, t)
                }
            }
            ee.displayName = "Icon";
            var ei = {
                    Neutral: "bg-shift-200",
                    Standard: "bg-shift-200",
                    Contrast: "bg-system-contrast",
                    Emphasis: "bg-system-emphasis",
                    Success: "bg-[rgb(from_var(--color-system-success)_r_g_b_/_0.2)]",
                    Warning: "bg-[rgb(from_var(--color-system-warning)_r_g_b_/_0.2)]",
                    Alert: "bg-[rgb(from_var(--color-system-alert)_r_g_b_/_0.2)]",
                    OverMedia: "bg-over-media-0"
                },
                eo = {
                    Neutral: "content-emphasis",
                    Standard: "content-emphasis",
                    Contrast: "content-inverse-emphasis",
                    Emphasis: "content-[var(--dark-mode-content-emphasis)]",
                    Success: "content-emphasis",
                    Warning: "content-emphasis",
                    Alert: "content-emphasis",
                    OverMedia: "content-emphasis"
                },
                el = {
                    Neutral: "content-emphasis",
                    Standard: "content-emphasis",
                    Contrast: "content-inverse-emphasis",
                    Emphasis: "content-[var(--dark-mode-content-emphasis)]",
                    Success: "content-system-success",
                    Warning: "content-system-warning",
                    Alert: "content-system-alert",
                    OverMedia: "content-emphasis"
                },
                ec = {
                    Neutral: "stroke-none",
                    Standard: "stroke-none",
                    Contrast: "stroke-none",
                    Emphasis: "stroke-none",
                    Success: "stroke-none",
                    Warning: "stroke-none",
                    Alert: "stroke-none",
                    OverMedia: "stroke-none"
                },
                es = {
                    Small: "height-600",
                    XSmall: "height-400"
                },
                eu = {
                    Small: "padding-x-small",
                    XSmall: "padding-x-xsmall"
                },
                ed = {
                    Small: "width-600",
                    XSmall: "width-400"
                },
                em = {
                    Small: "text-label-small",
                    XSmall: "text-caption-small"
                },
                ef = {
                    Small: "padding-y-xsmall",
                    XSmall: "padding-y-none"
                },
                ep = {
                    Small: "XSmall",
                    XSmall: "XSmall"
                },
                ey = {
                    Pill: "radius-circle",
                    Box: "radius-small"
                },
                eb = o().forwardRef(function(e, t) {
                    var r, n, a, i = er(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || ea(r) || en(),
                        l = i[0],
                        c = i.slice(1),
                        s = l.className,
                        u = l.label,
                        d = l.variant,
                        m = void 0 === d ? "Standard" : d,
                        f = l.icon,
                        p = l.iconPosition,
                        y = void 0 === p ? "Leading" : p,
                        b = l.size,
                        v = void 0 === b ? "Small" : b,
                        g = l.shape,
                        h = function(e, t) {
                            if (null == e) return {};
                            var r, n, a, i = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (a = 0, r = Reflect.ownKeys(Object(e)); a < r.length; a++) n = r[a], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                                return i
                            }
                            if (i = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, a = {},
                                        i = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (a[r] = e[r]);
                                    return a
                                }(e, t), Object.getOwnPropertySymbols)
                                for (a = 0, r = Object.getOwnPropertySymbols(e); a < r.length; a++) n = r[a], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                            return i
                        }(l, ["className", "label", "variant", "icon", "iconPosition", "size", "shape"]),
                        w = (er(c) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var a = [],
                                    i = !0,
                                    o = !1;
                                try {
                                    for (n = n.call(e); !(i = (t = n.next()).done) && (a.push(t.value), 1 !== a.length); i = !0);
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
                        }(c) || ea(c, 1) || en())[0],
                        x = f && !u,
                        S = "padding-x-xxsmall";
                    f && (S = "Leading" === y ? "padding-right-xxsmall" : "padding-left-xxsmall");
                    var C = f && o().createElement(ee, {
                        name: f,
                        size: ep[v],
                        className: el[m]
                    });
                    return o().createElement("div", (n = function(e) {
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
                        ref: w
                    }, h), a = a = {
                        className: q("foundation-web-badge flex items-center select-none gap-[var(--size-150)]", ey[void 0 === g ? "Pill" : g], es[v], x ? [ed[v], "justify-center"] : ["width-[fit-content]", eu[v]], ei[m], eo[m], ec[m], s)
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(a)) : (function(e) {
                        var t = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            t.push.apply(t, r)
                        }
                        return t
                    })(Object(a)).forEach(function(e) {
                        Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(a, e))
                    }), n), "Leading" === y && C, u && o().createElement("span", {
                        className: q("text-no-wrap text-truncate-split", em[v], ef[v], S, eo[m])
                    }, u), "Trailing" === y && C)
                });
            eb.displayName = "Badge";
            var ev = function(e) {
                    return "premiumPrice" in e ? e.premiumPrice : void 0
                },
                eg = function(e) {
                    return null != ev(e)
                },
                eh = function(e) {
                    var t, r, n, i = e.item,
                        o = e.translate,
                        l = e.isPremiumIconOnItemTilesEnabled,
                        c = e.isPremiumPriceOnItemTilesEnabled,
                        s = void 0 !== c && c && eg(i) ? ev(i) : i.lowestPrice ? i.lowestPrice : i.price,
                        u = ("saleLocationType" in i ? i.saleLocationType : void 0) !== "ExperiencesDevApiOnly" || "hasResellers" in i && i.hasResellers,
                        d = u && !!(s || i.lowestPrice),
                        m = u && !!s && !i.lowestPrice,
                        f = u && !!i.lowestPrice,
                        p = void 0 !== l && l && eg(i),
                        b = (null == (t = i.license) ? void 0 : t.licenseType) === "ThirdParty" ? o("Label.LicensingLicensed") : (null == (r = i.license) ? void 0 : r.licenseType) === "FirstParty" ? o("Label.LicensingOfficial") : void 0,
                        v = (null == (n = i.license) ? void 0 : n.licenseType) === "ThirdParty" ? "Neutral" : "Contrast";
                    return (0, a.jsxs)("div", {
                        className: "item-card-container recommended-item-link",
                        children: [(0, a.jsxs)("a", {
                            href: i.absoluteUrl,
                            className: "item-card-link",
                            children: [(0, a.jsxs)("div", {
                                className: "item-card-thumb-container",
                                children: [b && (0, a.jsx)("div", {
                                    className: "thumbnail-badges-container",
                                    children: (0, a.jsx)(eb, {
                                        variant: v,
                                        label: b
                                    })
                                }), (0, a.jsx)(y.Thumbnail2d, {
                                    containerClass: "item-card-thumb",
                                    type: i.thumbnail.type,
                                    targetId: i.id
                                }), (0, a.jsx)("span", {
                                    className: G()("restriction-icon", i.itemRestrictionIcon),
                                    style: i.itemRestrictionIcon ? void 0 : {
                                        display: "none"
                                    }
                                })]
                            }), (0, a.jsxs)("div", {
                                className: "item-card-name recommended-name",
                                title: i.name,
                                children: [p && (0, a.jsx)("span", {
                                    className: "icon-premium-small"
                                }), (0, a.jsx)("span", {
                                    children: i.name
                                })]
                            })]
                        }), i.audioUrl && (0, a.jsx)("div", {
                            className: "MediaPlayerControls",
                            children: (0, a.jsx)("div", {
                                className: "MediaPlayerIcon icon-play",
                                "data-mediathumb-url": i.audioUrl
                            })
                        }), (0, a.jsxs)("div", {
                            className: "recommended-creator-container",
                            children: [i.creator && (0, a.jsx)("div", {
                                className: "text-overflow item-card-creator recommended-creator",
                                children: (0, a.jsx)("span", {
                                    className: "text-overflow",
                                    dangerouslySetInnerHTML: {
                                        __html: o("Label.ByCreatorLink", {
                                            linkStart: "<a target=_self class='creator-name text-link' href='".concat(i.creator.profileLink, "'>"),
                                            linkEnd: "</a>",
                                            creator: i.creator.nameForDisplay
                                        })
                                    }
                                })
                            }), i.creatorHasVerifiedBadge && (0, a.jsx)("span", {
                                className: "verified-badge-icon-item-recommendations",
                                "data-size": "Title",
                                "data-overrideimgclass": "verified-badge-icon-item-recommendations-rendered"
                            })]
                        }), (0, a.jsxs)("div", {
                            className: "text-overflow item-card-price",
                            children: [(0, a.jsx)("span", {
                                className: "icon-robux-16x16",
                                style: d ? void 0 : {
                                    display: "none"
                                }
                            }), (0, a.jsx)("span", {
                                className: "text-robux-tile",
                                style: m ? void 0 : {
                                    display: "none"
                                },
                                children: s ? (0, $.abbreviateNumber)(s) : ""
                            }), (0, a.jsx)("span", {
                                className: "text-robux-tile",
                                style: f ? void 0 : {
                                    display: "none"
                                },
                                children: i.lowestPrice ? (0, $.abbreviateNumber)(i.lowestPrice) : ""
                            }), (0, a.jsx)("h4", {
                                className: "text text-label",
                                style: d ? {
                                    display: "none"
                                } : void 0,
                                children: i.product.noPriceText.length > 0 && (0, a.jsx)("span", {
                                    className: G()("text-overflow", "font-caption-body", {
                                        "text-robux-tile": i.product.isFree
                                    }),
                                    children: i.product.noPriceText
                                })
                            })]
                        })]
                    })
                },
                ew = function(e) {
                    var t = e.items,
                        r = e.showSeeAllButton,
                        n = e.seeAllHref,
                        i = e.singleRow,
                        o = e.moreByCreatorEnabled,
                        l = e.complimentary,
                        c = e.displayCount,
                        u = e.listRef,
                        d = e.numberOfItems,
                        m = e.isPremiumIconOnItemTilesEnabled,
                        f = e.isPremiumPriceOnItemTilesEnabled,
                        p = (0, s.useTranslation)().translate;
                    return (0, a.jsxs)("div", {
                        children: [(0, a.jsx)("div", {
                            id: "complimentary-items-recommendations-container",
                            "data-target-id": l.targetId,
                            "data-is-bundle": l.isBundle
                        }), l.enabled && (0, a.jsx)("div", {
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
                                            children: p("Heading.RecommendedTitle")
                                        })
                                    }), r && (0, a.jsx)("a", {
                                        className: "see-all-button see-all-link-icon btn-secondary-xs",
                                        href: n,
                                        children: p("Action.SeeAll")
                                    })]
                                }), (0, a.jsx)("div", {
                                    className: "recommended-items-slider",
                                    children: (0, a.jsx)("ul", {
                                        ref: u,
                                        className: G()("hlist", "item-cards", "recommended-items", {
                                            "item-cards-embed": (null != d ? d : 0) < 7,
                                            "single-row": i
                                        }),
                                        children: (c ? t.slice(0, c) : t).map(function(e) {
                                            return (0, a.jsx)("li", {
                                                className: "list-item item-card recommended-item",
                                                children: (0, a.jsx)(eh, {
                                                    item: e,
                                                    translate: p,
                                                    isPremiumIconOnItemTilesEnabled: m,
                                                    isPremiumPriceOnItemTilesEnabled: f
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

            function ex(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function eS(e) {
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

            function eC(e, t) {
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

            function eO(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var i = [],
                            o = !0,
                            l = !1;
                        try {
                            for (a = a.call(e); !(o = (r = a.next()).done) && (i.push(r.value), !t || i.length !== t); o = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                o || null == a.return || a.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || ej(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ej(e, t) {
                if (e) {
                    if ("string" == typeof e) return ex(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ex(e, t)
                }
            }
            var eP = function(e) {
                    var t, r, n = e.recommendationType,
                        o = e.recommendationSubtype,
                        l = e.pageName,
                        c = e.showSeeAllButton,
                        m = e.displayCount,
                        f = e.fetchCount,
                        p = e.onItemClick;
                    (0, s.useTranslation)().translate;
                    var y = eO((0, i.useState)([]), 2),
                        b = y[0],
                        v = y[1],
                        g = eO((0, i.useState)(1), 2),
                        h = g[0],
                        w = g[1],
                        x = eO((0, i.useState)(""), 2),
                        S = x[0],
                        C = x[1],
                        O = eO((0, i.useState)(!1), 2),
                        j = O[0];
                    O[1];
                    var P = eO((0, i.useState)({
                            enabled: !1,
                            targetId: void 0,
                            isBundle: !1,
                            displayPurchaseButtonLeft: !1
                        }), 2),
                        T = P[0],
                        I = P[1],
                        E = eO((0, i.useState)({
                            currentPageName: null,
                            isMetaDataLoaded: !1
                        }), 2),
                        R = E[0],
                        N = E[1],
                        D = eO((0, i.useState)(0), 2),
                        B = D[0],
                        U = D[1],
                        H = eO((0, i.useState)(""), 2),
                        G = H[0],
                        $ = H[1],
                        q = function() {
                            v([])
                        };
                    (0, i.useEffect)(function() {
                        try {
                            (0, d.initRobloxBadgesFrameworkAgnostic)({
                                overrideIconClass: "verified-badge-icon-item-recommendations"
                            })
                        } catch (e) {}
                    }, [b]);
                    var J = function(e, t) {
                            L.beginUpdateRecommendedItems(0, n, o, null != f ? f : t, e).then(function(e) {
                                v(e)
                            }, function() {
                                console.debug(" ------ beginUpdateRecommendedItems error -------")
                            })
                        },
                        K = function() {
                            window.dispatchEvent(new CustomEvent("complimentary-items:render", {
                                detail: {
                                    targetId: T.targetId,
                                    isBundle: T.isBundle,
                                    displayPurchaseButtonLeft: T.displayPurchaseButtonLeft
                                }
                            }))
                        },
                        Y = function() {
                            k.includes(l) && F(1, z, _).then(function(e) {
                                if ((null == e ? void 0 : e.complimentaryItemRecommendationsEnabled) !== void 0) {
                                    var t = e.complimentaryItemRecommendationsEnabled;
                                    t && (I({
                                        enabled: t,
                                        targetId: 0,
                                        isBundle: "bundles" === G,
                                        displayPurchaseButtonLeft: e.displayPurchaseButtonLeft
                                    }), K())
                                }
                            })
                        },
                        Q = function() {
                            F(1, X, V)
                        },
                        Z = function() {
                            L.isRecommendationAllowed(n, o) ? R.currentPageName !== l ? (C((0, u.getAbsoluteUrl)("/catalog")), N(function(e) {
                                return eC(eS({}, e), {
                                    currentPageName: l
                                })
                            }), L.getRecommendationMetadata(l).then(function(e) {
                                var t = e.numberOfItems;
                                U(t), $(e.subject), L.getCatalogMetadata().then(function(r) {
                                    if (N(function(e) {
                                            return eC(eS({}, e), {
                                                isPremiumIconOnItemTilesEnabled: r.isPremiumIconOnItemTilesEnabled,
                                                isPremiumPriceOnItemTilesEnabled: r.isPremiumPriceOnItemTilesEnabled,
                                                isMetaDataLoaded: !0
                                            })
                                        }), Y(), Q(), t) {
                                        var n = h;
                                        F(1, W, M).then(function(e) {
                                            var t;
                                            (null == e || null == (t = e.recommendationPageName) ? void 0 : t.includes(l)) && (null == e ? void 0 : e.recommendationNumRows) && w(n = e.recommendationNumRows)
                                        }).finally(function() {
                                            J(e.subject, t * n)
                                        })
                                    }
                                }, function() {
                                    console.debug(" ------ getCatalogMetadata error -------")
                                })
                            }, function() {
                                console.debug(" ------ getRecommendationsMetadata error -------")
                            })) : R.isMetaDataLoaded && B && J(G, B * h) : q()
                        };
                    (0, i.useEffect)(function() {
                        Z()
                    }, []);
                    var ee = (0, i.useRef)(!1);
                    (0, i.useEffect)(function() {
                        if (!ee.current) {
                            ee.current = !0;
                            return
                        }
                        q(), Z()
                    }, [n, o]);
                    var et = (0, i.useRef)(null);
                    return (0, i.useEffect)(function() {
                        var e = et.current;
                        if (e) {
                            var t = function(t) {
                                var r = t.target.closest(".item-card");
                                if (r) {
                                    var a, i = ((function(e) {
                                            if (Array.isArray(e)) return ex(e)
                                        })(a = e.querySelectorAll(".item-card")) || function(e) {
                                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                        }(a) || ej(a) || function() {
                                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                        }()).indexOf(r),
                                        l = i >= 0 ? b[i] : void 0;
                                    null == p || p({
                                        recommendationType: n,
                                        recommendationSubtype: o,
                                        position: i,
                                        itemId: null == l ? void 0 : l.id,
                                        itemType: null == l ? void 0 : l.itemType
                                    })
                                }
                            };
                            return e.addEventListener("click", t),
                                function() {
                                    e.removeEventListener("click", t)
                                }
                        }
                    }, [b, n, o, p]), (0, a.jsx)(ew, {
                        items: b,
                        showSeeAllButton: c,
                        seeAllHref: (null == (t = A[r = n || 0]) ? void 0 : t[o]) ? A[r][o] : S,
                        singleRow: h <= 1,
                        moreByCreatorEnabled: j,
                        complimentary: T,
                        displayCount: m,
                        listRef: et,
                        numberOfItems: B,
                        isPremiumIconOnItemTilesEnabled: R.isPremiumIconOnItemTilesEnabled,
                        isPremiumPriceOnItemTilesEnabled: R.isPremiumPriceOnItemTilesEnabled
                    })
                },
                eT = JSON.parse('{"P":["Feature.Recommendations","Feature.Catalog"]}'),
                eI = window.HeaderScripts,
                ek = window.RobloxItemPurchase,
                eA = window.Roblox,
                eE = window.CoreUtilities,
                eR = {
                    asset: "asset",
                    bundle: "bundle"
                },
                eN = "Success",
                eL = "AlreadyOwned",
                eD = "Limited",
                eB = {
                    assetRootUrlTemplate: "catalog",
                    bundleRootUrlTemplate: "bundles",
                    getRecommendations: {
                        url: "".concat(f().catalogApi, "/v2/recommendations/complement-assets"),
                        retryable: !0,
                        withCredentials: !0
                    },
                    postItemDetails: {
                        url: "".concat(f().catalogApi, "/v1/catalog/items/details"),
                        retryable: !0,
                        withCredentials: !0
                    },
                    getItemOwnershipUrl: function(e, t, r) {
                        return "".concat(f().inventoryApi, "/v1/users/").concat(e, "/items/").concat(t, "/").concat(r, "/is-owned")
                    }
                },
                eU = function(e, t, r) {
                    var n = {
                        url: eB.getItemOwnershipUrl(e, t, r),
                        retryable: !0,
                        withCredentials: !0
                    };
                    return eE.httpService.get(n)
                },
                eF = window.Roblox["core-scripts"].eventStream,
                eM = window.Roblox["core-scripts"].meta.device,
                e_ = window.EventTracker,
                eV = ((e = {})[e.View = 0] = "View", e[e.Click = 1] = "Click", e[e.Error = 2] = "Error", e),
                eW = ((t = {})[t.Web = 0] = "Web", t[t.MobileWeb = 1] = "MobileWeb", t),
                ez = function() {
                    var e = (0, eM.getDeviceMeta)();
                    return !!(null == e ? void 0 : e.isPhone) || !!(null == e ? void 0 : e.isTablet) || (null == e ? void 0 : e.deviceType) === "phone"
                },
                eX = function(e) {
                    var t = e.itemName,
                        r = e.counterName,
                        n = e.metaData,
                        a = e.actionType,
                        i = void 0 === a ? eV.View : a,
                        o = e.excludeCounter,
                        l = e.excludeTelemetry,
                        c = sessionStorage.getItem("AXAnalyticsDebugLogging"),
                        s = ez(),
                        u = "AXTracking_".concat(s ? "Mweb" : "Web");
                    if (!(void 0 !== o && o)) {
                        var d = r ? "".concat(u, "_").concat(r) : "".concat(u, "_").concat(t);
                        (0, e_.fireEvent)(d), c && console.log("AXAnalyticsService.sendCounter", d)
                    }
                    if (!(void 0 !== l && l)) {
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
                            platform: s ? eW.MobileWeb : eW.Web
                        }, n);
                        (0, eF.sendEventWithTarget)("userJourneyAction", "RobloxWWW", m), c && console.log("AXAnalyticsService.sendEvent", m)
                    }
                },
                eH = function(e) {
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
                eG = ((n = {}).Catalog = "Catalog", n.ItemDetailsRecommendations = "ItemDetailsRecommendations", n.ItemDetailsBundleContents = "ItemDetailsBundleContents", n.ComplimentaryItemRecommendations = "ComplimentaryItemRecommendations", n.LookDetailsContents = "LookDetailsContents", n),
                e$ = function(e, t) {
                    e && eX({
                        itemName: e,
                        actionType: eV.Click,
                        metaData: t ? {
                            metaData: JSON.stringify(t)
                        } : void 0
                    })
                },
                eq = function(e, t) {
                    e$(eH.ItemCardClick, {
                        source: e,
                        itemId: t.itemId,
                        itemType: t.itemType
                    })
                },
                eJ = function(e) {
                    var t, r, n = e.item,
                        i = e.selectedItems,
                        l = e.disabledItemsRecord,
                        c = e.onCheckClicked,
                        u = (0, s.useTranslation)().translate,
                        d = void 0 === l[n.id] || !l[n.id].isOwned && !l[n.id].noSellers;
                    return (0, a.jsx)(o().Fragment, {
                        children: (0, a.jsxs)("div", {
                            className: "complimentary-item-recommendations-item-card",
                            children: [d && (0, a.jsxs)("div", {
                                className: "checkbox purchase-checkbox-container",
                                children: [(0, a.jsx)("input", {
                                    className: "input-checkbox",
                                    id: "checkbox-".concat(n.id),
                                    type: "checkbox",
                                    checked: null == i ? void 0 : i.includes(n),
                                    onChange: function() {
                                        c(n.id)
                                    },
                                    disabled: !d
                                }), (0, a.jsx)("label", {
                                    htmlFor: "checkbox-".concat(n.id)
                                })]
                            }), (0, a.jsx)("div", {
                                style: {
                                    display: "contents"
                                },
                                onClick: function() {
                                    return eq(eG.ComplimentaryItemRecommendations, {
                                        itemId: n.id,
                                        itemType: n.itemType
                                    })
                                },
                                children: (0, a.jsx)(b.ItemCard, {
                                    id: n.id,
                                    name: n.name,
                                    type: n.itemType,
                                    creatorName: n.creatorName,
                                    creatorType: n.creatorType,
                                    creatorTargetId: n.creatorTargetId,
                                    price: n.price,
                                    lowestPrice: n.lowestPrice,
                                    unitsAvailableForConsumption: n.unitsAvailableForConsumption,
                                    itemStatus: n.itemStatus,
                                    priceStatus: n.priceStatus,
                                    premiumPricing: null == (t = n.premiumPricing) ? void 0 : t.premiumPriceInRobux,
                                    itemRestrictions: n.itemRestrictions,
                                    thumbnail2d: (0, a.jsx)("div", {
                                        children: (0, a.jsx)(y.Thumbnail2d, {
                                            type: b.ItemCardUtils.checkIfBundle(n.itemType) ? y.ThumbnailTypes.bundleThumbnail : y.ThumbnailTypes.assetThumbnail,
                                            targetId: n.id,
                                            size: y.DefaultThumbnailSize
                                        })
                                    }),
                                    licenseType: null == (r = n.license) ? void 0 : r.licenseType
                                })
                            }), l[n.id] && l[n.id].isOwned && (0, a.jsxs)("div", {
                                className: "item-owned",
                                children: [(0, a.jsx)("span", {
                                    className: "item-owned-icon"
                                }), (0, a.jsx)("span", {
                                    className: "item-owned-text",
                                    children: u("Label.ItemOwned")
                                })]
                            })]
                        })
                    })
                },
                eK = eE.numberFormat.getNumberFormat;

            function eY(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function eQ(e, t, r, n, a, i, o) {
                try {
                    var l = e[i](o),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, a)
            }

            function eZ(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, a) {
                        var i = e.apply(t, r);

                        function o(e) {
                            eQ(i, n, a, o, l, "next", e)
                        }

                        function l(e) {
                            eQ(i, n, a, o, l, "throw", e)
                        }
                        o(void 0)
                    })
                }
            }

            function e0(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var i = [],
                            o = !0,
                            l = !1;
                        try {
                            for (a = a.call(e); !(o = (r = a.next()).done) && (i.push(r.value), !t || i.length !== t); o = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                o || null == a.return || a.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return eY(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return eY(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function e1(e, t) {
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
                    l = Object.defineProperty;
                return l(o, "next", {
                    value: c(0)
                }), l(o, "throw", {
                    value: c(1)
                }), l(o, "return", {
                    value: c(2)
                }), "function" == typeof Symbol && l(o, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), o;

                function c(l) {
                    return function(c) {
                        var s = [l, c];
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
            var e2 = function(e) {
                var t = e.itemId,
                    r = e.isBundle,
                    n = e.displayPurchaseButtonLeft,
                    l = e.systemFeedbackService,
                    c = (0, s.useTranslation)().translate,
                    u = e0((0, i.useState)(), 2),
                    d = u[0],
                    m = u[1],
                    f = e0((0, i.useState)(), 2),
                    p = f[0],
                    y = f[1],
                    b = e0((0, i.useState)(), 2),
                    v = b[0],
                    g = b[1],
                    h = e0((0, i.useState)(), 2),
                    w = h[0],
                    x = h[1],
                    S = e0((0, i.useState)(), 2),
                    C = S[0],
                    O = S[1],
                    j = e0((0, i.useState)({}), 2),
                    P = j[0],
                    T = j[1],
                    I = e0((0, i.useState)(), 2),
                    k = I[0],
                    A = I[1],
                    E = e0((0, i.useState)({}), 2),
                    R = E[0],
                    N = E[1],
                    L = e0((0, i.useState)(!1), 2),
                    D = L[0],
                    B = L[1],
                    U = (0, i.useCallback)(function(e) {
                        var t;
                        return t = e, eE.httpService.get(eB.getRecommendations, {
                            assetId: t,
                            numItems: 140
                        })
                    }, []),
                    F = (0, i.useCallback)(function(e) {
                        return eA.ItemDetailsHydrationService.getItemDetails(e)
                    }, []),
                    M = (0, i.useCallback)(function(e, t, r) {
                        return eZ(function() {
                            return e1(this, function(n) {
                                switch (n.label) {
                                    case 0:
                                        return [4, eU(e, t, r)];
                                    case 1:
                                        return [2, {
                                            response: n.sent(),
                                            itemTargetId: r
                                        }]
                                }
                            })
                        })()
                    }, []),
                    _ = (0, i.useCallback)(function(e) {
                        return void 0 === e ? 0 : eI.authenticatedUser.isPremiumUser && void 0 !== e.premiumPricing && e.premiumPricing.premiumPriceInRobux >= 0 ? e.premiumPricing.premiumPriceInRobux : void 0 !== e.lowestPrice && e.lowestPrice >= 0 ? e.lowestPrice : void 0 === e.price ? 0 : e.price
                    }, []),
                    V = (0, i.useCallback)(function() {
                        var e = 0;
                        d && (null == C ? void 0 : C.includes(d)) && (!P[d.id] || !P[d.id].isOwned && !P[d.id].noSellers) && (e += _(d)), void 0 !== v && v.forEach(function(t) {
                            null == C || !C.includes(t) || P[t.id] && (P[t.id].isOwned || P[t.id].noSellers) || (e += _(t))
                        }), A(e)
                    }, [P, _, d, v, C]),
                    W = (0, i.useCallback)(function(e) {
                        return eZ(function() {
                            return e1(this, function(t) {
                                switch (t.label) {
                                    case 0:
                                        if (!eI.authenticatedUser.isAuthenticated) return [2, {
                                            id: e,
                                            isOwned: !1
                                        }];
                                        if (void 0 !== R[e]) return [2, {
                                            id: e,
                                            isOwned: R[e]
                                        }];
                                        return [4, M(eI.authenticatedUser.id, r ? eR.bundle : eR.asset, e)];
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
                    z = (0, i.useCallback)(function(e) {
                        var r = {};
                        Object.assign(r, w), r[e] = !r[e];
                        var n = 0,
                            a = [];
                        !r[t] || !d || P[d.id] && (P[d.id].isOwned || P[d.id].noSellers) || (n += _(d), a.push(d)), void 0 !== v && v.forEach(function(e) {
                            !r[e.id] || P[e.id] && (P[e.id].isOwned || P[e.id].noSellers) || (n += _(e), a.push(e))
                        }), x(r), O(a)
                    }, [P, _, d, t, w, v]);
                (0, i.useEffect)(function() {
                    U(t).then(function(e) {
                        eZ(function() {
                            var t, n, a, i, o, l, c, s, u;
                            return e1(this, function(d) {
                                switch (d.label) {
                                    case 0:
                                        t = 5, n = 0, a = [], i = R, d.label = 1;
                                    case 1:
                                        if (!(n < e.data.data.length && a.length < t)) return [3, 7];
                                        o = n + t, l = e.data.data.slice(n, o), d.label = 2;
                                    case 2:
                                        if (d.trys.push([2, 5, , 6]), !(l.length > 0)) return [3, 4];
                                        return [4, Promise.all(l.map(function(e) {
                                            return M(eI.authenticatedUser.id, r ? eR.bundle : eR.asset, e)
                                        }))];
                                    case 3:
                                        d.sent().forEach(function(e) {
                                            if (i[e.itemTargetId] = e.response.data, a.length < t && !e.response.data) {
                                                var n = {
                                                    id: e.itemTargetId,
                                                    itemType: r ? eR.bundle : eR.asset
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
                                        if ((c = t - a.length) > 0)
                                            for (s = 0; s < c; s++) u = {
                                                id: e.data.data[s],
                                                itemType: r ? eR.bundle : eR.asset
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
                    if (void 0 !== p) {
                        var e = eR.asset;
                        r && (e = eR.bundle);
                        var n = [],
                            a = [],
                            i = {},
                            o = 0,
                            l = {
                                id: t,
                                itemType: e
                            };
                        p.forEach(function(e) {
                            n.push(e), a.push(), i[e.id] = o, o += 1
                        }), n.push(l), a.push(), F(n).then(function(e) {
                            var r = 0,
                                n = {},
                                o = [];
                            e.forEach(function(e) {
                                var l, c = i[e.id];
                                r += _(e), n[e.id] = !0, e.id !== t ? a[c] = e : m(e), (null == (l = e.priceStatus) ? void 0 : l.includes("Off Sale")) && void 0 === e.lowestPrice ? P && void 0 === P[e.id] ? P[e.id] = {
                                    noSellers: !0
                                } : P[e.id].noSellers = !0 : P[e.id] && P[e.id].isOwned || o.push(e)
                            }), O(o), T(P), x(n), g(a)
                        }).catch(function() {
                            console.warn("error")
                        })
                    }
                }, [r, t, F, p]), (0, i.useEffect)(function() {
                    if (d && v) {
                        var e = [];
                        e.push(d.id), v.forEach(function(t) {
                            e.push(t.id)
                        }), eZ(function() {
                            var t, r, n, a, i;
                            return e1(this, function(o) {
                                switch (o.label) {
                                    case 0:
                                        return t = R, [4, Promise.all(e.map(function(e) {
                                            return W(e)
                                        }))];
                                    case 1:
                                        return r = o.sent(), n = [], a = P, r.forEach(function(e) {
                                            if (t[e.id] = e.isOwned, e.isOwned && (d && e.id === d.id && !d.itemRestrictions.includes(eD) && (n.push(d), a && void 0 === a[e.id] ? a[e.id] = {
                                                    isOwned: !0
                                                } : a[e.id].isOwned = !0), void 0 !== v)) {
                                                var r = v.find(function(t) {
                                                    return t.id === e.id
                                                });
                                                r && !r.itemRestrictions.includes(eD) && (n.push(r), a && void 0 === a[e.id] ? a[e.id] = {
                                                    isOwned: !0
                                                } : a[e.id].isOwned = !0)
                                            }
                                        }), N(t), C && (i = C, n.forEach(function(e) {
                                            var t = i.indexOf(e);
                                            t > -1 && i.splice(t, 1)
                                        }), O(i.slice())), T(a), [2]
                                }
                            })
                        })().catch(function() {
                            B(!0)
                        })
                    }
                }, [d, v]), (0, i.useEffect)(function() {
                    d && v && V()
                }, [d, v, C, V]);
                var X = (0, i.useCallback)(function(e) {
                    var t = 0;
                    e.forEach(function(e) {
                        if (d && e.data.itemData.assetId === d.id) {
                            if ((e.data.reason === eN || e.data.reason === eL) && (t += 1, !d.itemRestrictions.includes(eD)) && (P && void 0 === P[e.data.itemData.assetId] ? P[e.data.itemData.assetId] = {
                                    isOwned: !0
                                } : P[e.data.itemData.assetId].isOwned = !0, R[e.data.itemData.assetId] = !0, C)) {
                                var r = C.indexOf(d);
                                r > -1 && C.splice(r, 1)
                            }
                        } else if (void 0 !== v && (e.data.reason === eN || e.data.reason === eL)) {
                            t += 1;
                            var n = v.find(function(t) {
                                return t.id === e.data.itemData.assetId
                            });
                            if (n && !n.itemRestrictions.includes(eD) && (P && void 0 === P[e.data.itemData.assetId] ? P[e.data.itemData.assetId] = {
                                    isOwned: !0
                                } : P[e.data.itemData.assetId].isOwned = !0, R[e.data.itemData.assetId] = !0, C)) {
                                var a = C.indexOf(n);
                                a > -1 && C.splice(a, 1)
                            }
                        }
                    }), C && O(C.slice()), T(P), N(R), t === e.length && window.location.reload()
                }, [P, d, R, v, C]);
                if (void 0 === d || void 0 === v || v.length < 1 || void 0 === C || D) return (0, a.jsx)("div", {});
                var H = new Map;
                return (0, a.jsx)(o().Fragment, {
                    children: (0, a.jsxs)("div", {
                        className: "complimentary-items-recommendations-container layer",
                        id: "populated-complimentary-items-recommendations",
                        children: [(0, a.jsx)("div", {
                            className: "complimentary-items-carousel-title",
                            children: (0, a.jsx)("h1", {
                                className: "font-header-1",
                                children: c("Heading.BuyItWith")
                            })
                        }), (0, a.jsxs)("div", {
                            className: "complimentary-items-carousel",
                            children: [(0, a.jsx)(eJ, {
                                item: d,
                                selectedItems: C,
                                disabledItemsRecord: P,
                                onCheckClicked: z
                            }), (0, a.jsx)("div", {
                                className: "plus-icon-container",
                                children: (0, a.jsx)("span", {
                                    className: "plus-icon"
                                })
                            }), v.map(function(e) {
                                return (0, a.jsx)(eJ, {
                                    item: e,
                                    selectedItems: C,
                                    disabledItemsRecord: P,
                                    onCheckClicked: z
                                })
                            })]
                        }), n && (0, a.jsxs)("div", {
                            className: "purchase-container",
                            children: [(0, a.jsx)("span", {
                                className: "purchase-element",
                                children: (0, a.jsx)(ek.BatchBuyPriceContainer, {
                                    items: C,
                                    purchaseMetadata: H,
                                    onTransactionComplete: X,
                                    systemFeedbackService: l
                                })
                            }), (0, a.jsx)("span", {
                                className: "purchase-element price-total",
                                children: (0, a.jsxs)("div", {
                                    className: "text-robux-tile",
                                    children: [c("Label.Total"), (0, a.jsx)("span", {
                                        className: "icon-robux-16x16"
                                    }), (0, a.jsx)("span", {
                                        className: "text-robux-tile",
                                        children: eK(k || 0)
                                    })]
                                })
                            })]
                        }), !n && (0, a.jsxs)("div", {
                            className: "purchase-container-right",
                            children: [(0, a.jsx)("span", {
                                className: "purchase-element price-total",
                                children: (0, a.jsxs)("div", {
                                    className: "text-robux-tile",
                                    children: [c("Label.Total"), (0, a.jsx)("span", {
                                        className: "icon-robux-16x16"
                                    }), (0, a.jsx)("span", {
                                        className: "text-robux-tile",
                                        children: eK(k || 0)
                                    })]
                                })
                            }), (0, a.jsx)("span", {
                                className: "purchase-element",
                                children: (0, a.jsx)(ek.BatchBuyPriceContainer, {
                                    items: C,
                                    purchaseMetadata: H,
                                    onTransactionComplete: X,
                                    systemFeedbackService: l
                                })
                            })]
                        })]
                    })
                })
            };

            function e3(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var e6 = function(e) {
                var t, r = e.itemId,
                    n = e.isBundle,
                    i = e.displayPurchaseButtonLeft,
                    l = function(e) {
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
                            if ("string" == typeof e) return e3(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return e3(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    c = l[0],
                    s = l[1];
                return (0, a.jsxs)(o().Fragment, {
                    children: [(0, a.jsx)(e2, {
                        itemId: r,
                        isBundle: n,
                        displayPurchaseButtonLeft: i,
                        systemFeedbackService: s
                    }), (0, a.jsx)(c, {})]
                })
            };

            function e4(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var e5 = function(e, t) {
                    var r;
                    return (null == (r = e.getAttribute(t)) ? void 0 : r.toString().toLowerCase()) === "true"
                },
                e8 = function(e, t) {
                    var r = Number(e.getAttribute(t));
                    return Number.isFinite(r) ? r : 0
                },
                e7 = function(e) {
                    var t;
                    return {
                        recommendationType: e8(e, "data-recommendation-type"),
                        recommendationSubtype: e8(e, "data-recommendation-subtype"),
                        pageName: null != (t = e.getAttribute("data-page-name")) ? t : "",
                        available: e5(e, "data-recommendation-available")
                    }
                },
                e9 = function(e) {
                    var t, r = e.element,
                        n = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, i.useState)(function() {
                            return e7(r)
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
                                if ("string" == typeof e) return e4(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return e4(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        o = n[0],
                        l = n[1];
                    return ((0, i.useEffect)(function() {
                        var e = function(e) {
                            var t, r = null != (t = e.detail) ? t : {};
                            l(function(e) {
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
                    }, []), o.available) ? (0, a.jsx)(eP, {
                        recommendationType: o.recommendationType,
                        recommendationSubtype: o.recommendationSubtype,
                        pageName: o.pageName,
                        showSeeAllButton: !1
                    }) : null
                };
            c()(function() {
                ! function e() {
                    var t = document.getElementById("item-recommendations-container");
                    t ? (0, s.renderWithErrorBoundary)((0, a.jsx)(s.TranslationProvider, {
                        config: eT.P,
                        children: (0, a.jsx)(e9, {
                            element: t
                        })
                    }), t) : window.requestAnimationFrame(e)
                }(), window.addEventListener("complimentary-items:render", function(e) {
                    var t, r = e.detail;
                    r && (t = document.getElementById("complimentary-items-recommendations-container")) && (0, s.renderWithErrorBoundary)((0, a.jsx)(s.TranslationProvider, {
                        config: eT.P,
                        children: (0, a.jsx)(e6, {
                            itemId: r.targetId,
                            isBundle: r.isBundle,
                            displayPurchaseButtonLeft: r.displayPurchaseButtonLeft
                        })
                    }), t)
                })
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("Recommendations");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/recommendations-095ebfe10188e9c2.js.map