;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "9f664323-ffbf-baf0-86c0-d400a081b4ef")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 317143, e => {
    "use strict";
    var t = e.i(415858),
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

    function r(e, t, n, i) {
        return new(n || (n = Promise))(function(r, s) {
            function a(e) {
                try {
                    u(i.next(e))
                } catch (e) {
                    s(e)
                }
            }

            function o(e) {
                try {
                    u(i.throw(e))
                } catch (e) {
                    s(e)
                }
            }

            function u(e) {
                var t;
                e.done ? r(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(a, o)
            }
            u((i = i.apply(e, t || [])).next())
        })
    }

    function s(e, t) {
        var n, i, r, s = {
                label: 0,
                sent: function() {
                    if (1 & r[0]) throw r[1];
                    return r[1]
                },
                trys: [],
                ops: []
            },
            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return a.next = o(0), a.throw = o(1), a.return = o(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
            return this
        }), a;

        function o(o) {
            return function(u) {
                var l = [o, u];
                if (n) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, l[0] && (s = 0)), s;) try {
                    if (n = 1, i && (r = 2 & l[0] ? i.return : l[0] ? i.throw || ((r = i.return) && r.call(i), 0) : i.next) && !(r = r.call(i, l[1])).done) return r;
                    switch (i = 0, r && (l = [2 & l[0], r.value]), l[0]) {
                        case 0:
                        case 1:
                            r = l;
                            break;
                        case 4:
                            return s.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            s.label++, i = l[1], l = [0];
                            continue;
                        case 7:
                            l = s.ops.pop(), s.trys.pop();
                            continue;
                        default:
                            if (!(r = (r = s.trys).length > 0 && r[r.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                s = 0;
                                continue
                            }
                            if (3 === l[0] && (!r || l[1] > r[0] && l[1] < r[3])) {
                                s.label = l[1];
                                break
                            }
                            if (6 === l[0] && s.label < r[1]) {
                                s.label = r[1], r = l;
                                break
                            }
                            if (r && s.label < r[2]) {
                                s.label = r[2], s.ops.push(l);
                                break
                            }
                            r[2] && s.ops.pop(), s.trys.pop();
                            continue
                    }
                    l = t.call(e, s)
                } catch (e) {
                    l = [6, e], i = 0
                } finally {
                    n = r = 0
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

    function a(e, n) {
        var i;
        return null == e ? e : {
            creator: (0, t.u)(e, "creator") ? null == (i = e.creator) ? i : {
                userId: (0, t.u)(i, "userId") ? i.userId : void 0,
                groupId: (0, t.u)(i, "groupId") ? i.groupId : void 0,
                experienceId: (0, t.u)(i, "experienceId") ? i.experienceId : void 0
            } : void 0,
            expectedPrice: (0, t.u)(e, "expectedPrice") ? e.expectedPrice : void 0,
            creatingUniverseId: (0, t.u)(e, "creatingUniverseId") ? e.creatingUniverseId : void 0,
            assetPrivacy: (0, t.u)(e, "assetPrivacy") ? e.assetPrivacy : void 0,
            accessScope: (0, t.u)(e, "accessScope") ? e.accessScope : void 0,
            intendedVersionState: (0, t.u)(e, "intendedVersionState") ? e.intendedVersionState : void 0,
            hasIntendedVersionState: (0, t.u)(e, "hasIntendedVersionState") ? e.hasIntendedVersionState : void 0
        }
    }

    function o(e, n) {
        return null == e ? e : {
            moderationState: (0, t.u)(e, "moderationState") ? e.moderationState : void 0
        }
    }

    function u(e) {
        var n;
        return null == (n = e) ? n : {
            asset: (0, t.u)(n, "asset") ? n.asset : void 0,
            altText: (0, t.u)(n, "altText") ? n.altText : void 0
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
            title: (0, t.u)(e, "title") ? e.title : void 0,
            uri: (0, t.u)(e, "uri") ? e.uri : void 0
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
            path: (0, t.u)(e, "path") ? e.path : void 0,
            revisionId: (0, t.u)(e, "revisionId") ? e.revisionId : void 0,
            revisionCreateTime: (0, t.u)(e, "revisionCreateTime") ? null === e.revisionCreateTime ? null : new Date(e.revisionCreateTime) : void 0,
            assetId: (0, t.u)(e, "assetId") ? e.assetId : void 0,
            displayName: (0, t.u)(e, "displayName") ? e.displayName : void 0,
            description: (0, t.u)(e, "description") ? e.description : void 0,
            assetType: (0, t.u)(e, "assetType") ? e.assetType : void 0,
            creationContext: (0, t.u)(e, "creationContext") ? a(e.creationContext) : void 0,
            moderationResult: (0, t.u)(e, "moderationResult") ? o(e.moderationResult) : void 0,
            published: (0, t.u)(e, "published") ? e.published : void 0,
            hasPublished: (0, t.u)(e, "hasPublished") ? e.hasPublished : void 0,
            icon: (0, t.u)(e, "icon") ? e.icon : void 0,
            previews: (0, t.u)(e, "previews") ? null === e.previews ? null : e.previews.map(u) : void 0,
            state: (0, t.u)(e, "state") ? e.state : void 0,
            facebookSocialLink: (0, t.u)(e, "facebookSocialLink") ? d(e.facebookSocialLink) : void 0,
            twitterSocialLink: (0, t.u)(e, "twitterSocialLink") ? d(e.twitterSocialLink) : void 0,
            youtubeSocialLink: (0, t.u)(e, "youtubeSocialLink") ? d(e.youtubeSocialLink) : void 0,
            twitchSocialLink: (0, t.u)(e, "twitchSocialLink") ? d(e.twitchSocialLink) : void 0,
            discordSocialLink: (0, t.u)(e, "discordSocialLink") ? d(e.discordSocialLink) : void 0,
            githubSocialLink: (0, t.u)(e, "githubSocialLink") ? d(e.githubSocialLink) : void 0,
            robloxSocialLink: (0, t.u)(e, "robloxSocialLink") ? d(e.robloxSocialLink) : void 0,
            guildedSocialLink: (0, t.u)(e, "guildedSocialLink") ? d(e.guildedSocialLink) : void 0,
            devForumSocialLink: (0, t.u)(e, "devForumSocialLink") ? d(e.devForumSocialLink) : void 0,
            tryAssetSocialLink: (0, t.u)(e, "tryAssetSocialLink") ? d(e.tryAssetSocialLink) : void 0
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
                            groupId: e.groupId,
                            experienceId: e.experienceId
                        }
                    }(e.creator),
                    expectedPrice: e.expectedPrice,
                    creatingUniverseId: e.creatingUniverseId,
                    assetPrivacy: e.assetPrivacy,
                    accessScope: e.accessScope,
                    intendedVersionState: e.intendedVersionState
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
            path: (0, t.u)(n, "path") ? n.path : void 0,
            quotaType: (0, t.u)(n, "quotaType") ? n.quotaType : void 0,
            assetType: (0, t.u)(n, "assetType") ? n.assetType : void 0,
            usage: (0, t.u)(n, "usage") ? n.usage : void 0,
            capacity: (0, t.u)(n, "capacity") ? n.capacity : void 0,
            period: (0, t.u)(n, "period") ? n.period : void 0,
            usageResetTime: (0, t.u)(n, "usageResetTime") ? null === n.usageResetTime ? null : new Date(n.usageResetTime) : void 0
        }
    }

    function f(e) {
        var n;
        return null == (n = e) ? n : {
            path: (0, t.u)(n, "path") ? n.path : void 0,
            createTime: (0, t.u)(n, "createTime") ? null === n.createTime ? null : new Date(n.createTime) : void 0,
            creationContext: (0, t.u)(n, "creationContext") ? a(n.creationContext) : void 0,
            moderationResult: (0, t.u)(n, "moderationResult") ? o(n.moderationResult) : void 0,
            published: (0, t.u)(n, "published") ? n.published : void 0,
            versionState: (0, t.u)(n, "versionState") ? n.versionState : void 0
        }
    }

    function m(e) {
        var n;
        return null == (n = e) ? n : {
            reason: (0, t.u)(n, "reason") ? n.reason : void 0,
            domain: (0, t.u)(n, "domain") ? n.domain : void 0,
            metadata: (0, t.u)(n, "metadata") ? n.metadata : void 0
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
            httpVerb: (0, t.u)(n, "httpVerb") ? n.httpVerb : void 0,
            url: (0, t.u)(n, "url") ? n.url : void 0,
            expirationTimeMs: (0, t.u)(n, "expirationTimeMs") ? n.expirationTimeMs : void 0,
            chunkNum: (0, t.u)(n, "chunkNum") ? n.chunkNum : void 0,
            contentStart: (0, t.u)(n, "contentStart") ? n.contentStart : void 0,
            contentLength: (0, t.u)(n, "contentLength") ? n.contentLength : void 0
        }
    }

    function I(e, n) {
        return null == e ? e : {
            operationPath: (0, t.u)(e, "operationPath") ? e.operationPath : void 0,
            uploadUrls: (0, t.u)(e, "uploadUrls") ? null === e.uploadUrls ? null : e.uploadUrls.map(y) : void 0
        }
    }

    function g(e, n) {
        var i;
        return null == e ? e : {
            path: (0, t.u)(e, "path") ? e.path : void 0,
            operationId: (0, t.u)(e, "operationId") ? e.operationId : void 0,
            done: (0, t.u)(e, "done") ? e.done : void 0,
            error: (0, t.u)(e, "error") ? null == (i = e.error) ? i : {
                code: (0, t.u)(i, "code") ? i.code : void 0,
                message: (0, t.u)(i, "message") ? i.message : void 0,
                details: (0, t.u)(i, "details") ? i.details.map(m) : void 0
            } : void 0,
            response: (0, t.u)(e, "response") ? v(e.response) : void 0
        }
    }
    var b = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(n, e), n.prototype.assetsArchiveAssetRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetsArchiveAsset.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}:archive".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}:archive",
                                    method: "POST",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.H(a, function(e) {
                                    return v(e)
                                })]
                        }
                    })
                })
            }, n.prototype.assetsArchiveAsset = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
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
            }, n.prototype.assetsChangeAssetVersionStateRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetsChangeAssetVersionState.");
                                if (null === e.versionNumber || void 0 === e.versionNumber) throw new t.w("versionNumber", "Required parameter requestParameters.versionNumber was null or undefined when calling assetsChangeAssetVersionState.");
                                return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/assets/{assetId}/versions/{versionNumber}:changeState".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))).replace("{".concat("versionNumber", "}"), encodeURIComponent(String(e.versionNumber))),
                                    schemaPath: "/v1/assets/{assetId}/versions/{versionNumber}:changeState",
                                    method: "POST",
                                    headers: r,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            intendedVersionState: e.intendedVersionState,
                                            childAssetsMode: e.childAssetsMode
                                        }
                                    }(e.changeAssetVersionStateRequest)
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.H(a, function(e) {
                                    return g(e)
                                })]
                        }
                    })
                })
            }, n.prototype.assetsChangeAssetVersionState = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.assetsChangeAssetVersionStateRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.assetsCreateAssetRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, a, o;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.fileContent || void 0 === e.fileContent) throw new t.w("fileContent", "Required parameter requestParameters.fileContent was null or undefined when calling assetsCreateAsset.");
                                return i = {}, r = {}, a = (0, t.I)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.fileContent && a.append("fileContent", e.fileContent), void 0 !== e.request && a.append("request", JSON.stringify(p(e.request))), [4, this.request({
                                    path: "/v1/assets",
                                    schemaPath: "/v1/assets",
                                    method: "POST",
                                    headers: r,
                                    query: i,
                                    body: a
                                }, n)];
                            case 1:
                                return o = s.sent(), [2, new t.H(o, function(e) {
                                    return g(e)
                                })]
                        }
                    })
                })
            }, n.prototype.assetsCreateAsset = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
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
                return r(this, void 0, void 0, function() {
                    var i, r, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetsGetAsset.");
                                return i = {}, e.readMask && (i.readMask = e.readMask.join(t.G.csv)), r = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.H(a, function(e) {
                                    return v(e)
                                })]
                        }
                    })
                })
            }, n.prototype.assetsGetAsset = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
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
                return r(this, void 0, void 0, function() {
                    var i, r, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetsRestoreAsset.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}:restore".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}:restore",
                                    method: "POST",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.H(a, function(e) {
                                    return v(e)
                                })]
                        }
                    })
                })
            }, n.prototype.assetsRestoreAsset = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
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
                return r(this, void 0, void 0, function() {
                    var i, r, a, o;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetsUpdateAsset.");
                                return i = {}, e.updateMask && (i.updateMask = e.updateMask.join(t.G.csv)), r = {}, a = (0, t.I)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.fileContent && a.append("fileContent", e.fileContent), void 0 !== e.request && a.append("request", JSON.stringify(p(e.request))), [4, this.request({
                                    path: "/v1/assets/{assetId}".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}",
                                    method: "PATCH",
                                    headers: r,
                                    query: i,
                                    body: a
                                }, n)];
                            case 1:
                                return o = s.sent(), [2, new t.H(o, function(e) {
                                    return g(e)
                                })]
                        }
                    })
                })
            }, n.prototype.assetsUpdateAsset = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
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
        }(t._),
        S = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(n, e), n.prototype.assetsGetAssetVersionRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetsGetAssetVersion.");
                                if (null === e.revisionId || void 0 === e.revisionId) throw new t.w("revisionId", "Required parameter requestParameters.revisionId was null or undefined when calling assetsGetAssetVersion.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}/versions/{revisionId}".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))).replace("{".concat("revisionId", "}"), encodeURIComponent(String(e.revisionId))),
                                    schemaPath: "/v1/assets/{assetId}/versions/{revisionId}",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.H(a, function(e) {
                                    return f(e)
                                })]
                        }
                    })
                })
            }, n.prototype.assetsGetAssetVersion = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
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
                return r(this, void 0, void 0, function() {
                    var i, r, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetsListAssetVersions.");
                                return i = {}, void 0 !== e.maxPageSize && (i.maxPageSize = e.maxPageSize), void 0 !== e.pageToken && (i.pageToken = e.pageToken), void 0 !== e.filter && (i.filter = e.filter), r = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}/versions".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/versions",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.H(a, function(e) {
                                    return null == e ? e : {
                                        assetVersions: (0, t.u)(e, "assetVersions") ? null === e.assetVersions ? null : e.assetVersions.map(f) : void 0,
                                        nextPageToken: (0, t.u)(e, "nextPageToken") ? e.nextPageToken : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.assetsListAssetVersions = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
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
                return r(this, void 0, void 0, function() {
                    var i, r, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetsRollbackAssetVersion.");
                                return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/assets/{assetId}/versions:rollback".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/versions:rollback",
                                    method: "POST",
                                    headers: r,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            assetVersion: e.assetVersion
                                        }
                                    }(e.rollbackAssetVersionRequest)
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.H(a, function(e) {
                                    return f(e)
                                })]
                        }
                    })
                })
            }, n.prototype.assetsRollbackAssetVersion = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
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
            }, n
        }(t._),
        E = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(n, e), n.prototype.assetsCreateAssetWithMultipartUploadRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return i = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/assets:multipartUpload",
                                    schemaPath: "/v1/assets:multipartUpload",
                                    method: "POST",
                                    headers: r,
                                    query: i,
                                    body: w(e.multipartUploadStartRequest)
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.H(a, function(e) {
                                    return I(e)
                                })]
                        }
                    })
                })
            }, n.prototype.assetsCreateAssetWithMultipartUpload = function() {
                return r(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), s(this, function(n) {
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
                return r(this, void 0, void 0, function() {
                    var i, r, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.operationId || void 0 === e.operationId) throw new t.w("operationId", "Required parameter requestParameters.operationId was null or undefined when calling assetsMultipartUploadAbort.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/operations/{operationId}:multipartUpload".replace("{".concat("operationId", "}"), encodeURIComponent(String(e.operationId))),
                                    schemaPath: "/v1/operations/{operationId}:multipartUpload",
                                    method: "DELETE",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.V(a)]
                        }
                    })
                })
            }, n.prototype.assetsMultipartUploadAbort = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.assetsMultipartUploadAbortRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, n.prototype.assetsMultipartUploadChunkCompleteRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.operationId || void 0 === e.operationId) throw new t.w("operationId", "Required parameter requestParameters.operationId was null or undefined when calling assetsMultipartUploadChunkComplete.");
                                return i = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/operations/{operationId}:multipartUploadChunkComplete".replace("{".concat("operationId", "}"), encodeURIComponent(String(e.operationId))),
                                    schemaPath: "/v1/operations/{operationId}:multipartUploadChunkComplete",
                                    method: "POST",
                                    headers: r,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            chunkNum: e.chunkNum,
                                            eTag: e.eTag
                                        }
                                    }(e.multipartUploadChunkCompleteRequest)
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.V(a)]
                        }
                    })
                })
            }, n.prototype.assetsMultipartUploadChunkComplete = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.assetsMultipartUploadChunkCompleteRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, n.prototype.assetsMultipartUploadCompleteRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.operationId || void 0 === e.operationId) throw new t.w("operationId", "Required parameter requestParameters.operationId was null or undefined when calling assetsMultipartUploadComplete.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/operations/{operationId}:multipartUploadComplete".replace("{".concat("operationId", "}"), encodeURIComponent(String(e.operationId))),
                                    schemaPath: "/v1/operations/{operationId}:multipartUploadComplete",
                                    method: "POST",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.H(a, function(e) {
                                    return g(e)
                                })]
                        }
                    })
                })
            }, n.prototype.assetsMultipartUploadComplete = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
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
                return r(this, void 0, void 0, function() {
                    var i, r, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling assetsUpdateAssetWithMultipartUpload.");
                                return i = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/assets/{assetId}:multipartUpload".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}:multipartUpload",
                                    method: "PATCH",
                                    headers: r,
                                    query: i,
                                    body: w(e.multipartUploadStartRequest)
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.H(a, function(e) {
                                    return I(e)
                                })]
                        }
                    })
                })
            }, n.prototype.assetsUpdateAssetWithMultipartUpload = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
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
        }(t._),
        R = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(n, e), n.prototype.assetsGetOperationRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.operationId || void 0 === e.operationId) throw new t.w("operationId", "Required parameter requestParameters.operationId was null or undefined when calling assetsGetOperation.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/operations/{operationId}".replace("{".concat("operationId", "}"), encodeURIComponent(String(e.operationId))),
                                    schemaPath: "/v1/operations/{operationId}",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.H(a, function(e) {
                                    return g(e)
                                })]
                        }
                    })
                })
            }, n.prototype.assetsGetOperation = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
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
        }(t._);
    (function(e) {
        function n() {
            return null !== e && e.apply(this, arguments) || this
        }
        i(n, e), n.prototype.usersListAssetQuotasRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var i, r, a;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new t.w("userId", "Required parameter requestParameters.userId was null or undefined when calling usersListAssetQuotas.");
                            return i = {}, void 0 !== e.maxPageSize && (i.maxPageSize = e.maxPageSize), void 0 !== e.pageToken && (i.pageToken = e.pageToken), void 0 !== e.filter && (i.filter = e.filter), r = {}, [4, this.request({
                                path: "/v2/users/{userId}/asset-quotas".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                schemaPath: "/v2/users/{userId}/asset-quotas",
                                method: "GET",
                                headers: r,
                                query: i
                            }, n)];
                        case 1:
                            return a = s.sent(), [2, new t.H(a, function(e) {
                                return null == e ? e : {
                                    assetQuotas: (0, t.u)(e, "assetQuotas") ? null === e.assetQuotas ? null : e.assetQuotas.map(h) : void 0,
                                    nextPageToken: (0, t.u)(e, "nextPageToken") ? e.nextPageToken : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.usersListAssetQuotas = function(e, t) {
            return r(this, void 0, void 0, function() {
                return s(this, function(n) {
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
    })(t._), e.s(["k", 0, b, "o", 0, {
        Unspecified: "Unspecified",
        Default: "Default",
        OpenUse: "OpenUse",
        Restricted: "Restricted"
    }, "s", 0, {
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
        TextDocument: "TextDocument",
        Post: "Post",
        AnimatedImage: "AnimatedImage",
        ComputeFunction: "ComputeFunction"
    }, "l", 0, S, "x", 0, {
        Unspecified: "Unspecified",
        Draft: "Draft",
        Published: "Published",
        Rejected: "Rejected"
    }, "N", 0, {
        Unspecified: "Unspecified",
        Reviewing: "Reviewing",
        Rejected: "Rejected",
        Approved: "Approved"
    }, "a", 0, E, "m", 0, u, "n", 0, {
        Unspecified: "ASSET_VERSION_STATE_UNSPECIFIED",
        Draft: "ASSET_VERSION_STATE_DRAFT",
        Published: "ASSET_VERSION_STATE_PUBLISHED",
        Rejected: "ASSET_VERSION_STATE_REJECTED"
    }, "y", 0, R])
}, 482979, e => {
    "use strict";
    var t = e.i(415858),
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

    function r(e, t, n, i) {
        return new(n || (n = Promise))(function(r, s) {
            function a(e) {
                try {
                    u(i.next(e))
                } catch (e) {
                    s(e)
                }
            }

            function o(e) {
                try {
                    u(i.throw(e))
                } catch (e) {
                    s(e)
                }
            }

            function u(e) {
                var t;
                e.done ? r(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(a, o)
            }
            u((i = i.apply(e, t || [])).next())
        })
    }

    function s(e, t) {
        var n, i, r, s = {
                label: 0,
                sent: function() {
                    if (1 & r[0]) throw r[1];
                    return r[1]
                },
                trys: [],
                ops: []
            },
            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return a.next = o(0), a.throw = o(1), a.return = o(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
            return this
        }), a;

        function o(o) {
            return function(u) {
                var l = [o, u];
                if (n) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, l[0] && (s = 0)), s;) try {
                    if (n = 1, i && (r = 2 & l[0] ? i.return : l[0] ? i.throw || ((r = i.return) && r.call(i), 0) : i.next) && !(r = r.call(i, l[1])).done) return r;
                    switch (i = 0, r && (l = [2 & l[0], r.value]), l[0]) {
                        case 0:
                        case 1:
                            r = l;
                            break;
                        case 4:
                            return s.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            s.label++, i = l[1], l = [0];
                            continue;
                        case 7:
                            l = s.ops.pop(), s.trys.pop();
                            continue;
                        default:
                            if (!(r = (r = s.trys).length > 0 && r[r.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                s = 0;
                                continue
                            }
                            if (3 === l[0] && (!r || l[1] > r[0] && l[1] < r[3])) {
                                s.label = l[1];
                                break
                            }
                            if (6 === l[0] && s.label < r[1]) {
                                s.label = r[1], r = l;
                                break
                            }
                            if (r && s.label < r[2]) {
                                s.label = r[2], s.ops.push(l);
                                break
                            }
                            r[2] && s.ops.pop(), s.trys.pop();
                            continue
                    }
                    l = t.call(e, s)
                } catch (e) {
                    l = [6, e], i = 0
                } finally {
                    n = r = 0
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

    function a(e) {
        var n;
        return null == (n = e) ? n : {
            category: (0, t.u)(n, "category") ? n.category : void 0,
            rank: (0, t.u)(n, "rank") ? n.rank : void 0
        }
    }

    function o(e) {
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
            mediaId: (0, t.u)(n, "mediaId") ? n.mediaId : void 0,
            rank: (0, t.u)(n, "rank") ? n.rank : void 0
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
            category: (0, t.u)(n, "category") ? n.category : void 0,
            rank: (0, t.u)(n, "rank") ? n.rank : void 0
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
            mediaId: (0, t.u)(n, "mediaId") ? n.mediaId : void 0,
            rank: (0, t.u)(n, "rank") ? n.rank : void 0
        }
    }

    function f(e) {
        var n, i;
        return null == (n = e) ? n : {
            id: (0, t.u)(n, "id") ? n.id : void 0,
            title: (0, t.u)(n, "title") ? n.title : void 0,
            displayTitle: (0, t.u)(n, "displayTitle") ? n.displayTitle : void 0,
            subtitle: (0, t.u)(n, "subtitle") ? n.subtitle : void 0,
            displaySubtitle: (0, t.u)(n, "displaySubtitle") ? n.displaySubtitle : void 0,
            description: (0, t.u)(n, "description") ? n.description : void 0,
            displayDescription: (0, t.u)(n, "displayDescription") ? n.displayDescription : void 0,
            startTime: (0, t.u)(n, "startTime") ? null === n.startTime ? null : new Date(n.startTime) : void 0,
            endTime: (0, t.u)(n, "endTime") ? null === n.endTime ? null : new Date(n.endTime) : void 0,
            universeId: (0, t.u)(n, "universeId") ? n.universeId : void 0,
            placeId: (0, t.u)(n, "placeId") ? n.placeId : void 0,
            host: (0, t.u)(n, "host") ? null == (i = n.host) ? i : {
                hostType: (0, t.u)(i, "hostType") ? i.hostType : void 0,
                hostId: (0, t.u)(i, "hostId") ? i.hostId : void 0,
                hostName: (0, t.u)(i, "hostName") ? i.hostName : void 0,
                hasVerifiedBadge: (0, t.u)(i, "hasVerifiedBadge") ? i.hasVerifiedBadge : void 0
            } : void 0,
            visibility: (0, t.u)(n, "visibility") ? n.visibility : void 0,
            featuringStatus: (0, t.u)(n, "featuringStatus") ? n.featuringStatus : void 0,
            tagline: (0, t.u)(n, "tagline") ? n.tagline : void 0,
            categories: (0, t.u)(n, "categories") ? null === n.categories ? null : n.categories.map(a) : void 0,
            thumbnails: (0, t.u)(n, "thumbnails") ? null === n.thumbnails ? null : n.thumbnails.map(h) : void 0,
            allThumbnailsCreated: (0, t.u)(n, "allThumbnailsCreated") ? n.allThumbnailsCreated : void 0,
            userRsvpStatus: (0, t.u)(n, "userRsvpStatus") ? n.userRsvpStatus : void 0,
            createTime: (0, t.u)(n, "createTime") ? null === n.createTime ? null : new Date(n.createTime) : void 0,
            updateTime: (0, t.u)(n, "updateTime") ? null === n.updateTime ? null : new Date(n.updateTime) : void 0
        }
    }

    function m(e) {
        var n;
        return null == (n = e) ? n : {
            userId: (0, t.u)(n, "userId") ? n.userId : void 0,
            rsvpStatus: (0, t.u)(n, "rsvpStatus") ? n.rsvpStatus : void 0,
            shouldSeeNotificationsUpsellModal: (0, t.u)(n, "shouldSeeNotificationsUpsellModal") ? n.shouldSeeNotificationsUpsellModal : void 0
        }
    }

    function w(e) {
        var n, i, r;
        return null == (n = e) ? n : {
            id: (0, t.u)(n, "id") ? n.id : void 0,
            title: (0, t.u)(n, "title") ? n.title : void 0,
            displayTitle: (0, t.u)(n, "displayTitle") ? n.displayTitle : void 0,
            subtitle: (0, t.u)(n, "subtitle") ? n.subtitle : void 0,
            displaySubtitle: (0, t.u)(n, "displaySubtitle") ? n.displaySubtitle : void 0,
            description: (0, t.u)(n, "description") ? n.description : void 0,
            displayDescription: (0, t.u)(n, "displayDescription") ? n.displayDescription : void 0,
            eventTime: (0, t.u)(n, "eventTime") ? null == (i = n.eventTime) ? i : {
                startUtc: (0, t.u)(i, "startUtc") ? new Date(i.startUtc) : void 0,
                endUtc: (0, t.u)(i, "endUtc") ? new Date(i.endUtc) : void 0
            } : void 0,
            host: (0, t.u)(n, "host") ? null == (r = n.host) ? r : {
                hostName: (0, t.u)(r, "hostName") ? r.hostName : void 0,
                hasVerifiedBadge: (0, t.u)(r, "hasVerifiedBadge") ? r.hasVerifiedBadge : void 0,
                hostType: (0, t.u)(r, "hostType") ? r.hostType : void 0,
                hostId: (0, t.u)(r, "hostId") ? r.hostId : void 0
            } : void 0,
            universeId: (0, t.u)(n, "universeId") ? n.universeId : void 0,
            placeId: (0, t.u)(n, "placeId") ? n.placeId : void 0,
            eventStatus: (0, t.u)(n, "eventStatus") ? n.eventStatus : void 0,
            eventVisibility: (0, t.u)(n, "eventVisibility") ? n.eventVisibility : void 0,
            createdUtc: (0, t.u)(n, "createdUtc") ? new Date(n.createdUtc) : void 0,
            updatedUtc: (0, t.u)(n, "updatedUtc") ? new Date(n.updatedUtc) : void 0,
            eventCategories: (0, t.u)(n, "eventCategories") ? null === n.eventCategories ? null : n.eventCategories.map(c) : void 0,
            thumbnails: (0, t.u)(n, "thumbnails") ? null === n.thumbnails ? null : n.thumbnails.map(l) : void 0,
            allThumbnailsCreated: (0, t.u)(n, "allThumbnailsCreated") ? n.allThumbnailsCreated : void 0,
            userRsvpStatus: n.userRsvpStatus,
            tagline: (0, t.u)(n, "tagline") ? n.tagline : void 0,
            featuringStatus: (0, t.u)(n, "featuringStatus") ? n.featuringStatus : void 0
        }
    }

    function y(e, n) {
        return null == e ? e : {
            nextPageCursor: (0, t.u)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
            previousPageCursor: (0, t.u)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
            data: (0, t.u)(e, "data") ? null === e.data ? null : e.data.map(w) : void 0
        }
    }
    var I = t._;

    function g() {
        return null !== I && I.apply(this, arguments) || this
    }
    i(g, I), g.prototype.experienceEventsCreateExperienceEventRaw = function(e, n) {
        return r(this, void 0, void 0, function() {
            var i, r, a;
            return s(this, function(s) {
                switch (s.label) {
                    case 0:
                        return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                            path: "/v1/experience-events/create",
                            schemaPath: "/v1/experience-events/create",
                            method: "POST",
                            headers: r,
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
                                    config: o(e.config)
                                }
                            }(e.experienceEventsCreateExperienceEventRequest)
                        }, n)];
                    case 1:
                        return a = s.sent(), [2, new t.H(a, function(e) {
                            return w(e)
                        })]
                }
            })
        })
    }, g.prototype.experienceEventsCreateExperienceEvent = function() {
        return r(this, arguments, void 0, function(e, t) {
            return void 0 === e && (e = {}), s(this, function(n) {
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
    }, g.prototype.experienceEventsUpdateExperienceEventRaw = function(e, n) {
        return r(this, void 0, void 0, function() {
            var i, r, a;
            return s(this, function(s) {
                switch (s.label) {
                    case 0:
                        if (null === e.id || void 0 === e.id) throw new t.w("id", "Required parameter requestParameters.id was null or undefined when calling experienceEventsUpdateExperienceEvent.");
                        return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                            path: "/v1/experience-events/{id}".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                            schemaPath: "/v1/experience-events/{id}",
                            method: "PATCH",
                            headers: r,
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
                                    config: o(e.config),
                                    eventCategories: void 0 === e.eventCategories ? void 0 : null === e.eventCategories ? null : e.eventCategories.map(v),
                                    thumbnails: void 0 === e.thumbnails ? void 0 : null === e.thumbnails ? null : e.thumbnails.map(d)
                                }
                            }(e.experienceEventsUpdateExperienceEventRequest)
                        }, n)];
                    case 1:
                        return a = s.sent(), [2, new t.H(a, function(e) {
                            return null == e ? e : {
                                isUpdated: (0, t.u)(e, "isUpdated") ? e.isUpdated : void 0,
                                thumbnailsUpdated: (0, t.u)(e, "thumbnailsUpdated") ? e.thumbnailsUpdated : void 0,
                                categoriesUpdated: (0, t.u)(e, "categoriesUpdated") ? e.categoriesUpdated : void 0
                            }
                        })]
                }
            })
        })
    }, g.prototype.experienceEventsUpdateExperienceEvent = function(e, t) {
        return r(this, void 0, void 0, function() {
            return s(this, function(n) {
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
    };
    var b = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(n, e), n.prototype.gameEventDeleteGameEventRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.eventId || void 0 === e.eventId) throw new t.w("eventId", "Required parameter requestParameters.eventId was null or undefined when calling gameEventDeleteGameEvent.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v3/game-events/{eventId}".replace("{".concat("eventId", "}"), encodeURIComponent(String(e.eventId))),
                                    schemaPath: "/v3/game-events/{eventId}",
                                    method: "DELETE",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.V(a)]
                        }
                    })
                })
            }, n.prototype.gameEventDeleteGameEvent = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.gameEventDeleteGameEventRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }, n.prototype.gameEventGetGameEventRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.eventId || void 0 === e.eventId) throw new t.w("eventId", "Required parameter requestParameters.eventId was null or undefined when calling gameEventGetGameEvent.");
                                return i = {}, void 0 !== e.fields && (i.fields = e.fields), r = {}, [4, this.request({
                                    path: "/v3/game-events/{eventId}".replace("{".concat("eventId", "}"), encodeURIComponent(String(e.eventId))),
                                    schemaPath: "/v3/game-events/{eventId}",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.H(a, function(e) {
                                    return f(e)
                                })]
                        }
                    })
                })
            }, n.prototype.gameEventGetGameEvent = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.gameEventGetGameEventRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.gameEventUpdateGameEventRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.eventId || void 0 === e.eventId) throw new t.w("eventId", "Required parameter requestParameters.eventId was null or undefined when calling gameEventUpdateGameEvent.");
                                return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v3/game-events/{eventId}".replace("{".concat("eventId", "}"), encodeURIComponent(String(e.eventId))),
                                    schemaPath: "/v3/game-events/{eventId}",
                                    method: "PATCH",
                                    headers: r,
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
                                            featuringStatus: e.featuringStatus,
                                            tagline: e.tagline
                                        }
                                    }(e.gameEventUpdateGameEventRequest)
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.H(a, function(e) {
                                    return f(e)
                                })]
                        }
                    })
                })
            }, n.prototype.gameEventUpdateGameEvent = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.gameEventUpdateGameEventRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t._),
        S = (function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            i(n, e), n.prototype.gameEventsCreateGameEventRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling gameEventsCreateGameEvent.");
                                return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v3/universes/{universeId}/game-events".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v3/universes/{universeId}/game-events",
                                    method: "POST",
                                    headers: r,
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
                                            featuringStatus: e.featuringStatus,
                                            tagline: e.tagline
                                        }
                                    }(e.gameEventsCreateGameEventRequest)
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.H(a, function(e) {
                                    return f(e)
                                })]
                        }
                    })
                })
            }, n.prototype.gameEventsCreateGameEvent = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.gameEventsCreateGameEventRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.gameEventsGetGameEventsRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling gameEventsGetGameEvents.");
                                return i = {}, void 0 !== e.pageSize && (i.pageSize = e.pageSize), void 0 !== e.pageToken && (i.pageToken = e.pageToken), void 0 !== e.reverse && (i.reverse = e.reverse), void 0 !== e.startsBefore && (i.startsBefore = e.startsBefore.toISOString()), void 0 !== e.startsAfter && (i.startsAfter = e.startsAfter.toISOString()), void 0 !== e.endsBefore && (i.endsBefore = e.endsBefore.toISOString()), void 0 !== e.endsAfter && (i.endsAfter = e.endsAfter.toISOString()), void 0 !== e.visibility && (i.visibility = e.visibility), void 0 !== e.fields && (i.fields = e.fields), r = {}, [4, this.request({
                                    path: "/v3/universes/{universeId}/game-events".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v3/universes/{universeId}/game-events",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.H(a, function(e) {
                                    return null == e ? e : {
                                        gameEvents: (0, t.u)(e, "gameEvents") ? null === e.gameEvents ? null : e.gameEvents.map(f) : void 0,
                                        nextPageToken: (0, t.u)(e, "nextPageToken") ? e.nextPageToken : void 0,
                                        previousPageToken: (0, t.u)(e, "previousPageToken") ? e.previousPageToken : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.gameEventsGetGameEvents = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.gameEventsGetGameEventsRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }
        }(t._), function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            i(n, e), n.prototype.notificationsUpdateNotificationsPreferencesRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/notifications/preferences",
                                    schemaPath: "/v1/notifications/preferences",
                                    method: "POST",
                                    headers: r,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            isEnabled: e.isEnabled
                                        }
                                    }(e.notificationsUpdateNotificationsPreferencesRequest)
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.H(a)]
                        }
                    })
                })
            }, n.prototype.notificationsUpdateNotificationsPreferences = function() {
                return r(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), s(this, function(n) {
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
                return r(this, void 0, void 0, function() {
                    var n, i, r;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/notifications/modal-history",
                                    schemaPath: "/v1/notifications/modal-history",
                                    method: "POST",
                                    headers: i,
                                    query: n
                                }, e)];
                            case 1:
                                return r = s.sent(), [2, new t.H(r)]
                        }
                    })
                })
            }, n.prototype.notificationsUpdateUserModalHistory = function(e) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(t) {
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
        }(t._), function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            i(n, e), n.prototype.pageDetailsEventDetailsPageRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return i = {}, void 0 !== e.eventId && (i.eventId = e.eventId), void 0 !== e.enabledCapabilities && (i.enabledCapabilities = e.enabledCapabilities), r = {}, [4, this.request({
                                    path: "/v1beta1/event-details-page",
                                    schemaPath: "/v1beta1/event-details-page",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.V(a)]
                        }
                    })
                })
            }, n.prototype.pageDetailsEventDetailsPage = function() {
                return r(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.pageDetailsEventDetailsPageRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }
        }(t._), function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            i(n, e), n.prototype.rsvpGetRsvpCountersRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.virtualEventId || void 0 === e.virtualEventId) throw new t.w("virtualEventId", "Required parameter requestParameters.virtualEventId was null or undefined when calling rsvpGetRsvpCounters.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/virtual-events/{virtualEventId}/rsvps/counters".replace("{".concat("virtualEventId", "}"), encodeURIComponent(String(e.virtualEventId))),
                                    schemaPath: "/v1/virtual-events/{virtualEventId}/rsvps/counters",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.H(a, function(e) {
                                    var n;
                                    return null == e ? e : {
                                        counters: (0, t.u)(e, "counters") ? null == (n = e.counters) ? n : {
                                            none: (0, t.u)(n, "none") ? n.none : void 0,
                                            going: (0, t.u)(n, "going") ? n.going : void 0,
                                            maybeGoing: (0, t.u)(n, "maybeGoing") ? n.maybeGoing : void 0,
                                            notGoing: (0, t.u)(n, "notGoing") ? n.notGoing : void 0
                                        } : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.rsvpGetRsvpCounters = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
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
                return r(this, void 0, void 0, function() {
                    var i, r, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return i = {}, void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.reverse && (i.reverse = e.reverse), void 0 !== e.limit && (i.limit = e.limit), r = {}, [4, this.request({
                                    path: "/v1/my-rsvps",
                                    schemaPath: "/v1/my-rsvps",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.H(a, function(e) {
                                    return y(e)
                                })]
                        }
                    })
                })
            }, n.prototype.rsvpGetUserRsvpedEvents = function() {
                return r(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), s(this, function(n) {
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
                return r(this, void 0, void 0, function() {
                    var i, r, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.virtualEventId || void 0 === e.virtualEventId) throw new t.w("virtualEventId", "Required parameter requestParameters.virtualEventId was null or undefined when calling rsvpGetVirtualEventRsvps.");
                                return i = {}, void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.reverse && (i.reverse = e.reverse), void 0 !== e.limit && (i.limit = e.limit), r = {}, [4, this.request({
                                    path: "/v1/virtual-events/{virtualEventId}/rsvps".replace("{".concat("virtualEventId", "}"), encodeURIComponent(String(e.virtualEventId))),
                                    schemaPath: "/v1/virtual-events/{virtualEventId}/rsvps",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.H(a, function(e) {
                                    return null == e ? e : {
                                        nextPageCursor: (0, t.u)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                        previousPageCursor: (0, t.u)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                        data: (0, t.u)(e, "data") ? null === e.data ? null : e.data.map(m) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.rsvpGetVirtualEventRsvps = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
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
                return r(this, void 0, void 0, function() {
                    var i, r, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.virtualEventId || void 0 === e.virtualEventId) throw new t.w("virtualEventId", "Required parameter requestParameters.virtualEventId was null or undefined when calling rsvpRsvpToEvent.");
                                return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/virtual-events/{virtualEventId}/rsvps".replace("{".concat("virtualEventId", "}"), encodeURIComponent(String(e.virtualEventId))),
                                    schemaPath: "/v1/virtual-events/{virtualEventId}/rsvps",
                                    method: "POST",
                                    headers: r,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            rsvpStatus: e.rsvpStatus
                                        }
                                    }(e.rsvpRsvpToEventRequest)
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.H(a, function(e) {
                                    return m(e)
                                })]
                        }
                    })
                })
            }, n.prototype.rsvpRsvpToEvent = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
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
        }(t._), function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(n, e), n.prototype.universesGetUniverseEventOccurrencesRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling universesGetUniverseEventOccurrences.");
                                return i = {}, void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.limit && (i.limit = e.limit), r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/event-occurrences".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/event-occurrences",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.H(a, function(e) {
                                    return y(e)
                                })]
                        }
                    })
                })
            }, n.prototype.universesGetUniverseEventOccurrences = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
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
                return r(this, void 0, void 0, function() {
                    var i, r, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling universesGetUniverseVirtualEvents.");
                                return i = {}, void 0 !== e.fromUtc && (i.fromUtc = e.fromUtc.toISOString()), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.reverse && (i.reverse = e.reverse), void 0 !== e.limit && (i.limit = e.limit), r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/virtual-events".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/virtual-events",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.H(a, function(e) {
                                    return y(e)
                                })]
                        }
                    })
                })
            }, n.prototype.universesGetUniverseVirtualEvents = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
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
        }(t._)),
        E = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(n, e), n.prototype.universesV2GetUniverseVirtualEventsRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling universesV2GetUniverseVirtualEvents.");
                                return i = {}, void 0 !== e.startsBefore && (i.startsBefore = e.startsBefore.toISOString()), void 0 !== e.startsAfter && (i.startsAfter = e.startsAfter.toISOString()), void 0 !== e.endsBefore && (i.endsBefore = e.endsBefore.toISOString()), void 0 !== e.endsAfter && (i.endsAfter = e.endsAfter.toISOString()), void 0 !== e.visibility && (i.visibility = e.visibility), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.reverse && (i.reverse = e.reverse), void 0 !== e.limit && (i.limit = e.limit), r = {}, [4, this.request({
                                    path: "/v2/universes/{universeId}/experience-events".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/universes/{universeId}/experience-events",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.H(a, function(e) {
                                    return y(e)
                                })]
                        }
                    })
                })
            }, n.prototype.universesV2GetUniverseVirtualEvents = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
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
        }(t._),
        R = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(n, e), n.prototype.virtualEventsCreateVirtualEventRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/virtual-events/create",
                                    schemaPath: "/v1/virtual-events/create",
                                    method: "POST",
                                    headers: r,
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
                                return a = s.sent(), [2, new t.H(a, function(e) {
                                    return w(e)
                                })]
                        }
                    })
                })
            }, n.prototype.virtualEventsCreateVirtualEvent = function() {
                return r(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), s(this, function(n) {
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
                return r(this, void 0, void 0, function() {
                    var i, r, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new t.w("id", "Required parameter requestParameters.id was null or undefined when calling virtualEventsDeleteVirtualEvent.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/virtual-events/{id}".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/virtual-events/{id}",
                                    method: "DELETE",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.H(a, function(e) {
                                    return null == e ? e : {
                                        isDeleted: (0, t.u)(e, "isDeleted") ? e.isDeleted : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.virtualEventsDeleteVirtualEvent = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
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
                return r(this, void 0, void 0, function() {
                    var i, r, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return i = {}, void 0 !== e.groupId && (i.groupId = e.groupId), void 0 !== e.filterBy && (i.filterBy = e.filterBy), void 0 !== e.fromUtc && (i.fromUtc = e.fromUtc.toISOString()), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.reverse && (i.reverse = e.reverse), void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.sortBy && (i.sortBy = e.sortBy), void 0 !== e.sortOrder && (i.sortOrder = e.sortOrder), r = {}, [4, this.request({
                                    path: "/v1/virtual-events/my-events",
                                    schemaPath: "/v1/virtual-events/my-events",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.H(a, function(e) {
                                    return y(e)
                                })]
                        }
                    })
                })
            }, n.prototype.virtualEventsGetCreatorVirtualEvents = function() {
                return r(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), s(this, function(n) {
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
                return r(this, void 0, void 0, function() {
                    var i, r, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new t.w("id", "Required parameter requestParameters.id was null or undefined when calling virtualEventsGetGroupExperienceEvents.");
                                return i = {}, void 0 !== e.endsAfter && (i.endsAfter = e.endsAfter.toISOString()), void 0 !== e.visibility && (i.visibility = e.visibility), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.reverse && (i.reverse = e.reverse), void 0 !== e.limit && (i.limit = e.limit), r = {}, [4, this.request({
                                    path: "/v1/virtual-events/groups/{id}".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/virtual-events/groups/{id}",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.H(a, function(e) {
                                    return y(e)
                                })]
                        }
                    })
                })
            }, n.prototype.virtualEventsGetGroupExperienceEvents = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
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
                return r(this, void 0, void 0, function() {
                    var i, r, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return i = {}, void 0 !== e.hostId && (i.hostId = e.hostId), void 0 !== e.hostType && (i.hostType = e.hostType), r = {}, [4, this.request({
                                    path: "/v1/virtual-events/permissions",
                                    schemaPath: "/v1/virtual-events/permissions",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.H(a, function(e) {
                                    return null == e ? e : {
                                        maxPermissionLevel: (0, t.u)(e, "maxPermissionLevel") ? e.maxPermissionLevel : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.virtualEventsGetPermissionsForHost = function() {
                return r(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), s(this, function(n) {
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
                return r(this, void 0, void 0, function() {
                    var i, r, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new t.w("id", "Required parameter requestParameters.id was null or undefined when calling virtualEventsGetPublicVirtualEvent.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/virtual-events/public/{id}".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/virtual-events/public/{id}",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.H(a, function(e) {
                                    return w(e)
                                })]
                        }
                    })
                })
            }, n.prototype.virtualEventsGetPublicVirtualEvent = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
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
                return r(this, void 0, void 0, function() {
                    var i, r, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new t.w("id", "Required parameter requestParameters.id was null or undefined when calling virtualEventsGetVirtualEvent.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/virtual-events/{id}".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/virtual-events/{id}",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.H(a, function(e) {
                                    return w(e)
                                })]
                        }
                    })
                })
            }, n.prototype.virtualEventsGetVirtualEvent = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
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
                return r(this, void 0, void 0, function() {
                    var i, r, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new t.w("id", "Required parameter requestParameters.id was null or undefined when calling virtualEventsUpdateVirtualEvent.");
                                return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/virtual-events/{id}".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/virtual-events/{id}",
                                    method: "PATCH",
                                    headers: r,
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
                                return a = s.sent(), [2, new t.H(a, function(e) {
                                    return null == e ? e : {
                                        isUpdated: (0, t.u)(e, "isUpdated") ? e.isUpdated : void 0,
                                        thumbnailsUpdated: (0, t.u)(e, "thumbnailsUpdated") ? e.thumbnailsUpdated : void 0,
                                        categoriesUpdated: (0, t.u)(e, "categoriesUpdated") ? e.categoriesUpdated : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.virtualEventsUpdateVirtualEvent = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
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
                return r(this, void 0, void 0, function() {
                    var i, r, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new t.w("id", "Required parameter requestParameters.id was null or undefined when calling virtualEventsUpdateVirtualEventStatus.");
                                return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/virtual-events/{id}/status".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/virtual-events/{id}/status",
                                    method: "PATCH",
                                    headers: r,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            eventStatus: e.eventStatus
                                        }
                                    }(e.virtualEventsUpdateVirtualEventStatusRequest)
                                }, n)];
                            case 1:
                                return a = s.sent(), [2, new t.H(a, function(e) {
                                    return null == e ? e : {
                                        isUpdated: (0, t.u)(e, "isUpdated") ? e.isUpdated : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.virtualEventsUpdateVirtualEventStatus = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
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
        }(t._);
    e.s(["x", 0, {
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
    }, "s", 0, {
        Upcoming: "upcoming",
        Past: "past",
        Drafts: "drafts",
        Cancelled: "cancelled"
    }, "W", 0, {
        CreatedUtc: "createdUtc",
        StartUtc: "startUtc"
    }, "H", 0, {
        Unpublished: "unpublished",
        Active: "active",
        Cancelled: "cancelled",
        Moderated: "moderated"
    }, "G", 0, {
        Private: "private",
        Public: "public",
        Moderated: "moderated"
    }, "$", 0, {
        Enabled: "enabled",
        Disabled: "disabled"
    }, "Y", 0, b, "T", 0, {
        User: "user",
        Group: "group"
    }, "f", 0, {
        Asc: "asc",
        Desc: "desc"
    }, "I", 0, S, "A", 0, E, "P", 0, R])
}, 671376, e => {
    "use strict";
    var t = e.i(307529);
    e.s(["f", () => t.f])
}, 475360, e => {
    "use strict";
    var t = e.i(251622);
    e.s(["f", () => t.U])
}]);

//# debugId=9f664323-ffbf-baf0-86c0-d400a081b4ef
//# sourceMappingURL=0ktrsof48qks9.js.map