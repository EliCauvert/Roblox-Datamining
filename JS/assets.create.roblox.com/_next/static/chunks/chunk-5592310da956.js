;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "fb92edd4-1cb9-b713-fb63-494db6c8c9dd")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 970494, 102211, 361738, e => {
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

    function o(e, t, a, o) {
        return new(a || (a = Promise))(function(n, r) {
            function i(e) {
                try {
                    s(o.next(e))
                } catch (e) {
                    r(e)
                }
            }

            function l(e) {
                try {
                    s(o.throw(e))
                } catch (e) {
                    r(e)
                }
            }

            function s(e) {
                var t;
                e.done ? n(e.value) : ((t = e.value) instanceof a ? t : new a(function(e) {
                    e(t)
                })).then(i, l)
            }
            s((o = o.apply(e, t || [])).next())
        })
    }

    function n(e, t) {
        var a, o, n, r = {
                label: 0,
                sent: function() {
                    if (1 & n[0]) throw n[1];
                    return n[1]
                },
                trys: [],
                ops: []
            },
            i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return i.next = l(0), i.throw = l(1), i.return = l(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
            return this
        }), i;

        function l(l) {
            return function(s) {
                var c = [l, s];
                if (a) throw TypeError("Generator is already executing.");
                for (; i && (i = 0, c[0] && (r = 0)), r;) try {
                    if (a = 1, o && (n = 2 & c[0] ? o.return : c[0] ? o.throw || ((n = o.return) && n.call(o), 0) : o.next) && !(n = n.call(o, c[1])).done) return n;
                    switch (o = 0, n && (c = [2 & c[0], n.value]), c[0]) {
                        case 0:
                        case 1:
                            n = c;
                            break;
                        case 4:
                            return r.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            r.label++, o = c[1], c = [0];
                            continue;
                        case 7:
                            c = r.ops.pop(), r.trys.pop();
                            continue;
                        default:
                            if (!(n = (n = r.trys).length > 0 && n[n.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                r = 0;
                                continue
                            }
                            if (3 === c[0] && (!n || c[1] > n[0] && c[1] < n[3])) {
                                r.label = c[1];
                                break
                            }
                            if (6 === c[0] && r.label < n[1]) {
                                r.label = n[1], n = c;
                                break
                            }
                            if (n && r.label < n[2]) {
                                r.label = n[2], r.ops.push(c);
                                break
                            }
                            n[2] && r.ops.pop(), r.trys.pop();
                            continue
                    }
                    c = t.call(e, r)
                } catch (e) {
                    c = [6, e], o = 0
                } finally {
                    a = n = 0
                }
                if (5 & c[0]) throw c[1];
                return {
                    value: c[0] ? c[1] : void 0,
                    done: !0
                }
            }
        }
    }
    "function" == typeof SuppressedError && SuppressedError;
    var r = {
        Invalid: "ASSET_TYPE_INVALID",
        Image: "ASSET_TYPE_IMAGE",
        Tshirt: "ASSET_TYPE_TSHIRT",
        Audio: "ASSET_TYPE_AUDIO",
        Mesh: "ASSET_TYPE_MESH",
        Lua: "ASSET_TYPE_LUA",
        Html: "ASSET_TYPE_HTML",
        Text: "ASSET_TYPE_TEXT",
        Hat: "ASSET_TYPE_HAT",
        Place: "ASSET_TYPE_PLACE",
        Model: "ASSET_TYPE_MODEL",
        Shirt: "ASSET_TYPE_SHIRT",
        Pants: "ASSET_TYPE_PANTS",
        Decal: "ASSET_TYPE_DECAL",
        Avatar: "ASSET_TYPE_AVATAR",
        Head: "ASSET_TYPE_HEAD",
        Face: "ASSET_TYPE_FACE",
        Gear: "ASSET_TYPE_GEAR",
        Badge: "ASSET_TYPE_BADGE",
        GroupEmblem: "ASSET_TYPE_GROUP_EMBLEM",
        Animation: "ASSET_TYPE_ANIMATION",
        Arms: "ASSET_TYPE_ARMS",
        Legs: "ASSET_TYPE_LEGS",
        Torso: "ASSET_TYPE_TORSO",
        RightArm: "ASSET_TYPE_RIGHT_ARM",
        LeftArm: "ASSET_TYPE_LEFT_ARM",
        LeftLeg: "ASSET_TYPE_LEFT_LEG",
        RightLeg: "ASSET_TYPE_RIGHT_LEG",
        Package: "ASSET_TYPE_PACKAGE",
        YoutubeVideo: "ASSET_TYPE_YOUTUBE_VIDEO",
        GamePass: "ASSET_TYPE_GAME_PASS",
        App: "ASSET_TYPE_APP",
        Code: "ASSET_TYPE_CODE",
        Plugin: "ASSET_TYPE_PLUGIN",
        SolidModel: "ASSET_TYPE_SOLID_MODEL",
        MeshPart: "ASSET_TYPE_MESH_PART",
        HairAccessory: "ASSET_TYPE_HAIR_ACCESSORY",
        FaceAccessory: "ASSET_TYPE_FACE_ACCESSORY",
        NeckAccessory: "ASSET_TYPE_NECK_ACCESSORY",
        ShoulderAccessory: "ASSET_TYPE_SHOULDER_ACCESSORY",
        FrontAccessory: "ASSET_TYPE_FRONT_ACCESSORY",
        BackAccessory: "ASSET_TYPE_BACK_ACCESSORY",
        WaistAccessory: "ASSET_TYPE_WAIST_ACCESSORY",
        ClimbAnimation: "ASSET_TYPE_CLIMB_ANIMATION",
        DeathAnimation: "ASSET_TYPE_DEATH_ANIMATION",
        FallAnimation: "ASSET_TYPE_FALL_ANIMATION",
        IdleAnimation: "ASSET_TYPE_IDLE_ANIMATION",
        JumpAnimation: "ASSET_TYPE_JUMP_ANIMATION",
        RunAnimation: "ASSET_TYPE_RUN_ANIMATION",
        SwimAnimation: "ASSET_TYPE_SWIM_ANIMATION",
        WalkAnimation: "ASSET_TYPE_WALK_ANIMATION",
        PoseAnimation: "ASSET_TYPE_POSE_ANIMATION",
        LocalizationTableManifest: "ASSET_TYPE_LOCALIZATION_TABLE_MANIFEST",
        LocalizationTableTranslation: "ASSET_TYPE_LOCALIZATION_TABLE_TRANSLATION",
        EmoteAnimation: "ASSET_TYPE_EMOTE_ANIMATION",
        Video: "ASSET_TYPE_VIDEO",
        TexturePack: "ASSET_TYPE_TEXTURE_PACK",
        TshirtAccessory: "ASSET_TYPE_TSHIRT_ACCESSORY",
        ShirtAccessory: "ASSET_TYPE_SHIRT_ACCESSORY",
        PantsAccessory: "ASSET_TYPE_PANTS_ACCESSORY",
        JacketAccessory: "ASSET_TYPE_JACKET_ACCESSORY",
        SweaterAccessory: "ASSET_TYPE_SWEATER_ACCESSORY",
        ShortsAccessory: "ASSET_TYPE_SHORTS_ACCESSORY",
        LeftShoeAccessory: "ASSET_TYPE_LEFT_SHOE_ACCESSORY",
        RightShoeAccessory: "ASSET_TYPE_RIGHT_SHOE_ACCESSORY",
        DressSkirtAccessory: "ASSET_TYPE_DRESS_SKIRT_ACCESSORY",
        FontFamily: "ASSET_TYPE_FONT_FAMILY",
        FontFace: "ASSET_TYPE_FONT_FACE",
        MeshHiddenSurfaceRemoval: "ASSET_TYPE_MESH_HIDDEN_SURFACE_REMOVAL",
        EyebrowAccessory: "ASSET_TYPE_EYEBROW_ACCESSORY",
        EyelashAccessory: "ASSET_TYPE_EYELASH_ACCESSORY",
        MoodAnimation: "ASSET_TYPE_MOOD_ANIMATION",
        DynamicHead: "ASSET_TYPE_DYNAMIC_HEAD",
        CodeSnippet: "ASSET_TYPE_CODE_SNIPPET",
        AdsVideo: "ASSET_TYPE_ADS_VIDEO",
        TextDocument: "ASSET_TYPE_TEXT_DOCUMENT"
    };

    function i(e) {
        var a;
        return null == (a = e) ? a : {
            createdDetails: (0, t.exists)(a, "createdDetails") ? a.createdDetails : void 0,
            purchasedDetails: (0, t.exists)(a, "purchasedDetails") ? a.purchasedDetails : void 0,
            sharedDetails: (0, t.exists)(a, "sharedDetails") ? a.sharedDetails : void 0
        }
    }

    function l(e) {
        var a, o, n, r, l, s, c;
        return null == (a = e) ? a : {
            path: (0, t.exists)(a, "path") ? a.path : void 0,
            assetItem: (0, t.exists)(a, "assetItem") ? null == (o = a.assetItem) ? o : {
                asset: (0, t.exists)(o, "asset") ? null == (n = o.asset) ? n : {
                    createTime: (0, t.exists)(n, "createTime") ? new Date(n.createTime) : void 0,
                    updateTime: (0, t.exists)(n, "updateTime") ? new Date(n.updateTime) : void 0,
                    assetId: (0, t.exists)(n, "assetId") ? n.assetId : void 0,
                    displayName: (0, t.exists)(n, "displayName") ? n.displayName : void 0,
                    description: (0, t.exists)(n, "description") ? n.description : void 0,
                    assetType: (0, t.exists)(n, "assetType") ? n.assetType : void 0,
                    creationContext: (0, t.exists)(n, "creationContext") ? null == (r = n.creationContext) ? r : {
                        creator: (0, t.exists)(r, "creator") ? null == (l = r.creator) ? l : {
                            userId: (0, t.exists)(l, "userId") ? l.userId : void 0,
                            groupId: (0, t.exists)(l, "groupId") ? l.groupId : void 0,
                            name: (0, t.exists)(l, "name") ? l.name : void 0
                        } : void 0
                    } : void 0,
                    state: (0, t.exists)(n, "state") ? n.state : void 0,
                    assetSubType: (0, t.exists)(n, "assetSubType") ? n.assetSubType : void 0
                } : void 0,
                sources: (0, t.exists)(o, "sources") ? o.sources.map(i) : void 0,
                isPackage: (0, t.exists)(o, "isPackage") ? o.isPackage : void 0
            } : void 0,
            folderItem: (0, t.exists)(a, "folderItem") ? null == (s = a.folderItem) ? s : {
                folder: (0, t.exists)(s, "folder") ? null == (c = s.folder) ? c : {
                    folderId: (0, t.exists)(c, "folderId") ? c.folderId : void 0,
                    parentFolderId: (0, t.exists)(c, "parentFolderId") ? c.parentFolderId : void 0,
                    displayName: (0, t.exists)(c, "displayName") ? c.displayName : void 0,
                    createTime: (0, t.exists)(c, "createTime") ? new Date(c.createTime) : void 0,
                    updateTime: (0, t.exists)(c, "updateTime") ? new Date(c.updateTime) : void 0
                } : void 0
            } : void 0
        }
    }
    var s = {
            Invalid: "Invalid",
            Created: "Created",
            Purchased: "Purchased",
            Shared: "Shared"
        },
        c = ["assetTypes", "userIds", "groupIds", "universeIds", "includeFolders", "sources"],
        d = function(e) {
            return Object.fromEntries(Object.entries(e).map(function(e) {
                var t = e[0];
                return [e[1], t]
            }))
        },
        u = {
            assetTypes: d(r),
            sources: d(s)
        };

    function p(e, t) {
        var a, o = String(e);
        return t && null != (a = t[o]) ? a : o
    }
    var m = function(e) {
        function r() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, t) {
            if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

            function o() {
                this.constructor = e
            }
            a(e, t), e.prototype = null === t ? Object.create(t) : (o.prototype = t.prototype, new o)
        }(r, e), r.prototype.creatorInventorySearchCreatorInventoryItemsRaw = function(e, a) {
            return o(this, void 0, void 0, function() {
                var o, r, i;
                return n(this, function(n) {
                    switch (n.label) {
                        case 0:
                            if (null === e.filter || void 0 === e.filter) throw new t.RequiredError("filter", "Required parameter requestParameters.filter was null or undefined when calling creatorInventorySearchCreatorInventoryItems.");
                            return o = {}, void 0 !== e.query && (o.query = e.query), void 0 !== e.filter && (o.filter = function(e) {
                                for (var t = [], a = 0; a < c.length; a++) ! function(a) {
                                    var o = e[a];
                                    if (null != o) {
                                        var n = u[a];
                                        if (Array.isArray(o)) {
                                            if (0 === o.length) return;
                                            t.push("".concat(a, "=").concat(o.map(function(e) {
                                                return p(e, n)
                                            }).join(",")))
                                        } else t.push("".concat(a, "=").concat(p(o, n)))
                                    }
                                }(c[a]);
                                return t.join(";")
                            }(e.filter)), void 0 !== e.maxPageSize && (o.maxPageSize = e.maxPageSize), void 0 !== e.pageToken && (o.pageToken = e.pageToken), r = {}, [4, this.request({
                                path: "/v1/-/creator-inventory-items:search",
                                schemaPath: "/v1/-/creator-inventory-items:search",
                                method: "GET",
                                headers: r,
                                query: o
                            }, a)];
                        case 1:
                            return i = n.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                return null == e ? e : {
                                    items: (0, t.exists)(e, "items") ? e.items.map(l) : void 0,
                                    nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
                                }
                            })]
                    }
                })
            })
        }, r.prototype.creatorInventorySearchCreatorInventoryItems = function(e, t) {
            return o(this, void 0, void 0, function() {
                return n(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.creatorInventorySearchCreatorInventoryItemsRaw(e, t)];
                        case 1:
                            return [4, a.sent().value()];
                        case 2:
                            return [2, a.sent()]
                    }
                })
            })
        }, r
    }(t.BaseAPI);
    e.s(["AssetType", 0, r, "CreatorInventoryApi", 0, m, "SourceType", 0, s, "State", 0, {
        Invalid: "STATE_INVALID",
        Active: "STATE_ACTIVE",
        Archived: "STATE_ARCHIVED"
    }], 102211), e.s(["CreatorInventorySourceType", 0, s], 361738);
    let h = ["development-items-inventory"],
        f = ["development-item-metadata-overrides"],
        y = ["development-item-upload-overrides"],
        S = e => null != e ? e : "",
        E = e => {
            var t;
            return null != (t = null == e ? void 0 : e.trim()) ? t : ""
        },
        T = (e, t) => {
            e.setQueryData(f, e => {
                if ((null == e ? void 0 : e.has(t)) !== !0) return e;
                let a = new Map(e);
                return a.delete(t), a
            })
        },
        A = (e, t) => {
            var a;
            let o = null == (a = e.getQueryData(f)) ? void 0 : a.get(t);
            return null != o && o.expiresAt <= Date.now() ? void T(e, t) : o
        },
        g = (e, t) => {
            e.setQueryData(y, e => {
                if ((null == e ? void 0 : e.has(t)) !== !0) return e;
                let a = new Map(e);
                return a.delete(t), a
            })
        },
        v = (e, t, a) => {
            e.setQueryData(f, e => {
                let o = null == e ? void 0 : e.get(t);
                if (null == o) return e;
                let n = {
                        ...o,
                        developConfirmed: "develop" === a || o.developConfirmed,
                        inventoryConfirmed: "inventory" === a || o.inventoryConfirmed
                    },
                    r = new Map(e);
                return n.developConfirmed && n.inventoryConfirmed ? r.delete(t) : r.set(t, n), r
            })
        },
        b = (e, t) => E(null == t ? void 0 : t.name) === E(e.name) && S(null == t ? void 0 : t.description) === S(e.description);
    e.s(["DEVELOPMENT_ITEMS_INVENTORY_QUERY_KEY", 0, h, "cacheDevelopmentItemMetadataUpdate", 0, (e, t) => {
        let {
            assetId: a,
            description: o,
            name: n
        } = t, r = new Date, i = {
            assetId: a,
            description: S(o),
            developConfirmed: !1,
            expiresAt: r.getTime() + 3e4,
            inventoryConfirmed: !1,
            name: n,
            updated: r
        };
        e.setQueryData(f, e => {
            let t = new Map(e);
            return t.set(a, i), t
        }), e.setQueriesData({
            queryKey: h
        }, e => {
            let t = null == e ? void 0 : e.items.find(e => e.assetId === a);
            return null == e || null == t ? e : {
                ...e,
                items: [{
                    ...t,
                    name: n,
                    updated: r
                }, ...e.items.filter(e => e.assetId !== a)]
            }
        }), e.invalidateQueries({
            queryKey: h,
            refetchType: "active"
        }), window.setTimeout(() => {
            let t = A(e, a);
            (null == t ? void 0 : t.expiresAt) === i.expiresAt && (T(e, a), e.invalidateQueries({
                queryKey: h,
                refetchType: "active"
            }))
        }, 3e4)
    }, "cacheDevelopmentItemUpload", 0, (e, t) => {
        let {
            assetId: a,
            assetType: o,
            name: n,
            scope: r
        } = t, i = new Date, l = {
            expiresAt: i.getTime() + 3e5,
            item: {
                assetId: a,
                assetType: o,
                created: i,
                id: a.toString(),
                isPackage: !1,
                name: n,
                sources: [s.Created],
                state: "Active",
                updated: i
            },
            scope: r
        };
        e.setQueryData(y, e => {
            let t = new Map(e);
            return t.set(a, l), t
        }), e.setQueriesData({
            predicate: e => {
                let {
                    queryKey: t
                } = e;
                return ((e, t) => {
                    let [, a, o, n, r, i, , l] = t;
                    return t[0] === h[0] && a === e.scope.type && o === e.scope.id && n === e.item.assetType && (r === s.Created || "All" === r) && "string" == typeof i && null == l && e.item.name.toLocaleLowerCase().includes(i.trim().toLocaleLowerCase())
                })(l, t)
            }
        }, e => null == e || e.items.some(e => e.assetId === a) ? e : {
            ...e,
            items: [l.item, ...e.items]
        }), e.invalidateQueries({
            queryKey: h,
            refetchType: "none"
        }), window.setTimeout(() => {
            var t;
            let o = null == (t = e.getQueryData(y)) ? void 0 : t.get(a);
            (null == o ? void 0 : o.expiresAt) === l.expiresAt && (g(e, a), e.invalidateQueries({
                queryKey: h,
                refetchType: "active"
            }))
        }, 3e5)
    }, "reconcileDeveloperItemDetailsMetadata", 0, (e, t, a) => {
        let o = A(e, t);
        return null == o ? {
            details: a
        } : b(o, a) ? (v(e, t, "develop"), {
            details: a
        }) : {
            details: {
                ...a,
                description: o.description,
                name: o.name
            },
            expiresAt: o.expiresAt
        }
    }, "reconcileDevelopmentItemsInventoryMetadata", 0, (e, t, a) => {
        let o = [],
            n = [];
        return t.forEach(t => {
            let r = A(e, t.assetId);
            if (null == r) return void n.push(t);
            if (b(r, a.get(t.assetId))) {
                v(e, t.assetId, "inventory"), n.push(t);
                return
            }
            o.push({
                ...t,
                name: r.name,
                updated: r.updated
            })
        }), o.sort((e, t) => {
            var a, o, n, r;
            return (null != (a = null == (n = t.updated) ? void 0 : n.getTime()) ? a : 0) - (null != (o = null == (r = e.updated) ? void 0 : r.getTime()) ? o : 0)
        }), [...o, ...n]
    }, "reconcileDevelopmentItemsInventoryUploads", 0, (e, t, a) => {
        let {
            assetType: o,
            pageToken: n,
            query: r,
            scope: i,
            source: l
        } = a, c = e.getQueryData(y);
        if (null == c || 0 === c.size) return [...t];
        let d = new Set(t.map(e => e.assetId)),
            u = [];
        return c.forEach((t, a) => {
            if (t.expiresAt <= Date.now()) return void g(e, a);
            if (((e, t) => {
                    let {
                        assetType: a,
                        pageToken: o,
                        query: n,
                        scope: r,
                        source: i
                    } = t;
                    return null == o && (null == r ? void 0 : r.type) === e.scope.type && r.id === e.scope.id && a === e.item.assetType && (i === s.Created || "All" === i) && e.item.name.toLocaleLowerCase().includes(n.trim().toLocaleLowerCase())
                })(t, {
                    assetType: o,
                    pageToken: n,
                    query: r,
                    scope: i,
                    source: l
                })) {
                if (d.has(a)) return void g(e, a);
                u.push(t.item)
            }
        }), u.sort((e, t) => {
            var a, o, n, r;
            return (null != (a = null == (n = t.updated) ? void 0 : n.getTime()) ? a : 0) - (null != (o = null == (r = e.updated) ? void 0 : r.getTime()) ? o : 0)
        }), [...u, ...t]
    }], 970494)
}, 105098, 995721, e => {
    "use strict";
    var t = e.i(416340);
    let a = (0, t.createContext)({
        isLoadingLook: !1,
        refreshLookDetails: () => {
            throw Error("function is not implemented")
        },
        lookSalesData: void 0,
        lookDetail: void 0
    });
    a.displayName = "LookDetails", e.s(["default", 0, a], 995721), e.s(["default", 0, function() {
        return (0, t.useContext)(a)
    }], 105098)
}, 627636, e => {
    "use strict";
    var t = e.i(17829);
    e.s(["CreatorType", () => t.default])
}, 450639, 950473, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        o = e.i(79187),
        n = e.i(540513),
        r = e.i(808377),
        i = e.i(449934),
        l = e.i(169722),
        s = e.i(591403),
        c = e.i(833172);
    e.s(["NotInterestedIcon", () => c.NotInterested], 950473);
    var c = c,
        d = e.i(559956),
        u = e.i(199834),
        p = e.i(706442);
    let m = function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
        return (0, p.makeStyles)()(t => ({
            imageStatusContainer: {
                backgroundColor: e ? t.palette.surface.outline : t.palette.components.input.filled.enableFill,
                color: e ? t.palette.content.inverse : t.palette.content.muted,
                width: "100%",
                height: "100%"
            },
            statusTextContainer: {
                display: "block",
                textAlign: "center",
                whiteSpace: "nowrap",
                color: e ? t.palette.content.inverse : t.palette.content.muted
            },
            imageContainer: {
                width: "100%",
                height: 0,
                paddingTop: "100%",
                position: "relative",
                borderRadius: e ? 4 : 8,
                overflow: "hidden",
                backgroundColor: t.palette.components.input.filled.enableFill
            },
            imageWrapper: {
                position: "absolute",
                bottom: 0,
                left: 0,
                width: "100%",
                height: "100%",
                textAlign: "center"
            },
            image: {
                width: "100%",
                height: "100%",
                position: "absolute",
                left: "0",
                bottom: "0",
                objectFit: "contain"
            },
            bottomRightAdornmentContainer: {
                position: "absolute",
                bottom: 8,
                right: 8,
                padding: 4,
                borderRadius: 4,
                background: t.palette.surface[200],
                display: "flex"
            },
            skeleton: {
                height: "100%"
            }
        }))
    };
    e.s(["default", 0, e => {
        let {
            targetId: p,
            targetType: h,
            returnPolicy: f = n.ReturnPolicy.AutoGenerated,
            isStatusTextShown: y = !1,
            alt: S,
            fontColor: E = "light",
            bottomRightAdornment: T
        } = e, {
            classes: {
                imageStatusContainer: A,
                statusTextContainer: g,
                imageWrapper: v,
                imageContainer: b,
                image: _,
                bottomRightAdornmentContainer: C,
                skeleton: k
            }
        } = m("light" !== E)(), {
            translate: I
        } = (0, o.useTranslation)(), [P, w] = (0, a.useState)(!1), [D, x] = (0, a.useState)(), R = (0, a.useCallback)(async function(e, t, a) {
            let o = arguments.length > 3 && void 0 !== arguments[3] && arguments[3];
            if (t && e) {
                w(!0);
                try {
                    let r = o ? n.ThumbnailClient.reloadThumbnailImage : n.ThumbnailClient.getThumbnailImage,
                        i = await r(e, t, a);
                    x(i)
                } catch (e) {
                    x({
                        state: r.ThumbnailResponseState.TemporarilyUnavailable
                    })
                } finally {
                    w(!1)
                }
            }
        }, []), O = (0, a.useMemo)(() => {
            if (P) return (0, t.jsx)(d.Skeleton, {
                classes: {
                    root: k
                },
                variant: "rectangular",
                animate: !0
            });
            let e = "",
                a = null;
            switch (null == D ? void 0 : D.state) {
                case r.ThumbnailResponseState.InReview:
                    e = I("Label.InReview"), a = (0, t.jsx)(s.HourglassEmptyIcon, {
                        fontSize: "large",
                        color: "dark" === E ? void 0 : "secondary"
                    });
                    break;
                case r.ThumbnailResponseState.Blocked:
                    e = I("Label.Moderated"), a = (0, t.jsx)(c.NotInterested, {
                        fontSize: "large",
                        color: "dark" === E ? void 0 : "secondary"
                    });
                    break;
                case r.ThumbnailResponseState.Error:
                case r.ThumbnailResponseState.TemporarilyUnavailable:
                    e = I("Label.Unavailable"), a = (0, t.jsx)(i.BrokenImageOutlinedIcon, {
                        fontSize: "large",
                        color: "dark" === E ? void 0 : "secondary"
                    });
                    break;
                default:
                    return null
            }
            return (0, t.jsx)(l.Grid, {
                container: !0,
                classes: {
                    root: A
                },
                justifyContent: "center",
                alignItems: "center",
                children: y ? (0, t.jsxs)("div", {
                    children: [a, (0, t.jsx)(u.Typography, {
                        variant: "smallLabel1",
                        classes: {
                            root: g
                        },
                        children: e
                    })]
                }) : a
            })
        }, [P, null == D ? void 0 : D.state, A, y, g, k, I, E]);
        return (0, a.useEffect)(() => {
            R(h, p, f)
        }, [p, h, f, R]), {
            thumbnailImage: (0, t.jsx)(l.Grid, {
                item: !0,
                container: !0,
                XSmall: 12,
                justifyContent: "center",
                alignItems: "center",
                children: (0, t.jsxs)("div", {
                    className: b,
                    children: [(null == D ? void 0 : D.state) === r.ThumbnailResponseState.Completed ? (0, t.jsx)("img", {
                        className: _,
                        src: null == D ? void 0 : D.imageUrl,
                        alt: S
                    }) : (0, t.jsx)("div", {
                        className: v,
                        children: O
                    }), T ? (0, t.jsx)("div", {
                        className: C,
                        children: T
                    }) : null]
                })
            }),
            thumbnailData: D,
            refreshThumbnail: (0, a.useCallback)(async () => R(h, p, f, !0), [R, h, p, f])
        }
    }], 450639)
}, 692587, e => {
    "use strict";
    e.s(["default", 0, function(e) {
        return Object.entries(e).reduce((e, t) => {
            let [a, o] = t;
            return Array.isArray(o) ? e[a] = o.at(0) : e[a] = o, e
        }, {})
    }, "readQueryValue", 0, function(e) {
        if (null != e) return Array.isArray(e) ? e.at(0) : e
    }])
}, 729904, e => {
    "use strict";
    e.s(["default", 0, function() {
        return "production"
    }])
}, 808377, e => {
    "use strict";
    var t = e.i(620140);
    e.s(["ThumbnailResponseState", () => t.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum])
}, 627292, e => {
    "use strict";
    var t = e.i(485745);
    e.s(["accordionSummaryClasses", () => t.a])
}, 736186, e => {
    "use strict";
    var t = e.i(516367);
    e.s(["buttonClasses", () => t.b])
}, 438004, e => {
    "use strict";
    var t = e.i(416340);
    e.i(273589);
    var a = e.i(221628),
        o = e.i(969708);
    e.i(309742), e.s(["N", 0, function(e) {
        let {
            children: n,
            defer: r = !1,
            fallback: i = null
        } = e, [l, s] = t.useState(!1);
        return (0, o.u)(() => {
            r || s(!0)
        }, [r]), t.useEffect(() => {
            r && s(!0)
        }, [r]), (0, a.jsx)(t.Fragment, {
            children: l ? n : i
        })
    }])
}, 517379, e => {
    "use strict";
    var t = e.i(865800),
        a = e.i(416340);

    function o(e) {
        return "small" === e ? 16 : 20
    }

    function n(e) {
        return "small" === e ? 18 : 24
    }
    var r = e.i(614515),
        i = e.i(993807),
        l = e.i(696180),
        s = e.i(273589),
        c = e.i(549534),
        d = e.i(962560),
        u = e.i(42569),
        p = e.i(576881),
        m = e.i(221628),
        h = e.i(963320);

    function f(e) {
        return (0, s.g)("MuiSwitch", e)
    }
    e.i(197094);
    var y = (0, l.g)("MuiSwitch", ["root", "edgeStart", "edgeEnd", "switchBase", "colorPrimary", "colorSecondary", "sizeSmall", "sizeMedium", "checked", "disabled", "input", "thumb", "track"]);
    let S = ["className", "color", "edge", "size", "sx"],
        E = (0, u.s)("span", {
            name: "MuiSwitch",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: a
                } = e;
                return [t.root, a.edge && t["edge".concat((0, s.a)(a.edge))], t["size".concat((0, s.a)(a.size))]]
            }
        })({
            display: "inline-flex",
            width: 58,
            height: 38,
            overflow: "hidden",
            padding: 12,
            boxSizing: "border-box",
            position: "relative",
            flexShrink: 0,
            zIndex: 0,
            verticalAlign: "middle",
            "@media print": {
                colorAdjust: "exact"
            },
            variants: [{
                props: {
                    edge: "start"
                },
                style: {
                    marginLeft: -8
                }
            }, {
                props: {
                    edge: "end"
                },
                style: {
                    marginRight: -8
                }
            }, {
                props: {
                    size: "small"
                },
                style: {
                    width: 40,
                    height: 24,
                    padding: 7,
                    ["& .".concat(y.thumb)]: {
                        width: 16,
                        height: 16
                    },
                    ["& .".concat(y.switchBase)]: {
                        padding: 4,
                        ["&.".concat(y.checked)]: {
                            transform: "translateX(16px)"
                        }
                    }
                }
            }]
        }),
        T = (0, u.s)(p.S, {
            name: "MuiSwitch",
            slot: "SwitchBase",
            overridesResolver: (e, t) => {
                let {
                    ownerState: a
                } = e;
                return [t.switchBase, {
                    ["& .".concat(y.input)]: t.input
                }, "default" !== a.color && t["color".concat((0, s.a)(a.color))]]
            }
        })(e => {
            let {
                theme: t
            } = e;
            return {
                position: "absolute",
                top: 0,
                left: 0,
                zIndex: 1,
                color: t.vars ? t.vars.palette.Switch.defaultColor : "".concat("light" === t.palette.mode ? t.palette.common.white : t.palette.grey[300]),
                transition: t.transitions.create(["left", "transform"], {
                    duration: t.transitions.duration.shortest
                }),
                ["&.".concat(y.checked)]: {
                    transform: "translateX(20px)"
                },
                ["&.".concat(y.disabled)]: {
                    color: t.vars ? t.vars.palette.Switch.defaultDisabledColor : "".concat("light" === t.palette.mode ? t.palette.grey[100] : t.palette.grey[600])
                },
                ["&.".concat(y.checked, " + .").concat(y.track)]: {
                    opacity: .5
                },
                ["&.".concat(y.disabled, " + .").concat(y.track)]: {
                    opacity: t.vars ? t.vars.opacity.switchTrackDisabled : "" + ("light" === t.palette.mode ? .12 : .2)
                },
                ["& .".concat(y.input)]: {
                    left: "-100%",
                    width: "300%"
                }
            }
        }, e => {
            let {
                theme: t
            } = e;
            return {
                "&:hover": {
                    backgroundColor: t.vars ? "rgba(".concat(t.vars.palette.action.activeChannel, " / ").concat(t.vars.palette.action.hoverOpacity, ")") : (0, s.b)(t.palette.action.active, t.palette.action.hoverOpacity),
                    "@media (hover: none)": {
                        backgroundColor: "transparent"
                    }
                },
                variants: [...Object.entries(t.palette).filter(e => {
                    let [, t] = e;
                    return t.main && t.light
                }).map(e => {
                    let [a] = e;
                    return {
                        props: {
                            color: a
                        },
                        style: {
                            ["&.".concat(y.checked)]: {
                                color: (t.vars || t).palette[a].main,
                                "&:hover": {
                                    backgroundColor: t.vars ? "rgba(".concat(t.vars.palette[a].mainChannel, " / ").concat(t.vars.palette.action.hoverOpacity, ")") : (0, s.b)(t.palette[a].main, t.palette.action.hoverOpacity),
                                    "@media (hover: none)": {
                                        backgroundColor: "transparent"
                                    }
                                },
                                ["&.".concat(y.disabled)]: {
                                    color: t.vars ? t.vars.palette.Switch["".concat(a, "DisabledColor")] : "".concat("light" === t.palette.mode ? (0, s.l)(t.palette[a].main, .62) : (0, s.j)(t.palette[a].main, .55))
                                }
                            },
                            ["&.".concat(y.checked, " + .").concat(y.track)]: {
                                backgroundColor: (t.vars || t).palette[a].main
                            }
                        }
                    }
                })]
            }
        }),
        A = (0, u.s)("span", {
            name: "MuiSwitch",
            slot: "Track",
            overridesResolver: (e, t) => t.track
        })(e => {
            let {
                theme: t
            } = e;
            return {
                height: "100%",
                width: "100%",
                borderRadius: 7,
                zIndex: -1,
                transition: t.transitions.create(["opacity", "background-color"], {
                    duration: t.transitions.duration.shortest
                }),
                backgroundColor: t.vars ? t.vars.palette.common.onBackground : "".concat("light" === t.palette.mode ? t.palette.common.black : t.palette.common.white),
                opacity: t.vars ? t.vars.opacity.switchTrack : "" + ("light" === t.palette.mode ? .38 : .3)
            }
        }),
        g = (0, u.s)("span", {
            name: "MuiSwitch",
            slot: "Thumb",
            overridesResolver: (e, t) => t.thumb
        })(e => {
            let {
                theme: t
            } = e;
            return {
                boxShadow: (t.vars || t).shadows[1],
                backgroundColor: "currentColor",
                width: 20,
                height: 20,
                borderRadius: "50%"
            }
        }),
        v = a.forwardRef(function(e, t) {
            let a = (0, h.u)({
                    props: e,
                    name: "MuiSwitch"
                }),
                {
                    className: o,
                    color: n = "primary",
                    edge: r = !1,
                    size: i = "medium",
                    sx: l
                } = a,
                c = (0, s._)(a, S),
                p = (0, d._)({}, a, {
                    color: n,
                    edge: r,
                    size: i
                }),
                y = (e => {
                    let {
                        classes: t,
                        edge: a,
                        size: o,
                        color: n,
                        checked: r,
                        disabled: i
                    } = e, l = {
                        root: ["root", a && "edge".concat((0, s.a)(a)), "size".concat((0, s.a)(o))],
                        switchBase: ["switchBase", "color".concat((0, s.a)(n)), r && "checked", i && "disabled"],
                        thumb: ["thumb"],
                        track: ["track"],
                        input: ["input"]
                    }, c = (0, u.a)(l, f, t);
                    return (0, d._)({}, t, c)
                })(p),
                v = (0, m.jsx)(g, {
                    className: y.thumb,
                    ownerState: p
                });
            return (0, m.jsxs)(E, {
                className: (0, u.c)(y.root, o),
                sx: l,
                ownerState: p,
                children: [(0, m.jsx)(T, (0, d._)({
                    type: "checkbox",
                    icon: v,
                    checkedIcon: v,
                    ref: t,
                    ownerState: p
                }, c, {
                    classes: (0, d._)({}, y, {
                        root: y.switchBase
                    })
                })), (0, m.jsx)(A, {
                    className: y.track,
                    ownerState: p
                })]
            })
        });
    var b = (0, r.default)({
            name: "Switch"
        })(function(e, t, a) {
            var r, i, l, s, d = t.size;
            return {
                root: ((r = {})["&:has(> .".concat(y.colorPrimary, ".").concat(y.disabled, ".").concat(y.checked, ")")] = {
                    opacity: .5
                }, r["&:has(> .".concat(y.colorSecondary, ".").concat(y.disabled, ")")] = {
                    opacity: .5
                }, r),
                switchBase: ((i = {
                    color: e.palette.actionV2.primary.fill
                })["&.".concat(y.checked, " + .").concat(y.track, ".").concat(a.track)] = {
                    opacity: .38
                }, i["&.".concat(y.disabled, " + .").concat(y.track, ".").concat(a.track)] = {
                    opacity: .38
                }, i),
                thumb: {
                    position: "relative",
                    pointerEvents: "none",
                    width: o(d),
                    height: o(d),
                    borderRadius: "50%",
                    boxShadow: e.elevation.subtle
                },
                track: {
                    opacity: .38
                },
                progress: {
                    color: e.palette.actionV2.primaryBrand.fill,
                    position: "absolute",
                    top: (o(d) - n(d)) / 2,
                    left: (o(d) - n(d)) / 2,
                    zIndex: 1
                },
                colorPrimary: ((l = {})["& .".concat(y.thumb)] = {
                    backgroundColor: e.palette.components.switch.knobFill
                }, l["& .".concat(y.track)] = {
                    backgroundColor: e.palette.components.switch.slideFill
                }, l["&.".concat(y.checked, " .").concat(y.thumb)] = {
                    background: e.palette.actionV2.primaryBrand.fill
                }, l["&.".concat(y.checked, " .").concat(y.track)] = {
                    background: e.palette.actionV2.primaryBrand.fill,
                    opacity: .38
                }, l["&.".concat(y.checked, " .").concat(c.c.root)] = {
                    color: e.palette.actionV2.primary.fill
                }, l["&.".concat(y.disabled, " .").concat(y.thumb)] = {
                    background: e.palette.components.switch.disabledKnob
                }, l["&.".concat(y.disabled, " .").concat(y.track)] = {
                    background: e.palette.components.switch.slideFill
                }, l["&.".concat(y.disabled, ".").concat(y.checked, " .").concat(y.thumb)] = {
                    background: e.palette.actionV2.primaryBrand.fill
                }, l["&.".concat(y.disabled, ".").concat(y.checked, " .").concat(y.track)] = {
                    background: e.palette.actionV2.primaryBrand.fill
                }, l["&.".concat(y.disabled, " .").concat(c.c.root)] = {
                    color: e.palette.actionV2.primaryBrand.fill
                }, l),
                colorSecondary: ((s = {})["& .".concat(y.thumb)] = {
                    backgroundColor: e.palette.components.switch.knobFill
                }, s["& .".concat(y.track)] = {
                    backgroundColor: e.palette.components.switch.slideFill
                }, s)
            }
        }),
        _ = (0, a.forwardRef)(function(e, r) {
            var l, s = e.classes,
                d = e.color,
                u = e.loading,
                p = e.size,
                m = e.checkedIcon,
                h = e.icon,
                f = e["aria-label"],
                S = e.inputProps,
                E = e.className,
                T = (0, t.a)(e, ["classes", "color", "loading", "size", "checkedIcon", "icon", "aria-label", "inputProps", "className"]),
                A = b((0, t._)((0, t._)({}, T), {
                    loading: u,
                    size: p,
                    checkedIcon: m,
                    icon: h,
                    "aria-label": f
                }), {
                    props: {
                        classes: (0, i.default)(s, E)
                    }
                }).classes,
                g = A.thumb,
                _ = A.progress,
                C = (0, t.a)(A, ["thumb", "progress"]),
                k = a.default.createElement("div", {
                    className: "".concat(y.thumb, " ").concat(g)
                }, u && a.default.createElement(c.C, {
                    thickness: ((l = n(p)) - o(p)) * 44 / (2 * l),
                    size: n(p),
                    classes: {
                        root: _
                    }
                }));
            return a.default.createElement(v, (0, t._)({}, T, {
                checkedIcon: null != m ? m : k,
                classes: C,
                color: void 0 === d ? "primary" : d,
                icon: null != h ? h : k,
                ref: r,
                size: p,
                inputProps: (0, t._)((0, t._)({}, S), {
                    "aria-label": f
                })
            }))
        });
    e.s(["Switch", 0, _], 517379)
}, 449934, e => {
    "use strict";
    var t = e.i(833172);
    e.s(["BrokenImageOutlinedIcon", () => t.BrokenImageOutlined])
}, 591403, e => {
    "use strict";
    var t = e.i(833172);
    e.s(["HourglassEmptyIcon", () => t.HourglassEmpty])
}, 283514, (e, t, a) => {
    "use strict";
    Object.defineProperty(a, "__esModule", {
        value: !0
    }), Object.defineProperty(a, "LoadableContext", {
        enumerable: !0,
        get: function() {
            return o
        }
    });
    let o = e.r(2879)._(e.r(416340)).default.createContext(null)
}, 568710, (e, t, a) => {
    "use strict";
    Object.defineProperty(a, "__esModule", {
        value: !0
    }), Object.defineProperty(a, "default", {
        enumerable: !0,
        get: function() {
            return p
        }
    });
    let o = e.r(2879)._(e.r(416340)),
        n = e.r(283514),
        r = [],
        i = [],
        l = !1;

    function s(e) {
        let t = e(),
            a = {
                loading: !0,
                loaded: null,
                error: null
            };
        return a.promise = t.then(e => (a.loading = !1, a.loaded = e, e)).catch(e => {
            throw a.loading = !1, a.error = e, e
        }), a
    }
    class c {
        promise() {
            return this._res.promise
        }
        retry() {
            this._clearTimeouts(), this._res = this._loadFn(this._opts.loader), this._state = {
                pastDelay: !1,
                timedOut: !1
            };
            let {
                _res: e,
                _opts: t
            } = this;
            e.loading && ("number" == typeof t.delay && (0 === t.delay ? this._state.pastDelay = !0 : this._delay = setTimeout(() => {
                this._update({
                    pastDelay: !0
                })
            }, t.delay)), "number" == typeof t.timeout && (this._timeout = setTimeout(() => {
                this._update({
                    timedOut: !0
                })
            }, t.timeout))), this._res.promise.then(() => {
                this._update({}), this._clearTimeouts()
            }).catch(e => {
                this._update({}), this._clearTimeouts()
            }), this._update({})
        }
        _update(e) {
            this._state = {
                ...this._state,
                error: this._res.error,
                loaded: this._res.loaded,
                loading: this._res.loading,
                ...e
            }, this._callbacks.forEach(e => e())
        }
        _clearTimeouts() {
            clearTimeout(this._delay), clearTimeout(this._timeout)
        }
        getCurrentValue() {
            return this._state
        }
        subscribe(e) {
            return this._callbacks.add(e), () => {
                this._callbacks.delete(e)
            }
        }
        constructor(e, t) {
            this._loadFn = e, this._opts = t, this._callbacks = new Set, this._delay = null, this._timeout = null, this.retry()
        }
    }

    function d(t) {
        return function(t, a) {
            let s = Object.assign({
                    loader: null,
                    loading: null,
                    delay: 200,
                    timeout: null,
                    webpack: null,
                    modules: null
                }, a),
                d = null;

            function u() {
                if (!d) {
                    let e = new c(t, s);
                    d = {
                        getCurrentValue: e.getCurrentValue.bind(e),
                        subscribe: e.subscribe.bind(e),
                        retry: e.retry.bind(e),
                        promise: e.promise.bind(e)
                    }
                }
                return d.promise()
            }
            if ("u" < typeof window && r.push(u), !l && "u" > typeof window) {
                let t = s.webpack && "function" == typeof e.t.resolveWeak ? s.webpack() : s.modules;
                t && i.push(e => {
                    for (let a of t)
                        if (e.includes(a)) return u()
                })
            }

            function p(e, t) {
                let a;
                u(), (a = o.default.useContext(n.LoadableContext)) && Array.isArray(s.modules) && s.modules.forEach(e => {
                    a(e)
                });
                let r = o.default.useSyncExternalStore(d.subscribe, d.getCurrentValue, d.getCurrentValue);
                return o.default.useImperativeHandle(t, () => ({
                    retry: d.retry
                }), []), o.default.useMemo(() => {
                    var t;
                    return r.loading || r.error ? o.default.createElement(s.loading, {
                        isLoading: r.loading,
                        pastDelay: r.pastDelay,
                        timedOut: r.timedOut,
                        error: r.error,
                        retry: d.retry
                    }) : r.loaded ? o.default.createElement((t = r.loaded) && t.default ? t.default : t, e) : null
                }, [e, r])
            }
            return p.preload = () => u(), p.displayName = "LoadableComponent", o.default.forwardRef(p)
        }(s, t)
    }

    function u(e, t) {
        let a = [];
        for (; e.length;) {
            let o = e.pop();
            a.push(o(t))
        }
        return Promise.all(a).then(() => {
            if (e.length) return u(e, t)
        })
    }
    d.preloadAll = () => new Promise((e, t) => {
        u(r).then(e, t)
    }), d.preloadReady = function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [];
        return new Promise(t => {
            let a = () => (l = !0, t());
            u(i, e).then(a, a)
        })
    }, "u" > typeof window && (window.__NEXT_PRELOADREADY = d.preloadReady);
    let p = d
}, 810637, (e, t, a) => {
    "use strict";
    Object.defineProperty(a, "__esModule", {
        value: !0
    });
    var o = {
        default: function() {
            return u
        },
        noSSR: function() {
            return d
        }
    };
    for (var n in o) Object.defineProperty(a, n, {
        enumerable: !0,
        get: o[n]
    });
    let r = e.r(2879),
        i = e.r(221628);
    e.r(416340);
    let l = r._(e.r(568710)),
        s = "u" < typeof window;

    function c(e) {
        return {
            default: (null == e ? void 0 : e.default) || e
        }
    }

    function d(e, t) {
        if (delete t.webpack, delete t.modules, !s) return e(t);
        let a = t.loading;
        return () => (0, i.jsx)(a, {
            error: null,
            isLoading: !0,
            pastDelay: !1,
            timedOut: !1
        })
    }

    function u(e, t) {
        let a = l.default,
            o = {
                loading: e => {
                    let {
                        error: t,
                        isLoading: a,
                        pastDelay: o
                    } = e;
                    return null
                }
            };
        e instanceof Promise ? o.loader = () => e : "function" == typeof e ? o.loader = e : "object" == typeof e && (o = {
            ...o,
            ...e
        });
        let n = (o = {
            ...o,
            ...t
        }).loader;
        return (o.loadableGenerated && (o = {
            ...o,
            ...o.loadableGenerated
        }, delete o.loadableGenerated), "boolean" != typeof o.ssr || o.ssr) ? a({
            ...o,
            loader: () => null != n ? n().then(c) : Promise.resolve(c(() => null))
        }) : (delete o.webpack, delete o.modules, d(a, o))
    }("function" == typeof a.default || "object" == typeof a.default && null !== a.default) && void 0 === a.default.__esModule && (Object.defineProperty(a.default, "__esModule", {
        value: !0
    }), Object.assign(a.default, a), t.exports = a.default)
}, 109182, (e, t, a) => {
    t.exports = e.r(810637)
}, 260241, e => {
    "use strict";
    var t = e.i(79187),
        a = e.i(416340),
        o = e.i(706442),
        n = e.i(431346),
        r = e.i(620068),
        i = e.i(982234),
        l = e.i(418400),
        s = e.i(169722),
        c = e.i(199834),
        d = e.i(872204),
        u = e.i(627292),
        p = e.i(734306),
        m = e.i(731693),
        h = e.i(397810),
        f = e.i(736186),
        y = e.i(645909),
        S = e.i(517379),
        E = e.i(12839),
        E = E,
        T = e.i(291037),
        A = e.i(899819),
        g = e.i(777004),
        v = e.i(35298),
        b = e.i(252842);
    let _ = "https://www.roblox.com/info/privacy",
        C = "{privacyPolicyLink}",
        k = "{googleAnalyticsLink}",
        I = [{
            label: "Label.DataCollected",
            content: "Description.DataCollected"
        }, {
            label: "Label.DataSharing",
            content: "Description.DataSharing"
        }, {
            label: "Label.DataRetention",
            content: "Description.DataRetention"
        }, {
            label: "Label.DataUse",
            content: "Description.DataUse"
        }, {
            label: "Label.DataStorage",
            content: "Description.Undisclosed"
        }];
    var P, w, D = ((P = D || {}).BannerTitle = "Heading.CookieBanner", P.CookieBannerContent = "Description.CookieBannerContent", P.CookieBannerButton = "Action.CookieBanner", P.PrivacyPolicy = "Description.PrivacyPolicy", P.ConsentToolModalTitle = "Heading.CookieSettings", P.SaveBtn = "Action.SavePreferences", P.CancelBtn = "Action.Cancel", P.InfoCollectionHeader = "Heading.InformationCollection", P.InfoCollectionContent = "Description.InformationCollection", P.InfoCollectionHeader2 = "Heading.InformationCollection2", P.InfoCollectionContent2 = "Description.InformationCollection2", P.InfoPartnerCollectionHeader = "Heading.InformationPartnerCollection", P.InfoPartnerCollectionContent = "Description.InformationPartnerCollection", P.RBXViralAcquisition = "RBXViralAcquisition", P.RBXViralAcquisitionDescription = "Description.RBXViralAcquisition", P.RBXSource = "RBXSource", P.RBXSourceDescription = "Description.RBXSource", P.GoogleAnalytics = "Heading.GoogleAnalytics", P.OwnedBy = "Label.OwnedBy", P.GoogleInc = "Google Inc.", P.Website = "Label.Website", P.GoogleAnalyticsPurposeHeader = "Heading.GoogleAnalyticsPurpose", P.GoogleAnalyticsPurposeDescription = "Description.GoogleAnalyticsPurpose", P.CompanyCollectionHeader = "Heading.CompanyCollection", P.DataCollected = "Label.DataCollected", P.DataCollectedContent = "Description.DataCollected", P.DataSharing = "Label.DataSharing", P.DataSharingContent = "Description.DataSharing", P.DataRetention = "Label.DataRetention", P.DataRetentionContent = "Description.DataRetention", P.DataUse = "Label.DataUse", P.DataUseContent = "Description.DataUse", P.DataStorage = "Label.DataStorage", P.DataStorageContent = "Description.Undisclosed", P.RequestData = "Action.RequestData", P.SetCookieOptions = "Action.SetCookieOptions", P.DeclineAll = "Action.DeclineAll", P.AcceptAll = "Action.AcceptAll", P.EssentialCookie = "Heading.EssentialCookies", P.AnalyticsCookie = "Heading.AnalyticsCookies", P.GAReadMore = "Description.GAReadMore", P.GAReadMoreUrl = "{googleAnalyticsLink}", P);
    let x = (0, o.makeStyles)()(e => ({
            root: {
                padding: 24,
                maxWidth: 1250,
                margin: "0 auto"
            },
            content: {
                marginBottom: 16
            },
            actions: {
                display: "flex",
                justifyContent: "space-between",
                alignItems: "center",
                gap: 12,
                [e.breakpoints.down("Medium")]: {
                    flexDirection: "column",
                    alignItems: "flex-start"
                }
            },
            buttons: {
                display: "flex",
                gap: 12,
                [e.breakpoints.down("Medium")]: {
                    flexDirection: "column",
                    width: "100%"
                }
            },
            backdrop: {
                backgroundColor: "transparent"
            }
        })),
        R = e => {
            let {
                onAcceptAll: o,
                onDeclineAll: u,
                onLearnMore: p,
                isOpen: m
            } = e, {
                translate: h
            } = (0, t.useTranslation)(), {
                classes: f
            } = x(), y = (0, r.useMediaQuery)((0, n.useTheme)().breakpoints.down("Medium")), S = (0, a.useMemo)(() => a.default.createElement(i.Link, {
                href: _,
                target: "_blank",
                underline: "hover",
                color: "inherit"
            }, h(D.PrivacyPolicy)), [h]), E = (0, a.useMemo)(() => {
                let e = h(D.CookieBannerContent);
                if (!e.includes(C)) return e;
                let t = e.split(C);
                return a.default.createElement(a.default.Fragment, null, t[0], S, t[1] || "")
            }, [h, S]);
            return a.default.createElement(l.Drawer, {
                open: m,
                onClose: u,
                anchor: "bottom",
                variant: "temporary",
                ModalProps: {
                    BackdropProps: {
                        classes: {
                            root: f.backdrop
                        }
                    }
                }
            }, a.default.createElement(s.Grid, {
                className: f.root
            }, a.default.createElement(s.Grid, {
                className: f.content
            }, a.default.createElement(c.Typography, {
                variant: "body2"
            }, E)), a.default.createElement(s.Grid, {
                className: f.actions
            }, a.default.createElement(d.Button, {
                variant: "text",
                onClick: p,
                color: "secondary"
            }, h(D.SetCookieOptions)), a.default.createElement(s.Grid, {
                className: f.buttons
            }, a.default.createElement(d.Button, {
                color: "secondary",
                variant: "outlined",
                onClick: u,
                fullWidth: y
            }, h(D.DeclineAll)), a.default.createElement(d.Button, {
                color: "secondary",
                variant: "contained",
                onClick: o,
                fullWidth: y
            }, h(D.AcceptAll))))))
        },
        O = "RBXcb",
        Y = {
            RBXViralAcquisition: !0,
            RBXSource: !0,
            GoogleAnalytics: !0
        },
        N = (0, a.createContext)(null),
        L = () => {
            let e = (0, a.useContext)(N);
            if (!e) throw Error("useCookieConsentContext must be used within a CookieConsentProvider");
            return e
        },
        M = e => {
            let t, a = Object.entries(e).map(e => {
                let [t, a] = e;
                return "".concat(t, "=").concat(a)
            }).join("&");
            Object.entries(e).forEach(e => {
                let [t, a] = e;
                a || (0, b.deleteCookie)(t)
            });
            let o = new Date;
            o.setDate(o.getDate() + 180), document.cookie = "".concat(O, "=").concat(a, "; expires=").concat(o.toUTCString(), "; path=/; domain=").concat((t = window.location.hostname.split(".")).length <= 2 ? window.location.hostname : ".".concat(t.slice(1).join(".")))
        },
        B = e => {
            let {
                cookieName: t,
                description: o
            } = e;
            return a.default.createElement("div", null, a.default.createElement(c.Typography, {
                variant: "codeDense"
            }, t), a.default.createElement(c.Typography, {
                variant: "body2",
                paragraph: !0,
                color: "secondary"
            }, o))
        },
        H = (0, o.makeStyles)()(() => ({
            accordionSummary: {
                display: "flex",
                alignItems: "center",
                gap: "12px",
                ["& .".concat(u.accordionSummaryClasses.content)]: {
                    margin: 0,
                    "&.Mui-expanded": {
                        margin: 0
                    }
                },
                "&.Mui-expanded": {
                    minHeight: "48px"
                }
            },
            accordion: {
                "&::before": {
                    height: 0
                },
                "&.Mui-expanded": {
                    margin: 0
                }
            }
        })),
        j = () => {
            var e;
            let {
                translate: o
            } = (0, t.useTranslation)(), {
                cookiePolicy: n
            } = L(), {
                classes: r
            } = H();
            return n && (null == (e = n.EssentialCookieList) ? void 0 : e.length) ? a.default.createElement(p.Accordion, {
                className: r.accordion
            }, a.default.createElement(m.AccordionSummary, {
                className: r.accordionSummary
            }, a.default.createElement(c.Typography, {
                variant: "h6"
            }, o(D.EssentialCookie))), a.default.createElement(h.AccordionDetails, null, n.EssentialCookieList.map(e => a.default.createElement(B, {
                key: e.cookieName,
                cookieName: e.cookieName,
                description: o(e.description)
            })))) : null
        };
    var G = ((w = {}).RBXViralAcquisition = "RBXViralAcquisition", w.RBXSource = "RBXSource", w.GoogleAnalytics = "GoogleAnalytics", w);
    let V = e => {
            let {
                title: t,
                content: o,
                secondary: n = !1
            } = e;
            return a.default.createElement("div", null, a.default.createElement(c.Typography, {
                variant: "body2",
                color: n ? "secondary" : "primary"
            }, t), a.default.createElement(c.Typography, {
                variant: "body2",
                paragraph: !0,
                color: "secondary"
            }, o))
        },
        F = () => {
            let {
                translate: e
            } = (0, t.useTranslation)(), o = e(D.GAReadMore);
            if (!o.includes(k)) return a.default.createElement(a.default.Fragment, null, o);
            let [n, r] = o.split(k);
            return a.default.createElement(c.Typography, {
                variant: "body2"
            }, n, a.default.createElement(i.Link, {
                href: "https://support.google.com/analytics/answer/11397207",
                target: "_blank",
                underline: "hover",
                color: "inherit"
            }, e(D.GoogleAnalytics)), r)
        },
        U = (0, o.makeStyles)()(() => ({
            button: {
                paddingLeft: 5,
                ["&.".concat(f.buttonClasses.root)]: {
                    backgroundColor: "transparent",
                    "&:hover": {
                        backgroundColor: "transparent"
                    },
                    "&:focus": {
                        backgroundColor: "transparent"
                    },
                    "&:active": {
                        backgroundColor: "transparent"
                    }
                }
            }
        })),
        z = e => {
            let {
                href: t,
                text: o
            } = e, {
                classes: n
            } = U();
            return a.default.createElement("div", null, a.default.createElement(d.Button, {
                className: n.button,
                variant: "text",
                component: "a",
                color: "primary",
                href: t,
                rel: "noreferrer",
                endIcon: a.default.createElement(y.OpenInNewIcon, null),
                size: "small",
                target: "_blank",
                disableRipple: !0
            }, o))
        },
        X = e => {
            let {
                isAnalyticsCookieAccepted: o,
                setIsAnalyticsCookieAccepted: n
            } = e, {
                classes: r
            } = H(), {
                translate: i
            } = (0, t.useTranslation)();
            return a.default.createElement(p.Accordion, {
                className: r.accordion
            }, a.default.createElement(m.AccordionSummary, {
                className: r.accordionSummary
            }, a.default.createElement(c.Typography, {
                variant: "h6"
            }, i(D.AnalyticsCookie)), a.default.createElement(S.Switch, {
                checked: o,
                onChange: (e, t) => {
                    n(t)
                },
                "aria-label": i(D.AnalyticsCookie),
                size: "small"
            })), a.default.createElement(h.AccordionDetails, null, a.default.createElement(B, {
                key: G.RBXViralAcquisition,
                cookieName: G.RBXViralAcquisition,
                description: i(D.RBXViralAcquisitionDescription)
            }), a.default.createElement(B, {
                key: G.RBXSource,
                cookieName: G.RBXSource,
                description: i(D.RBXSourceDescription)
            }), a.default.createElement(z, {
                href: "https://marketingplatform.google.com/about/analytics/",
                text: i(D.GoogleAnalytics)
            }), a.default.createElement(c.Typography, {
                variant: "body2",
                paragraph: !0
            }, i(D.OwnedBy), " ", "Google Inc."), a.default.createElement(V, {
                title: i(D.GoogleAnalyticsPurposeHeader),
                content: i(D.GoogleAnalyticsPurposeDescription)
            }), a.default.createElement(c.Typography, {
                variant: "body2"
            }, i(D.CompanyCollectionHeader)), I.map(e => a.default.createElement(V, {
                key: e.label,
                title: i(e.label),
                content: i(e.content),
                secondary: !0
            })), a.default.createElement(F, null)))
        },
        q = (0, o.makeStyles)()(e => ({
            accordionSummary: {
                display: "flex",
                alignItems: "center",
                gap: "12px",
                ["& .".concat(u.accordionSummaryClasses.content)]: {
                    margin: 0,
                    "&.Mui-expanded": {
                        margin: 0
                    }
                },
                "&.Mui-expanded": {
                    minHeight: "48px"
                }
            },
            accordion: {
                "&::before": {
                    height: 0
                },
                "&.Mui-expanded": {
                    margin: 0
                }
            },
            paragraph: {
                marginBottom: "12px"
            },
            dialogContent: {
                ["&.".concat(E.d.root)]: {
                    paddingTop: "12px"
                },
                scrollbarColor: "grey transparent",
                scrollbarWidth: "thin",
                "&::-webkit-scrollbar": {
                    width: 6
                },
                "&::-webkit-scrollbar-thumb": {
                    background: "grey",
                    borderRadius: "10rem"
                },
                "&::-webkit-scrollbar-track": {
                    background: "transparent"
                }
            },
            accordionSection: {
                marginTop: "12px"
            },
            accordionContainer: {
                border: "1px solid ".concat(e.palette.components.divider),
                "&:first-of-type": {
                    borderTopLeftRadius: "12px",
                    borderTopRightRadius: "12px"
                },
                "&:last-of-type": {
                    borderTop: "none",
                    borderBottomLeftRadius: "12px",
                    borderBottomRightRadius: "12px"
                },
                "&:first-of-type:last-of-type": {
                    borderTop: "1px solid ".concat(e.palette.components.divider)
                }
            }
        })),
        W = e => {
            var o;
            let {
                open: n,
                onClose: r,
                onSave: i,
                isAnalyticsCookieAccepted: l,
                setIsAnalyticsCookieAccepted: s
            } = e, {
                translate: u
            } = (0, t.useTranslation)(), {
                classes: p
            } = q(), {
                cookiePolicy: m
            } = L();
            return m ? a.default.createElement(T.Dialog, {
                open: n,
                onClose: r
            }, a.default.createElement(A.DialogTitle, null, u(D.ConsentToolModalTitle)), a.default.createElement(g.DialogContent, {
                className: p.dialogContent
            }, a.default.createElement(c.Typography, {
                variant: "h6"
            }, u(D.InfoCollectionHeader)), a.default.createElement(c.Typography, {
                variant: "body2",
                paragraph: !0,
                className: p.paragraph,
                color: "secondary"
            }, u(D.InfoCollectionContent)), a.default.createElement(c.Typography, {
                variant: "h6"
            }, u(D.InfoCollectionHeader2)), a.default.createElement(c.Typography, {
                variant: "body2",
                paragraph: !0,
                className: p.paragraph,
                color: "secondary"
            }, u(D.InfoCollectionContent2)), a.default.createElement(c.Typography, {
                variant: "h6"
            }, u(D.InfoPartnerCollectionHeader)), a.default.createElement(c.Typography, {
                variant: "body2",
                paragraph: !0,
                className: p.paragraph,
                color: "secondary"
            }, u(D.InfoPartnerCollectionContent)), a.default.createElement(z, {
                href: "https://www.roblox.com/support",
                text: u(D.RequestData)
            }), a.default.createElement(z, {
                href: _,
                text: u(D.PrivacyPolicy)
            }), a.default.createElement("div", {
                className: p.accordionSection
            }, (null == (o = m.EssentialCookieList) ? void 0 : o.length) > 0 && a.default.createElement("div", {
                className: p.accordionContainer
            }, a.default.createElement(j, null)), a.default.createElement("div", {
                className: p.accordionContainer
            }, a.default.createElement(X, {
                isAnalyticsCookieAccepted: l,
                setIsAnalyticsCookieAccepted: s
            })))), a.default.createElement(v.DialogActions, null, a.default.createElement(d.Button, {
                color: "secondary",
                variant: "outlined",
                onClick: r
            }, u(D.CancelBtn)), a.default.createElement(d.Button, {
                color: "primaryBrand",
                variant: "contained",
                onClick: i
            }, u(D.SaveBtn)))) : null
        },
        Q = e => {
            let {
                isOpen: t,
                onClose: o,
                onSave: n
            } = e, {
                cookiePolicy: r,
                acceptAll: i,
                declineAll: l,
                hasAcceptedAnalyticsCookie: s
            } = L(), [c, d] = (0, a.useState)(s), u = (0, a.useCallback)(() => {
                c ? i() : l(), n()
            }, [i, l, c, n]);
            return r ? a.default.createElement(W, {
                open: t,
                onClose: o,
                isAnalyticsCookieAccepted: c,
                setIsAnalyticsCookieAccepted: d,
                onSave: u
            }) : null
        },
        K = (0, t.withTranslation)(() => {
            let {
                acceptAll: e,
                declineAll: t,
                shouldShowBanner: o
            } = L(), [n, r] = (0, a.useState)(!1), [i, l] = (0, a.useState)(!1);
            (0, a.useEffect)(() => {
                o && l(!0)
            }, [o]);
            let s = (0, a.useCallback)(() => {
                    e(), l(!1)
                }, [e]),
                c = (0, a.useCallback)(() => {
                    t(), l(!1)
                }, [t]),
                d = (0, a.useCallback)(() => {
                    r(!0), l(!1)
                }, []),
                u = (0, a.useCallback)(() => {
                    r(!1), l(!0)
                }, []),
                p = (0, a.useCallback)(() => {
                    r(!1), l(!1)
                }, []);
            return a.default.createElement(a.default.Fragment, null, a.default.createElement(R, {
                isOpen: i,
                onAcceptAll: s,
                onDeclineAll: c,
                onLearnMore: d
            }), a.default.createElement(Q, {
                isOpen: n,
                onClose: u,
                onSave: p
            }))
        }, ["Feature.Tracking", "CommonUI.Controls"]);
    e.s(["CookieConsentBanner", 0, K, "CookieConsentProvider", 0, e => {
        let {
            children: t,
            robloxSiteDomain: o,
            initialCookiePolicy: n,
            initialPreferences: r,
            forceShowBanner: i = !1
        } = e, [l, s] = (0, a.useState)(n || null), [c, d] = (0, a.useState)(r || (() => {
            if ("u" < typeof document) return Y;
            let e = document.cookie.split("; ").find(e => e.startsWith("".concat(O, "=")));
            return e ? e.substring(O.length + 1).split("&").reduce((e, t) => {
                let [a, o] = t.split("=");
                return e[a] = "true" === o, e
            }, {}) : Y
        })()), [u, p] = (0, a.useState)(!n), [m, h] = (0, a.useState)(null), f = (0, a.useMemo)(() => !!i || !!(null == l ? void 0 : l.ShouldDisplayCookieBannerV3) && !(!("u" < typeof document) && document.cookie.split("; ").some(e => e.startsWith("".concat(O, "=")))), [null == l ? void 0 : l.ShouldDisplayCookieBannerV3, i]);
        (0, a.useEffect)(() => {
            n || (async () => {
                try {
                    var e, t, a;
                    let n = await fetch("https://apis.".concat(o, "/guac-v2/v1/bundles/cookie-policy"));
                    if (!n.ok) throw Error("Failed to fetch cookie policy");
                    let r = await n.json();
                    s({
                        ShouldDisplayCookieBannerV3: null != (e = r.ShouldDisplayCookieBannerV3) && e,
                        NonEssentialCookieList: null != (t = r.NonEssentialCookieList) ? t : [],
                        EssentialCookieList: null != (a = r.EssentialCookieList) ? a : []
                    }), p(!1)
                } catch (e) {
                    h(e instanceof Error ? e : Error("Unknown error")), p(!1)
                }
            })()
        }, [o, n]);
        let y = (0, a.useCallback)((e, t) => {
                d(a => {
                    let o = {
                        ...a,
                        [e]: t
                    };
                    return M(o), o
                })
            }, []),
            S = (0, a.useCallback)(() => {
                if (!l) return;
                let e = l.NonEssentialCookieList.reduce((e, t) => ({
                    ...e,
                    [t]: !0
                }), Y);
                M(e), d(e)
            }, [l]),
            E = (0, a.useCallback)(() => {
                if (!l) return;
                let e = l.NonEssentialCookieList.reduce((e, t) => ({
                    ...e,
                    [t]: !1
                }), Y);
                M(e), d(e)
            }, [l]),
            T = (0, a.useMemo)(() => Object.values(c).some(e => !0 === e), [c]),
            A = (0, a.useMemo)(() => ({
                cookiePolicy: l,
                preferences: c,
                updatePreference: y,
                acceptAll: S,
                declineAll: E,
                isLoading: u,
                error: m,
                hasAcceptedAnalyticsCookie: T,
                shouldShowBanner: f
            }), [l, c, u, m, S, E, y, T, f]);
        return a.default.createElement(N.Provider, {
            value: A
        }, t)
    }, "useCookieConsentContext", 0, L], 260241)
}]);

//# debugId=fb92edd4-1cb9-b713-fb63-494db6c8c9dd
//# sourceMappingURL=2v6ri3z3hs296.js.map