/*! For license information please see friends.bundle.min.js.LICENSE.txt */ ! function() {
    var e = {
            452: function(e, t) {
                var r;
                ! function() {
                    "use strict";
                    var n = {}.hasOwnProperty;

                    function a() {
                        for (var e = "", t = 0; t < arguments.length; t++) {
                            var r = arguments[t];
                            r && (e = o(e, i(r)))
                        }
                        return e
                    }

                    function i(e) {
                        if ("string" == typeof e || "number" == typeof e) return e;
                        if ("object" != typeof e) return "";
                        if (Array.isArray(e)) return a.apply(null, e);
                        if (e.toString !== Object.prototype.toString && !e.toString.toString().includes("[native code]")) return e.toString();
                        var t = "";
                        for (var r in e) n.call(e, r) && e[r] && (t = o(t, r));
                        return t
                    }

                    function o(e, t) {
                        return t ? e ? e + " " + t : e + t : e
                    }
                    e.exports ? (a.default = a, e.exports = a) : void 0 === (r = function() {
                        return a
                    }.apply(t, [])) || (e.exports = r)
                }()
            }
        },
        t = {};

    function r(n) {
        var a = t[n];
        if (void 0 !== a) return a.exports;
        var i = t[n] = {
            exports: {}
        };
        return e[n](i, i.exports, r), i.exports
    }
    r.n = function(e) {
            var t = e && e.__esModule ? function() {
                return e.default
            } : function() {
                return e
            };
            return r.d(t, {
                a: t
            }), t
        }, r.d = function(e, t) {
            for (var n in t) r.o(t, n) && !r.o(e, n) && Object.defineProperty(e, n, {
                enumerable: !0,
                get: t[n]
            })
        }, r.o = function(e, t) {
            return Object.prototype.hasOwnProperty.call(e, t)
        },
        function() {
            "use strict";
            var e = React,
                t = r.n(e),
                n = ReactDOM,
                a = CoreUtilities,
                i = Redux,
                o = ReduxThunk,
                u = r.n(o),
                s = ReactRedux,
                l = TanstackQuery,
                c = ReactUtilities,
                d = "SET_FRIENDS",
                f = "LOAD_MORE_FRIENDS",
                m = "SET_METADATA",
                p = "SET_TABLOADER",
                v = "SET_ERROR_TYPE",
                h = [],
                y = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : h,
                        t = arguments.length > 1 ? arguments[1] : void 0;
                    switch (t.type) {
                        case d:
                            return t.friends;
                        case f:
                            return e.concat(t.friends);
                        default:
                            return e
                    }
                },
                b = Roblox;

            function E() {
                var e = /\/users\/(\d+)\//g.exec(window.location.pathname);
                return e ? e[1] : null
            }

            function g(e, t) {
                var r = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var n = Object.getOwnPropertySymbols(e);
                    t && (n = n.filter((function(t) {
                        return Object.getOwnPropertyDescriptor(e, t).enumerable
                    }))), r.push.apply(r, n)
                }
                return r
            }

            function S(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {};
                    t % 2 ? g(Object(r), !0).forEach((function(t) {
                        R(e, t, r[t])
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(r)) : g(Object(r)).forEach((function(t) {
                        Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(r, t))
                    }))
                }
                return e
            }

            function R(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }
            var F = E() || b.CurrentUser.userId,
                T = {
                    profileUserId: F,
                    isMyProfile: F === b.CurrentUser.userId,
                    isNearbyUpsellEnabled: !1,
                    isFriendsUserDataStoreCacheEnabled: !0,
                    onlyShowContents: !1,
                    userName: "",
                    displayName: ""
                },
                I = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : T,
                        t = arguments.length > 1 ? arguments[1] : void 0,
                        r = window.location.search.match("onlyShowContents") || !1;
                    return t.type === m ? S(S(S({}, {
                        onlyShowContents: r
                    }), e), t.data) : e
                },
                C = {
                    isLoading: !1
                },
                N = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : C,
                        t = arguments.length > 1 ? arguments[1] : void 0;
                    return t.type === p ? t.data : e
                },
                w = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : null,
                        t = arguments.length > 1 ? arguments[1] : void 0;
                    return t.type === v ? t.errorType : e
                },
                A = (0, i.combineReducers)({
                    friends: y,
                    metadata: I,
                    tabLoader: N,
                    errorType: w
                }),
                O = PropTypes,
                D = r.n(O),
                P = ReactStyleGuide,
                x = r(452),
                L = r.n(x),
                q = CoreRobloxUtilities,
                U = function(e) {
                    return {
                        type: m,
                        data: e
                    }
                },
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
                        friends: q.userInfoService.TYPE.FRIENDS,
                        following: q.userInfoService.TYPE.FOLLOWINGS,
                        followers: q.userInfoService.TYPE.FOLLOWERS,
                        "friend-requests": q.userInfoService.TYPE.FRIENDREQUESTS
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

            function M(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var r = [],
                        n = !0,
                        a = !1,
                        i = void 0;
                    try {
                        for (var o, u = e[Symbol.iterator](); !(n = (o = u.next()).done) && (r.push(o.value), !t || r.length !== t); n = !0);
                    } catch (e) {
                        a = !0, i = e
                    } finally {
                        try {
                            n || null == u.return || u.return()
                        } finally {
                            if (a) throw i
                        }
                    }
                    return r
                }(e, t) || function(e, t) {
                    if (!e) return;
                    if ("string" == typeof e) return k(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    "Object" === r && e.constructor && (r = e.constructor.name);
                    if ("Map" === r || "Set" === r) return Array.from(e);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return k(e, t)
                }(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function k(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = new Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var j = _.MAX_FRIENDS_STATUS,
                B = _.FRIENDS_ERROR_TYPE,
                G = _.MAX_FRIENDS_CODE,
                Q = _.FLOODED_STATUS,
                H = function(e) {
                    return {
                        type: v,
                        errorType: e
                    }
                },
                z = function(e) {
                    return function(t) {
                        if (e) {
                            var r = M(e.data.errors, 1)[0];
                            switch (e.status) {
                                case j:
                                    r.code === G.currentUser && t(H(B.currentUser)), r.code === G.receiverUser && t(H(B.receiverUser));
                                    break;
                                case Q:
                                    t(H(B.flooded));
                                    break;
                                default:
                                    t(H(B.general))
                            }
                        }
                    }
                },
                W = b.EnvironmentUrls.apiGatewayUrl,
                V = b.EnvironmentUrls.friendsApi,
                Y = b.EnvironmentUrls.thumbnailsApi,
                J = (b.EnvironmentUrls.presenceApi, b.EnvironmentUrls.gamesApi),
                X = (b.EnvironmentUrls.usersApi, function(e) {
                    return "/users/".concat(e, "/profile")
                }),
                $ = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null,
                        r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : null;
                    return {
                        retryable: !0,
                        withCredentials: !0,
                        url: "".concat(W, "/access-management/v1/upsell-feature-access?featureName=").concat(e).concat(t ? "&extraParameters=".concat(t) : "").concat(r ? "&successfulActions=".concat(r) : "")
                    }
                },
                K = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null,
                        r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : null,
                        n = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : null;
                    return {
                        retryable: !0,
                        withCredentials: !0,
                        url: "".concat(W, "/access-management/v1/upsell-feature-access?featureName=").concat(e).concat(t ? "&extraParameters=".concat(t) : "").concat(r ? "&successfulActions=".concat(r) : "").concat(n ? "&namespace=".concat(encodeURIComponent(n)) : "")
                    }
                },
                Z = _.FRIENDTABS,
                ee = function() {
                    return "".concat(V, "/v1/metadata")
                },
                te = function(e) {
                    return {
                        retryable: !1,
                        withCredentials: !0,
                        url: "".concat(V, "/v1/users/").concat(e, "/decline-friend-request")
                    }
                },
                re = function(e) {
                    return {
                        retryable: !1,
                        withCredentials: !0,
                        url: "".concat(V, "/v1/users/").concat(e, "/accept-friend-request")
                    }
                },
                ne = function() {
                    return {
                        retryable: !1,
                        withCredentials: !0,
                        url: "".concat(V, "/v1/user/friend-requests/decline-all")
                    }
                },
                ae = function(e) {
                    return {
                        retryable: !1,
                        withCredentials: !0,
                        url: "".concat(V, "/v1/users/").concat(e, "/follow")
                    }
                },
                ie = function(e) {
                    return {
                        retryable: !1,
                        withCredentials: !0,
                        url: "".concat(V, "/v1/users/").concat(e, "/unfollow")
                    }
                },
                oe = function(e) {
                    return {
                        retryable: !1,
                        withCredentials: !0,
                        url: "".concat(V, "/v1/users/").concat(e, "/unfriend")
                    }
                },
                ue = function() {
                    return "".concat(Y, "/v1/users/avatar-headshot?size=150x150&format=png")
                },
                se = function() {
                    return {
                        retryable: !0,
                        withCredentials: !0,
                        url: "".concat(J, "/v1/games/multiget-playability-status")
                    }
                },
                le = function() {
                    return "".concat(V, "/v1/user/friend-requests/count")
                },
                ce = function(e) {
                    return "".concat(V, "/v1/users/").concat(e, "/followers/count")
                },
                de = function(e) {
                    return "".concat(V, "/v1/users/").concat(e, "/followings/count")
                },
                fe = function() {
                    return "".concat(J, "/v1/games")
                },
                me = function(e, t, r, n) {
                    var a = r ? "1" : "",
                        i = n ? 36 : 18;
                    return {
                        retryable: !1,
                        withCredentials: !0,
                        url: "".concat(V, "/v1/users/").concat(e, "/friends/find?limit=").concat(i, "&cursor=").concat(t, "&userSort=").concat(a)
                    }
                },
                pe = function(e, t, r) {
                    var n = r ? 36 : 18;
                    return {
                        retryable: !1,
                        withCredentials: !0,
                        url: "".concat(V, "/v1/users/").concat(e, "/friends/find?limit=").concat(n, "&cursor=").concat(t, "&findFriendsType=").concat(_.FIND_FRIENDS_TYPES.TrustedFriends)
                    }
                },
                ve = function(e, t, r, n) {
                    var a = n ? 36 : 18;
                    return {
                        retryable: !1,
                        withCredentials: !0,
                        url: "".concat(V, "/v1/users/").concat(e, "/friends/search?limit=").concat(a, "&cursor=").concat(t, "&query=").concat(r)
                    }
                },
                he = function(e) {
                    return {
                        retryable: !1,
                        withCredentials: !0,
                        url: "".concat(V, "/v1/users/").concat(e, "/friends/count")
                    }
                },
                ye = function() {
                    return {
                        retryable: !1,
                        withCredentials: !0,
                        url: "".concat(V, "/v1/my/new-friend-requests")
                    }
                },
                be = function(e) {
                    return {
                        retryable: !0,
                        withCredentials: !0,
                        url: "".concat(V, "/v1/my/trusted-friends/").concat(e, "/status")
                    }
                },
                Ee = {
                    userId: 0,
                    getFriendsTypeName: function(e) {
                        switch (e) {
                            case Z.FRIENDREQUESTS:
                                return "FriendRequests";
                            case Z.FOLLOWING:
                                return "Following";
                            case Z.FOLLOWERS:
                                return "Followers";
                            case Z.FRIENDS:
                            default:
                                return "AllFriends"
                        }
                    },
                    setUserId: function(e) {
                        this.userId = E() || e
                    },
                    getMetadata: function(e) {
                        var t = {
                                url: ee(),
                                retryable: !0,
                                withCredentials: !0
                            },
                            r = {
                                targetUserId: e
                            };
                        return a.httpService.get(t, r)
                    },
                    acceptFriendRequest: function(e) {
                        var t = re(e);
                        return a.httpService.post(t)
                    },
                    declineFriendRequest: function(e) {
                        var t = te(e);
                        return a.httpService.post(t, {})
                    },
                    declineAllFriendRequests: function() {
                        var e = ne();
                        return a.httpService.post(e, {})
                    },
                    follow: function(e, t) {
                        var r = ae(e);
                        return a.httpService.post(r, t, !0)
                    },
                    unfollow: function(e) {
                        var t = ie(e),
                            r = {
                                targetUserId: e
                            };
                        return a.httpService.post(t, r)
                    },
                    unfriend: function(e) {
                        var t = oe(e);
                        return a.httpService.post(t, {})
                    },
                    getAvatarHeadshots: function(e) {
                        var t = {
                            url: ue(),
                            retryable: !0,
                            withCredentials: !0
                        };
                        return a.httpService.buildBatchPromises(e, 50, t).then((function(e) {
                            return e && e.length > 0 ? e.reduce((function(e, t) {
                                var r = t.data.data;
                                return e.concat(r)
                            }), []) : []
                        })).catch((function() {
                            return []
                        }))
                    },
                    getGamePlayabilities: function(e) {
                        var t = se();
                        return a.httpService.get(t, {
                            universeIds: e
                        })
                    },
                    getFriendsRequestCount: function() {
                        var e = {
                            url: le(),
                            retryable: !0,
                            withCredentials: !0
                        };
                        return a.httpService.get(e)
                    },
                    getFollowersCount: function(e) {
                        var t = {
                            url: ce(e),
                            retryable: !0,
                            withCredentials: !0
                        };
                        return a.httpService.get(t)
                    },
                    getFollowingsCount: function(e) {
                        var t = {
                            url: de(e),
                            retryable: !0,
                            withCredentials: !0
                        };
                        return a.httpService.get(t)
                    },
                    getGames: function(e) {
                        var t = {
                                url: fe(),
                                retryable: !0,
                                withCredentials: !0
                            },
                            r = {
                                universeIds: e
                            };
                        return a.httpService.get(t, r)
                    },
                    getPaginatedFriends: function(e, t, r, n) {
                        var i = me(e, t, r, n);
                        return a.httpService.get(i)
                    },
                    getSearchedFriends: function(e, t, r, n) {
                        var i = ve(e, t, r, n);
                        return a.httpService.get(i)
                    },
                    getFriendsCount: function(e) {
                        var t = he(e);
                        return a.httpService.get(t)
                    },
                    clearNewFriendRequests: function() {
                        var e = ye();
                        return a.httpService.delete(e, {})
                    },
                    getTrustedConnectionStatus: function(e) {
                        return a.httpService.get(be(e))
                    },
                    getPaginatedTrustedConnections: function(e, t, r, n) {
                        var i = pe(e, t, n);
                        return a.httpService.get(i)
                    }
                };
            var ge = _.LIST_TYPE,
                Se = _.CACHE_CRITERIA,
                Re = _.FRIEND_REQUEST_COUNT_EVENT,
                Fe = (0, s.connect)((function(e) {
                    return {
                        friends: e.friends,
                        metadata: e.metadata,
                        tabLoader: e.tabLoader,
                        errorType: e.errorType
                    }
                }), (function(e) {
                    return {
                        setMetadata: function(t) {
                            e(U(t))
                        },
                        setFriends: function() {
                            e(function(e) {
                                return {
                                    type: d,
                                    friends: e
                                }
                            }(arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : []))
                        },
                        loadMoreFriends: function() {
                            e(function(e) {
                                return {
                                    type: f,
                                    friends: e
                                }
                            }(arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : []))
                        },
                        enableTabLoader: function() {
                            e({
                                type: p,
                                data: {
                                    isLoading: !0
                                }
                            })
                        },
                        disableTabLoader: function() {
                            e({
                                type: p,
                                data: {
                                    isLoading: !1
                                }
                            })
                        },
                        clearError: function() {
                            e(H(null))
                        },
                        followFriend: function(t, r) {
                            return Ee.follow(t, r).catch((function(t) {
                                if (function(e) {
                                        var t, r, n;
                                        return !((null == e ? void 0 : e.status) !== _.FORBIDDEN_STATUS || null == e || null === (t = e.data) || void 0 === t || null === (r = t.errors) || void 0 === r || !r.length || (null === (n = e.data.errors[0]) || void 0 === n ? void 0 : n.code) !== _.CAPTCHA_CODE)
                                    }(t) && !r) throw new Error(function(e) {
                                    var t, r;
                                    return null == e || null === (t = e.data) || void 0 === t || null === (r = t.errors[0]) || void 0 === r ? void 0 : r.fieldData
                                }(t));
                                e(z(t))
                            }))
                        },
                        unfollowFriend: function(t) {
                            return Ee.unfollow(t).catch((function(t) {
                                return e(z(t))
                            }))
                        },
                        acceptFriendRequest: function(t) {
                            return function(r) {
                                return Ee.acceptFriendRequest(r.id).then((function() {
                                    return t(r.id)
                                })).then((function() {
                                    q.userInfoService.refreshCacheData(ge["friend-requests"], Se)
                                })).catch((function(t) {
                                    return e(z(t))
                                }))
                            }
                        },
                        declineFriendRequest: function(t) {
                            return function(r) {
                                return Ee.declineFriendRequest(r.id).then((function() {
                                    return t(r.id)
                                })).then((function() {
                                    q.userInfoService.refreshCacheData(ge["friend-requests"], Se).then((function() {
                                        document.dispatchEvent(new CustomEvent(Re))
                                    }))
                                })).catch((function(t) {
                                    return e(z(t))
                                }))
                            }
                        },
                        declineAllFriendRequests: function() {
                            return Ee.declineAllFriendRequests().then((function(e) {
                                var t;
                                return q.userInfoService.refreshCacheData(ge["friend-requests"], Se).then((function() {
                                    document.dispatchEvent(new CustomEvent(Re))
                                })), null === (t = e.data) || void 0 === t ? void 0 : t.backgrounded
                            })).catch((function(t) {
                                return e(z(t))
                            }))
                        },
                        unfriend: function(t) {
                            return Ee.unfriend(t).catch((function(t) {
                                return e(z(t))
                            }))
                        },
                        getGamePlayabilities: Ee.getGamePlayabilities
                    }
                })),
                Te = {
                    common: ["Common.Presence", "CommonUI.Features"],
                    feature: "Feature.Friends"
                },
                Ie = HeaderScripts,
                Ce = (ReactJSX, Roblox["core-scripts"].guac),
                Ne = Roblox["core-scripts"].http.http;

            function we(e, t) {
                var r;
                if ("undefined" == typeof Symbol || null == e[Symbol.iterator]) {
                    if (Array.isArray(e) || (r = Oe(e)) || t && e && "number" == typeof e.length) {
                        r && (e = r);
                        var n = 0,
                            a = function() {};
                        return {
                            s: a,
                            n: function() {
                                return n >= e.length ? {
                                    done: !0
                                } : {
                                    done: !1,
                                    value: e[n++]
                                }
                            },
                            e: function(e) {
                                throw e
                            },
                            f: a
                        }
                    }
                    throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }
                var i, o = !0,
                    u = !1;
                return {
                    s: function() {
                        r = e[Symbol.iterator]()
                    },
                    n: function() {
                        var e = r.next();
                        return o = e.done, e
                    },
                    e: function(e) {
                        u = !0, i = e
                    },
                    f: function() {
                        try {
                            o || null == r.return || r.return()
                        } finally {
                            if (u) throw i
                        }
                    }
                }
            }

            function Ae(e) {
                return function(e) {
                    if (Array.isArray(e)) return De(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && Symbol.iterator in Object(e)) return Array.from(e)
                }(e) || Oe(e) || function() {
                    throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function Oe(e, t) {
                if (e) {
                    if ("string" == typeof e) return De(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    return "Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r ? Array.from(e) : "Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r) ? De(e, t) : void 0
                }
            }

            function De(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = new Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function Pe(e, t, r, n, a, i, o) {
                try {
                    var u = e[i](o),
                        s = u.value
                } catch (e) {
                    return void r(e)
                }
                u.done ? t(s) : Promise.resolve(s).then(n, a)
            }

            function xe(e) {
                return xe = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
                    return typeof e
                } : function(e) {
                    return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
                }, xe(e)
            }
            var Le = "web-plus-identity-badge",
                qe = function() {
                    var e, t = (0, l.useQuery)({
                        queryKey: ["guac/".concat(Le)],
                        queryFn: function() {
                            return (0, Ce.callBehaviour)(Le)
                        },
                        staleTime: 1 / 0
                    }).data;
                    return "object" === xe(e = t) && null !== e && !0 === t.plusIdentityBadgeEnabled
                },
                Ue = function() {
                    var e, t = (e = regeneratorRuntime.mark((function e(t) {
                        var r, n, a, i, o, u, s, l, c, d;
                        return regeneratorRuntime.wrap((function(e) {
                            for (;;) switch (e.prev = e.next) {
                                case 0:
                                    if (0 !== (n = Ae(new Set(t))).length) {
                                        e.next = 3;
                                        break
                                    }
                                    return e.abrupt("return", {});
                                case 3:
                                    return a = {
                                        url: "".concat(b.EnvironmentUrls.apiGatewayUrl, "/user-profile-api/v1/user/profiles/get-profiles"),
                                        retryable: !0,
                                        withCredentials: !0
                                    }, i = {
                                        userIds: n,
                                        fields: ["hasRobloxSubscription"]
                                    }, e.next = 7, Ne.post(a, i);
                                case 7:
                                    o = e.sent, u = o.data, s = {}, l = we(null !== (r = u.profileDetails) && void 0 !== r ? r : []);
                                    try {
                                        for (l.s(); !(c = l.n()).done;) d = c.value, s[d.userId] = !0 === d.hasRobloxSubscription
                                    } catch (e) {
                                        l.e(e)
                                    } finally {
                                        l.f()
                                    }
                                    return e.abrupt("return", s);
                                case 13:
                                case "end":
                                    return e.stop()
                            }
                        }), e)
                    })), function() {
                        var t = this,
                            r = arguments;
                        return new Promise((function(n, a) {
                            var i = e.apply(t, r);

                            function o(e) {
                                Pe(i, n, a, o, u, "next", e)
                            }

                            function u(e) {
                                Pe(i, n, a, o, u, "throw", e)
                            }
                            o(void 0)
                        }))
                    });
                    return function(e) {
                        return t.apply(this, arguments)
                    }
                }(),
                _e = RobloxUserProfiles,
                Me = function() {
                    return Me = Object.assign || function(e) {
                        for (var t, r = 1, n = arguments.length; r < n; r++)
                            for (var a in t = arguments[r]) Object.prototype.hasOwnProperty.call(t, a) && (e[a] = t[a]);
                        return e
                    }, Me.apply(this, arguments)
                };

            function ke(e, t) {
                var r = {};
                for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && t.indexOf(n) < 0 && (r[n] = e[n]);
                if (null != e && "function" == typeof Object.getOwnPropertySymbols) {
                    var a = 0;
                    for (n = Object.getOwnPropertySymbols(e); a < n.length; a++) t.indexOf(n[a]) < 0 && Object.prototype.propertyIsEnumerable.call(e, n[a]) && (r[n[a]] = e[n[a]])
                }
                return r
            }

            function je(e) {
                var t, r, n = "";
                if ("string" == typeof e || "number" == typeof e) n += e;
                else if ("object" == typeof e)
                    if (Array.isArray(e))
                        for (t = 0; t < e.length; t++) e[t] && (r = je(e[t])) && (n && (n += " "), n += r);
                    else
                        for (t in e) e[t] && (n && (n += " "), n += t);
                return n
            }
            var Be = function() {
                    for (var e, t, r = 0, n = ""; r < arguments.length;)(e = arguments[r++]) && (t = je(e)) && (n && (n += " "), n += t);
                    return n
                },
                Ge = function() {
                    return t().createElement("div", {
                        role: "presentation",
                        className: "absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none"
                    })
                },
                Qe = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]"
                },
                He = t().forwardRef((function(e, r) {
                    var n = e.name,
                        a = e.size,
                        i = void 0 === a ? "Medium" : a,
                        o = e.className;
                    e.children;
                    var u = ke(e, ["name", "size", "className", "children"]);
                    return t().createElement("span", Me({
                        ref: r,
                        role: "presentation",
                        className: Be("grow-0 shrink-0 basis-auto icon", n, Qe[i], o)
                    }, u))
                }));
            He.displayName = "Icon";
            var ze = {
                    Small: "XSmall",
                    Medium: "Small",
                    Large: "Medium"
                },
                We = {
                    Small: ["height-600", "text-label-small"],
                    Medium: ["height-800", "text-label-medium"],
                    Large: ["height-1000", "text-label-medium"]
                },
                Ve = {
                    Small: "padding-left-small",
                    Medium: "padding-left-medium",
                    Large: "padding-left-large"
                },
                Ye = {
                    Small: "padding-left-small",
                    Medium: "padding-left-medium",
                    Large: "padding-left-medium"
                },
                Je = {
                    Small: "padding-right-small",
                    Medium: "padding-right-medium",
                    Large: "padding-right-large"
                },
                Xe = {
                    Small: "padding-right-small",
                    Medium: "padding-right-medium",
                    Large: "padding-right-medium"
                },
                $e = {
                    Small: "padding-left-xsmall",
                    Medium: "padding-left-[var(--size-150)]",
                    Large: "padding-left-small"
                },
                Ke = {
                    Small: "padding-right-[var(--size-150)]",
                    Medium: "padding-right-small",
                    Large: "padding-right-[var(--size-250)]"
                },
                Ze = {
                    Standard: "bg-shift-300",
                    Utility: "bg-none"
                },
                et = (0, e.forwardRef)((function(e, r) {
                    var n = e.className,
                        a = e.style,
                        i = e.text,
                        o = e.isDisabled,
                        u = void 0 !== o && o,
                        s = e.size,
                        l = void 0 === s ? "Medium" : s,
                        c = e.variant,
                        d = void 0 === c ? "Standard" : c,
                        f = e.leading,
                        m = e.trailing,
                        p = ke(e, ["className", "style", "text", "isDisabled", "size", "variant", "leading", "trailing"]),
                        v = Be(u ? "opacity-[0.5]" : ["relative clip group/interactable focus-visible:outline-focus disabled:outline-none", "cursor-pointer"], "relative flex justify-center items-center radius-circle stroke-none", null == f ? Ve[l] : Ye[l], null == m ? Je[l] : Xe[l], We[l], n),
                        h = t().createElement(t().Fragment, null, t().createElement(Ge, null), f && t().createElement(He, {
                            name: f,
                            size: ze[l]
                        }), t().createElement("span", {
                            className: Be("text-no-wrap text-truncate-end", null != f && $e[l], null != m && Ke[l])
                        }, i), m && t().createElement(He, {
                            name: m,
                            size: ze[l]
                        })),
                        y = Me({
                            textDecoration: "none"
                        }, a);
                    if ("a" === p.as) {
                        p.as;
                        var b = p.href,
                            E = ke(p, ["as", "href"]);
                        return t().createElement("a", Me({
                            ref: r
                        }, E, {
                            "aria-disabled": u,
                            href: u ? void 0 : b,
                            className: Be(v, Ze[d], "content-action-utility"),
                            style: y
                        }), h)
                    }
                    p.as;
                    var g = p.isChecked,
                        S = p.onCheckedChange,
                        R = ke(p, ["as", "isChecked", "onCheckedChange"]);
                    return t().createElement("button", Me({
                        ref: r,
                        type: "button"
                    }, R, {
                        className: Be(g ? "bg-inverse-surface-0" : Ze[d], g ? "content-inverse-emphasis" : "content-action-utility", v),
                        style: y,
                        "aria-pressed": g,
                        disabled: u,
                        onClick: null == S ? void 0 : function() {
                            return S(!g)
                        }
                    }), h)
                }));

            function tt(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var r = [],
                        n = !0,
                        a = !1,
                        i = void 0;
                    try {
                        for (var o, u = e[Symbol.iterator](); !(n = (o = u.next()).done) && (r.push(o.value), !t || r.length !== t); n = !0);
                    } catch (e) {
                        a = !0, i = e
                    } finally {
                        try {
                            n || null == u.return || u.return()
                        } finally {
                            if (a) throw i
                        }
                    }
                    return r
                }(e, t) || function(e, t) {
                    if (!e) return;
                    if ("string" == typeof e) return rt(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    "Object" === r && e.constructor && (r = e.constructor.name);
                    if ("Map" === r || "Set" === r) return Array.from(e);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rt(e, t)
                }(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rt(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = new Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var nt = (0, e.createContext)(),
                at = function(r) {
                    var n = r.children,
                        a = tt((0, e.useState)(0), 2),
                        i = a[0],
                        o = a[1],
                        u = tt((0, e.useState)(null), 2),
                        s = u[0],
                        l = u[1],
                        c = tt((0, e.useState)(null), 2),
                        d = c[0],
                        f = c[1],
                        m = tt((0, e.useState)(null), 2),
                        p = m[0],
                        v = m[1],
                        h = tt((0, e.useState)([]), 2),
                        y = h[0],
                        b = h[1],
                        E = tt((0, e.useState)(null), 2),
                        g = E[0],
                        S = E[1],
                        R = tt((0, e.useState)(!1), 2),
                        F = R[0],
                        T = R[1],
                        I = tt((0, e.useState)(!1), 2),
                        C = I[0],
                        N = I[1],
                        w = tt((0, e.useState)(!1), 2),
                        A = w[0],
                        O = w[1],
                        D = tt((0, e.useState)(!1), 2),
                        P = D[0],
                        x = D[1],
                        L = tt((0, e.useState)(!1), 2),
                        q = L[0],
                        U = L[1],
                        _ = tt((0, e.useState)({}), 2),
                        M = _[0],
                        k = _[1],
                        j = tt((0, e.useState)(!0), 2),
                        B = {
                            friendsCount: i,
                            setFriendsCount: o,
                            friendsNameFilter: s,
                            setFriendsNameFilter: l,
                            friendsStatusFilter: d,
                            setFriendsStatusFilter: f,
                            friendsSort: p,
                            setFriendsSort: v,
                            paginatedFriends: y,
                            setPaginatedFriends: b,
                            filterBarEnabled: g,
                            setFilterBarEnabled: S,
                            showJoinGameButtonInFriendCardDesktopOnly: q,
                            setShowJoinGameButtonInFriendCardDesktopOnly: U,
                            friendRequestIdToUniverseSourceMap: M,
                            setFriendRequestIdToUniverseSourceMap: k,
                            showFriendRecs: j[0],
                            setShowFriendRecs: j[1],
                            isTrustedFilterEnabled: F,
                            setIsTrustedFilterEnabled: T,
                            trustedConnectionsAmpPolicyLoaded: C,
                            setTrustedConnectionsAmpPolicyLoaded: N,
                            canAccessTrustedConnections: A,
                            setCanAccessTrustedConnections: O,
                            isTcManagementHubEnabled: P,
                            setIsTcManagementHubEnabled: x
                        };
                    return t().createElement(nt.Provider, {
                        value: B
                    }, n)
                };

            function it(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var r = [],
                        n = !0,
                        a = !1,
                        i = void 0;
                    try {
                        for (var o, u = e[Symbol.iterator](); !(n = (o = u.next()).done) && (r.push(o.value), !t || r.length !== t); n = !0);
                    } catch (e) {
                        a = !0, i = e
                    } finally {
                        try {
                            n || null == u.return || u.return()
                        } finally {
                            if (a) throw i
                        }
                    }
                    return r
                }(e, t) || function(e, t) {
                    if (!e) return;
                    if ("string" == typeof e) return ot(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    "Object" === r && e.constructor && (r = e.constructor.name);
                    if ("Map" === r || "Set" === r) return Array.from(e);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ot(e, t)
                }(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ot(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = new Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ut(r) {
                var n, a, i, o = r.handleSearchValueChange,
                    u = r.translate,
                    s = it((0, e.useState)(""), 2),
                    l = s[0],
                    c = s[1],
                    d = (0, e.useCallback)((n = function(e) {
                        o((e || "").trim())
                    }, a = 300, function() {
                        for (var e = arguments.length, t = new Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                        clearTimeout(i), i = setTimeout((function() {
                            return n.apply(void 0, t)
                        }), a)
                    }), []);
                return t().createElement("div", {
                    className: "friends-filter-searchbar-container form-control input-field"
                }, t().createElement("span", {
                    className: "icon-search"
                }), t().createElement("input", {
                    className: "friends-filter-searchbar-input",
                    type: "text",
                    value: l || "",
                    onChange: function(e) {
                        c(e.target.value || void 0), d(e.target.value)
                    },
                    placeholder: u("Label.FilterFriends")
                }))
            }
            at.propTypes = {
                children: D().node.isRequired
            }, ut.propTypes = {
                handleSearchValueChange: D().func.isRequired,
                translate: D().func.isRequired
            };
            var st = (0, c.withTranslations)(Fe(ut), Te),
                lt = q.eventStreamService.eventTypes,
                ct = {
                    filterFriendsByName: {
                        name: "filterFriendsByName",
                        type: lt.formInteraction,
                        context: "friends",
                        requiredParams: ["query"]
                    },
                    filterFriendsByStatus: {
                        name: "filterFriendsByStatus",
                        type: lt.formInteraction,
                        context: "friends",
                        requiredParams: ["status"]
                    }
                };

            function dt(r) {
                r.translate;
                var n = (0, e.useContext)(nt),
                    a = (n.friendsStatusFilter, n.setFriendsNameFilter),
                    i = (n.setFriendsStatusFilter, n.setIsTrustedFilterEnabled);
                return t().createElement("div", {
                    className: "friends-filter"
                }, t().createElement(st, {
                    handleSearchValueChange: function(e) {
                        q.eventStreamService.sendEvent(ct.filterFriendsByName, {
                            query: e
                        }), a(e), i(!1)
                    }
                }))
            }
            dt.propTypes = {
                translate: D().func.isRequired
            };
            var ft = (0, c.withTranslations)(Fe(dt), Te);

            function mt(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = new Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var pt, vt, ht = _.FRIENDTABS,
                yt = _.FRIEND_FILTER_OPTIONS,
                bt = q.dataStores.userDataStore.maxFriendRequestNotificationCount,
                Et = (0, P.createModal)(),
                gt = (vt = 2, function(e) {
                    if (Array.isArray(e)) return e
                }(pt = Et) || function(e, t) {
                    if ("undefined" != typeof Symbol && Symbol.iterator in Object(e)) {
                        var r = [],
                            n = !0,
                            a = !1,
                            i = void 0;
                        try {
                            for (var o, u = e[Symbol.iterator](); !(n = (o = u.next()).done) && (r.push(o.value), !t || r.length !== t); n = !0);
                        } catch (e) {
                            a = !0, i = e
                        } finally {
                            try {
                                n || null == u.return || u.return()
                            } finally {
                                if (a) throw i
                            }
                        }
                        return r
                    }
                }(pt, vt) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return mt(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        return "Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r ? Array.from(e) : "Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r) ? mt(e, t) : void 0
                    }
                }(pt, vt) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()),
                St = gt[0],
                Rt = gt[1];

            function Ft(r) {
                var n = r.translate,
                    a = r.title,
                    i = r.currentTab,
                    o = r.tooltipMsg,
                    u = r.declineAllFriendRequests,
                    s = r.refreshFriendsList,
                    l = r.isMyProfile,
                    c = r.updateFilter,
                    d = (0, e.useContext)(nt),
                    f = d.friendsCount,
                    m = d.isTrustedFilterEnabled,
                    p = d.canAccessTrustedConnections,
                    v = d.trustedConnectionsAmpPolicyLoaded,
                    h = d.isTcManagementHubEnabled,
                    y = i === ht.FRIENDREQUESTS && f > 0,
                    b = "(".concat(f, ")");
                return f >= bt && i !== ht.FRIENDS && (b = "(".concat(bt, "+)")), t().createElement("div", null, t().createElement("div", {
                    className: "container-header"
                }, t().createElement("div", {
                    className: "friends-subtitle"
                }, t().createElement("h2", null, a, " ", b), t().createElement(P.Tooltip, {
                    id: "friendsTooltip",
                    placement: "bottom",
                    content: o
                }, t().createElement("span", {
                    className: "icon-moreinfo"
                })), i === ht.FRIENDS && !m && t().createElement(ft, null)), i === ht.FRIENDS && l && h && t().createElement(t().Fragment, null, t().createElement("div", {
                    className: "chip-filters-container"
                }, t().createElement(et, {
                    text: n("Label.All"),
                    isChecked: !m,
                    onCheckedChange: function() {
                        c(yt.ALL)
                    }
                }), t().createElement(et, {
                    text: n("TrustedConnection.Label.Trusted"),
                    isChecked: m,
                    onCheckedChange: function() {
                        c(yt.TRUSTED)
                    }
                })), m && v && function(e, r) {
                    return e ? t().createElement("div", {
                        className: "education-text-container"
                    }, t().createElement("span", null, r("Description.DoMoreWithTrustedFriends")), " ", t().createElement("a", {
                        className: "learn-more-link",
                        rel: "noreferrer",
                        target: "_blank",
                        href: "https://en.help.roblox.com/hc/articles/46158344285204"
                    }, r("LinkText.LearnMore"))) : t().createElement("div", {
                        className: "education-text-container"
                    }, t().createElement("span", null, r("Description.TrustedFriendsUnavailable")))
                }(p, n)), y && t().createElement(P.Button, {
                    variant: "control",
                    size: "xs",
                    className: "ignore-button see-all-link",
                    onClick: function() {
                        return u().then((function(e) {
                            e ? Rt.open() : s()
                        }))
                    }
                }, n("Action.IgnoreAll")), t().createElement(St, {
                    title: n("Action.IgnoreAll"),
                    body: n("Label.DeclineAllBackgrounded"),
                    neutralButtonText: n("Label.Ok")
                })))
            }
            Ft.propTypes = {
                translate: D().func.isRequired,
                title: D().string.isRequired,
                currentTab: D().string.isRequired,
                tooltipMsg: D().string.isRequired,
                declineAllFriendRequests: D().func.isRequired,
                refreshFriendsList: D().func.isRequired,
                isMyProfile: D().bool.isRequired,
                updateFilter: D().func.isRequired
            };
            var Tt = (0, c.withTranslations)(Fe(Ft), Te),
                It = RobloxThumbnails,
                Ct = RobloxPresence,
                Nt = r.n(Ct),
                wt = function(e) {
                    var r = e.children;
                    return t().createElement("div", {
                        className: "avatar-card-footer avatar-card-label"
                    }, r)
                };
            wt.propTypes = {
                children: D().node.isRequired
            };
            var At = wt;

            function Ot(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var r = [],
                        n = !0,
                        a = !1,
                        i = void 0;
                    try {
                        for (var o, u = e[Symbol.iterator](); !(n = (o = u.next()).done) && (r.push(o.value), !t || r.length !== t); n = !0);
                    } catch (e) {
                        a = !0, i = e
                    } finally {
                        try {
                            n || null == u.return || u.return()
                        } finally {
                            if (a) throw i
                        }
                    }
                    return r
                }(e, t) || function(e, t) {
                    if (!e) return;
                    if ("string" == typeof e) return Dt(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    "Object" === r && e.constructor && (r = e.constructor.name);
                    if ("Map" === r || "Set" === r) return Array.from(e);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return Dt(e, t)
                }(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function Dt(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = new Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var Pt = _.FRIENDTABS,
                xt = _.EVENTS,
                Lt = _.FRIENDS_REQUEST_LIST_CONTEXT,
                qt = _.PLUS_SIGN,
                Ut = _.MUTUAL_FRIENDS_SHOW_COUNT,
                _t = _.UNAVAILABLE_FRIEND_NAME,
                Mt = q.dataStores.userDataStore,
                kt = function(r) {
                    var n, a = r.id,
                        i = r.name,
                        o = r.displayName,
                        u = r.verifiedBadgeData,
                        s = r.isRobloxPlus,
                        l = r.isDeleted,
                        c = r.friendRequestSentFromInGame,
                        d = r.friendRequestSentFromQrCode,
                        f = r.friendRequestSentAt,
                        m = r.sourceUniverse,
                        p = r.mutualFriends,
                        v = (r.position, r.currentTab),
                        h = r.isMyProfile,
                        y = r.translate,
                        E = r.unfollowFriend,
                        g = r.unfriend,
                        S = r.followFriend,
                        R = r.acceptFriendRequestThenRemoveCard,
                        F = r.declineFriendRequestThenRemoveCard,
                        T = r.refreshFriendsList,
                        I = r.presence,
                        C = Ot((0, e.useState)(!0), 2),
                        N = C[0],
                        w = C[1],
                        A = Ot((0, e.useState)(!1), 2),
                        O = A[0],
                        D = A[1],
                        x = Ot((0, e.useState)(!1), 2),
                        L = x[0],
                        U = x[1],
                        M = Ot((0, e.useState)(""), 2),
                        k = M[0],
                        j = M[1],
                        B = Ot((0, e.useState)(""), 2),
                        G = B[0],
                        Q = B[1],
                        H = Ot((0, e.useState)(!1), 2),
                        z = H[0],
                        W = H[1],
                        V = function(e) {
                            return q.entityUrl.game.getRelativePath(e)
                        },
                        Y = v === Pt.FOLLOWING && h && !z,
                        J = v === Pt.FRIENDREQUESTS && h,
                        $ = v === Pt.FRIENDS && l && h,
                        K = X(a),
                        Z = (null == m ? void 0 : m.name) && (null == m ? void 0 : m.rootPlaceId),
                        ee = p.length > 0,
                        te = t().createElement(Ct.PresenceStatusLabel, {
                            userId: a,
                            translate: y,
                            linkUrlGetter: V,
                            linkClassNames: ["avatar-status-link", "text-link"]
                        }),
                        re = "",
                        ne = !1,
                        ae = (0, e.useContext)(nt).showJoinGameButtonInFriendCardDesktopOnly,
                        ie = (0, Ct.usePresence)(a, I),
                        oe = Ot((0, e.useState)(I.isPlayable), 2),
                        ue = oe[0],
                        se = oe[1];
                    (0, e.useEffect)((function() {
                        ie.userPresenceType === Ct.PresenceType.Game && (ie.universeId === I.universeId ? se(I.isPlayable) : Ee.getGamePlayabilities([ie.universeId]).then((function(e) {
                            var t, r;
                            se(null !== (t = null == e || null === (r = e.data[0]) || void 0 === r ? void 0 : r.isPlayable) && void 0 !== t && t)
                        })))
                    }), [ie]);
                    var le = ie.placeId,
                        ce = (ie.gameId, Ot((0, e.useState)(!1), 2)),
                        de = ce[0],
                        fe = ce[1];
                    (0, e.useEffect)((function() {
                        Ee.getTrustedConnectionStatus(a).then((function(e) {
                            fe(e.data.status === _.TRUSTED_FRIEND_STATUS.TrustedFriends)
                        }))
                    }), [a]);
                    var me, pe, ve, he, ye;
                    if (v === Pt.FRIENDS || v === Pt.FOLLOWING) {
                        if (ie.userPresenceType === Ct.PresenceType.Game) {
                            var be = (ye = V(le), ue && ae ? {
                                lastLocationLink: ye,
                                truncateFirstLine: !0,
                                footer: t().createElement(P.Button, {
                                    onClick: function() {
                                        return e = a, void b.GameLauncher.followPlayerIntoGame(e);
                                        var e
                                    },
                                    size: "sm",
                                    width: "full",
                                    variant: "growth"
                                }, y("Action.JoinGame"))
                            } : {
                                lastLocationLink: ye,
                                truncateFirstLine: !1,
                                footer: null
                            });
                            ne = be.truncateFirstLine, n = be.footer
                        }
                        v !== Pt.FOLLOWING || N || (re = y("Label.Unfollowed"))
                    } else if (v === Pt.FRIENDREQUESTS) {
                        te = "";
                        ee ? (he = function(e) {
                            var r = e.slice(0, Ut).map((function(e) {
                                return t().createElement("li", {
                                    className: "text-overflow"
                                }, e)
                            }));
                            if (e.length > Ut) {
                                var n = e.length - Ut,
                                    a = y("Message.More", {
                                        plusSign: qt,
                                        remainingCount: n
                                    });
                                r.push(t().createElement("li", {
                                    className: "text-overflow"
                                }, a))
                            }
                            return r
                        }(ve = p), n = t().createElement(P.Tooltip, {
                            id: "mutual-friends-tooltip",
                            placement: "bottom",
                            content: he
                        }, t().createElement("span", {
                            className: "mutual-friends-tooltip-label"
                        }, y("Label.WebMutualFriend", {
                            mutualConnectionsCount: ve.length
                        })))) : Z ? (me = m.rootPlaceId, pe = V(me), n = t().createElement(e.Fragment, null, y("Label.SentFrom"), " ", t().createElement("a", {
                            href: pe,
                            className: "text-link avatar-card-footer-link"
                        }, m.name))) : d && (n = y("Label.SentFromQrCode"))
                    }
                    l && (te = y("Label.Inactive"));
                    var ge = t().createElement(It.Thumbnail2d, {
                        type: It.ThumbnailTypes.avatarHeadshot,
                        size: It.DefaultThumbnailSize,
                        targetId: a,
                        containerClass: "avatar-card-image"
                    });
                    return (0, e.useEffect)((function() {
                        var e = {
                            captchaActionType: "followUser",
                            captchaActivated: L,
                            captchaError: function() {
                                U(!1)
                            },
                            captchaSuccess: function(e) {
                                U(!1), S(a, e).then((function() {
                                    return w(!0)
                                }))
                            },
                            captchaReturnTokenInSuccessCb: !0,
                            captchaDismissed: function() {
                                U(!1)
                            },
                            endCaptcha: function() {
                                U(!1)
                            },
                            inputParams: {
                                dataExchange: k,
                                unifiedCaptchaId: G
                            }
                        };
                        b.CaptchaService.openCaptcha(e)
                    }), [L]), t().createElement(P.AvatarCardItem.Default, {
                        id: a,
                        disableCard: l || O || a < 0
                    }, t().createElement(P.AvatarCardItem.Content, null, t().createElement(P.AvatarCardItem.Headshot, {
                        imageLink: l ? "" : K,
                        statusIcon: t().createElement(Ct.PresenceStatusIcon, {
                            translate: y,
                            userId: a
                        }),
                        thumbnail: ge
                    }), t().createElement(P.AvatarCardItem.Caption, {
                        name: null != i ? i : y(_t),
                        displayName: null != o ? o : y(_t),
                        nameLink: l ? "" : K,
                        labelFirstLine: te,
                        labelSecondLine: re,
                        footer: n && t().createElement(At, null, n),
                        hasMenu: Y || $,
                        truncateFirstLine: ne,
                        verifiedBadgeData: u,
                        isRobloxPlus: s,
                        isTrustedConnection: de
                    }), Y && t().createElement(P.AvatarCardItem.Menu, null, N && t().createElement(P.AvatarCardItem.MenuItem, {
                        className: "friend-unfollow",
                        title: y("Action.Unfollow"),
                        onClick: function(e) {
                            e.preventDefault(), E(a).then((function() {
                                return w(!1)
                            })), l && (W(!0), Mt.clearUserDataStoreCache())
                        }
                    }), !N && t().createElement(P.AvatarCardItem.MenuItem, {
                        className: "friend-follow",
                        title: y("Action.Follow"),
                        onClick: function(e) {
                            e.preventDefault(), S(a).then((function() {
                                return w(!0)
                            }), (function(e) {
                                var t = e.message;
                                try {
                                    var r = JSON.parse(t);
                                    j(r.dxBlob), Q(r.unifiedCaptchaId)
                                } catch (e) {
                                    j(t)
                                }
                                U(!0)
                            }))
                        }
                    })), $ && t().createElement(P.AvatarCardItem.Menu, null, t().createElement(P.AvatarCardItem.MenuItem, {
                        className: "friend-unfriend",
                        title: y("Label.RemoveFriend"),
                        onClick: function() {
                            g(a).then(T)
                        }
                    }))), J && t().createElement(P.AvatarCardItem.ButtonGroup, null, t().createElement(P.Button, {
                        isLoading: O,
                        className: "ignore-friend",
                        onClick: function() {
                            D(!0), F({
                                id: a
                            }).finally((function() {
                                D(!1)
                            }))
                        },
                        variant: "secondary",
                        size: "md"
                    }, y("Action.Ignore")), t().createElement(P.Button, {
                        isLoading: O,
                        className: "accept-friend",
                        onClick: function() {
                            D(!0), R({
                                id: a
                            }).then((function() {
                                var e = {
                                    senderUserId: a,
                                    currentUserId: b.CurrentUser.userId,
                                    sentFromInGame: c,
                                    sentFromQrCode: d,
                                    timeFriendRequestWasSent: f
                                };
                                b.EventStream.SendEvent(xt.ACCEPTED_FRIEND_REQUEST, Lt, e)
                            })).finally((function() {
                                D(!1)
                            }))
                        },
                        variant: "cta",
                        size: "md"
                    }, y("Action.Accept"))))
                };
            kt.defaultProps = {
                verifiedBadgeData: null,
                isRobloxPlus: !1,
                isDeleted: !1,
                friendRequestSentAt: null,
                sourceUniverse: null,
                mutualFriends: [],
                presence: {
                    universeId: void 0
                }
            }, kt.propTypes = {
                id: D().number.isRequired,
                name: D().string.isRequired,
                displayName: D().string.isRequired,
                verifiedBadgeData: D().shape({
                    hasVerifiedBadge: D().bool,
                    titleText: D().string
                }),
                isRobloxPlus: D().bool,
                isDeleted: D().bool,
                friendRequestSentFromInGame: D().bool.isRequired,
                friendRequestSentFromQrCode: D().bool.isRequired,
                friendRequestSentAt: D().string,
                sourceUniverse: D().shape({
                    name: D().string,
                    rootPlaceId: D().number
                }),
                mutualFriends: D().arrayOf(D().string),
                position: D().number.isRequired,
                currentTab: D().string.isRequired,
                isMyProfile: D().bool.isRequired,
                translate: D().func.isRequired,
                unfollowFriend: D().func.isRequired,
                unfriend: D().func.isRequired,
                followFriend: D().func.isRequired,
                acceptFriendRequestThenRemoveCard: D().func.isRequired,
                declineFriendRequestThenRemoveCard: D().func.isRequired,
                refreshFriendsList: D().func.isRequired,
                presence: D().shape({
                    isPlayable: D().bool.isRequired,
                    universeId: D().number
                })
            };
            var jt = (0, c.withTranslations)(Fe(kt), Te),
                Bt = _.FRIENDS_EMPTY;

            function Gt(r) {
                var n = r.translate,
                    a = r.currentTab,
                    i = r.isMyProfile,
                    o = r.tooltipMsg,
                    u = r.title,
                    s = r.acceptFriendRequest,
                    c = r.declineFriendRequest,
                    d = r.refreshFriendsList,
                    f = r.setFriends,
                    m = r.updateFilter,
                    p = (0, e.useContext)(nt),
                    v = p.paginatedFriends,
                    h = p.friendRequestIdToUniverseSourceMap,
                    y = [_e.UserProfileField.Names.CombinedName, _e.UserProfileField.Names.Username, _e.UserProfileField.IsVerified, _e.UserProfileField.IsDeleted],
                    b = (0, e.useMemo)((function() {
                        return v.map((function(e) {
                            return e.id
                        }))
                    }), [v]),
                    E = (0, _e.useUserProfiles)(b, y).data,
                    g = function(t) {
                        var r = qe(),
                            n = (0, e.useMemo)((function() {
                                return Ae(new Set(t)).sort((function(e, t) {
                                    return e - t
                                }))
                            }), [t]),
                            a = n.join(","),
                            i = (0, l.useQuery)({
                                queryKey: ["identity-badges/plusStatus", a],
                                queryFn: function() {
                                    return Ue(n)
                                },
                                enabled: r && n.length > 0,
                                staleTime: 1 / 0
                            }),
                            o = i.data;
                        return {
                            data: null != o ? o : {},
                            isLoading: i.isFetching
                        }
                    }(b),
                    S = g.data,
                    R = function(e) {
                        return e((function(e) {
                            f(v.filter((function(t) {
                                return t.id !== e
                            })))
                        }))
                    },
                    F = R(s),
                    T = R(c);
                return t().createElement("div", {
                    className: "friends-content section"
                }, t().createElement(Tt, {
                    title: u,
                    tooltipMsg: o,
                    currentTab: a,
                    isMyProfile: i,
                    refreshFriendsList: d,
                    updateFilter: m
                }), v.length > 0 ? t().createElement(P.AvatarCardList, {
                    data: v
                }, (function(e, r) {
                    var n, o, u, s, l, c, f, m, p;
                    return t().createElement(jt, {
                        key: r,
                        currentTab: a,
                        isMyProfile: i,
                        refreshFriendsList: d,
                        position: r,
                        id: e.id,
                        name: null == E || null === (n = E[e.id]) || void 0 === n ? void 0 : n.names.username,
                        displayName: null == E || null === (o = E[e.id]) || void 0 === o ? void 0 : o.names.combinedName,
                        verifiedBadgeData: {
                            hasVerifiedBadge: null !== (u = null == E || null === (s = E[e.id]) || void 0 === s ? void 0 : s.isVerified) && void 0 !== u && u
                        },
                        isRobloxPlus: !0 === (null == S ? void 0 : S[e.id]),
                        isDeleted: null !== (l = null == E || null === (c = E[e.id]) || void 0 === c ? void 0 : c.isDeleted) && void 0 !== l && l,
                        friendRequestSentFromInGame: null !== (null == e || null === (f = e.friendRequest) || void 0 === f ? void 0 : f.sourceUniverseId),
                        friendRequestSentFromQrCode: "QrCode" === (null == e || null === (m = e.friendRequest) || void 0 === m ? void 0 : m.originSourceType),
                        friendRequestSentAt: null == e || null === (p = e.friendRequest) || void 0 === p ? void 0 : p.sentAt,
                        sourceUniverse: (null == e ? void 0 : e.id) in h ? h[e.id] : null,
                        mutualFriends: (null == e ? void 0 : e.mutualFriendsList) || [],
                        presence: e.presence,
                        unfollowFriend: e.unfollowFriend,
                        unfriend: e.unfriend,
                        followFriend: e.followFriend,
                        acceptFriendRequestThenRemoveCard: F,
                        declineFriendRequestThenRemoveCard: T
                    })
                })) : t().createElement("div", {
                    className: "section-content-off"
                }, " ", n(Bt)))
            }
            Gt.defaultProps = {}, Gt.propTypes = {
                translate: D().func.isRequired,
                currentTab: D().string.isRequired,
                isMyProfile: D().bool.isRequired,
                tooltipMsg: D().string.isRequired,
                title: D().string.isRequired,
                acceptFriendRequest: D().func.isRequired,
                declineFriendRequest: D().func.isRequired,
                refreshFriendsList: D().func.isRequired,
                setFriends: D().func.isRequired,
                updateFilter: D().func.isRequired
            };
            var Qt, Ht = (0, c.withTranslations)(Fe(Gt), Te);

            function zt(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }
            var Wt = _.FRIENDTABS,
                Vt = {
                    friendshipDestroyed: "FriendshipDestroyed",
                    friendshipCreated: "FriendshipCreated",
                    friendshipDeclined: "FriendshipDeclined",
                    friendshipRequested: "FriendshipRequested"
                },
                Yt = {
                    FRIENDS_NOTIFICATIONS: Vt,
                    PRESENCE_NOTIFICATIONS: {
                        presenceChanged: "PresenceChanged"
                    },
                    FRIENDS_EVENT_TYPE: "FriendshipNotifications",
                    PRESENCE_EVENT_TYPE: "PresenceBulkNotifications",
                    TAB_EVENTS_MAP: (Qt = {}, zt(Qt, Wt.FRIENDS, [Vt.friendshipDestroyed, Vt.friendshipCreated]), zt(Qt, Wt.FRIENDREQUESTS, [Vt.friendshipRequested, Vt.friendshipDeclined, Vt.friendshipCreated]), Qt)
                },
                Jt = (b.EnvironmentUrls.accountSettingsApi, b.EnvironmentUrls.apiGatewayUrl),
                Xt = function() {
                    return {
                        url: "".concat(Jt, "/user-blocking-api/v1/users/batch-check-reciprocal-block"),
                        withCredentials: !0
                    }
                },
                $t = function(e, t, r, n) {
                    return new(r || (r = Promise))((function(a, i) {
                        function o(e) {
                            try {
                                s(n.next(e))
                            } catch (e) {
                                i(e)
                            }
                        }

                        function u(e) {
                            try {
                                s(n.throw(e))
                            } catch (e) {
                                i(e)
                            }
                        }

                        function s(e) {
                            var t;
                            e.done ? a(e.value) : (t = e.value, t instanceof r ? t : new r((function(e) {
                                e(t)
                            }))).then(o, u)
                        }
                        s((n = n.apply(e, t || [])).next())
                    }))
                },
                Kt = function(e, t) {
                    var r, n, a, i, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    };
                    return i = {
                        next: u(0),
                        throw: u(1),
                        return: u(2)
                    }, "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                        return this
                    }), i;

                    function u(i) {
                        return function(u) {
                            return function(i) {
                                if (r) throw new TypeError("Generator is already executing.");
                                for (; o;) try {
                                    if (r = 1, n && (a = 2 & i[0] ? n.return : i[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, i[1])).done) return a;
                                    switch (n = 0, a && (i = [2 & i[0], a.value]), i[0]) {
                                        case 0:
                                        case 1:
                                            a = i;
                                            break;
                                        case 4:
                                            return o.label++, {
                                                value: i[1],
                                                done: !1
                                            };
                                        case 5:
                                            o.label++, n = i[1], i = [0];
                                            continue;
                                        case 7:
                                            i = o.ops.pop(), o.trys.pop();
                                            continue;
                                        default:
                                            if (!(a = o.trys, (a = a.length > 0 && a[a.length - 1]) || 6 !== i[0] && 2 !== i[0])) {
                                                o = 0;
                                                continue
                                            }
                                            if (3 === i[0] && (!a || i[1] > a[0] && i[1] < a[3])) {
                                                o.label = i[1];
                                                break
                                            }
                                            if (6 === i[0] && o.label < a[1]) {
                                                o.label = a[1], a = i;
                                                break
                                            }
                                            if (a && o.label < a[2]) {
                                                o.label = a[2], o.ops.push(i);
                                                break
                                            }
                                            a[2] && o.ops.pop(), o.trys.pop();
                                            continue
                                    }
                                    i = t.call(e, o)
                                } catch (e) {
                                    i = [6, e], n = 0
                                } finally {
                                    r = a = 0
                                }
                                if (5 & i[0]) throw i[1];
                                return {
                                    value: i[0] ? i[1] : void 0,
                                    done: !0
                                }
                            }([i, u])
                        }
                    }
                },
                Zt = function(e) {
                    return $t(void 0, void 0, Promise, (function() {
                        var t;
                        return Kt(this, (function(r) {
                            switch (r.label) {
                                case 0:
                                    return t = parseInt(b.CurrentUser.userId, 10), Number.isNaN(t) || !t ? [2, {
                                        users: [{
                                            isBlocked: !1,
                                            isBlockingViewer: !1,
                                            userId: 0
                                        }]
                                    }] : [4, a.httpService.post(Xt(), {
                                        userIds: e,
                                        requesterUserId: t
                                    })];
                                case 1:
                                    return [2, r.sent().data]
                            }
                        }))
                    }))
                };

            function er(e, t, r, n, a, i, o) {
                try {
                    var u = e[i](o),
                        s = u.value
                } catch (e) {
                    return void r(e)
                }
                u.done ? t(s) : Promise.resolve(s).then(n, a)
            }

            function tr(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise((function(n, a) {
                        var i = e.apply(t, r);

                        function o(e) {
                            er(i, n, a, o, u, "next", e)
                        }

                        function u(e) {
                            er(i, n, a, o, u, "throw", e)
                        }
                        o(void 0)
                    }))
                }
            }
            var rr = function() {
                    var e = tr(regeneratorRuntime.mark((function e(t, r, n) {
                        var i, o, u, s;
                        return regeneratorRuntime.wrap((function(e) {
                            for (;;) switch (e.prev = e.next) {
                                case 0:
                                    return i = r ? btoa(JSON.stringify(r)) : null, o = $(t, i, n), e.next = 4, a.httpService.get(o);
                                case 4:
                                    return u = e.sent, s = u.data, e.abrupt("return", s);
                                case 7:
                                case "end":
                                    return e.stop()
                            }
                        }), e)
                    })));
                    return function(t, r, n) {
                        return e.apply(this, arguments)
                    }
                }(),
                nr = function() {
                    var e = tr(regeneratorRuntime.mark((function e(t, r, n, i) {
                        var o, u, s, l;
                        return regeneratorRuntime.wrap((function(e) {
                            for (;;) switch (e.prev = e.next) {
                                case 0:
                                    return o = r ? btoa(JSON.stringify(r)) : null, u = K(t, o, n, i), e.next = 4, a.httpService.get(u);
                                case 4:
                                    return s = e.sent, l = s.data, e.abrupt("return", l);
                                case 7:
                                case "end":
                                    return e.stop()
                            }
                        }), e)
                    })));
                    return function(t, r, n, a) {
                        return e.apply(this, arguments)
                    }
                }();

            function ar(e, t, r, n, a, i, o) {
                try {
                    var u = e[i](o),
                        s = u.value
                } catch (e) {
                    return void r(e)
                }
                u.done ? t(s) : Promise.resolve(s).then(n, a)
            }

            function ir(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise((function(n, a) {
                        var i = e.apply(t, r);

                        function o(e) {
                            ar(i, n, a, o, u, "next", e)
                        }

                        function u(e) {
                            ar(i, n, a, o, u, "throw", e)
                        }
                        o(void 0)
                    }))
                }
            }
            var or = function() {
                    var e = ir(regeneratorRuntime.mark((function e(t) {
                        var r;
                        return regeneratorRuntime.wrap((function(e) {
                            for (;;) switch (e.prev = e.next) {
                                case 0:
                                    return e.prev = 0, e.next = 3, rr("MustHideConnections", [{
                                        name: "vieweeUserId",
                                        type: "UserId",
                                        value: "".concat(t)
                                    }]);
                                case 3:
                                    return r = e.sent, e.abrupt("return", "Granted" === (null == r ? void 0 : r.access));
                                case 7:
                                    e.prev = 7, e.t0 = e.catch(0), console.debug(e.t0);
                                case 10:
                                    return e.abrupt("return", !0);
                                case 11:
                                case "end":
                                    return e.stop()
                            }
                        }), e, null, [
                            [0, 7]
                        ])
                    })));
                    return function(t) {
                        return e.apply(this, arguments)
                    }
                }(),
                ur = function() {
                    var e = ir(regeneratorRuntime.mark((function e(t) {
                        var r;
                        return regeneratorRuntime.wrap((function(e) {
                            for (;;) switch (e.prev = e.next) {
                                case 0:
                                    return e.prev = 0, e.next = 3, Zt([parseInt(t, 10)]);
                                case 3:
                                    if (!(null != (r = e.sent) && r.users && r.users.length > 0)) {
                                        e.next = 6;
                                        break
                                    }
                                    return e.abrupt("return", r.users[0].isBlockingViewer);
                                case 6:
                                    e.next = 11;
                                    break;
                                case 8:
                                    e.prev = 8, e.t0 = e.catch(0), console.debug(e.t0);
                                case 11:
                                    return e.abrupt("return", !0);
                                case 12:
                                case "end":
                                    return e.stop()
                            }
                        }), e, null, [
                            [0, 8]
                        ])
                    })));
                    return function(t) {
                        return e.apply(this, arguments)
                    }
                }();

            function sr(e, t, r, n, a, i, o) {
                try {
                    var u = e[i](o),
                        s = u.value
                } catch (e) {
                    return void r(e)
                }
                u.done ? t(s) : Promise.resolve(s).then(n, a)
            }

            function lr(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise((function(n, a) {
                        var i = e.apply(t, r);

                        function o(e) {
                            sr(i, n, a, o, u, "next", e)
                        }

                        function u(e) {
                            sr(i, n, a, o, u, "throw", e)
                        }
                        o(void 0)
                    }))
                }
            }

            function cr(e, t) {
                var r = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var n = Object.getOwnPropertySymbols(e);
                    t && (n = n.filter((function(t) {
                        return Object.getOwnPropertyDescriptor(e, t).enumerable
                    }))), r.push.apply(r, n)
                }
                return r
            }

            function dr(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {};
                    t % 2 ? cr(Object(r), !0).forEach((function(t) {
                        fr(e, t, r[t])
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(r)) : cr(Object(r)).forEach((function(t) {
                        Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(r, t))
                    }))
                }
                return e
            }

            function fr(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }
            var mr = q.dataStores.userDataStore,
                pr = _.MAX_PER_PAGE,
                vr = _.FRIENDTABS,
                hr = _.SORT_ORDER,
                yr = _.CACHE_CRITERIA,
                br = Yt.TAB_EVENTS_MAP,
                Er = Yt.FRIENDS_EVENT_TYPE,
                gr = !b.CurrentUser.isAuthenticated,
                Sr = function() {
                    var e = lr(regeneratorRuntime.mark((function e(t, r) {
                        return regeneratorRuntime.wrap((function(e) {
                            for (;;) switch (e.prev = e.next) {
                                case 0:
                                    if (!r) {
                                        e.next = 2;
                                        break
                                    }
                                    return e.abrupt("return", !1);
                                case 2:
                                    return e.next = 4, ur(t);
                                case 4:
                                    if (!e.sent) {
                                        e.next = 6;
                                        break
                                    }
                                    return e.abrupt("return", !0);
                                case 6:
                                    return e.abrupt("return", or(t));
                                case 7:
                                case "end":
                                    return e.stop()
                            }
                        }), e)
                    })));
                    return function(t, r) {
                        return e.apply(this, arguments)
                    }
                }(),
                Rr = function(e) {
                    var t = e.currentTab,
                        r = e.profileUserId,
                        n = e.currentCursor,
                        a = e.useCache,
                        i = e.refreshCache,
                        o = void 0 !== i && i,
                        u = e.fetchMutualFriends,
                        s = void 0 !== u && u,
                        l = e.isMyProfile,
                        c = void 0 !== l && l,
                        d = e.friendsNameFilter,
                        f = void 0 === d ? null : d,
                        m = e.queryChanged,
                        p = void 0 !== m && m,
                        v = e.isTrustedFilterEnabled,
                        h = void 0 === v ? null : v,
                        y = new Promise((function() {
                            return {
                                friendsData: []
                            }
                        })),
                        b = function(e) {
                            var t = e.userData,
                                r = e.prevCursor,
                                n = e.nextCursor,
                                a = [];
                            if (t && t.length > 0)
                                for (var i = 0; i < t.length; i++) {
                                    var o, u, s = null === (o = t[i]) || void 0 === o || null === (u = o.presence) || void 0 === u ? void 0 : u.universeId;
                                    s && a.push(s)
                                }
                            return a.length > 0 ? Ee.getGamePlayabilities(a).then((function(e) {
                                var a = e.data,
                                    i = {};
                                if (a && a.length)
                                    for (var o = 0; o < a.length; o++) {
                                        var u = a[o];
                                        i[u.universeId] = u.isPlayable
                                    }
                                return t.forEach((function(e) {
                                    e.presence && (e.presence.isPlayable = i[e.presence.universeId])
                                })), {
                                    friendsData: t,
                                    prev: r,
                                    next: n
                                }
                            })).catch((function() {
                                return {
                                    friendsData: t,
                                    prev: r,
                                    next: n
                                }
                            })) : {
                                friendsData: t,
                                prev: r,
                                next: n
                            }
                        },
                        E = function() {
                            var e = lr(regeneratorRuntime.mark((function e(t) {
                                var r, n, a, i, o, u;
                                return regeneratorRuntime.wrap((function(e) {
                                    for (;;) switch (e.prev = e.next) {
                                        case 0:
                                            return r = t.userData, n = t.prevCursor, a = t.nextCursor, e.prev = 1, e.next = 4, Nt().getPresenceProvider().getPresences(r.map((function(e) {
                                                return e.id
                                            })));
                                        case 4:
                                            return i = e.sent, o = new Map(i.map((function(e) {
                                                return [e.userId, e]
                                            }))), u = r.map((function(e) {
                                                var t;
                                                return dr(dr({}, e), {}, {
                                                    presence: null !== (t = o.get(e.id)) && void 0 !== t ? t : {}
                                                })
                                            })), e.abrupt("return", {
                                                userData: u,
                                                prevCursor: n,
                                                nextCursor: a
                                            });
                                        case 10:
                                            return e.prev = 10, e.t0 = e.catch(1), e.abrupt("return", {
                                                userData: r,
                                                prevCursor: n,
                                                nextCursor: a
                                            });
                                        case 13:
                                        case "end":
                                            return e.stop()
                                    }
                                }), e, null, [
                                    [1, 10]
                                ])
                            })));
                            return function(t) {
                                return e.apply(this, arguments)
                            }
                        }(),
                        g = function() {
                            var e = lr(regeneratorRuntime.mark((function e(t) {
                                var n, a, i;
                                return regeneratorRuntime.wrap((function(e) {
                                    for (;;) switch (e.prev = e.next) {
                                        case 0:
                                            return n = t.userData, a = t.prevCursor, i = t.nextCursor, e.next = 3, Sr(r, c);
                                        case 3:
                                            if (!e.sent) {
                                                e.next = 5;
                                                break
                                            }
                                            return e.abrupt("return", {
                                                userData: [],
                                                prevCursor: null,
                                                nextCursor: null
                                            });
                                        case 5:
                                            return e.abrupt("return", {
                                                userData: n,
                                                prevCursor: a,
                                                nextCursor: i
                                            });
                                        case 6:
                                        case "end":
                                            return e.stop()
                                    }
                                }), e)
                            })));
                            return function(t) {
                                return e.apply(this, arguments)
                            }
                        }(),
                        S = function() {
                            return dr(dr({}, arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : yr), {}, {
                                CACHE_CRITERIA: yr
                            })
                        }({
                            useCache: a,
                            refreshCache: o
                        });
                    switch (t) {
                        case vr.FRIENDS:
                            if (null == f || "" === f) y = (null === h || !1 === h ? Ee.getPaginatedFriends : Ee.getPaginatedTrustedConnections)(r, 0 === n || p ? "" : n, c, p).then((function(e) {
                                return {
                                    userData: e.data.PageItems,
                                    prevCursor: e.data.PreviousCursor,
                                    nextCursor: e.data.NextCursor
                                }
                            })).then(g).then(E).then(b);
                            else y = Ee.getSearchedFriends(r, 0 === n || p ? "" : n, f, p).then((function(e) {
                                return {
                                    userData: e.data.PageItems,
                                    prevCursor: e.data.PreviousCursor,
                                    nextCursor: e.data.NextCursor
                                }
                            })).then(g).then(E).then(b);
                            break;
                        case vr.FOLLOWERS:
                            y = mr.getFollowers({
                                userId: r,
                                cursor: n,
                                sortOrder: hr.desc,
                                limit: pr,
                                isGuest: gr
                            }, S).then(g).then(b);
                            break;
                        case vr.FOLLOWING:
                            y = mr.getFollowings({
                                userId: r,
                                cursor: n,
                                sortOrder: hr.desc,
                                limit: pr,
                                isGuest: gr
                            }, S).then(g).then(b);
                            break;
                        case vr.FRIENDREQUESTS:
                            (0 === n || p) && Ee.clearNewFriendRequests(), y = mr.getFriendsRequests({
                                userId: r,
                                cursor: n,
                                limit: pr,
                                fetchMutualFriends: s,
                                isGuest: gr
                            }, S).then(b);
                            break;
                        default:
                            return y.catch(console.debug)
                    }
                    return y.catch(console.debug)
                };

            function Fr(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var r = [],
                        n = !0,
                        a = !1,
                        i = void 0;
                    try {
                        for (var o, u = e[Symbol.iterator](); !(n = (o = u.next()).done) && (r.push(o.value), !t || r.length !== t); n = !0);
                    } catch (e) {
                        a = !0, i = e
                    } finally {
                        try {
                            n || null == u.return || u.return()
                        } finally {
                            if (a) throw i
                        }
                    }
                    return r
                }(e, t) || function(e, t) {
                    if (!e) return;
                    if ("string" == typeof e) return Tr(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    "Object" === r && e.constructor && (r = e.constructor.name);
                    if ("Map" === r || "Set" === r) return Array.from(e);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return Tr(e, t)
                }(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function Tr(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = new Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var Ir = Rr,
                Cr = function(e, t) {
                    if (gr) return function() {};
                    var r = function(r) {
                            r && r.Type && br[e].includes(r.Type) && t(r.Type)
                        },
                        n = b.RealTime.Factory.GetClient();
                    return n.Subscribe(Er, r),
                        function() {
                            n.Unsubscribe(Er, r)
                        }
                },
                Nr = _.START_PAGE,
                wr = _.MAX_PER_PAGE,
                Ar = _.FRIENDTABS,
                Or = _.SORT_OPTIONS,
                Dr = _.EVENTS,
                Pr = _.FRIENDS_REQUEST_LIST_CONTEXT,
                xr = _.DEVICE_TYPES,
                Lr = _.FRIEND_FILTER_OPTIONS;

            function qr(r) {
                var n = r.currentTab,
                    a = r.metadata,
                    i = a.profileUserId,
                    o = a.isMyProfile,
                    u = a.onlyShowContents,
                    s = r.friends,
                    l = r.setFriends,
                    c = r.loadMoreFriends,
                    d = r.tooltipMsg,
                    f = r.title,
                    m = r.enableTabLoader,
                    p = r.disableTabLoader,
                    v = (r.tabLoader, Fr((0, e.useState)(Nr), 2)),
                    h = v[0],
                    y = v[1],
                    E = Fr((0, e.useState)(0), 2),
                    g = E[0],
                    S = E[1],
                    R = Fr((0, e.useState)(null), 2),
                    F = R[0],
                    T = R[1],
                    I = (0, e.useContext)(nt),
                    C = I.friendsCount,
                    N = I.setFriendsCount,
                    w = I.friendsNameFilter,
                    A = I.setFriendsNameFilter,
                    O = I.friendsStatusFilter,
                    D = I.setFriendsStatusFilter,
                    x = I.friendsSort,
                    L = I.paginatedFriends,
                    q = I.setPaginatedFriends,
                    U = I.setFriendRequestIdToUniverseSourceMap,
                    _ = I.isTrustedFilterEnabled,
                    M = I.setIsTrustedFilterEnabled,
                    k = Ie.deviceMeta.getDeviceMeta(),
                    j = (null == k ? void 0 : k.isDesktop) && (null == k ? void 0 : k.deviceType) === xr.computer,
                    B = "%2c";
                (0, e.useEffect)((function() {
                    if (n === Ar.FRIENDREQUESTS && 0 !== L.length) {
                        var e = L.filter((function(e) {
                            return e && e.friendRequest && e.friendRequest.sourceUniverseId
                        })).map((function(e) {
                            return e.friendRequest.sourceUniverseId
                        }));
                        0 !== e.length && Ee.getGames(e).then((function(e) {
                            var t;
                            if (null != e && null !== (t = e.data) && void 0 !== t && t.data) {
                                var r = e.data.data,
                                    n = L.reduce((function(e, t) {
                                        var n;
                                        if (null != t && null !== (n = t.friendRequest) && void 0 !== n && n.sourceUniverseId) {
                                            var a = t.friendRequest.sourceUniverseId,
                                                i = r.find((function(e) {
                                                    return e.id === a
                                                }));
                                            i && (e[t.id] = i)
                                        }
                                        return e
                                    }), {});
                                U(n)
                            }
                        }))
                    }
                }), [L, n]), n === Ar.FRIENDS && (x === Or.ALPHABETICAL ? s.sort((function(e, t) {
                    return e.displayName.toLowerCase() < t.displayName.toLowerCase() ? -1 : e.displayName.toLowerCase() > t.displayName.toLowerCase() ? 1 : 0
                })) : x === Or.STATUS && s.sort((function(e, t) {
                    if (e.presence.userPresenceType === t.presence.userPresenceType) {
                        if (e.displayName.toLowerCase() < t.displayName.toLowerCase()) return -1;
                        if (e.displayName.toLowerCase() > t.displayName.toLowerCase()) return 1
                    }
                    return 2 === e.presence.userPresenceType ? -1 : 2 === t.presence.userPresenceType || e.presence.userPresenceType < t.presence.userPresenceType ? 1 : e.presence.userPresenceType > t.presence.userPresenceType ? -1 : 0
                })));
                var G = function(e, t) {
                        if (n === Ar.FRIENDREQUESTS) {
                            var r = t.slice((e - 1) * wr, e * wr).length,
                                a = {
                                    currentUserId: parseInt(i, 10),
                                    pageNumber: e,
                                    numberOfFriendRequestsCurrentlyDisplayed: r
                                };
                            b.EventStream.SendEvent(Dr.FRIEND_REQUESTS_DISPLAYED, Pr, a);
                            var o = t.map((function(e) {
                                    return e.friendRequest.senderId
                                })).join(B),
                                u = t.map((function(e) {
                                    return e.mutualFriendsList && e.mutualFriendsList.length > 0 ? "T" : "F"
                                })).join(B),
                                s = t.map((function(e) {
                                    return e.friendRequest && e.friendRequest.sourceUniverseId ? "T" : "F"
                                })).join(B),
                                l = Array.from({
                                    length: t.length
                                }, (function(e, t) {
                                    return t + 1
                                })).join(B);
                            b.EventStream.SendEvent(Dr.FRIENDS_LANDING_PAGE_LOAD, "friendsLanding", {
                                target: "www",
                                requestingUserId: o,
                                mutualFriendsContext: u,
                                gamesContext: s,
                                absPosition: l
                            })
                        }
                    },
                    Q = s.slice((h - 1) * wr, h * wr);
                (0, e.useEffect)((function() {
                    JSON.stringify(L) !== JSON.stringify(Q) && q(Q)
                }), [s, w, O, x, h]);
                var H = Fr((0, e.useState)(JSON.stringify(s)), 2),
                    z = H[0],
                    W = H[1],
                    V = Math.max(Math.ceil(s.length / wr), 1),
                    Y = F || h > Nr || V > 1 || C > wr,
                    J = !!F || h < V;
                h > V && y(V);
                var X = function() {
                        m();
                        var e = function(e) {
                            var t = e.friendsData,
                                r = e.next;
                            l(t), T(r), p()
                        };
                        Ir({
                            currentTab: Ar.FRIENDS,
                            profileUserId: i,
                            useCache: !1,
                            refreshCache: !0,
                            isMyProfile: o,
                            friendsNameFilter: w,
                            isTrustedFilterEnabled: _
                        }).then((function(t) {
                            Ar.FRIENDS === n && e(t)
                        })), Ir({
                            currentTab: Ar.FRIENDREQUESTS,
                            profileUserId: i,
                            currentCursor: g,
                            useCache: !1,
                            refreshCache: !0,
                            isMyProfile: o,
                            friendsNameFilter: w
                        }).then((function(t) {
                            Ar.FRIENDREQUESTS === n && e(t)
                        }))
                    },
                    $ = (0, e.useCallback)((function(e) {
                        l([]), T(null), S(0), A(null), M(e === Lr.TRUSTED)
                    }), []);
                (0, e.useEffect)((function() {
                    m(), l([]), N(0), A(null), D(null)
                }), []), (0, e.useEffect)((function() {
                    if (null != w) {
                        y(Nr), T(null);
                        var e = !0;
                        m();
                        var t = Cr(n, X);
                        return Ir({
                                currentTab: n,
                                profileUserId: i,
                                currentCursor: g,
                                useCache: !1,
                                isMyProfile: o,
                                friendsNameFilter: w,
                                queryChanged: !0
                            }).then((function(t) {
                                var r = t.friendsData,
                                    n = t.next;
                                e && (l(r), T(n), p(), G(h, r))
                            })),
                            function() {
                                e = !1, t()
                            }
                    }
                    return function() {}
                }), [w]), (0, e.useEffect)((function() {
                    var e = !0;
                    m();
                    var t = Cr(n, X);
                    return Ir({
                            currentTab: n,
                            profileUserId: i,
                            currentCursor: g,
                            useCache: !1,
                            isMyProfile: o,
                            friendsNameFilter: w,
                            isTrustedFilterEnabled: _
                        }).then((function(t) {
                            var r = t.friendsData,
                                n = t.next;
                            e && (c(r), T(n), p(), G(h, r))
                        })),
                        function() {
                            e = !1, t()
                        }
                }), [n, g, i, _]), (0, e.useEffect)((function() {
                    F && !g && S(F)
                }), [F, g]), (0, e.useEffect)((function() {
                    var e = !0;
                    return function() {
                            var t = JSON.stringify(s);
                            if (z !== t) switch (W(t), n) {
                                case Ar.FRIENDS:
                                    Ee.getFriendsCount(i).then((function(t) {
                                        var r = t.data.count;
                                        e && N(r)
                                    }));
                                    break;
                                case Ar.FOLLOWING:
                                    Ee.getFollowingsCount(i).then((function(t) {
                                        var r = t.data.count;
                                        e && N(r)
                                    }));
                                    break;
                                case Ar.FOLLOWERS:
                                    Ee.getFollowersCount(i).then((function(t) {
                                        var r = t.data.count;
                                        e && N(r)
                                    }));
                                    break;
                                case Ar.FRIENDREQUESTS:
                                    o && Ee.getFriendsRequestCount().then((function(t) {
                                        var r = t.data.count;
                                        if (e) {
                                            N(r);
                                            var n = {
                                                currentUserId: parseInt(i, 10),
                                                numberOfFriendRequests: r
                                            };
                                            b.EventStream.SendEvent(Dr.TOTAL_FRIEND_REQUESTS_RETRIEVED, Pr, n)
                                        }
                                    }))
                            }
                        }(),
                        function() {
                            e = !1
                        }
                }), [n, s]);
                var K = Y ? "mutual-friends-extra-padding-with-pagination" : "mutual-friends-extra-padding-without-pagination";
                return t().createElement(t().Fragment, null, t().createElement(Ht, {
                    isMyProfile: o,
                    tooltipMsg: d,
                    title: f,
                    currentTab: n,
                    onlyShowContents: u,
                    refreshFriendsList: X,
                    updateFilter: $
                }), Y && t().createElement(P.Pagination, {
                    current: h,
                    hasNext: J,
                    onChange: function(e) {
                        e > h && e >= V && F && S(F || 0), y(e), G(e, s)
                    }
                }), n === Ar.FRIENDREQUESTS && !j && t().createElement("div", {
                    className: K
                }))
            }
            qr.defaultProps = {
                friends: []
            }, qr.propTypes = {
                friends: D().arrayOf(D().any),
                setFriends: D().func.isRequired,
                loadMoreFriends: D().func.isRequired,
                metadata: D().objectOf(D().any).isRequired,
                tooltipMsg: D().string.isRequired,
                title: D().string.isRequired,
                currentTab: D().string.isRequired,
                enableTabLoader: D().func.isRequired,
                disableTabLoader: D().func.isRequired,
                tabLoader: D().objectOf(D().any).isRequired
            };
            var Ur = Fe(qr),
                _r = function(e) {
                    var r = e.title,
                        n = e.show;
                    return t().createElement("div", {
                        className: "page-header section"
                    }, n && t().createElement("div", {
                        className: "container-header"
                    }, t().createElement("h1", {
                        className: "friends-title"
                    }, r)))
                };
            _r.propTypes = {
                title: D().string.isRequired,
                show: D().bool.isRequired
            };
            var Mr, kr = _r,
                jr = b.EnvironmentUrls.apiGatewayUrl,
                Br = function() {
                    return jr + "/product-experimentation-platform/v1/projects/1/layers/Social.Friends/values"
                },
                Gr = function(e) {
                    var t = {
                            url: Br(),
                            timeout: 2e3,
                            withCredentials: !0
                        },
                        r = {
                            parameters: e.join(",")
                        };
                    return a.httpService.get(t, r)
                };
            ! function(e) {
                e.FriendRecommendationSource = "friend_recommendation_source", e.JoinButtonFriendCard = "show_join_game_button_in_friend_card", e.JoinButtonFriendCardDesktopOnly = "show_join_game_button_in_friend_card_desktop_only", e.TcManagementHub = "show_tc_management_hub"
            }(Mr || (Mr = {}));
            var Qr = Mr,
                Hr = "friendRecommendations",
                zr = "accept",
                Wr = "request",
                Vr = "displayed";
            var Yr = {
                    emitCarouselDisplayedEvent: function(e, t, r) {
                        b.EventStream.SendEvent(Hr, Vr, {
                            uid: e,
                            numberOfRecommendations: r,
                            variant: t
                        })
                    },
                    emitAcceptedFriendRequestEvent: function(e, t) {
                        b.EventStream.SendEvent(Hr, zr, {
                            uid: e,
                            recipientId: t
                        })
                    },
                    emitFriendRequestSentEvent: function(e, t) {
                        b.EventStream.SendEvent(Hr, Wr, {
                            uid: e,
                            recipientId: t
                        })
                    }
                },
                Jr = b.EnvironmentUrls.friendsApi;
            var Xr = {
                getFriendRecommendations: function(e) {
                    var t = {
                        retryable: !0,
                        withCredentials: !0,
                        url: "".concat(Jr, "/v1/users/").concat(e, "/friends/recommendations")
                    };
                    return a.httpService.get(t).then((function(e) {
                        return e.data.data.map((function(e) {
                            return {
                                userName: e.name,
                                displayName: e.displayName,
                                userId: e.id,
                                pendingRequest: null != e.friendRequest,
                                mutualFriendsList: e.mutualFriendsList
                            }
                        }))
                    }))
                },
                sendOrAcceptFriendRequest: function(e, t) {
                    return t ? function(e) {
                        var t = {
                                retryable: !1,
                                withCredentials: !0,
                                url: "".concat(Jr, "/v1/users/").concat(e, "/accept-friend-request")
                            },
                            r = a.httpService.post(t);
                        return r.then((function() {
                            return Yr.emitAcceptedFriendRequestEvent(b.CurrentUser.userId, e)
                        }), (function() {})), r
                    }(e) : function(e) {
                        var t = {
                                retryable: !1,
                                withCredentials: !0,
                                url: "".concat(Jr, "/v1/users/").concat(e, "/request-friendship")
                            },
                            r = a.httpService.post(t, {
                                friendshipOriginSourceType: "recommendations"
                            });
                        return r.then((function() {
                            return Yr.emitFriendRequestSentEvent(b.CurrentUser.userId, e)
                        }), (function() {})), r
                    }(e)
                },
                getFriendCount: function(e) {
                    var t = {
                        retryable: !0,
                        withCredentials: !0,
                        url: "".concat(Jr, "/v1/users/").concat(e, "/friends/count")
                    };
                    return a.httpService.get(t)
                }
            };

            function $r(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var r = [],
                        n = !0,
                        a = !1,
                        i = void 0;
                    try {
                        for (var o, u = e[Symbol.iterator](); !(n = (o = u.next()).done) && (r.push(o.value), !t || r.length !== t); n = !0);
                    } catch (e) {
                        a = !0, i = e
                    } finally {
                        try {
                            n || null == u.return || u.return()
                        } finally {
                            if (a) throw i
                        }
                    }
                    return r
                }(e, t) || function(e, t) {
                    if (!e) return;
                    if ("string" == typeof e) return Kr(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    "Object" === r && e.constructor && (r = e.constructor.name);
                    if ("Map" === r || "Set" === r) return Array.from(e);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return Kr(e, t)
                }(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function Kr(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = new Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var Zr = t().useState,
                en = _.PLUS_SIGN,
                tn = _.MUTUAL_FRIENDS_SHOW_COUNT;

            function rn(e) {
                var r = e.userId,
                    n = e.userName,
                    i = e.displayName,
                    o = e.pendingRequest,
                    u = e.mutualFriends,
                    s = e.setError,
                    l = e.translate,
                    c = $r(Zr(!1), 2),
                    d = c[0],
                    f = c[1],
                    m = null != u && u.length > 0;
                var p;
                return t().createElement("div", {
                    className: "friend-recommendation-item"
                }, t().createElement("a", {
                    href: b.Endpoints.getAbsoluteUrl("/users/".concat(r, "/profile")),
                    className: "friend-recommendation-link"
                }, t().createElement("span", {
                    className: "avatar-container avatar-headshot text-link"
                }, t().createElement(It.Thumbnail2d, {
                    type: It.ThumbnailTypes.avatarHeadshot,
                    size: It.ThumbnailAvatarHeadshotSize.size96,
                    targetId: r,
                    imgClassName: "avatar-card-image"
                })), t().createElement("div", {
                    className: "friend-recommendation-info"
                }, t().createElement("span", {
                    className: "text-overflow friend-name font-caption-header friend-recommendation-name"
                }, i), t().createElement("span", {
                    className: "text-overflow text-secondary friend-recommendation-name"
                }, a.concatTexts.concat(["", n], a.concatTexts.connectors.at, !1)), o && d ? t().createElement("span", {
                    className: "text-overflow text-secondary friend-recommendation-name"
                }, l("Label.YouAreFriends")) : m && (p = function(e) {
                    var r = e.slice(0, tn).map((function(e) {
                        return t().createElement("li", {
                            className: "text-overflow"
                        }, e)
                    }));
                    if (e.length > tn) {
                        var n = e.length - tn,
                            a = l("Message.More", {
                                plusSign: en,
                                remainingCount: n
                            });
                        r.push(t().createElement("li", {
                            className: "text-overflow"
                        }, a))
                    }
                    return r
                }(u), t().createElement(P.Tooltip, {
                    id: "mutual-friends-tooltip",
                    placement: "bottom",
                    content: p
                }, t().createElement("span", {
                    className: "text-overflow text-secondary mutual-friends-tooltip-label friend-recommendation-name"
                }, l("Label.MutualFriend", {
                    mutualFriendsCount: u.length
                })))))), !(o && d) && t().createElement("button", {
                    type: "button",
                    className: L()("btn-control-md full-size add-friend-button ", {
                        disabled: d
                    }),
                    onClick: function() {
                        return s(""), void Xr.sendOrAcceptFriendRequest(r, o).then((function() {
                            return f(!0)
                        }), (function(e) {
                            var t, r;
                            null != e && null !== (t = e.data) && void 0 !== t && null !== (r = t.errors[0]) && void 0 !== r && r.userFacingMessage ? s(e.data.errors[0].userFacingMessage) : s(l("Label.MiscError"))
                        }))
                    }
                }, t().createElement("span", {
                    className: d ? "icon-sandglass" : o ? "icon-acceptfriend" : "icon-addfriend"
                })))
            }
            rn.defaultProps = {
                mutualFriends: []
            }, rn.propTypes = {
                userId: D().number.isRequired,
                userName: D().string.isRequired,
                displayName: D().string.isRequired,
                pendingRequest: D().bool.isRequired,
                mutualFriends: D().arrayOf(D().string),
                setError: D().func.isRequired,
                translate: D().func.isRequired
            };
            var nn = rn;

            function an(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var r = [],
                        n = !0,
                        a = !1,
                        i = void 0;
                    try {
                        for (var o, u = e[Symbol.iterator](); !(n = (o = u.next()).done) && (r.push(o.value), !t || r.length !== t); n = !0);
                    } catch (e) {
                        a = !0, i = e
                    } finally {
                        try {
                            n || null == u.return || u.return()
                        } finally {
                            if (a) throw i
                        }
                    }
                    return r
                }(e, t) || function(e, t) {
                    if (!e) return;
                    if ("string" == typeof e) return on(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    "Object" === r && e.constructor && (r = e.constructor.name);
                    if ("Map" === r || "Set" === r) return Array.from(e);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return on(e, t)
                }(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function on(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = new Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var un = t().useState,
                sn = t().useEffect,
                ln = t().useRef;

            function cn(e) {
                var r = e.friendRecommendations,
                    n = e.translate,
                    a = e.setError,
                    i = e.cardWidth,
                    o = e.contentWidth,
                    u = an(un(0), 2),
                    s = u[0],
                    l = u[1],
                    c = an(un(0), 2),
                    d = c[0],
                    f = c[1],
                    m = an(un(!1), 2),
                    p = m[0],
                    v = m[1],
                    h = an(un(!0), 2),
                    y = h[0],
                    b = h[1],
                    E = an(un(-1), 2),
                    g = E[0],
                    S = E[1],
                    R = ln(null),
                    F = ln(null),
                    T = function() {
                        return Math.floor(o(R) / i(F))
                    };
                sn((function() {
                    i(F) && f(-s * i(F))
                }), [s, g]), sn((function() {
                    v(i(F) && i(F) * r.length > o(R))
                }), [i.current, o.current, g]), sn((function() {
                    !p && s > 0 && l(0)
                }), [p, s]), sn((function() {
                    window.addEventListener("resize", (function() {
                        S(window.innerWidth), b(!1)
                    })), S(0)
                }), []);
                var I = [];
                r.forEach((function(e) {
                    I.push(t().createElement("li", {
                        ref: F,
                        "user-id": e.userId,
                        className: "list-item friend-recommendations-list-item"
                    }, t().createElement(nn, {
                        userId: e.userId,
                        userName: e.userName,
                        displayName: e.displayName,
                        pendingRequest: e.pendingRequest,
                        mutualFriends: e.mutualFriendsList,
                        setError: a,
                        translate: n
                    })))
                }));
                var C = function(e) {
                        i(F) && (e ? l(Math.max(0, s - T())) : s + T() < I.length && l(s + T()), b(!0))
                    },
                    N = function(e) {
                        var t = "";
                        return p ? (e && 0 === s || !e && s + T() >= I.length) && (t = " disabled") : t = " hidden", "scroller".concat(e ? "" : " next").concat(t)
                    };
                return t().createElement("div", {
                    className: L()("section-content remove-panel friend-recommendations-content", {
                        "friend-recommendations-content-with-scrollers": p
                    })
                }, t().createElement("button", {
                    type: "button",
                    className: N(!0),
                    onClick: function() {
                        return C(!0)
                    }
                }, t().createElement("div", {
                    className: "arrow"
                }, t().createElement("span", {
                    className: "icon-games-carousel-left"
                }))), t().createElement("div", {
                    ref: R,
                    className: L()("friend-recommendations-container", {
                        "animate-scroll": y
                    }),
                    style: {
                        left: "".concat(d, "px")
                    }
                }, t().createElement("ul", {
                    className: "hlist"
                }, I)), t().createElement("button", {
                    type: "button",
                    className: N(!1),
                    onClick: function() {
                        return C(!1)
                    }
                }, t().createElement("div", {
                    className: "arrow"
                }, t().createElement("span", {
                    className: "icon-games-carousel-right"
                }))))
            }
            cn.propTypes = {
                friendRecommendations: D().array.isRequired,
                translate: D().func.isRequired,
                setError: D().func.isRequired,
                cardWidth: D().func,
                contentWidth: D().func
            }, cn.defaultProps = {
                cardWidth: function(e) {
                    var t, r;
                    return null == e || null === (t = e.current) || void 0 === t || null === (r = t.getBoundingClientRect()) || void 0 === r ? void 0 : r.width
                },
                contentWidth: function(e) {
                    var t, r;
                    return null == e || null === (t = e.current) || void 0 === t || null === (r = t.getBoundingClientRect()) || void 0 === r ? void 0 : r.width
                }
            };
            var dn, fn = cn;
            ! function(e) {
                e.None = "none", e.Frequents = "frequents"
            }(dn || (dn = {}));
            var mn = dn;

            function pn(e, t, r, n, a, i, o) {
                try {
                    var u = e[i](o),
                        s = u.value
                } catch (e) {
                    return void r(e)
                }
                u.done ? t(s) : Promise.resolve(s).then(n, a)
            }

            function vn(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var r = [],
                        n = !0,
                        a = !1,
                        i = void 0;
                    try {
                        for (var o, u = e[Symbol.iterator](); !(n = (o = u.next()).done) && (r.push(o.value), !t || r.length !== t); n = !0);
                    } catch (e) {
                        a = !0, i = e
                    } finally {
                        try {
                            n || null == u.return || u.return()
                        } finally {
                            if (a) throw i
                        }
                    }
                    return r
                }(e, t) || function(e, t) {
                    if (!e) return;
                    if ("string" == typeof e) return hn(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    "Object" === r && e.constructor && (r = e.constructor.name);
                    if ("Map" === r || "Set" === r) return Array.from(e);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return hn(e, t)
                }(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function hn(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = new Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var yn = t().useState,
                bn = t().useEffect,
                En = vn((0, P.createModal)(), 2),
                gn = En[0],
                Sn = En[1];

            function Rn(e) {
                var r = e.translate,
                    n = vn(yn([]), 2),
                    a = n[0],
                    i = n[1],
                    o = vn(yn(!1), 2),
                    u = o[0],
                    s = o[1],
                    l = vn(yn(""), 2),
                    c = l[0],
                    d = l[1];
                return bn((function() {
                    var e;
                    (e = regeneratorRuntime.mark((function e() {
                        var t, r, n, a, o;
                        return regeneratorRuntime.wrap((function(e) {
                            for (;;) switch (e.prev = e.next) {
                                case 0:
                                    return e.prev = 0, e.next = 3, Gr([Qr.FriendRecommendationSource]);
                                case 3:
                                    if (r = e.sent, null === (t = r.data) || void 0 === t || !t[Qr.FriendRecommendationSource] || r.data[Qr.FriendRecommendationSource] === mn.None) {
                                        e.next = 13;
                                        break
                                    }
                                    return e.next = 7, Xr.getFriendCount(b.CurrentUser.userId);
                                case 7:
                                    if (a = e.sent, !(void 0 !== (null === (n = a.data) || void 0 === n ? void 0 : n.count) && a.data.count < 200)) {
                                        e.next = 13;
                                        break
                                    }
                                    return e.next = 11, Xr.getFriendRecommendations(b.CurrentUser.userId);
                                case 11:
                                    (o = e.sent).length > 0 && (s(!0), i(o), Yr.emitCarouselDisplayedEvent(b.CurrentUser.userId, r.data[Qr.FriendRecommendationSource], o.length));
                                case 13:
                                    e.next = 18;
                                    break;
                                case 15:
                                    e.prev = 15, e.t0 = e.catch(0), console.error(e.t0);
                                case 18:
                                case "end":
                                    return e.stop()
                            }
                        }), e, null, [
                            [0, 15]
                        ])
                    })), function() {
                        var t = this,
                            r = arguments;
                        return new Promise((function(n, a) {
                            var i = e.apply(t, r);

                            function o(e) {
                                pn(i, n, a, o, u, "next", e)
                            }

                            function u(e) {
                                pn(i, n, a, o, u, "throw", e)
                            }
                            o(void 0)
                        }))
                    })()
                }), []), bn((function() {
                    "" !== c && Sn.open().catch((function() {
                        return d("")
                    }))
                }), [c]), u ? t().createElement("div", {
                    className: "section col-xs-12 friend-recommendations-section"
                }, t().createElement("div", {
                    className: "container-header"
                }, t().createElement("h4", null, r("Label.FriendRecommendationsHeader"))), t().createElement(fn, {
                    friendRecommendations: a,
                    translate: r,
                    setError: d
                }), t().createElement(gn, {
                    title: r("Label.ErrorHeader"),
                    body: c,
                    neutralButtonText: r("Action.OK")
                })) : t().createElement("div", null)
            }
            Rn.propTypes = {
                translate: D().func.isRequired
            };
            var Fn = Rn;

            function Tn(e) {
                var r = e.translate;
                return t().createElement(Fn, {
                    translate: r
                })
            }
            Tn.propTypes = {
                translate: D().func.isRequired
            };
            var In = (0, c.withTranslations)(Tn, {
                common: [],
                feature: "Feature.FriendRecommendations"
            });

            function Cn(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var r = [],
                        n = !0,
                        a = !1,
                        i = void 0;
                    try {
                        for (var o, u = e[Symbol.iterator](); !(n = (o = u.next()).done) && (r.push(o.value), !t || r.length !== t); n = !0);
                    } catch (e) {
                        a = !0, i = e
                    } finally {
                        try {
                            n || null == u.return || u.return()
                        } finally {
                            if (a) throw i
                        }
                    }
                    return r
                }(e, t) || function(e, t) {
                    if (!e) return;
                    if ("string" == typeof e) return Nn(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    "Object" === r && e.constructor && (r = e.constructor.name);
                    if ("Map" === r || "Set" === r) return Array.from(e);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return Nn(e, t)
                }(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function Nn(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = new Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var wn = _.FRIENDTABS,
                An = _.FRIENDS_ERROR,
                On = _.SORT_OPTIONS,
                Dn = b.CurrentUser.userId,
                Pn = Cn((0, P.createModal)(), 2),
                xn = Pn[0],
                Ln = Pn[1];

            function qn(r) {
                var n, a = r.translate,
                    i = r.metadata,
                    o = i.isMyProfile,
                    u = i.profileUserId,
                    s = (i.userName, i.displayName),
                    l = i.isFriendsFilterBarEnabled,
                    c = i.isFriendsPageSortExperimentEnabled,
                    d = i.isSortFriendsInApiExperimentEnabled,
                    f = (i.shouldDisplayFriendRequestContext, r.setMetadata),
                    m = r.errorType,
                    p = r.clearError;
                if ((0, e.useEffect)((function() {
                        document.title = "".concat(a("Label.Friends"), " - Roblox")
                    }), [a]), o) n = a("Heading.MyFriends");
                else {
                    n = a("Heading.UsersFriends", {
                        username: s
                    })
                }
                var v = An[m] || {},
                    h = Cn((0, e.useState)(!1), 2),
                    y = h[0],
                    b = h[1],
                    E = (0, e.useContext)(nt),
                    g = E.setFriendsSort,
                    S = E.setFilterBarEnabled,
                    R = E.setShowJoinGameButtonInFriendCardDesktopOnly,
                    F = E.showFriendRecs,
                    T = E.setTrustedConnectionsAmpPolicyLoaded,
                    I = E.setCanAccessTrustedConnections,
                    C = E.isTcManagementHubEnabled,
                    N = E.setIsTcManagementHubEnabled;
                (0, e.useEffect)((function() {
                    Ee.getMetadata(u).then((function(e) {
                        var t = e.data;
                        f(t)
                    }))
                }), []), (0, e.useEffect)((function() {
                    C && nr(_.AMP_FEATURE_NAMES.IsUserInTcEligibleCountry, null, null, _.AMP_NAMESPACES.ConnectionGraphCore).then((function(e) {
                        var t = e.access;
                        I("Granted" === t), T(!0)
                    })).catch((function() {
                        I(!1)
                    }))
                }), [C]), (0, e.useEffect)((function() {
                    S(l)
                }), [l]), (0, e.useEffect)((function() {
                    Gr([Qr.JoinButtonFriendCard, Qr.JoinButtonFriendCardDesktopOnly, Qr.TcManagementHub]).then((function(e) {
                        var t = e.data;
                        g(On.API), null != t && t[Qr.JoinButtonFriendCardDesktopOnly] && R(t[Qr.JoinButtonFriendCardDesktopOnly]), null != t && t[Qr.TcManagementHub] && N(!0)
                    })).catch((function() {
                        g(On.ALPHABETICAL), R(!1)
                    })).finally((function() {
                        b(!0)
                    }))
                }), [c, d]), (0, e.useEffect)((function() {
                    m && Ln.open().catch((function() {
                        p()
                    }))
                }), [m]);
                var w, A = [{
                    id: "friends",
                    path: "/friends",
                    title: "Label.Friends",
                    name: wn.FRIENDS,
                    tooltipMsg: "Message.FriendsTabTooltip",
                    isDefault: !0,
                    show: null != Dn
                }, {
                    id: "following",
                    path: "/following",
                    title: "Label.Following",
                    name: wn.FOLLOWING,
                    tooltipMsg: "Message.FollowingTabTooltip"
                }, {
                    id: "followers",
                    path: "/followers",
                    title: "Label.Followers",
                    name: wn.FOLLOWERS,
                    tooltipMsg: "Message.FollowerTabTooltip"
                }, {
                    id: "requests",
                    path: "/friend-requests",
                    title: "Label.Requests",
                    name: wn.FRIENDREQUESTS,
                    tooltipMsg: "Message.FriendsTabTooltip",
                    show: o
                }];
                return w = y ? A.reduce((function(e, r) {
                    var n = r.path,
                        i = r.title,
                        u = r.name,
                        s = r.tooltipMsg,
                        l = r.show,
                        c = void 0 === l || l,
                        d = r.isDefault,
                        f = r.id;
                    return c && e.push(t().createElement(P.SimpleTabs.Tab, {
                        id: f,
                        key: u,
                        path: n,
                        title: a(i),
                        className: L()({
                            "subtract-item": !o,
                            "signed-out": !Dn
                        }),
                        name: u,
                        isDefault: d
                    }, t().createElement(Ur, {
                        title: a(i),
                        currentTab: u,
                        tooltipMsg: a(s)
                    }))), e
                }), []) : null, t().createElement("div", {
                    className: "row page-content"
                }, t().createElement(kr, {
                    title: n,
                    show: !0
                }), t().createElement(xn, {
                    title: m && a(v.titleText),
                    body: m && a(v.bodyText),
                    neutralButtonText: m && a(v.neutralButtonText),
                    footerText: m && v.footerText && a(v.footerText)
                }), F && t().createElement(In, null), t().createElement(P.SimpleTabs, {
                    type: P.SimpleTabs.types.Hash,
                    hashType: "hashbang",
                    isScrollable: !0
                }, w), t().createElement("div", {
                    id: "react-captcha-container"
                }))
            }
            Ee.setUserId(Dn), qn.defaultProps = {
                metadata: {},
                errorType: null
            }, qn.propTypes = {
                translate: D().func.isRequired,
                metadata: D().objectOf(D().any),
                setMetadata: D().func.isRequired,
                errorType: D().string,
                clearError: D().func.isRequired
            };
            var Un = (0, c.withTranslations)(Fe(qn), Te),
                _n = (0, i.createStore)(A, (0, i.applyMiddleware)(u()));
            (0, a.ready)((function() {
                (0, n.render)(t().createElement(l.QueryClientProvider, {
                    client: c.queryClient
                }, t().createElement(s.Provider, {
                    store: _n
                }, t().createElement(at, null, t().createElement(Un, null)))), document.getElementById("friends-container") || document.getElementById("friends-web-app"))
            }))
        }()
}();
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/9187d208be88c16d7f0988a1fb86988a-friends.bundle.min.js.map

/* Bundle detector */
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("Friends");