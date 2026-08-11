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
        o = ReactUtilities,
        i = ReactStyleGuide,
        m = RobloxThumbnails,
        l = {
            assetRootUrlTemplate: "catalog",
            bundleRootUrlTemplate: "bundles",
            avatarShopRecommendationUrl: Roblox.EnvironmentUrls.websiteUrl + "/catalog?Category=15",
            numberOfItemsToDisplay: 6
        },
        c = {
            common: [""],
            feature: "Feature.Recommendations"
        },
        s = (0, o.withTranslations)((function(e) {
            var t = e.recommendedItems,
                n = e.translate;
            return void 0 === t || t.length < 1 ? a().createElement("div", null) : a().createElement(a().Fragment, null, a().createElement("div", {
                className: "avatar-shop-homepage-recommendations-container",
                id: "populated-avatar-shop-homepage-recommendations"
            }, a().createElement("div", {
                className: "avatar-shop-homepage-carousel-title"
            }, a().createElement(i.Link, {
                url: l.avatarShopRecommendationUrl,
                className: "font-header-1"
            }, n("Label.AvatarItemsForYou")), a().createElement(i.Link, {
                url: l.avatarShopRecommendationUrl,
                className: "see-all-link-icon"
            }, n("Action.SeeAll"))), a().createElement("div", {
                className: "avatar-shop-homepage-carousel"
            }, t.map((function(e) {
                return a().createElement(i.ItemCard, {
                    id: e.itemId,
                    name: e.name,
                    type: e.itemType,
                    creatorName: e.creatorName,
                    creatorType: e.creatorType,
                    creatorTargetId: e.creatorId,
                    price: e.price,
                    lowestPrice: e.lowestPrice,
                    unitsAvailableForConsumption: e.numberRemaining,
                    itemStatus: e.itemStatus,
                    priceStatus: e.noPriceStatus,
                    premiumPricing: e.premiumPrice,
                    itemRestrictions: e.itemRestrictions,
                    thumbnail2d: a().createElement(m.Thumbnail2d, {
                        type: i.ItemCardUtils.checkIfBundle(e.itemType) ? m.ThumbnailTypes.bundleThumbnail : m.ThumbnailTypes.assetThumbnail,
                        targetId: e.itemId,
                        size: m.DefaultThumbnailSize
                    })
                })
            })))))
        }), c);

    function u() {
        var e = document.getElementById("avatar-shop-homepage-recommendations");
        e ? (0, r.render)(a().createElement(s, null), e) : window.requestAnimationFrame(u)
    }(0, n.ready)((function() {
        u()
    })), window.Roblox.AvatarShopHomepageRecommendations = s
}();
//# sourceMappingURL=https://js.rbxcdn.com/07da5216166d729c048724ec9406b975-avatarShopHomepageRecommendations.bundle.min.js.map

/* Bundle detector */
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("AvatarShopHomepageRecommendations");