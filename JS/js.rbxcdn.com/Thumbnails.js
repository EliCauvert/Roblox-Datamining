! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "02220508c7dd2a90a68a06e6b236b1105b0085fe"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "480de942-6170-44af-9f48-4a76add27552", e._sentryDebugIdIdentifier = "sentry-dbid-480de942-6170-44af-9f48-4a76add27552")
    } catch (e) {}
}(),
function() {
    var e = {
            545: function(e, t, n) {
                var r = {
                    "./2dThumbnailComponent.js": "175"
                };

                function o(e) {
                    return n(i(e))
                }

                function i(e) {
                    if (!n.o(r, e)) {
                        var t = Error("Cannot find module '" + e + "'");
                        throw t.code = "MODULE_NOT_FOUND", t
                    }
                    return r[e]
                }
                o.keys = function() {
                    return Object.keys(r)
                }, o.resolve = i, e.exports = o, o.id = 545
            },
            966: function(e, t, n) {
                var r = {
                    "./thumbnailConstants.js": "300"
                };

                function o(e) {
                    return n(i(e))
                }

                function i(e) {
                    if (!n.o(r, e)) {
                        var t = Error("Cannot find module '" + e + "'");
                        throw t.code = "MODULE_NOT_FOUND", t
                    }
                    return r[e]
                }
                o.keys = function() {
                    return Object.keys(r)
                }, o.resolve = i, e.exports = o, o.id = 966
            },
            254: function(e, t, n) {
                var r = {
                    "./2dThumbnailController.js": "495"
                };

                function o(e) {
                    return n(i(e))
                }

                function i(e) {
                    if (!n.o(r, e)) {
                        var t = Error("Cannot find module '" + e + "'");
                        throw t.code = "MODULE_NOT_FOUND", t
                    }
                    return r[e]
                }
                o.keys = function() {
                    return Object.keys(r)
                }, o.resolve = i, e.exports = o, o.id = 254
            },
            771: function(e, t, n) {
                var r = {
                    "./imageLoadDirective.js": "694",
                    "./thumbnailErrorDirective.js": "137"
                };

                function o(e) {
                    return n(i(e))
                }

                function i(e) {
                    if (!n.o(r, e)) {
                        var t = Error("Cannot find module '" + e + "'");
                        throw t.code = "MODULE_NOT_FOUND", t
                    }
                    return r[e]
                }
                o.keys = function() {
                    return Object.keys(r)
                }, o.resolve = i, e.exports = o, o.id = 771
            },
            185: function(e, t, n) {
                var r = {
                    "./thumbnailService.js": "829"
                };

                function o(e) {
                    return n(i(e))
                }

                function i(e) {
                    if (!n.o(r, e)) {
                        var t = Error("Cannot find module '" + e + "'");
                        throw t.code = "MODULE_NOT_FOUND", t
                    }
                    return r[e]
                }
                o.keys = function() {
                    return Object.keys(r)
                }, o.resolve = i, e.exports = o, o.id = 185
            },
            902: function(e, t, n) {
                var r = {
                    "./components/templates/2dThumbnail.html": "145"
                };

                function o(e) {
                    return n(i(e))
                }

                function i(e) {
                    if (!n.o(r, e)) {
                        var t = Error("Cannot find module '" + e + "'");
                        throw t.code = "MODULE_NOT_FOUND", t
                    }
                    return r[e]
                }
                o.keys = function() {
                    return Object.keys(r)
                }, o.resolve = i, e.exports = o, o.id = 902
            },
            145: function(e) {
                e.exports = '<span ng-class="$ctrl.getCssClasses()" class="thumbnail-2d-container" thumbnail-type="{{ $ctrl.thumbnailType }}" thumbnail-target-id="{{ $ctrl.thumbnailTargetId }}"> <img ng-if="$ctrl.thumbnailUrl && !$ctrl.isLazyLoadingEnabled()" ng-src="{{ $ctrl.thumbnailUrl }}" thumbnail-error="$ctrl.setThumbnailLoadFailed" ng-class="{\'loading\': $ctrl.thumbnailUrl && !isLoaded }" image-load alt="{{$ctrl.altName}}" title="{{$ctrl.altName}}"/> <img ng-if="$ctrl.thumbnailUrl && $ctrl.isLazyLoadingEnabled()" lazy-img="{{ $ctrl.thumbnailUrl }}" thumbnail-error="$ctrl.setThumbnailLoadFailed"/> </span> '
            },
            175: function(e, t, n) {
                "use strict";
                n.r(t);
                var r = n(134),
                    o = {
                        templateUrl: "2d-thumbnail",
                        bindings: {
                            thumbnailType: "<",
                            thumbnailTargetId: "<",
                            thumbnailOptions: "<?",
                            onSuccess: "<",
                            onFailure: "<",
                            altName: "<"
                        },
                        controller: "2dThumbnailController"
                    };
                r.A.component("thumbnail2d", o), t.default = o
            },
            300: function(e, t, n) {
                "use strict";
                n.r(t);
                var r = n(954),
                    o = n(134),
                    i = {
                        thumbnailTypes: r.uS,
                        thumbnailStates: r.xc,
                        formats: r.Ul,
                        avatarHeadshotSize: r.jZ,
                        gameIconSize: r.fP,
                        thumbnailAvatarsSize: r.qh
                    };
                o.A.constant("thumbnailConstants", i), t.default = i
            },
            495: function(e, t, n) {
                "use strict";
                n.r(t);
                var r = n(932),
                    o = n(954),
                    i = n(134);

                function a(e, t) {
                    var n = this,
                        i = "",
                        a = o.xc;
                    n.getCssClasses = function() {
                        return n.isThumbnailRequestSending ? "shimmer" : t.getCssClass(n.thumbnailState)
                    }, n.setThumbnailLoadFailed = function() {}, n.isLazyLoadingEnabled = function() {
                        return n.thumbnailOptions && n.thumbnailOptions.isLazyLoading
                    }, n.updateImageLoadMetrics = function(e) {
                        var t = e - n.startTime,
                            o = n.performance.retryAttempts;
                        (0, r.l)("ThumbnailLoadDurationWebapp", {
                            Status: "Success",
                            ThumbnailType: "".concat(n.thumbnailType, "_2d"),
                            Version: n.version,
                            Value: t.toString()
                        }), o ? (0, r.l)("ThumbnailRetryWebapp", {
                            ThumbnailType: "".concat(n.thumbnailType, "_2d"),
                            Version: n.version,
                            Value: o.toString()
                        }).catch(function(e) {
                            console.error(e)
                        }) : (0, r.l)("ThumbnailNoRetrySuccessWebapp", {
                            ThumbnailType: "".concat(n.thumbnailType, "_2d"),
                            Version: n.version
                        }).catch(function(e) {
                            console.error(e)
                        })
                    };
                    var u = function() {
                        var e, r, u, c = "".concat(n.thumbnailType, ":").concat(n.thumbnailTargetId);
                        if (n.startTime = new Date().getTime(), i !== c) {
                            i = c, n.thumbnailState = a.loading;
                            var l = (null == (e = n.thumbnailOptions) ? void 0 : e.size) || o.F5,
                                s = (null == (r = n.thumbnailOptions) ? void 0 : r.format) || o.R2,
                                f = null == (u = n.thumbnailOptions) ? void 0 : u.includeProfileFrame;
                            n.isThumbnailRequestSending = !0, t.getThumbnailImage(n.thumbnailType, n.thumbnailTargetId, l, s, f).then(function(e) {
                                var t = e.thumbnail,
                                    r = t.state,
                                    o = t.imageUrl,
                                    i = t.version,
                                    a = e.performance;
                                n.thumbnailState = r, n.thumbnailUrl = o, n.performance = a, n.version = i, n.onSuccess && n.onSuccess(a)
                            }).catch(function(e) {
                                n.thumbnailState = a.error, n.onFailure && n.onFailure(e)
                            }).finally(function() {
                                n.isThumbnailRequestSending = !1
                            })
                        }
                    };
                    n.$onInit = u, n.$onChanges = u
                }
                a.$inject = ["$scope", "thumbnailService"], i.A.controller("2dThumbnailController", a), t.default = a
            },
            694: function(e, t, n) {
                "use strict";

                function r() {
                    return {
                        restrict: "A",
                        link: function(e, t) {
                            t.bind("load", function() {
                                e.$evalAsync(function() {
                                    e.$parent.$ctrl.updateImageLoadMetrics(new Date().getTime()), e.isLoaded = !0
                                })
                            })
                        }
                    }
                }
                n.r(t), n(134).A.directive("imageLoad", r), t.default = r
            },
            137: function(e, t, n) {
                "use strict";

                function r() {
                    return {
                        scope: {
                            thumbnailError: "<"
                        },
                        link: function(e, t) {
                            t.on("error", e.thumbnailError)
                        }
                    }
                }
                n.r(t), n(134).A.directive("thumbnailError", r), t.default = r
            },
            829: function(e, t, n) {
                "use strict";
                n.r(t);
                var r = n(501),
                    o = n(134);

                function i(e) {
                    return {
                        getThumbnailImage: function(t, n, o, i, a) {
                            return e(function(e, u) {
                                r.getThumbnailImage(t, o, i, n, void 0, void 0, void 0, void 0, a).then(function(t) {
                                    e(t)
                                }).catch(u)
                            })
                        },
                        getCssClass: function(e) {
                            return r.getCssClass(e)
                        },
                        reloadThumbnailImage: function(t, n, o) {
                            return e(function(e, i) {
                                r.reloadThumbnailImage(t, o, null, n).then(function(t) {
                                    e(t)
                                }).catch(i)
                            })
                        }
                    }
                }
                i.$inject = ["$q"], o.A.factory("thumbnailService", i), t.default = i
            },
            134: function(e, t, n) {
                "use strict";
                var r = n(192);
                t.A = n.n(r)().module("thumbnails", ["robloxApp", "thumbnailsTemplates", "angularLazyImg"])
            },
            839: function(e, t, n) {
                "use strict";

                function r(e, t, n, r, o, i, a) {
                    try {
                        var u = e[i](a),
                            c = u.value
                    } catch (e) {
                        n(e);
                        return
                    }
                    u.done ? t(c) : Promise.resolve(c).then(r, o)
                }

                function o(e) {
                    return function() {
                        var t = this,
                            n = arguments;
                        return new Promise(function(o, i) {
                            var a = e.apply(t, n);

                            function u(e) {
                                r(a, o, i, u, c, "next", e)
                            }

                            function c(e) {
                                r(a, o, i, u, c, "throw", e)
                            }
                            u(void 0)
                        })
                    }
                }
                n.d(t, {
                    _: function() {
                        return o
                    }
                })
            },
            474: function(e, t, n) {
                "use strict";

                function r(e, t) {
                    if (null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !t[Symbol.hasInstance](e) : !(e instanceof t)) throw TypeError("Cannot call a class as a function")
                }
                n.d(t, {
                    _: function() {
                        return r
                    }
                })
            },
            374: function(e, t, n) {
                "use strict";

                function r(e, t) {
                    for (var n = 0; n < t.length; n++) {
                        var r = t[n];
                        r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
                    }
                }

                function o(e, t, n) {
                    return t && r(e.prototype, t), n && r(e, n), e
                }
                n.d(t, {
                    _: function() {
                        return o
                    }
                })
            },
            528: function(e, t, n) {
                "use strict";

                function r(e, t, n) {
                    return t in e ? Object.defineProperty(e, t, {
                        value: n,
                        enumerable: !0,
                        configurable: !0,
                        writable: !0
                    }) : e[t] = n, e
                }
                n.d(t, {
                    _: function() {
                        return r
                    }
                })
            },
            842: function(e, t, n) {
                "use strict";
                n.d(t, {
                    _: function() {
                        return o
                    }
                });
                var r = n(528);

                function o(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var n = null != arguments[t] ? arguments[t] : {},
                            o = Object.keys(n);
                        "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                            return Object.getOwnPropertyDescriptor(n, e).enumerable
                        }))), o.forEach(function(t) {
                            (0, r._)(e, t, n[t])
                        })
                    }
                    return e
                }
            },
            807: function(e, t, n) {
                "use strict";

                function r(e, t) {
                    return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                        var t = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var n = Object.getOwnPropertySymbols(e);
                            t.push.apply(t, n)
                        }
                        return t
                    })(Object(t)).forEach(function(n) {
                        Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                    }), e
                }
                n.d(t, {
                    _: function() {
                        return r
                    }
                })
            },
            246: function(e, t, n) {
                "use strict";

                function r(e, t) {
                    if (null == e) return {};
                    var n, r, o, i = {};
                    if ("u" > typeof Reflect && Reflect.ownKeys) {
                        for (o = 0, n = Reflect.ownKeys(Object(e)); o < n.length; o++) r = n[o], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                        return i
                    }
                    if (i = function(e, t) {
                            if (null == e) return {};
                            var n, r, o = {},
                                i = Object.getOwnPropertyNames(e);
                            for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                            return o
                        }(e, t), Object.getOwnPropertySymbols)
                        for (o = 0, n = Object.getOwnPropertySymbols(e); o < n.length; o++) r = n[o], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                    return i
                }
                n.d(t, {
                    _: function() {
                        return r
                    }
                })
            },
            936: function(e, t, n) {
                "use strict";

                function r(e, t) {
                    (null == t || t > e.length) && (t = e.length);
                    for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                    return r
                }

                function o(e, t) {
                    return function(e) {
                        if (Array.isArray(e)) return e
                    }(e) || function(e, t) {
                        var n, r, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != o) {
                            var i = [],
                                a = !0,
                                u = !1;
                            try {
                                for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), !t || i.length !== t); a = !0);
                            } catch (e) {
                                u = !0, r = e
                            } finally {
                                try {
                                    a || null == o.return || o.return()
                                } finally {
                                    if (u) throw r
                                }
                            }
                            return i
                        }
                    }(e, t) || function(e, t) {
                        if (e) {
                            if ("string" == typeof e) return r(e, t);
                            var n = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                            if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return r(e, t)
                        }
                    }(e, t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()
                }
                n.d(t, {
                    _: function() {
                        return o
                    }
                })
            },
            386: function(e, t, n) {
                "use strict";

                function r(e, t) {
                    var n, r, o, i = {
                            label: 0,
                            sent: function() {
                                if (1 & o[0]) throw o[1];
                                return o[1]
                            },
                            trys: [],
                            ops: []
                        },
                        a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                        u = Object.defineProperty;
                    return u(a, "next", {
                        value: c(0)
                    }), u(a, "throw", {
                        value: c(1)
                    }), u(a, "return", {
                        value: c(2)
                    }), "function" == typeof Symbol && u(a, Symbol.iterator, {
                        value: function() {
                            return this
                        }
                    }), a;

                    function c(u) {
                        return function(c) {
                            var l = [u, c];
                            if (n) throw TypeError("Generator is already executing.");
                            for (; a && (a = 0, l[0] && (i = 0)), i;) try {
                                if (n = 1, r && (o = 2 & l[0] ? r.return : l[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, l[1])).done) return o;
                                switch (r = 0, o && (l = [2 & l[0], o.value]), l[0]) {
                                    case 0:
                                    case 1:
                                        o = l;
                                        break;
                                    case 4:
                                        return i.label++, {
                                            value: l[1],
                                            done: !1
                                        };
                                    case 5:
                                        i.label++, r = l[1], l = [0];
                                        continue;
                                    case 7:
                                        l = i.ops.pop(), i.trys.pop();
                                        continue;
                                    default:
                                        if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                            i = 0;
                                            continue
                                        }
                                        if (3 === l[0] && (!o || l[1] > o[0] && l[1] < o[3])) {
                                            i.label = l[1];
                                            break
                                        }
                                        if (6 === l[0] && i.label < o[1]) {
                                            i.label = o[1], o = l;
                                            break
                                        }
                                        if (o && i.label < o[2]) {
                                            i.label = o[2], i.ops.push(l);
                                            break
                                        }
                                        o[2] && i.ops.pop(), i.trys.pop();
                                        continue
                                }
                                l = t.call(e, i)
                            } catch (e) {
                                l = [6, e], r = 0
                            } finally {
                                n = o = 0
                            }
                            if (5 & l[0]) throw l[1];
                            return {
                                value: l[0] ? l[1] : void 0,
                                done: !0
                            }
                        }
                    }
                }
                n.d(t, {
                    _: function() {
                        return r
                    }
                })
            },
            390: function(e) {
                function t(e) {
                    return (t = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
                        return typeof e
                    } : function(e) {
                        return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
                    })(e)
                }!
                /*!
                	Copyright (c) 2018 Jed Watson.
                	Licensed under the MIT License (MIT), see
                	http://jedwatson.github.io/classnames
                */
                function() {
                    "use strict";
                    var n = {}.hasOwnProperty;

                    function r() {
                        for (var e = "", i = 0; i < arguments.length; i++) {
                            var a = arguments[i];
                            a && (e = o(e, function(e) {
                                if ("string" == typeof e || "number" == typeof e) return e;
                                if ("object" !== t(e)) return "";
                                if (Array.isArray(e)) return r.apply(null, e);
                                if (e.toString !== Object.prototype.toString && !e.toString.toString().includes("[native code]")) return e.toString();
                                var i = "";
                                for (var a in e) n.call(e, a) && e[a] && (i = o(i, a));
                                return i
                            }(a)))
                        }
                        return e
                    }

                    function o(e, t) {
                        return t ? e ? e + " " + t : e + t : e
                    }
                    e.exports ? (r.default = r, e.exports = r) : "function" == typeof define && "object" === t(define.amd) && define.amd ? define("classnames", [], function() {
                        return r
                    }) : window.classNames = r
                }()
            },
            954: function(e, t, n) {
                "use strict";
                n.d(t, {
                    DS: function() {
                        return G
                    },
                    EX: function() {
                        return J
                    },
                    F5: function() {
                        return O
                    },
                    JF: function() {
                        return C
                    },
                    MU: function() {
                        return X
                    },
                    Mi: function() {
                        return _
                    },
                    Ou: function() {
                        return E
                    },
                    Pq: function() {
                        return w
                    },
                    R2: function() {
                        return P
                    },
                    S3: function() {
                        return U
                    },
                    SD: function() {
                        return B
                    },
                    SH: function() {
                        return L
                    },
                    TP: function() {
                        return $
                    },
                    Tm: function() {
                        return z
                    },
                    Ul: function() {
                        return N
                    },
                    XC: function() {
                        return A
                    },
                    cu: function() {
                        return V
                    },
                    dS: function() {
                        return H
                    },
                    fP: function() {
                        return R
                    },
                    jZ: function() {
                        return F
                    },
                    lo: function() {
                        return D
                    },
                    o0: function() {
                        return I
                    },
                    qh: function() {
                        return k
                    },
                    s2: function() {
                        return q
                    },
                    tb: function() {
                        return W
                    },
                    uS: function() {
                        return x
                    },
                    wu: function() {
                        return j
                    },
                    x$: function() {
                        return K
                    },
                    xc: function() {
                        return M
                    }
                });
                var r, o, i, a, u, c, l, s, f, m, d, h, b, p, v, g, y, S = n(93),
                    T = n.n(S)().thumbnailsApi,
                    w = "".concat(T, "/v1/metadata"),
                    I = ((r = {}).processFailure = "processFailure", r.unretriableFailure = "unretriableFailure", r.maxAttemptsReached = "maxAttemptsReached", r),
                    C = ((o = {}).Avatar = "Avatar", o.AvatarHeadShot = "AvatarHeadShot", o.GameIcon = "GameIcon", o.BadgeIcon = "BadgeIcon", o.GameThumbnail = "GameThumbnail", o.GamePass = "GamePass", o.Asset = "Asset", o.BundleThumbnail = "BundleThumbnail", o.Outfit = "Outfit", o.GroupIcon = "GroupIcon", o.DeveloperProduct = "DeveloperProduct", o.PlaceIcon = "PlaceIcon", o.LookThumbnail = "Look", o.Screenshot = "Screenshot", o),
                    x = ((i = {}).avatar = "Avatar", i.avatarHeadshot = "AvatarHeadshot", i.gameIcon = "GameIcon", i.gameThumbnail = "GameThumbnail", i.badgeIcon = "BadgeIcon", i.gamePassIcon = "GamePass", i.assetThumbnail = "Asset", i.bundleThumbnail = "BundleThumbnail", i.userOutfit = "Outfit", i.groupIcon = "GroupIcon", i.developerProductIcon = "DeveloperProduct", i.universeThumbnail = "UniverseThumbnail", i.universeThumbnails = "UniverseThumbnails", i.placeGameIcon = "PlaceGameIcon", i.lookThumbnail = "Look", i.screenshot = "Screenshot", i),
                    A = 100,
                    _ = ((a = {})[a.maxRetryAttempts = 10] = "maxRetryAttempts", a[a.minCooldown = 1e3] = "minCooldown", a[a.maxCooldown = 3e4] = "maxCooldown", a),
                    O = "150x150",
                    P = "webp",
                    R = ((u = {}).size50 = "50x50", u.size150 = "150x150", u.size256 = "256x256", u.size512 = "512x512", u),
                    E = ((c = {}).size150 = "150x150", c),
                    z = ((l = {}).size150 = "150x150", l.size420 = "420x420", l.size700 = "700x700", l.width256 = "256x144", l.width384 = "384x216", l.width480 = "480x270", l.width576 = "576x324", l.width768 = "768x432", l.width1320 = "1320x440", l.width660 = "660x220", l.width330 = "330x110", l.width720 = "720x228", l.width930 = "930x480", l.width1440 = "1440x456", l),
                    k = ((s = {}).size100 = "100x100", s.size352 = "352x352", s.size720 = "720x720", s),
                    F = ((f = {}).size48 = "48x48", f.size60 = "60x60", f.size150 = "150x150", f),
                    j = ((m = {}).size150 = "150x150", m.size420 = "420x420", m),
                    U = ((d = {}).size150 = "150x150", d),
                    q = ((h = {}).size150 = "150x150", h),
                    L = ((b = {}).width768 = "768x432", b.width576 = "576x324", b.width480 = "480x270", b.width384 = "384x216", b.width256 = "256x144", b),
                    D = ((p = {}).width768 = "768x432", p.width576 = "576x324", p.width480 = "480x270", p.width384 = "384x216", p.width256 = "256x144", p),
                    M = ((v = {}).error = "Error", v.complete = "Completed", v.inReview = "InReview", v.pending = "Pending", v.blocked = "Blocked", v),
                    N = ((g = {}).png = "png", g.jpg = "jpg", g.jpeg = "jpeg", g.webp = "webp", g),
                    $ = ((y = {}).PlaceHolder = "PlaceHolder", y.AutoGenerated = "AutoGenerated", y.ForceAutoGenerated = "ForceAutoGenerated", y),
                    B = "Thumbnail2DWeb",
                    G = "LoadSuccess",
                    W = "RetryLoadSuccess",
                    J = "RetryPerThumbnailType",
                    H = "Sequence",
                    V = "LoadFailure",
                    X = "Counter",
                    K = {
                        thumbnailMetricsSampleSize: 10,
                        isWebappUseCacheEnabled: !1,
                        webappCacheExpirationTimespan: "00:00:00",
                        requestMinCooldown: 1e3,
                        requestMaxCooldown: 3e3,
                        requestMaxRetryAttempts: 5,
                        requestBatchSize: 100,
                        concurrentThumbnailRequestCount: 1
                    }
            },
            932: function(e, t, n) {
                "use strict";
                n.d(t, {
                    l: function() {
                        return I
                    }
                });
                var r = n(839),
                    o = n(842),
                    i = n(246),
                    a = n(386),
                    u = n(971),
                    c = n.n(u),
                    l = n(93),
                    s = n.n(l)().beaconApi,
                    f = function(e) {
                        if (!e) return 0;
                        var t, n, r, o = e.split(":");
                        return (60 * parseInt(null != (t = o[0]) ? t : "", 10) * 60 + 60 * parseInt(null != (n = o[1]) ? n : "", 10) + parseInt(null != (r = o[2]) ? r : "", 10)) * 1e3
                    },
                    m = n(528),
                    d = n(807),
                    h = window.Roblox["core-scripts"].auth.xsrfToken,
                    b = "X-CSRF-TOKEN",
                    p = function(e, t) {
                        var n = (0, h.getToken)(),
                            r = null != t ? t : {},
                            a = r.headers,
                            u = (0, i._)(r, ["headers"]),
                            c = (0, d._)((0, o._)({}, Object.fromEntries(new Headers(a))), (0, m._)({}, b, n));
                        return fetch(e, (0, d._)((0, o._)({}, u), {
                            headers: c
                        }))
                    },
                    v = new(c()),
                    g = 0,
                    y = function() {
                        if ("u" < typeof document) return {};
                        var e, t = document.getElementsByName("performance")[0];
                        return t ? {
                            performanceMetricsBatchWaitTime: f(t.getAttribute("data-ui-performance-metrics-batch-wait-time")),
                            performanceMetricsBatchSize: parseInt(null != (e = t.getAttribute("data-ui-performance-metrics-batch-size")) ? e : "", 10)
                        } : {}
                    }(),
                    S = y.performanceMetricsBatchWaitTime,
                    T = y.performanceMetricsBatchSize,
                    w = v.createRequestProcessor(function(e) {
                        return (0, r._)(function() {
                            var t, n;
                            return (0, a._)(this, function(u) {
                                switch (u.label) {
                                    case 0:
                                        var c, l;
                                        return t = e.map(function(e) {
                                            var t = e.data,
                                                n = (t.taskId, (0, i._)(t, ["taskId"]));
                                            return (0, o._)({}, n)
                                        }), [4, (c = "".concat(s, "/v1/measurements"), l = {
                                            method: "POST",
                                            headers: {
                                                "Content-Type": "application/json"
                                            },
                                            keepalive: !0,
                                            body: JSON.stringify(t)
                                        }, (0, r._)(function() {
                                            var e, t;
                                            return (0, a._)(this, function(n) {
                                                switch (n.label) {
                                                    case 0:
                                                        return [4, p(c, l)];
                                                    case 1:
                                                        if (403 !== (e = n.sent()).status || !(t = e.headers.get(b))) return [3, 3];
                                                        return (0, h.setToken)(t), [4, p(c, l)];
                                                    case 2:
                                                        e = n.sent(), n.label = 3;
                                                    case 3:
                                                        return [2, e]
                                                }
                                            })
                                        })())];
                                    case 1:
                                        return u.sent(), n = {}, e.forEach(function(e) {
                                            n[e.key] = !0
                                        }), [2, n]
                                }
                            })
                        })()
                    }, function(e) {
                        var t, n = e.taskId;
                        return null != (t = null == n ? void 0 : n.toString()) ? t : ""
                    }, {
                        getFailureCooldown: v.createExponentialBackoffCooldown(1e3, 3e3),
                        maxRetryAttempts: 5,
                        batchSize: null != T ? T : 100,
                        processBatchWaitTime: null != S ? S : 1e3
                    }),
                    I = function(e, t) {
                        var n = g;
                        g += 1;
                        var r = {
                            metricName: e,
                            jsonData: JSON.stringify(t)
                        };
                        return w.queueItem((0, o._)({
                            taskId: n
                        }, r))
                    }
            },
            501: function(e, t, n) {
                "use strict";
                n.r(t), n.d(t, {
                    getCssClass: function() {
                        return h
                    },
                    getThumbnailImage: function() {
                        return m
                    },
                    peekThumbnailImage: function() {
                        return b
                    },
                    reloadThumbnailImage: function() {
                        return d
                    }
                });
                var r, o = n(842),
                    i = n(349),
                    a = n(95),
                    u = n(229),
                    c = n(954),
                    l = new Map,
                    s = function(e, t, n, r, o, i, a, u) {
                        var c = arguments.length > 8 && void 0 !== arguments[8] && arguments[8];
                        return [e, t, n, null != r ? r : "", null != o ? o : "", null != i ? i : "", null != a ? a : "", u ? "bg" : "", c ? "frame" : ""].join(":")
                    },
                    f = function(e, t) {
                        var n, f = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : c.Ul.webp,
                            m = arguments.length > 3 ? arguments[3] : void 0,
                            d = arguments.length > 4 ? arguments[4] : void 0,
                            h = arguments.length > 5 ? arguments[5] : void 0,
                            b = arguments.length > 6 ? arguments[6] : void 0,
                            p = arguments.length > 7 ? arguments[7] : void 0,
                            v = arguments.length > 8 ? arguments[8] : void 0,
                            g = arguments.length > 9 && void 0 !== arguments[9] && arguments[9];
                        if (!m && !d) return new Promise(function(e, t) {
                            t(Error("TargetId or token can not be empty."))
                        });
                        if (!e) return new Promise(function(e, t) {
                            t(Error("ThumbnailType can not be empty."))
                        });
                        null != f || (f = c.Ul.webp);
                        var y = f;
                        (e === c.uS.gameIcon || e === c.uS.gameThumbnail || e === c.uS.placeGameIcon || e === c.uS.universeThumbnail) && (y = c.Ul.webp);
                        var S = (0, i.f)(e, v);
                        return ((n = y) !== c.Ul.webp ? Promise.resolve(n) : (void 0 === r && (r = new Promise(function(e) {
                            try {
                                var t = new Image;
                                t.onload = function() {
                                    return e(t.width > 0 && t.height > 0)
                                }, t.onerror = function() {
                                    return e(!1)
                                }, t.src = "data:image/webp;base64,UklGRkoAAABXRUJQVlA4WAoAAAAQAAAAAAAAAAAAQUxQSAwAAAARBxAR/Q9ERP8DAABWUDggGAAAABQBAJ0BKgEAAQAAAP4AAA3AAP7mtQAAAA=="
                            } catch (t) {
                                e(!0)
                            }
                        })), r).then(function(e) {
                            return e ? c.Ul.webp : c.Ul.png
                        })).then(function(n) {
                            var r = (0, o._)({
                                    targetId: m,
                                    token: d,
                                    type: e,
                                    format: n,
                                    size: t,
                                    version: b,
                                    headShape: p
                                }, S ? {
                                    includeBackground: !0
                                } : {}, e === c.uS.avatarHeadshot ? {
                                    includeProfileFrame: g
                                } : {}),
                                i = [c.uS.universeThumbnails, c.uS.universeThumbnail].includes(e) ? "universeThumbnailProcessor" : "thumbnail2dProcessor";
                            return a.W8.processThumbnailBatchRequest(r, function(t) {
                                return e === c.uS.universeThumbnail ? u.yB.handle(t, 1) : e === c.uS.universeThumbnails ? u.yB.handle(t, 10) : u.u_.handle(t)
                            }, i, h).then(function(n) {
                                var r = null == n ? void 0 : n.thumbnail;
                                return (null == r ? void 0 : r.state) === c.xc.complete && r.imageUrl && l.set(s(e, t, f, m, d, b, p, S, g), {
                                    state: r.state,
                                    imageUrl: r.imageUrl
                                }), n
                            })
                        })
                    },
                    m = function(e, t) {
                        var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : c.Ul.webp,
                            r = arguments.length > 3 ? arguments[3] : void 0,
                            o = arguments.length > 4 ? arguments[4] : void 0,
                            i = arguments.length > 5 ? arguments[5] : void 0,
                            a = arguments.length > 6 ? arguments[6] : void 0,
                            u = arguments.length > 7 ? arguments[7] : void 0,
                            l = arguments.length > 8 && void 0 !== arguments[8] && arguments[8];
                        return f(e, t, n, r, o, !1, i, a, u, l)
                    },
                    d = function(e, t) {
                        var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : c.Ul.webp,
                            r = arguments.length > 3 ? arguments[3] : void 0,
                            o = arguments.length > 4 ? arguments[4] : void 0,
                            i = arguments.length > 5 ? arguments[5] : void 0,
                            a = arguments.length > 6 ? arguments[6] : void 0,
                            u = arguments.length > 7 ? arguments[7] : void 0,
                            l = arguments.length > 8 && void 0 !== arguments[8] && arguments[8];
                        return f(e, t, n, r, o, !0, i, a, u, l)
                    },
                    h = function(e) {
                        return {
                            "icon-broken": e === c.xc.error,
                            "icon-in-review": e === c.xc.inReview,
                            "icon-blocked": e === c.xc.blocked,
                            "icon-pending": e === c.xc.pending
                        }
                    },
                    b = function(e, t) {
                        var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : c.Ul.webp,
                            r = arguments.length > 3 ? arguments[3] : void 0,
                            o = arguments.length > 4 ? arguments[4] : void 0,
                            i = arguments.length > 5 ? arguments[5] : void 0,
                            a = arguments.length > 6 ? arguments[6] : void 0,
                            u = arguments.length > 7 ? arguments[7] : void 0,
                            f = arguments.length > 8 && void 0 !== arguments[8] && arguments[8];
                        return l.get(s(e, t, n, r, o, i, a, u, f))
                    }
            },
            229: function(e, t, n) {
                "use strict";
                n.d(t, {
                    u_: function() {
                        return p
                    },
                    XY: function() {
                        return b
                    },
                    yB: function() {
                        return v
                    }
                });
                var r = n(474),
                    o = n(374),
                    i = n(528),
                    a = n(842),
                    u = n(807),
                    c = n(246),
                    l = window.Roblox["core-scripts"].dataStore,
                    s = n.n(l),
                    f = n(803),
                    m = n(954),
                    d = s().thumbnailsDataStore,
                    h = s().gameThumbnailsDataStore,
                    b = function() {
                        function e(t, n, o, a, u) {
                            (0, r._)(this, e), (0, i._)(this, "storeInstance", void 0), (0, i._)(this, "keySetter", void 0), (0, i._)(this, "keyGetter", void 0), (0, i._)(this, "validator", void 0), (0, i._)(this, "resultSetter", void 0), this.storeInstance = t, this.keySetter = n, this.keyGetter = o, this.validator = a, this.resultSetter = u
                        }
                        return (0, o._)(e, [{
                            key: "handle",
                            value: function(e, t) {
                                var n = this;
                                return new Promise(function(r) {
                                    n.storeInstance(e, t).then(function(o) {
                                        var i, c, l = new Map,
                                            s = {};
                                        (null != (i = null == o || null == (c = o.data) ? void 0 : c.data) ? i : []).forEach(function(e) {
                                            l.set(n.keySetter(e), e)
                                        }), e.forEach(function(e) {
                                            var r, o = n.keyGetter(e);
                                            if (l.has(o)) {
                                                var i = l.get(o);
                                                i && n.validator(i) && (s[o] = n.resultSetter(i, t))
                                            } else r = t && t > 1 ? {
                                                thumbnails: []
                                            } : {
                                                thumbnail: {
                                                    targetId: o,
                                                    state: m.xc.error
                                                }
                                            }, s[o] = (0, u._)((0, a._)({}, r), {
                                                errorcode: 3,
                                                errorMessage: "id doesn't exist"
                                            })
                                        }), r(s)
                                    }).catch(function(e) {
                                        (null == e ? void 0 : e.status) !== 503 && r({})
                                    })
                                })
                            }
                        }]), e
                    }(),
                    p = new b(function(e) {
                        var t = e.map(function(e) {
                            var t = e.data,
                                n = t.type,
                                r = (0, c._)(t, ["type"]),
                                o = e.key;
                            return (0, a._)({
                                requestId: o,
                                type: (0, f.JS)(n)
                            }, r)
                        });
                        return new Promise(function(e, n) {
                            d.getBatchThumbnails(t).then(e).catch(n)
                        })
                    }, function(e) {
                        var t;
                        return null != (t = e.requestId) ? t : ""
                    }, function(e) {
                        return e.key
                    }, function(e) {
                        return e.state !== m.xc.pending
                    }, function(e) {
                        return {
                            thumbnail: e
                        }
                    }),
                    v = new b(function(e, t) {
                        return new Promise(function(n, r) {
                            var o, i, a;
                            h.getAllUniverseThumbnails(e.map(function(e) {
                                var t = e.data.targetId;
                                return null != t ? t : 0
                            }), null == (o = e[0]) ? void 0 : o.data.size, null == (i = e[0]) ? void 0 : i.data.format, null == (a = e[0]) ? void 0 : a.data.isCircular, t).then(n).catch(r)
                        })
                    }, function(e) {
                        return e.universeId.toString()
                    }, function(e) {
                        return e.data.targetId ? e.data.targetId.toString() : ""
                    }, function(e) {
                        return !e.error
                    }, function(e, t) {
                        return 1 === t ? {
                            thumbnail: e.thumbnails[0]
                        } : {
                            thumbnails: e.thumbnails
                        }
                    })
            },
            95: function(e, t, n) {
                "use strict";
                n.d(t, {
                    r6: function() {
                        return f
                    },
                    W8: function() {
                        return d
                    }
                });
                var r = n(474),
                    o = n(374),
                    i = n(528),
                    a = n(971),
                    u = n.n(a),
                    c = n(932),
                    l = n(954),
                    s = n(803),
                    f = function() {
                        function e(t, n) {
                            (0, r._)(this, e), (0, i._)(this, "batchRequestFactory", void 0), (0, i._)(this, "thumbnailProcessorKeySerializer", void 0), (0, i._)(this, "thumbnailItemIdSerializer", void 0), (0, i._)(this, "thumbnailRequesters", {}), this.batchRequestFactory = new(u()), this.thumbnailItemIdSerializer = t, this.thumbnailProcessorKeySerializer = n
                        }
                        return (0, o._)(e, [{
                            key: "getThumbnailRequesterProperties",
                            value: function(e) {
                                return e ? {
                                    getFailureCooldown: this.batchRequestFactory.createExponentialBackoffCooldown(e.requestMinCooldown, e.requestMaxCooldown),
                                    maxRetryAttempts: e.requestMaxRetryAttempts,
                                    batchSize: e.requestBatchSize,
                                    concurrentRequestCount: e.concurrentThumbnailRequestCount,
                                    processBatchWaitTime: 1e3
                                } : {
                                    getFailureCooldown: this.batchRequestFactory.createExponentialBackoffCooldown(l.Mi.minCooldown, l.Mi.maxCooldown),
                                    maxRetryAttempts: l.Mi.maxRetryAttempts,
                                    batchSize: l.XC
                                }
                            }
                        }, {
                            key: "getThumbnailRequester",
                            value: function(e, t, n) {
                                var r = this,
                                    o = this.thumbnailRequesters[t];
                                if (o) return o;
                                var i = this.batchRequestFactory.createRequestProcessor(e, function(e) {
                                    return r.thumbnailItemIdSerializer(e)
                                }, this.getThumbnailRequesterProperties(n));
                                return this.thumbnailRequesters[t] = i, i
                            }
                        }, {
                            key: "processThumbnailBatchRequest",
                            value: function(e, t) {
                                var n, r, o, i, a, u, f, m, d, h = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : this.thumbnailProcessorKeySerializer(e),
                                    b = arguments.length > 3 ? arguments[3] : void 0,
                                    p = e.type,
                                    v = void 0 === p ? "custom" : p,
                                    g = (d = null == (n = document.getElementsByName("thumbnail-meta-data")[0]) ? void 0 : n.dataset) ? {
                                        thumbnailMetricsSampleSize: parseInt(null != (r = d.thumbnailMetricsSampleSize) ? r : "", 10),
                                        isWebappUseCacheEnabled: "True" === d.isWebappCacheEnabled,
                                        webappCacheExpirationTimespan: null != (o = d.webappCacheExpirationsTimespan) ? o : "",
                                        requestMinCooldown: parseInt(null != (i = d.requestMinCooldown) ? i : "", 10),
                                        requestMaxCooldown: parseInt(null != (a = d.requestMaxCooldown) ? a : "", 10),
                                        requestMaxRetryAttempts: parseInt(null != (u = d.requestMaxRetryAttempts) ? u : "", 10),
                                        requestBatchSize: parseInt(null != (f = d.requestBatchSize) ? f : "", 10),
                                        concurrentThumbnailRequestCount: parseInt(null != (m = d.concurrentThumbnailRequestCount) ? m : "", 10)
                                    } : l.x$,
                                    y = this.getThumbnailRequester(t, h, g);
                                b && y.invalidateItem(e);
                                var S = (0, s.$E)(g);
                                return y.queueItem(e, void 0, S).then(function(e) {
                                    if (e.performance && (0, s.rv)(g)) {
                                        var t = e.thumbnails,
                                            n = e.thumbnail,
                                            r = function(e) {
                                                (0, c.l)("ThumbnailStatusCountWebapp", {
                                                    ThumbnailType: "".concat(v, "_2d"),
                                                    Status: e.state,
                                                    Version: e.version
                                                }).catch(function(e) {
                                                    console.error(e)
                                                })
                                            };
                                        n && r(n), t && t.forEach(r)
                                    }
                                    return e
                                }).catch(function(e) {
                                    return console.error({
                                        error: e
                                    }), (0, s.rv)(g) && e === l.o0.maxAttemptsReached && (0, c.l)("ThumbnailTimeoutWebapp", {
                                        ThumbnailType: "".concat(v, "_2d")
                                    }).catch(function(e) {
                                        console.error(e)
                                    }), Promise.reject(e)
                                })
                            }
                        }]), e
                    }();

                function m(e) {
                    var t = e.targetId,
                        n = e.token,
                        r = e.type,
                        o = e.size,
                        i = e.format,
                        a = e.isCircular,
                        u = e.version,
                        c = e.headShape,
                        l = e.includeBackground,
                        s = e.includeProfileFrame;
                    return "".concat((void 0 === t ? 0 : t).toString(), ":").concat(n, ":").concat(r, ":").concat(o, ":").concat(i, ":").concat(a ? "circular" : "regular", ":").concat(void 0 === u ? 0 : u, ":").concat(null != c ? c : "", ":").concat(void 0 !== l && l, ":").concat(void 0 !== s && s)
                }
                var d = new f(function(e) {
                    var t = e.type,
                        n = e.targetId;
                    return t === l.uS.universeThumbnail || t === l.uS.universeThumbnails ? (void 0 === n ? 0 : n).toString() : m(e)
                }, m);
                new f(function(e) {
                    return e.key
                }, function() {
                    return "customThumbnailRequester"
                })
            },
            803: function(e, t, n) {
                "use strict";
                n.d(t, {
                    $E: function() {
                        return l
                    },
                    JS: function() {
                        return c
                    },
                    rv: function() {
                        return s
                    }
                });
                var r, o = n(528),
                    i = n(936),
                    a = n(954),
                    u = (r = {}, (0, o._)(r, a.uS.avatar, a.JF.Avatar), (0, o._)(r, a.uS.avatarHeadshot, a.JF.AvatarHeadShot), (0, o._)(r, a.uS.gameIcon, a.JF.GameIcon), (0, o._)(r, a.uS.badgeIcon, a.JF.BadgeIcon), (0, o._)(r, a.uS.gamePassIcon, a.JF.GamePass), (0, o._)(r, a.uS.assetThumbnail, a.JF.Asset), (0, o._)(r, a.uS.bundleThumbnail, a.JF.BundleThumbnail), (0, o._)(r, a.uS.userOutfit, a.JF.Outfit), (0, o._)(r, a.uS.groupIcon, a.JF.GroupIcon), (0, o._)(r, a.uS.placeGameIcon, a.JF.PlaceIcon), (0, o._)(r, a.uS.developerProductIcon, a.JF.DeveloperProduct), (0, o._)(r, a.uS.gameThumbnail, a.JF.GameThumbnail), (0, o._)(r, a.uS.lookThumbnail, a.JF.LookThumbnail), (0, o._)(r, a.uS.screenshot, a.JF.Screenshot), r);

                function c(e) {
                    return u[e]
                }

                function l(e) {
                    if (e) {
                        var t, n, r, o, a;
                        return {
                            useCache: e.isWebappUseCacheEnabled,
                            expirationWindowMS: (t = e.webappCacheExpirationTimespan, r = (n = (0, i._)(t.split(":"), 3))[0], o = n[1], a = n[2], void 0 === r || void 0 === o || void 0 === a ? NaN : (60 * parseInt(r, 10) * 60 + 60 * parseInt(o, 10) + parseInt(a, 10)) * 1e3)
                        }
                    }
                }

                function s(e) {
                    return !e || Math.floor(100 * Math.random()) <= e.thumbnailMetricsSampleSize
                }
            },
            349: function(e, t, n) {
                "use strict";
                n.d(t, {
                    f: function() {
                        return r
                    }
                });
                var r = function(e, t) {
                    return null != t ? t : (null == e ? void 0 : e.toLowerCase()) === "avatarheadshot"
                }
            },
            192: function(e) {
                "use strict";
                e.exports = window.angular
            },
            93: function(e) {
                "use strict";
                e.exports = window.Roblox["core-scripts"].environmentUrls
            },
            971: function(e) {
                "use strict";
                e.exports = window.Roblox["core-scripts"].util.batchRequest
            }
        },
        t = {};

    function n(r) {
        var o = t[r];
        if (void 0 !== o) return o.exports;
        var i = t[r] = {
            exports: {}
        };
        return e[r](i, i.exports, n), i.exports
    }
    n.m = e, n.n = function(e) {
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
            "u" > typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
                value: "Module"
            }), Object.defineProperty(e, "__esModule", {
                value: !0
            })
        }, n.rv = function() {
            return "1.7.12"
        }, n.ruid = "bundler=rspack@1.7.12",
        function() {
            "use strict";
            var e, t = {};
            n.r(t), n.d(t, {
                BatchRequestError: function() {
                    return w.o0
                },
                DEFAULT_META_DATA: function() {
                    return w.x$
                },
                DefaultBatchSize: function() {
                    return w.XC
                },
                DefaultThumbnailFormat: function() {
                    return w.R2
                },
                DefaultThumbnailSize: function() {
                    return w.F5
                },
                FeatureName: function() {
                    return w.SD
                },
                LoadFailureMetricsType: function() {
                    return w.MU
                },
                LoadFailureName: function() {
                    return w.cu
                },
                LoadRetrySuccessName: function() {
                    return w.tb
                },
                LoadSuccessMetricsType: function() {
                    return w.dS
                },
                LoadSuccessName: function() {
                    return w.DS
                },
                PROFILE_FRAME_EXPERIMENT_KEY: function() {
                    return U
                },
                PROFILE_FRAME_LAYER: function() {
                    return j
                },
                ProfileFrameDefaultContext: function() {
                    return I
                },
                RetryPerThumbnailType: function() {
                    return w.EX
                },
                ReturnPolicy: function() {
                    return w.TP
                },
                RobloxThumbnailsApisModelsThumbnailBatchRequestTypeEnum: function() {
                    return w.JF
                },
                Thumbnail2d: function() {
                    return _
                },
                Thumbnail2dCarouselContainer: function() {
                    return P
                },
                ThumbnailAssetsSize: function() {
                    return w.Tm
                },
                ThumbnailAvatarHeadshotSize: function() {
                    return w.jZ
                },
                ThumbnailAvatarsSize: function() {
                    return w.qh
                },
                ThumbnailBadgeIconSize: function() {
                    return w.S3
                },
                ThumbnailCooldown: function() {
                    return w.Mi
                },
                ThumbnailDeveloperProductIconSize: function() {
                    return w.s2
                },
                ThumbnailFormat: function() {
                    return w.Ul
                },
                ThumbnailGameIconSize: function() {
                    return w.fP
                },
                ThumbnailGamePassIconSize: function() {
                    return w.Ou
                },
                ThumbnailGameThumbnailSize: function() {
                    return w.SH
                },
                ThumbnailGroupIconSize: function() {
                    return w.wu
                },
                ThumbnailMetadataUrl: function() {
                    return w.Pq
                },
                ThumbnailStates: function() {
                    return w.xc
                },
                ThumbnailTypes: function() {
                    return w.uS
                },
                ThumbnailUniverseThumbnailSize: function() {
                    return w.lo
                },
                thumbnailService: function() {
                    return y
                },
                useProfileFrameExperiment: function() {
                    return N
                }
            });
            var r = n(192),
                o = n.n(r);

            function i(e, t) {
                if (e) {
                    if ("string" == typeof e) return a(e, t);
                    var n = ({}).toString.call(e).slice(8, -1);
                    return "Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n ? Array.from(e) : "Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n) ? a(e, t) : void 0
                }
            }

            function a(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }
            var u = function(e) {
                    e.keys().forEach(e)
                },
                c = n(842),
                l = n(807),
                s = n(936),
                f = window.ReactJSX,
                m = window.React,
                d = n(390),
                h = n.n(d),
                b = window.PropTypes,
                p = n.n(b),
                v = n(349),
                g = n(932),
                y = n(501),
                S = n(95),
                T = n(229),
                w = n(954),
                I = (0, m.createContext)(!1);

            function C(e) {
                var t = e.onLoad,
                    n = e.errorIconClass,
                    r = e.thumbnailUrl,
                    o = e.imgClassName,
                    i = e.containerClass,
                    a = e.altName,
                    u = h()("thumbnail-2d-container", n, i),
                    c = (0, s._)((0, m.useState)(h()(o, "loading")), 2),
                    l = c[0],
                    d = c[1];
                return (0, m.useEffect)(function() {
                    null === r && d(h()(o, "loading"))
                }, [r, o]), (0, f.jsx)("span", {
                    className: u,
                    children: r && (0, f.jsx)("img", {
                        className: l,
                        src: r,
                        alt: a,
                        onLoad: function() {
                            t(), d(o)
                        }
                    })
                })
            }
            C.defaultProps = {
                errorIconClass: "",
                thumbnailUrl: "",
                imgClassName: "",
                containerClass: "",
                altName: "",
                onLoad: function() {}
            }, C.propTypes = {
                errorIconClass: p().string,
                thumbnailUrl: p().string,
                imgClassName: p().string,
                containerClass: p().string,
                altName: p().string,
                onLoad: p().func
            };
            var x = new S.r6(function(e) {
                return e.targetId
            }, function() {
                return "customThumbnailRequester"
            });

            function A(e) {
                var t, n, r = e.type,
                    o = e.targetId,
                    i = e.token,
                    a = e.size,
                    u = e.imgClassName,
                    d = e.containerClass,
                    b = e.format,
                    p = e.altName,
                    S = e.onLoad,
                    A = e.getThumbnail,
                    _ = e.version,
                    O = e.headShape,
                    P = e.includeBackground,
                    R = e.includeProfileFrame,
                    E = e.seedFromCache,
                    z = (0, s._)((0, m.useState)(new Date().getTime()), 1)[0],
                    k = (0, m.useContext)(I),
                    F = R || k,
                    j = k && !R && r === w.uS.avatarHeadshot ? w.jZ.size150 : a,
                    U = (0, v.f)(r, P),
                    q = (0, s._)((0, m.useState)(function() {
                        return E ? y.peekThumbnailImage(r, j, b, o, i, _, O, U, F) : void 0
                    }), 1)[0],
                    L = (0, m.useRef)(!!q),
                    D = (0, s._)((0, m.useState)(null != (t = null == q ? void 0 : q.state) ? t : null), 2),
                    M = D[0],
                    N = D[1],
                    $ = (0, s._)((0, m.useState)(null != (n = null == q ? void 0 : q.imageUrl) ? n : null), 2),
                    B = $[0],
                    G = $[1],
                    W = h()(y.getCssClass(M)),
                    J = (0, s._)((0, m.useState)(q ? "" : "shimmer"), 2),
                    H = J[0],
                    V = J[1],
                    X = (0, s._)((0, m.useState)(null), 2),
                    K = X[0],
                    Q = X[1],
                    Y = (0, m.useMemo)(function() {
                        return new T.XY(function() {
                            return new Promise(function(e, t) {
                                A().then(function(t) {
                                    e({
                                        data: {
                                            data: [(0, l._)((0, c._)({}, t.data), {
                                                targetId: o
                                            })]
                                        }
                                    })
                                }).catch(t)
                            })
                        }, function(e) {
                            return e.targetId
                        }, function(e) {
                            return e.key
                        }, function(e) {
                            return e.state !== w.xc.pending
                        }, function(e) {
                            return {
                                thumbnail: e
                            }
                        })
                    }, [o, A]),
                    Z = (0, m.useCallback)(function() {
                        if (K) {
                            var e = new Date().getTime() - z,
                                t = K.retryAttempts;
                            (0, g.l)("ThumbnailLoadDurationWebapp", {
                                Status: "Success",
                                ThumbnailType: "".concat(r, "_2d"),
                                Value: e.toString()
                            }).catch(function(e) {
                                console.error(e)
                            }), t ? (0, g.l)("ThumbnailRetryWebapp", {
                                ThumbnailType: "".concat(r, "_2d"),
                                Value: t.toString()
                            }).catch(function(e) {
                                console.error(e)
                            }) : (0, g.l)("ThumbnailNoRetrySuccessWebapp", {
                                ThumbnailType: "".concat(r, "_2d")
                            }).catch(function(e) {
                                console.error(e)
                            })
                        }
                        S && S()
                    }, [K]);
                return (0, m.useEffect)(function() {
                    L.current ? L.current = !1 : (V("shimmer"), N(null), G(null));
                    var e = !1,
                        t = y.getThumbnailImage(r, j, b, o, i, _, O, U, F);
                    return A && (t = x.processThumbnailBatchRequest({
                            targetId: o,
                            type: r
                        }, function(e) {
                            return Y.handle(e)
                        }, o)), t.then(function(t) {
                            var n = t.thumbnail,
                                r = n.state,
                                o = n.imageUrl,
                                i = t.performance;
                            !e && (N(r), G(o), V(""), i && Q((0, c._)({}, i)))
                        }).catch(function(t) {
                            console.error(t), e || V("")
                        }),
                        function() {
                            e = !0
                        }
                }, [r, o, i, j, u, A, _, O, U, F]), (0, f.jsx)(C, {
                    thumbnailUrl: B,
                    errorIconClass: W,
                    imgClassName: u,
                    altName: p,
                    onLoad: Z,
                    containerClass: h()(H, d)
                })
            }
            A.defaultProps = {
                targetId: 0,
                token: "",
                size: "150x150",
                imgClassName: "",
                containerClass: "",
                format: "webp",
                altName: "",
                onLoad: function() {},
                getThumbnail: null,
                version: "",
                includeProfileFrame: !1,
                seedFromCache: !1
            }, A.propTypes = {
                type: p().string.isRequired,
                targetId: p().number,
                token: p().string,
                size: p().string,
                format: p().string,
                imgClassName: p().string,
                containerClass: p().string,
                altName: p().string,
                onLoad: p().func,
                getThumbnail: p().func,
                version: p().string,
                headShape: p().string,
                includeBackground: p().bool,
                includeProfileFrame: p().bool,
                seedFromCache: p().bool
            };
            var _ = A;

            function O(e) {
                var t = e.type,
                    n = e.targetId,
                    r = e.size,
                    o = e.imgClassName,
                    i = e.containerClass,
                    a = e.format,
                    u = e.altName,
                    c = (0, s._)((0, m.useState)(null), 2),
                    l = c[0],
                    d = c[1],
                    b = (0, s._)((0, m.useState)(null), 2),
                    p = b[0],
                    v = b[1],
                    g = (0, s._)((0, m.useState)(null), 2),
                    S = g[0],
                    T = g[1],
                    w = (0, s._)((0, m.useState)("shimmer"), 2),
                    I = w[0],
                    x = w[1],
                    A = (0, s._)((0, m.useState)(0), 2),
                    _ = A[0],
                    O = A[1],
                    P = function() {
                        O(_ >= l.length - 1 ? 0 : _ + 1)
                    };
                return (0, m.useEffect)(function() {
                    var e;
                    if (l) {
                        var t = l[_];
                        v(t.state), T(t.imageUrl), x(""), e = setInterval(function() {
                            return P()
                        }, 4e3)
                    }
                    return function() {
                        clearInterval(e)
                    }
                }, [l, _]), (0, m.useEffect)(function() {
                    var e = !1;
                    return y.getThumbnailImage(t, r, a, n).then(function(t) {
                            e || d(t.thumbnails)
                        }).catch(function() {
                            e || x("")
                        }),
                        function() {
                            e = !0
                        }
                }, [t, n, r, o, a]), (0, f.jsx)(C, {
                    thumbnailUrl: S,
                    errorIconClass: h()(y.getCssClass(p)),
                    imgClassName: o,
                    altName: u,
                    containerClass: h()(I, i)
                })
            }
            O.defaultProps = {
                size: "576x324",
                imgClassName: "",
                containerClass: "",
                format: "webp",
                altName: ""
            }, O.propTypes = {
                type: p().string.isRequired,
                targetId: p().number.isRequired,
                size: p().string,
                format: p().string,
                imgClassName: p().string,
                containerClass: p().string,
                altName: p().string
            };
            var P = O,
                R = n(839),
                E = n(386),
                z = window.Roblox.ExperimentationService,
                k = n.n(z),
                F = window.Roblox["core-scripts"].meta.user,
                j = "Social.Friends",
                U = "friendsCarouselProfileFrameEnabled",
                q = function() {
                    var e, t = null != (e = (0, F.userId)()) ? e : 0;
                    return "".concat(j, "_").concat(U, "_").concat(t, "_").concat(new Date().toDateString(), "_").concat("v1")
                },
                L = function() {
                    try {
                        return "true" === sessionStorage.getItem(q())
                    } catch (e) {
                        return !1
                    }
                },
                D = null,
                M = function() {
                    if (D) return D;
                    var e = (0, R._)(function() {
                        var e;
                        return (0, E._)(this, function(t) {
                            switch (t.label) {
                                case 0:
                                    return [4, k().getAllValuesForLayer(j)];
                                case 1:
                                    e = !0 === t.sent()[U];
                                    try {
                                        sessionStorage.setItem(q(), e.toString())
                                    } catch (e) {}
                                    return [2, e]
                            }
                        })
                    })();
                    return e.catch(function() {
                        D = null
                    }), D = e, e
                },
                N = function() {
                    var e = (0, s._)((0, m.useState)(L), 2),
                        t = e[0],
                        n = e[1];
                    return (0, m.useEffect)(function() {
                        var e = !0;
                        return M().then(function(t) {
                                e && n(t)
                            }).catch(function(e) {
                                console.error("Failed to load profile frame IXP:", e)
                            }),
                            function() {
                                e = !1
                            }
                    }, []), t
                };
            o().module("angularLazyImg", []).factory("LazyImgMagic", ["$window", "$rootScope", "lazyImgConfig", "lazyImgHelpers", function(e, t, n, r) {
                    var i, a, u, c, l, s, f, m;

                    function d() {
                        for (var e = u.length - 1; e >= 0; e--) {
                            var n = u[e];
                            n && r.isElementInView(n.$elem[0], l.offset, i) && (function(e) {
                                var n = new Image;
                                n.onerror = function() {
                                    l.errorClass && e.$elem.addClass(l.errorClass), t.$emit("lazyImg:error", e), l.onError(e)
                                }, n.onload = function() {
                                    var n, r;
                                    n = e.$elem, r = e.src, "img" === n[0].nodeName.toLowerCase() ? n[0].src = r : n.css("background-image", 'url("'.concat(r, '")')), e.$elem.removeClass(l.loadingClass), l.successClass && e.$elem.addClass(l.successClass), t.$emit("lazyImg:success", e), l.onSuccess(e)
                                }, n.src = e.src
                            }(n), u.splice(e, 1))
                        }
                        0 === u.length && p()
                    }

                    function h(e) {
                        m.forEach(function(t) {
                            t[e]("scroll", s), t[e]("touchmove", s)
                        }), a[e]("resize", s), a[e]("resize", f)
                    }

                    function b() {
                        c = !0, setTimeout(function() {
                            d(), h("on")
                        }, 1)
                    }

                    function p() {
                        c = !1, h("off")
                    }

                    function v(e) {
                        e.addClass(l.loadingClass), this.$elem = e
                    }
                    return u = [], c = !1, l = n.getOptions(), a = o().element(e), i = r.getWinDimensions(), f = r.throttle(function() {
                        i = r.getWinDimensions()
                    }, 60), m = [l.container || a], s = r.throttle(d, 30), v.prototype.setSource = function(e) {
                        this.src = e, u.unshift(this), c || b()
                    }, v.prototype.removeImage = function() {
                        var e; - 1 !== (e = u.indexOf(this)) && u.splice(e, 1), 0 === u.length && p()
                    }, v.prototype.checkImages = function() {
                        d()
                    }, v.addContainer = function(e) {
                        p(), m.push(e), b()
                    }, v.removeContainer = function(e) {
                        p(), m.splice(m.indexOf(e), 1), b()
                    }, v
                }]).provider("lazyImgConfig", function() {
                    this.options = {
                        offset: 100,
                        errorClass: null,
                        successClass: null,
                        onError: function() {},
                        onSuccess: function() {},
                        loadingClass: "icon-placeholder-game"
                    }, this.$get = function() {
                        var e = this.options;
                        return {
                            getOptions: function() {
                                return e
                            }
                        }
                    }, this.setOptions = function(e) {
                        o().extend(this.options, e)
                    }
                }).factory("lazyImgHelpers", ["$window", function(e) {
                    return {
                        isElementInView: function(e, t, n) {
                            var r = e.getBoundingClientRect(),
                                o = n.height + t;
                            return e.offsetParent && r.left >= 0 && r.right <= n.width + t && (r.top >= 0 && r.top <= o || r.bottom <= o && r.bottom >= 0 - t)
                        },
                        getWinDimensions: function() {
                            return {
                                height: e.innerHeight,
                                width: e.innerWidth
                            }
                        },
                        throttle: function(e, t, n) {
                            var r, o;
                            return function() {
                                var i = n || this,
                                    a = +new Date,
                                    u = arguments;
                                r && a < r + t ? (clearTimeout(o), o = setTimeout(function() {
                                    r = a, e.apply(i, u)
                                }, t)) : (r = a, e.apply(i, u))
                            }
                        }
                    }
                }]).directive("lazyImg", ["$rootScope", "LazyImgMagic", function(e, t) {
                    return {
                        link: function(n, r, o) {
                            var i = new t(r);
                            o.$observe("lazyImg", function(e) {
                                e && i.setSource(e)
                            }), n.$on("$destroy", function() {
                                i.removeImage()
                            }), e.$on("lazyImg.runCheck", function() {
                                i.checkImages()
                            }), e.$on("lazyImg:refresh", function() {
                                i.checkImages()
                            })
                        },
                        restrict: "A"
                    }
                }]).directive("lazyImgContainer", ["LazyImgMagic", function(e) {
                    return {
                        link: function(t, n) {
                            e.addContainer(n), t.$on("$destroy", function() {
                                e.removeContainer(n)
                            })
                        },
                        restrict: "A"
                    }
                }]), n(134),
                function(e, t) {
                    var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : window;
                    if ("string" == typeof e) n[e] = t;
                    else {
                        var r, o = function(e) {
                                if (Array.isArray(e)) return a(e)
                            }(e) || function(e) {
                                if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                            }(e) || i(e) || function() {
                                throw TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }(),
                            u = o.pop(),
                            c = n,
                            l = function(e) {
                                var t = "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                if (!t) {
                                    if (Array.isArray(e) || (t = i(e))) {
                                        t && (e = t);
                                        var n = 0,
                                            r = function() {};
                                        return {
                                            s: r,
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
                                            f: r
                                        }
                                    }
                                    throw TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }
                                var o, a = !0,
                                    u = !1;
                                return {
                                    s: function() {
                                        t = t.call(e)
                                    },
                                    n: function() {
                                        var e = t.next();
                                        return a = e.done, e
                                    },
                                    e: function(e) {
                                        u = !0, o = e
                                    },
                                    f: function() {
                                        try {
                                            a || null == t.return || t.return()
                                        } finally {
                                            if (u) throw o
                                        }
                                    }
                                }
                            }(o);
                        try {
                            for (l.s(); !(r = l.n()).done;) {
                                var s, f = r.value;
                                null != (s = c)[f] || (s[f] = {}), c = c[f]
                            }
                        } catch (e) {
                            l.e(e)
                        } finally {
                            l.f()
                        }
                        c[u] = t
                    }
                }("RobloxThumbnails", t), u(n(545)), u(n(966)), u(n(254)), u(n(771)), u(n(185));
            var $ = n(902);
            e = o(), e.module("thumbnailsTemplates", []).run(["$templateCache", function(e) {
                $ && $.keys().forEach(function(t) {
                    var n = t.split("/").pop().replace(".html", "").replace(/([a-z])([A-Z])/g, "$1-$2").toLowerCase();
                    e.put(n, $(t))
                })
            }])
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected(document.currentScript && document.currentScript.getAttribute("data-bundlename") || "Thumbnails");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/thumbnails-5fb95d0827098053.js.map