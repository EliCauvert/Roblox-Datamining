! function() {
    var n = {
            6636: function(t, e, n) {
                var o = {
                    "./profileDescriptionComponent.js": 8083,
                    "./profileDescriptionViewComponent.js": 3367
                };

                function r(t) {
                    t = i(t);
                    return n(t)
                }

                function i(t) {
                    if (n.o(o, t)) return o[t];
                    t = new Error("Cannot find module '" + t + "'");
                    throw t.code = "MODULE_NOT_FOUND", t
                }
                r.keys = function() {
                    return Object.keys(o)
                }, r.resolve = i, (t.exports = r).id = 6636
            },
            1014: function(t, e, n) {
                var o = {
                    "./profileDescriptionConstants.js": 8163
                };

                function r(t) {
                    t = i(t);
                    return n(t)
                }

                function i(t) {
                    if (n.o(o, t)) return o[t];
                    t = new Error("Cannot find module '" + t + "'");
                    throw t.code = "MODULE_NOT_FOUND", t
                }
                r.keys = function() {
                    return Object.keys(o)
                }, r.resolve = i, (t.exports = r).id = 1014
            },
            9188: function(t, e, n) {
                var o = {
                    "./profileDescriptionController.js": 9906,
                    "./profileDescriptionViewController.js": 7484
                };

                function r(t) {
                    t = i(t);
                    return n(t)
                }

                function i(t) {
                    if (n.o(o, t)) return o[t];
                    t = new Error("Cannot find module '" + t + "'");
                    throw t.code = "MODULE_NOT_FOUND", t
                }
                r.keys = function() {
                    return Object.keys(o)
                }, r.resolve = i, (t.exports = r).id = 9188
            },
            3025: function(t, e, n) {
                var o = {
                    "./linkifyFilter.js": 1650
                };

                function r(t) {
                    t = i(t);
                    return n(t)
                }

                function i(t) {
                    if (n.o(o, t)) return o[t];
                    t = new Error("Cannot find module '" + t + "'");
                    throw t.code = "MODULE_NOT_FOUND", t
                }
                r.keys = function() {
                    return Object.keys(o)
                }, r.resolve = i, (t.exports = r).id = 3025
            },
            8055: function(t, e, n) {
                var o = {
                    "./descriptionLayout.js": 1908,
                    "./profileDescriptionService.js": 9610
                };

                function r(t) {
                    t = i(t);
                    return n(t)
                }

                function i(t) {
                    if (n.o(o, t)) return o[t];
                    t = new Error("Cannot find module '" + t + "'");
                    throw t.code = "MODULE_NOT_FOUND", t
                }
                r.keys = function() {
                    return Object.keys(o)
                }, r.resolve = i, (t.exports = r).id = 8055
            },
            8148: function(t, e, n) {
                var o = {
                    "./components/templates/profileDescription.html": 3439,
                    "./components/templates/profileDescriptionView.html": 9794
                };

                function r(t) {
                    t = i(t);
                    return n(t)
                }

                function i(t) {
                    if (n.o(o, t)) return o[t];
                    t = new Error("Cannot find module '" + t + "'");
                    throw t.code = "MODULE_NOT_FOUND", t
                }
                r.keys = function() {
                    return Object.keys(o)
                }, r.resolve = i, (t.exports = r).id = 8148
            },
            3544: function(t) {
                function i(t) {
                    return t.replace(/([a-z])([A-Z])/g, "$1-$2").toLowerCase()
                }

                function c(t) {
                    return t.split("/").pop().replace(".html", "")
                }
                var e = {
                    importFilesUnderPath: function(t) {
                        t.keys().forEach(t)
                    },
                    templateCacheGenerator: function(t, e, o, r) {
                        return t.module(e, []).run(["$templateCache", function(n) {
                            o && o.keys().forEach(function(t) {
                                var e = i(c(t));
                                n.put(e, o(t))
                            }), r && r.keys().forEach(function(t) {
                                var e = i(c(t));
                                n.put(e, r(t).replace(/<\/?script[^>]*>/gi, ""))
                            })
                        }])
                    }
                };
                t.exports = e
            },
            8083: function(t, e, n) {
                "use strict";
                n.r(e);
                var o = {
                    templateUrl: "profile-description",
                    controller: "profileDescriptionController"
                };
                n(9845).Z.component("profileDescription", o), e.default = o
            },
            3367: function(t, e, n) {
                "use strict";
                n.r(e);
                var o = {
                    templateUrl: "profile-description-view",
                    bindings: {
                        description: "<"
                    },
                    controller: "profileDescriptionViewController"
                };
                n(9845).Z.component("profileDescriptionView", o), e.default = o
            },
            8163: function(t, e, n) {
                "use strict";
                n.r(e);
                var o = n(792),
                    n = n(9845),
                    o = {
                        defaultMaxDescriptionLength: 1e3,
                        pinLockedErrorCode: 2,
                        urls: {
                            descriptionUrl: "".concat(o.EnvironmentUrls.usersApi, "/v1/description"),
                            metadataUrl: "".concat(o.EnvironmentUrls.accountInformationApi, "/v1/metadata")
                        }
                    };
                n.Z.constant("profileDescriptionConstants", o), e.default = o
            },
            9906: function(t, e, n) {
                "use strict";
                n.r(e), n.d(e, {
                    default: function() {
                        return r
                    }
                });
                var s = HeaderScripts,
                    n = n(9845);

                function o(e, n, o, r, t, i) {
                    var c = this;

                    function a() {
                        var t;
                        c.layout || (t = n.absUrl(), t = (t = /\/users\/(\d+)\/profile/g.exec(t)) && 1 < t.length ? Number(t[1]) : null, c.layout = {
                            showSeeAllButton: !1,
                            showEditBox: !1,
                            descriptionError: null,
                            canEdit: (null === s.authenticatedUser || void 0 === s.authenticatedUser ? void 0 : s.authenticatedUser.id) === t
                        }, c.data = {
                            description: ""
                        }, c.loadAccountInformationMetadata(), c.initializeDescription())
                    }
                    c.initializeDescription = function() {
                        o.getDescription().then(function(t) {
                            c.data.description = t.description, c.layout.showEditBox = c.isDescriptionEmpty()
                        }, function(t) {
                            e.debug("Error getting personal description"), c.layout.descriptionError = o.getDescriptionError(t)
                        })
                    }, c.updateDescription = function(t) {
                        t ? o.updateDescription(c.data.description).then(function(t) {
                            c.data.description = t.description, c.layout.showEditBox = !1, c.layout.descriptionError = null
                        }, function(t) {
                            e.debug("Error updating personal description"), c.layout.descriptionError = o.getDescriptionError(t)
                        }) : (c.initializeDescription(), c.layout.showEditBox = !1, c.layout.descriptionError = null)
                    }, c.openEditBox = function() {
                        c.layout.showEditBox = !0
                    }, c.isDescriptionEmpty = function() {
                        return null == c.data.description || 0 === c.data.description.length
                    }, c.loadAccountInformationMetadata = function() {
                        o.getAccountInformationMetadata().then(function(t) {
                            c.layout.maxDescriptionLength = t.MaxUserDescriptionLength
                        }, function(t) {
                            c.layout.maxDescriptionLength = r.defaultMaxDescriptionLength, e("Unable to load metadata")
                        })
                    }, c.$onInit = a, c.$onChanges = a
                }
                o.$inject = ["$log", "$location", "profileDescriptionService", "profileDescriptionConstants", "descriptionLayout", "languageResource"], n.Z.controller("profileDescriptionController", o);
                var r = o
            },
            7484: function(t, e, n) {
                "use strict";
                n.r(e);
                var o = n(792),
                    n = n(9845);

                function r(t) {
                    var e = this;
                    e.$onInit = function() {
                        e.inApp = !!o.DeviceMeta && (0, o.DeviceMeta)().isInApp
                    }, e.$onChanges = function() {
                        t(function() {
                            o.BootstrapWidgets.TruncateContent(), o.BootstrapWidgets.ToggleContent()
                        })
                    }
                }
                r.$inject = ["$timeout"], n.Z.controller("profileDescriptionViewController", r), e.default = r
            },
            1650: function(t, e, n) {
                "use strict";
                n.r(e);
                var o = n(792);

                function r() {
                    return function(t) {
                        return "string" != typeof t ? t : angular.isDefined(o.Linkify) && "function" == typeof o.Linkify.String ? o.Linkify.String(t.escapeHTML()) : t.escapeHTML()
                    }
                }
                n(9845).Z.filter("linkify", r), e.default = r
            },
            9845: function(t, e, n) {
                "use strict";
                var o = n(792),
                    r = n(5734),
                    r = n.n(r)().module("userDescription", ["robloxApp", "profileAboutAppTemplates", "ui.bootstrap", "systemFeedback"]).config(["languageResourceProvider", function(t) {
                        var e = (new o.TranslationResourceProvider).getTranslationResource("Feature.Profile");
                        t.setTranslationResources([e])
                    }]);
                e.Z = r
            },
            1908: function(t, e, n) {
                "use strict";
                n.r(e);
                n = n(9845);

                function o(t, e) {
                    return {
                        descriptionLayout: {},
                        getDescriptionResponse: {
                            errorCodeMapMsg: {
                                1: e.get("Description.Error"),
                                2: e.get("Message.PinLocked")
                            }
                        }
                    }
                }
                o.$inject = ["$log", "languageResource"], n.Z.factory("descriptionLayout", o), e.default = o
            },
            9610: function(t, e, n) {
                "use strict";
                n.r(e);
                n = n(9845);

                function o(c, e, o) {
                    function n(t, e, n, o) {
                        var r, i = {
                            url: t,
                            withCredentials: !0
                        };
                        switch (n) {
                            case c.methods.get:
                                return i.noCache = !o, c.httpGet(i, e);
                            case c.methods.post:
                                return i.headers = {
                                    "Content-Type": "application/x-www-form-urlencoded"
                                }, null != e && (r = $.param(e)), c.httpPost(i, r);
                            case c.methods.patch:
                                return i.headers = {
                                    "Content-Type": "application/x-www-form-urlencoded"
                                }, null != e && (r = $.param(e)), c.httpPatch(i, r);
                            case c.methods.delete:
                                return c.httpDelete(i, e);
                            default:
                                return c.httpGet(i, e)
                        }
                    }
                    return {
                        getDescription: function() {
                            return n(e.urls.descriptionUrl, null, "GET", !0)
                        },
                        updateDescription: function(t) {
                            return n(e.urls.descriptionUrl, {
                                description: t
                            }, "POST")
                        },
                        getDescriptionError: function(t) {
                            var e, n = o.getDescriptionResponse.errorCodeMapMsg;
                            return null != t && null !== (e = t.errors) && void 0 !== e && e.length ? n[t.errors[0].code] : n[1]
                        },
                        getAccountInformationMetadata: function() {
                            var t = {
                                url: e.urls.metadataUrl
                            };
                            return c.httpGet(t)
                        }
                    }
                }
                o.$inject = ["httpService", "profileDescriptionConstants", "descriptionLayout"], n.Z.factory("profileDescriptionService", o), e.default = o
            },
            3439: function(t) {
                t.exports = '<div class="section profile-about"> <system-feedback></system-feedback> <div class="container-header"> <h2 ng-bind="\'Heading.AboutTab\' | translate"></h2> <div ng-if="$ctrl.layout.canEdit" ng-hide="$ctrl.layout.showEditBox"> <button class="btn-generic-edit-sm" ng-click="$ctrl.openEditBox()"> <span class="icon-edit"></span> </button> </div> </div> <div class="section-content remove-panel" ng-show="$ctrl.layout.showEditBox"> <div class="form-group form-has-feedback description-container" ng-class="{\'form-has-error\': $ctrl.layout.descriptionError }" ng-cloak> <textarea class="form-control input-field personal-field-description" id="descriptionTextBox" placeholder="{{ \'Description.PlaceholderStatus\' | translate }}" rows="4" ng-cloak ng-model="$ctrl.data.description" maxlength="{{$ctrl.layout.maxDescriptionLength}}"></textarea> <div class="description-event"> <span class="small text" ng-bind="\'Description.AboutWarning\' | translate"></span> <p ng-if="$ctrl.layout.descriptionError" class="form-control-label" ng-bind="$ctrl.layout.descriptionError"> </p> <p ng-if="!$ctrl.layout.descriptionError" class="form-control-label" ng-bind="$ctrl.data.description.length | formatCharacterCount: $ctrl.layout.maxDescriptionLength"> </p> </div> <div class="description-buttons"> <button id="CancelInfoSettings" class="btn-control-md btn-min-width acct-settings-btn" ng-click="$ctrl.updateDescription(false)" ng-bind="\'Action.Cancel\' | translate"></button> <button id="SaveInfoSettings" class="btn-control-md btn-min-width acct-settings-btn" ng-click="$ctrl.updateDescription(true)" ng-bind="\'Action.Save\' | translate"></button> </div> </div> </div> <div class="section-content remove-panel" ng-if="$ctrl.data.description && !$ctrl.layout.showEditBox"> <profile-description-view description="$ctrl.data.description"></profile-description-view> </div> </div>'
            },
            9794: function(t) {
                t.exports = '<div class="profile-about-content toggle-target"> <pre id="profile-about-text" class="content-overflow-toggle content-height text profile-about-text">\r\n        <span class="profile-about-content-text" ng-class="{\'linkify\': !$ctrl.inApp}" ng-bind-html="$ctrl.description | linkify"></span>\r\n    </pre> <span class="hidden toggle-content text-link cursor-pointer" data-container-id="profile-about-text" data-show-label="{{ \'Label.ReadMore\' | translate }}" data-hide-label="{{ \'Label.ShowLess\' | translate }}" ng-bind=" \'Label.ReadMore\' | translate "></span> </div>'
            },
            792: function(t) {
                "use strict";
                t.exports = Roblox
            },
            5734: function(t) {
                "use strict";
                t.exports = angular
            }
        },
        o = {};

    function i(t) {
        if (o[t]) return o[t].exports;
        var e = o[t] = {
            exports: {}
        };
        return n[t](e, e.exports, i), e.exports
    }
    i.n = function(t) {
            var e = t && t.__esModule ? function() {
                return t.default
            } : function() {
                return t
            };
            return i.d(e, {
                a: e
            }), e
        }, i.d = function(t, e) {
            for (var n in e) i.o(e, n) && !i.o(t, n) && Object.defineProperty(t, n, {
                enumerable: !0,
                get: e[n]
            })
        }, i.o = function(t, e) {
            return Object.prototype.hasOwnProperty.call(t, e)
        }, i.r = function(t) {
            "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(t, Symbol.toStringTag, {
                value: "Module"
            }), Object.defineProperty(t, "__esModule", {
                value: !0
            })
        },
        function() {
            "use strict";
            var t = i(5734),
                e = i.n(t),
                n = i(3544),
                o = i(9845);
            (0, n.importFilesUnderPath)(i(1014)), (0, n.importFilesUnderPath)(i(9188)), (0, n.importFilesUnderPath)(i(8055)), (0, n.importFilesUnderPath)(i(3025)), (0, n.importFilesUnderPath)(i(6636));
            var t = i(8148),
                r = (0, n.templateCacheGenerator)(e(), "profileAboutAppTemplates", t);
            e().element(function() {
                e().bootstrap("#profile-about-container:not([ng-modules])", [o.Z.name, r.name])
            })
        }()
}();
//# sourceMappingURL=https://js.rbxcdn.com/08fe49fe7811a1fd86318b958767708a-userDescription.bundle.min.js.map

/* Bundle detector */
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("UserDescription");