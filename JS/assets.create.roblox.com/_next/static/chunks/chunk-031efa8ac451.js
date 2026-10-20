;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "f6b8a77b-79d0-3d16-19de-4a44e00a24e8")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 799972, e => {
    "use strict";
    var s = e.i(376618),
        t = e.i(671376);
    let {
        docs: a
    } = e.i(829425).creatorHub, n = {
        [t.Asset.Decal]: s.AssetType.Decal,
        [t.Asset.Audio]: s.AssetType.Audio,
        [t.Asset.Video]: s.AssetType.Video,
        [t.Asset.TShirt]: s.AssetType.Tshirt,
        [t.Asset.Shirt]: s.AssetType.Shirt,
        [t.Asset.Pants]: s.AssetType.Pants,
        [t.Asset.AvatarBackground]: s.AssetType.AvatarBackground,
        [t.Asset.TextDocument]: s.AssetType.TextDocument
    }, r = {
        [t.Asset.Decal]: "Message.DecalResolutionLimits",
        [t.Asset.Audio]: "Message.AudioLimits",
        [t.Asset.AvatarBackground]: "Message.AvatarBackgroundUploadRequirements"
    }, o = [t.Asset.Shirt, t.Asset.Pants, t.Asset.Video, t.Asset.TShirt, t.Asset.AvatarBackground], i = [t.Asset.Audio, t.Asset.Video];
    e.s(["allowedAssetTypeFormats", 0, e => {
        switch (e) {
            case t.Asset.Decal:
            case t.Asset.TShirt:
            case t.Asset.Shirt:
            case t.Asset.Pants:
            case t.Asset.AvatarBackground:
                return ["jpg", "png", "tga", "bmp"];
            case t.Asset.Audio:
                return ["mp3", "ogg", "flac", "wav"];
            case t.Asset.Video:
                return ["mp4", "mov"];
            case t.Asset.TextDocument:
                return ["md", "txt"];
            default:
                return []
        }
    }, "assetTypeInfoTextMessage", 0, r, "dashboardAssetTypeToOpenCloudAssetType", 0, n, "getInfoUrl", 0, e => {
        switch (e) {
            case t.Asset.Decal:
                return a.getDecalReferenceUrl();
            case t.Asset.TShirt:
            case t.Asset.Shirt:
            case t.Asset.Pants:
                return a.getClassicClothingUrl();
            case t.Asset.Audio:
                return a.getAudioAssetsUrl();
            case t.Asset.Video:
                return a.getAssetsUrl();
            case t.Asset.AvatarBackground:
                return a.getAvatarItemsUrl();
            case t.Asset.TextDocument:
                return a.getAssetsUrl();
            default:
                return ""
        }
    }, "is2DAsset", 0, e => {
        switch (e) {
            case t.Asset.TShirt:
            case t.Asset.Shirt:
            case t.Asset.Pants:
                return !0;
            default:
                return !1
        }
    }, "isCreateAssetAvailable", 0, function(e) {
        let s = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
        switch (e) {
            case t.Asset.Audio:
            case t.Asset.Decal:
            case t.Asset.Video:
            case t.Asset.TShirt:
            case t.Asset.Shirt:
            case t.Asset.Pants:
            case t.Asset.AvatarBackground:
                return !0;
            case t.Asset.TextDocument:
                return s;
            default:
                return !1
        }
    }, "maxDurationInSeconds", 0, e => e === t.Asset.Video ? 300 : null, "maxFileSizeMB", 0, e => {
        switch (e) {
            case t.Asset.Decal:
            case t.Asset.TShirt:
            case t.Asset.Shirt:
            case t.Asset.Pants:
            case t.Asset.Audio:
            case t.Asset.AvatarBackground:
            case t.Asset.TextDocument:
                return 20;
            case t.Asset.Video:
                return 30;
            default:
                return 0
        }
    }, "maxResolution", 0, e => e === t.Asset.Video ? "4096x2160" : null, "purchasableAssetTypes", 0, o, "quotaEnabledAssetTypes", 0, i])
}, 117236, e => {
    "use strict";
    var s = e.i(155743),
        t = e.i(9618),
        a = e.i(54842),
        n = e.i(913893),
        r = e.i(671376),
        o = e.i(475360),
        i = e.i(927868),
        u = e.i(949599),
        l = e.i(814768);
    let A = new Set([r.Asset.MyExperiences, r.Asset.SharedExperiences, r.Asset.Audio, r.Asset.Decal, r.Asset.MeshPart, r.Asset.Video]),
        y = new Set([r.Asset.MyExperiences, r.Asset.SharedExperiences, r.Asset.Audio, r.Asset.Decal, r.Asset.Image, r.Asset.MeshPart, r.Asset.Video, r.Asset.Hat, r.Asset.HairAccessory, r.Asset.FaceAccessory, r.Asset.NeckAccessory, r.Asset.ShoulderAccessory, r.Asset.FrontAccessory, r.Asset.BackAccessory, r.Asset.WaistAccessory, r.Asset.Shirt, r.Asset.TShirt, r.Asset.Pants, r.Asset.TShirtAccessory, r.Asset.DressSkirtAccessory, r.Asset.JacketAccessory, r.Asset.PantsAccessory, r.Asset.ShirtAccessory, r.Asset.ShortsAccessory, r.Asset.SweaterAccessory, r.Asset.EmoteAnimation, r.Asset.EyebrowAccessory, r.Asset.EyelashAccessory, r.Asset.FaceMakeup, r.Asset.LipMakeup, r.Asset.EyeMakeup, r.Asset.AvatarBackground]),
        c = new Set([r.Asset.MyExperiences, r.Asset.SharedExperiences, r.Asset.UpcomingEvent, r.Asset.PastEvent, r.Asset.DraftEvent]),
        p = new Set([r.Asset.TShirt, r.Asset.Shirt, r.Asset.Pants, r.Asset.Hat, r.Asset.HairAccessory, r.Asset.FaceAccessory, r.Asset.NeckAccessory, r.Asset.ShoulderAccessory, r.Asset.FrontAccessory, r.Asset.BackAccessory, r.Asset.WaistAccessory, r.Asset.TShirtAccessory, r.Asset.ShirtAccessory, r.Asset.PantsAccessory, r.Asset.JacketAccessory, r.Asset.SweaterAccessory, r.Asset.ShortsAccessory, r.Asset.DressSkirtAccessory]),
        m = new Set([u.BundleType.Body, u.BundleType.DynamicHead, u.BundleType.Shoes]),
        d = new Set,
        T = new Set;

    function E() {
        return {
            assetTypes: new Set(p),
            bundleTypes: new Set(m)
        }
    }
    let B = new Set,
        g = new Set,
        I = null,
        M = null;
    async function S(e, t, a) {
        try {
            var o, A;
            let y = await n.default.getAllowedAssetTypes(e, [s.V1PermissionsItemTypesGetTargetTypesEnum.NUMBER_0, s.V1PermissionsItemTypesGetTargetTypesEnum.NUMBER_1]);
            return null == (o = y.allowedAssetTypes) || o.forEach(e => {
                let s = e;
                "Tshirt" === s ? s = "TShirt" : "TshirtAccessory" === s && (s = "TShirtAccessory"), (0, i.isValidEnumValue)(r.Asset, s) && t.add(s)
            }), null == (A = y.allowedBundleTypes) || A.forEach(e => {
                let s = (0, l.default)(e);
                s !== u.BundleType.Unknown && a.add(s)
            }), {
                assetTypes: t,
                bundleTypes: a
            }
        } catch (e) {
            return E()
        }
    }
    async function R() {
        return d.size > 0 ? {
            assetTypes: d,
            bundleTypes: T
        } : (null != I || (I = S(s.V1PermissionsItemTypesGetActionEnum.NUMBER_2, d, T).finally(() => {
            I = null
        })), I)
    }
    async function b() {
        return B.size > 0 ? {
            assetTypes: B,
            bundleTypes: g
        } : (null != M || (M = S(s.V1PermissionsItemTypesGetActionEnum.NUMBER_1, B, g).finally(() => {
            M = null
        })), M)
    }
    async function f() {
        let [e, s] = await Promise.all([R(), b()]), t = new Set(e.assetTypes);
        return s.assetTypes.has(r.Asset.AvatarBackground) && t.add(r.Asset.AvatarBackground), t
    }
    let h = new Set([]),
        C = {
            [t.SearchSortParameter.GameCreated]: "Label.DateOfCreation",
            [t.SearchSortParameter.GameName]: "Label.Alphabetical",
            [t.SearchSortParameter.LastUpdated]: "Label.LastUpdatedDate"
        },
        v = {
            [a.EventSortBy.CreatedUtc]: "Label.DateOfCreation",
            [a.EventSortBy.StartUtc]: "Label.StartDate"
        },
        D = [{
            type: r.Asset.Place,
            nameKey: "Label.Experiences",
            submenuItems: [{
                type: r.Asset.MyExperiences,
                nameKey: "Label.MyExperiences"
            }, {
                type: r.Asset.SharedExperiences,
                nameKey: "Label.SharedExperiences"
            }]
        }, {
            type: r.Asset.ShareLink,
            nameKey: "Label.ShareLinks"
        }, {
            type: r.Asset.TShirt,
            nameKey: "Label.AvatarItems",
            submenuItems: [{
                type: r.Asset.AvatarLooks,
                nameKey: "Label.Avatars"
            }, {
                type: r.Asset.AvatarBackground,
                nameKey: "Label.Backgrounds"
            }, {
                type: r.Asset.HairAccessory,
                nameKey: "Label.Bodies",
                itemType: o.Item.Bundle
            }, {
                type: r.Asset.EyeMakeup,
                nameKey: "Label.Makeup"
            }, {
                type: r.Asset.TShirtAccessory,
                nameKey: "Label.Clothing"
            }, {
                type: r.Asset.Hat,
                nameKey: "Label.Accessories"
            }, {
                type: r.Asset.TShirt,
                nameKey: "Label.Classics"
            }, {
                type: r.Asset.EmoteAnimation,
                nameKey: "Label.Animations"
            }, {
                type: r.Asset.Showcase,
                nameKey: "Label.Showcases"
            }, {
                type: r.Asset.AllCatalogAsset,
                nameKey: "Label.AllAssetTypes"
            }]
        }, {
            type: r.Asset.Decal,
            nameKey: "Label.DevelopmentItems",
            submenuItems: [{
                type: r.Asset.Model,
                nameKey: "Label.ModelsAndPackages"
            }, {
                type: r.Asset.Plugin,
                nameKey: "Label.Plugins"
            }, {
                type: r.Asset.Audio,
                nameKey: "Label.Audios"
            }, {
                type: r.Asset.Decal,
                nameKey: "Label.Decals"
            }, {
                type: r.Asset.Image,
                nameKey: "Label.Images"
            }, {
                type: r.Asset.Video,
                nameKey: "Label.Videos"
            }, {
                type: r.Asset.Mesh,
                nameKey: "Label.Meshes"
            }, {
                type: r.Asset.MeshPart,
                nameKey: "Label.MeshParts"
            }, {
                type: r.Asset.Animation,
                nameKey: "Label.Animations"
            }, {
                type: r.Asset.TextDocument,
                nameKey: "Label.Text"
            }]
        }, {
            type: r.Asset.Moments,
            nameKey: "Label.Moments"
        }, {
            type: r.Asset.AssetPermissionRequests,
            nameKey: "Label.Requests"
        }];
    e.s(["allowedAssetTypesForArchiving", 0, y, "allowedAssetTypesForDirectArchiving", 0, A, "allowedAssetTypesForSorting", 0, c, "allowedItemTypesForUploading", 0, h, "default", 0, D, "dynamicAvatarItemsAssetTypes", 0, d, "dynamicAvatarItemsBundleTypes", 0, T, "eventSortTranslationKeys", 0, v, "getAllowedMarketplaceItemTypes", 0, R, "getAvatarItemsEntryPointAssetTypes", 0, f, "getDefaultAllowedMarketplaceItemTypes", 0, E, "getUploadableMarketplaceItemTypes", 0, b, "universeSortTranslationKeys", 0, C])
}, 427149, e => {
    "use strict";
    var s = e.i(799972),
        t = e.i(671376),
        a = e.i(759283),
        n = e.i(475360),
        r = e.i(949599),
        o = e.i(117236);
    let i = o.default.reduce((e, s) => {
            var t;
            return s.submenuItems || e.set(s.type, {
                menuItem: s
            }), null == (t = s.submenuItems) || t.forEach(t => {
                if (t.submenuItems) {
                    var a;
                    null == (a = t.submenuItems) || a.forEach(a => {
                        e.set(a.type, {
                            menuItem: s,
                            submenuItem: t
                        })
                    })
                } else e.set(t.type, {
                    menuItem: s,
                    submenuItem: t
                })
            }), e
        }, new Map),
        u = {
            menuItem: o.default[0]
        },
        l = t.Asset.EyeMakeup,
        A = t.Asset.AvatarLooks,
        y = t.Asset.AvatarBackground,
        c = t.Asset.Showcase;
    e.s(["default", 0, {
        isMenuItemEnabled(e, a, r, o, i, u, p, m) {
            var d, T;
            return ((null == e ? void 0 : e.type) !== t.Asset.TextDocument || !!m) && ((null == e ? void 0 : e.type) === t.Asset.AllCatalogAsset || ((null == e ? void 0 : e.type) === t.Asset.SharedExperiences ? null == r : (null == e ? void 0 : e.type) === t.Asset.Moments ? null != u && u : (null == e ? void 0 : e.itemType) === n.Item.Bundle || (null == e ? void 0 : e.type) === A || ((null == e ? void 0 : e.type) === y ? null != (d = null == i ? void 0 : i.has(e.type)) && d : (null == e ? void 0 : e.type) === c ? null != p && p : (null == e ? void 0 : e.type) === l ? null != (T = null == i ? void 0 : i.has(null == e ? void 0 : e.type)) && T : (null == e ? void 0 : e.type) === void 0 || !!(0, s.is2DAsset)(null == e ? void 0 : e.type) || (null == e ? void 0 : e.type) !== void 0 && void 0 === o || null != o && o)))
        },
        getValidMenuState(e, s, t, a, n, r, o, i, u) {
            var A, c, p, m, d, T;
            let E, B, g = (null == (A = s.submenuItem) ? void 0 : A.type) !== l && (null == (c = s.submenuItem) ? void 0 : c.type) !== y || void 0 !== r;
            if (void 0 === s.menuItem || this.isMenuItemEnabled(s.menuItem, t, a, n, r, o, i, u)) {
                if (void 0 !== s.submenuItem && g && !this.isMenuItemEnabled(s.submenuItem, t, a, n, r, o, i, u))
                    if (void 0 !== s.menuItem.submenuItems) {
                        let e = 0,
                            l = 0;
                        for (; l < (null == (m = s.menuItem.submenuItems) ? void 0 : m.length);) {
                            if (this.isMenuItemEnabled(s.menuItem.submenuItems[l], t, a, n, r, o, i, u)) {
                                e = l;
                                break
                            }
                            l += 1
                        }
                        E = s.menuItem, B = null == (d = s.menuItem.submenuItems) ? void 0 : d[e]
                    } else E = s.menuItem, B = null == (T = s.menuItem.submenuItems) ? void 0 : T[0]
            } else [E] = e, B = null == (p = e[0].submenuItems) ? void 0 : p[0];
            return E ? {
                menuItem: E,
                submenuItem: B
            } : s
        },
        isAssetTypeDirectlyArchivable: e => o.allowedAssetTypesForDirectArchiving.has(e),
        isAssetTypeArchivable(e, s) {
            if (void 0 !== s && r.AvatarMenuMap[e]) {
                let t = r.AvatarMenuMap[e][s],
                    a = null == t ? void 0 : t.assetType;
                return (null == t ? void 0 : t.bundleType) !== void 0 || void 0 !== a && o.allowedAssetTypesForArchiving.has(a)
            }
            return o.allowedAssetTypesForArchiving.has(e)
        },
        isAssetTypeSortable: e => o.allowedAssetTypesForSorting.has(e),
        isItemTypeUploadable: e => o.allowedItemTypesForUploading.has(e),
        getAssetFullNameKey: e => a.assetFullNameKeys[e],
        getItemFullNameKey: e => a.itemFullNameKeys[e],
        getAssetType: e => e.submenuItem ? e.submenuItem.type : e.menuItem.type,
        getItemType(e) {
            return e.submenuItem && e.submenuItem.itemType ? e.submenuItem.itemType : e.menuItem.itemType ? e.menuItem.itemType : a.assetTypeToItemType[this.getAssetType(e)]
        },
        getMenuState(e, s) {
            var t;
            return e && s.includes(e) ? u : e && null != (t = i.get(e)) ? t : u
        }
    }])
}, 696564, e => {
    "use strict";
    var s, t, a, n = e.i(155743),
        r = e.i(913893),
        o = e.i(671376),
        i = e.i(814768),
        u = ((s = {})[s.Invalid = 0] = "Invalid", s[s.MarketplaceAndAllExperiences = 1] = "MarketplaceAndAllExperiences", s[s.ExperiencesAndDevAPIOnly = 2] = "ExperiencesAndDevAPIOnly", s[s.MarketplaceOnly = 3] = "MarketplaceOnly", s[s.MarketplaceAndExperiencesById = 4] = "MarketplaceAndExperiencesById", s),
        l = ((t = {})[t.Invalid = 0] = "Invalid", t[t.Marketplace = 1] = "Marketplace", t[t.InExperience = 2] = "InExperience", t),
        A = ((a = {}).Days3 = "Days3", a.Days7 = "Days7", a.Days14 = "Days14", a.Permanent = "Permanent", a);
    let y = Object.values(A),
        c = [],
        p = [],
        m = [],
        d = [];
    async function T() {
        if (c.length > 0 && p.length > 0) return;
        let e = await r.default.getAllowedAssetTypes(n.V1PermissionsItemTypesGetActionEnum.NUMBER_4, [n.V1PermissionsItemTypesGetTargetTypesEnum.NUMBER_0, n.V1PermissionsItemTypesGetTargetTypesEnum.NUMBER_1]);
        e.allowedAssetTypes && e.allowedAssetTypes.forEach(e => {
            c.push(e)
        }), e.allowedBundleTypes && e.allowedBundleTypes.forEach(e => {
            p.push((0, i.default)(e))
        })
    }
    async function E() {
        if (m.length > 0 && d.length > 0) return;
        let e = await r.default.getAllowedAssetTypes(n.V1PermissionsItemTypesGetActionEnum.NUMBER_5, [n.V1PermissionsItemTypesGetTargetTypesEnum.NUMBER_0, n.V1PermissionsItemTypesGetTargetTypesEnum.NUMBER_1]);
        e.allowedAssetTypes && e.allowedAssetTypes.forEach(e => {
            let s = e;
            "TshirtAccessory" === e && (s = "TShirtAccessory"), m.push(s)
        }), e.allowedBundleTypes && e.allowedBundleTypes.forEach(e => {
            d.push((0, i.default)(e))
        })
    }
    e.s(["DefaultMaxCollectiblePrice", 0, 0x3b9ac9ff, "DurationOptions", 0, y, "DurationOptionsEnum", () => A, "PUBLISHING_ADVANCE_THRESHOLD", 0, .3, "PurchasePlatformEnum", () => l, "SaleLocationEnum", () => u, "ValidTimedOptionsAssetTypes", 0, m, "ValidTimedOptionsBundleTypes", 0, d, "ValidWearTimeAssetTypes", 0, c, "ValidWearTimeBundleTypes", 0, p, "getValidTimedOptionsTypes", 0, E, "getValidWearTimeTypes", 0, T, "mapAssetTypeToString", 0, function(e) {
        switch (e) {
            case n.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_1:
                return o.Asset.Image.toString();
            case n.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_2:
                return o.Asset.TShirt.toString();
            case n.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_3:
                return o.Asset.Audio.toString();
            case n.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_4:
                return o.Asset.Mesh.toString();
            case n.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_8:
                return o.Asset.Hat.toString();
            case n.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_9:
                return o.Asset.Place.toString();
            case n.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_10:
                return o.Asset.Model.toString();
            case n.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_11:
                return o.Asset.Shirt.toString();
            case n.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_12:
                return o.Asset.Pants.toString();
            case n.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_13:
                return o.Asset.Decal.toString();
            case n.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_24:
                return o.Asset.Animation.toString();
            case n.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_38:
                return o.Asset.Plugin.toString();
            case n.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_40:
                return o.Asset.MeshPart.toString();
            case n.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_41:
                return o.Asset.HairAccessory.toString();
            case n.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_42:
                return o.Asset.FaceAccessory.toString();
            case n.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_43:
                return o.Asset.NeckAccessory.toString();
            case n.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_44:
                return o.Asset.ShoulderAccessory.toString();
            case n.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_45:
                return o.Asset.FrontAccessory.toString();
            case n.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_46:
                return o.Asset.BackAccessory.toString();
            case n.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_47:
                return o.Asset.WaistAccessory.toString();
            case n.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_61:
                return o.Asset.EmoteAnimation.toString();
            case n.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_62:
                return o.Asset.Video.toString();
            case n.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_64:
                return o.Asset.TShirtAccessory.toString();
            case n.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_65:
                return o.Asset.ShirtAccessory.toString();
            case n.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_66:
                return o.Asset.PantsAccessory.toString();
            case n.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_67:
                return o.Asset.JacketAccessory.toString();
            case n.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_68:
                return o.Asset.SweaterAccessory.toString();
            case n.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_69:
                return o.Asset.ShortsAccessory.toString();
            case n.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_72:
                return o.Asset.DressSkirtAccessory.toString();
            case n.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_73:
                return o.Asset.FontFamily.toString();
            case n.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_76:
                return o.Asset.EyebrowAccessory.toString();
            case n.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_77:
                return o.Asset.EyelashAccessory.toString();
            case n.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_88:
                return o.Asset.FaceMakeup.toString();
            case n.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_89:
                return o.Asset.LipMakeup.toString();
            case n.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_90:
                return o.Asset.EyeMakeup.toString();
            case n.RobloxItemConfigurationApiAssetDetailsAssetTypeEnum.NUMBER_92:
                return o.Asset.AvatarBackground.toString();
            default:
                return "Invalid"
        }
    }, "mapBundleTypeToString", 0, function(e) {
        switch (e) {
            case n.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum.NUMBER_1:
                return "Body";
            case n.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum.NUMBER_2:
                return "DynamicHead";
            case n.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum.NUMBER_3:
                return "Shoes";
            case n.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum.NUMBER_4:
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
                return n.RobloxItemConfigurationApiModelsRequestCollectiblesSaleLocationConfigurationModelSaleLocationTypeEnum.NUMBER_1;
            case 2:
                return n.RobloxItemConfigurationApiModelsRequestCollectiblesSaleLocationConfigurationModelSaleLocationTypeEnum.NUMBER_2;
            case 3:
                return n.RobloxItemConfigurationApiModelsRequestCollectiblesSaleLocationConfigurationModelSaleLocationTypeEnum.NUMBER_3;
            case 4:
                return n.RobloxItemConfigurationApiModelsRequestCollectiblesSaleLocationConfigurationModelSaleLocationTypeEnum.NUMBER_4;
            default:
                return n.RobloxItemConfigurationApiModelsRequestCollectiblesSaleLocationConfigurationModelSaleLocationTypeEnum.NUMBER_0
        }
    }])
}, 418162, e => {
    "use strict";
    var s = e.i(797516),
        t = e.i(155743),
        a = e.i(671376),
        n = e.i(759283),
        r = e.i(927868),
        o = e.i(949599),
        i = e.i(696564);
    let u = {
            [a.Asset.Place]: {
                asset: a.Asset.Place,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_9
            },
            [a.Asset.TShirt]: {
                asset: a.Asset.TShirt,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_2
            },
            [a.Asset.Shirt]: {
                asset: a.Asset.Shirt,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_11
            },
            [a.Asset.Pants]: {
                asset: a.Asset.Pants,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_12
            },
            [a.Asset.Hat]: {
                asset: a.Asset.Hat,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_8
            },
            [a.Asset.HairAccessory]: {
                asset: a.Asset.HairAccessory,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_41
            },
            [a.Asset.FaceAccessory]: {
                asset: a.Asset.FaceAccessory,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_42
            },
            [a.Asset.NeckAccessory]: {
                asset: a.Asset.NeckAccessory,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_43
            },
            [a.Asset.ShoulderAccessory]: {
                asset: a.Asset.ShoulderAccessory,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_44
            },
            [a.Asset.FrontAccessory]: {
                asset: a.Asset.FrontAccessory,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_45
            },
            [a.Asset.BackAccessory]: {
                asset: a.Asset.BackAccessory,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_46
            },
            [a.Asset.WaistAccessory]: {
                asset: a.Asset.WaistAccessory,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_47
            },
            [a.Asset.TShirtAccessory]: {
                asset: a.Asset.TShirtAccessory,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_64
            },
            [a.Asset.ShirtAccessory]: {
                asset: a.Asset.ShirtAccessory,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_65
            },
            [a.Asset.PantsAccessory]: {
                asset: a.Asset.PantsAccessory,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_66
            },
            [a.Asset.JacketAccessory]: {
                asset: a.Asset.JacketAccessory,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_67
            },
            [a.Asset.SweaterAccessory]: {
                asset: a.Asset.SweaterAccessory,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_68
            },
            [a.Asset.ShortsAccessory]: {
                asset: a.Asset.ShortsAccessory,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_69
            },
            [a.Asset.DressSkirtAccessory]: {
                asset: a.Asset.DressSkirtAccessory,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_72
            },
            [a.Asset.EmoteAnimation]: {
                asset: a.Asset.EmoteAnimation,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_61
            },
            [a.Asset.AllCatalogAsset]: {
                asset: a.Asset.AllCatalogAsset,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [a.Asset.AvatarLooks]: {
                asset: a.Asset.AvatarLooks,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [a.Asset.Showcase]: {
                asset: a.Asset.Showcase,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [a.Asset.Decal]: {
                asset: a.Asset.Decal,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_13
            },
            [a.Asset.Image]: {
                asset: a.Asset.Image,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_1
            },
            [a.Asset.Audio]: {
                asset: a.Asset.Audio,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_3
            },
            [a.Asset.Model]: {
                asset: a.Asset.Model,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_10
            },
            [a.Asset.Mesh]: {
                asset: a.Asset.Mesh,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_4
            },
            [a.Asset.MeshPart]: {
                asset: a.Asset.MeshPart,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_40
            },
            [a.Asset.Plugin]: {
                asset: a.Asset.Plugin,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_38
            },
            [a.Asset.Animation]: {
                asset: a.Asset.Animation,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_24
            },
            [a.Asset.Video]: {
                asset: a.Asset.Video,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_62
            },
            [a.Asset.FontFamily]: {
                asset: a.Asset.FontFamily,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_73
            },
            [a.Asset.StorePreviewVideo]: {
                asset: a.Asset.StorePreviewVideo,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [a.Asset.GamePreviewVideo]: {
                asset: a.Asset.GamePreviewVideo,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [a.Asset.MyExperiences]: {
                asset: a.Asset.MyExperiences,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [a.Asset.SharedExperiences]: {
                asset: a.Asset.SharedExperiences,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [a.Asset.ShareLink]: {
                asset: a.Asset.ShareLink,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [a.Asset.Moments]: {
                asset: a.Asset.Moments,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [a.Asset.Event]: {
                asset: a.Asset.Event,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [a.Asset.UpcomingEvent]: {
                asset: a.Asset.UpcomingEvent,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [a.Asset.DraftEvent]: {
                asset: a.Asset.DraftEvent,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [a.Asset.PastEvent]: {
                asset: a.Asset.PastEvent,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [a.Asset.EyebrowAccessory]: {
                asset: a.Asset.EyebrowAccessory,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_76
            },
            [a.Asset.EyelashAccessory]: {
                asset: a.Asset.EyelashAccessory,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_77
            },
            [a.Asset.FaceMakeup]: {
                asset: a.Asset.FaceMakeup,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_88
            },
            [a.Asset.LipMakeup]: {
                asset: a.Asset.LipMakeup,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_89
            },
            [a.Asset.EyeMakeup]: {
                asset: a.Asset.EyeMakeup,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_90
            },
            [a.Asset.AvatarBackground]: {
                asset: a.Asset.AvatarBackground,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_92
            },
            [a.Asset.TextDocument]: {
                asset: a.Asset.TextDocument,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            },
            [a.Asset.AssetPermissionRequests]: {
                asset: a.Asset.AssetPermissionRequests,
                apiType: t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
            }
        },
        l = e => {
            let s = Object.values(u).find(s => s.apiType === e);
            return null == s ? void 0 : s.asset
        },
        A = e => {
            switch (e) {
                case t.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum.NUMBER_0:
                    return o.BundleType.Unknown;
                case t.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum.NUMBER_1:
                    return o.BundleType.Body;
                case t.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum.NUMBER_2:
                    return o.BundleType.DynamicHead;
                case t.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum.NUMBER_3:
                    return o.BundleType.Shoes;
                case t.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum.NUMBER_4:
                    return o.BundleType.AvatarAnimations;
                default:
                    return o.BundleType.Unknown
            }
        },
        y = e => {
            switch (e) {
                case t.RobloxItemConfigurationApiModelsResponseBundleBundleInfoBundleTypeEnum.Unknown:
                    return o.BundleType.Unknown;
                case t.RobloxItemConfigurationApiModelsResponseBundleBundleInfoBundleTypeEnum.Body:
                    return o.BundleType.Body;
                case t.RobloxItemConfigurationApiModelsResponseBundleBundleInfoBundleTypeEnum.DynamicHead:
                    return o.BundleType.DynamicHead;
                case t.RobloxItemConfigurationApiModelsResponseBundleBundleInfoBundleTypeEnum.Shoes:
                    return o.BundleType.Shoes;
                case t.RobloxItemConfigurationApiModelsResponseBundleBundleInfoBundleTypeEnum.AvatarAnimations:
                    return o.BundleType.AvatarAnimations;
                default:
                    return o.BundleType.Unknown
            }
        };
    a.Asset.TShirt, a.Asset.Shirt, a.Asset.Pants;
    let c = new Set([a.Asset.TShirt, a.Asset.Pants, a.Asset.Shirt].map(e => e.toLowerCase())),
        p = (e, t) => {
            if (null == e) return !1;
            let a = e.status !== s.AgreementStatus.Active && e.status !== s.AgreementStatus.Accepted,
                n = null != e.endTime && e.endTime.getTime() <= t.getTime();
            return a || n
        };
    e.s(["getAgreementDisplayName", 0, e => {
        var s, t, a, n, r, o;
        return null != (s = null != (t = null != (a = null == e || null == (n = e.license) ? void 0 : n.name) ? a : null == e || null == (r = e.listing) ? void 0 : r.name) ? t : null == e || null == (o = e.license) ? void 0 : o.listingName) ? s : void 0
    }, "getAgreementWindow", 0, e => {
        var s, t;
        let a = null != (s = null == e ? void 0 : e.endTime) ? s : null;
        if (null != a) return {
            startTime: null != (t = null == e ? void 0 : e.startTime) ? t : null,
            endTime: a
        }
    }, "getConfigurePageUrl", 0, function(e, s) {
        return "/dashboard/creations/".concat(n.itemTypeToPath[e], "/").concat(s, "/configure")
    }, "getEffectiveAgreementWindow", 0, (e, s) => e ? {
        startTime: null != e.startTime ? new Date(Math.max(e.startTime.getTime(), s.getTime())) : null,
        endTime: e.endTime
    } : void 0, "getIsDurableType", 0, function(e, s) {
        if (void 0 !== e) {
            if ("number" == typeof e) {
                let s = l(e);
                return !!s && i.ValidWearTimeAssetTypes.includes(s)
            }
            return i.ValidWearTimeAssetTypes.includes(e)
        }
        if (void 0 !== s) {
            if ((0, r.isValidEnumValue)(t.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum, s)) return i.ValidWearTimeBundleTypes.includes(A(s));
            if ((0, r.isValidEnumValue)(t.RobloxItemConfigurationApiModelsResponseBundleBundleInfoBundleTypeEnum, s)) return i.ValidWearTimeBundleTypes.includes(y(s));
            if ((0, r.isValidEnumValue)(o.BundleType, s)) return i.ValidWearTimeBundleTypes.includes(s)
        }
        return !1
    }, "getIsRentableType", 0, function(e, s) {
        if (void 0 !== e) {
            if ("number" == typeof e) {
                let s = l(e);
                return !!s && i.ValidTimedOptionsAssetTypes.includes(s)
            }
            return i.ValidTimedOptionsAssetTypes.includes(e)
        }
        if (void 0 !== s) {
            if ((0, r.isValidEnumValue)(t.RobloxItemConfigurationApiBundleDetailsBundleTypeEnum, s)) return i.ValidTimedOptionsBundleTypes.includes(A(s));
            if ((0, r.isValidEnumValue)(t.RobloxItemConfigurationApiModelsResponseBundleBundleInfoBundleTypeEnum, s)) return i.ValidTimedOptionsBundleTypes.includes(y(s));
            if ((0, r.isValidEnumValue)(o.BundleType, s)) return i.ValidTimedOptionsBundleTypes.includes(s)
        }
        return !1
    }, "getItemTypeChipIconSrc", 0, function(e, s) {
        let t = e.toLowerCase(),
            a = c.has(t) ? "".concat(t, "accessory") : t;
        return "".concat("".concat("https://assets.create.roblox.com/c8b3d8a58c0112a8611d351d769556f3eb647578/assets", "/unifiedFeeSystem"), "/").concat(s ? "".concat(a, ".svg") : "".concat(a, "_black.svg"))
    }, "getPublishPageUrl", 0, function(e, s) {
        return "/dashboard/creations/".concat(n.itemTypeToPath[e], "/").concat(s, "/publish")
    }, "getTaxonomyDisplayName", 0, function(e, s) {
        let t, a = s((t = e.replaceAll(/[^a-zA-Z0-9]/g, ""), "Label.Taxonomy".concat(t)));
        return null == a || "" === a ? e : a
    }, "isAgreementQuotaExceeded", 0, e => (null == e ? void 0 : e.revenueTargetsCount) != null && null != e.maxRevenueTargets && e.revenueTargetsCount >= e.maxRevenueTargets, "isAgreementSaleBlocked", 0, p, "isImmediateOnSaleAllowed", 0, (e, t) => null == e || e.status === s.AgreementStatus.Active && !p(e, t), "translateAssetType", 0, e => {
        var s, a;
        return null != (s = null == (a = u[e]) ? void 0 : a.apiType) ? s : t.V1ItemsByCreatorGetAssetTypeEnum.NUMBER_0
    }, "translateAssetTypeToAsset", 0, l, "translateBundleDetailsToBundleInfoType", 0, e => {
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
    }, "translateBundleInfoTypeToBundleType", 0, y, "translateBundleTypeToBundleTypeString", 0, e => {
        switch (e) {
            case o.BundleType.Body:
                return "Body";
            case o.BundleType.DynamicHead:
                return "DynamicHead";
            case o.BundleType.Shoes:
                return "Shoes";
            case o.BundleType.AvatarAnimations:
                return "AvatarAnimations";
            case o.BundleType.Unknown:
            default:
                return "Unknown"
        }
    }])
}, 814768, 266213, 949599, e => {
    "use strict";
    var s, t, a = e.i(671376),
        n = e.i(475360),
        r = ((s = r || {}).Makeup = "Makeup", s.Avatar = "Avatar", s);
    e.s(["default", 0, r], 266213);
    var o = ((t = {})[t.Unknown = 0] = "Unknown", t[t.Body = 1] = "Body", t[t.DynamicHead = 2] = "DynamicHead", t[t.Shoes = 3] = "Shoes", t[t.AvatarAnimations = 4] = "AvatarAnimations", t);
    let i = {
            [a.Asset.HairAccessory]: "Label.Body",
            [a.Asset.TShirt]: "Label.Classic",
            [a.Asset.Hat]: "Label.Accessory",
            [a.Asset.TShirtAccessory]: "Label.Clothing",
            [a.Asset.EmoteAnimation]: "Label.Animation",
            [a.Asset.AllCatalogAsset]: "Label.Folder",
            [a.Asset.EyeMakeup]: "Label.Makeup"
        },
        u = {
            [a.Asset.HairAccessory]: [{
                assetType: a.Asset.HairAccessory,
                nameKey: "Label.HairAccessories"
            }, {
                itemType: n.Item.Bundle,
                id: 2,
                nameKey: "Label.Bodies",
                bundleType: 1
            }, {
                itemType: n.Item.Bundle,
                id: 2,
                nameKey: "Label.DynamicHeads",
                bundleType: 2
            }],
            [a.Asset.TShirt]: [{
                assetType: a.Asset.TShirt,
                nameKey: "Label.ClassicTShirts"
            }, {
                assetType: a.Asset.Shirt,
                nameKey: "Label.ClassicShirts"
            }, {
                assetType: a.Asset.Pants,
                nameKey: "Label.ClassicPants"
            }],
            [a.Asset.Hat]: [{
                assetType: a.Asset.Hat,
                nameKey: "Label.Hats"
            }, {
                assetType: a.Asset.HairAccessory,
                nameKey: "Label.HairAccessories"
            }, {
                assetType: a.Asset.FaceAccessory,
                nameKey: "Label.FaceAccessories"
            }, {
                assetType: a.Asset.NeckAccessory,
                nameKey: "Label.NeckAccessories"
            }, {
                assetType: a.Asset.ShoulderAccessory,
                nameKey: "Label.ShoulderAccessories"
            }, {
                assetType: a.Asset.FrontAccessory,
                nameKey: "Label.FrontAccessories"
            }, {
                assetType: a.Asset.BackAccessory,
                nameKey: "Label.BackAccessories"
            }, {
                assetType: a.Asset.WaistAccessory,
                nameKey: "Label.WaistAccessories"
            }],
            [a.Asset.TShirtAccessory]: [{
                assetType: a.Asset.TShirtAccessory,
                nameKey: "Label.TShirts"
            }, {
                assetType: a.Asset.ShirtAccessory,
                nameKey: "Label.Shirts"
            }, {
                assetType: a.Asset.PantsAccessory,
                nameKey: "Label.Pants"
            }, {
                assetType: a.Asset.JacketAccessory,
                nameKey: "Label.Jackets"
            }, {
                assetType: a.Asset.SweaterAccessory,
                nameKey: "Label.Sweaters"
            }, {
                assetType: a.Asset.ShortsAccessory,
                nameKey: "Label.ShortsAccessories"
            }, {
                assetType: a.Asset.DressSkirtAccessory,
                nameKey: "Label.Skirts"
            }, {
                itemType: n.Item.Bundle,
                nameKey: "Label.Shoes",
                bundleType: 3
            }],
            [a.Asset.EmoteAnimation]: [{
                assetType: a.Asset.EmoteAnimation,
                nameKey: "Label.Emote"
            }, {
                itemType: n.Item.Bundle,
                nameKey: "Label.AvatarAnimations",
                bundleType: 4
            }],
            [a.Asset.EyeMakeup]: [{
                assetType: a.Asset.EyeMakeup,
                nameKey: "Label.EyeMakeupAccessories"
            }, {
                assetType: a.Asset.LipMakeup,
                nameKey: "Label.LipMakeupAccessories"
            }, {
                assetType: a.Asset.FaceMakeup,
                nameKey: "Label.FaceMakeupAccessories"
            }, {
                assetType: a.Asset.EyebrowAccessory,
                nameKey: "Label.EyebrowAccessories"
            }, {
                assetType: a.Asset.EyelashAccessory,
                nameKey: "Label.EyelashAccessories"
            }, {
                lookType: r.Makeup,
                nameKey: "Label.Looks"
            }],
            [a.Asset.AvatarBackground]: [{
                assetType: a.Asset.AvatarBackground,
                nameKey: "Label.Backgrounds"
            }]
        },
        l = new Set([a.Asset.TShirtAccessory, a.Asset.PantsAccessory, a.Asset.SweaterAccessory]),
        A = [a.Asset.TShirtAccessory, a.Asset.ShirtAccessory, a.Asset.PantsAccessory, a.Asset.JacketAccessory, a.Asset.SweaterAccessory, a.Asset.ShortsAccessory, a.Asset.DressSkirtAccessory],
        y = [a.Asset.EyeMakeup, a.Asset.LipMakeup, a.Asset.FaceMakeup, a.Asset.EyebrowAccessory, a.Asset.EyelashAccessory],
        c = [a.Asset.Hat, a.Asset.HairAccessory, a.Asset.FaceAccessory, a.Asset.NeckAccessory, a.Asset.ShoulderAccessory, a.Asset.FrontAccessory, a.Asset.BackAccessory, a.Asset.WaistAccessory];
    e.s(["ACCESSORY_ASSET_TYPES", 0, c, "AvatarItemDropdownTitles", 0, i, "AvatarMenuMap", 0, u, "BundleType", () => o, "CLOTHING_ASSET_TYPES", 0, A, "FolderItemsApiLimit", 0, 30, "GetItemsByCreatorApiLimit", 0, 30, "MAKEUP_ASSET_TYPES", 0, y, "MaxItemsPerFolderAddRequest", 0, 50, "ORIGINAL_TIMED_OPTIONS_ASSET_TYPES", 0, l, "RecentsDropdownOption", 0, {
        nameKey: "Label.Recents",
        isRecents: !0
    }], 949599), e.s(["default", 0, e => {
        switch (e) {
            case "Body":
                return o.Body;
            case "DynamicHead":
                return o.DynamicHead;
            case "Shoes":
                return o.Shoes;
            case "AvatarAnimations":
                return o.AvatarAnimations;
            default:
                return o.Unknown
        }
    }], 814768)
}, 812141, e => {
    "use strict";
    var s = e.i(182012),
        t = e.i(157310);
    let a = {},
        n = e => ["folders", null != e ? e : null];
    e.s(["default", 0, function(e) {
        return (0, t.useQuery)({
            queryKey: ["metadata"],
            queryFn: async () => {
                try {
                    let s = await e.getCollectiblesMetadata();
                    return null != s ? s : a
                } catch (e) {
                    return a
                }
            }
        })
    }, "getFoldersQueryKey", 0, n, "useAddItemToFolderMutation", 0, function(e, t) {
        let {
            onSuccess: a,
            onError: n
        } = t;
        return (0, s.useMutation)({
            mutationFn: s => e.addItemToFolder(s.itemId, s.itemType, s.folderId),
            onSuccess: a,
            onError: n
        })
    }, "useCreateFolderMutation", 0, function(e, t) {
        let {
            onSuccess: a,
            onError: n
        } = t;
        return (0, s.useMutation)({
            mutationFn: s => e.createFolder(s.name, void 0, s.groupId),
            onSuccess: e => {
                var s;
                return a(null != (s = e.folderId) ? s : "")
            },
            onError: n
        })
    }, "useGetFolders", 0, function(e, s) {
        let a = !(arguments.length > 2) || void 0 === arguments[2] || arguments[2];
        return (0, t.useQuery)({
            queryKey: n(s),
            queryFn: () => e.getFolders(s),
            enabled: a
        })
    }, "useUpdateFolderMutation", 0, function(e, t) {
        let {
            onSuccess: a,
            onError: n
        } = t;
        return (0, s.useMutation)({
            mutationFn: s => e.updateFolder(s.folderId, s.name),
            onSuccess: a,
            onError: n
        })
    }])
}, 270384, e => {
    "use strict";
    var s = e.i(690569),
        t = e.i(945146),
        a = e.i(416340),
        n = e.i(251635),
        r = e.i(787802),
        o = e.i(221628),
        i = e.i(396249),
        u = e.i(121880);

    function l(e) {
        return (0, s.g)("MuiDialogContentText", e)
    }(0, r.g)("MuiDialogContentText", ["root"]);
    let A = ["children", "className"],
        y = (0, n.s)(i.T, {
            shouldForwardProp: e => (0, n.r)(e) || "classes" === e,
            name: "MuiDialogContentText",
            slot: "Root",
            overridesResolver: (e, s) => s.root
        })({}),
        c = a.forwardRef(function(e, a) {
            let r = (0, u.u)({
                    props: e,
                    name: "MuiDialogContentText"
                }),
                {
                    className: i
                } = r,
                c = (0, s._)(r, A),
                p = (e => {
                    let {
                        classes: s
                    } = e, a = (0, n.a)({
                        root: ["root"]
                    }, l, s);
                    return (0, t._)({}, s, a)
                })(c);
            return (0, o.jsx)(y, (0, t._)({
                component: "p",
                variant: "body1",
                color: "text.secondary",
                ref: a,
                ownerState: c,
                className: (0, n.c)(p.root, i)
            }, r, {
                classes: p
            }))
        });
    e.s(["D", 0, c])
}, 59973, e => {
    "use strict";
    var s = e.i(270384);
    e.s(["DialogContentText", () => s.D])
}]);

//# debugId=f6b8a77b-79d0-3d16-19de-4a44e00a24e8
//# sourceMappingURL=0p6i_9vqeci30.js.map