! function() {
    var e = {
            2938: function(e, r, n) {
                var t = {
                    "./resources.js": 4669
                };

                function a(e) {
                    var r = i(e);
                    return n(r)
                }

                function i(e) {
                    if (!n.o(t, e)) {
                        var r = new Error("Cannot find module '" + e + "'");
                        throw r.code = "MODULE_NOT_FOUND", r
                    }
                    return t[e]
                }
                a.keys = function() {
                    return Object.keys(t)
                }, a.resolve = i, e.exports = a, a.id = 2938
            },
            8786: function(e, r, n) {
                var t = {
                    "./friendsListController.js": 3193,
                    "./peopleController.js": 6809,
                    "./peopleInfoCardController.js": 4276,
                    "./peopleListContainerController.js": 6507
                };

                function a(e) {
                    var r = i(e);
                    return n(r)
                }

                function i(e) {
                    if (!n.o(t, e)) {
                        var r = new Error("Cannot find module '" + e + "'");
                        throw r.code = "MODULE_NOT_FOUND", r
                    }
                    return t[e]
                }
                a.keys = function() {
                    return Object.keys(t)
                }, a.resolve = i, e.exports = a, a.id = 8786
            },
            2183: function(e, r, n) {
                var t = {
                    "./peopleDirective.js": 405,
                    "./peopleListContainerDirective.js": 2754,
                    "./peopleListDirective.js": 8793
                };

                function a(e) {
                    var r = i(e);
                    return n(r)
                }

                function i(e) {
                    if (!n.o(t, e)) {
                        var r = new Error("Cannot find module '" + e + "'");
                        throw r.code = "MODULE_NOT_FOUND", r
                    }
                    return t[e]
                }
                a.keys = function() {
                    return Object.keys(t)
                }, a.resolve = i, e.exports = a, a.id = 2183
            },
            8605: function(e, r, n) {
                var t = {
                    "./friendsService.js": 275,
                    "./gamesService.js": 37,
                    "./layoutService.js": 8114,
                    "./utilityService.js": 164
                };

                function a(e) {
                    var r = i(e);
                    return n(r)
                }

                function i(e) {
                    if (!n.o(t, e)) {
                        var r = new Error("Cannot find module '" + e + "'");
                        throw r.code = "MODULE_NOT_FOUND", r
                    }
                    return t[e]
                }
                a.keys = function() {
                    return Object.keys(t)
                }, a.resolve = i, e.exports = a, a.id = 8605
            },
            5098: function(e, r, n) {
                var t = {
                    "./directives/templates/people.html": 5350,
                    "./directives/templates/peopleInfoCard.html": 8160,
                    "./directives/templates/peopleList.html": 9422,
                    "./directives/templates/peopleListContainer.html": 5055
                };

                function a(e) {
                    var r = i(e);
                    return n(r)
                }

                function i(e) {
                    if (!n.o(t, e)) {
                        var r = new Error("Cannot find module '" + e + "'");
                        throw r.code = "MODULE_NOT_FOUND", r
                    }
                    return t[e]
                }
                a.keys = function() {
                    return Object.keys(t)
                }, a.resolve = i, e.exports = a, a.id = 5098
            },
            7525: function(e) {
                function r(e) {
                    return e.replace(/([a-z])([A-Z])/g, "$1-$2").toLowerCase()
                }

                function n(e) {
                    return e.split("/").pop().replace(".html", "")
                }
                var t = {
                    importFilesUnderPath: function(e) {
                        e.keys().forEach(e)
                    },
                    templateCacheGenerator: function(e, t, a, i) {
                        return e.module(t, []).run(["$templateCache", function(e) {
                            a && a.keys().forEach((function(t) {
                                var i = r(n(t));
                                e.put(i, a(t))
                            })), i && i.keys().forEach((function(t) {
                                var a = r(n(t));
                                e.put(a, i(t).replace(/<\/?script[^>]*>/gi, ""))
                            }))
                        }])
                    }
                };
                e.exports = t
            },
            4669: function(e, r, n) {
                "use strict";
                n.r(r);
                var t = n(7577),
                    a = n(1819),
                    i = {
                        templateUrls: {
                            peopleListContainer: "people-list-container",
                            peopleList: "people-list",
                            peopleInfoCard: "people-info-card",
                            people: "people"
                        },
                        apiSets: {
                            getFriendsListUrl: {
                                url: t.EnvironmentUrls ? "".concat(t.EnvironmentUrls.friendsApi, "/v1/users/{userId}/friends") : "/v1/users/{userId}/friends",
                                retryable: !0,
                                withCredentials: !0
                            },
                            getMetadataUrl: {
                                url: t.EnvironmentUrls ? "".concat(t.EnvironmentUrls.friendsApi, "/v1/metadata") : "/v1/metadata",
                                retryable: !0,
                                withCredentials: !0
                            },
                            getPresences: {
                                url: t.EnvironmentUrls ? "".concat(t.EnvironmentUrls.presenceApi, "/v1/presence/users") : "/v1/presence/users",
                                retryable: !0,
                                withCredentials: !0
                            },
                            multiGetPlaceDetails: {
                                url: t.EnvironmentUrls ? "".concat(t.EnvironmentUrls.gamesApi, "/v1/games/multiget-place-details") : "/v1/games/multiget-place-details",
                                retryable: !0,
                                withCredentials: !0
                            },
                            multiGetGameIcons: {
                                url: t.EnvironmentUrls ? "".concat(t.EnvironmentUrls.gamesApi, "/v1/games/game-thumbnails") : "/v1/games/game-thumbnails",
                                retryable: !0,
                                withCredentials: !0
                            }
                        },
                        apiParams: {
                            avatarMultiGetLimit: 100,
                            presenceMultiGetLimit: 100
                        },
                        gameIconSize: {
                            lg: {
                                width: 150,
                                height: 150
                            }
                        },
                        eventStreamParams: {
                            goToProfileFromAvatar: {
                                name: "goToProfileFromAvatar",
                                ctx: "click"
                            },
                            goToProfileInPeopleList: {
                                name: "goToProfileFromPeopleList",
                                ctx: "click"
                            },
                            openPeopleList: {
                                name: "openPeopleList",
                                ctx: "hover"
                            },
                            goToChatInPeopleList: {
                                name: "goToChatFromPeopleList",
                                ctx: "click"
                            },
                            joinGameInPeopleList: {
                                name: "joinGameInPeopleList",
                                ctx: "click"
                            },
                            goToGameDetailFromAvatar: {
                                name: "goToGameDetailFromAvatar",
                                ctx: "click"
                            },
                            goToGameDetailInPeopleList: {
                                name: "goToGameDetailInPeopleList",
                                ctx: "click"
                            },
                            gamePlayIntentInPeopleList: {
                                ctx: "peopleListInHomePage"
                            },
                            gameImpressions: {
                                name: "gameImpressions",
                                ctx: "hover"
                            },
                            sessionInfoTypes: {
                                homePageSessionInfo: "homePageSessionInfo"
                            },
                            pageContexts: {
                                peopleListInHomePage: "peopleListInHomePage"
                            }
                        },
                        hoverPopoverParams: {
                            isOpen: !1,
                            triggerSelector: "",
                            hoverPopoverSelector: "",
                            isDisabled: !!t.DeviceMeta && (!(0, t.DeviceMeta)().isDesktop || (0, t.DeviceMeta)().isUWPApp)
                        },
                        reasonProhibitedMessage: {
                            None: "None",
                            PurchaseRequired: "PurchaseRequired"
                        },
                        peopleInfoCardContainerClass: "card-with-game"
                    };
                a.A.constant("resources", i), r.default = i
            },
            3193: function(e, r, n) {
                "use strict";
                n.r(r);
                var t = n(127),
                    a = n.n(t),
                    i = n(1819);

                function s(e, r, n, t, i, s) {
                    e.clickAvatar = function(e, r) {
                        var n = i.eventStreamParams.goToProfileFromAvatar,
                            a = {
                                friendId: e.id,
                                presentStatus: e.presence.userPresenceType,
                                position: r
                            };
                        e.presence.rootPlaceId && (a.rootPlaceId = e.presence.rootPlaceId), t.sendEventWithTarget(n.name, n.ctx, a)
                    }, e.clickPlaceLink = function(e, r) {
                        var n = i.eventStreamParams.goToGameDetailFromAvatar,
                            a = {
                                friendId: e.id,
                                position: r,
                                rootPlaceId: e.presence.rootPlaceId
                            };
                        t.sendEventWithTarget(n.name, n.ctx, a)
                    }, e.updatePresenceStatus = function(r) {
                        for (var n = [], t = 0; t < r.length; t++) {
                            var i = r[t];
                            i.rootPlaceId && !e.library.placesDict[i.rootPlaceId] && n.push(i.rootPlaceId), e.updatePresenceData(i)
                        }
                        n.length > 0 && a().isFunction(e.setPlaceDetails) && e.setPlaceDetails(n)
                    }, e.listenToPresenceUpdate = function() {
                        document.addEventListener("Roblox.Presence.Update", (function(r) {
                            null != r && r.detail && s((function() {
                                e.updatePresenceStatus(r.detail)
                            }))
                        }))
                    }, e.init = function() {
                        e.listenToPresenceUpdate()
                    }, e.init()
                }
                s.$inject = ["$scope", "$log", "$document", "eventStreamService", "resources", "$timeout"], i.A.controller("friendsListController", s), r.default = s
            },
            6809: function(e, r, n) {
                "use strict";
                n.r(r);
                var t = n(127),
                    a = n.n(t),
                    i = n(1819);

                function s(e, r, n) {
                    e.setupHoverPopover = function() {
                        e.peopleInfoCardPlacement = "bottom", e.peopleInfoCardTemplateUrl = n.templateUrls.peopleInfoCard, e.peopleInfoCardContainerClass = e.friend.presence && e.friend.presence.placeUrl ? n.peopleInfoCardContainerClass : "", e.hoverPopoverParams = a().copy(n.hoverPopoverParams), e.hoverPopoverParams.triggerSelector = "#people-".concat(e.friend.id), e.hoverPopoverParams.hoverPopoverSelector = ".people-info-".concat(e.friend.id), e.hoverPopoverParams.isDisabled = e.hoverPopoverParams.isDisabled || !e.library.isForCurrentUsersFriends
                    }, e.init = function() {
                        e.setupHoverPopover()
                    }, e.init()
                }
                s.$inject = ["$scope", "$log", "resources"], i.A.controller("peopleController", s), r.default = s
            },
            4276: function(e, r, n) {
                "use strict";
                n.r(r), n.d(r, {
                    default: function() {
                        return o
                    }
                });
                var t = n(1819),
                    a = CoreUtilities,
                    i = CoreRobloxUtilities;

                function s(e, r, n, t, s, o, l, c, d) {
                    e.sendEventStream = function(r, n) {
                        n || (n = {}), n.friendId = e.friend.id, n.position = e.$index, c.sendEventWithTarget(r.name, r.ctx, n)
                    }, e.sendGamePlayEvent = function(e) {
                        c.sendGamePlayEvent(n.eventStreamParams.gamePlayIntentInPeopleList.ctx, e)
                    }, e.sendGameImpressionEvent = function(r, t, a) {
                        var s = n.eventStreamParams.pageContexts,
                            o = i.sessionStorageService.getEventTracker().homePageSessionInfo,
                            l = {
                                universeIds: JSON.stringify([r]),
                                rootPlaceIds: JSON.stringify([t]),
                                absPositions: JSON.stringify([0]),
                                sortPos: 0,
                                page: s.peopleListInHomePage,
                                homePageSessionInfo: o
                            };
                        e.sendEventStream(n.eventStreamParams.gameImpressions, l)
                    }, e.clickBtn = function(r) {
                        var a = e.friend.presence.rootPlaceId,
                            i = e.library.placesDict[a],
                            s = t.playButtons,
                            o = {
                                rootPlaceId: a
                            },
                            l = n.eventStreamParams;
                        switch (i.buttonLayout.type) {
                            case s.join.type:
                                var c = e.friend.presence.gameId,
                                    u = e.friend.id,
                                    p = d.buildPlayGameProperties(a, e.friend.presence.placeId, c, u);
                                o.gameInstanceId = c, o.friendId = e.friend.id, o.position = e.$index;
                                var f = {
                                    eventName: l.joinGameInPeopleList.name,
                                    ctx: l.joinGameInPeopleList.ctx,
                                    properties: o,
                                    gamePlayIntentEventCtx: n.eventStreamParams.gamePlayIntentInPeopleList.ctx
                                };
                                d.launchGame(p, f);
                                break;
                            case s.details.type:
                                e.goToGameDetails(r)
                        }
                    }, e.goToGameDetails = function(r) {
                        var t = n.eventStreamParams,
                            s = e.friend.presence,
                            l = s.rootPlaceId,
                            c = s.universeId,
                            d = s.userId,
                            u = t.pageContexts.peopleListInHomePage,
                            p = {
                                rootPlaceId: l,
                                fromWhere: r,
                                page: u
                            };
                        e.sendEventStream(t.goToGameDetailInPeopleList, p);
                        var f = {
                                page: u,
                                friendId: d,
                                universeId: c,
                                placeId: l,
                                position: 0,
                                homePageSessionInfo: i.sessionStorageService.getEventTracker().homePageSessionInfo
                            },
                            m = "".concat(e.friend.presence.placeUrl, "?").concat(a.urlService.composeQueryString(f));
                        o.location.href = a.urlService.getAbsoluteUrl(m)
                    }, e.goToChat = function() {
                        var r = e.friend.id;
                        e.sendEventStream(n.eventStreamParams.goToChatInPeopleList);
                        var t = s.buildPermissionVerifier({});
                        s.startChat(r, t)
                    }, e.goToProfilePage = function() {
                        e.sendEventStream(n.eventStreamParams.goToProfileInPeopleList), o.location.href = a.urlService.getAbsoluteUrl(e.friend.profileUrl)
                    }, e.init = function() {
                        e.sendEventStream(n.eventStreamParams.openPeopleList);
                        var r = e.friend.presence;
                        null != r && r.universeId && null != r && r.rootPlaceId && e.sendGameImpressionEvent(r.universeId, r.rootPlaceId, e.$index)
                    }, e.init()
                }
                s.$inject = ["$scope", "$log", "resources", "layoutService", "chatDispatchService", "$window", "gamesService", "eventStreamService", "playGameService"], t.A.controller("peopleInfoCardController", s);
                var o = s
            },
            6507: function(e, r, n) {
                "use strict";
                n.r(r), n.d(r, {
                    default: function() {
                        return u
                    }
                });
                var t = n(127),
                    a = n.n(t),
                    i = n(7577),
                    s = RobloxBadges,
                    o = RobloxUserProfiles,
                    l = n(1819),
                    c = n(4468);

                function d(e, r, n, t, l, d, u, p, f) {
                    function m() {
                        var e = (0, c.c)();
                        return !(null !== e || !i.CurrentUser) || e === i.CurrentUser.userId
                    }

                    function v() {
                        try {
                            (0, s.initRobloxBadgesFrameworkAgnostic)({
                                overrideIconClass: "verified-badge-icon-friends-carousel"
                            })
                        } catch (e) {}
                    }
                    e.setPlaceDetails = function(r) {
                        d.multiGetPlaceDetails(r).then((function(r) {
                            a().forEach(r, (function(r, n) {
                                if (r) switch (e.library.placesDict[n] = r, r.reasonProhibited) {
                                    case u.reasonProhibitedMessage.None:
                                        e.library.placesDict[n].buttonLayout = a().copy(l.playButtons.join);
                                        break;
                                    case u.reasonProhibitedMessage.PurchaseRequired:
                                        e.library.placesDict[n].requiredPurchase = !0;
                                    default:
                                        e.library.placesDict[n].buttonLayout = a().copy(l.playButtons.details)
                                }
                            }))
                        }))
                    }, e.safelyUpdatePresenceData = function(r, n) {
                        r ? (n && !n.userId && (n = {
                            lastLocation: "Website",
                            userId: r,
                            userPresenceType: 0
                        }, e.layout.invalidPresenceData = !0), n && e.updatePresenceData(n)) : e.layout.invalidPresenceData = !0
                    }, e.updatePresenceData = function(r) {
                        var n = l.presenceTypes;
                        switch (r.userPresenceType) {
                            case n.online.status:
                                r.className = l.presenceTypes.online.className;
                                break;
                            case n.ingame.status:
                                r.className = l.presenceTypes.ingame.className, r.rootPlaceId && (r.placeUrl = l.getGameDetailsPageUrl(r.rootPlaceId));
                                break;
                            case n.instudio.status:
                                r.className = l.presenceTypes.instudio.className, r.rootPlaceId && (r.placeUrl = l.getGameDetailsPageUrl(r.rootPlaceId))
                        }
                        e.library.friendsDict[r.userId] || (e.library.friendsDict[r.userId] = {}), e.library.friendsDict[r.userId].presence = r
                    }, e.buildFriendsInfo = function(r, t) {
                        t.shouldGetPresenceData ? n.getPresences(r).then((function(n) {
                            var t = [];
                            a().forEach(n, (function(n, a) {
                                var i = n.rootPlaceId;
                                i && !e.library.placesDict[i] && t.push(i), e.safelyUpdatePresenceData(r[a], n)
                            })), t.length > 0 && e.setPlaceDetails(t), e.layout.isAllFriendsDataLoaded = !0, v()
                        })) : (e.library.isForCurrentUsersFriends || r.sort((function(r, n) {
                            var t = e.library.friendsDict[r],
                                a = e.library.friendsDict[n];
                            return t.name.toLowerCase() > a.name.toLowerCase() ? 1 : -1
                        })), e.library.friendIds = r, e.layout.isAllFriendsDataLoaded = !0, v())
                    }, e.buildFriendsList = function(r) {
                        e.layout.namesLoading = !0, n.getFriendsList(r).then((function(r) {
                            var n = r.data || r,
                                t = [];
                            a().forEach(n, (function(r) {
                                var n = r.id;
                                t.indexOf(n) < 0 && t.push(n), r.profileUrl = l.getProfilePageUrl(n), r.hasVerifiedBadge = r.hasVerifiedBadge, e.library.friendsDict[n] = r
                            }));
                            var i = [o.UserProfileField.Names.CombinedName];
                            f.watchUserProfiles(t, i).subscribe((function(r) {
                                var t = r.loading,
                                    i = r.error,
                                    s = r.data;
                                e.layout.namesLoading = t, e.error = i, a().forEach(n, (function(e) {
                                    var r = e;
                                    r.nameToDisplay = s[r.id].names.combinedName
                                }))
                            })), e.buildFriendsInfo(t, {
                                shouldGetPresenceData: e.library.isForCurrentUsersFriends
                            }), e.library.numOfFriends = n.length
                        }), (function(r) {
                            e.layout.friendsError = !0, e.layout.isAllFriendsDataLoaded = !0
                        }))
                    }, e.setup = function() {
                        e.library = {
                            friendsDict: {},
                            friendIds: [],
                            isForCurrentUsersFriends: m(),
                            placesDict: {},
                            numOfFriends: null
                        }, e.layout = l
                    }, e.buildFriendsListFromSharedService = function(r) {
                        e.layout.invalidPresenceData = !1, e.layout.namesLoading = !0, e.$evalAsync((function() {
                            if (null != r && r.length) {
                                var n = [],
                                    t = [],
                                    i = 0;
                                a().forEach(r, (function(r) {
                                    var a = r.id;
                                    e.library.friendsDict[a] = r, n.push(a);
                                    var s = r.presence.rootPlaceId;
                                    s && !e.library.placesDict[s] && t.push(s), e.safelyUpdatePresenceData(r.id, r.presence), i += 1
                                })), e.library.numOfFriends = i, e.library.friendIds = n;
                                var s = [o.UserProfileField.Names.CombinedName];
                                f.watchUserProfiles(n, s).subscribe((function(n) {
                                    var t = n.loading,
                                        i = n.error,
                                        s = n.data;
                                    e.layout.namesLoading = t, e.error = i, a().forEach(r, (function(e) {
                                        var r = e;
                                        r.nameToDisplay = s[r.id].names.combinedName
                                    }))
                                })), t.length > 0 && e.setPlaceDetails(t)
                            }
                            e.layout.isAllFriendsDataLoaded = !0, v()
                        }))
                    }, e.init = function() {
                        var r;
                        e.setup();
                        var n = null !== (r = (0, c.c)()) && void 0 !== r ? r : i.CurrentUser.userId;
                        m() ? p.getFriendsPresence().then((function(r) {
                            e.buildFriendsListFromSharedService(r)
                        }), (function(r) {
                            console.debug(r), e.layout.friendsError = !0, e.layout.isAllFriendsDataLoaded = !0
                        })) : e.buildFriendsList(n)
                    }, e.init()
                }
                d.$inject = ["$scope", "$log", "friendsService", "utilityService", "layoutService", "gamesService", "resources", "usersPresenceService", "userProfilesService"], l.A.controller("peopleListContainerController", d);
                var u = d
            },
            405: function(e, r, n) {
                "use strict";
                n.r(r);
                var t = n(1819);

                function a(e) {
                    return {
                        restrict: "A",
                        scope: !0,
                        replace: !0,
                        templateUrl: e.templateUrls.people
                    }
                }
                a.$inject = ["resources"], t.A.directive("people", a), r.default = a
            },
            2754: function(e, r, n) {
                "use strict";
                n.r(r);
                var t = n(1819);

                function a(e, r) {
                    return {
                        restrict: "A",
                        scope: !0,
                        replace: !0,
                        templateUrl: e.templateUrls.peopleListContainer,
                        link: function() {
                            r.isFriendsListLoaded = !0
                        }
                    }
                }
                a.$inject = ["resources", "$rootScope"], t.A.directive("peopleListContainer", a), r.default = a
            },
            8793: function(e, r, n) {
                "use strict";
                n.r(r);
                var t = n(1819);

                function a(e) {
                    return {
                        restrict: "A",
                        scope: !0,
                        replace: !0,
                        templateUrl: e.templateUrls.peopleList
                    }
                }
                a.$inject = ["resources"], t.A.directive("peopleList", a), r.default = a
            },
            1819: function(e, r, n) {
                "use strict";
                var t = n(7577),
                    a = n(127),
                    i = n.n(a)().module("peopleList", ["peopleListHtmlTemplateApp", "robloxApp", "ui.bootstrap", "thumbnails", "userProfiles"]).config(["languageResourceProvider", function(e) {
                        var r = (new t.TranslationResourceProvider).getTranslationResource("Feature.PeopleList");
                        e.setTranslationResources([r])
                    }]);
                r.A = i
            },
            275: function(e, r, n) {
                "use strict";
                n.r(r);
                var t = n(1819);

                function a(e, r, n, t) {
                    var a = r.apiSets;
                    return {
                        getFriendsList: function(e) {
                            var r = a.getFriendsListUrl.url;
                            return a.getFriendsListUrl.url = t("formatString")(r, {
                                userId: e
                            }), n.httpGet(a.getFriendsListUrl)
                        },
                        buildBatchPromises: function(r, t, a, i) {
                            for (var s = [], o = 0, l = r.slice(o, t); l.length > 0;) {
                                var c = {
                                    userIds: l
                                };
                                i ? s.push(n.httpPost(a, c)) : s.push(n.httpGet(a, c)), o++, l = r.slice(o * t, o * t + t)
                            }
                            return e.all(s)
                        },
                        getPresences: function(e) {
                            var n = r.apiParams.presenceMultiGetLimit;
                            return this.buildBatchPromises(e, n, a.getPresences, !0).then((function(e) {
                                if (e && e.length > 0) {
                                    var r = [];
                                    return angular.forEach(e, (function(e) {
                                        var n = e.userPresences;
                                        r = r.concat(n)
                                    })), r
                                }
                                return null
                            }))
                        },
                        getMetadata: function(e) {
                            var r = {
                                targetUserId: e
                            };
                            return n.httpGet(a.getMetadataUrl, r)
                        }
                    }
                }
                a.$inject = ["$q", "resources", "httpService", "$filter"], t.A.factory("friendsService", a), r.default = a
            },
            37: function(e, r, n) {
                "use strict";
                n.r(r);
                var t = n(7577),
                    a = n(1819);

                function i(e, r, n) {
                    var a = r.apiSets;
                    return {
                        joinGame: function(e, r) {
                            t.GameLauncher.joinGameInstance(e, r, !0, !0)
                        },
                        multiGetPlaceDetails: function(e) {
                            var r = {
                                placeIds: e
                            };
                            return n.httpGet(a.multiGetPlaceDetails, r).then((function(e) {
                                var r = [],
                                    n = {};
                                return angular.forEach(e, (function(e) {
                                    e && e.imageToken && r.push(e.imageToken), n[e.placeId] = e
                                })), n
                            }))
                        }
                    }
                }
                i.$inject = ["$q", "resources", "httpService"], a.A.factory("gamesService", i), r.default = i
            },
            8114: function(e, r, n) {
                "use strict";
                n.r(r);
                var t = n(1819),
                    a = n(4468);

                function i(e, r, n, t) {
                    var i = e;
                    return {
                        sectionTitle: i.get("Heading.Friends"),
                        seeAllBtnText: i.get("Heading.SeeAll"),
                        maxNumberOfFriendsDisplayed: 24,
                        isAllFriendsDataLoaded: !1,
                        isAvatarDataLoaded: !1,
                        presenceTypes: {
                            offline: {
                                status: 0,
                                className: ""
                            },
                            online: {
                                status: 1,
                                className: "icon-online"
                            },
                            ingame: {
                                status: 2,
                                className: "icon-game"
                            },
                            instudio: {
                                status: 3,
                                className: "icon-studio"
                            }
                        },
                        getFriendsPageUrl: function() {
                            var e = (0, a.c)();
                            return null !== e ? r.getAbsoluteUrl("/users/".concat(e, "/friends")) : r.getAbsoluteUrl("/users/friends")
                        },
                        getGameDetailsPageUrl: function(e) {
                            var t = n("formatString")("/games/{placeId}/gamename", {
                                placeId: e
                            });
                            return r.getAbsoluteUrl(t)
                        },
                        getProfilePageUrl: function(e) {
                            var t = n("formatString")("/users/{userId}/profile", {
                                userId: e
                            });
                            return r.getAbsoluteUrl(t)
                        },
                        playButtons: {
                            join: {
                                type: "join",
                                text: i.get("Action.Join"),
                                className: "btn-growth-sm",
                                isPlayable: !0
                            },
                            buy: {
                                type: "buy",
                                text: i.get("Action.Buy"),
                                className: "btn-primary-sm",
                                isPlayable: !1
                            },
                            details: {
                                type: "details",
                                text: i.get("Action.ViewDetails"),
                                className: "btn-control-sm",
                                isPlayable: !1
                            }
                        },
                        interactionLabels: {
                            chat: function(e) {
                                return i.get("Label.Chat", {
                                    username: e
                                })
                            },
                            viewProfile: i.get("Label.ViewProfile")
                        },
                        thumbnailTypes: t.thumbnailTypes
                    }
                }
                i.$inject = ["languageResource", "urlService", "$filter", "thumbnailConstants"], t.A.factory("layoutService", i), r.default = i
            },
            164: function(e, r, n) {
                "use strict";
                n.r(r);
                var t = n(1819);

                function a(e, r, n) {
                    return {
                        sortFriendsByOnlineOffline: function(r) {
                            var n = e("orderBy"),
                                t = [],
                                a = [];
                            angular.forEach(r.friendsDict, (function(e) {
                                e.presence && e.presence.userPresenceType > 0 ? t.push(e) : a.push(e)
                            })), t = n(t, "+name"), a = n(a, "+name"), (t = t.concat(a)).forEach((function(e) {
                                r.friendIds.push(e.id)
                            }))
                        },
                        sortFriendsByPresenceType: function(n) {
                            var t = e("orderBy"),
                                a = [],
                                i = [],
                                s = [],
                                o = [],
                                l = r.presenceTypes;
                            angular.forEach(n.friendsDict, (function(e) {
                                if (!e.presence) return !1;
                                switch (e.presence.userPresenceType) {
                                    case l.online.status:
                                        a.push(e);
                                        break;
                                    case l.offline.status:
                                        i.push(e);
                                        break;
                                    case l.ingame.status:
                                        s.push(e);
                                        break;
                                    case l.instudio.status:
                                        o.push(e)
                                }
                            })), a = t(a, "+name"), i = t(i, "+name"), s = t(s, "+name"), o = t(o, "+name"), (s = (s = (s = s.concat(a)).concat(o)).concat(i)).forEach((function(e) {
                                n.friendIds.indexOf(e.id) < 0 && n.friendIds.push(e.id)
                            }))
                        }
                    }
                }
                a.$inject = ["$filter", "layoutService", "$log"], t.A.factory("utilityService", a), r.default = a
            },
            4468: function(e, r, n) {
                "use strict";

                function t() {
                    var e = /\/users\/(\d+)\//g.exec(window.location.pathname);
                    return e ? e[1] : null
                }
                n.d(r, {
                    c: function() {
                        return t
                    }
                })
            },
            5350: function(e) {
                e.exports = '<div ng-controller="peopleController"> <div class="avatar-container"> <a href="{{friend.profileUrl}}" class="text-link friend-link" ng-click="clickAvatar(friend, $index)" popover-trigger=" \'none\' " popover-class="people-info-card-container {{peopleInfoCardContainerClass}} people-info-{{friend.id}}" popover-placement="{{peopleInfoCardPlacement}}" popover-append-to-body="true" popover-is-open="hoverPopoverParams.isOpen" hover-popover-params="hoverPopoverParams" hover-popover uib-popover-template="\'{{peopleInfoCardTemplateUrl}}\'"> <div class="avatar avatar-card-fullbody"> <span class="avatar-card-link friend-avatar" ng-class="{\'icon-placeholder-avatar-headshot\': !friend.avatar.imageUrl}"> <thumbnail-2d class="avatar-card-image" thumbnail-type="layout.thumbnailTypes.avatarHeadshot" thumbnail-target-id="friend.id"></thumbnail-2d> </span> </div> <div ng-class="{\'shimmer\': layout.namesLoading}" class="friend-parent-container"> <div class="friend-name-container"> <span class="text-overflow friend-name font-caption-header" ng-bind="friend.nameToDisplay" title="{{friend.nameToDisplay}}"></span> <span ng-class="{\'hide\': !friend.hasVerifiedBadge || layout.namesLoading}"> <span class="verified-badge-icon-friends-carousel" data-size="CaptionHeader" data-overrideimgclass="verified-badge-icon-friends-carousel-rendered"> </span> </span> </div> </div> <div class="text-overflow xsmall text-label place-name" ng-if="friend.presence.placeUrl" ng-bind="library.placesDict[friend.presence.rootPlaceId].name"></div> </a> <a class="friend-status place-link" ng-href="{{friend.presence.placeUrl}}" ng-if="friend.presence.placeUrl" ng-click="clickPlaceLink(friend, $index)"> <span class="avatar-status friend-status {{friend.presence.className}}" title="{{friend.presence.lastLocation}}"></span> </a> <span ng-if="!friend.presence.placeUrl" class="avatar-status friend-status {{friend.presence.className}}" title="{{friend.presence.lastLocation}}"></span> </div> </div>'
            },
            8160: function(e) {
                e.exports = '<div ng-controller="peopleInfoCardController" ng-class="{\'card-with-game\': friend.presence.placeUrl}"> <div class="border-bottom place-container" ng-show="friend.presence.placeUrl"> <span ng-click="goToGameDetails(\'icon\')"> <thumbnail-2d class="cursor-pointer place-icon" thumbnail-type="layout.thumbnailTypes.gameIcon" thumbnail-target-id="library.placesDict[friend.presence.rootPlaceId].universeId"></thumbnail-2d> </span> <div class="place-info-container"> <div class="place-info"> <span class="text-subject cursor-pointer place-title" ng-bind="library.placesDict[friend.presence.rootPlaceId].name" ng-click="goToGameDetails(\'link\')"></span> <div class="icon-text-wrapper" ng-show="library.placesDict[friend.presence.rootPlaceId].requiredPurchase"> <span class="icon-robux"></span> <span class="text-robux" ng-bind="library.placesDict[friend.presence.rootPlaceId].price"></span> </div> </div> <div class="place-btn-container"> <button class="btn-full-width place-btn {{library.placesDict[friend.presence.rootPlaceId].buttonLayout.className}}" ng-click="clickBtn(\'btn\')"> {{library.placesDict[friend.presence.rootPlaceId].buttonLayout.text}} </button> </div> </div> </div> <ul class="dropdown-menu interaction-container"> <li class="interaction-item" ng-click="goToChat()"> <span class="icon icon-chat-gray"></span> <span class="text-overflow border-bottom label" ng-bind="layout.interactionLabels.chat(friend.nameToDisplay)" title="{{layout.interactionLabels.chat(friend.nameToDisplay)}}"></span> </li> <li class="interaction-item" ng-click="goToProfilePage()"> <span class="icon icon-viewdetails"></span> <span class="label" ng-bind="layout.interactionLabels.viewProfile"></span> </li> </ul> </div>'
            },
            9422: function(e) {
                e.exports = '<ul class="hlist" ng-controller="friendsListController"> <li id="people-{{friend.id}}" rbx-user-id="{{friend.id}}" class="list-item friend" ng-repeat="friend in library.friendsDict | orderList: library.friendIds | limitTo: layout.maxNumberOfFriendsDisplayed"> <div people></div> </li> </ul> '
            },
            5055: function(e) {
                e.exports = '<div ng-controller="peopleListContainerController"> <div class="col-xs-12 people-list-container" ng-show="layout.isAllFriendsDataLoaded && library.numOfFriends > 0 || layout.friendsError"> <div class="section home-friends"> <div class="container-header people-list-header"> <h2> {{layout.sectionTitle}}<span ng-show="library.numOfFriends !== null" class="friends-count">({{library.numOfFriends}})</span> </h2> <span ng-show="layout.invalidPresenceData" class="presence-error"> <span class="icon-warning"></span> <span class="text-error" ng-bind="\'Label.PresenceError\' | translate"></span> </span> <a href="{{layout.getFriendsPageUrl()}}" class="btn-secondary-xs btn-more see-all-link-icon">{{layout.seeAllBtnText}}</a> </div> <div class="section-content remove-panel people-list"> <p ng-show="layout.friendsError" class="section-content-off" ng-bind="\'Label.FriendsError\' | translate"></p> <div people-list ng-class="{\'invisible\': !layout.isAllFriendsDataLoaded}"></div> <span class="spinner spinner-default" ng-show="!layout.isAllFriendsDataLoaded"></span> </div> </div> </div> <div class="col-xs-12 people-list-container" ng-hide="layout.isAllFriendsDataLoaded"> <div class="section home-friends"> <div class="container-header people-list-header"> <h2>{{layout.sectionTitle}}</h2> </div> <div class="section-content remove-panel people-list"> <span class="spinner spinner-default"></span> </div> </div> </div> </div> '
            },
            7577: function(e) {
                "use strict";
                e.exports = Roblox
            },
            127: function(e) {
                "use strict";
                e.exports = angular
            }
        },
        r = {};

    function n(t) {
        var a = r[t];
        if (void 0 !== a) return a.exports;
        var i = r[t] = {
            exports: {}
        };
        return e[t](i, i.exports, n), i.exports
    }
    n.n = function(e) {
            var r = e && e.__esModule ? function() {
                return e.default
            } : function() {
                return e
            };
            return n.d(r, {
                a: r
            }), r
        }, n.d = function(e, r) {
            for (var t in r) n.o(r, t) && !n.o(e, t) && Object.defineProperty(e, t, {
                enumerable: !0,
                get: r[t]
            })
        }, n.o = function(e, r) {
            return Object.prototype.hasOwnProperty.call(e, r)
        }, n.r = function(e) {
            "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
                value: "Module"
            }), Object.defineProperty(e, "__esModule", {
                value: !0
            })
        },
        function() {
            "use strict";
            var e = n(127),
                r = n.n(e),
                t = n(7525),
                a = n(1819);
            (0, t.importFilesUnderPath)(n(2938)), (0, t.importFilesUnderPath)(n(2183)), (0, t.importFilesUnderPath)(n(8786)), (0, t.importFilesUnderPath)(n(8605));
            var i = n(5098);
            (0, t.templateCacheGenerator)(r(), "peopleListHtmlTemplateApp", i);
            r().element("#people-list-container").hasClass("no-self-bootstrap") && (window.peopleList = a.A)
        }()
}();
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/3757fff4c9a9aa599bc20ccbe75824c1-peopleList.bundle.min.js.map

/* Bundle detector */
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("PeopleList");