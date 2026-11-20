;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "4ed267fa-d94a-4ebf-5c34-3db13c5c729f")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 730530, e => {
    "use strict";
    let a = e => e;
    e.s(["i", 0, e => a(e), "q", 0, a, "t", 0, e => {
        let {
            translateHTML: a
        } = e;
        return (e, t, r) => {
            let {
                key: o
            } = e;
            return a(o, t, r)
        }
    }, "O", 0, e => {
        let {
            translate: a
        } = e;
        return (e, t) => {
            let {
                key: r
            } = e;
            return a(r, t)
        }
    }, "Q", 0, (e, a) => ({
        key: e,
        namespace: a
    }), "o", 0, e => ({
        key: e,
        namespace: void 0
    })])
}, 185915, e => {
    "use strict";
    e.s(["f", 0, function(e) {
        return e && "object" == typeof e && "response" in e ? e.response : e && "object" == typeof e && "json" in e ? e : null
    }])
}, 759283, 253536, e => {
    "use strict";
    var a = e.i(218701),
        t = e.i(307529),
        r = e.i(251622),
        o = e.i(260022);
    let n = "".concat((0, o.H)("global"), "/docs/reference/engine/classes/Player#GetJoinData"),
        s = (0, o.h)("developerArticleProductsInGamePurchasesUrl", "production", "global"),
        c = (0, o.h)("developerArticleBadgesSpecialGameAwardsUrl", "production", "global"),
        i = "".concat((0, o.H)("global"), "/docs/production/monetization/game-passes"),
        l = (0, o.h)("developerArticleCreateVipServerUrl", "production", "global"),
        d = "".concat((0, o.H)("global"), "/docs/production/publishing/publish-experiences-and-places#release-to-the-public"),
        g = "".concat((0, o.H)("global"), "/docs/projects/assets/privacy"),
        u = "".concat((0, o.H)("global"), "/docs/projects/assets/draft-status"),
        p = "".concat((0, o.H)("global"), "/docs/parts/models#distribute-models"),
        m = "".concat((0, o.H)("global"), "/docs/art/marketplace/publishing-to-marketplace#sale-location"),
        b = "".concat((0, o.H)("global"), "/docs/production/monetization/subscriptions#creating-subscriptions"),
        U = "".concat((0, o.H)("global"), "/docs/production/game-design/subscription-design#bundles"),
        A = "".concat((0, o.H)("global"), "/docs/production/monetization/subscriptions#earning-with-subscriptions"),
        h = (0, o.h)("robloxCommunityStandardsUrl", "production", "global"),
        y = "".concat((0, o.H)("global"), "/docs/art/marketplace/marketplace-policy#ugc-program-guidelines"),
        v = "".concat((0, o.H)("global"), "/docs/art/marketplace/marketplace-fees-and-commissions#publishing-advance"),
        f = "".concat((0, o.H)("global"), "/docs/production/publishing/account-verification");
    (0, o.H)("global"), (0, o.H)("global");
    let L = (0, o.h)("ugcSubscriptionTermsOfUseUrl", "production", "global"),
        P = (0, o.h)("robloxTermsOfUseUrl", "production", "global"),
        x = (0, o.h)("advertisingStandardsUrl", "production", "global"),
        C = "".concat((0, o.H)("global"), "/docs/production/publishing/account-verification"),
        S = "".concat((0, o.H)("global"), "/docs/production/monetization/avatar-creation-token");
    e.s(["F", 0, C, "U", 0, g, "L", 0, u, "j", 0, c, "M", 0, f, "Y", 0, s, "Z", 0, p, "e", 0, n, "P", 0, y, "T", 0, "https://about.roblox.com/newsroom/2025/09/roblox-moments-user-generated-discovery", "q", 0, i, "I", 0, l, "G", 0, v, "k", 0, d, "K", 0, x, "v", 0, h, "V", 0, P, "i", 0, m, "W", 0, A, "l", 0, U, "d", 0, b, "x", 0, L, "X", 0, S], 253536);
    let E = {
            [t.f.Place]: r.U.Game,
            [t.f.SharedExperiences]: r.U.Game,
            [t.f.MyExperiences]: r.U.Game,
            [t.f.ShareLink]: r.U.Game,
            [t.f.Moments]: r.U.Game,
            [t.f.TShirt]: r.U.CatalogAsset,
            [t.f.Shirt]: r.U.CatalogAsset,
            [t.f.Pants]: r.U.CatalogAsset,
            [t.f.Hat]: r.U.CatalogAsset,
            [t.f.HairAccessory]: r.U.CatalogAsset,
            [t.f.FaceAccessory]: r.U.CatalogAsset,
            [t.f.NeckAccessory]: r.U.CatalogAsset,
            [t.f.ShoulderAccessory]: r.U.CatalogAsset,
            [t.f.FrontAccessory]: r.U.CatalogAsset,
            [t.f.BackAccessory]: r.U.CatalogAsset,
            [t.f.WaistAccessory]: r.U.CatalogAsset,
            [t.f.TShirtAccessory]: r.U.CatalogAsset,
            [t.f.ShirtAccessory]: r.U.CatalogAsset,
            [t.f.PantsAccessory]: r.U.CatalogAsset,
            [t.f.JacketAccessory]: r.U.CatalogAsset,
            [t.f.SweaterAccessory]: r.U.CatalogAsset,
            [t.f.ShortsAccessory]: r.U.CatalogAsset,
            [t.f.DressSkirtAccessory]: r.U.CatalogAsset,
            [t.f.EmoteAnimation]: r.U.CatalogAsset,
            [t.f.EyebrowAccessory]: r.U.CatalogAsset,
            [t.f.EyelashAccessory]: r.U.CatalogAsset,
            [t.f.FaceMakeup]: r.U.CatalogAsset,
            [t.f.LipMakeup]: r.U.CatalogAsset,
            [t.f.EyeMakeup]: r.U.CatalogAsset,
            [t.f.AvatarBackground]: r.U.CatalogAsset,
            [t.f.AvatarLooks]: r.U.CatalogAsset,
            [t.f.Showcase]: r.U.CatalogAsset,
            [t.f.AllCatalogAsset]: r.U.CatalogAsset,
            [t.f.Decal]: r.U.LibraryAsset,
            [t.f.Image]: r.U.LibraryAsset,
            [t.f.Audio]: r.U.LibraryAsset,
            [t.f.Model]: r.U.LibraryAsset,
            [t.f.Mesh]: r.U.LibraryAsset,
            [t.f.MeshPart]: r.U.LibraryAsset,
            [t.f.Plugin]: r.U.LibraryAsset,
            [t.f.Animation]: r.U.LibraryAsset,
            [t.f.FontFamily]: r.U.LibraryAsset,
            [t.f.Video]: r.U.LibraryAsset,
            [t.f.Event]: r.U.Event,
            [t.f.PastEvent]: r.U.Event,
            [t.f.DraftEvent]: r.U.Event,
            [t.f.UpcomingEvent]: r.U.Event,
            [t.f.StorePreviewVideo]: r.U.LibraryAsset,
            [t.f.GamePreviewVideo]: r.U.LibraryAsset,
            [t.f.TextDocument]: r.U.LibraryAsset,
            [t.f.AssetPermissionRequests]: r.U.Game
        },
        k = {
            [r.U.Game]: "experiences",
            [r.U.CatalogAsset]: "catalog",
            [r.U.LibraryAsset]: "library",
            [r.U.Bundle]: "bundle",
            [r.U.Badge]: "badges",
            [r.U.GamePass]: "passes",
            [r.U.DeveloperProduct]: "developer-products",
            [r.U.TranslatorGame]: "experiences",
            [r.U.Places]: "places",
            [r.U.CreatedPlaces]: "places",
            [r.U.Event]: "events",
            [r.U.Notifications]: "notifications",
            [r.U.ExperienceSubscription]: "experience-subscriptions",
            [r.U.Advanced]: "advanced",
            [r.U.AvatarCreationToken]: "avatar-creation-tokens",
            [r.U.ReferralRewards]: "referral-reward-details",
            [r.U.Environment]: "environments",
            [r.U.Look]: "look",
            [r.U.Alert]: "alerts",
            [r.U.Journey]: "analytics/journeys",
            [r.U.DataCapture]: "data-captures"
        },
        M = {
            [r.U.Game]: a.V.gameIcon,
            [r.U.CatalogAsset]: a.V.assetThumbnail,
            [r.U.LibraryAsset]: a.V.assetThumbnail,
            [r.U.Bundle]: a.V.bundleThumbnail,
            [r.U.Badge]: a.V.badgeIcon,
            [r.U.GamePass]: a.V.gamePassIcon,
            [r.U.DeveloperProduct]: a.V.developerProductIcon,
            [r.U.TranslatorGame]: a.V.gameIcon,
            [r.U.Places]: a.V.placeIcon,
            [r.U.CreatedPlaces]: a.V.placeIcon,
            [r.U.Event]: a.V.universeThumbnail,
            [r.U.Notifications]: a.V.assetThumbnail,
            [r.U.ExperienceSubscription]: a.V.assetThumbnail,
            [r.U.Advanced]: a.V.assetThumbnail,
            [r.U.AvatarCreationToken]: a.V.bundleThumbnail,
            [r.U.ReferralRewards]: a.V.assetThumbnail,
            [r.U.Environment]: a.V.universeThumbnail,
            [r.U.Alert]: a.V.universeThumbnail,
            [r.U.Journey]: a.V.universeThumbnail,
            [r.U.DataCapture]: a.V.universeThumbnail,
            [r.U.Look]: a.V.assetThumbnail
        },
        G = {
            [r.U.Game]: a.X.AutoGenerated,
            [r.U.Bundle]: a.X.AutoGenerated,
            [r.U.CatalogAsset]: a.X.PlaceHolder,
            [r.U.LibraryAsset]: a.X.AutoGenerated,
            [r.U.Badge]: a.X.AutoGenerated,
            [r.U.GamePass]: a.X.AutoGenerated,
            [r.U.DeveloperProduct]: a.X.AutoGenerated,
            [r.U.TranslatorGame]: a.X.PlaceHolder,
            [r.U.Places]: a.X.AutoGenerated,
            [r.U.CreatedPlaces]: a.X.AutoGenerated,
            [r.U.Event]: a.X.PlaceHolder,
            [r.U.Notifications]: a.X.AutoGenerated,
            [r.U.ExperienceSubscription]: a.X.AutoGenerated,
            [r.U.Advanced]: a.X.AutoGenerated,
            [r.U.AvatarCreationToken]: a.X.AutoGenerated,
            [r.U.ReferralRewards]: a.X.AutoGenerated,
            [r.U.Environment]: a.X.AutoGenerated,
            [r.U.Look]: a.X.AutoGenerated,
            [r.U.Alert]: a.X.AutoGenerated,
            [r.U.Journey]: a.X.AutoGenerated,
            [r.U.DataCapture]: a.X.AutoGenerated
        },
        D = {
            [t.f.Place]: "Label.Games",
            [t.f.MyExperiences]: "Label.Games",
            [t.f.SharedExperiences]: "Label.Games",
            [t.f.TShirt]: "Label.TShirts",
            [t.f.Shirt]: "Label.Shirts",
            [t.f.Pants]: "Label.Pants",
            [t.f.Hat]: "Label.Hats",
            [t.f.HairAccessory]: "Label.HairAccessories",
            [t.f.FaceAccessory]: "Label.FaceAccessories",
            [t.f.NeckAccessory]: "Label.NeckAccessories",
            [t.f.ShoulderAccessory]: "Label.ShoulderAccessories",
            [t.f.FrontAccessory]: "Label.FrontAccessories",
            [t.f.BackAccessory]: "Label.BackAccessories",
            [t.f.WaistAccessory]: "Label.WaistAccessories",
            [t.f.TShirtAccessory]: "Label.TShirts",
            [t.f.ShirtAccessory]: "Label.Shirts",
            [t.f.PantsAccessory]: "Label.Pants",
            [t.f.JacketAccessory]: "Label.Jackets",
            [t.f.SweaterAccessory]: "Label.Sweaters",
            [t.f.ShortsAccessory]: "Label.ShortsAccessories",
            [t.f.DressSkirtAccessory]: "Label.Skirts",
            [t.f.EmoteAnimation]: "Label.Emote",
            [t.f.EyebrowAccessory]: "Label.EyebrowAccessories",
            [t.f.EyelashAccessory]: "Label.EyelashAccessories",
            [t.f.FaceMakeup]: "Label.FaceMakeupAccessories",
            [t.f.LipMakeup]: "Label.LipMakeupAccessories",
            [t.f.EyeMakeup]: "Label.EyeMakeupAccessories",
            [t.f.AvatarBackground]: "Label.Backgrounds",
            [t.f.AvatarLooks]: "Label.Avatars",
            [t.f.Showcase]: "Label.Showcases",
            [t.f.AllCatalogAsset]: "Label.AllAssetTypes",
            [t.f.Decal]: "Label.Decals",
            [t.f.Image]: "Label.Images",
            [t.f.Audio]: "Label.Audios",
            [t.f.Model]: "Label.Models",
            [t.f.Mesh]: "Label.Meshes",
            [t.f.MeshPart]: "Label.MeshParts",
            [t.f.Plugin]: "Label.Plugins",
            [t.f.FontFamily]: "Label.FontFamily",
            [t.f.Animation]: "Label.Animations",
            [t.f.Video]: "Label.Videos",
            [t.f.Event]: "Label.Events",
            [t.f.PastEvent]: "Label.PastEvents",
            [t.f.DraftEvent]: "Label.DraftEvents",
            [t.f.UpcomingEvent]: "Label.UpcomingEvents",
            [t.f.ShareLink]: "Label.ShareLinks",
            [t.f.Moments]: "Label.Moments",
            [t.f.StorePreviewVideo]: "Label.StorePreviewVideo",
            [t.f.GamePreviewVideo]: "Label.GamePreviewVideo",
            [t.f.TextDocument]: "Label.TextDocuments",
            [t.f.AssetPermissionRequests]: "Label.Requests"
        },
        z = {
            [t.f.Place]: "Label.Games",
            [t.f.MyExperiences]: "Label.Games",
            [t.f.SharedExperiences]: "Label.Games",
            [t.f.TShirt]: "Label.TShirt",
            [t.f.Shirt]: "Label.Shirt",
            [t.f.Pants]: "Label.Pants",
            [t.f.Hat]: "Label.Hat",
            [t.f.HairAccessory]: "Label.HairAccessory",
            [t.f.FaceAccessory]: "Label.FaceAccessory",
            [t.f.NeckAccessory]: "Label.NeckAccessory",
            [t.f.ShoulderAccessory]: "Label.ShoulderAccessory",
            [t.f.FrontAccessory]: "Label.FrontAccessory",
            [t.f.BackAccessory]: "Label.BackAccessory",
            [t.f.WaistAccessory]: "Label.WaistAccessory",
            [t.f.TShirtAccessory]: "Label.TShirt",
            [t.f.ShirtAccessory]: "Label.Shirt",
            [t.f.PantsAccessory]: "Label.Pants",
            [t.f.JacketAccessory]: "Label.Jacket",
            [t.f.SweaterAccessory]: "Label.Sweater",
            [t.f.ShortsAccessory]: "Label.ShortsAccessories",
            [t.f.DressSkirtAccessory]: "Label.Skirt",
            [t.f.EmoteAnimation]: "Label.Emote",
            [t.f.EyebrowAccessory]: "Label.EyebrowAccessory",
            [t.f.EyelashAccessory]: "Label.EyelashAccessory",
            [t.f.FaceMakeup]: "Label.FaceMakeup",
            [t.f.LipMakeup]: "Label.LipMakeup",
            [t.f.EyeMakeup]: "Label.EyeMAkeup",
            [t.f.AvatarBackground]: "Label.AvatarBackground",
            [t.f.AvatarLooks]: "Label.Avatars",
            [t.f.Showcase]: "Label.Showcase",
            [t.f.AllCatalogAsset]: "Label.AllAssetTypes",
            [t.f.Decal]: "Label.Decal",
            [t.f.Image]: "Label.Image",
            [t.f.Audio]: "Label.Audios",
            [t.f.Model]: "Label.Model",
            [t.f.Mesh]: "Label.Mesh",
            [t.f.MeshPart]: "Label.MeshPart",
            [t.f.Plugin]: "Label.Plugin",
            [t.f.Animation]: "Label.Animation",
            [t.f.FontFamily]: "Label.FontFamily",
            [t.f.Video]: "Label.Video",
            [t.f.Event]: "Label.Event",
            [t.f.PastEvent]: "Label.PastEvent",
            [t.f.DraftEvent]: "Label.DraftEvent",
            [t.f.UpcomingEvent]: "Label.UpcomingEvent",
            [t.f.ShareLink]: "Label.ShareLink",
            [t.f.Moments]: "Label.Moments",
            [t.f.StorePreviewVideo]: "Label.StorePreviewVideo",
            [t.f.GamePreviewVideo]: "Label.GamePreviewVideo",
            [t.f.TextDocument]: "Label.TextDocument",
            [t.f.AssetPermissionRequests]: "Label.Requests"
        },
        T = {
            [r.U.Game]: "Label.Games",
            [r.U.CatalogAsset]: "Label.AvatarItems",
            [r.U.Bundle]: "Label.AvatarItem",
            [r.U.LibraryAsset]: "Label.DevelopmentItems",
            [r.U.Badge]: "Label.Badges",
            [r.U.GamePass]: "Label.GamePasses",
            [r.U.DeveloperProduct]: "Label.DeveloperProducts",
            [r.U.TranslatorGame]: "Label.TranslatorGame",
            [r.U.Places]: "Label.Places",
            [r.U.CreatedPlaces]: "Label.Places",
            [r.U.Event]: "Label.Events",
            [r.U.Notifications]: "Label.Notifications",
            [r.U.ExperienceSubscription]: "Label.Subscriptions",
            [r.U.Advanced]: "Header.Title",
            [r.U.AvatarCreationToken]: "Label.AvatarCreationTokens",
            [r.U.ReferralRewards]: "Label.ReferralRewards",
            [r.U.Environment]: "Label.Environments",
            [r.U.Look]: "Label.Looks",
            [r.U.Alert]: "Heading.Alerts",
            [r.U.Journey]: "Heading.Journeys",
            [r.U.DataCapture]: "Heading.DataCaptures"
        },
        w = {
            [r.U.Game]: "Label.Game",
            [r.U.CatalogAsset]: "Label.AvatarItem",
            [r.U.Bundle]: "Label.AvatarItem",
            [r.U.LibraryAsset]: "Label.DevelopmentItem",
            [r.U.Badge]: "Label.Badge",
            [r.U.GamePass]: "Label.GamePass",
            [r.U.DeveloperProduct]: "Label.DeveloperProduct",
            [r.U.TranslatorGame]: "Label.TranslatorGame",
            [r.U.Places]: "Label.Place",
            [r.U.CreatedPlaces]: "Label.Places",
            [r.U.Event]: "Label.Event",
            [r.U.Notifications]: "Label.Notifications",
            [r.U.ExperienceSubscription]: "Label.Subscription",
            [r.U.Advanced]: "Header.Title",
            [r.U.AvatarCreationToken]: "Label.Token",
            [r.U.ReferralRewards]: "Label.ReferralRewards",
            [r.U.Environment]: "Label.Environment",
            [r.U.Look]: "Label.Looks",
            [r.U.Alert]: "Heading.Alert",
            [r.U.Journey]: "Heading.Journey",
            [r.U.DataCapture]: "Heading.DataCapture"
        },
        R = {
            [r.U.Game]: "Heading.Game",
            [r.U.CatalogAsset]: "Heading.AvatarItem",
            [r.U.Bundle]: "Heading.AvatarItem",
            [r.U.LibraryAsset]: "Heading.DevelopmentItem",
            [r.U.Badge]: "Heading.Badge",
            [r.U.GamePass]: "Heading.Pass",
            [r.U.DeveloperProduct]: "Heading.DeveloperProduct",
            [r.U.TranslatorGame]: "Heading.TranslatorGame",
            [r.U.Places]: "Heading.Place",
            [r.U.CreatedPlaces]: "Heading.Place",
            [r.U.Event]: "Heading.Event",
            [r.U.Notifications]: "Heading.Notifications.CreateContent",
            [r.U.ExperienceSubscription]: "Heading.Subscription",
            [r.U.Advanced]: "Header.Title",
            [r.U.AvatarCreationToken]: "Label.AvatarCreationToken",
            [r.U.ReferralRewards]: "Heading.ReferralRewards",
            [r.U.Environment]: "Heading.Environment",
            [r.U.Look]: "Heading.Looks",
            [r.U.Alert]: "Heading.Alert",
            [r.U.Journey]: "Heading.Journey",
            [r.U.DataCapture]: "Heading.DataCapture"
        },
        H = {
            [r.U.Game]: null,
            [r.U.CatalogAsset]: null,
            [r.U.Bundle]: null,
            [r.U.LibraryAsset]: null,
            [r.U.Badge]: "badges/create",
            [r.U.GamePass]: "passes/create",
            [r.U.DeveloperProduct]: "developer-products/create",
            [r.U.ReferralRewards]: "referral-reward-details/create",
            [r.U.TranslatorGame]: null,
            [r.U.Places]: null,
            [r.U.CreatedPlaces]: null,
            [r.U.Event]: "events/create",
            [r.U.Notifications]: null,
            [r.U.ExperienceSubscription]: "experience-subscriptions/create",
            [r.U.Advanced]: null,
            [r.U.AvatarCreationToken]: "avatar-creation-tokens/create",
            [r.U.Environment]: "environments/create",
            [r.U.Look]: "looks/create",
            [r.U.Alert]: "alerts/create",
            [r.U.Journey]: "analytics/journeys/create",
            [r.U.DataCapture]: "observability/data-captures/create"
        },
        B = {
            [r.U.Game]: null,
            [r.U.CatalogAsset]: null,
            [r.U.Bundle]: null,
            [r.U.LibraryAsset]: null,
            [r.U.Badge]: "badges/reorder",
            [r.U.ReferralRewards]: null,
            [r.U.GamePass]: null,
            [r.U.DeveloperProduct]: null,
            [r.U.TranslatorGame]: null,
            [r.U.Places]: null,
            [r.U.CreatedPlaces]: null,
            [r.U.Event]: null,
            [r.U.Notifications]: null,
            [r.U.ExperienceSubscription]: null,
            [r.U.Advanced]: null,
            [r.U.AvatarCreationToken]: null,
            [r.U.Environment]: null,
            [r.U.Look]: null,
            [r.U.Alert]: null,
            [r.U.Journey]: null,
            [r.U.DataCapture]: null
        },
        I = {
            [r.U.Badge]: c,
            [r.U.DeveloperProduct]: s,
            [r.U.GamePass]: i,
            [r.U.CatalogAsset]: m,
            [r.U.ExperienceSubscription]: b,
            [r.U.AvatarCreationToken]: S,
            [r.U.Look]: void 0
        };
    e.s(["l", 0, "rejected", "Z", 0, "fulfilled", "M", 0, D, "K", 0, E, "b", 0, z, "w", 0, T, "r", 0, H, "n", 0, I, "m", 0, w, "e", 0, k, "Y", 0, B, "I", 0, G, "x", 0, R, "j", 0, M, "A", 0, 3e3, "h", 0, -1], 759283)
}, 307529, e => {
    "use strict";
    var a, t = ((a = t || {}).Place = "Place", a.MyExperiences = "MyExperiences", a.SharedExperiences = "SharedExperiences", a.TShirt = "TShirt", a.Shirt = "Shirt", a.Pants = "Pants", a.Hat = "Hat", a.HairAccessory = "HairAccessory", a.FaceAccessory = "FaceAccessory", a.NeckAccessory = "NeckAccessory", a.ShoulderAccessory = "ShoulderAccessory", a.FrontAccessory = "FrontAccessory", a.BackAccessory = "BackAccessory", a.WaistAccessory = "WaistAccessory", a.TShirtAccessory = "TShirtAccessory", a.ShirtAccessory = "ShirtAccessory", a.PantsAccessory = "PantsAccessory", a.JacketAccessory = "JacketAccessory", a.SweaterAccessory = "SweaterAccessory", a.ShortsAccessory = "ShortsAccessory", a.DressSkirtAccessory = "DressSkirtAccessory", a.EyebrowAccessory = "EyebrowAccessory", a.EyelashAccessory = "EyelashAccessory", a.FaceMakeup = "FaceMakeup", a.LipMakeup = "LipMakeup", a.EyeMakeup = "EyeMakeup", a.AvatarBackground = "AvatarBackground", a.AvatarLooks = "AvatarLooks", a.Showcase = "Showcase", a.Decal = "Decal", a.Image = "Image", a.Audio = "Audio", a.Model = "Model", a.Mesh = "Mesh", a.MeshPart = "MeshPart", a.Plugin = "Plugin", a.EmoteAnimation = "EmoteAnimation", a.Animation = "Animation", a.Video = "Video", a.TextDocument = "TextDocument", a.Event = "Event", a.UpcomingEvent = "UpcomingEvent", a.DraftEvent = "DraftEvent", a.PastEvent = "PastEvent", a.FontFamily = "FontFamily", a.ShareLink = "ShareLink", a.Moments = "Moments", a.StorePreviewVideo = "StorePreviewVideo", a.GamePreviewVideo = "GamePreviewVideo", a.AllCatalogAsset = "All", a.AssetPermissionRequests = "AssetPermissionRequests", a);
    e.s(["f", 0, t])
}, 251622, e => {
    "use strict";
    var a, t = ((a = t || {}).Game = "Game", a.Bundle = "Bundle", a.CatalogAsset = "CatalogAsset", a.LibraryAsset = "LibraryAsset", a.GamePass = "Pass", a.Badge = "Badge", a.DeveloperProduct = "DeveloperProduct", a.TranslatorGame = "TranslatorGame", a.Places = "Places", a.CreatedPlaces = "CreatedPlaces", a.Event = "Event", a.Notifications = "Notifications", a.ExperienceSubscription = "Subscription", a.Advanced = "Advanced", a.AvatarCreationToken = "AvatarCreationToken", a.ReferralRewards = "ReferralRewards", a.Environment = "Environment", a.Look = "Look", a.Alert = "Alert", a.Journey = "Journey", a.DataCapture = "DataCapture", a);
    let r = Object.values(t);
    e.s(["U", 0, t, "T", 0, e => r.includes(e)])
}, 726474, e => {
    "use strict";
    var a = e.i(894432),
        t = e.i(307529),
        r = e.i(251622);
    let o = "".concat("https://create.roblox.com", "/store"),
        n = "".concat("https://create.roblox.com", "/docs"),
        s = {
            [a.C.Model]: "models",
            [a.C.Plugin]: "plugins",
            [a.C.Audio]: "audio",
            [a.C.FontFamily]: "fonts",
            [a.C.Decal]: "decals",
            [a.C.MeshPart]: "meshParts",
            [a.C.Video]: "videos",
            [a.C.Animation]: "",
            [a.C.Music]: "",
            [a.C.SoundEffect]: "",
            [a.C.UnknownAudio]: "",
            [a.C.Package]: "",
            [a.C.SharedPackage]: ""
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
                    case r.U.Game:
                        return i.getConfigureExperienceUrl(e);
                    case r.U.Bundle:
                        return i.getConfigureBundlePath(e);
                    case r.U.CatalogAsset:
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
                let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : t.f.TShirt;
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
            getMonetizationImmersiveAdsEditPlacementUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/monetization/immersive-ads/placements/").concat(a, "/edit"),
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
            getPlayerSupportUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/player-support").concat(a ? "/".concat(a) : ""),
            getComputeFunctionsUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/compute-functions").concat(null != a ? "?assetId=".concat(a) : ""),
            getCreateComputeFunctionUrl: e => "/dashboard/creations/experiences/".concat(e, "/compute-functions/create-compute-function"),
            getComputeFunctionInvocationsUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/compute-functions/").concat(a, "/invocations"),
            getComputeFunctionInvocationLogsUrl: (e, a, t) => "/dashboard/creations/experiences/".concat(e, "/compute-functions/").concat(a, "/invocations/").concat(encodeURIComponent(t))
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
        getTemporaryLimitsUrl: () => "".concat(n, "/ui/temporary-limits"),
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
        getPublishGamesUrl: () => "".concat(n, "/production/publishing/publish-games-and-places#publish-games"),
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
        getExperimentationTargetedValuesUrl: () => "".concat(n, "/production/experiments#how-roblox-resolves-targeted-values"),
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
}]);

//# debugId=4ed267fa-d94a-4ebf-5c34-3db13c5c729f
//# sourceMappingURL=23336g9ye65f_.js.map