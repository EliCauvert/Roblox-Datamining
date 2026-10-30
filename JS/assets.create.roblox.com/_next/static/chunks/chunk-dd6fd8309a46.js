;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "3b2b397e-15de-c7cc-27e1-c5745ce7dcea")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 730530, e => {
    "use strict";
    let a = e => e;
    e.s(["brandPretranslatedText", 0, e => a(e), "brandUntranslatableText", 0, a, "translateHTMLFn", 0, e => {
        let {
            translateHTML: a
        } = e;
        return (e, t, r) => {
            let {
                key: o
            } = e;
            return a(o, t, r)
        }
    }, "translationFn", 0, e => {
        let {
            translate: a
        } = e;
        return (e, t) => {
            let {
                key: r
            } = e;
            return a(r, t)
        }
    }, "translationKey", 0, (e, a) => ({
        key: e,
        namespace: a
    }), "translationKeyWithoutNamespace", 0, e => ({
        key: e,
        namespace: void 0
    })])
}, 213067, e => {
    "use strict";
    var a = e.i(721281);
    e.s(["default", 0, class e extends Error {
        constructor(t, r = "") {
            super("Generic BEDEV1 Error"), (0, a._)(this, "code", void 0), (0, a._)(this, "message", void 0), this.code = t, this.message = r, Error.captureStackTrace && Error.captureStackTrace(this, e)
        }
    }])
}, 185915, e => {
    "use strict";
    e.s(["default", 0, function(e) {
        return e && "object" == typeof e && "response" in e ? e.response : e && "object" == typeof e && "json" in e ? e : null
    }])
}, 227987, e => {
    "use strict";
    var a = e.i(185915);
    async function t(e) {
        try {
            let t = (0, a.default)(e);
            if (t) {
                let e = await t.json();
                if (e.errors.length > 0) {
                    let a = e.errors[0];
                    if (a) return {
                        status: t.status,
                        code: a.code,
                        message: a.message,
                        userFacingMessage: a.userFacingMessage,
                        fieldData: a.fieldData,
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
    e.s(["default", 0, t])
}, 759283, 253536, e => {
    "use strict";
    var a = e.i(958885),
        t = e.i(307529),
        r = e.i(251622),
        o = e.i(260022);
    let n = "".concat((0, o.getProductionCreatorHubUrl)("global"), "/docs/reference/engine/classes/Player#GetJoinData"),
        s = (0, o.resolveUrl)("developerArticleProductsInGamePurchasesUrl", "production", "global"),
        c = (0, o.resolveUrl)("developerArticleBadgesSpecialGameAwardsUrl", "production", "global"),
        i = "".concat((0, o.getProductionCreatorHubUrl)("global"), "/docs/production/monetization/game-passes"),
        l = (0, o.resolveUrl)("developerArticleCreateVipServerUrl", "production", "global"),
        d = "".concat((0, o.getProductionCreatorHubUrl)("global"), "/docs/production/publishing/publish-experiences-and-places#release-to-the-public"),
        u = "".concat((0, o.getProductionCreatorHubUrl)("global"), "/docs/projects/assets/privacy"),
        g = "".concat((0, o.getProductionCreatorHubUrl)("global"), "/docs/parts/models#distribute-models"),
        p = "".concat((0, o.getProductionCreatorHubUrl)("global"), "/docs/art/marketplace/publishing-to-marketplace#sale-location"),
        m = "".concat((0, o.getProductionCreatorHubUrl)("global"), "/docs/production/monetization/subscriptions#creating-subscriptions"),
        f = "".concat((0, o.getProductionCreatorHubUrl)("global"), "/docs/production/game-design/subscription-design#bundles"),
        b = "".concat((0, o.getProductionCreatorHubUrl)("global"), "/docs/production/monetization/subscriptions#earning-with-subscriptions"),
        y = (0, o.resolveUrl)("robloxCommunityStandardsUrl", "production", "global"),
        A = "".concat((0, o.getProductionCreatorHubUrl)("global"), "/docs/art/marketplace/marketplace-policy#ugc-program-guidelines"),
        h = "".concat((0, o.getProductionCreatorHubUrl)("global"), "/docs/art/marketplace/marketplace-fees-and-commissions#publishing-advance"),
        v = "".concat((0, o.getProductionCreatorHubUrl)("global"), "/docs/production/publishing/account-verification");
    (0, o.getProductionCreatorHubUrl)("global"), (0, o.getProductionCreatorHubUrl)("global");
    let U = (0, o.resolveUrl)("ugcSubscriptionTermsOfUseUrl", "production", "global"),
        P = (0, o.resolveUrl)("robloxTermsOfUseUrl", "production", "global"),
        L = (0, o.resolveUrl)("advertisingStandardsUrl", "production", "global"),
        E = "".concat((0, o.getProductionCreatorHubUrl)("global"), "/docs/production/publishing/account-verification"),
        S = "".concat((0, o.getProductionCreatorHubUrl)("global"), "/docs/production/monetization/avatar-creation-token");
    e.s(["ACCOUNT_VERIFICATION_URL", 0, E, "ASSET_ACCESS_PRIVACY", 0, u, "BADGE_LEARN_MORE_URL", 0, c, "CREATOR_STORE_VERIFICATION_URL", 0, v, "DEVELOPER_PRODUCT_LEARN_MORE_URL", 0, s, "DISTRIBUTE_MODELS", 0, g, "LAUNCH_DATA_LEARN_MORE_URL", 0, n, "MARKETPLACE_POLICY", 0, A, "MOMENTS_LEARN_MORE_URL", 0, "https://about.roblox.com/newsroom/2025/09/roblox-moments-user-generated-discovery", "PASS_LEARN_MORE_URL", 0, i, "PRIVATE_SERVER_LEARN_MORE_URL", 0, l, "PUBLISHING_ADVANCE", 0, h, "RELEASE_EXPERIENCE_TO_PUBLIC_URL", 0, d, "ROBLOX_ADVERTISING_STANDARDS", 0, L, "ROBLOX_COMMUNITY_STANDARDS", 0, y, "ROBLOX_TERMS_OF_USE", 0, P, "SALE_LOCATION_LEARN_MORE_URL", 0, p, "SUBSCRIPTION_LEARN_MORE_PRICING_URL", 0, b, "SUBSCRIPTION_LEARN_MORE_PRODUCT_TYPES_URL", 0, f, "SUBSCRIPTION_LEARN_MORE_URL", 0, m, "SUBSCRIPTION_TERMS_OF_USE", 0, U, "TOKEN_LEARN_MORE_URL", 0, S], 253536);
    let C = {
            [t.default.Place]: r.default.Game,
            [t.default.SharedExperiences]: r.default.Game,
            [t.default.MyExperiences]: r.default.Game,
            [t.default.ShareLink]: r.default.Game,
            [t.default.Moments]: r.default.Game,
            [t.default.TShirt]: r.default.CatalogAsset,
            [t.default.Shirt]: r.default.CatalogAsset,
            [t.default.Pants]: r.default.CatalogAsset,
            [t.default.Hat]: r.default.CatalogAsset,
            [t.default.HairAccessory]: r.default.CatalogAsset,
            [t.default.FaceAccessory]: r.default.CatalogAsset,
            [t.default.NeckAccessory]: r.default.CatalogAsset,
            [t.default.ShoulderAccessory]: r.default.CatalogAsset,
            [t.default.FrontAccessory]: r.default.CatalogAsset,
            [t.default.BackAccessory]: r.default.CatalogAsset,
            [t.default.WaistAccessory]: r.default.CatalogAsset,
            [t.default.TShirtAccessory]: r.default.CatalogAsset,
            [t.default.ShirtAccessory]: r.default.CatalogAsset,
            [t.default.PantsAccessory]: r.default.CatalogAsset,
            [t.default.JacketAccessory]: r.default.CatalogAsset,
            [t.default.SweaterAccessory]: r.default.CatalogAsset,
            [t.default.ShortsAccessory]: r.default.CatalogAsset,
            [t.default.DressSkirtAccessory]: r.default.CatalogAsset,
            [t.default.EmoteAnimation]: r.default.CatalogAsset,
            [t.default.EyebrowAccessory]: r.default.CatalogAsset,
            [t.default.EyelashAccessory]: r.default.CatalogAsset,
            [t.default.FaceMakeup]: r.default.CatalogAsset,
            [t.default.LipMakeup]: r.default.CatalogAsset,
            [t.default.EyeMakeup]: r.default.CatalogAsset,
            [t.default.AvatarBackground]: r.default.CatalogAsset,
            [t.default.AvatarLooks]: r.default.CatalogAsset,
            [t.default.Showcase]: r.default.CatalogAsset,
            [t.default.AllCatalogAsset]: r.default.CatalogAsset,
            [t.default.Decal]: r.default.LibraryAsset,
            [t.default.Image]: r.default.LibraryAsset,
            [t.default.Audio]: r.default.LibraryAsset,
            [t.default.Model]: r.default.LibraryAsset,
            [t.default.Mesh]: r.default.LibraryAsset,
            [t.default.MeshPart]: r.default.LibraryAsset,
            [t.default.Plugin]: r.default.LibraryAsset,
            [t.default.Animation]: r.default.LibraryAsset,
            [t.default.FontFamily]: r.default.LibraryAsset,
            [t.default.Video]: r.default.LibraryAsset,
            [t.default.Event]: r.default.Event,
            [t.default.PastEvent]: r.default.Event,
            [t.default.DraftEvent]: r.default.Event,
            [t.default.UpcomingEvent]: r.default.Event,
            [t.default.StorePreviewVideo]: r.default.LibraryAsset,
            [t.default.GamePreviewVideo]: r.default.LibraryAsset,
            [t.default.TextDocument]: r.default.LibraryAsset,
            [t.default.AssetPermissionRequests]: r.default.Game
        },
        x = {
            [r.default.Game]: "experiences",
            [r.default.CatalogAsset]: "catalog",
            [r.default.LibraryAsset]: "library",
            [r.default.Bundle]: "bundle",
            [r.default.Badge]: "badges",
            [r.default.GamePass]: "passes",
            [r.default.DeveloperProduct]: "developer-products",
            [r.default.TranslatorGame]: "experiences",
            [r.default.Places]: "places",
            [r.default.CreatedPlaces]: "places",
            [r.default.Event]: "events",
            [r.default.Notifications]: "notifications",
            [r.default.ExperienceSubscription]: "experience-subscriptions",
            [r.default.Advanced]: "advanced",
            [r.default.AvatarCreationToken]: "avatar-creation-tokens",
            [r.default.ReferralRewards]: "referral-reward-details",
            [r.default.Environment]: "environments",
            [r.default.Look]: "look",
            [r.default.Alert]: "alerts",
            [r.default.Journey]: "analytics/journeys"
        },
        T = {
            [r.default.Game]: a.ThumbnailTypes.gameIcon,
            [r.default.CatalogAsset]: a.ThumbnailTypes.assetThumbnail,
            [r.default.LibraryAsset]: a.ThumbnailTypes.assetThumbnail,
            [r.default.Bundle]: a.ThumbnailTypes.bundleThumbnail,
            [r.default.Badge]: a.ThumbnailTypes.badgeIcon,
            [r.default.GamePass]: a.ThumbnailTypes.gamePassIcon,
            [r.default.DeveloperProduct]: a.ThumbnailTypes.developerProductIcon,
            [r.default.TranslatorGame]: a.ThumbnailTypes.gameIcon,
            [r.default.Places]: a.ThumbnailTypes.placeIcon,
            [r.default.CreatedPlaces]: a.ThumbnailTypes.placeIcon,
            [r.default.Event]: a.ThumbnailTypes.universeThumbnail,
            [r.default.Notifications]: a.ThumbnailTypes.assetThumbnail,
            [r.default.ExperienceSubscription]: a.ThumbnailTypes.assetThumbnail,
            [r.default.Advanced]: a.ThumbnailTypes.assetThumbnail,
            [r.default.AvatarCreationToken]: a.ThumbnailTypes.bundleThumbnail,
            [r.default.ReferralRewards]: a.ThumbnailTypes.assetThumbnail,
            [r.default.Environment]: a.ThumbnailTypes.universeThumbnail,
            [r.default.Alert]: a.ThumbnailTypes.universeThumbnail,
            [r.default.Journey]: a.ThumbnailTypes.universeThumbnail,
            [r.default.Look]: a.ThumbnailTypes.assetThumbnail
        },
        R = {
            [r.default.Game]: a.ReturnPolicy.AutoGenerated,
            [r.default.Bundle]: a.ReturnPolicy.AutoGenerated,
            [r.default.CatalogAsset]: a.ReturnPolicy.PlaceHolder,
            [r.default.LibraryAsset]: a.ReturnPolicy.AutoGenerated,
            [r.default.Badge]: a.ReturnPolicy.AutoGenerated,
            [r.default.GamePass]: a.ReturnPolicy.AutoGenerated,
            [r.default.DeveloperProduct]: a.ReturnPolicy.AutoGenerated,
            [r.default.TranslatorGame]: a.ReturnPolicy.PlaceHolder,
            [r.default.Places]: a.ReturnPolicy.AutoGenerated,
            [r.default.CreatedPlaces]: a.ReturnPolicy.AutoGenerated,
            [r.default.Event]: a.ReturnPolicy.PlaceHolder,
            [r.default.Notifications]: a.ReturnPolicy.AutoGenerated,
            [r.default.ExperienceSubscription]: a.ReturnPolicy.AutoGenerated,
            [r.default.Advanced]: a.ReturnPolicy.AutoGenerated,
            [r.default.AvatarCreationToken]: a.ReturnPolicy.AutoGenerated,
            [r.default.ReferralRewards]: a.ReturnPolicy.AutoGenerated,
            [r.default.Environment]: a.ReturnPolicy.AutoGenerated,
            [r.default.Look]: a.ReturnPolicy.AutoGenerated,
            [r.default.Alert]: a.ReturnPolicy.AutoGenerated,
            [r.default.Journey]: a.ReturnPolicy.AutoGenerated
        },
        k = {
            [t.default.Place]: "Label.Games",
            [t.default.MyExperiences]: "Label.Games",
            [t.default.SharedExperiences]: "Label.Games",
            [t.default.TShirt]: "Label.TShirts",
            [t.default.Shirt]: "Label.Shirts",
            [t.default.Pants]: "Label.Pants",
            [t.default.Hat]: "Label.Hats",
            [t.default.HairAccessory]: "Label.HairAccessories",
            [t.default.FaceAccessory]: "Label.FaceAccessories",
            [t.default.NeckAccessory]: "Label.NeckAccessories",
            [t.default.ShoulderAccessory]: "Label.ShoulderAccessories",
            [t.default.FrontAccessory]: "Label.FrontAccessories",
            [t.default.BackAccessory]: "Label.BackAccessories",
            [t.default.WaistAccessory]: "Label.WaistAccessories",
            [t.default.TShirtAccessory]: "Label.TShirts",
            [t.default.ShirtAccessory]: "Label.Shirts",
            [t.default.PantsAccessory]: "Label.Pants",
            [t.default.JacketAccessory]: "Label.Jackets",
            [t.default.SweaterAccessory]: "Label.Sweaters",
            [t.default.ShortsAccessory]: "Label.ShortsAccessories",
            [t.default.DressSkirtAccessory]: "Label.Skirts",
            [t.default.EmoteAnimation]: "Label.Emote",
            [t.default.EyebrowAccessory]: "Label.EyebrowAccessories",
            [t.default.EyelashAccessory]: "Label.EyelashAccessories",
            [t.default.FaceMakeup]: "Label.FaceMakeupAccessories",
            [t.default.LipMakeup]: "Label.LipMakeupAccessories",
            [t.default.EyeMakeup]: "Label.EyeMakeupAccessories",
            [t.default.AvatarBackground]: "Label.Backgrounds",
            [t.default.AvatarLooks]: "Label.Avatars",
            [t.default.Showcase]: "Label.Showcases",
            [t.default.AllCatalogAsset]: "Label.AllAssetTypes",
            [t.default.Decal]: "Label.Decals",
            [t.default.Image]: "Label.Images",
            [t.default.Audio]: "Label.Audios",
            [t.default.Model]: "Label.Models",
            [t.default.Mesh]: "Label.Meshes",
            [t.default.MeshPart]: "Label.MeshParts",
            [t.default.Plugin]: "Label.Plugins",
            [t.default.FontFamily]: "Label.FontFamily",
            [t.default.Animation]: "Label.Animations",
            [t.default.Video]: "Label.Videos",
            [t.default.Event]: "Label.Events",
            [t.default.PastEvent]: "Label.PastEvents",
            [t.default.DraftEvent]: "Label.DraftEvents",
            [t.default.UpcomingEvent]: "Label.UpcomingEvents",
            [t.default.ShareLink]: "Label.ShareLinks",
            [t.default.Moments]: "Label.Moments",
            [t.default.StorePreviewVideo]: "Label.StorePreviewVideo",
            [t.default.GamePreviewVideo]: "Label.GamePreviewVideo",
            [t.default.TextDocument]: "Label.TextDocuments",
            [t.default.AssetPermissionRequests]: "Label.Requests"
        },
        M = {
            [t.default.Place]: "Label.Games",
            [t.default.MyExperiences]: "Label.Games",
            [t.default.SharedExperiences]: "Label.Games",
            [t.default.TShirt]: "Label.TShirt",
            [t.default.Shirt]: "Label.Shirt",
            [t.default.Pants]: "Label.Pants",
            [t.default.Hat]: "Label.Hat",
            [t.default.HairAccessory]: "Label.HairAccessory",
            [t.default.FaceAccessory]: "Label.FaceAccessory",
            [t.default.NeckAccessory]: "Label.NeckAccessory",
            [t.default.ShoulderAccessory]: "Label.ShoulderAccessory",
            [t.default.FrontAccessory]: "Label.FrontAccessory",
            [t.default.BackAccessory]: "Label.BackAccessory",
            [t.default.WaistAccessory]: "Label.WaistAccessory",
            [t.default.TShirtAccessory]: "Label.TShirt",
            [t.default.ShirtAccessory]: "Label.Shirt",
            [t.default.PantsAccessory]: "Label.Pants",
            [t.default.JacketAccessory]: "Label.Jacket",
            [t.default.SweaterAccessory]: "Label.Sweater",
            [t.default.ShortsAccessory]: "Label.ShortsAccessories",
            [t.default.DressSkirtAccessory]: "Label.Skirt",
            [t.default.EmoteAnimation]: "Label.Emote",
            [t.default.EyebrowAccessory]: "Label.EyebrowAccessory",
            [t.default.EyelashAccessory]: "Label.EyelashAccessory",
            [t.default.FaceMakeup]: "Label.FaceMakeup",
            [t.default.LipMakeup]: "Label.LipMakeup",
            [t.default.EyeMakeup]: "Label.EyeMAkeup",
            [t.default.AvatarBackground]: "Label.AvatarBackground",
            [t.default.AvatarLooks]: "Label.Avatars",
            [t.default.Showcase]: "Label.Showcase",
            [t.default.AllCatalogAsset]: "Label.AllAssetTypes",
            [t.default.Decal]: "Label.Decal",
            [t.default.Image]: "Label.Image",
            [t.default.Audio]: "Label.Audios",
            [t.default.Model]: "Label.Model",
            [t.default.Mesh]: "Label.Mesh",
            [t.default.MeshPart]: "Label.MeshPart",
            [t.default.Plugin]: "Label.Plugin",
            [t.default.Animation]: "Label.Animation",
            [t.default.FontFamily]: "Label.FontFamily",
            [t.default.Video]: "Label.Video",
            [t.default.Event]: "Label.Event",
            [t.default.PastEvent]: "Label.PastEvent",
            [t.default.DraftEvent]: "Label.DraftEvent",
            [t.default.UpcomingEvent]: "Label.UpcomingEvent",
            [t.default.ShareLink]: "Label.ShareLink",
            [t.default.Moments]: "Label.Moments",
            [t.default.StorePreviewVideo]: "Label.StorePreviewVideo",
            [t.default.GamePreviewVideo]: "Label.GamePreviewVideo",
            [t.default.TextDocument]: "Label.TextDocument",
            [t.default.AssetPermissionRequests]: "Label.Requests"
        },
        z = {
            [r.default.Game]: "Label.Games",
            [r.default.CatalogAsset]: "Label.AvatarItems",
            [r.default.Bundle]: "Label.AvatarItem",
            [r.default.LibraryAsset]: "Label.DevelopmentItems",
            [r.default.Badge]: "Label.Badges",
            [r.default.GamePass]: "Label.GamePasses",
            [r.default.DeveloperProduct]: "Label.DeveloperProducts",
            [r.default.TranslatorGame]: "Label.TranslatorGame",
            [r.default.Places]: "Label.Places",
            [r.default.CreatedPlaces]: "Label.Places",
            [r.default.Event]: "Label.Events",
            [r.default.Notifications]: "Label.Notifications",
            [r.default.ExperienceSubscription]: "Label.Subscriptions",
            [r.default.Advanced]: "Header.Title",
            [r.default.AvatarCreationToken]: "Label.AvatarCreationTokens",
            [r.default.ReferralRewards]: "Label.ReferralRewards",
            [r.default.Environment]: "Label.Environments",
            [r.default.Look]: "Label.Looks",
            [r.default.Alert]: "Heading.Alerts",
            [r.default.Journey]: "Heading.Journeys"
        },
        D = {
            [r.default.Game]: "Label.Game",
            [r.default.CatalogAsset]: "Label.AvatarItem",
            [r.default.Bundle]: "Label.AvatarItem",
            [r.default.LibraryAsset]: "Label.DevelopmentItem",
            [r.default.Badge]: "Label.Badge",
            [r.default.GamePass]: "Label.GamePass",
            [r.default.DeveloperProduct]: "Label.DeveloperProduct",
            [r.default.TranslatorGame]: "Label.TranslatorGame",
            [r.default.Places]: "Label.Place",
            [r.default.CreatedPlaces]: "Label.Places",
            [r.default.Event]: "Label.Event",
            [r.default.Notifications]: "Label.Notifications",
            [r.default.ExperienceSubscription]: "Label.Subscription",
            [r.default.Advanced]: "Header.Title",
            [r.default.AvatarCreationToken]: "Label.Token",
            [r.default.ReferralRewards]: "Label.ReferralRewards",
            [r.default.Environment]: "Label.Environment",
            [r.default.Look]: "Label.Looks",
            [r.default.Alert]: "Heading.Alert",
            [r.default.Journey]: "Heading.Journey"
        },
        G = {
            [r.default.Game]: "Heading.Game",
            [r.default.CatalogAsset]: "Heading.AvatarItem",
            [r.default.Bundle]: "Heading.AvatarItem",
            [r.default.LibraryAsset]: "Heading.DevelopmentItem",
            [r.default.Badge]: "Heading.Badge",
            [r.default.GamePass]: "Heading.Pass",
            [r.default.DeveloperProduct]: "Heading.DeveloperProduct",
            [r.default.TranslatorGame]: "Heading.TranslatorGame",
            [r.default.Places]: "Heading.Place",
            [r.default.CreatedPlaces]: "Heading.Place",
            [r.default.Event]: "Heading.Event",
            [r.default.Notifications]: "Heading.Notifications.CreateContent",
            [r.default.ExperienceSubscription]: "Heading.Subscription",
            [r.default.Advanced]: "Header.Title",
            [r.default.AvatarCreationToken]: "Label.AvatarCreationToken",
            [r.default.ReferralRewards]: "Heading.ReferralRewards",
            [r.default.Environment]: "Heading.Environment",
            [r.default.Look]: "Heading.Looks",
            [r.default.Alert]: "Heading.Alert",
            [r.default.Journey]: "Heading.Journey"
        },
        w = {
            [r.default.Game]: null,
            [r.default.CatalogAsset]: null,
            [r.default.Bundle]: null,
            [r.default.LibraryAsset]: null,
            [r.default.Badge]: "badges/create",
            [r.default.GamePass]: "passes/create",
            [r.default.DeveloperProduct]: "developer-products/create",
            [r.default.ReferralRewards]: "referral-reward-details/create",
            [r.default.TranslatorGame]: null,
            [r.default.Places]: null,
            [r.default.CreatedPlaces]: null,
            [r.default.Event]: "events/create",
            [r.default.Notifications]: null,
            [r.default.ExperienceSubscription]: "experience-subscriptions/create",
            [r.default.Advanced]: null,
            [r.default.AvatarCreationToken]: "avatar-creation-tokens/create",
            [r.default.Environment]: "environments/create",
            [r.default.Look]: "looks/create",
            [r.default.Alert]: "alerts/create",
            [r.default.Journey]: "analytics/journeys/create"
        },
        I = {
            [r.default.Game]: null,
            [r.default.CatalogAsset]: null,
            [r.default.Bundle]: null,
            [r.default.LibraryAsset]: null,
            [r.default.Badge]: "badges/reorder",
            [r.default.ReferralRewards]: null,
            [r.default.GamePass]: null,
            [r.default.DeveloperProduct]: null,
            [r.default.TranslatorGame]: null,
            [r.default.Places]: null,
            [r.default.CreatedPlaces]: null,
            [r.default.Event]: null,
            [r.default.Notifications]: null,
            [r.default.ExperienceSubscription]: null,
            [r.default.Advanced]: null,
            [r.default.AvatarCreationToken]: null,
            [r.default.Environment]: null,
            [r.default.Look]: null,
            [r.default.Alert]: null,
            [r.default.Journey]: null
        },
        B = {
            [r.default.Badge]: c,
            [r.default.DeveloperProduct]: s,
            [r.default.GamePass]: i,
            [r.default.CatalogAsset]: p,
            [r.default.ExperienceSubscription]: m,
            [r.default.AvatarCreationToken]: S,
            [r.default.Look]: void 0
        };
    e.s(["AllSettlePromiseFailed", 0, "rejected", "AllSettlePromiseSuccess", 0, "fulfilled", "assetFullNameKeys", 0, k, "assetTypeToItemType", 0, C, "assetTypeToSingularNameKeys", 0, M, "itemFullNameKeys", 0, z, "itemTypeToCreatePath", 0, w, "itemTypeToLearnMoreUrl", 0, B, "itemTypeToNameKeys", 0, D, "itemTypeToPath", 0, x, "itemTypeToReorderPath", 0, I, "itemTypeToReturnPolicyType", 0, R, "itemTypeToSingularNameKeys", 0, G, "itemTypeToThumbnailType", 0, T, "toastDurationTime", 0, 3e3, "uninitializedUniverseId", 0, -1], 759283)
}, 307529, e => {
    "use strict";
    var a, t = ((a = t || {}).Place = "Place", a.MyExperiences = "MyExperiences", a.SharedExperiences = "SharedExperiences", a.TShirt = "TShirt", a.Shirt = "Shirt", a.Pants = "Pants", a.Hat = "Hat", a.HairAccessory = "HairAccessory", a.FaceAccessory = "FaceAccessory", a.NeckAccessory = "NeckAccessory", a.ShoulderAccessory = "ShoulderAccessory", a.FrontAccessory = "FrontAccessory", a.BackAccessory = "BackAccessory", a.WaistAccessory = "WaistAccessory", a.TShirtAccessory = "TShirtAccessory", a.ShirtAccessory = "ShirtAccessory", a.PantsAccessory = "PantsAccessory", a.JacketAccessory = "JacketAccessory", a.SweaterAccessory = "SweaterAccessory", a.ShortsAccessory = "ShortsAccessory", a.DressSkirtAccessory = "DressSkirtAccessory", a.EyebrowAccessory = "EyebrowAccessory", a.EyelashAccessory = "EyelashAccessory", a.FaceMakeup = "FaceMakeup", a.LipMakeup = "LipMakeup", a.EyeMakeup = "EyeMakeup", a.AvatarBackground = "AvatarBackground", a.AvatarLooks = "AvatarLooks", a.Showcase = "Showcase", a.Decal = "Decal", a.Image = "Image", a.Audio = "Audio", a.Model = "Model", a.Mesh = "Mesh", a.MeshPart = "MeshPart", a.Plugin = "Plugin", a.EmoteAnimation = "EmoteAnimation", a.Animation = "Animation", a.Video = "Video", a.TextDocument = "TextDocument", a.Event = "Event", a.UpcomingEvent = "UpcomingEvent", a.DraftEvent = "DraftEvent", a.PastEvent = "PastEvent", a.FontFamily = "FontFamily", a.ShareLink = "ShareLink", a.Moments = "Moments", a.StorePreviewVideo = "StorePreviewVideo", a.GamePreviewVideo = "GamePreviewVideo", a.AllCatalogAsset = "All", a.AssetPermissionRequests = "AssetPermissionRequests", a);
    e.s(["default", 0, t])
}, 251622, e => {
    "use strict";
    var a, t = ((a = t || {}).Game = "Game", a.Bundle = "Bundle", a.CatalogAsset = "CatalogAsset", a.LibraryAsset = "LibraryAsset", a.GamePass = "Pass", a.Badge = "Badge", a.DeveloperProduct = "DeveloperProduct", a.TranslatorGame = "TranslatorGame", a.Places = "Places", a.CreatedPlaces = "CreatedPlaces", a.Event = "Event", a.Notifications = "Notifications", a.ExperienceSubscription = "Subscription", a.Advanced = "Advanced", a.AvatarCreationToken = "AvatarCreationToken", a.ReferralRewards = "ReferralRewards", a.Environment = "Environment", a.Look = "Look", a.Alert = "Alert", a.Journey = "Journey", a);
    let r = Object.values(t);
    e.s(["default", 0, t, "isItem", 0, e => r.includes(e)])
}, 726474, e => {
    "use strict";
    var a = e.i(309999),
        t = e.i(307529),
        r = e.i(251622);
    let o = "".concat("https://create.roblox.com", "/store"),
        n = "".concat("https://create.roblox.com", "/docs"),
        s = {
            [a.CategoryType.Model]: "models",
            [a.CategoryType.Plugin]: "plugins",
            [a.CategoryType.Audio]: "audio",
            [a.CategoryType.FontFamily]: "fonts",
            [a.CategoryType.Decal]: "decals",
            [a.CategoryType.MeshPart]: "meshParts",
            [a.CategoryType.Video]: "videos",
            [a.CategoryType.Animation]: "",
            [a.CategoryType.Music]: "",
            [a.CategoryType.SoundEffect]: "",
            [a.CategoryType.UnknownAudio]: "",
            [a.CategoryType.Package]: "",
            [a.CategoryType.SharedPackage]: ""
        },
        c = (e, a) => "/dashboard/creations/experiences/".concat(e).concat(a ? "/observability" : "", "/server-management"),
        i = {
            getUrl: (e, a, t) => {
                let r = new URLSearchParams({
                    ...e ? {
                        groupId: e
                    } : {},
                    ...a ? {
                        assetType: a
                    } : {},
                    ...t ? {
                        activeTab: t
                    } : {}
                }).toString();
                return "/dashboard/creations".concat(r.length > 0 ? "?" : "").concat(r)
            },
            getConfigureItemUrl: (e, a) => {
                switch (a) {
                    case r.default.Game:
                        return i.getConfigureExperienceUrl(e);
                    case r.default.Bundle:
                        return i.getConfigureBundlePath(e);
                    case r.default.CatalogAsset:
                        return i.getConfigureAvatarItemsUrl(e);
                    default:
                        throw Error("Unsupported item type ".concat(String(a)))
                }
            },
            getExperienceOverviewUrl: e => "/dashboard/creations/experiences/".concat(e, "/overview"),
            getConfigureBundlePath: e => "/dashboard/creations/bundle/".concat(e, "/configure"),
            getConfigureExperienceUrl: e => "/dashboard/creations/experiences/".concat(e, "/configure"),
            configureCreatorStoreItemBasePath: "/dashboard/creations/store/",
            getConfigureCreatorStoreItemUrl: e => "".concat(i.configureCreatorStoreItemBasePath).concat(e, "/configure"),
            getConfigureAvatarItemsUrl: e => "/dashboard/creations/catalog/".concat(e, "/configure"),
            getConfigureDeveloperProductUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/developer-products/").concat(a, "/configure"),
            getCreateDeveloperProductUrl: e => "/dashboard/creations/experiences/".concat(e, "/developer-products/create"),
            getConfigurePassUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/passes/").concat(a, "/configure"),
            getConfigurePassSalesUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/passes/").concat(a, "/sales"),
            getCreatePassUrl: e => "/dashboard/creations/experiences/".concat(e, "/passes/create"),
            getConfigureExperienceSubscriptionUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/experience-subscriptions/").concat(a, "/configure"),
            getCreateExperienceSubscriptionUrl: e => "/dashboard/creations/experiences/".concat(e, "/experience-subscriptions/create"),
            getUserBansUrl: e => "/dashboard/creations/experiences/".concat(e, "/safety/bans"),
            getAddUsersToBanUrl: e => "/dashboard/creations/experiences/".concat(e, "/safety/bans/add"),
            getAntiCheatUrl: e => "/dashboard/creations/experiences/".concat(e, "/safety/anti-cheat"),
            getIssuesAndAppealsUrl: e => "/dashboard/creations/experiences/".concat(e, "/safety/issues-and-appeals"),
            getGameViolationUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/safety/issues-and-appeals/").concat(encodeURIComponent(a)),
            getAnalyticsOverviewUrl: () => "/dashboard/analytics",
            getAnalyticsUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics"),
            getAnalyticsPerformanceUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics/performance"),
            getAnalyticsPerformanceClientUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics/performance?tab=client"),
            getAnalyticsEngagementUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics/engagement"),
            getAnalyticsFunnelsUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics/funnels"),
            getAnalyticsEconomyUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics/economy"),
            getAnalyticAcquisitionUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics/acquisition"),
            getAnalyticAcquisitionHomeRecommendationsUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics/acquisition?tab=homeRecommendations"),
            getAnalyticsConfigsUrl: e => "/dashboard/creations/experiences/".concat(e, "/configs"),
            getAnalyticsConfigsCreateUrl: e => "/dashboard/creations/experiences/".concat(e, "/configs/config-create"),
            getAnalyticsErrorsUrls: e => "/dashboard/creations/experiences/".concat(e, "/analytics/errors"),
            getAnalyticsExploreUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics/explore"),
            getAnalyticsAgentUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics/agent"),
            getAnalyticsJourneysUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics/journeys"),
            getAnalyticsJourneysCreateUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics/journeys/create"),
            getAnalyticsJourneysEditUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/analytics/journeys/edit?journeyName=").concat(encodeURIComponent(a)),
            getAnalyticsJourneysViewUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/analytics/journeys/view?filter_JourneyName=").concat(encodeURIComponent(a)),
            getBundleAnalyticsUrl: function(e) {
                let a = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "Last7Days";
                return "/dashboard/creations/bundle/".concat(e, "/analytics?rangeType=").concat(a)
            },
            getCatalogAnalyticsUrl: function(e) {
                let a = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "Last7Days";
                return "/dashboard/creations/catalog/".concat(e, "/analytics?rangeType=").concat(a)
            },
            getPlaceThumbnailsUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/places/").concat(a, "/thumbnails"),
            getPlaceVideosUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/places/").concat(a, "/videos"),
            getPlaceIconUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/places/").concat(a, "/icon"),
            getExperienceAlertCreateUrl: e => "/dashboard/creations/experiences/".concat(e, "/alerts/create"),
            getExperienceAlertConfigureUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/alerts/").concat(a, "/configure"),
            getExperienceAlertsUrl: e => "/dashboard/creations/experiences/".concat(e, "/alerts"),
            getExperienceWebhooksUrl: e => "/dashboard/creations/experiences/".concat(e, "/webhooks"),
            getExperimentsUrl: e => "/dashboard/creations/experiences/".concat(e, "/experiments"),
            getUploadUrl: function() {
                let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : t.default.TShirt;
                return "/dashboard/creations/upload?assetType=".concat(e)
            },
            getDevexUrl: () => "/dashboard/devex",
            getBillingStatementUrl: e => "/dashboard/summary/".concat(e),
            getServiceActivityUrl: () => "/dashboard/billing",
            getMonetizationOverviewUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/overview"),
            getMonetizationDeveloperProductsUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/developer-products"),
            getMonetizationDeveloperProductsAnalyticsTabUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/developer-products?tab=Analytics"),
            getMonetizationDeveloperProductsExternalPurchaseSettingsUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/developer-products/external-purchase-settings"),
            getMonetizationPassesUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/passes"),
            getMonetizationPassesAnalyticsTabUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/passes?tab=Analytics"),
            getMonetizationAvatarItemsUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/avatar-items"),
            getMonetizationAvatarItemsAnalyticsTabUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/avatar-items?tab=Analytics"),
            getMonetizationSubscriptionsUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/subscriptions"),
            getMonetizationSubscriptionsAnalyticsTabUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/subscriptions?tab=Analytics"),
            getMonetizationSubscriptionsHistoryTabUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/subscriptions?tab=History"),
            getMonetizationCommerceUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/commerce"),
            getMonetizationCommerceCreateProductUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/commerce/create-products"),
            getMonetizationImmersiveAdsUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/immersive-ads"),
            getMonetizationImmersiveAdsCreatePlacementUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/immersive-ads/create-placement"),
            getMonetizationCreatorRewardsUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/creator-rewards"),
            getMonetizationBountyPayoutsUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/roblox-plus"),
            getMonetizationAvatarCreationTokensUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/avatar-creation-tokens"),
            getConfigureAvatarCreationTokenUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/avatar-creation-tokens/").concat(a, "/configure"),
            getMonetizationPriceOptimizationUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/price-optimization"),
            getMonetizationDynamicPriceCheckUrl: function(e) {
                let a = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    t = new URLSearchParams(a).toString();
                return "/dashboard/creations/experiences/".concat(e, "/monetization/price-check").concat(t.length > 0 ? "?".concat(t) : "")
            },
            getManagedPricingUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/monetization/managed-pricing").concat(a ? "?tab=".concat(a) : ""),
            getManagedPricingEventDetailsUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/monetization/managed-pricing/events/").concat(a, "/details"),
            getMonetizationHardCodedPricesUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/hard-coded-prices"),
            getPersonalizedShopsUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/monetization/shop").concat(a ? "?tab=".concat(a) : ""),
            getDeveloperProductPurchasesBlockedUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/shop/developer-product-purchases-blocked"),
            getSellerOnboardingUrl: () => "/settings/eligibility/priced-assets",
            getTranslatorPortalUrl: () => "/dashboard/translator-portal",
            getAudioDistributionOnboardingUrl: () => "/settings/eligibility/audio-distribution",
            getCreateGroupUrl: () => "/dashboard/group/create",
            getGroupProfileUrl: e => {
                let a = new URLSearchParams({
                    groupId: e
                }).toString();
                return "/dashboard/group/profile".concat(a.length > 0 ? "?" : "").concat(a)
            },
            getRightsManagerAssetUrl: e => "/dashboard/rights-manager/accounts/contents/asset/".concat(e),
            getCustomMatchmakingDashboardUrl: e => "/dashboard/creations/experiences/".concat(e, "/matchmaking"),
            getCustomMatchmakingConfigurationDashboardUrl: e => "/dashboard/creations/experiences/".concat(e, "/matchmaking?activeTab=Configuration"),
            getCustomMatchmakingAttributesDashboardUrl: e => "/dashboard/creations/experiences/".concat(e, "/matchmaking?activeTab=Attributes"),
            getCustomMatchmakingAnalyticsDashboardUrl: e => "/dashboard/creations/experiences/".concat(e, "/matchmaking?activeTab=Analytics"),
            getCustomMatchmakingConfigurationCreationUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/matchmaking/create-configuration/").concat(a),
            getCustomMatchmakingEditConfigurationUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/matchmaking/edit-configuration/").concat(a),
            getCustomMatchmakingAttributeCreationUrl: e => "/dashboard/creations/experiences/".concat(e, "/matchmaking/create-attribute"),
            getCustomMatchmakingEditServerAttributeUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/matchmaking/edit-server-attribute/").concat(a),
            getCustomMatchmakingEditPlayerAttributeUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/matchmaking/edit-player-attribute/").concat(a),
            getLocalizationUrl: e => "/dashboard/creations/experiences/".concat(e, "/localization"),
            getDataStoresManagerUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics/data-stores"),
            getExtendedServicesUnlock: e => "/dashboard/creations/experiences/".concat(e, "/extended-services"),
            getPaymentsUrl: () => "/dashboard/payments",
            getServerManagementUrl: function(e) {
                let a = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
                return c(e, a)
            },
            getServerManagementServersUrl: function(e, a) {
                let t = arguments.length > 2 && void 0 !== arguments[2] && arguments[2],
                    r = arguments.length > 3 ? arguments[3] : void 0,
                    o = "".concat(c(e, t), "/").concat(a, "/servers");
                if (!r || 0 === r.length) return o;
                let n = new URLSearchParams;
                return n.set("serverStatus", r.join(",")), "".concat(o, "?").concat(n.toString())
            },
            getServerManagementDetailsUrl: function(e, a, t) {
                let r = arguments.length > 3 && void 0 !== arguments[3] && arguments[3],
                    o = arguments.length > 4 ? arguments[4] : void 0,
                    n = arguments.length > 5 ? arguments[5] : void 0,
                    s = new URLSearchParams;
                (null != o || null != n) && s.set("logRange", "custom"), null != o && s.set("logStart", String(o)), null != n && s.set("logEnd", String(n));
                let i = s.toString();
                return "".concat(c(e, r), "/").concat(a, "/servers/").concat(t, "/details").concat(i ? "?".concat(i) : "")
            },
            getClientSessionsUrl: (e, a) => {
                let t = "/dashboard/creations/experiences/".concat(e, "/observability/client-sessions");
                return void 0 === a ? t : "".concat(t, "?filter_ExitReason=").concat(encodeURIComponent(a))
            },
            getClientSessionDetailsUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/observability/client-sessions/").concat(a),
            getObservabilityDataCapturesUrl: e => "/dashboard/creations/experiences/".concat(e, "/observability/data-captures"),
            getObservabilityDataCaptureCreateUrl: e => "/dashboard/creations/experiences/".concat(e, "/observability/data-captures/create"),
            getObservabilityDataCaptureEditUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/observability/data-captures/").concat(encodeURIComponent(a), "/edit"),
            getPlayerSupportUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/player-support").concat(a ? "/".concat(a) : "")
        };
    e.s(["creatorStore", 0, {
        getUrl: () => o,
        getAssetUrl: e => "".concat(o, "/asset/").concat(e),
        getSearchUrl: (e, a) => {
            if ("" !== s[e]) return "".concat(o, "/").concat(s[e], "?keyword=").concat(encodeURIComponent(a));
            throw Error("Unsupported search asset type ".concat(e))
        }
    }, "dashboard", 0, i, "developerForum", 0, {
        getBaseUrl: () => "https://devforum.roblox.com",
        getCdnBaseUrl: () => "https://doy2mn9upadnk.cloudfront.net",
        getMediaCdnBaseUrl: () => "//d3vcfwomg2mj2z.cloudfront.net",
        getAnnouncementsPath: () => "/c/updates/announcements/36",
        getPublicSfxAnnouncementPath: () => "/t/public-sound-effects-upload-are-now-available-for-creators/2980704"
    }, "docs", 0, {
        getUrl: () => n,
        getAiDataSharingUrl: () => "".concat(n, "/ai-data-sharing"),
        getBadgesPublishingUrl: () => "".concat(n, "/production/publishing/badges"),
        getExperiencesPublishingUrl: () => "".concat(n, "/production/publishing/publishing-experiences-and-places"),
        getCrossServerChatUrl: () => "".concat(n, "/chat/cross-server-chat"),
        getStrongLanguageUrl: () => "".concat(n, "/projects/configure-games#allow-strong-language"),
        getSellingOnCreatorStoreUrl: () => "".concat(n, "/production/creator-store#distribute-and-sell-assets"),
        getPassesMonetizationUrl: () => "".concat(n, "/production/monetization/game-passes"),
        getDeveloperProductsMonetizationUrl: () => "".concat(n, "/production/monetization/developer-products"),
        getDeveloperProductsExternalPurchaseSettingsMonetizationUrl: () => "".concat(n, "/production/monetization/developer-products#outside-your-experience"),
        getExternalEligibilityReferenceUrl: () => "".concat(n, "/reference/engine/classes/MarketplaceService#ProcessReceipt"),
        getSubscriptionsMonetizationUrl: () => "".concat(n, "/production/monetization/subscriptions"),
        getSubscriptionsMonetizationAnalyticsUrl: () => "".concat(n, "/production/monetization/subscriptions#subscription-analytics"),
        getPriceOptimizationMonetizationUrl: () => "".concat(n, "/production/monetization/price-optimization"),
        getDynamicPriceCheckMonetizationUrl: () => "".concat(n, "/production/monetization/price-optimization#using-the-dynamic-price-check-tool"),
        getRegionalPricingMonetizationUrl: () => "".concat(n, "/production/monetization/regional-pricing"),
        getPriceLevelsApiMonetizationUrl: () => "".concat(n, "/production/monetization/regional-pricing#protect-your-trades-and-gifts"),
        getManagedPricingMonetizationUrl: () => "".concat(n, "/production/monetization/managed-pricing"),
        getPersonalizedShopsMonetizationUrl: () => "".concat(n, "/production/monetization/shop"),
        getImmersiveAdsMonetizationUrl: () => "".concat(n, "/production/monetization/immersive-ads"),
        getRewardedVideoUrl: () => "".concat(n, "/production/promotion/rewarded-video-ads"),
        getKidsAndSelectPublishingUrl: () => "".concat(n, "/production/publishing/kids-and-select"),
        getExperienceDetailsPageRewardedAdsUrl: () => "".concat(n, "/production/monetization/immersive-ads"),
        getCreatorStorePublishingUrl: () => "".concat(n, "/production/creator-store#distribute-and-sell-assets"),
        getDecalReferenceUrl: () => "".concat(n, "/reference/engine/classes/Decal"),
        getIntegrityServiceReferenceUrl: () => "".concat(n, "/reference/engine/classes/IntegrityService"),
        getOpenCloudReferenceUrl: () => "".concat(n, "/reference/cloud"),
        getAudioAssetsUrl: () => "".concat(n, "/building-and-visuals/audio/audio-assets"),
        getAssetsUrl: () => "".concat(n, "/projects/assets"),
        getClassicClothingUrl: () => "".concat(n, "/avatar/accessories/classic-clothing"),
        getEarningOnRobloxUrl: () => "".concat(n, "/production/earning-on-roblox"),
        getSettingUpStudioUrl: () => "".concat(n, "/studio/setup"),
        getStudioUrl: () => "".concat(n, "/studio"),
        getPlatformUrl: () => "".concat(n, "/platform"),
        getAnalyticsUrl: () => "".concat(n, "/production/analytics"),
        getAnalyticsErrorReportUrl: () => "".concat(n, "/production/analytics/error-report"),
        getAnalyticsJourneyEventsUrl: () => "".concat(n, "/production/analytics/journey-events"),
        getUnityGuideUrl: () => "".concat(n, "/unity"),
        getUnrealGuideUrl: () => "".concat(n, "/unreal"),
        getEventsPlatformUrl: () => "".concat(n, "/production/promotion/events-platform"),
        getAvatarItemsUrl: () => "".concat(n, "/avatar"),
        getClassicAccessoriesUrl: () => "".concat(n, "/art/accessories/classic-clothing"),
        getModelsUrl: () => "".concat(n, "/parts/models"),
        getMakeupLooksUrl: () => "".concat(n, "/avatar/makeup-looks"),
        getPluginsReferenceUrl: () => "".concat(n, "/reference/engine/classes/Plugin"),
        getVideoFrameReferenceUrl: () => "".concat(n, "/reference/engine/classes/VideoFrame#Video"),
        getMeshPartReferenceUrl: () => "".concat(n, "/reference/engine/classes/MeshPart"),
        getAnimationReferenceUrl: () => "".concat(n, "/reference/engine/classes/Animation"),
        getLocalizationGuideUrl: () => "".concat(n, "/production/localization"),
        getAssistantUrl: () => "".concat(n, "/assistant"),
        getAnalyticsRetentionGuideUrl: () => "".concat(n, "/production/analytics/retention#improve-day-1-retention"),
        getMonetizationNewUserExperienceGuideUrl: () => "".concat(n, "/production/monetization/improve-new-user-experience"),
        getAnalyticsEngagementGuideUrl: () => "".concat(n, "/production/analytics/engagement#improving-average-session-time"),
        getAnalyticsRetentionD7GuideUrl: () => "".concat(n, "/production/analytics/retention#improve-day-7-retention"),
        getAnalyticsRetentionD30GuideUrl: () => "".concat(n, "/production/analytics/retention#improve-day-30-retention"),
        getAnalyticsMonetizationPayerConversionRateGuideUrl: () => "".concat(n, "/production/analytics/monetization#improving-payer-conversion-rate"),
        getAnalyticsMonetizationARPPUGuideUrl: () => "".concat(n, "/production/analytics/monetization#improving-average-revenue-per-paying-user-arppu"),
        getAnalyticsFilterByMetricsGuideUrl: () => "".concat(n, "/production/analytics/analytics-dashboard#filter-by-metrics"),
        getAnalyticsEventTypesUrl: () => "".concat(n, "/production/analytics/event-types"),
        getDiscoveryUrl: () => "".concat(n, "/discovery"),
        getDiscoveryBestPracticesUrl: () => "".concat(n, "/discovery#best-practices-for-discovery"),
        getDiscoveryRecommendationUrl: () => "".concat(n, "/discovery#how-recommendation-works"),
        getDiscoveryKeySignalsUrl: () => "".concat(n, "/discovery#key-signals"),
        getDiscoveryGetDiscoveredUrl: () => "".concat(n, "/discovery#how-you-can-get-discovered-via-recommendations"),
        getCreatorStoreAssetModerationUrl: () => "".concat(n, "/production/creator-store#asset-requirements"),
        getCreatorStoreAccountRequirementsUrl: () => "".concat(n, "/production/creator-store#account-requirements"),
        getPerformanceOptimizationUrl: () => "".concat(n, "/performance-optimization"),
        getPromotionalThumbnailsUrl: () => "".concat(n, "/production/promotion/promotional-thumbnails"),
        getExperienceGenresUrl: () => "".concat(n, "/production/publishing/experience-genres"),
        getGenreDefinitionsUrl: () => "".concat(n, "/production/publishing/experience-genres#genre-and-subgenre-descriptions"),
        getExperienceGenresAppealUrl: () => "".concat(n, "/production/publishing/experience-genres#genre-accuracy"),
        getMakeExperiencePublicUrl: () => "".concat(n, "/production/publishing/publish-experiences-and-places#make-experience-public"),
        getOwnershipTransferUrl: () => "".concat(n, "/projects/experience-ownership-transfer"),
        getStreamingUrl: () => "".concat(n, "/workspace/streaming"),
        getAnimationTransferUrl: () => "".concat(n, "/projects/transferring-animations"),
        getGameDesignMissionsUrl: () => "".concat(n, "/production/game-design/introduction-to-quest-design"),
        getGameDesignStarterPackUrl: () => "".concat(n, "/production/game-design/starter-pack-design"),
        getGameDesignBundlesUrl: () => "".concat(n, "/production/game-design/monetization-foundations#bundles"),
        getGameDesignSeasonPassUrl: () => "".concat(n, "/production/game-design/season-pass-design"),
        getGameDesignEngagementRewardsUrl: () => "".concat(n, "/production/game-design/analytics-essentials#engagement-metrics\n"),
        getCloudServicesMemoryStoresAPIRequestsUrl: () => "".concat(n, "/cloud-services/memory-stores/observability#api-request-alerts"),
        getCloudServicesMemoryStoresMemoryUsageUrl: () => "".concat(n, "/cloud-services/memory-stores/observability#memory-usage-alerts"),
        getExperimentationUrl: () => "".concat(n, "/production/experiments"),
        getExperimentationBestPracticesUrl: () => "".concat(n, "/production/experiments#best-practices-for-experiments"),
        getExperimentationDailyResultsUrl: () => "".concat(n, "/production/experiments#daily-results"),
        getExperimentationEarlyHarmMetricsUrl: () => "".concat(n, "/production/experiments#early-harm-metrics"),
        getExperimentationEarlyHarmThresholdsUrl: () => "".concat(n, "/production/experiments#early-harm-thresholds"),
        getExperimentationSrmUrl: () => "".concat(n, "/production/experiments#sample-ratio-mismatch"),
        getReleaseNotesUrl: e => "".concat(n, "/release-notes/release-notes-").concat(e),
        getProductIntelligenceApisUrl: () => "".concat(n, "/production/monetization/developer-products#personalize-your-in-experience-store")
    }, "getDataCollectionSettingsUrl", 0, function(e, a) {
        let t = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "",
            r = new URLSearchParams({
                ...e ? {
                    roblox: "true"
                } : {},
                ...a ? {
                    public: "true"
                } : {},
                ...t ? {
                    tab: t
                } : {}
            }).toString();
        return "/settings/data-collection".concat(r.length > 0 ? "?" : "").concat(r)
    }, "getGroupRoleUrl", 0, e => "/dashboard/group/roles/".concat(e), "getRoadmapUrl", 0, () => "/roadmap", "getUrl", 0, () => "/"])
}, 829425, e => {
    "use strict";
    var a = e.i(726474);
    e.s(["creatorHub", 0, a])
}, 968892, e => {
    "use strict";
    var a = e.i(737586),
        t = e.i(999544),
        r = e.i(301040),
        o = e.i(880343),
        n = e.i(197649),
        s = e.i(416340),
        c = e.i(23342);
    let i = {
            Large: 24,
            Medium: 20,
            Small: 16,
            XSmall: 12
        },
        l = {
            Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
            Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
            Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
            XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
        },
        d = {
            Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
            Standard: ["bg-action-standard", "content-action-standard"],
            SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
            Utility: ["bg-action-subtle", "content-action-standard"],
            Link: ["bg-action-link", "content-system-emphasis"],
            Alert: ["bg-action-alert", "content-action-alert"],
            ActionUtility: ["bg-action-subtle", "content-action-standard"]
        },
        u = {
            Emphasis: ["bg-action-standard", "content-action-standard"],
            Standard: ["bg-action-standard", "content-action-standard"],
            SoftEmphasis: ["bg-action-standard", "content-action-standard"],
            Utility: ["bg-action-subtle", "content-action-standard"],
            Link: ["bg-action-link", "content-system-emphasis"],
            Alert: ["bg-action-standard", "content-action-standard"],
            ActionUtility: ["bg-action-subtle", "content-action-standard"]
        },
        g = (0, s.forwardRef)((e, g) => {
            let {
                children: p,
                className: m,
                style: f,
                isDisabled: b = !1,
                isLoading: y = !1,
                icon: A,
                size: h = "Large",
                variant: v = "Emphasis",
                asChild: U,
                ...P
            } = e, L = (0, n.default)("foundation-web-button", b ? t.disabledOpacity : [a.interactable, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", l[h], b ? u[v] : d[v], m), E = {
                textDecoration: "none",
                ...f
            }, S = e => s.default.createElement(s.default.Fragment, null, s.default.createElement(a.StateLayer, null), y && s.default.createElement("div", {
                "aria-hidden": "true",
                className: "absolute flex"
            }, s.default.createElement(r.LoadingSpinner, {
                width: i[h],
                height: i[h]
            })), s.default.createElement("span", {
                className: (0, n.default)("flex items-center min-width-0", "Large" === h || "Medium" === h ? "gap-small" : "gap-xsmall", y && "invisible")
            }, A && s.default.createElement(o.Icon, {
                name: A,
                size: h
            }), s.default.createElement("span", {
                className: "padding-y-xsmall text-truncate-end text-no-wrap"
            }, e)));
            if (U) {
                let {
                    as: e,
                    ...a
                } = P, t = s.default.Children.only(p);
                return s.default.createElement(c.Slot, {
                    ref: g,
                    ...a,
                    className: L,
                    style: E,
                    "aria-disabled": b || void 0
                }, s.default.cloneElement(t, {}, S(t.props.children)))
            }
            if ("a" === P.as) {
                let {
                    as: e,
                    href: a,
                    ...t
                } = P;
                return s.default.createElement("a", {
                    ref: g,
                    ...t,
                    "aria-disabled": b,
                    href: b ? void 0 : a,
                    className: L,
                    style: E
                }, S(p))
            }
            let {
                as: C,
                ...x
            } = P;
            return s.default.createElement("button", {
                ref: g,
                type: "button",
                ...x,
                disabled: b,
                className: L,
                style: E
            }, S(p))
        });
    e.s(["Button", 0, g])
}, 880343, e => {
    "use strict";
    var a = e.i(197649),
        t = e.i(416340);
    let r = {
            XSmall: "size-[var(--icon-size-xsmall)]",
            Small: "size-[var(--icon-size-small)]",
            Medium: "size-[var(--icon-size-medium)]",
            Large: "size-[var(--icon-size-large)]",
            XLarge: "size-[var(--icon-size-xlarge)]",
            XXLarge: "size-[var(--icon-size-xxlarge)]"
        },
        o = t.default.forwardRef((e, o) => {
            let {
                name: n,
                size: s = "Medium",
                className: c,
                children: i,
                ...l
            } = e;
            return t.default.createElement("span", {
                ref: o,
                "aria-hidden": !0,
                "data-testid": "foundation-web-icon",
                className: (0, a.default)("grow-0 shrink-0 basis-auto icon", n, r[s], c),
                ...l
            })
        });
    o.displayName = "Icon", e.s(["Icon", 0, o])
}, 301040, e => {
    "use strict";
    var a = e.i(416340);
    e.s(["LoadingSpinner", 0, e => {
        let {
            width: t,
            height: r
        } = e;
        return a.default.createElement("svg", {
            className: "foundation-web-loading-spinner",
            width: t,
            height: r,
            viewBox: "0 0 20 20",
            fill: "none",
            xmlns: "http://www.w3.org/2000/svg"
        }, a.default.createElement("path", {
            fillRule: "evenodd",
            clipRule: "evenodd",
            fill: "currentColor",
            d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
        }))
    }])
}, 737586, e => {
    "use strict";
    var a = e.i(197649),
        t = e.i(416340);
    e.s(["StateLayer", 0, e => {
        let {
            className: r
        } = e;
        return t.default.createElement("div", {
            "aria-hidden": !0,
            "data-testid": "foundation-web-state-layer",
            className: (0, a.default)("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", r)
        })
    }, "interactable", 0, "relative clip group/interactable focus-visible:outline-focus disabled:outline-none"])
}, 999544, e => {
    "use strict";
    e.s(["disabledOpacity", 0, "opacity-[0.5]"])
}]);

//# debugId=3b2b397e-15de-c7cc-27e1-c5745ce7dcea
//# sourceMappingURL=3kuhj7rkljmub.js.map