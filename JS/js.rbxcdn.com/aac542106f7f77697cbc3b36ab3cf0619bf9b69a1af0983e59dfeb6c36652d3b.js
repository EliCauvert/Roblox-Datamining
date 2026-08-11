! function(n) {
    var r = {};

    function a(e) {
        if (r[e]) return r[e].exports;
        var t = r[e] = {
            i: e,
            l: !1,
            exports: {}
        };
        return n[e].call(t.exports, t, t.exports, a), t.l = !0, t.exports
    }
    a.m = n, a.c = r, a.d = function(e, t, n) {
        a.o(e, t) || Object.defineProperty(e, t, {
            enumerable: !0,
            get: n
        })
    }, a.r = function(e) {
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, a.t = function(t, e) {
        if (1 & e && (t = a(t)), 8 & e) return t;
        if (4 & e && "object" == typeof t && t && t.__esModule) return t;
        var n = Object.create(null);
        if (a.r(n), Object.defineProperty(n, "default", {
                enumerable: !0,
                value: t
            }), 2 & e && "string" != typeof t)
            for (var r in t) a.d(n, r, function(e) {
                return t[e]
            }.bind(null, r));
        return n
    }, a.n = function(e) {
        var t = e && e.__esModule ? function() {
            return e.default
        } : function() {
            return e
        };
        return a.d(t, "a", t), t
    }, a.o = function(e, t) {
        return Object.prototype.hasOwnProperty.call(e, t)
    }, a.p = "", a(a.s = 131)
}({
    131: function(e, t, n) {
        "use strict";
        n.r(t);
        var r = n(2),
            a = n.n(r),
            o = n(4),
            s = n(35);
        Object(o.importFilesUnderPath)(n(132)), Object(o.importFilesUnderPath)(n(134));
        var i = n(136);
        Object(o.templateCacheGenerator)(a.a, "systemFeedbackHtmlTemplate", i), t.default = s.a
    },
    132: function(e, t, n) {
        var r = {
            "./systemFeedbackComponent.js": 133
        };

        function a(e) {
            var t = o(e);
            return n(t)
        }

        function o(e) {
            var t = r[e];
            if (t + 1) return t;
            var n = new Error("Cannot find module '" + e + "'");
            throw n.code = "MODULE_NOT_FOUND", n
        }
        a.keys = function() {
            return Object.keys(r)
        }, a.resolve = o, (e.exports = a).id = 132
    },
    133: function(e, t, n) {
        "use strict";
        n.r(t);
        var r = {
            templateUrl: "system-feedback-v2",
            bindings: {
                successMessage: "<",
                loadingMessage: "<",
                warningMessage: "<",
                timeoutShow: "<",
                timeoutHide: "<"
            },
            controller: ["systemFeedbackService", function(t) {
                var n = this,
                    e = this;
                e.$onInit = function() {
                    var e = t.getBindings();
                    n.params = e.params, n.closeBanner = e.closeBanner
                }, e.$onChanges = function() {
                    t.setDefaultConfig({
                        successMessage: e.successMessage,
                        loadingMessage: e.loadingMessage,
                        warningMessage: e.warningMessage,
                        timeoutShow: e.timeoutShow,
                        timeoutHide: e.timeoutHide,
                        isHtmlAllowed: e.isHtmlAllowed
                    })
                }
            }]
        };
        n(35).a.component("systemFeedback", r), t.default = r
    },
    134: function(e, t, n) {
        var r = {
            "./systemFeedbackService.js": 135
        };

        function a(e) {
            var t = o(e);
            return n(t)
        }

        function o(e) {
            var t = r[e];
            if (t + 1) return t;
            var n = new Error("Cannot find module '" + e + "'");
            throw n.code = "MODULE_NOT_FOUND", n
        }
        a.keys = function() {
            return Object.keys(r)
        }, a.resolve = o, (e.exports = a).id = 134
    },
    135: function(e, t, n) {
        "use strict";
        n.r(t);
        var r = n(2),
            l = n.n(r),
            a = n(35);

        function o(n) {
            function a(e, t, n, r, a, o) {
                return {
                    params: {
                        bannerText: function(e, t) {
                            if (l.a.isString(e)) return e;
                            switch (t) {
                                case s.SUCCESS:
                                    return u.successMessage;
                                case s.WARNING:
                                    return u.warningMessage;
                                case s.LOADING:
                                default:
                                    return u.loadingMessage
                            }
                        }(e, r),
                        bannerType: r,
                        showCloseButton: a,
                        isHtmlAllowed: o
                    },
                    timeouts: function(e, t, n, r) {
                        var a = {
                            timeoutShow: l.a.isNumber(t) ? t : u.timeoutShow
                        };
                        return l.a.isNumber(n) ? a.timeoutHide = n : r !== s.WARNING && (e && l.a.isString(e) ? a.timeoutHide = Math.min(1e4, 1e3 + 300 * e.split(/(\s+)/).length) : a.timeoutHide = u.timeoutHide), a
                    }(e, t, n, r)
                }
            }

            function r() {
                c.showBanner = !1
            }

            function o(e) {
                r(), l.a.extend(c, e.params);
                var t = e.timeouts;
                n(function() {
                    c.showBanner = !0, t.timeoutHide && n(r, t.timeoutHide)
                }, t.timeoutShow)
            }
            var s = {
                    LOADING: "alert-loading",
                    SUCCESS: "alert-success",
                    WARNING: "alert-warning"
                },
                i = {
                    strType: ["successMessage", "loadingMessage", "warningMessage"],
                    numType: ["timeoutShow", "timeoutHide"],
                    boolTypes: ["isHtmlAllowed"]
                },
                u = {
                    successMessage: "",
                    loadingMessage: "",
                    warningMessage: "",
                    timeoutShow: 200,
                    timeoutHide: 2e3,
                    isHtmlAllowed: !1
                },
                c = {
                    bannerType: "",
                    bannerText: "",
                    showBanner: !1,
                    showCloseButton: !1
                };
            return {
                bannerTypes: s,
                setDefaultConfig: function(e) {
                    var t = function(n) {
                        var r = {};
                        return i.strType.forEach(function(e) {
                            var t = n[e];
                            l.a.isString(t) && (r[e] = t)
                        }), i.numType.forEach(function(e) {
                            var t = n[e];
                            l.a.isNumber(t) && (r[e] = t)
                        }), i.boolTypes.forEach(function(e) {
                            var t = n[e];
                            "boolean" == typeof t && (r[e] = t)
                        }), r
                    }(e);
                    l.a.extend(u, t)
                },
                getDefaultConfig: function() {
                    return u
                },
                getBindings: function() {
                    return {
                        params: c,
                        closeBanner: r
                    }
                },
                loading: function(e, t, n) {
                    var r = a(e, t, n, s.LOADING, !1);
                    o(r)
                },
                success: function(e, t, n) {
                    var r = a(e, t, n, s.SUCCESS, !1);
                    o(r)
                },
                warning: function(e, t, n) {
                    var r = a(e, t, n, s.WARNING, !0);
                    o(r)
                },
                clear: function() {
                    n(r())
                },
                openBanner: function(e, t) {
                    var n = a(e, t.timeoutShow, t.timeoutHide, t.type, t.type === s.WARNING, t.isHtmlAllowed);
                    o(n)
                }
            }
        }
        o.$inject = ["$timeout"], a.a.factory("systemFeedbackService", o), t.default = o
    },
    136: function(e, t, n) {
        var r = {
            "./components/templates/systemFeedbackV2.html": 137
        };

        function a(e) {
            var t = o(e);
            return n(t)
        }

        function o(e) {
            var t = r[e];
            if (t + 1) return t;
            var n = new Error("Cannot find module '" + e + "'");
            throw n.code = "MODULE_NOT_FOUND", n
        }
        a.keys = function() {
            return Object.keys(r)
        }, a.resolve = o, (e.exports = a).id = 136
    },
    137: function(e, t) {
        e.exports = '<div class="sg-system-feedback"> <div class="alert-system-feedback"> <div class="alert {{ $ctrl.params.bannerType }}" ng-class="{ on: $ctrl.params.showBanner }"> <span class="alert-content" ng-bind="$ctrl.params.bannerText" ng-if="!$ctrl.params.isHtmlAllowed"></span><span class="alert-content" ng-bind-html="$ctrl.params.bannerText" ng-if="$ctrl.params.isHtmlAllowed"></span> <span class="icon-close-white" ng-if="$ctrl.params.showCloseButton" ng-click="$ctrl.closeBanner()"></span> </div> </div> </div> '
    },
    2: function(e, t) {
        e.exports = angular
    },
    35: function(e, t, n) {
        "use strict";
        var r = n(2),
            a = n.n(r).a.module("systemFeedback", ["systemFeedbackHtmlTemplate"]);
        t.a = a
    },
    4: function(e, t) {
        function o(e) {
            return e.replace(/([a-z])([A-Z])/g, "$1-$2").toLowerCase()
        }

        function s(e) {
            return e.split("/").pop().replace(".html", "")
        }
        var n = {
            importFilesUnderPath: function(e) {
                e.keys().forEach(e)
            },
            templateCacheGenerator: function(e, t, r, a) {
                return e.module(t, []).run(["$templateCache", function(n) {
                    r && r.keys().forEach(function(e) {
                        var t = o(s(e));
                        n.put(t, r(e))
                    }), a && a.keys().forEach(function(e) {
                        var t = o(s(e));
                        n.put(t, function(e) {
                            return e.replace(/<\/?script[^>]*>/gi, "")
                        }(a(e)))
                    })
                }])
            }
        };
        e.exports = n
    }
});
//# sourceMappingURL=https://jsak.rbxcdn.com/5b08fd290334d312691f-systemFeedback.js.map

/* Bundle detector */
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("SystemFeedback");