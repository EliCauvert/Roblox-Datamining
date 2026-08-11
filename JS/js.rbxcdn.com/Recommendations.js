! function() {
    var e = {
            3422: function(e, t, n) {
                var a = {
                    "./recommendationsComponent.js": 81
                };

                function r(e) {
                    var t = i(e);
                    return n(t)
                }

                function i(e) {
                    if (!n.o(a, e)) {
                        var t = new Error("Cannot find module '" + e + "'");
                        throw t.code = "MODULE_NOT_FOUND", t
                    }
                    return a[e]
                }
                r.keys = function() {
                    return Object.keys(a)
                }, r.resolve = i, e.exports = r, r.id = 3422
            },
            3543: function(e, t, n) {
                var a = {
                    "./carouselForItemDetailsConstants.js": 7700,
                    "./carsouselForAvatarPageConstants.js": 802,
                    "./carsouselForInventoryConstants.js": 760,
                    "./experimentConstants.js": 8457,
                    "./itemListConstants.js": 297,
                    "./recommendationsConstants.js": 3196
                };

                function r(e) {
                    var t = i(e);
                    return n(t)
                }

                function i(e) {
                    if (!n.o(a, e)) {
                        var t = new Error("Cannot find module '" + e + "'");
                        throw t.code = "MODULE_NOT_FOUND", t
                    }
                    return a[e]
                }
                r.keys = function() {
                    return Object.keys(a)
                }, r.resolve = i, e.exports = r, r.id = 3543
            },
            611: function(e, t, n) {
                var a = {
                    "./itemListController.js": 8322,
                    "./recommendationsController.js": 3906
                };

                function r(e) {
                    var t = i(e);
                    return n(t)
                }

                function i(e) {
                    if (!n.o(a, e)) {
                        var t = new Error("Cannot find module '" + e + "'");
                        throw t.code = "MODULE_NOT_FOUND", t
                    }
                    return a[e]
                }
                r.keys = function() {
                    return Object.keys(a)
                }, r.resolve = i, e.exports = r, r.id = 611
            },
            2908: function(e, t, n) {
                var a = {
                    "./itemListDirective.js": 8798
                };

                function r(e) {
                    var t = i(e);
                    return n(t)
                }

                function i(e) {
                    if (!n.o(a, e)) {
                        var t = new Error("Cannot find module '" + e + "'");
                        throw t.code = "MODULE_NOT_FOUND", t
                    }
                    return a[e]
                }
                r.keys = function() {
                    return Object.keys(a)
                }, r.resolve = i, e.exports = r, r.id = 2908
            },
            8122: function(e, t, n) {
                var a = {
                    "./creatorNameUtilities.js": 8162,
                    "./experimentationService.js": 8369,
                    "./itemsListLayoutService.js": 1443,
                    "./itemsListService.js": 6845,
                    "./recommendationsService.js": 4997
                };

                function r(e) {
                    var t = i(e);
                    return n(t)
                }

                function i(e) {
                    if (!n.o(a, e)) {
                        var t = new Error("Cannot find module '" + e + "'");
                        throw t.code = "MODULE_NOT_FOUND", t
                    }
                    return a[e]
                }
                r.keys = function() {
                    return Object.keys(a)
                }, r.resolve = i, e.exports = r, r.id = 8122
            },
            935: function(e, t, n) {
                var a = {
                    "./components/templates/recommendations.html": 8560,
                    "./directives/templates/itemList.html": 2587
                };

                function r(e) {
                    var t = i(e);
                    return n(t)
                }

                function i(e) {
                    if (!n.o(a, e)) {
                        var t = new Error("Cannot find module '" + e + "'");
                        throw t.code = "MODULE_NOT_FOUND", t
                    }
                    return a[e]
                }
                r.keys = function() {
                    return Object.keys(a)
                }, r.resolve = i, e.exports = r, r.id = 935
            },
            7525: function(e) {
                function t(e) {
                    return e.replace(/([a-z])([A-Z])/g, "$1-$2").toLowerCase()
                }

                function n(e) {
                    return e.split("/").pop().replace(".html", "")
                }
                var a = {
                    importFilesUnderPath: function(e) {
                        e.keys().forEach(e)
                    },
                    templateCacheGenerator: function(e, a, r, i) {
                        return e.module(a, []).run(["$templateCache", function(e) {
                            r && r.keys().forEach((function(a) {
                                var i = t(n(a));
                                e.put(i, r(a))
                            })), i && i.keys().forEach((function(a) {
                                var r = t(n(a));
                                e.put(r, i(a).replace(/<\/?script[^>]*>/gi, ""))
                            }))
                        }])
                    }
                };
                e.exports = a
            },
            81: function(e, t, n) {
                "use strict";
                n.r(t);
                var a = {
                    templateUrl: "recommendations",
                    bindings: {
                        recommendationTargetId: "<?",
                        recommendationType: "<",
                        recommendationSubtype: "<?",
                        recommendationItemtypes: "<?",
                        itemCreator: "<?",
                        pageName: "@",
                        showSeeAllButton: "<?"
                    },
                    controller: "recommendationsController"
                };
                n(8359).A.component("recommendations", a), t.default = a
            },
            7700: function(e, t, n) {
                "use strict";
                n.r(t);
                var a = {
                    options: {
                        breakpoints: {
                            479: {
                                perView: 2.5
                            },
                            766: {
                                perView: 4.5
                            },
                            1023: {
                                perView: 6.5
                            }
                        }
                    },
                    breakpointWidth: [479, 766, 1023],
                    glideControl: {
                        defaultNumItemsToMove: 6.5,
                        currentNumSlidesToMove: 6,
                        currentPageNumber: 0,
                        startAt: 0,
                        disableLeftMove: !1,
                        disableRightMove: !1
                    }
                };
                n(8359).A.constant("carouselForItemDetails", a), t.default = a
            },
            802: function(e, t, n) {
                "use strict";
                n.r(t);
                var a = {
                    options: {
                        breakpoints: {
                            479: {
                                perView: 4.5
                            },
                            766: {
                                perView: 4.5
                            },
                            1023: {
                                perView: 4.5
                            }
                        }
                    },
                    breakpointWidth: [479, 766, 1023],
                    glideControl: {
                        defaultNumItemsToMove: 4.5,
                        currentNumSlidesToMove: 4,
                        currentPageNumber: 0,
                        startAt: 0,
                        disableLeftMove: !1,
                        disableRightMove: !1
                    }
                };
                n(8359).A.constant("carouselForAvatarPage", a), t.default = a
            },
            760: function(e, t, n) {
                "use strict";
                n.r(t);
                var a = {
                    options: {
                        breakpoints: {
                            479: {
                                perView: 2.5
                            },
                            766: {
                                perView: 4.5
                            },
                            1023: {
                                perView: 5.5
                            }
                        }
                    },
                    breakpointWidth: [479, 766, 1023],
                    glideControl: {
                        defaultNumItemsToMove: 5.5,
                        currentNumSlidesToMove: 5,
                        currentPageNumber: 0,
                        startAt: 0,
                        disableLeftMove: !1,
                        disableRightMove: !1
                    }
                };
                n(8359).A.constant("carouselForInventory", a), t.default = a
            },
            8457: function(e, t, n) {
                "use strict";
                n.r(t);
                var a = n(7577),
                    r = a.EnvironmentUrls.apiGatewayUrl,
                    i = {
                        getExperimentationValues: function(e, t, n) {
                            return {
                                url: "".concat(r, "/product-experimentation-platform/v1/projects/").concat(e, "/layers/").concat(t, "/values?parameters=").concat(n.join(",")),
                                withCredentials: !0
                            }
                        }
                    };
                t.default = {
                    url: i,
                    parameterNames: {
                        recommendationNumRows: ["recommendationNumRows", "recommendationPageName"],
                        complimentaryItemRecommendationsEnabled: ["complimentaryItemRecommendationsEnabled", "displayPurchaseButtonLeft"],
                        avatarMarketplaceRelevanceRecommendations: ["recommendationNumRows"],
                        avatarMarketplaceEditor: ["recommendationNumRows"]
                    },
                    layerNames: {
                        avatarShopPage: "AvatarMarketplace.UI",
                        avatarShopRecommendationsAndSearchWeb: "AvatarMarketplace.RecommendationsAndSearch.Web",
                        avatarMarketplaceRelevanceRecommendations: "AvatarMarketplace.RelevanceRecommendations",
                        avatarMarketplaceEditor: "AvatarMarketplace.Editor"
                    },
                    defaultProjectId: 1
                }
            },
            297: function(e, t, n) {
                "use strict";
                n.r(t);
                var a = n(7577),
                    r = n(8359),
                    i = {
                        robloxId: 1,
                        assetTypes: {
                            hat: 8,
                            hairAccessory: 41,
                            faceAccessory: 42,
                            neckAccessory: 43,
                            shoulderAccessory: 44,
                            frontAccessory: 45,
                            backAccessory: 46,
                            waistAccessory: 47,
                            gear: 19
                        },
                        moreByCreatorVariation: 1,
                        endpoints: {
                            getSearchItems: {
                                url: "".concat(a.EnvironmentUrls.catalogApi, "/v1/search/items"),
                                withCredentials: !0,
                                retryable: !0
                            },
                            getItemDetails: {
                                url: "".concat(a.EnvironmentUrls.catalogApi, "/v1/catalog/items/details"),
                                withCredentials: !0,
                                retryable: !0
                            },
                            enrollment: {
                                url: "".concat(a.EnvironmentUrls.abtestingApiSite, "/v1/enrollments"),
                                withCredentials: !0
                            }
                        },
                        searchByCreatorParams: {
                            creatorTargetId: null,
                            createType: null,
                            sortType: "Sales",
                            limit: 10
                        },
                        priceStatus: {
                            free: "Free",
                            noResellers: "NoResellers"
                        },
                        userTypes: {
                            1: "User",
                            2: "Group"
                        },
                        systemRobloxId: 1,
                        templateUrls: {
                            itemList: "item-list"
                        },
                        itemTypes: {
                            bundle: "Bundle",
                            asset: "Asset"
                        },
                        itemRestrictionTypes: {
                            thirteenPlus: "ThirteenPlus",
                            limitedUnique: "LimitedUnique",
                            limited: "Limited",
                            rthro: "Rthro",
                            dynamicHead: "Live",
                            collectible: "Collectible"
                        },
                        itemRestrictionIcons: {
                            thirteenPlus: "icon-thirteen-plus-label",
                            limited: "icon-limited-label",
                            limitedUnique: "icon-limited-unique-label",
                            thirteenPlusLimited: "icon-thirteen-plus-limited-label",
                            thirteenPlusLimitedUnique: "icon-thirteen-plus-limited-unique-label",
                            rthroLabel: "icon-rthro-label",
                            rthroLimitedLabel: "icon-rthro-limited-label",
                            dynamicHead: "",
                            collectible: "icon-limited-unique-label"
                        }
                    };
                r.A.constant("itemListConstants", i), t.default = i
            },
            3196: function(e, t, n) {
                "use strict";
                n.r(t);
                var a = {
                    recommendationTypes: {
                        asset: 0,
                        bundle: 2
                    },
                    seeAllRecommendationLinks: {
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
                    },
                    recommendationSubtypeOverrides: [{
                        assetTypes: [70, 71],
                        subject: "user-inventory",
                        newType: 2,
                        newSubtype: 3
                    }],
                    shoeAssetTypes: [70, 71],
                    shoeBundleType: 3,
                    recommendationSubtypes: {
                        gamePasses: 21,
                        badges: 34
                    },
                    assetTypes: {
                        places: 9
                    },
                    urls: {
                        catalog: "/catalog",
                        catalogBundle: "/catalog?Category=17"
                    },
                    pageNames: {
                        avatar: "Avatar",
                        catalogItem: "CatalogItem",
                        bundleDetails: "BundleDetail",
                        inventory: "Inventory",
                        favorites: "Favorites"
                    },
                    carouselSelector: "#recommendation-carousel-container",
                    assetRootUrlTemplate: "catalog",
                    bundleRootUrlTemplate: "bundles",
                    complimentaryItemRecommendationsSupportedPages: ["CatalogItem"],
                    itemTypes: {
                        asset: "assets",
                        bundle: "bundles"
                    }
                };
                n(8359).A.constant("recommendationsConstants", a), t.default = a
            },
            8322: function(e, t, n) {
                "use strict";
                n.r(t);
                var a = n(8359);

                function r(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var a = Object.getOwnPropertySymbols(e);
                        t && (a = a.filter((function(t) {
                            return Object.getOwnPropertyDescriptor(e, t).enumerable
                        }))), n.push.apply(n, a)
                    }
                    return n
                }

                function i(e, t, n) {
                    return t in e ? Object.defineProperty(e, t, {
                        value: n,
                        enumerable: !0,
                        configurable: !0,
                        writable: !0
                    }) : e[t] = n, e
                }

                function o(e, t, n, a, o) {
                    e.getItemListAndDetails = function() {
                        n.getItemList(e.itemCreator).then((function(t) {
                            t && t.data && (e.items = t.data.slice(0, 7), n.getItemDetails(e.items).then((function(t) {
                                t && t.data && t.data.forEach((function(t) {
                                    var n = t.id;
                                    e.items.some((function(e) {
                                        e.id === n && Object.assign(e, t)
                                    }))
                                }))
                            })))
                        })).finally((function() {
                            e.itemListLayout.isItemListDetailsLoaded = !0
                        }))
                    }, e.isItemListDetailsAvailable = function() {
                        return e.itemListLayout.isItemListDetailsLoaded && e.items && e.items.length > 0
                    }, e.isItemListDetailsEmpty = function() {
                        return e.itemListLayout.isItemListDetailsLoaded && e.items && 0 === e.items.length
                    }, e.initializeLayout = function() {
                        e.itemListLayout = function(e) {
                            for (var t = 1; t < arguments.length; t++) {
                                var n = null != arguments[t] ? arguments[t] : {};
                                t % 2 ? r(Object(n), !0).forEach((function(t) {
                                    i(e, t, n[t])
                                })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(n)) : r(Object(n)).forEach((function(t) {
                                    Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(n, t))
                                }))
                            }
                            return e
                        }({}, o.itemListLayout);
                        var t = e.itemCreator.Name;
                        e.itemListLayout.heading = o.itemListHeading(t), e.itemListLayout.seeMoreLink = o.getSeeMoreLink(t, e.itemCreator.Type)
                    }, e.initializeLayout(), e.getItemListAndDetails()
                }
                o.$inject = ["$scope", "$log", "itemsListService", "itemListConstants", "itemsListLayoutService"], a.A.controller("itemListController", o), t.default = o
            },
            3906: function(e, t, n) {
                "use strict";
                n.r(t), n.d(t, {
                    default: function() {
                        return s
                    }
                });
                var a = RobloxBadges,
                    r = n(8359),
                    i = n(8457);

                function o(e, t, n, r, o, s, c, l, m, d) {
                    var u = this,
                        p = {
                            currentPageName: null,
                            isMetaDataLoaded: !1
                        };

                    function g() {
                        var e = u.recommendationTargetId,
                            t = u.subject,
                            a = u.pageName;
                        n.complimentaryItemRecommendationsSupportedPages.includes(a) && m.getABTestEnrollment(i.default.defaultProjectId, i.default.layerNames.avatarShopRecommendationsAndSearchWeb, i.default.parameterNames.complimentaryItemRecommendationsEnabled).then((function(a) {
                            void 0 !== (null == a ? void 0 : a.complimentaryItemRecommendationsEnabled) && null !== (null == a ? void 0 : a.complimentaryItemRecommendationsEnabled) && (u.complimentaryItemRecommendations.enabled = null == a ? void 0 : a.complimentaryItemRecommendationsEnabled, u.complimentaryItemRecommendations.enabled && (u.complimentaryItemRecommendations.targetId = e, u.complimentaryItemRecommendations.isBundle = t === n.itemTypes.bundle, u.complimentaryItemRecommendations.displayPurchaseButtonLeft = a.displayPurchaseButtonLeft, window.dispatchEvent(new CustomEvent("complimentary-items:render", {
                                detail: {
                                    targetId: u.complimentaryItemRecommendations.targetId,
                                    isBundle: u.complimentaryItemRecommendations.isBundle,
                                    displayPurchaseButtonLeft: u.complimentaryItemRecommendations.displayPurchaseButtonLeft
                                }
                            }))))
                        }), (function() {}))
                    }
                    u.recommendationNumRows = 1, u.complimentaryItemRecommendations = {
                        enabled: !1,
                        targetId: void 0,
                        isBundle: !1
                    }, u.dismissPlaceholderForRecommendation = function() {
                        e.isPlaceholderOff = !0, e.isRecommendationsLoaded = !0;
                        try {
                            (0, a.initRobloxBadgesFrameworkAgnostic)({
                                overrideIconClass: "verified-badge-icon-item-recommendations"
                            })
                        } catch (e) {}
                    }, u.showFrontendBasedResellersComponent = function() {
                        return "BundleDetail" === u.pageName
                    }, u.isBundle = function() {
                        return "BundleDetail" === u.pageName
                    };
                    var y = function() {
                        var e = u.recommendationSubtype,
                            a = u.recommendationType,
                            o = u.recommendationItemtypes,
                            c = u.pageName;
                        t.overrideRecommendationTypes(o), t.isRecommendationAllowed(a, e) ? p.currentPageName !== c ? (u.absoluteCatalogUrl = s.getAbsoluteUrl(n.urls.catalog), u.recommendationTargetId || (u.recommendationTargetId = 0), p.currentPageName = c, t.getRecommendationMetadata(c).then((function(e) {
                            Object.assign(u, e), t.getCatalogMetadata().then((function(e) {
                                p.isPremiumIconOnItemTilesEnabled = e.isPremiumIconOnItemTilesEnabled, p.isPremiumPriceOnItemTilesEnabled = e.isPremiumPriceOnItemTilesEnabled, p.isMetaDataLoaded = !0, g(), m.getABTestEnrollment(i.default.defaultProjectId, i.default.layerNames.avatarMarketplaceRelevanceRecommendations, i.default.parameterNames.avatarMarketplaceRelevanceRecommendations).then((function(e) {}), (function() {})), u.numberOfItems && m.getABTestEnrollment(i.default.defaultProjectId, i.default.layerNames.avatarShopPage, i.default.parameterNames.recommendationNumRows).then((function(e) {
                                    void 0 !== (null == e ? void 0 : e.recommendationPageName) && null !== (null == e ? void 0 : e.recommendationPageName) && void 0 !== (null == e ? void 0 : e.recommendationNumRows) && null !== (null == e ? void 0 : e.recommendationNumRows) && e.recommendationPageName.length > 0 && e.recommendationPageName.includes(c) && (u.recommendationNumRows = e.recommendationNumRows)
                                }), (function() {})).finally((function() {
                                    u.getItems()
                                }))
                            }), (function() {
                                r.debug(" ------ getCatalogMetadata error -------"), u.dismissPlaceholderForRecommendation()
                            }))
                        }), (function() {
                            r.debug(" ------ getRecommendationsMetadata error -------"), u.dismissPlaceholderForRecommendation()
                        }))) : p.isMetaDataLoaded && u.numberOfItems && u.getItems() : u.clearItems(), u.dismissPlaceholderForRecommendation()
                    };

                    function f(e) {
                        return void 0 !== e.premiumPrice && null !== e.premiumPrice
                    }
                    u.clearItems = function() {
                        u.items = []
                    }, u.getItems = function() {
                        u.items = [];
                        var e = u.recommendationType,
                            a = u.recommendationSubtype,
                            i = u.recommendationTargetId,
                            o = u.numberOfItems,
                            s = u.subject,
                            c = u.recommendationNumRows;
                        n.recommendationSubtypeOverrides.forEach((function(t) {
                            t.assetTypes.includes(a) && t.subject === s && (a = t.newSubtype, e = t.newType)
                        })), t.beginUpdateRecommendedItems(i, e, a, o * c, s).then((function(e) {
                            u.items = e
                        }), (function() {
                            r.debug(" ------ beginUpdateRecommendedItems error -------")
                        })).finally((function() {
                            u.dismissPlaceholderForRecommendation()
                        }))
                    }, u.showVerifiedBadge = function(e) {
                        return e && e.creatorHasVerifiedBadge
                    }, u.isNotExperienceOnlySaleLocationWithNoResellers = function(e) {
                        return "ExperiencesDevApiOnly" !== e.saleLocationType || e.hasResellers
                    }, u.getDisplayPrice = function(e) {
                        return p.isPremiumPriceOnItemTilesEnabled && f(e) ? e.premiumPrice : e.lowestPrice ? e.lowestPrice : e.price
                    }, u.shouldShowPremiumIcon = function(e) {
                        return p.isPremiumIconOnItemTilesEnabled && f(e)
                    }, u.getSeeAllLink = function() {
                        var e = n.seeAllRecommendationLinks,
                            t = u.recommendationType;
                        return void 0 === t && (t = 0), void 0 !== e[t] && void 0 !== e[t][u.recommendationSubtype] ? e[t][u.recommendationSubtype] : u.absoluteCatalogUrl
                    };
                    u.$onInit = function() {
                        y(), u.isMoreByCreatorEnabled = u.itemCreator && Object.prototype.hasOwnProperty.call(u.itemCreator, "Id"), d.itemCreator = u.itemCreator
                    }, d.$watch((function() {
                        return {
                            recommendationType: u.recommendationType,
                            recommendationSubtype: u.recommendationSubtype
                        }
                    }), (function(e, t) {
                        ("number" == typeof t.recommendationType && e.recommendationType !== t.recommendationType || "number" == typeof t.recommendationSubtype && e.recommendationSubtype !== t.recommendationSubtype) && y()
                    }), !0)
                }
                o.$inject = ["$rootScope", "recommendationsService", "recommendationsConstants", "$log", "itemsListService", "urlService", "itemListConstants", "itemsListLayoutService", "experimentationService", "$scope"], r.A.controller("recommendationsController", o);
                var s = o
            },
            8798: function(e, t, n) {
                "use strict";
                n.r(t);
                var a = n(8359);

                function r(e) {
                    return {
                        restrict: "A",
                        scope: !0,
                        templateUrl: e.templateUrls.itemList
                    }
                }
                r.$inject = ["itemListConstants"], a.A.directive("itemList", r), t.default = r
            },
            8359: function(e, t, n) {
                "use strict";
                var a = n(127),
                    r = n.n(a),
                    i = n(7577),
                    o = r().module("recommendations", ["robloxApp", "thumbnails", "recommendationsAppTemplates", "resellers"]).config(["languageResourceProvider", function(e) {
                        var t = (new i.TranslationResourceProvider).getTranslationResource("Feature.Recommendations");
                        e.setTranslationResources([t])
                    }]);
                t.A = o
            },
            8162: function(e, t, n) {
                "use strict";
                n.r(t), n.d(t, {
                    default: function() {
                        return s
                    }
                });
                var a = ReactStyleGuide,
                    r = n(1260),
                    i = n(8359);

                function o(e, t) {
                    return {
                        mapItemRestrictionIcons: function(e) {
                            e && e.itemRestrictions && Object.assign(e, a.ItemCardUtils.mapItemRestrictionIcons(e.itemRestrictions, e.itemType))
                        },
                        getNameForDisplay: function(n) {
                            var a = t.userTypes,
                                i = t.systemRobloxId,
                                o = n.name,
                                s = n.creatorType,
                                c = n.creatorId;
                            return a[1] === s && i !== c ? r.concatTexts.concat(["", e("escapeHtml")(o)]) : e("escapeHtml")(o)
                        }
                    }
                }
                o.$inject = ["$filter", "itemListConstants"], i.A.factory("creatorNameUtilities", o);
                var s = o
            },
            8369: function(e, t, n) {
                "use strict";
                n.r(t);
                n(1260);
                var a = n(7577);
                n(8457);

                function r() {
                    return {
                        getABTestEnrollment: function(e, t, n) {
                            var r = a.ExperimentationService.getAllValuesForLayer(t);
                            return r.then((function() {
                                a.ExperimentationService.logLayerExposure(t)
                            })), r
                        }
                    }
                }
                n(8359).A.factory("experimentationService", r), t.default = r
            },
            1443: function(e, t, n) {
                "use strict";
                n.r(t);
                var a = n(7577),
                    r = n(8359);

                function i(e, t, n) {
                    var r = n;
                    return {
                        itemListLayout: {
                            seeMoreLabel: r.get("Action.SeeMore"),
                            isItemListDetailsLoaded: !1
                        },
                        itemListHeading: function(e) {
                            return r.get("Heading.MoreByUsers", {
                                username: e
                            })
                        },
                        getSeeMoreLink: function(t, n) {
                            var r = e.userTypes[n];
                            return a.Endpoints.getAbsoluteUrl("/catalog/?Category=13&CreatorName=".concat(t, "&CreatorType=").concat(r))
                        }
                    }
                }
                i.$inject = ["itemListConstants", "httpService", "languageResource"], r.A.factory("itemsListLayoutService", i), t.default = i
            },
            6845: function(e, t, n) {
                "use strict";
                n.r(t);
                var a = n(7577),
                    r = (n(127), n(8359));

                function i(e, t) {
                    var n = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var a = Object.getOwnPropertySymbols(e);
                        t && (a = a.filter((function(t) {
                            return Object.getOwnPropertyDescriptor(e, t).enumerable
                        }))), n.push.apply(n, a)
                    }
                    return n
                }

                function o(e, t, n) {
                    return t in e ? Object.defineProperty(e, t, {
                        value: n,
                        enumerable: !0,
                        configurable: !0,
                        writable: !0
                    }) : e[t] = n, e
                }

                function s(e, t, n, r) {
                    function s(t) {
                        return t && t.data && t.data.forEach((function(t) {
                            Object.assign(t, function(t) {
                                var i = t.id,
                                    o = t.name,
                                    s = t.price,
                                    c = t.creatorTargetId,
                                    l = t.creatorName,
                                    m = t.creatorType,
                                    d = t.productId,
                                    u = t.priceStatus;
                                return {
                                    id: i,
                                    name: o,
                                    price: s,
                                    absoluteUrl: a.Endpoints.getAbsoluteUrl("/catalog/".concat(i, "/catalogname")),
                                    creator: {
                                        id: c,
                                        name: l,
                                        nameForDisplay: r("escapeHtml")(l),
                                        type: m,
                                        profileLink: a.Endpoints.getAbsoluteUrl("/users/".concat(c, "/profile"))
                                    },
                                    thumbnail: {
                                        type: n.thumbnailTypes.assetThumbnail
                                    },
                                    product: {
                                        id: d,
                                        noPriceText: u,
                                        isFree: u === e.priceStatus.free
                                    }
                                }
                            }(t))
                        })), t
                    }
                    return {
                        isMoreByCreatorAvailable: function(t, n) {
                            var r = Object.values(e.assetTypes);
                            return a.CurrentUser.isAuthenticated && r.indexOf(t) > -1 && n !== e.robloxId
                        },
                        enrollAbTesting: function(n) {
                            var r = [{
                                SubjectType: "User",
                                SubjectTargetId: a.CurrentUser.userId,
                                ExperimentName: n
                            }];
                            return t.httpPost(e.endpoints.enrollment, r)
                        },
                        getItemList: function(n) {
                            var a = function(e) {
                                for (var t = 1; t < arguments.length; t++) {
                                    var n = null != arguments[t] ? arguments[t] : {};
                                    t % 2 ? i(Object(n), !0).forEach((function(t) {
                                        o(e, t, n[t])
                                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(n)) : i(Object(n)).forEach((function(t) {
                                        Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(n, t))
                                    }))
                                }
                                return e
                            }({}, e.searchByCreatorParams);
                            return a.creatorTargetId = n.Id, a.createType = n.Type, t.httpGet(e.endpoints.getSearchItems, a)
                        },
                        getItemDetails: function(n) {
                            var a = {
                                items: n
                            };
                            return t.httpPost(e.endpoints.getItemDetails, a).then((function(e) {
                                return s(e)
                            }))
                        }
                    }
                }
                s.$inject = ["itemListConstants", "httpService", "thumbnailConstants", "$filter"], r.A.factory("itemsListService", s), t.default = s
            },
            4997: function(e, t, n) {
                "use strict";
                n.r(t);
                var a = n(7577),
                    r = n(127),
                    i = n.n(r),
                    o = n(1260),
                    s = n(8359);

                function c(e, t, n, r, s) {
                    var c = t.recommendationTypes;

                    function l(e, t) {
                        return 3 === t ? "".concat(a.EnvironmentUrls.websiteUrl, "/library/").concat(e) : null
                    }

                    function m(e, t, n) {
                        return "Group" === t ? "".concat(a.EnvironmentUrls.websiteUrl, "/groups/").concat(e, "/").concat(o.seoName.formatSeoName(n)) : "".concat(a.EnvironmentUrls.websiteUrl, "/users/").concat(e, "/profile")
                    }

                    function d(e) {
                        var i, o, s = e.creatorName,
                            c = {
                                name: e.creatorName,
                                type: e.creatorType,
                                id: e.creatorTargetId
                            },
                            l = {
                                id: e.id,
                                name: e.name,
                                price: e.price,
                                lowestPrice: e.lowestPrice,
                                absoluteUrl: (o = e.id, "".concat(a.EnvironmentUrls.websiteUrl, "/bundles/").concat(o)),
                                audioUrl: null,
                                urlType: t.bundleRootUrlTemplate,
                                creator: {
                                    id: e.creatorTargetId,
                                    name: s,
                                    nameForDisplay: r.getNameForDisplay(c),
                                    type: e.creatorType,
                                    profileLink: m(e.creatorTargetId, e.creatorType, e.creatorName)
                                },
                                thumbnail: {
                                    type: n.thumbnailTypes.bundleThumbnail
                                },
                                product: {
                                    id: null,
                                    isForSale: !(null !== (i = e.itemStatus) && void 0 !== i && i.includes("Offsale")),
                                    isFree: 0 === e.price,
                                    noPriceText: null !== e.priceStatus ? e.priceStatus : ""
                                },
                                creatorHasVerifiedBadge: e.creatorHasVerifiedBadge,
                                itemType: "Bundle",
                                itemRestrictions: e.itemRestrictions
                            };
                        return r.mapItemRestrictionIcons(l), l
                    }

                    function u(e, t, n, a, r) {
                        return {
                            assetTypeId: e,
                            assetId: t,
                            bundleId: n,
                            numItems: a,
                            bundleTypeId: r,
                            details: !0
                        }
                    }

                    function p(e) {
                        var i, o, s, c = e.creatorName,
                            d = e.assetType,
                            u = {
                                name: e.creatorName,
                                type: e.creatorType,
                                id: e.creatorTargetId
                            },
                            p = d === t.assetTypes.places ? n.thumbnailTypes.placeGameIcon : n.thumbnailTypes.assetThumbnail,
                            g = {
                                id: e.id,
                                name: e.name,
                                price: e.price,
                                lowestPrice: e.lowestPrice,
                                absoluteUrl: (o = e.id, s = e.name, "".concat(a.EnvironmentUrls.websiteUrl, "/catalog/").concat(o, "/").concat(s)),
                                audioUrl: l(e.id, e.assetType),
                                hasResellers: e.hasResellers,
                                saleLocationType: e.saleLocationType,
                                urlType: t.assetRootUrlTemplate,
                                creator: {
                                    id: e.creatorTargetId,
                                    name: c,
                                    nameForDisplay: r.getNameForDisplay(u),
                                    type: e.creatorType,
                                    profileLink: m(e.creatorTargetId, e.creatorType, e.creatorName)
                                },
                                thumbnail: {
                                    type: p
                                },
                                product: {
                                    id: null,
                                    isForSale: !(null !== (i = e.itemStatus) && void 0 !== i && i.includes("Offsale")),
                                    isFree: 0 === e.price,
                                    noPriceText: null !== e.priceStatus ? e.priceStatus : ""
                                },
                                creatorHasVerifiedBadge: e.creatorHasVerifiedBadge,
                                itemType: "Asset",
                                itemRestrictions: e.itemRestrictions
                            };
                        return r.mapItemRestrictionIcons(g), g
                    }
                    return {
                        isRecommendationAllowed: function(e, n) {
                            return e === c.bundle || n > 0 && n !== t.recommendationSubtypes.gamePasses && n !== t.recommendationSubtypes.badges
                        },
                        beginUpdateRecommendedItems: function(t, n, r, i, o) {
                            var s;
                            s = n === c.bundle ? u(null, null, t, i, -1 !== r ? r : null) : u(r, t, null, i);
                            var l, m = (l = o, {
                                url: "".concat(a.EnvironmentUrls.catalogApi, "/v2/recommendations/").concat(l)
                            });
                            return e.httpGet(m, s).then((function(e) {
                                var t;
                                return e && e.data ? ("Bundle" === (null === (t = e.data[0]) || void 0 === t ? void 0 : t.itemType) ? 2 : 1) === c.bundle ? e.data.map(d) : e.data.map(p) : e
                            }))
                        },
                        getCatalogMetadata: function() {
                            return e.httpGet({
                                url: "".concat(a.EnvironmentUrls.catalogApi, "/v1/catalog/metadata"),
                                retryable: !0,
                                withCredentials: !0
                            })
                        },
                        getRecommendationMetadata: function(t) {
                            var n = {
                                    page: t
                                },
                                r = {
                                    url: "".concat(a.EnvironmentUrls.catalogApi, "/v1/recommendations/metadata")
                                };
                            return e.httpGet(r, n).then((function(e) {
                                var t = i().copy(e);
                                if (e) {
                                    var n = e.numOfRecommendationsDisplayed;
                                    t.numberOfItems = n
                                }
                                return t
                            }))
                        },
                        overrideRecommendationTypes: function(e) {
                            if (!e) return !1;
                            i().forEach(e, (function(e, t) {
                                c[t.toLowerCase()] = e
                            }))
                        }
                    }
                }
                c.$inject = ["httpService", "recommendationsConstants", "thumbnailConstants", "creatorNameUtilities", "$filter"], s.A.factory("recommendationsService", c), t.default = c
            },
            8560: function(e) {
                e.exports = '<div> <div ng-if="$ctrl.showFrontendBasedResellersComponent()"> <asset-resale-pane asset-id="$ctrl.recommendationTargetId" is-bundle="$ctrl.isBundle()"></asset-resale-pane> </div> <div id="complimentary-items-recommendations-container" data-target-id="{{$ctrl.complimentaryItemRecommendations.targetId}}" data-is-bundle="{{$ctrl.complimentaryItemRecommendations.isBundle}}"></div> <div class="complimentary-items-divider" ng-if="$ctrl.complimentaryItemRecommendations.enabled"></div> <div class="current-items" ng-show="$ctrl.items.length > 0" ng-cloak> <div class="container-list layer recommendations-container"> <div class="container-header recommendations-header"> <h2> <span ng-bind="\'Heading.RecommendedTitle\' | translate"></span> </h2> <a ng-if="$ctrl.showSeeAllButton" class="see-all-button see-all-link-icon btn-secondary-xs" ng-href="{{ $ctrl.getSeeAllLink() }}" ng-bind="\'Action.SeeAll\' | translate"></a> </div> <div class="recommended-items-slider"> <ul class="hlist item-cards recommended-items" ng-class="{\'item-cards-embed\' : $ctrl.numberOfItems < 7, \'single-row\' : $ctrl.recommendationNumRows <= 1}"> <li ng-repeat="item in $ctrl.items" class="list-item item-card recommended-item"> <div class="item-card-container recommended-item-link"> <a ng-href="{{ item.urlType | seoUrl:item.id:item.name}}" class="item-card-link"> <div class="item-card-thumb-container"> <thumbnail-2d class="item-card-thumb" thumbnail-type="item.thumbnail.type" thumbnail-target-id="item.id"> </thumbnail-2d> <span ng-show="item.itemRestrictionIcon" class="restriction-icon" ng-class="item.itemRestrictionIcon"></span> </div> <div class="item-card-name recommended-name" title="{{ item.name }}"> <span class="icon-premium-small" ng-if="$ctrl.shouldShowPremiumIcon(item)"> </span> <span ng-bind="item.name"></span> </div> </a> <div ng-if="item.audioUrl" class="MediaPlayerControls"> <div class="MediaPlayerIcon icon-play" data-mediathumb-url="{{item.audioUrl}}"></div> </div> <div class="recommended-creator-container"> <div ng-if="item.creator" class="text-overflow item-card-creator recommended-creator"> <span class="text-overflow" ng-bind-html="\'Label.ByCreatorLink\'| translate:{\r\n                                      linkStart: \'<a target=_self class=\\\'creator-name text-link\\\' href=\\\'\' + item.creator.profileLink + \'\\\'>\', linkEnd: \'</a>\', creator: item.creator.nameForDisplay }"> </span> </div> <span ng-if="$ctrl.showVerifiedBadge(item)" class="verified-badge-icon-item-recommendations" data-size="Title" data-overrideimgclass="verified-badge-icon-item-recommendations-rendered"> </span> </div> <div ng-if="$ctrl.getDisplayPrice(item) && item.lowestPrice && false" class="text-overflow item-card-label"> <span ng-bind="\'Label.Card.PriceWas\' | translate"></span> <span class="icon-robux-gray-16x16"></span> <span class="strike-through" ng-bind="$ctrl.getDisplayPrice(item) | number"></span> </div> <div class="text-overflow item-card-price"> <span class="icon-robux-16x16" ng-show="$ctrl.isNotExperienceOnlySaleLocationWithNoResellers(item) && ($ctrl.getDisplayPrice(item) || item.lowestPrice)"></span> <span class="text-robux-tile" ng-show="$ctrl.isNotExperienceOnlySaleLocationWithNoResellers(item) && ($ctrl.getDisplayPrice(item) && !item.lowestPrice)" ng-bind="$ctrl.getDisplayPrice(item) | abbreviate : 1"></span> <span class="text-robux-tile" ng-show="$ctrl.isNotExperienceOnlySaleLocationWithNoResellers(item) && item.lowestPrice" ng-bind="item.lowestPrice | abbreviate : 1"></span> <h4 class="text text-label" ng-hide="$ctrl.isNotExperienceOnlySaleLocationWithNoResellers(item) && ($ctrl.getDisplayPrice(item) || item.lowestPrice)"> <span class="text-overflow font-caption-body" ng-if="item.product.noPriceText.length > 0" ng-class="{\'text-robux-tile\': item.product.isFree}" ng-bind="item.product.noPriceText"></span> </h4> </div> </div> </li> </ul> </div> </div> </div> <div item-list class="item-list" ng-if="$ctrl.isMoreByCreatorEnabled"></div> </div> '
            },
            2587: function(e) {
                e.exports = '<div class="container-list layer item-list-container" ng-controller="itemListController" ng-hide="isItemListDetailsEmpty()"> <div class="container-header recommendations-header"> <h2> <span ng-bind="itemListLayout.heading"></span> </h2> <a class="btn-more see-all-link-icon btn-secondary-xs" ng-href="{{itemListLayout.seeMoreLink}}" ng-bind="\'Action.SeeMore\' | translate"></a> </div> <div class="recommended-items-slider"> <ul class="hlist item-cards recommended-items" ng-show="isItemListDetailsAvailable()"> <li ng-repeat="item in items" class="list-item item-card recommended-item"> <div class="item-card-container recommended-item-link"> <a ng-href="{{ item.absoluteUrl }}" class="item-card-link"> <thumbnail-2d class="item-card-thumb-container" thumbnail-type="item.thumbnail.type" thumbnail-target-id="item.id"> </thumbnail-2d> <div class="item-card-name recommended-name" title="{{ item.name }}"> {{ item.name }} </div> </a> <div ng-if="item.audioUrl" class="MediaPlayerControls"> <div class="MediaPlayerIcon icon-play" data-mediathumb-url="{{item.audioUrl}}"></div> </div> <div ng-if="item.creator" class="text-overflow item-card-creator recommended-creator"> <span ng-bind-html="\'Label.ByCreatorLink\'| translate:{\r\n                                      linkStart: \'<a target=_self class=\\\'creator-name text-link\\\' href=\\\'\' + item.creator.profileLink + \'\\\'>\', linkEnd: \'</a>\', creator: item.creator.nameForDisplay }"> </span> </div> <div class="text-overflow item-card-price"> <span class="icon-robux-16x16" ng-show="item.price"></span> <span class="text-robux-tile" ng-show="item.price">{{ item.price | abbreviate : 1 }}</span> <h4 class="text text-label" ng-hide="item.price"> <span class="text-overflow font-caption-body" ng-if="item.product.noPriceText.length > 0" ng-class="{\'text-robux-tile\': item.product.isFree}"> {{item.product.noPriceText}} </span> </h4> </div> </div> </li> </ul> <span class="spinner spinner-default" ng-hide="isItemListDetailsAvailable()"></span> </div> </div> '
            },
            1260: function(e) {
                "use strict";
                e.exports = CoreUtilities
            },
            7577: function(e) {
                "use strict";
                e.exports = Roblox
            },
            127: function(e) {
                "use strict";
                e.exports = angular
            }
        },
        t = {};

    function n(a) {
        var r = t[a];
        if (void 0 !== r) return r.exports;
        var i = t[a] = {
            exports: {}
        };
        return e[a](i, i.exports, n), i.exports
    }
    n.n = function(e) {
            var t = e && e.__esModule ? function() {
                return e.default
            } : function() {
                return e
            };
            return n.d(t, {
                a: t
            }), t
        }, n.d = function(e, t) {
            for (var a in t) n.o(t, a) && !n.o(e, a) && Object.defineProperty(e, a, {
                enumerable: !0,
                get: t[a]
            })
        }, n.o = function(e, t) {
            return Object.prototype.hasOwnProperty.call(e, t)
        }, n.r = function(e) {
            "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
                value: "Module"
            }), Object.defineProperty(e, "__esModule", {
                value: !0
            })
        },
        function() {
            "use strict";
            var e = n(127),
                t = n.n(e),
                a = n(7525),
                r = n(8359);
            (0, a.importFilesUnderPath)(n(3543)), (0, a.importFilesUnderPath)(n(8122)), (0, a.importFilesUnderPath)(n(2908)), (0, a.importFilesUnderPath)(n(611)), (0, a.importFilesUnderPath)(n(3422));
            var i = n(935),
                o = (0, a.templateCacheGenerator)(t(), "recommendationsAppTemplates", i);
            t().element((function() {
                t().bootstrap("#recommendations-container", [r.A.name, o.name])
            }))
        }()
}();
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/df9ba333b8a55eaf8f7c0e127462d848-recommendations.bundle.min.js.map

! function() {
    "use strict";
    var e, t, n, a, i, s = {
            n: function(e) {
                var t = e && e.__esModule ? function() {
                    return e.default
                } : function() {
                    return e
                };
                return s.d(t, {
                    a: t
                }), t
            },
            d: function(e, t) {
                for (var n in t) s.o(t, n) && !s.o(e, n) && Object.defineProperty(e, n, {
                    enumerable: !0,
                    get: t[n]
                })
            },
            o: function(e, t) {
                return Object.prototype.hasOwnProperty.call(e, t)
            }
        },
        r = React,
        c = s.n(r),
        o = CoreUtilities,
        l = ReactDOM,
        u = ReactStyleGuide,
        d = HeaderScripts,
        m = ReactUtilities,
        p = RobloxItemPurchase,
        f = Roblox,
        h = {
            itemTypeConstants: {
                asset: "asset",
                bundle: "bundle"
            },
            batchBuyPurchaseResults: {
                success: "Success",
                alreadyOwned: "AlreadyOwned",
                insufficientFunds: "InsufficientFunds",
                exceptionOccured: "ExceptionOccurred",
                tooManyPurchases: "TooManyPurchases"
            },
            limited: "Limited",
            numberOfItemsToRecommend: 5,
            totalNumberOfRecommendations: 140,
            complimentaryItemRecommendationsEventName: "complimentary-items:render",
            complimentaryItemElementName: "complimentary-items-recommendations-container"
        },
        v = {
            assetRootUrlTemplate: "catalog",
            bundleRootUrlTemplate: "bundles",
            getRecommendations: {
                url: f.EnvironmentUrls.catalogApi + "/v2/recommendations/complement-assets",
                retryable: !0,
                withCredentials: !0
            },
            postItemDetails: {
                url: f.EnvironmentUrls.catalogApi + "/v1/catalog/items/details",
                retryable: !0,
                withCredentials: !0
            },
            getItemOwnershipUrl: function(e, t, n) {
                return f.EnvironmentUrls.inventoryApi + "/v1/users/" + e + "/items/" + t + "/" + n + "/is-owned"
            }
        },
        y = function(e) {
            var t = {
                assetId: e,
                numItems: h.totalNumberOfRecommendations
            };
            return o.httpService.get(v.getRecommendations, t)
        },
        b = function(e, t, n) {
            var a = {
                url: v.getItemOwnershipUrl(e, t, n),
                retryable: !0,
                withCredentials: !0
            };
            return o.httpService.get(a)
        },
        I = {
            common: [""],
            feature: "Feature.Catalog"
        },
        g = RobloxThumbnails,
        w = f.AXAnalyticsService.AXAnalyticsConstants;
    ! function(e) {
        e.Catalog = "Catalog", e.ItemDetailsRecommendations = "ItemDetailsRecommendations", e.ItemDetailsBundleContents = "ItemDetailsBundleContents", e.ComplimentaryItemRecommendations = "ComplimentaryItemRecommendations", e.LookDetailsContents = "LookDetailsContents"
    }(e || (e = {})),
    function(e) {
        e.CatalogItemCard = "CatalogItemCard", e.ItemDetailsPage = "ItemDetailsPage", e.LookDetails = "LookDetails", e.ShoppingCartModal = "ShoppingCartModal", e.PostPurchase = "PostPurchase"
    }(t || (t = {})),
    function(e) {
        e.InfiniteScroll = "InfiniteScroll", e.LoadMore = "LoadMore"
    }(n || (n = {})),
    function(e) {
        e.ToggleButton = "ToggleButton", e.ClickOutside = "ClickOutside"
    }(a || (a = {})),
    function(e) {
        e.ItemDetailsPage = "ItemDetailsPage", e.ShoppingCart = "ShoppingCart", e.LookDetails = "LookDetails", e.CurrentWearing = "CurrentWearing", e.DirectResale = "DirectResale"
    }(i || (i = {}));
    var C = function(e, t) {
            e && f.AXAnalyticsService.sendAXTracking({
                itemName: e,
                actionType: f.AXSendTrackingActionType.Click,
                metaData: t ? {
                    metaData: JSON.stringify(t)
                } : void 0
            })
        },
        E = (0, m.withTranslations)((function(t) {
            var n, a = t.item,
                i = t.selectedItems,
                s = t.disabledItemsRecord,
                r = t.onCheckClicked,
                o = t.translate,
                l = void 0 === s[a.id] || !s[a.id].isOwned && !s[a.id].noSellers;
            return c().createElement(c().Fragment, null, c().createElement("div", {
                className: "complimentary-item-recommendations-item-card"
            }, l && c().createElement("div", {
                className: "checkbox purchase-checkbox-container"
            }, c().createElement("input", {
                className: "input-checkbox",
                id: "checkbox-" + a.id,
                type: "checkbox",
                checked: null == i ? void 0 : i.includes(a),
                onChange: function() {
                    r(a.id)
                },
                disabled: !l
            }), c().createElement("label", {
                htmlFor: "checkbox-" + a.id
            })), c().createElement("div", {
                style: {
                    display: "contents"
                },
                onClick: function() {
                    return function(e, t) {
                        C(w.ItemCardClick, {
                            source: e,
                            itemId: t.itemId,
                            itemType: t.itemType
                        })
                    }(e.ComplimentaryItemRecommendations, {
                        itemId: a.id,
                        itemType: a.itemType
                    })
                }
            }, c().createElement(u.ItemCard, {
                id: a.id,
                name: a.name,
                type: a.itemType,
                creatorName: a.creatorName,
                creatorType: a.creatorType,
                creatorTargetId: a.creatorTargetId,
                price: a.price,
                lowestPrice: a.lowestPrice,
                unitsAvailableForConsumption: a.unitsAvailableForConsumption,
                itemStatus: a.itemStatus,
                priceStatus: a.priceStatus,
                premiumPricing: null === (n = a.premiumPricing) || void 0 === n ? void 0 : n.premiumPriceInRobux,
                itemRestrictions: a.itemRestrictions,
                thumbnail2d: c().createElement("div", null, c().createElement(g.Thumbnail2d, {
                    type: u.ItemCardUtils.checkIfBundle(a.itemType) ? g.ThumbnailTypes.bundleThumbnail : g.ThumbnailTypes.assetThumbnail,
                    targetId: a.id,
                    size: g.DefaultThumbnailSize
                }))
            })), s[a.id] && s[a.id].isOwned && c().createElement("div", {
                className: "item-owned"
            }, c().createElement("span", {
                className: "item-owned-icon"
            }), c().createElement("span", {
                className: "item-owned-text"
            }, o("Label.ItemOwned")))))
        }), I),
        T = o.numberFormat.getNumberFormat,
        O = function(e, t, n, a) {
            return new(n || (n = Promise))((function(i, s) {
                function r(e) {
                    try {
                        o(a.next(e))
                    } catch (e) {
                        s(e)
                    }
                }

                function c(e) {
                    try {
                        o(a.throw(e))
                    } catch (e) {
                        s(e)
                    }
                }

                function o(e) {
                    var t;
                    e.done ? i(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                        e(t)
                    }))).then(r, c)
                }
                o((a = a.apply(e, t || [])).next())
            }))
        },
        S = function(e, t) {
            var n, a, i, s, r = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            };
            return s = {
                next: c(0),
                throw: c(1),
                return: c(2)
            }, "function" == typeof Symbol && (s[Symbol.iterator] = function() {
                return this
            }), s;

            function c(s) {
                return function(c) {
                    return function(s) {
                        if (n) throw new TypeError("Generator is already executing.");
                        for (; r;) try {
                            if (n = 1, a && (i = 2 & s[0] ? a.return : s[0] ? a.throw || ((i = a.return) && i.call(a), 0) : a.next) && !(i = i.call(a, s[1])).done) return i;
                            switch (a = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                case 0:
                                case 1:
                                    i = s;
                                    break;
                                case 4:
                                    return r.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    r.label++, a = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = r.ops.pop(), r.trys.pop();
                                    continue;
                                default:
                                    if (!(i = r.trys, (i = i.length > 0 && i[i.length - 1]) || 6 !== s[0] && 2 !== s[0])) {
                                        r = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                        r.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && r.label < i[1]) {
                                        r.label = i[1], i = s;
                                        break
                                    }
                                    if (i && r.label < i[2]) {
                                        r.label = i[2], r.ops.push(s);
                                        break
                                    }
                                    i[2] && r.ops.pop(), r.trys.pop();
                                    continue
                            }
                            s = t.call(e, r)
                        } catch (e) {
                            s = [6, e], a = 0
                        } finally {
                            n = i = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }([s, c])
                }
            }
        },
        k = (0, m.withTranslations)((function(e) {
            var t = e.itemId,
                n = e.isBundle,
                a = e.displayPurchaseButtonLeft,
                i = e.systemFeedbackService,
                s = e.translate,
                o = (0, r.useState)(),
                l = o[0],
                u = o[1],
                m = (0, r.useState)(),
                v = m[0],
                I = m[1],
                g = (0, r.useState)(),
                w = g[0],
                C = g[1],
                k = (0, r.useState)(),
                P = k[0],
                R = k[1],
                x = (0, r.useState)(),
                N = x[0],
                D = x[1],
                B = (0, r.useState)({}),
                L = B[0],
                A = B[1],
                F = (0, r.useState)(),
                U = F[0],
                M = F[1],
                X = (0, r.useState)({}),
                j = X[0],
                H = X[1],
                W = (0, r.useState)(!1),
                z = W[0],
                G = W[1],
                _ = h.itemTypeConstants,
                J = (0, r.useCallback)((function(e) {
                    return y(e)
                }), []),
                q = (0, r.useCallback)((function(e) {
                    return f.ItemDetailsHydrationService.getItemDetails(e)
                }), []),
                K = (0, r.useCallback)((function(e, t, n) {
                    return O(void 0, void 0, void 0, (function() {
                        var a;
                        return S(this, (function(i) {
                            switch (i.label) {
                                case 0:
                                    return [4, b(e, t, n)];
                                case 1:
                                    return a = i.sent(), [2, {
                                        response: a,
                                        itemTargetId: n
                                    }]
                            }
                        }))
                    }))
                }), []),
                Q = (0, r.useCallback)((function(e) {
                    return void 0 === e ? 0 : d.authenticatedUser.isPremiumUser && void 0 !== e.premiumPricing && e.premiumPricing.premiumPriceInRobux >= 0 ? e.premiumPricing.premiumPriceInRobux : void 0 !== e.lowestPrice && e.lowestPrice >= 0 ? e.lowestPrice : void 0 === e.price ? 0 : e.price
                }), []),
                V = (0, r.useCallback)((function() {
                    var e = 0;
                    !l || !(null == N ? void 0 : N.includes(l)) || L[l.id] && (L[l.id].isOwned || L[l.id].noSellers) || (e += Q(l)), void 0 !== w && w.forEach((function(t) {
                        !(null == N ? void 0 : N.includes(t)) || L[t.id] && (L[t.id].isOwned || L[t.id].noSellers) || (e += Q(t))
                    })), M(e)
                }), [L, Q, l, w, N]),
                Y = (0, r.useCallback)((function(e) {
                    return O(void 0, void 0, void 0, (function() {
                        return S(this, (function(t) {
                            switch (t.label) {
                                case 0:
                                    return d.authenticatedUser.isAuthenticated ? void 0 !== j[e] ? [2, {
                                        id: e,
                                        isOwned: j[e]
                                    }] : [4, K(d.authenticatedUser.id, n ? h.itemTypeConstants.bundle : h.itemTypeConstants.asset, e)] : [2, {
                                        id: e,
                                        isOwned: !1
                                    }];
                                case 1:
                                    return t.sent().response.data ? [2, {
                                        id: e,
                                        isOwned: !0
                                    }] : [2, {
                                        id: e,
                                        isOwned: !1
                                    }]
                            }
                        }))
                    }))
                }), []);
            var Z = (0, r.useCallback)((function(e) {
                var n = {};
                Object.assign(n, P), n[e] = !n[e];
                var a = [];
                !n[t] || !l || L[l.id] && (L[l.id].isOwned || L[l.id].noSellers) || (Q(l), a.push(l)), void 0 !== w && w.forEach((function(e) {
                    !n[e.id] || L[e.id] && (L[e.id].isOwned || L[e.id].noSellers) || (Q(e), a.push(e))
                })), R(n), D(a)
            }), [L, Q, l, t, P, w]);
            (0, r.useEffect)((function() {
                J(t).then((function(e) {
                    (function(e) {
                        return O(this, void 0, void 0, (function() {
                            var t, a, i, s, r, c, o, l, u;
                            return S(this, (function(m) {
                                switch (m.label) {
                                    case 0:
                                        t = h.numberOfItemsToRecommend, a = 0, i = [], s = j, m.label = 1;
                                    case 1:
                                        if (!(a < e.data.data.length && i.length < t)) return [3, 7];
                                        r = a + t, c = e.data.data.slice(a, r), m.label = 2;
                                    case 2:
                                        return m.trys.push([2, 5, , 6]), c.length > 0 ? [4, Promise.all(c.map((function(e) {
                                            return K(d.authenticatedUser.id, n ? h.itemTypeConstants.bundle : h.itemTypeConstants.asset, e)
                                        })))] : [3, 4];
                                    case 3:
                                        m.sent().forEach((function(e) {
                                            if (s[e.itemTargetId] = e.response.data, i.length < t && !e.response.data) {
                                                var a = {
                                                    id: e.itemTargetId,
                                                    itemType: n ? h.itemTypeConstants.bundle : h.itemTypeConstants.asset
                                                };
                                                i.push(a)
                                            }
                                        })), m.label = 4;
                                    case 4:
                                        return a += t, [3, 6];
                                    case 5:
                                        return m.sent(), a = e.data.data.length, [3, 6];
                                    case 6:
                                        return [3, 1];
                                    case 7:
                                        if ((o = t - i.length) > 0)
                                            for (l = 0; l < o; l++) u = {
                                                id: e.data.data[l],
                                                itemType: n ? h.itemTypeConstants.bundle : h.itemTypeConstants.asset
                                            }, i.push(u);
                                        return H(s), I(i), [2]
                                }
                            }))
                        }))
                    })(e).catch((function() {
                        G(!0)
                    }))
                })).catch((function() {
                    G(!0)
                }))
            }), []), (0, r.useEffect)((function() {
                if (void 0 !== v) {
                    var e = _.asset;
                    n && (e = _.bundle);
                    var a = [],
                        i = [],
                        s = {},
                        r = 0,
                        c = {
                            id: t,
                            itemType: e
                        };
                    v.forEach((function(e) {
                        a.push(e), i.push(), s[e.id] = r, r += 1
                    })), a.push(c), i.push(), q(a).then((function(e) {
                        var n = {},
                            a = L,
                            r = [];
                        e.forEach((function(e) {
                            var c, o = s[e.id];
                            Q(e), n[e.id] = !0, e.id !== t ? i[o] = e : (u(e), e), (null === (c = e.priceStatus) || void 0 === c ? void 0 : c.includes("Off Sale")) && void 0 === e.lowestPrice ? a && void 0 === a[e.id] ? a[e.id] = {
                                noSellers: !0
                            } : a[e.id].noSellers = !0 : L[e.id] && L[e.id].isOwned || r.push(e)
                        })), D(r), A(a), R(n), C(i)
                    })).catch((function() {
                        console.warn("error")
                    }))
                }
            }), [n, t, q, v]), (0, r.useEffect)((function() {
                if (l && w) {
                    var e = [];
                    e.push(l.id), w.forEach((function(t) {
                            e.push(t.id)
                        })),
                        function(e) {
                            return O(this, void 0, void 0, (function() {
                                var t, n, a, i, s;
                                return S(this, (function(r) {
                                    switch (r.label) {
                                        case 0:
                                            return t = j, [4, Promise.all(e.map((function(e) {
                                                return Y(e)
                                            })))];
                                        case 1:
                                            return n = r.sent(), a = new Array, i = L, n.forEach((function(e) {
                                                if (t[e.id] = e.isOwned, e.isOwned && (l && e.id === l.id && (l.itemRestrictions.includes(h.limited) || (a.push(l), i && void 0 === i[e.id] ? i[e.id] = {
                                                        isOwned: !0
                                                    } : i[e.id].isOwned = !0)), void 0 !== w)) {
                                                    var n = w.find((function(t) {
                                                        return t.id === e.id
                                                    }));
                                                    n && !n.itemRestrictions.includes(h.limited) && (a.push(n), i && void 0 === i[e.id] ? i[e.id] = {
                                                        isOwned: !0
                                                    } : i[e.id].isOwned = !0)
                                                }
                                            })), H(t), N && (s = N, a.forEach((function(e) {
                                                var t = s.indexOf(e);
                                                t > -1 && s.splice(t, 1)
                                            })), D(s.slice())), A(i), [2]
                                    }
                                }))
                            }))
                        }(e).catch((function() {
                            G(!0)
                        }))
                }
            }), [l, w]), (0, r.useEffect)((function() {
                l && w && V()
            }), [l, w, N, V]);
            var $ = (0, r.useCallback)((function(e) {
                var t = 0,
                    n = j,
                    a = L,
                    i = N;
                (e.forEach((function(e) {
                    if (l && e.data.itemData.assetId === l.id) e.data.reason !== h.batchBuyPurchaseResults.success && e.data.reason !== h.batchBuyPurchaseResults.alreadyOwned || (t += 1, l.itemRestrictions.includes(h.limited) || (a && void 0 === a[e.data.itemData.assetId] ? a[e.data.itemData.assetId] = {
                        isOwned: !0
                    } : a[e.data.itemData.assetId].isOwned = !0, n[e.data.itemData.assetId] = !0, i && (s = i.indexOf(l)) > -1 && i.splice(s, 1)));
                    else if (void 0 !== w && (e.data.reason === h.batchBuyPurchaseResults.success || e.data.reason === h.batchBuyPurchaseResults.alreadyOwned)) {
                        t += 1;
                        var s, r = w.find((function(t) {
                            return t.id === e.data.itemData.assetId
                        }));
                        if (r && !r.itemRestrictions.includes(h.limited))
                            if (a && void 0 === a[e.data.itemData.assetId] ? a[e.data.itemData.assetId] = {
                                    isOwned: !0
                                } : a[e.data.itemData.assetId].isOwned = !0, n[e.data.itemData.assetId] = !0, i)(s = i.indexOf(r)) > -1 && i.splice(s, 1)
                    }
                })), i) && D(i.slice());
                A(a), H(n), t === e.length && window.location.reload()
            }), [L, l, j, w, N]);
            if (void 0 === l || void 0 === w || w.length < 1 || void 0 === N || z) return c().createElement("div", null);
            var ee = new Map;
            return c().createElement(c().Fragment, null, c().createElement("div", {
                className: "complimentary-items-recommendations-container layer",
                id: "populated-complimentary-items-recommendations"
            }, c().createElement("div", {
                className: "complimentary-items-carousel-title"
            }, c().createElement("h1", {
                className: "font-header-1"
            }, s("Heading.BuyItWith"))), c().createElement("div", {
                className: "complimentary-items-carousel"
            }, c().createElement(E, {
                item: l,
                selectedItems: N,
                disabledItemsRecord: L,
                onCheckClicked: Z
            }), c().createElement("div", {
                className: "plus-icon-container"
            }, c().createElement("span", {
                className: "plus-icon"
            })), w.map((function(e) {
                return c().createElement(E, {
                    item: e,
                    selectedItems: N,
                    disabledItemsRecord: L,
                    onCheckClicked: Z
                })
            }))), a && c().createElement("div", {
                className: "purchase-container"
            }, c().createElement("span", {
                className: "purchase-element"
            }, c().createElement(p.BatchBuyPriceContainer, {
                items: N,
                purchaseMetadata: ee,
                onTransactionComplete: $,
                systemFeedbackService: i
            })), c().createElement("span", {
                className: "purchase-element price-total"
            }, c().createElement("div", {
                className: "text-robux-tile"
            }, s("Label.Total"), c().createElement("span", {
                className: "icon-robux-16x16"
            }), c().createElement("span", {
                className: "text-robux-tile"
            }, T(U || 0))))), !a && c().createElement("div", {
                className: "purchase-container-right"
            }, c().createElement("span", {
                className: "purchase-element price-total"
            }, c().createElement("div", {
                className: "text-robux-tile"
            }, s("Label.Total"), c().createElement("span", {
                className: "icon-robux-16x16"
            }), c().createElement("span", {
                className: "text-robux-tile"
            }, T(U || 0)))), c().createElement("span", {
                className: "purchase-element"
            }, c().createElement(p.BatchBuyPriceContainer, {
                items: N,
                purchaseMetadata: ee,
                onTransactionComplete: $,
                systemFeedbackService: i
            })))))
        }), I),
        P = function(e) {
            var t = e.itemId,
                n = e.isBundle,
                a = e.displayPurchaseButtonLeft,
                i = (0, u.createSystemFeedback)(),
                s = i[0],
                r = i[1];
            return c().createElement(c().Fragment, null, c().createElement(k, {
                itemId: t,
                isBundle: n,
                displayPurchaseButtonLeft: a,
                systemFeedbackService: r
            }), c().createElement(s, null))
        };
    (0, o.ready)((function() {
        window.addEventListener(h.complimentaryItemRecommendationsEventName, (function(e) {
            ! function(e) {
                var t = document.getElementById(h.complimentaryItemElementName);
                (0, l.render)(c().createElement(P, {
                    itemId: e.targetId,
                    isBundle: e.isBundle,
                    displayPurchaseButtonLeft: e.displayPurchaseButtonLeft
                }), t)
            }(e.detail)
        }))
    }))
}();
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/ae91efe1b7afb208c42b447ee4ac6079-complimentaryItemRecommendations.bundle.min.js.map

/* Bundle detector */
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("Recommendations");