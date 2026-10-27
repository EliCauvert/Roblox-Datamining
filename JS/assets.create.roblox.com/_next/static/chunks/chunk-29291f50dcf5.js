;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "4ee020c0-29f9-8a5b-8684-0c3dd1795a71")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 620140, t => {
    "use strict";
    var n = t.i(677753),
        r = function(t, n) {
            return (r = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(t, n) {
                t.__proto__ = n
            } || function(t, n) {
                for (var r in n) Object.prototype.hasOwnProperty.call(n, r) && (t[r] = n[r])
            })(t, n)
        };

    function i(t, n) {
        if ("function" != typeof n && null !== n) throw TypeError("Class extends value " + String(n) + " is not a constructor or null");

        function i() {
            this.constructor = t
        }
        r(t, n), t.prototype = null === n ? Object.create(n) : (i.prototype = n.prototype, new i)
    }

    function a(t, n, r, i) {
        return new(r || (r = Promise))(function(a, o) {
            function c(t) {
                try {
                    l(i.next(t))
                } catch (t) {
                    o(t)
                }
            }

            function u(t) {
                try {
                    l(i.throw(t))
                } catch (t) {
                    o(t)
                }
            }

            function l(t) {
                var n;
                t.done ? a(t.value) : ((n = t.value) instanceof r ? n : new r(function(t) {
                    t(n)
                })).then(c, u)
            }
            l((i = i.apply(t, n || [])).next())
        })
    }

    function o(t, n) {
        var r, i, a, o = {
                label: 0,
                sent: function() {
                    if (1 & a[0]) throw a[1];
                    return a[1]
                },
                trys: [],
                ops: []
            },
            c = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return c.next = u(0), c.throw = u(1), c.return = u(2), "function" == typeof Symbol && (c[Symbol.iterator] = function() {
            return this
        }), c;

        function u(u) {
            return function(l) {
                var s = [u, l];
                if (r) throw TypeError("Generator is already executing.");
                for (; c && (c = 0, s[0] && (o = 0)), o;) try {
                    if (r = 1, i && (a = 2 & s[0] ? i.return : s[0] ? i.throw || ((a = i.return) && a.call(i), 0) : i.next) && !(a = a.call(i, s[1])).done) return a;
                    switch (i = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                        case 0:
                        case 1:
                            a = s;
                            break;
                        case 4:
                            return o.label++, {
                                value: s[1],
                                done: !1
                            };
                        case 5:
                            o.label++, i = s[1], s = [0];
                            continue;
                        case 7:
                            s = o.ops.pop(), o.trys.pop();
                            continue;
                        default:
                            if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                o = 0;
                                continue
                            }
                            if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                o.label = s[1];
                                break
                            }
                            if (6 === s[0] && o.label < a[1]) {
                                o.label = a[1], a = s;
                                break
                            }
                            if (a && o.label < a[2]) {
                                o.label = a[2], o.ops.push(s);
                                break
                            }
                            a[2] && o.ops.pop(), o.trys.pop();
                            continue
                    }
                    s = n.call(t, o)
                } catch (t) {
                    s = [6, t], i = 0
                } finally {
                    r = a = 0
                }
                if (5 & s[0]) throw s[1];
                return {
                    value: s[0] ? s[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function c(t) {
        var r;
        return null == (r = t) ? r : {
            targetId: (0, n.exists)(r, "targetId") ? r.targetId : void 0,
            state: (0, n.exists)(r, "state") ? r.state : void 0,
            imageUrl: (0, n.exists)(r, "imageUrl") ? r.imageUrl : void 0,
            version: (0, n.exists)(r, "version") ? r.version : void 0
        }
    }

    function u(t) {
        var r, i;
        return null == (r = t) ? r : {
            universeId: (0, n.exists)(r, "universeId") ? r.universeId : void 0,
            error: (0, n.exists)(r, "error") ? null == (i = r.error) ? i : {
                code: (0, n.exists)(i, "code") ? i.code : void 0,
                message: (0, n.exists)(i, "message") ? i.message : void 0,
                userFacingMessage: (0, n.exists)(i, "userFacingMessage") ? i.userFacingMessage : void 0,
                field: (0, n.exists)(i, "field") ? i.field : void 0,
                fieldData: (0, n.exists)(i, "fieldData") ? i.fieldData : void 0
            } : void 0,
            thumbnails: (0, n.exists)(r, "thumbnails") ? r.thumbnails.map(c) : void 0
        }
    }

    function l(t) {
        if (void 0 !== t) return null === t ? null : {
            requestId: t.requestId,
            targetId: t.targetId,
            token: t.token,
            alias: t.alias,
            type: t.type,
            size: t.size,
            format: t.format,
            isCircular: t.isCircular,
            accessContext: t.accessContext,
            headShape: t.headShape
        }
    }

    function s(t) {
        var r;
        return null == (r = t) ? r : {
            requestId: (0, n.exists)(r, "requestId") ? r.requestId : void 0,
            errorCode: (0, n.exists)(r, "errorCode") ? r.errorCode : void 0,
            errorMessage: (0, n.exists)(r, "errorMessage") ? r.errorMessage : void 0,
            targetId: (0, n.exists)(r, "targetId") ? r.targetId : void 0,
            state: (0, n.exists)(r, "state") ? r.state : void 0,
            imageUrl: (0, n.exists)(r, "imageUrl") ? r.imageUrl : void 0,
            version: (0, n.exists)(r, "version") ? r.version : void 0
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function d(t, r) {
        return null == t ? t : {
            data: (0, n.exists)(t, "data") ? t.data.map(c) : void 0
        }
    }
    var m = function(t) {
            function r() {
                return null !== t && t.apply(this, arguments) || this
            }
            return i(r, t), r.prototype.v1AssetThumbnailAnimatedGetRaw = function(t, r) {
                return a(this, void 0, void 0, function() {
                    var i, a, u;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === t.assetId || void 0 === t.assetId) throw new n.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetThumbnailAnimatedGet.");
                                return i = {}, void 0 !== t.assetId && (i.assetId = t.assetId), a = {}, void 0 !== t.robloxPlaceId && null !== t.robloxPlaceId && (a["Roblox-Place-Id"] = String(t.robloxPlaceId)), [4, this.request({
                                    path: "/v1/asset-thumbnail-animated",
                                    method: "GET",
                                    headers: a,
                                    query: i
                                }, r)];
                            case 1:
                                return u = o.sent(), [2, new n.JSONApiResponse(u, function(t) {
                                    return c(t)
                                })]
                        }
                    })
                })
            }, r.prototype.v1AssetThumbnailAnimatedGet = function(t, n) {
                return a(this, void 0, void 0, function() {
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1AssetThumbnailAnimatedGetRaw(t, n)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.v1AssetsGetRaw = function(t, r) {
                return a(this, void 0, void 0, function() {
                    var i, a, c;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === t.assetIds || void 0 === t.assetIds) throw new n.RequiredError("assetIds", "Required parameter requestParameters.assetIds was null or undefined when calling v1AssetsGet.");
                                return i = {}, t.assetIds && (i.assetIds = t.assetIds.join(n.COLLECTION_FORMATS.csv)), void 0 !== t.returnPolicy && (i.returnPolicy = t.returnPolicy), void 0 !== t.size && (i.size = t.size), void 0 !== t.format && (i.format = t.format), void 0 !== t.isCircular && (i.isCircular = t.isCircular), a = {}, void 0 !== t.robloxPlaceId && null !== t.robloxPlaceId && (a["Roblox-Place-Id"] = String(t.robloxPlaceId)), [4, this.request({
                                    path: "/v1/assets",
                                    method: "GET",
                                    headers: a,
                                    query: i
                                }, r)];
                            case 1:
                                return c = o.sent(), [2, new n.JSONApiResponse(c, function(t) {
                                    return d(t)
                                })]
                        }
                    })
                })
            }, r.prototype.v1AssetsGet = function(t, n) {
                return a(this, void 0, void 0, function() {
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1AssetsGetRaw(t, n)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.v1AssetsThumbnail3dGetRaw = function(t, r) {
                return a(this, void 0, void 0, function() {
                    var i, a, u;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === t.assetId || void 0 === t.assetId) throw new n.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsThumbnail3dGet.");
                                return i = {}, void 0 !== t.assetId && (i.assetId = t.assetId), void 0 !== t.useGltf && (i.useGltf = t.useGltf), a = {}, void 0 !== t.robloxPlaceId && null !== t.robloxPlaceId && (a["Roblox-Place-Id"] = String(t.robloxPlaceId)), [4, this.request({
                                    path: "/v1/assets-thumbnail-3d",
                                    method: "GET",
                                    headers: a,
                                    query: i
                                }, r)];
                            case 1:
                                return u = o.sent(), [2, new n.JSONApiResponse(u, function(t) {
                                    return c(t)
                                })]
                        }
                    })
                })
            }, r.prototype.v1AssetsThumbnail3dGet = function(t, n) {
                return a(this, void 0, void 0, function() {
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1AssetsThumbnail3dGetRaw(t, n)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r
        }(n.BaseAPI),
        f = function(t) {
            function r() {
                return null !== t && t.apply(this, arguments) || this
            }
            return i(r, t), r.prototype.v1UsersAvatar3dGetRaw = function(t, r) {
                return a(this, void 0, void 0, function() {
                    var i, a, u;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === t.userId || void 0 === t.userId) throw new n.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersAvatar3dGet.");
                                return i = {}, void 0 !== t.userId && (i.userId = t.userId), a = {}, [4, this.request({
                                    path: "/v1/users/avatar-3d",
                                    method: "GET",
                                    headers: a,
                                    query: i
                                }, r)];
                            case 1:
                                return u = o.sent(), [2, new n.JSONApiResponse(u, function(t) {
                                    return c(t)
                                })]
                        }
                    })
                })
            }, r.prototype.v1UsersAvatar3dGet = function(t, n) {
                return a(this, void 0, void 0, function() {
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1UsersAvatar3dGetRaw(t, n)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.v1UsersAvatarBustGetRaw = function(t, r) {
                return a(this, void 0, void 0, function() {
                    var i, a, c;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === t.userIds || void 0 === t.userIds) throw new n.RequiredError("userIds", "Required parameter requestParameters.userIds was null or undefined when calling v1UsersAvatarBustGet.");
                                return i = {}, t.userIds && (i.userIds = t.userIds.join(n.COLLECTION_FORMATS.csv)), void 0 !== t.size && (i.size = t.size), void 0 !== t.format && (i.format = t.format), void 0 !== t.isCircular && (i.isCircular = t.isCircular), a = {}, [4, this.request({
                                    path: "/v1/users/avatar-bust",
                                    method: "GET",
                                    headers: a,
                                    query: i
                                }, r)];
                            case 1:
                                return c = o.sent(), [2, new n.JSONApiResponse(c, function(t) {
                                    return d(t)
                                })]
                        }
                    })
                })
            }, r.prototype.v1UsersAvatarBustGet = function(t, n) {
                return a(this, void 0, void 0, function() {
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1UsersAvatarBustGetRaw(t, n)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.v1UsersAvatarGetRaw = function(t, r) {
                return a(this, void 0, void 0, function() {
                    var i, a, c;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === t.userIds || void 0 === t.userIds) throw new n.RequiredError("userIds", "Required parameter requestParameters.userIds was null or undefined when calling v1UsersAvatarGet.");
                                return i = {}, t.userIds && (i.userIds = t.userIds.join(n.COLLECTION_FORMATS.csv)), void 0 !== t.size && (i.size = t.size), void 0 !== t.format && (i.format = t.format), void 0 !== t.isCircular && (i.isCircular = t.isCircular), a = {}, [4, this.request({
                                    path: "/v1/users/avatar",
                                    method: "GET",
                                    headers: a,
                                    query: i
                                }, r)];
                            case 1:
                                return c = o.sent(), [2, new n.JSONApiResponse(c, function(t) {
                                    return d(t)
                                })]
                        }
                    })
                })
            }, r.prototype.v1UsersAvatarGet = function(t, n) {
                return a(this, void 0, void 0, function() {
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1UsersAvatarGetRaw(t, n)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.v1UsersAvatarHeadshotGetRaw = function(t, r) {
                return a(this, void 0, void 0, function() {
                    var i, a, c;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === t.userIds || void 0 === t.userIds) throw new n.RequiredError("userIds", "Required parameter requestParameters.userIds was null or undefined when calling v1UsersAvatarHeadshotGet.");
                                return i = {}, t.userIds && (i.userIds = t.userIds.join(n.COLLECTION_FORMATS.csv)), void 0 !== t.size && (i.size = t.size), void 0 !== t.format && (i.format = t.format), void 0 !== t.isCircular && (i.isCircular = t.isCircular), a = {}, [4, this.request({
                                    path: "/v1/users/avatar-headshot",
                                    method: "GET",
                                    headers: a,
                                    query: i
                                }, r)];
                            case 1:
                                return c = o.sent(), [2, new n.JSONApiResponse(c, function(t) {
                                    return d(t)
                                })]
                        }
                    })
                })
            }, r.prototype.v1UsersAvatarHeadshotGet = function(t, n) {
                return a(this, void 0, void 0, function() {
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1UsersAvatarHeadshotGetRaw(t, n)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r
        }(n.BaseAPI),
        v = function(t) {
            function r() {
                return null !== t && t.apply(this, arguments) || this
            }
            return i(r, t), r.prototype.v1BadgesIconsGetRaw = function(t, r) {
                return a(this, void 0, void 0, function() {
                    var i, a, c;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === t.badgeIds || void 0 === t.badgeIds) throw new n.RequiredError("badgeIds", "Required parameter requestParameters.badgeIds was null or undefined when calling v1BadgesIconsGet.");
                                return i = {}, t.badgeIds && (i.badgeIds = t.badgeIds.join(n.COLLECTION_FORMATS.csv)), void 0 !== t.size && (i.size = t.size), void 0 !== t.format && (i.format = t.format), void 0 !== t.isCircular && (i.isCircular = t.isCircular), a = {}, [4, this.request({
                                    path: "/v1/badges/icons",
                                    method: "GET",
                                    headers: a,
                                    query: i
                                }, r)];
                            case 1:
                                return c = o.sent(), [2, new n.JSONApiResponse(c, function(t) {
                                    return d(t)
                                })]
                        }
                    })
                })
            }, r.prototype.v1BadgesIconsGet = function(t, n) {
                return a(this, void 0, void 0, function() {
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1BadgesIconsGetRaw(t, n)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r
        }(n.BaseAPI),
        p = function(t) {
            function r() {
                return null !== t && t.apply(this, arguments) || this
            }
            return i(r, t), r.prototype.v1BatchPostRaw = function(t, r) {
                return a(this, void 0, void 0, function() {
                    var i, a, c;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === t.requests || void 0 === t.requests) throw new n.RequiredError("requests", "Required parameter requestParameters.requests was null or undefined when calling v1BatchPost.");
                                return i = {}, (a = {})["Content-Type"] = "application/json", void 0 !== t.robloxPlaceId && null !== t.robloxPlaceId && (a["Roblox-Place-Id"] = String(t.robloxPlaceId)), [4, this.request({
                                    path: "/v1/batch",
                                    method: "POST",
                                    headers: a,
                                    query: i,
                                    body: t.requests.map(l)
                                }, r)];
                            case 1:
                                return c = o.sent(), [2, new n.JSONApiResponse(c, function(t) {
                                    return null == t ? t : {
                                        data: (0, n.exists)(t, "data") ? t.data.map(s) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.v1BatchPost = function(t, n) {
                return a(this, void 0, void 0, function() {
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1BatchPostRaw(t, n)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r
        }(n.BaseAPI),
        g = function(t) {
            function r() {
                return null !== t && t.apply(this, arguments) || this
            }
            return i(r, t), r.prototype.v1BundlesThumbnailsGetRaw = function(t, r) {
                return a(this, void 0, void 0, function() {
                    var i, a, c;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === t.bundleIds || void 0 === t.bundleIds) throw new n.RequiredError("bundleIds", "Required parameter requestParameters.bundleIds was null or undefined when calling v1BundlesThumbnailsGet.");
                                return i = {}, t.bundleIds && (i.bundleIds = t.bundleIds.join(n.COLLECTION_FORMATS.csv)), void 0 !== t.size && (i.size = t.size), void 0 !== t.format && (i.format = t.format), void 0 !== t.isCircular && (i.isCircular = t.isCircular), a = {}, [4, this.request({
                                    path: "/v1/bundles/thumbnails",
                                    method: "GET",
                                    headers: a,
                                    query: i
                                }, r)];
                            case 1:
                                return c = o.sent(), [2, new n.JSONApiResponse(c, function(t) {
                                    return d(t)
                                })]
                        }
                    })
                })
            }, r.prototype.v1BundlesThumbnailsGet = function(t, n) {
                return a(this, void 0, void 0, function() {
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1BundlesThumbnailsGetRaw(t, n)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r
        }(n.BaseAPI),
        h = function(t) {
            function r() {
                return null !== t && t.apply(this, arguments) || this
            }
            return i(r, t), r.prototype.v1DeveloperProductsIconsGetRaw = function(t, r) {
                return a(this, void 0, void 0, function() {
                    var i, a, c;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === t.developerProductIds || void 0 === t.developerProductIds) throw new n.RequiredError("developerProductIds", "Required parameter requestParameters.developerProductIds was null or undefined when calling v1DeveloperProductsIconsGet.");
                                return i = {}, t.developerProductIds && (i.developerProductIds = t.developerProductIds.join(n.COLLECTION_FORMATS.csv)), void 0 !== t.size && (i.size = t.size), void 0 !== t.format && (i.format = t.format), void 0 !== t.isCircular && (i.isCircular = t.isCircular), a = {}, [4, this.request({
                                    path: "/v1/developer-products/icons",
                                    method: "GET",
                                    headers: a,
                                    query: i
                                }, r)];
                            case 1:
                                return c = o.sent(), [2, new n.JSONApiResponse(c, function(t) {
                                    return d(t)
                                })]
                        }
                    })
                })
            }, r.prototype.v1DeveloperProductsIconsGet = function(t, n) {
                return a(this, void 0, void 0, function() {
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1DeveloperProductsIconsGetRaw(t, n)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r
        }(n.BaseAPI),
        b = function(t) {
            function r() {
                return null !== t && t.apply(this, arguments) || this
            }
            return i(r, t), r.prototype.v1GamePassesGetRaw = function(t, r) {
                return a(this, void 0, void 0, function() {
                    var i, a, c;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === t.gamePassIds || void 0 === t.gamePassIds) throw new n.RequiredError("gamePassIds", "Required parameter requestParameters.gamePassIds was null or undefined when calling v1GamePassesGet.");
                                return i = {}, t.gamePassIds && (i.gamePassIds = t.gamePassIds.join(n.COLLECTION_FORMATS.csv)), void 0 !== t.size && (i.size = t.size), void 0 !== t.format && (i.format = t.format), void 0 !== t.isCircular && (i.isCircular = t.isCircular), a = {}, [4, this.request({
                                    path: "/v1/game-passes",
                                    method: "GET",
                                    headers: a,
                                    query: i
                                }, r)];
                            case 1:
                                return c = o.sent(), [2, new n.JSONApiResponse(c, function(t) {
                                    return d(t)
                                })]
                        }
                    })
                })
            }, r.prototype.v1GamePassesGet = function(t, n) {
                return a(this, void 0, void 0, function() {
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1GamePassesGetRaw(t, n)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r
        }(n.BaseAPI),
        y = function(t) {
            function r() {
                return null !== t && t.apply(this, arguments) || this
            }
            return i(r, t), r.prototype.v1GamesIconsGetRaw = function(t, r) {
                return a(this, void 0, void 0, function() {
                    var i, a, c;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === t.universeIds || void 0 === t.universeIds) throw new n.RequiredError("universeIds", "Required parameter requestParameters.universeIds was null or undefined when calling v1GamesIconsGet.");
                                return i = {}, t.universeIds && (i.universeIds = t.universeIds.join(n.COLLECTION_FORMATS.csv)), void 0 !== t.returnPolicy && (i.returnPolicy = t.returnPolicy), void 0 !== t.size && (i.size = t.size), void 0 !== t.format && (i.format = t.format), void 0 !== t.isCircular && (i.isCircular = t.isCircular), a = {}, [4, this.request({
                                    path: "/v1/games/icons",
                                    method: "GET",
                                    headers: a,
                                    query: i
                                }, r)];
                            case 1:
                                return c = o.sent(), [2, new n.JSONApiResponse(c, function(t) {
                                    return d(t)
                                })]
                        }
                    })
                })
            }, r.prototype.v1GamesIconsGet = function(t, n) {
                return a(this, void 0, void 0, function() {
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1GamesIconsGetRaw(t, n)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.v1GamesMultigetThumbnailsGetRaw = function(t, r) {
                return a(this, void 0, void 0, function() {
                    var i, a, c;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === t.universeIds || void 0 === t.universeIds) throw new n.RequiredError("universeIds", "Required parameter requestParameters.universeIds was null or undefined when calling v1GamesMultigetThumbnailsGet.");
                                return i = {}, t.universeIds && (i.universeIds = t.universeIds.join(n.COLLECTION_FORMATS.csv)), void 0 !== t.countPerUniverse && (i.countPerUniverse = t.countPerUniverse), void 0 !== t.defaults && (i.defaults = t.defaults), void 0 !== t.size && (i.size = t.size), void 0 !== t.format && (i.format = t.format), void 0 !== t.isCircular && (i.isCircular = t.isCircular), a = {}, [4, this.request({
                                    path: "/v1/games/multiget/thumbnails",
                                    method: "GET",
                                    headers: a,
                                    query: i
                                }, r)];
                            case 1:
                                return c = o.sent(), [2, new n.JSONApiResponse(c, function(t) {
                                    return null == t ? t : {
                                        data: (0, n.exists)(t, "data") ? t.data.map(u) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.v1GamesMultigetThumbnailsGet = function(t, n) {
                return a(this, void 0, void 0, function() {
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1GamesMultigetThumbnailsGetRaw(t, n)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.v1GamesUniverseIdThumbnailsGetRaw = function(t, r) {
                return a(this, void 0, void 0, function() {
                    var i, a, c;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === t.universeId || void 0 === t.universeId) throw new n.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1GamesUniverseIdThumbnailsGet.");
                                if (null === t.thumbnailIds || void 0 === t.thumbnailIds) throw new n.RequiredError("thumbnailIds", "Required parameter requestParameters.thumbnailIds was null or undefined when calling v1GamesUniverseIdThumbnailsGet.");
                                return i = {}, t.thumbnailIds && (i.thumbnailIds = t.thumbnailIds.join(n.COLLECTION_FORMATS.csv)), void 0 !== t.size && (i.size = t.size), void 0 !== t.format && (i.format = t.format), void 0 !== t.isCircular && (i.isCircular = t.isCircular), a = {}, [4, this.request({
                                    path: "/v1/games/{universeId}/thumbnails".replace("{".concat("universeId", "}"), encodeURIComponent(String(t.universeId))),
                                    method: "GET",
                                    headers: a,
                                    query: i
                                }, r)];
                            case 1:
                                return c = o.sent(), [2, new n.JSONApiResponse(c, function(t) {
                                    return d(t)
                                })]
                        }
                    })
                })
            }, r.prototype.v1GamesUniverseIdThumbnailsGet = function(t, n) {
                return a(this, void 0, void 0, function() {
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1GamesUniverseIdThumbnailsGetRaw(t, n)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r
        }(n.BaseAPI),
        _ = function(t) {
            function r() {
                return null !== t && t.apply(this, arguments) || this
            }
            return i(r, t), r.prototype.v1GroupsIconsGetRaw = function(t, r) {
                return a(this, void 0, void 0, function() {
                    var i, a, c;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === t.groupIds || void 0 === t.groupIds) throw new n.RequiredError("groupIds", "Required parameter requestParameters.groupIds was null or undefined when calling v1GroupsIconsGet.");
                                return i = {}, t.groupIds && (i.groupIds = t.groupIds.join(n.COLLECTION_FORMATS.csv)), void 0 !== t.size && (i.size = t.size), void 0 !== t.format && (i.format = t.format), void 0 !== t.isCircular && (i.isCircular = t.isCircular), a = {}, [4, this.request({
                                    path: "/v1/groups/icons",
                                    method: "GET",
                                    headers: a,
                                    query: i
                                }, r)];
                            case 1:
                                return c = o.sent(), [2, new n.JSONApiResponse(c, function(t) {
                                    return d(t)
                                })]
                        }
                    })
                })
            }, r.prototype.v1GroupsIconsGet = function(t, n) {
                return a(this, void 0, void 0, function() {
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1GroupsIconsGetRaw(t, n)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r
        }(n.BaseAPI),
        I = function(t) {
            function r() {
                return null !== t && t.apply(this, arguments) || this
            }
            return i(r, t), r.prototype.v1UsersOutfit3dGetRaw = function(t, r) {
                return a(this, void 0, void 0, function() {
                    var i, a, u;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === t.outfitId || void 0 === t.outfitId) throw new n.RequiredError("outfitId", "Required parameter requestParameters.outfitId was null or undefined when calling v1UsersOutfit3dGet.");
                                return i = {}, void 0 !== t.outfitId && (i.outfitId = t.outfitId), a = {}, [4, this.request({
                                    path: "/v1/users/outfit-3d",
                                    method: "GET",
                                    headers: a,
                                    query: i
                                }, r)];
                            case 1:
                                return u = o.sent(), [2, new n.JSONApiResponse(u, function(t) {
                                    return c(t)
                                })]
                        }
                    })
                })
            }, r.prototype.v1UsersOutfit3dGet = function(t, n) {
                return a(this, void 0, void 0, function() {
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1UsersOutfit3dGetRaw(t, n)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.v1UsersOutfitsGetRaw = function(t, r) {
                return a(this, void 0, void 0, function() {
                    var i, a, c;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === t.userOutfitIds || void 0 === t.userOutfitIds) throw new n.RequiredError("userOutfitIds", "Required parameter requestParameters.userOutfitIds was null or undefined when calling v1UsersOutfitsGet.");
                                return i = {}, t.userOutfitIds && (i.userOutfitIds = t.userOutfitIds.join(n.COLLECTION_FORMATS.csv)), void 0 !== t.size && (i.size = t.size), void 0 !== t.format && (i.format = t.format), void 0 !== t.isCircular && (i.isCircular = t.isCircular), a = {}, [4, this.request({
                                    path: "/v1/users/outfits",
                                    method: "GET",
                                    headers: a,
                                    query: i
                                }, r)];
                            case 1:
                                return c = o.sent(), [2, new n.JSONApiResponse(c, function(t) {
                                    return d(t)
                                })]
                        }
                    })
                })
            }, r.prototype.v1UsersOutfitsGet = function(t, n) {
                return a(this, void 0, void 0, function() {
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1UsersOutfitsGetRaw(t, n)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r
        }(n.BaseAPI),
        k = function(t) {
            function r() {
                return null !== t && t.apply(this, arguments) || this
            }
            return i(r, t), r.prototype.v1PlacesGameiconsGetRaw = function(t, r) {
                return a(this, void 0, void 0, function() {
                    var i, a, c;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === t.placeIds || void 0 === t.placeIds) throw new n.RequiredError("placeIds", "Required parameter requestParameters.placeIds was null or undefined when calling v1PlacesGameiconsGet.");
                                return i = {}, t.placeIds && (i.placeIds = t.placeIds.join(n.COLLECTION_FORMATS.csv)), void 0 !== t.returnPolicy && (i.returnPolicy = t.returnPolicy), void 0 !== t.size && (i.size = t.size), void 0 !== t.format && (i.format = t.format), void 0 !== t.isCircular && (i.isCircular = t.isCircular), a = {}, [4, this.request({
                                    path: "/v1/places/gameicons",
                                    method: "GET",
                                    headers: a,
                                    query: i
                                }, r)];
                            case 1:
                                return c = o.sent(), [2, new n.JSONApiResponse(c, function(t) {
                                    return d(t)
                                })]
                        }
                    })
                })
            }, r.prototype.v1PlacesGameiconsGet = function(t, n) {
                return a(this, void 0, void 0, function() {
                    return o(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.v1PlacesGameiconsGetRaw(t, n)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r
        }(n.BaseAPI);
    t.s(["AssetsApi", 0, m, "AvatarApi", 0, f, "BadgesApi", 0, v, "BatchApi", 0, p, "BundlesApi", 0, g, "DeveloperProductsApi", 0, h, "GamePassesApi", 0, b, "GamesApi", 0, y, "GroupEmblemApi", 0, _, "OutfitsApi", 0, I, "PlacesApi", 0, k, "RobloxThumbnailsApisModelsThumbnailBatchRequestTypeEnum", 0, {
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
    }, "RobloxWebResponsesThumbnailsThumbnailBatchResponseStateEnum", 0, {
        Error: "Error",
        Completed: "Completed",
        InReview: "InReview",
        Pending: "Pending",
        Blocked: "Blocked",
        TemporarilyUnavailable: "TemporarilyUnavailable"
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
}, 958885, t => {
    "use strict";
    var n = t.i(677753),
        r = t.i(620140),
        i = t.i(416340),
        a = t.i(695763),
        o = t.i(338078),
        c = t.i(95656),
        u = t.i(252842);

    function l() {
        if (void 0 === d) throw Error("Most call thumbnailsClient before using getThumbnailsClient");
        return d
    }(s = f || (f = {})).assetThumbnail = "assetThumbnail", s.avatarHeadshot = "avatarHeadshot", s.avatar = "avatar", s.bundleThumbnail = "bundleThumbnail", s.gameIcon = "gameIcon", s.groupIcon = "groupIcon", s.badgeIcon = "badgeIcon", s.gamePassIcon = "gamePassIcon", s.developerProductIcon = "developerProductIcon", s.userOutfit = "userOutfit", s.gameThumbnail = "gameThumbnail", s.universeThumbnail = "universeThumbnail", s.placeIcon = "placeIcon", s.autoGeneratedPlaceThumbnail = "autoGeneratedPlaceThumbnail", s.autoGeneratedPlaceIcon = "autoGeneratedPlaceIcon";
    var s, d, m, f, v, p, g, h = ((m = {})[f.assetThumbnail] = r.V1AssetsGetSizeEnum._150x150, m[f.avatarHeadshot] = r.V1UsersAvatarHeadshotGetSizeEnum._150x150, m[f.avatar] = r.V1UsersAvatarGetSizeEnum._150x150, m[f.bundleThumbnail] = r.V1BundlesThumbnailsGetSizeEnum._150x150, m[f.gameIcon] = r.V1GamesIconsGetSizeEnum._150x150, m[f.groupIcon] = r.V1GroupsIconsGetSizeEnum._150x150, m[f.badgeIcon] = r.V1BadgesIconsGetSizeEnum._150x150, m[f.gamePassIcon] = r.V1GamePassesGetSizeEnum._150x150, m[f.developerProductIcon] = r.V1DeveloperProductsIconsGetSizeEnum._150x150, m[f.userOutfit] = r.V1UsersOutfitsGetSizeEnum._150x150, m[f.gameThumbnail] = r.V1GamesUniverseIdThumbnailsGetSizeEnum._576x324, m[f.universeThumbnail] = r.V1GamesMultigetThumbnailsGetSizeEnum._576x324, m[f.placeIcon] = r.V1PlacesGameiconsGetSizeEnum._150x150, m[f.autoGeneratedPlaceThumbnail] = r.V1GamesUniverseIdThumbnailsGetSizeEnum._768x432, m[f.autoGeneratedPlaceIcon] = r.V1GamesIconsGetSizeEnum._512x512, m);

    function b(t, n, r, i) {
        return new(r || (r = Promise))(function(a, o) {
            function c(t) {
                try {
                    l(i.next(t))
                } catch (t) {
                    o(t)
                }
            }

            function u(t) {
                try {
                    l(i.throw(t))
                } catch (t) {
                    o(t)
                }
            }

            function l(t) {
                var n;
                t.done ? a(t.value) : ((n = t.value) instanceof r ? n : new r(function(t) {
                    t(n)
                })).then(c, u)
            }
            l((i = i.apply(t, n || [])).next())
        })
    }

    function y(t, n) {
        var r, i, a, o = {
                label: 0,
                sent: function() {
                    if (1 & a[0]) throw a[1];
                    return a[1]
                },
                trys: [],
                ops: []
            },
            c = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return c.next = u(0), c.throw = u(1), c.return = u(2), "function" == typeof Symbol && (c[Symbol.iterator] = function() {
            return this
        }), c;

        function u(u) {
            return function(l) {
                var s = [u, l];
                if (r) throw TypeError("Generator is already executing.");
                for (; c && (c = 0, s[0] && (o = 0)), o;) try {
                    if (r = 1, i && (a = 2 & s[0] ? i.return : s[0] ? i.throw || ((a = i.return) && a.call(i), 0) : i.next) && !(a = a.call(i, s[1])).done) return a;
                    switch (i = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                        case 0:
                        case 1:
                            a = s;
                            break;
                        case 4:
                            return o.label++, {
                                value: s[1],
                                done: !1
                            };
                        case 5:
                            o.label++, i = s[1], s = [0];
                            continue;
                        case 7:
                            s = o.ops.pop(), o.trys.pop();
                            continue;
                        default:
                            if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                o = 0;
                                continue
                            }
                            if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                o.label = s[1];
                                break
                            }
                            if (6 === s[0] && o.label < a[1]) {
                                o.label = a[1], a = s;
                                break
                            }
                            if (a && o.label < a[2]) {
                                o.label = a[2], o.ops.push(s);
                                break
                            }
                            a[2] && o.ops.pop(), o.trys.pop();
                            continue
                    }
                    s = n.call(t, o)
                } catch (t) {
                    s = [6, t], i = 0
                } finally {
                    r = a = 0
                }
                if (5 & s[0]) throw s[1];
                return {
                    value: s[0] ? s[1] : void 0,
                    done: !0
                }
            }
        }
    }(_ = v || (v = {}))[_.maxRetryAttempts = 10] = "maxRetryAttempts", _[_.minCooldown = 1e3] = "minCooldown", _[_.maxCooldown = 3e4] = "maxCooldown", (I = p || (p = {})).png = "png", I.jpg = "jpg", I.jpeg = "jpeg", I.webp = "webp", (k = g || (g = {})).PlaceHolder = "PlaceHolder", k.AutoGenerated = "AutoGenerated", k.ForceAutoGenerated = "ForceAutoGenerated", k.ForcePlaceHolder = "ForcePlaceHolder", "function" == typeof SuppressedError && SuppressedError;
    var _, I, k, w, x, S = (0, a.makeStyles)()(function(t, n) {
            return {
                container: {
                    paddingTop: "".concat(100 * n.sizeRatio, "%"),
                    position: "relative",
                    height: "auto",
                    width: "100%",
                    overflow: "hidden"
                },
                background: {
                    backgroundColor: t.palette.action.focus
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
        z = "".concat("https://assets.create.roblox.com/4c911cd452dcbbc3cd49c7458128a242d2a87e28/assets", "/thumbnails"),
        A = "".concat(z, "/broken.svg"),
        U = "".concat(z, "/not_approved.svg"),
        P = "".concat(z, "/review_pending.svg"),
        O = "".concat(z, "/unavailable.svg");
    (w || (w = {})).Time = "time", (x || (x = {})).LoadThumbnail = "loadThumbnail";
    var N = function(t, n) {
            var r = n || "Grasshopper",
                i = new c.Configuration({
                    baseUrl: "".concat(t, "/").concat(r)
                }),
                a = new c.Tracker(i);
            return {
                sendEvent: function(t) {
                    var n = {
                        target: r,
                        eventType: t.eventType,
                        context: t.context,
                        localTime: new Date,
                        additionalProperties: t.additionalProperties
                    };
                    return a.sendEventViaImg(n)
                }
            }
        },
        D = (0, i.createContext)({});
    D.displayName = "ThumbnailsContext";
    var Z, j = function(t) {
            var n = t.thumbnailUrl,
                a = t.thumbnailStatus,
                c = t.imgClassName,
                u = t.isPendingResponse,
                l = t.isPendingNewTarget,
                s = t.containerClass,
                d = t.alt,
                m = t.includeBackground,
                f = t.sizeRatio,
                v = t.startTime,
                p = t.skeletonVariant,
                g = t.onLoadThumbnailStatus,
                h = void 0 === g ? void 0 : g,
                b = S({
                    sizeRatio: f
                }),
                y = b.classes,
                _ = y.container,
                I = y.background,
                k = y.img,
                z = y.completed,
                N = y.loading,
                Z = b.cx,
                j = Z(_, s),
                T = (0, i.useState)(!1),
                E = T[0],
                C = T[1],
                $ = (0, i.useState)(!1),
                R = $[0],
                L = $[1],
                G = (0, i.useContext)(D).eventTracker,
                M = (0, i.useMemo)(function() {
                    switch (a) {
                        case r.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.Error:
                            return A;
                        case r.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.Blocked:
                            return U;
                        case r.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.InReview:
                            return P;
                        case r.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.Pending:
                            return u ? "" : O;
                        case r.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.Completed:
                        default:
                            return ""
                    }
                }, [u, a]);
            return i.default.createElement("span", {
                className: Z(j, l || u || !m ? "" : I)
            }, l || u ? i.default.createElement(o.Skeleton, {
                className: k,
                variant: void 0 === p ? "rectangular" : p,
                animate: !l
            }) : i.default.createElement("img", {
                className: Z(k, c, E ? z : N),
                src: null != n ? n : M,
                alt: d,
                onLoad: function() {
                    var t;
                    if (C(!0), G && !R) {
                        var r = performance.now() - v;
                        G.sendEvent({
                            eventType: x.LoadThumbnail,
                            context: w.Time,
                            currentUrl: null == (t = null == window ? void 0 : window.location) ? void 0 : t.href,
                            additionalProperties: {
                                elapsedTime: r,
                                thumbnailStatus: a,
                                thumbnailUrl: null != n ? n : M,
                                sizeRatio: f
                            }
                        }), L(!0)
                    }
                    void 0 !== h && h(a)
                }
            }))
        },
        T = function(t) {
            var n;
            return null != (n = null == t ? void 0 : t.toString()) ? n : ""
        },
        E = new u.BatchRequestFactory,
        C = {
            getFailureCooldown: E.createExponentialBackoffCooldown(v.minCooldown, v.maxCooldown),
            maxRetryAttempts: v.maxRetryAttempts,
            batchSize: 50,
            processBatchWaitTime: 0
        },
        $ = {},
        R = {},
        L = function(t, n, r, i, a) {
            if (a && i && delete R[i], !(i in R)) {
                var o = function(t, n) {
                    if (n in $) return $[n];
                    var r = E.createRequestProcessor(t, T, C);
                    return $[n] = r, r
                }(n, r);
                a && o.invalidateItem(t);
                var c = o.queueItem(t).catch(function(t) {
                    return Promise.reject(t)
                });
                R[i] = c
            }
            return R[i]
        },
        G = {},
        M = function(t, n, i, a, o, c) {
            void 0 === o && (o = p.webp), void 0 === c && (c = g.PlaceHolder);
            var s, d, m, v = (d = l(), (m = ((s = {})[f.assetThumbnail] = d.getAssets, s[f.avatarHeadshot] = d.getAvatarHeadshots, s[f.avatar] = d.getAvatars, s[f.bundleThumbnail] = d.getBundles, s[f.gameIcon] = d.getGameIcons, s[f.groupIcon] = d.getGroupIcons, s[f.badgeIcon] = d.getBadgeIcons, s[f.gamePassIcon] = d.getGamePassIcons, s[f.developerProductIcon] = d.getDeveloperProductIcons, s[f.userOutfit] = d.getUserOutfits, s[f.gameThumbnail] = d.getGameThumbnails, s[f.universeThumbnail] = d.getUniverseThumbnails, s[f.placeIcon] = d.getPlaceIcons, s[f.autoGeneratedPlaceThumbnail] = d.getAutoGeneratedPlaceImage, s[f.autoGeneratedPlaceIcon] = d.getAutoGeneratedPlaceImage, s)[i]) || console.debug("Missing urlConfig implementation for thumbnail type: ".concat(i)), m);
            return new Promise(function(l, s) {
                var d = n.map(function(t) {
                    return t.itemId
                });
                if (v) {
                    var m = (new Date).getTime(),
                        p = [];
                    p = i === f.assetThumbnail || i === f.gameIcon || i === f.placeIcon ? [d, c, a, o] : i === f.gameThumbnail ? [t, d, a, o] : [d, a, o], v.apply(null, p).then(function(t) {
                        var i, a = {};
                        (null != (i = null == t ? void 0 : t.data) ? i : []).forEach(function(t) {
                            a[T(t.targetId)] = t
                        }), n.forEach(function(t) {
                            var n = t.itemId,
                                i = T(n);
                            Object.prototype.hasOwnProperty.call(a, i) && a[i] ? a[i].state === r.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.Pending && (delete a[i], G[i] || (G[i] = {
                                startTime: m
                            })) : a[i] = {
                                targetId: n,
                                state: r.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.Error
                            }
                        }), l(a)
                    }).catch(function() {
                        l({})
                    })
                } else s(u.BatchRequestError.unretriableFailure)
            })
        },
        B = function(t, n, i, a, o, c, u) {
            void 0 === a && (a = p.webp), void 0 === o && (o = g.PlaceHolder), void 0 === u && (u = !1);
            var l, s, d, m, f = c || h[t] || r.V1UsersAvatarHeadshotGetSizeEnum._150x150;
            if (!i) return new Promise(function(t, n) {
                n("TargetId can not be empty.")
            });
            if (!t) return new Promise(function(t, n) {
                n("ThumbnailType can not be empty.")
            });
            var v = (l = a, s = o, void 0 === l && (l = p.webp), void 0 === s && (s = g.PlaceHolder), "thumbnail_type:".concat(t, "_baseTargetId:").concat(n, "_targetId:").concat(i, "_requestedSize:").concat(f, "_format:").concat(l, "_returnPolicy:").concat(s));
            return L(i, function(r) {
                return M(n, r, t, f, a, o)
            }, (d = a, m = o, void 0 === d && (d = p.webp), void 0 === m && (m = g.PlaceHolder), "".concat(n, ":").concat(t, ":").concat(f, ":").concat(d, ":").concat(m)), v, u)
        },
        J = {
            getThumbnailImage: function(t, n, r, i, a) {
                return void 0 === r && (r = g.PlaceHolder), void 0 === i && (i = p.webp), B(t, 0, n, i, r, a)
            },
            reloadThumbnailImage: function(t, n, r, i, a) {
                return void 0 === r && (r = g.PlaceHolder), void 0 === i && (i = p.webp), B(t, 0, n, i, r, a, !0)
            },
            getThumbnailImageWithBaseTarget: function(t, n, r, i, a, o) {
                return void 0 === i && (i = g.PlaceHolder), void 0 === a && (a = p.webp), B(t, n, r, a, i, o)
            }
        },
        V = (0, i.forwardRef)(function(t, n) {
            var a = this,
                o = t.type,
                c = t.baseTargetId,
                u = void 0 === c ? 0 : c,
                l = t.targetId,
                s = t.imgClassName,
                d = void 0 === s ? "" : s,
                m = t.containerClass,
                v = t.returnPolicy,
                h = void 0 === v ? g.PlaceHolder : v,
                _ = t.alt,
                I = t.skeletonVariant,
                k = t.isPendingNewTarget,
                w = t.includeBackground,
                x = t.size,
                S = t.onLoadThumbnailStatus,
                z = t.format,
                A = void 0 === z ? p.webp : z,
                U = (0, i.useState)(),
                P = U[0],
                O = U[1];
            (0, i.useEffect)(function() {
                var t = !0;
                return b(a, void 0, void 0, function() {
                        var n;
                        return y(this, function(r) {
                            switch (r.label) {
                                case 0:
                                    return A !== p.webp && O(A), [4, function() {
                                        return b(this, void 0, void 0, function() {
                                            return y(this, function(t) {
                                                return void 0 === Z && (Z = new Promise(function(t) {
                                                    try {
                                                        var n = new Image;
                                                        n.onload = function() {
                                                            return t(n.width > 0 && n.height > 0)
                                                        }, n.onerror = function() {
                                                            return t(!1)
                                                        }, n.src = "data:image/webp;base64,UklGRkoAAABXRUJQVlA4WAoAAAAQAAAAAAAAAAAAQUxQSAwAAAARBxAR/Q9ERP8DAABWUDggGAAAABQBAJ0BKgEAAQAAAP4AAA3AAP7mtQAAAA=="
                                                    } catch (n) {
                                                        t(!0)
                                                    }
                                                })), [2, Z]
                                            })
                                        })
                                    }()];
                                case 1:
                                    return n = r.sent(), t && O(n ? A : p.png), [2]
                            }
                        })
                    }),
                    function() {
                        t = !1
                    }
            }, [A]);
            var N = (0, i.useState)(r.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.Pending),
                D = N[0],
                T = N[1],
                E = (0, i.useState)(),
                C = E[0],
                $ = E[1],
                R = (0, i.useState)(!0),
                L = R[0],
                G = R[1],
                M = (0, i.useState)(performance.now())[0],
                B = (0, i.useMemo)(function() {
                    return o === f.gameThumbnail || o === f.universeThumbnail ? .5625 : 1
                }, [o]);
            return (0, i.useImperativeHandle)(n, function() {
                return {
                    refreshThumbnail: function() {
                        J.reloadThumbnailImage(o, l, h, P).then(function(t) {
                            var n = t.state,
                                i = t.imageUrl;
                            T(null != n ? n : r.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.Pending), $(i)
                        }, function(t) {
                            console.log(t)
                        }).finally(function() {
                            G(!1)
                        })
                    }
                }
            }), (0, i.useEffect)(function() {
                var t = !1;
                return G(!0), void 0 === P || (u ? J.getThumbnailImageWithBaseTarget(o, u, l, h, P, x) : J.getThumbnailImage(o, l, h, P, x)).then(function(n) {
                        var i = n.state,
                            a = n.imageUrl;
                        t || (T(null != i ? i : r.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.Pending), $(a))
                    }, function(t) {
                        console.log(t)
                    }).finally(function() {
                        t || G(!1)
                    }),
                    function() {
                        t = !0
                    }
            }, [o, u, l, d, P, h, x]), i.default.createElement(j, {
                thumbnailUrl: C,
                thumbnailStatus: D,
                skeletonVariant: I,
                imgClassName: d,
                isPendingResponse: L,
                isPendingNewTarget: void 0 !== k && k,
                containerClass: void 0 === m ? "" : m,
                alt: _,
                includeBackground: void 0 !== w && w,
                sizeRatio: B,
                startTime: M,
                onLoadThumbnailStatus: void 0 === S ? void 0 : S
            })
        });
    t.s(["ReturnPolicy", 0, g, "Thumbnail2d", 0, V, "ThumbnailClient", 0, J, "ThumbnailFormat", 0, p, "ThumbnailTypes", 0, f, "ThumbnailsProvider", 0, function(t) {
        var n = t.baseUrl,
            r = t.targetNamespace,
            a = t.children,
            o = (0, i.useMemo)(function() {
                return {
                    eventTracker: N(n, r)
                }
            }, [n, r]);
        return i.default.createElement(D.Provider, {
            value: o
        }, a)
    }, "createThumbnailsClient", 0, function(t) {
        var i = new r.AssetsApi(new n.Configuration({
                basePath: t,
                credentials: "include"
            })),
            a = new r.AvatarApi(new n.Configuration({
                basePath: t,
                credentials: "include"
            })),
            o = new r.BadgesApi(new n.Configuration({
                basePath: t,
                credentials: "include"
            })),
            c = new r.BundlesApi(new n.Configuration({
                basePath: t,
                credentials: "include"
            })),
            u = new r.DeveloperProductsApi(new n.Configuration({
                basePath: t,
                credentials: "include"
            })),
            l = new r.GamePassesApi(new n.Configuration({
                basePath: t,
                credentials: "include"
            })),
            s = new r.GamesApi(new n.Configuration({
                basePath: t,
                credentials: "include"
            })),
            m = new r.GroupEmblemApi(new n.Configuration({
                basePath: t,
                credentials: "include"
            })),
            f = new r.OutfitsApi(new n.Configuration({
                basePath: t,
                credentials: "include"
            })),
            v = new r.PlacesApi(new n.Configuration({
                basePath: t,
                credentials: "include"
            })),
            p = new r.BatchApi(new n.Configuration({
                basePath: t,
                credentials: "include"
            }));
        d = {
            getAssets: function(t, n, r, a, o) {
                return i.v1AssetsGet({
                    assetIds: t,
                    returnPolicy: n,
                    size: r,
                    format: a,
                    isCircular: o
                })
            },
            getAvatarHeadshots: function(t, n, r, i) {
                return a.v1UsersAvatarHeadshotGet({
                    userIds: t,
                    size: n,
                    format: r,
                    isCircular: i
                })
            },
            getAvatars: function(t, n, r, i) {
                return a.v1UsersAvatarGet({
                    userIds: t,
                    size: n,
                    format: r,
                    isCircular: i
                })
            },
            getBundles: function(t, n, r, i) {
                return c.v1BundlesThumbnailsGet({
                    bundleIds: t,
                    size: n,
                    format: r,
                    isCircular: i
                })
            },
            getGameIcons: function(t, n, r, i, a) {
                return s.v1GamesIconsGet({
                    universeIds: t,
                    returnPolicy: n,
                    size: r,
                    format: i,
                    isCircular: a
                })
            },
            getGroupIcons: function(t, n, r, i) {
                return m.v1GroupsIconsGet({
                    groupIds: t,
                    size: n,
                    format: r,
                    isCircular: i
                })
            },
            getBadgeIcons: function(t, n, r, i) {
                return o.v1BadgesIconsGet({
                    badgeIds: t,
                    size: n,
                    format: r,
                    isCircular: i
                })
            },
            getGamePassIcons: function(t, n, r, i) {
                return l.v1GamePassesGet({
                    gamePassIds: t,
                    size: n,
                    format: r,
                    isCircular: i
                })
            },
            getDeveloperProductIcons: function(t, n, r, i) {
                return u.v1DeveloperProductsIconsGet({
                    developerProductIds: t,
                    size: n,
                    format: r,
                    isCircular: i
                })
            },
            getUserOutfits: function(t, n, r, i) {
                return f.v1UsersOutfitsGet({
                    userOutfitIds: t,
                    size: n,
                    format: r,
                    isCircular: i
                })
            },
            getGameThumbnails: function(t, n, r, i, a) {
                return s.v1GamesUniverseIdThumbnailsGet({
                    universeId: t,
                    thumbnailIds: n,
                    size: r,
                    format: i,
                    isCircular: a
                })
            },
            getUniverseThumbnails: function(t, n, r, i) {
                return s.v1GamesMultigetThumbnailsGet({
                    universeIds: t,
                    countPerUniverse: 1,
                    defaults: !0,
                    size: n,
                    format: r,
                    isCircular: i
                }).then(function(t) {
                    var n, r = null == t ? void 0 : t.data;
                    return {
                        data: null != (n = null == r ? void 0 : r.map(function(t) {
                            var n, r = null == (n = t.thumbnails) ? void 0 : n[0];
                            return {
                                targetId: t.universeId,
                                state: null == r ? void 0 : r.state,
                                imageUrl: null == r ? void 0 : r.imageUrl
                            }
                        })) ? n : []
                    }
                })
            },
            getPlaceIcons: function(t, n, r, i, a) {
                return v.v1PlacesGameiconsGet({
                    placeIds: t,
                    returnPolicy: n,
                    size: r,
                    format: i,
                    isCircular: a
                })
            },
            getAutoGeneratedPlaceImage: function(t, n, i) {
                var a = t.map(function(t) {
                    return {
                        targetId: t,
                        type: r.RobloxThumbnailsApisModelsThumbnailBatchRequestTypeEnum.GameIcon,
                        size: n,
                        format: i
                    }
                });
                return p.v1BatchPost({
                    requests: a
                })
            },
            getBatchThumbnails: function(t, n, r, i, a) {
                var o = t.map(function(t) {
                    return {
                        targetId: t,
                        type: n,
                        size: r,
                        format: i,
                        isCircular: a
                    }
                });
                return p.v1BatchPost({
                    requests: o
                })
            }
        }
    }, "getThumbnailsClient", 0, l])
}, 338078, t => {
    "use strict";
    let n, r, i, a;
    var o = t.i(569384),
        c = t.i(30941),
        u = t.i(416340),
        l = t.i(936993),
        s = t.i(129210),
        d = t.i(169336),
        m = t.i(477763),
        f = t.i(226319),
        v = t.i(928277),
        p = t.i(221628),
        g = t.i(438365),
        h = t.i(442632),
        b = t.i(945589);

    function y() {
        let t = (0, o._)(["\n  0% {\n    opacity: 1;\n  }\n\n  50% {\n    opacity: 0.4;\n  }\n\n  100% {\n    opacity: 1;\n  }\n"]);
        return y = function() {
            return t
        }, t
    }

    function _() {
        let t = (0, o._)(["\n  0% {\n    transform: translateX(-100%);\n  }\n\n  50% {\n    /* +0.5s of delay between each loop */\n    transform: translateX(100%);\n  }\n\n  100% {\n    transform: translateX(100%);\n  }\n"]);
        return _ = function() {
            return t
        }, t
    }

    function I() {
        let t = (0, o._)(["\n      animation: ", " 2s ease-in-out 0.5s infinite;\n    "]);
        return I = function() {
            return t
        }, t
    }

    function k() {
        let t = (0, o._)(["\n      position: relative;\n      overflow: hidden;\n\n      /* Fix bug in Safari https://bugs.webkit.org/show_bug.cgi?id=68196 */\n      -webkit-mask-image: -webkit-radial-gradient(white, black);\n\n      &::after {\n        animation: ", " 2s linear 0.5s infinite;\n        background: linear-gradient(\n          90deg,\n          transparent,\n          ", ",\n          transparent\n        );\n        content: '';\n        position: absolute;\n        transform: translateX(-100%); /* Avoid flash during server-side hydration */\n        bottom: 0;\n        left: 0;\n        right: 0;\n        top: 0;\n      }\n    "]);
        return k = function() {
            return t
        }, t
    }

    function w(t) {
        return (0, d.g)("MuiSkeleton", t)
    }(0, v.g)("MuiSkeleton", ["root", "text", "rectangular", "rounded", "circular", "pulse", "wave", "withChildren", "fitContent", "heightAuto"]);
    let x = ["animation", "className", "component", "height", "style", "variant", "width"],
        S = (0, b.keyframes)(n || (n = y())),
        z = (0, b.keyframes)(r || (r = _())),
        A = (0, f.s)("span", {
            name: "MuiSkeleton",
            slot: "Root",
            overridesResolver: (t, n) => {
                let {
                    ownerState: r
                } = t;
                return [n.root, n[r.variant], !1 !== r.animation && n[r.animation], r.hasChildren && n.withChildren, r.hasChildren && !r.width && n.fitContent, r.hasChildren && !r.height && n.heightAuto]
            }
        })(t => {
            let {
                theme: n,
                ownerState: r
            } = t, i = String(n.shape.borderRadius).match(/[\d.\-+]*\s*(.*)/)[1] || "px", a = parseFloat(n.shape.borderRadius);
            return (0, m._)({
                display: "block",
                backgroundColor: n.vars ? n.vars.palette.Skeleton.bg : (0, g.a)(n.palette.text.primary, "light" === n.palette.mode ? .11 : .13),
                height: "1.2em"
            }, "text" === r.variant && {
                marginTop: 0,
                marginBottom: 0,
                height: "auto",
                transformOrigin: "0 55%",
                transform: "scale(1, 0.60)",
                borderRadius: "".concat(a).concat(i, "/").concat(Math.round(a / .6 * 10) / 10).concat(i),
                "&:empty:before": {
                    content: '"\\00a0"'
                }
            }, "circular" === r.variant && {
                borderRadius: "50%"
            }, "rounded" === r.variant && {
                borderRadius: (n.vars || n).shape.borderRadius
            }, r.hasChildren && {
                "& > *": {
                    visibility: "hidden"
                }
            }, r.hasChildren && !r.width && {
                maxWidth: "fit-content"
            }, r.hasChildren && !r.height && {
                height: "auto"
            })
        }, t => {
            let {
                ownerState: n
            } = t;
            return "pulse" === n.animation && (0, b.css)(i || (i = I()), S)
        }, t => {
            let {
                ownerState: n,
                theme: r
            } = t;
            return "wave" === n.animation && (0, b.css)(a || (a = k()), z, (r.vars || r).palette.action.hover)
        }),
        U = u.forwardRef(function(t, n) {
            let r = (0, h.u)({
                    props: t,
                    name: "MuiSkeleton"
                }),
                {
                    animation: i = "pulse",
                    className: a,
                    component: o = "span",
                    height: c,
                    style: u,
                    variant: l = "text",
                    width: s
                } = r,
                v = (0, d._)(r, x),
                g = (0, m._)({}, r, {
                    animation: i,
                    component: o,
                    variant: l,
                    hasChildren: !!v.children
                }),
                b = (t => {
                    let {
                        classes: n,
                        variant: r,
                        animation: i,
                        hasChildren: a,
                        width: o,
                        height: c
                    } = t;
                    return (0, f.a)({
                        root: ["root", r, i, a && "withChildren", a && !o && "fitContent", a && !c && "heightAuto"]
                    }, w, n)
                })(g);
            return (0, p.jsx)(A, (0, m._)({
                as: o,
                ref: n,
                className: (0, f.c)(b.root, a),
                ownerState: g
            }, v, {
                style: (0, m._)({
                    width: s,
                    height: c
                }, u)
            }))
        });
    var P = (0, l.default)({
            name: "Skeleton"
        })(function(t) {
            return {
                root: {
                    backgroundColor: t.palette.states.hover
                },
                wave: {
                    backgroundColor: t.palette.states.focus
                },
                rectangular: (0, c._)({}, t.border.radius.large),
                square: {
                    borderRadius: "0px"
                }
            }
        }),
        O = {
            text: "text",
            rectangular: "rectangular",
            circular: "circular",
            square: "rectangular"
        },
        N = (0, u.forwardRef)(function(t, n) {
            var r, i = t.variant,
                a = void 0 === i ? "text" : i,
                o = t.animate,
                l = t.classes,
                d = t.className,
                m = (0, c.a)(t, ["variant", "animate", "classes", "className"]),
                f = P(void 0, {
                    props: {
                        classes: (0, s.default)(l, d)
                    }
                }),
                v = f.classes,
                p = v.square,
                g = v.rectangular,
                h = (0, c.a)(v, ["square", "rectangular"]),
                b = f.cx;
            return u.default.createElement(U, (0, c._)({}, m, {
                variant: O[a],
                animation: !!(void 0 !== o && o) && "wave",
                classes: (0, c._)((0, c._)({}, h), {
                    rectangular: b(g, ((r = {})[p] = "square" === a, r))
                }),
                ref: n
            }))
        });
    t.s(["Skeleton", 0, N], 338078)
}, 438641, 655831, 748089, 932471, 455162, 402171, 61856, 239523, 168722, 490742, 925633, 566387, 176860, t => {
    "use strict";
    let n, r;
    t.s(["BIGINT_FORMAT_RANGES", () => ea, "CONSTANT_CATCH", () => eB, "Class", () => ej, "NUMBER_FORMAT_RANGES", () => ei, "aborted", () => ep, "allowsEval", () => V, "assert", () => b, "assertEqual", () => f, "assertIs", () => g, "assertNever", () => h, "assertNotEqual", () => v, "assignProp", () => O, "attachSchema", () => ey, "base64ToUint8Array", () => eU, "base64urlToUint8Array", () => eO, "cached", () => w, "captureStackTrace", () => B, "cleanEnum", () => eA, "cleanRegex", () => S, "clone", () => Q, "cloneDef", () => C, "codePointLength", () => ew, "constantCatch", () => eJ, "createTransparentProxy", () => et, "defineLazy", () => U, "defineLazyInternal", () => eG, "derived", () => e$, "esc", () => G, "escapeRegex", () => Y, "explicitlyAborted", () => eg, "extend", () => el, "finalizeIssue", () => e_, "floatSafeRemainder", () => z, "getElementAtPath", () => $, "getEnumValues", () => y, "getLengthableOrigin", () => ex, "getParsedType", () => K, "getSizableOrigin", () => eI, "hexToUint8Array", () => eD, "hide", () => eC, "installLazyProp", () => eM, "isObject", () => J, "isPlainObject", () => F, "issue", () => ez, "joinValues", () => _, "jsonStringifyReplacer", () => I, "members", () => eT, "merge", () => em, "mergeDefs", () => E, "normalizeParams", () => ee, "nullish", () => x, "numKeys", () => W, "objectClone", () => P, "omit", () => eu, "optionalKeys", () => er, "own", () => eE, "parsedType", () => eS, "partial", () => ef, "pick", () => eo, "prefixIssues", () => eh, "primitiveTypes", () => H, "promiseAllObject", () => R, "propertyKeyTypes", () => X, "randomString", () => L, "rawShape", () => N, "required", () => ev, "safeExtend", () => ed, "shallowClone", () => q, "slugify", () => M, "stringifyPrimitive", () => en, "toZod", () => p, "uint8ArrayToBase64", () => eP, "uint8ArrayToBase64url", () => eN, "uint8ArrayToHex", () => eZ, "unwrapMessage", () => eb], 748089), t.s(["$ZodAsyncError", () => l, "$ZodEncodeError", () => s, "$brand", () => u, "$constructor", () => c, "NEVER", () => i, "config", () => m, "globalConfig", () => d], 655831);
    let i = Object.freeze({
            status: "aborted"
        }),
        a = {
            value: void 0,
            enumerable: !1
        },
        o = "captureStackTrace" in Error ? Error : null;

    function c(t, n, r, i) {
        var c;

        function u(t) {
            this.def = t, this.constr = f, this.traits = new Set
        }
        u.prototype = {};
        let l = r && new WeakSet;

        function s(i, o) {
            if (i._zod) {
                if (i._zod.traits.has(t)) return
            } else {
                a.value = new u(o);
                try {
                    Object.defineProperty(i, "_zod", a)
                } finally {
                    a.value = void 0
                }
            }
            if (i._zod.traits.add(t), n(i, o), l) {
                let t = Object.getPrototypeOf(i),
                    n = i._zod.constr.prototype,
                    a = t;
                for (; a && a !== n;) a = Object.getPrototypeOf(a);
                let o = null != a ? a : t;
                l.has(o) || (l.add(o), eT(o, r))
            }
            let c = f.prototype;
            for (let t in c) Object.prototype.hasOwnProperty.call(c, t) && (t in i || (i[t] = c[t].bind(i)))
        }
        let d = null != (c = null == i ? void 0 : i.Parent) ? c : Object;
        class m extends d {}

        function f(t) {
            var n;
            let r = (null == i ? void 0 : i.Parent) ? function(t) {
                let n = o;
                if (n) {
                    let r = n.stackTraceLimit;
                    if ("number" == typeof r) {
                        try {
                            n.stackTraceLimit = 0
                        } catch (n) {
                            return o = null, new t
                        }
                        try {
                            return new t
                        } finally {
                            n.stackTraceLimit = r
                        }
                    }
                }
                return new t
            }(m) : this;
            s(r, t);
            let a = r._zod.deferred;
            if (a) {
                for (let t of a) t();
                r._zod.deferred = void 0
            }
            let c = null == (n = globalThis.__zod_globalConfig) ? void 0 : n.postProcessor;
            return c && c(r), r
        }
        return Object.defineProperty(m, "name", {
            value: t
        }), Object.defineProperty(f, "init", {
            value: s
        }), Object.defineProperty(f, Symbol.hasInstance, {
            value: n => {
                var r, a;
                return null != i && !!i.Parent && n instanceof i.Parent || (null == n || null == (a = n._zod) || null == (r = a.traits) ? void 0 : r.has(t))
            }
        }), Object.defineProperty(f, "name", {
            value: t
        }), f
    }
    let u = Symbol("zod_brand");
    class l extends Error {
        constructor() {
            super("Encountered Promise during synchronous parse. Use .parseAsync() instead.")
        }
    }
    class s extends Error {
        constructor(t) {
            super("Encountered unidirectional transform during encode: ".concat(t)), this.name = "ZodEncodeError"
        }
    }
    null != (eV = globalThis).__zod_globalConfig || (eV.__zod_globalConfig = {});
    let d = globalThis.__zod_globalConfig;

    function m(t) {
        return t && Object.assign(d, t), d
    }

    function f(t) {
        return t
    }

    function v(t) {
        return t
    }

    function p() {
        return t => t
    }

    function g(t) {}

    function h(t) {
        throw Error("Unexpected value in exhaustive check")
    }

    function b(t) {}

    function y(t) {
        let n = Object.values(t).filter(t => "number" == typeof t);
        return Object.entries(t).filter(t => {
            let [r, i] = t;
            return -1 === n.indexOf(+r)
        }).map(t => {
            let [n, r] = t;
            return r
        })
    }

    function _(t) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "|";
        return t.map(t => en(t)).join(n)
    }

    function I(t, n) {
        return "bigint" == typeof n ? n.toString() : n
    }
    class k {
        get value() {
            let t = this._getter;
            return void 0 !== t && (this._value = t(), this._getter = void 0), this._value
        }
        constructor(t) {
            this._getter = t, this._value = void 0
        }
    }

    function w(t) {
        return new k(t)
    }

    function x(t) {
        return null == t
    }

    function S(t) {
        let n = +!!t.startsWith("^"),
            r = t.endsWith("$") ? t.length - 1 : t.length;
        return t.slice(n, r)
    }

    function z(t, n) {
        let r = t / n,
            i = Math.round(r),
            a = 4 * Number.EPSILON * Math.max(Math.abs(r), 1);
        return Math.abs(r - i) < a ? 0 : r - i
    }
    let A = Symbol("evaluating");

    function U(t, n, r) {
        let i;
        Object.defineProperty(t, n, {
            get() {
                if (i !== A) return void 0 === i && (i = A, i = r()), i
            },
            set(r) {
                Object.defineProperty(t, n, {
                    value: r
                })
            },
            configurable: !0
        })
    }

    function P(t) {
        return Object.create(Object.getPrototypeOf(t), Object.getOwnPropertyDescriptors(t))
    }

    function O(t, n, r) {
        Object.defineProperty(t, n, {
            value: r,
            writable: !0,
            enumerable: !0,
            configurable: !0
        })
    }

    function N(t) {
        let n = Object.getOwnPropertyDescriptor(t, "shape");
        return (null == n ? void 0 : n.get) ? n.get.raw : null == n ? void 0 : n.value
    }

    function D(t) {
        var n;
        return null != (n = N(t._zod.def)) ? n : t._zod.def.shape
    }

    function Z(t, n, r) {
        Object.defineProperty(t, n, {
            get() {
                let t = r();
                return O(this, n, t), t
            },
            enumerable: !0,
            configurable: !0
        })
    }

    function j(t, n, r) {
        n in t ? O(t, n, r) : t[n] = r
    }

    function T(t, n, r, i) {
        let a = D(n);
        for (let o of r) {
            let r = Object.getOwnPropertyDescriptor(a, o);
            r.enumerable && (r.get ? Z(t, o, () => {
                let t = n._zod.def.shape[o];
                return i ? i(t, o) : t
            }) : j(t, o, i ? i(r.value, o) : r.value))
        }
    }

    function E() {
        for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
        let i = {};
        for (let t of n) Object.assign(i, Object.getOwnPropertyDescriptors(t));
        return Object.defineProperties({}, i)
    }

    function C(t) {
        return E(t._zod.def)
    }

    function $(t, n) {
        return n ? n.reduce((t, n) => null == t ? void 0 : t[n], t) : t
    }

    function R(t) {
        let n = Object.keys(t);
        return Promise.all(n.map(n => t[n])).then(t => {
            let r = {};
            for (let i = 0; i < n.length; i++) r[n[i]] = t[i];
            return r
        })
    }

    function L() {
        let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : 10,
            n = "abcdefghijklmnopqrstuvwxyz",
            r = "";
        for (let i = 0; i < t; i++) r += n[Math.floor(Math.random() * n.length)];
        return r
    }

    function G(t) {
        return JSON.stringify(t)
    }

    function M(t) {
        return t.toLowerCase().trim().replace(/[^\w\s-]/g, "").replace(/[\s_-]+/g, "-").replace(/^-+|-+$/g, "")
    }
    let B = "captureStackTrace" in Error ? Error.captureStackTrace : function() {
        for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r]
    };

    function J(t) {
        return "object" == typeof t && null !== t && !Array.isArray(t)
    }
    let V = w(() => {
        var t, n;
        if (d.jitless || "u" > typeof navigator && (null == (n = navigator) || null == (t = n.userAgent) ? void 0 : t.includes("Cloudflare"))) return !1;
        try {
            return Function(""), !0
        } catch (t) {
            return !1
        }
    });

    function F(t) {
        if (!1 === J(t)) return !1;
        let n = t.constructor;
        if (void 0 === n || "function" != typeof n) return !0;
        let r = n.prototype;
        return !1 !== J(r) && !1 !== Object.prototype.hasOwnProperty.call(r, "isPrototypeOf")
    }

    function q(t) {
        return F(t) ? {
            ...t
        } : Array.isArray(t) ? [...t] : t instanceof Map ? new Map(t) : t instanceof Set ? new Set(t) : t
    }

    function W(t) {
        let n = 0;
        for (let r in t) Object.prototype.hasOwnProperty.call(t, r) && n++;
        return n
    }
    let K = t => {
            let n = typeof t;
            switch (n) {
                case "undefined":
                    return "undefined";
                case "string":
                    return "string";
                case "number":
                    return Number.isNaN(t) ? "nan" : "number";
                case "boolean":
                    return "boolean";
                case "function":
                    return "function";
                case "bigint":
                    return "bigint";
                case "symbol":
                    return "symbol";
                case "object":
                    if (Array.isArray(t)) return "array";
                    if (null === t) return "null";
                    if (t.then && "function" == typeof t.then && t.catch && "function" == typeof t.catch) return "promise";
                    if ("u" > typeof Map && t instanceof Map) return "map";
                    if ("u" > typeof Set && t instanceof Set) return "set";
                    if ("u" > typeof Date && t instanceof Date) return "date";
                    if ("u" > typeof File && t instanceof File) return "file";
                    return "object";
                default:
                    throw Error("Unknown data type: ".concat(n))
            }
        },
        X = new Set(["string", "number", "symbol"]),
        H = new Set(["string", "number", "bigint", "boolean", "symbol", "undefined"]);

    function Y(t) {
        return t.replace(/[.*+?^${}()|[\]\\]/g, "\\$&")
    }

    function Q(t, n, r) {
        let i = new t._zod.constr(null != n ? n : t._zod.def);
        return (!n || (null == r ? void 0 : r.parent)) && (i._zod.parent = t), i
    }

    function ee(t) {
        if (!t) return {};
        if ("string" == typeof t) return {
            error: () => t
        };
        if ((null == t ? void 0 : t.message) !== void 0) {
            if ((null == t ? void 0 : t.error) !== void 0) throw Error("Cannot specify both `message` and `error` params");
            t.error = t.message
        }
        return (delete t.message, "string" == typeof t.error) ? {
            ...t,
            error: () => t.error
        } : t
    }

    function et(t) {
        let n;
        return new Proxy({}, {
            get: (r, i, a) => (null != n || (n = t()), Reflect.get(n, i, a)),
            set: (r, i, a, o) => (null != n || (n = t()), Reflect.set(n, i, a, o)),
            has: (r, i) => (null != n || (n = t()), Reflect.has(n, i)),
            deleteProperty: (r, i) => (null != n || (n = t()), Reflect.deleteProperty(n, i)),
            ownKeys: r => (null != n || (n = t()), Reflect.ownKeys(n)),
            getOwnPropertyDescriptor: (r, i) => (null != n || (n = t()), Reflect.getOwnPropertyDescriptor(n, i)),
            defineProperty: (r, i, a) => (null != n || (n = t()), Reflect.defineProperty(n, i, a))
        })
    }

    function en(t) {
        return "bigint" == typeof t ? t.toString() + "n" : "string" == typeof t ? '"'.concat(t, '"') : "".concat(t)
    }

    function er(t) {
        return Object.keys(t).filter(n => void 0 !== t[n]._zod.optin && "optional" === t[n]._zod.optout)
    }
    let ei = {
            safeint: [Number.MIN_SAFE_INTEGER, Number.MAX_SAFE_INTEGER],
            int32: [-0x80000000, 0x7fffffff],
            uint32: [0, 0xffffffff],
            float32: [-34028234663852886e22, 34028234663852886e22],
            float64: [-Number.MAX_VALUE, Number.MAX_VALUE]
        },
        ea = {
            int64: [BigInt("-9223372036854775808"), BigInt("9223372036854775807")],
            uint64: [BigInt(0), BigInt("18446744073709551615")]
        };

    function eo(t, n) {
        let r = t._zod.def,
            i = r.checks;
        if (i && i.length > 0) throw Error(".pick() cannot be used on object schemas containing refinements");
        let a = {};
        return T(a, t, ec(t, n)), Q(t, E(r, {
            shape: a,
            checks: []
        }))
    }

    function ec(t, n) {
        let r = D(t),
            i = [];
        for (let t of Reflect.ownKeys(n)) {
            var a;
            if (!(null == (a = Object.getOwnPropertyDescriptor(r, t)) ? void 0 : a.enumerable)) throw Error('Unrecognized key: "'.concat(String(t), '"'));
            n[t] && i.push(t)
        }
        return i
    }

    function eu(t, n) {
        let r = t._zod.def,
            i = r.checks;
        if (i && i.length > 0) throw Error(".omit() cannot be used on object schemas containing refinements");
        let a = new Set(ec(t, n)),
            o = {};
        return T(o, t, Reflect.ownKeys(D(t)).filter(t => !a.has(t))), Q(t, E(r, {
            shape: o,
            checks: []
        }))
    }

    function el(t, n) {
        if (!F(n)) throw Error("Invalid input to extend: expected a plain object");
        let r = t._zod.def.checks;
        if (r && r.length > 0) {
            let r = D(t);
            for (let t of Reflect.ownKeys(n))
                if (void 0 !== Object.getOwnPropertyDescriptor(r, t)) throw Error("Cannot overwrite keys on object schemas containing refinements. Use `.safeExtend()` instead.")
        }
        return Q(t, E(t._zod.def, {
            shape: es(t, n)
        }))
    }

    function es(t, n) {
        let r = {};
        T(r, t, Reflect.ownKeys(D(t)));
        for (let t of Reflect.ownKeys(n)) {
            let i = Object.getOwnPropertyDescriptor(n, t);
            i.enumerable && (i.get ? Z(r, t, () => n[t]) : j(r, t, i.value))
        }
        return r
    }

    function ed(t, n) {
        if (!F(n)) throw Error("Invalid input to safeExtend: expected a plain object");
        return Q(t, E(t._zod.def, {
            shape: es(t, n)
        }))
    }

    function em(t, n) {
        var r, i, a;
        if (!(null == n || null == (i = n._zod) ? void 0 : i.def)) throw Error("Invalid input to merge: expected an object schema. To merge a plain shape, use `.extend()`.");
        if (null == (a = t._zod.def.checks) ? void 0 : a.length) throw Error(".merge() cannot be used on object schemas containing refinements. Use .safeExtend() instead.");
        let o = {};
        T(o, t, Reflect.ownKeys(D(t))), T(o, n, Reflect.ownKeys(D(n)));
        let c = E(t._zod.def, {
            shape: o,
            get catchall() {
                return n._zod.def.catchall
            },
            checks: null != (r = n._zod.def.checks) ? r : []
        });
        return Q(t, c)
    }

    function ef(t, n, r) {
        let i = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : "partial",
            a = n._zod.def.checks;
        if (a && a.length > 0) throw Error(".".concat(i, "() cannot be used on object schemas containing refinements"));
        let o = r ? new Set(ec(n, r)) : void 0,
            c = {};
        return T(c, n, Reflect.ownKeys(D(n)), t && ((n, r) => o && !o.has(r) ? n : new t({
            type: "optional",
            innerType: n
        }))), Q(n, E(n._zod.def, {
            shape: c,
            checks: []
        }))
    }

    function ev(t, n, r) {
        let i = r ? new Set(ec(n, r)) : void 0,
            a = {};
        return T(a, n, Reflect.ownKeys(D(n)), (n, r) => i && !i.has(r) ? n : new t({
            type: "nonoptional",
            innerType: n
        })), Q(n, E(n._zod.def, {
            shape: a
        }))
    }

    function ep(t) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
        if (!0 === t.aborted) return !0;
        for (let i = n; i < t.issues.length; i++) {
            var r;
            if ((null == (r = t.issues[i]) ? void 0 : r.continue) !== !0) return !0
        }
        return !1
    }

    function eg(t) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
        if (!0 === t.aborted) return !0;
        for (let i = n; i < t.issues.length; i++) {
            var r;
            if ((null == (r = t.issues[i]) ? void 0 : r.continue) === !1) return !0
        }
        return !1
    }

    function eh(t, n) {
        return n.map(n => (null != n.path || (n.path = []), n.path.unshift(t), n))
    }

    function eb(t) {
        return "string" == typeof t ? t : null == t ? void 0 : t.message
    }

    function ey(t, n, r) {
        var i;
        for (let a = n; a < t.length; a++) null != (i = t[a]).schema || (i.schema = r)
    }

    function e_(t, n, r) {
        var i, a, o, c, u, l, s, d, m, f, v, p, g, h, b;
        let y = null == (s = t.inst) || null == (l = s._zod) ? void 0 : l.traits;
        (null == y ? void 0 : y.has("$ZodType")) && (y.has("$ZodCheck") && null != t.schema || (t.schema = t.inst));
        let _ = t.schema !== t.inst ? null == (m = t.schema) || null == (d = m._zod.def) ? void 0 : d.error : void 0,
            I = t.message ? t.message : null != (i = null != (a = null != (o = null != (c = null != (u = eb(null == (p = t.inst) || null == (v = p._zod.def) || null == (f = v.error) ? void 0 : f.call(v, t))) ? u : eb(null == _ ? void 0 : _(t))) ? c : eb(null == n || null == (g = n.error) ? void 0 : g.call(n, t))) ? o : eb(null == (h = r.customError) ? void 0 : h.call(r, t))) ? a : eb(null == (b = r.localeError) ? void 0 : b.call(r, t))) ? i : "Invalid input",
            k = {};
        for (let n of Object.keys(t)) "inst" !== n && "schema" !== n && "continue" !== n && "input" !== n && "__proto__" !== n && (k[n] = t[n]);
        return null != k.path || (k.path = []), k.message = I, (null == n ? void 0 : n.reportInput) && (k.input = t.input), k
    }

    function eI(t) {
        return t instanceof Set ? "set" : t instanceof Map ? "map" : t instanceof File ? "file" : "unknown"
    }
    let ek = /[\uD800-\uDBFF]/;

    function ew(t) {
        let n = t.length;
        if (!ek.test(t)) return n;
        let r = n;
        for (let i = 0; i < n - 1; i++)(64512 & t.charCodeAt(i)) == 55296 && (64512 & t.charCodeAt(i + 1)) == 56320 && (r--, i++);
        return r
    }

    function ex(t) {
        return Array.isArray(t) ? "array" : "string" == typeof t ? "string" : "unknown"
    }

    function eS(t) {
        let n = typeof t;
        switch (n) {
            case "number":
                return Number.isNaN(t) ? "nan" : "number";
            case "object":
                if (null === t) return "null";
                if (Array.isArray(t)) return "array";
                if (t && Object.getPrototypeOf(t) !== Object.prototype && "constructor" in t && t.constructor) return t.constructor.name
        }
        return n
    }

    function ez() {
        for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
        let [i, a, o] = n;
        return "string" == typeof i ? {
            message: i,
            code: "custom",
            input: a,
            inst: o
        } : {
            ...i
        }
    }

    function eA(t) {
        return Object.entries(t).filter(t => {
            let [n, r] = t;
            return Number.isNaN(Number.parseInt(n, 10))
        }).map(t => t[1])
    }

    function eU(t) {
        let n = atob(t),
            r = new Uint8Array(n.length);
        for (let t = 0; t < n.length; t++) r[t] = n.charCodeAt(t);
        return r
    }

    function eP(t) {
        let n = "";
        for (let r = 0; r < t.length; r++) n += String.fromCharCode(t[r]);
        return btoa(n)
    }

    function eO(t) {
        let n = t.replace(/-/g, "+").replace(/_/g, "/"),
            r = "=".repeat((4 - n.length % 4) % 4);
        return eU(n + r)
    }

    function eN(t) {
        return eP(t).replace(/\+/g, "-").replace(/\//g, "_").replace(/=/g, "")
    }

    function eD(t) {
        let n = t.replace(/^0x/, "");
        if (n.length % 2 != 0) throw Error("Invalid hex string length");
        let r = new Uint8Array(n.length / 2);
        for (let t = 0; t < n.length; t += 2) r[t / 2] = Number.parseInt(n.slice(t, t + 2), 16);
        return r
    }

    function eZ(t) {
        return Array.from(t).map(t => t.toString(16).padStart(2, "0")).join("")
    }
    class ej {
        constructor(...t) {}
    }

    function eT(t, n) {
        for (let r in n) {
            let i = Object.getOwnPropertyDescriptor(n, r);
            i.get ? Object.defineProperty(t, r, {
                ...i,
                enumerable: !1
            }) : function(t, n, r) {
                Object.defineProperty(t, n, {
                    configurable: !0,
                    get() {
                        return this == null ? r : eE(this, n, r.bind(this))
                    },
                    set(t) {
                        eE(this, n, t)
                    }
                })
            }(t, r, i.value)
        }
    }

    function eE(t, n, r) {
        let i = !(arguments.length > 3) || void 0 === arguments[3] || arguments[3];
        return Object.defineProperty(t, n, {
            configurable: !0,
            writable: !0,
            enumerable: i,
            value: r
        }), r
    }

    function eC(t, n, r) {
        return eE(t, n, r, !1)
    }

    function e$(t, n) {
        for (let r in t) {
            let i = t[r];
            Object.defineProperty(n, r, {
                configurable: !0,
                enumerable: !0,
                get() {
                    return eE(this, r, i(this))
                },
                set(t) {
                    eE(this, r, t)
                }
            })
        }
        return n
    }
    let eR = !1,
        eL = {
            configurable: !0,
            get() {
                eR = !0
            }
        };

    function eG(t, r, i) {
        let a = Object.getPrototypeOf(t._zod);
        if (r in a && n !== t._zod) {
            n = void 0;
            return
        }
        n = t._zod, Object.defineProperty(a, r, {
            configurable: !0,
            get() {
                Object.defineProperty(this, r, eL);
                let t = eR;
                eR = !1;
                try {
                    let n = i(this);
                    return eR ? delete this[r] : Object.defineProperty(this, r, {
                        configurable: !0,
                        writable: !0,
                        value: n
                    }), eR = eR || t, n
                } catch (n) {
                    throw delete this[r], eR = eR || t, n
                }
            },
            set(t) {
                Object.defineProperty(this, r, {
                    configurable: !0,
                    writable: !0,
                    value: t
                })
            }
        })
    }

    function eM(t, n, r, i) {
        let a, o = n in (a = Object.getPrototypeOf(t)) ? void 0 : a;
        o && Object.defineProperty(o, n, {
            configurable: !0,
            get() {
                let t = {
                    configurable: !0,
                    writable: !0,
                    enumerable: i,
                    value: void 0
                };
                return Object.defineProperty(this, n, t), t.value = r(this), Object.defineProperty(this, n, t), t.value
            },
            set(t) {
                Object.defineProperty(this, n, {
                    configurable: !0,
                    writable: !0,
                    enumerable: i,
                    value: t
                })
            }
        })
    }
    let eB = "~constantCatch";

    function eJ(t) {
        let n = () => t;
        return n[eB] = !0, n
    }
    var eV, eF, eq, eW = t.i(748089);
    let eK = /^[cC][0-9a-z]{6,}$/,
        eX = /^[0-9a-z]+$/,
        eH = /^[0-7][0-9A-HJKMNP-TV-Za-hjkmnp-tv-z]{25}$/,
        eY = /^[0-9a-vA-V]{20}$/,
        eQ = /^[A-Za-z0-9]{27}$/,
        e0 = /^[a-zA-Z0-9_-]{21}$/;

    function e4(t) {
        return new RegExp("^[a-zA-Z0-9_-]{".concat(t, "}$"))
    }
    let e1 = /^P(?:(\d+W)|(?!.*W)(?=\d|T\d)(\d+Y)?(\d+M)?(\d+D)?(T(?=\d)(\d+H)?(\d+M)?(\d+([.,]\d+)?S)?)?)$/,
        e6 = /^([0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12})$/,
        e2 = t => t ? new RegExp("^([0-9a-fA-F]{8}-[0-9a-fA-F]{4}-".concat(t, "[0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12})$")) : /^([0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[1-8][0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}|00000000-0000-0000-0000-000000000000|ffffffff-ffff-ffff-ffff-ffffffffffff)$/,
        e5 = e2(4),
        e3 = e2(6),
        e9 = e2(7),
        e8 = /^(?:[A-Za-z0-9_'+\-]+\.)*[A-Za-z0-9_'+\-]*[A-Za-z0-9_+-]@(?:[A-Za-z0-9][A-Za-z0-9\-]*\.)+[A-Za-z]{2,}$/,
        e7 = /^[^\s@"]{1,64}@[^\s@]{1,255}$/u;

    function te() {
        return RegExp("^(?=[\\s\\S]*[\\p{Extended_Pictographic}\\p{Regional_Indicator}\\u20E3])[\\p{Extended_Pictographic}\\p{Emoji_Component}]+$", "u")
    }
    let tt = /^(?:(?:25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])$/,
        tn = /^(([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))$/,
        tr = t => {
            let n = Y(null != t ? t : ":");
            return new RegExp("^(?:[0-9A-F]{2}".concat(n, "){5}[0-9A-F]{2}$|^(?:[0-9a-f]{2}").concat(n, "){5}[0-9a-f]{2}$"))
        },
        ti = /^((25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.){3}(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\/([0-9]|[1-2][0-9]|3[0-2])$/,
        ta = /^(([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))\/(12[0-8]|1[01][0-9]|[1-9]?[0-9])$/,
        to = /^$|^(?:[0-9a-zA-Z+/]{4})*(?:(?:[0-9a-zA-Z+/]{2}==)|(?:[0-9a-zA-Z+/]{3}=))?$/,
        tc = /^(?:[A-Za-z0-9_-]{4})*(?:[A-Za-z0-9_-]{2,3})?$/,
        tu = /^(?=.{1,253}\.?$)[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[-0-9a-zA-Z]{0,61}[0-9a-zA-Z])?)*\.?$/,
        tl = /^(?=.{1,253}$)([a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,63}$/,
        ts = /^https?$/,
        td = /^\+[1-9]\d{6,14}$/,
        tm = /^\d(?:[ -]?\d){11,18}$/,
        tf = /^(?:AED|AFN|ALL|AMD|AOA|ARS|AUD|AWG|AZN|BAM|BBD|BDT|BHD|BIF|BMD|BND|BOB|BOV|BRL|BSD|BTN|BWP|BYN|BZD|CAD|CDF|CHE|CHF|CHW|CLF|CLP|CNY|COP|COU|CRC|CUP|CVE|CZK|DJF|DKK|DOP|DZD|EGP|ERN|ETB|EUR|FJD|FKP|GBP|GEL|GHS|GIP|GMD|GNF|GTQ|GYD|HKD|HNL|HTG|HUF|IDR|ILS|INR|IQD|IRR|ISK|JMD|JOD|JPY|KES|KGS|KHR|KMF|KPW|KRW|KWD|KYD|KZT|LAK|LBP|LKR|LRD|LSL|LYD|MAD|MDL|MGA|MKD|MMK|MNT|MOP|MRU|MUR|MVR|MWK|MXN|MXV|MYR|MZN|NAD|NGN|NIO|NOK|NPR|NZD|OMR|PAB|PEN|PGK|PHP|PKR|PLN|PYG|QAR|RON|RSD|RUB|RWF|SAR|SBD|SCR|SDG|SEK|SGD|SHP|SLE|SOS|SRD|SSP|STN|SVC|SYP|SZL|THB|TJS|TMT|TND|TOP|TRY|TTD|TWD|TZS|UAH|UGX|USD|USN|UYI|UYU|UYW|UZS|VED|VES|VND|VUV|WST|XAD|XAF|XAG|XAU|XBA|XBB|XBC|XBD|XCD|XCG|XDR|XOF|XPD|XPF|XPT|XSU|XTS|XUA|XXX|YER|ZAR|ZMW|ZWG)$/,
        tv = /^[A-Z]{2}(?!00|01|99)\d{2}[A-Z0-9]{11,30}$/,
        tp = "(?:(?:\\d\\d[2468][048]|\\d\\d[13579][26]|\\d\\d0[48]|[02468][048]00|[13579][26]00)-02-29|\\d{4}-(?:(?:0[13578]|1[02])-(?:0[1-9]|[12]\\d|3[01])|(?:0[469]|11)-(?:0[1-9]|[12]\\d|30)|(?:02)-(?:0[1-9]|1\\d|2[0-8])))",
        tg = new RegExp("^".concat(tp, "$"));

    function th(t) {
        let n = "(?:[01]\\d|2[0-3]):[0-5]\\d";
        return "number" == typeof t.precision ? -1 === t.precision ? "".concat(n) : 0 === t.precision ? "".concat(n, ":[0-5]\\d") : "".concat(n, ":[0-5]\\d\\.\\d{").concat(t.precision, "}") : t.seconds ? "".concat(n, ":[0-5]\\d(?:\\.\\d+)?") : "".concat(n, "(?::[0-5]\\d(?:\\.\\d+)?)?")
    }

    function tb(t) {
        return new RegExp("^".concat(th(t), "$"))
    }

    function ty(t) {
        let n = ["Z"];
        t.offset && n.push("([+-](?:[01]\\d|2[0-3]):[0-5]\\d)");
        let r = "".concat(th({
                precision: t.precision,
                seconds: !0
            }), "(?:").concat(n.join("|"), ")"),
            i = t.local ? "".concat(r, "|").concat(th({
                precision: t.precision
            })) : r;
        return new RegExp("^".concat(tp, "T(?:").concat(i, ")$"))
    }
    let t_ = /^[\s\S]{0,}$/,
        tI = t => {
            var n, r;
            let i = t ? "[\\s\\S]{".concat(null != (n = null == t ? void 0 : t.minimum) ? n : 0, ",").concat(null != (r = null == t ? void 0 : t.maximum) ? r : "", "}") : "[\\s\\S]*";
            return new RegExp("^".concat(i, "$"))
        },
        tk = /^-?\d+n?$/,
        tw = /^-?\d+$/,
        tx = /^-?\d+(?:\.\d+)?$/,
        tS = /^(?:true|false)$/i,
        tz = /^null$/i,
        tA = /^undefined$/i,
        tU = /^[^A-Z]*$/,
        tP = /^[^a-z]*$/,
        tO = /^[0-9a-fA-F]*$/;

    function tN(t, n) {
        return new RegExp("^[A-Za-z0-9+/]{".concat(t, "}").concat(n, "$"))
    }

    function tD(t) {
        return new RegExp("^[A-Za-z0-9_-]{".concat(t, "}$"))
    }
    let tZ = tN(22, "=="),
        tj = tD(22),
        tT = tN(27, "="),
        tE = tD(27),
        tC = tN(43, "="),
        t$ = tD(43),
        tR = tN(64, ""),
        tL = tD(64),
        tG = tN(86, "=="),
        tM = tD(86);
    t.s(["anyString", 0, t_, "base64", 0, to, "base64url", 0, tc, "bigint", 0, tk, "boolean", 0, tS, "browserEmail", 0, /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/, "cidrv4", 0, ti, "cidrv6", 0, ta, "creditCard", 0, tm, "cuid", 0, eK, "cuid2", 0, eX, "currencyCode", 0, tf, "date", 0, tg, "datetime", 0, ty, "domain", 0, tl, "duration", 0, e1, "e164", 0, td, "email", 0, e8, "emoji", 0, te, "extendedDuration", 0, /^[-+]?P(?!$)(?:(?:[-+]?\d+Y)|(?:[-+]?\d+[.,]\d+Y$))?(?:(?:[-+]?\d+M)|(?:[-+]?\d+[.,]\d+M$))?(?:(?:[-+]?\d+W)|(?:[-+]?\d+[.,]\d+W$))?(?:(?:[-+]?\d+D)|(?:[-+]?\d+[.,]\d+D$))?(?:T(?=[\d+-])(?:(?:[-+]?\d+H)|(?:[-+]?\d+[.,]\d+H$))?(?:(?:[-+]?\d+M)|(?:[-+]?\d+[.,]\d+M$))?(?:[-+]?\d+(?:[.,]\d+)?S)?)??$/, "guid", 0, e6, "hex", 0, tO, "hostname", 0, tu, "html5Email", 0, /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/, "httpProtocol", 0, ts, "iban", 0, tv, "idnEmail", 0, e7, "integer", 0, tw, "ipv4", 0, tt, "ipv6", 0, tn, "ksuid", 0, eQ, "lowercase", 0, tU, "mac", 0, tr, "md5_base64", 0, tZ, "md5_base64url", 0, tj, "md5_hex", 0, /^[0-9a-fA-F]{32}$/, "nanoid", 0, e0, "nanoidOfLength", 0, e4, "null", 0, tz, "number", 0, tx, "rfc5322Email", 0, /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/, "sha1_base64", 0, tT, "sha1_base64url", 0, tE, "sha1_hex", 0, /^[0-9a-fA-F]{40}$/, "sha256_base64", 0, tC, "sha256_base64url", 0, t$, "sha256_hex", 0, /^[0-9a-fA-F]{64}$/, "sha384_base64", 0, tR, "sha384_base64url", 0, tL, "sha384_hex", 0, /^[0-9a-fA-F]{96}$/, "sha512_base64", 0, tG, "sha512_base64url", 0, tM, "sha512_hex", 0, /^[0-9a-fA-F]{128}$/, "string", 0, tI, "time", 0, tb, "ulid", 0, eH, "undefined", 0, tA, "unicodeEmail", 0, e7, "uppercase", 0, tP, "uuid", 0, e2, "uuid4", 0, e5, "uuid6", 0, e3, "uuid7", 0, e9, "xid", 0, eY], 559416);
    var tB = t.i(559416);

    function tJ(t, n, r, i) {
        let a = Math.abs(t),
            o = a % 10,
            c = a % 100;
        return c >= 11 && c <= 19 ? i : 1 === o ? n : o >= 2 && o <= 4 ? r : i
    }

    function tV() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "characters",
                        verb: "to have"
                    },
                    file: {
                        unit: "bytes",
                        verb: "to have"
                    },
                    array: {
                        unit: "items",
                        verb: "to have"
                    },
                    set: {
                        unit: "items",
                        verb: "to have"
                    },
                    map: {
                        unit: "entries",
                        verb: "to have"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "input",
                        email: "email address",
                        url: "URL",
                        emoji: "emoji",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "ISO datetime",
                        date: "ISO date",
                        time: "ISO time",
                        duration: "ISO duration",
                        ipv4: "IPv4 address",
                        ipv6: "IPv6 address",
                        mac: "MAC address",
                        cidrv4: "IPv4 range",
                        cidrv6: "IPv6 range",
                        base64: "base64-encoded string",
                        base64url: "base64url-encoded string",
                        json_string: "JSON string",
                        e164: "E.164 number",
                        currency_code: "currency code",
                        credit_card: "credit card number",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "input"
                    },
                    i = {
                        nan: "NaN"
                    };

                function a(t, n) {
                    var r;
                    return "number" !== t || "number" != typeof n || Number.isFinite(n) ? null != (r = i[t]) ? r : t : String(n)
                }
                return t => {
                    var i, o, c, u;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = a(t.expected),
                                r = a(eS(t.input), t.input);
                            return "Invalid input: expected ".concat(n, ", received ").concat(r)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Invalid input: expected ".concat(en(t.values[0]));
                            return "Invalid option: expected one of ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.exact ? "exactly " : t.inclusive ? "<=" : "<",
                                a = n(t.origin);
                            if (a) return "Too big: expected ".concat(null != (i = t.origin) ? i : "value", " to have ").concat(r).concat(t.maximum.toString(), " ").concat(null != (o = a.unit) ? o : "elements");
                            return "Too big: expected ".concat(null != (c = t.origin) ? c : "value", " to be ").concat(r).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.exact ? "exactly " : t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "Too small: expected ".concat(t.origin, " to have ").concat(r).concat(t.minimum.toString(), " ").concat(i.unit);
                            return "Too small: expected ".concat(t.origin, " to be ").concat(r).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Invalid string: must start with "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Invalid string: must end with "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Invalid string: must include "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Invalid string: must match pattern ".concat(t.pattern);
                            return "Invalid ".concat(null != (u = r[t.format]) ? u : t.format);
                        case "not_multiple_of":
                            return "Invalid number: must be a multiple of ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Unrecognized key".concat(t.keys.length > 1 ? "s" : "", ": ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "Invalid key in ".concat(t.origin);
                        case "invalid_union":
                            if (t.options && Array.isArray(t.options) && t.options.length > 0) {
                                let n = t.options.map(t => "'".concat(t, "'")).join(" | ");
                                return "Invalid discriminator value. Expected ".concat(n)
                            }
                            if (!1 === t.inclusive) return "Invalid input: more than one option matched";
                            return "Invalid input";
                        case "invalid_element":
                            return "Invalid value in ".concat(t.origin);
                        default:
                            return "Invalid input"
                    }
                }
            })()
        }
    }

    function tF(t, n, r) {
        return 1 === Math.abs(t) ? n : r
    }

    function tq(t) {
        if (!t) return "";
        let n = t[t.length - 1];
        return t + (["ա", "ե", "ը", "ի", "ո", "ու", "օ"].includes(n) ? "ն" : "ը")
    }

    function tW() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "តួអក្សរ",
                        verb: "គួរមាន"
                    },
                    file: {
                        unit: "បៃ",
                        verb: "គួរមាន"
                    },
                    array: {
                        unit: "ធាតុ",
                        verb: "គួរមាន"
                    },
                    set: {
                        unit: "ធាតុ",
                        verb: "គួរមាន"
                    },
                    map: {
                        unit: "ធាតុ",
                        verb: "គួរមាន"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "ទិន្នន័យបញ្ចូល",
                        email: "អាសយដ្ឋានអ៊ីមែល",
                        url: "URL",
                        emoji: "សញ្ញាអារម្មណ៍",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "កាលបរិច្ឆេទ និងម៉ោង ISO",
                        date: "កាលបរិច្ឆេទ ISO",
                        time: "ម៉ោង ISO",
                        duration: "រយៈពេល ISO",
                        ipv4: "អាសយដ្ឋាន IPv4",
                        ipv6: "អាសយដ្ឋាន IPv6",
                        mac: "អាសយដ្ឋាន MAC",
                        cidrv4: "ដែនអាសយដ្ឋាន IPv4",
                        cidrv6: "ដែនអាសយដ្ឋាន IPv6",
                        base64: "ខ្សែអក្សរអ៊ិកូដ base64",
                        base64url: "ខ្សែអក្សរអ៊ិកូដ base64url",
                        json_string: "ខ្សែអក្សរ JSON",
                        e164: "លេខ E.164",
                        credit_card: "លេខប័ណ្ណឥណទាន",
                        currency_code: "កូដរូបិយប័ណ្ណ",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "ទិន្នន័យបញ្ចូល"
                    },
                    i = {
                        nan: "NaN",
                        number: "លេខ",
                        array: "អារេ (Array)",
                        null: "គ្មានតម្លៃ (null)"
                    };
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "ទិន្នន័យបញ្ចូលមិនត្រឹមត្រូវ៖ ត្រូវការ instanceof ".concat(t.expected, " ប៉ុន្តែទទួលបាន ").concat(c);
                            return "ទិន្នន័យបញ្ចូលមិនត្រឹមត្រូវ៖ ត្រូវការ ".concat(n, " ប៉ុន្តែទទួលបាន ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "ទិន្នន័យបញ្ចូលមិនត្រឹមត្រូវ៖ ត្រូវការ ".concat(en(t.values[0]));
                            return "ជម្រើសមិនត្រឹមត្រូវ៖ ត្រូវជាមួយក្នុងចំណោម ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "ធំពេក៖ ត្រូវការ ".concat(null != (c = t.origin) ? c : "តម្លៃ", " ").concat(r, " ").concat(t.maximum.toString(), " ").concat(null != (u = i.unit) ? u : "ធាតុ");
                            return "ធំពេក៖ ត្រូវការ ".concat(null != (l = t.origin) ? l : "តម្លៃ", " ").concat(r, " ").concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "តូចពេក៖ ត្រូវការ ".concat(t.origin, " ").concat(r, " ").concat(t.minimum.toString(), " ").concat(i.unit);
                            return "តូចពេក៖ ត្រូវការ ".concat(t.origin, " ").concat(r, " ").concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'ខ្សែអក្សរមិនត្រឹមត្រូវ៖ ត្រូវចាប់ផ្តើមដោយ "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'ខ្សែអក្សរមិនត្រឹមត្រូវ៖ ត្រូវបញ្ចប់ដោយ "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'ខ្សែអក្សរមិនត្រឹមត្រូវ៖ ត្រូវមាន "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "ខ្សែអក្សរមិនត្រឹមត្រូវ៖ ត្រូវតែផ្គូផ្គងនឹងទម្រង់ដែលបានកំណត់ ".concat(t.pattern);
                            return "មិនត្រឹមត្រូវ៖ ".concat(null != (s = r[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "លេខមិនត្រឹមត្រូវ៖ ត្រូវតែជាពហុគុណនៃ ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "រកឃើញសោមិនស្គាល់៖ ".concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "សោមិនត្រឹមត្រូវនៅក្នុង ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "ទិន្នន័យមិនត្រឹមត្រូវ";
                        case "invalid_element":
                            return "ទិន្នន័យមិនត្រឹមត្រូវនៅក្នុង ".concat(t.origin)
                    }
                }
            })()
        }
    }
    t.s([], 372093), t.i(372093);
    let tK = t => t.charAt(0).toUpperCase() + t.slice(1);

    function tX(t) {
        let n = Math.abs(t),
            r = n % 10,
            i = n % 100;
        return i >= 11 && i <= 19 || 0 === r ? "many" : 1 === r ? "one" : "few"
    }

    function tH(t, n, r, i) {
        let a = Math.abs(t),
            o = a % 10,
            c = a % 100;
        return c >= 11 && c <= 19 ? i : 1 === o ? n : o >= 2 && o <= 4 ? r : i
    }

    function tY() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "символів",
                        verb: "матиме"
                    },
                    file: {
                        unit: "байтів",
                        verb: "матиме"
                    },
                    array: {
                        unit: "елементів",
                        verb: "матиме"
                    },
                    set: {
                        unit: "елементів",
                        verb: "матиме"
                    },
                    map: {
                        unit: "елементів",
                        verb: "матиме"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "вхідні дані",
                        email: "адреса електронної пошти",
                        url: "URL",
                        emoji: "емодзі",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "дата та час ISO",
                        date: "дата ISO",
                        time: "час ISO",
                        duration: "тривалість ISO",
                        ipv4: "адреса IPv4",
                        ipv6: "адреса IPv6",
                        mac: "адреса MAC",
                        cidrv4: "діапазон IPv4",
                        cidrv6: "діапазон IPv6",
                        base64: "рядок у кодуванні base64",
                        base64url: "рядок у кодуванні base64url",
                        json_string: "рядок JSON",
                        e164: "номер E.164",
                        credit_card: "номер кредитної картки",
                        currency_code: "код валюти",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "вхідні дані"
                    },
                    i = {
                        nan: "NaN",
                        number: "число",
                        array: "масив"
                    };
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "Неправильні вхідні дані: очікується instanceof ".concat(t.expected, ", отримано ").concat(c);
                            return "Неправильні вхідні дані: очікується ".concat(n, ", отримано ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Неправильні вхідні дані: очікується ".concat(en(t.values[0]));
                            return "Неправильна опція: очікується одне з ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "Занадто велике: очікується, що ".concat(null != (c = t.origin) ? c : "значення", " ").concat(i.verb, " ").concat(r).concat(t.maximum.toString(), " ").concat(null != (u = i.unit) ? u : "елементів");
                            return "Занадто велике: очікується, що ".concat(null != (l = t.origin) ? l : "значення", " буде ").concat(r).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "Занадто мале: очікується, що ".concat(t.origin, " ").concat(i.verb, " ").concat(r).concat(t.minimum.toString(), " ").concat(i.unit);
                            return "Занадто мале: очікується, що ".concat(t.origin, " буде ").concat(r).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Неправильний рядок: повинен починатися з "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Неправильний рядок: повинен закінчуватися на "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Неправильний рядок: повинен містити "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Неправильний рядок: повинен відповідати шаблону ".concat(t.pattern);
                            return "Неправильний ".concat(null != (s = r[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Неправильне число: повинно бути кратним ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Нерозпізнаний ключ".concat(t.keys.length > 1 ? "і" : "", ": ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "Неправильний ключ у ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Неправильні вхідні дані";
                        case "invalid_element":
                            return "Неправильне значення у ".concat(t.origin)
                    }
                }
            })()
        }
    }
    t.s(["ar", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "حرف",
                        verb: "أن يحوي"
                    },
                    file: {
                        unit: "بايت",
                        verb: "أن يحوي"
                    },
                    array: {
                        unit: "عنصر",
                        verb: "أن يحوي"
                    },
                    set: {
                        unit: "عنصر",
                        verb: "أن يحوي"
                    },
                    map: {
                        unit: "عنصر",
                        verb: "أن يحوي"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "مدخل",
                        email: "بريد إلكتروني",
                        url: "رابط",
                        emoji: "إيموجي",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "تاريخ ووقت بمعيار ISO",
                        date: "تاريخ بمعيار ISO",
                        time: "وقت بمعيار ISO",
                        duration: "مدة بمعيار ISO",
                        ipv4: "عنوان IPv4",
                        ipv6: "عنوان IPv6",
                        mac: "عنوان MAC",
                        cidrv4: "مدى عناوين بصيغة IPv4",
                        cidrv6: "مدى عناوين بصيغة IPv6",
                        base64: "نَص بترميز base64-encoded",
                        base64url: "نَص بترميز base64url-encoded",
                        json_string: "نَص على هيئة JSON",
                        e164: "رقم هاتف بمعيار E.164",
                        credit_card: "رقم بطاقة الائتمان",
                        currency_code: "رمز العملة",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "مدخل"
                    },
                    i = {
                        nan: "NaN"
                    };
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "مدخلات غير مقبولة: يفترض إدخال instanceof ".concat(t.expected, "، ولكن تم إدخال ").concat(c);
                            return "مدخلات غير مقبولة: يفترض إدخال ".concat(n, "، ولكن تم إدخال ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "مدخلات غير مقبولة: يفترض إدخال ".concat(en(t.values[0]));
                            return "اختيار غير مقبول: يتوقع انتقاء أحد هذه الخيارات: ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return " أكبر من اللازم: يفترض أن تكون ".concat(null != (c = t.origin) ? c : "القيمة", " ").concat(r, " ").concat(t.maximum.toString(), " ").concat(null != (u = i.unit) ? u : "عنصر");
                            return "أكبر من اللازم: يفترض أن تكون ".concat(null != (l = t.origin) ? l : "القيمة", " ").concat(r, " ").concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "أصغر من اللازم: يفترض لـ ".concat(t.origin, " أن يكون ").concat(r, " ").concat(t.minimum.toString(), " ").concat(i.unit);
                            return "أصغر من اللازم: يفترض لـ ".concat(t.origin, " أن يكون ").concat(r, " ").concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'نَص غير مقبول: يجب أن يبدأ بـ "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'نَص غير مقبول: يجب أن ينتهي بـ "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'نَص غير مقبول: يجب أن يتضمَّن "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "نَص غير مقبول: يجب أن يطابق النمط ".concat(t.pattern);
                            return "".concat(null != (s = r[t.format]) ? s : t.format, " غير مقبول");
                        case "not_multiple_of":
                            return "رقم غير مقبول: يجب أن يكون من مضاعفات ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "معرف".concat(t.keys.length > 1 ? "ات" : "", " غريب").concat(t.keys.length > 1 ? "ة" : "", ": ").concat(_(t.keys, "، "));
                        case "invalid_key":
                            return "معرف غير مقبول في ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "مدخل غير مقبول";
                        case "invalid_element":
                            return "مدخل غير مقبول في ".concat(t.origin)
                    }
                }
            })()
        }
    }, "az", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "simvol",
                        verb: "olmalıdır"
                    },
                    file: {
                        unit: "bayt",
                        verb: "olmalıdır"
                    },
                    array: {
                        unit: "element",
                        verb: "olmalıdır"
                    },
                    set: {
                        unit: "element",
                        verb: "olmalıdır"
                    },
                    map: {
                        unit: "element",
                        verb: "olmalıdır"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "input",
                        email: "email address",
                        url: "URL",
                        emoji: "emoji",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "ISO datetime",
                        date: "ISO date",
                        time: "ISO time",
                        duration: "ISO duration",
                        ipv4: "IPv4 address",
                        ipv6: "IPv6 address",
                        mac: "MAC address",
                        cidrv4: "IPv4 range",
                        cidrv6: "IPv6 range",
                        base64: "base64-encoded string",
                        base64url: "base64url-encoded string",
                        json_string: "JSON string",
                        e164: "E.164 number",
                        credit_card: "kredit kartı nömrəsi",
                        currency_code: "valyuta kodu",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "input"
                    },
                    i = {
                        nan: "NaN"
                    };
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "Yanlış dəyər: gözlənilən instanceof ".concat(t.expected, ", daxil olan ").concat(c);
                            return "Yanlış dəyər: gözlənilən ".concat(n, ", daxil olan ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Yanlış dəyər: gözlənilən ".concat(en(t.values[0]));
                            return "Yanlış seçim: aşağıdakılardan biri olmalıdır: ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "Çox böyük: gözlənilən ".concat(null != (c = t.origin) ? c : "dəyər", " ").concat(r).concat(t.maximum.toString(), " ").concat(null != (u = i.unit) ? u : "element");
                            return "Çox böyük: gözlənilən ".concat(null != (l = t.origin) ? l : "dəyər", " ").concat(r).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "Çox kiçik: gözlənilən ".concat(t.origin, " ").concat(r).concat(t.minimum.toString(), " ").concat(i.unit);
                            return "Çox kiçik: gözlənilən ".concat(t.origin, " ").concat(r).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Yanlış mətn: "'.concat(t.prefix, '" ilə başlamalıdır');
                            if ("ends_with" === t.format) return 'Yanlış mətn: "'.concat(t.suffix, '" ilə bitməlidir');
                            if ("includes" === t.format) return 'Yanlış mətn: "'.concat(t.includes, '" daxil olmalıdır');
                            if ("regex" === t.format) return "Yanlış mətn: ".concat(t.pattern, " şablonuna uyğun olmalıdır");
                            return "Yanlış ".concat(null != (s = r[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Yanlış ədəd: ".concat(t.divisor, " ilə bölünə bilən olmalıdır");
                        case "unrecognized_keys":
                            return "Tanınmayan açar".concat(t.keys.length > 1 ? "lar" : "", ": ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "".concat(t.origin, " daxilində yanlış açar");
                        case "invalid_union":
                        default:
                            return "Yanlış dəyər";
                        case "invalid_element":
                            return "".concat(t.origin, " daxilində yanlış dəyər")
                    }
                }
            })()
        }
    }, "be", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: {
                            one: "сімвал",
                            few: "сімвалы",
                            many: "сімвалаў"
                        },
                        verb: "мець"
                    },
                    array: {
                        unit: {
                            one: "элемент",
                            few: "элементы",
                            many: "элементаў"
                        },
                        verb: "мець"
                    },
                    set: {
                        unit: {
                            one: "элемент",
                            few: "элементы",
                            many: "элементаў"
                        },
                        verb: "мець"
                    },
                    map: {
                        unit: {
                            one: "элемент",
                            few: "элементы",
                            many: "элементаў"
                        },
                        verb: "мець"
                    },
                    file: {
                        unit: {
                            one: "байт",
                            few: "байты",
                            many: "байтаў"
                        },
                        verb: "мець"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "увод",
                        email: "email адрас",
                        url: "URL",
                        emoji: "эмодзі",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "ISO дата і час",
                        date: "ISO дата",
                        time: "ISO час",
                        duration: "ISO працягласць",
                        ipv4: "IPv4 адрас",
                        ipv6: "IPv6 адрас",
                        mac: "MAC адрас",
                        cidrv4: "IPv4 дыяпазон",
                        cidrv6: "IPv6 дыяпазон",
                        base64: "радок у фармаце base64",
                        base64url: "радок у фармаце base64url",
                        json_string: "JSON радок",
                        e164: "нумар E.164",
                        credit_card: "нумар крэдытнай карты",
                        currency_code: "код валюты",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "увод"
                    },
                    i = {
                        nan: "NaN",
                        number: "лік",
                        array: "масіў"
                    };
                return t => {
                    var a, o, c, u, l;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "Няправільны ўвод: чакаўся instanceof ".concat(t.expected, ", атрымана ").concat(c);
                            return "Няправільны ўвод: чакаўся ".concat(n, ", атрымана ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Няправільны ўвод: чакалася ".concat(en(t.values[0]));
                            return "Няправільны варыянт: чакаўся адзін з ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) {
                                let n = tJ(Number(t.maximum), i.unit.one, i.unit.few, i.unit.many);
                                return "Занадта вялікі: чакалася, што ".concat(null != (u = t.origin) ? u : "значэнне", " павінна ").concat(i.verb, " ").concat(r).concat(t.maximum.toString(), " ").concat(n)
                            }
                            return "Занадта вялікі: чакалася, што ".concat(null != (c = t.origin) ? c : "значэнне", " павінна быць ").concat(r).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) {
                                let n = tJ(Number(t.minimum), i.unit.one, i.unit.few, i.unit.many);
                                return "Занадта малы: чакалася, што ".concat(t.origin, " павінна ").concat(i.verb, " ").concat(r).concat(t.minimum.toString(), " ").concat(n)
                            }
                            return "Занадта малы: чакалася, што ".concat(t.origin, " павінна быць ").concat(r).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Няправільны радок: павінен пачынацца з "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Няправільны радок: павінен заканчвацца на "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Няправільны радок: павінен змяшчаць "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Няправільны радок: павінен адпавядаць шаблону ".concat(t.pattern);
                            return "Няправільны ".concat(null != (l = r[t.format]) ? l : t.format);
                        case "not_multiple_of":
                            return "Няправільны лік: павінен быць кратным ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Нераспазнаны ".concat(t.keys.length > 1 ? "ключы" : "ключ", ": ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "Няправільны ключ у ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Няправільны ўвод";
                        case "invalid_element":
                            return "Няправільнае значэнне ў ".concat(t.origin)
                    }
                }
            })()
        }
    }, "bg", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "символа",
                        verb: "да съдържа"
                    },
                    file: {
                        unit: "байта",
                        verb: "да съдържа"
                    },
                    array: {
                        unit: "елемента",
                        verb: "да съдържа"
                    },
                    set: {
                        unit: "елемента",
                        verb: "да съдържа"
                    },
                    map: {
                        unit: "елемента",
                        verb: "да съдържа"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "вход",
                        email: "имейл адрес",
                        url: "URL",
                        emoji: "емоджи",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "ISO време",
                        date: "ISO дата",
                        time: "ISO време",
                        duration: "ISO продължителност",
                        ipv4: "IPv4 адрес",
                        ipv6: "IPv6 адрес",
                        mac: "MAC адрес",
                        cidrv4: "IPv4 диапазон",
                        cidrv6: "IPv6 диапазон",
                        base64: "base64-кодиран низ",
                        base64url: "base64url-кодиран низ",
                        json_string: "JSON низ",
                        e164: "E.164 номер",
                        credit_card: "номер на кредитна карта",
                        currency_code: "код на валута",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "вход"
                    },
                    i = {
                        nan: "NaN",
                        number: "число",
                        array: "масив"
                    };
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "Невалиден вход: очакван instanceof ".concat(t.expected, ", получен ").concat(c);
                            return "Невалиден вход: очакван ".concat(n, ", получен ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Невалиден вход: очакван ".concat(en(t.values[0]));
                            return "Невалидна опция: очаквано едно от ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "Твърде голямо: очаква се ".concat(null != (c = t.origin) ? c : "стойност", " да съдържа ").concat(r).concat(t.maximum.toString(), " ").concat(null != (u = i.unit) ? u : "елемента");
                            return "Твърде голямо: очаква се ".concat(null != (l = t.origin) ? l : "стойност", " да бъде ").concat(r).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "Твърде малко: очаква се ".concat(t.origin, " да съдържа ").concat(r).concat(t.minimum.toString(), " ").concat(i.unit);
                            return "Твърде малко: очаква се ".concat(t.origin, " да бъде ").concat(r).concat(t.minimum.toString())
                        }
                        case "invalid_format": {
                            if ("starts_with" === t.format) return 'Невалиден низ: трябва да започва с "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Невалиден низ: трябва да завършва с "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Невалиден низ: трябва да включва "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Невалиден низ: трябва да съвпада с ".concat(t.pattern);
                            let n = "Невалиден";
                            return "emoji" === t.format && (n = "Невалидно"), "datetime" === t.format && (n = "Невалидно"), "date" === t.format && (n = "Невалидна"), "time" === t.format && (n = "Невалидно"), "duration" === t.format && (n = "Невалидна"), "".concat(n, " ").concat(null != (s = r[t.format]) ? s : t.format)
                        }
                        case "not_multiple_of":
                            return "Невалидно число: трябва да бъде кратно на ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Неразпознат".concat(t.keys.length > 1 ? "и" : "", " ключ").concat(t.keys.length > 1 ? "ове" : "", ": ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "Невалиден ключ в ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Невалиден вход";
                        case "invalid_element":
                            return "Невалидна стойност в ".concat(t.origin)
                    }
                }
            })()
        }
    }, "bn", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "অক্ষর",
                        verb: "থাকতে হবে"
                    },
                    file: {
                        unit: "বাইট",
                        verb: "থাকতে হবে"
                    },
                    array: {
                        unit: "আইটেম",
                        verb: "থাকতে হবে"
                    },
                    set: {
                        unit: "আইটেম",
                        verb: "থাকতে হবে"
                    },
                    map: {
                        unit: "এন্ট্রি",
                        verb: "থাকতে হবে"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "ইনপুট",
                        email: "ইমেইল ঠিকানা",
                        url: "URL",
                        emoji: "ইমোজি",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "ISO তারিখ ও সময়",
                        date: "ISO তারিখ",
                        time: "ISO সময়",
                        duration: "ISO সময়কাল",
                        ipv4: "IPv4 ঠিকানা",
                        ipv6: "IPv6 ঠিকানা",
                        mac: "MAC ঠিকানা",
                        cidrv4: "IPv4 রেঞ্জ",
                        cidrv6: "IPv6 রেঞ্জ",
                        base64: "base64-এনকোডেড স্ট্রিং",
                        base64url: "base64url-এনকোডেড স্ট্রিং",
                        json_string: "JSON স্ট্রিং",
                        e164: "E.164 নম্বর",
                        credit_card: "ক্রেডিট কার্ড নম্বর",
                        currency_code: "মুদ্রা কোড",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "ইনপুট"
                    },
                    i = {
                        nan: "NaN"
                    };
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            return "অবৈধ ইনপুট: প্রত্যাশিত ".concat(n, ", প্রাপ্ত ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "অবৈধ ইনপুট: প্রত্যাশিত ".concat(en(t.values[0]));
                            return "অবৈধ অপশন: ".concat(_(t.values, " | "), " এর মধ্যে একটি প্রত্যাশিত");
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "অনেক বড়: ".concat(null != (c = t.origin) ? c : "মান", " ").concat(r).concat(t.maximum.toString(), " ").concat(null != (u = i.unit) ? u : "এলিমেন্ট", " হতে হবে");
                            return "অনেক বড়: ".concat(null != (l = t.origin) ? l : "মান", " ").concat(r).concat(t.maximum.toString(), " হতে হবে")
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "অনেক ছোট: ".concat(t.origin, " ").concat(r).concat(t.minimum.toString(), " ").concat(i.unit, " হতে হবে");
                            return "অনেক ছোট: ".concat(t.origin, " ").concat(r).concat(t.minimum.toString(), " হতে হবে")
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'অবৈধ স্ট্রিং: "'.concat(t.prefix, '" দিয়ে শুরু হতে হবে');
                            if ("ends_with" === t.format) return 'অবৈধ স্ট্রিং: "'.concat(t.suffix, '" দিয়ে শেষ হতে হবে');
                            if ("includes" === t.format) return 'অবৈধ স্ট্রিং: "'.concat(t.includes, '" অন্তর্ভুক্ত থাকতে হবে');
                            if ("regex" === t.format) return "অবৈধ স্ট্রিং: ".concat(t.pattern, " প্যাটার্ন মিলতে হবে");
                            return "অবৈধ ".concat(null != (s = r[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "অবৈধ নম্বর: ".concat(t.divisor, " এর গুণিতক হতে হবে");
                        case "unrecognized_keys":
                            return "অচেনা কী".concat(t.keys.length > 1 ? "গুলো" : "", ": ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "".concat(t.origin, " এ অবৈধ কী");
                        case "invalid_union":
                            if (t.options && Array.isArray(t.options) && t.options.length > 0) {
                                let n = t.options.map(t => "'".concat(t, "'")).join(" | ");
                                return "অবৈধ ডিসক্রিমিনেটর মান। প্রত্যাশিত ".concat(n)
                            }
                            return "অবৈধ ইনপুট";
                        case "invalid_element":
                            return "".concat(t.origin, " এ অবৈধ মান");
                        default:
                            return "অবৈধ ইনপুট"
                    }
                }
            })()
        }
    }, "ca", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "caràcters",
                        verb: "contenir"
                    },
                    file: {
                        unit: "bytes",
                        verb: "contenir"
                    },
                    array: {
                        unit: "elements",
                        verb: "contenir"
                    },
                    set: {
                        unit: "elements",
                        verb: "contenir"
                    },
                    map: {
                        unit: "elements",
                        verb: "contenir"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "entrada",
                        email: "adreça electrònica",
                        url: "URL",
                        emoji: "emoji",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "data i hora ISO",
                        date: "data ISO",
                        time: "hora ISO",
                        duration: "durada ISO",
                        ipv4: "adreça IPv4",
                        ipv6: "adreça IPv6",
                        mac: "adreça MAC",
                        cidrv4: "rang IPv4",
                        cidrv6: "rang IPv6",
                        base64: "cadena codificada en base64",
                        base64url: "cadena codificada en base64url",
                        json_string: "cadena JSON",
                        e164: "número E.164",
                        credit_card: "número de targeta de crèdit",
                        currency_code: "codi de moneda",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "entrada"
                    },
                    i = {
                        nan: "NaN"
                    };
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "Tipus invàlid: s'esperava instanceof ".concat(t.expected, ", s'ha rebut ").concat(c);
                            return "Tipus invàlid: s'esperava ".concat(n, ", s'ha rebut ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Valor invàlid: s'esperava ".concat(en(t.values[0]));
                            return "Opció invàlida: s'esperava una de ".concat(_(t.values, " o "));
                        case "too_big": {
                            let r = t.inclusive ? "com a màxim" : "menys de",
                                i = n(t.origin);
                            if (i) return "Massa gran: s'esperava que ".concat(null != (c = t.origin) ? c : "el valor", " contingués ").concat(r, " ").concat(t.maximum.toString(), " ").concat(null != (u = i.unit) ? u : "elements");
                            return "Massa gran: s'esperava que ".concat(null != (l = t.origin) ? l : "el valor", " fos ").concat(r, " ").concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? "com a mínim" : "més de",
                                i = n(t.origin);
                            if (i) return "Massa petit: s'esperava que ".concat(t.origin, " contingués ").concat(r, " ").concat(t.minimum.toString(), " ").concat(i.unit);
                            return "Massa petit: s'esperava que ".concat(t.origin, " fos ").concat(r, " ").concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Format invàlid: ha de començar amb "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return "Format invàlid: ha d'acabar amb \"".concat(t.suffix, '"');
                            if ("includes" === t.format) return "Format invàlid: ha d'incloure \"".concat(t.includes, '"');
                            if ("regex" === t.format) return "Format invàlid: ha de coincidir amb el patró ".concat(t.pattern);
                            return "Format invàlid per a ".concat(null != (s = r[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Número invàlid: ha de ser múltiple de ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Clau".concat(t.keys.length > 1 ? "s" : "", " no reconeguda").concat(t.keys.length > 1 ? "s" : "", ": ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "Clau invàlida a ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Entrada invàlida";
                        case "invalid_element":
                            return "Element invàlid a ".concat(t.origin)
                    }
                }
            })()
        }
    }, "ckb", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "پیت",
                        verb: "بێت"
                    },
                    file: {
                        unit: "بایت",
                        verb: "بێت"
                    },
                    array: {
                        unit: "دانە",
                        verb: "بێت"
                    },
                    set: {
                        unit: "دانە",
                        verb: "بێت"
                    },
                    map: {
                        unit: "دانە",
                        verb: "بێت"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "regex",
                        email: "ئیمەیڵ",
                        url: "بەستەر (URL)",
                        emoji: "ئیمۆجی",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "ڕێکەوت و کات",
                        date: "ڕێکەوت",
                        time: "کات",
                        duration: "ماوە",
                        ipv4: "ناونیشانی IPv4",
                        ipv6: "ناونیشانی IPv6",
                        mac: "ناونیشانی MAC",
                        cidrv4: "مەودای IPv4",
                        cidrv6: "مەودای IPv6",
                        base64: "دەقی base64",
                        base64url: "دەقی base64url",
                        json_string: "دەقی JSON",
                        e164: "ژمارەی E.164",
                        credit_card: "ژمارەی کارتی کرێدیت",
                        currency_code: "کۆدی دراو",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "تێکردە"
                    },
                    i = {
                        nan: "NaN",
                        string: "نووسین",
                        number: "ژمارە",
                        boolean: "boolean",
                        array: "array",
                        object: "object",
                        date: "ڕێکەوت",
                        integer: "ژمارە",
                        float: "ژمارە",
                        null: "null",
                        undefined: "undefined",
                        function: "function",
                        symbol: "symbol",
                        unknown: "unknown",
                        promise: "promise",
                        void: "void",
                        never: "never",
                        map: "map",
                        set: "set"
                    };
                return t => {
                    var a, o, c;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r,
                                u = ["ا", "و", "ۆ", "وو", "ە", "ی", "ێ"].some(t => c.endsWith(t)) ? "یە" : "ە",
                                l = /^[a-zA-Z]+$/.test(c);
                            if ("null" === r || "undefined" === r) return "داواکراوە";
                            return "چاوەڕوانکراوە ".concat(n, " بێت، بەڵام ").concat(c).concat(l ? "" : u)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "بەهاکە نادرووستە: چاوەڕوانکراوە ".concat(en(t.values[0]), " بێت");
                            return "هەڵبژاردەی نادروست: چاوەڕوانکراوە یەکێک بێت لە ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = n(t.origin);
                            if (r) return "پێویستە بە لایەنی زۆرەوە ".concat(t.maximum.toString(), " ").concat(r.unit, " ").concat(r.verb);
                            return "پێویستە بە لایەنی زۆرەوە ".concat(t.maximum.toString(), " بێت")
                        }
                        case "too_small": {
                            let r = n(t.origin);
                            if (r) return "پێویستە بە لایەنی کەمەوە ".concat(t.minimum.toString(), " ").concat(r.unit, " ").concat(r.verb);
                            return "پێویستە بە لایەنی کەمەوە ".concat(t.minimum.toString(), " بێت")
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'دەقی نادروست: پێویستە دەستپێبکات بە "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'دەقی نادروست: پێویستە کۆتاییبێت بە "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'دەقی نادروست: پێویستە "'.concat(t.includes, '" لەخۆبگرێت');
                            if ("regex" === t.format) return "دەقی نادروست: پێویستە لەگەڵ پاتێرنی ".concat(t.pattern, " بگونجێت");
                            return "بەهای ".concat(null != (c = r[t.format]) ? c : t.format, " نادروستە");
                        case "not_multiple_of":
                            return "ژمارەی نادروست: دەبێت چەند هێندە بێت بۆ ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "کلیلی نەناسراو: ".concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "کلیلی نادروست لە ".concat(t.origin);
                        case "invalid_union":
                            if (t.options && Array.isArray(t.options) && t.options.length > 0) {
                                let n = t.options.map(t => "'".concat(t, "'")).join(" | ");
                                return "بەهای نەناسراو هەیە. بەهای چاوەڕوانکراو: ".concat(n)
                            }
                            return "یەکگرتنی نادروست";
                        case "invalid_element":
                            return "".concat(t.origin, " بەهاکە نادروستە");
                        default:
                            return "تێکردەی نادروست"
                    }
                }
            })()
        }
    }, "cs", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "znaků",
                        verb: "mít"
                    },
                    file: {
                        unit: "bajtů",
                        verb: "mít"
                    },
                    array: {
                        unit: "prvků",
                        verb: "mít"
                    },
                    set: {
                        unit: "prvků",
                        verb: "mít"
                    },
                    map: {
                        unit: "prvků",
                        verb: "mít"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "regulární výraz",
                        email: "e-mailová adresa",
                        url: "URL",
                        emoji: "emoji",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "datum a čas ve formátu ISO",
                        date: "datum ve formátu ISO",
                        time: "čas ve formátu ISO",
                        duration: "doba trvání ISO",
                        ipv4: "IPv4 adresa",
                        ipv6: "IPv6 adresa",
                        mac: "MAC adresa",
                        cidrv4: "rozsah IPv4",
                        cidrv6: "rozsah IPv6",
                        base64: "řetězec zakódovaný ve formátu base64",
                        base64url: "řetězec zakódovaný ve formátu base64url",
                        json_string: "řetězec ve formátu JSON",
                        e164: "číslo E.164",
                        credit_card: "číslo kreditní karty",
                        currency_code: "kód měny",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "vstup"
                    },
                    i = {
                        nan: "NaN",
                        number: "číslo",
                        string: "řetězec",
                        function: "funkce",
                        array: "pole"
                    };
                return t => {
                    var a, o, c, u, l, s, d, m, f;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "Neplatný vstup: očekáváno instanceof ".concat(t.expected, ", obdrženo ").concat(c);
                            return "Neplatný vstup: očekáváno ".concat(n, ", obdrženo ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Neplatný vstup: očekáváno ".concat(en(t.values[0]));
                            return "Neplatná možnost: očekávána jedna z hodnot ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "Hodnota je příliš velká: ".concat(null != (u = t.origin) ? u : "hodnota", " musí mít ").concat(r).concat(t.maximum.toString(), " ").concat(null != (l = i.unit) ? l : "prvků");
                            return "Hodnota je příliš velká: ".concat(null != (c = t.origin) ? c : "hodnota", " musí být ").concat(r).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "Hodnota je příliš malá: ".concat(null != (d = t.origin) ? d : "hodnota", " musí mít ").concat(r).concat(t.minimum.toString(), " ").concat(null != (m = i.unit) ? m : "prvků");
                            return "Hodnota je příliš malá: ".concat(null != (s = t.origin) ? s : "hodnota", " musí být ").concat(r).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Neplatný řetězec: musí začínat na "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Neplatný řetězec: musí končit na "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Neplatný řetězec: musí obsahovat "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Neplatný řetězec: musí odpovídat vzoru ".concat(t.pattern);
                            return "Neplatný formát ".concat(null != (f = r[t.format]) ? f : t.format);
                        case "not_multiple_of":
                            return "Neplatné číslo: musí být násobkem ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Neznámé klíče: ".concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "Neplatný klíč v ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Neplatný vstup";
                        case "invalid_element":
                            return "Neplatná hodnota v ".concat(t.origin)
                    }
                }
            })()
        }
    }, "da", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "tegn",
                        verb: "havde"
                    },
                    file: {
                        unit: "bytes",
                        verb: "havde"
                    },
                    array: {
                        unit: "elementer",
                        verb: "indeholdt"
                    },
                    set: {
                        unit: "elementer",
                        verb: "indeholdt"
                    },
                    map: {
                        unit: "elementer",
                        verb: "indeholdt"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "input",
                        email: "e-mailadresse",
                        url: "URL",
                        emoji: "emoji",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "ISO dato- og klokkeslæt",
                        date: "ISO-dato",
                        time: "ISO-klokkeslæt",
                        duration: "ISO-varighed",
                        ipv4: "IPv4-adresse",
                        ipv6: "IPv6-adresse",
                        mac: "MAC-adresse",
                        cidrv4: "IPv4-spektrum",
                        cidrv6: "IPv6-spektrum",
                        base64: "base64-kodet streng",
                        base64url: "base64url-kodet streng",
                        json_string: "JSON-streng",
                        e164: "E.164-nummer",
                        credit_card: "kreditkortnummer",
                        currency_code: "valutakode",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "input"
                    },
                    i = {
                        nan: "NaN",
                        string: "streng",
                        number: "tal",
                        boolean: "boolean",
                        array: "liste",
                        object: "objekt",
                        set: "sæt",
                        file: "fil"
                    };
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "Ugyldigt input: forventede instanceof ".concat(t.expected, ", fik ").concat(c);
                            return "Ugyldigt input: forventede ".concat(n, ", fik ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Ugyldig værdi: forventede ".concat(en(t.values[0]));
                            return "Ugyldigt valg: forventede en af følgende ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                a = n(t.origin),
                                o = null != (c = i[t.origin]) ? c : t.origin;
                            if (a) return "For stor: forventede ".concat(null != o ? o : "value", " ").concat(a.verb, " ").concat(r, " ").concat(t.maximum.toString(), " ").concat(null != (u = a.unit) ? u : "elementer");
                            return "For stor: forventede ".concat(null != o ? o : "value", " havde ").concat(r, " ").concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                a = n(t.origin),
                                o = null != (l = i[t.origin]) ? l : t.origin;
                            if (a) return "For lille: forventede ".concat(o, " ").concat(a.verb, " ").concat(r, " ").concat(t.minimum.toString(), " ").concat(a.unit);
                            return "For lille: forventede ".concat(o, " havde ").concat(r, " ").concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Ugyldig streng: skal starte med "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Ugyldig streng: skal ende med "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Ugyldig streng: skal indeholde "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Ugyldig streng: skal matche mønsteret ".concat(t.pattern);
                            return "Ugyldig ".concat(null != (s = r[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Ugyldigt tal: skal være deleligt med ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "".concat(t.keys.length > 1 ? "Ukendte nøgler" : "Ukendt nøgle", ": ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "Ugyldig nøgle i ".concat(t.origin);
                        case "invalid_union":
                            return "Ugyldigt input: matcher ingen af de tilladte typer";
                        case "invalid_element":
                            return "Ugyldig værdi i ".concat(t.origin);
                        default:
                            return "Ugyldigt input"
                    }
                }
            })()
        }
    }, "de", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "Zeichen",
                        verb: "zu haben"
                    },
                    file: {
                        unit: "Bytes",
                        verb: "zu haben"
                    },
                    array: {
                        unit: "Elemente",
                        verb: "zu haben"
                    },
                    set: {
                        unit: "Elemente",
                        verb: "zu haben"
                    },
                    map: {
                        unit: "Elemente",
                        verb: "zu haben"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "Eingabe",
                        email: "E-Mail-Adresse",
                        url: "URL",
                        emoji: "Emoji",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "ISO-Datum und -Uhrzeit",
                        date: "ISO-Datum",
                        time: "ISO-Uhrzeit",
                        duration: "ISO-Dauer",
                        ipv4: "IPv4-Adresse",
                        ipv6: "IPv6-Adresse",
                        mac: "MAC-Adresse",
                        cidrv4: "IPv4-Bereich",
                        cidrv6: "IPv6-Bereich",
                        base64: "Base64-codierter String",
                        base64url: "Base64-URL-codierter String",
                        json_string: "JSON-String",
                        e164: "E.164-Nummer",
                        credit_card: "Kreditkartennummer",
                        currency_code: "Währungscode",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "Eingabe"
                    },
                    i = {
                        nan: "NaN",
                        number: "Zahl",
                        array: "Array"
                    };
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "Ungültige Eingabe: erwartet instanceof ".concat(t.expected, ", erhalten ").concat(c);
                            return "Ungültige Eingabe: erwartet ".concat(n, ", erhalten ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Ungültige Eingabe: erwartet ".concat(en(t.values[0]));
                            return "Ungültige Option: erwartet eine von ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "Zu groß: erwartet, dass ".concat(null != (c = t.origin) ? c : "Wert", " ").concat(r).concat(t.maximum.toString(), " ").concat(null != (u = i.unit) ? u : "Elemente", " hat");
                            return "Zu groß: erwartet, dass ".concat(null != (l = t.origin) ? l : "Wert", " ").concat(r).concat(t.maximum.toString(), " ist")
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "Zu klein: erwartet, dass ".concat(t.origin, " ").concat(r).concat(t.minimum.toString(), " ").concat(i.unit, " hat");
                            return "Zu klein: erwartet, dass ".concat(t.origin, " ").concat(r).concat(t.minimum.toString(), " ist")
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Ungültiger String: muss mit "'.concat(t.prefix, '" beginnen');
                            if ("ends_with" === t.format) return 'Ungültiger String: muss mit "'.concat(t.suffix, '" enden');
                            if ("includes" === t.format) return 'Ungültiger String: muss "'.concat(t.includes, '" enthalten');
                            if ("regex" === t.format) return "Ungültiger String: muss dem Muster ".concat(t.pattern, " entsprechen");
                            return "Ungültig: ".concat(null != (s = r[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Ungültige Zahl: muss ein Vielfaches von ".concat(t.divisor, " sein");
                        case "unrecognized_keys":
                            return "".concat(t.keys.length > 1 ? "Unbekannte Schlüssel" : "Unbekannter Schlüssel", ": ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "Ungültiger Schlüssel in ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Ungültige Eingabe";
                        case "invalid_element":
                            return "Ungültiger Wert in ".concat(t.origin)
                    }
                }
            })()
        }
    }, "el", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "χαρακτήρες",
                        verb: "να έχει"
                    },
                    file: {
                        unit: "bytes",
                        verb: "να έχει"
                    },
                    array: {
                        unit: "στοιχεία",
                        verb: "να έχει"
                    },
                    set: {
                        unit: "στοιχεία",
                        verb: "να έχει"
                    },
                    map: {
                        unit: "καταχωρήσεις",
                        verb: "να έχει"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "είσοδος",
                        email: "διεύθυνση email",
                        url: "URL",
                        emoji: "emoji",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "ISO ημερομηνία και ώρα",
                        date: "ISO ημερομηνία",
                        time: "ISO ώρα",
                        duration: "ISO διάρκεια",
                        ipv4: "διεύθυνση IPv4",
                        ipv6: "διεύθυνση IPv6",
                        mac: "διεύθυνση MAC",
                        cidrv4: "εύρος IPv4",
                        cidrv6: "εύρος IPv6",
                        base64: "συμβολοσειρά κωδικοποιημένη σε base64",
                        base64url: "συμβολοσειρά κωδικοποιημένη σε base64url",
                        json_string: "συμβολοσειρά JSON",
                        e164: "αριθμός E.164",
                        credit_card: "αριθμός πιστωτικής κάρτας",
                        currency_code: "κωδικός νομίσματος",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "είσοδος"
                    },
                    i = {
                        nan: "NaN"
                    };
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if ("string" == typeof t.expected && /^[A-Z]/.test(t.expected)) return "Μη έγκυρη είσοδος: αναμενόταν instanceof ".concat(t.expected, ", λήφθηκε ").concat(c);
                            return "Μη έγκυρη είσοδος: αναμενόταν ".concat(n, ", λήφθηκε ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Μη έγκυρη είσοδος: αναμενόταν ".concat(en(t.values[0]));
                            return "Μη έγκυρη επιλογή: αναμενόταν ένα από ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "Πολύ μεγάλο: αναμενόταν ".concat(null != (c = t.origin) ? c : "τιμή", " να έχει ").concat(r).concat(t.maximum.toString(), " ").concat(null != (u = i.unit) ? u : "στοιχεία");
                            return "Πολύ μεγάλο: αναμενόταν ".concat(null != (l = t.origin) ? l : "τιμή", " να είναι ").concat(r).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "Πολύ μικρό: αναμενόταν ".concat(t.origin, " να έχει ").concat(r).concat(t.minimum.toString(), " ").concat(i.unit);
                            return "Πολύ μικρό: αναμενόταν ".concat(t.origin, " να είναι ").concat(r).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Μη έγκυρη συμβολοσειρά: πρέπει να ξεκινά με "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Μη έγκυρη συμβολοσειρά: πρέπει να τελειώνει με "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Μη έγκυρη συμβολοσειρά: πρέπει να περιέχει "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Μη έγκυρη συμβολοσειρά: πρέπει να ταιριάζει με το μοτίβο ".concat(t.pattern);
                            return "Μη έγκυρο: ".concat(null != (s = r[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Μη έγκυρος αριθμός: πρέπει να είναι πολλαπλάσιο του ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Άγνωστ".concat(t.keys.length > 1 ? "α" : "ο", " κλειδ").concat(t.keys.length > 1 ? "ιά" : "ί", ": ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "Μη έγκυρο κλειδί στο ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Μη έγκυρη είσοδος";
                        case "invalid_element":
                            return "Μη έγκυρη τιμή στο ".concat(t.origin)
                    }
                }
            })()
        }
    }, "en", 0, tV, "eo", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "karaktrojn",
                        verb: "havi"
                    },
                    file: {
                        unit: "bajtojn",
                        verb: "havi"
                    },
                    array: {
                        unit: "elementojn",
                        verb: "havi"
                    },
                    set: {
                        unit: "elementojn",
                        verb: "havi"
                    },
                    map: {
                        unit: "elementojn",
                        verb: "havi"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "enigo",
                        email: "retadreso",
                        url: "URL",
                        emoji: "emoĝio",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "ISO-datotempo",
                        date: "ISO-dato",
                        time: "ISO-tempo",
                        duration: "ISO-daŭro",
                        ipv4: "IPv4-adreso",
                        ipv6: "IPv6-adreso",
                        mac: "MAC-adreso",
                        cidrv4: "IPv4-rango",
                        cidrv6: "IPv6-rango",
                        base64: "64-ume kodita karaktraro",
                        base64url: "URL-64-ume kodita karaktraro",
                        json_string: "JSON-karaktraro",
                        e164: "E.164-nombro",
                        credit_card: "kreditkarta numero",
                        currency_code: "valuta kodo",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "enigo"
                    },
                    i = {
                        nan: "NaN",
                        number: "nombro",
                        array: "tabelo",
                        null: "senvalora"
                    };
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "Nevalida enigo: atendiĝis instanceof ".concat(t.expected, ", riceviĝis ").concat(c);
                            return "Nevalida enigo: atendiĝis ".concat(n, ", riceviĝis ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Nevalida enigo: atendiĝis ".concat(en(t.values[0]));
                            return "Nevalida opcio: atendiĝis unu el ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "Tro granda: atendiĝis ke ".concat(null != (c = t.origin) ? c : "valoro", " havu ").concat(r).concat(t.maximum.toString(), " ").concat(null != (u = i.unit) ? u : "elementojn");
                            return "Tro granda: atendiĝis ke ".concat(null != (l = t.origin) ? l : "valoro", " havu ").concat(r).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "Tro malgranda: atendiĝis ke ".concat(t.origin, " havu ").concat(r).concat(t.minimum.toString(), " ").concat(i.unit);
                            return "Tro malgranda: atendiĝis ke ".concat(t.origin, " estu ").concat(r).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Nevalida karaktraro: devas komenciĝi per "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Nevalida karaktraro: devas finiĝi per "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Nevalida karaktraro: devas inkluzivi "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Nevalida karaktraro: devas kongrui kun la modelo ".concat(t.pattern);
                            return "Nevalida ".concat(null != (s = r[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Nevalida nombro: devas esti oblo de ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Nekonata".concat(t.keys.length > 1 ? "j" : "", " ŝlosilo").concat(t.keys.length > 1 ? "j" : "", ": ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "Nevalida ŝlosilo en ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Nevalida enigo";
                        case "invalid_element":
                            return "Nevalida valoro en ".concat(t.origin)
                    }
                }
            })()
        }
    }, "es", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "caracteres",
                        verb: "tener"
                    },
                    file: {
                        unit: "bytes",
                        verb: "tener"
                    },
                    array: {
                        unit: "elementos",
                        verb: "tener"
                    },
                    set: {
                        unit: "elementos",
                        verb: "tener"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "entrada",
                        email: "dirección de correo electrónico",
                        url: "URL",
                        emoji: "emoji",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "fecha y hora ISO",
                        date: "fecha ISO",
                        time: "hora ISO",
                        duration: "duración ISO",
                        ipv4: "dirección IPv4",
                        ipv6: "dirección IPv6",
                        mac: "dirección MAC",
                        cidrv4: "rango IPv4",
                        cidrv6: "rango IPv6",
                        base64: "cadena codificada en base64",
                        base64url: "URL codificada en base64",
                        json_string: "cadena JSON",
                        e164: "número E.164",
                        credit_card: "número de tarjeta de crédito",
                        currency_code: "código de moneda",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "entrada"
                    },
                    i = {
                        nan: "NaN",
                        string: "texto",
                        number: "número",
                        boolean: "booleano",
                        array: "arreglo",
                        object: "objeto",
                        set: "conjunto",
                        file: "archivo",
                        date: "fecha",
                        bigint: "número grande",
                        symbol: "símbolo",
                        undefined: "indefinido",
                        null: "nulo",
                        function: "función",
                        map: "mapa",
                        record: "registro",
                        tuple: "tupla",
                        enum: "enumeración",
                        union: "unión",
                        literal: "literal",
                        promise: "promesa",
                        void: "vacío",
                        never: "nunca",
                        unknown: "desconocido",
                        any: "cualquiera"
                    };
                return t => {
                    var a, o, c, u, l, s, d, m;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "Entrada inválida: se esperaba instanceof ".concat(t.expected, ", recibido ").concat(c);
                            return "Entrada inválida: se esperaba ".concat(n, ", recibido ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Entrada inválida: se esperaba ".concat(en(t.values[0]));
                            return "Opción inválida: se esperaba una de ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                a = n(t.origin),
                                o = null != (c = i[t.origin]) ? c : t.origin;
                            if (a) return "Demasiado grande: se esperaba que ".concat(null != o ? o : "valor", " tuviera ").concat(r).concat(t.maximum.toString(), " ").concat(null != (u = a.unit) ? u : "elementos");
                            return "Demasiado grande: se esperaba que ".concat(null != o ? o : "valor", " fuera ").concat(r).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                a = n(t.origin),
                                o = null != (l = i[t.origin]) ? l : t.origin;
                            if (a) return "Demasiado pequeño: se esperaba que ".concat(o, " tuviera ").concat(r).concat(t.minimum.toString(), " ").concat(a.unit);
                            return "Demasiado pequeño: se esperaba que ".concat(o, " fuera ").concat(r).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Cadena inválida: debe comenzar con "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Cadena inválida: debe terminar en "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Cadena inválida: debe incluir "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Cadena inválida: debe coincidir con el patrón ".concat(t.pattern);
                            return "Inválido ".concat(null != (s = r[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Número inválido: debe ser múltiplo de ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Llave".concat(t.keys.length > 1 ? "s" : "", " desconocida").concat(t.keys.length > 1 ? "s" : "", ": ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "Llave inválida en ".concat(null != (d = i[t.origin]) ? d : t.origin);
                        case "invalid_union":
                        default:
                            return "Entrada inválida";
                        case "invalid_element":
                            return "Valor inválido en ".concat(null != (m = i[t.origin]) ? m : t.origin)
                    }
                }
            })()
        }
    }, "fa", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "کاراکتر",
                        verb: "داشته باشد"
                    },
                    file: {
                        unit: "بایت",
                        verb: "داشته باشد"
                    },
                    array: {
                        unit: "آیتم",
                        verb: "داشته باشد"
                    },
                    set: {
                        unit: "آیتم",
                        verb: "داشته باشد"
                    },
                    map: {
                        unit: "آیتم",
                        verb: "داشته باشد"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "ورودی",
                        email: "آدرس ایمیل",
                        url: "URL",
                        emoji: "ایموجی",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "تاریخ و زمان ایزو",
                        date: "تاریخ ایزو",
                        time: "زمان ایزو",
                        duration: "مدت زمان ایزو",
                        ipv4: "IPv4 آدرس",
                        ipv6: "IPv6 آدرس",
                        mac: "MAC آدرس",
                        cidrv4: "IPv4 دامنه",
                        cidrv6: "IPv6 دامنه",
                        base64: "base64-encoded رشته",
                        base64url: "base64url-encoded رشته",
                        json_string: "JSON رشته",
                        e164: "E.164 عدد",
                        credit_card: "شماره کارت اعتباری",
                        currency_code: "کد ارز",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "ورودی"
                    },
                    i = {
                        nan: "NaN",
                        number: "عدد",
                        array: "آرایه"
                    };
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "ورودی نامعتبر: می‌بایست instanceof ".concat(t.expected, " می‌بود، ").concat(c, " دریافت شد");
                            return "ورودی نامعتبر: می‌بایست ".concat(n, " می‌بود، ").concat(c, " دریافت شد")
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "ورودی نامعتبر: می‌بایست ".concat(en(t.values[0]), " می‌بود");
                            return "گزینه نامعتبر: می‌بایست یکی از ".concat(_(t.values, "|"), " می‌بود");
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "خیلی بزرگ: ".concat(null != (u = t.origin) ? u : "مقدار", " باید ").concat(r).concat(t.maximum.toString(), " ").concat(null != (l = i.unit) ? l : "عنصر", " باشد");
                            return "خیلی بزرگ: ".concat(null != (c = t.origin) ? c : "مقدار", " باید ").concat(r).concat(t.maximum.toString(), " باشد")
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "خیلی کوچک: ".concat(t.origin, " باید ").concat(r).concat(t.minimum.toString(), " ").concat(i.unit, " باشد");
                            return "خیلی کوچک: ".concat(t.origin, " باید ").concat(r).concat(t.minimum.toString(), " باشد")
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'رشته نامعتبر: باید با "'.concat(t.prefix, '" شروع شود');
                            if ("ends_with" === t.format) return 'رشته نامعتبر: باید با "'.concat(t.suffix, '" تمام شود');
                            if ("includes" === t.format) return 'رشته نامعتبر: باید شامل "'.concat(t.includes, '" باشد');
                            if ("regex" === t.format) return "رشته نامعتبر: باید با الگوی ".concat(t.pattern, " مطابقت داشته باشد");
                            return "".concat(null != (s = r[t.format]) ? s : t.format, " نامعتبر");
                        case "not_multiple_of":
                            return "عدد نامعتبر: باید مضرب ".concat(t.divisor, " باشد");
                        case "unrecognized_keys":
                            return "کلید".concat(t.keys.length > 1 ? "های" : "", " ناشناس: ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "کلید ناشناس در ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "ورودی نامعتبر";
                        case "invalid_element":
                            return "مقدار نامعتبر در ".concat(t.origin)
                    }
                }
            })()
        }
    }, "fi", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "merkkiä",
                        subject: "merkkijonon"
                    },
                    file: {
                        unit: "tavua",
                        subject: "tiedoston"
                    },
                    array: {
                        unit: "alkiota",
                        subject: "listan"
                    },
                    set: {
                        unit: "alkiota",
                        subject: "joukon"
                    },
                    map: {
                        unit: "alkiota",
                        subject: "kuvauksen"
                    },
                    number: {
                        unit: "",
                        subject: "luvun"
                    },
                    bigint: {
                        unit: "",
                        subject: "suuren kokonaisluvun"
                    },
                    int: {
                        unit: "",
                        subject: "kokonaisluvun"
                    },
                    date: {
                        unit: "",
                        subject: "päivämäärän"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "säännöllinen lauseke",
                        email: "sähköpostiosoite",
                        url: "URL-osoite",
                        emoji: "emoji",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "ISO-aikaleima",
                        date: "ISO-päivämäärä",
                        time: "ISO-aika",
                        duration: "ISO-kesto",
                        ipv4: "IPv4-osoite",
                        ipv6: "IPv6-osoite",
                        mac: "MAC-osoite",
                        cidrv4: "IPv4-alue",
                        cidrv6: "IPv6-alue",
                        base64: "base64-koodattu merkkijono",
                        base64url: "base64url-koodattu merkkijono",
                        json_string: "JSON-merkkijono",
                        e164: "E.164-luku",
                        credit_card: "luottokortin numero",
                        currency_code: "valuuttakoodi",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "templaattimerkkijono"
                    },
                    i = {
                        nan: "NaN"
                    };
                return t => {
                    var a, o, c;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "Virheellinen tyyppi: odotettiin instanceof ".concat(t.expected, ", oli ").concat(c);
                            return "Virheellinen tyyppi: odotettiin ".concat(n, ", oli ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Virheellinen syöte: täytyy olla ".concat(en(t.values[0]));
                            return "Virheellinen valinta: täytyy olla yksi seuraavista: ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "Liian suuri: ".concat(i.subject, " täytyy olla ").concat(r).concat(t.maximum.toString(), " ").concat(i.unit).trim();
                            return "Liian suuri: arvon täytyy olla ".concat(r).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "Liian pieni: ".concat(i.subject, " täytyy olla ").concat(r).concat(t.minimum.toString(), " ").concat(i.unit).trim();
                            return "Liian pieni: arvon täytyy olla ".concat(r).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Virheellinen syöte: täytyy alkaa "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Virheellinen syöte: täytyy loppua "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Virheellinen syöte: täytyy sisältää "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Virheellinen syöte: täytyy vastata säännöllistä lauseketta ".concat(t.pattern);
                            return "Virheellinen ".concat(null != (c = r[t.format]) ? c : t.format);
                        case "not_multiple_of":
                            return "Virheellinen luku: täytyy olla luvun ".concat(t.divisor, " monikerta");
                        case "unrecognized_keys":
                            return "".concat(t.keys.length > 1 ? "Tuntemattomat avaimet" : "Tuntematon avain", ": ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "Virheellinen avain tietueessa";
                        case "invalid_union":
                            return "Virheellinen unioni";
                        case "invalid_element":
                            return "Virheellinen arvo joukossa";
                        default:
                            return "Virheellinen syöte"
                    }
                }
            })()
        }
    }, "fr", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "caractères",
                        verb: "avoir"
                    },
                    file: {
                        unit: "octets",
                        verb: "avoir"
                    },
                    array: {
                        unit: "éléments",
                        verb: "avoir"
                    },
                    set: {
                        unit: "éléments",
                        verb: "avoir"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "expression régulière",
                        email: "adresse e-mail",
                        url: "URL",
                        emoji: "emoji",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "date et heure ISO",
                        date: "date ISO",
                        time: "heure ISO",
                        duration: "durée ISO",
                        ipv4: "adresse IPv4",
                        ipv6: "adresse IPv6",
                        mac: "adresse MAC",
                        cidrv4: "plage IPv4",
                        cidrv6: "plage IPv6",
                        base64: "chaîne de caractères encodée en base64",
                        base64url: "chaîne de caractères encodée en base64url",
                        json_string: "chaîne de caractères JSON",
                        e164: "numéro au format E.164",
                        credit_card: "numéro de carte de crédit",
                        currency_code: "code de devise",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "entrée"
                    },
                    i = {
                        string: "chaîne de caractères",
                        number: "nombre",
                        int: "entier",
                        boolean: "booléen",
                        bigint: "grand entier",
                        symbol: "symbole",
                        undefined: "indéfini",
                        null: "null",
                        never: "jamais",
                        void: "vide",
                        date: "date",
                        array: "tableau",
                        object: "objet",
                        tuple: "tuple",
                        record: "record",
                        map: "map",
                        set: "ensemble",
                        file: "fichier",
                        nonoptional: "non optionnel",
                        nan: "NaN",
                        function: "fonction"
                    };
                return t => {
                    var a, o, c, u, l, s, d, m;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "Entrée invalide : instance de ".concat(t.expected, " attendu, ").concat(c, " reçu");
                            return "Entrée invalide : ".concat(n, " attendu, ").concat(c, " reçu")
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Entrée invalide : ".concat(en(t.values[0]), " attendu");
                            return "Option invalide : une valeur parmi ".concat(_(t.values, "|"), " attendue");
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                a = n(t.origin);
                            if (a) return "Trop grand : ".concat(null != (c = i[t.origin]) ? c : "valeur", " doit ").concat(a.verb, " ").concat(r).concat(t.maximum.toString(), " ").concat(null != (u = a.unit) ? u : "élément(s)");
                            return "Trop grand : ".concat(null != (l = i[t.origin]) ? l : "valeur", " doit être ").concat(r).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                a = n(t.origin);
                            if (a) return "Trop petit : ".concat(null != (s = i[t.origin]) ? s : "valeur", " doit ").concat(a.verb, " ").concat(r).concat(t.minimum.toString(), " ").concat(a.unit);
                            return "Trop petit : ".concat(null != (d = i[t.origin]) ? d : "valeur", " doit être ").concat(r).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Chaîne de caractères invalide : doit commencer par "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Chaîne de caractères invalide : doit se terminer par "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Chaîne de caractères invalide : doit inclure "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Chaîne de caractères invalide : doit correspondre au motif ".concat(t.pattern);
                            return "".concat(null != (m = r[t.format]) ? m : t.format, " invalide");
                        case "not_multiple_of":
                            return "Nombre invalide : doit être un multiple de ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Clé".concat(t.keys.length > 1 ? "s" : "", " non reconnue").concat(t.keys.length > 1 ? "s" : "", " : ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "Clé invalide dans ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Entrée invalide";
                        case "invalid_element":
                            return "Valeur invalide dans ".concat(t.origin)
                    }
                }
            })()
        }
    }, "frCA", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "caractères",
                        verb: "avoir"
                    },
                    file: {
                        unit: "octets",
                        verb: "avoir"
                    },
                    array: {
                        unit: "éléments",
                        verb: "avoir"
                    },
                    set: {
                        unit: "éléments",
                        verb: "avoir"
                    },
                    map: {
                        unit: "éléments",
                        verb: "avoir"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "entrée",
                        email: "adresse courriel",
                        url: "URL",
                        emoji: "emoji",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "date-heure ISO",
                        date: "date ISO",
                        time: "heure ISO",
                        duration: "durée ISO",
                        ipv4: "adresse IPv4",
                        ipv6: "adresse IPv6",
                        mac: "adresse MAC",
                        cidrv4: "plage IPv4",
                        cidrv6: "plage IPv6",
                        base64: "chaîne encodée en base64",
                        base64url: "chaîne encodée en base64url",
                        json_string: "chaîne JSON",
                        e164: "numéro E.164",
                        credit_card: "numéro de carte de crédit",
                        currency_code: "code de devise",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "entrée"
                    },
                    i = {
                        nan: "NaN"
                    };
                return t => {
                    var a, o, c, u, l;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "Entrée invalide : attendu instanceof ".concat(t.expected, ", reçu ").concat(c);
                            return "Entrée invalide : attendu ".concat(n, ", reçu ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Entrée invalide : attendu ".concat(en(t.values[0]));
                            return "Option invalide : attendu l'une des valeurs suivantes ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "≤" : "<",
                                i = n(t.origin);
                            if (i) return "Trop grand : attendu que ".concat(null != (c = t.origin) ? c : "la valeur", " ait ").concat(r).concat(t.maximum.toString(), " ").concat(i.unit);
                            return "Trop grand : attendu que ".concat(null != (u = t.origin) ? u : "la valeur", " soit ").concat(r).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? "≥" : ">",
                                i = n(t.origin);
                            if (i) return "Trop petit : attendu que ".concat(t.origin, " ait ").concat(r).concat(t.minimum.toString(), " ").concat(i.unit);
                            return "Trop petit : attendu que ".concat(t.origin, " soit ").concat(r).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Chaîne invalide : doit commencer par "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Chaîne invalide : doit se terminer par "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Chaîne invalide : doit inclure "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Chaîne invalide : doit correspondre au motif ".concat(t.pattern);
                            return "".concat(null != (l = r[t.format]) ? l : t.format, " invalide");
                        case "not_multiple_of":
                            return "Nombre invalide : doit être un multiple de ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Clé".concat(t.keys.length > 1 ? "s" : "", " non reconnue").concat(t.keys.length > 1 ? "s" : "", " : ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "Clé invalide dans ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Entrée invalide";
                        case "invalid_element":
                            return "Valeur invalide dans ".concat(t.origin)
                    }
                }
            })()
        }
    }, "gu", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "અક્ષર",
                        verb: "હોવા જોઈએ"
                    },
                    file: {
                        unit: "બાયટ",
                        verb: "હોવા જોઈએ"
                    },
                    array: {
                        unit: "આઇટમ",
                        verb: "હોવા જોઈએ"
                    },
                    set: {
                        unit: "આઇટમ",
                        verb: "હોવા જોઈએ"
                    },
                    map: {
                        unit: "એન્ટ્રી",
                        verb: "હોવા જોઈએ"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "ઇનપુટ",
                        email: "ઈમેઇલ એડ્રેસ",
                        url: "URL",
                        emoji: "ઇમોજી",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "ISO તારીખ અને સમય",
                        date: "ISO તારીખ",
                        time: "ISO સમય",
                        duration: "ISO અવધિ",
                        ipv4: "IPv4 એડ્રેસ",
                        ipv6: "IPv6 એડ્રેસ",
                        mac: "MAC એડ્રેસ",
                        cidrv4: "IPv4 શ્રેણી",
                        cidrv6: "IPv6 શ્રેણી",
                        base64: "base64-એન્કોડેડ સ્ટ્રિંગ",
                        base64url: "base64url-એન્કોડેડ સ્ટ્રિંગ",
                        json_string: "JSON સ્ટ્રિંગ",
                        e164: "E.164 નંબર",
                        credit_card: "ક્રેડિટ કાર્ડ નંબર",
                        currency_code: "ચલણ કોડ",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "ઇનપુટ"
                    },
                    i = {
                        nan: "NaN"
                    };
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            return "અમાન્ય ઇનપુટ: અપેક્ષિત ".concat(n, ", પ્રાપ્ત ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "અમાન્ય ઇનપુટ: અપેક્ષિત ".concat(en(t.values[0]));
                            return "અમાન્ય વિકલ્પ: ".concat(_(t.values, " | "), " માધ્યમથી એક અપેક્ષિત");
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "ખૂબ મોટું: ".concat(null != (c = t.origin) ? c : "મૂલ્ય", " ").concat(r).concat(t.maximum.toString(), " ").concat(null != (u = i.unit) ? u : "એલિમેન્ટ", " હોવા જોઈએ");
                            return "ખૂબ મોટું: ".concat(null != (l = t.origin) ? l : "મૂલ્ય", " ").concat(r).concat(t.maximum.toString(), " હોવું જોઈએ")
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "ખૂબ નાનું: ".concat(t.origin, " ").concat(r).concat(t.minimum.toString(), " ").concat(i.unit, " હોવા જોઈએ");
                            return "ખૂબ નાનું: ".concat(t.origin, " ").concat(r).concat(t.minimum.toString(), " હોવું જોઈએ")
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'અમાન્ય સ્ટ્રિંગ: "'.concat(t.prefix, '" થી શરૂ થવું જોઈએ');
                            if ("ends_with" === t.format) return 'અમાન્ય સ્ટ્રિંગ: "'.concat(t.suffix, '" પર સમાપ્ત થવું જોઈએ');
                            if ("includes" === t.format) return 'અમાન્ય સ્ટ્રિંગ: "'.concat(t.includes, '" શામેલ હોવું જોઈએ');
                            if ("regex" === t.format) return "અમાન્ય સ્ટ્રિંગ: પેટર્ન ".concat(t.pattern, " સાથે મેળ ખાવું જોઈએ");
                            return "અમાન્ય ".concat(null != (s = r[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "અમાન્ય નંબર: ".concat(t.divisor, " નો ગુણાંક હોવો જોઈએ");
                        case "unrecognized_keys":
                            return "ઓળખી શકાતા નહીં તે કી".concat(t.keys.length > 1 ? "ઓ" : "", ": ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "".concat(t.origin, " માં અમાન્ય કી");
                        case "invalid_union":
                            if (t.options && Array.isArray(t.options) && t.options.length > 0) {
                                let n = t.options.map(t => "'".concat(t, "'")).join(" | ");
                                return "અમાન્ય ડિસ્ક્રિમિનેટર મૂલ્ય. અપેક્ષિત ".concat(n)
                            }
                            return "અમાન્ય ઇનપુટ";
                        case "invalid_element":
                            return "".concat(t.origin, " માં અમાન્ય મૂલ્ય");
                        default:
                            return "અમાન્ય ઇનપુટ"
                    }
                }
            })()
        }
    }, "he", 0, function() {
        let t, n, r, i, a, o, c, u, l;
        return {
            localeError: (t = {
                string: {
                    label: "מחרוזת",
                    gender: "f"
                },
                number: {
                    label: "מספר",
                    gender: "m"
                },
                boolean: {
                    label: "ערך בוליאני",
                    gender: "m"
                },
                bigint: {
                    label: "BigInt",
                    gender: "m"
                },
                date: {
                    label: "תאריך",
                    gender: "m"
                },
                array: {
                    label: "מערך",
                    gender: "m"
                },
                object: {
                    label: "אובייקט",
                    gender: "m"
                },
                null: {
                    label: "ערך ריק (null)",
                    gender: "m"
                },
                undefined: {
                    label: "ערך לא מוגדר (undefined)",
                    gender: "m"
                },
                symbol: {
                    label: "סימבול (Symbol)",
                    gender: "m"
                },
                function: {
                    label: "פונקציה",
                    gender: "f"
                },
                map: {
                    label: "מפה (Map)",
                    gender: "f"
                },
                set: {
                    label: "קבוצה (Set)",
                    gender: "f"
                },
                file: {
                    label: "קובץ",
                    gender: "m"
                },
                promise: {
                    label: "Promise",
                    gender: "m"
                },
                NaN: {
                    label: "NaN",
                    gender: "m"
                },
                unknown: {
                    label: "ערך לא ידוע",
                    gender: "m"
                },
                value: {
                    label: "ערך",
                    gender: "m"
                }
            }, n = {
                string: {
                    unit: "תווים",
                    shortLabel: "קצר",
                    longLabel: "ארוך"
                },
                file: {
                    unit: "בייטים",
                    shortLabel: "קטן",
                    longLabel: "גדול"
                },
                array: {
                    unit: "פריטים",
                    shortLabel: "קטן",
                    longLabel: "גדול"
                },
                set: {
                    unit: "פריטים",
                    shortLabel: "קטן",
                    longLabel: "גדול"
                },
                number: {
                    unit: "",
                    shortLabel: "קטן",
                    longLabel: "גדול"
                }
            }, r = n => n ? t[n] : void 0, i = n => {
                let i = r(n);
                return i ? i.label : null != n ? n : t.unknown.label
            }, a = t => "ה".concat(i(t)), o = t => {
                var n;
                let i = r(t);
                return "f" === (null != (n = null == i ? void 0 : i.gender) ? n : "m") ? "צריכה להיות" : "צריך להיות"
            }, c = t => {
                var r;
                return t && null != (r = n[t]) ? r : null
            }, u = {
                regex: {
                    label: "קלט",
                    gender: "m"
                },
                email: {
                    label: "כתובת אימייל",
                    gender: "f"
                },
                url: {
                    label: "כתובת רשת",
                    gender: "f"
                },
                emoji: {
                    label: "אימוג'י",
                    gender: "m"
                },
                uuid: {
                    label: "UUID",
                    gender: "m"
                },
                uuidv4: {
                    label: "UUIDv4",
                    gender: "m"
                },
                uuidv6: {
                    label: "UUIDv6",
                    gender: "m"
                },
                nanoid: {
                    label: "nanoid",
                    gender: "m"
                },
                guid: {
                    label: "GUID",
                    gender: "m"
                },
                cuid: {
                    label: "cuid",
                    gender: "m"
                },
                cuid2: {
                    label: "cuid2",
                    gender: "m"
                },
                ulid: {
                    label: "ULID",
                    gender: "m"
                },
                xid: {
                    label: "XID",
                    gender: "m"
                },
                ksuid: {
                    label: "KSUID",
                    gender: "m"
                },
                datetime: {
                    label: "תאריך וזמן ISO",
                    gender: "m"
                },
                date: {
                    label: "תאריך ISO",
                    gender: "m"
                },
                time: {
                    label: "זמן ISO",
                    gender: "m"
                },
                duration: {
                    label: "משך זמן ISO",
                    gender: "m"
                },
                ipv4: {
                    label: "כתובת IPv4",
                    gender: "f"
                },
                ipv6: {
                    label: "כתובת IPv6",
                    gender: "f"
                },
                mac: {
                    label: "כתובת MAC",
                    gender: "f"
                },
                cidrv4: {
                    label: "טווח IPv4",
                    gender: "m"
                },
                cidrv6: {
                    label: "טווח IPv6",
                    gender: "m"
                },
                base64: {
                    label: "מחרוזת בבסיס 64",
                    gender: "f"
                },
                base64url: {
                    label: "מחרוזת בבסיס 64 לכתובות רשת",
                    gender: "f"
                },
                json_string: {
                    label: "מחרוזת JSON",
                    gender: "f"
                },
                e164: {
                    label: "מספר E.164",
                    gender: "m"
                },
                credit_card: {
                    label: "מספר כרטיס אשראי",
                    gender: "m"
                },
                currency_code: {
                    label: "קוד מטבע",
                    gender: "m"
                },
                iban: {
                    label: "IBAN",
                    gender: "m"
                },
                jwt: {
                    label: "JWT",
                    gender: "m"
                },
                template_literal: {
                    label: "קלט",
                    gender: "m"
                },
                ends_with: {
                    label: "קלט",
                    gender: "m"
                },
                includes: {
                    label: "קלט",
                    gender: "m"
                },
                lowercase: {
                    label: "קלט",
                    gender: "m"
                },
                starts_with: {
                    label: "קלט",
                    gender: "m"
                },
                uppercase: {
                    label: "קלט",
                    gender: "m"
                }
            }, l = {
                nan: "NaN"
            }, n => {
                var r, s, d, m, f, v, p, g, h, b, y, I, k, w, x, S, z, A, U, P, O;
                switch (n.code) {
                    case "invalid_type": {
                        let a = n.expected,
                            o = null != (r = l[null != a ? a : ""]) ? r : i(a),
                            c = eS(n.input),
                            u = null != (s = null != (d = l[c]) ? d : null == (m = t[c]) ? void 0 : m.label) ? s : c;
                        if (/^[A-Z]/.test(n.expected)) return "קלט לא תקין: צריך להיות instanceof ".concat(n.expected, ", התקבל ").concat(u);
                        return "קלט לא תקין: צריך להיות ".concat(o, ", התקבל ").concat(u)
                    }
                    case "invalid_value": {
                        if (1 === n.values.length) return "ערך לא תקין: הערך חייב להיות ".concat(en(n.values[0]));
                        let t = n.values.map(t => en(t));
                        if (2 === n.values.length) return "ערך לא תקין: האפשרויות המתאימות הן ".concat(t[0], " או ").concat(t[1]);
                        let r = t[t.length - 1],
                            i = t.slice(0, -1).join(", ");
                        return "ערך לא תקין: האפשרויות המתאימות הן ".concat(i, " או ").concat(r)
                    }
                    case "too_big": {
                        let t = c(n.origin),
                            r = a(null != (f = n.origin) ? f : "value");
                        if ("string" === n.origin) return "".concat(null != (g = null == t ? void 0 : t.longLabel) ? g : "ארוך", " מדי: ").concat(r, " צריכה להכיל ").concat(n.maximum.toString(), " ").concat(null != (h = null == t ? void 0 : t.unit) ? h : "", " ").concat(n.inclusive ? "או פחות" : "לכל היותר").trim();
                        if ("number" === n.origin) {
                            let t = n.inclusive ? "קטן או שווה ל-".concat(n.maximum) : "קטן מ-".concat(n.maximum);
                            return "גדול מדי: ".concat(r, " צריך להיות ").concat(t)
                        }
                        if ("array" === n.origin || "set" === n.origin) {
                            let i = "set" === n.origin ? "צריכה" : "צריך",
                                a = n.inclusive ? "".concat(n.maximum, " ").concat(null != (b = null == t ? void 0 : t.unit) ? b : "", " או פחות") : "פחות מ-".concat(n.maximum, " ").concat(null != (y = null == t ? void 0 : t.unit) ? y : "");
                            return "גדול מדי: ".concat(r, " ").concat(i, " להכיל ").concat(a).trim()
                        }
                        let i = n.inclusive ? "<=" : "<",
                            u = o(null != (v = n.origin) ? v : "value");
                        if (null == t ? void 0 : t.unit) return "".concat(t.longLabel, " מדי: ").concat(r, " ").concat(u, " ").concat(i).concat(n.maximum.toString(), " ").concat(t.unit);
                        return "".concat(null != (p = null == t ? void 0 : t.longLabel) ? p : "גדול", " מדי: ").concat(r, " ").concat(u, " ").concat(i).concat(n.maximum.toString())
                    }
                    case "too_small": {
                        let t = c(n.origin),
                            r = a(null != (I = n.origin) ? I : "value");
                        if ("string" === n.origin) return "".concat(null != (x = null == t ? void 0 : t.shortLabel) ? x : "קצר", " מדי: ").concat(r, " צריכה להכיל ").concat(n.minimum.toString(), " ").concat(null != (S = null == t ? void 0 : t.unit) ? S : "", " ").concat(n.inclusive ? "או יותר" : "לפחות").trim();
                        if ("number" === n.origin) {
                            let t = n.inclusive ? "גדול או שווה ל-".concat(n.minimum) : "גדול מ-".concat(n.minimum);
                            return "קטן מדי: ".concat(r, " צריך להיות ").concat(t)
                        }
                        if ("array" === n.origin || "set" === n.origin) {
                            let i = "set" === n.origin ? "צריכה" : "צריך";
                            if (1 === n.minimum && n.inclusive) {
                                let t = (n.origin, "לפחות פריט אחד");
                                return "קטן מדי: ".concat(r, " ").concat(i, " להכיל ").concat(t)
                            }
                            let a = n.inclusive ? "".concat(n.minimum, " ").concat(null != (z = null == t ? void 0 : t.unit) ? z : "", " או יותר") : "יותר מ-".concat(n.minimum, " ").concat(null != (A = null == t ? void 0 : t.unit) ? A : "");
                            return "קטן מדי: ".concat(r, " ").concat(i, " להכיל ").concat(a).trim()
                        }
                        let i = n.inclusive ? ">=" : ">",
                            u = o(null != (k = n.origin) ? k : "value");
                        if (null == t ? void 0 : t.unit) return "".concat(t.shortLabel, " מדי: ").concat(r, " ").concat(u, " ").concat(i).concat(n.minimum.toString(), " ").concat(t.unit);
                        return "".concat(null != (w = null == t ? void 0 : t.shortLabel) ? w : "קטן", " מדי: ").concat(r, " ").concat(u, " ").concat(i).concat(n.minimum.toString())
                    }
                    case "invalid_format": {
                        if ("starts_with" === n.format) return 'המחרוזת חייבת להתחיל ב "'.concat(n.prefix, '"');
                        if ("ends_with" === n.format) return 'המחרוזת חייבת להסתיים ב "'.concat(n.suffix, '"');
                        if ("includes" === n.format) return 'המחרוזת חייבת לכלול "'.concat(n.includes, '"');
                        if ("regex" === n.format) return "המחרוזת חייבת להתאים לתבנית ".concat(n.pattern);
                        let t = u[n.format],
                            r = null != (U = null == t ? void 0 : t.label) ? U : n.format,
                            i = null != (P = null == t ? void 0 : t.gender) ? P : "m";
                        return "".concat(r, " לא ").concat("f" === i ? "תקינה" : "תקין")
                    }
                    case "not_multiple_of":
                        return "מספר לא תקין: חייב להיות מכפלה של ".concat(n.divisor);
                    case "unrecognized_keys":
                        return "מפתח".concat(n.keys.length > 1 ? "ות" : "", " לא מזוה").concat(n.keys.length > 1 ? "ים" : "ה", ": ").concat(_(n.keys, ", "));
                    case "invalid_key":
                        return "שדה לא תקין באובייקט";
                    case "invalid_union":
                    default:
                        return "קלט לא תקין";
                    case "invalid_element": {
                        let t = a(null != (O = n.origin) ? O : "array");
                        return "ערך לא תקין ב".concat(t)
                    }
                }
            })
        }
    }, "hi", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "अक्षर",
                        verb: "रखने के लिए"
                    },
                    file: {
                        unit: "बाइट्स",
                        verb: "रखने के लिए"
                    },
                    array: {
                        unit: "तत्व",
                        verb: "रखने के लिए"
                    },
                    set: {
                        unit: "तत्व",
                        verb: "रखने के लिए"
                    },
                    map: {
                        unit: "प्रविष्टियाँ",
                        verb: "रखने के लिए"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "इनपुट",
                        email: "ईमेल पता",
                        url: "URL",
                        emoji: "इमोजी",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "ISO तिथि और समय",
                        date: "ISO तिथि",
                        time: "ISO समय",
                        duration: "ISO अवधि",
                        ipv4: "IPv4 पता",
                        ipv6: "IPv6 पता",
                        mac: "MAC पता",
                        cidrv4: "IPv4 श्रेणी",
                        cidrv6: "IPv6 श्रेणी",
                        base64: "Base64-एन्कोडेड स्ट्रिंग",
                        base64url: "Base64URL-एन्कोडेड स्ट्रिंग",
                        json_string: "JSON स्ट्रिंग",
                        e164: "E.164 संख्या",
                        credit_card: "क्रेडिट कार्ड संख्या",
                        currency_code: "मुद्रा कोड",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "इनपुट"
                    },
                    i = {
                        nan: "NaN"
                    };
                return t => {
                    var a, o, c, u, l;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            return "अमान्य इनपुट: अपेक्षित ".concat(n, ", प्राप्त ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "अमान्य इनपुट: अपेक्षित ".concat(en(t.values[0]));
                            return "अमान्य विकल्प: अपेक्षित मानों में से एक ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "बहुत बड़ा: अपेक्षित था कि ".concat(null != (c = t.origin) ? c : "मान", " में ").concat(r).concat(t.maximum, " ").concat(i.unit, " हों");
                            return "बहुत बड़ा: अपेक्षित था कि ".concat(null != (u = t.origin) ? u : "मान", " ").concat(r).concat(t.maximum, " हो")
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "बहुत छोटा: अपेक्षित था कि ".concat(t.origin, " में ").concat(r).concat(t.minimum, " ").concat(i.unit, " हों");
                            return "बहुत छोटा: अपेक्षित था कि ".concat(t.origin, " ").concat(r).concat(t.minimum, " हो")
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'अमान्य स्ट्रिंग: "'.concat(t.prefix, '" से शुरू होना चाहिए');
                            if ("ends_with" === t.format) return 'अमान्य स्ट्रिंग: "'.concat(t.suffix, '" पर समाप्त होना चाहिए');
                            if ("includes" === t.format) return 'अमान्य स्ट्रिंग: इसमें "'.concat(t.includes, '" शामिल होना चाहिए');
                            if ("regex" === t.format) return "अमान्य स्ट्रिंग: पैटर्न ".concat(t.pattern, " से मेल खाना चाहिए");
                            return "अमान्य ".concat(null != (l = r[t.format]) ? l : t.format);
                        case "not_multiple_of":
                            return "अमान्य संख्या: यह ".concat(t.divisor, " का गुणज होना चाहिए");
                        case "unrecognized_keys":
                            return "अपरिचित कुंजी".concat(t.keys.length > 1 ? "याँ" : "", ": ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "अमान्य कुंजी: ".concat(t.origin, " में");
                        case "invalid_union":
                            if (t.options && Array.isArray(t.options) && t.options.length > 0) {
                                let n = t.options.map(t => "'".concat(t, "'")).join(" | ");
                                return "अमान्य डिस्क्रिमिनेटर मान: अपेक्षित ".concat(n)
                            }
                            return "अमान्य इनपुट";
                        case "invalid_element":
                            return "अमान्य मान: ".concat(t.origin, " में");
                        default:
                            return "अमान्य इनपुट"
                    }
                }
            })()
        }
    }, "hr", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "znakova",
                        verb: "imati"
                    },
                    file: {
                        unit: "bajtova",
                        verb: "imati"
                    },
                    array: {
                        unit: "stavki",
                        verb: "imati"
                    },
                    set: {
                        unit: "stavki",
                        verb: "imati"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "unos",
                        email: "email adresa",
                        url: "URL",
                        emoji: "emoji",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "ISO datum i vrijeme",
                        date: "ISO datum",
                        time: "ISO vrijeme",
                        duration: "ISO trajanje",
                        ipv4: "IPv4 adresa",
                        ipv6: "IPv6 adresa",
                        mac: "MAC adresa",
                        cidrv4: "IPv4 raspon",
                        cidrv6: "IPv6 raspon",
                        base64: "base64 kodirani tekst",
                        base64url: "base64url kodirani tekst",
                        json_string: "JSON tekst",
                        e164: "E.164 broj",
                        credit_card: "broj kreditne kartice",
                        currency_code: "kod valute",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "unos"
                    },
                    i = {
                        nan: "NaN",
                        string: "tekst",
                        number: "broj",
                        boolean: "boolean",
                        array: "niz",
                        object: "objekt",
                        set: "skup",
                        file: "datoteka",
                        date: "datum",
                        bigint: "bigint",
                        symbol: "simbol",
                        undefined: "undefined",
                        null: "null",
                        function: "funkcija",
                        map: "mapa"
                    };
                return t => {
                    var a, o, c, u, l, s, d, m;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "Neispravan unos: očekuje se instanceof ".concat(t.expected, ", a primljeno je ").concat(c);
                            return "Neispravan unos: očekuje se ".concat(n, ", a primljeno je ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Neispravna vrijednost: očekivano ".concat(en(t.values[0]));
                            return "Neispravna opcija: očekivano jedno od ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                a = n(t.origin),
                                o = null != (c = i[t.origin]) ? c : t.origin;
                            if (a) return "Preveliko: očekivano da ".concat(null != o ? o : "vrijednost", " ima ").concat(r).concat(t.maximum.toString(), " ").concat(null != (u = a.unit) ? u : "elemenata");
                            return "Preveliko: očekivano da ".concat(null != o ? o : "vrijednost", " bude ").concat(r).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                a = n(t.origin),
                                o = null != (l = i[t.origin]) ? l : t.origin;
                            if (a) return "Premalo: očekivano da ".concat(o, " ima ").concat(r).concat(t.minimum.toString(), " ").concat(a.unit);
                            return "Premalo: očekivano da ".concat(o, " bude ").concat(r).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Neispravan tekst: mora započinjati s "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Neispravan tekst: mora završavati s "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Neispravan tekst: mora sadržavati "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Neispravan tekst: mora odgovarati uzorku ".concat(t.pattern);
                            return "Neispravna ".concat(null != (s = r[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Neispravan broj: mora biti višekratnik od ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Neprepoznat".concat(t.keys.length > 1 ? "i ključevi" : " ključ", ": ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "Neispravan ključ u ".concat(null != (d = i[t.origin]) ? d : t.origin);
                        case "invalid_union":
                        default:
                            return "Neispravan unos";
                        case "invalid_element":
                            return "Neispravna vrijednost u ".concat(null != (m = i[t.origin]) ? m : t.origin)
                    }
                }
            })()
        }
    }, "hu", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "karakter",
                        verb: "legyen"
                    },
                    file: {
                        unit: "byte",
                        verb: "legyen"
                    },
                    array: {
                        unit: "elem",
                        verb: "legyen"
                    },
                    set: {
                        unit: "elem",
                        verb: "legyen"
                    },
                    map: {
                        unit: "elem",
                        verb: "legyen"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "bemenet",
                        email: "email cím",
                        url: "URL",
                        emoji: "emoji",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "ISO időbélyeg",
                        date: "ISO dátum",
                        time: "ISO idő",
                        duration: "ISO időintervallum",
                        ipv4: "IPv4 cím",
                        ipv6: "IPv6 cím",
                        mac: "MAC cím",
                        cidrv4: "IPv4 tartomány",
                        cidrv6: "IPv6 tartomány",
                        base64: "base64-kódolt string",
                        base64url: "base64url-kódolt string",
                        json_string: "JSON string",
                        e164: "E.164 szám",
                        credit_card: "hitelkártyaszám",
                        currency_code: "pénznemkód",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "bemenet"
                    },
                    i = {
                        nan: "NaN",
                        number: "szám",
                        array: "tömb"
                    };
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "Érvénytelen bemenet: a várt érték instanceof ".concat(t.expected, ", a kapott érték ").concat(c);
                            return "Érvénytelen bemenet: a várt érték ".concat(n, ", a kapott érték ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Érvénytelen bemenet: a várt érték ".concat(en(t.values[0]));
                            return "Érvénytelen opció: valamelyik érték várt ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "Túl nagy: ".concat(null != (c = t.origin) ? c : "érték", " mérete túl nagy ").concat(r).concat(t.maximum.toString(), " ").concat(null != (u = i.unit) ? u : "elem");
                            return "Túl nagy: a bemeneti érték ".concat(null != (l = t.origin) ? l : "érték", " túl nagy: ").concat(r).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "Túl kicsi: a bemeneti érték ".concat(t.origin, " mérete túl kicsi ").concat(r).concat(t.minimum.toString(), " ").concat(i.unit);
                            return "Túl kicsi: a bemeneti érték ".concat(t.origin, " túl kicsi ").concat(r).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Érvénytelen string: "'.concat(t.prefix, '" értékkel kell kezdődnie');
                            if ("ends_with" === t.format) return 'Érvénytelen string: "'.concat(t.suffix, '" értékkel kell végződnie');
                            if ("includes" === t.format) return 'Érvénytelen string: "'.concat(t.includes, '" értéket kell tartalmaznia');
                            if ("regex" === t.format) return "Érvénytelen string: ".concat(t.pattern, " mintának kell megfelelnie");
                            return "Érvénytelen ".concat(null != (s = r[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Érvénytelen szám: ".concat(t.divisor, " többszörösének kell lennie");
                        case "unrecognized_keys":
                            return "Ismeretlen kulcs".concat(t.keys.length > 1 ? "s" : "", ": ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "Érvénytelen kulcs ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Érvénytelen bemenet";
                        case "invalid_element":
                            return "Érvénytelen érték: ".concat(t.origin)
                    }
                }
            })()
        }
    }, "hy", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: {
                            one: "նշան",
                            many: "նշաններ"
                        },
                        verb: "ունենալ"
                    },
                    file: {
                        unit: {
                            one: "բայթ",
                            many: "բայթեր"
                        },
                        verb: "ունենալ"
                    },
                    array: {
                        unit: {
                            one: "տարր",
                            many: "տարրեր"
                        },
                        verb: "ունենալ"
                    },
                    set: {
                        unit: {
                            one: "տարր",
                            many: "տարրեր"
                        },
                        verb: "ունենալ"
                    },
                    map: {
                        unit: {
                            one: "տարր",
                            many: "տարրեր"
                        },
                        verb: "ունենալ"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "մուտք",
                        email: "էլ. հասցե",
                        url: "URL",
                        emoji: "էմոջի",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "ISO ամսաթիվ և ժամ",
                        date: "ISO ամսաթիվ",
                        time: "ISO ժամ",
                        duration: "ISO տևողություն",
                        ipv4: "IPv4 հասցե",
                        ipv6: "IPv6 հասցե",
                        mac: "MAC հասցե",
                        cidrv4: "IPv4 միջակայք",
                        cidrv6: "IPv6 միջակայք",
                        base64: "base64 ձևաչափով տող",
                        base64url: "base64url ձևաչափով տող",
                        json_string: "JSON տող",
                        e164: "E.164 համար",
                        credit_card: "կրեդիտ քարտի համար",
                        currency_code: "արժույթի կոդ",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "մուտք"
                    },
                    i = {
                        nan: "NaN",
                        number: "թիվ",
                        array: "զանգված"
                    };
                return t => {
                    var a, o, c, u, l;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "Սխալ մուտքագրում․ սպասվում էր instanceof ".concat(t.expected, ", ստացվել է ").concat(c);
                            return "Սխալ մուտքագրում․ սպասվում էր ".concat(n, ", ստացվել է ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Սխալ մուտքագրում․ սպասվում էր ".concat(en(t.values[1]));
                            return "Սխալ տարբերակ․ սպասվում էր հետևյալներից մեկը՝ ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) {
                                let n = tF(Number(t.maximum), i.unit.one, i.unit.many);
                                return "Չափազանց մեծ արժեք․ սպասվում է, որ ".concat(tq(null != (u = t.origin) ? u : "արժեք"), " կունենա ").concat(r).concat(t.maximum.toString(), " ").concat(n)
                            }
                            return "Չափազանց մեծ արժեք․ սպասվում է, որ ".concat(tq(null != (c = t.origin) ? c : "արժեք"), " լինի ").concat(r).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) {
                                let n = tF(Number(t.minimum), i.unit.one, i.unit.many);
                                return "Չափազանց փոքր արժեք․ սպասվում է, որ ".concat(tq(t.origin), " կունենա ").concat(r).concat(t.minimum.toString(), " ").concat(n)
                            }
                            return "Չափազանց փոքր արժեք․ սպասվում է, որ ".concat(tq(t.origin), " լինի ").concat(r).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Սխալ տող․ պետք է սկսվի "'.concat(t.prefix, '"-ով');
                            if ("ends_with" === t.format) return 'Սխալ տող․ պետք է ավարտվի "'.concat(t.suffix, '"-ով');
                            if ("includes" === t.format) return 'Սխալ տող․ պետք է պարունակի "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Սխալ տող․ պետք է համապատասխանի ".concat(t.pattern, " ձևաչափին");
                            return "Սխալ ".concat(null != (l = r[t.format]) ? l : t.format);
                        case "not_multiple_of":
                            return "Սխալ թիվ․ պետք է բազմապատիկ լինի ".concat(t.divisor, "-ի");
                        case "unrecognized_keys":
                            return "Չճանաչված բանալի".concat(t.keys.length > 1 ? "ներ" : "", ". ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "Սխալ բանալի ".concat(tq(t.origin), "-ում");
                        case "invalid_union":
                        default:
                            return "Սխալ մուտքագրում";
                        case "invalid_element":
                            return "Սխալ արժեք ".concat(tq(t.origin), "-ում")
                    }
                }
            })()
        }
    }, "id", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "karakter",
                        verb: "memiliki"
                    },
                    file: {
                        unit: "byte",
                        verb: "memiliki"
                    },
                    array: {
                        unit: "item",
                        verb: "memiliki"
                    },
                    set: {
                        unit: "item",
                        verb: "memiliki"
                    },
                    map: {
                        unit: "item",
                        verb: "memiliki"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "input",
                        email: "alamat email",
                        url: "URL",
                        emoji: "emoji",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "tanggal dan waktu format ISO",
                        date: "tanggal format ISO",
                        time: "jam format ISO",
                        duration: "durasi format ISO",
                        ipv4: "alamat IPv4",
                        ipv6: "alamat IPv6",
                        mac: "alamat MAC",
                        cidrv4: "rentang alamat IPv4",
                        cidrv6: "rentang alamat IPv6",
                        base64: "string dengan enkode base64",
                        base64url: "string dengan enkode base64url",
                        json_string: "string JSON",
                        e164: "angka E.164",
                        credit_card: "nomor kartu kredit",
                        currency_code: "kode mata uang",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "input"
                    },
                    i = {
                        nan: "NaN"
                    };
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "Input tidak valid: diharapkan instanceof ".concat(t.expected, ", diterima ").concat(c);
                            return "Input tidak valid: diharapkan ".concat(n, ", diterima ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Input tidak valid: diharapkan ".concat(en(t.values[0]));
                            return "Pilihan tidak valid: diharapkan salah satu dari ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "Terlalu besar: diharapkan ".concat(null != (c = t.origin) ? c : "value", " memiliki ").concat(r).concat(t.maximum.toString(), " ").concat(null != (u = i.unit) ? u : "elemen");
                            return "Terlalu besar: diharapkan ".concat(null != (l = t.origin) ? l : "value", " menjadi ").concat(r).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "Terlalu kecil: diharapkan ".concat(t.origin, " memiliki ").concat(r).concat(t.minimum.toString(), " ").concat(i.unit);
                            return "Terlalu kecil: diharapkan ".concat(t.origin, " menjadi ").concat(r).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'String tidak valid: harus dimulai dengan "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'String tidak valid: harus berakhir dengan "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'String tidak valid: harus menyertakan "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "String tidak valid: harus sesuai pola ".concat(t.pattern);
                            return "".concat(null != (s = r[t.format]) ? s : t.format, " tidak valid");
                        case "not_multiple_of":
                            return "Angka tidak valid: harus kelipatan dari ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Kunci tidak dikenali ".concat(t.keys.length > 1 ? "s" : "", ": ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "Kunci tidak valid di ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Input tidak valid";
                        case "invalid_element":
                            return "Nilai tidak valid di ".concat(t.origin)
                    }
                }
            })()
        }
    }, "is", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "stafi",
                        verb: "að hafa"
                    },
                    file: {
                        unit: "bæti",
                        verb: "að hafa"
                    },
                    array: {
                        unit: "hluti",
                        verb: "að hafa"
                    },
                    set: {
                        unit: "hluti",
                        verb: "að hafa"
                    },
                    map: {
                        unit: "hluti",
                        verb: "að hafa"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "gildi",
                        email: "netfang",
                        url: "vefslóð",
                        emoji: "emoji",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "ISO dagsetning og tími",
                        date: "ISO dagsetning",
                        time: "ISO tími",
                        duration: "ISO tímalengd",
                        ipv4: "IPv4 address",
                        ipv6: "IPv6 address",
                        mac: "MAC address",
                        cidrv4: "IPv4 range",
                        cidrv6: "IPv6 range",
                        base64: "base64-encoded strengur",
                        base64url: "base64url-encoded strengur",
                        json_string: "JSON strengur",
                        e164: "E.164 tölugildi",
                        credit_card: "kreditkortanúmer",
                        currency_code: "gjaldmiðilskóði",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "gildi"
                    },
                    i = {
                        nan: "NaN",
                        number: "númer",
                        array: "fylki"
                    };
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "Rangt gildi: Þú slóst inn ".concat(c, " þar sem á að vera instanceof ").concat(t.expected);
                            return "Rangt gildi: Þú slóst inn ".concat(c, " þar sem á að vera ").concat(n)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Rangt gildi: gert ráð fyrir ".concat(en(t.values[0]));
                            return "Ógilt val: má vera eitt af eftirfarandi ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "Of stórt: gert er ráð fyrir að ".concat(null != (c = t.origin) ? c : "gildi", " hafi ").concat(r).concat(t.maximum.toString(), " ").concat(null != (u = i.unit) ? u : "hluti");
                            return "Of stórt: gert er ráð fyrir að ".concat(null != (l = t.origin) ? l : "gildi", " sé ").concat(r).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "Of lítið: gert er ráð fyrir að ".concat(t.origin, " hafi ").concat(r).concat(t.minimum.toString(), " ").concat(i.unit);
                            return "Of lítið: gert er ráð fyrir að ".concat(t.origin, " sé ").concat(r).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Ógildur strengur: verður að byrja á "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Ógildur strengur: verður að enda á "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Ógildur strengur: verður að innihalda "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Ógildur strengur: verður að fylgja mynstri ".concat(t.pattern);
                            return "Rangt ".concat(null != (s = r[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Röng tala: verður að vera margfeldi af ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Óþekkt ".concat(t.keys.length > 1 ? "ir lyklar" : "ur lykill", ": ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "Rangur lykill í ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Rangt gildi";
                        case "invalid_element":
                            return "Rangt gildi í ".concat(t.origin)
                    }
                }
            })()
        }
    }, "it", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "caratteri",
                        verb: "avere"
                    },
                    file: {
                        unit: "byte",
                        verb: "avere"
                    },
                    array: {
                        unit: "elementi",
                        verb: "avere"
                    },
                    set: {
                        unit: "elementi",
                        verb: "avere"
                    },
                    map: {
                        unit: "elementi",
                        verb: "avere"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "input",
                        email: "indirizzo email",
                        url: "URL",
                        emoji: "emoji",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "data e ora ISO",
                        date: "data ISO",
                        time: "ora ISO",
                        duration: "durata ISO",
                        ipv4: "indirizzo IPv4",
                        ipv6: "indirizzo IPv6",
                        mac: "indirizzo MAC",
                        cidrv4: "intervallo IPv4",
                        cidrv6: "intervallo IPv6",
                        base64: "stringa codificata in base64",
                        base64url: "URL codificata in base64",
                        json_string: "stringa JSON",
                        e164: "numero E.164",
                        credit_card: "numero di carta di credito",
                        currency_code: "codice valuta",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "input"
                    },
                    i = {
                        nan: "NaN",
                        number: "numero",
                        array: "vettore"
                    };
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "Input non valido: atteso instanceof ".concat(t.expected, ", ricevuto ").concat(c);
                            return "Input non valido: atteso ".concat(n, ", ricevuto ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Input non valido: atteso ".concat(en(t.values[0]));
                            return "Opzione non valida: atteso uno tra ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "Troppo grande: ".concat(null != (c = t.origin) ? c : "valore", " deve avere ").concat(r).concat(t.maximum.toString(), " ").concat(null != (u = i.unit) ? u : "elementi");
                            return "Troppo grande: ".concat(null != (l = t.origin) ? l : "valore", " deve essere ").concat(r).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "Troppo piccolo: ".concat(t.origin, " deve avere ").concat(r).concat(t.minimum.toString(), " ").concat(i.unit);
                            return "Troppo piccolo: ".concat(t.origin, " deve essere ").concat(r).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Stringa non valida: deve iniziare con "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Stringa non valida: deve terminare con "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Stringa non valida: deve includere "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Stringa non valida: deve corrispondere al pattern ".concat(t.pattern);
                            return "Input non valido: ".concat(null != (s = r[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Numero non valido: deve essere un multiplo di ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Chiav".concat(t.keys.length > 1 ? "i" : "e", " non riconosciut").concat(t.keys.length > 1 ? "e" : "a", ": ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "Chiave non valida in ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Input non valido";
                        case "invalid_element":
                            return "Valore non valido in ".concat(t.origin)
                    }
                }
            })()
        }
    }, "ja", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "文字",
                        verb: "である"
                    },
                    file: {
                        unit: "バイト",
                        verb: "である"
                    },
                    array: {
                        unit: "要素",
                        verb: "である"
                    },
                    set: {
                        unit: "要素",
                        verb: "である"
                    },
                    map: {
                        unit: "要素",
                        verb: "である"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "入力値",
                        email: "メールアドレス",
                        url: "URL",
                        emoji: "絵文字",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "ISO日時",
                        date: "ISO日付",
                        time: "ISO時刻",
                        duration: "ISO期間",
                        ipv4: "IPv4アドレス",
                        ipv6: "IPv6アドレス",
                        mac: "MACアドレス",
                        cidrv4: "IPv4範囲",
                        cidrv6: "IPv6範囲",
                        base64: "base64エンコード文字列",
                        base64url: "base64urlエンコード文字列",
                        json_string: "JSON文字列",
                        e164: "E.164番号",
                        credit_card: "クレジットカード番号",
                        currency_code: "通貨コード",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "入力値"
                    },
                    i = {
                        nan: "NaN",
                        number: "数値",
                        array: "配列"
                    };
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "無効な入力: instanceof ".concat(t.expected, "が期待されましたが、").concat(c, "が入力されました");
                            return "無効な入力: ".concat(n, "が期待されましたが、").concat(c, "が入力されました")
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "無効な入力: ".concat(en(t.values[0]), "が期待されました");
                            return "無効な選択: ".concat(_(t.values, "、"), "のいずれかである必要があります");
                        case "too_big": {
                            let r = t.inclusive ? "以下である" : "より小さい",
                                i = n(t.origin);
                            if (i) return "大きすぎる値: ".concat(null != (c = t.origin) ? c : "値", "は").concat(t.maximum.toString()).concat(null != (u = i.unit) ? u : "要素").concat(r, "必要があります");
                            return "大きすぎる値: ".concat(null != (l = t.origin) ? l : "値", "は").concat(t.maximum.toString()).concat(r, "必要があります")
                        }
                        case "too_small": {
                            let r = t.inclusive ? "以上である" : "より大きい",
                                i = n(t.origin);
                            if (i) return "小さすぎる値: ".concat(t.origin, "は").concat(t.minimum.toString()).concat(i.unit).concat(r, "必要があります");
                            return "小さすぎる値: ".concat(t.origin, "は").concat(t.minimum.toString()).concat(r, "必要があります")
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return '無効な文字列: "'.concat(t.prefix, '"で始まる必要があります');
                            if ("ends_with" === t.format) return '無効な文字列: "'.concat(t.suffix, '"で終わる必要があります');
                            if ("includes" === t.format) return '無効な文字列: "'.concat(t.includes, '"を含む必要があります');
                            if ("regex" === t.format) return "無効な文字列: パターン".concat(t.pattern, "に一致する必要があります");
                            return "無効な".concat(null != (s = r[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "無効な数値: ".concat(t.divisor, "の倍数である必要があります");
                        case "unrecognized_keys":
                            return "認識されていないキー".concat(t.keys.length > 1 ? "群" : "", ": ").concat(_(t.keys, "、"));
                        case "invalid_key":
                            return "".concat(t.origin, "内の無効なキー");
                        case "invalid_union":
                        default:
                            return "無効な入力";
                        case "invalid_element":
                            return "".concat(t.origin, "内の無効な値")
                    }
                }
            })()
        }
    }, "ka", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "სიმბოლო",
                        verb: "უნდა შეიცავდეს"
                    },
                    file: {
                        unit: "ბაიტი",
                        verb: "უნდა შეიცავდეს"
                    },
                    array: {
                        unit: "ელემენტი",
                        verb: "უნდა შეიცავდეს"
                    },
                    set: {
                        unit: "ელემენტი",
                        verb: "უნდა შეიცავდეს"
                    },
                    map: {
                        unit: "ელემენტი",
                        verb: "უნდა შეიცავდეს"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "შეყვანა",
                        email: "ელ-ფოსტის მისამართი",
                        url: "URL",
                        emoji: "ემოჯი",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "თარიღი-დრო",
                        date: "თარიღი",
                        time: "დრო",
                        duration: "ხანგრძლივობა",
                        ipv4: "IPv4 მისამართი",
                        ipv6: "IPv6 მისამართი",
                        mac: "MAC მისამართი",
                        cidrv4: "IPv4 დიაპაზონი",
                        cidrv6: "IPv6 დიაპაზონი",
                        base64: "base64-კოდირებული ველი",
                        base64url: "base64url-კოდირებული ველი",
                        json_string: "JSON ველი",
                        e164: "E.164 ნომერი",
                        credit_card: "საკრედიტო ბარათის ნომერი",
                        currency_code: "ვალუტის კოდი",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "შეყვანა"
                    },
                    i = {
                        nan: "NaN",
                        number: "რიცხვი",
                        string: "ველი",
                        boolean: "ბულეანი",
                        function: "ფუნქცია",
                        array: "მასივი"
                    };
                return t => {
                    var a, o, c, u, l;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "არასწორი შეყვანა: მოსალოდნელი instanceof ".concat(t.expected, ", მიღებული ").concat(c);
                            return "არასწორი შეყვანა: მოსალოდნელი ".concat(n, ", მიღებული ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "არასწორი შეყვანა: მოსალოდნელი ".concat(en(t.values[0]));
                            return "არასწორი ვარიანტი: მოსალოდნელია ერთ-ერთი ".concat(_(t.values, "|"), "-დან");
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "ზედმეტად დიდი: მოსალოდნელი ".concat(null != (c = t.origin) ? c : "მნიშვნელობა", " ").concat(i.verb, " ").concat(r).concat(t.maximum.toString(), " ").concat(i.unit);
                            return "ზედმეტად დიდი: მოსალოდნელი ".concat(null != (u = t.origin) ? u : "მნიშვნელობა", " იყოს ").concat(r).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "ზედმეტად პატარა: მოსალოდნელი ".concat(t.origin, " ").concat(i.verb, " ").concat(r).concat(t.minimum.toString(), " ").concat(i.unit);
                            return "ზედმეტად პატარა: მოსალოდნელი ".concat(t.origin, " იყოს ").concat(r).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'არასწორი ველი: უნდა იწყებოდეს "'.concat(t.prefix, '"-ით');
                            if ("ends_with" === t.format) return 'არასწორი ველი: უნდა მთავრდებოდეს "'.concat(t.suffix, '"-ით');
                            if ("includes" === t.format) return 'არასწორი ველი: უნდა შეიცავდეს "'.concat(t.includes, '"-ს');
                            if ("regex" === t.format) return "არასწორი ველი: უნდა შეესაბამებოდეს შაბლონს ".concat(t.pattern);
                            return "არასწორი ".concat(null != (l = r[t.format]) ? l : t.format);
                        case "not_multiple_of":
                            return "არასწორი რიცხვი: უნდა იყოს ".concat(t.divisor, "-ის ჯერადი");
                        case "unrecognized_keys":
                            return "უცნობი გასაღებ".concat(t.keys.length > 1 ? "ები" : "ი", ": ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "არასწორი გასაღები ".concat(t.origin, "-ში");
                        case "invalid_union":
                        default:
                            return "არასწორი შეყვანა";
                        case "invalid_element":
                            return "არასწორი მნიშვნელობა ".concat(t.origin, "-ში")
                    }
                }
            })()
        }
    }, "kh", 0, function() {
        return tW()
    }, "km", 0, tW, "kn", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "ಅಕ್ಷರಗಳು",
                        verb: "ಹೊಂದಲು"
                    },
                    file: {
                        unit: "ಬೈಟ್‌ಗಳು",
                        verb: "ಹೊಂದಲು"
                    },
                    array: {
                        unit: "ವಸ್ತುಗಳು",
                        verb: "ಹೊಂದಲು"
                    },
                    set: {
                        unit: "ವಸ್ತುಗಳು",
                        verb: "ಹೊಂದಲು"
                    },
                    map: {
                        unit: "entries",
                        verb: "ಹೊಂದಲು"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "ಇನ್ಪುಟ್",
                        email: "email ವಿಳಾಸ",
                        url: "URL",
                        emoji: "emoji",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "ISO ದಿನಾಂಕದ ಸಮಯ",
                        date: "ISO ದಿನಾಂಕ",
                        time: "ISO ಸಮಯ",
                        duration: "ISO ಅವಧಿ",
                        ipv4: "IPv4 ವಿಳಾಸ",
                        ipv6: "IPv6 ವಿಳಾಸ",
                        mac: "MAC ವಿಳಾಸ",
                        cidrv4: "IPv4 ವ್ಯಾಪ್ತಿಯ",
                        cidrv6: "IPv6 ವ್ಯಾಪ್ತಿಯ",
                        base64: "base64-encodedಸ್ಟ್ರಿಂಗ್",
                        base64url: "base64url-encodedಸ್ಟ್ರಿಂಗ್",
                        json_string: "JSONಸ್ಟ್ರಿಂಗ್",
                        e164: "E.164 ಸಂಖ್ಯೆ",
                        credit_card: "ಕ್ರೆಡಿಟ್ ಕಾರ್ಡ್ ಸಂಖ್ಯೆ",
                        currency_code: "ಕರೆನ್ಸಿ ಕೋಡ್",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "ಇನ್ಪುಟ್"
                    },
                    i = {
                        nan: "NaN"
                    };
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            return "ಅಮಾನ್ಯ ಇನ್‌ಪುಟ್: ನಿರೀಕ್ಷಿಸಲಾಗಿದೆ ".concat(n, ", ಸ್ವೀಕರಿಸಿದನು ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "ಅಮಾನ್ಯ ಇನ್‌ಪುಟ್: ನಿರೀಕ್ಷಿಸಲಾಗಿದೆ ".concat(en(t.values[0]));
                            return "ಅಮಾನ್ಯ ಆಯ್ಕೆ: ಇವುಗಳಲ್ಲಿ ಒಂದನ್ನು ನಿರೀಕ್ಷಿಸಲಾಗಿದೆ ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "ತುಂಬಾ ದೊಡ್ಡದು: ನಿರೀಕ್ಷಿಸಲಾಗಿದೆ ".concat(null != (c = t.origin) ? c : "value", " ಹೊಂದಲು ").concat(r).concat(t.maximum.toString(), " ").concat(null != (u = i.unit) ? u : "ಅಂಶಗಳು");
                            return "ತುಂಬಾ ದೊಡ್ಡದು: ನಿರೀಕ್ಷಿಸಲಾಗಿದೆ ".concat(null != (l = t.origin) ? l : "value", " ಎಂದು ").concat(r).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "ತುಂಬಾ ಚಿಕ್ಕದು: ನಿರೀಕ್ಷಿಸಲಾಗಿದೆ ".concat(t.origin, " ಹೊಂದಲು ").concat(r).concat(t.minimum.toString(), " ").concat(i.unit);
                            return "ತುಂಬಾ ಚಿಕ್ಕದು: ನಿರೀಕ್ಷಿಸಲಾಗಿದೆ ".concat(t.origin, " ಎಂದು ").concat(r).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'ಅಮಾನ್ಯವಾದ ಸ್ಟ್ರಿಂಗ್: ಇದರೊಂದಿಗೆ ಪ್ರಾರಂಭಿಸಬೇಕು "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'ಅಮಾನ್ಯವಾದ ಸ್ಟ್ರಿಂಗ್: ಇದರೊಂದಿಗೆ ಕೊನೆಗೊಳ್ಳಬೇಕು "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'ಅಮಾನ್ಯ ಸ್ಟ್ರಿಂಗ್: ಒಳಗೊಂಡಿರಬೇಕು "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "ಅಮಾನ್ಯವಾದ ಸ್ಟ್ರಿಂಗ್: ಮಾದರಿಗೆ ಹೊಂದಿಕೆಯಾಗಬೇಕು ".concat(t.pattern);
                            return "ಅಮಾನ್ಯ ".concat(null != (s = r[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "ಅಮಾನ್ಯ ಸಂಖ್ಯೆ: ಬಹುಸಂಖ್ಯೆಯಾಗಿರಬೇಕು ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "ಗುರುತಿಸಲಾಗದ ಕೀ ".concat(t.keys.length > 1 ? "s" : "", ": ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "ಅಮಾನ್ಯವಾದ ಕೀ ಇನ್ ".concat(t.origin);
                        case "invalid_union":
                            if (t.options && Array.isArray(t.options) && t.options.length > 0) {
                                let n = t.options.map(t => "'".concat(t, "'")).join(" | ");
                                return "ಅಮಾನ್ಯ ತಾರತಮ್ಯ ಮೌಲ್ಯ. ನಿರೀಕ್ಷಿಸಲಾಗಿದೆ ".concat(n)
                            }
                            return "ಅಮಾನ್ಯ ಇನ್‌ಪುಟ್";
                        case "invalid_element":
                            return "ರಲ್ಲಿ ಅಮಾನ್ಯ ಮೌಲ್ಯ ".concat(t.origin);
                        default:
                            return "ಅಮಾನ್ಯ ಇನ್‌ಪುಟ್"
                    }
                }
            })()
        }
    }, "ko", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "문자",
                        verb: "to have"
                    },
                    file: {
                        unit: "바이트",
                        verb: "to have"
                    },
                    array: {
                        unit: "개",
                        verb: "to have"
                    },
                    set: {
                        unit: "개",
                        verb: "to have"
                    },
                    map: {
                        unit: "개",
                        verb: "to have"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "입력",
                        email: "이메일 주소",
                        url: "URL",
                        emoji: "이모지",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "ISO 날짜시간",
                        date: "ISO 날짜",
                        time: "ISO 시간",
                        duration: "ISO 기간",
                        ipv4: "IPv4 주소",
                        ipv6: "IPv6 주소",
                        mac: "MAC 주소",
                        cidrv4: "IPv4 범위",
                        cidrv6: "IPv6 범위",
                        base64: "base64 인코딩 문자열",
                        base64url: "base64url 인코딩 문자열",
                        json_string: "JSON 문자열",
                        e164: "E.164 번호",
                        credit_card: "신용카드 번호",
                        currency_code: "통화 코드",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "입력"
                    },
                    i = {
                        nan: "NaN"
                    };
                return t => {
                    var a, o, c, u, l, s, d, m, f;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "잘못된 입력: 예상 타입은 instanceof ".concat(t.expected, ", 받은 타입은 ").concat(c, "입니다");
                            return "잘못된 입력: 예상 타입은 ".concat(n, ", 받은 타입은 ").concat(c, "입니다")
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "잘못된 입력: 값은 ".concat(en(t.values[0]), " 이어야 합니다");
                            return "잘못된 옵션: ".concat(_(t.values, "또는 "), " 중 하나여야 합니다");
                        case "too_big": {
                            let r = t.inclusive ? "이하" : "미만",
                                i = "미만" === r ? "이어야 합니다" : "여야 합니다",
                                a = n(t.origin),
                                o = null != (c = null == a ? void 0 : a.unit) ? c : "요소";
                            if (a) return "".concat(null != (u = t.origin) ? u : "값", "이 너무 큽니다: ").concat(t.maximum.toString()).concat(o, " ").concat(r).concat(i);
                            return "".concat(null != (l = t.origin) ? l : "값", "이 너무 큽니다: ").concat(t.maximum.toString(), " ").concat(r).concat(i)
                        }
                        case "too_small": {
                            let r = t.inclusive ? "이상" : "초과",
                                i = "이상" === r ? "이어야 합니다" : "여야 합니다",
                                a = n(t.origin),
                                o = null != (s = null == a ? void 0 : a.unit) ? s : "요소";
                            if (a) return "".concat(null != (m = t.origin) ? m : "값", "이 너무 작습니다: ").concat(t.minimum.toString()).concat(o, " ").concat(r).concat(i);
                            return "".concat(null != (d = t.origin) ? d : "값", "이 너무 작습니다: ").concat(t.minimum.toString(), " ").concat(r).concat(i)
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return '잘못된 문자열: "'.concat(t.prefix, '"(으)로 시작해야 합니다');
                            if ("ends_with" === t.format) return '잘못된 문자열: "'.concat(t.suffix, '"(으)로 끝나야 합니다');
                            if ("includes" === t.format) return '잘못된 문자열: "'.concat(t.includes, '"을(를) 포함해야 합니다');
                            if ("regex" === t.format) return "잘못된 문자열: 정규식 ".concat(t.pattern, " 패턴과 일치해야 합니다");
                            return "잘못된 ".concat(null != (f = r[t.format]) ? f : t.format);
                        case "not_multiple_of":
                            return "잘못된 숫자: ".concat(t.divisor, "의 배수여야 합니다");
                        case "unrecognized_keys":
                            return "인식할 수 없는 키: ".concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "잘못된 키: ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "잘못된 입력";
                        case "invalid_element":
                            return "잘못된 값: ".concat(t.origin)
                    }
                }
            })()
        }
    }, "lt", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: {
                            one: "simbolis",
                            few: "simboliai",
                            many: "simbolių"
                        },
                        verb: {
                            smaller: {
                                inclusive: "turi būti ne ilgesnė kaip",
                                notInclusive: "turi būti trumpesnė kaip"
                            },
                            bigger: {
                                inclusive: "turi būti ne trumpesnė kaip",
                                notInclusive: "turi būti ilgesnė kaip"
                            }
                        }
                    },
                    file: {
                        unit: {
                            one: "baitas",
                            few: "baitai",
                            many: "baitų"
                        },
                        verb: {
                            smaller: {
                                inclusive: "turi būti ne didesnis kaip",
                                notInclusive: "turi būti mažesnis kaip"
                            },
                            bigger: {
                                inclusive: "turi būti ne mažesnis kaip",
                                notInclusive: "turi būti didesnis kaip"
                            }
                        }
                    },
                    array: {
                        unit: {
                            one: "elementą",
                            few: "elementus",
                            many: "elementų"
                        },
                        verb: {
                            smaller: {
                                inclusive: "turi turėti ne daugiau kaip",
                                notInclusive: "turi turėti mažiau kaip"
                            },
                            bigger: {
                                inclusive: "turi turėti ne mažiau kaip",
                                notInclusive: "turi turėti daugiau kaip"
                            }
                        }
                    },
                    set: {
                        unit: {
                            one: "elementą",
                            few: "elementus",
                            many: "elementų"
                        },
                        verb: {
                            smaller: {
                                inclusive: "turi turėti ne daugiau kaip",
                                notInclusive: "turi turėti mažiau kaip"
                            },
                            bigger: {
                                inclusive: "turi turėti ne mažiau kaip",
                                notInclusive: "turi turėti daugiau kaip"
                            }
                        }
                    }
                };

                function n(n, r, i, a) {
                    var o;
                    let c = null != (o = t[n]) ? o : null;
                    return null === c ? c : {
                        unit: c.unit[r],
                        verb: c.verb[a][i ? "inclusive" : "notInclusive"]
                    }
                }
                let r = {
                        regex: "įvestis",
                        email: "el. pašto adresas",
                        url: "URL",
                        emoji: "jaustukas",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "ISO data ir laikas",
                        date: "ISO data",
                        time: "ISO laikas",
                        duration: "ISO trukmė",
                        ipv4: "IPv4 adresas",
                        ipv6: "IPv6 adresas",
                        mac: "MAC adresas",
                        cidrv4: "IPv4 tinklo prefiksas (CIDR)",
                        cidrv6: "IPv6 tinklo prefiksas (CIDR)",
                        base64: "base64 užkoduota eilutė",
                        base64url: "base64url užkoduota eilutė",
                        json_string: "JSON eilutė",
                        e164: "E.164 numeris",
                        credit_card: "kredito kortelės numeris",
                        currency_code: "valiutos kodas",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "įvestis"
                    },
                    i = {
                        nan: "NaN",
                        number: "skaičius",
                        bigint: "sveikasis skaičius",
                        string: "eilutė",
                        boolean: "loginė reikšmė",
                        undefined: "neapibrėžta reikšmė",
                        function: "funkcija",
                        symbol: "simbolis",
                        array: "masyvas",
                        object: "objektas",
                        null: "nulinė reikšmė"
                    };
                return t => {
                    var a, o, c, u, l, s, d, m, f, v, p, g, h, b, y;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "Gautas tipas ".concat(c, ", o tikėtasi - instanceof ").concat(t.expected);
                            return "Gautas tipas ".concat(c, ", o tikėtasi - ").concat(n)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Privalo būti ".concat(en(t.values[0]));
                            return "Privalo būti vienas iš ".concat(_(t.values, "|"), " pasirinkimų");
                        case "too_big": {
                            let r = null != (c = i[t.origin]) ? c : t.origin,
                                a = n(t.origin, tX(Number(t.maximum)), null != (u = t.inclusive) && u, "smaller");
                            if (null == a ? void 0 : a.verb) return "".concat(tK(null != (l = null != r ? r : t.origin) ? l : "reikšmė"), " ").concat(a.verb, " ").concat(t.maximum.toString(), " ").concat(null != (s = a.unit) ? s : "elementų");
                            let o = t.inclusive ? "ne didesnis kaip" : "mažesnis kaip";
                            return "".concat(tK(null != (d = null != r ? r : t.origin) ? d : "reikšmė"), " turi būti ").concat(o, " ").concat(t.maximum.toString(), " ").concat(null == a ? void 0 : a.unit)
                        }
                        case "too_small": {
                            let r = null != (m = i[t.origin]) ? m : t.origin,
                                a = n(t.origin, tX(Number(t.minimum)), null != (f = t.inclusive) && f, "bigger");
                            if (null == a ? void 0 : a.verb) return "".concat(tK(null != (v = null != r ? r : t.origin) ? v : "reikšmė"), " ").concat(a.verb, " ").concat(t.minimum.toString(), " ").concat(null != (p = a.unit) ? p : "elementų");
                            let o = t.inclusive ? "ne mažesnis kaip" : "didesnis kaip";
                            return "".concat(tK(null != (g = null != r ? r : t.origin) ? g : "reikšmė"), " turi būti ").concat(o, " ").concat(t.minimum.toString(), " ").concat(null == a ? void 0 : a.unit)
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Eilutė privalo prasidėti "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Eilutė privalo pasibaigti "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Eilutė privalo įtraukti "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Eilutė privalo atitikti ".concat(t.pattern);
                            return "Neteisingas ".concat(null != (h = r[t.format]) ? h : t.format);
                        case "not_multiple_of":
                            return "Skaičius privalo būti ".concat(t.divisor, " kartotinis.");
                        case "unrecognized_keys":
                            return "Neatpažint".concat(t.keys.length > 1 ? "i" : "as", " rakt").concat(t.keys.length > 1 ? "ai" : "as", ": ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "Rastas klaidingas raktas";
                        case "invalid_union":
                        default:
                            return "Klaidinga įvestis";
                        case "invalid_element": {
                            let n = null != (b = i[t.origin]) ? b : t.origin;
                            return "".concat(tK(null != (y = null != n ? n : t.origin) ? y : "reikšmė"), " turi klaidingą įvestį")
                        }
                    }
                }
            })()
        }
    }, "mk", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "знаци",
                        verb: "да имаат"
                    },
                    file: {
                        unit: "бајти",
                        verb: "да имаат"
                    },
                    array: {
                        unit: "ставки",
                        verb: "да имаат"
                    },
                    set: {
                        unit: "ставки",
                        verb: "да имаат"
                    },
                    map: {
                        unit: "ставки",
                        verb: "да имаат"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "внес",
                        email: "адреса на е-пошта",
                        url: "URL",
                        emoji: "емоџи",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "ISO датум и време",
                        date: "ISO датум",
                        time: "ISO време",
                        duration: "ISO времетраење",
                        ipv4: "IPv4 адреса",
                        ipv6: "IPv6 адреса",
                        mac: "MAC адреса",
                        cidrv4: "IPv4 опсег",
                        cidrv6: "IPv6 опсег",
                        base64: "base64-енкодирана низа",
                        base64url: "base64url-енкодирана низа",
                        json_string: "JSON низа",
                        e164: "E.164 број",
                        credit_card: "број на кредитна картичка",
                        currency_code: "код на валута",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "внес"
                    },
                    i = {
                        nan: "NaN",
                        number: "број",
                        array: "низа"
                    };
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "Грешен внес: се очекува instanceof ".concat(t.expected, ", примено ").concat(c);
                            return "Грешен внес: се очекува ".concat(n, ", примено ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Invalid input: expected ".concat(en(t.values[0]));
                            return "Грешана опција: се очекува една ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "Премногу голем: се очекува ".concat(null != (c = t.origin) ? c : "вредноста", " да има ").concat(r).concat(t.maximum.toString(), " ").concat(null != (u = i.unit) ? u : "елементи");
                            return "Премногу голем: се очекува ".concat(null != (l = t.origin) ? l : "вредноста", " да биде ").concat(r).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "Премногу мал: се очекува ".concat(t.origin, " да има ").concat(r).concat(t.minimum.toString(), " ").concat(i.unit);
                            return "Премногу мал: се очекува ".concat(t.origin, " да биде ").concat(r).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Неважечка низа: мора да започнува со "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Неважечка низа: мора да завршува со "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Неважечка низа: мора да вклучува "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Неважечка низа: мора да одгоара на патернот ".concat(t.pattern);
                            return "Invalid ".concat(null != (s = r[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Грешен број: мора да биде делив со ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "".concat(t.keys.length > 1 ? "Непрепознаени клучеви" : "Непрепознаен клуч", ": ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "Грешен клуч во ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Грешен внес";
                        case "invalid_element":
                            return "Грешна вредност во ".concat(t.origin)
                    }
                }
            })()
        }
    }, "ms", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "aksara",
                        verb: "mempunyai"
                    },
                    file: {
                        unit: "bait",
                        verb: "mempunyai"
                    },
                    array: {
                        unit: "elemen",
                        verb: "mempunyai"
                    },
                    set: {
                        unit: "elemen",
                        verb: "mempunyai"
                    },
                    map: {
                        unit: "elemen",
                        verb: "mempunyai"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "input",
                        email: "alamat e-mel",
                        url: "URL",
                        emoji: "emoji",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "tarikh masa ISO",
                        date: "tarikh ISO",
                        time: "masa ISO",
                        duration: "tempoh ISO",
                        ipv4: "alamat IPv4",
                        ipv6: "alamat IPv6",
                        mac: "alamat MAC",
                        cidrv4: "julat IPv4",
                        cidrv6: "julat IPv6",
                        base64: "string dikodkan base64",
                        base64url: "string dikodkan base64url",
                        json_string: "string JSON",
                        e164: "nombor E.164",
                        credit_card: "nombor kad kredit",
                        currency_code: "kod mata wang",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "input"
                    },
                    i = {
                        nan: "NaN",
                        number: "nombor"
                    };
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "Input tidak sah: dijangka instanceof ".concat(t.expected, ", diterima ").concat(c);
                            return "Input tidak sah: dijangka ".concat(n, ", diterima ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Input tidak sah: dijangka ".concat(en(t.values[0]));
                            return "Pilihan tidak sah: dijangka salah satu daripada ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "Terlalu besar: dijangka ".concat(null != (c = t.origin) ? c : "nilai", " ").concat(i.verb, " ").concat(r).concat(t.maximum.toString(), " ").concat(null != (u = i.unit) ? u : "elemen");
                            return "Terlalu besar: dijangka ".concat(null != (l = t.origin) ? l : "nilai", " adalah ").concat(r).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "Terlalu kecil: dijangka ".concat(t.origin, " ").concat(i.verb, " ").concat(r).concat(t.minimum.toString(), " ").concat(i.unit);
                            return "Terlalu kecil: dijangka ".concat(t.origin, " adalah ").concat(r).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'String tidak sah: mesti bermula dengan "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'String tidak sah: mesti berakhir dengan "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'String tidak sah: mesti mengandungi "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "String tidak sah: mesti sepadan dengan corak ".concat(t.pattern);
                            return "".concat(null != (s = r[t.format]) ? s : t.format, " tidak sah");
                        case "not_multiple_of":
                            return "Nombor tidak sah: perlu gandaan ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Kunci tidak dikenali: ".concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "Kunci tidak sah dalam ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Input tidak sah";
                        case "invalid_element":
                            return "Nilai tidak sah dalam ".concat(t.origin)
                    }
                }
            })()
        }
    }, "ne", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "अक्षर",
                        verb: "हुनुपर्छ"
                    },
                    file: {
                        unit: "बाइट",
                        verb: "हुनुपर्छ"
                    },
                    array: {
                        unit: "तत्व",
                        verb: "हुनुपर्छ"
                    },
                    set: {
                        unit: "तत्व",
                        verb: "हुनुपर्छ"
                    },
                    map: {
                        unit: "प्रविष्टि",
                        verb: "हुनुपर्छ"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "इनपुट",
                        email: "इमेल ठेगाना",
                        url: "URL",
                        emoji: "इमोजी",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "ISO मिति र समय",
                        date: "ISO मिति",
                        time: "ISO समय",
                        duration: "ISO अवधि",
                        ipv4: "IPv4 ठेगाना",
                        ipv6: "IPv6 ठेगाना",
                        mac: "MAC ठेगाना",
                        cidrv4: "IPv4 दायरा",
                        cidrv6: "IPv6 दायरा",
                        base64: "base64-इन्कोड गरिएको स्ट्रिङ",
                        base64url: "base64url-इन्कोड गरिएको स्ट्रिङ",
                        json_string: "JSON स्ट्रिङ",
                        e164: "E.164 नम्बर",
                        credit_card: "क्रेडिट कार्ड नम्बर",
                        currency_code: "मुद्रा कोड",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "इनपुट"
                    },
                    i = {
                        nan: "NaN"
                    };
                return t => {
                    var a, o, c, u, l;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            return "अमान्य इनपुट: अपेक्षित ".concat(n, ", प्राप्त ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "अमान्य इनपुट: अपेक्षित ".concat(en(t.values[0]));
                            return "अमान्य विकल्प: अपेक्षित मानहरू मध्ये एक ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "धेरै ठूलो: ".concat(null != (c = t.origin) ? c : "मान", " मा ").concat(r).concat(t.maximum.toString(), " ").concat(i.unit, " ").concat(i.verb);
                            return "धेरै ठूलो: ".concat(null != (u = t.origin) ? u : "मान", " ").concat(r).concat(t.maximum.toString(), " हुनुपर्छ")
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "धेरै सानो: ".concat(t.origin, " मा ").concat(r).concat(t.minimum.toString(), " ").concat(i.unit, " ").concat(i.verb);
                            return "धेरै सानो: ".concat(t.origin, " ").concat(r).concat(t.minimum.toString(), " हुनुपर्छ")
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'अमान्य स्ट्रिङ: "'.concat(t.prefix, '" बाट सुरु हुनुपर्छ');
                            if ("ends_with" === t.format) return 'अमान्य स्ट्रिङ: "'.concat(t.suffix, '" मा समाप्त हुनुपर्छ');
                            if ("includes" === t.format) return 'अमान्य स्ट्रिङ: "'.concat(t.includes, '" समावेश हुनुपर्छ');
                            if ("regex" === t.format) return "अमान्य स्ट्रिङ: ढाँचा ".concat(t.pattern, " सँग मेल खानुपर्छ");
                            return "अमान्य ".concat(null != (l = r[t.format]) ? l : t.format);
                        case "not_multiple_of":
                            return "अमान्य संख्या: ".concat(t.divisor, " को गुणज हुनुपर्छ");
                        case "unrecognized_keys":
                            return "अपरिचित कुञ्जी".concat(t.keys.length > 1 ? "हरू" : "", ": ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "अमान्य कुञ्जी: ".concat(t.origin, " मा");
                        case "invalid_union":
                            if (t.options && Array.isArray(t.options) && t.options.length > 0) {
                                let n = t.options.map(t => "'".concat(t, "'")).join(" | ");
                                return "अमान्य डिस्क्रिमिनेटर मान: अपेक्षित ".concat(n)
                            }
                            return "अमान्य इनपुट";
                        case "invalid_element":
                            return "अमान्य मान: ".concat(t.origin, " मा");
                        default:
                            return "अमान्य इनपुट"
                    }
                }
            })()
        }
    }, "nl", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "tekens",
                        verb: "heeft"
                    },
                    file: {
                        unit: "bytes",
                        verb: "heeft"
                    },
                    array: {
                        unit: "elementen",
                        verb: "heeft"
                    },
                    set: {
                        unit: "elementen",
                        verb: "heeft"
                    },
                    map: {
                        unit: "elementen",
                        verb: "heeft"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "invoer",
                        email: "emailadres",
                        url: "URL",
                        emoji: "emoji",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "ISO datum en tijd",
                        date: "ISO datum",
                        time: "ISO tijd",
                        duration: "ISO duur",
                        ipv4: "IPv4-adres",
                        ipv6: "IPv6-adres",
                        mac: "MAC-adres",
                        cidrv4: "IPv4-bereik",
                        cidrv6: "IPv6-bereik",
                        base64: "base64-gecodeerde tekst",
                        base64url: "base64 URL-gecodeerde tekst",
                        json_string: "JSON string",
                        e164: "E.164-nummer",
                        credit_card: "creditcardnummer",
                        currency_code: "valutacode",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "invoer"
                    },
                    i = {
                        nan: "NaN",
                        number: "getal"
                    };
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "Ongeldige invoer: verwacht instanceof ".concat(t.expected, ", ontving ").concat(c);
                            return "Ongeldige invoer: verwacht ".concat(n, ", ontving ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Ongeldige invoer: verwacht ".concat(en(t.values[0]));
                            return "Ongeldige optie: verwacht één van ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin),
                                a = "date" === t.origin ? "laat" : "string" === t.origin ? "lang" : "groot";
                            if (i) return "Te ".concat(a, ": verwacht dat ").concat(null != (c = t.origin) ? c : "waarde", " ").concat(r).concat(t.maximum.toString(), " ").concat(null != (u = i.unit) ? u : "elementen", " ").concat(i.verb);
                            return "Te ".concat(a, ": verwacht dat ").concat(null != (l = t.origin) ? l : "waarde", " ").concat(r).concat(t.maximum.toString(), " is")
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin),
                                a = "date" === t.origin ? "vroeg" : "string" === t.origin ? "kort" : "klein";
                            if (i) return "Te ".concat(a, ": verwacht dat ").concat(t.origin, " ").concat(r).concat(t.minimum.toString(), " ").concat(i.unit, " ").concat(i.verb);
                            return "Te ".concat(a, ": verwacht dat ").concat(t.origin, " ").concat(r).concat(t.minimum.toString(), " is")
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Ongeldige tekst: moet met "'.concat(t.prefix, '" beginnen');
                            if ("ends_with" === t.format) return 'Ongeldige tekst: moet op "'.concat(t.suffix, '" eindigen');
                            if ("includes" === t.format) return 'Ongeldige tekst: moet "'.concat(t.includes, '" bevatten');
                            if ("regex" === t.format) return "Ongeldige tekst: moet overeenkomen met patroon ".concat(t.pattern);
                            return "Ongeldig: ".concat(null != (s = r[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Ongeldig getal: moet een veelvoud van ".concat(t.divisor, " zijn");
                        case "unrecognized_keys":
                            return "Onbekende key".concat(t.keys.length > 1 ? "s" : "", ": ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "Ongeldige key in ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Ongeldige invoer";
                        case "invalid_element":
                            return "Ongeldige waarde in ".concat(t.origin)
                    }
                }
            })()
        }
    }, "nn", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "teikn",
                        verb: "å ha"
                    },
                    file: {
                        unit: "bytes",
                        verb: "å ha"
                    },
                    array: {
                        unit: "element",
                        verb: "å innehalde"
                    },
                    set: {
                        unit: "element",
                        verb: "å innehalde"
                    },
                    map: {
                        unit: "element",
                        verb: "å innehalde"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "input",
                        email: "e-postadresse",
                        url: "URL",
                        emoji: "emoji",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "ISO dato- og klokkeslett",
                        date: "ISO-dato",
                        time: "ISO-klokkeslett",
                        duration: "ISO-varigheit",
                        ipv4: "IPv4-adresse",
                        ipv6: "IPv6-adresse",
                        mac: "MAC-adresse",
                        cidrv4: "IPv4-spekter",
                        cidrv6: "IPv6-spekter",
                        base64: "base64-enkoda streng",
                        base64url: "base64url-enkoda streng",
                        json_string: "JSON-streng",
                        e164: "E.164-nummer",
                        credit_card: "kredittkortnummer",
                        currency_code: "valutakode",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "input"
                    },
                    i = {
                        nan: "NaN",
                        number: "tal",
                        array: "liste"
                    };
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "Ugyldig input: forventa instanceof ".concat(t.expected, ", fekk ").concat(c);
                            return "Ugyldig input: forventa ".concat(n, ", fekk ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Ugyldig verdi: forventa ".concat(en(t.values[0]));
                            return "Ugyldig val: forventa eitt av ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "For stor(t): forventa ".concat(null != (c = t.origin) ? c : "value", " til å ha ").concat(r).concat(t.maximum.toString(), " ").concat(null != (u = i.unit) ? u : "element");
                            return "For stor(t): forventa ".concat(null != (l = t.origin) ? l : "value", " til å ha ").concat(r).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "For lite(n): forventa ".concat(t.origin, " til å ha ").concat(r).concat(t.minimum.toString(), " ").concat(i.unit);
                            return "For lite(n): forventa ".concat(t.origin, " til å ha ").concat(r).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Ugyldig streng: må starte med "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Ugyldig streng: må slutte med "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Ugyldig streng: må innehalde "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Ugyldig streng: må matche mønsteret ".concat(t.pattern);
                            return "Ugyldig ".concat(null != (s = r[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Ugyldig tal: må vere eit multiplum av ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "".concat(t.keys.length > 1 ? "Ukjende nøklar" : "Ukjend nøkkel", ": ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "Ugyldig nøkkel i ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Ugyldig input";
                        case "invalid_element":
                            return "Ugyldig verdi i ".concat(t.origin)
                    }
                }
            })()
        }
    }, "no", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "tegn",
                        verb: "å ha"
                    },
                    file: {
                        unit: "bytes",
                        verb: "å ha"
                    },
                    array: {
                        unit: "elementer",
                        verb: "å inneholde"
                    },
                    set: {
                        unit: "elementer",
                        verb: "å inneholde"
                    },
                    map: {
                        unit: "elementer",
                        verb: "å inneholde"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "input",
                        email: "e-postadresse",
                        url: "URL",
                        emoji: "emoji",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "ISO dato- og klokkeslett",
                        date: "ISO-dato",
                        time: "ISO-klokkeslett",
                        duration: "ISO-varighet",
                        ipv4: "IPv4-adresse",
                        ipv6: "IPv6-adresse",
                        mac: "MAC-adresse",
                        cidrv4: "IPv4-spekter",
                        cidrv6: "IPv6-spekter",
                        base64: "base64-enkodet streng",
                        base64url: "base64url-enkodet streng",
                        json_string: "JSON-streng",
                        e164: "E.164-nummer",
                        credit_card: "kredittkortnummer",
                        currency_code: "valutakode",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "input"
                    },
                    i = {
                        nan: "NaN",
                        number: "tall",
                        array: "liste"
                    };
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "Ugyldig input: forventet instanceof ".concat(t.expected, ", fikk ").concat(c);
                            return "Ugyldig input: forventet ".concat(n, ", fikk ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Ugyldig verdi: forventet ".concat(en(t.values[0]));
                            return "Ugyldig valg: forventet en av ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "For stor(t): forventet ".concat(null != (c = t.origin) ? c : "value", " til å ha ").concat(r).concat(t.maximum.toString(), " ").concat(null != (u = i.unit) ? u : "elementer");
                            return "For stor(t): forventet ".concat(null != (l = t.origin) ? l : "value", " til å ha ").concat(r).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "For lite(n): forventet ".concat(t.origin, " til å ha ").concat(r).concat(t.minimum.toString(), " ").concat(i.unit);
                            return "For lite(n): forventet ".concat(t.origin, " til å ha ").concat(r).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Ugyldig streng: må starte med "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Ugyldig streng: må ende med "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Ugyldig streng: må inneholde "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Ugyldig streng: må matche mønsteret ".concat(t.pattern);
                            return "Ugyldig ".concat(null != (s = r[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Ugyldig tall: må være et multiplum av ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "".concat(t.keys.length > 1 ? "Ukjente nøkler" : "Ukjent nøkkel", ": ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "Ugyldig nøkkel i ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Ugyldig input";
                        case "invalid_element":
                            return "Ugyldig verdi i ".concat(t.origin)
                    }
                }
            })()
        }
    }, "ota", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "harf",
                        verb: "olmalıdır"
                    },
                    file: {
                        unit: "bayt",
                        verb: "olmalıdır"
                    },
                    array: {
                        unit: "unsur",
                        verb: "olmalıdır"
                    },
                    set: {
                        unit: "unsur",
                        verb: "olmalıdır"
                    },
                    map: {
                        unit: "unsur",
                        verb: "olmalıdır"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "giren",
                        email: "epostagâh",
                        url: "URL",
                        emoji: "emoji",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "ISO hengâmı",
                        date: "ISO tarihi",
                        time: "ISO zamanı",
                        duration: "ISO müddeti",
                        ipv4: "IPv4 nişânı",
                        ipv6: "IPv6 nişânı",
                        mac: "MAC nişânı",
                        cidrv4: "IPv4 menzili",
                        cidrv6: "IPv6 menzili",
                        base64: "base64-şifreli metin",
                        base64url: "base64url-şifreli metin",
                        json_string: "JSON metin",
                        e164: "E.164 sayısı",
                        credit_card: "i'tibâr kartı numarası",
                        currency_code: "para birimi kodu",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "giren"
                    },
                    i = {
                        nan: "NaN",
                        number: "numara",
                        array: "saf",
                        null: "gayb"
                    };
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "Fâsit giren: umulan instanceof ".concat(t.expected, ", alınan ").concat(c);
                            return "Fâsit giren: umulan ".concat(n, ", alınan ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Fâsit giren: umulan ".concat(en(t.values[0]));
                            return "Fâsit tercih: mûteberler ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "Fazla büyük: ".concat(null != (c = t.origin) ? c : "value", ", ").concat(r).concat(t.maximum.toString(), " ").concat(null != (u = i.unit) ? u : "elements", " sahip olmalıydı.");
                            return "Fazla büyük: ".concat(null != (l = t.origin) ? l : "value", ", ").concat(r).concat(t.maximum.toString(), " olmalıydı.")
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "Fazla küçük: ".concat(t.origin, ", ").concat(r).concat(t.minimum.toString(), " ").concat(i.unit, " sahip olmalıydı.");
                            return "Fazla küçük: ".concat(t.origin, ", ").concat(r).concat(t.minimum.toString(), " olmalıydı.")
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Fâsit metin: "'.concat(t.prefix, '" ile başlamalı.');
                            if ("ends_with" === t.format) return 'Fâsit metin: "'.concat(t.suffix, '" ile bitmeli.');
                            if ("includes" === t.format) return 'Fâsit metin: "'.concat(t.includes, '" ihtivâ etmeli.');
                            if ("regex" === t.format) return "Fâsit metin: ".concat(t.pattern, " nakşına uymalı.");
                            return "Fâsit ".concat(null != (s = r[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Fâsit sayı: ".concat(t.divisor, " katı olmalıydı.");
                        case "unrecognized_keys":
                            return "Tanınmayan anahtar ".concat(t.keys.length > 1 ? "s" : "", ": ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "".concat(t.origin, " için tanınmayan anahtar var.");
                        case "invalid_union":
                            return "Giren tanınamadı.";
                        case "invalid_element":
                            return "".concat(t.origin, " için tanınmayan kıymet var.");
                        default:
                            return "Kıymet tanınamadı."
                    }
                }
            })()
        }
    }, "pl", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "znaków",
                        verb: "mieć"
                    },
                    file: {
                        unit: "bajtów",
                        verb: "mieć"
                    },
                    array: {
                        unit: "elementów",
                        verb: "mieć"
                    },
                    set: {
                        unit: "elementów",
                        verb: "mieć"
                    },
                    map: {
                        unit: "elementów",
                        verb: "mieć"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "wyrażenie",
                        email: "adres email",
                        url: "URL",
                        emoji: "emoji",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "data i godzina w formacie ISO",
                        date: "data w formacie ISO",
                        time: "godzina w formacie ISO",
                        duration: "czas trwania ISO",
                        ipv4: "adres IPv4",
                        ipv6: "adres IPv6",
                        mac: "adres MAC",
                        cidrv4: "zakres IPv4",
                        cidrv6: "zakres IPv6",
                        base64: "ciąg znaków zakodowany w formacie base64",
                        base64url: "ciąg znaków zakodowany w formacie base64url",
                        json_string: "ciąg znaków w formacie JSON",
                        e164: "liczba E.164",
                        credit_card: "numer karty kredytowej",
                        currency_code: "kod waluty",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "wejście"
                    },
                    i = {
                        nan: "NaN",
                        number: "liczba",
                        array: "tablica"
                    };
                return t => {
                    var a, o, c, u, l, s, d, m, f;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "Nieprawidłowe dane wejściowe: oczekiwano instanceof ".concat(t.expected, ", otrzymano ").concat(c);
                            return "Nieprawidłowe dane wejściowe: oczekiwano ".concat(n, ", otrzymano ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Nieprawidłowe dane wejściowe: oczekiwano ".concat(en(t.values[0]));
                            return "Nieprawidłowa opcja: oczekiwano jednej z wartości ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "Za duża wartość: oczekiwano, że ".concat(null != (u = t.origin) ? u : "wartość", " będzie mieć ").concat(r).concat(t.maximum.toString(), " ").concat(null != (l = i.unit) ? l : "elementów");
                            return "Zbyt duż(y/a/e): oczekiwano, że ".concat(null != (c = t.origin) ? c : "wartość", " będzie wynosić ").concat(r).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "Za mała wartość: oczekiwano, że ".concat(null != (d = t.origin) ? d : "wartość", " będzie mieć ").concat(r).concat(t.minimum.toString(), " ").concat(null != (m = i.unit) ? m : "elementów");
                            return "Zbyt mał(y/a/e): oczekiwano, że ".concat(null != (s = t.origin) ? s : "wartość", " będzie wynosić ").concat(r).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Nieprawidłowy ciąg znaków: musi zaczynać się od "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Nieprawidłowy ciąg znaków: musi kończyć się na "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Nieprawidłowy ciąg znaków: musi zawierać "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Nieprawidłowy ciąg znaków: musi odpowiadać wzorcowi ".concat(t.pattern);
                            return "Nieprawidłow(y/a/e) ".concat(null != (f = r[t.format]) ? f : t.format);
                        case "not_multiple_of":
                            return "Nieprawidłowa liczba: musi być wielokrotnością ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Nierozpoznane klucze".concat(t.keys.length > 1 ? "s" : "", ": ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "Nieprawidłowy klucz w ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Nieprawidłowe dane wejściowe";
                        case "invalid_element":
                            return "Nieprawidłowa wartość w ".concat(t.origin)
                    }
                }
            })()
        }
    }, "ps", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "توکي",
                        verb: "ولري"
                    },
                    file: {
                        unit: "بایټس",
                        verb: "ولري"
                    },
                    array: {
                        unit: "توکي",
                        verb: "ولري"
                    },
                    set: {
                        unit: "توکي",
                        verb: "ولري"
                    },
                    map: {
                        unit: "توکي",
                        verb: "ولري"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "ورودي",
                        email: "بریښنالیک",
                        url: "یو آر ال",
                        emoji: "ایموجي",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "نیټه او وخت",
                        date: "نېټه",
                        time: "وخت",
                        duration: "موده",
                        ipv4: "د IPv4 پته",
                        ipv6: "د IPv6 پته",
                        mac: "د MAC پته",
                        cidrv4: "د IPv4 ساحه",
                        cidrv6: "د IPv6 ساحه",
                        base64: "base64-encoded متن",
                        base64url: "base64url-encoded متن",
                        json_string: "JSON متن",
                        e164: "د E.164 شمېره",
                        credit_card: "د کریډیټ کارت شمیره",
                        currency_code: "د اسعارو کوډ",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "ورودي"
                    },
                    i = {
                        nan: "NaN",
                        number: "عدد",
                        array: "ارې"
                    };
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "ناسم ورودي: باید instanceof ".concat(t.expected, " وای, مګر ").concat(c, " ترلاسه شو");
                            return "ناسم ورودي: باید ".concat(n, " وای, مګر ").concat(c, " ترلاسه شو")
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "ناسم ورودي: باید ".concat(en(t.values[0]), " وای");
                            return "ناسم انتخاب: باید یو له ".concat(_(t.values, "|"), " څخه وای");
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "ډیر لوی: ".concat(null != (u = t.origin) ? u : "ارزښت", " باید ").concat(r).concat(t.maximum.toString(), " ").concat(null != (l = i.unit) ? l : "عنصرونه", " ولري");
                            return "ډیر لوی: ".concat(null != (c = t.origin) ? c : "ارزښت", " باید ").concat(r).concat(t.maximum.toString(), " وي")
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "ډیر کوچنی: ".concat(t.origin, " باید ").concat(r).concat(t.minimum.toString(), " ").concat(i.unit, " ولري");
                            return "ډیر کوچنی: ".concat(t.origin, " باید ").concat(r).concat(t.minimum.toString(), " وي")
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'ناسم متن: باید د "'.concat(t.prefix, '" سره پیل شي');
                            if ("ends_with" === t.format) return 'ناسم متن: باید د "'.concat(t.suffix, '" سره پای ته ورسيږي');
                            if ("includes" === t.format) return 'ناسم متن: باید "'.concat(t.includes, '" ولري');
                            if ("regex" === t.format) return "ناسم متن: باید د ".concat(t.pattern, " سره مطابقت ولري");
                            return "".concat(null != (s = r[t.format]) ? s : t.format, " ناسم دی");
                        case "not_multiple_of":
                            return "ناسم عدد: باید د ".concat(t.divisor, " مضرب وي");
                        case "unrecognized_keys":
                            return "ناسم ".concat(t.keys.length > 1 ? "کلیډونه" : "کلیډ", ": ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "ناسم کلیډ په ".concat(t.origin, " کې");
                        case "invalid_union":
                        default:
                            return "ناسمه ورودي";
                        case "invalid_element":
                            return "ناسم عنصر په ".concat(t.origin, " کې")
                    }
                }
            })()
        }
    }, "pt", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "caracteres"
                    },
                    file: {
                        unit: "bytes"
                    },
                    array: {
                        unit: "elementos"
                    },
                    set: {
                        unit: "elementos"
                    },
                    map: {
                        unit: "entradas"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "a entrada",
                        email: "o endereço de e-mail",
                        url: "o URL",
                        emoji: "o emoji",
                        uuid: "o UUID",
                        uuidv4: "o UUIDv4",
                        uuidv6: "o UUIDv6",
                        nanoid: "o nanoid",
                        guid: "o GUID",
                        cuid: "o cuid",
                        cuid2: "o cuid2",
                        ulid: "o ULID",
                        xid: "o XID",
                        ksuid: "o KSUID",
                        datetime: "a data e hora ISO",
                        date: "a data ISO",
                        time: "a hora ISO",
                        duration: "a duração ISO",
                        ipv4: "o endereço IPv4",
                        ipv6: "o endereço IPv6",
                        mac: "o endereço MAC",
                        cidrv4: "o intervalo de endereços IPv4",
                        cidrv6: "o intervalo de endereços IPv6",
                        base64: "o texto codificado em base64",
                        base64url: "o texto codificado em base64url",
                        json_string: "o texto JSON",
                        e164: "o número E.164",
                        credit_card: "o número de cartão de crédito",
                        currency_code: "o código de moeda",
                        iban: "o IBAN",
                        jwt: "o JWT",
                        template_literal: "a entrada"
                    },
                    i = {
                        definite: "o",
                        indefinite: "um"
                    },
                    a = {
                        definite: "a",
                        indefinite: "uma"
                    },
                    o = {
                        string: {
                            name: "texto",
                            articles: i
                        },
                        number: {
                            name: "número",
                            articles: i
                        },
                        int: {
                            name: "número inteiro",
                            articles: i
                        },
                        boolean: {
                            name: "valor booleano",
                            articles: i
                        },
                        bigint: {
                            name: "número bigint",
                            articles: i
                        },
                        symbol: {
                            name: "símbolo",
                            articles: i
                        },
                        undefined: {
                            name: 'valor "undefined"',
                            articles: i
                        },
                        null: {
                            name: 'valor "nulo"',
                            articles: i
                        },
                        never: {
                            name: 'valor "never"',
                            articles: i
                        },
                        void: {
                            name: 'valor "void"',
                            articles: i
                        },
                        date: {
                            name: "data",
                            articles: a
                        },
                        array: {
                            name: "vetor",
                            articles: i
                        },
                        object: {
                            name: "objeto",
                            articles: i
                        },
                        tuple: {
                            name: "tuplo",
                            articles: i
                        },
                        record: {
                            name: "registo",
                            articles: i
                        },
                        map: {
                            name: "mapa",
                            articles: i
                        },
                        set: {
                            name: "conjunto",
                            articles: i
                        },
                        file: {
                            name: "ficheiro",
                            articles: i
                        },
                        nonoptional: {
                            name: "valor não opcional",
                            articles: i
                        },
                        nan: {
                            name: 'valor "NaN"',
                            articles: i
                        },
                        function: {
                            name: "função",
                            articles: a
                        }
                    };

                function c(t, n) {
                    var r;
                    let a = null != (r = o[t]) ? r : {
                        name: 'valor "'.concat(t, '"'),
                        articles: i
                    };
                    return "".concat(a.articles[n], " ").concat(a.name)
                }
                return t => {
                    var i, a, o;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = c(t.expected, "indefinite"),
                                r = c(eS(t.input), "indefinite");
                            return "Entrada inválida: esperava ".concat(n, ", recebeu ").concat(r)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Entrada inválida: esperava ".concat(en(t.values[0]));
                            return "Opção inválida: esperava uma das seguintes opções: ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                a = n(t.origin);
                            if (a) return "Demasiado grande: esperava que ".concat(c(t.origin, "definite"), " tivesse ").concat(r, " ").concat(t.maximum.toString(), " ").concat(null != (i = a.unit) ? i : "elementos");
                            return "Demasiado grande: esperava que ".concat(c(t.origin, "definite"), " fosse ").concat(r, " ").concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "Demasiado pequeno: esperava que ".concat(c(t.origin, "definite"), " tivesse ").concat(r, " ").concat(t.minimum.toString(), " ").concat(null != (a = i.unit) ? a : "elementos");
                            return "Demasiado pequeno: esperava que ".concat(c(t.origin, "definite"), " fosse ").concat(r, " ").concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Texto inválido: deve começar por "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Texto inválido: deve terminar em "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Texto inválido: deve incluir "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Texto inválido: deve corresponder ao padrão ".concat(t.pattern);
                            return "Formato d".concat(null != (o = r[t.format]) ? o : t.format, " inválido");
                        case "not_multiple_of":
                            return "Número inválido: deve ser múltiplo de ".concat(t.divisor);
                        case "unrecognized_keys": {
                            let n = t.keys.length > 1 ? "s" : "";
                            return "Chave".concat(n, " inválida").concat(n, ": ").concat(_(t.keys, ", "))
                        }
                        case "invalid_key":
                        case "invalid_element":
                            return "Entrada inválida n".concat(c(t.origin, "definite"));
                        case "invalid_union":
                            if (t.options && Array.isArray(t.options) && t.options.length > 0) {
                                let n = t.options.map(t => "'".concat(t, "'")).join(" | ");
                                return "Valor de discriminação inválido. Esperava ".concat(n)
                            }
                            return "Entrada inválida";
                        default:
                            return "Entrada inválida"
                    }
                }
            })()
        }
    }, "ptBR", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "caracteres"
                    },
                    file: {
                        unit: "bytes"
                    },
                    array: {
                        unit: "elementos"
                    },
                    set: {
                        unit: "elementos"
                    },
                    map: {
                        unit: "entradas"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "a entrada",
                        email: "o endereço de e-mail",
                        url: "o URL",
                        emoji: "o emoji",
                        uuid: "o UUID",
                        uuidv4: "o UUIDv4",
                        uuidv6: "o UUIDv6",
                        nanoid: "o nanoid",
                        guid: "o GUID",
                        cuid: "o cuid",
                        cuid2: "o cuid2",
                        ulid: "o ULID",
                        xid: "o XID",
                        ksuid: "o KSUID",
                        datetime: "a data e hora ISO",
                        date: "a data ISO",
                        time: "a hora ISO",
                        duration: "a duração ISO",
                        ipv4: "o endereço IPv4",
                        ipv6: "o endereço IPv6",
                        mac: "o endereço MAC",
                        cidrv4: "a faixa de endereços IPv4",
                        cidrv6: "a faixa de endereços IPv6",
                        base64: "o texto codificado em base64",
                        base64url: "o texto codificado em base64url",
                        json_string: "o texto JSON",
                        e164: "o número E.164",
                        credit_card: "o número de cartão de crédito",
                        currency_code: "o código de moeda",
                        iban: "o IBAN",
                        jwt: "o JWT",
                        template_literal: "a entrada"
                    },
                    i = {
                        definite: "o",
                        indefinite: "um"
                    },
                    a = {
                        definite: "a",
                        indefinite: "uma"
                    },
                    o = {
                        string: {
                            name: "texto",
                            articles: i
                        },
                        number: {
                            name: "número",
                            articles: i
                        },
                        int: {
                            name: "número inteiro",
                            articles: i
                        },
                        boolean: {
                            name: "valor booleano",
                            articles: i
                        },
                        bigint: {
                            name: "número bigint",
                            articles: i
                        },
                        symbol: {
                            name: "símbolo",
                            articles: i
                        },
                        undefined: {
                            name: 'valor "undefined"',
                            articles: i
                        },
                        null: {
                            name: 'valor "nulo"',
                            articles: i
                        },
                        never: {
                            name: 'valor "never"',
                            articles: i
                        },
                        void: {
                            name: 'valor "void"',
                            articles: i
                        },
                        date: {
                            name: "data",
                            articles: a
                        },
                        array: {
                            name: "vetor",
                            articles: i
                        },
                        object: {
                            name: "objeto",
                            articles: i
                        },
                        tuple: {
                            name: "tupla",
                            articles: a
                        },
                        record: {
                            name: "registro",
                            articles: i
                        },
                        map: {
                            name: "mapa",
                            articles: i
                        },
                        set: {
                            name: "conjunto",
                            articles: i
                        },
                        file: {
                            name: "arquivo",
                            articles: i
                        },
                        nonoptional: {
                            name: "valor não opcional",
                            articles: i
                        },
                        nan: {
                            name: 'valor "NaN"',
                            articles: i
                        },
                        function: {
                            name: "função",
                            articles: a
                        }
                    };

                function c(t, n) {
                    var r;
                    let a = null != (r = o[t]) ? r : {
                        name: 'valor "'.concat(t, '"'),
                        articles: i
                    };
                    return "".concat(a.articles[n], " ").concat(a.name)
                }
                return t => {
                    var i, a, o;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = c(t.expected, "indefinite"),
                                r = c(eS(t.input), "indefinite");
                            return "Entrada inválida: esperava ".concat(n, ", recebeu ").concat(r)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Entrada inválida: esperava ".concat(en(t.values[0]));
                            return "Opção inválida: esperava uma das seguintes opções: ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                a = n(t.origin);
                            if (a) return "Grande demais: esperava que ".concat(c(t.origin, "definite"), " tivesse ").concat(r, " ").concat(t.maximum.toString(), " ").concat(null != (i = a.unit) ? i : "elementos");
                            return "Grande demais: esperava que ".concat(c(t.origin, "definite"), " fosse ").concat(r, " ").concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "Pequeno demais: esperava que ".concat(c(t.origin, "definite"), " tivesse ").concat(r, " ").concat(t.minimum.toString(), " ").concat(null != (a = i.unit) ? a : "elementos");
                            return "Pequeno demais: esperava que ".concat(c(t.origin, "definite"), " fosse ").concat(r, " ").concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Texto inválido: deve começar com "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Texto inválido: deve terminar com "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Texto inválido: deve incluir "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Texto inválido: deve corresponder ao padrão ".concat(t.pattern);
                            return "Formato d".concat(null != (o = r[t.format]) ? o : t.format, " inválido");
                        case "not_multiple_of":
                            return "Número inválido: deve ser múltiplo de ".concat(t.divisor);
                        case "unrecognized_keys": {
                            let n = t.keys.length > 1 ? "s" : "";
                            return "Chave".concat(n, " inválida").concat(n, ": ").concat(_(t.keys, ", "))
                        }
                        case "invalid_key":
                        case "invalid_element":
                            return "Entrada inválida n".concat(c(t.origin, "definite"));
                        case "invalid_union":
                            if (t.options && Array.isArray(t.options) && t.options.length > 0) {
                                let n = t.options.map(t => "'".concat(t, "'")).join(" | ");
                                return "Valor de discriminação inválido. Esperava ".concat(n)
                            }
                            return "Entrada inválida";
                        default:
                            return "Entrada inválida"
                    }
                }
            })()
        }
    }, "ro", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "caractere",
                        verb: "să aibă"
                    },
                    file: {
                        unit: "octeți",
                        verb: "să aibă"
                    },
                    array: {
                        unit: "elemente",
                        verb: "să aibă"
                    },
                    set: {
                        unit: "elemente",
                        verb: "să aibă"
                    },
                    map: {
                        unit: "intrări",
                        verb: "să aibă"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "intrare",
                        email: "adresă de email",
                        url: "URL",
                        emoji: "emoji",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "dată și oră ISO",
                        date: "dată ISO",
                        time: "oră ISO",
                        duration: "durată ISO",
                        ipv4: "adresă IPv4",
                        ipv6: "adresă IPv6",
                        mac: "adresă MAC",
                        cidrv4: "interval IPv4",
                        cidrv6: "interval IPv6",
                        base64: "șir codat base64",
                        base64url: "șir codat base64url",
                        json_string: "șir JSON",
                        e164: "număr E.164",
                        credit_card: "număr de card de credit",
                        currency_code: "cod valutar",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "intrare"
                    },
                    i = {
                        nan: "NaN",
                        string: "șir",
                        number: "număr",
                        boolean: "boolean",
                        function: "funcție",
                        array: "matrice",
                        object: "obiect",
                        undefined: "nedefinit",
                        symbol: "simbol",
                        bigint: "număr mare",
                        void: "void",
                        never: "never",
                        map: "hartă",
                        set: "set"
                    };
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            return "Intrare invalidă: așteptat ".concat(n, ", primit ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Intrare invalidă: așteptat ".concat(en(t.values[0]));
                            return "Opțiune invalidă: așteptat una dintre ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "Prea mare: așteptat ca ".concat(null != (c = t.origin) ? c : "valoarea", " ").concat(i.verb, " ").concat(r).concat(t.maximum.toString(), " ").concat(null != (u = i.unit) ? u : "elemente");
                            return "Prea mare: așteptat ca ".concat(null != (l = t.origin) ? l : "valoarea", " să fie ").concat(r).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "Prea mic: așteptat ca ".concat(t.origin, " ").concat(i.verb, " ").concat(r).concat(t.minimum.toString(), " ").concat(i.unit);
                            return "Prea mic: așteptat ca ".concat(t.origin, " să fie ").concat(r).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Șir invalid: trebuie să înceapă cu "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Șir invalid: trebuie să se termine cu "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Șir invalid: trebuie să includă "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Șir invalid: trebuie să se potrivească cu modelul ".concat(t.pattern);
                            return "Format invalid: ".concat(null != (s = r[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Număr invalid: trebuie să fie multiplu de ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Chei nerecunoscute: ".concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "Cheie invalidă în ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Intrare invalidă";
                        case "invalid_element":
                            return "Valoare invalidă în ".concat(t.origin)
                    }
                }
            })()
        }
    }, "ru", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: {
                            one: "символ",
                            few: "символа",
                            many: "символов"
                        },
                        verb: "иметь"
                    },
                    file: {
                        unit: {
                            one: "байт",
                            few: "байта",
                            many: "байт"
                        },
                        verb: "иметь"
                    },
                    array: {
                        unit: {
                            one: "элемент",
                            few: "элемента",
                            many: "элементов"
                        },
                        verb: "иметь"
                    },
                    set: {
                        unit: {
                            one: "элемент",
                            few: "элемента",
                            many: "элементов"
                        },
                        verb: "иметь"
                    },
                    map: {
                        unit: {
                            one: "элемент",
                            few: "элемента",
                            many: "элементов"
                        },
                        verb: "иметь"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "ввод",
                        email: "email адрес",
                        url: "URL",
                        emoji: "эмодзи",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "ISO дата и время",
                        date: "ISO дата",
                        time: "ISO время",
                        duration: "ISO длительность",
                        ipv4: "IPv4 адрес",
                        ipv6: "IPv6 адрес",
                        mac: "MAC адрес",
                        cidrv4: "IPv4 диапазон",
                        cidrv6: "IPv6 диапазон",
                        base64: "строка в формате base64",
                        base64url: "строка в формате base64url",
                        json_string: "JSON строка",
                        e164: "номер E.164",
                        credit_card: "номер кредитной карты",
                        currency_code: "код валюты",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "ввод"
                    },
                    i = {
                        nan: "NaN",
                        number: "число",
                        array: "массив"
                    };
                return t => {
                    var a, o, c, u, l;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "Неверный ввод: ожидалось instanceof ".concat(t.expected, ", получено ").concat(c);
                            return "Неверный ввод: ожидалось ".concat(n, ", получено ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Неверный ввод: ожидалось ".concat(en(t.values[0]));
                            return "Неверный вариант: ожидалось одно из ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) {
                                let n = tH(Number(t.maximum), i.unit.one, i.unit.few, i.unit.many);
                                return "Слишком большое значение: ожидалось, что ".concat(null != (u = t.origin) ? u : "значение", " будет иметь ").concat(r).concat(t.maximum.toString(), " ").concat(n)
                            }
                            return "Слишком большое значение: ожидалось, что ".concat(null != (c = t.origin) ? c : "значение", " будет ").concat(r).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) {
                                let n = tH(Number(t.minimum), i.unit.one, i.unit.few, i.unit.many);
                                return "Слишком маленькое значение: ожидалось, что ".concat(t.origin, " будет иметь ").concat(r).concat(t.minimum.toString(), " ").concat(n)
                            }
                            return "Слишком маленькое значение: ожидалось, что ".concat(t.origin, " будет ").concat(r).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Неверная строка: должна начинаться с "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Неверная строка: должна заканчиваться на "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Неверная строка: должна содержать "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Неверная строка: должна соответствовать шаблону ".concat(t.pattern);
                            return "Неверный ".concat(null != (l = r[t.format]) ? l : t.format);
                        case "not_multiple_of":
                            return "Неверное число: должно быть кратным ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Нераспознанн".concat(t.keys.length > 1 ? "ые" : "ый", " ключ").concat(t.keys.length > 1 ? "и" : "", ": ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "Неверный ключ в ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Неверные входные данные";
                        case "invalid_element":
                            return "Неверное значение в ".concat(t.origin)
                    }
                }
            })()
        }
    }, "sk", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "znakov",
                        verb: "mať"
                    },
                    file: {
                        unit: "bajtov",
                        verb: "mať"
                    },
                    array: {
                        unit: "prvkov",
                        verb: "mať"
                    },
                    set: {
                        unit: "prvkov",
                        verb: "mať"
                    },
                    map: {
                        unit: "položiek",
                        verb: "mať"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "regulárny výraz",
                        email: "e-mailová adresa",
                        url: "URL",
                        emoji: "emoji",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "dátum a čas vo formáte ISO",
                        date: "dátum vo formáte ISO",
                        time: "čas vo formáte ISO",
                        duration: "doba trvania ISO",
                        ipv4: "IPv4 adresa",
                        ipv6: "IPv6 adresa",
                        mac: "MAC adresa",
                        cidrv4: "rozsah IPv4",
                        cidrv6: "rozsah IPv6",
                        base64: "reťazec zakódovaný vo formáte base64",
                        base64url: "reťazec zakódovaný vo formáte base64url",
                        json_string: "reťazec vo formáte JSON",
                        e164: "číslo E.164",
                        credit_card: "číslo kreditnej karty",
                        currency_code: "kód meny",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "vstup"
                    },
                    i = {
                        nan: "NaN",
                        number: "číslo",
                        string: "reťazec",
                        function: "funkcia",
                        array: "pole"
                    };
                return t => {
                    var a, o, c, u, l, s, d, m, f;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "Neplatný vstup: očakávané instanceof ".concat(t.expected, ", obdržané ").concat(c);
                            return "Neplatný vstup: očakávané ".concat(n, ", obdržané ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Neplatný vstup: očakávané ".concat(en(t.values[0]));
                            return "Neplatný vstup: očakávaná jedna z hodnôt ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "Hodnota je príliš veľká: ".concat(null != (u = t.origin) ? u : "hodnota", " musí mať ").concat(r).concat(t.maximum.toString(), " ").concat(null != (l = i.unit) ? l : "prvkov");
                            return "Hodnota je príliš veľká: ".concat(null != (c = t.origin) ? c : "hodnota", " musí byť ").concat(r).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "Hodnota je príliš malá: ".concat(null != (d = t.origin) ? d : "hodnota", " musí mať ").concat(r).concat(t.minimum.toString(), " ").concat(null != (m = i.unit) ? m : "prvkov");
                            return "Hodnota je príliš malá: ".concat(null != (s = t.origin) ? s : "hodnota", " musí byť ").concat(r).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Neplatný reťazec: musí začínať na "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Neplatný reťazec: musí končiť na "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Neplatný reťazec: musí obsahovať "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Neplatný reťazec: musí zodpovedať vzoru ".concat(t.pattern);
                            return "Neplatný formát ".concat(null != (f = r[t.format]) ? f : t.format);
                        case "not_multiple_of":
                            return "Neplatné číslo: musí byť násobkom ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Neznáme klúče: ".concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "Neplatný klúč v ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Neplatný vstup";
                        case "invalid_element":
                            return "Neplatná hodnota v ".concat(t.origin)
                    }
                }
            })()
        }
    }, "sl", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "znakov",
                        verb: "imeti"
                    },
                    file: {
                        unit: "bajtov",
                        verb: "imeti"
                    },
                    array: {
                        unit: "elementov",
                        verb: "imeti"
                    },
                    set: {
                        unit: "elementov",
                        verb: "imeti"
                    },
                    map: {
                        unit: "elementov",
                        verb: "imeti"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "vnos",
                        email: "e-poštni naslov",
                        url: "URL",
                        emoji: "emoji",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "ISO datum in čas",
                        date: "ISO datum",
                        time: "ISO čas",
                        duration: "ISO trajanje",
                        ipv4: "IPv4 naslov",
                        ipv6: "IPv6 naslov",
                        mac: "MAC naslov",
                        cidrv4: "obseg IPv4",
                        cidrv6: "obseg IPv6",
                        base64: "base64 kodiran niz",
                        base64url: "base64url kodiran niz",
                        json_string: "JSON niz",
                        e164: "E.164 številka",
                        credit_card: "številka kreditne kartice",
                        currency_code: "koda valute",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "vnos"
                    },
                    i = {
                        nan: "NaN",
                        number: "število",
                        array: "tabela"
                    };
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "Neveljaven vnos: pričakovano instanceof ".concat(t.expected, ", prejeto ").concat(c);
                            return "Neveljaven vnos: pričakovano ".concat(n, ", prejeto ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Neveljaven vnos: pričakovano ".concat(en(t.values[0]));
                            return "Neveljavna možnost: pričakovano eno izmed ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "Preveliko: pričakovano, da bo ".concat(null != (c = t.origin) ? c : "vrednost", " imelo ").concat(r).concat(t.maximum.toString(), " ").concat(null != (u = i.unit) ? u : "elementov");
                            return "Preveliko: pričakovano, da bo ".concat(null != (l = t.origin) ? l : "vrednost", " ").concat(r).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "Premajhno: pričakovano, da bo ".concat(t.origin, " imelo ").concat(r).concat(t.minimum.toString(), " ").concat(i.unit);
                            return "Premajhno: pričakovano, da bo ".concat(t.origin, " ").concat(r).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Neveljaven niz: mora se začeti z "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Neveljaven niz: mora se končati z "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Neveljaven niz: mora vsebovati "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Neveljaven niz: mora ustrezati vzorcu ".concat(t.pattern);
                            return "Neveljaven ".concat(null != (s = r[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Neveljavno število: mora biti večkratnik ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Neprepoznan".concat(t.keys.length > 1 ? "i ključi" : " ključ", ": ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "Neveljaven ključ v ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Neveljaven vnos";
                        case "invalid_element":
                            return "Neveljavna vrednost v ".concat(t.origin)
                    }
                }
            })()
        }
    }, "sv", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "tecken",
                        verb: "att ha"
                    },
                    file: {
                        unit: "bytes",
                        verb: "att ha"
                    },
                    array: {
                        unit: "objekt",
                        verb: "att innehålla"
                    },
                    set: {
                        unit: "objekt",
                        verb: "att innehålla"
                    },
                    map: {
                        unit: "objekt",
                        verb: "att innehålla"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "reguljärt uttryck",
                        email: "e-postadress",
                        url: "URL",
                        emoji: "emoji",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "ISO-datum och tid",
                        date: "ISO-datum",
                        time: "ISO-tid",
                        duration: "ISO-varaktighet",
                        ipv4: "IPv4-adress",
                        ipv6: "IPv6-adress",
                        mac: "MAC-adress",
                        cidrv4: "IPv4-spektrum",
                        cidrv6: "IPv6-spektrum",
                        base64: "base64-kodad sträng",
                        base64url: "base64url-kodad sträng",
                        json_string: "JSON-sträng",
                        e164: "E.164-nummer",
                        credit_card: "kreditkortsnummer",
                        currency_code: "valutakod",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "mall-literal"
                    },
                    i = {
                        nan: "NaN",
                        number: "antal",
                        array: "lista"
                    };
                return t => {
                    var a, o, c, u, l, s, d, m, f, v;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "Ogiltig inmatning: förväntat instanceof ".concat(t.expected, ", fick ").concat(c);
                            return "Ogiltig inmatning: förväntat ".concat(n, ", fick ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Ogiltig inmatning: förväntat ".concat(en(t.values[0]));
                            return "Ogiltigt val: förväntade en av ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "För stor(t): förväntade ".concat(null != (u = t.origin) ? u : "värdet", " att ha ").concat(r).concat(t.maximum.toString(), " ").concat(null != (l = i.unit) ? l : "element");
                            return "För stor(t): förväntat ".concat(null != (c = t.origin) ? c : "värdet", " att ha ").concat(r).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "För lite(t): förväntade ".concat(null != (d = t.origin) ? d : "värdet", " att ha ").concat(r).concat(t.minimum.toString(), " ").concat(i.unit);
                            return "För lite(t): förväntade ".concat(null != (s = t.origin) ? s : "värdet", " att ha ").concat(r).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Ogiltig sträng: måste börja med "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Ogiltig sträng: måste sluta med "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Ogiltig sträng: måste innehålla "'.concat(t.includes, '"');
                            if ("regex" === t.format) return 'Ogiltig sträng: måste matcha mönstret "'.concat(t.pattern, '"');
                            return "Ogiltig(t) ".concat(null != (m = r[t.format]) ? m : t.format);
                        case "not_multiple_of":
                            return "Ogiltigt tal: måste vara en multipel av ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "".concat(t.keys.length > 1 ? "Okända nycklar" : "Okänd nyckel", ": ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "Ogiltig nyckel i ".concat(null != (f = t.origin) ? f : "värdet");
                        case "invalid_union":
                        default:
                            return "Ogiltig input";
                        case "invalid_element":
                            return "Ogiltigt värde i ".concat(null != (v = t.origin) ? v : "värdet")
                    }
                }
            })()
        }
    }, "ta", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "எழுத்துக்கள்",
                        verb: "கொண்டிருக்க வேண்டும்"
                    },
                    file: {
                        unit: "பைட்டுகள்",
                        verb: "கொண்டிருக்க வேண்டும்"
                    },
                    array: {
                        unit: "உறுப்புகள்",
                        verb: "கொண்டிருக்க வேண்டும்"
                    },
                    set: {
                        unit: "உறுப்புகள்",
                        verb: "கொண்டிருக்க வேண்டும்"
                    },
                    map: {
                        unit: "உறுப்புகள்",
                        verb: "கொண்டிருக்க வேண்டும்"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "உள்ளீடு",
                        email: "மின்னஞ்சல் முகவரி",
                        url: "URL",
                        emoji: "emoji",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "ISO தேதி நேரம்",
                        date: "ISO தேதி",
                        time: "ISO நேரம்",
                        duration: "ISO கால அளவு",
                        ipv4: "IPv4 முகவரி",
                        ipv6: "IPv6 முகவரி",
                        mac: "MAC முகவரி",
                        cidrv4: "IPv4 வரம்பு",
                        cidrv6: "IPv6 வரம்பு",
                        base64: "base64-encoded சரம்",
                        base64url: "base64url-encoded சரம்",
                        json_string: "JSON சரம்",
                        e164: "E.164 எண்",
                        credit_card: "கடன் அட்டை எண்",
                        currency_code: "நாணயக் குறியீடு",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "input"
                    },
                    i = {
                        nan: "NaN",
                        number: "எண்",
                        array: "அணி",
                        null: "வெறுமை"
                    };
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "தவறான உள்ளீடு: எதிர்பார்க்கப்பட்டது instanceof ".concat(t.expected, ", பெறப்பட்டது ").concat(c);
                            return "தவறான உள்ளீடு: எதிர்பார்க்கப்பட்டது ".concat(n, ", பெறப்பட்டது ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "தவறான உள்ளீடு: எதிர்பார்க்கப்பட்டது ".concat(en(t.values[0]));
                            return "தவறான விருப்பம்: எதிர்பார்க்கப்பட்டது ".concat(_(t.values, "|"), " இல் ஒன்று");
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "மிக பெரியது: எதிர்பார்க்கப்பட்டது ".concat(null != (u = t.origin) ? u : "மதிப்பு", " ").concat(r).concat(t.maximum.toString(), " ").concat(null != (l = i.unit) ? l : "உறுப்புகள்", " ஆக இருக்க வேண்டும்");
                            return "மிக பெரியது: எதிர்பார்க்கப்பட்டது ".concat(null != (c = t.origin) ? c : "மதிப்பு", " ").concat(r).concat(t.maximum.toString(), " ஆக இருக்க வேண்டும்")
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "மிகச் சிறியது: எதிர்பார்க்கப்பட்டது ".concat(t.origin, " ").concat(r).concat(t.minimum.toString(), " ").concat(i.unit, " ஆக இருக்க வேண்டும்");
                            return "மிகச் சிறியது: எதிர்பார்க்கப்பட்டது ".concat(t.origin, " ").concat(r).concat(t.minimum.toString(), " ஆக இருக்க வேண்டும்")
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'தவறான சரம்: "'.concat(t.prefix, '" இல் தொடங்க வேண்டும்');
                            if ("ends_with" === t.format) return 'தவறான சரம்: "'.concat(t.suffix, '" இல் முடிவடைய வேண்டும்');
                            if ("includes" === t.format) return 'தவறான சரம்: "'.concat(t.includes, '" ஐ உள்ளடக்க வேண்டும்');
                            if ("regex" === t.format) return "தவறான சரம்: ".concat(t.pattern, " முறைபாட்டுடன் பொருந்த வேண்டும்");
                            return "தவறான ".concat(null != (s = r[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "தவறான எண்: ".concat(t.divisor, " இன் பலமாக இருக்க வேண்டும்");
                        case "unrecognized_keys":
                            return "அடையாளம் தெரியாத விசை".concat(t.keys.length > 1 ? "கள்" : "", ": ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "".concat(t.origin, " இல் தவறான விசை");
                        case "invalid_union":
                        default:
                            return "தவறான உள்ளீடு";
                        case "invalid_element":
                            return "".concat(t.origin, " இல் தவறான மதிப்பு")
                    }
                }
            })()
        }
    }, "tg", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "аломат",
                        verb: "дошта бошад"
                    },
                    file: {
                        unit: "байт",
                        verb: "дошта бошад"
                    },
                    array: {
                        unit: "унсур",
                        verb: "дошта бошад"
                    },
                    set: {
                        unit: "унсур",
                        verb: "дошта бошад"
                    },
                    map: {
                        unit: "сабт",
                        verb: "дошта бошад"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "вуруд",
                        email: "суроғаи email",
                        url: "URL",
                        emoji: "эмоҷи",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "санаву вақти ISO",
                        date: "санаи ISO",
                        time: "вақти ISO",
                        duration: "давомнокии ISO",
                        ipv4: "суроғаи IPv4",
                        ipv6: "суроғаи IPv6",
                        mac: "суроғаи MAC",
                        cidrv4: "маҳдудаи IPv4",
                        cidrv6: "маҳдудаи IPv6",
                        base64: "сатри дар формати base64",
                        base64url: "сатри дар формати base64url",
                        json_string: "сатри JSON",
                        e164: "рақами E.164",
                        credit_card: "рақами корти кредитӣ",
                        currency_code: "рамзи асъор",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "вуруд"
                    },
                    i = {
                        nan: "NaN",
                        number: "рақам",
                        string: "сатр",
                        array: "массив",
                        object: "объект",
                        date: "сана"
                    };
                return t => {
                    var a, o, c, u, l;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            return "Вуруди нодуруст: ".concat(n, " интизор мерафт, ").concat(c, " гирифта шуд")
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Вуруди нодуруст: ".concat(en(t.values[0]), " интизор мерафт");
                            return "Интихоби нодуруст: яке аз ".concat(_(t.values, "|"), " интизор мерафт");
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "Хеле калон: ".concat(null != (c = t.origin) ? c : "қимат", " бояд ").concat(r).concat(t.maximum.toString(), " ").concat(i.unit, " ").concat(i.verb);
                            return "Хеле калон: ".concat(null != (u = t.origin) ? u : "қимат", " бояд ").concat(r).concat(t.maximum.toString(), " бошад")
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "Хеле хурд: ".concat(t.origin, " бояд ").concat(r).concat(t.minimum.toString(), " ").concat(i.unit, " ").concat(i.verb);
                            return "Хеле хурд: ".concat(t.origin, " бояд ").concat(r).concat(t.minimum.toString(), " бошад")
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Сатри нодуруст: бояд бо "'.concat(t.prefix, '" оғоз шавад');
                            if ("ends_with" === t.format) return 'Сатри нодуруст: бояд бо "'.concat(t.suffix, '" анҷом ёбад');
                            if ("includes" === t.format) return 'Сатри нодуруст: бояд "'.concat(t.includes, '"-ро дар бар гирад');
                            if ("regex" === t.format) return "Сатри нодуруст: бояд ба намунаи ".concat(t.pattern, " мувофиқат кунад");
                            return "".concat(null != (l = r[t.format]) ? l : t.format, "-и нодуруст");
                        case "not_multiple_of":
                            return "Рақами нодуруст: бояд ба ".concat(t.divisor, " бе бақия тақсим шавад");
                        case "unrecognized_keys":
                            return "Калид".concat(t.keys.length > 1 ? "ҳои" : "и", " номаълум: ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "Калиди нодуруст дар ".concat(t.origin);
                        case "invalid_union":
                            if (t.options && Array.isArray(t.options) && t.options.length > 0) {
                                let n = t.options.map(t => "'".concat(t, "'")).join(" | ");
                                return "Қимати нодурусти дискриминатор: ".concat(n, " интизор мерафт")
                            }
                            return "Вуруди нодуруст";
                        case "invalid_element":
                            return "Қимати нодуруст дар ".concat(t.origin);
                        default:
                            return "Вуруди нодуруст"
                    }
                }
            })()
        }
    }, "th", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "ตัวอักษร",
                        verb: "ควรมี"
                    },
                    file: {
                        unit: "ไบต์",
                        verb: "ควรมี"
                    },
                    array: {
                        unit: "รายการ",
                        verb: "ควรมี"
                    },
                    set: {
                        unit: "รายการ",
                        verb: "ควรมี"
                    },
                    map: {
                        unit: "รายการ",
                        verb: "ควรมี"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "ข้อมูลที่ป้อน",
                        email: "ที่อยู่อีเมล",
                        url: "URL",
                        emoji: "อิโมจิ",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "วันที่เวลาแบบ ISO",
                        date: "วันที่แบบ ISO",
                        time: "เวลาแบบ ISO",
                        duration: "ช่วงเวลาแบบ ISO",
                        ipv4: "ที่อยู่ IPv4",
                        ipv6: "ที่อยู่ IPv6",
                        mac: "ที่อยู่ MAC",
                        cidrv4: "ช่วง IP แบบ IPv4",
                        cidrv6: "ช่วง IP แบบ IPv6",
                        base64: "ข้อความแบบ Base64",
                        base64url: "ข้อความแบบ Base64 สำหรับ URL",
                        json_string: "ข้อความแบบ JSON",
                        e164: "เบอร์โทรศัพท์ระหว่างประเทศ (E.164)",
                        credit_card: "หมายเลขบัตรเครดิต",
                        currency_code: "รหัสสกุลเงิน",
                        iban: "IBAN",
                        jwt: "โทเคน JWT",
                        template_literal: "ข้อมูลที่ป้อน"
                    },
                    i = {
                        nan: "NaN",
                        number: "ตัวเลข",
                        array: "อาร์เรย์ (Array)",
                        null: "ไม่มีค่า (null)"
                    };
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "ประเภทข้อมูลไม่ถูกต้อง: ควรเป็น instanceof ".concat(t.expected, " แต่ได้รับ ").concat(c);
                            return "ประเภทข้อมูลไม่ถูกต้อง: ควรเป็น ".concat(n, " แต่ได้รับ ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "ค่าไม่ถูกต้อง: ควรเป็น ".concat(en(t.values[0]));
                            return "ตัวเลือกไม่ถูกต้อง: ควรเป็นหนึ่งใน ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "ไม่เกิน" : "น้อยกว่า",
                                i = n(t.origin);
                            if (i) return "เกินกำหนด: ".concat(null != (c = t.origin) ? c : "ค่า", " ควรมี").concat(r, " ").concat(t.maximum.toString(), " ").concat(null != (u = i.unit) ? u : "รายการ");
                            return "เกินกำหนด: ".concat(null != (l = t.origin) ? l : "ค่า", " ควรมี").concat(r, " ").concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? "อย่างน้อย" : "มากกว่า",
                                i = n(t.origin);
                            if (i) return "น้อยกว่ากำหนด: ".concat(t.origin, " ควรมี").concat(r, " ").concat(t.minimum.toString(), " ").concat(i.unit);
                            return "น้อยกว่ากำหนด: ".concat(t.origin, " ควรมี").concat(r, " ").concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'รูปแบบไม่ถูกต้อง: ข้อความต้องขึ้นต้นด้วย "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'รูปแบบไม่ถูกต้อง: ข้อความต้องลงท้ายด้วย "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'รูปแบบไม่ถูกต้อง: ข้อความต้องมี "'.concat(t.includes, '" อยู่ในข้อความ');
                            if ("regex" === t.format) return "รูปแบบไม่ถูกต้อง: ต้องตรงกับรูปแบบที่กำหนด ".concat(t.pattern);
                            return "รูปแบบไม่ถูกต้อง: ".concat(null != (s = r[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "ตัวเลขไม่ถูกต้อง: ต้องเป็นจำนวนที่หารด้วย ".concat(t.divisor, " ได้ลงตัว");
                        case "unrecognized_keys":
                            return "พบคีย์ที่ไม่รู้จัก: ".concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "คีย์ไม่ถูกต้องใน ".concat(t.origin);
                        case "invalid_union":
                            return "ข้อมูลไม่ถูกต้อง: ไม่ตรงกับรูปแบบยูเนียนที่กำหนดไว้";
                        case "invalid_element":
                            return "ข้อมูลไม่ถูกต้องใน ".concat(t.origin);
                        default:
                            return "ข้อมูลไม่ถูกต้อง"
                    }
                }
            })()
        }
    }, "tk", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "simwol",
                        verb: "bolmaly"
                    },
                    file: {
                        unit: "baýt",
                        verb: "bolmaly"
                    },
                    array: {
                        unit: "elementler",
                        verb: "bolmaly"
                    },
                    set: {
                        unit: "elementler",
                        verb: "bolmaly"
                    },
                    map: {
                        unit: "elementler",
                        verb: "bolmaly"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "giriş",
                        email: "e-poçta salgysy",
                        url: "URL",
                        emoji: "emoji",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "ISO sene we wagt",
                        date: "ISO sene",
                        time: "ISO wagt",
                        duration: "ISO wagt aralygy",
                        ipv4: "IPv4 salgysy",
                        ipv6: "IPv6 salgysy",
                        mac: "MAC salgysy",
                        cidrv4: "IPv4 aralygy",
                        cidrv6: "IPv6 aralygy",
                        base64: "base64 bilen şifrlenen setir",
                        base64url: "base64url bilen şifrlenen setir",
                        json_string: "JSON setiri",
                        e164: "E.164 nomeri",
                        credit_card: "kredit kartynyň nomeri",
                        currency_code: "walýuta kody",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "şablon"
                    },
                    i = {
                        nan: "NaN"
                    };
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            return "Nädogry baha: garaşylan ".concat(n, " ýerine ").concat(c, " alyndy")
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Nädogry baha: ".concat(en(t.values[0]), " bolmaly");
                            return "Nädogry saýlaw: aşakdakylardan biri bolmaly: ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "Has uly: garaşylýan ".concat(null != (c = t.origin) ? c : "baha", " ").concat(r, " ").concat(t.maximum.toString(), " ").concat(null != (u = i.unit) ? u : "element");
                            return "Has uly: garaşylýan ".concat(null != (l = t.origin) ? l : "baha", " ").concat(r, " ").concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "Has kiçi: garaşylýan ".concat(t.origin, " ").concat(r, " ").concat(t.minimum.toString(), " ").concat(i.unit);
                            return "Has kiçi: garaşylýan ".concat(t.origin, " ").concat(r, " ").concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Nädogry setir: "'.concat(t.prefix, '" bilen başlamaly');
                            if ("ends_with" === t.format) return 'Nädogry setir: "'.concat(t.suffix, '" bilen gutarmaly');
                            if ("includes" === t.format) return 'Nädogry setir: "'.concat(t.includes, '" saklamaly');
                            if ("regex" === t.format) return "Nädogry setir: ".concat(t.pattern, " nusga laýyk bolmaly");
                            return "Nädogry ".concat(null != (s = r[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Nädogry san: ".concat(t.divisor, " bilen galyndysyz bölünmeli");
                        case "unrecognized_keys":
                            return "Tanalmaýan açar".concat(t.keys.length > 1 ? "lar" : "", ": ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "".concat(t.origin, " içinde nädogry açar");
                        case "invalid_union":
                        default:
                            return "Nädogry baha";
                        case "invalid_element":
                            return "".concat(t.origin, " içinde nädogry baha")
                    }
                }
            })()
        }
    }, "tr", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "karakter",
                        verb: "olmalı"
                    },
                    file: {
                        unit: "bayt",
                        verb: "olmalı"
                    },
                    array: {
                        unit: "öğe",
                        verb: "olmalı"
                    },
                    set: {
                        unit: "öğe",
                        verb: "olmalı"
                    },
                    map: {
                        unit: "öğe",
                        verb: "olmalı"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "girdi",
                        email: "e-posta adresi",
                        url: "URL",
                        emoji: "emoji",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "ISO tarih ve saat",
                        date: "ISO tarih",
                        time: "ISO saat",
                        duration: "ISO süre",
                        ipv4: "IPv4 adresi",
                        ipv6: "IPv6 adresi",
                        mac: "MAC adresi",
                        cidrv4: "IPv4 aralığı",
                        cidrv6: "IPv6 aralığı",
                        base64: "base64 ile şifrelenmiş metin",
                        base64url: "base64url ile şifrelenmiş metin",
                        json_string: "JSON dizesi",
                        e164: "E.164 sayısı",
                        credit_card: "kredi kartı numarası",
                        currency_code: "para birimi kodu",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "Şablon dizesi"
                    },
                    i = {
                        nan: "NaN"
                    };
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "Geçersiz değer: beklenen instanceof ".concat(t.expected, ", alınan ").concat(c);
                            return "Geçersiz değer: beklenen ".concat(n, ", alınan ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Geçersiz değer: beklenen ".concat(en(t.values[0]));
                            return "Geçersiz seçenek: aşağıdakilerden biri olmalı: ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "Çok büyük: beklenen ".concat(null != (c = t.origin) ? c : "değer", " ").concat(r).concat(t.maximum.toString(), " ").concat(null != (u = i.unit) ? u : "öğe");
                            return "Çok büyük: beklenen ".concat(null != (l = t.origin) ? l : "değer", " ").concat(r).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "Çok küçük: beklenen ".concat(t.origin, " ").concat(r).concat(t.minimum.toString(), " ").concat(i.unit);
                            return "Çok küçük: beklenen ".concat(t.origin, " ").concat(r).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Geçersiz metin: "'.concat(t.prefix, '" ile başlamalı');
                            if ("ends_with" === t.format) return 'Geçersiz metin: "'.concat(t.suffix, '" ile bitmeli');
                            if ("includes" === t.format) return 'Geçersiz metin: "'.concat(t.includes, '" içermeli');
                            if ("regex" === t.format) return "Geçersiz metin: ".concat(t.pattern, " desenine uymalı");
                            return "Geçersiz ".concat(null != (s = r[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "Geçersiz sayı: ".concat(t.divisor, " ile tam bölünebilmeli");
                        case "unrecognized_keys":
                            return "Tanınmayan anahtar".concat(t.keys.length > 1 ? "lar" : "", ": ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "".concat(t.origin, " içinde geçersiz anahtar");
                        case "invalid_union":
                        default:
                            return "Geçersiz değer";
                        case "invalid_element":
                            return "".concat(t.origin, " içinde geçersiz değer")
                    }
                }
            })()
        }
    }, "ua", 0, function() {
        return tY()
    }, "uk", 0, tY, "ur", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "حروف",
                        verb: "ہونا"
                    },
                    file: {
                        unit: "بائٹس",
                        verb: "ہونا"
                    },
                    array: {
                        unit: "آئٹمز",
                        verb: "ہونا"
                    },
                    set: {
                        unit: "آئٹمز",
                        verb: "ہونا"
                    },
                    map: {
                        unit: "آئٹمز",
                        verb: "ہونا"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "ان پٹ",
                        email: "ای میل ایڈریس",
                        url: "یو آر ایل",
                        emoji: "ایموجی",
                        uuid: "یو یو آئی ڈی",
                        uuidv4: "یو یو آئی ڈی وی 4",
                        uuidv6: "یو یو آئی ڈی وی 6",
                        nanoid: "نینو آئی ڈی",
                        guid: "جی یو آئی ڈی",
                        cuid: "سی یو آئی ڈی",
                        cuid2: "سی یو آئی ڈی 2",
                        ulid: "یو ایل آئی ڈی",
                        xid: "ایکس آئی ڈی",
                        ksuid: "کے ایس یو آئی ڈی",
                        datetime: "آئی ایس او ڈیٹ ٹائم",
                        date: "آئی ایس او تاریخ",
                        time: "آئی ایس او وقت",
                        duration: "آئی ایس او مدت",
                        ipv4: "آئی پی وی 4 ایڈریس",
                        ipv6: "آئی پی وی 6 ایڈریس",
                        mac: "ایم اے سی ایڈریس",
                        cidrv4: "آئی پی وی 4 رینج",
                        cidrv6: "آئی پی وی 6 رینج",
                        base64: "بیس 64 ان کوڈڈ سٹرنگ",
                        base64url: "بیس 64 یو آر ایل ان کوڈڈ سٹرنگ",
                        json_string: "جے ایس او این سٹرنگ",
                        e164: "ای 164 نمبر",
                        credit_card: "کریڈٹ کارڈ نمبر",
                        currency_code: "کرنسی کوڈ",
                        iban: "IBAN",
                        jwt: "جے ڈبلیو ٹی",
                        template_literal: "ان پٹ"
                    },
                    i = {
                        nan: "NaN",
                        number: "نمبر",
                        array: "آرے",
                        null: "نل"
                    };
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "غلط ان پٹ: instanceof ".concat(t.expected, " متوقع تھا، ").concat(c, " موصول ہوا");
                            return "غلط ان پٹ: ".concat(n, " متوقع تھا، ").concat(c, " موصول ہوا")
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "غلط ان پٹ: ".concat(en(t.values[0]), " متوقع تھا");
                            return "غلط آپشن: ".concat(_(t.values, "|"), " میں سے ایک متوقع تھا");
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "بہت بڑا: ".concat(null != (c = t.origin) ? c : "ویلیو", " کے ").concat(r).concat(t.maximum.toString(), " ").concat(null != (u = i.unit) ? u : "عناصر", " ہونے متوقع تھے");
                            return "بہت بڑا: ".concat(null != (l = t.origin) ? l : "ویلیو", " کا ").concat(r).concat(t.maximum.toString(), " ہونا متوقع تھا")
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "بہت چھوٹا: ".concat(t.origin, " کے ").concat(r).concat(t.minimum.toString(), " ").concat(i.unit, " ہونے متوقع تھے");
                            return "بہت چھوٹا: ".concat(t.origin, " کا ").concat(r).concat(t.minimum.toString(), " ہونا متوقع تھا")
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'غلط سٹرنگ: "'.concat(t.prefix, '" سے شروع ہونا چاہیے');
                            if ("ends_with" === t.format) return 'غلط سٹرنگ: "'.concat(t.suffix, '" پر ختم ہونا چاہیے');
                            if ("includes" === t.format) return 'غلط سٹرنگ: "'.concat(t.includes, '" شامل ہونا چاہیے');
                            if ("regex" === t.format) return "غلط سٹرنگ: پیٹرن ".concat(t.pattern, " سے میچ ہونا چاہیے");
                            return "غلط ".concat(null != (s = r[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "غلط نمبر: ".concat(t.divisor, " کا مضاعف ہونا چاہیے");
                        case "unrecognized_keys":
                            return "غیر تسلیم شدہ کی".concat(t.keys.length > 1 ? "ز" : "", ": ").concat(_(t.keys, "، "));
                        case "invalid_key":
                            return "".concat(t.origin, " میں غلط کی");
                        case "invalid_union":
                        default:
                            return "غلط ان پٹ";
                        case "invalid_element":
                            return "".concat(t.origin, " میں غلط ویلیو")
                    }
                }
            })()
        }
    }, "uz", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "belgi",
                        verb: "bo‘lishi kerak"
                    },
                    file: {
                        unit: "bayt",
                        verb: "bo‘lishi kerak"
                    },
                    array: {
                        unit: "element",
                        verb: "bo‘lishi kerak"
                    },
                    set: {
                        unit: "element",
                        verb: "bo‘lishi kerak"
                    },
                    map: {
                        unit: "yozuv",
                        verb: "bo‘lishi kerak"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "kirish",
                        email: "elektron pochta manzili",
                        url: "URL",
                        emoji: "emoji",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "ISO sana va vaqti",
                        date: "ISO sana",
                        time: "ISO vaqt",
                        duration: "ISO davomiylik",
                        ipv4: "IPv4 manzil",
                        ipv6: "IPv6 manzil",
                        mac: "MAC manzil",
                        cidrv4: "IPv4 diapazon",
                        cidrv6: "IPv6 diapazon",
                        base64: "base64 kodlangan satr",
                        base64url: "base64url kodlangan satr",
                        json_string: "JSON satr",
                        e164: "E.164 raqam",
                        credit_card: "kredit karta raqami",
                        currency_code: "valyuta kodi",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "kirish"
                    },
                    i = {
                        nan: "NaN",
                        number: "raqam",
                        array: "massiv"
                    };
                return t => {
                    var a, o, c, u, l;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "Noto‘g‘ri kirish: kutilgan instanceof ".concat(t.expected, ", qabul qilingan ").concat(c);
                            return "Noto‘g‘ri kirish: kutilgan ".concat(n, ", qabul qilingan ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Noto‘g‘ri kirish: kutilgan ".concat(en(t.values[0]));
                            return "Noto‘g‘ri variant: quyidagilardan biri kutilgan ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "Juda katta: kutilgan ".concat(null != (c = t.origin) ? c : "qiymat", " ").concat(r).concat(t.maximum.toString(), " ").concat(i.unit, " ").concat(i.verb);
                            return "Juda katta: kutilgan ".concat(null != (u = t.origin) ? u : "qiymat", " ").concat(r).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "Juda kichik: kutilgan ".concat(t.origin, " ").concat(r).concat(t.minimum.toString(), " ").concat(i.unit, " ").concat(i.verb);
                            return "Juda kichik: kutilgan ".concat(t.origin, " ").concat(r).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Noto‘g‘ri satr: "'.concat(t.prefix, '" bilan boshlanishi kerak');
                            if ("ends_with" === t.format) return 'Noto‘g‘ri satr: "'.concat(t.suffix, '" bilan tugashi kerak');
                            if ("includes" === t.format) return 'Noto‘g‘ri satr: "'.concat(t.includes, '" ni o‘z ichiga olishi kerak');
                            if ("regex" === t.format) return "Noto‘g‘ri satr: ".concat(t.pattern, " shabloniga mos kelishi kerak");
                            return "Noto‘g‘ri ".concat(null != (l = r[t.format]) ? l : t.format);
                        case "not_multiple_of":
                            return "Noto‘g‘ri raqam: ".concat(t.divisor, " ning karralisi bo‘lishi kerak");
                        case "unrecognized_keys":
                            return "Noma’lum kalit".concat(t.keys.length > 1 ? "lar" : "", ": ").concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "".concat(t.origin, " dagi kalit noto‘g‘ri");
                        case "invalid_union":
                        default:
                            return "Noto‘g‘ri kirish";
                        case "invalid_element":
                            return "".concat(t.origin, " da noto‘g‘ri qiymat")
                    }
                }
            })()
        }
    }, "vi", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "ký tự",
                        verb: "có"
                    },
                    file: {
                        unit: "byte",
                        verb: "có"
                    },
                    array: {
                        unit: "phần tử",
                        verb: "có"
                    },
                    set: {
                        unit: "phần tử",
                        verb: "có"
                    },
                    map: {
                        unit: "phần tử",
                        verb: "có"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "đầu vào",
                        email: "địa chỉ email",
                        url: "URL",
                        emoji: "emoji",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "ngày giờ ISO",
                        date: "ngày ISO",
                        time: "giờ ISO",
                        duration: "khoảng thời gian ISO",
                        ipv4: "địa chỉ IPv4",
                        ipv6: "địa chỉ IPv6",
                        mac: "địa chỉ MAC",
                        cidrv4: "dải IPv4",
                        cidrv6: "dải IPv6",
                        base64: "chuỗi mã hóa base64",
                        base64url: "chuỗi mã hóa base64url",
                        json_string: "chuỗi JSON",
                        e164: "số E.164",
                        credit_card: "số thẻ tín dụng",
                        currency_code: "mã tiền tệ",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "đầu vào"
                    },
                    i = {
                        nan: "NaN",
                        number: "số",
                        array: "mảng"
                    };
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "Đầu vào không hợp lệ: mong đợi instanceof ".concat(t.expected, ", nhận được ").concat(c);
                            return "Đầu vào không hợp lệ: mong đợi ".concat(n, ", nhận được ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Đầu vào không hợp lệ: mong đợi ".concat(en(t.values[0]));
                            return "Tùy chọn không hợp lệ: mong đợi một trong các giá trị ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "Quá lớn: mong đợi ".concat(null != (c = t.origin) ? c : "giá trị", " ").concat(i.verb, " ").concat(r).concat(t.maximum.toString(), " ").concat(null != (u = i.unit) ? u : "phần tử");
                            return "Quá lớn: mong đợi ".concat(null != (l = t.origin) ? l : "giá trị", " ").concat(r).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "Quá nhỏ: mong đợi ".concat(t.origin, " ").concat(i.verb, " ").concat(r).concat(t.minimum.toString(), " ").concat(i.unit);
                            return "Quá nhỏ: mong đợi ".concat(t.origin, " ").concat(r).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Chuỗi không hợp lệ: phải bắt đầu bằng "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Chuỗi không hợp lệ: phải kết thúc bằng "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Chuỗi không hợp lệ: phải bao gồm "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Chuỗi không hợp lệ: phải khớp với mẫu ".concat(t.pattern);
                            return "".concat(null != (s = r[t.format]) ? s : t.format, " không hợp lệ");
                        case "not_multiple_of":
                            return "Số không hợp lệ: phải là bội số của ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Khóa không được nhận dạng: ".concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "Khóa không hợp lệ trong ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Đầu vào không hợp lệ";
                        case "invalid_element":
                            return "Giá trị không hợp lệ trong ".concat(t.origin)
                    }
                }
            })()
        }
    }, "yo", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "àmi",
                        verb: "ní"
                    },
                    file: {
                        unit: "bytes",
                        verb: "ní"
                    },
                    array: {
                        unit: "nkan",
                        verb: "ní"
                    },
                    set: {
                        unit: "nkan",
                        verb: "ní"
                    },
                    map: {
                        unit: "nkan",
                        verb: "ní"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "ẹ̀rọ ìbáwọlé",
                        email: "àdírẹ́sì ìmẹ́lì",
                        url: "URL",
                        emoji: "emoji",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "àkókò ISO",
                        date: "ọjọ́ ISO",
                        time: "àkókò ISO",
                        duration: "àkókò tó pé ISO",
                        ipv4: "àdírẹ́sì IPv4",
                        ipv6: "àdírẹ́sì IPv6",
                        mac: "àdírẹ́sì MAC",
                        cidrv4: "àgbègbè IPv4",
                        cidrv6: "àgbègbè IPv6",
                        base64: "ọ̀rọ̀ tí a kọ́ ní base64",
                        base64url: "ọ̀rọ̀ base64url",
                        json_string: "ọ̀rọ̀ JSON",
                        e164: "nọ́mbà E.164",
                        credit_card: "nọmba kaadi gbese",
                        currency_code: "koodu owó",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "ẹ̀rọ ìbáwọlé"
                    },
                    i = {
                        nan: "NaN",
                        number: "nọ́mbà",
                        array: "akopọ"
                    };
                return t => {
                    var a, o, c, u;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "Ìbáwọlé aṣìṣe: a ní láti fi instanceof ".concat(t.expected, ", àmọ̀ a rí ").concat(c);
                            return "Ìbáwọlé aṣìṣe: a ní láti fi ".concat(n, ", àmọ̀ a rí ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "Ìbáwọlé aṣìṣe: a ní láti fi ".concat(en(t.values[0]));
                            return "Àṣàyàn aṣìṣe: yan ọ̀kan lára ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "Tó pọ̀ jù: a ní láti jẹ́ pé ".concat(null != (c = t.origin) ? c : "iye", " ").concat(i.verb, " ").concat(r).concat(t.maximum, " ").concat(i.unit);
                            return "Tó pọ̀ jù: a ní láti jẹ́ ".concat(r).concat(t.maximum)
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "Kéré ju: a ní láti jẹ́ pé ".concat(t.origin, " ").concat(i.verb, " ").concat(r).concat(t.minimum, " ").concat(i.unit);
                            return "Kéré ju: a ní láti jẹ́ ".concat(r).concat(t.minimum)
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return 'Ọ̀rọ̀ aṣìṣe: gbọ́dọ̀ bẹ̀rẹ̀ pẹ̀lú "'.concat(t.prefix, '"');
                            if ("ends_with" === t.format) return 'Ọ̀rọ̀ aṣìṣe: gbọ́dọ̀ parí pẹ̀lú "'.concat(t.suffix, '"');
                            if ("includes" === t.format) return 'Ọ̀rọ̀ aṣìṣe: gbọ́dọ̀ ní "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "Ọ̀rọ̀ aṣìṣe: gbọ́dọ̀ bá àpẹẹrẹ mu ".concat(t.pattern);
                            return "Aṣìṣe: ".concat(null != (u = r[t.format]) ? u : t.format);
                        case "not_multiple_of":
                            return "Nọ́mbà aṣìṣe: gbọ́dọ̀ jẹ́ èyà pípín ti ".concat(t.divisor);
                        case "unrecognized_keys":
                            return "Bọtìnì àìmọ̀: ".concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "Bọtìnì aṣìṣe nínú ".concat(t.origin);
                        case "invalid_union":
                        default:
                            return "Ìbáwọlé aṣìṣe";
                        case "invalid_element":
                            return "Iye aṣìṣe nínú ".concat(t.origin)
                    }
                }
            })()
        }
    }, "zhCN", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "字符",
                        verb: "包含"
                    },
                    file: {
                        unit: "字节",
                        verb: "包含"
                    },
                    array: {
                        unit: "项",
                        verb: "包含"
                    },
                    set: {
                        unit: "项",
                        verb: "包含"
                    },
                    map: {
                        unit: "项",
                        verb: "包含"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "输入",
                        email: "电子邮件",
                        url: "URL",
                        emoji: "表情符号",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "ISO日期时间",
                        date: "ISO日期",
                        time: "ISO时间",
                        duration: "ISO时长",
                        ipv4: "IPv4地址",
                        ipv6: "IPv6地址",
                        mac: "MAC地址",
                        cidrv4: "IPv4网段",
                        cidrv6: "IPv6网段",
                        base64: "base64编码字符串",
                        base64url: "base64url编码字符串",
                        json_string: "JSON字符串",
                        e164: "E.164号码",
                        credit_card: "信用卡号",
                        currency_code: "货币代码",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "输入"
                    },
                    i = {
                        nan: "NaN",
                        number: "数字",
                        array: "数组",
                        null: "空值(null)"
                    };
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "无效输入：期望 instanceof ".concat(t.expected, "，实际接收 ").concat(c);
                            return "无效输入：期望 ".concat(n, "，实际接收 ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "无效输入：期望 ".concat(en(t.values[0]));
                            return "无效选项：期望以下之一 ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "数值过大：期望 ".concat(null != (c = t.origin) ? c : "值", " ").concat(r).concat(t.maximum.toString(), " ").concat(null != (u = i.unit) ? u : "个元素");
                            return "数值过大：期望 ".concat(null != (l = t.origin) ? l : "值", " ").concat(r).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "数值过小：期望 ".concat(t.origin, " ").concat(r).concat(t.minimum.toString(), " ").concat(i.unit);
                            return "数值过小：期望 ".concat(t.origin, " ").concat(r).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return '无效字符串：必须以 "'.concat(t.prefix, '" 开头');
                            if ("ends_with" === t.format) return '无效字符串：必须以 "'.concat(t.suffix, '" 结尾');
                            if ("includes" === t.format) return '无效字符串：必须包含 "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "无效字符串：必须满足正则表达式 ".concat(t.pattern);
                            return "无效".concat(null != (s = r[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "无效数字：必须是 ".concat(t.divisor, " 的倍数");
                        case "unrecognized_keys":
                            return "出现未知的键(key): ".concat(_(t.keys, ", "));
                        case "invalid_key":
                            return "".concat(t.origin, " 中的键(key)无效");
                        case "invalid_union":
                        default:
                            return "无效输入";
                        case "invalid_element":
                            return "".concat(t.origin, " 中包含无效值(value)")
                    }
                }
            })()
        }
    }, "zhTW", 0, function() {
        return {
            localeError: (() => {
                let t = {
                    string: {
                        unit: "字元",
                        verb: "擁有"
                    },
                    file: {
                        unit: "位元組",
                        verb: "擁有"
                    },
                    array: {
                        unit: "項目",
                        verb: "擁有"
                    },
                    set: {
                        unit: "項目",
                        verb: "擁有"
                    },
                    map: {
                        unit: "項目",
                        verb: "擁有"
                    }
                };

                function n(n) {
                    var r;
                    return null != (r = t[n]) ? r : null
                }
                let r = {
                        regex: "輸入",
                        email: "郵件地址",
                        url: "URL",
                        emoji: "emoji",
                        uuid: "UUID",
                        uuidv4: "UUIDv4",
                        uuidv6: "UUIDv6",
                        nanoid: "nanoid",
                        guid: "GUID",
                        cuid: "cuid",
                        cuid2: "cuid2",
                        ulid: "ULID",
                        xid: "XID",
                        ksuid: "KSUID",
                        datetime: "ISO 日期時間",
                        date: "ISO 日期",
                        time: "ISO 時間",
                        duration: "ISO 期間",
                        ipv4: "IPv4 位址",
                        ipv6: "IPv6 位址",
                        mac: "MAC 位址",
                        cidrv4: "IPv4 範圍",
                        cidrv6: "IPv6 範圍",
                        base64: "base64 編碼字串",
                        base64url: "base64url 編碼字串",
                        json_string: "JSON 字串",
                        e164: "E.164 數值",
                        credit_card: "信用卡號",
                        currency_code: "貨幣代碼",
                        iban: "IBAN",
                        jwt: "JWT",
                        template_literal: "輸入"
                    },
                    i = {
                        nan: "NaN"
                    };
                return t => {
                    var a, o, c, u, l, s;
                    switch (t.code) {
                        case "invalid_type": {
                            let n = null != (a = i[t.expected]) ? a : t.expected,
                                r = eS(t.input),
                                c = null != (o = i[r]) ? o : r;
                            if (/^[A-Z]/.test(t.expected)) return "無效的輸入值：預期為 instanceof ".concat(t.expected, "，但收到 ").concat(c);
                            return "無效的輸入值：預期為 ".concat(n, "，但收到 ").concat(c)
                        }
                        case "invalid_value":
                            if (1 === t.values.length) return "無效的輸入值：預期為 ".concat(en(t.values[0]));
                            return "無效的選項：預期為以下其中之一 ".concat(_(t.values, "|"));
                        case "too_big": {
                            let r = t.inclusive ? "<=" : "<",
                                i = n(t.origin);
                            if (i) return "數值過大：預期 ".concat(null != (c = t.origin) ? c : "值", " 應為 ").concat(r).concat(t.maximum.toString(), " ").concat(null != (u = i.unit) ? u : "個元素");
                            return "數值過大：預期 ".concat(null != (l = t.origin) ? l : "值", " 應為 ").concat(r).concat(t.maximum.toString())
                        }
                        case "too_small": {
                            let r = t.inclusive ? ">=" : ">",
                                i = n(t.origin);
                            if (i) return "數值過小：預期 ".concat(t.origin, " 應為 ").concat(r).concat(t.minimum.toString(), " ").concat(i.unit);
                            return "數值過小：預期 ".concat(t.origin, " 應為 ").concat(r).concat(t.minimum.toString())
                        }
                        case "invalid_format":
                            if ("starts_with" === t.format) return '無效的字串：必須以 "'.concat(t.prefix, '" 開頭');
                            if ("ends_with" === t.format) return '無效的字串：必須以 "'.concat(t.suffix, '" 結尾');
                            if ("includes" === t.format) return '無效的字串：必須包含 "'.concat(t.includes, '"');
                            if ("regex" === t.format) return "無效的字串：必須符合格式 ".concat(t.pattern);
                            return "無效的 ".concat(null != (s = r[t.format]) ? s : t.format);
                        case "not_multiple_of":
                            return "無效的數字：必須為 ".concat(t.divisor, " 的倍數");
                        case "unrecognized_keys":
                            return "無法識別的鍵值".concat(t.keys.length > 1 ? "們" : "", "：").concat(_(t.keys, "、"));
                        case "invalid_key":
                            return "".concat(t.origin, " 中有無效的鍵值");
                        case "invalid_union":
                        default:
                            return "無效的輸入值";
                        case "invalid_element":
                            return "".concat(t.origin, " 中有無效的值")
                    }
                }
            })()
        }
    }], 932471);
    var tQ = t.i(932471);
    t.s([], 745980);
    var t0 = t.i(745980);
    t.s([], 448274), t.i(448274), t.i(655831);
    let t4 = {
            get: function() {
                let t = this._zod;
                return null != t.message || (t.message = JSON.stringify(t.def, I, 2)), t.message
            },
            set: function(t) {
                this._zod.message = t
            },
            enumerable: !0,
            configurable: !0
        },
        t1 = {
            value: void 0,
            enumerable: !1
        },
        t6 = new WeakSet([Object.prototype, Error.prototype]),
        t2 = (t, n) => {
            t.name = "$ZodError", t1.value = n, Object.defineProperty(t, "issues", t1), t1.value = void 0, Object.defineProperty(t, "message", t4);
            let r = Object.getPrototypeOf(t);
            t6.has(r) || (t6.add(r), Object.defineProperty(r, "toString", {
                configurable: !0,
                enumerable: !1,
                get() {
                    let t = () => this.message;
                    return Object.defineProperty(this, "toString", {
                        value: t,
                        configurable: !0,
                        writable: !0
                    }), t
                },
                set(t) {
                    Object.defineProperty(this, "toString", {
                        value: t,
                        configurable: !0,
                        writable: !0
                    })
                }
            }))
        },
        t5 = c("$ZodError", t2),
        t3 = c("$ZodError", t2, void 0, {
            Parent: Error
        });

    function t9(t) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : t => t.message,
            r = {},
            i = [];
        for (let c of t.issues)
            if (c.path.length > 0) {
                var a, o;
                (a = c.path[0], o = () => [], !Object.prototype.hasOwnProperty.call(r, a) && ("__proto__" === a ? Object.defineProperty(r, a, {
                    value: o(),
                    writable: !0,
                    enumerable: !0,
                    configurable: !0
                }) : r[a] = o()), r[a]).push(n(c))
            } else i.push(n(c));
        return {
            formErrors: i,
            fieldErrors: r
        }
    }

    function t8(t) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : t => t.message,
            r = {
                _errors: []
            },
            i = function(t) {
                let a = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [];
                for (let o of t.issues)
                    if ("invalid_union" === o.code && o.errors.length) o.errors.map(t => i({
                        issues: t
                    }, [...a, ...o.path]));
                    else if ("invalid_key" === o.code) i({
                    issues: o.issues
                }, [...a, ...o.path]);
                else if ("invalid_element" === o.code) i({
                    issues: o.issues
                }, [...a, ...o.path]);
                else {
                    let t = [...a, ...o.path];
                    if (0 === t.length) r._errors.push(n(o));
                    else {
                        let i = r,
                            a = 0;
                        for (; a < t.length;) {
                            let r = t[a],
                                c = a === t.length - 1;
                            if ("_errors" === r) {
                                c && i._errors.push(n(o)), a++;
                                continue
                            }
                            Object.prototype.hasOwnProperty.call(i, r) || Object.defineProperty(i, r, {
                                value: {
                                    _errors: []
                                },
                                enumerable: !0,
                                writable: !0,
                                configurable: !0
                            });
                            let u = i[r];
                            c && u._errors.push(n(o)), i = u, a++
                        }
                    }
                }
            };
        return i(t), r
    }

    function t7(t) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : t => t.message,
            r = {
                errors: []
            },
            i = function(t) {
                var a;
                let o = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [];
                for (let c of t.issues)
                    if ("invalid_union" === c.code && c.errors.length) c.errors.map(t => i({
                        issues: t
                    }, [...o, ...c.path]));
                    else if ("invalid_key" === c.code) i({
                    issues: c.issues
                }, [...o, ...c.path]);
                else if ("invalid_element" === c.code) i({
                    issues: c.issues
                }, [...o, ...c.path]);
                else {
                    let t = [...o, ...c.path];
                    if (0 === t.length) {
                        r.errors.push(n(c));
                        continue
                    }
                    let i = r,
                        u = 0;
                    for (; u < t.length;) {
                        let r = t[u],
                            o = u === t.length - 1;
                        "string" == typeof r ? (null != i.properties || (i.properties = {}), Object.prototype.hasOwnProperty.call(i.properties, r) || Object.defineProperty(i.properties, r, {
                            value: {
                                errors: []
                            },
                            enumerable: !0,
                            writable: !0,
                            configurable: !0
                        }), i = i.properties[r]) : (null != i.items || (i.items = []), null != (a = i.items)[r] || (a[r] = {
                            errors: []
                        }), i = i.items[r]), o && i.errors.push(n(c)), u++
                    }
                }
            };
        return i(t), r
    }

    function ne(t) {
        let n = [];
        for (let r of t.map(t => "object" == typeof t ? t.key : t)) "number" == typeof r ? n.push("[".concat(r, "]")) : "symbol" == typeof r ? n.push("[".concat(JSON.stringify(String(r)), "]")) : /[^\w$]/.test(r) ? n.push("[".concat(JSON.stringify(r), "]")) : (n.length && n.push("."), n.push(r));
        return n.join("")
    }

    function nt(t) {
        let n = [];
        for (let i of [...t.issues].sort((t, n) => {
                var r, i;
                return (null != (r = t.path) ? r : []).length - (null != (i = n.path) ? i : []).length
            })) {
            var r;
            n.push("✖ ".concat(i.message)), (null == (r = i.path) ? void 0 : r.length) && n.push("  → at ".concat(ne(i.path)))
        }
        return n.join("\n")
    }

    function nn(t, n) {
        var r;
        return {
            callee: null != (r = null == n ? void 0 : n.callee) ? r : t,
            Err: null == n ? void 0 : n.Err
        }
    }
    t.s(["$ZodError", 0, t5, "$ZodRealError", 0, t3, "flattenError", 0, t9, "formatError", 0, t8, "prettifyError", 0, nt, "toDotPath", 0, ne, "treeifyError", 0, t7], 161105);
    let nr = t => {
            let n = (r, i, a, o) => {
                let c = a ? {
                        ...a,
                        async: !1
                    } : {
                        async: !1
                    },
                    u = r._zod.run({
                        value: i,
                        issues: []
                    }, c);
                if (u instanceof Promise) throw new l;
                if (u.issues.length) {
                    var s, d;
                    let r = new(null != (s = null == o ? void 0 : o.Err) ? s : t)(u.issues.map(t => e_(t, c, m())));
                    throw B(r, null != (d = null == o ? void 0 : o.callee) ? d : n), r
                }
                return u.value
            };
            return n
        },
        ni = nr(t3),
        na = t => {
            let n = async (r, i, a, o) => {
                let c = a ? {
                        ...a,
                        async: !0
                    } : {
                        async: !0
                    },
                    u = r._zod.run({
                        value: i,
                        issues: []
                    }, c);
                if (u instanceof Promise && (u = await u), u.issues.length) {
                    var l, s;
                    let r = new(null != (l = null == o ? void 0 : o.Err) ? l : t)(u.issues.map(t => e_(t, c, m())));
                    throw B(r, null != (s = null == o ? void 0 : o.callee) ? s : n), r
                }
                return u.value
            };
            return n
        },
        no = na(t3),
        nc = t => (n, r, i) => {
            let a = i ? {
                    ...i,
                    async: !1
                } : {
                    async: !1
                },
                o = n._zod.run({
                    value: r,
                    issues: []
                }, a);
            if (o instanceof Promise) throw new l;
            return o.issues.length ? nl(t, o.issues, a) : {
                success: !0,
                data: o.value
            }
        },
        nu = nc(t3);

    function nl(t, n, r) {
        let i;
        return {
            success: !1,
            get error() {
                return i || (i = new t(n.map(t => e_(t, r, m()))), n = void 0, r = void 0), i
            },
            set error(e) {
                i = e, n = void 0, r = void 0
            }
        }
    }
    let ns = t => async (n, r, i) => {
        let a = i ? {
                ...i,
                async: !0
            } : {
                async: !0
            },
            o = n._zod.run({
                value: r,
                issues: []
            }, a);
        return o instanceof Promise && (o = await o), o.issues.length ? nl(t, o.issues, a) : {
            success: !0,
            data: o.value
        }
    }, nd = ns(t3), nm = Symbol.for("zod.compile.invalid"), nf = Symbol.for("zod.compile.fallback"), nv = (t, n, r) => {
        let i = t._zod.bag.validator;
        if (void 0 !== i) {
            if (i(n) !== nm) return !0;
            if (!0 === i.definite && void 0 === r) return !1
        }
        var a = t,
            o = n,
            c = r;
        let u, s = c ? {
                ...c,
                async: !1,
                abortEarly: !0
            } : {
                async: !1,
                abortEarly: !0
            },
            d = a._zod.bag.fallbackRun;
        if (d ? (s[nf] = !0, u = d({
                value: o,
                issues: []
            }, s)) : u = a._zod.run({
                value: o,
                issues: []
            }, s), u instanceof Promise) throw new l;
        return 0 === u.issues.length
    }, np = async (t, n, r) => {
        let i = r ? {
                ...r,
                async: !0,
                abortEarly: !0
            } : {
                async: !0,
                abortEarly: !0
            },
            a = t._zod.run({
                value: n,
                issues: []
            }, i);
        return a instanceof Promise && (a = await a), 0 === a.issues.length
    }, ng = t => {
        let n = nr(t),
            r = (t, i, a, o) => n(t, i, a ? {
                ...a,
                direction: "backward"
            } : {
                direction: "backward"
            }, nn(r, o));
        return r
    }, nh = ng(t3), nb = t => {
        let n = nr(t),
            r = (t, i, a, o) => n(t, i, a, nn(r, o));
        return r
    }, ny = nb(t3), n_ = t => {
        let n = na(t),
            r = async (t, i, a, o) => {
                let c = a ? {
                    ...a,
                    direction: "backward"
                } : {
                    direction: "backward"
                };
                return await n(t, i, c, nn(r, o))
            };
        return r
    }, nI = n_(t3), nk = t => {
        let n = na(t),
            r = async (t, i, a, o) => await n(t, i, a, nn(r, o));
        return r
    }, nw = nk(t3), nx = t => (n, r, i) => {
        let a = i ? {
            ...i,
            direction: "backward"
        } : {
            direction: "backward"
        };
        return nc(t)(n, r, a)
    }, nS = nx(t3), nz = t => (n, r, i) => nc(t)(n, r, i), nA = nz(t3), nU = t => async (n, r, i) => {
        let a = i ? {
            ...i,
            direction: "backward"
        } : {
            direction: "backward"
        };
        return ns(t)(n, r, a)
    }, nP = nU(t3), nO = t => async (n, r, i) => ns(t)(n, r, i), nN = nO(t3);
    t.s(["_decode", 0, nb, "_decodeAsync", 0, nk, "_encode", 0, ng, "_encodeAsync", 0, n_, "_parse", 0, nr, "_parseAsync", 0, na, "_safeDecode", 0, nz, "_safeDecodeAsync", 0, nO, "_safeEncode", 0, nx, "_safeEncodeAsync", 0, nU, "_safeParse", 0, nc, "_safeParseAsync", 0, ns, "decode", 0, ny, "decodeAsync", 0, nw, "encode", 0, nh, "encodeAsync", 0, nI, "parse", 0, ni, "parseAsync", 0, no, "safeDecode", 0, nA, "safeDecodeAsync", 0, nN, "safeEncode", 0, nS, "safeEncodeAsync", 0, nP, "safeParse", 0, nu, "safeParseAsync", 0, nd, "validate", 0, nv, "validateAsync", 0, np], 455162), t.i(455162), t.i(161105);
    let nD = c("$ZodCheck", (t, n) => {
            var r;
            null != t._zod || (t._zod = {}), t._zod.def = n, null != (r = t._zod).onattach || (r.onattach = [])
        }),
        nZ = t => {
            let n = t.value;
            return !x(n) && void 0 !== n.size
        },
        nj = t => {
            let n = t.value;
            return !x(n) && void 0 !== n.length
        },
        nT = {
            number: "number",
            bigint: "bigint",
            object: "date"
        },
        nE = c("$ZodCheckLessThan", (t, n) => {
            nD.init(t, n);
            let r = nT[typeof n.value];
            t._zod.check = i => {
                var a;
                (n.inclusive ? i.value <= n.value : i.value < n.value) || i.issues.push({
                    origin: null != (a = nT[typeof i.value]) ? a : r,
                    code: "too_big",
                    maximum: "object" == typeof n.value ? n.value.getTime() : n.value,
                    input: i.value,
                    inclusive: n.inclusive,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        nC = c("$ZodCheckGreaterThan", (t, n) => {
            nD.init(t, n);
            let r = nT[typeof n.value];
            t._zod.check = i => {
                var a;
                (n.inclusive ? i.value >= n.value : i.value > n.value) || i.issues.push({
                    origin: null != (a = nT[typeof i.value]) ? a : r,
                    code: "too_small",
                    minimum: "object" == typeof n.value ? n.value.getTime() : n.value,
                    input: i.value,
                    inclusive: n.inclusive,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        n$ = c("$ZodCheckMultipleOf", (t, n) => {
            nD.init(t, n), t._zod.check = r => {
                if (typeof r.value != typeof n.value) throw Error("Cannot mix number and bigint in multiple_of check.");
                ("bigint" == typeof r.value ? n.value !== BigInt(0) && r.value % n.value === BigInt(0) : 0 === z(r.value, n.value)) || r.issues.push({
                    origin: typeof r.value,
                    code: "not_multiple_of",
                    divisor: n.value,
                    input: r.value,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        nR = c("$ZodCheckNumberFormat", (t, n) => {
            var r;
            nD.init(t, n), n.format = n.format || "float64";
            let i = null == (r = n.format) ? void 0 : r.includes("int"),
                a = i ? "int" : "number",
                [o, c] = ei[n.format];
            t._zod.check = r => {
                let u = r.value;
                if (i) {
                    if (!Number.isInteger(u)) return void r.issues.push({
                        expected: a,
                        format: n.format,
                        code: "invalid_type",
                        continue: !1,
                        input: u,
                        inst: t
                    });
                    if (!Number.isSafeInteger(u)) return void(u > 0 ? r.issues.push({
                        input: u,
                        code: "too_big",
                        maximum: Number.MAX_SAFE_INTEGER,
                        note: "Integers must be within the safe integer range.",
                        inst: t,
                        origin: a,
                        inclusive: !0,
                        continue: !n.abort
                    }) : r.issues.push({
                        input: u,
                        code: "too_small",
                        minimum: Number.MIN_SAFE_INTEGER,
                        note: "Integers must be within the safe integer range.",
                        inst: t,
                        origin: a,
                        inclusive: !0,
                        continue: !n.abort
                    }))
                }
                u < o && r.issues.push({
                    origin: "number",
                    input: u,
                    code: "too_small",
                    minimum: o,
                    inclusive: !0,
                    inst: t,
                    continue: !n.abort
                }), u > c && r.issues.push({
                    origin: "number",
                    input: u,
                    code: "too_big",
                    maximum: c,
                    inclusive: !0,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        nL = c("$ZodCheckBigIntFormat", (t, n) => {
            nD.init(t, n);
            let [r, i] = ea[n.format];
            t._zod.check = a => {
                let o = a.value;
                o < r && a.issues.push({
                    origin: "bigint",
                    input: o,
                    code: "too_small",
                    minimum: r,
                    inclusive: !0,
                    inst: t,
                    continue: !n.abort
                }), o > i && a.issues.push({
                    origin: "bigint",
                    input: o,
                    code: "too_big",
                    maximum: i,
                    inclusive: !0,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        nG = c("$ZodCheckMaxSize", (t, n) => {
            var r;
            nD.init(t, n), null != (r = t._zod.def).when || (r.when = nZ), t._zod.check = r => {
                let i = r.value;
                i.size <= n.maximum || r.issues.push({
                    origin: eI(i),
                    code: "too_big",
                    maximum: n.maximum,
                    inclusive: !0,
                    input: i,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        nM = c("$ZodCheckMinSize", (t, n) => {
            var r;
            nD.init(t, n), null != (r = t._zod.def).when || (r.when = nZ), t._zod.check = r => {
                let i = r.value;
                i.size >= n.minimum || r.issues.push({
                    origin: eI(i),
                    code: "too_small",
                    minimum: n.minimum,
                    inclusive: !0,
                    input: i,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        nB = c("$ZodCheckSizeEquals", (t, n) => {
            var r;
            nD.init(t, n), null != (r = t._zod.def).when || (r.when = nZ), t._zod.check = r => {
                let i = r.value,
                    a = i.size;
                if (a === n.size) return;
                let o = a > n.size;
                r.issues.push({
                    origin: eI(i),
                    ...o ? {
                        code: "too_big",
                        maximum: n.size
                    } : {
                        code: "too_small",
                        minimum: n.size
                    },
                    inclusive: !0,
                    exact: !0,
                    input: r.value,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        nJ = c("$ZodCheckMaxLength", (t, n) => {
            var r;
            nD.init(t, n), null != (r = t._zod.def).when || (r.when = nj), t._zod.check = r => {
                let i = r.value,
                    a = i.length;
                if (("string" == typeof i && a > n.maximum ? ew(i) : a) <= n.maximum) return;
                let o = ex(i);
                r.issues.push({
                    origin: o,
                    code: "too_big",
                    maximum: n.maximum,
                    inclusive: !0,
                    input: i,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        nV = c("$ZodCheckMinLength", (t, n) => {
            var r;
            nD.init(t, n), null != (r = t._zod.def).when || (r.when = nj), t._zod.check = r => {
                let i = r.value,
                    a = i.length;
                if (("string" == typeof i && a >= n.minimum && a < 2 * n.minimum ? ew(i) : a) >= n.minimum) return;
                let o = ex(i);
                r.issues.push({
                    origin: o,
                    code: "too_small",
                    minimum: n.minimum,
                    inclusive: !0,
                    input: i,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        nF = c("$ZodCheckLengthEquals", (t, n) => {
            var r;
            nD.init(t, n), null != (r = t._zod.def).when || (r.when = nj), t._zod.check = r => {
                let i = r.value,
                    a = i.length,
                    o = "string" == typeof i && a >= n.length && a <= 2 * n.length ? ew(i) : a;
                if (o === n.length) return;
                let c = ex(i),
                    u = o > n.length;
                r.issues.push({
                    origin: c,
                    ...u ? {
                        code: "too_big",
                        maximum: n.length
                    } : {
                        code: "too_small",
                        minimum: n.length
                    },
                    inclusive: !0,
                    exact: !0,
                    input: r.value,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        nq = c("$ZodCheckStringFormat", (t, n) => {
            var r, i;
            nD.init(t, n), n.pattern ? null != (r = t._zod).check || (r.check = r => {
                n.pattern.lastIndex = 0, n.pattern.test(r.value) || r.issues.push({
                    origin: "string",
                    code: "invalid_format",
                    format: n.format,
                    input: r.value,
                    ...n.pattern ? {
                        pattern: n.pattern.toString()
                    } : {},
                    inst: t,
                    continue: !n.abort
                })
            }) : null != (i = t._zod).check || (i.check = () => {})
        }),
        nW = c("$ZodCheckRegex", (t, n) => {
            nq.init(t, n), t._zod.check = r => {
                n.pattern.lastIndex = 0, n.pattern.test(r.value) || r.issues.push({
                    origin: "string",
                    code: "invalid_format",
                    format: "regex",
                    input: r.value,
                    pattern: n.pattern.toString(),
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        nK = c("$ZodCheckLowerCase", (t, n) => {
            null != n.pattern || (n.pattern = tU), nq.init(t, n)
        }),
        nX = c("$ZodCheckUpperCase", (t, n) => {
            null != n.pattern || (n.pattern = tP), nq.init(t, n)
        }),
        nH = c("$ZodCheckIncludes", (t, n) => {
            nD.init(t, n);
            let r = Y(n.includes),
                i = new RegExp("number" == typeof n.position ? "^.{".concat(n.position, ",}").concat(r) : r);
            n.pattern = i, t._zod.check = r => {
                r.value.includes(n.includes, n.position) || r.issues.push({
                    origin: "string",
                    code: "invalid_format",
                    format: "includes",
                    includes: n.includes,
                    input: r.value,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        nY = c("$ZodCheckStartsWith", (t, n) => {
            nD.init(t, n);
            let r = new RegExp("^".concat(Y(n.prefix), ".*"));
            null != n.pattern || (n.pattern = r), t._zod.check = r => {
                r.value.startsWith(n.prefix) || r.issues.push({
                    origin: "string",
                    code: "invalid_format",
                    format: "starts_with",
                    prefix: n.prefix,
                    input: r.value,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        nQ = c("$ZodCheckEndsWith", (t, n) => {
            nD.init(t, n);
            let r = new RegExp(".*".concat(Y(n.suffix), "$"));
            null != n.pattern || (n.pattern = r), t._zod.check = r => {
                r.value.endsWith(n.suffix) || r.issues.push({
                    origin: "string",
                    code: "invalid_format",
                    format: "ends_with",
                    suffix: n.suffix,
                    input: r.value,
                    inst: t,
                    continue: !n.abort
                })
            }
        });

    function n0(t, n, r) {
        t.issues.length && n.issues.push(...eh(r, t.issues))
    }
    let n4 = c("$ZodCheckProperty", (t, n) => {
            nD.init(t, n), t._zod.check = t => {
                let r = n.schema._zod.run({
                    value: t.value[n.property],
                    issues: []
                }, {});
                if (r instanceof Promise) return r.then(r => n0(r, t, n.property));
                n0(r, t, n.property)
            }
        }),
        n1 = c("$ZodCheckProperties", (t, n) => {
            let r;
            nD.init(t, n), eC(t, Symbol.iterator, function*() {
                yield t
            }), t._zod.check = i => {
                let a;
                if (null == i.value) return void i.issues.push({
                    expected: "object",
                    code: "invalid_type",
                    input: i.value,
                    inst: t
                });
                null != r || (r = Reflect.ownKeys(n.shape).map(t => [t, n.shape[t]]));
                let o = i.value;
                for (let [t, n] of r) {
                    let r = n._zod.run({
                        value: o[t],
                        issues: []
                    }, {});
                    r instanceof Promise ? (null != a || (a = []), a.push(r.then(n => n0(n, i, t)))) : n0(r, i, t)
                }
                if (a) return Promise.all(a).then(() => void 0)
            }
        }),
        n6 = c("$ZodCheckMimeType", (t, n) => {
            nD.init(t, n);
            let r = new Set(n.mime);
            t._zod.check = i => {
                r.has(i.value.type) || i.issues.push({
                    code: "invalid_value",
                    values: n.mime,
                    input: i.value.type,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        n2 = c("$ZodCheckOverwrite", (t, n) => {
            nD.init(t, n), t._zod.check = t => {
                t.value = n.tx(t.value)
            }
        });
    t.s(["$ZodCheck", 0, nD, "$ZodCheckBigIntFormat", 0, nL, "$ZodCheckEndsWith", 0, nQ, "$ZodCheckGreaterThan", 0, nC, "$ZodCheckIncludes", 0, nH, "$ZodCheckLengthEquals", 0, nF, "$ZodCheckLessThan", 0, nE, "$ZodCheckLowerCase", 0, nK, "$ZodCheckMaxLength", 0, nJ, "$ZodCheckMaxSize", 0, nG, "$ZodCheckMimeType", 0, n6, "$ZodCheckMinLength", 0, nV, "$ZodCheckMinSize", 0, nM, "$ZodCheckMultipleOf", 0, n$, "$ZodCheckNumberFormat", 0, nR, "$ZodCheckOverwrite", 0, n2, "$ZodCheckProperties", 0, n1, "$ZodCheckProperty", 0, n4, "$ZodCheckRegex", 0, nW, "$ZodCheckSizeEquals", 0, nB, "$ZodCheckStartsWith", 0, nY, "$ZodCheckStringFormat", 0, nq, "$ZodCheckUpperCase", 0, nX], 402171);
    class n5 {
        indented(t) {
            this.indent += 1;
            try {
                t(this)
            } finally {
                this.indent -= 1
            }
        }
        write(t) {
            if ("function" == typeof t) {
                t(this, {
                    execution: "sync"
                }), t(this, {
                    execution: "async"
                });
                return
            }
            let n = t.split("\n").filter(t => t),
                r = Math.min(...n.map(t => t.length - t.trimStart().length));
            for (let t of n.map(t => t.slice(r)).map(t => " ".repeat(2 * this.indent) + t)) this.content.push(t)
        }
        compile() {
            var t;
            let n = Function,
                r = null != (t = null === this || void 0 === this ? void 0 : this.content) ? t : [""];
            return new n(...Object.keys(this.closed), "return function (".concat(this.args.join(", "), ") {\n").concat(r.join("\n"), "\n};"))(...Object.values(this.closed))
        }
        constructor(t = [], n = {}) {
            this.content = [], this.indent = 0, this.args = t, this.closed = n
        }
    }
    t.s(["Doc", 0, n5], 990010);
    let n3 = {
        major: 4,
        minor: 6,
        patch: 5
    };
    t.s(["version", 0, n3], 437808);
    let n9 = c("$ZodType", (t, n) => {
            var r, i;
            null != t || (t = {}), t._zod.def = n, t._zod.bag = t._zod.bag || {}, t._zod.version = n3;
            let a = t._zod.def.checks,
                o = t._zod.traits.has("$ZodCheck") ? [t, ...null != a ? a : []] : (null == a ? void 0 : a.length) ? [...a] : [];
            for (let n of o)
                for (let r of n._zod.onattach) r(t);
            if (0 === o.length) null != (r = t._zod).deferred || (r.deferred = []), null == (i = t._zod.deferred) || i.push(() => {
                t._zod.run = t._zod.parse
            });
            else {
                let n = (n, r, i) => {
                        let a;
                        if (n.memo) return n;
                        let o = ep(n);
                        for (let c of r) {
                            if (c._zod.def.when) {
                                if (eg(n) || !c._zod.def.when(n)) continue
                            } else if (o) continue;
                            let r = n.issues.length,
                                u = c._zod.check(n);
                            if (u instanceof Promise && (null == i ? void 0 : i.async) === !1) throw new l;
                            if (a || u instanceof Promise) a = (null != a ? a : Promise.resolve()).then(async () => {
                                await u, n.issues.length !== r && (ey(n.issues, r, t), o || (o = ep(n, r)))
                            });
                            else {
                                if (n.issues.length === r) continue;
                                ey(n.issues, r, t), o || (o = ep(n, r))
                            }
                        }
                        return a ? a.then(() => n) : n
                    },
                    r = (r, i, a) => {
                        if (ep(r)) return r.aborted = !0, r;
                        let c = n(i, o, a);
                        if (c instanceof Promise) {
                            if (!1 === a.async) throw new l;
                            return c.then(n => t._zod.parse(n, a))
                        }
                        return t._zod.parse(c, a)
                    };
                t._zod.run = (i, a) => {
                    if (a.skipChecks) return t._zod.parse(i, a);
                    if ("backward" === a.direction) {
                        let n = t._zod.parse({
                            value: i.value,
                            issues: []
                        }, {
                            ...a,
                            skipChecks: !0
                        });
                        return n instanceof Promise ? n.then(t => r(t, i, a)) : r(n, i, a)
                    }
                    let c = t._zod.parse(i, a);
                    if (c instanceof Promise) {
                        if (!1 === a.async) throw new l;
                        return c.then(t => n(t, o, a))
                    }
                    return n(c, o, a)
                }
            }
        }, {
            get "~standard"() {
                return eC(this, "~standard", re(this))
            },
            set "~standard"(value) {
                eE(this, "~standard", value)
            }
        }),
        n8 = (t, n) => t.issues.length ? {
            issues: t.issues.map(t => e_(t, n, m()))
        } : {
            value: t.value
        };
    async function n7(t, n) {
        let r = {
            async: !0
        };
        return n8(await t._zod.run({
            value: n,
            issues: []
        }, r), r)
    }

    function re(t) {
        return {
            validate: n => {
                let r = {
                    async: !1
                };
                try {
                    let i = t._zod.run({
                        value: n,
                        issues: []
                    }, r);
                    if (!(i instanceof Promise)) return n8(i, r)
                } catch (t) {}
                return n7(t, n)
            },
            vendor: "zod",
            version: 1
        }
    }
    let rt = c("$ZodString", (t, n) => {
            var r;
            n9.init(t, n), t._zod.pattern = null != (r = n.pattern) ? r : t_, t._zod.parse = (r, i) => {
                if (n.coerce) try {
                    r.value = String(r.value)
                } catch (t) {}
                return "string" == typeof r.value || r.issues.push({
                    expected: "string",
                    code: "invalid_type",
                    input: r.value,
                    inst: t
                }), r
            }
        }),
        rn = c("$ZodStringFormat", (t, n) => {
            nq.init(t, n), rt.init(t, n)
        }),
        rr = c("$ZodGUID", (t, n) => {
            null != n.pattern || (n.pattern = e6), rn.init(t, n)
        }),
        ri = c("$ZodUUID", (t, n) => {
            if (n.version) {
                let t = {
                    v1: 1,
                    v2: 2,
                    v3: 3,
                    v4: 4,
                    v5: 5,
                    v6: 6,
                    v7: 7,
                    v8: 8
                } [n.version];
                if (void 0 === t) throw Error('Invalid UUID version: "'.concat(n.version, '"'));
                null != n.pattern || (n.pattern = e2(t))
            } else null != n.pattern || (n.pattern = e2());
            rn.init(t, n)
        }),
        ra = c("$ZodEmail", (t, n) => {
            null != n.pattern || (n.pattern = e8), rn.init(t, n)
        });

    function ro(t) {
        try {
            if ("u" > typeof URL && "function" == typeof URL.canParse) return URL.canParse(t);
            return new URL(t), !0
        } catch (t) {
            return !1
        }
    }

    function rc(t, n) {
        return "normalize" in n || "hostname" in n || "protocol" in n ? ru(t, n) : ro(t) || 2
    }

    function ru(t, n) {
        var r, i;
        if (!n.normalize && (null == (r = n.protocol) ? void 0 : r.source) === ts.source && !/^https?:\/\//i.test(t)) return 1;
        try {
            if ("u" > typeof URL) {
                let n = URL;
                if ("function" == typeof n.parse) return null != (i = n.parse(t)) ? i : 2
            }
            return new URL(t)
        } catch (t) {
            return 2
        }
    }
    let rl = /[\t\n\r]/g;

    function rs(t) {
        return t.replace(rl, "")
    }

    function rd(t, n) {
        return n.lastIndex = 0, n.test(t.hostname)
    }

    function rm(t, n) {
        return n.lastIndex = 0, n.test(t.protocol.endsWith(":") ? t.protocol.slice(0, -1) : t.protocol)
    }
    let rf = c("$ZodURL", (t, n) => {
            rn.init(t, n), t._zod.check = r => {
                try {
                    let i = r.value.trim(),
                        a = rc(i, n);
                    if (1 === a) return void r.issues.push({
                        code: "invalid_format",
                        format: "url",
                        note: "Invalid URL format",
                        input: r.value,
                        inst: t,
                        continue: !n.abort
                    });
                    if (2 === a) return void r.issues.push({
                        code: "invalid_format",
                        format: "url",
                        input: r.value,
                        inst: t,
                        continue: !n.abort
                    });
                    if (!0 === a) {
                        r.value = rs(i);
                        return
                    }
                    n.hostname && !rd(a, n.hostname) && r.issues.push({
                        code: "invalid_format",
                        format: "url",
                        note: "Invalid hostname",
                        pattern: n.hostname.source,
                        input: r.value,
                        inst: t,
                        continue: !n.abort
                    }), n.protocol && !rm(a, n.protocol) && r.issues.push({
                        code: "invalid_format",
                        format: "url",
                        note: "Invalid protocol",
                        pattern: n.protocol.source,
                        input: r.value,
                        inst: t,
                        continue: !n.abort
                    }), r.value = n.normalize ? a.href : rs(i);
                    return
                } catch (i) {
                    r.issues.push({
                        code: "invalid_format",
                        format: "url",
                        input: r.value,
                        inst: t,
                        continue: !n.abort
                    })
                }
            }
        }),
        rv = c("$ZodEmoji", (t, n) => {
            null != n.pattern || (n.pattern = te()), rn.init(t, n)
        }),
        rp = c("$ZodNanoID", (t, n) => {
            if (void 0 !== n.length && (!Number.isInteger(n.length) || n.length < 1)) throw Error("Invalid nanoid length: ".concat(n.length));
            null != n.pattern || (n.pattern = void 0 === n.length ? e0 : e4(n.length)), rn.init(t, n)
        }),
        rg = c("$ZodCUID", (t, n) => {
            null != n.pattern || (n.pattern = eK), rn.init(t, n)
        }),
        rh = c("$ZodCUID2", (t, n) => {
            null != n.pattern || (n.pattern = eX), rn.init(t, n)
        }),
        rb = c("$ZodULID", (t, n) => {
            null != n.pattern || (n.pattern = eH), rn.init(t, n)
        }),
        ry = c("$ZodXID", (t, n) => {
            null != n.pattern || (n.pattern = eY), rn.init(t, n)
        }),
        r_ = c("$ZodKSUID", (t, n) => {
            null != n.pattern || (n.pattern = eQ), rn.init(t, n)
        }),
        rI = c("$ZodISODateTime", (t, n) => {
            null != n.pattern || (n.pattern = ty(n)), rn.init(t, n)
        }),
        rk = c("$ZodISODate", (t, n) => {
            null != n.pattern || (n.pattern = tg), rn.init(t, n)
        }),
        rw = c("$ZodISOTime", (t, n) => {
            null != n.pattern || (n.pattern = tb(n)), rn.init(t, n)
        }),
        rx = c("$ZodISODuration", (t, n) => {
            null != n.pattern || (n.pattern = e1), rn.init(t, n)
        }),
        rS = c("$ZodIPv4", (t, n) => {
            null != n.pattern || (n.pattern = tt), rn.init(t, n)
        }),
        rz = /^[0-9a-fA-F:.]+$/;

    function rA(t) {
        return !!rz.test(t) && ro("http://[".concat(t, "]"))
    }
    let rU = c("$ZodIPv6", (t, n) => {
            null != n.pattern || (n.pattern = tn), rn.init(t, n), t._zod.check = r => {
                rA(r.value) || r.issues.push({
                    code: "invalid_format",
                    format: "ipv6",
                    input: r.value,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        rP = c("$ZodMAC", (t, n) => {
            null != n.pattern || (n.pattern = tr(n.delimiter)), rn.init(t, n)
        }),
        rO = c("$ZodCIDRv4", (t, n) => {
            null != n.pattern || (n.pattern = ti), rn.init(t, n)
        });

    function rN(t) {
        let n = t.split("/");
        if (2 !== n.length) return !1;
        let [r, i] = n;
        if (!i) return !1;
        let a = Number(i);
        return "".concat(a) === i && !(a < 0) && !(a > 128) && rA(r)
    }
    let rD = c("$ZodCIDRv6", (t, n) => {
        null != n.pattern || (n.pattern = ta), rn.init(t, n), t._zod.check = r => {
            rN(r.value) || r.issues.push({
                code: "invalid_format",
                format: "cidrv6",
                input: r.value,
                inst: t,
                continue: !n.abort
            })
        }
    });

    function rZ(t) {
        if ("" === t) return !0;
        if (/\s/.test(t) || t.length % 4 != 0) return !1;
        try {
            return atob(t), !0
        } catch (t) {
            return !1
        }
    }
    let rj = /^[0-9a-zA-Z+/]*={0,2}$/,
        rT = c("$ZodBase64", (t, n) => {
            null != n.pattern || (n.pattern = rj), rn.init(t, n), t._zod.check = r => {
                rZ(r.value) || r.issues.push({
                    code: "invalid_format",
                    format: "base64",
                    input: r.value,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        rE = /^[A-Za-z0-9_-]*$/;

    function rC(t) {
        if (!rE.test(t)) return !1;
        let n = t.replace(/[-_]/g, t => "-" === t ? "+" : "/");
        return rZ(n.padEnd(4 * Math.ceil(n.length / 4), "="))
    }
    let r$ = c("$ZodBase64URL", (t, n) => {
            null != n.pattern || (n.pattern = rE), rn.init(t, n), t._zod.check = r => {
                rC(r.value) || r.issues.push({
                    code: "invalid_format",
                    format: "base64url",
                    input: r.value,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        rR = c("$ZodE164", (t, n) => {
            null != n.pattern || (n.pattern = td), rn.init(t, n)
        }),
        rL = /[- ]/g;

    function rG(t) {
        return !!tm.test(t) && function(t) {
            let n = t.length,
                r = 1,
                i = 0;
            for (; n;) {
                let a = t.charCodeAt(--n) - 48;
                r ^= 1, i += r ? [0, 2, 4, 6, 8, 1, 3, 5, 7, 9][a] : a
            }
            return i % 10 == 0
        }(t.replace(rL, ""))
    }
    let rM = c("$ZodCreditCard", (t, n) => {
        null != n.pattern || (n.pattern = tm), rn.init(t, n), t._zod.check = r => {
            rG(r.value) || r.issues.push({
                code: "invalid_format",
                format: "credit_card",
                input: r.value,
                inst: t,
                continue: !n.abort
            })
        }
    });

    function rB(t) {
        return !!tv.test(t) && function(t) {
            let n = 0,
                r = t.length;
            for (let i = 4; i < r; i++) {
                let r = t.charCodeAt(i);
                n = (r >= 65 ? 100 * n + (r - 55) : 10 * n + (r - 48)) % 97
            }
            for (let r = 0; r < 4; r++) {
                let i = t.charCodeAt(r);
                n = (i >= 65 ? 100 * n + (i - 55) : 10 * n + (i - 48)) % 97
            }
            return 1 === n
        }(t)
    }
    let rJ = c("$ZodIBAN", (t, n) => {
        null != n.pattern || (n.pattern = tv), rn.init(t, n), t._zod.check = r => {
            rB(r.value) || r.issues.push({
                code: "invalid_format",
                format: "iban",
                input: r.value,
                inst: t,
                continue: !n.abort
            })
        }
    });

    function rV(t) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null;
        try {
            let r = t.split(".");
            if (3 !== r.length) return !1;
            let [i] = r;
            if (!i) return !1;
            let a = JSON.parse(atob(i));
            if ("typ" in a && (null == a ? void 0 : a.typ) !== "JWT" || !a.alg || n && (!("alg" in a) || a.alg !== n)) return !1;
            return !0
        } catch (t) {
            return !1
        }
    }
    let rF = c("$ZodJWT", (t, n) => {
            rn.init(t, n), t._zod.check = r => {
                rV(r.value, n.alg) || r.issues.push({
                    code: "invalid_format",
                    format: "jwt",
                    input: r.value,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        rq = c("$ZodCustomStringFormat", (t, n) => {
            rn.init(t, n), t._zod.check = r => {
                n.fn(r.value) || r.issues.push({
                    code: "invalid_format",
                    format: n.format,
                    input: r.value,
                    inst: t,
                    continue: !n.abort
                })
            }
        }),
        rW = c("$ZodNumber", (t, n) => {
            n9.init(t, n), t._zod.pattern = tx, t._zod.parse = (r, i) => {
                if (n.coerce) try {
                    r.value = Number(r.value)
                } catch (t) {}
                let a = r.value;
                if ("number" == typeof a && !Number.isNaN(a) && Number.isFinite(a)) return r;
                let o = "number" == typeof a ? Number.isNaN(a) ? "NaN" : Number.isFinite(a) ? void 0 : String(a) : void 0;
                return r.issues.push({
                    expected: "number",
                    code: "invalid_type",
                    input: a,
                    inst: t,
                    ...o ? {
                        received: o
                    } : {}
                }), r
            }
        }),
        rK = c("$ZodNumberFormat", (t, n) => {
            nR.init(t, n), rW.init(t, n)
        }),
        rX = c("$ZodBoolean", (t, n) => {
            n9.init(t, n), t._zod.pattern = tS, t._zod.parse = (r, i) => {
                if (n.coerce) try {
                    r.value = !!r.value
                } catch (t) {}
                let a = r.value;
                return "boolean" == typeof a || r.issues.push({
                    expected: "boolean",
                    code: "invalid_type",
                    input: a,
                    inst: t
                }), r
            }
        }),
        rH = c("$ZodBigInt", (t, n) => {
            n9.init(t, n), t._zod.pattern = tk, t._zod.parse = (r, i) => {
                if (n.coerce) try {
                    r.value = BigInt(r.value)
                } catch (t) {}
                return "bigint" == typeof r.value || r.issues.push({
                    expected: "bigint",
                    code: "invalid_type",
                    input: r.value,
                    inst: t
                }), r
            }
        }),
        rY = c("$ZodBigIntFormat", (t, n) => {
            nL.init(t, n), rH.init(t, n)
        }),
        rQ = c("$ZodSymbol", (t, n) => {
            n9.init(t, n), t._zod.parse = (n, r) => {
                let i = n.value;
                return "symbol" == typeof i || n.issues.push({
                    expected: "symbol",
                    code: "invalid_type",
                    input: i,
                    inst: t
                }), n
            }
        }),
        r0 = c("$ZodUndefined", (t, n) => {
            n9.init(t, n), t._zod.pattern = tA, t._zod.values = new Set([void 0]), t._zod.parse = (n, r) => {
                let i = n.value;
                return void 0 === i || n.issues.push({
                    expected: "undefined",
                    code: "invalid_type",
                    input: i,
                    inst: t
                }), n
            }
        }),
        r4 = c("$ZodNull", (t, n) => {
            n9.init(t, n), t._zod.pattern = tz, t._zod.values = new Set([null]), t._zod.parse = (n, r) => {
                let i = n.value;
                return null === i || n.issues.push({
                    expected: "null",
                    code: "invalid_type",
                    input: i,
                    inst: t
                }), n
            }
        }),
        r1 = c("$ZodAny", (t, n) => {
            n9.init(t, n), t._zod.parse = t => t
        }),
        r6 = c("$ZodUnknown", (t, n) => {
            n9.init(t, n), t._zod.parse = t => t
        }),
        r2 = c("$ZodNever", (t, n) => {
            n9.init(t, n), t._zod.parse = (n, r) => (n.issues.push({
                expected: "never",
                code: "invalid_type",
                input: n.value,
                inst: t
            }), n)
        }),
        r5 = c("$ZodVoid", (t, n) => {
            n9.init(t, n), t._zod.parse = (n, r) => {
                let i = n.value;
                return void 0 === i || n.issues.push({
                    expected: "void",
                    code: "invalid_type",
                    input: i,
                    inst: t
                }), n
            }
        }),
        r3 = c("$ZodDate", (t, n) => {
            n9.init(t, n), t._zod.parse = (r, i) => {
                if (n.coerce) try {
                    r.value = new Date(r.value)
                } catch (t) {}
                let a = r.value,
                    o = a instanceof Date;
                return o && !Number.isNaN(a.getTime()) || r.issues.push({
                    expected: "date",
                    code: "invalid_type",
                    input: a,
                    ...o ? {
                        received: "Invalid Date"
                    } : {},
                    inst: t
                }), r
            }
        });

    function r9(t, n, r) {
        t.issues.length && n.issues.push(...eh(r, t.issues)), n.value[r] = t.value
    }
    let r8 = c("$ZodArray", (t, n) => {
        n9.init(t, n);
        let r = d.memoizer;
        null == r || r.attach(t), t._zod.parse = (i, a) => {
            let o = i.value;
            if (!Array.isArray(o)) return i.issues.push({
                expected: "array",
                code: "invalid_type",
                input: o,
                inst: t
            }), i;
            i.value = r ? r.alloc(t, i, Array(o.length), a) : Array(o.length);
            let c = [],
                u = null == a ? void 0 : a.abortEarly;
            for (let t = 0; t < o.length; t++) {
                let r = o[t],
                    l = n.element._zod.run({
                        value: r,
                        issues: []
                    }, a);
                if (l instanceof Promise) c.push(l.then(n => r9(n, i, t)));
                else if (r9(l, i, t), u && 0 !== l.issues.length && ep(l)) break
            }
            return c.length ? Promise.all(c).then(() => i) : i
        }
    });

    function r7(t, n, r, i, a, o) {
        let c = r in i,
            u = "optional" === o;
        if (c || !u || "optional" !== a) {
            if (t.issues.length) {
                if (void 0 !== a && u && !c) return;
                n.issues.push(...eh(r, t.issues))
            }
            if (!c && void 0 === a) {
                t.issues.length || n.issues.push({
                    code: "invalid_type",
                    expected: "nonoptional",
                    input: void 0,
                    path: [r]
                });
                return
            }
            void 0 === t.value ? (c || "defaulted" === a && !u) && (n.value[r] = void 0) : n.value[r] = t.value
        }
    }
    let ie = [];

    function it(t) {
        let n = Object.keys(t.shape),
            r = Object.getOwnPropertySymbols(t.shape),
            i = r.length ? r : ie,
            a = i.length ? [...n, ...i] : n;
        for (let n of a) {
            var o, c, u, l;
            if (!(null == (l = t.shape) || null == (u = l[n]) || null == (c = u._zod) || null == (o = c.traits) ? void 0 : o.has("$ZodType"))) throw Error('Invalid element at key "'.concat(String(n), '": expected a Zod schema'))
        }
        let s = er(t.shape);
        return {
            ...t,
            allKeys: a,
            symbolKeys: i,
            keySet: new Set(n),
            numKeys: n.length,
            optionalKeys: new Set(s)
        }
    }

    function ir(t, n, r, i, a, o, c) {
        let u = [],
            l = a.keySet,
            s = a.catchall._zod,
            d = s.def.type,
            m = s.optin,
            f = s.optout,
            v = 0;
        for (let a in n) {
            if (c && r.issues.length !== v) {
                if (ep(r, v)) break;
                v = r.issues.length
            }
            if (l.has(a)) continue;
            if ("__proto__" === a) {
                "never" === d && u.push(a);
                continue
            }
            if ("never" === d) {
                u.push(a);
                continue
            }
            let o = s.run({
                value: n[a],
                issues: []
            }, i);
            o instanceof Promise ? t.push(o.then(t => r7(t, r, a, n, m, f))) : r7(o, r, a, n, m, f)
        }
        return (u.length && r.issues.push({
            code: "unrecognized_keys",
            keys: u,
            input: n,
            inst: o,
            continue: !0
        }), t.length) ? Promise.all(t).then(() => r) : r
    }
    let ii = c("$ZodObject", (t, n) => {
            var r;
            let i;
            n9.init(t, n);
            let a = Object.getOwnPropertyDescriptor(n, "shape"),
                o = (null == a ? void 0 : a.get) ? a.get.raw : null != (r = n.shape) ? r : {};
            if (o) {
                let t = () => {
                    let r = {
                        ...o
                    };
                    return Object.defineProperty(n, "shape", {
                        value: r
                    }), t.raw = r, r
                };
                t.raw = o, Object.defineProperty(n, "shape", {
                    get: t
                })
            }
            let c = w(() => it(n));
            eG(t, "propValues", t => {
                let n = t.def.shape,
                    r = {};
                for (let t in n) {
                    let i = n[t]._zod;
                    if (i.values) {
                        for (let n of (Object.prototype.hasOwnProperty.call(r, t) || O(r, t, new Set), i.values)) r[t].add(n);
                        void 0 !== i.optin && r[t].add(void 0)
                    }
                }
                return r
            });
            let u = n.catchall,
                l = d.memoizer;
            null == l || l.attach(t), t._zod.parse = (n, r) => {
                null != i || (i = c.value);
                let a = n.value;
                if (!J(a)) return n.issues.push({
                    expected: "object",
                    code: "invalid_type",
                    input: a,
                    inst: t
                }), n;
                n.value = l ? l.alloc(t, n, {}, r) : {};
                let o = [],
                    s = i.shape,
                    d = null == r ? void 0 : r.abortEarly,
                    m = n.issues.length;
                for (let t of i.allKeys) {
                    if (d && n.issues.length !== m) {
                        if (ep(n, m)) break;
                        m = n.issues.length
                    }
                    if ("__proto__" === t) continue;
                    let i = s[t],
                        c = i._zod.optin,
                        u = i._zod.optout,
                        l = i._zod.run({
                            value: a[t],
                            issues: []
                        }, r);
                    l instanceof Promise ? o.push(l.then(r => r7(r, n, t, a, c, u))) : r7(l, n, t, a, c, u)
                }
                return u ? ir(o, a, n, r, c.value, t, !0 === d) : o.length ? Promise.all(o).then(() => n) : n
            }
        }),
        ia = c("$ZodObjectJIT", (t, n) => {
            let r, i;
            ii.init(t, n);
            let a = t._zod.parse,
                o = w(() => it(n)),
                c = d.memoizer,
                u = !d.jitless,
                l = u && V.value,
                s = n.catchall;
            t._zod.parse = (d, m) => {
                null != i || (i = o.value);
                let f = d.value;
                return J(f) ? u && l && (null == m ? void 0 : m.async) === !1 && !0 !== m.jitless ? (r || (r = (n => {
                    let r = o.value,
                        i = r.symbolKeys,
                        a = new n5(["payload", "ctx"], {
                            shape: n,
                            inst: t,
                            memo: c,
                            syms: i
                        }),
                        u = t => "shape[".concat(t, "]._zod.run({ value: input[").concat(t, "], issues: [] }, ctx)"),
                        l = (t, n) => "\n          let ".concat(t, "_ab = false;\n          for (let i = 0; i < ").concat(t, ".issues.length; i++) {\n            const iss = ").concat(t, ".issues[i];\n            iss.path = iss.path ? [").concat(n, ", ...iss.path] : [").concat(n, "];\n            payload.issues.push(iss);\n            if (iss.continue !== true) ").concat(t, "_ab = true;\n          }\n          if (").concat(t, "_ab && ctx && ctx.abortEarly) {\n            payload.value = newResult;\n            return payload;\n          }");
                    a.write("const input = payload.value;");
                    let s = Object.create(null),
                        d = 0;
                    for (let t of r.allKeys) s[t] = "key_".concat(d++);
                    for (let t of (a.write(c ? "const newResult = memo.alloc(inst, payload, {}, ctx);" : "const newResult = {};"), r.allKeys)) {
                        var m, f;
                        if ("__proto__" === t) continue;
                        let r = s[t],
                            o = "symbol" == typeof t ? "syms[".concat(i.indexOf(t), "]") : G(t),
                            c = "".concat(o, " in input"),
                            d = n[t],
                            v = null == d || null == (m = d._zod) ? void 0 : m.optin,
                            p = void 0 !== v,
                            g = (null == d || null == (f = d._zod) ? void 0 : f.optout) === "optional";
                        if (a.write("const ".concat(r, " = ").concat(u(o), ";")), p && g) {
                            let t = "optional" === v ? "".concat(r, "_present") : "".concat(r, ".value !== undefined || ").concat(r, "_present");
                            a.write("\n        const ".concat(r, "_present = ").concat(c, ";\n        if (!").concat(r, ".issues.length || ").concat(r, "_present) {\n          if (").concat(r, ".issues.length) {").concat(l(r, o), "\n          }\n\n          if (").concat(t, ") {\n            newResult[").concat(o, "] = ").concat(r, ".value;\n          }\n        }\n\n      "))
                        } else p ? (a.write("\n        if (".concat(r, ".issues.length) {").concat(l(r, o), "\n        }\n      ")), "defaulted" === v ? a.write("newResult[".concat(o, "] = ").concat(r, ".value;")) : a.write("\n        if (".concat(r, ".value !== undefined || ").concat(c, ") {\n          newResult[").concat(o, "] = ").concat(r, ".value;\n        }\n      "))) : a.write("\n        const ".concat(r, "_present = ").concat(c, ";\n        if (").concat(r, ".issues.length) {").concat(l(r, o), "\n        }\n        if (!").concat(r, "_present && !").concat(r, '.issues.length) {\n          payload.issues.push({\n            code: "invalid_type",\n            expected: "nonoptional",\n            input: undefined,\n            path: [').concat(o, "]\n          });\n          if (ctx && ctx.abortEarly) {\n            payload.value = newResult;\n            return payload;\n          }\n        }\n\n        if (").concat(r, "_present) {\n          newResult[").concat(o, "] = ").concat(r, ".value;\n        }\n\n      "))
                    }
                    return a.write("payload.value = newResult;"), a.write("return payload;"), a.compile()
                })(n.shape)), d = r(d, m), s) ? ir([], f, d, m, i, t, (null == m ? void 0 : m.abortEarly) === !0) : d : a(d, m) : (d.issues.push({
                    expected: "object",
                    code: "invalid_type",
                    input: f,
                    inst: t
                }), d)
            }
        });

    function io(t, n, r, i) {
        for (let r of t)
            if (0 === r.issues.length) return n.value = r.value, n;
        let a = t.filter(t => !ep(t));
        return 1 === a.length ? (n.value = a[0].value, a[0]) : (n.issues.push({
            code: "invalid_union",
            input: n.value,
            inst: r,
            errors: t.map(t => t.issues.map(t => e_(t, i, m())))
        }), n)
    }
    let ic = c("$ZodUnion", (t, n) => {
        n9.init(t, n), eG(t, "optin", t => t.def.options.some(t => "defaulted" === t._zod.optin) ? "defaulted" : t.def.options.some(t => void 0 !== t._zod.optin) ? "optional" : void 0), eG(t, "optout", t => t.def.options.some(t => "optional" === t._zod.optout) ? "optional" : void 0), eG(t, "values", t => {
            if (t.def.options.every(t => t._zod.values)) return new Set(t.def.options.flatMap(t => Array.from(t._zod.values)))
        }), eG(t, "pattern", t => {
            if (t.def.options.every(t => t._zod.pattern)) {
                let n = t.def.options.map(t => t._zod.pattern);
                return new RegExp("^(".concat(n.map(t => S(t.source)).join("|"), ")$"))
            }
        });
        let r = 1 === n.options.length ? n.options[0]._zod.run : null;
        t._zod.parse = (i, a) => {
            if (r) return r(i, a);
            let o = !1,
                c = [];
            for (let t of n.options) {
                let n = t._zod.run({
                    value: i.value,
                    issues: []
                }, a);
                if (n instanceof Promise) c.push(n), o = !0;
                else {
                    if (0 === n.issues.length) return n;
                    c.push(n)
                }
            }
            return o ? Promise.all(c).then(n => io(n, i, t, a)) : io(c, i, t, a)
        }
    });

    function iu(t, n, r, i) {
        let a = [];
        for (let n = 0; n < t.length; n++) 0 === t[n].issues.length && a.push(n);
        return 1 === a.length ? n.value = t[a[0]].value : 0 === a.length ? n.issues.push({
            code: "invalid_union",
            input: n.value,
            inst: r,
            errors: t.map(t => t.issues.map(t => e_(t, i, m())))
        }) : n.issues.push({
            code: "invalid_union",
            input: n.value,
            inst: r,
            errors: [],
            inclusive: !1,
            matches: a
        }), n
    }
    let il = c("$ZodXor", (t, n) => {
        ic.init(t, n), n.inclusive = !1;
        let r = 1 === n.options.length ? n.options[0]._zod.run : null;
        t._zod.parse = (i, a) => {
            if (r) return r(i, a);
            let o = !1,
                c = [];
            for (let t of n.options) {
                let n = t._zod.run({
                    value: i.value,
                    issues: []
                }, a);
                n instanceof Promise ? (c.push(n), o = !0) : c.push(n)
            }
            return o ? Promise.all(c).then(n => iu(n, i, t, a)) : iu(c, i, t, a)
        }
    });

    function is(t, n) {
        let r = t._zod,
            i = r.bag.optionsMap;
        i || (i = id(r.def), r.bag.optionsMap = i);
        let a = i.get(n);
        if (null === a) throw Error('Ambiguous discriminator value "'.concat(String(n), '"'));
        return a
    }

    function id(t) {
        let n = new Map;
        for (let i of t.options) {
            var r;
            let a = null == (r = i._zod.propValues) ? void 0 : r[t.discriminator];
            if (!a || 0 === a.size) throw Error('Invalid discriminated union option at index "'.concat(t.options.indexOf(i), '"'));
            for (let t of a)
                if (n.has(t)) {
                    if (void 0 !== t) throw Error('Duplicate discriminator value "'.concat(String(t), '"'));
                    n.set(t, null)
                } else n.set(t, i)
        }
        return n
    }
    let im = c("$ZodDiscriminatedUnion", (t, n) => {
            n.inclusive = !1, ic.init(t, n);
            let r = t._zod.parse;
            eG(t, "propValues", t => {
                var n, r;
                let i = {},
                    a = 0;
                for (let n of t.def.options) {
                    let o = n._zod.propValues;
                    if (!o || 0 === Object.keys(o).length) throw Error('Invalid discriminated union option at index "'.concat(t.def.options.indexOf(n), '"'));
                    for (let [n, c] of((null == (r = o[t.def.discriminator]) ? void 0 : r.has(void 0)) && a++, Object.entries(o)))
                        for (let t of (Object.prototype.hasOwnProperty.call(i, n) || O(i, n, new Set), c)) i[n].add(t)
                }
                return !t.def.unionFallback && a > 1 && (null == (n = i[t.def.discriminator]) || n.delete(void 0)), i
            }), n.options.forEach((t, r) => {
                let i = N(t._zod.def);
                if (i && !Object.prototype.hasOwnProperty.call(i, n.discriminator)) throw Error('Invalid discriminated union option at index "'.concat(r, '"'))
            });
            let i = w(() => id(n));
            t._zod.parse = (a, o) => {
                let c = a.value;
                if (!J(c)) return a.issues.push({
                    code: "invalid_type",
                    expected: "object",
                    input: c,
                    inst: t
                }), a;
                let u = null == c ? void 0 : c[n.discriminator],
                    l = i.value.get(u);
                return l && (void 0 !== u || "backward" !== o.direction) ? l._zod.run(a, o) : n.unionFallback || "backward" === o.direction ? r(a, o) : (a.issues.push({
                    code: "invalid_union",
                    errors: [],
                    note: "No matching discriminator",
                    discriminator: n.discriminator,
                    options: Array.from(i.value.keys()).filter(t => null !== i.value.get(t)),
                    input: c,
                    path: [n.discriminator],
                    inst: t
                }), a)
            }
        }),
        iv = c("$ZodIntersection", (t, n) => {
            n9.init(t, n), t._zod.parse = (t, r) => {
                let i = t.value,
                    a = n.left._zod.run({
                        value: i,
                        issues: []
                    }, r),
                    o = n.right._zod.run({
                        value: i,
                        issues: []
                    }, r);
                return a instanceof Promise || o instanceof Promise ? Promise.all([a, o]).then(n => {
                    let [r, i] = n;
                    return ig(t, r, i)
                }) : ig(t, a, o)
            }
        });

    function ip(t, n) {
        if (t === n || t instanceof Date && n instanceof Date && +t == +n) return {
            valid: !0,
            data: t
        };
        if (F(t) && F(n)) {
            let r = Object.keys(n),
                i = Object.keys(t).filter(t => -1 !== r.indexOf(t)),
                a = {
                    ...t,
                    ...n
                };
            for (let r of (Object.prototype.hasOwnProperty.call(a, "__proto__") && delete a.__proto__, i)) {
                if ("__proto__" === r) continue;
                let i = ip(t[r], n[r]);
                if (!i.valid) return {
                    valid: !1,
                    mergeErrorPath: [r, ...i.mergeErrorPath]
                };
                a[r] = i.data
            }
            return {
                valid: !0,
                data: a
            }
        }
        if (Array.isArray(t) && Array.isArray(n)) {
            if (t.length !== n.length) return {
                valid: !1,
                mergeErrorPath: []
            };
            let r = [];
            for (let i = 0; i < t.length; i++) {
                let a = ip(t[i], n[i]);
                if (!a.valid) return {
                    valid: !1,
                    mergeErrorPath: [i, ...a.mergeErrorPath]
                };
                r.push(a.data)
            }
            return {
                valid: !0,
                data: r
            }
        }
        return {
            valid: !1,
            mergeErrorPath: []
        }
    }

    function ig(t, n, r) {
        let i, a = new Map,
            o = new Map,
            c = (t, n) => {
                var r, c;
                let u;
                if ("unrecognized_keys" !== t.code || (null == (r = t.path) ? void 0 : r.length))
                    if ("invalid_key" !== t.code || "record" !== t.origin || (null == (c = t.path) ? void 0 : c.length) !== 1) return !1;
                    else {
                        let n = String(t.path[0]);
                        o.has(n) || o.set(n, t), u = [n]
                    }
                else null != i || (i = t), u = t.keys;
                for (let t of u) a.has(t) || a.set(t, {}), a.get(t)[n] = !0;
                return !0
            };
        for (let r of n.issues) c(r, "l") || t.issues.push(r);
        for (let n of r.issues) c(n, "r") || t.issues.push(n);
        let u = [...a].filter(t => {
            let [, n] = t;
            return n.l && n.r
        }).map(t => {
            let [n] = t;
            return n
        });
        if (u.length) {
            let n = i ? u.filter(t => i.keys.includes(t)) : [];
            for (let r of (n.length && t.issues.push({
                    ...i,
                    keys: n
                }), u)) !n.includes(r) && o.has(r) && t.issues.push(o.get(r))
        }
        let l = ip(n.value, r.value);
        if (!l.valid) {
            if (ep(t)) return t;
            throw Error("Unmergable intersection. Error path: " + "".concat(JSON.stringify(l.mergeErrorPath)))
        }
        return t.value = l.data, t
    }
    let ih = c("$ZodTuple", (t, n) => {
        n9.init(t, n);
        let r = n.items,
            i = d.memoizer;
        null == i || i.attach(t), t._zod.parse = (a, o) => {
            let c = a.value;
            if (!Array.isArray(c)) return a.issues.push({
                input: c,
                inst: t,
                expected: "tuple",
                code: "invalid_type"
            }), a;
            a.value = i ? i.alloc(t, a, [], o) : [];
            let u = [],
                l = ib(r, "optin"),
                s = ib(r, "optout");
            if (!n.rest) {
                if (c.length < l) return a.issues.push({
                    code: "too_small",
                    minimum: l,
                    inclusive: !0,
                    input: c,
                    inst: t,
                    origin: "array"
                }), a;
                c.length > r.length && a.issues.push({
                    code: "too_big",
                    maximum: r.length,
                    inclusive: !0,
                    input: c,
                    inst: t,
                    origin: "array"
                })
            }
            let d = Array(r.length),
                m = n.rest ? null == o ? void 0 : o.abortEarly : void 0,
                f = !1;
            for (let t = 0; t < r.length; t++) {
                let n = r[t]._zod.run({
                    value: c[t],
                    issues: []
                }, o);
                n instanceof Promise ? u.push(n.then(n => {
                    d[t] = n
                })) : (d[t] = n, m && !f && n.issues.length && (f = ep(n)))
            }
            if (n.rest && !f) {
                let t = r.length - 1,
                    i = c.slice(r.length),
                    l = a.issues.length;
                for (let r of i) {
                    if (m && a.issues.length !== l) {
                        if (ep(a, l)) break;
                        l = a.issues.length
                    }
                    t++;
                    let i = n.rest._zod.run({
                        value: r,
                        issues: []
                    }, o);
                    i instanceof Promise ? u.push(i.then(n => iy(n, a, t))) : iy(i, a, t)
                }
            }
            return u.length ? Promise.all(u).then(() => i_(d, a, r, c, s)) : i_(d, a, r, c, s)
        }
    });

    function ib(t, n) {
        for (let r = t.length - 1; r >= 0; r--)
            if (!("optin" === n ? void 0 !== t[r]._zod.optin : "optional" === t[r]._zod.optout)) return r + 1;
        return 0
    }

    function iy(t, n, r) {
        t.issues.length && n.issues.push(...eh(r, t.issues)), n.value[r] = t.value
    }

    function i_(t, n, r, i, a) {
        for (let o = 0; o < r.length; o++) {
            let c = t[o],
                u = o < i.length;
            if (!u && o >= a && "optional" === r[o]._zod.optin) {
                n.value.length = o;
                break
            }
            if (c.issues.length) {
                if (!u && o >= a) {
                    n.value.length = o;
                    break
                }
                n.issues.push(...eh(o, c.issues))
            }
            n.value[o] = c.value
        }
        for (let t = n.value.length - 1; t >= i.length; t--)
            if ("optional" === r[t]._zod.optout && void 0 === n.value[t]) n.value.length = t;
            else break;
        return n
    }
    let iI = c("$ZodRecord", (t, n) => {
            n9.init(t, n);
            let r = d.memoizer;
            null == r || r.attach(t), t._zod.parse = (i, a) => {
                let o = i.value;
                if (!F(o)) return i.issues.push({
                    expected: "record",
                    code: "invalid_type",
                    input: o,
                    inst: t
                }), i;
                let c = [],
                    u = n.keyType._zod.values;
                if (u && !n.partial) {
                    let l;
                    i.value = r ? r.alloc(t, i, {}, a) : {};
                    let s = new Set;
                    for (let r of u)
                        if ("string" == typeof r || "number" == typeof r || "symbol" == typeof r) {
                            if (s.add("number" == typeof r ? r.toString() : r), "__proto__" === r) continue;
                            let u = n.keyType._zod.run({
                                value: r,
                                issues: []
                            }, a);
                            if (u instanceof Promise) throw Error("Async schemas not supported in object keys currently");
                            if (u.issues.length) {
                                i.issues.push({
                                    code: "invalid_key",
                                    origin: "record",
                                    issues: u.issues.map(t => e_(t, a, m())),
                                    input: r,
                                    path: [r],
                                    inst: t
                                });
                                continue
                            }
                            let l = u.value;
                            if ("__proto__" === l) continue;
                            let d = n.valueType._zod.run({
                                value: o[r],
                                issues: []
                            }, a);
                            d instanceof Promise ? c.push(d.then(t => {
                                t.issues.length && i.issues.push(...eh(r, t.issues)), i.value[l] = t.value
                            })) : (d.issues.length && i.issues.push(...eh(r, d.issues)), i.value[l] = d.value)
                        } for (let t in o)
                        if (!s.has(t))
                            if ("loose" === n.mode) {
                                if ("__proto__" === t) continue;
                                i.value[t] = o[t]
                            } else(l = null != l ? l : []).push(t);
                    l && l.length > 0 && i.issues.push({
                        code: "unrecognized_keys",
                        input: o,
                        inst: t,
                        keys: l,
                        continue: !0
                    })
                } else {
                    let l;
                    for (let s of (i.value = r ? r.alloc(t, i, {}, a) : {}, Reflect.ownKeys(o))) {
                        if ("__proto__" === s || !Object.prototype.propertyIsEnumerable.call(o, s)) continue;
                        let r = n.keyType._zod.run({
                            value: s,
                            issues: []
                        }, a);
                        if (r instanceof Promise) throw Error("Async schemas not supported in object keys currently");
                        if ("string" == typeof s && tx.test(s) && r.issues.length) {
                            let t = n.keyType._zod.run({
                                value: Number(s),
                                issues: []
                            }, a);
                            if (t instanceof Promise) throw Error("Async schemas not supported in object keys currently");
                            0 === t.issues.length && (r = t)
                        }
                        if (r.issues.length) {
                            "loose" === n.mode ? i.value[s] = o[s] : u ? (l = null != l ? l : []).push(s) : i.issues.push({
                                code: "invalid_key",
                                origin: "record",
                                issues: r.issues.map(t => e_(t, a, m())),
                                input: s,
                                path: [s],
                                inst: t
                            });
                            continue
                        }
                        let d = r.value;
                        if ("__proto__" === d) continue;
                        let f = n.valueType._zod.run({
                            value: o[s],
                            issues: []
                        }, a);
                        f instanceof Promise ? c.push(f.then(t => {
                            t.issues.length && i.issues.push(...eh(s, t.issues)), i.value[d] = t.value
                        })) : (f.issues.length && i.issues.push(...eh(s, f.issues)), i.value[d] = f.value)
                    }
                    l && l.length > 0 && i.issues.push({
                        code: "unrecognized_keys",
                        input: o,
                        inst: t,
                        keys: l,
                        continue: !0
                    })
                }
                return c.length ? Promise.all(c).then(() => i) : i
            }
        }),
        ik = c("$ZodMap", (t, n) => {
            n9.init(t, n);
            let r = d.memoizer;
            null == r || r.attach(t), t._zod.parse = (i, a) => {
                let o = i.value;
                if (!(o instanceof Map)) return i.issues.push({
                    expected: "map",
                    code: "invalid_type",
                    input: o,
                    inst: t
                }), i;
                let c = [];
                i.value = r ? r.alloc(t, i, new Map, a) : new Map;
                let u = null == a ? void 0 : a.abortEarly,
                    l = i.issues.length;
                for (let [r, s] of o) {
                    if (u && i.issues.length !== l) {
                        if (ep(i, l)) break;
                        l = i.issues.length
                    }
                    let d = n.keyType._zod.run({
                            value: r,
                            issues: []
                        }, a),
                        m = n.valueType._zod.run({
                            value: s,
                            issues: []
                        }, a);
                    d instanceof Promise || m instanceof Promise ? c.push(Promise.all([d, m]).then(n => {
                        let [c, u] = n;
                        iw(c, u, i, r, o, t, a)
                    })) : iw(d, m, i, r, o, t, a)
                }
                return c.length ? Promise.all(c).then(() => i) : i
            }
        });

    function iw(t, n, r, i, a, o, c) {
        t.issues.length && (X.has(typeof i) ? r.issues.push(...eh(i, t.issues)) : r.issues.push({
            code: "invalid_key",
            origin: "map",
            input: a,
            inst: o,
            issues: t.issues.map(t => e_(t, c, m()))
        })), n.issues.length && (X.has(typeof i) ? r.issues.push(...eh(i, n.issues)) : r.issues.push({
            origin: "map",
            code: "invalid_element",
            input: a,
            inst: o,
            key: i,
            issues: n.issues.map(t => e_(t, c, m()))
        })), r.value.set(t.value, n.value)
    }
    let ix = c("$ZodSet", (t, n) => {
        n9.init(t, n);
        let r = d.memoizer;
        null == r || r.attach(t), t._zod.parse = (i, a) => {
            let o = i.value;
            if (!(o instanceof Set)) return i.issues.push({
                input: o,
                inst: t,
                expected: "set",
                code: "invalid_type"
            }), i;
            let c = [];
            i.value = r ? r.alloc(t, i, new Set, a) : new Set;
            let u = null == a ? void 0 : a.abortEarly,
                l = i.issues.length;
            for (let t of o) {
                if (u && i.issues.length !== l) {
                    if (ep(i, l)) break;
                    l = i.issues.length
                }
                let r = n.valueType._zod.run({
                    value: t,
                    issues: []
                }, a);
                r instanceof Promise ? c.push(r.then(t => iS(t, i))) : iS(r, i)
            }
            return c.length ? Promise.all(c).then(() => i) : i
        }
    });

    function iS(t, n) {
        t.issues.length && n.issues.push(...t.issues), n.value.add(t.value)
    }
    let iz = c("$ZodEnum", (t, n) => {
            n9.init(t, n);
            let r = y(n.entries),
                i = new Set(r);
            t._zod.values = i, eG(t, "pattern", t => {
                let n = y(t.def.entries).filter(t => X.has(typeof t));
                return new RegExp(n.length ? "^(".concat(n.map(t => Y(t.toString())).join("|"), ")$") : "^[^\\s\\S]$")
            }), t._zod.parse = (n, a) => {
                let o = n.value;
                return i.has(o) || n.issues.push({
                    code: "invalid_value",
                    values: r,
                    input: o,
                    inst: t
                }), n
            }
        }),
        iA = c("$ZodLiteral", (t, n) => {
            n9.init(t, n);
            let r = new Set(n.values);
            t._zod.values = r, eG(t, "pattern", t => {
                let n = t.def.values;
                return new RegExp(n.length ? "^(".concat(n.map(t => "string" == typeof t ? Y(t) : t ? Y(t.toString()) : String(t)).join("|"), ")$") : "^[^\\s\\S]$")
            }), t._zod.parse = (i, a) => {
                let o = i.value;
                return r.has(o) || i.issues.push({
                    code: "invalid_value",
                    values: n.values,
                    input: o,
                    inst: t
                }), i
            }
        }),
        iU = c("$ZodFile", (t, n) => {
            n9.init(t, n), t._zod.parse = (n, r) => {
                let i = n.value;
                return i instanceof File || n.issues.push({
                    expected: "file",
                    code: "invalid_type",
                    input: i,
                    inst: t
                }), n
            }
        }),
        iP = c("$ZodTransform", (t, n) => {
            var r;
            n9.init(t, n), t._zod.optin = "optional", null == (r = d.memoizer) || r.guard(t), t._zod.parse = (r, i) => {
                if ("backward" === i.direction) throw new s(t.constructor.name);
                let a = n.transform(r.value, r);
                if (i.async) return (a instanceof Promise ? a : Promise.resolve(a)).then(t => (r.value = t, r));
                if (a instanceof Promise) throw new l;
                return r.value = a, r
            }
        });

    function iO(t, n) {
        return t.value = n.issues.length ? void 0 : n.value, t
    }
    let iN = c("$ZodOptional", (t, n) => {
            n9.init(t, n), eG(t, "optin", t => "defaulted" === t.def.innerType._zod.optin ? "defaulted" : "optional"), t._zod.optout = "optional", eG(t, "values", t => {
                let n = t.def.innerType._zod.values;
                return n ? new Set([...n, void 0]) : void 0
            }), eG(t, "pattern", t => {
                let n = t.def.innerType._zod.pattern;
                return n ? new RegExp("^(".concat(S(n.source), ")?$")) : void 0
            }), t._zod.parse = (t, r) => {
                if (void 0 === t.value) {
                    if ("defaulted" !== n.innerType._zod.optin) return t;
                    let i = n.innerType._zod.run({
                        value: t.value,
                        issues: []
                    }, r);
                    return i instanceof Promise ? i.then(n => iO(t, n)) : iO(t, i)
                }
                return n.innerType._zod.run(t, r)
            }
        }),
        iD = c("$ZodExactOptional", (t, n) => {
            iN.init(t, n), eG(t, "values", t => t.def.innerType._zod.values), eG(t, "pattern", t => t.def.innerType._zod.pattern), t._zod.parse = (t, r) => n.innerType._zod.run(t, r)
        }),
        iZ = c("$ZodNullable", (t, n) => {
            n9.init(t, n), eG(t, "optin", t => t.def.innerType._zod.optin), eG(t, "optout", t => t.def.innerType._zod.optout), eG(t, "pattern", t => {
                let n = t.def.innerType._zod.pattern;
                return n ? new RegExp("^(".concat(S(n.source), "|null)$")) : void 0
            }), eG(t, "values", t => t.def.innerType._zod.values ? new Set([...t.def.innerType._zod.values, null]) : void 0), t._zod.parse = (t, r) => null === t.value ? t : n.innerType._zod.run(t, r)
        }),
        ij = c("$ZodDefault", (t, n) => {
            n9.init(t, n), t._zod.optin = "defaulted", eG(t, "values", t => t.def.innerType._zod.values), t._zod.parse = (t, r) => {
                if ("backward" === r.direction) return n.innerType._zod.run(t, r);
                if (void 0 === t.value) return t.value = n.defaultValue, t;
                let i = n.innerType._zod.run(t, r);
                return i instanceof Promise ? i.then(t => iT(t, n)) : iT(i, n)
            }
        });

    function iT(t, n) {
        return void 0 === t.value && (t.value = n.defaultValue), t
    }
    let iE = c("$ZodPrefault", (t, n) => {
            n9.init(t, n), t._zod.optin = "defaulted", eG(t, "values", t => t.def.innerType._zod.values), t._zod.parse = (t, r) => ("backward" === r.direction || void 0 === t.value && (t.value = n.defaultValue), n.innerType._zod.run(t, r))
        }),
        iC = c("$ZodNonOptional", (t, n) => {
            n9.init(t, n), eG(t, "values", t => {
                let n = t.def.innerType._zod.values;
                return n ? new Set([...n].filter(t => void 0 !== t)) : void 0
            }), t._zod.parse = (r, i) => {
                let a = n.innerType._zod.run(r, i);
                return a instanceof Promise ? a.then(n => i$(n, t)) : i$(a, t)
            }
        });

    function i$(t, n) {
        return t.issues.length || void 0 !== t.value || t.issues.push({
            code: "invalid_type",
            expected: "nonoptional",
            input: t.value,
            inst: n
        }), t
    }
    let iR = c("$ZodSuccess", (t, n) => {
        n9.init(t, n), t._zod.parse = (t, r) => {
            if ("backward" === r.direction) throw new s("ZodSuccess");
            let i = n.innerType._zod.run(t, r);
            return i instanceof Promise ? i.then(n => (t.value = 0 === n.issues.length, t)) : (t.value = 0 === i.issues.length, t)
        }
    });

    function iL(t, n, r, i) {
        return n.issues.length ? t.value = r.catchValue({
            ...n,
            value: t.value,
            error: {
                issues: n.issues.map(t => e_(t, i, m()))
            },
            input: t.value
        }) : (t.value = n.value, n.memo && (t.memo = !0)), t
    }
    let iG = c("$ZodCatch", (t, n) => {
            n9.init(t, n), eG(t, "optin", t => "defaulted" === t.def.innerType._zod.optin ? "defaulted" : "optional"), eG(t, "optout", t => t.def.innerType._zod.optout), eG(t, "values", t => t.def.innerType._zod.values), t._zod.parse = (t, r) => {
                if ("backward" === r.direction) return n.innerType._zod.run(t, r);
                let i = n.innerType._zod.run({
                    value: t.value,
                    issues: []
                }, r);
                return i instanceof Promise ? i.then(i => iL(t, i, n, r)) : iL(t, i, n, r)
            }
        }),
        iM = c("$ZodNaN", (t, n) => {
            n9.init(t, n), t._zod.parse = (n, r) => ("number" == typeof n.value && Number.isNaN(n.value) || n.issues.push({
                input: n.value,
                inst: t,
                expected: "nan",
                code: "invalid_type"
            }), n)
        }),
        iB = c("$ZodPipe", (t, n) => {
            n9.init(t, n), eG(t, "values", t => t.def.in._zod.values), eG(t, "optin", t => t.def.in._zod.optin), eG(t, "optout", t => t.def.out._zod.optout), eG(t, "propValues", t => t.def.in._zod.propValues), t._zod.parse = (t, r) => {
                if ("backward" === r.direction) {
                    let i = n.out._zod.run(t, r);
                    return i instanceof Promise ? i.then(t => iJ(t, n.in, r)) : iJ(i, n.in, r)
                }
                let i = n.in._zod.run(t, r);
                return i instanceof Promise ? i.then(t => iJ(t, n.out, r)) : iJ(i, n.out, r)
            }
        });

    function iJ(t, n, r) {
        return t.issues.some(t => "unrecognized_keys" !== t.code) ? (t.aborted = !0, t) : n._zod.run({
            value: t.value,
            issues: t.issues
        }, r)
    }
    let iV = c("$ZodCodec", (t, n) => {
        n9.init(t, n), eG(t, "values", t => t.def.in._zod.values), eG(t, "optin", t => t.def.in._zod.optin), eG(t, "optout", t => t.def.out._zod.optout), eG(t, "propValues", t => t.def.in._zod.propValues), t._zod.parse = (t, r) => {
            if ("forward" === (r.direction || "forward")) {
                let i = n.in._zod.run(t, r);
                return i instanceof Promise ? i.then(t => iF(t, n, r)) : iF(i, n, r)
            } {
                let i = n.out._zod.run(t, r);
                return i instanceof Promise ? i.then(t => iF(t, n, r)) : iF(i, n, r)
            }
        }
    });

    function iF(t, n, r) {
        if (t.issues.length) return t.aborted = !0, t;
        if ("forward" === (r.direction || "forward")) {
            let i = n.transform(t.value, t);
            return i instanceof Promise ? i.then(i => iq(t, i, n.out, r)) : iq(t, i, n.out, r)
        } {
            let i = n.reverseTransform(t.value, t);
            return i instanceof Promise ? i.then(i => iq(t, i, n.in, r)) : iq(t, i, n.in, r)
        }
    }

    function iq(t, n, r, i) {
        return t.issues.length ? (t.aborted = !0, t) : r._zod.run({
            value: n,
            issues: t.issues
        }, i)
    }
    let iW = c("$ZodPreprocess", (t, n) => {
            iB.init(t, n)
        }),
        iK = c("$ZodReadonly", (t, n) => {
            n9.init(t, n), eG(t, "propValues", t => t.def.innerType._zod.propValues), eG(t, "values", t => t.def.innerType._zod.values), eG(t, "optin", t => {
                var n, r;
                return null == (r = t.def.innerType) || null == (n = r._zod) ? void 0 : n.optin
            }), eG(t, "optout", t => {
                var n, r;
                return null == (r = t.def.innerType) || null == (n = r._zod) ? void 0 : n.optout
            }), t._zod.parse = (t, r) => {
                if ("backward" === r.direction) return n.innerType._zod.run(t, r);
                let i = n.innerType._zod.run(t, r);
                return i instanceof Promise ? i.then(iX) : iX(i)
            }
        });

    function iX(t) {
        return t.memo || (t.value = Object.freeze(t.value)), t
    }
    let iH = c("$ZodTemplateLiteral", (t, n) => {
            n9.init(t, n);
            let r = [];
            for (let t of n.parts)
                if ("object" == typeof t && null !== t) {
                    let n = function t(n) {
                        var r, i, a;
                        let o = n._zod.def,
                            c = null == (i = n._zod.pattern) ? void 0 : i.source,
                            u = null != (r = o.innerType) ? r : n._zod.innerType;
                        if (u) {
                            let n = null == (a = u._zod.pattern) ? void 0 : a.source,
                                r = t(u);
                            return c && n && r && r !== n ? c.replace(S(n), () => S(r)) : c
                        }
                        if (o.options) {
                            let n = o.options.map(t);
                            if (n.every(Boolean)) return "^(".concat(n.map(t => S(t)).join("|"), ")$")
                        }
                        return function(t) {
                            var n, r, i, a, o, c;
                            let u, l, s = t._zod.def,
                                d = s.pattern,
                                m = !!(null == (r = s.format) ? void 0 : r.includes("int"));
                            for (let t of null != (n = s.checks) ? n : []) {
                                let n = t._zod.def;
                                n.pattern && (d = n.pattern), m || (m = !!(null == (c = n.format) ? void 0 : c.includes("int")));
                                let r = null != (a = n.minimum) ? a : n.length,
                                    i = null != (o = n.maximum) ? o : n.length;
                                void 0 !== r && (void 0 === u || r > u) && (u = r), void 0 !== i && (void 0 === l || i < l) && (l = i)
                            }
                            if (d) return d.source;
                            if (void 0 !== u && void 0 !== l && u > l) return "(?!)";
                            if (void 0 !== u || void 0 !== l) return tI({
                                minimum: u,
                                maximum: l
                            }).source;
                            let f = t._zod.pattern;
                            return null == (i = m && f === tx ? tw : f) ? void 0 : i.source
                        }(n)
                    }(t);
                    if (!n) throw Error("Invalid template literal part, no pattern found: ".concat([...t._zod.traits].shift()));
                    r.push(S(n))
                } else if (null === t || H.has(typeof t)) r.push(Y("".concat(t)));
            else throw Error("Invalid template literal part: ".concat(t));
            t._zod.pattern = new RegExp("^".concat(r.join(""), "$")), t._zod.parse = (r, i) => {
                if ("string" != typeof r.value) return r.issues.push({
                    input: r.value,
                    inst: t,
                    expected: "string",
                    code: "invalid_type"
                }), r;
                if (t._zod.pattern.lastIndex = 0, !t._zod.pattern.test(r.value)) {
                    var a;
                    r.issues.push({
                        input: r.value,
                        inst: t,
                        code: "invalid_format",
                        format: null != (a = n.format) ? a : "template_literal",
                        pattern: t._zod.pattern.source
                    })
                }
                return r
            }
        }),
        iY = c("$ZodFunction", (t, n) => (n9.init(t, n), Object.defineProperty(t, "_def", {
            value: n
        }), t._zod.def = n, t.implement = n => {
            if ("function" != typeof n) throw Error("implement() must be called with a function");
            return Object.defineProperty(function() {
                for (var r = arguments.length, i = Array(r), a = 0; a < r; a++) i[a] = arguments[a];
                let o = Reflect.apply(n, this, t._def.input ? ni(t._def.input, i) : i);
                return t._def.output ? ni(t._def.output, o) : o
            }, "_zod", {
                value: t._zod,
                enumerable: !1
            })
        }, t.implementAsync = n => {
            if ("function" != typeof n) throw Error("implementAsync() must be called with a function");
            return Object.defineProperty(async function() {
                for (var r = arguments.length, i = Array(r), a = 0; a < r; a++) i[a] = arguments[a];
                let o = t._def.input ? await no(t._def.input, i) : i,
                    c = await Reflect.apply(n, this, o);
                return t._def.output ? await no(t._def.output, c) : c
            }, "_zod", {
                value: t._zod,
                enumerable: !1
            })
        }, t._zod.parse = (n, r) => ("function" != typeof n.value ? n.issues.push({
            code: "invalid_type",
            expected: "function",
            input: n.value,
            inst: t
        }) : t._def.output && "promise" === t._def.output._zod.def.type ? n.value = t.implementAsync(n.value) : n.value = t.implement(n.value), n), t.input = function() {
            for (var n = arguments.length, r = Array(n), i = 0; i < n; i++) r[i] = arguments[i];
            let a = t.constructor;
            return new a(Array.isArray(r[0]) ? {
                type: "function",
                input: new ih({
                    type: "tuple",
                    items: r[0],
                    rest: r[1]
                }),
                output: t._def.output
            } : {
                type: "function",
                input: r[0],
                output: t._def.output
            })
        }, t.output = n => new t.constructor({
            type: "function",
            input: t._def.input,
            output: n
        }), t)),
        iQ = c("$ZodPromise", (t, n) => {
            n9.init(t, n), t._zod.parse = (t, r) => Promise.resolve(t.value).then(t => n.innerType._zod.run({
                value: t,
                issues: []
            }, r))
        }),
        i0 = c("$ZodLazy", (t, n) => {
            n9.init(t, n), U(t._zod, "innerType", () => (n._cachedInner || (n._cachedInner = n.getter()), n._cachedInner)), eG(t, "pattern", t => {
                var n, r;
                return null == (r = t.innerType) || null == (n = r._zod) ? void 0 : n.pattern
            }), eG(t, "propValues", t => {
                var n, r;
                return null == (r = t.innerType) || null == (n = r._zod) ? void 0 : n.propValues
            }), eG(t, "optin", t => {
                var n, r, i;
                return null != (n = null == (i = t.innerType) || null == (r = i._zod) ? void 0 : r.optin) ? n : void 0
            }), eG(t, "optout", t => {
                var n, r, i;
                return null != (n = null == (i = t.innerType) || null == (r = i._zod) ? void 0 : r.optout) ? n : void 0
            }), t._zod.parse = (n, r) => t._zod.innerType._zod.run(n, r)
        }),
        i4 = c("$ZodCustom", (t, n) => {
            nD.init(t, n), n9.init(t, n), t._zod.parse = (t, n) => t, t._zod.check = r => {
                let i = r.value,
                    a = n.fn(i);
                if (a instanceof Promise) return a.then(n => i1(n, r, i, t));
                i1(a, r, i, t)
            }
        });

    function i1(t, n, r, i) {
        if (!t) {
            var a;
            let t = {
                code: "custom",
                input: r,
                inst: i,
                path: [...null != (a = i._zod.def.path) ? a : []],
                continue: !i._zod.def.abort
            };
            i._zod.def.params && (t.params = i._zod.def.params), n.issues.push(ez(t))
        }
    }
    t.s(["$ZodAny", 0, r1, "$ZodArray", 0, r8, "$ZodBase64", 0, rT, "$ZodBase64URL", 0, r$, "$ZodBigInt", 0, rH, "$ZodBigIntFormat", 0, rY, "$ZodBoolean", 0, rX, "$ZodCIDRv4", 0, rO, "$ZodCIDRv6", 0, rD, "$ZodCUID", 0, rg, "$ZodCUID2", 0, rh, "$ZodCatch", 0, iG, "$ZodCodec", 0, iV, "$ZodCreditCard", 0, rM, "$ZodCustom", 0, i4, "$ZodCustomStringFormat", 0, rq, "$ZodDate", 0, r3, "$ZodDefault", 0, ij, "$ZodDiscriminatedUnion", 0, im, "$ZodE164", 0, rR, "$ZodEmail", 0, ra, "$ZodEmoji", 0, rv, "$ZodEnum", 0, iz, "$ZodExactOptional", 0, iD, "$ZodFile", 0, iU, "$ZodFunction", 0, iY, "$ZodGUID", 0, rr, "$ZodIBAN", 0, rJ, "$ZodIPv4", 0, rS, "$ZodIPv6", 0, rU, "$ZodISODate", 0, rk, "$ZodISODateTime", 0, rI, "$ZodISODuration", 0, rx, "$ZodISOTime", 0, rw, "$ZodIntersection", 0, iv, "$ZodJWT", 0, rF, "$ZodKSUID", 0, r_, "$ZodLazy", 0, i0, "$ZodLiteral", 0, iA, "$ZodMAC", 0, rP, "$ZodMap", 0, ik, "$ZodNaN", 0, iM, "$ZodNanoID", 0, rp, "$ZodNever", 0, r2, "$ZodNonOptional", 0, iC, "$ZodNull", 0, r4, "$ZodNullable", 0, iZ, "$ZodNumber", 0, rW, "$ZodNumberFormat", 0, rK, "$ZodObject", 0, ii, "$ZodObjectJIT", 0, ia, "$ZodOptional", 0, iN, "$ZodPipe", 0, iB, "$ZodPrefault", 0, iE, "$ZodPreprocess", 0, iW, "$ZodPromise", 0, iQ, "$ZodReadonly", 0, iK, "$ZodRecord", 0, iI, "$ZodSet", 0, ix, "$ZodString", 0, rt, "$ZodStringFormat", 0, rn, "$ZodSuccess", 0, iR, "$ZodSymbol", 0, rQ, "$ZodTemplateLiteral", 0, iH, "$ZodTransform", 0, iP, "$ZodTuple", 0, ih, "$ZodType", 0, n9, "$ZodULID", 0, rb, "$ZodURL", 0, rf, "$ZodUUID", 0, ri, "$ZodUndefined", 0, r0, "$ZodUnion", 0, ic, "$ZodUnknown", 0, r6, "$ZodVoid", 0, r5, "$ZodXID", 0, ry, "$ZodXor", 0, il, "URL_BAD_FORMAT", 0, 1, "URL_UNPARSEABLE", 0, 2, "base64Charset", 0, rj, "base64urlCharset", 0, rE, "canParseURL", 0, ro, "getDiscriminatedOption", 0, is, "isValidBase64", 0, rZ, "isValidBase64URL", 0, rC, "isValidCIDRv6", 0, rN, "isValidCreditCard", 0, rG, "isValidIBAN", 0, rB, "isValidIPv6", 0, rA, "isValidJWT", 0, rV, "mergeValues", 0, ip, "parseURLObject", 0, ru, "standardProps", 0, re, "stripTabAndNewline", 0, rs, "urlHostnameOk", 0, rd, "urlProtocolOk", 0, rm, "validateURL", 0, rc], 61856), t.i(61856), t.s(["$ZodAny", 0, r1, "$ZodArray", 0, r8, "$ZodBase64", 0, rT, "$ZodBase64URL", 0, r$, "$ZodBigInt", 0, rH, "$ZodBigIntFormat", 0, rY, "$ZodBoolean", 0, rX, "$ZodCIDRv4", 0, rO, "$ZodCIDRv6", 0, rD, "$ZodCUID", 0, rg, "$ZodCUID2", 0, rh, "$ZodCatch", 0, iG, "$ZodCodec", 0, iV, "$ZodCreditCard", 0, rM, "$ZodCustom", 0, i4, "$ZodCustomStringFormat", 0, rq, "$ZodDate", 0, r3, "$ZodDefault", 0, ij, "$ZodDiscriminatedUnion", 0, im, "$ZodE164", 0, rR, "$ZodEmail", 0, ra, "$ZodEmoji", 0, rv, "$ZodEnum", 0, iz, "$ZodExactOptional", 0, iD, "$ZodFile", 0, iU, "$ZodFunction", 0, iY, "$ZodGUID", 0, rr, "$ZodIBAN", 0, rJ, "$ZodIPv4", 0, rS, "$ZodIPv6", 0, rU, "$ZodISODate", 0, rk, "$ZodISODateTime", 0, rI, "$ZodISODuration", 0, rx, "$ZodISOTime", 0, rw, "$ZodIntersection", 0, iv, "$ZodJWT", 0, rF, "$ZodKSUID", 0, r_, "$ZodLazy", 0, i0, "$ZodLiteral", 0, iA, "$ZodMAC", 0, rP, "$ZodMap", 0, ik, "$ZodNaN", 0, iM, "$ZodNanoID", 0, rp, "$ZodNever", 0, r2, "$ZodNonOptional", 0, iC, "$ZodNull", 0, r4, "$ZodNullable", 0, iZ, "$ZodNumber", 0, rW, "$ZodNumberFormat", 0, rK, "$ZodObject", 0, ii, "$ZodObjectJIT", 0, ia, "$ZodOptional", 0, iN, "$ZodPipe", 0, iB, "$ZodPrefault", 0, iE, "$ZodPreprocess", 0, iW, "$ZodPromise", 0, iQ, "$ZodReadonly", 0, iK, "$ZodRecord", 0, iI, "$ZodSet", 0, ix, "$ZodString", 0, rt, "$ZodStringFormat", 0, rn, "$ZodSuccess", 0, iR, "$ZodSymbol", 0, rQ, "$ZodTemplateLiteral", 0, iH, "$ZodTransform", 0, iP, "$ZodTuple", 0, ih, "$ZodType", 0, n9, "$ZodULID", 0, rb, "$ZodURL", 0, rf, "$ZodUUID", 0, ri, "$ZodUndefined", 0, r0, "$ZodUnion", 0, ic, "$ZodUnknown", 0, r6, "$ZodVoid", 0, r5, "$ZodXID", 0, ry, "$ZodXor", 0, il, "URL_BAD_FORMAT", 0, 1, "URL_UNPARSEABLE", 0, 2, "base64Charset", 0, rj, "base64urlCharset", 0, rE, "canParseURL", 0, ro, "clone", 0, Q, "getDiscriminatedOption", 0, is, "isValidBase64", 0, rZ, "isValidBase64URL", 0, rC, "isValidCIDRv6", 0, rN, "isValidCreditCard", 0, rG, "isValidIBAN", 0, rB, "isValidIPv6", 0, rA, "isValidJWT", 0, rV, "mergeValues", 0, ip, "parseURLObject", 0, ru, "standardProps", 0, re, "stripTabAndNewline", 0, rs, "urlHostnameOk", 0, rd, "urlProtocolOk", 0, rm, "validateURL", 0, rc], 628160), t.i(628160);
    class i6 extends Error {
        constructor() {
            super("Cannot parse a reference cycle that closes through a transform"), this.name = "ZodCyclicError"
        }
    }
    let i2 = "~memo",
        i5 = [];

    function i3(t) {
        return null !== t && "object" == typeof t
    }

    function i9(t) {
        return t.map(t => t.path ? {
            ...t,
            path: t.path.slice()
        } : {
            ...t
        })
    }
    let i8 = new WeakMap;

    function i7(t, n, r) {
        var i, a, o;
        let c = i8.get(t);
        if (void 0 !== c) return 2 * !!c;
        if (n.has(t)) return 2;
        n.add(t);
        let u = 0,
            l = t => {
                if (2 !== u && (null == t ? void 0 : t._zod)) {
                    let i = i7(t, n, r);
                    i > u && (u = i)
                }
            },
            s = t => {
                t > u && (u = t)
            },
            d = t._zod.def;
        switch (d.type) {
            case "object": {
                let t = N(d);
                s(t ? ((t, i) => {
                    let a = 0;
                    for (let c of Reflect.ownKeys(t)) {
                        var o;
                        let u = Object.getOwnPropertyDescriptor(t, c);
                        if (i && !u.enumerable) continue;
                        let l = u.get ? 1 : (null == (o = u.value) ? void 0 : o._zod) ? i7(u.value, n, r) : 0;
                        l > a && (a = l)
                    }
                    return a
                })(t, !0) : 1), l(d.catchall);
                break
            }
            case "array":
                l(d.element);
                break;
            case "tuple":
                for (let t of d.items) l(t);
                l(d.rest);
                break;
            case "record":
            case "map":
                l(d.keyType), l(d.valueType);
                break;
            case "set":
                l(d.valueType);
                break;
            case "union":
                for (let t of d.options) l(t);
                break;
            case "intersection":
                l(d.left), l(d.right);
                break;
            case "optional":
            case "nullable":
            case "default":
            case "prefault":
            case "catch":
            case "readonly":
            case "nonoptional":
            case "promise":
            case "success":
                l(d.innerType);
                break;
            case "pipe":
                l(d.in), l(d.out);
                break;
            case "function":
                l(d.input), l(d.output);
                break;
            case "lazy": {
                let a = null != (i = d._cachedInner) ? i : r ? t._zod.innerType : void 0;
                s(a ? i7(a, n, !1) : 1);
                break
            }
            case "template_literal":
            case "string":
            case "number":
            case "int":
            case "boolean":
            case "bigint":
            case "symbol":
            case "undefined":
            case "null":
            case "void":
            case "never":
            case "any":
            case "unknown":
            case "date":
            case "nan":
            case "enum":
            case "literal":
            case "file":
            case "transform":
            case "custom":
                break;
            default:
                for (let t in d) {
                    let n = Object.getOwnPropertyDescriptor(d, t);
                    if (!n || n.get) continue;
                    let r = n.value;
                    if (r && "object" == typeof r) {
                        if (r._zod) l(r);
                        else if (Array.isArray(r))
                            for (let t of r) l(t)
                    }
                }
        }
        return n.delete(t), a = t, 1 !== (o = u) && i8.set(a, 2 === o), o
    }

    function ae(t) {
        return 0 !== i7(t, new Set, !0)
    }
    let at = [],
        an = {
            alloc(t, n, i) {
                let a = r;
                if (!a) return i;
                r = void 0;
                let o = {
                    value: i,
                    issues: null
                };
                return a.set(n.value, o), at.push(o), i
            },
            guard(t) {
                var n;
                null != (n = t._zod).deferred || (n.deferred = []), t._zod.deferred.push(() => {
                    let n = t._zod.parse,
                        r = (t, r) => {
                            if ("backward" !== r.direction && ai(r, t.value)) throw new i6;
                            return n(t, r)
                        };
                    t._zod.parse = r, t._zod.run === n && (t._zod.run = r)
                })
            },
            attach(t) {
                var n;
                let i, a, o, c = !1;
                null != (n = t._zod).deferred || (n.deferred = []), t._zod.deferred.push(() => {
                    let n = t._zod.parse,
                        u = (l, s) => {
                            var d;
                            let m;
                            if (void 0 === i) {
                                let r = i7(t, new Set, !1);
                                if (0 === r) return t._zod.parse = n, t._zod.run === u && (t._zod.run = n), n(l, s);
                                2 === r || c ? i = !0 : c = !0
                            }
                            let f = l.value;
                            if (!i3(f)) return n(l, s);
                            let v = s[i2];
                            if (v || (v = {
                                    buckets: new WeakMap,
                                    backEdges: void 0
                                }, s[i2] = v), a === s) m = o;
                            else {
                                let n;
                                (n = (d = v).buckets.get(t)) || (n = new WeakMap, d.buckets.set(t, n)), m = n, a = s, o = m
                            }
                            let p = m.get(f);
                            if (p) return (l.value = p.value, p.issues) ? p.issues.length && l.issues.push(...i9(p.issues)) : (l.memo = !0, null != v.backEdges || (v.backEdges = new WeakSet), v.backEdges.add(p.value)), l;
                            r = m;
                            let g = at.length,
                                h = n(l, s);
                            r = void 0;
                            let b = at.length > g ? at.pop() : void 0;
                            return h instanceof Promise ? h.then(t => (b && (b.issues = t.issues.length ? i9(t.issues) : i5), t)) : (b && (b.issues = h.issues.length ? i9(h.issues) : i5), h)
                        };
                    t._zod.parse = u, t._zod.run === n && (t._zod.run = u)
                })
            }
        };

    function ar() {
        return an
    }

    function ai(t, n) {
        var r;
        let i = null == (r = t[i2]) ? void 0 : r.backEdges;
        return void 0 !== i && i3(n) && i.has(n)
    }
    t.s(["$ZodCyclicError", 0, i6, "isBackEdge", 0, ai, "isRecursiveSchema", 0, ae, "memoizer", 0, ar], 511043), t.i(511043), t.i(402171), t.i(437808);
    let aa = Symbol("ZodOutput"),
        ao = Symbol("ZodInput");
    class ac {
        add(t) {
            for (var n = arguments.length, r = Array(n > 1 ? n - 1 : 0), i = 1; i < n; i++) r[i - 1] = arguments[i];
            let a = r[0];
            return this._map.set(t, a), a && "object" == typeof a && "id" in a && this._idmap.set(a.id, t), this
        }
        clear() {
            return this._map = new WeakMap, this._idmap = new Map, this
        }
        remove(t) {
            let n = this._map.get(t);
            return n && "object" == typeof n && "id" in n && this._idmap.delete(n.id), this._map.delete(t), this
        }
        get(t) {
            let n = t._zod.parent;
            if (n) {
                var r;
                let i = {
                    ...null != (r = this.get(n)) ? r : {}
                };
                delete i.id;
                let a = {
                    ...i,
                    ...this._map.get(t)
                };
                return Object.keys(a).length ? a : void 0
            }
            return this._map.get(t)
        }
        has(t) {
            return this._map.has(t)
        }
        constructor() {
            this._map = new WeakMap, this._idmap = new Map
        }
    }

    function au() {
        return new ac
    }
    null != (eF = globalThis).__zod_globalRegistry || (eF.__zod_globalRegistry = au());
    let al = globalThis.__zod_globalRegistry;
    t.s(["$ZodRegistry", 0, ac, "$input", 0, ao, "$output", 0, aa, "globalRegistry", 0, al, "registry", 0, au], 207639), t.i(207639), t.i(990010);
    let as = Symbol.for("zod.compile.invalid"),
        ad = Symbol.for("zod.compile.fallback");
    class am extends Error {
        constructor(t = "z.compile does not support async refinements, transforms, or checks") {
            super(t), this.name = "ZodCompileAsyncError"
        }
    }
    class af extends Error {
        constructor(t, n = !0) {
            super("z.compile does not support ".concat(t, "; this schema must use the runtime parser")), this.name = "ZodCompileUnsupportedError", this.islandable = n
        }
    }

    function av(t, n) {
        try {
            let n = ag(t),
                r = ap(t, n);
            return r._zod.bag.validator = function(t, n) {
                try {
                    return ag(t, {
                        assertOnly: !0
                    })
                } catch (t) {
                    return n
                }
            }(t, n), r
        } catch (r) {
            if (null == n ? void 0 : n.strict) throw r;
            return t
        }
    }

    function ap(t, n) {
        var r;
        if (ae(t)) throw new af("a schema whose subtree contains a reference cycle");
        let i = Q(t),
            a = t._zod.run,
            o = null != (r = a.__originalRun) ? r : a,
            c = (t, r) => {
                if ((null == r ? void 0 : r.async) || (null == r ? void 0 : r.direction) === "backward" || (null == r ? void 0 : r.skipChecks) || (null == r ? void 0 : r[ad]) || r && ai(r, t.value)) return o(t, r);
                let i = n(t.value);
                return i !== as ? (t.value = i, t) : (r && (r[ad] = !0), o(t, r))
            };
        return c.__originalRun = o, i._zod.bag.fallbackRun = o, i._zod.bag.validator = n, i._zod.run = c, a.__originalRun || function(t, n, r) {
            if ("function" == typeof n.safeParse) {
                let i = n.safeParse;
                t.safeParse = (t, n) => {
                    let a = r(t);
                    return a !== as ? {
                        success: !0,
                        data: a
                    } : i(t, n)
                }
            }
            if ("function" == typeof n.parse) {
                let i = n.parse;
                t.parse = (t, n) => {
                    let a = r(t);
                    return a !== as ? a : i(t, n)
                }
            }
        }(i, t, n), i
    }

    function ag(t, n) {
        let r, i = !0;
        try {
            i = ae(t)
        } catch (t) {}
        if (i) throw new af("a schema whose subtree contains a reference cycle");
        let a = {
                constants: new Map,
                constantCounter: 0,
                varCounter: 0,
                definite: !0
            },
            o = new n5(["input"]),
            c = aN(o, a, t, "input", !(null == n ? void 0 : n.assertOnly));
        o.write(null === c ? "return true;" : "return ".concat(c, ";"));
        let u = ["INVALID", ...a.constants.keys()],
            l = [as, ...a.constants.values()],
            s = o.content.join("\n"),
            d = (null == n ? void 0 : n.debug) ? u.length > 0 ? "// Constants: ".concat(u.join(", "), "\n").concat(s) : s : "",
            m = Function;
        try {
            r = new m(...u, "return (input) => {\n".concat(s, "\n}"))(...l)
        } catch (t) {
            throw new af("this schema (generated code failed to evaluate: ".concat(t.message, ")"))
        }
        return (null == n ? void 0 : n.debug) && (r.code = d), r.definite = a.definite, r
    }

    function ah(t, n) {
        for (let [r, i] of t.constants)
            if (i === n) return r;
        let r = "c".concat(t.constantCounter++);
        return t.constants.set(r, n), r
    }

    function ab(t, n) {
        return t.definite = !1, ah(t, n)
    }

    function ay(t) {
        return "v".concat(t.varCounter++)
    }

    function a_(t, n) {
        let r = t._zod.run({
            value: n,
            issues: []
        }, {});
        return r && "function" == typeof r.then ? as : 0 === r.issues.length ? r.value : as
    }

    function aI(t, n, r, i) {
        let a = !(arguments.length > 4) || void 0 === arguments[4] || arguments[4],
            o = t.content.length,
            c = n.constants.size,
            u = n.constantCounter,
            l = n.varCounter;
        try {
            return aN(t, n, r, i, a)
        } catch (g) {
            var s, d, m, f;
            let a, v, p;
            if (!(g instanceof af) || !g.islandable) throw g;
            if (t.content.length = o, n.constants.size > c)
                for (let t of Array.from(n.constants.keys()).slice(c)) n.constants.delete(t);
            return n.constantCounter = u, n.varCounter = l, s = t, d = n, m = r, f = i, d.definite = !1, a = ah(d, m), v = ah(d, a_), p = ay(d), s.write("const ".concat(p, " = ").concat(v, "(").concat(a, ", ").concat(f, ");")), s.write("if (".concat(p, " === INVALID) return INVALID;")), p
        }
    }
    let ak = new Set(["max_size", "min_size", "size_equals", "max_length", "min_length", "length_equals"]);

    function aw(t, n, r, i) {
        let a = ah(n, ew),
            o = ay(n);
        return t.write("const ".concat(o, " = typeof ").concat(r, ' === "string" && ').concat(i, " ? ").concat(a, "(").concat(r, ") : ").concat(r, ".length;")), o
    }

    function ax(t, n) {
        if ("number" != typeof t || !Number.isFinite(t)) throw new af("".concat(n, " bound of type ").concat(typeof t));
        return "".concat(t)
    }

    function aS(t, n) {
        if ("bigint" == typeof n) return "".concat(n, "n");
        if ("number" == typeof n) {
            if (Number.isNaN(n)) throw new af("comparison check with NaN bound");
            return "".concat(n)
        }
        if (n instanceof Date) {
            if (Number.isNaN(n.getTime())) throw new af("comparison check with Invalid Date bound");
            return ah(t, n)
        }
        throw new af("comparison check bound of type ".concat(typeof n))
    }

    function az(t, n, r) {
        let i = n.format;
        switch (i) {
            case "safeint":
                t.write("if (!Number.isSafeInteger(".concat(r, ")) return INVALID;"));
                break;
            case "int32":
                t.write("if (!Number.isInteger(".concat(r, ") || ").concat(r, " < -2147483648 || ").concat(r, " > 2147483647) return INVALID;"));
                break;
            case "uint32":
                t.write("if (!Number.isInteger(".concat(r, ") || ").concat(r, " < 0 || ").concat(r, " > 4294967295) return INVALID;"));
                break;
            case "float32":
                t.write("if (!Number.isFinite(".concat(r, ") || ").concat(r, " < -3.4028234663852886e38 || ").concat(r, " > 3.4028234663852886e38) return INVALID;"));
                break;
            case "float64":
                t.write("if (!Number.isFinite(".concat(r, ")) return INVALID;"));
                break;
            default:
                throw new af("number format ".concat(i))
        }
    }

    function aA() {
        throw new l
    }

    function aU(t) {
        this.issues.push(t)
    }
    let aP = new Set(["cidrv4", "cuid", "cuid2", "date", "datetime", "duration", "e164", "email", "emoji", "ends_with", "guid", "includes", "ipv4", "ksuid", "lowercase", "mac", "nanoid", "regex", "starts_with", "time", "ulid", "uppercase", "uuid", "xid"]);

    function aO(t, n, r, i) {
        let a = !(arguments.length > 4) || void 0 === arguments[4] || arguments[4],
            o = r.format;
        if ("base64" === o) {
            let r = ah(n, rZ);
            return t.write("if (!".concat(r, "(").concat(i, ")) return INVALID;")), i
        }
        if ("base64url" === o) {
            let r = ah(n, rC);
            return t.write("if (!".concat(r, "(").concat(i, ")) return INVALID;")), i
        }
        if ("jwt" === o) {
            var c;
            let a = ah(n, rV),
                o = ah(n, null != (c = r.alg) ? c : null);
            return t.write("if (!".concat(a, "(").concat(i, ", ").concat(o, ")) return INVALID;")), i
        }
        if ("ipv6" === o) {
            let r = ah(n, rA);
            return t.write("if (!".concat(r, "(").concat(i, ")) return INVALID;")), i
        }
        if ("cidrv6" === o) {
            let r = ah(n, rN);
            return t.write("if (!".concat(r, "(").concat(i, ")) return INVALID;")), i
        }
        if ("credit_card" === o) {
            let r = ah(n, rG);
            return t.write("if (!".concat(r, "(").concat(i, ")) return INVALID;")), i
        }
        if ("iban" === o) {
            let r = ah(n, rB);
            return t.write("if (!".concat(r, "(").concat(i, ")) return INVALID;")), i
        }
        if ("url" === o || "httpurl" === o || r.normalize || void 0 !== r.hostname || void 0 !== r.protocol) {
            let o = ah(n, rc),
                c = ah(n, r),
                u = ay(n),
                l = ay(n);
            if (t.write("const ".concat(u, " = ").concat(i, ".trim();")), t.write("const ".concat(l, " = ").concat(o, "(").concat(u, ", ").concat(c, ");")), t.write("if (typeof ".concat(l, ' === "number") return INVALID;')), void 0 !== r.hostname) {
                let r = ah(n, rd);
                t.write("if (!".concat(r, "(").concat(l, ", ").concat(c, ".hostname)) return INVALID;"))
            }
            if (void 0 !== r.protocol) {
                let r = ah(n, rm);
                t.write("if (!".concat(r, "(").concat(l, ", ").concat(c, ".protocol)) return INVALID;"))
            }
            if (!a) return null;
            let s = ay(n),
                d = r.normalize ? "".concat(l, ".href") : "".concat(ah(n, rs), "(").concat(u, ")");
            return t.write("const ".concat(s, " = ").concat(d, ";")), s
        }
        let u = r.fn;
        if (u) {
            if (aC(u)) throw new af("async string format ".concat(o));
            let r = ah(n, u);
            return t.write("if (!".concat(r, "(").concat(i, ")) return INVALID;")), i
        }
        if (aP.has(o) && r.pattern) {
            let a = ah(n, r.pattern);
            return t.write("".concat(a, ".lastIndex = 0;")), t.write("if (!".concat(a, ".test(").concat(i, ")) return INVALID;")), i
        }
        let l = r.format;
        switch (l) {
            case "regex":
                throw new af("regex format without a pattern");
            case "lowercase":
                t.write("if (".concat(i, " !== ").concat(i, ".toLowerCase()) return INVALID;"));
                break;
            case "uppercase":
                t.write("if (".concat(i, " !== ").concat(i, ".toUpperCase()) return INVALID;"));
                break;
            case "includes":
                t.write("if (!".concat(i, ".includes(").concat(G(r.includes), ")) return INVALID;"));
                break;
            case "starts_with": {
                let n = r.prefix;
                t.write("if (".concat(i, ".slice(0, ").concat(n.length, ") !== ").concat(G(n), ") return INVALID;"));
                break
            }
            case "ends_with": {
                let n = r.suffix;
                t.write("if (".concat(i, ".slice(-").concat(n.length, ") !== ").concat(G(n), ") return INVALID;"));
                break
            }
            default:
                throw new af("string format ".concat(l))
        }
        return i
    }

    function aN(t, n, r, i) {
        var a, o, c, u, l, s, d, m, f, v, p, g, h, b, y, _, I, k, w, x, S, A, U, P, O, N, D, Z, j, T, E, C, $, R, L, M, B, J, V, W;
        let K, X = !(arguments.length > 4) || void 0 === arguments[4] || arguments[4],
            H = r._zod.def,
            Y = H.type;
        if (H.coerce) throw new af("coercion (z.coerce.".concat(Y, "())"));
        let Q = X || !!(null == (a = H.checks) ? void 0 : a.length);
        switch (Y) {
            case "string":
                K = function(t, n, r, i) {
                    let a = !(arguments.length > 4) || void 0 === arguments[4] || arguments[4];
                    t.write("if (typeof ".concat(i, ' !== "string") return INVALID;'));
                    let o = r._zod.def;
                    return void 0 === o.format ? i : aO(t, n, o, i, a)
                }(t, n, r, i, Q);
                break;
            case "number":
                let ee;
                o = t, c = r, u = i, o.write("if (typeof ".concat(u, ' !== "number" || !Number.isFinite(').concat(u, ")) return INVALID;")), "number_format" === (ee = c._zod.def).check && ee.format && az(o, {
                    format: ee.format
                }, u), K = u;
                break;
            case "boolean":
                l = t, s = i, l.write("if (typeof ".concat(s, ' !== "boolean") return INVALID;')), K = s;
                break;
            case "bigint":
                K = function(t, n, r) {
                    t.write("if (typeof ".concat(r, ' !== "bigint") return INVALID;'));
                    let i = n._zod.def;
                    if (i.format) switch (i.format) {
                        case "int64":
                            t.write("if (".concat(r, " < -9223372036854775808n || ").concat(r, " > 9223372036854775807n) return INVALID;"));
                            break;
                        case "uint64":
                            t.write("if (".concat(r, " < 0n || ").concat(r, " > 18446744073709551615n) return INVALID;"))
                    }
                    return r
                }(t, r, i);
                break;
            case "symbol":
                d = t, m = i, d.write("if (typeof ".concat(m, ' !== "symbol") return INVALID;')), K = m;
                break;
            case "undefined":
                f = t, v = i, f.write("if (".concat(v, " !== undefined) return INVALID;")), K = v;
                break;
            case "null":
                p = t, g = i, p.write("if (".concat(g, " !== null) return INVALID;")), K = g;
                break;
            case "any":
            case "unknown":
                K = i;
                break;
            case "never":
                t.write("return INVALID;"), K = i;
                break;
            case "void":
                h = t, b = i, h.write("if (".concat(b, " !== undefined) return INVALID;")), K = b;
                break;
            case "nan":
                y = t, _ = i, y.write("if (typeof ".concat(_, ' !== "number" || !Number.isNaN(').concat(_, ")) return INVALID;")), K = _;
                break;
            case "date":
                I = t, k = i, I.write("if (!(".concat(k, " instanceof Date) || Number.isNaN(").concat(k, ".getTime())) return INVALID;")), K = k;
                break;
            case "object":
                K = function(t, n, r, i) {
                    var a, o;
                    let c = !(arguments.length > 4) || void 0 === arguments[4] || arguments[4],
                        u = r._zod.def;
                    t.write("if (typeof ".concat(i, ' !== "object" || ').concat(i, " === null || Array.isArray(").concat(i, ")) return INVALID;"));
                    let l = u.shape,
                        s = Object.keys(l),
                        d = Object.getOwnPropertySymbols(l),
                        m = d.length ? [...s, ...d] : s,
                        f = t => "symbol" == typeof t ? ah(n, t) : G(t);
                    if (s.includes("__proto__")) throw new af('object shape key "__proto__"');
                    let v = new Map;
                    for (let r of m) {
                        let o = l[r],
                            u = f(r),
                            s = ay(n);
                        if (t.write("const ".concat(s, " = ").concat(i, "[").concat(u, "];")), void 0 !== o._zod.optin) {
                            let a = ay(n);
                            t.write("let ".concat(a, " = (() => {")), t.indented(t => {
                                let r = aI(t, n, o, s);
                                t.write("return ".concat(r, ";"))
                            }), t.write("})();"), "optional" === o._zod.optout ? (t.write("if (".concat(a, " === INVALID) {")), t.indented(t => {
                                t.write("if (".concat(u, " in ").concat(i, ") return INVALID;")), t.write("".concat(a, " = undefined;"))
                            }), t.write("}")) : t.write("if (".concat(a, " === INVALID) return INVALID;")), v.set(r, a)
                        } else {
                            void 0 === (a = o)._zod.optin && function t(n) {
                                var r, i;
                                if (n._zod.def.coerce) return !0;
                                let a = n._zod.def;
                                switch (a.type) {
                                    case "any":
                                    case "unknown":
                                    case "undefined":
                                    case "void":
                                    case "default":
                                    case "prefault":
                                    case "transform":
                                    case "custom":
                                    case "lazy":
                                    case "catch":
                                    default:
                                        return !0;
                                    case "string":
                                    case "number":
                                    case "boolean":
                                    case "bigint":
                                    case "symbol":
                                    case "null":
                                    case "never":
                                    case "nan":
                                    case "date":
                                    case "object":
                                    case "array":
                                    case "tuple":
                                    case "record":
                                    case "map":
                                    case "set":
                                    case "file":
                                    case "template_literal":
                                        return !1;
                                    case "nonoptional":
                                        return !!a.innerType && t(a.innerType);
                                    case "literal":
                                        return !!(null == (r = a.values) ? void 0 : r.includes(void 0));
                                    case "enum":
                                        return !!(null == (i = n._zod.values) ? void 0 : i.has(void 0));
                                    case "optional":
                                    case "nullable":
                                    case "readonly":
                                    case "success":
                                        return !a.innerType || t(a.innerType);
                                    case "union":
                                        return !a.options || a.options.some(t);
                                    case "intersection":
                                        if (!a.left || !a.right) return !0;
                                        return t(a.left) && t(a.right);
                                    case "pipe":
                                        return !a.in || t(a.in)
                                }
                            }(a) && t.write("if (!(".concat(u, " in ").concat(i, ")) return INVALID;"));
                            let l = aI(t, n, o, s, c);
                            null !== l && v.set(r, l)
                        }
                    }
                    let p = u.catchall,
                        g = "none";
                    if (p) {
                        let n = p._zod.def.type;
                        if ("never" === n) {
                            let n = s.map(t => "k !== ".concat(G(t))).join(" && ") || "true";
                            t.write("for (const k in ".concat(i, ") {")), t.indented(t => {
                                t.write("if (".concat(n, ") return INVALID;"))
                            }), t.write("}")
                        } else g = "unknown" !== n && "any" !== n || (null == (o = p._zod.def.checks) ? void 0 : o.length) ? "schema" : "passthrough"
                    }
                    let h = ay(n),
                        b = m.some(t => aZ(l[t]) || aD(l[t]));
                    if (!c) {
                        if ("schema" === g) {
                            let r = s.length > 0 ? ah(n, new Set(s)) : null;
                            t.write("for (const k in ".concat(i, ") {")), t.indented(t => {
                                t.write('if (k === "__proto__") continue;'), r && t.write("if (".concat(r, ".has(k)) continue;"));
                                let a = ay(n);
                                t.write("const ".concat(a, " = ").concat(i, "[k];")), aI(t, n, p, a, !1)
                            }), t.write("}")
                        }
                        return null
                    }
                    if (b)
                        for (let n of (t.write("const ".concat(h, " = {};")), m)) {
                            let r = f(n),
                                a = v.get(n);
                            aD(l[n]) ? t.write("if (".concat(r, " in ").concat(i, ") ").concat(h, "[").concat(r, "] = ").concat(a, ";")) : aZ(l[n]) ? t.write("if (".concat(a, " !== undefined || ").concat(r, " in ").concat(i, ") ").concat(h, "[").concat(r, "] = ").concat(a, ";")) : t.write("".concat(h, "[").concat(r, "] = ").concat(a, ";"))
                        } else {
                            let n = m.map(t => "".concat("symbol" == typeof t ? "[".concat(f(t), "]") : G(t), ": ").concat(v.get(t))).join(", ");
                            t.write("const ".concat(h, " = { ").concat(n, " };"))
                        }
                    if ("none" !== g) {
                        let r = s.length > 0 ? ah(n, new Set(s)) : null;
                        t.write("for (const k in ".concat(i, ") {")), t.indented(t => {
                            if (t.write('if (k === "__proto__") continue;'), r && t.write("if (".concat(r, ".has(k)) continue;")), "passthrough" === g) t.write("".concat(h, "[k] = ").concat(i, "[k];"));
                            else {
                                let r = ay(n);
                                t.write("const ".concat(r, " = ").concat(i, "[k];"));
                                let a = aI(t, n, p, r);
                                t.write("".concat(h, "[k] = ").concat(a, ";"))
                            }
                        }), t.write("}")
                    }
                    return h
                }(t, n, r, i, Q);
                break;
            case "optional":
                K = function(t, n, r, i) {
                    var a;
                    let o = !(arguments.length > 4) || void 0 === arguments[4] || arguments[4],
                        c = r._zod.def;
                    if ((null == (a = r._zod.traits) ? void 0 : a.has("$ZodExactOptional")) === !0) return aN(t, n, c.innerType, i, o);
                    if ("defaulted" === c.innerType._zod.optin) {
                        let r = ay(n),
                            a = ay(n);
                        return t.write("let ".concat(r, ";")), t.write("if (".concat(i, " === undefined) {")), t.indented(t => {
                            t.write("const ".concat(a, " = (() => {")), t.indented(t => {
                                let r = aN(t, n, c.innerType, i);
                                t.write("return ".concat(r, ";"))
                            }), t.write("})();"), t.write("if (".concat(a, " !== INVALID) ").concat(r, " = ").concat(a, ";"))
                        }), t.write("} else {"), t.indented(t => {
                            let a = aN(t, n, c.innerType, i);
                            t.write("".concat(r, " = ").concat(a, ";"))
                        }), t.write("}"), r
                    }
                    let u = o ? ay(n) : null;
                    return u && t.write("let ".concat(u, ";")), t.write("if (".concat(i, " !== undefined) {")), t.indented(t => {
                        let r = aN(t, n, c.innerType, i, o);
                        u && null !== r && t.write("".concat(u, " = ").concat(r, ";"))
                    }), t.write("}"), u
                }(t, n, r, i, Q);
                break;
            case "nullable":
                K = function(t, n, r, i) {
                    let a = !(arguments.length > 4) || void 0 === arguments[4] || arguments[4],
                        o = r._zod.def,
                        c = a ? ay(n) : null;
                    return c && t.write("let ".concat(c, " = null;")), t.write("if (".concat(i, " !== null) {")), t.indented(t => {
                        let r = aN(t, n, o.innerType, i, a);
                        c && null !== r && t.write("".concat(c, " = ").concat(r, ";"))
                    }), t.write("}"), c
                }(t, n, r, i, Q);
                break;
            case "array":
                K = function(t, n, r, i) {
                    let a = !(arguments.length > 4) || void 0 === arguments[4] || arguments[4],
                        o = r._zod.def;
                    t.write("if (!Array.isArray(".concat(i, ")) return INVALID;"));
                    let c = a ? ay(n) : null,
                        u = ay(n),
                        l = ay(n);
                    return c && t.write("const ".concat(c, " = new Array(").concat(i, ".length);")), t.write("for (let ".concat(u, " = 0; ").concat(u, " < ").concat(i, ".length; ").concat(u, "++) {")), t.indented(t => {
                        t.write("const ".concat(l, " = ").concat(i, "[").concat(u, "];"));
                        let r = aI(t, n, o.element, l, a);
                        c && null !== r && t.write("".concat(c, "[").concat(u, "] = ").concat(r, ";"))
                    }), t.write("}"), c
                }(t, n, r, i, Q);
                break;
            case "literal":
                K = function(t, n, r, i) {
                    let a = r._zod.def.values;
                    if (1 !== a.length) {
                        let r = ah(n, new Set(a));
                        return t.write("if (!".concat(r, ".has(").concat(i, ")) return INVALID;")), i
                    }
                    let o = a[0];
                    if ("number" == typeof o && Number.isNaN(o)) {
                        let r = ah(n, new Set(a));
                        return t.write("if (!".concat(r, ".has(").concat(i, ")) return INVALID;")), i
                    }
                    if ("string" == typeof o) t.write("if (".concat(i, " !== ").concat(G(o), ") return INVALID;"));
                    else if ("number" == typeof o || "boolean" == typeof o) t.write("if (".concat(i, " !== ").concat(o, ") return INVALID;"));
                    else if (null === o) t.write("if (".concat(i, " !== null) return INVALID;"));
                    else if (void 0 === o) t.write("if (".concat(i, " !== undefined) return INVALID;"));
                    else if ("bigint" == typeof o) t.write("if (".concat(i, " !== ").concat(o, "n) return INVALID;"));
                    else throw new af("literal type ".concat(typeof o));
                    return i
                }(t, n, r, i);
                break;
            case "enum":
                K = function(t, n, r, i) {
                    let a = r._zod.values;
                    if (!a) throw new af("enum schema without enumerated values");
                    let o = ah(n, a);
                    return t.write("if (!".concat(o, ".has(").concat(i, ")) return INVALID;")), i
                }(t, n, r, i);
                break;
            case "readonly": {
                let a = aj(t, n, r, i),
                    o = ay(n);
                t.write("const ".concat(o, " = Object.freeze(").concat(a, ");")), K = o;
                break
            }
            case "success":
                aj(t, n, r, i), K = "true";
                break;
            case "default":
            case "prefault":
                K = function(t, n, r, i) {
                    let a = r._zod.def,
                        o = Object.getOwnPropertyDescriptor(r._zod.def, "defaultValue") ? () => r._zod.def.defaultValue : void 0;
                    if ("prefault" === r._zod.def.type) {
                        if (!o) return aN(t, n, a.innerType, i);
                        let r = ah(n, o),
                            c = ay(n);
                        return t.write("let ".concat(c, " = ").concat(i, ";")), t.write("if (".concat(i, " === undefined) ").concat(c, " = ").concat(r, "();")), aN(t, n, a.innerType, c)
                    }
                    let c = ay(n);
                    if (o) {
                        let r = ah(n, o),
                            u = ah(n, q);
                        t.write("let ".concat(c, ";")), t.write("if (".concat(i, " === undefined) {")), t.indented(t => {
                            t.write("".concat(c, " = ").concat(u, "(").concat(r, "());"))
                        }), t.write("} else {"), t.indented(t => {
                            let o = aN(t, n, a.innerType, i);
                            t.write("".concat(c, " = ").concat(o, " === undefined ? ").concat(u, "(").concat(r, "()) : ").concat(o, ";"))
                        }), t.write("}")
                    } else t.write("let ".concat(c, ";")), t.write("if (".concat(i, " !== undefined) {")), t.indented(t => {
                        let r = aN(t, n, a.innerType, i);
                        t.write("".concat(c, " = ").concat(r, ";"))
                    }), t.write("}");
                    return c
                }(t, n, r, i);
                break;
            case "nonoptional":
                let et, en;
                w = t, x = n, S = r, A = i, et = aN(w, x, S._zod.def.innerType, A), en = ay(x), w.write("const ".concat(en, " = ").concat(et, ";")), w.write("if (".concat(en, " === undefined) return INVALID;")), K = en;
                break;
            case "tuple":
                K = function(t, n, r, i) {
                    let a = r._zod.def,
                        o = a.items,
                        c = a.rest;
                    t.write("if (!Array.isArray(".concat(i, ")) return INVALID;"));
                    let u = aT(o, "optin"),
                        l = aT(o, "optout");
                    c ? t.write("if (".concat(i, ".length < ").concat(u, ") return INVALID;")) : t.write("if (".concat(i, ".length < ").concat(u, " || ").concat(i, ".length > ").concat(o.length, ") return INVALID;"));
                    let s = ay(n);
                    t.write("const ".concat(s, " = [];"));
                    for (let r = 0; r < o.length; r++) {
                        let a = o[r];
                        if (r >= l) t.write("if (".concat(s, ".length === ").concat(r, ") {")), t.indented(t => {
                            t.write("if (".concat(r, " < ").concat(i, ".length) {")), t.indented(t => {
                                let o = ay(n);
                                t.write("const ".concat(o, " = ").concat(i, "[").concat(r, "];"));
                                let c = aI(t, n, a, o);
                                t.write("".concat(s, "[").concat(r, "] = ").concat(c, ";"))
                            }), t.write("} else {"), t.indented(t => {
                                if (aD(a)) return void t.write("".concat(s, ".length = ").concat(r, ";"));
                                let i = ay(n),
                                    o = ay(n);
                                t.write("const ".concat(i, " = undefined;")), t.write("const ".concat(o, " = (() => {")), t.indented(t => {
                                    let r = aI(t, n, a, i);
                                    t.write("return ".concat(r, ";"))
                                }), t.write("})();"), t.write("if (".concat(o, " === INVALID || ").concat(o, " === undefined) ").concat(s, ".length = ").concat(r, ";")), t.write("else ".concat(s, "[").concat(r, "] = ").concat(o, ";"))
                            }), t.write("}")
                        }), t.write("}");
                        else {
                            let o = ay(n);
                            t.write("const ".concat(o, " = ").concat(i, "[").concat(r, "];"));
                            let c = aI(t, n, a, o);
                            t.write("".concat(s, "[").concat(r, "] = ").concat(c, ";"))
                        }
                    }
                    if (c) {
                        let r = ay(n),
                            a = ay(n);
                        t.write("for (let ".concat(r, " = ").concat(o.length, "; ").concat(r, " < ").concat(i, ".length; ").concat(r, "++) {")), t.indented(t => {
                            t.write("const ".concat(a, " = ").concat(i, "[").concat(r, "];"));
                            let o = aI(t, n, c, a);
                            t.write("".concat(s, "[").concat(r, "] = ").concat(o, ";"))
                        }), t.write("}")
                    }
                    return s
                }(t, n, r, i);
                break;
            case "union":
                K = function(t, n, r, i) {
                    let a = r._zod.def,
                        o = a.options;
                    if (a.discriminator) return function(t, n, r, i) {
                        if (r.unionFallback) throw new af("discriminated union with unionFallback");
                        if (0 === r.options.length) return t.write("return INVALID;"), i;
                        let a = ay(n),
                            o = ay(n);
                        t.write("const ".concat(a, " = ").concat(i, "?.[").concat(G(r.discriminator), "];")), t.write("let ".concat(o, ";"));
                        let c = !0,
                            u = new Set;
                        for (let s of r.options) {
                            var l;
                            let d = null == (l = s._zod.propValues) ? void 0 : l[r.discriminator];
                            if (!d || 0 === d.size) throw new af("discriminated union option without static discriminator values");
                            for (let t of d) {
                                if (u.has(t)) throw new af("duplicate discriminator value ".concat(String(t)));
                                u.add(t)
                            }
                            let m = Array.from(d, t => (function(t, n, r) {
                                    if ("string" == typeof r) return "".concat(n, " === ").concat(G(r));
                                    if ("number" == typeof r) return Number.isNaN(r) ? "Number.isNaN(".concat(n, ")") : "".concat(n, " === ").concat(r);
                                    if ("boolean" == typeof r) return "".concat(n, " === ").concat(r);
                                    if (null === r) return "".concat(n, " === null");
                                    if (void 0 === r) return "".concat(n, " === undefined");
                                    if ("bigint" == typeof r) return "".concat(n, " === ").concat(r, "n");
                                    if ("symbol" == typeof r) {
                                        let i = ah(t, r);
                                        return "".concat(n, " === ").concat(i)
                                    }
                                    throw new af("literal discriminator value ".concat(String(r)))
                                })(n, a, t)),
                                f = c ? "if" : "else if";
                            t.write("".concat(f, " (").concat(m.join(" || "), ") {")), t.indented(t => {
                                let r = aN(t, n, s, i);
                                t.write("".concat(o, " = ").concat(r, ";"))
                            }), t.write("}"), c = !1
                        }
                        return t.write("else { return INVALID; }"), o
                    }(t, n, a, i);
                    if (!1 === a.inclusive) throw new af("exclusive unions (z.xor)");
                    if (0 === o.length) return t.write("return INVALID;"), i;
                    if (1 === o.length) return aN(t, n, o[0], i);
                    if (o.every(t => {
                            var n;
                            return "literal" === t._zod.def.type && !(null == (n = t._zod.def.checks) ? void 0 : n.length)
                        })) {
                        let r = ah(n, new Set(o.flatMap(t => t._zod.def.values)));
                        return t.write("if (!".concat(r, ".has(").concat(i, ")) return INVALID;")), i
                    }
                    let c = ay(n);
                    t.write("let ".concat(c, ";"));
                    for (let r = 0; r < o.length; r++) {
                        let a = o[r];
                        0 === r ? t.write("".concat(c, " = (() => {")) : t.write("if (".concat(c, " === INVALID) ").concat(c, " = (() => {")), t.indented(t => {
                            let r = aN(t, n, a, i);
                            t.write("return ".concat(r, ";"))
                        }), t.write("})();")
                    }
                    return t.write("if (".concat(c, " === INVALID) return INVALID;")), c
                }(t, n, r, i);
                break;
            case "intersection":
                let er, ei, ea, eo, ec;
                U = t, P = n, O = r, N = i, er = O._zod.def, P.definite = !1, ei = aI(U, P, er.left, N), ea = aI(U, P, er.right, N), eo = ah(P, ip), ec = ay(P), U.write("const ".concat(ec, " = ").concat(eo, "(").concat(ei, ", ").concat(ea, ");")), U.write("if (!".concat(ec, ".valid) return INVALID;")), K = "".concat(ec, ".data");
                break;
            case "record":
                K = function(t, n, r, i) {
                    var a, o, c, u;
                    let l = r._zod.def,
                        s = ah(n, F);
                    t.write("if (!".concat(s, "(").concat(i, ")) return INVALID;"));
                    let d = ay(n),
                        m = ay(n),
                        f = ay(n);
                    t.write("const ".concat(d, " = {};"));
                    let v = l.partial ? void 0 : l.keyType._zod.values;
                    if (v) {
                        let r = [];
                        for (let a of v) {
                            if ("string" != typeof a && "number" != typeof a && "symbol" != typeof a) throw new af("record key value ".concat(String(a)));
                            let o = "number" == typeof a ? a.toString() : a;
                            if ("__proto__" === o) throw new af('record key "__proto__"');
                            r.push(o);
                            let s = ah(n, a),
                                m = aN(t, n, l.keyType, s),
                                f = ay(n);
                            t.write("const ".concat(f, " = ").concat(i, "[").concat((c = n, "string" == typeof(u = o) ? G(u) : ah(c, u)), "];"));
                            let v = aI(t, n, l.valueType, f);
                            t.write("".concat(d, "[").concat(m, "] = ").concat(v, ";"))
                        }
                        let a = ah(n, new Set(r));
                        return t.write("for (const ".concat(m, " in ").concat(i, ") {")), t.indented(t => {
                            t.write("if (".concat(a, ".has(").concat(m, ")) continue;")), "loose" === l.mode ? t.write("if (".concat(m, ' !== "__proto__") ').concat(d, "[").concat(m, "] = ").concat(i, "[").concat(m, "];")) : t.write("return INVALID;")
                        }), t.write("}"), d
                    }
                    let p = l.keyType._zod.def;
                    if (!("string" === p.type && void 0 === p.format && !p.coerce && (null != (a = null == (o = p.checks) ? void 0 : o.length) ? a : 0) === 0)) {
                        let r = "loose" === l.mode,
                            a = ag(l.keyType);
                        !1 === a.definite && (n.definite = !1);
                        let o = ah(n, a),
                            c = ah(n, tx),
                            u = ay(n);
                        return aE(t, n, i, m, t => {
                            t.write("let ".concat(u, " = ").concat(o, "(").concat(m, ");")), t.write("if (".concat(u, " === INVALID && typeof ").concat(m, ' === "string" && ').concat(c, ".test(").concat(m, ")) ").concat(u, " = ").concat(o, "(Number(").concat(m, "));")), r ? t.write("if (".concat(u, " === INVALID) { ").concat(d, "[").concat(m, "] = ").concat(i, "[").concat(m, "]; continue; }")) : t.write("if (".concat(u, " === INVALID) return INVALID;")), t.write("if (".concat(u, ' === "__proto__") continue;'));
                            let a = ay(n);
                            t.write("const ".concat(a, " = ").concat(i, "[").concat(m, "];"));
                            let s = aI(t, n, l.valueType, a);
                            t.write("".concat(d, "[").concat(u, "] = ").concat(s, ";"))
                        }), d
                    }
                    return aE(t, n, i, m, t => {
                        t.write("const ".concat(f, " = ").concat(i, "[").concat(m, "];"));
                        let r = aI(t, n, l.valueType, f);
                        t.write("".concat(d, "[").concat(m, "] = ").concat(r, ";"))
                    }, "return INVALID;"), d
                }(t, n, r, i);
                break;
            case "map":
                let eu, el, es, ed;
                D = t, Z = n, j = r, T = i, eu = j._zod.def, D.write("if (!(".concat(T, " instanceof Map)) return INVALID;")), el = ay(Z), es = ay(Z), ed = ay(Z), D.write("const ".concat(el, " = new Map();")), D.write("for (const [".concat(es, ", ").concat(ed, "] of ").concat(T, ") {")), D.indented(t => {
                    let n = aN(t, Z, eu.keyType, es),
                        r = aN(t, Z, eu.valueType, ed);
                    t.write("".concat(el, ".set(").concat(n, ", ").concat(r, ");"))
                }), D.write("}"), K = el;
                break;
            case "set":
                let em, ef, ev;
                E = t, C = n, $ = r, R = i, em = $._zod.def, E.write("if (!(".concat(R, " instanceof Set)) return INVALID;")), ef = ay(C), ev = ay(C), E.write("const ".concat(ef, " = new Set();")), E.write("for (const ".concat(ev, " of ").concat(R, ") {")), E.indented(t => {
                    let n = aN(t, C, em.valueType, ev);
                    t.write("".concat(ef, ".add(").concat(n, ");"))
                }), E.write("}"), K = ef;
                break;
            case "file":
                L = t, M = i, L.write("if (!(".concat(M, " instanceof File)) return INVALID;")), K = M;
                break;
            case "template_literal":
                K = function(t, n, r, i) {
                    t.write("if (typeof ".concat(i, ' !== "string") return INVALID;'));
                    let a = r._zod.pattern;
                    if (a) {
                        let r = ah(n, a);
                        t.write("".concat(r, ".lastIndex = 0;")), t.write("if (!".concat(r, ".test(").concat(i, ")) return INVALID;"))
                    }
                    return i
                }(t, n, r, i);
                break;
            case "lazy":
                let ep, eg, eh;
                B = t, J = n, V = r, W = i, ep = ab(J, V._zod.def.getter), eg = ah(J, {
                    parser: null
                }), B.write("if (!".concat(eg, ".parser) {")), B.indented(t => {
                    t.write("const inner = ".concat(ep, "();")), t.write("".concat(eg, ".parser = function(input) {")), t.indented(t => {
                        t.write("const result = inner._zod.run({ value: input, issues: [] }, {});"), t.write("return result.issues.length === 0 ? result.value : INVALID;")
                    }), t.write("};")
                }), B.write("}"), eh = ay(J), B.write("const ".concat(eh, " = ").concat(eg, ".parser(").concat(W, ");")), B.write("if (".concat(eh, " === INVALID) return INVALID;")), K = eh;
                break;
            case "pipe":
                K = function(t, n, r, i) {
                    let a = r._zod.def,
                        o = aN(t, n, a.in, i);
                    if (!a.transform) return aN(t, n, a.out, o);
                    {
                        if (aC(a.transform)) throw new am("z.compile: async transforms in pipes are not supported");
                        let r = a.transform,
                            i = ab(n, t => {
                                let n = {
                                        value: t,
                                        issues: [],
                                        addIssue: aU
                                    },
                                    i = r(t, n);
                                return i instanceof Promise ? as : 0 === n.issues.length ? i : as
                            }),
                            c = ay(n);
                        return t.write("const ".concat(c, " = ").concat(i, "(").concat(o, ");")), t.write("if (".concat(c, " === INVALID) return INVALID;")), aN(t, n, a.out, c)
                    }
                }(t, n, r, i);
                break;
            case "custom":
                K = function(t, n, r, i) {
                    let a = r._zod.def;
                    if (a.fn) {
                        if (aC(a.fn)) throw new am("z.compile: async custom predicates are not supported");
                        let r = ab(n, a.fn),
                            o = ah(n, aA),
                            c = ay(n);
                        t.write("const ".concat(c, " = ").concat(r, "(").concat(i, ");")), t.write("if (".concat(c, " instanceof Promise) ").concat(o, "();")), t.write("if (!".concat(c, ") return INVALID;"))
                    } else throw new af("custom schema without a predicate function");
                    return i
                }(t, n, r, i);
                break;
            case "transform":
                K = function(t, n, r, i) {
                    let a = r._zod.def;
                    if (a.transform) {
                        if (aC(a.transform)) throw new am("z.compile: async transforms are not supported");
                        let r = a.transform,
                            o = ab(n, t => {
                                let n = {
                                        value: t,
                                        issues: [],
                                        addIssue: aU
                                    },
                                    i = r(t, n);
                                return i instanceof Promise ? as : 0 === n.issues.length ? i : as
                            }),
                            c = ay(n);
                        return t.write("const ".concat(c, " = ").concat(o, "(").concat(i, ");")), t.write("if (".concat(c, " === INVALID) return INVALID;")), c
                    }
                    return i
                }(t, n, r, i);
                break;
            case "catch":
                K = function(t, n, r, i) {
                    let a = r._zod.def;
                    if (!a.catchValue[eB]) throw new af("catch with a callback (only a constant catch value compiles)", !1);
                    let o = ay(n);
                    t.write("let ".concat(o, " = (() => {")), t.indented(t => {
                        let r = aI(t, n, a.innerType, i);
                        t.write("return ".concat(r, ";"))
                    }), t.write("})();");
                    let c = ah(n, a.innerType),
                        u = ab(n, a.catchValue),
                        l = ah(n, a$);
                    return t.write("if (".concat(o, " === INVALID) {")), t.indented(t => {
                        t.write("".concat(o, " = ").concat(l, "(").concat(c, ", ").concat(u, ", ").concat(i, ");")), t.write("if (".concat(o, " === INVALID) return INVALID;"))
                    }), t.write("}"), o
                }(t, n, r, i);
                break;
            default:
                throw new af("schema type ".concat(Y))
        }
        return null === K ? null : function(t, n, r, i) {
            let a = r._zod.def.checks;
            if (!a || 0 === a.length) return i;
            let o = i;
            for (let r of a) {
                let i = r._zod.def;
                if (i.when && !ak.has(i.check)) throw new af('check with a custom "when" condition');
                switch (i.check) {
                    case "greater_than":
                        ! function(t, n, r, i) {
                            let a = r.inclusive ? "<" : "<=";
                            t.write("if (".concat(i, " ").concat(a, " ").concat(aS(n, r.value), ") return INVALID;"))
                        }(t, n, i, o);
                        break;
                    case "less_than":
                        ! function(t, n, r, i) {
                            let a = r.inclusive ? ">" : ">=";
                            t.write("if (".concat(i, " ").concat(a, " ").concat(aS(n, r.value), ") return INVALID;"))
                        }(t, n, i, o);
                        break;
                    case "multiple_of":
                        ! function(t, n, r, i) {
                            if ("bigint" == typeof r.value) {
                                if (r.value === BigInt(0)) throw new af("multiple_of check with a zero divisor");
                                t.write("if (".concat(i, " % ").concat(r.value, "n !== 0n) return INVALID;"))
                            } else {
                                let a = ah(n, z);
                                t.write("if (".concat(a, "(").concat(i, ", ").concat(ax(r.value, "multiple_of"), ") !== 0) return INVALID;"))
                            }
                        }(t, n, i, o);
                        break;
                    case "number_format":
                        az(t, i, o);
                        break;
                    case "min_length": {
                        let r = ax(i.minimum, "min_length"),
                            a = aw(t, n, o, "".concat(o, ".length >= ").concat(r, " && ").concat(o, ".length < ").concat(2 * i.minimum));
                        t.write("if (".concat(a, " < ").concat(r, ") return INVALID;"));
                        break
                    }
                    case "max_length": {
                        let r = ax(i.maximum, "max_length"),
                            a = aw(t, n, o, "".concat(o, ".length > ").concat(r));
                        t.write("if (".concat(a, " > ").concat(r, ") return INVALID;"));
                        break
                    }
                    case "length_equals": {
                        let r = ax(i.length, "length_equals"),
                            a = aw(t, n, o, "".concat(o, ".length >= ").concat(r, " && ").concat(o, ".length <= ").concat(2 * i.length));
                        t.write("if (".concat(a, " !== ").concat(r, ") return INVALID;"));
                        break
                    }
                    case "min_size":
                        t.write("if (".concat(o, ".size < ").concat(ax(i.minimum, "min_size"), ") return INVALID;"));
                        break;
                    case "max_size":
                        t.write("if (".concat(o, ".size > ").concat(ax(i.maximum, "max_size"), ") return INVALID;"));
                        break;
                    case "size_equals":
                        t.write("if (".concat(o, ".size !== ").concat(ax(i.size, "size_equals"), ") return INVALID;"));
                        break;
                    case "string_format":
                        o = aO(t, n, i, o);
                        break;
                    case "custom":
                        o = function(t, n, r, i) {
                            let a = r._zod.def;
                            if (a.fn) {
                                if (aC(a.fn)) throw new am("z.compile: async .refine() predicates are not supported");
                                let r = ab(n, a.fn),
                                    o = ah(n, aA),
                                    c = ay(n);
                                return t.write("const ".concat(c, " = ").concat(r, "(").concat(i, ");")), t.write("if (".concat(c, " instanceof Promise) ").concat(o, "();")), t.write("if (!".concat(c, ") return INVALID;")), i
                            }
                            if (r._zod.check) {
                                if (aC(r._zod.check)) throw new am("z.compile: async .superRefine() / check functions are not supported");
                                let a = r._zod.check,
                                    o = ab(n, t => {
                                        let n = {
                                            value: t,
                                            issues: [],
                                            addIssue: aU
                                        };
                                        return a(n) instanceof Promise && aA(), 0 === n.issues.length ? n.value : as
                                    }),
                                    c = ay(n);
                                return t.write("const ".concat(c, " = ").concat(o, "(").concat(i, ");")), t.write("if (".concat(c, " === INVALID) return INVALID;")), c
                            }
                            throw new af("custom check without a predicate or check function")
                        }(t, n, r, o);
                        break;
                    case "bigint_format":
                        ! function(t, n, r) {
                            let i = n.format;
                            if (i) switch (i) {
                                case "int64":
                                    t.write("if (".concat(r, " < -9223372036854775808n || ").concat(r, " > 9223372036854775807n) return INVALID;"));
                                    break;
                                case "uint64":
                                    t.write("if (".concat(r, " < 0n || ").concat(r, " > 18446744073709551615n) return INVALID;"));
                                    break;
                                default:
                                    throw new af("bigint format ".concat(i))
                            }
                        }(t, i, o);
                        break;
                    case "mime_type":
                        ! function(t, n, r, i) {
                            let a = r.mime;
                            if (a && a.length > 0) {
                                let r = ah(n, new Set(a));
                                t.write("if (!".concat(r, ".has(").concat(i, ".type)) return INVALID;"))
                            }
                        }(t, n, i, o);
                        break;
                    case "property":
                        ! function(t, n, r, i) {
                            let a = "".concat(i, "[").concat(JSON.stringify(r.property), "]");
                            aN(t, n, r.schema, a)
                        }(t, n, i, o);
                        break;
                    case "properties":
                        ! function(t, n, r, i) {
                            if (r.when) throw new af('check with a custom "when" condition');
                            t.write("if (".concat(i, " == null) return INVALID;"));
                            let a = r.shape;
                            for (let r of Reflect.ownKeys(a)) {
                                let o = "symbol" == typeof r ? ah(n, r) : G(r),
                                    c = ay(n);
                                t.write("const ".concat(c, " = ").concat(i, "[").concat(o, "];")), aI(t, n, a[r], c, !1)
                            }
                        }(t, n, i, o);
                        break;
                    case "overwrite": {
                        let i = ay(n);
                        (function(t, n, r, i, a) {
                            let o = r._zod.def.tx;
                            if (!o) throw new af("overwrite check without a transform function");
                            if (aC(o)) throw new am("z.compile: async overwrite transforms are not supported");
                            let c = ah(n, o);
                            t.write("const ".concat(a, " = ").concat(c, "(").concat(i, ");"))
                        })(t, n, r, o, i), o = i;
                        break
                    }
                    default:
                        throw new af("check type ".concat(i.check))
                }
            }
            return o
        }(t, n, r, K)
    }

    function aD(t) {
        return "optional" === t._zod.optin && "optional" === t._zod.optout
    }

    function aZ(t) {
        return ("defaulted" !== t._zod.optin || "optional" === t._zod.optout) && function t(n) {
            var r, i;
            let a = n._zod.def;
            switch (a.type) {
                case "string":
                case "number":
                case "boolean":
                case "bigint":
                case "symbol":
                case "null":
                case "nan":
                case "date":
                case "object":
                case "array":
                case "tuple":
                case "record":
                case "map":
                case "set":
                case "file":
                case "template_literal":
                case "never":
                case "success":
                    return !1;
                case "literal":
                    return !!(null == (r = a.values) ? void 0 : r.includes(void 0));
                case "enum":
                    return !!(null == (i = n._zod.values) ? void 0 : i.has(void 0));
                case "optional":
                default:
                    return !0;
                case "nullable":
                case "readonly":
                case "nonoptional":
                    return !a.innerType || t(a.innerType);
                case "union":
                    return !a.options || a.options.some(t);
                case "intersection":
                    return !a.left || !a.right || t(a.left) || t(a.right);
                case "pipe":
                    return !a.out || t(a.out)
            }
        }(t)
    }

    function aj(t, n, r, i) {
        return aN(t, n, r._zod.def.innerType, i)
    }

    function aT(t, n) {
        for (let r = t.length - 1; r >= 0; r--)
            if (!("optin" === n ? void 0 !== t[r]._zod.optin : "optional" === t[r]._zod.optout)) return r + 1;
        return 0
    }

    function aE(t, n, r, i, a, o) {
        let c = ah(n, Object.prototype.propertyIsEnumerable),
            u = ay(n),
            l = ay(n),
            s = ay(n);
        t.write("const ".concat(u, " = Object.getOwnPropertySymbols(").concat(r, ");")), t.write("const ".concat(l, " = Object.getOwnPropertyNames(").concat(r, ");")), t.write("for (let ".concat(s, " = 0; ").concat(s, " < ").concat(l, ".length; ").concat(s, "++) {")), t.indented(t => {
            t.write("const ".concat(i, " = ").concat(l, "[").concat(s, "];")), t.write("if (".concat(i, ' === "__proto__" || !').concat(c, ".call(").concat(r, ", ").concat(i, ")) continue;")), a(t)
        }), t.write("}"), t.write("for (let ".concat(s, " = 0; ").concat(s, " < ").concat(u, ".length; ").concat(s, "++) {")), t.indented(t => {
            t.write("const ".concat(i, " = ").concat(u, "[").concat(s, "];")), t.write("if (!".concat(c, ".call(").concat(r, ", ").concat(i, ")) continue;")), o ? t.write(o) : a(t)
        }), t.write("}")
    }

    function aC(t) {
        return "function" == typeof t && ("AsyncFunction" === t.constructor.name || "AsyncFunction" === t[Symbol.toStringTag])
    }

    function a$(t, n, r) {
        let i = t._zod.run({
            value: r,
            issues: []
        }, {});
        return i && "function" == typeof i.then ? as : 0 === i.issues.length ? i.value : n()
    }

    function aR(t) {
        return t.checks && (t.checks = [...t.checks]), t
    }

    function aL(t, n) {
        return new t(aR({
            type: "string",
            ...ee(n)
        }))
    }

    function aG(t, n) {
        return new t(aR({
            type: "string",
            coerce: !0,
            ...ee(n)
        }))
    }

    function aM(t, n) {
        return new t({
            type: "string",
            format: "email",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function aB(t, n) {
        return new t({
            type: "string",
            format: "guid",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function aJ(t, n) {
        return new t({
            type: "string",
            format: "uuid",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function aV(t, n) {
        return new t({
            type: "string",
            format: "uuid",
            check: "string_format",
            abort: !1,
            version: "v4",
            ...ee(n)
        })
    }

    function aF(t, n) {
        return new t({
            type: "string",
            format: "uuid",
            check: "string_format",
            abort: !1,
            version: "v6",
            ...ee(n)
        })
    }

    function aq(t, n) {
        return new t({
            type: "string",
            format: "uuid",
            check: "string_format",
            abort: !1,
            version: "v7",
            ...ee(n)
        })
    }

    function aW(t, n) {
        return new t({
            type: "string",
            format: "url",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function aK(t, n) {
        return new t({
            type: "string",
            format: "emoji",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function aX(t, n) {
        return new t({
            type: "string",
            format: "nanoid",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function aH(t, n) {
        return new t({
            type: "string",
            format: "cuid",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function aY(t, n) {
        return new t({
            type: "string",
            format: "cuid2",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function aQ(t, n) {
        return new t({
            type: "string",
            format: "ulid",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function a0(t, n) {
        return new t({
            type: "string",
            format: "xid",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function a4(t, n) {
        return new t({
            type: "string",
            format: "ksuid",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function a1(t, n) {
        return new t({
            type: "string",
            format: "ipv4",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function a6(t, n) {
        return new t({
            type: "string",
            format: "ipv6",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function a2(t, n) {
        return new t({
            type: "string",
            format: "mac",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function a5(t, n) {
        return new t({
            type: "string",
            format: "cidrv4",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function a3(t, n) {
        return new t({
            type: "string",
            format: "cidrv6",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function a9(t, n) {
        return new t({
            type: "string",
            format: "base64",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function a8(t, n) {
        return new t({
            type: "string",
            format: "base64url",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function a7(t, n) {
        return new t({
            type: "string",
            format: "e164",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function oe(t, n) {
        return new t({
            type: "string",
            format: "credit_card",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function ot(t, n) {
        return new t({
            type: "string",
            format: "iban",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }

    function on(t, n) {
        return new t({
            type: "string",
            format: "jwt",
            check: "string_format",
            abort: !1,
            ...ee(n)
        })
    }
    t.s(["INVALID", 0, as, "ZodCompileAsyncError", 0, am, "ZodCompileUnsupportedError", 0, af, "compile", 0, av, "compileFn", 0, ag, "withParser", 0, ap], 6e3), t.i(6e3);
    let or = {
        Any: null,
        Minute: -1,
        Second: 0,
        Millisecond: 3,
        Microsecond: 6
    };

    function oi(t, n) {
        return new t({
            type: "string",
            format: "datetime",
            check: "string_format",
            offset: !1,
            local: !1,
            precision: null,
            ...ee(n)
        })
    }

    function oa(t, n) {
        return new t({
            type: "string",
            format: "date",
            check: "string_format",
            ...ee(n)
        })
    }

    function oo(t, n) {
        return new t({
            type: "string",
            format: "time",
            check: "string_format",
            precision: null,
            ...ee(n)
        })
    }

    function oc(t, n) {
        return new t({
            type: "string",
            format: "duration",
            check: "string_format",
            ...ee(n)
        })
    }

    function ou(t, n) {
        return new t(aR({
            type: "number",
            checks: [],
            ...ee(n)
        }))
    }

    function ol(t, n) {
        return new t(aR({
            type: "number",
            coerce: !0,
            checks: [],
            ...ee(n)
        }))
    }

    function os(t, n) {
        return new t({
            type: "number",
            check: "number_format",
            abort: !1,
            format: "safeint",
            ...ee(n)
        })
    }

    function od(t, n) {
        return new t({
            type: "number",
            check: "number_format",
            abort: !1,
            format: "float32",
            ...ee(n)
        })
    }

    function om(t, n) {
        return new t({
            type: "number",
            check: "number_format",
            abort: !1,
            format: "float64",
            ...ee(n)
        })
    }

    function of(t, n) {
        return new t({
            type: "number",
            check: "number_format",
            abort: !1,
            format: "int32",
            ...ee(n)
        })
    }

    function ov(t, n) {
        return new t({
            type: "number",
            check: "number_format",
            abort: !1,
            format: "uint32",
            ...ee(n)
        })
    }

    function op(t, n) {
        return new t({
            type: "boolean",
            ...ee(n)
        })
    }

    function og(t, n) {
        return new t({
            type: "boolean",
            coerce: !0,
            ...ee(n)
        })
    }

    function oh(t, n) {
        return new t({
            type: "bigint",
            ...ee(n)
        })
    }

    function ob(t, n) {
        return new t({
            type: "bigint",
            coerce: !0,
            ...ee(n)
        })
    }

    function oy(t, n) {
        return new t({
            type: "bigint",
            check: "bigint_format",
            abort: !1,
            format: "int64",
            ...ee(n)
        })
    }

    function o_(t, n) {
        return new t({
            type: "bigint",
            check: "bigint_format",
            abort: !1,
            format: "uint64",
            ...ee(n)
        })
    }

    function oI(t, n) {
        return new t({
            type: "symbol",
            ...ee(n)
        })
    }

    function ok(t, n) {
        return new t({
            type: "undefined",
            ...ee(n)
        })
    }

    function ow(t, n) {
        return new t({
            type: "null",
            ...ee(n)
        })
    }

    function ox(t) {
        return new t({
            type: "any"
        })
    }

    function oS(t) {
        return new t({
            type: "unknown"
        })
    }

    function oz(t, n) {
        return new t({
            type: "never",
            ...ee(n)
        })
    }

    function oA(t, n) {
        return new t({
            type: "void",
            ...ee(n)
        })
    }

    function oU(t, n) {
        return new t({
            type: "date",
            ...ee(n)
        })
    }

    function oP(t, n) {
        return new t({
            type: "date",
            coerce: !0,
            ...ee(n)
        })
    }

    function oO(t, n) {
        return new t({
            type: "nan",
            ...ee(n)
        })
    }

    function oN(t, n) {
        return new nE({
            check: "less_than",
            ...ee(n),
            value: t,
            inclusive: !1
        })
    }

    function oD(t, n) {
        return new nE({
            check: "less_than",
            ...ee(n),
            value: t,
            inclusive: !0
        })
    }

    function oZ(t, n) {
        return new nC({
            check: "greater_than",
            ...ee(n),
            value: t,
            inclusive: !1
        })
    }

    function oj(t, n) {
        return new nC({
            check: "greater_than",
            ...ee(n),
            value: t,
            inclusive: !0
        })
    }

    function oT(t) {
        return oZ(0, t)
    }

    function oE(t) {
        return oN(0, t)
    }

    function oC(t) {
        return oD(0, t)
    }

    function o$(t) {
        return oj(0, t)
    }

    function oR(t, n) {
        return new n$({
            check: "multiple_of",
            ...ee(n),
            value: t
        })
    }

    function oL(t, n) {
        return new nG({
            check: "max_size",
            ...ee(n),
            maximum: t
        })
    }

    function oG(t, n) {
        return new nM({
            check: "min_size",
            ...ee(n),
            minimum: t
        })
    }

    function oM(t, n) {
        return new nB({
            check: "size_equals",
            ...ee(n),
            size: t
        })
    }

    function oB(t, n) {
        return new nJ({
            check: "max_length",
            ...ee(n),
            maximum: t
        })
    }

    function oJ(t, n) {
        return new nV({
            check: "min_length",
            ...ee(n),
            minimum: t
        })
    }

    function oV(t, n) {
        return new nF({
            check: "length_equals",
            ...ee(n),
            length: t
        })
    }

    function oF(t, n) {
        return new nW({
            check: "string_format",
            format: "regex",
            ...ee(n),
            pattern: t
        })
    }

    function oq(t) {
        return new nK({
            check: "string_format",
            format: "lowercase",
            ...ee(t)
        })
    }

    function oW(t) {
        return new nX({
            check: "string_format",
            format: "uppercase",
            ...ee(t)
        })
    }

    function oK(t, n) {
        return new nH({
            check: "string_format",
            format: "includes",
            ...ee(n),
            includes: t
        })
    }

    function oX(t, n) {
        return new nY({
            check: "string_format",
            format: "starts_with",
            ...ee(n),
            prefix: t
        })
    }

    function oH(t, n) {
        return new nQ({
            check: "string_format",
            format: "ends_with",
            ...ee(n),
            suffix: t
        })
    }

    function oY(t, n, r) {
        return new n4({
            check: "property",
            property: t,
            schema: n,
            ...ee(r)
        })
    }

    function oQ(t, n) {
        return new n1({
            check: "properties",
            shape: t,
            ...ee(n)
        })
    }

    function o0(t, n) {
        return new n6({
            check: "mime_type",
            mime: t,
            ...ee(n)
        })
    }

    function o4(t) {
        return new n2({
            check: "overwrite",
            tx: t
        })
    }

    function o1(t) {
        return o4(n => n.normalize(t))
    }

    function o6() {
        return o4(t => t.trim())
    }

    function o2() {
        return o4(t => t.toLowerCase())
    }

    function o5() {
        return o4(t => t.toUpperCase())
    }

    function o3() {
        return o4(t => M(t))
    }

    function o9(t, n, r) {
        return new t({
            type: "array",
            element: n,
            ...ee(r)
        })
    }

    function o8(t, n, r) {
        return new t({
            type: "union",
            options: n,
            ...ee(r)
        })
    }

    function o7(t, n, r) {
        return new t({
            type: "union",
            options: n,
            inclusive: !1,
            ...ee(r)
        })
    }

    function ce(t, n, r, i) {
        return new t({
            type: "union",
            options: r,
            discriminator: n,
            ...ee(i)
        })
    }

    function ct(t, n, r) {
        return new t({
            type: "intersection",
            left: n,
            right: r
        })
    }

    function cn(t, n, r, i) {
        let a = r instanceof n9,
            o = a ? i : r;
        return new t({
            type: "tuple",
            items: n,
            rest: a ? r : null,
            ...ee(o)
        })
    }

    function cr(t, n, r, i) {
        return new t({
            type: "record",
            keyType: n,
            valueType: r,
            ...ee(i)
        })
    }

    function ci(t, n, r, i) {
        return new t({
            type: "map",
            keyType: n,
            valueType: r,
            ...ee(i)
        })
    }

    function ca(t, n, r) {
        return new t({
            type: "set",
            valueType: n,
            ...ee(r)
        })
    }

    function co(t, n, r) {
        return new t({
            type: "enum",
            entries: Array.isArray(n) ? Object.fromEntries(n.map(t => [t, t])) : n,
            ...ee(r)
        })
    }

    function cc(t, n, r) {
        return new t({
            type: "enum",
            entries: n,
            ...ee(r)
        })
    }

    function cu(t, n, r) {
        return new t({
            type: "literal",
            values: Array.isArray(n) ? n : [n],
            ...ee(r)
        })
    }

    function cl(t, n) {
        return new t({
            type: "file",
            ...ee(n)
        })
    }

    function cs(t, n) {
        return new t({
            type: "transform",
            transform: n
        })
    }

    function cd(t, n) {
        return new t({
            type: "optional",
            innerType: n
        })
    }

    function cm(t, n) {
        return new t({
            type: "nullable",
            innerType: n
        })
    }

    function cf(t, n, r) {
        return new t({
            type: "default",
            innerType: n,
            get defaultValue() {
                return "function" == typeof r ? r() : q(r)
            }
        })
    }

    function cv(t, n, r) {
        return new t({
            type: "nonoptional",
            innerType: n,
            ...ee(r)
        })
    }

    function cp(t, n) {
        return new t({
            type: "success",
            innerType: n
        })
    }

    function cg(t, n, r) {
        return new t({
            type: "catch",
            innerType: n,
            catchValue: "function" == typeof r ? r : eJ(r)
        })
    }

    function ch(t, n, r) {
        return new t({
            type: "pipe",
            in: n,
            out: r
        })
    }

    function cb(t, n) {
        return new t({
            type: "readonly",
            innerType: n
        })
    }

    function cy(t, n, r) {
        return new t({
            type: "template_literal",
            parts: n,
            ...ee(r)
        })
    }

    function c_(t, n) {
        return new t({
            type: "lazy",
            getter: n
        })
    }

    function cI(t, n) {
        return new t({
            type: "promise",
            innerType: n
        })
    }

    function ck(t, n, r) {
        let i = ee(r);
        return null != i.abort || (i.abort = !0), new t({
            type: "custom",
            check: "custom",
            fn: n,
            ...i
        })
    }

    function cw(t, n, r) {
        return new t({
            type: "custom",
            check: "custom",
            fn: n,
            ...ee(r)
        })
    }

    function cx(t, n) {
        let r = cS(n => (n.addIssue = t => {
            if ("string" == typeof t) n.issues.push(ez(t, n.value, r._zod.def));
            else t.fatal && (t.continue = !1), null != t.code || (t.code = "custom"), "input" in t || (t.input = n.value), null != t.inst || (t.inst = r), null != t.continue || (t.continue = !r._zod.def.abort), n.issues.push(ez(t))
        }, t(n.value, n)), n);
        return r
    }

    function cS(t, n) {
        let r = new nD({
            check: "custom",
            ...ee(n)
        });
        return r._zod.check = t, r
    }

    function cz(t) {
        let n = new nD({
            check: "describe"
        });
        return n._zod.onattach = [n => {
            var r;
            let i = null != (r = al.get(n)) ? r : {};
            al.add(n, {
                ...i,
                description: t
            })
        }], n._zod.check = () => {}, n
    }

    function cA(t) {
        let n = new nD({
            check: "meta"
        });
        return n._zod.onattach = [n => {
            var r;
            let i = null != (r = al.get(n)) ? r : {};
            al.add(n, {
                ...i,
                ...t
            })
        }], n._zod.check = () => {}, n
    }

    function cU(t, n) {
        var r, i, a, o, c, u;
        let l = ee(n),
            s = null != (r = l.truthy) ? r : ["true", "1", "yes", "on", "y", "enabled"],
            d = null != (i = l.falsy) ? i : ["false", "0", "no", "off", "n", "disabled"];
        "sensitive" !== l.case && (s = s.map(t => "string" == typeof t ? t.toLowerCase() : t), d = d.map(t => "string" == typeof t ? t.toLowerCase() : t));
        let m = new Set(s),
            f = new Set(d),
            v = null != (a = t.Codec) ? a : iV,
            p = null != (o = t.Boolean) ? o : rX,
            g = new v({
                type: "pipe",
                in: new(null != (c = t.String) ? c : rt)({
                    type: "string",
                    error: l.error
                }),
                out: new p({
                    type: "boolean",
                    error: l.error
                }),
                transform: (t, n) => {
                    let r = t;
                    return "sensitive" !== l.case && (r = r.toLowerCase()), !!m.has(r) || !f.has(r) && (n.issues.push({
                        code: "invalid_value",
                        expected: "stringbool",
                        values: [...m, ...f],
                        input: n.value,
                        inst: g,
                        continue: !1
                    }), {})
                },
                reverseTransform: (t, n) => !0 === t ? s[0] || "true" : d[0] || "false",
                error: l.error
            });
        return g._zod.bag.truthy = s, g._zod.bag.falsy = d, g._zod.bag.case = null != (u = l.case) ? u : "insensitive", g
    }

    function cP(t, n, r) {
        let i = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : {},
            a = {
                check: "string_format",
                type: "string",
                format: n,
                fn: "function" == typeof r ? r : t => r.test(t),
                ...ee(i)
            };
        return r instanceof RegExp && (a.pattern = r), new t(a)
    }

    function cO(t) {
        for (var n = arguments.length, r = Array(n > 1 ? n - 1 : 0), i = 1; i < n; i++) r[i - 1] = arguments[i];
        for (let n of r)
            for (let r of Reflect.ownKeys(n)) Object.prototype.propertyIsEnumerable.call(n, r) && O(t, r, n[r]);
        return t
    }

    function cN(t) {
        var n, r, i, a, o, c, u, l, s;
        let d = null != (n = null == t ? void 0 : t.target) ? n : "draft-2020-12";
        return "draft-4" === d && (d = "draft-04"), "draft-7" === d && (d = "draft-07"), {
            processors: null != (r = t.processors) ? r : {},
            metadataRegistry: null != (i = null == t ? void 0 : t.metadata) ? i : al,
            target: d,
            unrepresentable: null != (a = null == t ? void 0 : t.unrepresentable) ? a : "throw",
            override: null != (o = null == t ? void 0 : t.override) ? o : () => {},
            io: null != (c = null == t ? void 0 : t.io) ? c : "output",
            counter: 0,
            seen: new Map,
            sharedDefsExtractedFor: void 0,
            sharedEmitDoneFor: void 0,
            cycles: null != (u = null == t ? void 0 : t.cycles) ? u : "ref",
            reused: null != (l = null == t ? void 0 : t.reused) ? l : "inline",
            intersections: [],
            deferred: [],
            external: null != (s = null == t ? void 0 : t.external) ? s : void 0
        }
    }

    function cD(t, n, r, i, a) {
        let o = "function" == typeof n.unrepresentable ? n.unrepresentable({
            zodSchema: t,
            path: i.path,
            message: a
        }) : n.unrepresentable;
        if ("any" === o) return !1;
        if (void 0 === o || "throw" === o) throw Error(a);
        return Object.assign(r, o), !0
    }

    function cZ(t, n) {
        var r, i, a;
        let o = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {
                path: [],
                schemaPath: []
            },
            c = t._zod.def,
            u = n.seen.get(t);
        if (u) return u.count++, o.schemaPath.includes(t) && (u.cycle = o.path), u.schema;
        let l = {
            schema: {},
            count: 1,
            cycle: void 0,
            path: o.path
        };
        n.seen.set(t, l), n.sharedDefsExtractedFor = void 0, n.sharedEmitDoneFor = void 0;
        let s = null == (r = (i = t._zod).toJSONSchema) ? void 0 : r.call(i);
        if (s) l.schema = s;
        else {
            let r = {
                ...o,
                schemaPath: [...o.schemaPath, t],
                path: o.path
            };
            if (t._zod.processJSONSchema) t._zod.processJSONSchema(n, l.schema, r);
            else {
                let i = l.schema,
                    a = n.processors[c.type];
                if (!a) throw Error("[toJSONSchema]: Non-representable type encountered: ".concat(c.type));
                a(t, n, i, r)
            }
            let i = t._zod.parent;
            i && (l.ref || (l.ref = i), cZ(i, n, r), n.seen.get(i).isParent = !0)
        }
        let d = n.metadataRegistry.get(t);
        return d && cO(l.schema, d), "input" === n.io && function t(n, r) {
            let i = null != r ? r : {
                seen: new Set
            };
            if (i.seen.has(n)) return !1;
            i.seen.add(n);
            let a = n._zod.def;
            if ("transform" === a.type) return !0;
            if ("array" === a.type) return t(a.element, i);
            if ("set" === a.type) return t(a.valueType, i);
            if ("lazy" === a.type) return t(a.getter(), i);
            if ("promise" === a.type || "optional" === a.type || "nonoptional" === a.type || "nullable" === a.type || "readonly" === a.type || "default" === a.type || "prefault" === a.type || "catch" === a.type) return t(a.innerType, i);
            if ("intersection" === a.type) return t(a.left, i) || t(a.right, i);
            if ("record" === a.type || "map" === a.type) return t(a.keyType, i) || t(a.valueType, i);
            if ("pipe" === a.type) return !!n._zod.traits.has("$ZodCodec") || t(a.in, i) || t(a.out, i);
            if ("object" === a.type) {
                for (let n in a.shape)
                    if (t(a.shape[n], i)) return !0;
                return !1
            }
            if ("union" === a.type) {
                for (let n of a.options)
                    if (t(n, i)) return !0;
                return !1
            }
            if ("tuple" === a.type) {
                for (let n of a.items)
                    if (t(n, i)) return !0;
                if (a.rest && t(a.rest, i)) return !0
            }
            return !1
        }(t) && (delete l.schema.examples, delete l.schema.default), "input" === n.io && "_prefault" in l.schema && (null != (a = l.schema).default || (a.default = l.schema._prefault)), delete l.schema._prefault, n.seen.get(t).schema
    }

    function cj(t) {
        return t.replace(/~/g, "~0").replace(/\//g, "~1")
    }

    function cT(t, n) {
        var r, i, a, o;
        let c = t.seen.get(n);
        if (!c) throw Error("Unprocessed schema. This is a bug in Zod.");
        if (t.external && t.sharedDefsExtractedFor === t.external) return;
        let u = new Map;
        for (let n of t.seen.entries()) {
            let i = null == (r = t.metadataRegistry.get(n[0])) ? void 0 : r.id;
            if (i) {
                let t = u.get(i);
                if (t && t !== n[0]) throw Error('Duplicate schema id "'.concat(i, '" detected during JSON Schema conversion. Two different schemas cannot share the same id when converted together.'));
                u.set(i, n[0])
            }
        }
        let l = n => {
            if (n[1].schema.$ref) return;
            let r = n[1],
                {
                    ref: i,
                    defId: a
                } = (n => {
                    var r, i, a, o, u;
                    let l = "draft-2020-12" === t.target ? "$defs" : "definitions";
                    if (t.external) {
                        let r = null == (u = t.external.registry.get(n[0])) ? void 0 : u.id,
                            c = null != (i = t.external.uri) ? i : t => t;
                        if (r) return {
                            ref: c(r)
                        };
                        let s = null != (a = null != (o = n[1].defId) ? o : n[1].schema.id) ? a : "schema".concat(t.counter++);
                        return n[1].defId = s, {
                            defId: s,
                            ref: "".concat(c("__shared"), "#/").concat(l, "/").concat(cj(s))
                        }
                    }
                    let s = "".concat("#", "/").concat(l, "/");
                    if (n[1] === c && !n[1].schema.id) return {
                        ref: "#"
                    };
                    let d = null != (r = n[1].schema.id) ? r : "__schema".concat(t.counter++);
                    return {
                        defId: d,
                        ref: s + cj(d)
                    }
                })(n);
            r.def = {
                ...r.schema
            }, a && (r.defId = a);
            let o = r.schema;
            for (let t in o) delete o[t];
            o.$ref = i
        };
        if ("throw" === t.cycles)
            for (let n of t.seen.entries()) {
                let t = n[1];
                if (t.cycle) throw Error("Cycle detected: " + "#/".concat(null == (i = t.cycle) ? void 0 : i.join("/"), "/<root>") + '\n\nSet the `cycles` parameter to `"ref"` to resolve cyclical schemas with defs.')
            }
        for (let r of t.seen.entries()) {
            let i = r[1];
            if (n === r[0]) {
                l(r);
                continue
            }
            if (t.external) {
                let i = null == (o = t.external.registry.get(r[0])) ? void 0 : o.id;
                if (n !== r[0] && i) {
                    l(r);
                    continue
                }
            }
            if ((null == (a = t.metadataRegistry.get(r[0])) ? void 0 : a.id) || i.cycle) {
                l(r);
                continue
            }
            i.count > 1 && "ref" === t.reused && l(r)
        }
        t.external && (t.sharedDefsExtractedFor = t.external)
    }
    t.s(["TimePrecision", 0, or, "_any", 0, ox, "_array", 0, o9, "_base64", 0, a9, "_base64url", 0, a8, "_bigint", 0, oh, "_boolean", 0, op, "_catch", 0, cg, "_check", 0, cS, "_cidrv4", 0, a5, "_cidrv6", 0, a3, "_coercedBigint", 0, ob, "_coercedBoolean", 0, og, "_coercedDate", 0, oP, "_coercedNumber", 0, ol, "_coercedString", 0, aG, "_creditCard", 0, oe, "_cuid", 0, aH, "_cuid2", 0, aY, "_custom", 0, ck, "_date", 0, oU, "_default", 0, cf, "_discriminatedUnion", 0, ce, "_e164", 0, a7, "_email", 0, aM, "_emoji", 0, aK, "_endsWith", 0, oH, "_enum", 0, co, "_file", 0, cl, "_float32", 0, od, "_float64", 0, om, "_gt", 0, oZ, "_gte", 0, oj, "_guid", 0, aB, "_iban", 0, ot, "_includes", 0, oK, "_int", 0, os, "_int32", 0, of, "_int64", 0, oy, "_intersection", 0, ct, "_ipv4", 0, a1, "_ipv6", 0, a6, "_isoDate", 0, oa, "_isoDateTime", 0, oi, "_isoDuration", 0, oc, "_isoTime", 0, oo, "_jwt", 0, on, "_ksuid", 0, a4, "_lazy", 0, c_, "_length", 0, oV, "_literal", 0, cu, "_lowercase", 0, oq, "_lt", 0, oN, "_lte", 0, oD, "_mac", 0, a2, "_map", 0, ci, "_max", 0, oD, "_maxLength", 0, oB, "_maxSize", 0, oL, "_mime", 0, o0, "_min", 0, oj, "_minLength", 0, oJ, "_minSize", 0, oG, "_multipleOf", 0, oR, "_nan", 0, oO, "_nanoid", 0, aX, "_nativeEnum", 0, cc, "_negative", 0, oE, "_never", 0, oz, "_nonnegative", 0, o$, "_nonoptional", 0, cv, "_nonpositive", 0, oC, "_normalize", 0, o1, "_null", 0, ow, "_nullable", 0, cm, "_number", 0, ou, "_optional", 0, cd, "_overwrite", 0, o4, "_pipe", 0, ch, "_positive", 0, oT, "_promise", 0, cI, "_properties", 0, oQ, "_property", 0, oY, "_readonly", 0, cb, "_record", 0, cr, "_refine", 0, cw, "_regex", 0, oF, "_set", 0, ca, "_size", 0, oM, "_slugify", 0, o3, "_startsWith", 0, oX, "_string", 0, aL, "_stringFormat", 0, cP, "_stringbool", 0, cU, "_success", 0, cp, "_superRefine", 0, cx, "_symbol", 0, oI, "_templateLiteral", 0, cy, "_toLowerCase", 0, o2, "_toUpperCase", 0, o5, "_transform", 0, cs, "_trim", 0, o6, "_tuple", 0, cn, "_uint32", 0, ov, "_uint64", 0, o_, "_ulid", 0, aQ, "_undefined", 0, ok, "_union", 0, o8, "_unknown", 0, oS, "_uppercase", 0, oW, "_url", 0, aW, "_uuid", 0, aJ, "_uuidv4", 0, aV, "_uuidv6", 0, aF, "_uuidv7", 0, aq, "_void", 0, oA, "_xid", 0, a0, "_xor", 0, o7, "describe", 0, cz, "meta", 0, cA], 239523), t.i(239523);
    let cE = new Set(["type", "properties", "required", "additionalProperties"]),
        cC = ["oneOf", "anyOf"];

    function c$(t) {
        let n = t.additionalProperties;
        return void 0 === n || !1 === n || "object" != typeof n || null === n ? null : Object.keys(n).length ? n : null
    }

    function cR(t) {
        let n = [];
        for (let r of t) {
            if ("object" != typeof r || "object" !== r.type) return null;
            for (let t in r)
                if (!cE.has(t)) return null;
            n.push(r)
        }
        let r = {},
            i = new Set;
        for (let t of n) {
            var a, o, c, u;
            for (let i in t.properties) {
                if (Object.prototype.hasOwnProperty.call(r, i)) continue;
                let t = [];
                for (let r of n) {
                    let n = null != (c = null == (u = r.properties) ? void 0 : u[i]) ? c : c$(r);
                    null != n && (t.some(t => JSON.stringify(t) === JSON.stringify(n)) || t.push(n))
                }
                O(r, i, 1 === t.length ? t[0] : null != (o = cR(t)) ? o : {
                    allOf: t
                })
            }
            for (let n of null != (a = t.required) ? a : []) i.add(n)
        }
        let l = {
            type: "object",
            properties: r
        };
        if (i.size && (l.required = [...i]), n.every(t => !1 === t.additionalProperties)) l.additionalProperties = !1;
        else {
            let t = [];
            for (let r of n) {
                let n = c$(r);
                n && !t.some(t => JSON.stringify(t) === JSON.stringify(n)) && t.push(n)
            }
            1 === t.length ? l.additionalProperties = t[0] : t.length > 1 && (l.additionalProperties = {
                allOf: t
            })
        }
        return l
    }

    function cL(t, n) {
        var r, i, a, o, c, u, l, s;
        let d = t.seen.get(n);
        if (!d) throw Error("Unprocessed schema. This is a bug in Zod.");
        let m = n => {
            var r, i, a;
            let o = t.seen.get(n);
            if (null === o.ref) return;
            let c = null != (r = o.def) ? r : o.schema,
                u = {
                    ...c
                },
                l = o.ref;
            if (o.ref = null, l) {
                m(l);
                let r = t.seen.get(l),
                    i = r.schema;
                if (i.$ref && ("draft-07" === t.target || "draft-04" === t.target || "openapi-3.0" === t.target) ? (c.allOf = null != (a = c.allOf) ? a : [], c.allOf.push(i)) : cO(c, i), cO(c, u), n._zod.parent === l)
                    for (let t in c) "$ref" !== t && "allOf" !== t && (t in u || delete c[t]);
                if (i.$ref && r.def)
                    for (let t in c) "$ref" !== t && "allOf" !== t && t in r.def && JSON.stringify(c[t]) === JSON.stringify(r.def[t]) && delete c[t]
            }
            let s = n._zod.parent;
            if (s && s !== l) {
                m(s);
                let n = t.seen.get(s);
                if ((null == n ? void 0 : n.schema.$ref) && (c.$ref = n.schema.$ref, n.def))
                    for (let t in c) "$ref" !== t && "allOf" !== t && t in n.def && JSON.stringify(c[t]) === JSON.stringify(n.def[t]) && delete c[t]
            }
            t.override({
                zodSchema: n,
                jsonSchema: c,
                path: null != (i = o.path) ? i : []
            })
        };
        if (!t.external || t.sharedEmitDoneFor !== t.external) {
            for (let n of [...t.seen.entries()].reverse()) m(n[0]);
            if ("openapi-3.0" !== t.target)
                for (let n of t.seen.entries()) ! function t(n) {
                    let r = n.anyOf;
                    if (!Array.isArray(r) || 0 === r.length || void 0 !== n.type) return;
                    let i = [];
                    for (let n of r) {
                        if (!n || "object" != typeof n) return;
                        t(n);
                        let r = Object.keys(n);
                        if (1 !== r.length || "type" !== r[0]) return;
                        let a = n.type;
                        for (let t of Array.isArray(a) ? a : [a]) {
                            if ("string" != typeof t) return;
                            i.includes(t) || i.push(t)
                        }
                    }
                    delete n.anyOf, n.type = 1 === i.length ? i[0] : i
                }(null != (u = n[1].def) ? u : n[1].schema);
            for (let n of t.deferred) n();
            if (t.intersections.length) {
                let n = new Map;
                for (let r of t.seen.values())
                    for (let t of [r.schema, r.def]) {
                        let r = null == t ? void 0 : t.allOf;
                        if (!Array.isArray(r)) continue;
                        let i = n.get(r);
                        i ? i.push(t) : n.set(r, [t])
                    }
                for (let r of t.intersections)
                    for (let t of null != (l = n.get(r)) ? l : []) ! function(t) {
                        let n = t.allOf;
                        if (!Array.isArray(n) || n.length < 2) return;
                        for (let n of cE)
                            if (n in t) return;
                        let r = n.filter(t => cC.some(n => Array.isArray(t[n]))),
                            i = null;
                        if (r.length) {
                            let t = r[0],
                                a = cC.find(n => Array.isArray(t[n]));
                            if (1 !== Object.keys(t).length) return;
                            let o = n.filter(n => n !== t),
                                c = t[a].map(t => cR([...o, t]));
                            if (c.some(t => !t)) return;
                            i = {
                                [a]: c
                            }
                        } else i = cR(n);
                        i && (delete t.allOf, cO(t, i))
                    }(t)
            }
        }
        let f = {};
        if ("draft-2020-12" === t.target ? f.$schema = "https://json-schema.org/draft/2020-12/schema" : "draft-07" === t.target ? f.$schema = "http://json-schema.org/draft-07/schema#" : "draft-04" === t.target ? f.$schema = "http://json-schema.org/draft-04/schema#" : t.target, null == (a = t.external) ? void 0 : a.uri) {
            let r = null == (s = t.external.registry.get(n)) ? void 0 : s.id;
            if (!r) throw Error("Schema is missing an `id` property");
            f.$id = t.external.uri(r)
        }
        cO(f, d.defId ? d.schema : null != (r = d.def) ? r : d.schema);
        let v = null == (o = t.metadataRegistry.get(n)) ? void 0 : o.id;
        void 0 !== v && f.id === v && delete f.id;
        let p = null != (i = null == (c = t.external) ? void 0 : c.defs) ? i : {};
        if (!t.external || t.sharedEmitDoneFor !== t.external)
            for (let n of t.seen.entries()) {
                let t = n[1];
                t.def && t.defId && (t.def.id === t.defId && delete t.def.id, O(p, t.defId, t.def))
            }
        t.external && (t.sharedEmitDoneFor = t.external), t.external || Object.keys(p).length > 0 && ("draft-2020-12" === t.target ? f.$defs = p : f.definitions = p);
        try {
            let r = JSON.parse(JSON.stringify(f));
            return Object.defineProperty(r, "~standard", {
                value: {
                    ...n["~standard"],
                    jsonSchema: {
                        input: cM(n, "input", t.processors),
                        output: cM(n, "output", t.processors)
                    }
                },
                enumerable: !1,
                writable: !1
            }), r
        } catch (t) {
            throw Error("Error converting schema to JSON.")
        }
    }
    let cG = function(t) {
            let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return r => {
                let i = cN({
                    ...r,
                    processors: n
                });
                return cZ(t, i), cT(i, t), cL(i, t)
            }
        },
        cM = function(t, n) {
            let r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
            return i => {
                let {
                    libraryOptions: a,
                    target: o
                } = null != i ? i : {}, c = cN({
                    ...null != a ? a : {},
                    target: o,
                    io: n,
                    processors: r
                });
                return cZ(t, c), cT(c, t), cL(c, t)
            }
        };
    t.s(["createStandardJSONSchemaMethod", 0, cM, "createToJSONSchemaMethod", 0, cG, "extractDefs", 0, cT, "finalize", 0, cL, "handleUnrepresentable", 0, cD, "initializeContext", 0, cN, "process", 0, cZ, "processSchema", 0, cZ], 674317), t.i(674317);
    let cB = (t, n, r) => {
            (void 0 === t[n] || r > t[n]) && (t[n] = r)
        },
        cJ = (t, n, r) => {
            (void 0 === t[n] || r < t[n]) && (t[n] = r)
        },
        cV = (t, n) => {
            cB(t, "minimum", n), cJ(t, "maximum", n)
        },
        cF = (t, n) => {
            null != t.multipleOf || (t.multipleOf = []), t.multipleOf.includes(n) || t.multipleOf.push(n)
        },
        cq = (t, n) => {
            null != t.patterns || (t.patterns = new Set), t.patterns.add(n)
        },
        cW = (t, n) => {
            t.mime = t.mime ? t.mime.filter(t => n.includes(t)) : [...n]
        },
        cK = (t, n) => {
            t.format = n, n.includes("int") && (t.isInt = !0)
        },
        cX = (t, n) => cB(t, "minimum", n.minimum),
        cH = (t, n) => cJ(t, "maximum", n.maximum),
        cY = t => (n, r) => {
            cK(n, r.format);
            let [i, a] = t[r.format];
            cB(n, "minimum", i), cJ(n, "maximum", a)
        },
        cQ = {
            greater_than: (t, n) => cB(t, n.inclusive ? "minimum" : "exclusiveMinimum", n.value),
            less_than: (t, n) => cJ(t, n.inclusive ? "maximum" : "exclusiveMaximum", n.value),
            multiple_of: (t, n) => cF(t, n.value),
            number_format: cY(ei),
            bigint_format: cY(ea),
            min_length: cX,
            max_length: cH,
            length_equals: (t, n) => cV(t, n.length),
            min_size: cX,
            max_size: cH,
            size_equals: (t, n) => cV(t, n.size),
            string_format: (t, n) => {
                cK(t, n.format), n.pattern && cq(t, n.pattern), ("base64" === n.format || "base64url" === n.format) && (t.contentEncoding = n.format), (n.local || -1 === n.precision) && (t.laxFormat = !0)
            },
            mime_type: (t, n) => cW(t, n.mime)
        };

    function c0(t) {
        var n, r, i, a;
        let o = {},
            c = t._zod.def;
        for (let i of t._zod.traits.has("$ZodCheck") ? [t, ...null != (n = c.checks) ? n : []] : null != (r = c.checks) ? r : []) null == (a = cQ[i._zod.def.check]) || a.call(cQ, o, i._zod.def);
        let u = t._zod.bag;
        for (let t of (void 0 !== u.minimum && cB(o, "minimum", u.minimum), void 0 !== u.exclusiveMinimum && cB(o, "exclusiveMinimum", u.exclusiveMinimum), void 0 !== u.maximum && cJ(o, "maximum", u.maximum), void 0 !== u.exclusiveMaximum && cJ(o, "exclusiveMaximum", u.exclusiveMaximum), void 0 !== u.multipleOf && cF(o, u.multipleOf), void 0 !== u.format && (null != o.format || (o.format = u.format), u.format.includes("int") && (o.isInt = !0)), u.mime && cW(o, u.mime), null != (i = u.patterns) ? i : [])) cq(o, t);
        return o
    }
    let c4 = {
            guid: "uuid",
            url: "uri",
            datetime: "date-time",
            json_string: "json-string",
            regex: ""
        },
        c1 = new Map([
            [rj, to],
            [rE, tc]
        ]),
        c6 = t => {
            var n;
            return null != (n = c1.get(t)) ? n : t
        },
        c2 = (t, n, r, i) => {
            r.type = "string";
            let {
                minimum: a,
                maximum: o,
                format: c,
                patterns: u,
                contentEncoding: l,
                laxFormat: s
            } = c0(t);
            if ("number" == typeof a && (r.minLength = a), "number" == typeof o && (r.maxLength = o), c) {
                var d;
                r.format = null != (d = c4[c]) ? d : c, "" === r.format && delete r.format, ("time" === c || s) && delete r.format
            }
            if (l && (r.contentEncoding = l), u && u.size > 0) {
                let t = [...u].map(c6);
                1 === t.length ? r.pattern = t[0].source : t.length > 1 && (r.allOf = [...t.map(t => ({
                    ..."draft-07" === n.target || "draft-04" === n.target || "openapi-3.0" === n.target ? {
                        type: "string"
                    } : {},
                    pattern: t.source
                }))])
            }
        },
        c5 = (t, n, r, i) => {
            let {
                minimum: a,
                maximum: o,
                multipleOf: c,
                exclusiveMaximum: u,
                exclusiveMinimum: l,
                isInt: s
            } = c0(t);
            r.type = s ? "integer" : "number";
            let d = "number" == typeof l && l >= (null != a ? a : -1 / 0),
                m = "number" == typeof u && u <= (null != o ? o : 1 / 0),
                f = "draft-04" === n.target || "openapi-3.0" === n.target;
            if (d ? f ? (r.minimum = l, r.exclusiveMinimum = !0) : r.exclusiveMinimum = l : "number" == typeof a && (r.minimum = a), m ? f ? (r.maximum = u, r.exclusiveMaximum = !0) : r.exclusiveMaximum = u : "number" == typeof o && (r.maximum = o), c) {
                var v;
                let a = new Set;
                for (let o of c) Number.isFinite(o) && 0 !== o ? a.add(Math.abs(o)) : cD(t, n, r, i, "A multipleOf divisor of ".concat(o, " cannot be represented in JSON Schema"));
                let [o, ...u] = a;
                void 0 !== o && (r.multipleOf = o), u.length && (r.allOf = [...null != (v = r.allOf) ? v : [], ...u.map(t => ({
                    multipleOf: t
                }))])
            }
        },
        c3 = (t, n, r, i) => {
            r.type = "boolean"
        },
        c9 = (t, n, r, i) => {
            cD(t, n, r, i, "BigInt cannot be represented in JSON Schema")
        },
        c8 = (t, n, r, i) => {
            cD(t, n, r, i, "Symbols cannot be represented in JSON Schema")
        },
        c7 = (t, n, r, i) => {
            "openapi-3.0" === n.target ? (r.type = "string", r.nullable = !0, r.enum = [null]) : r.type = "null"
        },
        ue = (t, n, r, i) => {
            cD(t, n, r, i, "Undefined cannot be represented in JSON Schema")
        },
        ut = (t, n, r, i) => {
            cD(t, n, r, i, "Void cannot be represented in JSON Schema")
        },
        un = (t, n, r, i) => {
            r.not = {}
        },
        ur = (t, n, r, i) => {},
        ui = (t, n, r, i) => {},
        ua = (t, n, r, i) => {
            cD(t, n, r, i, "Date cannot be represented in JSON Schema")
        },
        uo = (t, n, r, i) => {
            let a = y(t._zod.def.entries);
            if (0 === a.length) {
                r.not = {};
                return
            }
            a.every(t => "number" == typeof t) && (r.type = "number"), a.every(t => "string" == typeof t) && (r.type = "string"), r.enum = a
        },
        uc = (t, n, r, i) => {
            let a = t._zod.def;
            if (0 === a.values.length) {
                r.not = {};
                return
            }
            let o = [];
            for (let c of a.values)
                if (void 0 === c) {
                    if (cD(t, n, r, i, "Literal `undefined` cannot be represented in JSON Schema")) return
                } else if ("bigint" == typeof c) {
                if (cD(t, n, r, i, "BigInt literals cannot be represented in JSON Schema")) return;
                o.push(Number(c))
            } else o.push(c);
            if (0 === o.length);
            else if (1 === o.length) {
                let t = o[0];
                r.type = null === t ? "null" : typeof t, "draft-04" === n.target || "openapi-3.0" === n.target ? r.enum = [t] : r.const = t
            } else o.every(t => "number" == typeof t) && (r.type = "number"), o.every(t => "string" == typeof t) && (r.type = "string"), o.every(t => "boolean" == typeof t) && (r.type = "boolean"), o.every(t => null === t) && (r.type = "null"), r.enum = o
        },
        uu = (t, n, r, i) => {
            cD(t, n, r, i, "NaN cannot be represented in JSON Schema")
        },
        ul = (t, n, r, i) => {
            let a = t._zod.pattern;
            if (!a) throw Error("Pattern not found in template literal");
            r.type = "string", r.pattern = a.source
        },
        us = (t, n, r, i) => {
            r.type = "string", r.format = "binary", r.contentEncoding = "binary";
            let {
                minimum: a,
                maximum: o,
                mime: c
            } = c0(t);
            void 0 !== a && (r.minLength = a), void 0 !== o && (r.maxLength = o), c && (0 === c.length ? r.not = {} : 1 === c.length ? r.contentMediaType = c[0] : r.anyOf = c.map(t => ({
                contentMediaType: t
            })))
        },
        ud = (t, n, r, i) => {
            r.type = "boolean"
        },
        um = (t, n, r, i) => {
            cD(t, n, r, i, "Custom types cannot be represented in JSON Schema")
        },
        uf = (t, n, r, i) => {
            cD(t, n, r, i, "Function types cannot be represented in JSON Schema")
        },
        uv = (t, n, r, i) => {
            cD(t, n, r, i, "Transforms cannot be represented in JSON Schema")
        },
        up = (t, n, r, i) => {
            cD(t, n, r, i, "Map cannot be represented in JSON Schema")
        },
        ug = (t, n, r, i) => {
            cD(t, n, r, i, "Set cannot be represented in JSON Schema")
        },
        uh = (t, n, r, i) => {
            let a = t._zod.def,
                {
                    minimum: o,
                    maximum: c
                } = c0(t);
            "number" == typeof o && (r.minItems = o), "number" == typeof c && (r.maxItems = c), r.type = "array", r.items = cZ(a.element, n, {
                ...i,
                path: [...i.path, "items"]
            })
        };

    function ub(t) {
        let n = t._zod.def;
        return "pipe" === n.type && n.in._zod.traits.has("$ZodTransform") ? ub(n.out) : "catch" === n.type ? ub(n.innerType) : t._zod.optin
    }
    let uy = (t, n, r, i) => {
            var a;
            let o = t._zod.def,
                c = o.shape;
            if (Object.getOwnPropertySymbols(c).length && cD(t, n, r, i, "Symbol keys cannot be represented in JSON Schema")) return;
            for (let t in r.type = "object", r.properties = {}, c) O(r.properties, t, cZ(c[t], n, {
                ...i,
                path: [...i.path, "properties", t]
            }));
            let u = [];
            for (let t of Object.keys(c)) {
                let r = o.shape[t];
                ("input" === n.io ? void 0 === ub(r) : void 0 === r._zod.optout) && u.push(t)
            }
            u.length > 0 && (r.required = u), (null == (a = o.catchall) ? void 0 : a._zod.def.type) === "never" ? r.additionalProperties = !1 : o.catchall ? o.catchall && (r.additionalProperties = cZ(o.catchall, n, {
                ...i,
                path: [...i.path, "additionalProperties"]
            })) : "output" === n.io && (r.additionalProperties = !1)
        },
        u_ = (t, n, r, i) => {
            let a = t._zod.def,
                o = !1 === a.inclusive,
                c = a.options.map((t, r) => cZ(t, n, {
                    ...i,
                    path: [...i.path, o ? "oneOf" : "anyOf", r]
                }));
            o ? r.oneOf = c : r.anyOf = c
        },
        uI = (t, n, r, i) => {
            let a = t._zod.def,
                o = cZ(a.left, n, {
                    ...i,
                    path: [...i.path, "allOf", 0]
                }),
                c = cZ(a.right, n, {
                    ...i,
                    path: [...i.path, "allOf", 1]
                }),
                u = t => "allOf" in t && 1 === Object.keys(t).length,
                l = [...u(o) ? o.allOf : [o], ...u(c) ? c.allOf : [c]];
            r.allOf = l, n.intersections.push(l)
        },
        uk = (t, n, r, i) => {
            let a = t._zod.def;
            r.type = "array";
            let o = "draft-2020-12" === n.target ? "prefixItems" : "items",
                c = "draft-2020-12" === n.target || "openapi-3.0" === n.target ? "items" : "additionalItems",
                u = a.items.map((t, r) => cZ(t, n, {
                    ...i,
                    path: [...i.path, o, r]
                })),
                l = a.rest ? cZ(a.rest, n, {
                    ...i,
                    path: [...i.path, c, ..."openapi-3.0" === n.target ? [a.items.length] : []]
                }) : null,
                s = a.items.length;
            for (; s > 0;) {
                let t = a.items[s - 1];
                if (!("input" === n.io ? void 0 !== ub(t) : "optional" === t._zod.optout)) break;
                s--
            }
            let d = a.items.length,
                m = !a.rest;
            "draft-2020-12" === n.target ? (r.prefixItems = u, m ? r.items = !1 : l && (r.items = l)) : "openapi-3.0" === n.target ? (r.items = {
                anyOf: u
            }, l && r.items.anyOf.push(l)) : (r.items = u, m ? r.additionalItems = !1 : l && (r.additionalItems = l)), s > 0 && (r.minItems = s), m && (r.maxItems = d);
            let {
                minimum: f,
                maximum: v
            } = c0(t);
            "number" == typeof f && (r.minItems = f), "number" == typeof v && (r.maxItems = v)
        },
        uw = new WeakMap,
        ux = (t, n, r, i) => {
            let a = t._zod.def;
            r.type = "object";
            let o = a.keyType,
                c = c0(o).patterns;
            if ("loose" === a.mode && c && c.size > 0) {
                let t = cZ(a.valueType, n, {
                    ...i,
                    path: [...i.path, "patternProperties", "*"]
                });
                for (let n of (r.patternProperties = {}, c)) O(r.patternProperties, c6(n).source, t)
            } else {
                if ("draft-07" === n.target || "draft-2020-12" === n.target) {
                    r.propertyNames = cZ(a.keyType, n, {
                        ...i,
                        path: [...i.path, "propertyNames"]
                    });
                    let o = uw.get(n);
                    o || (o = [], uw.set(n, o), n.deferred.push(() => (function(t) {
                        var n, r, i;
                        let a = new Map;
                        for (let n of t.seen.values()) n.def && !a.has(n.schema) && a.set(n.schema, n);
                        let o = new Map;
                        for (let c of null != (n = uw.get(t)) ? n : []) {
                            let n = t.seen.get(c),
                                u = null == (i = null != (r = null == n ? void 0 : n.def) ? r : null == n ? void 0 : n.schema) ? void 0 : i.propertyNames;
                            if (!u || !0 === u || o.has(u)) continue;
                            let l = function t(n, r, i) {
                                var a, o;
                                if (r.$ref) {
                                    if (i.has(r)) return r;
                                    i.add(r);
                                    let a = null == (o = n.get(r)) ? void 0 : o.def;
                                    if (!a) return r;
                                    let c = t(n, a, i);
                                    return c === a ? r : c
                                }
                                for (let a of ["anyOf", "oneOf"]) {
                                    let o = r[a];
                                    if (!Array.isArray(o)) continue;
                                    let c = o.map(r => t(n, r, i));
                                    c.some((t, n) => t !== o[n]) && (r = {
                                        ...r,
                                        [a]: c
                                    })
                                }
                                let c = Array.isArray(r.type) ? r.type : [r.type],
                                    u = !c.includes("string") && c.some(t => "number" === t || "integer" === t),
                                    l = null != (a = r.enum) ? a : void 0 !== r.const ? [r.const] : void 0;
                                if (!u && !(null == l ? void 0 : l.some(t => "number" == typeof t))) return r;
                                let {
                                    minimum: s,
                                    maximum: d,
                                    exclusiveMinimum: m,
                                    exclusiveMaximum: f,
                                    multipleOf: v,
                                    format: p,
                                    id: g,
                                    ...h
                                } = r;
                                return h.enum ? h.enum = h.enum.map(t => "number" == typeof t ? String(t) : t) : "number" == typeof h.const && (h.const = String(h.const)), u && (h.type = "string", l || (h.pattern = (c.includes("number") ? tx : tw).source)), h
                            }(a, u, new Set);
                            l !== u && o.set(u, l)
                        }
                        if (o.size)
                            for (let n of t.seen.values())
                                for (let t of [n.schema, n.def]) {
                                    let n = t && o.get(t.propertyNames);
                                    n && (t.propertyNames = n)
                                }
                    })(n))), o.push(t)
                }
                r.additionalProperties = cZ(a.valueType, n, {
                    ...i,
                    path: [...i.path, "additionalProperties"]
                })
            }
            let u = o._zod.values,
                l = "input" === n.io && void 0 !== ub(a.valueType);
            if (u && !a.partial && !l) {
                let t = [...u].filter(t => "string" == typeof t || "number" == typeof t);
                t.length > 0 && (r.required = t.map(String))
            }
        },
        uS = (t, n, r, i) => {
            let a = t._zod.def,
                o = cZ(a.innerType, n, i),
                c = n.seen.get(t);
            "openapi-3.0" === n.target ? (c.ref = a.innerType, r.nullable = !0) : r.anyOf = [o, {
                type: "null"
            }]
        },
        uz = (t, n, r, i) => {
            let a = t._zod.def;
            cZ(a.innerType, n, i), n.seen.get(t).ref = a.innerType
        },
        uA = Symbol();

    function uU(t, n, r, i, a) {
        let o = !1,
            c = JSON.stringify(t, (t, n) => "bigint" != typeof n ? n : (o = !0, null));
        return o ? (cD(n, r, i, a, "BigInt defaults cannot be represented in JSON Schema"), uA) : JSON.parse(c)
    }
    let uP = (t, n, r, i) => {
            let a = t._zod.def;
            cZ(a.innerType, n, i), n.seen.get(t).ref = a.innerType;
            let o = uU(a.defaultValue, t, n, r, i);
            o !== uA && (r.default = o)
        },
        uO = (t, n, r, i) => {
            let a = t._zod.def;
            if (cZ(a.innerType, n, i), n.seen.get(t).ref = a.innerType, "input" !== n.io) return;
            let o = uU(a.defaultValue, t, n, r, i);
            o !== uA && (r._prefault = o)
        },
        uN = (t, n, r, i) => {
            let a, o = t._zod.def;
            cZ(o.innerType, n, i), n.seen.get(t).ref = o.innerType;
            try {
                a = o.catchValue(void 0)
            } catch (a) {
                cD(t, n, r, i, "Dynamic catch values are not supported in JSON Schema");
                return
            }
            r.default = a
        },
        uD = (t, n, r, i) => {
            let a = t._zod.def,
                o = a.in._zod.traits.has("$ZodTransform"),
                c = "input" === n.io ? o ? a.out : a.in : a.out;
            cZ(c, n, i), n.seen.get(t).ref = c
        },
        uZ = (t, n, r, i) => {
            let a = t._zod.def;
            cZ(a.innerType, n, i), n.seen.get(t).ref = a.innerType, r.readOnly = !0
        },
        uj = (t, n, r, i) => {
            let a = t._zod.def;
            cZ(a.innerType, n, i), n.seen.get(t).ref = a.innerType
        },
        uT = (t, n, r, i) => {
            let a = t._zod.def;
            cZ(a.innerType, n, i), n.seen.get(t).ref = a.innerType
        },
        uE = (t, n, r, i) => {
            let a = t._zod.innerType;
            cZ(a, n, i), n.seen.get(t).ref = a
        },
        uC = {
            string: c2,
            number: c5,
            boolean: c3,
            bigint: c9,
            symbol: c8,
            null: c7,
            undefined: ue,
            void: ut,
            never: un,
            any: ur,
            unknown: ui,
            date: ua,
            enum: uo,
            literal: uc,
            nan: uu,
            template_literal: ul,
            file: us,
            success: ud,
            custom: um,
            function: uf,
            transform: uv,
            map: up,
            set: ug,
            array: uh,
            object: uy,
            union: u_,
            intersection: uI,
            tuple: uk,
            record: ux,
            nullable: uS,
            nonoptional: uz,
            default: uP,
            prefault: uO,
            catch: uN,
            pipe: uD,
            readonly: uZ,
            promise: uj,
            optional: uT,
            lazy: uE
        };

    function u$(t, n) {
        if ("_idmap" in t) {
            let r = cN({
                    ...n,
                    processors: uC
                }),
                i = {};
            for (let n of t._idmap.entries()) {
                let [t, i] = n;
                cZ(i, r)
            }
            let a = {};
            for (let o of (r.external = {
                    registry: t,
                    uri: null == n ? void 0 : n.uri,
                    defs: i
                }, t._idmap.entries())) {
                let [t, n] = o;
                cT(r, n), O(a, t, cL(r, n))
            }
            return Object.keys(i).length > 0 && (a.__shared = {
                ["draft-2020-12" === r.target ? "$defs" : "definitions"]: i
            }), {
                schemas: a
            }
        }
        let r = cN({
            ...n,
            processors: uC
        });
        return cZ(t, r), cT(r, t), cL(r, t)
    }
    t.s(["aggregateChecks", 0, c0, "allProcessors", 0, uC, "anyProcessor", 0, ur, "arrayProcessor", 0, uh, "bigintProcessor", 0, c9, "booleanProcessor", 0, c3, "catchProcessor", 0, uN, "customProcessor", 0, um, "dateProcessor", 0, ua, "defaultProcessor", 0, uP, "enumProcessor", 0, uo, "fileProcessor", 0, us, "functionProcessor", 0, uf, "intersectionProcessor", 0, uI, "lazyProcessor", 0, uE, "literalProcessor", 0, uc, "mapProcessor", 0, up, "nanProcessor", 0, uu, "neverProcessor", 0, un, "nonoptionalProcessor", 0, uz, "nullProcessor", 0, c7, "nullableProcessor", 0, uS, "numberProcessor", 0, c5, "objectProcessor", 0, uy, "optionalProcessor", 0, uT, "pipeProcessor", 0, uD, "prefaultProcessor", 0, uO, "promiseProcessor", 0, uj, "readonlyProcessor", 0, uZ, "recordProcessor", 0, ux, "setProcessor", 0, ug, "stringProcessor", 0, c2, "successProcessor", 0, ud, "symbolProcessor", 0, c8, "templateLiteralProcessor", 0, ul, "toJSONSchema", 0, u$, "transformProcessor", 0, uv, "tupleProcessor", 0, uk, "undefinedProcessor", 0, ue, "unionProcessor", 0, u_, "unknownProcessor", 0, ui, "voidProcessor", 0, ut], 168722), t.s(["$ZodAny", 0, r1, "$ZodArray", 0, r8, "$ZodAsyncError", 0, l, "$ZodBase64", 0, rT, "$ZodBase64URL", 0, r$, "$ZodBigInt", 0, rH, "$ZodBigIntFormat", 0, rY, "$ZodBoolean", 0, rX, "$ZodCIDRv4", 0, rO, "$ZodCIDRv6", 0, rD, "$ZodCUID", 0, rg, "$ZodCUID2", 0, rh, "$ZodCatch", 0, iG, "$ZodCheck", 0, nD, "$ZodCheckBigIntFormat", 0, nL, "$ZodCheckEndsWith", 0, nQ, "$ZodCheckGreaterThan", 0, nC, "$ZodCheckIncludes", 0, nH, "$ZodCheckLengthEquals", 0, nF, "$ZodCheckLessThan", 0, nE, "$ZodCheckLowerCase", 0, nK, "$ZodCheckMaxLength", 0, nJ, "$ZodCheckMaxSize", 0, nG, "$ZodCheckMimeType", 0, n6, "$ZodCheckMinLength", 0, nV, "$ZodCheckMinSize", 0, nM, "$ZodCheckMultipleOf", 0, n$, "$ZodCheckNumberFormat", 0, nR, "$ZodCheckOverwrite", 0, n2, "$ZodCheckProperties", 0, n1, "$ZodCheckProperty", 0, n4, "$ZodCheckRegex", 0, nW, "$ZodCheckSizeEquals", 0, nB, "$ZodCheckStartsWith", 0, nY, "$ZodCheckStringFormat", 0, nq, "$ZodCheckUpperCase", 0, nX, "$ZodCodec", 0, iV, "$ZodCreditCard", 0, rM, "$ZodCustom", 0, i4, "$ZodCustomStringFormat", 0, rq, "$ZodCyclicError", 0, i6, "$ZodDate", 0, r3, "$ZodDefault", 0, ij, "$ZodDiscriminatedUnion", 0, im, "$ZodE164", 0, rR, "$ZodEmail", 0, ra, "$ZodEmoji", 0, rv, "$ZodEncodeError", 0, s, "$ZodEnum", 0, iz, "$ZodError", 0, t5, "$ZodExactOptional", 0, iD, "$ZodFile", 0, iU, "$ZodFunction", 0, iY, "$ZodGUID", 0, rr, "$ZodIBAN", 0, rJ, "$ZodIPv4", 0, rS, "$ZodIPv6", 0, rU, "$ZodISODate", 0, rk, "$ZodISODateTime", 0, rI, "$ZodISODuration", 0, rx, "$ZodISOTime", 0, rw, "$ZodIntersection", 0, iv, "$ZodJWT", 0, rF, "$ZodKSUID", 0, r_, "$ZodLazy", 0, i0, "$ZodLiteral", 0, iA, "$ZodMAC", 0, rP, "$ZodMap", 0, ik, "$ZodNaN", 0, iM, "$ZodNanoID", 0, rp, "$ZodNever", 0, r2, "$ZodNonOptional", 0, iC, "$ZodNull", 0, r4, "$ZodNullable", 0, iZ, "$ZodNumber", 0, rW, "$ZodNumberFormat", 0, rK, "$ZodObject", 0, ii, "$ZodObjectJIT", 0, ia, "$ZodOptional", 0, iN, "$ZodPipe", 0, iB, "$ZodPrefault", 0, iE, "$ZodPreprocess", 0, iW, "$ZodPromise", 0, iQ, "$ZodReadonly", 0, iK, "$ZodRealError", 0, t3, "$ZodRecord", 0, iI, "$ZodRegistry", 0, ac, "$ZodSet", 0, ix, "$ZodString", 0, rt, "$ZodStringFormat", 0, rn, "$ZodSuccess", 0, iR, "$ZodSymbol", 0, rQ, "$ZodTemplateLiteral", 0, iH, "$ZodTransform", 0, iP, "$ZodTuple", 0, ih, "$ZodType", 0, n9, "$ZodULID", 0, rb, "$ZodURL", 0, rf, "$ZodUUID", 0, ri, "$ZodUndefined", 0, r0, "$ZodUnion", 0, ic, "$ZodUnknown", 0, r6, "$ZodVoid", 0, r5, "$ZodXID", 0, ry, "$ZodXor", 0, il, "$brand", 0, u, "$constructor", 0, c, "$input", 0, ao, "$output", 0, aa, "Doc", 0, n5, "INVALID", 0, as, "JSONSchema", 0, t0, "JSONSchemaGenerator", 0, class {
        get metadataRegistry() {
            return this.ctx.metadataRegistry
        }
        get target() {
            return this.ctx.target
        }
        get unrepresentable() {
            return this.ctx.unrepresentable
        }
        get override() {
            return this.ctx.override
        }
        get io() {
            return this.ctx.io
        }
        get counter() {
            return this.ctx.counter
        }
        set counter(t) {
            this.ctx.counter = t
        }
        get seen() {
            return this.ctx.seen
        }
        process(t) {
            let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {
                path: [],
                schemaPath: []
            };
            return cZ(t, this.ctx, n)
        }
        emit(t, n) {
            n && (n.cycles && (this.ctx.cycles = n.cycles), n.reused && (this.ctx.reused = n.reused), n.external && (this.ctx.external = n.external)), this.ctx.sharedDefsExtractedFor = void 0, this.ctx.sharedEmitDoneFor = void 0, cT(this.ctx, t);
            let {
                "~standard": r,
                ...i
            } = cL(this.ctx, t);
            return i
        }
        constructor(t) {
            var n;
            let r = null != (n = null == t ? void 0 : t.target) ? n : "draft-2020-12";
            "draft-4" === r && (r = "draft-04"), "draft-7" === r && (r = "draft-07"), this.ctx = cN({
                processors: uC,
                target: r,
                ...(null == t ? void 0 : t.metadata) && {
                    metadata: t.metadata
                },
                ...(null == t ? void 0 : t.unrepresentable) && {
                    unrepresentable: t.unrepresentable
                },
                ...(null == t ? void 0 : t.override) && {
                    override: t.override
                },
                ...(null == t ? void 0 : t.io) && {
                    io: t.io
                }
            })
        }
    }, "NEVER", 0, i, "TimePrecision", 0, or, "URL_BAD_FORMAT", 0, 1, "URL_UNPARSEABLE", 0, 2, "ZodCompileAsyncError", 0, am, "ZodCompileUnsupportedError", 0, af, "_any", 0, ox, "_array", 0, o9, "_base64", 0, a9, "_base64url", 0, a8, "_bigint", 0, oh, "_boolean", 0, op, "_catch", 0, cg, "_check", 0, cS, "_cidrv4", 0, a5, "_cidrv6", 0, a3, "_coercedBigint", 0, ob, "_coercedBoolean", 0, og, "_coercedDate", 0, oP, "_coercedNumber", 0, ol, "_coercedString", 0, aG, "_creditCard", 0, oe, "_cuid", 0, aH, "_cuid2", 0, aY, "_custom", 0, ck, "_date", 0, oU, "_decode", 0, nb, "_decodeAsync", 0, nk, "_default", 0, cf, "_discriminatedUnion", 0, ce, "_e164", 0, a7, "_email", 0, aM, "_emoji", 0, aK, "_encode", 0, ng, "_encodeAsync", 0, n_, "_endsWith", 0, oH, "_enum", 0, co, "_file", 0, cl, "_float32", 0, od, "_float64", 0, om, "_gt", 0, oZ, "_gte", 0, oj, "_guid", 0, aB, "_iban", 0, ot, "_includes", 0, oK, "_int", 0, os, "_int32", 0, of, "_int64", 0, oy, "_intersection", 0, ct, "_ipv4", 0, a1, "_ipv6", 0, a6, "_isoDate", 0, oa, "_isoDateTime", 0, oi, "_isoDuration", 0, oc, "_isoTime", 0, oo, "_jwt", 0, on, "_ksuid", 0, a4, "_lazy", 0, c_, "_length", 0, oV, "_literal", 0, cu, "_lowercase", 0, oq, "_lt", 0, oN, "_lte", 0, oD, "_mac", 0, a2, "_map", 0, ci, "_max", 0, oD, "_maxLength", 0, oB, "_maxSize", 0, oL, "_mime", 0, o0, "_min", 0, oj, "_minLength", 0, oJ, "_minSize", 0, oG, "_multipleOf", 0, oR, "_nan", 0, oO, "_nanoid", 0, aX, "_nativeEnum", 0, cc, "_negative", 0, oE, "_never", 0, oz, "_nonnegative", 0, o$, "_nonoptional", 0, cv, "_nonpositive", 0, oC, "_normalize", 0, o1, "_null", 0, ow, "_nullable", 0, cm, "_number", 0, ou, "_optional", 0, cd, "_overwrite", 0, o4, "_parse", 0, nr, "_parseAsync", 0, na, "_pipe", 0, ch, "_positive", 0, oT, "_promise", 0, cI, "_properties", 0, oQ, "_property", 0, oY, "_readonly", 0, cb, "_record", 0, cr, "_refine", 0, cw, "_regex", 0, oF, "_safeDecode", 0, nz, "_safeDecodeAsync", 0, nO, "_safeEncode", 0, nx, "_safeEncodeAsync", 0, nU, "_safeParse", 0, nc, "_safeParseAsync", 0, ns, "_set", 0, ca, "_size", 0, oM, "_slugify", 0, o3, "_startsWith", 0, oX, "_string", 0, aL, "_stringFormat", 0, cP, "_stringbool", 0, cU, "_success", 0, cp, "_superRefine", 0, cx, "_symbol", 0, oI, "_templateLiteral", 0, cy, "_toLowerCase", 0, o2, "_toUpperCase", 0, o5, "_transform", 0, cs, "_trim", 0, o6, "_tuple", 0, cn, "_uint32", 0, ov, "_uint64", 0, o_, "_ulid", 0, aQ, "_undefined", 0, ok, "_union", 0, o8, "_unknown", 0, oS, "_uppercase", 0, oW, "_url", 0, aW, "_uuid", 0, aJ, "_uuidv4", 0, aV, "_uuidv6", 0, aF, "_uuidv7", 0, aq, "_void", 0, oA, "_xid", 0, a0, "_xor", 0, o7, "base64Charset", 0, rj, "base64urlCharset", 0, rE, "canParseURL", 0, ro, "clone", 0, Q, "compile", 0, av, "compileFn", 0, ag, "config", 0, m, "createStandardJSONSchemaMethod", 0, cM, "createToJSONSchemaMethod", 0, cG, "decode", 0, ny, "decodeAsync", 0, nw, "describe", 0, cz, "encode", 0, nh, "encodeAsync", 0, nI, "extractDefs", 0, cT, "finalize", 0, cL, "flattenError", 0, t9, "formatError", 0, t8, "getDiscriminatedOption", 0, is, "globalConfig", 0, d, "globalRegistry", 0, al, "handleUnrepresentable", 0, cD, "initializeContext", 0, cN, "isBackEdge", 0, ai, "isRecursiveSchema", 0, ae, "isValidBase64", 0, rZ, "isValidBase64URL", 0, rC, "isValidCIDRv6", 0, rN, "isValidCreditCard", 0, rG, "isValidIBAN", 0, rB, "isValidIPv6", 0, rA, "isValidJWT", 0, rV, "locales", 0, tQ, "memoizer", 0, ar, "mergeValues", 0, ip, "meta", 0, cA, "parse", 0, ni, "parseAsync", 0, no, "parseURLObject", 0, ru, "prettifyError", 0, nt, "process", 0, cZ, "processSchema", 0, cZ, "regexes", 0, tB, "registry", 0, au, "safeDecode", 0, nA, "safeDecodeAsync", 0, nN, "safeEncode", 0, nS, "safeEncodeAsync", 0, nP, "safeParse", 0, nu, "safeParseAsync", 0, nd, "standardProps", 0, re, "stripTabAndNewline", 0, rs, "toDotPath", 0, ne, "toJSONSchema", 0, u$, "toZod", 0, p, "treeifyError", 0, t7, "urlHostnameOk", 0, rd, "urlProtocolOk", 0, rm, "util", 0, eW, "validate", 0, nv, "validateAsync", 0, np, "validateURL", 0, rc, "version", 0, n3, "withParser", 0, ap], 676506);
    var uR = t.i(676506),
        uL = tB;
    t.s(["regexes", 0, uL], 490742);
    var uL = tB,
        uG = eW;
    t.s(["util", 0, uG], 925633);
    var uG = eW;
    t.s(["minLength", 0, oJ], 566387);
    let uM = new WeakSet([Object.prototype, Error.prototype]);

    function uB(t, n, r) {
        Object.defineProperty(t, n, {
            configurable: !0,
            enumerable: !1,
            get() {
                let t = r(this);
                return Object.defineProperty(this, n, {
                    value: t,
                    configurable: !0,
                    writable: !0
                }), t
            },
            set(t) {
                Object.defineProperty(this, n, {
                    value: t,
                    configurable: !0,
                    writable: !0
                })
            }
        })
    }
    let uJ = (t, n) => {
            t5.init(t, n), t.name = "ZodError";
            let r = Object.getPrototypeOf(t);
            uM.has(r) || (uM.add(r), uB(r, "format", t => n => t8(t, n)), uB(r, "flatten", t => n => t9(t, n)), uB(r, "addIssue", t => n => {
                t.issues.push(n), t.message = JSON.stringify(t.issues, I, 2)
            }), uB(r, "addIssues", t => n => {
                t.issues.push(...n), t.message = JSON.stringify(t.issues, I, 2)
            }), Object.defineProperty(r, "isEmpty", {
                configurable: !0,
                enumerable: !1,
                get() {
                    return 0 === this.issues.length
                }
            }))
        },
        uV = c("ZodError", uJ),
        uF = c("ZodError", uJ, void 0, {
            Parent: Error
        });
    t.s(["ZodError", 0, uV, "ZodRealError", 0, uF], 355475);
    let uq = nr(uF),
        uW = na(uF),
        uK = nc(uF),
        uX = ns(uF),
        uH = ng(uF),
        uY = nb(uF),
        uQ = n_(uF),
        u0 = nk(uF),
        u4 = nx(uF),
        u1 = nz(uF),
        u6 = nU(uF),
        u2 = nO(uF);

    function u5() {
        d.memoizer || m({
            memoizer: ar()
        })
    }
    t.s(["decode", 0, uY, "decodeAsync", 0, u0, "encode", 0, uH, "encodeAsync", 0, uQ, "parse", 0, uq, "parseAsync", 0, uW, "safeDecode", 0, u1, "safeDecodeAsync", 0, u2, "safeEncode", 0, u4, "safeEncodeAsync", 0, u6, "safeParse", 0, uK, "safeParseAsync", 0, uX], 176860);
    let u3 = c("ZodType", (t, n) => (d.localeError || m(tV()), n9.init(t, n), t.def = n, t.type = n.type, t), {
            check() {
                for (var t, n = arguments.length, r = Array(n), i = 0; i < n; i++) r[i] = arguments[i];
                let a = this.def;
                return this.clone(uG.mergeDefs(a, {
                    checks: [...null != (t = a.checks) ? t : [], ...r.map(t => "function" == typeof t ? {
                        _zod: {
                            check: t,
                            def: {
                                check: "custom"
                            },
                            onattach: []
                        }
                    } : t)]
                }), {
                    parent: !0
                })
            },
            with() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return this.check(...n)
            },
            clone(t, n) {
                return Q(this, t, n)
            },
            brand() {
                return this
            },
            register(t, n) {
                return t.add(this, n), this
            },
            refine(t, n) {
                return this.check(dE(t, n))
            },
            superRefine(t, n) {
                return this.check(dC(t, n))
            },
            overwrite(t) {
                return this.check(o4(t))
            },
            optional() {
                return s8(this)
            },
            exactOptional() {
                return de(this)
            },
            nullable() {
                return dn(this)
            },
            nullish() {
                return s8(dn(this))
            },
            nonoptional(t) {
                return ds(this, t)
            },
            array() {
                return sU(this)
            },
            or(t) {
                return sT([this, t])
            },
            and(t) {
                return sG(this, t)
            },
            transform(t) {
                return db(this, s3(t))
            },
            default (t) {
                return da(this, t)
            },
            prefault(t) {
                return du(this, t)
            },
            catch (t) {
                return dv(this, t)
            },
            pipe(t) {
                return db(this, t)
            },
            readonly() {
                return dx(this)
            },
            describe(t) {
                let n = this.clone();
                return al.add(n, {
                    description: t
                }), n
            },
            meta() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                if (0 === n.length) return al.get(this);
                let i = this.clone();
                return al.add(i, n[0]), i
            },
            isOptional() {
                return this.safeParse(void 0).success
            },
            isNullable() {
                return this.safeParse(null).success
            },
            apply(t) {
                for (var n = arguments.length, r = Array(n > 1 ? n - 1 : 0), i = 1; i < n; i++) r[i - 1] = arguments[i];
                return 0 === r.length ? t(this) : t(this, ...r)
            },
            get "~standard"() {
                return uG.hide(this, "~standard", {
                    ...re(this),
                    jsonSchema: {
                        input: cM(this, "input"),
                        output: cM(this, "output")
                    }
                })
            },
            set "~standard"(value) {
                uG.own(this, "~standard", value)
            },
            parse: function t(n, r) {
                return uq(this, n, r, {
                    callee: t
                })
            },
            parseAsync: async function t(n, r) {
                return await uW(this, n, r, {
                    callee: t
                })
            },
            safeParse(t, n) {
                return uK(this, t, n)
            },
            async safeParseAsync(t, n) {
                return uX(this, t, n)
            },
            get spa() {
                return null === this || void 0 === this ? void 0 : this.safeParseAsync
            },
            set spa(value) {
                uG.own(this, "spa", value)
            },
            validate(t, n) {
                return nv(this, t, n)
            },
            validateAsync(t, n) {
                return np(this, t, n)
            },
            encode: function t(n, r) {
                return uH(this, n, r, {
                    callee: t
                })
            },
            decode: function t(n, r) {
                return uY(this, n, r, {
                    callee: t
                })
            },
            encodeAsync: async function t(n, r) {
                return await uQ(this, n, r, {
                    callee: t
                })
            },
            decodeAsync: async function t(n, r) {
                return await u0(this, n, r, {
                    callee: t
                })
            },
            safeEncode(t, n) {
                return u4(this, t, n)
            },
            safeDecode(t, n) {
                return u1(this, t, n)
            },
            async safeEncodeAsync(t, n) {
                return u6(this, t, n)
            },
            async safeDecodeAsync(t, n) {
                return u2(this, t, n)
            },
            toJSONSchema(t) {
                return cG(this, {})(t)
            },
            get description() {
                var u9;
                return null == (u9 = al.get(this)) ? void 0 : u9.description
            },
            get _def() {
                return this._zod.def
            }
        }),
        u8 = c("_ZodString", (t, n) => {
            rt.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => c2(t, n, r, i)
        }, uG.derived({
            format: t => {
                var n;
                return null != (n = c0(t).format) ? n : null
            },
            minLength: t => {
                var n;
                return null != (n = c0(t).minimum) ? n : null
            },
            maxLength: t => {
                var n;
                return null != (n = c0(t).maximum) ? n : null
            }
        }, {
            regex() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return this.check(oF(...n))
            },
            includes() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return this.check(oK(...n))
            },
            startsWith() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return this.check(oX(...n))
            },
            endsWith() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return this.check(oH(...n))
            },
            min() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return this.check(oJ(...n))
            },
            max() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return this.check(oB(...n))
            },
            length() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return this.check(oV(...n))
            },
            nonempty() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return this.check(oJ(1, ...n))
            },
            lowercase(t) {
                return this.check(oq(t))
            },
            uppercase(t) {
                return this.check(oW(t))
            },
            trim() {
                return this.check(o6())
            },
            normalize() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return this.check(o1(...n))
            },
            toLowerCase() {
                return this.check(o2())
            },
            toUpperCase() {
                return this.check(o5())
            },
            slugify() {
                return this.check(o3())
            }
        })),
        u7 = c("ZodString", (t, n) => {
            rt.init(t, n), u8.init(t, n)
        }, {
            email(t) {
                return this.check(aM(lo, t))
            },
            url(t) {
                return this.check(aW(lp, t))
            },
            jwt(t) {
                return this.check(on(lY, t))
            },
            emoji(t) {
                return this.check(aK(lb, t))
            },
            guid(t) {
                return this.check(aB(lu, t))
            },
            uuid(t) {
                return this.check(aJ(ls, t))
            },
            uuidv4(t) {
                return this.check(aV(ls, t))
            },
            uuidv6(t) {
                return this.check(aF(ls, t))
            },
            uuidv7(t) {
                return this.check(aq(ls, t))
            },
            nanoid(t) {
                return this.check(aX(l_, t))
            },
            cuid(t) {
                return this.check(aH(lk, t))
            },
            cuid2(t) {
                return this.check(aY(lx, t))
            },
            ulid(t) {
                return this.check(aQ(lz, t))
            },
            base64(t) {
                return this.check(a9(lM, t))
            },
            base64url(t) {
                return this.check(a8(lJ, t))
            },
            xid(t) {
                return this.check(a0(lU, t))
            },
            ksuid(t) {
                return this.check(a4(lO, t))
            },
            ipv4(t) {
                return this.check(a1(lD, t))
            },
            ipv6(t) {
                return this.check(a6(lE, t))
            },
            cidrv4(t) {
                return this.check(a5(l$, t))
            },
            cidrv6(t) {
                return this.check(a3(lL, t))
            },
            e164(t) {
                return this.check(a7(lF, t))
            },
            datetime(t) {
                return this.check(oi(ln, t))
            },
            date(t) {
                return this.check(oa(lr, t))
            },
            time(t) {
                return this.check(oo(li, t))
            },
            duration(t) {
                return this.check(oc(la, t))
            }
        });

    function le(t) {
        return aL(u7, t)
    }
    let lt = c("ZodStringFormat", (t, n) => {
            rn.init(t, n), u8.init(t, n)
        }),
        ln = c("ZodISODateTime", (t, n) => {
            rI.init(t, n), lt.init(t, n)
        }),
        lr = c("ZodISODate", (t, n) => {
            rk.init(t, n), lt.init(t, n)
        }),
        li = c("ZodISOTime", (t, n) => {
            rw.init(t, n), lt.init(t, n)
        }),
        la = c("ZodISODuration", (t, n) => {
            rx.init(t, n), lt.init(t, n)
        }),
        lo = c("ZodEmail", (t, n) => {
            ra.init(t, n), lt.init(t, n)
        });

    function lc(t) {
        return aM(lo, t)
    }
    let lu = c("ZodGUID", (t, n) => {
        rr.init(t, n), lt.init(t, n)
    });

    function ll(t) {
        return aB(lu, t)
    }
    let ls = c("ZodUUID", (t, n) => {
        ri.init(t, n), lt.init(t, n)
    });

    function ld(t) {
        return aJ(ls, t)
    }

    function lm(t) {
        return aV(ls, t)
    }

    function lf(t) {
        return aF(ls, t)
    }

    function lv(t) {
        return aq(ls, t)
    }
    let lp = c("ZodURL", (t, n) => {
        rf.init(t, n), lt.init(t, n)
    });

    function lg(t) {
        return aW(lp, t)
    }

    function lh(t) {
        return aW(lp, {
            protocol: ts,
            hostname: tl,
            ...uG.normalizeParams(t)
        })
    }
    let lb = c("ZodEmoji", (t, n) => {
        rv.init(t, n), lt.init(t, n)
    });

    function ly(t) {
        return aK(lb, t)
    }
    let l_ = c("ZodNanoID", (t, n) => {
        rp.init(t, n), lt.init(t, n)
    });

    function lI(t) {
        return aX(l_, t)
    }
    let lk = c("ZodCUID", (t, n) => {
        rg.init(t, n), lt.init(t, n)
    });

    function lw(t) {
        return aH(lk, t)
    }
    let lx = c("ZodCUID2", (t, n) => {
        rh.init(t, n), lt.init(t, n)
    });

    function lS(t) {
        return aY(lx, t)
    }
    let lz = c("ZodULID", (t, n) => {
        rb.init(t, n), lt.init(t, n)
    });

    function lA(t) {
        return aQ(lz, t)
    }
    let lU = c("ZodXID", (t, n) => {
        ry.init(t, n), lt.init(t, n)
    });

    function lP(t) {
        return a0(lU, t)
    }
    let lO = c("ZodKSUID", (t, n) => {
        r_.init(t, n), lt.init(t, n)
    });

    function lN(t) {
        return a4(lO, t)
    }
    let lD = c("ZodIPv4", (t, n) => {
        rS.init(t, n), lt.init(t, n)
    });

    function lZ(t) {
        return a1(lD, t)
    }
    let lj = c("ZodMAC", (t, n) => {
        rP.init(t, n), lt.init(t, n)
    });

    function lT(t) {
        return a2(lj, t)
    }
    let lE = c("ZodIPv6", (t, n) => {
        rU.init(t, n), lt.init(t, n)
    });

    function lC(t) {
        return a6(lE, t)
    }
    let l$ = c("ZodCIDRv4", (t, n) => {
        rO.init(t, n), lt.init(t, n)
    });

    function lR(t) {
        return a5(l$, t)
    }
    let lL = c("ZodCIDRv6", (t, n) => {
        rD.init(t, n), lt.init(t, n)
    });

    function lG(t) {
        return a3(lL, t)
    }
    let lM = c("ZodBase64", (t, n) => {
        rT.init(t, n), lt.init(t, n)
    });

    function lB(t) {
        return a9(lM, t)
    }
    let lJ = c("ZodBase64URL", (t, n) => {
        r$.init(t, n), lt.init(t, n)
    });

    function lV(t) {
        return a8(lJ, t)
    }
    let lF = c("ZodE164", (t, n) => {
        rR.init(t, n), lt.init(t, n)
    });

    function lq(t) {
        return a7(lF, t)
    }
    let lW = c("ZodCreditCard", (t, n) => {
        rM.init(t, n), lt.init(t, n)
    });

    function lK(t) {
        return oe(lW, t)
    }
    let lX = c("ZodIBAN", (t, n) => {
        rJ.init(t, n), lt.init(t, n)
    });

    function lH(t) {
        return ot(lX, t)
    }
    let lY = c("ZodJWT", (t, n) => {
        rF.init(t, n), lt.init(t, n)
    });

    function lQ(t) {
        return on(lY, t)
    }
    let l0 = c("ZodCustomStringFormat", (t, n) => {
        rq.init(t, n), lt.init(t, n)
    });

    function l4(t, n) {
        let r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return cP(l0, t, n, r)
    }

    function l1(t) {
        return cP(l0, "hostname", tu, t)
    }

    function l6(t) {
        return cP(l0, "hex", tO, t)
    }

    function l2(t) {
        return cP(l0, "currency_code", tf, t)
    }

    function l5(t, n) {
        var r;
        let i = null != (r = null == n ? void 0 : n.enc) ? r : "hex",
            a = "".concat(t, "_").concat(i),
            o = uL[a];
        if (!o) throw Error("Unrecognized hash format: ".concat(a));
        return cP(l0, a, o, n)
    }
    let l3 = c("ZodNumber", (t, n) => {
        rW.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => c5(t, n, r, i), t.isFinite = !0
    }, uG.derived({
        minValue: t => {
            let {
                minimum: n,
                exclusiveMinimum: r
            } = c0(t);
            return Math.max(null != n ? n : -1 / 0, null != r ? r : -1 / 0)
        },
        maxValue: t => {
            let {
                maximum: n,
                exclusiveMaximum: r
            } = c0(t);
            return Math.min(null != n ? n : 1 / 0, null != r ? r : 1 / 0)
        },
        isInt: t => {
            let {
                isInt: n,
                multipleOf: r
            } = c0(t);
            return !!n || !!(null == r ? void 0 : r.some(Number.isSafeInteger))
        },
        format: t => {
            var n;
            return null != (n = c0(t).format) ? n : null
        }
    }, {
        gt(t, n) {
            return this.check(oZ(t, n))
        },
        gte(t, n) {
            return this.check(oj(t, n))
        },
        min(t, n) {
            return this.check(oj(t, n))
        },
        lt(t, n) {
            return this.check(oN(t, n))
        },
        lte(t, n) {
            return this.check(oD(t, n))
        },
        max(t, n) {
            return this.check(oD(t, n))
        },
        int(t) {
            return this.check(l7(t))
        },
        safe(t) {
            return this.check(l7(t))
        },
        positive(t) {
            return this.check(oZ(0, t))
        },
        nonnegative(t) {
            return this.check(oj(0, t))
        },
        negative(t) {
            return this.check(oN(0, t))
        },
        nonpositive(t) {
            return this.check(oD(0, t))
        },
        multipleOf(t, n) {
            return this.check(oR(t, n))
        },
        step(t, n) {
            return this.check(oR(t, n))
        },
        finite() {
            return this
        }
    }));

    function l9(t) {
        return ou(l3, t)
    }
    let l8 = c("ZodNumberFormat", (t, n) => {
        rK.init(t, n), l3.init(t, n)
    });

    function l7(t) {
        return os(l8, t)
    }

    function se(t) {
        return od(l8, t)
    }

    function st(t) {
        return om(l8, t)
    }

    function sn(t) {
        return of(l8, t)
    }

    function sr(t) {
        return ov(l8, t)
    }
    let si = c("ZodBoolean", (t, n) => {
        rX.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => c3(t, n, r, i)
    });

    function sa(t) {
        return op(si, t)
    }
    let so = c("ZodBigInt", (t, n) => {
        rH.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => c9(t, n, r, i)
    }, uG.derived({
        minValue: t => {
            var n;
            return null != (n = c0(t).minimum) ? n : null
        },
        maxValue: t => {
            var n;
            return null != (n = c0(t).maximum) ? n : null
        },
        format: t => {
            var n;
            return null != (n = c0(t).format) ? n : null
        }
    }, {
        gte(t, n) {
            return this.check(oj(t, n))
        },
        min(t, n) {
            return this.check(oj(t, n))
        },
        gt(t, n) {
            return this.check(oZ(t, n))
        },
        lt(t, n) {
            return this.check(oN(t, n))
        },
        lte(t, n) {
            return this.check(oD(t, n))
        },
        max(t, n) {
            return this.check(oD(t, n))
        },
        positive(t) {
            return this.check(oZ(BigInt(0), t))
        },
        negative(t) {
            return this.check(oN(BigInt(0), t))
        },
        nonpositive(t) {
            return this.check(oD(BigInt(0), t))
        },
        nonnegative(t) {
            return this.check(oj(BigInt(0), t))
        },
        multipleOf(t, n) {
            return this.check(oR(t, n))
        }
    }));

    function sc(t) {
        return oh(so, t)
    }
    let su = c("ZodBigIntFormat", (t, n) => {
        rY.init(t, n), so.init(t, n)
    });

    function sl(t) {
        return oy(su, t)
    }

    function ss(t) {
        return o_(su, t)
    }
    let sd = c("ZodSymbol", (t, n) => {
        rQ.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => c8(t, n, r, i)
    });

    function sm(t) {
        return oI(sd, t)
    }
    let sf = c("ZodUndefined", (t, n) => {
        r0.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => ue(t, n, r, i)
    });

    function sv(t) {
        return ok(sf, t)
    }
    let sp = c("ZodNull", (t, n) => {
        r4.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => c7(t, n, r, i)
    });

    function sg(t) {
        return ow(sp, t)
    }
    let sh = c("ZodAny", (t, n) => {
        r1.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => ur(t, n, r, i)
    });

    function sb() {
        return ox(sh)
    }
    let sy = c("ZodUnknown", (t, n) => {
        r6.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => ui(t, n, r, i)
    });

    function s_() {
        return oS(sy)
    }
    let sI = c("ZodNever", (t, n) => {
        r2.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => un(t, n, r, i)
    });

    function sk(t) {
        return oz(sI, t)
    }
    let sw = c("ZodVoid", (t, n) => {
        r5.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => ut(t, n, r, i)
    });

    function sx(t) {
        return oA(sw, t)
    }
    let sS = c("ZodDate", (t, n) => {
        r3.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => ua(t, n, r, i), t.min = (n, r) => t.check(oj(n, r)), t.max = (n, r) => t.check(oD(n, r))
    }, uG.derived({
        minDate: t => {
            let {
                minimum: n
            } = c0(t);
            return n ? new Date(n) : null
        },
        maxDate: t => {
            let {
                maximum: n
            } = c0(t);
            return n ? new Date(n) : null
        }
    }, {}));

    function sz(t) {
        return oU(sS, t)
    }
    let sA = c("ZodArray", (t, n) => {
        u5(), r8.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => uh(t, n, r, i), t.element = n.element
    }, {
        min(t, n) {
            return this.check(oJ(t, n))
        },
        nonempty(t) {
            return this.check(oJ(1, t))
        },
        max(t, n) {
            return this.check(oB(t, n))
        },
        length(t, n) {
            return this.check(oV(t, n))
        },
        unwrap() {
            return this.element
        }
    });

    function sU(t, n) {
        return o9(sA, t, n)
    }

    function sP(t) {
        return sQ(Object.keys(t._zod.def.shape))
    }
    let sO = c("ZodObject", (t, n) => {
        u5(), ia.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => uy(t, n, r, i), uG.installLazyProp(t, "shape", t => t._zod.def.shape, !1)
    }, {
        keyof() {
            return sQ(Object.keys(this._zod.def.shape))
        },
        catchall(t) {
            return this.clone(uG.mergeDefs(this._zod.def, {
                catchall: t
            }))
        },
        passthrough() {
            return this.clone(uG.mergeDefs(this._zod.def, {
                catchall: s_()
            }))
        },
        loose() {
            return this.clone(uG.mergeDefs(this._zod.def, {
                catchall: s_()
            }))
        },
        strict() {
            return this.clone(uG.mergeDefs(this._zod.def, {
                catchall: sk()
            }))
        },
        strip() {
            return this.clone(uG.mergeDefs(this._zod.def, {
                catchall: void 0
            }))
        },
        extend(t) {
            return uG.extend(this, t)
        },
        safeExtend(t) {
            return uG.safeExtend(this, t)
        },
        merge(t) {
            return uG.merge(this, t)
        },
        pick(t) {
            return uG.pick(this, t)
        },
        omit(t) {
            return uG.omit(this, t)
        },
        partial() {
            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
            return uG.partial(s9, this, n[0])
        },
        exactPartial() {
            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
            return uG.partial(s7, this, n[0], "exactPartial")
        },
        required() {
            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
            return uG.required(dl, this, n[0])
        }
    });

    function sN(t, n) {
        return new sO({
            type: "object",
            shape: null != t ? t : {},
            ...uG.normalizeParams(n)
        })
    }

    function sD(t, n) {
        return new sO({
            type: "object",
            shape: t,
            catchall: sk(),
            ...uG.normalizeParams(n)
        })
    }

    function sZ(t, n) {
        return new sO({
            type: "object",
            shape: t,
            catchall: s_(),
            ...uG.normalizeParams(n)
        })
    }
    let sj = c("ZodUnion", (t, n) => {
        ic.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => u_(t, n, r, i), t.options = n.options
    });

    function sT(t, n) {
        return new sj({
            type: "union",
            options: t,
            ...uG.normalizeParams(n)
        })
    }
    let sE = c("ZodXor", (t, n) => {
        sj.init(t, n), il.init(t, n), t._zod.processJSONSchema = (n, r, i) => u_(t, n, r, i), t.options = n.options
    });

    function sC(t, n) {
        return new sE({
            type: "union",
            options: t,
            inclusive: !1,
            ...uG.normalizeParams(n)
        })
    }
    let s$ = c("ZodDiscriminatedUnion", (t, n) => {
        sj.init(t, n), im.init(t, n)
    });

    function sR(t, n, r) {
        return new s$({
            type: "union",
            options: n,
            discriminator: t,
            ...uG.normalizeParams(r)
        })
    }
    let sL = c("ZodIntersection", (t, n) => {
        iv.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => uI(t, n, r, i)
    });

    function sG(t, n) {
        return new sL({
            type: "intersection",
            left: t,
            right: n
        })
    }
    let sM = c("ZodTuple", (t, n) => {
        u5(), ih.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => uk(t, n, r, i)
    }, {
        rest(t) {
            return this.clone({
                ...this._zod.def,
                rest: t
            })
        },
        partial() {
            var t;
            let n = this._zod.def;
            if (null == (t = n.checks) ? void 0 : t.length) throw Error(".partial() cannot be used on tuple schemas containing refinements");
            return this.clone({
                ...n,
                items: n.items.map(t => new s9({
                    type: "optional",
                    innerType: t
                }))
            })
        }
    });

    function sB(t, n, r) {
        let i = n instanceof n9,
            a = i ? r : n;
        return new sM({
            type: "tuple",
            items: t,
            rest: i ? n : null,
            ...uG.normalizeParams(a)
        })
    }
    let sJ = c("ZodRecord", (t, n) => {
        u5(), iI.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => ux(t, n, r, i), t.keyType = n.keyType, t.valueType = n.valueType
    });

    function sV(t, n, r) {
        return new sJ(n && n._zod ? {
            type: "record",
            keyType: t,
            valueType: n,
            ...uG.normalizeParams(r)
        } : {
            type: "record",
            keyType: le(),
            valueType: t,
            ...uG.normalizeParams(n)
        })
    }

    function sF(t, n, r) {
        return new sJ({
            type: "record",
            keyType: t,
            valueType: n,
            ...uG.normalizeParams(r),
            partial: !0
        })
    }

    function sq(t, n, r) {
        return new sJ({
            type: "record",
            keyType: t,
            valueType: n,
            mode: "loose",
            ...uG.normalizeParams(r)
        })
    }
    let sW = c("ZodMap", (t, n) => {
        u5(), ik.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => up(t, n, r, i), t.keyType = n.keyType, t.valueType = n.valueType, t.min = function() {
            for (var n = arguments.length, r = Array(n), i = 0; i < n; i++) r[i] = arguments[i];
            return t.check(oG(...r))
        }, t.nonempty = n => t.check(oG(1, n)), t.max = function() {
            for (var n = arguments.length, r = Array(n), i = 0; i < n; i++) r[i] = arguments[i];
            return t.check(oL(...r))
        }, t.size = function() {
            for (var n = arguments.length, r = Array(n), i = 0; i < n; i++) r[i] = arguments[i];
            return t.check(oM(...r))
        }
    });

    function sK(t, n, r) {
        return new sW({
            type: "map",
            keyType: t,
            valueType: n,
            ...uG.normalizeParams(r)
        })
    }
    let sX = c("ZodSet", (t, n) => {
        u5(), ix.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => ug(t, n, r, i), t.min = function() {
            for (var n = arguments.length, r = Array(n), i = 0; i < n; i++) r[i] = arguments[i];
            return t.check(oG(...r))
        }, t.nonempty = n => t.check(oG(1, n)), t.max = function() {
            for (var n = arguments.length, r = Array(n), i = 0; i < n; i++) r[i] = arguments[i];
            return t.check(oL(...r))
        }, t.size = function() {
            for (var n = arguments.length, r = Array(n), i = 0; i < n; i++) r[i] = arguments[i];
            return t.check(oM(...r))
        }
    });

    function sH(t, n) {
        return new sX({
            type: "set",
            valueType: t,
            ...uG.normalizeParams(n)
        })
    }
    let sY = c("ZodEnum", (t, n) => {
        iz.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => uo(t, n, r, i), t.enum = n.entries, t.options = [...t._zod.values];
        let r = new Set(Object.keys(n.entries));
        t.extract = (t, i) => {
            let a = {};
            for (let i of t)
                if (r.has(i)) a[i] = n.entries[i];
                else throw Error("Key ".concat(i, " not found in enum"));
            return new sY({
                ...n,
                checks: [],
                ...uG.normalizeParams(i),
                entries: a
            })
        }, t.exclude = (t, i) => {
            let a = {
                ...n.entries
            };
            for (let n of t)
                if (r.has(n)) delete a[n];
                else throw Error("Key ".concat(n, " not found in enum"));
            return new sY({
                ...n,
                checks: [],
                ...uG.normalizeParams(i),
                entries: a
            })
        }
    });

    function sQ(t, n) {
        return new sY({
            type: "enum",
            entries: Array.isArray(t) ? Object.fromEntries(t.map(t => [t, t])) : t,
            ...uG.normalizeParams(n)
        })
    }

    function s0(t, n) {
        return new sY({
            type: "enum",
            entries: t,
            ...uG.normalizeParams(n)
        })
    }
    let s4 = c("ZodLiteral", (t, n) => {
        iA.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => uc(t, n, r, i), t.values = new Set(n.values), Object.defineProperty(t, "value", {
            get() {
                if (n.values.length > 1) throw Error("This schema contains multiple valid literal values. Use `.values` instead.");
                return n.values[0]
            }
        })
    });

    function s1(t, n) {
        return new s4({
            type: "literal",
            values: Array.isArray(t) ? t : [t],
            ...uG.normalizeParams(n)
        })
    }
    let s6 = c("ZodFile", (t, n) => {
        iU.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => us(t, n, r, i), t.min = (n, r) => t.check(oG(n, r)), t.max = (n, r) => t.check(oL(n, r)), t.mime = (n, r) => t.check(o0(Array.isArray(n) ? n : [n], r))
    });

    function s2(t) {
        return cl(s6, t)
    }
    let s5 = c("ZodTransform", (t, n) => {
        u5(), iP.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => uv(t, n, r, i), t._zod.parse = (r, i) => {
            if ("backward" === i.direction) throw new s(t.constructor.name);
            r.addIssue = i => {
                if ("string" == typeof i) r.issues.push(uG.issue(i, r.value, n));
                else i.fatal && (i.continue = !1), null != i.code || (i.code = "custom"), "input" in i || (i.input = r.value), null != i.inst || (i.inst = t), r.issues.push(uG.issue(i))
            };
            let a = n.transform(r.value, r);
            return a instanceof Promise ? a.then(t => (r.value = t, r)) : (r.value = a, r)
        }
    });

    function s3(t) {
        return new s5({
            type: "transform",
            transform: t
        })
    }
    let s9 = c("ZodOptional", (t, n) => {
        iN.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => uT(t, n, r, i), t.unwrap = () => t._zod.def.innerType
    });

    function s8(t) {
        return new s9({
            type: "optional",
            innerType: t
        })
    }
    let s7 = c("ZodExactOptional", (t, n) => {
        iD.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => uT(t, n, r, i), t.unwrap = () => t._zod.def.innerType
    });

    function de(t) {
        return new s7({
            type: "optional",
            innerType: t
        })
    }
    let dt = c("ZodNullable", (t, n) => {
        iZ.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => uS(t, n, r, i), t.unwrap = () => t._zod.def.innerType
    });

    function dn(t) {
        return new dt({
            type: "nullable",
            innerType: t
        })
    }

    function dr(t) {
        return s8(dn(t))
    }
    let di = c("ZodDefault", (t, n) => {
        ij.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => uP(t, n, r, i), t.unwrap = () => t._zod.def.innerType, t.removeDefault = t.unwrap
    });

    function da(t, n) {
        return new di({
            type: "default",
            innerType: t,
            get defaultValue() {
                return "function" == typeof n ? n() : uG.shallowClone(n)
            }
        })
    }
    let dc = c("ZodPrefault", (t, n) => {
        iE.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => uO(t, n, r, i), t.unwrap = () => t._zod.def.innerType
    });

    function du(t, n) {
        return new dc({
            type: "prefault",
            innerType: t,
            get defaultValue() {
                return "function" == typeof n ? n() : uG.shallowClone(n)
            }
        })
    }
    let dl = c("ZodNonOptional", (t, n) => {
        iC.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => uz(t, n, r, i), t.unwrap = () => t._zod.def.innerType
    });

    function ds(t, n) {
        return new dl({
            type: "nonoptional",
            innerType: t,
            ...uG.normalizeParams(n)
        })
    }
    let dd = c("ZodSuccess", (t, n) => {
        iR.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => ud(t, n, r, i), t.unwrap = () => t._zod.def.innerType
    });

    function dm(t) {
        return new dd({
            type: "success",
            innerType: t
        })
    }
    let df = c("ZodCatch", (t, n) => {
        iG.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => uN(t, n, r, i), t.unwrap = () => t._zod.def.innerType, t.removeCatch = t.unwrap
    });

    function dv(t, n) {
        return new df({
            type: "catch",
            innerType: t,
            catchValue: "function" == typeof n ? n : uG.constantCatch(n)
        })
    }
    let dp = c("ZodNaN", (t, n) => {
        iM.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => uu(t, n, r, i)
    });

    function dg(t) {
        return oO(dp, t)
    }
    let dh = c("ZodPipe", (t, n) => {
        iB.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => uD(t, n, r, i), t.in = n.in, t.out = n.out
    });

    function db(t, n) {
        return new dh({
            type: "pipe",
            in: t,
            out: n
        })
    }
    let dy = c("ZodCodec", (t, n) => {
        dh.init(t, n), iV.init(t, n)
    });

    function d_(t, n, r) {
        return new dy({
            type: "pipe",
            in: t,
            out: n,
            transform: r.decode,
            reverseTransform: r.encode
        })
    }

    function dI(t) {
        let n = t._zod.def;
        return new dy({
            type: "pipe",
            in: n.out,
            out: n.in,
            transform: n.reverseTransform,
            reverseTransform: n.transform
        })
    }
    let dk = c("ZodPreprocess", (t, n) => {
            dh.init(t, n), iW.init(t, n)
        }),
        dw = c("ZodReadonly", (t, n) => {
            iK.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => uZ(t, n, r, i), t.unwrap = () => t._zod.def.innerType
        });

    function dx(t) {
        return new dw({
            type: "readonly",
            innerType: t
        })
    }
    let dS = c("ZodTemplateLiteral", (t, n) => {
        iH.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => ul(t, n, r, i)
    });

    function dz(t, n) {
        return new dS({
            type: "template_literal",
            parts: t,
            ...uG.normalizeParams(n)
        })
    }
    let dA = c("ZodLazy", (t, n) => {
        i0.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => uE(t, n, r, i), t.unwrap = () => t._zod.def.getter()
    });

    function dU(t) {
        return new dA({
            type: "lazy",
            getter: t
        })
    }
    let dP = c("ZodPromise", (t, n) => {
        iQ.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => uj(t, n, r, i), t.unwrap = () => t._zod.def.innerType
    });

    function dO(t) {
        return new dP({
            type: "promise",
            innerType: t
        })
    }
    let dN = c("ZodFunction", (t, n) => {
        iY.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => uf(t, n, r, i)
    });

    function dD(t) {
        var n, r;
        return new dN({
            type: "function",
            input: Array.isArray(null == t ? void 0 : t.input) ? sB(null == t ? void 0 : t.input) : null != (n = null == t ? void 0 : t.input) ? n : sU(s_()),
            output: null != (r = null == t ? void 0 : t.output) ? r : s_()
        })
    }
    let dZ = c("ZodCustom", (t, n) => {
        i4.init(t, n), u3.init(t, n), t._zod.processJSONSchema = (n, r, i) => um(t, n, r, i)
    });

    function dj(t) {
        let n = new nD({
            check: "custom"
        });
        return n._zod.check = t, n
    }

    function dT(t, n) {
        return ck(dZ, null != t ? t : () => !0, n)
    }

    function dE(t) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
        return cw(dZ, t, n)
    }

    function dC(t, n) {
        return cx(t, n)
    }
    let d$ = c("ZodInstanceOf", (t, n) => {
        dZ.init(t, n)
    }, {
        properties(t, n) {
            return this.check(oQ(t, n))
        }
    });

    function dR(t) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
            r = new d$({
                type: "custom",
                check: "custom",
                fn: n => n instanceof t,
                abort: !0,
                ...uG.normalizeParams(n)
            });
        return r._zod.bag.Class = t, r._zod.check = n => {
            if (!(n.value instanceof t)) {
                var i;
                n.issues.push({
                    code: "invalid_type",
                    expected: t.name,
                    input: n.value,
                    inst: r,
                    path: [...null != (i = r._zod.def.path) ? i : []]
                })
            }
        }, r
    }
    let dL = function() {
        for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
        return cU({
            Codec: dy,
            Boolean: si,
            String: u7
        }, ...n)
    };

    function dG(t) {
        let n = dU(() => sT([le(t), l9(), sa(), sg(), sU(n), sV(le(), n)]));
        return n
    }

    function dM(t, n) {
        return new dk({
            type: "pipe",
            in: s3(t),
            out: n
        })
    }

    function dB(t) {
        return oi(ln, t)
    }

    function dJ(t) {
        return oa(lr, t)
    }

    function dV(t) {
        return oo(li, t)
    }

    function dF(t) {
        return oc(la, t)
    }
    t.s(["ZodAny", 0, sh, "ZodArray", 0, sA, "ZodBase64", 0, lM, "ZodBase64URL", 0, lJ, "ZodBigInt", 0, so, "ZodBigIntFormat", 0, su, "ZodBoolean", 0, si, "ZodCIDRv4", 0, l$, "ZodCIDRv6", 0, lL, "ZodCUID", 0, lk, "ZodCUID2", 0, lx, "ZodCatch", 0, df, "ZodCodec", 0, dy, "ZodCreditCard", 0, lW, "ZodCustom", 0, dZ, "ZodCustomStringFormat", 0, l0, "ZodDate", 0, sS, "ZodDefault", 0, di, "ZodDiscriminatedUnion", 0, s$, "ZodE164", 0, lF, "ZodEmail", 0, lo, "ZodEmoji", 0, lb, "ZodEnum", 0, sY, "ZodExactOptional", 0, s7, "ZodFile", 0, s6, "ZodFunction", 0, dN, "ZodGUID", 0, lu, "ZodIBAN", 0, lX, "ZodIPv4", 0, lD, "ZodIPv6", 0, lE, "ZodISODate", 0, lr, "ZodISODateTime", 0, ln, "ZodISODuration", 0, la, "ZodISOTime", 0, li, "ZodInstanceOf", 0, d$, "ZodIntersection", 0, sL, "ZodJWT", 0, lY, "ZodKSUID", 0, lO, "ZodLazy", 0, dA, "ZodLiteral", 0, s4, "ZodMAC", 0, lj, "ZodMap", 0, sW, "ZodNaN", 0, dp, "ZodNanoID", 0, l_, "ZodNever", 0, sI, "ZodNonOptional", 0, dl, "ZodNull", 0, sp, "ZodNullable", 0, dt, "ZodNumber", 0, l3, "ZodNumberFormat", 0, l8, "ZodObject", 0, sO, "ZodOptional", 0, s9, "ZodPipe", 0, dh, "ZodPrefault", 0, dc, "ZodPreprocess", 0, dk, "ZodPromise", 0, dP, "ZodReadonly", 0, dw, "ZodRecord", 0, sJ, "ZodSet", 0, sX, "ZodString", 0, u7, "ZodStringFormat", 0, lt, "ZodSuccess", 0, dd, "ZodSymbol", 0, sd, "ZodTemplateLiteral", 0, dS, "ZodTransform", 0, s5, "ZodTuple", 0, sM, "ZodType", 0, u3, "ZodULID", 0, lz, "ZodURL", 0, lp, "ZodUUID", 0, ls, "ZodUndefined", 0, sf, "ZodUnion", 0, sj, "ZodUnknown", 0, sy, "ZodVoid", 0, sw, "ZodXID", 0, lU, "ZodXor", 0, sE, "_ZodString", 0, u8, "_default", 0, da, "_function", 0, dD, "any", 0, sb, "array", 0, sU, "base64", 0, lB, "base64url", 0, lV, "bigint", 0, sc, "boolean", 0, sa, "catch", 0, dv, "check", 0, dj, "cidrv4", 0, lR, "cidrv6", 0, lG, "codec", 0, d_, "creditCard", 0, lK, "cuid", 0, lw, "cuid2", 0, lS, "currencyCode", 0, l2, "custom", 0, dT, "date", 0, sz, "describe", 0, cz, "discriminatedUnion", 0, sR, "e164", 0, lq, "email", 0, lc, "emoji", 0, ly, "enum", 0, sQ, "exactOptional", 0, de, "file", 0, s2, "float32", 0, se, "float64", 0, st, "function", 0, dD, "guid", 0, ll, "hash", 0, l5, "hex", 0, l6, "hostname", 0, l1, "httpUrl", 0, lh, "iban", 0, lH, "instanceof", 0, dR, "int", 0, l7, "int32", 0, sn, "int64", 0, sl, "intersection", 0, sG, "invertCodec", 0, dI, "ipv4", 0, lZ, "ipv6", 0, lC, "json", 0, dG, "jwt", 0, lQ, "keyof", 0, sP, "ksuid", 0, lN, "lazy", 0, dU, "literal", 0, s1, "looseObject", 0, sZ, "looseRecord", 0, sq, "mac", 0, lT, "map", 0, sK, "meta", 0, cA, "nan", 0, dg, "nanoid", 0, lI, "nativeEnum", 0, s0, "never", 0, sk, "nonoptional", 0, ds, "null", 0, sg, "nullable", 0, dn, "nullish", 0, dr, "number", 0, l9, "object", 0, sN, "optional", 0, s8, "partialRecord", 0, sF, "pipe", 0, db, "prefault", 0, du, "preprocess", 0, dM, "promise", 0, dO, "readonly", 0, dx, "record", 0, sV, "refine", 0, dE, "set", 0, sH, "strictObject", 0, sD, "string", 0, le, "stringFormat", 0, l4, "stringbool", 0, dL, "success", 0, dm, "superRefine", 0, dC, "symbol", 0, sm, "templateLiteral", 0, dz, "transform", 0, s3, "tuple", 0, sB, "uint32", 0, sr, "uint64", 0, ss, "ulid", 0, lA, "undefined", 0, sv, "union", 0, sT, "unknown", 0, s_, "url", 0, lg, "uuid", 0, ld, "uuidv4", 0, lm, "uuidv6", 0, lf, "uuidv7", 0, lv, "void", 0, sx, "xid", 0, lP, "xor", 0, sC], 141761), t.s(["date", 0, dJ, "datetime", 0, dB, "duration", 0, dF, "time", 0, dV], 130462), t.i(130462), t.s(["ZodISODate", 0, lr, "ZodISODateTime", 0, ln, "ZodISODuration", 0, la, "ZodISOTime", 0, li, "date", 0, dJ, "datetime", 0, dB, "duration", 0, dF, "time", 0, dV], 444537);
    var dq = t.i(444537);
    t.s(["bigint", 0, function(t) {
        return ob(so, t)
    }, "boolean", 0, function(t) {
        return og(si, t)
    }, "date", 0, function(t) {
        return oP(sS, t)
    }, "number", 0, function(t) {
        return ol(l3, t)
    }, "string", 0, function(t) {
        return aG(u7, t)
    }], 433808);
    var dW = t.i(433808);
    t.s([], 569297), t.i(569297);
    var dK = t.i(141761);
    t.s([], 959154), t.i(959154), t.s(["endsWith", 0, oH, "gt", 0, oZ, "gte", 0, oj, "includes", 0, oK, "length", 0, oV, "lowercase", 0, oq, "lt", 0, oN, "lte", 0, oD, "maxLength", 0, oB, "maxSize", 0, oL, "mime", 0, o0, "minLength", 0, oJ, "minSize", 0, oG, "multipleOf", 0, oR, "negative", 0, oE, "nonnegative", 0, o$, "nonpositive", 0, oC, "normalize", 0, o1, "overwrite", 0, o4, "positive", 0, oT, "properties", 0, oQ, "property", 0, oY, "regex", 0, oF, "size", 0, oM, "slugify", 0, o3, "startsWith", 0, oX, "toLowerCase", 0, o2, "toUpperCase", 0, o5, "trim", 0, o6, "uppercase", 0, oW], 294116);
    var dX = t.i(294116);
    t.i(355475), t.i(176860), t.s(["decode", 0, uY, "decodeAsync", 0, u0, "encode", 0, uH, "encodeAsync", 0, uQ, "parse", 0, uq, "parseAsync", 0, uW, "safeDecode", 0, u1, "safeDecodeAsync", 0, u2, "safeEncode", 0, u4, "safeEncodeAsync", 0, u6, "safeParse", 0, uK, "safeParseAsync", 0, uX, "validate", 0, nv, "validateAsync", 0, np], 918400), t.i(918400);
    let dH = {
        invalid_type: "invalid_type",
        too_big: "too_big",
        too_small: "too_small",
        invalid_format: "invalid_format",
        not_multiple_of: "not_multiple_of",
        unrecognized_keys: "unrecognized_keys",
        invalid_union: "invalid_union",
        invalid_key: "invalid_key",
        invalid_element: "invalid_element",
        invalid_value: "invalid_value",
        custom: "custom"
    };

    function dY(t) {
        m({
            customError: t
        })
    }

    function dQ() {
        return m().customError
    }
    eq || (eq = {}), t.s(["ZodFirstPartyTypeKind", 0, eq, "ZodIssueCode", 0, dH, "getErrorMap", 0, dQ, "setErrorMap", 0, dY], 450430), t.i(450430), t.s(["$brand", 0, u, "ZodFirstPartyTypeKind", 0, eq, "ZodIssueCode", 0, dH, "config", 0, m, "getErrorMap", 0, dQ, "setErrorMap", 0, dY], 690643), t.i(690643);
    var uL = tB,
        uG = eW;
    let d0 = {
            ...dK,
            ...dX,
            iso: dq
        },
        d4 = new Set(["$schema", "$ref", "$defs", "definitions", "$id", "id", "$comment", "$anchor", "$vocabulary", "$dynamicRef", "$dynamicAnchor", "type", "enum", "const", "anyOf", "oneOf", "allOf", "not", "properties", "required", "additionalProperties", "patternProperties", "propertyNames", "minProperties", "maxProperties", "items", "prefixItems", "additionalItems", "minItems", "maxItems", "uniqueItems", "contains", "minContains", "maxContains", "minLength", "maxLength", "pattern", "format", "minimum", "maximum", "exclusiveMinimum", "exclusiveMaximum", "multipleOf", "description", "default", "contentEncoding", "contentMediaType", "contentSchema", "unevaluatedItems", "unevaluatedProperties", "if", "then", "else", "dependentSchemas", "dependentRequired", "nullable", "readOnly"]);

    function d1(t, n) {
        return t.map((t, r) => r < n ? t : t.optional())
    }
    let d6 = new Set(["items", "prefixItems", "additionalItems", "additionalProperties", "contains", "propertyNames", "not", "if", "then", "else", "allOf", "anyOf", "oneOf", "unevaluatedItems", "unevaluatedProperties", "contentSchema"]),
        d2 = new Set(["properties", "patternProperties", "dependentSchemas", "dependencies", "$defs", "definitions"]);

    function d5(t) {
        return "object" == typeof t && null !== t && (Array.isArray(t) ? t.some(d5) : "string" == typeof t.$ref || Object.entries(t).some(t => {
            let [n, r] = t;
            return d6.has(n) ? d5(r) : !!d2.has(n) && "object" == typeof r && null !== r && Object.values(r).some(d5)
        }))
    }

    function d3(t) {
        return 1 === t ? "element" : "elements"
    }

    function d9(t, n) {
        if (!1 !== t) return void 0 === t || !0 === t ? d0.any() : d7(t, n)
    }
    let d8 = /^(?:[01]\d|2[0-3]):[0-5]\d:[0-5]\d(?:\.\d+)?(?:Z|[+-](?:[01]\d|2[0-3]):[0-5]\d)$/;

    function d7(t, n) {
        if ("boolean" == typeof t) return t ? d0.any() : d0.never();
        let r = function t(n, r) {
                var i, a, o, c;
                let u;
                if (void 0 !== n.not) {
                    if ("object" == typeof n.not && 0 === Object.keys(n.not).length) return d0.never();
                    throw Error("not is not supported in Zod (except { not: {} } for never)")
                }
                if (void 0 !== n.unevaluatedItems) throw Error("unevaluatedItems is not supported");
                if (void 0 !== n.unevaluatedProperties) throw Error("unevaluatedProperties is not supported");
                if (void 0 !== n.if || void 0 !== n.then || void 0 !== n.else) throw Error("Conditional schemas (if/then/else) are not supported");
                if (void 0 !== n.dependentSchemas || void 0 !== n.dependentRequired) throw Error("dependentSchemas and dependentRequired are not supported");
                if (n.$ref) {
                    let t = n.$ref;
                    if (r.refs.has(t)) return r.refs.get(t);
                    if (r.processing.has(t)) return d0.lazy(() => {
                        if (!r.refs.has(t)) throw Error("Circular reference not resolved: ".concat(t));
                        return r.refs.get(t)
                    });
                    r.processing.add(t);
                    let i = d7(function(t, n) {
                        if (!t.startsWith("#")) throw Error("External $ref is not supported, only local refs (#/...) are allowed");
                        let r = t.slice(1).split("/").filter(Boolean);
                        if (0 === r.length) return n.rootSchema;
                        let i = "draft-2020-12" === n.version ? "$defs" : "definitions";
                        if (r[0] === i) {
                            let i = void 0 === r[1] ? void 0 : r[1].replace(/~1/g, "/").replace(/~0/g, "~");
                            if (!i || !n.defs[i]) throw Error("Reference not found: ".concat(t));
                            return n.defs[i]
                        }
                        throw Error("Reference not found: ".concat(t))
                    }(t, r), r);
                    return r.refs.set(t, i), r.processing.delete(t), i
                }
                if (void 0 !== n.enum) {
                    let t = n.enum;
                    if ("openapi-3.0" === r.version && !0 === n.nullable && 1 === t.length && null === t[0]) return d0.null();
                    if (0 === t.length) return d0.never();
                    if (1 === t.length) return d0.literal(t[0]);
                    if (t.every(t => "string" == typeof t)) return d0.enum(t);
                    let i = t.map(t => d0.literal(t));
                    return i.length < 2 ? i[0] : d0.union([i[0], i[1], ...i.slice(2)])
                }
                if (void 0 !== n.const) return d0.literal(n.const);
                let l = n.type;
                if (Array.isArray(l)) {
                    let i = l.map(i => t({
                        ...n,
                        type: i
                    }, r));
                    return 0 === i.length ? d0.never() : 1 === i.length ? i[0] : d0.union(i)
                }
                if (!l) return d0.any();
                switch (l) {
                    case "string": {
                        let t = d0.string();
                        if (n.format) {
                            let r = n.format;
                            "email" === r ? t = t.check(d0.email()) : "uri" === r || "uri-reference" === r ? t = t.check(d0.url()) : "uuid" === r || "guid" === r ? t = t.check(d0.uuid()) : "date-time" === r ? t = t.check(d0.iso.datetime({
                                offset: !0
                            })) : "date" === r ? t = t.check(d0.iso.date()) : "time" === r ? t = t.check(d0.regex(d8)) : "duration" === r ? t = t.check(d0.iso.duration()) : "hostname" === r ? t = t.check(d0.hostname()) : "ipv4" === r ? t = t.check(d0.ipv4()) : "ipv6" === r ? t = t.check(d0.ipv6()) : "mac" === r ? t = t.check(d0.mac()) : "cidr" === r ? t = t.check(d0.cidrv4()) : "cidr-v6" === r ? t = t.check(d0.cidrv6()) : "base64" === r ? t = t.check(d0.base64()) : "base64url" === r ? t = t.check(d0.base64url()) : "e164" === r ? t = t.check(d0.e164()) : "credit_card" === r ? t = t.check(d0.creditCard()) : "iban" === r ? t = t.check(d0.iban()) : "jwt" === r ? t = t.check(d0.jwt()) : "emoji" === r ? t = t.check(d0.emoji()) : "nanoid" === r ? t = t.check(d0.nanoid()) : "cuid" === r ? t = t.check(d0.cuid()) : "cuid2" === r ? t = t.check(d0.cuid2()) : "ulid" === r ? t = t.check(d0.ulid()) : "xid" === r ? t = t.check(d0.xid()) : "ksuid" === r && (t = t.check(d0.ksuid()))
                        }
                        "number" == typeof n.minLength && (t = t.min(n.minLength)), "number" == typeof n.maxLength && (t = t.max(n.maxLength)), n.pattern && (t = t.regex(new RegExp(n.pattern))), u = t;
                        break
                    }
                    case "number":
                    case "integer": {
                        let t = "integer" === l ? d0.number().int() : d0.number();
                        "number" == typeof n.minimum && !0 !== n.exclusiveMinimum && (t = t.min(n.minimum)), "number" == typeof n.maximum && !0 !== n.exclusiveMaximum && (t = t.max(n.maximum)), "number" == typeof n.exclusiveMinimum ? t = t.gt(n.exclusiveMinimum) : !0 === n.exclusiveMinimum && "number" == typeof n.minimum && (t = t.gt(n.minimum)), "number" == typeof n.exclusiveMaximum ? t = t.lt(n.exclusiveMaximum) : !0 === n.exclusiveMaximum && "number" == typeof n.maximum && (t = t.lt(n.maximum)), "number" == typeof n.multipleOf && (t = t.multipleOf(n.multipleOf)), u = t;
                        break
                    }
                    case "boolean":
                        u = d0.boolean();
                        break;
                    case "null":
                        u = d0.null();
                        break;
                    case "object": {
                        let t = {},
                            o = n.properties || {},
                            c = new Set(n.required || []),
                            l = "object" == typeof n.additionalProperties ? d7(n.additionalProperties, r) : void 0;
                        for (let [n, i] of Object.entries(o)) {
                            let a = d7(i, r);
                            O(t, n, c.has(n) ? a : a.optional())
                        }
                        if (n.patternProperties) {
                            let i = n.patternProperties,
                                a = Object.keys(i),
                                o = [];
                            for (let t of a) {
                                let n = d7(i[t], r),
                                    a = d0.string().regex(new RegExp(t));
                                o.push(d0.looseRecord(a, n))
                            }
                            let c = [];
                            if (Object.keys(t).length > 0 && c.push(d0.object(t).passthrough()), c.push(...o), 0 === c.length) u = d0.object({}).passthrough();
                            else if (1 === c.length) u = c[0];
                            else {
                                let t = d0.intersection(c[0], c[1]);
                                for (let n = 2; n < c.length; n++) t = d0.intersection(t, c[n]);
                                u = t
                            }
                            if (!1 === n.additionalProperties) {
                                let n = Object.keys(t),
                                    r = a.map(t => new RegExp(t)),
                                    i = u;
                                u = u.check(t => {
                                    if (!F(t.value)) return;
                                    let a = [];
                                    for (let i of Object.keys(t.value)) !n.includes(i) && (r.some(t => t.test(i)) || a.push(i));
                                    a.length && t.issues.push({
                                        code: "unrecognized_keys",
                                        keys: a,
                                        input: t.value,
                                        inst: i
                                    })
                                })
                            }
                        } else {
                            let r = d0.object(t);
                            u = !1 === n.additionalProperties ? r.strict() : l ? r.catchall(l) : r.passthrough()
                        }
                        let s = void 0 !== n.propertyNames && !0 !== n.propertyNames,
                            d = "number" == typeof n.minProperties ? n.minProperties : void 0,
                            m = "number" == typeof n.maxProperties ? n.maxProperties : void 0;
                        if (s || void 0 !== d || void 0 !== m) {
                            let t;
                            s && (t = d7("object" == typeof n.propertyNames && void 0 === n.propertyNames.type ? {
                                type: "string",
                                ...n.propertyNames
                            } : n.propertyNames, r)), i = u, a = {
                                keySchema: t,
                                minProperties: d,
                                maxProperties: m
                            }, u = d0.transform(t => t).check(t => {
                                let n = t.value;
                                if ("object" != typeof n || null === n || Array.isArray(n)) return;
                                let r = Object.getOwnPropertyNames(n);
                                if (void 0 !== a.minProperties && r.length < a.minProperties && t.issues.push({
                                        origin: "object",
                                        code: "too_small",
                                        minimum: a.minProperties,
                                        inclusive: !0,
                                        message: "Too small: expected object to have >=".concat(a.minProperties, " properties"),
                                        input: n,
                                        inst: i,
                                        continue: !0
                                    }), void 0 !== a.maxProperties && r.length > a.maxProperties && t.issues.push({
                                        origin: "object",
                                        code: "too_big",
                                        maximum: a.maxProperties,
                                        inclusive: !0,
                                        message: "Too big: expected object to have <=".concat(a.maxProperties, " properties"),
                                        input: n,
                                        inst: i,
                                        continue: !0
                                    }), a.keySchema)
                                    for (let n of r) {
                                        let r = a.keySchema.safeParse(n);
                                        r.success || t.issues.push({
                                            code: "invalid_key",
                                            origin: "record",
                                            issues: r.error.issues,
                                            input: n,
                                            path: [n],
                                            continue: !0
                                        })
                                    }
                            }).pipe(i)
                        }
                        break
                    }
                    case "array": {
                        let t = n.prefixItems,
                            i = n.items;
                        if (t && Array.isArray(t)) {
                            let a = "number" == typeof n.minItems ? n.minItems : 0,
                                o = d1(t.map(t => d7(t, r)), a),
                                c = Array.isArray(i) ? void 0 : d9(i, r),
                                l = d0.tuple(o);
                            u = c ? l.rest(c) : l, "number" == typeof n.minItems && (u = u.check(d0.minLength(n.minItems))), "number" == typeof n.maxItems && (u = u.check(d0.maxLength(n.maxItems)))
                        } else if (Array.isArray(i)) {
                            let t = "number" == typeof n.minItems ? n.minItems : 0,
                                a = d1(i.map(t => d7(t, r)), t),
                                o = d9(n.additionalItems, r),
                                c = d0.tuple(a);
                            u = o ? c.rest(o) : c, "number" == typeof n.minItems && (u = u.check(d0.minLength(n.minItems))), "number" == typeof n.maxItems && (u = u.check(d0.maxLength(n.maxItems)))
                        } else if (void 0 !== i) {
                            let t = d7(i, r),
                                a = d0.array(t);
                            "number" == typeof n.minItems && (a = a.min(n.minItems)), "number" == typeof n.maxItems && (a = a.max(n.maxItems)), u = a
                        } else u = d0.array(d0.any());
                        (!0 === n.uniqueItems || void 0 !== n.contains) && (o = u, c = {
                            uniqueItems: !0 === n.uniqueItems,
                            containsSchema: void 0 !== n.contains ? d7(n.contains, r) : void 0,
                            minContains: "number" == typeof n.minContains ? n.minContains : void 0,
                            maxContains: "number" == typeof n.maxContains ? n.maxContains : void 0
                        }, u = d0.transform(t => t).check(t => {
                            let n = t.value;
                            if (Array.isArray(n)) {
                                if (!0 === c.uniqueItems) {
                                    let r = new Map;
                                    for (let i = 0; i < n.length; i++) {
                                        let a = function t(n, r) {
                                            if (null === n) return "z";
                                            let i = typeof n;
                                            if ("object" !== i) {
                                                if ("number" === i && Number.isNaN(n)) return null;
                                                let t = String(n);
                                                return "".concat(i[0]).concat(t.length, ":").concat(t)
                                            }
                                            if (r.has(n)) return null;
                                            r.add(n);
                                            try {
                                                if (Array.isArray(n)) {
                                                    let i = [];
                                                    for (let a of n) {
                                                        let n = t(a, r);
                                                        if (null === n) return null;
                                                        i.push(n)
                                                    }
                                                    return "a".concat(i.length, ":[").concat(i.join(","), "]")
                                                }
                                                let i = Object.keys(n).sort(),
                                                    a = [];
                                                for (let o of i) {
                                                    let i = t(n[o], r);
                                                    if (null === i) return null;
                                                    a.push("".concat(o.length, ":").concat(o, "=").concat(i))
                                                }
                                                return "o".concat(a.length, ":{").concat(a.join(","), "}")
                                            } finally {
                                                r.delete(n)
                                            }
                                        }(n[i], new Set);
                                        if (null === a) continue;
                                        let o = r.get(a);
                                        if (void 0 === o) {
                                            r.set(a, i);
                                            continue
                                        }
                                        t.issues.push({
                                            code: "custom",
                                            message: "Array items must be unique: element at index ".concat(i, " duplicates the one at index ").concat(o),
                                            input: n,
                                            path: [i],
                                            continue: !0
                                        })
                                    }
                                }
                                if (c.containsSchema) {
                                    var r;
                                    let i = null != (r = c.minContains) ? r : 1,
                                        a = void 0 !== c.maxContains ? c.maxContains + 1 : 1 / 0,
                                        o = 0;
                                    for (let t of n)
                                        if (c.containsSchema.safeParse(t).success && ++o >= a) break;
                                    o < i && t.issues.push({
                                        code: "custom",
                                        message: "Array must contain at least ".concat(i, " matching ").concat(d3(i), "; found ").concat(o),
                                        input: n,
                                        continue: !0
                                    }), void 0 !== c.maxContains && o > c.maxContains && t.issues.push({
                                        code: "custom",
                                        message: "Array must contain at most ".concat(c.maxContains, " matching ").concat(d3(c.maxContains)),
                                        input: n,
                                        continue: !0
                                    })
                                }
                            }
                        }).pipe(o));
                        break
                    }
                    default:
                        throw Error("Unsupported type: ".concat(l))
                }
                return u
            }(t, n),
            i = t.type || void 0 !== t.enum || void 0 !== t.const;
        if (t.anyOf && Array.isArray(t.anyOf)) {
            let a = t.anyOf.map(t => d7(t, n)),
                o = d0.union(a);
            r = i ? d0.intersection(r, o) : o
        }
        if (t.oneOf && Array.isArray(t.oneOf)) {
            let a = t.oneOf.map(t => d7(t, n)),
                o = d0.xor(a);
            r = i ? d0.intersection(r, o) : o
        }
        if (t.allOf && Array.isArray(t.allOf))
            if (0 === t.allOf.length) r = i ? r : d0.any();
            else {
                let a = i ? r : d7(t.allOf[0], n),
                    o = +!i;
                for (let r = o; r < t.allOf.length; r++) a = d0.intersection(a, d7(t.allOf[r], n));
                r = a
            }! 0 === t.nullable && "openapi-3.0" === n.version && (r = d0.nullable(r)), !0 === t.readOnly && (r = d0.readonly(r)), void 0 !== t.default && (r = r.default(t.default));
        let a = {};
        for (let n of ["$id", "id", "$comment", "$anchor", "$vocabulary", "$dynamicRef", "$dynamicAnchor"]) n in t && (a[n] = t[n]);
        for (let n of ["contentEncoding", "contentMediaType", "contentSchema"]) n in t && (a[n] = t[n]);
        if ("object" === t.type && void 0 === t.$ref)
            for (let n of (void 0 === t.propertyNames || d5(t.propertyNames) || (a.propertyNames = t.propertyNames), ["minProperties", "maxProperties"])) void 0 !== t[n] && (a[n] = t[n]);
        if ("array" === t.type && void 0 === t.$ref)
            for (let n of (void 0 === t.contains || d5(t.contains) || (a.contains = t.contains), ["uniqueItems", "minContains", "maxContains"])) void 0 !== t[n] && (a[n] = t[n]);
        for (let n of Object.keys(t)) d4.has(n) || O(a, n, t[n]);
        return Object.keys(a).length > 0 && n.registry.add(r, a), t.description && (r = r.describe(t.description)), r
    }
    let me = Symbol("z.visit/resolving");

    function mt(t, n) {
        let r = "function" == typeof n ? n : (t, r) => {
                let i = n[t._zod.def.type];
                return i ? i(t, r) : t
            },
            i = new Map;
        return function t(n) {
            let a = i.get(n);
            if (a === me) return new i0({
                type: "lazy",
                getter: () => i.get(n)
            });
            if (void 0 !== a) return a;
            i.set(n, me);
            let o = function(n) {
                    let r = n._zod.def;
                    switch (r.type) {
                        case "object": {
                            let i = r.shape,
                                a = Object.keys(i),
                                o = !1,
                                c = {};
                            for (let n of a) {
                                let r = t(i[n]);
                                r !== i[n] && (o = !0), c[n] = r
                            }
                            let u = r.catchall;
                            return r.catchall && (u = t(r.catchall)) !== r.catchall && (o = !0), o ? Q(n, {
                                ...r,
                                shape: c,
                                catchall: u
                            }) : n
                        }
                        case "array": {
                            let i = t(r.element);
                            return i === r.element ? n : Q(n, {
                                ...r,
                                element: i
                            })
                        }
                        case "tuple": {
                            let i = r.items,
                                a = !1,
                                o = [];
                            for (let n of i) {
                                let r = t(n);
                                r !== n && (a = !0), o.push(r)
                            }
                            let c = r.rest;
                            return r.rest && (c = t(r.rest)) !== r.rest && (a = !0), a ? Q(n, {
                                ...r,
                                items: o,
                                rest: c
                            }) : n
                        }
                        case "record":
                        case "map": {
                            let i = t(r.keyType),
                                a = t(r.valueType);
                            return i === r.keyType && a === r.valueType ? n : Q(n, {
                                ...r,
                                keyType: i,
                                valueType: a
                            })
                        }
                        case "set": {
                            let i = t(r.valueType);
                            return i === r.valueType ? n : Q(n, {
                                ...r,
                                valueType: i
                            })
                        }
                        case "union": {
                            let i = r.options,
                                a = !1,
                                o = [];
                            for (let n of i) {
                                let r = t(n);
                                r !== n && (a = !0), o.push(r)
                            }
                            return a ? Q(n, {
                                ...r,
                                options: o
                            }) : n
                        }
                        case "intersection": {
                            let i = t(r.left),
                                a = t(r.right);
                            return i === r.left && a === r.right ? n : Q(n, {
                                ...r,
                                left: i,
                                right: a
                            })
                        }
                        case "optional":
                        case "nullable":
                        case "default":
                        case "prefault":
                        case "catch":
                        case "readonly":
                        case "nonoptional":
                        case "promise":
                        case "success": {
                            let i = t(r.innerType);
                            return i === r.innerType ? n : Q(n, {
                                ...r,
                                innerType: i
                            })
                        }
                        case "pipe": {
                            let i = t(r.in),
                                a = t(r.out);
                            return i === r.in && a === r.out ? n : Q(n, {
                                ...r,
                                in: i,
                                out: a
                            })
                        }
                        case "function": {
                            let i = t(r.input),
                                a = t(r.output);
                            return i === r.input && a === r.output ? n : Q(n, {
                                ...r,
                                input: i,
                                output: a
                            })
                        }
                        case "lazy": {
                            let i = r.getter,
                                {
                                    _cachedInner: a,
                                    ...o
                                } = r;
                            return Q(n, {
                                ...o,
                                getter: () => t(i())
                            })
                        }
                        default:
                            return n
                    }
                }(n),
                c = r(o, o !== n);
            return i.set(n, c), c
        }(t)
    }

    function mn(t) {
        return function(t, n) {
            var r;
            if (!(null == n ? void 0 : n.length)) return t;
            let i = t._zod.def;
            return Q(t, E(i, {
                checks: [...null != (r = i.checks) ? r : [], ...n]
            }), {
                parent: !0
            })
        }(t.out, t.checks)
    }
    t.s(["$brand", 0, u, "$input", 0, ao, "$output", 0, aa, "INVALID", 0, as, "NEVER", 0, i, "TimePrecision", 0, or, "ZodAny", 0, sh, "ZodArray", 0, sA, "ZodBase64", 0, lM, "ZodBase64URL", 0, lJ, "ZodBigInt", 0, so, "ZodBigIntFormat", 0, su, "ZodBoolean", 0, si, "ZodCIDRv4", 0, l$, "ZodCIDRv6", 0, lL, "ZodCUID", 0, lk, "ZodCUID2", 0, lx, "ZodCatch", 0, df, "ZodCodec", 0, dy, "ZodCompileAsyncError", 0, am, "ZodCompileUnsupportedError", 0, af, "ZodCreditCard", 0, lW, "ZodCustom", 0, dZ, "ZodCustomStringFormat", 0, l0, "ZodDate", 0, sS, "ZodDefault", 0, di, "ZodDiscriminatedUnion", 0, s$, "ZodE164", 0, lF, "ZodEmail", 0, lo, "ZodEmoji", 0, lb, "ZodEnum", 0, sY, "ZodError", 0, uV, "ZodExactOptional", 0, s7, "ZodFile", 0, s6, "ZodFirstPartyTypeKind", 0, eq, "ZodFunction", 0, dN, "ZodGUID", 0, lu, "ZodIBAN", 0, lX, "ZodIPv4", 0, lD, "ZodIPv6", 0, lE, "ZodISODate", 0, lr, "ZodISODateTime", 0, ln, "ZodISODuration", 0, la, "ZodISOTime", 0, li, "ZodInstanceOf", 0, d$, "ZodIntersection", 0, sL, "ZodIssueCode", 0, dH, "ZodJWT", 0, lY, "ZodKSUID", 0, lO, "ZodLazy", 0, dA, "ZodLiteral", 0, s4, "ZodMAC", 0, lj, "ZodMap", 0, sW, "ZodNaN", 0, dp, "ZodNanoID", 0, l_, "ZodNever", 0, sI, "ZodNonOptional", 0, dl, "ZodNull", 0, sp, "ZodNullable", 0, dt, "ZodNumber", 0, l3, "ZodNumberFormat", 0, l8, "ZodObject", 0, sO, "ZodOptional", 0, s9, "ZodPipe", 0, dh, "ZodPrefault", 0, dc, "ZodPreprocess", 0, dk, "ZodPromise", 0, dP, "ZodReadonly", 0, dw, "ZodRealError", 0, uF, "ZodRecord", 0, sJ, "ZodSet", 0, sX, "ZodString", 0, u7, "ZodStringFormat", 0, lt, "ZodSuccess", 0, dd, "ZodSymbol", 0, sd, "ZodTemplateLiteral", 0, dS, "ZodTransform", 0, s5, "ZodTuple", 0, sM, "ZodType", 0, u3, "ZodULID", 0, lz, "ZodURL", 0, lp, "ZodUUID", 0, ls, "ZodUndefined", 0, sf, "ZodUnion", 0, sj, "ZodUnknown", 0, sy, "ZodVoid", 0, sw, "ZodXID", 0, lU, "ZodXor", 0, sE, "_ZodString", 0, u8, "_default", 0, da, "_function", 0, dD, "any", 0, sb, "array", 0, sU, "base64", 0, lB, "base64url", 0, lV, "bigint", 0, sc, "boolean", 0, sa, "catch", 0, dv, "check", 0, dj, "cidrv4", 0, lR, "cidrv6", 0, lG, "clone", 0, Q, "codec", 0, d_, "coerce", 0, dW, "compile", 0, av, "config", 0, m, "core", 0, uR, "creditCard", 0, lK, "cuid", 0, lw, "cuid2", 0, lS, "currencyCode", 0, l2, "custom", 0, dT, "date", 0, sz, "decode", 0, uY, "decodeAsync", 0, u0, "deepPartial", 0, function(t) {
        return mt(t, {
            object: t => t.partial(),
            union: t => {
                let n = t._zod.def;
                return void 0 === n.discriminator ? t : sT(n.options)
            }
        })
    }, "describe", 0, cz, "discriminatedUnion", 0, sR, "e164", 0, lq, "email", 0, lc, "emoji", 0, ly, "encode", 0, uH, "encodeAsync", 0, uQ, "endsWith", 0, oH, "enum", 0, sQ, "exactOptional", 0, de, "file", 0, s2, "flattenError", 0, t9, "float32", 0, se, "float64", 0, st, "formatError", 0, t8, "fromJSONSchema", 0, function(t, n) {
        var r, i, a;
        let o, c;
        if ("boolean" == typeof t) return t ? d0.any() : d0.never();
        try {
            o = JSON.parse(JSON.stringify(t))
        } catch (t) {
            throw Error("fromJSONSchema input is not valid JSON (possibly cyclic); use $defs/$ref for recursive schemas")
        }
        let u = {
            version: (i = o, a = null == n ? void 0 : n.defaultTarget, "https://json-schema.org/draft/2020-12/schema" === (c = i.$schema) ? "draft-2020-12" : "http://json-schema.org/draft-07/schema#" === c ? "draft-7" : "http://json-schema.org/draft-04/schema#" === c ? "draft-4" : null != a ? a : "draft-2020-12"),
            defs: o.$defs || o.definitions || {},
            refs: new Map,
            processing: new Set,
            rootSchema: o,
            registry: null != (r = null == n ? void 0 : n.registry) ? r : al
        };
        return d7(o, u)
    }, "function", 0, dD, "getDiscriminatedOption", 0, is, "getErrorMap", 0, dQ, "globalRegistry", 0, al, "gt", 0, oZ, "gte", 0, oj, "guid", 0, ll, "hash", 0, l5, "hex", 0, l6, "hostname", 0, l1, "httpUrl", 0, lh, "iban", 0, lH, "includes", 0, oK, "input", 0, function(t) {
        return mt(t, {
            pipe: t => {
                var n;
                return (n = t._zod.def).in._zod.traits.has("$ZodTransform") ? mn(n) : n.in
            },
            default: (t, n) => n ? s8(t._zod.def.innerType) : t,
            catch: (t, n) => n ? t._zod.def.innerType : t
        })
    }, "instanceof", 0, dR, "int", 0, l7, "int32", 0, sn, "int64", 0, sl, "intersection", 0, sG, "invertCodec", 0, dI, "ipv4", 0, lZ, "ipv6", 0, lC, "iso", 0, dq, "json", 0, dG, "jwt", 0, lQ, "keyof", 0, sP, "ksuid", 0, lN, "lazy", 0, dU, "length", 0, oV, "literal", 0, s1, "locales", 0, tQ, "looseObject", 0, sZ, "looseRecord", 0, sq, "lowercase", 0, oq, "lt", 0, oN, "lte", 0, oD, "mac", 0, lT, "map", 0, sK, "maxLength", 0, oB, "maxSize", 0, oL, "memoizer", 0, ar, "meta", 0, cA, "mime", 0, o0, "minLength", 0, oJ, "minSize", 0, oG, "multipleOf", 0, oR, "nan", 0, dg, "nanoid", 0, lI, "nativeEnum", 0, s0, "negative", 0, oE, "never", 0, sk, "nonnegative", 0, o$, "nonoptional", 0, ds, "nonpositive", 0, oC, "normalize", 0, o1, "null", 0, sg, "nullable", 0, dn, "nullish", 0, dr, "number", 0, l9, "object", 0, sN, "optional", 0, s8, "output", 0, function(t) {
        return mt(t, {
            pipe: t => mn(t._zod.def),
            prefault: (t, n) => n ? t._zod.def.innerType : t
        })
    }, "overwrite", 0, o4, "parse", 0, uq, "parseAsync", 0, uW, "partialRecord", 0, sF, "pipe", 0, db, "positive", 0, oT, "prefault", 0, du, "preprocess", 0, dM, "prettifyError", 0, nt, "promise", 0, dO, "properties", 0, oQ, "property", 0, oY, "readonly", 0, dx, "record", 0, sV, "refine", 0, dE, "regex", 0, oF, "regexes", () => uL, "registry", 0, au, "safeDecode", 0, u1, "safeDecodeAsync", 0, u2, "safeEncode", 0, u4, "safeEncodeAsync", 0, u6, "safeParse", 0, uK, "safeParseAsync", 0, uX, "set", 0, sH, "setErrorMap", 0, dY, "size", 0, oM, "slugify", 0, o3, "startsWith", 0, oX, "strictObject", 0, sD, "string", 0, le, "stringFormat", 0, l4, "stringbool", 0, dL, "success", 0, dm, "superRefine", 0, dC, "symbol", 0, sm, "templateLiteral", 0, dz, "toJSONSchema", 0, u$, "toLowerCase", 0, o2, "toUpperCase", 0, o5, "toZod", 0, p, "transform", 0, s3, "treeifyError", 0, t7, "trim", 0, o6, "tuple", 0, sB, "uint32", 0, sr, "uint64", 0, ss, "ulid", 0, lA, "undefined", 0, sv, "union", 0, sT, "unknown", 0, s_, "uppercase", 0, oW, "url", 0, lg, "util", () => uG, "uuid", 0, ld, "uuidv4", 0, lm, "uuidv6", 0, lf, "uuidv7", 0, lv, "validate", 0, nv, "validateAsync", 0, np, "void", 0, sx, "withParser", 0, ap, "xid", 0, lP, "xor", 0, sC], 760829);
    var mr = t.i(760829);
    t.s(["z", 0, mr], 438641)
}]);

//# debugId=4ee020c0-29f9-8a5b-8684-0c3dd1795a71
//# sourceMappingURL=3eoc43omrrfnt.js.map