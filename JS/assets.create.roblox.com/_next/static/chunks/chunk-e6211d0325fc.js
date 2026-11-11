;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "8808a2fb-30b9-63b4-7266-ca69bc3d733f")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 730530, e => {
    "use strict";
    let t = e => e;
    e.s(["i", 0, e => t(e), "q", 0, t, "t", 0, e => {
        let {
            translateHTML: t
        } = e;
        return (e, s, r) => {
            let {
                key: n
            } = e;
            return t(n, s, r)
        }
    }, "O", 0, e => {
        let {
            translate: t
        } = e;
        return (e, s) => {
            let {
                key: r
            } = e;
            return t(r, s)
        }
    }, "Q", 0, (e, t) => ({
        key: e,
        namespace: t
    }), "o", 0, e => ({
        key: e,
        namespace: void 0
    })])
}, 773057, 587694, 37603, 324562, 368851, 269780, 858832, 570006, e => {
    "use strict";
    var t, s, r, n, i, a, o, u, d = e.i(805290),
        c = e.i(415858),
        l = function(e, t) {
            return (l = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var s in t) Object.prototype.hasOwnProperty.call(t, s) && (e[s] = t[s])
            })(e, t)
        };

    function v(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function s() {
            this.constructor = e
        }
        l(e, t), e.prototype = null === t ? Object.create(t) : (s.prototype = t.prototype, new s)
    }

    function h(e, t, s, r) {
        return new(s || (s = Promise))(function(n, i) {
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
                e.done ? n(e.value) : ((t = e.value) instanceof s ? t : new s(function(e) {
                    e(t)
                })).then(a, o)
            }
            u((r = r.apply(e, t || [])).next())
        })
    }

    function p(e, t) {
        var s, r, n, i = {
                label: 0,
                sent: function() {
                    if (1 & n[0]) throw n[1];
                    return n[1]
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
                if (s) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, d[0] && (i = 0)), i;) try {
                    if (s = 1, r && (n = 2 & d[0] ? r.return : d[0] ? r.throw || ((n = r.return) && n.call(r), 0) : r.next) && !(n = n.call(r, d[1])).done) return n;
                    switch (r = 0, n && (d = [2 & d[0], n.value]), d[0]) {
                        case 0:
                        case 1:
                            n = d;
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
                            if (!(n = (n = i.trys).length > 0 && n[n.length - 1]) && (6 === d[0] || 2 === d[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === d[0] && (!n || d[1] > n[0] && d[1] < n[3])) {
                                i.label = d[1];
                                break
                            }
                            if (6 === d[0] && i.label < n[1]) {
                                i.label = n[1], n = d;
                                break
                            }
                            if (n && i.label < n[2]) {
                                i.label = n[2], i.ops.push(d);
                                break
                            }
                            n[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    d = t.call(e, i)
                } catch (e) {
                    d = [6, e], r = 0
                } finally {
                    s = n = 0
                }
                if (5 & d[0]) throw d[1];
                return {
                    value: d[0] ? d[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function m(e) {
        var t, s;
        return null == (t = e) ? t : {
            id: (0, c.u)(t, "id") ? t.id : void 0,
            type: (0, c.u)(t, "type") ? t.type : void 0,
            typeId: (0, c.u)(t, "typeId") ? t.typeId : void 0,
            name: (0, c.u)(t, "name") ? t.name : void 0,
            description: (0, c.u)(t, "description") ? t.description : void 0,
            creator: (0, c.u)(t, "creator") ? null == (s = t.creator) ? s : {
                type: (0, c.u)(s, "type") ? s.type : void 0,
                typeId: (0, c.u)(s, "typeId") ? s.typeId : void 0,
                targetId: (0, c.u)(s, "targetId") ? s.targetId : void 0
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

    function f(e) {
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

    function I(e) {
        var t;
        return null == (t = e) ? t : {
            assetId: (0, c.u)(t, "assetId") ? t.assetId : void 0,
            versionNumber: (0, c.u)(t, "versionNumber") ? t.versionNumber : void 0,
            status: (0, c.u)(t, "status") ? t.status : void 0
        }
    }

    function w(e) {
        if (void 0 !== e) return null === e ? null : {
            name: e.name,
            type: e.type,
            targetId: e.targetId
        }
    }

    function U(e) {
        var t;
        return null == (t = e) ? t : {
            developerProductName: (0, c.u)(t, "developerProductName") ? t.developerProductName : void 0,
            revenueAmount: (0, c.u)(t, "revenueAmount") ? t.revenueAmount : void 0
        }
    }

    function P(e) {
        var t;
        return null == (t = e) ? t : {
            universeId: (0, c.u)(t, "universeId") ? t.universeId : void 0,
            yearDashMonth: (0, c.u)(t, "yearDashMonth") ? t.yearDashMonth : void 0,
            status: (0, c.u)(t, "status") ? t.status : void 0,
            spreadsheetId: (0, c.u)(t, "spreadsheetId") ? t.spreadsheetId : void 0
        }
    }

    function y(e) {
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

    function g(e) {
        var t;
        return null == (t = e) ? t : {
            gameTemplateType: (0, c.u)(t, "gameTemplateType") ? t.gameTemplateType : void 0,
            hasTutorials: (0, c.u)(t, "hasTutorials") ? t.hasTutorials : void 0,
            universe: (0, c.u)(t, "universe") ? y(t.universe) : void 0
        }
    }

    function A(e) {
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

    function b(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, c.u)(t, "id") ? t.id : void 0,
            name: (0, c.u)(t, "name") ? t.name : void 0
        }
    }

    function R(e) {
        var t;
        return null == (t = e) ? t : {
            month: (0, c.u)(t, "month") ? t.month : void 0,
            year: (0, c.u)(t, "year") ? t.year : void 0,
            revenueReportStatus: (0, c.u)(t, "RevenueReportStatus") ? t.RevenueReportStatus : void 0
        }
    }

    function T(e) {
        var t;
        return null == (t = e) ? t : {
            status: (0, c.u)(t, "status") ? t.status : void 0,
            platformName: (0, c.u)(t, "platformName") ? t.platformName : void 0,
            crashRatePercentage: (0, c.u)(t, "crashRatePercentage") ? t.crashRatePercentage : void 0
        }
    }

    function q(e) {
        if (void 0 !== e) return null === e ? null : {
            name: e.name,
            description: e.description
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function S(e, t) {
        return null == e ? e : {
            id: (0, c.u)(e, "id") ? e.id : void 0,
            universeId: (0, c.u)(e, "universeId") ? e.universeId : void 0,
            name: (0, c.u)(e, "name") ? e.name : void 0,
            description: (0, c.u)(e, "description") ? e.description : void 0
        }
    }

    function G(e) {
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

    function E(e) {
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

    function L(e) {
        var t;
        return null == (t = e) ? t : {
            assetId: (0, c.u)(t, "assetId") ? t.assetId : void 0,
            isEndorsed: (0, c.u)(t, "isEndorsed") ? t.isEndorsed : void 0
        }
    }

    function M(e) {
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

    function k(e) {
        var t;
        return null == (t = e) ? t : {
            type: (0, c.u)(t, "type") ? t.type : void 0,
            data: (0, c.u)(t, "data") ? t.data : void 0
        }
    }

    function H(e) {
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

    function N(e, t) {
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

    function F(e) {
        if (void 0 !== e) return null === e ? null : {
            isEnabled: e.isEnabled
        }
    }

    function O(e) {
        var t;
        return null == (t = e) ? t : {
            buildersClubMembershipType: (0, c.u)(t, "buildersClubMembershipType") ? t.buildersClubMembershipType : void 0,
            userId: (0, c.u)(t, "userId") ? t.userId : void 0,
            username: (0, c.u)(t, "username") ? t.username : void 0,
            displayName: (0, c.u)(t, "displayName") ? t.displayName : void 0
        }
    }

    function B(e) {
        if (void 0 !== e) return null === e ? null : {
            type: e.type,
            url: e.url,
            title: e.title
        }
    }

    function _(e) {
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

    function J(e, t) {
        return null == e ? e : {
            data: (0, c.u)(e, "data") ? e.data.map(b) : void 0
        }
    }

    function X(e, t) {
        return null == e ? e : {
            previousPageCursor: (0, c.u)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
            nextPageCursor: (0, c.u)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
            data: (0, c.u)(e, "data") ? e.data.map(f) : void 0
        }
    }

    function z(e, t) {
        return null == e ? e : {
            previousPageCursor: (0, c.u)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
            nextPageCursor: (0, c.u)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
            data: (0, c.u)(e, "data") ? e.data.map(y) : void 0
        }
    }
    var W = c._;

    function K() {
        return null !== W && W.apply(this, arguments) || this
    }
    v(K, W), K.prototype.v1UniversesUniverseIdAliasesNameDeleteRaw = function(e, t) {
        return h(this, void 0, void 0, function() {
            var s, r, n;
            return p(this, function(i) {
                switch (i.label) {
                    case 0:
                        if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdAliasesNameDelete.");
                        if (null === e.name || void 0 === e.name) throw new c.w("name", "Required parameter requestParameters.name was null or undefined when calling v1UniversesUniverseIdAliasesNameDelete.");
                        return s = {}, r = {}, [4, this.request({
                            path: "/v1/universes/{universeId}/aliases/{name}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("name", "}"), encodeURIComponent(String(e.name))),
                            schemaPath: "/v1/universes/{universeId}/aliases/{name}",
                            method: "DELETE",
                            headers: r,
                            query: s
                        }, t)];
                    case 1:
                        return n = i.sent(), [2, new c.H(n)]
                }
            })
        })
    }, K.prototype.v1UniversesUniverseIdAliasesNameDelete = function(e, t) {
        return h(this, void 0, void 0, function() {
            return p(this, function(s) {
                switch (s.label) {
                    case 0:
                        return [4, this.v1UniversesUniverseIdAliasesNameDeleteRaw(e, t)];
                    case 1:
                        return [4, s.sent().value()];
                    case 2:
                        return [2, s.sent()]
                }
            })
        })
    }, K.prototype.v1UniversesUniverseIdAliasesNamePatchRaw = function(e, t) {
        return h(this, void 0, void 0, function() {
            var s, r, n;
            return p(this, function(i) {
                switch (i.label) {
                    case 0:
                        if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdAliasesNamePatch.");
                        if (null === e.name || void 0 === e.name) throw new c.w("name", "Required parameter requestParameters.name was null or undefined when calling v1UniversesUniverseIdAliasesNamePatch.");
                        if (null === e.request || void 0 === e.request) throw new c.w("request", "Required parameter requestParameters.request was null or undefined when calling v1UniversesUniverseIdAliasesNamePatch.");
                        return s = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                            path: "/v1/universes/{universeId}/aliases/{name}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("name", "}"), encodeURIComponent(String(e.name))),
                            schemaPath: "/v1/universes/{universeId}/aliases/{name}",
                            method: "PATCH",
                            headers: r,
                            query: s,
                            body: w(e.request)
                        }, t)];
                    case 1:
                        return n = i.sent(), [2, new c.H(n)]
                }
            })
        })
    }, K.prototype.v1UniversesUniverseIdAliasesNamePatch = function(e, t) {
        return h(this, void 0, void 0, function() {
            return p(this, function(s) {
                switch (s.label) {
                    case 0:
                        return [4, this.v1UniversesUniverseIdAliasesNamePatchRaw(e, t)];
                    case 1:
                        return [4, s.sent().value()];
                    case 2:
                        return [2, s.sent()]
                }
            })
        })
    }, K.prototype.v1UniversesUniverseIdAliasesPostRaw = function(e, t) {
        return h(this, void 0, void 0, function() {
            var s, r, n;
            return p(this, function(i) {
                switch (i.label) {
                    case 0:
                        if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdAliasesPost.");
                        if (null === e.request || void 0 === e.request) throw new c.w("request", "Required parameter requestParameters.request was null or undefined when calling v1UniversesUniverseIdAliasesPost.");
                        return s = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                            path: "/v1/universes/{universeId}/aliases".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                            schemaPath: "/v1/universes/{universeId}/aliases",
                            method: "POST",
                            headers: r,
                            query: s,
                            body: w(e.request)
                        }, t)];
                    case 1:
                        return n = i.sent(), [2, new c.H(n)]
                }
            })
        })
    }, K.prototype.v1UniversesUniverseIdAliasesPost = function(e, t) {
        return h(this, void 0, void 0, function() {
            return p(this, function(s) {
                switch (s.label) {
                    case 0:
                        return [4, this.v1UniversesUniverseIdAliasesPostRaw(e, t)];
                    case 1:
                        return [4, s.sent().value()];
                    case 2:
                        return [2, s.sent()]
                }
            })
        })
    };
    var Z = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return v(t, e), t.prototype.v1AssetsAssetIdArchivePostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new c.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdArchivePost.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}/archive".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/archive",
                                    method: "POST",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n)]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdArchivePost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1AssetsAssetIdArchivePostRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdLatestSavedVersionGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new c.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdLatestSavedVersionGet.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}/latest-saved-version".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/latest-saved-version",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return f(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdLatestSavedVersionGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1AssetsAssetIdLatestSavedVersionGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdPatchRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new c.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdPatch.");
                                if (null === e.request || void 0 === e.request) throw new c.w("request", "Required parameter requestParameters.request was null or undefined when calling v1AssetsAssetIdPatch.");
                                return s = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/assets/{assetId}".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}",
                                    method: "PATCH",
                                    headers: r,
                                    query: s,
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
                                return n = i.sent(), [2, new c.H(n)]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdPatch = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1AssetsAssetIdPatchRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdPublishedVersionsGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new c.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdPublishedVersionsGet.");
                                return s = {}, void 0 !== e.sortOrder && (s.sortOrder = e.sortOrder), void 0 !== e.limit && (s.limit = e.limit), void 0 !== e.cursor && (s.cursor = e.cursor), r = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}/published-versions".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/published-versions",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return X(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdPublishedVersionsGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1AssetsAssetIdPublishedVersionsGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdRestorePostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new c.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdRestorePost.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}/restore".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/restore",
                                    method: "POST",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n)]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdRestorePost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1AssetsAssetIdRestorePostRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdRevertVersionPostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new c.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdRevertVersionPost.");
                                if (null === e.assetVersionNumber || void 0 === e.assetVersionNumber) throw new c.w("assetVersionNumber", "Required parameter requestParameters.assetVersionNumber was null or undefined when calling v1AssetsAssetIdRevertVersionPost.");
                                return s = {}, void 0 !== e.assetVersionNumber && (s.assetVersionNumber = e.assetVersionNumber), r = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}/revert-version".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/revert-version",
                                    method: "POST",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n)]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdRevertVersionPost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1AssetsAssetIdRevertVersionPostRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdSavedVersionsGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new c.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdSavedVersionsGet.");
                                return s = {}, void 0 !== e.limit && (s.limit = e.limit), void 0 !== e.cursor && (s.cursor = e.cursor), void 0 !== e.sortOrder && (s.sortOrder = e.sortOrder), r = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}/saved-versions".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/saved-versions",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return X(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdSavedVersionsGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1AssetsAssetIdSavedVersionsGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdVersionsGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new c.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdVersionsGet.");
                                return s = {}, void 0 !== e.page && (s.page = e.page), r = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (r["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                    path: "/v1/assets/{assetId}/versions".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/assets/{assetId}/versions",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n)]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdVersionsGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1AssetsAssetIdVersionsGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdVersionsVersionNumberGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new c.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1AssetsAssetIdVersionsVersionNumberGet.");
                                if (null === e.versionNumber || void 0 === e.versionNumber) throw new c.w("versionNumber", "Required parameter requestParameters.versionNumber was null or undefined when calling v1AssetsAssetIdVersionsVersionNumberGet.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/assets/{assetId}/versions/{versionNumber}".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))).replace("{".concat("versionNumber", "}"), encodeURIComponent(String(e.versionNumber))),
                                    schemaPath: "/v1/assets/{assetId}/versions/{versionNumber}",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return f(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1AssetsAssetIdVersionsVersionNumberGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1AssetsAssetIdVersionsVersionNumberGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1AssetsEndorsedGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetIds || void 0 === e.assetIds) throw new c.w("assetIds", "Required parameter requestParameters.assetIds was null or undefined when calling v1AssetsEndorsedGet.");
                                return s = {}, e.assetIds && (s.assetIds = e.assetIds.join(c.G.csv)), r = {}, [4, this.request({
                                    path: "/v1/assets/endorsed",
                                    schemaPath: "/v1/assets/endorsed",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return null == e ? e : {
                                        data: (0, c.u)(e, "data") ? e.data.map(L) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1AssetsEndorsedGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1AssetsEndorsedGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1AssetsGenresGetRaw = function(e) {
                return h(this, void 0, void 0, function() {
                    var t, s, r;
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return t = {}, s = {}, [4, this.request({
                                    path: "/v1/assets/genres",
                                    schemaPath: "/v1/assets/genres",
                                    method: "GET",
                                    headers: s,
                                    query: t
                                }, e)];
                            case 1:
                                return r = n.sent(), [2, new c.H(r, function(e) {
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
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetIds || void 0 === e.assetIds) throw new c.w("assetIds", "Required parameter requestParameters.assetIds was null or undefined when calling v1AssetsGet.");
                                return s = {}, e.assetIds && (s.assetIds = e.assetIds.join(c.G.csv)), r = {}, [4, this.request({
                                    path: "/v1/assets",
                                    schemaPath: "/v1/assets",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return null == e ? e : {
                                        data: (0, c.u)(e, "data") ? e.data.map(m) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1AssetsGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
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
            }, t.prototype.v1AssetsLatestVersionsPostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.request || void 0 === e.request) throw new c.w("request", "Required parameter requestParameters.request was null or undefined when calling v1AssetsLatestVersionsPost.");
                                return s = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/assets/latest-versions",
                                    schemaPath: "/v1/assets/latest-versions",
                                    method: "POST",
                                    headers: r,
                                    query: s,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            assetIds: e.assetIds,
                                            versionStatus: e.versionStatus
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return null == e ? e : {
                                        results: (0, c.u)(e, "results") ? e.results.map(I) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1AssetsLatestVersionsPost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1AssetsLatestVersionsPostRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1AssetsVotingGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.assetIds || void 0 === e.assetIds) throw new c.w("assetIds", "Required parameter requestParameters.assetIds was null or undefined when calling v1AssetsVotingGet.");
                                return s = {}, e.assetIds && (s.assetIds = e.assetIds.join(c.G.csv)), r = {}, [4, this.request({
                                    path: "/v1/assets/voting",
                                    schemaPath: "/v1/assets/voting",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return null == e ? e : {
                                        data: (0, c.u)(e, "data") ? e.data.map(E) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1AssetsVotingGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1AssetsVotingGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t
        }(c._),
        Q = (function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            v(t, e), t.prototype.v1GametemplatesGetRaw = function(e) {
                return h(this, void 0, void 0, function() {
                    var t, s, r;
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return t = {}, s = {}, [4, this.request({
                                    path: "/v1/gametemplates",
                                    schemaPath: "/v1/gametemplates",
                                    method: "GET",
                                    headers: s,
                                    query: t
                                }, e)];
                            case 1:
                                return r = n.sent(), [2, new c.H(r, function(e) {
                                    return null == e ? e : {
                                        data: (0, c.u)(e, "data") ? e.data.map(g) : void 0
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
            v(t, e), t.prototype.v1GameUpdateNotificationsFilterPostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.gameUpdateText || void 0 === e.gameUpdateText) throw new c.w("gameUpdateText", "Required parameter requestParameters.gameUpdateText was null or undefined when calling v1GameUpdateNotificationsFilterPost.");
                                return s = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/gameUpdateNotifications/filter",
                                    schemaPath: "/v1/gameUpdateNotifications/filter",
                                    method: "POST",
                                    headers: r,
                                    query: s,
                                    body: e.gameUpdateText
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
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
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1GameUpdateNotificationsFilterPostRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1GameUpdateNotificationsUniverseIdGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1GameUpdateNotificationsUniverseIdGet.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/gameUpdateNotifications/{universeId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/gameUpdateNotifications/{universeId}",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return e.map(A)
                                })]
                        }
                    })
                })
            }, t.prototype.v1GameUpdateNotificationsUniverseIdGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1GameUpdateNotificationsUniverseIdGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1GameUpdateNotificationsUniverseIdPostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1GameUpdateNotificationsUniverseIdPost.");
                                if (null === e.gameUpdateText || void 0 === e.gameUpdateText) throw new c.w("gameUpdateText", "Required parameter requestParameters.gameUpdateText was null or undefined when calling v1GameUpdateNotificationsUniverseIdPost.");
                                return s = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/gameUpdateNotifications/{universeId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/gameUpdateNotifications/{universeId}",
                                    method: "POST",
                                    headers: r,
                                    query: s,
                                    body: e.gameUpdateText
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return A(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1GameUpdateNotificationsUniverseIdPost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1GameUpdateNotificationsUniverseIdPostRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }
        }(c._), function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return v(t, e), t.prototype.v1GroupsGroupIdUniversesGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.groupId || void 0 === e.groupId) throw new c.w("groupId", "Required parameter requestParameters.groupId was null or undefined when calling v1GroupsGroupIdUniversesGet.");
                                return s = {}, void 0 !== e.isArchived && (s.isArchived = e.isArchived), void 0 !== e.sortOrder && (s.sortOrder = e.sortOrder), void 0 !== e.limit && (s.limit = e.limit), void 0 !== e.cursor && (s.cursor = e.cursor), r = {}, [4, this.request({
                                    path: "/v1/groups/{groupId}/universes".replace("{".concat("groupId", "}"), encodeURIComponent(String(e.groupId))),
                                    schemaPath: "/v1/groups/{groupId}/universes",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return z(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1GroupsGroupIdUniversesGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1GroupsGroupIdUniversesGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t
        }(c._)),
        $ = {
            Asc: "Asc",
            Desc: "Desc"
        },
        ee = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return v(t, e), t.prototype.v1UniversesUniverseIdIconGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdIconGet.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/icon".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/icon",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
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
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdIconGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdIconPostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdIconPost.");
                                if (null === e.request || void 0 === e.request) throw new c.w("request", "Required parameter requestParameters.request was null or undefined when calling v1UniversesUniverseIdIconPost.");
                                return s = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/universes/{universeId}/icon".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/icon",
                                    method: "POST",
                                    headers: r,
                                    query: s,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            iconType: e.iconType
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n)]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdIconPost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdIconPostRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t
        }(c._),
        et = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return v(t, e), t.prototype.v1PlacesPlaceIdCompatibilitiesGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new c.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling v1PlacesPlaceIdCompatibilitiesGet.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/places/{placeId}/compatibilities".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}/compatibilities",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return null == e ? e : {
                                        compatibilities: (0, c.u)(e, "Compatibilities") ? e.Compatibilities.map(T) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1PlacesPlaceIdCompatibilitiesGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1PlacesPlaceIdCompatibilitiesGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1PlacesPlaceIdMediaGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new c.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling v1PlacesPlaceIdMediaGet.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/places/{placeId}/media".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}/media",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return null == e ? e : {
                                        data: (0, c.u)(e, "data") ? e.data.map(M) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1PlacesPlaceIdMediaGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1PlacesPlaceIdMediaGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1PlacesPlaceIdPatchRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new c.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling v1PlacesPlaceIdPatch.");
                                if (null === e._configuration || void 0 === e._configuration) throw new c.w("_configuration", "Required parameter requestParameters._configuration was null or undefined when calling v1PlacesPlaceIdPatch.");
                                return s = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/places/{placeId}".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}",
                                    method: "PATCH",
                                    headers: r,
                                    query: s,
                                    body: q(e._configuration)
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return S(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1PlacesPlaceIdPatch = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1PlacesPlaceIdPatchRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1PlacesPlaceIdPostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new c.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling v1PlacesPlaceIdPost.");
                                if (null === e._configuration || void 0 === e._configuration) throw new c.w("_configuration", "Required parameter requestParameters._configuration was null or undefined when calling v1PlacesPlaceIdPost.");
                                return s = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/places/{placeId}".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}",
                                    method: "POST",
                                    headers: r,
                                    query: s,
                                    body: q(e._configuration)
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return S(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1PlacesPlaceIdPost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1PlacesPlaceIdPostRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t
        }(c._),
        es = (function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            v(t, e), t.prototype.v1PluginsGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.pluginIds || void 0 === e.pluginIds) throw new c.w("pluginIds", "Required parameter requestParameters.pluginIds was null or undefined when calling v1PluginsGet.");
                                return s = {}, e.pluginIds && (s.pluginIds = e.pluginIds.join(c.G.csv)), r = {}, [4, this.request({
                                    path: "/v1/plugins",
                                    schemaPath: "/v1/plugins",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return null == e ? e : {
                                        data: (0, c.u)(e, "data") ? e.data.map(j) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1PluginsGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1PluginsGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1PluginsPluginIdIncrementInstallCountPostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.pluginId || void 0 === e.pluginId) throw new c.w("pluginId", "Required parameter requestParameters.pluginId was null or undefined when calling v1PluginsPluginIdIncrementInstallCountPost.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/plugins/{pluginId}/increment-install-count".replace("{".concat("pluginId", "}"), encodeURIComponent(String(e.pluginId))),
                                    schemaPath: "/v1/plugins/{pluginId}/increment-install-count",
                                    method: "POST",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n)]
                        }
                    })
                })
            }, t.prototype.v1PluginsPluginIdIncrementInstallCountPost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1PluginsPluginIdIncrementInstallCountPostRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1PluginsPluginIdInstallCountGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.pluginId || void 0 === e.pluginId) throw new c.w("pluginId", "Required parameter requestParameters.pluginId was null or undefined when calling v1PluginsPluginIdInstallCountGet.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/plugins/{pluginId}/install-count".replace("{".concat("pluginId", "}"), encodeURIComponent(String(e.pluginId))),
                                    schemaPath: "/v1/plugins/{pluginId}/install-count",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return null == e ? e : {
                                        installCount: (0, c.u)(e, "installCount") ? e.installCount : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1PluginsPluginIdInstallCountGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1PluginsPluginIdInstallCountGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1PluginsPluginIdPatchRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.pluginId || void 0 === e.pluginId) throw new c.w("pluginId", "Required parameter requestParameters.pluginId was null or undefined when calling v1PluginsPluginIdPatch.");
                                if (null === e.request || void 0 === e.request) throw new c.w("request", "Required parameter requestParameters.request was null or undefined when calling v1PluginsPluginIdPatch.");
                                return s = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/plugins/{pluginId}".replace("{".concat("pluginId", "}"), encodeURIComponent(String(e.pluginId))),
                                    schemaPath: "/v1/plugins/{pluginId}",
                                    method: "PATCH",
                                    headers: r,
                                    query: s,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            name: e.name,
                                            description: e.description,
                                            commentsEnabled: e.commentsEnabled
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n)]
                        }
                    })
                })
            }, t.prototype.v1PluginsPluginIdPatch = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1PluginsPluginIdPatchRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }
        }(c._), function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return v(t, e), t.prototype.v1SearchUniversesGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return s = {}, void 0 !== e.q && (s.q = e.q), e.sort && (s.sort = e.sort.join(c.G.csv)), void 0 !== e.sortOrder && (s.sortOrder = e.sortOrder), void 0 !== e.limit && (s.limit = e.limit), void 0 !== e.cursor && (s.cursor = e.cursor), r = {}, [4, this.request({
                                    path: "/v1/search/universes",
                                    schemaPath: "/v1/search/universes",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return z(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1SearchUniversesGet = function() {
                return h(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1SearchUniversesGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t
        }(c._)),
        er = {
            Asc: "Asc",
            Desc: "Desc"
        },
        en = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return v(t, e), t.prototype.v1UniversesUniverseIdSocialLinksMetadataGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdSocialLinksMetadataGet.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/social-links/metadata".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/social-links/metadata",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
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
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdSocialLinksMetadataGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdSocialLinksPostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdSocialLinksPost.");
                                if (null === e.request || void 0 === e.request) throw new c.w("request", "Required parameter requestParameters.request was null or undefined when calling v1UniversesUniverseIdSocialLinksPost.");
                                return s = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/universes/{universeId}/social-links".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/social-links",
                                    method: "POST",
                                    headers: r,
                                    query: s,
                                    body: B(e.request)
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
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
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdSocialLinksPostRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdSocialLinksSocialLinkIdDeleteRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdSocialLinksSocialLinkIdDelete.");
                                if (null === e.socialLinkId || void 0 === e.socialLinkId) throw new c.w("socialLinkId", "Required parameter requestParameters.socialLinkId was null or undefined when calling v1UniversesUniverseIdSocialLinksSocialLinkIdDelete.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/social-links/{socialLinkId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("socialLinkId", "}"), encodeURIComponent(String(e.socialLinkId))),
                                    schemaPath: "/v1/universes/{universeId}/social-links/{socialLinkId}",
                                    method: "DELETE",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n)]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdSocialLinksSocialLinkIdDelete = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdSocialLinksSocialLinkIdDeleteRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdSocialLinksSocialLinkIdPatchRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdSocialLinksSocialLinkIdPatch.");
                                if (null === e.socialLinkId || void 0 === e.socialLinkId) throw new c.w("socialLinkId", "Required parameter requestParameters.socialLinkId was null or undefined when calling v1UniversesUniverseIdSocialLinksSocialLinkIdPatch.");
                                if (null === e.request || void 0 === e.request) throw new c.w("request", "Required parameter requestParameters.request was null or undefined when calling v1UniversesUniverseIdSocialLinksSocialLinkIdPatch.");
                                return s = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/universes/{universeId}/social-links/{socialLinkId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("socialLinkId", "}"), encodeURIComponent(String(e.socialLinkId))),
                                    schemaPath: "/v1/universes/{universeId}/social-links/{socialLinkId}",
                                    method: "PATCH",
                                    headers: r,
                                    query: s,
                                    body: B(e.request)
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n)]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdSocialLinksSocialLinkIdPatch = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdSocialLinksSocialLinkIdPatchRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t
        }(c._),
        ei = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return v(t, e), t.prototype.v1PlacesPlaceIdStatsDeveloperProductAggregationGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new c.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling v1PlacesPlaceIdStatsDeveloperProductAggregationGet.");
                                if (null === e.timeFrame || void 0 === e.timeFrame) throw new c.w("timeFrame", "Required parameter requestParameters.timeFrame was null or undefined when calling v1PlacesPlaceIdStatsDeveloperProductAggregationGet.");
                                return s = {}, void 0 !== e.timeFrame && (s.timeFrame = e.timeFrame), r = {}, [4, this.request({
                                    path: "/v1/places/{placeId}/stats/developer-product-aggregation".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}/stats/developer-product-aggregation",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    var t;
                                    return null == e ? e : {
                                        allDevicesDeveloperProductRevenue: (0, c.u)(e, "allDevicesDeveloperProductRevenue") ? e.allDevicesDeveloperProductRevenue.map(U) : void 0,
                                        developerProductRevenueByDevice: (0, c.u)(e, "developerProductRevenueByDevice") ? null == (t = e.developerProductRevenueByDevice) ? t : {
                                            computer: (0, c.u)(t, "Computer") ? t.Computer.map(U) : void 0,
                                            phone: (0, c.u)(t, "Phone") ? t.Phone.map(U) : void 0,
                                            tablet: (0, c.u)(t, "Tablet") ? t.Tablet.map(U) : void 0,
                                            console: (0, c.u)(t, "Console") ? t.Console.map(U) : void 0
                                        } : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1PlacesPlaceIdStatsDeveloperProductAggregationGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1PlacesPlaceIdStatsDeveloperProductAggregationGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1PlacesPlaceIdStatsIsAgeDataAvailableGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new c.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling v1PlacesPlaceIdStatsIsAgeDataAvailableGet.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/places/{placeId}/stats/is-age-data-available".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}/stats/is-age-data-available",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return null == e ? e : {
                                        isAgeDataAvailable: (0, c.u)(e, "isAgeDataAvailable") ? e.isAgeDataAvailable : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1PlacesPlaceIdStatsIsAgeDataAvailableGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1PlacesPlaceIdStatsIsAgeDataAvailableGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1PlacesPlaceIdStatsTypeGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new c.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling v1PlacesPlaceIdStatsTypeGet.");
                                if (null === e.type || void 0 === e.type) throw new c.w("type", "Required parameter requestParameters.type was null or undefined when calling v1PlacesPlaceIdStatsTypeGet.");
                                if (null === e.granularity || void 0 === e.granularity) throw new c.w("granularity", "Required parameter requestParameters.granularity was null or undefined when calling v1PlacesPlaceIdStatsTypeGet.");
                                return s = {}, void 0 !== e.granularity && (s.granularity = e.granularity), void 0 !== e.divisionType && (s.divisionType = e.divisionType), void 0 !== e.startTime && (s.startTime = e.startTime), void 0 !== e.endTime && (s.endTime = e.endTime), r = {}, [4, this.request({
                                    path: "/v1/places/{placeId}/stats/{type}".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))).replace("{".concat("type", "}"), encodeURIComponent(String(e.type))),
                                    schemaPath: "/v1/places/{placeId}/stats/{type}",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return null == e ? e : {
                                        placeId: (0, c.u)(e, "placeId") ? e.placeId : void 0,
                                        dataType: (0, c.u)(e, "dataType") ? e.dataType : void 0,
                                        dataGranularity: (0, c.u)(e, "dataGranularity") ? e.dataGranularity : void 0,
                                        startTime: (0, c.u)(e, "startTime") ? new Date(e.startTime) : void 0,
                                        endTime: (0, c.u)(e, "endTime") ? new Date(e.endTime) : void 0,
                                        data: (0, c.u)(e, "data") ? (0, c.A)(e.data, k) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1PlacesPlaceIdStatsTypeGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1PlacesPlaceIdStatsTypeGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1PlacesPlaceIdStatsTypeLegacyFlotGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new c.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling v1PlacesPlaceIdStatsTypeLegacyFlotGet.");
                                if (null === e.type || void 0 === e.type) throw new c.w("type", "Required parameter requestParameters.type was null or undefined when calling v1PlacesPlaceIdStatsTypeLegacyFlotGet.");
                                if (null === e.timeFrame || void 0 === e.timeFrame) throw new c.w("timeFrame", "Required parameter requestParameters.timeFrame was null or undefined when calling v1PlacesPlaceIdStatsTypeLegacyFlotGet.");
                                return s = {}, void 0 !== e.timeFrame && (s.timeFrame = e.timeFrame), void 0 !== e.divisionType && (s.divisionType = e.divisionType), void 0 !== e.startTime && (s.startTime = e.startTime), void 0 !== e.endTime && (s.endTime = e.endTime), r = {}, [4, this.request({
                                    path: "/v1/places/{placeId}/stats/{type}/legacy/flot".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))).replace("{".concat("type", "}"), encodeURIComponent(String(e.type))),
                                    schemaPath: "/v1/places/{placeId}/stats/{type}/legacy/flot",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n)]
                        }
                    })
                })
            }, t.prototype.v1PlacesPlaceIdStatsTypeLegacyFlotGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1PlacesPlaceIdStatsTypeLegacyFlotGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1StatsCreatorDashboardMetadataGetRaw = function(e) {
                return h(this, void 0, void 0, function() {
                    var t, s, r;
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return t = {}, s = {}, [4, this.request({
                                    path: "/v1/stats/creator-dashboard-metadata",
                                    schemaPath: "/v1/stats/creator-dashboard-metadata",
                                    method: "GET",
                                    headers: s,
                                    query: t
                                }, e)];
                            case 1:
                                return r = n.sent(), [2, new c.H(r, function(e) {
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
            return v(t, e), t.prototype.v1PlacesPlaceIdTeamcreateActiveSessionMembersGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new c.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling v1PlacesPlaceIdTeamcreateActiveSessionMembersGet.");
                                return s = {}, void 0 !== e.limit && (s.limit = e.limit), void 0 !== e.cursor && (s.cursor = e.cursor), r = {}, [4, this.request({
                                    path: "/v1/places/{placeId}/teamcreate/active_session/members".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/places/{placeId}/teamcreate/active_session/members",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return null == e ? e : {
                                        data: (0, c.u)(e, "data") ? e.data.map(Y) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1PlacesPlaceIdTeamcreateActiveSessionMembersGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1PlacesPlaceIdTeamcreateActiveSessionMembersGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdTeamcreateGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdTeamcreateGet.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/teamcreate".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/teamcreate",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return null == e ? e : {
                                        isEnabled: (0, c.u)(e, "isEnabled") ? e.isEnabled : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdTeamcreateGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdTeamcreateGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdTeamcreateMembershipsDeleteRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdTeamcreateMembershipsDelete.");
                                if (null === e.request || void 0 === e.request) throw new c.w("request", "Required parameter requestParameters.request was null or undefined when calling v1UniversesUniverseIdTeamcreateMembershipsDelete.");
                                return s = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/universes/{universeId}/teamcreate/memberships".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/teamcreate/memberships",
                                    method: "DELETE",
                                    headers: r,
                                    query: s,
                                    body: H(e.request)
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n)]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdTeamcreateMembershipsDelete = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdTeamcreateMembershipsDeleteRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdTeamcreateMembershipsDeletePostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdTeamcreateMembershipsDeletePost.");
                                if (null === e.request || void 0 === e.request) throw new c.w("request", "Required parameter requestParameters.request was null or undefined when calling v1UniversesUniverseIdTeamcreateMembershipsDeletePost.");
                                return s = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/universes/{universeId}/teamcreate/memberships/delete".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/teamcreate/memberships/delete",
                                    method: "POST",
                                    headers: r,
                                    query: s,
                                    body: H(e.request)
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n)]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdTeamcreateMembershipsDeletePost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdTeamcreateMembershipsDeletePostRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdTeamcreateMembershipsGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdTeamcreateMembershipsGet.");
                                return s = {}, void 0 !== e.sortOrder && (s.sortOrder = e.sortOrder), void 0 !== e.limit && (s.limit = e.limit), void 0 !== e.cursor && (s.cursor = e.cursor), r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/teamcreate/memberships".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/teamcreate/memberships",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return null == e ? e : {
                                        previousPageCursor: (0, c.u)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                        nextPageCursor: (0, c.u)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                        data: (0, c.u)(e, "data") ? e.data.map(O) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdTeamcreateMembershipsGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdTeamcreateMembershipsGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdTeamcreatePatchRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdTeamcreatePatch.");
                                if (null === e.request || void 0 === e.request) throw new c.w("request", "Required parameter requestParameters.request was null or undefined when calling v1UniversesUniverseIdTeamcreatePatch.");
                                return s = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/universes/{universeId}/teamcreate".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/teamcreate",
                                    method: "PATCH",
                                    headers: r,
                                    query: s,
                                    body: F(e.request)
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n)]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdTeamcreatePatch = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdTeamcreatePatchRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdTeamcreatePostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdTeamcreatePost.");
                                if (null === e.request || void 0 === e.request) throw new c.w("request", "Required parameter requestParameters.request was null or undefined when calling v1UniversesUniverseIdTeamcreatePost.");
                                return s = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/universes/{universeId}/teamcreate".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/teamcreate",
                                    method: "POST",
                                    headers: r,
                                    query: s,
                                    body: F(e.request)
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n)]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdTeamcreatePost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdTeamcreatePostRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UserTeamcreateMembershipsGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return s = {}, void 0 !== e.sortOrder && (s.sortOrder = e.sortOrder), void 0 !== e.limit && (s.limit = e.limit), void 0 !== e.cursor && (s.cursor = e.cursor), r = {}, [4, this.request({
                                    path: "/v1/user/teamcreate/memberships",
                                    schemaPath: "/v1/user/teamcreate/memberships",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return z(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1UserTeamcreateMembershipsGet = function() {
                return h(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UserTeamcreateMembershipsGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t
        }(c._),
        eu = (function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            v(t, e), t.prototype.v1TeamtestPlaceIdDeleteRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new c.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling v1TeamtestPlaceIdDelete.");
                                if (null === e.gameId || void 0 === e.gameId) throw new c.w("gameId", "Required parameter requestParameters.gameId was null or undefined when calling v1TeamtestPlaceIdDelete.");
                                return s = {}, void 0 !== e.gameId && (s.gameId = e.gameId), r = {}, [4, this.request({
                                    path: "/v1/teamtest/{placeId}".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/teamtest/{placeId}",
                                    method: "DELETE",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n)]
                        }
                    })
                })
            }, t.prototype.v1TeamtestPlaceIdDelete = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1TeamtestPlaceIdDeleteRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1TeamtestPlacesPlaceIdRunninggamesGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new c.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling v1TeamtestPlacesPlaceIdRunninggamesGet.");
                                return s = {}, void 0 !== e.sortOrder && (s.sortOrder = e.sortOrder), void 0 !== e.limit && (s.limit = e.limit), void 0 !== e.cursor && (s.cursor = e.cursor), r = {}, [4, this.request({
                                    path: "/v1/teamtest/places/{placeId}/runninggames".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v1/teamtest/places/{placeId}/runninggames",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.V(n)]
                        }
                    })
                })
            }, t.prototype.v1TeamtestPlacesPlaceIdRunninggamesGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1TeamtestPlacesPlaceIdRunninggamesGetRaw(e, t)];
                            case 1:
                                return s.sent(), [2]
                        }
                    })
                })
            }
        }(c._), function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return v(t, e), t.prototype.v1UniversesUniverseIdThumbnailsAltTextPostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdThumbnailsAltTextPost.");
                                if (null === e.request || void 0 === e.request) throw new c.w("request", "Required parameter requestParameters.request was null or undefined when calling v1UniversesUniverseIdThumbnailsAltTextPost.");
                                return s = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/universes/{universeId}/thumbnails/alt-text".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/thumbnails/alt-text",
                                    method: "POST",
                                    headers: r,
                                    query: s,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            MediaAssetId: e.mediaAssetId,
                                            MediaAssetAltText: e.mediaAssetAltText
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
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
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdThumbnailsAltTextPostRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdThumbnailsAutoGeneratedPostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdThumbnailsAutoGeneratedPost.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/thumbnails/auto-generated".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/thumbnails/auto-generated",
                                    method: "POST",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n)]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdThumbnailsAutoGeneratedPost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdThumbnailsAutoGeneratedPostRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdThumbnailsOrderPostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdThumbnailsOrderPost.");
                                if (null === e.request || void 0 === e.request) throw new c.w("request", "Required parameter requestParameters.request was null or undefined when calling v1UniversesUniverseIdThumbnailsOrderPost.");
                                return s = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/universes/{universeId}/thumbnails/order".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/thumbnails/order",
                                    method: "POST",
                                    headers: r,
                                    query: s,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            thumbnailIds: e.thumbnailIds
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n)]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdThumbnailsOrderPost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdThumbnailsOrderPostRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdThumbnailsThumbnailIdDeleteRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdThumbnailsThumbnailIdDelete.");
                                if (null === e.thumbnailId || void 0 === e.thumbnailId) throw new c.w("thumbnailId", "Required parameter requestParameters.thumbnailId was null or undefined when calling v1UniversesUniverseIdThumbnailsThumbnailIdDelete.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/thumbnails/{thumbnailId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("thumbnailId", "}"), encodeURIComponent(String(e.thumbnailId))),
                                    schemaPath: "/v1/universes/{universeId}/thumbnails/{thumbnailId}",
                                    method: "DELETE",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n)]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdThumbnailsThumbnailIdDelete = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdThumbnailsThumbnailIdDeleteRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t
        }(c._)),
        ed = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return v(t, e), t.prototype.v1UniversesUniverseIdConfigurationGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdConfigurationGet.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/configuration".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/configuration",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return N(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdConfigurationGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdConfigurationGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdConfigurationPatchRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdConfigurationPatch.");
                                if (null === e.model || void 0 === e.model) throw new c.w("model", "Required parameter requestParameters.model was null or undefined when calling v1UniversesUniverseIdConfigurationPatch.");
                                return s = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/universes/{universeId}/configuration".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/configuration",
                                    method: "PATCH",
                                    headers: r,
                                    query: s,
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
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return N(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdConfigurationPatch = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdConfigurationPatchRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdConfigurationPlaytestersDeleteRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdConfigurationPlaytestersDelete.");
                                if (null === e.request || void 0 === e.request) throw new c.w("request", "Required parameter requestParameters.request was null or undefined when calling v1UniversesUniverseIdConfigurationPlaytestersDelete.");
                                return s = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/universes/{universeId}/configuration/playtesters".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/configuration/playtesters",
                                    method: "DELETE",
                                    headers: r,
                                    query: s,
                                    body: C(e.request)
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return D(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdConfigurationPlaytestersDelete = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdConfigurationPlaytestersDeleteRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdConfigurationPlaytestersEligibilityPostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdConfigurationPlaytestersEligibilityPost.");
                                if (null === e.request || void 0 === e.request) throw new c.w("request", "Required parameter requestParameters.request was null or undefined when calling v1UniversesUniverseIdConfigurationPlaytestersEligibilityPost.");
                                return s = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/universes/{universeId}/configuration/playtesters/eligibility".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/configuration/playtesters/eligibility",
                                    method: "POST",
                                    headers: r,
                                    query: s,
                                    body: C(e.request)
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return null == e ? e : {
                                        playtesters: (0, c.u)(e, "playtesters") ? e.playtesters.map(G) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdConfigurationPlaytestersEligibilityPost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdConfigurationPlaytestersEligibilityPostRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdConfigurationPlaytestersGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdConfigurationPlaytestersGet.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/configuration/playtesters".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/configuration/playtesters",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return D(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdConfigurationPlaytestersGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdConfigurationPlaytestersGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdConfigurationPlaytestersPostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdConfigurationPlaytestersPost.");
                                if (null === e.request || void 0 === e.request) throw new c.w("request", "Required parameter requestParameters.request was null or undefined when calling v1UniversesUniverseIdConfigurationPlaytestersPost.");
                                return s = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/universes/{universeId}/configuration/playtesters".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/configuration/playtesters",
                                    method: "POST",
                                    headers: r,
                                    query: s,
                                    body: C(e.request)
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return D(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdConfigurationPlaytestersPost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdConfigurationPlaytestersPostRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdConfigurationVipServersGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdConfigurationVipServersGet.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/configuration/vip-servers".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/configuration/vip-servers",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
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
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdConfigurationVipServersGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t
        }(c._),
        ec = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return v(t, e), t.prototype.v1UniversesMultigetGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.ids || void 0 === e.ids) throw new c.w("ids", "Required parameter requestParameters.ids was null or undefined when calling v1UniversesMultigetGet.");
                                return s = {}, e.ids && (s.ids = e.ids), r = {}, [4, this.request({
                                    path: "/v1/universes/multiget",
                                    schemaPath: "/v1/universes/multiget",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return null == e ? e : {
                                        data: (0, c.u)(e, "data") ? e.data.map(y) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesMultigetGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesMultigetGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesMultigetPermissionsGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.ids || void 0 === e.ids) throw new c.w("ids", "Required parameter requestParameters.ids was null or undefined when calling v1UniversesMultigetPermissionsGet.");
                                return s = {}, e.ids && (s.ids = e.ids), r = {}, [4, this.request({
                                    path: "/v1/universes/multiget/permissions",
                                    schemaPath: "/v1/universes/multiget/permissions",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return null == e ? e : {
                                        data: (0, c.u)(e, "data") ? e.data.map(V) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesMultigetPermissionsGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesMultigetPermissionsGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdActivatePostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdActivatePost.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/activate".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/activate",
                                    method: "POST",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n)]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdActivatePost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdActivatePostRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdActivationEligibilityGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdActivationEligibilityGet.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/activation-eligibility".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/activation-eligibility",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
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
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdActivationEligibilityGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdContextPermissionsGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdContextPermissionsGet.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/context-permissions".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/context-permissions",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return x(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdContextPermissionsGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdContextPermissionsGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdDeactivatePostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdDeactivatePost.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/deactivate".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/deactivate",
                                    method: "POST",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n)]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdDeactivatePost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdDeactivatePostRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdGet.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return y(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdLiveStatsGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdLiveStatsGet.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/live-stats".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/live-stats",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
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
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdLiveStatsGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdPermissionsGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdPermissionsGet.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/permissions".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/permissions",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return x(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdPermissionsGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdPermissionsGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdPlacesGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdPlacesGet.");
                                return s = {}, void 0 !== e.sortOrder && (s.sortOrder = e.sortOrder), void 0 !== e.limit && (s.limit = e.limit), void 0 !== e.cursor && (s.cursor = e.cursor), void 0 !== e.isUniverseCreation && (s.isUniverseCreation = e.isUniverseCreation), r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/places".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/places",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
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
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdPlacesGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdRevenueReportsGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdRevenueReportsGet.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/revenue-reports".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/revenue-reports",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return null == e ? e : {
                                        monthlyRevenueReportStatusList: (0, c.u)(e, "monthlyRevenueReportStatusList") ? e.monthlyRevenueReportStatusList.map(R) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdRevenueReportsGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdRevenueReportsGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdRevenueReportsYearDashMonthDownloadGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdRevenueReportsYearDashMonthDownloadGet.");
                                if (null === e.yearDashMonth || void 0 === e.yearDashMonth) throw new c.w("yearDashMonth", "Required parameter requestParameters.yearDashMonth was null or undefined when calling v1UniversesUniverseIdRevenueReportsYearDashMonthDownloadGet.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/revenue-reports/{yearDashMonth}/download".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("yearDashMonth", "}"), encodeURIComponent(String(e.yearDashMonth))),
                                    schemaPath: "/v1/universes/{universeId}/revenue-reports/{yearDashMonth}/download",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n)]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdRevenueReportsYearDashMonthDownloadGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdRevenueReportsYearDashMonthDownloadGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdRevenueReportsYearDashMonthGeneratePostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdRevenueReportsYearDashMonthGeneratePost.");
                                if (null === e.yearDashMonth || void 0 === e.yearDashMonth) throw new c.w("yearDashMonth", "Required parameter requestParameters.yearDashMonth was null or undefined when calling v1UniversesUniverseIdRevenueReportsYearDashMonthGeneratePost.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/revenue-reports/{yearDashMonth}/generate".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("yearDashMonth", "}"), encodeURIComponent(String(e.yearDashMonth))),
                                    schemaPath: "/v1/universes/{universeId}/revenue-reports/{yearDashMonth}/generate",
                                    method: "POST",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return null == e ? e : {
                                        revenueReportStatus: (0, c.u)(e, "revenueReportStatus") ? e.revenueReportStatus : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdRevenueReportsYearDashMonthGeneratePost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdRevenueReportsYearDashMonthGeneratePostRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdRevenueReportsYearDashMonthGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdRevenueReportsYearDashMonthGet.");
                                if (null === e.yearDashMonth || void 0 === e.yearDashMonth) throw new c.w("yearDashMonth", "Required parameter requestParameters.yearDashMonth was null or undefined when calling v1UniversesUniverseIdRevenueReportsYearDashMonthGet.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/revenue-reports/{yearDashMonth}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("yearDashMonth", "}"), encodeURIComponent(String(e.yearDashMonth))),
                                    schemaPath: "/v1/universes/{universeId}/revenue-reports/{yearDashMonth}",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return R(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdRevenueReportsYearDashMonthGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdRevenueReportsYearDashMonthGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdStatisticReportsGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdStatisticReportsGet.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/statistic-reports".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/statistic-reports",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return null == e ? e : {
                                        reports: (0, c.u)(e, "reports") ? e.reports.map(P) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdStatisticReportsGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdStatisticReportsGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdStatisticReportsYearDashMonthDownloadGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdStatisticReportsYearDashMonthDownloadGet.");
                                if (null === e.yearDashMonth || void 0 === e.yearDashMonth) throw new c.w("yearDashMonth", "Required parameter requestParameters.yearDashMonth was null or undefined when calling v1UniversesUniverseIdStatisticReportsYearDashMonthDownloadGet.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/statistic-reports/{yearDashMonth}/download".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("yearDashMonth", "}"), encodeURIComponent(String(e.yearDashMonth))),
                                    schemaPath: "/v1/universes/{universeId}/statistic-reports/{yearDashMonth}/download",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n)]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdStatisticReportsYearDashMonthDownloadGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdStatisticReportsYearDashMonthDownloadGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdStatisticReportsYearDashMonthGeneratePostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdStatisticReportsYearDashMonthGeneratePost.");
                                if (null === e.yearDashMonth || void 0 === e.yearDashMonth) throw new c.w("yearDashMonth", "Required parameter requestParameters.yearDashMonth was null or undefined when calling v1UniversesUniverseIdStatisticReportsYearDashMonthGeneratePost.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/statistic-reports/{yearDashMonth}/generate".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("yearDashMonth", "}"), encodeURIComponent(String(e.yearDashMonth))),
                                    schemaPath: "/v1/universes/{universeId}/statistic-reports/{yearDashMonth}/generate",
                                    method: "POST",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n)]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdStatisticReportsYearDashMonthGeneratePost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdStatisticReportsYearDashMonthGeneratePostRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdStatisticReportsYearDashMonthGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1UniversesUniverseIdStatisticReportsYearDashMonthGet.");
                                if (null === e.yearDashMonth || void 0 === e.yearDashMonth) throw new c.w("yearDashMonth", "Required parameter requestParameters.yearDashMonth was null or undefined when calling v1UniversesUniverseIdStatisticReportsYearDashMonthGet.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/statistic-reports/{yearDashMonth}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("yearDashMonth", "}"), encodeURIComponent(String(e.yearDashMonth))),
                                    schemaPath: "/v1/universes/{universeId}/statistic-reports/{yearDashMonth}",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return P(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1UniversesUniverseIdStatisticReportsYearDashMonthGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UniversesUniverseIdStatisticReportsYearDashMonthGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UniversesUserPublicPublishEligibilityGetRaw = function(e) {
                return h(this, void 0, void 0, function() {
                    var t, s, r;
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return t = {}, s = {}, [4, this.request({
                                    path: "/v1/universes/user-public-publish-eligibility",
                                    schemaPath: "/v1/universes/user-public-publish-eligibility",
                                    method: "GET",
                                    headers: s,
                                    query: t
                                }, e)];
                            case 1:
                                return r = n.sent(), [2, new c.H(r, function(e) {
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
        el = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return v(t, e), t.prototype.v1UserGroupsCanmanageGetRaw = function(e) {
                return h(this, void 0, void 0, function() {
                    var t, s, r;
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return t = {}, s = {}, [4, this.request({
                                    path: "/v1/user/groups/canmanage",
                                    schemaPath: "/v1/user/groups/canmanage",
                                    method: "GET",
                                    headers: s,
                                    query: t
                                }, e)];
                            case 1:
                                return r = n.sent(), [2, new c.H(r, function(e) {
                                    return J(e)
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
                    var t, s, r;
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return t = {}, s = {}, [4, this.request({
                                    path: "/v1/user/groups/canmanagegamesoritems",
                                    schemaPath: "/v1/user/groups/canmanagegamesoritems",
                                    method: "GET",
                                    headers: s,
                                    query: t
                                }, e)];
                            case 1:
                                return r = n.sent(), [2, new c.H(r, function(e) {
                                    return J(e)
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
                    var t, s, r;
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return t = {}, s = {}, [4, this.request({
                                    path: "/v1/user/is-verified-creator",
                                    schemaPath: "/v1/user/is-verified-creator",
                                    method: "GET",
                                    headers: s,
                                    query: t
                                }, e)];
                            case 1:
                                return r = n.sent(), [2, new c.H(r, function(e) {
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
                    var t, s, r;
                    return p(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return t = {}, s = {}, [4, this.request({
                                    path: "/v1/user/notifications/statistic-reports",
                                    schemaPath: "/v1/user/notifications/statistic-reports",
                                    method: "GET",
                                    headers: s,
                                    query: t
                                }, e)];
                            case 1:
                                return r = n.sent(), [2, new c.H(r, function(e) {
                                    return null == e ? e : {
                                        data: (0, c.u)(e, "data") ? e.data.map(_) : void 0
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
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return s = {}, void 0 !== e.isArchived && (s.isArchived = e.isArchived), void 0 !== e.sortOrder && (s.sortOrder = e.sortOrder), void 0 !== e.limit && (s.limit = e.limit), void 0 !== e.cursor && (s.cursor = e.cursor), r = {}, [4, this.request({
                                    path: "/v1/user/universes",
                                    schemaPath: "/v1/user/universes",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return z(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1UserUniversesGet = function() {
                return h(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UserUniversesGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UserUserIdCanmanageAssetIdGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new c.w("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UserUserIdCanmanageAssetIdGet.");
                                if (null === e.assetId || void 0 === e.assetId) throw new c.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling v1UserUserIdCanmanageAssetIdGet.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/user/{userId}/canmanage/{assetId}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))).replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/user/{userId}/canmanage/{assetId}",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
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
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UserUserIdCanmanageAssetIdGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v1UserUserIdIsAdminDeveloperConsoleEnabledGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new c.w("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UserUserIdIsAdminDeveloperConsoleEnabledGet.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v1/user/{userId}/is-admin-developer-console-enabled".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/user/{userId}/is-admin-developer-console-enabled",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return null == e ? e : {
                                        isAdminDeveloperConsoleEnabled: (0, c.u)(e, "isAdminDeveloperConsoleEnabled") ? e.isAdminDeveloperConsoleEnabled : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1UserUserIdIsAdminDeveloperConsoleEnabledGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v1UserUserIdIsAdminDeveloperConsoleEnabledGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t
        }(c._),
        ev = {
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
    e.s(["w", 0, Z, "k", 0, Q, "z", 0, ee, "x", 0, et, "H", 0, {
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
    }, "y", 0, es, "O", 0, en, "P", 0, ei, "j", 0, eo, "u", 0, eu, "l", 0, ed, "G", 0, ec, "U", 0, el, "J", 0, {
        NUMBER_10: 10,
        NUMBER_25: 25,
        NUMBER_50: 50,
        NUMBER_100: 100
    }, "S", 0, $, "f", 0, ea, "t", 0, er, "_", 0, {
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
    }, "e", 0, ev], 587694);

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

    function em(e) {
        var t;
        return null == (t = e) ? t : {
            region: (0, c.u)(t, "region") ? t.region : void 0,
            status: (0, c.u)(t, "status") ? t.status : void 0
        }
    }

    function ef(e) {
        if (void 0 !== e) return null === e ? null : {
            Action: e.action,
            SubjectType: e.subjectType,
            SubjectId: e.subjectId
        }
    }

    function eI(e) {
        var t;
        return null == (t = e) ? t : {
            assetID: (0, c.u)(t, "assetID") ? t.assetID : void 0,
            assetTypeID: (0, c.u)(t, "assetTypeID") ? t.assetTypeID : void 0,
            isPlayerChoice: (0, c.u)(t, "isPlayerChoice") ? t.isPlayerChoice : void 0
        }
    }

    function ew(e) {
        if (void 0 !== e) return null === e ? null : {
            assetID: e.assetID,
            assetTypeID: e.assetTypeID,
            isPlayerChoice: e.isPlayerChoice
        }
    }

    function eU(e, t) {
        return null == e ? e : {
            height: (0, c.u)(e, "height") ? e.height : void 0,
            width: (0, c.u)(e, "width") ? e.width : void 0,
            head: (0, c.u)(e, "head") ? e.head : void 0,
            depth: (0, c.u)(e, "depth") ? e.depth : void 0,
            proportion: (0, c.u)(e, "proportion") ? e.proportion : void 0,
            bodyType: (0, c.u)(e, "bodyType") ? e.bodyType : void 0
        }
    }

    function eP(e) {
        if (void 0 !== e) return null === e ? null : {
            height: e.height,
            width: e.width,
            head: e.head,
            depth: e.depth,
            proportion: e.proportion,
            bodyType: e.bodyType
        }
    }

    function ey(e, t) {
        var s;
        return null == e ? e : {
            allowPrivateServers: (0, c.u)(e, "allowPrivateServers") ? e.allowPrivateServers : void 0,
            privateServerPrice: (0, c.u)(e, "privateServerPrice") ? e.privateServerPrice : void 0,
            optInRegions: (0, c.u)(e, "optInRegions") ? e.optInRegions.map(em) : void 0,
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
            universeAvatarAssetOverrides: (0, c.u)(e, "universeAvatarAssetOverrides") ? e.universeAvatarAssetOverrides.map(eI) : void 0,
            universeAvatarMinScales: (0, c.u)(e, "universeAvatarMinScales") ? eU(e.universeAvatarMinScales) : void 0,
            universeAvatarMaxScales: (0, c.u)(e, "universeAvatarMaxScales") ? eU(e.universeAvatarMaxScales) : void 0,
            studioAccessToApisAllowed: (0, c.u)(e, "studioAccessToApisAllowed") ? e.studioAccessToApisAllowed : void 0,
            permissions: (0, c.u)(e, "permissions") ? null == (s = e.permissions) ? s : {
                isThirdPartyTeleportAllowed: (0, c.u)(s, "IsThirdPartyTeleportAllowed") ? s.IsThirdPartyTeleportAllowed : void 0,
                isThirdPartyAssetAllowed: (0, c.u)(s, "IsThirdPartyAssetAllowed") ? s.IsThirdPartyAssetAllowed : void 0,
                isThirdPartyPurchaseAllowed: (0, c.u)(s, "IsThirdPartyPurchaseAllowed") ? s.IsThirdPartyPurchaseAllowed : void 0
            } : void 0,
            isForSaleInFiat: (0, c.u)(e, "isForSaleInFiat") ? e.isForSaleInFiat : void 0,
            fiatBasePriceId: (0, c.u)(e, "fiatBasePriceId") ? e.fiatBasePriceId : void 0,
            fiatModerationStatus: (0, c.u)(e, "fiatModerationStatus") ? e.fiatModerationStatus : void 0,
            audiences: (0, c.u)(e, "audiences") ? e.audiences : void 0,
            demoModeEnabled: (0, c.u)(e, "demoModeEnabled") ? e.demoModeEnabled : void 0,
            demoModeChangeableAfter: (0, c.u)(e, "demoModeChangeableAfter") ? new Date(e.demoModeChangeableAfter) : void 0
        }
    }

    function eg(e) {
        var t;
        return null == (t = e) ? t : {
            userId: (0, c.u)(t, "userId") ? t.userId : void 0,
            userHasPermission: (0, c.u)(t, "userHasPermission") ? t.userHasPermission : void 0
        }
    }

    function eA(e, t) {
        return null == e ? e : {
            data: (0, c.u)(e, "data") ? e.data : void 0
        }
    }
    var eb = c._;

    function eR() {
        return null !== eb && eb.apply(this, arguments) || this
    }
    v(eR, eb), eR.prototype.v2AssetsIdVersionsGetRaw = function(e, t) {
        return h(this, void 0, void 0, function() {
            var s, r, n;
            return p(this, function(i) {
                switch (i.label) {
                    case 0:
                        if (null === e.id || void 0 === e.id) throw new c.w("id", "Required parameter requestParameters.id was null or undefined when calling v2AssetsIdVersionsGet.");
                        return s = {}, void 0 !== e.sortOrder && (s.sortOrder = e.sortOrder), void 0 !== e.limit && (s.limit = e.limit), void 0 !== e.cursor && (s.cursor = e.cursor), r = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (r["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                            path: "/v2/assets/{id}/versions".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                            schemaPath: "/v2/assets/{id}/versions",
                            method: "GET",
                            headers: r,
                            query: s
                        }, t)];
                    case 1:
                        return n = i.sent(), [2, new c.H(n, function(e) {
                            return null == e ? e : {
                                previousPageCursor: (0, c.u)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                nextPageCursor: (0, c.u)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                data: (0, c.u)(e, "data") ? e.data.map(eh) : void 0
                            }
                        })]
                }
            })
        })
    }, eR.prototype.v2AssetsIdVersionsGet = function(e, t) {
        return h(this, void 0, void 0, function() {
            return p(this, function(s) {
                switch (s.label) {
                    case 0:
                        return [4, this.v2AssetsIdVersionsGetRaw(e, t)];
                    case 1:
                        return [4, s.sent().value()];
                    case 2:
                        return [2, s.sent()]
                }
            })
        })
    };
    var eT = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return v(t, e), t.prototype.v2UniversesUniverseIdPermissionsBatchedDeleteRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v2UniversesUniverseIdPermissionsBatchedDelete.");
                                if (null === e.permissions || void 0 === e.permissions) throw new c.w("permissions", "Required parameter requestParameters.permissions was null or undefined when calling v2UniversesUniverseIdPermissionsBatchedDelete.");
                                return s = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v2/universes/{universeId}/permissions_batched".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/universes/{universeId}/permissions_batched",
                                    method: "DELETE",
                                    headers: r,
                                    query: s,
                                    body: e.permissions.map(ef)
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return eA(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v2UniversesUniverseIdPermissionsBatchedDelete = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v2UniversesUniverseIdPermissionsBatchedDeleteRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v2UniversesUniverseIdPermissionsBatchedPostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v2UniversesUniverseIdPermissionsBatchedPost.");
                                if (null === e.permissions || void 0 === e.permissions) throw new c.w("permissions", "Required parameter requestParameters.permissions was null or undefined when calling v2UniversesUniverseIdPermissionsBatchedPost.");
                                return s = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v2/universes/{universeId}/permissions_batched".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/universes/{universeId}/permissions_batched",
                                    method: "POST",
                                    headers: r,
                                    query: s,
                                    body: e.permissions.map(ef)
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return eA(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v2UniversesUniverseIdPermissionsBatchedPost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v2UniversesUniverseIdPermissionsBatchedPostRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v2UniversesUniverseIdPermissionsDeleteRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v2UniversesUniverseIdPermissionsDelete.");
                                if (null === e.permissions || void 0 === e.permissions) throw new c.w("permissions", "Required parameter requestParameters.permissions was null or undefined when calling v2UniversesUniverseIdPermissionsDelete.");
                                return s = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v2/universes/{universeId}/permissions".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/universes/{universeId}/permissions",
                                    method: "DELETE",
                                    headers: r,
                                    query: s,
                                    body: e.permissions.map(ef)
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n)]
                        }
                    })
                })
            }, t.prototype.v2UniversesUniverseIdPermissionsDelete = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v2UniversesUniverseIdPermissionsDeleteRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v2UniversesUniverseIdPermissionsGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v2UniversesUniverseIdPermissionsGet.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v2/universes/{universeId}/permissions".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/universes/{universeId}/permissions",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return null == e ? e : {
                                        data: (0, c.u)(e, "data") ? e.data : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v2UniversesUniverseIdPermissionsGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v2UniversesUniverseIdPermissionsGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v2UniversesUniverseIdPermissionsPostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v2UniversesUniverseIdPermissionsPost.");
                                if (null === e.permissions || void 0 === e.permissions) throw new c.w("permissions", "Required parameter requestParameters.permissions was null or undefined when calling v2UniversesUniverseIdPermissionsPost.");
                                return s = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v2/universes/{universeId}/permissions".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/universes/{universeId}/permissions",
                                    method: "POST",
                                    headers: r,
                                    query: s,
                                    body: e.permissions.map(ef)
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n)]
                        }
                    })
                })
            }, t.prototype.v2UniversesUniverseIdPermissionsPost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v2UniversesUniverseIdPermissionsPostRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v2UniversesUniverseIdUsersHavePermissionPermissionActionGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v2UniversesUniverseIdUsersHavePermissionPermissionActionGet.");
                                if (null === e.permissionAction || void 0 === e.permissionAction) throw new c.w("permissionAction", "Required parameter requestParameters.permissionAction was null or undefined when calling v2UniversesUniverseIdUsersHavePermissionPermissionActionGet.");
                                if (null === e.userIds || void 0 === e.userIds) throw new c.w("userIds", "Required parameter requestParameters.userIds was null or undefined when calling v2UniversesUniverseIdUsersHavePermissionPermissionActionGet.");
                                return s = {}, e.userIds && (s.userIds = e.userIds.join(c.G.csv)), r = {}, [4, this.request({
                                    path: "/v2/universes/{universeId}/users-have-permission/{permissionAction}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))).replace("{".concat("permissionAction", "}"), encodeURIComponent(String(e.permissionAction))),
                                    schemaPath: "/v2/universes/{universeId}/users-have-permission/{permissionAction}",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return null == e ? e : {
                                        data: (0, c.u)(e, "data") ? e.data.map(eg) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v2UniversesUniverseIdUsersHavePermissionPermissionActionGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v2UniversesUniverseIdUsersHavePermissionPermissionActionGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t
        }(c._),
        eq = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return v(t, e), t.prototype.v2PlacesPlaceIdGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new c.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling v2PlacesPlaceIdGet.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v2/places/{placeId}".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v2/places/{placeId}",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return ep(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v2PlacesPlaceIdGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v2PlacesPlaceIdGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v2PlacesPlaceIdPatchRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new c.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling v2PlacesPlaceIdPatch.");
                                if (null === e._configuration || void 0 === e._configuration) throw new c.w("_configuration", "Required parameter requestParameters._configuration was null or undefined when calling v2PlacesPlaceIdPatch.");
                                return s = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v2/places/{placeId}".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v2/places/{placeId}",
                                    method: "PATCH",
                                    headers: r,
                                    query: s,
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
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return ep(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v2PlacesPlaceIdPatch = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v2PlacesPlaceIdPatchRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t
        }(c._),
        eS = (function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            v(t, e), t.prototype.v2TeamtestPlaceIdDeleteRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.placeId || void 0 === e.placeId) throw new c.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling v2TeamtestPlaceIdDelete.");
                                if (null === e.gameId || void 0 === e.gameId) throw new c.w("gameId", "Required parameter requestParameters.gameId was null or undefined when calling v2TeamtestPlaceIdDelete.");
                                return s = {}, void 0 !== e.gameId && (s.gameId = e.gameId), r = {}, [4, this.request({
                                    path: "/v2/teamtest/{placeId}".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                    schemaPath: "/v2/teamtest/{placeId}",
                                    method: "DELETE",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n)]
                        }
                    })
                })
            }, t.prototype.v2TeamtestPlaceIdDelete = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v2TeamtestPlaceIdDeleteRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }
        }(c._), function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return v(t, e), t.prototype.v2UniversesUniverseIdConfigurationGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v2UniversesUniverseIdConfigurationGet.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v2/universes/{universeId}/configuration".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/universes/{universeId}/configuration",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return ey(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v2UniversesUniverseIdConfigurationGet = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v2UniversesUniverseIdConfigurationGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v2UniversesUniverseIdConfigurationPatchRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v2UniversesUniverseIdConfigurationPatch.");
                                if (null === e.model || void 0 === e.model) throw new c.w("model", "Required parameter requestParameters.model was null or undefined when calling v2UniversesUniverseIdConfigurationPatch.");
                                return s = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v2/universes/{universeId}/configuration".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/universes/{universeId}/configuration",
                                    method: "PATCH",
                                    headers: r,
                                    query: s,
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
                                            universeAvatarAssetOverrides: void 0 === e.universeAvatarAssetOverrides ? void 0 : e.universeAvatarAssetOverrides.map(ew),
                                            universeAvatarMinScales: eP(e.universeAvatarMinScales),
                                            universeAvatarMaxScales: eP(e.universeAvatarMaxScales),
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
                                return n = i.sent(), [2, new c.H(n, function(e) {
                                    return ey(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v2UniversesUniverseIdConfigurationPatch = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v2UniversesUniverseIdConfigurationPatchRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t
        }(c._)),
        eG = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return v(t, e), t.prototype.v2UniversesUniverseIdPlacesGetRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v2UniversesUniverseIdPlacesGet.");
                                return s = {}, void 0 !== e.extendedSettings && (s.extendedSettings = e.extendedSettings), void 0 !== e.sortOrder && (s.sortOrder = e.sortOrder), void 0 !== e.limit && (s.limit = e.limit), void 0 !== e.cursor && (s.cursor = e.cursor), r = {}, [4, this.request({
                                    path: "/v2/universes/{universeId}/places".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/universes/{universeId}/places",
                                    method: "GET",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n, function(e) {
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
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v2UniversesUniverseIdPlacesGetRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t.prototype.v2UniversesUniverseIdShutdownPostRaw = function(e, t) {
                return h(this, void 0, void 0, function() {
                    var s, r, n;
                    return p(this, function(i) {
                        switch (i.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new c.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v2UniversesUniverseIdShutdownPost.");
                                return s = {}, r = {}, [4, this.request({
                                    path: "/v2/universes/{universeId}/shutdown".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/universes/{universeId}/shutdown",
                                    method: "POST",
                                    headers: r,
                                    query: s
                                }, t)];
                            case 1:
                                return n = i.sent(), [2, new c.H(n)]
                        }
                    })
                })
            }, t.prototype.v2UniversesUniverseIdShutdownPost = function(e, t) {
                return h(this, void 0, void 0, function() {
                    return p(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.v2UniversesUniverseIdShutdownPostRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, t
        }(c._);
    e.s(["S", 0, eT, "x", 0, eq, "K", 0, {
        None: "None",
        Activate: "Activate",
        Update: "Update",
        Deactivate: "Deactivate"
    }, "j", 0, eS, "G", 0, eG], 37603);
    var eC = e.i(213067),
        eD = e.i(272593),
        eE = e.i(227987),
        eL = ((t = eL || {})[t.UnknownError = 0] = "UnknownError", t[t.InvalidUniverse = 1] = "InvalidUniverse", t[t.NoRootPlace = 2] = "NoRootPlace", t[t.InvalidUniversePermissions = 3] = "InvalidUniversePermissions", t[t.InvalidRootPlace = 6] = "InvalidRootPlace", t[t.MaxPlacesReached = 7] = "MaxPlacesReached", t[t.CreatorAccountTooYoung = 16] = "CreatorAccountTooYoung", t);
    e.s(["f", 0, eL], 324562);
    var eM = ((s = {})[s.UnauthorizedRequest = 0] = "UnauthorizedRequest", s[s.NoPermission = 5] = "NoPermission", s[s.InvalidFormat = 1] = "InvalidFormat", s[s.FileNotPresent = 2] = "FileNotPresent", s[s.TargetItemInvalid = 4] = "TargetItemInvalid", s[s.UploadTooOften = 3] = "UploadTooOften", s),
        ek = ((r = {})[r.NoRootPlace = 5] = "NoRootPlace", r[r.UnauthorizedRequest = 0] = "UnauthorizedRequest", r[r.UnauthorizedToConfigureUniverse = 4] = "UnauthorizedToConfigureUniverse", r[r.UniverseDoesNotExist = 3] = "UniverseDoesNotExist", r);
    e.s(["D", () => ek, "N", () => eM], 368851);
    var eH = ((n = eH || {})[n.Unauthorized = 0] = "Unauthorized", n[n.NoPermission = 1] = "NoPermission", n[n.TitleTooLong = 2] = "TitleTooLong", n[n.TitleEmpty = 3] = "TitleEmpty", n[n.UrlEmpty = 4] = "UrlEmpty", n[n.UrlWrongFormat = 5] = "UrlWrongFormat", n[n.MalformedRequest = 6] = "MalformedRequest", n[n.LinkNotFound = 7] = "LinkNotFound", n[n.TypeInvalid = 8] = "TypeInvalid", n[n.RequestCannotBeProcessed = 10] = "RequestCannotBeProcessed", n[n.TitleModerated = 11] = "TitleModerated", n[n.InsufficientGroupPermission = 18] = "InsufficientGroupPermission", n);
    e.s(["f", 0, eH], 269780);
    var eV = ((i = eV || {})[i.UnknownError = 0] = "UnknownError", i[i.InvalidUniverse = 1] = "InvalidUniverse", i[i.InvalidUniversePermissions = 2] = "InvalidUniversePermissions", i[i.NameOrDescriptionRejected = 7] = "NameOrDescriptionRejected", i[i.NameTooLong = 8] = "NameTooLong", i[i.NoRootPlace = 12] = "NoRootPlace", i[i.MissingLuobuTerms = 29] = "MissingLuobuTerms", i[i.CreatorAccountTooYoung = 40] = "CreatorAccountTooYoung", i[i.PromotionalTextRejected = 52] = "PromotionalTextRejected", i[i.PromotionalTextSafetyUnavailable = 53] = "PromotionalTextSafetyUnavailable", i);
    e.s(["f", 0, eV], 858832);
    var ex = ((a = ex || {})[a.UnknownError = 0] = "UnknownError", a[a.InvalidUniverse = 2] = "InvalidUniverse", a[a.NoRootPlace = 3] = "NoRootPlace", a[a.UpdatedTooOften = 5] = "UpdatedTooOften", a);
    e.s(["f", 0, ex], 570006);
    var eN = ((o = eN || {}).User = "User", o.Group = "Group", o.Team = "Team", o),
        eF = ((u = eF || {}).GameName = "GameName", u.GameCreated = "GameCreated", u.LastUpdated = "LastUpdated", u);
    let eO = new class {
        async isUserEmailVerified() {
            return !!(await this.userApi.v1UserIsVerifiedCreatorGet()).isVerifiedCreator
        }
        getGroups() {
            return this.userApi.v1UserGroupsCanmanageGet()
        }
        getGroupsPlusManageItems() {
            return this.userApi.v1UserGroupsCanmanagegamesoritemsGet()
        }
        getGroupUniverses(e, t, s, r, n) {
            let i = {
                groupId: e,
                isArchived: t,
                sortOrder: s && $[s],
                limit: r,
                cursor: n
            };
            return this.groupsApi.v1GroupsGroupIdUniversesGet(i)
        }
        getUserUniverses(e, t, s, r) {
            let n = {
                isArchived: e,
                sortOrder: t && ev[t],
                limit: s,
                cursor: r
            };
            return this.userApi.v1UserUniversesGet(n)
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
        getPlacesOfUniverse(e, t, s, r) {
            let n = arguments.length > 4 && void 0 !== arguments[4] && arguments[4];
            return this.universesApi.v1UniversesUniverseIdPlacesGet({
                universeId: e,
                sortOrder: t,
                limit: s,
                cursor: r,
                isUniverseCreation: n
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
        getHistoricalData(e, t, s, r) {
            return this.statisticsApi.v1PlacesPlaceIdStatsTypeGet({
                placeId: e,
                type: t,
                granularity: s,
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
        setUniverseConfigurationV2(e, t, s, r, n, i, a, o, u, d, c, l, v, h, p, m) {
            return this.universeSettingsApiV2.v2UniversesUniverseIdConfigurationPatch({
                universeId: e,
                model: {
                    name: t,
                    description: s,
                    studioAccessToApisAllowed: r,
                    isMeshTextureApiAccessAllowed: n,
                    allowPrivateServers: i,
                    privateServerPrice: a,
                    isFriendsOnly: o,
                    playableDevices: u,
                    isForSale: d,
                    price: c,
                    fiatBasePriceId: l,
                    fiatProductChangeType: v,
                    audiences: h,
                    demoModeEnabled: p,
                    promotionalText: m
                }
            })
        }
        async shutDownAllServers(e) {
            try {
                await this.universesApiV2.v2UniversesUniverseIdShutdownPost({
                    universeId: e
                })
            } catch (t) {
                let e = await (0, eE.f)(t);
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
        searchUniverses(e, t, s, r, n, i, a, o, u) {
            let d = "";
            void 0 !== t && (d += t), void 0 !== r && (d += " archived:".concat(r ? "True" : "False")), void 0 !== n && (d += " active:".concat(n ? "True" : "False")), d += " creator:".concat(e), e === eN.Group && void 0 !== s && (d += " groups:".concat(s));
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
                let e = await (0, eE.f)(t);
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
        saveSocialLink(e, t, s, r) {
            return this.socialLinksApi.v1UniversesUniverseIdSocialLinksPost({
                universeId: e,
                request: {
                    type: t,
                    url: s,
                    title: r
                }
            })
        }
        updateSocialLink(e, t, s, r, n) {
            return this.socialLinksApi.v1UniversesUniverseIdSocialLinksSocialLinkIdPatch({
                universeId: e,
                socialLinkId: t,
                request: {
                    type: s,
                    url: r,
                    title: n
                }
            })
        }
        async getPlaceDetailInfo(e, t) {
            try {
                return await this.placesApiV2.v2PlacesPlaceIdGet(e, t)
            } catch (t) {
                let e = await (0, eE.f)(t);
                if (e) throw new eC.f(e.code, e.message);
                throw t
            }
        }
        async patchPlaceConfigurationInfo(e, t) {
            try {
                return await this.placesApiV2.v2PlacesPlaceIdPatch(e, t)
            } catch (t) {
                let e = await (0, eE.f)(t);
                if (e) throw new eC.f(e.code, e.message);
                throw t
            }
        }
        async uploadAutoGeneratedThumbnail(e) {
            return this.thumbnailsApi.v1UniversesUniverseIdThumbnailsAutoGeneratedPost({
                universeId: e
            })
        }
        async updateThumbnailAltText(e, t, s) {
            return this.thumbnailsApi.v1UniversesUniverseIdThumbnailsAltTextPost({
                universeId: e,
                request: {
                    mediaAssetId: t,
                    mediaAssetAltText: s
                }
            })
        }
        async getGenresList(e) {
            try {
                return await this.assetsApi.v1AssetsGenresGet(e)
            } catch (t) {
                let e = await (0, eE.f)(t);
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
                let e = await (0, eE.f)(t);
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
                let e = await (0, eE.f)(t);
                if (e) throw new eC.f(e.code, e.message);
                throw t
            }
        }
        async getAssetPublishedVersions(e, t, s, r) {
            try {
                return await this.assetsApi.v1AssetsAssetIdPublishedVersionsGet({
                    assetId: e,
                    sortOrder: t,
                    limit: s,
                    cursor: r
                })
            } catch (t) {
                let e = await (0, eE.f)(t);
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
                let e = await (0, eE.f)(t);
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
                let e = await (0, eE.f)(t);
                if (e) throw new eC.f(e.code, e.message);
                throw t
            }
        }
        async getAssetSavedVersions(e, t, s, r) {
            try {
                return await this.assetsApi.v1AssetsAssetIdSavedVersionsGet({
                    assetId: e,
                    sortOrder: t,
                    limit: s,
                    cursor: r
                })
            } catch (t) {
                let e = await (0, eE.f)(t);
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
                let e = await (0, eE.f)(t);
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
                let e = await (0, eE.f)(t);
                if (e) throw new eC.f(e.code, e.message);
                throw t
            }
        }
        constructor() {
            (0, d._)(this, "assetsApi", void 0), (0, d._)(this, "groupsApi", void 0), (0, d._)(this, "placesApi", void 0), (0, d._)(this, "searchApi", void 0), (0, d._)(this, "statisticsApi", void 0), (0, d._)(this, "universesApi", void 0), (0, d._)(this, "universesApiV2", void 0), (0, d._)(this, "universeSettingsApi", void 0), (0, d._)(this, "universeSettingsApiV2", void 0), (0, d._)(this, "userApi", void 0), (0, d._)(this, "socialLinksApi", void 0), (0, d._)(this, "placesApiV2", void 0), (0, d._)(this, "thumbnailsApi", void 0), (0, d._)(this, "iconApi", void 0), (0, d._)(this, "teamCreateApi", void 0);
            let e = (0, eD.f)("develop", "bedev1");
            this.assetsApi = new Z(e), this.groupsApi = new Q(e), this.placesApi = new et(e), this.searchApi = new es(e), this.statisticsApi = new ei(e), this.universesApi = new ec(e), this.universesApiV2 = new eG(e), this.universeSettingsApi = new ed(e), this.universeSettingsApiV2 = new eS(e), this.userApi = new el(e), this.socialLinksApi = new en(e), this.placesApiV2 = new eq(e), this.thumbnailsApi = new eu(e), this.iconApi = new ee(e), this.teamCreateApi = new eo(e)
        }
    };
    e.s(["f", 0, eO], 773057)
}, 213067, e => {
    "use strict";
    var t = e.i(805290);
    e.s(["f", 0, class e extends Error {
        constructor(s, r = "") {
            super("Generic BEDEV1 Error"), (0, t._)(this, "code", void 0), (0, t._)(this, "message", void 0), this.code = s, this.message = r, Error.captureStackTrace && Error.captureStackTrace(this, e)
        }
    }])
}, 185915, e => {
    "use strict";
    e.s(["f", 0, function(e) {
        return e && "object" == typeof e && "response" in e ? e.response : e && "object" == typeof e && "json" in e ? e : null
    }])
}, 227987, e => {
    "use strict";
    var t = e.i(185915);
    async function s(e) {
        try {
            let s = (0, t.f)(e);
            if (s) {
                let e = await s.json();
                if (e.errors.length > 0) {
                    let t = e.errors[0];
                    if (t) return {
                        status: s.status,
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
    e.s(["f", 0, s])
}, 759283, 253536, e => {
    "use strict";
    var t = e.i(218701),
        s = e.i(307529),
        r = e.i(251622),
        n = e.i(260022);
    let i = "".concat((0, n.H)("global"), "/docs/reference/engine/classes/Player#GetJoinData"),
        a = (0, n.h)("developerArticleProductsInGamePurchasesUrl", "production", "global"),
        o = (0, n.h)("developerArticleBadgesSpecialGameAwardsUrl", "production", "global"),
        u = "".concat((0, n.H)("global"), "/docs/production/monetization/game-passes"),
        d = (0, n.h)("developerArticleCreateVipServerUrl", "production", "global"),
        c = "".concat((0, n.H)("global"), "/docs/production/publishing/publish-experiences-and-places#release-to-the-public"),
        l = "".concat((0, n.H)("global"), "/docs/projects/assets/privacy"),
        v = "".concat((0, n.H)("global"), "/docs/parts/models#distribute-models"),
        h = "".concat((0, n.H)("global"), "/docs/art/marketplace/publishing-to-marketplace#sale-location"),
        p = "".concat((0, n.H)("global"), "/docs/production/monetization/subscriptions#creating-subscriptions"),
        m = "".concat((0, n.H)("global"), "/docs/production/game-design/subscription-design#bundles"),
        f = "".concat((0, n.H)("global"), "/docs/production/monetization/subscriptions#earning-with-subscriptions"),
        I = (0, n.h)("robloxCommunityStandardsUrl", "production", "global"),
        w = "".concat((0, n.H)("global"), "/docs/art/marketplace/marketplace-policy#ugc-program-guidelines"),
        U = "".concat((0, n.H)("global"), "/docs/art/marketplace/marketplace-fees-and-commissions#publishing-advance"),
        P = "".concat((0, n.H)("global"), "/docs/production/publishing/account-verification");
    (0, n.H)("global"), (0, n.H)("global");
    let y = (0, n.h)("ugcSubscriptionTermsOfUseUrl", "production", "global"),
        g = (0, n.h)("robloxTermsOfUseUrl", "production", "global"),
        A = (0, n.h)("advertisingStandardsUrl", "production", "global"),
        b = "".concat((0, n.H)("global"), "/docs/production/publishing/account-verification"),
        R = "".concat((0, n.H)("global"), "/docs/production/monetization/avatar-creation-token");
    e.s(["F", 0, b, "U", 0, l, "j", 0, o, "M", 0, P, "Y", 0, a, "Z", 0, v, "e", 0, i, "P", 0, w, "T", 0, "https://about.roblox.com/newsroom/2025/09/roblox-moments-user-generated-discovery", "q", 0, u, "I", 0, d, "G", 0, U, "k", 0, c, "K", 0, A, "v", 0, I, "V", 0, g, "i", 0, h, "W", 0, f, "l", 0, m, "d", 0, p, "x", 0, y, "X", 0, R], 253536);
    let T = {
            [s.f.Place]: r.U.Game,
            [s.f.SharedExperiences]: r.U.Game,
            [s.f.MyExperiences]: r.U.Game,
            [s.f.ShareLink]: r.U.Game,
            [s.f.Moments]: r.U.Game,
            [s.f.TShirt]: r.U.CatalogAsset,
            [s.f.Shirt]: r.U.CatalogAsset,
            [s.f.Pants]: r.U.CatalogAsset,
            [s.f.Hat]: r.U.CatalogAsset,
            [s.f.HairAccessory]: r.U.CatalogAsset,
            [s.f.FaceAccessory]: r.U.CatalogAsset,
            [s.f.NeckAccessory]: r.U.CatalogAsset,
            [s.f.ShoulderAccessory]: r.U.CatalogAsset,
            [s.f.FrontAccessory]: r.U.CatalogAsset,
            [s.f.BackAccessory]: r.U.CatalogAsset,
            [s.f.WaistAccessory]: r.U.CatalogAsset,
            [s.f.TShirtAccessory]: r.U.CatalogAsset,
            [s.f.ShirtAccessory]: r.U.CatalogAsset,
            [s.f.PantsAccessory]: r.U.CatalogAsset,
            [s.f.JacketAccessory]: r.U.CatalogAsset,
            [s.f.SweaterAccessory]: r.U.CatalogAsset,
            [s.f.ShortsAccessory]: r.U.CatalogAsset,
            [s.f.DressSkirtAccessory]: r.U.CatalogAsset,
            [s.f.EmoteAnimation]: r.U.CatalogAsset,
            [s.f.EyebrowAccessory]: r.U.CatalogAsset,
            [s.f.EyelashAccessory]: r.U.CatalogAsset,
            [s.f.FaceMakeup]: r.U.CatalogAsset,
            [s.f.LipMakeup]: r.U.CatalogAsset,
            [s.f.EyeMakeup]: r.U.CatalogAsset,
            [s.f.AvatarBackground]: r.U.CatalogAsset,
            [s.f.AvatarLooks]: r.U.CatalogAsset,
            [s.f.Showcase]: r.U.CatalogAsset,
            [s.f.AllCatalogAsset]: r.U.CatalogAsset,
            [s.f.Decal]: r.U.LibraryAsset,
            [s.f.Image]: r.U.LibraryAsset,
            [s.f.Audio]: r.U.LibraryAsset,
            [s.f.Model]: r.U.LibraryAsset,
            [s.f.Mesh]: r.U.LibraryAsset,
            [s.f.MeshPart]: r.U.LibraryAsset,
            [s.f.Plugin]: r.U.LibraryAsset,
            [s.f.Animation]: r.U.LibraryAsset,
            [s.f.FontFamily]: r.U.LibraryAsset,
            [s.f.Video]: r.U.LibraryAsset,
            [s.f.Event]: r.U.Event,
            [s.f.PastEvent]: r.U.Event,
            [s.f.DraftEvent]: r.U.Event,
            [s.f.UpcomingEvent]: r.U.Event,
            [s.f.StorePreviewVideo]: r.U.LibraryAsset,
            [s.f.GamePreviewVideo]: r.U.LibraryAsset,
            [s.f.TextDocument]: r.U.LibraryAsset,
            [s.f.AssetPermissionRequests]: r.U.Game
        },
        q = {
            [r.U.Game]: "experiences",
            [r.U.CatalogAsset]: "catalog",
            [r.U.LibraryAsset]: "library",
            [r.U.Bundle]: "bundle",
            [r.U.Badge]: "badges",
            [r.U.GamePass]: "passes",
            [r.U.DeveloperProduct]: "developer-products",
            [r.U.TranslatorGame]: "experiences",
            [r.U.Places]: "places",
            [r.U.CreatedPlaces]: "places",
            [r.U.Event]: "events",
            [r.U.Notifications]: "notifications",
            [r.U.ExperienceSubscription]: "experience-subscriptions",
            [r.U.Advanced]: "advanced",
            [r.U.AvatarCreationToken]: "avatar-creation-tokens",
            [r.U.ReferralRewards]: "referral-reward-details",
            [r.U.Environment]: "environments",
            [r.U.Look]: "look",
            [r.U.Alert]: "alerts",
            [r.U.Journey]: "analytics/journeys",
            [r.U.DataCapture]: "data-captures"
        },
        S = {
            [r.U.Game]: t.V.gameIcon,
            [r.U.CatalogAsset]: t.V.assetThumbnail,
            [r.U.LibraryAsset]: t.V.assetThumbnail,
            [r.U.Bundle]: t.V.bundleThumbnail,
            [r.U.Badge]: t.V.badgeIcon,
            [r.U.GamePass]: t.V.gamePassIcon,
            [r.U.DeveloperProduct]: t.V.developerProductIcon,
            [r.U.TranslatorGame]: t.V.gameIcon,
            [r.U.Places]: t.V.placeIcon,
            [r.U.CreatedPlaces]: t.V.placeIcon,
            [r.U.Event]: t.V.universeThumbnail,
            [r.U.Notifications]: t.V.assetThumbnail,
            [r.U.ExperienceSubscription]: t.V.assetThumbnail,
            [r.U.Advanced]: t.V.assetThumbnail,
            [r.U.AvatarCreationToken]: t.V.bundleThumbnail,
            [r.U.ReferralRewards]: t.V.assetThumbnail,
            [r.U.Environment]: t.V.universeThumbnail,
            [r.U.Alert]: t.V.universeThumbnail,
            [r.U.Journey]: t.V.universeThumbnail,
            [r.U.DataCapture]: t.V.universeThumbnail,
            [r.U.Look]: t.V.assetThumbnail
        },
        G = {
            [r.U.Game]: t.X.AutoGenerated,
            [r.U.Bundle]: t.X.AutoGenerated,
            [r.U.CatalogAsset]: t.X.PlaceHolder,
            [r.U.LibraryAsset]: t.X.AutoGenerated,
            [r.U.Badge]: t.X.AutoGenerated,
            [r.U.GamePass]: t.X.AutoGenerated,
            [r.U.DeveloperProduct]: t.X.AutoGenerated,
            [r.U.TranslatorGame]: t.X.PlaceHolder,
            [r.U.Places]: t.X.AutoGenerated,
            [r.U.CreatedPlaces]: t.X.AutoGenerated,
            [r.U.Event]: t.X.PlaceHolder,
            [r.U.Notifications]: t.X.AutoGenerated,
            [r.U.ExperienceSubscription]: t.X.AutoGenerated,
            [r.U.Advanced]: t.X.AutoGenerated,
            [r.U.AvatarCreationToken]: t.X.AutoGenerated,
            [r.U.ReferralRewards]: t.X.AutoGenerated,
            [r.U.Environment]: t.X.AutoGenerated,
            [r.U.Look]: t.X.AutoGenerated,
            [r.U.Alert]: t.X.AutoGenerated,
            [r.U.Journey]: t.X.AutoGenerated,
            [r.U.DataCapture]: t.X.AutoGenerated
        },
        C = {
            [s.f.Place]: "Label.Games",
            [s.f.MyExperiences]: "Label.Games",
            [s.f.SharedExperiences]: "Label.Games",
            [s.f.TShirt]: "Label.TShirts",
            [s.f.Shirt]: "Label.Shirts",
            [s.f.Pants]: "Label.Pants",
            [s.f.Hat]: "Label.Hats",
            [s.f.HairAccessory]: "Label.HairAccessories",
            [s.f.FaceAccessory]: "Label.FaceAccessories",
            [s.f.NeckAccessory]: "Label.NeckAccessories",
            [s.f.ShoulderAccessory]: "Label.ShoulderAccessories",
            [s.f.FrontAccessory]: "Label.FrontAccessories",
            [s.f.BackAccessory]: "Label.BackAccessories",
            [s.f.WaistAccessory]: "Label.WaistAccessories",
            [s.f.TShirtAccessory]: "Label.TShirts",
            [s.f.ShirtAccessory]: "Label.Shirts",
            [s.f.PantsAccessory]: "Label.Pants",
            [s.f.JacketAccessory]: "Label.Jackets",
            [s.f.SweaterAccessory]: "Label.Sweaters",
            [s.f.ShortsAccessory]: "Label.ShortsAccessories",
            [s.f.DressSkirtAccessory]: "Label.Skirts",
            [s.f.EmoteAnimation]: "Label.Emote",
            [s.f.EyebrowAccessory]: "Label.EyebrowAccessories",
            [s.f.EyelashAccessory]: "Label.EyelashAccessories",
            [s.f.FaceMakeup]: "Label.FaceMakeupAccessories",
            [s.f.LipMakeup]: "Label.LipMakeupAccessories",
            [s.f.EyeMakeup]: "Label.EyeMakeupAccessories",
            [s.f.AvatarBackground]: "Label.Backgrounds",
            [s.f.AvatarLooks]: "Label.Avatars",
            [s.f.Showcase]: "Label.Showcases",
            [s.f.AllCatalogAsset]: "Label.AllAssetTypes",
            [s.f.Decal]: "Label.Decals",
            [s.f.Image]: "Label.Images",
            [s.f.Audio]: "Label.Audios",
            [s.f.Model]: "Label.Models",
            [s.f.Mesh]: "Label.Meshes",
            [s.f.MeshPart]: "Label.MeshParts",
            [s.f.Plugin]: "Label.Plugins",
            [s.f.FontFamily]: "Label.FontFamily",
            [s.f.Animation]: "Label.Animations",
            [s.f.Video]: "Label.Videos",
            [s.f.Event]: "Label.Events",
            [s.f.PastEvent]: "Label.PastEvents",
            [s.f.DraftEvent]: "Label.DraftEvents",
            [s.f.UpcomingEvent]: "Label.UpcomingEvents",
            [s.f.ShareLink]: "Label.ShareLinks",
            [s.f.Moments]: "Label.Moments",
            [s.f.StorePreviewVideo]: "Label.StorePreviewVideo",
            [s.f.GamePreviewVideo]: "Label.GamePreviewVideo",
            [s.f.TextDocument]: "Label.TextDocuments",
            [s.f.AssetPermissionRequests]: "Label.Requests"
        },
        D = {
            [s.f.Place]: "Label.Games",
            [s.f.MyExperiences]: "Label.Games",
            [s.f.SharedExperiences]: "Label.Games",
            [s.f.TShirt]: "Label.TShirt",
            [s.f.Shirt]: "Label.Shirt",
            [s.f.Pants]: "Label.Pants",
            [s.f.Hat]: "Label.Hat",
            [s.f.HairAccessory]: "Label.HairAccessory",
            [s.f.FaceAccessory]: "Label.FaceAccessory",
            [s.f.NeckAccessory]: "Label.NeckAccessory",
            [s.f.ShoulderAccessory]: "Label.ShoulderAccessory",
            [s.f.FrontAccessory]: "Label.FrontAccessory",
            [s.f.BackAccessory]: "Label.BackAccessory",
            [s.f.WaistAccessory]: "Label.WaistAccessory",
            [s.f.TShirtAccessory]: "Label.TShirt",
            [s.f.ShirtAccessory]: "Label.Shirt",
            [s.f.PantsAccessory]: "Label.Pants",
            [s.f.JacketAccessory]: "Label.Jacket",
            [s.f.SweaterAccessory]: "Label.Sweater",
            [s.f.ShortsAccessory]: "Label.ShortsAccessories",
            [s.f.DressSkirtAccessory]: "Label.Skirt",
            [s.f.EmoteAnimation]: "Label.Emote",
            [s.f.EyebrowAccessory]: "Label.EyebrowAccessory",
            [s.f.EyelashAccessory]: "Label.EyelashAccessory",
            [s.f.FaceMakeup]: "Label.FaceMakeup",
            [s.f.LipMakeup]: "Label.LipMakeup",
            [s.f.EyeMakeup]: "Label.EyeMAkeup",
            [s.f.AvatarBackground]: "Label.AvatarBackground",
            [s.f.AvatarLooks]: "Label.Avatars",
            [s.f.Showcase]: "Label.Showcase",
            [s.f.AllCatalogAsset]: "Label.AllAssetTypes",
            [s.f.Decal]: "Label.Decal",
            [s.f.Image]: "Label.Image",
            [s.f.Audio]: "Label.Audios",
            [s.f.Model]: "Label.Model",
            [s.f.Mesh]: "Label.Mesh",
            [s.f.MeshPart]: "Label.MeshPart",
            [s.f.Plugin]: "Label.Plugin",
            [s.f.Animation]: "Label.Animation",
            [s.f.FontFamily]: "Label.FontFamily",
            [s.f.Video]: "Label.Video",
            [s.f.Event]: "Label.Event",
            [s.f.PastEvent]: "Label.PastEvent",
            [s.f.DraftEvent]: "Label.DraftEvent",
            [s.f.UpcomingEvent]: "Label.UpcomingEvent",
            [s.f.ShareLink]: "Label.ShareLink",
            [s.f.Moments]: "Label.Moments",
            [s.f.StorePreviewVideo]: "Label.StorePreviewVideo",
            [s.f.GamePreviewVideo]: "Label.GamePreviewVideo",
            [s.f.TextDocument]: "Label.TextDocument",
            [s.f.AssetPermissionRequests]: "Label.Requests"
        },
        E = {
            [r.U.Game]: "Label.Games",
            [r.U.CatalogAsset]: "Label.AvatarItems",
            [r.U.Bundle]: "Label.AvatarItem",
            [r.U.LibraryAsset]: "Label.DevelopmentItems",
            [r.U.Badge]: "Label.Badges",
            [r.U.GamePass]: "Label.GamePasses",
            [r.U.DeveloperProduct]: "Label.DeveloperProducts",
            [r.U.TranslatorGame]: "Label.TranslatorGame",
            [r.U.Places]: "Label.Places",
            [r.U.CreatedPlaces]: "Label.Places",
            [r.U.Event]: "Label.Events",
            [r.U.Notifications]: "Label.Notifications",
            [r.U.ExperienceSubscription]: "Label.Subscriptions",
            [r.U.Advanced]: "Header.Title",
            [r.U.AvatarCreationToken]: "Label.AvatarCreationTokens",
            [r.U.ReferralRewards]: "Label.ReferralRewards",
            [r.U.Environment]: "Label.Environments",
            [r.U.Look]: "Label.Looks",
            [r.U.Alert]: "Heading.Alerts",
            [r.U.Journey]: "Heading.Journeys",
            [r.U.DataCapture]: "Heading.DataCaptures"
        },
        L = {
            [r.U.Game]: "Label.Game",
            [r.U.CatalogAsset]: "Label.AvatarItem",
            [r.U.Bundle]: "Label.AvatarItem",
            [r.U.LibraryAsset]: "Label.DevelopmentItem",
            [r.U.Badge]: "Label.Badge",
            [r.U.GamePass]: "Label.GamePass",
            [r.U.DeveloperProduct]: "Label.DeveloperProduct",
            [r.U.TranslatorGame]: "Label.TranslatorGame",
            [r.U.Places]: "Label.Place",
            [r.U.CreatedPlaces]: "Label.Places",
            [r.U.Event]: "Label.Event",
            [r.U.Notifications]: "Label.Notifications",
            [r.U.ExperienceSubscription]: "Label.Subscription",
            [r.U.Advanced]: "Header.Title",
            [r.U.AvatarCreationToken]: "Label.Token",
            [r.U.ReferralRewards]: "Label.ReferralRewards",
            [r.U.Environment]: "Label.Environment",
            [r.U.Look]: "Label.Looks",
            [r.U.Alert]: "Heading.Alert",
            [r.U.Journey]: "Heading.Journey",
            [r.U.DataCapture]: "Heading.DataCapture"
        },
        M = {
            [r.U.Game]: "Heading.Game",
            [r.U.CatalogAsset]: "Heading.AvatarItem",
            [r.U.Bundle]: "Heading.AvatarItem",
            [r.U.LibraryAsset]: "Heading.DevelopmentItem",
            [r.U.Badge]: "Heading.Badge",
            [r.U.GamePass]: "Heading.Pass",
            [r.U.DeveloperProduct]: "Heading.DeveloperProduct",
            [r.U.TranslatorGame]: "Heading.TranslatorGame",
            [r.U.Places]: "Heading.Place",
            [r.U.CreatedPlaces]: "Heading.Place",
            [r.U.Event]: "Heading.Event",
            [r.U.Notifications]: "Heading.Notifications.CreateContent",
            [r.U.ExperienceSubscription]: "Heading.Subscription",
            [r.U.Advanced]: "Header.Title",
            [r.U.AvatarCreationToken]: "Label.AvatarCreationToken",
            [r.U.ReferralRewards]: "Heading.ReferralRewards",
            [r.U.Environment]: "Heading.Environment",
            [r.U.Look]: "Heading.Looks",
            [r.U.Alert]: "Heading.Alert",
            [r.U.Journey]: "Heading.Journey",
            [r.U.DataCapture]: "Heading.DataCapture"
        },
        k = {
            [r.U.Game]: null,
            [r.U.CatalogAsset]: null,
            [r.U.Bundle]: null,
            [r.U.LibraryAsset]: null,
            [r.U.Badge]: "badges/create",
            [r.U.GamePass]: "passes/create",
            [r.U.DeveloperProduct]: "developer-products/create",
            [r.U.ReferralRewards]: "referral-reward-details/create",
            [r.U.TranslatorGame]: null,
            [r.U.Places]: null,
            [r.U.CreatedPlaces]: null,
            [r.U.Event]: "events/create",
            [r.U.Notifications]: null,
            [r.U.ExperienceSubscription]: "experience-subscriptions/create",
            [r.U.Advanced]: null,
            [r.U.AvatarCreationToken]: "avatar-creation-tokens/create",
            [r.U.Environment]: "environments/create",
            [r.U.Look]: "looks/create",
            [r.U.Alert]: "alerts/create",
            [r.U.Journey]: "analytics/journeys/create",
            [r.U.DataCapture]: "observability/data-captures/create"
        },
        H = {
            [r.U.Game]: null,
            [r.U.CatalogAsset]: null,
            [r.U.Bundle]: null,
            [r.U.LibraryAsset]: null,
            [r.U.Badge]: "badges/reorder",
            [r.U.ReferralRewards]: null,
            [r.U.GamePass]: null,
            [r.U.DeveloperProduct]: null,
            [r.U.TranslatorGame]: null,
            [r.U.Places]: null,
            [r.U.CreatedPlaces]: null,
            [r.U.Event]: null,
            [r.U.Notifications]: null,
            [r.U.ExperienceSubscription]: null,
            [r.U.Advanced]: null,
            [r.U.AvatarCreationToken]: null,
            [r.U.Environment]: null,
            [r.U.Look]: null,
            [r.U.Alert]: null,
            [r.U.Journey]: null,
            [r.U.DataCapture]: null
        },
        V = {
            [r.U.Badge]: o,
            [r.U.DeveloperProduct]: a,
            [r.U.GamePass]: u,
            [r.U.CatalogAsset]: h,
            [r.U.ExperienceSubscription]: p,
            [r.U.AvatarCreationToken]: R,
            [r.U.Look]: void 0
        };
    e.s(["l", 0, "rejected", "Z", 0, "fulfilled", "M", 0, C, "K", 0, T, "b", 0, D, "w", 0, E, "r", 0, k, "n", 0, V, "m", 0, L, "e", 0, q, "Y", 0, H, "I", 0, G, "x", 0, M, "j", 0, S, "A", 0, 3e3, "h", 0, -1], 759283)
}, 307529, e => {
    "use strict";
    var t, s = ((t = s || {}).Place = "Place", t.MyExperiences = "MyExperiences", t.SharedExperiences = "SharedExperiences", t.TShirt = "TShirt", t.Shirt = "Shirt", t.Pants = "Pants", t.Hat = "Hat", t.HairAccessory = "HairAccessory", t.FaceAccessory = "FaceAccessory", t.NeckAccessory = "NeckAccessory", t.ShoulderAccessory = "ShoulderAccessory", t.FrontAccessory = "FrontAccessory", t.BackAccessory = "BackAccessory", t.WaistAccessory = "WaistAccessory", t.TShirtAccessory = "TShirtAccessory", t.ShirtAccessory = "ShirtAccessory", t.PantsAccessory = "PantsAccessory", t.JacketAccessory = "JacketAccessory", t.SweaterAccessory = "SweaterAccessory", t.ShortsAccessory = "ShortsAccessory", t.DressSkirtAccessory = "DressSkirtAccessory", t.EyebrowAccessory = "EyebrowAccessory", t.EyelashAccessory = "EyelashAccessory", t.FaceMakeup = "FaceMakeup", t.LipMakeup = "LipMakeup", t.EyeMakeup = "EyeMakeup", t.AvatarBackground = "AvatarBackground", t.AvatarLooks = "AvatarLooks", t.Showcase = "Showcase", t.Decal = "Decal", t.Image = "Image", t.Audio = "Audio", t.Model = "Model", t.Mesh = "Mesh", t.MeshPart = "MeshPart", t.Plugin = "Plugin", t.EmoteAnimation = "EmoteAnimation", t.Animation = "Animation", t.Video = "Video", t.TextDocument = "TextDocument", t.Event = "Event", t.UpcomingEvent = "UpcomingEvent", t.DraftEvent = "DraftEvent", t.PastEvent = "PastEvent", t.FontFamily = "FontFamily", t.ShareLink = "ShareLink", t.Moments = "Moments", t.StorePreviewVideo = "StorePreviewVideo", t.GamePreviewVideo = "GamePreviewVideo", t.AllCatalogAsset = "All", t.AssetPermissionRequests = "AssetPermissionRequests", t);
    e.s(["f", 0, s])
}, 251622, e => {
    "use strict";
    var t, s = ((t = s || {}).Game = "Game", t.Bundle = "Bundle", t.CatalogAsset = "CatalogAsset", t.LibraryAsset = "LibraryAsset", t.GamePass = "Pass", t.Badge = "Badge", t.DeveloperProduct = "DeveloperProduct", t.TranslatorGame = "TranslatorGame", t.Places = "Places", t.CreatedPlaces = "CreatedPlaces", t.Event = "Event", t.Notifications = "Notifications", t.ExperienceSubscription = "Subscription", t.Advanced = "Advanced", t.AvatarCreationToken = "AvatarCreationToken", t.ReferralRewards = "ReferralRewards", t.Environment = "Environment", t.Look = "Look", t.Alert = "Alert", t.Journey = "Journey", t.DataCapture = "DataCapture", t);
    let r = Object.values(s);
    e.s(["U", 0, s, "T", 0, e => r.includes(e)])
}]);

//# debugId=8808a2fb-30b9-63b4-7266-ca69bc3d733f
//# sourceMappingURL=1n3y_d6-gdr84.js.map