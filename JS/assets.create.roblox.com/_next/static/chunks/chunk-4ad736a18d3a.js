;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "327a29fe-4f57-7b3c-3957-c7b1d57c061f")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 533968, e => {
    "use strict";
    var t = e.i(185915);
    e.s(["getResponseFromError", () => t.default])
}, 970494, 294818, 59937, e => {
    "use strict";
    var t = e.i(677753),
        r = function(e, t) {
            return (r = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
            })(e, t)
        };

    function n(e, t, r, n) {
        return new(r || (r = Promise))(function(i, a) {
            function o(e) {
                try {
                    l(n.next(e))
                } catch (e) {
                    a(e)
                }
            }

            function s(e) {
                try {
                    l(n.throw(e))
                } catch (e) {
                    a(e)
                }
            }

            function l(e) {
                var t;
                e.done ? i(e.value) : ((t = e.value) instanceof r ? t : new r(function(e) {
                    e(t)
                })).then(o, s)
            }
            l((n = n.apply(e, t || [])).next())
        })
    }

    function i(e, t) {
        var r, n, i, a = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return o.next = s(0), o.throw = s(1), o.return = s(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function s(s) {
            return function(l) {
                var u = [s, l];
                if (r) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, u[0] && (a = 0)), a;) try {
                    if (r = 1, n && (i = 2 & u[0] ? n.return : u[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, u[1])).done) return i;
                    switch (n = 0, i && (u = [2 & u[0], i.value]), u[0]) {
                        case 0:
                        case 1:
                            i = u;
                            break;
                        case 4:
                            return a.label++, {
                                value: u[1],
                                done: !1
                            };
                        case 5:
                            a.label++, n = u[1], u = [0];
                            continue;
                        case 7:
                            u = a.ops.pop(), a.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                a = 0;
                                continue
                            }
                            if (3 === u[0] && (!i || u[1] > i[0] && u[1] < i[3])) {
                                a.label = u[1];
                                break
                            }
                            if (6 === u[0] && a.label < i[1]) {
                                a.label = i[1], i = u;
                                break
                            }
                            if (i && a.label < i[2]) {
                                a.label = i[2], a.ops.push(u);
                                break
                            }
                            i[2] && a.ops.pop(), a.trys.pop();
                            continue
                    }
                    u = t.call(e, a)
                } catch (e) {
                    u = [6, e], n = 0
                } finally {
                    r = i = 0
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
    var a = {
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
        AdsVideo: "ASSET_TYPE_ADS_VIDEO"
    };

    function o(e) {
        var r;
        return null == (r = e) ? r : {
            createdDetails: (0, t.exists)(r, "createdDetails") ? r.createdDetails : void 0,
            purchasedDetails: (0, t.exists)(r, "purchasedDetails") ? r.purchasedDetails : void 0,
            sharedDetails: (0, t.exists)(r, "sharedDetails") ? r.sharedDetails : void 0
        }
    }

    function s(e) {
        var r, n, i, a, s, l, u;
        return null == (r = e) ? r : {
            path: (0, t.exists)(r, "path") ? r.path : void 0,
            assetItem: (0, t.exists)(r, "assetItem") ? null == (n = r.assetItem) ? n : {
                asset: (0, t.exists)(n, "asset") ? null == (i = n.asset) ? i : {
                    createTime: (0, t.exists)(i, "createTime") ? new Date(i.createTime) : void 0,
                    updateTime: (0, t.exists)(i, "updateTime") ? new Date(i.updateTime) : void 0,
                    assetId: (0, t.exists)(i, "assetId") ? i.assetId : void 0,
                    displayName: (0, t.exists)(i, "displayName") ? i.displayName : void 0,
                    description: (0, t.exists)(i, "description") ? i.description : void 0,
                    assetType: (0, t.exists)(i, "assetType") ? i.assetType : void 0,
                    creationContext: (0, t.exists)(i, "creationContext") ? null == (a = i.creationContext) ? a : {
                        creator: (0, t.exists)(a, "creator") ? null == (s = a.creator) ? s : {
                            userId: (0, t.exists)(s, "userId") ? s.userId : void 0,
                            groupId: (0, t.exists)(s, "groupId") ? s.groupId : void 0,
                            name: (0, t.exists)(s, "name") ? s.name : void 0
                        } : void 0
                    } : void 0,
                    state: (0, t.exists)(i, "state") ? i.state : void 0,
                    assetSubType: (0, t.exists)(i, "assetSubType") ? i.assetSubType : void 0
                } : void 0,
                sources: (0, t.exists)(n, "sources") ? n.sources.map(o) : void 0,
                isPackage: (0, t.exists)(n, "isPackage") ? n.isPackage : void 0
            } : void 0,
            folderItem: (0, t.exists)(r, "folderItem") ? null == (l = r.folderItem) ? l : {
                folder: (0, t.exists)(l, "folder") ? null == (u = l.folder) ? u : {
                    folderId: (0, t.exists)(u, "folderId") ? u.folderId : void 0,
                    parentFolderId: (0, t.exists)(u, "parentFolderId") ? u.parentFolderId : void 0,
                    displayName: (0, t.exists)(u, "displayName") ? u.displayName : void 0,
                    createTime: (0, t.exists)(u, "createTime") ? new Date(u.createTime) : void 0,
                    updateTime: (0, t.exists)(u, "updateTime") ? new Date(u.updateTime) : void 0
                } : void 0
            } : void 0
        }
    }
    var l = {
            Invalid: "Invalid",
            Created: "Created",
            Purchased: "Purchased",
            Shared: "Shared"
        },
        u = ["assetTypes", "userIds", "groupIds", "universeIds", "includeFolders", "sources"],
        d = function(e) {
            return Object.fromEntries(Object.entries(e).map(function(e) {
                var t = e[0];
                return [e[1], t]
            }))
        },
        c = {
            assetTypes: d(a),
            sources: d(l)
        };

    function p(e, t) {
        var r, n = String(e);
        return t && null != (r = t[n]) ? r : n
    }
    var S = function(e) {
        function a() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, t) {
            if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

            function n() {
                this.constructor = e
            }
            r(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
        }(a, e), a.prototype.creatorInventorySearchCreatorInventoryItemsRaw = function(e, r) {
            return n(this, void 0, void 0, function() {
                var n, a, o;
                return i(this, function(i) {
                    switch (i.label) {
                        case 0:
                            if (null === e.filter || void 0 === e.filter) throw new t.RequiredError("filter", "Required parameter requestParameters.filter was null or undefined when calling creatorInventorySearchCreatorInventoryItems.");
                            return n = {}, void 0 !== e.query && (n.query = e.query), void 0 !== e.filter && (n.filter = function(e) {
                                for (var t = [], r = 0; r < u.length; r++) ! function(r) {
                                    var n = e[r];
                                    if (null != n) {
                                        var i = c[r];
                                        if (Array.isArray(n)) {
                                            if (0 === n.length) return;
                                            t.push("".concat(r, "=").concat(n.map(function(e) {
                                                return p(e, i)
                                            }).join(",")))
                                        } else t.push("".concat(r, "=").concat(p(n, i)))
                                    }
                                }(u[r]);
                                return t.join(";")
                            }(e.filter)), void 0 !== e.maxPageSize && (n.maxPageSize = e.maxPageSize), void 0 !== e.pageToken && (n.pageToken = e.pageToken), a = {}, [4, this.request({
                                path: "/v1/-/creator-inventory-items:search",
                                schemaPath: "/v1/-/creator-inventory-items:search",
                                method: "GET",
                                headers: a,
                                query: n
                            }, r)];
                        case 1:
                            return o = i.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    items: (0, t.exists)(e, "items") ? e.items.map(s) : void 0,
                                    nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
                                }
                            })]
                    }
                })
            })
        }, a.prototype.creatorInventorySearchCreatorInventoryItems = function(e, t) {
            return n(this, void 0, void 0, function() {
                return i(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.creatorInventorySearchCreatorInventoryItemsRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, a
    }(t.BaseAPI);
    e.s(["AssetType", 0, a, "CreatorInventoryApi", 0, S, "SourceType", 0, l, "State", 0, {
        Invalid: "STATE_INVALID",
        Active: "STATE_ACTIVE",
        Archived: "STATE_ARCHIVED"
    }], 294818), e.s(["CreatorInventorySourceType", 0, l], 59937);
    let T = ["development-items-inventory"],
        E = ["development-item-metadata-overrides"],
        v = ["development-item-upload-overrides"],
        m = e => null != e ? e : "",
        f = e => {
            var t;
            return null != (t = null == e ? void 0 : e.trim()) ? t : ""
        },
        A = (e, t) => {
            e.setQueryData(E, e => {
                if ((null == e ? void 0 : e.has(t)) !== !0) return e;
                let r = new Map(e);
                return r.delete(t), r
            })
        },
        _ = (e, t) => {
            var r;
            let n = null == (r = e.getQueryData(E)) ? void 0 : r.get(t);
            return null != n && n.expiresAt <= Date.now() ? void A(e, t) : n
        },
        h = (e, t) => {
            e.setQueryData(v, e => {
                if ((null == e ? void 0 : e.has(t)) !== !0) return e;
                let r = new Map(e);
                return r.delete(t), r
            })
        },
        g = (e, t, r) => {
            e.setQueryData(E, e => {
                let n = null == e ? void 0 : e.get(t);
                if (null == n) return e;
                let i = {
                        ...n,
                        developConfirmed: "develop" === r || n.developConfirmed,
                        inventoryConfirmed: "inventory" === r || n.inventoryConfirmed
                    },
                    a = new Map(e);
                return i.developConfirmed && i.inventoryConfirmed ? a.delete(t) : a.set(t, i), a
            })
        },
        y = (e, t) => f(null == t ? void 0 : t.name) === f(e.name) && m(null == t ? void 0 : t.description) === m(e.description);
    e.s(["DEVELOPMENT_ITEMS_INVENTORY_QUERY_KEY", 0, T, "cacheDevelopmentItemMetadataUpdate", 0, (e, t) => {
        let {
            assetId: r,
            description: n,
            name: i
        } = t, a = new Date, o = {
            assetId: r,
            description: m(n),
            developConfirmed: !1,
            expiresAt: a.getTime() + 3e4,
            inventoryConfirmed: !1,
            name: i,
            updated: a
        };
        e.setQueryData(E, e => {
            let t = new Map(e);
            return t.set(r, o), t
        }), e.setQueriesData({
            queryKey: T
        }, e => {
            let t = null == e ? void 0 : e.items.find(e => e.assetId === r);
            return null == e || null == t ? e : {
                ...e,
                items: [{
                    ...t,
                    name: i,
                    updated: a
                }, ...e.items.filter(e => e.assetId !== r)]
            }
        }), e.invalidateQueries({
            queryKey: T,
            refetchType: "active"
        }), window.setTimeout(() => {
            let t = _(e, r);
            (null == t ? void 0 : t.expiresAt) === o.expiresAt && (A(e, r), e.invalidateQueries({
                queryKey: T,
                refetchType: "active"
            }))
        }, 3e4)
    }, "cacheDevelopmentItemUpload", 0, (e, t) => {
        let {
            assetId: r,
            assetType: n,
            name: i,
            scope: a
        } = t, o = new Date, s = {
            expiresAt: o.getTime() + 3e5,
            item: {
                assetId: r,
                assetType: n,
                created: o,
                id: r.toString(),
                isPackage: !1,
                name: i,
                sources: [l.Created],
                state: "Active",
                updated: o
            },
            scope: a
        };
        e.setQueryData(v, e => {
            let t = new Map(e);
            return t.set(r, s), t
        }), e.setQueriesData({
            predicate: e => {
                let {
                    queryKey: t
                } = e;
                return ((e, t) => {
                    let [, r, n, i, a, o, , s] = t;
                    return t[0] === T[0] && r === e.scope.type && n === e.scope.id && i === e.item.assetType && (a === l.Created || "All" === a) && "string" == typeof o && null == s && e.item.name.toLocaleLowerCase().includes(o.trim().toLocaleLowerCase())
                })(s, t)
            }
        }, e => null == e || e.items.some(e => e.assetId === r) ? e : {
            ...e,
            items: [s.item, ...e.items]
        }), e.invalidateQueries({
            queryKey: T,
            refetchType: "none"
        }), window.setTimeout(() => {
            var t;
            let n = null == (t = e.getQueryData(v)) ? void 0 : t.get(r);
            (null == n ? void 0 : n.expiresAt) === s.expiresAt && (h(e, r), e.invalidateQueries({
                queryKey: T,
                refetchType: "active"
            }))
        }, 3e5)
    }, "reconcileDeveloperItemDetailsMetadata", 0, (e, t, r) => {
        let n = _(e, t);
        return null == n ? {
            details: r
        } : y(n, r) ? (g(e, t, "develop"), {
            details: r
        }) : {
            details: {
                ...r,
                description: n.description,
                name: n.name
            },
            expiresAt: n.expiresAt
        }
    }, "reconcileDevelopmentItemsInventoryMetadata", 0, (e, t, r) => {
        let n = [],
            i = [];
        return t.forEach(t => {
            let a = _(e, t.assetId);
            if (null == a) return void i.push(t);
            if (y(a, r.get(t.assetId))) {
                g(e, t.assetId, "inventory"), i.push(t);
                return
            }
            n.push({
                ...t,
                name: a.name,
                updated: a.updated
            })
        }), n.sort((e, t) => {
            var r, n, i, a;
            return (null != (r = null == (i = t.updated) ? void 0 : i.getTime()) ? r : 0) - (null != (n = null == (a = e.updated) ? void 0 : a.getTime()) ? n : 0)
        }), [...n, ...i]
    }, "reconcileDevelopmentItemsInventoryUploads", 0, (e, t, r) => {
        let {
            assetType: n,
            pageToken: i,
            query: a,
            scope: o,
            source: s
        } = r, u = e.getQueryData(v);
        if (null == u || 0 === u.size) return [...t];
        let d = new Set(t.map(e => e.assetId)),
            c = [];
        return u.forEach((t, r) => {
            if (t.expiresAt <= Date.now()) return void h(e, r);
            if (((e, t) => {
                    let {
                        assetType: r,
                        pageToken: n,
                        query: i,
                        scope: a,
                        source: o
                    } = t;
                    return null == n && (null == a ? void 0 : a.type) === e.scope.type && a.id === e.scope.id && r === e.item.assetType && (o === l.Created || "All" === o) && e.item.name.toLocaleLowerCase().includes(i.trim().toLocaleLowerCase())
                })(t, {
                    assetType: n,
                    pageToken: i,
                    query: a,
                    scope: o,
                    source: s
                })) {
                if (d.has(r)) return void h(e, r);
                c.push(t.item)
            }
        }), c.sort((e, t) => {
            var r, n, i, a;
            return (null != (r = null == (i = t.updated) ? void 0 : i.getTime()) ? r : 0) - (null != (n = null == (a = e.updated) ? void 0 : a.getTime()) ? n : 0)
        }), [...c, ...t]
    }], 970494)
}, 105098, 995721, e => {
    "use strict";
    var t = e.i(416340);
    let r = (0, t.createContext)({
        isLoadingLook: !1,
        refreshLookDetails: () => {
            throw Error("function is not implemented")
        },
        lookSalesData: void 0,
        lookDetail: void 0
    });
    r.displayName = "LookDetails", e.s(["default", 0, r], 995721), e.s(["default", 0, function() {
        return (0, t.useContext)(r)
    }], 105098)
}, 17829, e => {
    "use strict";
    var t, r = ((t = r || {}).User = "User", t.Group = "Group", t);
    e.s(["default", 0, r])
}, 627636, e => {
    "use strict";
    var t = e.i(17829);
    e.s(["CreatorType", () => t.default])
}, 450639, 950473, e => {
    "use strict";
    var t = e.i(221628),
        r = e.i(416340),
        n = e.i(79187),
        i = e.i(540513),
        a = e.i(808377),
        o = e.i(449934),
        s = e.i(169722),
        l = e.i(591403),
        u = e.i(833172);
    e.s(["NotInterestedIcon", () => u.NotInterested], 950473);
    var u = u,
        d = e.i(559956),
        c = e.i(199834),
        p = e.i(706442);
    let S = function() {
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
            targetType: T,
            returnPolicy: E = i.ReturnPolicy.AutoGenerated,
            isStatusTextShown: v = !1,
            alt: m,
            fontColor: f = "light",
            bottomRightAdornment: A
        } = e, {
            classes: {
                imageStatusContainer: _,
                statusTextContainer: h,
                imageWrapper: g,
                imageContainer: y,
                image: C,
                bottomRightAdornmentContainer: I,
                skeleton: P
            }
        } = S("light" !== f)(), {
            translate: b
        } = (0, n.useTranslation)(), [Y, x] = (0, r.useState)(!1), [w, R] = (0, r.useState)(), D = (0, r.useCallback)(async function(e, t, r) {
            let n = arguments.length > 3 && void 0 !== arguments[3] && arguments[3];
            if (t && e) {
                x(!0);
                try {
                    let a = n ? i.ThumbnailClient.reloadThumbnailImage : i.ThumbnailClient.getThumbnailImage,
                        o = await a(e, t, r);
                    R(o)
                } catch (e) {
                    R({
                        state: a.ThumbnailResponseState.TemporarilyUnavailable
                    })
                } finally {
                    x(!1)
                }
            }
        }, []), O = (0, r.useMemo)(() => {
            if (Y) return (0, t.jsx)(d.Skeleton, {
                classes: {
                    root: P
                },
                variant: "rectangular",
                animate: !0
            });
            let e = "",
                r = null;
            switch (null == w ? void 0 : w.state) {
                case a.ThumbnailResponseState.InReview:
                    e = b("Label.InReview"), r = (0, t.jsx)(l.HourglassEmptyIcon, {
                        fontSize: "large",
                        color: "dark" === f ? void 0 : "secondary"
                    });
                    break;
                case a.ThumbnailResponseState.Blocked:
                    e = b("Label.Moderated"), r = (0, t.jsx)(u.NotInterested, {
                        fontSize: "large",
                        color: "dark" === f ? void 0 : "secondary"
                    });
                    break;
                case a.ThumbnailResponseState.Error:
                case a.ThumbnailResponseState.TemporarilyUnavailable:
                    e = b("Label.Unavailable"), r = (0, t.jsx)(o.BrokenImageOutlinedIcon, {
                        fontSize: "large",
                        color: "dark" === f ? void 0 : "secondary"
                    });
                    break;
                default:
                    return null
            }
            return (0, t.jsx)(s.Grid, {
                container: !0,
                classes: {
                    root: _
                },
                justifyContent: "center",
                alignItems: "center",
                children: v ? (0, t.jsxs)("div", {
                    children: [r, (0, t.jsx)(c.Typography, {
                        variant: "smallLabel1",
                        classes: {
                            root: h
                        },
                        children: e
                    })]
                }) : r
            })
        }, [Y, null == w ? void 0 : w.state, _, v, h, P, b, f]);
        return (0, r.useEffect)(() => {
            D(T, p, E)
        }, [p, T, E, D]), {
            thumbnailImage: (0, t.jsx)(s.Grid, {
                item: !0,
                container: !0,
                XSmall: 12,
                justifyContent: "center",
                alignItems: "center",
                children: (0, t.jsxs)("div", {
                    className: y,
                    children: [(null == w ? void 0 : w.state) === a.ThumbnailResponseState.Completed ? (0, t.jsx)("img", {
                        className: C,
                        src: null == w ? void 0 : w.imageUrl,
                        alt: m
                    }) : (0, t.jsx)("div", {
                        className: g,
                        children: O
                    }), A ? (0, t.jsx)("div", {
                        className: I,
                        children: A
                    }) : null]
                })
            }),
            thumbnailData: w,
            refreshThumbnail: (0, r.useCallback)(async () => D(T, p, E, !0), [D, T, p, E])
        }
    }], 450639)
}, 927868, e => {
    "use strict";
    e.s(["getEnumKeyByValue", 0, (e, t) => {
        let r = Object.entries(e).find(e => {
            let [, r] = e;
            return r === t
        });
        return r ? r[0] : null
    }, "isValidArrayEnumValue", 0, (e, t) => e.includes(t), "isValidEnumValue", 0, (e, t) => Object.values(e).includes(t)])
}, 692587, e => {
    "use strict";
    e.s(["default", 0, function(e) {
        return Object.entries(e).reduce((e, t) => {
            let [r, n] = t;
            return Array.isArray(n) ? e[r] = n.at(0) : e[r] = n, e
        }, {})
    }, "readQueryValue", 0, function(e) {
        if (null != e) return Array.isArray(e) ? e.at(0) : e
    }])
}, 114209, 559227, e => {
    "use strict";
    var t = e.i(221628),
        r = e.i(416340),
        n = e.i(237401),
        i = e.i(773057),
        a = e.i(392782);
    let o = (0, r.createContext)({
        isLoadingGame: !1,
        isErrorLoadingGame: !1,
        canConfigure: !1,
        gameDetails: null,
        refreshGameDetails: () => {
            throw Error("Not implemented")
        }
    });
    o.displayName = "Game", e.s(["default", 0, o], 559227);
    var s = e.i(721281),
        l = e.i(252842),
        u = e.i(533968);
    let d = new class {
        async getGameDetail(e, t) {
            var r, n, i;
            if (!t && this.gameDetailsMap.has(e)) return null != (r = this.gameDetailsMap.get(e)) ? r : null;
            try {
                let t = null != (n = null == (i = (await this.gamesClient.getDetails([e])).data) ? void 0 : i[0]) ? n : null;
                return t && this.gameDetailsMap.set(e, t), t
            } catch (r) {
                let t = (0, u.getResponseFromError)(r);
                if ((null == t ? void 0 : t.status) === l.StatusCodes.BAD_REQUEST) return null;
                throw console.log("Could not fetch game details for universeId ".concat(e)), r
            }
        }
        async getConfiguration(e, t) {
            if (!t && this.gameConfigurationMap.has(e)) {
                var r;
                return null != (r = this.gameConfigurationMap.get(e)) ? r : null
            }
            try {
                return await this.developClient.getUniverseConfiguration(e), this.gameConfigurationMap.set(e, !0), !0
            } catch (r) {
                let t = (0, u.getResponseFromError)(r);
                if ((null == t ? void 0 : t.status) === l.StatusCodes.FORBIDDEN) return this.gameConfigurationMap.set(e, !1), !1;
                return console.warn("Could not fetch game details for universeId ".concat(e)), null
            }
        }
        constructor(e, t) {
            (0, s._)(this, "gamesClient", void 0), (0, s._)(this, "developClient", void 0), (0, s._)(this, "gameDetailsMap", void 0), (0, s._)(this, "gameConfigurationMap", void 0), this.gamesClient = e, this.developClient = t, this.gameDetailsMap = new Map, this.gameConfigurationMap = new Map
        }
    }(a.default, i.default);
    e.s(["default", 0, e => {
        let {
            requestedGameId: i,
            children: a
        } = e, s = (0, n.useRouter)(), [l, u] = (0, r.useState)(!0), [c, p] = (0, r.useState)(null), [S, T] = (0, r.useState)(null), [E, v] = (0, r.useState)(!1), m = (0, r.useRef)(0), f = (0, r.useCallback)(async function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                r = m.current += 1,
                n = d.getConfiguration(e),
                i = d.getGameDetail(e, t),
                [a, o] = await Promise.allSettled([n, i]);
            r === m.current && ("fulfilled" === a.status ? p(a.value) : p(null), "fulfilled" === o.status ? (v(!1), T(o.value)) : ("rejected" === o.status ? v(!0) : v(!1), T(null)), u(!1))
        }, []), A = (0, r.useMemo)(() => {
            let {
                id: e
            } = s.query;
            return i || ("string" == typeof e ? parseInt(e, 10) : void 0)
        }, [i, s.query]), _ = (0, r.useCallback)(() => A ? f(A, !0) : Promise.reject(Error("Cannot refresh game details without a game ID")), [A, f]);
        (0, r.useEffect)(() => {
            try {
                if (void 0 !== A && !Number.isNaN(A) && A > 0) return void f(A);
                m.current += 1, p(null), T(null), v(!1), u(!1)
            } catch (e) {
                console.warn("Could not fetch game details for universeId ".concat(A))
            }
        }, [A, f]);
        let h = (0, r.useMemo)(() => ({
            isLoadingGame: l,
            canConfigure: c,
            gameDetails: S,
            isErrorLoadingGame: E,
            refreshGameDetails: _
        }), [l, c, S, E, _]);
        return (0, t.jsx)(o.Provider, {
            value: h,
            children: a
        })
    }, "useCurrentGame", 0, function() {
        let e = (0, r.useContext)(o);
        if (null === e) throw Error("useCurrentGame must be used within a GameProvider");
        return e
    }], 114209)
}, 745873, e => {
    "use strict";
    var t = e.i(221628),
        r = e.i(416340),
        n = e.i(458451),
        i = e.i(533414),
        a = e.i(157310),
        o = e.i(279149),
        s = e.i(602635),
        l = e.i(814975);
    let u = (0, e.i(272593).createClientConfiguration)("creator-home-api", "bedev2"),
        d = new o.GroupsApi(u),
        c = function() {
            let {
                user: e
            } = (0, l.useAuthentication)();
            return (0, a.useQuery)({
                queryKey: s.getGroupsQueryKey,
                enabled: !!e,
                queryFn: () => {
                    let e;
                    return e = {
                        surface: o.GroupListSurface.CreatorHub
                    }, d.groupsListGroups(e)
                }
            })
        },
        p = (0, r.createContext)(null);
    e.s(["GroupsProvider", 0, e => {
        let {
            children: a
        } = e, {
            user: o
        } = (0, n.useRobloxAuthentication)(), {
            data: s,
            isLoading: l,
            refetch: u
        } = c(), [d, S] = (0, i.useLocalStorage)("creatorHubGroups.".concat(null == o ? void 0 : o.id), null), [T, E] = (0, i.useLocalStorage)("creatorHubGroup.".concat(null == o ? void 0 : o.id), null), [v, m] = (0, i.useLocalStorage)("creatorHubGroupData.".concat(null == o ? void 0 : o.id), {}), f = (0, r.useCallback)(e => {
            E(e);
            let t = null === e ? "user" : e;
            m(e => {
                let r = {
                    lastSelected: Date.now(),
                    priority: 1
                };
                if (e[t]) {
                    let {
                        priority: n,
                        lastSelected: i
                    } = e[t];
                    "number" != typeof n || Number.isNaN(n) || "number" != typeof i || Number.isNaN(i) || (r.priority = n * (1 + Math.log10(1 + 10 / Math.max(Date.now() - i, 864e5))))
                }
                return {
                    ...e,
                    [t]: r
                }
            })
        }, [E, m]), A = (0, r.useMemo)(() => {
            if (null == s ? void 0 : s.groups) return null == s ? void 0 : s.groups;
            if (null === d) return [];
            try {
                return "string" == typeof d ? JSON.parse(d) : d
            } catch (e) {
                return []
            }
        }, [d, null == s ? void 0 : s.groups]), _ = (0, r.useMemo)(() => {
            var e;
            return T && null != (e = A.find(e => {
                let {
                    id: t
                } = e;
                return t === T
            })) ? e : null
        }, [T, A]);
        (0, r.useEffect)(() => {
            (null == o ? void 0 : o.id) && (null == s ? void 0 : s.groups) && !l && S(null == s ? void 0 : s.groups)
        }, [null == s ? void 0 : s.groups, A, l, S, null == o ? void 0 : o.id]);
        let h = (0, r.useMemo)(() => ({
            groups: A,
            currentGroup: _,
            groupData: v,
            isFetched: !l && !!(null == o ? void 0 : o.id),
            refreshGroups: u,
            setCurrentGroup: f
        }), [_, v, A, l, u, f, null == o ? void 0 : o.id]);
        return (0, t.jsx)(p.Provider, {
            value: h,
            children: a
        })
    }, "useCurrentGroup", 0, () => {
        let e = (0, r.useContext)(p);
        if (null === e) throw Error("useCurrentGroup must be used within a GroupsProvider");
        return e.currentGroup
    }, "useGroups", 0, () => {
        let e = (0, r.useContext)(p);
        if (null === e) throw Error("useGroups must be used within a GroupsProvider");
        return e
    }], 745873)
}, 808377, e => {
    "use strict";
    var t = e.i(620140);
    e.s(["ThumbnailResponseState", () => t.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum])
}, 196945, e => {
    "use strict";
    var t = e.i(865800),
        r = e.i(416340),
        n = e.i(323356);
    e.i(221628), e.i(149285);
    var i = (0, r.createContext)({
        ref: {
            current: null
        },
        enqueue: function() {
            throw Error("useSnackbar was invoked without SnackbarProvider")
        },
        close: function() {
            throw Error("useSnackbar was invoked without SnackbarProvider")
        }
    });
    e.s(["default", 0, function(e) {
        var a, o, s, l, u = e.children,
            d = (0, t.a)(e, ["children"]),
            c = (0, r.useRef)(null),
            p = (0, r.useState)(!1),
            S = p[0],
            T = p[1],
            E = (0, r.useState)([]),
            v = E[0],
            m = E[1],
            f = (0, r.useCallback)(function(e, r) {
                void 0 === e && (e = {}), void 0 === r && (r = function() {
                    return !0
                }), m(function(n) {
                    return (0, t.b)((0, t.b)([], n, !0), [{
                        props: e,
                        shouldClose: r
                    }], !1)
                })
            }, [m]),
            A = (0, r.useCallback)(function() {
                T(!1)
            }, [T]);
        (0, r.useEffect)(function() {
            v.length > 0 && T(!0)
        }, [v.length]);
        var _ = (0, r.useMemo)(function() {
            return {
                ref: c,
                enqueue: f,
                close: A
            }
        }, [A, f]);
        return r.default.createElement(r.default.Fragment, null, r.default.createElement(i.Provider, {
            value: _
        }, u), r.default.createElement(n.S, (0, t._)({}, (null == (a = v[0]) ? void 0 : a.props) || {}, d, {
            TransitionProps: (0, t._)((0, t._)({}, (null == (s = null == (o = v[0]) ? void 0 : o.props) ? void 0 : s.TransitionProps) || {}), {
                onExited: function(e) {
                    var r, n, i, a;
                    m(function(e) {
                        var r = e.slice(1);
                        return (0, t.b)([], r, !0)
                    }), (null == (n = null == (r = v[0]) ? void 0 : r.props.TransitionProps) ? void 0 : n.onExited) && (null == (a = null == (i = v[0]) ? void 0 : i.props.TransitionProps) || a.onExited(e))
                }
            }),
            onClose: function(e, t) {
                var r, n, i;
                (null == (r = v[0]) ? void 0 : r.shouldClose(t)) && T(!1), (null == (n = v[0]) ? void 0 : n.props.onClose) && (null == (i = v[0]) || i.props.onClose(e, t))
            },
            open: S
        }), null == (l = v[0]) ? void 0 : l.props.children))
    }, "useSnackbar", 0, function() {
        var e = (0, r.useContext)(i);
        return {
            ref: e.ref,
            enqueue: e.enqueue,
            close: e.close
        }
    }])
}, 449934, e => {
    "use strict";
    var t = e.i(833172);
    e.s(["BrokenImageOutlinedIcon", () => t.BrokenImageOutlined])
}, 591403, e => {
    "use strict";
    var t = e.i(833172);
    e.s(["HourglassEmptyIcon", () => t.HourglassEmpty])
}, 823062, e => {
    "use strict";
    var t = e.i(416340);
    let r = (0, t.createContext)(null),
        n = [],
        i = ["pageload", "click", "impression", "hover", "webvitals", "apivitals", "formvitals", "error", "session"],
        a = new Set(["TTFB", "FCP", "LCP", "FID", "CLS", "INP"]);
    e.s(["UnifiedLoggerProvider", 0, e => {
        var o;
        let {
            children: s,
            unifiedLogger: l,
            pageLoggerConfig: u,
            path: d
        } = e, c = null != (o = null == u ? void 0 : u.tags) ? o : n, p = null == u ? void 0 : u.rosId, S = (0, t.useMemo)(() => ({
            tags: c,
            rosId: p,
            path: d
        }), [c, p, d]), T = (0, t.useRef)(S), E = (0, t.useRef)(S);
        (0, t.useLayoutEffect)(() => {
            E.current = S, void 0 === T.current.path && void 0 !== S.path && (T.current = {
                ...T.current,
                path: S.path
            })
        }, [S]), (0, t.useLayoutEffect)(() => {
            let e = e => {
                var t;
                let r, n = (r = null == (t = e.parameters) ? void 0 : t.metricName, "webvitals" === e.eventType && void 0 !== r && a.has(r)) ? T.current : E.current;
                void 0 !== n.path && (e.parameters = {
                    ...e.parameters,
                    path: n.path
                }), n.tags.forEach(t => e.addTag(t)), void 0 !== n.rosId && e.addTag("owner: ".concat(n.rosId))
            };
            return i.forEach(t => {
                l.events.on(t, e)
            }), () => {
                i.forEach(t => {
                    l.events.off(t, e)
                })
            }
        }, [l]);
        let v = (0, t.useMemo)(() => ({
            unifiedLogger: l,
            pageContext: S
        }), [l, S]);
        return t.default.createElement(r.Provider, {
            value: v
        }, s)
    }, "useUnifiedLoggerProvider", 0, function() {
        let e = (0, t.useContext)(r);
        if (null === e) throw Error("useUnifiedLoggerProvider must be used within a UnifiedLoggerProvider");
        return e
    }])
}]);

//# debugId=327a29fe-4f57-7b3c-3957-c7b1d57c061f
//# sourceMappingURL=03_20ard60tfd.js.map