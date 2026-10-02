;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "ff3f5cf4-61b3-8dfd-31d6-cfd08699c2ef")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 117236, e => {
    "use strict";
    var t = e.i(155743),
        s = e.i(9618),
        r = e.i(54842),
        n = e.i(913893),
        a = e.i(671376),
        i = e.i(475360),
        o = e.i(927868),
        c = e.i(949599),
        l = e.i(814768);
    let u = new Set([a.Asset.MyExperiences, a.Asset.SharedExperiences, a.Asset.Audio, a.Asset.Decal, a.Asset.MeshPart, a.Asset.Video]),
        d = new Set([a.Asset.MyExperiences, a.Asset.SharedExperiences, a.Asset.Audio, a.Asset.Decal, a.Asset.Image, a.Asset.MeshPart, a.Asset.Video, a.Asset.Hat, a.Asset.HairAccessory, a.Asset.FaceAccessory, a.Asset.NeckAccessory, a.Asset.ShoulderAccessory, a.Asset.FrontAccessory, a.Asset.BackAccessory, a.Asset.WaistAccessory, a.Asset.Shirt, a.Asset.TShirt, a.Asset.Pants, a.Asset.TShirtAccessory, a.Asset.DressSkirtAccessory, a.Asset.JacketAccessory, a.Asset.PantsAccessory, a.Asset.ShirtAccessory, a.Asset.ShortsAccessory, a.Asset.SweaterAccessory, a.Asset.EmoteAnimation, a.Asset.EyebrowAccessory, a.Asset.EyelashAccessory, a.Asset.FaceMakeup, a.Asset.LipMakeup, a.Asset.EyeMakeup, a.Asset.AvatarBackground]),
        p = new Set([a.Asset.MyExperiences, a.Asset.SharedExperiences, a.Asset.UpcomingEvent, a.Asset.PastEvent, a.Asset.DraftEvent]),
        v = new Set([a.Asset.TShirt, a.Asset.Shirt, a.Asset.Pants, a.Asset.Hat, a.Asset.HairAccessory, a.Asset.FaceAccessory, a.Asset.NeckAccessory, a.Asset.ShoulderAccessory, a.Asset.FrontAccessory, a.Asset.BackAccessory, a.Asset.WaistAccessory, a.Asset.TShirtAccessory, a.Asset.ShirtAccessory, a.Asset.PantsAccessory, a.Asset.JacketAccessory, a.Asset.SweaterAccessory, a.Asset.ShortsAccessory, a.Asset.DressSkirtAccessory]),
        h = new Set([c.BundleType.Body, c.BundleType.DynamicHead, c.BundleType.Shoes]),
        y = new Set,
        I = new Set;

    function m() {
        return {
            assetTypes: new Set(v),
            bundleTypes: new Set(h)
        }
    }
    let f = new Set,
        w = new Set,
        P = null,
        A = null;
    async function R(e, s, r) {
        try {
            var i, u;
            let d = await n.default.getAllowedAssetTypes(e, [t.V1PermissionsItemTypesGetTargetTypesEnum.NUMBER_0, t.V1PermissionsItemTypesGetTargetTypesEnum.NUMBER_1]);
            return null == (i = d.allowedAssetTypes) || i.forEach(e => {
                let t = e;
                "Tshirt" === t ? t = "TShirt" : "TshirtAccessory" === t && (t = "TShirtAccessory"), (0, o.isValidEnumValue)(a.Asset, t) && s.add(t)
            }), null == (u = d.allowedBundleTypes) || u.forEach(e => {
                let t = (0, l.default)(e);
                t !== c.BundleType.Unknown && r.add(t)
            }), {
                assetTypes: s,
                bundleTypes: r
            }
        } catch (e) {
            return m()
        }
    }
    async function b() {
        return y.size > 0 ? {
            assetTypes: y,
            bundleTypes: I
        } : (null != P || (P = R(t.V1PermissionsItemTypesGetActionEnum.NUMBER_2, y, I).finally(() => {
            P = null
        })), P)
    }
    async function S() {
        return f.size > 0 ? {
            assetTypes: f,
            bundleTypes: w
        } : (null != A || (A = R(t.V1PermissionsItemTypesGetActionEnum.NUMBER_1, f, w).finally(() => {
            A = null
        })), A)
    }
    async function T() {
        let [e, t] = await Promise.all([b(), S()]), s = new Set(e.assetTypes);
        return t.assetTypes.has(a.Asset.AvatarBackground) && s.add(a.Asset.AvatarBackground), s
    }
    let g = new Set([]),
        q = {
            [s.SearchSortParameter.GameCreated]: "Label.DateOfCreation",
            [s.SearchSortParameter.GameName]: "Label.Alphabetical",
            [s.SearchSortParameter.LastUpdated]: "Label.LastUpdatedDate"
        },
        C = {
            [r.EventSortBy.CreatedUtc]: "Label.DateOfCreation",
            [r.EventSortBy.StartUtc]: "Label.StartDate"
        },
        x = [{
            type: a.Asset.Place,
            nameKey: "Label.Experiences",
            submenuItems: [{
                type: a.Asset.MyExperiences,
                nameKey: "Label.MyExperiences"
            }, {
                type: a.Asset.SharedExperiences,
                nameKey: "Label.SharedExperiences"
            }]
        }, {
            type: a.Asset.ShareLink,
            nameKey: "Label.ShareLinks"
        }, {
            type: a.Asset.TShirt,
            nameKey: "Label.AvatarItems",
            submenuItems: [{
                type: a.Asset.AvatarLooks,
                nameKey: "Label.Avatars"
            }, {
                type: a.Asset.AvatarBackground,
                nameKey: "Label.Backgrounds"
            }, {
                type: a.Asset.HairAccessory,
                nameKey: "Label.Bodies",
                itemType: i.Item.Bundle
            }, {
                type: a.Asset.EyeMakeup,
                nameKey: "Label.Makeup"
            }, {
                type: a.Asset.TShirtAccessory,
                nameKey: "Label.Clothing"
            }, {
                type: a.Asset.Hat,
                nameKey: "Label.Accessories"
            }, {
                type: a.Asset.TShirt,
                nameKey: "Label.Classics"
            }, {
                type: a.Asset.EmoteAnimation,
                nameKey: "Label.Animations"
            }, {
                type: a.Asset.Showcase,
                nameKey: "Label.Showcases"
            }, {
                type: a.Asset.AllCatalogAsset,
                nameKey: "Label.AllAssetTypes"
            }]
        }, {
            type: a.Asset.Decal,
            nameKey: "Label.DevelopmentItems",
            submenuItems: [{
                type: a.Asset.Model,
                nameKey: "Label.ModelsAndPackages"
            }, {
                type: a.Asset.Plugin,
                nameKey: "Label.Plugins"
            }, {
                type: a.Asset.Audio,
                nameKey: "Label.Audios"
            }, {
                type: a.Asset.Decal,
                nameKey: "Label.Decals"
            }, {
                type: a.Asset.Image,
                nameKey: "Label.Images"
            }, {
                type: a.Asset.Video,
                nameKey: "Label.Videos"
            }, {
                type: a.Asset.Mesh,
                nameKey: "Label.Meshes"
            }, {
                type: a.Asset.MeshPart,
                nameKey: "Label.MeshParts"
            }, {
                type: a.Asset.Animation,
                nameKey: "Label.Animations"
            }, {
                type: a.Asset.TextDocument,
                nameKey: "Label.Text"
            }]
        }, {
            type: a.Asset.Moments,
            nameKey: "Label.Moments"
        }, {
            type: a.Asset.AssetPermissionRequests,
            nameKey: "Label.Requests"
        }];
    e.s(["allowedAssetTypesForArchiving", 0, d, "allowedAssetTypesForDirectArchiving", 0, u, "allowedAssetTypesForSorting", 0, p, "allowedItemTypesForUploading", 0, g, "default", 0, x, "dynamicAvatarItemsAssetTypes", 0, y, "dynamicAvatarItemsBundleTypes", 0, I, "eventSortTranslationKeys", 0, C, "getAllowedMarketplaceItemTypes", 0, b, "getAvatarItemsEntryPointAssetTypes", 0, T, "getDefaultAllowedMarketplaceItemTypes", 0, m, "getUploadableMarketplaceItemTypes", 0, S, "universeSortTranslationKeys", 0, q])
}, 9618, e => {
    "use strict";
    var t = e.i(677753),
        s = function(e, t) {
            return (s = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var s in t) Object.prototype.hasOwnProperty.call(t, s) && (e[s] = t[s])
            })(e, t)
        };

    function r(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function r() {
            this.constructor = e
        }
        s(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
    }

    function n(e, t, s, r) {
        return new(s || (s = Promise))(function(n, a) {
            function i(e) {
                try {
                    c(r.next(e))
                } catch (e) {
                    a(e)
                }
            }

            function o(e) {
                try {
                    c(r.throw(e))
                } catch (e) {
                    a(e)
                }
            }

            function c(e) {
                var t;
                e.done ? n(e.value) : ((t = e.value) instanceof s ? t : new s(function(e) {
                    e(t)
                })).then(i, o)
            }
            c((r = r.apply(e, t || [])).next())
        })
    }

    function a(e, t) {
        var s, r, n, a = {
                label: 0,
                sent: function() {
                    if (1 & n[0]) throw n[1];
                    return n[1]
                },
                trys: [],
                ops: []
            },
            i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return i.next = o(0), i.throw = o(1), i.return = o(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
            return this
        }), i;

        function o(o) {
            return function(c) {
                var l = [o, c];
                if (s) throw TypeError("Generator is already executing.");
                for (; i && (i = 0, l[0] && (a = 0)), a;) try {
                    if (s = 1, r && (n = 2 & l[0] ? r.return : l[0] ? r.throw || ((n = r.return) && n.call(r), 0) : r.next) && !(n = n.call(r, l[1])).done) return n;
                    switch (r = 0, n && (l = [2 & l[0], n.value]), l[0]) {
                        case 0:
                        case 1:
                            n = l;
                            break;
                        case 4:
                            return a.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            a.label++, r = l[1], l = [0];
                            continue;
                        case 7:
                            l = a.ops.pop(), a.trys.pop();
                            continue;
                        default:
                            if (!(n = (n = a.trys).length > 0 && n[n.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                a = 0;
                                continue
                            }
                            if (3 === l[0] && (!n || l[1] > n[0] && l[1] < n[3])) {
                                a.label = l[1];
                                break
                            }
                            if (6 === l[0] && a.label < n[1]) {
                                a.label = n[1], n = l;
                                break
                            }
                            if (n && a.label < n[2]) {
                                a.label = n[2], a.ops.push(l);
                                break
                            }
                            n[2] && a.ops.pop(), a.trys.pop();
                            continue
                    }
                    l = t.call(e, a)
                } catch (e) {
                    l = [6, e], r = 0
                } finally {
                    s = n = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function i(e, s) {
        return null == e ? e : {
            placeId: (0, t.exists)(e, "placeId") ? e.placeId : void 0
        }
    }

    function o(e, s) {
        return null == e ? e : {
            versionNumber: (0, t.exists)(e, "versionNumber") ? e.versionNumber : void 0
        }
    }

    function c(e) {
        if (void 0 !== e) return null === e ? null : {
            creatorType: e.creatorType,
            creatorTargetId: e.creatorTargetId
        }
    }

    function l(e) {
        var s;
        return null == (s = e) ? s : {
            placeId: (0, t.exists)(s, "placeId") ? s.placeId : void 0,
            placeName: (0, t.exists)(s, "placeName") ? s.placeName : void 0,
            universeName: (0, t.exists)(s, "universeName") ? s.universeName : void 0,
            isRootPlace: (0, t.exists)(s, "isRootPlace") ? s.isRootPlace : void 0,
            universeId: (0, t.exists)(s, "universeId") ? s.universeId : void 0
        }
    }

    function u(e) {
        var s;
        return null == (s = e) ? s : {
            creatorTargetId: (0, t.exists)(s, "creatorTargetId") ? s.creatorTargetId : void 0,
            creatorType: (0, t.exists)(s, "creatorType") ? s.creatorType : void 0,
            code: (0, t.exists)(s, "code") ? s.code : void 0,
            message: (0, t.exists)(s, "message") ? s.message : void 0
        }
    }

    function d(e) {
        var s, r;
        return null == (s = e) ? s : {
            id: (0, t.exists)(s, "id") ? s.id : void 0,
            name: (0, t.exists)(s, "name") ? s.name : void 0,
            description: (0, t.exists)(s, "description") ? s.description : void 0,
            isArchived: (0, t.exists)(s, "isArchived") ? s.isArchived : void 0,
            rootPlaceId: (0, t.exists)(s, "rootPlaceId") ? s.rootPlaceId : void 0,
            privacyType: (0, t.exists)(s, "privacyType") ? s.privacyType : void 0,
            creatorType: (0, t.exists)(s, "creatorType") ? s.creatorType : void 0,
            creatorTargetId: (0, t.exists)(s, "creatorTargetId") ? s.creatorTargetId : void 0,
            creatorName: (0, t.exists)(s, "creatorName") ? s.creatorName : void 0,
            created: (0, t.exists)(s, "created") ? new Date(s.created) : void 0,
            updated: (0, t.exists)(s, "updated") ? new Date(s.updated) : void 0,
            isFriendsOnly: (0, t.exists)(s, "isFriendsOnly") ? s.isFriendsOnly : void 0,
            isTeamCreateEnabled: (0, t.exists)(s, "isTeamCreateEnabled") ? s.isTeamCreateEnabled : void 0,
            hasPublishedVersion: (0, t.exists)(s, "hasPublishedVersion") ? s.hasPublishedVersion : void 0,
            audiences: (0, t.exists)(s, "audiences") ? s.audiences : void 0,
            reachStatus: (0, t.exists)(s, "reachStatus") ? null == (r = s.reachStatus) ? r : {
                chipStatus: (0, t.exists)(r, "chipStatus") ? r.chipStatus : void 0,
                iconName: (0, t.exists)(r, "iconName") ? r.iconName : void 0,
                translatedStatus: (0, t.exists)(r, "translatedStatus") ? r.translatedStatus : void 0,
                variant: (0, t.exists)(r, "variant") ? r.variant : void 0
            } : void 0
        }
    }

    function p(e) {
        if (void 0 !== e) return null === e ? null : {
            templatePlaceId: e.templatePlaceId,
            anyLatestVersion: e.anyLatestVersion
        }
    }
    "function" == typeof SuppressedError && SuppressedError;
    var v = function(e) {
            function s() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(s, e), s.prototype.placesAddPlaceToUniverseRaw = function(e, s) {
                return n(this, void 0, void 0, function() {
                    var r, n, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesAddPlaceToUniverse.");
                                if (null === e.placeId || void 0 === e.placeId) throw new t.RequiredError("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesAddPlaceToUniverse.");
                                return r = {}, n = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/places/{placeId}/add-place".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/universes/{universeId}/places/{placeId}/add-place",
                                    method: "POST",
                                    headers: n,
                                    query: r
                                }, s)];
                            case 1:
                                return i = a.sent(), [2, new t.VoidApiResponse(i)]
                        }
                    })
                })
            }, s.prototype.placesAddPlaceToUniverse = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.placesAddPlaceToUniverseRaw(e, t)];
                            case 1:
                                return s.sent(), [2]
                        }
                    })
                })
            }, s.prototype.placesClearJoinRestrictionsOverridesRaw = function(e, s) {
                return n(this, void 0, void 0, function() {
                    var r, n, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesClearJoinRestrictionsOverrides.");
                                return r = {}, n = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/clear-join-restrictions-overrides".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/clear-join-restrictions-overrides",
                                    method: "POST",
                                    headers: n,
                                    query: r
                                }, s)];
                            case 1:
                                return i = a.sent(), [2, new t.VoidApiResponse(i)]
                        }
                    })
                })
            }, s.prototype.placesClearJoinRestrictionsOverrides = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.placesClearJoinRestrictionsOverridesRaw(e, t)];
                            case 1:
                                return s.sent(), [2]
                        }
                    })
                })
            }, s.prototype.placesCreatePlaceApiKeyRaw = function(e, s) {
                return n(this, void 0, void 0, function() {
                    var r, n, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesCreatePlaceApiKey.");
                                return r = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/apiKey/universes/{universeId}/places".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/apiKey/universes/{universeId}/places",
                                    method: "POST",
                                    headers: n,
                                    query: r,
                                    body: p(e.placesCreatePlaceApiKeyRequest)
                                }, s)];
                            case 1:
                                return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return i(e)
                                })]
                        }
                    })
                })
            }, s.prototype.placesCreatePlaceApiKey = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.placesCreatePlaceApiKeyRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.placesCreatePlaceFromPlaceRaw = function(e, s) {
                return n(this, void 0, void 0, function() {
                    var r, n, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new t.RequiredError("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesCreatePlaceFromPlace.");
                                return r = {}, (n = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (n["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                    path: "/v1/places/{placeId}/create".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}/create",
                                    method: "POST",
                                    headers: n,
                                    query: r,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            templatePlaceId: e.templatePlaceId,
                                            placeName: e.placeName,
                                            description: e.description
                                        }
                                    }(e.placesCreatePlaceFromPlaceRequest)
                                }, s)];
                            case 1:
                                return i = a.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        placeId: (0, t.exists)(e, "placeId") ? e.placeId : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.placesCreatePlaceFromPlace = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.placesCreatePlaceFromPlaceRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.placesCreatePlaceUserAuthRaw = function(e, s) {
                return n(this, void 0, void 0, function() {
                    var r, n, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesCreatePlaceUserAuth.");
                                return r = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/user/universes/{universeId}/places".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/user/universes/{universeId}/places",
                                    method: "POST",
                                    headers: n,
                                    query: r,
                                    body: p(e.placesCreatePlaceApiKeyRequest)
                                }, s)];
                            case 1:
                                return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return i(e)
                                })]
                        }
                    })
                })
            }, s.prototype.placesCreatePlaceUserAuth = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.placesCreatePlaceUserAuthRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.placesCreatePlaceVersionApiKeyRaw = function(e, s) {
                return n(this, void 0, void 0, function() {
                    var r, n, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesCreatePlaceVersionApiKey.");
                                if (null === e.placeId || void 0 === e.placeId) throw new t.RequiredError("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesCreatePlaceVersionApiKey.");
                                return r = {}, void 0 !== e.versionType && (r.versionType = e.versionType), void 0 !== e.isOldVersionAllowed && (r.isOldVersionAllowed = e.isOldVersionAllowed), void 0 !== e.shouldForceRestart && (r.shouldForceRestart = e.shouldForceRestart), n = {}, [4, this.request({
                                    path: "/v1/apiKey/universe/{universeId}/place/{placeId}/version".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/apiKey/universe/{universeId}/place/{placeId}/version",
                                    method: "POST",
                                    headers: n,
                                    query: r
                                }, s)];
                            case 1:
                                return i = a.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return o(e)
                                })]
                        }
                    })
                })
            }, s.prototype.placesCreatePlaceVersionApiKey = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.placesCreatePlaceVersionApiKeyRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.placesCreatePlaceVersionUserAuthRaw = function(e, s) {
                return n(this, void 0, void 0, function() {
                    var r, n, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesCreatePlaceVersionUserAuth.");
                                if (null === e.placeId || void 0 === e.placeId) throw new t.RequiredError("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesCreatePlaceVersionUserAuth.");
                                return r = {}, void 0 !== e.versionType && (r.versionType = e.versionType), void 0 !== e.isOldVersionAllowed && (r.isOldVersionAllowed = e.isOldVersionAllowed), void 0 !== e.shouldForceRestart && (r.shouldForceRestart = e.shouldForceRestart), n = {}, [4, this.request({
                                    path: "/v1/user/universe/{universeId}/place/{placeId}/version".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/user/universe/{universeId}/place/{placeId}/version",
                                    method: "POST",
                                    headers: n,
                                    query: r
                                }, s)];
                            case 1:
                                return i = a.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return o(e)
                                })]
                        }
                    })
                })
            }, s.prototype.placesCreatePlaceVersionUserAuth = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.placesCreatePlaceVersionUserAuthRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.placesCreateUniverseRaw = function(e, s) {
                return n(this, void 0, void 0, function() {
                    var r, n, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return r = {}, void 0 !== e.groupId && (r.groupId = e.groupId), (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/universes/create",
                                    schemaPath: "/v1/universes/create",
                                    method: "POST",
                                    headers: n,
                                    query: r,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            templatePlaceId: e.templatePlaceId,
                                            isPublish: e.isPublish
                                        }
                                    }(e.placesCreateUniverseRequest)
                                }, s)];
                            case 1:
                                return i = a.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        universeId: (0, t.exists)(e, "universeId") ? e.universeId : void 0,
                                        rootPlaceId: (0, t.exists)(e, "rootPlaceId") ? e.rootPlaceId : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.placesCreateUniverse = function() {
                return n(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.placesCreateUniverseRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.placesGetJoinRestrictionsRaw = function(e, s) {
                return n(this, void 0, void 0, function() {
                    var r, n, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesGetJoinRestrictions.");
                                return r = {}, n = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/join-restrictions".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/join-restrictions",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, s)];
                            case 1:
                                return i = a.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        isSpecificJoinToNonRootPlacesAllowed: (0, t.exists)(e, "isSpecificJoinToNonRootPlacesAllowed") ? e.isSpecificJoinToNonRootPlacesAllowed : void 0,
                                        hasPlaceOverrides: (0, t.exists)(e, "hasPlaceOverrides") ? e.hasPlaceOverrides : void 0,
                                        placeJoinRestrictionType: (0, t.exists)(e, "placeJoinRestrictionType") ? e.placeJoinRestrictionType : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.placesGetJoinRestrictions = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.placesGetJoinRestrictionsRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.placesGetOwnedPlacesByCreationContextRaw = function(e, s) {
                return n(this, void 0, void 0, function() {
                    var r, n, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return r = {}, void 0 !== e.creatorTargetId && (r.creatorTargetId = e.creatorTargetId), void 0 !== e.creatorTargetType && (r.creatorTargetType = e.creatorTargetType), void 0 !== e.creationContext && (r.creationContext = e.creationContext), void 0 !== e.universeId && (r.universeId = e.universeId), void 0 !== e.nextPageToken && (r.nextPageToken = e.nextPageToken), void 0 !== e.maxPageSize && (r.maxPageSize = e.maxPageSize), n = {}, [4, this.request({
                                    path: "/v2/owned-places-by-creation-context",
                                    schemaPath: "/v2/owned-places-by-creation-context",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, s)];
                            case 1:
                                return i = a.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        places: (0, t.exists)(e, "places") ? null === e.places ? null : e.places.map(l) : void 0,
                                        nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.placesGetOwnedPlacesByCreationContext = function() {
                return n(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.placesGetOwnedPlacesByCreationContextRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.placesGetPlaceJoinRestrictionsRaw = function(e, s) {
                return n(this, void 0, void 0, function() {
                    var r, n, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new t.RequiredError("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesGetPlaceJoinRestrictions.");
                                return r = {}, n = {}, [4, this.request({
                                    path: "/v1/places/{placeId}/join-restrictions".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}/join-restrictions",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, s)];
                            case 1:
                                return i = a.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        isSpecificJoinToNonRootPlacesAllowed: (0, t.exists)(e, "isSpecificJoinToNonRootPlacesAllowed") ? e.isSpecificJoinToNonRootPlacesAllowed : void 0,
                                        hasPlaceOverride: (0, t.exists)(e, "hasPlaceOverride") ? e.hasPlaceOverride : void 0,
                                        placeJoinRestrictionType: (0, t.exists)(e, "placeJoinRestrictionType") ? e.placeJoinRestrictionType : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.placesGetPlaceJoinRestrictions = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.placesGetPlaceJoinRestrictionsRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.placesGetPlacePublishStatusRaw = function(e, s) {
                return n(this, void 0, void 0, function() {
                    var r, n, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new t.RequiredError("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesGetPlacePublishStatus.");
                                return r = {}, n = {}, [4, this.request({
                                    path: "/v1/places/{placeId}/publish-status".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}/publish-status",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, s)];
                            case 1:
                                return i = a.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        hasPublishedVersion: (0, t.exists)(e, "hasPublishedVersion") ? e.hasPublishedVersion : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.placesGetPlacePublishStatus = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.placesGetPlacePublishStatusRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.placesGetPrivatePlaytesterStatusRaw = function(e, s) {
                return n(this, void 0, void 0, function() {
                    var r, n, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesGetPrivatePlaytesterStatus.");
                                return r = {}, n = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/is-private-playtester".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/is-private-playtester",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, s)];
                            case 1:
                                return i = a.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        isPlaytester: (0, t.exists)(e, "isPlaytester") ? e.isPlaytester : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.placesGetPrivatePlaytesterStatus = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.placesGetPrivatePlaytesterStatusRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.placesGetUniverseContainingPlaceRaw = function(e, s) {
                return n(this, void 0, void 0, function() {
                    var r, n, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new t.RequiredError("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesGetUniverseContainingPlace.");
                                return r = {}, n = {}, [4, this.request({
                                    path: "/v1/places/{placeId}/universe".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}/universe",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, s)];
                            case 1:
                                return i = a.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        universeId: (0, t.exists)(e, "universeId") ? e.universeId : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.placesGetUniverseContainingPlace = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.placesGetUniverseContainingPlaceRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.placesMigrateUniverseRaw = function(e, s) {
                return n(this, void 0, void 0, function() {
                    var r, n, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesMigrateUniverse.");
                                return r = {}, n = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/migrate-universe".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/migrate-universe",
                                    method: "POST",
                                    headers: n,
                                    query: r
                                }, s)];
                            case 1:
                                return i = a.sent(), [2, new t.VoidApiResponse(i)]
                        }
                    })
                })
            }, s.prototype.placesMigrateUniverse = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.placesMigrateUniverseRaw(e, t)];
                            case 1:
                                return s.sent(), [2]
                        }
                    })
                })
            }, s.prototype.placesPublishLatestSavedPlaceVersionRaw = function(e, s) {
                return n(this, void 0, void 0, function() {
                    var r, n, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new t.RequiredError("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesPublishLatestSavedPlaceVersion.");
                                return r = {}, n = {}, [4, this.request({
                                    path: "/v1/places/{placeId}/publish-latest".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}/publish-latest",
                                    method: "POST",
                                    headers: n,
                                    query: r
                                }, s)];
                            case 1:
                                return i = a.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        versionNumber: (0, t.exists)(e, "versionNumber") ? e.versionNumber : void 0,
                                        operationId: (0, t.exists)(e, "operationId") ? e.operationId : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.placesPublishLatestSavedPlaceVersion = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.placesPublishLatestSavedPlaceVersionRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.placesRemovePlaceFromUniverseRaw = function(e, s) {
                return n(this, void 0, void 0, function() {
                    var r, n, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesRemovePlaceFromUniverse.");
                                if (null === e.placeId || void 0 === e.placeId) throw new t.RequiredError("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesRemovePlaceFromUniverse.");
                                return r = {}, n = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/places/{placeId}/remove-place".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/universes/{universeId}/places/{placeId}/remove-place",
                                    method: "POST",
                                    headers: n,
                                    query: r
                                }, s)];
                            case 1:
                                return i = a.sent(), [2, new t.VoidApiResponse(i)]
                        }
                    })
                })
            }, s.prototype.placesRemovePlaceFromUniverse = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.placesRemovePlaceFromUniverseRaw(e, t)];
                            case 1:
                                return s.sent(), [2]
                        }
                    })
                })
            }, s.prototype.placesRollbackPlaceRaw = function(e, s) {
                return n(this, void 0, void 0, function() {
                    var r, n, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new t.RequiredError("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesRollbackPlace.");
                                return r = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/places/{placeId}/rollback".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}/rollback",
                                    method: "POST",
                                    headers: n,
                                    query: r,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            versionToRollback: e.versionToRollback,
                                            message: e.message,
                                            published: e.published
                                        }
                                    }(e.placesRollbackPlaceRequest)
                                }, s)];
                            case 1:
                                return i = a.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        newVersionNumber: (0, t.exists)(e, "newVersionNumber") ? e.newVersionNumber : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.placesRollbackPlace = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.placesRollbackPlaceRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.placesUpdateJoinRestrictionsRaw = function(e, s) {
                return n(this, void 0, void 0, function() {
                    var r, n, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesUpdateJoinRestrictions.");
                                return r = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/universes/{universeId}/set-join-restrictions".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/set-join-restrictions",
                                    method: "POST",
                                    headers: n,
                                    query: r,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            isSpecificJoinToNonRootPlacesAllowed: e.isSpecificJoinToNonRootPlacesAllowed,
                                            placeJoinRestrictionType: e.placeJoinRestrictionType
                                        }
                                    }(e.placesUpdateJoinRestrictionsRequest)
                                }, s)];
                            case 1:
                                return i = a.sent(), [2, new t.VoidApiResponse(i)]
                        }
                    })
                })
            }, s.prototype.placesUpdateJoinRestrictions = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.placesUpdateJoinRestrictionsRaw(e, t)];
                            case 1:
                                return s.sent(), [2]
                        }
                    })
                })
            }, s.prototype.placesUpdatePlaceJoinRestrictionsRaw = function(e, s) {
                return n(this, void 0, void 0, function() {
                    var r, n, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new t.RequiredError("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesUpdatePlaceJoinRestrictions.");
                                return r = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/places/{placeId}/set-join-restrictions".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}/set-join-restrictions",
                                    method: "POST",
                                    headers: n,
                                    query: r,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            isSpecificJoinToNonRootPlacesAllowed: e.isSpecificJoinToNonRootPlacesAllowed,
                                            placeJoinRestrictionType: e.placeJoinRestrictionType
                                        }
                                    }(e.placesUpdatePlaceJoinRestrictionsRequest)
                                }, s)];
                            case 1:
                                return i = a.sent(), [2, new t.VoidApiResponse(i)]
                        }
                    })
                })
            }, s.prototype.placesUpdatePlaceJoinRestrictions = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.placesUpdatePlaceJoinRestrictionsRaw(e, t)];
                            case 1:
                                return s.sent(), [2]
                        }
                    })
                })
            }, s
        }(t.BaseAPI),
        h = function(e) {
            function s() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(s, e), s.prototype.searchSearchUniversesRaw = function(e, s) {
                return n(this, void 0, void 0, function() {
                    var r, n, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return r = {}, void 0 !== e.creatorType && (r.CreatorType = e.creatorType), void 0 !== e.creatorTargetId && (r.CreatorTargetId = e.creatorTargetId), void 0 !== e.surface && (r.Surface = e.surface), void 0 !== e.pageIndex && (r.PageIndex = e.pageIndex), void 0 !== e.pageSize && (r.PageSize = e.pageSize), void 0 !== e.search && (r.Search = e.search), void 0 !== e.isArchived && (r.IsArchived = e.isArchived), void 0 !== e.isPublic && (r.IsPublic = e.isPublic), void 0 !== e.isShared && (r.IsShared = e.isShared), void 0 !== e.isTeamCreateEnabled && (r.IsTeamCreateEnabled = e.isTeamCreateEnabled), void 0 !== e.sortParam && (r.SortParam = e.sortParam), void 0 !== e.sortOrder && (r.SortOrder = e.sortOrder), void 0 !== e.needsAssetOptions && (r.NeedsAssetOptions = e.needsAssetOptions), void 0 !== e.needsHasPublishedVersion && (r.NeedsHasPublishedVersion = e.needsHasPublishedVersion), void 0 !== e.needsReachStatus && (r.NeedsReachStatus = e.needsReachStatus), n = {}, [4, this.request({
                                    path: "/v1/search",
                                    schemaPath: "/v1/search",
                                    method: "GET",
                                    headers: n,
                                    query: r
                                }, s)];
                            case 1:
                                return i = a.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        data: (0, t.exists)(e, "data") ? null === e.data ? null : e.data.map(d) : void 0,
                                        totalResults: (0, t.exists)(e, "totalResults") ? e.totalResults : void 0,
                                        totalHits: (0, t.exists)(e, "totalHits") ? e.totalHits : void 0,
                                        nextResultIndex: (0, t.exists)(e, "nextResultIndex") ? e.nextResultIndex : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.searchSearchUniverses = function() {
                return n(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.searchSearchUniversesRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.searchSearchUniversesPostRaw = function(e, s) {
                return n(this, void 0, void 0, function() {
                    var r, n, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return r = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/search",
                                    schemaPath: "/v1/search",
                                    method: "POST",
                                    headers: n,
                                    query: r,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            creators: void 0 === e.creators ? void 0 : null === e.creators ? null : e.creators.map(c),
                                            enableFuzzySearch: e.enableFuzzySearch,
                                            cursor: e.cursor,
                                            limit: e.limit,
                                            search: e.search,
                                            isArchived: e.isArchived,
                                            isPublic: e.isPublic,
                                            IsShared: e.isShared,
                                            isTeamCreateEnabled: e.isTeamCreateEnabled,
                                            sortParam: e.sortParam,
                                            sortOrder: e.sortOrder,
                                            needsAssetOptions: e.needsAssetOptions,
                                            needsHasPublishedVersion: e.needsHasPublishedVersion,
                                            needsReachStatus: e.needsReachStatus
                                        }
                                    }(e.searchSearchUniversesPostRequest)
                                }, s)];
                            case 1:
                                return i = a.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        data: (0, t.exists)(e, "data") ? null === e.data ? null : e.data.map(d) : void 0,
                                        nextCursor: (0, t.exists)(e, "nextCursor") ? e.nextCursor : void 0,
                                        warnings: (0, t.exists)(e, "warnings") ? null === e.warnings ? null : e.warnings.map(u) : void 0,
                                        totalResults: (0, t.exists)(e, "totalResults") ? e.totalResults : void 0,
                                        totalHits: (0, t.exists)(e, "totalHits") ? e.totalHits : void 0,
                                        nextResultIndex: (0, t.exists)(e, "nextResultIndex") ? e.nextResultIndex : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.searchSearchUniversesPost = function() {
                return n(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.searchSearchUniversesPostRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s
        }(t.BaseAPI);
    e.s(["PlacesApi", 0, v, "SearchApi", 0, h, "SearchCreatorType", 0, {
        User: "User",
        Group: "Group",
        Team: "Team"
    }, "SearchSortParameter", 0, {
        GameCreated: "GameCreated",
        GameName: "GameName",
        LastUpdated: "LastUpdated"
    }, "SortOrder", 0, {
        Asc: "Asc",
        Desc: "Desc"
    }, "Surface", 0, {
        StudioStartPage: "StudioStartPage",
        StudioPublishPlace: "StudioPublishPlace",
        StudioSavePlace: "StudioSavePlace",
        CreatorHubHome: "CreatorHubHome",
        CreatorHubCreations: "CreatorHubCreations",
        CreatorHubShareLinks: "CreatorHubShareLinks",
        CreatorHubOpenCloud: "CreatorHubOpenCloud",
        CreatorHubGroupPayout: "CreatorHubGroupPayout",
        CreatorHubAnalytics: "CreatorHubAnalytics"
    }])
}]);

//# debugId=ff3f5cf4-61b3-8dfd-31d6-cfd08699c2ef
//# sourceMappingURL=0mpzuuxqold60.js.map