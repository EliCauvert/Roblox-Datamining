;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "b0870bb1-0d43-b13a-4895-721de8eca0b4")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 846130, e => {
    "use strict";
    var t = e.i(157700);
    let r = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerSupport",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enableExpeditedReview",
            defaultValue: !1
        }),
        a = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerHostedEvents",
            defaultValue: !1
        }),
        o = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportCreatorTicketReroute",
            defaultValue: !1
        });
    e.s(["enableExpeditedReview", 0, n, "enablePlayerHostedEvents", 0, a, "enablePlayerSupport", 0, r, "enablePlayerSupportCreatorTicketReroute", 0, o])
}, 242002, e => {
    "use strict";
    let t = (0, e.i(157700).defineFlag)({
        namespace: "game-discovery-serving",
        name: "isHomeAcquisitionSignalsEnabled",
        defaultValue: !0
    });
    e.s(["isHomeAcquisitionSignalsEnabled", 0, t])
}, 967230, e => {
    "use strict";
    var t = e.i(157700);
    let r = (0, t.defineFlag)({
            namespace: "immersive-ads",
            name: "isAdsPageRedesignEnabled",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
            namespace: "immersive-ads",
            name: "isRewardedVideoRedesignEnabled",
            defaultValue: !0
        });
    e.s(["isAdsPageRedesignEnabled", 0, r, "isRewardedVideoRedesignEnabled", 0, n])
}, 82899, e => {
    "use strict";
    let t = (0, e.i(157700).defineFlag)({
        namespace: "leaderboards",
        name: "isLeaderboardConfigsEnabled",
        defaultValue: !1
    });
    e.s(["isLeaderboardConfigsEnabled", 0, t])
}, 998683, e => {
    "use strict";
    var t = e.i(721281),
        r = e.i(502585),
        n = e.i(272593);
    let a = new class {
        async getLocale(e) {
            return this.localeApi.v1LocalesGet(e)
        }
        async getUserLocalizationLocusSupportedLocales() {
            return this.localeApi.v1LocalesUserLocalizationLocusSupportedLocalesGet()
        }
        async getSupportedLocalesForCreators(e) {
            return this.localeApi.v1LocalesSupportedLocalesForCreatorsGet(e)
        }
        async getSupportedLocalesForFeature(e) {
            return this.localeApi.v1LocalesSupportedLocalesForFeatureGet(e)
        }
        constructor() {
            (0, t._)(this, "localeApi", void 0), this.localeApi = new r.LocaleApi((0, n.createClientConfiguration)("locale", "bedev1"))
        }
    };
    e.s(["default", 0, a])
}, 607204, e => {
    "use strict";
    var t = e.i(581548),
        r = e.i(272593),
        n = e.i(127403);
    let a = (0, r.createClientConfiguration)("orgs", "bedev2", {
            middleware: [new n.default]
        }),
        o = new t.OrganizationApi(a),
        i = new t.InvitationApi(a),
        u = new t.RoleApi(a),
        s = new t.UserApi(a),
        l = new t.GroupUniversePayoutApi(a);
    e.s(["default", 0, {
        organizationClient: {
            getOrganization: async e => o.v1OrganizationsGet({
                groupId: e
            })
        },
        invitationClient: {
            createInvitation: async (e, t) => i.v1OrganizationsOrganizationIdInvitationsPost({
                organizationId: e,
                createInvitationRequestModel: t
            }),
            getInvitationsByOrganizationId: async (e, t, r) => i.v1OrganizationsOrganizationIdInvitationsGet({
                organizationId: e,
                pageToken: t,
                maxPageSize: r
            }),
            getInvitation: async (e, t) => i.v1OrganizationsOrganizationIdInvitationsInvitationIdGet({
                organizationId: e,
                invitationId: t
            }),
            acceptOrDeclineInvitation: async (e, t, r) => i.v1OrganizationsOrganizationIdInvitationsInvitationIdPatch({
                organizationId: e,
                invitationId: t,
                updateInvitationRequestModel: r
            }),
            deleteInvitationById: async (e, t) => i.v1OrganizationsOrganizationIdInvitationsInvitationIdDelete({
                organizationId: e,
                invitationId: t
            }),
            getRoleIdsByInvitationId: async (e, t) => i.v1OrganizationsOrganizationIdInvitationsInvitationIdRoleIdsGet({
                organizationId: e,
                invitationId: t
            })
        },
        roleClient: {
            createRole: async (e, t) => u.v1OrganizationsOrganizationIdRolesPost({
                organizationId: e,
                createOrUpdateRoleRequestModel: t
            }),
            getRoleMetadata: async (e, t, r) => u.v1OrganizationsOrganizationIdRolesRoleIdMetadataGet({
                organizationId: e,
                roleId: t,
                isDefault: r
            }),
            updateRoleMetadata: async (e, t, r) => u.v1OrganizationsOrganizationIdRolesRoleIdMetadataPatch({
                organizationId: e,
                roleId: t,
                createOrUpdateRoleRequestModel: r
            }),
            updateRolePosition: async (e, t, r) => u.v1OrganizationsOrganizationIdRolesRoleIdPositionPatch({
                organizationId: e,
                roleId: t,
                updateRolePositionRequestModel: r
            }),
            getRolesByOrganization: async (e, t, r) => u.v1OrganizationsOrganizationIdRolesGet({
                organizationId: e,
                pageToken: t,
                maxPageSize: r
            }),
            getUsersWithRole: async (e, t, r, n, a) => u.v1OrganizationsOrganizationIdRolesRoleIdUsersGet({
                organizationId: e,
                roleId: t,
                pageToken: r,
                maxPageSize: n,
                isDefault: a
            }),
            deleteRole: async (e, t) => u.v1OrganizationsOrganizationIdRolesRoleIdDelete({
                organizationId: e,
                roleId: t
            }),
            getInvitationsWithRole: async (e, t, r, n) => u.v1OrganizationsOrganizationIdRolesRoleIdInvitationsGet({
                organizationId: e,
                roleId: t,
                pageToken: r,
                maxPageSize: n
            })
        },
        userClient: {
            getUsersByOrganization: async (e, t, r) => s.v1OrganizationsOrganizationIdUsersGet({
                organizationId: e,
                pageToken: t,
                maxPageSize: r
            }),
            removeUserFromOrganization: async (e, t) => s.v1OrganizationsOrganizationIdUsersUserIdDelete({
                organizationId: e,
                userId: t
            }),
            getUserInvitationByOrganization: async (e, t) => s.v1OrganizationsOrganizationIdUsersUserIdInvitationsGet({
                organizationId: e,
                userId: t
            }),
            getUserPermissions: async (e, t) => {
                let {
                    raw: r
                } = await s.v1OrganizationsOrganizationIdUsersUserIdPermissionsGetRaw({
                    organizationId: e,
                    userId: t
                });
                return await r.json()
            },
            getUserRoles: async (e, t, r, n) => s.v1OrganizationsOrganizationIdUsersUserIdRolesGet({
                organizationId: e,
                userId: t,
                pageToken: r,
                maxPageSize: n
            }),
            addUserToOrganization: async (e, t) => s.v1OrganizationsOrganizationIdUsersUserIdPost({
                organizationId: e,
                userId: t
            }),
            addUserToRole: async (e, t, r) => s.v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdPost({
                organizationId: e,
                userId: t,
                roleId: r
            }),
            removeUserFromRole: async (e, t, r) => s.v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdDelete({
                organizationId: e,
                userId: t,
                roleId: r
            })
        },
        groupUniversePayoutClient: {
            getUniversePayouts: async e => l.v1OrganizationsOrganizationIdPayoutsUniverseIdGet(e),
            updateUniversePayouts: async e => l.v1OrganizationsOrganizationIdPayoutsUniverseIdPatch(e),
            findUniversePayouts: async e => l.v1OrganizationsOrganizationIdPayoutsUniversesGet(e),
            getLatestOneTimePayoutForUsers: async (e, t) => {
                let r = {
                    organizationId: e,
                    userIds: t.map(String)
                };
                return l.v1OrganizationsOrganizationIdPayoutsLatestGet(r)
            },
            getSuggestedPayouts: async e => l.v1OrganizationsOrganizationIdPayoutsSuggestedGet({
                organizationId: e
            })
        }
    }])
}, 127403, e => {
    "use strict";
    e.s(["default", 0, class {
        post(e) {
            let {
                fetch: t,
                url: r,
                init: n,
                response: a
            } = e, o = new URL(r);
            return "POST" !== n.method && "PATCH" !== n.method || "true" === o.searchParams.get("isSecure") || 403 !== a.status ? Promise.resolve(a) : (o.searchParams.set("isSecure", "true"), t(o.toString(), n))
        }
    }])
}, 384340, 672401, e => {
    "use strict";
    var t = e.i(416340);
    let r = (0, t.createContext)({
        isOrganizationRefreshRequired: !1,
        organization: void 0,
        permissions: void 0,
        refreshOrganization: () => ({}),
        refreshPermission: () => Promise.resolve(),
        isOrganizationLoading: !1
    });
    r.displayName = "Organization", e.s(["default", 0, r], 672401), e.s(["default", 0, function() {
        return (0, t.useContext)(r)
    }], 384340)
}, 927868, e => {
    "use strict";
    e.s(["getEnumKeyByValue", 0, (e, t) => {
        let r = Object.entries(e).find(e => {
            let [, r] = e;
            return r === t
        });
        return r ? r[0] : null
    }, "isValidArrayEnumValue", 0, (e, t) => e.includes(t), "isValidEnumValue", 0, (e, t) => Object.values(e).includes(t)])
}, 745873, e => {
    "use strict";
    var t = e.i(221628),
        r = e.i(416340),
        n = e.i(458451),
        a = e.i(533414),
        o = e.i(157310),
        i = e.i(279149),
        u = e.i(602635),
        s = e.i(814975);
    let l = (0, e.i(272593).createClientConfiguration)("creator-home-api", "bedev2"),
        c = new i.GroupsApi(l),
        d = function() {
            let {
                user: e
            } = (0, s.useAuthentication)();
            return (0, o.useQuery)({
                queryKey: u.getGroupsQueryKey,
                enabled: !!e,
                queryFn: () => {
                    let e;
                    return e = {
                        surface: i.GroupListSurface.CreatorHub
                    }, c.groupsListGroups(e)
                }
            })
        },
        f = (0, r.createContext)(null);
    e.s(["GroupsProvider", 0, e => {
        let {
            children: o
        } = e, {
            user: i
        } = (0, n.useRobloxAuthentication)(), {
            data: u,
            isLoading: s,
            refetch: l
        } = d(), [c, p] = (0, a.useLocalStorage)("creatorHubGroups.".concat(null == i ? void 0 : i.id), null), [_, E] = (0, a.useLocalStorage)("creatorHubGroup.".concat(null == i ? void 0 : i.id), null), [m, g] = (0, a.useLocalStorage)("creatorHubGroupData.".concat(null == i ? void 0 : i.id), {}), h = (0, r.useCallback)(e => {
            E(e);
            let t = null === e ? "user" : e;
            g(e => {
                let r = {
                    lastSelected: Date.now(),
                    priority: 1
                };
                if (e[t]) {
                    let {
                        priority: n,
                        lastSelected: a
                    } = e[t];
                    "number" != typeof n || Number.isNaN(n) || "number" != typeof a || Number.isNaN(a) || (r.priority = n * (1 + Math.log10(1 + 10 / Math.max(Date.now() - a, 864e5))))
                }
                return {
                    ...e,
                    [t]: r
                }
            })
        }, [E, g]), v = (0, r.useMemo)(() => {
            if (null == u ? void 0 : u.groups) return null == u ? void 0 : u.groups;
            if (null === c) return [];
            try {
                return "string" == typeof c ? JSON.parse(c) : c
            } catch (e) {
                return []
            }
        }, [c, null == u ? void 0 : u.groups]), R = (0, r.useMemo)(() => {
            var e;
            return _ && null != (e = v.find(e => {
                let {
                    id: t
                } = e;
                return t === _
            })) ? e : null
        }, [_, v]);
        (0, r.useEffect)(() => {
            (null == i ? void 0 : i.id) && (null == u ? void 0 : u.groups) && !s && p(null == u ? void 0 : u.groups)
        }, [null == u ? void 0 : u.groups, v, s, p, null == i ? void 0 : i.id]);
        let y = (0, r.useMemo)(() => ({
            groups: v,
            currentGroup: R,
            groupData: m,
            isFetched: !s && !!(null == i ? void 0 : i.id),
            refreshGroups: l,
            setCurrentGroup: h
        }), [R, m, v, s, l, h, null == i ? void 0 : i.id]);
        return (0, t.jsx)(f.Provider, {
            value: y,
            children: o
        })
    }, "useCurrentGroup", 0, () => {
        let e = (0, r.useContext)(f);
        if (null === e) throw Error("useCurrentGroup must be used within a GroupsProvider");
        return e.currentGroup
    }, "useGroups", 0, () => {
        let e = (0, r.useContext)(f);
        if (null === e) throw Error("useGroups must be used within a GroupsProvider");
        return e
    }], 745873)
}, 196945, e => {
    "use strict";
    var t = e.i(865800),
        r = e.i(416340),
        n = e.i(323356);
    e.i(221628), e.i(149285);
    var a = (0, r.createContext)({
        ref: {
            current: null
        },
        enqueue: function() {
            throw Error("useSnackbar was invoked without SnackbarProvider")
        },
        close: function() {
            throw Error("useSnackbar was invoked without SnackbarProvider")
        }
    });
    e.s(["default", 0, function(e) {
        var o, i, u, s, l = e.children,
            c = (0, t.a)(e, ["children"]),
            d = (0, r.useRef)(null),
            f = (0, r.useState)(!1),
            p = f[0],
            _ = f[1],
            E = (0, r.useState)([]),
            m = E[0],
            g = E[1],
            h = (0, r.useCallback)(function(e, r) {
                void 0 === e && (e = {}), void 0 === r && (r = function() {
                    return !0
                }), g(function(n) {
                    return (0, t.b)((0, t.b)([], n, !0), [{
                        props: e,
                        shouldClose: r
                    }], !1)
                })
            }, [g]),
            v = (0, r.useCallback)(function() {
                _(!1)
            }, [_]);
        (0, r.useEffect)(function() {
            m.length > 0 && _(!0)
        }, [m.length]);
        var R = (0, r.useMemo)(function() {
            return {
                ref: d,
                enqueue: h,
                close: v
            }
        }, [v, h]);
        return r.default.createElement(r.default.Fragment, null, r.default.createElement(a.Provider, {
            value: R
        }, l), r.default.createElement(n.S, (0, t._)({}, (null == (o = m[0]) ? void 0 : o.props) || {}, c, {
            TransitionProps: (0, t._)((0, t._)({}, (null == (u = null == (i = m[0]) ? void 0 : i.props) ? void 0 : u.TransitionProps) || {}), {
                onExited: function(e) {
                    var r, n, a, o;
                    g(function(e) {
                        var r = e.slice(1);
                        return (0, t.b)([], r, !0)
                    }), (null == (n = null == (r = m[0]) ? void 0 : r.props.TransitionProps) ? void 0 : n.onExited) && (null == (o = null == (a = m[0]) ? void 0 : a.props.TransitionProps) || o.onExited(e))
                }
            }),
            onClose: function(e, t) {
                var r, n, a;
                (null == (r = m[0]) ? void 0 : r.shouldClose(t)) && _(!1), (null == (n = m[0]) ? void 0 : n.props.onClose) && (null == (a = m[0]) || a.props.onClose(e, t))
            },
            open: p
        }), null == (s = m[0]) ? void 0 : s.props.children))
    }, "useSnackbar", 0, function() {
        var e = (0, r.useContext)(a);
        return {
            ref: e.ref,
            enqueue: e.enqueue,
            close: e.close
        }
    }])
}, 793236, (e, t, r) => {
    "trimStart" in String.prototype || (String.prototype.trimStart = String.prototype.trimLeft), "trimEnd" in String.prototype || (String.prototype.trimEnd = String.prototype.trimRight), "description" in Symbol.prototype || Object.defineProperty(Symbol.prototype, "description", {
        configurable: !0,
        get: function() {
            var e = /\((.*)\)/.exec(this.toString());
            return e ? e[1] : void 0
        }
    }), Array.prototype.flat || (Array.prototype.flat = function(e, t) {
        return t = this.concat.apply([], this), e > 1 && t.some(Array.isArray) ? t.flat(e - 1) : t
    }, Array.prototype.flatMap = function(e, t) {
        return this.map(e, t).flat()
    }), Promise.prototype.finally || (Promise.prototype.finally = function(e) {
        if ("function" != typeof e) return this.then(e, e);
        var t = this.constructor || Promise;
        return this.then(function(r) {
            return t.resolve(e()).then(function() {
                return r
            })
        }, function(r) {
            return t.resolve(e()).then(function() {
                throw r
            })
        })
    }), Object.fromEntries || (Object.fromEntries = function(e) {
        return Array.from(e).reduce(function(e, t) {
            return e[t[0]] = t[1], e
        }, {})
    }), Array.prototype.at || (Array.prototype.at = function(e) {
        var t = Math.trunc(e) || 0;
        if (t < 0 && (t += this.length), !(t < 0 || t >= this.length)) return this[t]
    }), Object.hasOwn || (Object.hasOwn = function(e, t) {
        if (null == e) throw TypeError("Cannot convert undefined or null to object");
        return Object.prototype.hasOwnProperty.call(Object(e), t)
    }), "canParse" in URL || (URL.canParse = function(e, t) {
        try {
            return new URL(e, t), !0
        } catch (e) {
            return !1
        }
    })
}, 447551, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var n = {
        default: function() {
            return u
        },
        isEqualNode: function() {
            return i
        }
    };
    for (var a in n) Object.defineProperty(r, a, {
        enumerable: !0,
        get: n[a]
    });
    let o = e.r(304371);

    function i(e, t) {
        if (e instanceof HTMLElement && t instanceof HTMLElement) {
            let r = t.getAttribute("nonce");
            if (r && !e.getAttribute("nonce")) {
                let n = t.cloneNode(!0);
                return n.setAttribute("nonce", ""), n.nonce = r, r === e.nonce && e.isEqualNode(n)
            }
        }
        return e.isEqualNode(t)
    }

    function u() {
        return {
            mountedInstances: new Set,
            updateHead: e => {
                let t = {};
                e.forEach(e => {
                    if ("link" === e.type && e.props["data-optimized-fonts"])
                        if (document.querySelector('style[data-href="'.concat(e.props["data-href"], '"]'))) return;
                        else e.props.href = e.props["data-href"], e.props["data-href"] = void 0;
                    let r = t[e.type] || [];
                    r.push(e), t[e.type] = r
                });
                let r = t.title ? t.title[0] : null,
                    n = "";
                if (r) {
                    let {
                        children: e
                    } = r.props;
                    n = "string" == typeof e ? e : Array.isArray(e) ? e.join("") : ""
                }
                n !== document.title && (document.title = n), ["meta", "base", "link", "style", "script"].forEach(e => {
                    ! function(e, t) {
                        let r = document.querySelector("head");
                        if (!r) return;
                        let n = new Set(r.querySelectorAll("".concat(e, "[data-next-head]")));
                        if ("meta" === e) {
                            let e = r.querySelector("meta[charset]");
                            null !== e && n.add(e)
                        }
                        let a = [];
                        for (let e = 0; e < t.length; e++) {
                            let r = function(e) {
                                let {
                                    type: t,
                                    props: r
                                } = e, n = document.createElement(t);
                                (0, o.setAttributesFromProps)(n, r);
                                let {
                                    children: a,
                                    dangerouslySetInnerHTML: i
                                } = r;
                                return i ? n.innerHTML = i.__html || "" : a && (n.textContent = "string" == typeof a ? a : Array.isArray(a) ? a.join("") : ""), n
                            }(t[e]);
                            r.setAttribute("data-next-head", "");
                            let u = !0;
                            for (let e of n)
                                if (i(e, r)) {
                                    n.delete(e), u = !1;
                                    break
                                } u && a.push(r)
                        }
                        for (let e of n) {
                            var u;
                            null == (u = e.parentNode) || u.removeChild(e)
                        }
                        for (let e of a) "meta" === e.tagName.toLowerCase() && null !== e.getAttribute("charset") && r.prepend(e), r.appendChild(e)
                    }(e, t[e] || [])
                })
            }
        }
    }("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 343690, (e, t, r) => {
    "use strict";
    let n, a, o, i, u, s, l, c, d, f, p, _;
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var E = {
        emitter: function() {
            return k
        },
        hydrate: function() {
            return ef
        },
        initialize: function() {
            return W
        },
        router: function() {
            return n
        },
        version: function() {
            return B
        }
    };
    for (var m in E) Object.defineProperty(r, m, {
        enumerable: !0,
        get: E[m]
    });
    let g = e.r(2879),
        h = e.r(221628);
    e.r(793236);
    let v = g._(e.r(416340)),
        R = g._(e.r(851670)),
        y = e.r(4063),
        P = g._(e.r(570613)),
        S = e.r(35391),
        O = e.r(868795),
        I = e.r(990761),
        T = e.r(788081),
        b = e.r(396326),
        A = e.r(272845),
        C = g._(e.r(447551)),
        N = g._(e.r(70274)),
        L = e.r(598424),
        M = e.r(761438),
        w = e.r(641322),
        D = e.r(424204),
        j = e.r(295753),
        U = e.r(704278),
        x = e.r(419810),
        F = e.r(845290),
        z = e.r(956959),
        G = e.r(701485);
    e.r(604029), e.r(248643);
    let B = "16.3.0",
        k = (0, P.default)(),
        H = !1;
    class q extends v.default.Component {
        componentDidCatch(e, t) {
            this.props.fn(e, t)
        }
        componentDidMount() {
            this.scrollToHash(), n.isSsr && (a.isFallback || a.nextExport && ((0, I.isDynamicRoute)(n.pathname) || location.search || 1) || a.props && a.props.__N_SSG && (location.search || 1)) && n.replace(n.pathname + "?" + String((0, T.assign)((0, T.urlQueryToSearchParams)(n.query), new URLSearchParams(location.search))), o, {
                _h: 1,
                shallow: !a.isFallback && !H
            }).catch(e => {
                if (!e.cancelled) throw e
            })
        }
        componentDidUpdate() {
            this.scrollToHash()
        }
        scrollToHash() {
            let {
                hash: e
            } = location;
            if (!(e = e && e.substring(1))) return;
            let t = document.getElementById(e);
            t && setTimeout(() => t.scrollIntoView(), 0)
        }
        render() {
            return this.props.children
        }
    }
    async function W() {
        arguments.length > 0 && void 0 !== arguments[0] && arguments[0], a = JSON.parse(document.getElementById("__NEXT_DATA__").textContent), window.__NEXT_DATA__ = a, _ = a.defaultLocale;
        let t = a.assetPrefix || "";
        if (self.__next_set_public_path__("".concat(t, "/_next/")), o = (0, b.getURL)(), (0, U.hasBasePath)(o) && (o = (0, j.removeBasePath)(o)), a.scriptLoader) {
            let {
                initScriptLoader: t
            } = e.r(596517);
            t(a.scriptLoader)
        }
        i = new N.default(a.buildId, t);
        let r = e => {
            let [t, r] = e;
            return i.routeLoader.onEntrypoint(t, r)
        };
        return window.__NEXT_P && window.__NEXT_P.map(e => setTimeout(() => r(e), 0)), window.__NEXT_P = [], window.__NEXT_P.push = r, (s = (0, C.default)()).getIsSsr = () => n.isSsr, u = document.getElementById("__next"), {
            assetPrefix: t
        }
    }

    function V(e, t) {
        return (0, h.jsx)(e, {
            ...t
        })
    }

    function X(e) {
        var t;
        let {
            children: r
        } = e, a = v.default.useMemo(() => (0, F.adaptForAppRouterInstance)(n), []);
        return (0, h.jsx)(q, {
            fn: e => K({
                App: d,
                err: e
            }).catch(e => console.error("Error rendering page: ", e)),
            children: (0, h.jsx)(x.AppRouterContext.Provider, {
                value: a,
                children: (0, h.jsx)(z.SearchParamsContext.Provider, {
                    value: (0, F.adaptForSearchParams)(n),
                    children: (0, h.jsx)(F.PathnameContextProviderAdapter, {
                        router: n,
                        isAutoExport: null != (t = self.__NEXT_DATA__.autoExport) && t,
                        children: (0, h.jsx)(z.PathParamsContext.Provider, {
                            value: (0, F.adaptForPathParams)(n),
                            children: (0, h.jsx)(S.RouterContext.Provider, {
                                value: (0, M.makePublicRouterInstance)(n),
                                children: (0, h.jsx)(y.HeadManagerContext.Provider, {
                                    value: s,
                                    children: (0, h.jsx)(D.ImageConfigContext.Provider, {
                                        value: {
                                            deviceSizes: [640, 750, 828, 1080, 1200, 1920, 2048, 3840],
                                            imageSizes: [32, 48, 64, 96, 128, 256, 384],
                                            qualities: [75],
                                            path: "/_next/image",
                                            loader: "default",
                                            dangerouslyAllowSVG: !1,
                                            unoptimized: !1
                                        },
                                        children: r
                                    })
                                })
                            })
                        })
                    })
                })
            })
        })
    }
    let Y = e => t => {
        let r = {
            ...t,
            Component: p,
            err: a.err,
            router: n
        };
        return (0, h.jsx)(X, {
            children: V(e, r)
        })
    };

    function K(t) {
        let {
            App: r,
            err: u
        } = t;
        return console.error(u), console.error("A client-side exception has occurred, see here for more info: https://nextjs.org/docs/messages/client-side-exception-occurred"), i.loadPage("/_error").then(n => {
            let {
                page: a,
                styleSheets: o
            } = n;
            return (null == l ? void 0 : l.Component) === a ? e.A(378337).then(n => e.A(320375).then(e => (t.App = r = e.default, n))).then(e => ({
                ErrorComponent: e.default,
                styleSheets: []
            })) : {
                ErrorComponent: a,
                styleSheets: o
            }
        }).then(e => {
            var i;
            let {
                ErrorComponent: s,
                styleSheets: l
            } = e, c = Y(r), d = {
                Component: s,
                AppTree: c,
                router: n,
                ctx: {
                    err: u,
                    pathname: a.page,
                    query: a.query,
                    asPath: o,
                    AppTree: c
                }
            };
            return Promise.resolve((null == (i = t.props) ? void 0 : i.err) ? t.props : (0, b.loadGetInitialProps)(r, d)).then(e => ec({
                ...t,
                err: u,
                Component: s,
                styleSheets: l,
                props: e
            }))
        })
    }

    function Q(e) {
        let {
            callback: t
        } = e;
        return v.default.useLayoutEffect(() => t(), [t]), null
    }
    let J = "beforeRender",
        Z = "afterRender",
        $ = "afterHydrate",
        ee = "routeChange",
        et = "Next.js-hydration",
        er = "Next.js-route-change-to-render",
        en = "Next.js-render",
        ea = null,
        eo = !0;

    function ei() {
        [J, $, Z, ee].forEach(e => performance.clearMarks(e))
    }

    function eu() {
        b.ST && (performance.mark($), performance.getEntriesByName(J, "mark").length && (performance.measure("Next.js-before-hydration", "navigationStart", J), performance.measure(et, J, $)), f && performance.getEntriesByName(et).forEach(f), ei())
    }

    function es() {
        if (!b.ST) return;
        performance.mark(Z);
        let e = performance.getEntriesByName(ee, "mark");
        e.length && (performance.getEntriesByName(J, "mark").length && (performance.measure(er, e[0].name, J), performance.measure(en, J, Z), f && (performance.getEntriesByName(en).forEach(f), performance.getEntriesByName(er).forEach(f))), ei(), [er, en].forEach(e => performance.clearMeasures(e)))
    }

    function el(e) {
        let {
            callbacks: t,
            children: r
        } = e;
        return v.default.useLayoutEffect(() => t.forEach(e => e()), [t]), r
    }

    function ec(e) {
        var t, r;
        let a, o, {
                App: i,
                Component: s,
                props: d,
                err: f
            } = e,
            p = "initial" in e ? void 0 : e.styleSheets;
        s = s || l.Component;
        let _ = {
            ...d = d || l.props,
            Component: s,
            err: f,
            router: n
        };
        l = _;
        let E = new Promise((e, t) => {
            c && c(), o = () => {
                c = null, e()
            }, c = () => {
                c = null;
                let e = Object.defineProperty(Error("Cancel rendering route"), "__NEXT_ERROR_CODE", {
                    value: "E503",
                    enumerable: !1,
                    configurable: !0
                });
                e.cancelled = !0, t(e)
            }
        });

        function m() {
            o()
        }! function() {
            let e;
            if (!p) return;
            let t = new Set((e = document.querySelectorAll("style[data-n-href]"), [].slice.call(e)).map(e => e.getAttribute("data-n-href"))),
                r = document.querySelector("noscript[data-n-css]"),
                n = null == r ? void 0 : r.getAttribute("data-n-css");
            p.forEach(e => {
                let {
                    href: r,
                    text: a
                } = e;
                if (!t.has(r)) {
                    let e = document.createElement("style");
                    e.setAttribute("data-n-href", r), e.setAttribute("media", "x"), n && e.setAttribute("nonce", n), document.head.appendChild(e), e.appendChild(document.createTextNode(a))
                }
            })
        }();
        let g = (0, h.jsxs)(h.Fragment, {
            children: [(0, h.jsx)(Q, {
                callback: function() {
                    if (e.scroll) {
                        let {
                            x: t,
                            y: r
                        } = e.scroll;
                        (0, O.disableSmoothScrollDuringRouteTransition)(() => {
                            window.scrollTo(t, r)
                        })
                    }
                }
            }), (0, h.jsxs)(X, {
                children: [V(i, _), (0, h.jsx)(A.Portal, {
                    type: "next-route-announcer",
                    children: (0, h.jsx)(L.RouteAnnouncer, {})
                })]
            })]
        });
        return t = u, r = e => (0, h.jsx)(el, {
            callbacks: [e, m],
            children: g
        }), b.ST && performance.mark(J), a = r(eo ? eu : es), ea ? (0, v.default.startTransition)(() => {
            ea.render(a)
        }) : (ea = R.default.hydrateRoot(t, a, {
            onRecoverableError: G.onRecoverableError
        }), eo = !1), E
    }
    async function ed(e) {
        if (e.err && (void 0 === e.Component || !e.isHydratePass)) return void await K(e);
        try {
            await ec(e)
        } catch (r) {
            let t = (0, w.getProperError)(r);
            if (t.cancelled) throw t;
            await K({
                ...e,
                err: t
            })
        }
    }
    async function ef(e) {
        let t = a.err;
        try {
            let e = await i.routeLoader.whenEntrypoint("/_app");
            if ("error" in e) throw e.error;
            let {
                component: t,
                exports: r
            } = e;
            d = t, r && r.reportWebVitals && (f = e => {
                let t, {
                        id: n,
                        name: a,
                        startTime: o,
                        value: i,
                        duration: u,
                        entryType: s,
                        entries: l,
                        attribution: c
                    } = e,
                    d = "".concat(Date.now(), "-").concat(Math.floor(Math.random() * (9e12 - 1)) + 1e12);
                l && l.length && (t = l[0].startTime);
                let f = {
                    id: n || d,
                    name: a,
                    startTime: o || t,
                    value: null == i ? u : i,
                    label: "mark" === s || "measure" === s ? "custom" : "web-vital"
                };
                c && (f.attribution = c), r.reportWebVitals(f)
            });
            let n = await i.routeLoader.whenEntrypoint(a.page);
            if ("error" in n) throw n.error;
            p = n.component
        } catch (e) {
            t = (0, w.getProperError)(e)
        }
        window.__NEXT_PRELOADREADY && await window.__NEXT_PRELOADREADY(a.dynamicIds), n = (0, M.createRouter)(a.page, a.query, o, {
            initialProps: a.props,
            pageLoader: i,
            App: d,
            Component: p,
            wrapApp: Y,
            err: t,
            isFallback: !!a.isFallback,
            subscription: (e, t, r) => ed(Object.assign({}, e, {
                App: t,
                scroll: r
            })),
            locale: a.locale,
            locales: a.locales,
            defaultLocale: _,
            domainLocales: a.domainLocales,
            isPreview: a.isPreview
        }), H = await n._initialMatchesMiddlewarePromise;
        let r = {
            App: d,
            initial: !0,
            Component: p,
            props: a.props,
            err: t,
            isHydratePass: !0
        };
        (null == e ? void 0 : e.beforeRender) && await e.beforeRender(), ed(r)
    }("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 9607, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), e.r(381855), e.r(821001);
    let n = e.r(343690);
    window.next = {
        version: n.version,
        turbopack: !0,
        get router() {
            return n.router
        },
        emitter: n.emitter
    }, self.__next_set_public_path__ = () => {}, self.__webpack_hash__ = "", (0, n.initialize)({}).then(() => (self.__turbopack_load_page_chunks__ = (t, r) => {
        Promise.all(r.map(t => e.l(t))).catch(e => console.error("failed to load chunks for page " + t, e))
    }, (0, n.hydrate)())).catch(e => {
        console.error("Error was not caught", e)
    }), ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 70274, (e, t, r) => {
    "use strict";
    var n = e.i(2226);
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "default", {
        enumerable: !0,
        get: function() {
            return _
        }
    });
    let a = e.r(2879),
        o = e.r(333626),
        i = e.r(339555),
        u = a._(e.r(940470)),
        s = e.r(875052),
        l = e.r(990761),
        c = e.r(221565),
        d = e.r(578905),
        f = e.r(530169);
    e.r(178390);
    let p = e.r(160899);
    class _ {
        getPageList() {
            return (0, f.getClientBuildManifest)().then(e => e.sortedPages)
        }
        getMiddleware() {
            if (n.default.env.__NEXT_MIDDLEWARE_MATCHERS) {
                let e = n.default.env.__NEXT_MIDDLEWARE_MATCHERS;
                return window.__MIDDLEWARE_MATCHERS = e || void 0, window.__MIDDLEWARE_MATCHERS
            }
            if (window.__MIDDLEWARE_MATCHERS) return window.__MIDDLEWARE_MATCHERS;
            {
                let e = new Promise(e => {
                    let t = self.__MIDDLEWARE_MATCHERS_CB;
                    self.__MIDDLEWARE_MATCHERS_CB = () => {
                        e(self.__MIDDLEWARE_MATCHERS), t && t()
                    }
                });
                return (0, p.resolvePromiseWithTimeout)(e, (0, f.markAssetError)(Object.defineProperty(Error("Failed to load client middleware manifest"), "__NEXT_ERROR_CODE", {
                    value: "E980",
                    enumerable: !1,
                    configurable: !0
                })), void 0)
            }
        }
        getDataHref(e) {
            var t;
            let r, {
                    asPath: n,
                    href: a,
                    locale: f
                } = e,
                {
                    pathname: p,
                    query: _,
                    search: E
                } = (0, c.parseRelativeUrl)(a),
                {
                    pathname: m
                } = (0, c.parseRelativeUrl)(n),
                g = (0, d.removeTrailingSlash)(p);
            if ("/" !== g[0]) throw Object.defineProperty(Error('Route name should start with a "/", got "'.concat(g, '"')), "__NEXT_ERROR_CODE", {
                value: "E303",
                enumerable: !1,
                configurable: !0
            });
            return t = e.skipInterpolation ? m : (0, l.isDynamicRoute)(g) ? (0, i.interpolateAs)(p, m, _).result : g, r = (0, u.default)((0, d.removeTrailingSlash)((0, s.addLocale)(t, f)), ".json"), (0, o.addBasePath)("/_next/data/".concat(this.buildId).concat(r).concat(E), !0)
        }
        _isSsg(e) {
            return this.promisedSsgManifest.then(t => t.has(e))
        }
        loadPage(e) {
            return this.routeLoader.loadRoute(e).then(e => {
                if ("component" in e) return {
                    page: e.component,
                    mod: e.exports,
                    styleSheets: e.styles.map(e => ({
                        href: e.href,
                        text: e.content
                    }))
                };
                throw e.error
            })
        }
        prefetch(e) {
            return this.routeLoader.prefetch(e)
        }
        constructor(e, t) {
            this.routeLoader = (0, f.createRouteLoader)(t), this.buildId = e, this.assetPrefix = t, this.promisedSsgManifest = new Promise(e => {
                window.__SSG_MANIFEST ? e(window.__SSG_MANIFEST) : window.__SSG_MANIFEST_CB = () => {
                    e(window.__SSG_MANIFEST)
                }
            })
        }
    }("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 272845, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "Portal", {
        enumerable: !0,
        get: function() {
            return o
        }
    });
    let n = e.r(416340),
        a = e.r(149285),
        o = e => {
            let {
                children: t,
                type: r
            } = e, [o, i] = (0, n.useState)(null);
            return (0, n.useEffect)(() => {
                let e = document.createElement(r);
                return document.body.appendChild(e), i(e), () => {
                    document.body.removeChild(e)
                }
            }, [r]), o ? (0, a.createPortal)(t, o) : null
        };
    ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 177195, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "reportGlobalError", {
        enumerable: !0,
        get: function() {
            return n
        }
    });
    let n = "function" == typeof reportError ? reportError : e => {
        globalThis.console.error(e)
    };
    ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 701485, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var n = {
        isRecoverableError: function() {
            return c
        },
        onRecoverableError: function() {
            return d
        }
    };
    for (var a in n) Object.defineProperty(r, a, {
        enumerable: !0,
        get: n[a]
    });
    let o = e.r(2879),
        i = e.r(450392),
        u = o._(e.r(641322)),
        s = e.r(177195),
        l = new WeakSet;

    function c(e) {
        return l.has(e)
    }
    let d = e => {
        let t = (0, u.default)(e) && "cause" in e ? e.cause : e;
        (0, i.isBailoutToCSRError)(t) || (0, s.reportGlobalError)(t)
    };
    ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 604029, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "default", {
        enumerable: !0,
        get: function() {
            return o
        }
    });
    let n = e.r(2879)._(e.r(570613));
    class a {
        end(e) {
            if ("ended" === this.state.state) throw Object.defineProperty(Error("Span has already ended"), "__NEXT_ERROR_CODE", {
                value: "E17",
                enumerable: !1,
                configurable: !0
            });
            this.state = {
                state: "ended",
                endTime: null != e ? e : Date.now()
            }, this.onSpanEnd(this)
        }
        constructor(e, t, r) {
            var n, a;
            this.name = e, this.attributes = null != (n = t.attributes) ? n : {}, this.startTime = null != (a = t.startTime) ? a : Date.now(), this.onSpanEnd = r, this.state = {
                state: "inprogress"
            }
        }
    }
    let o = new class {
        startSpan(e, t) {
            return new a(e, t, this.handleSpanEnd)
        }
        onSpanEnd(e) {
            return this._emitter.on("spanend", e), () => {
                this._emitter.off("spanend", e)
            }
        }
        constructor() {
            this._emitter = (0, n.default)(), this.handleSpanEnd = e => {
                this._emitter.emit("spanend", e)
            }
        }
    };
    ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 381855, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    let n = (0, e.r(306077).getDeploymentId)();
    globalThis.NEXT_DEPLOYMENT_ID = n, ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 598424, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var n = {
        RouteAnnouncer: function() {
            return c
        },
        default: function() {
            return d
        }
    };
    for (var a in n) Object.defineProperty(r, a, {
        enumerable: !0,
        get: n[a]
    });
    let o = e.r(2879),
        i = e.r(221628),
        u = o._(e.r(416340)),
        s = e.r(761438),
        l = {
            border: 0,
            clip: "rect(0 0 0 0)",
            height: "1px",
            margin: "-1px",
            overflow: "hidden",
            padding: 0,
            position: "absolute",
            top: 0,
            width: "1px",
            whiteSpace: "nowrap",
            wordWrap: "normal"
        },
        c = () => {
            let {
                asPath: e
            } = (0, s.useRouter)(), [t, r] = u.default.useState(""), n = u.default.useRef(e);
            return u.default.useEffect(() => {
                if (n.current !== e)
                    if (n.current = e, document.title) r(document.title);
                    else {
                        var t;
                        let n = document.querySelector("h1");
                        r((null != (t = null == n ? void 0 : n.innerText) ? t : null == n ? void 0 : n.textContent) || e)
                    }
            }, [e]), (0, i.jsx)("p", {
                "aria-live": "assertive",
                id: "__next-route-announcer__",
                role: "alert",
                style: l,
                children: t
            })
        },
        d = c;
    ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 821001, (e, t, r) => {
    "use strict";
    {
        let e = {};
        t.exports = Array.isArray(e) ? e : [e]
    }
}, 320375, e => {
    e.v(t => Promise.all(["static/chunks/3upo1o1nkwhm0.js"].map(t => e.l(t))).then(() => t(507153)))
}, 378337, e => {
    e.v(t => Promise.all(["static/chunks/0nwlby279ho9c.js"].map(t => e.l(t))).then(() => t(116404)))
}, 512958, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var n = {
        VALID_LOADERS: function() {
            return o
        },
        imageConfigDefault: function() {
            return i
        }
    };
    for (var a in n) Object.defineProperty(r, a, {
        enumerable: !0,
        get: n[a]
    });
    let o = ["default", "imgix", "cloudinary", "akamai", "custom"],
        i = {
            deviceSizes: [640, 750, 828, 1080, 1200, 1920, 2048, 3840],
            imageSizes: [32, 48, 64, 96, 128, 256, 384],
            path: "/_next/image",
            loader: "default",
            loaderFile: "",
            domains: [],
            disableStaticImages: !1,
            minimumCacheTTL: 14400,
            formats: ["image/webp"],
            maximumDiskCacheSize: void 0,
            maximumRedirects: 3,
            maximumResponseBody: 5e7,
            dangerouslyAllowLocalIP: !1,
            dangerouslyAllowSVG: !1,
            contentSecurityPolicy: "script-src 'none'; frame-src 'none'; sandbox;",
            contentDispositionType: "attachment",
            localPatterns: void 0,
            remotePatterns: [],
            qualities: [75],
            unoptimized: !1,
            customCacheHandler: !1
        }
}, 424204, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "ImageConfigContext", {
        enumerable: !0,
        get: function() {
            return o
        }
    });
    let n = e.r(2879)._(e.r(416340)),
        a = e.r(512958),
        o = n.default.createContext(a.imageConfigDefault)
}, 781227, (e, t, r) => {
    "use strict";
    t.exports = ["chrome 111", "edge 111", "firefox 111", "safari 16.4"]
}, 194538, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var n = {
        UNDERSCORE_GLOBAL_ERROR_ROUTE: function() {
            return u
        },
        UNDERSCORE_GLOBAL_ERROR_ROUTE_ENTRY: function() {
            return s
        },
        UNDERSCORE_NOT_FOUND_ROUTE: function() {
            return o
        },
        UNDERSCORE_NOT_FOUND_ROUTE_ENTRY: function() {
            return i
        }
    };
    for (var a in n) Object.defineProperty(r, a, {
        enumerable: !0,
        get: n[a]
    });
    let o = "/_not-found",
        i = "".concat(o, "/page"),
        u = "/_global-error",
        s = "".concat(u, "/page")
}, 178390, (e, t, r) => {
    "use strict";
    var n, a, o, i = e.i(2226);
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var u = {
        APP_CLIENT_INTERNALS: function() {
            return eo
        },
        APP_PATHS_MANIFEST: function() {
            return P
        },
        APP_PATH_ROUTES_MANIFEST: function() {
            return S
        },
        AdapterOutputType: function() {
            return p
        },
        BARREL_OPTIMIZATION_PREFIX: function() {
            return Q
        },
        BLOCKED_PAGES: function() {
            return W
        },
        BUILD_ID_FILE: function() {
            return q
        },
        BUILD_MANIFEST: function() {
            return O
        },
        CLIENT_PUBLIC_FILES_PATH: function() {
            return V
        },
        CLIENT_REFERENCE_MANIFEST: function() {
            return J
        },
        CLIENT_STATIC_FILES_PATH: function() {
            return X
        },
        CLIENT_STATIC_FILES_RUNTIME_MAIN: function() {
            return en
        },
        CLIENT_STATIC_FILES_RUNTIME_MAIN_APP: function() {
            return ea
        },
        CLIENT_STATIC_FILES_RUNTIME_POLYFILLS: function() {
            return es
        },
        CLIENT_STATIC_FILES_RUNTIME_POLYFILLS_SYMBOL: function() {
            return el
        },
        CLIENT_STATIC_FILES_RUNTIME_REACT_REFRESH: function() {
            return ei
        },
        CLIENT_STATIC_FILES_RUNTIME_WEBPACK: function() {
            return eu
        },
        COMPILER_INDEXES: function() {
            return f
        },
        COMPILER_NAMES: function() {
            return d
        },
        CONFIG_FILES: function() {
            return H
        },
        DEFAULT_RUNTIME_WEBPACK: function() {
            return ec
        },
        DEFAULT_SANS_SERIF_FONT: function() {
            return eE
        },
        DEFAULT_SERIF_FONT: function() {
            return e_
        },
        DEV_CLIENT_MIDDLEWARE_MANIFEST: function() {
            return G
        },
        DEV_CLIENT_PAGES_MANIFEST: function() {
            return j
        },
        DYNAMIC_CSS_MANIFEST: function() {
            return er
        },
        EDGE_RUNTIME_WEBPACK: function() {
            return ed
        },
        EDGE_UNSUPPORTED_NODE_APIS: function() {
            return eR
        },
        EXPORT_DETAIL: function() {
            return C
        },
        EXPORT_MARKER: function() {
            return A
        },
        FUNCTIONS_CONFIG_MANIFEST: function() {
            return I
        },
        IMAGES_MANIFEST: function() {
            return w
        },
        INTERCEPTION_ROUTE_REWRITE_MANIFEST: function() {
            return et
        },
        MIDDLEWARE_BUILD_MANIFEST: function() {
            return $
        },
        MIDDLEWARE_MANIFEST: function() {
            return x
        },
        MIDDLEWARE_REACT_LOADABLE_MANIFEST: function() {
            return ee
        },
        MODERN_BROWSERSLIST_TARGET: function() {
            return l.default
        },
        NEXT_BUILTIN_DOCUMENT: function() {
            return K
        },
        NEXT_FONT_MANIFEST: function() {
            return b
        },
        PAGES_MANIFEST: function() {
            return y
        },
        PHASE_ANALYZE: function() {
            return E
        },
        PHASE_DEVELOPMENT_SERVER: function() {
            return h
        },
        PHASE_EXPORT: function() {
            return _
        },
        PHASE_INFO: function() {
            return R
        },
        PHASE_PRODUCTION_BUILD: function() {
            return m
        },
        PHASE_PRODUCTION_SERVER: function() {
            return g
        },
        PHASE_TEST: function() {
            return v
        },
        PREFETCH_HINTS: function() {
            return L
        },
        PRERENDER_MANIFEST: function() {
            return N
        },
        REACT_LOADABLE_MANIFEST: function() {
            return B
        },
        REQUEST_INSIGHTS_DEV_ENDPOINT: function() {
            return U
        },
        ROUTES_MANIFEST: function() {
            return M
        },
        RSC_MODULE_TYPES: function() {
            return ev
        },
        SERVER_DIRECTORY: function() {
            return k
        },
        SERVER_FILES_MANIFEST: function() {
            return D
        },
        SERVER_PROPS_ID: function() {
            return ep
        },
        SERVER_REFERENCE_MANIFEST: function() {
            return Z
        },
        STATIC_PROPS_ID: function() {
            return ef
        },
        STATIC_STATUS_PAGES: function() {
            return em
        },
        STRING_LITERAL_DROP_BUNDLE: function() {
            return Y
        },
        SUBRESOURCE_INTEGRITY_MANIFEST: function() {
            return T
        },
        SYSTEM_ENTRYPOINTS: function() {
            return ey
        },
        TRACE_OUTPUT_VERSION: function() {
            return eg
        },
        TURBOPACK_CLIENT_BUILD_MANIFEST: function() {
            return z
        },
        TURBOPACK_CLIENT_MIDDLEWARE_MANIFEST: function() {
            return F
        },
        TURBO_TRACE_DEFAULT_MEMORY_LIMIT: function() {
            return eh
        },
        UNDERSCORE_GLOBAL_ERROR_ROUTE: function() {
            return c.UNDERSCORE_GLOBAL_ERROR_ROUTE
        },
        UNDERSCORE_GLOBAL_ERROR_ROUTE_ENTRY: function() {
            return c.UNDERSCORE_GLOBAL_ERROR_ROUTE_ENTRY
        },
        UNDERSCORE_NOT_FOUND_ROUTE: function() {
            return c.UNDERSCORE_NOT_FOUND_ROUTE
        },
        UNDERSCORE_NOT_FOUND_ROUTE_ENTRY: function() {
            return c.UNDERSCORE_NOT_FOUND_ROUTE_ENTRY
        }
    };
    for (var s in u) Object.defineProperty(r, s, {
        enumerable: !0,
        get: u[s]
    });
    let l = e.r(2879)._(e.r(781227)),
        c = e.r(194538),
        d = {
            client: "client",
            server: "server",
            edgeServer: "edge-server"
        },
        f = {
            [d.client]: 0,
            [d.server]: 1,
            [d.edgeServer]: 2
        };
    var p = ((n = {}).PAGES = "PAGES", n.PAGES_API = "PAGES_API", n.APP_PAGE = "APP_PAGE", n.APP_ROUTE = "APP_ROUTE", n.PRERENDER = "PRERENDER", n.STATIC_FILE = "STATIC_FILE", n.MIDDLEWARE = "MIDDLEWARE", n);
    let _ = "phase-export",
        E = "phase-analyze",
        m = "phase-production-build",
        g = "phase-production-server",
        h = "phase-development-server",
        v = "phase-test",
        R = "phase-info",
        y = "pages-manifest.json",
        P = "app-paths-manifest.json",
        S = "app-path-routes-manifest.json",
        O = "build-manifest.json",
        I = "functions-config-manifest.json",
        T = "subresource-integrity-manifest",
        b = "next-font-manifest",
        A = "export-marker.json",
        C = "export-detail.json",
        N = "prerender-manifest.json",
        L = "prefetch-hints.json",
        M = "routes-manifest.json",
        w = "images-manifest.json",
        D = "required-server-files",
        j = "_devPagesManifest.json",
        U = "/_next/development/request-insights",
        x = "middleware-manifest.json",
        F = "_clientMiddlewareManifest.js",
        z = "client-build-manifest.json",
        G = "_devMiddlewareManifest.json",
        B = "react-loadable-manifest.json",
        k = "server",
        H = ["next.config.js", "next.config.mjs", "next.config.ts", ...(null == (o = i.default) || null == (a = o.features) ? void 0 : a.typescript) ? ["next.config.mts"] : []],
        q = "BUILD_ID",
        W = ["/_document", "/_app", "/_error"],
        V = "public",
        X = "static",
        Y = "__NEXT_DROP_CLIENT_FILE__",
        K = "__NEXT_BUILTIN_DOCUMENT__",
        Q = "__barrel_optimize__",
        J = "client-reference-manifest",
        Z = "server-reference-manifest",
        $ = "middleware-build-manifest",
        ee = "middleware-react-loadable-manifest",
        et = "interception-route-rewrite-manifest",
        er = "dynamic-css-manifest",
        en = "main",
        ea = "".concat(en, "-app"),
        eo = "app-pages-internals",
        ei = "react-refresh",
        eu = "webpack",
        es = "polyfills",
        el = Symbol(es),
        ec = "webpack-runtime",
        ed = "edge-runtime-webpack",
        ef = "__N_SSG",
        ep = "__N_SSP",
        e_ = {
            name: "Times New Roman",
            xAvgCharWidth: 821,
            azAvgWidth: 854.3953488372093,
            unitsPerEm: 2048
        },
        eE = {
            name: "Arial",
            xAvgCharWidth: 904,
            azAvgWidth: 934.5116279069767,
            unitsPerEm: 2048
        },
        em = ["/500"],
        eg = 1,
        eh = 6e3,
        ev = {
            client: "client",
            server: "server"
        },
        eR = ["clearImmediate", "setImmediate", "BroadcastChannel", "ByteLengthQueuingStrategy", "CompressionStream", "CountQueuingStrategy", "DecompressionStream", "DomException", "MessageChannel", "MessageEvent", "MessagePort", "ReadableByteStreamController", "ReadableStreamBYOBRequest", "ReadableStreamDefaultController", "TransformStreamDefaultController", "WritableStreamDefaultController"],
        ey = new Set([en, ei, ea]);
    ("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), t.exports = r.default)
}, 845290, (e, t, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var n = {
        PathnameContextProviderAdapter: function() {
            return E
        },
        adaptForAppRouterInstance: function() {
            return f
        },
        adaptForPathParams: function() {
            return _
        },
        adaptForSearchParams: function() {
            return p
        }
    };
    for (var a in n) Object.defineProperty(r, a, {
        enumerable: !0,
        get: n[a]
    });
    let o = e.r(887602),
        i = e.r(221628),
        u = o._(e.r(416340)),
        s = e.r(956959),
        l = e.r(144689),
        c = e.r(154313),
        d = e.r(668484);

    function f(e) {
        return {
            back() {
                e.back()
            },
            forward() {
                e.forward()
            },
            refresh() {
                e.reload()
            },
            hmrRefresh() {},
            push(t) {
                let {
                    scroll: r
                } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                e.push(t, void 0, {
                    scroll: r
                })
            },
            replace(t) {
                let {
                    scroll: r
                } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                e.replace(t, void 0, {
                    scroll: r
                })
            },
            prefetch(t) {
                e.prefetch(t)
            },
            bfcacheId: "0"
        }
    }

    function p(e) {
        return e.isReady && e.query ? (0, c.asPathToSearchParams)(e.asPath) : new URLSearchParams
    }

    function _(e) {
        if (!e.isReady || !e.query) return null;
        let t = {};
        for (let r of Object.keys((0, d.getRouteRegex)(e.pathname).groups)) t[r] = e.query[r];
        return t
    }

    function E(e) {
        let {
            children: t,
            router: r,
            ...n
        } = e, a = (0, u.useRef)(n.isAutoExport), o = (0, u.useMemo)(() => {
            let e, t = a.current;
            if (t && (a.current = !1), (0, l.isDynamicRoute)(r.pathname) && (r.isFallback || t && !r.isReady)) return null;
            try {
                e = new URL(r.asPath, "http://f")
            } catch (e) {
                return "/"
            }
            return e.pathname
        }, [r.asPath, r.isFallback, r.isReady, r.pathname]);
        return (0, i.jsx)(s.PathnameContext.Provider, {
            value: o,
            children: t
        })
    }
}, 154313, (e, t, r) => {
    "use strict";

    function n(e) {
        return new URL(e, "http://n").searchParams
    }
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), Object.defineProperty(r, "asPathToSearchParams", {
        enumerable: !0,
        get: function() {
            return n
        }
    })
}, 73576, e => {
    e.v(t => Promise.all(["static/chunks/2r5y3o2zm-scu.js", "static/chunks/0by3eyu3e1i8_.js", "static/chunks/3q7yvg-2moneq.js"].map(t => e.l(t))).then(() => t(21157)))
}, 823062, e => {
    "use strict";
    var t = e.i(416340);
    let r = (0, t.createContext)(null),
        n = [],
        a = ["pageload", "click", "impression", "hover", "webvitals", "apivitals", "formvitals", "error", "session"],
        o = new Set(["TTFB", "FCP", "LCP", "FID", "CLS", "INP"]);
    e.s(["UnifiedLoggerProvider", 0, e => {
        var i;
        let {
            children: u,
            unifiedLogger: s,
            pageLoggerConfig: l,
            path: c
        } = e, d = null != (i = null == l ? void 0 : l.tags) ? i : n, f = null == l ? void 0 : l.rosId, p = (0, t.useMemo)(() => ({
            tags: d,
            rosId: f,
            path: c
        }), [d, f, c]), _ = (0, t.useRef)(p), E = (0, t.useRef)(p);
        (0, t.useLayoutEffect)(() => {
            E.current = p, void 0 === _.current.path && void 0 !== p.path && (_.current = {
                ..._.current,
                path: p.path
            })
        }, [p]), (0, t.useLayoutEffect)(() => {
            let e = e => {
                var t;
                let r, n = (r = null == (t = e.parameters) ? void 0 : t.metricName, "webvitals" === e.eventType && void 0 !== r && o.has(r)) ? _.current : E.current;
                void 0 !== n.path && (e.parameters = {
                    ...e.parameters,
                    path: n.path
                }), n.tags.forEach(t => e.addTag(t)), void 0 !== n.rosId && e.addTag("owner: ".concat(n.rosId))
            };
            return a.forEach(t => {
                s.events.on(t, e)
            }), () => {
                a.forEach(t => {
                    s.events.off(t, e)
                })
            }
        }, [s]);
        let m = (0, t.useMemo)(() => ({
            unifiedLogger: s,
            pageContext: p
        }), [s, p]);
        return t.default.createElement(r.Provider, {
            value: m
        }, u)
    }, "useUnifiedLoggerProvider", 0, function() {
        let e = (0, t.useContext)(r);
        if (null === e) throw Error("useUnifiedLoggerProvider must be used within a UnifiedLoggerProvider");
        return e
    }])
}]);

//# debugId=b0870bb1-0d43-b13a-4895-721de8eca0b4
//# sourceMappingURL=1x5gdvq262k1r.js.map