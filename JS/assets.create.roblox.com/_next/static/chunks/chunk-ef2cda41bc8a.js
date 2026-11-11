;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "f89f0664-4370-f5fe-3d8e-08af2c40fdca")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 356936, e => {
    "use strict";
    var t = e.i(735807);
    e.s(["f", () => t.D])
}, 419652, e => {
    "use strict";
    let t = (0, e.i(643766).createContext)({
        droppedFile: void 0,
        updateDroppedFile: () => {}
    });
    t.displayName = "CreateAssetForm", e.s(["f", 0, t])
}, 799972, e => {
    "use strict";
    var t = e.i(317143),
        s = e.i(671376);
    let {
        docs: a
    } = e.i(829425).f, r = {
        [s.f.Decal]: t.s.Decal,
        [s.f.Audio]: t.s.Audio,
        [s.f.Video]: t.s.Video,
        [s.f.TShirt]: t.s.Tshirt,
        [s.f.Shirt]: t.s.Shirt,
        [s.f.Pants]: t.s.Pants,
        [s.f.AvatarBackground]: t.s.AvatarBackground,
        [s.f.TextDocument]: t.s.TextDocument
    }, n = {
        [s.f.Decal]: "Message.DecalResolutionLimits",
        [s.f.Audio]: "Message.AudioLimits",
        [s.f.AvatarBackground]: "Message.AvatarBackgroundUploadRequirements"
    }, i = [s.f.Shirt, s.f.Pants, s.f.Video, s.f.TShirt, s.f.AvatarBackground], c = [s.f.Audio, s.f.Video];
    e.s(["l", 0, e => {
        switch (e) {
            case s.f.Decal:
            case s.f.TShirt:
            case s.f.Shirt:
            case s.f.Pants:
            case s.f.AvatarBackground:
                return ["jpg", "png", "tga", "bmp"];
            case s.f.Audio:
                return ["mp3", "ogg", "flac", "wav"];
            case s.f.Video:
                return ["mp4", "mov"];
            case s.f.TextDocument:
                return ["md", "txt"];
            default:
                return []
        }
    }, "g", 0, n, "r", 0, r, "z", 0, e => {
        switch (e) {
            case s.f.Decal:
                return a.getDecalReferenceUrl();
            case s.f.TShirt:
            case s.f.Shirt:
            case s.f.Pants:
                return a.getClassicClothingUrl();
            case s.f.Audio:
                return a.getAudioAssetsUrl();
            case s.f.Video:
                return a.getAssetsUrl();
            case s.f.AvatarBackground:
                return a.getAvatarItemsUrl();
            case s.f.TextDocument:
                return a.getAssetsUrl();
            default:
                return ""
        }
    }, "j", 0, e => {
        switch (e) {
            case s.f.TShirt:
            case s.f.Shirt:
            case s.f.Pants:
                return !0;
            default:
                return !1
        }
    }, "S", 0, function(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
        switch (e) {
            case s.f.Audio:
            case s.f.Decal:
            case s.f.Video:
            case s.f.TShirt:
            case s.f.Shirt:
            case s.f.Pants:
            case s.f.AvatarBackground:
                return !0;
            case s.f.TextDocument:
                return t;
            default:
                return !1
        }
    }, "_", 0, e => e === s.f.Video ? 300 : null, "D", 0, e => {
        switch (e) {
            case s.f.Decal:
            case s.f.TShirt:
            case s.f.Shirt:
            case s.f.Pants:
            case s.f.Audio:
            case s.f.AvatarBackground:
            case s.f.TextDocument:
                return 20;
            case s.f.Video:
                return 30;
            default:
                return 0
        }
    }, "t", 0, e => e === s.f.Video ? "4096x2160" : null, "k", 0, i, "b", 0, c])
}, 456810, e => {
    "use strict";
    var t = e.i(643766),
        s = e.i(593430),
        a = e.i(482979),
        r = e.i(252842),
        n = e.i(671376);
    let i = {
            [n.f.Place]: s.V.LastUpdated,
            [n.f.UpcomingEvent]: a.W.StartUtc,
            [n.f.PastEvent]: a.W.StartUtc,
            [n.f.DraftEvent]: a.W.StartUtc
        },
        c = {
            sort: i,
            setSort: () => {
                throw Error("NotImplemented")
            },
            sortOrder: r.f.Desc,
            setSortOrder: () => {
                throw Error("NotImplemented")
            },
            isArchived: !1,
            setIsArchived: () => {
                throw Error("NotImplemented")
            },
            isAgeRestrictedCollaboration: !1,
            setIsAgeRestrictedCollaboration: () => {
                throw Error("NotImplemented")
            },
            isPublicOnly: !1,
            setIsPublicOnly: () => {
                throw Error("NotImplemented")
            },
            isOnMarketplace: !1,
            setIsOnMarketplace: () => {
                throw Error("NotImplemented")
            },
            resetAllFilters: () => {
                throw Error("NotImplemented")
            }
        },
        o = (0, t.createContext)(c);
    o.displayName = "Filters", e.s(["U", 0, o, "K", 0, i])
}, 475642, e => {
    "use strict";
    var t = e.i(643766),
        s = e.i(456810);
    e.s(["f", 0, () => (0, t.useContext)(s.U)])
}, 494601, e => {
    "use strict";
    let t = (0, e.i(67243).f)()({
        gridContainer: {
            "& > *": {
                marginTop: 24,
                marginBottom: 24
            }
        },
        createButtonContainer: {
            width: "100%",
            marginTop: 0
        },
        folderActionContainer: {
            width: "100%",
            marginTop: 0
        }
    });
    e.s(["f", 0, t])
}, 348558, e => {
    "use strict";
    var t = e.i(500758),
        s = e.i(9436);
    e.s(["f", 0, () => {
        let {
            ready: e,
            value: a
        } = (0, t.f)(s.p);
        if (e) return a
    }])
}, 427149, e => {
    "use strict";
    var t = e.i(799972),
        s = e.i(671376),
        a = e.i(759283),
        r = e.i(475360),
        n = e.i(949599),
        i = e.i(117236);
    let c = i.U.reduce((e, t) => {
            var s;
            return t.submenuItems || e.set(t.type, {
                menuItem: t
            }), null == (s = t.submenuItems) || s.forEach(s => {
                if (s.submenuItems) {
                    var a;
                    null == (a = s.submenuItems) || a.forEach(a => {
                        e.set(a.type, {
                            menuItem: t,
                            submenuItem: s
                        })
                    })
                } else e.set(s.type, {
                    menuItem: t,
                    submenuItem: s
                })
            }), e
        }, new Map),
        o = {
            menuItem: i.U[0]
        },
        u = s.f.EyeMakeup,
        l = s.f.AvatarLooks,
        f = s.f.AvatarBackground,
        y = s.f.Showcase;
    e.s(["f", 0, {
        isMenuItemEnabled(e, a, n, i, c, o, p) {
            var d, m;
            return ((null == e ? void 0 : e.type) !== s.f.TextDocument || !!p) && ((null == e ? void 0 : e.type) === s.f.AllCatalogAsset || ((null == e ? void 0 : e.type) === s.f.SharedExperiences ? null == a : (null == e ? void 0 : e.type) === s.f.Moments ? null != c && c : (null == e ? void 0 : e.itemType) === r.f.Bundle || (null == e ? void 0 : e.type) === l || ((null == e ? void 0 : e.type) === f ? null != (d = null == i ? void 0 : i.has(e.type)) && d : (null == e ? void 0 : e.type) === y ? null != o && o : (null == e ? void 0 : e.type) === u ? null != (m = null == i ? void 0 : i.has(null == e ? void 0 : e.type)) && m : (null == e ? void 0 : e.type) === void 0 || !!(0, t.j)(null == e ? void 0 : e.type) || (null == e ? void 0 : e.type) !== void 0 && void 0 === n || null != n && n)))
        },
        getValidMenuState(e, t, s, a, r, n, i, c) {
            var o, l, y, p, d, m;
            let A, E, T = (null == (o = t.submenuItem) ? void 0 : o.type) !== u && (null == (l = t.submenuItem) ? void 0 : l.type) !== f || void 0 !== r;
            if (void 0 === t.menuItem || this.isMenuItemEnabled(t.menuItem, s, a, r, n, i, c)) {
                if (void 0 !== t.submenuItem && T && !this.isMenuItemEnabled(t.submenuItem, s, a, r, n, i, c))
                    if (void 0 !== t.menuItem.submenuItems) {
                        let e = 0,
                            o = 0;
                        for (; o < (null == (p = t.menuItem.submenuItems) ? void 0 : p.length);) {
                            if (this.isMenuItemEnabled(t.menuItem.submenuItems[o], s, a, r, n, i, c)) {
                                e = o;
                                break
                            }
                            o += 1
                        }
                        A = t.menuItem, E = null == (d = t.menuItem.submenuItems) ? void 0 : d[e]
                    } else A = t.menuItem, E = null == (m = t.menuItem.submenuItems) ? void 0 : m[0]
            } else [A] = e, E = null == (y = e[0].submenuItems) ? void 0 : y[0];
            return A ? {
                menuItem: A,
                submenuItem: E
            } : t
        },
        isAssetTypeDirectlyArchivable: e => i.t.has(e),
        isAssetTypeArchivable(e, t) {
            if (void 0 !== t && n.w[e]) {
                let s = n.w[e][t],
                    a = null == s ? void 0 : s.assetType;
                return (null == s ? void 0 : s.bundleType) !== void 0 || void 0 !== a && i.w.has(a)
            }
            return i.w.has(e)
        },
        isAssetTypeSortable: e => i.l.has(e),
        isItemTypeUploadable: e => i.H.has(e),
        getAssetFullNameKey: e => a.M[e],
        getItemFullNameKey: e => a.w[e],
        getAssetType: e => e.submenuItem ? e.submenuItem.type : e.menuItem.type,
        getItemType(e) {
            return e.submenuItem && e.submenuItem.itemType ? e.submenuItem.itemType : e.menuItem.itemType ? e.menuItem.itemType : a.K[this.getAssetType(e)]
        },
        getMenuState(e, t) {
            var s;
            return e && t.includes(e) ? o : e && null != (s = c.get(e)) ? s : o
        }
    }])
}, 696564, e => {
    "use strict";
    var t, s, a, r = e.i(336288),
        n = e.i(913893),
        i = e.i(671376),
        c = e.i(814768),
        o = ((t = {})[t.Invalid = 0] = "Invalid", t[t.MarketplaceAndAllExperiences = 1] = "MarketplaceAndAllExperiences", t[t.ExperiencesAndDevAPIOnly = 2] = "ExperiencesAndDevAPIOnly", t[t.MarketplaceOnly = 3] = "MarketplaceOnly", t[t.MarketplaceAndExperiencesById = 4] = "MarketplaceAndExperiencesById", t),
        u = ((s = {})[s.Invalid = 0] = "Invalid", s[s.Marketplace = 1] = "Marketplace", s[s.InExperience = 2] = "InExperience", s),
        l = ((a = {}).Days3 = "Days3", a.Days7 = "Days7", a.Days14 = "Days14", a.Permanent = "Permanent", a);
    let f = Object.values(l),
        y = [],
        p = [],
        d = [],
        m = [];
    async function A() {
        if (y.length > 0 && p.length > 0) return;
        let e = await n.f.getAllowedAssetTypes(r.j.NUMBER_4, [r.d.NUMBER_0, r.d.NUMBER_1]);
        e.allowedAssetTypes && e.allowedAssetTypes.forEach(e => {
            y.push(e)
        }), e.allowedBundleTypes && e.allowedBundleTypes.forEach(e => {
            p.push((0, c.f)(e))
        })
    }
    async function E() {
        if (d.length > 0 && m.length > 0) return;
        let e = await n.f.getAllowedAssetTypes(r.j.NUMBER_5, [r.d.NUMBER_0, r.d.NUMBER_1]);
        e.allowedAssetTypes && e.allowedAssetTypes.forEach(e => {
            let t = e;
            "TshirtAccessory" === e && (t = "TShirtAccessory"), d.push(t)
        }), e.allowedBundleTypes && e.allowedBundleTypes.forEach(e => {
            m.push((0, c.f)(e))
        })
    }
    e.s(["N", 0, 0x3b9ac9ff, "P", 0, f, "h", () => l, "T", 0, .3, "O", () => u, "Q", () => o, "v", 0, d, "U", 0, m, "Y", 0, y, "R", 0, p, "l", 0, E, "s", 0, A, "V", 0, function(e) {
        switch (e) {
            case r.t.NUMBER_1:
                return i.f.Image.toString();
            case r.t.NUMBER_2:
                return i.f.TShirt.toString();
            case r.t.NUMBER_3:
                return i.f.Audio.toString();
            case r.t.NUMBER_4:
                return i.f.Mesh.toString();
            case r.t.NUMBER_8:
                return i.f.Hat.toString();
            case r.t.NUMBER_9:
                return i.f.Place.toString();
            case r.t.NUMBER_10:
                return i.f.Model.toString();
            case r.t.NUMBER_11:
                return i.f.Shirt.toString();
            case r.t.NUMBER_12:
                return i.f.Pants.toString();
            case r.t.NUMBER_13:
                return i.f.Decal.toString();
            case r.t.NUMBER_24:
                return i.f.Animation.toString();
            case r.t.NUMBER_38:
                return i.f.Plugin.toString();
            case r.t.NUMBER_40:
                return i.f.MeshPart.toString();
            case r.t.NUMBER_41:
                return i.f.HairAccessory.toString();
            case r.t.NUMBER_42:
                return i.f.FaceAccessory.toString();
            case r.t.NUMBER_43:
                return i.f.NeckAccessory.toString();
            case r.t.NUMBER_44:
                return i.f.ShoulderAccessory.toString();
            case r.t.NUMBER_45:
                return i.f.FrontAccessory.toString();
            case r.t.NUMBER_46:
                return i.f.BackAccessory.toString();
            case r.t.NUMBER_47:
                return i.f.WaistAccessory.toString();
            case r.t.NUMBER_61:
                return i.f.EmoteAnimation.toString();
            case r.t.NUMBER_62:
                return i.f.Video.toString();
            case r.t.NUMBER_64:
                return i.f.TShirtAccessory.toString();
            case r.t.NUMBER_65:
                return i.f.ShirtAccessory.toString();
            case r.t.NUMBER_66:
                return i.f.PantsAccessory.toString();
            case r.t.NUMBER_67:
                return i.f.JacketAccessory.toString();
            case r.t.NUMBER_68:
                return i.f.SweaterAccessory.toString();
            case r.t.NUMBER_69:
                return i.f.ShortsAccessory.toString();
            case r.t.NUMBER_72:
                return i.f.DressSkirtAccessory.toString();
            case r.t.NUMBER_73:
                return i.f.FontFamily.toString();
            case r.t.NUMBER_76:
                return i.f.EyebrowAccessory.toString();
            case r.t.NUMBER_77:
                return i.f.EyelashAccessory.toString();
            case r.t.NUMBER_88:
                return i.f.FaceMakeup.toString();
            case r.t.NUMBER_89:
                return i.f.LipMakeup.toString();
            case r.t.NUMBER_90:
                return i.f.EyeMakeup.toString();
            case r.t.NUMBER_92:
                return i.f.AvatarBackground.toString();
            default:
                return "Invalid"
        }
    }, "x", 0, function(e) {
        switch (e) {
            case r.z.NUMBER_1:
                return "Body";
            case r.z.NUMBER_2:
                return "DynamicHead";
            case r.z.NUMBER_3:
                return "Shoes";
            case r.z.NUMBER_4:
                return "AvatarAnimations";
            default:
                return "Invalid"
        }
    }, "$", 0, function(e) {
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
    }, "n", 0, function(e) {
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
    }, "S", 0, function(e) {
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
    }, "W", 0, function(e) {
        switch (e) {
            case 1:
                return r.p.NUMBER_1;
            case 2:
                return r.p.NUMBER_2;
            case 3:
                return r.p.NUMBER_3;
            case 4:
                return r.p.NUMBER_4;
            default:
                return r.p.NUMBER_0
        }
    }])
}, 418162, e => {
    "use strict";
    var t = e.i(974184),
        s = e.i(336288),
        a = e.i(671376),
        r = e.i(759283),
        n = e.i(927868),
        i = e.i(949599),
        c = e.i(696564);
    let o = {
            [a.f.Place]: {
                asset: a.f.Place,
                apiType: s.a.NUMBER_9
            },
            [a.f.TShirt]: {
                asset: a.f.TShirt,
                apiType: s.a.NUMBER_2
            },
            [a.f.Shirt]: {
                asset: a.f.Shirt,
                apiType: s.a.NUMBER_11
            },
            [a.f.Pants]: {
                asset: a.f.Pants,
                apiType: s.a.NUMBER_12
            },
            [a.f.Hat]: {
                asset: a.f.Hat,
                apiType: s.a.NUMBER_8
            },
            [a.f.HairAccessory]: {
                asset: a.f.HairAccessory,
                apiType: s.a.NUMBER_41
            },
            [a.f.FaceAccessory]: {
                asset: a.f.FaceAccessory,
                apiType: s.a.NUMBER_42
            },
            [a.f.NeckAccessory]: {
                asset: a.f.NeckAccessory,
                apiType: s.a.NUMBER_43
            },
            [a.f.ShoulderAccessory]: {
                asset: a.f.ShoulderAccessory,
                apiType: s.a.NUMBER_44
            },
            [a.f.FrontAccessory]: {
                asset: a.f.FrontAccessory,
                apiType: s.a.NUMBER_45
            },
            [a.f.BackAccessory]: {
                asset: a.f.BackAccessory,
                apiType: s.a.NUMBER_46
            },
            [a.f.WaistAccessory]: {
                asset: a.f.WaistAccessory,
                apiType: s.a.NUMBER_47
            },
            [a.f.TShirtAccessory]: {
                asset: a.f.TShirtAccessory,
                apiType: s.a.NUMBER_64
            },
            [a.f.ShirtAccessory]: {
                asset: a.f.ShirtAccessory,
                apiType: s.a.NUMBER_65
            },
            [a.f.PantsAccessory]: {
                asset: a.f.PantsAccessory,
                apiType: s.a.NUMBER_66
            },
            [a.f.JacketAccessory]: {
                asset: a.f.JacketAccessory,
                apiType: s.a.NUMBER_67
            },
            [a.f.SweaterAccessory]: {
                asset: a.f.SweaterAccessory,
                apiType: s.a.NUMBER_68
            },
            [a.f.ShortsAccessory]: {
                asset: a.f.ShortsAccessory,
                apiType: s.a.NUMBER_69
            },
            [a.f.DressSkirtAccessory]: {
                asset: a.f.DressSkirtAccessory,
                apiType: s.a.NUMBER_72
            },
            [a.f.EmoteAnimation]: {
                asset: a.f.EmoteAnimation,
                apiType: s.a.NUMBER_61
            },
            [a.f.AllCatalogAsset]: {
                asset: a.f.AllCatalogAsset,
                apiType: s.a.NUMBER_0
            },
            [a.f.AvatarLooks]: {
                asset: a.f.AvatarLooks,
                apiType: s.a.NUMBER_0
            },
            [a.f.Showcase]: {
                asset: a.f.Showcase,
                apiType: s.a.NUMBER_0
            },
            [a.f.Decal]: {
                asset: a.f.Decal,
                apiType: s.a.NUMBER_13
            },
            [a.f.Image]: {
                asset: a.f.Image,
                apiType: s.a.NUMBER_1
            },
            [a.f.Audio]: {
                asset: a.f.Audio,
                apiType: s.a.NUMBER_3
            },
            [a.f.Model]: {
                asset: a.f.Model,
                apiType: s.a.NUMBER_10
            },
            [a.f.Mesh]: {
                asset: a.f.Mesh,
                apiType: s.a.NUMBER_4
            },
            [a.f.MeshPart]: {
                asset: a.f.MeshPart,
                apiType: s.a.NUMBER_40
            },
            [a.f.Plugin]: {
                asset: a.f.Plugin,
                apiType: s.a.NUMBER_38
            },
            [a.f.Animation]: {
                asset: a.f.Animation,
                apiType: s.a.NUMBER_24
            },
            [a.f.Video]: {
                asset: a.f.Video,
                apiType: s.a.NUMBER_62
            },
            [a.f.FontFamily]: {
                asset: a.f.FontFamily,
                apiType: s.a.NUMBER_73
            },
            [a.f.StorePreviewVideo]: {
                asset: a.f.StorePreviewVideo,
                apiType: s.a.NUMBER_0
            },
            [a.f.GamePreviewVideo]: {
                asset: a.f.GamePreviewVideo,
                apiType: s.a.NUMBER_0
            },
            [a.f.MyExperiences]: {
                asset: a.f.MyExperiences,
                apiType: s.a.NUMBER_0
            },
            [a.f.SharedExperiences]: {
                asset: a.f.SharedExperiences,
                apiType: s.a.NUMBER_0
            },
            [a.f.ShareLink]: {
                asset: a.f.ShareLink,
                apiType: s.a.NUMBER_0
            },
            [a.f.Moments]: {
                asset: a.f.Moments,
                apiType: s.a.NUMBER_0
            },
            [a.f.Event]: {
                asset: a.f.Event,
                apiType: s.a.NUMBER_0
            },
            [a.f.UpcomingEvent]: {
                asset: a.f.UpcomingEvent,
                apiType: s.a.NUMBER_0
            },
            [a.f.DraftEvent]: {
                asset: a.f.DraftEvent,
                apiType: s.a.NUMBER_0
            },
            [a.f.PastEvent]: {
                asset: a.f.PastEvent,
                apiType: s.a.NUMBER_0
            },
            [a.f.EyebrowAccessory]: {
                asset: a.f.EyebrowAccessory,
                apiType: s.a.NUMBER_76
            },
            [a.f.EyelashAccessory]: {
                asset: a.f.EyelashAccessory,
                apiType: s.a.NUMBER_77
            },
            [a.f.FaceMakeup]: {
                asset: a.f.FaceMakeup,
                apiType: s.a.NUMBER_88
            },
            [a.f.LipMakeup]: {
                asset: a.f.LipMakeup,
                apiType: s.a.NUMBER_89
            },
            [a.f.EyeMakeup]: {
                asset: a.f.EyeMakeup,
                apiType: s.a.NUMBER_90
            },
            [a.f.AvatarBackground]: {
                asset: a.f.AvatarBackground,
                apiType: s.a.NUMBER_92
            },
            [a.f.TextDocument]: {
                asset: a.f.TextDocument,
                apiType: s.a.NUMBER_0
            },
            [a.f.AssetPermissionRequests]: {
                asset: a.f.AssetPermissionRequests,
                apiType: s.a.NUMBER_0
            }
        },
        u = e => {
            let t = Object.values(o).find(t => t.apiType === e);
            return null == t ? void 0 : t.asset
        },
        l = e => {
            switch (e) {
                case s.z.NUMBER_0:
                    return i.i.Unknown;
                case s.z.NUMBER_1:
                    return i.i.Body;
                case s.z.NUMBER_2:
                    return i.i.DynamicHead;
                case s.z.NUMBER_3:
                    return i.i.Shoes;
                case s.z.NUMBER_4:
                    return i.i.AvatarAnimations;
                default:
                    return i.i.Unknown
            }
        },
        f = e => {
            switch (e) {
                case s.e.Unknown:
                    return i.i.Unknown;
                case s.e.Body:
                    return i.i.Body;
                case s.e.DynamicHead:
                    return i.i.DynamicHead;
                case s.e.Shoes:
                    return i.i.Shoes;
                case s.e.AvatarAnimations:
                    return i.i.AvatarAnimations;
                default:
                    return i.i.Unknown
            }
        };
    a.f.TShirt, a.f.Shirt, a.f.Pants;
    let y = new Set([a.f.TShirt, a.f.Pants, a.f.Shirt].map(e => e.toLowerCase())),
        p = (e, s) => {
            if (null == e) return !1;
            let a = e.status !== t.Y.Active && e.status !== t.Y.Accepted,
                r = null != e.endTime && e.endTime.getTime() <= s.getTime();
            return a || r
        };
    e.s(["X", 0, e => {
        var t, s, a, r, n, i;
        return null != (t = null != (s = null != (a = null == e || null == (r = e.license) ? void 0 : r.name) ? a : null == e || null == (n = e.listing) ? void 0 : n.name) ? s : null == e || null == (i = e.license) ? void 0 : i.listingName) ? t : void 0
    }, "z", 0, e => {
        var t, s;
        let a = null != (t = null == e ? void 0 : e.endTime) ? t : null;
        if (null != a) return {
            startTime: null != (s = null == e ? void 0 : e.startTime) ? s : null,
            endTime: a
        }
    }, "D", 0, function(e, t) {
        return "/dashboard/creations/".concat(r.e[e], "/").concat(t, "/configure")
    }, "u", 0, (e, t) => e ? {
        startTime: null != e.startTime ? new Date(Math.max(e.startTime.getTime(), t.getTime())) : null,
        endTime: e.endTime
    } : void 0, "E", 0, function(e, t) {
        if (void 0 !== e) {
            if ("number" == typeof e) {
                let t = u(e);
                return !!t && c.Y.includes(t)
            }
            return c.Y.includes(e)
        }
        if (void 0 !== t) {
            if ((0, n.s)(s.z, t)) return c.R.includes(l(t));
            if ((0, n.s)(s.e, t)) return c.R.includes(f(t));
            if ((0, n.s)(i.i, t)) return c.R.includes(t)
        }
        return !1
    }, "G", 0, function(e, t) {
        if (void 0 !== e) {
            if ("number" == typeof e) {
                let t = u(e);
                return !!t && c.v.includes(t)
            }
            return c.v.includes(e)
        }
        if (void 0 !== t) {
            if ((0, n.s)(s.z, t)) return c.U.includes(l(t));
            if ((0, n.s)(s.e, t)) return c.U.includes(f(t));
            if ((0, n.s)(i.i, t)) return c.U.includes(t)
        }
        return !1
    }, "q", 0, function(e, t) {
        let s = e.toLowerCase(),
            a = y.has(s) ? "".concat(s, "accessory") : s;
        return "".concat("".concat("https://assets.create.roblox.com/dea85e59b76ad172160a6753a6bf9008dac07d11/assets", "/unifiedFeeSystem"), "/").concat(t ? "".concat(a, ".svg") : "".concat(a, "_black.svg"))
    }, "U", 0, function(e, t) {
        return "/dashboard/creations/".concat(r.e[e], "/").concat(t, "/publish")
    }, "h", 0, function(e, t) {
        let s, a = t((s = e.replaceAll(/[^a-zA-Z0-9]/g, ""), "Label.Taxonomy".concat(s)));
        return null == a || "" === a ? e : a
    }, "v", 0, e => (null == e ? void 0 : e.revenueTargetsCount) != null && null != e.maxRevenueTargets && e.revenueTargetsCount >= e.maxRevenueTargets, "y", 0, p, "l", 0, (e, s) => null == e || e.status === t.Y.Active && !p(e, s), "k", 0, e => {
        var t, a;
        return null != (t = null == (a = o[e]) ? void 0 : a.apiType) ? t : s.a.NUMBER_0
    }, "Y", 0, u, "F", 0, e => {
        switch (e) {
            case s.z.NUMBER_0:
                return s.e.Unknown;
            case s.z.NUMBER_1:
                return s.e.Body;
            case s.z.NUMBER_2:
                return s.e.DynamicHead;
            case s.z.NUMBER_3:
                return s.e.Shoes;
            case s.z.NUMBER_4:
                return s.e.AvatarAnimations;
            default:
                return s.e.Unknown
        }
    }, "n", 0, f, "H", 0, e => {
        switch (e) {
            case i.i.Body:
                return "Body";
            case i.i.DynamicHead:
                return "DynamicHead";
            case i.i.Shoes:
                return "Shoes";
            case i.i.AvatarAnimations:
                return "AvatarAnimations";
            case i.i.Unknown:
            default:
                return "Unknown"
        }
    }])
}, 814768, 266213, 949599, e => {
    "use strict";
    var t, s, a = e.i(671376),
        r = e.i(475360),
        n = ((t = n || {}).Makeup = "Makeup", t.Avatar = "Avatar", t);
    e.s(["f", 0, n], 266213);
    var i = ((s = {})[s.Unknown = 0] = "Unknown", s[s.Body = 1] = "Body", s[s.DynamicHead = 2] = "DynamicHead", s[s.Shoes = 3] = "Shoes", s[s.AvatarAnimations = 4] = "AvatarAnimations", s);
    let c = {
            [a.f.HairAccessory]: "Label.Body",
            [a.f.TShirt]: "Label.Classic",
            [a.f.Hat]: "Label.Accessory",
            [a.f.TShirtAccessory]: "Label.Clothing",
            [a.f.EmoteAnimation]: "Label.Animation",
            [a.f.AllCatalogAsset]: "Label.Folder",
            [a.f.EyeMakeup]: "Label.Makeup"
        },
        o = {
            [a.f.HairAccessory]: [{
                assetType: a.f.HairAccessory,
                nameKey: "Label.HairAccessories"
            }, {
                itemType: r.f.Bundle,
                id: 2,
                nameKey: "Label.Bodies",
                bundleType: 1
            }, {
                itemType: r.f.Bundle,
                id: 2,
                nameKey: "Label.DynamicHeads",
                bundleType: 2
            }],
            [a.f.TShirt]: [{
                assetType: a.f.TShirt,
                nameKey: "Label.ClassicTShirts"
            }, {
                assetType: a.f.Shirt,
                nameKey: "Label.ClassicShirts"
            }, {
                assetType: a.f.Pants,
                nameKey: "Label.ClassicPants"
            }],
            [a.f.Hat]: [{
                assetType: a.f.Hat,
                nameKey: "Label.Hats"
            }, {
                assetType: a.f.HairAccessory,
                nameKey: "Label.HairAccessories"
            }, {
                assetType: a.f.FaceAccessory,
                nameKey: "Label.FaceAccessories"
            }, {
                assetType: a.f.NeckAccessory,
                nameKey: "Label.NeckAccessories"
            }, {
                assetType: a.f.ShoulderAccessory,
                nameKey: "Label.ShoulderAccessories"
            }, {
                assetType: a.f.FrontAccessory,
                nameKey: "Label.FrontAccessories"
            }, {
                assetType: a.f.BackAccessory,
                nameKey: "Label.BackAccessories"
            }, {
                assetType: a.f.WaistAccessory,
                nameKey: "Label.WaistAccessories"
            }],
            [a.f.TShirtAccessory]: [{
                assetType: a.f.TShirtAccessory,
                nameKey: "Label.TShirts"
            }, {
                assetType: a.f.ShirtAccessory,
                nameKey: "Label.Shirts"
            }, {
                assetType: a.f.PantsAccessory,
                nameKey: "Label.Pants"
            }, {
                assetType: a.f.JacketAccessory,
                nameKey: "Label.Jackets"
            }, {
                assetType: a.f.SweaterAccessory,
                nameKey: "Label.Sweaters"
            }, {
                assetType: a.f.ShortsAccessory,
                nameKey: "Label.ShortsAccessories"
            }, {
                assetType: a.f.DressSkirtAccessory,
                nameKey: "Label.Skirts"
            }, {
                itemType: r.f.Bundle,
                nameKey: "Label.Shoes",
                bundleType: 3
            }],
            [a.f.EmoteAnimation]: [{
                assetType: a.f.EmoteAnimation,
                nameKey: "Label.Emote"
            }, {
                itemType: r.f.Bundle,
                nameKey: "Label.AvatarAnimations",
                bundleType: 4
            }],
            [a.f.EyeMakeup]: [{
                assetType: a.f.EyeMakeup,
                nameKey: "Label.EyeMakeupAccessories"
            }, {
                assetType: a.f.LipMakeup,
                nameKey: "Label.LipMakeupAccessories"
            }, {
                assetType: a.f.FaceMakeup,
                nameKey: "Label.FaceMakeupAccessories"
            }, {
                assetType: a.f.EyebrowAccessory,
                nameKey: "Label.EyebrowAccessories"
            }, {
                assetType: a.f.EyelashAccessory,
                nameKey: "Label.EyelashAccessories"
            }, {
                lookType: n.Makeup,
                nameKey: "Label.Looks"
            }],
            [a.f.AvatarBackground]: [{
                assetType: a.f.AvatarBackground,
                nameKey: "Label.Backgrounds"
            }]
        },
        u = new Set([a.f.TShirtAccessory, a.f.PantsAccessory, a.f.SweaterAccessory]),
        l = [a.f.TShirtAccessory, a.f.ShirtAccessory, a.f.PantsAccessory, a.f.JacketAccessory, a.f.SweaterAccessory, a.f.ShortsAccessory, a.f.DressSkirtAccessory],
        f = [a.f.EyeMakeup, a.f.LipMakeup, a.f.FaceMakeup, a.f.EyebrowAccessory, a.f.EyelashAccessory],
        y = [a.f.Hat, a.f.HairAccessory, a.f.FaceAccessory, a.f.NeckAccessory, a.f.ShoulderAccessory, a.f.FrontAccessory, a.f.BackAccessory, a.f.WaistAccessory];
    e.s(["U", 0, y, "z", 0, c, "w", 0, o, "i", () => i, "o", 0, l, "t", 0, 30, "l", 0, 30, "n", 0, f, "S", 0, 50, "X", 0, u, "V", 0, {
        nameKey: "Label.Recents",
        isRecents: !0
    }], 949599), e.s(["f", 0, e => {
        switch (e) {
            case "Body":
                return i.Body;
            case "DynamicHead":
                return i.DynamicHead;
            case "Shoes":
                return i.Shoes;
            case "AvatarAnimations":
                return i.AvatarAnimations;
            default:
                return i.Unknown
        }
    }], 814768)
}, 812141, e => {
    "use strict";
    var t = e.i(60584),
        s = e.i(910272);
    let a = {},
        r = e => ["folders", null != e ? e : null];
    e.s(["U", 0, function(e) {
        return (0, s.f)({
            queryKey: ["metadata"],
            queryFn: async () => {
                try {
                    let t = await e.getCollectiblesMetadata();
                    return null != t ? t : a
                } catch (e) {
                    return a
                }
            }
        })
    }, "o", 0, r, "Q", 0, function(e, s) {
        let {
            onSuccess: a,
            onError: r
        } = s;
        return (0, t.f)({
            mutationFn: t => e.addItemToFolder(t.itemId, t.itemType, t.folderId),
            onSuccess: a,
            onError: r
        })
    }, "P", 0, function(e, s) {
        let {
            onSuccess: a,
            onError: r
        } = s;
        return (0, t.f)({
            mutationFn: t => e.createFolder(t.name, void 0, t.groupId),
            onSuccess: e => {
                var t;
                return a(null != (t = e.folderId) ? t : "")
            },
            onError: r
        })
    }, "s", 0, function(e, t) {
        let a = !(arguments.length > 2) || void 0 === arguments[2] || arguments[2];
        return (0, s.f)({
            queryKey: r(t),
            queryFn: () => e.getFolders(t),
            enabled: a
        })
    }, "y", 0, function(e, s) {
        let {
            onSuccess: a,
            onError: r
        } = s;
        return (0, t.f)({
            mutationFn: t => e.updateFolder(t.folderId, t.name),
            onSuccess: a,
            onError: r
        })
    }])
}]);

//# debugId=f89f0664-4370-f5fe-3d8e-08af2c40fdca
//# sourceMappingURL=26_8-zpt59to8.js.map