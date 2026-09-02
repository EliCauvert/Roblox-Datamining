! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "acf0747f2632b776ccfd686b0564bd5dc288a261"
        };
        var r = (new e.Error).stack;
        r && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[r] = "f96d859a-3a09-4824-8fda-68482ff280a3", e._sentryDebugIdIdentifier = "sentry-dbid-f96d859a-3a09-4824-8fda-68482ff280a3")
    } catch (e) {}
}(),
function() {
    var e = {
            611: function(e) {
                function r(e) {
                    return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
                }!
                /*!
                	Copyright (c) 2018 Jed Watson.
                	Licensed under the MIT License (MIT), see
                	http://jedwatson.github.io/classnames
                */
                function() {
                    "use strict";
                    var t = {}.hasOwnProperty;

                    function n() {
                        for (var e = "", a = 0; a < arguments.length; a++) {
                            var o = arguments[a];
                            o && (e = i(e, function(e) {
                                if ("string" == typeof e || "number" == typeof e) return e;
                                if ((void 0 === e ? "undefined" : r(e)) !== "object") return "";
                                if (Array.isArray(e)) return n.apply(null, e);
                                if (e.toString !== Object.prototype.toString && !e.toString.toString().includes("[native code]")) return e.toString();
                                var a = "";
                                for (var o in e) t.call(e, o) && e[o] && (a = i(a, o));
                                return a
                            }(o)))
                        }
                        return e
                    }

                    function i(e, r) {
                        return r ? e ? e + " " + r : e + r : e
                    }
                    e.exports ? (n.default = n, e.exports = n) : "function" == typeof define && "object" === r(define.amd) && define.amd ? define("classnames", [], function() {
                        return n
                    }) : window.classNames = n
                }()
            }
        },
        r = {};

    function t(n) {
        var i = r[n];
        if (void 0 !== i) return i.exports;
        var a = r[n] = {
            exports: {}
        };
        return e[n](a, a.exports, t), a.exports
    }
    t.m = e, t.n = function(e) {
            var r = e && e.__esModule ? function() {
                return e.default
            } : function() {
                return e
            };
            return t.d(r, {
                a: r
            }), r
        }, t.d = function(e, r) {
            for (var n in r) t.o(r, n) && !t.o(e, n) && Object.defineProperty(e, n, {
                enumerable: !0,
                get: r[n]
            })
        }, t.o = function(e, r) {
            return Object.prototype.hasOwnProperty.call(e, r)
        }, t.r = function(e) {
            "u" > typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
                value: "Module"
            }), Object.defineProperty(e, "__esModule", {
                value: !0
            })
        }, t.rv = function() {
            return "1.7.12"
        }, t.ruid = "bundler=rspack@1.7.12",
        function() {
            "use strict";
            var e, r, n, i, a = window.ReactJSX,
                o = window.Roblox["core-scripts"].util.ready,
                s = t.n(o),
                u = window.Roblox["core-scripts"].react,
                l = window.React,
                c = t.n(l),
                d = window.Redux,
                f = window.ReduxThunk,
                p = t.n(f),
                m = window.ReactRedux,
                y = window.TanstackQuery,
                h = window.ReactUtilities,
                v = "SET_FRIENDS",
                b = "LOAD_MORE_FRIENDS",
                g = "SET_METADATA",
                S = "SET_TABLOADER",
                E = "SET_ERROR_TYPE";

            function T(e, r) {
                (null == r || r > e.length) && (r = e.length);
                for (var t = 0, n = Array(r); t < r; t++) n[t] = e[t];
                return n
            }

            function R(e) {
                return function(e) {
                    if (Array.isArray(e)) return T(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return T(e, void 0);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return T(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var F = [],
                I = window.Roblox;

            function w() {
                var e = /\/users\/(\d+)\//g.exec(window.location.pathname);
                return e ? e[1] : null
            }
            var C = w() || I.CurrentUser.userId,
                x = {
                    profileUserId: C,
                    isMyProfile: C === I.CurrentUser.userId,
                    isNearbyUpsellEnabled: !1,
                    isFriendsUserDataStoreCacheEnabled: !0,
                    onlyShowContents: !1,
                    userName: "",
                    displayName: ""
                },
                N = {
                    isLoading: !1
                },
                A = (0, d.combineReducers)({
                    friends: function() {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : F,
                            r = arguments.length > 1 ? arguments[1] : void 0;
                        switch (r.type) {
                            case v:
                                return r.friends;
                            case b:
                                return R(e).concat(R(r.friends));
                            default:
                                return e
                        }
                    },
                    metadata: function() {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : x,
                            r = arguments.length > 1 ? arguments[1] : void 0,
                            t = window.location.search.match("onlyShowContents") || !1;
                        return r.type === g ? function(e) {
                            for (var r = 1; r < arguments.length; r++) {
                                var t = null != arguments[r] ? arguments[r] : {},
                                    n = Object.keys(t);
                                "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(t).filter(function(e) {
                                    return Object.getOwnPropertyDescriptor(t, e).enumerable
                                }))), n.forEach(function(r) {
                                    var n;
                                    n = t[r], r in e ? Object.defineProperty(e, r, {
                                        value: n,
                                        enumerable: !0,
                                        configurable: !0,
                                        writable: !0
                                    }) : e[r] = n
                                })
                            }
                            return e
                        }({}, {
                            onlyShowContents: t
                        }, e, r.data) : e
                    },
                    tabLoader: function() {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : N,
                            r = arguments.length > 1 ? arguments[1] : void 0;
                        return r.type === S ? r.data : e
                    },
                    errorType: function() {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : null,
                            r = arguments.length > 1 ? arguments[1] : void 0;
                        return r.type === E ? r.errorType : e
                    }
                }),
                O = window.PropTypes,
                j = t.n(O),
                P = window.ReactStyleGuide,
                D = t(611),
                L = t.n(D),
                U = window.CoreRobloxUtilities,
                _ = {
                    FRIENDS_EMPTY: "Label.NoResults",
                    CONNECTIONS_FILTER: {
                        PLACEHOLDER: "Label.FilterConnections"
                    },
                    FRIENDTABS: {
                        FRIENDS: "friends",
                        FOLLOWING: "following",
                        FOLLOWERS: "followers",
                        FRIENDREQUESTS: "friend-requests"
                    },
                    FRIEND_FILTER_OPTIONS: {
                        ALL: "all",
                        TRUSTED: "trusted"
                    },
                    FILTER_STATUS_OPTIONS: {
                        0: "Label.Offline",
                        1: "Label.Online",
                        2: "Label.InGame"
                    },
                    FILTER_STATUS_OPTIONS_DEFAULT: "Label.All",
                    LIST_TYPE: {
                        friends: U.userInfoService.TYPE.FRIENDS,
                        following: U.userInfoService.TYPE.FOLLOWINGS,
                        followers: U.userInfoService.TYPE.FOLLOWERS,
                        "friend-requests": U.userInfoService.TYPE.FRIENDREQUESTS
                    },
                    START_PAGE: 1,
                    MAX_PER_PAGE: 18,
                    MAX_LIMIT: 50,
                    CACHE_CRITERIA: {
                        useCache: !0,
                        expirationWindowMS: 3e4
                    },
                    FRIEND_REQUEST_COUNT_EVENT: "Roblox.Friends.CountChanged",
                    MAX_FRIENDS_STATUS: 409,
                    MAX_FRIENDS_CODE: {
                        currentUser: 11,
                        receiverUser: 12
                    },
                    CAPTCHA_CODE: 14,
                    FLOODED_STATUS: 429,
                    FORBIDDEN_STATUS: 403,
                    FRIENDS_ERROR_TYPE: {
                        currentUser: "currentUser",
                        receiverUser: "receiverUser",
                        general: "general",
                        flooded: "flooded"
                    },
                    FRIENDS_ERROR: {
                        currentUser: {
                            titleText: "Label.ErrorTitle",
                            bodyText: "Message.ForMaxFriendsError",
                            neutralButtonText: "Label.Ok",
                            footerText: "Message.ForMaxFriendsFooter"
                        },
                        receiverUser: {
                            titleText: "Label.ErrorTitle",
                            bodyText: "Message.ForMaxRequestsError",
                            neutralButtonText: "Label.Ok",
                            footerText: "Message.ForMaxRequestsFooter"
                        },
                        general: {
                            titleText: "Label.ErrorTitle",
                            bodyText: "Message.ForGeneralError",
                            neutralButtonText: "Label.Ok",
                            footerText: "Message.ForGeneralFooter"
                        },
                        flooded: {
                            titleText: "Label.ErrorTitle",
                            bodyText: "Message.FloodLimitExceededError",
                            neutralButtonText: "Label.Ok"
                        }
                    },
                    SORT_ORDER: {
                        asc: "Asc",
                        desc: "Desc"
                    },
                    SORT_OPTIONS: {
                        ALPHABETICAL: "Alphabetical",
                        API: "Api",
                        STATUS: "Status"
                    },
                    EVENTS: {
                        ACCEPTED_FRIEND_REQUEST: "AcceptedFriendRequest",
                        FRIEND_REQUESTS_DISPLAYED: "FriendRequestsDisplayed",
                        TOTAL_FRIEND_REQUESTS_RETRIEVED: "TotalFriendRequestsRetrieved",
                        FRIENDS_LANDING_PAGE_LOAD: "friendsLandingPageLoad"
                    },
                    FRIENDS_REQUEST_LIST_CONTEXT: "FriendsRequestListContext",
                    PLUS_SIGN: "+",
                    MUTUAL_FRIENDS_SHOW_COUNT: 5,
                    DEVICE_TYPES: {
                        computer: "computer"
                    },
                    FRIENDS_RENAMED_TO_CONNECTIONS_CACHE_KEY: "isFriendsRenamedToConnections",
                    UNAVAILABLE_FRIEND_NAME: "Label.UnavailableFriendName",
                    TRUSTED_FRIEND_STATUS: {
                        Friends: "Friends",
                        NotFriends: "NotFriends",
                        RequestSent: "RequestSent",
                        RequestReceived: "RequestReceived",
                        Invalid: "Invalid",
                        TrustedFriends: "TrustedFriends",
                        RequestIgnored: "RequestIgnored"
                    },
                    FIND_FRIENDS_TYPES: {
                        Friends: "FindFriends",
                        TrustedFriends: "FindTrustedFriends"
                    },
                    AMP_FEATURE_NAMES: {
                        IsUserInTcEligibleCountry: "IsUserInTcEligibleCountry"
                    },
                    AMP_NAMESPACES: {
                        ConnectionGraphCore: "connection_graph_core/ConnectionGraphCore"
                    }
                };

            function q(e, r) {
                (null == r || r > e.length) && (r = e.length);
                for (var t = 0, n = Array(r); t < r; t++) n[t] = e[t];
                return n
            }
            var M = _.MAX_FRIENDS_STATUS,
                k = _.FRIENDS_ERROR_TYPE,
                B = _.MAX_FRIENDS_CODE,
                G = _.FLOODED_STATUS,
                z = function(e) {
                    return {
                        type: E,
                        errorType: e
                    }
                },
                Q = function(e) {
                    return function(r) {
                        if (e) {
                            var t, n = (function(e) {
                                if (Array.isArray(e)) return e
                            }(t = e.data.errors) || function(e) {
                                var r, t, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                if (null != n) {
                                    var i = [],
                                        a = !0,
                                        o = !1;
                                    try {
                                        for (n = n.call(e); !(a = (r = n.next()).done) && (i.push(r.value), 1 !== i.length); a = !0);
                                    } catch (e) {
                                        o = !0, t = e
                                    } finally {
                                        try {
                                            a || null == n.return || n.return()
                                        } finally {
                                            if (o) throw t
                                        }
                                    }
                                    return i
                                }
                            }(t) || function(e) {
                                if (e) {
                                    if ("string" == typeof e) return q(e, 1);
                                    var r = Object.prototype.toString.call(e).slice(8, -1);
                                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return q(e, 1)
                                }
                            }(t) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }())[0];
                            switch (e.status) {
                                case M:
                                    n.code === B.currentUser && r(z(k.currentUser)), n.code === B.receiverUser && r(z(k.receiverUser));
                                    break;
                                case G:
                                    r(z(k.flooded));
                                    break;
                                default:
                                    r(z(k.general))
                            }
                        }
                    }
                },
                H = window.CoreUtilities,
                W = I.EnvironmentUrls.apiGatewayUrl,
                V = I.EnvironmentUrls.friendsApi,
                Y = I.EnvironmentUrls.thumbnailsApi,
                J = (I.EnvironmentUrls.presenceApi, I.EnvironmentUrls.gamesApi),
                X = (I.EnvironmentUrls.usersApi, function(e) {
                    var r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null,
                        t = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : null;
                    return {
                        retryable: !0,
                        withCredentials: !0,
                        url: "".concat(W, "/access-management/v1/upsell-feature-access?featureName=").concat(e).concat(r ? "&extraParameters=".concat(r) : "").concat(t ? "&successfulActions=".concat(t) : "")
                    }
                }),
                $ = function(e) {
                    var r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null,
                        t = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : null,
                        n = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : null;
                    return {
                        retryable: !0,
                        withCredentials: !0,
                        url: "".concat(W, "/access-management/v1/upsell-feature-access?featureName=").concat(e).concat(r ? "&extraParameters=".concat(r) : "").concat(t ? "&successfulActions=".concat(t) : "").concat(n ? "&namespace=".concat(encodeURIComponent(n)) : "")
                    }
                };

            function K(e, r) {
                (null == r || r > e.length) && (r = e.length);
                for (var t = 0, n = Array(r); t < r; t++) n[t] = e[t];
                return n
            }

            function Z(e) {
                return function(e) {
                    if (Array.isArray(e)) return K(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return K(e, void 0);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return K(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var ee = _.FRIENDTABS,
                er = {
                    userId: 0,
                    getFriendsTypeName: function(e) {
                        switch (e) {
                            case ee.FRIENDREQUESTS:
                                return "FriendRequests";
                            case ee.FOLLOWING:
                                return "Following";
                            case ee.FOLLOWERS:
                                return "Followers";
                            case ee.FRIENDS:
                            default:
                                return "AllFriends"
                        }
                    },
                    setUserId: function(e) {
                        this.userId = w() || e
                    },
                    getMetadata: function(e) {
                        return H.httpService.get({
                            url: "".concat(V, "/v1/metadata"),
                            retryable: !0,
                            withCredentials: !0
                        }, {
                            targetUserId: e
                        })
                    },
                    acceptFriendRequest: function(e) {
                        var r, t = (r = e, {
                            retryable: !1,
                            withCredentials: !0,
                            url: "".concat(V, "/v1/users/").concat(r, "/accept-friend-request")
                        });
                        return H.httpService.post(t)
                    },
                    declineFriendRequest: function(e) {
                        var r, t = (r = e, {
                            retryable: !1,
                            withCredentials: !0,
                            url: "".concat(V, "/v1/users/").concat(r, "/decline-friend-request")
                        });
                        return H.httpService.post(t, {})
                    },
                    declineAllFriendRequests: function() {
                        return H.httpService.post({
                            retryable: !1,
                            withCredentials: !0,
                            url: "".concat(V, "/v1/user/friend-requests/decline-all")
                        }, {})
                    },
                    follow: function(e, r) {
                        var t, n = (t = e, {
                            retryable: !1,
                            withCredentials: !0,
                            url: "".concat(V, "/v1/users/").concat(t, "/follow")
                        });
                        return H.httpService.post(n, r, !0)
                    },
                    unfollow: function(e) {
                        var r, t = (r = e, {
                            retryable: !1,
                            withCredentials: !0,
                            url: "".concat(V, "/v1/users/").concat(r, "/unfollow")
                        });
                        return H.httpService.post(t, {
                            targetUserId: e
                        })
                    },
                    unfriend: function(e) {
                        var r, t = (r = e, {
                            retryable: !1,
                            withCredentials: !0,
                            url: "".concat(V, "/v1/users/").concat(r, "/unfriend")
                        });
                        return H.httpService.post(t, {})
                    },
                    getAvatarHeadshots: function(e) {
                        return H.httpService.buildBatchPromises(e, 50, {
                            url: "".concat(Y, "/v1/users/avatar-headshot?size=150x150&format=png"),
                            retryable: !0,
                            withCredentials: !0
                        }).then(function(e) {
                            return e && e.length > 0 ? e.reduce(function(e, r) {
                                var t = r.data.data;
                                return Z(e).concat(Z(t))
                            }, []) : []
                        }).catch(function() {
                            return []
                        })
                    },
                    getGamePlayabilities: function(e) {
                        return H.httpService.get({
                            retryable: !0,
                            withCredentials: !0,
                            url: "".concat(J, "/v1/games/multiget-playability-status")
                        }, {
                            universeIds: e
                        })
                    },
                    getFriendsRequestCount: function() {
                        return H.httpService.get({
                            url: "".concat(V, "/v1/user/friend-requests/count"),
                            retryable: !0,
                            withCredentials: !0
                        })
                    },
                    getFollowersCount: function(e) {
                        var r, t = {
                            url: (r = e, "".concat(V, "/v1/users/").concat(r, "/followers/count")),
                            retryable: !0,
                            withCredentials: !0
                        };
                        return H.httpService.get(t)
                    },
                    getFollowingsCount: function(e) {
                        var r, t = {
                            url: (r = e, "".concat(V, "/v1/users/").concat(r, "/followings/count")),
                            retryable: !0,
                            withCredentials: !0
                        };
                        return H.httpService.get(t)
                    },
                    getGames: function(e) {
                        return H.httpService.get({
                            url: "".concat(J, "/v1/games"),
                            retryable: !0,
                            withCredentials: !0
                        }, {
                            universeIds: e
                        })
                    },
                    getPaginatedFriends: function(e, r, t, n) {
                        var i, a, o, s, u = (i = e, a = r, o = t, s = n, {
                            retryable: !1,
                            withCredentials: !0,
                            url: "".concat(V, "/v1/users/").concat(i, "/friends/find?limit=").concat(s ? 36 : 18, "&cursor=").concat(a, "&userSort=").concat(o ? "1" : "")
                        });
                        return H.httpService.get(u)
                    },
                    getSearchedFriends: function(e, r, t, n) {
                        var i, a, o, s, u = (i = e, a = r, o = t, s = n, {
                            retryable: !1,
                            withCredentials: !0,
                            url: "".concat(V, "/v1/users/").concat(i, "/friends/search?limit=").concat(s ? 36 : 18, "&cursor=").concat(a, "&query=").concat(o)
                        });
                        return H.httpService.get(u)
                    },
                    getFriendsCount: function(e) {
                        var r, t = (r = e, {
                            retryable: !1,
                            withCredentials: !0,
                            url: "".concat(V, "/v1/users/").concat(r, "/friends/count")
                        });
                        return H.httpService.get(t)
                    },
                    clearNewFriendRequests: function() {
                        return H.httpService.delete({
                            retryable: !1,
                            withCredentials: !0,
                            url: "".concat(V, "/v1/my/new-friend-requests")
                        }, {})
                    },
                    getTrustedConnectionStatus: function(e) {
                        var r;
                        return H.httpService.get((r = e, {
                            retryable: !0,
                            withCredentials: !0,
                            url: "".concat(V, "/v1/my/trusted-friends/").concat(r, "/status")
                        }))
                    },
                    getPaginatedTrustedConnections: function(e, r, t, n) {
                        var i, a, o, s = (i = e, a = r, o = n, {
                            retryable: !1,
                            withCredentials: !0,
                            url: "".concat(V, "/v1/users/").concat(i, "/friends/find?limit=").concat(o ? 36 : 18, "&cursor=").concat(a, "&findFriendsType=").concat(_.FIND_FRIENDS_TYPES.TrustedFriends)
                        });
                        return H.httpService.get(s)
                    }
                },
                et = _.LIST_TYPE,
                en = _.CACHE_CRITERIA,
                ei = _.FRIEND_REQUEST_COUNT_EVENT,
                ea = (0, m.connect)(function(e) {
                    return {
                        friends: e.friends,
                        metadata: e.metadata,
                        tabLoader: e.tabLoader,
                        errorType: e.errorType
                    }
                }, function(e) {
                    return {
                        setMetadata: function(r) {
                            e({
                                type: g,
                                data: r
                            })
                        },
                        setFriends: function() {
                            var r = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [];
                            e({
                                type: v,
                                friends: r
                            })
                        },
                        loadMoreFriends: function() {
                            var r = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [];
                            e({
                                type: b,
                                friends: r
                            })
                        },
                        enableTabLoader: function() {
                            e({
                                type: S,
                                data: {
                                    isLoading: !0
                                }
                            })
                        },
                        disableTabLoader: function() {
                            e({
                                type: S,
                                data: {
                                    isLoading: !1
                                }
                            })
                        },
                        clearError: function() {
                            e(z(null))
                        },
                        followFriend: function(r, t) {
                            return er.follow(r, t).catch(function(r) {
                                if (function(e) {
                                        if ((null == e ? void 0 : e.status) === _.FORBIDDEN_STATUS) {
                                            var r, t, n;
                                            if ((null == e || null == (t = e.data) || null == (r = t.errors) ? void 0 : r.length) && (null == (n = e.data.errors[0]) ? void 0 : n.code) === _.CAPTCHA_CODE) return !0
                                        }
                                        return !1
                                    }(r) && !t) {
                                    var n, i;
                                    throw Error(null == r || null == (i = r.data) || null == (n = i.errors[0]) ? void 0 : n.fieldData)
                                }
                                e(Q(r))
                            })
                        },
                        unfollowFriend: function(r) {
                            return er.unfollow(r).catch(function(r) {
                                return e(Q(r))
                            })
                        },
                        acceptFriendRequest: function(r) {
                            return function(t) {
                                return er.acceptFriendRequest(t.id).then(function() {
                                    return r(t.id)
                                }).then(function() {
                                    U.userInfoService.refreshCacheData(et["friend-requests"], en)
                                }).catch(function(r) {
                                    return e(Q(r))
                                })
                            }
                        },
                        declineFriendRequest: function(r) {
                            return function(t) {
                                return er.declineFriendRequest(t.id).then(function() {
                                    return r(t.id)
                                }).then(function() {
                                    U.userInfoService.refreshCacheData(et["friend-requests"], en).then(function() {
                                        document.dispatchEvent(new CustomEvent(ei))
                                    })
                                }).catch(function(r) {
                                    return e(Q(r))
                                })
                            }
                        },
                        declineAllFriendRequests: function() {
                            return er.declineAllFriendRequests().then(function(e) {
                                var r;
                                return U.userInfoService.refreshCacheData(et["friend-requests"], en).then(function() {
                                    document.dispatchEvent(new CustomEvent(ei))
                                }), null == (r = e.data) ? void 0 : r.backgrounded
                            }).catch(function(r) {
                                return e(Q(r))
                            })
                        },
                        unfriend: function(r) {
                            return er.unfriend(r).catch(function(r) {
                                return e(Q(r))
                            })
                        },
                        getGamePlayabilities: er.getGamePlayabilities
                    }
                }),
                eo = {
                    common: ["Common.Presence", "CommonUI.Features"],
                    feature: "Feature.Friends"
                },
                es = window.HeaderScripts,
                eu = window.RobloxUserProfiles,
                el = window.Roblox["core-scripts"].http.http;

            function ec(e, r) {
                (null == r || r > e.length) && (r = e.length);
                for (var t = 0, n = Array(r); t < r; t++) n[t] = e[t];
                return n
            }

            function ed(e, r, t, n, i, a, o) {
                try {
                    var s = e[a](o),
                        u = s.value
                } catch (e) {
                    t(e);
                    return
                }
                s.done ? r(u) : Promise.resolve(u).then(n, i)
            }
            var ef = function(e) {
                var r;
                return (r = function() {
                    var r, t, n, i, a, o, s, u, l, c, d, f;
                    return function(e, r) {
                        var t, n, i, a = {
                                label: 0,
                                sent: function() {
                                    if (1 & i[0]) throw i[1];
                                    return i[1]
                                },
                                trys: [],
                                ops: []
                            },
                            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                            s = Object.defineProperty;
                        return s(o, "next", {
                            value: u(0)
                        }), s(o, "throw", {
                            value: u(1)
                        }), s(o, "return", {
                            value: u(2)
                        }), "function" == typeof Symbol && s(o, Symbol.iterator, {
                            value: function() {
                                return this
                            }
                        }), o;

                        function u(s) {
                            return function(u) {
                                var l = [s, u];
                                if (t) throw TypeError("Generator is already executing.");
                                for (; o && (o = 0, l[0] && (a = 0)), a;) try {
                                    if (t = 1, n && (i = 2 & l[0] ? n.return : l[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, l[1])).done) return i;
                                    switch (n = 0, i && (l = [2 & l[0], i.value]), l[0]) {
                                        case 0:
                                        case 1:
                                            i = l;
                                            break;
                                        case 4:
                                            return a.label++, {
                                                value: l[1],
                                                done: !1
                                            };
                                        case 5:
                                            a.label++, n = l[1], l = [0];
                                            continue;
                                        case 7:
                                            l = a.ops.pop(), a.trys.pop();
                                            continue;
                                        default:
                                            if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                                a = 0;
                                                continue
                                            }
                                            if (3 === l[0] && (!i || l[1] > i[0] && l[1] < i[3])) {
                                                a.label = l[1];
                                                break
                                            }
                                            if (6 === l[0] && a.label < i[1]) {
                                                a.label = i[1], i = l;
                                                break
                                            }
                                            if (i && a.label < i[2]) {
                                                a.label = i[2], a.ops.push(l);
                                                break
                                            }
                                            i[2] && a.ops.pop(), a.trys.pop();
                                            continue
                                    }
                                    l = r.call(e, a)
                                } catch (e) {
                                    l = [6, e], n = 0
                                } finally {
                                    t = i = 0
                                }
                                if (5 & l[0]) throw l[1];
                                return {
                                    value: l[0] ? l[1] : void 0,
                                    done: !0
                                }
                            }
                        }
                    }(this, function(p) {
                        switch (p.label) {
                            case 0:
                                var m;
                                if (0 === (t = function(e) {
                                        if (Array.isArray(e)) return ec(e)
                                    }(m = new Set(e)) || function(e) {
                                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                    }(m) || function(e) {
                                        if (e) {
                                            if ("string" == typeof e) return ec(e, void 0);
                                            var r = Object.prototype.toString.call(e).slice(8, -1);
                                            if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                            if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ec(e, void 0)
                                        }
                                    }(m) || function() {
                                        throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                    }()).length) return [2, {}];
                                return n = {
                                    url: "".concat(I.EnvironmentUrls.apiGatewayUrl, "/user-profile-api/v1/user/profiles/get-profiles"),
                                    retryable: !0,
                                    withCredentials: !0
                                }, i = {
                                    userIds: t,
                                    fields: ["hasRobloxSubscription"]
                                }, [4, el.post(n, i)];
                            case 1:
                                a = p.sent().data, o = {}, s = !0, u = !1, l = void 0;
                                try {
                                    for (c = (null != (r = a.profileDetails) ? r : [])[Symbol.iterator](); !(s = (d = c.next()).done); s = !0) o[(f = d.value).userId] = !0 === f.hasRobloxSubscription
                                } catch (e) {
                                    u = !0, l = e
                                } finally {
                                    try {
                                        s || null == c.return || c.return()
                                    } finally {
                                        if (u) throw l
                                    }
                                }
                                return [2, o]
                        }
                    })
                }, function() {
                    var e = this,
                        t = arguments;
                    return new Promise(function(n, i) {
                        var a = r.apply(e, t);

                        function o(e) {
                            ed(a, n, i, o, s, "next", e)
                        }

                        function s(e) {
                            ed(a, n, i, o, s, "throw", e)
                        }
                        o(void 0)
                    })
                })()
            };

            function ep(e, r) {
                (null == r || r > e.length) && (r = e.length);
                for (var t = 0, n = Array(r); t < r; t++) n[t] = e[t];
                return n
            }

            function em(e, r, t, n, i, a, o) {
                try {
                    var s = e[a](o),
                        u = s.value
                } catch (e) {
                    t(e);
                    return
                }
                s.done ? r(u) : Promise.resolve(u).then(n, i)
            }
            var ey = new Map,
                eh = !1,
                ev = function() {
                    var e;
                    return (e = function() {
                        var e, r, t, n, i, a, o, s, u, l, c, d, f, p, m, y, h, v, b, g, S, E, T, R, F, I, w, C, x, N;
                        return function(e, r) {
                            var t, n, i, a = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & i[0]) throw i[1];
                                        return i[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                s = Object.defineProperty;
                            return s(o, "next", {
                                value: u(0)
                            }), s(o, "throw", {
                                value: u(1)
                            }), s(o, "return", {
                                value: u(2)
                            }), "function" == typeof Symbol && s(o, Symbol.iterator, {
                                value: function() {
                                    return this
                                }
                            }), o;

                            function u(s) {
                                return function(u) {
                                    var l = [s, u];
                                    if (t) throw TypeError("Generator is already executing.");
                                    for (; o && (o = 0, l[0] && (a = 0)), a;) try {
                                        if (t = 1, n && (i = 2 & l[0] ? n.return : l[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, l[1])).done) return i;
                                        switch (n = 0, i && (l = [2 & l[0], i.value]), l[0]) {
                                            case 0:
                                            case 1:
                                                i = l;
                                                break;
                                            case 4:
                                                return a.label++, {
                                                    value: l[1],
                                                    done: !1
                                                };
                                            case 5:
                                                a.label++, n = l[1], l = [0];
                                                continue;
                                            case 7:
                                                l = a.ops.pop(), a.trys.pop();
                                                continue;
                                            default:
                                                if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                                    a = 0;
                                                    continue
                                                }
                                                if (3 === l[0] && (!i || l[1] > i[0] && l[1] < i[3])) {
                                                    a.label = l[1];
                                                    break
                                                }
                                                if (6 === l[0] && a.label < i[1]) {
                                                    a.label = i[1], i = l;
                                                    break
                                                }
                                                if (i && a.label < i[2]) {
                                                    a.label = i[2], a.ops.push(l);
                                                    break
                                                }
                                                i[2] && a.ops.pop(), a.trys.pop();
                                                continue
                                        }
                                        l = r.call(e, a)
                                    } catch (e) {
                                        l = [6, e], n = 0
                                    } finally {
                                        t = i = 0
                                    }
                                    if (5 & l[0]) throw l[1];
                                    return {
                                        value: l[0] ? l[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(A) {
                            switch (A.label) {
                                case 0:
                                    var O;
                                    if (e = ey, ey = new Map, eh = !1, 0 === e.size) return [2];
                                    r = function(e) {
                                        if (Array.isArray(e)) return ep(e)
                                    }(O = e.keys()) || function(e) {
                                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                    }(O) || function(e) {
                                        if (e) {
                                            if ("string" == typeof e) return ep(e, void 0);
                                            var r = Object.prototype.toString.call(e).slice(8, -1);
                                            if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                            if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ep(e, void 0)
                                        }
                                    }(O) || function() {
                                        throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                    }(), A.label = 1;
                                case 1:
                                    return A.trys.push([1, 3, , 4]), [4, ef(r)];
                                case 2:
                                    t = A.sent(), n = !0, i = !1, a = void 0;
                                    try {
                                        for (o = r[Symbol.iterator](); !(n = (s = o.next()).done); n = !0) {
                                            u = s.value, c = null != (l = e.get(u)) ? l : [], d = !0, f = !1, p = void 0;
                                            try {
                                                for (m = c[Symbol.iterator](); !(d = (y = m.next()).done); d = !0)(0, y.value.resolve)(!0 === t[u])
                                            } catch (e) {
                                                f = !0, p = e
                                            } finally {
                                                try {
                                                    d || null == m.return || m.return()
                                                } finally {
                                                    if (f) throw p
                                                }
                                            }
                                        }
                                    } catch (e) {
                                        i = !0, a = e
                                    } finally {
                                        try {
                                            n || null == o.return || o.return()
                                        } finally {
                                            if (i) throw a
                                        }
                                    }
                                    return [3, 4];
                                case 3:
                                    h = A.sent(), v = !0, b = !1, g = void 0;
                                    try {
                                        for (S = r[Symbol.iterator](); !(v = (E = S.next()).done); v = !0) {
                                            T = E.value, F = null != (R = e.get(T)) ? R : [], I = !0, w = !1, C = void 0;
                                            try {
                                                for (x = F[Symbol.iterator](); !(I = (N = x.next()).done); I = !0)(0, N.value.reject)(h)
                                            } catch (e) {
                                                w = !0, C = e
                                            } finally {
                                                try {
                                                    I || null == x.return || x.return()
                                                } finally {
                                                    if (w) throw C
                                                }
                                            }
                                        }
                                    } catch (e) {
                                        b = !0, g = e
                                    } finally {
                                        try {
                                            v || null == S.return || S.return()
                                        } finally {
                                            if (b) throw g
                                        }
                                    }
                                    return [3, 4];
                                case 4:
                                    return [2]
                            }
                        })
                    }, function() {
                        var r = this,
                            t = arguments;
                        return new Promise(function(n, i) {
                            var a = e.apply(r, t);

                            function o(e) {
                                em(a, n, i, o, s, "next", e)
                            }

                            function s(e) {
                                em(a, n, i, o, s, "throw", e)
                            }
                            o(void 0)
                        })
                    })()
                },
                eb = window.Roblox["core-scripts"].guac,
                eg = "web-plus-identity-badge",
                eS = function(e) {
                    return (void 0 === e ? "undefined" : e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e) == "object" && null !== e
                },
                eE = function() {
                    var e = (0, y.useQuery)({
                        queryKey: ["guac/".concat(eg)],
                        queryFn: function() {
                            return (0, eb.callBehaviour)(eg)
                        },
                        staleTime: 1 / 0
                    }).data;
                    return eS(e) && !0 === e.plusIdentityBadgeEnabled
                };

            function eT(e, r) {
                (null == r || r > e.length) && (r = e.length);
                for (var t = 0, n = Array(r); t < r; t++) n[t] = e[t];
                return n
            }
            var eR = function(e) {
                    var r = eE(),
                        t = (0, l.useMemo)(function() {
                            var r;
                            return ((function(e) {
                                if (Array.isArray(e)) return eT(e)
                            })(r = new Set(e)) || function(e) {
                                if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                            }(r) || function(e) {
                                if (e) {
                                    if ("string" == typeof e) return eT(e, void 0);
                                    var r = Object.prototype.toString.call(e).slice(8, -1);
                                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return eT(e, void 0)
                                }
                            }(r) || function() {
                                throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }()).sort(function(e, r) {
                                return e - r
                            })
                        }, [e]),
                        n = (0, y.useQueries)({
                            queries: t.map(function(e) {
                                return {
                                    queryKey: ["identity-badges/plusStatus/byUser", e],
                                    queryFn: function() {
                                        return new Promise(function(r, t) {
                                            var n, i = null != (n = ey.get(e)) ? n : [];
                                            i.push({
                                                resolve: r,
                                                reject: t
                                            }), ey.set(e, i), eh || (eh = !0, queueMicrotask(function() {
                                                ev().catch(function() {})
                                            }))
                                        })
                                    },
                                    enabled: r,
                                    staleTime: 1 / 0
                                }
                            })
                        }),
                        i = {},
                        a = !1;
                    return t.forEach(function(e, r) {
                        var t, o;
                        i[e] = (null == (t = n[r]) ? void 0 : t.data) === !0, (null == (o = n[r]) ? void 0 : o.isFetching) && (a = !0)
                    }), {
                        data: i,
                        isLoading: a
                    }
                },
                eF = function() {
                    for (var e, r, t = 0, n = "", i = arguments.length; t < i; t++)(e = arguments[t]) && (r = function e(r) {
                        var t, n, i = "";
                        if ("string" == typeof r || "number" == typeof r) i += r;
                        else if ("object" == (void 0 === r ? "undefined" : r && "u" > typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r))
                            if (Array.isArray(r)) {
                                var a = r.length;
                                for (t = 0; t < a; t++) r[t] && (n = e(r[t])) && (i && (i += " "), i += n)
                            } else
                                for (n in r) r[n] && (i && (i += " "), i += n);
                        return i
                    }(e)) && (n && (n += " "), n += r);
                    return n
                },
                eI = function(e) {
                    var r = e.className;
                    return c().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: eF("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", r)
                    })
                };

            function ew(e, r) {
                (null == r || r > e.length) && (r = e.length);
                for (var t = 0, n = Array(r); t < r; t++) n[t] = e[t];
                return n
            }

            function eC(e) {
                if (Array.isArray(e)) return e
            }

            function ex() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function eN(e, r) {
                if (e) {
                    if ("string" == typeof e) return ew(e, r);
                    var t = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ew(e, r)
                }
            }
            var eA = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                eO = c().forwardRef(function(e, r) {
                    var t, n = eC(t = [e, r]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(t) || eN(t) || ex(),
                        i = n[0],
                        a = n.slice(1),
                        o = i.name,
                        s = i.size,
                        u = i.className,
                        l = (i.children, function(e, r) {
                            if (null == e) return {};
                            var t, n, i, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (i = 0, t = Reflect.ownKeys(Object(e)); i < t.length; i++) n = t[i], !(r.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, r) {
                                    if (null == e) return {};
                                    var t, n, i = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) t = a[n], !(r.indexOf(t) >= 0) && Object.prototype.propertyIsEnumerable.call(e, t) && (i[t] = e[t]);
                                    return i
                                }(e, r), Object.getOwnPropertySymbols)
                                for (i = 0, t = Object.getOwnPropertySymbols(e); i < t.length; i++) n = t[i], !(r.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(i, ["name", "size", "className", "children"])),
                        d = (eC(a) || function(e) {
                            var r, t, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var i = [],
                                    a = !0,
                                    o = !1;
                                try {
                                    for (n = n.call(e); !(a = (r = n.next()).done) && (i.push(r.value), 1 !== i.length); a = !0);
                                } catch (e) {
                                    o = !0, t = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (o) throw t
                                    }
                                }
                                return i
                            }
                        }(a) || eN(a, 1) || ex())[0];
                    return c().createElement("span", function(e) {
                        for (var r = 1; r < arguments.length; r++) {
                            var t = null != arguments[r] ? arguments[r] : {},
                                n = Object.keys(t);
                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(t).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(t, e).enumerable
                            }))), n.forEach(function(r) {
                                var n;
                                n = t[r], r in e ? Object.defineProperty(e, r, {
                                    value: n,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[r] = n
                            })
                        }
                        return e
                    }({
                        ref: d,
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-icon",
                        className: eF("grow-0 shrink-0 basis-auto icon", o, eA[void 0 === s ? "Medium" : s], u)
                    }, l))
                });

            function ej(e, r) {
                (null == r || r > e.length) && (r = e.length);
                for (var t = 0, n = Array(r); t < r; t++) n[t] = e[t];
                return n
            }

            function eP(e) {
                if (Array.isArray(e)) return e
            }

            function eD() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function eL(e) {
                for (var r = 1; r < arguments.length; r++) {
                    var t = null != arguments[r] ? arguments[r] : {},
                        n = Object.keys(t);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(t).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(t, e).enumerable
                    }))), n.forEach(function(r) {
                        var n;
                        n = t[r], r in e ? Object.defineProperty(e, r, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[r] = n
                    })
                }
                return e
            }

            function eU(e, r) {
                return r = null != r ? r : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(r)) : (function(e) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var t = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, t)
                    }
                    return r
                })(Object(r)).forEach(function(t) {
                    Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(r, t))
                }), e
            }

            function e_(e, r) {
                if (null == e) return {};
                var t, n, i, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (i = 0, t = Reflect.ownKeys(Object(e)); i < t.length; i++) n = t[i], !(r.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, r) {
                        if (null == e) return {};
                        var t, n, i = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) t = a[n], !(r.indexOf(t) >= 0) && Object.prototype.propertyIsEnumerable.call(e, t) && (i[t] = e[t]);
                        return i
                    }(e, r), Object.getOwnPropertySymbols)
                    for (i = 0, t = Object.getOwnPropertySymbols(e); i < t.length; i++) n = t[i], !(r.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function eq(e, r) {
                if (e) {
                    if ("string" == typeof e) return ej(e, r);
                    var t = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ej(e, r)
                }
            }
            eO.displayName = "Icon";
            var eM = {
                    Small: "XSmall",
                    Medium: "Small",
                    Large: "Medium"
                },
                ek = {
                    Small: ["height-600", "text-label-small"],
                    Medium: ["height-800", "text-label-medium"],
                    Large: ["height-1000", "text-label-medium"]
                },
                eB = {
                    Small: "padding-left-small",
                    Medium: "padding-left-medium",
                    Large: "padding-left-large"
                },
                eG = {
                    Small: "padding-left-small",
                    Medium: "padding-left-medium",
                    Large: "padding-left-medium"
                },
                ez = {
                    Small: "padding-right-small",
                    Medium: "padding-right-medium",
                    Large: "padding-right-large"
                },
                eQ = {
                    Small: "padding-right-small",
                    Medium: "padding-right-medium",
                    Large: "padding-right-medium"
                },
                eH = {
                    Small: "padding-left-xsmall",
                    Medium: "padding-left-[var(--size-150)]",
                    Large: "padding-left-small"
                },
                eW = {
                    Small: "padding-right-[var(--size-150)]",
                    Medium: "padding-right-small",
                    Large: "padding-right-[var(--size-250)]"
                },
                eV = {
                    Standard: "bg-shift-300",
                    Utility: "bg-none"
                },
                eY = {
                    Small: "size-[var(--icon-size-xsmall)]",
                    Medium: "size-[var(--icon-size-small)]",
                    Large: "size-[var(--icon-size-medium)]"
                },
                eJ = function(e) {
                    var r = e.iconName,
                        t = e.node,
                        n = e.size;
                    return null != r ? c().createElement(eO, {
                        name: r,
                        size: eM[n]
                    }) : null != t ? c().createElement("span", {
                        className: eF("inline-flex items-center justify-center shrink-0", eY[n])
                    }, t) : null
                },
                eX = (0, l.forwardRef)(function(e, r) {
                    var t, n = eP(t = [e, r]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(t) || eq(t) || eD(),
                        i = n[0],
                        a = n.slice(1),
                        o = i.className,
                        s = i.style,
                        u = i.text,
                        l = i.isDisabled,
                        d = void 0 !== l && l,
                        f = i.size,
                        p = void 0 === f ? "Medium" : f,
                        m = i.variant,
                        y = void 0 === m ? "Standard" : m,
                        h = i.leadingIconName,
                        v = i.leadingIconNode,
                        b = i.trailingIconName,
                        g = i.trailingIconNode,
                        S = e_(i, ["className", "style", "text", "isDisabled", "size", "variant", "leadingIconName", "leadingIconNode", "trailingIconName", "trailingIconNode"]),
                        E = (eP(a) || function(e) {
                            var r, t, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var i = [],
                                    a = !0,
                                    o = !1;
                                try {
                                    for (n = n.call(e); !(a = (r = n.next()).done) && (i.push(r.value), 1 !== i.length); a = !0);
                                } catch (e) {
                                    o = !0, t = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (o) throw t
                                    }
                                }
                                return i
                            }
                        }(a) || eq(a, 1) || eD())[0],
                        T = null != h || null != v,
                        R = null != b || null != g,
                        F = eF(d ? "opacity-[0.5]" : ["relative clip group/interactable focus-visible:outline-focus disabled:outline-none", "cursor-pointer"], "relative flex justify-center items-center radius-circle stroke-none", T ? eG[p] : eB[p], R ? eQ[p] : ez[p], ek[p], o),
                        I = c().createElement(c().Fragment, null, c().createElement(eI, null), c().createElement(eJ, {
                            iconName: h,
                            node: v,
                            size: p
                        }), c().createElement("span", {
                            className: eF("padding-y-xsmall text-no-wrap text-truncate-end", T && eH[p], R && eW[p])
                        }, u), c().createElement(eJ, {
                            iconName: b,
                            node: g,
                            size: p
                        })),
                        w = eL({
                            textDecoration: "none"
                        }, s);
                    if ("a" === S.as) {
                        S.as;
                        var C = S.href,
                            x = e_(S, ["as", "href"]);
                        return c().createElement("a", eU(eL({
                            ref: E
                        }, x), {
                            "aria-disabled": d,
                            href: d ? void 0 : C,
                            className: eF(F, eV[y], "content-action-utility"),
                            style: w
                        }), I)
                    }
                    S.as;
                    var N = S.isChecked,
                        A = S.onCheckedChange,
                        O = e_(S, ["as", "isChecked", "onCheckedChange"]);
                    return c().createElement("button", eU(eL({
                        ref: E,
                        type: "button"
                    }, O), {
                        className: eF(N ? "bg-inverse-surface-0" : eV[y], N ? "content-inverse-emphasis" : "content-action-utility", F),
                        style: w,
                        "aria-pressed": N,
                        disabled: d,
                        onClick: null == A ? void 0 : function() {
                            return A(!N)
                        }
                    }), I)
                });

            function e$(e, r) {
                (null == r || r > e.length) && (r = e.length);
                for (var t = 0, n = Array(r); t < r; t++) n[t] = e[t];
                return n
            }

            function eK(e, r) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, r) {
                    var t, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var a = [],
                            o = !0,
                            s = !1;
                        try {
                            for (i = i.call(e); !(o = (t = i.next()).done) && (a.push(t.value), !r || a.length !== r); o = !0);
                        } catch (e) {
                            s = !0, n = e
                        } finally {
                            try {
                                o || null == i.return || i.return()
                            } finally {
                                if (s) throw n
                            }
                        }
                        return a
                    }
                }(e, r) || function(e, r) {
                    if (e) {
                        if ("string" == typeof e) return e$(e, r);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return e$(e, r)
                    }
                }(e, r) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var eZ = (0, l.createContext)(),
                e0 = function(e) {
                    var r = e.children,
                        t = eK((0, l.useState)(0), 2),
                        n = t[0],
                        i = t[1],
                        o = eK((0, l.useState)(null), 2),
                        s = o[0],
                        u = o[1],
                        c = eK((0, l.useState)(null), 2),
                        d = c[0],
                        f = c[1],
                        p = eK((0, l.useState)(null), 2),
                        m = p[0],
                        y = p[1],
                        h = eK((0, l.useState)([]), 2),
                        v = h[0],
                        b = h[1],
                        g = eK((0, l.useState)(null), 2),
                        S = g[0],
                        E = g[1],
                        T = eK((0, l.useState)(!1), 2),
                        R = T[0],
                        F = T[1],
                        I = eK((0, l.useState)(!1), 2),
                        w = I[0],
                        C = I[1],
                        x = eK((0, l.useState)(!1), 2),
                        N = x[0],
                        A = x[1],
                        O = eK((0, l.useState)(!1), 2),
                        j = O[0],
                        P = O[1],
                        D = eK((0, l.useState)(!1), 2),
                        L = D[0],
                        U = D[1],
                        _ = eK((0, l.useState)({}), 2),
                        q = _[0],
                        M = _[1],
                        k = eK((0, l.useState)(!0), 2),
                        B = k[0],
                        G = k[1];
                    return (0, a.jsx)(eZ.Provider, {
                        value: {
                            friendsCount: n,
                            setFriendsCount: i,
                            friendsNameFilter: s,
                            setFriendsNameFilter: u,
                            friendsStatusFilter: d,
                            setFriendsStatusFilter: f,
                            friendsSort: m,
                            setFriendsSort: y,
                            paginatedFriends: v,
                            setPaginatedFriends: b,
                            filterBarEnabled: S,
                            setFilterBarEnabled: E,
                            showJoinGameButtonInFriendCardDesktopOnly: L,
                            setShowJoinGameButtonInFriendCardDesktopOnly: U,
                            friendRequestIdToUniverseSourceMap: q,
                            setFriendRequestIdToUniverseSourceMap: M,
                            showFriendRecs: B,
                            setShowFriendRecs: G,
                            isTrustedFilterEnabled: R,
                            setIsTrustedFilterEnabled: F,
                            trustedConnectionsAmpPolicyLoaded: w,
                            setTrustedConnectionsAmpPolicyLoaded: C,
                            canAccessTrustedConnections: N,
                            setCanAccessTrustedConnections: A,
                            isTcManagementHubEnabled: j,
                            setIsTcManagementHubEnabled: P
                        },
                        children: r
                    })
                };

            function e1(e, r) {
                (null == r || r > e.length) && (r = e.length);
                for (var t = 0, n = Array(r); t < r; t++) n[t] = e[t];
                return n
            }

            function e2(e, r) {
                if (e) {
                    if ("string" == typeof e) return e1(e, r);
                    var t = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return e1(e, r)
                }
            }

            function e3(e) {
                var r, t, n, i = e.handleSearchValueChange,
                    o = e.translate,
                    s = function(e) {
                        if (Array.isArray(e)) return e
                    }(r = (0, l.useState)("")) || function(e) {
                        var r, t, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var i = [],
                                a = !0,
                                o = !1;
                            try {
                                for (n = n.call(e); !(a = (r = n.next()).done) && (i.push(r.value), 2 !== i.length); a = !0);
                            } catch (e) {
                                o = !0, t = e
                            } finally {
                                try {
                                    a || null == n.return || n.return()
                                } finally {
                                    if (o) throw t
                                }
                            }
                            return i
                        }
                    }(r) || e2(r, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    u = s[0],
                    c = s[1],
                    d = (0, l.useCallback)((t = function(e) {
                        i((e || "").trim())
                    }, function() {
                        for (var e = arguments.length, r = Array(e), i = 0; i < e; i++) r[i] = arguments[i];
                        clearTimeout(n), n = setTimeout.apply(void 0, [t, 300].concat(function(e) {
                            if (Array.isArray(e)) return e1(e)
                        }(r) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || e2(r) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()))
                    }), []);
                return (0, a.jsxs)("div", {
                    className: "friends-filter-searchbar-container form-control input-field",
                    children: [(0, a.jsx)("span", {
                        className: "icon-search"
                    }), (0, a.jsx)("input", {
                        className: "friends-filter-searchbar-input",
                        type: "text",
                        value: u || "",
                        onChange: function(e) {
                            c(e.target.value || void 0), d(e.target.value)
                        },
                        placeholder: o("Label.FilterFriends")
                    })]
                })
            }
            e0.propTypes = {
                children: j().node.isRequired
            }, e3.propTypes = {
                handleSearchValueChange: j().func.isRequired,
                translate: j().func.isRequired
            };
            var e6 = (0, h.withTranslations)(ea(e3), eo),
                e8 = U.eventStreamService.eventTypes,
                e4 = {
                    filterFriendsByName: {
                        name: "filterFriendsByName",
                        type: e8.formInteraction,
                        context: "friends",
                        requiredParams: ["query"]
                    },
                    filterFriendsByStatus: {
                        name: "filterFriendsByStatus",
                        type: e8.formInteraction,
                        context: "friends",
                        requiredParams: ["status"]
                    }
                };

            function e5(e) {
                e.translate;
                var r = (0, l.useContext)(eZ),
                    t = (r.friendsStatusFilter, r.setFriendsNameFilter),
                    n = (r.setFriendsStatusFilter, r.setIsTrustedFilterEnabled);
                return (0, a.jsx)("div", {
                    className: "friends-filter",
                    children: (0, a.jsx)(e6, {
                        handleSearchValueChange: function(e) {
                            U.eventStreamService.sendEvent(e4.filterFriendsByName, {
                                query: e
                            }), t(e), n(!1)
                        }
                    })
                })
            }
            _.FILTER_STATUS_OPTIONS, _.FILTER_STATUS_OPTIONS_DEFAULT, e5.propTypes = {
                translate: j().func.isRequired
            };
            var e7 = (0, h.withTranslations)(ea(e5), eo);

            function e9(e, r) {
                (null == r || r > e.length) && (r = e.length);
                for (var t = 0, n = Array(r); t < r; t++) n[t] = e[t];
                return n
            }
            var re = _.FRIENDTABS,
                rr = _.FRIEND_FILTER_OPTIONS,
                rt = U.dataStores.userDataStore.maxFriendRequestNotificationCount,
                rn = function(e) {
                    if (Array.isArray(e)) return e
                }(e = (0, P.createModal)()) || function(e) {
                    var r, t, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != n) {
                        var i = [],
                            a = !0,
                            o = !1;
                        try {
                            for (n = n.call(e); !(a = (r = n.next()).done) && (i.push(r.value), 2 !== i.length); a = !0);
                        } catch (e) {
                            o = !0, t = e
                        } finally {
                            try {
                                a || null == n.return || n.return()
                            } finally {
                                if (o) throw t
                            }
                        }
                        return i
                    }
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return e9(e, 2);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return e9(e, 2)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }(),
                ri = rn[0],
                ra = rn[1];

            function ro(e) {
                var r = e.translate,
                    t = e.title,
                    n = e.currentTab,
                    i = e.tooltipMsg,
                    o = e.declineAllFriendRequests,
                    s = e.refreshFriendsList,
                    u = e.isMyProfile,
                    d = e.updateFilter,
                    f = (0, l.useContext)(eZ),
                    p = f.friendsCount,
                    m = f.isTrustedFilterEnabled,
                    y = f.canAccessTrustedConnections,
                    h = f.trustedConnectionsAmpPolicyLoaded,
                    v = f.isTcManagementHubEnabled,
                    b = n === re.FRIENDREQUESTS && p > 0,
                    g = "(".concat(p, ")");
                return p >= rt && n !== re.FRIENDS && (g = "(".concat(rt, "+)")), (0, a.jsx)("div", {
                    children: (0, a.jsxs)("div", {
                        className: "container-header",
                        children: [(0, a.jsxs)("div", {
                            className: "friends-subtitle",
                            children: [(0, a.jsxs)("h2", {
                                children: [t, " ", g]
                            }), (0, a.jsx)(P.Tooltip, {
                                id: "friendsTooltip",
                                placement: "bottom",
                                content: i,
                                children: (0, a.jsx)("span", {
                                    className: "icon-moreinfo"
                                })
                            }), n === re.FRIENDS && !m && (0, a.jsx)(e7, {})]
                        }), n === re.FRIENDS && u && v && (0, a.jsxs)(c().Fragment, {
                            children: [(0, a.jsxs)("div", {
                                className: "chip-filters-container",
                                children: [(0, a.jsx)(eX, {
                                    text: r("Label.All"),
                                    isChecked: !m,
                                    onCheckedChange: function() {
                                        d(rr.ALL)
                                    }
                                }), (0, a.jsx)(eX, {
                                    text: r("TrustedConnection.Label.Trusted"),
                                    isChecked: m,
                                    onCheckedChange: function() {
                                        d(rr.TRUSTED)
                                    }
                                })]
                            }), m && h && (y ? (0, a.jsxs)("div", {
                                className: "education-text-container",
                                children: [(0, a.jsx)("span", {
                                    children: r("Description.DoMoreWithTrustedFriends")
                                }), "\xa0", (0, a.jsx)("a", {
                                    className: "learn-more-link",
                                    rel: "noreferrer",
                                    target: "_blank",
                                    href: "https://en.help.roblox.com/hc/articles/46158344285204",
                                    children: r("LinkText.LearnMore")
                                })]
                            }) : (0, a.jsx)("div", {
                                className: "education-text-container",
                                children: (0, a.jsx)("span", {
                                    children: r("Description.TrustedFriendsUnavailable")
                                })
                            }))]
                        }), b && (0, a.jsx)(P.Button, {
                            variant: "control",
                            size: "xs",
                            className: "ignore-button see-all-link",
                            onClick: function() {
                                return o().then(function(e) {
                                    e ? ra.open() : s()
                                })
                            },
                            children: r("Action.IgnoreAll")
                        }), (0, a.jsx)(ri, {
                            title: r("Action.IgnoreAll"),
                            body: r("Label.DeclineAllBackgrounded"),
                            neutralButtonText: r("Label.Ok")
                        })]
                    })
                })
            }
            ro.propTypes = {
                translate: j().func.isRequired,
                title: j().string.isRequired,
                currentTab: j().string.isRequired,
                tooltipMsg: j().string.isRequired,
                declineAllFriendRequests: j().func.isRequired,
                refreshFriendsList: j().func.isRequired,
                isMyProfile: j().bool.isRequired,
                updateFilter: j().func.isRequired
            };
            var rs = (0, h.withTranslations)(ea(ro), eo),
                ru = window.RobloxThumbnails,
                rl = window.RobloxPresence,
                rc = t.n(rl),
                rd = function(e) {
                    var r = e.children;
                    return (0, a.jsx)("div", {
                        className: "avatar-card-footer avatar-card-label",
                        children: r
                    })
                };

            function rf(e, r) {
                (null == r || r > e.length) && (r = e.length);
                for (var t = 0, n = Array(r); t < r; t++) n[t] = e[t];
                return n
            }

            function rp(e, r) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, r) {
                    var t, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var a = [],
                            o = !0,
                            s = !1;
                        try {
                            for (i = i.call(e); !(o = (t = i.next()).done) && (a.push(t.value), !r || a.length !== r); o = !0);
                        } catch (e) {
                            s = !0, n = e
                        } finally {
                            try {
                                o || null == i.return || i.return()
                            } finally {
                                if (s) throw n
                            }
                        }
                        return a
                    }
                }(e, r) || function(e, r) {
                    if (e) {
                        if ("string" == typeof e) return rf(e, r);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rf(e, r)
                    }
                }(e, r) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            rd.propTypes = {
                children: j().node.isRequired
            };
            var rm = _.FRIENDTABS,
                ry = _.EVENTS,
                rh = _.FRIENDS_REQUEST_LIST_CONTEXT,
                rv = _.PLUS_SIGN,
                rb = _.MUTUAL_FRIENDS_SHOW_COUNT,
                rg = _.UNAVAILABLE_FRIEND_NAME,
                rS = U.dataStores.userDataStore,
                rE = function(e) {
                    var r, t, n, i, o, s, u = e.id,
                        c = e.name,
                        d = e.displayName,
                        f = e.verifiedBadgeData,
                        p = e.isRobloxPlus,
                        m = e.isDeleted,
                        y = e.friendRequestSentFromInGame,
                        h = e.friendRequestSentFromQrCode,
                        v = e.friendRequestSentAt,
                        b = e.sourceUniverse,
                        g = e.mutualFriends,
                        S = (e.position, e.currentTab),
                        E = e.isMyProfile,
                        T = e.translate,
                        R = e.unfollowFriend,
                        F = e.unfriend,
                        w = e.followFriend,
                        C = e.acceptFriendRequestThenRemoveCard,
                        x = e.declineFriendRequestThenRemoveCard,
                        N = e.refreshFriendsList,
                        A = e.presence,
                        O = rp((0, l.useState)(!0), 2),
                        j = O[0],
                        D = O[1],
                        L = rp((0, l.useState)(!1), 2),
                        q = L[0],
                        M = L[1],
                        k = rp((0, l.useState)(!1), 2),
                        B = k[0],
                        G = k[1],
                        z = rp((0, l.useState)(""), 2),
                        Q = z[0],
                        H = z[1],
                        W = rp((0, l.useState)(""), 2),
                        V = W[0],
                        Y = W[1],
                        J = rp((0, l.useState)(!1), 2),
                        X = J[0],
                        $ = J[1],
                        K = function(e) {
                            return U.entityUrl.game.getRelativePath(e)
                        },
                        Z = S === rm.FOLLOWING && E && !X,
                        ee = S === rm.FRIENDREQUESTS && E,
                        et = S === rm.FRIENDS && m && E,
                        en = (r = u, "/users/".concat(r, "/profile")),
                        ei = (null == b ? void 0 : b.name) && (null == b ? void 0 : b.rootPlaceId),
                        ea = g.length > 0,
                        eo = (0, a.jsx)(rl.PresenceStatusLabel, {
                            userId: u,
                            translate: T,
                            linkUrlGetter: K,
                            linkClassNames: ["avatar-status-link", "text-link"]
                        }),
                        es = "",
                        eu = !1,
                        el = (0, l.useContext)(eZ).showJoinGameButtonInFriendCardDesktopOnly,
                        ec = (0, rl.usePresence)(u, A),
                        ed = rp((0, l.useState)(A.isPlayable), 2),
                        ef = ed[0],
                        ep = ed[1];
                    (0, l.useEffect)(function() {
                        ec.userPresenceType === rl.PresenceType.Game && (ec.universeId === A.universeId ? ep(A.isPlayable) : er.getGamePlayabilities([ec.universeId]).then(function(e) {
                            var r, t;
                            ep(null != (r = null == e || null == (t = e.data[0]) ? void 0 : t.isPlayable) && r)
                        }))
                    }, [ec]);
                    var em = ec.placeId,
                        ey = ec.gameId,
                        eh = function(e, r, t) {
                            I.GameLauncher.followPlayerIntoGame(r)
                        },
                        ev = rp((0, l.useState)(!1), 2),
                        eb = ev[0],
                        eg = ev[1];
                    (0, l.useEffect)(function() {
                        er.getTrustedConnectionStatus(u).then(function(e) {
                            eg(e.data.status === _.TRUSTED_FRIEND_STATUS.TrustedFriends)
                        })
                    }, [u]);
                    S === rm.FRIENDS || S === rm.FOLLOWING ? (ec.userPresenceType === rl.PresenceType.Game && (t = K(em), eu = (s = ef && el ? {
                        lastLocationLink: t,
                        truncateFirstLine: !0,
                        footer: (0, a.jsx)(P.Button, {
                            onClick: function() {
                                return eh(em, u, ey)
                            },
                            size: "sm",
                            width: "full",
                            variant: "growth",
                            children: T("Action.JoinGame")
                        })
                    } : {
                        lastLocationLink: t,
                        truncateFirstLine: !1,
                        footer: null
                    }).truncateFirstLine, o = s.footer), S !== rm.FOLLOWING || j || (es = T("Label.Unfollowed"))) : S === rm.FRIENDREQUESTS && (eo = "", ea ? (n = function(e) {
                        var r = e.slice(0, rb).map(function(e) {
                            return (0, a.jsx)("li", {
                                className: "text-overflow",
                                children: e
                            })
                        });
                        if (e.length > rb) {
                            var t = T("Message.More", {
                                plusSign: rv,
                                remainingCount: e.length - rb
                            });
                            r.push((0, a.jsx)("li", {
                                className: "text-overflow",
                                children: t
                            }))
                        }
                        return r
                    }(g), o = (0, a.jsx)(P.Tooltip, {
                        id: "mutual-friends-tooltip",
                        placement: "bottom",
                        content: n,
                        children: (0, a.jsx)("span", {
                            className: "mutual-friends-tooltip-label",
                            children: T("Label.WebMutualFriend", {
                                mutualConnectionsCount: g.length
                            })
                        })
                    })) : ei ? (i = K(b.rootPlaceId), o = (0, a.jsxs)(l.Fragment, {
                        children: [T("Label.SentFrom"), " ", (0, a.jsx)("a", {
                            href: i,
                            className: "text-link avatar-card-footer-link",
                            children: b.name
                        })]
                    })) : h && (o = T("Label.SentFromQrCode"))), m && (eo = T("Label.Inactive"));
                    var eS = (0, a.jsx)(ru.Thumbnail2d, {
                        type: ru.ThumbnailTypes.avatarHeadshot,
                        size: ru.DefaultThumbnailSize,
                        targetId: u,
                        includeProfileFrame: !0,
                        containerClass: "avatar-card-image"
                    });
                    return (0, l.useEffect)(function() {
                        I.CaptchaService.openCaptcha({
                            captchaActionType: "followUser",
                            captchaActivated: B,
                            captchaError: function() {
                                G(!1)
                            },
                            captchaSuccess: function(e) {
                                G(!1), w(u, e).then(function() {
                                    return D(!0)
                                })
                            },
                            captchaReturnTokenInSuccessCb: !0,
                            captchaDismissed: function() {
                                G(!1)
                            },
                            endCaptcha: function() {
                                G(!1)
                            },
                            inputParams: {
                                dataExchange: Q,
                                unifiedCaptchaId: V
                            }
                        })
                    }, [B]), (0, a.jsxs)(P.AvatarCardItem.Default, {
                        id: u,
                        disableCard: m || q || u < 0,
                        children: [(0, a.jsxs)(P.AvatarCardItem.Content, {
                            children: [(0, a.jsx)(P.AvatarCardItem.Headshot, {
                                imageLink: m ? "" : en,
                                statusIcon: (0, a.jsx)(rl.PresenceStatusIcon, {
                                    translate: T,
                                    userId: u
                                }),
                                thumbnail: eS
                            }), (0, a.jsx)(P.AvatarCardItem.Caption, {
                                name: null != c ? c : T(rg),
                                displayName: null != d ? d : T(rg),
                                nameLink: m ? "" : en,
                                labelFirstLine: eo,
                                labelSecondLine: es,
                                footer: o && (0, a.jsx)(rd, {
                                    children: o
                                }),
                                hasMenu: Z || et,
                                truncateFirstLine: eu,
                                verifiedBadgeData: f,
                                isRobloxPlus: p,
                                isTrustedConnection: eb
                            }), Z && (0, a.jsxs)(P.AvatarCardItem.Menu, {
                                children: [j && (0, a.jsx)(P.AvatarCardItem.MenuItem, {
                                    className: "friend-unfollow",
                                    title: T("Action.Unfollow"),
                                    onClick: function(e) {
                                        e.preventDefault(), R(u).then(function() {
                                            return D(!1)
                                        }), m && ($(!0), rS.clearUserDataStoreCache())
                                    }
                                }), !j && (0, a.jsx)(P.AvatarCardItem.MenuItem, {
                                    className: "friend-follow",
                                    title: T("Action.Follow"),
                                    onClick: function(e) {
                                        e.preventDefault(), w(u).then(function() {
                                            return D(!0)
                                        }, function(e) {
                                            var r = e.message;
                                            try {
                                                var t = JSON.parse(r);
                                                H(t.dxBlob), Y(t.unifiedCaptchaId)
                                            } catch (e) {
                                                H(r)
                                            }
                                            G(!0)
                                        })
                                    }
                                })]
                            }), et && (0, a.jsx)(P.AvatarCardItem.Menu, {
                                children: (0, a.jsx)(P.AvatarCardItem.MenuItem, {
                                    className: "friend-unfriend",
                                    title: T("Label.RemoveFriend"),
                                    onClick: function() {
                                        F(u).then(N)
                                    }
                                })
                            })]
                        }), ee && (0, a.jsxs)(P.AvatarCardItem.ButtonGroup, {
                            children: [(0, a.jsx)(P.Button, {
                                isLoading: q,
                                className: "ignore-friend",
                                onClick: function() {
                                    M(!0), x({
                                        id: u
                                    }).finally(function() {
                                        M(!1)
                                    })
                                },
                                variant: "secondary",
                                size: "md",
                                children: T("Action.Ignore")
                            }), (0, a.jsx)(P.Button, {
                                isLoading: q,
                                className: "accept-friend",
                                onClick: function() {
                                    M(!0), C({
                                        id: u
                                    }).then(function() {
                                        var e = {
                                            senderUserId: u,
                                            currentUserId: I.CurrentUser.userId,
                                            sentFromInGame: y,
                                            sentFromQrCode: h,
                                            timeFriendRequestWasSent: v
                                        };
                                        I.EventStream.SendEvent(ry.ACCEPTED_FRIEND_REQUEST, rh, e)
                                    }).finally(function() {
                                        M(!1)
                                    })
                                },
                                variant: "cta",
                                size: "md",
                                children: T("Action.Accept")
                            })]
                        })]
                    })
                };
            rE.defaultProps = {
                verifiedBadgeData: null,
                isRobloxPlus: !1,
                isDeleted: !1,
                friendRequestSentAt: null,
                sourceUniverse: null,
                mutualFriends: [],
                presence: {
                    universeId: void 0
                }
            }, rE.propTypes = {
                id: j().number.isRequired,
                name: j().string.isRequired,
                displayName: j().string.isRequired,
                verifiedBadgeData: j().shape({
                    hasVerifiedBadge: j().bool,
                    titleText: j().string
                }),
                isRobloxPlus: j().bool,
                isDeleted: j().bool,
                friendRequestSentFromInGame: j().bool.isRequired,
                friendRequestSentFromQrCode: j().bool.isRequired,
                friendRequestSentAt: j().string,
                sourceUniverse: j().shape({
                    name: j().string,
                    rootPlaceId: j().number
                }),
                mutualFriends: j().arrayOf(j().string),
                position: j().number.isRequired,
                currentTab: j().string.isRequired,
                isMyProfile: j().bool.isRequired,
                translate: j().func.isRequired,
                unfollowFriend: j().func.isRequired,
                unfriend: j().func.isRequired,
                followFriend: j().func.isRequired,
                acceptFriendRequestThenRemoveCard: j().func.isRequired,
                declineFriendRequestThenRemoveCard: j().func.isRequired,
                refreshFriendsList: j().func.isRequired,
                presence: j().shape({
                    isPlayable: j().bool.isRequired,
                    universeId: j().number
                })
            };
            var rT = (0, h.withTranslations)(ea(rE), eo),
                rR = _.FRIENDS_EMPTY;

            function rF(e) {
                var r = e.translate,
                    t = e.currentTab,
                    n = e.isMyProfile,
                    i = e.tooltipMsg,
                    o = e.title,
                    s = e.acceptFriendRequest,
                    u = e.declineFriendRequest,
                    c = e.refreshFriendsList,
                    d = e.setFriends,
                    f = e.updateFilter,
                    p = (0, l.useContext)(eZ),
                    m = p.paginatedFriends,
                    y = p.friendRequestIdToUniverseSourceMap,
                    h = [eu.UserProfileField.Names.CombinedName, eu.UserProfileField.Names.Username, eu.UserProfileField.IsVerified, eu.UserProfileField.IsDeleted],
                    v = (0, l.useMemo)(function() {
                        return m.map(function(e) {
                            return e.id
                        })
                    }, [m]),
                    b = (0, eu.useUserProfiles)(v, h).data,
                    g = eR(v).data,
                    S = function(e) {
                        return e(function(e) {
                            d(m.filter(function(r) {
                                return r.id !== e
                            }))
                        })
                    },
                    E = S(s),
                    T = S(u);
                return (0, a.jsxs)("div", {
                    className: "friends-content section",
                    children: [(0, a.jsx)(rs, {
                        title: o,
                        tooltipMsg: i,
                        currentTab: t,
                        isMyProfile: n,
                        refreshFriendsList: c,
                        updateFilter: f
                    }), m.length > 0 ? (0, a.jsx)(P.AvatarCardList, {
                        data: m,
                        children: function(e, r) {
                            var i, o, s, u, l, d, f, p, m;
                            return (0, a.jsx)(rT, {
                                currentTab: t,
                                isMyProfile: n,
                                refreshFriendsList: c,
                                position: r,
                                id: e.id,
                                name: null == b || null == (s = b[e.id]) ? void 0 : s.names.username,
                                displayName: null == b || null == (u = b[e.id]) ? void 0 : u.names.combinedName,
                                verifiedBadgeData: {
                                    hasVerifiedBadge: null != (i = null == b || null == (l = b[e.id]) ? void 0 : l.isVerified) && i
                                },
                                isRobloxPlus: (null == g ? void 0 : g[e.id]) === !0,
                                isDeleted: null != (o = null == b || null == (d = b[e.id]) ? void 0 : d.isDeleted) && o,
                                friendRequestSentFromInGame: (null == e || null == (f = e.friendRequest) ? void 0 : f.sourceUniverseId) !== null,
                                friendRequestSentFromQrCode: (null == e || null == (p = e.friendRequest) ? void 0 : p.originSourceType) === "QrCode",
                                friendRequestSentAt: null == e || null == (m = e.friendRequest) ? void 0 : m.sentAt,
                                sourceUniverse: (null == e ? void 0 : e.id) in y ? y[e.id] : null,
                                mutualFriends: (null == e ? void 0 : e.mutualFriendsList) || [],
                                presence: e.presence,
                                unfollowFriend: e.unfollowFriend,
                                unfriend: e.unfriend,
                                followFriend: e.followFriend,
                                acceptFriendRequestThenRemoveCard: E,
                                declineFriendRequestThenRemoveCard: T
                            }, r)
                        }
                    }) : (0, a.jsxs)("div", {
                        className: "section-content-off",
                        children: [" ", r(rR)]
                    })]
                })
            }
            rF.defaultProps = {}, rF.propTypes = {
                translate: j().func.isRequired,
                currentTab: j().string.isRequired,
                isMyProfile: j().bool.isRequired,
                tooltipMsg: j().string.isRequired,
                title: j().string.isRequired,
                acceptFriendRequest: j().func.isRequired,
                declineFriendRequest: j().func.isRequired,
                refreshFriendsList: j().func.isRequired,
                setFriends: j().func.isRequired,
                updateFilter: j().func.isRequired
            };
            var rI = (0, h.withTranslations)(ea(rF), eo);

            function rw(e, r, t) {
                return r in e ? Object.defineProperty(e, r, {
                    value: t,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[r] = t, e
            }
            var rC = _.FRIENDTABS,
                rx = {
                    friendshipDestroyed: "FriendshipDestroyed",
                    friendshipCreated: "FriendshipCreated",
                    friendshipDeclined: "FriendshipDeclined",
                    friendshipRequested: "FriendshipRequested"
                },
                rN = {
                    FRIENDS_NOTIFICATIONS: rx,
                    PRESENCE_NOTIFICATIONS: {
                        presenceChanged: "PresenceChanged"
                    },
                    FRIENDS_EVENT_TYPE: "FriendshipNotifications",
                    PRESENCE_EVENT_TYPE: "PresenceBulkNotifications",
                    TAB_EVENTS_MAP: (rw(i = {}, rC.FRIENDS, [rx.friendshipDestroyed, rx.friendshipCreated]), rw(i, rC.FRIENDREQUESTS, [rx.friendshipRequested, rx.friendshipDeclined, rx.friendshipCreated]), i)
                },
                rA = (I.EnvironmentUrls.accountSettingsApi, I.EnvironmentUrls.apiGatewayUrl);

            function rO(e, r, t, n, i, a, o) {
                try {
                    var s = e[a](o),
                        u = s.value
                } catch (e) {
                    t(e);
                    return
                }
                s.done ? r(u) : Promise.resolve(u).then(n, i)
            }

            function rj(e) {
                return function() {
                    var r = this,
                        t = arguments;
                    return new Promise(function(n, i) {
                        var a = e.apply(r, t);

                        function o(e) {
                            rO(a, n, i, o, s, "next", e)
                        }

                        function s(e) {
                            rO(a, n, i, o, s, "throw", e)
                        }
                        o(void 0)
                    })
                }
            }

            function rP(e, r) {
                var t, n, i, a = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    s = Object.defineProperty;
                return s(o, "next", {
                    value: u(0)
                }), s(o, "throw", {
                    value: u(1)
                }), s(o, "return", {
                    value: u(2)
                }), "function" == typeof Symbol && s(o, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), o;

                function u(s) {
                    return function(u) {
                        var l = [s, u];
                        if (t) throw TypeError("Generator is already executing.");
                        for (; o && (o = 0, l[0] && (a = 0)), a;) try {
                            if (t = 1, n && (i = 2 & l[0] ? n.return : l[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, l[1])).done) return i;
                            switch (n = 0, i && (l = [2 & l[0], i.value]), l[0]) {
                                case 0:
                                case 1:
                                    i = l;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: l[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, n = l[1], l = [0];
                                    continue;
                                case 7:
                                    l = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === l[0] && (!i || l[1] > i[0] && l[1] < i[3])) {
                                        a.label = l[1];
                                        break
                                    }
                                    if (6 === l[0] && a.label < i[1]) {
                                        a.label = i[1], i = l;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(l);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            l = r.call(e, a)
                        } catch (e) {
                            l = [6, e], n = 0
                        } finally {
                            t = i = 0
                        }
                        if (5 & l[0]) throw l[1];
                        return {
                            value: l[0] ? l[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function rD(e, r, t, n, i, a, o) {
                try {
                    var s = e[a](o),
                        u = s.value
                } catch (e) {
                    t(e);
                    return
                }
                s.done ? r(u) : Promise.resolve(u).then(n, i)
            }

            function rL(e) {
                return function() {
                    var r = this,
                        t = arguments;
                    return new Promise(function(n, i) {
                        var a = e.apply(r, t);

                        function o(e) {
                            rD(a, n, i, o, s, "next", e)
                        }

                        function s(e) {
                            rD(a, n, i, o, s, "throw", e)
                        }
                        o(void 0)
                    })
                }
            }

            function rU(e, r) {
                var t, n, i, a = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    s = Object.defineProperty;
                return s(o, "next", {
                    value: u(0)
                }), s(o, "throw", {
                    value: u(1)
                }), s(o, "return", {
                    value: u(2)
                }), "function" == typeof Symbol && s(o, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), o;

                function u(s) {
                    return function(u) {
                        var l = [s, u];
                        if (t) throw TypeError("Generator is already executing.");
                        for (; o && (o = 0, l[0] && (a = 0)), a;) try {
                            if (t = 1, n && (i = 2 & l[0] ? n.return : l[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, l[1])).done) return i;
                            switch (n = 0, i && (l = [2 & l[0], i.value]), l[0]) {
                                case 0:
                                case 1:
                                    i = l;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: l[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, n = l[1], l = [0];
                                    continue;
                                case 7:
                                    l = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === l[0] && (!i || l[1] > i[0] && l[1] < i[3])) {
                                        a.label = l[1];
                                        break
                                    }
                                    if (6 === l[0] && a.label < i[1]) {
                                        a.label = i[1], i = l;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(l);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            l = r.call(e, a)
                        } catch (e) {
                            l = [6, e], n = 0
                        } finally {
                            t = i = 0
                        }
                        if (5 & l[0]) throw l[1];
                        return {
                            value: l[0] ? l[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function r_(e, r, t, n, i, a, o) {
                try {
                    var s = e[a](o),
                        u = s.value
                } catch (e) {
                    t(e);
                    return
                }
                s.done ? r(u) : Promise.resolve(u).then(n, i)
            }

            function rq(e) {
                return function() {
                    var r = this,
                        t = arguments;
                    return new Promise(function(n, i) {
                        var a = e.apply(r, t);

                        function o(e) {
                            r_(a, n, i, o, s, "next", e)
                        }

                        function s(e) {
                            r_(a, n, i, o, s, "throw", e)
                        }
                        o(void 0)
                    })
                }
            }

            function rM(e, r) {
                var t, n, i, a = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    s = Object.defineProperty;
                return s(o, "next", {
                    value: u(0)
                }), s(o, "throw", {
                    value: u(1)
                }), s(o, "return", {
                    value: u(2)
                }), "function" == typeof Symbol && s(o, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), o;

                function u(s) {
                    return function(u) {
                        var l = [s, u];
                        if (t) throw TypeError("Generator is already executing.");
                        for (; o && (o = 0, l[0] && (a = 0)), a;) try {
                            if (t = 1, n && (i = 2 & l[0] ? n.return : l[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, l[1])).done) return i;
                            switch (n = 0, i && (l = [2 & l[0], i.value]), l[0]) {
                                case 0:
                                case 1:
                                    i = l;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: l[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, n = l[1], l = [0];
                                    continue;
                                case 7:
                                    l = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === l[0] && (!i || l[1] > i[0] && l[1] < i[3])) {
                                        a.label = l[1];
                                        break
                                    }
                                    if (6 === l[0] && a.label < i[1]) {
                                        a.label = i[1], i = l;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(l);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            l = r.call(e, a)
                        } catch (e) {
                            l = [6, e], n = 0
                        } finally {
                            t = i = 0
                        }
                        if (5 & l[0]) throw l[1];
                        return {
                            value: l[0] ? l[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function rk(e, r, t, n, i, a, o) {
                try {
                    var s = e[a](o),
                        u = s.value
                } catch (e) {
                    t(e);
                    return
                }
                s.done ? r(u) : Promise.resolve(u).then(n, i)
            }

            function rB(e) {
                return function() {
                    var r = this,
                        t = arguments;
                    return new Promise(function(n, i) {
                        var a = e.apply(r, t);

                        function o(e) {
                            rk(a, n, i, o, s, "next", e)
                        }

                        function s(e) {
                            rk(a, n, i, o, s, "throw", e)
                        }
                        o(void 0)
                    })
                }
            }

            function rG(e) {
                for (var r = 1; r < arguments.length; r++) {
                    var t = null != arguments[r] ? arguments[r] : {},
                        n = Object.keys(t);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(t).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(t, e).enumerable
                    }))), n.forEach(function(r) {
                        var n;
                        n = t[r], r in e ? Object.defineProperty(e, r, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[r] = n
                    })
                }
                return e
            }

            function rz(e, r) {
                return r = null != r ? r : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(r)) : (function(e) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var t = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, t)
                    }
                    return r
                })(Object(r)).forEach(function(t) {
                    Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(r, t))
                }), e
            }

            function rQ(e, r) {
                var t, n, i, a = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    s = Object.defineProperty;
                return s(o, "next", {
                    value: u(0)
                }), s(o, "throw", {
                    value: u(1)
                }), s(o, "return", {
                    value: u(2)
                }), "function" == typeof Symbol && s(o, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), o;

                function u(s) {
                    return function(u) {
                        var l = [s, u];
                        if (t) throw TypeError("Generator is already executing.");
                        for (; o && (o = 0, l[0] && (a = 0)), a;) try {
                            if (t = 1, n && (i = 2 & l[0] ? n.return : l[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, l[1])).done) return i;
                            switch (n = 0, i && (l = [2 & l[0], i.value]), l[0]) {
                                case 0:
                                case 1:
                                    i = l;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: l[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, n = l[1], l = [0];
                                    continue;
                                case 7:
                                    l = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === l[0] && (!i || l[1] > i[0] && l[1] < i[3])) {
                                        a.label = l[1];
                                        break
                                    }
                                    if (6 === l[0] && a.label < i[1]) {
                                        a.label = i[1], i = l;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(l);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            l = r.call(e, a)
                        } catch (e) {
                            l = [6, e], n = 0
                        } finally {
                            t = i = 0
                        }
                        if (5 & l[0]) throw l[1];
                        return {
                            value: l[0] ? l[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var rH = U.dataStores.userDataStore,
                rW = _.MAX_PER_PAGE,
                rV = _.FRIENDTABS,
                rY = _.SORT_ORDER,
                rJ = _.CACHE_CRITERIA,
                rX = rN.TAB_EVENTS_MAP,
                r$ = rN.FRIENDS_EVENT_TYPE,
                rK = !I.CurrentUser.isAuthenticated,
                rZ = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : rJ;
                    return rz(rG({}, e), {
                        CACHE_CRITERIA: rJ
                    })
                };

            function r0(e, r) {
                (null == r || r > e.length) && (r = e.length);
                for (var t = 0, n = Array(r); t < r; t++) n[t] = e[t];
                return n
            }

            function r1(e, r) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, r) {
                    var t, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var a = [],
                            o = !0,
                            s = !1;
                        try {
                            for (i = i.call(e); !(o = (t = i.next()).done) && (a.push(t.value), !r || a.length !== r); o = !0);
                        } catch (e) {
                            s = !0, n = e
                        } finally {
                            try {
                                o || null == i.return || i.return()
                            } finally {
                                if (s) throw n
                            }
                        }
                        return a
                    }
                }(e, r) || function(e, r) {
                    if (e) {
                        if ("string" == typeof e) return r0(e, r);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return r0(e, r)
                    }
                }(e, r) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var r2 = function(e) {
                    var r = e.currentTab,
                        t = e.profileUserId,
                        n = e.currentCursor,
                        i = e.useCache,
                        a = e.refreshCache,
                        o = e.fetchMutualFriends,
                        s = e.isMyProfile,
                        u = void 0 !== s && s,
                        l = e.friendsNameFilter,
                        c = void 0 === l ? null : l,
                        d = e.queryChanged,
                        f = void 0 !== d && d,
                        p = e.isTrustedFilterEnabled,
                        m = void 0 === p ? null : p,
                        y = new Promise(function() {
                            return {
                                friendsData: []
                            }
                        }),
                        h = function(e) {
                            var r = e.userData,
                                t = e.prevCursor,
                                n = e.nextCursor,
                                i = [];
                            if (r && r.length > 0)
                                for (var a = 0; a < r.length; a++) {
                                    var o, s, u = null == (s = r[a]) || null == (o = s.presence) ? void 0 : o.universeId;
                                    u && i.push(u)
                                }
                            return i.length > 0 ? er.getGamePlayabilities(i).then(function(e) {
                                var i = e.data,
                                    a = {};
                                if (i && i.length)
                                    for (var o = 0; o < i.length; o++) {
                                        var s = i[o];
                                        a[s.universeId] = s.isPlayable
                                    }
                                return r.forEach(function(e) {
                                    e.presence && (e.presence.isPlayable = a[e.presence.universeId])
                                }), {
                                    friendsData: r,
                                    prev: t,
                                    next: n
                                }
                            }).catch(function() {
                                return {
                                    friendsData: r,
                                    prev: t,
                                    next: n
                                }
                            }) : {
                                friendsData: r,
                                prev: t,
                                next: n
                            }
                        },
                        v = function(e) {
                            var r = e.userData,
                                t = e.prevCursor,
                                n = e.nextCursor;
                            return rB(function() {
                                var e;
                                return rQ(this, function(i) {
                                    switch (i.label) {
                                        case 0:
                                            return i.trys.push([0, 2, , 3]), [4, rc().getPresenceProvider().getPresences(r.map(function(e) {
                                                return e.id
                                            }))];
                                        case 1:
                                            return e = new Map(i.sent().map(function(e) {
                                                return [e.userId, e]
                                            })), [2, {
                                                userData: r.map(function(r) {
                                                    var t;
                                                    return rz(rG({}, r), {
                                                        presence: null != (t = e.get(r.id)) ? t : {}
                                                    })
                                                }),
                                                prevCursor: t,
                                                nextCursor: n
                                            }];
                                        case 2:
                                            return i.sent(), [2, {
                                                userData: r,
                                                prevCursor: t,
                                                nextCursor: n
                                            }];
                                        case 3:
                                            return [2]
                                    }
                                })
                            })()
                        },
                        b = function(e) {
                            var r = e.userData,
                                n = e.prevCursor,
                                i = e.nextCursor;
                            return rB(function() {
                                return rQ(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            return [4, rB(function() {
                                                return rQ(this, function(e) {
                                                    switch (e.label) {
                                                        case 0:
                                                            if (u) return [2, !1];
                                                            return [4, rq(function() {
                                                                var e;
                                                                return rM(this, function(r) {
                                                                    switch (r.label) {
                                                                        case 0:
                                                                            var n;
                                                                            return r.trys.push([0, 2, , 3]), [4, (n = [parseInt(t, 10)], rj(function() {
                                                                                var e;
                                                                                return rP(this, function(r) {
                                                                                    switch (r.label) {
                                                                                        case 0:
                                                                                            if (Number.isNaN(e = parseInt(I.CurrentUser.userId, 10)) || !e) return [2, {
                                                                                                users: [{
                                                                                                    isBlocked: !1,
                                                                                                    isBlockingViewer: !1,
                                                                                                    userId: 0
                                                                                                }]
                                                                                            }];
                                                                                            return [4, H.httpService.post({
                                                                                                url: "".concat(rA, "/user-blocking-api/v1/users/batch-check-reciprocal-block"),
                                                                                                withCredentials: !0
                                                                                            }, {
                                                                                                userIds: n,
                                                                                                requesterUserId: e
                                                                                            })];
                                                                                        case 1:
                                                                                            return [2, r.sent().data]
                                                                                    }
                                                                                })
                                                                            })())];
                                                                        case 1:
                                                                            if ((null == (e = r.sent()) ? void 0 : e.users) && e.users.length > 0) return [2, e.users[0].isBlockingViewer];
                                                                            return [3, 3];
                                                                        case 2:
                                                                            return console.debug(r.sent()), [3, 3];
                                                                        case 3:
                                                                            return [2, !0]
                                                                    }
                                                                })
                                                            })()];
                                                        case 1:
                                                            if (e.sent()) return [2, !0];
                                                            return [2, rq(function() {
                                                                var e;
                                                                return rM(this, function(r) {
                                                                    switch (r.label) {
                                                                        case 0:
                                                                            var n;
                                                                            return r.trys.push([0, 2, , 3]), [4, (n = [{
                                                                                name: "vieweeUserId",
                                                                                type: "UserId",
                                                                                value: "".concat(t)
                                                                            }], rL(function() {
                                                                                var e;
                                                                                return rU(this, function(r) {
                                                                                    switch (r.label) {
                                                                                        case 0:
                                                                                            return e = X("MustHideConnections", n ? btoa(JSON.stringify(n)) : null, void 0), [4, H.httpService.get(e)];
                                                                                        case 1:
                                                                                            return [2, r.sent().data]
                                                                                    }
                                                                                })
                                                                            })())];
                                                                        case 1:
                                                                            return [2, (null == (e = r.sent()) ? void 0 : e.access) === "Granted"];
                                                                        case 2:
                                                                            return console.debug(r.sent()), [3, 3];
                                                                        case 3:
                                                                            return [2, !0]
                                                                    }
                                                                })
                                                            })()]
                                                    }
                                                })
                                            })()];
                                        case 1:
                                            if (e.sent()) return [2, {
                                                userData: [],
                                                prevCursor: null,
                                                nextCursor: null
                                            }];
                                            return [2, {
                                                userData: r,
                                                prevCursor: n,
                                                nextCursor: i
                                            }]
                                    }
                                })
                            })()
                        },
                        g = rZ({
                            useCache: i,
                            refreshCache: void 0 !== a && a
                        });
                    switch (r) {
                        case rV.FRIENDS:
                            y = null == c || "" === c ? (null === m || !1 === m ? er.getPaginatedFriends : er.getPaginatedTrustedConnections)(t, 0 === n || f ? "" : n, u, f).then(function(e) {
                                return {
                                    userData: e.data.PageItems,
                                    prevCursor: e.data.PreviousCursor,
                                    nextCursor: e.data.NextCursor
                                }
                            }).then(b).then(v).then(h) : er.getSearchedFriends(t, 0 === n || f ? "" : n, c, f).then(function(e) {
                                return {
                                    userData: e.data.PageItems,
                                    prevCursor: e.data.PreviousCursor,
                                    nextCursor: e.data.NextCursor
                                }
                            }).then(b).then(v).then(h);
                            break;
                        case rV.FOLLOWERS:
                            y = rH.getFollowers({
                                userId: t,
                                cursor: n,
                                sortOrder: rY.desc,
                                limit: rW,
                                isGuest: rK
                            }, g).then(b).then(h);
                            break;
                        case rV.FOLLOWING:
                            y = rH.getFollowings({
                                userId: t,
                                cursor: n,
                                sortOrder: rY.desc,
                                limit: rW,
                                isGuest: rK
                            }, g).then(b).then(h);
                            break;
                        case rV.FRIENDREQUESTS:
                            (0 === n || f) && er.clearNewFriendRequests(), y = rH.getFriendsRequests({
                                userId: t,
                                cursor: n,
                                limit: rW,
                                fetchMutualFriends: void 0 !== o && o,
                                isGuest: rK
                            }, g).then(h)
                    }
                    return y.catch(console.debug)
                },
                r3 = function(e, r) {
                    if (rK) return function() {};
                    var t = function(t) {
                            t && t.Type && rX[e].includes(t.Type) && r(t.Type)
                        },
                        n = I.RealTime.Factory.GetClient();
                    return n.Subscribe(r$, t),
                        function() {
                            n.Unsubscribe(r$, t)
                        }
                },
                r6 = _.START_PAGE,
                r8 = _.MAX_PER_PAGE,
                r4 = _.FRIENDTABS,
                r5 = _.SORT_OPTIONS,
                r7 = _.EVENTS,
                r9 = _.FRIENDS_REQUEST_LIST_CONTEXT,
                te = _.DEVICE_TYPES,
                tr = _.FRIEND_FILTER_OPTIONS;

            function tt(e) {
                var r = e.currentTab,
                    t = e.metadata,
                    n = t.profileUserId,
                    i = t.isMyProfile,
                    o = t.onlyShowContents,
                    s = e.friends,
                    u = e.setFriends,
                    d = e.loadMoreFriends,
                    f = e.tooltipMsg,
                    p = e.title,
                    m = e.enableTabLoader,
                    y = e.disableTabLoader;
                e.tabLoader;
                var h = r1((0, l.useState)(r6), 2),
                    v = h[0],
                    b = h[1],
                    g = r1((0, l.useState)(0), 2),
                    S = g[0],
                    E = g[1],
                    T = r1((0, l.useState)(null), 2),
                    R = T[0],
                    F = T[1],
                    w = (0, l.useContext)(eZ),
                    C = w.friendsCount,
                    x = w.setFriendsCount,
                    N = w.friendsNameFilter,
                    A = w.setFriendsNameFilter,
                    O = w.friendsStatusFilter,
                    j = w.setFriendsStatusFilter,
                    D = w.friendsSort,
                    L = w.paginatedFriends,
                    U = w.setPaginatedFriends,
                    _ = w.setFriendRequestIdToUniverseSourceMap,
                    q = w.isTrustedFilterEnabled,
                    M = w.setIsTrustedFilterEnabled,
                    k = es.deviceMeta.getDeviceMeta(),
                    B = (null == k ? void 0 : k.isDesktop) && (null == k ? void 0 : k.deviceType) === te.computer;
                (0, l.useEffect)(function() {
                    if (r === r4.FRIENDREQUESTS && 0 !== L.length) {
                        var e = L.filter(function(e) {
                            return e && e.friendRequest && e.friendRequest.sourceUniverseId
                        }).map(function(e) {
                            return e.friendRequest.sourceUniverseId
                        });
                        0 !== e.length && er.getGames(e).then(function(e) {
                            var r;
                            if (null == e || null == (r = e.data) ? void 0 : r.data) {
                                var t = e.data.data;
                                _(L.reduce(function(e, r) {
                                    var n;
                                    if (null == r || null == (n = r.friendRequest) ? void 0 : n.sourceUniverseId) {
                                        var i = r.friendRequest.sourceUniverseId,
                                            a = t.find(function(e) {
                                                return e.id === i
                                            });
                                        a && (e[r.id] = a)
                                    }
                                    return e
                                }, {}))
                            }
                        })
                    }
                }, [L, r]), r === r4.FRIENDS && (D === r5.ALPHABETICAL ? s.sort(function(e, r) {
                    return e.displayName.toLowerCase() < r.displayName.toLowerCase() ? -1 : +(e.displayName.toLowerCase() > r.displayName.toLowerCase())
                }) : D === r5.STATUS && s.sort(function(e, r) {
                    if (e.presence.userPresenceType === r.presence.userPresenceType) {
                        if (e.displayName.toLowerCase() < r.displayName.toLowerCase()) return -1;
                        if (e.displayName.toLowerCase() > r.displayName.toLowerCase()) return 1
                    }
                    return 2 === e.presence.userPresenceType ? -1 : 2 === r.presence.userPresenceType || e.presence.userPresenceType < r.presence.userPresenceType ? 1 : e.presence.userPresenceType > r.presence.userPresenceType ? -1 : 0
                }));
                var G = function(e, t) {
                        if (r === r4.FRIENDREQUESTS) {
                            var i = t.slice((e - 1) * r8, e * r8).length,
                                a = {
                                    currentUserId: parseInt(n, 10),
                                    pageNumber: e,
                                    numberOfFriendRequestsCurrentlyDisplayed: i
                                };
                            I.EventStream.SendEvent(r7.FRIEND_REQUESTS_DISPLAYED, r9, a);
                            var o = t.map(function(e) {
                                    return e.friendRequest.senderId
                                }).join("%2c"),
                                s = t.map(function(e) {
                                    return e.mutualFriendsList && e.mutualFriendsList.length > 0 ? "T" : "F"
                                }).join("%2c"),
                                u = t.map(function(e) {
                                    return e.friendRequest && e.friendRequest.sourceUniverseId ? "T" : "F"
                                }).join("%2c"),
                                l = Array.from({
                                    length: t.length
                                }, function(e, r) {
                                    return r + 1
                                }).join("%2c");
                            I.EventStream.SendEvent(r7.FRIENDS_LANDING_PAGE_LOAD, "friendsLanding", {
                                target: "www",
                                requestingUserId: o,
                                mutualFriendsContext: s,
                                gamesContext: u,
                                absPosition: l
                            })
                        }
                    },
                    z = s.slice((v - 1) * r8, v * r8);
                (0, l.useEffect)(function() {
                    JSON.stringify(L) !== JSON.stringify(z) && U(z)
                }, [s, N, O, D, v]);
                var Q = r1((0, l.useState)(JSON.stringify(s)), 2),
                    H = Q[0],
                    W = Q[1],
                    V = Math.max(Math.ceil(s.length / r8), 1),
                    Y = R || v > r6 || V > 1 || C > r8,
                    J = !!R || v < V;
                v > V && b(V);
                var X = function() {
                        m();
                        var e = function(e) {
                            var r = e.friendsData,
                                t = e.next;
                            u(r), F(t), y()
                        };
                        r2({
                            currentTab: r4.FRIENDS,
                            profileUserId: n,
                            useCache: !1,
                            refreshCache: !0,
                            isMyProfile: i,
                            friendsNameFilter: N,
                            isTrustedFilterEnabled: q
                        }).then(function(t) {
                            r4.FRIENDS === r && e(t)
                        }), r2({
                            currentTab: r4.FRIENDREQUESTS,
                            profileUserId: n,
                            currentCursor: S,
                            useCache: !1,
                            refreshCache: !0,
                            isMyProfile: i,
                            friendsNameFilter: N
                        }).then(function(t) {
                            r4.FRIENDREQUESTS === r && e(t)
                        })
                    },
                    $ = (0, l.useCallback)(function(e) {
                        u([]), F(null), E(0), A(null), M(e === tr.TRUSTED)
                    }, []);
                return (0, l.useEffect)(function() {
                    m(), u([]), x(0), A(null), j(null)
                }, []), (0, l.useEffect)(function() {
                    if (null != N) {
                        b(r6), F(null);
                        var e = !0;
                        m();
                        var t = r3(r, X);
                        return r2({
                                currentTab: r,
                                profileUserId: n,
                                currentCursor: S,
                                useCache: !1,
                                isMyProfile: i,
                                friendsNameFilter: N,
                                queryChanged: !0
                            }).then(function(r) {
                                var t = r.friendsData,
                                    n = r.next;
                                e && (u(t), F(n), y(), G(v, t))
                            }),
                            function() {
                                e = !1, t()
                            }
                    }
                    return function() {}
                }, [N]), (0, l.useEffect)(function() {
                    var e = !0;
                    m();
                    var t = r3(r, X);
                    return r2({
                            currentTab: r,
                            profileUserId: n,
                            currentCursor: S,
                            useCache: !1,
                            isMyProfile: i,
                            friendsNameFilter: N,
                            isTrustedFilterEnabled: q
                        }).then(function(r) {
                            var t = r.friendsData,
                                n = r.next;
                            e && (d(t), F(n), y(), G(v, t))
                        }),
                        function() {
                            e = !1, t()
                        }
                }, [r, S, n, q]), (0, l.useEffect)(function() {
                    R && !S && E(R)
                }, [R, S]), (0, l.useEffect)(function() {
                    var e = !0,
                        t = JSON.stringify(s);
                    if (H !== t) switch (W(t), r) {
                        case r4.FRIENDS:
                            er.getFriendsCount(n).then(function(r) {
                                var t = r.data.count;
                                e && x(t)
                            });
                            break;
                        case r4.FOLLOWING:
                            er.getFollowingsCount(n).then(function(r) {
                                var t = r.data.count;
                                e && x(t)
                            });
                            break;
                        case r4.FOLLOWERS:
                            er.getFollowersCount(n).then(function(r) {
                                var t = r.data.count;
                                e && x(t)
                            });
                            break;
                        case r4.FRIENDREQUESTS:
                            i && er.getFriendsRequestCount().then(function(r) {
                                var t = r.data.count;
                                if (e) {
                                    x(t);
                                    var i = {
                                        currentUserId: parseInt(n, 10),
                                        numberOfFriendRequests: t
                                    };
                                    I.EventStream.SendEvent(r7.TOTAL_FRIEND_REQUESTS_RETRIEVED, r9, i)
                                }
                            })
                    }
                    return function() {
                        e = !1
                    }
                }, [r, s]), (0, a.jsxs)(c().Fragment, {
                    children: [(0, a.jsx)(rI, {
                        isMyProfile: i,
                        tooltipMsg: f,
                        title: p,
                        currentTab: r,
                        onlyShowContents: o,
                        refreshFriendsList: X,
                        updateFilter: $
                    }), Y && (0, a.jsx)(P.Pagination, {
                        current: v,
                        hasNext: J,
                        onChange: function(e) {
                            e > v && e >= V && R && E(R || 0), b(e), G(e, s)
                        }
                    }), r === r4.FRIENDREQUESTS && !B && (0, a.jsx)("div", {
                        className: Y ? "mutual-friends-extra-padding-with-pagination" : "mutual-friends-extra-padding-without-pagination"
                    })]
                })
            }
            tt.defaultProps = {
                friends: []
            }, tt.propTypes = {
                friends: j().arrayOf(j().any),
                setFriends: j().func.isRequired,
                loadMoreFriends: j().func.isRequired,
                metadata: j().objectOf(j().any).isRequired,
                tooltipMsg: j().string.isRequired,
                title: j().string.isRequired,
                currentTab: j().string.isRequired,
                enableTabLoader: j().func.isRequired,
                disableTabLoader: j().func.isRequired,
                tabLoader: j().objectOf(j().any).isRequired
            };
            var tn = ea(tt),
                ti = function(e) {
                    var r = e.title,
                        t = e.show;
                    return (0, a.jsx)("div", {
                        className: "page-header section",
                        children: t && (0, a.jsx)("div", {
                            className: "container-header",
                            children: (0, a.jsx)("h1", {
                                className: "friends-title",
                                children: r
                            })
                        })
                    })
                };
            ti.propTypes = {
                title: j().string.isRequired,
                show: j().bool.isRequired
            };
            var ta = I.EnvironmentUrls.apiGatewayUrl,
                to = function(e) {
                    var r = {
                        parameters: e.join(",")
                    };
                    return H.httpService.get({
                        url: "".concat(ta, "/product-experimentation-platform/v1/projects/1/layers/Social.Friends/values"),
                        timeout: 2e3,
                        withCredentials: !0
                    }, r)
                },
                ts = ((r = ts || {}).FriendRecommendationSource = "friend_recommendation_source", r.JoinButtonFriendCard = "show_join_game_button_in_friend_card", r.JoinButtonFriendCardDesktopOnly = "show_join_game_button_in_friend_card_desktop_only", r.TcManagementHub = "show_tc_management_hub", r),
                tu = "friendRecommendations",
                tl = function(e, r, t) {
                    I.EventStream.SendEvent(tu, "displayed", {
                        uid: e,
                        numberOfRecommendations: t,
                        variant: r
                    })
                },
                tc = function(e, r) {
                    I.EventStream.SendEvent(tu, "accept", {
                        uid: e,
                        recipientId: r
                    })
                },
                td = function(e, r) {
                    I.EventStream.SendEvent(tu, "request", {
                        uid: e,
                        recipientId: r
                    })
                },
                tf = I.EnvironmentUrls.friendsApi,
                tp = function(e) {
                    var r = {
                        retryable: !0,
                        withCredentials: !0,
                        url: "".concat(tf, "/v1/users/").concat(e, "/friends/recommendations")
                    };
                    return H.httpService.get(r).then(function(e) {
                        return e.data.data.map(function(e) {
                            return {
                                userName: e.name,
                                displayName: e.displayName,
                                userId: e.id,
                                pendingRequest: null != e.friendRequest,
                                mutualFriendsList: e.mutualFriendsList
                            }
                        })
                    })
                },
                tm = function(e, r) {
                    var t, n, i, a;
                    return r ? (t = {
                        retryable: !1,
                        withCredentials: !0,
                        url: "".concat(tf, "/v1/users/").concat(e, "/accept-friend-request")
                    }, (n = H.httpService.post(t)).then(function() {
                        return tc(I.CurrentUser.userId, e)
                    }, function() {}), n) : (i = {
                        retryable: !1,
                        withCredentials: !0,
                        url: "".concat(tf, "/v1/users/").concat(e, "/request-friendship")
                    }, (a = H.httpService.post(i, {
                        friendshipOriginSourceType: "recommendations"
                    })).then(function() {
                        return td(I.CurrentUser.userId, e)
                    }, function() {}), a)
                },
                ty = function(e) {
                    var r = {
                        retryable: !0,
                        withCredentials: !0,
                        url: "".concat(tf, "/v1/users/").concat(e, "/friends/count")
                    };
                    return H.httpService.get(r)
                };

            function th(e, r) {
                (null == r || r > e.length) && (r = e.length);
                for (var t = 0, n = Array(r); t < r; t++) n[t] = e[t];
                return n
            }
            var tv = c().useState,
                tb = _.PLUS_SIGN,
                tg = _.MUTUAL_FRIENDS_SHOW_COUNT;

            function tS(e) {
                var r, t, n = e.userId,
                    i = e.userName,
                    o = e.displayName,
                    s = e.pendingRequest,
                    u = e.mutualFriends,
                    l = e.setError,
                    c = e.translate,
                    d = function(e) {
                        if (Array.isArray(e)) return e
                    }(r = tv(!1)) || function(e) {
                        var r, t, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var i = [],
                                a = !0,
                                o = !1;
                            try {
                                for (n = n.call(e); !(a = (r = n.next()).done) && (i.push(r.value), 2 !== i.length); a = !0);
                            } catch (e) {
                                o = !0, t = e
                            } finally {
                                try {
                                    a || null == n.return || n.return()
                                } finally {
                                    if (o) throw t
                                }
                            }
                            return i
                        }
                    }(r) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return th(e, 2);
                            var r = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                            if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return th(e, 2)
                        }
                    }(r) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    f = d[0],
                    p = d[1],
                    m = null != u && u.length > 0;
                return (0, a.jsxs)("div", {
                    className: "friend-recommendation-item",
                    children: [(0, a.jsxs)("a", {
                        href: I.Endpoints.getAbsoluteUrl("/users/".concat(n, "/profile")),
                        className: "friend-recommendation-link",
                        children: [(0, a.jsx)("span", {
                            className: "avatar-container avatar-headshot text-link",
                            children: (0, a.jsx)(ru.Thumbnail2d, {
                                type: ru.ThumbnailTypes.avatarHeadshot,
                                size: ru.ThumbnailAvatarHeadshotSize.size96,
                                targetId: n,
                                includeProfileFrame: !0,
                                imgClassName: "avatar-card-image"
                            })
                        }), (0, a.jsxs)("div", {
                            className: "friend-recommendation-info",
                            children: [(0, a.jsx)("span", {
                                className: "text-overflow friend-name font-caption-header friend-recommendation-name",
                                children: o
                            }), (0, a.jsx)("span", {
                                className: "text-overflow text-secondary friend-recommendation-name",
                                children: H.concatTexts.concat(["", i], H.concatTexts.connectors.at, !1)
                            }), s && f ? (0, a.jsx)("span", {
                                className: "text-overflow text-secondary friend-recommendation-name",
                                children: c("Label.YouAreFriends")
                            }) : m && (t = function(e) {
                                var r = e.slice(0, tg).map(function(e) {
                                    return (0, a.jsx)("li", {
                                        className: "text-overflow",
                                        children: e
                                    })
                                });
                                if (e.length > tg) {
                                    var t = c("Message.More", {
                                        plusSign: tb,
                                        remainingCount: e.length - tg
                                    });
                                    r.push((0, a.jsx)("li", {
                                        className: "text-overflow",
                                        children: t
                                    }))
                                }
                                return r
                            }(u), (0, a.jsx)(P.Tooltip, {
                                id: "mutual-friends-tooltip",
                                placement: "bottom",
                                content: t,
                                children: (0, a.jsx)("span", {
                                    className: "text-overflow text-secondary mutual-friends-tooltip-label friend-recommendation-name",
                                    children: c("Label.MutualFriend", {
                                        mutualFriendsCount: u.length
                                    })
                                })
                            }))]
                        })]
                    }), !(s && f) && (0, a.jsx)("button", {
                        type: "button",
                        className: L()("btn-control-md full-size add-friend-button ", {
                            disabled: f
                        }),
                        onClick: function() {
                            l(""), tm(n, s).then(function() {
                                return p(!0)
                            }, function(e) {
                                var r, t;
                                (null == e || null == (t = e.data) || null == (r = t.errors[0]) ? void 0 : r.userFacingMessage) ? l(e.data.errors[0].userFacingMessage): l(c("Label.MiscError"))
                            })
                        },
                        children: (0, a.jsx)("span", {
                            className: f ? "icon-sandglass" : s ? "icon-acceptfriend" : "icon-addfriend"
                        })
                    })]
                })
            }

            function tE(e, r) {
                (null == r || r > e.length) && (r = e.length);
                for (var t = 0, n = Array(r); t < r; t++) n[t] = e[t];
                return n
            }

            function tT(e, r) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, r) {
                    var t, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var a = [],
                            o = !0,
                            s = !1;
                        try {
                            for (i = i.call(e); !(o = (t = i.next()).done) && (a.push(t.value), !r || a.length !== r); o = !0);
                        } catch (e) {
                            s = !0, n = e
                        } finally {
                            try {
                                o || null == i.return || i.return()
                            } finally {
                                if (s) throw n
                            }
                        }
                        return a
                    }
                }(e, r) || function(e, r) {
                    if (e) {
                        if ("string" == typeof e) return tE(e, r);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tE(e, r)
                    }
                }(e, r) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            tS.defaultProps = {
                mutualFriends: []
            }, tS.propTypes = {
                userId: j().number.isRequired,
                userName: j().string.isRequired,
                displayName: j().string.isRequired,
                pendingRequest: j().bool.isRequired,
                mutualFriends: j().arrayOf(j().string),
                setError: j().func.isRequired,
                translate: j().func.isRequired
            };
            var tR = c().useState,
                tF = c().useEffect,
                tI = c().useRef;

            function tw(e) {
                var r = e.friendRecommendations,
                    t = e.translate,
                    n = e.setError,
                    i = e.cardWidth,
                    o = e.contentWidth,
                    s = tT(tR(0), 2),
                    u = s[0],
                    l = s[1],
                    c = tT(tR(0), 2),
                    d = c[0],
                    f = c[1],
                    p = tT(tR(!1), 2),
                    m = p[0],
                    y = p[1],
                    h = tT(tR(!0), 2),
                    v = h[0],
                    b = h[1],
                    g = tT(tR(-1), 2),
                    S = g[0],
                    E = g[1],
                    T = tI(null),
                    R = tI(null),
                    F = function() {
                        return Math.floor(o(T) / i(R))
                    };
                tF(function() {
                    i(R) && f(-u * i(R))
                }, [u, S]), tF(function() {
                    y(i(R) && i(R) * r.length > o(T))
                }, [i.current, o.current, S]), tF(function() {
                    !m && u > 0 && l(0)
                }, [m, u]), tF(function() {
                    window.addEventListener("resize", function() {
                        E(window.innerWidth), b(!1)
                    }), E(0)
                }, []);
                var I = [];
                r.forEach(function(e) {
                    I.push((0, a.jsx)("li", {
                        ref: R,
                        "data-user-id": e.userId,
                        className: "list-item friend-recommendations-list-item",
                        children: (0, a.jsx)(tS, {
                            userId: e.userId,
                            userName: e.userName,
                            displayName: e.displayName,
                            pendingRequest: e.pendingRequest,
                            mutualFriends: e.mutualFriendsList,
                            setError: n,
                            translate: t
                        })
                    }))
                });
                var w = function(e) {
                        i(R) && (e ? l(Math.max(0, u - F())) : u + F() < I.length && l(u + F()), b(!0))
                    },
                    C = function(e) {
                        var r = "";
                        return m ? (e && 0 === u || !e && u + F() >= I.length) && (r = " disabled") : r = " hidden", "scroller".concat(e ? "" : " next").concat(r)
                    };
                return (0, a.jsxs)("div", {
                    className: L()("section-content remove-panel friend-recommendations-content", {
                        "friend-recommendations-content-with-scrollers": m
                    }),
                    children: [(0, a.jsx)("button", {
                        type: "button",
                        className: C(!0),
                        onClick: function() {
                            return w(!0)
                        },
                        children: (0, a.jsx)("div", {
                            className: "arrow",
                            children: (0, a.jsx)("span", {
                                className: "icon-games-carousel-left"
                            })
                        })
                    }), (0, a.jsx)("div", {
                        ref: T,
                        className: L()("friend-recommendations-container", {
                            "animate-scroll": v
                        }),
                        style: {
                            left: "".concat(d, "px")
                        },
                        children: (0, a.jsx)("ul", {
                            className: "hlist",
                            children: I
                        })
                    }), (0, a.jsx)("button", {
                        type: "button",
                        className: C(!1),
                        onClick: function() {
                            return w(!1)
                        },
                        children: (0, a.jsx)("div", {
                            className: "arrow",
                            children: (0, a.jsx)("span", {
                                className: "icon-games-carousel-right"
                            })
                        })
                    })]
                })
            }
            tw.propTypes = {
                friendRecommendations: j().array.isRequired,
                translate: j().func.isRequired,
                setError: j().func.isRequired,
                cardWidth: j().func,
                contentWidth: j().func
            }, tw.defaultProps = {
                cardWidth: function(e) {
                    var r, t;
                    return null == e || null == (t = e.current) || null == (r = t.getBoundingClientRect()) ? void 0 : r.width
                },
                contentWidth: function(e) {
                    var r, t;
                    return null == e || null == (t = e.current) || null == (r = t.getBoundingClientRect()) ? void 0 : r.width
                }
            };
            var tC = ((n = tC || {}).None = "none", n.Frequents = "frequents", n);

            function tx(e, r) {
                (null == r || r > e.length) && (r = e.length);
                for (var t = 0, n = Array(r); t < r; t++) n[t] = e[t];
                return n
            }

            function tN(e, r, t, n, i, a, o) {
                try {
                    var s = e[a](o),
                        u = s.value
                } catch (e) {
                    t(e);
                    return
                }
                s.done ? r(u) : Promise.resolve(u).then(n, i)
            }

            function tA(e, r) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, r) {
                    var t, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var a = [],
                            o = !0,
                            s = !1;
                        try {
                            for (i = i.call(e); !(o = (t = i.next()).done) && (a.push(t.value), !r || a.length !== r); o = !0);
                        } catch (e) {
                            s = !0, n = e
                        } finally {
                            try {
                                o || null == i.return || i.return()
                            } finally {
                                if (s) throw n
                            }
                        }
                        return a
                    }
                }(e, r) || function(e, r) {
                    if (e) {
                        if ("string" == typeof e) return tx(e, r);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tx(e, r)
                    }
                }(e, r) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var tO = c().useState,
                tj = c().useEffect,
                tP = tA((0, P.createModal)(), 2),
                tD = tP[0],
                tL = tP[1];

            function tU(e) {
                var r = e.translate,
                    t = tA(tO([]), 2),
                    n = t[0],
                    i = t[1],
                    o = tA(tO(!1), 2),
                    s = o[0],
                    u = o[1],
                    l = tA(tO(""), 2),
                    c = l[0],
                    d = l[1];
                return (tj(function() {
                    var e;
                    (e = function() {
                        var e, r, t, n, a;
                        return function(e, r) {
                            var t, n, i, a = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & i[0]) throw i[1];
                                        return i[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                s = Object.defineProperty;
                            return s(o, "next", {
                                value: u(0)
                            }), s(o, "throw", {
                                value: u(1)
                            }), s(o, "return", {
                                value: u(2)
                            }), "function" == typeof Symbol && s(o, Symbol.iterator, {
                                value: function() {
                                    return this
                                }
                            }), o;

                            function u(s) {
                                return function(u) {
                                    var l = [s, u];
                                    if (t) throw TypeError("Generator is already executing.");
                                    for (; o && (o = 0, l[0] && (a = 0)), a;) try {
                                        if (t = 1, n && (i = 2 & l[0] ? n.return : l[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, l[1])).done) return i;
                                        switch (n = 0, i && (l = [2 & l[0], i.value]), l[0]) {
                                            case 0:
                                            case 1:
                                                i = l;
                                                break;
                                            case 4:
                                                return a.label++, {
                                                    value: l[1],
                                                    done: !1
                                                };
                                            case 5:
                                                a.label++, n = l[1], l = [0];
                                                continue;
                                            case 7:
                                                l = a.ops.pop(), a.trys.pop();
                                                continue;
                                            default:
                                                if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                                    a = 0;
                                                    continue
                                                }
                                                if (3 === l[0] && (!i || l[1] > i[0] && l[1] < i[3])) {
                                                    a.label = l[1];
                                                    break
                                                }
                                                if (6 === l[0] && a.label < i[1]) {
                                                    a.label = i[1], i = l;
                                                    break
                                                }
                                                if (i && a.label < i[2]) {
                                                    a.label = i[2], a.ops.push(l);
                                                    break
                                                }
                                                i[2] && a.ops.pop(), a.trys.pop();
                                                continue
                                        }
                                        l = r.call(e, a)
                                    } catch (e) {
                                        l = [6, e], n = 0
                                    } finally {
                                        t = i = 0
                                    }
                                    if (5 & l[0]) throw l[1];
                                    return {
                                        value: l[0] ? l[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(o) {
                            switch (o.label) {
                                case 0:
                                    return o.trys.push([0, 5, , 6]), [4, to([ts.FriendRecommendationSource])];
                                case 1:
                                    if (!((null == (e = (r = o.sent()).data) ? void 0 : e[ts.FriendRecommendationSource]) && r.data[ts.FriendRecommendationSource] !== tC.None)) return [3, 4];
                                    return [4, ty(I.CurrentUser.userId)];
                                case 2:
                                    if (!(void 0 !== (null == (t = (n = o.sent()).data) ? void 0 : t.count) && n.data.count < 200)) return [3, 4];
                                    return [4, tp(I.CurrentUser.userId)];
                                case 3:
                                    (a = o.sent()).length > 0 && (u(!0), i(a), tl(I.CurrentUser.userId, r.data[ts.FriendRecommendationSource], a.length)), o.label = 4;
                                case 4:
                                    return [3, 6];
                                case 5:
                                    return console.error(o.sent()), [3, 6];
                                case 6:
                                    return [2]
                            }
                        })
                    }, function() {
                        var r = this,
                            t = arguments;
                        return new Promise(function(n, i) {
                            var a = e.apply(r, t);

                            function o(e) {
                                tN(a, n, i, o, s, "next", e)
                            }

                            function s(e) {
                                tN(a, n, i, o, s, "throw", e)
                            }
                            o(void 0)
                        })
                    })()
                }, []), tj(function() {
                    "" !== c && tL.open().catch(function() {
                        return d("")
                    })
                }, [c]), s) ? (0, a.jsxs)("div", {
                    className: "section col-xs-12 friend-recommendations-section",
                    children: [(0, a.jsx)("div", {
                        className: "container-header",
                        children: (0, a.jsx)("h4", {
                            children: r("Label.FriendRecommendationsHeader")
                        })
                    }), (0, a.jsx)(tw, {
                        friendRecommendations: n,
                        translate: r,
                        setError: d
                    }), (0, a.jsx)(tD, {
                        title: r("Label.ErrorHeader"),
                        body: c,
                        neutralButtonText: r("Action.OK")
                    })]
                }) : (0, a.jsx)("div", {})
            }

            function t_(e) {
                var r = e.translate;
                return (0, a.jsx)(tU, {
                    translate: r
                })
            }
            tU.propTypes = {
                translate: j().func.isRequired
            }, t_.propTypes = {
                translate: j().func.isRequired
            };
            var tq = (0, h.withTranslations)(t_, {
                common: [],
                feature: "Feature.FriendRecommendations"
            });

            function tM(e, r) {
                (null == r || r > e.length) && (r = e.length);
                for (var t = 0, n = Array(r); t < r; t++) n[t] = e[t];
                return n
            }

            function tk(e, r) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, r) {
                    var t, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var a = [],
                            o = !0,
                            s = !1;
                        try {
                            for (i = i.call(e); !(o = (t = i.next()).done) && (a.push(t.value), !r || a.length !== r); o = !0);
                        } catch (e) {
                            s = !0, n = e
                        } finally {
                            try {
                                o || null == i.return || i.return()
                            } finally {
                                if (s) throw n
                            }
                        }
                        return a
                    }
                }(e, r) || function(e, r) {
                    if (e) {
                        if ("string" == typeof e) return tM(e, r);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tM(e, r)
                    }
                }(e, r) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var tB = _.FRIENDTABS,
                tG = _.FRIENDS_ERROR,
                tz = _.SORT_OPTIONS,
                tQ = I.CurrentUser.userId,
                tH = tk((0, P.createModal)(), 2),
                tW = tH[0],
                tV = tH[1];

            function tY(e) {
                var r, t, n = e.translate,
                    i = e.metadata,
                    o = i.isMyProfile,
                    s = i.profileUserId,
                    u = (i.userName, i.displayName),
                    c = i.isFriendsFilterBarEnabled,
                    d = i.isFriendsPageSortExperimentEnabled,
                    f = i.isSortFriendsInApiExperimentEnabled,
                    p = (i.shouldDisplayFriendRequestContext, e.setMetadata),
                    m = e.errorType,
                    y = e.clearError;
                (0, l.useEffect)(function() {
                    document.title = "".concat(n("Label.Friends"), " - Roblox")
                }, [n]), r = o ? n("Heading.MyFriends") : n("Heading.UsersFriends", {
                    username: u
                });
                var h = tG[m] || {},
                    v = tk((0, l.useState)(!1), 2),
                    b = v[0],
                    g = v[1],
                    S = (0, l.useContext)(eZ),
                    E = S.setFriendsSort,
                    T = S.setFilterBarEnabled,
                    R = S.setShowJoinGameButtonInFriendCardDesktopOnly,
                    F = S.showFriendRecs,
                    I = S.setTrustedConnectionsAmpPolicyLoaded,
                    w = S.setCanAccessTrustedConnections,
                    C = S.isTcManagementHubEnabled,
                    x = S.setIsTcManagementHubEnabled;
                (0, l.useEffect)(function() {
                    er.getMetadata(s).then(function(e) {
                        p(e.data)
                    })
                }, []), (0, l.useEffect)(function() {
                    if (C) {
                        var e, r;
                        (e = _.AMP_FEATURE_NAMES.IsUserInTcEligibleCountry, r = _.AMP_NAMESPACES.ConnectionGraphCore, rL(function() {
                            var t;
                            return rU(this, function(n) {
                                switch (n.label) {
                                    case 0:
                                        return t = $(e, null, null, r), [4, H.httpService.get(t)];
                                    case 1:
                                        return [2, n.sent().data]
                                }
                            })
                        })()).then(function(e) {
                            w("Granted" === e.access), I(!0)
                        }).catch(function() {
                            w(!1)
                        })
                    }
                }, [C]), (0, l.useEffect)(function() {
                    T(c)
                }, [c]), (0, l.useEffect)(function() {
                    to([ts.JoinButtonFriendCard, ts.JoinButtonFriendCardDesktopOnly, ts.TcManagementHub]).then(function(e) {
                        var r = e.data;
                        E(tz.API), (null == r ? void 0 : r[ts.JoinButtonFriendCardDesktopOnly]) && R(r[ts.JoinButtonFriendCardDesktopOnly]), (null == r ? void 0 : r[ts.TcManagementHub]) && x(!0)
                    }).catch(function() {
                        E(tz.ALPHABETICAL), R(!1)
                    }).finally(function() {
                        g(!0)
                    })
                }, [d, f]), (0, l.useEffect)(function() {
                    m && tV.open().catch(function() {
                        y()
                    })
                }, [m]);
                var N = [{
                    id: "friends",
                    path: "/friends",
                    title: "Label.Friends",
                    name: tB.FRIENDS,
                    tooltipMsg: "Message.FriendsTabTooltip",
                    isDefault: !0,
                    show: null != tQ
                }, {
                    id: "following",
                    path: "/following",
                    title: "Label.Following",
                    name: tB.FOLLOWING,
                    tooltipMsg: "Message.FollowingTabTooltip"
                }, {
                    id: "followers",
                    path: "/followers",
                    title: "Label.Followers",
                    name: tB.FOLLOWERS,
                    tooltipMsg: "Message.FollowerTabTooltip"
                }, {
                    id: "requests",
                    path: "/friend-requests",
                    title: "Label.Requests",
                    name: tB.FRIENDREQUESTS,
                    tooltipMsg: "Message.FriendsTabTooltip",
                    show: o
                }];
                return t = b ? N.reduce(function(e, r) {
                    var t = r.path,
                        i = r.title,
                        s = r.name,
                        u = r.tooltipMsg,
                        l = r.show,
                        c = r.isDefault,
                        d = r.id;
                    return (void 0 === l || l) && e.push((0, a.jsx)(P.SimpleTabs.Tab, {
                        id: d,
                        path: t,
                        title: n(i),
                        className: L()({
                            "subtract-item": !o,
                            "signed-out": !tQ
                        }),
                        name: s,
                        isDefault: c,
                        children: (0, a.jsx)(tn, {
                            title: n(i),
                            currentTab: s,
                            tooltipMsg: n(u)
                        })
                    }, s)), e
                }, []) : null, (0, a.jsxs)("div", {
                    className: "row page-content",
                    children: [(0, a.jsx)(ti, {
                        title: r,
                        show: !0
                    }), (0, a.jsx)(tW, {
                        title: m && n(h.titleText),
                        body: m && n(h.bodyText),
                        neutralButtonText: m && n(h.neutralButtonText),
                        footerText: m && h.footerText && n(h.footerText)
                    }), F && (0, a.jsx)(tq, {}), (0, a.jsx)(P.SimpleTabs, {
                        type: P.SimpleTabs.types.Hash,
                        hashType: "hashbang",
                        isScrollable: !0,
                        children: t
                    }), (0, a.jsx)("div", {
                        id: "react-captcha-container"
                    })]
                })
            }
            er.setUserId(tQ), tY.defaultProps = {
                metadata: {},
                errorType: null
            }, tY.propTypes = {
                translate: j().func.isRequired,
                metadata: j().objectOf(j().any),
                setMetadata: j().func.isRequired,
                errorType: j().string,
                clearError: j().func.isRequired
            };
            var tJ = (0, h.withTranslations)(ea(tY), eo),
                tX = (0, d.createStore)(A, (0, d.applyMiddleware)(p()));

            function t$() {
                return (0, a.jsx)(y.QueryClientProvider, {
                    client: h.queryClient,
                    children: (0, a.jsx)(m.Provider, {
                        store: tX,
                        children: (0, a.jsx)(e0, {
                            children: (0, a.jsx)(tJ, {})
                        })
                    })
                })
            }
            s()(function() {
                var e = document.getElementById("friends-container") || document.getElementById("friends-web-app");
                e && (0, u.renderWithErrorBoundary)((0, a.jsx)(t$, {}), e)
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("Friends");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/friends-c8293dadbc05ab45.js.map