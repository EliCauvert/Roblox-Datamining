;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "fa734a9f-5868-bdae-831d-0456ea7d24f8")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 418162, 696564, e => {
    "use strict";
    var s, t, n, a = e.i(334561),
        o = e.i(697435),
        r = e.i(671376),
        i = e.i(759283),
        l = e.i(927868),
        u = e.i(949599),
        c = e.i(913893),
        A = e.i(814768),
        y = ((s = {})[s.Invalid = 0] = "Invalid", s[s.MarketplaceAndAllExperiences = 1] = "MarketplaceAndAllExperiences", s[s.ExperiencesAndDevAPIOnly = 2] = "ExperiencesAndDevAPIOnly", s[s.MarketplaceOnly = 3] = "MarketplaceOnly", s[s.MarketplaceAndExperiencesById = 4] = "MarketplaceAndExperiencesById", s),
        p = ((t = {})[t.Invalid = 0] = "Invalid", t[t.Marketplace = 1] = "Marketplace", t[t.InExperience = 2] = "InExperience", t),
        m = ((n = {}).Days3 = "Days3", n.Days7 = "Days7", n.Days14 = "Days14", n.Permanent = "Permanent", n);
    let d = Object.values(m),
        T = [],
        E = [],
        B = [],
        g = [];
    async function R() {
        if (T.length > 0 && E.length > 0) return;
        let e = await c.default.getAllowedAssetTypes(o.V1PermissionsItemTypesGetActionEnum.NUMBER_4, [o.V1PermissionsItemTypesGetTargetTypesEnum.NUMBER_0, o.V1PermissionsItemTypesGetTargetTypesEnum.NUMBER_1]);
        e.allowedAssetTypes && e.allowedAssetTypes.forEach(e => {
            T.push(e)
        }), e.allowedBundleTypes && e.allowedBundleTypes.forEach(e => {
            E.push((0, A.default)(e))
        })
    }
    async function f() {
        if (B.length > 0 && g.length > 0) return;
        let e = await c.default.getAllowedAssetTypes(o.V1PermissionsItemTypesGetActionEnum.NUMBER_5, [o.V1PermissionsItemTypesGetTargetTypesEnum.NUMBER_0, o.V1PermissionsItemTypesGetTargetTypesEnum.NUMBER_1]);
        e.allowedAssetTypes && e.allowedAssetTypes.forEach(e => {
            let s = e;
            "TshirtAccessory" === e && (s = "TShirtAccessory"), B.push(s)
        }), e.allowedBundleTypes && e.allowedBundleTypes.forEach(e => {
            g.push((0, A.default)(e))
        })
    }
    e.s(["DefaultMaxCollectiblePrice", 0, 0x3b9ac9ff, "DurationOptions", 0, d, "DurationOptionsEnum", () => m, "PUBLISHING_ADVANCE_THRESHOLD", 0, .3, "PurchasePlatformEnum", () => p, "SaleLocationEnum", () => y, "ValidTimedOptionsAssetTypes", 0, B, "ValidTimedOptionsBundleTypes", 0, g, "ValidWearTimeAssetTypes", 0, T, "ValidWearTimeBundleTypes", 0, E, "getValidTimedOptionsTypes", 0, f, "getValidWearTimeTypes", 0, R, "mapAssetTypeToString", 0, function(e) {
        switch (e) {
            case o.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_1:
                return r.Asset.Image.toString();
            case o.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_2:
                return r.Asset.TShirt.toString();
            case o.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_3:
                return r.Asset.Audio.toString();
            case o.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_4:
                return r.Asset.Mesh.toString();
            case o.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_8:
                return r.Asset.Hat.toString();
            case o.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_9:
                return r.Asset.Place.toString();
            case o.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_10:
                return r.Asset.Model.toString();
            case o.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_11:
                return r.Asset.Shirt.toString();
            case o.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_12:
                return r.Asset.Pants.toString();
            case o.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_13:
                return r.Asset.Decal.toString();
            case o.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_24:
                return r.Asset.Animation.toString();
            case o.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_38:
                return r.Asset.Plugin.toString();
            case o.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_40:
                return r.Asset.MeshPart.toString();
            case o.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_41:
                return r.Asset.HairAccessory.toString();
            case o.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_42:
                return r.Asset.FaceAccessory.toString();
            case o.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_43:
                return r.Asset.NeckAccessory.toString();
            case o.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_44:
                return r.Asset.ShoulderAccessory.toString();
            case o.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_45:
                return r.Asset.FrontAccessory.toString();
            case o.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_46:
                return r.Asset.BackAccessory.toString();
            case o.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_47:
                return r.Asset.WaistAccessory.toString();
            case o.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_61:
                return r.Asset.EmoteAnimation.toString();
            case o.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_62:
                return r.Asset.Video.toString();
            case o.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_64:
                return r.Asset.TShirtAccessory.toString();
            case o.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_65:
                return r.Asset.ShirtAccessory.toString();
            case o.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_66:
                return r.Asset.PantsAccessory.toString();
            case o.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_67:
                return r.Asset.JacketAccessory.toString();
            case o.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_68:
                return r.Asset.SweaterAccessory.toString();
            case o.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_69:
                return r.Asset.ShortsAccessory.toString();
            case o.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_72:
                return r.Asset.DressSkirtAccessory.toString();
            case o.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_73:
                return r.Asset.FontFamily.toString();
            case o.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_76:
                return r.Asset.EyebrowAccessory.toString();
            case o.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_77:
                return r.Asset.EyelashAccessory.toString();
            case o.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_88:
                return r.Asset.FaceMakeup.toString();
            case o.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_89:
                return r.Asset.LipMakeup.toString();
            case o.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_90:
                return r.Asset.EyeMakeup.toString();
            case o.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_92:
                return r.Asset.AvatarBackground.toString();
            default:
                return "Invalid"
        }
    }, "mapBundleTypeToString", 0, function(e) {
        switch (e) {
            case o.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum.NUMBER_1:
                return "Body";
            case o.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum.NUMBER_2:
                return "DynamicHead";
            case o.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum.NUMBER_3:
                return "Shoes";
            case o.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum.NUMBER_4:
                return "AvatarAnimations";
            default:
                return "Invalid"
        }
    }, "mapDurationToDays", 0, function(e) {
        switch (e) {
            case "Permanent":
            default:
                return 0;
            case "Days3":
                return 3;
            case "Days14":
                return 14;
            case "Days7":
                return 7
        }
    }, "mapDurationToEnum", 0, function(e) {
        switch (e) {
            case 3:
                return "Days3";
            case 7:
                return "Days7";
            case 14:
                return "Days14";
            default:
                return "Permanent"
        }
    }, "mapDurationToString", 0, function(e) {
        switch (e) {
            case "Permanent":
                return "Permanent";
            case "Days14":
                return "Days14";
            case "Days7":
                return "Days7";
            case "Days3":
                return "Days3";
            default:
                return ""
        }
    }, "mapSaleLocationToType", 0, function(e) {
        switch (e) {
            case 1:
                return o.RobloxItemConfigurationApiModelsRequestCollectiblesSaleLocationConfigurationModelSaleLocationTypeEnum.NUMBER_1;
            case 2:
                return o.RobloxItemConfigurationApiModelsRequestCollectiblesSaleLocationConfigurationModelSaleLocationTypeEnum.NUMBER_2;
            case 3:
                return o.RobloxItemConfigurationApiModelsRequestCollectiblesSaleLocationConfigurationModelSaleLocationTypeEnum.NUMBER_3;
            case 4:
                return o.RobloxItemConfigurationApiModelsRequestCollectiblesSaleLocationConfigurationModelSaleLocationTypeEnum.NUMBER_4;
            default:
                return o.RobloxItemConfigurationApiModelsRequestCollectiblesSaleLocationConfigurationModelSaleLocationTypeEnum.NUMBER_0
        }
    }], 696564);
    let M = {
            [r.Asset.Place]: {
                asset: r.Asset.Place,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_9
            },
            [r.Asset.TShirt]: {
                asset: r.Asset.TShirt,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_2
            },
            [r.Asset.Shirt]: {
                asset: r.Asset.Shirt,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_11
            },
            [r.Asset.Pants]: {
                asset: r.Asset.Pants,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_12
            },
            [r.Asset.Hat]: {
                asset: r.Asset.Hat,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_8
            },
            [r.Asset.HairAccessory]: {
                asset: r.Asset.HairAccessory,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_41
            },
            [r.Asset.FaceAccessory]: {
                asset: r.Asset.FaceAccessory,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_42
            },
            [r.Asset.NeckAccessory]: {
                asset: r.Asset.NeckAccessory,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_43
            },
            [r.Asset.ShoulderAccessory]: {
                asset: r.Asset.ShoulderAccessory,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_44
            },
            [r.Asset.FrontAccessory]: {
                asset: r.Asset.FrontAccessory,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_45
            },
            [r.Asset.BackAccessory]: {
                asset: r.Asset.BackAccessory,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_46
            },
            [r.Asset.WaistAccessory]: {
                asset: r.Asset.WaistAccessory,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_47
            },
            [r.Asset.TShirtAccessory]: {
                asset: r.Asset.TShirtAccessory,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_64
            },
            [r.Asset.ShirtAccessory]: {
                asset: r.Asset.ShirtAccessory,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_65
            },
            [r.Asset.PantsAccessory]: {
                asset: r.Asset.PantsAccessory,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_66
            },
            [r.Asset.JacketAccessory]: {
                asset: r.Asset.JacketAccessory,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_67
            },
            [r.Asset.SweaterAccessory]: {
                asset: r.Asset.SweaterAccessory,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_68
            },
            [r.Asset.ShortsAccessory]: {
                asset: r.Asset.ShortsAccessory,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_69
            },
            [r.Asset.DressSkirtAccessory]: {
                asset: r.Asset.DressSkirtAccessory,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_72
            },
            [r.Asset.EmoteAnimation]: {
                asset: r.Asset.EmoteAnimation,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_61
            },
            [r.Asset.AllCatalogAsset]: {
                asset: r.Asset.AllCatalogAsset,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [r.Asset.AvatarLooks]: {
                asset: r.Asset.AvatarLooks,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [r.Asset.Showcase]: {
                asset: r.Asset.Showcase,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [r.Asset.Decal]: {
                asset: r.Asset.Decal,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_13
            },
            [r.Asset.Image]: {
                asset: r.Asset.Image,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_1
            },
            [r.Asset.Audio]: {
                asset: r.Asset.Audio,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_3
            },
            [r.Asset.Model]: {
                asset: r.Asset.Model,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_10
            },
            [r.Asset.Mesh]: {
                asset: r.Asset.Mesh,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_4
            },
            [r.Asset.MeshPart]: {
                asset: r.Asset.MeshPart,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_40
            },
            [r.Asset.Plugin]: {
                asset: r.Asset.Plugin,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_38
            },
            [r.Asset.Animation]: {
                asset: r.Asset.Animation,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_24
            },
            [r.Asset.Video]: {
                asset: r.Asset.Video,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_62
            },
            [r.Asset.FontFamily]: {
                asset: r.Asset.FontFamily,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_73
            },
            [r.Asset.StorePreviewVideo]: {
                asset: r.Asset.StorePreviewVideo,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [r.Asset.GamePreviewVideo]: {
                asset: r.Asset.GamePreviewVideo,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [r.Asset.MyExperiences]: {
                asset: r.Asset.MyExperiences,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [r.Asset.SharedExperiences]: {
                asset: r.Asset.SharedExperiences,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [r.Asset.ShareLink]: {
                asset: r.Asset.ShareLink,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [r.Asset.Moments]: {
                asset: r.Asset.Moments,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [r.Asset.Event]: {
                asset: r.Asset.Event,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [r.Asset.UpcomingEvent]: {
                asset: r.Asset.UpcomingEvent,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [r.Asset.DraftEvent]: {
                asset: r.Asset.DraftEvent,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [r.Asset.PastEvent]: {
                asset: r.Asset.PastEvent,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [r.Asset.EyebrowAccessory]: {
                asset: r.Asset.EyebrowAccessory,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_76
            },
            [r.Asset.EyelashAccessory]: {
                asset: r.Asset.EyelashAccessory,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_77
            },
            [r.Asset.FaceMakeup]: {
                asset: r.Asset.FaceMakeup,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_88
            },
            [r.Asset.LipMakeup]: {
                asset: r.Asset.LipMakeup,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_89
            },
            [r.Asset.EyeMakeup]: {
                asset: r.Asset.EyeMakeup,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_90
            },
            [r.Asset.AvatarBackground]: {
                asset: r.Asset.AvatarBackground,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_92
            },
            [r.Asset.TextDocument]: {
                asset: r.Asset.TextDocument,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [r.Asset.AssetPermissionRequests]: {
                asset: r.Asset.AssetPermissionRequests,
                apiType: o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            }
        },
        b = e => {
            let s = Object.values(M).find(s => s.apiType === e);
            return null == s ? void 0 : s.asset
        },
        I = e => {
            switch (e) {
                case o.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum.NUMBER_0:
                    return u.BundleType.Unknown;
                case o.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum.NUMBER_1:
                    return u.BundleType.Body;
                case o.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum.NUMBER_2:
                    return u.BundleType.DynamicHead;
                case o.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum.NUMBER_3:
                    return u.BundleType.Shoes;
                case o.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum.NUMBER_4:
                    return u.BundleType.AvatarAnimations;
                default:
                    return u.BundleType.Unknown
            }
        },
        h = e => {
            switch (e) {
                case o.RobloxItemConfigurationApiModelsResponseBundleBundleInfoBundleTypeEnum.Unknown:
                    return u.BundleType.Unknown;
                case o.RobloxItemConfigurationApiModelsResponseBundleBundleInfoBundleTypeEnum.Body:
                    return u.BundleType.Body;
                case o.RobloxItemConfigurationApiModelsResponseBundleBundleInfoBundleTypeEnum.DynamicHead:
                    return u.BundleType.DynamicHead;
                case o.RobloxItemConfigurationApiModelsResponseBundleBundleInfoBundleTypeEnum.Shoes:
                    return u.BundleType.Shoes;
                case o.RobloxItemConfigurationApiModelsResponseBundleBundleInfoBundleTypeEnum.AvatarAnimations:
                    return u.BundleType.AvatarAnimations;
                default:
                    return u.BundleType.Unknown
            }
        };
    r.Asset.TShirt, r.Asset.Shirt, r.Asset.Pants;
    let S = new Set([r.Asset.TShirt, r.Asset.Pants, r.Asset.Shirt].map(e => e.toLowerCase())),
        C = (e, s) => {
            if (null == e) return !1;
            let t = e.status !== a.AgreementStatus.Active && e.status !== a.AgreementStatus.Accepted,
                n = null != e.endTime && e.endTime.getTime() <= s.getTime();
            return t || n
        };
    e.s(["getAgreementDisplayName", 0, e => {
        var s, t, n, a, o, r;
        return null != (s = null != (t = null != (n = null == e || null == (a = e.license) ? void 0 : a.name) ? n : null == e || null == (o = e.listing) ? void 0 : o.name) ? t : null == e || null == (r = e.license) ? void 0 : r.listingName) ? s : void 0
    }, "getAgreementWindow", 0, e => {
        var s, t;
        let n = null != (s = null == e ? void 0 : e.endTime) ? s : null;
        if (null != n) return {
            startTime: null != (t = null == e ? void 0 : e.startTime) ? t : null,
            endTime: n
        }
    }, "getConfigurePageUrl", 0, function(e, s) {
        return "/dashboard/creations/".concat(i.itemTypeToPath[e], "/").concat(s, "/configure")
    }, "getEffectiveAgreementWindow", 0, (e, s) => e ? {
        startTime: null != e.startTime ? new Date(Math.max(e.startTime.getTime(), s.getTime())) : null,
        endTime: e.endTime
    } : void 0, "getIsDurableType", 0, function(e, s) {
        if (void 0 !== e) {
            if ("number" == typeof e) {
                let s = b(e);
                return !!s && T.includes(s)
            }
            return T.includes(e)
        }
        if (void 0 !== s) {
            if ((0, l.isValidEnumValue)(o.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum, s)) return E.includes(I(s));
            if ((0, l.isValidEnumValue)(o.RobloxItemConfigurationApiModelsResponseBundleBundleInfoBundleTypeEnum, s)) return E.includes(h(s));
            if ((0, l.isValidEnumValue)(u.BundleType, s)) return E.includes(s)
        }
        return !1
    }, "getIsRentableType", 0, function(e, s) {
        if (void 0 !== e) {
            if ("number" == typeof e) {
                let s = b(e);
                return !!s && B.includes(s)
            }
            return B.includes(e)
        }
        if (void 0 !== s) {
            if ((0, l.isValidEnumValue)(o.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum, s)) return g.includes(I(s));
            if ((0, l.isValidEnumValue)(o.RobloxItemConfigurationApiModelsResponseBundleBundleInfoBundleTypeEnum, s)) return g.includes(h(s));
            if ((0, l.isValidEnumValue)(u.BundleType, s)) return g.includes(s)
        }
        return !1
    }, "getItemTypeChipIconSrc", 0, function(e, s) {
        let t = e.toLowerCase(),
            n = S.has(t) ? "".concat(t, "accessory") : t;
        return "".concat("".concat("https://assets.create.roblox.com/7b6474626e3f0ae883761c63d41addfbc2b59b9d/assets", "/unifiedFeeSystem"), "/").concat(s ? "".concat(n, ".svg") : "".concat(n, "_black.svg"))
    }, "getPublishPageUrl", 0, function(e, s) {
        return "/dashboard/creations/".concat(i.itemTypeToPath[e], "/").concat(s, "/publish")
    }, "getTaxonomyDisplayName", 0, function(e, s) {
        let t, n = s((t = e.replaceAll(/[^a-zA-Z0-9]/g, ""), "Label.Taxonomy".concat(t)));
        return null == n || "" === n ? e : n
    }, "isAgreementQuotaExceeded", 0, e => (null == e ? void 0 : e.revenueTargetsCount) != null && null != e.maxRevenueTargets && e.revenueTargetsCount >= e.maxRevenueTargets, "isAgreementSaleBlocked", 0, C, "isImmediateOnSaleAllowed", 0, (e, s) => null == e || e.status === a.AgreementStatus.Active && !C(e, s), "translateAssetType", 0, e => {
        var s, t;
        return null != (s = null == (t = M[e]) ? void 0 : t.apiType) ? s : o.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
    }, "translateAssetTypeToAsset", 0, b, "translateBundleDetailsToBundleInfoType", 0, e => {
        switch (e) {
            case o.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum.NUMBER_0:
                return o.RobloxItemConfigurationApiModelsResponseBundleBundleInfoBundleTypeEnum.Unknown;
            case o.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum.NUMBER_1:
                return o.RobloxItemConfigurationApiModelsResponseBundleBundleInfoBundleTypeEnum.Body;
            case o.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum.NUMBER_2:
                return o.RobloxItemConfigurationApiModelsResponseBundleBundleInfoBundleTypeEnum.DynamicHead;
            case o.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum.NUMBER_3:
                return o.RobloxItemConfigurationApiModelsResponseBundleBundleInfoBundleTypeEnum.Shoes;
            case o.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum.NUMBER_4:
                return o.RobloxItemConfigurationApiModelsResponseBundleBundleInfoBundleTypeEnum.AvatarAnimations;
            default:
                return o.RobloxItemConfigurationApiModelsResponseBundleBundleInfoBundleTypeEnum.Unknown
        }
    }, "translateBundleInfoTypeToBundleType", 0, h, "translateBundleTypeToBundleTypeString", 0, e => {
        switch (e) {
            case u.BundleType.Body:
                return "Body";
            case u.BundleType.DynamicHead:
                return "DynamicHead";
            case u.BundleType.Shoes:
                return "Shoes";
            case u.BundleType.AvatarAnimations:
                return "AvatarAnimations";
            case u.BundleType.Unknown:
            default:
                return "Unknown"
        }
    }], 418162)
}, 814768, 266213, 949599, e => {
    "use strict";
    var s, t, n = e.i(671376),
        a = e.i(475360),
        o = ((s = o || {}).Makeup = "Makeup", s.Avatar = "Avatar", s);
    e.s(["default", 0, o], 266213);
    var r = ((t = {})[t.Unknown = 0] = "Unknown", t[t.Body = 1] = "Body", t[t.DynamicHead = 2] = "DynamicHead", t[t.Shoes = 3] = "Shoes", t[t.AvatarAnimations = 4] = "AvatarAnimations", t);
    let i = {
            [n.Asset.HairAccessory]: "Label.Body",
            [n.Asset.TShirt]: "Label.Classic",
            [n.Asset.Hat]: "Label.Accessory",
            [n.Asset.TShirtAccessory]: "Label.Clothing",
            [n.Asset.EmoteAnimation]: "Label.Animation",
            [n.Asset.AllCatalogAsset]: "Label.Folder",
            [n.Asset.EyeMakeup]: "Label.Makeup"
        },
        l = {
            [n.Asset.HairAccessory]: [{
                assetType: n.Asset.HairAccessory,
                nameKey: "Label.HairAccessories"
            }, {
                itemType: a.Item.Bundle,
                id: 2,
                nameKey: "Label.Bodies",
                bundleType: 1
            }, {
                itemType: a.Item.Bundle,
                id: 2,
                nameKey: "Label.DynamicHeads",
                bundleType: 2
            }],
            [n.Asset.TShirt]: [{
                assetType: n.Asset.TShirt,
                nameKey: "Label.ClassicTShirts"
            }, {
                assetType: n.Asset.Shirt,
                nameKey: "Label.ClassicShirts"
            }, {
                assetType: n.Asset.Pants,
                nameKey: "Label.ClassicPants"
            }],
            [n.Asset.Hat]: [{
                assetType: n.Asset.Hat,
                nameKey: "Label.Hats"
            }, {
                assetType: n.Asset.HairAccessory,
                nameKey: "Label.HairAccessories"
            }, {
                assetType: n.Asset.FaceAccessory,
                nameKey: "Label.FaceAccessories"
            }, {
                assetType: n.Asset.NeckAccessory,
                nameKey: "Label.NeckAccessories"
            }, {
                assetType: n.Asset.ShoulderAccessory,
                nameKey: "Label.ShoulderAccessories"
            }, {
                assetType: n.Asset.FrontAccessory,
                nameKey: "Label.FrontAccessories"
            }, {
                assetType: n.Asset.BackAccessory,
                nameKey: "Label.BackAccessories"
            }, {
                assetType: n.Asset.WaistAccessory,
                nameKey: "Label.WaistAccessories"
            }],
            [n.Asset.TShirtAccessory]: [{
                assetType: n.Asset.TShirtAccessory,
                nameKey: "Label.TShirts"
            }, {
                assetType: n.Asset.ShirtAccessory,
                nameKey: "Label.Shirts"
            }, {
                assetType: n.Asset.PantsAccessory,
                nameKey: "Label.Pants"
            }, {
                assetType: n.Asset.JacketAccessory,
                nameKey: "Label.Jackets"
            }, {
                assetType: n.Asset.SweaterAccessory,
                nameKey: "Label.Sweaters"
            }, {
                assetType: n.Asset.ShortsAccessory,
                nameKey: "Label.ShortsAccessories"
            }, {
                assetType: n.Asset.DressSkirtAccessory,
                nameKey: "Label.Skirts"
            }, {
                itemType: a.Item.Bundle,
                nameKey: "Label.Shoes",
                bundleType: 3
            }],
            [n.Asset.EmoteAnimation]: [{
                assetType: n.Asset.EmoteAnimation,
                nameKey: "Label.Emote"
            }, {
                itemType: a.Item.Bundle,
                nameKey: "Label.AvatarAnimations",
                bundleType: 4
            }],
            [n.Asset.EyeMakeup]: [{
                assetType: n.Asset.EyeMakeup,
                nameKey: "Label.EyeMakeupAccessories"
            }, {
                assetType: n.Asset.LipMakeup,
                nameKey: "Label.LipMakeupAccessories"
            }, {
                assetType: n.Asset.FaceMakeup,
                nameKey: "Label.FaceMakeupAccessories"
            }, {
                assetType: n.Asset.EyebrowAccessory,
                nameKey: "Label.EyebrowAccessories"
            }, {
                assetType: n.Asset.EyelashAccessory,
                nameKey: "Label.EyelashAccessories"
            }, {
                lookType: o.Makeup,
                nameKey: "Label.Looks"
            }],
            [n.Asset.AvatarBackground]: [{
                assetType: n.Asset.AvatarBackground,
                nameKey: "Label.Backgrounds"
            }]
        },
        u = new Set([n.Asset.TShirtAccessory, n.Asset.PantsAccessory, n.Asset.SweaterAccessory]),
        c = [n.Asset.TShirtAccessory, n.Asset.ShirtAccessory, n.Asset.PantsAccessory, n.Asset.JacketAccessory, n.Asset.SweaterAccessory, n.Asset.ShortsAccessory, n.Asset.DressSkirtAccessory],
        A = [n.Asset.EyeMakeup, n.Asset.LipMakeup, n.Asset.FaceMakeup, n.Asset.EyebrowAccessory, n.Asset.EyelashAccessory],
        y = [n.Asset.Hat, n.Asset.HairAccessory, n.Asset.FaceAccessory, n.Asset.NeckAccessory, n.Asset.ShoulderAccessory, n.Asset.FrontAccessory, n.Asset.BackAccessory, n.Asset.WaistAccessory];
    e.s(["ACCESSORY_ASSET_TYPES", 0, y, "AvatarItemDropdownTitles", 0, i, "AvatarMenuMap", 0, l, "BundleType", () => r, "CLOTHING_ASSET_TYPES", 0, c, "FolderItemsApiLimit", 0, 30, "GetItemsByCreatorApiLimit", 0, 30, "MAKEUP_ASSET_TYPES", 0, A, "MaxItemsPerFolderAddRequest", 0, 50, "ORIGINAL_TIMED_OPTIONS_ASSET_TYPES", 0, u, "RecentsDropdownOption", 0, {
        nameKey: "Label.Recents",
        isRecents: !0
    }], 949599), e.s(["default", 0, e => {
        switch (e) {
            case "Body":
                return r.Body;
            case "DynamicHead":
                return r.DynamicHead;
            case "Shoes":
                return r.Shoes;
            case "AvatarAnimations":
                return r.AvatarAnimations;
            default:
                return r.Unknown
        }
    }], 814768)
}, 812141, e => {
    "use strict";
    var s = e.i(182012),
        t = e.i(157310);
    let n = {},
        a = e => ["folders", null != e ? e : null];
    e.s(["default", 0, function(e) {
        return (0, t.useQuery)({
            queryKey: ["metadata"],
            queryFn: async () => {
                try {
                    let s = await e.getCollectiblesMetadata();
                    return null != s ? s : n
                } catch (e) {
                    return n
                }
            }
        })
    }, "getFoldersQueryKey", 0, a, "useAddItemToFolderMutation", 0, function(e, t) {
        let {
            onSuccess: n,
            onError: a
        } = t;
        return (0, s.useMutation)({
            mutationFn: s => e.addItemToFolder(s.itemId, s.itemType, s.folderId),
            onSuccess: n,
            onError: a
        })
    }, "useCreateFolderMutation", 0, function(e, t) {
        let {
            onSuccess: n,
            onError: a
        } = t;
        return (0, s.useMutation)({
            mutationFn: s => e.createFolder(s.name, void 0, s.groupId),
            onSuccess: e => {
                var s;
                return n(null != (s = e.folderId) ? s : "")
            },
            onError: a
        })
    }, "useGetFolders", 0, function(e, s) {
        let n = !(arguments.length > 2) || void 0 === arguments[2] || arguments[2];
        return (0, t.useQuery)({
            queryKey: a(s),
            queryFn: () => e.getFolders(s),
            enabled: n
        })
    }, "useUpdateFolderMutation", 0, function(e, t) {
        let {
            onSuccess: n,
            onError: a
        } = t;
        return (0, s.useMutation)({
            mutationFn: s => e.updateFolder(s.folderId, s.name),
            onSuccess: n,
            onError: a
        })
    }])
}, 419959, e => {
    "use strict";
    var s = e.i(945146),
        t = e.i(690569),
        n = e.i(416340),
        a = e.i(251635),
        o = e.i(787802),
        r = e.i(176595),
        i = e.i(221628),
        l = e.i(946029),
        u = e.i(710302),
        c = e.i(236365),
        A = e.i(335527),
        y = e.i(894852),
        p = e.i(121880);

    function m(e) {
        return (0, t.g)("MuiFormGroup", e)
    }(0, o.g)("MuiFormGroup", ["root", "row", "error"]);
    let d = ["className", "row"],
        T = (0, a.s)("div", {
            name: "MuiFormGroup",
            slot: "Root",
            overridesResolver: (e, s) => {
                let {
                    ownerState: t
                } = e;
                return [s.root, t.row && s.row]
            }
        })(e => {
            let {
                ownerState: t
            } = e;
            return (0, s._)({
                display: "flex",
                flexDirection: "column",
                flexWrap: "wrap"
            }, t.row && {
                flexDirection: "row"
            })
        }),
        E = n.forwardRef(function(e, n) {
            let o = (0, p.u)({
                    props: e,
                    name: "MuiFormGroup"
                }),
                {
                    className: r,
                    row: l = !1
                } = o,
                u = (0, t._)(o, d),
                c = (0, A.u)(),
                E = (0, y.f)({
                    props: o,
                    muiFormControl: c,
                    states: ["error"]
                }),
                B = (0, s._)({}, o, {
                    row: l,
                    error: E.error
                }),
                g = (e => {
                    let {
                        classes: s,
                        row: t,
                        error: n
                    } = e;
                    return (0, a.a)({
                        root: ["root", t && "row", n && "error"]
                    }, m, s)
                })(B);
            return (0, i.jsx)(T, (0, s._)({
                className: (0, a.c)(g.root, r),
                ownerState: B,
                ref: n
            }, u))
        });
    var B = e.i(977987),
        g = e.i(634034),
        R = e.i(722417),
        f = e.i(352705);
    e.i(407110);
    var M = e.i(887833);

    function b(e) {
        return (0, t.g)("MuiRadioGroup", e)
    }(0, o.g)("MuiRadioGroup", ["root", "row", "error"]);
    let I = ["actions", "children", "className", "defaultValue", "name", "onChange", "value"],
        h = n.forwardRef(function(e, o) {
            let {
                actions: A,
                children: y,
                className: p,
                defaultValue: m,
                name: d,
                onChange: T,
                value: B
            } = e, g = (0, t._)(e, I), R = n.useRef(null), f = (e => {
                let {
                    classes: s,
                    row: t,
                    error: n
                } = e;
                return (0, a.a)({
                    root: ["root", t && "row", n && "error"]
                }, b, s)
            })(e), [M, h] = (0, l.u)({
                controlled: B,
                default: m,
                name: "RadioGroup"
            });
            n.useImperativeHandle(A, () => ({
                focus: () => {
                    let e = R.current.querySelector("input:not(:disabled):checked");
                    e || (e = R.current.querySelector("input:not(:disabled)")), e && e.focus()
                }
            }), []);
            let S = (0, u.u)(o, R),
                C = (0, c.u)(d),
                v = n.useMemo(() => ({
                    name: C,
                    onChange(e) {
                        h(e.target.value), T && T(e, e.target.value)
                    },
                    value: M
                }), [C, T, h, M]);
            return (0, i.jsx)(r.R.Provider, {
                value: v,
                children: (0, i.jsx)(E, (0, s._)({
                    role: "radiogroup",
                    ref: S,
                    className: (0, a.c)(f.root, p)
                }, g, {
                    children: y
                }))
            })
        });
    var S = (0, g.c)((0, i.jsx)("path", {
            d: "M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"
        }), "Star"),
        C = (0, g.c)((0, i.jsx)("path", {
            d: "M22 9.24l-7.19-.62L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21 12 17.27 18.18 21l-1.63-7.03L22 9.24zM12 15.4l-3.76 2.27 1-4.28-3.32-2.88 4.38-.38L12 6.1l1.71 4.04 4.38.38-3.32 2.88 1 4.28L12 15.4z"
        }), "StarBorder");

    function v(e) {
        return (0, t.g)("MuiRating", e)
    }
    var _ = (0, o.g)("MuiRating", ["root", "sizeSmall", "sizeMedium", "sizeLarge", "readOnly", "disabled", "focusVisible", "visuallyHidden", "pristine", "label", "labelEmptyValueActive", "icon", "iconEmpty", "iconFilled", "iconHover", "iconFocus", "iconActive", "decimal"]);
    let N = ["value"],
        x = ["className", "defaultValue", "disabled", "emptyIcon", "emptyLabelText", "getLabelText", "highlightSelectedOnly", "icon", "IconContainerComponent", "max", "name", "onChange", "onChangeActive", "onMouseLeave", "onMouseMove", "precision", "readOnly", "size", "value"];

    function U(e, s) {
        let t;
        return null == e ? e : Number((Math.round(e / s) * s).toFixed((t = s.toString().split(".")[1]) ? t.length : 0))
    }
    let D = (0, a.s)("span", {
            name: "MuiRating",
            slot: "Root",
            overridesResolver: (e, s) => {
                let {
                    ownerState: n
                } = e;
                return [{
                    ["& .".concat(_.visuallyHidden)]: s.visuallyHidden
                }, s.root, s["size".concat((0, t.a)(n.size))], n.readOnly && s.readOnly]
            }
        })(e => {
            let {
                theme: t,
                ownerState: n
            } = e;
            return (0, s._)({
                display: "inline-flex",
                position: "relative",
                fontSize: t.typography.pxToRem(24),
                color: "#faaf00",
                cursor: "pointer",
                textAlign: "left",
                width: "min-content",
                WebkitTapHighlightColor: "transparent",
                ["&.".concat(_.disabled)]: {
                    opacity: (t.vars || t).palette.action.disabledOpacity,
                    pointerEvents: "none"
                },
                ["&.".concat(_.focusVisible, " .").concat(_.iconActive)]: {
                    outline: "1px solid #999"
                },
                ["& .".concat(_.visuallyHidden)]: R.v
            }, "small" === n.size && {
                fontSize: t.typography.pxToRem(18)
            }, "large" === n.size && {
                fontSize: t.typography.pxToRem(30)
            }, n.readOnly && {
                pointerEvents: "none"
            })
        }),
        V = (0, a.s)("label", {
            name: "MuiRating",
            slot: "Label",
            overridesResolver: (e, s) => {
                let {
                    ownerState: t
                } = e;
                return [s.label, t.emptyValueFocused && s.labelEmptyValueActive]
            }
        })(e => {
            let {
                ownerState: t
            } = e;
            return (0, s._)({
                cursor: "inherit"
            }, t.emptyValueFocused && {
                top: 0,
                bottom: 0,
                position: "absolute",
                outline: "1px solid #999",
                width: "100%"
            })
        }),
        w = (0, a.s)("span", {
            name: "MuiRating",
            slot: "Icon",
            overridesResolver: (e, s) => {
                let {
                    ownerState: t
                } = e;
                return [s.icon, t.iconEmpty && s.iconEmpty, t.iconFilled && s.iconFilled, t.iconHover && s.iconHover, t.iconFocus && s.iconFocus, t.iconActive && s.iconActive]
            }
        })(e => {
            let {
                theme: t,
                ownerState: n
            } = e;
            return (0, s._)({
                display: "flex",
                transition: t.transitions.create("transform", {
                    duration: t.transitions.duration.shortest
                }),
                pointerEvents: "none"
            }, n.iconActive && {
                transform: "scale(1.2)"
            }, n.iconEmpty && {
                color: (t.vars || t).palette.action.disabled
            })
        }),
        L = (0, a.s)("span", {
            name: "MuiRating",
            slot: "Decimal",
            shouldForwardProp: e => (0, a.b)(e) && "iconActive" !== e,
            overridesResolver: (e, s) => {
                let {
                    iconActive: t
                } = e;
                return [s.decimal, t && s.iconActive]
            }
        })(e => {
            let {
                iconActive: t
            } = e;
            return (0, s._)({
                position: "relative"
            }, t && {
                transform: "scale(1.2)"
            })
        });

    function k(e) {
        let n = (0, t._)(e, N);
        return (0, i.jsx)("span", (0, s._)({}, n))
    }

    function F(e) {
        let {
            classes: t,
            disabled: o,
            emptyIcon: r,
            focus: l,
            getLabelText: u,
            highlightSelectedOnly: A,
            hover: y,
            icon: p,
            IconContainerComponent: m,
            isActive: d,
            itemValue: T,
            labelProps: E,
            name: B,
            onBlur: g,
            onChange: R,
            onClick: f,
            onFocus: M,
            readOnly: b,
            ownerState: I,
            ratingValue: h,
            ratingValueRounded: S
        } = e, C = A ? T === h : T <= h, v = T <= y, _ = T <= l, N = T === S, x = (0, c.u)(), U = (0, i.jsx)(w, {
            as: m,
            value: T,
            className: (0, a.c)(t.icon, C ? t.iconFilled : t.iconEmpty, v && t.iconHover, _ && t.iconFocus, d && t.iconActive),
            ownerState: (0, s._)({}, I, {
                iconEmpty: !C,
                iconFilled: C,
                iconHover: v,
                iconFocus: _,
                iconActive: d
            }),
            children: r && !C ? r : p
        });
        return b ? (0, i.jsx)("span", (0, s._)({}, E, {
            children: U
        })) : (0, i.jsxs)(n.Fragment, {
            children: [(0, i.jsxs)(V, (0, s._)({
                ownerState: (0, s._)({}, I, {
                    emptyValueFocused: void 0
                }),
                htmlFor: x
            }, E, {
                children: [U, (0, i.jsx)("span", {
                    className: t.visuallyHidden,
                    children: u(T)
                })]
            })), (0, i.jsx)("input", {
                className: t.visuallyHidden,
                onFocus: M,
                onBlur: g,
                onChange: R,
                onClick: f,
                disabled: o,
                value: T,
                id: x,
                type: "radio",
                name: B,
                checked: N
            })]
        })
    }
    let G = (0, i.jsx)(S, {
            fontSize: "inherit"
        }),
        P = (0, i.jsx)(C, {
            fontSize: "inherit"
        });

    function H(e) {
        return "".concat(e, " Star").concat(1 !== e ? "s" : "")
    }
    n.forwardRef(function(e, o) {
        let r = (0, p.u)({
                name: "MuiRating",
                props: e
            }),
            {
                className: A,
                defaultValue: y = null,
                disabled: m = !1,
                emptyIcon: d = P,
                emptyLabelText: T = "Empty",
                getLabelText: E = H,
                highlightSelectedOnly: g = !1,
                icon: R = G,
                IconContainerComponent: b = k,
                max: I = 5,
                name: h,
                onChange: S,
                onChangeActive: C,
                onMouseLeave: _,
                onMouseMove: N,
                precision: w = 1,
                readOnly: K = !1,
                size: O = "medium",
                value: j
            } = r,
            z = (0, t._)(r, x),
            q = (0, c.u)(h),
            [W, J] = (0, l.u)({
                controlled: j,
                default: y,
                name: "Rating"
            }),
            Y = U(W, w),
            Q = (0, B.u)(),
            [{
                hover: X,
                focus: Z
            }, $] = n.useState({
                hover: -1,
                focus: -1
            }),
            ee = Y; - 1 !== X && (ee = X), -1 !== Z && (ee = Z);
        let {
            isFocusVisibleRef: es,
            onBlur: et,
            onFocus: en,
            ref: ea
        } = (0, f.u)(), [eo, er] = n.useState(!1), ei = n.useRef(), el = (0, u.u)(ea, ei, o), eu = e => {
            let s = "" === e.target.value ? null : parseFloat(e.target.value); - 1 !== X && (s = X), J(s), S && S(e, s)
        }, ec = e => {
            0 === e.clientX && 0 === e.clientY || ($({
                hover: -1,
                focus: -1
            }), J(null), S && parseFloat(e.target.value) === Y && S(e, null))
        }, eA = e => {
            en(e), !0 === es.current && er(!0);
            let s = parseFloat(e.target.value);
            $(e => ({
                hover: e.hover,
                focus: s
            }))
        }, ey = e => {
            -1 === X && (et(e), !1 === es.current && er(!1), $(e => ({
                hover: e.hover,
                focus: -1
            })))
        }, [ep, em] = n.useState(!1), ed = (0, s._)({}, r, {
            defaultValue: y,
            disabled: m,
            emptyIcon: d,
            emptyLabelText: T,
            emptyValueFocused: ep,
            focusVisible: eo,
            getLabelText: E,
            icon: R,
            IconContainerComponent: b,
            max: I,
            precision: w,
            readOnly: K,
            size: O
        }), eT = (e => {
            let {
                classes: s,
                size: n,
                readOnly: o,
                disabled: r,
                emptyValueFocused: i,
                focusVisible: l
            } = e, u = {
                root: ["root", "size".concat((0, t.a)(n)), r && "disabled", l && "focusVisible", o && "readOnly"],
                label: ["label", "pristine"],
                labelEmptyValue: [i && "labelEmptyValueActive"],
                icon: ["icon"],
                iconEmpty: ["iconEmpty"],
                iconFilled: ["iconFilled"],
                iconHover: ["iconHover"],
                iconFocus: ["iconFocus"],
                iconActive: ["iconActive"],
                decimal: ["decimal"],
                visuallyHidden: ["visuallyHidden"]
            };
            return (0, a.a)(u, v, s)
        })(ed);
        return (0, i.jsxs)(D, (0, s._)({
            ref: el,
            onMouseMove: e => {
                N && N(e);
                let {
                    right: s,
                    left: t,
                    width: n
                } = ei.current.getBoundingClientRect(), a = U(I * (Q ? (s - e.clientX) / n : (e.clientX - t) / n) + w / 2, w);
                a = (0, M.c)(a, w, I), $(e => e.hover === a && e.focus === a ? e : {
                    hover: a,
                    focus: a
                }), er(!1), C && X !== a && C(e, a)
            },
            onMouseLeave: e => {
                _ && _(e), $({
                    hover: -1,
                    focus: -1
                }), C && -1 !== X && C(e, -1)
            },
            className: (0, a.c)(eT.root, A, K && "MuiRating-readOnly"),
            ownerState: ed,
            role: K ? "img" : null,
            "aria-label": K ? E(ee) : null
        }, z, {
            children: [Array.from(Array(I)).map((e, t) => {
                let n = t + 1,
                    o = {
                        classes: eT,
                        disabled: m,
                        emptyIcon: d,
                        focus: Z,
                        getLabelText: E,
                        highlightSelectedOnly: g,
                        hover: X,
                        icon: R,
                        IconContainerComponent: b,
                        name: q,
                        onBlur: ey,
                        onChange: eu,
                        onClick: ec,
                        onFocus: eA,
                        ratingValue: ee,
                        ratingValueRounded: Y,
                        readOnly: K,
                        ownerState: ed
                    },
                    r = n === Math.ceil(ee) && (-1 !== X || -1 !== Z);
                if (w < 1) {
                    let e = Array.from(Array(1 / w));
                    return (0, i.jsx)(L, {
                        className: (0, a.c)(eT.decimal, r && eT.iconActive),
                        ownerState: ed,
                        iconActive: r,
                        children: e.map((t, a) => {
                            let r = U(n - 1 + (a + 1) * w, w);
                            return (0, i.jsx)(F, (0, s._)({}, o, {
                                isActive: !1,
                                itemValue: r,
                                labelProps: {
                                    style: e.length - 1 === a ? {} : {
                                        width: r === ee ? (a + 1) * w * 100 + "%" : "0%",
                                        overflow: "hidden",
                                        position: "absolute"
                                    }
                                }
                            }), r)
                        })
                    }, n)
                }
                return (0, i.jsx)(F, (0, s._)({}, o, {
                    isActive: r,
                    itemValue: n
                }), n)
            }), !K && !m && (0, i.jsxs)(V, {
                className: (0, a.c)(eT.label, eT.labelEmptyValue),
                ownerState: ed,
                children: [(0, i.jsx)("input", {
                    className: eT.visuallyHidden,
                    value: "",
                    id: "".concat(q, "-empty"),
                    type: "radio",
                    name: q,
                    checked: null == Y,
                    onFocus: () => em(!0),
                    onBlur: () => em(!1),
                    onChange: eu
                }), (0, i.jsx)("span", {
                    className: eT.visuallyHidden,
                    children: T
                })]
            })]
        }))
    }), e.s(["RadioGroup", 0, h], 419959)
}, 270384, e => {
    "use strict";
    var s = e.i(690569),
        t = e.i(945146),
        n = e.i(416340),
        a = e.i(251635),
        o = e.i(787802),
        r = e.i(221628),
        i = e.i(396249),
        l = e.i(121880);

    function u(e) {
        return (0, s.g)("MuiDialogContentText", e)
    }(0, o.g)("MuiDialogContentText", ["root"]);
    let c = ["children", "className"],
        A = (0, a.s)(i.T, {
            shouldForwardProp: e => (0, a.r)(e) || "classes" === e,
            name: "MuiDialogContentText",
            slot: "Root",
            overridesResolver: (e, s) => s.root
        })({}),
        y = n.forwardRef(function(e, n) {
            let o = (0, l.u)({
                    props: e,
                    name: "MuiDialogContentText"
                }),
                {
                    className: i
                } = o,
                y = (0, s._)(o, c),
                p = (e => {
                    let {
                        classes: s
                    } = e, n = (0, a.a)({
                        root: ["root"]
                    }, u, s);
                    return (0, t._)({}, s, n)
                })(y);
            return (0, r.jsx)(A, (0, t._)({
                component: "p",
                variant: "body1",
                color: "text.secondary",
                ref: n,
                ownerState: y,
                className: (0, a.c)(p.root, i)
            }, o, {
                classes: p
            }))
        });
    e.s(["D", 0, y])
}, 59973, e => {
    "use strict";
    var s = e.i(270384);
    e.s(["DialogContentText", () => s.D])
}]);

//# debugId=fa734a9f-5868-bdae-831d-0456ea7d24f8
//# sourceMappingURL=3h4vftp5p3pl4.js.map