;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "65b2903a-4b0b-28b2-07cb-a082a6a2a351")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 309999, e => {
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

    function i(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function i() {
            this.constructor = e
        }
        s(e, t), e.prototype = null === t ? Object.create(t) : (i.prototype = t.prototype, new i)
    }
    var r = function() {
        return (r = Object.assign || function(e) {
            for (var t, s = 1, i = arguments.length; s < i; s++)
                for (var r in t = arguments[s]) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r]);
            return e
        }).apply(this, arguments)
    };

    function o(e, t, s, i) {
        return new(s || (s = Promise))(function(r, o) {
            function a(e) {
                try {
                    u(i.next(e))
                } catch (e) {
                    o(e)
                }
            }

            function n(e) {
                try {
                    u(i.throw(e))
                } catch (e) {
                    o(e)
                }
            }

            function u(e) {
                var t;
                e.done ? r(e.value) : ((t = e.value) instanceof s ? t : new s(function(e) {
                    e(t)
                })).then(a, n)
            }
            u((i = i.apply(e, t || [])).next())
        })
    }

    function a(e, t) {
        var s, i, r, o = {
                label: 0,
                sent: function() {
                    if (1 & r[0]) throw r[1];
                    return r[1]
                },
                trys: [],
                ops: []
            },
            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return a.next = n(0), a.throw = n(1), a.return = n(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
            return this
        }), a;

        function n(n) {
            return function(u) {
                var d = [n, u];
                if (s) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, d[0] && (o = 0)), o;) try {
                    if (s = 1, i && (r = 2 & d[0] ? i.return : d[0] ? i.throw || ((r = i.return) && r.call(i), 0) : i.next) && !(r = r.call(i, d[1])).done) return r;
                    switch (i = 0, r && (d = [2 & d[0], r.value]), d[0]) {
                        case 0:
                        case 1:
                            r = d;
                            break;
                        case 4:
                            return o.label++, {
                                value: d[1],
                                done: !1
                            };
                        case 5:
                            o.label++, i = d[1], d = [0];
                            continue;
                        case 7:
                            d = o.ops.pop(), o.trys.pop();
                            continue;
                        default:
                            if (!(r = (r = o.trys).length > 0 && r[r.length - 1]) && (6 === d[0] || 2 === d[0])) {
                                o = 0;
                                continue
                            }
                            if (3 === d[0] && (!r || d[1] > r[0] && d[1] < r[3])) {
                                o.label = d[1];
                                break
                            }
                            if (6 === d[0] && o.label < r[1]) {
                                o.label = r[1], r = d;
                                break
                            }
                            if (r && o.label < r[2]) {
                                o.label = r[2], o.ops.push(d);
                                break
                            }
                            r[2] && o.ops.pop(), o.trys.pop();
                            continue
                    }
                    d = t.call(e, o)
                } catch (e) {
                    d = [6, e], i = 0
                } finally {
                    s = r = 0
                }
                if (5 & d[0]) throw d[1];
                return {
                    value: d[0] ? d[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function n(e, s) {
        return null == e ? e : {
            imagePreviewAssets: (0, t.exists)(e, "imagePreviewAssets") ? e.imagePreviewAssets : void 0,
            videoPreviewAssets: (0, t.exists)(e, "videoPreviewAssets") ? e.videoPreviewAssets : void 0
        }
    }

    function u(e) {
        var s;
        return null == (s = e) ? s : {
            linkType: (0, t.exists)(s, "linkType") ? s.linkType : void 0,
            url: (0, t.exists)(s, "url") ? s.url : void 0,
            title: (0, t.exists)(s, "title") ? s.title : void 0
        }
    }

    function d(e) {
        return e
    }

    function c(e) {
        return e
    }

    function l(e) {
        return e
    }

    function v(e) {
        if (void 0 !== e) return null === e ? null : {
            targetType: e.targetType,
            targetId: e.targetId,
            collectionName: e.collectionName
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function p(e) {
        var s;
        return null == (s = e) ? s : {
            searchTerm: (0, t.exists)(s, "searchTerm") ? s.searchTerm : void 0,
            rank: (0, t.exists)(s, "rank") ? s.rank : void 0,
            searchVolumeBracket: (0, t.exists)(s, "searchVolumeBracket") ? s.searchVolumeBracket : void 0,
            adoptionBracket: (0, t.exists)(s, "adoptionBracket") ? s.adoptionBracket : void 0
        }
    }

    function h(e) {
        return e
    }

    function y(e) {
        return e
    }

    function m(e, s) {
        var i, o, a, d, c, l, v, p, y, m, x;
        return null == e ? e : r(r(r(r(r(r(r(r({}, null == (i = e) ? i : {
            id: (0, t.exists)(i, "id") ? i.id : void 0,
            name: (0, t.exists)(i, "name") ? i.name : void 0,
            description: (0, t.exists)(i, "description") ? i.description : void 0,
            assetTypeId: (0, t.exists)(i, "assetTypeId") ? i.assetTypeId : void 0,
            socialLinks: (0, t.exists)(i, "socialLinks") ? null === i.socialLinks ? null : i.socialLinks.map(u) : void 0,
            previewAssets: (0, t.exists)(i, "previewAssets") ? n(i.previewAssets) : void 0,
            createTime: (0, t.exists)(i, "createTime") ? null === i.createTime ? null : new Date(i.createTime) : void 0,
            updateTime: (0, t.exists)(i, "updateTime") ? null === i.updateTime ? null : new Date(i.updateTime) : void 0,
            creatingUniverseId: (0, t.exists)(i, "creatingUniverseId") ? i.creatingUniverseId : void 0,
            categoryPath: (0, t.exists)(i, "categoryPath") ? i.categoryPath : void 0
        }), null == (o = e) ? o : {
            durationSeconds: (0, t.exists)(o, "durationSeconds") ? o.durationSeconds : void 0,
            audioType: (0, t.exists)(o, "audioType") ? o.audioType : void 0,
            artist: (0, t.exists)(o, "artist") ? o.artist : void 0,
            title: (0, t.exists)(o, "title") ? o.title : void 0,
            id: (0, t.exists)(o, "id") ? o.id : void 0,
            name: (0, t.exists)(o, "name") ? o.name : void 0,
            description: (0, t.exists)(o, "description") ? o.description : void 0,
            assetTypeId: (0, t.exists)(o, "assetTypeId") ? o.assetTypeId : void 0,
            socialLinks: (0, t.exists)(o, "socialLinks") ? null === o.socialLinks ? null : o.socialLinks.map(u) : void 0,
            previewAssets: (0, t.exists)(o, "previewAssets") ? n(o.previewAssets) : void 0,
            createTime: (0, t.exists)(o, "createTime") ? null === o.createTime ? null : new Date(o.createTime) : void 0,
            updateTime: (0, t.exists)(o, "updateTime") ? null === o.updateTime ? null : new Date(o.updateTime) : void 0,
            creatingUniverseId: (0, t.exists)(o, "creatingUniverseId") ? o.creatingUniverseId : void 0,
            categoryPath: (0, t.exists)(o, "categoryPath") ? o.categoryPath : void 0
        }), null == (a = e) ? a : {
            textureId: (0, t.exists)(a, "textureId") ? a.textureId : void 0,
            id: (0, t.exists)(a, "id") ? a.id : void 0,
            name: (0, t.exists)(a, "name") ? a.name : void 0,
            description: (0, t.exists)(a, "description") ? a.description : void 0,
            assetTypeId: (0, t.exists)(a, "assetTypeId") ? a.assetTypeId : void 0,
            socialLinks: (0, t.exists)(a, "socialLinks") ? null === a.socialLinks ? null : a.socialLinks.map(u) : void 0,
            previewAssets: (0, t.exists)(a, "previewAssets") ? n(a.previewAssets) : void 0,
            createTime: (0, t.exists)(a, "createTime") ? null === a.createTime ? null : new Date(a.createTime) : void 0,
            updateTime: (0, t.exists)(a, "updateTime") ? null === a.updateTime ? null : new Date(a.updateTime) : void 0,
            creatingUniverseId: (0, t.exists)(a, "creatingUniverseId") ? a.creatingUniverseId : void 0,
            categoryPath: (0, t.exists)(a, "categoryPath") ? a.categoryPath : void 0
        }), null == (d = e) ? d : {
            meshId: (0, t.exists)(d, "meshId") ? d.meshId : void 0,
            textureId: (0, t.exists)(d, "textureId") ? d.textureId : void 0,
            id: (0, t.exists)(d, "id") ? d.id : void 0,
            name: (0, t.exists)(d, "name") ? d.name : void 0,
            description: (0, t.exists)(d, "description") ? d.description : void 0,
            assetTypeId: (0, t.exists)(d, "assetTypeId") ? d.assetTypeId : void 0,
            socialLinks: (0, t.exists)(d, "socialLinks") ? null === d.socialLinks ? null : d.socialLinks.map(u) : void 0,
            previewAssets: (0, t.exists)(d, "previewAssets") ? n(d.previewAssets) : void 0,
            createTime: (0, t.exists)(d, "createTime") ? null === d.createTime ? null : new Date(d.createTime) : void 0,
            updateTime: (0, t.exists)(d, "updateTime") ? null === d.updateTime ? null : new Date(d.updateTime) : void 0,
            creatingUniverseId: (0, t.exists)(d, "creatingUniverseId") ? d.creatingUniverseId : void 0,
            categoryPath: (0, t.exists)(d, "categoryPath") ? d.categoryPath : void 0
        }), null == (c = e) ? c : {
            subTypes: (0, t.exists)(c, "subTypes") ? null === c.subTypes ? null : c.subTypes.map(h) : void 0,
            hasScripts: (0, t.exists)(c, "hasScripts") ? c.hasScripts : void 0,
            scriptCount: (0, t.exists)(c, "scriptCount") ? c.scriptCount : void 0,
            objectMeshSummary: (0, t.exists)(c, "objectMeshSummary") ? null == (l = c.objectMeshSummary) ? l : {
                triangles: (0, t.exists)(l, "triangles") ? l.triangles : void 0,
                vertices: (0, t.exists)(l, "vertices") ? l.vertices : void 0
            } : void 0,
            instanceCounts: (0, t.exists)(c, "instanceCounts") ? null == (v = c.instanceCounts) ? v : {
                script: (0, t.exists)(v, "script") ? v.script : void 0,
                meshPart: (0, t.exists)(v, "meshPart") ? v.meshPart : void 0,
                animation: (0, t.exists)(v, "animation") ? v.animation : void 0,
                decal: (0, t.exists)(v, "decal") ? v.decal : void 0,
                audio: (0, t.exists)(v, "audio") ? v.audio : void 0,
                tool: (0, t.exists)(v, "tool") ? v.tool : void 0
            } : void 0,
            capabilities: (0, t.exists)(c, "capabilities") ? null == (p = c.capabilities) ? p : {
                shouldSandbox: (0, t.exists)(p, "shouldSandbox") ? p.shouldSandbox : void 0
            } : void 0,
            id: (0, t.exists)(c, "id") ? c.id : void 0,
            name: (0, t.exists)(c, "name") ? c.name : void 0,
            description: (0, t.exists)(c, "description") ? c.description : void 0,
            assetTypeId: (0, t.exists)(c, "assetTypeId") ? c.assetTypeId : void 0,
            socialLinks: (0, t.exists)(c, "socialLinks") ? null === c.socialLinks ? null : c.socialLinks.map(u) : void 0,
            previewAssets: (0, t.exists)(c, "previewAssets") ? n(c.previewAssets) : void 0,
            createTime: (0, t.exists)(c, "createTime") ? null === c.createTime ? null : new Date(c.createTime) : void 0,
            updateTime: (0, t.exists)(c, "updateTime") ? null === c.updateTime ? null : new Date(c.updateTime) : void 0,
            creatingUniverseId: (0, t.exists)(c, "creatingUniverseId") ? c.creatingUniverseId : void 0,
            categoryPath: (0, t.exists)(c, "categoryPath") ? c.categoryPath : void 0
        }), null == (y = e) ? y : {
            album: (0, t.exists)(y, "album") ? y.album : void 0,
            genre: (0, t.exists)(y, "genre") ? y.genre : void 0,
            id: (0, t.exists)(y, "id") ? y.id : void 0,
            name: (0, t.exists)(y, "name") ? y.name : void 0,
            description: (0, t.exists)(y, "description") ? y.description : void 0,
            assetTypeId: (0, t.exists)(y, "assetTypeId") ? y.assetTypeId : void 0,
            socialLinks: (0, t.exists)(y, "socialLinks") ? null === y.socialLinks ? null : y.socialLinks.map(u) : void 0,
            previewAssets: (0, t.exists)(y, "previewAssets") ? n(y.previewAssets) : void 0,
            createTime: (0, t.exists)(y, "createTime") ? null === y.createTime ? null : new Date(y.createTime) : void 0,
            updateTime: (0, t.exists)(y, "updateTime") ? null === y.updateTime ? null : new Date(y.updateTime) : void 0,
            creatingUniverseId: (0, t.exists)(y, "creatingUniverseId") ? y.creatingUniverseId : void 0,
            categoryPath: (0, t.exists)(y, "categoryPath") ? y.categoryPath : void 0
        }), null == (m = e) ? m : {
            hasScripts: (0, t.exists)(m, "hasScripts") ? m.hasScripts : void 0,
            scriptCount: (0, t.exists)(m, "scriptCount") ? m.scriptCount : void 0,
            id: (0, t.exists)(m, "id") ? m.id : void 0,
            name: (0, t.exists)(m, "name") ? m.name : void 0,
            description: (0, t.exists)(m, "description") ? m.description : void 0,
            assetTypeId: (0, t.exists)(m, "assetTypeId") ? m.assetTypeId : void 0,
            socialLinks: (0, t.exists)(m, "socialLinks") ? null === m.socialLinks ? null : m.socialLinks.map(u) : void 0,
            previewAssets: (0, t.exists)(m, "previewAssets") ? n(m.previewAssets) : void 0,
            createTime: (0, t.exists)(m, "createTime") ? null === m.createTime ? null : new Date(m.createTime) : void 0,
            updateTime: (0, t.exists)(m, "updateTime") ? null === m.updateTime ? null : new Date(m.updateTime) : void 0,
            creatingUniverseId: (0, t.exists)(m, "creatingUniverseId") ? m.creatingUniverseId : void 0,
            categoryPath: (0, t.exists)(m, "categoryPath") ? m.categoryPath : void 0
        }), null == (x = e) ? x : {
            category: (0, t.exists)(x, "category") ? x.category : void 0,
            subcategory: (0, t.exists)(x, "subcategory") ? x.subcategory : void 0,
            id: (0, t.exists)(x, "id") ? x.id : void 0,
            name: (0, t.exists)(x, "name") ? x.name : void 0,
            description: (0, t.exists)(x, "description") ? x.description : void 0,
            assetTypeId: (0, t.exists)(x, "assetTypeId") ? x.assetTypeId : void 0,
            socialLinks: (0, t.exists)(x, "socialLinks") ? null === x.socialLinks ? null : x.socialLinks.map(u) : void 0,
            previewAssets: (0, t.exists)(x, "previewAssets") ? n(x.previewAssets) : void 0,
            createTime: (0, t.exists)(x, "createTime") ? null === x.createTime ? null : new Date(x.createTime) : void 0,
            updateTime: (0, t.exists)(x, "updateTime") ? null === x.updateTime ? null : new Date(x.updateTime) : void 0,
            creatingUniverseId: (0, t.exists)(x, "creatingUniverseId") ? x.creatingUniverseId : void 0,
            categoryPath: (0, t.exists)(x, "categoryPath") ? x.categoryPath : void 0
        })
    }

    function x(e, s) {
        return null == e ? e : {
            creator: (0, t.exists)(e, "creator") ? e.creator : void 0,
            userId: (0, t.exists)(e, "userId") ? e.userId : void 0,
            groupId: (0, t.exists)(e, "groupId") ? e.groupId : void 0,
            name: (0, t.exists)(e, "name") ? e.name : void 0,
            verified: (0, t.exists)(e, "verified") ? e.verified : void 0,
            latestGroupUpdaterUserId: (0, t.exists)(e, "latestGroupUpdaterUserId") ? e.latestGroupUpdaterUserId : void 0,
            latestGroupUpdaterUserName: (0, t.exists)(e, "latestGroupUpdaterUserName") ? e.latestGroupUpdaterUserName : void 0
        }
    }

    function f(e, s) {
        return null == e ? e : {
            significand: (0, t.exists)(e, "significand") ? e.significand : void 0,
            exponent: (0, t.exists)(e, "exponent") ? e.exponent : void 0
        }
    }

    function g(e, s) {
        var i;
        return null == e ? e : {
            purchasePrice: (0, t.exists)(e, "purchasePrice") ? null == (i = e.purchasePrice) ? i : {
                currencyCode: (0, t.exists)(i, "currencyCode") ? i.currencyCode : void 0,
                quantity: (0, t.exists)(i, "quantity") ? f(i.quantity) : void 0
            } : void 0,
            purchasable: (0, t.exists)(e, "purchasable") ? e.purchasable : void 0
        }
    }

    function T(e, s) {
        return null == e ? e : {
            showVotes: (0, t.exists)(e, "showVotes") ? e.showVotes : void 0,
            upVotes: (0, t.exists)(e, "upVotes") ? e.upVotes : void 0,
            downVotes: (0, t.exists)(e, "downVotes") ? e.downVotes : void 0,
            canVote: (0, t.exists)(e, "canVote") ? e.canVote : void 0,
            userVote: (0, t.exists)(e, "userVote") ? e.userVote : void 0,
            hasVoted: (0, t.exists)(e, "hasVoted") ? e.hasVoted : void 0,
            voteCount: (0, t.exists)(e, "voteCount") ? e.voteCount : void 0,
            upVotePercent: (0, t.exists)(e, "upVotePercent") ? e.upVotePercent : void 0
        }
    }

    function w(e) {
        var s;
        return null == (s = e) ? s : {
            voting: (0, t.exists)(s, "voting") ? T(s.voting) : void 0,
            creator: (0, t.exists)(s, "creator") ? x(s.creator) : void 0,
            creatorStoreProduct: (0, t.exists)(s, "creatorStoreProduct") ? g(s.creatorStoreProduct) : void 0,
            asset: (0, t.exists)(s, "asset") ? m(s.asset) : void 0
        }
    }

    function I(e) {
        var s, i;
        return null == (s = e) ? s : {
            owned: (0, t.exists)(s, "owned") ? s.owned : void 0,
            dateSaved: (0, t.exists)(s, "dateSaved") ? new Date(s.dateSaved) : void 0,
            creatorStoreAsset: (0, t.exists)(s, "creatorStoreAsset") ? null == (i = s.creatorStoreAsset) ? i : {
                voting: (0, t.exists)(i, "voting") ? T(i.voting) : void 0,
                creator: (0, t.exists)(i, "creator") ? x(i.creator) : void 0,
                creatorStoreProduct: (0, t.exists)(i, "creatorStoreProduct") ? g(i.creatorStoreProduct) : void 0,
                asset: (0, t.exists)(i, "asset") ? m(i.asset) : void 0
            } : void 0
        }
    }

    function b(e, s) {
        var i;
        return null == e ? e : {
            rankingType: (0, t.exists)(e, "rankingType") ? e.rankingType : void 0,
            sortRange: (0, t.exists)(e, "sortRange") ? null == (i = e.sortRange) ? i : {
                ascending: (0, t.exists)(i, "ascending") ? i.ascending : void 0,
                minA: (0, t.exists)(i, "minA") ? i.minA : void 0,
                minB: (0, t.exists)(i, "minB") ? i.minB : void 0,
                maxA: (0, t.exists)(i, "maxA") ? i.maxA : void 0,
                maxB: (0, t.exists)(i, "maxB") ? i.maxB : void 0,
                keyword: (0, t.exists)(i, "keyword") ? i.keyword : void 0,
                value: (0, t.exists)(i, "value") ? i.value : void 0,
                byteValue: (0, t.exists)(i, "byteValue") ? i.byteValue : void 0,
                startDateTime: (0, t.exists)(i, "startDateTime") ? new Date(i.startDateTime) : void 0,
                endDateTime: (0, t.exists)(i, "endDateTime") ? new Date(i.endDateTime) : void 0
            } : void 0,
            sortableAudienceType: (0, t.exists)(e, "sortableAudienceType") ? e.sortableAudienceType : void 0,
            audienceName: (0, t.exists)(e, "audienceName") ? e.audienceName : void 0
        }
    }

    function S(e) {
        var s;
        return null == (s = e) ? s : {
            min: (0, t.exists)(s, "min") ? s.min : void 0,
            max: (0, t.exists)(s, "max") ? s.max : void 0,
            fallbackField: (0, t.exists)(s, "fallbackField") ? s.fallbackField : void 0,
            fallbackMin: (0, t.exists)(s, "fallbackMin") ? s.fallbackMin : void 0,
            fallbackMax: (0, t.exists)(s, "fallbackMax") ? s.fallbackMax : void 0
        }
    }

    function C(e, s) {
        var i, o, a, n;
        return null == e ? e : {
            libraryQueryOptions: (0, t.exists)(e, "libraryQueryOptions") ? null == (i = e.libraryQueryOptions) ? i : r(r({}, null == (o = i) ? o : {
                contextMatch: (0, t.exists)(o, "contextMatch") ? o.contextMatch : void 0,
                isMultiplicativeSearchEnabled: (0, t.exists)(o, "isMultiplicativeSearchEnabled") ? o.isMultiplicativeSearchEnabled : void 0,
                sortByRankingScore: (0, t.exists)(o, "sortByRankingScore") ? b(o.sortByRankingScore) : void 0,
                customRankingScriptName: (0, t.exists)(o, "customRankingScriptName") ? o.customRankingScriptName : void 0,
                assetAnalysisScores: (0, t.exists)(o, "assetAnalysisScores") ? null === o.assetAnalysisScores ? null : (0, t.mapValues)(o.assetAnalysisScores, S) : void 0,
                assetStats: (0, t.exists)(o, "assetStats") ? null === o.assetStats ? null : (0, t.mapValues)(o.assetStats, S) : void 0,
                excludeModeratedAssets: (0, t.exists)(o, "excludeModeratedAssets") ? o.excludeModeratedAssets : void 0,
                includeOnlyValidCreators: (0, t.exists)(o, "includeOnlyValidCreators") ? o.includeOnlyValidCreators : void 0,
                filterForVisibleAssets: (0, t.exists)(o, "filterForVisibleAssets") ? o.filterForVisibleAssets : void 0,
                includeHumanEvaluationVerifiedOnly: (0, t.exists)(o, "includeHumanEvaluationVerifiedOnly") ? o.includeHumanEvaluationVerifiedOnly : void 0,
                filterOutHumanEvaluationVerifiedMalicious: (0, t.exists)(o, "filterOutHumanEvaluationVerifiedMalicious") ? o.filterOutHumanEvaluationVerifiedMalicious : void 0,
                filterOutLowQualityThumbnails: (0, t.exists)(o, "filterOutLowQualityThumbnails") ? o.filterOutLowQualityThumbnails : void 0
            }), null == (a = i) ? a : {
                contextMatch: (0, t.exists)(a, "contextMatch") ? a.contextMatch : void 0,
                isMultiplicativeSearchEnabled: (0, t.exists)(a, "isMultiplicativeSearchEnabled") ? a.isMultiplicativeSearchEnabled : void 0,
                sortByRankingScore: (0, t.exists)(a, "sortByRankingScore") ? b(a.sortByRankingScore) : void 0,
                customRankingScriptName: (0, t.exists)(a, "customRankingScriptName") ? a.customRankingScriptName : void 0,
                assetAnalysisScores: (0, t.exists)(a, "assetAnalysisScores") ? null === a.assetAnalysisScores ? null : (0, t.mapValues)(a.assetAnalysisScores, S) : void 0,
                assetStats: (0, t.exists)(a, "assetStats") ? null === a.assetStats ? null : (0, t.mapValues)(a.assetStats, S) : void 0,
                excludeModeratedAssets: (0, t.exists)(a, "excludeModeratedAssets") ? a.excludeModeratedAssets : void 0,
                includeOnlyValidCreators: (0, t.exists)(a, "includeOnlyValidCreators") ? a.includeOnlyValidCreators : void 0,
                filterForVisibleAssets: (0, t.exists)(a, "filterForVisibleAssets") ? a.filterForVisibleAssets : void 0,
                includeHumanEvaluationVerifiedOnly: (0, t.exists)(a, "includeHumanEvaluationVerifiedOnly") ? a.includeHumanEvaluationVerifiedOnly : void 0,
                filterOutHumanEvaluationVerifiedMalicious: (0, t.exists)(a, "filterOutHumanEvaluationVerifiedMalicious") ? a.filterOutHumanEvaluationVerifiedMalicious : void 0,
                filterOutLowQualityThumbnails: (0, t.exists)(a, "filterOutLowQualityThumbnails") ? a.filterOutLowQualityThumbnails : void 0
            }) : void 0,
            serializedCcsSearchResponseDebugInfo: (0, t.exists)(e, "serializedCcsSearchResponseDebugInfo") ? e.serializedCcsSearchResponseDebugInfo : void 0,
            additionalImplData: (0, t.exists)(e, "additionalImplData") ? null == (n = e.additionalImplData) ? n : {
                sNDINFRAALGORITHMNAME: (0, t.exists)(n, "SND_INFRA_ALGORITHM_NAME") ? n.SND_INFRA_ALGORITHM_NAME : void 0,
                sNDINFRABLENDERS: (0, t.exists)(n, "SND_INFRA_BLENDERS") ? n.SND_INFRA_BLENDERS : void 0,
                eLASTICSEARCHEXPLANATIONS: (0, t.exists)(n, "ELASTIC_SEARCH_EXPLANATIONS") ? n.ELASTIC_SEARCH_EXPLANATIONS : void 0,
                eLASTICSEARCHDOCUMENTS: (0, t.exists)(n, "ELASTIC_SEARCH_DOCUMENTS") ? n.ELASTIC_SEARCH_DOCUMENTS : void 0
            } : void 0
        }
    }

    function A(e) {
        var s, i;
        return null == (s = e) ? s : {
            id: (0, t.exists)(s, "id") ? s.id : void 0,
            name: (0, t.exists)(s, "name") ? s.name : void 0,
            debugInfo: (0, t.exists)(s, "debugInfo") ? null == (i = s.debugInfo) ? i : {
                sNDINFRAALGORITHMNAME: (0, t.exists)(i, "SND_INFRA_ALGORITHM_NAME") ? i.SND_INFRA_ALGORITHM_NAME : void 0,
                sNDINFRABLENDERS: (0, t.exists)(i, "SND_INFRA_BLENDERS") ? i.SND_INFRA_BLENDERS : void 0,
                eLASTICSEARCHEXPLANATIONS: (0, t.exists)(i, "ELASTIC_SEARCH_EXPLANATIONS") ? i.ELASTIC_SEARCH_EXPLANATIONS : void 0,
                eLASTICSEARCHDOCUMENTS: (0, t.exists)(i, "ELASTIC_SEARCH_DOCUMENTS") ? i.ELASTIC_SEARCH_DOCUMENTS : void 0
            } : void 0,
            searchResultSource: (0, t.exists)(s, "searchResultSource") ? s.searchResultSource : void 0
        }
    }

    function P(e, s) {
        return null == e ? e : {
            keyword: (0, t.exists)(e, "keyword") ? e.keyword : void 0,
            assetSubTypes: (0, t.exists)(e, "assetSubTypes") ? null === e.assetSubTypes ? null : e.assetSubTypes.map(c) : void 0,
            creatorTargetId: (0, t.exists)(e, "creatorTargetId") ? e.creatorTargetId : void 0,
            creatorType: (0, t.exists)(e, "creatorType") ? e.creatorType : void 0,
            excludeAssetSubTypes: (0, t.exists)(e, "excludeAssetSubTypes") ? null === e.excludeAssetSubTypes ? null : e.excludeAssetSubTypes.map(c) : void 0,
            audioTypes: (0, t.exists)(e, "audioTypes") ? null === e.audioTypes ? null : e.audioTypes.map(d) : void 0,
            uiSortIntent: (0, t.exists)(e, "uiSortIntent") ? e.uiSortIntent : void 0,
            sortDirection: (0, t.exists)(e, "sortDirection") ? e.sortDirection : void 0,
            musicChartType: (0, t.exists)(e, "musicChartType") ? e.musicChartType : void 0,
            categoryPath: (0, t.exists)(e, "categoryPath") ? e.categoryPath : void 0
        }
    }

    function R(e, s) {
        return null == e ? e : {
            assetId: (0, t.exists)(e, "assetId") ? e.assetId : void 0,
            backgroundColor: (0, t.exists)(e, "backgroundColor") ? e.backgroundColor : void 0
        }
    }

    function q(e) {
        var s;
        return null == (s = e) ? s : {
            name: (0, t.exists)(s, "name") ? s.name : void 0,
            displayName: (0, t.exists)(s, "displayName") ? s.displayName : void 0,
            hidden: (0, t.exists)(s, "hidden") ? s.hidden : void 0,
            searchKeywords: (0, t.exists)(s, "searchKeywords") ? s.searchKeywords : void 0,
            queryParams: (0, t.exists)(s, "queryParams") ? P(s.queryParams) : void 0,
            path: (0, t.exists)(s, "path") ? s.path : void 0,
            index: (0, t.exists)(s, "index") ? s.index : void 0,
            children: (0, t.exists)(s, "children") ? null === s.children ? null : (0, t.mapValues)(s.children, q) : void 0,
            childCount: (0, t.exists)(s, "childCount") ? s.childCount : void 0,
            thumbnail: (0, t.exists)(s, "thumbnail") ? R(s.thumbnail) : void 0,
            categoryPath: (0, t.exists)(s, "categoryPath") ? s.categoryPath : void 0
        }
    }

    function N(e) {
        var s, i;
        return null == (s = e) ? s : {
            displayName: (0, t.exists)(s, "displayName") ? s.displayName : void 0,
            name: (0, t.exists)(s, "name") ? s.name : void 0,
            subcategory: (0, t.exists)(s, "subcategory") ? null == (i = s.subcategory) ? i : {
                name: (0, t.exists)(i, "name") ? i.name : void 0,
                displayName: (0, t.exists)(i, "displayName") ? i.displayName : void 0,
                hidden: (0, t.exists)(i, "hidden") ? i.hidden : void 0,
                searchKeywords: (0, t.exists)(i, "searchKeywords") ? i.searchKeywords : void 0,
                queryParams: (0, t.exists)(i, "queryParams") ? P(i.queryParams) : void 0,
                path: (0, t.exists)(i, "path") ? i.path : void 0,
                index: (0, t.exists)(i, "index") ? i.index : void 0,
                children: (0, t.exists)(i, "children") ? null === i.children ? null : (0, t.mapValues)(i.children, q) : void 0,
                childCount: (0, t.exists)(i, "childCount") ? i.childCount : void 0,
                thumbnail: (0, t.exists)(i, "thumbnail") ? R(i.thumbnail) : void 0,
                categoryPath: (0, t.exists)(i, "categoryPath") ? i.categoryPath : void 0
            } : void 0
        }
    }

    function k(e) {
        var s;
        return null == (s = e) ? s : {
            name: (0, t.exists)(s, "name") ? s.name : void 0,
            displayName: (0, t.exists)(s, "displayName") ? s.displayName : void 0,
            overrideCategoryPath: (0, t.exists)(s, "overrideCategoryPath") ? s.overrideCategoryPath : void 0,
            categoryPath: (0, t.exists)(s, "categoryPath") ? s.categoryPath : void 0
        }
    }

    function O(e) {
        var s;
        return null == (s = e) ? s : {
            name: (0, t.exists)(s, "Name") ? s.Name : void 0,
            assetId: (0, t.exists)(s, "AssetId") ? s.AssetId : void 0,
            assetVersionId: (0, t.exists)(s, "AssetVersionId") ? s.AssetVersionId : void 0,
            creatorName: (0, t.exists)(s, "CreatorName") ? s.CreatorName : void 0,
            objectTypes: (0, t.exists)(s, "ObjectTypes") ? s.ObjectTypes : void 0
        }
    }

    function V(e) {
        return e
    }

    function G(e, s) {
        var i, r;
        return null == e ? e : {
            nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0,
            queryFacets: (0, t.exists)(e, "queryFacets") ? null == (i = e.queryFacets) ? i : {
                appliedFacets: (0, t.exists)(i, "appliedFacets") ? i.appliedFacets : void 0,
                availableFacets: (0, t.exists)(i, "availableFacets") ? i.availableFacets : void 0
            } : void 0,
            creatorStoreAssets: (0, t.exists)(e, "creatorStoreAssets") ? null === e.creatorStoreAssets ? null : e.creatorStoreAssets.map(w) : void 0,
            totalResults: (0, t.exists)(e, "totalResults") ? e.totalResults : void 0,
            queryCorrection: (0, t.exists)(e, "queryCorrection") ? null == (r = e.queryCorrection) ? r : {
                suggestedQuery: (0, t.exists)(r, "suggestedQuery") ? r.suggestedQuery : void 0
            } : void 0,
            filteredKeyword: (0, t.exists)(e, "filteredKeyword") ? e.filteredKeyword : void 0
        }
    }

    function D(e) {
        var s, i, r, o, a, l, v, p, h, y, m, x;
        return null == (s = e) ? s : {
            asset: (0, t.exists)(s, "asset") ? null == (i = s.asset) ? i : {
                audioDetails: (0, t.exists)(i, "audioDetails") ? null == (r = i.audioDetails) ? r : {
                    audioType: (0, t.exists)(r, "audioType") ? d(r.audioType) : void 0,
                    artist: (0, t.exists)(r, "artist") ? r.artist : void 0,
                    title: (0, t.exists)(r, "title") ? r.title : void 0,
                    musicAlbum: (0, t.exists)(r, "musicAlbum") ? r.musicAlbum : void 0,
                    musicGenre: (0, t.exists)(r, "musicGenre") ? r.musicGenre : void 0,
                    soundEffectCategory: (0, t.exists)(r, "soundEffectCategory") ? r.soundEffectCategory : void 0,
                    soundEffectSubcategory: (0, t.exists)(r, "soundEffectSubcategory") ? r.soundEffectSubcategory : void 0,
                    tags: (0, t.exists)(r, "tags") ? r.tags : void 0
                } : void 0,
                id: (0, t.exists)(i, "id") ? i.id : void 0,
                name: (0, t.exists)(i, "name") ? i.name : void 0,
                typeId: (0, t.exists)(i, "typeId") ? i.typeId : void 0,
                assetSubTypes: (0, t.exists)(i, "assetSubTypes") ? null === i.assetSubTypes ? null : i.assetSubTypes.map(c) : void 0,
                assetGenres: (0, t.exists)(i, "assetGenres") ? i.assetGenres : void 0,
                isEndorsed: (0, t.exists)(i, "isEndorsed") ? i.isEndorsed : void 0,
                description: (0, t.exists)(i, "description") ? i.description : void 0,
                duration: (0, t.exists)(i, "duration") ? i.duration : void 0,
                hasScripts: (0, t.exists)(i, "hasScripts") ? i.hasScripts : void 0,
                scriptCount: (0, t.exists)(i, "scriptCount") ? i.scriptCount : void 0,
                createdUtc: (0, t.exists)(i, "createdUtc") ? null === i.createdUtc ? null : new Date(i.createdUtc) : void 0,
                updatedUtc: (0, t.exists)(i, "updatedUtc") ? null === i.updatedUtc ? null : new Date(i.updatedUtc) : void 0,
                creatingUniverseId: (0, t.exists)(i, "creatingUniverseId") ? i.creatingUniverseId : void 0,
                isAssetHashApproved: (0, t.exists)(i, "isAssetHashApproved") ? i.isAssetHashApproved : void 0,
                visibilityStatus: (0, t.exists)(i, "visibilityStatus") ? i.visibilityStatus : void 0,
                socialLinks: (0, t.exists)(i, "socialLinks") ? null === i.socialLinks ? null : i.socialLinks.map(u) : void 0,
                meshId: (0, t.exists)(i, "meshId") ? i.meshId : void 0,
                textureId: (0, t.exists)(i, "textureId") ? i.textureId : void 0,
                modelTechnicalDetails: (0, t.exists)(i, "modelTechnicalDetails") ? null == (o = i.modelTechnicalDetails) ? o : {
                    objectMeshSummary: (0, t.exists)(o, "objectMeshSummary") ? null == (a = o.objectMeshSummary) ? a : {
                        triangles: (0, t.exists)(a, "triangles") ? a.triangles : void 0,
                        vertices: (0, t.exists)(a, "vertices") ? a.vertices : void 0
                    } : void 0,
                    instanceCounts: (0, t.exists)(o, "instanceCounts") ? null == (l = o.instanceCounts) ? l : {
                        script: (0, t.exists)(l, "script") ? l.script : void 0,
                        meshPart: (0, t.exists)(l, "meshPart") ? l.meshPart : void 0,
                        animation: (0, t.exists)(l, "animation") ? l.animation : void 0,
                        decal: (0, t.exists)(l, "decal") ? l.decal : void 0,
                        audio: (0, t.exists)(l, "audio") ? l.audio : void 0,
                        tool: (0, t.exists)(l, "tool") ? l.tool : void 0
                    } : void 0
                } : void 0,
                previewAssets: (0, t.exists)(i, "previewAssets") ? n(i.previewAssets) : void 0,
                categoryPath: (0, t.exists)(i, "categoryPath") ? i.categoryPath : void 0,
                capabilities: (0, t.exists)(i, "capabilities") ? null == (v = i.capabilities) ? v : {
                    shouldSandbox: (0, t.exists)(v, "shouldSandbox") ? v.shouldSandbox : void 0
                } : void 0,
                objectTypes: (0, t.exists)(i, "objectTypes") ? i.objectTypes : void 0
            } : void 0,
            creator: (0, t.exists)(s, "creator") ? null == (p = s.creator) ? p : {
                id: (0, t.exists)(p, "id") ? p.id : void 0,
                name: (0, t.exists)(p, "name") ? p.name : void 0,
                type: (0, t.exists)(p, "type") ? p.type : void 0,
                isVerifiedCreator: (0, t.exists)(p, "isVerifiedCreator") ? p.isVerifiedCreator : void 0,
                latestGroupUpdaterUserId: (0, t.exists)(p, "latestGroupUpdaterUserId") ? p.latestGroupUpdaterUserId : void 0,
                latestGroupUpdaterUserName: (0, t.exists)(p, "latestGroupUpdaterUserName") ? p.latestGroupUpdaterUserName : void 0
            } : void 0,
            voting: (0, t.exists)(s, "voting") ? null == (h = s.voting) ? h : {
                showVotes: (0, t.exists)(h, "showVotes") ? h.showVotes : void 0,
                upVotes: (0, t.exists)(h, "upVotes") ? h.upVotes : void 0,
                downVotes: (0, t.exists)(h, "downVotes") ? h.downVotes : void 0,
                canVote: (0, t.exists)(h, "canVote") ? h.canVote : void 0,
                userVote: (0, t.exists)(h, "userVote") ? h.userVote : void 0,
                hasVoted: (0, t.exists)(h, "hasVoted") ? h.hasVoted : void 0,
                voteCount: (0, t.exists)(h, "voteCount") ? h.voteCount : void 0,
                upVotePercent: (0, t.exists)(h, "upVotePercent") ? h.upVotePercent : void 0
            } : void 0,
            product: (0, t.exists)(s, "product") ? null == (y = s.product) ? y : {
                productId: (0, t.exists)(y, "productId") ? y.productId : void 0,
                price: (0, t.exists)(y, "price") ? y.price : void 0,
                isForSaleOrIsPublicDomain: (0, t.exists)(y, "isForSaleOrIsPublicDomain") ? y.isForSaleOrIsPublicDomain : void 0
            } : void 0,
            fiatProduct: (0, t.exists)(s, "fiatProduct") ? null == (m = s.fiatProduct) ? m : {
                purchasePrice: (0, t.exists)(m, "purchasePrice") ? null == (x = m.purchasePrice) ? x : {
                    currencyCode: (0, t.exists)(x, "currencyCode") ? x.currencyCode : void 0,
                    quantity: (0, t.exists)(x, "quantity") ? f(x.quantity) : void 0
                } : void 0,
                published: (0, t.exists)(m, "published") ? m.published : void 0,
                purchasable: (0, t.exists)(m, "purchasable") ? m.purchasable : void 0,
                isFree: (0, t.exists)(m, "isFree") ? m.isFree : void 0
            } : void 0
        }
    }

    function U(e, s) {
        var i, r;
        return null == e ? e : {
            totalResults: (0, t.exists)(e, "totalResults") ? e.totalResults : void 0,
            filteredKeyword: (0, t.exists)(e, "filteredKeyword") ? e.filteredKeyword : void 0,
            searchDebugInfo: (0, t.exists)(e, "searchDebugInfo") ? C(e.searchDebugInfo) : void 0,
            spellCheckerResult: (0, t.exists)(e, "spellCheckerResult") ? null == (i = e.spellCheckerResult) ? i : {
                correctionState: (0, t.exists)(i, "correctionState") ? i.correctionState : void 0,
                correctedQuery: (0, t.exists)(i, "correctedQuery") ? i.correctedQuery : void 0,
                userQuery: (0, t.exists)(i, "userQuery") ? i.userQuery : void 0
            } : void 0,
            queryFacets: (0, t.exists)(e, "queryFacets") ? null == (r = e.queryFacets) ? r : {
                appliedFacets: (0, t.exists)(r, "appliedFacets") ? r.appliedFacets : void 0,
                availableFacets: (0, t.exists)(r, "availableFacets") ? r.availableFacets : void 0
            } : void 0,
            imageSearchStatus: (0, t.exists)(e, "imageSearchStatus") ? e.imageSearchStatus : void 0,
            previousPageCursor: (0, t.exists)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
            nextPageCursor: (0, t.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
            data: (0, t.exists)(e, "data") ? null === e.data ? null : e.data.map(A) : void 0
        }
    }
    var E = function(e) {
            function s() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(s, e), s.prototype.frontendFlagsGetAllUserSettingsRaw = function(e) {
                return o(this, void 0, void 0, function() {
                    var s, i, r;
                    return a(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return s = {}, i = {}, [4, this.request({
                                    path: "/v1/frontend-flags/user-settings",
                                    schemaPath: "/v1/frontend-flags/user-settings",
                                    method: "GET",
                                    headers: i,
                                    query: s
                                }, e)];
                            case 1:
                                return r = o.sent(), [2, new t.JSONApiResponse(r, function(e) {
                                    return null == e ? e : {
                                        data: (0, t.exists)(e, "data") ? e.data : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.frontendFlagsGetAllUserSettings = function(e) {
                return o(this, void 0, void 0, function() {
                    return a(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.frontendFlagsGetAllUserSettingsRaw(e)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, s.prototype.frontendFlagsGetUserSettingRaw = function(e, s) {
                return o(this, void 0, void 0, function() {
                    var i, r, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.featureKey || void 0 === e.featureKey) throw new t.RequiredError("featureKey", "Required parameter requestParameters.featureKey was null or undefined when calling frontendFlagsGetUserSetting.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/frontend-flags/user-settings/{featureKey}".replace("{".concat("featureKey", "}"), encodeURIComponent(String(e.featureKey))),
                                    schemaPath: "/v1/frontend-flags/user-settings/{featureKey}",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, s)];
                            case 1:
                                return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        featureKey: (0, t.exists)(e, "featureKey") ? e.featureKey : void 0,
                                        value: (0, t.exists)(e, "value") ? e.value : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.frontendFlagsGetUserSetting = function(e, t) {
                return o(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.frontendFlagsGetUserSettingRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.frontendFlagsGetValuesRaw = function(e, s) {
                return o(this, void 0, void 0, function() {
                    var i, r, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return i = {}, e.flags && (i.flags = e.flags), r = {}, [4, this.request({
                                    path: "/v1/frontend-flags/values",
                                    schemaPath: "/v1/frontend-flags/values",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, s)];
                            case 1:
                                return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        data: (0, t.exists)(e, "data") ? e.data : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.frontendFlagsGetValues = function() {
                return o(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.frontendFlagsGetValuesRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.frontendFlagsSetUserSettingRaw = function(e, s) {
                return o(this, void 0, void 0, function() {
                    var i, r, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.featureKey || void 0 === e.featureKey) throw new t.RequiredError("featureKey", "Required parameter requestParameters.featureKey was null or undefined when calling frontendFlagsSetUserSetting.");
                                return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/frontend-flags/user-settings/{featureKey}".replace("{".concat("featureKey", "}"), encodeURIComponent(String(e.featureKey))),
                                    schemaPath: "/v1/frontend-flags/user-settings/{featureKey}",
                                    method: "PUT",
                                    headers: r,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            value: e.value
                                        }
                                    }(e.updateUserSettingRequest)
                                }, s)];
                            case 1:
                                return o = a.sent(), [2, new t.VoidApiResponse(o)]
                        }
                    })
                })
            }, s.prototype.frontendFlagsSetUserSetting = function(e, t) {
                return o(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.frontendFlagsSetUserSettingRaw(e, t)];
                            case 1:
                                return s.sent(), [2]
                        }
                    })
                })
            }, s
        }(t.BaseAPI),
        M = (function(e) {
            function s() {
                return null !== e && e.apply(this, arguments) || this
            }
            i(s, e), s.prototype.homeGetAssetsRaw = function(e, s) {
                return o(this, void 0, void 0, function() {
                    var i, r, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetType || void 0 === e.assetType) throw new t.RequiredError("assetType", "Required parameter requestParameters.assetType was null or undefined when calling homeGetAssets.");
                                if (null === e.section || void 0 === e.section) throw new t.RequiredError("section", "Required parameter requestParameters.section was null or undefined when calling homeGetAssets.");
                                return i = {}, void 0 !== e.includeOnlyVerifiedCreators && (i.includeOnlyVerifiedCreators = e.includeOnlyVerifiedCreators), void 0 !== e.sortOrder && (i.sortOrder = e.sortOrder), void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.pageNumber && (i.pageNumber = e.pageNumber), void 0 !== e.locale && (i.locale = e.locale), void 0 !== e.placeId && (i.placeId = e.placeId), void 0 !== e.assetsInCameraVicinity && (i.assetsInCameraVicinity = e.assetsInCameraVicinity), void 0 !== e.assetsInCameraViewport && (i.assetsInCameraViewport = e.assetsInCameraViewport), void 0 !== e.minPriceInCents && (i.minPriceInCents = e.minPriceInCents), void 0 !== e.maxPriceInCents && (i.maxPriceInCents = e.maxPriceInCents), e.includedInstanceTypes && (i.includedInstanceTypes = e.includedInstanceTypes), r = {}, [4, this.request({
                                    path: "/v1/home/{assetType}/section/{section}/assets".replace("{".concat("assetType", "}"), encodeURIComponent(String(e.assetType))).replace("{".concat("section", "}"), encodeURIComponent(String(e.section))),
                                    schemaPath: "/v1/home/{assetType}/section/{section}/assets",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, s)];
                            case 1:
                                return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        totalResults: (0, t.exists)(e, "totalResults") ? e.totalResults : void 0,
                                        searchDebugInfo: (0, t.exists)(e, "searchDebugInfo") ? C(e.searchDebugInfo) : void 0,
                                        previousPageCursor: (0, t.exists)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                        nextPageCursor: (0, t.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                        data: (0, t.exists)(e, "data") ? null === e.data ? null : e.data.map(A) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.homeGetAssets = function(e, t) {
                return o(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.homeGetAssetsRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.homeGetAssetsV2Raw = function(e, s) {
                return o(this, void 0, void 0, function() {
                    var i, r, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetType || void 0 === e.assetType) throw new t.RequiredError("assetType", "Required parameter requestParameters.assetType was null or undefined when calling homeGetAssetsV2.");
                                if (null === e.section || void 0 === e.section) throw new t.RequiredError("section", "Required parameter requestParameters.section was null or undefined when calling homeGetAssetsV2.");
                                return i = {}, void 0 !== e.includeOnlyVerifiedCreators && (i.includeOnlyVerifiedCreators = e.includeOnlyVerifiedCreators), void 0 !== e.sortOrder && (i.sortOrder = e.sortOrder), void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.pageNumber && (i.pageNumber = e.pageNumber), void 0 !== e.locale && (i.locale = e.locale), void 0 !== e.placeId && (i.placeId = e.placeId), void 0 !== e.assetsInCameraVicinity && (i.assetsInCameraVicinity = e.assetsInCameraVicinity), void 0 !== e.assetsInCameraViewport && (i.assetsInCameraViewport = e.assetsInCameraViewport), void 0 !== e.minPriceInCents && (i.minPriceInCents = e.minPriceInCents), void 0 !== e.maxPriceInCents && (i.maxPriceInCents = e.maxPriceInCents), e.includedInstanceTypes && (i.includedInstanceTypes = e.includedInstanceTypes), r = {}, [4, this.request({
                                    path: "/v2/home/{assetType}/section/{section}/assets".replace("{".concat("assetType", "}"), encodeURIComponent(String(e.assetType))).replace("{".concat("section", "}"), encodeURIComponent(String(e.section))),
                                    schemaPath: "/v2/home/{assetType}/section/{section}/assets",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, s)];
                            case 1:
                                return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0,
                                        creatorStoreAssets: (0, t.exists)(e, "creatorStoreAssets") ? null === e.creatorStoreAssets ? null : e.creatorStoreAssets.map(w) : void 0,
                                        totalResults: (0, t.exists)(e, "totalResults") ? e.totalResults : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.homeGetAssetsV2 = function(e, t) {
                return o(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.homeGetAssetsV2Raw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.homeGetConfigurationRaw = function(e, s) {
                return o(this, void 0, void 0, function() {
                    var i, r, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetType || void 0 === e.assetType) throw new t.RequiredError("assetType", "Required parameter requestParameters.assetType was null or undefined when calling homeGetConfiguration.");
                                return i = {}, void 0 !== e.locale && (i.locale = e.locale), void 0 !== e.placeId && (i.placeId = e.placeId), r = {}, [4, this.request({
                                    path: "/v1/home/{assetType}/configuration".replace("{".concat("assetType", "}"), encodeURIComponent(String(e.assetType))),
                                    schemaPath: "/v1/home/{assetType}/configuration",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, s)];
                            case 1:
                                return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        sections: (0, t.exists)(e, "sections") ? null === e.sections ? null : e.sections.map(N) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.homeGetConfiguration = function(e, t) {
                return o(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.homeGetConfigurationRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.homeGetConfigurationV2Raw = function(e, s) {
                return o(this, void 0, void 0, function() {
                    var i, r, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return i = {}, void 0 !== e.locale && (i.locale = e.locale), void 0 !== e.placeId && (i.placeId = e.placeId), r = {}, [4, this.request({
                                    path: "/v2/home/configuration",
                                    schemaPath: "/v2/home/configuration",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, s)];
                            case 1:
                                return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return function e(s) {
                                        var i, r, o, a;
                                        return null == (i = s) ? i : {
                                            displayName: (0, t.exists)(i, "displayName") ? i.displayName : void 0,
                                            categoryPath: (0, t.exists)(i, "categoryPath") ? i.categoryPath : void 0,
                                            layout: (0, t.exists)(i, "layout") ? i.layout : void 0,
                                            showChildCategoryRow: (0, t.exists)(i, "showChildCategoryRow") ? i.showChildCategoryRow : void 0,
                                            swimlanes: (0, t.exists)(i, "swimlanes") ? null === i.swimlanes ? null : i.swimlanes.map(k) : void 0,
                                            defaultGrid: (0, t.exists)(i, "defaultGrid") ? null == (r = i.defaultGrid) ? r : {
                                                swimlane: (0, t.exists)(r, "swimlane") ? null == (o = r.swimlane) ? o : {
                                                    name: (0, t.exists)(o, "name") ? o.name : void 0,
                                                    displayName: (0, t.exists)(o, "displayName") ? o.displayName : void 0,
                                                    overrideCategoryPath: (0, t.exists)(o, "overrideCategoryPath") ? o.overrideCategoryPath : void 0,
                                                    categoryPath: (0, t.exists)(o, "categoryPath") ? o.categoryPath : void 0
                                                } : void 0,
                                                categoryPath: (0, t.exists)(r, "categoryPath") ? r.categoryPath : void 0
                                            } : void 0,
                                            children: (0, t.exists)(i, "children") ? null === i.children ? null : i.children.map(e) : void 0,
                                            thumbnail: (0, t.exists)(i, "thumbnail") ? null == (a = i.thumbnail) ? a : {
                                                assetId: (0, t.exists)(a, "assetId") ? a.assetId : void 0,
                                                backgroundColor: (0, t.exists)(a, "backgroundColor") ? a.backgroundColor : void 0
                                            } : void 0
                                        }
                                    }(e)
                                })]
                        }
                    })
                })
            }, s.prototype.homeGetConfigurationV2 = function() {
                return o(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.homeGetConfigurationV2Raw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }
        }(t.BaseAPI), function(e) {
            function s() {
                return null !== e && e.apply(this, arguments) || this
            }
            i(s, e), s.prototype.savesBulkDeleteSavesRaw = function(e, s) {
                return o(this, void 0, void 0, function() {
                    var i, r, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/saves:bulkDelete",
                                    schemaPath: "/v1/saves:bulkDelete",
                                    method: "POST",
                                    headers: r,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            targets: null === e.targets ? null : e.targets.map(v)
                                        }
                                    }(e.bulkDeleteSavesRequest)
                                }, s)];
                            case 1:
                                return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        deletedCount: (0, t.exists)(e, "deletedCount") ? e.deletedCount : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.savesBulkDeleteSaves = function() {
                return o(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.savesBulkDeleteSavesRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.savesCreateSaveRaw = function(e, s) {
                return o(this, void 0, void 0, function() {
                    var i, r, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/saves",
                                    schemaPath: "/v1/saves",
                                    method: "POST",
                                    headers: r,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            targetType: e.targetType,
                                            targetId: e.targetId,
                                            collectionName: e.collectionName
                                        }
                                    }(e.createSaveRequest)
                                }, s)];
                            case 1:
                                return o = a.sent(), [2, new t.VoidApiResponse(o)]
                        }
                    })
                })
            }, s.prototype.savesCreateSave = function() {
                return o(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.savesCreateSaveRaw(e, t)];
                            case 1:
                                return s.sent(), [2]
                        }
                    })
                })
            }, s.prototype.savesDeleteSaveRaw = function(e, s) {
                return o(this, void 0, void 0, function() {
                    var i, r, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return i = {}, void 0 !== e.targetType && (i.targetType = e.targetType), void 0 !== e.targetId && (i.targetId = e.targetId), void 0 !== e.collectionName && (i.collectionName = e.collectionName), r = {}, [4, this.request({
                                    path: "/v1/saves",
                                    schemaPath: "/v1/saves",
                                    method: "DELETE",
                                    headers: r,
                                    query: i
                                }, s)];
                            case 1:
                                return o = a.sent(), [2, new t.VoidApiResponse(o)]
                        }
                    })
                })
            }, s.prototype.savesDeleteSave = function() {
                return o(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.savesDeleteSaveRaw(e, t)];
                            case 1:
                                return s.sent(), [2]
                        }
                    })
                })
            }, s.prototype.savesGetSavesRaw = function(e, s) {
                return o(this, void 0, void 0, function() {
                    var i, r, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return i = {}, void 0 !== e.targetType && (i.targetType = e.targetType), void 0 !== e.targetId && (i.targetId = e.targetId), void 0 !== e.collectionName && (i.collectionName = e.collectionName), void 0 !== e.sortBy && (i.sortBy = e.sortBy), void 0 !== e.sortDirection && (i.sortDirection = e.sortDirection), void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.page && (i.page = e.page), void 0 !== e.keyword && (i.keyword = e.keyword), void 0 !== e.hideOwnedAssets && (i.hideOwnedAssets = e.hideOwnedAssets), r = {}, [4, this.request({
                                    path: "/v1/saves",
                                    schemaPath: "/v1/saves",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, s)];
                            case 1:
                                return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        totalCount: e.totalCount,
                                        saves: null === e.saves ? null : e.saves.map(I)
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.savesGetSaves = function() {
                return o(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.savesGetSavesRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }
        }(t.BaseAPI), function(e) {
            function s() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(s, e), s.prototype.toolboxGetAssetDetailsRaw = function(e, s) {
                return o(this, void 0, void 0, function() {
                    var i, r, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new t.RequiredError("id", "Required parameter requestParameters.id was null or undefined when calling toolboxGetAssetDetails.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v2/assets/{id}".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v2/assets/{id}",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, s)];
                            case 1:
                                return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return w(e)
                                })]
                        }
                    })
                })
            }, s.prototype.toolboxGetAssetDetails = function(e, t) {
                return o(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.toolboxGetAssetDetailsRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.toolboxGetAudioRaw = function(e, s) {
                return o(this, void 0, void 0, function() {
                    var i, r, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return i = {}, void 0 !== e.sortOrder && (i.sortOrder = e.sortOrder), void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.pageNumber && (i.pageNumber = e.pageNumber), void 0 !== e.keyword && (i.keyword = e.keyword), void 0 !== e.creatorType && (i.creatorType = e.creatorType), void 0 !== e.creatorTargetId && (i.creatorTargetId = e.creatorTargetId), void 0 !== e.minDuration && (i.minDuration = e.minDuration), void 0 !== e.maxDuration && (i.maxDuration = e.maxDuration), void 0 !== e.sortDirection && (i.sortDirection = e.sortDirection), void 0 !== e.artist && (i.artist = e.artist), void 0 !== e.album && (i.album = e.album), e.audioTypes && (i.audioTypes = e.audioTypes), void 0 !== e.uiSortIntent && (i.uiSortIntent = e.uiSortIntent), void 0 !== e.tags && (i.tags = e.tags), void 0 !== e.includeOnlyVerifiedCreators && (i.includeOnlyVerifiedCreators = e.includeOnlyVerifiedCreators), void 0 !== e.querySource && (i.querySource = e.querySource), void 0 !== e.originalUserQuery && (i.originalUserQuery = e.originalUserQuery), void 0 !== e.originalCorrection && (i.originalCorrection = e.originalCorrection), e.facets && (i.facets = e.facets), r = {}, [4, this.request({
                                    path: "/v1/audio",
                                    schemaPath: "/v1/audio",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, s)];
                            case 1:
                                return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return U(e)
                                })]
                        }
                    })
                })
            }, s.prototype.toolboxGetAudio = function() {
                return o(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.toolboxGetAudioRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.toolboxGetCreationAssetsRaw = function(e, s) {
                return o(this, void 0, void 0, function() {
                    var i, r, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.ownerId || void 0 === e.ownerId) throw new t.RequiredError("ownerId", "Required parameter requestParameters.ownerId was null or undefined when calling toolboxGetCreationAssets.");
                                if (null === e.assetType || void 0 === e.assetType) throw new t.RequiredError("assetType", "Required parameter requestParameters.assetType was null or undefined when calling toolboxGetCreationAssets.");
                                return i = {}, void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.separateModelsAndPackages && (i.separateModelsAndPackages = e.separateModelsAndPackages), void 0 !== e.includeSharedAssets && (i.includeSharedAssets = e.includeSharedAssets), r = {}, [4, this.request({
                                    path: "/v1/creations/group/{ownerId}/{assetType}".replace("{".concat("ownerId", "}"), encodeURIComponent(String(e.ownerId))).replace("{".concat("assetType", "}"), encodeURIComponent(String(e.assetType))),
                                    schemaPath: "/v1/creations/group/{ownerId}/{assetType}",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, s)];
                            case 1:
                                return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return U(e)
                                })]
                        }
                    })
                })
            }, s.prototype.toolboxGetCreationAssets = function(e, t) {
                return o(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.toolboxGetCreationAssetsRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.toolboxGetCreatorInsightsRaw = function(e, s) {
                return o(this, void 0, void 0, function() {
                    var i, r, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetType || void 0 === e.assetType) throw new t.RequiredError("assetType", "Required parameter requestParameters.assetType was null or undefined when calling toolboxGetCreatorInsights.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/insights/{assetType}".replace("{".concat("assetType", "}"), encodeURIComponent(String(e.assetType))),
                                    schemaPath: "/v1/insights/{assetType}",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, s)];
                            case 1:
                                return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return e.map(p)
                                })]
                        }
                    })
                })
            }, s.prototype.toolboxGetCreatorInsights = function(e, t) {
                return o(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.toolboxGetCreatorInsightsRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.toolboxGetDecalsRaw = function(e, s) {
                return o(this, void 0, void 0, function() {
                    var i, r, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return i = {}, void 0 !== e.sortOrder && (i.sortOrder = e.sortOrder), void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.pageNumber && (i.pageNumber = e.pageNumber), void 0 !== e.keyword && (i.keyword = e.keyword), void 0 !== e.creatorType && (i.creatorType = e.creatorType), void 0 !== e.creatorTargetId && (i.creatorTargetId = e.creatorTargetId), void 0 !== e.uiSortIntent && (i.uiSortIntent = e.uiSortIntent), void 0 !== e.tags && (i.tags = e.tags), void 0 !== e.includeOnlyVerifiedCreators && (i.includeOnlyVerifiedCreators = e.includeOnlyVerifiedCreators), void 0 !== e.querySource && (i.querySource = e.querySource), void 0 !== e.originalUserQuery && (i.originalUserQuery = e.originalUserQuery), void 0 !== e.originalCorrection && (i.originalCorrection = e.originalCorrection), e.facets && (i.facets = e.facets), r = {}, [4, this.request({
                                    path: "/v1/decals",
                                    schemaPath: "/v1/decals",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, s)];
                            case 1:
                                return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return U(e)
                                })]
                        }
                    })
                })
            }, s.prototype.toolboxGetDecals = function() {
                return o(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.toolboxGetDecalsRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.toolboxGetInventoryAssetsRaw = function(e, s) {
                return o(this, void 0, void 0, function() {
                    var i, r, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new t.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling toolboxGetInventoryAssets.");
                                if (null === e.assetType || void 0 === e.assetType) throw new t.RequiredError("assetType", "Required parameter requestParameters.assetType was null or undefined when calling toolboxGetInventoryAssets.");
                                return i = {}, void 0 !== e.keyword && (i.keyword = e.keyword), void 0 !== e.sortOrder && (i.sortOrder = e.sortOrder), void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.pageNumber && (i.pageNumber = e.pageNumber), e.creatorTargetIds && (i.creatorTargetIds = e.creatorTargetIds), e.groupTargetIds && (i.groupTargetIds = e.groupTargetIds), void 0 !== e.uiSortIntent && (i.uiSortIntent = e.uiSortIntent), void 0 !== e.excludeGroupCreations && (i.excludeGroupCreations = e.excludeGroupCreations), void 0 !== e.allPackagesAndModels && (i.allPackagesAndModels = e.allPackagesAndModels), r = {}, [4, this.request({
                                    path: "/v1/inventory/user/{userId}/{assetType}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))).replace("{".concat("assetType", "}"), encodeURIComponent(String(e.assetType))),
                                    schemaPath: "/v1/inventory/user/{userId}/{assetType}",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, s)];
                            case 1:
                                return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return U(e)
                                })]
                        }
                    })
                })
            }, s.prototype.toolboxGetInventoryAssets = function(e, t) {
                return o(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.toolboxGetInventoryAssetsRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.toolboxGetItemsDetailsRaw = function(e, s) {
                return o(this, void 0, void 0, function() {
                    var i, r, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return i = {}, void 0 !== e.assetIds && (i.assetIds = e.assetIds), r = {}, [4, this.request({
                                    path: "/v1/items/details",
                                    schemaPath: "/v1/items/details",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, s)];
                            case 1:
                                return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        data: (0, t.exists)(e, "data") ? null === e.data ? null : e.data.map(D) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.toolboxGetItemsDetails = function() {
                return o(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.toolboxGetItemsDetailsRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.toolboxGetLegacyInsertServiceFreeAssetsRaw = function(e, s) {
                return o(this, void 0, void 0, function() {
                    var i, r, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetType || void 0 === e.assetType) throw new t.RequiredError("assetType", "Required parameter requestParameters.assetType was null or undefined when calling toolboxGetLegacyInsertServiceFreeAssets.");
                                return i = {}, void 0 !== e.pageNumber && (i.pageNumber = e.pageNumber), void 0 !== e.keyword && (i.keyword = e.keyword), r = {}, [4, this.request({
                                    path: "/v1/legacy-insert-service/{assetType}".replace("{".concat("assetType", "}"), encodeURIComponent(String(e.assetType))),
                                    schemaPath: "/v1/legacy-insert-service/{assetType}",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, s)];
                            case 1:
                                return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        totalCount: (0, t.exists)(e, "TotalCount") ? e.TotalCount : void 0,
                                        currentStartIndex: (0, t.exists)(e, "CurrentStartIndex") ? e.CurrentStartIndex : void 0,
                                        results: (0, t.exists)(e, "Results") ? null === e.Results ? null : e.Results.map(O) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.toolboxGetLegacyInsertServiceFreeAssets = function(e, t) {
                return o(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.toolboxGetLegacyInsertServiceFreeAssetsRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.toolboxGetMarketplaceAssetsRaw = function(e, s) {
                return o(this, void 0, void 0, function() {
                    var i, r, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetType || void 0 === e.assetType) throw new t.RequiredError("assetType", "Required parameter requestParameters.assetType was null or undefined when calling toolboxGetMarketplaceAssets.");
                                return i = {}, void 0 !== e.sortOrder && (i.sortOrder = e.sortOrder), void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.pageNumber && (i.pageNumber = e.pageNumber), void 0 !== e.keyword && (i.keyword = e.keyword), e.assetSubTypes && (i.assetSubTypes = e.assetSubTypes), e.excludeAssetSubTypes && (i.excludeAssetSubTypes = e.excludeAssetSubTypes), void 0 !== e.creatorType && (i.creatorType = e.creatorType), void 0 !== e.creatorTargetId && (i.creatorTargetId = e.creatorTargetId), void 0 !== e.minDuration && (i.minDuration = e.minDuration), void 0 !== e.maxDuration && (i.maxDuration = e.maxDuration), void 0 !== e.sortDirection && (i.sortDirection = e.sortDirection), void 0 !== e.artist && (i.artist = e.artist), void 0 !== e.album && (i.album = e.album), e.audioTypes && (i.audioTypes = e.audioTypes), void 0 !== e.uiSortIntent && (i.uiSortIntent = e.uiSortIntent), void 0 !== e.tags && (i.tags = e.tags), void 0 !== e.includeOnlyVerifiedCreators && (i.includeOnlyVerifiedCreators = e.includeOnlyVerifiedCreators), void 0 !== e.searchSource && (i.searchSource = e.searchSource), void 0 !== e.querySource && (i.querySource = e.querySource), void 0 !== e.originalUserQuery && (i.originalUserQuery = e.originalUserQuery), void 0 !== e.originalCorrection && (i.originalCorrection = e.originalCorrection), e.facets && (i.facets = e.facets), void 0 !== e.categoryPath && (i.categoryPath = e.categoryPath), void 0 !== e.minPriceInCents && (i.minPriceInCents = e.minPriceInCents), void 0 !== e.maxPriceInCents && (i.maxPriceInCents = e.maxPriceInCents), e.includedInstanceTypes && (i.includedInstanceTypes = e.includedInstanceTypes), void 0 !== e.includeAllPublishedAssets && (i.includeAllPublishedAssets = e.includeAllPublishedAssets), void 0 !== e.musicChartType && (i.musicChartType = e.musicChartType), r = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (r["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                    path: "/v1/marketplace/{assetType}".replace("{".concat("assetType", "}"), encodeURIComponent(String(e.assetType))),
                                    schemaPath: "/v1/marketplace/{assetType}",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, s)];
                            case 1:
                                return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return U(e)
                                })]
                        }
                    })
                })
            }, s.prototype.toolboxGetMarketplaceAssets = function(e, t) {
                return o(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.toolboxGetMarketplaceAssetsRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.toolboxGetMarketplaceAssetsV2Raw = function(e, s) {
                return o(this, void 0, void 0, function() {
                    var i, r, o, n;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetType || void 0 === e.assetType) throw new t.RequiredError("assetType", "Required parameter requestParameters.assetType was null or undefined when calling toolboxGetMarketplaceAssetsV2.");
                                return i = {}, void 0 !== e.sortOrder && (i.sortOrder = e.sortOrder), void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.pageNumber && (i.pageNumber = e.pageNumber), void 0 !== e.keyword && (i.keyword = e.keyword), e.assetSubTypes && (i.assetSubTypes = e.assetSubTypes), e.excludeAssetSubTypes && (i.excludeAssetSubTypes = e.excludeAssetSubTypes), void 0 !== e.creatorType && (i.creatorType = e.creatorType), void 0 !== e.creatorTargetId && (i.creatorTargetId = e.creatorTargetId), void 0 !== e.minDuration && (i.minDuration = e.minDuration), void 0 !== e.maxDuration && (i.maxDuration = e.maxDuration), void 0 !== e.sortDirection && (i.sortDirection = e.sortDirection), void 0 !== e.artist && (i.artist = e.artist), void 0 !== e.album && (i.album = e.album), e.audioTypes && (i.audioTypes = e.audioTypes), void 0 !== e.uiSortIntent && (i.uiSortIntent = e.uiSortIntent), void 0 !== e.tags && (i.tags = e.tags), void 0 !== e.includeOnlyVerifiedCreators && (i.includeOnlyVerifiedCreators = e.includeOnlyVerifiedCreators), void 0 !== e.searchSource && (i.searchSource = e.searchSource), void 0 !== e.querySource && (i.querySource = e.querySource), void 0 !== e.originalUserQuery && (i.originalUserQuery = e.originalUserQuery), void 0 !== e.originalCorrection && (i.originalCorrection = e.originalCorrection), e.facets && (i.facets = e.facets), r = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (r["Roblox-Place-Id"] = String(e.robloxPlaceId)), o = (0, t.canConsumeForm)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.image && o.append("image", e.image), [4, this.request({
                                    path: "/v1/marketplace/{assetType}".replace("{".concat("assetType", "}"), encodeURIComponent(String(e.assetType))),
                                    schemaPath: "/v1/marketplace/{assetType}",
                                    method: "POST",
                                    headers: r,
                                    query: i,
                                    body: o
                                }, s)];
                            case 1:
                                return n = a.sent(), [2, new t.JSONApiResponse(n, function(e) {
                                    return U(e)
                                })]
                        }
                    })
                })
            }, s.prototype.toolboxGetMarketplaceAssetsV2 = function(e, t) {
                return o(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.toolboxGetMarketplaceAssetsV2Raw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.toolboxGetMeshesRaw = function(e, s) {
                return o(this, void 0, void 0, function() {
                    var i, r, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return i = {}, void 0 !== e.sortOrder && (i.sortOrder = e.sortOrder), void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.pageNumber && (i.pageNumber = e.pageNumber), void 0 !== e.keyword && (i.keyword = e.keyword), void 0 !== e.creatorType && (i.creatorType = e.creatorType), void 0 !== e.creatorTargetId && (i.creatorTargetId = e.creatorTargetId), void 0 !== e.uiSortIntent && (i.uiSortIntent = e.uiSortIntent), void 0 !== e.tags && (i.tags = e.tags), void 0 !== e.includeOnlyVerifiedCreators && (i.includeOnlyVerifiedCreators = e.includeOnlyVerifiedCreators), void 0 !== e.querySource && (i.querySource = e.querySource), void 0 !== e.originalUserQuery && (i.originalUserQuery = e.originalUserQuery), void 0 !== e.originalCorrection && (i.originalCorrection = e.originalCorrection), e.facets && (i.facets = e.facets), r = {}, [4, this.request({
                                    path: "/v1/meshes",
                                    schemaPath: "/v1/meshes",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, s)];
                            case 1:
                                return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return U(e)
                                })]
                        }
                    })
                })
            }, s.prototype.toolboxGetMeshes = function() {
                return o(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.toolboxGetMeshesRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.toolboxGetModelsRaw = function(e, s) {
                return o(this, void 0, void 0, function() {
                    var i, r, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return i = {}, void 0 !== e.sortOrder && (i.sortOrder = e.sortOrder), void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.pageNumber && (i.pageNumber = e.pageNumber), void 0 !== e.keyword && (i.keyword = e.keyword), e.assetSubTypes && (i.assetSubTypes = e.assetSubTypes), e.excludeAssetSubTypes && (i.excludeAssetSubTypes = e.excludeAssetSubTypes), void 0 !== e.creatorType && (i.creatorType = e.creatorType), void 0 !== e.creatorTargetId && (i.creatorTargetId = e.creatorTargetId), void 0 !== e.uiSortIntent && (i.uiSortIntent = e.uiSortIntent), void 0 !== e.tags && (i.tags = e.tags), void 0 !== e.includeOnlyVerifiedCreators && (i.includeOnlyVerifiedCreators = e.includeOnlyVerifiedCreators), void 0 !== e.searchSource && (i.searchSource = e.searchSource), void 0 !== e.querySource && (i.querySource = e.querySource), void 0 !== e.originalUserQuery && (i.originalUserQuery = e.originalUserQuery), void 0 !== e.originalCorrection && (i.originalCorrection = e.originalCorrection), e.facets && (i.facets = e.facets), void 0 !== e.minPriceInCents && (i.minPriceInCents = e.minPriceInCents), void 0 !== e.maxPriceInCents && (i.maxPriceInCents = e.maxPriceInCents), e.modelInstanceTypeFilter && (i.modelInstanceTypeFilter = e.modelInstanceTypeFilter), r = {}, [4, this.request({
                                    path: "/v1/models",
                                    schemaPath: "/v1/models",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, s)];
                            case 1:
                                return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return U(e)
                                })]
                        }
                    })
                })
            }, s.prototype.toolboxGetModels = function() {
                return o(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.toolboxGetModelsRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.toolboxGetPluginsRaw = function(e, s) {
                return o(this, void 0, void 0, function() {
                    var i, r, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return i = {}, void 0 !== e.sortOrder && (i.sortOrder = e.sortOrder), void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.pageNumber && (i.pageNumber = e.pageNumber), void 0 !== e.keyword && (i.keyword = e.keyword), void 0 !== e.creatorType && (i.creatorType = e.creatorType), void 0 !== e.creatorTargetId && (i.creatorTargetId = e.creatorTargetId), void 0 !== e.uiSortIntent && (i.uiSortIntent = e.uiSortIntent), void 0 !== e.tags && (i.tags = e.tags), void 0 !== e.includeOnlyVerifiedCreators && (i.includeOnlyVerifiedCreators = e.includeOnlyVerifiedCreators), void 0 !== e.searchSource && (i.searchSource = e.searchSource), void 0 !== e.querySource && (i.querySource = e.querySource), void 0 !== e.originalUserQuery && (i.originalUserQuery = e.originalUserQuery), void 0 !== e.originalCorrection && (i.originalCorrection = e.originalCorrection), e.facets && (i.facets = e.facets), void 0 !== e.minPriceInCents && (i.minPriceInCents = e.minPriceInCents), void 0 !== e.maxPriceInCents && (i.maxPriceInCents = e.maxPriceInCents), r = {}, [4, this.request({
                                    path: "/v1/plugins",
                                    schemaPath: "/v1/plugins",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, s)];
                            case 1:
                                return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return U(e)
                                })]
                        }
                    })
                })
            }, s.prototype.toolboxGetPlugins = function() {
                return o(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.toolboxGetPluginsRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.toolboxGetRecentAssetsRaw = function(e, s) {
                return o(this, void 0, void 0, function() {
                    var i, r, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new t.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling toolboxGetRecentAssets.");
                                if (null === e.assetType || void 0 === e.assetType) throw new t.RequiredError("assetType", "Required parameter requestParameters.assetType was null or undefined when calling toolboxGetRecentAssets.");
                                return i = {}, void 0 !== e.sortOrder && (i.sortOrder = e.sortOrder), void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.pageNumber && (i.pageNumber = e.pageNumber), r = {}, [4, this.request({
                                    path: "/v1/recent/user/{userId}/{assetType}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))).replace("{".concat("assetType", "}"), encodeURIComponent(String(e.assetType))),
                                    schemaPath: "/v1/recent/user/{userId}/{assetType}",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, s)];
                            case 1:
                                return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return U(e)
                                })]
                        }
                    })
                })
            }, s.prototype.toolboxGetRecentAssets = function(e, t) {
                return o(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.toolboxGetRecentAssetsRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.toolboxGetUserCreationAssetsRaw = function(e, s) {
                return o(this, void 0, void 0, function() {
                    var i, r, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new t.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling toolboxGetUserCreationAssets.");
                                if (null === e.assetType || void 0 === e.assetType) throw new t.RequiredError("assetType", "Required parameter requestParameters.assetType was null or undefined when calling toolboxGetUserCreationAssets.");
                                return i = {}, void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.separateModelsAndPackages && (i.separateModelsAndPackages = e.separateModelsAndPackages), r = {}, [4, this.request({
                                    path: "/v1/creations/user/{userId}/{assetType}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))).replace("{".concat("assetType", "}"), encodeURIComponent(String(e.assetType))),
                                    schemaPath: "/v1/creations/user/{userId}/{assetType}",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, s)];
                            case 1:
                                return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return U(e)
                                })]
                        }
                    })
                })
            }, s.prototype.toolboxGetUserCreationAssets = function(e, t) {
                return o(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.toolboxGetUserCreationAssetsRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.toolboxGetUserFavoriteAssetsRaw = function(e, s) {
                return o(this, void 0, void 0, function() {
                    var i, r, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new t.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling toolboxGetUserFavoriteAssets.");
                                if (null === e.assetType || void 0 === e.assetType) throw new t.RequiredError("assetType", "Required parameter requestParameters.assetType was null or undefined when calling toolboxGetUserFavoriteAssets.");
                                return i = {}, void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.isPrevious && (i.isPrevious = e.isPrevious), r = {}, [4, this.request({
                                    path: "/v1/favorites/user/{userId}/{assetType}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))).replace("{".concat("assetType", "}"), encodeURIComponent(String(e.assetType))),
                                    schemaPath: "/v1/favorites/user/{userId}/{assetType}",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, s)];
                            case 1:
                                return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        previousPageCursor: (0, t.exists)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                        nextPageCursor: (0, t.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                        data: (0, t.exists)(e, "data") ? null === e.data ? null : e.data.map(w) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.toolboxGetUserFavoriteAssets = function(e, t) {
                return o(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.toolboxGetUserFavoriteAssetsRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.toolboxGetVideosRaw = function(e, s) {
                return o(this, void 0, void 0, function() {
                    var i, r, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return i = {}, void 0 !== e.sortOrder && (i.sortOrder = e.sortOrder), void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.pageNumber && (i.pageNumber = e.pageNumber), void 0 !== e.keyword && (i.keyword = e.keyword), void 0 !== e.creatorType && (i.creatorType = e.creatorType), void 0 !== e.creatorTargetId && (i.creatorTargetId = e.creatorTargetId), void 0 !== e.uiSortIntent && (i.uiSortIntent = e.uiSortIntent), void 0 !== e.tags && (i.tags = e.tags), void 0 !== e.includeOnlyVerifiedCreators && (i.includeOnlyVerifiedCreators = e.includeOnlyVerifiedCreators), void 0 !== e.querySource && (i.querySource = e.querySource), void 0 !== e.originalUserQuery && (i.originalUserQuery = e.originalUserQuery), void 0 !== e.originalCorrection && (i.originalCorrection = e.originalCorrection), e.facets && (i.facets = e.facets), r = {}, [4, this.request({
                                    path: "/v1/videos",
                                    schemaPath: "/v1/videos",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, s)];
                            case 1:
                                return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return U(e)
                                })]
                        }
                    })
                })
            }, s.prototype.toolboxGetVideos = function() {
                return o(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.toolboxGetVideosRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.toolboxGetVoteRaw = function(e, s) {
                return o(this, void 0, void 0, function() {
                    var i, r, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling toolboxGetVote.");
                                if (null === e.assetType || void 0 === e.assetType) throw new t.RequiredError("assetType", "Required parameter requestParameters.assetType was null or undefined when calling toolboxGetVote.");
                                return i = {}, void 0 !== e.assetId && (i.assetId = e.assetId), void 0 !== e.assetType && (i.assetType = e.assetType), r = {}, [4, this.request({
                                    path: "/v1/voting/vote",
                                    schemaPath: "/v1/voting/vote",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, s)];
                            case 1:
                                return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        userVote: (0, t.exists)(e, "userVote") ? e.userVote : void 0
                                    }
                                })]
                        }
                    })
                })
            }, s.prototype.toolboxGetVote = function(e, t) {
                return o(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.toolboxGetVoteRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.toolboxInsertAssetRaw = function(e, s) {
                return o(this, void 0, void 0, function() {
                    var i, r, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.RequiredError("assetId", "Required parameter requestParameters.assetId was null or undefined when calling toolboxInsertAsset.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/insert/asset/{assetId}".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/insert/asset/{assetId}",
                                    method: "POST",
                                    headers: r,
                                    query: i
                                }, s)];
                            case 1:
                                return o = a.sent(), [2, new t.VoidApiResponse(o)]
                        }
                    })
                })
            }, s.prototype.toolboxInsertAsset = function(e, t) {
                return o(this, void 0, void 0, function() {
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.toolboxInsertAssetRaw(e, t)];
                            case 1:
                                return s.sent(), [2]
                        }
                    })
                })
            }, s.prototype.toolboxSearchCreatorStoreAssetsRaw = function(e, s) {
                return o(this, void 0, void 0, function() {
                    var i, r, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v2/assets:search",
                                    schemaPath: "/v2/assets:search",
                                    method: "POST",
                                    headers: r,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            searchCategoryType: e.searchCategoryType,
                                            query: e.query,
                                            image: e.image,
                                            userId: e.userId,
                                            groupId: e.groupId,
                                            pageToken: e.pageToken,
                                            pageNumber: e.pageNumber,
                                            maxPageSize: e.maxPageSize,
                                            sortDirection: e.sortDirection,
                                            sortCategory: e.sortCategory,
                                            includeOnlyVerifiedCreators: e.includeOnlyVerifiedCreators,
                                            minPriceCents: e.minPriceCents,
                                            maxPriceCents: e.maxPriceCents,
                                            facets: e.facets,
                                            tags: e.tags,
                                            categoryPath: e.categoryPath,
                                            swimlane: e.swimlane,
                                            searchView: e.searchView,
                                            audioSearchFilters: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    audioTypes: void 0 === e.audioTypes ? void 0 : null === e.audioTypes ? null : e.audioTypes.map(l),
                                                    minDurationSeconds: e.minDurationSeconds,
                                                    maxDurationSeconds: e.maxDurationSeconds,
                                                    artist: e.artist,
                                                    album: e.album,
                                                    musicChartType: e.musicChartType
                                                }
                                            }(e.audioSearchFilters),
                                            modelSearchFilters: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    includedSubTypes: void 0 === e.includedSubTypes ? void 0 : null === e.includedSubTypes ? null : e.includedSubTypes.map(y),
                                                    excludedSubTypes: void 0 === e.excludedSubTypes ? void 0 : null === e.excludedSubTypes ? null : e.excludedSubTypes.map(y),
                                                    includedInstanceTypes: void 0 === e.includedInstanceTypes ? void 0 : null === e.includedInstanceTypes ? null : e.includedInstanceTypes.map(V)
                                                }
                                            }(e.modelSearchFilters)
                                        }
                                    }(e.searchCreatorStoreAssetsRequest)
                                }, s)];
                            case 1:
                                return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return G(e)
                                })]
                        }
                    })
                })
            }, s.prototype.toolboxSearchCreatorStoreAssets = function() {
                return o(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.toolboxSearchCreatorStoreAssetsRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s.prototype.toolboxSearchCreatorStoreAssetsDeprecatedRaw = function(e, s) {
                return o(this, void 0, void 0, function() {
                    var i, r, o;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return i = {}, void 0 !== e.searchCategoryType && (i.searchCategoryType = e.searchCategoryType), void 0 !== e.query && (i.query = e.query), e.modelSubTypes && (i.modelSubTypes = e.modelSubTypes), e.excludedModelSubTypes && (i.excludedModelSubTypes = e.excludedModelSubTypes), void 0 !== e.creator && (i.creator = e.creator), void 0 !== e.userId && (i.userId = e.userId), void 0 !== e.groupId && (i.groupId = e.groupId), void 0 !== e.pageToken && (i.pageToken = e.pageToken), void 0 !== e.pageNumber && (i.pageNumber = e.pageNumber), void 0 !== e.maxPageSize && (i.maxPageSize = e.maxPageSize), void 0 !== e.sortDirection && (i.sortDirection = e.sortDirection), void 0 !== e.sortCategory && (i.sortCategory = e.sortCategory), void 0 !== e.audioMinDurationSeconds && (i.audioMinDurationSeconds = e.audioMinDurationSeconds), void 0 !== e.audioMaxDurationSeconds && (i.audioMaxDurationSeconds = e.audioMaxDurationSeconds), void 0 !== e.audioArtist && (i.audioArtist = e.audioArtist), void 0 !== e.audioAlbum && (i.audioAlbum = e.audioAlbum), e.audioTypes && (i.audioTypes = e.audioTypes), e.includedInstanceTypes && (i.includedInstanceTypes = e.includedInstanceTypes), void 0 !== e.includeOnlyVerifiedCreators && (i.includeOnlyVerifiedCreators = e.includeOnlyVerifiedCreators), void 0 !== e.minPriceCents && (i.minPriceCents = e.minPriceCents), void 0 !== e.maxPriceCents && (i.maxPriceCents = e.maxPriceCents), e.facets && (i.facets = e.facets), e.tags && (i.tags = e.tags), void 0 !== e.categoryPath && (i.categoryPath = e.categoryPath), void 0 !== e.searchView && (i.searchView = e.searchView), void 0 !== e.musicChartType && (i.musicChartType = e.musicChartType), void 0 !== e.swimlane && (i.swimlane = e.swimlane), r = {}, [4, this.request({
                                    path: "/v2/assets:search",
                                    schemaPath: "/v2/assets:search",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, s)];
                            case 1:
                                return o = a.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return G(e)
                                })]
                        }
                    })
                })
            }, s.prototype.toolboxSearchCreatorStoreAssetsDeprecated = function() {
                return o(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return [4, this.toolboxSearchCreatorStoreAssetsDeprecatedRaw(e, t)];
                            case 1:
                                return [4, s.sent().value()];
                            case 2:
                                return [2, s.sent()]
                        }
                    })
                })
            }, s
        }(t.BaseAPI));
    e.s(["AssetSubType", 0, {
        Invalid: "Invalid",
        Ad: "Ad",
        MaterialPack: "MaterialPack",
        Package: "Package"
    }, "CategoryType", 0, {
        Audio: 3,
        Model: 10,
        Decal: 13,
        Animation: 24,
        Plugin: 38,
        MeshPart: 40,
        Video: 62,
        FontFamily: 73,
        Music: 300,
        SoundEffect: 301,
        UnknownAudio: 302,
        Package: 1001,
        SharedPackage: 1002
    }, "CreatorInsightBrackets", 0, {
        LOW: 0,
        MEDIUM: 1,
        HIGH: 2
    }, "FrontendFlagsApi", 0, E, "SearchAudioTypeModel", 0, {
        Music: "Music",
        SoundEffect: "SoundEffect",
        Unknown: "Unknown"
    }, "SearchCategoryType", 0, {
        Audio: "Audio",
        Model: "Model",
        Decal: "Decal",
        Plugin: "Plugin",
        MeshPart: "MeshPart",
        Video: "Video",
        FontFamily: "FontFamily"
    }, "ToolboxApi", 0, M, "ToolboxVisibilityStatus", 0, {
        Unavailable: 0,
        Visible: 1,
        Hidden: 2,
        Unlisted: 3
    }])
}]);

//# debugId=65b2903a-4b0b-28b2-07cb-a082a6a2a351
//# sourceMappingURL=1rdu4sc87-f-r.js.map