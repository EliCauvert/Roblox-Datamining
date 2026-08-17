! function() {
    "use strict";
    var e = {
            n: function(t) {
                var a = t && t.__esModule ? function() {
                    return t.default
                } : function() {
                    return t
                };
                return e.d(a, {
                    a: a
                }), a
            },
            d: function(t, a) {
                for (var n in a) e.o(a, n) && !e.o(t, n) && Object.defineProperty(t, n, {
                    enumerable: !0,
                    get: a[n]
                })
            },
            o: function(e, t) {
                return Object.prototype.hasOwnProperty.call(e, t)
            }
        },
        t = React,
        a = e.n(t),
        n = CoreUtilities,
        r = ReactDOM,
        i = ReactUtilities,
        o = ReactStyleGuide,
        c = RobloxThumbnails,
        l = Roblox,
        s = {
            itemDetailsAdCount: 7,
            catalogCategoryType: "All",
            campaignTargetType: "Asset",
            getSponsoredCatalogItems: {
                url: l.EnvironmentUrls.catalogApi + "/v1/catalog/sponsored-items",
                retryable: !1,
                withCredentials: !0
            },
            getCatalogItemsDetails: {
                url: l.EnvironmentUrls.catalogApi + "/v1/catalog/items/details",
                retryable: !1,
                withCredentials: !0
            },
            recordClick: {
                url: l.EnvironmentUrls.adConfigurationApi + "/v2/tracking/click",
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
        u = {
            getSponsoredCatalogItems: function(e, t, a) {
                var r = {
                    count: e,
                    catalogCategoryType: t,
                    placementLocation: a
                };
                return n.httpService.get(s.getSponsoredCatalogItems, r)
            },
            getCatalogItemsDetails: function(e) {
                var t = {
                    items: e
                };
                return n.httpService.post(s.getCatalogItemsDetails, t)
            },
            recordClick: function(e, t) {
                var a = {
                    encryptedAdTrackingData: e,
                    campaignTargetType: s.campaignTargetType,
                    placementLocation: t
                };
                return n.httpService.post(s.recordClick, a)
            }
        },
        m = function(e, t, a, n) {
            return new(a || (a = Promise))((function(r, i) {
                function o(e) {
                    try {
                        l(n.next(e))
                    } catch (e) {
                        i(e)
                    }
                }

                function c(e) {
                    try {
                        l(n.throw(e))
                    } catch (e) {
                        i(e)
                    }
                }

                function l(e) {
                    var t;
                    e.done ? r(e.value) : (t = e.value, t instanceof a ? t : new a((function(e) {
                        e(t)
                    }))).then(o, c)
                }
                l((n = n.apply(e, t || [])).next())
            }))
        },
        d = function(e, t) {
            var a, n, r, i, o = {
                label: 0,
                sent: function() {
                    if (1 & r[0]) throw r[1];
                    return r[1]
                },
                trys: [],
                ops: []
            };
            return i = {
                next: c(0),
                throw: c(1),
                return: c(2)
            }, "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                return this
            }), i;

            function c(i) {
                return function(c) {
                    return function(i) {
                        if (a) throw new TypeError("Generator is already executing.");
                        for (; o;) try {
                            if (a = 1, n && (r = 2 & i[0] ? n.return : i[0] ? n.throw || ((r = n.return) && r.call(n), 0) : n.next) && !(r = r.call(n, i[1])).done) return r;
                            switch (n = 0, r && (i = [2 & i[0], r.value]), i[0]) {
                                case 0:
                                case 1:
                                    r = i;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: i[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, n = i[1], i = [0];
                                    continue;
                                case 7:
                                    i = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(r = o.trys, (r = r.length > 0 && r[r.length - 1]) || 6 !== i[0] && 2 !== i[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === i[0] && (!r || i[1] > r[0] && i[1] < r[3])) {
                                        o.label = i[1];
                                        break
                                    }
                                    if (6 === i[0] && o.label < r[1]) {
                                        o.label = r[1], r = i;
                                        break
                                    }
                                    if (r && o.label < r[2]) {
                                        o.label = r[2], o.ops.push(i);
                                        break
                                    }
                                    r[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            i = t.call(e, o)
                        } catch (e) {
                            i = [6, e], n = 0
                        } finally {
                            a = r = 0
                        }
                        if (5 & i[0]) throw i[1];
                        return {
                            value: i[0] ? i[1] : void 0,
                            done: !0
                        }
                    }([i, c])
                }
            }
        };

    function p(e) {
        var n = this,
            r = e.id,
            i = e.name,
            c = e.type,
            l = e.creatorName,
            s = e.creatorType,
            p = e.creatorTargetId,
            f = e.price,
            g = e.lowestPrice,
            h = e.priceStatus,
            v = e.premiumPricing,
            y = e.unitsAvailableForConsumption,
            b = e.itemStatus,
            T = e.itemRestrictions,
            S = e.thumbnail2d,
            w = e.encryptedAdTrackingData,
            C = e.placementLocation,
            I = (0, t.useCallback)((function() {
                return m(n, void 0, void 0, (function() {
                    return d(this, (function(e) {
                        return [2, u.recordClick(w, C)]
                    }))
                }))
            }), [w, C]);
        return a().createElement("div", {
            className: "sponsored-item-card",
            onClick: I,
            onKeyDown: I
        }, a().createElement(o.ItemCard, {
            id: r,
            name: i,
            type: c,
            creatorName: l,
            creatorType: s,
            creatorTargetId: p,
            price: f,
            lowestPrice: g,
            priceStatus: h,
            premiumPricing: v,
            unitsAvailableForConsumption: y,
            itemStatus: b,
            itemRestrictions: T,
            thumbnail2d: S
        }))
    }
    var f = {
            common: [""],
            feature: "Feature.GamePage"
        },
        g = function(e, t, a, n) {
            return new(a || (a = Promise))((function(r, i) {
                function o(e) {
                    try {
                        l(n.next(e))
                    } catch (e) {
                        i(e)
                    }
                }

                function c(e) {
                    try {
                        l(n.throw(e))
                    } catch (e) {
                        i(e)
                    }
                }

                function l(e) {
                    var t;
                    e.done ? r(e.value) : (t = e.value, t instanceof a ? t : new a((function(e) {
                        e(t)
                    }))).then(o, c)
                }
                l((n = n.apply(e, t || [])).next())
            }))
        },
        h = function(e, t) {
            var a, n, r, i, o = {
                label: 0,
                sent: function() {
                    if (1 & r[0]) throw r[1];
                    return r[1]
                },
                trys: [],
                ops: []
            };
            return i = {
                next: c(0),
                throw: c(1),
                return: c(2)
            }, "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                return this
            }), i;

            function c(i) {
                return function(c) {
                    return function(i) {
                        if (a) throw new TypeError("Generator is already executing.");
                        for (; o;) try {
                            if (a = 1, n && (r = 2 & i[0] ? n.return : i[0] ? n.throw || ((r = n.return) && r.call(n), 0) : n.next) && !(r = r.call(n, i[1])).done) return r;
                            switch (n = 0, r && (i = [2 & i[0], r.value]), i[0]) {
                                case 0:
                                case 1:
                                    r = i;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: i[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, n = i[1], i = [0];
                                    continue;
                                case 7:
                                    i = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(r = o.trys, (r = r.length > 0 && r[r.length - 1]) || 6 !== i[0] && 2 !== i[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === i[0] && (!r || i[1] > r[0] && i[1] < r[3])) {
                                        o.label = i[1];
                                        break
                                    }
                                    if (6 === i[0] && o.label < r[1]) {
                                        o.label = r[1], r = i;
                                        break
                                    }
                                    if (r && o.label < r[2]) {
                                        o.label = r[2], o.ops.push(i);
                                        break
                                    }
                                    r[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            i = t.call(e, o)
                        } catch (e) {
                            i = [6, e], n = 0
                        } finally {
                            a = r = 0
                        }
                        if (5 & i[0]) throw i[1];
                        return {
                            value: i[0] ? i[1] : void 0,
                            done: !0
                        }
                    }([i, c])
                }
            }
        },
        v = (0, i.withTranslations)((function(e) {
            var n = e.placementLocation,
                r = e.translate,
                i = (0, t.useState)(void 0),
                l = i[0],
                m = i[1],
                d = (0, t.useState)(void 0),
                f = d[0],
                v = d[1],
                y = (0, t.useCallback)((function() {
                    var e = 0;
                    switch (n) {
                        case "AvatarShop":
                            e = function() {
                                var e = window.innerWidth,
                                    t = s.sizing,
                                    a = 0;
                                if (e < t.screenSize1Item) a = 1;
                                else if (e < t.screenSize3Items) a = 3;
                                else if (e < t.screenSize4Items) a = 4;
                                else if (e < t.screenSize5Items) a = 5;
                                else if (e < t.screenSize6Items) a = 6;
                                else {
                                    var n = t.tileWidth,
                                        r = e - t.catalogLeftNav - t.websiteLeftNav - t.extraSpace;
                                    a = Math.floor(r / n)
                                }
                                return a
                            }();
                            break;
                        case "ItemDetails":
                            e = s.itemDetailsAdCount
                    }
                    return e
                }), [n]),
                b = (0, t.useCallback)((function() {
                    return g(void 0, void 0, void 0, (function() {
                        return h(this, (function(e) {
                            return [2, u.getSponsoredCatalogItems(y(), s.catalogCategoryType, n)]
                        }))
                    }))
                }), [y, n]),
                T = (0, t.useCallback)((function(e) {
                    return g(void 0, void 0, void 0, (function() {
                        var t;
                        return h(this, (function(a) {
                            return t = Array(), e.forEach((function(e) {
                                t.push({
                                    itemType: e.itemType,
                                    id: e.id
                                })
                            })), [2, u.getCatalogItemsDetails(t)]
                        }))
                    }))
                }), []),
                S = (0, t.useCallback)((function() {
                    b().then((function(e) {
                        m(e.data.data), T(e.data.data).then((function(e) {
                            v(e.data.data)
                        })).catch((function() {
                            v([])
                        }))
                    })).catch((function() {
                        m([]), v([])
                    }))
                }), [b, T]);
            if (void 0 === f && void 0 === l) return S(), a().createElement("div", {
                className: "sponsored-catalog-items-container",
                id: "loading-sponsored-catalog-items"
            }, a().createElement("div", {
                className: "sponsored-catalog-items-loading-title shimmer"
            }), a().createElement("div", {
                className: "sponsored-catalog-items-loading-row"
            }), a().createElement("div", {
                className: "sponsored-catalog-items-row"
            }, Array.from({
                length: y()
            }, (function(e, t) {
                return a().createElement("div", {
                    key: t,
                    className: "grid-item-container item-card item-card-loading"
                }, a().createElement("div", {
                    className: "item-card-thumb-container shimmer"
                }), a().createElement("div", {
                    className: "item-card-link"
                }, a().createElement("div", {
                    className: "item-card-name shimmer"
                }), a().createElement("div", {
                    className: "item-card-name item-name-title-half shimmer"
                })))
            }))));
            if (f && f.length > 0 && l && l.length > 0) {
                if ("ItemDetails" === n) return a().createElement(a().Fragment, null, a().createElement("div", {
                    className: "container-list sponsored-layer recommendations-container",
                    id: "populated-sponsored-catalog-items"
                }, a().createElement("div", {
                    className: "container-header recommendations-header"
                }, a().createElement("h2", null, r("Label.Sponsored"))), a().createElement("div", {
                    className: "recommended-items-slider"
                }, a().createElement("ul", {
                    className: "hlist item-cards recommended-items"
                }, f.map((function(e, t) {
                    var r;
                    return a().createElement(p, {
                        key: e.id,
                        id: e.id,
                        name: e.name,
                        type: e.itemType,
                        creatorName: e.creatorName,
                        creatorType: e.creatorType,
                        creatorTargetId: e.creatorTargetId,
                        price: e.price || 0,
                        lowestPrice: e.lowestPrice || -1,
                        priceStatus: e.priceStatus,
                        premiumPricing: (null === (r = e.premiumPricing) || void 0 === r ? void 0 : r.premiumPriceInRobux) || -1,
                        unitsAvailableForConsumption: e.unitsAvailableForConsumption || 0,
                        itemStatus: e.itemStatus,
                        itemRestrictions: e.itemRestrictions,
                        thumbnail2d: a().createElement(c.Thumbnail2d, {
                            type: o.ItemCardUtils.checkIfBundle(e.itemType) ? c.ThumbnailTypes.bundleThumbnail : c.ThumbnailTypes.assetThumbnail,
                            targetId: e.id,
                            size: c.DefaultThumbnailSize
                        }),
                        encryptedAdTrackingData: l[t].encryptedAdTrackingData,
                        placementLocation: n
                    })
                }))))));
                if ("AvatarShop" === n) return a().createElement(a().Fragment, null, a().createElement("div", {
                    className: "sponsored-catalog-items-container",
                    id: "populated-sponsored-catalog-items"
                }, a().createElement("h2", {
                    className: "sponsored-catalog-items-row-title"
                }, r("Label.Sponsored")), a().createElement("div", {
                    className: "sponsored-catalog-items-row"
                }, a().createElement("div", {
                    className: "hlist item-cards-stackable"
                }, f.map((function(e, t) {
                    var r;
                    return a().createElement(p, {
                        key: e.id,
                        id: e.id,
                        name: e.name,
                        type: e.itemType,
                        creatorName: e.creatorName,
                        creatorType: e.creatorType,
                        creatorTargetId: e.creatorTargetId,
                        price: e.price || 0,
                        lowestPrice: e.lowestPrice || -1,
                        priceStatus: e.priceStatus,
                        premiumPricing: (null === (r = e.premiumPricing) || void 0 === r ? void 0 : r.premiumPriceInRobux) || -1,
                        unitsAvailableForConsumption: e.unitsAvailableForConsumption || 0,
                        itemStatus: e.itemStatus,
                        itemRestrictions: e.itemRestrictions,
                        thumbnail2d: a().createElement(c.Thumbnail2d, {
                            type: o.ItemCardUtils.checkIfBundle(e.itemType) ? c.ThumbnailTypes.bundleThumbnail : c.ThumbnailTypes.assetThumbnail,
                            targetId: e.id,
                            size: c.DefaultThumbnailSize
                        }),
                        encryptedAdTrackingData: l[t].encryptedAdTrackingData,
                        placementLocation: n
                    })
                }))))))
            }
            return a().createElement("div", null)
        }), f),
        y = function(e) {
            var t = e.getAttribute("data-placement-location");
            return t ? t.toString() : ""
        };

    function b() {
        var e = document.getElementById("sponsored-catalog-items");
        e ? (0, r.render)(a().createElement(v, {
            placementLocation: y(e)
        }), e) : window.requestAnimationFrame(b)
    }(0, n.ready)((function() {
        b()
    })), window.Roblox.SponsoredCatalogItems = v
}();
//# sourceMappingURL=https://js.rbxcdn.com/ca1b1302a375948c1ac656d64185de1b-sponsoredCatalogItems.bundle.min.js.map

/* Bundle detector */
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("SponsoredCatalogItems");