;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "14669e7d-1296-f11b-3320-8f92ee45990b")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 730530, e => {
    "use strict";
    let t = e => e;
    e.s(["brandPretranslatedText", 0, e => t(e), "brandUntranslatableText", 0, t, "translateHTMLFn", 0, e => {
        let {
            translateHTML: t
        } = e;
        return (e, s, n) => {
            let {
                key: r
            } = e;
            return t(r, s, n)
        }
    }, "translationFn", 0, e => {
        let {
            translate: t
        } = e;
        return (e, s) => {
            let {
                key: n
            } = e;
            return t(n, s)
        }
    }, "translationKey", 0, (e, t) => ({
        key: e,
        namespace: t
    }), "translationKeyWithoutNamespace", 0, e => ({
        key: e,
        namespace: void 0
    })])
}, 213067, e => {
    "use strict";
    var t = e.i(721281);
    e.s(["default", 0, class e extends Error {
        constructor(s, n = "") {
            super("Generic BEDEV1 Error"), (0, t._)(this, "code", void 0), (0, t._)(this, "message", void 0), this.code = s, this.message = n, Error.captureStackTrace && Error.captureStackTrace(this, e)
        }
    }])
}, 185915, e => {
    "use strict";
    e.s(["default", 0, function(e) {
        return e && "object" == typeof e && "response" in e ? e.response : e && "object" == typeof e && "json" in e ? e : null
    }])
}, 227987, e => {
    "use strict";
    var t = e.i(185915);
    async function s(e) {
        try {
            let s = (0, t.default)(e);
            if (s) {
                let e = await s.json();
                if (e.errors.length > 0) {
                    let t = e.errors[0];
                    if (t) return {
                        status: s.status,
                        code: t.code,
                        message: t.message,
                        userFacingMessage: t.userFacingMessage,
                        fieldData: t.fieldData,
                        allErrors: e.errors.map(e => ({
                            code: e.code,
                            message: e.message,
                            userFacingMessage: e.userFacingMessage,
                            fieldData: e.fieldData
                        }))
                    }
                }
            }
            return null
        } catch (e) {
            return null
        }
    }
    e.s(["default", 0, s])
}, 759283, 253536, e => {
    "use strict";
    var t = e.i(751846),
        s = e.i(307529),
        n = e.i(251622),
        r = e.i(260022);
    let i = "".concat((0, r.getProductionCreatorHubUrl)("global"), "/docs/reference/engine/classes/Player#GetJoinData"),
        a = (0, r.resolveUrl)("developerArticleProductsInGamePurchasesUrl", "production", "global"),
        o = (0, r.resolveUrl)("developerArticleBadgesSpecialGameAwardsUrl", "production", "global"),
        u = "".concat((0, r.getProductionCreatorHubUrl)("global"), "/docs/production/monetization/game-passes"),
        l = (0, r.resolveUrl)("developerArticleCreateVipServerUrl", "production", "global"),
        d = "".concat((0, r.getProductionCreatorHubUrl)("global"), "/docs/production/publishing/publish-experiences-and-places#release-to-the-public"),
        c = "".concat((0, r.getProductionCreatorHubUrl)("global"), "/docs/projects/assets/privacy"),
        v = "".concat((0, r.getProductionCreatorHubUrl)("global"), "/docs/parts/models#distribute-models"),
        p = "".concat((0, r.getProductionCreatorHubUrl)("global"), "/docs/art/marketplace/publishing-to-marketplace#sale-location"),
        f = "".concat((0, r.getProductionCreatorHubUrl)("global"), "/docs/production/monetization/subscriptions#creating-subscriptions"),
        h = "".concat((0, r.getProductionCreatorHubUrl)("global"), "/docs/production/game-design/subscription-design#bundles"),
        m = "".concat((0, r.getProductionCreatorHubUrl)("global"), "/docs/production/monetization/subscriptions#earning-with-subscriptions"),
        b = (0, r.resolveUrl)("robloxCommunityStandardsUrl", "production", "global"),
        y = "".concat((0, r.getProductionCreatorHubUrl)("global"), "/docs/art/marketplace/marketplace-policy#ugc-program-guidelines"),
        g = "".concat((0, r.getProductionCreatorHubUrl)("global"), "/docs/art/marketplace/marketplace-fees-and-commissions#publishing-advance"),
        A = "".concat((0, r.getProductionCreatorHubUrl)("global"), "/docs/production/publishing/account-verification");
    (0, r.getProductionCreatorHubUrl)("global"), (0, r.getProductionCreatorHubUrl)("global");
    let w = (0, r.resolveUrl)("ugcSubscriptionTermsOfUseUrl", "production", "global"),
        S = (0, r.resolveUrl)("robloxTermsOfUseUrl", "production", "global"),
        E = (0, r.resolveUrl)("advertisingStandardsUrl", "production", "global"),
        I = "".concat((0, r.getProductionCreatorHubUrl)("global"), "/docs/production/publishing/account-verification"),
        R = "".concat((0, r.getProductionCreatorHubUrl)("global"), "/docs/production/monetization/avatar-creation-token");
    e.s(["ACCOUNT_VERIFICATION_URL", 0, I, "ASSET_ACCESS_PRIVACY", 0, c, "BADGE_LEARN_MORE_URL", 0, o, "CREATOR_STORE_VERIFICATION_URL", 0, A, "DEVELOPER_PRODUCT_LEARN_MORE_URL", 0, a, "DISTRIBUTE_MODELS", 0, v, "LAUNCH_DATA_LEARN_MORE_URL", 0, i, "MARKETPLACE_POLICY", 0, y, "MOMENTS_LEARN_MORE_URL", 0, "https://about.roblox.com/newsroom/2025/09/roblox-moments-user-generated-discovery", "PASS_LEARN_MORE_URL", 0, u, "PRIVATE_SERVER_LEARN_MORE_URL", 0, l, "PUBLISHING_ADVANCE", 0, g, "RELEASE_EXPERIENCE_TO_PUBLIC_URL", 0, d, "ROBLOX_ADVERTISING_STANDARDS", 0, E, "ROBLOX_COMMUNITY_STANDARDS", 0, b, "ROBLOX_TERMS_OF_USE", 0, S, "SALE_LOCATION_LEARN_MORE_URL", 0, p, "SUBSCRIPTION_LEARN_MORE_PRICING_URL", 0, m, "SUBSCRIPTION_LEARN_MORE_PRODUCT_TYPES_URL", 0, h, "SUBSCRIPTION_LEARN_MORE_URL", 0, f, "SUBSCRIPTION_TERMS_OF_USE", 0, w, "TOKEN_LEARN_MORE_URL", 0, R], 253536);
    let T = {
            [s.default.Place]: n.default.Game,
            [s.default.SharedExperiences]: n.default.Game,
            [s.default.MyExperiences]: n.default.Game,
            [s.default.ShareLink]: n.default.Game,
            [s.default.Moments]: n.default.Game,
            [s.default.TShirt]: n.default.CatalogAsset,
            [s.default.Shirt]: n.default.CatalogAsset,
            [s.default.Pants]: n.default.CatalogAsset,
            [s.default.Hat]: n.default.CatalogAsset,
            [s.default.HairAccessory]: n.default.CatalogAsset,
            [s.default.FaceAccessory]: n.default.CatalogAsset,
            [s.default.NeckAccessory]: n.default.CatalogAsset,
            [s.default.ShoulderAccessory]: n.default.CatalogAsset,
            [s.default.FrontAccessory]: n.default.CatalogAsset,
            [s.default.BackAccessory]: n.default.CatalogAsset,
            [s.default.WaistAccessory]: n.default.CatalogAsset,
            [s.default.TShirtAccessory]: n.default.CatalogAsset,
            [s.default.ShirtAccessory]: n.default.CatalogAsset,
            [s.default.PantsAccessory]: n.default.CatalogAsset,
            [s.default.JacketAccessory]: n.default.CatalogAsset,
            [s.default.SweaterAccessory]: n.default.CatalogAsset,
            [s.default.ShortsAccessory]: n.default.CatalogAsset,
            [s.default.DressSkirtAccessory]: n.default.CatalogAsset,
            [s.default.EmoteAnimation]: n.default.CatalogAsset,
            [s.default.EyebrowAccessory]: n.default.CatalogAsset,
            [s.default.EyelashAccessory]: n.default.CatalogAsset,
            [s.default.FaceMakeup]: n.default.CatalogAsset,
            [s.default.LipMakeup]: n.default.CatalogAsset,
            [s.default.EyeMakeup]: n.default.CatalogAsset,
            [s.default.AvatarBackground]: n.default.CatalogAsset,
            [s.default.AvatarLooks]: n.default.CatalogAsset,
            [s.default.Showcase]: n.default.CatalogAsset,
            [s.default.AllCatalogAsset]: n.default.CatalogAsset,
            [s.default.Decal]: n.default.LibraryAsset,
            [s.default.Image]: n.default.LibraryAsset,
            [s.default.Audio]: n.default.LibraryAsset,
            [s.default.Model]: n.default.LibraryAsset,
            [s.default.Mesh]: n.default.LibraryAsset,
            [s.default.MeshPart]: n.default.LibraryAsset,
            [s.default.Plugin]: n.default.LibraryAsset,
            [s.default.Animation]: n.default.LibraryAsset,
            [s.default.FontFamily]: n.default.LibraryAsset,
            [s.default.Video]: n.default.LibraryAsset,
            [s.default.Event]: n.default.Event,
            [s.default.PastEvent]: n.default.Event,
            [s.default.DraftEvent]: n.default.Event,
            [s.default.UpcomingEvent]: n.default.Event,
            [s.default.StorePreviewVideo]: n.default.LibraryAsset,
            [s.default.GamePreviewVideo]: n.default.LibraryAsset,
            [s.default.TextDocument]: n.default.LibraryAsset,
            [s.default.AssetPermissionRequests]: n.default.Game
        },
        P = {
            [n.default.Game]: "experiences",
            [n.default.CatalogAsset]: "catalog",
            [n.default.LibraryAsset]: "library",
            [n.default.Bundle]: "bundle",
            [n.default.Badge]: "badges",
            [n.default.GamePass]: "passes",
            [n.default.DeveloperProduct]: "developer-products",
            [n.default.TranslatorGame]: "experiences",
            [n.default.Places]: "places",
            [n.default.CreatedPlaces]: "places",
            [n.default.Event]: "events",
            [n.default.Notifications]: "notifications",
            [n.default.ExperienceSubscription]: "experience-subscriptions",
            [n.default.Advanced]: "advanced",
            [n.default.AvatarCreationToken]: "avatar-creation-tokens",
            [n.default.ReferralRewards]: "referral-reward-details",
            [n.default.Environment]: "environments",
            [n.default.Look]: "look",
            [n.default.Alert]: "alerts",
            [n.default.Journey]: "analytics/journeys"
        },
        L = {
            [n.default.Game]: t.ThumbnailTypes.gameIcon,
            [n.default.CatalogAsset]: t.ThumbnailTypes.assetThumbnail,
            [n.default.LibraryAsset]: t.ThumbnailTypes.assetThumbnail,
            [n.default.Bundle]: t.ThumbnailTypes.bundleThumbnail,
            [n.default.Badge]: t.ThumbnailTypes.badgeIcon,
            [n.default.GamePass]: t.ThumbnailTypes.gamePassIcon,
            [n.default.DeveloperProduct]: t.ThumbnailTypes.developerProductIcon,
            [n.default.TranslatorGame]: t.ThumbnailTypes.gameIcon,
            [n.default.Places]: t.ThumbnailTypes.placeIcon,
            [n.default.CreatedPlaces]: t.ThumbnailTypes.placeIcon,
            [n.default.Event]: t.ThumbnailTypes.universeThumbnail,
            [n.default.Notifications]: t.ThumbnailTypes.assetThumbnail,
            [n.default.ExperienceSubscription]: t.ThumbnailTypes.assetThumbnail,
            [n.default.Advanced]: t.ThumbnailTypes.assetThumbnail,
            [n.default.AvatarCreationToken]: t.ThumbnailTypes.bundleThumbnail,
            [n.default.ReferralRewards]: t.ThumbnailTypes.assetThumbnail,
            [n.default.Environment]: t.ThumbnailTypes.universeThumbnail,
            [n.default.Alert]: t.ThumbnailTypes.universeThumbnail,
            [n.default.Journey]: t.ThumbnailTypes.universeThumbnail,
            [n.default.Look]: t.ThumbnailTypes.assetThumbnail
        },
        C = {
            [n.default.Game]: t.ReturnPolicy.AutoGenerated,
            [n.default.Bundle]: t.ReturnPolicy.AutoGenerated,
            [n.default.CatalogAsset]: t.ReturnPolicy.PlaceHolder,
            [n.default.LibraryAsset]: t.ReturnPolicy.AutoGenerated,
            [n.default.Badge]: t.ReturnPolicy.AutoGenerated,
            [n.default.GamePass]: t.ReturnPolicy.AutoGenerated,
            [n.default.DeveloperProduct]: t.ReturnPolicy.AutoGenerated,
            [n.default.TranslatorGame]: t.ReturnPolicy.PlaceHolder,
            [n.default.Places]: t.ReturnPolicy.AutoGenerated,
            [n.default.CreatedPlaces]: t.ReturnPolicy.AutoGenerated,
            [n.default.Event]: t.ReturnPolicy.PlaceHolder,
            [n.default.Notifications]: t.ReturnPolicy.AutoGenerated,
            [n.default.ExperienceSubscription]: t.ReturnPolicy.AutoGenerated,
            [n.default.Advanced]: t.ReturnPolicy.AutoGenerated,
            [n.default.AvatarCreationToken]: t.ReturnPolicy.AutoGenerated,
            [n.default.ReferralRewards]: t.ReturnPolicy.AutoGenerated,
            [n.default.Environment]: t.ReturnPolicy.AutoGenerated,
            [n.default.Look]: t.ReturnPolicy.AutoGenerated,
            [n.default.Alert]: t.ReturnPolicy.AutoGenerated,
            [n.default.Journey]: t.ReturnPolicy.AutoGenerated
        },
        x = {
            [s.default.Place]: "Label.Games",
            [s.default.MyExperiences]: "Label.Games",
            [s.default.SharedExperiences]: "Label.Games",
            [s.default.TShirt]: "Label.TShirts",
            [s.default.Shirt]: "Label.Shirts",
            [s.default.Pants]: "Label.Pants",
            [s.default.Hat]: "Label.Hats",
            [s.default.HairAccessory]: "Label.HairAccessories",
            [s.default.FaceAccessory]: "Label.FaceAccessories",
            [s.default.NeckAccessory]: "Label.NeckAccessories",
            [s.default.ShoulderAccessory]: "Label.ShoulderAccessories",
            [s.default.FrontAccessory]: "Label.FrontAccessories",
            [s.default.BackAccessory]: "Label.BackAccessories",
            [s.default.WaistAccessory]: "Label.WaistAccessories",
            [s.default.TShirtAccessory]: "Label.TShirts",
            [s.default.ShirtAccessory]: "Label.Shirts",
            [s.default.PantsAccessory]: "Label.Pants",
            [s.default.JacketAccessory]: "Label.Jackets",
            [s.default.SweaterAccessory]: "Label.Sweaters",
            [s.default.ShortsAccessory]: "Label.ShortsAccessories",
            [s.default.DressSkirtAccessory]: "Label.Skirts",
            [s.default.EmoteAnimation]: "Label.Emote",
            [s.default.EyebrowAccessory]: "Label.EyebrowAccessories",
            [s.default.EyelashAccessory]: "Label.EyelashAccessories",
            [s.default.FaceMakeup]: "Label.FaceMakeupAccessories",
            [s.default.LipMakeup]: "Label.LipMakeupAccessories",
            [s.default.EyeMakeup]: "Label.EyeMakeupAccessories",
            [s.default.AvatarBackground]: "Label.Backgrounds",
            [s.default.AvatarLooks]: "Label.Avatars",
            [s.default.Showcase]: "Label.Showcases",
            [s.default.AllCatalogAsset]: "Label.AllAssetTypes",
            [s.default.Decal]: "Label.Decals",
            [s.default.Image]: "Label.Images",
            [s.default.Audio]: "Label.Audios",
            [s.default.Model]: "Label.Models",
            [s.default.Mesh]: "Label.Meshes",
            [s.default.MeshPart]: "Label.MeshParts",
            [s.default.Plugin]: "Label.Plugins",
            [s.default.FontFamily]: "Label.FontFamily",
            [s.default.Animation]: "Label.Animations",
            [s.default.Video]: "Label.Videos",
            [s.default.Event]: "Label.Events",
            [s.default.PastEvent]: "Label.PastEvents",
            [s.default.DraftEvent]: "Label.DraftEvents",
            [s.default.UpcomingEvent]: "Label.UpcomingEvents",
            [s.default.ShareLink]: "Label.ShareLinks",
            [s.default.Moments]: "Label.Moments",
            [s.default.StorePreviewVideo]: "Label.StorePreviewVideo",
            [s.default.GamePreviewVideo]: "Label.GamePreviewVideo",
            [s.default.TextDocument]: "Label.TextDocuments",
            [s.default.AssetPermissionRequests]: "Label.Requests"
        },
        U = {
            [s.default.Place]: "Label.Games",
            [s.default.MyExperiences]: "Label.Games",
            [s.default.SharedExperiences]: "Label.Games",
            [s.default.TShirt]: "Label.TShirt",
            [s.default.Shirt]: "Label.Shirt",
            [s.default.Pants]: "Label.Pants",
            [s.default.Hat]: "Label.Hat",
            [s.default.HairAccessory]: "Label.HairAccessory",
            [s.default.FaceAccessory]: "Label.FaceAccessory",
            [s.default.NeckAccessory]: "Label.NeckAccessory",
            [s.default.ShoulderAccessory]: "Label.ShoulderAccessory",
            [s.default.FrontAccessory]: "Label.FrontAccessory",
            [s.default.BackAccessory]: "Label.BackAccessory",
            [s.default.WaistAccessory]: "Label.WaistAccessory",
            [s.default.TShirtAccessory]: "Label.TShirt",
            [s.default.ShirtAccessory]: "Label.Shirt",
            [s.default.PantsAccessory]: "Label.Pants",
            [s.default.JacketAccessory]: "Label.Jacket",
            [s.default.SweaterAccessory]: "Label.Sweater",
            [s.default.ShortsAccessory]: "Label.ShortsAccessories",
            [s.default.DressSkirtAccessory]: "Label.Skirt",
            [s.default.EmoteAnimation]: "Label.Emote",
            [s.default.EyebrowAccessory]: "Label.EyebrowAccessory",
            [s.default.EyelashAccessory]: "Label.EyelashAccessory",
            [s.default.FaceMakeup]: "Label.FaceMakeup",
            [s.default.LipMakeup]: "Label.LipMakeup",
            [s.default.EyeMakeup]: "Label.EyeMAkeup",
            [s.default.AvatarBackground]: "Label.AvatarBackground",
            [s.default.AvatarLooks]: "Label.Avatars",
            [s.default.Showcase]: "Label.Showcase",
            [s.default.AllCatalogAsset]: "Label.AllAssetTypes",
            [s.default.Decal]: "Label.Decal",
            [s.default.Image]: "Label.Image",
            [s.default.Audio]: "Label.Audios",
            [s.default.Model]: "Label.Model",
            [s.default.Mesh]: "Label.Mesh",
            [s.default.MeshPart]: "Label.MeshPart",
            [s.default.Plugin]: "Label.Plugin",
            [s.default.Animation]: "Label.Animation",
            [s.default.FontFamily]: "Label.FontFamily",
            [s.default.Video]: "Label.Video",
            [s.default.Event]: "Label.Event",
            [s.default.PastEvent]: "Label.PastEvent",
            [s.default.DraftEvent]: "Label.DraftEvent",
            [s.default.UpcomingEvent]: "Label.UpcomingEvent",
            [s.default.ShareLink]: "Label.ShareLink",
            [s.default.Moments]: "Label.Moments",
            [s.default.StorePreviewVideo]: "Label.StorePreviewVideo",
            [s.default.GamePreviewVideo]: "Label.GamePreviewVideo",
            [s.default.TextDocument]: "Label.TextDocument",
            [s.default.AssetPermissionRequests]: "Label.Requests"
        },
        k = {
            [n.default.Game]: "Label.Games",
            [n.default.CatalogAsset]: "Label.AvatarItems",
            [n.default.Bundle]: "Label.AvatarItem",
            [n.default.LibraryAsset]: "Label.DevelopmentItems",
            [n.default.Badge]: "Label.Badges",
            [n.default.GamePass]: "Label.GamePasses",
            [n.default.DeveloperProduct]: "Label.DeveloperProducts",
            [n.default.TranslatorGame]: "Label.TranslatorGame",
            [n.default.Places]: "Label.Places",
            [n.default.CreatedPlaces]: "Label.Places",
            [n.default.Event]: "Label.Events",
            [n.default.Notifications]: "Label.Notifications",
            [n.default.ExperienceSubscription]: "Label.Subscriptions",
            [n.default.Advanced]: "Header.Title",
            [n.default.AvatarCreationToken]: "Label.AvatarCreationTokens",
            [n.default.ReferralRewards]: "Label.ReferralRewards",
            [n.default.Environment]: "Label.Environments",
            [n.default.Look]: "Label.Looks",
            [n.default.Alert]: "Heading.Alerts",
            [n.default.Journey]: "Heading.Journeys"
        },
        q = {
            [n.default.Game]: "Label.Game",
            [n.default.CatalogAsset]: "Label.AvatarItem",
            [n.default.Bundle]: "Label.AvatarItem",
            [n.default.LibraryAsset]: "Label.DevelopmentItem",
            [n.default.Badge]: "Label.Badge",
            [n.default.GamePass]: "Label.GamePass",
            [n.default.DeveloperProduct]: "Label.DeveloperProduct",
            [n.default.TranslatorGame]: "Label.TranslatorGame",
            [n.default.Places]: "Label.Place",
            [n.default.CreatedPlaces]: "Label.Places",
            [n.default.Event]: "Label.Event",
            [n.default.Notifications]: "Label.Notifications",
            [n.default.ExperienceSubscription]: "Label.Subscription",
            [n.default.Advanced]: "Header.Title",
            [n.default.AvatarCreationToken]: "Label.Token",
            [n.default.ReferralRewards]: "Label.ReferralRewards",
            [n.default.Environment]: "Label.Environment",
            [n.default.Look]: "Label.Looks",
            [n.default.Alert]: "Heading.Alert",
            [n.default.Journey]: "Heading.Journey"
        },
        G = {
            [n.default.Game]: "Heading.Game",
            [n.default.CatalogAsset]: "Heading.AvatarItem",
            [n.default.Bundle]: "Heading.AvatarItem",
            [n.default.LibraryAsset]: "Heading.DevelopmentItem",
            [n.default.Badge]: "Heading.Badge",
            [n.default.GamePass]: "Heading.Pass",
            [n.default.DeveloperProduct]: "Heading.DeveloperProduct",
            [n.default.TranslatorGame]: "Heading.TranslatorGame",
            [n.default.Places]: "Heading.Place",
            [n.default.CreatedPlaces]: "Heading.Place",
            [n.default.Event]: "Heading.Event",
            [n.default.Notifications]: "Heading.Notifications.CreateContent",
            [n.default.ExperienceSubscription]: "Heading.Subscription",
            [n.default.Advanced]: "Header.Title",
            [n.default.AvatarCreationToken]: "Label.AvatarCreationToken",
            [n.default.ReferralRewards]: "Heading.ReferralRewards",
            [n.default.Environment]: "Heading.Environment",
            [n.default.Look]: "Heading.Looks",
            [n.default.Alert]: "Heading.Alert",
            [n.default.Journey]: "Heading.Journey"
        },
        O = {
            [n.default.Game]: null,
            [n.default.CatalogAsset]: null,
            [n.default.Bundle]: null,
            [n.default.LibraryAsset]: null,
            [n.default.Badge]: "badges/create",
            [n.default.GamePass]: "passes/create",
            [n.default.DeveloperProduct]: "developer-products/create",
            [n.default.ReferralRewards]: "referral-reward-details/create",
            [n.default.TranslatorGame]: null,
            [n.default.Places]: null,
            [n.default.CreatedPlaces]: null,
            [n.default.Event]: "events/create",
            [n.default.Notifications]: null,
            [n.default.ExperienceSubscription]: "experience-subscriptions/create",
            [n.default.Advanced]: null,
            [n.default.AvatarCreationToken]: "avatar-creation-tokens/create",
            [n.default.Environment]: "environments/create",
            [n.default.Look]: "looks/create",
            [n.default.Alert]: "alerts/create",
            [n.default.Journey]: "analytics/journeys/create"
        },
        V = {
            [n.default.Game]: null,
            [n.default.CatalogAsset]: null,
            [n.default.Bundle]: null,
            [n.default.LibraryAsset]: null,
            [n.default.Badge]: "badges/reorder",
            [n.default.ReferralRewards]: null,
            [n.default.GamePass]: null,
            [n.default.DeveloperProduct]: null,
            [n.default.TranslatorGame]: null,
            [n.default.Places]: null,
            [n.default.CreatedPlaces]: null,
            [n.default.Event]: null,
            [n.default.Notifications]: null,
            [n.default.ExperienceSubscription]: null,
            [n.default.Advanced]: null,
            [n.default.AvatarCreationToken]: null,
            [n.default.Environment]: null,
            [n.default.Look]: null,
            [n.default.Alert]: null,
            [n.default.Journey]: null
        },
        N = {
            [n.default.Badge]: o,
            [n.default.DeveloperProduct]: a,
            [n.default.GamePass]: u,
            [n.default.CatalogAsset]: p,
            [n.default.ExperienceSubscription]: f,
            [n.default.AvatarCreationToken]: R,
            [n.default.Look]: void 0
        };
    e.s(["AllSettlePromiseFailed", 0, "rejected", "AllSettlePromiseSuccess", 0, "fulfilled", "assetFullNameKeys", 0, x, "assetTypeToItemType", 0, T, "assetTypeToSingularNameKeys", 0, U, "itemFullNameKeys", 0, k, "itemTypeToCreatePath", 0, O, "itemTypeToLearnMoreUrl", 0, N, "itemTypeToNameKeys", 0, q, "itemTypeToPath", 0, P, "itemTypeToReorderPath", 0, V, "itemTypeToReturnPolicyType", 0, C, "itemTypeToSingularNameKeys", 0, G, "itemTypeToThumbnailType", 0, L, "toastDurationTime", 0, 3e3, "uninitializedUniverseId", 0, -1], 759283)
}, 671376, e => {
    "use strict";
    var t = e.i(307529);
    e.s(["Asset", () => t.default])
}, 475360, e => {
    "use strict";
    var t = e.i(251622);
    e.s(["Item", () => t.default])
}, 376618, e => {
    "use strict";
    var t = e.i(677753),
        s = function(e, t) {
            return (s = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var s in t) Object.prototype.hasOwnProperty.call(t, s) && (e[s] = t[s])
            })(e, t)
        };

    function n(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function n() {
            this.constructor = e
        }
        s(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
    }

    function r(e, t, s, n) {
        return new(s || (s = Promise))(function(r, i) {
            function a(e) {
                try {
                    u(n.next(e))
                } catch (e) {
                    i(e)
                }
            }

            function o(e) {
                try {
                    u(n.throw(e))
                } catch (e) {
                    i(e)
                }
            }

            function u(e) {
                var t;
                e.done ? r(e.value) : ((t = e.value) instanceof s ? t : new s(function(e) {
                    e(t)
                })).then(a, o)
            }
            u((n = n.apply(e, t || [])).next())
        })
    }

    function i(e, t) {
        var s, n, r, i = {
                label: 0,
                sent: function() {
                    if (1 & r[0]) throw r[1];
                    return r[1]
                },
                trys: [],
                ops: []
            },
            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return a.next = o(0), a.throw = o(1), a.return = o(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
            return this
        }), a;

        function o(o) {
            return function(u) {
                var l = [o, u];
                if (s) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, l[0] && (i = 0)), i;) try {
                    if (s = 1, n && (r = 2 & l[0] ? n.return : l[0] ? n.throw || ((r = n.return) && r.call(n), 0) : n.next) && !(r = r.call(n, l[1])).done) return r;
                    switch (n = 0, r && (l = [2 & l[0], r.value]), l[0]) {
                        case 0:
                        case 1:
                            r = l;
                            break;
                        case 4:
                            return i.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            i.label++, n = l[1], l = [0];
                            continue;
                        case 7:
                            l = i.ops.pop(), i.trys.pop();
                            continue;
                        default:
                            if (!(r = (r = i.trys).length > 0 && r[r.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === l[0] && (!r || l[1] > r[0] && l[1] < r[3])) {
                                i.label = l[1];
                                break
                            }
                            if (6 === l[0] && i.label < r[1]) {
                                i.label = r[1], r = l;
                                break
                            }
                            if (r && i.label < r[2]) {
                                i.label = r[2], i.ops.push(l);
                                break
                            }
                            r[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    l = t.call(e, i)
                } catch (e) {
                    l = [6, e], n = 0
                } finally {
                    s = r = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function a(e, s) {
        var n;
        return null == e ? e : {
            creator: (0, t.exists)(e, "creator") ? null == (n = e.creator) ? n : {
                userId: (0, t.exists)(n, "userId") ? n.userId : void 0,
                groupId: (0, t.exists)(n, "groupId") ? n.groupId : void 0,
                experienceId: (0, t.exists)(n, "experienceId") ? n.experienceId : void 0
            } : void 0,
            expectedPrice: (0, t.exists)(e, "expectedPrice") ? e.expectedPrice : void 0,
            creatingUniverseId: (0, t.exists)(e, "creatingUniverseId") ? e.creatingUniverseId : void 0,
            assetPrivacy: (0, t.exists)(e, "assetPrivacy") ? e.assetPrivacy : void 0,
            accessScope: (0, t.exists)(e, "accessScope") ? e.accessScope : void 0,
            intendedVersionState: (0, t.exists)(e, "intendedVersionState") ? e.intendedVersionState : void 0,
            hasIntendedVersionState: (0, t.exists)(e, "hasIntendedVersionState") ? e.hasIntendedVersionState : void 0
        }
    }

    function o(e, s) {
        return null == e ? e : {
            moderationState: (0, t.exists)(e, "moderationState") ? e.moderationState : void 0
        }
    }

    function u(e) {
        var s;
        return null == (s = e) ? s : {
            asset: (0, t.exists)(s, "asset") ? s.asset : void 0,
            altText: (0, t.exists)(s, "altText") ? s.altText : void 0
        }
    }

    function l(e) {
        if (void 0 !== e) return null === e ? null : {
            asset: e.asset,
            altText: e.altText
        }
    }

    function d(e, s) {
        return null == e ? e : {
            title: (0, t.exists)(e, "title") ? e.title : void 0,
            uri: (0, t.exists)(e, "uri") ? e.uri : void 0
        }
    }

    function c(e) {
        if (void 0 !== e) return null === e ? null : {
            title: e.title,
            uri: e.uri
        }
    }

    function v(e, s) {
        return null == e ? e : {
            path: (0, t.exists)(e, "path") ? e.path : void 0,
            revisionId: (0, t.exists)(e, "revisionId") ? e.revisionId : void 0,
            revisionCreateTime: (0, t.exists)(e, "revisionCreateTime") ? null === e.revisionCreateTime ? null : new Date(e.revisionCreateTime) : void 0,
            assetId: (0, t.exists)(e, "assetId") ? e.assetId : void 0,
            displayName: (0, t.exists)(e, "displayName") ? e.displayName : void 0,
            description: (0, t.exists)(e, "description") ? e.description : void 0,
            assetType: (0, t.exists)(e, "assetType") ? e.assetType : void 0,
            creationContext: (0, t.exists)(e, "creationContext") ? a(e.creationContext) : void 0,
            moderationResult: (0, t.exists)(e, "moderationResult") ? o(e.moderationResult) : void 0,
            published: (0, t.exists)(e, "published") ? e.published : void 0,
            hasPublished: (0, t.exists)(e, "hasPublished") ? e.hasPublished : void 0,
            icon: (0, t.exists)(e, "icon") ? e.icon : void 0,
            previews: (0, t.exists)(e, "previews") ? null === e.previews ? null : e.previews.map(u) : void 0,
            state: (0, t.exists)(e, "state") ? e.state : void 0,
            facebookSocialLink: (0, t.exists)(e, "facebookSocialLink") ? d(e.facebookSocialLink) : void 0,
            twitterSocialLink: (0, t.exists)(e, "twitterSocialLink") ? d(e.twitterSocialLink) : void 0,
            youtubeSocialLink: (0, t.exists)(e, "youtubeSocialLink") ? d(e.youtubeSocialLink) : void 0,
            twitchSocialLink: (0, t.exists)(e, "twitchSocialLink") ? d(e.twitchSocialLink) : void 0,
            discordSocialLink: (0, t.exists)(e, "discordSocialLink") ? d(e.discordSocialLink) : void 0,
            githubSocialLink: (0, t.exists)(e, "githubSocialLink") ? d(e.githubSocialLink) : void 0,
            robloxSocialLink: (0, t.exists)(e, "robloxSocialLink") ? d(e.robloxSocialLink) : void 0,
            guildedSocialLink: (0, t.exists)(e, "guildedSocialLink") ? d(e.guildedSocialLink) : void 0,
            devForumSocialLink: (0, t.exists)(e, "devForumSocialLink") ? d(e.devForumSocialLink) : void 0,
            tryAssetSocialLink: (0, t.exists)(e, "tryAssetSocialLink") ? d(e.tryAssetSocialLink) : void 0
        }
    }

    function p(e) {
        if (void 0 !== e) return null === e ? null : {
            path: e.path,
            revisionId: e.revisionId,
            revisionCreateTime: void 0 === e.revisionCreateTime ? void 0 : null === e.revisionCreateTime ? null : e.revisionCreateTime.toISOString(),
            assetId: e.assetId,
            displayName: e.displayName,
            description: e.description,
            assetType: e.assetType,
            creationContext: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    creator: function(e) {
                        if (void 0 !== e) return null === e ? null : {
                            userId: e.userId,
                            groupId: e.groupId,
                            experienceId: e.experienceId
                        }
                    }(e.creator),
                    expectedPrice: e.expectedPrice,
                    creatingUniverseId: e.creatingUniverseId,
                    assetPrivacy: e.assetPrivacy,
                    accessScope: e.accessScope,
                    intendedVersionState: e.intendedVersionState
                }
            }(e.creationContext),
            moderationResult: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    moderationState: e.moderationState
                }
            }(e.moderationResult),
            published: e.published,
            icon: e.icon,
            previews: void 0 === e.previews ? void 0 : null === e.previews ? null : e.previews.map(l),
            state: e.state,
            facebookSocialLink: c(e.facebookSocialLink),
            twitterSocialLink: c(e.twitterSocialLink),
            youtubeSocialLink: c(e.youtubeSocialLink),
            twitchSocialLink: c(e.twitchSocialLink),
            discordSocialLink: c(e.discordSocialLink),
            githubSocialLink: c(e.githubSocialLink),
            robloxSocialLink: c(e.robloxSocialLink),
            guildedSocialLink: c(e.guildedSocialLink),
            devForumSocialLink: c(e.devForumSocialLink),
            tryAssetSocialLink: c(e.tryAssetSocialLink)
        }
    }

    function f(e) {
        var s;
        return null == (s = e) ? s : {
            path: (0, t.exists)(s, "path") ? s.path : void 0,
            quotaType: (0, t.exists)(s, "quotaType") ? s.quotaType : void 0,
            assetType: (0, t.exists)(s, "assetType") ? s.assetType : void 0,
            usage: (0, t.exists)(s, "usage") ? s.usage : void 0,
            capacity: (0, t.exists)(s, "capacity") ? s.capacity : void 0,
            period: (0, t.exists)(s, "period") ? s.period : void 0,
            usageResetTime: (0, t.exists)(s, "usageResetTime") ? null === s.usageResetTime ? null : new Date(s.usageResetTime) : void 0
        }
    }

    function h(e) {
        var s;
        return null == (s = e) ? s : {
            path: (0, t.exists)(s, "path") ? s.path : void 0,
            createTime: (0, t.exists)(s, "createTime") ? null === s.createTime ? null : new Date(s.createTime) : void 0,
            creationContext: (0, t.exists)(s, "creationContext") ? a(s.creationContext) : void 0,
            moderationResult: (0, t.exists)(s, "moderationResult") ? o(s.moderationResult) : void 0,
            published: (0, t.exists)(s, "published") ? s.published : void 0,
            versionState: (0, t.exists)(s, "versionState") ? s.versionState : void 0
        }
    }

    function m(e) {
        var s;
        return null == (s = e) ? s : {
            reason: (0, t.exists)(s, "reason") ? s.reason : void 0,
            domain: (0, t.exists)(s, "domain") ? s.domain : void 0,
            metadata: (0, t.exists)(s, "metadata") ? s.metadata : void 0
        }
    }

    function b(e) {
        if (void 0 !== e) return null === e ? null : {
            asset: p(e.asset),
            file: e.file,
            additionalParameters: e.additionalParameters
        }
    }

    function y(e) {
        var s;
        return null == (s = e) ? s : {
            httpVerb: (0, t.exists)(s, "httpVerb") ? s.httpVerb : void 0,
            url: (0, t.exists)(s, "url") ? s.url : void 0,
            expirationTimeMs: (0, t.exists)(s, "expirationTimeMs") ? s.expirationTimeMs : void 0,
            chunkNum: (0, t.exists)(s, "chunkNum") ? s.chunkNum : void 0,
            contentStart: (0, t.exists)(s, "contentStart") ? s.contentStart : void 0,
            contentLength: (0, t.exists)(s, "contentLength") ? s.contentLength : void 0
        }
    }

    function g(e, s) {
        return null == e ? e : {
            operationPath: (0, t.exists)(e, "operationPath") ? e.operationPath : void 0,
            uploadUrls: (0, t.exists)(e, "uploadUrls") ? null === e.uploadUrls ? null : e.uploadUrls.map(y) : void 0
        }
    }

    function A(e, s) {
        var n;
        return null == e ? e : {
            path: (0, t.exists)(e, "path") ? e.path : void 0,
            operationId: (0, t.exists)(e, "operationId") ? e.operationId : void 0,
            done: (0, t.exists)(e, "done") ? e.done : void 0,
            error: (0, t.exists)(e, "error") ? null == (n = e.error) ? n : {
                code: (0, t.exists)(n, "code") ? n.code : void 0,
                message: (0, t.exists)(n, "message") ? n.message : void 0,
                details: (0, t.exists)(n, "details") ? n.details.map(m) : void 0
            } : void 0,
            response: (0, t.exists)(e, "response") ? v(e.response) : void 0
        }
    }
    var w = function(e) {
            function s() {
                return null !== e && e.apply(this, arguments) || this
            }
            return n(s, e), s.prototype.assetsArchiveAssetRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var n, r, a;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetsArchiveAsset.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}:archive".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}:archive",
                                    method: "POST",
                                    headers: r,
                                    query: n
                                }, s)];
                            case 1:
                                return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return v(e)
                                })]
                        }
                    })
                })
            }, s.prototype.assetsArchiveAsset = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.assetsArchiveAssetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.assetsChangeAssetVersionStateRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var n, r, a;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetsChangeAssetVersionState.");
                                if (null === e.versionNumber || void 0 === e.versionNumber) throw new t.RequiredError("versionNumber", "Required parameter requestParameters.versionNumber was null or undefined when calling assetsChangeAssetVersionState.");
                                return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/assets/{assetId}/versions/{versionNumber}:changeState".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))).replace("{".concat("versionNumber", "}"), encodeURIComponent(String(e.versionNumber))),
                                    schemaPath: "/v1/assets/{assetId}/versions/{versionNumber}:changeState",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            intendedVersionState: e.intendedVersionState,
                                            childAssetsMode: e.childAssetsMode
                                        }
                                    }(e.changeAssetVersionStateRequest)
                                }, s)];
                            case 1:
                                return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return A(e)
                                })]
                        }
                    })
                })
            }, s.prototype.assetsChangeAssetVersionState = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.assetsChangeAssetVersionStateRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.assetsCreateAssetRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var n, r, a, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.fileContent || void 0 === e.fileContent) throw new t.RequiredError("fileContent", "Required parameter requestParameters.fileContent was null or undefined when calling assetsCreateAsset.");
                                return n = {}, r = {}, a = (0, t.canConsumeForm)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.fileContent && a.append("fileContent", e.fileContent), void 0 !== e.request && a.append("request", JSON.stringify(p(e.request))), [4, this.request({
                                    path: "/v1/assets",
                                    schemaPath: "/v1/assets",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: a
                                }, s)];
                            case 1:
                                return o = i.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return A(e)
                                })]
                        }
                    })
                })
            }, s.prototype.assetsCreateAsset = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.assetsCreateAssetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.assetsGetAssetRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var n, r, a;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetsGetAsset.");
                                return n = {}, e.readMask && (n.readMask = e.readMask.join(t.COLLECTION_FORMATS.csv)), r = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, s)];
                            case 1:
                                return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return v(e)
                                })]
                        }
                    })
                })
            }, s.prototype.assetsGetAsset = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.assetsGetAssetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.assetsRestoreAssetRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var n, r, a;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetsRestoreAsset.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}:restore".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}:restore",
                                    method: "POST",
                                    headers: r,
                                    query: n
                                }, s)];
                            case 1:
                                return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return v(e)
                                })]
                        }
                    })
                })
            }, s.prototype.assetsRestoreAsset = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.assetsRestoreAssetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.assetsUpdateAssetRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var n, r, a, o;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetsUpdateAsset.");
                                return n = {}, e.updateMask && (n.updateMask = e.updateMask.join(t.COLLECTION_FORMATS.csv)), r = {}, a = (0, t.canConsumeForm)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.fileContent && a.append("fileContent", e.fileContent), void 0 !== e.request && a.append("request", JSON.stringify(p(e.request))), [4, this.request({
                                    path: "/v1/assets/{assetId}".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}",
                                    method: "PATCH",
                                    headers: r,
                                    query: n,
                                    body: a
                                }, s)];
                            case 1:
                                return o = i.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return A(e)
                                })]
                        }
                    })
                })
            }, s.prototype.assetsUpdateAsset = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.assetsUpdateAssetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s
        }(t.BaseAPI),
        S = function(e) {
            function s() {
                return null !== e && e.apply(this, arguments) || this
            }
            return n(s, e), s.prototype.assetsGetAssetVersionRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var n, r, a;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetsGetAssetVersion.");
                                if (null === e.revisionId || void 0 === e.revisionId) throw new t.RequiredError("revisionId", "Required parameter requestParameters.revisionId was null or undefined when calling assetsGetAssetVersion.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}/versions/{revisionId}".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))).replace("{".concat("revisionId", "}"), encodeURIComponent(String(e.revisionId))),
                                    schemaPath: "/v1/assets/{assetId}/versions/{revisionId}",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, s)];
                            case 1:
                                return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return h(e)
                                })]
                        }
                    })
                })
            }, s.prototype.assetsGetAssetVersion = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.assetsGetAssetVersionRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.assetsListAssetVersionsRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var n, r, a;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetsListAssetVersions.");
                                return n = {}, void 0 !== e.maxPageSize && (n.maxPageSize = e.maxPageSize), void 0 !== e.pageToken && (n.pageToken = e.pageToken), void 0 !== e.filter && (n.filter = e.filter), r = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}/versions".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/versions",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, s)];
                            case 1:
                                return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        assetVersions: (0, t.exists)(e, "assetVersions") ? null === e.assetVersions ? null : e.assetVersions.map(h) : void 0,
                                        nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.assetsListAssetVersions = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.assetsListAssetVersionsRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.assetsRollbackAssetVersionRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var n, r, a;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetsRollbackAssetVersion.");
                                return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/assets/{assetId}/versions:rollback".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/versions:rollback",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            assetVersion: e.assetVersion
                                        }
                                    }(e.rollbackAssetVersionRequest)
                                }, s)];
                            case 1:
                                return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return h(e)
                                })]
                        }
                    })
                })
            }, s.prototype.assetsRollbackAssetVersion = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.assetsRollbackAssetVersionRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s
        }(t.BaseAPI),
        E = function(e) {
            function s() {
                return null !== e && e.apply(this, arguments) || this
            }
            return n(s, e), s.prototype.assetsCreateAssetWithMultipartUploadRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var n, r, a;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/assets:multipartUpload",
                                    schemaPath: "/v1/assets:multipartUpload",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: b(e.multipartUploadStartRequest)
                                }, s)];
                            case 1:
                                return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return g(e)
                                })]
                        }
                    })
                })
            }, s.prototype.assetsCreateAssetWithMultipartUpload = function() {
                return r(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), i(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.assetsCreateAssetWithMultipartUploadRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.assetsMultipartUploadAbortRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var n, r, a;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.operationId || void 0 === e.operationId) throw new t.RequiredError("operationId", "Required parameter requestParameters.operationId was null or undefined when calling assetsMultipartUploadAbort.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/operations/{operationId}:multipartUpload".replace("{".concat("operationId", "}"), encodeURIComponent(String(e.operationId))),
                                    schemaPath: "/v1/operations/{operationId}:multipartUpload",
                                    method: "DELETE",
                                    headers: r,
                                    query: n
                                }, s)];
                            case 1:
                                return a = i.sent(), [2, new t.VoidApiResponse(a)]
                        }
                    })
                })
            }, s.prototype.assetsMultipartUploadAbort = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.assetsMultipartUploadAbortRaw(e, t)];
                            case 1:
                                return s.sent(), [2]
                        }
                    })
                })
            }, s.prototype.assetsMultipartUploadChunkCompleteRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var n, r, a;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.operationId || void 0 === e.operationId) throw new t.RequiredError("operationId", "Required parameter requestParameters.operationId was null or undefined when calling assetsMultipartUploadChunkComplete.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/operations/{operationId}:multipartUploadChunkComplete".replace("{".concat("operationId", "}"), encodeURIComponent(String(e.operationId))),
                                    schemaPath: "/v1/operations/{operationId}:multipartUploadChunkComplete",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            chunkNum: e.chunkNum,
                                            eTag: e.eTag
                                        }
                                    }(e.multipartUploadChunkCompleteRequest)
                                }, s)];
                            case 1:
                                return a = i.sent(), [2, new t.VoidApiResponse(a)]
                        }
                    })
                })
            }, s.prototype.assetsMultipartUploadChunkComplete = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.assetsMultipartUploadChunkCompleteRaw(e, t)];
                            case 1:
                                return s.sent(), [2]
                        }
                    })
                })
            }, s.prototype.assetsMultipartUploadCompleteRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var n, r, a;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.operationId || void 0 === e.operationId) throw new t.RequiredError("operationId", "Required parameter requestParameters.operationId was null or undefined when calling assetsMultipartUploadComplete.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/operations/{operationId}:multipartUploadComplete".replace("{".concat("operationId", "}"), encodeURIComponent(String(e.operationId))),
                                    schemaPath: "/v1/operations/{operationId}:multipartUploadComplete",
                                    method: "POST",
                                    headers: r,
                                    query: n
                                }, s)];
                            case 1:
                                return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return A(e)
                                })]
                        }
                    })
                })
            }, s.prototype.assetsMultipartUploadComplete = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.assetsMultipartUploadCompleteRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.assetsUpdateAssetWithMultipartUploadRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var n, r, a;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetsUpdateAssetWithMultipartUpload.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/assets/{assetId}:multipartUpload".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}:multipartUpload",
                                    method: "PATCH",
                                    headers: r,
                                    query: n,
                                    body: b(e.multipartUploadStartRequest)
                                }, s)];
                            case 1:
                                return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return g(e)
                                })]
                        }
                    })
                })
            }, s.prototype.assetsUpdateAssetWithMultipartUpload = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.assetsUpdateAssetWithMultipartUploadRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s
        }(t.BaseAPI),
        I = function(e) {
            function s() {
                return null !== e && e.apply(this, arguments) || this
            }
            return n(s, e), s.prototype.assetsGetOperationRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var n, r, a;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.operationId || void 0 === e.operationId) throw new t.RequiredError("operationId", "Required parameter requestParameters.operationId was null or undefined when calling assetsGetOperation.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/operations/{operationId}".replace("{".concat("operationId", "}"), encodeURIComponent(String(e.operationId))),
                                    schemaPath: "/v1/operations/{operationId}",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, s)];
                            case 1:
                                return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return A(e)
                                })]
                        }
                    })
                })
            }, s.prototype.assetsGetOperation = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.assetsGetOperationRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s
        }(t.BaseAPI);
    (function(e) {
        function s() {
            return null !== e && e.apply(this, arguments) || this
        }
        n(s, e), s.prototype.usersListAssetQuotasRaw = function(e, s) {
            return r(this, void 0, void 0, function() {
                var n, r, a;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new t.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling usersListAssetQuotas.");
                            return n = {}, void 0 !== e.maxPageSize && (n.maxPageSize = e.maxPageSize), void 0 !== e.pageToken && (n.pageToken = e.pageToken), void 0 !== e.filter && (n.filter = e.filter), r = {}, [4, this.request({
                                path: "/v2/users/{userId}/asset-quotas".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                schemaPath: "/v2/users/{userId}/asset-quotas",
                                method: "GET",
                                headers: r,
                                query: n
                            }, s)];
                        case 1:
                            return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    assetQuotas: (0, t.exists)(e, "assetQuotas") ? null === e.assetQuotas ? null : e.assetQuotas.map(f) : void 0,
                                    nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.usersListAssetQuotas = function(e, t) {
            return r(this, void 0, void 0, function() {
                return i(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.usersListAssetQuotasRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }
    })(t.BaseAPI), e.s(["AssetApi", 0, w, "AssetPrivacy", 0, {
        Unspecified: "Unspecified",
        Default: "Default",
        OpenUse: "OpenUse",
        Restricted: "Restricted"
    }, "AssetType", 0, {
        Unspecified: "Unspecified",
        Image: "Image",
        Tshirt: "Tshirt",
        Audio: "Audio",
        Mesh: "Mesh",
        Lua: "Lua",
        Html: "Html",
        Text: "Text",
        Hat: "Hat",
        Place: "Place",
        Model: "Model",
        Shirt: "Shirt",
        Pants: "Pants",
        Decal: "Decal",
        Avatar: "Avatar",
        Head: "Head",
        Face: "Face",
        Gear: "Gear",
        Badge: "Badge",
        GroupEmblem: "GroupEmblem",
        Animation: "Animation",
        Arms: "Arms",
        Legs: "Legs",
        Torso: "Torso",
        RightArm: "RightArm",
        LeftArm: "LeftArm",
        LeftLeg: "LeftLeg",
        RightLeg: "RightLeg",
        Package: "Package",
        YoutubeVideo: "YoutubeVideo",
        GamePass: "GamePass",
        App: "App",
        Code: "Code",
        Plugin: "Plugin",
        SolidModel: "SolidModel",
        MeshPart: "MeshPart",
        HairAccessory: "HairAccessory",
        FaceAccessory: "FaceAccessory",
        NeckAccessory: "NeckAccessory",
        ShoulderAccessory: "ShoulderAccessory",
        FrontAccessory: "FrontAccessory",
        BackAccessory: "BackAccessory",
        WaistAccessory: "WaistAccessory",
        ClimbAnimation: "ClimbAnimation",
        DeathAnimation: "DeathAnimation",
        FallAnimation: "FallAnimation",
        IdleAnimation: "IdleAnimation",
        JumpAnimation: "JumpAnimation",
        RunAnimation: "RunAnimation",
        SwimAnimation: "SwimAnimation",
        WalkAnimation: "WalkAnimation",
        PoseAnimation: "PoseAnimation",
        LocalizationTableManifest: "LocalizationTableManifest",
        LocalizationTableTranslation: "LocalizationTableTranslation",
        EmoteAnimation: "EmoteAnimation",
        Video: "Video",
        TexturePack: "TexturePack",
        TshirtAccessory: "TshirtAccessory",
        ShirtAccessory: "ShirtAccessory",
        PantsAccessory: "PantsAccessory",
        JacketAccessory: "JacketAccessory",
        SweaterAccessory: "SweaterAccessory",
        ShortsAccessory: "ShortsAccessory",
        LeftShoeAccessory: "LeftShoeAccessory",
        RightShoeAccessory: "RightShoeAccessory",
        DressSkirtAccessory: "DressSkirtAccessory",
        FontFamily: "FontFamily",
        FontFace: "FontFace",
        MeshHiddenSurfaceRemoval: "MeshHiddenSurfaceRemoval",
        EyebrowAccessory: "EyebrowAccessory",
        EyelashAccessory: "EyelashAccessory",
        MoodAnimation: "MoodAnimation",
        DynamicHead: "DynamicHead",
        CodeSnippet: "CodeSnippet",
        AdsVideo: "AdsVideo",
        OtaUpdate: "OtaUpdate",
        Screenshot: "Screenshot",
        RuntimePropertySet: "RuntimePropertySet",
        StorePreviewVideo: "StorePreviewVideo",
        GamePreviewVideo: "GamePreviewVideo",
        CreatorExperienceConfig: "CreatorExperienceConfig",
        FaceMakeup: "FaceMakeup",
        LipMakeup: "LipMakeup",
        EyeMakeup: "EyeMakeup",
        VoxelFragment: "VoxelFragment",
        AvatarBackground: "AvatarBackground",
        TextDocument: "TextDocument",
        Post: "Post",
        AnimatedImage: "AnimatedImage",
        ComputeFunction: "ComputeFunction"
    }, "AssetVersionApi", 0, S, "AssetVersionState", 0, {
        Unspecified: "Unspecified",
        Draft: "Draft",
        Published: "Published",
        Rejected: "Rejected"
    }, "ModerationState", 0, {
        Unspecified: "Unspecified",
        Reviewing: "Reviewing",
        Rejected: "Rejected",
        Approved: "Approved"
    }, "MultipartUploadApi", 0, E, "PreviewFromJSON", 0, u, "RobloxAssetsManagementAssetsUploadApiAssetVersionState", 0, {
        Unspecified: "ASSET_VERSION_STATE_UNSPECIFIED",
        Draft: "ASSET_VERSION_STATE_DRAFT",
        Published: "ASSET_VERSION_STATE_PUBLISHED",
        Rejected: "ASSET_VERSION_STATE_REJECTED"
    }, "UploadStatusApi", 0, I])
}, 54842, e => {
    "use strict";
    var t = e.i(677753),
        s = function(e, t) {
            return (s = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var s in t) Object.prototype.hasOwnProperty.call(t, s) && (e[s] = t[s])
            })(e, t)
        };

    function n(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function n() {
            this.constructor = e
        }
        s(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
    }

    function r(e, t, s, n) {
        return new(s || (s = Promise))(function(r, i) {
            function a(e) {
                try {
                    u(n.next(e))
                } catch (e) {
                    i(e)
                }
            }

            function o(e) {
                try {
                    u(n.throw(e))
                } catch (e) {
                    i(e)
                }
            }

            function u(e) {
                var t;
                e.done ? r(e.value) : ((t = e.value) instanceof s ? t : new s(function(e) {
                    e(t)
                })).then(a, o)
            }
            u((n = n.apply(e, t || [])).next())
        })
    }

    function i(e, t) {
        var s, n, r, i = {
                label: 0,
                sent: function() {
                    if (1 & r[0]) throw r[1];
                    return r[1]
                },
                trys: [],
                ops: []
            },
            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return a.next = o(0), a.throw = o(1), a.return = o(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
            return this
        }), a;

        function o(o) {
            return function(u) {
                var l = [o, u];
                if (s) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, l[0] && (i = 0)), i;) try {
                    if (s = 1, n && (r = 2 & l[0] ? n.return : l[0] ? n.throw || ((r = n.return) && r.call(n), 0) : n.next) && !(r = r.call(n, l[1])).done) return r;
                    switch (n = 0, r && (l = [2 & l[0], r.value]), l[0]) {
                        case 0:
                        case 1:
                            r = l;
                            break;
                        case 4:
                            return i.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            i.label++, n = l[1], l = [0];
                            continue;
                        case 7:
                            l = i.ops.pop(), i.trys.pop();
                            continue;
                        default:
                            if (!(r = (r = i.trys).length > 0 && r[r.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === l[0] && (!r || l[1] > r[0] && l[1] < r[3])) {
                                i.label = l[1];
                                break
                            }
                            if (6 === l[0] && i.label < r[1]) {
                                i.label = r[1], r = l;
                                break
                            }
                            if (r && i.label < r[2]) {
                                i.label = r[2], i.ops.push(l);
                                break
                            }
                            r[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    l = t.call(e, i)
                } catch (e) {
                    l = [6, e], n = 0
                } finally {
                    s = r = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function a(e) {
        var s;
        return null == (s = e) ? s : {
            category: (0, t.exists)(s, "category") ? s.category : void 0,
            rank: (0, t.exists)(s, "rank") ? s.rank : void 0
        }
    }

    function o(e) {
        if (void 0 !== e) return null === e ? null : {
            recurrence: e.recurrence,
            recurrenceEndTime: e.recurrenceEndTime,
            notificationAudience: e.notificationAudience
        }
    }

    function u(e) {
        if (void 0 !== e) return null === e ? null : {
            startTime: e.startTime,
            endTime: e.endTime
        }
    }

    function l(e) {
        var s;
        return null == (s = e) ? s : {
            mediaId: (0, t.exists)(s, "mediaId") ? s.mediaId : void 0,
            rank: (0, t.exists)(s, "rank") ? s.rank : void 0
        }
    }

    function d(e) {
        if (void 0 !== e) return null === e ? null : {
            mediaId: e.mediaId,
            rank: e.rank
        }
    }

    function c(e) {
        var s;
        return null == (s = e) ? s : {
            category: (0, t.exists)(s, "category") ? s.category : void 0,
            rank: (0, t.exists)(s, "rank") ? s.rank : void 0
        }
    }

    function v(e) {
        if (void 0 !== e) return null === e ? null : {
            category: e.category,
            rank: e.rank
        }
    }

    function p(e) {
        if (void 0 !== e) return null === e ? null : {
            startTime: e.startTime,
            endTime: e.endTime
        }
    }

    function f(e) {
        var s;
        return null == (s = e) ? s : {
            mediaId: (0, t.exists)(s, "mediaId") ? s.mediaId : void 0,
            rank: (0, t.exists)(s, "rank") ? s.rank : void 0
        }
    }

    function h(e) {
        var s, n, r;
        return null == (s = e) ? s : {
            id: (0, t.exists)(s, "id") ? s.id : void 0,
            title: (0, t.exists)(s, "title") ? s.title : void 0,
            displayTitle: (0, t.exists)(s, "displayTitle") ? s.displayTitle : void 0,
            subtitle: (0, t.exists)(s, "subtitle") ? s.subtitle : void 0,
            displaySubtitle: (0, t.exists)(s, "displaySubtitle") ? s.displaySubtitle : void 0,
            description: (0, t.exists)(s, "description") ? s.description : void 0,
            displayDescription: (0, t.exists)(s, "displayDescription") ? s.displayDescription : void 0,
            startTime: (0, t.exists)(s, "startTime") ? null === s.startTime ? null : new Date(s.startTime) : void 0,
            endTime: (0, t.exists)(s, "endTime") ? null === s.endTime ? null : new Date(s.endTime) : void 0,
            universeId: (0, t.exists)(s, "universeId") ? s.universeId : void 0,
            placeId: (0, t.exists)(s, "placeId") ? s.placeId : void 0,
            host: (0, t.exists)(s, "host") ? null == (n = s.host) ? n : {
                hostType: (0, t.exists)(n, "hostType") ? n.hostType : void 0,
                hostId: (0, t.exists)(n, "hostId") ? n.hostId : void 0,
                hostName: (0, t.exists)(n, "hostName") ? n.hostName : void 0,
                hasVerifiedBadge: (0, t.exists)(n, "hasVerifiedBadge") ? n.hasVerifiedBadge : void 0
            } : void 0,
            visibility: (0, t.exists)(s, "visibility") ? s.visibility : void 0,
            featuringStatus: (0, t.exists)(s, "featuringStatus") ? s.featuringStatus : void 0,
            tagline: (0, t.exists)(s, "tagline") ? s.tagline : void 0,
            categories: (0, t.exists)(s, "categories") ? null === s.categories ? null : s.categories.map(a) : void 0,
            thumbnails: (0, t.exists)(s, "thumbnails") ? null === s.thumbnails ? null : s.thumbnails.map(f) : void 0,
            allThumbnailsCreated: (0, t.exists)(s, "allThumbnailsCreated") ? s.allThumbnailsCreated : void 0,
            config: (0, t.exists)(s, "config") ? null == (r = s.config) ? r : {
                recurrence: (0, t.exists)(r, "recurrence") ? r.recurrence : void 0,
                recurrenceEndTime: (0, t.exists)(r, "recurrenceEndTime") ? null === r.recurrenceEndTime ? null : new Date(r.recurrenceEndTime) : void 0,
                notificationAudience: (0, t.exists)(r, "notificationAudience") ? r.notificationAudience : void 0
            } : void 0,
            userRsvpStatus: (0, t.exists)(s, "userRsvpStatus") ? s.userRsvpStatus : void 0,
            createTime: (0, t.exists)(s, "createTime") ? null === s.createTime ? null : new Date(s.createTime) : void 0,
            updateTime: (0, t.exists)(s, "updateTime") ? null === s.updateTime ? null : new Date(s.updateTime) : void 0
        }
    }

    function m(e) {
        var s;
        return null == (s = e) ? s : {
            userId: (0, t.exists)(s, "userId") ? s.userId : void 0,
            rsvpStatus: (0, t.exists)(s, "rsvpStatus") ? s.rsvpStatus : void 0,
            shouldSeeNotificationsUpsellModal: (0, t.exists)(s, "shouldSeeNotificationsUpsellModal") ? s.shouldSeeNotificationsUpsellModal : void 0
        }
    }

    function b(e) {
        var s, n, r;
        return null == (s = e) ? s : {
            id: (0, t.exists)(s, "id") ? s.id : void 0,
            title: (0, t.exists)(s, "title") ? s.title : void 0,
            displayTitle: (0, t.exists)(s, "displayTitle") ? s.displayTitle : void 0,
            subtitle: (0, t.exists)(s, "subtitle") ? s.subtitle : void 0,
            displaySubtitle: (0, t.exists)(s, "displaySubtitle") ? s.displaySubtitle : void 0,
            description: (0, t.exists)(s, "description") ? s.description : void 0,
            displayDescription: (0, t.exists)(s, "displayDescription") ? s.displayDescription : void 0,
            eventTime: (0, t.exists)(s, "eventTime") ? null == (n = s.eventTime) ? n : {
                startUtc: (0, t.exists)(n, "startUtc") ? new Date(n.startUtc) : void 0,
                endUtc: (0, t.exists)(n, "endUtc") ? new Date(n.endUtc) : void 0
            } : void 0,
            host: (0, t.exists)(s, "host") ? null == (r = s.host) ? r : {
                hostName: (0, t.exists)(r, "hostName") ? r.hostName : void 0,
                hasVerifiedBadge: (0, t.exists)(r, "hasVerifiedBadge") ? r.hasVerifiedBadge : void 0,
                hostType: (0, t.exists)(r, "hostType") ? r.hostType : void 0,
                hostId: (0, t.exists)(r, "hostId") ? r.hostId : void 0
            } : void 0,
            universeId: (0, t.exists)(s, "universeId") ? s.universeId : void 0,
            placeId: (0, t.exists)(s, "placeId") ? s.placeId : void 0,
            eventStatus: (0, t.exists)(s, "eventStatus") ? s.eventStatus : void 0,
            eventVisibility: (0, t.exists)(s, "eventVisibility") ? s.eventVisibility : void 0,
            createdUtc: (0, t.exists)(s, "createdUtc") ? new Date(s.createdUtc) : void 0,
            updatedUtc: (0, t.exists)(s, "updatedUtc") ? new Date(s.updatedUtc) : void 0,
            eventCategories: (0, t.exists)(s, "eventCategories") ? null === s.eventCategories ? null : s.eventCategories.map(c) : void 0,
            thumbnails: (0, t.exists)(s, "thumbnails") ? null === s.thumbnails ? null : s.thumbnails.map(l) : void 0,
            allThumbnailsCreated: (0, t.exists)(s, "allThumbnailsCreated") ? s.allThumbnailsCreated : void 0,
            userRsvpStatus: s.userRsvpStatus,
            tagline: (0, t.exists)(s, "tagline") ? s.tagline : void 0,
            featuringStatus: (0, t.exists)(s, "featuringStatus") ? s.featuringStatus : void 0
        }
    }

    function y(e, s) {
        return null == e ? e : {
            nextPageCursor: (0, t.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
            previousPageCursor: (0, t.exists)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
            data: (0, t.exists)(e, "data") ? null === e.data ? null : e.data.map(b) : void 0
        }
    }(function(e) {
        function s() {
            return null !== e && e.apply(this, arguments) || this
        }
        n(s, e), s.prototype.experienceEventsCreateExperienceEventRaw = function(e, s) {
            return r(this, void 0, void 0, function() {
                var n, r, a;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/experience-events/create",
                                schemaPath: "/v1/experience-events/create",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        title: e.title,
                                        subtitle: e.subtitle,
                                        description: e.description,
                                        eventTime: u(e.eventTime),
                                        universeId: e.universeId,
                                        placeId: e.placeId,
                                        groupId: e.groupId,
                                        eventCategories: void 0 === e.eventCategories ? void 0 : null === e.eventCategories ? null : e.eventCategories.map(v),
                                        thumbnails: void 0 === e.thumbnails ? void 0 : null === e.thumbnails ? null : e.thumbnails.map(d),
                                        visibility: e.visibility,
                                        config: o(e.config)
                                    }
                                }(e.experienceEventsCreateExperienceEventRequest)
                            }, s)];
                        case 1:
                            return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return b(e)
                            })]
                    }
                })
            })
        }, s.prototype.experienceEventsCreateExperienceEvent = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.experienceEventsCreateExperienceEventRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, s.prototype.experienceEventsUpdateExperienceEventRaw = function(e, s) {
            return r(this, void 0, void 0, function() {
                var n, r, a;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.id || void 0 === e.id) throw new t.RequiredError("id", "Required parameter requestParameters.id was null or undefined when calling experienceEventsUpdateExperienceEvent.");
                            return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/experience-events/{id}".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                schemaPath: "/v1/experience-events/{id}",
                                method: "PATCH",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        title: e.title,
                                        subtitle: e.subtitle,
                                        description: e.description,
                                        eventTime: p(e.eventTime),
                                        universeId: e.universeId,
                                        placeId: e.placeId,
                                        visibility: e.visibility,
                                        config: o(e.config),
                                        eventCategories: void 0 === e.eventCategories ? void 0 : null === e.eventCategories ? null : e.eventCategories.map(v),
                                        thumbnails: void 0 === e.thumbnails ? void 0 : null === e.thumbnails ? null : e.thumbnails.map(d)
                                    }
                                }(e.experienceEventsUpdateExperienceEventRequest)
                            }, s)];
                        case 1:
                            return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    isUpdated: (0, t.exists)(e, "isUpdated") ? e.isUpdated : void 0,
                                    thumbnailsUpdated: (0, t.exists)(e, "thumbnailsUpdated") ? e.thumbnailsUpdated : void 0,
                                    categoriesUpdated: (0, t.exists)(e, "categoriesUpdated") ? e.categoriesUpdated : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.experienceEventsUpdateExperienceEvent = function(e, t) {
            return r(this, void 0, void 0, function() {
                return i(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.experienceEventsUpdateExperienceEventRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }
    })(t.BaseAPI),
    function(e) {
        function s() {
            return null !== e && e.apply(this, arguments) || this
        }
        n(s, e), s.prototype.gameEventDeleteRaw = function(e, s) {
            return r(this, void 0, void 0, function() {
                var n, r, a;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.eventId || void 0 === e.eventId) throw new t.RequiredError("eventId", "Required parameter requestParameters.eventId was null or undefined when calling gameEventDelete.");
                            return n = {}, r = {}, [4, this.request({
                                path: "/v3/game-events/{eventId}".replace("{".concat("eventId", "}"), encodeURIComponent(String(e.eventId))),
                                schemaPath: "/v3/game-events/{eventId}",
                                method: "DELETE",
                                headers: r,
                                query: n
                            }, s)];
                        case 1:
                            return a = i.sent(), [2, new t.VoidApiResponse(a)]
                    }
                })
            })
        }, s.prototype.gameEventDelete = function(e, t) {
            return r(this, void 0, void 0, function() {
                return i(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.gameEventDeleteRaw(e, t)];
                        case 1:
                            return s.sent(), [2]
                    }
                })
            })
        }, s.prototype.gameEventGetRaw = function(e, s) {
            return r(this, void 0, void 0, function() {
                var n, r, a;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.eventId || void 0 === e.eventId) throw new t.RequiredError("eventId", "Required parameter requestParameters.eventId was null or undefined when calling gameEventGet.");
                            return n = {}, void 0 !== e.fields && (n.fields = e.fields), r = {}, [4, this.request({
                                path: "/v3/game-events/{eventId}".replace("{".concat("eventId", "}"), encodeURIComponent(String(e.eventId))),
                                schemaPath: "/v3/game-events/{eventId}",
                                method: "GET",
                                headers: r,
                                query: n
                            }, s)];
                        case 1:
                            return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return h(e)
                            })]
                    }
                })
            })
        }, s.prototype.gameEventGet = function(e, t) {
            return r(this, void 0, void 0, function() {
                return i(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.gameEventGetRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, s.prototype.gameEventUpdateRaw = function(e, s) {
            return r(this, void 0, void 0, function() {
                var n, r, a;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.eventId || void 0 === e.eventId) throw new t.RequiredError("eventId", "Required parameter requestParameters.eventId was null or undefined when calling gameEventUpdate.");
                            return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v3/game-events/{eventId}".replace("{".concat("eventId", "}"), encodeURIComponent(String(e.eventId))),
                                schemaPath: "/v3/game-events/{eventId}",
                                method: "PATCH",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        title: e.title,
                                        subtitle: e.subtitle,
                                        description: e.description,
                                        startTime: void 0 === e.startTime ? void 0 : null === e.startTime ? null : e.startTime.toISOString(),
                                        endTime: void 0 === e.endTime ? void 0 : null === e.endTime ? null : e.endTime.toISOString(),
                                        visibility: e.visibility,
                                        placeId: e.placeId,
                                        categories: void 0 === e.categories ? void 0 : null === e.categories ? null : e.categories.map(v),
                                        thumbnails: void 0 === e.thumbnails ? void 0 : null === e.thumbnails ? null : e.thumbnails.map(d),
                                        config: function(e) {
                                            if (void 0 !== e) return null === e ? null : {
                                                recurrence: e.recurrence,
                                                recurrenceEndTime: void 0 === e.recurrenceEndTime ? void 0 : null === e.recurrenceEndTime ? null : e.recurrenceEndTime.toISOString(),
                                                notificationAudience: e.notificationAudience
                                            }
                                        }(e.config),
                                        featuringStatus: e.featuringStatus,
                                        tagline: e.tagline
                                    }
                                }(e.gameEventUpdateRequest)
                            }, s)];
                        case 1:
                            return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return h(e)
                            })]
                    }
                })
            })
        }, s.prototype.gameEventUpdate = function(e, t) {
            return r(this, void 0, void 0, function() {
                return i(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.gameEventUpdateRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }
    }(t.BaseAPI),
    function(e) {
        function s() {
            return null !== e && e.apply(this, arguments) || this
        }
        n(s, e), s.prototype.gameEventsCreateRaw = function(e, s) {
            return r(this, void 0, void 0, function() {
                var n, r, a;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling gameEventsCreate.");
                            return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v3/universes/{universeId}/game-events".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v3/universes/{universeId}/game-events",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        title: e.title,
                                        subtitle: e.subtitle,
                                        description: e.description,
                                        startTime: void 0 === e.startTime ? void 0 : null === e.startTime ? null : e.startTime.toISOString(),
                                        endTime: void 0 === e.endTime ? void 0 : null === e.endTime ? null : e.endTime.toISOString(),
                                        visibility: e.visibility,
                                        groupId: e.groupId,
                                        placeId: e.placeId,
                                        categories: void 0 === e.categories ? void 0 : null === e.categories ? null : e.categories.map(v),
                                        thumbnails: void 0 === e.thumbnails ? void 0 : null === e.thumbnails ? null : e.thumbnails.map(d),
                                        config: function(e) {
                                            if (void 0 !== e) return null === e ? null : {
                                                recurrence: e.recurrence,
                                                recurrenceEndTime: void 0 === e.recurrenceEndTime ? void 0 : null === e.recurrenceEndTime ? null : e.recurrenceEndTime.toISOString(),
                                                notificationAudience: e.notificationAudience
                                            }
                                        }(e.config),
                                        featuringStatus: e.featuringStatus,
                                        tagline: e.tagline
                                    }
                                }(e.gameEventsCreateRequest)
                            }, s)];
                        case 1:
                            return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return h(e)
                            })]
                    }
                })
            })
        }, s.prototype.gameEventsCreate = function(e, t) {
            return r(this, void 0, void 0, function() {
                return i(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.gameEventsCreateRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, s.prototype.gameEventsListRaw = function(e, s) {
            return r(this, void 0, void 0, function() {
                var n, r, a;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling gameEventsList.");
                            return n = {}, void 0 !== e.pageSize && (n.pageSize = e.pageSize), void 0 !== e.pageToken && (n.pageToken = e.pageToken), void 0 !== e.reverse && (n.reverse = e.reverse), void 0 !== e.startsBefore && (n.startsBefore = e.startsBefore.toISOString()), void 0 !== e.startsAfter && (n.startsAfter = e.startsAfter.toISOString()), void 0 !== e.endsBefore && (n.endsBefore = e.endsBefore.toISOString()), void 0 !== e.endsAfter && (n.endsAfter = e.endsAfter.toISOString()), void 0 !== e.visibility && (n.visibility = e.visibility), void 0 !== e.fields && (n.fields = e.fields), r = {}, [4, this.request({
                                path: "/v3/universes/{universeId}/game-events".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v3/universes/{universeId}/game-events",
                                method: "GET",
                                headers: r,
                                query: n
                            }, s)];
                        case 1:
                            return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    gameEvents: (0, t.exists)(e, "gameEvents") ? null === e.gameEvents ? null : e.gameEvents.map(h) : void 0,
                                    nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0,
                                    previousPageToken: (0, t.exists)(e, "previousPageToken") ? e.previousPageToken : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.gameEventsList = function(e, t) {
            return r(this, void 0, void 0, function() {
                return i(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.gameEventsListRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }
    }(t.BaseAPI),
    function(e) {
        function s() {
            return null !== e && e.apply(this, arguments) || this
        }
        n(s, e), s.prototype.notificationsUpdateNotificationsPreferencesRaw = function(e, s) {
            return r(this, void 0, void 0, function() {
                var n, r, a;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/notifications/preferences",
                                schemaPath: "/v1/notifications/preferences",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        isEnabled: e.isEnabled
                                    }
                                }(e.notificationsUpdateNotificationsPreferencesRequest)
                            }, s)];
                        case 1:
                            return a = i.sent(), [2, new t.JSONApiResponse(a)]
                    }
                })
            })
        }, s.prototype.notificationsUpdateNotificationsPreferences = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.notificationsUpdateNotificationsPreferencesRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, s.prototype.notificationsUpdateUserModalHistoryRaw = function(e) {
            return r(this, void 0, void 0, function() {
                var s, n, r;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return s = {}, n = {}, [4, this.request({
                                path: "/v1/notifications/modal-history",
                                schemaPath: "/v1/notifications/modal-history",
                                method: "POST",
                                headers: n,
                                query: s
                            }, e)];
                        case 1:
                            return r = i.sent(), [2, new t.JSONApiResponse(r)]
                    }
                })
            })
        }, s.prototype.notificationsUpdateUserModalHistory = function(e) {
            return r(this, void 0, void 0, function() {
                return i(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.notificationsUpdateUserModalHistoryRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }
    }(t.BaseAPI),
    function(e) {
        function s() {
            return null !== e && e.apply(this, arguments) || this
        }
        n(s, e), s.prototype.rsvpGetRsvpCountersRaw = function(e, s) {
            return r(this, void 0, void 0, function() {
                var n, r, a;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.virtualEventId || void 0 === e.virtualEventId) throw new t.RequiredError("virtualEventId", "Required parameter requestParameters.virtualEventId was null or undefined when calling rsvpGetRsvpCounters.");
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/virtual-events/{virtualEventId}/rsvps/counters".replace("{".concat("virtualEventId", "}"), encodeURIComponent(String(e.virtualEventId))),
                                schemaPath: "/v1/virtual-events/{virtualEventId}/rsvps/counters",
                                method: "GET",
                                headers: r,
                                query: n
                            }, s)];
                        case 1:
                            return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                var s;
                                return null == e ? e : {
                                    counters: (0, t.exists)(e, "counters") ? null == (s = e.counters) ? s : {
                                        none: (0, t.exists)(s, "none") ? s.none : void 0,
                                        going: (0, t.exists)(s, "going") ? s.going : void 0,
                                        maybeGoing: (0, t.exists)(s, "maybeGoing") ? s.maybeGoing : void 0,
                                        notGoing: (0, t.exists)(s, "notGoing") ? s.notGoing : void 0
                                    } : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.rsvpGetRsvpCounters = function(e, t) {
            return r(this, void 0, void 0, function() {
                return i(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.rsvpGetRsvpCountersRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, s.prototype.rsvpGetUserRsvpedEventsRaw = function(e, s) {
            return r(this, void 0, void 0, function() {
                var n, r, a;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, void 0 !== e.cursor && (n.cursor = e.cursor), void 0 !== e.reverse && (n.reverse = e.reverse), void 0 !== e.limit && (n.limit = e.limit), r = {}, [4, this.request({
                                path: "/v1/my-rsvps",
                                schemaPath: "/v1/my-rsvps",
                                method: "GET",
                                headers: r,
                                query: n
                            }, s)];
                        case 1:
                            return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return y(e)
                            })]
                    }
                })
            })
        }, s.prototype.rsvpGetUserRsvpedEvents = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), i(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.rsvpGetUserRsvpedEventsRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, s.prototype.rsvpGetVirtualEventRsvpsRaw = function(e, s) {
            return r(this, void 0, void 0, function() {
                var n, r, a;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.virtualEventId || void 0 === e.virtualEventId) throw new t.RequiredError("virtualEventId", "Required parameter requestParameters.virtualEventId was null or undefined when calling rsvpGetVirtualEventRsvps.");
                            return n = {}, void 0 !== e.cursor && (n.cursor = e.cursor), void 0 !== e.reverse && (n.reverse = e.reverse), void 0 !== e.limit && (n.limit = e.limit), r = {}, [4, this.request({
                                path: "/v1/virtual-events/{virtualEventId}/rsvps".replace("{".concat("virtualEventId", "}"), encodeURIComponent(String(e.virtualEventId))),
                                schemaPath: "/v1/virtual-events/{virtualEventId}/rsvps",
                                method: "GET",
                                headers: r,
                                query: n
                            }, s)];
                        case 1:
                            return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    nextPageCursor: (0, t.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                    previousPageCursor: (0, t.exists)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                    data: (0, t.exists)(e, "data") ? null === e.data ? null : e.data.map(m) : void 0
                                }
                            })]
                    }
                })
            })
        }, s.prototype.rsvpGetVirtualEventRsvps = function(e, t) {
            return r(this, void 0, void 0, function() {
                return i(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.rsvpGetVirtualEventRsvpsRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }, s.prototype.rsvpRsvpToEventRaw = function(e, s) {
            return r(this, void 0, void 0, function() {
                var n, r, a;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.virtualEventId || void 0 === e.virtualEventId) throw new t.RequiredError("virtualEventId", "Required parameter requestParameters.virtualEventId was null or undefined when calling rsvpRsvpToEvent.");
                            return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/virtual-events/{virtualEventId}/rsvps".replace("{".concat("virtualEventId", "}"), encodeURIComponent(String(e.virtualEventId))),
                                schemaPath: "/v1/virtual-events/{virtualEventId}/rsvps",
                                method: "POST",
                                headers: r,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        rsvpStatus: e.rsvpStatus
                                    }
                                }(e.rsvpRsvpToEventRequest)
                            }, s)];
                        case 1:
                            return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return m(e)
                            })]
                    }
                })
            })
        }, s.prototype.rsvpRsvpToEvent = function(e, t) {
            return r(this, void 0, void 0, function() {
                return i(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return [4, this.rsvpRsvpToEventRaw(e, t)];
                        case 1:
                            return [4, s.sent().value()];
                        case 2:
                            return [2, s.sent()]
                    }
                })
            })
        }
    }(t.BaseAPI);
    var g = function(e) {
            function s() {
                return null !== e && e.apply(this, arguments) || this
            }
            return n(s, e), s.prototype.universesGetUniverseEventOccurrencesRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var n, r, a;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling universesGetUniverseEventOccurrences.");
                                return n = {}, void 0 !== e.cursor && (n.cursor = e.cursor), void 0 !== e.limit && (n.limit = e.limit), r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/event-occurrences".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/event-occurrences",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, s)];
                            case 1:
                                return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return y(e)
                                })]
                        }
                    })
                })
            }, s.prototype.universesGetUniverseEventOccurrences = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.universesGetUniverseEventOccurrencesRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.universesGetUniverseVirtualEventsRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var n, r, a;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling universesGetUniverseVirtualEvents.");
                                return n = {}, void 0 !== e.fromUtc && (n.fromUtc = e.fromUtc.toISOString()), void 0 !== e.cursor && (n.cursor = e.cursor), void 0 !== e.reverse && (n.reverse = e.reverse), void 0 !== e.limit && (n.limit = e.limit), r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/virtual-events".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/virtual-events",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, s)];
                            case 1:
                                return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return y(e)
                                })]
                        }
                    })
                })
            }, s.prototype.universesGetUniverseVirtualEvents = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.universesGetUniverseVirtualEventsRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s
        }(t.BaseAPI),
        A = function(e) {
            function s() {
                return null !== e && e.apply(this, arguments) || this
            }
            return n(s, e), s.prototype.universesV2GetUniverseVirtualEventsRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var n, r, a;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling universesV2GetUniverseVirtualEvents.");
                                return n = {}, void 0 !== e.startsBefore && (n.startsBefore = e.startsBefore.toISOString()), void 0 !== e.startsAfter && (n.startsAfter = e.startsAfter.toISOString()), void 0 !== e.endsBefore && (n.endsBefore = e.endsBefore.toISOString()), void 0 !== e.endsAfter && (n.endsAfter = e.endsAfter.toISOString()), void 0 !== e.visibility && (n.visibility = e.visibility), void 0 !== e.cursor && (n.cursor = e.cursor), void 0 !== e.reverse && (n.reverse = e.reverse), void 0 !== e.limit && (n.limit = e.limit), r = {}, [4, this.request({
                                    path: "/v2/universes/{universeId}/experience-events".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/universes/{universeId}/experience-events",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, s)];
                            case 1:
                                return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return y(e)
                                })]
                        }
                    })
                })
            }, s.prototype.universesV2GetUniverseVirtualEvents = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.universesV2GetUniverseVirtualEventsRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s
        }(t.BaseAPI),
        w = function(e) {
            function s() {
                return null !== e && e.apply(this, arguments) || this
            }
            return n(s, e), s.prototype.virtualEventsCreateVirtualEventRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var n, r, a;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/virtual-events/create",
                                    schemaPath: "/v1/virtual-events/create",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            title: e.title,
                                            subtitle: e.subtitle,
                                            description: e.description,
                                            eventTime: u(e.eventTime),
                                            universeId: e.universeId,
                                            placeId: e.placeId,
                                            groupId: e.groupId,
                                            eventCategories: void 0 === e.eventCategories ? void 0 : null === e.eventCategories ? null : e.eventCategories.map(v),
                                            thumbnails: void 0 === e.thumbnails ? void 0 : null === e.thumbnails ? null : e.thumbnails.map(d),
                                            visibility: e.visibility,
                                            tagline: e.tagline,
                                            featuringStatus: e.featuringStatus
                                        }
                                    }(e.virtualEventsCreateVirtualEventRequest)
                                }, s)];
                            case 1:
                                return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return b(e)
                                })]
                        }
                    })
                })
            }, s.prototype.virtualEventsCreateVirtualEvent = function() {
                return r(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), i(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.virtualEventsCreateVirtualEventRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.virtualEventsDeleteVirtualEventRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var n, r, a;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new t.RequiredError("id", "Required parameter requestParameters.id was null or undefined when calling virtualEventsDeleteVirtualEvent.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/virtual-events/{id}".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/virtual-events/{id}",
                                    method: "DELETE",
                                    headers: r,
                                    query: n
                                }, s)];
                            case 1:
                                return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        isDeleted: (0, t.exists)(e, "isDeleted") ? e.isDeleted : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.virtualEventsDeleteVirtualEvent = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.virtualEventsDeleteVirtualEventRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.virtualEventsGetCreatorVirtualEventsRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var n, r, a;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return n = {}, void 0 !== e.groupId && (n.groupId = e.groupId), void 0 !== e.filterBy && (n.filterBy = e.filterBy), void 0 !== e.fromUtc && (n.fromUtc = e.fromUtc.toISOString()), void 0 !== e.cursor && (n.cursor = e.cursor), void 0 !== e.reverse && (n.reverse = e.reverse), void 0 !== e.limit && (n.limit = e.limit), void 0 !== e.sortBy && (n.sortBy = e.sortBy), void 0 !== e.sortOrder && (n.sortOrder = e.sortOrder), r = {}, [4, this.request({
                                    path: "/v1/virtual-events/my-events",
                                    schemaPath: "/v1/virtual-events/my-events",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, s)];
                            case 1:
                                return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return y(e)
                                })]
                        }
                    })
                })
            }, s.prototype.virtualEventsGetCreatorVirtualEvents = function() {
                return r(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), i(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.virtualEventsGetCreatorVirtualEventsRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.virtualEventsGetGroupExperienceEventsRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var n, r, a;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new t.RequiredError("id", "Required parameter requestParameters.id was null or undefined when calling virtualEventsGetGroupExperienceEvents.");
                                return n = {}, void 0 !== e.endsAfter && (n.endsAfter = e.endsAfter.toISOString()), void 0 !== e.visibility && (n.visibility = e.visibility), void 0 !== e.cursor && (n.cursor = e.cursor), void 0 !== e.reverse && (n.reverse = e.reverse), void 0 !== e.limit && (n.limit = e.limit), r = {}, [4, this.request({
                                    path: "/v1/virtual-events/groups/{id}".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/virtual-events/groups/{id}",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, s)];
                            case 1:
                                return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return y(e)
                                })]
                        }
                    })
                })
            }, s.prototype.virtualEventsGetGroupExperienceEvents = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.virtualEventsGetGroupExperienceEventsRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.virtualEventsGetPermissionsForHostRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var n, r, a;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return n = {}, void 0 !== e.hostId && (n.hostId = e.hostId), void 0 !== e.hostType && (n.hostType = e.hostType), r = {}, [4, this.request({
                                    path: "/v1/virtual-events/permissions",
                                    schemaPath: "/v1/virtual-events/permissions",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, s)];
                            case 1:
                                return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        maxPermissionLevel: (0, t.exists)(e, "maxPermissionLevel") ? e.maxPermissionLevel : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.virtualEventsGetPermissionsForHost = function() {
                return r(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), i(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.virtualEventsGetPermissionsForHostRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.virtualEventsGetPublicVirtualEventRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var n, r, a;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new t.RequiredError("id", "Required parameter requestParameters.id was null or undefined when calling virtualEventsGetPublicVirtualEvent.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/virtual-events/public/{id}".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/virtual-events/public/{id}",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, s)];
                            case 1:
                                return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return b(e)
                                })]
                        }
                    })
                })
            }, s.prototype.virtualEventsGetPublicVirtualEvent = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.virtualEventsGetPublicVirtualEventRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.virtualEventsGetVirtualEventRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var n, r, a;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new t.RequiredError("id", "Required parameter requestParameters.id was null or undefined when calling virtualEventsGetVirtualEvent.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/virtual-events/{id}".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/virtual-events/{id}",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, s)];
                            case 1:
                                return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return b(e)
                                })]
                        }
                    })
                })
            }, s.prototype.virtualEventsGetVirtualEvent = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.virtualEventsGetVirtualEventRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.virtualEventsUpdateVirtualEventRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var n, r, a;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new t.RequiredError("id", "Required parameter requestParameters.id was null or undefined when calling virtualEventsUpdateVirtualEvent.");
                                return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/virtual-events/{id}".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/virtual-events/{id}",
                                    method: "PATCH",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            title: e.title,
                                            subtitle: e.subtitle,
                                            description: e.description,
                                            eventTime: p(e.eventTime),
                                            universeId: e.universeId,
                                            placeId: e.placeId,
                                            visibility: e.visibility,
                                            eventCategories: void 0 === e.eventCategories ? void 0 : null === e.eventCategories ? null : e.eventCategories.map(v),
                                            thumbnails: void 0 === e.thumbnails ? void 0 : null === e.thumbnails ? null : e.thumbnails.map(d),
                                            tagline: e.tagline,
                                            featuringStatus: e.featuringStatus
                                        }
                                    }(e.virtualEventsUpdateVirtualEventRequest)
                                }, s)];
                            case 1:
                                return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        isUpdated: (0, t.exists)(e, "isUpdated") ? e.isUpdated : void 0,
                                        thumbnailsUpdated: (0, t.exists)(e, "thumbnailsUpdated") ? e.thumbnailsUpdated : void 0,
                                        categoriesUpdated: (0, t.exists)(e, "categoriesUpdated") ? e.categoriesUpdated : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.virtualEventsUpdateVirtualEvent = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.virtualEventsUpdateVirtualEventRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.virtualEventsUpdateVirtualEventStatusRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var n, r, a;
                    return i(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new t.RequiredError("id", "Required parameter requestParameters.id was null or undefined when calling virtualEventsUpdateVirtualEventStatus.");
                                return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/virtual-events/{id}/status".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/virtual-events/{id}/status",
                                    method: "PATCH",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            eventStatus: e.eventStatus
                                        }
                                    }(e.virtualEventsUpdateVirtualEventStatusRequest)
                                }, s)];
                            case 1:
                                return a = i.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        isUpdated: (0, t.exists)(e, "isUpdated") ? e.isUpdated : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.virtualEventsUpdateVirtualEventStatus = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return i(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.virtualEventsUpdateVirtualEventStatusRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s
        }(t.BaseAPI);
    e.s(["EventCategory", 0, {
        ContentUpdate: "contentUpdate",
        LocationUpdate: "locationUpdate",
        SystemUpdate: "systemUpdate",
        Activity: "activity",
        NewContent: "newContent",
        ItemDrop: "itemDrop",
        NewSeason: "newSeason",
        NewLocation: "newLocation",
        NewMap: "newMap",
        MoreLevels: "moreLevels",
        NewFeature: "newFeature",
        EarlyAccess: "earlyAccess",
        Expansion: "expansion",
        Challenge: "challenge",
        Quest: "quest",
        Festival: "festival"
    }, "EventFilterBy", 0, {
        Upcoming: "upcoming",
        Past: "past",
        Drafts: "drafts",
        Cancelled: "cancelled"
    }, "EventSortBy", 0, {
        CreatedUtc: "createdUtc",
        StartUtc: "startUtc"
    }, "EventStatus", 0, {
        Unpublished: "unpublished",
        Active: "active",
        Cancelled: "cancelled",
        Moderated: "moderated"
    }, "EventVisibility", 0, {
        Private: "private",
        Public: "public",
        Moderated: "moderated"
    }, "FeaturingStatus", 0, {
        Invalid: "invalid",
        Enabled: "enabled",
        Disabled: "disabled"
    }, "HostType", 0, {
        User: "user",
        Group: "group"
    }, "SortOrder", 0, {
        Asc: "asc",
        Desc: "desc"
    }, "UniversesApi", 0, g, "UniversesV2Api", 0, A, "VirtualEventsApi", 0, w])
}]);

//# debugId=14669e7d-1296-f11b-3320-8f92ee45990b
//# sourceMappingURL=09-vunvxdkrh5.js.map