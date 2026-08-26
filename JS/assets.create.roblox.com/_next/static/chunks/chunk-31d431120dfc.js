;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "7e7ee0a5-69f2-e20e-610b-46078e12c26f")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 392782, 311701, e => {
    "use strict";
    var r = e.i(677753),
        t = function(e, r) {
            return (t = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, r) {
                e.__proto__ = r
            } || function(e, r) {
                for (var t in r) Object.prototype.hasOwnProperty.call(r, t) && (e[t] = r[t])
            })(e, r)
        };

    function i(e, r) {
        if ("function" != typeof r && null !== r) throw TypeError("Class extends value " + String(r) + " is not a constructor or null");

        function i() {
            this.constructor = e
        }
        t(e, r), e.prototype = null === r ? Object.create(r) : (i.prototype = r.prototype, new i)
    }

    function n(e, r, t, i) {
        return new(t || (t = Promise))(function(n, s) {
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
                var r;
                e.done ? n(e.value) : ((r = e.value) instanceof t ? r : new t(function(e) {
                    e(r)
                })).then(a, o)
            }
            u((i = i.apply(e, r || [])).next())
        })
    }

    function s(e, r) {
        var t, i, n, s = {
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
                if (t) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, d[0] && (s = 0)), s;) try {
                    if (t = 1, i && (n = 2 & d[0] ? i.return : d[0] ? i.throw || ((n = i.return) && n.call(i), 0) : i.next) && !(n = n.call(i, d[1])).done) return n;
                    switch (i = 0, n && (d = [2 & d[0], n.value]), d[0]) {
                        case 0:
                        case 1:
                            n = d;
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
                            if (!(n = (n = s.trys).length > 0 && n[n.length - 1]) && (6 === d[0] || 2 === d[0])) {
                                s = 0;
                                continue
                            }
                            if (3 === d[0] && (!n || d[1] > n[0] && d[1] < n[3])) {
                                s.label = d[1];
                                break
                            }
                            if (6 === d[0] && s.label < n[1]) {
                                s.label = n[1], n = d;
                                break
                            }
                            if (n && s.label < n[2]) {
                                s.label = n[2], s.ops.push(d);
                                break
                            }
                            n[2] && s.ops.pop(), s.trys.pop();
                            continue
                    }
                    d = r.call(e, s)
                } catch (e) {
                    d = [6, e], i = 0
                } finally {
                    t = n = 0
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
            playerToken: (0, r.exists)(t, "playerToken") ? t.playerToken : void 0,
            id: (0, r.exists)(t, "id") ? t.id : void 0,
            name: (0, r.exists)(t, "name") ? t.name : void 0,
            displayName: (0, r.exists)(t, "displayName") ? t.displayName : void 0
        }
    }

    function o(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, r.exists)(t, "id") ? t.id : void 0,
            title: (0, r.exists)(t, "title") ? t.title : void 0,
            url: (0, r.exists)(t, "url") ? t.url : void 0,
            type: (0, r.exists)(t, "type") ? t.type : void 0
        }
    }

    function u(e) {
        var t, i, n;
        return null == (t = e) ? t : {
            id: (0, r.exists)(t, "id") ? t.id : void 0,
            rootPlaceId: (0, r.exists)(t, "rootPlaceId") ? t.rootPlaceId : void 0,
            name: (0, r.exists)(t, "name") ? t.name : void 0,
            description: (0, r.exists)(t, "description") ? t.description : void 0,
            sourceName: (0, r.exists)(t, "sourceName") ? t.sourceName : void 0,
            sourceDescription: (0, r.exists)(t, "sourceDescription") ? t.sourceDescription : void 0,
            creator: (0, r.exists)(t, "creator") ? null == (i = t.creator) ? i : {
                id: (0, r.exists)(i, "id") ? i.id : void 0,
                name: (0, r.exists)(i, "name") ? i.name : void 0,
                type: (0, r.exists)(i, "type") ? i.type : void 0,
                isRNVAccount: (0, r.exists)(i, "isRNVAccount") ? i.isRNVAccount : void 0,
                hasVerifiedBadge: (0, r.exists)(i, "hasVerifiedBadge") ? i.hasVerifiedBadge : void 0
            } : void 0,
            price: (0, r.exists)(t, "price") ? t.price : void 0,
            allowedGearGenres: (0, r.exists)(t, "allowedGearGenres") ? t.allowedGearGenres : void 0,
            allowedGearCategories: (0, r.exists)(t, "allowedGearCategories") ? t.allowedGearCategories : void 0,
            isGenreEnforced: (0, r.exists)(t, "isGenreEnforced") ? t.isGenreEnforced : void 0,
            copyingAllowed: (0, r.exists)(t, "copyingAllowed") ? t.copyingAllowed : void 0,
            playing: (0, r.exists)(t, "playing") ? t.playing : void 0,
            visits: (0, r.exists)(t, "visits") ? t.visits : void 0,
            maxPlayers: (0, r.exists)(t, "maxPlayers") ? t.maxPlayers : void 0,
            created: (0, r.exists)(t, "created") ? new Date(t.created) : void 0,
            updated: (0, r.exists)(t, "updated") ? new Date(t.updated) : void 0,
            studioAccessToApisAllowed: (0, r.exists)(t, "studioAccessToApisAllowed") ? t.studioAccessToApisAllowed : void 0,
            createVipServersAllowed: (0, r.exists)(t, "createVipServersAllowed") ? t.createVipServersAllowed : void 0,
            universeAvatarType: (0, r.exists)(t, "universeAvatarType") ? t.universeAvatarType : void 0,
            genre: (0, r.exists)(t, "genre") ? t.genre : void 0,
            genreL1: (0, r.exists)(t, "genre_l1") ? t.genre_l1 : void 0,
            genreL2: (0, r.exists)(t, "genre_l2") ? t.genre_l2 : void 0,
            isAllGenre: (0, r.exists)(t, "isAllGenre") ? t.isAllGenre : void 0,
            isFavoritedByUser: (0, r.exists)(t, "isFavoritedByUser") ? t.isFavoritedByUser : void 0,
            favoritedCount: (0, r.exists)(t, "favoritedCount") ? t.favoritedCount : void 0,
            licenseDescription: (0, r.exists)(t, "licenseDescription") ? t.licenseDescription : void 0,
            refundLink: (0, r.exists)(t, "refundLink") ? t.refundLink : void 0,
            localizedFiatPrice: (0, r.exists)(t, "localizedFiatPrice") ? t.localizedFiatPrice : void 0,
            refundPolicy: (0, r.exists)(t, "refundPolicy") ? null == (n = t.refundPolicy) ? n : {
                policyText: (0, r.exists)(n, "policyText") ? n.policyText : void 0,
                learnMoreBaseUrl: (0, r.exists)(n, "learnMoreBaseUrl") ? n.learnMoreBaseUrl : void 0,
                locale: (0, r.exists)(n, "locale") ? n.locale : void 0,
                articleId: (0, r.exists)(n, "articleId") ? n.articleId : void 0
            } : void 0
        }
    }

    function d(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, r.exists)(t, "id") ? t.id : void 0,
            assetTypeId: (0, r.exists)(t, "assetTypeId") ? t.assetTypeId : void 0,
            assetType: (0, r.exists)(t, "assetType") ? t.assetType : void 0,
            imageId: (0, r.exists)(t, "imageId") ? t.imageId : void 0,
            videoHash: (0, r.exists)(t, "videoHash") ? t.videoHash : void 0,
            videoTitle: (0, r.exists)(t, "videoTitle") ? t.videoTitle : void 0,
            approved: (0, r.exists)(t, "approved") ? t.approved : void 0,
            altText: (0, r.exists)(t, "altText") ? t.altText : void 0
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function l(e, t) {
        return null == e ? e : {
            localizedFiatPrice: (0, r.exists)(e, "localizedFiatPrice") ? e.localizedFiatPrice : void 0,
            basePriceId: (0, r.exists)(e, "basePriceId") ? e.basePriceId : void 0
        }
    }

    function v(e) {
        var t;
        return null == (t = e) ? t : {
            universeId: (0, r.exists)(t, "universeId") ? t.universeId : void 0,
            isForSale: (0, r.exists)(t, "isForSale") ? t.isForSale : void 0,
            productId: (0, r.exists)(t, "productId") ? t.productId : void 0,
            price: (0, r.exists)(t, "price") ? t.price : void 0,
            sellerId: (0, r.exists)(t, "sellerId") ? t.sellerId : void 0,
            fiatPurchaseData: (0, r.exists)(t, "fiatPurchaseData") ? l(t.fiatPurchaseData) : void 0
        }
    }

    function c(e) {
        var t;
        return null == (t = e) ? t : {
            creatorId: (0, r.exists)(t, "creatorId") ? t.creatorId : void 0,
            creatorName: (0, r.exists)(t, "creatorName") ? t.creatorName : void 0,
            creatorType: (0, r.exists)(t, "creatorType") ? t.creatorType : void 0,
            creatorHasVerifiedBadge: (0, r.exists)(t, "creatorHasVerifiedBadge") ? t.creatorHasVerifiedBadge : void 0,
            totalUpVotes: (0, r.exists)(t, "totalUpVotes") ? t.totalUpVotes : void 0,
            totalDownVotes: (0, r.exists)(t, "totalDownVotes") ? t.totalDownVotes : void 0,
            universeId: (0, r.exists)(t, "universeId") ? t.universeId : void 0,
            name: (0, r.exists)(t, "name") ? t.name : void 0,
            placeId: (0, r.exists)(t, "placeId") ? t.placeId : void 0,
            playerCount: (0, r.exists)(t, "playerCount") ? t.playerCount : void 0,
            imageToken: (0, r.exists)(t, "imageToken") ? t.imageToken : void 0,
            isSponsored: (0, r.exists)(t, "isSponsored") ? t.isSponsored : void 0,
            nativeAdData: (0, r.exists)(t, "nativeAdData") ? t.nativeAdData : void 0,
            isShowSponsoredLabel: (0, r.exists)(t, "isShowSponsoredLabel") ? t.isShowSponsoredLabel : void 0,
            price: (0, r.exists)(t, "price") ? t.price : void 0,
            analyticsIdentifier: (0, r.exists)(t, "analyticsIdentifier") ? t.analyticsIdentifier : void 0,
            gameDescription: (0, r.exists)(t, "gameDescription") ? t.gameDescription : void 0,
            genre: (0, r.exists)(t, "genre") ? t.genre : void 0,
            minimumAge: (0, r.exists)(t, "minimumAge") ? t.minimumAge : void 0,
            ageRecommendationDisplayName: (0, r.exists)(t, "ageRecommendationDisplayName") ? t.ageRecommendationDisplayName : void 0
        }
    }

    function p(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, r.exists)(t, "id") ? t.id : void 0,
            upVotes: (0, r.exists)(t, "upVotes") ? t.upVotes : void 0,
            downVotes: (0, r.exists)(t, "downVotes") ? t.downVotes : void 0
        }
    }

    function h(e) {
        var t, i;
        return null == (t = e) ? t : {
            id: (0, r.exists)(t, "id") ? t.id : void 0,
            maxPlayers: (0, r.exists)(t, "maxPlayers") ? t.maxPlayers : void 0,
            playing: (0, r.exists)(t, "playing") ? t.playing : void 0,
            playerTokens: (0, r.exists)(t, "playerTokens") ? t.playerTokens : void 0,
            players: (0, r.exists)(t, "players") ? t.players.map(a) : void 0,
            fps: (0, r.exists)(t, "fps") ? t.fps : void 0,
            ping: (0, r.exists)(t, "ping") ? t.ping : void 0,
            name: (0, r.exists)(t, "name") ? t.name : void 0,
            vipServerId: (0, r.exists)(t, "vipServerId") ? t.vipServerId : void 0,
            accessCode: (0, r.exists)(t, "accessCode") ? t.accessCode : void 0,
            owner: (0, r.exists)(t, "owner") ? null == (i = t.owner) ? i : {
                hasVerifiedBadge: (0, r.exists)(i, "hasVerifiedBadge") ? i.hasVerifiedBadge : void 0,
                id: (0, r.exists)(i, "id") ? i.id : void 0,
                name: (0, r.exists)(i, "name") ? i.name : void 0,
                displayName: (0, r.exists)(i, "displayName") ? i.displayName : void 0
            } : void 0
        }
    }

    function m(e) {
        var t;
        return null == (t = e) ? t : {
            active: (0, r.exists)(t, "active") ? t.active : void 0,
            universeId: (0, r.exists)(t, "universeId") ? t.universeId : void 0,
            placeId: (0, r.exists)(t, "placeId") ? t.placeId : void 0,
            name: (0, r.exists)(t, "name") ? t.name : void 0,
            ownerId: (0, r.exists)(t, "ownerId") ? t.ownerId : void 0,
            ownerName: (0, r.exists)(t, "ownerName") ? t.ownerName : void 0,
            priceInRobux: (0, r.exists)(t, "priceInRobux") ? t.priceInRobux : void 0,
            privateServerId: (0, r.exists)(t, "privateServerId") ? t.privateServerId : void 0,
            expirationDate: (0, r.exists)(t, "expirationDate") ? new Date(t.expirationDate) : void 0,
            willRenew: (0, r.exists)(t, "willRenew") ? t.willRenew : void 0,
            universeName: (0, r.exists)(t, "universeName") ? t.universeName : void 0
        }
    }

    function f(e) {
        var t;
        return null == (t = e) ? t : {
            placeId: (0, r.exists)(t, "placeId") ? t.placeId : void 0,
            name: (0, r.exists)(t, "name") ? t.name : void 0,
            description: (0, r.exists)(t, "description") ? t.description : void 0,
            sourceName: (0, r.exists)(t, "sourceName") ? t.sourceName : void 0,
            sourceDescription: (0, r.exists)(t, "sourceDescription") ? t.sourceDescription : void 0,
            url: (0, r.exists)(t, "url") ? t.url : void 0,
            builder: (0, r.exists)(t, "builder") ? t.builder : void 0,
            builderId: (0, r.exists)(t, "builderId") ? t.builderId : void 0,
            hasVerifiedBadge: (0, r.exists)(t, "hasVerifiedBadge") ? t.hasVerifiedBadge : void 0,
            isPlayable: (0, r.exists)(t, "isPlayable") ? t.isPlayable : void 0,
            reasonProhibited: (0, r.exists)(t, "reasonProhibited") ? t.reasonProhibited : void 0,
            universeId: (0, r.exists)(t, "universeId") ? t.universeId : void 0,
            universeRootPlaceId: (0, r.exists)(t, "universeRootPlaceId") ? t.universeRootPlaceId : void 0,
            price: (0, r.exists)(t, "price") ? t.price : void 0,
            imageToken: (0, r.exists)(t, "imageToken") ? t.imageToken : void 0,
            fiatPurchaseData: (0, r.exists)(t, "fiatPurchaseData") ? l(t.fiatPurchaseData) : void 0
        }
    }

    function w(e) {
        var t;
        return null == (t = e) ? t : {
            playabilityStatus: (0, r.exists)(t, "playabilityStatus") ? t.playabilityStatus : void 0,
            isPlayable: (0, r.exists)(t, "isPlayable") ? t.isPlayable : void 0,
            universeId: (0, r.exists)(t, "universeId") ? t.universeId : void 0,
            unplayableDisplayText: (0, r.exists)(t, "unplayableDisplayText") ? t.unplayableDisplayText : void 0
        }
    }

    function I(e) {
        var t;
        return null == (t = e) ? t : {
            id: (0, r.exists)(t, "id") ? t.id : void 0,
            name: (0, r.exists)(t, "name") ? t.name : void 0,
            displayName: (0, r.exists)(t, "displayName") ? t.displayName : void 0
        }
    }

    function y(e, t) {
        return null == e ? e : {
            clanAllowed: (0, r.exists)(e, "clanAllowed") ? e.clanAllowed : void 0,
            enemyClanId: (0, r.exists)(e, "enemyClanId") ? e.enemyClanId : void 0,
            friendsAllowed: (0, r.exists)(e, "friendsAllowed") ? e.friendsAllowed : void 0,
            users: (0, r.exists)(e, "users") ? e.users.map(I) : void 0
        }
    }

    function g(e, t) {
        return null == e ? e : {
            active: (0, r.exists)(e, "active") ? e.active : void 0,
            expired: (0, r.exists)(e, "expired") ? e.expired : void 0,
            expirationDate: (0, r.exists)(e, "expirationDate") ? new Date(e.expirationDate) : void 0,
            price: (0, r.exists)(e, "price") ? e.price : void 0,
            canRenew: (0, r.exists)(e, "canRenew") ? e.canRenew : void 0,
            hasInsufficientFunds: (0, r.exists)(e, "hasInsufficientFunds") ? e.hasInsufficientFunds : void 0,
            hasRecurringProfile: (0, r.exists)(e, "hasRecurringProfile") ? e.hasRecurringProfile : void 0,
            hasPriceChanged: (0, r.exists)(e, "hasPriceChanged") ? e.hasPriceChanged : void 0
        }
    }

    function x(e, t) {
        return null == e ? e : {
            enabled: (0, r.exists)(e, "enabled") ? e.enabled : void 0
        }
    }

    function P(e, t) {
        var i, n;
        return null == e ? e : {
            id: (0, r.exists)(e, "id") ? e.id : void 0,
            name: (0, r.exists)(e, "name") ? e.name : void 0,
            game: (0, r.exists)(e, "game") ? null == (i = e.game) ? i : {
                id: (0, r.exists)(i, "id") ? i.id : void 0,
                name: (0, r.exists)(i, "name") ? i.name : void 0,
                rootPlace: (0, r.exists)(i, "rootPlace") ? null == (n = i.rootPlace) ? n : {
                    id: (0, r.exists)(n, "id") ? n.id : void 0,
                    name: (0, r.exists)(n, "name") ? n.name : void 0
                } : void 0
            } : void 0,
            joinCode: (0, r.exists)(e, "joinCode") ? e.joinCode : void 0,
            active: (0, r.exists)(e, "active") ? e.active : void 0,
            subscription: (0, r.exists)(e, "subscription") ? g(e.subscription) : void 0,
            permissions: (0, r.exists)(e, "permissions") ? y(e.permissions) : void 0,
            voiceSettings: (0, r.exists)(e, "voiceSettings") ? x(e.voiceSettings) : void 0,
            link: (0, r.exists)(e, "link") ? e.link : void 0
        }
    }(function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        i(t, e), t.prototype.v1GamesUniverseIdFavoritesCountGetRaw = function(e, t) {
            return n(this, void 0, void 0, function() {
                var i, n, a;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new r.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1GamesUniverseIdFavoritesCountGet.");
                            return i = {}, n = {}, [4, this.request({
                                path: "/v1/games/{universeId}/favorites/count".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/games/{universeId}/favorites/count",
                                method: "GET",
                                headers: n,
                                query: i
                            }, t)];
                        case 1:
                            return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    favoritesCount: (0, r.exists)(e, "favoritesCount") ? e.favoritesCount : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1GamesUniverseIdFavoritesCountGet = function(e, r) {
            return n(this, void 0, void 0, function() {
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
            return n(this, void 0, void 0, function() {
                var i, n, a;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new r.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1GamesUniverseIdFavoritesGet.");
                            return i = {}, n = {}, [4, this.request({
                                path: "/v1/games/{universeId}/favorites".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/games/{universeId}/favorites",
                                method: "GET",
                                headers: n,
                                query: i
                            }, t)];
                        case 1:
                            return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    isFavorited: (0, r.exists)(e, "isFavorited") ? e.isFavorited : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1GamesUniverseIdFavoritesGet = function(e, r) {
            return n(this, void 0, void 0, function() {
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
            return n(this, void 0, void 0, function() {
                var i, n, a;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new r.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1GamesUniverseIdFavoritesPost.");
                            if (null === e.request || void 0 === e.request) throw new r.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1GamesUniverseIdFavoritesPost.");
                            return i = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/games/{universeId}/favorites".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/games/{universeId}/favorites",
                                method: "POST",
                                headers: n,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        isFavorited: e.isFavorited
                                    }
                                }(e.request)
                            }, t)];
                        case 1:
                            return a = s.sent(), [2, new r.JSONApiResponse(a)]
                    }
                })
            })
        }, t.prototype.v1GamesUniverseIdFavoritesPost = function(e, r) {
            return n(this, void 0, void 0, function() {
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
    })(r.BaseAPI),
    function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        i(t, e), t.prototype.v1GamesPlaceIdPrivateServersGetRaw = function(e, t) {
            return n(this, void 0, void 0, function() {
                var i, n, a;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.placeId || void 0 === e.placeId) throw new r.RequiredError("placeId", "Required parameter requestParameters.placeId was null or undefined when calling v1GamesPlaceIdPrivateServersGet.");
                            return i = {}, void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.sortOrder && (i.sortOrder = e.sortOrder), n = {}, [4, this.request({
                                path: "/v1/games/{placeId}/private-servers".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))),
                                schemaPath: "/v1/games/{placeId}/private-servers",
                                method: "GET",
                                headers: n,
                                query: i
                            }, t)];
                        case 1:
                            return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    gameJoinRestricted: (0, r.exists)(e, "gameJoinRestricted") ? e.gameJoinRestricted : void 0,
                                    previousPageCursor: (0, r.exists)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                    nextPageCursor: (0, r.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                    data: (0, r.exists)(e, "data") ? e.data.map(h) : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1GamesPlaceIdPrivateServersGet = function(e, r) {
            return n(this, void 0, void 0, function() {
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
            return n(this, void 0, void 0, function() {
                var i, n, a;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.placeId || void 0 === e.placeId) throw new r.RequiredError("placeId", "Required parameter requestParameters.placeId was null or undefined when calling v1GamesPlaceIdServersServerTypeGet.");
                            if (null === e.serverType || void 0 === e.serverType) throw new r.RequiredError("serverType", "Required parameter requestParameters.serverType was null or undefined when calling v1GamesPlaceIdServersServerTypeGet.");
                            return i = {}, void 0 !== e.sortOrder && (i.sortOrder = e.sortOrder), void 0 !== e.excludeFullGames && (i.excludeFullGames = e.excludeFullGames), void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.cursor && (i.cursor = e.cursor), n = {}, [4, this.request({
                                path: "/v1/games/{placeId}/servers/{serverType}".replace("{".concat("placeId", "}"), encodeURIComponent(String(e.placeId))).replace("{".concat("serverType", "}"), encodeURIComponent(String(e.serverType))),
                                schemaPath: "/v1/games/{placeId}/servers/{serverType}",
                                method: "GET",
                                headers: n,
                                query: i
                            }, t)];
                        case 1:
                            return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    previousPageCursor: (0, r.exists)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                    nextPageCursor: (0, r.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                    data: (0, r.exists)(e, "data") ? e.data.map(h) : void 0
                                }
                            })]
                    }
                })
            })
        }, t.prototype.v1GamesPlaceIdServersServerTypeGet = function(e, r) {
            return n(this, void 0, void 0, function() {
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
    }(r.BaseAPI);
    var R = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(t, e), t.prototype.v1GamesGamesProductInfoGetRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var i, n, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeIds || void 0 === e.universeIds) throw new r.RequiredError("universeIds", "Required parameter requestParameters.universeIds was null or undefined when calling v1GamesGamesProductInfoGet.");
                                return i = {}, e.universeIds && (i.universeIds = e.universeIds.join(r.COLLECTION_FORMATS.csv)), n = {}, [4, this.request({
                                    path: "/v1/games/games-product-info",
                                    schemaPath: "/v1/games/games-product-info",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        data: (0, r.exists)(e, "data") ? e.data.map(v) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1GamesGamesProductInfoGet = function(e, r) {
                return n(this, void 0, void 0, function() {
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
                return n(this, void 0, void 0, function() {
                    var i, n, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeIds || void 0 === e.universeIds) throw new r.RequiredError("universeIds", "Required parameter requestParameters.universeIds was null or undefined when calling v1GamesGet.");
                                return i = {}, e.universeIds && (i.universeIds = e.universeIds.join(r.COLLECTION_FORMATS.csv)), n = {}, [4, this.request({
                                    path: "/v1/games",
                                    schemaPath: "/v1/games",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        data: (0, r.exists)(e, "data") ? e.data.map(u) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1GamesGet = function(e, r) {
                return n(this, void 0, void 0, function() {
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
                return n(this, void 0, void 0, function() {
                    var i, n, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.placeIds || void 0 === e.placeIds) throw new r.RequiredError("placeIds", "Required parameter requestParameters.placeIds was null or undefined when calling v1GamesMultigetPlaceDetailsGet.");
                                return i = {}, e.placeIds && (i.placeIds = e.placeIds), n = {}, [4, this.request({
                                    path: "/v1/games/multiget-place-details",
                                    schemaPath: "/v1/games/multiget-place-details",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                    return e.map(f)
                                })]
                        }
                    })
                })
            }, t.prototype.v1GamesMultigetPlaceDetailsGet = function(e, r) {
                return n(this, void 0, void 0, function() {
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
                return n(this, void 0, void 0, function() {
                    var i, n, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeIds || void 0 === e.universeIds) throw new r.RequiredError("universeIds", "Required parameter requestParameters.universeIds was null or undefined when calling v1GamesMultigetPlayabilityStatusGet.");
                                return i = {}, e.universeIds && (i.universeIds = e.universeIds.join(r.COLLECTION_FORMATS.csv)), n = {}, [4, this.request({
                                    path: "/v1/games/multiget-playability-status",
                                    schemaPath: "/v1/games/multiget-playability-status",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                    return e.map(w)
                                })]
                        }
                    })
                })
            }, t.prototype.v1GamesMultigetPlayabilityStatusGet = function(e, r) {
                return n(this, void 0, void 0, function() {
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
                return n(this, void 0, void 0, function() {
                    var i, n, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new r.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1GamesRecommendationsGameUniverseIdGet.");
                                if (null === e.paginationKey || void 0 === e.paginationKey) throw new r.RequiredError("paginationKey", "Required parameter requestParameters.paginationKey was null or undefined when calling v1GamesRecommendationsGameUniverseIdGet.");
                                if (null === e.maxRows || void 0 === e.maxRows) throw new r.RequiredError("maxRows", "Required parameter requestParameters.maxRows was null or undefined when calling v1GamesRecommendationsGameUniverseIdGet.");
                                if (null === e.isTruncatedResultsEnabled || void 0 === e.isTruncatedResultsEnabled) throw new r.RequiredError("isTruncatedResultsEnabled", "Required parameter requestParameters.isTruncatedResultsEnabled was null or undefined when calling v1GamesRecommendationsGameUniverseIdGet.");
                                return i = {}, void 0 !== e.paginationKey && (i.PaginationKey = e.paginationKey), void 0 !== e.maxRows && (i.MaxRows = e.maxRows), void 0 !== e.isTruncatedResultsEnabled && (i.IsTruncatedResultsEnabled = e.isTruncatedResultsEnabled), n = {}, [4, this.request({
                                    path: "/v1/games/recommendations/game/{universeId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/games/recommendations/game/{universeId}",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        games: (0, r.exists)(e, "games") ? e.games.map(c) : void 0,
                                        nextPaginationKey: (0, r.exists)(e, "nextPaginationKey") ? e.nextPaginationKey : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1GamesRecommendationsGameUniverseIdGet = function(e, r) {
                return n(this, void 0, void 0, function() {
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
                return n(this, void 0, void 0, function() {
                    var i, n, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new r.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1GamesUniverseIdIconGet.");
                                return i = {}, n = {}, [4, this.request({
                                    path: "/v1/games/{universeId}/icon".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/games/{universeId}/icon",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        imageId: (0, r.exists)(e, "imageId") ? e.imageId : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1GamesUniverseIdIconGet = function(e, r) {
                return n(this, void 0, void 0, function() {
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
                return n(this, void 0, void 0, function() {
                    var i, n, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new r.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1GamesUniverseIdMediaGet.");
                                return i = {}, n = {}, [4, this.request({
                                    path: "/v1/games/{universeId}/media".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/games/{universeId}/media",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        data: (0, r.exists)(e, "data") ? e.data.map(d) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1GamesUniverseIdMediaGet = function(e, r) {
                return n(this, void 0, void 0, function() {
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
        }(r.BaseAPI),
        b = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(t, e), t.prototype.v1GamesUniverseIdSocialLinksListGetRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var i, n, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new r.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1GamesUniverseIdSocialLinksListGet.");
                                return i = {}, n = {}, [4, this.request({
                                    path: "/v1/games/{universeId}/social-links/list".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/games/{universeId}/social-links/list",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        data: (0, r.exists)(e, "data") ? e.data.map(o) : void 0,
                                        socialLinksVerificationStatus: (0, r.exists)(e, "socialLinksVerificationStatus") ? e.socialLinksVerificationStatus : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1GamesUniverseIdSocialLinksListGet = function(e, r) {
                return n(this, void 0, void 0, function() {
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
        }(r.BaseAPI),
        G = (function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            i(t, e), t.prototype.v1GamesVipServersUniverseIdPostRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var i, n, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new r.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1GamesVipServersUniverseIdPost.");
                                if (null === e.requestBody || void 0 === e.requestBody) throw new r.RequiredError("requestBody", "Required parameter requestParameters.requestBody was null or undefined when calling v1GamesVipServersUniverseIdPost.");
                                return i = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/games/vip-servers/{universeId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/games/vip-servers/{universeId}",
                                    method: "POST",
                                    headers: n,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            name: e.name,
                                            expectedPrice: e.expectedPrice,
                                            isPurchaseConfirmed: e.isPurchaseConfirmed
                                        }
                                    }(e.requestBody)
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                    return h(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1GamesVipServersUniverseIdPost = function(e, r) {
                return n(this, void 0, void 0, function() {
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
                return n(this, void 0, void 0, function() {
                    var i, n, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new r.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1PrivateServersEnabledInUniverseUniverseIdGet.");
                                return i = {}, n = {}, [4, this.request({
                                    path: "/v1/private-servers/enabled-in-universe/{universeId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/private-servers/enabled-in-universe/{universeId}",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        privateServersEnabled: (0, r.exists)(e, "privateServersEnabled") ? e.privateServersEnabled : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1PrivateServersEnabledInUniverseUniverseIdGet = function(e, r) {
                return n(this, void 0, void 0, function() {
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
                return n(this, void 0, void 0, function() {
                    var i, n, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.privateServerIds || void 0 === e.privateServerIds) throw new r.RequiredError("privateServerIds", "Required parameter requestParameters.privateServerIds was null or undefined when calling v1PrivateServersGet.");
                                return i = {}, e.privateServerIds && (i.privateServerIds = e.privateServerIds.join(r.COLLECTION_FORMATS.csv)), n = {}, [4, this.request({
                                    path: "/v1/private-servers",
                                    schemaPath: "/v1/private-servers",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        privateServerResponses: (0, r.exists)(e, "privateServerResponses") ? e.privateServerResponses.map(h) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1PrivateServersGet = function(e, r) {
                return n(this, void 0, void 0, function() {
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
                return n(this, void 0, void 0, function() {
                    var i, n, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return i = {}, void 0 !== e.privateServersTab && (i.privateServersTab = e.privateServersTab), void 0 !== e.itemsPerPage && (i.itemsPerPage = e.itemsPerPage), void 0 !== e.cursor && (i.cursor = e.cursor), n = {}, [4, this.request({
                                    path: "/v1/private-servers/my-private-servers",
                                    schemaPath: "/v1/private-servers/my-private-servers",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        nextPageCursor: (0, r.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                        previousPageCursor: (0, r.exists)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                        data: (0, r.exists)(e, "data") ? e.data.map(m) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1PrivateServersMyPrivateServersGet = function() {
                return n(this, arguments, void 0, function(e, r) {
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
                return n(this, void 0, void 0, function() {
                    var i, n, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new r.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1VipServerCanInviteUserIdGet.");
                                return i = {}, n = {}, [4, this.request({
                                    path: "/v1/vip-server/can-invite/{userId}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/vip-server/can-invite/{userId}",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        canInvite: (0, r.exists)(e, "canInvite") ? e.canInvite : void 0,
                                        doesOwnerPrivacyRestrictJoins: (0, r.exists)(e, "doesOwnerPrivacyRestrictJoins") ? e.doesOwnerPrivacyRestrictJoins : void 0,
                                        inviteResponseType: (0, r.exists)(e, "inviteResponseType") ? e.inviteResponseType : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1VipServerCanInviteUserIdGet = function(e, r) {
                return n(this, void 0, void 0, function() {
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
                return n(this, void 0, void 0, function() {
                    var i, n, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new r.RequiredError("id", "Required parameter requestParameters.id was null or undefined when calling v1VipServersIdGet.");
                                return i = {}, n = {}, [4, this.request({
                                    path: "/v1/vip-servers/{id}".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/vip-servers/{id}",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                    return P(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1VipServersIdGet = function(e, r) {
                return n(this, void 0, void 0, function() {
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
                return n(this, void 0, void 0, function() {
                    var i, n, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new r.RequiredError("id", "Required parameter requestParameters.id was null or undefined when calling v1VipServersIdPatch.");
                                if (null === e.request || void 0 === e.request) throw new r.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1VipServersIdPatch.");
                                return i = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/vip-servers/{id}".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/vip-servers/{id}",
                                    method: "PATCH",
                                    headers: n,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            name: e.name,
                                            newJoinCode: e.newJoinCode,
                                            active: e.active
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                    return P(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1VipServersIdPatch = function(e, r) {
                return n(this, void 0, void 0, function() {
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
                return n(this, void 0, void 0, function() {
                    var i, n, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new r.RequiredError("id", "Required parameter requestParameters.id was null or undefined when calling v1VipServersIdPermissionsPatch.");
                                if (null === e.request || void 0 === e.request) throw new r.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1VipServersIdPermissionsPatch.");
                                return i = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/vip-servers/{id}/permissions".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/vip-servers/{id}/permissions",
                                    method: "PATCH",
                                    headers: n,
                                    query: i,
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
                                return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                    return y(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1VipServersIdPermissionsPatch = function(e, r) {
                return n(this, void 0, void 0, function() {
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
                return n(this, void 0, void 0, function() {
                    var i, n, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new r.RequiredError("id", "Required parameter requestParameters.id was null or undefined when calling v1VipServersIdSubscriptionPatch.");
                                if (null === e.request || void 0 === e.request) throw new r.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1VipServersIdSubscriptionPatch.");
                                return i = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/vip-servers/{id}/subscription".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/vip-servers/{id}/subscription",
                                    method: "PATCH",
                                    headers: n,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            active: e.active,
                                            price: e.price
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                    return g(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1VipServersIdSubscriptionPatch = function(e, r) {
                return n(this, void 0, void 0, function() {
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
                return n(this, void 0, void 0, function() {
                    var i, n, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new r.RequiredError("id", "Required parameter requestParameters.id was null or undefined when calling v1VipServersIdVoicesettingsPatch.");
                                if (null === e.request || void 0 === e.request) throw new r.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1VipServersIdVoicesettingsPatch.");
                                return i = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/vip-servers/{id}/voicesettings".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/vip-servers/{id}/voicesettings",
                                    method: "PATCH",
                                    headers: n,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            enabled: e.enabled
                                        }
                                    }(e.request)
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                    return x(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1VipServersIdVoicesettingsPatch = function(e, r) {
                return n(this, void 0, void 0, function() {
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
        }(r.BaseAPI), function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(t, e), t.prototype.v1GamesUniverseIdUserVotesPatchRaw = function(e, t) {
                return n(this, void 0, void 0, function() {
                    var i, n, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new r.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1GamesUniverseIdUserVotesPatch.");
                                if (null === e.requestBody || void 0 === e.requestBody) throw new r.RequiredError("requestBody", "Required parameter requestParameters.requestBody was null or undefined when calling v1GamesUniverseIdUserVotesPatch.");
                                return i = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/games/{universeId}/user-votes".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/games/{universeId}/user-votes",
                                    method: "PATCH",
                                    headers: n,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            vote: e.vote
                                        }
                                    }(e.requestBody)
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.JSONApiResponse(a)]
                        }
                    })
                })
            }, t.prototype.v1GamesUniverseIdUserVotesPatch = function(e, r) {
                return n(this, void 0, void 0, function() {
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
                return n(this, void 0, void 0, function() {
                    var i, n, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new r.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1GamesUniverseIdVotesGet.");
                                return i = {}, n = {}, [4, this.request({
                                    path: "/v1/games/{universeId}/votes".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/games/{universeId}/votes",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                    return p(e)
                                })]
                        }
                    })
                })
            }, t.prototype.v1GamesUniverseIdVotesGet = function(e, r) {
                return n(this, void 0, void 0, function() {
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
                return n(this, void 0, void 0, function() {
                    var i, n, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new r.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling v1GamesUniverseIdVotesUserGet.");
                                return i = {}, n = {}, [4, this.request({
                                    path: "/v1/games/{universeId}/votes/user".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/games/{universeId}/votes/user",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        canVote: (0, r.exists)(e, "canVote") ? e.canVote : void 0,
                                        userVote: (0, r.exists)(e, "userVote") ? e.userVote : void 0,
                                        reasonForNotVoteable: (0, r.exists)(e, "reasonForNotVoteable") ? e.reasonForNotVoteable : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1GamesUniverseIdVotesUserGet = function(e, r) {
                return n(this, void 0, void 0, function() {
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
                return n(this, void 0, void 0, function() {
                    var i, n, a;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeIds || void 0 === e.universeIds) throw new r.RequiredError("universeIds", "Required parameter requestParameters.universeIds was null or undefined when calling v1GamesVotesGet.");
                                return i = {}, e.universeIds && (i.universeIds = e.universeIds.join(r.COLLECTION_FORMATS.csv)), n = {}, [4, this.request({
                                    path: "/v1/games/votes",
                                    schemaPath: "/v1/games/votes",
                                    method: "GET",
                                    headers: n,
                                    query: i
                                }, t)];
                            case 1:
                                return a = s.sent(), [2, new r.JSONApiResponse(a, function(e) {
                                    return null == e ? e : {
                                        data: (0, r.exists)(e, "data") ? e.data.map(p) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.v1GamesVotesGet = function(e, r) {
                return n(this, void 0, void 0, function() {
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
        }(r.BaseAPI));
    e.s(["GamesApi", 0, R, "RobloxGamesApiSocialLinkResponseTypeEnum", 0, {
        Facebook: "Facebook",
        Twitter: "Twitter",
        YouTube: "YouTube",
        Twitch: "Twitch",
        GooglePlus: "GooglePlus",
        Discord: "Discord",
        RobloxGroup: "RobloxGroup",
        Amazon: "Amazon"
    }, "SocialLinksApi", 0, b, "VotesApi", 0, G], 311701);
    let S = (0, e.i(272593).createClientConfiguration)("games", "bedev1"),
        q = new R(S),
        C = new b(S),
        T = new G(S);
    e.s(["default", 0, {
        getDetails: e => q.v1GamesGet({
            universeIds: e
        }),
        async getSocialLinks(e) {
            var r, t, i;
            let n = await C.v1GamesUniverseIdSocialLinksListGet({
                universeId: e
            });
            return {
                ...n,
                socialLinksVerificationStatus: Number(null != (r = n.socialLinksVerificationStatus) ? r : 0),
                data: null != (t = null == (i = n.data) ? void 0 : i.filter(e => ![e.id, e.title, e.type, e.url].includes(void 0)).map(e => ({
                    linkId: e.id,
                    title: e.title,
                    url: e.url,
                    linkType: e.type
                }))) ? t : []
            }
        },
        getGameMedia: e => q.v1GamesUniverseIdMediaGet({
            universeId: e
        }),
        multigetPlaceDetails: e => q.v1GamesMultigetPlaceDetailsGet({
            placeIds: e
        }),
        multigetGameVotes: e => T.v1GamesVotesGet({
            universeIds: e
        }),
        getGameRecommendations: (e, r) => q.v1GamesRecommendationsGameUniverseIdGet({
            universeId: e,
            paginationKey: null != r ? r : "",
            maxRows: 18,
            isTruncatedResultsEnabled: !1
        })
    }], 392782)
}, 447055, 469596, e => {
    "use strict";
    var r = e.i(221628),
        t = (0, e.i(751498).c)((0, r.jsx)("path", {
            d: "M19 6.41 17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"
        }), "Close");
    e.s(["C", 0, t], 469596), e.s(["CloseIcon", 0, t], 447055)
}, 963343, e => {
    "use strict";
    let r, t, i, n, s, a;
    var o = e.i(569384),
        u = e.i(273589),
        d = e.i(962560),
        l = e.i(416340),
        v = e.i(42569),
        c = e.i(270673),
        p = e.i(696180),
        h = e.i(221628),
        m = e.i(963320),
        f = e.i(571709);

    function w() {
        let e = (0, o._)(["\n  0% {\n    left: -35%;\n    right: 100%;\n  }\n\n  60% {\n    left: 100%;\n    right: -90%;\n  }\n\n  100% {\n    left: 100%;\n    right: -90%;\n  }\n"]);
        return w = function() {
            return e
        }, e
    }

    function I() {
        let e = (0, o._)(["\n  0% {\n    left: -200%;\n    right: 100%;\n  }\n\n  60% {\n    left: 107%;\n    right: -8%;\n  }\n\n  100% {\n    left: 107%;\n    right: -8%;\n  }\n"]);
        return I = function() {
            return e
        }, e
    }

    function y() {
        let e = (0, o._)(["\n  0% {\n    opacity: 1;\n    background-position: 0 -23px;\n  }\n\n  60% {\n    opacity: 0;\n    background-position: 0 -23px;\n  }\n\n  100% {\n    opacity: 1;\n    background-position: -200px -23px;\n  }\n"]);
        return y = function() {
            return e
        }, e
    }

    function g() {
        let e = (0, o._)(["\n    animation: ", " 3s infinite linear;\n  "]);
        return g = function() {
            return e
        }, e
    }

    function x() {
        let e = (0, o._)(["\n      width: auto;\n      animation: ", " 2.1s cubic-bezier(0.65, 0.815, 0.735, 0.395) infinite;\n    "]);
        return x = function() {
            return e
        }, e
    }

    function P() {
        let e = (0, o._)(["\n      width: auto;\n      animation: ", " 2.1s cubic-bezier(0.165, 0.84, 0.44, 1) 1.15s infinite;\n    "]);
        return P = function() {
            return e
        }, e
    }

    function R(e) {
        return (0, u.g)("MuiLinearProgress", e)
    }(0, p.g)("MuiLinearProgress", ["root", "colorPrimary", "colorSecondary", "determinate", "indeterminate", "buffer", "query", "dashed", "dashedColorPrimary", "dashedColorSecondary", "bar", "barColorPrimary", "barColorSecondary", "bar1Indeterminate", "bar1Determinate", "bar1Buffer", "bar2Indeterminate", "bar2Buffer"]);
    let b = ["className", "color", "value", "valueBuffer", "variant"],
        G = (0, f.keyframes)(r || (r = w())),
        S = (0, f.keyframes)(t || (t = I())),
        q = (0, f.keyframes)(i || (i = y())),
        C = (e, r) => "inherit" === r ? "currentColor" : e.vars ? e.vars.palette.LinearProgress["".concat(r, "Bg")] : "light" === e.palette.mode ? (0, u.l)(e.palette[r].main, .62) : (0, u.j)(e.palette[r].main, .5),
        T = (0, v.s)("span", {
            name: "MuiLinearProgress",
            slot: "Root",
            overridesResolver: (e, r) => {
                let {
                    ownerState: t
                } = e;
                return [r.root, r["color".concat((0, u.a)(t.color))], r[t.variant]]
            }
        })(e => {
            let {
                ownerState: r,
                theme: t
            } = e;
            return (0, d._)({
                position: "relative",
                overflow: "hidden",
                display: "block",
                height: 4,
                zIndex: 0,
                "@media print": {
                    colorAdjust: "exact"
                },
                backgroundColor: C(t, r.color)
            }, "inherit" === r.color && "buffer" !== r.variant && {
                backgroundColor: "none",
                "&::before": {
                    content: '""',
                    position: "absolute",
                    left: 0,
                    top: 0,
                    right: 0,
                    bottom: 0,
                    backgroundColor: "currentColor",
                    opacity: .3
                }
            }, "buffer" === r.variant && {
                backgroundColor: "transparent"
            }, "query" === r.variant && {
                transform: "rotate(180deg)"
            })
        }),
        U = (0, v.s)("span", {
            name: "MuiLinearProgress",
            slot: "Dashed",
            overridesResolver: (e, r) => {
                let {
                    ownerState: t
                } = e;
                return [r.dashed, r["dashedColor".concat((0, u.a)(t.color))]]
            }
        })(e => {
            let {
                ownerState: r,
                theme: t
            } = e, i = C(t, r.color);
            return (0, d._)({
                position: "absolute",
                marginTop: 0,
                height: "100%",
                width: "100%"
            }, "inherit" === r.color && {
                opacity: .3
            }, {
                backgroundImage: "radial-gradient(".concat(i, " 0%, ").concat(i, " 16%, transparent 42%)"),
                backgroundSize: "10px 10px",
                backgroundPosition: "0 -23px"
            })
        }, (0, f.css)(n || (n = g()), q)),
        A = (0, v.s)("span", {
            name: "MuiLinearProgress",
            slot: "Bar1",
            overridesResolver: (e, r) => {
                let {
                    ownerState: t
                } = e;
                return [r.bar, r["barColor".concat((0, u.a)(t.color))], ("indeterminate" === t.variant || "query" === t.variant) && r.bar1Indeterminate, "determinate" === t.variant && r.bar1Determinate, "buffer" === t.variant && r.bar1Buffer]
            }
        })(e => {
            let {
                ownerState: r,
                theme: t
            } = e;
            return (0, d._)({
                width: "100%",
                position: "absolute",
                left: 0,
                bottom: 0,
                top: 0,
                transition: "transform 0.2s linear",
                transformOrigin: "left",
                backgroundColor: "inherit" === r.color ? "currentColor" : (t.vars || t).palette[r.color].main
            }, "determinate" === r.variant && {
                transition: "transform .4s linear"
            }, "buffer" === r.variant && {
                zIndex: 1,
                transition: "transform .4s linear"
            })
        }, e => {
            let {
                ownerState: r
            } = e;
            return ("indeterminate" === r.variant || "query" === r.variant) && (0, f.css)(s || (s = x()), G)
        }),
        V = (0, v.s)("span", {
            name: "MuiLinearProgress",
            slot: "Bar2",
            overridesResolver: (e, r) => {
                let {
                    ownerState: t
                } = e;
                return [r.bar, r["barColor".concat((0, u.a)(t.color))], ("indeterminate" === t.variant || "query" === t.variant) && r.bar2Indeterminate, "buffer" === t.variant && r.bar2Buffer]
            }
        })(e => {
            let {
                ownerState: r,
                theme: t
            } = e;
            return (0, d._)({
                width: "100%",
                position: "absolute",
                left: 0,
                bottom: 0,
                top: 0,
                transition: "transform 0.2s linear",
                transformOrigin: "left"
            }, "buffer" !== r.variant && {
                backgroundColor: "inherit" === r.color ? "currentColor" : (t.vars || t).palette[r.color].main
            }, "inherit" === r.color && {
                opacity: .3
            }, "buffer" === r.variant && {
                backgroundColor: C(t, r.color),
                transition: "transform .4s linear"
            })
        }, e => {
            let {
                ownerState: r
            } = e;
            return ("indeterminate" === r.variant || "query" === r.variant) && (0, f.css)(a || (a = P()), S)
        }),
        E = l.forwardRef(function(e, r) {
            let t = (0, m.u)({
                    props: e,
                    name: "MuiLinearProgress"
                }),
                {
                    className: i,
                    color: n = "primary",
                    value: s,
                    valueBuffer: a,
                    variant: o = "indeterminate"
                } = t,
                l = (0, u._)(t, b),
                p = (0, d._)({}, t, {
                    color: n,
                    variant: o
                }),
                f = (e => {
                    let {
                        classes: r,
                        variant: t,
                        color: i
                    } = e, n = {
                        root: ["root", "color".concat((0, u.a)(i)), t],
                        dashed: ["dashed", "dashedColor".concat((0, u.a)(i))],
                        bar1: ["bar", "barColor".concat((0, u.a)(i)), ("indeterminate" === t || "query" === t) && "bar1Indeterminate", "determinate" === t && "bar1Determinate", "buffer" === t && "bar1Buffer"],
                        bar2: ["bar", "buffer" !== t && "barColor".concat((0, u.a)(i)), "buffer" === t && "color".concat((0, u.a)(i)), ("indeterminate" === t || "query" === t) && "bar2Indeterminate", "buffer" === t && "bar2Buffer"]
                    };
                    return (0, v.a)(n, R, r)
                })(p),
                w = (0, c.u)(),
                I = {},
                y = {},
                g = {};
            if (("determinate" === o || "buffer" === o) && void 0 !== s) {
                I["aria-valuenow"] = Math.round(s), I["aria-valuemin"] = 0, I["aria-valuemax"] = 100;
                let e = s - 100;
                w && (e = -e), y.transform = "translateX(".concat(e, "%)")
            }
            if ("buffer" === o && void 0 !== a) {
                let e = (a || 0) - 100;
                w && (e = -e), g.transform = "translateX(".concat(e, "%)")
            }
            return (0, h.jsxs)(T, (0, d._)({
                className: (0, v.c)(f.root, i),
                ownerState: p,
                role: "progressbar"
            }, I, {
                ref: r
            }, l, {
                children: ["buffer" === o ? (0, h.jsx)(U, {
                    className: f.dashed,
                    ownerState: p
                }) : null, (0, h.jsx)(A, {
                    className: f.bar1,
                    ownerState: p,
                    style: y
                }), "determinate" === o ? null : (0, h.jsx)(V, {
                    className: f.bar2,
                    ownerState: p,
                    style: g
                })]
            }))
        });
    e.s(["M", 0, E])
}, 354246, e => {
    "use strict";
    var r = e.i(833172);
    e.s(["WarningIcon", () => r.Warning])
}, 627464, e => {
    "use strict";
    var r = e.i(865800),
        t = e.i(416340),
        i = e.i(730187);
    e.i(221628), e.s(["StudioIcon", 0, function(e) {
        var n = e.ref,
            s = (0, r.a)(e, ["ref"]);
        return t.default.createElement(i.M, (0, r._)({}, s, {
            ref: n,
            viewBox: "0 0 33 33"
        }), t.default.createElement("path", {
            d: "M6.78817 0.975342L3.21606 14.3004L12.3069 16.7337L13.4424 12.4994L29.5881 16.8264L32.0247 7.73884L6.78817 0.975342Z"
        }), t.default.createElement("path", {
            d: "M18.6069 21.448L2.46124 17.1211L0.0246582 26.2119L25.2611 32.9754L28.8332 19.6504L19.7424 17.2138L18.6069 21.448Z"
        }))
    }], 627464)
}, 458451, e => {
    "use strict";
    var r = e.i(416340);
    let t = e => e;

    function i(e) {
        let i = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : t,
            n = r.default.useSyncExternalStore(e.subscribe, r.default.useCallback(() => i(e.getState()), [e, i]), r.default.useCallback(() => i(e.getInitialState()), [e, i]));
        return r.default.useDebugValue(n), n
    }
    let n = async e => {
        try {
            let r = await e.json();
            if (r.errors.length > 0) {
                let e = r.errors[0];
                if (e) return {
                    code: e.code,
                    message: e.message
                }
            }
            return null
        } catch (e) {
            return null
        }
    }, s = (0, r.createContext)({
        user: null,
        status: "initial",
        isFetched: !1,
        login: () => {
            throw Error("useRobloxAuthentication must be used within a RobloxAuthenticationProvider")
        },
        logout: () => {
            throw Error("useRobloxAuthentication must be used within a RobloxAuthenticationProvider")
        }
    });
    e.s(["RobloxAuthenticationProvider", 0, e => {
        let {
            clientId: t,
            authenticationClient: a,
            discoveryClient: o,
            usersClient: u,
            store: d,
            children: l
        } = e, [v, c] = (0, r.useState)(!1), [p, h] = (0, r.useState)("initial"), m = (0, r.useCallback)(async function() {
            let {
                redirectUri: e,
                ...r
            } = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {}, i = "string" == typeof e ? e : window.location.href.replace(/#.*$/, ""), {
                authorizationEndpoint: n
            } = await o.discoveryGetDiscoveryConfiguration(), s = new URL(n);
            s.search = new URLSearchParams({
                client_id: t,
                redirect_uri: i,
                scope: "openid",
                response_type: "none",
                prompt: "none",
                ...r
            }).toString(), window.location.assign(s.href)
        }, [t, o]), {
            user: f,
            setUser: w
        } = {
            user: i(d, e => e.user),
            setUser: i(d, e => e.setUser)
        }, I = (0, r.useCallback)(async () => {
            await a.v1LogoutPost(), null !== f && (w(null), h("logged-out"))
        }, [a, f, w]);
        (0, r.useEffect)(() => {
            (async () => {
                try {
                    h("loading");
                    let {
                        id: e,
                        name: r,
                        displayName: t
                    } = await u.v1UsersAuthenticatedGet();
                    void 0 !== e && void 0 !== r ? (w({
                        id: e,
                        name: r,
                        displayName: t
                    }), h("success")) : h("error")
                } catch (t) {
                    let e = t.response,
                        r = e ? await n(e) : null;
                    (null == r ? void 0 : r.message) === "User is moderated" ? h("moderated"): (null == r ? void 0 : r.code) === 9002 || (null == e ? void 0 : e.status) === 401 ? h("unauthenticated") : h("error")
                } finally {
                    c(!0)
                }
            })()
        }, []);
        let y = (0, r.useMemo)(() => ({
            user: f,
            isFetched: v,
            status: p,
            login: m,
            logout: I
        }), [f, v, p, m, I]);
        return r.default.createElement(s.Provider, {
            value: y
        }, l)
    }, "initializeAuthStore", 0, function() {
        var e;
        let r, t, i, n, s;
        return e = e => ({
            user: null,
            setUser: r => e({
                user: r
            })
        }), t = new Set, n = {
            setState: i = (e, i) => {
                let n = "function" == typeof e ? e(r) : e;
                if (!Object.is(n, r)) {
                    let e = r;
                    r = (null != i ? i : "object" != typeof n || null === n) ? n : Object.assign({}, r, n), t.forEach(t => t(r, e))
                }
            },
            getState: () => r,
            getInitialState: () => s,
            subscribe: e => (t.add(e), () => t.delete(e))
        }, s = r = e(i), n
    }, "useRobloxAuthentication", 0, () => (0, r.useContext)(s)])
}, 814975, e => {
    "use strict";
    var r = e.i(458451);
    e.s(["useAuthentication", () => r.useRobloxAuthentication])
}]);

//# debugId=7e7ee0a5-69f2-e20e-610b-46078e12c26f
//# sourceMappingURL=2_7k8qgws72he.js.map