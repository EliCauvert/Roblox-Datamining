! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "af947ccc401fe718a8c871e5c237dab8d591fec7"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "9cd217e5-f434-4bc7-ac4f-e5e111169119", e._sentryDebugIdIdentifier = "sentry-dbid-9cd217e5-f434-4bc7-ac4f-e5e111169119")
    } catch (e) {}
}(),
function() {
    "use strict";
    var e = {},
        t = {};

    function r(n) {
        var i = t[n];
        if (void 0 !== i) return i.exports;
        var a = t[n] = {
            exports: {}
        };
        return e[n](a, a.exports, r), a.exports
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
    }, r.ruid = "bundler=rspack@1.7.12";
    var n = window.ReactJSX,
        i = window.React,
        a = window.Roblox["core-scripts"].util.ready,
        o = r.n(a),
        c = window.Roblox["core-scripts"].react,
        s = window.ReactUtilities,
        l = window.ReactStyleGuide,
        u = window.RobloxThumbnails,
        d = window.CoreUtilities,
        m = window.Roblox["core-scripts"].environmentUrls,
        p = {
            itemDetailsAdCount: 7,
            catalogCategoryType: "All",
            campaignTargetType: "Asset",
            getSponsoredCatalogItems: {
                url: "".concat(m.EnvironmentUrls.catalogApi, "/v1/catalog/sponsored-items"),
                retryable: !1,
                withCredentials: !0
            },
            getCatalogItemsDetails: {
                url: "".concat(m.EnvironmentUrls.catalogApi, "/v1/catalog/items/details"),
                retryable: !1,
                withCredentials: !0
            },
            recordClick: {
                url: "".concat(m.EnvironmentUrls.adConfigurationApi, "/v2/tracking/click"),
                retryable: !1,
                withCredentials: !0
            },
            sizing: {
                tileWidth: 150,
                screenSize1Item: 768,
                screenSize3Items: 784,
                screenSize4Items: 1127,
                screenSize5Items: 1283,
                screenSize6Items: 1907,
                catalogLeftNav: 160,
                websiteLeftNav: 175,
                extraSpace: 43
            }
        },
        f = function(e, t) {
            var r = p.campaignTargetType;
            return d.httpService.post(p.recordClick, {
                encryptedAdTrackingData: e,
                campaignTargetType: r,
                placementLocation: t
            })
        };

    function y(e, t, r, n, i, a, o) {
        try {
            var c = e[a](o),
                s = c.value
        } catch (e) {
            r(e);
            return
        }
        c.done ? t(s) : Promise.resolve(s).then(n, i)
    }

    function h(e) {
        var t = e.id,
            r = e.name,
            a = e.type,
            o = e.creatorName,
            c = e.creatorType,
            s = e.creatorTargetId,
            u = e.price,
            d = e.lowestPrice,
            m = e.priceStatus,
            p = e.premiumPricing,
            h = e.unitsAvailableForConsumption,
            b = e.itemStatus,
            v = e.itemRestrictions,
            g = e.thumbnail2d,
            w = e.encryptedAdTrackingData,
            T = e.placementLocation,
            x = e.licenseType,
            S = (0, i.useCallback)(function() {
                var e;
                return (e = function() {
                    return function(e, t) {
                        var r, n, i, a = {
                                label: 0,
                                sent: function() {
                                    if (1 & i[0]) throw i[1];
                                    return i[1]
                                },
                                trys: [],
                                ops: []
                            },
                            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                            c = Object.defineProperty;
                        return c(o, "next", {
                            value: s(0)
                        }), c(o, "throw", {
                            value: s(1)
                        }), c(o, "return", {
                            value: s(2)
                        }), "function" == typeof Symbol && c(o, Symbol.iterator, {
                            value: function() {
                                return this
                            }
                        }), o;

                        function s(c) {
                            return function(s) {
                                var l = [c, s];
                                if (r) throw TypeError("Generator is already executing.");
                                for (; o && (o = 0, l[0] && (a = 0)), a;) try {
                                    if (r = 1, n && (i = 2 & l[0] ? n.return : l[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, l[1])).done) return i;
                                    switch (n = 0, i && (l = [2 & l[0], i.value]), l[0]) {
                                        case 0:
                                        case 1:
                                            i = l;
                                            break;
                                        case 4:
                                            return a.label++, {
                                                value: l[1],
                                                done: !1
                                            };
                                        case 5:
                                            a.label++, n = l[1], l = [0];
                                            continue;
                                        case 7:
                                            l = a.ops.pop(), a.trys.pop();
                                            continue;
                                        default:
                                            if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                                a = 0;
                                                continue
                                            }
                                            if (3 === l[0] && (!i || l[1] > i[0] && l[1] < i[3])) {
                                                a.label = l[1];
                                                break
                                            }
                                            if (6 === l[0] && a.label < i[1]) {
                                                a.label = i[1], i = l;
                                                break
                                            }
                                            if (i && a.label < i[2]) {
                                                a.label = i[2], a.ops.push(l);
                                                break
                                            }
                                            i[2] && a.ops.pop(), a.trys.pop();
                                            continue
                                    }
                                    l = t.call(e, a)
                                } catch (e) {
                                    l = [6, e], n = 0
                                } finally {
                                    r = i = 0
                                }
                                if (5 & l[0]) throw l[1];
                                return {
                                    value: l[0] ? l[1] : void 0,
                                    done: !0
                                }
                            }
                        }
                    }(this, function(e) {
                        return [2, f(w, T)]
                    })
                }, function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, i) {
                        var a = e.apply(t, r);

                        function o(e) {
                            y(a, n, i, o, c, "next", e)
                        }

                        function c(e) {
                            y(a, n, i, o, c, "throw", e)
                        }
                        o(void 0)
                    })
                })()
            }, [w, T]);
        return (0, n.jsx)("div", {
            className: "sponsored-item-card",
            onClick: S,
            onKeyDown: S,
            children: (0, n.jsx)(l.ItemCard, {
                id: t,
                name: r,
                type: a,
                creatorName: o,
                creatorType: c,
                creatorTargetId: s,
                price: u,
                lowestPrice: d,
                priceStatus: m,
                premiumPricing: p,
                unitsAvailableForConsumption: h,
                itemStatus: b,
                itemRestrictions: v,
                thumbnail2d: g,
                licenseType: x
            })
        })
    }
    var b = function(e) {
        var t = e.tooltipText,
            r = e.sizeInPx,
            i = void 0 === r ? 16 : r;
        return (0, n.jsx)("span", {
            style: {
                marginLeft: 2
            },
            className: "info-tooltip-container",
            children: (0, n.jsx)(l.Tooltip, {
                id: "sort-info-tooltip",
                placement: "right",
                containerClassName: "sort-info-tooltip",
                content: t,
                children: (0, n.jsxs)("svg", {
                    width: i,
                    height: i,
                    viewBox: "0 0 16 16",
                    fill: "none",
                    xmlns: "http://www.w3.org/2000/svg",
                    children: [(0, n.jsx)("path", {
                        d: "M8.97 5.44H7V4H8.97V5.44Z",
                        fill: "currentColor"
                    }), (0, n.jsx)("path", {
                        d: "M8.94347 11.9999H7.05347V6.37988H8.94347V11.9999Z",
                        fill: "currentColor"
                    }), (0, n.jsx)("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        d: "M8 16C12.4183 16 16 12.4183 16 8C16 3.58172 12.4183 0 8 0C3.58172 0 0 3.58172 0 8C0 12.4183 3.58172 16 8 16ZM8 14.5C11.5899 14.5 14.5 11.5899 14.5 8C14.5 4.41015 11.5899 1.5 8 1.5C4.41015 1.5 1.5 4.41015 1.5 8C1.5 11.5899 4.41015 14.5 8 14.5Z",
                        fill: "currentColor"
                    })]
                })
            })
        })
    };

    function v(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function g(e, t, r, n, i, a, o) {
        try {
            var c = e[a](o),
                s = c.value
        } catch (e) {
            r(e);
            return
        }
        c.done ? t(s) : Promise.resolve(s).then(n, i)
    }

    function w(e) {
        return function() {
            var t = this,
                r = arguments;
            return new Promise(function(n, i) {
                var a = e.apply(t, r);

                function o(e) {
                    g(a, n, i, o, c, "next", e)
                }

                function c(e) {
                    g(a, n, i, o, c, "throw", e)
                }
                o(void 0)
            })
        }
    }

    function T(e, t) {
        return function(e) {
            if (Array.isArray(e)) return e
        }(e) || function(e, t) {
            var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
            if (null != i) {
                var a = [],
                    o = !0,
                    c = !1;
                try {
                    for (i = i.call(e); !(o = (r = i.next()).done) && (a.push(r.value), !t || a.length !== t); o = !0);
                } catch (e) {
                    c = !0, n = e
                } finally {
                    try {
                        o || null == i.return || i.return()
                    } finally {
                        if (c) throw n
                    }
                }
                return a
            }
        }(e, t) || function(e, t) {
            if (e) {
                if ("string" == typeof e) return v(e, t);
                var r = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return v(e, t)
            }
        }(e, t) || function() {
            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }

    function x(e, t) {
        var r, n, i, a = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
            c = Object.defineProperty;
        return c(o, "next", {
            value: s(0)
        }), c(o, "throw", {
            value: s(1)
        }), c(o, "return", {
            value: s(2)
        }), "function" == typeof Symbol && c(o, Symbol.iterator, {
            value: function() {
                return this
            }
        }), o;

        function s(c) {
            return function(s) {
                var l = [c, s];
                if (r) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, l[0] && (a = 0)), a;) try {
                    if (r = 1, n && (i = 2 & l[0] ? n.return : l[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, l[1])).done) return i;
                    switch (n = 0, i && (l = [2 & l[0], i.value]), l[0]) {
                        case 0:
                        case 1:
                            i = l;
                            break;
                        case 4:
                            return a.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            a.label++, n = l[1], l = [0];
                            continue;
                        case 7:
                            l = a.ops.pop(), a.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                a = 0;
                                continue
                            }
                            if (3 === l[0] && (!i || l[1] > i[0] && l[1] < i[3])) {
                                a.label = l[1];
                                break
                            }
                            if (6 === l[0] && a.label < i[1]) {
                                a.label = i[1], i = l;
                                break
                            }
                            if (i && a.label < i[2]) {
                                a.label = i[2], a.ops.push(l);
                                break
                            }
                            i[2] && a.ops.pop(), a.trys.pop();
                            continue
                    }
                    l = t.call(e, a)
                } catch (e) {
                    l = [6, e], n = 0
                } finally {
                    r = i = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }
    b.defaultProps = {
        sizeInPx: 16
    };
    var S = (0, s.withTranslations)(function(e) {
            var t = e.placementLocation,
                r = e.translate,
                a = T((0, i.useState)(void 0), 2),
                o = a[0],
                c = a[1],
                s = T((0, i.useState)(void 0), 2),
                m = s[0],
                f = s[1],
                y = function() {
                    var e = window.innerWidth,
                        t = p.sizing,
                        r = 0;
                    if (e < t.screenSize1Item) r = 1;
                    else if (e < t.screenSize3Items) r = 3;
                    else if (e < t.screenSize4Items) r = 4;
                    else if (e < t.screenSize5Items) r = 5;
                    else if (e < t.screenSize6Items) r = 6;
                    else {
                        var n = t.tileWidth;
                        r = Math.floor((e - t.catalogLeftNav - t.websiteLeftNav - t.extraSpace) / n)
                    }
                    return r
                },
                v = (0, i.useCallback)(function() {
                    var e = 0;
                    switch (t) {
                        case "AvatarShop":
                            e = y();
                            break;
                        case "ItemDetails":
                            e = p.itemDetailsAdCount
                    }
                    return e
                }, [t]),
                g = (0, i.useCallback)(function() {
                    return w(function() {
                        return x(this, function(e) {
                            var r, n, i;
                            return [2, (r = v(), n = p.catalogCategoryType, i = t, d.httpService.get(p.getSponsoredCatalogItems, {
                                count: r,
                                catalogCategoryType: n,
                                placementLocation: i
                            }))]
                        })
                    })()
                }, [v, t]),
                S = (0, i.useCallback)(function(e) {
                    return w(function() {
                        var t;
                        return x(this, function(r) {
                            var n;
                            return t = [], e.forEach(function(e) {
                                t.push({
                                    itemType: e.itemType,
                                    id: e.id
                                })
                            }), [2, (n = t, d.httpService.post(p.getCatalogItemsDetails, {
                                items: n
                            }))]
                        })
                    })()
                }, []),
                C = (0, i.useCallback)(function() {
                    g().then(function(e) {
                        c(e.data.data), S(e.data.data).then(function(e) {
                            f(e.data.data)
                        }).catch(function() {
                            f([])
                        })
                    }).catch(function() {
                        c([]), f([])
                    })
                }, [g, S]);
            if (void 0 === m && void 0 === o) return C(), (0, n.jsxs)("div", {
                className: "sponsored-catalog-items-container",
                id: "loading-sponsored-catalog-items",
                children: [(0, n.jsx)("div", {
                    className: "sponsored-catalog-items-loading-title shimmer"
                }), (0, n.jsx)("div", {
                    className: "sponsored-catalog-items-loading-row"
                }), (0, n.jsx)("div", {
                    className: "sponsored-catalog-items-row",
                    children: Array.from({
                        length: v()
                    }, function(e, t) {
                        return (0, n.jsxs)("div", {
                            className: "grid-item-container item-card item-card-loading",
                            children: [(0, n.jsx)("div", {
                                className: "item-card-thumb-container shimmer"
                            }), (0, n.jsxs)("div", {
                                className: "item-card-link",
                                children: [(0, n.jsx)("div", {
                                    className: "item-card-name shimmer"
                                }), (0, n.jsx)("div", {
                                    className: "item-card-name item-name-title-half shimmer"
                                })]
                            })]
                        }, t)
                    })
                })]
            });
            if (m && m.length > 0 && o && o.length > 0) {
                if ("ItemDetails" === t) return (0, n.jsxs)("div", {
                    className: "container-list sponsored-layer recommendations-container",
                    id: "populated-sponsored-catalog-items",
                    children: [(0, n.jsx)("div", {
                        className: "container-header recommendations-header",
                        children: (0, n.jsxs)("h2", {
                            children: [r("Label.Sponsored"), (0, n.jsx)(b, {
                                tooltipText: r("Label.SponsoredDisclosure") || "Sponsored items are paid for by Creators. They may be shown to you based on information like your device type, location, and demographics."
                            })]
                        })
                    }), (0, n.jsx)("div", {
                        className: "recommended-items-slider",
                        children: (0, n.jsx)("ul", {
                            className: "hlist item-cards recommended-items",
                            children: m.map(function(e, r) {
                                var i, a;
                                return (0, n.jsx)(h, {
                                    id: e.id,
                                    name: e.name,
                                    type: e.itemType,
                                    creatorName: e.creatorName,
                                    creatorType: e.creatorType,
                                    creatorTargetId: e.creatorTargetId,
                                    price: e.price || 0,
                                    lowestPrice: e.lowestPrice || -1,
                                    priceStatus: e.priceStatus,
                                    premiumPricing: (null == (i = e.premiumPricing) ? void 0 : i.premiumPriceInRobux) || -1,
                                    unitsAvailableForConsumption: e.unitsAvailableForConsumption || 0,
                                    itemStatus: e.itemStatus,
                                    itemRestrictions: e.itemRestrictions,
                                    thumbnail2d: (0, n.jsx)(u.Thumbnail2d, {
                                        type: l.ItemCardUtils.checkIfBundle(e.itemType) ? u.ThumbnailTypes.bundleThumbnail : u.ThumbnailTypes.assetThumbnail,
                                        targetId: e.id,
                                        size: u.DefaultThumbnailSize
                                    }),
                                    encryptedAdTrackingData: o[r].encryptedAdTrackingData,
                                    placementLocation: t,
                                    licenseType: null == (a = e.license) ? void 0 : a.licenseType
                                }, e.id)
                            })
                        })
                    })]
                });
                if ("AvatarShop" === t) return (0, n.jsxs)("div", {
                    className: "sponsored-catalog-items-container",
                    id: "populated-sponsored-catalog-items",
                    children: [(0, n.jsxs)("h2", {
                        className: "sponsored-catalog-items-row-title",
                        children: [r("Label.Sponsored"), (0, n.jsx)(b, {
                            tooltipText: r("Label.SponsoredDisclosure") || "Sponsored items are paid for by Creators. They may be shown to you based on information like your device type, location, and demographics."
                        })]
                    }), (0, n.jsx)("div", {
                        className: "sponsored-catalog-items-row",
                        children: (0, n.jsx)("div", {
                            className: "hlist item-cards-stackable",
                            children: m.map(function(e, r) {
                                var i, a;
                                return (0, n.jsx)(h, {
                                    id: e.id,
                                    name: e.name,
                                    type: e.itemType,
                                    creatorName: e.creatorName,
                                    creatorType: e.creatorType,
                                    creatorTargetId: e.creatorTargetId,
                                    price: e.price || 0,
                                    lowestPrice: e.lowestPrice || -1,
                                    priceStatus: e.priceStatus,
                                    premiumPricing: (null == (i = e.premiumPricing) ? void 0 : i.premiumPriceInRobux) || -1,
                                    unitsAvailableForConsumption: e.unitsAvailableForConsumption || 0,
                                    itemStatus: e.itemStatus,
                                    itemRestrictions: e.itemRestrictions,
                                    thumbnail2d: (0, n.jsx)(u.Thumbnail2d, {
                                        type: l.ItemCardUtils.checkIfBundle(e.itemType) ? u.ThumbnailTypes.bundleThumbnail : u.ThumbnailTypes.assetThumbnail,
                                        targetId: e.id,
                                        size: u.DefaultThumbnailSize
                                    }),
                                    encryptedAdTrackingData: o[r].encryptedAdTrackingData,
                                    placementLocation: t,
                                    licenseType: null == (a = e.license) ? void 0 : a.licenseType
                                }, e.id)
                            })
                        })
                    })]
                })
            }
            return (0, n.jsx)("div", {})
        }, {
            common: [""],
            feature: "Feature.GamePage"
        }),
        C = function(e) {
            var t = e.getAttribute("data-placement-location");
            return t ? t.toString() : ""
        };
    o()(function() {
        ! function e() {
            var t = document.getElementById("sponsored-catalog-items");
            t ? (0, c.renderWithErrorBoundary)((0, n.jsx)(S, {
                placementLocation: C(t)
            }), t) : window.requestAnimationFrame(e)
        }()
    }), window.Roblox.SponsoredCatalogItems = S
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("SponsoredCatalogItems");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/sponsoredCatalogItems-f39159d90b3b700c.js.map