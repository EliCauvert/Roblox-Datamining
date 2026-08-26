;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "da184f07-12f2-62e7-6d1f-4078c6bb16f8")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 620140, e => {
    "use strict";
    var t = e.i(677753),
        n = function(e, t) {
            return (n = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
            })(e, t)
        };

    function r(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function r() {
            this.constructor = e
        }
        n(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
    }

    function s(e, t, n, r) {
        return new(n || (n = Promise))(function(s, a) {
            function i(e) {
                try {
                    u(r.next(e))
                } catch (e) {
                    a(e)
                }
            }

            function o(e) {
                try {
                    u(r.throw(e))
                } catch (e) {
                    a(e)
                }
            }

            function u(e) {
                var t;
                e.done ? s(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(i, o)
            }
            u((r = r.apply(e, t || [])).next())
        })
    }

    function a(e, t) {
        var n, r, s, a = {
                label: 0,
                sent: function() {
                    if (1 & s[0]) throw s[1];
                    return s[1]
                },
                trys: [],
                ops: []
            },
            i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return i.next = o(0), i.throw = o(1), i.return = o(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
            return this
        }), i;

        function o(o) {
            return function(u) {
                var l = [o, u];
                if (n) throw TypeError("Generator is already executing.");
                for (; i && (i = 0, l[0] && (a = 0)), a;) try {
                    if (n = 1, r && (s = 2 & l[0] ? r.return : l[0] ? r.throw || ((s = r.return) && s.call(r), 0) : r.next) && !(s = s.call(r, l[1])).done) return s;
                    switch (r = 0, s && (l = [2 & l[0], s.value]), l[0]) {
                        case 0:
                        case 1:
                            s = l;
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
                            if (!(s = (s = a.trys).length > 0 && s[s.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                a = 0;
                                continue
                            }
                            if (3 === l[0] && (!s || l[1] > s[0] && l[1] < s[3])) {
                                a.label = l[1];
                                break
                            }
                            if (6 === l[0] && a.label < s[1]) {
                                a.label = s[1], s = l;
                                break
                            }
                            if (s && a.label < s[2]) {
                                a.label = s[2], a.ops.push(l);
                                break
                            }
                            s[2] && a.ops.pop(), a.trys.pop();
                            continue
                    }
                    l = t.call(e, a)
                } catch (e) {
                    l = [6, e], r = 0
                } finally {
                    n = s = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function i(e) {
        var n;
        return null == (n = e) ? n : {
            targetId: (0, t.exists)(n, "targetId") ? n.targetId : void 0,
            state: (0, t.exists)(n, "state") ? n.state : void 0,
            imageUrl: (0, t.exists)(n, "imageUrl") ? n.imageUrl : void 0,
            version: (0, t.exists)(n, "version") ? n.version : void 0
        }
    }

    function o(e) {
        var n, r;
        return null == (n = e) ? n : {
            universeId: (0, t.exists)(n, "universeId") ? n.universeId : void 0,
            error: (0, t.exists)(n, "error") ? null == (r = n.error) ? r : {
                code: (0, t.exists)(r, "code") ? r.code : void 0,
                message: (0, t.exists)(r, "message") ? r.message : void 0,
                userFacingMessage: (0, t.exists)(r, "userFacingMessage") ? r.userFacingMessage : void 0,
                field: (0, t.exists)(r, "field") ? r.field : void 0,
                fieldData: (0, t.exists)(r, "fieldData") ? r.fieldData : void 0
            } : void 0,
            thumbnails: (0, t.exists)(n, "thumbnails") ? n.thumbnails.map(i) : void 0
        }
    }

    function u(e) {
        if (void 0 !== e) return null === e ? null : {
            requestId: e.requestId,
            targetId: e.targetId,
            token: e.token,
            alias: e.alias,
            type: e.type,
            size: e.size,
            format: e.format,
            isCircular: e.isCircular,
            accessContext: e.accessContext,
            headShape: e.headShape
        }
    }

    function l(e) {
        var n;
        return null == (n = e) ? n : {
            requestId: (0, t.exists)(n, "requestId") ? n.requestId : void 0,
            errorCode: (0, t.exists)(n, "errorCode") ? n.errorCode : void 0,
            errorMessage: (0, t.exists)(n, "errorMessage") ? n.errorMessage : void 0,
            targetId: (0, t.exists)(n, "targetId") ? n.targetId : void 0,
            state: (0, t.exists)(n, "state") ? n.state : void 0,
            imageUrl: (0, t.exists)(n, "imageUrl") ? n.imageUrl : void 0,
            version: (0, t.exists)(n, "version") ? n.version : void 0
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function c(e, n) {
        return null == e ? e : {
            data: (0, t.exists)(e, "data") ? e.data.map(i) : void 0
        }
    }
    var d = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(n, e), n.prototype.v1AssetThumbnailAnimatedGetRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var r, s, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetThumbnailAnimatedGet.");
                                return r = {}, void 0 !== e.assetId && (r.assetId = e.assetId), s = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (s["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                    path: "/v1/asset-thumbnail-animated",
                                    method: "GET",
                                    headers: s,
                                    query: r
                                }, n)];
                            case 1:
                                return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return i(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1AssetThumbnailAnimatedGet = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1AssetThumbnailAnimatedGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.v1AssetsGetRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var r, s, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetIds || void 0 === e.assetIds) throw new t.RequiredError("assetIds", "Required parameter requestParameters.assetIds was null or undefined when calling v1AssetsGet.");
                                return r = {}, e.assetIds && (r.assetIds = e.assetIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.returnPolicy && (r.returnPolicy = e.returnPolicy), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), s = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (s["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                    path: "/v1/assets",
                                    method: "GET",
                                    headers: s,
                                    query: r
                                }, n)];
                            case 1:
                                return i = a.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1AssetsGet = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1AssetsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.v1AssetsThumbnail3dGetRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var r, s, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsThumbnail3dGet.");
                                return r = {}, void 0 !== e.assetId && (r.assetId = e.assetId), void 0 !== e.useGltf && (r.useGltf = e.useGltf), s = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (s["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                    path: "/v1/assets-thumbnail-3d",
                                    method: "GET",
                                    headers: s,
                                    query: r
                                }, n)];
                            case 1:
                                return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return i(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1AssetsThumbnail3dGet = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1AssetsThumbnail3dGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t.BaseAPI),
        v = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(n, e), n.prototype.v1UsersAvatar3dGetRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var r, s, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new t.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersAvatar3dGet.");
                                return r = {}, void 0 !== e.userId && (r.userId = e.userId), s = {}, [4, this.request({
                                    path: "/v1/users/avatar-3d",
                                    method: "GET",
                                    headers: s,
                                    query: r
                                }, n)];
                            case 1:
                                return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return i(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1UsersAvatar3dGet = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UsersAvatar3dGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.v1UsersAvatarBustGetRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var r, s, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.userIds || void 0 === e.userIds) throw new t.RequiredError("userIds", "Required parameter requestParameters.userIds was null or undefined when calling v1UsersAvatarBustGet.");
                                return r = {}, e.userIds && (r.userIds = e.userIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), s = {}, [4, this.request({
                                    path: "/v1/users/avatar-bust",
                                    method: "GET",
                                    headers: s,
                                    query: r
                                }, n)];
                            case 1:
                                return i = a.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1UsersAvatarBustGet = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UsersAvatarBustGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.v1UsersAvatarGetRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var r, s, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.userIds || void 0 === e.userIds) throw new t.RequiredError("userIds", "Required parameter requestParameters.userIds was null or undefined when calling v1UsersAvatarGet.");
                                return r = {}, e.userIds && (r.userIds = e.userIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), s = {}, [4, this.request({
                                    path: "/v1/users/avatar",
                                    method: "GET",
                                    headers: s,
                                    query: r
                                }, n)];
                            case 1:
                                return i = a.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1UsersAvatarGet = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UsersAvatarGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.v1UsersAvatarHeadshotGetRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var r, s, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.userIds || void 0 === e.userIds) throw new t.RequiredError("userIds", "Required parameter requestParameters.userIds was null or undefined when calling v1UsersAvatarHeadshotGet.");
                                return r = {}, e.userIds && (r.userIds = e.userIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), s = {}, [4, this.request({
                                    path: "/v1/users/avatar-headshot",
                                    method: "GET",
                                    headers: s,
                                    query: r
                                }, n)];
                            case 1:
                                return i = a.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1UsersAvatarHeadshotGet = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UsersAvatarHeadshotGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t.BaseAPI),
        h = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(n, e), n.prototype.v1BadgesIconsGetRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var r, s, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.badgeIds || void 0 === e.badgeIds) throw new t.RequiredError("badgeIds", "Required parameter requestParameters.badgeIds was null or undefined when calling v1BadgesIconsGet.");
                                return r = {}, e.badgeIds && (r.badgeIds = e.badgeIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), s = {}, [4, this.request({
                                    path: "/v1/badges/icons",
                                    method: "GET",
                                    headers: s,
                                    query: r
                                }, n)];
                            case 1:
                                return i = a.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1BadgesIconsGet = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1BadgesIconsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t.BaseAPI),
        m = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(n, e), n.prototype.v1BatchPostRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var r, s, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.requests || void 0 === e.requests) throw new t.RequiredError("requests", "Required parameter requestParameters.requests was null or undefined when calling v1BatchPost.");
                                return r = {}, (s = {})["Content-Type"] = "application/json", void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (s["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                    path: "/v1/batch",
                                    method: "POST",
                                    headers: s,
                                    query: r,
                                    body: e.requests.map(u)
                                }, n)];
                            case 1:
                                return i = a.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        data: (0, t.exists)(e, "data") ? e.data.map(l) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.v1BatchPost = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1BatchPostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t.BaseAPI),
        f = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(n, e), n.prototype.v1BundlesThumbnailsGetRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var r, s, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.bundleIds || void 0 === e.bundleIds) throw new t.RequiredError("bundleIds", "Required parameter requestParameters.bundleIds was null or undefined when calling v1BundlesThumbnailsGet.");
                                return r = {}, e.bundleIds && (r.bundleIds = e.bundleIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), s = {}, [4, this.request({
                                    path: "/v1/bundles/thumbnails",
                                    method: "GET",
                                    headers: s,
                                    query: r
                                }, n)];
                            case 1:
                                return i = a.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1BundlesThumbnailsGet = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1BundlesThumbnailsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t.BaseAPI),
        p = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(n, e), n.prototype.v1DeveloperProductsIconsGetRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var r, s, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.developerProductIds || void 0 === e.developerProductIds) throw new t.RequiredError("developerProductIds", "Required parameter requestParameters.developerProductIds was null or undefined when calling v1DeveloperProductsIconsGet.");
                                return r = {}, e.developerProductIds && (r.developerProductIds = e.developerProductIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), s = {}, [4, this.request({
                                    path: "/v1/developer-products/icons",
                                    method: "GET",
                                    headers: s,
                                    query: r
                                }, n)];
                            case 1:
                                return i = a.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1DeveloperProductsIconsGet = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1DeveloperProductsIconsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t.BaseAPI),
        b = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(n, e), n.prototype.v1GamePassesGetRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var r, s, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.gamePassIds || void 0 === e.gamePassIds) throw new t.RequiredError("gamePassIds", "Required parameter requestParameters.gamePassIds was null or undefined when calling v1GamePassesGet.");
                                return r = {}, e.gamePassIds && (r.gamePassIds = e.gamePassIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), s = {}, [4, this.request({
                                    path: "/v1/game-passes",
                                    method: "GET",
                                    headers: s,
                                    query: r
                                }, n)];
                            case 1:
                                return i = a.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1GamePassesGet = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1GamePassesGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t.BaseAPI),
        g = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(n, e), n.prototype.v1GamesIconsGetRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var r, s, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.universeIds || void 0 === e.universeIds) throw new t.RequiredError("universeIds", "Required parameter requestParameters.universeIds was null or undefined when calling v1GamesIconsGet.");
                                return r = {}, e.universeIds && (r.universeIds = e.universeIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.returnPolicy && (r.returnPolicy = e.returnPolicy), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), s = {}, [4, this.request({
                                    path: "/v1/games/icons",
                                    method: "GET",
                                    headers: s,
                                    query: r
                                }, n)];
                            case 1:
                                return i = a.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1GamesIconsGet = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1GamesIconsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.v1GamesMultigetThumbnailsGetRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var r, s, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.universeIds || void 0 === e.universeIds) throw new t.RequiredError("universeIds", "Required parameter requestParameters.universeIds was null or undefined when calling v1GamesMultigetThumbnailsGet.");
                                return r = {}, e.universeIds && (r.universeIds = e.universeIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.countPerUniverse && (r.countPerUniverse = e.countPerUniverse), void 0 !== e.defaults && (r.defaults = e.defaults), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), s = {}, [4, this.request({
                                    path: "/v1/games/multiget/thumbnails",
                                    method: "GET",
                                    headers: s,
                                    query: r
                                }, n)];
                            case 1:
                                return i = a.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        data: (0, t.exists)(e, "data") ? e.data.map(o) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.v1GamesMultigetThumbnailsGet = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1GamesMultigetThumbnailsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.v1GamesUniverseIdThumbnailsGetRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var r, s, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1GamesUniverseIdThumbnailsGet.");
                                if (null === e.thumbnailIds || void 0 === e.thumbnailIds) throw new t.RequiredError("thumbnailIds", "Required parameter requestParameters.thumbnailIds was null or undefined when calling v1GamesUniverseIdThumbnailsGet.");
                                return r = {}, e.thumbnailIds && (r.thumbnailIds = e.thumbnailIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), s = {}, [4, this.request({
                                    path: "/v1/games/{universeId}/thumbnails".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    method: "GET",
                                    headers: s,
                                    query: r
                                }, n)];
                            case 1:
                                return i = a.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1GamesUniverseIdThumbnailsGet = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1GamesUniverseIdThumbnailsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t.BaseAPI),
        I = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(n, e), n.prototype.v1GroupsIconsGetRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var r, s, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.groupIds || void 0 === e.groupIds) throw new t.RequiredError("groupIds", "Required parameter requestParameters.groupIds was null or undefined when calling v1GroupsIconsGet.");
                                return r = {}, e.groupIds && (r.groupIds = e.groupIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), s = {}, [4, this.request({
                                    path: "/v1/groups/icons",
                                    method: "GET",
                                    headers: s,
                                    query: r
                                }, n)];
                            case 1:
                                return i = a.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1GroupsIconsGet = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1GroupsIconsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t.BaseAPI),
        w = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(n, e), n.prototype.v1UsersOutfit3dGetRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var r, s, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.outfitId || void 0 === e.outfitId) throw new t.RequiredError("outfitId", "Required parameter requestParameters.outfitId was null or undefined when calling v1UsersOutfit3dGet.");
                                return r = {}, void 0 !== e.outfitId && (r.outfitId = e.outfitId), s = {}, [4, this.request({
                                    path: "/v1/users/outfit-3d",
                                    method: "GET",
                                    headers: s,
                                    query: r
                                }, n)];
                            case 1:
                                return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return i(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1UsersOutfit3dGet = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UsersOutfit3dGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.v1UsersOutfitsGetRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var r, s, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.userOutfitIds || void 0 === e.userOutfitIds) throw new t.RequiredError("userOutfitIds", "Required parameter requestParameters.userOutfitIds was null or undefined when calling v1UsersOutfitsGet.");
                                return r = {}, e.userOutfitIds && (r.userOutfitIds = e.userOutfitIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), s = {}, [4, this.request({
                                    path: "/v1/users/outfits",
                                    method: "GET",
                                    headers: s,
                                    query: r
                                }, n)];
                            case 1:
                                return i = a.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1UsersOutfitsGet = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UsersOutfitsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t.BaseAPI),
        x = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return r(n, e), n.prototype.v1PlacesGameiconsGetRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var r, s, i;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.placeIds || void 0 === e.placeIds) throw new t.RequiredError("placeIds", "Required parameter requestParameters.placeIds was null or undefined when calling v1PlacesGameiconsGet.");
                                return r = {}, e.placeIds && (r.placeIds = e.placeIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.returnPolicy && (r.returnPolicy = e.returnPolicy), void 0 !== e.size && (r.size = e.size), void 0 !== e.format && (r.format = e.format), void 0 !== e.isCircular && (r.isCircular = e.isCircular), s = {}, [4, this.request({
                                    path: "/v1/places/gameicons",
                                    method: "GET",
                                    headers: s,
                                    query: r
                                }, n)];
                            case 1:
                                return i = a.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, n.prototype.v1PlacesGameiconsGet = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return a(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1PlacesGameiconsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t.BaseAPI);
    e.s(["AssetsApi", 0, d, "AvatarApi", 0, v, "BadgesApi", 0, h, "BatchApi", 0, m, "BundlesApi", 0, f, "DeveloperProductsApi", 0, p, "GamePassesApi", 0, b, "GamesApi", 0, g, "GroupEmblemApi", 0, I, "OutfitsApi", 0, w, "PlacesApi", 0, x, "RobloxThumbnailsApisModelsThumbnailBatchRequestTypeEnum", 0, {
        Avatar: "Avatar",
        AvatarHeadShot: "AvatarHeadShot",
        GameIcon: "GameIcon",
        BadgeIcon: "BadgeIcon",
        GameThumbnail: "GameThumbnail",
        GamePass: "GamePass",
        Asset: "Asset",
        BundleThumbnail: "BundleThumbnail",
        Outfit: "Outfit",
        GroupIcon: "GroupIcon",
        DeveloperProduct: "DeveloperProduct",
        AvatarBust: "AvatarBust",
        AutoGeneratedAsset: "AutoGeneratedAsset",
        PlaceIcon: "PlaceIcon",
        AutoGeneratedGameIcon: "AutoGeneratedGameIcon",
        ForceAutoGeneratedGameIcon: "ForceAutoGeneratedGameIcon",
        Look: "Look",
        CreatorContextAsset: "CreatorContextAsset",
        Screenshot: "Screenshot"
    }, "RobloxWebResponsesThumbnailsThumbnailResponseStateEnum", 0, {
        Error: "Error",
        Completed: "Completed",
        InReview: "InReview",
        Pending: "Pending",
        Blocked: "Blocked",
        TemporarilyUnavailable: "TemporarilyUnavailable"
    }, "V1AssetsGetFormatEnum", 0, {
        Png: "Png",
        Jpeg: "Jpeg",
        Webp: "Webp"
    }, "V1AssetsGetIsCircularEnum", 0, {
        True: !0,
        False: !1
    }, "V1AssetsGetReturnPolicyEnum", 0, {
        PlaceHolder: "PlaceHolder",
        ForcePlaceHolder: "ForcePlaceHolder",
        AutoGenerated: "AutoGenerated",
        ForceAutoGenerated: "ForceAutoGenerated"
    }, "V1AssetsGetSizeEnum", 0, {
        _30x30: "30x30",
        _42x42: "42x42",
        _50x50: "50x50",
        _60x62: "60x62",
        _75x75: "75x75",
        _110x110: "110x110",
        _140x140: "140x140",
        _150x150: "150x150",
        _160x100: "160x100",
        _160x600: "160x600",
        _250x250: "250x250",
        _256x144: "256x144",
        _300x250: "300x250",
        _304x166: "304x166",
        _384x216: "384x216",
        _396x216: "396x216",
        _420x420: "420x420",
        _480x270: "480x270",
        _512x512: "512x512",
        _576x324: "576x324",
        _700x700: "700x700",
        _728x90: "728x90",
        _768x432: "768x432",
        _1200x80: "1200x80",
        _330x110: "330x110",
        _660x220: "660x220",
        _1320x440: "1320x440",
        _720x228: "720x228",
        _1440x456: "1440x456",
        _930x480: "930x480"
    }, "V1BadgesIconsGetSizeEnum", 0, {
        _150x150: "150x150"
    }, "V1BundlesThumbnailsGetSizeEnum", 0, {
        _150x150: "150x150",
        _420x420: "420x420"
    }, "V1DeveloperProductsIconsGetSizeEnum", 0, {
        _150x150: "150x150",
        _420x420: "420x420"
    }, "V1GamePassesGetSizeEnum", 0, {
        _150x150: "150x150"
    }, "V1GamesIconsGetSizeEnum", 0, {
        _50x50: "50x50",
        _128x128: "128x128",
        _150x150: "150x150",
        _256x256: "256x256",
        _420x420: "420x420",
        _512x512: "512x512"
    }, "V1GamesMultigetThumbnailsGetSizeEnum", 0, {
        _768x432: "768x432",
        _576x324: "576x324",
        _480x270: "480x270",
        _384x216: "384x216",
        _256x144: "256x144"
    }, "V1GamesUniverseIdThumbnailsGetSizeEnum", 0, {
        _768x432: "768x432",
        _576x324: "576x324",
        _480x270: "480x270",
        _384x216: "384x216",
        _256x144: "256x144"
    }, "V1GroupsIconsGetSizeEnum", 0, {
        _150x150: "150x150",
        _420x420: "420x420"
    }, "V1PlacesGameiconsGetFormatEnum", 0, {
        Png: "Png",
        Jpeg: "Jpeg",
        Webp: "Webp"
    }, "V1PlacesGameiconsGetIsCircularEnum", 0, {
        True: !0,
        False: !1
    }, "V1PlacesGameiconsGetReturnPolicyEnum", 0, {
        PlaceHolder: "PlaceHolder",
        ForcePlaceHolder: "ForcePlaceHolder",
        AutoGenerated: "AutoGenerated",
        ForceAutoGenerated: "ForceAutoGenerated"
    }, "V1PlacesGameiconsGetSizeEnum", 0, {
        _50x50: "50x50",
        _128x128: "128x128",
        _150x150: "150x150",
        _256x256: "256x256",
        _420x420: "420x420",
        _512x512: "512x512"
    }, "V1UsersAvatarGetSizeEnum", 0, {
        _30x30: "30x30",
        _48x48: "48x48",
        _60x60: "60x60",
        _75x75: "75x75",
        _100x100: "100x100",
        _110x110: "110x110",
        _140x140: "140x140",
        _150x150: "150x150",
        _150x200: "150x200",
        _180x180: "180x180",
        _250x250: "250x250",
        _352x352: "352x352",
        _420x420: "420x420",
        _720x720: "720x720"
    }, "V1UsersAvatarHeadshotGetSizeEnum", 0, {
        _48x48: "48x48",
        _50x50: "50x50",
        _60x60: "60x60",
        _75x75: "75x75",
        _100x100: "100x100",
        _110x110: "110x110",
        _150x150: "150x150",
        _180x180: "180x180",
        _352x352: "352x352",
        _420x420: "420x420",
        _720x720: "720x720"
    }, "V1UsersOutfitsGetSizeEnum", 0, {
        _150x150: "150x150",
        _420x420: "420x420"
    }])
}, 540513, e => {
    "use strict";
    var t = e.i(677753),
        n = e.i(620140),
        r = e.i(416340),
        s = e.i(706442),
        a = e.i(559956),
        i = e.i(95656),
        o = e.i(252842);

    function u() {
        if (void 0 === c) throw Error("Most call thumbnailsClient before using getThumbnailsClient");
        return c
    }(l = v || (v = {})).assetThumbnail = "assetThumbnail", l.avatarHeadshot = "avatarHeadshot", l.avatar = "avatar", l.bundleThumbnail = "bundleThumbnail", l.gameIcon = "gameIcon", l.groupIcon = "groupIcon", l.badgeIcon = "badgeIcon", l.gamePassIcon = "gamePassIcon", l.developerProductIcon = "developerProductIcon", l.userOutfit = "userOutfit", l.gameThumbnail = "gameThumbnail", l.universeThumbnail = "universeThumbnail", l.placeIcon = "placeIcon", l.autoGeneratedPlaceThumbnail = "autoGeneratedPlaceThumbnail", l.autoGeneratedPlaceIcon = "autoGeneratedPlaceIcon";
    var l, c, d, v, h, m, f, p = ((d = {})[v.assetThumbnail] = n.V1AssetsGetSizeEnum._150x150, d[v.avatarHeadshot] = n.V1UsersAvatarHeadshotGetSizeEnum._150x150, d[v.avatar] = n.V1UsersAvatarGetSizeEnum._150x150, d[v.bundleThumbnail] = n.V1BundlesThumbnailsGetSizeEnum._150x150, d[v.gameIcon] = n.V1GamesIconsGetSizeEnum._150x150, d[v.groupIcon] = n.V1GroupsIconsGetSizeEnum._150x150, d[v.badgeIcon] = n.V1BadgesIconsGetSizeEnum._150x150, d[v.gamePassIcon] = n.V1GamePassesGetSizeEnum._150x150, d[v.developerProductIcon] = n.V1DeveloperProductsIconsGetSizeEnum._150x150, d[v.userOutfit] = n.V1UsersOutfitsGetSizeEnum._150x150, d[v.gameThumbnail] = n.V1GamesUniverseIdThumbnailsGetSizeEnum._576x324, d[v.universeThumbnail] = n.V1GamesMultigetThumbnailsGetSizeEnum._576x324, d[v.placeIcon] = n.V1PlacesGameiconsGetSizeEnum._150x150, d[v.autoGeneratedPlaceThumbnail] = n.V1GamesUniverseIdThumbnailsGetSizeEnum._768x432, d[v.autoGeneratedPlaceIcon] = n.V1GamesIconsGetSizeEnum._512x512, d);

    function b(e, t, n, r) {
        return new(n || (n = Promise))(function(s, a) {
            function i(e) {
                try {
                    u(r.next(e))
                } catch (e) {
                    a(e)
                }
            }

            function o(e) {
                try {
                    u(r.throw(e))
                } catch (e) {
                    a(e)
                }
            }

            function u(e) {
                var t;
                e.done ? s(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(i, o)
            }
            u((r = r.apply(e, t || [])).next())
        })
    }

    function g(e, t) {
        var n, r, s, a = {
                label: 0,
                sent: function() {
                    if (1 & s[0]) throw s[1];
                    return s[1]
                },
                trys: [],
                ops: []
            },
            i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return i.next = o(0), i.throw = o(1), i.return = o(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
            return this
        }), i;

        function o(o) {
            return function(u) {
                var l = [o, u];
                if (n) throw TypeError("Generator is already executing.");
                for (; i && (i = 0, l[0] && (a = 0)), a;) try {
                    if (n = 1, r && (s = 2 & l[0] ? r.return : l[0] ? r.throw || ((s = r.return) && s.call(r), 0) : r.next) && !(s = s.call(r, l[1])).done) return s;
                    switch (r = 0, s && (l = [2 & l[0], s.value]), l[0]) {
                        case 0:
                        case 1:
                            s = l;
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
                            if (!(s = (s = a.trys).length > 0 && s[s.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                a = 0;
                                continue
                            }
                            if (3 === l[0] && (!s || l[1] > s[0] && l[1] < s[3])) {
                                a.label = l[1];
                                break
                            }
                            if (6 === l[0] && a.label < s[1]) {
                                a.label = s[1], s = l;
                                break
                            }
                            if (s && a.label < s[2]) {
                                a.label = s[2], a.ops.push(l);
                                break
                            }
                            s[2] && a.ops.pop(), a.trys.pop();
                            continue
                    }
                    l = t.call(e, a)
                } catch (e) {
                    l = [6, e], r = 0
                } finally {
                    n = s = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }(I = h || (h = {}))[I.maxRetryAttempts = 10] = "maxRetryAttempts", I[I.minCooldown = 1e3] = "minCooldown", I[I.maxCooldown = 3e4] = "maxCooldown", (w = m || (m = {})).png = "png", w.jpg = "jpg", w.jpeg = "jpeg", w.webp = "webp", (x = f || (f = {})).PlaceHolder = "PlaceHolder", x.AutoGenerated = "AutoGenerated", x.ForceAutoGenerated = "ForceAutoGenerated", x.ForcePlaceHolder = "ForcePlaceHolder", "function" == typeof SuppressedError && SuppressedError;
    var I, w, x, G, P, A = (0, s.makeStyles)()(function(e, t) {
            return {
                container: {
                    paddingTop: "".concat(100 * t.sizeRatio, "%"),
                    position: "relative",
                    height: "auto",
                    width: "100%",
                    overflow: "hidden"
                },
                background: {
                    backgroundColor: e.palette.action.focus
                },
                img: {
                    position: "absolute",
                    top: 0,
                    left: 0,
                    width: "100%",
                    height: "100%"
                },
                completed: {
                    transition: "opacity .5s ease",
                    opacity: 1
                },
                loading: {
                    opacity: 0
                }
            }
        }),
        T = "".concat("https://assets.create.roblox.com/46bcd45c94eea53be19e5169a303451653ed5c4b/assets", "/thumbnails"),
        R = "".concat(T, "/broken.svg"),
        y = "".concat(T, "/not_approved.svg"),
        C = "".concat(T, "/review_pending.svg"),
        _ = "".concat(T, "/unavailable.svg");
    (G || (G = {})).Time = "time", (P || (P = {})).LoadThumbnail = "loadThumbnail";
    var E = function(e, t) {
            var n = t || "Grasshopper",
                r = new i.Configuration({
                    baseUrl: "".concat(e, "/").concat(n)
                }),
                s = new i.Tracker(r);
            return {
                sendEvent: function(e) {
                    var t = {
                        target: n,
                        eventType: e.eventType,
                        context: e.context,
                        localTime: new Date,
                        additionalProperties: e.additionalProperties
                    };
                    return s.sendEventViaImg(t)
                }
            }
        },
        S = (0, r.createContext)({});
    S.displayName = "ThumbnailsContext";
    var q, O = function(e) {
            var t = e.thumbnailUrl,
                s = e.thumbnailStatus,
                i = e.imgClassName,
                o = e.isPendingResponse,
                u = e.isPendingNewTarget,
                l = e.containerClass,
                c = e.alt,
                d = e.includeBackground,
                v = e.sizeRatio,
                h = e.startTime,
                m = e.skeletonVariant,
                f = e.onLoadThumbnailStatus,
                p = void 0 === f ? void 0 : f,
                b = A({
                    sizeRatio: v
                }),
                g = b.classes,
                I = g.container,
                w = g.background,
                x = g.img,
                T = g.completed,
                E = g.loading,
                q = b.cx,
                O = q(I, l),
                z = (0, r.useState)(!1),
                U = z[0],
                B = z[1],
                k = (0, r.useState)(!1),
                N = k[0],
                F = k[1],
                M = (0, r.useContext)(S).eventTracker,
                V = (0, r.useMemo)(function() {
                    switch (s) {
                        case n.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.Error:
                            return R;
                        case n.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.Blocked:
                            return y;
                        case n.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.InReview:
                            return C;
                        case n.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.Pending:
                            return o ? "" : _;
                        case n.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.Completed:
                        default:
                            return ""
                    }
                }, [o, s]);
            return r.default.createElement("span", {
                className: q(O, u || o || !d ? "" : w)
            }, u || o ? r.default.createElement(a.Skeleton, {
                className: x,
                variant: void 0 === m ? "rectangular" : m,
                animate: !u
            }) : r.default.createElement("img", {
                className: q(x, i, U ? T : E),
                src: null != t ? t : V,
                alt: c,
                onLoad: function() {
                    var e;
                    if (B(!0), M && !N) {
                        var n = performance.now() - h;
                        M.sendEvent({
                            eventType: P.LoadThumbnail,
                            context: G.Time,
                            currentUrl: null == (e = null == window ? void 0 : window.location) ? void 0 : e.href,
                            additionalProperties: {
                                elapsedTime: n,
                                thumbnailStatus: s,
                                thumbnailUrl: null != t ? t : V,
                                sizeRatio: v
                            }
                        }), F(!0)
                    }
                    void 0 !== p && p(s)
                }
            }))
        },
        z = function(e) {
            var t;
            return null != (t = null == e ? void 0 : e.toString()) ? t : ""
        },
        U = new o.BatchRequestFactory,
        B = {
            getFailureCooldown: U.createExponentialBackoffCooldown(h.minCooldown, h.maxCooldown),
            maxRetryAttempts: h.maxRetryAttempts,
            batchSize: 50,
            processBatchWaitTime: 0
        },
        k = {},
        N = {},
        F = function(e, t, n, r, s) {
            if (s && r && delete N[r], !(r in N)) {
                var a = function(e, t) {
                    if (t in k) return k[t];
                    var n = U.createRequestProcessor(e, z, B);
                    return k[t] = n, n
                }(t, n);
                s && a.invalidateItem(e);
                var i = a.queueItem(e).catch(function(e) {
                    return Promise.reject(e)
                });
                N[r] = i
            }
            return N[r]
        },
        M = {},
        V = function(e, t, r, s, a, i) {
            void 0 === a && (a = m.webp), void 0 === i && (i = f.PlaceHolder);
            var l, c, d, h = (c = u(), (d = ((l = {})[v.assetThumbnail] = c.getAssets, l[v.avatarHeadshot] = c.getAvatarHeadshots, l[v.avatar] = c.getAvatars, l[v.bundleThumbnail] = c.getBundles, l[v.gameIcon] = c.getGameIcons, l[v.groupIcon] = c.getGroupIcons, l[v.badgeIcon] = c.getBadgeIcons, l[v.gamePassIcon] = c.getGamePassIcons, l[v.developerProductIcon] = c.getDeveloperProductIcons, l[v.userOutfit] = c.getUserOutfits, l[v.gameThumbnail] = c.getGameThumbnails, l[v.universeThumbnail] = c.getUniverseThumbnails, l[v.placeIcon] = c.getPlaceIcons, l[v.autoGeneratedPlaceThumbnail] = c.getAutoGeneratedPlaceImage, l[v.autoGeneratedPlaceIcon] = c.getAutoGeneratedPlaceImage, l)[r]) || console.debug("Missing urlConfig implementation for thumbnail type: ".concat(r)), d);
            return new Promise(function(u, l) {
                var c = t.map(function(e) {
                    return e.itemId
                });
                if (h) {
                    var d = (new Date).getTime(),
                        m = [];
                    m = r === v.assetThumbnail || r === v.gameIcon || r === v.placeIcon ? [c, i, s, a] : r === v.gameThumbnail ? [e, c, s, a] : [c, s, a], h.apply(null, m).then(function(e) {
                        var r, s = {};
                        (null != (r = null == e ? void 0 : e.data) ? r : []).forEach(function(e) {
                            s[z(e.targetId)] = e
                        }), t.forEach(function(e) {
                            var t = e.itemId,
                                r = z(t);
                            Object.prototype.hasOwnProperty.call(s, r) && s[r] ? s[r].state === n.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.Pending && (delete s[r], M[r] || (M[r] = {
                                startTime: d
                            })) : s[r] = {
                                targetId: t,
                                state: n.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.Error
                            }
                        }), u(s)
                    }).catch(function() {
                        u({})
                    })
                } else l(o.BatchRequestError.unretriableFailure)
            })
        },
        H = function(e, t, r, s, a, i, o) {
            void 0 === s && (s = m.webp), void 0 === a && (a = f.PlaceHolder), void 0 === o && (o = !1);
            var u, l, c, d, v = i || p[e] || n.V1UsersAvatarHeadshotGetSizeEnum._150x150;
            if (!r) return new Promise(function(e, t) {
                t("TargetId can not be empty.")
            });
            if (!e) return new Promise(function(e, t) {
                t("ThumbnailType can not be empty.")
            });
            var h = (u = s, l = a, void 0 === u && (u = m.webp), void 0 === l && (l = f.PlaceHolder), "thumbnail_type:".concat(e, "_baseTargetId:").concat(t, "_targetId:").concat(r, "_requestedSize:").concat(v, "_format:").concat(u, "_returnPolicy:").concat(l));
            return F(r, function(n) {
                return V(t, n, e, v, s, a)
            }, (c = s, d = a, void 0 === c && (c = m.webp), void 0 === d && (d = f.PlaceHolder), "".concat(t, ":").concat(e, ":").concat(v, ":").concat(c, ":").concat(d)), h, o)
        },
        L = {
            getThumbnailImage: function(e, t, n, r, s) {
                return void 0 === n && (n = f.PlaceHolder), void 0 === r && (r = m.webp), H(e, 0, t, r, n, s)
            },
            reloadThumbnailImage: function(e, t, n, r, s) {
                return void 0 === n && (n = f.PlaceHolder), void 0 === r && (r = m.webp), H(e, 0, t, r, n, s, !0)
            },
            getThumbnailImageWithBaseTarget: function(e, t, n, r, s, a) {
                return void 0 === r && (r = f.PlaceHolder), void 0 === s && (s = m.webp), H(e, t, n, s, r, a)
            }
        },
        j = (0, r.forwardRef)(function(e, t) {
            var s = this,
                a = e.type,
                i = e.baseTargetId,
                o = void 0 === i ? 0 : i,
                u = e.targetId,
                l = e.imgClassName,
                c = void 0 === l ? "" : l,
                d = e.containerClass,
                h = e.returnPolicy,
                p = void 0 === h ? f.PlaceHolder : h,
                I = e.alt,
                w = e.skeletonVariant,
                x = e.isPendingNewTarget,
                G = e.includeBackground,
                P = e.size,
                A = e.onLoadThumbnailStatus,
                T = e.format,
                R = void 0 === T ? m.webp : T,
                y = (0, r.useState)(),
                C = y[0],
                _ = y[1];
            (0, r.useEffect)(function() {
                var e = !0;
                return b(s, void 0, void 0, function() {
                        var t;
                        return g(this, function(n) {
                            switch (n.label) {
                                case 0:
                                    return R !== m.webp && _(R), [4, function() {
                                        return b(this, void 0, void 0, function() {
                                            return g(this, function(e) {
                                                return void 0 === q && (q = new Promise(function(e) {
                                                    try {
                                                        var t = new Image;
                                                        t.onload = function() {
                                                            return e(t.width > 0 && t.height > 0)
                                                        }, t.onerror = function() {
                                                            return e(!1)
                                                        }, t.src = "data:image/webp;base64,UklGRkoAAABXRUJQVlA4WAoAAAAQAAAAAAAAAAAAQUxQSAwAAAARBxAR/Q9ERP8DAABWUDggGAAAABQBAJ0BKgEAAQAAAP4AAA3AAP7mtQAAAA=="
                                                    } catch (t) {
                                                        e(!0)
                                                    }
                                                })), [2, q]
                                            })
                                        })
                                    }()];
                                case 1:
                                    return t = n.sent(), e && _(t ? R : m.png), [2]
                            }
                        })
                    }),
                    function() {
                        e = !1
                    }
            }, [R]);
            var E = (0, r.useState)(n.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.Pending),
                S = E[0],
                z = E[1],
                U = (0, r.useState)(),
                B = U[0],
                k = U[1],
                N = (0, r.useState)(!0),
                F = N[0],
                M = N[1],
                V = (0, r.useState)(performance.now())[0],
                H = (0, r.useMemo)(function() {
                    return a === v.gameThumbnail || a === v.universeThumbnail ? .5625 : 1
                }, [a]);
            return (0, r.useImperativeHandle)(t, function() {
                return {
                    refreshThumbnail: function() {
                        L.reloadThumbnailImage(a, u, p, C).then(function(e) {
                            var t = e.state,
                                r = e.imageUrl;
                            z(null != t ? t : n.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.Pending), k(r)
                        }, function(e) {
                            console.log(e)
                        }).finally(function() {
                            M(!1)
                        })
                    }
                }
            }), (0, r.useEffect)(function() {
                var e = !1;
                return M(!0), void 0 === C || (o ? L.getThumbnailImageWithBaseTarget(a, o, u, p, C, P) : L.getThumbnailImage(a, u, p, C, P)).then(function(t) {
                        var r = t.state,
                            s = t.imageUrl;
                        e || (z(null != r ? r : n.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.Pending), k(s))
                    }, function(e) {
                        console.log(e)
                    }).finally(function() {
                        e || M(!1)
                    }),
                    function() {
                        e = !0
                    }
            }, [a, o, u, c, C, p, P]), r.default.createElement(O, {
                thumbnailUrl: B,
                thumbnailStatus: S,
                skeletonVariant: w,
                imgClassName: c,
                isPendingResponse: F,
                isPendingNewTarget: void 0 !== x && x,
                containerClass: void 0 === d ? "" : d,
                alt: I,
                includeBackground: void 0 !== G && G,
                sizeRatio: H,
                startTime: V,
                onLoadThumbnailStatus: void 0 === A ? void 0 : A
            })
        });
    e.s(["ReturnPolicy", 0, f, "Thumbnail2d", 0, j, "ThumbnailClient", 0, L, "ThumbnailFormat", 0, m, "ThumbnailTypes", 0, v, "ThumbnailsProvider", 0, function(e) {
        var t = e.baseUrl,
            n = e.targetNamespace,
            s = e.children,
            a = (0, r.useMemo)(function() {
                return {
                    eventTracker: E(t, n)
                }
            }, [t, n]);
        return r.default.createElement(S.Provider, {
            value: a
        }, s)
    }, "createThumbnailsClient", 0, function(e) {
        var r = new n.AssetsApi(new t.Configuration({
                basePath: e,
                credentials: "include"
            })),
            s = new n.AvatarApi(new t.Configuration({
                basePath: e,
                credentials: "include"
            })),
            a = new n.BadgesApi(new t.Configuration({
                basePath: e,
                credentials: "include"
            })),
            i = new n.BundlesApi(new t.Configuration({
                basePath: e,
                credentials: "include"
            })),
            o = new n.DeveloperProductsApi(new t.Configuration({
                basePath: e,
                credentials: "include"
            })),
            u = new n.GamePassesApi(new t.Configuration({
                basePath: e,
                credentials: "include"
            })),
            l = new n.GamesApi(new t.Configuration({
                basePath: e,
                credentials: "include"
            })),
            d = new n.GroupEmblemApi(new t.Configuration({
                basePath: e,
                credentials: "include"
            })),
            v = new n.OutfitsApi(new t.Configuration({
                basePath: e,
                credentials: "include"
            })),
            h = new n.PlacesApi(new t.Configuration({
                basePath: e,
                credentials: "include"
            })),
            m = new n.BatchApi(new t.Configuration({
                basePath: e,
                credentials: "include"
            }));
        c = {
            getAssets: function(e, t, n, s, a) {
                return r.v1AssetsGet({
                    assetIds: e,
                    returnPolicy: t,
                    size: n,
                    format: s,
                    isCircular: a
                })
            },
            getAvatarHeadshots: function(e, t, n, r) {
                return s.v1UsersAvatarHeadshotGet({
                    userIds: e,
                    size: t,
                    format: n,
                    isCircular: r
                })
            },
            getAvatars: function(e, t, n, r) {
                return s.v1UsersAvatarGet({
                    userIds: e,
                    size: t,
                    format: n,
                    isCircular: r
                })
            },
            getBundles: function(e, t, n, r) {
                return i.v1BundlesThumbnailsGet({
                    bundleIds: e,
                    size: t,
                    format: n,
                    isCircular: r
                })
            },
            getGameIcons: function(e, t, n, r, s) {
                return l.v1GamesIconsGet({
                    universeIds: e,
                    returnPolicy: t,
                    size: n,
                    format: r,
                    isCircular: s
                })
            },
            getGroupIcons: function(e, t, n, r) {
                return d.v1GroupsIconsGet({
                    groupIds: e,
                    size: t,
                    format: n,
                    isCircular: r
                })
            },
            getBadgeIcons: function(e, t, n, r) {
                return a.v1BadgesIconsGet({
                    badgeIds: e,
                    size: t,
                    format: n,
                    isCircular: r
                })
            },
            getGamePassIcons: function(e, t, n, r) {
                return u.v1GamePassesGet({
                    gamePassIds: e,
                    size: t,
                    format: n,
                    isCircular: r
                })
            },
            getDeveloperProductIcons: function(e, t, n, r) {
                return o.v1DeveloperProductsIconsGet({
                    developerProductIds: e,
                    size: t,
                    format: n,
                    isCircular: r
                })
            },
            getUserOutfits: function(e, t, n, r) {
                return v.v1UsersOutfitsGet({
                    userOutfitIds: e,
                    size: t,
                    format: n,
                    isCircular: r
                })
            },
            getGameThumbnails: function(e, t, n, r, s) {
                return l.v1GamesUniverseIdThumbnailsGet({
                    universeId: e,
                    thumbnailIds: t,
                    size: n,
                    format: r,
                    isCircular: s
                })
            },
            getUniverseThumbnails: function(e, t, n, r) {
                return l.v1GamesMultigetThumbnailsGet({
                    universeIds: e,
                    countPerUniverse: 1,
                    defaults: !0,
                    size: t,
                    format: n,
                    isCircular: r
                }).then(function(e) {
                    var t, n = null == e ? void 0 : e.data;
                    return {
                        data: null != (t = null == n ? void 0 : n.map(function(e) {
                            var t, n = null == (t = e.thumbnails) ? void 0 : t[0];
                            return {
                                targetId: e.universeId,
                                state: null == n ? void 0 : n.state,
                                imageUrl: null == n ? void 0 : n.imageUrl
                            }
                        })) ? t : []
                    }
                })
            },
            getPlaceIcons: function(e, t, n, r, s) {
                return h.v1PlacesGameiconsGet({
                    placeIds: e,
                    returnPolicy: t,
                    size: n,
                    format: r,
                    isCircular: s
                })
            },
            getAutoGeneratedPlaceImage: function(e, t, r) {
                var s = e.map(function(e) {
                    return {
                        targetId: e,
                        type: n.RobloxThumbnailsApisModelsThumbnailBatchRequestTypeEnum.GameIcon,
                        size: t,
                        format: r
                    }
                });
                return m.v1BatchPost({
                    requests: s
                })
            },
            getBatchThumbnails: function(e, t, n, r, s) {
                var a = e.map(function(e) {
                    return {
                        targetId: e,
                        type: t,
                        size: n,
                        format: r,
                        isCircular: s
                    }
                });
                return m.v1BatchPost({
                    requests: a
                })
            }
        }
    }, "getThumbnailsClient", 0, u])
}, 559956, e => {
    "use strict";
    let t, n, r, s;
    var a = e.i(569384),
        i = e.i(865800),
        o = e.i(416340),
        u = e.i(614515),
        l = e.i(993807),
        c = e.i(273589),
        d = e.i(962560),
        v = e.i(42569),
        h = e.i(696180),
        m = e.i(221628),
        f = e.i(990857),
        p = e.i(963320),
        b = e.i(571709);

    function g() {
        let e = (0, a._)(["\n  0% {\n    opacity: 1;\n  }\n\n  50% {\n    opacity: 0.4;\n  }\n\n  100% {\n    opacity: 1;\n  }\n"]);
        return g = function() {
            return e
        }, e
    }

    function I() {
        let e = (0, a._)(["\n  0% {\n    transform: translateX(-100%);\n  }\n\n  50% {\n    /* +0.5s of delay between each loop */\n    transform: translateX(100%);\n  }\n\n  100% {\n    transform: translateX(100%);\n  }\n"]);
        return I = function() {
            return e
        }, e
    }

    function w() {
        let e = (0, a._)(["\n      animation: ", " 2s ease-in-out 0.5s infinite;\n    "]);
        return w = function() {
            return e
        }, e
    }

    function x() {
        let e = (0, a._)(["\n      position: relative;\n      overflow: hidden;\n\n      /* Fix bug in Safari https://bugs.webkit.org/show_bug.cgi?id=68196 */\n      -webkit-mask-image: -webkit-radial-gradient(white, black);\n\n      &::after {\n        animation: ", " 2s linear 0.5s infinite;\n        background: linear-gradient(\n          90deg,\n          transparent,\n          ", ",\n          transparent\n        );\n        content: '';\n        position: absolute;\n        transform: translateX(-100%); /* Avoid flash during server-side hydration */\n        bottom: 0;\n        left: 0;\n        right: 0;\n        top: 0;\n      }\n    "]);
        return x = function() {
            return e
        }, e
    }

    function G(e) {
        return (0, c.g)("MuiSkeleton", e)
    }(0, h.g)("MuiSkeleton", ["root", "text", "rectangular", "rounded", "circular", "pulse", "wave", "withChildren", "fitContent", "heightAuto"]);
    let P = ["animation", "className", "component", "height", "style", "variant", "width"],
        A = (0, b.keyframes)(t || (t = g())),
        T = (0, b.keyframes)(n || (n = I())),
        R = (0, v.s)("span", {
            name: "MuiSkeleton",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: n
                } = e;
                return [t.root, t[n.variant], !1 !== n.animation && t[n.animation], n.hasChildren && t.withChildren, n.hasChildren && !n.width && t.fitContent, n.hasChildren && !n.height && t.heightAuto]
            }
        })(e => {
            let {
                theme: t,
                ownerState: n
            } = e, r = String(t.shape.borderRadius).match(/[\d.\-+]*\s*(.*)/)[1] || "px", s = parseFloat(t.shape.borderRadius);
            return (0, d._)({
                display: "block",
                backgroundColor: t.vars ? t.vars.palette.Skeleton.bg : (0, f.a)(t.palette.text.primary, "light" === t.palette.mode ? .11 : .13),
                height: "1.2em"
            }, "text" === n.variant && {
                marginTop: 0,
                marginBottom: 0,
                height: "auto",
                transformOrigin: "0 55%",
                transform: "scale(1, 0.60)",
                borderRadius: "".concat(s).concat(r, "/").concat(Math.round(s / .6 * 10) / 10).concat(r),
                "&:empty:before": {
                    content: '"\\00a0"'
                }
            }, "circular" === n.variant && {
                borderRadius: "50%"
            }, "rounded" === n.variant && {
                borderRadius: (t.vars || t).shape.borderRadius
            }, n.hasChildren && {
                "& > *": {
                    visibility: "hidden"
                }
            }, n.hasChildren && !n.width && {
                maxWidth: "fit-content"
            }, n.hasChildren && !n.height && {
                height: "auto"
            })
        }, e => {
            let {
                ownerState: t
            } = e;
            return "pulse" === t.animation && (0, b.css)(r || (r = w()), A)
        }, e => {
            let {
                ownerState: t,
                theme: n
            } = e;
            return "wave" === t.animation && (0, b.css)(s || (s = x()), T, (n.vars || n).palette.action.hover)
        }),
        y = o.forwardRef(function(e, t) {
            let n = (0, p.u)({
                    props: e,
                    name: "MuiSkeleton"
                }),
                {
                    animation: r = "pulse",
                    className: s,
                    component: a = "span",
                    height: i,
                    style: o,
                    variant: u = "text",
                    width: l
                } = n,
                h = (0, c._)(n, P),
                f = (0, d._)({}, n, {
                    animation: r,
                    component: a,
                    variant: u,
                    hasChildren: !!h.children
                }),
                b = (e => {
                    let {
                        classes: t,
                        variant: n,
                        animation: r,
                        hasChildren: s,
                        width: a,
                        height: i
                    } = e;
                    return (0, v.a)({
                        root: ["root", n, r, s && "withChildren", s && !a && "fitContent", s && !i && "heightAuto"]
                    }, G, t)
                })(f);
            return (0, m.jsx)(R, (0, d._)({
                as: a,
                ref: t,
                className: (0, v.c)(b.root, s),
                ownerState: f
            }, h, {
                style: (0, d._)({
                    width: l,
                    height: i
                }, o)
            }))
        });
    var C = (0, u.default)({
            name: "Skeleton"
        })(function(e) {
            return {
                root: {
                    backgroundColor: e.palette.states.hover
                },
                wave: {
                    backgroundColor: e.palette.states.focus
                },
                rectangular: (0, i._)({}, e.border.radius.large),
                square: {
                    borderRadius: "0px"
                }
            }
        }),
        _ = {
            text: "text",
            rectangular: "rectangular",
            circular: "circular",
            square: "rectangular"
        },
        E = (0, o.forwardRef)(function(e, t) {
            var n, r = e.variant,
                s = void 0 === r ? "text" : r,
                a = e.animate,
                u = e.classes,
                c = e.className,
                d = (0, i.a)(e, ["variant", "animate", "classes", "className"]),
                v = C(void 0, {
                    props: {
                        classes: (0, l.default)(u, c)
                    }
                }),
                h = v.classes,
                m = h.square,
                f = h.rectangular,
                p = (0, i.a)(h, ["square", "rectangular"]),
                b = v.cx;
            return o.default.createElement(y, (0, i._)({}, d, {
                variant: _[s],
                animation: !!(void 0 !== a && a) && "wave",
                classes: (0, i._)((0, i._)({}, p), {
                    rectangular: b(f, ((n = {})[m] = "square" === s, n))
                }),
                ref: t
            }))
        });
    e.s(["Skeleton", 0, E], 559956)
}, 990857, e => {
    "use strict";
    var t = e.i(983545);

    function n(e) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0,
            r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 1;
        return (0, t.c)(e, n, r)
    }

    function r(e) {
        if (e.type) return e;
        if ("#" === e.charAt(0)) {
            var n;
            let t, s;
            return r((n = (n = e).slice(1), t = RegExp(".{1,".concat(n.length >= 6 ? 2 : 1, "}"), "g"), (s = n.match(t)) && 1 === s[0].length && (s = s.map(e => e + e)), s ? "rgb".concat(4 === s.length ? "a" : "", "(").concat(s.map((e, t) => t < 3 ? parseInt(e, 16) : Math.round(parseInt(e, 16) / 255 * 1e3) / 1e3).join(", "), ")") : ""))
        }
        let s = e.indexOf("("),
            a = e.substring(0, s);
        if (-1 === ["rgb", "rgba", "hsl", "hsla", "color"].indexOf(a)) throw Error((0, t.f)(9, e));
        let i, o = e.substring(s + 1, e.length - 1);
        if ("color" === a) {
            if (i = (o = o.split(" ")).shift(), 4 === o.length && "/" === o[3].charAt(0) && (o[3] = o[3].slice(1)), -1 === ["srgb", "display-p3", "a98-rgb", "prophoto-rgb", "rec-2020"].indexOf(i)) throw Error((0, t.f)(10, i))
        } else o = o.split(",");
        return {
            type: a,
            values: o = o.map(e => parseFloat(e)),
            colorSpace: i
        }
    }

    function s(e) {
        let {
            type: t,
            colorSpace: n
        } = e, {
            values: r
        } = e;
        return -1 !== t.indexOf("rgb") ? r = r.map((e, t) => t < 3 ? parseInt(e, 10) : e) : -1 !== t.indexOf("hsl") && (r[1] = "".concat(r[1], "%"), r[2] = "".concat(r[2], "%")), r = -1 !== t.indexOf("color") ? "".concat(n, " ").concat(r.join(" ")) : "".concat(r.join(", ")), "".concat(t, "(").concat(r, ")")
    }
    e.s(["a", 0, function(e, t) {
        return e = r(e), t = n(t), "rgb" !== e.type && "hsl" !== e.type || (e.type += "a"), "color" === e.type ? e.values[3] = "/".concat(t) : e.values[3] = t, s(e)
    }, "l", 0, function(e, t) {
        if (e = r(e), t = n(t), -1 !== e.type.indexOf("hsl")) e.values[2] += (100 - e.values[2]) * t;
        else if (-1 !== e.type.indexOf("rgb"))
            for (let n = 0; n < 3; n += 1) e.values[n] += (255 - e.values[n]) * t;
        else if (-1 !== e.type.indexOf("color"))
            for (let n = 0; n < 3; n += 1) e.values[n] += (1 - e.values[n]) * t;
        return s(e)
    }])
}, 237401, (e, t, n) => {
    t.exports = e.r(761438)
}]);

//# debugId=da184f07-12f2-62e7-6d1f-4078c6bb16f8
//# sourceMappingURL=30l6hctfgpkev.js.map