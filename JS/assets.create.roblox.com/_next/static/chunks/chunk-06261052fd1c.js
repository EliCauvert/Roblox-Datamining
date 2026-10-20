;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "51b64454-0696-2b36-909f-142b30a2f773")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 9618, e => {
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

    function n(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function n() {
            this.constructor = e
        }
        r(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
    }

    function i(e, t, r, n) {
        return new(r || (r = Promise))(function(i, s) {
            function a(e) {
                try {
                    c(n.next(e))
                } catch (e) {
                    s(e)
                }
            }

            function o(e) {
                try {
                    c(n.throw(e))
                } catch (e) {
                    s(e)
                }
            }

            function c(e) {
                var t;
                e.done ? i(e.value) : ((t = e.value) instanceof r ? t : new r(function(e) {
                    e(t)
                })).then(a, o)
            }
            c((n = n.apply(e, t || [])).next())
        })
    }

    function s(e, t) {
        var r, n, i, s = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            },
            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return a.next = o(0), a.throw = o(1), a.return = o(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
            return this
        }), a;

        function o(o) {
            return function(c) {
                var l = [o, c];
                if (r) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, l[0] && (s = 0)), s;) try {
                    if (r = 1, n && (i = 2 & l[0] ? n.return : l[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, l[1])).done) return i;
                    switch (n = 0, i && (l = [2 & l[0], i.value]), l[0]) {
                        case 0:
                        case 1:
                            i = l;
                            break;
                        case 4:
                            return s.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            s.label++, n = l[1], l = [0];
                            continue;
                        case 7:
                            l = s.ops.pop(), s.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = s.trys).length > 0 && i[i.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                s = 0;
                                continue
                            }
                            if (3 === l[0] && (!i || l[1] > i[0] && l[1] < i[3])) {
                                s.label = l[1];
                                break
                            }
                            if (6 === l[0] && s.label < i[1]) {
                                s.label = i[1], i = l;
                                break
                            }
                            if (i && s.label < i[2]) {
                                s.label = i[2], s.ops.push(l);
                                break
                            }
                            i[2] && s.ops.pop(), s.trys.pop();
                            continue
                    }
                    l = t.call(e, s)
                } catch (e) {
                    l = [6, e], n = 0
                } finally {
                    r = i = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function a(e, r) {
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
        var r, n;
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
            isTeamCreateEnabled: (0, t.exists)(r, "isTeamCreateEnabled") ? r.isTeamCreateEnabled : void 0,
            hasPublishedVersion: (0, t.exists)(r, "hasPublishedVersion") ? r.hasPublishedVersion : void 0,
            audiences: (0, t.exists)(r, "audiences") ? r.audiences : void 0,
            reachStatus: (0, t.exists)(r, "reachStatus") ? null == (n = r.reachStatus) ? n : {
                chipStatus: (0, t.exists)(n, "chipStatus") ? n.chipStatus : void 0,
                iconName: (0, t.exists)(n, "iconName") ? n.iconName : void 0,
                translatedStatus: (0, t.exists)(n, "translatedStatus") ? n.translatedStatus : void 0,
                variant: (0, t.exists)(n, "variant") ? n.variant : void 0
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
            function r() {
                return null !== e && e.apply(this, arguments) || this
            }
            return n(r, e), r.prototype.placesAddPlaceToUniverseRaw = function(e, r) {
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesAddPlaceToUniverse.");
                                if (null === e.placeId || void 0 === e.placeId) throw new t.RequiredError("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesAddPlaceToUniverse.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/places/{placeId}/add-place".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/universes/{universeId}/places/{placeId}/add-place",
                                    method: "POST",
                                    headers: i,
                                    query: n
                                }, r)];
                            case 1:
                                return a = s.sent(), [2, new t.VoidApiResponse(a)]
                        }
                    })
                })
            }, r.prototype.placesAddPlaceToUniverse = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.placesAddPlaceToUniverseRaw(e, t)];
                            case 1:
                                return r.sent(), [2]
                        }
                    })
                })
            }, r.prototype.placesClearJoinRestrictionsOverridesRaw = function(e, r) {
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesClearJoinRestrictionsOverrides.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/clear-join-restrictions-overrides".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/clear-join-restrictions-overrides",
                                    method: "POST",
                                    headers: i,
                                    query: n
                                }, r)];
                            case 1:
                                return a = s.sent(), [2, new t.VoidApiResponse(a)]
                        }
                    })
                })
            }, r.prototype.placesClearJoinRestrictionsOverrides = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.placesClearJoinRestrictionsOverridesRaw(e, t)];
                            case 1:
                                return r.sent(), [2]
                        }
                    })
                })
            }, r.prototype.placesCreatePlaceApiKeyRaw = function(e, r) {
                return i(this, void 0, void 0, function() {
                    var n, i, o;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesCreatePlaceApiKey.");
                                return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/apiKey/universes/{universeId}/places".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/apiKey/universes/{universeId}/places",
                                    method: "POST",
                                    headers: i,
                                    query: n,
                                    body: p(e.placesCreatePlaceApiKeyRequest)
                                }, r)];
                            case 1:
                                return o = s.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return a(e)
                                })]
                        }
                    })
                })
            }, r.prototype.placesCreatePlaceApiKey = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(r) {
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
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new t.RequiredError("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesCreatePlaceFromPlace.");
                                return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (i["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                    path: "/v1/places/{placeId}/create".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}/create",
                                    method: "POST",
                                    headers: i,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            templatePlaceId: e.templatePlaceId,
                                            placeName: e.placeName,
                                            description: e.description
                                        }
                                    }(e.placesCreatePlaceFromPlaceRequest)
                                }, r)];
                            case 1:
                                return a = s.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        placeId: (0, t.exists)(e, "placeId") ? e.placeId : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.placesCreatePlaceFromPlace = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(r) {
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
                return i(this, void 0, void 0, function() {
                    var n, i, o;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesCreatePlaceUserAuth.");
                                return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/user/universes/{universeId}/places".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/user/universes/{universeId}/places",
                                    method: "POST",
                                    headers: i,
                                    query: n,
                                    body: p(e.placesCreatePlaceApiKeyRequest)
                                }, r)];
                            case 1:
                                return o = s.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return a(e)
                                })]
                        }
                    })
                })
            }, r.prototype.placesCreatePlaceUserAuth = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(r) {
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
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesCreatePlaceVersionApiKey.");
                                if (null === e.placeId || void 0 === e.placeId) throw new t.RequiredError("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesCreatePlaceVersionApiKey.");
                                return n = {}, void 0 !== e.versionType && (n.versionType = e.versionType), void 0 !== e.isOldVersionAllowed && (n.isOldVersionAllowed = e.isOldVersionAllowed), void 0 !== e.shouldForceRestart && (n.shouldForceRestart = e.shouldForceRestart), i = {}, [4, this.request({
                                    path: "/v1/apiKey/universe/{universeId}/place/{placeId}/version".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/apiKey/universe/{universeId}/place/{placeId}/version",
                                    method: "POST",
                                    headers: i,
                                    query: n
                                }, r)];
                            case 1:
                                return a = s.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return o(e)
                                })]
                        }
                    })
                })
            }, r.prototype.placesCreatePlaceVersionApiKey = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(r) {
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
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesCreatePlaceVersionUserAuth.");
                                if (null === e.placeId || void 0 === e.placeId) throw new t.RequiredError("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesCreatePlaceVersionUserAuth.");
                                return n = {}, void 0 !== e.versionType && (n.versionType = e.versionType), void 0 !== e.isOldVersionAllowed && (n.isOldVersionAllowed = e.isOldVersionAllowed), void 0 !== e.shouldForceRestart && (n.shouldForceRestart = e.shouldForceRestart), i = {}, [4, this.request({
                                    path: "/v1/user/universe/{universeId}/place/{placeId}/version".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/user/universe/{universeId}/place/{placeId}/version",
                                    method: "POST",
                                    headers: i,
                                    query: n
                                }, r)];
                            case 1:
                                return a = s.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return o(e)
                                })]
                        }
                    })
                })
            }, r.prototype.placesCreatePlaceVersionUserAuth = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(r) {
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
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return n = {}, void 0 !== e.groupId && (n.groupId = e.groupId), (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/universes/create",
                                    schemaPath: "/v1/universes/create",
                                    method: "POST",
                                    headers: i,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            templatePlaceId: e.templatePlaceId,
                                            isPublish: e.isPublish
                                        }
                                    }(e.placesCreateUniverseRequest)
                                }, r)];
                            case 1:
                                return a = s.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        universeId: (0, t.exists)(e, "universeId") ? e.universeId : void 0,
                                        rootPlaceId: (0, t.exists)(e, "rootPlaceId") ? e.rootPlaceId : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.placesCreateUniverse = function() {
                return i(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), s(this, function(r) {
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
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesGetJoinRestrictions.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/join-restrictions".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/join-restrictions",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, r)];
                            case 1:
                                return a = s.sent(), [2, new t.JSONApiResponse(a, function(e) {
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
                return i(this, void 0, void 0, function() {
                    return s(this, function(r) {
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
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return n = {}, void 0 !== e.creatorTargetId && (n.creatorTargetId = e.creatorTargetId), void 0 !== e.creatorTargetType && (n.creatorTargetType = e.creatorTargetType), void 0 !== e.creationContext && (n.creationContext = e.creationContext), void 0 !== e.universeId && (n.universeId = e.universeId), void 0 !== e.nextPageToken && (n.nextPageToken = e.nextPageToken), void 0 !== e.maxPageSize && (n.maxPageSize = e.maxPageSize), i = {}, [4, this.request({
                                    path: "/v2/owned-places-by-creation-context",
                                    schemaPath: "/v2/owned-places-by-creation-context",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, r)];
                            case 1:
                                return a = s.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        places: (0, t.exists)(e, "places") ? null === e.places ? null : e.places.map(l) : void 0,
                                        nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.placesGetOwnedPlacesByCreationContext = function() {
                return i(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), s(this, function(r) {
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
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new t.RequiredError("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesGetPlaceJoinRestrictions.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/places/{placeId}/join-restrictions".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}/join-restrictions",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, r)];
                            case 1:
                                return a = s.sent(), [2, new t.JSONApiResponse(a, function(e) {
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
                return i(this, void 0, void 0, function() {
                    return s(this, function(r) {
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
            }, r.prototype.placesGetPlacePublishStatusRaw = function(e, r) {
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new t.RequiredError("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesGetPlacePublishStatus.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/places/{placeId}/publish-status".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}/publish-status",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, r)];
                            case 1:
                                return a = s.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        hasPublishedVersion: (0, t.exists)(e, "hasPublishedVersion") ? e.hasPublishedVersion : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.placesGetPlacePublishStatus = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.placesGetPlacePublishStatusRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.placesGetPrivatePlaytesterStatusRaw = function(e, r) {
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesGetPrivatePlaytesterStatus.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/is-private-playtester".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/is-private-playtester",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, r)];
                            case 1:
                                return a = s.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        isPlaytester: (0, t.exists)(e, "isPlaytester") ? e.isPlaytester : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.placesGetPrivatePlaytesterStatus = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(r) {
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
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new t.RequiredError("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesGetUniverseContainingPlace.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/places/{placeId}/universe".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}/universe",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, r)];
                            case 1:
                                return a = s.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        universeId: (0, t.exists)(e, "universeId") ? e.universeId : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.placesGetUniverseContainingPlace = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(r) {
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
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesMigrateUniverse.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/migrate-universe".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/migrate-universe",
                                    method: "POST",
                                    headers: i,
                                    query: n
                                }, r)];
                            case 1:
                                return a = s.sent(), [2, new t.VoidApiResponse(a)]
                        }
                    })
                })
            }, r.prototype.placesMigrateUniverse = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.placesMigrateUniverseRaw(e, t)];
                            case 1:
                                return r.sent(), [2]
                        }
                    })
                })
            }, r.prototype.placesPublishLatestSavedPlaceVersionRaw = function(e, r) {
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new t.RequiredError("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesPublishLatestSavedPlaceVersion.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/places/{placeId}/publish-latest".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}/publish-latest",
                                    method: "POST",
                                    headers: i,
                                    query: n
                                }, r)];
                            case 1:
                                return a = s.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        versionNumber: (0, t.exists)(e, "versionNumber") ? e.versionNumber : void 0,
                                        operationId: (0, t.exists)(e, "operationId") ? e.operationId : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.placesPublishLatestSavedPlaceVersion = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.placesPublishLatestSavedPlaceVersionRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.placesRemovePlaceFromUniverseRaw = function(e, r) {
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesRemovePlaceFromUniverse.");
                                if (null === e.placeId || void 0 === e.placeId) throw new t.RequiredError("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesRemovePlaceFromUniverse.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/places/{placeId}/remove-place".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/universes/{universeId}/places/{placeId}/remove-place",
                                    method: "POST",
                                    headers: i,
                                    query: n
                                }, r)];
                            case 1:
                                return a = s.sent(), [2, new t.VoidApiResponse(a)]
                        }
                    })
                })
            }, r.prototype.placesRemovePlaceFromUniverse = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.placesRemovePlaceFromUniverseRaw(e, t)];
                            case 1:
                                return r.sent(), [2]
                        }
                    })
                })
            }, r.prototype.placesRollbackPlaceRaw = function(e, r) {
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new t.RequiredError("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesRollbackPlace.");
                                return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/places/{placeId}/rollback".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}/rollback",
                                    method: "POST",
                                    headers: i,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            versionToRollback: e.versionToRollback,
                                            message: e.message,
                                            published: e.published
                                        }
                                    }(e.placesRollbackPlaceRequest)
                                }, r)];
                            case 1:
                                return a = s.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        newVersionNumber: (0, t.exists)(e, "newVersionNumber") ? e.newVersionNumber : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.placesRollbackPlace = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(r) {
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
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesUpdateJoinRestrictions.");
                                return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/universes/{universeId}/set-join-restrictions".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/set-join-restrictions",
                                    method: "POST",
                                    headers: i,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            isSpecificJoinToNonRootPlacesAllowed: e.isSpecificJoinToNonRootPlacesAllowed,
                                            placeJoinRestrictionType: e.placeJoinRestrictionType
                                        }
                                    }(e.placesUpdateJoinRestrictionsRequest)
                                }, r)];
                            case 1:
                                return a = s.sent(), [2, new t.VoidApiResponse(a)]
                        }
                    })
                })
            }, r.prototype.placesUpdateJoinRestrictions = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.placesUpdateJoinRestrictionsRaw(e, t)];
                            case 1:
                                return r.sent(), [2]
                        }
                    })
                })
            }, r.prototype.placesUpdatePlaceJoinRestrictionsRaw = function(e, r) {
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new t.RequiredError("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesUpdatePlaceJoinRestrictions.");
                                return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/places/{placeId}/set-join-restrictions".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}/set-join-restrictions",
                                    method: "POST",
                                    headers: i,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            isSpecificJoinToNonRootPlacesAllowed: e.isSpecificJoinToNonRootPlacesAllowed,
                                            placeJoinRestrictionType: e.placeJoinRestrictionType
                                        }
                                    }(e.placesUpdatePlaceJoinRestrictionsRequest)
                                }, r)];
                            case 1:
                                return a = s.sent(), [2, new t.VoidApiResponse(a)]
                        }
                    })
                })
            }, r.prototype.placesUpdatePlaceJoinRestrictions = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(r) {
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
            return n(r, e), r.prototype.searchSearchUniversesRaw = function(e, r) {
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return n = {}, void 0 !== e.creatorType && (n.CreatorType = e.creatorType), void 0 !== e.creatorTargetId && (n.CreatorTargetId = e.creatorTargetId), void 0 !== e.surface && (n.Surface = e.surface), void 0 !== e.pageIndex && (n.PageIndex = e.pageIndex), void 0 !== e.pageSize && (n.PageSize = e.pageSize), void 0 !== e.search && (n.Search = e.search), void 0 !== e.isArchived && (n.IsArchived = e.isArchived), void 0 !== e.isPublic && (n.IsPublic = e.isPublic), void 0 !== e.isShared && (n.IsShared = e.isShared), void 0 !== e.isTeamCreateEnabled && (n.IsTeamCreateEnabled = e.isTeamCreateEnabled), void 0 !== e.sortParam && (n.SortParam = e.sortParam), void 0 !== e.sortOrder && (n.SortOrder = e.sortOrder), void 0 !== e.needsAssetOptions && (n.NeedsAssetOptions = e.needsAssetOptions), void 0 !== e.needsHasPublishedVersion && (n.NeedsHasPublishedVersion = e.needsHasPublishedVersion), void 0 !== e.needsReachStatus && (n.NeedsReachStatus = e.needsReachStatus), i = {}, [4, this.request({
                                    path: "/v1/search",
                                    schemaPath: "/v1/search",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, r)];
                            case 1:
                                return a = s.sent(), [2, new t.JSONApiResponse(a, function(e) {
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
                return i(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), s(this, function(r) {
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
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/search",
                                    schemaPath: "/v1/search",
                                    method: "POST",
                                    headers: i,
                                    query: n,
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
                                }, r)];
                            case 1:
                                return a = s.sent(), [2, new t.JSONApiResponse(a, function(e) {
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
                return i(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), s(this, function(r) {
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
}, 419959, e => {
    "use strict";
    var t = e.i(945146),
        r = e.i(690569),
        n = e.i(416340),
        i = e.i(251635),
        s = e.i(787802),
        a = e.i(176595),
        o = e.i(221628),
        c = e.i(946029),
        l = e.i(710302),
        u = e.i(236365),
        d = e.i(335527),
        p = e.i(894852),
        v = e.i(121880);

    function h(e) {
        return (0, r.g)("MuiFormGroup", e)
    }(0, s.g)("MuiFormGroup", ["root", "row", "error"]);
    let f = ["className", "row"],
        m = (0, i.s)("div", {
            name: "MuiFormGroup",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: r
                } = e;
                return [t.root, r.row && t.row]
            }
        })(e => {
            let {
                ownerState: r
            } = e;
            return (0, t._)({
                display: "flex",
                flexDirection: "column",
                flexWrap: "wrap"
            }, r.row && {
                flexDirection: "row"
            })
        }),
        I = n.forwardRef(function(e, n) {
            let s = (0, v.u)({
                    props: e,
                    name: "MuiFormGroup"
                }),
                {
                    className: a,
                    row: c = !1
                } = s,
                l = (0, r._)(s, f),
                u = (0, d.u)(),
                I = (0, p.f)({
                    props: s,
                    muiFormControl: u,
                    states: ["error"]
                }),
                w = (0, t._)({}, s, {
                    row: c,
                    error: I.error
                }),
                y = (e => {
                    let {
                        classes: t,
                        row: r,
                        error: n
                    } = e;
                    return (0, i.a)({
                        root: ["root", r && "row", n && "error"]
                    }, h, t)
                })(w);
            return (0, o.jsx)(m, (0, t._)({
                className: (0, i.c)(y.root, a),
                ownerState: w,
                ref: n
            }, l))
        });
    var w = e.i(977987),
        y = e.i(634034),
        R = e.i(722417),
        P = e.i(352705);
    e.i(407110);
    var b = e.i(887833);

    function g(e) {
        return (0, r.g)("MuiRadioGroup", e)
    }(0, s.g)("MuiRadioGroup", ["root", "row", "error"]);
    let S = ["actions", "children", "className", "defaultValue", "name", "onChange", "value"],
        x = n.forwardRef(function(e, s) {
            let {
                actions: d,
                children: p,
                className: v,
                defaultValue: h,
                name: f,
                onChange: m,
                value: w
            } = e, y = (0, r._)(e, S), R = n.useRef(null), P = (e => {
                let {
                    classes: t,
                    row: r,
                    error: n
                } = e;
                return (0, i.a)({
                    root: ["root", r && "row", n && "error"]
                }, g, t)
            })(e), [b, x] = (0, c.u)({
                controlled: w,
                default: h,
                name: "RadioGroup"
            });
            n.useImperativeHandle(d, () => ({
                focus: () => {
                    let e = R.current.querySelector("input:not(:disabled):checked");
                    e || (e = R.current.querySelector("input:not(:disabled)")), e && e.focus()
                }
            }), []);
            let C = (0, l.u)(s, R),
                T = (0, u.u)(f),
                q = n.useMemo(() => ({
                    name: T,
                    onChange(e) {
                        x(e.target.value), m && m(e, e.target.value)
                    },
                    value: b
                }), [T, m, x, b]);
            return (0, o.jsx)(a.R.Provider, {
                value: q,
                children: (0, o.jsx)(I, (0, t._)({
                    role: "radiogroup",
                    ref: C,
                    className: (0, i.c)(P.root, v)
                }, y, {
                    children: p
                }))
            })
        });
    var C = (0, y.c)((0, o.jsx)("path", {
            d: "M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"
        }), "Star"),
        T = (0, y.c)((0, o.jsx)("path", {
            d: "M22 9.24l-7.19-.62L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21 12 17.27 18.18 21l-1.63-7.03L22 9.24zM12 15.4l-3.76 2.27 1-4.28-3.32-2.88 4.38-.38L12 6.1l1.71 4.04 4.38.38-3.32 2.88 1 4.28L12 15.4z"
        }), "StarBorder");

    function q(e) {
        return (0, r.g)("MuiRating", e)
    }
    var A = (0, s.g)("MuiRating", ["root", "sizeSmall", "sizeMedium", "sizeLarge", "readOnly", "disabled", "focusVisible", "visuallyHidden", "pristine", "label", "labelEmptyValueActive", "icon", "iconEmpty", "iconFilled", "iconHover", "iconFocus", "iconActive", "decimal"]);
    let O = ["value"],
        U = ["className", "defaultValue", "disabled", "emptyIcon", "emptyLabelText", "getLabelText", "highlightSelectedOnly", "icon", "IconContainerComponent", "max", "name", "onChange", "onChangeActive", "onMouseLeave", "onMouseMove", "precision", "readOnly", "size", "value"];

    function N(e, t) {
        let r;
        return null == e ? e : Number((Math.round(e / t) * t).toFixed((r = t.toString().split(".")[1]) ? r.length : 0))
    }
    let V = (0, i.s)("span", {
            name: "MuiRating",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: n
                } = e;
                return [{
                    ["& .".concat(A.visuallyHidden)]: t.visuallyHidden
                }, t.root, t["size".concat((0, r.a)(n.size))], n.readOnly && t.readOnly]
            }
        })(e => {
            let {
                theme: r,
                ownerState: n
            } = e;
            return (0, t._)({
                display: "inline-flex",
                position: "relative",
                fontSize: r.typography.pxToRem(24),
                color: "#faaf00",
                cursor: "pointer",
                textAlign: "left",
                width: "min-content",
                WebkitTapHighlightColor: "transparent",
                ["&.".concat(A.disabled)]: {
                    opacity: (r.vars || r).palette.action.disabledOpacity,
                    pointerEvents: "none"
                },
                ["&.".concat(A.focusVisible, " .").concat(A.iconActive)]: {
                    outline: "1px solid #999"
                },
                ["& .".concat(A.visuallyHidden)]: R.v
            }, "small" === n.size && {
                fontSize: r.typography.pxToRem(18)
            }, "large" === n.size && {
                fontSize: r.typography.pxToRem(30)
            }, n.readOnly && {
                pointerEvents: "none"
            })
        }),
        E = (0, i.s)("label", {
            name: "MuiRating",
            slot: "Label",
            overridesResolver: (e, t) => {
                let {
                    ownerState: r
                } = e;
                return [t.label, r.emptyValueFocused && t.labelEmptyValueActive]
            }
        })(e => {
            let {
                ownerState: r
            } = e;
            return (0, t._)({
                cursor: "inherit"
            }, r.emptyValueFocused && {
                top: 0,
                bottom: 0,
                position: "absolute",
                outline: "1px solid #999",
                width: "100%"
            })
        }),
        F = (0, i.s)("span", {
            name: "MuiRating",
            slot: "Icon",
            overridesResolver: (e, t) => {
                let {
                    ownerState: r
                } = e;
                return [t.icon, r.iconEmpty && t.iconEmpty, r.iconFilled && t.iconFilled, r.iconHover && t.iconHover, r.iconFocus && t.iconFocus, r.iconActive && t.iconActive]
            }
        })(e => {
            let {
                theme: r,
                ownerState: n
            } = e;
            return (0, t._)({
                display: "flex",
                transition: r.transitions.create("transform", {
                    duration: r.transitions.duration.shortest
                }),
                pointerEvents: "none"
            }, n.iconActive && {
                transform: "scale(1.2)"
            }, n.iconEmpty && {
                color: (r.vars || r).palette.action.disabled
            })
        }),
        J = (0, i.s)("span", {
            name: "MuiRating",
            slot: "Decimal",
            shouldForwardProp: e => (0, i.b)(e) && "iconActive" !== e,
            overridesResolver: (e, t) => {
                let {
                    iconActive: r
                } = e;
                return [t.decimal, r && t.iconActive]
            }
        })(e => {
            let {
                iconActive: r
            } = e;
            return (0, t._)({
                position: "relative"
            }, r && {
                transform: "scale(1.2)"
            })
        });

    function j(e) {
        let n = (0, r._)(e, O);
        return (0, o.jsx)("span", (0, t._)({}, n))
    }

    function G(e) {
        let {
            classes: r,
            disabled: s,
            emptyIcon: a,
            focus: c,
            getLabelText: l,
            highlightSelectedOnly: d,
            hover: p,
            icon: v,
            IconContainerComponent: h,
            isActive: f,
            itemValue: m,
            labelProps: I,
            name: w,
            onBlur: y,
            onChange: R,
            onClick: P,
            onFocus: b,
            readOnly: g,
            ownerState: S,
            ratingValue: x,
            ratingValueRounded: C
        } = e, T = d ? m === x : m <= x, q = m <= p, A = m <= c, O = m === C, U = (0, u.u)(), N = (0, o.jsx)(F, {
            as: h,
            value: m,
            className: (0, i.c)(r.icon, T ? r.iconFilled : r.iconEmpty, q && r.iconHover, A && r.iconFocus, f && r.iconActive),
            ownerState: (0, t._)({}, S, {
                iconEmpty: !T,
                iconFilled: T,
                iconHover: q,
                iconFocus: A,
                iconActive: f
            }),
            children: a && !T ? a : v
        });
        return g ? (0, o.jsx)("span", (0, t._)({}, I, {
            children: N
        })) : (0, o.jsxs)(n.Fragment, {
            children: [(0, o.jsxs)(E, (0, t._)({
                ownerState: (0, t._)({}, S, {
                    emptyValueFocused: void 0
                }),
                htmlFor: U
            }, I, {
                children: [N, (0, o.jsx)("span", {
                    className: r.visuallyHidden,
                    children: l(m)
                })]
            })), (0, o.jsx)("input", {
                className: r.visuallyHidden,
                onFocus: b,
                onBlur: y,
                onChange: R,
                onClick: P,
                disabled: s,
                value: m,
                id: U,
                type: "radio",
                name: w,
                checked: O
            })]
        })
    }
    let H = (0, o.jsx)(C, {
            fontSize: "inherit"
        }),
        M = (0, o.jsx)(T, {
            fontSize: "inherit"
        });

    function L(e) {
        return "".concat(e, " Star").concat(1 !== e ? "s" : "")
    }
    n.forwardRef(function(e, s) {
        let a = (0, v.u)({
                name: "MuiRating",
                props: e
            }),
            {
                className: d,
                defaultValue: p = null,
                disabled: h = !1,
                emptyIcon: f = M,
                emptyLabelText: m = "Empty",
                getLabelText: I = L,
                highlightSelectedOnly: y = !1,
                icon: R = H,
                IconContainerComponent: g = j,
                max: S = 5,
                name: x,
                onChange: C,
                onChangeActive: T,
                onMouseLeave: A,
                onMouseMove: O,
                precision: F = 1,
                readOnly: z = !1,
                size: _ = "medium",
                value: k
            } = a,
            K = (0, r._)(a, U),
            B = (0, u.u)(x),
            [D, X] = (0, c.u)({
                controlled: k,
                default: p,
                name: "Rating"
            }),
            W = N(D, F),
            Y = (0, w.u)(),
            [{
                hover: Q,
                focus: Z
            }, $] = n.useState({
                hover: -1,
                focus: -1
            }),
            ee = W; - 1 !== Q && (ee = Q), -1 !== Z && (ee = Z);
        let {
            isFocusVisibleRef: et,
            onBlur: er,
            onFocus: en,
            ref: ei
        } = (0, P.u)(), [es, ea] = n.useState(!1), eo = n.useRef(), ec = (0, l.u)(ei, eo, s), el = e => {
            let t = "" === e.target.value ? null : parseFloat(e.target.value); - 1 !== Q && (t = Q), X(t), C && C(e, t)
        }, eu = e => {
            0 === e.clientX && 0 === e.clientY || ($({
                hover: -1,
                focus: -1
            }), X(null), C && parseFloat(e.target.value) === W && C(e, null))
        }, ed = e => {
            en(e), !0 === et.current && ea(!0);
            let t = parseFloat(e.target.value);
            $(e => ({
                hover: e.hover,
                focus: t
            }))
        }, ep = e => {
            -1 === Q && (er(e), !1 === et.current && ea(!1), $(e => ({
                hover: e.hover,
                focus: -1
            })))
        }, [ev, eh] = n.useState(!1), ef = (0, t._)({}, a, {
            defaultValue: p,
            disabled: h,
            emptyIcon: f,
            emptyLabelText: m,
            emptyValueFocused: ev,
            focusVisible: es,
            getLabelText: I,
            icon: R,
            IconContainerComponent: g,
            max: S,
            precision: F,
            readOnly: z,
            size: _
        }), em = (e => {
            let {
                classes: t,
                size: n,
                readOnly: s,
                disabled: a,
                emptyValueFocused: o,
                focusVisible: c
            } = e, l = {
                root: ["root", "size".concat((0, r.a)(n)), a && "disabled", c && "focusVisible", s && "readOnly"],
                label: ["label", "pristine"],
                labelEmptyValue: [o && "labelEmptyValueActive"],
                icon: ["icon"],
                iconEmpty: ["iconEmpty"],
                iconFilled: ["iconFilled"],
                iconHover: ["iconHover"],
                iconFocus: ["iconFocus"],
                iconActive: ["iconActive"],
                decimal: ["decimal"],
                visuallyHidden: ["visuallyHidden"]
            };
            return (0, i.a)(l, q, t)
        })(ef);
        return (0, o.jsxs)(V, (0, t._)({
            ref: ec,
            onMouseMove: e => {
                O && O(e);
                let {
                    right: t,
                    left: r,
                    width: n
                } = eo.current.getBoundingClientRect(), i = N(S * (Y ? (t - e.clientX) / n : (e.clientX - r) / n) + F / 2, F);
                i = (0, b.c)(i, F, S), $(e => e.hover === i && e.focus === i ? e : {
                    hover: i,
                    focus: i
                }), ea(!1), T && Q !== i && T(e, i)
            },
            onMouseLeave: e => {
                A && A(e), $({
                    hover: -1,
                    focus: -1
                }), T && -1 !== Q && T(e, -1)
            },
            className: (0, i.c)(em.root, d, z && "MuiRating-readOnly"),
            ownerState: ef,
            role: z ? "img" : null,
            "aria-label": z ? I(ee) : null
        }, K, {
            children: [Array.from(Array(S)).map((e, r) => {
                let n = r + 1,
                    s = {
                        classes: em,
                        disabled: h,
                        emptyIcon: f,
                        focus: Z,
                        getLabelText: I,
                        highlightSelectedOnly: y,
                        hover: Q,
                        icon: R,
                        IconContainerComponent: g,
                        name: B,
                        onBlur: ep,
                        onChange: el,
                        onClick: eu,
                        onFocus: ed,
                        ratingValue: ee,
                        ratingValueRounded: W,
                        readOnly: z,
                        ownerState: ef
                    },
                    a = n === Math.ceil(ee) && (-1 !== Q || -1 !== Z);
                if (F < 1) {
                    let e = Array.from(Array(1 / F));
                    return (0, o.jsx)(J, {
                        className: (0, i.c)(em.decimal, a && em.iconActive),
                        ownerState: ef,
                        iconActive: a,
                        children: e.map((r, i) => {
                            let a = N(n - 1 + (i + 1) * F, F);
                            return (0, o.jsx)(G, (0, t._)({}, s, {
                                isActive: !1,
                                itemValue: a,
                                labelProps: {
                                    style: e.length - 1 === i ? {} : {
                                        width: a === ee ? (i + 1) * F * 100 + "%" : "0%",
                                        overflow: "hidden",
                                        position: "absolute"
                                    }
                                }
                            }), a)
                        })
                    }, n)
                }
                return (0, o.jsx)(G, (0, t._)({}, s, {
                    isActive: a,
                    itemValue: n
                }), n)
            }), !z && !h && (0, o.jsxs)(E, {
                className: (0, i.c)(em.label, em.labelEmptyValue),
                ownerState: ef,
                children: [(0, o.jsx)("input", {
                    className: em.visuallyHidden,
                    value: "",
                    id: "".concat(B, "-empty"),
                    type: "radio",
                    name: B,
                    checked: null == W,
                    onFocus: () => eh(!0),
                    onBlur: () => eh(!1),
                    onChange: el
                }), (0, o.jsx)("span", {
                    className: em.visuallyHidden,
                    children: m
                })]
            })]
        }))
    }), e.s(["RadioGroup", 0, x], 419959)
}]);

//# debugId=51b64454-0696-2b36-909f-142b30a2f773
//# sourceMappingURL=2l-ijsn3xm17a.js.map