;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "43e2f4bd-d05d-20ab-7154-3ff6e23c8cae")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 730530, e => {
    "use strict";
    let t = e => e;
    e.s(["brandPretranslatedText", 0, e => t(e), "brandUntranslatableText", 0, t, "translateHTMLFn", 0, e => {
        let {
            translateHTML: t
        } = e;
        return (e, a, s) => {
            let {
                key: r
            } = e;
            return t(r, a, s)
        }
    }, "translationFn", 0, e => {
        let {
            translate: t
        } = e;
        return (e, a) => {
            let {
                key: s
            } = e;
            return t(s, a)
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
        constructor(a, s = "") {
            super("Generic BEDEV1 Error"), (0, t._)(this, "code", void 0), (0, t._)(this, "message", void 0), this.code = a, this.message = s, Error.captureStackTrace && Error.captureStackTrace(this, e)
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
    async function a(e) {
        try {
            let a = (0, t.default)(e);
            if (a) {
                let e = await a.json();
                if (e.errors.length > 0) {
                    let t = e.errors[0];
                    if (t) return {
                        status: a.status,
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
    e.s(["default", 0, a])
}, 759283, 253536, e => {
    "use strict";
    var t = e.i(540513),
        a = e.i(307529),
        s = e.i(251622),
        r = e.i(260022);
    (0, r.getProductionCreatorHubUrl)("global");
    let o = "".concat((0, r.getProductionCreatorHubUrl)("global"), "/docs/reference/engine/classes/Player#GetJoinData"),
        i = (0, r.resolveUrl)("developerArticleProductsInGamePurchasesUrl", "production", "global"),
        n = (0, r.resolveUrl)("developerArticleBadgesSpecialGameAwardsUrl", "production", "global"),
        l = "".concat((0, r.getProductionCreatorHubUrl)("global"), "/docs/production/monetization/game-passes"),
        u = (0, r.resolveUrl)("developerArticleCreateVipServerUrl", "production", "global"),
        d = "".concat((0, r.getProductionCreatorHubUrl)("global"), "/docs/production/publishing/publish-experiences-and-places#release-to-the-public");
    (0, r.getProductionCreatorHubUrl)("global");
    let c = "".concat((0, r.getProductionCreatorHubUrl)("global"), "/docs/projects/assets/privacy"),
        p = "".concat((0, r.getProductionCreatorHubUrl)("global"), "/docs/parts/models#distribute-models"),
        f = "".concat((0, r.getProductionCreatorHubUrl)("global"), "/docs/art/marketplace/publishing-to-marketplace#sale-location");
    (0, r.getProductionCreatorHubUrl)("global");
    let h = "".concat((0, r.getProductionCreatorHubUrl)("global"), "/docs/production/monetization/subscriptions#creating-subscriptions"),
        v = "".concat((0, r.getProductionCreatorHubUrl)("global"), "/docs/production/game-design/subscription-design#bundles"),
        A = "".concat((0, r.getProductionCreatorHubUrl)("global"), "/docs/production/monetization/subscriptions#earning-with-subscriptions"),
        m = (0, r.resolveUrl)("robloxCommunityStandardsUrl", "production", "global"),
        b = "".concat((0, r.getProductionCreatorHubUrl)("global"), "/docs/art/marketplace/marketplace-policy#ugc-program-guidelines"),
        y = "".concat((0, r.getProductionCreatorHubUrl)("global"), "/docs/art/marketplace/marketplace-fees-and-commissions#publishing-advance");
    (0, r.getProductionCreatorHubUrl)("global"), (0, r.getProductionCreatorHubUrl)("global");
    let L = "".concat((0, r.getProductionCreatorHubUrl)("global"), "/docs/production/publishing/account-verification");
    (0, r.getProductionCreatorHubUrl)("global"), (0, r.getProductionCreatorHubUrl)("global");
    let g = (0, r.resolveUrl)("ugcSubscriptionTermsOfUseUrl", "production", "global"),
        P = (0, r.resolveUrl)("robloxTermsOfUseUrl", "production", "global"),
        S = (0, r.resolveUrl)("advertisingStandardsUrl", "production", "global"),
        R = "".concat((0, r.getProductionCreatorHubUrl)("global"), "/docs/production/publishing/account-verification"),
        T = "".concat((0, r.getProductionCreatorHubUrl)("global"), "/docs/production/monetization/avatar-creation-token");
    e.s(["ACCOUNT_VERIFICATION_URL", 0, R, "ASSET_ACCESS_PRIVACY", 0, c, "BADGE_LEARN_MORE_URL", 0, n, "CREATOR_STORE_VERIFICATION_URL", 0, L, "DEVELOPER_PRODUCT_LEARN_MORE_URL", 0, i, "DISTRIBUTE_MODELS", 0, p, "LAUNCH_DATA_LEARN_MORE_URL", 0, o, "MARKETPLACE_POLICY", 0, b, "MOMENTS_LEARN_MORE_URL", 0, "https://about.roblox.com/newsroom/2025/09/roblox-moments-user-generated-discovery", "PASS_LEARN_MORE_URL", 0, l, "PRIVATE_SERVER_LEARN_MORE_URL", 0, u, "PUBLISHING_ADVANCE", 0, y, "RELEASE_EXPERIENCE_TO_PUBLIC_URL", 0, d, "ROBLOX_ADVERTISING_STANDARDS", 0, S, "ROBLOX_COMMUNITY_STANDARDS", 0, m, "ROBLOX_TERMS_OF_USE", 0, P, "SALE_LOCATION_LEARN_MORE_URL", 0, f, "SUBSCRIPTION_LEARN_MORE_PRICING_URL", 0, A, "SUBSCRIPTION_LEARN_MORE_PRODUCT_TYPES_URL", 0, v, "SUBSCRIPTION_LEARN_MORE_URL", 0, h, "SUBSCRIPTION_TERMS_OF_USE", 0, g, "TOKEN_LEARN_MORE_URL", 0, T], 253536);
    let w = {
            [a.default.Place]: s.default.Game,
            [a.default.SharedExperiences]: s.default.Game,
            [a.default.MyExperiences]: s.default.Game,
            [a.default.ShareLink]: s.default.Game,
            [a.default.Moments]: s.default.Game,
            [a.default.TShirt]: s.default.CatalogAsset,
            [a.default.Shirt]: s.default.CatalogAsset,
            [a.default.Pants]: s.default.CatalogAsset,
            [a.default.Hat]: s.default.CatalogAsset,
            [a.default.HairAccessory]: s.default.CatalogAsset,
            [a.default.FaceAccessory]: s.default.CatalogAsset,
            [a.default.NeckAccessory]: s.default.CatalogAsset,
            [a.default.ShoulderAccessory]: s.default.CatalogAsset,
            [a.default.FrontAccessory]: s.default.CatalogAsset,
            [a.default.BackAccessory]: s.default.CatalogAsset,
            [a.default.WaistAccessory]: s.default.CatalogAsset,
            [a.default.TShirtAccessory]: s.default.CatalogAsset,
            [a.default.ShirtAccessory]: s.default.CatalogAsset,
            [a.default.PantsAccessory]: s.default.CatalogAsset,
            [a.default.JacketAccessory]: s.default.CatalogAsset,
            [a.default.SweaterAccessory]: s.default.CatalogAsset,
            [a.default.ShortsAccessory]: s.default.CatalogAsset,
            [a.default.DressSkirtAccessory]: s.default.CatalogAsset,
            [a.default.EmoteAnimation]: s.default.CatalogAsset,
            [a.default.EyebrowAccessory]: s.default.CatalogAsset,
            [a.default.EyelashAccessory]: s.default.CatalogAsset,
            [a.default.FaceMakeup]: s.default.CatalogAsset,
            [a.default.LipMakeup]: s.default.CatalogAsset,
            [a.default.EyeMakeup]: s.default.CatalogAsset,
            [a.default.AvatarBackground]: s.default.CatalogAsset,
            [a.default.AvatarLooks]: s.default.CatalogAsset,
            [a.default.Showcase]: s.default.CatalogAsset,
            [a.default.AllCatalogAsset]: s.default.CatalogAsset,
            [a.default.Decal]: s.default.LibraryAsset,
            [a.default.Image]: s.default.LibraryAsset,
            [a.default.Audio]: s.default.LibraryAsset,
            [a.default.Model]: s.default.LibraryAsset,
            [a.default.Mesh]: s.default.LibraryAsset,
            [a.default.MeshPart]: s.default.LibraryAsset,
            [a.default.Plugin]: s.default.LibraryAsset,
            [a.default.Animation]: s.default.LibraryAsset,
            [a.default.FontFamily]: s.default.LibraryAsset,
            [a.default.Video]: s.default.LibraryAsset,
            [a.default.Event]: s.default.Event,
            [a.default.PastEvent]: s.default.Event,
            [a.default.DraftEvent]: s.default.Event,
            [a.default.UpcomingEvent]: s.default.Event,
            [a.default.StorePreviewVideo]: s.default.LibraryAsset,
            [a.default.GamePreviewVideo]: s.default.LibraryAsset,
            [a.default.AssetPermissionRequests]: s.default.Game
        },
        k = {
            [s.default.Game]: "experiences",
            [s.default.CatalogAsset]: "catalog",
            [s.default.LibraryAsset]: "library",
            [s.default.Bundle]: "bundle",
            [s.default.Badge]: "badges",
            [s.default.GamePass]: "passes",
            [s.default.DeveloperProduct]: "developer-products",
            [s.default.TranslatorGame]: "experiences",
            [s.default.Places]: "places",
            [s.default.CreatedPlaces]: "places",
            [s.default.Event]: "events",
            [s.default.Notifications]: "notifications",
            [s.default.ExperienceSubscription]: "experience-subscriptions",
            [s.default.Advanced]: "advanced",
            [s.default.AvatarCreationToken]: "avatar-creation-tokens",
            [s.default.ReferralRewards]: "referral-reward-details",
            [s.default.Environment]: "environments",
            [s.default.Look]: "look",
            [s.default.Alert]: "alerts"
        },
        I = {
            [s.default.Game]: t.ThumbnailTypes.gameIcon,
            [s.default.CatalogAsset]: t.ThumbnailTypes.assetThumbnail,
            [s.default.LibraryAsset]: t.ThumbnailTypes.assetThumbnail,
            [s.default.Bundle]: t.ThumbnailTypes.bundleThumbnail,
            [s.default.Badge]: t.ThumbnailTypes.badgeIcon,
            [s.default.GamePass]: t.ThumbnailTypes.gamePassIcon,
            [s.default.DeveloperProduct]: t.ThumbnailTypes.developerProductIcon,
            [s.default.TranslatorGame]: t.ThumbnailTypes.gameIcon,
            [s.default.Places]: t.ThumbnailTypes.placeIcon,
            [s.default.CreatedPlaces]: t.ThumbnailTypes.placeIcon,
            [s.default.Event]: t.ThumbnailTypes.universeThumbnail,
            [s.default.Notifications]: t.ThumbnailTypes.assetThumbnail,
            [s.default.ExperienceSubscription]: t.ThumbnailTypes.assetThumbnail,
            [s.default.Advanced]: t.ThumbnailTypes.assetThumbnail,
            [s.default.AvatarCreationToken]: t.ThumbnailTypes.bundleThumbnail,
            [s.default.ReferralRewards]: t.ThumbnailTypes.assetThumbnail,
            [s.default.Environment]: t.ThumbnailTypes.universeThumbnail,
            [s.default.Alert]: t.ThumbnailTypes.universeThumbnail,
            [s.default.Look]: t.ThumbnailTypes.assetThumbnail
        },
        E = {
            [s.default.Game]: t.ReturnPolicy.AutoGenerated,
            [s.default.Bundle]: t.ReturnPolicy.AutoGenerated,
            [s.default.CatalogAsset]: t.ReturnPolicy.PlaceHolder,
            [s.default.LibraryAsset]: t.ReturnPolicy.AutoGenerated,
            [s.default.Badge]: t.ReturnPolicy.AutoGenerated,
            [s.default.GamePass]: t.ReturnPolicy.AutoGenerated,
            [s.default.DeveloperProduct]: t.ReturnPolicy.AutoGenerated,
            [s.default.TranslatorGame]: t.ReturnPolicy.PlaceHolder,
            [s.default.Places]: t.ReturnPolicy.AutoGenerated,
            [s.default.CreatedPlaces]: t.ReturnPolicy.AutoGenerated,
            [s.default.Event]: t.ReturnPolicy.PlaceHolder,
            [s.default.Notifications]: t.ReturnPolicy.AutoGenerated,
            [s.default.ExperienceSubscription]: t.ReturnPolicy.AutoGenerated,
            [s.default.Advanced]: t.ReturnPolicy.AutoGenerated,
            [s.default.AvatarCreationToken]: t.ReturnPolicy.AutoGenerated,
            [s.default.ReferralRewards]: t.ReturnPolicy.AutoGenerated,
            [s.default.Environment]: t.ReturnPolicy.AutoGenerated,
            [s.default.Look]: t.ReturnPolicy.AutoGenerated,
            [s.default.Alert]: t.ReturnPolicy.AutoGenerated
        },
        C = {
            [a.default.Place]: "Label.Games",
            [a.default.MyExperiences]: "Label.Games",
            [a.default.SharedExperiences]: "Label.Games",
            [a.default.TShirt]: "Label.TShirts",
            [a.default.Shirt]: "Label.Shirts",
            [a.default.Pants]: "Label.Pants",
            [a.default.Hat]: "Label.Hats",
            [a.default.HairAccessory]: "Label.HairAccessories",
            [a.default.FaceAccessory]: "Label.FaceAccessories",
            [a.default.NeckAccessory]: "Label.NeckAccessories",
            [a.default.ShoulderAccessory]: "Label.ShoulderAccessories",
            [a.default.FrontAccessory]: "Label.FrontAccessories",
            [a.default.BackAccessory]: "Label.BackAccessories",
            [a.default.WaistAccessory]: "Label.WaistAccessories",
            [a.default.TShirtAccessory]: "Label.TShirts",
            [a.default.ShirtAccessory]: "Label.Shirts",
            [a.default.PantsAccessory]: "Label.Pants",
            [a.default.JacketAccessory]: "Label.Jackets",
            [a.default.SweaterAccessory]: "Label.Sweaters",
            [a.default.ShortsAccessory]: "Label.ShortsAccessories",
            [a.default.DressSkirtAccessory]: "Label.Skirts",
            [a.default.EmoteAnimation]: "Label.Emote",
            [a.default.EyebrowAccessory]: "Label.EyebrowAccessories",
            [a.default.EyelashAccessory]: "Label.EyelashAccessories",
            [a.default.FaceMakeup]: "Label.FaceMakeupAccessories",
            [a.default.LipMakeup]: "Label.LipMakeupAccessories",
            [a.default.EyeMakeup]: "Label.EyeMakeupAccessories",
            [a.default.AvatarBackground]: "Label.Backgrounds",
            [a.default.AvatarLooks]: "Label.Avatars",
            [a.default.Showcase]: "Label.Showcases",
            [a.default.AllCatalogAsset]: "Label.AllAssetTypes",
            [a.default.Decal]: "Label.Decals",
            [a.default.Image]: "Label.Images",
            [a.default.Audio]: "Label.Audios",
            [a.default.Model]: "Label.Models",
            [a.default.Mesh]: "Label.Meshes",
            [a.default.MeshPart]: "Label.MeshParts",
            [a.default.Plugin]: "Label.Plugins",
            [a.default.FontFamily]: "Label.FontFamily",
            [a.default.Animation]: "Label.Animations",
            [a.default.Video]: "Label.Videos",
            [a.default.Event]: "Label.Events",
            [a.default.PastEvent]: "Label.PastEvents",
            [a.default.DraftEvent]: "Label.DraftEvents",
            [a.default.UpcomingEvent]: "Label.UpcomingEvents",
            [a.default.ShareLink]: "Label.ShareLinks",
            [a.default.Moments]: "Label.Moments",
            [a.default.StorePreviewVideo]: "Label.StorePreviewVideo",
            [a.default.GamePreviewVideo]: "Label.GamePreviewVideo",
            [a.default.AssetPermissionRequests]: "Label.Requests"
        },
        x = {
            [a.default.Place]: "Label.Games",
            [a.default.MyExperiences]: "Label.Games",
            [a.default.SharedExperiences]: "Label.Games",
            [a.default.TShirt]: "Label.TShirt",
            [a.default.Shirt]: "Label.Shirt",
            [a.default.Pants]: "Label.Pants",
            [a.default.Hat]: "Label.Hat",
            [a.default.HairAccessory]: "Label.HairAccessory",
            [a.default.FaceAccessory]: "Label.FaceAccessory",
            [a.default.NeckAccessory]: "Label.NeckAccessory",
            [a.default.ShoulderAccessory]: "Label.ShoulderAccessory",
            [a.default.FrontAccessory]: "Label.FrontAccessory",
            [a.default.BackAccessory]: "Label.BackAccessory",
            [a.default.WaistAccessory]: "Label.WaistAccessory",
            [a.default.TShirtAccessory]: "Label.TShirt",
            [a.default.ShirtAccessory]: "Label.Shirt",
            [a.default.PantsAccessory]: "Label.Pants",
            [a.default.JacketAccessory]: "Label.Jacket",
            [a.default.SweaterAccessory]: "Label.Sweater",
            [a.default.ShortsAccessory]: "Label.ShortsAccessories",
            [a.default.DressSkirtAccessory]: "Label.Skirt",
            [a.default.EmoteAnimation]: "Label.Emote",
            [a.default.EyebrowAccessory]: "Label.EyebrowAccessory",
            [a.default.EyelashAccessory]: "Label.EyelashAccessory",
            [a.default.FaceMakeup]: "Label.FaceMakeup",
            [a.default.LipMakeup]: "Label.LipMakeup",
            [a.default.EyeMakeup]: "Label.EyeMAkeup",
            [a.default.AvatarBackground]: "Label.AvatarBackground",
            [a.default.AvatarLooks]: "Label.Avatars",
            [a.default.Showcase]: "Label.Showcase",
            [a.default.AllCatalogAsset]: "Label.AllAssetTypes",
            [a.default.Decal]: "Label.Decal",
            [a.default.Image]: "Label.Image",
            [a.default.Audio]: "Label.Audios",
            [a.default.Model]: "Label.Model",
            [a.default.Mesh]: "Label.Mesh",
            [a.default.MeshPart]: "Label.MeshPart",
            [a.default.Plugin]: "Label.Plugin",
            [a.default.Animation]: "Label.Animation",
            [a.default.FontFamily]: "Label.FontFamily",
            [a.default.Video]: "Label.Video",
            [a.default.Event]: "Label.Event",
            [a.default.PastEvent]: "Label.PastEvent",
            [a.default.DraftEvent]: "Label.DraftEvent",
            [a.default.UpcomingEvent]: "Label.UpcomingEvent",
            [a.default.ShareLink]: "Label.ShareLink",
            [a.default.Moments]: "Label.Moments",
            [a.default.StorePreviewVideo]: "Label.StorePreviewVideo",
            [a.default.GamePreviewVideo]: "Label.GamePreviewVideo",
            [a.default.AssetPermissionRequests]: "Label.Requests"
        },
        U = {
            [s.default.Game]: "Label.Games",
            [s.default.CatalogAsset]: "Label.AvatarItems",
            [s.default.Bundle]: "Label.AvatarItem",
            [s.default.LibraryAsset]: "Label.DevelopmentItems",
            [s.default.Badge]: "Label.Badges",
            [s.default.GamePass]: "Label.GamePasses",
            [s.default.DeveloperProduct]: "Label.DeveloperProducts",
            [s.default.TranslatorGame]: "Label.TranslatorGame",
            [s.default.Places]: "Label.Places",
            [s.default.CreatedPlaces]: "Label.Places",
            [s.default.Event]: "Label.Events",
            [s.default.Notifications]: "Label.Notifications",
            [s.default.ExperienceSubscription]: "Label.Subscriptions",
            [s.default.Advanced]: "Header.Title",
            [s.default.AvatarCreationToken]: "Label.AvatarCreationTokens",
            [s.default.ReferralRewards]: "Label.ReferralRewards",
            [s.default.Environment]: "Label.Environments",
            [s.default.Look]: "Label.Looks",
            [s.default.Alert]: "Heading.Alerts"
        },
        M = {
            [s.default.Game]: "Label.Game",
            [s.default.CatalogAsset]: "Label.AvatarItem",
            [s.default.Bundle]: "Label.AvatarItem",
            [s.default.LibraryAsset]: "Label.DevelopmentItem",
            [s.default.Badge]: "Label.Badge",
            [s.default.GamePass]: "Label.GamePass",
            [s.default.DeveloperProduct]: "Label.DeveloperProduct",
            [s.default.TranslatorGame]: "Label.TranslatorGame",
            [s.default.Places]: "Label.Place",
            [s.default.CreatedPlaces]: "Label.Places",
            [s.default.Event]: "Label.Event",
            [s.default.Notifications]: "Label.Notifications",
            [s.default.ExperienceSubscription]: "Label.Subscription",
            [s.default.Advanced]: "Header.Title",
            [s.default.AvatarCreationToken]: "Label.Token",
            [s.default.ReferralRewards]: "Label.ReferralRewards",
            [s.default.Environment]: "Label.Environment",
            [s.default.Look]: "Label.Looks",
            [s.default.Alert]: "Heading.Alert"
        },
        G = {
            [s.default.Game]: "Heading.Game",
            [s.default.CatalogAsset]: "Heading.AvatarItem",
            [s.default.Bundle]: "Heading.AvatarItem",
            [s.default.LibraryAsset]: "Heading.DevelopmentItem",
            [s.default.Badge]: "Heading.Badge",
            [s.default.GamePass]: "Heading.Pass",
            [s.default.DeveloperProduct]: "Heading.DeveloperProduct",
            [s.default.TranslatorGame]: "Heading.TranslatorGame",
            [s.default.Places]: "Heading.Place",
            [s.default.CreatedPlaces]: "Heading.Place",
            [s.default.Event]: "Heading.Event",
            [s.default.Notifications]: "Heading.Notifications.CreateContent",
            [s.default.ExperienceSubscription]: "Heading.Subscription",
            [s.default.Advanced]: "Header.Title",
            [s.default.AvatarCreationToken]: "Label.AvatarCreationToken",
            [s.default.ReferralRewards]: "Heading.ReferralRewards",
            [s.default.Environment]: "Heading.Environment",
            [s.default.Look]: "Heading.Looks",
            [s.default.Alert]: "Heading.Alert"
        },
        q = {
            [s.default.Game]: null,
            [s.default.CatalogAsset]: null,
            [s.default.Bundle]: null,
            [s.default.LibraryAsset]: null,
            [s.default.Badge]: "badges/create",
            [s.default.GamePass]: "passes/create",
            [s.default.DeveloperProduct]: "developer-products/create",
            [s.default.ReferralRewards]: "referral-reward-details/create",
            [s.default.TranslatorGame]: null,
            [s.default.Places]: null,
            [s.default.CreatedPlaces]: null,
            [s.default.Event]: "events/create",
            [s.default.Notifications]: null,
            [s.default.ExperienceSubscription]: "experience-subscriptions/create",
            [s.default.Advanced]: null,
            [s.default.AvatarCreationToken]: "avatar-creation-tokens/create",
            [s.default.Environment]: "environments/create",
            [s.default.Look]: "looks/create",
            [s.default.Alert]: "alerts/create"
        },
        O = {
            [s.default.Game]: null,
            [s.default.CatalogAsset]: null,
            [s.default.Bundle]: null,
            [s.default.LibraryAsset]: null,
            [s.default.Badge]: "badges/reorder",
            [s.default.ReferralRewards]: null,
            [s.default.GamePass]: null,
            [s.default.DeveloperProduct]: null,
            [s.default.TranslatorGame]: null,
            [s.default.Places]: null,
            [s.default.CreatedPlaces]: null,
            [s.default.Event]: null,
            [s.default.Notifications]: null,
            [s.default.ExperienceSubscription]: null,
            [s.default.Advanced]: null,
            [s.default.AvatarCreationToken]: null,
            [s.default.Environment]: null,
            [s.default.Look]: null,
            [s.default.Alert]: null
        },
        N = {
            [s.default.Badge]: n,
            [s.default.DeveloperProduct]: i,
            [s.default.GamePass]: l,
            [s.default.CatalogAsset]: f,
            [s.default.ExperienceSubscription]: h,
            [s.default.AvatarCreationToken]: T,
            [s.default.Look]: void 0
        };
    e.s(["AllSettlePromiseFailed", 0, "rejected", "AllSettlePromiseSuccess", 0, "fulfilled", "assetFullNameKeys", 0, C, "assetTypeToItemType", 0, w, "assetTypeToSingularNameKeys", 0, x, "itemFullNameKeys", 0, U, "itemTypeToCreatePath", 0, q, "itemTypeToLearnMoreUrl", 0, N, "itemTypeToNameKeys", 0, M, "itemTypeToPath", 0, k, "itemTypeToReorderPath", 0, O, "itemTypeToReturnPolicyType", 0, E, "itemTypeToSingularNameKeys", 0, G, "itemTypeToThumbnailType", 0, I, "toastDurationTime", 0, 3e3, "uninitializedUniverseId", 0, -1], 759283)
}, 307529, e => {
    "use strict";
    var t, a = ((t = a || {}).Place = "Place", t.MyExperiences = "MyExperiences", t.SharedExperiences = "SharedExperiences", t.TShirt = "TShirt", t.Shirt = "Shirt", t.Pants = "Pants", t.Hat = "Hat", t.HairAccessory = "HairAccessory", t.FaceAccessory = "FaceAccessory", t.NeckAccessory = "NeckAccessory", t.ShoulderAccessory = "ShoulderAccessory", t.FrontAccessory = "FrontAccessory", t.BackAccessory = "BackAccessory", t.WaistAccessory = "WaistAccessory", t.TShirtAccessory = "TShirtAccessory", t.ShirtAccessory = "ShirtAccessory", t.PantsAccessory = "PantsAccessory", t.JacketAccessory = "JacketAccessory", t.SweaterAccessory = "SweaterAccessory", t.ShortsAccessory = "ShortsAccessory", t.DressSkirtAccessory = "DressSkirtAccessory", t.EyebrowAccessory = "EyebrowAccessory", t.EyelashAccessory = "EyelashAccessory", t.FaceMakeup = "FaceMakeup", t.LipMakeup = "LipMakeup", t.EyeMakeup = "EyeMakeup", t.AvatarBackground = "AvatarBackground", t.AvatarLooks = "AvatarLooks", t.Showcase = "Showcase", t.Decal = "Decal", t.Image = "Image", t.Audio = "Audio", t.Model = "Model", t.Mesh = "Mesh", t.MeshPart = "MeshPart", t.Plugin = "Plugin", t.EmoteAnimation = "EmoteAnimation", t.Animation = "Animation", t.Video = "Video", t.Event = "Event", t.UpcomingEvent = "UpcomingEvent", t.DraftEvent = "DraftEvent", t.PastEvent = "PastEvent", t.FontFamily = "FontFamily", t.ShareLink = "ShareLink", t.Moments = "Moments", t.StorePreviewVideo = "StorePreviewVideo", t.GamePreviewVideo = "GamePreviewVideo", t.AllCatalogAsset = "All", t.AssetPermissionRequests = "AssetPermissionRequests", t);
    e.s(["default", 0, a])
}, 251622, e => {
    "use strict";
    var t, a = ((t = a || {}).Game = "Game", t.Bundle = "Bundle", t.CatalogAsset = "CatalogAsset", t.LibraryAsset = "LibraryAsset", t.GamePass = "Pass", t.Badge = "Badge", t.DeveloperProduct = "DeveloperProduct", t.TranslatorGame = "TranslatorGame", t.Places = "Places", t.CreatedPlaces = "CreatedPlaces", t.Event = "Event", t.Notifications = "Notifications", t.ExperienceSubscription = "Subscription", t.Advanced = "Advanced", t.AvatarCreationToken = "AvatarCreationToken", t.ReferralRewards = "ReferralRewards", t.Environment = "Environment", t.Look = "Look", t.Alert = "Alert", t);
    let s = Object.values(a);
    e.s(["default", 0, a, "isItem", 0, e => s.includes(e)])
}, 475360, e => {
    "use strict";
    var t = e.i(251622);
    e.s(["Item", () => t.default])
}, 284856, e => {
    "use strict";
    var t = e.i(677753),
        a = function(e, t) {
            return (a = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var a in t) Object.prototype.hasOwnProperty.call(t, a) && (e[a] = t[a])
            })(e, t)
        };

    function s(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function s() {
            this.constructor = e
        }
        a(e, t), e.prototype = null === t ? Object.create(t) : (s.prototype = t.prototype, new s)
    }

    function r(e, t, a, s) {
        return new(a || (a = Promise))(function(r, o) {
            function i(e) {
                try {
                    l(s.next(e))
                } catch (e) {
                    o(e)
                }
            }

            function n(e) {
                try {
                    l(s.throw(e))
                } catch (e) {
                    o(e)
                }
            }

            function l(e) {
                var t;
                e.done ? r(e.value) : ((t = e.value) instanceof a ? t : new a(function(e) {
                    e(t)
                })).then(i, n)
            }
            l((s = s.apply(e, t || [])).next())
        })
    }

    function o(e, t) {
        var a, s, r, o = {
                label: 0,
                sent: function() {
                    if (1 & r[0]) throw r[1];
                    return r[1]
                },
                trys: [],
                ops: []
            },
            i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return i.next = n(0), i.throw = n(1), i.return = n(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
            return this
        }), i;

        function n(n) {
            return function(l) {
                var u = [n, l];
                if (a) throw TypeError("Generator is already executing.");
                for (; i && (i = 0, u[0] && (o = 0)), o;) try {
                    if (a = 1, s && (r = 2 & u[0] ? s.return : u[0] ? s.throw || ((r = s.return) && r.call(s), 0) : s.next) && !(r = r.call(s, u[1])).done) return r;
                    switch (s = 0, r && (u = [2 & u[0], r.value]), u[0]) {
                        case 0:
                        case 1:
                            r = u;
                            break;
                        case 4:
                            return o.label++, {
                                value: u[1],
                                done: !1
                            };
                        case 5:
                            o.label++, s = u[1], u = [0];
                            continue;
                        case 7:
                            u = o.ops.pop(), o.trys.pop();
                            continue;
                        default:
                            if (!(r = (r = o.trys).length > 0 && r[r.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                o = 0;
                                continue
                            }
                            if (3 === u[0] && (!r || u[1] > r[0] && u[1] < r[3])) {
                                o.label = u[1];
                                break
                            }
                            if (6 === u[0] && o.label < r[1]) {
                                o.label = r[1], r = u;
                                break
                            }
                            if (r && o.label < r[2]) {
                                o.label = r[2], o.ops.push(u);
                                break
                            }
                            r[2] && o.ops.pop(), o.trys.pop();
                            continue
                    }
                    u = t.call(e, o)
                } catch (e) {
                    u = [6, e], s = 0
                } finally {
                    a = r = 0
                }
                if (5 & u[0]) throw u[1];
                return {
                    value: u[0] ? u[1] : void 0,
                    done: !0
                }
            }
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function i(e, a) {
        var s;
        return null == e ? e : {
            creator: (0, t.exists)(e, "creator") ? null == (s = e.creator) ? s : {
                userId: (0, t.exists)(s, "userId") ? s.userId : void 0,
                groupId: (0, t.exists)(s, "groupId") ? s.groupId : void 0
            } : void 0,
            expectedPrice: (0, t.exists)(e, "expectedPrice") ? e.expectedPrice : void 0,
            creatingUniverseId: (0, t.exists)(e, "creatingUniverseId") ? e.creatingUniverseId : void 0,
            assetPrivacy: (0, t.exists)(e, "assetPrivacy") ? e.assetPrivacy : void 0
        }
    }

    function n(e, a) {
        return null == e ? e : {
            moderationState: (0, t.exists)(e, "moderationState") ? e.moderationState : void 0
        }
    }

    function l(e) {
        var a;
        return null == (a = e) ? a : {
            asset: (0, t.exists)(a, "asset") ? a.asset : void 0,
            altText: (0, t.exists)(a, "altText") ? a.altText : void 0
        }
    }

    function u(e) {
        if (void 0 !== e) return null === e ? null : {
            asset: e.asset,
            altText: e.altText
        }
    }

    function d(e, a) {
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

    function p(e, a) {
        return null == e ? e : {
            path: (0, t.exists)(e, "path") ? e.path : void 0,
            revisionId: (0, t.exists)(e, "revisionId") ? e.revisionId : void 0,
            revisionCreateTime: (0, t.exists)(e, "revisionCreateTime") ? null === e.revisionCreateTime ? null : new Date(e.revisionCreateTime) : void 0,
            assetId: (0, t.exists)(e, "assetId") ? e.assetId : void 0,
            displayName: (0, t.exists)(e, "displayName") ? e.displayName : void 0,
            description: (0, t.exists)(e, "description") ? e.description : void 0,
            assetType: (0, t.exists)(e, "assetType") ? e.assetType : void 0,
            creationContext: (0, t.exists)(e, "creationContext") ? i(e.creationContext) : void 0,
            moderationResult: (0, t.exists)(e, "moderationResult") ? n(e.moderationResult) : void 0,
            published: (0, t.exists)(e, "published") ? e.published : void 0,
            icon: (0, t.exists)(e, "icon") ? e.icon : void 0,
            previews: (0, t.exists)(e, "previews") ? null === e.previews ? null : e.previews.map(l) : void 0,
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

    function f(e) {
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
                            groupId: e.groupId
                        }
                    }(e.creator),
                    expectedPrice: e.expectedPrice,
                    creatingUniverseId: e.creatingUniverseId,
                    assetPrivacy: e.assetPrivacy
                }
            }(e.creationContext),
            moderationResult: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    moderationState: e.moderationState
                }
            }(e.moderationResult),
            published: e.published,
            icon: e.icon,
            previews: void 0 === e.previews ? void 0 : null === e.previews ? null : e.previews.map(u),
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

    function h(e) {
        var a;
        return null == (a = e) ? a : {
            path: (0, t.exists)(a, "path") ? a.path : void 0,
            quotaType: (0, t.exists)(a, "quotaType") ? a.quotaType : void 0,
            assetType: (0, t.exists)(a, "assetType") ? a.assetType : void 0,
            usage: (0, t.exists)(a, "usage") ? a.usage : void 0,
            capacity: (0, t.exists)(a, "capacity") ? a.capacity : void 0,
            period: (0, t.exists)(a, "period") ? a.period : void 0,
            usageResetTime: (0, t.exists)(a, "usageResetTime") ? null === a.usageResetTime ? null : new Date(a.usageResetTime) : void 0
        }
    }

    function v(e) {
        var a;
        return null == (a = e) ? a : {
            path: (0, t.exists)(a, "path") ? a.path : void 0,
            createTime: (0, t.exists)(a, "createTime") ? null === a.createTime ? null : new Date(a.createTime) : void 0,
            creationContext: (0, t.exists)(a, "creationContext") ? i(a.creationContext) : void 0,
            moderationResult: (0, t.exists)(a, "moderationResult") ? n(a.moderationResult) : void 0,
            published: (0, t.exists)(a, "published") ? a.published : void 0
        }
    }

    function A(e) {
        var a;
        return null == (a = e) ? a : {
            reason: (0, t.exists)(a, "reason") ? a.reason : void 0,
            domain: (0, t.exists)(a, "domain") ? a.domain : void 0,
            metadata: (0, t.exists)(a, "metadata") ? a.metadata : void 0
        }
    }

    function m(e) {
        if (void 0 !== e) return null === e ? null : {
            asset: f(e.asset),
            file: e.file,
            additionalParameters: e.additionalParameters
        }
    }

    function b(e) {
        var a;
        return null == (a = e) ? a : {
            httpVerb: (0, t.exists)(a, "httpVerb") ? a.httpVerb : void 0,
            url: (0, t.exists)(a, "url") ? a.url : void 0,
            expirationTimeMs: (0, t.exists)(a, "expirationTimeMs") ? a.expirationTimeMs : void 0,
            chunkNum: (0, t.exists)(a, "chunkNum") ? a.chunkNum : void 0,
            contentStart: (0, t.exists)(a, "contentStart") ? a.contentStart : void 0,
            contentLength: (0, t.exists)(a, "contentLength") ? a.contentLength : void 0
        }
    }

    function y(e, a) {
        return null == e ? e : {
            operationPath: (0, t.exists)(e, "operationPath") ? e.operationPath : void 0,
            uploadUrls: (0, t.exists)(e, "uploadUrls") ? null === e.uploadUrls ? null : e.uploadUrls.map(b) : void 0
        }
    }

    function L(e, a) {
        var s;
        return null == e ? e : {
            path: (0, t.exists)(e, "path") ? e.path : void 0,
            operationId: (0, t.exists)(e, "operationId") ? e.operationId : void 0,
            done: (0, t.exists)(e, "done") ? e.done : void 0,
            error: (0, t.exists)(e, "error") ? null == (s = e.error) ? s : {
                code: (0, t.exists)(s, "code") ? s.code : void 0,
                message: (0, t.exists)(s, "message") ? s.message : void 0,
                details: (0, t.exists)(s, "details") ? s.details.map(A) : void 0
            } : void 0,
            response: (0, t.exists)(e, "response") ? p(e.response) : void 0
        }
    }
    var g = function(e) {
            function a() {
                return null !== e && e.apply(this, arguments) || this
            }
            return s(a, e), a.prototype.assetsArchiveAssetRaw = function(e, a) {
                return r(this, void 0, void 0, function() {
                    var s, r, i;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetsArchiveAsset.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}:archive".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}:archive",
                                    method: "POST",
                                    headers: r,
                                    query: s
                                }, a)];
                            case 1:
                                return i = o.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return p(e)
                                })]
                        }
                    })
                })
            }, a.prototype.assetsArchiveAsset = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.assetsArchiveAssetRaw(e, t)];
                            case 1:
                                return [4, a.sent().value()];
                            case 2:
                                return [2, a.sent()]
                        }
                    })
                })
            }, a.prototype.assetsCreateAssetRaw = function(e, a) {
                return r(this, void 0, void 0, function() {
                    var s, r, i, n;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.fileContent || void 0 === e.fileContent) throw new t.RequiredError("fileContent", "Required parameter requestParameters.fileContent was null or undefined when calling assetsCreateAsset.");
                                return s = {}, r = {}, i = (0, t.canConsumeForm)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.fileContent && i.append("fileContent", e.fileContent), void 0 !== e.request && i.append("request", JSON.stringify(f(e.request))), [4, this.request({
                                    path: "/v1/assets",
                                    schemaPath: "/v1/assets",
                                    method: "POST",
                                    headers: r,
                                    query: s,
                                    body: i
                                }, a)];
                            case 1:
                                return n = o.sent(), [2, new t.JSONApiResponse(n, function(e) {
                                    return L(e)
                                })]
                        }
                    })
                })
            }, a.prototype.assetsCreateAsset = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.assetsCreateAssetRaw(e, t)];
                            case 1:
                                return [4, a.sent().value()];
                            case 2:
                                return [2, a.sent()]
                        }
                    })
                })
            }, a.prototype.assetsGetAssetRaw = function(e, a) {
                return r(this, void 0, void 0, function() {
                    var s, r, i;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetsGetAsset.");
                                return s = {}, e.readMask && (s.readMask = e.readMask.join(t.COLLECTION_FORMATS.csv)), r = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, a)];
                            case 1:
                                return i = o.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return p(e)
                                })]
                        }
                    })
                })
            }, a.prototype.assetsGetAsset = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.assetsGetAssetRaw(e, t)];
                            case 1:
                                return [4, a.sent().value()];
                            case 2:
                                return [2, a.sent()]
                        }
                    })
                })
            }, a.prototype.assetsRestoreAssetRaw = function(e, a) {
                return r(this, void 0, void 0, function() {
                    var s, r, i;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetsRestoreAsset.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}:restore".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}:restore",
                                    method: "POST",
                                    headers: r,
                                    query: s
                                }, a)];
                            case 1:
                                return i = o.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return p(e)
                                })]
                        }
                    })
                })
            }, a.prototype.assetsRestoreAsset = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.assetsRestoreAssetRaw(e, t)];
                            case 1:
                                return [4, a.sent().value()];
                            case 2:
                                return [2, a.sent()]
                        }
                    })
                })
            }, a.prototype.assetsUpdateAssetRaw = function(e, a) {
                return r(this, void 0, void 0, function() {
                    var s, r, i, n;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetsUpdateAsset.");
                                return s = {}, e.updateMask && (s.updateMask = e.updateMask.join(t.COLLECTION_FORMATS.csv)), r = {}, i = (0, t.canConsumeForm)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.fileContent && i.append("fileContent", e.fileContent), void 0 !== e.request && i.append("request", JSON.stringify(f(e.request))), [4, this.request({
                                    path: "/v1/assets/{assetId}".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}",
                                    method: "PATCH",
                                    headers: r,
                                    query: s,
                                    body: i
                                }, a)];
                            case 1:
                                return n = o.sent(), [2, new t.JSONApiResponse(n, function(e) {
                                    return L(e)
                                })]
                        }
                    })
                })
            }, a.prototype.assetsUpdateAsset = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.assetsUpdateAssetRaw(e, t)];
                            case 1:
                                return [4, a.sent().value()];
                            case 2:
                                return [2, a.sent()]
                        }
                    })
                })
            }, a
        }(t.BaseAPI),
        P = (function(e) {
            function a() {
                return null !== e && e.apply(this, arguments) || this
            }
            s(a, e), a.prototype.assetsGetAssetVersionRaw = function(e, a) {
                return r(this, void 0, void 0, function() {
                    var s, r, i;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetsGetAssetVersion.");
                                if (null === e.revisionId || void 0 === e.revisionId) throw new t.RequiredError("revisionId", "Required parameter requestParameters.revisionId was null or undefined when calling assetsGetAssetVersion.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}/versions/{revisionId}".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))).replace("{".concat("revisionId", "}"), encodeURIComponent(String(e.revisionId))),
                                    schemaPath: "/v1/assets/{assetId}/versions/{revisionId}",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, a)];
                            case 1:
                                return i = o.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return v(e)
                                })]
                        }
                    })
                })
            }, a.prototype.assetsGetAssetVersion = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.assetsGetAssetVersionRaw(e, t)];
                            case 1:
                                return [4, a.sent().value()];
                            case 2:
                                return [2, a.sent()]
                        }
                    })
                })
            }, a.prototype.assetsListAssetVersionsRaw = function(e, a) {
                return r(this, void 0, void 0, function() {
                    var s, r, i;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetsListAssetVersions.");
                                return s = {}, void 0 !== e.maxPageSize && (s.maxPageSize = e.maxPageSize), void 0 !== e.pageToken && (s.pageToken = e.pageToken), void 0 !== e.filter && (s.filter = e.filter), r = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}/versions".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/versions",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, a)];
                            case 1:
                                return i = o.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        assetVersions: (0, t.exists)(e, "assetVersions") ? null === e.assetVersions ? null : e.assetVersions.map(v) : void 0,
                                        nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
                                    }
                                })]
                        }
                    })
                })
            }, a.prototype.assetsListAssetVersions = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.assetsListAssetVersionsRaw(e, t)];
                            case 1:
                                return [4, a.sent().value()];
                            case 2:
                                return [2, a.sent()]
                        }
                    })
                })
            }, a.prototype.assetsRollbackAssetVersionRaw = function(e, a) {
                return r(this, void 0, void 0, function() {
                    var s, r, i;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetsRollbackAssetVersion.");
                                return s = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/assets/{assetId}/versions:rollback".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/versions:rollback",
                                    method: "POST",
                                    headers: r,
                                    query: s,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            assetVersion: e.assetVersion
                                        }
                                    }(e.rollbackAssetVersionRequest)
                                }, a)];
                            case 1:
                                return i = o.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return v(e)
                                })]
                        }
                    })
                })
            }, a.prototype.assetsRollbackAssetVersion = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.assetsRollbackAssetVersionRaw(e, t)];
                            case 1:
                                return [4, a.sent().value()];
                            case 2:
                                return [2, a.sent()]
                        }
                    })
                })
            }
        }(t.BaseAPI), function(e) {
            function a() {
                return null !== e && e.apply(this, arguments) || this
            }
            return s(a, e), a.prototype.assetsCreateAssetWithMultipartUploadRaw = function(e, a) {
                return r(this, void 0, void 0, function() {
                    var s, r, i;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return s = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/assets:multipartUpload",
                                    schemaPath: "/v1/assets:multipartUpload",
                                    method: "POST",
                                    headers: r,
                                    query: s,
                                    body: m(e.multipartUploadStartRequest)
                                }, a)];
                            case 1:
                                return i = o.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return y(e)
                                })]
                        }
                    })
                })
            }, a.prototype.assetsCreateAssetWithMultipartUpload = function() {
                return r(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), o(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.assetsCreateAssetWithMultipartUploadRaw(e, t)];
                            case 1:
                                return [4, a.sent().value()];
                            case 2:
                                return [2, a.sent()]
                        }
                    })
                })
            }, a.prototype.assetsMultipartUploadAbortRaw = function(e, a) {
                return r(this, void 0, void 0, function() {
                    var s, r, i;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.operationId || void 0 === e.operationId) throw new t.RequiredError("operationId", "Required parameter requestParameters.operationId was null or undefined when calling assetsMultipartUploadAbort.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/operations/{operationId}:multipartUpload".replace("{".concat("operationId", "}"), encodeURIComponent(String(e.operationId))),
                                    schemaPath: "/v1/operations/{operationId}:multipartUpload",
                                    method: "DELETE",
                                    headers: r,
                                    query: s
                                }, a)];
                            case 1:
                                return i = o.sent(), [2, new t.VoidApiResponse(i)]
                        }
                    })
                })
            }, a.prototype.assetsMultipartUploadAbort = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.assetsMultipartUploadAbortRaw(e, t)];
                            case 1:
                                return a.sent(), [2]
                        }
                    })
                })
            }, a.prototype.assetsMultipartUploadChunkCompleteRaw = function(e, a) {
                return r(this, void 0, void 0, function() {
                    var s, r, i;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.operationId || void 0 === e.operationId) throw new t.RequiredError("operationId", "Required parameter requestParameters.operationId was null or undefined when calling assetsMultipartUploadChunkComplete.");
                                return s = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/operations/{operationId}:multipartUploadChunkComplete".replace("{".concat("operationId", "}"), encodeURIComponent(String(e.operationId))),
                                    schemaPath: "/v1/operations/{operationId}:multipartUploadChunkComplete",
                                    method: "POST",
                                    headers: r,
                                    query: s,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            chunkNum: e.chunkNum,
                                            eTag: e.eTag
                                        }
                                    }(e.multipartUploadChunkCompleteRequest)
                                }, a)];
                            case 1:
                                return i = o.sent(), [2, new t.VoidApiResponse(i)]
                        }
                    })
                })
            }, a.prototype.assetsMultipartUploadChunkComplete = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.assetsMultipartUploadChunkCompleteRaw(e, t)];
                            case 1:
                                return a.sent(), [2]
                        }
                    })
                })
            }, a.prototype.assetsMultipartUploadCompleteRaw = function(e, a) {
                return r(this, void 0, void 0, function() {
                    var s, r, i;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.operationId || void 0 === e.operationId) throw new t.RequiredError("operationId", "Required parameter requestParameters.operationId was null or undefined when calling assetsMultipartUploadComplete.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/operations/{operationId}:multipartUploadComplete".replace("{".concat("operationId", "}"), encodeURIComponent(String(e.operationId))),
                                    schemaPath: "/v1/operations/{operationId}:multipartUploadComplete",
                                    method: "POST",
                                    headers: r,
                                    query: s
                                }, a)];
                            case 1:
                                return i = o.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return L(e)
                                })]
                        }
                    })
                })
            }, a.prototype.assetsMultipartUploadComplete = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.assetsMultipartUploadCompleteRaw(e, t)];
                            case 1:
                                return [4, a.sent().value()];
                            case 2:
                                return [2, a.sent()]
                        }
                    })
                })
            }, a.prototype.assetsUpdateAssetWithMultipartUploadRaw = function(e, a) {
                return r(this, void 0, void 0, function() {
                    var s, r, i;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetsUpdateAssetWithMultipartUpload.");
                                return s = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/assets/{assetId}:multipartUpload".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}:multipartUpload",
                                    method: "PATCH",
                                    headers: r,
                                    query: s,
                                    body: m(e.multipartUploadStartRequest)
                                }, a)];
                            case 1:
                                return i = o.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return y(e)
                                })]
                        }
                    })
                })
            }, a.prototype.assetsUpdateAssetWithMultipartUpload = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.assetsUpdateAssetWithMultipartUploadRaw(e, t)];
                            case 1:
                                return [4, a.sent().value()];
                            case 2:
                                return [2, a.sent()]
                        }
                    })
                })
            }, a
        }(t.BaseAPI)),
        S = function(e) {
            function a() {
                return null !== e && e.apply(this, arguments) || this
            }
            return s(a, e), a.prototype.assetsGetOperationRaw = function(e, a) {
                return r(this, void 0, void 0, function() {
                    var s, r, i;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.operationId || void 0 === e.operationId) throw new t.RequiredError("operationId", "Required parameter requestParameters.operationId was null or undefined when calling assetsGetOperation.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/operations/{operationId}".replace("{".concat("operationId", "}"), encodeURIComponent(String(e.operationId))),
                                    schemaPath: "/v1/operations/{operationId}",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, a)];
                            case 1:
                                return i = o.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return L(e)
                                })]
                        }
                    })
                })
            }, a.prototype.assetsGetOperation = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.assetsGetOperationRaw(e, t)];
                            case 1:
                                return [4, a.sent().value()];
                            case 2:
                                return [2, a.sent()]
                        }
                    })
                })
            }, a
        }(t.BaseAPI);
    (function(e) {
        function a() {
            return null !== e && e.apply(this, arguments) || this
        }
        s(a, e), a.prototype.usersListAssetQuotasRaw = function(e, a) {
            return r(this, void 0, void 0, function() {
                var s, r, i;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new t.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling usersListAssetQuotas.");
                            return s = {}, void 0 !== e.maxPageSize && (s.maxPageSize = e.maxPageSize), void 0 !== e.pageToken && (s.pageToken = e.pageToken), void 0 !== e.filter && (s.filter = e.filter), r = {}, [4, this.request({
                                path: "/v2/users/{userId}/asset-quotas".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                schemaPath: "/v2/users/{userId}/asset-quotas",
                                method: "GET",
                                headers: r,
                                query: s
                            }, a)];
                        case 1:
                            return i = o.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                return null == e ? e : {
                                    assetQuotas: (0, t.exists)(e, "assetQuotas") ? null === e.assetQuotas ? null : e.assetQuotas.map(h) : void 0,
                                    nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
                                }
                            })]
                    }
                })
            })
        }, a.prototype.usersListAssetQuotas = function(e, t) {
            return r(this, void 0, void 0, function() {
                return o(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.usersListAssetQuotasRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }
    })(t.BaseAPI), e.s(["AssetApi", 0, g, "AssetPrivacy", 0, {
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
        TextDocument: "TextDocument"
    }, "ModerationState", 0, {
        Unspecified: "Unspecified",
        Reviewing: "Reviewing",
        Rejected: "Rejected",
        Approved: "Approved"
    }, "MultipartUploadApi", 0, P, "PreviewFromJSON", 0, l, "UploadStatusApi", 0, S])
}]);

//# debugId=43e2f4bd-d05d-20ab-7154-3ff6e23c8cae
//# sourceMappingURL=15hfckikn1yw1.js.map