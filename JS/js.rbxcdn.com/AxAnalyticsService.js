! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "295008fd57261faf205456a2a7660a91ec194e16"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "7d2cfad0-32e6-46e0-9e27-2ec0cf5575e0", e._sentryDebugIdIdentifier = "sentry-dbid-7d2cfad0-32e6-46e0-9e27-2ec0cf5575e0")
    } catch (e) {}
}(),
function() {
    "use strict";
    var e, t, r = {},
        a = {};

    function i(e) {
        var t = a[e];
        if (void 0 !== t) return t.exports;
        var o = a[e] = {
            exports: {}
        };
        return r[e](o, o.exports, i), o.exports
    }
    i.n = function(e) {
        var t = e && e.__esModule ? function() {
            return e.default
        } : function() {
            return e
        };
        return i.d(t, {
            a: t
        }), t
    }, i.d = function(e, t) {
        for (var r in t) i.o(t, r) && !i.o(e, r) && Object.defineProperty(e, r, {
            enumerable: !0,
            get: t[r]
        })
    }, i.o = function(e, t) {
        return Object.prototype.hasOwnProperty.call(e, t)
    }, i.rv = function() {
        return "1.7.12"
    }, i.ruid = "bundler=rspack@1.7.12";
    var o = window.Roblox,
        n = i.n(o),
        c = window.Roblox["core-scripts"].eventStream,
        l = window.Roblox["core-scripts"].meta.device,
        u = window.EventTracker,
        d = ((e = {})[e.View = 0] = "View", e[e.Click = 1] = "Click", e[e.Error = 2] = "Error", e),
        s = ((t = {})[t.Web = 0] = "Web", t[t.MobileWeb = 1] = "MobileWeb", t),
        C = function() {
            var e = (0, l.getDeviceMeta)();
            return !!(null == e ? void 0 : e.isPhone) || !!(null == e ? void 0 : e.isTablet) || (null == e ? void 0 : e.deviceType) === "phone"
        },
        f = function(e) {
            var t = e.itemName,
                r = e.counterName,
                a = e.metaData,
                i = e.actionType,
                o = void 0 === i ? d.View : i,
                n = e.excludeCounter,
                l = e.excludeTelemetry,
                f = sessionStorage.getItem("AXAnalyticsDebugLogging"),
                p = C(),
                v = "AXTracking_".concat(p ? "Mweb" : "Web");
            if (!(void 0 !== n && n)) {
                var g = r ? "".concat(v, "_").concat(r) : "".concat(v, "_").concat(t);
                (0, u.fireEvent)(g), f && console.log("AXAnalyticsService.sendCounter", g)
            }
            if (!(void 0 !== l && l)) {
                var b = function(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var r = null != arguments[t] ? arguments[t] : {},
                            a = Object.keys(r);
                        "function" == typeof Object.getOwnPropertySymbols && (a = a.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                            return Object.getOwnPropertyDescriptor(r, e).enumerable
                        }))), a.forEach(function(t) {
                            var a;
                            a = r[t], t in e ? Object.defineProperty(e, t, {
                                value: a,
                                enumerable: !0,
                                configurable: !0,
                                writable: !0
                            }) : e[t] = a
                        })
                    }
                    return e
                }({
                    item_name: t,
                    action_type: o,
                    platform: p ? s.MobileWeb : s.Web
                }, a);
                (0, c.sendEventWithTarget)("userJourneyAction", "RobloxWWW", b), f && console.log("AXAnalyticsService.sendEvent", b)
            }
        },
        p = function(e) {
            for (var t = 1; t < arguments.length; t++) {
                var r = null != arguments[t] ? arguments[t] : {},
                    a = Object.keys(r);
                "function" == typeof Object.getOwnPropertySymbols && (a = a.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                    return Object.getOwnPropertyDescriptor(r, e).enumerable
                }))), a.forEach(function(t) {
                    var a;
                    a = r[t], t in e ? Object.defineProperty(e, t, {
                        value: a,
                        enumerable: !0,
                        configurable: !0,
                        writable: !0
                    }) : e[t] = a
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
        v = window.React;

    function g(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, a = Array(t); r < t; r++) a[r] = e[r];
        return a
    }

    function b(e, t) {
        return function(e) {
            if (Array.isArray(e)) return e
        }(e) || function(e, t) {
            var r, a, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
            if (null != i) {
                var o = [],
                    n = !0,
                    c = !1;
                try {
                    for (i = i.call(e); !(n = (r = i.next()).done) && (o.push(r.value), !t || o.length !== t); n = !0);
                } catch (e) {
                    c = !0, a = e
                } finally {
                    try {
                        n || null == i.return || i.return()
                    } finally {
                        if (c) throw a
                    }
                }
                return o
            }
        }(e, t) || function(e, t) {
            if (e) {
                if ("string" == typeof e) return g(e, t);
                var r = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return g(e, t)
            }
        }(e, t) || function() {
            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }
    var h = function() {
        var e = b((0, v.useState)(!1), 2),
            t = e[0],
            r = e[1],
            a = (0, v.useRef)(null);
        return (0, v.useEffect)(function() {
            var e = new IntersectionObserver(function(e) {
                    var t = b(e, 1)[0];
                    t && r(t.isIntersecting)
                }, {
                    threshold: .1
                }),
                t = a.current;
            return t && e.observe(t),
                function() {
                    t && e.unobserve(t)
                }
        }, []), [a, t]
    };

    function A(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, a = Array(t); r < t; r++) a[r] = e[r];
        return a
    }
    n().AXAnalyticsService = {
        sendAXTracking: f,
        useAXTrackView: function(e) {
            var t, r = function(e) {
                    if (Array.isArray(e)) return e
                }(t = h()) || function(e) {
                    var t, r, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var i = [],
                            o = !0,
                            n = !1;
                        try {
                            for (a = a.call(e); !(o = (t = a.next()).done) && (i.push(t.value), 2 !== i.length); o = !0);
                        } catch (e) {
                            n = !0, r = e
                        } finally {
                            try {
                                o || null == a.return || a.return()
                            } finally {
                                if (n) throw r
                            }
                        }
                        return i
                    }
                }(t) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return A(e, 2);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return A(e, 2)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }(),
                a = r[0],
                i = r[1];
            return (0, v.useEffect)(function() {
                i && f(e)
            }, [e, i]), [a]
        },
        useIsElementVisible: h,
        AXAnalyticsConstants: p,
        reportAXError: function(e) {
            var t = e.log,
                r = e.itemName,
                a = e.counterName;
            f({
                itemName: "AXError_".concat(r),
                counterName: a,
                metaData: {
                    metaData: t
                },
                actionType: d.Error
            })
        }
    }, n().AXSendTrackingActionType = d
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected(document.currentScript && document.currentScript.getAttribute("data-bundlename") || "AxAnalyticsService");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/axAnalyticsService-983bbcadfad37d75.js.map