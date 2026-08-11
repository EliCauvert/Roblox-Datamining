! function() {
    try {
        var e = "undefined" != typeof window ? window : "undefined" != typeof global ? global : "undefined" != typeof globalThis ? globalThis : "undefined" != typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "8a492c91f2f3b77789ca8d2e75575286e9ebafe5"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "c1830be2-bb2b-48f0-845f-91a47b91a310", e._sentryDebugIdIdentifier = "sentry-dbid-c1830be2-bb2b-48f0-845f-91a47b91a310")
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
        return "1.5.7"
    }, i.ruid = "bundler=rspack@1.5.7";
    var o = window.Roblox,
        n = i.n(o),
        c = window.CoreRobloxUtilities,
        l = window.HeaderScripts,
        u = window.EventTracker,
        d = ((e = {})[e.View = 0] = "View", e[e.Click = 1] = "Click", e[e.Error = 2] = "Error", e),
        s = ((t = {})[t.Web = 0] = "Web", t[t.MobileWeb = 1] = "MobileWeb", t),
        C = l.deviceMeta.getDeviceMeta(),
        f = (null == C ? void 0 : C.isPhone) || (null == C ? void 0 : C.isTablet) || (null == C ? void 0 : C.deviceType) === "phone",
        v = "AXTracking_".concat(f ? "Mweb" : "Web"),
        p = function(e) {
            var t = e.itemName,
                r = e.counterName,
                a = e.metaData,
                i = e.actionType,
                o = void 0 === i ? d.View : i,
                n = e.excludeCounter,
                l = e.excludeTelemetry,
                C = sessionStorage.getItem("AXAnalyticsDebugLogging");
            if (!(void 0 !== n && n)) {
                var p = r ? "".concat(v, "_").concat(r) : "".concat(v, "_").concat(t);
                (0, u.fireEvent)(p), C && console.log("AXAnalyticsService.sendCounter", p)
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
                    platform: f ? s.MobileWeb : s.Web
                }, a);
                c.eventStreamService.sendEventWithTarget("userJourneyAction", "RobloxWWW", b), C && console.log("AXAnalyticsService.sendEvent", b)
            }
        },
        b = function(e) {
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
        g = window.React;

    function h(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, a = Array(t); r < t; r++) a[r] = e[r];
        return a
    }

    function A(e, t) {
        return function(e) {
            if (Array.isArray(e)) return e
        }(e) || function(e, t) {
            var r, a, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
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
                if ("string" == typeof e) return h(e, t);
                var r = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return h(e, t)
            }
        }(e, t) || function() {
            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }
    var y = function() {
        var e = A((0, g.useState)(!1), 2),
            t = e[0],
            r = e[1],
            a = (0, g.useRef)(null);
        return (0, g.useEffect)(function() {
            var e = new IntersectionObserver(function(e) {
                    var t = A(e, 1)[0];
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

    function E(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, a = Array(t); r < t; r++) a[r] = e[r];
        return a
    }
    n().AXAnalyticsService = {
        sendAXTracking: p,
        useAXTrackView: function(e) {
            var t, r = (t = y(), function(e) {
                    if (Array.isArray(e)) return e
                }(t) || function(e, t) {
                    var r, a, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            n = !0,
                            c = !1;
                        try {
                            for (i = i.call(e); !(n = (r = i.next()).done) && (o.push(r.value), o.length !== t); n = !0);
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
                }(t, 2) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return E(e, 2);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return E(e, t)
                    }
                }(t, 2) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()),
                a = r[0],
                i = r[1];
            return (0, g.useEffect)(function() {
                i && p(e)
            }, [e, i]), [a]
        },
        useIsElementVisible: y,
        AXAnalyticsConstants: b,
        reportAXError: function(e) {
            var t = e.log,
                r = e.itemName,
                a = e.counterName;
            p({
                itemName: "AXError_".concat(r),
                counterName: a,
                metaData: {
                    metaData: t
                },
                actionType: d.Error
            })
        }
    }, n().AXSendTrackingActionType = d
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("AxAnalyticsService");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/axAnalyticsService-7b5bb97918ff7906.js.map