;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "b30ccacd-440a-452c-2acc-9ecab1e4ec9c")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 620140, e => {
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

    function o(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function o() {
            this.constructor = e
        }
        s(e, t), e.prototype = null === t ? Object.create(t) : (o.prototype = t.prototype, new o)
    }

    function r(e, t, s, o) {
        return new(s || (s = Promise))(function(r, n) {
            function i(e) {
                try {
                    l(o.next(e))
                } catch (e) {
                    n(e)
                }
            }

            function a(e) {
                try {
                    l(o.throw(e))
                } catch (e) {
                    n(e)
                }
            }

            function l(e) {
                var t;
                e.done ? r(e.value) : ((t = e.value) instanceof s ? t : new s(function(e) {
                    e(t)
                })).then(i, a)
            }
            l((o = o.apply(e, t || [])).next())
        })
    }

    function n(e, t) {
        var s, o, r, n = {
                label: 0,
                sent: function() {
                    if (1 & r[0]) throw r[1];
                    return r[1]
                },
                trys: [],
                ops: []
            },
            i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return i.next = a(0), i.throw = a(1), i.return = a(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
            return this
        }), i;

        function a(a) {
            return function(l) {
                var u = [a, l];
                if (s) throw TypeError("Generator is already executing.");
                for (; i && (i = 0, u[0] && (n = 0)), n;) try {
                    if (s = 1, o && (r = 2 & u[0] ? o.return : u[0] ? o.throw || ((r = o.return) && r.call(o), 0) : o.next) && !(r = r.call(o, u[1])).done) return r;
                    switch (o = 0, r && (u = [2 & u[0], r.value]), u[0]) {
                        case 0:
                        case 1:
                            r = u;
                            break;
                        case 4:
                            return n.label++, {
                                value: u[1],
                                done: !1
                            };
                        case 5:
                            n.label++, o = u[1], u = [0];
                            continue;
                        case 7:
                            u = n.ops.pop(), n.trys.pop();
                            continue;
                        default:
                            if (!(r = (r = n.trys).length > 0 && r[r.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                n = 0;
                                continue
                            }
                            if (3 === u[0] && (!r || u[1] > r[0] && u[1] < r[3])) {
                                n.label = u[1];
                                break
                            }
                            if (6 === u[0] && n.label < r[1]) {
                                n.label = r[1], r = u;
                                break
                            }
                            if (r && n.label < r[2]) {
                                n.label = r[2], n.ops.push(u);
                                break
                            }
                            r[2] && n.ops.pop(), n.trys.pop();
                            continue
                    }
                    u = t.call(e, n)
                } catch (e) {
                    u = [6, e], o = 0
                } finally {
                    s = r = 0
                }
                if (5 & u[0]) throw u[1];
                return {
                    value: u[0] ? u[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function i(e) {
        var s;
        return null == (s = e) ? s : {
            targetId: (0, t.exists)(s, "targetId") ? s.targetId : void 0,
            state: (0, t.exists)(s, "state") ? s.state : void 0,
            imageUrl: (0, t.exists)(s, "imageUrl") ? s.imageUrl : void 0,
            version: (0, t.exists)(s, "version") ? s.version : void 0
        }
    }

    function a(e) {
        var s, o;
        return null == (s = e) ? s : {
            universeId: (0, t.exists)(s, "universeId") ? s.universeId : void 0,
            error: (0, t.exists)(s, "error") ? null == (o = s.error) ? o : {
                code: (0, t.exists)(o, "code") ? o.code : void 0,
                message: (0, t.exists)(o, "message") ? o.message : void 0,
                userFacingMessage: (0, t.exists)(o, "userFacingMessage") ? o.userFacingMessage : void 0,
                field: (0, t.exists)(o, "field") ? o.field : void 0,
                fieldData: (0, t.exists)(o, "fieldData") ? o.fieldData : void 0
            } : void 0,
            thumbnails: (0, t.exists)(s, "thumbnails") ? s.thumbnails.map(i) : void 0
        }
    }

    function l(e) {
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

    function u(e) {
        var s;
        return null == (s = e) ? s : {
            requestId: (0, t.exists)(s, "requestId") ? s.requestId : void 0,
            errorCode: (0, t.exists)(s, "errorCode") ? s.errorCode : void 0,
            errorMessage: (0, t.exists)(s, "errorMessage") ? s.errorMessage : void 0,
            targetId: (0, t.exists)(s, "targetId") ? s.targetId : void 0,
            state: (0, t.exists)(s, "state") ? s.state : void 0,
            imageUrl: (0, t.exists)(s, "imageUrl") ? s.imageUrl : void 0,
            version: (0, t.exists)(s, "version") ? s.version : void 0
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function c(e, s) {
        return null == e ? e : {
            data: (0, t.exists)(e, "data") ? e.data.map(i) : void 0
        }
    }
    var d = function(e) {
            function s() {
                return null !== e && e.apply(this, arguments) || this
            }
            return o(s, e), s.prototype.v1AssetThumbnailAnimatedGetRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var o, r, a;
                    return n(this, function(n) {
                        switch (n.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetThumbnailAnimatedGet.");
                                return o = {}, void 0 !== e.assetId && (o.assetId = e.assetId), r = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (r["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                    path: "/v1/asset-thumbnail-animated",
                                    method: "GET",
                                    headers: r,
                                    query: o
                                }, s)];
                            case 1:
                                return a = n.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return i(e)
                                })]
                        }
                    })
                })
            }, s.prototype.v1AssetThumbnailAnimatedGet = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return n(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1AssetThumbnailAnimatedGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.v1AssetsGetRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var o, r, i;
                    return n(this, function(n) {
                        switch (n.label) {
                            case 0:
                                if (null === e.assetIds || void 0 === e.assetIds) throw new t.RequiredError("assetIds", "Required parameter requestParameters.assetIds was null or undefined when calling v1AssetsGet.");
                                return o = {}, e.assetIds && (o.assetIds = e.assetIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.returnPolicy && (o.returnPolicy = e.returnPolicy), void 0 !== e.size && (o.size = e.size), void 0 !== e.format && (o.format = e.format), void 0 !== e.isCircular && (o.isCircular = e.isCircular), r = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (r["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                    path: "/v1/assets",
                                    method: "GET",
                                    headers: r,
                                    query: o
                                }, s)];
                            case 1:
                                return i = n.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, s.prototype.v1AssetsGet = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return n(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1AssetsGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.v1AssetsThumbnail3dGetRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var o, r, a;
                    return n(this, function(n) {
                        switch (n.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsThumbnail3dGet.");
                                return o = {}, void 0 !== e.assetId && (o.assetId = e.assetId), void 0 !== e.useGltf && (o.useGltf = e.useGltf), r = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (r["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                    path: "/v1/assets-thumbnail-3d",
                                    method: "GET",
                                    headers: r,
                                    query: o
                                }, s)];
                            case 1:
                                return a = n.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return i(e)
                                })]
                        }
                    })
                })
            }, s.prototype.v1AssetsThumbnail3dGet = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return n(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1AssetsThumbnail3dGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s
        }(t.BaseAPI),
        p = function(e) {
            function s() {
                return null !== e && e.apply(this, arguments) || this
            }
            return o(s, e), s.prototype.v1UsersAvatar3dGetRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var o, r, a;
                    return n(this, function(n) {
                        switch (n.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new t.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersAvatar3dGet.");
                                return o = {}, void 0 !== e.userId && (o.userId = e.userId), r = {}, [4, this.request({
                                    path: "/v1/users/avatar-3d",
                                    method: "GET",
                                    headers: r,
                                    query: o
                                }, s)];
                            case 1:
                                return a = n.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return i(e)
                                })]
                        }
                    })
                })
            }, s.prototype.v1UsersAvatar3dGet = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return n(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UsersAvatar3dGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.v1UsersAvatarBustGetRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var o, r, i;
                    return n(this, function(n) {
                        switch (n.label) {
                            case 0:
                                if (null === e.userIds || void 0 === e.userIds) throw new t.RequiredError("userIds", "Required parameter requestParameters.userIds was null or undefined when calling v1UsersAvatarBustGet.");
                                return o = {}, e.userIds && (o.userIds = e.userIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.size && (o.size = e.size), void 0 !== e.format && (o.format = e.format), void 0 !== e.isCircular && (o.isCircular = e.isCircular), r = {}, [4, this.request({
                                    path: "/v1/users/avatar-bust",
                                    method: "GET",
                                    headers: r,
                                    query: o
                                }, s)];
                            case 1:
                                return i = n.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, s.prototype.v1UsersAvatarBustGet = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return n(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UsersAvatarBustGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.v1UsersAvatarGetRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var o, r, i;
                    return n(this, function(n) {
                        switch (n.label) {
                            case 0:
                                if (null === e.userIds || void 0 === e.userIds) throw new t.RequiredError("userIds", "Required parameter requestParameters.userIds was null or undefined when calling v1UsersAvatarGet.");
                                return o = {}, e.userIds && (o.userIds = e.userIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.size && (o.size = e.size), void 0 !== e.format && (o.format = e.format), void 0 !== e.isCircular && (o.isCircular = e.isCircular), r = {}, [4, this.request({
                                    path: "/v1/users/avatar",
                                    method: "GET",
                                    headers: r,
                                    query: o
                                }, s)];
                            case 1:
                                return i = n.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, s.prototype.v1UsersAvatarGet = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return n(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UsersAvatarGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.v1UsersAvatarHeadshotGetRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var o, r, i;
                    return n(this, function(n) {
                        switch (n.label) {
                            case 0:
                                if (null === e.userIds || void 0 === e.userIds) throw new t.RequiredError("userIds", "Required parameter requestParameters.userIds was null or undefined when calling v1UsersAvatarHeadshotGet.");
                                return o = {}, e.userIds && (o.userIds = e.userIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.size && (o.size = e.size), void 0 !== e.format && (o.format = e.format), void 0 !== e.isCircular && (o.isCircular = e.isCircular), r = {}, [4, this.request({
                                    path: "/v1/users/avatar-headshot",
                                    method: "GET",
                                    headers: r,
                                    query: o
                                }, s)];
                            case 1:
                                return i = n.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, s.prototype.v1UsersAvatarHeadshotGet = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return n(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UsersAvatarHeadshotGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s
        }(t.BaseAPI),
        h = function(e) {
            function s() {
                return null !== e && e.apply(this, arguments) || this
            }
            return o(s, e), s.prototype.v1BadgesIconsGetRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var o, r, i;
                    return n(this, function(n) {
                        switch (n.label) {
                            case 0:
                                if (null === e.badgeIds || void 0 === e.badgeIds) throw new t.RequiredError("badgeIds", "Required parameter requestParameters.badgeIds was null or undefined when calling v1BadgesIconsGet.");
                                return o = {}, e.badgeIds && (o.badgeIds = e.badgeIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.size && (o.size = e.size), void 0 !== e.format && (o.format = e.format), void 0 !== e.isCircular && (o.isCircular = e.isCircular), r = {}, [4, this.request({
                                    path: "/v1/badges/icons",
                                    method: "GET",
                                    headers: r,
                                    query: o
                                }, s)];
                            case 1:
                                return i = n.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, s.prototype.v1BadgesIconsGet = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return n(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1BadgesIconsGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s
        }(t.BaseAPI),
        m = function(e) {
            function s() {
                return null !== e && e.apply(this, arguments) || this
            }
            return o(s, e), s.prototype.v1BatchPostRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var o, r, i;
                    return n(this, function(n) {
                        switch (n.label) {
                            case 0:
                                if (null === e.requests || void 0 === e.requests) throw new t.RequiredError("requests", "Required parameter requestParameters.requests was null or undefined when calling v1BatchPost.");
                                return o = {}, (r = {})["Content-Type"] = "application/json", void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (r["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                    path: "/v1/batch",
                                    method: "POST",
                                    headers: r,
                                    query: o,
                                    body: e.requests.map(l)
                                }, s)];
                            case 1:
                                return i = n.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        data: (0, t.exists)(e, "data") ? e.data.map(u) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.v1BatchPost = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return n(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1BatchPostRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s
        }(t.BaseAPI),
        v = function(e) {
            function s() {
                return null !== e && e.apply(this, arguments) || this
            }
            return o(s, e), s.prototype.v1BundlesThumbnailsGetRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var o, r, i;
                    return n(this, function(n) {
                        switch (n.label) {
                            case 0:
                                if (null === e.bundleIds || void 0 === e.bundleIds) throw new t.RequiredError("bundleIds", "Required parameter requestParameters.bundleIds was null or undefined when calling v1BundlesThumbnailsGet.");
                                return o = {}, e.bundleIds && (o.bundleIds = e.bundleIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.size && (o.size = e.size), void 0 !== e.format && (o.format = e.format), void 0 !== e.isCircular && (o.isCircular = e.isCircular), r = {}, [4, this.request({
                                    path: "/v1/bundles/thumbnails",
                                    method: "GET",
                                    headers: r,
                                    query: o
                                }, s)];
                            case 1:
                                return i = n.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, s.prototype.v1BundlesThumbnailsGet = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return n(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1BundlesThumbnailsGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s
        }(t.BaseAPI),
        b = function(e) {
            function s() {
                return null !== e && e.apply(this, arguments) || this
            }
            return o(s, e), s.prototype.v1DeveloperProductsIconsGetRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var o, r, i;
                    return n(this, function(n) {
                        switch (n.label) {
                            case 0:
                                if (null === e.developerProductIds || void 0 === e.developerProductIds) throw new t.RequiredError("developerProductIds", "Required parameter requestParameters.developerProductIds was null or undefined when calling v1DeveloperProductsIconsGet.");
                                return o = {}, e.developerProductIds && (o.developerProductIds = e.developerProductIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.size && (o.size = e.size), void 0 !== e.format && (o.format = e.format), void 0 !== e.isCircular && (o.isCircular = e.isCircular), r = {}, [4, this.request({
                                    path: "/v1/developer-products/icons",
                                    method: "GET",
                                    headers: r,
                                    query: o
                                }, s)];
                            case 1:
                                return i = n.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, s.prototype.v1DeveloperProductsIconsGet = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return n(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1DeveloperProductsIconsGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s
        }(t.BaseAPI),
        f = function(e) {
            function s() {
                return null !== e && e.apply(this, arguments) || this
            }
            return o(s, e), s.prototype.v1GamePassesGetRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var o, r, i;
                    return n(this, function(n) {
                        switch (n.label) {
                            case 0:
                                if (null === e.gamePassIds || void 0 === e.gamePassIds) throw new t.RequiredError("gamePassIds", "Required parameter requestParameters.gamePassIds was null or undefined when calling v1GamePassesGet.");
                                return o = {}, e.gamePassIds && (o.gamePassIds = e.gamePassIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.size && (o.size = e.size), void 0 !== e.format && (o.format = e.format), void 0 !== e.isCircular && (o.isCircular = e.isCircular), r = {}, [4, this.request({
                                    path: "/v1/game-passes",
                                    method: "GET",
                                    headers: r,
                                    query: o
                                }, s)];
                            case 1:
                                return i = n.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, s.prototype.v1GamePassesGet = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return n(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1GamePassesGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s
        }(t.BaseAPI),
        x = function(e) {
            function s() {
                return null !== e && e.apply(this, arguments) || this
            }
            return o(s, e), s.prototype.v1GamesIconsGetRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var o, r, i;
                    return n(this, function(n) {
                        switch (n.label) {
                            case 0:
                                if (null === e.universeIds || void 0 === e.universeIds) throw new t.RequiredError("universeIds", "Required parameter requestParameters.universeIds was null or undefined when calling v1GamesIconsGet.");
                                return o = {}, e.universeIds && (o.universeIds = e.universeIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.returnPolicy && (o.returnPolicy = e.returnPolicy), void 0 !== e.size && (o.size = e.size), void 0 !== e.format && (o.format = e.format), void 0 !== e.isCircular && (o.isCircular = e.isCircular), r = {}, [4, this.request({
                                    path: "/v1/games/icons",
                                    method: "GET",
                                    headers: r,
                                    query: o
                                }, s)];
                            case 1:
                                return i = n.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, s.prototype.v1GamesIconsGet = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return n(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1GamesIconsGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.v1GamesMultigetThumbnailsGetRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var o, r, i;
                    return n(this, function(n) {
                        switch (n.label) {
                            case 0:
                                if (null === e.universeIds || void 0 === e.universeIds) throw new t.RequiredError("universeIds", "Required parameter requestParameters.universeIds was null or undefined when calling v1GamesMultigetThumbnailsGet.");
                                return o = {}, e.universeIds && (o.universeIds = e.universeIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.countPerUniverse && (o.countPerUniverse = e.countPerUniverse), void 0 !== e.defaults && (o.defaults = e.defaults), void 0 !== e.size && (o.size = e.size), void 0 !== e.format && (o.format = e.format), void 0 !== e.isCircular && (o.isCircular = e.isCircular), r = {}, [4, this.request({
                                    path: "/v1/games/multiget/thumbnails",
                                    method: "GET",
                                    headers: r,
                                    query: o
                                }, s)];
                            case 1:
                                return i = n.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return null == e ? e : {
                                        data: (0, t.exists)(e, "data") ? e.data.map(a) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.v1GamesMultigetThumbnailsGet = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return n(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1GamesMultigetThumbnailsGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.v1GamesUniverseIdThumbnailsGetRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var o, r, i;
                    return n(this, function(n) {
                        switch (n.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1GamesUniverseIdThumbnailsGet.");
                                if (null === e.thumbnailIds || void 0 === e.thumbnailIds) throw new t.RequiredError("thumbnailIds", "Required parameter requestParameters.thumbnailIds was null or undefined when calling v1GamesUniverseIdThumbnailsGet.");
                                return o = {}, e.thumbnailIds && (o.thumbnailIds = e.thumbnailIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.size && (o.size = e.size), void 0 !== e.format && (o.format = e.format), void 0 !== e.isCircular && (o.isCircular = e.isCircular), r = {}, [4, this.request({
                                    path: "/v1/games/{universeId}/thumbnails".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    method: "GET",
                                    headers: r,
                                    query: o
                                }, s)];
                            case 1:
                                return i = n.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, s.prototype.v1GamesUniverseIdThumbnailsGet = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return n(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1GamesUniverseIdThumbnailsGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s
        }(t.BaseAPI),
        g = function(e) {
            function s() {
                return null !== e && e.apply(this, arguments) || this
            }
            return o(s, e), s.prototype.v1GroupsIconsGetRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var o, r, i;
                    return n(this, function(n) {
                        switch (n.label) {
                            case 0:
                                if (null === e.groupIds || void 0 === e.groupIds) throw new t.RequiredError("groupIds", "Required parameter requestParameters.groupIds was null or undefined when calling v1GroupsIconsGet.");
                                return o = {}, e.groupIds && (o.groupIds = e.groupIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.size && (o.size = e.size), void 0 !== e.format && (o.format = e.format), void 0 !== e.isCircular && (o.isCircular = e.isCircular), r = {}, [4, this.request({
                                    path: "/v1/groups/icons",
                                    method: "GET",
                                    headers: r,
                                    query: o
                                }, s)];
                            case 1:
                                return i = n.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, s.prototype.v1GroupsIconsGet = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return n(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1GroupsIconsGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s
        }(t.BaseAPI),
        w = function(e) {
            function s() {
                return null !== e && e.apply(this, arguments) || this
            }
            return o(s, e), s.prototype.v1UsersOutfit3dGetRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var o, r, a;
                    return n(this, function(n) {
                        switch (n.label) {
                            case 0:
                                if (null === e.outfitId || void 0 === e.outfitId) throw new t.RequiredError("outfitId", "Required parameter requestParameters.outfitId was null or undefined when calling v1UsersOutfit3dGet.");
                                return o = {}, void 0 !== e.outfitId && (o.outfitId = e.outfitId), r = {}, [4, this.request({
                                    path: "/v1/users/outfit-3d",
                                    method: "GET",
                                    headers: r,
                                    query: o
                                }, s)];
                            case 1:
                                return a = n.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return i(e)
                                })]
                        }
                    })
                })
            }, s.prototype.v1UsersOutfit3dGet = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return n(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UsersOutfit3dGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.v1UsersOutfitsGetRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var o, r, i;
                    return n(this, function(n) {
                        switch (n.label) {
                            case 0:
                                if (null === e.userOutfitIds || void 0 === e.userOutfitIds) throw new t.RequiredError("userOutfitIds", "Required parameter requestParameters.userOutfitIds was null or undefined when calling v1UsersOutfitsGet.");
                                return o = {}, e.userOutfitIds && (o.userOutfitIds = e.userOutfitIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.size && (o.size = e.size), void 0 !== e.format && (o.format = e.format), void 0 !== e.isCircular && (o.isCircular = e.isCircular), r = {}, [4, this.request({
                                    path: "/v1/users/outfits",
                                    method: "GET",
                                    headers: r,
                                    query: o
                                }, s)];
                            case 1:
                                return i = n.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, s.prototype.v1UsersOutfitsGet = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return n(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UsersOutfitsGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s
        }(t.BaseAPI),
        I = function(e) {
            function s() {
                return null !== e && e.apply(this, arguments) || this
            }
            return o(s, e), s.prototype.v1PlacesGameiconsGetRaw = function(e, s) {
                return r(this, void 0, void 0, function() {
                    var o, r, i;
                    return n(this, function(n) {
                        switch (n.label) {
                            case 0:
                                if (null === e.placeIds || void 0 === e.placeIds) throw new t.RequiredError("placeIds", "Required parameter requestParameters.placeIds was null or undefined when calling v1PlacesGameiconsGet.");
                                return o = {}, e.placeIds && (o.placeIds = e.placeIds.join(t.COLLECTION_FORMATS.csv)), void 0 !== e.returnPolicy && (o.returnPolicy = e.returnPolicy), void 0 !== e.size && (o.size = e.size), void 0 !== e.format && (o.format = e.format), void 0 !== e.isCircular && (o.isCircular = e.isCircular), r = {}, [4, this.request({
                                    path: "/v1/places/gameicons",
                                    method: "GET",
                                    headers: r,
                                    query: o
                                }, s)];
                            case 1:
                                return i = n.sent(), [2, new t.JSONApiResponse(i, function(e) {
                                    return c(e)
                                })]
                        }
                    })
                })
            }, s.prototype.v1PlacesGameiconsGet = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return n(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1PlacesGameiconsGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s
        }(t.BaseAPI);
    e.s(["AssetsApi", 0, d, "AvatarApi", 0, p, "BadgesApi", 0, h, "BatchApi", 0, m, "BundlesApi", 0, v, "DeveloperProductsApi", 0, b, "GamePassesApi", 0, f, "GamesApi", 0, x, "GroupEmblemApi", 0, g, "OutfitsApi", 0, w, "PlacesApi", 0, I, "RobloxThumbnailsApisModelsThumbnailBatchRequestTypeEnum", 0, {
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
        s = e.i(620140),
        o = e.i(416340),
        r = e.i(706442),
        n = e.i(559956),
        i = e.i(95656),
        a = e.i(252842);

    function l() {
        if (void 0 === c) throw Error("Most call thumbnailsClient before using getThumbnailsClient");
        return c
    }(u = p || (p = {})).assetThumbnail = "assetThumbnail", u.avatarHeadshot = "avatarHeadshot", u.avatar = "avatar", u.bundleThumbnail = "bundleThumbnail", u.gameIcon = "gameIcon", u.groupIcon = "groupIcon", u.badgeIcon = "badgeIcon", u.gamePassIcon = "gamePassIcon", u.developerProductIcon = "developerProductIcon", u.userOutfit = "userOutfit", u.gameThumbnail = "gameThumbnail", u.universeThumbnail = "universeThumbnail", u.placeIcon = "placeIcon", u.autoGeneratedPlaceThumbnail = "autoGeneratedPlaceThumbnail", u.autoGeneratedPlaceIcon = "autoGeneratedPlaceIcon";
    var u, c, d, p, h, m, v, b = ((d = {})[p.assetThumbnail] = s.V1AssetsGetSizeEnum._150x150, d[p.avatarHeadshot] = s.V1UsersAvatarHeadshotGetSizeEnum._150x150, d[p.avatar] = s.V1UsersAvatarGetSizeEnum._150x150, d[p.bundleThumbnail] = s.V1BundlesThumbnailsGetSizeEnum._150x150, d[p.gameIcon] = s.V1GamesIconsGetSizeEnum._150x150, d[p.groupIcon] = s.V1GroupsIconsGetSizeEnum._150x150, d[p.badgeIcon] = s.V1BadgesIconsGetSizeEnum._150x150, d[p.gamePassIcon] = s.V1GamePassesGetSizeEnum._150x150, d[p.developerProductIcon] = s.V1DeveloperProductsIconsGetSizeEnum._150x150, d[p.userOutfit] = s.V1UsersOutfitsGetSizeEnum._150x150, d[p.gameThumbnail] = s.V1GamesUniverseIdThumbnailsGetSizeEnum._576x324, d[p.universeThumbnail] = s.V1GamesMultigetThumbnailsGetSizeEnum._576x324, d[p.placeIcon] = s.V1PlacesGameiconsGetSizeEnum._150x150, d[p.autoGeneratedPlaceThumbnail] = s.V1GamesUniverseIdThumbnailsGetSizeEnum._768x432, d[p.autoGeneratedPlaceIcon] = s.V1GamesIconsGetSizeEnum._512x512, d);

    function f(e, t, s, o) {
        return new(s || (s = Promise))(function(r, n) {
            function i(e) {
                try {
                    l(o.next(e))
                } catch (e) {
                    n(e)
                }
            }

            function a(e) {
                try {
                    l(o.throw(e))
                } catch (e) {
                    n(e)
                }
            }

            function l(e) {
                var t;
                e.done ? r(e.value) : ((t = e.value) instanceof s ? t : new s(function(e) {
                    e(t)
                })).then(i, a)
            }
            l((o = o.apply(e, t || [])).next())
        })
    }

    function x(e, t) {
        var s, o, r, n = {
                label: 0,
                sent: function() {
                    if (1 & r[0]) throw r[1];
                    return r[1]
                },
                trys: [],
                ops: []
            },
            i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return i.next = a(0), i.throw = a(1), i.return = a(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
            return this
        }), i;

        function a(a) {
            return function(l) {
                var u = [a, l];
                if (s) throw TypeError("Generator is already executing.");
                for (; i && (i = 0, u[0] && (n = 0)), n;) try {
                    if (s = 1, o && (r = 2 & u[0] ? o.return : u[0] ? o.throw || ((r = o.return) && r.call(o), 0) : o.next) && !(r = r.call(o, u[1])).done) return r;
                    switch (o = 0, r && (u = [2 & u[0], r.value]), u[0]) {
                        case 0:
                        case 1:
                            r = u;
                            break;
                        case 4:
                            return n.label++, {
                                value: u[1],
                                done: !1
                            };
                        case 5:
                            n.label++, o = u[1], u = [0];
                            continue;
                        case 7:
                            u = n.ops.pop(), n.trys.pop();
                            continue;
                        default:
                            if (!(r = (r = n.trys).length > 0 && r[r.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                n = 0;
                                continue
                            }
                            if (3 === u[0] && (!r || u[1] > r[0] && u[1] < r[3])) {
                                n.label = u[1];
                                break
                            }
                            if (6 === u[0] && n.label < r[1]) {
                                n.label = r[1], r = u;
                                break
                            }
                            if (r && n.label < r[2]) {
                                n.label = r[2], n.ops.push(u);
                                break
                            }
                            r[2] && n.ops.pop(), n.trys.pop();
                            continue
                    }
                    u = t.call(e, n)
                } catch (e) {
                    u = [6, e], o = 0
                } finally {
                    s = r = 0
                }
                if (5 & u[0]) throw u[1];
                return {
                    value: u[0] ? u[1] : void 0,
                    done: !0
                }
            }
        }
    }(g = h || (h = {}))[g.maxRetryAttempts = 10] = "maxRetryAttempts", g[g.minCooldown = 1e3] = "minCooldown", g[g.maxCooldown = 3e4] = "maxCooldown", (w = m || (m = {})).png = "png", w.jpg = "jpg", w.jpeg = "jpeg", w.webp = "webp", (I = v || (v = {})).PlaceHolder = "PlaceHolder", I.AutoGenerated = "AutoGenerated", I.ForceAutoGenerated = "ForceAutoGenerated", I.ForcePlaceHolder = "ForcePlaceHolder", "function" == typeof SuppressedError && SuppressedError;
    var g, w, I, P, G, y = (0, r.makeStyles)()(function(e, t) {
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
        A = "".concat("https://assets.create.roblox.com/92dc66a1e6e80a3ebcb8dc49b52c75eaa1217866/assets", "/thumbnails"),
        T = "".concat(A, "/broken.svg"),
        R = "".concat(A, "/not_approved.svg"),
        C = "".concat(A, "/review_pending.svg"),
        S = "".concat(A, "/unavailable.svg");
    (P || (P = {})).Time = "time", (G || (G = {})).LoadThumbnail = "loadThumbnail";
    var E = function(e, t) {
            var s = t || "Grasshopper",
                o = new i.Configuration({
                    baseUrl: "".concat(e, "/").concat(s)
                }),
                r = new i.Tracker(o);
            return {
                sendEvent: function(e) {
                    var t = {
                        target: s,
                        eventType: e.eventType,
                        context: e.context,
                        localTime: new Date,
                        additionalProperties: e.additionalProperties
                    };
                    return r.sendEventViaImg(t)
                }
            }
        },
        _ = (0, o.createContext)({});
    _.displayName = "ThumbnailsContext";
    var U, q = function(e) {
            var t = e.thumbnailUrl,
                r = e.thumbnailStatus,
                i = e.imgClassName,
                a = e.isPendingResponse,
                l = e.isPendingNewTarget,
                u = e.containerClass,
                c = e.alt,
                d = e.includeBackground,
                p = e.sizeRatio,
                h = e.startTime,
                m = e.skeletonVariant,
                v = e.onLoadThumbnailStatus,
                b = void 0 === v ? void 0 : v,
                f = y({
                    sizeRatio: p
                }),
                x = f.classes,
                g = x.container,
                w = x.background,
                I = x.img,
                A = x.completed,
                E = x.loading,
                U = f.cx,
                q = U(g, u),
                O = (0, o.useState)(!1),
                z = O[0],
                B = O[1],
                k = (0, o.useState)(!1),
                F = k[0],
                V = k[1],
                N = (0, o.useContext)(_).eventTracker,
                M = (0, o.useMemo)(function() {
                    switch (r) {
                        case s.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.Error:
                            return T;
                        case s.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.Blocked:
                            return R;
                        case s.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.InReview:
                            return C;
                        case s.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.Pending:
                            return a ? "" : S;
                        case s.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.Completed:
                        default:
                            return ""
                    }
                }, [a, r]);
            return o.default.createElement("span", {
                className: U(q, l || a || !d ? "" : w)
            }, l || a ? o.default.createElement(n.Skeleton, {
                className: I,
                variant: void 0 === m ? "rectangular" : m,
                animate: !l
            }) : o.default.createElement("img", {
                className: U(I, i, z ? A : E),
                src: null != t ? t : M,
                alt: c,
                onLoad: function() {
                    var e;
                    if (B(!0), N && !F) {
                        var s = performance.now() - h;
                        N.sendEvent({
                            eventType: G.LoadThumbnail,
                            context: P.Time,
                            currentUrl: null == (e = null == window ? void 0 : window.location) ? void 0 : e.href,
                            additionalProperties: {
                                elapsedTime: s,
                                thumbnailStatus: r,
                                thumbnailUrl: null != t ? t : M,
                                sizeRatio: p
                            }
                        }), V(!0)
                    }
                    void 0 !== b && b(r)
                }
            }))
        },
        O = function(e) {
            var t;
            return null != (t = null == e ? void 0 : e.toString()) ? t : ""
        },
        z = new a.BatchRequestFactory,
        B = {
            getFailureCooldown: z.createExponentialBackoffCooldown(h.minCooldown, h.maxCooldown),
            maxRetryAttempts: h.maxRetryAttempts,
            batchSize: 50,
            processBatchWaitTime: 0
        },
        k = {},
        F = {},
        V = function(e, t, s, o, r) {
            if (r && o && delete F[o], !(o in F)) {
                var n = function(e, t) {
                    if (t in k) return k[t];
                    var s = z.createRequestProcessor(e, O, B);
                    return k[t] = s, s
                }(t, s);
                r && n.invalidateItem(e);
                var i = n.queueItem(e).catch(function(e) {
                    return Promise.reject(e)
                });
                F[o] = i
            }
            return F[o]
        },
        N = {},
        M = function(e, t, o, r, n, i) {
            void 0 === n && (n = m.webp), void 0 === i && (i = v.PlaceHolder);
            var u, c, d, h = (c = l(), (d = ((u = {})[p.assetThumbnail] = c.getAssets, u[p.avatarHeadshot] = c.getAvatarHeadshots, u[p.avatar] = c.getAvatars, u[p.bundleThumbnail] = c.getBundles, u[p.gameIcon] = c.getGameIcons, u[p.groupIcon] = c.getGroupIcons, u[p.badgeIcon] = c.getBadgeIcons, u[p.gamePassIcon] = c.getGamePassIcons, u[p.developerProductIcon] = c.getDeveloperProductIcons, u[p.userOutfit] = c.getUserOutfits, u[p.gameThumbnail] = c.getGameThumbnails, u[p.universeThumbnail] = c.getUniverseThumbnails, u[p.placeIcon] = c.getPlaceIcons, u[p.autoGeneratedPlaceThumbnail] = c.getAutoGeneratedPlaceImage, u[p.autoGeneratedPlaceIcon] = c.getAutoGeneratedPlaceImage, u)[o]) || console.debug("Missing urlConfig implementation for thumbnail type: ".concat(o)), d);
            return new Promise(function(l, u) {
                var c = t.map(function(e) {
                    return e.itemId
                });
                if (h) {
                    var d = (new Date).getTime(),
                        m = [];
                    m = o === p.assetThumbnail || o === p.gameIcon || o === p.placeIcon ? [c, i, r, n] : o === p.gameThumbnail ? [e, c, r, n] : [c, r, n], h.apply(null, m).then(function(e) {
                        var o, r = {};
                        (null != (o = null == e ? void 0 : e.data) ? o : []).forEach(function(e) {
                            r[O(e.targetId)] = e
                        }), t.forEach(function(e) {
                            var t = e.itemId,
                                o = O(t);
                            Object.prototype.hasOwnProperty.call(r, o) && r[o] ? r[o].state === s.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.Pending && (delete r[o], N[o] || (N[o] = {
                                startTime: d
                            })) : r[o] = {
                                targetId: t,
                                state: s.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.Error
                            }
                        }), l(r)
                    }).catch(function() {
                        l({})
                    })
                } else u(a.BatchRequestError.unretriableFailure)
            })
        },
        H = function(e, t, o, r, n, i, a) {
            void 0 === r && (r = m.webp), void 0 === n && (n = v.PlaceHolder), void 0 === a && (a = !1);
            var l, u, c, d, p = i || b[e] || s.V1UsersAvatarHeadshotGetSizeEnum._150x150;
            if (!o) return new Promise(function(e, t) {
                t("TargetId can not be empty.")
            });
            if (!e) return new Promise(function(e, t) {
                t("ThumbnailType can not be empty.")
            });
            var h = (l = r, u = n, void 0 === l && (l = m.webp), void 0 === u && (u = v.PlaceHolder), "thumbnail_type:".concat(e, "_baseTargetId:").concat(t, "_targetId:").concat(o, "_requestedSize:").concat(p, "_format:").concat(l, "_returnPolicy:").concat(u));
            return V(o, function(s) {
                return M(t, s, e, p, r, n)
            }, (c = r, d = n, void 0 === c && (c = m.webp), void 0 === d && (d = v.PlaceHolder), "".concat(t, ":").concat(e, ":").concat(p, ":").concat(c, ":").concat(d)), h, a)
        },
        D = {
            getThumbnailImage: function(e, t, s, o, r) {
                return void 0 === s && (s = v.PlaceHolder), void 0 === o && (o = m.webp), H(e, 0, t, o, s, r)
            },
            reloadThumbnailImage: function(e, t, s, o, r) {
                return void 0 === s && (s = v.PlaceHolder), void 0 === o && (o = m.webp), H(e, 0, t, o, s, r, !0)
            },
            getThumbnailImageWithBaseTarget: function(e, t, s, o, r, n) {
                return void 0 === o && (o = v.PlaceHolder), void 0 === r && (r = m.webp), H(e, t, s, r, o, n)
            }
        },
        L = (0, o.forwardRef)(function(e, t) {
            var r = this,
                n = e.type,
                i = e.baseTargetId,
                a = void 0 === i ? 0 : i,
                l = e.targetId,
                u = e.imgClassName,
                c = void 0 === u ? "" : u,
                d = e.containerClass,
                h = e.returnPolicy,
                b = void 0 === h ? v.PlaceHolder : h,
                g = e.alt,
                w = e.skeletonVariant,
                I = e.isPendingNewTarget,
                P = e.includeBackground,
                G = e.size,
                y = e.onLoadThumbnailStatus,
                A = e.format,
                T = void 0 === A ? m.webp : A,
                R = (0, o.useState)(),
                C = R[0],
                S = R[1];
            (0, o.useEffect)(function() {
                var e = !0;
                return f(r, void 0, void 0, function() {
                        var t;
                        return x(this, function(s) {
                            switch (s.label) {
                                case 0:
                                    return T !== m.webp && S(T), [4, function() {
                                        return f(this, void 0, void 0, function() {
                                            return x(this, function(e) {
                                                return void 0 === U && (U = new Promise(function(e) {
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
                                                })), [2, U]
                                            })
                                        })
                                    }()];
                                case 1:
                                    return t = s.sent(), e && S(t ? T : m.png), [2]
                            }
                        })
                    }),
                    function() {
                        e = !1
                    }
            }, [T]);
            var E = (0, o.useState)(s.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.Pending),
                _ = E[0],
                O = E[1],
                z = (0, o.useState)(),
                B = z[0],
                k = z[1],
                F = (0, o.useState)(!0),
                V = F[0],
                N = F[1],
                M = (0, o.useState)(performance.now())[0],
                H = (0, o.useMemo)(function() {
                    return n === p.gameThumbnail || n === p.universeThumbnail ? .5625 : 1
                }, [n]);
            return (0, o.useImperativeHandle)(t, function() {
                return {
                    refreshThumbnail: function() {
                        D.reloadThumbnailImage(n, l, b, C).then(function(e) {
                            var t = e.state,
                                o = e.imageUrl;
                            O(null != t ? t : s.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.Pending), k(o)
                        }, function(e) {
                            console.log(e)
                        }).finally(function() {
                            N(!1)
                        })
                    }
                }
            }), (0, o.useEffect)(function() {
                var e = !1;
                return N(!0), void 0 === C || (a ? D.getThumbnailImageWithBaseTarget(n, a, l, b, C, G) : D.getThumbnailImage(n, l, b, C, G)).then(function(t) {
                        var o = t.state,
                            r = t.imageUrl;
                        e || (O(null != o ? o : s.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum.Pending), k(r))
                    }, function(e) {
                        console.log(e)
                    }).finally(function() {
                        e || N(!1)
                    }),
                    function() {
                        e = !0
                    }
            }, [n, a, l, c, C, b, G]), o.default.createElement(q, {
                thumbnailUrl: B,
                thumbnailStatus: _,
                skeletonVariant: w,
                imgClassName: c,
                isPendingResponse: V,
                isPendingNewTarget: void 0 !== I && I,
                containerClass: void 0 === d ? "" : d,
                alt: g,
                includeBackground: void 0 !== P && P,
                sizeRatio: H,
                startTime: M,
                onLoadThumbnailStatus: void 0 === y ? void 0 : y
            })
        });
    e.s(["ReturnPolicy", 0, v, "Thumbnail2d", 0, L, "ThumbnailClient", 0, D, "ThumbnailFormat", 0, m, "ThumbnailTypes", 0, p, "ThumbnailsProvider", 0, function(e) {
        var t = e.baseUrl,
            s = e.targetNamespace,
            r = e.children,
            n = (0, o.useMemo)(function() {
                return {
                    eventTracker: E(t, s)
                }
            }, [t, s]);
        return o.default.createElement(_.Provider, {
            value: n
        }, r)
    }, "createThumbnailsClient", 0, function(e) {
        var o = new s.AssetsApi(new t.Configuration({
                basePath: e,
                credentials: "include"
            })),
            r = new s.AvatarApi(new t.Configuration({
                basePath: e,
                credentials: "include"
            })),
            n = new s.BadgesApi(new t.Configuration({
                basePath: e,
                credentials: "include"
            })),
            i = new s.BundlesApi(new t.Configuration({
                basePath: e,
                credentials: "include"
            })),
            a = new s.DeveloperProductsApi(new t.Configuration({
                basePath: e,
                credentials: "include"
            })),
            l = new s.GamePassesApi(new t.Configuration({
                basePath: e,
                credentials: "include"
            })),
            u = new s.GamesApi(new t.Configuration({
                basePath: e,
                credentials: "include"
            })),
            d = new s.GroupEmblemApi(new t.Configuration({
                basePath: e,
                credentials: "include"
            })),
            p = new s.OutfitsApi(new t.Configuration({
                basePath: e,
                credentials: "include"
            })),
            h = new s.PlacesApi(new t.Configuration({
                basePath: e,
                credentials: "include"
            })),
            m = new s.BatchApi(new t.Configuration({
                basePath: e,
                credentials: "include"
            }));
        c = {
            getAssets: function(e, t, s, r, n) {
                return o.v1AssetsGet({
                    assetIds: e,
                    returnPolicy: t,
                    size: s,
                    format: r,
                    isCircular: n
                })
            },
            getAvatarHeadshots: function(e, t, s, o) {
                return r.v1UsersAvatarHeadshotGet({
                    userIds: e,
                    size: t,
                    format: s,
                    isCircular: o
                })
            },
            getAvatars: function(e, t, s, o) {
                return r.v1UsersAvatarGet({
                    userIds: e,
                    size: t,
                    format: s,
                    isCircular: o
                })
            },
            getBundles: function(e, t, s, o) {
                return i.v1BundlesThumbnailsGet({
                    bundleIds: e,
                    size: t,
                    format: s,
                    isCircular: o
                })
            },
            getGameIcons: function(e, t, s, o, r) {
                return u.v1GamesIconsGet({
                    universeIds: e,
                    returnPolicy: t,
                    size: s,
                    format: o,
                    isCircular: r
                })
            },
            getGroupIcons: function(e, t, s, o) {
                return d.v1GroupsIconsGet({
                    groupIds: e,
                    size: t,
                    format: s,
                    isCircular: o
                })
            },
            getBadgeIcons: function(e, t, s, o) {
                return n.v1BadgesIconsGet({
                    badgeIds: e,
                    size: t,
                    format: s,
                    isCircular: o
                })
            },
            getGamePassIcons: function(e, t, s, o) {
                return l.v1GamePassesGet({
                    gamePassIds: e,
                    size: t,
                    format: s,
                    isCircular: o
                })
            },
            getDeveloperProductIcons: function(e, t, s, o) {
                return a.v1DeveloperProductsIconsGet({
                    developerProductIds: e,
                    size: t,
                    format: s,
                    isCircular: o
                })
            },
            getUserOutfits: function(e, t, s, o) {
                return p.v1UsersOutfitsGet({
                    userOutfitIds: e,
                    size: t,
                    format: s,
                    isCircular: o
                })
            },
            getGameThumbnails: function(e, t, s, o, r) {
                return u.v1GamesUniverseIdThumbnailsGet({
                    universeId: e,
                    thumbnailIds: t,
                    size: s,
                    format: o,
                    isCircular: r
                })
            },
            getUniverseThumbnails: function(e, t, s, o) {
                return u.v1GamesMultigetThumbnailsGet({
                    universeIds: e,
                    countPerUniverse: 1,
                    defaults: !0,
                    size: t,
                    format: s,
                    isCircular: o
                }).then(function(e) {
                    var t, s = null == e ? void 0 : e.data;
                    return {
                        data: null != (t = null == s ? void 0 : s.map(function(e) {
                            var t, s = null == (t = e.thumbnails) ? void 0 : t[0];
                            return {
                                targetId: e.universeId,
                                state: null == s ? void 0 : s.state,
                                imageUrl: null == s ? void 0 : s.imageUrl
                            }
                        })) ? t : []
                    }
                })
            },
            getPlaceIcons: function(e, t, s, o, r) {
                return h.v1PlacesGameiconsGet({
                    placeIds: e,
                    returnPolicy: t,
                    size: s,
                    format: o,
                    isCircular: r
                })
            },
            getAutoGeneratedPlaceImage: function(e, t, o) {
                var r = e.map(function(e) {
                    return {
                        targetId: e,
                        type: s.RobloxThumbnailsApisModelsThumbnailBatchRequestTypeEnum.GameIcon,
                        size: t,
                        format: o
                    }
                });
                return m.v1BatchPost({
                    requests: r
                })
            },
            getBatchThumbnails: function(e, t, s, o, r) {
                var n = e.map(function(e) {
                    return {
                        targetId: e,
                        type: t,
                        size: s,
                        format: o,
                        isCircular: r
                    }
                });
                return m.v1BatchPost({
                    requests: n
                })
            }
        }
    }, "getThumbnailsClient", 0, l])
}, 559956, e => {
    "use strict";
    let t, s, o, r;
    var n = e.i(569384),
        i = e.i(865800),
        a = e.i(416340),
        l = e.i(614515),
        u = e.i(993807),
        c = e.i(273589),
        d = e.i(962560),
        p = e.i(42569),
        h = e.i(696180),
        m = e.i(221628),
        v = e.i(990857),
        b = e.i(963320),
        f = e.i(571709);

    function x() {
        let e = (0, n._)(["\n  0% {\n    opacity: 1;\n  }\n\n  50% {\n    opacity: 0.4;\n  }\n\n  100% {\n    opacity: 1;\n  }\n"]);
        return x = function() {
            return e
        }, e
    }

    function g() {
        let e = (0, n._)(["\n  0% {\n    transform: translateX(-100%);\n  }\n\n  50% {\n    /* +0.5s of delay between each loop */\n    transform: translateX(100%);\n  }\n\n  100% {\n    transform: translateX(100%);\n  }\n"]);
        return g = function() {
            return e
        }, e
    }

    function w() {
        let e = (0, n._)(["\n      animation: ", " 2s ease-in-out 0.5s infinite;\n    "]);
        return w = function() {
            return e
        }, e
    }

    function I() {
        let e = (0, n._)(["\n      position: relative;\n      overflow: hidden;\n\n      /* Fix bug in Safari https://bugs.webkit.org/show_bug.cgi?id=68196 */\n      -webkit-mask-image: -webkit-radial-gradient(white, black);\n\n      &::after {\n        animation: ", " 2s linear 0.5s infinite;\n        background: linear-gradient(\n          90deg,\n          transparent,\n          ", ",\n          transparent\n        );\n        content: '';\n        position: absolute;\n        transform: translateX(-100%); /* Avoid flash during server-side hydration */\n        bottom: 0;\n        left: 0;\n        right: 0;\n        top: 0;\n      }\n    "]);
        return I = function() {
            return e
        }, e
    }

    function P(e) {
        return (0, c.g)("MuiSkeleton", e)
    }(0, h.g)("MuiSkeleton", ["root", "text", "rectangular", "rounded", "circular", "pulse", "wave", "withChildren", "fitContent", "heightAuto"]);
    let G = ["animation", "className", "component", "height", "style", "variant", "width"],
        y = (0, f.keyframes)(t || (t = x())),
        A = (0, f.keyframes)(s || (s = g())),
        T = (0, p.s)("span", {
            name: "MuiSkeleton",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: s
                } = e;
                return [t.root, t[s.variant], !1 !== s.animation && t[s.animation], s.hasChildren && t.withChildren, s.hasChildren && !s.width && t.fitContent, s.hasChildren && !s.height && t.heightAuto]
            }
        })(e => {
            let {
                theme: t,
                ownerState: s
            } = e, o = String(t.shape.borderRadius).match(/[\d.\-+]*\s*(.*)/)[1] || "px", r = parseFloat(t.shape.borderRadius);
            return (0, d._)({
                display: "block",
                backgroundColor: t.vars ? t.vars.palette.Skeleton.bg : (0, v.a)(t.palette.text.primary, "light" === t.palette.mode ? .11 : .13),
                height: "1.2em"
            }, "text" === s.variant && {
                marginTop: 0,
                marginBottom: 0,
                height: "auto",
                transformOrigin: "0 55%",
                transform: "scale(1, 0.60)",
                borderRadius: "".concat(r).concat(o, "/").concat(Math.round(r / .6 * 10) / 10).concat(o),
                "&:empty:before": {
                    content: '"\\00a0"'
                }
            }, "circular" === s.variant && {
                borderRadius: "50%"
            }, "rounded" === s.variant && {
                borderRadius: (t.vars || t).shape.borderRadius
            }, s.hasChildren && {
                "& > *": {
                    visibility: "hidden"
                }
            }, s.hasChildren && !s.width && {
                maxWidth: "fit-content"
            }, s.hasChildren && !s.height && {
                height: "auto"
            })
        }, e => {
            let {
                ownerState: t
            } = e;
            return "pulse" === t.animation && (0, f.css)(o || (o = w()), y)
        }, e => {
            let {
                ownerState: t,
                theme: s
            } = e;
            return "wave" === t.animation && (0, f.css)(r || (r = I()), A, (s.vars || s).palette.action.hover)
        }),
        R = a.forwardRef(function(e, t) {
            let s = (0, b.u)({
                    props: e,
                    name: "MuiSkeleton"
                }),
                {
                    animation: o = "pulse",
                    className: r,
                    component: n = "span",
                    height: i,
                    style: a,
                    variant: l = "text",
                    width: u
                } = s,
                h = (0, c._)(s, G),
                v = (0, d._)({}, s, {
                    animation: o,
                    component: n,
                    variant: l,
                    hasChildren: !!h.children
                }),
                f = (e => {
                    let {
                        classes: t,
                        variant: s,
                        animation: o,
                        hasChildren: r,
                        width: n,
                        height: i
                    } = e;
                    return (0, p.a)({
                        root: ["root", s, o, r && "withChildren", r && !n && "fitContent", r && !i && "heightAuto"]
                    }, P, t)
                })(v);
            return (0, m.jsx)(T, (0, d._)({
                as: n,
                ref: t,
                className: (0, p.c)(f.root, r),
                ownerState: v
            }, h, {
                style: (0, d._)({
                    width: u,
                    height: i
                }, a)
            }))
        });
    var C = (0, l.default)({
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
        S = {
            text: "text",
            rectangular: "rectangular",
            circular: "circular",
            square: "rectangular"
        },
        E = (0, a.forwardRef)(function(e, t) {
            var s, o = e.variant,
                r = void 0 === o ? "text" : o,
                n = e.animate,
                l = e.classes,
                c = e.className,
                d = (0, i.a)(e, ["variant", "animate", "classes", "className"]),
                p = C(void 0, {
                    props: {
                        classes: (0, u.default)(l, c)
                    }
                }),
                h = p.classes,
                m = h.square,
                v = h.rectangular,
                b = (0, i.a)(h, ["square", "rectangular"]),
                f = p.cx;
            return a.default.createElement(R, (0, i._)({}, d, {
                variant: S[r],
                animation: !!(void 0 !== n && n) && "wave",
                classes: (0, i._)((0, i._)({}, b), {
                    rectangular: f(v, ((s = {})[m] = "square" === r, s))
                }),
                ref: t
            }))
        });
    e.s(["Skeleton", 0, E], 559956)
}, 237401, (e, t, s) => {
    t.exports = e.r(761438)
}, 260022, e => {
    "use strict";
    let t = {
        accountSessionProtectionHelpArticle: {
            global: {
                development: "https://help.roblox.com/hc/articles/18765146769812-Account-Session-Protection",
                sitetest3: "https://help.roblox.com/hc/articles/18765146769812-Account-Session-Protection",
                sitetest2: "https://help.roblox.com/hc/articles/18765146769812-Account-Session-Protection",
                sitetest1: "https://help.roblox.com/hc/articles/18765146769812-Account-Session-Protection",
                production: "https://help.roblox.com/hc/articles/18765146769812-Account-Session-Protection"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        aiBasedToolsSupplementalTermsAndDisclaimer: {
            global: {
                development: "https://en.help.roblox.com/hc/en-us/articles/20121392440212-AI-Based-Tools-Supplemental-Terms-and-Disclaimer",
                sitetest3: "https://en.help.roblox.com/hc/en-us/articles/20121392440212-AI-Based-Tools-Supplemental-Terms-and-Disclaimer",
                sitetest2: "https://en.help.roblox.com/hc/en-us/articles/20121392440212-AI-Based-Tools-Supplemental-Terms-and-Disclaimer",
                sitetest1: "https://en.help.roblox.com/hc/en-us/articles/20121392440212-AI-Based-Tools-Supplemental-Terms-and-Disclaimer",
                production: "https://en.help.roblox.com/hc/en-us/articles/20121392440212-AI-Based-Tools-Supplemental-Terms-and-Disclaimer"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        creatorsRestrictionsOnUse: {
            global: {
                development: "https://help.roblox.com/hc/articles/115004647846-Roblox-Terms-of-Use#creators-restrictions-on-use",
                sitetest3: "https://help.roblox.com/hc/articles/115004647846-Roblox-Terms-of-Use#creators-restrictions-on-use",
                sitetest2: "https://help.roblox.com/hc/articles/115004647846-Roblox-Terms-of-Use#creators-restrictions-on-use",
                sitetest1: "https://help.roblox.com/hc/articles/115004647846-Roblox-Terms-of-Use#creators-restrictions-on-use",
                production: "https://help.roblox.com/hc/articles/115004647846-Roblox-Terms-of-Use#creators-restrictions-on-use"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        agreementsManagerUrl: {
            global: {
                development: "https://content-licensing-public-test.simulpong.com",
                sitetest3: "https://content-licensing-public-test.simulpong.com",
                sitetest2: "https://content-licensing-public-test.simulpong.com",
                sitetest1: "https://content-licensing-public-test.simulpong.com",
                production: "https://agreements-manageraws.rbxcdn.com"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        devForumWAYWOCInspirationUrl: {
            global: {
                development: "http://devforum.roblox.com/waywoc",
                sitetest3: "http://devforum.roblox.com/waywoc",
                sitetest2: "http://devforum.roblox.com/waywoc",
                sitetest1: "http://devforum.roblox.com/waywoc",
                production: "http://devforum.roblox.com/waywoc"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        shopifyMerchantUrl: {
            global: {
                development: "https://apps.shopify.com/roblox",
                sitetest3: "https://apps.shopify.com/roblox",
                sitetest2: "https://apps.shopify.com/roblox",
                sitetest1: "https://apps.shopify.com/roblox",
                production: "https://apps.shopify.com/roblox"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        copyrightFairUseUrl: {
            global: {
                development: "https://copyright.gov/fair-use/",
                sitetest3: "https://copyright.gov/fair-use/",
                sitetest2: "https://copyright.gov/fair-use/",
                sitetest1: "https://copyright.gov/fair-use/",
                production: "https://copyright.gov/fair-use/"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        aboutUsUrl: {
            global: {
                development: "https://www.roblox.com/info/about-us",
                sitetest3: "https://www.roblox.com/info/about-us",
                sitetest2: "https://www.roblox.com/info/about-us",
                sitetest1: "https://www.roblox.com/info/about-us",
                production: "https://www.roblox.com/info/about-us"
            },
            luobu: {
                development: "https://corp.roblox.cn/",
                sitetest3: "https://corp.roblox.cn/",
                sitetest2: "https://corp.roblox.cn/",
                sitetest1: "https://corp.roblox.cn/",
                production: "https://corp.roblox.cn/"
            }
        },
        joinUsUrl: {
            global: {
                development: "https://www.roblox.com/info/jobs",
                sitetest3: "https://www.roblox.com/info/jobs",
                sitetest2: "https://www.roblox.com/info/jobs",
                sitetest1: "https://www.roblox.com/info/jobs",
                production: "https://www.roblox.com/info/jobs"
            },
            luobu: {
                development: "https://corp.roblox.cn/career/",
                sitetest3: "https://corp.roblox.cn/career/",
                sitetest2: "https://corp.roblox.cn/career/",
                sitetest1: "https://corp.roblox.cn/career/",
                production: "https://corp.roblox.cn/career/"
            }
        },
        termsOfServiceUrl: {
            global: {
                development: "https://www.roblox.com/info/terms",
                sitetest3: "https://www.roblox.com/info/terms",
                sitetest2: "https://www.roblox.com/info/terms",
                sitetest1: "https://www.roblox.com/info/terms",
                production: "https://www.roblox.com/info/terms"
            },
            luobu: {
                development: "https://robloxdev.cn/dev-terms.html",
                sitetest3: "https://robloxdev.cn/dev-terms.html",
                sitetest2: "https://robloxdev.cn/dev-terms.html",
                sitetest1: "https://robloxdev.cn/dev-terms.html",
                production: "https://robloxdev.cn/dev-terms.html"
            }
        },
        privacyPolicyUrl: {
            global: {
                development: "https://www.roblox.com/info/privacy",
                sitetest3: "https://www.roblox.com/info/privacy",
                sitetest2: "https://www.roblox.com/info/privacy",
                sitetest1: "https://www.roblox.com/info/privacy",
                production: "https://www.roblox.com/info/privacy"
            },
            luobu: {
                development: "https://robloxdev.cn/dev-privacy-policy.html",
                sitetest3: "https://robloxdev.cn/dev-privacy-policy.html",
                sitetest2: "https://robloxdev.cn/dev-privacy-policy.html",
                sitetest1: "https://robloxdev.cn/dev-privacy-policy.html",
                production: "https://robloxdev.cn/dev-privacy-policy.html"
            }
        },
        accessibilityPolicyUrl: {
            global: {
                development: "https://www.roblox.com/info/accessibility",
                sitetest3: "https://www.roblox.com/info/accessibility",
                sitetest2: "https://www.roblox.com/info/accessibility",
                sitetest1: "https://www.roblox.com/info/accessibility",
                production: "https://www.roblox.com/info/accessibility"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        devexPolicyUrl: {
            global: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            },
            luobu: {
                development: "https://robloxdev.cn/dev-ex-policy.html",
                sitetest3: "https://robloxdev.cn/dev-ex-policy.html",
                sitetest2: "https://robloxdev.cn/dev-ex-policy.html",
                sitetest1: "https://robloxdev.cn/dev-ex-policy.html",
                production: "https://robloxdev.cn/dev-ex-policy.html"
            }
        },
        robloxCubeAnnouncementUrl: {
            global: {
                development: "https://corp.roblox.com/newsroom/2025/03/introducing-roblox-cube",
                sitetest3: "https://corp.roblox.com/newsroom/2025/03/introducing-roblox-cube",
                sitetest2: "https://corp.roblox.com/newsroom/2025/03/introducing-roblox-cube",
                sitetest1: "https://corp.roblox.com/newsroom/2025/03/introducing-roblox-cube",
                production: "https://corp.roblox.com/newsroom/2025/03/introducing-roblox-cube"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        developerArticleBadgesSpecialGameAwardsUrl: {
            global: {
                development: "https://developer.roblox.com/articles/Badges-Special-Game-Awards",
                sitetest3: "https://developer.roblox.com/articles/Badges-Special-Game-Awards",
                sitetest2: "https://developer.roblox.com/articles/Badges-Special-Game-Awards",
                sitetest1: "https://developer.roblox.com/articles/Badges-Special-Game-Awards",
                production: "https://developer.roblox.com/articles/Badges-Special-Game-Awards"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        developerArticleProductsInGamePurchasesUrl: {
            global: {
                development: "https://developer.roblox.com/articles/Developer-Products-In-Game-Purchases",
                sitetest3: "https://developer.roblox.com/articles/Developer-Products-In-Game-Purchases",
                sitetest2: "https://developer.roblox.com/articles/Developer-Products-In-Game-Purchases",
                sitetest1: "https://developer.roblox.com/articles/Developer-Products-In-Game-Purchases",
                production: "https://developer.roblox.com/articles/Developer-Products-In-Game-Purchases"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        developerArticleRedirectCreatePlaceAsyncUrl: {
            global: {
                development: "https://developer.roblox.com/en-us/api-reference/function/AssetService/CreatePlaceAsync",
                sitetest3: "https://developer.roblox.com/en-us/api-reference/function/AssetService/CreatePlaceAsync",
                sitetest2: "https://developer.roblox.com/en-us/api-reference/function/AssetService/CreatePlaceAsync",
                sitetest1: "https://developer.roblox.com/en-us/api-reference/function/AssetService/CreatePlaceAsync",
                production: "https://developer.roblox.com/en-us/api-reference/function/AssetService/CreatePlaceAsync"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        developerArticleCreateVipServerUrl: {
            global: {
                development: "https://developer.roblox.com/en-us/articles/Creating-a-VIP-Server-on-Roblox",
                sitetest3: "https://developer.roblox.com/en-us/articles/Creating-a-VIP-Server-on-Roblox",
                sitetest2: "https://developer.roblox.com/en-us/articles/Creating-a-VIP-Server-on-Roblox",
                sitetest1: "https://developer.roblox.com/en-us/articles/Creating-a-VIP-Server-on-Roblox",
                production: "https://developer.roblox.com/en-us/articles/Creating-a-VIP-Server-on-Roblox"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        developerArticleGamesAndPlacesUrl: {
            global: {
                development: "https://developer.roblox.com/en-us/articles/games-and-places",
                sitetest3: "https://developer.roblox.com/en-us/articles/games-and-places",
                sitetest2: "https://developer.roblox.com/en-us/articles/games-and-places",
                sitetest1: "https://developer.roblox.com/en-us/articles/games-and-places",
                production: "https://developer.roblox.com/en-us/articles/games-and-places"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        ugcSubscriptionTermsOfUseUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/articles/19694609252884/",
                sitetest3: "https://en.help.roblox.com/hc/articles/19694609252884/",
                sitetest2: "https://en.help.roblox.com/hc/articles/19694609252884/",
                sitetest1: "https://en.help.roblox.com/hc/articles/19694609252884/",
                production: "https://en.help.roblox.com/hc/articles/19694609252884/"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        creatorStoreTermsOfUseUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/articles/21308223046932",
                sitetest3: "https://en.help.roblox.com/hc/articles/21308223046932",
                sitetest2: "https://en.help.roblox.com/hc/articles/21308223046932",
                sitetest1: "https://en.help.roblox.com/hc/articles/21308223046932",
                production: "https://en.help.roblox.com/hc/articles/21308223046932"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        accountVerificationUrl: {
            global: {
                development: "https://create.sitetest3.robloxlabs.com/docs/en-us/production/publishing/account-verification#verify-through-government-id",
                sitetest3: "https://create.sitetest3.robloxlabs.com/docs/en-us/production/publishing/account-verification#verify-through-government-id",
                sitetest2: "https://create.sitetest3.robloxlabs.com/docs/en-us/production/publishing/account-verification#verify-through-government-id",
                sitetest1: "https://create.sitetest1.robloxlabs.com/docs/en-us/production/publishing/account-verification#verify-through-government-id",
                production: "https://create.roblox.com/docs/en-us/production/publishing/account-verification#verify-through-government-id"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        audioUploadLicenseAgreementUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/articles/23359485439124",
                sitetest3: "https://en.help.roblox.com/hc/articles/23359485439124",
                sitetest2: "https://en.help.roblox.com/hc/articles/23359485439124",
                sitetest1: "https://en.help.roblox.com/hc/articles/23359485439124",
                production: "https://en.help.roblox.com/hc/articles/23359485439124"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        audioThumbnailModerationUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/en-us/articles/21416271342868-Content-Moderation-on-Roblox",
                sitetest3: "https://en.help.roblox.com/hc/en-us/articles/21416271342868-Content-Moderation-on-Roblox",
                sitetest2: "https://en.help.roblox.com/hc/en-us/articles/21416271342868-Content-Moderation-on-Roblox",
                sitetest1: "https://en.help.roblox.com/hc/en-us/articles/21416271342868-Content-Moderation-on-Roblox",
                production: "https://en.help.roblox.com/hc/en-us/articles/21416271342868-Content-Moderation-on-Roblox"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        extendedServicesTermsOfUseUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/articles/37967848292500",
                sitetest3: "https://en.help.roblox.com/hc/articles/37967848292500",
                sitetest2: "https://en.help.roblox.com/hc/articles/37967848292500",
                sitetest1: "https://en.help.roblox.com/hc/articles/37967848292500",
                production: "https://en.help.roblox.com/hc/articles/37967848292500"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        robloxTermsOfUseUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use",
                sitetest3: "https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use",
                sitetest2: "https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use",
                sitetest1: "https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use",
                production: "https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        advertisingStandardsUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/en-us/articles/13722260778260-Advertising-Standards",
                sitetest3: "https://en.help.roblox.com/hc/en-us/articles/13722260778260-Advertising-Standards",
                sitetest2: "https://en.help.roblox.com/hc/en-us/articles/13722260778260-Advertising-Standards",
                sitetest1: "https://en.help.roblox.com/hc/en-us/articles/13722260778260-Advertising-Standards",
                production: "https://en.help.roblox.com/hc/en-us/articles/13722260778260-Advertising-Standards"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        creatorThirdPartyTermsOfUseUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/en-us/articles/15887203369620",
                sitetest3: "https://en.help.roblox.com/hc/en-us/articles/15887203369620",
                sitetest2: "https://en.help.roblox.com/hc/en-us/articles/15887203369620",
                sitetest1: "https://en.help.roblox.com/hc/en-us/articles/15887203369620",
                production: "https://en.help.roblox.com/hc/en-us/articles/15887203369620"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        dataCollectionOptInUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/en-us/articles/18922542221076",
                sitetest3: "https://en.help.roblox.com/hc/en-us/articles/18922542221076",
                sitetest2: "https://en.help.roblox.com/hc/en-us/articles/18922542221076",
                sitetest1: "https://en.help.roblox.com/hc/en-us/articles/18922542221076",
                production: "https://en.help.roblox.com/hc/en-us/articles/18922542221076"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        robloxCommunityStandardsUrl: {
            global: {
                development: "https://about.roblox.com/community-standards",
                sitetest3: "https://about.roblox.com/community-standards",
                sitetest2: "https://about.roblox.com/community-standards",
                sitetest1: "https://about.roblox.com/community-standards",
                production: "https://about.roblox.com/community-standards"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        creatorThirdPartyPolicyUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/en-us/articles/37924211313044",
                sitetest3: "https://en.help.roblox.com/hc/en-us/articles/37924211313044",
                sitetest2: "https://en.help.roblox.com/hc/en-us/articles/37924211313044",
                sitetest1: "https://en.help.roblox.com/hc/en-us/articles/37924211313044",
                production: "https://en.help.roblox.com/hc/en-us/articles/37924211313044"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        creatorAnalyticsTermsOfUseUrl: {
            global: {
                development: "https://help.roblox.com/hc/articles/10949046065044",
                sitetest3: "https://help.roblox.com/hc/articles/10949046065044",
                sitetest2: "https://help.roblox.com/hc/articles/10949046065044",
                sitetest1: "https://help.roblox.com/hc/articles/10949046065044",
                production: "https://help.roblox.com/hc/articles/10949046065044"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        friendRewardsTermsOfUseUrl: {
            global: {
                development: "'https://help.roblox.com/hc/articles/35146071523604-In-Experience-Friend-Rewards-Program-Terms'",
                sitetest3: "'https://help.roblox.com/hc/articles/35146071523604-In-Experience-Friend-Rewards-Program-Terms'",
                sitetest2: "'https://help.roblox.com/hc/articles/35146071523604-In-Experience-Friend-Rewards-Program-Terms'",
                sitetest1: "'https://help.roblox.com/hc/articles/35146071523604-In-Experience-Friend-Rewards-Program-Terms'",
                production: "'https://help.roblox.com/hc/articles/35146071523604-In-Experience-Friend-Rewards-Program-Terms'"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        developerExchangeHelpAndInformationPageUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/en-us/articles/13061189551124-Developer-Exchange-Help-and-Information-Page",
                sitetest3: "https://en.help.roblox.com/hc/en-us/articles/13061189551124-Developer-Exchange-Help-and-Information-Page",
                sitetest2: "https://en.help.roblox.com/hc/en-us/articles/13061189551124-Developer-Exchange-Help-and-Information-Page",
                sitetest1: "https://en.help.roblox.com/hc/en-us/articles/13061189551124-Developer-Exchange-Help-and-Information-Page",
                production: "https://en.help.roblox.com/hc/en-us/articles/13061189551124-Developer-Exchange-Help-and-Information-Page"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        trustedConnectionsLearnMoreUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/en-us/articles/37725513985812-Unlocking-Trusted-Connections-Expressive-Chat-Features-Party-Voice-chat-without-filters",
                sitetest3: "https://en.help.roblox.com/hc/en-us/articles/37725513985812-Unlocking-Trusted-Connections-Expressive-Chat-Features-Party-Voice-chat-without-filters",
                sitetest2: "https://en.help.roblox.com/hc/en-us/articles/37725513985812-Unlocking-Trusted-Connections-Expressive-Chat-Features-Party-Voice-chat-without-filters",
                sitetest1: "https://en.help.roblox.com/hc/en-us/articles/37725513985812-Unlocking-Trusted-Connections-Expressive-Chat-Features-Party-Voice-chat-without-filters",
                production: "https://en.help.roblox.com/hc/en-us/articles/37725513985812-Unlocking-Trusted-Connections-Expressive-Chat-Features-Party-Voice-chat-without-filters"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        templateUrl: {
            global: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        gameDetailsPageDocsUrl: {
            global: {
                development: "https://create.sitetest3.robloxlabs.com/docs/en-us/audio/assets#visibility",
                sitetest3: "https://create.sitetest3.robloxlabs.com/docs/en-us/audio/assets#visibility",
                sitetest2: "https://create.sitetest3.robloxlabs.com/docs/en-us/audio/assets#visibility",
                sitetest1: "https://create.sitetest1.robloxlabs.com/docs/en-us/audio/assets#visibility",
                production: "https://create.roblox.com/docs/audio/assets#visibility"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        songEligibilityDocsUrl: {
            global: {
                development: "https://create.sitetest3.robloxlabs.com/docs/en-us/audio/assets#visibility",
                sitetest3: "https://create.sitetest3.robloxlabs.com/docs/en-us/audio/assets#visibility",
                sitetest2: "https://create.sitetest3.robloxlabs.com/docs/en-us/audio/assets#visibility",
                sitetest1: "https://create.sitetest1.robloxlabs.com/docs/en-us/audio/assets#visibility",
                production: "https://create.roblox.com/docs/audio/assets#visibility"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        }
    };
    e.s(["getProductionCreatorHubUrl", 0, e => "luobu" === e ? "https://create.roblox.cn" : "https://create.roblox.com", "resolveUrl", 0, (e, s, o) => {
        var r, n;
        return (null == (n = t[e]) || null == (r = n[o]) ? void 0 : r[s]) || (console.warn("No URL found for ".concat(e, " in environment ").concat(s, " and target ").concat(o)), "")
    }])
}]);

//# debugId=b30ccacd-440a-452c-2acc-9ecab1e4ec9c
//# sourceMappingURL=2e195vk13igeb.js.map