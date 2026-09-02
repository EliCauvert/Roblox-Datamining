! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "2a7364b527113c9cab957abb53ba29b26cc7da03"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "7f54ef22-7ea7-424e-a402-81755cb07058", e._sentryDebugIdIdentifier = "sentry-dbid-7f54ef22-7ea7-424e-a402-81755cb07058")
    } catch (e) {}
}(),
function() {
    var e = {
            545: function(e, t, n) {
                var r = {
                    "./2dThumbnailComponent.js": "175"
                };

                function o(e) {
                    return n(a(e))
                }

                function a(e) {
                    if (!n.o(r, e)) {
                        var t = Error("Cannot find module '" + e + "'");
                        throw t.code = "MODULE_NOT_FOUND", t
                    }
                    return r[e]
                }
                o.keys = function() {
                    return Object.keys(r)
                }, o.resolve = a, e.exports = o, o.id = 545
            },
            966: function(e, t, n) {
                var r = {
                    "./thumbnailConstants.js": "300"
                };

                function o(e) {
                    return n(a(e))
                }

                function a(e) {
                    if (!n.o(r, e)) {
                        var t = Error("Cannot find module '" + e + "'");
                        throw t.code = "MODULE_NOT_FOUND", t
                    }
                    return r[e]
                }
                o.keys = function() {
                    return Object.keys(r)
                }, o.resolve = a, e.exports = o, o.id = 966
            },
            254: function(e, t, n) {
                var r = {
                    "./2dThumbnailController.js": "495"
                };

                function o(e) {
                    return n(a(e))
                }

                function a(e) {
                    if (!n.o(r, e)) {
                        var t = Error("Cannot find module '" + e + "'");
                        throw t.code = "MODULE_NOT_FOUND", t
                    }
                    return r[e]
                }
                o.keys = function() {
                    return Object.keys(r)
                }, o.resolve = a, e.exports = o, o.id = 254
            },
            771: function(e, t, n) {
                var r = {
                    "./imageLoadDirective.js": "694",
                    "./thumbnailErrorDirective.js": "137"
                };

                function o(e) {
                    return n(a(e))
                }

                function a(e) {
                    if (!n.o(r, e)) {
                        var t = Error("Cannot find module '" + e + "'");
                        throw t.code = "MODULE_NOT_FOUND", t
                    }
                    return r[e]
                }
                o.keys = function() {
                    return Object.keys(r)
                }, o.resolve = a, e.exports = o, o.id = 771
            },
            185: function(e, t, n) {
                var r = {
                    "./thumbnailService.js": "829"
                };

                function o(e) {
                    return n(a(e))
                }

                function a(e) {
                    if (!n.o(r, e)) {
                        var t = Error("Cannot find module '" + e + "'");
                        throw t.code = "MODULE_NOT_FOUND", t
                    }
                    return r[e]
                }
                o.keys = function() {
                    return Object.keys(r)
                }, o.resolve = a, e.exports = o, o.id = 185
            },
            902: function(e, t, n) {
                var r = {
                    "./components/templates/2dThumbnail.html": "145"
                };

                function o(e) {
                    return n(a(e))
                }

                function a(e) {
                    if (!n.o(r, e)) {
                        var t = Error("Cannot find module '" + e + "'");
                        throw t.code = "MODULE_NOT_FOUND", t
                    }
                    return r[e]
                }
                o.keys = function() {
                    return Object.keys(r)
                }, o.resolve = a, e.exports = o, o.id = 902
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
                    a = {
                        thumbnailTypes: r.uS,
                        thumbnailStates: r.xc,
                        formats: r.Ul,
                        avatarHeadshotSize: r.jZ,
                        gameIconSize: r.fP,
                        thumbnailAvatarsSize: r.qh
                    };
                o.A.constant("thumbnailConstants", a), t.default = a
            },
            495: function(e, t, n) {
                "use strict";
                n.r(t);
                var r = n(932),
                    o = n(954),
                    a = n(134);

                function i(e, t) {
                    var n = this,
                        a = "",
                        i = o.xc;
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
                        if (n.startTime = new Date().getTime(), a !== c) {
                            a = c, n.thumbnailState = i.loading;
                            var l = (null == (e = n.thumbnailOptions) ? void 0 : e.size) || o.F5,
                                s = (null == (r = n.thumbnailOptions) ? void 0 : r.format) || o.R2,
                                f = null == (u = n.thumbnailOptions) ? void 0 : u.includeProfileFrame;
                            n.isThumbnailRequestSending = !0, t.getThumbnailImage(n.thumbnailType, n.thumbnailTargetId, l, s, f).then(function(e) {
                                var t = e.thumbnail,
                                    r = t.state,
                                    o = t.imageUrl,
                                    a = t.version,
                                    i = e.performance;
                                n.thumbnailState = r, n.thumbnailUrl = o, n.performance = i, n.version = a, n.onSuccess && n.onSuccess(i)
                            }).catch(function(e) {
                                n.thumbnailState = i.error, n.onFailure && n.onFailure(e)
                            }).finally(function() {
                                n.isThumbnailRequestSending = !1
                            })
                        }
                    };
                    n.$onInit = u, n.$onChanges = u
                }
                i.$inject = ["$scope", "thumbnailService"], a.A.controller("2dThumbnailController", i), t.default = i
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

                function a(e) {
                    return {
                        getThumbnailImage: function(t, n, o, a, i) {
                            return e(function(e, u) {
                                r.getThumbnailImage(t, o, a, n, void 0, void 0, void 0, void 0, i).then(function(t) {
                                    e(t)
                                }).catch(u)
                            })
                        },
                        getCssClass: function(e) {
                            return r.getCssClass(e)
                        },
                        reloadThumbnailImage: function(t, n, o) {
                            return e(function(e, a) {
                                r.reloadThumbnailImage(t, o, null, n).then(function(t) {
                                    e(t)
                                }).catch(a)
                            })
                        }
                    }
                }
                a.$inject = ["$q"], o.A.factory("thumbnailService", a), t.default = a
            },
            134: function(e, t, n) {
                "use strict";
                var r = n(192);
                t.A = n.n(r)().module("thumbnails", ["robloxApp", "thumbnailsTemplates", "angularLazyImg"])
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
                        for (var e = "", a = 0; a < arguments.length; a++) {
                            var i = arguments[a];
                            i && (e = o(e, function(e) {
                                if ("string" == typeof e || "number" == typeof e) return e;
                                if ("object" !== t(e)) return "";
                                if (Array.isArray(e)) return r.apply(null, e);
                                if (e.toString !== Object.prototype.toString && !e.toString.toString().includes("[native code]")) return e.toString();
                                var a = "";
                                for (var i in e) n.call(e, i) && e[i] && (a = o(a, i));
                                return a
                            }(i)))
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
                        return H
                    },
                    F5: function() {
                        return P
                    },
                    JF: function() {
                        return I
                    },
                    MU: function() {
                        return V
                    },
                    Mi: function() {
                        return j
                    },
                    Ou: function() {
                        return k
                    },
                    Pq: function() {
                        return T
                    },
                    R2: function() {
                        return C
                    },
                    S3: function() {
                        return U
                    },
                    SD: function() {
                        return B
                    },
                    SH: function() {
                        return N
                    },
                    TP: function() {
                        return _
                    },
                    Tm: function() {
                        return R
                    },
                    Ul: function() {
                        return $
                    },
                    XC: function() {
                        return x
                    },
                    cu: function() {
                        return K
                    },
                    dS: function() {
                        return J
                    },
                    fP: function() {
                        return E
                    },
                    jZ: function() {
                        return F
                    },
                    lo: function() {
                        return L
                    },
                    o0: function() {
                        return O
                    },
                    qh: function() {
                        return z
                    },
                    s2: function() {
                        return M
                    },
                    tb: function() {
                        return W
                    },
                    uS: function() {
                        return A
                    },
                    wu: function() {
                        return D
                    },
                    x$: function() {
                        return X
                    },
                    xc: function() {
                        return q
                    }
                });
                var r, o, a, i, u, c, l, s, f, m, h, b, d, p, y, v, g, w = n(93),
                    S = n.n(w)().thumbnailsApi,
                    T = "".concat(S, "/v1/metadata"),
                    O = ((r = {}).processFailure = "processFailure", r.unretriableFailure = "unretriableFailure", r.maxAttemptsReached = "maxAttemptsReached", r),
                    I = ((o = {}).Avatar = "Avatar", o.AvatarHeadShot = "AvatarHeadShot", o.GameIcon = "GameIcon", o.BadgeIcon = "BadgeIcon", o.GameThumbnail = "GameThumbnail", o.GamePass = "GamePass", o.Asset = "Asset", o.BundleThumbnail = "BundleThumbnail", o.Outfit = "Outfit", o.GroupIcon = "GroupIcon", o.DeveloperProduct = "DeveloperProduct", o.PlaceIcon = "PlaceIcon", o.LookThumbnail = "Look", o.Screenshot = "Screenshot", o),
                    A = ((a = {}).avatar = "Avatar", a.avatarHeadshot = "AvatarHeadshot", a.gameIcon = "GameIcon", a.gameThumbnail = "GameThumbnail", a.badgeIcon = "BadgeIcon", a.gamePassIcon = "GamePass", a.assetThumbnail = "Asset", a.bundleThumbnail = "BundleThumbnail", a.userOutfit = "Outfit", a.groupIcon = "GroupIcon", a.developerProductIcon = "DeveloperProduct", a.universeThumbnail = "UniverseThumbnail", a.universeThumbnails = "UniverseThumbnails", a.placeGameIcon = "PlaceGameIcon", a.lookThumbnail = "Look", a.screenshot = "Screenshot", a),
                    x = 100,
                    j = ((i = {})[i.maxRetryAttempts = 10] = "maxRetryAttempts", i[i.minCooldown = 1e3] = "minCooldown", i[i.maxCooldown = 3e4] = "maxCooldown", i),
                    P = "150x150",
                    C = "webp",
                    E = ((u = {}).size50 = "50x50", u.size150 = "150x150", u.size256 = "256x256", u.size512 = "512x512", u),
                    k = ((c = {}).size150 = "150x150", c),
                    R = ((l = {}).size150 = "150x150", l.size420 = "420x420", l.size700 = "700x700", l.width256 = "256x144", l.width384 = "384x216", l.width480 = "480x270", l.width576 = "576x324", l.width768 = "768x432", l.width1320 = "1320x440", l.width660 = "660x220", l.width330 = "330x110", l.width720 = "720x228", l.width930 = "930x480", l.width1440 = "1440x456", l),
                    z = ((s = {}).size100 = "100x100", s.size352 = "352x352", s.size720 = "720x720", s),
                    F = ((f = {}).size48 = "48x48", f.size60 = "60x60", f.size150 = "150x150", f),
                    D = ((m = {}).size150 = "150x150", m.size420 = "420x420", m),
                    U = ((h = {}).size150 = "150x150", h),
                    M = ((b = {}).size150 = "150x150", b),
                    N = ((d = {}).width768 = "768x432", d.width576 = "576x324", d.width480 = "480x270", d.width384 = "384x216", d.width256 = "256x144", d),
                    L = ((p = {}).width768 = "768x432", p.width576 = "576x324", p.width480 = "480x270", p.width384 = "384x216", p.width256 = "256x144", p),
                    q = ((y = {}).error = "Error", y.complete = "Completed", y.inReview = "InReview", y.pending = "Pending", y.blocked = "Blocked", y),
                    $ = ((v = {}).png = "png", v.jpg = "jpg", v.jpeg = "jpeg", v.webp = "webp", v),
                    _ = ((g = {}).PlaceHolder = "PlaceHolder", g.AutoGenerated = "AutoGenerated", g.ForceAutoGenerated = "ForceAutoGenerated", g),
                    B = "Thumbnail2DWeb",
                    G = "LoadSuccess",
                    W = "RetryLoadSuccess",
                    H = "RetryPerThumbnailType",
                    J = "Sequence",
                    K = "LoadFailure",
                    V = "Counter",
                    X = {
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
            9: function(e, t, n) {
                "use strict";
                n.d(t, {
                    FP: function() {
                        return f
                    },
                    G4: function() {
                        return g
                    },
                    Kp: function() {
                        return i
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

                function a(e, t, n, r, o, a, i) {
                    try {
                        var u = e[a](i),
                            c = u.value
                    } catch (e) {
                        n(e);
                        return
                    }
                    u.done ? t(c) : Promise.resolve(c).then(r, o)
                }
                var i = "Avatar.AvatarExperience2",
                    u = "isAvatarBackgroundInHeadshotThumbnailsEnabled",
                    c = "AvatarHeadshot",
                    l = function() {
                        var e;
                        return null == (e = window.Roblox) ? void 0 : e.ExperimentationService
                    },
                    s = function() {
                        var e, t, n = null != (e = null == (t = window.Roblox.CurrentUser) ? void 0 : t.userId) ? e : 0;
                        return "".concat(i, "_").concat(u, "_").concat(n, "_").concat(new Date().toDateString(), "_").concat("v1")
                    },
                    f = function() {
                        return "true" === sessionStorage.getItem(s())
                    },
                    m = null,
                    h = !1,
                    b = function() {
                        if (!h) {
                            var e = l();
                            e && (h = !0, e.logLayerExposure(i))
                        }
                    },
                    d = function() {
                        if (m) return m;
                        var e, t = l();
                        if (!t) return Promise.resolve(!1);
                        var n = (e = function() {
                            var e;
                            return function(e, t) {
                                var n, r, o, a = {
                                        label: 0,
                                        sent: function() {
                                            if (1 & o[0]) throw o[1];
                                            return o[1]
                                        },
                                        trys: [],
                                        ops: []
                                    },
                                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                    u = Object.defineProperty;
                                return u(i, "next", {
                                    value: c(0)
                                }), u(i, "throw", {
                                    value: c(1)
                                }), u(i, "return", {
                                    value: c(2)
                                }), "function" == typeof Symbol && u(i, Symbol.iterator, {
                                    value: function() {
                                        return this
                                    }
                                }), i;

                                function c(u) {
                                    return function(c) {
                                        var l = [u, c];
                                        if (n) throw TypeError("Generator is already executing.");
                                        for (; i && (i = 0, l[0] && (a = 0)), a;) try {
                                            if (n = 1, r && (o = 2 & l[0] ? r.return : l[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, l[1])).done) return o;
                                            switch (r = 0, o && (l = [2 & l[0], o.value]), l[0]) {
                                                case 0:
                                                case 1:
                                                    o = l;
                                                    break;
                                                case 4:
                                                    return a.label++, {
                                                        value: l[1],
                                                        done: !1
                                                    };
                                                case 5:
                                                    a.label++, r = l[1], l = [0];
                                                    continue;
                                                case 7:
                                                    l = a.ops.pop(), a.trys.pop();
                                                    continue;
                                                default:
                                                    if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                                        a = 0;
                                                        continue
                                                    }
                                                    if (3 === l[0] && (!o || l[1] > o[0] && l[1] < o[3])) {
                                                        a.label = l[1];
                                                        break
                                                    }
                                                    if (6 === l[0] && a.label < o[1]) {
                                                        a.label = o[1], o = l;
                                                        break
                                                    }
                                                    if (o && a.label < o[2]) {
                                                        a.label = o[2], a.ops.push(l);
                                                        break
                                                    }
                                                    o[2] && a.ops.pop(), a.trys.pop();
                                                    continue
                                            }
                                            l = t.call(e, a)
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
                                        return [4, t.getAllValuesForLayer(i)];
                                    case 1:
                                        return e = !0 === n.sent()[u], sessionStorage.setItem(s(), e.toString()), [2, e]
                                }
                            })
                        }, function() {
                            var t = this,
                                n = arguments;
                            return new Promise(function(r, o) {
                                var i = e.apply(t, n);

                                function u(e) {
                                    a(i, r, o, u, c, "next", e)
                                }

                                function c(e) {
                                    a(i, r, o, u, c, "throw", e)
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
                        p || (p = !0, d().catch(function(e) {
                            console.error("Failed to prefetch avatar headshot background IXP:", e)
                        }))
                    },
                    v = function(e, t, n) {
                        return !0 === t || !1 !== t && e === c && n
                    },
                    g = function(e) {
                        var t, n = e === c,
                            a = function(e) {
                                if (Array.isArray(e)) return e
                            }(t = (0, r.useState)(function() {
                                return !!n && f()
                            })) || function(e) {
                                var t, n, r = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                if (null != r) {
                                    var o = [],
                                        a = !0,
                                        i = !1;
                                    try {
                                        for (r = r.call(e); !(a = (t = r.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                                    } catch (e) {
                                        i = !0, n = e
                                    } finally {
                                        try {
                                            a || null == r.return || r.return()
                                        } finally {
                                            if (i) throw n
                                        }
                                    }
                                    return o
                                }
                            }(t) || function(e) {
                                if (e) {
                                    if ("string" == typeof e) return o(e, 2);
                                    var t = Object.prototype.toString.call(e).slice(8, -1);
                                    if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return o(e, 2)
                                }
                            }(t) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }(),
                            i = a[0],
                            u = a[1];
                        return (0, r.useEffect)(function() {
                            if (n) {
                                var e = !0;
                                return d().then(function(t) {
                                        e && (u(t), b())
                                    }).catch(function(e) {
                                        console.error("Failed to load avatar headshot background IXP:", e)
                                    }),
                                    function() {
                                        e = !1
                                    }
                            }
                        }, [n]), i
                    }
            },
            932: function(e, t, n) {
                "use strict";
                n.d(t, {
                    l: function() {
                        return I
                    }
                });
                var r = n(971),
                    o = n.n(r),
                    a = n(93),
                    i = n.n(a)().beaconApi,
                    u = function(e) {
                        if (!e) return 0;
                        var t, n, r, o = e.split(":");
                        return (60 * parseInt(null != (t = o[0]) ? t : "", 10) * 60 + 60 * parseInt(null != (n = o[1]) ? n : "", 10) + parseInt(null != (r = o[2]) ? r : "", 10)) * 1e3
                    },
                    c = window.Roblox["core-scripts"].auth.xsrfToken;

                function l(e, t, n, r, o, a, i) {
                    try {
                        var u = e[a](i),
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
                var h = "X-CSRF-TOKEN",
                    b = function(e, t) {
                        var n = (0, c.getToken)(),
                            r = null != t ? t : {},
                            o = r.headers,
                            a = function(e, t) {
                                if (null == e) return {};
                                var n, r, o, a = {};
                                if ("u" > typeof Reflect && Reflect.ownKeys) {
                                    for (o = 0, n = Reflect.ownKeys(Object(e)); o < n.length; o++) r = n[o], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (a[r] = e[r]);
                                    return a
                                }
                                if (a = function(e, t) {
                                        if (null == e) return {};
                                        var n, r, o = {},
                                            a = Object.getOwnPropertyNames(e);
                                        for (r = 0; r < a.length; r++) n = a[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                                        return o
                                    }(e, t), Object.getOwnPropertySymbols)
                                    for (o = 0, n = Object.getOwnPropertySymbols(e); o < n.length; o++) r = n[o], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (a[r] = e[r]);
                                return a
                            }(r, ["headers"]),
                            i = m(f({}, Object.fromEntries(new Headers(o))), s({}, h, n));
                        return fetch(e, m(f({}, a), {
                            headers: i
                        }))
                    },
                    d = function(e, t) {
                        var n;
                        return (n = function() {
                            var n, r;
                            return function(e, t) {
                                var n, r, o, a = {
                                        label: 0,
                                        sent: function() {
                                            if (1 & o[0]) throw o[1];
                                            return o[1]
                                        },
                                        trys: [],
                                        ops: []
                                    },
                                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                    u = Object.defineProperty;
                                return u(i, "next", {
                                    value: c(0)
                                }), u(i, "throw", {
                                    value: c(1)
                                }), u(i, "return", {
                                    value: c(2)
                                }), "function" == typeof Symbol && u(i, Symbol.iterator, {
                                    value: function() {
                                        return this
                                    }
                                }), i;

                                function c(u) {
                                    return function(c) {
                                        var l = [u, c];
                                        if (n) throw TypeError("Generator is already executing.");
                                        for (; i && (i = 0, l[0] && (a = 0)), a;) try {
                                            if (n = 1, r && (o = 2 & l[0] ? r.return : l[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, l[1])).done) return o;
                                            switch (r = 0, o && (l = [2 & l[0], o.value]), l[0]) {
                                                case 0:
                                                case 1:
                                                    o = l;
                                                    break;
                                                case 4:
                                                    return a.label++, {
                                                        value: l[1],
                                                        done: !1
                                                    };
                                                case 5:
                                                    a.label++, r = l[1], l = [0];
                                                    continue;
                                                case 7:
                                                    l = a.ops.pop(), a.trys.pop();
                                                    continue;
                                                default:
                                                    if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                                        a = 0;
                                                        continue
                                                    }
                                                    if (3 === l[0] && (!o || l[1] > o[0] && l[1] < o[3])) {
                                                        a.label = l[1];
                                                        break
                                                    }
                                                    if (6 === l[0] && a.label < o[1]) {
                                                        a.label = o[1], o = l;
                                                        break
                                                    }
                                                    if (o && a.label < o[2]) {
                                                        a.label = o[2], a.ops.push(l);
                                                        break
                                                    }
                                                    o[2] && a.ops.pop(), a.trys.pop();
                                                    continue
                                            }
                                            l = t.call(e, a)
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
                                        return [4, b(e, t)];
                                    case 1:
                                        if (403 !== (n = o.sent()).status || !(r = n.headers.get(h))) return [3, 3];
                                        return (0, c.setToken)(r), [4, b(e, t)];
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
                                var a = n.apply(e, t);

                                function i(e) {
                                    l(a, r, o, i, u, "next", e)
                                }

                                function u(e) {
                                    l(a, r, o, i, u, "throw", e)
                                }
                                i(void 0)
                            })
                        })()
                    };

                function p(e, t, n, r, o, a, i) {
                    try {
                        var u = e[a](i),
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
                    w = function() {
                        if ("u" < typeof document) return {};
                        var e, t = document.getElementsByName("performance")[0];
                        return t ? {
                            performanceMetricsBatchWaitTime: u(t.getAttribute("data-ui-performance-metrics-batch-wait-time")),
                            performanceMetricsBatchSize: parseInt(null != (e = t.getAttribute("data-ui-performance-metrics-batch-size")) ? e : "", 10)
                        } : {}
                    }(),
                    S = w.performanceMetricsBatchWaitTime,
                    T = w.performanceMetricsBatchSize,
                    O = v.createRequestProcessor(function(e) {
                        var t;
                        return (t = function() {
                            var t, n;
                            return function(e, t) {
                                var n, r, o, a = {
                                        label: 0,
                                        sent: function() {
                                            if (1 & o[0]) throw o[1];
                                            return o[1]
                                        },
                                        trys: [],
                                        ops: []
                                    },
                                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                    u = Object.defineProperty;
                                return u(i, "next", {
                                    value: c(0)
                                }), u(i, "throw", {
                                    value: c(1)
                                }), u(i, "return", {
                                    value: c(2)
                                }), "function" == typeof Symbol && u(i, Symbol.iterator, {
                                    value: function() {
                                        return this
                                    }
                                }), i;

                                function c(u) {
                                    return function(c) {
                                        var l = [u, c];
                                        if (n) throw TypeError("Generator is already executing.");
                                        for (; i && (i = 0, l[0] && (a = 0)), a;) try {
                                            if (n = 1, r && (o = 2 & l[0] ? r.return : l[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, l[1])).done) return o;
                                            switch (r = 0, o && (l = [2 & l[0], o.value]), l[0]) {
                                                case 0:
                                                case 1:
                                                    o = l;
                                                    break;
                                                case 4:
                                                    return a.label++, {
                                                        value: l[1],
                                                        done: !1
                                                    };
                                                case 5:
                                                    a.label++, r = l[1], l = [0];
                                                    continue;
                                                case 7:
                                                    l = a.ops.pop(), a.trys.pop();
                                                    continue;
                                                default:
                                                    if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                                        a = 0;
                                                        continue
                                                    }
                                                    if (3 === l[0] && (!o || l[1] > o[0] && l[1] < o[3])) {
                                                        a.label = l[1];
                                                        break
                                                    }
                                                    if (6 === l[0] && a.label < o[1]) {
                                                        a.label = o[1], o = l;
                                                        break
                                                    }
                                                    if (o && a.label < o[2]) {
                                                        a.label = o[2], a.ops.push(l);
                                                        break
                                                    }
                                                    o[2] && a.ops.pop(), a.trys.pop();
                                                    continue
                                            }
                                            l = t.call(e, a)
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
                                            var t = e.data;
                                            return y({}, (t.taskId, function(e, t) {
                                                if (null == e) return {};
                                                var n, r, o, a = {};
                                                if ("u" > typeof Reflect && Reflect.ownKeys) {
                                                    for (o = 0, n = Reflect.ownKeys(Object(e)); o < n.length; o++) r = n[o], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (a[r] = e[r]);
                                                    return a
                                                }
                                                if (a = function(e, t) {
                                                        if (null == e) return {};
                                                        var n, r, o = {},
                                                            a = Object.getOwnPropertyNames(e);
                                                        for (r = 0; r < a.length; r++) n = a[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                                                        return o
                                                    }(e, t), Object.getOwnPropertySymbols)
                                                    for (o = 0, n = Object.getOwnPropertySymbols(e); o < n.length; o++) r = n[o], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (a[r] = e[r]);
                                                return a
                                            }(t, ["taskId"])))
                                        }), [4, d("".concat(i, "/v1/measurements"), {
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
                                var a = t.apply(e, n);

                                function i(e) {
                                    p(a, r, o, i, u, "next", e)
                                }

                                function u(e) {
                                    p(a, r, o, i, u, "throw", e)
                                }
                                i(void 0)
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
                        return O.queueItem(y({
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
                        return f
                    },
                    peekThumbnailImage: function() {
                        return b
                    },
                    reloadThumbnailImage: function() {
                        return m
                    }
                });
                var r, o = n(95),
                    a = n(229),
                    i = n(9),
                    u = n(954),
                    c = new Map,
                    l = function(e, t, n, r, o, a, i, u) {
                        var c = arguments.length > 8 && void 0 !== arguments[8] && arguments[8];
                        return [e, t, n, null != r ? r : "", null != o ? o : "", null != a ? a : "", null != i ? i : "", u ? "bg" : "", c ? "frame" : ""].join(":")
                    },
                    s = function(e, t) {
                        var n, s = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : u.Ul.webp,
                            f = arguments.length > 3 ? arguments[3] : void 0,
                            m = arguments.length > 4 ? arguments[4] : void 0,
                            h = arguments.length > 5 ? arguments[5] : void 0,
                            b = arguments.length > 6 ? arguments[6] : void 0,
                            d = arguments.length > 7 ? arguments[7] : void 0,
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
                        (e === u.uS.gameIcon || e === u.uS.gameThumbnail || e === u.uS.placeGameIcon || e === u.uS.universeThumbnail) && (v = u.Ul.webp), e === u.uS.avatarHeadshot && void 0 === p && (0, i.ez)();
                        var g = (0, i.st)(e, p, (0, i.FP)());
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
                                    version: b,
                                    headShape: d
                                }, g ? {
                                    includeBackground: !0
                                } : {}, y ? {
                                    includeProfileFrame: y
                                } : {}),
                                i = [u.uS.universeThumbnails, u.uS.universeThumbnail].includes(e) ? "universeThumbnailProcessor" : "thumbnail2dProcessor";
                            return o.W8.processThumbnailBatchRequest(r, function(t) {
                                return e === u.uS.universeThumbnail ? a.yB.handle(t, 1) : e === u.uS.universeThumbnails ? a.yB.handle(t, 10) : a.u_.handle(t)
                            }, i, h).then(function(n) {
                                var r = null == n ? void 0 : n.thumbnail;
                                return (null == r ? void 0 : r.state) === u.xc.complete && r.imageUrl && c.set(l(e, t, s, f, m, b, d, p, y), {
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
                            a = arguments.length > 5 ? arguments[5] : void 0,
                            i = arguments.length > 6 ? arguments[6] : void 0,
                            c = arguments.length > 7 ? arguments[7] : void 0,
                            l = arguments.length > 8 && void 0 !== arguments[8] && arguments[8];
                        return s(e, t, n, r, o, !1, a, i, c, l)
                    },
                    m = function(e, t) {
                        var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : u.Ul.webp,
                            r = arguments.length > 3 ? arguments[3] : void 0,
                            o = arguments.length > 4 ? arguments[4] : void 0,
                            a = arguments.length > 5 ? arguments[5] : void 0,
                            i = arguments.length > 6 ? arguments[6] : void 0,
                            c = arguments.length > 7 ? arguments[7] : void 0,
                            l = arguments.length > 8 && void 0 !== arguments[8] && arguments[8];
                        return s(e, t, n, r, o, !0, a, i, c, l)
                    },
                    h = function(e) {
                        return {
                            "icon-broken": e === u.xc.error,
                            "icon-in-review": e === u.xc.inReview,
                            "icon-blocked": e === u.xc.blocked,
                            "icon-pending": e === u.xc.pending
                        }
                    },
                    b = function(e, t) {
                        var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : u.Ul.webp,
                            r = arguments.length > 3 ? arguments[3] : void 0,
                            o = arguments.length > 4 ? arguments[4] : void 0,
                            a = arguments.length > 5 ? arguments[5] : void 0,
                            i = arguments.length > 6 ? arguments[6] : void 0,
                            s = arguments.length > 7 ? arguments[7] : void 0,
                            f = arguments.length > 8 && void 0 !== arguments[8] && arguments[8];
                        return c.get(l(e, t, n, r, o, a, i, s, f))
                    }
            },
            229: function(e, t, n) {
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
                    a = n(803),
                    i = n(954);

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

                        function t(e, n, r, o, a) {
                            if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                            u(this, "storeInstance", void 0), u(this, "keySetter", void 0), u(this, "keyGetter", void 0), u(this, "validator", void 0), u(this, "resultSetter", void 0), this.storeInstance = e, this.keySetter = n, this.keyGetter = r, this.validator = o, this.resultSetter = a
                        }
                        return e = [{
                                key: "handle",
                                value: function(e, t) {
                                    var n = this;
                                    return new Promise(function(r) {
                                        n.storeInstance(e, t).then(function(o) {
                                            var a, u, l = new Map,
                                                s = {};
                                            (null != (a = null == o || null == (u = o.data) ? void 0 : u.data) ? a : []).forEach(function(e) {
                                                l.set(n.keySetter(e), e)
                                            }), e.forEach(function(e) {
                                                var r, o, a, u = n.keyGetter(e);
                                                if (l.has(u)) {
                                                    var f = l.get(u);
                                                    f && n.validator(f) && (s[u] = n.resultSetter(f, t))
                                                } else a = t && t > 1 ? {
                                                    thumbnails: []
                                                } : {
                                                    thumbnail: {
                                                        targetId: u,
                                                        state: i.xc.error
                                                    }
                                                }, s[u] = (r = c({}, a), o = o = {
                                                    errorcode: 3,
                                                    errorMessage: "id doesn't exist"
                                                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(o)) : (function(e) {
                                                    var t = Object.keys(e);
                                                    if (Object.getOwnPropertySymbols) {
                                                        var n = Object.getOwnPropertySymbols(e);
                                                        t.push.apply(t, n)
                                                    }
                                                    return t
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
                            var t = e.data,
                                n = t.type,
                                r = function(e, t) {
                                    if (null == e) return {};
                                    var n, r, o, a = {};
                                    if ("u" > typeof Reflect && Reflect.ownKeys) {
                                        for (o = 0, n = Reflect.ownKeys(Object(e)); o < n.length; o++) r = n[o], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (a[r] = e[r]);
                                        return a
                                    }
                                    if (a = function(e, t) {
                                            if (null == e) return {};
                                            var n, r, o = {},
                                                a = Object.getOwnPropertyNames(e);
                                            for (r = 0; r < a.length; r++) n = a[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                                            return o
                                        }(e, t), Object.getOwnPropertySymbols)
                                        for (o = 0, n = Object.getOwnPropertySymbols(e); o < n.length; o++) r = n[o], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (a[r] = e[r]);
                                    return a
                                }(t, ["type"]);
                            return c({
                                requestId: e.key,
                                type: (0, a.JS)(n)
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
                        return e.state !== i.xc.pending
                    }, function(e) {
                        return {
                            thumbnail: e
                        }
                    }),
                    h = new f(function(e, t) {
                        return new Promise(function(n, r) {
                            var o, a, i;
                            s.getAllUniverseThumbnails(e.map(function(e) {
                                var t = e.data.targetId;
                                return null != t ? t : 0
                            }), null == (o = e[0]) ? void 0 : o.data.size, null == (a = e[0]) ? void 0 : a.data.format, null == (i = e[0]) ? void 0 : i.data.isCircular, t).then(n).catch(r)
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
                        return l
                    },
                    W8: function() {
                        return f
                    }
                });
                var r = n(971),
                    o = n.n(r),
                    a = n(932),
                    i = n(954),
                    u = n(803);

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
                                    getFailureCooldown: this.batchRequestFactory.createExponentialBackoffCooldown(i.Mi.minCooldown, i.Mi.maxCooldown),
                                    maxRetryAttempts: i.Mi.maxRetryAttempts,
                                    batchSize: i.XC
                                }
                            }
                        }, {
                            key: "getThumbnailRequester",
                            value: function(e, t, n) {
                                var r = this,
                                    o = this.thumbnailRequesters[t];
                                if (o) return o;
                                var a = this.batchRequestFactory.createRequestProcessor(e, function(e) {
                                    return r.thumbnailItemIdSerializer(e)
                                }, this.getThumbnailRequesterProperties(n));
                                return this.thumbnailRequesters[t] = a, a
                            }
                        }, {
                            key: "processThumbnailBatchRequest",
                            value: function(e, t) {
                                var n, r, o, c, l, s, f, m, h, b = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : this.thumbnailProcessorKeySerializer(e),
                                    d = arguments.length > 3 ? arguments[3] : void 0,
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
                                    } : i.x$,
                                    g = this.getThumbnailRequester(t, b, v);
                                d && g.invalidateItem(e);
                                var w = (0, u.$E)(v);
                                return g.queueItem(e, void 0, w).then(function(e) {
                                    if (e.performance && (0, u.rv)(v)) {
                                        var t = e.thumbnails,
                                            n = e.thumbnail,
                                            r = function(e) {
                                                (0, a.l)("ThumbnailStatusCountWebapp", {
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
                                    }), (0, u.rv)(v) && e === i.o0.maxAttemptsReached && (0, a.l)("ThumbnailTimeoutWebapp", {
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
                        a = e.format,
                        i = e.isCircular,
                        u = e.version,
                        c = e.headShape,
                        l = e.includeBackground,
                        s = e.includeProfileFrame;
                    return "".concat((void 0 === t ? 0 : t).toString(), ":").concat(n, ":").concat(r, ":").concat(o, ":").concat(a, ":").concat(i ? "circular" : "regular", ":").concat(void 0 === u ? 0 : u, ":").concat(null != c ? c : "", ":").concat(void 0 !== l && l, ":").concat(void 0 !== s && s)
                }
                var f = new l(function(e) {
                    var t = e.type,
                        n = e.targetId;
                    return t === i.uS.universeThumbnail || t === i.uS.universeThumbnails ? (void 0 === n ? 0 : n).toString() : s(e)
                }, s);
                new l(function(e) {
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
                var r, o = n(954);

                function a(e, t) {
                    (null == t || t > e.length) && (t = e.length);
                    for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                    return r
                }

                function i(e, t, n) {
                    return t in e ? Object.defineProperty(e, t, {
                        value: n,
                        enumerable: !0,
                        configurable: !0,
                        writable: !0
                    }) : e[t] = n, e
                }
                var u = (i(r = {}, o.uS.avatar, o.JF.Avatar), i(r, o.uS.avatarHeadshot, o.JF.AvatarHeadShot), i(r, o.uS.gameIcon, o.JF.GameIcon), i(r, o.uS.badgeIcon, o.JF.BadgeIcon), i(r, o.uS.gamePassIcon, o.JF.GamePass), i(r, o.uS.assetThumbnail, o.JF.Asset), i(r, o.uS.bundleThumbnail, o.JF.BundleThumbnail), i(r, o.uS.userOutfit, o.JF.Outfit), i(r, o.uS.groupIcon, o.JF.GroupIcon), i(r, o.uS.placeGameIcon, o.JF.PlaceIcon), i(r, o.uS.developerProductIcon, o.JF.DeveloperProduct), i(r, o.uS.gameThumbnail, o.JF.GameThumbnail), i(r, o.uS.lookThumbnail, o.JF.LookThumbnail), i(r, o.uS.screenshot, o.JF.Screenshot), r);

                function c(e) {
                    return u[e]
                }

                function l(e) {
                    if (e) {
                        var t, n, r, o, i;
                        return {
                            useCache: e.isWebappUseCacheEnabled,
                            expirationWindowMS: (r = (n = function(e) {
                                if (Array.isArray(e)) return e
                            }(t = e.webappCacheExpirationTimespan.split(":")) || function(e) {
                                var t, n, r = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                if (null != r) {
                                    var o = [],
                                        a = !0,
                                        i = !1;
                                    try {
                                        for (r = r.call(e); !(a = (t = r.next()).done) && (o.push(t.value), 3 !== o.length); a = !0);
                                    } catch (e) {
                                        i = !0, n = e
                                    } finally {
                                        try {
                                            a || null == r.return || r.return()
                                        } finally {
                                            if (i) throw n
                                        }
                                    }
                                    return o
                                }
                            }(t) || function(e) {
                                if (e) {
                                    if ("string" == typeof e) return a(e, 3);
                                    var t = Object.prototype.toString.call(e).slice(8, -1);
                                    if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return a(e, 3)
                                }
                            }(t) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }())[0], o = n[1], i = n[2], void 0 === r || void 0 === o || void 0 === i ? NaN : (60 * parseInt(r, 10) * 60 + 60 * parseInt(o, 10) + parseInt(i, 10)) * 1e3)
                        }
                    }
                }

                function s(e) {
                    return !e || Math.floor(100 * Math.random()) <= e.thumbnailMetricsSampleSize
                }
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
        var a = t[r] = {
            exports: {}
        };
        return e[r](a, a.exports, n), a.exports
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
                PROFILE_FRAME_EXPERIMENT_KEY: function() {
                    return N
                },
                PROFILE_FRAME_LAYER: function() {
                    return M
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
                    return j
                },
                Thumbnail2dCarouselContainer: function() {
                    return k
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
                    return d
                },
                useProfileFrameExperiment: function() {
                    return B
                }
            });
            var r = n(192),
                o = n.n(r);

            function a(e, t) {
                if (e) {
                    if ("string" == typeof e) return i(e, t);
                    var n = ({}).toString.call(e).slice(8, -1);
                    return "Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n ? Array.from(e) : "Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n) ? i(e, t) : void 0
                }
            }

            function i(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }
            var u = function(e) {
                    e.keys().forEach(e)
                },
                c = window.ReactJSX,
                l = n(609),
                s = n(390),
                f = n.n(s),
                m = window.PropTypes,
                h = n.n(m),
                b = n(932),
                d = n(501),
                p = n(95),
                y = n(229),
                v = n(954),
                g = n(9);

            function w(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function S(e) {
                var t, n = e.onLoad,
                    r = e.errorIconClass,
                    o = e.thumbnailUrl,
                    a = e.imgClassName,
                    i = e.containerClass,
                    u = e.altName,
                    s = f()("thumbnail-2d-container", r, i),
                    m = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = (0, l.useState)(f()(a, "loading"))) || function(e) {
                        var t, n, r = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != r) {
                            var o = [],
                                a = !0,
                                i = !1;
                            try {
                                for (r = r.call(e); !(a = (t = r.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                            } catch (e) {
                                i = !0, n = e
                            } finally {
                                try {
                                    a || null == r.return || r.return()
                                } finally {
                                    if (i) throw n
                                }
                            }
                            return o
                        }
                    }(t) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return w(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return w(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    h = m[0],
                    b = m[1];
                return (0, l.useEffect)(function() {
                    null === o && b(f()(a, "loading"))
                }, [o, a]), (0, c.jsx)("span", {
                    className: s,
                    children: o && (0, c.jsx)("img", {
                        className: h,
                        src: o,
                        alt: u,
                        onLoad: function() {
                            n(), b(a)
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
                    var n, r, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            u = !1;
                        try {
                            for (o = o.call(e); !(i = (n = o.next()).done) && (a.push(n.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            u = !0, r = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (u) throw r
                            }
                        }
                        return a
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
            S.defaultProps = {
                errorIconClass: "",
                thumbnailUrl: "",
                imgClassName: "",
                containerClass: "",
                altName: "",
                onLoad: function() {}
            }, S.propTypes = {
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
                    a = e.token,
                    i = e.size,
                    u = e.imgClassName,
                    s = e.containerClass,
                    m = e.format,
                    h = e.altName,
                    p = e.onLoad,
                    w = e.getThumbnail,
                    T = e.version,
                    x = e.headShape,
                    j = e.includeBackground,
                    P = e.includeProfileFrame,
                    C = e.seedFromCache,
                    E = I((0, l.useState)(new Date().getTime()), 1)[0],
                    k = (0, g.G4)(r),
                    R = (0, g.st)(r, j, k),
                    z = I((0, l.useState)(function() {
                        return C ? d.peekThumbnailImage(r, i, m, o, a, T, x, R, P) : void 0
                    }), 1)[0],
                    F = (0, l.useRef)(!!z),
                    D = I((0, l.useState)(null != (t = null == z ? void 0 : z.state) ? t : null), 2),
                    U = D[0],
                    M = D[1],
                    N = I((0, l.useState)(null != (n = null == z ? void 0 : z.imageUrl) ? n : null), 2),
                    L = N[0],
                    q = N[1],
                    $ = f()(d.getCssClass(U)),
                    _ = I((0, l.useState)(z ? "" : "shimmer"), 2),
                    B = _[0],
                    G = _[1],
                    W = I((0, l.useState)(null), 2),
                    H = W[0],
                    J = W[1],
                    K = (0, l.useMemo)(function() {
                        return new y.XY(function() {
                            return new Promise(function(e, t) {
                                w().then(function(t) {
                                    var n, r;
                                    e({
                                        data: {
                                            data: [(n = O({}, t.data), r = r = {
                                                targetId: o
                                            }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(r)) : (function(e) {
                                                var t = Object.keys(e);
                                                if (Object.getOwnPropertySymbols) {
                                                    var n = Object.getOwnPropertySymbols(e);
                                                    t.push.apply(t, n)
                                                }
                                                return t
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
                    }, [o, w]),
                    V = (0, l.useCallback)(function() {
                        if (H) {
                            var e = new Date().getTime() - E,
                                t = H.retryAttempts;
                            (0, b.l)("ThumbnailLoadDurationWebapp", {
                                Status: "Success",
                                ThumbnailType: "".concat(r, "_2d"),
                                Value: e.toString()
                            }).catch(function(e) {
                                console.error(e)
                            }), t ? (0, b.l)("ThumbnailRetryWebapp", {
                                ThumbnailType: "".concat(r, "_2d"),
                                Value: t.toString()
                            }).catch(function(e) {
                                console.error(e)
                            }) : (0, b.l)("ThumbnailNoRetrySuccessWebapp", {
                                ThumbnailType: "".concat(r, "_2d")
                            }).catch(function(e) {
                                console.error(e)
                            })
                        }
                        p && p()
                    }, [H]);
                return (0, l.useEffect)(function() {
                    F.current ? F.current = !1 : (G("shimmer"), M(null), q(null));
                    var e = !1,
                        t = d.getThumbnailImage(r, i, m, o, a, T, x, R, P);
                    return w && (t = A.processThumbnailBatchRequest({
                            targetId: o,
                            type: r
                        }, function(e) {
                            return K.handle(e)
                        }, o)), t.then(function(t) {
                            var n = t.thumbnail,
                                r = n.state,
                                o = n.imageUrl,
                                a = t.performance;
                            !e && (M(r), q(o), G(""), a && J(O({}, a)))
                        }).catch(function(t) {
                            console.error(t), e || G("")
                        }),
                        function() {
                            e = !0
                        }
                }, [r, o, a, i, u, w, T, x, R, P]), (0, c.jsx)(S, {
                    thumbnailUrl: L,
                    errorIconClass: $,
                    imgClassName: u,
                    altName: h,
                    onLoad: V,
                    containerClass: f()(B, s)
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
            var j = x;

            function P(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function C(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            u = !1;
                        try {
                            for (o = o.call(e); !(i = (n = o.next()).done) && (a.push(n.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            u = !0, r = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (u) throw r
                            }
                        }
                        return a
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

            function E(e) {
                var t = e.type,
                    n = e.targetId,
                    r = e.size,
                    o = e.imgClassName,
                    a = e.containerClass,
                    i = e.format,
                    u = e.altName,
                    s = C((0, l.useState)(null), 2),
                    m = s[0],
                    h = s[1],
                    b = C((0, l.useState)(null), 2),
                    p = b[0],
                    y = b[1],
                    v = C((0, l.useState)(null), 2),
                    g = v[0],
                    w = v[1],
                    T = C((0, l.useState)("shimmer"), 2),
                    O = T[0],
                    I = T[1],
                    A = C((0, l.useState)(0), 2),
                    x = A[0],
                    j = A[1],
                    P = function() {
                        j(x >= m.length - 1 ? 0 : x + 1)
                    };
                return (0, l.useEffect)(function() {
                    var e;
                    if (m) {
                        var t = m[x];
                        y(t.state), w(t.imageUrl), I(""), e = setInterval(function() {
                            return P()
                        }, 4e3)
                    }
                    return function() {
                        clearInterval(e)
                    }
                }, [m, x]), (0, l.useEffect)(function() {
                    var e = !1;
                    return d.getThumbnailImage(t, r, i, n).then(function(t) {
                            e || h(t.thumbnails)
                        }).catch(function() {
                            e || I("")
                        }),
                        function() {
                            e = !0
                        }
                }, [t, n, r, o, i]), (0, c.jsx)(S, {
                    thumbnailUrl: g,
                    errorIconClass: f()(d.getCssClass(p)),
                    imgClassName: o,
                    altName: u,
                    containerClass: f()(O, a)
                })
            }
            E.defaultProps = {
                size: "576x324",
                imgClassName: "",
                containerClass: "",
                format: "webp",
                altName: ""
            }, E.propTypes = {
                type: h().string.isRequired,
                targetId: h().number.isRequired,
                size: h().string,
                format: h().string,
                imgClassName: h().string,
                containerClass: h().string,
                altName: h().string
            };
            var k = E,
                R = window.Roblox.ExperimentationService,
                z = n.n(R),
                F = window.Roblox["core-scripts"].meta.user;

            function D(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function U(e, t, n, r, o, a, i) {
                try {
                    var u = e[a](i),
                        c = u.value
                } catch (e) {
                    n(e);
                    return
                }
                u.done ? t(c) : Promise.resolve(c).then(r, o)
            }
            var M = "Social.Friends",
                N = "friendsCarouselProfileFrameEnabled",
                L = function() {
                    var e, t = null != (e = (0, F.userId)()) ? e : 0;
                    return "".concat(M, "_").concat(N, "_").concat(t, "_").concat(new Date().toDateString(), "_").concat("v1")
                },
                q = function() {
                    return "true" === sessionStorage.getItem(L())
                },
                $ = null,
                _ = function() {
                    if ($) return $;
                    var e, t = (e = function() {
                        var e;
                        return function(e, t) {
                            var n, r, o, a = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                u = Object.defineProperty;
                            return u(i, "next", {
                                value: c(0)
                            }), u(i, "throw", {
                                value: c(1)
                            }), u(i, "return", {
                                value: c(2)
                            }), "function" == typeof Symbol && u(i, Symbol.iterator, {
                                value: function() {
                                    return this
                                }
                            }), i;

                            function c(u) {
                                return function(c) {
                                    var l = [u, c];
                                    if (n) throw TypeError("Generator is already executing.");
                                    for (; i && (i = 0, l[0] && (a = 0)), a;) try {
                                        if (n = 1, r && (o = 2 & l[0] ? r.return : l[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, l[1])).done) return o;
                                        switch (r = 0, o && (l = [2 & l[0], o.value]), l[0]) {
                                            case 0:
                                            case 1:
                                                o = l;
                                                break;
                                            case 4:
                                                return a.label++, {
                                                    value: l[1],
                                                    done: !1
                                                };
                                            case 5:
                                                a.label++, r = l[1], l = [0];
                                                continue;
                                            case 7:
                                                l = a.ops.pop(), a.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                                    a = 0;
                                                    continue
                                                }
                                                if (3 === l[0] && (!o || l[1] > o[0] && l[1] < o[3])) {
                                                    a.label = l[1];
                                                    break
                                                }
                                                if (6 === l[0] && a.label < o[1]) {
                                                    a.label = o[1], o = l;
                                                    break
                                                }
                                                if (o && a.label < o[2]) {
                                                    a.label = o[2], a.ops.push(l);
                                                    break
                                                }
                                                o[2] && a.ops.pop(), a.trys.pop();
                                                continue
                                        }
                                        l = t.call(e, a)
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
                        }(this, function(t) {
                            switch (t.label) {
                                case 0:
                                    return [4, z().getAllValuesForLayer(M)];
                                case 1:
                                    return e = !0 === t.sent()[N], sessionStorage.setItem(L(), e.toString()), [2, e]
                            }
                        })
                    }, function() {
                        var t = this,
                            n = arguments;
                        return new Promise(function(r, o) {
                            var a = e.apply(t, n);

                            function i(e) {
                                U(a, r, o, i, u, "next", e)
                            }

                            function u(e) {
                                U(a, r, o, i, u, "throw", e)
                            }
                            i(void 0)
                        })
                    })();
                    return t.catch(function() {
                        $ = null
                    }), $ = t, t
                },
                B = function() {
                    var e, t = function(e) {
                            if (Array.isArray(e)) return e
                        }(e = (0, l.useState)(q)) || function(e) {
                            var t, n, r = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != r) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (r = r.call(e); !(a = (t = r.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, n = e
                                } finally {
                                    try {
                                        a || null == r.return || r.return()
                                    } finally {
                                        if (i) throw n
                                    }
                                }
                                return o
                            }
                        }(e) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return D(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return D(e, 2)
                            }
                        }(e) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        n = t[0],
                        r = t[1];
                    return (0, l.useEffect)(function() {
                        var e = !0;
                        return _().then(function(t) {
                                e && r(t)
                            }).catch(function(e) {
                                console.error("Failed to load profile frame IXP:", e)
                            }),
                            function() {
                                e = !1
                            }
                    }, []), n
                };
            o().module("angularLazyImg", []).factory("LazyImgMagic", ["$window", "$rootScope", "lazyImgConfig", "lazyImgHelpers", function(e, t, n, r) {
                    var a, i, u, c, l, s, f, m;

                    function h() {
                        for (var e = u.length - 1; e >= 0; e--) {
                            var n = u[e];
                            n && r.isElementInView(n.$elem[0], l.offset, a) && (function(e) {
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

                    function b(e) {
                        m.forEach(function(t) {
                            t[e]("scroll", s), t[e]("touchmove", s)
                        }), i[e]("resize", s), i[e]("resize", f)
                    }

                    function d() {
                        c = !0, setTimeout(function() {
                            h(), b("on")
                        }, 1)
                    }

                    function p() {
                        c = !1, b("off")
                    }

                    function y(e) {
                        e.addClass(l.loadingClass), this.$elem = e
                    }
                    return u = [], c = !1, l = n.getOptions(), i = o().element(e), a = r.getWinDimensions(), f = r.throttle(function() {
                        a = r.getWinDimensions()
                    }, 60), m = [l.container || i], s = r.throttle(h, 30), y.prototype.setSource = function(e) {
                        this.src = e, u.unshift(this), c || d()
                    }, y.prototype.removeImage = function() {
                        var e; - 1 !== (e = u.indexOf(this)) && u.splice(e, 1), 0 === u.length && p()
                    }, y.prototype.checkImages = function() {
                        h()
                    }, y.addContainer = function(e) {
                        p(), m.push(e), d()
                    }, y.removeContainer = function(e) {
                        p(), m.splice(m.indexOf(e), 1), d()
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
                                var a = n || this,
                                    i = +new Date,
                                    u = arguments;
                                r && i < r + t ? (clearTimeout(o), o = setTimeout(function() {
                                    r = i, e.apply(a, u)
                                }, t)) : (r = i, e.apply(a, u))
                            }
                        }
                    }
                }]).directive("lazyImg", ["$rootScope", "LazyImgMagic", function(e, t) {
                    return {
                        link: function(n, r, o) {
                            var a = new t(r);
                            o.$observe("lazyImg", function(e) {
                                e && a.setSource(e)
                            }), n.$on("$destroy", function() {
                                a.removeImage()
                            }), e.$on("lazyImg.runCheck", function() {
                                a.checkImages()
                            }), e.$on("lazyImg:refresh", function() {
                                a.checkImages()
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
                                if (Array.isArray(e)) return i(e)
                            }(e) || function(e) {
                                if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                            }(e) || a(e) || function() {
                                throw TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }(),
                            u = o.pop(),
                            c = n,
                            l = function(e) {
                                var t = "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                if (!t) {
                                    if (Array.isArray(e) || (t = a(e))) {
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
                                var o, i = !0,
                                    u = !1;
                                return {
                                    s: function() {
                                        t = t.call(e)
                                    },
                                    n: function() {
                                        var e = t.next();
                                        return i = e.done, e
                                    },
                                    e: function(e) {
                                        u = !0, o = e
                                    },
                                    f: function() {
                                        try {
                                            i || null == t.return || t.return()
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
            var G = n(902);
            e = o(), e.module("thumbnailsTemplates", []).run(["$templateCache", function(e) {
                G && G.keys().forEach(function(t) {
                    var n = t.split("/").pop().replace(".html", "").replace(/([a-z])([A-Z])/g, "$1-$2").toLowerCase();
                    e.put(n, G(t))
                })
            }])
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("Thumbnails");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/thumbnails-535fea2ea4d6d396.js.map