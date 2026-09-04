! function() {
    try {
        var t = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        t.SENTRY_RELEASE = {
            id: "7dd1427733ace37b11c373bec2ccb29663c84427"
        };
        var o = (new t.Error).stack;
        o && (t._sentryDebugIds = t._sentryDebugIds || {}, t._sentryDebugIds[o] = "f31355fb-7a09-48d4-8ad8-9ea6e15e7f05", t._sentryDebugIdIdentifier = "sentry-dbid-f31355fb-7a09-48d4-8ad8-9ea6e15e7f05")
    } catch (t) {}
}(),
function() {
    var t = {
            4688: function(t, o, n) {
                var e = {
                    "./infiniteScrollDirective.js": "7409"
                };

                function a(t) {
                    return n(i(t))
                }

                function i(t) {
                    if (!n.o(e, t)) {
                        var o = Error("Cannot find module '" + t + "'");
                        throw o.code = "MODULE_NOT_FOUND", o
                    }
                    return e[t]
                }
                a.keys = function() {
                    return Object.keys(e)
                }, a.resolve = i, t.exports = a, a.id = 4688
            },
            1197: function(t, o, n) {
                var e = {
                    "./limitedIconDirective.js": "9439"
                };

                function a(t) {
                    return n(i(t))
                }

                function i(t) {
                    if (!n.o(e, t)) {
                        var o = Error("Cannot find module '" + t + "'");
                        throw o.code = "MODULE_NOT_FOUND", o
                    }
                    return e[t]
                }
                a.keys = function() {
                    return Object.keys(e)
                }, a.resolve = i, t.exports = a, a.id = 1197
            },
            7605: function(t, o, n) {
                var e = {
                    "./directives/templates/limitedIconContainer.html": "476"
                };

                function a(t) {
                    return n(i(t))
                }

                function i(t) {
                    if (!n.o(e, t)) {
                        var o = Error("Cannot find module '" + t + "'");
                        throw o.code = "MODULE_NOT_FOUND", o
                    }
                    return e[t]
                }
                a.keys = function() {
                    return Object.keys(e)
                }, a.resolve = i, t.exports = a, a.id = 7605
            },
            8695: function(t, o, n) {
                var e = {
                    "./modalOptions.js": "3291"
                };

                function a(t) {
                    return n(i(t))
                }

                function i(t) {
                    if (!n.o(e, t)) {
                        var o = Error("Cannot find module '" + t + "'");
                        throw o.code = "MODULE_NOT_FOUND", o
                    }
                    return e[t]
                }
                a.keys = function() {
                    return Object.keys(e)
                }, a.resolve = i, t.exports = a, a.id = 8695
            },
            643: function(t, o, n) {
                var e = {
                    "./modalController.js": "9933"
                };

                function a(t) {
                    return n(i(t))
                }

                function i(t) {
                    if (!n.o(e, t)) {
                        var o = Error("Cannot find module '" + t + "'");
                        throw o.code = "MODULE_NOT_FOUND", o
                    }
                    return e[t]
                }
                a.keys = function() {
                    return Object.keys(e)
                }, a.resolve = i, t.exports = a, a.id = 643
            },
            1866: function(t, o, n) {
                var e = {
                    "./modalService.js": "5655",
                    "./modalStringService.js": "5372"
                };

                function a(t) {
                    return n(i(t))
                }

                function i(t) {
                    if (!n.o(e, t)) {
                        var o = Error("Cannot find module '" + t + "'");
                        throw o.code = "MODULE_NOT_FOUND", o
                    }
                    return e[t]
                }
                a.keys = function() {
                    return Object.keys(e)
                }, a.resolve = i, t.exports = a, a.id = 1866
            },
            7399: function(t, o, n) {
                var e = {
                    "./controllers/templates/commonModal.html": "2823"
                };

                function a(t) {
                    return n(i(t))
                }

                function i(t) {
                    if (!n.o(e, t)) {
                        var o = Error("Cannot find module '" + t + "'");
                        throw o.code = "MODULE_NOT_FOUND", o
                    }
                    return e[t]
                }
                a.keys = function() {
                    return Object.keys(e)
                }, a.resolve = i, t.exports = a, a.id = 7399
            },
            1182: function(t, o, n) {
                var e = {
                    "./toastDirective.js": "5375"
                };

                function a(t) {
                    return n(i(t))
                }

                function i(t) {
                    if (!n.o(e, t)) {
                        var o = Error("Cannot find module '" + t + "'");
                        throw o.code = "MODULE_NOT_FOUND", o
                    }
                    return e[t]
                }
                a.keys = function() {
                    return Object.keys(e)
                }, a.resolve = i, t.exports = a, a.id = 1182
            },
            2841: function(t, o, n) {
                var e = {
                    "./directives/templates/toast.html": "8083"
                };

                function a(t) {
                    return n(i(t))
                }

                function i(t) {
                    if (!n.o(e, t)) {
                        var o = Error("Cannot find module '" + t + "'");
                        throw o.code = "MODULE_NOT_FOUND", o
                    }
                    return e[t]
                }
                a.keys = function() {
                    return Object.keys(e)
                }, a.resolve = i, t.exports = a, a.id = 2841
            },
            4768: function(t, o, n) {
                var e = {
                    "./verticalMenuDirective.js": "7645"
                };

                function a(t) {
                    return n(i(t))
                }

                function i(t) {
                    if (!n.o(e, t)) {
                        var o = Error("Cannot find module '" + t + "'");
                        throw o.code = "MODULE_NOT_FOUND", o
                    }
                    return e[t]
                }
                a.keys = function() {
                    return Object.keys(e)
                }, a.resolve = i, t.exports = a, a.id = 4768
            },
            476: function(t) {
                t.exports = '<span class="limited-icon-container"> <span class="icon-shop-limited" ng-hide="layoutOptions.isIconDisabled"> </span> <span class="limited-number-container" ng-show="layoutOptions.isUnique"> <span class="font-caption-header">#</span> <span class="font-caption-header text-subheader limited-number" ng-show="layoutOptions.isLimitedNumberShown" ng-bind="layoutOptions.limitedNumber"></span> </span></span> '
            },
            2823: function(t) {
                t.exports = '<div> <div class="modal-header"> <button type="button" class="close" ng-show="modalData.closeButtonShow" ng-click="dismiss()" title="close"> <span class="icon-close"></span> </button> <div class="modal-title"> <span ng-if="modalData.titleIcon && modalData.titleIcon.length > 0" ng-class="modalData.titleIcon"></span> <h4 ng-bind="modalData.titleText"></h4> </div> </div> <div class="modal-body"> <p ng-if="modalData.bodyText" class="body-text text-description" ng-bind="modalData.bodyText"></p> <p ng-if="modalData.bodyHtmlUnsafe" class="body-text text-description" ng-bind-html="modalData.bodyHtmlUnsafe"></p> <div class="img-container modal-image-container" ng-show="modalData.imageUrl && modalData.imageUrl.length > 0"> <img class="modal-thumb" ng-src="{{modalData.imageUrl}}"/> </div> </div> <div class="modal-buttons"> <button type="submit" ng-attr-id="{{modalData.actionButtonId}}" class="modal-button" ng-class="modalData.actionButtonClass" ng-if="modalData.actionButtonShow" ng-click="close(true)" ng-bind="modalData.actionButtonText"></button> <button type="button" class="modal-button" ng-class="modalData.neutralButtonClass" ng-if="modalData.neutralButtonShow" ng-click="dismiss()" ng-bind="modalData.neutralButtonText"></button> </div> <div class="modal-footer" ng-if="modalData.footerText && modalData.footerText.length > 0"> <div class="text-footer" ng-bind="modalData.footerText"></div> </div> <div class="modal-footer" ng-if="modalData.footerHtmlUnsafe && modalData.footerHtmlUnsafe.length > 0"> <div class="text-footer" ng-bind-html="modalData.footerHtmlUnsafe"></div> </div> </div> '
            },
            8083: function(t) {
                t.exports = '<div class="toast-container" ng-show="layout.isEnabled" ng-class="{\'toast-visible\': layout.isVisible}"> <div class="toast-content"> <span ng-bind="layout.text"></span> </div> </div> '
            },
            7409: function(t, o, n) {
                "use strict";
                n.r(o);
                var e = n(7935);

                function a(t, o, n, e) {
                    return {
                        link: function(a, i, r) {
                            o = angular.element(o), c = 0, null != r.infiniteScrollDistance && a.$watch(r.infiniteScrollDistance, function(t) {
                                return c = parseInt(t, 10)
                            });
                            var l, s, c, u, d, f = !0;
                            return u = !0, l = !1, null != r.infiniteScrollDisabled && a.$watch(r.infiniteScrollDisabled, function(t) {
                                if ((u = !t) && l) return l = !1, s()
                            }), s = function() {
                                var n, e;
                                return !!f && ((e = o.height() + o.scrollTop(), (n = i.offset().top + i.height() - e <= o.height() * c) && u) ? t.$$phase ? a.$eval(r.infiniteScroll) : a.$apply(r.infiniteScroll) : n ? l = !0 : void 0)
                            }, null !== r.infiniteScrollAlwaysDisabled && (d = a.$watch(function() {
                                return e(r.infiniteScrollAlwaysDisabled)(a)
                            }, function(t) {
                                null != t && (f = !t)
                            })), o.on("scroll", s), a.$on("manualInfiniteScrollCheck", s), a.$on("$destroy", function() {
                                return d && d(), o.off("scroll", s)
                            }), n(function() {
                                return r.infiniteScrollImmediateCheck && a.$eval(r.infiniteScrollImmediateCheck), s()
                            }, 0)
                        }
                    }
                }
                a.$inject = ["$rootScope", "$window", "$timeout", "$parse"], e.A.directive("infiniteScroll", a), o.default = a
            },
            7935: function(t, o, n) {
                "use strict";
                var e = n(8192);
                o.A = n.n(e)().module("infiniteScroll", [])
            },
            9439: function(t, o, n) {
                "use strict";

                function e() {
                    return {
                        restrict: "A",
                        replace: !0,
                        scope: {
                            layoutOptions: "=layoutOptions"
                        },
                        templateUrl: "limited-icon-container"
                    }
                }
                n.r(o), n(4583).A.directive("limitedIcon", e), o.default = e
            },
            4583: function(t, o, n) {
                "use strict";
                var e = n(8192);
                o.A = n.n(e)().module("limitedIcon", ["limitedIconTemplate"])
            },
            3291: function(t, o, n) {
                "use strict";
                n.r(o);
                var e = n(5567),
                    a = {
                        params: {
                            titleText: "",
                            titleIcon: "",
                            bodyText: "",
                            bodyHtmlUnsafe: "",
                            footerText: "",
                            footerHtmlUnsafe: "",
                            imageUrl: "",
                            actionButtonShow: !1,
                            actionButtonClass: "btn-secondary-md",
                            actionButtonId: "modal-action-button",
                            neutralButtonShow: !0,
                            neutralButtonClass: "btn-control-md",
                            closeButtonShow: !0,
                            cssClass: "modal-window"
                        },
                        defaults: {
                            keyboard: !0,
                            animation: !1
                        },
                        commonTemplateUrl: "common-modal",
                        commonController: "modalController",
                        layoutParams: {
                            modalSelector: ".modal",
                            modalContentClass: "modal-content"
                        },
                        backdropStatus: {
                            static: "static"
                        },
                        userInteraction: {
                            mouseDown: "mousedown"
                        },
                        mainButtonPressed: 0
                    };
                e.A.constant("modalOptions", a), o.default = a
            },
            9933: function(t, o, n) {
                "use strict";
                n.r(o);
                var e = n(5567);

                function a(t, o, n, e, a, i) {
                    o.modalData = a, o.closeActions = i.closeActions, o.close = function(t) {
                        e.close(t)
                    }, o.dismiss = function() {
                        e.dismiss("dismissed")
                    }
                }
                a.$inject = ["$log", "$scope", "$sce", "$uibModalInstance", "modalData", "modalService"], e.A.controller("modalController", a), o.default = a
            },
            5567: function(t, o, n) {
                "use strict";
                n.d(o, {
                    A: function() {
                        return l
                    }
                });
                var e = window.Roblox["core-scripts"].intl.translation,
                    a = n(8192),
                    i = n.n(a),
                    r = function(t, o) {
                        return !!t.classList.contains(o) || !!t.parentElement && r(t.parentElement, o)
                    },
                    l = i().module("modal", ["ui.bootstrap", "modalHtmlTemplate"]).config(["$uibModalProvider", "$injector", function(t, o) {
                        t.options.openedClass = "modal-open-noscroll", t.options.animation = !1;
                        var n = o.get("languageResourceProvider"),
                            a = new e.TranslationResourceProvider().getTranslationResource("CommonUI.Controls");
                        n.setTranslationResources([a])
                    }]).run(["modalOptions", "$uibModalStack", "$rootScope", function(t, o, n) {
                        var e = n.$watch(function() {
                            return document.querySelectorAll(t.layoutParams.modalSelector).length
                        }, function(n) {
                            n > 0 && (window.NodeList && !NodeList.prototype.forEach && (NodeList.prototype.forEach = Array.prototype.forEach), document.querySelectorAll(t.layoutParams.modalSelector).forEach(function(n) {
                                var e = o.getTop();
                                e && e.value.backdrop !== t.backdropStatus.static && n.addEventListener(t.userInteraction.mouseDown, function(n) {
                                    r(n.target, t.layoutParams.modalContentClass) ? n.stopPropagation() : n.button === t.mainButtonPressed && o.getTop().key && o.getTop().key.dismiss()
                                })
                            }), o.getTop() && (o.getTop().value.backdrop = t.backdropStatus.static))
                        });
                        n.$on("$destroy", function() {
                            e()
                        })
                    }])
            },
            5655: function(t, o, n) {
                "use strict";
                n.r(o);
                var e = n(8192),
                    a = n.n(e),
                    i = n(5567);

                function r(t, o, n) {
                    var e = a().extend({}, n.params, o.params);
                    return {
                        open: function(n) {
                            var i = a().extend({}, e, n),
                                r = t.open({
                                    templateUrl: o.commonTemplateUrl,
                                    controller: o.commonController,
                                    windowClass: i.cssClass || "",
                                    animation: i.animation || o.defaults.animation,
                                    keyboard: i.keyboard || o.defaults.keyboard,
                                    backdrop: !!i.closeButtonShow || "static",
                                    openedClass: i.openedClass || "modal-open-noscroll",
                                    resolve: {
                                        modalData: i
                                    }
                                });
                            return r.result.then(a().noop, a().noop), r
                        }
                    }
                }
                r.$inject = ["$uibModal", "modalOptions", "modalStringService"], i.A.service("modalService", r), o.default = r
            },
            5372: function(t, o, n) {
                "use strict";
                n.r(o);
                var e = n(5567);

                function a(t) {
                    return {
                        params: {
                            actionButtonText: t.get("Action.Yes"),
                            neutralButtonText: t.get("Action.OK")
                        }
                    }
                }
                a.$inject = ["languageResource"], e.A.service("modalStringService", a), o.default = a
            },
            5375: function(t, o, n) {
                "use strict";
                n.r(o);
                var e = n(1319);

                function a(t) {
                    return {
                        restrict: "A",
                        replace: !0,
                        scope: {
                            toastLayout: "="
                        },
                        templateUrl: "toast",
                        link: function(o, n, e) {
                            o.layout = {
                                isEnabled: !1,
                                isVisible: !1,
                                isNeeded: !1,
                                text: "",
                                timeout: null,
                                animationDuration: 200,
                                visibilityDelay: 50
                            }, o.$watch("toastLayout.isNeeded", function(n, e) {
                                n !== e && n && !o.layout.timeout && (o.layout.text = o.toastLayout.text, o.layout.isEnabled = n, o.toastLayout.isNeeded = !1, t(function() {
                                    o.layout.isVisible = !0
                                }, o.layout.visibilityDelay), o.layout.timeout = t(function() {
                                    o.layout.isVisible = !1, t(function() {
                                        o.layout.isEnabled = !1, o.layout.timeout = null, o.toastLayout.isNeeded = !1
                                    }, o.layout.animationDuration)
                                }, o.toastLayout.timeout), o.toastLayout.isNeeded = !1)
                            }, !0)
                        }
                    }
                }
                a.$inject = ["$timeout"], e.A.directive("toast", a), o.default = a
            },
            1319: function(t, o, n) {
                "use strict";
                var e = n(8192);
                o.A = n.n(e)().module("toast", ["toastHtmlTemplate"])
            },
            7645: function(t, o, n) {
                "use strict";

                function e() {
                    return {
                        restrict: "A",
                        link: function(t, o, n) {
                            var e = t.$watch(n.resetVerticalMenu, function() {
                                window.Roblox.BootstrapWidgets.SetupVerticalMenu()
                            });
                            t.$on("$destroy", function() {
                                e && e()
                            })
                        }
                    }
                }
                n.r(o), n(9295).A.directive("verticalMenu", e), o.default = e
            },
            9295: function(t, o, n) {
                "use strict";
                var e = n(8192);
                o.A = n.n(e)().module("verticalMenu", [])
            },
            8192: function(t) {
                "use strict";
                t.exports = window.angular
            }
        },
        o = {};

    function n(e) {
        var a = o[e];
        if (void 0 !== a) return a.exports;
        var i = o[e] = {
            exports: {}
        };
        return t[e](i, i.exports, n), i.exports
    }
    n.m = t, n.n = function(t) {
            var o = t && t.__esModule ? function() {
                return t.default
            } : function() {
                return t
            };
            return n.d(o, {
                a: o
            }), o
        }, n.d = function(t, o) {
            for (var e in o) n.o(o, e) && !n.o(t, e) && Object.defineProperty(t, e, {
                enumerable: !0,
                get: o[e]
            })
        }, n.o = function(t, o) {
            return Object.prototype.hasOwnProperty.call(t, o)
        }, n.r = function(t) {
            "u" > typeof Symbol && Symbol.toStringTag && Object.defineProperty(t, Symbol.toStringTag, {
                value: "Module"
            }), Object.defineProperty(t, "__esModule", {
                value: !0
            })
        }, n.rv = function() {
            return "1.7.12"
        }, n.ruid = "bundler=rspack@1.7.12",
        function() {
            "use strict";
            var t = n(8192),
                o = n.n(t),
                e = function(t) {
                    return t.replace(/([a-z])([A-Z])/g, "$1-$2").toLowerCase()
                },
                a = function(t) {
                    return t.split("/").pop().replace(".html", "")
                },
                i = function(t) {
                    t.keys().forEach(t)
                },
                r = function(t, o, n, i) {
                    return t.module(o, []).run(["$templateCache", function(t) {
                        n && n.keys().forEach(function(o) {
                            var i = e(a(o));
                            t.put(i, n(o))
                        }), i && i.keys().forEach(function(o) {
                            var n = e(a(o));
                            t.put(n, i(o).replace(/<\/?script[^>]*>/gi, ""))
                        })
                    }])
                };
            n(1319), n(7935), n(9295), n(5567), n(4583), i(n(1182));
            var l = n(2841);
            r(o(), "toastHtmlTemplate", l), i(n(4688)), i(n(4768)), i(n(8695)), i(n(643)), i(n(1866));
            var s = n(7399);
            r(o(), "modalHtmlTemplate", s), i(n(1197));
            var c = n(7605);
            r(o(), "limitedIconTemplate", c)
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("StyleGuide");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/styleGuide-d3d2a8e6693faad0.js.map