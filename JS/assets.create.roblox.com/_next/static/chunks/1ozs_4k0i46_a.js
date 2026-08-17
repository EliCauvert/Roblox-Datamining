;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "7af7df79-3f31-2d8f-2fd4-0334e77cdd5c")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 671376, e => {
    "use strict";
    var t = e.i(307529);
    e.s(["Asset", () => t.default])
}, 475360, e => {
    "use strict";
    var t = e.i(251622);
    e.s(["Item", () => t.default])
}, 284856, e => {
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

    function i(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function i() {
            this.constructor = e
        }
        n(e, t), e.prototype = null === t ? Object.create(t) : (i.prototype = t.prototype, new i)
    }

    function s(e, t, n, i) {
        return new(n || (n = Promise))(function(s, r) {
            function o(e) {
                try {
                    u(i.next(e))
                } catch (e) {
                    r(e)
                }
            }

            function a(e) {
                try {
                    u(i.throw(e))
                } catch (e) {
                    r(e)
                }
            }

            function u(e) {
                var t;
                e.done ? s(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(o, a)
            }
            u((i = i.apply(e, t || [])).next())
        })
    }

    function r(e, t) {
        var n, i, s, r = {
                label: 0,
                sent: function() {
                    if (1 & s[0]) throw s[1];
                    return s[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return o.next = a(0), o.throw = a(1), o.return = a(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function a(a) {
            return function(u) {
                var l = [a, u];
                if (n) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, l[0] && (r = 0)), r;) try {
                    if (n = 1, i && (s = 2 & l[0] ? i.return : l[0] ? i.throw || ((s = i.return) && s.call(i), 0) : i.next) && !(s = s.call(i, l[1])).done) return s;
                    switch (i = 0, s && (l = [2 & l[0], s.value]), l[0]) {
                        case 0:
                        case 1:
                            s = l;
                            break;
                        case 4:
                            return r.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            r.label++, i = l[1], l = [0];
                            continue;
                        case 7:
                            l = r.ops.pop(), r.trys.pop();
                            continue;
                        default:
                            if (!(s = (s = r.trys).length > 0 && s[s.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                r = 0;
                                continue
                            }
                            if (3 === l[0] && (!s || l[1] > s[0] && l[1] < s[3])) {
                                r.label = l[1];
                                break
                            }
                            if (6 === l[0] && r.label < s[1]) {
                                r.label = s[1], s = l;
                                break
                            }
                            if (s && r.label < s[2]) {
                                r.label = s[2], r.ops.push(l);
                                break
                            }
                            s[2] && r.ops.pop(), r.trys.pop();
                            continue
                    }
                    l = t.call(e, r)
                } catch (e) {
                    l = [6, e], i = 0
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
    "function" == typeof SuppressedError && SuppressedError;

    function o(e, n) {
        var i;
        return null == e ? e : {
            creator: (0, t.exists)(e, "creator") ? null == (i = e.creator) ? i : {
                userId: (0, t.exists)(i, "userId") ? i.userId : void 0,
                groupId: (0, t.exists)(i, "groupId") ? i.groupId : void 0
            } : void 0,
            expectedPrice: (0, t.exists)(e, "expectedPrice") ? e.expectedPrice : void 0,
            creatingUniverseId: (0, t.exists)(e, "creatingUniverseId") ? e.creatingUniverseId : void 0,
            assetPrivacy: (0, t.exists)(e, "assetPrivacy") ? e.assetPrivacy : void 0
        }
    }

    function a(e, n) {
        return null == e ? e : {
            moderationState: (0, t.exists)(e, "moderationState") ? e.moderationState : void 0
        }
    }

    function u(e) {
        var n;
        return null == (n = e) ? n : {
            asset: (0, t.exists)(n, "asset") ? n.asset : void 0,
            altText: (0, t.exists)(n, "altText") ? n.altText : void 0
        }
    }

    function l(e) {
        if (void 0 !== e) return null === e ? null : {
            asset: e.asset,
            altText: e.altText
        }
    }

    function d(e, n) {
        return null == e ? e : {
            title: (0, t.exists)(e, "title") ? e.title : void 0,
            uri: (0, t.exists)(e, "uri") ? e.uri : void 0
        }
    }

    function c(e) {
        if (void 0 !== e) return null === e ? null : {
            title: e.title,
            uri: e.uri
        }
    }

    function v(e, n) {
        return null == e ? e : {
            path: (0, t.exists)(e, "path") ? e.path : void 0,
            revisionId: (0, t.exists)(e, "revisionId") ? e.revisionId : void 0,
            revisionCreateTime: (0, t.exists)(e, "revisionCreateTime") ? null === e.revisionCreateTime ? null : new Date(e.revisionCreateTime) : void 0,
            assetId: (0, t.exists)(e, "assetId") ? e.assetId : void 0,
            displayName: (0, t.exists)(e, "displayName") ? e.displayName : void 0,
            description: (0, t.exists)(e, "description") ? e.description : void 0,
            assetType: (0, t.exists)(e, "assetType") ? e.assetType : void 0,
            creationContext: (0, t.exists)(e, "creationContext") ? o(e.creationContext) : void 0,
            moderationResult: (0, t.exists)(e, "moderationResult") ? a(e.moderationResult) : void 0,
            published: (0, t.exists)(e, "published") ? e.published : void 0,
            icon: (0, t.exists)(e, "icon") ? e.icon : void 0,
            previews: (0, t.exists)(e, "previews") ? null === e.previews ? null : e.previews.map(u) : void 0,
            state: (0, t.exists)(e, "state") ? e.state : void 0,
            facebookSocialLink: (0, t.exists)(e, "facebookSocialLink") ? d(e.facebookSocialLink) : void 0,
            twitterSocialLink: (0, t.exists)(e, "twitterSocialLink") ? d(e.twitterSocialLink) : void 0,
            youtubeSocialLink: (0, t.exists)(e, "youtubeSocialLink") ? d(e.youtubeSocialLink) : void 0,
            twitchSocialLink: (0, t.exists)(e, "twitchSocialLink") ? d(e.twitchSocialLink) : void 0,
            discordSocialLink: (0, t.exists)(e, "discordSocialLink") ? d(e.discordSocialLink) : void 0,
            githubSocialLink: (0, t.exists)(e, "githubSocialLink") ? d(e.githubSocialLink) : void 0,
            robloxSocialLink: (0, t.exists)(e, "robloxSocialLink") ? d(e.robloxSocialLink) : void 0,
            guildedSocialLink: (0, t.exists)(e, "guildedSocialLink") ? d(e.guildedSocialLink) : void 0,
            devForumSocialLink: (0, t.exists)(e, "devForumSocialLink") ? d(e.devForumSocialLink) : void 0,
            tryAssetSocialLink: (0, t.exists)(e, "tryAssetSocialLink") ? d(e.tryAssetSocialLink) : void 0
        }
    }

    function p(e) {
        if (void 0 !== e) return null === e ? null : {
            path: e.path,
            revisionId: e.revisionId,
            revisionCreateTime: void 0 === e.revisionCreateTime ? void 0 : null === e.revisionCreateTime ? null : e.revisionCreateTime.toISOString(),
            assetId: e.assetId,
            displayName: e.displayName,
            description: e.description,
            assetType: e.assetType,
            creationContext: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    creator: function(e) {
                        if (void 0 !== e) return null === e ? null : {
                            userId: e.userId,
                            groupId: e.groupId
                        }
                    }(e.creator),
                    expectedPrice: e.expectedPrice,
                    creatingUniverseId: e.creatingUniverseId,
                    assetPrivacy: e.assetPrivacy
                }
            }(e.creationContext),
            moderationResult: function(e) {
                if (void 0 !== e) return null === e ? null : {
                    moderationState: e.moderationState
                }
            }(e.moderationResult),
            published: e.published,
            icon: e.icon,
            previews: void 0 === e.previews ? void 0 : null === e.previews ? null : e.previews.map(l),
            state: e.state,
            facebookSocialLink: c(e.facebookSocialLink),
            twitterSocialLink: c(e.twitterSocialLink),
            youtubeSocialLink: c(e.youtubeSocialLink),
            twitchSocialLink: c(e.twitchSocialLink),
            discordSocialLink: c(e.discordSocialLink),
            githubSocialLink: c(e.githubSocialLink),
            robloxSocialLink: c(e.robloxSocialLink),
            guildedSocialLink: c(e.guildedSocialLink),
            devForumSocialLink: c(e.devForumSocialLink),
            tryAssetSocialLink: c(e.tryAssetSocialLink)
        }
    }

    function h(e) {
        var n;
        return null == (n = e) ? n : {
            path: (0, t.exists)(n, "path") ? n.path : void 0,
            quotaType: (0, t.exists)(n, "quotaType") ? n.quotaType : void 0,
            assetType: (0, t.exists)(n, "assetType") ? n.assetType : void 0,
            usage: (0, t.exists)(n, "usage") ? n.usage : void 0,
            capacity: (0, t.exists)(n, "capacity") ? n.capacity : void 0,
            period: (0, t.exists)(n, "period") ? n.period : void 0,
            usageResetTime: (0, t.exists)(n, "usageResetTime") ? null === n.usageResetTime ? null : new Date(n.usageResetTime) : void 0
        }
    }

    function f(e) {
        var n;
        return null == (n = e) ? n : {
            path: (0, t.exists)(n, "path") ? n.path : void 0,
            createTime: (0, t.exists)(n, "createTime") ? null === n.createTime ? null : new Date(n.createTime) : void 0,
            creationContext: (0, t.exists)(n, "creationContext") ? o(n.creationContext) : void 0,
            moderationResult: (0, t.exists)(n, "moderationResult") ? a(n.moderationResult) : void 0,
            published: (0, t.exists)(n, "published") ? n.published : void 0
        }
    }

    function m(e) {
        var n;
        return null == (n = e) ? n : {
            reason: (0, t.exists)(n, "reason") ? n.reason : void 0,
            domain: (0, t.exists)(n, "domain") ? n.domain : void 0,
            metadata: (0, t.exists)(n, "metadata") ? n.metadata : void 0
        }
    }

    function w(e) {
        if (void 0 !== e) return null === e ? null : {
            asset: p(e.asset),
            file: e.file,
            additionalParameters: e.additionalParameters
        }
    }

    function y(e) {
        var n;
        return null == (n = e) ? n : {
            httpVerb: (0, t.exists)(n, "httpVerb") ? n.httpVerb : void 0,
            url: (0, t.exists)(n, "url") ? n.url : void 0,
            expirationTimeMs: (0, t.exists)(n, "expirationTimeMs") ? n.expirationTimeMs : void 0,
            chunkNum: (0, t.exists)(n, "chunkNum") ? n.chunkNum : void 0,
            contentStart: (0, t.exists)(n, "contentStart") ? n.contentStart : void 0,
            contentLength: (0, t.exists)(n, "contentLength") ? n.contentLength : void 0
        }
    }

    function I(e, n) {
        return null == e ? e : {
            operationPath: (0, t.exists)(e, "operationPath") ? e.operationPath : void 0,
            uploadUrls: (0, t.exists)(e, "uploadUrls") ? null === e.uploadUrls ? null : e.uploadUrls.map(y) : void 0
        }
    }

    function g(e, n) {
        var i;
        return null == e ? e : {
            path: (0, t.exists)(e, "path") ? e.path : void 0,
            operationId: (0, t.exists)(e, "operationId") ? e.operationId : void 0,
            done: (0, t.exists)(e, "done") ? e.done : void 0,
            error: (0, t.exists)(e, "error") ? null == (i = e.error) ? i : {
                code: (0, t.exists)(i, "code") ? i.code : void 0,
                message: (0, t.exists)(i, "message") ? i.message : void 0,
                details: (0, t.exists)(i, "details") ? i.details.map(m) : void 0
            } : void 0,
            response: (0, t.exists)(e, "response") ? v(e.response) : void 0
        }
    }
    var b = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(n, e), n.prototype.assetsArchiveAssetRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var i, s, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetsArchiveAsset.");
                                return i = {}, s = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}:archive".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}:archive",
                                    method: "POST",
                                    headers: s,
                                    query: i
                                }, n)];
                            case 1:
                                return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return v(e)
                                })]
                        }
                    })
                })
            }, n.prototype.assetsArchiveAsset = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return r(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.assetsArchiveAssetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.assetsCreateAssetRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var i, s, o, a;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.fileContent || void 0 === e.fileContent) throw new t.RequiredError("fileContent", "Required parameter requestParameters.fileContent was null or undefined when calling assetsCreateAsset.");
                                return i = {}, s = {}, o = (0, t.canConsumeForm)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.fileContent && o.append("fileContent", e.fileContent), void 0 !== e.request && o.append("request", JSON.stringify(p(e.request))), [4, this.request({
                                    path: "/v1/assets",
                                    schemaPath: "/v1/assets",
                                    method: "POST",
                                    headers: s,
                                    query: i,
                                    body: o
                                }, n)];
                            case 1:
                                return a = r.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return g(e)
                                })]
                        }
                    })
                })
            }, n.prototype.assetsCreateAsset = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return r(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.assetsCreateAssetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.assetsGetAssetRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var i, s, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetsGetAsset.");
                                return i = {}, e.readMask && (i.readMask = e.readMask.join(t.COLLECTION_FORMATS.csv)), s = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}",
                                    method: "GET",
                                    headers: s,
                                    query: i
                                }, n)];
                            case 1:
                                return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return v(e)
                                })]
                        }
                    })
                })
            }, n.prototype.assetsGetAsset = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return r(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.assetsGetAssetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.assetsRestoreAssetRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var i, s, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetsRestoreAsset.");
                                return i = {}, s = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}:restore".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}:restore",
                                    method: "POST",
                                    headers: s,
                                    query: i
                                }, n)];
                            case 1:
                                return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return v(e)
                                })]
                        }
                    })
                })
            }, n.prototype.assetsRestoreAsset = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return r(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.assetsRestoreAssetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.assetsUpdateAssetRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var i, s, o, a;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetsUpdateAsset.");
                                return i = {}, e.updateMask && (i.updateMask = e.updateMask.join(t.COLLECTION_FORMATS.csv)), s = {}, o = (0, t.canConsumeForm)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.fileContent && o.append("fileContent", e.fileContent), void 0 !== e.request && o.append("request", JSON.stringify(p(e.request))), [4, this.request({
                                    path: "/v1/assets/{assetId}".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}",
                                    method: "PATCH",
                                    headers: s,
                                    query: i,
                                    body: o
                                }, n)];
                            case 1:
                                return a = r.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                    return g(e)
                                })]
                        }
                    })
                })
            }, n.prototype.assetsUpdateAsset = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return r(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.assetsUpdateAssetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t.BaseAPI),
        R = (function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            i(n, e), n.prototype.assetsGetAssetVersionRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var i, s, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetsGetAssetVersion.");
                                if (null === e.revisionId || void 0 === e.revisionId) throw new t.RequiredError("revisionId", "Required parameter requestParameters.revisionId was null or undefined when calling assetsGetAssetVersion.");
                                return i = {}, s = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}/versions/{revisionId}".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))).replace("{".concat("revisionId", "}"), encodeURIComponent(String(e.revisionId))),
                                    schemaPath: "/v1/assets/{assetId}/versions/{revisionId}",
                                    method: "GET",
                                    headers: s,
                                    query: i
                                }, n)];
                            case 1:
                                return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return f(e)
                                })]
                        }
                    })
                })
            }, n.prototype.assetsGetAssetVersion = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return r(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.assetsGetAssetVersionRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.assetsListAssetVersionsRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var i, s, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetsListAssetVersions.");
                                return i = {}, void 0 !== e.maxPageSize && (i.maxPageSize = e.maxPageSize), void 0 !== e.pageToken && (i.pageToken = e.pageToken), void 0 !== e.filter && (i.filter = e.filter), s = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}/versions".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/versions",
                                    method: "GET",
                                    headers: s,
                                    query: i
                                }, n)];
                            case 1:
                                return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        assetVersions: (0, t.exists)(e, "assetVersions") ? null === e.assetVersions ? null : e.assetVersions.map(f) : void 0,
                                        nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.assetsListAssetVersions = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return r(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.assetsListAssetVersionsRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.assetsRollbackAssetVersionRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var i, s, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetsRollbackAssetVersion.");
                                return i = {}, (s = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/assets/{assetId}/versions:rollback".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/versions:rollback",
                                    method: "POST",
                                    headers: s,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            assetVersion: e.assetVersion
                                        }
                                    }(e.rollbackAssetVersionRequest)
                                }, n)];
                            case 1:
                                return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return f(e)
                                })]
                        }
                    })
                })
            }, n.prototype.assetsRollbackAssetVersion = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return r(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.assetsRollbackAssetVersionRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }
        }(t.BaseAPI), function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(n, e), n.prototype.assetsCreateAssetWithMultipartUploadRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var i, s, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return i = {}, (s = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/assets:multipartUpload",
                                    schemaPath: "/v1/assets:multipartUpload",
                                    method: "POST",
                                    headers: s,
                                    query: i,
                                    body: w(e.multipartUploadStartRequest)
                                }, n)];
                            case 1:
                                return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return I(e)
                                })]
                        }
                    })
                })
            }, n.prototype.assetsCreateAssetWithMultipartUpload = function() {
                return s(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), r(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.assetsCreateAssetWithMultipartUploadRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.assetsMultipartUploadAbortRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var i, s, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.operationId || void 0 === e.operationId) throw new t.RequiredError("operationId", "Required parameter requestParameters.operationId was null or undefined when calling assetsMultipartUploadAbort.");
                                return i = {}, s = {}, [4, this.request({
                                    path: "/v1/operations/{operationId}:multipartUpload".replace("{".concat("operationId", "}"), encodeURIComponent(String(e.operationId))),
                                    schemaPath: "/v1/operations/{operationId}:multipartUpload",
                                    method: "DELETE",
                                    headers: s,
                                    query: i
                                }, n)];
                            case 1:
                                return o = r.sent(), [2, new t.VoidApiResponse(o)]
                        }
                    })
                })
            }, n.prototype.assetsMultipartUploadAbort = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return r(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.assetsMultipartUploadAbortRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, n.prototype.assetsMultipartUploadChunkCompleteRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var i, s, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.operationId || void 0 === e.operationId) throw new t.RequiredError("operationId", "Required parameter requestParameters.operationId was null or undefined when calling assetsMultipartUploadChunkComplete.");
                                return i = {}, (s = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/operations/{operationId}:multipartUploadChunkComplete".replace("{".concat("operationId", "}"), encodeURIComponent(String(e.operationId))),
                                    schemaPath: "/v1/operations/{operationId}:multipartUploadChunkComplete",
                                    method: "POST",
                                    headers: s,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            chunkNum: e.chunkNum,
                                            eTag: e.eTag
                                        }
                                    }(e.multipartUploadChunkCompleteRequest)
                                }, n)];
                            case 1:
                                return o = r.sent(), [2, new t.VoidApiResponse(o)]
                        }
                    })
                })
            }, n.prototype.assetsMultipartUploadChunkComplete = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return r(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.assetsMultipartUploadChunkCompleteRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, n.prototype.assetsMultipartUploadCompleteRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var i, s, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.operationId || void 0 === e.operationId) throw new t.RequiredError("operationId", "Required parameter requestParameters.operationId was null or undefined when calling assetsMultipartUploadComplete.");
                                return i = {}, s = {}, [4, this.request({
                                    path: "/v1/operations/{operationId}:multipartUploadComplete".replace("{".concat("operationId", "}"), encodeURIComponent(String(e.operationId))),
                                    schemaPath: "/v1/operations/{operationId}:multipartUploadComplete",
                                    method: "POST",
                                    headers: s,
                                    query: i
                                }, n)];
                            case 1:
                                return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return g(e)
                                })]
                        }
                    })
                })
            }, n.prototype.assetsMultipartUploadComplete = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return r(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.assetsMultipartUploadCompleteRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.assetsUpdateAssetWithMultipartUploadRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var i, s, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetsUpdateAssetWithMultipartUpload.");
                                return i = {}, (s = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/assets/{assetId}:multipartUpload".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}:multipartUpload",
                                    method: "PATCH",
                                    headers: s,
                                    query: i,
                                    body: w(e.multipartUploadStartRequest)
                                }, n)];
                            case 1:
                                return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return I(e)
                                })]
                        }
                    })
                })
            }, n.prototype.assetsUpdateAssetWithMultipartUpload = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return r(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.assetsUpdateAssetWithMultipartUploadRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t.BaseAPI)),
        S = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(n, e), n.prototype.assetsGetOperationRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var i, s, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.operationId || void 0 === e.operationId) throw new t.RequiredError("operationId", "Required parameter requestParameters.operationId was null or undefined when calling assetsGetOperation.");
                                return i = {}, s = {}, [4, this.request({
                                    path: "/v1/operations/{operationId}".replace("{".concat("operationId", "}"), encodeURIComponent(String(e.operationId))),
                                    schemaPath: "/v1/operations/{operationId}",
                                    method: "GET",
                                    headers: s,
                                    query: i
                                }, n)];
                            case 1:
                                return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return g(e)
                                })]
                        }
                    })
                })
            }, n.prototype.assetsGetOperation = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return r(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.assetsGetOperationRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t.BaseAPI);
    (function(e) {
        function n() {
            return null !== e && e.apply(this, arguments) || this
        }
        i(n, e), n.prototype.usersListAssetQuotasRaw = function(e, n) {
            return s(this, void 0, void 0, function() {
                var i, s, o;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new t.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling usersListAssetQuotas.");
                            return i = {}, void 0 !== e.maxPageSize && (i.maxPageSize = e.maxPageSize), void 0 !== e.pageToken && (i.pageToken = e.pageToken), void 0 !== e.filter && (i.filter = e.filter), s = {}, [4, this.request({
                                path: "/v2/users/{userId}/asset-quotas".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                schemaPath: "/v2/users/{userId}/asset-quotas",
                                method: "GET",
                                headers: s,
                                query: i
                            }, n)];
                        case 1:
                            return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    assetQuotas: (0, t.exists)(e, "assetQuotas") ? null === e.assetQuotas ? null : e.assetQuotas.map(h) : void 0,
                                    nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.usersListAssetQuotas = function(e, t) {
            return s(this, void 0, void 0, function() {
                return r(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.usersListAssetQuotasRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    })(t.BaseAPI), e.s(["AssetApi", 0, b, "AssetPrivacy", 0, {
        Unspecified: "Unspecified",
        Default: "Default",
        OpenUse: "OpenUse",
        Restricted: "Restricted"
    }, "AssetType", 0, {
        Unspecified: "Unspecified",
        Image: "Image",
        Tshirt: "Tshirt",
        Audio: "Audio",
        Mesh: "Mesh",
        Lua: "Lua",
        Html: "Html",
        Text: "Text",
        Hat: "Hat",
        Place: "Place",
        Model: "Model",
        Shirt: "Shirt",
        Pants: "Pants",
        Decal: "Decal",
        Avatar: "Avatar",
        Head: "Head",
        Face: "Face",
        Gear: "Gear",
        Badge: "Badge",
        GroupEmblem: "GroupEmblem",
        Animation: "Animation",
        Arms: "Arms",
        Legs: "Legs",
        Torso: "Torso",
        RightArm: "RightArm",
        LeftArm: "LeftArm",
        LeftLeg: "LeftLeg",
        RightLeg: "RightLeg",
        Package: "Package",
        YoutubeVideo: "YoutubeVideo",
        GamePass: "GamePass",
        App: "App",
        Code: "Code",
        Plugin: "Plugin",
        SolidModel: "SolidModel",
        MeshPart: "MeshPart",
        HairAccessory: "HairAccessory",
        FaceAccessory: "FaceAccessory",
        NeckAccessory: "NeckAccessory",
        ShoulderAccessory: "ShoulderAccessory",
        FrontAccessory: "FrontAccessory",
        BackAccessory: "BackAccessory",
        WaistAccessory: "WaistAccessory",
        ClimbAnimation: "ClimbAnimation",
        DeathAnimation: "DeathAnimation",
        FallAnimation: "FallAnimation",
        IdleAnimation: "IdleAnimation",
        JumpAnimation: "JumpAnimation",
        RunAnimation: "RunAnimation",
        SwimAnimation: "SwimAnimation",
        WalkAnimation: "WalkAnimation",
        PoseAnimation: "PoseAnimation",
        LocalizationTableManifest: "LocalizationTableManifest",
        LocalizationTableTranslation: "LocalizationTableTranslation",
        EmoteAnimation: "EmoteAnimation",
        Video: "Video",
        TexturePack: "TexturePack",
        TshirtAccessory: "TshirtAccessory",
        ShirtAccessory: "ShirtAccessory",
        PantsAccessory: "PantsAccessory",
        JacketAccessory: "JacketAccessory",
        SweaterAccessory: "SweaterAccessory",
        ShortsAccessory: "ShortsAccessory",
        LeftShoeAccessory: "LeftShoeAccessory",
        RightShoeAccessory: "RightShoeAccessory",
        DressSkirtAccessory: "DressSkirtAccessory",
        FontFamily: "FontFamily",
        FontFace: "FontFace",
        MeshHiddenSurfaceRemoval: "MeshHiddenSurfaceRemoval",
        EyebrowAccessory: "EyebrowAccessory",
        EyelashAccessory: "EyelashAccessory",
        MoodAnimation: "MoodAnimation",
        DynamicHead: "DynamicHead",
        CodeSnippet: "CodeSnippet",
        AdsVideo: "AdsVideo",
        OtaUpdate: "OtaUpdate",
        Screenshot: "Screenshot",
        RuntimePropertySet: "RuntimePropertySet",
        StorePreviewVideo: "StorePreviewVideo",
        GamePreviewVideo: "GamePreviewVideo",
        CreatorExperienceConfig: "CreatorExperienceConfig",
        FaceMakeup: "FaceMakeup",
        LipMakeup: "LipMakeup",
        EyeMakeup: "EyeMakeup",
        VoxelFragment: "VoxelFragment",
        AvatarBackground: "AvatarBackground",
        TextDocument: "TextDocument"
    }, "ModerationState", 0, {
        Unspecified: "Unspecified",
        Reviewing: "Reviewing",
        Rejected: "Rejected",
        Approved: "Approved"
    }, "MultipartUploadApi", 0, R, "PreviewFromJSON", 0, u, "UploadStatusApi", 0, S])
}, 54842, e => {
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

    function i(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function i() {
            this.constructor = e
        }
        n(e, t), e.prototype = null === t ? Object.create(t) : (i.prototype = t.prototype, new i)
    }

    function s(e, t, n, i) {
        return new(n || (n = Promise))(function(s, r) {
            function o(e) {
                try {
                    u(i.next(e))
                } catch (e) {
                    r(e)
                }
            }

            function a(e) {
                try {
                    u(i.throw(e))
                } catch (e) {
                    r(e)
                }
            }

            function u(e) {
                var t;
                e.done ? s(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(o, a)
            }
            u((i = i.apply(e, t || [])).next())
        })
    }

    function r(e, t) {
        var n, i, s, r = {
                label: 0,
                sent: function() {
                    if (1 & s[0]) throw s[1];
                    return s[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return o.next = a(0), o.throw = a(1), o.return = a(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function a(a) {
            return function(u) {
                var l = [a, u];
                if (n) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, l[0] && (r = 0)), r;) try {
                    if (n = 1, i && (s = 2 & l[0] ? i.return : l[0] ? i.throw || ((s = i.return) && s.call(i), 0) : i.next) && !(s = s.call(i, l[1])).done) return s;
                    switch (i = 0, s && (l = [2 & l[0], s.value]), l[0]) {
                        case 0:
                        case 1:
                            s = l;
                            break;
                        case 4:
                            return r.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            r.label++, i = l[1], l = [0];
                            continue;
                        case 7:
                            l = r.ops.pop(), r.trys.pop();
                            continue;
                        default:
                            if (!(s = (s = r.trys).length > 0 && s[s.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                r = 0;
                                continue
                            }
                            if (3 === l[0] && (!s || l[1] > s[0] && l[1] < s[3])) {
                                r.label = l[1];
                                break
                            }
                            if (6 === l[0] && r.label < s[1]) {
                                r.label = s[1], s = l;
                                break
                            }
                            if (s && r.label < s[2]) {
                                r.label = s[2], r.ops.push(l);
                                break
                            }
                            s[2] && r.ops.pop(), r.trys.pop();
                            continue
                    }
                    l = t.call(e, r)
                } catch (e) {
                    l = [6, e], i = 0
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
    "function" == typeof SuppressedError && SuppressedError;

    function o(e) {
        var n;
        return null == (n = e) ? n : {
            category: (0, t.exists)(n, "category") ? n.category : void 0,
            rank: (0, t.exists)(n, "rank") ? n.rank : void 0
        }
    }

    function a(e) {
        if (void 0 !== e) return null === e ? null : {
            recurrence: e.recurrence,
            recurrenceEndTime: e.recurrenceEndTime,
            notificationAudience: e.notificationAudience
        }
    }

    function u(e) {
        if (void 0 !== e) return null === e ? null : {
            startTime: e.startTime,
            endTime: e.endTime
        }
    }

    function l(e) {
        var n;
        return null == (n = e) ? n : {
            mediaId: (0, t.exists)(n, "mediaId") ? n.mediaId : void 0,
            rank: (0, t.exists)(n, "rank") ? n.rank : void 0
        }
    }

    function d(e) {
        if (void 0 !== e) return null === e ? null : {
            mediaId: e.mediaId,
            rank: e.rank
        }
    }

    function c(e) {
        var n;
        return null == (n = e) ? n : {
            category: (0, t.exists)(n, "category") ? n.category : void 0,
            rank: (0, t.exists)(n, "rank") ? n.rank : void 0
        }
    }

    function v(e) {
        if (void 0 !== e) return null === e ? null : {
            category: e.category,
            rank: e.rank
        }
    }

    function p(e) {
        if (void 0 !== e) return null === e ? null : {
            startTime: e.startTime,
            endTime: e.endTime
        }
    }

    function h(e) {
        var n;
        return null == (n = e) ? n : {
            mediaId: (0, t.exists)(n, "mediaId") ? n.mediaId : void 0,
            rank: (0, t.exists)(n, "rank") ? n.rank : void 0
        }
    }

    function f(e) {
        var n, i, s;
        return null == (n = e) ? n : {
            id: (0, t.exists)(n, "id") ? n.id : void 0,
            title: (0, t.exists)(n, "title") ? n.title : void 0,
            displayTitle: (0, t.exists)(n, "displayTitle") ? n.displayTitle : void 0,
            subtitle: (0, t.exists)(n, "subtitle") ? n.subtitle : void 0,
            displaySubtitle: (0, t.exists)(n, "displaySubtitle") ? n.displaySubtitle : void 0,
            description: (0, t.exists)(n, "description") ? n.description : void 0,
            displayDescription: (0, t.exists)(n, "displayDescription") ? n.displayDescription : void 0,
            startTime: (0, t.exists)(n, "startTime") ? null === n.startTime ? null : new Date(n.startTime) : void 0,
            endTime: (0, t.exists)(n, "endTime") ? null === n.endTime ? null : new Date(n.endTime) : void 0,
            universeId: (0, t.exists)(n, "universeId") ? n.universeId : void 0,
            placeId: (0, t.exists)(n, "placeId") ? n.placeId : void 0,
            host: (0, t.exists)(n, "host") ? null == (i = n.host) ? i : {
                hostType: (0, t.exists)(i, "hostType") ? i.hostType : void 0,
                hostId: (0, t.exists)(i, "hostId") ? i.hostId : void 0,
                hostName: (0, t.exists)(i, "hostName") ? i.hostName : void 0,
                hasVerifiedBadge: (0, t.exists)(i, "hasVerifiedBadge") ? i.hasVerifiedBadge : void 0
            } : void 0,
            visibility: (0, t.exists)(n, "visibility") ? n.visibility : void 0,
            featuringStatus: (0, t.exists)(n, "featuringStatus") ? n.featuringStatus : void 0,
            tagline: (0, t.exists)(n, "tagline") ? n.tagline : void 0,
            categories: (0, t.exists)(n, "categories") ? null === n.categories ? null : n.categories.map(o) : void 0,
            thumbnails: (0, t.exists)(n, "thumbnails") ? null === n.thumbnails ? null : n.thumbnails.map(h) : void 0,
            allThumbnailsCreated: (0, t.exists)(n, "allThumbnailsCreated") ? n.allThumbnailsCreated : void 0,
            config: (0, t.exists)(n, "config") ? null == (s = n.config) ? s : {
                recurrence: (0, t.exists)(s, "recurrence") ? s.recurrence : void 0,
                recurrenceEndTime: (0, t.exists)(s, "recurrenceEndTime") ? null === s.recurrenceEndTime ? null : new Date(s.recurrenceEndTime) : void 0,
                notificationAudience: (0, t.exists)(s, "notificationAudience") ? s.notificationAudience : void 0
            } : void 0,
            userRsvpStatus: (0, t.exists)(n, "userRsvpStatus") ? n.userRsvpStatus : void 0,
            createTime: (0, t.exists)(n, "createTime") ? null === n.createTime ? null : new Date(n.createTime) : void 0,
            updateTime: (0, t.exists)(n, "updateTime") ? null === n.updateTime ? null : new Date(n.updateTime) : void 0
        }
    }

    function m(e) {
        var n;
        return null == (n = e) ? n : {
            userId: (0, t.exists)(n, "userId") ? n.userId : void 0,
            rsvpStatus: (0, t.exists)(n, "rsvpStatus") ? n.rsvpStatus : void 0,
            shouldSeeNotificationsUpsellModal: (0, t.exists)(n, "shouldSeeNotificationsUpsellModal") ? n.shouldSeeNotificationsUpsellModal : void 0
        }
    }

    function w(e) {
        var n, i, s;
        return null == (n = e) ? n : {
            id: (0, t.exists)(n, "id") ? n.id : void 0,
            title: (0, t.exists)(n, "title") ? n.title : void 0,
            displayTitle: (0, t.exists)(n, "displayTitle") ? n.displayTitle : void 0,
            subtitle: (0, t.exists)(n, "subtitle") ? n.subtitle : void 0,
            displaySubtitle: (0, t.exists)(n, "displaySubtitle") ? n.displaySubtitle : void 0,
            description: (0, t.exists)(n, "description") ? n.description : void 0,
            displayDescription: (0, t.exists)(n, "displayDescription") ? n.displayDescription : void 0,
            eventTime: (0, t.exists)(n, "eventTime") ? null == (i = n.eventTime) ? i : {
                startUtc: (0, t.exists)(i, "startUtc") ? new Date(i.startUtc) : void 0,
                endUtc: (0, t.exists)(i, "endUtc") ? new Date(i.endUtc) : void 0
            } : void 0,
            host: (0, t.exists)(n, "host") ? null == (s = n.host) ? s : {
                hostName: (0, t.exists)(s, "hostName") ? s.hostName : void 0,
                hasVerifiedBadge: (0, t.exists)(s, "hasVerifiedBadge") ? s.hasVerifiedBadge : void 0,
                hostType: (0, t.exists)(s, "hostType") ? s.hostType : void 0,
                hostId: (0, t.exists)(s, "hostId") ? s.hostId : void 0
            } : void 0,
            universeId: (0, t.exists)(n, "universeId") ? n.universeId : void 0,
            placeId: (0, t.exists)(n, "placeId") ? n.placeId : void 0,
            eventStatus: (0, t.exists)(n, "eventStatus") ? n.eventStatus : void 0,
            eventVisibility: (0, t.exists)(n, "eventVisibility") ? n.eventVisibility : void 0,
            createdUtc: (0, t.exists)(n, "createdUtc") ? new Date(n.createdUtc) : void 0,
            updatedUtc: (0, t.exists)(n, "updatedUtc") ? new Date(n.updatedUtc) : void 0,
            eventCategories: (0, t.exists)(n, "eventCategories") ? null === n.eventCategories ? null : n.eventCategories.map(c) : void 0,
            thumbnails: (0, t.exists)(n, "thumbnails") ? null === n.thumbnails ? null : n.thumbnails.map(l) : void 0,
            allThumbnailsCreated: (0, t.exists)(n, "allThumbnailsCreated") ? n.allThumbnailsCreated : void 0,
            userRsvpStatus: n.userRsvpStatus,
            tagline: (0, t.exists)(n, "tagline") ? n.tagline : void 0,
            featuringStatus: (0, t.exists)(n, "featuringStatus") ? n.featuringStatus : void 0
        }
    }

    function y(e, n) {
        return null == e ? e : {
            nextPageCursor: (0, t.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
            previousPageCursor: (0, t.exists)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
            data: (0, t.exists)(e, "data") ? null === e.data ? null : e.data.map(w) : void 0
        }
    }(function(e) {
        function n() {
            return null !== e && e.apply(this, arguments) || this
        }
        i(n, e), n.prototype.experienceEventsCreateExperienceEventRaw = function(e, n) {
            return s(this, void 0, void 0, function() {
                var i, s, o;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return i = {}, (s = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/experience-events/create",
                                schemaPath: "/v1/experience-events/create",
                                method: "POST",
                                headers: s,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        title: e.title,
                                        subtitle: e.subtitle,
                                        description: e.description,
                                        eventTime: u(e.eventTime),
                                        universeId: e.universeId,
                                        placeId: e.placeId,
                                        groupId: e.groupId,
                                        eventCategories: void 0 === e.eventCategories ? void 0 : null === e.eventCategories ? null : e.eventCategories.map(v),
                                        thumbnails: void 0 === e.thumbnails ? void 0 : null === e.thumbnails ? null : e.thumbnails.map(d),
                                        visibility: e.visibility,
                                        config: a(e.config)
                                    }
                                }(e.experienceEventsCreateExperienceEventRequest)
                            }, n)];
                        case 1:
                            return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return w(e)
                            })]
                    }
                })
            })
        }, n.prototype.experienceEventsCreateExperienceEvent = function() {
            return s(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), r(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.experienceEventsCreateExperienceEventRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.experienceEventsUpdateExperienceEventRaw = function(e, n) {
            return s(this, void 0, void 0, function() {
                var i, s, o;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.id || void 0 === e.id) throw new t.RequiredError("id", "Required parameter requestParameters.id was null or undefined when calling experienceEventsUpdateExperienceEvent.");
                            return i = {}, (s = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/experience-events/{id}".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                schemaPath: "/v1/experience-events/{id}",
                                method: "PATCH",
                                headers: s,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        title: e.title,
                                        subtitle: e.subtitle,
                                        description: e.description,
                                        eventTime: p(e.eventTime),
                                        universeId: e.universeId,
                                        placeId: e.placeId,
                                        visibility: e.visibility,
                                        config: a(e.config),
                                        eventCategories: void 0 === e.eventCategories ? void 0 : null === e.eventCategories ? null : e.eventCategories.map(v),
                                        thumbnails: void 0 === e.thumbnails ? void 0 : null === e.thumbnails ? null : e.thumbnails.map(d)
                                    }
                                }(e.experienceEventsUpdateExperienceEventRequest)
                            }, n)];
                        case 1:
                            return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    isUpdated: (0, t.exists)(e, "isUpdated") ? e.isUpdated : void 0,
                                    thumbnailsUpdated: (0, t.exists)(e, "thumbnailsUpdated") ? e.thumbnailsUpdated : void 0,
                                    categoriesUpdated: (0, t.exists)(e, "categoriesUpdated") ? e.categoriesUpdated : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.experienceEventsUpdateExperienceEvent = function(e, t) {
            return s(this, void 0, void 0, function() {
                return r(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.experienceEventsUpdateExperienceEventRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    })(t.BaseAPI),
    function(e) {
        function n() {
            return null !== e && e.apply(this, arguments) || this
        }
        i(n, e), n.prototype.gameEventDeleteRaw = function(e, n) {
            return s(this, void 0, void 0, function() {
                var i, s, o;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.eventId || void 0 === e.eventId) throw new t.RequiredError("eventId", "Required parameter requestParameters.eventId was null or undefined when calling gameEventDelete.");
                            return i = {}, s = {}, [4, this.request({
                                path: "/v3/game-events/{eventId}".replace("{".concat("eventId", "}"), encodeURIComponent(String(e.eventId))),
                                schemaPath: "/v3/game-events/{eventId}",
                                method: "DELETE",
                                headers: s,
                                query: i
                            }, n)];
                        case 1:
                            return o = r.sent(), [2, new t.VoidApiResponse(o)]
                    }
                })
            })
        }, n.prototype.gameEventDelete = function(e, t) {
            return s(this, void 0, void 0, function() {
                return r(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.gameEventDeleteRaw(e, t)];
                        case 1:
                            return n.sent(), [2]
                    }
                })
            })
        }, n.prototype.gameEventGetRaw = function(e, n) {
            return s(this, void 0, void 0, function() {
                var i, s, o;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.eventId || void 0 === e.eventId) throw new t.RequiredError("eventId", "Required parameter requestParameters.eventId was null or undefined when calling gameEventGet.");
                            return i = {}, void 0 !== e.fields && (i.fields = e.fields), s = {}, [4, this.request({
                                path: "/v3/game-events/{eventId}".replace("{".concat("eventId", "}"), encodeURIComponent(String(e.eventId))),
                                schemaPath: "/v3/game-events/{eventId}",
                                method: "GET",
                                headers: s,
                                query: i
                            }, n)];
                        case 1:
                            return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return f(e)
                            })]
                    }
                })
            })
        }, n.prototype.gameEventGet = function(e, t) {
            return s(this, void 0, void 0, function() {
                return r(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.gameEventGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.gameEventUpdateRaw = function(e, n) {
            return s(this, void 0, void 0, function() {
                var i, s, o;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.eventId || void 0 === e.eventId) throw new t.RequiredError("eventId", "Required parameter requestParameters.eventId was null or undefined when calling gameEventUpdate.");
                            return i = {}, (s = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v3/game-events/{eventId}".replace("{".concat("eventId", "}"), encodeURIComponent(String(e.eventId))),
                                schemaPath: "/v3/game-events/{eventId}",
                                method: "PATCH",
                                headers: s,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        title: e.title,
                                        subtitle: e.subtitle,
                                        description: e.description,
                                        startTime: void 0 === e.startTime ? void 0 : null === e.startTime ? null : e.startTime.toISOString(),
                                        endTime: void 0 === e.endTime ? void 0 : null === e.endTime ? null : e.endTime.toISOString(),
                                        visibility: e.visibility,
                                        placeId: e.placeId,
                                        categories: void 0 === e.categories ? void 0 : null === e.categories ? null : e.categories.map(v),
                                        thumbnails: void 0 === e.thumbnails ? void 0 : null === e.thumbnails ? null : e.thumbnails.map(d),
                                        config: function(e) {
                                            if (void 0 !== e) return null === e ? null : {
                                                recurrence: e.recurrence,
                                                recurrenceEndTime: void 0 === e.recurrenceEndTime ? void 0 : null === e.recurrenceEndTime ? null : e.recurrenceEndTime.toISOString(),
                                                notificationAudience: e.notificationAudience
                                            }
                                        }(e.config),
                                        featuringStatus: e.featuringStatus,
                                        tagline: e.tagline
                                    }
                                }(e.gameEventUpdateRequest)
                            }, n)];
                        case 1:
                            return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return f(e)
                            })]
                    }
                })
            })
        }, n.prototype.gameEventUpdate = function(e, t) {
            return s(this, void 0, void 0, function() {
                return r(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.gameEventUpdateRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    }(t.BaseAPI),
    function(e) {
        function n() {
            return null !== e && e.apply(this, arguments) || this
        }
        i(n, e), n.prototype.gameEventsCreateRaw = function(e, n) {
            return s(this, void 0, void 0, function() {
                var i, s, o;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling gameEventsCreate.");
                            return i = {}, (s = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v3/universes/{universeId}/game-events".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v3/universes/{universeId}/game-events",
                                method: "POST",
                                headers: s,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        title: e.title,
                                        subtitle: e.subtitle,
                                        description: e.description,
                                        startTime: void 0 === e.startTime ? void 0 : null === e.startTime ? null : e.startTime.toISOString(),
                                        endTime: void 0 === e.endTime ? void 0 : null === e.endTime ? null : e.endTime.toISOString(),
                                        visibility: e.visibility,
                                        groupId: e.groupId,
                                        placeId: e.placeId,
                                        categories: void 0 === e.categories ? void 0 : null === e.categories ? null : e.categories.map(v),
                                        thumbnails: void 0 === e.thumbnails ? void 0 : null === e.thumbnails ? null : e.thumbnails.map(d),
                                        config: function(e) {
                                            if (void 0 !== e) return null === e ? null : {
                                                recurrence: e.recurrence,
                                                recurrenceEndTime: void 0 === e.recurrenceEndTime ? void 0 : null === e.recurrenceEndTime ? null : e.recurrenceEndTime.toISOString(),
                                                notificationAudience: e.notificationAudience
                                            }
                                        }(e.config),
                                        featuringStatus: e.featuringStatus,
                                        tagline: e.tagline
                                    }
                                }(e.gameEventsCreateRequest)
                            }, n)];
                        case 1:
                            return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return f(e)
                            })]
                    }
                })
            })
        }, n.prototype.gameEventsCreate = function(e, t) {
            return s(this, void 0, void 0, function() {
                return r(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.gameEventsCreateRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.gameEventsListRaw = function(e, n) {
            return s(this, void 0, void 0, function() {
                var i, s, o;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling gameEventsList.");
                            return i = {}, void 0 !== e.pageSize && (i.pageSize = e.pageSize), void 0 !== e.pageToken && (i.pageToken = e.pageToken), void 0 !== e.reverse && (i.reverse = e.reverse), void 0 !== e.startsBefore && (i.startsBefore = e.startsBefore.toISOString()), void 0 !== e.startsAfter && (i.startsAfter = e.startsAfter.toISOString()), void 0 !== e.endsBefore && (i.endsBefore = e.endsBefore.toISOString()), void 0 !== e.endsAfter && (i.endsAfter = e.endsAfter.toISOString()), void 0 !== e.visibility && (i.visibility = e.visibility), void 0 !== e.fields && (i.fields = e.fields), s = {}, [4, this.request({
                                path: "/v3/universes/{universeId}/game-events".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v3/universes/{universeId}/game-events",
                                method: "GET",
                                headers: s,
                                query: i
                            }, n)];
                        case 1:
                            return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    gameEvents: (0, t.exists)(e, "gameEvents") ? null === e.gameEvents ? null : e.gameEvents.map(f) : void 0,
                                    nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0,
                                    previousPageToken: (0, t.exists)(e, "previousPageToken") ? e.previousPageToken : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.gameEventsList = function(e, t) {
            return s(this, void 0, void 0, function() {
                return r(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.gameEventsListRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    }(t.BaseAPI),
    function(e) {
        function n() {
            return null !== e && e.apply(this, arguments) || this
        }
        i(n, e), n.prototype.notificationsUpdateNotificationsPreferencesRaw = function(e, n) {
            return s(this, void 0, void 0, function() {
                var i, s, o;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return i = {}, (s = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/notifications/preferences",
                                schemaPath: "/v1/notifications/preferences",
                                method: "POST",
                                headers: s,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        isEnabled: e.isEnabled
                                    }
                                }(e.notificationsUpdateNotificationsPreferencesRequest)
                            }, n)];
                        case 1:
                            return o = r.sent(), [2, new t.JSONApiResponse(o)]
                    }
                })
            })
        }, n.prototype.notificationsUpdateNotificationsPreferences = function() {
            return s(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), r(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.notificationsUpdateNotificationsPreferencesRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.notificationsUpdateUserModalHistoryRaw = function(e) {
            return s(this, void 0, void 0, function() {
                var n, i, s;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return n = {}, i = {}, [4, this.request({
                                path: "/v1/notifications/modal-history",
                                schemaPath: "/v1/notifications/modal-history",
                                method: "POST",
                                headers: i,
                                query: n
                            }, e)];
                        case 1:
                            return s = r.sent(), [2, new t.JSONApiResponse(s)]
                    }
                })
            })
        }, n.prototype.notificationsUpdateUserModalHistory = function(e) {
            return s(this, void 0, void 0, function() {
                return r(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.notificationsUpdateUserModalHistoryRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }
    }(t.BaseAPI),
    function(e) {
        function n() {
            return null !== e && e.apply(this, arguments) || this
        }
        i(n, e), n.prototype.rsvpGetRsvpCountersRaw = function(e, n) {
            return s(this, void 0, void 0, function() {
                var i, s, o;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.virtualEventId || void 0 === e.virtualEventId) throw new t.RequiredError("virtualEventId", "Required parameter requestParameters.virtualEventId was null or undefined when calling rsvpGetRsvpCounters.");
                            return i = {}, s = {}, [4, this.request({
                                path: "/v1/virtual-events/{virtualEventId}/rsvps/counters".replace("{".concat("virtualEventId", "}"), encodeURIComponent(String(e.virtualEventId))),
                                schemaPath: "/v1/virtual-events/{virtualEventId}/rsvps/counters",
                                method: "GET",
                                headers: s,
                                query: i
                            }, n)];
                        case 1:
                            return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                var n;
                                return null == e ? e : {
                                    counters: (0, t.exists)(e, "counters") ? null == (n = e.counters) ? n : {
                                        none: (0, t.exists)(n, "none") ? n.none : void 0,
                                        going: (0, t.exists)(n, "going") ? n.going : void 0,
                                        maybeGoing: (0, t.exists)(n, "maybeGoing") ? n.maybeGoing : void 0,
                                        notGoing: (0, t.exists)(n, "notGoing") ? n.notGoing : void 0
                                    } : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.rsvpGetRsvpCounters = function(e, t) {
            return s(this, void 0, void 0, function() {
                return r(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.rsvpGetRsvpCountersRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.rsvpGetUserRsvpedEventsRaw = function(e, n) {
            return s(this, void 0, void 0, function() {
                var i, s, o;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return i = {}, void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.reverse && (i.reverse = e.reverse), void 0 !== e.limit && (i.limit = e.limit), s = {}, [4, this.request({
                                path: "/v1/my-rsvps",
                                schemaPath: "/v1/my-rsvps",
                                method: "GET",
                                headers: s,
                                query: i
                            }, n)];
                        case 1:
                            return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return y(e)
                            })]
                    }
                })
            })
        }, n.prototype.rsvpGetUserRsvpedEvents = function() {
            return s(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), r(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.rsvpGetUserRsvpedEventsRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.rsvpGetVirtualEventRsvpsRaw = function(e, n) {
            return s(this, void 0, void 0, function() {
                var i, s, o;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.virtualEventId || void 0 === e.virtualEventId) throw new t.RequiredError("virtualEventId", "Required parameter requestParameters.virtualEventId was null or undefined when calling rsvpGetVirtualEventRsvps.");
                            return i = {}, void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.reverse && (i.reverse = e.reverse), void 0 !== e.limit && (i.limit = e.limit), s = {}, [4, this.request({
                                path: "/v1/virtual-events/{virtualEventId}/rsvps".replace("{".concat("virtualEventId", "}"), encodeURIComponent(String(e.virtualEventId))),
                                schemaPath: "/v1/virtual-events/{virtualEventId}/rsvps",
                                method: "GET",
                                headers: s,
                                query: i
                            }, n)];
                        case 1:
                            return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return null == e ? e : {
                                    nextPageCursor: (0, t.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                    previousPageCursor: (0, t.exists)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                    data: (0, t.exists)(e, "data") ? null === e.data ? null : e.data.map(m) : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.rsvpGetVirtualEventRsvps = function(e, t) {
            return s(this, void 0, void 0, function() {
                return r(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.rsvpGetVirtualEventRsvpsRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.rsvpRsvpToEventRaw = function(e, n) {
            return s(this, void 0, void 0, function() {
                var i, s, o;
                return r(this, function(r) {
                    switch (r.label) {
                        case 0:
                            if (null === e.virtualEventId || void 0 === e.virtualEventId) throw new t.RequiredError("virtualEventId", "Required parameter requestParameters.virtualEventId was null or undefined when calling rsvpRsvpToEvent.");
                            return i = {}, (s = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/virtual-events/{virtualEventId}/rsvps".replace("{".concat("virtualEventId", "}"), encodeURIComponent(String(e.virtualEventId))),
                                schemaPath: "/v1/virtual-events/{virtualEventId}/rsvps",
                                method: "POST",
                                headers: s,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        rsvpStatus: e.rsvpStatus
                                    }
                                }(e.rsvpRsvpToEventRequest)
                            }, n)];
                        case 1:
                            return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                return m(e)
                            })]
                    }
                })
            })
        }, n.prototype.rsvpRsvpToEvent = function(e, t) {
            return s(this, void 0, void 0, function() {
                return r(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.rsvpRsvpToEventRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    }(t.BaseAPI);
    var I = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(n, e), n.prototype.universesGetUniverseEventOccurrencesRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var i, s, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling universesGetUniverseEventOccurrences.");
                                return i = {}, void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.limit && (i.limit = e.limit), s = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/event-occurrences".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/event-occurrences",
                                    method: "GET",
                                    headers: s,
                                    query: i
                                }, n)];
                            case 1:
                                return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return y(e)
                                })]
                        }
                    })
                })
            }, n.prototype.universesGetUniverseEventOccurrences = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return r(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.universesGetUniverseEventOccurrencesRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.universesGetUniverseVirtualEventsRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var i, s, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling universesGetUniverseVirtualEvents.");
                                return i = {}, void 0 !== e.fromUtc && (i.fromUtc = e.fromUtc.toISOString()), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.reverse && (i.reverse = e.reverse), void 0 !== e.limit && (i.limit = e.limit), s = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/virtual-events".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/virtual-events",
                                    method: "GET",
                                    headers: s,
                                    query: i
                                }, n)];
                            case 1:
                                return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return y(e)
                                })]
                        }
                    })
                })
            }, n.prototype.universesGetUniverseVirtualEvents = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return r(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.universesGetUniverseVirtualEventsRaw(e, t)];
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
            return i(n, e), n.prototype.universesV2GetUniverseVirtualEventsRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var i, s, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling universesV2GetUniverseVirtualEvents.");
                                return i = {}, void 0 !== e.startsBefore && (i.startsBefore = e.startsBefore.toISOString()), void 0 !== e.startsAfter && (i.startsAfter = e.startsAfter.toISOString()), void 0 !== e.endsBefore && (i.endsBefore = e.endsBefore.toISOString()), void 0 !== e.endsAfter && (i.endsAfter = e.endsAfter.toISOString()), void 0 !== e.visibility && (i.visibility = e.visibility), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.reverse && (i.reverse = e.reverse), void 0 !== e.limit && (i.limit = e.limit), s = {}, [4, this.request({
                                    path: "/v2/universes/{universeId}/experience-events".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/universes/{universeId}/experience-events",
                                    method: "GET",
                                    headers: s,
                                    query: i
                                }, n)];
                            case 1:
                                return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return y(e)
                                })]
                        }
                    })
                })
            }, n.prototype.universesV2GetUniverseVirtualEvents = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return r(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.universesV2GetUniverseVirtualEventsRaw(e, t)];
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
            return i(n, e), n.prototype.virtualEventsCreateVirtualEventRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var i, s, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return i = {}, (s = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/virtual-events/create",
                                    schemaPath: "/v1/virtual-events/create",
                                    method: "POST",
                                    headers: s,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            title: e.title,
                                            subtitle: e.subtitle,
                                            description: e.description,
                                            eventTime: u(e.eventTime),
                                            universeId: e.universeId,
                                            placeId: e.placeId,
                                            groupId: e.groupId,
                                            eventCategories: void 0 === e.eventCategories ? void 0 : null === e.eventCategories ? null : e.eventCategories.map(v),
                                            thumbnails: void 0 === e.thumbnails ? void 0 : null === e.thumbnails ? null : e.thumbnails.map(d),
                                            visibility: e.visibility,
                                            tagline: e.tagline,
                                            featuringStatus: e.featuringStatus
                                        }
                                    }(e.virtualEventsCreateVirtualEventRequest)
                                }, n)];
                            case 1:
                                return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return w(e)
                                })]
                        }
                    })
                })
            }, n.prototype.virtualEventsCreateVirtualEvent = function() {
                return s(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), r(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.virtualEventsCreateVirtualEventRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.virtualEventsDeleteVirtualEventRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var i, s, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new t.RequiredError("id", "Required parameter requestParameters.id was null or undefined when calling virtualEventsDeleteVirtualEvent.");
                                return i = {}, s = {}, [4, this.request({
                                    path: "/v1/virtual-events/{id}".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/virtual-events/{id}",
                                    method: "DELETE",
                                    headers: s,
                                    query: i
                                }, n)];
                            case 1:
                                return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        isDeleted: (0, t.exists)(e, "isDeleted") ? e.isDeleted : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.virtualEventsDeleteVirtualEvent = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return r(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.virtualEventsDeleteVirtualEventRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.virtualEventsGetCreatorVirtualEventsRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var i, s, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return i = {}, void 0 !== e.groupId && (i.groupId = e.groupId), void 0 !== e.filterBy && (i.filterBy = e.filterBy), void 0 !== e.fromUtc && (i.fromUtc = e.fromUtc.toISOString()), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.reverse && (i.reverse = e.reverse), void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.sortBy && (i.sortBy = e.sortBy), void 0 !== e.sortOrder && (i.sortOrder = e.sortOrder), s = {}, [4, this.request({
                                    path: "/v1/virtual-events/my-events",
                                    schemaPath: "/v1/virtual-events/my-events",
                                    method: "GET",
                                    headers: s,
                                    query: i
                                }, n)];
                            case 1:
                                return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return y(e)
                                })]
                        }
                    })
                })
            }, n.prototype.virtualEventsGetCreatorVirtualEvents = function() {
                return s(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), r(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.virtualEventsGetCreatorVirtualEventsRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.virtualEventsGetGroupExperienceEventsRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var i, s, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new t.RequiredError("id", "Required parameter requestParameters.id was null or undefined when calling virtualEventsGetGroupExperienceEvents.");
                                return i = {}, void 0 !== e.endsAfter && (i.endsAfter = e.endsAfter.toISOString()), void 0 !== e.visibility && (i.visibility = e.visibility), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.reverse && (i.reverse = e.reverse), void 0 !== e.limit && (i.limit = e.limit), s = {}, [4, this.request({
                                    path: "/v1/virtual-events/groups/{id}".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/virtual-events/groups/{id}",
                                    method: "GET",
                                    headers: s,
                                    query: i
                                }, n)];
                            case 1:
                                return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return y(e)
                                })]
                        }
                    })
                })
            }, n.prototype.virtualEventsGetGroupExperienceEvents = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return r(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.virtualEventsGetGroupExperienceEventsRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.virtualEventsGetPermissionsForHostRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var i, s, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return i = {}, void 0 !== e.hostId && (i.hostId = e.hostId), void 0 !== e.hostType && (i.hostType = e.hostType), s = {}, [4, this.request({
                                    path: "/v1/virtual-events/permissions",
                                    schemaPath: "/v1/virtual-events/permissions",
                                    method: "GET",
                                    headers: s,
                                    query: i
                                }, n)];
                            case 1:
                                return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        maxPermissionLevel: (0, t.exists)(e, "maxPermissionLevel") ? e.maxPermissionLevel : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.virtualEventsGetPermissionsForHost = function() {
                return s(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), r(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.virtualEventsGetPermissionsForHostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.virtualEventsGetPublicVirtualEventRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var i, s, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new t.RequiredError("id", "Required parameter requestParameters.id was null or undefined when calling virtualEventsGetPublicVirtualEvent.");
                                return i = {}, s = {}, [4, this.request({
                                    path: "/v1/virtual-events/public/{id}".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/virtual-events/public/{id}",
                                    method: "GET",
                                    headers: s,
                                    query: i
                                }, n)];
                            case 1:
                                return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return w(e)
                                })]
                        }
                    })
                })
            }, n.prototype.virtualEventsGetPublicVirtualEvent = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return r(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.virtualEventsGetPublicVirtualEventRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.virtualEventsGetVirtualEventRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var i, s, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new t.RequiredError("id", "Required parameter requestParameters.id was null or undefined when calling virtualEventsGetVirtualEvent.");
                                return i = {}, s = {}, [4, this.request({
                                    path: "/v1/virtual-events/{id}".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/virtual-events/{id}",
                                    method: "GET",
                                    headers: s,
                                    query: i
                                }, n)];
                            case 1:
                                return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return w(e)
                                })]
                        }
                    })
                })
            }, n.prototype.virtualEventsGetVirtualEvent = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return r(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.virtualEventsGetVirtualEventRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.virtualEventsUpdateVirtualEventRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var i, s, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new t.RequiredError("id", "Required parameter requestParameters.id was null or undefined when calling virtualEventsUpdateVirtualEvent.");
                                return i = {}, (s = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/virtual-events/{id}".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/virtual-events/{id}",
                                    method: "PATCH",
                                    headers: s,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            title: e.title,
                                            subtitle: e.subtitle,
                                            description: e.description,
                                            eventTime: p(e.eventTime),
                                            universeId: e.universeId,
                                            placeId: e.placeId,
                                            visibility: e.visibility,
                                            eventCategories: void 0 === e.eventCategories ? void 0 : null === e.eventCategories ? null : e.eventCategories.map(v),
                                            thumbnails: void 0 === e.thumbnails ? void 0 : null === e.thumbnails ? null : e.thumbnails.map(d),
                                            tagline: e.tagline,
                                            featuringStatus: e.featuringStatus
                                        }
                                    }(e.virtualEventsUpdateVirtualEventRequest)
                                }, n)];
                            case 1:
                                return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        isUpdated: (0, t.exists)(e, "isUpdated") ? e.isUpdated : void 0,
                                        thumbnailsUpdated: (0, t.exists)(e, "thumbnailsUpdated") ? e.thumbnailsUpdated : void 0,
                                        categoriesUpdated: (0, t.exists)(e, "categoriesUpdated") ? e.categoriesUpdated : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.virtualEventsUpdateVirtualEvent = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return r(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.virtualEventsUpdateVirtualEventRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.virtualEventsUpdateVirtualEventStatusRaw = function(e, n) {
                return s(this, void 0, void 0, function() {
                    var i, s, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new t.RequiredError("id", "Required parameter requestParameters.id was null or undefined when calling virtualEventsUpdateVirtualEventStatus.");
                                return i = {}, (s = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/virtual-events/{id}/status".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/virtual-events/{id}/status",
                                    method: "PATCH",
                                    headers: s,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            eventStatus: e.eventStatus
                                        }
                                    }(e.virtualEventsUpdateVirtualEventStatusRequest)
                                }, n)];
                            case 1:
                                return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        isUpdated: (0, t.exists)(e, "isUpdated") ? e.isUpdated : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.virtualEventsUpdateVirtualEventStatus = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return r(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.virtualEventsUpdateVirtualEventStatusRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t.BaseAPI);
    e.s(["EventCategory", 0, {
        ContentUpdate: "contentUpdate",
        LocationUpdate: "locationUpdate",
        SystemUpdate: "systemUpdate",
        Activity: "activity",
        NewContent: "newContent",
        ItemDrop: "itemDrop",
        NewSeason: "newSeason",
        NewLocation: "newLocation",
        NewMap: "newMap",
        MoreLevels: "moreLevels",
        NewFeature: "newFeature",
        EarlyAccess: "earlyAccess",
        Expansion: "expansion",
        Challenge: "challenge",
        Quest: "quest",
        Festival: "festival"
    }, "EventFilterBy", 0, {
        Upcoming: "upcoming",
        Past: "past",
        Drafts: "drafts",
        Cancelled: "cancelled"
    }, "EventSortBy", 0, {
        CreatedUtc: "createdUtc",
        StartUtc: "startUtc"
    }, "EventStatus", 0, {
        Unpublished: "unpublished",
        Active: "active",
        Cancelled: "cancelled",
        Moderated: "moderated"
    }, "EventVisibility", 0, {
        Private: "private",
        Public: "public",
        Moderated: "moderated"
    }, "FeaturingStatus", 0, {
        Invalid: "invalid",
        Enabled: "enabled",
        Disabled: "disabled"
    }, "HostType", 0, {
        User: "user",
        Group: "group"
    }, "SortOrder", 0, {
        Asc: "asc",
        Desc: "desc"
    }, "UniversesApi", 0, I, "UniversesV2Api", 0, g, "VirtualEventsApi", 0, b])
}]);

//# debugId=7af7df79-3f31-2d8f-2fd4-0334e77cdd5c
//# sourceMappingURL=3pe16yb2otm51.js.map