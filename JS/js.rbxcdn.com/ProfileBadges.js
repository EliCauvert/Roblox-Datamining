! function() {
    var n = {
            870: function(e, t) {
                var n;
                /*!
                	Copyright (c) 2018 Jed Watson.
                	Licensed under the MIT License (MIT), see
                	http://jedwatson.github.io/classnames
                */
                ! function() {
                    "use strict";
                    var i = {}.hasOwnProperty;

                    function c() {
                        for (var e = [], t = 0; t < arguments.length; t++) {
                            var n = arguments[t];
                            if (n) {
                                var r, a = typeof n;
                                if ("string" == a || "number" == a) e.push(n);
                                else if (Array.isArray(n)) !n.length || (r = c.apply(null, n)) && e.push(r);
                                else if ("object" == a)
                                    if (n.toString === Object.prototype.toString || n.toString.toString().includes("[native code]"))
                                        for (var o in n) i.call(n, o) && n[o] && e.push(o);
                                    else e.push(n.toString())
                            }
                        }
                        return e.join(" ")
                    }
                    e.exports ? (c.default = c, e.exports = c) : void 0 === (n = function() {
                        return c
                    }.apply(t, [])) || (e.exports = n)
                }()
            }
        },
        r = {};

    function ue(e) {
        var t = r[e];
        if (void 0 !== t) return t.exports;
        t = r[e] = {
            exports: {}
        };
        return n[e](t, t.exports, ue), t.exports
    }
    ue.n = function(e) {
            var t = e && e.__esModule ? function() {
                return e.default
            } : function() {
                return e
            };
            return ue.d(t, {
                a: t
            }), t
        }, ue.d = function(e, t) {
            for (var n in t) ue.o(t, n) && !ue.o(e, n) && Object.defineProperty(e, n, {
                enumerable: !0,
                get: t[n]
            })
        }, ue.o = function(e, t) {
            return Object.prototype.hasOwnProperty.call(e, t)
        },
        function() {
            "use strict";
            var n = CoreUtilities,
                g = React,
                h = ue.n(g),
                e = ReactDOM,
                t = PropTypes,
                r = ue.n(t),
                a = ReactUtilities,
                y = ReactStyleGuide,
                o = {
                    common: ["CommonUI.Controls"],
                    feature: "Feature.ProfileBadges"
                },
                i = Roblox,
                c = i.EnvironmentUrls.websiteUrl,
                v = "Heading.PlayerAssetsBadges",
                l = "Action.SeeAll",
                w = 6,
                S = 4,
                E = 3,
                O = function(e) {
                    return "".concat(c, "/users/").concat(e, "/inventory/#!/badges")
                },
                m = "Heading.RobloxBadge",
                u = "Action.SeeMore",
                s = "Action.SeeLess",
                p = 6,
                A = 4,
                x = 3;

            function d(e) {
                var t = e.translate,
                    n = e.headerLabel,
                    r = e.isSeeAllShown,
                    a = e.url,
                    o = e.seeMoreLessCallback,
                    i = e.seeMore,
                    e = e.isSeeMoreShown,
                    i = o ? i ? s : u : null;
                return h().createElement("div", {
                    className: "container-header"
                }, h().createElement("h2", null, n), r && h().createElement(y.Link, {
                    url: a,
                    class: "btn-fixed-width btn-secondary-xs btn-more see-all-link-icon"
                }, t(l)), e && h().createElement(y.Link, {
                    onClick: o,
                    class: "btn-fixed-width btn-secondary-xs btn-more see-all-link"
                }, t(i)))
            }
            d.defaultProps = {
                isSeeAllShown: !1,
                url: "",
                seeMoreLessCallback: null,
                seeMore: !1,
                isSeeMoreShown: !1
            }, d.propTypes = {
                translate: r().func.isRequired,
                headerLabel: r().string.isRequired,
                isSeeAllShown: r().bool,
                url: r().string,
                seeMoreLessCallback: r().func,
                seeMore: r().bool,
                isSeeMoreShown: r().bool
            };
            var j = d,
                t = ue(870),
                f = ue.n(t),
                b = RobloxThumbnails,
                I = i.EnvironmentUrls.websiteUrl,
                T = {
                    1: "icon-badge-administrator",
                    2: "icon-badge-friendship",
                    3: "icon-badge-combat-initiation",
                    4: "icon-badge-warrior",
                    5: "icon-badge-bloxxer",
                    6: "icon-badge-homestead",
                    7: "icon-badge-bricksmith",
                    8: "icon-badge-inviter",
                    11: "icon-badge-builders-club",
                    12: "icon-badge-veteran",
                    14: "icon-badge-ambassador",
                    15: "icon-badge-turbo-builders-club",
                    16: "icon-badge-outrageous-builders-club",
                    17: "icon-badge-official-model-maker",
                    18: "icon-badge-welcome-to-the-club",
                    33: "icon-badge-official-model-maker",
                    34: "icon-badge-welcome-to-the-club"
                },
                M = function(e, t) {
                    t = n.seoName.formatSeoName(t);
                    return "".concat(I, "/badges/").concat(e, "/").concat(t)
                },
                L = function(e) {
                    return "".concat(I, "/info/roblox-badges#Badge").concat(e)
                },
                P = function(e) {
                    return T[e] || null
                },
                k = "playerBadge",
                C = "robloxBadge";

            function D(e) {
                var t, n = e.badgeData,
                    e = e.badgeType,
                    r = n.id,
                    a = n.name,
                    o = n.description,
                    i = "",
                    c = "";
                switch (e) {
                    case k:
                        i = M(r, a), c = h().createElement(b.Thumbnail2d, {
                            type: b.ThumbnailTypes.badgeIcon,
                            size: b.DefaultThumbnailSize,
                            targetId: r,
                            imgClassName: "asset-thumb-container",
                            format: b.ThumbnailFormat.webp,
                            altName: o
                        });
                        break;
                    case C:
                    default:
                        i = L(r), t = f()("border asset-thumb-container", [P(r)]), c = h().createElement("span", {
                            className: t,
                            title: a
                        })
                }
                return h().createElement("li", {
                    className: "list-item asset-item",
                    "data-testid": i
                }, h().createElement(y.Link, {
                    url: i,
                    title: o
                }, c, h().createElement("span", {
                    className: "font-header-2 text-overflow item-name"
                }, a)))
            }
            D.propTypes = {
                badgeData: r().shape({
                    id: r().number,
                    name: r().string,
                    description: r().string,
                    iconImageId: r().number
                }).isRequired,
                badgeType: r().string.isRequired
            };
            var R = D;

            function U(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var n = [],
                        r = !0,
                        a = !1,
                        o = void 0;
                    try {
                        for (var i, c = e[Symbol.iterator](); !(r = (i = c.next()).done) && (n.push(i.value), !t || n.length !== t); r = !0);
                    } catch (e) {
                        a = !0, o = e
                    } finally {
                        try {
                            r || null == c.return || c.return()
                        } finally {
                            if (a) throw o
                        }
                    }
                    return n
                }(e, t) || function(e, t) {
                    if (!e) return;
                    if ("string" == typeof e) return N(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    "Object" === n && e.constructor && (n = e.constructor.name);
                    if ("Map" === n || "Set" === n) return Array.from(e);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return N(e, t)
                }(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function N(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function B(e) {
                var t = e.badgesData,
                    n = e.badgeType,
                    r = e.isSectionHeightAuto,
                    a = f()("hlist badge-list", {
                        "badge-list-more": r
                    }),
                    e = U((0, g.useState)([]), 2),
                    r = e[0],
                    o = e[1];
                return (0, g.useEffect)(function() {
                    return null != t && t.length && o(t),
                        function() {}
                }, [t]), h().createElement("div", {
                    className: "section-content remove-panel"
                }, h().createElement("ul", {
                    className: a
                }, 0 < (null == r ? void 0 : r.length) && r.map(function(e) {
                    return h().createElement(R, {
                        badgeData: e,
                        badgeType: n
                    })
                })))
            }
            B.defaultProps = {
                isSectionHeightAuto: !1
            }, B.propTypes = {
                badgesData: r().arrayOf(r().shape({})).isRequired,
                badgeType: r().string.isRequired,
                isSectionHeightAuto: r().bool
            };
            var q = B,
                z = i.EnvironmentUrls.badgesApi,
                H = i.EnvironmentUrls.accountInformationApi,
                F = function(e) {
                    return {
                        url: "".concat(z, "/v1/users/").concat(e, "/badges"),
                        withCredentials: !0
                    }
                },
                $ = function(e) {
                    return {
                        url: "".concat(H, "/v1/users/").concat(e, "/roblox-badges"),
                        withCredentials: !0
                    }
                },
                _ = {
                    desc: "Desc"
                },
                G = function(e) {
                    var t = {
                        sortOrder: _.desc
                    };
                    return n.httpService.get(F(e), t).then(function(e) {
                        return e.data
                    })
                },
                J = function(e) {
                    return n.httpService.get($(e), {}).then(function(e) {
                        return e.data
                    })
                },
                K = HeaderScripts,
                Q = function() {
                    var e, t = /\/users\/(\d+)\//g.exec(null === (e = window) || void 0 === e || null === (t = e.location) || void 0 === t ? void 0 : t.pathname),
                        t = t ? parseInt(t[1], 10) : null;
                    return null != t ? t : null === K.authenticatedUser || void 0 === K.authenticatedUser ? void 0 : K.authenticatedUser.id
                };

            function V() {
                return (V = Object.assign || function(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var n, r = arguments[t];
                        for (n in r) Object.prototype.hasOwnProperty.call(r, n) && (e[n] = r[n])
                    }
                    return e
                }).apply(this, arguments)
            }

            function W(t, e) {
                var n, r = Object.keys(t);
                return Object.getOwnPropertySymbols && (n = Object.getOwnPropertySymbols(t), e && (n = n.filter(function(e) {
                    return Object.getOwnPropertyDescriptor(t, e).enumerable
                })), r.push.apply(r, n)), r
            }

            function X(r) {
                for (var e = 1; e < arguments.length; e++) {
                    var a = null != arguments[e] ? arguments[e] : {};
                    e % 2 ? W(Object(a), !0).forEach(function(e) {
                        var t, n;
                        t = r, e = a[n = e], n in t ? Object.defineProperty(t, n, {
                            value: e,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : t[n] = e
                    }) : Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(a)) : W(Object(a)).forEach(function(e) {
                        Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(a, e))
                    })
                }
                return r
            }

            function Y(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var n = [],
                        r = !0,
                        a = !1,
                        o = void 0;
                    try {
                        for (var i, c = e[Symbol.iterator](); !(r = (i = c.next()).done) && (n.push(i.value), !t || n.length !== t); r = !0);
                    } catch (e) {
                        a = !0, o = e
                    } finally {
                        try {
                            r || null == c.return || c.return()
                        } finally {
                            if (a) throw o
                        }
                    }
                    return n
                }(e, t) || function(e, t) {
                    if (!e) return;
                    if ("string" == typeof e) return Z(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    "Object" === n && e.constructor && (n = e.constructor.name);
                    if ("Map" === n || "Set" === n) return Array.from(e);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return Z(e, t)
                }(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function Z(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function ee(e) {
                var t = e.translate,
                    n = Y((0, g.useState)(!1), 2),
                    r = n[0],
                    a = n[1],
                    o = Y((0, g.useState)([]), 2),
                    i = o[0],
                    c = o[1],
                    n = Y((0, g.useState)(0), 2),
                    l = n[0],
                    u = n[1],
                    o = Y((0, g.useState)(!1), 2),
                    s = o[0],
                    d = o[1],
                    n = Y((0, g.useState)(!1), 2),
                    o = n[0],
                    f = n[1],
                    b = Q(),
                    n = O(b),
                    m = (0, g.useCallback)(function() {
                        a(!0), G(b).then(function(e) {
                            null != e && e.data && (d(!!e.nextPageCursor), u(e.data.length), e = e.data.slice(0, w), c(e.map(function(e) {
                                return X(X({}, e), {}, {
                                    name: e.displayName || e.name,
                                    description: e.displayDescription || e.description,
                                    iconImageId: e.displayIconImageId || e.iconImageId
                                })
                            })))
                        }).catch(console.debug).finally(function() {
                            a(!1)
                        })
                    }, [b]),
                    p = (0, g.useCallback)(function() {
                        window.matchMedia("(max-width: ".concat(767, "px)")).matches ? f(s || E < l) : window.matchMedia("(max-width: ".concat(991, "px)")).matches ? f(s || S < l) : f(s || w < l)
                    }, [s, l]);
                return (0, g.useEffect)(function() {
                    return p(), window.addEventListener("resize", p),
                        function() {
                            return window.removeEventListener("resize", p)
                        }
                }, [p]), (0, g.useEffect)(function() {
                    return m(),
                        function() {}
                }, [m]), h().createElement(h().Fragment, null, r ? h().createElement(y.Loading, null) : null, 0 < i.length && h().createElement(h().Fragment, null, h().createElement(j, V({
                    headerLabel: t(v),
                    isSeeAllShown: o,
                    url: n
                }, e)), h().createElement(q, V({
                    badgesData: i,
                    isInitializedLoading: r,
                    badgeType: k
                }, e))))
            }
            ee.propTypes = {
                translate: r().func.isRequired
            };
            var te = (0, a.withTranslations)(ee, o);

            function ne() {
                return (ne = Object.assign || function(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var n, r = arguments[t];
                        for (n in r) Object.prototype.hasOwnProperty.call(r, n) && (e[n] = r[n])
                    }
                    return e
                }).apply(this, arguments)
            }

            function re(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var n = [],
                        r = !0,
                        a = !1,
                        o = void 0;
                    try {
                        for (var i, c = e[Symbol.iterator](); !(r = (i = c.next()).done) && (n.push(i.value), !t || n.length !== t); r = !0);
                    } catch (e) {
                        a = !0, o = e
                    } finally {
                        try {
                            r || null == c.return || c.return()
                        } finally {
                            if (a) throw o
                        }
                    }
                    return n
                }(e, t) || function(e, t) {
                    if (!e) return;
                    if ("string" == typeof e) return ae(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    "Object" === n && e.constructor && (n = e.constructor.name);
                    if ("Map" === n || "Set" === n) return Array.from(e);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return ae(e, t)
                }(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ae(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function oe(e) {
                var t = e.translate,
                    n = re((0, g.useState)(!1), 2),
                    r = n[0],
                    a = n[1],
                    o = re((0, g.useState)([]), 2),
                    i = o[0],
                    c = o[1],
                    l = re((0, g.useState)(!1), 2),
                    n = l[0],
                    u = l[1],
                    o = re((0, g.useState)(!1), 2),
                    l = o[0],
                    s = o[1],
                    d = Q(),
                    f = (0, g.useCallback)(function() {
                        a(!0), J(d).then(function(e) {
                            e && c(e)
                        }).catch(console.debug).finally(function() {
                            a(!1)
                        })
                    }, [d]),
                    b = (0, g.useCallback)(function() {
                        window.matchMedia("(max-width: ".concat(767, "px)")).matches ? s(i.length > x) : window.matchMedia("(max-width: ".concat(991, "px)")).matches ? s(i.length > A) : s(i.length > p)
                    }, [i]);
                return (0, g.useEffect)(function() {
                    return b(), window.addEventListener("resize", b),
                        function() {
                            return window.removeEventListener("resize", b)
                        }
                }, [b]), (0, g.useEffect)(function() {
                    return f(),
                        function() {}
                }, [f]), h().createElement(h().Fragment, null, r ? h().createElement(y.Loading, null) : null, 0 < i.length && h().createElement(h().Fragment, null, h().createElement(j, ne({
                    headerLabel: t(m),
                    seeMoreLessCallback: function() {
                        u(function(e) {
                            return !e
                        })
                    },
                    seeMore: n,
                    isSeeMoreShown: l
                }, e)), h().createElement(q, ne({
                    badgesData: i,
                    isInitializedLoading: r,
                    isSectionHeightAuto: n,
                    badgeType: C
                }, e))))
            }
            oe.propTypes = {
                translate: r().func.isRequired
            };
            var ie = (0, a.withTranslations)(oe, o),
                ce = "roblox-badges-container",
                le = "player-badges-container";
            (0, n.ready)(function() {
                document.getElementById(ce) && (0, e.render)(h().createElement(ie, null), document.getElementById(ce)), document.getElementById(le) && (0, e.render)(h().createElement(te, null), document.getElementById(le))
            })
        }()
}();
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/27418030ab2feab333cc0ea69e43ae51-profileBadges.bundle.min.js.map

/* Bundle detector */
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("ProfileBadges");