;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "4aa79a57-a8ee-d58d-8b9b-e16512e68ab0")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 117236, e => {
    "use strict";
    var t = e.i(398515),
        r = e.i(959222),
        s = e.i(54842),
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

    function f() {
        return {
            assetTypes: new Set(v),
            bundleTypes: new Set(h)
        }
    }
    let m = new Set,
        w = new Set,
        A = null,
        P = null;
    async function R(e, r, s) {
        try {
            var i, u;
            let d = await n.default.getAllowedAssetTypes(e, [t.V1PermissionsItemTypesGetTargetTypesEnum.NUMBER_0, t.V1PermissionsItemTypesGetTargetTypesEnum.NUMBER_1]);
            return null == (i = d.allowedAssetTypes) || i.forEach(e => {
                let t = e;
                "Tshirt" === t ? t = "TShirt" : "TshirtAccessory" === t && (t = "TShirtAccessory"), (0, o.isValidEnumValue)(a.Asset, t) && r.add(t)
            }), null == (u = d.allowedBundleTypes) || u.forEach(e => {
                let t = (0, l.default)(e);
                t !== c.BundleType.Unknown && s.add(t)
            }), {
                assetTypes: r,
                bundleTypes: s
            }
        } catch (e) {
            return f()
        }
    }
    async function S() {
        return y.size > 0 ? {
            assetTypes: y,
            bundleTypes: I
        } : (null != A || (A = R(t.V1PermissionsItemTypesGetActionEnum.NUMBER_2, y, I).finally(() => {
            A = null
        })), A)
    }
    async function T() {
        return m.size > 0 ? {
            assetTypes: m,
            bundleTypes: w
        } : (null != P || (P = R(t.V1PermissionsItemTypesGetActionEnum.NUMBER_1, m, w).finally(() => {
            P = null
        })), P)
    }
    async function b() {
        let [e, t] = await Promise.all([S(), T()]), r = new Set(e.assetTypes);
        return t.assetTypes.has(a.Asset.AvatarBackground) && r.add(a.Asset.AvatarBackground), r
    }
    let g = new Set([]),
        C = {
            [r.SearchSortParameter.GameCreated]: "Label.DateOfCreation",
            [r.SearchSortParameter.GameName]: "Label.Alphabetical",
            [r.SearchSortParameter.LastUpdated]: "Label.LastUpdatedDate"
        },
        q = {
            [s.EventSortBy.CreatedUtc]: "Label.DateOfCreation",
            [s.EventSortBy.StartUtc]: "Label.StartDate"
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
    e.s(["allowedAssetTypesForArchiving", 0, d, "allowedAssetTypesForDirectArchiving", 0, u, "allowedAssetTypesForSorting", 0, p, "allowedItemTypesForUploading", 0, g, "default", 0, x, "dynamicAvatarItemsAssetTypes", 0, y, "dynamicAvatarItemsBundleTypes", 0, I, "eventSortTranslationKeys", 0, q, "getAllowedMarketplaceItemTypes", 0, S, "getAvatarItemsEntryPointAssetTypes", 0, b, "getDefaultAllowedMarketplaceItemTypes", 0, f, "getUploadableMarketplaceItemTypes", 0, T, "universeSortTranslationKeys", 0, C])
}, 959222, e => {
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

    function s(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function s() {
            this.constructor = e
        }
        r(e, t), e.prototype = null === t ? Object.create(t) : (s.prototype = t.prototype, new s)
    }

    function n(e, t, r, s) {
        return new(r || (r = Promise))(function(n, a) {
            function i(e) {
                try {
                    c(s.next(e))
                } catch (e) {
                    a(e)
                }
            }

            function o(e) {
                try {
                    c(s.throw(e))
                } catch (e) {
                    a(e)
                }
            }

            function c(e) {
                var t;
                e.done ? n(e.value) : ((t = e.value) instanceof r ? t : new r(function(e) {
                    e(t)
                })).then(i, o)
            }
            c((s = s.apply(e, t || [])).next())
        })
    }

    function a(e, t) {
        var r, s, n, a = {
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
                if (r) throw TypeError("Generator is already executing.");
                for (; i && (i = 0, l[0] && (a = 0)), a;) try {
                    if (r = 1, s && (n = 2 & l[0] ? s.return : l[0] ? s.throw || ((n = s.return) && n.call(s), 0) : s.next) && !(n = n.call(s, l[1])).done) return n;
                    switch (s = 0, n && (l = [2 & l[0], n.value]), l[0]) {
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
                            a.label++, s = l[1], l = [0];
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
                    l = [6, e], s = 0
                } finally {
                    r = n = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function i(e, r) {
        return null == e ? e : {
            placeId: (0, t.exists)(e, "placeId") ? e.placeId : void 0
        }
    }

    function o(e, r) {
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
        var r;
        return null == (r = e) ? r : {
            placeId: (0, t.exists)(r, "placeId") ? r.placeId : void 0,
            placeName: (0, t.exists)(r, "placeName") ? r.placeName : void 0,
            universeName: (0, t.exists)(r, "universeName") ? r.universeName : void 0,
            isRootPlace: (0, t.exists)(r, "isRootPlace") ? r.isRootPlace : void 0,
            universeId: (0, t.exists)(r, "universeId") ? r.universeId : void 0
        }
    }

    function u(e) {
        var r;
        return null == (r = e) ? r : {
            creatorTargetId: (0, t.exists)(r, "creatorTargetId") ? r.creatorTargetId : void 0,
            creatorType: (0, t.exists)(r, "creatorType") ? r.creatorType : void 0,
            code: (0, t.exists)(r, "code") ? r.code : void 0,
            message: (0, t.exists)(r, "message") ? r.message : void 0
        }
    }

    function d(e) {
        var r;
        return null == (r = e) ? r : {
            id: (0, t.exists)(r, "id") ? r.id : void 0,
            name: (0, t.exists)(r, "name") ? r.name : void 0,
            description: (0, t.exists)(r, "description") ? r.description : void 0,
            isArchived: (0, t.exists)(r, "isArchived") ? r.isArchived : void 0,
            rootPlaceId: (0, t.exists)(r, "rootPlaceId") ? r.rootPlaceId : void 0,
            privacyType: (0, t.exists)(r, "privacyType") ? r.privacyType : void 0,
            creatorType: (0, t.exists)(r, "creatorType") ? r.creatorType : void 0,
            creatorTargetId: (0, t.exists)(r, "creatorTargetId") ? r.creatorTargetId : void 0,
            creatorName: (0, t.exists)(r, "creatorName") ? r.creatorName : void 0,
            created: (0, t.exists)(r, "created") ? new Date(r.created) : void 0,
            updated: (0, t.exists)(r, "updated") ? new Date(r.updated) : void 0,
            isFriendsOnly: (0, t.exists)(r, "isFriendsOnly") ? r.isFriendsOnly : void 0,
            audiences: (0, t.exists)(r, "audiences") ? r.audiences : void 0
        }
    }

    function p(e) {
        if (void 0 !== e) return null === e ? null : {
            templatePlaceId: e.templatePlaceId
        }
    }
    "function" == typeof SuppressedError && SuppressedError;
    var v = function(e) {
            function r() {
                return null !== e && e.apply(this, arguments) || this
            }
            return s(r, e), r.prototype.placesAddPlaceToUniverseRaw = function(e, r) {
                return n(this, void 0, void 0, function() {
                    var s, n, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesAddPlaceToUniverse.");
                                if (null === e.placeId || void 0 === e.placeId) throw new t.RequiredError("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesAddPlaceToUniverse.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/places/{placeId}/add-place".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/universes/{universeId}/places/{placeId}/add-place",
                                    method: "POST",
                                    headers: n,
                                    query: s
                                }, r)];
                            case 1:
                                return i = a.sent(), [2, new t.VoidApiResponse(i)]
                        }
                    })
                })
            }, r.prototype.placesAddPlaceToUniverse = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.placesAddPlaceToUniverseRaw(e, t)];
                            case 1:
                                return r.sent(), [2]
                        }
                    })
                })
            }, r.prototype.placesClearJoinRestrictionsOverridesRaw = function(e, r) {
                return n(this, void 0, void 0, function() {
                    var s, n, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesClearJoinRestrictionsOverrides.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/clear-join-restrictions-overrides".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/clear-join-restrictions-overrides",
                                    method: "POST",
                                    headers: n,
                                    query: s
                                }, r)];
                            case 1:
                                return i = a.sent(), [2, new t.VoidApiResponse(i)]
                        }
                    })
                })
            }, r.prototype.placesClearJoinRestrictionsOverrides = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.placesClearJoinRestrictionsOverridesRaw(e, t)];
                            case 1:
                                return r.sent(), [2]
                        }
                    })
                })
            }, r.prototype.placesCreatePlaceApiKeyRaw = function(e, r) {
                return n(this, void 0, void 0, function() {
                    var s, n, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesCreatePlaceApiKey.");
                                return s = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/apiKey/universes/{universeId}/places".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/apiKey/universes/{universeId}/places",
                                    method: "POST",
                                    headers: n,
                                    query: s,
                                    body: p(e.placesCreatePlaceApiKeyRequest)
                                }, r)];
                            case 1:
                                return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return i(e)
                                })]
                        }
                    })
                })
            }, r.prototype.placesCreatePlaceApiKey = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.placesCreatePlaceApiKeyRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.placesCreatePlaceFromPlaceRaw = function(e, r) {
                return n(this, void 0, void 0, function() {
                    var s, n, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new t.RequiredError("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesCreatePlaceFromPlace.");
                                return s = {}, (n = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (n["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                    path: "/v1/places/{placeId}/create".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}/create",
                                    method: "POST",
                                    headers: n,
                                    query: s,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            templatePlaceId: e.templatePlaceId,
                                            placeName: e.placeName,
                                            description: e.description
                                        }
                                    }(e.placesCreatePlaceFromPlaceRequest)
                                }, r)];
                            case 1:
                                return i = a.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        placeId: (0, t.exists)(e, "placeId") ? e.placeId : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.placesCreatePlaceFromPlace = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.placesCreatePlaceFromPlaceRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.placesCreatePlaceUserAuthRaw = function(e, r) {
                return n(this, void 0, void 0, function() {
                    var s, n, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesCreatePlaceUserAuth.");
                                return s = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/user/universes/{universeId}/places".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/user/universes/{universeId}/places",
                                    method: "POST",
                                    headers: n,
                                    query: s,
                                    body: p(e.placesCreatePlaceApiKeyRequest)
                                }, r)];
                            case 1:
                                return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return i(e)
                                })]
                        }
                    })
                })
            }, r.prototype.placesCreatePlaceUserAuth = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.placesCreatePlaceUserAuthRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.placesCreatePlaceVersionApiKeyRaw = function(e, r) {
                return n(this, void 0, void 0, function() {
                    var s, n, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesCreatePlaceVersionApiKey.");
                                if (null === e.placeId || void 0 === e.placeId) throw new t.RequiredError("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesCreatePlaceVersionApiKey.");
                                return s = {}, void 0 !== e.versionType && (s.versionType = e.versionType), void 0 !== e.isOldVersionAllowed && (s.isOldVersionAllowed = e.isOldVersionAllowed), void 0 !== e.shouldForceRestart && (s.shouldForceRestart = e.shouldForceRestart), n = {}, [4, this.request({
                                    path: "/v1/apiKey/universe/{universeId}/place/{placeId}/version".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/apiKey/universe/{universeId}/place/{placeId}/version",
                                    method: "POST",
                                    headers: n,
                                    query: s
                                }, r)];
                            case 1:
                                return i = a.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return o(e)
                                })]
                        }
                    })
                })
            }, r.prototype.placesCreatePlaceVersionApiKey = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.placesCreatePlaceVersionApiKeyRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.placesCreatePlaceVersionUserAuthRaw = function(e, r) {
                return n(this, void 0, void 0, function() {
                    var s, n, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesCreatePlaceVersionUserAuth.");
                                if (null === e.placeId || void 0 === e.placeId) throw new t.RequiredError("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesCreatePlaceVersionUserAuth.");
                                return s = {}, void 0 !== e.versionType && (s.versionType = e.versionType), void 0 !== e.isOldVersionAllowed && (s.isOldVersionAllowed = e.isOldVersionAllowed), void 0 !== e.shouldForceRestart && (s.shouldForceRestart = e.shouldForceRestart), n = {}, [4, this.request({
                                    path: "/v1/user/universe/{universeId}/place/{placeId}/version".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/user/universe/{universeId}/place/{placeId}/version",
                                    method: "POST",
                                    headers: n,
                                    query: s
                                }, r)];
                            case 1:
                                return i = a.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return o(e)
                                })]
                        }
                    })
                })
            }, r.prototype.placesCreatePlaceVersionUserAuth = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.placesCreatePlaceVersionUserAuthRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.placesCreateUniverseRaw = function(e, r) {
                return n(this, void 0, void 0, function() {
                    var s, n, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return s = {}, void 0 !== e.groupId && (s.groupId = e.groupId), (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/universes/create",
                                    schemaPath: "/v1/universes/create",
                                    method: "POST",
                                    headers: n,
                                    query: s,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            templatePlaceId: e.templatePlaceId,
                                            isPublish: e.isPublish
                                        }
                                    }(e.placesCreateUniverseRequest)
                                }, r)];
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
            }, r.prototype.placesCreateUniverse = function() {
                return n(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.placesCreateUniverseRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.placesGetJoinRestrictionsRaw = function(e, r) {
                return n(this, void 0, void 0, function() {
                    var s, n, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesGetJoinRestrictions.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/join-restrictions".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/join-restrictions",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, r)];
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
            }, r.prototype.placesGetJoinRestrictions = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.placesGetJoinRestrictionsRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.placesGetOwnedPlacesByCreationContextRaw = function(e, r) {
                return n(this, void 0, void 0, function() {
                    var s, n, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return s = {}, void 0 !== e.creatorTargetId && (s.creatorTargetId = e.creatorTargetId), void 0 !== e.creatorTargetType && (s.creatorTargetType = e.creatorTargetType), void 0 !== e.creationContext && (s.creationContext = e.creationContext), void 0 !== e.universeId && (s.universeId = e.universeId), void 0 !== e.nextPageToken && (s.nextPageToken = e.nextPageToken), void 0 !== e.maxPageSize && (s.maxPageSize = e.maxPageSize), n = {}, [4, this.request({
                                    path: "/v2/owned-places-by-creation-context",
                                    schemaPath: "/v2/owned-places-by-creation-context",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, r)];
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
            }, r.prototype.placesGetOwnedPlacesByCreationContext = function() {
                return n(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.placesGetOwnedPlacesByCreationContextRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.placesGetPlaceJoinRestrictionsRaw = function(e, r) {
                return n(this, void 0, void 0, function() {
                    var s, n, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new t.RequiredError("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesGetPlaceJoinRestrictions.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/places/{placeId}/join-restrictions".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}/join-restrictions",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, r)];
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
            }, r.prototype.placesGetPlaceJoinRestrictions = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.placesGetPlaceJoinRestrictionsRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.placesGetPrivatePlaytesterStatusRaw = function(e, r) {
                return n(this, void 0, void 0, function() {
                    var s, n, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesGetPrivatePlaytesterStatus.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/is-private-playtester".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/is-private-playtester",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, r)];
                            case 1:
                                return i = a.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        isPlaytester: (0, t.exists)(e, "isPlaytester") ? e.isPlaytester : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.placesGetPrivatePlaytesterStatus = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.placesGetPrivatePlaytesterStatusRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.placesGetUniverseContainingPlaceRaw = function(e, r) {
                return n(this, void 0, void 0, function() {
                    var s, n, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new t.RequiredError("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesGetUniverseContainingPlace.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/places/{placeId}/universe".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}/universe",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, r)];
                            case 1:
                                return i = a.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        universeId: (0, t.exists)(e, "universeId") ? e.universeId : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.placesGetUniverseContainingPlace = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.placesGetUniverseContainingPlaceRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.placesMigrateUniverseRaw = function(e, r) {
                return n(this, void 0, void 0, function() {
                    var s, n, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesMigrateUniverse.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/migrate-universe".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/migrate-universe",
                                    method: "POST",
                                    headers: n,
                                    query: s
                                }, r)];
                            case 1:
                                return i = a.sent(), [2, new t.VoidApiResponse(i)]
                        }
                    })
                })
            }, r.prototype.placesMigrateUniverse = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.placesMigrateUniverseRaw(e, t)];
                            case 1:
                                return r.sent(), [2]
                        }
                    })
                })
            }, r.prototype.placesRemovePlaceFromUniverseRaw = function(e, r) {
                return n(this, void 0, void 0, function() {
                    var s, n, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesRemovePlaceFromUniverse.");
                                if (null === e.placeId || void 0 === e.placeId) throw new t.RequiredError("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesRemovePlaceFromUniverse.");
                                return s = {}, n = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/places/{placeId}/remove-place".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/universes/{universeId}/places/{placeId}/remove-place",
                                    method: "POST",
                                    headers: n,
                                    query: s
                                }, r)];
                            case 1:
                                return i = a.sent(), [2, new t.VoidApiResponse(i)]
                        }
                    })
                })
            }, r.prototype.placesRemovePlaceFromUniverse = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.placesRemovePlaceFromUniverseRaw(e, t)];
                            case 1:
                                return r.sent(), [2]
                        }
                    })
                })
            }, r.prototype.placesRollbackPlaceRaw = function(e, r) {
                return n(this, void 0, void 0, function() {
                    var s, n, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new t.RequiredError("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesRollbackPlace.");
                                return s = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/places/{placeId}/rollback".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}/rollback",
                                    method: "POST",
                                    headers: n,
                                    query: s,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            versionToRollback: e.versionToRollback,
                                            message: e.message,
                                            published: e.published
                                        }
                                    }(e.placesRollbackPlaceRequest)
                                }, r)];
                            case 1:
                                return i = a.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        newVersionNumber: (0, t.exists)(e, "newVersionNumber") ? e.newVersionNumber : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.placesRollbackPlace = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.placesRollbackPlaceRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.placesUpdateJoinRestrictionsRaw = function(e, r) {
                return n(this, void 0, void 0, function() {
                    var s, n, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesUpdateJoinRestrictions.");
                                return s = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/universes/{universeId}/set-join-restrictions".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/set-join-restrictions",
                                    method: "POST",
                                    headers: n,
                                    query: s,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            isSpecificJoinToNonRootPlacesAllowed: e.isSpecificJoinToNonRootPlacesAllowed,
                                            placeJoinRestrictionType: e.placeJoinRestrictionType
                                        }
                                    }(e.placesUpdateJoinRestrictionsRequest)
                                }, r)];
                            case 1:
                                return i = a.sent(), [2, new t.VoidApiResponse(i)]
                        }
                    })
                })
            }, r.prototype.placesUpdateJoinRestrictions = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.placesUpdateJoinRestrictionsRaw(e, t)];
                            case 1:
                                return r.sent(), [2]
                        }
                    })
                })
            }, r.prototype.placesUpdatePlaceJoinRestrictionsRaw = function(e, r) {
                return n(this, void 0, void 0, function() {
                    var s, n, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new t.RequiredError("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesUpdatePlaceJoinRestrictions.");
                                return s = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/places/{placeId}/set-join-restrictions".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}/set-join-restrictions",
                                    method: "POST",
                                    headers: n,
                                    query: s,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            isSpecificJoinToNonRootPlacesAllowed: e.isSpecificJoinToNonRootPlacesAllowed,
                                            placeJoinRestrictionType: e.placeJoinRestrictionType
                                        }
                                    }(e.placesUpdatePlaceJoinRestrictionsRequest)
                                }, r)];
                            case 1:
                                return i = a.sent(), [2, new t.VoidApiResponse(i)]
                        }
                    })
                })
            }, r.prototype.placesUpdatePlaceJoinRestrictions = function(e, t) {
                return n(this, void 0, void 0, function() {
                    return a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.placesUpdatePlaceJoinRestrictionsRaw(e, t)];
                            case 1:
                                return r.sent(), [2]
                        }
                    })
                })
            }, r
        }(t.BaseAPI),
        h = function(e) {
            function r() {
                return null !== e && e.apply(this, arguments) || this
            }
            return s(r, e), r.prototype.searchSearchUniversesRaw = function(e, r) {
                return n(this, void 0, void 0, function() {
                    var s, n, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return s = {}, void 0 !== e.creatorType && (s.CreatorType = e.creatorType), void 0 !== e.creatorTargetId && (s.CreatorTargetId = e.creatorTargetId), void 0 !== e.surface && (s.Surface = e.surface), void 0 !== e.pageIndex && (s.PageIndex = e.pageIndex), void 0 !== e.pageSize && (s.PageSize = e.pageSize), void 0 !== e.search && (s.Search = e.search), void 0 !== e.isArchived && (s.IsArchived = e.isArchived), void 0 !== e.isPublic && (s.IsPublic = e.isPublic), void 0 !== e.isShared && (s.IsShared = e.isShared), void 0 !== e.isTeamCreateEnabled && (s.IsTeamCreateEnabled = e.isTeamCreateEnabled), void 0 !== e.sortParam && (s.SortParam = e.sortParam), void 0 !== e.sortOrder && (s.SortOrder = e.sortOrder), void 0 !== e.needsAssetOptions && (s.NeedsAssetOptions = e.needsAssetOptions), n = {}, [4, this.request({
                                    path: "/v1/search",
                                    schemaPath: "/v1/search",
                                    method: "GET",
                                    headers: n,
                                    query: s
                                }, r)];
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
            }, r.prototype.searchSearchUniverses = function() {
                return n(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.searchSearchUniversesRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.searchSearchUniversesPostRaw = function(e, r) {
                return n(this, void 0, void 0, function() {
                    var s, n, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return s = {}, (n = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/search",
                                    schemaPath: "/v1/search",
                                    method: "POST",
                                    headers: n,
                                    query: s,
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
                                            needsAssetOptions: e.needsAssetOptions
                                        }
                                    }(e.searchSearchUniversesPostRequest)
                                }, r)];
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
            }, r.prototype.searchSearchUniversesPost = function() {
                return n(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.searchSearchUniversesPostRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r
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

//# debugId=4aa79a57-a8ee-d58d-8b9b-e16512e68ab0
//# sourceMappingURL=1jko7v_2fawfe.js.map