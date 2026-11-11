;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "f58e2f08-d280-e39b-a33a-56b6f233c694")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 593430, e => {
    "use strict";
    var t = e.i(415858),
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

    function a(e, t, r, n) {
        return new(r || (r = Promise))(function(a, s) {
            function i(e) {
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
                e.done ? a(e.value) : ((t = e.value) instanceof r ? t : new r(function(e) {
                    e(t)
                })).then(i, o)
            }
            c((n = n.apply(e, t || [])).next())
        })
    }

    function s(e, t) {
        var r, n, a, s = {
                label: 0,
                sent: function() {
                    if (1 & a[0]) throw a[1];
                    return a[1]
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
                var u = [o, c];
                if (r) throw TypeError("Generator is already executing.");
                for (; i && (i = 0, u[0] && (s = 0)), s;) try {
                    if (r = 1, n && (a = 2 & u[0] ? n.return : u[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, u[1])).done) return a;
                    switch (n = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                        case 0:
                        case 1:
                            a = u;
                            break;
                        case 4:
                            return s.label++, {
                                value: u[1],
                                done: !1
                            };
                        case 5:
                            s.label++, n = u[1], u = [0];
                            continue;
                        case 7:
                            u = s.ops.pop(), s.trys.pop();
                            continue;
                        default:
                            if (!(a = (a = s.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                s = 0;
                                continue
                            }
                            if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                s.label = u[1];
                                break
                            }
                            if (6 === u[0] && s.label < a[1]) {
                                s.label = a[1], a = u;
                                break
                            }
                            if (a && s.label < a[2]) {
                                s.label = a[2], s.ops.push(u);
                                break
                            }
                            a[2] && s.ops.pop(), s.trys.pop();
                            continue
                    }
                    u = t.call(e, s)
                } catch (e) {
                    u = [6, e], n = 0
                } finally {
                    r = a = 0
                }
                if (5 & u[0]) throw u[1];
                return {
                    value: u[0] ? u[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function i(e, r) {
        return null == e ? e : {
            placeId: (0, t.u)(e, "placeId") ? e.placeId : void 0
        }
    }

    function o(e, r) {
        return null == e ? e : {
            versionNumber: (0, t.u)(e, "versionNumber") ? e.versionNumber : void 0
        }
    }

    function c(e) {
        if (void 0 !== e) return null === e ? null : {
            creatorType: e.creatorType,
            creatorTargetId: e.creatorTargetId
        }
    }

    function u(e) {
        var r;
        return null == (r = e) ? r : {
            placeId: (0, t.u)(r, "placeId") ? r.placeId : void 0,
            placeName: (0, t.u)(r, "placeName") ? r.placeName : void 0,
            universeName: (0, t.u)(r, "universeName") ? r.universeName : void 0,
            isRootPlace: (0, t.u)(r, "isRootPlace") ? r.isRootPlace : void 0,
            universeId: (0, t.u)(r, "universeId") ? r.universeId : void 0
        }
    }

    function l(e) {
        var r;
        return null == (r = e) ? r : {
            creatorTargetId: (0, t.u)(r, "creatorTargetId") ? r.creatorTargetId : void 0,
            creatorType: (0, t.u)(r, "creatorType") ? r.creatorType : void 0,
            code: (0, t.u)(r, "code") ? r.code : void 0,
            message: (0, t.u)(r, "message") ? r.message : void 0
        }
    }

    function d(e) {
        var r, n;
        return null == (r = e) ? r : {
            id: (0, t.u)(r, "id") ? r.id : void 0,
            name: (0, t.u)(r, "name") ? r.name : void 0,
            description: (0, t.u)(r, "description") ? r.description : void 0,
            isArchived: (0, t.u)(r, "isArchived") ? r.isArchived : void 0,
            rootPlaceId: (0, t.u)(r, "rootPlaceId") ? r.rootPlaceId : void 0,
            privacyType: (0, t.u)(r, "privacyType") ? r.privacyType : void 0,
            creatorType: (0, t.u)(r, "creatorType") ? r.creatorType : void 0,
            creatorTargetId: (0, t.u)(r, "creatorTargetId") ? r.creatorTargetId : void 0,
            creatorName: (0, t.u)(r, "creatorName") ? r.creatorName : void 0,
            created: (0, t.u)(r, "created") ? new Date(r.created) : void 0,
            updated: (0, t.u)(r, "updated") ? new Date(r.updated) : void 0,
            isFriendsOnly: (0, t.u)(r, "isFriendsOnly") ? r.isFriendsOnly : void 0,
            isTeamCreateEnabled: (0, t.u)(r, "isTeamCreateEnabled") ? r.isTeamCreateEnabled : void 0,
            hasPublishedVersion: (0, t.u)(r, "hasPublishedVersion") ? r.hasPublishedVersion : void 0,
            audiences: (0, t.u)(r, "audiences") ? r.audiences : void 0,
            reachStatus: (0, t.u)(r, "reachStatus") ? null == (n = r.reachStatus) ? n : {
                chipStatus: (0, t.u)(n, "chipStatus") ? n.chipStatus : void 0,
                iconName: (0, t.u)(n, "iconName") ? n.iconName : void 0,
                translatedStatus: (0, t.u)(n, "translatedStatus") ? n.translatedStatus : void 0,
                variant: (0, t.u)(n, "variant") ? n.variant : void 0
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
                return a(this, void 0, void 0, function() {
                    var n, a, i;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesAddPlaceToUniverse.");
                                if (null === e.placeId || void 0 === e.placeId) throw new t.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesAddPlaceToUniverse.");
                                return n = {}, a = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/places/{placeId}/add-place".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/universes/{universeId}/places/{placeId}/add-place",
                                    method: "POST",
                                    headers: a,
                                    query: n
                                }, r)];
                            case 1:
                                return i = s.sent(), [2, new t.V(i)]
                        }
                    })
                })
            }, r.prototype.placesAddPlaceToUniverse = function(e, t) {
                return a(this, void 0, void 0, function() {
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
                return a(this, void 0, void 0, function() {
                    var n, a, i;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesClearJoinRestrictionsOverrides.");
                                return n = {}, a = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/clear-join-restrictions-overrides".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/clear-join-restrictions-overrides",
                                    method: "POST",
                                    headers: a,
                                    query: n
                                }, r)];
                            case 1:
                                return i = s.sent(), [2, new t.V(i)]
                        }
                    })
                })
            }, r.prototype.placesClearJoinRestrictionsOverrides = function(e, t) {
                return a(this, void 0, void 0, function() {
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
                return a(this, void 0, void 0, function() {
                    var n, a, o;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesCreatePlaceApiKey.");
                                return n = {}, (a = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/apiKey/universes/{universeId}/places".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/apiKey/universes/{universeId}/places",
                                    method: "POST",
                                    headers: a,
                                    query: n,
                                    body: p(e.placesCreatePlaceApiKeyRequest)
                                }, r)];
                            case 1:
                                return o = s.sent(), [2, new t.H(o, function(e) {
                                    return i(e)
                                })]
                        }
                    })
                })
            }, r.prototype.placesCreatePlaceApiKey = function(e, t) {
                return a(this, void 0, void 0, function() {
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
                return a(this, void 0, void 0, function() {
                    var n, a, i;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new t.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesCreatePlaceFromPlace.");
                                return n = {}, (a = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (a["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                    path: "/v1/places/{placeId}/create".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}/create",
                                    method: "POST",
                                    headers: a,
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
                                return i = s.sent(), [2, new t.H(i, function(e) {
                                    return null == e ? e : {
                                        placeId: (0, t.u)(e, "placeId") ? e.placeId : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.placesCreatePlaceFromPlace = function(e, t) {
                return a(this, void 0, void 0, function() {
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
                return a(this, void 0, void 0, function() {
                    var n, a, o;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesCreatePlaceUserAuth.");
                                return n = {}, (a = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/user/universes/{universeId}/places".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/user/universes/{universeId}/places",
                                    method: "POST",
                                    headers: a,
                                    query: n,
                                    body: p(e.placesCreatePlaceApiKeyRequest)
                                }, r)];
                            case 1:
                                return o = s.sent(), [2, new t.H(o, function(e) {
                                    return i(e)
                                })]
                        }
                    })
                })
            }, r.prototype.placesCreatePlaceUserAuth = function(e, t) {
                return a(this, void 0, void 0, function() {
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
                return a(this, void 0, void 0, function() {
                    var n, a, i;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesCreatePlaceVersionApiKey.");
                                if (null === e.placeId || void 0 === e.placeId) throw new t.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesCreatePlaceVersionApiKey.");
                                return n = {}, void 0 !== e.versionType && (n.versionType = e.versionType), void 0 !== e.isOldVersionAllowed && (n.isOldVersionAllowed = e.isOldVersionAllowed), void 0 !== e.shouldForceRestart && (n.shouldForceRestart = e.shouldForceRestart), a = {}, [4, this.request({
                                    path: "/v1/apiKey/universe/{universeId}/place/{placeId}/version".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/apiKey/universe/{universeId}/place/{placeId}/version",
                                    method: "POST",
                                    headers: a,
                                    query: n
                                }, r)];
                            case 1:
                                return i = s.sent(), [2, new t.H(i, function(e) {
                                    return o(e)
                                })]
                        }
                    })
                })
            }, r.prototype.placesCreatePlaceVersionApiKey = function(e, t) {
                return a(this, void 0, void 0, function() {
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
                return a(this, void 0, void 0, function() {
                    var n, a, i;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesCreatePlaceVersionUserAuth.");
                                if (null === e.placeId || void 0 === e.placeId) throw new t.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesCreatePlaceVersionUserAuth.");
                                return n = {}, void 0 !== e.versionType && (n.versionType = e.versionType), void 0 !== e.isOldVersionAllowed && (n.isOldVersionAllowed = e.isOldVersionAllowed), void 0 !== e.shouldForceRestart && (n.shouldForceRestart = e.shouldForceRestart), a = {}, [4, this.request({
                                    path: "/v1/user/universe/{universeId}/place/{placeId}/version".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/user/universe/{universeId}/place/{placeId}/version",
                                    method: "POST",
                                    headers: a,
                                    query: n
                                }, r)];
                            case 1:
                                return i = s.sent(), [2, new t.H(i, function(e) {
                                    return o(e)
                                })]
                        }
                    })
                })
            }, r.prototype.placesCreatePlaceVersionUserAuth = function(e, t) {
                return a(this, void 0, void 0, function() {
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
                return a(this, void 0, void 0, function() {
                    var n, a, i;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return n = {}, void 0 !== e.groupId && (n.groupId = e.groupId), (a = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/universes/create",
                                    schemaPath: "/v1/universes/create",
                                    method: "POST",
                                    headers: a,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            templatePlaceId: e.templatePlaceId,
                                            isPublish: e.isPublish
                                        }
                                    }(e.placesCreateUniverseRequest)
                                }, r)];
                            case 1:
                                return i = s.sent(), [2, new t.H(i, function(e) {
                                    return null == e ? e : {
                                        universeId: (0, t.u)(e, "universeId") ? e.universeId : void 0,
                                        rootPlaceId: (0, t.u)(e, "rootPlaceId") ? e.rootPlaceId : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.placesCreateUniverse = function() {
                return a(this, arguments, void 0, function(e, t) {
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
                return a(this, void 0, void 0, function() {
                    var n, a, i;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesGetJoinRestrictions.");
                                return n = {}, a = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/join-restrictions".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/join-restrictions",
                                    method: "GET",
                                    headers: a,
                                    query: n
                                }, r)];
                            case 1:
                                return i = s.sent(), [2, new t.H(i, function(e) {
                                    return null == e ? e : {
                                        isSpecificJoinToNonRootPlacesAllowed: (0, t.u)(e, "isSpecificJoinToNonRootPlacesAllowed") ? e.isSpecificJoinToNonRootPlacesAllowed : void 0,
                                        hasPlaceOverrides: (0, t.u)(e, "hasPlaceOverrides") ? e.hasPlaceOverrides : void 0,
                                        placeJoinRestrictionType: (0, t.u)(e, "placeJoinRestrictionType") ? e.placeJoinRestrictionType : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.placesGetJoinRestrictions = function(e, t) {
                return a(this, void 0, void 0, function() {
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
                return a(this, void 0, void 0, function() {
                    var n, a, i;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return n = {}, void 0 !== e.creatorTargetId && (n.creatorTargetId = e.creatorTargetId), void 0 !== e.creatorTargetType && (n.creatorTargetType = e.creatorTargetType), void 0 !== e.creationContext && (n.creationContext = e.creationContext), void 0 !== e.universeId && (n.universeId = e.universeId), void 0 !== e.nextPageToken && (n.nextPageToken = e.nextPageToken), void 0 !== e.maxPageSize && (n.maxPageSize = e.maxPageSize), a = {}, [4, this.request({
                                    path: "/v2/owned-places-by-creation-context",
                                    schemaPath: "/v2/owned-places-by-creation-context",
                                    method: "GET",
                                    headers: a,
                                    query: n
                                }, r)];
                            case 1:
                                return i = s.sent(), [2, new t.H(i, function(e) {
                                    return null == e ? e : {
                                        places: (0, t.u)(e, "places") ? null === e.places ? null : e.places.map(u) : void 0,
                                        nextPageToken: (0, t.u)(e, "nextPageToken") ? e.nextPageToken : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.placesGetOwnedPlacesByCreationContext = function() {
                return a(this, arguments, void 0, function(e, t) {
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
                return a(this, void 0, void 0, function() {
                    var n, a, i;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new t.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesGetPlaceJoinRestrictions.");
                                return n = {}, a = {}, [4, this.request({
                                    path: "/v1/places/{placeId}/join-restrictions".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}/join-restrictions",
                                    method: "GET",
                                    headers: a,
                                    query: n
                                }, r)];
                            case 1:
                                return i = s.sent(), [2, new t.H(i, function(e) {
                                    return null == e ? e : {
                                        isSpecificJoinToNonRootPlacesAllowed: (0, t.u)(e, "isSpecificJoinToNonRootPlacesAllowed") ? e.isSpecificJoinToNonRootPlacesAllowed : void 0,
                                        hasPlaceOverride: (0, t.u)(e, "hasPlaceOverride") ? e.hasPlaceOverride : void 0,
                                        placeJoinRestrictionType: (0, t.u)(e, "placeJoinRestrictionType") ? e.placeJoinRestrictionType : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.placesGetPlaceJoinRestrictions = function(e, t) {
                return a(this, void 0, void 0, function() {
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
                return a(this, void 0, void 0, function() {
                    var n, a, i;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new t.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesGetPlacePublishStatus.");
                                return n = {}, a = {}, [4, this.request({
                                    path: "/v1/places/{placeId}/publish-status".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}/publish-status",
                                    method: "GET",
                                    headers: a,
                                    query: n
                                }, r)];
                            case 1:
                                return i = s.sent(), [2, new t.H(i, function(e) {
                                    return null == e ? e : {
                                        hasPublishedVersion: (0, t.u)(e, "hasPublishedVersion") ? e.hasPublishedVersion : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.placesGetPlacePublishStatus = function(e, t) {
                return a(this, void 0, void 0, function() {
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
                return a(this, void 0, void 0, function() {
                    var n, a, i;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesGetPrivatePlaytesterStatus.");
                                return n = {}, a = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/is-private-playtester".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/is-private-playtester",
                                    method: "GET",
                                    headers: a,
                                    query: n
                                }, r)];
                            case 1:
                                return i = s.sent(), [2, new t.H(i, function(e) {
                                    return null == e ? e : {
                                        isPlaytester: (0, t.u)(e, "isPlaytester") ? e.isPlaytester : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.placesGetPrivatePlaytesterStatus = function(e, t) {
                return a(this, void 0, void 0, function() {
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
                return a(this, void 0, void 0, function() {
                    var n, a, i;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new t.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesGetUniverseContainingPlace.");
                                return n = {}, a = {}, [4, this.request({
                                    path: "/v1/places/{placeId}/universe".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}/universe",
                                    method: "GET",
                                    headers: a,
                                    query: n
                                }, r)];
                            case 1:
                                return i = s.sent(), [2, new t.H(i, function(e) {
                                    return null == e ? e : {
                                        universeId: (0, t.u)(e, "universeId") ? e.universeId : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.placesGetUniverseContainingPlace = function(e, t) {
                return a(this, void 0, void 0, function() {
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
                return a(this, void 0, void 0, function() {
                    var n, a, i;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesMigrateUniverse.");
                                return n = {}, a = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/migrate-universe".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/migrate-universe",
                                    method: "POST",
                                    headers: a,
                                    query: n
                                }, r)];
                            case 1:
                                return i = s.sent(), [2, new t.V(i)]
                        }
                    })
                })
            }, r.prototype.placesMigrateUniverse = function(e, t) {
                return a(this, void 0, void 0, function() {
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
                return a(this, void 0, void 0, function() {
                    var n, a, i;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new t.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesPublishLatestSavedPlaceVersion.");
                                return n = {}, a = {}, [4, this.request({
                                    path: "/v1/places/{placeId}/publish-latest".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}/publish-latest",
                                    method: "POST",
                                    headers: a,
                                    query: n
                                }, r)];
                            case 1:
                                return i = s.sent(), [2, new t.H(i, function(e) {
                                    return null == e ? e : {
                                        versionNumber: (0, t.u)(e, "versionNumber") ? e.versionNumber : void 0,
                                        operationId: (0, t.u)(e, "operationId") ? e.operationId : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.placesPublishLatestSavedPlaceVersion = function(e, t) {
                return a(this, void 0, void 0, function() {
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
                return a(this, void 0, void 0, function() {
                    var n, a, i;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesRemovePlaceFromUniverse.");
                                if (null === e.placeId || void 0 === e.placeId) throw new t.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesRemovePlaceFromUniverse.");
                                return n = {}, a = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/places/{placeId}/remove-place".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/universes/{universeId}/places/{placeId}/remove-place",
                                    method: "POST",
                                    headers: a,
                                    query: n
                                }, r)];
                            case 1:
                                return i = s.sent(), [2, new t.V(i)]
                        }
                    })
                })
            }, r.prototype.placesRemovePlaceFromUniverse = function(e, t) {
                return a(this, void 0, void 0, function() {
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
                return a(this, void 0, void 0, function() {
                    var n, a, i;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new t.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesRollbackPlace.");
                                return n = {}, (a = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/places/{placeId}/rollback".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}/rollback",
                                    method: "POST",
                                    headers: a,
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
                                return i = s.sent(), [2, new t.H(i, function(e) {
                                    return null == e ? e : {
                                        newVersionNumber: (0, t.u)(e, "newVersionNumber") ? e.newVersionNumber : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.placesRollbackPlace = function(e, t) {
                return a(this, void 0, void 0, function() {
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
                return a(this, void 0, void 0, function() {
                    var n, a, i;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling placesUpdateJoinRestrictions.");
                                return n = {}, (a = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/universes/{universeId}/set-join-restrictions".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/set-join-restrictions",
                                    method: "POST",
                                    headers: a,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            isSpecificJoinToNonRootPlacesAllowed: e.isSpecificJoinToNonRootPlacesAllowed,
                                            placeJoinRestrictionType: e.placeJoinRestrictionType
                                        }
                                    }(e.placesUpdateJoinRestrictionsRequest)
                                }, r)];
                            case 1:
                                return i = s.sent(), [2, new t.V(i)]
                        }
                    })
                })
            }, r.prototype.placesUpdateJoinRestrictions = function(e, t) {
                return a(this, void 0, void 0, function() {
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
                return a(this, void 0, void 0, function() {
                    var n, a, i;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new t.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling placesUpdatePlaceJoinRestrictions.");
                                return n = {}, (a = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/places/{placeId}/set-join-restrictions".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}/set-join-restrictions",
                                    method: "POST",
                                    headers: a,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            isSpecificJoinToNonRootPlacesAllowed: e.isSpecificJoinToNonRootPlacesAllowed,
                                            placeJoinRestrictionType: e.placeJoinRestrictionType
                                        }
                                    }(e.placesUpdatePlaceJoinRestrictionsRequest)
                                }, r)];
                            case 1:
                                return i = s.sent(), [2, new t.V(i)]
                        }
                    })
                })
            }, r.prototype.placesUpdatePlaceJoinRestrictions = function(e, t) {
                return a(this, void 0, void 0, function() {
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
        }(t._),
        h = function(e) {
            function r() {
                return null !== e && e.apply(this, arguments) || this
            }
            return n(r, e), r.prototype.searchSearchUniversesRaw = function(e, r) {
                return a(this, void 0, void 0, function() {
                    var n, a, i;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return n = {}, void 0 !== e.creatorType && (n.CreatorType = e.creatorType), void 0 !== e.creatorTargetId && (n.CreatorTargetId = e.creatorTargetId), void 0 !== e.surface && (n.Surface = e.surface), void 0 !== e.pageIndex && (n.PageIndex = e.pageIndex), void 0 !== e.pageSize && (n.PageSize = e.pageSize), void 0 !== e.search && (n.Search = e.search), void 0 !== e.isArchived && (n.IsArchived = e.isArchived), void 0 !== e.isPublic && (n.IsPublic = e.isPublic), void 0 !== e.isShared && (n.IsShared = e.isShared), void 0 !== e.isTeamCreateEnabled && (n.IsTeamCreateEnabled = e.isTeamCreateEnabled), void 0 !== e.sortParam && (n.SortParam = e.sortParam), void 0 !== e.sortOrder && (n.SortOrder = e.sortOrder), void 0 !== e.needsAssetOptions && (n.NeedsAssetOptions = e.needsAssetOptions), void 0 !== e.needsHasPublishedVersion && (n.NeedsHasPublishedVersion = e.needsHasPublishedVersion), void 0 !== e.needsReachStatus && (n.NeedsReachStatus = e.needsReachStatus), a = {}, [4, this.request({
                                    path: "/v1/search",
                                    schemaPath: "/v1/search",
                                    method: "GET",
                                    headers: a,
                                    query: n
                                }, r)];
                            case 1:
                                return i = s.sent(), [2, new t.H(i, function(e) {
                                    return null == e ? e : {
                                        data: (0, t.u)(e, "data") ? null === e.data ? null : e.data.map(d) : void 0,
                                        totalResults: (0, t.u)(e, "totalResults") ? e.totalResults : void 0,
                                        totalHits: (0, t.u)(e, "totalHits") ? e.totalHits : void 0,
                                        nextResultIndex: (0, t.u)(e, "nextResultIndex") ? e.nextResultIndex : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.searchSearchUniverses = function() {
                return a(this, arguments, void 0, function(e, t) {
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
                return a(this, void 0, void 0, function() {
                    var n, a, i;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return n = {}, (a = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/search",
                                    schemaPath: "/v1/search",
                                    method: "POST",
                                    headers: a,
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
                                return i = s.sent(), [2, new t.H(i, function(e) {
                                    return null == e ? e : {
                                        data: (0, t.u)(e, "data") ? null === e.data ? null : e.data.map(d) : void 0,
                                        nextCursor: (0, t.u)(e, "nextCursor") ? e.nextCursor : void 0,
                                        warnings: (0, t.u)(e, "warnings") ? null === e.warnings ? null : e.warnings.map(l) : void 0,
                                        totalResults: (0, t.u)(e, "totalResults") ? e.totalResults : void 0,
                                        totalHits: (0, t.u)(e, "totalHits") ? e.totalHits : void 0,
                                        nextResultIndex: (0, t.u)(e, "nextResultIndex") ? e.nextResultIndex : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.searchSearchUniversesPost = function() {
                return a(this, arguments, void 0, function(e, t) {
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
        }(t._);
    e.s(["x", 0, v, "y", 0, h, "W", 0, {
        User: "User",
        Group: "Group",
        Team: "Team"
    }, "V", 0, {
        GameCreated: "GameCreated",
        GameName: "GameName",
        LastUpdated: "LastUpdated"
    }, "f", 0, {
        Asc: "Asc",
        Desc: "Desc"
    }, "j", 0, {
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
}, 117236, e => {
    "use strict";
    var t = e.i(336288),
        r = e.i(593430),
        n = e.i(482979),
        a = e.i(913893),
        s = e.i(671376),
        i = e.i(475360),
        o = e.i(927868),
        c = e.i(949599),
        u = e.i(814768);
    let l = new Set([s.f.MyExperiences, s.f.SharedExperiences, s.f.Audio, s.f.Decal, s.f.MeshPart, s.f.Video]),
        d = new Set([s.f.MyExperiences, s.f.SharedExperiences, s.f.Audio, s.f.Decal, s.f.Image, s.f.MeshPart, s.f.Video, s.f.Hat, s.f.HairAccessory, s.f.FaceAccessory, s.f.NeckAccessory, s.f.ShoulderAccessory, s.f.FrontAccessory, s.f.BackAccessory, s.f.WaistAccessory, s.f.Shirt, s.f.TShirt, s.f.Pants, s.f.TShirtAccessory, s.f.DressSkirtAccessory, s.f.JacketAccessory, s.f.PantsAccessory, s.f.ShirtAccessory, s.f.ShortsAccessory, s.f.SweaterAccessory, s.f.EmoteAnimation, s.f.EyebrowAccessory, s.f.EyelashAccessory, s.f.FaceMakeup, s.f.LipMakeup, s.f.EyeMakeup, s.f.AvatarBackground]),
        p = new Set([s.f.MyExperiences, s.f.SharedExperiences, s.f.UpcomingEvent, s.f.PastEvent, s.f.DraftEvent]),
        v = new Set([s.f.TShirt, s.f.Shirt, s.f.Pants, s.f.Hat, s.f.HairAccessory, s.f.FaceAccessory, s.f.NeckAccessory, s.f.ShoulderAccessory, s.f.FrontAccessory, s.f.BackAccessory, s.f.WaistAccessory, s.f.TShirtAccessory, s.f.ShirtAccessory, s.f.PantsAccessory, s.f.JacketAccessory, s.f.SweaterAccessory, s.f.ShortsAccessory, s.f.DressSkirtAccessory]),
        h = new Set([c.i.Body, c.i.DynamicHead, c.i.Shoes]),
        f = new Set,
        y = new Set;

    function w() {
        return {
            assetTypes: new Set(v),
            bundleTypes: new Set(h)
        }
    }
    let I = new Set,
        m = new Set,
        P = null,
        b = null;
    async function R(e, r, n) {
        try {
            var i, l;
            let d = await a.f.getAllowedAssetTypes(e, [t.d.NUMBER_0, t.d.NUMBER_1]);
            return null == (i = d.allowedAssetTypes) || i.forEach(e => {
                let t = e;
                "Tshirt" === t ? t = "TShirt" : "TshirtAccessory" === t && (t = "TShirtAccessory"), (0, o.s)(s.f, t) && r.add(t)
            }), null == (l = d.allowedBundleTypes) || l.forEach(e => {
                let t = (0, u.f)(e);
                t !== c.i.Unknown && n.add(t)
            }), {
                assetTypes: r,
                bundleTypes: n
            }
        } catch (e) {
            return w()
        }
    }
    async function S() {
        return f.size > 0 ? {
            assetTypes: f,
            bundleTypes: y
        } : (null != P || (P = R(t.j.NUMBER_2, f, y).finally(() => {
            P = null
        })), P)
    }
    async function T() {
        return I.size > 0 ? {
            assetTypes: I,
            bundleTypes: m
        } : (null != b || (b = R(t.j.NUMBER_1, I, m).finally(() => {
            b = null
        })), b)
    }
    async function g() {
        let [e, t] = await Promise.all([S(), T()]), r = new Set(e.assetTypes);
        return t.assetTypes.has(s.f.AvatarBackground) && r.add(s.f.AvatarBackground), r
    }
    let A = new Set([]),
        C = {
            [r.V.GameCreated]: "Label.DateOfCreation",
            [r.V.GameName]: "Label.Alphabetical",
            [r.V.LastUpdated]: "Label.LastUpdatedDate"
        },
        q = {
            [n.W.CreatedUtc]: "Label.DateOfCreation",
            [n.W.StartUtc]: "Label.StartDate"
        },
        U = [{
            type: s.f.Place,
            nameKey: "Label.Experiences",
            submenuItems: [{
                type: s.f.MyExperiences,
                nameKey: "Label.MyExperiences"
            }, {
                type: s.f.SharedExperiences,
                nameKey: "Label.SharedExperiences"
            }]
        }, {
            type: s.f.ShareLink,
            nameKey: "Label.ShareLinks"
        }, {
            type: s.f.TShirt,
            nameKey: "Label.AvatarItems",
            submenuItems: [{
                type: s.f.AvatarLooks,
                nameKey: "Label.Avatars"
            }, {
                type: s.f.AvatarBackground,
                nameKey: "Label.Backgrounds"
            }, {
                type: s.f.HairAccessory,
                nameKey: "Label.Bodies",
                itemType: i.f.Bundle
            }, {
                type: s.f.EyeMakeup,
                nameKey: "Label.Makeup"
            }, {
                type: s.f.TShirtAccessory,
                nameKey: "Label.Clothing"
            }, {
                type: s.f.Hat,
                nameKey: "Label.Accessories"
            }, {
                type: s.f.TShirt,
                nameKey: "Label.Classics"
            }, {
                type: s.f.EmoteAnimation,
                nameKey: "Label.Animations"
            }, {
                type: s.f.Showcase,
                nameKey: "Label.Showcases"
            }, {
                type: s.f.AllCatalogAsset,
                nameKey: "Label.AllAssetTypes"
            }]
        }, {
            type: s.f.Decal,
            nameKey: "Label.DevelopmentItems",
            submenuItems: [{
                type: s.f.Model,
                nameKey: "Label.ModelsAndPackages"
            }, {
                type: s.f.Plugin,
                nameKey: "Label.Plugins"
            }, {
                type: s.f.Audio,
                nameKey: "Label.Audios"
            }, {
                type: s.f.Decal,
                nameKey: "Label.Decals"
            }, {
                type: s.f.Image,
                nameKey: "Label.Images"
            }, {
                type: s.f.Video,
                nameKey: "Label.Videos"
            }, {
                type: s.f.Mesh,
                nameKey: "Label.Meshes"
            }, {
                type: s.f.MeshPart,
                nameKey: "Label.MeshParts"
            }, {
                type: s.f.Animation,
                nameKey: "Label.Animations"
            }, {
                type: s.f.TextDocument,
                nameKey: "Label.Text"
            }]
        }, {
            type: s.f.Moments,
            nameKey: "Label.Moments"
        }, {
            type: s.f.AssetPermissionRequests,
            nameKey: "Label.Requests"
        }];
    e.s(["w", 0, d, "t", 0, l, "l", 0, p, "H", 0, A, "U", 0, U, "Q", 0, f, "x", 0, y, "R", 0, q, "V", 0, S, "X", 0, g, "u", 0, w, "I", 0, T, "s", 0, C])
}]);

//# debugId=f58e2f08-d280-e39b-a33a-56b6f233c694
//# sourceMappingURL=19ihuk-vf1-it.js.map