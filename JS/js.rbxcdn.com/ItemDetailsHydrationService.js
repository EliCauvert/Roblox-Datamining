! function() {
    "use strict";
    var e, t = {},
        i = {};

    function r(e) {
        var n = i[e];
        if (void 0 !== n) return n.exports;
        var o = i[e] = {
            exports: {}
        };
        return t[e](o, o.exports, r), o.exports
    }
    r.n = function(e) {
        var t = e && e.__esModule ? function() {
            return e.default
        } : function() {
            return e
        };
        return r.d(t, {
            a: t
        }), t
    }, r.d = function(e, t) {
        for (var i in t) r.o(t, i) && !r.o(e, i) && Object.defineProperty(e, i, {
            enumerable: !0,
            get: t[i]
        })
    }, r.o = function(e, t) {
        return Object.prototype.hasOwnProperty.call(e, t)
    }, r.rv = function() {
        return "1.5.7"
    }, r.ruid = "bundler=rspack@1.5.7";
    var n = window.Roblox,
        o = r.n(n),
        l = window.CoreUtilities,
        c = {
            assetRootUrlTemplate: "catalog",
            bundleRootUrlTemplate: "bundles",
            getRecommendations: {
                url: "".concat(n.EnvironmentUrls.catalogApi, "/v2/recommendations/complement-assets"),
                retryable: !0,
                withCredentials: !0
            },
            postItemDetails: {
                url: "".concat(n.EnvironmentUrls.catalogApi, "/v1/catalog/items/details"),
                retryable: !0,
                withCredentials: !0
            },
            postCollectibleItemDetails: {
                url: "".concat(n.EnvironmentUrls.apiGatewayUrl, "/marketplace-items/v1/items/details"),
                retryable: !0,
                withCredentials: !0
            },
            getItemOwnershipUrl: function(e, t, i) {
                return "".concat(n.EnvironmentUrls.inventoryApi, "/v1/users/").concat(e, "/items/").concat(t, "/").concat(i, "/is-owned")
            }
        },
        a = ((e = {})[e.DETAILS_NOT_HYDRATED = 0] = "DETAILS_NOT_HYDRATED", e[e.DETAILS_LOADING = 1] = "DETAILS_LOADING", e[e.DETAILS_HYDRATED = 2] = "DETAILS_HYDRATED", e),
        s = window.CoreRobloxUtilities;

    function u(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var i = 0, r = Array(t); i < t; i++) r[i] = e[i];
        return r
    }
    var f = function(e, t) {
            return "ITEM_DETAILS_HYDRATION_".concat(t.toUpperCase(), "_").concat(e)
        },
        d = function(e) {
            return "ITEM_DETAILS_HYDRATION_".concat(e.toUpperCase(), "_TRACKING")
        },
        p = function(e) {
            var t = [];
            return s.localStorageService.setLocalStorage(d(e), t), t
        },
        m = function(e) {
            try {
                return s.localStorageService.getLocalStorage(d(e))
            } catch (e) {
                return
            }
        },
        v = function(e, t) {
            var i = m(e);
            null == i && (i = p(e)), i.push(t), s.localStorageService.setLocalStorage(d(e), i)
        },
        b = function(e, t) {
            try {
                return s.localStorageService.getLocalStorage(f(e, t))
            } catch (e) {
                return
            }
        },
        h = function(e, t, i) {
            if (!i) {
                var r = {};
                r.status = a.DETAILS_LOADING, r.lastModifiedTimestamp = Date.now(), s.localStorageService.setLocalStorage(f(e, t), r), v(t, e)
            }
        },
        y = function(e, t, i, r) {
            if (!r) {
                var n = {};
                n.status = a.DETAILS_HYDRATED, n.details = i, n.lastModifiedTimestamp = Date.now(), s.localStorageService.setLocalStorage(f(e, t), n), v(t, e)
            }
        },
        I = function(e) {
            var t = m(e),
                i = [];
            null != t && t.forEach(function(t) {
                var r = b(t, e);
                (null == r ? void 0 : r.lastModifiedTimestamp) === void 0 || Date.now() - (null == r ? void 0 : r.lastModifiedTimestamp) > 1e4 ? s.localStorageService.removeLocalStorage(f(t, e)) : i.push(t)
            }), s.localStorageService.setLocalStorage(d(e), i)
        },
        D = function() {
            I("asset"), I("bundle")
        },
        w = function(e) {
            return new Promise(function(t) {
                return setTimeout(function() {
                    return t(void 0)
                }, e)
            })
        },
        g = function(e, t) {
            if (!(e.itemRestrictions.includes("Limited") || e.itemRestrictions.includes("LimitedUnique"))) {
                if (e.collectibleItemId && t) {
                    if (e.itemRestrictions.includes("Collectible")) {
                        if (0 === t.unitsAvailableForConsumption || 0 === t.quantityLimitPerUser) return
                    } else if (0 !== t.quantityLimitPerUser) return t.quantityLimitPerUser
                }
                return 1
            }
        },
        T = function(e, t) {
            if (void 0 !== e) return t ? e - t.totalDiscountAmount : e
        },
        S = function(e, t) {
            if (!e.isOffSale && !(e.itemRestrictions.includes("Limited") || e.itemRestrictions.includes("LimitedUnique"))) {
                if (e.collectibleItemId && t) {
                    if (e.itemRestrictions.includes("Collectible")) {
                        if (void 0 !== e.collectibleItemId && e.itemRestrictions.includes("Collectible") && (0 === t.unitsAvailableForConsumption || t.lowestResalePrice && 0 !== t.lowestResalePrice && t.lowestResalePrice < t.price || "ExperiencesDevApiOnly" === t.saleLocationType)) {
                            if (0 === t.lowestResalePrice) return;
                            return t.lowestResalePrice
                        }
                        return t.price
                    }
                    if ("ExperiencesDevApiOnly" === t.saleLocationType) return;
                    return t.price
                }
                return T(e.price, e.discountInformation)
            }
        },
        O = function(e, t) {
            var i, r;
            return {
                purchasable: (i = e, r = t, !(i.isOffSale || (i.itemRestrictions.includes("Limited") || i.itemRestrictions.includes("LimitedUnique")) && !0 !== i.hasResellers || i.collectibleItemId && r && (void 0 === r || 0 === r.unitsAvailableForConsumption && !1 === r.hasResellers && i.itemRestrictions.includes("Collectible") || !(void 0 !== i.collectibleItemId && i.itemRestrictions.includes("Collectible") && !0 === r.hasResellers && (0 === r.unitsAvailableForConsumption || r.lowestResalePrice && 0 !== r.lowestResalePrice && r.lowestResalePrice < r.price || "ExperiencesDevApiOnly" === r.saleLocationType)) && "ExperiencesDevApiOnly" === r.saleLocationType)) && !i.isOffSale),
                ownershipLimit: g(e, t),
                purchasePrice: S(e, t),
                purchaseFromReseller: !!(e.itemRestrictions.includes("Limited") || e.itemRestrictions.includes("LimitedUnique")) || !!e.collectibleItemId && !!t && void 0 !== e.collectibleItemId && e.itemRestrictions.includes("Collectible") && !0 === t.hasResellers && (0 === t.unitsAvailableForConsumption || 0 !== t.lowestResalePrice && t.lowestResalePrice && t.lowestResalePrice < t.price || "ExperiencesDevApiOnly" === t.saleLocationType)
            }
        },
        A = function(e) {
            if (void 0 !== e.timedOptions && null !== e.timedOptions && 0 !== e.timedOptions.length) {
                var t, i = e.timedOptions,
                    r = e.discountInformation,
                    n = i.find(function(e) {
                        return e.selected
                    }),
                    o = {
                        days: 0,
                        price: null != (t = e.price) ? t : 0,
                        selected: !n
                    };
                return r && (o.discountInformation = r), [o].concat(function(e) {
                    if (Array.isArray(e)) return u(e)
                }(i) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(i) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return u(e, void 0);
                        var i = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === i && e.constructor && (i = e.constructor.name), "Map" === i || "Set" === i) return Array.from(i);
                        if ("Arguments" === i || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(i)) return u(e, t)
                    }
                }(i) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }())
            }
        };

    function R(e, t, i, r, n, o, l) {
        try {
            var c = e[o](l),
                a = c.value
        } catch (e) {
            i(e);
            return
        }
        c.done ? t(a) : Promise.resolve(a).then(r, n)
    }

    function L(e) {
        return function() {
            var t = this,
                i = arguments;
            return new Promise(function(r, n) {
                var o = e.apply(t, i);

                function l(e) {
                    R(o, r, n, l, c, "next", e)
                }

                function c(e) {
                    R(o, r, n, l, c, "throw", e)
                }
                l(void 0)
            })
        }
    }

    function E(e) {
        for (var t = 1; t < arguments.length; t++) {
            var i = null != arguments[t] ? arguments[t] : {},
                r = Object.keys(i);
            "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(i).filter(function(e) {
                return Object.getOwnPropertyDescriptor(i, e).enumerable
            }))), r.forEach(function(t) {
                var r;
                r = i[t], t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r
            })
        }
        return e
    }

    function P(e, t) {
        return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
            var i = Object.keys(e);
            if (Object.getOwnPropertySymbols) {
                var r = Object.getOwnPropertySymbols(e);
                i.push.apply(i, r)
            }
            return i
        })(Object(t)).forEach(function(i) {
            Object.defineProperty(e, i, Object.getOwnPropertyDescriptor(t, i))
        }), e
    }

    function _(e, t) {
        var i, r, n, o = {
                label: 0,
                sent: function() {
                    if (1 & n[0]) throw n[1];
                    return n[1]
                },
                trys: [],
                ops: []
            },
            l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return l.next = c(0), l.throw = c(1), l.return = c(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
            return this
        }), l;

        function c(c) {
            return function(a) {
                var s = [c, a];
                if (i) throw TypeError("Generator is already executing.");
                for (; l && (l = 0, s[0] && (o = 0)), o;) try {
                    if (i = 1, r && (n = 2 & s[0] ? r.return : s[0] ? r.throw || ((n = r.return) && n.call(r), 0) : r.next) && !(n = n.call(r, s[1])).done) return n;
                    switch (r = 0, n && (s = [2 & s[0], n.value]), s[0]) {
                        case 0:
                        case 1:
                            n = s;
                            break;
                        case 4:
                            return o.label++, {
                                value: s[1],
                                done: !1
                            };
                        case 5:
                            o.label++, r = s[1], s = [0];
                            continue;
                        case 7:
                            s = o.ops.pop(), o.trys.pop();
                            continue;
                        default:
                            if (!(n = (n = o.trys).length > 0 && n[n.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                o = 0;
                                continue
                            }
                            if (3 === s[0] && (!n || s[1] > n[0] && s[1] < n[3])) {
                                o.label = s[1];
                                break
                            }
                            if (6 === s[0] && o.label < n[1]) {
                                o.label = n[1], n = s;
                                break
                            }
                            if (n && o.label < n[2]) {
                                o.label = n[2], o.ops.push(s);
                                break
                            }
                            n[2] && o.ops.pop(), o.trys.pop();
                            continue
                    }
                    s = t.call(e, o)
                } catch (e) {
                    s = [6, e], r = 0
                } finally {
                    i = n = 0
                }
                if (5 & s[0]) throw s[1];
                return {
                    value: s[0] ? s[1] : void 0,
                    done: !0
                }
            }
        }
    }
    var C = function(e, t) {
            return L(function() {
                var i;
                return _(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (r.trys.push([0, 2, , 3]), t <= 0 || e.length <= 0) return [2, void 0];
                            return i = [], [4, Promise.resolve(l.httpService.post(c.postItemDetails, {
                                items: e
                            }))];
                        case 1:
                            if (r.sent().data.data.forEach(function(e) {
                                    i.push(P(E({}, e), {
                                        purchaseInfo: void 0 === e.collectibleItemId ? O(e, void 0) : void 0,
                                        timedOptions: A(e)
                                    }))
                                }), i.length === e.length) return [2, i];
                            return [3, 3];
                        case 2:
                            return r.sent(), [2, C(e, t - 1)];
                        case 3:
                            return [2, C(e, t - 1)]
                    }
                })
            })()
        },
        j = function(e, t) {
            return L(function() {
                var i, r, n;
                return _(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (i = [], r = [], e.forEach(function(e) {
                                    var t = b(e.id, e.itemType);
                                    void 0 !== t && t.status === a.DETAILS_HYDRATED ? i.push(t.details) : r.push(e)
                                }), !(r.length > 0 && t > 0)) return [3, 3];
                            return [4, w(500)];
                        case 1:
                            return o.sent(), [4, j(r, t - 1)];
                        case 2:
                            return (n = o.sent()).hydratedItemDetails = i.concat(n.hydratedItemDetails), [2, n];
                        case 3:
                            return [2, {
                                hydratedItemDetails: i,
                                nonHydratedItemDetails: r
                            }]
                    }
                })
            })()
        },
        U = function(e, t, i) {
            return L(function() {
                var r, n, o;
                return _(this, function(l) {
                    switch (l.label) {
                        case 0:
                            for (o = 0, r = function(i) {
                                    var r = t[i],
                                        o = e.find(function(e) {
                                            return e.collectibleItemId === r
                                        });
                                    if (o) {
                                        var l = b(o.id, o.itemType);
                                        l && void 0 === l.details.collectibleItemDetails && n.push(r)
                                    }
                                }, n = []; o < t.length; o++) r(o);
                            if (!(n.length > 0 && i > 0)) return [3, 3];
                            return [4, w(500)];
                        case 1:
                            return l.sent(), [4, U(e, n, i - 1)];
                        case 2:
                            l.sent(), l.label = 3;
                        case 3:
                            return [2]
                    }
                })
            })()
        };
    o().ItemDetailsHydrationService = {
        getItemDetails: function(e, t, i) {
            return L(function() {
                var r, n, o, s, u, f, d, p, m, v, I, w, g, T, S;
                return _(this, function(A) {
                    switch (A.label) {
                        case 0:
                            if (r = null != t && t, D(), n = [], o = [], s = [], e.forEach(function(e) {
                                    var t = b(e.id, e.itemType);
                                    null == t ? (o.push(e), h(e.id, e.itemType, r)) : t.status === a.DETAILS_LOADING || t.status === a.DETAILS_NOT_HYDRATED ? Date.now() - t.lastModifiedTimestamp > 1e3 ? (o.push(e), h(e.id, e.itemType, r)) : s.push(e) : Date.now() - t.lastModifiedTimestamp > 1e4 ? (o.push(e), h(e.id, e.itemType, r)) : n.push(t.details)
                                }), !(o.length > 0)) return [3, 2];
                            return [4, Promise.resolve(C(o, 3))];
                        case 1:
                            void 0 !== (u = A.sent()) && u.forEach(function(e) {
                                y(e.id, e.itemType, e, r), n.push(e)
                            }), A.label = 2;
                        case 2:
                            return [4, j(s, 3)];
                        case 3:
                            if ((f = A.sent()).hydratedItemDetails.forEach(function(e) {
                                    n.push(e)
                                }), !(f.nonHydratedItemDetails.length > 0)) return [3, 5];
                            return [4, Promise.resolve(C(s, 3))];
                        case 4:
                            void 0 !== (d = A.sent()) && d.forEach(function(e) {
                                y(e.id, e.itemType, e, r), n.push(e)
                            }), A.label = 5;
                        case 5:
                            if (p = [], m = [], n.forEach(function(e) {
                                    var t = b(e.id, e.itemType),
                                        i = null == t ? void 0 : t.details;
                                    if ((null == i ? void 0 : i.collectibleItemId) && void 0 === i.collectibleItemDetails)
                                        if (i.collectibleItemDetailsLoading) m.push(i.collectibleItemId);
                                        else {
                                            var n = P(E({}, i), {
                                                collectibleItemDetailsLoading: !0
                                            });
                                            y(n.id, n.itemType, n, r), p.push(i.collectibleItemId)
                                        }
                                }), !(p.length > 0 && i)) return [3, 7];
                            return v = function(e) {
                                var t = I.data[e],
                                    i = n.find(function(e) {
                                        return e.collectibleItemId === t.collectibleItemId
                                    });
                                void 0 !== i && (t.purchaseInfo = O(i, t), i.collectibleItemDetails = t, y(i.id, i.itemType, i, r))
                            }, [4, Promise.resolve(l.httpService.post(c.postCollectibleItemDetails, {
                                itemIds: p
                            }))];
                        case 6:
                            for (w = 0, I = A.sent(); w < I.data.length; w++) v(w);
                            A.label = 7;
                        case 7:
                            return [4, U(n, m, 5)];
                        case 8:
                            for (A.sent(), g = 0; g < n.length; g++)(S = b((T = n[g]).id, T.itemType)) && (T.collectibleItemDetails = S.details.collectibleItemDetails);
                            return [2, n]
                    }
                })
            })()
        }
    }
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("ItemDetailsHydrationService");
//# debugId=14a919c4-5391-4912-abce-5199184b90ae
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/itemDetailsHydrationService-cd7edf473694619f.js.map