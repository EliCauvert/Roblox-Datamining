;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "eb8bdf73-1ac6-7c78-c0ee-3e8582bb4d68")
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
    var a = e.i(540513),
        t = e.i(307529),
        r = e.i(251622),
        o = e.i(260022);
    (0, o.getProductionCreatorHubUrl)("global");
    let n = "".concat((0, o.getProductionCreatorHubUrl)("global"), "/docs/reference/engine/classes/Player#GetJoinData"),
        s = (0, o.resolveUrl)("developerArticleProductsInGamePurchasesUrl", "production", "global"),
        c = (0, o.resolveUrl)("developerArticleBadgesSpecialGameAwardsUrl", "production", "global"),
        i = "".concat((0, o.getProductionCreatorHubUrl)("global"), "/docs/production/monetization/game-passes"),
        l = (0, o.resolveUrl)("developerArticleCreateVipServerUrl", "production", "global"),
        d = "".concat((0, o.getProductionCreatorHubUrl)("global"), "/docs/production/publishing/publish-experiences-and-places#release-to-the-public");
    (0, o.getProductionCreatorHubUrl)("global");
    let u = "".concat((0, o.getProductionCreatorHubUrl)("global"), "/docs/projects/assets/privacy"),
        g = "".concat((0, o.getProductionCreatorHubUrl)("global"), "/docs/parts/models#distribute-models"),
        p = "".concat((0, o.getProductionCreatorHubUrl)("global"), "/docs/art/marketplace/publishing-to-marketplace#sale-location");
    (0, o.getProductionCreatorHubUrl)("global");
    let f = "".concat((0, o.getProductionCreatorHubUrl)("global"), "/docs/production/monetization/subscriptions#creating-subscriptions"),
        b = "".concat((0, o.getProductionCreatorHubUrl)("global"), "/docs/production/game-design/subscription-design#bundles"),
        m = "".concat((0, o.getProductionCreatorHubUrl)("global"), "/docs/production/monetization/subscriptions#earning-with-subscriptions"),
        A = (0, o.resolveUrl)("robloxCommunityStandardsUrl", "production", "global"),
        y = "".concat((0, o.getProductionCreatorHubUrl)("global"), "/docs/art/marketplace/marketplace-policy#ugc-program-guidelines"),
        h = "".concat((0, o.getProductionCreatorHubUrl)("global"), "/docs/art/marketplace/marketplace-fees-and-commissions#publishing-advance");
    (0, o.getProductionCreatorHubUrl)("global"), (0, o.getProductionCreatorHubUrl)("global");
    let v = "".concat((0, o.getProductionCreatorHubUrl)("global"), "/docs/production/publishing/account-verification");
    (0, o.getProductionCreatorHubUrl)("global"), (0, o.getProductionCreatorHubUrl)("global");
    let U = (0, o.resolveUrl)("ugcSubscriptionTermsOfUseUrl", "production", "global"),
        P = (0, o.resolveUrl)("robloxTermsOfUseUrl", "production", "global"),
        L = (0, o.resolveUrl)("advertisingStandardsUrl", "production", "global"),
        E = "".concat((0, o.getProductionCreatorHubUrl)("global"), "/docs/production/publishing/account-verification"),
        C = "".concat((0, o.getProductionCreatorHubUrl)("global"), "/docs/production/monetization/avatar-creation-token");
    e.s(["ACCOUNT_VERIFICATION_URL", 0, E, "ASSET_ACCESS_PRIVACY", 0, u, "BADGE_LEARN_MORE_URL", 0, c, "CREATOR_STORE_VERIFICATION_URL", 0, v, "DEVELOPER_PRODUCT_LEARN_MORE_URL", 0, s, "DISTRIBUTE_MODELS", 0, g, "LAUNCH_DATA_LEARN_MORE_URL", 0, n, "MARKETPLACE_POLICY", 0, y, "MOMENTS_LEARN_MORE_URL", 0, "https://about.roblox.com/newsroom/2025/09/roblox-moments-user-generated-discovery", "PASS_LEARN_MORE_URL", 0, i, "PRIVATE_SERVER_LEARN_MORE_URL", 0, l, "PUBLISHING_ADVANCE", 0, h, "RELEASE_EXPERIENCE_TO_PUBLIC_URL", 0, d, "ROBLOX_ADVERTISING_STANDARDS", 0, L, "ROBLOX_COMMUNITY_STANDARDS", 0, A, "ROBLOX_TERMS_OF_USE", 0, P, "SALE_LOCATION_LEARN_MORE_URL", 0, p, "SUBSCRIPTION_LEARN_MORE_PRICING_URL", 0, m, "SUBSCRIPTION_LEARN_MORE_PRODUCT_TYPES_URL", 0, b, "SUBSCRIPTION_LEARN_MORE_URL", 0, f, "SUBSCRIPTION_TERMS_OF_USE", 0, U, "TOKEN_LEARN_MORE_URL", 0, C], 253536);
    let S = {
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
            [t.default.AssetPermissionRequests]: r.default.Game
        },
        T = {
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
            [r.default.Alert]: "alerts"
        },
        x = {
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
            [r.default.Look]: a.ThumbnailTypes.assetThumbnail
        },
        k = {
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
            [r.default.Alert]: a.ReturnPolicy.AutoGenerated
        },
        R = {
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
            [t.default.AssetPermissionRequests]: "Label.Requests"
        },
        G = {
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
            [r.default.Alert]: "Heading.Alerts"
        },
        z = {
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
            [r.default.Alert]: "Heading.Alert"
        },
        D = {
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
            [r.default.Alert]: "Heading.Alert"
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
            [r.default.Alert]: "alerts/create"
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
            [r.default.Alert]: null
        },
        B = {
            [r.default.Badge]: c,
            [r.default.DeveloperProduct]: s,
            [r.default.GamePass]: i,
            [r.default.CatalogAsset]: p,
            [r.default.ExperienceSubscription]: f,
            [r.default.AvatarCreationToken]: C,
            [r.default.Look]: void 0
        };
    e.s(["AllSettlePromiseFailed", 0, "rejected", "AllSettlePromiseSuccess", 0, "fulfilled", "assetFullNameKeys", 0, R, "assetTypeToItemType", 0, S, "assetTypeToSingularNameKeys", 0, M, "itemFullNameKeys", 0, G, "itemTypeToCreatePath", 0, w, "itemTypeToLearnMoreUrl", 0, B, "itemTypeToNameKeys", 0, z, "itemTypeToPath", 0, T, "itemTypeToReorderPath", 0, I, "itemTypeToReturnPolicyType", 0, k, "itemTypeToSingularNameKeys", 0, D, "itemTypeToThumbnailType", 0, x, "toastDurationTime", 0, 3e3, "uninitializedUniverseId", 0, -1], 759283)
}, 307529, e => {
    "use strict";
    var a, t = ((a = t || {}).Place = "Place", a.MyExperiences = "MyExperiences", a.SharedExperiences = "SharedExperiences", a.TShirt = "TShirt", a.Shirt = "Shirt", a.Pants = "Pants", a.Hat = "Hat", a.HairAccessory = "HairAccessory", a.FaceAccessory = "FaceAccessory", a.NeckAccessory = "NeckAccessory", a.ShoulderAccessory = "ShoulderAccessory", a.FrontAccessory = "FrontAccessory", a.BackAccessory = "BackAccessory", a.WaistAccessory = "WaistAccessory", a.TShirtAccessory = "TShirtAccessory", a.ShirtAccessory = "ShirtAccessory", a.PantsAccessory = "PantsAccessory", a.JacketAccessory = "JacketAccessory", a.SweaterAccessory = "SweaterAccessory", a.ShortsAccessory = "ShortsAccessory", a.DressSkirtAccessory = "DressSkirtAccessory", a.EyebrowAccessory = "EyebrowAccessory", a.EyelashAccessory = "EyelashAccessory", a.FaceMakeup = "FaceMakeup", a.LipMakeup = "LipMakeup", a.EyeMakeup = "EyeMakeup", a.AvatarBackground = "AvatarBackground", a.AvatarLooks = "AvatarLooks", a.Showcase = "Showcase", a.Decal = "Decal", a.Image = "Image", a.Audio = "Audio", a.Model = "Model", a.Mesh = "Mesh", a.MeshPart = "MeshPart", a.Plugin = "Plugin", a.EmoteAnimation = "EmoteAnimation", a.Animation = "Animation", a.Video = "Video", a.Event = "Event", a.UpcomingEvent = "UpcomingEvent", a.DraftEvent = "DraftEvent", a.PastEvent = "PastEvent", a.FontFamily = "FontFamily", a.ShareLink = "ShareLink", a.Moments = "Moments", a.StorePreviewVideo = "StorePreviewVideo", a.GamePreviewVideo = "GamePreviewVideo", a.AllCatalogAsset = "All", a.AssetPermissionRequests = "AssetPermissionRequests", a);
    e.s(["default", 0, t])
}, 251622, e => {
    "use strict";
    var a, t = ((a = t || {}).Game = "Game", a.Bundle = "Bundle", a.CatalogAsset = "CatalogAsset", a.LibraryAsset = "LibraryAsset", a.GamePass = "Pass", a.Badge = "Badge", a.DeveloperProduct = "DeveloperProduct", a.TranslatorGame = "TranslatorGame", a.Places = "Places", a.CreatedPlaces = "CreatedPlaces", a.Event = "Event", a.Notifications = "Notifications", a.ExperienceSubscription = "Subscription", a.Advanced = "Advanced", a.AvatarCreationToken = "AvatarCreationToken", a.ReferralRewards = "ReferralRewards", a.Environment = "Environment", a.Look = "Look", a.Alert = "Alert", a);
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
        c = {
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
                        return c.getConfigureExperienceUrl(e);
                    case r.default.Bundle:
                        return c.getConfigureBundlePath(e);
                    case r.default.CatalogAsset:
                        return c.getConfigureAvatarItemsUrl(e);
                    default:
                        throw Error("Unsupported item type ".concat(String(a)))
                }
            },
            getExperienceOverviewUrl: e => "/dashboard/creations/experiences/".concat(e, "/overview"),
            getConfigureBundlePath: e => "/dashboard/creations/bundle/".concat(e, "/configure"),
            getConfigureExperienceUrl: e => "/dashboard/creations/experiences/".concat(e, "/configure"),
            configureCreatorStoreItemBasePath: "/dashboard/creations/store/",
            getConfigureCreatorStoreItemUrl: e => "".concat(c.configureCreatorStoreItemBasePath).concat(e, "/configure"),
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
            getServerManagementUrl: e => "/dashboard/creations/experiences/".concat(e, "/server-management"),
            getClientSessionsUrl: e => "/dashboard/creations/experiences/".concat(e, "/client-sessions"),
            getPlayerSupportUrl: e => "/dashboard/creations/experiences/".concat(e, "/player-support")
        };
    e.s(["creatorStore", 0, {
        getUrl: () => o,
        getAssetUrl: e => "".concat(o, "/asset/").concat(e),
        getSearchUrl: (e, a) => {
            if ("" !== s[e]) return "".concat(o, "/").concat(s[e], "?keyword=").concat(encodeURIComponent(a));
            throw Error("Unsupported search asset type ".concat(e))
        }
    }, "dashboard", 0, c, "developerForum", 0, {
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
        getSellingOnCreatorStoreUrl: () => "".concat(n, "/production/creator-store#distribute-and-sell-assets"),
        getPassesMonetizationUrl: () => "".concat(n, "/production/monetization/game-passes"),
        getDeveloperProductsMonetizationUrl: () => "".concat(n, "/production/monetization/developer-products"),
        getDeveloperProductsExternalPurchaseSettingsMonetizationUrl: () => "".concat(n, "/production/monetization/developer-products#outside-your-experience"),
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
        getExperienceDetailsPageRewardedAdsUrl: () => "".concat(n, "/production/monetization/immersive-ads"),
        getCreatorStorePublishingUrl: () => "".concat(n, "/production/creator-store#distribute-and-sell-assets"),
        getDecalReferenceUrl: () => "".concat(n, "/reference/engine/classes/Decal"),
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
        getAnalyticsRetentionGuideUrl: () => "".concat(n, "/production/analytics/retention#improving-day-1-retention"),
        getMonetizationNewUserExperienceGuideUrl: () => "".concat(n, "/production/monetization/improve-new-user-experience"),
        getAnalyticsEngagementGuideUrl: () => "".concat(n, "/production/analytics/engagement#improving-average-session-time"),
        getAnalyticsRetentionD7GuideUrl: () => "".concat(n, "/production/analytics/retention#improving-day-7-retention"),
        getAnalyticsRetentionD30GuideUrl: () => "".concat(n, "/production/analytics/retention#improving-day-30-retention"),
        getAnalyticsMonetizationPayerConversionRateGuideUrl: () => "".concat(n, "/production/analytics/monetization#improving-payer-conversion-rate"),
        getAnalyticsMonetizationARPPUGuideUrl: () => "".concat(n, "/production/analytics/monetization#improving-average-revenue-per-paying-user-arppu"),
        getAnalyticsFilterByMetricsGuideUrl: () => "".concat(n, "/production/analytics/analytics-dashboard#filter-by-metrics"),
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
    }, "getDataCollectionUrl", 0, () => "/data-collection", "getGroupRoleUrl", 0, e => "/dashboard/group/roles/".concat(e), "getRoadmapUrl", 0, () => "/roadmap", "getShareLinksUrl", 0, () => "/affiliate", "getUrl", 0, () => "/"])
}, 829425, e => {
    "use strict";
    var a = e.i(726474);
    e.s(["creatorHub", 0, a])
}]);

//# debugId=eb8bdf73-1ac6-7c78-c0ee-3e8582bb4d68
//# sourceMappingURL=3hebvljbjfqcp.js.map