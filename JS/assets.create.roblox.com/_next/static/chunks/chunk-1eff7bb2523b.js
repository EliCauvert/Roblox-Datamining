;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "f0057bc8-f33d-958f-533d-6315462479dd")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 730530, e => {
    "use strict";
    let a = e => e;
    e.s(["brandPretranslatedText", 0, e => a(e), "brandUntranslatableText", 0, a, "translateHTMLFn", 0, e => {
        let {
            translateHTML: a
        } = e;
        return (e, t, l) => {
            let {
                key: s
            } = e;
            return a(s, t, l)
        }
    }, "translationFn", 0, e => {
        let {
            translate: a
        } = e;
        return (e, t) => {
            let {
                key: l
            } = e;
            return a(l, t)
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
        constructor(t, l = "") {
            super("Generic BEDEV1 Error"), (0, a._)(this, "code", void 0), (0, a._)(this, "message", void 0), this.code = t, this.message = l, Error.captureStackTrace && Error.captureStackTrace(this, e)
        }
    }])
}, 185915, e => {
    "use strict";
    e.s(["default", 0, function(e) {
        return e && "object" == typeof e && "response" in e ? e.response : e && "object" == typeof e && "json" in e ? e : null
    }])
}, 533968, e => {
    "use strict";
    var a = e.i(185915);
    e.s(["getResponseFromError", () => a.default])
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
        l = e.i(251622),
        s = e.i(260022);
    let r = "".concat((0, s.getProductionCreatorHubUrl)("global"), "/docs/reference/engine/classes/Player#GetJoinData"),
        o = (0, s.resolveUrl)("developerArticleProductsInGamePurchasesUrl", "production", "global"),
        d = (0, s.resolveUrl)("developerArticleBadgesSpecialGameAwardsUrl", "production", "global"),
        n = "".concat((0, s.getProductionCreatorHubUrl)("global"), "/docs/production/monetization/game-passes"),
        i = (0, s.resolveUrl)("developerArticleCreateVipServerUrl", "production", "global"),
        u = "".concat((0, s.getProductionCreatorHubUrl)("global"), "/docs/production/publishing/publish-experiences-and-places#release-to-the-public"),
        c = "".concat((0, s.getProductionCreatorHubUrl)("global"), "/docs/projects/assets/privacy"),
        f = "".concat((0, s.getProductionCreatorHubUrl)("global"), "/docs/parts/models#distribute-models"),
        m = "".concat((0, s.getProductionCreatorHubUrl)("global"), "/docs/art/marketplace/publishing-to-marketplace#sale-location"),
        b = "".concat((0, s.getProductionCreatorHubUrl)("global"), "/docs/production/monetization/subscriptions#creating-subscriptions"),
        A = "".concat((0, s.getProductionCreatorHubUrl)("global"), "/docs/production/game-design/subscription-design#bundles"),
        g = "".concat((0, s.getProductionCreatorHubUrl)("global"), "/docs/production/monetization/subscriptions#earning-with-subscriptions"),
        p = (0, s.resolveUrl)("robloxCommunityStandardsUrl", "production", "global"),
        y = "".concat((0, s.getProductionCreatorHubUrl)("global"), "/docs/art/marketplace/marketplace-policy#ugc-program-guidelines"),
        L = "".concat((0, s.getProductionCreatorHubUrl)("global"), "/docs/art/marketplace/marketplace-fees-and-commissions#publishing-advance"),
        v = "".concat((0, s.getProductionCreatorHubUrl)("global"), "/docs/production/publishing/account-verification");
    (0, s.getProductionCreatorHubUrl)("global"), (0, s.getProductionCreatorHubUrl)("global");
    let E = (0, s.resolveUrl)("ugcSubscriptionTermsOfUseUrl", "production", "global"),
        h = (0, s.resolveUrl)("robloxTermsOfUseUrl", "production", "global"),
        P = (0, s.resolveUrl)("advertisingStandardsUrl", "production", "global"),
        T = "".concat((0, s.getProductionCreatorHubUrl)("global"), "/docs/production/publishing/account-verification"),
        S = "".concat((0, s.getProductionCreatorHubUrl)("global"), "/docs/production/monetization/avatar-creation-token");
    e.s(["ACCOUNT_VERIFICATION_URL", 0, T, "ASSET_ACCESS_PRIVACY", 0, c, "BADGE_LEARN_MORE_URL", 0, d, "CREATOR_STORE_VERIFICATION_URL", 0, v, "DEVELOPER_PRODUCT_LEARN_MORE_URL", 0, o, "DISTRIBUTE_MODELS", 0, f, "LAUNCH_DATA_LEARN_MORE_URL", 0, r, "MARKETPLACE_POLICY", 0, y, "MOMENTS_LEARN_MORE_URL", 0, "https://about.roblox.com/newsroom/2025/09/roblox-moments-user-generated-discovery", "PASS_LEARN_MORE_URL", 0, n, "PRIVATE_SERVER_LEARN_MORE_URL", 0, i, "PUBLISHING_ADVANCE", 0, L, "RELEASE_EXPERIENCE_TO_PUBLIC_URL", 0, u, "ROBLOX_ADVERTISING_STANDARDS", 0, P, "ROBLOX_COMMUNITY_STANDARDS", 0, p, "ROBLOX_TERMS_OF_USE", 0, h, "SALE_LOCATION_LEARN_MORE_URL", 0, m, "SUBSCRIPTION_LEARN_MORE_PRICING_URL", 0, g, "SUBSCRIPTION_LEARN_MORE_PRODUCT_TYPES_URL", 0, A, "SUBSCRIPTION_LEARN_MORE_URL", 0, b, "SUBSCRIPTION_TERMS_OF_USE", 0, E, "TOKEN_LEARN_MORE_URL", 0, S], 253536);
    let C = {
            [t.default.Place]: l.default.Game,
            [t.default.SharedExperiences]: l.default.Game,
            [t.default.MyExperiences]: l.default.Game,
            [t.default.ShareLink]: l.default.Game,
            [t.default.Moments]: l.default.Game,
            [t.default.TShirt]: l.default.CatalogAsset,
            [t.default.Shirt]: l.default.CatalogAsset,
            [t.default.Pants]: l.default.CatalogAsset,
            [t.default.Hat]: l.default.CatalogAsset,
            [t.default.HairAccessory]: l.default.CatalogAsset,
            [t.default.FaceAccessory]: l.default.CatalogAsset,
            [t.default.NeckAccessory]: l.default.CatalogAsset,
            [t.default.ShoulderAccessory]: l.default.CatalogAsset,
            [t.default.FrontAccessory]: l.default.CatalogAsset,
            [t.default.BackAccessory]: l.default.CatalogAsset,
            [t.default.WaistAccessory]: l.default.CatalogAsset,
            [t.default.TShirtAccessory]: l.default.CatalogAsset,
            [t.default.ShirtAccessory]: l.default.CatalogAsset,
            [t.default.PantsAccessory]: l.default.CatalogAsset,
            [t.default.JacketAccessory]: l.default.CatalogAsset,
            [t.default.SweaterAccessory]: l.default.CatalogAsset,
            [t.default.ShortsAccessory]: l.default.CatalogAsset,
            [t.default.DressSkirtAccessory]: l.default.CatalogAsset,
            [t.default.EmoteAnimation]: l.default.CatalogAsset,
            [t.default.EyebrowAccessory]: l.default.CatalogAsset,
            [t.default.EyelashAccessory]: l.default.CatalogAsset,
            [t.default.FaceMakeup]: l.default.CatalogAsset,
            [t.default.LipMakeup]: l.default.CatalogAsset,
            [t.default.EyeMakeup]: l.default.CatalogAsset,
            [t.default.AvatarBackground]: l.default.CatalogAsset,
            [t.default.AvatarLooks]: l.default.CatalogAsset,
            [t.default.Showcase]: l.default.CatalogAsset,
            [t.default.AllCatalogAsset]: l.default.CatalogAsset,
            [t.default.Decal]: l.default.LibraryAsset,
            [t.default.Image]: l.default.LibraryAsset,
            [t.default.Audio]: l.default.LibraryAsset,
            [t.default.Model]: l.default.LibraryAsset,
            [t.default.Mesh]: l.default.LibraryAsset,
            [t.default.MeshPart]: l.default.LibraryAsset,
            [t.default.Plugin]: l.default.LibraryAsset,
            [t.default.Animation]: l.default.LibraryAsset,
            [t.default.FontFamily]: l.default.LibraryAsset,
            [t.default.Video]: l.default.LibraryAsset,
            [t.default.Event]: l.default.Event,
            [t.default.PastEvent]: l.default.Event,
            [t.default.DraftEvent]: l.default.Event,
            [t.default.UpcomingEvent]: l.default.Event,
            [t.default.StorePreviewVideo]: l.default.LibraryAsset,
            [t.default.GamePreviewVideo]: l.default.LibraryAsset,
            [t.default.TextDocument]: l.default.LibraryAsset,
            [t.default.AssetPermissionRequests]: l.default.Game
        },
        R = {
            [l.default.Game]: "experiences",
            [l.default.CatalogAsset]: "catalog",
            [l.default.LibraryAsset]: "library",
            [l.default.Bundle]: "bundle",
            [l.default.Badge]: "badges",
            [l.default.GamePass]: "passes",
            [l.default.DeveloperProduct]: "developer-products",
            [l.default.TranslatorGame]: "experiences",
            [l.default.Places]: "places",
            [l.default.CreatedPlaces]: "places",
            [l.default.Event]: "events",
            [l.default.Notifications]: "notifications",
            [l.default.ExperienceSubscription]: "experience-subscriptions",
            [l.default.Advanced]: "advanced",
            [l.default.AvatarCreationToken]: "avatar-creation-tokens",
            [l.default.ReferralRewards]: "referral-reward-details",
            [l.default.Environment]: "environments",
            [l.default.Look]: "look",
            [l.default.Alert]: "alerts",
            [l.default.Journey]: "analytics/journeys"
        },
        k = {
            [l.default.Game]: a.ThumbnailTypes.gameIcon,
            [l.default.CatalogAsset]: a.ThumbnailTypes.assetThumbnail,
            [l.default.LibraryAsset]: a.ThumbnailTypes.assetThumbnail,
            [l.default.Bundle]: a.ThumbnailTypes.bundleThumbnail,
            [l.default.Badge]: a.ThumbnailTypes.badgeIcon,
            [l.default.GamePass]: a.ThumbnailTypes.gamePassIcon,
            [l.default.DeveloperProduct]: a.ThumbnailTypes.developerProductIcon,
            [l.default.TranslatorGame]: a.ThumbnailTypes.gameIcon,
            [l.default.Places]: a.ThumbnailTypes.placeIcon,
            [l.default.CreatedPlaces]: a.ThumbnailTypes.placeIcon,
            [l.default.Event]: a.ThumbnailTypes.universeThumbnail,
            [l.default.Notifications]: a.ThumbnailTypes.assetThumbnail,
            [l.default.ExperienceSubscription]: a.ThumbnailTypes.assetThumbnail,
            [l.default.Advanced]: a.ThumbnailTypes.assetThumbnail,
            [l.default.AvatarCreationToken]: a.ThumbnailTypes.bundleThumbnail,
            [l.default.ReferralRewards]: a.ThumbnailTypes.assetThumbnail,
            [l.default.Environment]: a.ThumbnailTypes.universeThumbnail,
            [l.default.Alert]: a.ThumbnailTypes.universeThumbnail,
            [l.default.Journey]: a.ThumbnailTypes.universeThumbnail,
            [l.default.Look]: a.ThumbnailTypes.assetThumbnail
        },
        M = {
            [l.default.Game]: a.ReturnPolicy.AutoGenerated,
            [l.default.Bundle]: a.ReturnPolicy.AutoGenerated,
            [l.default.CatalogAsset]: a.ReturnPolicy.PlaceHolder,
            [l.default.LibraryAsset]: a.ReturnPolicy.AutoGenerated,
            [l.default.Badge]: a.ReturnPolicy.AutoGenerated,
            [l.default.GamePass]: a.ReturnPolicy.AutoGenerated,
            [l.default.DeveloperProduct]: a.ReturnPolicy.AutoGenerated,
            [l.default.TranslatorGame]: a.ReturnPolicy.PlaceHolder,
            [l.default.Places]: a.ReturnPolicy.AutoGenerated,
            [l.default.CreatedPlaces]: a.ReturnPolicy.AutoGenerated,
            [l.default.Event]: a.ReturnPolicy.PlaceHolder,
            [l.default.Notifications]: a.ReturnPolicy.AutoGenerated,
            [l.default.ExperienceSubscription]: a.ReturnPolicy.AutoGenerated,
            [l.default.Advanced]: a.ReturnPolicy.AutoGenerated,
            [l.default.AvatarCreationToken]: a.ReturnPolicy.AutoGenerated,
            [l.default.ReferralRewards]: a.ReturnPolicy.AutoGenerated,
            [l.default.Environment]: a.ReturnPolicy.AutoGenerated,
            [l.default.Look]: a.ReturnPolicy.AutoGenerated,
            [l.default.Alert]: a.ReturnPolicy.AutoGenerated,
            [l.default.Journey]: a.ReturnPolicy.AutoGenerated
        },
        G = {
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
        D = {
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
        N = {
            [l.default.Game]: "Label.Games",
            [l.default.CatalogAsset]: "Label.AvatarItems",
            [l.default.Bundle]: "Label.AvatarItem",
            [l.default.LibraryAsset]: "Label.DevelopmentItems",
            [l.default.Badge]: "Label.Badges",
            [l.default.GamePass]: "Label.GamePasses",
            [l.default.DeveloperProduct]: "Label.DeveloperProducts",
            [l.default.TranslatorGame]: "Label.TranslatorGame",
            [l.default.Places]: "Label.Places",
            [l.default.CreatedPlaces]: "Label.Places",
            [l.default.Event]: "Label.Events",
            [l.default.Notifications]: "Label.Notifications",
            [l.default.ExperienceSubscription]: "Label.Subscriptions",
            [l.default.Advanced]: "Header.Title",
            [l.default.AvatarCreationToken]: "Label.AvatarCreationTokens",
            [l.default.ReferralRewards]: "Label.ReferralRewards",
            [l.default.Environment]: "Label.Environments",
            [l.default.Look]: "Label.Looks",
            [l.default.Alert]: "Heading.Alerts",
            [l.default.Journey]: "Heading.Journeys"
        },
        U = {
            [l.default.Game]: "Label.Game",
            [l.default.CatalogAsset]: "Label.AvatarItem",
            [l.default.Bundle]: "Label.AvatarItem",
            [l.default.LibraryAsset]: "Label.DevelopmentItem",
            [l.default.Badge]: "Label.Badge",
            [l.default.GamePass]: "Label.GamePass",
            [l.default.DeveloperProduct]: "Label.DeveloperProduct",
            [l.default.TranslatorGame]: "Label.TranslatorGame",
            [l.default.Places]: "Label.Place",
            [l.default.CreatedPlaces]: "Label.Places",
            [l.default.Event]: "Label.Event",
            [l.default.Notifications]: "Label.Notifications",
            [l.default.ExperienceSubscription]: "Label.Subscription",
            [l.default.Advanced]: "Header.Title",
            [l.default.AvatarCreationToken]: "Label.Token",
            [l.default.ReferralRewards]: "Label.ReferralRewards",
            [l.default.Environment]: "Label.Environment",
            [l.default.Look]: "Label.Looks",
            [l.default.Alert]: "Heading.Alert",
            [l.default.Journey]: "Heading.Journey"
        },
        w = {
            [l.default.Game]: "Heading.Game",
            [l.default.CatalogAsset]: "Heading.AvatarItem",
            [l.default.Bundle]: "Heading.AvatarItem",
            [l.default.LibraryAsset]: "Heading.DevelopmentItem",
            [l.default.Badge]: "Heading.Badge",
            [l.default.GamePass]: "Heading.Pass",
            [l.default.DeveloperProduct]: "Heading.DeveloperProduct",
            [l.default.TranslatorGame]: "Heading.TranslatorGame",
            [l.default.Places]: "Heading.Place",
            [l.default.CreatedPlaces]: "Heading.Place",
            [l.default.Event]: "Heading.Event",
            [l.default.Notifications]: "Heading.Notifications.CreateContent",
            [l.default.ExperienceSubscription]: "Heading.Subscription",
            [l.default.Advanced]: "Header.Title",
            [l.default.AvatarCreationToken]: "Label.AvatarCreationToken",
            [l.default.ReferralRewards]: "Heading.ReferralRewards",
            [l.default.Environment]: "Heading.Environment",
            [l.default.Look]: "Heading.Looks",
            [l.default.Alert]: "Heading.Alert",
            [l.default.Journey]: "Heading.Journey"
        },
        x = {
            [l.default.Game]: null,
            [l.default.CatalogAsset]: null,
            [l.default.Bundle]: null,
            [l.default.LibraryAsset]: null,
            [l.default.Badge]: "badges/create",
            [l.default.GamePass]: "passes/create",
            [l.default.DeveloperProduct]: "developer-products/create",
            [l.default.ReferralRewards]: "referral-reward-details/create",
            [l.default.TranslatorGame]: null,
            [l.default.Places]: null,
            [l.default.CreatedPlaces]: null,
            [l.default.Event]: "events/create",
            [l.default.Notifications]: null,
            [l.default.ExperienceSubscription]: "experience-subscriptions/create",
            [l.default.Advanced]: null,
            [l.default.AvatarCreationToken]: "avatar-creation-tokens/create",
            [l.default.Environment]: "environments/create",
            [l.default.Look]: "looks/create",
            [l.default.Alert]: "alerts/create",
            [l.default.Journey]: "analytics/journeys/create"
        },
        _ = {
            [l.default.Game]: null,
            [l.default.CatalogAsset]: null,
            [l.default.Bundle]: null,
            [l.default.LibraryAsset]: null,
            [l.default.Badge]: "badges/reorder",
            [l.default.ReferralRewards]: null,
            [l.default.GamePass]: null,
            [l.default.DeveloperProduct]: null,
            [l.default.TranslatorGame]: null,
            [l.default.Places]: null,
            [l.default.CreatedPlaces]: null,
            [l.default.Event]: null,
            [l.default.Notifications]: null,
            [l.default.ExperienceSubscription]: null,
            [l.default.Advanced]: null,
            [l.default.AvatarCreationToken]: null,
            [l.default.Environment]: null,
            [l.default.Look]: null,
            [l.default.Alert]: null,
            [l.default.Journey]: null
        },
        H = {
            [l.default.Badge]: d,
            [l.default.DeveloperProduct]: o,
            [l.default.GamePass]: n,
            [l.default.CatalogAsset]: m,
            [l.default.ExperienceSubscription]: b,
            [l.default.AvatarCreationToken]: S,
            [l.default.Look]: void 0
        };
    e.s(["AllSettlePromiseFailed", 0, "rejected", "AllSettlePromiseSuccess", 0, "fulfilled", "assetFullNameKeys", 0, G, "assetTypeToItemType", 0, C, "assetTypeToSingularNameKeys", 0, D, "itemFullNameKeys", 0, N, "itemTypeToCreatePath", 0, x, "itemTypeToLearnMoreUrl", 0, H, "itemTypeToNameKeys", 0, U, "itemTypeToPath", 0, R, "itemTypeToReorderPath", 0, _, "itemTypeToReturnPolicyType", 0, M, "itemTypeToSingularNameKeys", 0, w, "itemTypeToThumbnailType", 0, k, "toastDurationTime", 0, 3e3, "uninitializedUniverseId", 0, -1], 759283)
}, 307529, e => {
    "use strict";
    var a, t = ((a = t || {}).Place = "Place", a.MyExperiences = "MyExperiences", a.SharedExperiences = "SharedExperiences", a.TShirt = "TShirt", a.Shirt = "Shirt", a.Pants = "Pants", a.Hat = "Hat", a.HairAccessory = "HairAccessory", a.FaceAccessory = "FaceAccessory", a.NeckAccessory = "NeckAccessory", a.ShoulderAccessory = "ShoulderAccessory", a.FrontAccessory = "FrontAccessory", a.BackAccessory = "BackAccessory", a.WaistAccessory = "WaistAccessory", a.TShirtAccessory = "TShirtAccessory", a.ShirtAccessory = "ShirtAccessory", a.PantsAccessory = "PantsAccessory", a.JacketAccessory = "JacketAccessory", a.SweaterAccessory = "SweaterAccessory", a.ShortsAccessory = "ShortsAccessory", a.DressSkirtAccessory = "DressSkirtAccessory", a.EyebrowAccessory = "EyebrowAccessory", a.EyelashAccessory = "EyelashAccessory", a.FaceMakeup = "FaceMakeup", a.LipMakeup = "LipMakeup", a.EyeMakeup = "EyeMakeup", a.AvatarBackground = "AvatarBackground", a.AvatarLooks = "AvatarLooks", a.Showcase = "Showcase", a.Decal = "Decal", a.Image = "Image", a.Audio = "Audio", a.Model = "Model", a.Mesh = "Mesh", a.MeshPart = "MeshPart", a.Plugin = "Plugin", a.EmoteAnimation = "EmoteAnimation", a.Animation = "Animation", a.Video = "Video", a.TextDocument = "TextDocument", a.Event = "Event", a.UpcomingEvent = "UpcomingEvent", a.DraftEvent = "DraftEvent", a.PastEvent = "PastEvent", a.FontFamily = "FontFamily", a.ShareLink = "ShareLink", a.Moments = "Moments", a.StorePreviewVideo = "StorePreviewVideo", a.GamePreviewVideo = "GamePreviewVideo", a.AllCatalogAsset = "All", a.AssetPermissionRequests = "AssetPermissionRequests", a);
    e.s(["default", 0, t])
}, 17829, e => {
    "use strict";
    var a, t = ((a = t || {}).User = "User", a.Group = "Group", a);
    e.s(["default", 0, t])
}, 251622, e => {
    "use strict";
    var a, t = ((a = t || {}).Game = "Game", a.Bundle = "Bundle", a.CatalogAsset = "CatalogAsset", a.LibraryAsset = "LibraryAsset", a.GamePass = "Pass", a.Badge = "Badge", a.DeveloperProduct = "DeveloperProduct", a.TranslatorGame = "TranslatorGame", a.Places = "Places", a.CreatedPlaces = "CreatedPlaces", a.Event = "Event", a.Notifications = "Notifications", a.ExperienceSubscription = "Subscription", a.Advanced = "Advanced", a.AvatarCreationToken = "AvatarCreationToken", a.ReferralRewards = "ReferralRewards", a.Environment = "Environment", a.Look = "Look", a.Alert = "Alert", a.Journey = "Journey", a);
    let l = Object.values(t);
    e.s(["default", 0, t, "isItem", 0, e => l.includes(e)])
}, 968892, e => {
    "use strict";
    var a = e.i(737586),
        t = e.i(999544),
        l = e.i(301040),
        s = e.i(880343),
        r = e.i(197649),
        o = e.i(416340),
        d = e.i(23342);
    let n = {
            Large: 24,
            Medium: 20,
            Small: 16,
            XSmall: 12
        },
        i = {
            Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
            Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
            Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
            XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
        },
        u = {
            Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
            Standard: ["bg-action-standard", "content-action-standard"],
            SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
            Utility: ["bg-action-subtle", "content-action-standard"],
            Link: ["bg-action-link", "content-system-emphasis"],
            Alert: ["bg-action-alert", "content-action-alert"],
            ActionUtility: ["bg-action-subtle", "content-action-standard"]
        },
        c = {
            Emphasis: ["bg-action-standard", "content-action-standard"],
            Standard: ["bg-action-standard", "content-action-standard"],
            SoftEmphasis: ["bg-action-standard", "content-action-standard"],
            Utility: ["bg-action-subtle", "content-action-standard"],
            Link: ["bg-action-link", "content-system-emphasis"],
            Alert: ["bg-action-standard", "content-action-standard"],
            ActionUtility: ["bg-action-subtle", "content-action-standard"]
        },
        f = (0, o.forwardRef)((e, f) => {
            let {
                children: m,
                className: b,
                style: A,
                isDisabled: g = !1,
                isLoading: p = !1,
                icon: y,
                size: L = "Large",
                variant: v = "Emphasis",
                asChild: E,
                ...h
            } = e, P = (0, r.default)("foundation-web-button", g ? t.disabledOpacity : [a.interactable, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", i[L], g ? c[v] : u[v], b), T = {
                textDecoration: "none",
                ...A
            }, S = e => o.default.createElement(o.default.Fragment, null, o.default.createElement(a.StateLayer, null), p && o.default.createElement("div", {
                "aria-hidden": "true",
                className: "absolute flex"
            }, o.default.createElement(l.LoadingSpinner, {
                width: n[L],
                height: n[L]
            })), o.default.createElement("span", {
                className: (0, r.default)("flex items-center min-width-0", "Large" === L || "Medium" === L ? "gap-small" : "gap-xsmall", p && "invisible")
            }, y && o.default.createElement(s.Icon, {
                name: y,
                size: L
            }), o.default.createElement("span", {
                className: "padding-y-xsmall text-truncate-end text-no-wrap"
            }, e)));
            if (E) {
                let {
                    as: e,
                    ...a
                } = h, t = o.default.Children.only(m);
                return o.default.createElement(d.Slot, {
                    ref: f,
                    ...a,
                    className: P,
                    style: T,
                    "aria-disabled": g || void 0
                }, o.default.cloneElement(t, {}, S(t.props.children)))
            }
            if ("a" === h.as) {
                let {
                    as: e,
                    href: a,
                    ...t
                } = h;
                return o.default.createElement("a", {
                    ref: f,
                    ...t,
                    "aria-disabled": g,
                    href: g ? void 0 : a,
                    className: P,
                    style: T
                }, S(m))
            }
            let {
                as: C,
                ...R
            } = h;
            return o.default.createElement("button", {
                ref: f,
                type: "button",
                ...R,
                disabled: g,
                className: P,
                style: T
            }, S(m))
        });
    e.s(["Button", 0, f])
}, 973047, e => {
    "use strict";
    var a = e.i(247268),
        t = e.i(197649),
        l = e.i(416340),
        s = e.i(425353),
        r = e.i(199512);
    let o = (0, l.createContext)({
            size: "Medium",
            isModal: !0,
            hasCloseAffordance: !1,
            hasMarginTop: !0,
            hasMarginBottom: !0,
            hasDescription: !1,
            type: "Default"
        }),
        d = () => {
            let e = (0, l.useContext)(o);
            if (!e) throw Error("Dialog components must be used within a Dialog");
            return e
        },
        n = {
            Small: "padding-x-large",
            Medium: "padding-x-xlarge",
            Large: "padding-x-xlarge"
        },
        i = {
            Small: "padding-top-large",
            Medium: "padding-top-xlarge",
            Large: "padding-top-xlarge"
        },
        u = {
            Small: "padding-bottom-large",
            Medium: "padding-bottom-xlarge",
            Large: "padding-bottom-xlarge"
        },
        c = e => {
            let {
                open: a,
                onOpenChange: t,
                children: r,
                size: d,
                type: n = "Default",
                isModal: i,
                hasCloseAffordance: u,
                closeLabel: c,
                hasMarginTop: f = !0,
                hasMarginBottom: m = !0,
                hasDescription: b = !1,
                experimentalDisablePointerEventsStylingOnBody: A = !1
            } = e, g = (0, l.useMemo)(() => ({
                size: d,
                isModal: i,
                type: n,
                hasCloseAffordance: u,
                closeLabel: c,
                hasMarginTop: f,
                hasMarginBottom: m,
                hasDescription: b
            }), [d, i, n, u, c, f, m, b]);
            return (0, l.useEffect)(() => {
                A && setTimeout(() => {
                    Object.assign(document.body.style, {
                        pointerEvents: "unset"
                    })
                }, 0)
            }, [A, a]), l.default.createElement(o.Provider, {
                value: g
            }, l.default.createElement(s.Root, {
                open: a,
                onOpenChange: t
            }, r))
        };
    c.displayName = "Dialog";
    let f = e => {
        let {
            children: r,
            className: o,
            style: n,
            overlayClassName: i,
            overlayStyle: u,
            onOpenAutoFocus: c,
            ...f
        } = e, {
            size: m,
            isModal: b,
            hasCloseAffordance: A,
            closeLabel: g,
            hasDescription: p
        } = d(), y = (0, t.default)("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", b && "bg-common-backdrop", i), L = (0, t.default)("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", o);
        return l.default.createElement(s.Portal, null, l.default.createElement(s.Overlay, {
            className: y,
            style: u
        }, l.default.createElement(s.Content, {
            className: L,
            "data-size": m,
            style: n,
            onOpenAutoFocus: c,
            ...!p && {
                "aria-describedby": void 0
            },
            ...f
        }, A && l.default.createElement("div", {
            className: "absolute foundation-web-dialog-close-container"
        }, l.default.createElement(s.Close, {
            asChild: !0
        }, l.default.createElement(a.CloseAffordance, {
            variant: "OverMedia",
            size: m,
            isCircular: !0,
            "aria-label": g
        }))), r)))
    };
    f.displayName = "DialogContent";
    let m = e => {
        let {
            children: a,
            className: s,
            ...r
        } = e;
        return l.default.createElement("div", {
            className: (0, t.default)("foundation-web-dialog-hero-media", s),
            ...r
        }, a)
    };
    m.displayName = "DialogHeroMedia";
    let b = e => {
        let {
            children: a,
            className: s,
            ...r
        } = e, {
            size: o,
            hasMarginTop: c,
            hasMarginBottom: f
        } = d(), m = (0, t.default)(n[o], c && i[o], f && u[o], s);
        return l.default.createElement("div", {
            className: m,
            ...r
        }, a)
    };
    b.displayName = "DialogBody";
    let A = e => {
        let {
            children: a,
            className: t,
            hidden: o,
            ...d
        } = e, n = l.default.createElement(s.Title, {
            className: t,
            ...d
        }, a);
        return o ? l.default.createElement(r.VisuallyHidden, null, n) : n
    };
    A.displayName = "DialogTitle";
    let g = e => {
        let {
            children: a,
            className: s,
            ...r
        } = e, {
            size: o
        } = d(), i = (0, t.default)(n[o], u[o], s);
        return l.default.createElement("div", {
            className: i,
            ...r
        }, a)
    };
    g.displayName = "DialogFooter", e.s(["Dialog", 0, c, "DialogBody", 0, b, "DialogContent", 0, f, "DialogFooter", 0, g, "DialogHeroMedia", 0, m, "DialogTitle", 0, A])
}, 880343, e => {
    "use strict";
    var a = e.i(197649),
        t = e.i(416340);
    let l = {
            XSmall: "size-[var(--icon-size-xsmall)]",
            Small: "size-[var(--icon-size-small)]",
            Medium: "size-[var(--icon-size-medium)]",
            Large: "size-[var(--icon-size-large)]",
            XLarge: "size-[var(--icon-size-xlarge)]",
            XXLarge: "size-[var(--icon-size-xxlarge)]"
        },
        s = t.default.forwardRef((e, s) => {
            let {
                name: r,
                size: o = "Medium",
                className: d,
                children: n,
                ...i
            } = e;
            return t.default.createElement("span", {
                ref: s,
                "aria-hidden": !0,
                "data-testid": "foundation-web-icon",
                className: (0, a.default)("grow-0 shrink-0 basis-auto icon", r, l[o], d),
                ...i
            })
        });
    s.displayName = "Icon", e.s(["Icon", 0, s])
}, 247268, e => {
    "use strict";
    var a = e.i(737586),
        t = e.i(880343),
        l = e.i(197649),
        s = e.i(416340);
    let r = {
            Small: "padding-xsmall",
            Medium: "padding-small",
            Large: "padding-small"
        },
        o = {
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-100"
        };
    e.s(["CloseAffordance", 0, e => {
        let {
            variant: d,
            size: n,
            isCircular: i,
            className: u,
            ...c
        } = e;
        return s.default.createElement("button", {
            type: "button",
            className: (0, l.default)("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", a.interactable, o[d], r[n], i && "radius-circle", u),
            ...c
        }, s.default.createElement(a.StateLayer, null), s.default.createElement(t.Icon, {
            name: "icon-regular-x",
            size: n
        }))
    }])
}, 301040, e => {
    "use strict";
    var a = e.i(416340);
    e.s(["LoadingSpinner", 0, e => {
        let {
            width: t,
            height: l
        } = e;
        return a.default.createElement("svg", {
            className: "foundation-web-loading-spinner",
            width: t,
            height: l,
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
            className: l
        } = e;
        return t.default.createElement("div", {
            "aria-hidden": !0,
            "data-testid": "foundation-web-state-layer",
            className: (0, a.default)("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", l)
        })
    }, "interactable", 0, "relative clip group/interactable focus-visible:outline-focus disabled:outline-none"])
}, 999544, e => {
    "use strict";
    e.s(["disabledOpacity", 0, "opacity-[0.5]"])
}]);

//# debugId=f0057bc8-f33d-958f-533d-6315462479dd
//# sourceMappingURL=12atgxcgebhei.js.map