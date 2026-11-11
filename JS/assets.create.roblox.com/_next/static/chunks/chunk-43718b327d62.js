;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "1dc182da-8c62-2128-01ad-b9ab7e619390")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 392782, 73927, e => {
    "use strict";
    var r = e.i(415858),
        t = function(e, r) {
            return (t = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, r) {
                e.__proto__ = r
            } || function(e, r) {
                for (var t in r) Object.prototype.hasOwnProperty.call(r, t) && (e[t] = r[t])
            })(e, r)
        };

    function n(e, r) {
        if ("function" != typeof r && null !== r) throw TypeError("Class extends value " + String(r) + " is not a constructor or null");

        function n() {
            this.constructor = e
        }
        t(e, r), e.prototype = null === r ? Object.create(r) : (n.prototype = r.prototype, new n)
    }

    function i(e, r, t, n) {
        return new(t || (t = Promise))(function(i, s) {
            function a(e) {
                try {
                    u(n.next(e))
                } catch (e) {
                    s(e)
                }
            }

            function o(e) {
                try {
                    u(n.throw(e))
                } catch (e) {
                    s(e)
                }
            }

            function u(e) {
                var r;
                e.done ? i(e.value) : ((r = e.value) instanceof t ? r : new t(function(e) {
                    e(r)
                })).then(a, o)
            }
            u((n = n.apply(e, r || [])).next())
        })
    }

    function s(e, r) {
        var t, n, i, s = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
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
                if (t) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, d[0] && (s = 0)), s;) try {
                    if (t = 1, n && (i = 2 & d[0] ? n.return : d[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, d[1])).done) return i;
                    switch (n = 0, i && (d = [2 & d[0], i.value]), d[0]) {
                        case 0:
                        case 1:
                            i = d;
                            break;
                        case 4:
                            return s.label++, {
                                value: d[1],
                                done: !1
                            };
                        case 5:
                            s.label++, n = d[1], d = [0];
                            continue;
                        case 7:
                            d = s.ops.pop(), s.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = s.trys).length > 0 && i[i.length - 1]) && (6 === d[0] || 2 === d[0])) {
                                s = 0;
                                continue
                            }
                            if (3 === d[0] && (!i || d[1] > i[0] && d[1] < i[3])) {
                                s.label = d[1];
                                break
                            }
                            if (6 === d[0] && s.label < i[1]) {
                                s.label = i[1], i = d;
                                break
                            }
                            if (i && s.label < i[2]) {
                                s.label = i[2], s.ops.push(d);
                                break
                            }
                            i[2] && s.ops.pop(), s.trys.pop();
                            continue
                    }
                    d = r.call(e, s)
                } catch (e) {
                    d = [6, e], n = 0
                } finally {
                    t = i = 0
                }
                if (5 & d[0]) throw d[1];
                return {
                    value: d[0] ? d[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function a(e) {
        var t;
        return null == (t = e) ? t : {
            playerToken: (0, r.u)(t, "playerToken") ? t.playerToken : void 0,
            id: (0, r.u)(t, "id") ? t.id : void 0,
            name: (0, r.u)(t, "name") ? t.name : void 0,
            displayName: (0, r.u)(t, "displayName") ? t.displayName : void 0
        }
    }

    function o(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, r.u)(t, "id") ? t.id : void 0,
            title: (0, r.u)(t, "title") ? t.title : void 0,
            url: (0, r.u)(t, "url") ? t.url : void 0,
            type: (0, r.u)(t, "type") ? t.type : void 0
        }
    }

    function u(e) {
        var t, n, i;
        return null == (t = e) ? t : {
            id: (0, r.u)(t, "id") ? t.id : void 0,
            rootPlaceId: (0, r.u)(t, "rootPlaceId") ? t.rootPlaceId : void 0,
            name: (0, r.u)(t, "name") ? t.name : void 0,
            description: (0, r.u)(t, "description") ? t.description : void 0,
            sourceName: (0, r.u)(t, "sourceName") ? t.sourceName : void 0,
            sourceDescription: (0, r.u)(t, "sourceDescription") ? t.sourceDescription : void 0,
            creator: (0, r.u)(t, "creator") ? null == (n = t.creator) ? n : {
                id: (0, r.u)(n, "id") ? n.id : void 0,
                name: (0, r.u)(n, "name") ? n.name : void 0,
                type: (0, r.u)(n, "type") ? n.type : void 0,
                isRNVAccount: (0, r.u)(n, "isRNVAccount") ? n.isRNVAccount : void 0,
                hasVerifiedBadge: (0, r.u)(n, "hasVerifiedBadge") ? n.hasVerifiedBadge : void 0
            } : void 0,
            price: (0, r.u)(t, "price") ? t.price : void 0,
            allowedGearGenres: (0, r.u)(t, "allowedGearGenres") ? t.allowedGearGenres : void 0,
            allowedGearCategories: (0, r.u)(t, "allowedGearCategories") ? t.allowedGearCategories : void 0,
            isGenreEnforced: (0, r.u)(t, "isGenreEnforced") ? t.isGenreEnforced : void 0,
            copyingAllowed: (0, r.u)(t, "copyingAllowed") ? t.copyingAllowed : void 0,
            playing: (0, r.u)(t, "playing") ? t.playing : void 0,
            visits: (0, r.u)(t, "visits") ? t.visits : void 0,
            maxPlayers: (0, r.u)(t, "maxPlayers") ? t.maxPlayers : void 0,
            created: (0, r.u)(t, "created") ? new Date(t.created) : void 0,
            updated: (0, r.u)(t, "updated") ? new Date(t.updated) : void 0,
            studioAccessToApisAllowed: (0, r.u)(t, "studioAccessToApisAllowed") ? t.studioAccessToApisAllowed : void 0,
            createVipServersAllowed: (0, r.u)(t, "createVipServersAllowed") ? t.createVipServersAllowed : void 0,
            universeAvatarType: (0, r.u)(t, "universeAvatarType") ? t.universeAvatarType : void 0,
            genre: (0, r.u)(t, "genre") ? t.genre : void 0,
            genreL1: (0, r.u)(t, "genre_l1") ? t.genre_l1 : void 0,
            genreL2: (0, r.u)(t, "genre_l2") ? t.genre_l2 : void 0,
            isAllGenre: (0, r.u)(t, "isAllGenre") ? t.isAllGenre : void 0,
            isFavoritedByUser: (0, r.u)(t, "isFavoritedByUser") ? t.isFavoritedByUser : void 0,
            favoritedCount: (0, r.u)(t, "favoritedCount") ? t.favoritedCount : void 0,
            licenseDescription: (0, r.u)(t, "licenseDescription") ? t.licenseDescription : void 0,
            refundLink: (0, r.u)(t, "refundLink") ? t.refundLink : void 0,
            localizedFiatPrice: (0, r.u)(t, "localizedFiatPrice") ? t.localizedFiatPrice : void 0,
            refundPolicy: (0, r.u)(t, "refundPolicy") ? null == (i = t.refundPolicy) ? i : {
                policyText: (0, r.u)(i, "policyText") ? i.policyText : void 0,
                learnMoreBaseUrl: (0, r.u)(i, "learnMoreBaseUrl") ? i.learnMoreBaseUrl : void 0,
                locale: (0, r.u)(i, "locale") ? i.locale : void 0,
                articleId: (0, r.u)(i, "articleId") ? i.articleId : void 0
            } : void 0
        }
    }

    function d(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, r.u)(t, "id") ? t.id : void 0,
            assetTypeId: (0, r.u)(t, "assetTypeId") ? t.assetTypeId : void 0,
            assetType: (0, r.u)(t, "assetType") ? t.assetType : void 0,
            imageId: (0, r.u)(t, "imageId") ? t.imageId : void 0,
            videoHash: (0, r.u)(t, "videoHash") ? t.videoHash : void 0,
            videoTitle: (0, r.u)(t, "videoTitle") ? t.videoTitle : void 0,
            approved: (0, r.u)(t, "approved") ? t.approved : void 0,
            altText: (0, r.u)(t, "altText") ? t.altText : void 0
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function v(e, t) {
        return null == e ? e : {
            localizedFiatPrice: (0, r.u)(e, "localizedFiatPrice") ? e.localizedFiatPrice : void 0,
            basePriceId: (0, r.u)(e, "basePriceId") ? e.basePriceId : void 0
        }
    }

    function c(e) {
        var t;
        return null == (t = e) ? t : {
            universeId: (0, r.u)(t, "universeId") ? t.universeId : void 0,
            isForSale: (0, r.u)(t, "isForSale") ? t.isForSale : void 0,
            productId: (0, r.u)(t, "productId") ? t.productId : void 0,
            price: (0, r.u)(t, "price") ? t.price : void 0,
            sellerId: (0, r.u)(t, "sellerId") ? t.sellerId : void 0,
            fiatPurchaseData: (0, r.u)(t, "fiatPurchaseData") ? v(t.fiatPurchaseData) : void 0
        }
    }

    function l(e) {
        var t;
        return null == (t = e) ? t : {
            creatorId: (0, r.u)(t, "creatorId") ? t.creatorId : void 0,
            creatorName: (0, r.u)(t, "creatorName") ? t.creatorName : void 0,
            creatorType: (0, r.u)(t, "creatorType") ? t.creatorType : void 0,
            creatorHasVerifiedBadge: (0, r.u)(t, "creatorHasVerifiedBadge") ? t.creatorHasVerifiedBadge : void 0,
            totalUpVotes: (0, r.u)(t, "totalUpVotes") ? t.totalUpVotes : void 0,
            totalDownVotes: (0, r.u)(t, "totalDownVotes") ? t.totalDownVotes : void 0,
            universeId: (0, r.u)(t, "universeId") ? t.universeId : void 0,
            name: (0, r.u)(t, "name") ? t.name : void 0,
            placeId: (0, r.u)(t, "placeId") ? t.placeId : void 0,
            playerCount: (0, r.u)(t, "playerCount") ? t.playerCount : void 0,
            imageToken: (0, r.u)(t, "imageToken") ? t.imageToken : void 0,
            isSponsored: (0, r.u)(t, "isSponsored") ? t.isSponsored : void 0,
            nativeAdData: (0, r.u)(t, "nativeAdData") ? t.nativeAdData : void 0,
            isShowSponsoredLabel: (0, r.u)(t, "isShowSponsoredLabel") ? t.isShowSponsoredLabel : void 0,
            price: (0, r.u)(t, "price") ? t.price : void 0,
            analyticsIdentifier: (0, r.u)(t, "analyticsIdentifier") ? t.analyticsIdentifier : void 0,
            gameDescription: (0, r.u)(t, "gameDescription") ? t.gameDescription : void 0,
            genre: (0, r.u)(t, "genre") ? t.genre : void 0,
            minimumAge: (0, r.u)(t, "minimumAge") ? t.minimumAge : void 0,
            ageRecommendationDisplayName: (0, r.u)(t, "ageRecommendationDisplayName") ? t.ageRecommendationDisplayName : void 0
        }
    }

    function p(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, r.u)(t, "id") ? t.id : void 0,
            upVotes: (0, r.u)(t, "upVotes") ? t.upVotes : void 0,
            downVotes: (0, r.u)(t, "downVotes") ? t.downVotes : void 0
        }
    }

    function h(e) {
        var t, n;
        return null == (t = e) ? t : {
            id: (0, r.u)(t, "id") ? t.id : void 0,
            maxPlayers: (0, r.u)(t, "maxPlayers") ? t.maxPlayers : void 0,
            playing: (0, r.u)(t, "playing") ? t.playing : void 0,
            playerTokens: (0, r.u)(t, "playerTokens") ? t.playerTokens : void 0,
            players: (0, r.u)(t, "players") ? t.players.map(a) : void 0,
            fps: (0, r.u)(t, "fps") ? t.fps : void 0,
            ping: (0, r.u)(t, "ping") ? t.ping : void 0,
            name: (0, r.u)(t, "name") ? t.name : void 0,
            vipServerId: (0, r.u)(t, "vipServerId") ? t.vipServerId : void 0,
            accessCode: (0, r.u)(t, "accessCode") ? t.accessCode : void 0,
            owner: (0, r.u)(t, "owner") ? null == (n = t.owner) ? n : {
                hasVerifiedBadge: (0, r.u)(n, "hasVerifiedBadge") ? n.hasVerifiedBadge : void 0,
                id: (0, r.u)(n, "id") ? n.id : void 0,
                name: (0, r.u)(n, "name") ? n.name : void 0,
                displayName: (0, r.u)(n, "displayName") ? n.displayName : void 0
            } : void 0
        }
    }

    function m(e) {
        var t;
        return null == (t = e) ? t : {
            active: (0, r.u)(t, "active") ? t.active : void 0,
            universeId: (0, r.u)(t, "universeId") ? t.universeId : void 0,
            placeId: (0, r.u)(t, "placeId") ? t.placeId : void 0,
            name: (0, r.u)(t, "name") ? t.name : void 0,
            ownerId: (0, r.u)(t, "ownerId") ? t.ownerId : void 0,
            ownerName: (0, r.u)(t, "ownerName") ? t.ownerName : void 0,
            priceInRobux: (0, r.u)(t, "priceInRobux") ? t.priceInRobux : void 0,
            privateServerId: (0, r.u)(t, "privateServerId") ? t.privateServerId : void 0,
            expirationDate: (0, r.u)(t, "expirationDate") ? new Date(t.expirationDate) : void 0,
            willRenew: (0, r.u)(t, "willRenew") ? t.willRenew : void 0,
            universeName: (0, r.u)(t, "universeName") ? t.universeName : void 0
        }
    }

    function f(e) {
        var t;
        return null == (t = e) ? t : {
            placeId: (0, r.u)(t, "placeId") ? t.placeId : void 0,
            name: (0, r.u)(t, "name") ? t.name : void 0,
            description: (0, r.u)(t, "description") ? t.description : void 0,
            sourceName: (0, r.u)(t, "sourceName") ? t.sourceName : void 0,
            sourceDescription: (0, r.u)(t, "sourceDescription") ? t.sourceDescription : void 0,
            url: (0, r.u)(t, "url") ? t.url : void 0,
            builder: (0, r.u)(t, "builder") ? t.builder : void 0,
            builderId: (0, r.u)(t, "builderId") ? t.builderId : void 0,
            hasVerifiedBadge: (0, r.u)(t, "hasVerifiedBadge") ? t.hasVerifiedBadge : void 0,
            isPlayable: (0, r.u)(t, "isPlayable") ? t.isPlayable : void 0,
            reasonProhibited: (0, r.u)(t, "reasonProhibited") ? t.reasonProhibited : void 0,
            universeId: (0, r.u)(t, "universeId") ? t.universeId : void 0,
            universeRootPlaceId: (0, r.u)(t, "universeRootPlaceId") ? t.universeRootPlaceId : void 0,
            price: (0, r.u)(t, "price") ? t.price : void 0,
            imageToken: (0, r.u)(t, "imageToken") ? t.imageToken : void 0,
            fiatPurchaseData: (0, r.u)(t, "fiatPurchaseData") ? v(t.fiatPurchaseData) : void 0
        }
    }

    function w(e) {
        var t;
        return null == (t = e) ? t : {
            playabilityStatus: (0, r.u)(t, "playabilityStatus") ? t.playabilityStatus : void 0,
            isPlayable: (0, r.u)(t, "isPlayable") ? t.isPlayable : void 0,
            universeId: (0, r.u)(t, "universeId") ? t.universeId : void 0,
            unplayableDisplayText: (0, r.u)(t, "unplayableDisplayText") ? t.unplayableDisplayText : void 0
        }
    }

    function I(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, r.u)(t, "id") ? t.id : void 0,
            name: (0, r.u)(t, "name") ? t.name : void 0,
            displayName: (0, r.u)(t, "displayName") ? t.displayName : void 0
        }
    }

    function y(e, t) {
        return null == e ? e : {
            clanAllowed: (0, r.u)(e, "clanAllowed") ? e.clanAllowed : void 0,
            enemyClanId: (0, r.u)(e, "enemyClanId") ? e.enemyClanId : void 0,
            friendsAllowed: (0, r.u)(e, "friendsAllowed") ? e.friendsAllowed : void 0,
            users: (0, r.u)(e, "users") ? e.users.map(I) : void 0
        }
    }

    function g(e, t) {
        return null == e ? e : {
            active: (0, r.u)(e, "active") ? e.active : void 0,
            expired: (0, r.u)(e, "expired") ? e.expired : void 0,
            expirationDate: (0, r.u)(e, "expirationDate") ? new Date(e.expirationDate) : void 0,
            price: (0, r.u)(e, "price") ? e.price : void 0,
            canRenew: (0, r.u)(e, "canRenew") ? e.canRenew : void 0,
            hasInsufficientFunds: (0, r.u)(e, "hasInsufficientFunds") ? e.hasInsufficientFunds : void 0,
            hasRecurringProfile: (0, r.u)(e, "hasRecurringProfile") ? e.hasRecurringProfile : void 0,
            hasPriceChanged: (0, r.u)(e, "hasPriceChanged") ? e.hasPriceChanged : void 0
        }
    }

    function P(e, t) {
        return null == e ? e : {
            enabled: (0, r.u)(e, "enabled") ? e.enabled : void 0
        }
    }

    function G(e, t) {
        var n, i;
        return null == e ? e : {
            id: (0, r.u)(e, "id") ? e.id : void 0,
            name: (0, r.u)(e, "name") ? e.name : void 0,
            game: (0, r.u)(e, "game") ? null == (n = e.game) ? n : {
                id: (0, r.u)(n, "id") ? n.id : void 0,
                name: (0, r.u)(n, "name") ? n.name : void 0,
                rootPlace: (0, r.u)(n, "rootPlace") ? null == (i = n.rootPlace) ? i : {
                    id: (0, r.u)(i, "id") ? i.id : void 0,
                    name: (0, r.u)(i, "name") ? i.name : void 0
                } : void 0
            } : void 0,
            joinCode: (0, r.u)(e, "joinCode") ? e.joinCode : void 0,
            active: (0, r.u)(e, "active") ? e.active : void 0,
            subscription: (0, r.u)(e, "subscription") ? g(e.subscription) : void 0,
            permissions: (0, r.u)(e, "permissions") ? y(e.permissions) : void 0,
            voiceSettings: (0, r.u)(e, "voiceSettings") ? P(e.voiceSettings) : void 0,
            link: (0, r.u)(e, "link") ? e.link : void 0
        }
    }(function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        n(t, e), t.prototype.v1GamesUniverseIdFavoritesCountGetRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var n, i, a;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new r.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1GamesUniverseIdFavoritesCountGet.");
                            return n = {}, i = {}, [4, this.request({
                                path: "/v1/games/{universeId}/favorites/count".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/games/{universeId}/favorites/count",
                                method: "GET",
                                headers: i,
                                query: n
                            }, t)];
                        case 1:
                            return a = s.sent(), [2, new r.H(a, function(e) {
                                return null == e ? e : {
                                    favoritesCount: (0, r.u)(e, "favoritesCount") ? e.favoritesCount : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1GamesUniverseIdFavoritesCountGet = function(e, r) {
            return i(this, void 0, void 0, function() {
                return s(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1GamesUniverseIdFavoritesCountGetRaw(e, r)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, t.prototype.v1GamesUniverseIdFavoritesGetRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var n, i, a;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new r.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1GamesUniverseIdFavoritesGet.");
                            return n = {}, i = {}, [4, this.request({
                                path: "/v1/games/{universeId}/favorites".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/games/{universeId}/favorites",
                                method: "GET",
                                headers: i,
                                query: n
                            }, t)];
                        case 1:
                            return a = s.sent(), [2, new r.H(a, function(e) {
                                return null == e ? e : {
                                    isFavorited: (0, r.u)(e, "isFavorited") ? e.isFavorited : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1GamesUniverseIdFavoritesGet = function(e, r) {
            return i(this, void 0, void 0, function() {
                return s(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1GamesUniverseIdFavoritesGetRaw(e, r)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, t.prototype.v1GamesUniverseIdFavoritesPostRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var n, i, a;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new r.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1GamesUniverseIdFavoritesPost.");
                            if (null === e.request || void 0 === e.request) throw new r.w("request", "Required parameter requestParameters.request was null or undefined when calling v1GamesUniverseIdFavoritesPost.");
                            return n = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/games/{universeId}/favorites".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/games/{universeId}/favorites",
                                method: "POST",
                                headers: i,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        isFavorited: e.isFavorited
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return a = s.sent(), [2, new r.H(a)]
                    }
                })
            })
        }, t.prototype.v1GamesUniverseIdFavoritesPost = function(e, r) {
            return i(this, void 0, void 0, function() {
                return s(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1GamesUniverseIdFavoritesPostRaw(e, r)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }
    })(r._),
    function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        n(t, e), t.prototype.v1GamesPlaceIdPrivateServersGetRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var n, i, a;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.placeId || void 0 === e.placeId) throw new r.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling v1GamesPlaceIdPrivateServersGet.");
                            return n = {}, void 0 !== e.limit && (n.limit = e.limit), void 0 !== e.cursor && (n.cursor = e.cursor), void 0 !== e.sortOrder && (n.sortOrder = e.sortOrder), i = {}, [4, this.request({
                                path: "/v1/games/{placeId}/private-servers".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                schemaPath: "/v1/games/{placeId}/private-servers",
                                method: "GET",
                                headers: i,
                                query: n
                            }, t)];
                        case 1:
                            return a = s.sent(), [2, new r.H(a, function(e) {
                                return null == e ? e : {
                                    gameJoinRestricted: (0, r.u)(e, "gameJoinRestricted") ? e.gameJoinRestricted : void 0,
                                    previousPageCursor: (0, r.u)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                    nextPageCursor: (0, r.u)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                    data: (0, r.u)(e, "data") ? e.data.map(h) : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1GamesPlaceIdPrivateServersGet = function(e, r) {
            return i(this, void 0, void 0, function() {
                return s(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1GamesPlaceIdPrivateServersGetRaw(e, r)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }, t.prototype.v1GamesPlaceIdServersServerTypeGetRaw = function(e, t) {
            return i(this, void 0, void 0, function() {
                var n, i, a;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.placeId || void 0 === e.placeId) throw new r.w("placeId", "Required parameter requestParameters.placeId was null or undefined when calling v1GamesPlaceIdServersServerTypeGet.");
                            if (null === e.serverType || void 0 === e.serverType) throw new r.w("serverType", "Required parameter requestParameters.serverType was null or undefined when calling v1GamesPlaceIdServersServerTypeGet.");
                            return n = {}, void 0 !== e.sortOrder && (n.sortOrder = e.sortOrder), void 0 !== e.excludeFullGames && (n.excludeFullGames = e.excludeFullGames), void 0 !== e.limit && (n.limit = e.limit), void 0 !== e.cursor && (n.cursor = e.cursor), i = {}, [4, this.request({
                                path: "/v1/games/{placeId}/servers/{serverType}".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))).replace("{".concat("serverType", "}"), encodeURIComponent(String(e.serverType))),
                                schemaPath: "/v1/games/{placeId}/servers/{serverType}",
                                method: "GET",
                                headers: i,
                                query: n
                            }, t)];
                        case 1:
                            return a = s.sent(), [2, new r.H(a, function(e) {
                                return null == e ? e : {
                                    previousPageCursor: (0, r.u)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                    nextPageCursor: (0, r.u)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                    data: (0, r.u)(e, "data") ? e.data.map(h) : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1GamesPlaceIdServersServerTypeGet = function(e, r) {
            return i(this, void 0, void 0, function() {
                return s(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.v1GamesPlaceIdServersServerTypeGetRaw(e, r)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }
    }(r._);
    var R = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return n(t, e), t.prototype.v1GamesGamesProductInfoGetRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeIds || void 0 === e.universeIds) throw new r.w("universeIds", "Required parameter requestParameters.universeIds was null or undefined when calling v1GamesGamesProductInfoGet.");
                                return n = {}, e.universeIds && (n.universeIds = e.universeIds.join(r.G.csv)), i = {}, [4, this.request({
                                    path: "/v1/games/games-product-info",
                                    schemaPath: "/v1/games/games-product-info",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.H(a, function(e) {
                                    return null == e ? e : {
                                        data: (0, r.u)(e, "data") ? e.data.map(c) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1GamesGamesProductInfoGet = function(e, r) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GamesGamesProductInfoGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.v1GamesGetRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeIds || void 0 === e.universeIds) throw new r.w("universeIds", "Required parameter requestParameters.universeIds was null or undefined when calling v1GamesGet.");
                                return n = {}, e.universeIds && (n.universeIds = e.universeIds.join(r.G.csv)), i = {}, [4, this.request({
                                    path: "/v1/games",
                                    schemaPath: "/v1/games",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.H(a, function(e) {
                                    return null == e ? e : {
                                        data: (0, r.u)(e, "data") ? e.data.map(u) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1GamesGet = function(e, r) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GamesGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.v1GamesMultigetPlaceDetailsGetRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.placeIds || void 0 === e.placeIds) throw new r.w("placeIds", "Required parameter requestParameters.placeIds was null or undefined when calling v1GamesMultigetPlaceDetailsGet.");
                                return n = {}, e.placeIds && (n.placeIds = e.placeIds), i = {}, [4, this.request({
                                    path: "/v1/games/multiget-place-details",
                                    schemaPath: "/v1/games/multiget-place-details",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.H(a, function(e) {
                                    return e.map(f)
                                })]
                        }
                    })
                })
            }, t.prototype.v1GamesMultigetPlaceDetailsGet = function(e, r) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GamesMultigetPlaceDetailsGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.v1GamesMultigetPlayabilityStatusGetRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeIds || void 0 === e.universeIds) throw new r.w("universeIds", "Required parameter requestParameters.universeIds was null or undefined when calling v1GamesMultigetPlayabilityStatusGet.");
                                return n = {}, e.universeIds && (n.universeIds = e.universeIds.join(r.G.csv)), i = {}, [4, this.request({
                                    path: "/v1/games/multiget-playability-status",
                                    schemaPath: "/v1/games/multiget-playability-status",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.H(a, function(e) {
                                    return e.map(w)
                                })]
                        }
                    })
                })
            }, t.prototype.v1GamesMultigetPlayabilityStatusGet = function(e, r) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GamesMultigetPlayabilityStatusGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.v1GamesRecommendationsGameUniverseIdGetRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new r.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1GamesRecommendationsGameUniverseIdGet.");
                                if (null === e.paginationKey || void 0 === e.paginationKey) throw new r.w("paginationKey", "Required parameter requestParameters.paginationKey was null or undefined when calling v1GamesRecommendationsGameUniverseIdGet.");
                                if (null === e.maxRows || void 0 === e.maxRows) throw new r.w("maxRows", "Required parameter requestParameters.maxRows was null or undefined when calling v1GamesRecommendationsGameUniverseIdGet.");
                                if (null === e.isTruncatedResultsEnabled || void 0 === e.isTruncatedResultsEnabled) throw new r.w("isTruncatedResultsEnabled", "Required parameter requestParameters.isTruncatedResultsEnabled was null or undefined when calling v1GamesRecommendationsGameUniverseIdGet.");
                                return n = {}, void 0 !== e.paginationKey && (n.PaginationKey = e.paginationKey), void 0 !== e.maxRows && (n.MaxRows = e.maxRows), void 0 !== e.isTruncatedResultsEnabled && (n.IsTruncatedResultsEnabled = e.isTruncatedResultsEnabled), i = {}, [4, this.request({
                                    path: "/v1/games/recommendations/game/{universeId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/games/recommendations/game/{universeId}",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.H(a, function(e) {
                                    return null == e ? e : {
                                        games: (0, r.u)(e, "games") ? e.games.map(l) : void 0,
                                        nextPaginationKey: (0, r.u)(e, "nextPaginationKey") ? e.nextPaginationKey : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1GamesRecommendationsGameUniverseIdGet = function(e, r) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GamesRecommendationsGameUniverseIdGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.v1GamesUniverseIdIconGetRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new r.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1GamesUniverseIdIconGet.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/games/{universeId}/icon".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/games/{universeId}/icon",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.H(a, function(e) {
                                    return null == e ? e : {
                                        imageId: (0, r.u)(e, "imageId") ? e.imageId : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1GamesUniverseIdIconGet = function(e, r) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GamesUniverseIdIconGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.v1GamesUniverseIdMediaGetRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new r.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1GamesUniverseIdMediaGet.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/games/{universeId}/media".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/games/{universeId}/media",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.H(a, function(e) {
                                    return null == e ? e : {
                                        data: (0, r.u)(e, "data") ? e.data.map(d) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1GamesUniverseIdMediaGet = function(e, r) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GamesUniverseIdMediaGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t
        }(r._),
        b = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return n(t, e), t.prototype.v1GamesUniverseIdSocialLinksListGetRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new r.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1GamesUniverseIdSocialLinksListGet.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/games/{universeId}/social-links/list".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/games/{universeId}/social-links/list",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.H(a, function(e) {
                                    return null == e ? e : {
                                        data: (0, r.u)(e, "data") ? e.data.map(o) : void 0,
                                        socialLinksVerificationStatus: (0, r.u)(e, "socialLinksVerificationStatus") ? e.socialLinksVerificationStatus : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1GamesUniverseIdSocialLinksListGet = function(e, r) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GamesUniverseIdSocialLinksListGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t
        }(r._),
        q = (function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            n(t, e), t.prototype.v1GamesVipServersUniverseIdPostRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new r.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1GamesVipServersUniverseIdPost.");
                                if (null === e.requestBody || void 0 === e.requestBody) throw new r.w("requestBody", "Required parameter requestParameters.requestBody was null or undefined when calling v1GamesVipServersUniverseIdPost.");
                                return n = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/games/vip-servers/{universeId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/games/vip-servers/{universeId}",
                                    method: "POST",
                                    headers: i,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            name: e.name,
                                            expectedPrice: e.expectedPrice,
                                            isPurchaseConfirmed: e.isPurchaseConfirmed
                                        }
                                    }(e.requestBody)
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.H(a, function(e) {
                                    return h(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1GamesVipServersUniverseIdPost = function(e, r) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GamesVipServersUniverseIdPostRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.v1PrivateServersEnabledInUniverseUniverseIdGetRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new r.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1PrivateServersEnabledInUniverseUniverseIdGet.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/private-servers/enabled-in-universe/{universeId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/private-servers/enabled-in-universe/{universeId}",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.H(a, function(e) {
                                    return null == e ? e : {
                                        privateServersEnabled: (0, r.u)(e, "privateServersEnabled") ? e.privateServersEnabled : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1PrivateServersEnabledInUniverseUniverseIdGet = function(e, r) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1PrivateServersEnabledInUniverseUniverseIdGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.v1PrivateServersGetRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.privateServerIds || void 0 === e.privateServerIds) throw new r.w("privateServerIds", "Required parameter requestParameters.privateServerIds was null or undefined when calling v1PrivateServersGet.");
                                return n = {}, e.privateServerIds && (n.privateServerIds = e.privateServerIds.join(r.G.csv)), i = {}, [4, this.request({
                                    path: "/v1/private-servers",
                                    schemaPath: "/v1/private-servers",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.H(a, function(e) {
                                    return null == e ? e : {
                                        privateServerResponses: (0, r.u)(e, "privateServerResponses") ? e.privateServerResponses.map(h) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1PrivateServersGet = function(e, r) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1PrivateServersGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.v1PrivateServersMyPrivateServersGetRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return n = {}, void 0 !== e.privateServersTab && (n.privateServersTab = e.privateServersTab), void 0 !== e.itemsPerPage && (n.itemsPerPage = e.itemsPerPage), void 0 !== e.cursor && (n.cursor = e.cursor), i = {}, [4, this.request({
                                    path: "/v1/private-servers/my-private-servers",
                                    schemaPath: "/v1/private-servers/my-private-servers",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.H(a, function(e) {
                                    return null == e ? e : {
                                        nextPageCursor: (0, r.u)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                        previousPageCursor: (0, r.u)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                        data: (0, r.u)(e, "data") ? e.data.map(m) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1PrivateServersMyPrivateServersGet = function() {
                return i(this, arguments, void 0, function(e, r) {
                    return void 0 === e && (e = {}), s(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1PrivateServersMyPrivateServersGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.v1VipServerCanInviteUserIdGetRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new r.w("userId", "Required parameter requestParameters.userId was null or undefined when calling v1VipServerCanInviteUserIdGet.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/vip-server/can-invite/{userId}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/vip-server/can-invite/{userId}",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.H(a, function(e) {
                                    return null == e ? e : {
                                        canInvite: (0, r.u)(e, "canInvite") ? e.canInvite : void 0,
                                        doesOwnerPrivacyRestrictJoins: (0, r.u)(e, "doesOwnerPrivacyRestrictJoins") ? e.doesOwnerPrivacyRestrictJoins : void 0,
                                        inviteResponseType: (0, r.u)(e, "inviteResponseType") ? e.inviteResponseType : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1VipServerCanInviteUserIdGet = function(e, r) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1VipServerCanInviteUserIdGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.v1VipServersIdGetRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new r.w("id", "Required parameter requestParameters.id was null or undefined when calling v1VipServersIdGet.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/vip-servers/{id}".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/vip-servers/{id}",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.H(a, function(e) {
                                    return G(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1VipServersIdGet = function(e, r) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1VipServersIdGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.v1VipServersIdPatchRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new r.w("id", "Required parameter requestParameters.id was null or undefined when calling v1VipServersIdPatch.");
                                if (null === e.request || void 0 === e.request) throw new r.w("request", "Required parameter requestParameters.request was null or undefined when calling v1VipServersIdPatch.");
                                return n = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/vip-servers/{id}".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/vip-servers/{id}",
                                    method: "PATCH",
                                    headers: i,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            name: e.name,
                                            newJoinCode: e.newJoinCode,
                                            active: e.active
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.H(a, function(e) {
                                    return G(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1VipServersIdPatch = function(e, r) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1VipServersIdPatchRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.v1VipServersIdPermissionsPatchRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new r.w("id", "Required parameter requestParameters.id was null or undefined when calling v1VipServersIdPermissionsPatch.");
                                if (null === e.request || void 0 === e.request) throw new r.w("request", "Required parameter requestParameters.request was null or undefined when calling v1VipServersIdPermissionsPatch.");
                                return n = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/vip-servers/{id}/permissions".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/vip-servers/{id}/permissions",
                                    method: "PATCH",
                                    headers: i,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            clanAllowed: e.clanAllowed,
                                            enemyClanId: e.enemyClanId,
                                            friendsAllowed: e.friendsAllowed,
                                            usersToAdd: e.usersToAdd,
                                            usersToRemove: e.usersToRemove
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.H(a, function(e) {
                                    return y(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1VipServersIdPermissionsPatch = function(e, r) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1VipServersIdPermissionsPatchRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.v1VipServersIdSubscriptionPatchRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new r.w("id", "Required parameter requestParameters.id was null or undefined when calling v1VipServersIdSubscriptionPatch.");
                                if (null === e.request || void 0 === e.request) throw new r.w("request", "Required parameter requestParameters.request was null or undefined when calling v1VipServersIdSubscriptionPatch.");
                                return n = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/vip-servers/{id}/subscription".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/vip-servers/{id}/subscription",
                                    method: "PATCH",
                                    headers: i,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            active: e.active,
                                            price: e.price
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.H(a, function(e) {
                                    return g(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1VipServersIdSubscriptionPatch = function(e, r) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1VipServersIdSubscriptionPatchRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.v1VipServersIdVoicesettingsPatchRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new r.w("id", "Required parameter requestParameters.id was null or undefined when calling v1VipServersIdVoicesettingsPatch.");
                                if (null === e.request || void 0 === e.request) throw new r.w("request", "Required parameter requestParameters.request was null or undefined when calling v1VipServersIdVoicesettingsPatch.");
                                return n = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/vip-servers/{id}/voicesettings".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/vip-servers/{id}/voicesettings",
                                    method: "PATCH",
                                    headers: i,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            enabled: e.enabled
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.H(a, function(e) {
                                    return P(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1VipServersIdVoicesettingsPatch = function(e, r) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1VipServersIdVoicesettingsPatchRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }
        }(r._), function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return n(t, e), t.prototype.v1GamesUniverseIdUserVotesPatchRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new r.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1GamesUniverseIdUserVotesPatch.");
                                if (null === e.requestBody || void 0 === e.requestBody) throw new r.w("requestBody", "Required parameter requestParameters.requestBody was null or undefined when calling v1GamesUniverseIdUserVotesPatch.");
                                return n = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/games/{universeId}/user-votes".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/games/{universeId}/user-votes",
                                    method: "PATCH",
                                    headers: i,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            vote: e.vote
                                        }
                                    }(e.requestBody)
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.H(a)]
                        }
                    })
                })
            }, t.prototype.v1GamesUniverseIdUserVotesPatch = function(e, r) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GamesUniverseIdUserVotesPatchRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.v1GamesUniverseIdVotesGetRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new r.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1GamesUniverseIdVotesGet.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/games/{universeId}/votes".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/games/{universeId}/votes",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.H(a, function(e) {
                                    return p(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1GamesUniverseIdVotesGet = function(e, r) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GamesUniverseIdVotesGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.v1GamesUniverseIdVotesUserGetRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new r.w("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1GamesUniverseIdVotesUserGet.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/games/{universeId}/votes/user".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/games/{universeId}/votes/user",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.H(a, function(e) {
                                    return null == e ? e : {
                                        canVote: (0, r.u)(e, "canVote") ? e.canVote : void 0,
                                        userVote: (0, r.u)(e, "userVote") ? e.userVote : void 0,
                                        reasonForNotVoteable: (0, r.u)(e, "reasonForNotVoteable") ? e.reasonForNotVoteable : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1GamesUniverseIdVotesUserGet = function(e, r) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GamesUniverseIdVotesUserGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.v1GamesVotesGetRaw = function(e, t) {
                return i(this, void 0, void 0, function() {
                    var n, i, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeIds || void 0 === e.universeIds) throw new r.w("universeIds", "Required parameter requestParameters.universeIds was null or undefined when calling v1GamesVotesGet.");
                                return n = {}, e.universeIds && (n.universeIds = e.universeIds.join(r.G.csv)), i = {}, [4, this.request({
                                    path: "/v1/games/votes",
                                    schemaPath: "/v1/games/votes",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.H(a, function(e) {
                                    return null == e ? e : {
                                        data: (0, r.u)(e, "data") ? e.data.map(p) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1GamesVotesGet = function(e, r) {
                return i(this, void 0, void 0, function() {
                    return s(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.v1GamesVotesGetRaw(e, r)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t
        }(r._));
    e.s(["o", 0, R, "z", 0, {
        Facebook: "Facebook",
        Twitter: "Twitter",
        YouTube: "YouTube",
        Twitch: "Twitch",
        GooglePlus: "GooglePlus",
        Discord: "Discord",
        RobloxGroup: "RobloxGroup",
        Amazon: "Amazon"
    }, "O", 0, b, "u", 0, q], 73927);
    let S = (0, e.i(272593).f)("games", "bedev1"),
        T = new R(S),
        U = new b(S),
        V = new q(S);
    e.s(["f", 0, {
        async getDetails(e) {
            let r = [];
            for (let t = 0; t < e.length; t += 50) r.push(e.slice(t, t + 50));
            return {
                data: (await Promise.all(r.map(e => T.v1GamesGet({
                    universeIds: e
                })))).flatMap(e => {
                    var r;
                    return null != (r = e.data) ? r : []
                })
            }
        },
        async getSocialLinks(e) {
            var r, t, n;
            let i = await U.v1GamesUniverseIdSocialLinksListGet({
                universeId: e
            });
            return {
                ...i,
                socialLinksVerificationStatus: Number(null != (r = i.socialLinksVerificationStatus) ? r : 0),
                data: null != (t = null == (n = i.data) ? void 0 : n.filter(e => ![e.id, e.title, e.type, e.url].includes(void 0)).map(e => ({
                    linkId: e.id,
                    title: e.title,
                    url: e.url,
                    linkType: e.type
                }))) ? t : []
            }
        },
        getGameMedia: e => T.v1GamesUniverseIdMediaGet({
            universeId: e
        }),
        multigetPlaceDetails: e => T.v1GamesMultigetPlaceDetailsGet({
            placeIds: e
        }),
        multigetGameVotes: e => V.v1GamesVotesGet({
            universeIds: e
        }),
        getGameRecommendations: (e, r) => T.v1GamesRecommendationsGameUniverseIdGet({
            universeId: e,
            paginationKey: null != r ? r : "",
            maxRows: 18,
            isTruncatedResultsEnabled: !1
        })
    }], 392782)
}]);

//# debugId=1dc182da-8c62-2128-01ad-b9ab7e619390
//# sourceMappingURL=35w-t3htxxocy.js.map