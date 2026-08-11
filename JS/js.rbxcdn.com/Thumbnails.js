! function() {
    try {
        var e = "undefined" != typeof window ? window : "undefined" != typeof global ? global : "undefined" != typeof globalThis ? globalThis : "undefined" != typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "8771229b2b136ba6fb1e3981680b45a21674ced5"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "2221984a-3fb9-4019-bf56-744690935df0", e._sentryDebugIdIdentifier = "sentry-dbid-2221984a-3fb9-4019-bf56-744690935df0")
    } catch (e) {}
}(),
function() {
    var e = {
            631: function(e, t, n) {
                var r = {
                    "./2dThumbnailComponent.js": "586"
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
                }, o.resolve = i, e.exports = o, o.id = 631
            },
            916: function(e, t, n) {
                var r = {
                    "./thumbnailConstants.js": "871"
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
                }, o.resolve = i, e.exports = o, o.id = 916
            },
            316: function(e, t, n) {
                var r = {
                    "./2dThumbnailController.js": "438"
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
                }, o.resolve = i, e.exports = o, o.id = 316
            },
            281: function(e, t, n) {
                var r = {
                    "./imageLoadDirective.js": "399",
                    "./thumbnailErrorDirective.js": "782"
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
                }, o.resolve = i, e.exports = o, o.id = 281
            },
            87: function(e, t, n) {
                var r = {
                    "./thumbnailService.js": "136"
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
                }, o.resolve = i, e.exports = o, o.id = 87
            },
            892: function(e, t, n) {
                var r = {
                    "./components/templates/2dThumbnail.html": "7"
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
                }, o.resolve = i, e.exports = o, o.id = 892
            },
            7: function(e) {
                e.exports = '<span ng-class="$ctrl.getCssClasses()" class="thumbnail-2d-container" thumbnail-type="{{ $ctrl.thumbnailType }}" thumbnail-target-id="{{ $ctrl.thumbnailTargetId }}"> <img ng-if="$ctrl.thumbnailUrl && !$ctrl.isLazyLoadingEnabled()" ng-src="{{ $ctrl.thumbnailUrl }}" thumbnail-error="$ctrl.setThumbnailLoadFailed" ng-class="{\'loading\': $ctrl.thumbnailUrl && !isLoaded }" image-load alt="{{$ctrl.altName}}" title="{{$ctrl.altName}}"/> <img ng-if="$ctrl.thumbnailUrl && $ctrl.isLazyLoadingEnabled()" lazy-img="{{ $ctrl.thumbnailUrl }}" thumbnail-error="$ctrl.setThumbnailLoadFailed"/> </span> '
            },
            586: function(e, t, n) {
                "use strict";
                n.r(t);
                var r = n(569),
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
            871: function(e, t, n) {
                "use strict";
                n.r(t);
                var r = n(517),
                    o = n(569),
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
            438: function(e, t, n) {
                "use strict";
                n.r(t);
                var r = n(347),
                    o = n(517),
                    i = n(569);

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
                        var e, r, u = "".concat(n.thumbnailType, ":").concat(n.thumbnailTargetId);
                        if (n.startTime = new Date().getTime(), i !== u) {
                            i = u, n.thumbnailState = a.loading;
                            var c = (null == (e = n.thumbnailOptions) ? void 0 : e.size) || o.F5,
                                l = (null == (r = n.thumbnailOptions) ? void 0 : r.format) || o.R2;
                            n.isThumbnailRequestSending = !0, t.getThumbnailImage(n.thumbnailType, n.thumbnailTargetId, c, l).then(function(e) {
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
            399: function(e, t, n) {
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
                n.r(t), n(569).A.directive("imageLoad", r), t.default = r
            },
            782: function(e, t, n) {
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
                n.r(t), n(569).A.directive("thumbnailError", r), t.default = r
            },
            136: function(e, t, n) {
                "use strict";
                n.r(t);
                var r = n(392),
                    o = n(569);

                function i(e) {
                    return {
                        getThumbnailImage: function(t, n, o, i) {
                            return e(function(e, a) {
                                r.getThumbnailImage(t, o, i, n).then(function(t) {
                                    e(t)
                                }).catch(a)
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
            569: function(e, t, n) {
                "use strict";
                var r = n(192);
                t.A = n.n(r)().module("thumbnails", ["robloxApp", "thumbnailsTemplates", "angularLazyImg"])
            },
            147: function(e) {
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
            517: function(e, t, n) {
                "use strict";
                n.d(t, {
                    DS: function() {
                        return G
                    },
                    EX: function() {
                        return H
                    },
                    F5: function() {
                        return P
                    },
                    JF: function() {
                        return I
                    },
                    MU: function() {
                        return X
                    },
                    Mi: function() {
                        return C
                    },
                    Ou: function() {
                        return E
                    },
                    Pq: function() {
                        return T
                    },
                    R2: function() {
                        return j
                    },
                    S3: function() {
                        return F
                    },
                    SD: function() {
                        return _
                    },
                    SH: function() {
                        return q
                    },
                    TP: function() {
                        return B
                    },
                    Tm: function() {
                        return R
                    },
                    Ul: function() {
                        return L
                    },
                    XC: function() {
                        return x
                    },
                    cu: function() {
                        return V
                    },
                    dS: function() {
                        return J
                    },
                    fP: function() {
                        return k
                    },
                    jZ: function() {
                        return D
                    },
                    lo: function() {
                        return M
                    },
                    o0: function() {
                        return O
                    },
                    qh: function() {
                        return z
                    },
                    s2: function() {
                        return N
                    },
                    tb: function() {
                        return W
                    },
                    uS: function() {
                        return A
                    },
                    wu: function() {
                        return U
                    },
                    x$: function() {
                        return K
                    },
                    xc: function() {
                        return $
                    }
                });
                var r, o, i, a, u, c, l, s, f, m, h, d, b, p, y, v, g, S = n(93),
                    w = n.n(S)().thumbnailsApi,
                    T = "".concat(w, "/v1/metadata"),
                    O = ((r = {}).processFailure = "processFailure", r.unretriableFailure = "unretriableFailure", r.maxAttemptsReached = "maxAttemptsReached", r),
                    I = ((o = {}).Avatar = "Avatar", o.AvatarHeadShot = "AvatarHeadShot", o.GameIcon = "GameIcon", o.BadgeIcon = "BadgeIcon", o.GameThumbnail = "GameThumbnail", o.GamePass = "GamePass", o.Asset = "Asset", o.BundleThumbnail = "BundleThumbnail", o.Outfit = "Outfit", o.GroupIcon = "GroupIcon", o.DeveloperProduct = "DeveloperProduct", o.PlaceIcon = "PlaceIcon", o.LookThumbnail = "Look", o.Screenshot = "Screenshot", o),
                    A = ((i = {}).avatar = "Avatar", i.avatarHeadshot = "AvatarHeadshot", i.gameIcon = "GameIcon", i.gameThumbnail = "GameThumbnail", i.badgeIcon = "BadgeIcon", i.gamePassIcon = "GamePass", i.assetThumbnail = "Asset", i.bundleThumbnail = "BundleThumbnail", i.userOutfit = "Outfit", i.groupIcon = "GroupIcon", i.developerProductIcon = "DeveloperProduct", i.universeThumbnail = "UniverseThumbnail", i.universeThumbnails = "UniverseThumbnails", i.placeGameIcon = "PlaceGameIcon", i.lookThumbnail = "Look", i.screenshot = "Screenshot", i),
                    x = 100,
                    C = ((a = {})[a.maxRetryAttempts = 10] = "maxRetryAttempts", a[a.minCooldown = 1e3] = "minCooldown", a[a.maxCooldown = 3e4] = "maxCooldown", a),
                    P = "150x150",
                    j = "webp",
                    k = ((u = {}).size50 = "50x50", u.size150 = "150x150", u.size256 = "256x256", u.size512 = "512x512", u),
                    E = ((c = {}).size150 = "150x150", c),
                    R = ((l = {}).size150 = "150x150", l.size420 = "420x420", l.size700 = "700x700", l.width256 = "256x144", l.width384 = "384x216", l.width480 = "480x270", l.width576 = "576x324", l.width768 = "768x432", l.width1320 = "1320x440", l.width660 = "660x220", l.width330 = "330x110", l.width720 = "720x228", l.width930 = "930x480", l.width1440 = "1440x456", l),
                    z = ((s = {}).size100 = "100x100", s.size352 = "352x352", s.size720 = "720x720", s),
                    D = ((f = {}).size48 = "48x48", f.size60 = "60x60", f.size150 = "150x150", f),
                    U = ((m = {}).size150 = "150x150", m.size420 = "420x420", m),
                    F = ((h = {}).size150 = "150x150", h),
                    N = ((d = {}).size150 = "150x150", d),
                    q = ((b = {}).width768 = "768x432", b.width576 = "576x324", b.width480 = "480x270", b.width384 = "384x216", b.width256 = "256x144", b),
                    M = ((p = {}).width768 = "768x432", p.width576 = "576x324", p.width480 = "480x270", p.width384 = "384x216", p.width256 = "256x144", p),
                    $ = ((y = {}).error = "Error", y.complete = "Completed", y.inReview = "InReview", y.pending = "Pending", y.blocked = "Blocked", y),
                    L = ((v = {}).png = "png", v.jpg = "jpg", v.jpeg = "jpeg", v.webp = "webp", v),
                    B = ((g = {}).PlaceHolder = "PlaceHolder", g.AutoGenerated = "AutoGenerated", g.ForceAutoGenerated = "ForceAutoGenerated", g),
                    _ = "Thumbnail2DWeb",
                    G = "LoadSuccess",
                    W = "RetryLoadSuccess",
                    H = "RetryPerThumbnailType",
                    J = "Sequence",
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
            384: function(e, t, n) {
                "use strict";
                n.d(t, {
                    FP: function() {
                        return f
                    },
                    G4: function() {
                        return g
                    },
                    Kp: function() {
                        return a
                    },
                    ez: function() {
                        return y
                    },
                    mt: function() {
                        return u
                    },
                    st: function() {
                        return v
                    }
                });
                var r = n(609);

                function o(e, t) {
                    (null == t || t > e.length) && (t = e.length);
                    for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                    return r
                }

                function i(e, t, n, r, o, i, a) {
                    try {
                        var u = e[i](a),
                            c = u.value
                    } catch (e) {
                        n(e);
                        return
                    }
                    u.done ? t(c) : Promise.resolve(c).then(r, o)
                }
                var a = "Avatar.AvatarExperience2",
                    u = "isAvatarBackgroundInHeadshotThumbnailsEnabled",
                    c = "AvatarHeadshot",
                    l = function() {
                        var e;
                        return null == (e = window.Roblox) ? void 0 : e.ExperimentationService
                    },
                    s = function() {
                        var e, t, n = null != (t = null == (e = window.Roblox.CurrentUser) ? void 0 : e.userId) ? t : 0;
                        return "".concat(a, "_").concat(u, "_").concat(n, "_").concat(new Date().toDateString(), "_").concat("v1")
                    },
                    f = function() {
                        return "true" === sessionStorage.getItem(s())
                    },
                    m = null,
                    h = !1,
                    d = function() {
                        if (!h) {
                            var e = l();
                            e && (h = !0, e.logLayerExposure(a))
                        }
                    },
                    b = function() {
                        if (m) return m;
                        var e, t = l();
                        if (!t) return Promise.resolve(!1);
                        var n = (e = function() {
                            var e;
                            return function(e, t) {
                                var n, r, o, i = {
                                        label: 0,
                                        sent: function() {
                                            if (1 & o[0]) throw o[1];
                                            return o[1]
                                        },
                                        trys: [],
                                        ops: []
                                    },
                                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                return a.next = u(0), a.throw = u(1), a.return = u(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                    return this
                                }), a;

                                function u(u) {
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
                            }(this, function(n) {
                                switch (n.label) {
                                    case 0:
                                        return [4, t.getAllValuesForLayer(a)];
                                    case 1:
                                        return e = !0 === n.sent()[u], sessionStorage.setItem(s(), e.toString()), [2, e]
                                }
                            })
                        }, function() {
                            var t = this,
                                n = arguments;
                            return new Promise(function(r, o) {
                                var a = e.apply(t, n);

                                function u(e) {
                                    i(a, r, o, u, c, "next", e)
                                }

                                function c(e) {
                                    i(a, r, o, u, c, "throw", e)
                                }
                                u(void 0)
                            })
                        })();
                        return n.catch(function() {
                            m = null
                        }), m = n, n
                    },
                    p = !1,
                    y = function() {
                        p || (p = !0, b().catch(function(e) {
                            console.error("Failed to prefetch avatar headshot background IXP:", e)
                        }))
                    },
                    v = function(e, t, n) {
                        return !0 === t || !1 !== t && e === c && n
                    },
                    g = function(e) {
                        var t, n = e === c,
                            i = (t = (0, r.useState)(function() {
                                return !!n && f()
                            }), function(e) {
                                if (Array.isArray(e)) return e
                            }(t) || function(e, t) {
                                var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                if (null != o) {
                                    var i = [],
                                        a = !0,
                                        u = !1;
                                    try {
                                        for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), i.length !== t); a = !0);
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
                            }(t, 2) || function(e, t) {
                                if (e) {
                                    if ("string" == typeof e) return o(e, 2);
                                    var n = Object.prototype.toString.call(e).slice(8, -1);
                                    if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return o(e, t)
                                }
                            }(t, 2) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }()),
                            a = i[0],
                            u = i[1];
                        return (0, r.useEffect)(function() {
                            if (n) {
                                var e = !0;
                                return b().then(function(t) {
                                        e && (u(t), d())
                                    }).catch(function(e) {
                                        console.error("Failed to load avatar headshot background IXP:", e)
                                    }),
                                    function() {
                                        e = !1
                                    }
                            }
                        }, [n]), a
                    }
            },
            347: function(e, t, n) {
                "use strict";
                n.d(t, {
                    l: function() {
                        return I
                    }
                });
                var r = n(971),
                    o = n.n(r),
                    i = n(93),
                    a = n.n(i)().beaconApi,
                    u = function(e) {
                        if (!e) return 0;
                        var t, n, r, o = e.split(":");
                        return (60 * parseInt(null != (t = o[0]) ? t : "", 10) * 60 + 60 * parseInt(null != (n = o[1]) ? n : "", 10) + parseInt(null != (r = o[2]) ? r : "", 10)) * 1e3
                    },
                    c = window.Roblox["core-scripts"].auth.xsrfToken;

                function l(e, t, n, r, o, i, a) {
                    try {
                        var u = e[i](a),
                            c = u.value
                    } catch (e) {
                        n(e);
                        return
                    }
                    u.done ? t(c) : Promise.resolve(c).then(r, o)
                }

                function s(e, t, n) {
                    return t in e ? Object.defineProperty(e, t, {
                        value: n,
                        enumerable: !0,
                        configurable: !0,
                        writable: !0
                    }) : e[t] = n, e
                }

                function f(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var n = null != arguments[t] ? arguments[t] : {},
                            r = Object.keys(n);
                        "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                            return Object.getOwnPropertyDescriptor(n, e).enumerable
                        }))), r.forEach(function(t) {
                            s(e, t, n[t])
                        })
                    }
                    return e
                }

                function m(e, t) {
                    return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                        var n = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            n.push.apply(n, r)
                        }
                        return n
                    })(Object(t)).forEach(function(n) {
                        Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                    }), e
                }
                var h = "X-CSRF-TOKEN",
                    d = function(e, t) {
                        var n = (0, c.getToken)(),
                            r = null != t ? t : {},
                            o = r.headers,
                            i = function(e, t) {
                                if (null == e) return {};
                                var n, r, o = function(e, t) {
                                    if (null == e) return {};
                                    var n, r, o = {},
                                        i = Object.keys(e);
                                    for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                                    return o
                                }(e, t);
                                if (Object.getOwnPropertySymbols) {
                                    var i = Object.getOwnPropertySymbols(e);
                                    for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                                }
                                return o
                            }(r, ["headers"]),
                            a = m(f({}, Object.fromEntries(new Headers(o))), s({}, h, n));
                        return fetch(e, m(f({}, i), {
                            headers: a
                        }))
                    },
                    b = function(e, t) {
                        var n;
                        return (n = function() {
                            var n, r;
                            return function(e, t) {
                                var n, r, o, i = {
                                        label: 0,
                                        sent: function() {
                                            if (1 & o[0]) throw o[1];
                                            return o[1]
                                        },
                                        trys: [],
                                        ops: []
                                    },
                                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                return a.next = u(0), a.throw = u(1), a.return = u(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                    return this
                                }), a;

                                function u(u) {
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
                            }(this, function(o) {
                                switch (o.label) {
                                    case 0:
                                        return [4, d(e, t)];
                                    case 1:
                                        if (403 !== (n = o.sent()).status || !(r = n.headers.get(h))) return [3, 3];
                                        return (0, c.setToken)(r), [4, d(e, t)];
                                    case 2:
                                        n = o.sent(), o.label = 3;
                                    case 3:
                                        return [2, n]
                                }
                            })
                        }, function() {
                            var e = this,
                                t = arguments;
                            return new Promise(function(r, o) {
                                var i = n.apply(e, t);

                                function a(e) {
                                    l(i, r, o, a, u, "next", e)
                                }

                                function u(e) {
                                    l(i, r, o, a, u, "throw", e)
                                }
                                a(void 0)
                            })
                        })()
                    };

                function p(e, t, n, r, o, i, a) {
                    try {
                        var u = e[i](a),
                            c = u.value
                    } catch (e) {
                        n(e);
                        return
                    }
                    u.done ? t(c) : Promise.resolve(c).then(r, o)
                }

                function y(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var n = null != arguments[t] ? arguments[t] : {},
                            r = Object.keys(n);
                        "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                            return Object.getOwnPropertyDescriptor(n, e).enumerable
                        }))), r.forEach(function(t) {
                            var r;
                            r = n[t], t in e ? Object.defineProperty(e, t, {
                                value: r,
                                enumerable: !0,
                                configurable: !0,
                                writable: !0
                            }) : e[t] = r
                        })
                    }
                    return e
                }
                var v = new(o()),
                    g = 0,
                    S = function() {
                        if ("undefined" == typeof document) return {};
                        var e, t = document.getElementsByName("performance")[0];
                        return t ? {
                            performanceMetricsBatchWaitTime: u(t.getAttribute("data-ui-performance-metrics-batch-wait-time")),
                            performanceMetricsBatchSize: parseInt(null != (e = t.getAttribute("data-ui-performance-metrics-batch-size")) ? e : "", 10)
                        } : {}
                    }(),
                    w = S.performanceMetricsBatchWaitTime,
                    T = S.performanceMetricsBatchSize,
                    O = v.createRequestProcessor(function(e) {
                        var t;
                        return (t = function() {
                            var t, n;
                            return function(e, t) {
                                var n, r, o, i = {
                                        label: 0,
                                        sent: function() {
                                            if (1 & o[0]) throw o[1];
                                            return o[1]
                                        },
                                        trys: [],
                                        ops: []
                                    },
                                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                return a.next = u(0), a.throw = u(1), a.return = u(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                    return this
                                }), a;

                                function u(u) {
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
                            }(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return t = e.map(function(e) {
                                            return e.data.taskId, y({}, function(e, t) {
                                                if (null == e) return {};
                                                var n, r, o = function(e, t) {
                                                    if (null == e) return {};
                                                    var n, r, o = {},
                                                        i = Object.keys(e);
                                                    for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                                                    return o
                                                }(e, t);
                                                if (Object.getOwnPropertySymbols) {
                                                    var i = Object.getOwnPropertySymbols(e);
                                                    for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                                                }
                                                return o
                                            }(e.data, ["taskId"]))
                                        }), [4, b("".concat(a, "/v1/measurements"), {
                                            method: "POST",
                                            headers: {
                                                "Content-Type": "application/json"
                                            },
                                            keepalive: !0,
                                            body: JSON.stringify(t)
                                        })];
                                    case 1:
                                        return r.sent(), n = {}, e.forEach(function(e) {
                                            n[e.key] = !0
                                        }), [2, n]
                                }
                            })
                        }, function() {
                            var e = this,
                                n = arguments;
                            return new Promise(function(r, o) {
                                var i = t.apply(e, n);

                                function a(e) {
                                    p(i, r, o, a, u, "next", e)
                                }

                                function u(e) {
                                    p(i, r, o, a, u, "throw", e)
                                }
                                a(void 0)
                            })
                        })()
                    }, function(e) {
                        var t, n = e.taskId;
                        return null != (t = null == n ? void 0 : n.toString()) ? t : ""
                    }, {
                        getFailureCooldown: v.createExponentialBackoffCooldown(1e3, 3e3),
                        maxRetryAttempts: 5,
                        batchSize: null != T ? T : 100,
                        processBatchWaitTime: null != w ? w : 1e3
                    }),
                    I = function(e, t) {
                        var n = g;
                        g += 1;
                        var r = {
                            metricName: e,
                            jsonData: JSON.stringify(t)
                        };
                        return O.queueItem(y({
                            taskId: n
                        }, r))
                    }
            },
            392: function(e, t, n) {
                "use strict";
                n.r(t), n.d(t, {
                    getCssClass: function() {
                        return h
                    },
                    getThumbnailImage: function() {
                        return f
                    },
                    peekThumbnailImage: function() {
                        return d
                    },
                    reloadThumbnailImage: function() {
                        return m
                    }
                });
                var r, o = n(950),
                    i = n(464),
                    a = n(384),
                    u = n(517),
                    c = new Map,
                    l = function(e, t, n, r, o, i, a, u) {
                        var c = arguments.length > 8 && void 0 !== arguments[8] && arguments[8];
                        return [e, t, n, null != r ? r : "", null != o ? o : "", null != i ? i : "", null != a ? a : "", u ? "bg" : "", c ? "frame" : ""].join(":")
                    },
                    s = function(e, t) {
                        var n, s = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : u.Ul.webp,
                            f = arguments.length > 3 ? arguments[3] : void 0,
                            m = arguments.length > 4 ? arguments[4] : void 0,
                            h = arguments.length > 5 ? arguments[5] : void 0,
                            d = arguments.length > 6 ? arguments[6] : void 0,
                            b = arguments.length > 7 ? arguments[7] : void 0,
                            p = arguments.length > 8 ? arguments[8] : void 0,
                            y = arguments.length > 9 && void 0 !== arguments[9] && arguments[9];
                        if (!f && !m) return new Promise(function(e, t) {
                            t(Error("TargetId or token can not be empty."))
                        });
                        if (!e) return new Promise(function(e, t) {
                            t(Error("ThumbnailType can not be empty."))
                        });
                        null != s || (s = u.Ul.webp);
                        var v = s;
                        (e === u.uS.gameIcon || e === u.uS.gameThumbnail || e === u.uS.placeGameIcon || e === u.uS.universeThumbnail) && (v = u.Ul.webp), e === u.uS.avatarHeadshot && void 0 === p && (0, a.ez)();
                        var g = (0, a.st)(e, p, (0, a.FP)());
                        return ((n = v) !== u.Ul.webp ? Promise.resolve(n) : (void 0 === r && (r = new Promise(function(e) {
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
                            return e ? u.Ul.webp : u.Ul.png
                        })).then(function(n) {
                            var r = function(e) {
                                    for (var t = 1; t < arguments.length; t++) {
                                        var n = null != arguments[t] ? arguments[t] : {},
                                            r = Object.keys(n);
                                        "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                            return Object.getOwnPropertyDescriptor(n, e).enumerable
                                        }))), r.forEach(function(t) {
                                            var r;
                                            r = n[t], t in e ? Object.defineProperty(e, t, {
                                                value: r,
                                                enumerable: !0,
                                                configurable: !0,
                                                writable: !0
                                            }) : e[t] = r
                                        })
                                    }
                                    return e
                                }({
                                    targetId: f,
                                    token: m,
                                    type: e,
                                    format: n,
                                    size: t,
                                    version: d,
                                    headShape: b
                                }, g ? {
                                    includeBackground: !0
                                } : {}, y ? {
                                    includeProfileFrame: y
                                } : {}),
                                a = [u.uS.universeThumbnails, u.uS.universeThumbnail].includes(e) ? "universeThumbnailProcessor" : "thumbnail2dProcessor";
                            return o.W8.processThumbnailBatchRequest(r, function(t) {
                                return e === u.uS.universeThumbnail ? i.yB.handle(t, 1) : e === u.uS.universeThumbnails ? i.yB.handle(t, 10) : i.u_.handle(t)
                            }, a, h).then(function(n) {
                                var r = null == n ? void 0 : n.thumbnail;
                                return (null == r ? void 0 : r.state) === u.xc.complete && r.imageUrl && c.set(l(e, t, s, f, m, d, b, p, y), {
                                    state: r.state,
                                    imageUrl: r.imageUrl
                                }), n
                            })
                        })
                    },
                    f = function(e, t) {
                        var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : u.Ul.webp,
                            r = arguments.length > 3 ? arguments[3] : void 0,
                            o = arguments.length > 4 ? arguments[4] : void 0,
                            i = arguments.length > 5 ? arguments[5] : void 0,
                            a = arguments.length > 6 ? arguments[6] : void 0,
                            c = arguments.length > 7 ? arguments[7] : void 0,
                            l = arguments.length > 8 && void 0 !== arguments[8] && arguments[8];
                        return s(e, t, n, r, o, !1, i, a, c, l)
                    },
                    m = function(e, t) {
                        var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : u.Ul.webp,
                            r = arguments.length > 3 ? arguments[3] : void 0,
                            o = arguments.length > 4 ? arguments[4] : void 0,
                            i = arguments.length > 5 ? arguments[5] : void 0,
                            a = arguments.length > 6 ? arguments[6] : void 0,
                            c = arguments.length > 7 ? arguments[7] : void 0,
                            l = arguments.length > 8 && void 0 !== arguments[8] && arguments[8];
                        return s(e, t, n, r, o, !0, i, a, c, l)
                    },
                    h = function(e) {
                        return {
                            "icon-broken": e === u.xc.error,
                            "icon-in-review": e === u.xc.inReview,
                            "icon-blocked": e === u.xc.blocked,
                            "icon-pending": e === u.xc.pending
                        }
                    },
                    d = function(e, t) {
                        var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : u.Ul.webp,
                            r = arguments.length > 3 ? arguments[3] : void 0,
                            o = arguments.length > 4 ? arguments[4] : void 0,
                            i = arguments.length > 5 ? arguments[5] : void 0,
                            a = arguments.length > 6 ? arguments[6] : void 0,
                            s = arguments.length > 7 ? arguments[7] : void 0,
                            f = arguments.length > 8 && void 0 !== arguments[8] && arguments[8];
                        return c.get(l(e, t, n, r, o, i, a, s, f))
                    }
            },
            464: function(e, t, n) {
                "use strict";
                n.d(t, {
                    u_: function() {
                        return m
                    },
                    XY: function() {
                        return f
                    },
                    yB: function() {
                        return h
                    }
                });
                var r = window.Roblox["core-scripts"].dataStore,
                    o = n.n(r),
                    i = n(110),
                    a = n(517);

                function u(e, t, n) {
                    return t in e ? Object.defineProperty(e, t, {
                        value: n,
                        enumerable: !0,
                        configurable: !0,
                        writable: !0
                    }) : e[t] = n, e
                }

                function c(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var n = null != arguments[t] ? arguments[t] : {},
                            r = Object.keys(n);
                        "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                            return Object.getOwnPropertyDescriptor(n, e).enumerable
                        }))), r.forEach(function(t) {
                            u(e, t, n[t])
                        })
                    }
                    return e
                }
                var l = o().thumbnailsDataStore,
                    s = o().gameThumbnailsDataStore,
                    f = function() {
                        var e;

                        function t(e, n, r, o, i) {
                            if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                            u(this, "storeInstance", void 0), u(this, "keySetter", void 0), u(this, "keyGetter", void 0), u(this, "validator", void 0), u(this, "resultSetter", void 0), this.storeInstance = e, this.keySetter = n, this.keyGetter = r, this.validator = o, this.resultSetter = i
                        }
                        return e = [{
                                key: "handle",
                                value: function(e, t) {
                                    var n = this;
                                    return new Promise(function(r) {
                                        n.storeInstance(e, t).then(function(o) {
                                            var i, u, l = new Map,
                                                s = {};
                                            (null != (u = null == o || null == (i = o.data) ? void 0 : i.data) ? u : []).forEach(function(e) {
                                                l.set(n.keySetter(e), e)
                                            }), e.forEach(function(e) {
                                                var r, o, i, u = n.keyGetter(e);
                                                if (l.has(u)) {
                                                    var f = l.get(u);
                                                    f && n.validator(f) && (s[u] = n.resultSetter(f, t))
                                                } else i = t && t > 1 ? {
                                                    thumbnails: []
                                                } : {
                                                    thumbnail: {
                                                        targetId: u,
                                                        state: a.xc.error
                                                    }
                                                }, s[u] = (r = c({}, i), o = o = {
                                                    errorcode: 3,
                                                    errorMessage: "id doesn't exist"
                                                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(o)) : (function(e, t) {
                                                    var n = Object.keys(e);
                                                    if (Object.getOwnPropertySymbols) {
                                                        var r = Object.getOwnPropertySymbols(e);
                                                        n.push.apply(n, r)
                                                    }
                                                    return n
                                                })(Object(o)).forEach(function(e) {
                                                    Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(o, e))
                                                }), r)
                                            }), r(s)
                                        }).catch(function(e) {
                                            (null == e ? void 0 : e.status) !== 503 && r({})
                                        })
                                    })
                                }
                            }],
                            function(e, t) {
                                for (var n = 0; n < t.length; n++) {
                                    var r = t[n];
                                    r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
                                }
                            }(t.prototype, e), t
                    }(),
                    m = new f(function(e) {
                        var t = e.map(function(e) {
                            var t = e.data.type,
                                n = e.key,
                                r = function(e, t) {
                                    if (null == e) return {};
                                    var n, r, o = function(e, t) {
                                        if (null == e) return {};
                                        var n, r, o = {},
                                            i = Object.keys(e);
                                        for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                                        return o
                                    }(e, t);
                                    if (Object.getOwnPropertySymbols) {
                                        var i = Object.getOwnPropertySymbols(e);
                                        for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                                    }
                                    return o
                                }(e.data, ["type"]);
                            return c({
                                requestId: n,
                                type: (0, i.JS)(t)
                            }, r)
                        });
                        return new Promise(function(e, n) {
                            l.getBatchThumbnails(t).then(e).catch(n)
                        })
                    }, function(e) {
                        var t;
                        return null != (t = e.requestId) ? t : ""
                    }, function(e) {
                        return e.key
                    }, function(e) {
                        return e.state !== a.xc.pending
                    }, function(e) {
                        return {
                            thumbnail: e
                        }
                    }),
                    h = new f(function(e, t) {
                        return new Promise(function(n, r) {
                            var o, i, a;
                            s.getAllUniverseThumbnails(e.map(function(e) {
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
            950: function(e, t, n) {
                "use strict";
                n.d(t, {
                    r6: function() {
                        return l
                    },
                    W8: function() {
                        return f
                    }
                });
                var r = n(971),
                    o = n.n(r),
                    i = n(347),
                    a = n(517),
                    u = n(110);

                function c(e, t, n) {
                    return t in e ? Object.defineProperty(e, t, {
                        value: n,
                        enumerable: !0,
                        configurable: !0,
                        writable: !0
                    }) : e[t] = n, e
                }
                var l = function() {
                    var e;

                    function t(e, n) {
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                        c(this, "batchRequestFactory", void 0), c(this, "thumbnailProcessorKeySerializer", void 0), c(this, "thumbnailItemIdSerializer", void 0), c(this, "thumbnailRequesters", {}), this.batchRequestFactory = new(o()), this.thumbnailItemIdSerializer = e, this.thumbnailProcessorKeySerializer = n
                    }
                    return e = [{
                            key: "getThumbnailRequesterProperties",
                            value: function(e) {
                                return e ? {
                                    getFailureCooldown: this.batchRequestFactory.createExponentialBackoffCooldown(e.requestMinCooldown, e.requestMaxCooldown),
                                    maxRetryAttempts: e.requestMaxRetryAttempts,
                                    batchSize: e.requestBatchSize,
                                    concurrentRequestCount: e.concurrentThumbnailRequestCount,
                                    processBatchWaitTime: 1e3
                                } : {
                                    getFailureCooldown: this.batchRequestFactory.createExponentialBackoffCooldown(a.Mi.minCooldown, a.Mi.maxCooldown),
                                    maxRetryAttempts: a.Mi.maxRetryAttempts,
                                    batchSize: a.XC
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
                                var n, r, o, c, l, s, f, m, h, d = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : this.thumbnailProcessorKeySerializer(e),
                                    b = arguments.length > 3 ? arguments[3] : void 0,
                                    p = e.type,
                                    y = void 0 === p ? "custom" : p,
                                    v = (h = null == (n = document.getElementsByName("thumbnail-meta-data")[0]) ? void 0 : n.dataset) ? {
                                        thumbnailMetricsSampleSize: parseInt(null != (r = h.thumbnailMetricsSampleSize) ? r : "", 10),
                                        isWebappUseCacheEnabled: "True" === h.isWebappCacheEnabled,
                                        webappCacheExpirationTimespan: null != (o = h.webappCacheExpirationsTimespan) ? o : "",
                                        requestMinCooldown: parseInt(null != (c = h.requestMinCooldown) ? c : "", 10),
                                        requestMaxCooldown: parseInt(null != (l = h.requestMaxCooldown) ? l : "", 10),
                                        requestMaxRetryAttempts: parseInt(null != (s = h.requestMaxRetryAttempts) ? s : "", 10),
                                        requestBatchSize: parseInt(null != (f = h.requestBatchSize) ? f : "", 10),
                                        concurrentThumbnailRequestCount: parseInt(null != (m = h.concurrentThumbnailRequestCount) ? m : "", 10)
                                    } : a.x$,
                                    g = this.getThumbnailRequester(t, d, v);
                                b && g.invalidateItem(e);
                                var S = (0, u.$E)(v);
                                return g.queueItem(e, void 0, S).then(function(e) {
                                    if (e.performance && (0, u.rv)(v)) {
                                        var t = e.thumbnails,
                                            n = e.thumbnail,
                                            r = function(e) {
                                                (0, i.l)("ThumbnailStatusCountWebapp", {
                                                    ThumbnailType: "".concat(y, "_2d"),
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
                                    }), (0, u.rv)(v) && e === a.o0.maxAttemptsReached && (0, i.l)("ThumbnailTimeoutWebapp", {
                                        ThumbnailType: "".concat(y, "_2d")
                                    }).catch(function(e) {
                                        console.error(e)
                                    }), Promise.reject(e)
                                })
                            }
                        }],
                        function(e, t) {
                            for (var n = 0; n < t.length; n++) {
                                var r = t[n];
                                r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
                            }
                        }(t.prototype, e), t
                }();

                function s(e) {
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
                var f = new l(function(e) {
                    var t = e.type,
                        n = e.targetId;
                    return t === a.uS.universeThumbnail || t === a.uS.universeThumbnails ? (void 0 === n ? 0 : n).toString() : s(e)
                }, s);
                new l(function(e) {
                    return e.key
                }, function() {
                    return "customThumbnailRequester"
                })
            },
            110: function(e, t, n) {
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
                var r, o = n(517);

                function i(e, t) {
                    (null == t || t > e.length) && (t = e.length);
                    for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                    return r
                }

                function a(e, t, n) {
                    return t in e ? Object.defineProperty(e, t, {
                        value: n,
                        enumerable: !0,
                        configurable: !0,
                        writable: !0
                    }) : e[t] = n, e
                }
                var u = (a(r = {}, o.uS.avatar, o.JF.Avatar), a(r, o.uS.avatarHeadshot, o.JF.AvatarHeadShot), a(r, o.uS.gameIcon, o.JF.GameIcon), a(r, o.uS.badgeIcon, o.JF.BadgeIcon), a(r, o.uS.gamePassIcon, o.JF.GamePass), a(r, o.uS.assetThumbnail, o.JF.Asset), a(r, o.uS.bundleThumbnail, o.JF.BundleThumbnail), a(r, o.uS.userOutfit, o.JF.Outfit), a(r, o.uS.groupIcon, o.JF.GroupIcon), a(r, o.uS.placeGameIcon, o.JF.PlaceIcon), a(r, o.uS.developerProductIcon, o.JF.DeveloperProduct), a(r, o.uS.gameThumbnail, o.JF.GameThumbnail), a(r, o.uS.lookThumbnail, o.JF.LookThumbnail), a(r, o.uS.screenshot, o.JF.Screenshot), r);

                function c(e) {
                    return u[e]
                }

                function l(e) {
                    if (e) {
                        var t, n, r, o, a;
                        return {
                            useCache: e.isWebappUseCacheEnabled,
                            expirationWindowMS: (r = (t = e.webappCacheExpirationTimespan.split(":"), n = function(e) {
                                if (Array.isArray(e)) return e
                            }(t) || function(e, t) {
                                var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                if (null != o) {
                                    var i = [],
                                        a = !0,
                                        u = !1;
                                    try {
                                        for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), i.length !== t); a = !0);
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
                            }(t, 3) || function(e, t) {
                                if (e) {
                                    if ("string" == typeof e) return i(e, 3);
                                    var n = Object.prototype.toString.call(e).slice(8, -1);
                                    if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return i(e, t)
                                }
                            }(t, 3) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }())[0], o = n[1], a = n[2], void 0 === r || void 0 === o || void 0 === a ? NaN : (60 * parseInt(r, 10) * 60 + 60 * parseInt(o, 10) + parseInt(a, 10)) * 1e3)
                        }
                    }
                }

                function s(e) {
                    return !e || Math.floor(100 * Math.random()) <= e.thumbnailMetricsSampleSize
                }
            },
            452: function(e, t, n) {
                "use strict";
                e.exports = {}
            },
            609: function(e) {
                "use strict";
                e.exports = window.React
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
    }, n.k = function(e) {
        return "" + e + ".css"
    }, n.g = function() {
        if ("object" == typeof globalThis) return globalThis;
        try {
            return this || Function("return this")()
        } catch (e) {
            if ("object" == typeof window) return window
        }
    }(), n.o = function(e, t) {
        return Object.prototype.hasOwnProperty.call(e, t)
    }, n.r = function(e) {
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, n.rv = function() {
        return "1.5.7"
    }, n.g.importScripts && (r = n.g.location + "");
    var r, o = n.g.document;
    if (!r && o && (o.currentScript && "SCRIPT" === o.currentScript.tagName.toUpperCase() && (r = o.currentScript.src), !r)) {
        var i = o.getElementsByTagName("script");
        if (i.length)
            for (var a = i.length - 1; a > -1 && (!r || !/^http(s?):/.test(r));) r = i[a--].src
    }
    if (!r) throw Error("Automatic publicPath is not supported in this browser");
    n.p = r.replace(/^blob:/, "").replace(/#.*$/, "").replace(/\?.*$/, "").replace(/\/[^\/]+$/, "/"), n.ruid = "bundler=rspack@1.5.7",
        function() {
            "use strict";
            var e, t = {};
            n.r(t), n.d(t, {
                AVATAR_HEADSHOT_BACKGROUND_EXPERIMENT_KEY: function() {
                    return g.mt
                },
                AVATAR_HEADSHOT_BACKGROUND_LAYER: function() {
                    return g.Kp
                },
                BatchRequestError: function() {
                    return v.o0
                },
                DEFAULT_META_DATA: function() {
                    return v.x$
                },
                DefaultBatchSize: function() {
                    return v.XC
                },
                DefaultThumbnailFormat: function() {
                    return v.R2
                },
                DefaultThumbnailSize: function() {
                    return v.F5
                },
                FeatureName: function() {
                    return v.SD
                },
                LoadFailureMetricsType: function() {
                    return v.MU
                },
                LoadFailureName: function() {
                    return v.cu
                },
                LoadRetrySuccessName: function() {
                    return v.tb
                },
                LoadSuccessMetricsType: function() {
                    return v.dS
                },
                LoadSuccessName: function() {
                    return v.DS
                },
                RetryPerThumbnailType: function() {
                    return v.EX
                },
                ReturnPolicy: function() {
                    return v.TP
                },
                RobloxThumbnailsApisModelsThumbnailBatchRequestTypeEnum: function() {
                    return v.JF
                },
                Thumbnail2d: function() {
                    return C
                },
                Thumbnail2dCarouselContainer: function() {
                    return E
                },
                ThumbnailAssetsSize: function() {
                    return v.Tm
                },
                ThumbnailAvatarHeadshotSize: function() {
                    return v.jZ
                },
                ThumbnailAvatarsSize: function() {
                    return v.qh
                },
                ThumbnailBadgeIconSize: function() {
                    return v.S3
                },
                ThumbnailCooldown: function() {
                    return v.Mi
                },
                ThumbnailDeveloperProductIconSize: function() {
                    return v.s2
                },
                ThumbnailFormat: function() {
                    return v.Ul
                },
                ThumbnailGameIconSize: function() {
                    return v.fP
                },
                ThumbnailGamePassIconSize: function() {
                    return v.Ou
                },
                ThumbnailGameThumbnailSize: function() {
                    return v.SH
                },
                ThumbnailGroupIconSize: function() {
                    return v.wu
                },
                ThumbnailMetadataUrl: function() {
                    return v.Pq
                },
                ThumbnailStates: function() {
                    return v.xc
                },
                ThumbnailTypes: function() {
                    return v.uS
                },
                ThumbnailUniverseThumbnailSize: function() {
                    return v.lo
                },
                prefetchAvatarHeadshotBackgroundExperiment: function() {
                    return g.ez
                },
                thumbnailService: function() {
                    return b
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
                c = window.ReactJSX,
                l = n(609),
                s = n(147),
                f = n.n(s),
                m = window.PropTypes,
                h = n.n(m),
                d = n(347),
                b = n(392),
                p = n(950),
                y = n(464),
                v = n(517),
                g = n(384);

            function S(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function w(e) {
                var t, n = e.onLoad,
                    r = e.errorIconClass,
                    o = e.thumbnailUrl,
                    i = e.imgClassName,
                    a = e.containerClass,
                    u = e.altName,
                    s = f()("thumbnail-2d-container", r, a),
                    m = (t = (0, l.useState)(f()(i, "loading")), function(e) {
                        if (Array.isArray(e)) return e
                    }(t) || function(e, t) {
                        var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != o) {
                            var i = [],
                                a = !0,
                                u = !1;
                            try {
                                for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), i.length !== t); a = !0);
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
                    }(t, 2) || function(e, t) {
                        if (e) {
                            if ("string" == typeof e) return S(e, 2);
                            var n = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                            if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return S(e, t)
                        }
                    }(t, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    h = m[0],
                    d = m[1];
                return (0, l.useEffect)(function() {
                    null === o && d(f()(i, "loading"))
                }, [o, i]), (0, c.jsx)("span", {
                    className: s,
                    children: o && (0, c.jsx)("img", {
                        className: h,
                        src: o,
                        alt: u,
                        onLoad: function() {
                            n(), d(i)
                        }
                    })
                })
            }

            function T(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function O(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function I(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
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
                        if ("string" == typeof e) return T(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return T(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            w.defaultProps = {
                errorIconClass: "",
                thumbnailUrl: "",
                imgClassName: "",
                containerClass: "",
                altName: "",
                onLoad: function() {}
            }, w.propTypes = {
                errorIconClass: h().string,
                thumbnailUrl: h().string,
                imgClassName: h().string,
                containerClass: h().string,
                altName: h().string,
                onLoad: h().func
            };
            var A = new p.r6(function(e) {
                return e.targetId
            }, function() {
                return "customThumbnailRequester"
            });

            function x(e) {
                var t, n, r = e.type,
                    o = e.targetId,
                    i = e.token,
                    a = e.size,
                    u = e.imgClassName,
                    s = e.containerClass,
                    m = e.format,
                    h = e.altName,
                    p = e.onLoad,
                    S = e.getThumbnail,
                    T = e.version,
                    x = e.headShape,
                    C = e.includeBackground,
                    P = e.includeProfileFrame,
                    j = e.seedFromCache,
                    k = I((0, l.useState)(new Date().getTime()), 1)[0],
                    E = (0, g.G4)(r),
                    R = (0, g.st)(r, C, E),
                    z = I((0, l.useState)(function() {
                        return j ? b.peekThumbnailImage(r, a, m, o, i, T, x, R, P) : void 0
                    }), 1)[0],
                    D = (0, l.useRef)(!!z),
                    U = I((0, l.useState)(null != (t = null == z ? void 0 : z.state) ? t : null), 2),
                    F = U[0],
                    N = U[1],
                    q = I((0, l.useState)(null != (n = null == z ? void 0 : z.imageUrl) ? n : null), 2),
                    M = q[0],
                    $ = q[1],
                    L = f()(b.getCssClass(F)),
                    B = I((0, l.useState)(z ? "" : "shimmer"), 2),
                    _ = B[0],
                    G = B[1],
                    W = I((0, l.useState)(null), 2),
                    H = W[0],
                    J = W[1],
                    V = (0, l.useMemo)(function() {
                        return new y.XY(function() {
                            return new Promise(function(e, t) {
                                S().then(function(t) {
                                    var n, r;
                                    e({
                                        data: {
                                            data: [(n = O({}, t.data), r = r = {
                                                targetId: o
                                            }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(r)) : (function(e, t) {
                                                var n = Object.keys(e);
                                                if (Object.getOwnPropertySymbols) {
                                                    var r = Object.getOwnPropertySymbols(e);
                                                    n.push.apply(n, r)
                                                }
                                                return n
                                            })(Object(r)).forEach(function(e) {
                                                Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(r, e))
                                            }), n)]
                                        }
                                    })
                                }).catch(t)
                            })
                        }, function(e) {
                            return e.targetId
                        }, function(e) {
                            return e.key
                        }, function(e) {
                            return e.state !== v.xc.pending
                        }, function(e) {
                            return {
                                thumbnail: e
                            }
                        })
                    }, [o, S]),
                    X = (0, l.useCallback)(function() {
                        if (H) {
                            var e = new Date().getTime() - k,
                                t = H.retryAttempts;
                            (0, d.l)("ThumbnailLoadDurationWebapp", {
                                Status: "Success",
                                ThumbnailType: "".concat(r, "_2d"),
                                Value: e.toString()
                            }).catch(function(e) {
                                console.error(e)
                            }), t ? (0, d.l)("ThumbnailRetryWebapp", {
                                ThumbnailType: "".concat(r, "_2d"),
                                Value: t.toString()
                            }).catch(function(e) {
                                console.error(e)
                            }) : (0, d.l)("ThumbnailNoRetrySuccessWebapp", {
                                ThumbnailType: "".concat(r, "_2d")
                            }).catch(function(e) {
                                console.error(e)
                            })
                        }
                        p && p()
                    }, [H]);
                return (0, l.useEffect)(function() {
                    D.current ? D.current = !1 : (G("shimmer"), N(null), $(null));
                    var e = !1,
                        t = b.getThumbnailImage(r, a, m, o, i, T, x, R, P);
                    return S && (t = A.processThumbnailBatchRequest({
                            targetId: o,
                            type: r
                        }, function(e) {
                            return V.handle(e)
                        }, o)), t.then(function(t) {
                            var n = t.thumbnail,
                                r = n.state,
                                o = n.imageUrl,
                                i = t.performance;
                            !e && (N(r), $(o), G(""), i && J(O({}, i)))
                        }).catch(function(t) {
                            console.error(t), e || G("")
                        }),
                        function() {
                            e = !0
                        }
                }, [r, o, i, a, u, S, T, x, R, P]), (0, c.jsx)(w, {
                    thumbnailUrl: M,
                    errorIconClass: L,
                    imgClassName: u,
                    altName: h,
                    onLoad: X,
                    containerClass: f()(_, s)
                })
            }
            x.defaultProps = {
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
            }, x.propTypes = {
                type: h().string.isRequired,
                targetId: h().number,
                token: h().string,
                size: h().string,
                format: h().string,
                imgClassName: h().string,
                containerClass: h().string,
                altName: h().string,
                onLoad: h().func,
                getThumbnail: h().func,
                version: h().string,
                headShape: h().string,
                includeBackground: h().bool,
                includeProfileFrame: h().bool,
                seedFromCache: h().bool
            };
            var C = x;

            function P(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function j(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, o = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
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
                        if ("string" == typeof e) return P(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return P(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function k(e) {
                var t = e.type,
                    n = e.targetId,
                    r = e.size,
                    o = e.imgClassName,
                    i = e.containerClass,
                    a = e.format,
                    u = e.altName,
                    s = j((0, l.useState)(null), 2),
                    m = s[0],
                    h = s[1],
                    d = j((0, l.useState)(null), 2),
                    p = d[0],
                    y = d[1],
                    v = j((0, l.useState)(null), 2),
                    g = v[0],
                    S = v[1],
                    T = j((0, l.useState)("shimmer"), 2),
                    O = T[0],
                    I = T[1],
                    A = j((0, l.useState)(0), 2),
                    x = A[0],
                    C = A[1],
                    P = function() {
                        C(x >= m.length - 1 ? 0 : x + 1)
                    };
                return (0, l.useEffect)(function() {
                    var e;
                    if (m) {
                        var t = m[x];
                        y(t.state), S(t.imageUrl), I(""), e = setInterval(function() {
                            return P()
                        }, 4e3)
                    }
                    return function() {
                        clearInterval(e)
                    }
                }, [m, x]), (0, l.useEffect)(function() {
                    var e = !1;
                    return b.getThumbnailImage(t, r, a, n).then(function(t) {
                            e || h(t.thumbnails)
                        }).catch(function() {
                            e || I("")
                        }),
                        function() {
                            e = !0
                        }
                }, [t, n, r, o, a]), (0, c.jsx)(w, {
                    thumbnailUrl: g,
                    errorIconClass: f()(b.getCssClass(p)),
                    imgClassName: o,
                    altName: u,
                    containerClass: f()(O, i)
                })
            }
            k.defaultProps = {
                size: "576x324",
                imgClassName: "",
                containerClass: "",
                format: "webp",
                altName: ""
            }, k.propTypes = {
                type: h().string.isRequired,
                targetId: h().number.isRequired,
                size: h().string,
                format: h().string,
                imgClassName: h().string,
                containerClass: h().string,
                altName: h().string
            };
            var E = k;
            n(452), o().module("angularLazyImg", []).factory("LazyImgMagic", ["$window", "$rootScope", "lazyImgConfig", "lazyImgHelpers", function(e, t, n, r) {
                    var i, a, u, c, l, s, f, m;

                    function h() {
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

                    function d(e) {
                        m.forEach(function(t) {
                            t[e]("scroll", s), t[e]("touchmove", s)
                        }), a[e]("resize", s), a[e]("resize", f)
                    }

                    function b() {
                        c = !0, setTimeout(function() {
                            h(), d("on")
                        }, 1)
                    }

                    function p() {
                        c = !1, d("off")
                    }

                    function y(e) {
                        e.addClass(l.loadingClass), this.$elem = e
                    }
                    return u = [], c = !1, l = n.getOptions(), a = o().element(e), i = r.getWinDimensions(), f = r.throttle(function() {
                        i = r.getWinDimensions()
                    }, 60), m = [l.container || a], s = r.throttle(h, 30), y.prototype.setSource = function(e) {
                        this.src = e, u.unshift(this), c || b()
                    }, y.prototype.removeImage = function() {
                        var e; - 1 !== (e = u.indexOf(this)) && u.splice(e, 1), 0 === u.length && p()
                    }, y.prototype.checkImages = function() {
                        h()
                    }, y.addContainer = function(e) {
                        p(), m.push(e), b()
                    }, y.removeContainer = function(e) {
                        p(), m.splice(m.indexOf(e), 1), b()
                    }, y
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
                }]), n(569),
                function(e, t) {
                    var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : window;
                    if ("string" == typeof e) n[e] = t;
                    else {
                        var r, o = function(e) {
                                if (Array.isArray(e)) return a(e)
                            }(e) || function(e) {
                                if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                            }(e) || i(e) || function() {
                                throw TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }(),
                            u = o.pop(),
                            c = n,
                            l = function(e, t) {
                                var n = "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                if (!n) {
                                    if (Array.isArray(e) || (n = i(e))) {
                                        n && (e = n);
                                        var r = 0,
                                            o = function() {};
                                        return {
                                            s: o,
                                            n: function() {
                                                return r >= e.length ? {
                                                    done: !0
                                                } : {
                                                    done: !1,
                                                    value: e[r++]
                                                }
                                            },
                                            e: function(e) {
                                                throw e
                                            },
                                            f: o
                                        }
                                    }
                                    throw TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }
                                var a, u = !0,
                                    c = !1;
                                return {
                                    s: function() {
                                        n = n.call(e)
                                    },
                                    n: function() {
                                        var e = n.next();
                                        return u = e.done, e
                                    },
                                    e: function(e) {
                                        c = !0, a = e
                                    },
                                    f: function() {
                                        try {
                                            u || null == n.return || n.return()
                                        } finally {
                                            if (c) throw a
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
                }("RobloxThumbnails", t), u(n(631)), u(n(916)), u(n(316)), u(n(281)), u(n(87));
            var R = n(892);
            e = o(), e.module("thumbnailsTemplates", []).run(["$templateCache", function(e) {
                R && R.keys().forEach(function(t) {
                    var n = t.split("/").pop().replace(".html", "").replace(/([a-z])([A-Z])/g, "$1-$2").toLowerCase();
                    e.put(n, R(t))
                })
            }])
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("Thumbnails");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/thumbnails-a58320d6b7415cec.js.map