;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "9915bdd0-3d4e-7282-80ef-01f687629368")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 894432, e => {
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

    function i(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function i() {
            this.constructor = e
        }
        r(e, t), e.prototype = null === t ? Object.create(t) : (i.prototype = t.prototype, new i)
    }
    var o = function() {
        return (o = Object.assign || function(e) {
            for (var t, r = 1, i = arguments.length; r < i; r++)
                for (var o in t = arguments[r]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
            return e
        }).apply(this, arguments)
    };

    function s(e, t, r, i) {
        return new(r || (r = Promise))(function(o, s) {
            function a(e) {
                try {
                    u(i.next(e))
                } catch (e) {
                    s(e)
                }
            }

            function n(e) {
                try {
                    u(i.throw(e))
                } catch (e) {
                    s(e)
                }
            }

            function u(e) {
                var t;
                e.done ? o(e.value) : ((t = e.value) instanceof r ? t : new r(function(e) {
                    e(t)
                })).then(a, n)
            }
            u((i = i.apply(e, t || [])).next())
        })
    }

    function a(e, t) {
        var r, i, o, s = {
                label: 0,
                sent: function() {
                    if (1 & o[0]) throw o[1];
                    return o[1]
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
                if (r) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, d[0] && (s = 0)), s;) try {
                    if (r = 1, i && (o = 2 & d[0] ? i.return : d[0] ? i.throw || ((o = i.return) && o.call(i), 0) : i.next) && !(o = o.call(i, d[1])).done) return o;
                    switch (i = 0, o && (d = [2 & d[0], o.value]), d[0]) {
                        case 0:
                        case 1:
                            o = d;
                            break;
                        case 4:
                            return s.label++, {
                                value: d[1],
                                done: !1
                            };
                        case 5:
                            s.label++, i = d[1], d = [0];
                            continue;
                        case 7:
                            d = s.ops.pop(), s.trys.pop();
                            continue;
                        default:
                            if (!(o = (o = s.trys).length > 0 && o[o.length - 1]) && (6 === d[0] || 2 === d[0])) {
                                s = 0;
                                continue
                            }
                            if (3 === d[0] && (!o || d[1] > o[0] && d[1] < o[3])) {
                                s.label = d[1];
                                break
                            }
                            if (6 === d[0] && s.label < o[1]) {
                                s.label = o[1], o = d;
                                break
                            }
                            if (o && s.label < o[2]) {
                                s.label = o[2], s.ops.push(d);
                                break
                            }
                            o[2] && s.ops.pop(), s.trys.pop();
                            continue
                    }
                    d = t.call(e, s)
                } catch (e) {
                    d = [6, e], i = 0
                } finally {
                    r = o = 0
                }
                if (5 & d[0]) throw d[1];
                return {
                    value: d[0] ? d[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function n(e, r) {
        return null == e ? e : {
            imagePreviewAssets: (0, t.u)(e, "imagePreviewAssets") ? e.imagePreviewAssets : void 0,
            videoPreviewAssets: (0, t.u)(e, "videoPreviewAssets") ? e.videoPreviewAssets : void 0
        }
    }

    function u(e) {
        var r;
        return null == (r = e) ? r : {
            linkType: (0, t.u)(r, "linkType") ? r.linkType : void 0,
            url: (0, t.u)(r, "url") ? r.url : void 0,
            title: (0, t.u)(r, "title") ? r.title : void 0
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
        var r;
        return null == (r = e) ? r : {
            searchTerm: (0, t.u)(r, "searchTerm") ? r.searchTerm : void 0,
            rank: (0, t.u)(r, "rank") ? r.rank : void 0,
            searchVolumeBracket: (0, t.u)(r, "searchVolumeBracket") ? r.searchVolumeBracket : void 0,
            adoptionBracket: (0, t.u)(r, "adoptionBracket") ? r.adoptionBracket : void 0
        }
    }

    function h(e) {
        return e
    }

    function y(e) {
        return e
    }

    function m(e, r) {
        var i, s, a, d, c, l, v, p, y, m, f;
        return null == e ? e : o(o(o(o(o(o(o(o({}, null == (i = e) ? i : {
            id: (0, t.u)(i, "id") ? i.id : void 0,
            name: (0, t.u)(i, "name") ? i.name : void 0,
            description: (0, t.u)(i, "description") ? i.description : void 0,
            assetTypeId: (0, t.u)(i, "assetTypeId") ? i.assetTypeId : void 0,
            socialLinks: (0, t.u)(i, "socialLinks") ? null === i.socialLinks ? null : i.socialLinks.map(u) : void 0,
            previewAssets: (0, t.u)(i, "previewAssets") ? n(i.previewAssets) : void 0,
            createTime: (0, t.u)(i, "createTime") ? null === i.createTime ? null : new Date(i.createTime) : void 0,
            updateTime: (0, t.u)(i, "updateTime") ? null === i.updateTime ? null : new Date(i.updateTime) : void 0,
            creatingUniverseId: (0, t.u)(i, "creatingUniverseId") ? i.creatingUniverseId : void 0,
            categoryPath: (0, t.u)(i, "categoryPath") ? i.categoryPath : void 0
        }), null == (s = e) ? s : {
            durationSeconds: (0, t.u)(s, "durationSeconds") ? s.durationSeconds : void 0,
            audioType: (0, t.u)(s, "audioType") ? s.audioType : void 0,
            artist: (0, t.u)(s, "artist") ? s.artist : void 0,
            title: (0, t.u)(s, "title") ? s.title : void 0,
            id: (0, t.u)(s, "id") ? s.id : void 0,
            name: (0, t.u)(s, "name") ? s.name : void 0,
            description: (0, t.u)(s, "description") ? s.description : void 0,
            assetTypeId: (0, t.u)(s, "assetTypeId") ? s.assetTypeId : void 0,
            socialLinks: (0, t.u)(s, "socialLinks") ? null === s.socialLinks ? null : s.socialLinks.map(u) : void 0,
            previewAssets: (0, t.u)(s, "previewAssets") ? n(s.previewAssets) : void 0,
            createTime: (0, t.u)(s, "createTime") ? null === s.createTime ? null : new Date(s.createTime) : void 0,
            updateTime: (0, t.u)(s, "updateTime") ? null === s.updateTime ? null : new Date(s.updateTime) : void 0,
            creatingUniverseId: (0, t.u)(s, "creatingUniverseId") ? s.creatingUniverseId : void 0,
            categoryPath: (0, t.u)(s, "categoryPath") ? s.categoryPath : void 0
        }), null == (a = e) ? a : {
            textureId: (0, t.u)(a, "textureId") ? a.textureId : void 0,
            id: (0, t.u)(a, "id") ? a.id : void 0,
            name: (0, t.u)(a, "name") ? a.name : void 0,
            description: (0, t.u)(a, "description") ? a.description : void 0,
            assetTypeId: (0, t.u)(a, "assetTypeId") ? a.assetTypeId : void 0,
            socialLinks: (0, t.u)(a, "socialLinks") ? null === a.socialLinks ? null : a.socialLinks.map(u) : void 0,
            previewAssets: (0, t.u)(a, "previewAssets") ? n(a.previewAssets) : void 0,
            createTime: (0, t.u)(a, "createTime") ? null === a.createTime ? null : new Date(a.createTime) : void 0,
            updateTime: (0, t.u)(a, "updateTime") ? null === a.updateTime ? null : new Date(a.updateTime) : void 0,
            creatingUniverseId: (0, t.u)(a, "creatingUniverseId") ? a.creatingUniverseId : void 0,
            categoryPath: (0, t.u)(a, "categoryPath") ? a.categoryPath : void 0
        }), null == (d = e) ? d : {
            meshId: (0, t.u)(d, "meshId") ? d.meshId : void 0,
            textureId: (0, t.u)(d, "textureId") ? d.textureId : void 0,
            id: (0, t.u)(d, "id") ? d.id : void 0,
            name: (0, t.u)(d, "name") ? d.name : void 0,
            description: (0, t.u)(d, "description") ? d.description : void 0,
            assetTypeId: (0, t.u)(d, "assetTypeId") ? d.assetTypeId : void 0,
            socialLinks: (0, t.u)(d, "socialLinks") ? null === d.socialLinks ? null : d.socialLinks.map(u) : void 0,
            previewAssets: (0, t.u)(d, "previewAssets") ? n(d.previewAssets) : void 0,
            createTime: (0, t.u)(d, "createTime") ? null === d.createTime ? null : new Date(d.createTime) : void 0,
            updateTime: (0, t.u)(d, "updateTime") ? null === d.updateTime ? null : new Date(d.updateTime) : void 0,
            creatingUniverseId: (0, t.u)(d, "creatingUniverseId") ? d.creatingUniverseId : void 0,
            categoryPath: (0, t.u)(d, "categoryPath") ? d.categoryPath : void 0
        }), null == (c = e) ? c : {
            subTypes: (0, t.u)(c, "subTypes") ? null === c.subTypes ? null : c.subTypes.map(h) : void 0,
            hasScripts: (0, t.u)(c, "hasScripts") ? c.hasScripts : void 0,
            scriptCount: (0, t.u)(c, "scriptCount") ? c.scriptCount : void 0,
            objectMeshSummary: (0, t.u)(c, "objectMeshSummary") ? null == (l = c.objectMeshSummary) ? l : {
                triangles: (0, t.u)(l, "triangles") ? l.triangles : void 0,
                vertices: (0, t.u)(l, "vertices") ? l.vertices : void 0
            } : void 0,
            instanceCounts: (0, t.u)(c, "instanceCounts") ? null == (v = c.instanceCounts) ? v : {
                script: (0, t.u)(v, "script") ? v.script : void 0,
                meshPart: (0, t.u)(v, "meshPart") ? v.meshPart : void 0,
                animation: (0, t.u)(v, "animation") ? v.animation : void 0,
                decal: (0, t.u)(v, "decal") ? v.decal : void 0,
                audio: (0, t.u)(v, "audio") ? v.audio : void 0,
                tool: (0, t.u)(v, "tool") ? v.tool : void 0
            } : void 0,
            capabilities: (0, t.u)(c, "capabilities") ? null == (p = c.capabilities) ? p : {
                shouldSandbox: (0, t.u)(p, "shouldSandbox") ? p.shouldSandbox : void 0
            } : void 0,
            id: (0, t.u)(c, "id") ? c.id : void 0,
            name: (0, t.u)(c, "name") ? c.name : void 0,
            description: (0, t.u)(c, "description") ? c.description : void 0,
            assetTypeId: (0, t.u)(c, "assetTypeId") ? c.assetTypeId : void 0,
            socialLinks: (0, t.u)(c, "socialLinks") ? null === c.socialLinks ? null : c.socialLinks.map(u) : void 0,
            previewAssets: (0, t.u)(c, "previewAssets") ? n(c.previewAssets) : void 0,
            createTime: (0, t.u)(c, "createTime") ? null === c.createTime ? null : new Date(c.createTime) : void 0,
            updateTime: (0, t.u)(c, "updateTime") ? null === c.updateTime ? null : new Date(c.updateTime) : void 0,
            creatingUniverseId: (0, t.u)(c, "creatingUniverseId") ? c.creatingUniverseId : void 0,
            categoryPath: (0, t.u)(c, "categoryPath") ? c.categoryPath : void 0
        }), null == (y = e) ? y : {
            album: (0, t.u)(y, "album") ? y.album : void 0,
            genre: (0, t.u)(y, "genre") ? y.genre : void 0,
            id: (0, t.u)(y, "id") ? y.id : void 0,
            name: (0, t.u)(y, "name") ? y.name : void 0,
            description: (0, t.u)(y, "description") ? y.description : void 0,
            assetTypeId: (0, t.u)(y, "assetTypeId") ? y.assetTypeId : void 0,
            socialLinks: (0, t.u)(y, "socialLinks") ? null === y.socialLinks ? null : y.socialLinks.map(u) : void 0,
            previewAssets: (0, t.u)(y, "previewAssets") ? n(y.previewAssets) : void 0,
            createTime: (0, t.u)(y, "createTime") ? null === y.createTime ? null : new Date(y.createTime) : void 0,
            updateTime: (0, t.u)(y, "updateTime") ? null === y.updateTime ? null : new Date(y.updateTime) : void 0,
            creatingUniverseId: (0, t.u)(y, "creatingUniverseId") ? y.creatingUniverseId : void 0,
            categoryPath: (0, t.u)(y, "categoryPath") ? y.categoryPath : void 0
        }), null == (m = e) ? m : {
            hasScripts: (0, t.u)(m, "hasScripts") ? m.hasScripts : void 0,
            scriptCount: (0, t.u)(m, "scriptCount") ? m.scriptCount : void 0,
            id: (0, t.u)(m, "id") ? m.id : void 0,
            name: (0, t.u)(m, "name") ? m.name : void 0,
            description: (0, t.u)(m, "description") ? m.description : void 0,
            assetTypeId: (0, t.u)(m, "assetTypeId") ? m.assetTypeId : void 0,
            socialLinks: (0, t.u)(m, "socialLinks") ? null === m.socialLinks ? null : m.socialLinks.map(u) : void 0,
            previewAssets: (0, t.u)(m, "previewAssets") ? n(m.previewAssets) : void 0,
            createTime: (0, t.u)(m, "createTime") ? null === m.createTime ? null : new Date(m.createTime) : void 0,
            updateTime: (0, t.u)(m, "updateTime") ? null === m.updateTime ? null : new Date(m.updateTime) : void 0,
            creatingUniverseId: (0, t.u)(m, "creatingUniverseId") ? m.creatingUniverseId : void 0,
            categoryPath: (0, t.u)(m, "categoryPath") ? m.categoryPath : void 0
        }), null == (f = e) ? f : {
            category: (0, t.u)(f, "category") ? f.category : void 0,
            subcategory: (0, t.u)(f, "subcategory") ? f.subcategory : void 0,
            id: (0, t.u)(f, "id") ? f.id : void 0,
            name: (0, t.u)(f, "name") ? f.name : void 0,
            description: (0, t.u)(f, "description") ? f.description : void 0,
            assetTypeId: (0, t.u)(f, "assetTypeId") ? f.assetTypeId : void 0,
            socialLinks: (0, t.u)(f, "socialLinks") ? null === f.socialLinks ? null : f.socialLinks.map(u) : void 0,
            previewAssets: (0, t.u)(f, "previewAssets") ? n(f.previewAssets) : void 0,
            createTime: (0, t.u)(f, "createTime") ? null === f.createTime ? null : new Date(f.createTime) : void 0,
            updateTime: (0, t.u)(f, "updateTime") ? null === f.updateTime ? null : new Date(f.updateTime) : void 0,
            creatingUniverseId: (0, t.u)(f, "creatingUniverseId") ? f.creatingUniverseId : void 0,
            categoryPath: (0, t.u)(f, "categoryPath") ? f.categoryPath : void 0
        })
    }

    function f(e, r) {
        return null == e ? e : {
            creator: (0, t.u)(e, "creator") ? e.creator : void 0,
            userId: (0, t.u)(e, "userId") ? e.userId : void 0,
            groupId: (0, t.u)(e, "groupId") ? e.groupId : void 0,
            name: (0, t.u)(e, "name") ? e.name : void 0,
            verified: (0, t.u)(e, "verified") ? e.verified : void 0,
            latestGroupUpdaterUserId: (0, t.u)(e, "latestGroupUpdaterUserId") ? e.latestGroupUpdaterUserId : void 0,
            latestGroupUpdaterUserName: (0, t.u)(e, "latestGroupUpdaterUserName") ? e.latestGroupUpdaterUserName : void 0
        }
    }

    function g(e, r) {
        return null == e ? e : {
            significand: (0, t.u)(e, "significand") ? e.significand : void 0,
            exponent: (0, t.u)(e, "exponent") ? e.exponent : void 0
        }
    }

    function T(e, r) {
        var i;
        return null == e ? e : {
            purchasePrice: (0, t.u)(e, "purchasePrice") ? null == (i = e.purchasePrice) ? i : {
                currencyCode: (0, t.u)(i, "currencyCode") ? i.currencyCode : void 0,
                quantity: (0, t.u)(i, "quantity") ? g(i.quantity) : void 0
            } : void 0,
            purchasable: (0, t.u)(e, "purchasable") ? e.purchasable : void 0
        }
    }

    function w(e, r) {
        return null == e ? e : {
            showVotes: (0, t.u)(e, "showVotes") ? e.showVotes : void 0,
            upVotes: (0, t.u)(e, "upVotes") ? e.upVotes : void 0,
            downVotes: (0, t.u)(e, "downVotes") ? e.downVotes : void 0,
            canVote: (0, t.u)(e, "canVote") ? e.canVote : void 0,
            userVote: (0, t.u)(e, "userVote") ? e.userVote : void 0,
            hasVoted: (0, t.u)(e, "hasVoted") ? e.hasVoted : void 0,
            voteCount: (0, t.u)(e, "voteCount") ? e.voteCount : void 0,
            upVotePercent: (0, t.u)(e, "upVotePercent") ? e.upVotePercent : void 0
        }
    }

    function I(e) {
        var r;
        return null == (r = e) ? r : {
            voting: (0, t.u)(r, "voting") ? w(r.voting) : void 0,
            creator: (0, t.u)(r, "creator") ? f(r.creator) : void 0,
            creatorStoreProduct: (0, t.u)(r, "creatorStoreProduct") ? T(r.creatorStoreProduct) : void 0,
            asset: (0, t.u)(r, "asset") ? m(r.asset) : void 0
        }
    }

    function b(e) {
        var r, i;
        return null == (r = e) ? r : {
            owned: (0, t.u)(r, "owned") ? r.owned : void 0,
            dateSaved: (0, t.u)(r, "dateSaved") ? new Date(r.dateSaved) : void 0,
            creatorStoreAsset: (0, t.u)(r, "creatorStoreAsset") ? null == (i = r.creatorStoreAsset) ? i : {
                voting: (0, t.u)(i, "voting") ? w(i.voting) : void 0,
                creator: (0, t.u)(i, "creator") ? f(i.creator) : void 0,
                creatorStoreProduct: (0, t.u)(i, "creatorStoreProduct") ? T(i.creatorStoreProduct) : void 0,
                asset: (0, t.u)(i, "asset") ? m(i.asset) : void 0
            } : void 0
        }
    }

    function S(e, r) {
        var i;
        return null == e ? e : {
            rankingType: (0, t.u)(e, "rankingType") ? e.rankingType : void 0,
            sortRange: (0, t.u)(e, "sortRange") ? null == (i = e.sortRange) ? i : {
                ascending: (0, t.u)(i, "ascending") ? i.ascending : void 0,
                minA: (0, t.u)(i, "minA") ? i.minA : void 0,
                minB: (0, t.u)(i, "minB") ? i.minB : void 0,
                maxA: (0, t.u)(i, "maxA") ? i.maxA : void 0,
                maxB: (0, t.u)(i, "maxB") ? i.maxB : void 0,
                keyword: (0, t.u)(i, "keyword") ? i.keyword : void 0,
                value: (0, t.u)(i, "value") ? i.value : void 0,
                byteValue: (0, t.u)(i, "byteValue") ? i.byteValue : void 0,
                startDateTime: (0, t.u)(i, "startDateTime") ? new Date(i.startDateTime) : void 0,
                endDateTime: (0, t.u)(i, "endDateTime") ? new Date(i.endDateTime) : void 0
            } : void 0,
            sortableAudienceType: (0, t.u)(e, "sortableAudienceType") ? e.sortableAudienceType : void 0,
            audienceName: (0, t.u)(e, "audienceName") ? e.audienceName : void 0
        }
    }

    function C(e) {
        var r;
        return null == (r = e) ? r : {
            min: (0, t.u)(r, "min") ? r.min : void 0,
            max: (0, t.u)(r, "max") ? r.max : void 0,
            fallbackField: (0, t.u)(r, "fallbackField") ? r.fallbackField : void 0,
            fallbackMin: (0, t.u)(r, "fallbackMin") ? r.fallbackMin : void 0,
            fallbackMax: (0, t.u)(r, "fallbackMax") ? r.fallbackMax : void 0
        }
    }

    function P(e, r) {
        var i, s, a, n;
        return null == e ? e : {
            libraryQueryOptions: (0, t.u)(e, "libraryQueryOptions") ? null == (i = e.libraryQueryOptions) ? i : o(o({}, null == (s = i) ? s : {
                contextMatch: (0, t.u)(s, "contextMatch") ? s.contextMatch : void 0,
                isMultiplicativeSearchEnabled: (0, t.u)(s, "isMultiplicativeSearchEnabled") ? s.isMultiplicativeSearchEnabled : void 0,
                sortByRankingScore: (0, t.u)(s, "sortByRankingScore") ? S(s.sortByRankingScore) : void 0,
                customRankingScriptName: (0, t.u)(s, "customRankingScriptName") ? s.customRankingScriptName : void 0,
                assetAnalysisScores: (0, t.u)(s, "assetAnalysisScores") ? null === s.assetAnalysisScores ? null : (0, t.A)(s.assetAnalysisScores, C) : void 0,
                assetStats: (0, t.u)(s, "assetStats") ? null === s.assetStats ? null : (0, t.A)(s.assetStats, C) : void 0,
                excludeModeratedAssets: (0, t.u)(s, "excludeModeratedAssets") ? s.excludeModeratedAssets : void 0,
                includeOnlyValidCreators: (0, t.u)(s, "includeOnlyValidCreators") ? s.includeOnlyValidCreators : void 0,
                filterForVisibleAssets: (0, t.u)(s, "filterForVisibleAssets") ? s.filterForVisibleAssets : void 0,
                includeHumanEvaluationVerifiedOnly: (0, t.u)(s, "includeHumanEvaluationVerifiedOnly") ? s.includeHumanEvaluationVerifiedOnly : void 0,
                filterOutHumanEvaluationVerifiedMalicious: (0, t.u)(s, "filterOutHumanEvaluationVerifiedMalicious") ? s.filterOutHumanEvaluationVerifiedMalicious : void 0,
                filterOutLowQualityThumbnails: (0, t.u)(s, "filterOutLowQualityThumbnails") ? s.filterOutLowQualityThumbnails : void 0
            }), null == (a = i) ? a : {
                contextMatch: (0, t.u)(a, "contextMatch") ? a.contextMatch : void 0,
                isMultiplicativeSearchEnabled: (0, t.u)(a, "isMultiplicativeSearchEnabled") ? a.isMultiplicativeSearchEnabled : void 0,
                sortByRankingScore: (0, t.u)(a, "sortByRankingScore") ? S(a.sortByRankingScore) : void 0,
                customRankingScriptName: (0, t.u)(a, "customRankingScriptName") ? a.customRankingScriptName : void 0,
                assetAnalysisScores: (0, t.u)(a, "assetAnalysisScores") ? null === a.assetAnalysisScores ? null : (0, t.A)(a.assetAnalysisScores, C) : void 0,
                assetStats: (0, t.u)(a, "assetStats") ? null === a.assetStats ? null : (0, t.A)(a.assetStats, C) : void 0,
                excludeModeratedAssets: (0, t.u)(a, "excludeModeratedAssets") ? a.excludeModeratedAssets : void 0,
                includeOnlyValidCreators: (0, t.u)(a, "includeOnlyValidCreators") ? a.includeOnlyValidCreators : void 0,
                filterForVisibleAssets: (0, t.u)(a, "filterForVisibleAssets") ? a.filterForVisibleAssets : void 0,
                includeHumanEvaluationVerifiedOnly: (0, t.u)(a, "includeHumanEvaluationVerifiedOnly") ? a.includeHumanEvaluationVerifiedOnly : void 0,
                filterOutHumanEvaluationVerifiedMalicious: (0, t.u)(a, "filterOutHumanEvaluationVerifiedMalicious") ? a.filterOutHumanEvaluationVerifiedMalicious : void 0,
                filterOutLowQualityThumbnails: (0, t.u)(a, "filterOutLowQualityThumbnails") ? a.filterOutLowQualityThumbnails : void 0
            }) : void 0,
            serializedCcsSearchResponseDebugInfo: (0, t.u)(e, "serializedCcsSearchResponseDebugInfo") ? e.serializedCcsSearchResponseDebugInfo : void 0,
            additionalImplData: (0, t.u)(e, "additionalImplData") ? null == (n = e.additionalImplData) ? n : {
                sNDINFRAALGORITHMNAME: (0, t.u)(n, "SND_INFRA_ALGORITHM_NAME") ? n.SND_INFRA_ALGORITHM_NAME : void 0,
                sNDINFRABLENDERS: (0, t.u)(n, "SND_INFRA_BLENDERS") ? n.SND_INFRA_BLENDERS : void 0,
                eLASTICSEARCHEXPLANATIONS: (0, t.u)(n, "ELASTIC_SEARCH_EXPLANATIONS") ? n.ELASTIC_SEARCH_EXPLANATIONS : void 0,
                eLASTICSEARCHDOCUMENTS: (0, t.u)(n, "ELASTIC_SEARCH_DOCUMENTS") ? n.ELASTIC_SEARCH_DOCUMENTS : void 0
            } : void 0
        }
    }

    function A(e) {
        var r, i;
        return null == (r = e) ? r : {
            id: (0, t.u)(r, "id") ? r.id : void 0,
            name: (0, t.u)(r, "name") ? r.name : void 0,
            debugInfo: (0, t.u)(r, "debugInfo") ? null == (i = r.debugInfo) ? i : {
                sNDINFRAALGORITHMNAME: (0, t.u)(i, "SND_INFRA_ALGORITHM_NAME") ? i.SND_INFRA_ALGORITHM_NAME : void 0,
                sNDINFRABLENDERS: (0, t.u)(i, "SND_INFRA_BLENDERS") ? i.SND_INFRA_BLENDERS : void 0,
                eLASTICSEARCHEXPLANATIONS: (0, t.u)(i, "ELASTIC_SEARCH_EXPLANATIONS") ? i.ELASTIC_SEARCH_EXPLANATIONS : void 0,
                eLASTICSEARCHDOCUMENTS: (0, t.u)(i, "ELASTIC_SEARCH_DOCUMENTS") ? i.ELASTIC_SEARCH_DOCUMENTS : void 0
            } : void 0,
            searchResultSource: (0, t.u)(r, "searchResultSource") ? r.searchResultSource : void 0
        }
    }

    function x(e, r) {
        return null == e ? e : {
            keyword: (0, t.u)(e, "keyword") ? e.keyword : void 0,
            assetSubTypes: (0, t.u)(e, "assetSubTypes") ? null === e.assetSubTypes ? null : e.assetSubTypes.map(c) : void 0,
            creatorTargetId: (0, t.u)(e, "creatorTargetId") ? e.creatorTargetId : void 0,
            creatorType: (0, t.u)(e, "creatorType") ? e.creatorType : void 0,
            excludeAssetSubTypes: (0, t.u)(e, "excludeAssetSubTypes") ? null === e.excludeAssetSubTypes ? null : e.excludeAssetSubTypes.map(c) : void 0,
            audioTypes: (0, t.u)(e, "audioTypes") ? null === e.audioTypes ? null : e.audioTypes.map(d) : void 0,
            uiSortIntent: (0, t.u)(e, "uiSortIntent") ? e.uiSortIntent : void 0,
            sortDirection: (0, t.u)(e, "sortDirection") ? e.sortDirection : void 0,
            musicChartType: (0, t.u)(e, "musicChartType") ? e.musicChartType : void 0,
            categoryPath: (0, t.u)(e, "categoryPath") ? e.categoryPath : void 0
        }
    }

    function R(e, r) {
        return null == e ? e : {
            assetId: (0, t.u)(e, "assetId") ? e.assetId : void 0,
            backgroundColor: (0, t.u)(e, "backgroundColor") ? e.backgroundColor : void 0
        }
    }

    function k(e) {
        var r;
        return null == (r = e) ? r : {
            name: (0, t.u)(r, "name") ? r.name : void 0,
            displayName: (0, t.u)(r, "displayName") ? r.displayName : void 0,
            hidden: (0, t.u)(r, "hidden") ? r.hidden : void 0,
            searchKeywords: (0, t.u)(r, "searchKeywords") ? r.searchKeywords : void 0,
            queryParams: (0, t.u)(r, "queryParams") ? x(r.queryParams) : void 0,
            path: (0, t.u)(r, "path") ? r.path : void 0,
            index: (0, t.u)(r, "index") ? r.index : void 0,
            children: (0, t.u)(r, "children") ? null === r.children ? null : (0, t.A)(r.children, k) : void 0,
            childCount: (0, t.u)(r, "childCount") ? r.childCount : void 0,
            thumbnail: (0, t.u)(r, "thumbnail") ? R(r.thumbnail) : void 0,
            categoryPath: (0, t.u)(r, "categoryPath") ? r.categoryPath : void 0
        }
    }

    function q(e) {
        var r, i;
        return null == (r = e) ? r : {
            displayName: (0, t.u)(r, "displayName") ? r.displayName : void 0,
            name: (0, t.u)(r, "name") ? r.name : void 0,
            subcategory: (0, t.u)(r, "subcategory") ? null == (i = r.subcategory) ? i : {
                name: (0, t.u)(i, "name") ? i.name : void 0,
                displayName: (0, t.u)(i, "displayName") ? i.displayName : void 0,
                hidden: (0, t.u)(i, "hidden") ? i.hidden : void 0,
                searchKeywords: (0, t.u)(i, "searchKeywords") ? i.searchKeywords : void 0,
                queryParams: (0, t.u)(i, "queryParams") ? x(i.queryParams) : void 0,
                path: (0, t.u)(i, "path") ? i.path : void 0,
                index: (0, t.u)(i, "index") ? i.index : void 0,
                children: (0, t.u)(i, "children") ? null === i.children ? null : (0, t.A)(i.children, k) : void 0,
                childCount: (0, t.u)(i, "childCount") ? i.childCount : void 0,
                thumbnail: (0, t.u)(i, "thumbnail") ? R(i.thumbnail) : void 0,
                categoryPath: (0, t.u)(i, "categoryPath") ? i.categoryPath : void 0
            } : void 0
        }
    }

    function V(e) {
        var r;
        return null == (r = e) ? r : {
            name: (0, t.u)(r, "name") ? r.name : void 0,
            displayName: (0, t.u)(r, "displayName") ? r.displayName : void 0,
            overrideCategoryPath: (0, t.u)(r, "overrideCategoryPath") ? r.overrideCategoryPath : void 0,
            categoryPath: (0, t.u)(r, "categoryPath") ? r.categoryPath : void 0
        }
    }

    function G(e) {
        var r;
        return null == (r = e) ? r : {
            name: (0, t.u)(r, "Name") ? r.Name : void 0,
            assetId: (0, t.u)(r, "AssetId") ? r.AssetId : void 0,
            assetVersionId: (0, t.u)(r, "AssetVersionId") ? r.AssetVersionId : void 0,
            creatorName: (0, t.u)(r, "CreatorName") ? r.CreatorName : void 0,
            objectTypes: (0, t.u)(r, "ObjectTypes") ? r.ObjectTypes : void 0
        }
    }

    function D(e) {
        return e
    }

    function N(e, r) {
        var i, o;
        return null == e ? e : {
            nextPageToken: (0, t.u)(e, "nextPageToken") ? e.nextPageToken : void 0,
            queryFacets: (0, t.u)(e, "queryFacets") ? null == (i = e.queryFacets) ? i : {
                appliedFacets: (0, t.u)(i, "appliedFacets") ? i.appliedFacets : void 0,
                availableFacets: (0, t.u)(i, "availableFacets") ? i.availableFacets : void 0
            } : void 0,
            creatorStoreAssets: (0, t.u)(e, "creatorStoreAssets") ? null === e.creatorStoreAssets ? null : e.creatorStoreAssets.map(I) : void 0,
            totalResults: (0, t.u)(e, "totalResults") ? e.totalResults : void 0,
            queryCorrection: (0, t.u)(e, "queryCorrection") ? null == (o = e.queryCorrection) ? o : {
                suggestedQuery: (0, t.u)(o, "suggestedQuery") ? o.suggestedQuery : void 0
            } : void 0,
            filteredKeyword: (0, t.u)(e, "filteredKeyword") ? e.filteredKeyword : void 0
        }
    }

    function U(e) {
        var r, i, o, s, a, l, v, p, h, y, m, f;
        return null == (r = e) ? r : {
            asset: (0, t.u)(r, "asset") ? null == (i = r.asset) ? i : {
                audioDetails: (0, t.u)(i, "audioDetails") ? null == (o = i.audioDetails) ? o : {
                    audioType: (0, t.u)(o, "audioType") ? d(o.audioType) : void 0,
                    artist: (0, t.u)(o, "artist") ? o.artist : void 0,
                    title: (0, t.u)(o, "title") ? o.title : void 0,
                    musicAlbum: (0, t.u)(o, "musicAlbum") ? o.musicAlbum : void 0,
                    musicGenre: (0, t.u)(o, "musicGenre") ? o.musicGenre : void 0,
                    soundEffectCategory: (0, t.u)(o, "soundEffectCategory") ? o.soundEffectCategory : void 0,
                    soundEffectSubcategory: (0, t.u)(o, "soundEffectSubcategory") ? o.soundEffectSubcategory : void 0,
                    tags: (0, t.u)(o, "tags") ? o.tags : void 0
                } : void 0,
                id: (0, t.u)(i, "id") ? i.id : void 0,
                name: (0, t.u)(i, "name") ? i.name : void 0,
                typeId: (0, t.u)(i, "typeId") ? i.typeId : void 0,
                assetSubTypes: (0, t.u)(i, "assetSubTypes") ? null === i.assetSubTypes ? null : i.assetSubTypes.map(c) : void 0,
                assetGenres: (0, t.u)(i, "assetGenres") ? i.assetGenres : void 0,
                isEndorsed: (0, t.u)(i, "isEndorsed") ? i.isEndorsed : void 0,
                description: (0, t.u)(i, "description") ? i.description : void 0,
                duration: (0, t.u)(i, "duration") ? i.duration : void 0,
                hasScripts: (0, t.u)(i, "hasScripts") ? i.hasScripts : void 0,
                scriptCount: (0, t.u)(i, "scriptCount") ? i.scriptCount : void 0,
                createdUtc: (0, t.u)(i, "createdUtc") ? null === i.createdUtc ? null : new Date(i.createdUtc) : void 0,
                updatedUtc: (0, t.u)(i, "updatedUtc") ? null === i.updatedUtc ? null : new Date(i.updatedUtc) : void 0,
                creatingUniverseId: (0, t.u)(i, "creatingUniverseId") ? i.creatingUniverseId : void 0,
                isAssetHashApproved: (0, t.u)(i, "isAssetHashApproved") ? i.isAssetHashApproved : void 0,
                visibilityStatus: (0, t.u)(i, "visibilityStatus") ? i.visibilityStatus : void 0,
                socialLinks: (0, t.u)(i, "socialLinks") ? null === i.socialLinks ? null : i.socialLinks.map(u) : void 0,
                meshId: (0, t.u)(i, "meshId") ? i.meshId : void 0,
                textureId: (0, t.u)(i, "textureId") ? i.textureId : void 0,
                modelTechnicalDetails: (0, t.u)(i, "modelTechnicalDetails") ? null == (s = i.modelTechnicalDetails) ? s : {
                    objectMeshSummary: (0, t.u)(s, "objectMeshSummary") ? null == (a = s.objectMeshSummary) ? a : {
                        triangles: (0, t.u)(a, "triangles") ? a.triangles : void 0,
                        vertices: (0, t.u)(a, "vertices") ? a.vertices : void 0
                    } : void 0,
                    instanceCounts: (0, t.u)(s, "instanceCounts") ? null == (l = s.instanceCounts) ? l : {
                        script: (0, t.u)(l, "script") ? l.script : void 0,
                        meshPart: (0, t.u)(l, "meshPart") ? l.meshPart : void 0,
                        animation: (0, t.u)(l, "animation") ? l.animation : void 0,
                        decal: (0, t.u)(l, "decal") ? l.decal : void 0,
                        audio: (0, t.u)(l, "audio") ? l.audio : void 0,
                        tool: (0, t.u)(l, "tool") ? l.tool : void 0
                    } : void 0
                } : void 0,
                previewAssets: (0, t.u)(i, "previewAssets") ? n(i.previewAssets) : void 0,
                categoryPath: (0, t.u)(i, "categoryPath") ? i.categoryPath : void 0,
                capabilities: (0, t.u)(i, "capabilities") ? null == (v = i.capabilities) ? v : {
                    shouldSandbox: (0, t.u)(v, "shouldSandbox") ? v.shouldSandbox : void 0
                } : void 0,
                objectTypes: (0, t.u)(i, "objectTypes") ? i.objectTypes : void 0
            } : void 0,
            creator: (0, t.u)(r, "creator") ? null == (p = r.creator) ? p : {
                id: (0, t.u)(p, "id") ? p.id : void 0,
                name: (0, t.u)(p, "name") ? p.name : void 0,
                type: (0, t.u)(p, "type") ? p.type : void 0,
                isVerifiedCreator: (0, t.u)(p, "isVerifiedCreator") ? p.isVerifiedCreator : void 0,
                latestGroupUpdaterUserId: (0, t.u)(p, "latestGroupUpdaterUserId") ? p.latestGroupUpdaterUserId : void 0,
                latestGroupUpdaterUserName: (0, t.u)(p, "latestGroupUpdaterUserName") ? p.latestGroupUpdaterUserName : void 0
            } : void 0,
            voting: (0, t.u)(r, "voting") ? null == (h = r.voting) ? h : {
                showVotes: (0, t.u)(h, "showVotes") ? h.showVotes : void 0,
                upVotes: (0, t.u)(h, "upVotes") ? h.upVotes : void 0,
                downVotes: (0, t.u)(h, "downVotes") ? h.downVotes : void 0,
                canVote: (0, t.u)(h, "canVote") ? h.canVote : void 0,
                userVote: (0, t.u)(h, "userVote") ? h.userVote : void 0,
                hasVoted: (0, t.u)(h, "hasVoted") ? h.hasVoted : void 0,
                voteCount: (0, t.u)(h, "voteCount") ? h.voteCount : void 0,
                upVotePercent: (0, t.u)(h, "upVotePercent") ? h.upVotePercent : void 0
            } : void 0,
            product: (0, t.u)(r, "product") ? null == (y = r.product) ? y : {
                productId: (0, t.u)(y, "productId") ? y.productId : void 0,
                price: (0, t.u)(y, "price") ? y.price : void 0,
                isForSaleOrIsPublicDomain: (0, t.u)(y, "isForSaleOrIsPublicDomain") ? y.isForSaleOrIsPublicDomain : void 0
            } : void 0,
            fiatProduct: (0, t.u)(r, "fiatProduct") ? null == (m = r.fiatProduct) ? m : {
                purchasePrice: (0, t.u)(m, "purchasePrice") ? null == (f = m.purchasePrice) ? f : {
                    currencyCode: (0, t.u)(f, "currencyCode") ? f.currencyCode : void 0,
                    quantity: (0, t.u)(f, "quantity") ? g(f.quantity) : void 0
                } : void 0,
                published: (0, t.u)(m, "published") ? m.published : void 0,
                purchasable: (0, t.u)(m, "purchasable") ? m.purchasable : void 0,
                isFree: (0, t.u)(m, "isFree") ? m.isFree : void 0
            } : void 0
        }
    }

    function O(e, r) {
        var i, o;
        return null == e ? e : {
            totalResults: (0, t.u)(e, "totalResults") ? e.totalResults : void 0,
            filteredKeyword: (0, t.u)(e, "filteredKeyword") ? e.filteredKeyword : void 0,
            searchDebugInfo: (0, t.u)(e, "searchDebugInfo") ? P(e.searchDebugInfo) : void 0,
            spellCheckerResult: (0, t.u)(e, "spellCheckerResult") ? null == (i = e.spellCheckerResult) ? i : {
                correctionState: (0, t.u)(i, "correctionState") ? i.correctionState : void 0,
                correctedQuery: (0, t.u)(i, "correctedQuery") ? i.correctedQuery : void 0,
                userQuery: (0, t.u)(i, "userQuery") ? i.userQuery : void 0
            } : void 0,
            queryFacets: (0, t.u)(e, "queryFacets") ? null == (o = e.queryFacets) ? o : {
                appliedFacets: (0, t.u)(o, "appliedFacets") ? o.appliedFacets : void 0,
                availableFacets: (0, t.u)(o, "availableFacets") ? o.availableFacets : void 0
            } : void 0,
            imageSearchStatus: (0, t.u)(e, "imageSearchStatus") ? e.imageSearchStatus : void 0,
            previousPageCursor: (0, t.u)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
            nextPageCursor: (0, t.u)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
            data: (0, t.u)(e, "data") ? null === e.data ? null : e.data.map(A) : void 0
        }
    }
    var E = function(e) {
            function r() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(r, e), r.prototype.frontendFlagsGetAllUserSettingsRaw = function(e) {
                return s(this, void 0, void 0, function() {
                    var r, i, o;
                    return a(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return r = {}, i = {}, [4, this.request({
                                    path: "/v1/frontend-flags/user-settings",
                                    schemaPath: "/v1/frontend-flags/user-settings",
                                    method: "GET",
                                    headers: i,
                                    query: r
                                }, e)];
                            case 1:
                                return o = s.sent(), [2, new t.H(o, function(e) {
                                    return null == e ? e : {
                                        data: (0, t.u)(e, "data") ? e.data : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.frontendFlagsGetAllUserSettings = function(e) {
                return s(this, void 0, void 0, function() {
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
            }, r.prototype.frontendFlagsGetUserSettingRaw = function(e, r) {
                return s(this, void 0, void 0, function() {
                    var i, o, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.featureKey || void 0 === e.featureKey) throw new t.w("featureKey", "Required parameter requestParameters.featureKey was null or undefined when calling frontendFlagsGetUserSetting.");
                                return i = {}, o = {}, [4, this.request({
                                    path: "/v1/frontend-flags/user-settings/{featureKey}".replace("{".concat("featureKey", "}"), encodeURIComponent(String(e.featureKey))),
                                    schemaPath: "/v1/frontend-flags/user-settings/{featureKey}",
                                    method: "GET",
                                    headers: o,
                                    query: i
                                }, r)];
                            case 1:
                                return s = a.sent(), [2, new t.H(s, function(e) {
                                    return null == e ? e : {
                                        featureKey: (0, t.u)(e, "featureKey") ? e.featureKey : void 0,
                                        value: (0, t.u)(e, "value") ? e.value : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.frontendFlagsGetUserSetting = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.frontendFlagsGetUserSettingRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.frontendFlagsGetValuesRaw = function(e, r) {
                return s(this, void 0, void 0, function() {
                    var i, o, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return i = {}, e.flags && (i.flags = e.flags), o = {}, [4, this.request({
                                    path: "/v1/frontend-flags/values",
                                    schemaPath: "/v1/frontend-flags/values",
                                    method: "GET",
                                    headers: o,
                                    query: i
                                }, r)];
                            case 1:
                                return s = a.sent(), [2, new t.H(s, function(e) {
                                    return null == e ? e : {
                                        data: (0, t.u)(e, "data") ? e.data : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.frontendFlagsGetValues = function() {
                return s(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.frontendFlagsGetValuesRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.frontendFlagsSetUserSettingRaw = function(e, r) {
                return s(this, void 0, void 0, function() {
                    var i, o, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.featureKey || void 0 === e.featureKey) throw new t.w("featureKey", "Required parameter requestParameters.featureKey was null or undefined when calling frontendFlagsSetUserSetting.");
                                return i = {}, (o = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/frontend-flags/user-settings/{featureKey}".replace("{".concat("featureKey", "}"), encodeURIComponent(String(e.featureKey))),
                                    schemaPath: "/v1/frontend-flags/user-settings/{featureKey}",
                                    method: "PUT",
                                    headers: o,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            value: e.value
                                        }
                                    }(e.updateUserSettingRequest)
                                }, r)];
                            case 1:
                                return s = a.sent(), [2, new t.V(s)]
                        }
                    })
                })
            }, r.prototype.frontendFlagsSetUserSetting = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.frontendFlagsSetUserSettingRaw(e, t)];
                            case 1:
                                return r.sent(), [2]
                        }
                    })
                })
            }, r
        }(t._),
        M = (function(e) {
            function r() {
                return null !== e && e.apply(this, arguments) || this
            }
            i(r, e), r.prototype.homeGetAssetsRaw = function(e, r) {
                return s(this, void 0, void 0, function() {
                    var i, o, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetType || void 0 === e.assetType) throw new t.w("assetType", "Required parameter requestParameters.assetType was null or undefined when calling homeGetAssets.");
                                if (null === e.section || void 0 === e.section) throw new t.w("section", "Required parameter requestParameters.section was null or undefined when calling homeGetAssets.");
                                return i = {}, void 0 !== e.includeOnlyVerifiedCreators && (i.includeOnlyVerifiedCreators = e.includeOnlyVerifiedCreators), void 0 !== e.sortOrder && (i.sortOrder = e.sortOrder), void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.pageNumber && (i.pageNumber = e.pageNumber), void 0 !== e.locale && (i.locale = e.locale), void 0 !== e.placeId && (i.placeId = e.placeId), void 0 !== e.assetsInCameraVicinity && (i.assetsInCameraVicinity = e.assetsInCameraVicinity), void 0 !== e.assetsInCameraViewport && (i.assetsInCameraViewport = e.assetsInCameraViewport), void 0 !== e.minPriceInCents && (i.minPriceInCents = e.minPriceInCents), void 0 !== e.maxPriceInCents && (i.maxPriceInCents = e.maxPriceInCents), e.includedInstanceTypes && (i.includedInstanceTypes = e.includedInstanceTypes), o = {}, [4, this.request({
                                    path: "/v1/home/{assetType}/section/{section}/assets".replace("{".concat("assetType", "}"), encodeURIComponent(String(e.assetType))).replace("{".concat("section", "}"), encodeURIComponent(String(e.section))),
                                    schemaPath: "/v1/home/{assetType}/section/{section}/assets",
                                    method: "GET",
                                    headers: o,
                                    query: i
                                }, r)];
                            case 1:
                                return s = a.sent(), [2, new t.H(s, function(e) {
                                    return null == e ? e : {
                                        totalResults: (0, t.u)(e, "totalResults") ? e.totalResults : void 0,
                                        searchDebugInfo: (0, t.u)(e, "searchDebugInfo") ? P(e.searchDebugInfo) : void 0,
                                        previousPageCursor: (0, t.u)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                        nextPageCursor: (0, t.u)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                        data: (0, t.u)(e, "data") ? null === e.data ? null : e.data.map(A) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.homeGetAssets = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.homeGetAssetsRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.homeGetAssetsV2Raw = function(e, r) {
                return s(this, void 0, void 0, function() {
                    var i, o, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetType || void 0 === e.assetType) throw new t.w("assetType", "Required parameter requestParameters.assetType was null or undefined when calling homeGetAssetsV2.");
                                if (null === e.section || void 0 === e.section) throw new t.w("section", "Required parameter requestParameters.section was null or undefined when calling homeGetAssetsV2.");
                                return i = {}, void 0 !== e.includeOnlyVerifiedCreators && (i.includeOnlyVerifiedCreators = e.includeOnlyVerifiedCreators), void 0 !== e.sortOrder && (i.sortOrder = e.sortOrder), void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.pageNumber && (i.pageNumber = e.pageNumber), void 0 !== e.locale && (i.locale = e.locale), void 0 !== e.placeId && (i.placeId = e.placeId), void 0 !== e.assetsInCameraVicinity && (i.assetsInCameraVicinity = e.assetsInCameraVicinity), void 0 !== e.assetsInCameraViewport && (i.assetsInCameraViewport = e.assetsInCameraViewport), void 0 !== e.minPriceInCents && (i.minPriceInCents = e.minPriceInCents), void 0 !== e.maxPriceInCents && (i.maxPriceInCents = e.maxPriceInCents), e.includedInstanceTypes && (i.includedInstanceTypes = e.includedInstanceTypes), o = {}, [4, this.request({
                                    path: "/v2/home/{assetType}/section/{section}/assets".replace("{".concat("assetType", "}"), encodeURIComponent(String(e.assetType))).replace("{".concat("section", "}"), encodeURIComponent(String(e.section))),
                                    schemaPath: "/v2/home/{assetType}/section/{section}/assets",
                                    method: "GET",
                                    headers: o,
                                    query: i
                                }, r)];
                            case 1:
                                return s = a.sent(), [2, new t.H(s, function(e) {
                                    return null == e ? e : {
                                        nextPageToken: (0, t.u)(e, "nextPageToken") ? e.nextPageToken : void 0,
                                        creatorStoreAssets: (0, t.u)(e, "creatorStoreAssets") ? null === e.creatorStoreAssets ? null : e.creatorStoreAssets.map(I) : void 0,
                                        totalResults: (0, t.u)(e, "totalResults") ? e.totalResults : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.homeGetAssetsV2 = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.homeGetAssetsV2Raw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.homeGetConfigurationRaw = function(e, r) {
                return s(this, void 0, void 0, function() {
                    var i, o, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetType || void 0 === e.assetType) throw new t.w("assetType", "Required parameter requestParameters.assetType was null or undefined when calling homeGetConfiguration.");
                                return i = {}, void 0 !== e.locale && (i.locale = e.locale), void 0 !== e.placeId && (i.placeId = e.placeId), o = {}, [4, this.request({
                                    path: "/v1/home/{assetType}/configuration".replace("{".concat("assetType", "}"), encodeURIComponent(String(e.assetType))),
                                    schemaPath: "/v1/home/{assetType}/configuration",
                                    method: "GET",
                                    headers: o,
                                    query: i
                                }, r)];
                            case 1:
                                return s = a.sent(), [2, new t.H(s, function(e) {
                                    return null == e ? e : {
                                        sections: (0, t.u)(e, "sections") ? null === e.sections ? null : e.sections.map(q) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.homeGetConfiguration = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.homeGetConfigurationRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.homeGetConfigurationV2Raw = function(e, r) {
                return s(this, void 0, void 0, function() {
                    var i, o, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return i = {}, void 0 !== e.locale && (i.locale = e.locale), void 0 !== e.placeId && (i.placeId = e.placeId), o = {}, [4, this.request({
                                    path: "/v2/home/configuration",
                                    schemaPath: "/v2/home/configuration",
                                    method: "GET",
                                    headers: o,
                                    query: i
                                }, r)];
                            case 1:
                                return s = a.sent(), [2, new t.H(s, function(e) {
                                    return function e(r) {
                                        var i, o, s, a;
                                        return null == (i = r) ? i : {
                                            displayName: (0, t.u)(i, "displayName") ? i.displayName : void 0,
                                            categoryPath: (0, t.u)(i, "categoryPath") ? i.categoryPath : void 0,
                                            layout: (0, t.u)(i, "layout") ? i.layout : void 0,
                                            showChildCategoryRow: (0, t.u)(i, "showChildCategoryRow") ? i.showChildCategoryRow : void 0,
                                            swimlanes: (0, t.u)(i, "swimlanes") ? null === i.swimlanes ? null : i.swimlanes.map(V) : void 0,
                                            defaultGrid: (0, t.u)(i, "defaultGrid") ? null == (o = i.defaultGrid) ? o : {
                                                swimlane: (0, t.u)(o, "swimlane") ? null == (s = o.swimlane) ? s : {
                                                    name: (0, t.u)(s, "name") ? s.name : void 0,
                                                    displayName: (0, t.u)(s, "displayName") ? s.displayName : void 0,
                                                    overrideCategoryPath: (0, t.u)(s, "overrideCategoryPath") ? s.overrideCategoryPath : void 0,
                                                    categoryPath: (0, t.u)(s, "categoryPath") ? s.categoryPath : void 0
                                                } : void 0,
                                                categoryPath: (0, t.u)(o, "categoryPath") ? o.categoryPath : void 0
                                            } : void 0,
                                            children: (0, t.u)(i, "children") ? null === i.children ? null : i.children.map(e) : void 0,
                                            thumbnail: (0, t.u)(i, "thumbnail") ? null == (a = i.thumbnail) ? a : {
                                                assetId: (0, t.u)(a, "assetId") ? a.assetId : void 0,
                                                backgroundColor: (0, t.u)(a, "backgroundColor") ? a.backgroundColor : void 0
                                            } : void 0
                                        }
                                    }(e)
                                })]
                        }
                    })
                })
            }, r.prototype.homeGetConfigurationV2 = function() {
                return s(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.homeGetConfigurationV2Raw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }
        }(t._), function(e) {
            function r() {
                return null !== e && e.apply(this, arguments) || this
            }
            i(r, e), r.prototype.savesBulkDeleteSavesRaw = function(e, r) {
                return s(this, void 0, void 0, function() {
                    var i, o, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return i = {}, (o = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/saves:bulkDelete",
                                    schemaPath: "/v1/saves:bulkDelete",
                                    method: "POST",
                                    headers: o,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            targets: null === e.targets ? null : e.targets.map(v)
                                        }
                                    }(e.bulkDeleteSavesRequest)
                                }, r)];
                            case 1:
                                return s = a.sent(), [2, new t.H(s, function(e) {
                                    return null == e ? e : {
                                        deletedCount: (0, t.u)(e, "deletedCount") ? e.deletedCount : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.savesBulkDeleteSaves = function() {
                return s(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.savesBulkDeleteSavesRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.savesCreateSaveRaw = function(e, r) {
                return s(this, void 0, void 0, function() {
                    var i, o, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return i = {}, (o = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/saves",
                                    schemaPath: "/v1/saves",
                                    method: "POST",
                                    headers: o,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            targetType: e.targetType,
                                            targetId: e.targetId,
                                            collectionName: e.collectionName
                                        }
                                    }(e.createSaveRequest)
                                }, r)];
                            case 1:
                                return s = a.sent(), [2, new t.V(s)]
                        }
                    })
                })
            }, r.prototype.savesCreateSave = function() {
                return s(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.savesCreateSaveRaw(e, t)];
                            case 1:
                                return r.sent(), [2]
                        }
                    })
                })
            }, r.prototype.savesDeleteSaveRaw = function(e, r) {
                return s(this, void 0, void 0, function() {
                    var i, o, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return i = {}, void 0 !== e.targetType && (i.targetType = e.targetType), void 0 !== e.targetId && (i.targetId = e.targetId), void 0 !== e.collectionName && (i.collectionName = e.collectionName), o = {}, [4, this.request({
                                    path: "/v1/saves",
                                    schemaPath: "/v1/saves",
                                    method: "DELETE",
                                    headers: o,
                                    query: i
                                }, r)];
                            case 1:
                                return s = a.sent(), [2, new t.V(s)]
                        }
                    })
                })
            }, r.prototype.savesDeleteSave = function() {
                return s(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.savesDeleteSaveRaw(e, t)];
                            case 1:
                                return r.sent(), [2]
                        }
                    })
                })
            }, r.prototype.savesGetSavesRaw = function(e, r) {
                return s(this, void 0, void 0, function() {
                    var i, o, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return i = {}, void 0 !== e.targetType && (i.targetType = e.targetType), void 0 !== e.targetId && (i.targetId = e.targetId), void 0 !== e.collectionName && (i.collectionName = e.collectionName), void 0 !== e.sortBy && (i.sortBy = e.sortBy), void 0 !== e.sortDirection && (i.sortDirection = e.sortDirection), void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.page && (i.page = e.page), void 0 !== e.keyword && (i.keyword = e.keyword), void 0 !== e.hideOwnedAssets && (i.hideOwnedAssets = e.hideOwnedAssets), o = {}, [4, this.request({
                                    path: "/v1/saves",
                                    schemaPath: "/v1/saves",
                                    method: "GET",
                                    headers: o,
                                    query: i
                                }, r)];
                            case 1:
                                return s = a.sent(), [2, new t.H(s, function(e) {
                                    return null == e ? e : {
                                        totalCount: e.totalCount,
                                        saves: null === e.saves ? null : e.saves.map(b)
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.savesGetSaves = function() {
                return s(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.savesGetSavesRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }
        }(t._), function(e) {
            function r() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(r, e), r.prototype.toolboxGetAssetDetailsRaw = function(e, r) {
                return s(this, void 0, void 0, function() {
                    var i, o, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new t.w("id", "Required parameter requestParameters.id was null or undefined when calling toolboxGetAssetDetails.");
                                return i = {}, o = {}, [4, this.request({
                                    path: "/v2/assets/{id}".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v2/assets/{id}",
                                    method: "GET",
                                    headers: o,
                                    query: i
                                }, r)];
                            case 1:
                                return s = a.sent(), [2, new t.H(s, function(e) {
                                    return I(e)
                                })]
                        }
                    })
                })
            }, r.prototype.toolboxGetAssetDetails = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.toolboxGetAssetDetailsRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.toolboxGetAudioRaw = function(e, r) {
                return s(this, void 0, void 0, function() {
                    var i, o, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return i = {}, void 0 !== e.sortOrder && (i.sortOrder = e.sortOrder), void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.pageNumber && (i.pageNumber = e.pageNumber), void 0 !== e.keyword && (i.keyword = e.keyword), void 0 !== e.creatorType && (i.creatorType = e.creatorType), void 0 !== e.creatorTargetId && (i.creatorTargetId = e.creatorTargetId), void 0 !== e.minDuration && (i.minDuration = e.minDuration), void 0 !== e.maxDuration && (i.maxDuration = e.maxDuration), void 0 !== e.sortDirection && (i.sortDirection = e.sortDirection), void 0 !== e.artist && (i.artist = e.artist), void 0 !== e.album && (i.album = e.album), e.audioTypes && (i.audioTypes = e.audioTypes), void 0 !== e.uiSortIntent && (i.uiSortIntent = e.uiSortIntent), void 0 !== e.tags && (i.tags = e.tags), void 0 !== e.includeOnlyVerifiedCreators && (i.includeOnlyVerifiedCreators = e.includeOnlyVerifiedCreators), void 0 !== e.querySource && (i.querySource = e.querySource), void 0 !== e.originalUserQuery && (i.originalUserQuery = e.originalUserQuery), void 0 !== e.originalCorrection && (i.originalCorrection = e.originalCorrection), e.facets && (i.facets = e.facets), o = {}, [4, this.request({
                                    path: "/v1/audio",
                                    schemaPath: "/v1/audio",
                                    method: "GET",
                                    headers: o,
                                    query: i
                                }, r)];
                            case 1:
                                return s = a.sent(), [2, new t.H(s, function(e) {
                                    return O(e)
                                })]
                        }
                    })
                })
            }, r.prototype.toolboxGetAudio = function() {
                return s(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.toolboxGetAudioRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.toolboxGetCreationAssetsRaw = function(e, r) {
                return s(this, void 0, void 0, function() {
                    var i, o, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.ownerId || void 0 === e.ownerId) throw new t.w("ownerId", "Required parameter requestParameters.ownerId was null or undefined when calling toolboxGetCreationAssets.");
                                if (null === e.assetType || void 0 === e.assetType) throw new t.w("assetType", "Required parameter requestParameters.assetType was null or undefined when calling toolboxGetCreationAssets.");
                                return i = {}, void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.separateModelsAndPackages && (i.separateModelsAndPackages = e.separateModelsAndPackages), void 0 !== e.includeSharedAssets && (i.includeSharedAssets = e.includeSharedAssets), o = {}, [4, this.request({
                                    path: "/v1/creations/group/{ownerId}/{assetType}".replace("{".concat("ownerId", "}"), encodeURIComponent(String(e.ownerId))).replace("{".concat("assetType", "}"), encodeURIComponent(String(e.assetType))),
                                    schemaPath: "/v1/creations/group/{ownerId}/{assetType}",
                                    method: "GET",
                                    headers: o,
                                    query: i
                                }, r)];
                            case 1:
                                return s = a.sent(), [2, new t.H(s, function(e) {
                                    return O(e)
                                })]
                        }
                    })
                })
            }, r.prototype.toolboxGetCreationAssets = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.toolboxGetCreationAssetsRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.toolboxGetCreatorInsightsRaw = function(e, r) {
                return s(this, void 0, void 0, function() {
                    var i, o, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetType || void 0 === e.assetType) throw new t.w("assetType", "Required parameter requestParameters.assetType was null or undefined when calling toolboxGetCreatorInsights.");
                                return i = {}, o = {}, [4, this.request({
                                    path: "/v1/insights/{assetType}".replace("{".concat("assetType", "}"), encodeURIComponent(String(e.assetType))),
                                    schemaPath: "/v1/insights/{assetType}",
                                    method: "GET",
                                    headers: o,
                                    query: i
                                }, r)];
                            case 1:
                                return s = a.sent(), [2, new t.H(s, function(e) {
                                    return e.map(p)
                                })]
                        }
                    })
                })
            }, r.prototype.toolboxGetCreatorInsights = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.toolboxGetCreatorInsightsRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.toolboxGetDecalsRaw = function(e, r) {
                return s(this, void 0, void 0, function() {
                    var i, o, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return i = {}, void 0 !== e.sortOrder && (i.sortOrder = e.sortOrder), void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.pageNumber && (i.pageNumber = e.pageNumber), void 0 !== e.keyword && (i.keyword = e.keyword), void 0 !== e.creatorType && (i.creatorType = e.creatorType), void 0 !== e.creatorTargetId && (i.creatorTargetId = e.creatorTargetId), void 0 !== e.uiSortIntent && (i.uiSortIntent = e.uiSortIntent), void 0 !== e.tags && (i.tags = e.tags), void 0 !== e.includeOnlyVerifiedCreators && (i.includeOnlyVerifiedCreators = e.includeOnlyVerifiedCreators), void 0 !== e.querySource && (i.querySource = e.querySource), void 0 !== e.originalUserQuery && (i.originalUserQuery = e.originalUserQuery), void 0 !== e.originalCorrection && (i.originalCorrection = e.originalCorrection), e.facets && (i.facets = e.facets), o = {}, [4, this.request({
                                    path: "/v1/decals",
                                    schemaPath: "/v1/decals",
                                    method: "GET",
                                    headers: o,
                                    query: i
                                }, r)];
                            case 1:
                                return s = a.sent(), [2, new t.H(s, function(e) {
                                    return O(e)
                                })]
                        }
                    })
                })
            }, r.prototype.toolboxGetDecals = function() {
                return s(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.toolboxGetDecalsRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.toolboxGetInventoryAssetsRaw = function(e, r) {
                return s(this, void 0, void 0, function() {
                    var i, o, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new t.w("userId", "Required parameter requestParameters.userId was null or undefined when calling toolboxGetInventoryAssets.");
                                if (null === e.assetType || void 0 === e.assetType) throw new t.w("assetType", "Required parameter requestParameters.assetType was null or undefined when calling toolboxGetInventoryAssets.");
                                return i = {}, void 0 !== e.keyword && (i.keyword = e.keyword), void 0 !== e.sortOrder && (i.sortOrder = e.sortOrder), void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.pageNumber && (i.pageNumber = e.pageNumber), e.creatorTargetIds && (i.creatorTargetIds = e.creatorTargetIds), e.groupTargetIds && (i.groupTargetIds = e.groupTargetIds), void 0 !== e.uiSortIntent && (i.uiSortIntent = e.uiSortIntent), void 0 !== e.excludeGroupCreations && (i.excludeGroupCreations = e.excludeGroupCreations), void 0 !== e.allPackagesAndModels && (i.allPackagesAndModels = e.allPackagesAndModels), o = {}, [4, this.request({
                                    path: "/v1/inventory/user/{userId}/{assetType}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))).replace("{".concat("assetType", "}"), encodeURIComponent(String(e.assetType))),
                                    schemaPath: "/v1/inventory/user/{userId}/{assetType}",
                                    method: "GET",
                                    headers: o,
                                    query: i
                                }, r)];
                            case 1:
                                return s = a.sent(), [2, new t.H(s, function(e) {
                                    return O(e)
                                })]
                        }
                    })
                })
            }, r.prototype.toolboxGetInventoryAssets = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.toolboxGetInventoryAssetsRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.toolboxGetItemsDetailsRaw = function(e, r) {
                return s(this, void 0, void 0, function() {
                    var i, o, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return i = {}, void 0 !== e.assetIds && (i.assetIds = e.assetIds), o = {}, [4, this.request({
                                    path: "/v1/items/details",
                                    schemaPath: "/v1/items/details",
                                    method: "GET",
                                    headers: o,
                                    query: i
                                }, r)];
                            case 1:
                                return s = a.sent(), [2, new t.H(s, function(e) {
                                    return null == e ? e : {
                                        data: (0, t.u)(e, "data") ? null === e.data ? null : e.data.map(U) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.toolboxGetItemsDetails = function() {
                return s(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.toolboxGetItemsDetailsRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.toolboxGetLegacyInsertServiceFreeAssetsRaw = function(e, r) {
                return s(this, void 0, void 0, function() {
                    var i, o, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetType || void 0 === e.assetType) throw new t.w("assetType", "Required parameter requestParameters.assetType was null or undefined when calling toolboxGetLegacyInsertServiceFreeAssets.");
                                return i = {}, void 0 !== e.pageNumber && (i.pageNumber = e.pageNumber), void 0 !== e.keyword && (i.keyword = e.keyword), o = {}, [4, this.request({
                                    path: "/v1/legacy-insert-service/{assetType}".replace("{".concat("assetType", "}"), encodeURIComponent(String(e.assetType))),
                                    schemaPath: "/v1/legacy-insert-service/{assetType}",
                                    method: "GET",
                                    headers: o,
                                    query: i
                                }, r)];
                            case 1:
                                return s = a.sent(), [2, new t.H(s, function(e) {
                                    return null == e ? e : {
                                        totalCount: (0, t.u)(e, "TotalCount") ? e.TotalCount : void 0,
                                        currentStartIndex: (0, t.u)(e, "CurrentStartIndex") ? e.CurrentStartIndex : void 0,
                                        results: (0, t.u)(e, "Results") ? null === e.Results ? null : e.Results.map(G) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.toolboxGetLegacyInsertServiceFreeAssets = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.toolboxGetLegacyInsertServiceFreeAssetsRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.toolboxGetMarketplaceAssetsRaw = function(e, r) {
                return s(this, void 0, void 0, function() {
                    var i, o, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetType || void 0 === e.assetType) throw new t.w("assetType", "Required parameter requestParameters.assetType was null or undefined when calling toolboxGetMarketplaceAssets.");
                                return i = {}, void 0 !== e.sortOrder && (i.sortOrder = e.sortOrder), void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.pageNumber && (i.pageNumber = e.pageNumber), void 0 !== e.keyword && (i.keyword = e.keyword), e.assetSubTypes && (i.assetSubTypes = e.assetSubTypes), e.excludeAssetSubTypes && (i.excludeAssetSubTypes = e.excludeAssetSubTypes), void 0 !== e.creatorType && (i.creatorType = e.creatorType), void 0 !== e.creatorTargetId && (i.creatorTargetId = e.creatorTargetId), void 0 !== e.minDuration && (i.minDuration = e.minDuration), void 0 !== e.maxDuration && (i.maxDuration = e.maxDuration), void 0 !== e.sortDirection && (i.sortDirection = e.sortDirection), void 0 !== e.artist && (i.artist = e.artist), void 0 !== e.album && (i.album = e.album), e.audioTypes && (i.audioTypes = e.audioTypes), void 0 !== e.uiSortIntent && (i.uiSortIntent = e.uiSortIntent), void 0 !== e.tags && (i.tags = e.tags), void 0 !== e.includeOnlyVerifiedCreators && (i.includeOnlyVerifiedCreators = e.includeOnlyVerifiedCreators), void 0 !== e.searchSource && (i.searchSource = e.searchSource), void 0 !== e.querySource && (i.querySource = e.querySource), void 0 !== e.originalUserQuery && (i.originalUserQuery = e.originalUserQuery), void 0 !== e.originalCorrection && (i.originalCorrection = e.originalCorrection), e.facets && (i.facets = e.facets), void 0 !== e.categoryPath && (i.categoryPath = e.categoryPath), void 0 !== e.minPriceInCents && (i.minPriceInCents = e.minPriceInCents), void 0 !== e.maxPriceInCents && (i.maxPriceInCents = e.maxPriceInCents), e.includedInstanceTypes && (i.includedInstanceTypes = e.includedInstanceTypes), void 0 !== e.includeAllPublishedAssets && (i.includeAllPublishedAssets = e.includeAllPublishedAssets), void 0 !== e.musicChartType && (i.musicChartType = e.musicChartType), o = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (o["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                    path: "/v1/marketplace/{assetType}".replace("{".concat("assetType", "}"), encodeURIComponent(String(e.assetType))),
                                    schemaPath: "/v1/marketplace/{assetType}",
                                    method: "GET",
                                    headers: o,
                                    query: i
                                }, r)];
                            case 1:
                                return s = a.sent(), [2, new t.H(s, function(e) {
                                    return O(e)
                                })]
                        }
                    })
                })
            }, r.prototype.toolboxGetMarketplaceAssets = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.toolboxGetMarketplaceAssetsRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.toolboxGetMarketplaceAssetsV2Raw = function(e, r) {
                return s(this, void 0, void 0, function() {
                    var i, o, s, n;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetType || void 0 === e.assetType) throw new t.w("assetType", "Required parameter requestParameters.assetType was null or undefined when calling toolboxGetMarketplaceAssetsV2.");
                                return i = {}, void 0 !== e.sortOrder && (i.sortOrder = e.sortOrder), void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.pageNumber && (i.pageNumber = e.pageNumber), void 0 !== e.keyword && (i.keyword = e.keyword), e.assetSubTypes && (i.assetSubTypes = e.assetSubTypes), e.excludeAssetSubTypes && (i.excludeAssetSubTypes = e.excludeAssetSubTypes), void 0 !== e.creatorType && (i.creatorType = e.creatorType), void 0 !== e.creatorTargetId && (i.creatorTargetId = e.creatorTargetId), void 0 !== e.minDuration && (i.minDuration = e.minDuration), void 0 !== e.maxDuration && (i.maxDuration = e.maxDuration), void 0 !== e.sortDirection && (i.sortDirection = e.sortDirection), void 0 !== e.artist && (i.artist = e.artist), void 0 !== e.album && (i.album = e.album), e.audioTypes && (i.audioTypes = e.audioTypes), void 0 !== e.uiSortIntent && (i.uiSortIntent = e.uiSortIntent), void 0 !== e.tags && (i.tags = e.tags), void 0 !== e.includeOnlyVerifiedCreators && (i.includeOnlyVerifiedCreators = e.includeOnlyVerifiedCreators), void 0 !== e.searchSource && (i.searchSource = e.searchSource), void 0 !== e.querySource && (i.querySource = e.querySource), void 0 !== e.originalUserQuery && (i.originalUserQuery = e.originalUserQuery), void 0 !== e.originalCorrection && (i.originalCorrection = e.originalCorrection), e.facets && (i.facets = e.facets), o = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (o["Roblox-Place-Id"] = String(e.robloxPlaceId)), s = (0, t.I)([{
                                    contentType: "multipart/form-data"
                                }]) ? new FormData : new URLSearchParams, void 0 !== e.image && s.append("image", e.image), [4, this.request({
                                    path: "/v1/marketplace/{assetType}".replace("{".concat("assetType", "}"), encodeURIComponent(String(e.assetType))),
                                    schemaPath: "/v1/marketplace/{assetType}",
                                    method: "POST",
                                    headers: o,
                                    query: i,
                                    body: s
                                }, r)];
                            case 1:
                                return n = a.sent(), [2, new t.H(n, function(e) {
                                    return O(e)
                                })]
                        }
                    })
                })
            }, r.prototype.toolboxGetMarketplaceAssetsV2 = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.toolboxGetMarketplaceAssetsV2Raw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.toolboxGetMeshesRaw = function(e, r) {
                return s(this, void 0, void 0, function() {
                    var i, o, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return i = {}, void 0 !== e.sortOrder && (i.sortOrder = e.sortOrder), void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.pageNumber && (i.pageNumber = e.pageNumber), void 0 !== e.keyword && (i.keyword = e.keyword), void 0 !== e.creatorType && (i.creatorType = e.creatorType), void 0 !== e.creatorTargetId && (i.creatorTargetId = e.creatorTargetId), void 0 !== e.uiSortIntent && (i.uiSortIntent = e.uiSortIntent), void 0 !== e.tags && (i.tags = e.tags), void 0 !== e.includeOnlyVerifiedCreators && (i.includeOnlyVerifiedCreators = e.includeOnlyVerifiedCreators), void 0 !== e.querySource && (i.querySource = e.querySource), void 0 !== e.originalUserQuery && (i.originalUserQuery = e.originalUserQuery), void 0 !== e.originalCorrection && (i.originalCorrection = e.originalCorrection), e.facets && (i.facets = e.facets), o = {}, [4, this.request({
                                    path: "/v1/meshes",
                                    schemaPath: "/v1/meshes",
                                    method: "GET",
                                    headers: o,
                                    query: i
                                }, r)];
                            case 1:
                                return s = a.sent(), [2, new t.H(s, function(e) {
                                    return O(e)
                                })]
                        }
                    })
                })
            }, r.prototype.toolboxGetMeshes = function() {
                return s(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.toolboxGetMeshesRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.toolboxGetModelsRaw = function(e, r) {
                return s(this, void 0, void 0, function() {
                    var i, o, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return i = {}, void 0 !== e.sortOrder && (i.sortOrder = e.sortOrder), void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.pageNumber && (i.pageNumber = e.pageNumber), void 0 !== e.keyword && (i.keyword = e.keyword), e.assetSubTypes && (i.assetSubTypes = e.assetSubTypes), e.excludeAssetSubTypes && (i.excludeAssetSubTypes = e.excludeAssetSubTypes), void 0 !== e.creatorType && (i.creatorType = e.creatorType), void 0 !== e.creatorTargetId && (i.creatorTargetId = e.creatorTargetId), void 0 !== e.uiSortIntent && (i.uiSortIntent = e.uiSortIntent), void 0 !== e.tags && (i.tags = e.tags), void 0 !== e.includeOnlyVerifiedCreators && (i.includeOnlyVerifiedCreators = e.includeOnlyVerifiedCreators), void 0 !== e.searchSource && (i.searchSource = e.searchSource), void 0 !== e.querySource && (i.querySource = e.querySource), void 0 !== e.originalUserQuery && (i.originalUserQuery = e.originalUserQuery), void 0 !== e.originalCorrection && (i.originalCorrection = e.originalCorrection), e.facets && (i.facets = e.facets), void 0 !== e.minPriceInCents && (i.minPriceInCents = e.minPriceInCents), void 0 !== e.maxPriceInCents && (i.maxPriceInCents = e.maxPriceInCents), e.modelInstanceTypeFilter && (i.modelInstanceTypeFilter = e.modelInstanceTypeFilter), o = {}, [4, this.request({
                                    path: "/v1/models",
                                    schemaPath: "/v1/models",
                                    method: "GET",
                                    headers: o,
                                    query: i
                                }, r)];
                            case 1:
                                return s = a.sent(), [2, new t.H(s, function(e) {
                                    return O(e)
                                })]
                        }
                    })
                })
            }, r.prototype.toolboxGetModels = function() {
                return s(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.toolboxGetModelsRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.toolboxGetPluginsRaw = function(e, r) {
                return s(this, void 0, void 0, function() {
                    var i, o, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return i = {}, void 0 !== e.sortOrder && (i.sortOrder = e.sortOrder), void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.pageNumber && (i.pageNumber = e.pageNumber), void 0 !== e.keyword && (i.keyword = e.keyword), void 0 !== e.creatorType && (i.creatorType = e.creatorType), void 0 !== e.creatorTargetId && (i.creatorTargetId = e.creatorTargetId), void 0 !== e.uiSortIntent && (i.uiSortIntent = e.uiSortIntent), void 0 !== e.tags && (i.tags = e.tags), void 0 !== e.includeOnlyVerifiedCreators && (i.includeOnlyVerifiedCreators = e.includeOnlyVerifiedCreators), void 0 !== e.searchSource && (i.searchSource = e.searchSource), void 0 !== e.querySource && (i.querySource = e.querySource), void 0 !== e.originalUserQuery && (i.originalUserQuery = e.originalUserQuery), void 0 !== e.originalCorrection && (i.originalCorrection = e.originalCorrection), e.facets && (i.facets = e.facets), void 0 !== e.minPriceInCents && (i.minPriceInCents = e.minPriceInCents), void 0 !== e.maxPriceInCents && (i.maxPriceInCents = e.maxPriceInCents), o = {}, [4, this.request({
                                    path: "/v1/plugins",
                                    schemaPath: "/v1/plugins",
                                    method: "GET",
                                    headers: o,
                                    query: i
                                }, r)];
                            case 1:
                                return s = a.sent(), [2, new t.H(s, function(e) {
                                    return O(e)
                                })]
                        }
                    })
                })
            }, r.prototype.toolboxGetPlugins = function() {
                return s(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.toolboxGetPluginsRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.toolboxGetRecentAssetsRaw = function(e, r) {
                return s(this, void 0, void 0, function() {
                    var i, o, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new t.w("userId", "Required parameter requestParameters.userId was null or undefined when calling toolboxGetRecentAssets.");
                                if (null === e.assetType || void 0 === e.assetType) throw new t.w("assetType", "Required parameter requestParameters.assetType was null or undefined when calling toolboxGetRecentAssets.");
                                return i = {}, void 0 !== e.sortOrder && (i.sortOrder = e.sortOrder), void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.pageNumber && (i.pageNumber = e.pageNumber), o = {}, [4, this.request({
                                    path: "/v1/recent/user/{userId}/{assetType}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))).replace("{".concat("assetType", "}"), encodeURIComponent(String(e.assetType))),
                                    schemaPath: "/v1/recent/user/{userId}/{assetType}",
                                    method: "GET",
                                    headers: o,
                                    query: i
                                }, r)];
                            case 1:
                                return s = a.sent(), [2, new t.H(s, function(e) {
                                    return O(e)
                                })]
                        }
                    })
                })
            }, r.prototype.toolboxGetRecentAssets = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.toolboxGetRecentAssetsRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.toolboxGetUserCreationAssetsRaw = function(e, r) {
                return s(this, void 0, void 0, function() {
                    var i, o, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new t.w("userId", "Required parameter requestParameters.userId was null or undefined when calling toolboxGetUserCreationAssets.");
                                if (null === e.assetType || void 0 === e.assetType) throw new t.w("assetType", "Required parameter requestParameters.assetType was null or undefined when calling toolboxGetUserCreationAssets.");
                                return i = {}, void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.separateModelsAndPackages && (i.separateModelsAndPackages = e.separateModelsAndPackages), o = {}, [4, this.request({
                                    path: "/v1/creations/user/{userId}/{assetType}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))).replace("{".concat("assetType", "}"), encodeURIComponent(String(e.assetType))),
                                    schemaPath: "/v1/creations/user/{userId}/{assetType}",
                                    method: "GET",
                                    headers: o,
                                    query: i
                                }, r)];
                            case 1:
                                return s = a.sent(), [2, new t.H(s, function(e) {
                                    return O(e)
                                })]
                        }
                    })
                })
            }, r.prototype.toolboxGetUserCreationAssets = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.toolboxGetUserCreationAssetsRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.toolboxGetUserFavoriteAssetsRaw = function(e, r) {
                return s(this, void 0, void 0, function() {
                    var i, o, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new t.w("userId", "Required parameter requestParameters.userId was null or undefined when calling toolboxGetUserFavoriteAssets.");
                                if (null === e.assetType || void 0 === e.assetType) throw new t.w("assetType", "Required parameter requestParameters.assetType was null or undefined when calling toolboxGetUserFavoriteAssets.");
                                return i = {}, void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.isPrevious && (i.isPrevious = e.isPrevious), o = {}, [4, this.request({
                                    path: "/v1/favorites/user/{userId}/{assetType}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))).replace("{".concat("assetType", "}"), encodeURIComponent(String(e.assetType))),
                                    schemaPath: "/v1/favorites/user/{userId}/{assetType}",
                                    method: "GET",
                                    headers: o,
                                    query: i
                                }, r)];
                            case 1:
                                return s = a.sent(), [2, new t.H(s, function(e) {
                                    return null == e ? e : {
                                        previousPageCursor: (0, t.u)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                        nextPageCursor: (0, t.u)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                        data: (0, t.u)(e, "data") ? null === e.data ? null : e.data.map(I) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.toolboxGetUserFavoriteAssets = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.toolboxGetUserFavoriteAssetsRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.toolboxGetVideosRaw = function(e, r) {
                return s(this, void 0, void 0, function() {
                    var i, o, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return i = {}, void 0 !== e.sortOrder && (i.sortOrder = e.sortOrder), void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.pageNumber && (i.pageNumber = e.pageNumber), void 0 !== e.keyword && (i.keyword = e.keyword), void 0 !== e.creatorType && (i.creatorType = e.creatorType), void 0 !== e.creatorTargetId && (i.creatorTargetId = e.creatorTargetId), void 0 !== e.uiSortIntent && (i.uiSortIntent = e.uiSortIntent), void 0 !== e.tags && (i.tags = e.tags), void 0 !== e.includeOnlyVerifiedCreators && (i.includeOnlyVerifiedCreators = e.includeOnlyVerifiedCreators), void 0 !== e.querySource && (i.querySource = e.querySource), void 0 !== e.originalUserQuery && (i.originalUserQuery = e.originalUserQuery), void 0 !== e.originalCorrection && (i.originalCorrection = e.originalCorrection), e.facets && (i.facets = e.facets), o = {}, [4, this.request({
                                    path: "/v1/videos",
                                    schemaPath: "/v1/videos",
                                    method: "GET",
                                    headers: o,
                                    query: i
                                }, r)];
                            case 1:
                                return s = a.sent(), [2, new t.H(s, function(e) {
                                    return O(e)
                                })]
                        }
                    })
                })
            }, r.prototype.toolboxGetVideos = function() {
                return s(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.toolboxGetVideosRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.toolboxGetVoteRaw = function(e, r) {
                return s(this, void 0, void 0, function() {
                    var i, o, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling toolboxGetVote.");
                                if (null === e.assetType || void 0 === e.assetType) throw new t.w("assetType", "Required parameter requestParameters.assetType was null or undefined when calling toolboxGetVote.");
                                return i = {}, void 0 !== e.assetId && (i.assetId = e.assetId), void 0 !== e.assetType && (i.assetType = e.assetType), o = {}, [4, this.request({
                                    path: "/v1/voting/vote",
                                    schemaPath: "/v1/voting/vote",
                                    method: "GET",
                                    headers: o,
                                    query: i
                                }, r)];
                            case 1:
                                return s = a.sent(), [2, new t.H(s, function(e) {
                                    return null == e ? e : {
                                        userVote: (0, t.u)(e, "userVote") ? e.userVote : void 0
                                    }
                                })]
                        }
                    })
                })
            }, r.prototype.toolboxGetVote = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.toolboxGetVoteRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.toolboxInsertAssetRaw = function(e, r) {
                return s(this, void 0, void 0, function() {
                    var i, o, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.assetId || void 0 === e.assetId) throw new t.w("assetId", "Required parameter requestParameters.assetId was null or undefined when calling toolboxInsertAsset.");
                                return i = {}, o = {}, [4, this.request({
                                    path: "/v1/insert/asset/{assetId}".replace("{".concat("assetId", "}"), encodeURIComponent(String(e.assetId))),
                                    schemaPath: "/v1/insert/asset/{assetId}",
                                    method: "POST",
                                    headers: o,
                                    query: i
                                }, r)];
                            case 1:
                                return s = a.sent(), [2, new t.V(s)]
                        }
                    })
                })
            }, r.prototype.toolboxInsertAsset = function(e, t) {
                return s(this, void 0, void 0, function() {
                    return a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.toolboxInsertAssetRaw(e, t)];
                            case 1:
                                return r.sent(), [2]
                        }
                    })
                })
            }, r.prototype.toolboxSearchCreatorStoreAssetsRaw = function(e, r) {
                return s(this, void 0, void 0, function() {
                    var i, o, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return i = {}, (o = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v2/assets:search",
                                    schemaPath: "/v2/assets:search",
                                    method: "POST",
                                    headers: o,
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
                                                    includedInstanceTypes: void 0 === e.includedInstanceTypes ? void 0 : null === e.includedInstanceTypes ? null : e.includedInstanceTypes.map(D)
                                                }
                                            }(e.modelSearchFilters)
                                        }
                                    }(e.searchCreatorStoreAssetsRequest)
                                }, r)];
                            case 1:
                                return s = a.sent(), [2, new t.H(s, function(e) {
                                    return N(e)
                                })]
                        }
                    })
                })
            }, r.prototype.toolboxSearchCreatorStoreAssets = function() {
                return s(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.toolboxSearchCreatorStoreAssetsRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r.prototype.toolboxSearchCreatorStoreAssetsDeprecatedRaw = function(e, r) {
                return s(this, void 0, void 0, function() {
                    var i, o, s;
                    return a(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return i = {}, void 0 !== e.searchCategoryType && (i.searchCategoryType = e.searchCategoryType), void 0 !== e.query && (i.query = e.query), e.modelSubTypes && (i.modelSubTypes = e.modelSubTypes), e.excludedModelSubTypes && (i.excludedModelSubTypes = e.excludedModelSubTypes), void 0 !== e.creator && (i.creator = e.creator), void 0 !== e.userId && (i.userId = e.userId), void 0 !== e.groupId && (i.groupId = e.groupId), void 0 !== e.pageToken && (i.pageToken = e.pageToken), void 0 !== e.pageNumber && (i.pageNumber = e.pageNumber), void 0 !== e.maxPageSize && (i.maxPageSize = e.maxPageSize), void 0 !== e.sortDirection && (i.sortDirection = e.sortDirection), void 0 !== e.sortCategory && (i.sortCategory = e.sortCategory), void 0 !== e.audioMinDurationSeconds && (i.audioMinDurationSeconds = e.audioMinDurationSeconds), void 0 !== e.audioMaxDurationSeconds && (i.audioMaxDurationSeconds = e.audioMaxDurationSeconds), void 0 !== e.audioArtist && (i.audioArtist = e.audioArtist), void 0 !== e.audioAlbum && (i.audioAlbum = e.audioAlbum), e.audioTypes && (i.audioTypes = e.audioTypes), e.includedInstanceTypes && (i.includedInstanceTypes = e.includedInstanceTypes), void 0 !== e.includeOnlyVerifiedCreators && (i.includeOnlyVerifiedCreators = e.includeOnlyVerifiedCreators), void 0 !== e.minPriceCents && (i.minPriceCents = e.minPriceCents), void 0 !== e.maxPriceCents && (i.maxPriceCents = e.maxPriceCents), e.facets && (i.facets = e.facets), e.tags && (i.tags = e.tags), void 0 !== e.categoryPath && (i.categoryPath = e.categoryPath), void 0 !== e.searchView && (i.searchView = e.searchView), void 0 !== e.musicChartType && (i.musicChartType = e.musicChartType), void 0 !== e.swimlane && (i.swimlane = e.swimlane), o = {}, [4, this.request({
                                    path: "/v2/assets:search",
                                    schemaPath: "/v2/assets:search",
                                    method: "GET",
                                    headers: o,
                                    query: i
                                }, r)];
                            case 1:
                                return s = a.sent(), [2, new t.H(s, function(e) {
                                    return N(e)
                                })]
                        }
                    })
                })
            }, r.prototype.toolboxSearchCreatorStoreAssetsDeprecated = function() {
                return s(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), a(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return [4, this.toolboxSearchCreatorStoreAssetsDeprecatedRaw(e, t)];
                            case 1:
                                return [4, r.sent().value()];
                            case 2:
                                return [2, r.sent()]
                        }
                    })
                })
            }, r
        }(t._));
    e.s(["g", 0, {
        Invalid: "Invalid",
        Ad: "Ad",
        MaterialPack: "MaterialPack",
        Package: "Package"
    }, "C", 0, {
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
    }, "v", 0, {
        LOW: 0,
        MEDIUM: 1,
        HIGH: 2
    }, "k", 0, E, "U", 0, {
        Music: "Music",
        SoundEffect: "SoundEffect",
        Unknown: "Unknown"
    }, "O", 0, {
        Audio: "Audio",
        Model: "Model",
        Decal: "Decal",
        Plugin: "Plugin",
        MeshPart: "MeshPart",
        Video: "Video",
        FontFamily: "FontFamily"
    }, "e", 0, M, "o", 0, {
        Unavailable: 0,
        Visible: 1,
        Hidden: 2,
        Unlisted: 3
    }])
}]);

//# debugId=9915bdd0-3d4e-7282-80ef-01f687629368
//# sourceMappingURL=32zfvt6igkcvr.js.map