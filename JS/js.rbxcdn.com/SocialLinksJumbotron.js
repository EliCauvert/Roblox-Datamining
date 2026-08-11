! function() {
    var r = {
            464: function(e, t, r) {
                var o = {
                    "./socialLinksConstants.js": 889
                };

                function n(e) {
                    e = i(e);
                    return r(e)
                }

                function i(e) {
                    if (r.o(o, e)) return o[e];
                    e = new Error("Cannot find module '" + e + "'");
                    throw e.code = "MODULE_NOT_FOUND", e
                }
                n.keys = function() {
                    return Object.keys(o)
                }, n.resolve = i, (e.exports = n).id = 464
            },
            315: function(e, t, r) {
                var o = {
                    "./socialLinksService.js": 605
                };

                function n(e) {
                    e = i(e);
                    return r(e)
                }

                function i(e) {
                    if (r.o(o, e)) return o[e];
                    e = new Error("Cannot find module '" + e + "'");
                    throw e.code = "MODULE_NOT_FOUND", e
                }
                n.keys = function() {
                    return Object.keys(o)
                }, n.resolve = i, (e.exports = n).id = 315
            },
            525: function(e) {
                function i(e) {
                    return e.replace(/([a-z])([A-Z])/g, "$1-$2").toLowerCase()
                }

                function a(e) {
                    return e.split("/").pop().replace(".html", "")
                }
                var t = {
                    importFilesUnderPath: function(e) {
                        e.keys().forEach(e)
                    },
                    templateCacheGenerator: function(e, t, o, n) {
                        return e.module(t, []).run(["$templateCache", function(r) {
                            o && o.keys().forEach(function(e) {
                                var t = i(a(e));
                                r.put(t, o(e))
                            }), n && n.keys().forEach(function(e) {
                                var t = i(a(e));
                                r.put(t, n(e).replace(/<\/?script[^>]*>/gi, ""))
                            })
                        }])
                    }
                };
                e.exports = t
            },
            889: function(e, t, r) {
                "use strict";
                r.r(t), r.d(t, {
                    default: function() {
                        return o
                    }
                });
                t = Roblox, r = r(610);

                function c(e) {
                    return (c = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
                        return typeof e
                    } : function(e) {
                        return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
                    })(e)
                }

                function s(e, t) {
                    s = function(e, t) {
                        return new r(e, void 0, t)
                    };
                    var o = u(RegExp),
                        n = RegExp.prototype,
                        i = new WeakMap;

                    function r(e, t, r) {
                        t = o.call(this, e, t);
                        return i.set(t, r || i.get(e)), t
                    }

                    function a(r, e) {
                        var o = i.get(e);
                        return Object.keys(o).reduce(function(e, t) {
                            return e[t] = r[o[t]], e
                        }, Object.create(null))
                    }
                    return function(e, t) {
                        if ("function" != typeof t && null !== t) throw new TypeError("Super expression must either be null or a function");
                        e.prototype = Object.create(t && t.prototype, {
                            constructor: {
                                value: e,
                                writable: !0,
                                configurable: !0
                            }
                        }), t && l(e, t)
                    }(r, o), r.prototype.exec = function(e) {
                        e = n.exec.call(this, e);
                        return e && (e.groups = a(e, this)), e
                    }, r.prototype[Symbol.replace] = function(e, t) {
                        if ("string" == typeof t) {
                            var r = i.get(this);
                            return n[Symbol.replace].call(this, e, t.replace(/\$<([^>]+)>/g, function(e, t) {
                                return "$" + r[t]
                            }))
                        }
                        if ("function" != typeof t) return n[Symbol.replace].call(this, e, t);
                        var o = this;
                        return n[Symbol.replace].call(this, e, function() {
                            var e = [];
                            return e.push.apply(e, arguments), "object" !== c(e[e.length - 1]) && e.push(a(e, o)), t.apply(this, e)
                        })
                    }, s.apply(this, arguments)
                }

                function u(e) {
                    var o = "function" == typeof Map ? new Map : void 0;
                    return (u = function(e) {
                        if (null === e || (t = e, -1 === Function.toString.call(t).indexOf("[native code]"))) return e;
                        var t;
                        if ("function" != typeof e) throw new TypeError("Super expression must either be null or a function");
                        if (void 0 !== o) {
                            if (o.has(e)) return o.get(e);
                            o.set(e, r)
                        }

                        function r() {
                            return n(e, arguments, i(this).constructor)
                        }
                        return r.prototype = Object.create(e.prototype, {
                            constructor: {
                                value: r,
                                enumerable: !1,
                                writable: !0,
                                configurable: !0
                            }
                        }), l(r, e)
                    })(e)
                }

                function n(e, t, r) {
                    return (n = function() {
                        if ("undefined" == typeof Reflect || !Reflect.construct) return !1;
                        if (Reflect.construct.sham) return !1;
                        if ("function" == typeof Proxy) return !0;
                        try {
                            return Date.prototype.toString.call(Reflect.construct(Date, [], function() {})), !0
                        } catch (e) {
                            return !1
                        }
                    }() ? Reflect.construct : function(e, t, r) {
                        var o = [null];
                        o.push.apply(o, t);
                        o = new(Function.bind.apply(e, o));
                        return r && l(o, r.prototype), o
                    }).apply(null, arguments)
                }

                function l(e, t) {
                    return (l = Object.setPrototypeOf || function(e, t) {
                        return e.__proto__ = t, e
                    })(e, t)
                }

                function i(e) {
                    return (i = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                        return e.__proto__ || Object.getPrototypeOf(e)
                    })(e)
                }
                t = {
                    urlBase: {
                        getGameSocialLinks: t.EnvironmentUrls.gamesApi,
                        getGroupSocialLinks: t.EnvironmentUrls.groupsApi,
                        setGameSocialLinks: t.EnvironmentUrls.developApi,
                        setGroupSocialLinks: t.EnvironmentUrls.groupsApi,
                        getGameSocialLinksMetadata: t.EnvironmentUrls.developApi,
                        getUserSocialLinks: t.EnvironmentUrls.accountInformationApi
                    },
                    urlRegexes: {
                        facebook: /^((http|https):\/\/)?(www\.)?facebook\.com\/(?:(?:\w)*#!\/)?(?:pages\/)?(?:[?\w\-]*\/)?(?:profile\.php\?id=(?=\d.*))?([\w\-]*)?$/,
                        twitter: /^(((http|https):\/\/)?(www\.)?(twitter|x)\.com\/|@)(?!logout(\/|$))([a-zA-Z0-9_]{1,15})$/,
                        youtube: /^((http|https):\/\/)?(www\.)?youtube\.com\/(?!opensearch(\/|$))(?!.*\blogout\b)[@a-zA-Z0-9\-\/_]+$/,
                        twitch: /^((http|https):\/\/)?(www\.)?twitch\.tv\/[a-zA-Z0-9\-/_]+$/,
                        discord: /^((http|https):\/\/)?(www\.)?discord\.(gg|io|me|li)\/[a-zA-Z0-9\-_/]+$/,
                        robloxGroup: s(/^(?:https?):\/\/(?:[\x2D0-9a-z]{2,}\.)*(?:roblox(labs)?\.com\/)(?:groups\/|communities\/)([0-9]+)\/?(?:[\x2D0-9A-Za-z]+)?(?:#!\/)?(?:[0-9A-Za-z]+)?$/, {
                            groupId: 2
                        }),
                        amazon: /^((https?):\/\/)?(www\.)?amazon\.com\/stores\/page\/[\w\-/]+(\?[\w\-/]+(=[\w\-/]*)?(&[\w\-/]+(=[\w\-/]*)?)*)?$/,
                        guilded: /^((http|https):\/\/)?(www\.)?guilded\.gg\/((profile|teams|i|r|u)\/)?([a-zA-Z0-9-]{3,30})(\/(overview))?(\?[i|r]=?([a-zA-Z0-9-]{3,16}))?$/
                    },
                    targetTypes: {
                        game: "game",
                        group: "group",
                        user: "user"
                    },
                    socialLinkDisplayTypes: {
                        icon: "icon",
                        card: "card"
                    },
                    socialMediaTypes: {
                        facebook: "Facebook",
                        twitter: "Twitter",
                        youtube: "YouTube",
                        twitch: "Twitch",
                        discord: "Discord",
                        robloxGroup: "RobloxGroup",
                        amazon: "Amazon",
                        guilded: "Guilded"
                    },
                    socialMediaNames: {
                        Facebook: "Facebook",
                        Twitter: "Twitter",
                        YouTube: "YouTube",
                        Twitch: "Twitch",
                        Discord: "Discord",
                        Amazon: "Amazon",
                        RobloxGroup: "Roblox Group",
                        Guilded: "Guilded"
                    },
                    availableSocialMediaTypes: {
                        game: ["facebook", "twitter", "youtube", "twitch", "discord", "robloxGroup", "amazon"],
                        group: ["facebook", "twitter", "youtube", "twitch", "discord"],
                        user: ["facebook", "twitter", "youtube", "twitch"]
                    },
                    availableIconTypes: ["Facebook", "Twitter", "YouTube", "Twitch", "Discord", "RobloxGroup", "GitHub", "Amazon", "Guilded"],
                    eventSteamEventNames: {
                        click: "socialLinkClickEvent"
                    },
                    layout: {
                        maxUrlLength: 256,
                        maxNameLength: 70
                    },
                    errorCodes: {
                        internal: {
                            unknownError: 0,
                            invalidTarget: 1,
                            featureDisabled: 2,
                            invalidViewer: 3,
                            invalidTitle: 4,
                            invalidUrl: 5,
                            invalidType: 6,
                            unauthorized: 7,
                            socialLinkRemoved: 8,
                            noGroupPermission: 9,
                            noMetadata: 10
                        },
                        getGroupSocialLinks: {
                            1: 1,
                            11: 2,
                            13: 3
                        },
                        getGameSocialLinks: {
                            2: 2,
                            3: 3,
                            10: 10
                        },
                        setGameSocialLinks: {
                            1: 7,
                            2: 4,
                            3: 4,
                            4: 5,
                            7: 8,
                            8: 6,
                            11: 4,
                            18: 9
                        },
                        setGroupSocialLinks: {
                            1: 1,
                            2: 7,
                            3: 4,
                            4: 4,
                            5: 5,
                            6: 5,
                            8: 8,
                            9: 6,
                            12: 4,
                            16: 6
                        },
                        getUserSocialLinks: {
                            1: 1
                        }
                    },
                    translations: {
                        socialLinkoffPlatformModalTitle: "Message.SocialLinkoffPlatformModalTitle",
                        socialLinkoffPlatformModalBody: "Message.SocialLinkoffPlatformModalBody",
                        socialLinkoffPlatformModalContinueButtonText: "Message.SocialLinkoffPlatformModalContinueButtonText",
                        socialLinkoffPlatformModalCancelButtonText: "Message.SocialLinkoffPlatformModalCancelButtonText",
                        socialLinkRemoved: "Message.SocialLinkRemoved",
                        socialLinkSaved: "Message.SocialLinkSaved",
                        socialLinkInvalidError: "Message.SocialLinkInvalidError",
                        socialLinksEditDisabledError: "Message.SocialLinksEditDisabledError",
                        unauthorizedError: "Message.UnauthorizedError",
                        titleModeratedError: "Message.TitleModeratedError",
                        unknownError: "Message.UnknownError",
                        socialLinkTypeLimitError: "Message.SocialLinkTypeLimitError",
                        urlSocialMediaTypeMismatchError: "Message.UrlSocialMediaTypeMismatchError",
                        urlEmptyError: "Message.UrlEmptyError",
                        titleEmptyError: "Message.TitleEmptyError",
                        noGroupPermission: "Message.NoGroupPermission"
                    }
                };
                r.A.constant("socialLinksConstants", t);
                var o = t
            },
            605: function(e, t, r) {
                "use strict";
                r.r(t), r.d(t, {
                    default: function() {
                        return n
                    }
                });
                var d = HeaderScripts,
                    r = r(610);

                function i(t, e) {
                    var r, o = Object.keys(t);
                    return Object.getOwnPropertySymbols && (r = Object.getOwnPropertySymbols(t), e && (r = r.filter(function(e) {
                        return Object.getOwnPropertyDescriptor(t, e).enumerable
                    })), o.push.apply(o, r)), o
                }

                function g(o) {
                    for (var e = 1; e < arguments.length; e++) {
                        var n = null != arguments[e] ? arguments[e] : {};
                        e % 2 ? i(Object(n), !0).forEach(function(e) {
                            var t, r;
                            t = o, e = n[r = e], r in t ? Object.defineProperty(t, r, {
                                value: e,
                                enumerable: !0,
                                configurable: !0,
                                writable: !0
                            }) : t[r] = e
                        }) : Object.getOwnPropertyDescriptors ? Object.defineProperties(o, Object.getOwnPropertyDescriptors(n)) : i(Object(n)).forEach(function(e) {
                            Object.defineProperty(o, e, Object.getOwnPropertyDescriptor(n, e))
                        })
                    }
                    return o
                }
                var y = {
                    AmazonStoreLinksEnabledForUser: !(o.$inject = ["$q", "httpService", "socialLinksConstants", "$window"])
                };

                function o(t, s, u, e) {
                    function l(e, t) {
                        return (e = s.getApiErrorCodes(e)[0] || u.errorCodes.internal.unknownError) !== u.errorCodes.internal.unknownError && t.hasOwnProperty(e) ? t[e] : e
                    }

                    function p(n) {
                        return t(function(t, r) {
                            var e, o;
                            n <= 0 ? r(u.errorCodes.internal.invalidTarget) : d.authenticatedUser.isAuthenticated && !d.authenticatedUser.isUnder13 ? (e = {
                                url: "".concat(u.urlBase.getGameSocialLinksMetadata, "/v1/universes/").concat(n, "/social-links/metadata")
                            }, o = u.errorCodes.getGameSocialLinks, s.httpGet(e).then(function(e) {
                                t(e)
                            }, function(e) {
                                r(l(e, o))
                            })) : r(u.errorCodes.internal.invalidViewer)
                        })
                    }
                    var f = {};
                    return {
                        getSocialLinks: function(i, a, e) {
                            var c = 2 < arguments.length && void 0 !== e && e;
                            return t(function(t, r) {
                                if (a <= 0) r(u.errorCodes.internal.invalidTarget);
                                else if (d.authenticatedUser.isAuthenticated && !d.authenticatedUser.isUnder13) {
                                    var n = "".concat(i || "", ":").concat(a);
                                    if (f[n]) t(f[n]);
                                    else {
                                        var o, e = {};
                                        switch (i) {
                                            case u.targetTypes.game:
                                                e.url = "".concat(u.urlBase.getGameSocialLinks, "/v1/games/").concat(a, "/social-links/list"), o = u.errorCodes.getGameSocialLinks;
                                                break;
                                            case u.targetTypes.group:
                                                e.url = "".concat(u.urlBase.getGroupSocialLinks, "/v1/groups/").concat(a, "/social-links"), o = u.errorCodes.getGroupSocialLinks;
                                                break;
                                            case u.targetTypes.user:
                                                e.url = "".concat(u.urlBase.getUserSocialLinks, "/v1/users/").concat(a, "/promotion-channels?alwaysReturnUrls=true"), o = u.errorCodes.getUserSocialLinks;
                                                break;
                                            default:
                                                return void r(u.errorCodes.invalidTarget)
                                        }
                                        s.httpGet(e).then(function(r) {
                                            var e, o = {};
                                            i === u.targetTypes.user ? (o.data = [], Object.keys(u.socialMediaTypes).forEach(function(e) {
                                                var t = r[e];
                                                t && o.data.push({
                                                    id: 0,
                                                    title: u.socialMediaTypes[e],
                                                    type: u.socialMediaTypes[e],
                                                    url: t
                                                })
                                            })) : o.data = r.data, o.socialLinksVerificationStatus = r.socialLinksVerificationStatus, o.data.forEach(function(e) {
                                                e.target = {
                                                    id: a,
                                                    type: i
                                                }
                                            }), c ? p(a).then(function() {
                                                var e = 0 < arguments.length && void 0 !== arguments[0] ? arguments[0] : y,
                                                    e = g(g({}, o), {}, {
                                                        socialLinksMetadata: e
                                                    });
                                                f[n] = e, t(e)
                                            }) : (e = g(g({}, o), {}, {
                                                socialLinksMetadata: y
                                            }), f[n] = e, t(e))
                                        }, function(e) {
                                            r(l(e, o))
                                        })
                                    }
                                } else r(u.errorCodes.internal.invalidViewer)
                            })
                        },
                        getSocialLinksMetadata: p,
                        saveSocialLink: function(i) {
                            return t(function(t, r) {
                                var o, e = {},
                                    n = {
                                        type: i.type,
                                        url: i.url,
                                        title: i.title
                                    };
                                switch (i.target.type) {
                                    case u.targetTypes.game:
                                        e.url = "".concat(u.urlBase.setGameSocialLinks, "/v1/universes/").concat(i.target.id, "/social-links"), o = u.errorCodes.setGameSocialLinks;
                                        break;
                                    case u.targetTypes.group:
                                        e.url = "".concat(u.urlBase.setGroupSocialLinks, "/v1/groups/").concat(i.target.id, "/social-links"), o = u.errorCodes.setGroupSocialLinks;
                                        break;
                                    default:
                                        return void r(u.errorCodes.invalidTarget)
                                }
                                i.id ? (e.url += "/".concat(i.id), s.httpPatch(e, n).then(t, function(e) {
                                    r(l(e, o))
                                })) : s.httpPost(e, n).then(function(e) {
                                    i.id = e.id || e.Id, t()
                                }, function(e) {
                                    r(l(e, o))
                                })
                            })
                        },
                        deleteSocialLink: function(n) {
                            return t(function(e, t) {
                                var r, o = {};
                                switch (n.target.type) {
                                    case u.targetTypes.game:
                                        o.url = "".concat(u.urlBase.setGameSocialLinks, "/v1/universes/").concat(n.target.id, "/social-links"), r = u.errorCodes.setGameSocialLinks;
                                        break;
                                    case u.targetTypes.group:
                                        o.url = "".concat(u.urlBase.setGroupSocialLinks, "/v1/groups/").concat(n.target.id, "/social-links"), r = u.errorCodes.setGroupSocialLinks;
                                        break;
                                    default:
                                        return void t(u.errorCodes.invalidTarget)
                                }
                                o.url += "/".concat(n.id), s.httpDelete(o).then(e, function(e) {
                                    t(l(e, r))
                                })
                            })
                        }
                    }
                }
                r.A.factory("socialLinksService", o);
                var n = o
            },
            610: function(e, t, r) {
                "use strict";
                r.d(t, {
                    A: function() {
                        return o
                    }
                });
                var t = angular,
                    o = r.n(t)().module("socialLinksCommon", ["robloxApp"])
            }
        },
        o = {};

    function n(e) {
        var t = o[e];
        if (void 0 !== t) return t.exports;
        t = o[e] = {
            exports: {}
        };
        return r[e](t, t.exports, n), t.exports
    }
    n.n = function(e) {
            var t = e && e.__esModule ? function() {
                return e.default
            } : function() {
                return e
            };
            return n.d(t, {
                a: t
            }), t
        }, n.d = function(e, t) {
            for (var r in t) n.o(t, r) && !n.o(e, r) && Object.defineProperty(e, r, {
                enumerable: !0,
                get: t[r]
            })
        }, n.o = function(e, t) {
            return Object.prototype.hasOwnProperty.call(e, t)
        }, n.r = function(e) {
            "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
                value: "Module"
            }), Object.defineProperty(e, "__esModule", {
                value: !0
            })
        },
        function() {
            "use strict";
            var e = n(525);
            n(610), (0, e.importFilesUnderPath)(n(464)), (0, e.importFilesUnderPath)(n(315))
        }()
}();
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/4393d50041015b0a2a0f2ccc4c165673-socialLinksCommon.bundle.min.js.map

! function() {
    var n = {
            2: function(t, e, n) {
                var o = {
                    "./socialLinkCard.html": 461,
                    "./socialLinkIcon.html": 450,
                    "./socialLinkIconList.html": 474,
                    "./socialLinksContainer.html": 527
                };

                function i(t) {
                    t = r(t);
                    return n(t)
                }

                function r(t) {
                    if (n.o(o, t)) return o[t];
                    t = new Error("Cannot find module '" + t + "'");
                    throw t.code = "MODULE_NOT_FOUND", t
                }
                i.keys = function() {
                    return Object.keys(o)
                }, i.resolve = r, (t.exports = i).id = 2
            },
            364: function(t, e, n) {
                var o = {
                    "./socialLinkCardComponent.js": 974,
                    "./socialLinkIconComponent.js": 515,
                    "./socialLinkIconListComponent.js": 135,
                    "./socialLinksContainerComponent.js": 848
                };

                function i(t) {
                    t = r(t);
                    return n(t)
                }

                function r(t) {
                    if (n.o(o, t)) return o[t];
                    t = new Error("Cannot find module '" + t + "'");
                    throw t.code = "MODULE_NOT_FOUND", t
                }
                i.keys = function() {
                    return Object.keys(o)
                }, i.resolve = r, (t.exports = i).id = 364
            },
            209: function(t, e, n) {
                var o = {
                    "./socialLinkController.js": 800,
                    "./socialLinkIconListController.js": 189,
                    "./socialLinksContainerController.js": 708
                };

                function i(t) {
                    t = r(t);
                    return n(t)
                }

                function r(t) {
                    if (n.o(o, t)) return o[t];
                    t = new Error("Cannot find module '" + t + "'");
                    throw t.code = "MODULE_NOT_FOUND", t
                }
                i.keys = function() {
                    return Object.keys(o)
                }, i.resolve = r, (t.exports = i).id = 209
            },
            525: function(t) {
                function r(t) {
                    return t.replace(/([a-z])([A-Z])/g, "$1-$2").toLowerCase()
                }

                function s(t) {
                    return t.split("/").pop().replace(".html", "")
                }
                var e = {
                    importFilesUnderPath: function(t) {
                        t.keys().forEach(t)
                    },
                    templateCacheGenerator: function(t, e, o, i) {
                        return t.module(e, []).run(["$templateCache", function(n) {
                            o && o.keys().forEach(function(t) {
                                var e = r(s(t));
                                n.put(e, o(t))
                            }), i && i.keys().forEach(function(t) {
                                var e = r(s(t));
                                n.put(e, i(t).replace(/<\/?script[^>]*>/gi, ""))
                            })
                        }])
                    }
                };
                t.exports = e
            },
            974: function(t, e, n) {
                "use strict";
                n.r(e);
                var o = {
                    templateUrl: "social-link-card",
                    bindings: {
                        url: "<",
                        title: "<",
                        type: "<",
                        target: "<",
                        displayType: "<"
                    },
                    controller: "socialLinkController"
                };
                n(285).A.component("socialLinkCard", o), e.default = o
            },
            515: function(t, e, n) {
                "use strict";
                n.r(e);
                var o = {
                    templateUrl: "social-link-icon",
                    bindings: {
                        url: "<",
                        type: "<",
                        target: "<",
                        displayType: "<"
                    },
                    controller: "socialLinkController"
                };
                n(285).A.component("socialLinkIcon", o), e.default = o
            },
            135: function(t, e, n) {
                "use strict";
                n.r(e);
                var o = {
                    templateUrl: "social-link-icon-list",
                    bindings: {
                        targetType: "@",
                        targetId: "<"
                    },
                    controller: "socialLinkIconListController"
                };
                n(285).A.component("socialLinkIconList", o), e.default = o
            },
            848: function(t, e, n) {
                "use strict";
                n.r(e);
                var o = {
                    templateUrl: "social-links-container",
                    bindings: {
                        targetType: "@",
                        targetId: "<"
                    },
                    controller: "socialLinksContainerController"
                };
                n(285).A.component("socialLinksContainer", o), e.default = o
            },
            800: function(t, e, n) {
                "use strict";
                n.r(e);
                var o = n(285),
                    r = n(577);

                function i(e, t, n, o) {
                    var i = this;
                    i.socialMediaTypes = e.socialMediaTypes, i.socialLinkClick = function() {
                        var t = {
                            assignmentId: i.target.id,
                            assignmentType: i.target.type,
                            socialLinkType: i.type,
                            socialLinkUrl: i.url,
                            socialLinkDisplayType: i.displayType
                        };
                        r.EventStream && r.EventStream.SendEvent && r.EventStream.SendEvent(e.eventSteamEventNames.click, i.target.type, t)
                    }, i.socialLinkOffPlatformClick = function() {
                        t.open({
                            titleText: o.get(e.translations.socialLinkoffPlatformModalTitle),
                            bodyText: o.get(e.translations.socialLinkoffPlatformModalBody, {
                                lineBreak: "\n\n"
                            }),
                            actionButtonShow: !0,
                            actionButtonText: o.get(e.translations.socialLinkoffPlatformModalContinueButtonText),
                            neutralButtonText: o.get(e.translations.socialLinkoffPlatformModalCancelButtonText),
                            actionButtonClass: "btn-primary-md"
                        }).result.then(function() {
                            i.socialLinkClick(), n.open(i.url, "_blank")
                        }, angular.noop)
                    }
                }
                i.$inject = ["socialLinksConstants", "modalService", "$window", "languageResource"], o.A.controller("socialLinkController", i), e.default = i
            },
            189: function(t, e, n) {
                "use strict";
                n.r(e);
                n = n(285);

                function o(e, t) {
                    function n() {
                        o.socialLinks = [], o.socialLinkDisplayTypes = e.socialLinkDisplayTypes, t.getSocialLinks(o.targetType, o.targetId, !1).then(function(t) {
                            t = t.data || [];
                            o.socialLinks = t.filter(function(t) {
                                return 0 <= e.availableIconTypes.indexOf(t.type)
                            })
                        }).catch(function(t) {
                            switch (t) {
                                case e.errorCodes.internal.featureDisabled:
                                case e.errorCodes.internal.invalidViewer:
                            }
                        })
                    }
                    var o = this;
                    o.$onInit = n, o.$onChanges = n
                }
                o.$inject = ["socialLinksConstants", "socialLinksService"], n.A.controller("socialLinkIconListController", o), e.default = o
            },
            708: function(t, e, n) {
                "use strict";
                n.r(e);
                n = n(285);

                function o(e, n) {
                    function t() {
                        var t = o.targetType + ":" + o.targetId;
                        i !== t && (i = t, o.socialLinks = [], o.socialLinkDisplayTypes = e.socialLinkDisplayTypes, n.getSocialLinks(o.targetType, o.targetId, !1).then(function() {
                            var t = 0 < arguments.length && void 0 !== arguments[0] ? arguments[0] : {};
                            o.socialLinks = t.data || []
                        }).catch(function(t) {
                            switch (t) {
                                case e.errorCodes.internal.featureDisabled:
                                case e.errorCodes.internal.invalidViewer:
                            }
                        }))
                    }
                    var o = this,
                        i = "";
                    o.$onInit = t, o.$onChanges = t
                }
                o.$inject = ["socialLinksConstants", "socialLinksService"], n.A.controller("socialLinksContainerController", o), e.default = o
            },
            285: function(t, e, n) {
                "use strict";
                var o = n(577),
                    n = angular.module("socialLinksJumbotron", ["robloxApp", "socialLinksCommon", "socialLinksJumbotronHtmlTemplateApp", "modal"]).config(["languageResourceProvider", function(t) {
                        var e = (new o.TranslationResourceProvider).getTranslationResource("Feature.PromotedChannels");
                        t.setTranslationResources([e])
                    }]);
                e.A = n
            },
            870: function(t, e) {
                var n;
                /*!
                	Copyright (c) 2018 Jed Watson.
                	Licensed under the MIT License (MIT), see
                	http://jedwatson.github.io/classnames
                */
                ! function() {
                    "use strict";
                    var s = {}.hasOwnProperty;

                    function a() {
                        for (var t = [], e = 0; e < arguments.length; e++) {
                            var n = arguments[e];
                            if (n) {
                                var o, i = typeof n;
                                if ("string" == i || "number" == i) t.push(n);
                                else if (Array.isArray(n)) !n.length || (o = a.apply(null, n)) && t.push(o);
                                else if ("object" == i)
                                    if (n.toString === Object.prototype.toString || n.toString.toString().includes("[native code]"))
                                        for (var r in n) s.call(n, r) && n[r] && t.push(r);
                                    else t.push(n.toString())
                            }
                        }
                        return t.join(" ")
                    }
                    t.exports ? (a.default = a, t.exports = a) : void 0 === (n = function() {
                        return a
                    }.apply(e, [])) || (t.exports = n)
                }()
            },
            461: function(t) {
                t.exports = '<div id="social-link-card"> <div ng-if="$ctrl.type === $ctrl.socialMediaTypes.amazon" class="col-xs-12 col-md-4 col-sm-6"> <span class="social-link" title="{{ $ctrl.title }}" ng-click="$ctrl.socialLinkOffPlatformClick()" context-menu="$ctrl.socialLinkOffPlatformClick()"> <div class="medallion border"> <div class="contents"> <span class="type-img {{ $ctrl.type }}"></span> <div class="title-wrapper"> <span class="title" ng-bind="$ctrl.title"></span> </div> </div> </div> </span> </div> <div ng-if="$ctrl.type !== $ctrl.socialMediaTypes.amazon" class="col-xs-12 col-md-4 col-sm-6"> <a class="social-link" ng-href="{{ $ctrl.url }}" target="_blank" title="{{ $ctrl.title }}" ng-click="$ctrl.socialLinkClick()" context-menu="$ctrl.socialLinkClick()"> <div class="medallion border"> <div class="contents"> <span class="type-img {{ $ctrl.type }}"></span> <div class="title-wrapper"> <span class="title" ng-bind="$ctrl.title"></span> </div> </div> </div> </a> </div> </div>'
            },
            450: function(t) {
                t.exports = '<div id="social-link-icon"> <a ng-href="{{ $ctrl.url }}" target="_blank" title="{{ $ctrl.type }}" ng-click="$ctrl.socialLinkClick()" context-menu="$ctrl.socialLinkClick()"> <span class="social-link-icon {{ $ctrl.type }}"></span> </a> </div>'
            },
            474: function(t) {
                t.exports = '<div class="social-link-icon-list"> <ul ng-if="$ctrl.socialLinks.length > 0"> <li ng-repeat="socialLink in $ctrl.socialLinks"> <social-link-icon url="socialLink.url" type="socialLink.type" target="socialLink.target" display-type="$ctrl.socialLinkDisplayTypes.icon"></social-link-icon> </li> </ul> </div> '
            },
            527: function(t) {
                t.exports = '<div id="social-links-container"> <div class="stack social-links" ng-if="$ctrl.socialLinks.length > 0"> <div class="container-header"> <h2 ng-bind="\'HeadingSocialLinks\' | translate"></h2> </div> <div class="section-content remove-panel"> <social-link-card ng-repeat="socialLink in $ctrl.socialLinks" url="socialLink.url" title="socialLink.title" type="socialLink.type" target="socialLink.target" display-type="$ctrl.socialLinkDisplayTypes.card"></social-link-card> </div> </div> </div>'
            },
            489: function() {
                ! function() {
                    "use strict";
                    var p, n, d, h;

                    function r(t) {
                        try {
                            return t.defaultView && t.defaultView.frameElement || null
                        } catch (t) {
                            return null
                        }
                    }

                    function l(t) {
                        this.time = t.time, this.target = t.target, this.rootBounds = o(t.rootBounds), this.boundingClientRect = o(t.boundingClientRect), this.intersectionRect = o(t.intersectionRect || u()), this.isIntersecting = !!t.intersectionRect;
                        var e = this.boundingClientRect,
                            t = e.width * e.height,
                            e = this.intersectionRect,
                            e = e.width * e.height;
                        this.intersectionRatio = t ? Number((e / t).toFixed(4)) : this.isIntersecting ? 1 : 0
                    }

                    function t(t, e) {
                        var n, o, i, e = e || {};
                        if ("function" != typeof t) throw new Error("callback must be a function");
                        if (e.root && 1 != e.root.nodeType && 9 != e.root.nodeType) throw new Error("root must be a Document or Element");
                        this._checkForIntersections = (n = this._checkForIntersections.bind(this), o = this.THROTTLE_TIMEOUT, i = null, function() {
                            i = i || setTimeout(function() {
                                n(), i = null
                            }, o)
                        }), this._callback = t, this._observationTargets = [], this._queuedEntries = [], this._rootMarginValues = this._parseRootMargin(e.rootMargin), this.thresholds = this._initThresholds(e.threshold), this.root = e.root || null, this.rootMargin = this._rootMarginValues.map(function(t) {
                            return t.value + t.unit
                        }).join(" "), this._monitoringDocuments = [], this._monitoringUnsubscribes = []
                    }

                    function s(t, e, n, o) {
                        "function" == typeof t.addEventListener ? t.addEventListener(e, n, o || !1) : "function" == typeof t.attachEvent && t.attachEvent("on" + e, n)
                    }

                    function a(t, e, n, o) {
                        "function" == typeof t.removeEventListener ? t.removeEventListener(e, n, o || !1) : "function" == typeof t.detachEvent && t.detachEvent("on" + e, n)
                    }

                    function m(t) {
                        var e;
                        try {
                            e = t.getBoundingClientRect()
                        } catch (t) {}
                        return e ? (e.width && e.height || (e = {
                            top: e.top,
                            right: e.right,
                            bottom: e.bottom,
                            left: e.left,
                            width: e.right - e.left,
                            height: e.bottom - e.top
                        }), e) : u()
                    }

                    function u() {
                        return {
                            top: 0,
                            bottom: 0,
                            left: 0,
                            right: 0,
                            width: 0,
                            height: 0
                        }
                    }

                    function o(t) {
                        return !t || "x" in t ? t : {
                            top: t.top,
                            y: t.top,
                            bottom: t.bottom,
                            left: t.left,
                            x: t.left,
                            right: t.right,
                            width: t.width,
                            height: t.height
                        }
                    }

                    function g(t, e) {
                        var n = e.top - t.top,
                            t = e.left - t.left;
                        return {
                            top: n,
                            left: t,
                            height: e.height,
                            width: e.width,
                            bottom: n + e.height,
                            right: t + e.width
                        }
                    }

                    function i(t, e) {
                        for (var n = e; n;) {
                            if (n == t) return !0;
                            n = v(n)
                        }
                        return !1
                    }

                    function v(t) {
                        var e = t.parentNode;
                        return 9 == t.nodeType && t != p ? r(t) : (e && e.assignedSlot && (e = e.assignedSlot.parentNode), e && 11 == e.nodeType && e.host ? e.host : e)
                    }

                    function c(t) {
                        return t && 9 === t.nodeType
                    }
                    "object" == typeof window && ("IntersectionObserver" in window && "IntersectionObserverEntry" in window && "intersectionRatio" in window.IntersectionObserverEntry.prototype ? "isIntersecting" in window.IntersectionObserverEntry.prototype || Object.defineProperty(window.IntersectionObserverEntry.prototype, "isIntersecting", {
                        get: function() {
                            return 0 < this.intersectionRatio
                        }
                    }) : (p = function() {
                        for (var t = window.document, e = r(t); e;) e = r(t = e.ownerDocument);
                        return t
                    }(), n = [], h = d = null, t.prototype.THROTTLE_TIMEOUT = 100, t.prototype.POLL_INTERVAL = null, t.prototype.USE_MUTATION_OBSERVER = !0, t._setupCrossOriginUpdater = function() {
                        return d = d || function(t, e) {
                            h = t && e ? g(t, e) : u(), n.forEach(function(t) {
                                t._checkForIntersections()
                            })
                        }
                    }, t._resetCrossOriginUpdater = function() {
                        h = d = null
                    }, t.prototype.observe = function(e) {
                        if (!this._observationTargets.some(function(t) {
                                return t.element == e
                            })) {
                            if (!e || 1 != e.nodeType) throw new Error("target must be an Element");
                            this._registerInstance(), this._observationTargets.push({
                                element: e,
                                entry: null
                            }), this._monitorIntersections(e.ownerDocument), this._checkForIntersections()
                        }
                    }, t.prototype.unobserve = function(e) {
                        this._observationTargets = this._observationTargets.filter(function(t) {
                            return t.element != e
                        }), this._unmonitorIntersections(e.ownerDocument), 0 == this._observationTargets.length && this._unregisterInstance()
                    }, t.prototype.disconnect = function() {
                        this._observationTargets = [], this._unmonitorAllIntersections(), this._unregisterInstance()
                    }, t.prototype.takeRecords = function() {
                        var t = this._queuedEntries.slice();
                        return this._queuedEntries = [], t
                    }, t.prototype._initThresholds = function(t) {
                        t = t || [0];
                        return Array.isArray(t) || (t = [t]), t.sort().filter(function(t, e, n) {
                            if ("number" != typeof t || isNaN(t) || t < 0 || 1 < t) throw new Error("threshold must be a number between 0 and 1 inclusively");
                            return t !== n[e - 1]
                        })
                    }, t.prototype._parseRootMargin = function(t) {
                        t = (t || "0px").split(/\s+/).map(function(t) {
                            t = /^(-?\d*\.?\d+)(px|%)$/.exec(t);
                            if (!t) throw new Error("rootMargin must be specified in pixels or percent");
                            return {
                                value: parseFloat(t[1]),
                                unit: t[2]
                            }
                        });
                        return t[1] = t[1] || t[0], t[2] = t[2] || t[0], t[3] = t[3] || t[1], t
                    }, t.prototype._monitorIntersections = function(e) {
                        var n, o, i, t = e.defaultView;
                        t && -1 == this._monitoringDocuments.indexOf(e) && (n = this._checkForIntersections, i = o = null, this.POLL_INTERVAL ? o = t.setInterval(n, this.POLL_INTERVAL) : (s(t, "resize", n, !0), s(e, "scroll", n, !0), this.USE_MUTATION_OBSERVER && "MutationObserver" in t && (i = new t.MutationObserver(n)).observe(e, {
                            attributes: !0,
                            childList: !0,
                            characterData: !0,
                            subtree: !0
                        })), this._monitoringDocuments.push(e), this._monitoringUnsubscribes.push(function() {
                            var t = e.defaultView;
                            t && (o && t.clearInterval(o), a(t, "resize", n, !0)), a(e, "scroll", n, !0), i && i.disconnect()
                        }), t = this.root && (this.root.ownerDocument || this.root) || p, e == t || (t = r(e)) && this._monitorIntersections(t.ownerDocument))
                    }, t.prototype._unmonitorIntersections = function(o) {
                        var i, t, e = this._monitoringDocuments.indexOf(o); - 1 != e && (i = this.root && (this.root.ownerDocument || this.root) || p, this._observationTargets.some(function(t) {
                            if ((e = t.element.ownerDocument) == o) return !0;
                            for (; e && e != i;) {
                                var e, n = r(e);
                                if ((e = n && n.ownerDocument) == o) return !0
                            }
                            return !1
                        }) || (t = this._monitoringUnsubscribes[e], this._monitoringDocuments.splice(e, 1), this._monitoringUnsubscribes.splice(e, 1), t(), o == i || (t = r(o)) && this._unmonitorIntersections(t.ownerDocument)))
                    }, t.prototype._unmonitorAllIntersections = function() {
                        var t = this._monitoringUnsubscribes.slice(0);
                        this._monitoringDocuments.length = 0;
                        for (var e = this._monitoringUnsubscribes.length = 0; e < t.length; e++) t[e]()
                    }, t.prototype._checkForIntersections = function() {
                        var a, c;
                        !this.root && d && !h || (a = this._rootIsInDom(), c = a ? this._getRootRect() : u(), this._observationTargets.forEach(function(t) {
                            var e = t.element,
                                n = m(e),
                                o = this._rootContainsTarget(e),
                                i = t.entry,
                                r = a && o && this._computeTargetAndRootIntersection(e, n, c),
                                s = null;
                            this._rootContainsTarget(e) ? d && !this.root || (s = c) : s = u();
                            r = t.entry = new l({
                                time: window.performance && performance.now && performance.now(),
                                target: e,
                                boundingClientRect: n,
                                rootBounds: s,
                                intersectionRect: r
                            });
                            i ? a && o ? this._hasCrossedThreshold(i, r) && this._queuedEntries.push(r) : i && i.isIntersecting && this._queuedEntries.push(r) : this._queuedEntries.push(r)
                        }, this), this._queuedEntries.length && this._callback(this.takeRecords(), this))
                    }, t.prototype._computeTargetAndRootIntersection = function(t, e, n) {
                        if ("none" != window.getComputedStyle(t).display) {
                            for (var o = e, i = v(t), r = !1; !r && i;) {
                                var s, a, c, l, u = null,
                                    f = 1 == i.nodeType ? window.getComputedStyle(i) : {};
                                if ("none" == f.display) return null;
                                if (i == this.root || 9 == i.nodeType ? (r = !0, i == this.root || i == p ? d && !this.root ? !h || 0 == h.width && 0 == h.height ? o = u = i = null : u = h : u = n : (a = (s = v(i)) && m(s), c = s && this._computeTargetAndRootIntersection(s, a, n), a && c ? (i = s, u = g(a, c)) : o = i = null)) : i != (l = i.ownerDocument).body && i != l.documentElement && "visible" != f.overflow && (u = m(i)), u && (s = u, a = o, u = f = l = c = void 0, c = Math.max(s.top, a.top), l = Math.min(s.bottom, a.bottom), f = Math.max(s.left, a.left), u = Math.min(s.right, a.right), a = l - c, o = 0 <= (s = u - f) && 0 <= a ? {
                                        top: c,
                                        bottom: l,
                                        left: f,
                                        right: u,
                                        width: s,
                                        height: a
                                    } : null), !o) break;
                                i = i && v(i)
                            }
                            return o
                        }
                    }, t.prototype._getRootRect = function() {
                        var t, e;
                        return e = this.root && !c(this.root) ? m(this.root) : (t = (e = c(this.root) ? this.root : p).documentElement, e = e.body, {
                            top: 0,
                            left: 0,
                            right: t.clientWidth || e.clientWidth,
                            width: t.clientWidth || e.clientWidth,
                            bottom: t.clientHeight || e.clientHeight,
                            height: t.clientHeight || e.clientHeight
                        }), this._expandRectByRootMargin(e)
                    }, t.prototype._expandRectByRootMargin = function(n) {
                        var t = this._rootMarginValues.map(function(t, e) {
                                return "px" == t.unit ? t.value : t.value * (e % 2 ? n.width : n.height) / 100
                            }),
                            t = {
                                top: n.top - t[0],
                                right: n.right + t[1],
                                bottom: n.bottom + t[2],
                                left: n.left - t[3]
                            };
                        return t.width = t.right - t.left, t.height = t.bottom - t.top, t
                    }, t.prototype._hasCrossedThreshold = function(t, e) {
                        var n = t && t.isIntersecting ? t.intersectionRatio || 0 : -1,
                            o = e.isIntersecting ? e.intersectionRatio || 0 : -1;
                        if (n !== o)
                            for (var i = 0; i < this.thresholds.length; i++) {
                                var r = this.thresholds[i];
                                if (r == n || r == o || r < n != r < o) return !0
                            }
                    }, t.prototype._rootIsInDom = function() {
                        return !this.root || i(p, this.root)
                    }, t.prototype._rootContainsTarget = function(t) {
                        var e = this.root && (this.root.ownerDocument || this.root) || p;
                        return i(e, t) && (!this.root || e == t.ownerDocument)
                    }, t.prototype._registerInstance = function() {
                        n.indexOf(this) < 0 && n.push(this)
                    }, t.prototype._unregisterInstance = function() {
                        var t = n.indexOf(this); - 1 != t && n.splice(t, 1)
                    }, window.IntersectionObserver = t, window.IntersectionObserverEntry = l))
                }()
            },
            72: function(t, e, n) {
                function y() {
                    return f.Date.now()
                }
                var i = NaN,
                    r = "[object Symbol]",
                    s = /^\s+|\s+$/g,
                    a = /^[-+]0x[0-9a-f]+$/i,
                    c = /^0b[01]+$/i,
                    l = /^0o[0-7]+$/i,
                    u = parseInt,
                    o = "object" == typeof n.g && n.g && n.g.Object === Object && n.g,
                    n = "object" == typeof self && self && self.Object === Object && self,
                    f = o || n || Function("return this")(),
                    p = Object.prototype.toString,
                    b = Math.max,
                    k = Math.min;

                function w(t) {
                    var e = typeof t;
                    return t && ("object" == e || "function" == e)
                }

                function T(t) {
                    if ("number" == typeof t) return t;
                    if ("symbol" == typeof(e = t) || !!(n = e) && "object" == typeof n && p.call(e) == r) return i;
                    var e, n;
                    if (w(t) && (t = w(o = "function" == typeof t.valueOf ? t.valueOf() : t) ? o + "" : o), "string" != typeof t) return 0 === t ? t : +t;
                    t = t.replace(s, "");
                    var o = c.test(t);
                    return o || l.test(t) ? u(t.slice(2), o ? 2 : 8) : a.test(t) ? i : +t
                }
                t.exports = function(o, n, t) {
                    var i, r, s, a, c, l, u = 0,
                        f = !1,
                        p = !1,
                        e = !0;
                    if ("function" != typeof o) throw new TypeError("Expected a function");

                    function d(t) {
                        var e = i,
                            n = r;
                        return i = r = void 0, u = t, a = o.apply(n, e)
                    }

                    function h(t) {
                        var e = t - l;
                        return void 0 === l || n <= e || e < 0 || p && s <= t - u
                    }

                    function m() {
                        var t, e = y();
                        if (h(e)) return g(e);
                        c = setTimeout(m, (e = n - ((t = e) - l), p ? k(e, s - (t - u)) : e))
                    }

                    function g(t) {
                        return c = void 0, e && i ? d(t) : (i = r = void 0, a)
                    }

                    function v() {
                        var t = y(),
                            e = h(t);
                        if (i = arguments, r = this, l = t, e) {
                            if (void 0 === c) return u = e = l, c = setTimeout(m, n), f ? d(e) : a;
                            if (p) return c = setTimeout(m, n), d(l)
                        }
                        return void 0 === c && (c = setTimeout(m, n)), a
                    }
                    return n = T(n) || 0, w(t) && (f = !!t.leading, p = "maxWait" in t, s = p ? b(T(t.maxWait) || 0, n) : s, e = "trailing" in t ? !!t.trailing : e), v.cancel = function() {
                        void 0 !== c && clearTimeout(c), i = l = r = c = void(u = 0)
                    }, v.flush = function() {
                        return void 0 === c ? a : g(y())
                    }, v
                }
            },
            577: function(t) {
                "use strict";
                t.exports = Roblox
            }
        },
        o = {};

    function D(t) {
        var e = o[t];
        if (void 0 !== e) return e.exports;
        e = o[t] = {
            exports: {}
        };
        return n[t](e, e.exports, D), e.exports
    }
    D.n = function(t) {
            var e = t && t.__esModule ? function() {
                return t.default
            } : function() {
                return t
            };
            return D.d(e, {
                a: e
            }), e
        }, D.d = function(t, e) {
            for (var n in e) D.o(e, n) && !D.o(t, n) && Object.defineProperty(t, n, {
                enumerable: !0,
                get: e[n]
            })
        }, D.g = function() {
            if ("object" == typeof globalThis) return globalThis;
            try {
                return this || new Function("return this")()
            } catch (t) {
                if ("object" == typeof window) return window
            }
        }(), D.o = function(t, e) {
            return Object.prototype.hasOwnProperty.call(t, e)
        }, D.r = function(t) {
            "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(t, Symbol.toStringTag, {
                value: "Module"
            }), Object.defineProperty(t, "__esModule", {
                value: !0
            })
        },
        function() {
            "use strict";
            var t = angular,
                e = D.n(t),
                n = D(525),
                u = React,
                f = D.n(u),
                p = window.EventTracker ? EventTracker : {
                    fireEvent: console.log,
                    start: console.log,
                    endSuccess: console.log,
                    endCancel: console.log,
                    endFailure: console.log
                },
                o = D(870),
                d = D.n(o),
                h = HeaderScripts,
                m = CoreRobloxUtilities,
                g = ReactStyleGuide,
                i = ReactUtilities,
                c = D(72);

            function r(t) {
                return (r = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(t) {
                    return typeof t
                } : function(t) {
                    return t && "function" == typeof Symbol && t.constructor === Symbol && t !== Symbol.prototype ? "symbol" : typeof t
                })(t)
            }

            function l(t, e) {
                var n = t.elements,
                    o = t.threshold;
                try {
                    var i = new window.IntersectionObserver(e, {
                        threshold: o
                    });
                    return n.forEach(function(t) {
                            i.observe(t)
                        }),
                        function() {
                            return i.disconnect()
                        }
                } catch (t) {}
                return function() {}
            }

            function v(e, t, n) {
                var o = (0, u.useRef)(new Set),
                    s = (0, u.useRef)(new Set),
                    i = (0, u.useRef)(null),
                    r = (0, u.useCallback)(function() {
                        (function(t, e) {
                            if (0 === t.length || 0 === e) return [t];
                            for (var n = [], o = 0; o < t.length; o += e) n.push(t.slice(o, o + e));
                            return n
                        })(Array.from(s.current).filter(function(t) {
                            return !o.current.has(t)
                        }), y).filter(function(t) {
                            return 0 < t.length
                        }).forEach(function(t) {
                            n(t), t.forEach(function(t) {
                                return o.current.add(t)
                            })
                        }), s.current.clear()
                    }, [n]),
                    a = (0, u.useMemo)(function() {
                        return c(function() {
                            return r()
                        }, 200)
                    }, [r]);
                (0, u.useEffect)(function() {
                    var t, r = Array.from(null !== (t = null == e || null === (t = e.current) || void 0 === t ? void 0 : t.children) && void 0 !== t ? t : []).filter(function(t) {
                        return t instanceof HTMLElement
                    });
                    return i.current && (i.current(), i.current = null), i.current = l({
                            elements: r,
                            threshold: b
                        }, function(t, e) {
                            var n, o, i;
                            a.cancel(), (n = r, o = e, i = [], t.forEach(function(e) {
                                var t;
                                null == e || !e.isIntersecting || 0 <= (t = n.findIndex(function(t) {
                                    return t === e.target
                                })) && (i.push(t), o.unobserve(e.target))
                            }), i.sort(function(t, e) {
                                return t - e
                            })).forEach(function(t) {
                                return s.current.add(t)
                            }), a()
                        }),
                        function() {
                            a.cancel(), i.current && (i.current(), i.current = null)
                        }
                }, [e, t, a, s])
            }
            D(489);
            var y = 25,
                b = .5;

            function s(i) {
                return Object.keys(i).reduce(function(t, e) {
                    var n, o, n = (n = i[e], o = !1, Array.isArray(n) && !o ? n.join(",") : "object" === r(n) && n ? JSON.stringify(n) : "number" == typeof n || "string" == typeof n ? n : "boolean" == typeof n ? n ? 1 : 0 : void 0);
                    return void 0 !== n && (t[e] = n), t
                }, {})
            }(t = {}).ItemImpressions = "itemImpressions", t.ItemAction = "itemAction", (o = {}).Games = "Games", o.Home = "Home", o.SearchLanding = "SearchLanding", o.Spotlight = "Spotlight", o.UserProfile = "UserProfile", (t = {}).HomePageSessionInfo = "homePageSessionInfo", t.DiscoverPageSessionInfo = "discoverPageSessionInfo", t.GameSearchSessionInfo = "gameSearchSessionInfo", t.SpotlightPageSessionInfo = "spotlightPageSessionInfo", (o = {}).ContentType = "contentType", o.Context = "context", o.CollectionId = "collectionId", o.CollectionPosition = "collectionPosition", o.CollectionComponentType = "collectionComponentType", (t = {}).User = "User", t.Game = "Game", (o = {}).Online = "online", o.InGame = "inGame", o.InStudio = "inStudio", o.Offline = "offline", (t = {}).Friend = "friend", t.NotFriend = "notFriend", (o = {}).ItemIds = "itemIds", o.ItemPositions = "itemPositions", o.RowNumbers = "rowNumbers", o.FeedRowNumbers = "feedRowNumbers", o.PositionsInRow = "positionsInRow", o.PositionsInTopic = "positionsInTopic", o.TotalNumberOfItems = "totalNumberOfItems", (t = {}).Presences = "presences", t.PresenceUniverseIds = "presenceUniverseIds", t.FriendStatuses = "friendStatuses", t.SourceCarousel = "sourceCarousel", (o = {}).ItemId = "itemId", o.ItemPosition = "itemPosition", o.ItemComponentType = "itemComponentType", o.RowNumber = "rowNumber", o.FeedRowNumber = "feedRowNumber", o.PositionInRow = "positionInRow", o.PositionInTopic = "positionInTopic", o.TotalNumberOfItems = "totalNumberOfItems", o.ActionType = "actionType", (t = {}).Presence = "presence", t.PresenceUniverseId = "presenceUniverseId", t.FriendStatus = "friendStatus", t.SourceCarousel = "sourceCarousel";
            var k, a, w = CoreUtilities,
                o = D(577);
            (k = k || {}).Game = "Game", (t = a = a || {}).Facebook = "Facebook", t.Twitter = "Twitter", t.Youtube = "YouTube", t.Twitch = "Twitch", t.Discord = "Discord", t.RobloxGroup = "RobloxGroup", t.Amazon = "Amazon", t.Guilded = "Guilded";
            var T = o.EnvironmentUrls.gamesApi,
                t = {
                    getGameSocialLinks: function(t) {
                        return {
                            url: T + "/v1/games/" + t + "/social-links/list",
                            withCredentials: !0
                        }
                    }
                },
                L = {
                    socialLinksTranslationMap: {
                        sectionHeader: "HeadingSocialLinks",
                        modalHeader: "Message.SocialLinkoffPlatformModalTitle",
                        modalBody: "Message.SocialLinkoffPlatformModalBody",
                        modalConfirm: "Message.SocialLinkoffPlatformModalContinueButtonText",
                        modalCancel: "Message.SocialLinkoffPlatformModalCancelButtonText"
                    },
                    iconMap: ((o = {})[a.Amazon] = "icon-social-media-amazon", o[a.Discord] = "icon-social-media-discord", o[a.Facebook] = "icon-social-media-facebook", o[a.RobloxGroup] = "icon-social-media-roblox", o[a.Twitch] = "icon-social-media-twitch", o[a.Twitter] = "icon-social-media-twitter", o[a.Youtube] = "icon-social-media-youtube", o[a.Guilded] = "icon-social-media-guilded", o),
                    url: t,
                    socialLinksCounterEvents: {
                        SocialLinkJumbotronNoValidTypeToSendImpressions: "SocialLinkJumbotronNoValidTypeToSendImpressions",
                        SocialLinkJumbotronNoSocialLinksToSendImpressions: "SocialLinkJumbotronNoSocialLinksToSendImpressions",
                        SocialLinkJumbotronUnableToConvertAssignmentIdToNumber: "SocialLinkJumbotronUnableToConvertAssignmentIdToNumber"
                    }
                },
                I = function(t, s, a, c) {
                    return new(a = a || Promise)(function(n, e) {
                        function o(t) {
                            try {
                                r(c.next(t))
                            } catch (t) {
                                e(t)
                            }
                        }

                        function i(t) {
                            try {
                                r(c.throw(t))
                            } catch (t) {
                                e(t)
                            }
                        }

                        function r(t) {
                            var e;
                            t.done ? n(t.value) : ((e = t.value) instanceof a ? e : new a(function(t) {
                                t(e)
                            })).then(o, i)
                        }
                        r((c = c.apply(t, s || [])).next())
                    })
                },
                S = function(n, o) {
                    var i, r, s, a = {
                            label: 0,
                            sent: function() {
                                if (1 & s[0]) throw s[1];
                                return s[1]
                            },
                            trys: [],
                            ops: []
                        },
                        t = {
                            next: e(0),
                            throw: e(1),
                            return: e(2)
                        };
                    return "function" == typeof Symbol && (t[Symbol.iterator] = function() {
                        return this
                    }), t;

                    function e(e) {
                        return function(t) {
                            return function(e) {
                                if (i) throw new TypeError("Generator is already executing.");
                                for (; a;) try {
                                    if (i = 1, r && (s = 2 & e[0] ? r.return : e[0] ? r.throw || ((s = r.return) && s.call(r), 0) : r.next) && !(s = s.call(r, e[1])).done) return s;
                                    switch (r = 0, s && (e = [2 & e[0], s.value]), e[0]) {
                                        case 0:
                                        case 1:
                                            s = e;
                                            break;
                                        case 4:
                                            return a.label++, {
                                                value: e[1],
                                                done: !1
                                            };
                                        case 5:
                                            a.label++, r = e[1], e = [0];
                                            continue;
                                        case 7:
                                            e = a.ops.pop(), a.trys.pop();
                                            continue;
                                        default:
                                            if (!(s = 0 < (s = a.trys).length && s[s.length - 1]) && (6 === e[0] || 2 === e[0])) {
                                                a = 0;
                                                continue
                                            }
                                            if (3 === e[0] && (!s || e[1] > s[0] && e[1] < s[3])) {
                                                a.label = e[1];
                                                break
                                            }
                                            if (6 === e[0] && a.label < s[1]) {
                                                a.label = s[1], s = e;
                                                break
                                            }
                                            if (s && a.label < s[2]) {
                                                a.label = s[2], a.ops.push(e);
                                                break
                                            }
                                            s[2] && a.ops.pop(), a.trys.pop();
                                            continue
                                    }
                                    e = o.call(n, a)
                                } catch (t) {
                                    e = [6, t], r = 0
                                } finally {
                                    i = s = 0
                                }
                                if (5 & e[0]) throw e[1];
                                return {
                                    value: e[0] ? e[1] : void 0,
                                    done: !0
                                }
                            }([e, t])
                        }
                    }
                },
                C = function(e) {
                    return I(void 0, void 0, Promise, function() {
                        return S(this, function(t) {
                            switch (t.label) {
                                case 0:
                                    return [4, w.httpService.get(L.url.getGameSocialLinks(e))];
                                case 1:
                                    return [2, t.sent().data.data]
                            }
                        })
                    })
                },
                E = m.eventStreamService.eventTypes,
                _ = function(t) {
                    return [{
                        name: "socialLinkClickEvent",
                        type: "socialLinkClickEvent",
                        context: E.formInteraction
                    }, s(t)]
                },
                x = function(t) {
                    return [{
                        name: "EdpSocialLinksImpressions",
                        type: "EdpSocialLinksImpressions",
                        context: E.formInteraction
                    }, s(t)]
                },
                t = {
                    common: ["CommonUI.Controls"],
                    feature: "Feature.PromotedChannels"
                },
                O = function() {
                    return (O = Object.assign || function(t) {
                        for (var e, n = 1, o = arguments.length; n < o; n++)
                            for (var i in e = arguments[n]) Object.prototype.hasOwnProperty.call(e, i) && (t[i] = e[i]);
                        return t
                    }).apply(this, arguments)
                },
                R = function(t, s, a, c) {
                    return new(a = a || Promise)(function(n, e) {
                        function o(t) {
                            try {
                                r(c.next(t))
                            } catch (t) {
                                e(t)
                            }
                        }

                        function i(t) {
                            try {
                                r(c.throw(t))
                            } catch (t) {
                                e(t)
                            }
                        }

                        function r(t) {
                            var e;
                            t.done ? n(t.value) : ((e = t.value) instanceof a ? e : new a(function(t) {
                                t(e)
                            })).then(o, i)
                        }
                        r((c = c.apply(t, s || [])).next())
                    })
                },
                N = function(n, o) {
                    var i, r, s, a = {
                            label: 0,
                            sent: function() {
                                if (1 & s[0]) throw s[1];
                                return s[1]
                            },
                            trys: [],
                            ops: []
                        },
                        t = {
                            next: e(0),
                            throw: e(1),
                            return: e(2)
                        };
                    return "function" == typeof Symbol && (t[Symbol.iterator] = function() {
                        return this
                    }), t;

                    function e(e) {
                        return function(t) {
                            return function(e) {
                                if (i) throw new TypeError("Generator is already executing.");
                                for (; a;) try {
                                    if (i = 1, r && (s = 2 & e[0] ? r.return : e[0] ? r.throw || ((s = r.return) && s.call(r), 0) : r.next) && !(s = s.call(r, e[1])).done) return s;
                                    switch (r = 0, s && (e = [2 & e[0], s.value]), e[0]) {
                                        case 0:
                                        case 1:
                                            s = e;
                                            break;
                                        case 4:
                                            return a.label++, {
                                                value: e[1],
                                                done: !1
                                            };
                                        case 5:
                                            a.label++, r = e[1], e = [0];
                                            continue;
                                        case 7:
                                            e = a.ops.pop(), a.trys.pop();
                                            continue;
                                        default:
                                            if (!(s = 0 < (s = a.trys).length && s[s.length - 1]) && (6 === e[0] || 2 === e[0])) {
                                                a = 0;
                                                continue
                                            }
                                            if (3 === e[0] && (!s || e[1] > s[0] && e[1] < s[3])) {
                                                a.label = e[1];
                                                break
                                            }
                                            if (6 === e[0] && a.label < s[1]) {
                                                a.label = s[1], s = e;
                                                break
                                            }
                                            if (s && a.label < s[2]) {
                                                a.label = s[2], a.ops.push(e);
                                                break
                                            }
                                            s[2] && a.ops.pop(), a.trys.pop();
                                            continue
                                    }
                                    e = o.call(n, a)
                                } catch (t) {
                                    e = [6, t], r = 0
                                } finally {
                                    i = s = 0
                                }
                                if (5 & e[0]) throw e[1];
                                return {
                                    value: e[0] ? e[1] : void 0,
                                    done: !0
                                }
                            }([e, t])
                        }
                    }
                },
                P = L.socialLinksTranslationMap,
                M = L.iconMap,
                U = L.socialLinksCounterEvents,
                i = Object.assign((0, i.withTranslations)(function(t) {
                    function e(t) {
                        var e = Number.parseInt(r, 10);
                        Number.isNaN(e) && (0, p.fireEvent)(U.SocialLinkJumbotronUnableToConvertAssignmentIdToNumber), e = O({
                            assignmentId: Number.isNaN(e) ? r : e,
                            assignmentType: i === k.Game ? "game" : "unknown",
                            socialLinkType: t.type,
                            socialLinkUrl: t.url,
                            socialLinkDisplayType: "badge"
                        }, s), m.eventStreamService.sendEvent.apply(m.eventStreamService, _(e)), window.open(t.url, "_blank")
                    }
                    var i = t.type,
                        r = t.targetId,
                        s = t.referralSessionInfo,
                        n = t.translate,
                        o = (0, u.useState)(void 0),
                        a = o[0],
                        c = o[1],
                        l = (0, u.useRef)(null),
                        t = (0, u.useCallback)(function(t) {
                            var e, n, o;
                            i === k.Game ? a ? (e = (o = t.map(function(t) {
                                return a[t]
                            })).map(function(t) {
                                return null == t ? void 0 : t.url
                            }), n = o.map(function(t) {
                                return null == t ? void 0 : t.type
                            }), o = Number.parseInt(r, 10), Number.isNaN(o) && (0, p.fireEvent)(U.SocialLinkJumbotronUnableToConvertAssignmentIdToNumber), o = O({
                                itemPositions: t,
                                socialLinkUrls: e,
                                socialLinkTypes: n,
                                socialLinkDisplayType: "badge",
                                assignmentType: "game",
                                assignmentId: Number.isNaN(o) ? r : o,
                                page: "GameDetail"
                            }, s), m.eventStreamService.sendEvent.apply(m.eventStreamService, x(o))) : (0, p.fireEvent)(U.SocialLinkJumbotronNoSocialLinksToSendImpressions) : (0, p.fireEvent)(U.SocialLinkJumbotronNoValidTypeToSendImpressions)
                        }, [a, r, i, s]);
                    return v(l, null !== (o = null == a ? void 0 : a.length) && void 0 !== o ? o : 0, t), (0, u.useEffect)(function() {
                        R(void 0, void 0, void 0, function() {
                            var e;
                            return N(this, function(t) {
                                switch (t.label) {
                                    case 0:
                                        if (h.authenticatedUser.isUnder13 || !h.authenticatedUser.isAuthenticated) return [3, 5];
                                        t.label = 1;
                                    case 1:
                                        return t.trys.push([1, 3, , 4]), [4, C(r)];
                                    case 2:
                                        return e = t.sent(), c(e), [3, 4];
                                    case 3:
                                        return t.sent(), c([]), [3, 4];
                                    case 4:
                                        return [3, 6];
                                    case 5:
                                        c([]), t.label = 6;
                                    case 6:
                                        return [2]
                                }
                            })
                        })
                    }, [r]), a && 0 !== (null == a ? void 0 : a.length) ? f().createElement("div", {
                        className: "section"
                    }, f().createElement("div", {
                        className: "container-header"
                    }, f().createElement("h3", null, n(P.sectionHeader))), f().createElement("ul", {
                        className: "game-social-links",
                        ref: l
                    }, a.map(function(t) {
                        return f().createElement(g.Link, {
                            onClick: function() {
                                e(t)
                            },
                            onKeyDown: function() {
                                e(t)
                            },
                            key: t.id,
                            className: "btn-secondary-lg border"
                        }, f().createElement("span", {
                            className: d()("social-icon", M[t.type])
                        }), f().createElement("span", {
                            className: "text-body-large text-wrap text-align-x-start padding-left-small"
                        }, t.title))
                    }))) : null
                }, t), {
                    SocialLinkJumbotronType: k
                });
            (0, n.importFilesUnderPath)(D(209)), (0, n.importFilesUnderPath)(D(364)), t = D(2), (0, n.templateCacheGenerator)(e(), "socialLinksJumbotronHtmlTemplateApp", null, t), window.Roblox.SocialLinksJumbotron = i
        }()
}();
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/ad2172266d0fc64eb52d6881e6b1c352-socialLinksJumbotron.bundle.min.js.map

/* Bundle detector */
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("SocialLinksJumbotron");