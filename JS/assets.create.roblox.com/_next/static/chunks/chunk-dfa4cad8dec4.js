;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "4715e7f4-5346-4b16-fbde-40823e941922")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 696564, e => {
    "use strict";
    var s, t, n, a = e.i(155743),
        o = e.i(913893),
        r = e.i(671376),
        i = e.i(814768),
        l = ((s = {})[s.Invalid = 0] = "Invalid", s[s.MarketplaceAndAllExperiences = 1] = "MarketplaceAndAllExperiences", s[s.ExperiencesAndDevAPIOnly = 2] = "ExperiencesAndDevAPIOnly", s[s.MarketplaceOnly = 3] = "MarketplaceOnly", s[s.MarketplaceAndExperiencesById = 4] = "MarketplaceAndExperiencesById", s),
        u = ((t = {})[t.Invalid = 0] = "Invalid", t[t.Marketplace = 1] = "Marketplace", t[t.InExperience = 2] = "InExperience", t),
        A = ((n = {}).Days3 = "Days3", n.Days7 = "Days7", n.Days14 = "Days14", n.Permanent = "Permanent", n);
    let c = Object.values(A),
        y = [],
        p = [],
        m = [],
        d = [];
    async function T() {
        if (y.length > 0 && p.length > 0) return;
        let e = await o.default.getAllowedAssetTypes(a.V1PermissionsItemTypesGetActionEnum.NUMBER_4, [a.V1PermissionsItemTypesGetTargetTypesEnum.NUMBER_0, a.V1PermissionsItemTypesGetTargetTypesEnum.NUMBER_1]);
        e.allowedAssetTypes && e.allowedAssetTypes.forEach(e => {
            y.push(e)
        }), e.allowedBundleTypes && e.allowedBundleTypes.forEach(e => {
            p.push((0, i.default)(e))
        })
    }
    async function E() {
        if (m.length > 0 && d.length > 0) return;
        let e = await o.default.getAllowedAssetTypes(a.V1PermissionsItemTypesGetActionEnum.NUMBER_5, [a.V1PermissionsItemTypesGetTargetTypesEnum.NUMBER_0, a.V1PermissionsItemTypesGetTargetTypesEnum.NUMBER_1]);
        e.allowedAssetTypes && e.allowedAssetTypes.forEach(e => {
            let s = e;
            "TshirtAccessory" === e && (s = "TShirtAccessory"), m.push(s)
        }), e.allowedBundleTypes && e.allowedBundleTypes.forEach(e => {
            d.push((0, i.default)(e))
        })
    }
    e.s(["DefaultMaxCollectiblePrice", 0, 0x3b9ac9ff, "DurationOptions", 0, c, "DurationOptionsEnum", () => A, "PUBLISHING_ADVANCE_THRESHOLD", 0, .3, "PurchasePlatformEnum", () => u, "SaleLocationEnum", () => l, "ValidTimedOptionsAssetTypes", 0, m, "ValidTimedOptionsBundleTypes", 0, d, "ValidWearTimeAssetTypes", 0, y, "ValidWearTimeBundleTypes", 0, p, "getValidTimedOptionsTypes", 0, E, "getValidWearTimeTypes", 0, T, "mapAssetTypeToString", 0, function(e) {
        switch (e) {
            case a.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_1:
                return r.Asset.Image.toString();
            case a.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_2:
                return r.Asset.TShirt.toString();
            case a.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_3:
                return r.Asset.Audio.toString();
            case a.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_4:
                return r.Asset.Mesh.toString();
            case a.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_8:
                return r.Asset.Hat.toString();
            case a.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_9:
                return r.Asset.Place.toString();
            case a.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_10:
                return r.Asset.Model.toString();
            case a.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_11:
                return r.Asset.Shirt.toString();
            case a.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_12:
                return r.Asset.Pants.toString();
            case a.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_13:
                return r.Asset.Decal.toString();
            case a.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_24:
                return r.Asset.Animation.toString();
            case a.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_38:
                return r.Asset.Plugin.toString();
            case a.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_40:
                return r.Asset.MeshPart.toString();
            case a.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_41:
                return r.Asset.HairAccessory.toString();
            case a.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_42:
                return r.Asset.FaceAccessory.toString();
            case a.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_43:
                return r.Asset.NeckAccessory.toString();
            case a.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_44:
                return r.Asset.ShoulderAccessory.toString();
            case a.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_45:
                return r.Asset.FrontAccessory.toString();
            case a.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_46:
                return r.Asset.BackAccessory.toString();
            case a.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_47:
                return r.Asset.WaistAccessory.toString();
            case a.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_61:
                return r.Asset.EmoteAnimation.toString();
            case a.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_62:
                return r.Asset.Video.toString();
            case a.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_64:
                return r.Asset.TShirtAccessory.toString();
            case a.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_65:
                return r.Asset.ShirtAccessory.toString();
            case a.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_66:
                return r.Asset.PantsAccessory.toString();
            case a.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_67:
                return r.Asset.JacketAccessory.toString();
            case a.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_68:
                return r.Asset.SweaterAccessory.toString();
            case a.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_69:
                return r.Asset.ShortsAccessory.toString();
            case a.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_72:
                return r.Asset.DressSkirtAccessory.toString();
            case a.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_73:
                return r.Asset.FontFamily.toString();
            case a.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_76:
                return r.Asset.EyebrowAccessory.toString();
            case a.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_77:
                return r.Asset.EyelashAccessory.toString();
            case a.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_88:
                return r.Asset.FaceMakeup.toString();
            case a.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_89:
                return r.Asset.LipMakeup.toString();
            case a.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_90:
                return r.Asset.EyeMakeup.toString();
            case a.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_92:
                return r.Asset.AvatarBackground.toString();
            default:
                return "Invalid"
        }
    }, "mapBundleTypeToString", 0, function(e) {
        switch (e) {
            case a.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum.NUMBER_1:
                return "Body";
            case a.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum.NUMBER_2:
                return "DynamicHead";
            case a.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum.NUMBER_3:
                return "Shoes";
            case a.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum.NUMBER_4:
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
                return a.RobloxItemConfigurationApiModelsRequestCollectiblesSaleLocationConfigurationModelSaleLocationTypeEnum.NUMBER_1;
            case 2:
                return a.RobloxItemConfigurationApiModelsRequestCollectiblesSaleLocationConfigurationModelSaleLocationTypeEnum.NUMBER_2;
            case 3:
                return a.RobloxItemConfigurationApiModelsRequestCollectiblesSaleLocationConfigurationModelSaleLocationTypeEnum.NUMBER_3;
            case 4:
                return a.RobloxItemConfigurationApiModelsRequestCollectiblesSaleLocationConfigurationModelSaleLocationTypeEnum.NUMBER_4;
            default:
                return a.RobloxItemConfigurationApiModelsRequestCollectiblesSaleLocationConfigurationModelSaleLocationTypeEnum.NUMBER_0
        }
    }])
}, 418162, e => {
    "use strict";
    var s = e.i(517290),
        t = e.i(155743),
        n = e.i(671376),
        a = e.i(759283),
        o = e.i(927868),
        r = e.i(949599),
        i = e.i(696564);
    let l = {
            [n.Asset.Place]: {
                asset: n.Asset.Place,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_9
            },
            [n.Asset.TShirt]: {
                asset: n.Asset.TShirt,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_2
            },
            [n.Asset.Shirt]: {
                asset: n.Asset.Shirt,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_11
            },
            [n.Asset.Pants]: {
                asset: n.Asset.Pants,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_12
            },
            [n.Asset.Hat]: {
                asset: n.Asset.Hat,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_8
            },
            [n.Asset.HairAccessory]: {
                asset: n.Asset.HairAccessory,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_41
            },
            [n.Asset.FaceAccessory]: {
                asset: n.Asset.FaceAccessory,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_42
            },
            [n.Asset.NeckAccessory]: {
                asset: n.Asset.NeckAccessory,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_43
            },
            [n.Asset.ShoulderAccessory]: {
                asset: n.Asset.ShoulderAccessory,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_44
            },
            [n.Asset.FrontAccessory]: {
                asset: n.Asset.FrontAccessory,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_45
            },
            [n.Asset.BackAccessory]: {
                asset: n.Asset.BackAccessory,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_46
            },
            [n.Asset.WaistAccessory]: {
                asset: n.Asset.WaistAccessory,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_47
            },
            [n.Asset.TShirtAccessory]: {
                asset: n.Asset.TShirtAccessory,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_64
            },
            [n.Asset.ShirtAccessory]: {
                asset: n.Asset.ShirtAccessory,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_65
            },
            [n.Asset.PantsAccessory]: {
                asset: n.Asset.PantsAccessory,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_66
            },
            [n.Asset.JacketAccessory]: {
                asset: n.Asset.JacketAccessory,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_67
            },
            [n.Asset.SweaterAccessory]: {
                asset: n.Asset.SweaterAccessory,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_68
            },
            [n.Asset.ShortsAccessory]: {
                asset: n.Asset.ShortsAccessory,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_69
            },
            [n.Asset.DressSkirtAccessory]: {
                asset: n.Asset.DressSkirtAccessory,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_72
            },
            [n.Asset.EmoteAnimation]: {
                asset: n.Asset.EmoteAnimation,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_61
            },
            [n.Asset.AllCatalogAsset]: {
                asset: n.Asset.AllCatalogAsset,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [n.Asset.AvatarLooks]: {
                asset: n.Asset.AvatarLooks,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [n.Asset.Showcase]: {
                asset: n.Asset.Showcase,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [n.Asset.Decal]: {
                asset: n.Asset.Decal,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_13
            },
            [n.Asset.Image]: {
                asset: n.Asset.Image,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_1
            },
            [n.Asset.Audio]: {
                asset: n.Asset.Audio,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_3
            },
            [n.Asset.Model]: {
                asset: n.Asset.Model,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_10
            },
            [n.Asset.Mesh]: {
                asset: n.Asset.Mesh,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_4
            },
            [n.Asset.MeshPart]: {
                asset: n.Asset.MeshPart,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_40
            },
            [n.Asset.Plugin]: {
                asset: n.Asset.Plugin,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_38
            },
            [n.Asset.Animation]: {
                asset: n.Asset.Animation,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_24
            },
            [n.Asset.Video]: {
                asset: n.Asset.Video,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_62
            },
            [n.Asset.FontFamily]: {
                asset: n.Asset.FontFamily,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_73
            },
            [n.Asset.StorePreviewVideo]: {
                asset: n.Asset.StorePreviewVideo,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [n.Asset.GamePreviewVideo]: {
                asset: n.Asset.GamePreviewVideo,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [n.Asset.MyExperiences]: {
                asset: n.Asset.MyExperiences,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [n.Asset.SharedExperiences]: {
                asset: n.Asset.SharedExperiences,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [n.Asset.ShareLink]: {
                asset: n.Asset.ShareLink,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [n.Asset.Moments]: {
                asset: n.Asset.Moments,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [n.Asset.Event]: {
                asset: n.Asset.Event,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [n.Asset.UpcomingEvent]: {
                asset: n.Asset.UpcomingEvent,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [n.Asset.DraftEvent]: {
                asset: n.Asset.DraftEvent,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [n.Asset.PastEvent]: {
                asset: n.Asset.PastEvent,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [n.Asset.EyebrowAccessory]: {
                asset: n.Asset.EyebrowAccessory,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_76
            },
            [n.Asset.EyelashAccessory]: {
                asset: n.Asset.EyelashAccessory,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_77
            },
            [n.Asset.FaceMakeup]: {
                asset: n.Asset.FaceMakeup,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_88
            },
            [n.Asset.LipMakeup]: {
                asset: n.Asset.LipMakeup,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_89
            },
            [n.Asset.EyeMakeup]: {
                asset: n.Asset.EyeMakeup,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_90
            },
            [n.Asset.AvatarBackground]: {
                asset: n.Asset.AvatarBackground,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_92
            },
            [n.Asset.TextDocument]: {
                asset: n.Asset.TextDocument,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [n.Asset.AssetPermissionRequests]: {
                asset: n.Asset.AssetPermissionRequests,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            }
        },
        u = e => {
            let s = Object.values(l).find(s => s.apiType === e);
            return null == s ? void 0 : s.asset
        },
        A = e => {
            switch (e) {
                case t.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum.NUMBER_0:
                    return r.BundleType.Unknown;
                case t.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum.NUMBER_1:
                    return r.BundleType.Body;
                case t.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum.NUMBER_2:
                    return r.BundleType.DynamicHead;
                case t.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum.NUMBER_3:
                    return r.BundleType.Shoes;
                case t.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum.NUMBER_4:
                    return r.BundleType.AvatarAnimations;
                default:
                    return r.BundleType.Unknown
            }
        },
        c = e => {
            switch (e) {
                case t.RobloxItemConfigurationApiModelsResponseBundleBundleInfoBundleTypeEnum.Unknown:
                    return r.BundleType.Unknown;
                case t.RobloxItemConfigurationApiModelsResponseBundleBundleInfoBundleTypeEnum.Body:
                    return r.BundleType.Body;
                case t.RobloxItemConfigurationApiModelsResponseBundleBundleInfoBundleTypeEnum.DynamicHead:
                    return r.BundleType.DynamicHead;
                case t.RobloxItemConfigurationApiModelsResponseBundleBundleInfoBundleTypeEnum.Shoes:
                    return r.BundleType.Shoes;
                case t.RobloxItemConfigurationApiModelsResponseBundleBundleInfoBundleTypeEnum.AvatarAnimations:
                    return r.BundleType.AvatarAnimations;
                default:
                    return r.BundleType.Unknown
            }
        };
    n.Asset.TShirt, n.Asset.Shirt, n.Asset.Pants;
    let y = new Set([n.Asset.TShirt, n.Asset.Pants, n.Asset.Shirt].map(e => e.toLowerCase())),
        p = (e, t) => {
            if (null == e) return !1;
            let n = e.status !== s.AgreementStatus.Active && e.status !== s.AgreementStatus.Accepted,
                a = null != e.endTime && e.endTime.getTime() <= t.getTime();
            return n || a
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
        return "/dashboard/creations/".concat(a.itemTypeToPath[e], "/").concat(s, "/configure")
    }, "getEffectiveAgreementWindow", 0, (e, s) => e ? {
        startTime: null != e.startTime ? new Date(Math.max(e.startTime.getTime(), s.getTime())) : null,
        endTime: e.endTime
    } : void 0, "getIsDurableType", 0, function(e, s) {
        if (void 0 !== e) {
            if ("number" == typeof e) {
                let s = u(e);
                return !!s && i.ValidWearTimeAssetTypes.includes(s)
            }
            return i.ValidWearTimeAssetTypes.includes(e)
        }
        if (void 0 !== s) {
            if ((0, o.isValidEnumValue)(t.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum, s)) return i.ValidWearTimeBundleTypes.includes(A(s));
            if ((0, o.isValidEnumValue)(t.RobloxItemConfigurationApiModelsResponseBundleBundleInfoBundleTypeEnum, s)) return i.ValidWearTimeBundleTypes.includes(c(s));
            if ((0, o.isValidEnumValue)(r.BundleType, s)) return i.ValidWearTimeBundleTypes.includes(s)
        }
        return !1
    }, "getIsRentableType", 0, function(e, s) {
        if (void 0 !== e) {
            if ("number" == typeof e) {
                let s = u(e);
                return !!s && i.ValidTimedOptionsAssetTypes.includes(s)
            }
            return i.ValidTimedOptionsAssetTypes.includes(e)
        }
        if (void 0 !== s) {
            if ((0, o.isValidEnumValue)(t.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum, s)) return i.ValidTimedOptionsBundleTypes.includes(A(s));
            if ((0, o.isValidEnumValue)(t.RobloxItemConfigurationApiModelsResponseBundleBundleInfoBundleTypeEnum, s)) return i.ValidTimedOptionsBundleTypes.includes(c(s));
            if ((0, o.isValidEnumValue)(r.BundleType, s)) return i.ValidTimedOptionsBundleTypes.includes(s)
        }
        return !1
    }, "getItemTypeChipIconSrc", 0, function(e, s) {
        let t = e.toLowerCase(),
            n = y.has(t) ? "".concat(t, "accessory") : t;
        return "".concat("".concat("https://assets.create.roblox.com/693c51491c6d9e57aaf41dc3340c19dd2f0c145a/assets", "/unifiedFeeSystem"), "/").concat(s ? "".concat(n, ".svg") : "".concat(n, "_black.svg"))
    }, "getPublishPageUrl", 0, function(e, s) {
        return "/dashboard/creations/".concat(a.itemTypeToPath[e], "/").concat(s, "/publish")
    }, "getTaxonomyDisplayName", 0, function(e, s) {
        let t, n = s((t = e.replaceAll(/[^a-zA-Z0-9]/g, ""), "Label.Taxonomy".concat(t)));
        return null == n || "" === n ? e : n
    }, "isAgreementQuotaExceeded", 0, e => (null == e ? void 0 : e.revenueTargetsCount) != null && null != e.maxRevenueTargets && e.revenueTargetsCount >= e.maxRevenueTargets, "isAgreementSaleBlocked", 0, p, "isImmediateOnSaleAllowed", 0, (e, t) => null == e || e.status === s.AgreementStatus.Active && !p(e, t), "translateAssetType", 0, e => {
        var s, n;
        return null != (s = null == (n = l[e]) ? void 0 : n.apiType) ? s : t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
    }, "translateAssetTypeToAsset", 0, u, "translateBundleDetailsToBundleInfoType", 0, e => {
        switch (e) {
            case t.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum.NUMBER_0:
                return t.RobloxItemConfigurationApiModelsResponseBundleBundleInfoBundleTypeEnum.Unknown;
            case t.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum.NUMBER_1:
                return t.RobloxItemConfigurationApiModelsResponseBundleBundleInfoBundleTypeEnum.Body;
            case t.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum.NUMBER_2:
                return t.RobloxItemConfigurationApiModelsResponseBundleBundleInfoBundleTypeEnum.DynamicHead;
            case t.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum.NUMBER_3:
                return t.RobloxItemConfigurationApiModelsResponseBundleBundleInfoBundleTypeEnum.Shoes;
            case t.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum.NUMBER_4:
                return t.RobloxItemConfigurationApiModelsResponseBundleBundleInfoBundleTypeEnum.AvatarAnimations;
            default:
                return t.RobloxItemConfigurationApiModelsResponseBundleBundleInfoBundleTypeEnum.Unknown
        }
    }, "translateBundleInfoTypeToBundleType", 0, c, "translateBundleTypeToBundleTypeString", 0, e => {
        switch (e) {
            case r.BundleType.Body:
                return "Body";
            case r.BundleType.DynamicHead:
                return "DynamicHead";
            case r.BundleType.Shoes:
                return "Shoes";
            case r.BundleType.AvatarAnimations:
                return "AvatarAnimations";
            case r.BundleType.Unknown:
            default:
                return "Unknown"
        }
    }])
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
        A = [n.Asset.TShirtAccessory, n.Asset.ShirtAccessory, n.Asset.PantsAccessory, n.Asset.JacketAccessory, n.Asset.SweaterAccessory, n.Asset.ShortsAccessory, n.Asset.DressSkirtAccessory],
        c = [n.Asset.EyeMakeup, n.Asset.LipMakeup, n.Asset.FaceMakeup, n.Asset.EyebrowAccessory, n.Asset.EyelashAccessory],
        y = [n.Asset.Hat, n.Asset.HairAccessory, n.Asset.FaceAccessory, n.Asset.NeckAccessory, n.Asset.ShoulderAccessory, n.Asset.FrontAccessory, n.Asset.BackAccessory, n.Asset.WaistAccessory];
    e.s(["ACCESSORY_ASSET_TYPES", 0, y, "AvatarItemDropdownTitles", 0, i, "AvatarMenuMap", 0, l, "BundleType", () => r, "CLOTHING_ASSET_TYPES", 0, A, "FolderItemsApiLimit", 0, 30, "GetItemsByCreatorApiLimit", 0, 30, "MAKEUP_ASSET_TYPES", 0, c, "MaxItemsPerFolderAddRequest", 0, 50, "ORIGINAL_TIMED_OPTIONS_ASSET_TYPES", 0, u, "RecentsDropdownOption", 0, {
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
}, 610932, e => {
    "use strict";
    var s = e.i(197649),
        t = e.i(416340),
        n = e.i(734463);
    let a = e => {
        var s, t, n, a, o, r;
        let i = null != (s = null == (n = (a = window).matchMedia) || null == (t = n.call(a, "(pointer: coarse)")) ? void 0 : t.matches) && s,
            l = null == (o = document.activeElement) ? void 0 : o.matches(":focus-visible");
        if (i && !l) return void e.preventDefault();
        let u = null == (r = e.currentTarget) ? void 0 : r.querySelector('[role="menuitem"]:not([aria-disabled="true"])');
        u && (e.preventDefault(), u.focus())
    };
    e.s(["Popover", 0, function(e) {
        let {
            open: s,
            defaultOpen: a,
            onOpenChange: o,
            children: r
        } = e;
        return t.createElement(n.Root, {
            open: s,
            defaultOpen: a,
            onOpenChange: o
        }, r)
    }, "PopoverAnchor", 0, function(e) {
        let {
            asChild: s,
            className: a,
            children: o
        } = e;
        return t.createElement(n.Anchor, {
            asChild: s,
            className: a
        }, o)
    }, "PopoverContent", 0, function(e) {
        let {
            side: o = "bottom",
            align: r = "center",
            sideOffset: i = 4,
            className: l,
            children: u,
            ariaLabel: A,
            onOpenAutoFocus: c,
            ...y
        } = e;
        return t.createElement(n.Portal, null, t.createElement(n.Content, {
            side: o,
            align: r,
            sideOffset: i,
            ...y,
            "aria-label": null != A ? A : y["aria-label"],
            onOpenAutoFocus: null != c ? c : a,
            className: (0, s.default)("foundation-web-portal-zindex", l)
        }, u))
    }, "PopoverTrigger", 0, function(e) {
        let {
            asChild: s,
            disabled: a,
            className: o,
            children: r
        } = e;
        return t.createElement(n.Trigger, {
            asChild: s,
            disabled: a,
            className: o
        }, r)
    }])
}, 830655, e => {
    "use strict";
    var s = e.i(197649),
        t = e.i(416340);
    let n = {
            Small: {
                dimension: 16,
                strokeWidth: 2,
                textClass: "text-caption-small"
            },
            Medium: {
                dimension: 32,
                strokeWidth: 3,
                textClass: "text-caption-small",
                valueContainerSize: 36
            },
            Large: {
                dimension: 48,
                strokeWidth: 4,
                textClass: "text-caption-medium",
                valueContainerSize: 52
            }
        },
        a = t.default.forwardRef((e, a) => {
            let {
                className: o,
                size: r = "Large",
                variant: i = "Determinate",
                value: l = 0,
                showValue: u = !1,
                ariaLabel: A,
                ...c
            } = e, {
                dimension: y,
                strokeWidth: p,
                textClass: m,
                valueContainerSize: d
            } = n[r], T = (y - p) / 2, E = 2 * Math.PI * T, B = y / 2, R = Math.min(100, Math.max(0, l)), f = u && void 0 !== d ? d : y, g = "Determinate" === i;
            return t.default.createElement("div", {
                ref: a,
                className: (0, s.default)("foundation-web-progress-circle inline-flex items-center justify-center", o),
                role: "progressbar",
                "aria-label": A,
                "aria-valuemin": g ? 0 : void 0,
                "aria-valuemax": g ? 100 : void 0,
                "aria-valuenow": g ? R : void 0,
                style: {
                    width: f,
                    height: f
                },
                ...c
            }, t.default.createElement("svg", {
                width: y,
                height: y,
                viewBox: "0 0 ".concat(y, " ").concat(y),
                className: "relative"
            }, t.default.createElement("circle", {
                cx: B,
                cy: B,
                r: T,
                fill: "none",
                strokeWidth: p,
                style: {
                    stroke: "var(--color-shift-200)"
                }
            }), t.default.createElement("circle", {
                cx: B,
                cy: B,
                r: T,
                fill: "none",
                strokeWidth: p,
                strokeDasharray: g ? E : "".concat(.75 * E, " ").concat(.25 * E),
                strokeDashoffset: g ? E * (1 - R / 100) : 0,
                strokeLinecap: "round",
                className: (0, s.default)(!g && "foundation-web-progress-circle-indeterminate"),
                style: g ? {
                    stroke: "var(--fui-future-alpha-color-system-progress)",
                    transform: "rotate(-90deg)",
                    transformOrigin: "50% 50%",
                    transition: "stroke-dashoffset 0.3s ease-out"
                } : {
                    stroke: "var(--fui-future-alpha-color-system-progress)",
                    transformOrigin: "50% 50%"
                }
            })), g && u && "Large" === r && t.default.createElement("div", {
                className: (0, s.default)("absolute content-emphasis flex items-center justify-center", m),
                "aria-hidden": "true"
            }, t.default.createElement("span", null, Math.round(R)), t.default.createElement("span", null, "%")))
        });
    a.displayName = "ProgressCircle", e.s(["ProgressCircle", 0, a])
}, 725260, e => {
    "use strict";
    var s = e.i(169336),
        t = e.i(477763),
        n = e.i(416340),
        a = e.i(226319),
        o = e.i(928277),
        r = e.i(221628),
        i = e.i(636042),
        l = e.i(442632);

    function u(e) {
        return (0, s.g)("MuiDialogContentText", e)
    }(0, o.g)("MuiDialogContentText", ["root"]);
    let A = ["children", "className"],
        c = (0, a.s)(i.T, {
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
                y = (0, s._)(o, A),
                p = (e => {
                    let {
                        classes: s
                    } = e, n = (0, a.a)({
                        root: ["root"]
                    }, u, s);
                    return (0, t._)({}, s, n)
                })(y);
            return (0, r.jsx)(c, (0, t._)({
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
}, 464508, e => {
    "use strict";
    var s = e.i(725260);
    e.s(["DialogContentText", () => s.D])
}]);

//# debugId=4715e7f4-5346-4b16-fbde-40823e941922
//# sourceMappingURL=2-0agcr-5lugp.js.map