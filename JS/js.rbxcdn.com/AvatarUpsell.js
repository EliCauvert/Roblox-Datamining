! function() {
    var n = {
            789: function(t, e, n) {
                var a = {
                    "./avatarUpsellConstants.js": 226
                };

                function r(t) {
                    t = o(t);
                    return n(t)
                }

                function o(t) {
                    if (n.o(a, t)) return a[t];
                    t = new Error("Cannot find module '" + t + "'");
                    throw t.code = "MODULE_NOT_FOUND", t
                }
                r.keys = function() {
                    return Object.keys(a)
                }, r.resolve = o, (t.exports = r).id = 789
            },
            693: function(t, e, n) {
                var a = {
                    "./avatarUpsellController.js": 619
                };

                function r(t) {
                    t = o(t);
                    return n(t)
                }

                function o(t) {
                    if (n.o(a, t)) return a[t];
                    t = new Error("Cannot find module '" + t + "'");
                    throw t.code = "MODULE_NOT_FOUND", t
                }
                r.keys = function() {
                    return Object.keys(a)
                }, r.resolve = o, (t.exports = r).id = 693
            },
            46: function(t, e, n) {
                var a = {
                    "./avatarUpsellBase.js": 823
                };

                function r(t) {
                    t = o(t);
                    return n(t)
                }

                function o(t) {
                    if (n.o(a, t)) return a[t];
                    t = new Error("Cannot find module '" + t + "'");
                    throw t.code = "MODULE_NOT_FOUND", t
                }
                r.keys = function() {
                    return Object.keys(a)
                }, r.resolve = o, (t.exports = r).id = 46
            },
            993: function(t, e, n) {
                var a = {
                    "./directives/templates/avatarUpsell.html": 406
                };

                function r(t) {
                    t = o(t);
                    return n(t)
                }

                function o(t) {
                    if (n.o(a, t)) return a[t];
                    t = new Error("Cannot find module '" + t + "'");
                    throw t.code = "MODULE_NOT_FOUND", t
                }
                r.keys = function() {
                    return Object.keys(a)
                }, r.resolve = o, (t.exports = r).id = 993
            },
            525: function(t) {
                function o(t) {
                    return t.replace(/([a-z])([A-Z])/g, "$1-$2").toLowerCase()
                }

                function i(t) {
                    return t.split("/").pop().replace(".html", "")
                }
                var e = {
                    importFilesUnderPath: function(t) {
                        t.keys().forEach(t)
                    },
                    templateCacheGenerator: function(t, e, a, r) {
                        return t.module(e, []).run(["$templateCache", function(n) {
                            a && a.keys().forEach(function(t) {
                                var e = o(i(t));
                                n.put(e, a(t))
                            }), r && r.keys().forEach(function(t) {
                                var e = o(i(t));
                                n.put(e, r(t).replace(/<\/?script[^>]*>/gi, ""))
                            })
                        }])
                    }
                };
                t.exports = e
            },
            277: function(t, e, n) {
                "use strict";
                var a = n(577),
                    r = n(127),
                    r = n.n(r)().module("avatarUpsell", ["robloxApp", "thumbnails"]).config(["$compileProvider", "$injector", function(t, e) {
                        var n = e.get("languageResourceProvider"),
                            e = (new a.TranslationResourceProvider).getTranslationResource("Feature.Avatar");
                        n.setTranslationResources([e]), t.aHrefSanitizationWhitelist(/^\s*(https?|ftp|mailto|intent|robloxmobile):/)
                    }]);
                e.A = r
            },
            226: function(t, e, n) {
                "use strict";
                n.r(e);
                var a = n(577),
                    n = n(277),
                    a = {
                        layout: {
                            linkToFollow: "",
                            downLink: "",
                            waitBeforeNavigatingToStore: 500
                        },
                        endpoints: {
                            avatarThumbnailUrl: "".concat(a.EnvironmentUrls.thumbnailsApi, "/v1/users/avatar?size=352x352&format=png")
                        },
                        thumbnailType: "Avatar",
                        avatarSize: "352x352"
                    };
                n.A.constant("avatarUpsellConstants", a), e.default = a
            },
            619: function(t, e, n) {
                "use strict";
                n.r(e);
                var i = n(577),
                    n = n(277);

                function a(o, t, a, e, n, r) {
                    t.debug("avatarUpsellController starting"), o.buildDownloadLink = function() {
                        var t = (0, i.DeviceMeta)(),
                            e = i.EnvironmentUrls.appProtocolUrl,
                            n = i.EnvironmentUrls.iosAppStoreLink,
                            a = i.EnvironmentUrls.googlePlayStoreLink,
                            r = e;
                        o.layout.linkToFollow = e, t && (t.isIosDevice ? r = n : t.isAndroidDevice && (r = a)), o.layout.downloadLink = r
                    }, o.launchApp = function() {
                        e(function() {
                            n.document.hasFocus && n.document.hasFocus() && (n.location.href = o.layout.downloadLink)
                        }, a.layout.waitBeforeNavigatingToStore)
                    }, o.getAvatarThumbnail = function() {
                        var t = parseInt(i.CurrentUser.userId),
                            e = a.thumbnailType,
                            n = a.avatarSize;
                        r.getThumbnailImage(e, t, n).then(function(t) {
                            o.dataModel.thumbUrl = t.thumbnail.imageUrl
                        })
                    }, o.init = function() {
                        o.layout = a.layout, o.dataModel = {
                            userId: i.CurrentUser.userId,
                            userName: i.CurrentUser.name
                        }, o.getAvatarThumbnail(), o.buildDownloadLink()
                    }, o.init()
                }
                a.$inject = ["$scope", "$log", "avatarUpsellConstants", "$timeout", "$window", "thumbnailService"], n.A.controller("avatarUpsellController", a), e.default = a
            },
            823: function(t, e, n) {
                "use strict";

                function a() {
                    return {
                        restrict: "A",
                        replace: !1,
                        templateUrl: "avatar-upsell"
                    }
                }
                n.r(e), n(277).A.directive("avatarUpsellBase", a), e.default = a
            },
            406: function(t) {
                t.exports = '<div class="upsell-container" ng-controller="avatarUpsellController"> <div class="part1"> <div class="avatar-thumbnail-upsell"> <div id="UserAvatar" class="3d-thumbs-enabled thumbnail-holder delayed-thumbnail-holder 3d-thumbs-enabled"> <span class="thumbnail-span" data-3d-url="/avatar-thumbnail-3d/json?userId={{dataModel.userId}}"> <img alt="{{dataModel.userName}}" src="{{dataModel.thumbUrl}}" class="text-default"> </span> <span class="enable-three-dee btn-control btn-control-small">{{ "Action.ThreeDimensions" | translate }}</span> </div> </div> </div> <div class="part2"> <div class="section-content"> <div class="part2-panel" ng-cloak> <h1>{{ "Heading.AvatarPageTitle" | translate }}</h1> <div class="font-caption-header text-description">{{ "Description.AvatarEditorUpsell" | translate }}</div> <a class="btn-secondary-lg get-app-button" ng-href="{{layout.linkToFollow}}" ng-click="launchApp()">{{ "Action.OpenRobloxApp" | translate }}</a> </div> </div> </div> </div> '
            },
            577: function(t) {
                "use strict";
                t.exports = Roblox
            },
            127: function(t) {
                "use strict";
                t.exports = angular
            }
        },
        a = {};

    function l(t) {
        var e = a[t];
        if (void 0 !== e) return e.exports;
        e = a[t] = {
            exports: {}
        };
        return n[t](e, e.exports, l), e.exports
    }
    l.n = function(t) {
            var e = t && t.__esModule ? function() {
                return t.default
            } : function() {
                return t
            };
            return l.d(e, {
                a: e
            }), e
        }, l.d = function(t, e) {
            for (var n in e) l.o(e, n) && !l.o(t, n) && Object.defineProperty(t, n, {
                enumerable: !0,
                get: e[n]
            })
        }, l.o = function(t, e) {
            return Object.prototype.hasOwnProperty.call(t, e)
        }, l.r = function(t) {
            "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(t, Symbol.toStringTag, {
                value: "Module"
            }), Object.defineProperty(t, "__esModule", {
                value: !0
            })
        },
        function() {
            "use strict";
            var t = l(127),
                e = l.n(t),
                n = l(525),
                t = {
                    isEligibleForUpsell: ((r = (0, l(577).DeviceMeta)()).isPhone || r.isTablet) && (r.isAndroidDevice || r.isIosDevice)
                },
                a = l(277),
                r = t.isEligibleForUpsell;
            (0, n.importFilesUnderPath)(l(789)), (0, n.importFilesUnderPath)(l(693)), (0, n.importFilesUnderPath)(l(46));
            var t = l(993),
                o = (0, n.templateCacheGenerator)(e(), "avatarUpsellAppTemplates", t),
                i = document.getElementById("upsell-container") || document.getElementById("avatar-web-app");
            r && (e().element(function() {
                i.classList.add("upsell-container", "rbx-is-upsell"), i.setAttribute("avatar-upsell-base", ""), document.body.classList.add("avatar-upsell"), e().bootstrap(i, [a.A.name, o.name])
            }), window.avatarUpsell = a.A)
        }()
}();
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/23ee26352e57c5966c70ebc189e5750d-avatarUpsell.bundle.min.js.map

/* Bundle detector */
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("AvatarUpsell");