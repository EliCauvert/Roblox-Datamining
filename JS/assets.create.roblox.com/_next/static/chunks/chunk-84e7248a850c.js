;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "9c59be0f-8c7d-4235-b4a8-aa05114160de")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 773057, 587694, 37603, 324562, 368851, 269780, 858832, 570006, e => {
    "use strict";
    var t, n, r, s, i, a, o, u, d = e.i(805290),
        c = e.i(415858),
        v = function(e, t) {
            return (v = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
            })(e, t)
        };

    function l(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function n() {
            this.constructor = e
        }
        v(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
    }

    function h(e, t, n, r) {
        return new(n || (n = Promise))(function(s, i) {
            function a(e) {
                try {
                    u(r.next(e))
                } catch (e) {
                    i(e)
                }
            }

            function o(e) {
                try {
                    u(r.throw(e))
                } catch (e) {
                    i(e)
                }
            }

            function u(e) {
                var t;
                e.done ? s(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(a, o)
            }
            u((r = r.apply(e, t || [])).next())
        })
    }

    function p(e, t) {
        var n, r, s, i = {
                label: 0,
                sent: function() {
                    if (1 & s[0]) throw s[1];
                    return s[1]
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
                var d = [o, u];
                if (n) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, d[0] && (i = 0)), i;) try {
                    if (n = 1, r && (s = 2 & d[0] ? r.return : d[0] ? r.throw || ((s = r.return) && s.call(r), 0) : r.next) && !(s = s.call(r, d[1])).done) return s;
                    switch (r = 0, s && (d = [2 & d[0], s.value]), d[0]) {
                        case 0:
                        case 1:
                            s = d;
                            break;
                        case 4:
                            return i.label++, {
                                value: d[1],
                                done: !1
                            };
                        case 5:
                            i.label++, r = d[1], d = [0];
                            continue;
                        case 7:
                            d = i.ops.pop(), i.trys.pop();
                            continue;
                        default:
                            if (!(s = (s = i.trys).length > 0 && s[s.length - 1]) && (6 === d[0] || 2 === d[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === d[0] && (!s || d[1] > s[0] && d[1] < s[3])) {
                                i.label = d[1];
                                break
                            }
                            if (6 === d[0] && i.label < s[1]) {
                                i.label = s[1], s = d;
                                break
                            }
                            if (s && i.label < s[2]) {
                                i.label = s[2], i.ops.push(d);
                                break
                            }
                            s[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    d = t.call(e, i)
                } catch (e) {
                    d = [6, e], r = 0
                } finally {
                    n = s = 0
                }
                if (5 & d[0]) throw d[1];
                return {
                    value: d[0] ? d[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function I(e) {
        var t, n;
        return null == (t = e) ? t : {
            id: (0, c.u)(t, "id") ? t.id : void 0,
            type: (0, c.u)(t, "type") ? t.type : void 0,
            typeId: (0, c.u)(t, "typeId") ? t.typeId : void 0,
            name: (0, c.u)(t, "name") ? t.name : void 0,
            description: (0, c.u)(t, "description") ? t.description : void 0,
            creator: (0, c.u)(t, "creator") ? null == (n = t.creator) ? n : {
                type: (0, c.u)(n, "type") ? n.type : void 0,
                typeId: (0, c.u)(n, "typeId") ? n.typeId : void 0,
                targetId: (0, c.u)(n, "targetId") ? n.targetId : void 0
            } : void 0,
            genres: (0, c.u)(t, "genres") ? t.genres : void 0,
            created: (0, c.u)(t, "created") ? new Date(t.created) : void 0,
            updated: (0, c.u)(t, "updated") ? new Date(t.updated) : void 0,
            enableComments: (0, c.u)(t, "enableComments") ? t.enableComments : void 0,
            isCopyingAllowed: (0, c.u)(t, "isCopyingAllowed") ? t.isCopyingAllowed : void 0,
            isPublicDomainEnabled: (0, c.u)(t, "isPublicDomainEnabled") ? t.isPublicDomainEnabled : void 0,
            locale: (0, c.u)(t, "locale") ? t.locale : void 0,
            localName: (0, c.u)(t, "localName") ? t.localName : void 0,
            localDescription: (0, c.u)(t, "localDescription") ? t.localDescription : void 0,
            moderationStatus: (0, c.u)(t, "moderationStatus") ? t.moderationStatus : void 0,
            isModerated: (0, c.u)(t, "isModerated") ? t.isModerated : void 0,
            reviewStatus: (0, c.u)(t, "reviewStatus") ? t.reviewStatus : void 0,
            isVersioningEnabled: (0, c.u)(t, "isVersioningEnabled") ? t.isVersioningEnabled : void 0,
            isArchivable: (0, c.u)(t, "isArchivable") ? t.isArchivable : void 0,
            canHaveThumbnail: (0, c.u)(t, "canHaveThumbnail") ? t.canHaveThumbnail : void 0
        }
    }

    function m(e) {
        var t;
        return null == (t = e) ? t : {
            assetId: (0, c.u)(t, "assetId") ? t.assetId : void 0,
            assetVersionNumber: (0, c.u)(t, "assetVersionNumber") ? t.assetVersionNumber : void 0,
            creatorType: (0, c.u)(t, "creatorType") ? t.creatorType : void 0,
            creatorTargetId: (0, c.u)(t, "creatorTargetId") ? t.creatorTargetId : void 0,
            creatingUniverseId: (0, c.u)(t, "creatingUniverseId") ? t.creatingUniverseId : void 0,
            created: (0, c.u)(t, "created") ? new Date(t.created) : void 0,
            isEqualToCurrentPublishedVersion: (0, c.u)(t, "isEqualToCurrentPublishedVersion") ? t.isEqualToCurrentPublishedVersion : void 0,
            isPublished: (0, c.u)(t, "isPublished") ? t.isPublished : void 0
        }
    }

    function w(e) {
        var t;
        return null == (t = e) ? t : {
            assetId: (0, c.u)(t, "assetId") ? t.assetId : void 0,
            versionNumber: (0, c.u)(t, "versionNumber") ? t.versionNumber : void 0,
            status: (0, c.u)(t, "status") ? t.status : void 0
        }
    }

    function f(e) {
        if (void 0 !== e) return null === e ? null : {
            name: e.name,
            type: e.type,
            targetId: e.targetId
        }
    }

    function P(e) {
        var t;
        return null == (t = e) ? t : {
            developerProductName: (0, c.u)(t, "developerProductName") ? t.developerProductName : void 0,
            revenueAmount: (0, c.u)(t, "revenueAmount") ? t.revenueAmount : void 0
        }
    }

    function y(e) {
        var t;
        return null == (t = e) ? t : {
            universeId: (0, c.u)(t, "universeId") ? t.universeId : void 0,
            yearDashMonth: (0, c.u)(t, "yearDashMonth") ? t.yearDashMonth : void 0,
            status: (0, c.u)(t, "status") ? t.status : void 0,
            spreadsheetId: (0, c.u)(t, "spreadsheetId") ? t.spreadsheetId : void 0
        }
    }

    function g(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, c.u)(t, "id") ? t.id : void 0,
            name: (0, c.u)(t, "name") ? t.name : void 0,
            description: (0, c.u)(t, "description") ? t.description : void 0,
            isArchived: (0, c.u)(t, "isArchived") ? t.isArchived : void 0,
            rootPlaceId: (0, c.u)(t, "rootPlaceId") ? t.rootPlaceId : void 0,
            isActive: (0, c.u)(t, "isActive") ? t.isActive : void 0,
            privacyType: (0, c.u)(t, "privacyType") ? t.privacyType : void 0,
            creatorType: (0, c.u)(t, "creatorType") ? t.creatorType : void 0,
            creatorTargetId: (0, c.u)(t, "creatorTargetId") ? t.creatorTargetId : void 0,
            creatorName: (0, c.u)(t, "creatorName") ? t.creatorName : void 0,
            created: (0, c.u)(t, "created") ? new Date(t.created) : void 0,
            updated: (0, c.u)(t, "updated") ? new Date(t.updated) : void 0,
            audiences: (0, c.u)(t, "audiences") ? t.audiences : void 0
        }
    }

    function U(e) {
        var t;
        return null == (t = e) ? t : {
            gameTemplateType: (0, c.u)(t, "gameTemplateType") ? t.gameTemplateType : void 0,
            hasTutorials: (0, c.u)(t, "hasTutorials") ? t.hasTutorials : void 0,
            universe: (0, c.u)(t, "universe") ? g(t.universe) : void 0
        }
    }

    function b(e) {
        var t;
        return null == (t = e) ? t : {
            universeId: (0, c.u)(t, "universeId") ? t.universeId : void 0,
            createdOn: (0, c.u)(t, "createdOn") ? new Date(t.createdOn) : void 0,
            createdOnKey: (0, c.u)(t, "createdOnKey") ? t.createdOnKey : void 0,
            creatorType: (0, c.u)(t, "creatorType") ? t.creatorType : void 0,
            creatorId: (0, c.u)(t, "creatorId") ? t.creatorId : void 0,
            creatorName: (0, c.u)(t, "creatorName") ? t.creatorName : void 0,
            expiredOn: (0, c.u)(t, "expiredOn") ? new Date(t.expiredOn) : void 0,
            content: (0, c.u)(t, "content") ? t.content : void 0,
            impressions: (0, c.u)(t, "impressions") ? t.impressions : void 0,
            plays: (0, c.u)(t, "plays") ? t.plays : void 0,
            unfollows: (0, c.u)(t, "unfollows") ? t.unfollows : void 0
        }
    }

    function R(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, c.u)(t, "id") ? t.id : void 0,
            name: (0, c.u)(t, "name") ? t.name : void 0
        }
    }

    function A(e) {
        var t;
        return null == (t = e) ? t : {
            month: (0, c.u)(t, "month") ? t.month : void 0,
            year: (0, c.u)(t, "year") ? t.year : void 0,
            revenueReportStatus: (0, c.u)(t, "RevenueReportStatus") ? t.RevenueReportStatus : void 0
        }
    }

    function q(e) {
        var t;
        return null == (t = e) ? t : {
            status: (0, c.u)(t, "status") ? t.status : void 0,
            platformName: (0, c.u)(t, "platformName") ? t.platformName : void 0,
            crashRatePercentage: (0, c.u)(t, "crashRatePercentage") ? t.crashRatePercentage : void 0
        }
    }

    function T(e) {
        if (void 0 !== e) return null === e ? null : {
            name: e.name,
            description: e.description
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function G(e, t) {
        return null == e ? e : {
            id: (0, c.u)(e, "id") ? e.id : void 0,
            universeId: (0, c.u)(e, "universeId") ? e.universeId : void 0,
            name: (0, c.u)(e, "name") ? e.name : void 0,
            description: (0, c.u)(e, "description") ? e.description : void 0
        }
    }

    function S(e) {
        var t;
        return null == (t = e) ? t : {
            userId: (0, c.u)(t, "userId") ? t.userId : void 0,
            isEligible: (0, c.u)(t, "isEligible") ? t.isEligible : void 0
        }
    }

    function C(e) {
        if (void 0 !== e) return null === e ? null : {
            playtesters: e.playtesters
        }
    }

    function D(e, t) {
        return null == e ? e : {
            playtesters: (0, c.u)(e, "playtesters") ? e.playtesters : void 0
        }
    }

    function M(e) {
        var t;
        return null == (t = e) ? t : {
            assetId: (0, c.u)(t, "assetId") ? t.assetId : void 0,
            hasUserVoted: (0, c.u)(t, "hasUserVoted") ? t.hasUserVoted : void 0,
            canUserVote: (0, c.u)(t, "canUserVote") ? t.canUserVote : void 0,
            shouldShowVotes: (0, c.u)(t, "shouldShowVotes") ? t.shouldShowVotes : void 0,
            upVotes: (0, c.u)(t, "upVotes") ? t.upVotes : void 0,
            downVotes: (0, c.u)(t, "downVotes") ? t.downVotes : void 0,
            reasonForNotAbleToVote: (0, c.u)(t, "reasonForNotAbleToVote") ? t.reasonForNotAbleToVote : void 0
        }
    }

    function E(e) {
        var t;
        return null == (t = e) ? t : {
            assetId: (0, c.u)(t, "assetId") ? t.assetId : void 0,
            isEndorsed: (0, c.u)(t, "isEndorsed") ? t.isEndorsed : void 0
        }
    }

    function H(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, c.u)(t, "id") ? t.id : void 0,
            assetTypeId: (0, c.u)(t, "assetTypeId") ? t.assetTypeId : void 0,
            videoAssetId: (0, c.u)(t, "videoAssetId") ? t.videoAssetId : void 0,
            assetType: (0, c.u)(t, "assetType") ? t.assetType : void 0,
            imageId: (0, c.u)(t, "imageId") ? t.imageId : void 0,
            videoHash: (0, c.u)(t, "videoHash") ? t.videoHash : void 0,
            videoTitle: (0, c.u)(t, "videoTitle") ? t.videoTitle : void 0,
            altText: (0, c.u)(t, "altText") ? t.altText : void 0
        }
    }

    function N(e) {
        var t;
        return null == (t = e) ? t : {
            type: (0, c.u)(t, "type") ? t.type : void 0,
            data: (0, c.u)(t, "data") ? t.data : void 0
        }
    }

    function L(e) {
        if (void 0 !== e) return null === e ? null : {
            userId: e.userId
        }
    }

    function V(e) {
        var t;
        return null == (t = e) ? t : {
            universeId: (0, c.u)(t, "universeId") ? t.universeId : void 0,
            canManage: (0, c.u)(t, "canManage") ? t.canManage : void 0,
            canCloudEdit: (0, c.u)(t, "canCloudEdit") ? t.canCloudEdit : void 0
        }
    }

    function x(e, t) {
        return null == e ? e : {
            canManage: (0, c.u)(e, "canManage") ? e.canManage : void 0,
            canCloudEdit: (0, c.u)(e, "canCloudEdit") ? e.canCloudEdit : void 0
        }
    }

    function F(e, t) {
        return null == e ? e : {
            allowPrivateServers: (0, c.u)(e, "allowPrivateServers") ? e.allowPrivateServers : void 0,
            privateServerPrice: (0, c.u)(e, "privateServerPrice") ? e.privateServerPrice : void 0,
            isMeshTextureApiAccessAllowed: (0, c.u)(e, "isMeshTextureApiAccessAllowed") ? e.isMeshTextureApiAccessAllowed : void 0,
            id: (0, c.u)(e, "id") ? e.id : void 0,
            name: (0, c.u)(e, "name") ? e.name : void 0,
            promotionalText: (0, c.u)(e, "promotionalText") ? e.promotionalText : void 0,
            universeAvatarType: (0, c.u)(e, "universeAvatarType") ? e.universeAvatarType : void 0,
            universeScaleType: (0, c.u)(e, "universeScaleType") ? e.universeScaleType : void 0,
            universeAnimationType: (0, c.u)(e, "universeAnimationType") ? e.universeAnimationType : void 0,
            universeCollisionType: (0, c.u)(e, "universeCollisionType") ? e.universeCollisionType : void 0,
            universeBodyType: (0, c.u)(e, "universeBodyType") ? e.universeBodyType : void 0,
            universeJointPositioningType: (0, c.u)(e, "universeJointPositioningType") ? e.universeJointPositioningType : void 0,
            isArchived: (0, c.u)(e, "isArchived") ? e.isArchived : void 0,
            isFriendsOnly: (0, c.u)(e, "isFriendsOnly") ? e.isFriendsOnly : void 0,
            genre: (0, c.u)(e, "genre") ? e.genre : void 0,
            playableDevices: (0, c.u)(e, "playableDevices") ? e.playableDevices : void 0,
            isForSale: (0, c.u)(e, "isForSale") ? e.isForSale : void 0,
            price: (0, c.u)(e, "price") ? e.price : void 0,
            isStudioAccessToApisAllowed: (0, c.u)(e, "isStudioAccessToApisAllowed") ? e.isStudioAccessToApisAllowed : void 0,
            privacyType: (0, c.u)(e, "privacyType") ? e.privacyType : void 0,
            isForSaleInFiat: (0, c.u)(e, "isForSaleInFiat") ? e.isForSaleInFiat : void 0,
            fiatBasePriceId: (0, c.u)(e, "fiatBasePriceId") ? e.fiatBasePriceId : void 0,
            fiatModerationStatus: (0, c.u)(e, "fiatModerationStatus") ? e.fiatModerationStatus : void 0,
            audiences: (0, c.u)(e, "audiences") ? e.audiences : void 0,
            demoModeEnabled: (0, c.u)(e, "demoModeEnabled") ? e.demoModeEnabled : void 0,
            demoModeChangeableAfter: (0, c.u)(e, "demoModeChangeableAfter") ? new Date(e.demoModeChangeableAfter) : void 0
        }
    }

    function O(e) {
        if (void 0 !== e) return null === e ? null : {
            isEnabled: e.isEnabled
        }
    }

    function k(e) {
        var t;
        return null == (t = e) ? t : {
            buildersClubMembershipType: (0, c.u)(t, "buildersClubMembershipType") ? t.buildersClubMembershipType : void 0,
            userId: (0, c.u)(t, "userId") ? t.userId : void 0,
            username: (0, c.u)(t, "username") ? t.username : void 0,
            displayName: (0, c.u)(t, "displayName") ? t.displayName : void 0
        }
    }

    function _(e) {
        if (void 0 !== e) return null === e ? null : {
            type: e.type,
            url: e.url,
            title: e.title
        }
    }

    function B(e) {
        var t;
        return null == (t = e) ? t : {
            userId: (0, c.u)(t, "UserId") ? t.UserId : void 0,
            universeId: (0, c.u)(t, "UniverseId") ? t.UniverseId : void 0,
            expires: (0, c.u)(t, "Expires") ? t.Expires : void 0,
            rootPlaceId: (0, c.u)(t, "RootPlaceId") ? t.RootPlaceId : void 0,
            gameName: (0, c.u)(t, "GameName") ? t.GameName : void 0
        }
    }

    function j(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, c.u)(t, "id") ? t.id : void 0,
            name: (0, c.u)(t, "name") ? t.name : void 0,
            description: (0, c.u)(t, "description") ? t.description : void 0,
            commentsEnabled: (0, c.u)(t, "commentsEnabled") ? t.commentsEnabled : void 0,
            versionId: (0, c.u)(t, "versionId") ? t.versionId : void 0,
            created: (0, c.u)(t, "created") ? new Date(t.created) : void 0,
            updated: (0, c.u)(t, "updated") ? new Date(t.updated) : void 0
        }
    }

    function Y(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, c.u)(t, "id") ? t.id : void 0,
            name: (0, c.u)(t, "name") ? t.name : void 0,
            displayName: (0, c.u)(t, "displayName") ? t.displayName : void 0
        }
    }

    function z(e, t) {
        return null == e ? e : {
            data: (0, c.u)(e, "data") ? e.data.map(R) : void 0
        }
    }

    function J(e, t) {
        return null == e ? e : {
            previousPageCursor: (0, c.u)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
            nextPageCursor: (0, c.u)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
            data: (0, c.u)(e, "data") ? e.data.map(m) : void 0
        }
    }

    function K(e, t) {
        return null == e ? e : {
            previousPageCursor: (0, c.u)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
            nextPageCursor: (0, c.u)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
            data: (0, c.u)(e, "data") ? e.data.map(g) : void 0
        }
    }
    var W = c._;

    function $() {
        return null !== W && W.apply(this, arguments) || this
    }
    l($, W), $.prototype.v1UniversesUniverseIdAliasesNameDeleteRaw = function(e, t) {
        return h(this, void 0, void 0, function() {
            var n, r, s;
            return p(this, function(i) {
                switch (i.label) {
                    case 0:
                        if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdAliasesNameDelete.");
                        if (null === e.name || void 0 === e.name) throw new c.w("name", "Required parameter requestParameters.name was null or undefined when calling v1UniversesUniverseIdAliasesNameDelete.");
                        return n = {}, r = {}, [4, this.request({
                            path: "/v1/universes/{universeId}/aliases/{name}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("name", "}"), encodeURIComponent(String(e.name))),
                            schemaPath: "/v1/universes/{universeId}/aliases/{name}",
                            method: "DELETE",
                            headers: r,
                            query: n
                        }, t)];
                    case 1:
                        return s = i.sent(), [2, new c.H(s)]
                }
            })
        })
    }, $.prototype.v1UniversesUniverseIdAliasesNameDelete = function(e, t) {
        return h(this, void 0, void 0, function() {
            return p(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.v1UniversesUniverseIdAliasesNameDeleteRaw(e, t)];
                    case 1:
                        return [4, n.sent().value()];
                    case 2:
                        return [2, n.sent()]
                }
            })
        })
    }, $.prototype.v1UniversesUniverseIdAliasesNamePatchRaw = function(e, t) {
        return h(this, void 0, void 0, function() {
            var n, r, s;
            return p(this, function(i) {
                switch (i.label) {
                    case 0:
                        if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdAliasesNamePatch.");
                        if (null === e.name || void 0 === e.name) throw new c.w("name", "Required parameter requestParameters.name was null or undefined when calling v1UniversesUniverseIdAliasesNamePatch.");
                        if (null === e.request || void 0 === e.request) throw new c.w("request", "Required parameter requestParameters.request was null or undefined when calling v1UniversesUniverseIdAliasesNamePatch.");
                        return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                            path: "/v1/universes/{universeId}/aliases/{name}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("name", "}"), encodeURIComponent(String(e.name))),
                            schemaPath: "/v1/universes/{universeId}/aliases/{name}",
                            method: "PATCH",
                            headers: r,
                            query: n,
                            body: f(e.request)
                        }, t)];
                    case 1:
                        return s = i.sent(), [2, new c.H(s)]
                }
            })
        })
    }, $.prototype.v1UniversesUniverseIdAliasesNamePatch = function(e, t) {
        return h(this, void 0, void 0, function() {
            return p(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.v1UniversesUniverseIdAliasesNamePatchRaw(e, t)];
                    case 1:
                        return [4, n.sent().value()];
                    case 2:
                        return [2, n.sent()]
                }
            })
        })
    }, $.prototype.v1UniversesUniverseIdAliasesPostRaw = function(e, t) {
        return h(this, void 0, void 0, function() {
            var n, r, s;
            return p(this, function(i) {
                switch (i.label) {
                    case 0:
                        if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdAliasesPost.");
                        if (null === e.request || void 0 === e.request) throw new c.w("request", "Required parameter requestParameters.request was null or undefined when calling v1UniversesUniverseIdAliasesPost.");
                        return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                            path: "/v1/universes/{universeId}/aliases".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                            schemaPath: "/v1/universes/{universeId}/aliases",
                            method: "POST",
                            headers: r,
                            query: n,
                            body: f(e.request)
                        }, t)];
                    case 1:
                        return s = i.sent(), [2, new c.H(s)]
                }
            })
        })
    }, $.prototype.v1UniversesUniverseIdAliasesPost = function(e, t) {
        return h(this, void 0, void 0, function() {
            return p(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.v1UniversesUniverseIdAliasesPostRaw(e, t)];
                    case 1:
                        return [4, n.sent().value()];
                    case 2:
                        return [2, n.sent()]
                }
            })
        })
    };
    var Q = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return l(t, e), t.prototype.v1AssetsAssetIdArchivePostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new c.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdArchivePost.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}/archive".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/archive",
                                    method: "POST",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s)]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdArchivePost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1AssetsAssetIdArchivePostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdLatestSavedVersionGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new c.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdLatestSavedVersionGet.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}/latest-saved-version".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/latest-saved-version",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return m(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdLatestSavedVersionGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1AssetsAssetIdLatestSavedVersionGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdPatchRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new c.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdPatch.");
                                if (null === e.request || void 0 === e.request) throw new c.w("request", "Required parameter requestParameters.request was null or undefined when calling v1AssetsAssetIdPatch.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/assets/{assetId}".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}",
                                    method: "PATCH",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            name: e.name,
                                            description: e.description,
                                            genres: e.genres,
                                            enableComments: e.enableComments,
                                            isCopyingAllowed: e.isCopyingAllowed,
                                            locale: e.locale,
                                            localName: e.localName,
                                            localDescription: e.localDescription
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s)]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdPatch = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1AssetsAssetIdPatchRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdPublishedVersionsGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new c.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdPublishedVersionsGet.");
                                return n = {}, void 0 !== e.sortOrder && (n.sortOrder = e.sortOrder), void 0 !== e.limit && (n.limit = e.limit), void 0 !== e.cursor && (n.cursor = e.cursor), r = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}/published-versions".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/published-versions",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return J(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdPublishedVersionsGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1AssetsAssetIdPublishedVersionsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdRestorePostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new c.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdRestorePost.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}/restore".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/restore",
                                    method: "POST",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s)]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdRestorePost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1AssetsAssetIdRestorePostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdRevertVersionPostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new c.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdRevertVersionPost.");
                                if (null === e.assetVersionNumber || void 0 === e.assetVersionNumber) throw new c.w("assetVersionNumber", "Required parameter requestParameters.assetVersionNumber was null or undefined when calling v1AssetsAssetIdRevertVersionPost.");
                                return n = {}, void 0 !== e.assetVersionNumber && (n.assetVersionNumber = e.assetVersionNumber), r = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}/revert-version".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/revert-version",
                                    method: "POST",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s)]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdRevertVersionPost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1AssetsAssetIdRevertVersionPostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdSavedVersionsGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new c.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdSavedVersionsGet.");
                                return n = {}, void 0 !== e.limit && (n.limit = e.limit), void 0 !== e.cursor && (n.cursor = e.cursor), void 0 !== e.sortOrder && (n.sortOrder = e.sortOrder), r = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}/saved-versions".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/saved-versions",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return J(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdSavedVersionsGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1AssetsAssetIdSavedVersionsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdVersionsGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new c.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdVersionsGet.");
                                return n = {}, void 0 !== e.page && (n.page = e.page), r = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (r["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                    path: "/v1/assets/{assetId}/versions".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/versions",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s)]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdVersionsGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1AssetsAssetIdVersionsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdVersionsVersionNumberGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new c.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdVersionsVersionNumberGet.");
                                if (null === e.versionNumber || void 0 === e.versionNumber) throw new c.w("versionNumber", "Required parameter requestParameters.versionNumber was null or undefined when calling v1AssetsAssetIdVersionsVersionNumberGet.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}/versions/{versionNumber}".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))).replace("{".concat("versionNumber", "}"), encodeURIComponent(String(e.versionNumber))),
                                    schemaPath: "/v1/assets/{assetId}/versions/{versionNumber}",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return m(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdVersionsVersionNumberGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1AssetsAssetIdVersionsVersionNumberGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1AssetsEndorsedGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetIds || void 0 === e.assetIds) throw new c.w("assetIds", "Required parameter requestParameters.assetIds was null or undefined when calling v1AssetsEndorsedGet.");
                                return n = {}, e.assetIds && (n.assetIds = e.assetIds.join(c.G.csv)), r = {}, [4, this.request({
                                    path: "/v1/assets/endorsed",
                                    schemaPath: "/v1/assets/endorsed",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return null == e ? e : {
                                        data: (0, c.u)(e, "data") ? e.data.map(E) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1AssetsEndorsedGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1AssetsEndorsedGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1AssetsGenresGetRaw = function(e) {
                return h(this, void 0, void 0, function() {
                    var t, n, r;
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return t = {}, n = {}, [4, this.request({
                                    path: "/v1/assets/genres",
                                    schemaPath: "/v1/assets/genres",
                                    method: "GET",
                                    headers: n,
                                    query: t
                                }, e)];
                            case 1:
                                return r = s.sent(), [2, new c.H(r, function(e) {
                                    return null == e ? e : {
                                        data: (0, c.u)(e, "data") ? e.data : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1AssetsGenresGet = function(e) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1AssetsGenresGetRaw(e)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.v1AssetsGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetIds || void 0 === e.assetIds) throw new c.w("assetIds", "Required parameter requestParameters.assetIds was null or undefined when calling v1AssetsGet.");
                                return n = {}, e.assetIds && (n.assetIds = e.assetIds.join(c.G.csv)), r = {}, [4, this.request({
                                    path: "/v1/assets",
                                    schemaPath: "/v1/assets",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return null == e ? e : {
                                        data: (0, c.u)(e, "data") ? e.data.map(I) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1AssetsGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
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
            }, t.prototype.v1AssetsLatestVersionsPostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.request || void 0 === e.request) throw new c.w("request", "Required parameter requestParameters.request was null or undefined when calling v1AssetsLatestVersionsPost.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/assets/latest-versions",
                                    schemaPath: "/v1/assets/latest-versions",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            assetIds: e.assetIds,
                                            versionStatus: e.versionStatus
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return null == e ? e : {
                                        results: (0, c.u)(e, "results") ? e.results.map(w) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1AssetsLatestVersionsPost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1AssetsLatestVersionsPostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1AssetsVotingGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetIds || void 0 === e.assetIds) throw new c.w("assetIds", "Required parameter requestParameters.assetIds was null or undefined when calling v1AssetsVotingGet.");
                                return n = {}, e.assetIds && (n.assetIds = e.assetIds.join(c.G.csv)), r = {}, [4, this.request({
                                    path: "/v1/assets/voting",
                                    schemaPath: "/v1/assets/voting",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return null == e ? e : {
                                        data: (0, c.u)(e, "data") ? e.data.map(M) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1AssetsVotingGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1AssetsVotingGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t
        }(c._),
        X = (function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            l(t, e), t.prototype.v1GametemplatesGetRaw = function(e) {
                return h(this, void 0, void 0, function() {
                    var t, n, r;
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return t = {}, n = {}, [4, this.request({
                                    path: "/v1/gametemplates",
                                    schemaPath: "/v1/gametemplates",
                                    method: "GET",
                                    headers: n,
                                    query: t
                                }, e)];
                            case 1:
                                return r = s.sent(), [2, new c.H(r, function(e) {
                                    return null == e ? e : {
                                        data: (0, c.u)(e, "data") ? e.data.map(U) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1GametemplatesGet = function(e) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GametemplatesGetRaw(e)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }
        }(c._), function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            l(t, e), t.prototype.v1GameUpdateNotificationsFilterPostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.gameUpdateText || void 0 === e.gameUpdateText) throw new c.w("gameUpdateText", "Required parameter requestParameters.gameUpdateText was null or undefined when calling v1GameUpdateNotificationsFilterPost.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/gameUpdateNotifications/filter",
                                    schemaPath: "/v1/gameUpdateNotifications/filter",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: e.gameUpdateText
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return null == e ? e : {
                                        filteredGameUpdateText: (0, c.u)(e, "filteredGameUpdateText") ? e.filteredGameUpdateText : void 0,
                                        isFiltered: (0, c.u)(e, "isFiltered") ? e.isFiltered : void 0,
                                        moderationLevel: (0, c.u)(e, "moderationLevel") ? e.moderationLevel : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1GameUpdateNotificationsFilterPost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1GameUpdateNotificationsFilterPostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1GameUpdateNotificationsUniverseIdGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1GameUpdateNotificationsUniverseIdGet.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/gameUpdateNotifications/{universeId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/gameUpdateNotifications/{universeId}",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return e.map(b)
                                })]
                        }
                    })
                })
            }, t.prototype.v1GameUpdateNotificationsUniverseIdGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1GameUpdateNotificationsUniverseIdGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1GameUpdateNotificationsUniverseIdPostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1GameUpdateNotificationsUniverseIdPost.");
                                if (null === e.gameUpdateText || void 0 === e.gameUpdateText) throw new c.w("gameUpdateText", "Required parameter requestParameters.gameUpdateText was null or undefined when calling v1GameUpdateNotificationsUniverseIdPost.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/gameUpdateNotifications/{universeId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/gameUpdateNotifications/{universeId}",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: e.gameUpdateText
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return b(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1GameUpdateNotificationsUniverseIdPost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1GameUpdateNotificationsUniverseIdPostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }
        }(c._), function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return l(t, e), t.prototype.v1GroupsGroupIdUniversesGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new c.w("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdUniversesGet.");
                                return n = {}, void 0 !== e.isArchived && (n.isArchived = e.isArchived), void 0 !== e.sortOrder && (n.sortOrder = e.sortOrder), void 0 !== e.limit && (n.limit = e.limit), void 0 !== e.cursor && (n.cursor = e.cursor), r = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/universes".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/universes",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return K(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1GroupsGroupIdUniversesGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdUniversesGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t
        }(c._)),
        Z = {
            Asc: "Asc",
            Desc: "Desc"
        },
        ee = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return l(t, e), t.prototype.v1UniversesUniverseIdIconGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdIconGet.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/icon".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/icon",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return null == e ? e : {
                                        imageId: (0, c.u)(e, "imageId") ? e.imageId : void 0,
                                        isApproved: (0, c.u)(e, "isApproved") ? e.isApproved : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdIconGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdIconGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdIconPostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdIconPost.");
                                if (null === e.request || void 0 === e.request) throw new c.w("request", "Required parameter requestParameters.request was null or undefined when calling v1UniversesUniverseIdIconPost.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/universes/{universeId}/icon".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/icon",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            iconType: e.iconType
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s)]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdIconPost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdIconPostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t
        }(c._),
        et = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return l(t, e), t.prototype.v1PlacesPlaceIdCompatibilitiesGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new c.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling v1PlacesPlaceIdCompatibilitiesGet.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/places/{placeId}/compatibilities".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}/compatibilities",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return null == e ? e : {
                                        compatibilities: (0, c.u)(e, "Compatibilities") ? e.Compatibilities.map(q) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1PlacesPlaceIdCompatibilitiesGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1PlacesPlaceIdCompatibilitiesGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1PlacesPlaceIdMediaGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new c.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling v1PlacesPlaceIdMediaGet.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/places/{placeId}/media".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}/media",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return null == e ? e : {
                                        data: (0, c.u)(e, "data") ? e.data.map(H) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1PlacesPlaceIdMediaGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1PlacesPlaceIdMediaGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1PlacesPlaceIdPatchRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new c.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling v1PlacesPlaceIdPatch.");
                                if (null === e._configuration || void 0 === e._configuration) throw new c.w("_configuration", "Required parameter requestParameters._configuration was null or undefined when calling v1PlacesPlaceIdPatch.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/places/{placeId}".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}",
                                    method: "PATCH",
                                    headers: r,
                                    query: n,
                                    body: T(e._configuration)
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return G(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1PlacesPlaceIdPatch = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1PlacesPlaceIdPatchRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1PlacesPlaceIdPostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new c.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling v1PlacesPlaceIdPost.");
                                if (null === e._configuration || void 0 === e._configuration) throw new c.w("_configuration", "Required parameter requestParameters._configuration was null or undefined when calling v1PlacesPlaceIdPost.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/places/{placeId}".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: T(e._configuration)
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return G(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1PlacesPlaceIdPost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1PlacesPlaceIdPostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t
        }(c._),
        en = (function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            l(t, e), t.prototype.v1PluginsGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.pluginIds || void 0 === e.pluginIds) throw new c.w("pluginIds", "Required parameter requestParameters.pluginIds was null or undefined when calling v1PluginsGet.");
                                return n = {}, e.pluginIds && (n.pluginIds = e.pluginIds.join(c.G.csv)), r = {}, [4, this.request({
                                    path: "/v1/plugins",
                                    schemaPath: "/v1/plugins",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return null == e ? e : {
                                        data: (0, c.u)(e, "data") ? e.data.map(j) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1PluginsGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1PluginsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1PluginsPluginIdIncrementInstallCountPostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.pluginId || void 0 === e.pluginId) throw new c.w("pluginId", "Required parameter requestParameters.pluginId was null or undefined when calling v1PluginsPluginIdIncrementInstallCountPost.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/plugins/{pluginId}/increment-install-count".replace("{".concat("pluginId", "}"), encodeURIComponent(String(e.pluginId))),
                                    schemaPath: "/v1/plugins/{pluginId}/increment-install-count",
                                    method: "POST",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s)]
                        }
                    })
                })
            }, t.prototype.v1PluginsPluginIdIncrementInstallCountPost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1PluginsPluginIdIncrementInstallCountPostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1PluginsPluginIdInstallCountGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.pluginId || void 0 === e.pluginId) throw new c.w("pluginId", "Required parameter requestParameters.pluginId was null or undefined when calling v1PluginsPluginIdInstallCountGet.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/plugins/{pluginId}/install-count".replace("{".concat("pluginId", "}"), encodeURIComponent(String(e.pluginId))),
                                    schemaPath: "/v1/plugins/{pluginId}/install-count",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return null == e ? e : {
                                        installCount: (0, c.u)(e, "installCount") ? e.installCount : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1PluginsPluginIdInstallCountGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1PluginsPluginIdInstallCountGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1PluginsPluginIdPatchRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.pluginId || void 0 === e.pluginId) throw new c.w("pluginId", "Required parameter requestParameters.pluginId was null or undefined when calling v1PluginsPluginIdPatch.");
                                if (null === e.request || void 0 === e.request) throw new c.w("request", "Required parameter requestParameters.request was null or undefined when calling v1PluginsPluginIdPatch.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/plugins/{pluginId}".replace("{".concat("pluginId", "}"), encodeURIComponent(String(e.pluginId))),
                                    schemaPath: "/v1/plugins/{pluginId}",
                                    method: "PATCH",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            name: e.name,
                                            description: e.description,
                                            commentsEnabled: e.commentsEnabled
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s)]
                        }
                    })
                })
            }, t.prototype.v1PluginsPluginIdPatch = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1PluginsPluginIdPatchRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }
        }(c._), function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return l(t, e), t.prototype.v1SearchUniversesGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return n = {}, void 0 !== e.q && (n.q = e.q), e.sort && (n.sort = e.sort.join(c.G.csv)), void 0 !== e.sortOrder && (n.sortOrder = e.sortOrder), void 0 !== e.limit && (n.limit = e.limit), void 0 !== e.cursor && (n.cursor = e.cursor), r = {}, [4, this.request({
                                    path: "/v1/search/universes",
                                    schemaPath: "/v1/search/universes",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return K(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1SearchUniversesGet = function() {
                return h(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1SearchUniversesGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t
        }(c._)),
        er = {
            Asc: "Asc",
            Desc: "Desc"
        },
        es = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return l(t, e), t.prototype.v1UniversesUniverseIdSocialLinksMetadataGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdSocialLinksMetadataGet.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/social-links/metadata".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/social-links/metadata",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return null == e ? e : {
                                        amazonStoreLinksEnabledForUser: (0, c.u)(e, "AmazonStoreLinksEnabledForUser") ? e.AmazonStoreLinksEnabledForUser : void 0,
                                        guildedLinksEnabledForUser: (0, c.u)(e, "GuildedLinksEnabledForUser") ? e.GuildedLinksEnabledForUser : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdSocialLinksMetadataGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdSocialLinksMetadataGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdSocialLinksPostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdSocialLinksPost.");
                                if (null === e.request || void 0 === e.request) throw new c.w("request", "Required parameter requestParameters.request was null or undefined when calling v1UniversesUniverseIdSocialLinksPost.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/universes/{universeId}/social-links".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/social-links",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: _(e.request)
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return null == e ? e : {
                                        id: (0, c.u)(e, "Id") ? e.Id : void 0,
                                        type: (0, c.u)(e, "Type") ? e.Type : void 0,
                                        url: (0, c.u)(e, "Url") ? e.Url : void 0,
                                        title: (0, c.u)(e, "Title") ? e.Title : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdSocialLinksPost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdSocialLinksPostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdSocialLinksSocialLinkIdDeleteRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdSocialLinksSocialLinkIdDelete.");
                                if (null === e.socialLinkId || void 0 === e.socialLinkId) throw new c.w("socialLinkId", "Required parameter requestParameters.socialLinkId was null or undefined when calling v1UniversesUniverseIdSocialLinksSocialLinkIdDelete.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/social-links/{socialLinkId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("socialLinkId", "}"), encodeURIComponent(String(e.socialLinkId))),
                                    schemaPath: "/v1/universes/{universeId}/social-links/{socialLinkId}",
                                    method: "DELETE",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s)]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdSocialLinksSocialLinkIdDelete = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdSocialLinksSocialLinkIdDeleteRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdSocialLinksSocialLinkIdPatchRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdSocialLinksSocialLinkIdPatch.");
                                if (null === e.socialLinkId || void 0 === e.socialLinkId) throw new c.w("socialLinkId", "Required parameter requestParameters.socialLinkId was null or undefined when calling v1UniversesUniverseIdSocialLinksSocialLinkIdPatch.");
                                if (null === e.request || void 0 === e.request) throw new c.w("request", "Required parameter requestParameters.request was null or undefined when calling v1UniversesUniverseIdSocialLinksSocialLinkIdPatch.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/universes/{universeId}/social-links/{socialLinkId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("socialLinkId", "}"), encodeURIComponent(String(e.socialLinkId))),
                                    schemaPath: "/v1/universes/{universeId}/social-links/{socialLinkId}",
                                    method: "PATCH",
                                    headers: r,
                                    query: n,
                                    body: _(e.request)
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s)]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdSocialLinksSocialLinkIdPatch = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdSocialLinksSocialLinkIdPatchRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t
        }(c._),
        ei = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return l(t, e), t.prototype.v1PlacesPlaceIdStatsDeveloperProductAggregationGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new c.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling v1PlacesPlaceIdStatsDeveloperProductAggregationGet.");
                                if (null === e.timeFrame || void 0 === e.timeFrame) throw new c.w("timeFrame", "Required parameter requestParameters.timeFrame was null or undefined when calling v1PlacesPlaceIdStatsDeveloperProductAggregationGet.");
                                return n = {}, void 0 !== e.timeFrame && (n.timeFrame = e.timeFrame), r = {}, [4, this.request({
                                    path: "/v1/places/{placeId}/stats/developer-product-aggregation".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}/stats/developer-product-aggregation",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    var t;
                                    return null == e ? e : {
                                        allDevicesDeveloperProductRevenue: (0, c.u)(e, "allDevicesDeveloperProductRevenue") ? e.allDevicesDeveloperProductRevenue.map(P) : void 0,
                                        developerProductRevenueByDevice: (0, c.u)(e, "developerProductRevenueByDevice") ? null == (t = e.developerProductRevenueByDevice) ? t : {
                                            computer: (0, c.u)(t, "Computer") ? t.Computer.map(P) : void 0,
                                            phone: (0, c.u)(t, "Phone") ? t.Phone.map(P) : void 0,
                                            tablet: (0, c.u)(t, "Tablet") ? t.Tablet.map(P) : void 0,
                                            console: (0, c.u)(t, "Console") ? t.Console.map(P) : void 0
                                        } : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1PlacesPlaceIdStatsDeveloperProductAggregationGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1PlacesPlaceIdStatsDeveloperProductAggregationGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1PlacesPlaceIdStatsIsAgeDataAvailableGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new c.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling v1PlacesPlaceIdStatsIsAgeDataAvailableGet.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/places/{placeId}/stats/is-age-data-available".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}/stats/is-age-data-available",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return null == e ? e : {
                                        isAgeDataAvailable: (0, c.u)(e, "isAgeDataAvailable") ? e.isAgeDataAvailable : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1PlacesPlaceIdStatsIsAgeDataAvailableGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1PlacesPlaceIdStatsIsAgeDataAvailableGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1PlacesPlaceIdStatsTypeGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new c.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling v1PlacesPlaceIdStatsTypeGet.");
                                if (null === e.type || void 0 === e.type) throw new c.w("type", "Required parameter requestParameters.type was null or undefined when calling v1PlacesPlaceIdStatsTypeGet.");
                                if (null === e.granularity || void 0 === e.granularity) throw new c.w("granularity", "Required parameter requestParameters.granularity was null or undefined when calling v1PlacesPlaceIdStatsTypeGet.");
                                return n = {}, void 0 !== e.granularity && (n.granularity = e.granularity), void 0 !== e.divisionType && (n.divisionType = e.divisionType), void 0 !== e.startTime && (n.startTime = e.startTime), void 0 !== e.endTime && (n.endTime = e.endTime), r = {}, [4, this.request({
                                    path: "/v1/places/{placeId}/stats/{type}".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))).replace("{".concat("type", "}"), encodeURIComponent(String(e.type))),
                                    schemaPath: "/v1/places/{placeId}/stats/{type}",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return null == e ? e : {
                                        placeId: (0, c.u)(e, "placeId") ? e.placeId : void 0,
                                        dataType: (0, c.u)(e, "dataType") ? e.dataType : void 0,
                                        dataGranularity: (0, c.u)(e, "dataGranularity") ? e.dataGranularity : void 0,
                                        startTime: (0, c.u)(e, "startTime") ? new Date(e.startTime) : void 0,
                                        endTime: (0, c.u)(e, "endTime") ? new Date(e.endTime) : void 0,
                                        data: (0, c.u)(e, "data") ? (0, c.A)(e.data, N) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1PlacesPlaceIdStatsTypeGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1PlacesPlaceIdStatsTypeGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1PlacesPlaceIdStatsTypeLegacyFlotGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new c.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling v1PlacesPlaceIdStatsTypeLegacyFlotGet.");
                                if (null === e.type || void 0 === e.type) throw new c.w("type", "Required parameter requestParameters.type was null or undefined when calling v1PlacesPlaceIdStatsTypeLegacyFlotGet.");
                                if (null === e.timeFrame || void 0 === e.timeFrame) throw new c.w("timeFrame", "Required parameter requestParameters.timeFrame was null or undefined when calling v1PlacesPlaceIdStatsTypeLegacyFlotGet.");
                                return n = {}, void 0 !== e.timeFrame && (n.timeFrame = e.timeFrame), void 0 !== e.divisionType && (n.divisionType = e.divisionType), void 0 !== e.startTime && (n.startTime = e.startTime), void 0 !== e.endTime && (n.endTime = e.endTime), r = {}, [4, this.request({
                                    path: "/v1/places/{placeId}/stats/{type}/legacy/flot".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))).replace("{".concat("type", "}"), encodeURIComponent(String(e.type))),
                                    schemaPath: "/v1/places/{placeId}/stats/{type}/legacy/flot",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s)]
                        }
                    })
                })
            }, t.prototype.v1PlacesPlaceIdStatsTypeLegacyFlotGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1PlacesPlaceIdStatsTypeLegacyFlotGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1StatsCreatorDashboardMetadataGetRaw = function(e) {
                return h(this, void 0, void 0, function() {
                    var t, n, r;
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return t = {}, n = {}, [4, this.request({
                                    path: "/v1/stats/creator-dashboard-metadata",
                                    schemaPath: "/v1/stats/creator-dashboard-metadata",
                                    method: "GET",
                                    headers: n,
                                    query: t
                                }, e)];
                            case 1:
                                return r = s.sent(), [2, new c.H(r, function(e) {
                                    return null == e ? e : {
                                        isPlayFabDataSourceChartsEnabled: (0, c.u)(e, "isPlayFabDataSourceChartsEnabled") ? e.isPlayFabDataSourceChartsEnabled : void 0,
                                        playFabDataSourceChartsAvailableByKPITypes: (0, c.u)(e, "playFabDataSourceChartsAvailableByKPITypes") ? e.playFabDataSourceChartsAvailableByKPITypes : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1StatsCreatorDashboardMetadataGet = function(e) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1StatsCreatorDashboardMetadataGetRaw(e)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t
        }(c._),
        ea = {
            Hourly: "Hourly",
            Daily: "Daily",
            Monthly: "Monthly"
        },
        eo = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return l(t, e), t.prototype.v1PlacesPlaceIdTeamcreateActiveSessionMembersGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new c.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling v1PlacesPlaceIdTeamcreateActiveSessionMembersGet.");
                                return n = {}, void 0 !== e.limit && (n.limit = e.limit), void 0 !== e.cursor && (n.cursor = e.cursor), r = {}, [4, this.request({
                                    path: "/v1/places/{placeId}/teamcreate/active_session/members".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}/teamcreate/active_session/members",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return null == e ? e : {
                                        data: (0, c.u)(e, "data") ? e.data.map(Y) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1PlacesPlaceIdTeamcreateActiveSessionMembersGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1PlacesPlaceIdTeamcreateActiveSessionMembersGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdTeamcreateGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdTeamcreateGet.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/teamcreate".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/teamcreate",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return null == e ? e : {
                                        isEnabled: (0, c.u)(e, "isEnabled") ? e.isEnabled : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdTeamcreateGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdTeamcreateGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdTeamcreateMembershipsDeleteRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdTeamcreateMembershipsDelete.");
                                if (null === e.request || void 0 === e.request) throw new c.w("request", "Required parameter requestParameters.request was null or undefined when calling v1UniversesUniverseIdTeamcreateMembershipsDelete.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/universes/{universeId}/teamcreate/memberships".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/teamcreate/memberships",
                                    method: "DELETE",
                                    headers: r,
                                    query: n,
                                    body: L(e.request)
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s)]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdTeamcreateMembershipsDelete = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdTeamcreateMembershipsDeleteRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdTeamcreateMembershipsDeletePostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdTeamcreateMembershipsDeletePost.");
                                if (null === e.request || void 0 === e.request) throw new c.w("request", "Required parameter requestParameters.request was null or undefined when calling v1UniversesUniverseIdTeamcreateMembershipsDeletePost.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/universes/{universeId}/teamcreate/memberships/delete".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/teamcreate/memberships/delete",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: L(e.request)
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s)]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdTeamcreateMembershipsDeletePost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdTeamcreateMembershipsDeletePostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdTeamcreateMembershipsGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdTeamcreateMembershipsGet.");
                                return n = {}, void 0 !== e.sortOrder && (n.sortOrder = e.sortOrder), void 0 !== e.limit && (n.limit = e.limit), void 0 !== e.cursor && (n.cursor = e.cursor), r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/teamcreate/memberships".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/teamcreate/memberships",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return null == e ? e : {
                                        previousPageCursor: (0, c.u)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                        nextPageCursor: (0, c.u)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                        data: (0, c.u)(e, "data") ? e.data.map(k) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdTeamcreateMembershipsGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdTeamcreateMembershipsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdTeamcreatePatchRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdTeamcreatePatch.");
                                if (null === e.request || void 0 === e.request) throw new c.w("request", "Required parameter requestParameters.request was null or undefined when calling v1UniversesUniverseIdTeamcreatePatch.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/universes/{universeId}/teamcreate".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/teamcreate",
                                    method: "PATCH",
                                    headers: r,
                                    query: n,
                                    body: O(e.request)
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s)]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdTeamcreatePatch = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdTeamcreatePatchRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdTeamcreatePostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdTeamcreatePost.");
                                if (null === e.request || void 0 === e.request) throw new c.w("request", "Required parameter requestParameters.request was null or undefined when calling v1UniversesUniverseIdTeamcreatePost.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/universes/{universeId}/teamcreate".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/teamcreate",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: O(e.request)
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s)]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdTeamcreatePost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdTeamcreatePostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UserTeamcreateMembershipsGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return n = {}, void 0 !== e.sortOrder && (n.sortOrder = e.sortOrder), void 0 !== e.limit && (n.limit = e.limit), void 0 !== e.cursor && (n.cursor = e.cursor), r = {}, [4, this.request({
                                    path: "/v1/user/teamcreate/memberships",
                                    schemaPath: "/v1/user/teamcreate/memberships",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return K(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1UserTeamcreateMembershipsGet = function() {
                return h(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UserTeamcreateMembershipsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t
        }(c._),
        eu = (function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            l(t, e), t.prototype.v1TeamtestPlaceIdDeleteRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new c.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling v1TeamtestPlaceIdDelete.");
                                if (null === e.gameId || void 0 === e.gameId) throw new c.w("gameId", "Required parameter requestParameters.gameId was null or undefined when calling v1TeamtestPlaceIdDelete.");
                                return n = {}, void 0 !== e.gameId && (n.gameId = e.gameId), r = {}, [4, this.request({
                                    path: "/v1/teamtest/{placeId}".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/teamtest/{placeId}",
                                    method: "DELETE",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s)]
                        }
                    })
                })
            }, t.prototype.v1TeamtestPlaceIdDelete = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1TeamtestPlaceIdDeleteRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1TeamtestPlacesPlaceIdRunninggamesGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new c.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling v1TeamtestPlacesPlaceIdRunninggamesGet.");
                                return n = {}, void 0 !== e.sortOrder && (n.sortOrder = e.sortOrder), void 0 !== e.limit && (n.limit = e.limit), void 0 !== e.cursor && (n.cursor = e.cursor), r = {}, [4, this.request({
                                    path: "/v1/teamtest/places/{placeId}/runninggames".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/teamtest/places/{placeId}/runninggames",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.V(s)]
                        }
                    })
                })
            }, t.prototype.v1TeamtestPlacesPlaceIdRunninggamesGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1TeamtestPlacesPlaceIdRunninggamesGetRaw(e, t)];
                            case 1:
                                return n.sent(), [2]
                        }
                    })
                })
            }
        }(c._), function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return l(t, e), t.prototype.v1UniversesUniverseIdThumbnailsAltTextPostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdThumbnailsAltTextPost.");
                                if (null === e.request || void 0 === e.request) throw new c.w("request", "Required parameter requestParameters.request was null or undefined when calling v1UniversesUniverseIdThumbnailsAltTextPost.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/universes/{universeId}/thumbnails/alt-text".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/thumbnails/alt-text",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            MediaAssetId: e.mediaAssetId,
                                            MediaAssetAltText: e.mediaAssetAltText
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return null == e ? e : {
                                        mediaAssetId: (0, c.u)(e, "MediaAssetId") ? e.MediaAssetId : void 0,
                                        mediaAssetAltText: (0, c.u)(e, "MediaAssetAltText") ? e.MediaAssetAltText : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdThumbnailsAltTextPost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdThumbnailsAltTextPostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdThumbnailsAutoGeneratedPostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdThumbnailsAutoGeneratedPost.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/thumbnails/auto-generated".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/thumbnails/auto-generated",
                                    method: "POST",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s)]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdThumbnailsAutoGeneratedPost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdThumbnailsAutoGeneratedPostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdThumbnailsOrderPostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdThumbnailsOrderPost.");
                                if (null === e.request || void 0 === e.request) throw new c.w("request", "Required parameter requestParameters.request was null or undefined when calling v1UniversesUniverseIdThumbnailsOrderPost.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/universes/{universeId}/thumbnails/order".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/thumbnails/order",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            thumbnailIds: e.thumbnailIds
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s)]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdThumbnailsOrderPost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdThumbnailsOrderPostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdThumbnailsThumbnailIdDeleteRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdThumbnailsThumbnailIdDelete.");
                                if (null === e.thumbnailId || void 0 === e.thumbnailId) throw new c.w("thumbnailId", "Required parameter requestParameters.thumbnailId was null or undefined when calling v1UniversesUniverseIdThumbnailsThumbnailIdDelete.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/thumbnails/{thumbnailId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("thumbnailId", "}"), encodeURIComponent(String(e.thumbnailId))),
                                    schemaPath: "/v1/universes/{universeId}/thumbnails/{thumbnailId}",
                                    method: "DELETE",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s)]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdThumbnailsThumbnailIdDelete = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdThumbnailsThumbnailIdDeleteRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t
        }(c._)),
        ed = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return l(t, e), t.prototype.v1UniversesUniverseIdConfigurationGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdConfigurationGet.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/configuration".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/configuration",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return F(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdConfigurationGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdConfigurationGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdConfigurationPatchRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdConfigurationPatch.");
                                if (null === e.model || void 0 === e.model) throw new c.w("model", "Required parameter requestParameters.model was null or undefined when calling v1UniversesUniverseIdConfigurationPatch.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/universes/{universeId}/configuration".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/configuration",
                                    method: "PATCH",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            name: e.name,
                                            universeAvatarType: e.universeAvatarType,
                                            universeScaleType: e.universeScaleType,
                                            universeAnimationType: e.universeAnimationType,
                                            universeCollisionType: e.universeCollisionType,
                                            universeBodyType: e.universeBodyType,
                                            universeJointPositioningType: e.universeJointPositioningType,
                                            isArchived: e.isArchived,
                                            isFriendsOnly: e.isFriendsOnly,
                                            genre: e.genre,
                                            playableDevices: e.playableDevices,
                                            isForSale: e.isForSale,
                                            price: e.price,
                                            isMeshTextureApiAccessAllowed: e.isMeshTextureApiAccessAllowed
                                        }
                                    }(e.model)
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return F(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdConfigurationPatch = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdConfigurationPatchRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdConfigurationPlaytestersDeleteRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdConfigurationPlaytestersDelete.");
                                if (null === e.request || void 0 === e.request) throw new c.w("request", "Required parameter requestParameters.request was null or undefined when calling v1UniversesUniverseIdConfigurationPlaytestersDelete.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/universes/{universeId}/configuration/playtesters".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/configuration/playtesters",
                                    method: "DELETE",
                                    headers: r,
                                    query: n,
                                    body: C(e.request)
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return D(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdConfigurationPlaytestersDelete = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdConfigurationPlaytestersDeleteRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdConfigurationPlaytestersEligibilityPostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdConfigurationPlaytestersEligibilityPost.");
                                if (null === e.request || void 0 === e.request) throw new c.w("request", "Required parameter requestParameters.request was null or undefined when calling v1UniversesUniverseIdConfigurationPlaytestersEligibilityPost.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/universes/{universeId}/configuration/playtesters/eligibility".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/configuration/playtesters/eligibility",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: C(e.request)
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return null == e ? e : {
                                        playtesters: (0, c.u)(e, "playtesters") ? e.playtesters.map(S) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdConfigurationPlaytestersEligibilityPost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdConfigurationPlaytestersEligibilityPostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdConfigurationPlaytestersGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdConfigurationPlaytestersGet.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/configuration/playtesters".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/configuration/playtesters",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return D(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdConfigurationPlaytestersGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdConfigurationPlaytestersGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdConfigurationPlaytestersPostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdConfigurationPlaytestersPost.");
                                if (null === e.request || void 0 === e.request) throw new c.w("request", "Required parameter requestParameters.request was null or undefined when calling v1UniversesUniverseIdConfigurationPlaytestersPost.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/universes/{universeId}/configuration/playtesters".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/configuration/playtesters",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: C(e.request)
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return D(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdConfigurationPlaytestersPost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdConfigurationPlaytestersPostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdConfigurationVipServersGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdConfigurationVipServersGet.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/configuration/vip-servers".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/configuration/vip-servers",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return null == e ? e : {
                                        isEnabled: (0, c.u)(e, "isEnabled") ? e.isEnabled : void 0,
                                        price: (0, c.u)(e, "price") ? e.price : void 0,
                                        activeServersCount: (0, c.u)(e, "activeServersCount") ? e.activeServersCount : void 0,
                                        activeSubscriptionsCount: (0, c.u)(e, "activeSubscriptionsCount") ? e.activeSubscriptionsCount : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdConfigurationVipServersGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdConfigurationVipServersGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t
        }(c._),
        ec = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return l(t, e), t.prototype.v1UniversesMultigetGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.ids || void 0 === e.ids) throw new c.w("ids", "Required parameter requestParameters.ids was null or undefined when calling v1UniversesMultigetGet.");
                                return n = {}, e.ids && (n.ids = e.ids), r = {}, [4, this.request({
                                    path: "/v1/universes/multiget",
                                    schemaPath: "/v1/universes/multiget",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return null == e ? e : {
                                        data: (0, c.u)(e, "data") ? e.data.map(g) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesMultigetGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesMultigetGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesMultigetPermissionsGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.ids || void 0 === e.ids) throw new c.w("ids", "Required parameter requestParameters.ids was null or undefined when calling v1UniversesMultigetPermissionsGet.");
                                return n = {}, e.ids && (n.ids = e.ids), r = {}, [4, this.request({
                                    path: "/v1/universes/multiget/permissions",
                                    schemaPath: "/v1/universes/multiget/permissions",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return null == e ? e : {
                                        data: (0, c.u)(e, "data") ? e.data.map(V) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesMultigetPermissionsGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesMultigetPermissionsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdActivatePostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdActivatePost.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/activate".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/activate",
                                    method: "POST",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s)]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdActivatePost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdActivatePostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdActivationEligibilityGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdActivationEligibilityGet.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/activation-eligibility".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/activation-eligibility",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return null == e ? e : {
                                        isEligible: (0, c.u)(e, "isEligible") ? e.isEligible : void 0,
                                        maturityRated: (0, c.u)(e, "maturityRated") ? e.maturityRated : void 0,
                                        isUserEligibleForPublicPublish: (0, c.u)(e, "isUserEligibleForPublicPublish") ? e.isUserEligibleForPublicPublish : void 0,
                                        remainingPublicPublishCount: (0, c.u)(e, "remainingPublicPublishCount") ? e.remainingPublicPublishCount : void 0,
                                        isPublicPublish: (0, c.u)(e, "isPublicPublish") ? e.isPublicPublish : void 0,
                                        isPublishToExistingUniverse: (0, c.u)(e, "isPublishToExistingUniverse") ? e.isPublishToExistingUniverse : void 0,
                                        isUniverseSelect: (0, c.u)(e, "isUniverseSelect") ? e.isUniverseSelect : void 0,
                                        creatorTier: (0, c.u)(e, "creatorTier") ? e.creatorTier : void 0,
                                        allowedAudiences: (0, c.u)(e, "allowedAudiences") ? e.allowedAudiences : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdActivationEligibilityGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdActivationEligibilityGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdContextPermissionsGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdContextPermissionsGet.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/context-permissions".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/context-permissions",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return x(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdContextPermissionsGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdContextPermissionsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdDeactivatePostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdDeactivatePost.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/deactivate".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/deactivate",
                                    method: "POST",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s)]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdDeactivatePost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdDeactivatePostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdGet.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return g(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdLiveStatsGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdLiveStatsGet.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/live-stats".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/live-stats",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return null == e ? e : {
                                        totalPlayerCount: (0, c.u)(e, "totalPlayerCount") ? e.totalPlayerCount : void 0,
                                        playerCountsByDeviceType: (0, c.u)(e, "playerCountsByDeviceType") ? e.playerCountsByDeviceType : void 0,
                                        gameCount: (0, c.u)(e, "gameCount") ? e.gameCount : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdLiveStatsGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdLiveStatsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdPermissionsGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdPermissionsGet.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/permissions".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/permissions",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return x(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdPermissionsGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdPermissionsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdPlacesGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdPlacesGet.");
                                return n = {}, void 0 !== e.sortOrder && (n.sortOrder = e.sortOrder), void 0 !== e.limit && (n.limit = e.limit), void 0 !== e.cursor && (n.cursor = e.cursor), void 0 !== e.isUniverseCreation && (n.isUniverseCreation = e.isUniverseCreation), r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/places".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/places",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return null == e ? e : {
                                        previousPageCursor: (0, c.u)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                        nextPageCursor: (0, c.u)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                        data: (0, c.u)(e, "data") ? e.data : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdPlacesGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdPlacesGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdRevenueReportsGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdRevenueReportsGet.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/revenue-reports".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/revenue-reports",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return null == e ? e : {
                                        monthlyRevenueReportStatusList: (0, c.u)(e, "monthlyRevenueReportStatusList") ? e.monthlyRevenueReportStatusList.map(A) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdRevenueReportsGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdRevenueReportsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdRevenueReportsYearDashMonthDownloadGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdRevenueReportsYearDashMonthDownloadGet.");
                                if (null === e.yearDashMonth || void 0 === e.yearDashMonth) throw new c.w("yearDashMonth", "Required parameter requestParameters.yearDashMonth was null or undefined when calling v1UniversesUniverseIdRevenueReportsYearDashMonthDownloadGet.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/revenue-reports/{yearDashMonth}/download".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("yearDashMonth", "}"), encodeURIComponent(String(e.yearDashMonth))),
                                    schemaPath: "/v1/universes/{universeId}/revenue-reports/{yearDashMonth}/download",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s)]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdRevenueReportsYearDashMonthDownloadGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdRevenueReportsYearDashMonthDownloadGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdRevenueReportsYearDashMonthGeneratePostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdRevenueReportsYearDashMonthGeneratePost.");
                                if (null === e.yearDashMonth || void 0 === e.yearDashMonth) throw new c.w("yearDashMonth", "Required parameter requestParameters.yearDashMonth was null or undefined when calling v1UniversesUniverseIdRevenueReportsYearDashMonthGeneratePost.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/revenue-reports/{yearDashMonth}/generate".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("yearDashMonth", "}"), encodeURIComponent(String(e.yearDashMonth))),
                                    schemaPath: "/v1/universes/{universeId}/revenue-reports/{yearDashMonth}/generate",
                                    method: "POST",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return null == e ? e : {
                                        revenueReportStatus: (0, c.u)(e, "revenueReportStatus") ? e.revenueReportStatus : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdRevenueReportsYearDashMonthGeneratePost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdRevenueReportsYearDashMonthGeneratePostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdRevenueReportsYearDashMonthGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdRevenueReportsYearDashMonthGet.");
                                if (null === e.yearDashMonth || void 0 === e.yearDashMonth) throw new c.w("yearDashMonth", "Required parameter requestParameters.yearDashMonth was null or undefined when calling v1UniversesUniverseIdRevenueReportsYearDashMonthGet.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/revenue-reports/{yearDashMonth}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("yearDashMonth", "}"), encodeURIComponent(String(e.yearDashMonth))),
                                    schemaPath: "/v1/universes/{universeId}/revenue-reports/{yearDashMonth}",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return A(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdRevenueReportsYearDashMonthGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdRevenueReportsYearDashMonthGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdStatisticReportsGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdStatisticReportsGet.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/statistic-reports".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/statistic-reports",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return null == e ? e : {
                                        reports: (0, c.u)(e, "reports") ? e.reports.map(y) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdStatisticReportsGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdStatisticReportsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdStatisticReportsYearDashMonthDownloadGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdStatisticReportsYearDashMonthDownloadGet.");
                                if (null === e.yearDashMonth || void 0 === e.yearDashMonth) throw new c.w("yearDashMonth", "Required parameter requestParameters.yearDashMonth was null or undefined when calling v1UniversesUniverseIdStatisticReportsYearDashMonthDownloadGet.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/statistic-reports/{yearDashMonth}/download".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("yearDashMonth", "}"), encodeURIComponent(String(e.yearDashMonth))),
                                    schemaPath: "/v1/universes/{universeId}/statistic-reports/{yearDashMonth}/download",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s)]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdStatisticReportsYearDashMonthDownloadGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdStatisticReportsYearDashMonthDownloadGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdStatisticReportsYearDashMonthGeneratePostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdStatisticReportsYearDashMonthGeneratePost.");
                                if (null === e.yearDashMonth || void 0 === e.yearDashMonth) throw new c.w("yearDashMonth", "Required parameter requestParameters.yearDashMonth was null or undefined when calling v1UniversesUniverseIdStatisticReportsYearDashMonthGeneratePost.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/statistic-reports/{yearDashMonth}/generate".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("yearDashMonth", "}"), encodeURIComponent(String(e.yearDashMonth))),
                                    schemaPath: "/v1/universes/{universeId}/statistic-reports/{yearDashMonth}/generate",
                                    method: "POST",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s)]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdStatisticReportsYearDashMonthGeneratePost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdStatisticReportsYearDashMonthGeneratePostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdStatisticReportsYearDashMonthGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdStatisticReportsYearDashMonthGet.");
                                if (null === e.yearDashMonth || void 0 === e.yearDashMonth) throw new c.w("yearDashMonth", "Required parameter requestParameters.yearDashMonth was null or undefined when calling v1UniversesUniverseIdStatisticReportsYearDashMonthGet.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/statistic-reports/{yearDashMonth}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("yearDashMonth", "}"), encodeURIComponent(String(e.yearDashMonth))),
                                    schemaPath: "/v1/universes/{universeId}/statistic-reports/{yearDashMonth}",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return y(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdStatisticReportsYearDashMonthGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdStatisticReportsYearDashMonthGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUserPublicPublishEligibilityGetRaw = function(e) {
                return h(this, void 0, void 0, function() {
                    var t, n, r;
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return t = {}, n = {}, [4, this.request({
                                    path: "/v1/universes/user-public-publish-eligibility",
                                    schemaPath: "/v1/universes/user-public-publish-eligibility",
                                    method: "GET",
                                    headers: n,
                                    query: t
                                }, e)];
                            case 1:
                                return r = s.sent(), [2, new c.H(r, function(e) {
                                    return null == e ? e : {
                                        isEligible: (0, c.u)(e, "isEligible") ? e.isEligible : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUserPublicPublishEligibilityGet = function(e) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1UniversesUserPublicPublishEligibilityGetRaw(e)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t
        }(c._),
        ev = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return l(t, e), t.prototype.v1UserGroupsCanmanageGetRaw = function(e) {
                return h(this, void 0, void 0, function() {
                    var t, n, r;
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return t = {}, n = {}, [4, this.request({
                                    path: "/v1/user/groups/canmanage",
                                    schemaPath: "/v1/user/groups/canmanage",
                                    method: "GET",
                                    headers: n,
                                    query: t
                                }, e)];
                            case 1:
                                return r = s.sent(), [2, new c.H(r, function(e) {
                                    return z(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1UserGroupsCanmanageGet = function(e) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1UserGroupsCanmanageGetRaw(e)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.v1UserGroupsCanmanagegamesoritemsGetRaw = function(e) {
                return h(this, void 0, void 0, function() {
                    var t, n, r;
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return t = {}, n = {}, [4, this.request({
                                    path: "/v1/user/groups/canmanagegamesoritems",
                                    schemaPath: "/v1/user/groups/canmanagegamesoritems",
                                    method: "GET",
                                    headers: n,
                                    query: t
                                }, e)];
                            case 1:
                                return r = s.sent(), [2, new c.H(r, function(e) {
                                    return z(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1UserGroupsCanmanagegamesoritemsGet = function(e) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1UserGroupsCanmanagegamesoritemsGetRaw(e)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.v1UserIsVerifiedCreatorGetRaw = function(e) {
                return h(this, void 0, void 0, function() {
                    var t, n, r;
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return t = {}, n = {}, [4, this.request({
                                    path: "/v1/user/is-verified-creator",
                                    schemaPath: "/v1/user/is-verified-creator",
                                    method: "GET",
                                    headers: n,
                                    query: t
                                }, e)];
                            case 1:
                                return r = s.sent(), [2, new c.H(r, function(e) {
                                    return null == e ? e : {
                                        isVerifiedCreator: (0, c.u)(e, "isVerifiedCreator") ? e.isVerifiedCreator : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1UserIsVerifiedCreatorGet = function(e) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1UserIsVerifiedCreatorGetRaw(e)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.v1UserNotificationsStatisticReportsGetRaw = function(e) {
                return h(this, void 0, void 0, function() {
                    var t, n, r;
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return t = {}, n = {}, [4, this.request({
                                    path: "/v1/user/notifications/statistic-reports",
                                    schemaPath: "/v1/user/notifications/statistic-reports",
                                    method: "GET",
                                    headers: n,
                                    query: t
                                }, e)];
                            case 1:
                                return r = s.sent(), [2, new c.H(r, function(e) {
                                    return null == e ? e : {
                                        data: (0, c.u)(e, "data") ? e.data.map(B) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1UserNotificationsStatisticReportsGet = function(e) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1UserNotificationsStatisticReportsGetRaw(e)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.v1UserUniversesGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return n = {}, void 0 !== e.isArchived && (n.isArchived = e.isArchived), void 0 !== e.sortOrder && (n.sortOrder = e.sortOrder), void 0 !== e.limit && (n.limit = e.limit), void 0 !== e.cursor && (n.cursor = e.cursor), r = {}, [4, this.request({
                                    path: "/v1/user/universes",
                                    schemaPath: "/v1/user/universes",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return K(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1UserUniversesGet = function() {
                return h(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UserUniversesGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UserUserIdCanmanageAssetIdGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new c.w("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UserUserIdCanmanageAssetIdGet.");
                                if (null === e.assetId || void 0 === e.assetId) throw new c.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1UserUserIdCanmanageAssetIdGet.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/user/{userId}/canmanage/{assetId}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))).replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/user/{userId}/canmanage/{assetId}",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return null == e ? e : {
                                        success: (0, c.u)(e, "Success") ? e.Success : void 0,
                                        canManage: (0, c.u)(e, "CanManage") ? e.CanManage : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1UserUserIdCanmanageAssetIdGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UserUserIdCanmanageAssetIdGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v1UserUserIdIsAdminDeveloperConsoleEnabledGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new c.w("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UserUserIdIsAdminDeveloperConsoleEnabledGet.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v1/user/{userId}/is-admin-developer-console-enabled".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/user/{userId}/is-admin-developer-console-enabled",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return null == e ? e : {
                                        isAdminDeveloperConsoleEnabled: (0, c.u)(e, "isAdminDeveloperConsoleEnabled") ? e.isAdminDeveloperConsoleEnabled : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1UserUserIdIsAdminDeveloperConsoleEnabledGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v1UserUserIdIsAdminDeveloperConsoleEnabledGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t
        }(c._),
        el = {
            Asc: "Asc",
            Desc: "Desc"
        };

    function eh(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, c.u)(t, "Id") ? t.Id : void 0,
            assetId: (0, c.u)(t, "assetId") ? t.assetId : void 0,
            assetVersionNumber: (0, c.u)(t, "assetVersionNumber") ? t.assetVersionNumber : void 0,
            creatorType: (0, c.u)(t, "creatorType") ? t.creatorType : void 0,
            creatorTargetId: (0, c.u)(t, "creatorTargetId") ? t.creatorTargetId : void 0,
            creatingUniverseId: (0, c.u)(t, "creatingUniverseId") ? t.creatingUniverseId : void 0,
            created: (0, c.u)(t, "created") ? new Date(t.created) : void 0,
            isEqualToCurrentPublishedVersion: (0, c.u)(t, "isEqualToCurrentPublishedVersion") ? t.isEqualToCurrentPublishedVersion : void 0,
            isPublished: (0, c.u)(t, "isPublished") ? t.isPublished : void 0
        }
    }
    e.s(["w", 0, Q, "k", 0, X, "z", 0, ee, "x", 0, et, "H", 0, {
        User: "User",
        Group: "Group"
    }, "g", 0, {
        Pending: "Pending",
        Finished: "Finished",
        DoesNotRequire: "DoesNotRequire"
    }, "i", 0, {
        Image: "Image",
        TShirt: "TShirt",
        Audio: "Audio",
        Mesh: "Mesh",
        Lua: "Lua",
        Html: "HTML",
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
        YouTubeVideo: "YouTubeVideo",
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
        TShirtAccessory: "TShirtAccessory",
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
        MeshHiddenSurfaceRemoval: "MeshHiddenSurfaceRemoval"
    }, "V", 0, {
        Invalid: "Invalid",
        NotModerated: "NotModerated",
        Pending: "Pending",
        Approved: "Approved",
        Rejected: "Rejected"
    }, "Y", 0, {
        Computer: "Computer",
        Phone: "Phone",
        Tablet: "Tablet",
        Console: "Console",
        Vr: "VR",
        Tv: "TV"
    }, "y", 0, en, "O", 0, es, "P", 0, ei, "j", 0, eo, "u", 0, eu, "l", 0, ed, "G", 0, ec, "U", 0, ev, "J", 0, {
        NUMBER_10: 10,
        NUMBER_25: 25,
        NUMBER_50: 50,
        NUMBER_100: 100
    }, "_", 0, {
        NUMBER_10: 10,
        NUMBER_25: 25,
        NUMBER_50: 50,
        NUMBER_100: 100
    }, "S", 0, Z, "f", 0, ea, "t", 0, er, "$", 0, {
        NUMBER_10: 10,
        NUMBER_25: 25,
        NUMBER_50: 50,
        NUMBER_100: 100
    }, "W", 0, {
        Asc: "Asc",
        Desc: "Desc"
    }, "v", 0, {
        NUMBER_10: 10,
        NUMBER_25: 25,
        NUMBER_50: 50,
        NUMBER_100: 100
    }, "e", 0, el], 587694);

    function ep(e, t) {
        return null == e ? e : {
            maxPlayerCount: (0, c.u)(e, "maxPlayerCount") ? e.maxPlayerCount : void 0,
            socialSlotType: (0, c.u)(e, "socialSlotType") ? e.socialSlotType : void 0,
            customSocialSlotsCount: (0, c.u)(e, "customSocialSlotsCount") ? e.customSocialSlotsCount : void 0,
            allowCopying: (0, c.u)(e, "allowCopying") ? e.allowCopying : void 0,
            currentSavedVersion: (0, c.u)(e, "currentSavedVersion") ? e.currentSavedVersion : void 0,
            isAllGenresAllowed: (0, c.u)(e, "isAllGenresAllowed") ? e.isAllGenresAllowed : void 0,
            allowedGearTypes: (0, c.u)(e, "allowedGearTypes") ? e.allowedGearTypes : void 0,
            maxPlayersAllowed: (0, c.u)(e, "maxPlayersAllowed") ? e.maxPlayersAllowed : void 0,
            id: (0, c.u)(e, "id") ? e.id : void 0,
            universeId: (0, c.u)(e, "universeId") ? e.universeId : void 0,
            name: (0, c.u)(e, "name") ? e.name : void 0,
            description: (0, c.u)(e, "description") ? e.description : void 0,
            isRootPlace: (0, c.u)(e, "isRootPlace") ? e.isRootPlace : void 0
        }
    }

    function eI(e) {
        var t;
        return null == (t = e) ? t : {
            region: (0, c.u)(t, "region") ? t.region : void 0,
            status: (0, c.u)(t, "status") ? t.status : void 0
        }
    }

    function em(e) {
        if (void 0 !== e) return null === e ? null : {
            Action: e.action,
            SubjectType: e.subjectType,
            SubjectId: e.subjectId
        }
    }

    function ew(e) {
        var t;
        return null == (t = e) ? t : {
            assetID: (0, c.u)(t, "assetID") ? t.assetID : void 0,
            assetTypeID: (0, c.u)(t, "assetTypeID") ? t.assetTypeID : void 0,
            isPlayerChoice: (0, c.u)(t, "isPlayerChoice") ? t.isPlayerChoice : void 0
        }
    }

    function ef(e) {
        if (void 0 !== e) return null === e ? null : {
            assetID: e.assetID,
            assetTypeID: e.assetTypeID,
            isPlayerChoice: e.isPlayerChoice
        }
    }

    function eP(e, t) {
        return null == e ? e : {
            height: (0, c.u)(e, "height") ? e.height : void 0,
            width: (0, c.u)(e, "width") ? e.width : void 0,
            head: (0, c.u)(e, "head") ? e.head : void 0,
            depth: (0, c.u)(e, "depth") ? e.depth : void 0,
            proportion: (0, c.u)(e, "proportion") ? e.proportion : void 0,
            bodyType: (0, c.u)(e, "bodyType") ? e.bodyType : void 0
        }
    }

    function ey(e) {
        if (void 0 !== e) return null === e ? null : {
            height: e.height,
            width: e.width,
            head: e.head,
            depth: e.depth,
            proportion: e.proportion,
            bodyType: e.bodyType
        }
    }

    function eg(e, t) {
        var n;
        return null == e ? e : {
            allowPrivateServers: (0, c.u)(e, "allowPrivateServers") ? e.allowPrivateServers : void 0,
            privateServerPrice: (0, c.u)(e, "privateServerPrice") ? e.privateServerPrice : void 0,
            optInRegions: (0, c.u)(e, "optInRegions") ? e.optInRegions.map(eI) : void 0,
            isMeshTextureApiAccessAllowed: (0, c.u)(e, "isMeshTextureApiAccessAllowed") ? e.isMeshTextureApiAccessAllowed : void 0,
            id: (0, c.u)(e, "id") ? e.id : void 0,
            name: (0, c.u)(e, "name") ? e.name : void 0,
            description: (0, c.u)(e, "description") ? e.description : void 0,
            promotionalText: (0, c.u)(e, "promotionalText") ? e.promotionalText : void 0,
            universeAvatarType: (0, c.u)(e, "universeAvatarType") ? e.universeAvatarType : void 0,
            universeAnimationType: (0, c.u)(e, "universeAnimationType") ? e.universeAnimationType : void 0,
            universeCollisionType: (0, c.u)(e, "universeCollisionType") ? e.universeCollisionType : void 0,
            universeJointPositioningType: (0, c.u)(e, "universeJointPositioningType") ? e.universeJointPositioningType : void 0,
            isArchived: (0, c.u)(e, "isArchived") ? e.isArchived : void 0,
            isFriendsOnly: (0, c.u)(e, "isFriendsOnly") ? e.isFriendsOnly : void 0,
            genre: (0, c.u)(e, "genre") ? e.genre : void 0,
            playableDevices: (0, c.u)(e, "playableDevices") ? e.playableDevices : void 0,
            isForSale: (0, c.u)(e, "isForSale") ? e.isForSale : void 0,
            price: (0, c.u)(e, "price") ? e.price : void 0,
            universeAvatarAssetOverrides: (0, c.u)(e, "universeAvatarAssetOverrides") ? e.universeAvatarAssetOverrides.map(ew) : void 0,
            universeAvatarMinScales: (0, c.u)(e, "universeAvatarMinScales") ? eP(e.universeAvatarMinScales) : void 0,
            universeAvatarMaxScales: (0, c.u)(e, "universeAvatarMaxScales") ? eP(e.universeAvatarMaxScales) : void 0,
            studioAccessToApisAllowed: (0, c.u)(e, "studioAccessToApisAllowed") ? e.studioAccessToApisAllowed : void 0,
            permissions: (0, c.u)(e, "permissions") ? null == (n = e.permissions) ? n : {
                isThirdPartyTeleportAllowed: (0, c.u)(n, "IsThirdPartyTeleportAllowed") ? n.IsThirdPartyTeleportAllowed : void 0,
                isThirdPartyAssetAllowed: (0, c.u)(n, "IsThirdPartyAssetAllowed") ? n.IsThirdPartyAssetAllowed : void 0,
                isThirdPartyPurchaseAllowed: (0, c.u)(n, "IsThirdPartyPurchaseAllowed") ? n.IsThirdPartyPurchaseAllowed : void 0
            } : void 0,
            isForSaleInFiat: (0, c.u)(e, "isForSaleInFiat") ? e.isForSaleInFiat : void 0,
            fiatBasePriceId: (0, c.u)(e, "fiatBasePriceId") ? e.fiatBasePriceId : void 0,
            fiatModerationStatus: (0, c.u)(e, "fiatModerationStatus") ? e.fiatModerationStatus : void 0,
            audiences: (0, c.u)(e, "audiences") ? e.audiences : void 0,
            demoModeEnabled: (0, c.u)(e, "demoModeEnabled") ? e.demoModeEnabled : void 0,
            demoModeChangeableAfter: (0, c.u)(e, "demoModeChangeableAfter") ? new Date(e.demoModeChangeableAfter) : void 0
        }
    }

    function eU(e) {
        var t;
        return null == (t = e) ? t : {
            userId: (0, c.u)(t, "userId") ? t.userId : void 0,
            userHasPermission: (0, c.u)(t, "userHasPermission") ? t.userHasPermission : void 0
        }
    }

    function eb(e, t) {
        return null == e ? e : {
            data: (0, c.u)(e, "data") ? e.data : void 0
        }
    }
    var eR = c._;

    function eA() {
        return null !== eR && eR.apply(this, arguments) || this
    }
    l(eA, eR), eA.prototype.v2AssetsIdVersionsGetRaw = function(e, t) {
        return h(this, void 0, void 0, function() {
            var n, r, s;
            return p(this, function(i) {
                switch (i.label) {
                    case 0:
                        if (null === e.id || void 0 === e.id) throw new c.w("id", "Required parameter requestParameters.id was null or undefined when calling v2AssetsIdVersionsGet.");
                        return n = {}, void 0 !== e.sortOrder && (n.sortOrder = e.sortOrder), void 0 !== e.limit && (n.limit = e.limit), void 0 !== e.cursor && (n.cursor = e.cursor), r = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (r["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                            path: "/v2/assets/{id}/versions".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                            schemaPath: "/v2/assets/{id}/versions",
                            method: "GET",
                            headers: r,
                            query: n
                        }, t)];
                    case 1:
                        return s = i.sent(), [2, new c.H(s, function(e) {
                            return null == e ? e : {
                                previousPageCursor: (0, c.u)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                nextPageCursor: (0, c.u)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                data: (0, c.u)(e, "data") ? e.data.map(eh) : void 0
                            }
                        })]
                }
            })
        })
    }, eA.prototype.v2AssetsIdVersionsGet = function(e, t) {
        return h(this, void 0, void 0, function() {
            return p(this, function(n) {
                switch (n.label) {
                    case 0:
                        return [4, this.v2AssetsIdVersionsGetRaw(e, t)];
                    case 1:
                        return [4, n.sent().value()];
                    case 2:
                        return [2, n.sent()]
                }
            })
        })
    };
    var eq = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return l(t, e), t.prototype.v2UniversesUniverseIdPermissionsBatchedDeleteRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v2UniversesUniverseIdPermissionsBatchedDelete.");
                                if (null === e.permissions || void 0 === e.permissions) throw new c.w("permissions", "Required parameter requestParameters.permissions was null or undefined when calling v2UniversesUniverseIdPermissionsBatchedDelete.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v2/universes/{universeId}/permissions_batched".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/universes/{universeId}/permissions_batched",
                                    method: "DELETE",
                                    headers: r,
                                    query: n,
                                    body: e.permissions.map(em)
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return eb(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v2UniversesUniverseIdPermissionsBatchedDelete = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v2UniversesUniverseIdPermissionsBatchedDeleteRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v2UniversesUniverseIdPermissionsBatchedPostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v2UniversesUniverseIdPermissionsBatchedPost.");
                                if (null === e.permissions || void 0 === e.permissions) throw new c.w("permissions", "Required parameter requestParameters.permissions was null or undefined when calling v2UniversesUniverseIdPermissionsBatchedPost.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v2/universes/{universeId}/permissions_batched".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/universes/{universeId}/permissions_batched",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: e.permissions.map(em)
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return eb(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v2UniversesUniverseIdPermissionsBatchedPost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v2UniversesUniverseIdPermissionsBatchedPostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v2UniversesUniverseIdPermissionsDeleteRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v2UniversesUniverseIdPermissionsDelete.");
                                if (null === e.permissions || void 0 === e.permissions) throw new c.w("permissions", "Required parameter requestParameters.permissions was null or undefined when calling v2UniversesUniverseIdPermissionsDelete.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v2/universes/{universeId}/permissions".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/universes/{universeId}/permissions",
                                    method: "DELETE",
                                    headers: r,
                                    query: n,
                                    body: e.permissions.map(em)
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s)]
                        }
                    })
                })
            }, t.prototype.v2UniversesUniverseIdPermissionsDelete = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v2UniversesUniverseIdPermissionsDeleteRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v2UniversesUniverseIdPermissionsGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v2UniversesUniverseIdPermissionsGet.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v2/universes/{universeId}/permissions".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/universes/{universeId}/permissions",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return null == e ? e : {
                                        data: (0, c.u)(e, "data") ? e.data : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v2UniversesUniverseIdPermissionsGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v2UniversesUniverseIdPermissionsGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v2UniversesUniverseIdPermissionsPostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v2UniversesUniverseIdPermissionsPost.");
                                if (null === e.permissions || void 0 === e.permissions) throw new c.w("permissions", "Required parameter requestParameters.permissions was null or undefined when calling v2UniversesUniverseIdPermissionsPost.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v2/universes/{universeId}/permissions".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/universes/{universeId}/permissions",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: e.permissions.map(em)
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s)]
                        }
                    })
                })
            }, t.prototype.v2UniversesUniverseIdPermissionsPost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v2UniversesUniverseIdPermissionsPostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v2UniversesUniverseIdUsersHavePermissionPermissionActionGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v2UniversesUniverseIdUsersHavePermissionPermissionActionGet.");
                                if (null === e.permissionAction || void 0 === e.permissionAction) throw new c.w("permissionAction", "Required parameter requestParameters.permissionAction was null or undefined when calling v2UniversesUniverseIdUsersHavePermissionPermissionActionGet.");
                                if (null === e.userIds || void 0 === e.userIds) throw new c.w("userIds", "Required parameter requestParameters.userIds was null or undefined when calling v2UniversesUniverseIdUsersHavePermissionPermissionActionGet.");
                                return n = {}, e.userIds && (n.userIds = e.userIds.join(c.G.csv)), r = {}, [4, this.request({
                                    path: "/v2/universes/{universeId}/users-have-permission/{permissionAction}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("permissionAction", "}"), encodeURIComponent(String(e.permissionAction))),
                                    schemaPath: "/v2/universes/{universeId}/users-have-permission/{permissionAction}",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return null == e ? e : {
                                        data: (0, c.u)(e, "data") ? e.data.map(eU) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v2UniversesUniverseIdUsersHavePermissionPermissionActionGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v2UniversesUniverseIdUsersHavePermissionPermissionActionGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t
        }(c._),
        eT = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return l(t, e), t.prototype.v2PlacesPlaceIdGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new c.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling v2PlacesPlaceIdGet.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v2/places/{placeId}".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v2/places/{placeId}",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return ep(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v2PlacesPlaceIdGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v2PlacesPlaceIdGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v2PlacesPlaceIdPatchRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new c.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling v2PlacesPlaceIdPatch.");
                                if (null === e._configuration || void 0 === e._configuration) throw new c.w("_configuration", "Required parameter requestParameters._configuration was null or undefined when calling v2PlacesPlaceIdPatch.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v2/places/{placeId}".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v2/places/{placeId}",
                                    method: "PATCH",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            name: e.name,
                                            description: e.description,
                                            maxPlayerCount: e.maxPlayerCount,
                                            socialSlotType: e.socialSlotType,
                                            customSocialSlotsCount: e.customSocialSlotsCount,
                                            allowCopying: e.allowCopying,
                                            allowedGearTypes: e.allowedGearTypes,
                                            isAllGenresAllowed: e.isAllGenresAllowed
                                        }
                                    }(e._configuration)
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return ep(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v2PlacesPlaceIdPatch = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v2PlacesPlaceIdPatchRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t
        }(c._),
        eG = (function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            l(t, e), t.prototype.v2TeamtestPlaceIdDeleteRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new c.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling v2TeamtestPlaceIdDelete.");
                                if (null === e.gameId || void 0 === e.gameId) throw new c.w("gameId", "Required parameter requestParameters.gameId was null or undefined when calling v2TeamtestPlaceIdDelete.");
                                return n = {}, void 0 !== e.gameId && (n.gameId = e.gameId), r = {}, [4, this.request({
                                    path: "/v2/teamtest/{placeId}".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v2/teamtest/{placeId}",
                                    method: "DELETE",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s)]
                        }
                    })
                })
            }, t.prototype.v2TeamtestPlaceIdDelete = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v2TeamtestPlaceIdDeleteRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }
        }(c._), function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return l(t, e), t.prototype.v2UniversesUniverseIdConfigurationGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v2UniversesUniverseIdConfigurationGet.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v2/universes/{universeId}/configuration".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/universes/{universeId}/configuration",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return eg(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v2UniversesUniverseIdConfigurationGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v2UniversesUniverseIdConfigurationGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v2UniversesUniverseIdConfigurationPatchRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v2UniversesUniverseIdConfigurationPatch.");
                                if (null === e.model || void 0 === e.model) throw new c.w("model", "Required parameter requestParameters.model was null or undefined when calling v2UniversesUniverseIdConfigurationPatch.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v2/universes/{universeId}/configuration".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/universes/{universeId}/configuration",
                                    method: "PATCH",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            allowPrivateServers: e.allowPrivateServers,
                                            privateServerPrice: e.privateServerPrice,
                                            name: e.name,
                                            description: e.description,
                                            promotionalText: e.promotionalText,
                                            universeAvatarType: e.universeAvatarType,
                                            universeAnimationType: e.universeAnimationType,
                                            universeCollisionType: e.universeCollisionType,
                                            universeJointPositioningType: e.universeJointPositioningType,
                                            isArchived: e.isArchived,
                                            isFriendsOnly: e.isFriendsOnly,
                                            genre: e.genre,
                                            playableDevices: e.playableDevices,
                                            isForSale: e.isForSale,
                                            price: e.price,
                                            universeAvatarAssetOverrides: void 0 === e.universeAvatarAssetOverrides ? void 0 : e.universeAvatarAssetOverrides.map(ef),
                                            universeAvatarMinScales: ey(e.universeAvatarMinScales),
                                            universeAvatarMaxScales: ey(e.universeAvatarMaxScales),
                                            studioAccessToApisAllowed: e.studioAccessToApisAllowed,
                                            permissions: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    IsThirdPartyTeleportAllowed: e.isThirdPartyTeleportAllowed,
                                                    IsThirdPartyAssetAllowed: e.isThirdPartyAssetAllowed,
                                                    IsThirdPartyPurchaseAllowed: e.isThirdPartyPurchaseAllowed
                                                }
                                            }(e.permissions),
                                            optInRegions: e.optInRegions,
                                            optOutRegions: e.optOutRegions,
                                            isMeshTextureApiAccessAllowed: e.isMeshTextureApiAccessAllowed,
                                            fiatBasePriceId: e.fiatBasePriceId,
                                            fiatProductChangeType: e.fiatProductChangeType,
                                            audiences: e.audiences,
                                            demoModeEnabled: e.demoModeEnabled
                                        }
                                    }(e.model)
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return eg(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v2UniversesUniverseIdConfigurationPatch = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v2UniversesUniverseIdConfigurationPatchRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t
        }(c._)),
        eS = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return l(t, e), t.prototype.v2UniversesUniverseIdPlacesGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v2UniversesUniverseIdPlacesGet.");
                                return n = {}, void 0 !== e.extendedSettings && (n.extendedSettings = e.extendedSettings), void 0 !== e.sortOrder && (n.sortOrder = e.sortOrder), void 0 !== e.limit && (n.limit = e.limit), void 0 !== e.cursor && (n.cursor = e.cursor), r = {}, [4, this.request({
                                    path: "/v2/universes/{universeId}/places".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/universes/{universeId}/places",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s, function(e) {
                                    return null == e ? e : {
                                        previousPageCursor: (0, c.u)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                        nextPageCursor: (0, c.u)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                        data: (0, c.u)(e, "data") ? e.data : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v2UniversesUniverseIdPlacesGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v2UniversesUniverseIdPlacesGetRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.v2UniversesUniverseIdShutdownPostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var n, r, s;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v2UniversesUniverseIdShutdownPost.");
                                return n = {}, r = {}, [4, this.request({
                                    path: "/v2/universes/{universeId}/shutdown".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/universes/{universeId}/shutdown",
                                    method: "POST",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return s = i.sent(), [2, new c.H(s)]
                        }
                    })
                })
            }, t.prototype.v2UniversesUniverseIdShutdownPost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.v2UniversesUniverseIdShutdownPostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t
        }(c._);
    e.s(["S", 0, eq, "x", 0, eT, "K", 0, {
        None: "None",
        Activate: "Activate",
        Update: "Update",
        Deactivate: "Deactivate"
    }, "j", 0, eG, "G", 0, eS], 37603);
    var eC = e.i(213067),
        eD = e.i(272593),
        eM = e.i(227987),
        eE = ((t = eE || {})[t.UnknownError = 0] = "UnknownError", t[t.InvalidUniverse = 1] = "InvalidUniverse", t[t.NoRootPlace = 2] = "NoRootPlace", t[t.InvalidUniversePermissions = 3] = "InvalidUniversePermissions", t[t.InvalidRootPlace = 6] = "InvalidRootPlace", t[t.MaxPlacesReached = 7] = "MaxPlacesReached", t[t.CreatorAccountTooYoung = 16] = "CreatorAccountTooYoung", t);
    e.s(["f", 0, eE], 324562);
    var eH = ((n = {})[n.UnauthorizedRequest = 0] = "UnauthorizedRequest", n[n.NoPermission = 5] = "NoPermission", n[n.InvalidFormat = 1] = "InvalidFormat", n[n.FileNotPresent = 2] = "FileNotPresent", n[n.TargetItemInvalid = 4] = "TargetItemInvalid", n[n.UploadTooOften = 3] = "UploadTooOften", n),
        eN = ((r = {})[r.NoRootPlace = 5] = "NoRootPlace", r[r.UnauthorizedRequest = 0] = "UnauthorizedRequest", r[r.UnauthorizedToConfigureUniverse = 4] = "UnauthorizedToConfigureUniverse", r[r.UniverseDoesNotExist = 3] = "UniverseDoesNotExist", r);
    e.s(["D", () => eN, "N", () => eH], 368851);
    var eL = ((s = eL || {})[s.Unauthorized = 0] = "Unauthorized", s[s.NoPermission = 1] = "NoPermission", s[s.TitleTooLong = 2] = "TitleTooLong", s[s.TitleEmpty = 3] = "TitleEmpty", s[s.UrlEmpty = 4] = "UrlEmpty", s[s.UrlWrongFormat = 5] = "UrlWrongFormat", s[s.MalformedRequest = 6] = "MalformedRequest", s[s.LinkNotFound = 7] = "LinkNotFound", s[s.TypeInvalid = 8] = "TypeInvalid", s[s.RequestCannotBeProcessed = 10] = "RequestCannotBeProcessed", s[s.TitleModerated = 11] = "TitleModerated", s[s.InsufficientGroupPermission = 18] = "InsufficientGroupPermission", s);
    e.s(["f", 0, eL], 269780);
    var eV = ((i = eV || {})[i.UnknownError = 0] = "UnknownError", i[i.InvalidUniverse = 1] = "InvalidUniverse", i[i.InvalidUniversePermissions = 2] = "InvalidUniversePermissions", i[i.NameOrDescriptionRejected = 7] = "NameOrDescriptionRejected", i[i.NameTooLong = 8] = "NameTooLong", i[i.NoRootPlace = 12] = "NoRootPlace", i[i.MissingLuobuTerms = 29] = "MissingLuobuTerms", i[i.CreatorAccountTooYoung = 40] = "CreatorAccountTooYoung", i[i.PromotionalTextRejected = 52] = "PromotionalTextRejected", i[i.PromotionalTextSafetyUnavailable = 53] = "PromotionalTextSafetyUnavailable", i);
    e.s(["f", 0, eV], 858832);
    var ex = ((a = ex || {})[a.UnknownError = 0] = "UnknownError", a[a.InvalidUniverse = 2] = "InvalidUniverse", a[a.NoRootPlace = 3] = "NoRootPlace", a[a.UpdatedTooOften = 5] = "UpdatedTooOften", a);
    e.s(["f", 0, ex], 570006);
    var eF = ((o = eF || {}).User = "User", o.Group = "Group", o.Team = "Team", o),
        eO = ((u = eO || {}).GameName = "GameName", u.GameCreated = "GameCreated", u.LastUpdated = "LastUpdated", u);
    let ek = new class {
        async isUserEmailVerified() {
            return !!(await this.userApi.v1UserIsVerifiedCreatorGet()).isVerifiedCreator
        }
        getGroups() {
            return this.userApi.v1UserGroupsCanmanageGet()
        }
        getGroupsPlusManageItems() {
            return this.userApi.v1UserGroupsCanmanagegamesoritemsGet()
        }
        getGroupUniverses(e, t, n, r, s) {
            let i = {
                groupId: e,
                isArchived: t,
                sortOrder: n && Z[n],
                limit: r,
                cursor: s
            };
            return this.groupsApi.v1GroupsGroupIdUniversesGet(i)
        }
        getUserUniverses(e, t, n, r) {
            let s = {
                isArchived: e,
                sortOrder: t && el[t],
                limit: n,
                cursor: r
            };
            return this.userApi.v1UserUniversesGet(s)
        }
        getStatMetadata() {
            return this.statisticsApi.v1StatsCreatorDashboardMetadataGet()
        }
        getUniverseDetails(e) {
            return this.universesApi.v1UniversesUniverseIdGet({
                universeId: e
            })
        }
        async getUniversesDetails(e) {
            var t;
            return 0 === e.length ? {
                data: []
            } : {
                data: null != (t = (await this.universesApi.v1UniversesMultigetGet({
                    ids: e
                })).data) ? t : []
            }
        }
        getUniversePermissions(e) {
            return this.universesApi.v1UniversesUniverseIdPermissionsGet({
                universeId: e
            })
        }
        getPlaceMedia(e) {
            return this.placesApi.v1PlacesPlaceIdMediaGet({
                placeId: e
            })
        }
        getPlacesOfUniverse(e, t, n, r) {
            let s = arguments.length > 4 && void 0 !== arguments[4] && arguments[4];
            return this.universesApi.v1UniversesUniverseIdPlacesGet({
                universeId: e,
                sortOrder: t,
                limit: n,
                cursor: r,
                isUniverseCreation: s
            })
        }
        async getActivationEligibilityForUniverse(e) {
            return this.universesApi.v1UniversesUniverseIdActivationEligibilityGet({
                universeId: e
            })
        }
        async getActivationEligibilityForUser() {
            return this.universesApi.v1UniversesUserPublicPublishEligibilityGet()
        }
        getFilteredDevices(e) {
            return this.placesApi.v1PlacesPlaceIdCompatibilitiesGet({
                placeId: e
            })
        }
        getLiveStats(e) {
            return this.universesApi.v1UniversesUniverseIdLiveStatsGet({
                universeId: e
            })
        }
        getHistoricalData(e, t, n, r) {
            return this.statisticsApi.v1PlacesPlaceIdStatsTypeGet({
                placeId: e,
                type: t,
                granularity: n,
                divisionType: r
            })
        }
        getHistoricalDataAgeAvailable(e) {
            return this.statisticsApi.v1PlacesPlaceIdStatsIsAgeDataAvailableGet({
                placeId: e
            })
        }
        getUniverseConfiguration(e) {
            return this.universeSettingsApi.v1UniversesUniverseIdConfigurationGet({
                universeId: e
            })
        }
        getUniverseConfigurationV2(e) {
            return this.universeSettingsApi.v1UniversesUniverseIdConfigurationGet({
                universeId: e
            })
        }
        getPlaytesters(e) {
            return this.universeSettingsApi.v1UniversesUniverseIdConfigurationPlaytestersGet({
                universeId: e
            })
        }
        removePlaytesters(e, t) {
            return this.universeSettingsApi.v1UniversesUniverseIdConfigurationPlaytestersDelete({
                universeId: e,
                request: {
                    playtesters: t
                }
            })
        }
        setUniverseConfiguration(e, t) {
            return this.universeSettingsApi.v1UniversesUniverseIdConfigurationPatch({
                universeId: e,
                model: {
                    isArchived: t
                }
            })
        }
        setUniverseConfigurationV2(e, t, n, r, s, i, a, o, u, d, c, v, l, h, p, I) {
            return this.universeSettingsApiV2.v2UniversesUniverseIdConfigurationPatch({
                universeId: e,
                model: {
                    name: t,
                    description: n,
                    studioAccessToApisAllowed: r,
                    isMeshTextureApiAccessAllowed: s,
                    allowPrivateServers: i,
                    privateServerPrice: a,
                    isFriendsOnly: o,
                    playableDevices: u,
                    isForSale: d,
                    price: c,
                    fiatBasePriceId: v,
                    fiatProductChangeType: l,
                    audiences: h,
                    demoModeEnabled: p,
                    promotionalText: I
                }
            })
        }
        async shutDownAllServers(e) {
            try {
                await this.universesApiV2.v2UniversesUniverseIdShutdownPost({
                    universeId: e
                })
            } catch (t) {
                let e = await (0, eM.f)(t);
                if (e) throw new eC.f(e.code, e.message);
                throw t
            }
        }
        async archiveAsset(e) {
            await this.assetsApi.v1AssetsAssetIdArchivePost({
                assetId: e
            })
        }
        async restoreAsset(e) {
            await this.assetsApi.v1AssetsAssetIdRestorePost({
                assetId: e
            })
        }
        async activateGame(e) {
            await this.universesApi.v1UniversesUniverseIdActivatePost({
                universeId: e
            })
        }
        async deactivateGame(e) {
            await this.universesApi.v1UniversesUniverseIdDeactivatePost({
                universeId: e
            })
        }
        getDeveloperProductAggregationByTimeFrame(e, t) {
            return this.statisticsApi.v1PlacesPlaceIdStatsDeveloperProductAggregationGet({
                placeId: e,
                timeFrame: ea[t]
            })
        }
        searchUniverses(e, t, n, r, s, i, a, o, u) {
            let d = "";
            void 0 !== t && (d += t), void 0 !== r && (d += " archived:".concat(r ? "True" : "False")), void 0 !== s && (d += " active:".concat(s ? "True" : "False")), d += " creator:".concat(e), e === eF.Group && void 0 !== n && (d += " groups:".concat(n));
            let c = [];
            if (void 0 !== i) {
                let e = a === er.Desc ? "-" : "+";
                c.push(e + i)
            }
            return this.searchApi.v1SearchUniversesGet({
                q: d,
                sort: c,
                sortOrder: a && er[a],
                limit: o,
                cursor: u
            })
        }
        async getAssetDetails(e) {
            return 0 === e.length ? {
                data: []
            } : this.assetsApi.v1AssetsGet({
                assetIds: e
            })
        }
        async updateAsset(e, t) {
            try {
                await this.assetsApi.v1AssetsAssetIdPatch({
                    assetId: e,
                    request: t
                })
            } catch (t) {
                let e = await (0, eM.f)(t);
                if (e) throw new eC.f(e.code, e.message);
                throw t
            }
        }
        getSocialLinkMetadata(e) {
            return this.socialLinksApi.v1UniversesUniverseIdSocialLinksMetadataGet({
                universeId: e
            })
        }
        deleteSocialLink(e, t) {
            return this.socialLinksApi.v1UniversesUniverseIdSocialLinksSocialLinkIdDelete({
                universeId: e,
                socialLinkId: t
            })
        }
        saveSocialLink(e, t, n, r) {
            return this.socialLinksApi.v1UniversesUniverseIdSocialLinksPost({
                universeId: e,
                request: {
                    type: t,
                    url: n,
                    title: r
                }
            })
        }
        updateSocialLink(e, t, n, r, s) {
            return this.socialLinksApi.v1UniversesUniverseIdSocialLinksSocialLinkIdPatch({
                universeId: e,
                socialLinkId: t,
                request: {
                    type: n,
                    url: r,
                    title: s
                }
            })
        }
        async getPlaceDetailInfo(e, t) {
            try {
                return await this.placesApiV2.v2PlacesPlaceIdGet(e, t)
            } catch (t) {
                let e = await (0, eM.f)(t);
                if (e) throw new eC.f(e.code, e.message);
                throw t
            }
        }
        async patchPlaceConfigurationInfo(e, t) {
            try {
                return await this.placesApiV2.v2PlacesPlaceIdPatch(e, t)
            } catch (t) {
                let e = await (0, eM.f)(t);
                if (e) throw new eC.f(e.code, e.message);
                throw t
            }
        }
        async uploadAutoGeneratedThumbnail(e) {
            return this.thumbnailsApi.v1UniversesUniverseIdThumbnailsAutoGeneratedPost({
                universeId: e
            })
        }
        async updateThumbnailAltText(e, t, n) {
            return this.thumbnailsApi.v1UniversesUniverseIdThumbnailsAltTextPost({
                universeId: e,
                request: {
                    mediaAssetId: t,
                    mediaAssetAltText: n
                }
            })
        }
        async getGenresList(e) {
            try {
                return await this.assetsApi.v1AssetsGenresGet(e)
            } catch (t) {
                let e = await (0, eM.f)(t);
                if (e) throw new eC.f(e.code, e.message);
                throw t
            }
        }
        async setUniverseIcon(e, t) {
            try {
                await this.iconApi.v1UniversesUniverseIdIconPost({
                    universeId: e,
                    request: {
                        iconType: t
                    }
                })
            } catch (t) {
                let e = await (0, eM.f)(t);
                if (e) throw new eC.f(e.code, e.message);
                throw t
            }
        }
        async reorderThumbnails(e, t) {
            return this.thumbnailsApi.v1UniversesUniverseIdThumbnailsOrderPost({
                universeId: e,
                request: {
                    thumbnailIds: t
                }
            })
        }
        async deleteThumbnail(e, t) {
            return this.thumbnailsApi.v1UniversesUniverseIdThumbnailsThumbnailIdDelete({
                universeId: e,
                thumbnailId: t
            })
        }
        async getUniverseConfigurationVIPServer(e, t) {
            try {
                return await this.universeSettingsApi.v1UniversesUniverseIdConfigurationVipServersGet({
                    universeId: e
                }, t)
            } catch (t) {
                let e = await (0, eM.f)(t);
                if (e) throw new eC.f(e.code, e.message);
                throw t
            }
        }
        async getAssetPublishedVersions(e, t, n, r) {
            try {
                return await this.assetsApi.v1AssetsAssetIdPublishedVersionsGet({
                    assetId: e,
                    sortOrder: t,
                    limit: n,
                    cursor: r
                })
            } catch (t) {
                let e = await (0, eM.f)(t);
                if (e) throw new eC.f(e.code, e.message);
                throw t
            }
        }
        async postAssetPublishedVersions(e, t) {
            try {
                return await this.assetsApi.v1AssetsAssetIdRevertVersionPost({
                    assetId: e,
                    assetVersionNumber: t
                })
            } catch (t) {
                let e = await (0, eM.f)(t);
                if (e) throw new eC.f(e.code, e.message);
                throw t
            }
        }
        async patchAssetConfiguration(e, t) {
            try {
                return await this.assetsApi.v1AssetsAssetIdPatch({
                    assetId: e,
                    request: t
                })
            } catch (t) {
                let e = await (0, eM.f)(t);
                if (e) throw new eC.f(e.code, e.message);
                throw t
            }
        }
        async getAssetSavedVersions(e, t, n, r) {
            try {
                return await this.assetsApi.v1AssetsAssetIdSavedVersionsGet({
                    assetId: e,
                    sortOrder: t,
                    limit: n,
                    cursor: r
                })
            } catch (t) {
                let e = await (0, eM.f)(t);
                if (e) throw new eC.f(e.code, e.message);
                throw t
            }
        }
        async postAssetRevertVersion(e, t) {
            try {
                return await this.assetsApi.v1AssetsAssetIdRevertVersionPost({
                    assetId: e,
                    assetVersionNumber: t
                })
            } catch (t) {
                let e = await (0, eM.f)(t);
                if (e) throw new eC.f(e.code, e.message);
                throw t
            }
        }
        async getUserUniversePermissions(e) {
            return this.universesApi.v1UniversesMultigetPermissionsGet({
                ids: e
            })
        }
        async toggleTeamCreate(e, t) {
            try {
                await this.teamCreateApi.v1UniversesUniverseIdTeamcreatePatch({
                    universeId: e,
                    request: {
                        isEnabled: t
                    }
                })
            } catch (t) {
                let e = await (0, eM.f)(t);
                if (e) throw new eC.f(e.code, e.message);
                throw t
            }
        }
        constructor() {
            (0, d._)(this, "assetsApi", void 0), (0, d._)(this, "groupsApi", void 0), (0, d._)(this, "placesApi", void 0), (0, d._)(this, "searchApi", void 0), (0, d._)(this, "statisticsApi", void 0), (0, d._)(this, "universesApi", void 0), (0, d._)(this, "universesApiV2", void 0), (0, d._)(this, "universeSettingsApi", void 0), (0, d._)(this, "universeSettingsApiV2", void 0), (0, d._)(this, "userApi", void 0), (0, d._)(this, "socialLinksApi", void 0), (0, d._)(this, "placesApiV2", void 0), (0, d._)(this, "thumbnailsApi", void 0), (0, d._)(this, "iconApi", void 0), (0, d._)(this, "teamCreateApi", void 0);
            let e = (0, eD.f)("develop", "bedev1");
            this.assetsApi = new Q(e), this.groupsApi = new X(e), this.placesApi = new et(e), this.searchApi = new en(e), this.statisticsApi = new ei(e), this.universesApi = new ec(e), this.universesApiV2 = new eS(e), this.universeSettingsApi = new ed(e), this.universeSettingsApiV2 = new eG(e), this.userApi = new ev(e), this.socialLinksApi = new es(e), this.placesApiV2 = new eT(e), this.thumbnailsApi = new eu(e), this.iconApi = new ee(e), this.teamCreateApi = new eo(e)
        }
    };
    e.s(["f", 0, ek], 773057)
}, 213067, e => {
    "use strict";
    var t = e.i(805290);
    e.s(["f", 0, class e extends Error {
        constructor(n, r = "") {
            super("Generic BEDEV1 Error"), (0, t._)(this, "code", void 0), (0, t._)(this, "message", void 0), this.code = n, this.message = r, Error.captureStackTrace && Error.captureStackTrace(this, e)
        }
    }])
}, 227987, e => {
    "use strict";
    var t = e.i(185915);
    async function n(e) {
        try {
            let n = (0, t.f)(e);
            if (n) {
                let e = await n.json();
                if (e.errors.length > 0) {
                    let t = e.errors[0];
                    if (t) return {
                        status: n.status,
                        code: t.code,
                        message: t.message,
                        userFacingMessage: t.userFacingMessage,
                        fieldData: t.fieldData,
                        allErrors: e.errors.map(e => ({
                            code: e.code,
                            message: e.message,
                            userFacingMessage: e.userFacingMessage,
                            fieldData: e.fieldData
                        }))
                    }
                }
            }
            return null
        } catch (e) {
            return null
        }
    }
    e.s(["f", 0, n])
}]);

//# debugId=9c59be0f-8c7d-4235-b4a8-aa05114160de
//# sourceMappingURL=1zd-nch9-8tvu.js.map