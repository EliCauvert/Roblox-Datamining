;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "58cf83ea-071e-a43c-b007-fc98ea61f8b8")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 245299, e => {
    "use strict";
    let t = (0, e.i(157700).defineFlag)({
        namespace: "collaborative-tools",
        name: "enableEnvironments",
        defaultValue: !1
    });
    e.s(["enableEnvironments", 0, t])
}, 846130, e => {
    "use strict";
    var t = e.i(157700);
    let n = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerSupport",
            defaultValue: !1
        }),
        a = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerHostedEvents",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportCreatorTicketReroute",
            defaultValue: !1
        }),
        i = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enableReachStatusBadge",
            defaultValue: !1
        }),
        s = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportArchive",
            defaultValue: !1
        }),
        o = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportCategoryChange",
            defaultValue: !1
        }),
        l = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enableEarlyTestersUserOwnedGame",
            defaultValue: !1
        });
    e.s(["enableEarlyTestersUserOwnedGame", 0, l, "enablePlayerHostedEvents", 0, a, "enablePlayerSupport", 0, n, "enablePlayerSupportArchive", 0, s, "enablePlayerSupportCategoryChange", 0, o, "enablePlayerSupportCreatorTicketReroute", 0, r, "enableReachStatusBadge", 0, i])
}, 886525, e => {
    "use strict";
    let t = (0, e.i(157700).defineFlag)({
        namespace: "game-engine-streaming",
        name: "enableExperienceLaunchTimeChart",
        defaultValue: !1
    });
    e.s(["enableExperienceLaunchTimeChart", 0, t])
}, 82899, e => {
    "use strict";
    let t = (0, e.i(157700).defineFlag)({
        namespace: "leaderboards",
        name: "isLeaderboardConfigsEnabled",
        defaultValue: !0
    });
    e.s(["isLeaderboardConfigsEnabled", 0, t])
}, 494192, e => {
    "use strict";
    let t = (0, e.i(157700).defineFlag)({
        namespace: "preset-chat",
        name: "presetChatEnabled",
        defaultValue: !1
    });
    e.s(["presetChatEnabled", 0, t])
}, 401263, 884213, e => {
    "use strict";
    var t = e.i(416340);
    let n = /{(.+?)}/g,
        a = (e, t) => void 0 === t || 0 === Object.keys(t).length ? e : e.replace(n, (e, n) => {
            var a;
            return null != (a = t[n]) ? a : "{".concat(n, "}")
        });
    e.s(["default", 0, a], 884213);
    let r = /{(.+?)}/,
        i = /({.+?})/g,
        s = /^[a-zA-Z0-9-]+\.(?:capture-loopback\.)?chromatic\.com$/,
        o = /(?:^|\.)robloxlabs\.com$/,
        l = () => {
            let e, t = s.test(window.location.hostname),
                n = window.location.hostname.includes("localhost"),
                a = "string" == typeof(e = window.location.hostname) && o.test(e);
            return {
                isSSR: !1,
                isAllowed: t || n || a,
                isDangerous: t || a,
                preferLoadedTranslations: a
            }
        },
        u = (e, t) => t.isDangerous ? "[!!".concat(e, "!!]") : e;
    var d = e.i(730530);
    e.s(["default", 0, e => {
        let {
            ready: n,
            translate: s,
            translateHTML: o,
            translateWithNamespace: c,
            translateWithNamespaceHTML: p
        } = e, g = (0, t.useMemo)(() => ({
            ready: n,
            translate: s,
            translateHTML: o,
            translateWithNamespace: c,
            translateWithNamespaceHTML: p
        }), [n, s, o, c, p]);
        return (0, t.useMemo)(() => {
            let e = {
                ready: g.ready,
                translate: (0, d.translationFn)(g),
                translateHTML: (0, d.translateHTMLFn)(g),
                translateWithNamespace: g.translateWithNamespace,
                translateWithNamespaceHTML: g.translateWithNamespaceHTML
            };
            return {
                ...e,
                tPendingTranslation: (e => {
                    let {
                        ready: t,
                        translate: n
                    } = e;
                    return (e, r, i, s) => {
                        let o = l();
                        if (!o.isAllowed) return n(i, s);
                        if (o.preferLoadedTranslations && t) {
                            let e = n(i, s);
                            if (e.length > 0) return e
                        }
                        return a(o.preferLoadedTranslations && !t ? e : u(e, o), s)
                    }
                })(e),
                tPendingHtmlTranslation: (e => {
                    let {
                        ready: n,
                        translateHTML: s
                    } = e;
                    return (e, o, d, c, p) => {
                        let g = l();
                        if (!g.isAllowed) return s(d, c, p);
                        if (g.preferLoadedTranslations && n) {
                            let e = s(d, c, p);
                            if ("" !== e) return e
                        }
                        return ((e, n, s) => {
                            let o, l;
                            if (void 0 === n && void 0 === s) return e;
                            let {
                                stringArgs: u,
                                htmlArgs: d
                            } = (o = {}, l = {}, void 0 === s || Object.entries(s).forEach(e => {
                                let [t, n] = e;
                                "string" == typeof n ? o[t] = n : l[t] = n
                            }), {
                                stringArgs: o,
                                htmlArgs: l
                            }), c = a(e, u), p = c.split(i).filter(e => !!e);
                            if (1 === p.length) return c;
                            let g = [...p];
                            if (0 !== Object.keys(d).length) {
                                let e = p.reduce((e, t, n) => {
                                    let a = r.exec(t);
                                    if (a) {
                                        let t = a[1];
                                        if (Object.hasOwn(d, t)) {
                                            let a = e[t];
                                            if (!a) return Object.assign(e, {
                                                [t]: [n]
                                            });
                                            a.push(n)
                                        }
                                    }
                                    return e
                                }, {});
                                Object.entries(d).forEach(t => {
                                    let [n, a] = t, r = e[n];
                                    r && r.forEach(e => {
                                        g[e] = a
                                    })
                                })
                            }
                            if (!Array.isArray(n) || 0 === n.length) return (0, t.createElement)(t.Fragment, null, ...g);
                            let f = n.reduce((e, t) => {
                                    let {
                                        opening: n,
                                        closing: a,
                                        content: r
                                    } = t;
                                    return Object.assign(e, {
                                        ["{".concat(n, "}")]: {
                                            match: "{".concat(a, "}"),
                                            content: r
                                        }
                                    })
                                }, {}),
                                m = [],
                                v = [],
                                h = [];
                            for (let e = g.shift(); void 0 !== e; e = g.shift())
                                if ("string" == typeof e && r.test(e))
                                    if (Object.hasOwn(f, e)) v.push(e), h.push(e);
                                    else {
                                        let n = v.pop();
                                        if (void 0 !== n) {
                                            let {
                                                match: a,
                                                content: r
                                            } = f[n];
                                            if (e !== a) break;
                                            let i = [],
                                                s = !1;
                                            for (; h.length > 0 && !s;) {
                                                let e = h.pop();
                                                e === n ? s = !0 : i.unshift(e)
                                            }
                                            let o = r(i.every(e => "string" == typeof e) ? i : (0, t.createElement)(t.Fragment, null, ...i));
                                            0 === h.length ? m.push(o) : h.push(o)
                                        }
                                    }
                            else 0 === h.length ? m.push(e) : h.push(e);
                            return (0, t.createElement)(t.Fragment, null, ...m)
                        })(g.preferLoadedTranslations && !n ? e : u(e, g), c, p)
                    }
                })(e)
            }
        }, [g])
    }], 401263)
}, 998683, e => {
    "use strict";
    var t = e.i(721281),
        n = e.i(502585),
        a = e.i(272593);
    let r = new class {
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
            (0, t._)(this, "localeApi", void 0), this.localeApi = new n.LocaleApi((0, a.createClientConfiguration)("locale", "bedev1"))
        }
    };
    e.s(["default", 0, r])
}, 607204, e => {
    "use strict";
    var t = e.i(581548),
        n = e.i(272593),
        a = e.i(127403);
    let r = (0, n.createClientConfiguration)("orgs", "bedev2", {
            middleware: [new a.default]
        }),
        i = new t.OrganizationApi(r),
        s = new t.InvitationApi(r),
        o = new t.RoleApi(r),
        l = new t.UserApi(r),
        u = new t.GroupUniversePayoutApi(r);
    e.s(["default", 0, {
        organizationClient: {
            getOrganization: async e => i.v1OrganizationsGet({
                groupId: e
            })
        },
        invitationClient: {
            createInvitation: async (e, t) => s.v1OrganizationsOrganizationIdInvitationsPost({
                organizationId: e,
                createInvitationRequestModel: t
            }),
            getInvitationsByOrganizationId: async (e, t, n) => s.v1OrganizationsOrganizationIdInvitationsGet({
                organizationId: e,
                pageToken: t,
                maxPageSize: n
            }),
            getInvitation: async (e, t) => s.v1OrganizationsOrganizationIdInvitationsInvitationIdGet({
                organizationId: e,
                invitationId: t
            }),
            acceptOrDeclineInvitation: async (e, t, n) => s.v1OrganizationsOrganizationIdInvitationsInvitationIdPatch({
                organizationId: e,
                invitationId: t,
                updateInvitationRequestModel: n
            }),
            deleteInvitationById: async (e, t) => s.v1OrganizationsOrganizationIdInvitationsInvitationIdDelete({
                organizationId: e,
                invitationId: t
            }),
            getRoleIdsByInvitationId: async (e, t) => s.v1OrganizationsOrganizationIdInvitationsInvitationIdRoleIdsGet({
                organizationId: e,
                invitationId: t
            })
        },
        roleClient: {
            createRole: async (e, t) => o.v1OrganizationsOrganizationIdRolesPost({
                organizationId: e,
                createOrUpdateRoleRequestModel: t
            }),
            getRoleMetadata: async (e, t, n) => o.v1OrganizationsOrganizationIdRolesRoleIdMetadataGet({
                organizationId: e,
                roleId: t,
                isDefault: n
            }),
            updateRoleMetadata: async (e, t, n) => o.v1OrganizationsOrganizationIdRolesRoleIdMetadataPatch({
                organizationId: e,
                roleId: t,
                createOrUpdateRoleRequestModel: n
            }),
            updateRolePosition: async (e, t, n) => o.v1OrganizationsOrganizationIdRolesRoleIdPositionPatch({
                organizationId: e,
                roleId: t,
                updateRolePositionRequestModel: n
            }),
            getRolesByOrganization: async (e, t, n) => o.v1OrganizationsOrganizationIdRolesGet({
                organizationId: e,
                pageToken: t,
                maxPageSize: n
            }),
            getUsersWithRole: async (e, t, n, a, r) => o.v1OrganizationsOrganizationIdRolesRoleIdUsersGet({
                organizationId: e,
                roleId: t,
                pageToken: n,
                maxPageSize: a,
                isDefault: r
            }),
            deleteRole: async (e, t) => o.v1OrganizationsOrganizationIdRolesRoleIdDelete({
                organizationId: e,
                roleId: t
            }),
            getInvitationsWithRole: async (e, t, n, a) => o.v1OrganizationsOrganizationIdRolesRoleIdInvitationsGet({
                organizationId: e,
                roleId: t,
                pageToken: n,
                maxPageSize: a
            })
        },
        userClient: {
            getUsersByOrganization: async (e, t, n) => l.v1OrganizationsOrganizationIdUsersGet({
                organizationId: e,
                pageToken: t,
                maxPageSize: n
            }),
            removeUserFromOrganization: async (e, t) => l.v1OrganizationsOrganizationIdUsersUserIdDelete({
                organizationId: e,
                userId: t
            }),
            getUserInvitationByOrganization: async (e, t) => l.v1OrganizationsOrganizationIdUsersUserIdInvitationsGet({
                organizationId: e,
                userId: t
            }),
            getUserPermissions: async (e, t) => {
                let {
                    raw: n
                } = await l.v1OrganizationsOrganizationIdUsersUserIdPermissionsGetRaw({
                    organizationId: e,
                    userId: t
                });
                return await n.json()
            },
            getUserRoles: async (e, t, n, a) => l.v1OrganizationsOrganizationIdUsersUserIdRolesGet({
                organizationId: e,
                userId: t,
                pageToken: n,
                maxPageSize: a
            }),
            addUserToOrganization: async (e, t) => l.v1OrganizationsOrganizationIdUsersUserIdPost({
                organizationId: e,
                userId: t
            }),
            addUserToRole: async (e, t, n) => l.v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdPost({
                organizationId: e,
                userId: t,
                roleId: n
            }),
            removeUserFromRole: async (e, t, n) => l.v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdDelete({
                organizationId: e,
                userId: t,
                roleId: n
            })
        },
        groupUniversePayoutClient: {
            getUniversePayouts: async e => u.v1OrganizationsOrganizationIdPayoutsUniverseIdGet(e),
            updateUniversePayouts: async e => u.v1OrganizationsOrganizationIdPayoutsUniverseIdPatch(e),
            findUniversePayouts: async e => u.v1OrganizationsOrganizationIdPayoutsUniversesGet(e),
            getLatestOneTimePayoutForUsers: async (e, t) => {
                let n = {
                    organizationId: e,
                    userIds: t.map(String)
                };
                return u.v1OrganizationsOrganizationIdPayoutsLatestGet(n)
            },
            getSuggestedPayouts: async e => u.v1OrganizationsOrganizationIdPayoutsSuggestedGet({
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
                url: n,
                init: a,
                response: r
            } = e, i = new URL(n);
            return "POST" !== a.method && "PATCH" !== a.method || "true" === i.searchParams.get("isSecure") || 403 !== r.status ? Promise.resolve(r) : (i.searchParams.set("isSecure", "true"), t(i.toString(), a))
        }
    }])
}, 384340, 672401, e => {
    "use strict";
    var t = e.i(416340);
    let n = (0, t.createContext)({
        isOrganizationRefreshRequired: !1,
        organization: void 0,
        permissions: void 0,
        refreshOrganization: () => ({}),
        refreshPermission: () => Promise.resolve(),
        isOrganizationLoading: !1
    });
    n.displayName = "Organization", e.s(["default", 0, n], 672401), e.s(["default", 0, function() {
        return (0, t.useContext)(n)
    }], 384340)
}, 927868, e => {
    "use strict";
    e.s(["getEnumKeyByValue", 0, (e, t) => {
        let n = Object.entries(e).find(e => {
            let [, n] = e;
            return n === t
        });
        return n ? n[0] : null
    }, "isValidArrayEnumValue", 0, (e, t) => e.includes(t), "isValidEnumValue", 0, (e, t) => Object.values(e).includes(t)])
}, 745873, e => {
    "use strict";
    var t = e.i(221628),
        n = e.i(416340),
        a = e.i(458451),
        r = e.i(533414),
        i = e.i(157310),
        s = e.i(279149),
        o = e.i(602635),
        l = e.i(814975);
    let u = (0, e.i(272593).createClientConfiguration)("creator-home-api", "bedev2"),
        d = new s.GroupsApi(u),
        c = function() {
            let {
                user: e
            } = (0, l.useAuthentication)();
            return (0, i.useQuery)({
                queryKey: o.getGroupsQueryKey,
                enabled: !!e,
                queryFn: () => {
                    let e;
                    return e = {
                        surface: s.GroupListSurface.CreatorHub
                    }, d.groupsListGroups(e)
                }
            })
        },
        p = (0, n.createContext)(null);
    e.s(["GroupsProvider", 0, e => {
        let {
            children: i
        } = e, {
            user: s
        } = (0, a.useRobloxAuthentication)(), {
            data: o,
            isLoading: l,
            refetch: u
        } = c(), [d, g] = (0, r.useLocalStorage)("creatorHubGroups.".concat(null == s ? void 0 : s.id), null), [f, m] = (0, r.useLocalStorage)("creatorHubGroup.".concat(null == s ? void 0 : s.id), null), [v, h] = (0, r.useLocalStorage)("creatorHubGroupData.".concat(null == s ? void 0 : s.id), {}), y = (0, n.useCallback)(e => {
            m(e);
            let t = null === e ? "user" : e;
            h(e => {
                let n = {
                    lastSelected: Date.now(),
                    priority: 1
                };
                if (e[t]) {
                    let {
                        priority: a,
                        lastSelected: r
                    } = e[t];
                    "number" != typeof a || Number.isNaN(a) || "number" != typeof r || Number.isNaN(r) || (n.priority = a * (1 + Math.log10(1 + 10 / Math.max(Date.now() - r, 864e5))))
                }
                return {
                    ...e,
                    [t]: n
                }
            })
        }, [m, h]), b = (0, n.useMemo)(() => {
            if (null == o ? void 0 : o.groups) return null == o ? void 0 : o.groups;
            if (null === d) return [];
            try {
                return "string" == typeof d ? JSON.parse(d) : d
            } catch (e) {
                return []
            }
        }, [d, null == o ? void 0 : o.groups]), O = (0, n.useMemo)(() => {
            var e;
            return f && null != (e = b.find(e => {
                let {
                    id: t
                } = e;
                return t === f
            })) ? e : null
        }, [f, b]);
        (0, n.useEffect)(() => {
            (null == s ? void 0 : s.id) && (null == o ? void 0 : o.groups) && !l && g(null == o ? void 0 : o.groups)
        }, [null == o ? void 0 : o.groups, b, l, g, null == s ? void 0 : s.id]);
        let P = (0, n.useMemo)(() => ({
            groups: b,
            currentGroup: O,
            groupData: v,
            isFetched: !l && !!(null == s ? void 0 : s.id),
            refreshGroups: u,
            setCurrentGroup: y
        }), [O, v, b, l, u, y, null == s ? void 0 : s.id]);
        return (0, t.jsx)(p.Provider, {
            value: P,
            children: i
        })
    }, "useCurrentGroup", 0, () => {
        let e = (0, n.useContext)(p);
        if (null === e) throw Error("useCurrentGroup must be used within a GroupsProvider");
        return e.currentGroup
    }, "useGroups", 0, () => {
        let e = (0, n.useContext)(p);
        if (null === e) throw Error("useGroups must be used within a GroupsProvider");
        return e
    }], 745873)
}, 486736, e => {
    "use strict";
    var t = e.i(221628),
        n = e.i(416340),
        a = e.i(639102);
    let r = {
            enableImageTranslationEnrollment: !1,
            enableImageTranslationListingTab: !1,
            enableSharedTranslationListComponents: !1,
            enableIpPlatformMatchesTableEsIndexImprovements: !1
        },
        i = {
            ...r
        },
        s = async () => {
            try {
                let {
                    applicationSettings: e = {}
                } = await a.settingsClient.getApplicationSettings(), t = {};
                return Object.entries(e).forEach(e => {
                    let [n, a] = e;
                    try {
                        let e = typeof r[n];
                        t[n] = "boolean" === e || "number" === e ? JSON.parse(a) : a
                    } catch (e) {
                        console.error(e)
                    }
                }), t
            } catch (e) {
                return r
            }
        }, o = (0, n.createContext)({
            settings: {
                ...i
            },
            status: "initial",
            isFetched: !1
        });
    e.s(["SettingsProvider", 0, e => {
        let {
            children: a
        } = e, [r, l] = (0, n.useState)(() => ({
            settings: {
                ...i
            },
            status: "initial",
            isFetched: !1
        }));
        return (0, n.useEffect)(() => {
            (async () => {
                let e = await Promise.allSettled([s()]);
                l({
                    settings: e.reduce((e, t) => ({
                        ...e,
                        ..."fulfilled" === t.status ? t.value : {}
                    }), i),
                    isFetched: !0,
                    status: e.find(e => "rejected" === e.status) ? "error" : "success"
                })
            })()
        }, []), (0, t.jsx)(o.Provider, {
            value: r,
            children: a
        })
    }, "useSettings", 0, () => {
        let {
            settings: e,
            status: t,
            isFetched: a
        } = (0, n.useContext)(o), r = (0, n.useRef)(e);
        return {
            settings: (0, n.useMemo)(() => {
                let t = r.current;
                return Object.keys(e).some(n => e[n] !== t[n]) && (r.current = e), r.current
            }, [e]),
            status: t,
            isFetched: a
        }
    }], 486736)
}, 169525, e => {
    "use strict";
    var t = e.i(416340),
        n = e.i(78892),
        a = e.i(723570),
        r = e => {
            var r, s, o;
            let l, u, {
                    present: d,
                    children: c
                } = e,
                p = function(e) {
                    var n, r;
                    let [s, o] = t.useState(), l = t.useRef(null), u = t.useRef(e), d = t.useRef("none"), [c, p] = (n = e ? "mounted" : "unmounted", r = {
                        mounted: {
                            UNMOUNT: "unmounted",
                            ANIMATION_OUT: "unmountSuspended"
                        },
                        unmountSuspended: {
                            MOUNT: "mounted",
                            ANIMATION_END: "unmounted"
                        },
                        unmounted: {
                            MOUNT: "mounted"
                        }
                    }, t.useReducer((e, t) => {
                        let n = r[e][t];
                        return null != n ? n : e
                    }, n));
                    return t.useEffect(() => {
                        let e = i(l.current);
                        d.current = "mounted" === c ? e : "none"
                    }, [c]), (0, a.useLayoutEffect)(() => {
                        let t = l.current,
                            n = u.current;
                        if (n !== e) {
                            let a = d.current,
                                r = i(t);
                            e ? p("MOUNT") : "none" === r || (null == t ? void 0 : t.display) === "none" ? p("UNMOUNT") : n && a !== r ? p("ANIMATION_OUT") : p("UNMOUNT"), u.current = e
                        }
                    }, [e, p]), (0, a.useLayoutEffect)(() => {
                        if (s) {
                            var e;
                            let t, n = null != (e = s.ownerDocument.defaultView) ? e : window,
                                a = e => {
                                    let a = i(l.current).includes(CSS.escape(e.animationName));
                                    if (e.target === s && a && (p("ANIMATION_END"), !u.current)) {
                                        let e = s.style.animationFillMode;
                                        s.style.animationFillMode = "forwards", t = n.setTimeout(() => {
                                            "forwards" === s.style.animationFillMode && (s.style.animationFillMode = e)
                                        })
                                    }
                                },
                                r = e => {
                                    e.target === s && (d.current = i(l.current))
                                };
                            return s.addEventListener("animationstart", r), s.addEventListener("animationcancel", a), s.addEventListener("animationend", a), () => {
                                n.clearTimeout(t), s.removeEventListener("animationstart", r), s.removeEventListener("animationcancel", a), s.removeEventListener("animationend", a)
                            }
                        }
                        p("ANIMATION_END")
                    }, [s, p]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(c),
                        ref: t.useCallback(e => {
                            l.current = e ? getComputedStyle(e) : null, o(e)
                        }, [])
                    }
                }(d),
                g = "function" == typeof c ? c({
                    present: p.isPresent
                }) : t.Children.only(c),
                f = (0, n.useComposedRefs)(p.ref, (u = (l = null == (s = Object.getOwnPropertyDescriptor((r = g).props, "ref")) ? void 0 : s.get) && "isReactWarning" in l && l.isReactWarning) ? r.ref : (u = (l = null == (o = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning) ? r.props.ref : r.props.ref || r.ref);
            return "function" == typeof c || p.isPresent ? t.cloneElement(g, {
                ref: f
            }) : null
        };

    function i(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    r.displayName = "Presence", e.s(["Presence", 0, r])
}, 904451, e => {
    "use strict";
    var t = e.i(140625),
        n = e.i(408832),
        a = e.i(197649),
        r = e.i(416340),
        i = e.i(78892),
        s = e.i(608652),
        o = e.i(174617),
        l = e.i(199786),
        u = e.i(300792),
        d = e.i(692166),
        c = e.i(169525),
        p = e.i(600317),
        g = e.i(221628),
        f = "Checkbox",
        [m, v] = (0, s.createContextScope)(f),
        [h, y] = m(f);

    function b(e) {
        let {
            __scopeCheckbox: t,
            checked: n,
            children: a,
            defaultChecked: i,
            disabled: s,
            form: o,
            name: u,
            onCheckedChange: d,
            required: c,
            value: p = "on",
            internal_do_not_use_render: m
        } = e, [v, y] = (0, l.useControllableState)({
            prop: n,
            defaultProp: null != i && i,
            onChange: d,
            caller: f
        }), [b, O] = r.useState(null), [P, I] = r.useState(null), E = r.useRef(!1), z = !b || !!o || !!b.closest("form"), R = {
            checked: v,
            disabled: s,
            setChecked: y,
            control: b,
            setControl: O,
            name: u,
            form: o,
            value: p,
            hasConsumerStoppedPropagationRef: E,
            required: c,
            defaultChecked: !w(i) && i,
            isFormControl: z,
            bubbleInput: P,
            setBubbleInput: I
        };
        return (0, g.jsx)(h, {
            scope: t,
            ...R,
            children: "function" == typeof m ? m(R) : a
        })
    }
    var O = "CheckboxTrigger",
        P = r.forwardRef((e, t) => {
            let {
                __scopeCheckbox: n,
                onKeyDown: a,
                onClick: s,
                ...l
            } = e, {
                control: u,
                value: d,
                disabled: c,
                checked: f,
                required: m,
                setControl: v,
                setChecked: h,
                hasConsumerStoppedPropagationRef: b,
                isFormControl: P,
                bubbleInput: I
            } = y(O, n), E = (0, i.useComposedRefs)(t, v), z = r.useRef(f);
            return r.useEffect(() => {
                let e = null == u ? void 0 : u.form;
                if (e) {
                    let t = () => h(z.current);
                    return e.addEventListener("reset", t), () => e.removeEventListener("reset", t)
                }
            }, [u, h]), (0, g.jsx)(p.Primitive.button, {
                type: "button",
                role: "checkbox",
                "aria-checked": w(f) ? "mixed" : f,
                "aria-required": m,
                "data-state": S(f),
                "data-disabled": c ? "" : void 0,
                disabled: c,
                value: d,
                ...l,
                ref: E,
                onKeyDown: (0, o.composeEventHandlers)(a, e => {
                    "Enter" === e.key && e.preventDefault()
                }),
                onClick: (0, o.composeEventHandlers)(s, e => {
                    h(e => !!w(e) || !e), I && P && (b.current = e.isPropagationStopped(), b.current || e.stopPropagation())
                })
            })
        });
    P.displayName = O;
    var I = r.forwardRef((e, t) => {
        let {
            __scopeCheckbox: n,
            name: a,
            checked: r,
            defaultChecked: i,
            required: s,
            disabled: o,
            value: l,
            onCheckedChange: u,
            form: d,
            ...c
        } = e;
        return (0, g.jsx)(b, {
            __scopeCheckbox: n,
            checked: r,
            defaultChecked: i,
            disabled: o,
            required: s,
            onCheckedChange: u,
            name: a,
            form: d,
            value: l,
            internal_do_not_use_render: e => {
                let {
                    isFormControl: a
                } = e;
                return (0, g.jsxs)(g.Fragment, {
                    children: [(0, g.jsx)(P, {
                        ...c,
                        ref: t,
                        __scopeCheckbox: n
                    }), a && (0, g.jsx)(C, {
                        __scopeCheckbox: n
                    })]
                })
            }
        })
    });
    I.displayName = f;
    var E = "CheckboxIndicator",
        z = r.forwardRef((e, t) => {
            let {
                __scopeCheckbox: n,
                forceMount: a,
                ...r
            } = e, i = y(E, n);
            return (0, g.jsx)(c.Presence, {
                present: a || w(i.checked) || !0 === i.checked,
                children: (0, g.jsx)(p.Primitive.span, {
                    "data-state": S(i.checked),
                    "data-disabled": i.disabled ? "" : void 0,
                    ...r,
                    ref: t,
                    style: {
                        pointerEvents: "none",
                        ...e.style
                    }
                })
            })
        });
    z.displayName = E;
    var R = "CheckboxBubbleInput",
        C = r.forwardRef((e, t) => {
            let {
                __scopeCheckbox: n,
                ...a
            } = e, {
                control: s,
                hasConsumerStoppedPropagationRef: o,
                checked: l,
                defaultChecked: c,
                required: f,
                disabled: m,
                name: v,
                value: h,
                form: b,
                bubbleInput: O,
                setBubbleInput: P
            } = y(R, n), I = (0, i.useComposedRefs)(t, P), E = (0, u.usePrevious)(l), z = (0, d.useSize)(s);
            r.useEffect(() => {
                if (!O) return;
                let e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                    t = !o.current;
                if (E !== l && e) {
                    let n = new Event("click", {
                        bubbles: t
                    });
                    O.indeterminate = w(l), e.call(O, !w(l) && l), O.dispatchEvent(n)
                }
            }, [O, E, l, o]);
            let C = r.useRef(!w(l) && l);
            return (0, g.jsx)(p.Primitive.input, {
                type: "checkbox",
                "aria-hidden": !0,
                defaultChecked: null != c ? c : C.current,
                required: f,
                disabled: m,
                name: v,
                value: h,
                form: b,
                ...a,
                tabIndex: -1,
                ref: I,
                style: {
                    ...a.style,
                    ...z,
                    position: "absolute",
                    pointerEvents: "none",
                    opacity: 0,
                    margin: 0,
                    transform: "translateX(-100%)"
                }
            })
        });

    function w(e) {
        return "indeterminate" === e
    }

    function S(e) {
        return w(e) ? "indeterminate" : e ? "checked" : "unchecked"
    }
    C.displayName = R;
    let L = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-600"
        },
        x = {
            XSmall: "",
            Small: "",
            Medium: "",
            Large: "padding-y-xxsmall"
        },
        T = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        U = {
            XSmall: "",
            Small: "padding-top-xxsmall",
            Medium: "padding-top-xxsmall",
            Large: "padding-top-xxsmall"
        };
    e.s(["Checkbox", 0, e => {
        let {
            label: i,
            className: s,
            isChecked: o,
            isDisabled: l,
            size: u,
            hint: d,
            placement: c,
            onCheckedChange: p,
            id: g,
            ...f
        } = e, m = (0, n.default)(), v = g || m, h = i && r.default.createElement("label", {
            htmlFor: v,
            className: (0, a.default)("flex flex-col grow-1 gap-xsmall", !l && "cursor-pointer")
        }, r.default.createElement("span", {
            className: (0, a.default)(T[u], U[u], "content-emphasis")
        }, i), d && r.default.createElement("span", {
            className: "text-body-medium content-default"
        }, d));
        return r.default.createElement("div", {
            className: (0, a.default)("foundation-web-checkbox flex gap-medium", l && "opacity-[0.5]", !l && "cursor-pointer", s)
        }, "End" === c && h, r.default.createElement("div", {
            className: (0, a.default)(x[u])
        }, r.default.createElement(I, {
            "data-slot": "checkbox",
            className: (0, a.default)(L[u], t.interactable, !l && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
            id: v,
            checked: o,
            disabled: l,
            onCheckedChange: p,
            "aria-label": i,
            ...f
        }, r.default.createElement(t.StateLayer, null), r.default.createElement(z, {
            "data-slot": "checkbox-indicator",
            className: (0, a.default)(L[u], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
        }))), "Start" === c && h)
    }], 904451)
}, 990729, e => {
    "use strict";
    var t = e.i(194250),
        n = e.i(416340),
        a = e.i(863762);
    e.i(221628), e.i(149285);
    var r = (0, n.createContext)({
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
        var i, s, o, l, u = e.children,
            d = (0, t.a)(e, ["children"]),
            c = (0, n.useRef)(null),
            p = (0, n.useState)(!1),
            g = p[0],
            f = p[1],
            m = (0, n.useState)([]),
            v = m[0],
            h = m[1],
            y = (0, n.useCallback)(function(e, n) {
                void 0 === e && (e = {}), void 0 === n && (n = function() {
                    return !0
                }), h(function(a) {
                    return (0, t.b)((0, t.b)([], a, !0), [{
                        props: e,
                        shouldClose: n
                    }], !1)
                })
            }, [h]),
            b = (0, n.useCallback)(function() {
                f(!1)
            }, [f]);
        (0, n.useEffect)(function() {
            v.length > 0 && f(!0)
        }, [v.length]);
        var O = (0, n.useMemo)(function() {
            return {
                ref: c,
                enqueue: y,
                close: b
            }
        }, [b, y]);
        return n.default.createElement(n.default.Fragment, null, n.default.createElement(r.Provider, {
            value: O
        }, u), n.default.createElement(a.S, (0, t._)({}, (null == (i = v[0]) ? void 0 : i.props) || {}, d, {
            TransitionProps: (0, t._)((0, t._)({}, (null == (o = null == (s = v[0]) ? void 0 : s.props) ? void 0 : o.TransitionProps) || {}), {
                onExited: function(e) {
                    var n, a, r, i;
                    h(function(e) {
                        var n = e.slice(1);
                        return (0, t.b)([], n, !0)
                    }), (null == (a = null == (n = v[0]) ? void 0 : n.props.TransitionProps) ? void 0 : a.onExited) && (null == (i = null == (r = v[0]) ? void 0 : r.props.TransitionProps) || i.onExited(e))
                }
            }),
            onClose: function(e, t) {
                var n, a, r;
                (null == (n = v[0]) ? void 0 : n.shouldClose(t)) && f(!1), (null == (a = v[0]) ? void 0 : a.props.onClose) && (null == (r = v[0]) || r.props.onClose(e, t))
            },
            open: g
        }), null == (l = v[0]) ? void 0 : l.props.children))
    }, "useSnackbar", 0, function() {
        var e = (0, n.useContext)(r);
        return {
            ref: e.ref,
            enqueue: e.enqueue,
            close: e.close
        }
    }])
}, 117437, e => {
    "use strict";
    var t = e.i(711367);

    function n(e, t) {
        let {
            pages: n,
            pageParams: a
        } = t, r = n.length - 1;
        return n.length > 0 ? e.getNextPageParam(n[r], n, a[r], a) : void 0
    }

    function a(e, t) {
        var n;
        let {
            pages: a,
            pageParams: r
        } = t;
        return a.length > 0 ? null == (n = e.getPreviousPageParam) ? void 0 : n.call(e, a[0], a, r[0], r) : void 0
    }
    e.s(["hasNextPage", 0, function(e, t) {
        return !!t && null != n(e, t)
    }, "hasPreviousPage", 0, function(e, t) {
        return !!t && !!e.getPreviousPageParam && null != a(e, t)
    }, "infiniteQueryBehavior", 0, function(e) {
        return {
            onFetch: (r, i) => {
                var s, o, l, u, d;
                let c = r.options,
                    p = null == (l = r.fetchOptions) || null == (o = l.meta) || null == (s = o.fetchMore) ? void 0 : s.direction,
                    g = (null == (u = r.state.data) ? void 0 : u.pages) || [],
                    f = (null == (d = r.state.data) ? void 0 : d.pageParams) || [],
                    m = {
                        pages: [],
                        pageParams: []
                    },
                    v = 0,
                    h = async () => {
                        let i = !1,
                            s = (0, t.ensureQueryFn)(r.options, r.fetchOptions),
                            o = async (e, n, a) => {
                                let o;
                                if (i) return Promise.reject();
                                if (null == n && e.pages.length) return Promise.resolve(e);
                                let l = (Object.defineProperty(o = {
                                        client: r.client,
                                        queryKey: r.queryKey,
                                        pageParam: n,
                                        direction: a ? "backward" : "forward",
                                        meta: r.options.meta
                                    }, "signal", {
                                        enumerable: !0,
                                        get: () => (r.signal.aborted ? i = !0 : r.signal.addEventListener("abort", () => {
                                            i = !0
                                        }), r.signal)
                                    }), o),
                                    u = await s(l),
                                    {
                                        maxPages: d
                                    } = r.options,
                                    c = a ? t.addToStart : t.addToEnd;
                                return {
                                    pages: c(e.pages, u, d),
                                    pageParams: c(e.pageParams, n, d)
                                }
                            };
                        if (p && g.length) {
                            let e = "backward" === p,
                                t = {
                                    pages: g,
                                    pageParams: f
                                },
                                r = (e ? a : n)(c, t);
                            m = await o(t, r, e)
                        } else {
                            let t = null != e ? e : g.length;
                            do {
                                var l;
                                let e = 0 === v ? null != (l = f[0]) ? l : c.initialPageParam : n(c, m);
                                if (v > 0 && null == e) break;
                                m = await o(m, e), v++
                            } while (v < t)
                        }
                        return m
                    };
                r.options.persister ? r.fetchFn = () => {
                    var e, t;
                    return null == (e = (t = r.options).persister) ? void 0 : e.call(t, h, {
                        client: r.client,
                        queryKey: r.queryKey,
                        meta: r.options.meta,
                        signal: r.signal
                    }, i)
                } : r.fetchFn = h
            }
        }
    }])
}, 725924, e => {
    "use strict";
    let t, n;
    var a, r, i = e.i(416340);
    let s = "u" > typeof Intl,
        o = !s || void 0 === Intl.Locale,
        l = !s || void 0 === Intl.RelativeTimeFormat,
        u = !s || void 0 === Intl.PluralRules,
        d = !s || void 0 === Intl.DisplayNames,
        c = "function" != typeof window.ResizeObserver,
        p = (a = o || l || u || d || c, r = function() {
            return Promise.all([(o ? e.A(361318).then(function(e) {
                return e.p
            }) : Promise.resolve()).then(() => Promise.all([l ? e.A(950511).then(function(e) {
                return e.p
            }).then(() => e.A(874521)) : null, u ? e.A(684498).then(function(e) {
                return e.p
            }).then(() => e.A(104943)) : null, d ? e.A(951862).then(() => e.A(890267)) : null])), c ? e.A(956827) : null])
        }, t = !1, n = a ? r().catch(() => {}).then(() => {
            t = !0
        }) : null, function() {
            let [e, a] = (0, i.useState)(!n || t);
            return (0, i.useEffect)(() => {
                n && !e && n.then(() => a(!0))
            }, [e]), e
        });
    e.s(["usePolyfills", 0, p], 725924)
}, 823062, e => {
    "use strict";
    var t = e.i(416340);
    let n = (0, t.createContext)(null),
        a = [],
        r = ["pageload", "click", "impression", "hover", "webvitals", "apivitals", "formvitals", "error", "session"],
        i = new Set(["TTFB", "FCP", "LCP", "FID", "CLS", "INP"]);
    e.s(["UnifiedLoggerProvider", 0, e => {
        var s;
        let {
            children: o,
            unifiedLogger: l,
            pageLoggerConfig: u,
            path: d
        } = e, c = null != (s = null == u ? void 0 : u.tags) ? s : a, p = null == u ? void 0 : u.rosId, g = (0, t.useMemo)(() => ({
            tags: c,
            rosId: p,
            path: d
        }), [c, p, d]), f = (0, t.useRef)(g), m = (0, t.useRef)(g);
        (0, t.useLayoutEffect)(() => {
            m.current = g, void 0 === f.current.path && void 0 !== g.path && (f.current = {
                ...f.current,
                path: g.path
            })
        }, [g]), (0, t.useLayoutEffect)(() => {
            let e = e => {
                var t;
                let n, a = (n = null == (t = e.parameters) ? void 0 : t.metricName, "webvitals" === e.eventType && void 0 !== n && i.has(n)) ? f.current : m.current;
                void 0 !== a.path && (e.parameters = {
                    ...e.parameters,
                    path: a.path
                }), a.tags.forEach(t => e.addTag(t)), void 0 !== a.rosId && e.addTag("owner: ".concat(a.rosId))
            };
            return r.forEach(t => {
                l.events.on(t, e)
            }), () => {
                r.forEach(t => {
                    l.events.off(t, e)
                })
            }
        }, [l]);
        let v = (0, t.useMemo)(() => ({
            unifiedLogger: l,
            pageContext: g
        }), [l, g]);
        return t.default.createElement(n.Provider, {
            value: v
        }, o)
    }, "useOptionalUnifiedLoggerProvider", 0, function() {
        return (0, t.useContext)(n)
    }, "useUnifiedLoggerProvider", 0, function() {
        let e = (0, t.useContext)(n);
        if (null === e) throw Error("useUnifiedLoggerProvider must be used within a UnifiedLoggerProvider");
        return e
    }])
}]);

//# debugId=58cf83ea-071e-a43c-b007-fc98ea61f8b8
//# sourceMappingURL=2kbm475rtpo3z.js.map