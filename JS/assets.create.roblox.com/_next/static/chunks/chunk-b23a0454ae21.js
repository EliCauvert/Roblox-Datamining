;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "3d3904d6-5d61-9211-8880-010d8d4779dc")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 846130, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerSupport",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
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
            name: "enableAudienceReachV2",
            defaultValue: !1
        }),
        l = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportArchive",
            defaultValue: !1
        });
    e.s(["enableAudienceReachV2", 0, i, "enablePlayerHostedEvents", 0, n, "enablePlayerSupport", 0, a, "enablePlayerSupportArchive", 0, l, "enablePlayerSupportCreatorTicketReroute", 0, r])
}, 787617, e => {
    "use strict";
    let t = (0, e.i(157700).defineFlag)({
        namespace: "creator-platform",
        name: "isUpdatedPublishingFlowEnabled",
        defaultValue: !1
    });
    e.s(["isUpdatedPublishingFlowEnabled", 0, t])
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
}, 998683, e => {
    "use strict";
    var t = e.i(721281),
        a = e.i(502585),
        n = e.i(272593);
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
            (0, t._)(this, "localeApi", void 0), this.localeApi = new a.LocaleApi((0, n.createClientConfiguration)("locale", "bedev1"))
        }
    };
    e.s(["default", 0, r])
}, 607204, e => {
    "use strict";
    var t = e.i(581548),
        a = e.i(272593),
        n = e.i(127403);
    let r = (0, a.createClientConfiguration)("orgs", "bedev2", {
            middleware: [new n.default]
        }),
        i = new t.OrganizationApi(r),
        l = new t.InvitationApi(r),
        s = new t.RoleApi(r),
        o = new t.UserApi(r),
        d = new t.GroupUniversePayoutApi(r);
    e.s(["default", 0, {
        organizationClient: {
            getOrganization: async e => i.v1OrganizationsGet({
                groupId: e
            })
        },
        invitationClient: {
            createInvitation: async (e, t) => l.v1OrganizationsOrganizationIdInvitationsPost({
                organizationId: e,
                createInvitationRequestModel: t
            }),
            getInvitationsByOrganizationId: async (e, t, a) => l.v1OrganizationsOrganizationIdInvitationsGet({
                organizationId: e,
                pageToken: t,
                maxPageSize: a
            }),
            getInvitation: async (e, t) => l.v1OrganizationsOrganizationIdInvitationsInvitationIdGet({
                organizationId: e,
                invitationId: t
            }),
            acceptOrDeclineInvitation: async (e, t, a) => l.v1OrganizationsOrganizationIdInvitationsInvitationIdPatch({
                organizationId: e,
                invitationId: t,
                updateInvitationRequestModel: a
            }),
            deleteInvitationById: async (e, t) => l.v1OrganizationsOrganizationIdInvitationsInvitationIdDelete({
                organizationId: e,
                invitationId: t
            }),
            getRoleIdsByInvitationId: async (e, t) => l.v1OrganizationsOrganizationIdInvitationsInvitationIdRoleIdsGet({
                organizationId: e,
                invitationId: t
            })
        },
        roleClient: {
            createRole: async (e, t) => s.v1OrganizationsOrganizationIdRolesPost({
                organizationId: e,
                createOrUpdateRoleRequestModel: t
            }),
            getRoleMetadata: async (e, t, a) => s.v1OrganizationsOrganizationIdRolesRoleIdMetadataGet({
                organizationId: e,
                roleId: t,
                isDefault: a
            }),
            updateRoleMetadata: async (e, t, a) => s.v1OrganizationsOrganizationIdRolesRoleIdMetadataPatch({
                organizationId: e,
                roleId: t,
                createOrUpdateRoleRequestModel: a
            }),
            updateRolePosition: async (e, t, a) => s.v1OrganizationsOrganizationIdRolesRoleIdPositionPatch({
                organizationId: e,
                roleId: t,
                updateRolePositionRequestModel: a
            }),
            getRolesByOrganization: async (e, t, a) => s.v1OrganizationsOrganizationIdRolesGet({
                organizationId: e,
                pageToken: t,
                maxPageSize: a
            }),
            getUsersWithRole: async (e, t, a, n, r) => s.v1OrganizationsOrganizationIdRolesRoleIdUsersGet({
                organizationId: e,
                roleId: t,
                pageToken: a,
                maxPageSize: n,
                isDefault: r
            }),
            deleteRole: async (e, t) => s.v1OrganizationsOrganizationIdRolesRoleIdDelete({
                organizationId: e,
                roleId: t
            }),
            getInvitationsWithRole: async (e, t, a, n) => s.v1OrganizationsOrganizationIdRolesRoleIdInvitationsGet({
                organizationId: e,
                roleId: t,
                pageToken: a,
                maxPageSize: n
            })
        },
        userClient: {
            getUsersByOrganization: async (e, t, a) => o.v1OrganizationsOrganizationIdUsersGet({
                organizationId: e,
                pageToken: t,
                maxPageSize: a
            }),
            removeUserFromOrganization: async (e, t) => o.v1OrganizationsOrganizationIdUsersUserIdDelete({
                organizationId: e,
                userId: t
            }),
            getUserInvitationByOrganization: async (e, t) => o.v1OrganizationsOrganizationIdUsersUserIdInvitationsGet({
                organizationId: e,
                userId: t
            }),
            getUserPermissions: async (e, t) => {
                let {
                    raw: a
                } = await o.v1OrganizationsOrganizationIdUsersUserIdPermissionsGetRaw({
                    organizationId: e,
                    userId: t
                });
                return await a.json()
            },
            getUserRoles: async (e, t, a, n) => o.v1OrganizationsOrganizationIdUsersUserIdRolesGet({
                organizationId: e,
                userId: t,
                pageToken: a,
                maxPageSize: n
            }),
            addUserToOrganization: async (e, t) => o.v1OrganizationsOrganizationIdUsersUserIdPost({
                organizationId: e,
                userId: t
            }),
            addUserToRole: async (e, t, a) => o.v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdPost({
                organizationId: e,
                userId: t,
                roleId: a
            }),
            removeUserFromRole: async (e, t, a) => o.v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdDelete({
                organizationId: e,
                userId: t,
                roleId: a
            })
        },
        groupUniversePayoutClient: {
            getUniversePayouts: async e => d.v1OrganizationsOrganizationIdPayoutsUniverseIdGet(e),
            updateUniversePayouts: async e => d.v1OrganizationsOrganizationIdPayoutsUniverseIdPatch(e),
            findUniversePayouts: async e => d.v1OrganizationsOrganizationIdPayoutsUniversesGet(e),
            getLatestOneTimePayoutForUsers: async (e, t) => {
                let a = {
                    organizationId: e,
                    userIds: t.map(String)
                };
                return d.v1OrganizationsOrganizationIdPayoutsLatestGet(a)
            },
            getSuggestedPayouts: async e => d.v1OrganizationsOrganizationIdPayoutsSuggestedGet({
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
                url: a,
                init: n,
                response: r
            } = e, i = new URL(a);
            return "POST" !== n.method && "PATCH" !== n.method || "true" === i.searchParams.get("isSecure") || 403 !== r.status ? Promise.resolve(r) : (i.searchParams.set("isSecure", "true"), t(i.toString(), n))
        }
    }])
}, 384340, 672401, e => {
    "use strict";
    var t = e.i(416340);
    let a = (0, t.createContext)({
        isOrganizationRefreshRequired: !1,
        organization: void 0,
        permissions: void 0,
        refreshOrganization: () => ({}),
        refreshPermission: () => Promise.resolve(),
        isOrganizationLoading: !1
    });
    a.displayName = "Organization", e.s(["default", 0, a], 672401), e.s(["default", 0, function() {
        return (0, t.useContext)(a)
    }], 384340)
}, 927868, e => {
    "use strict";
    e.s(["getEnumKeyByValue", 0, (e, t) => {
        let a = Object.entries(e).find(e => {
            let [, a] = e;
            return a === t
        });
        return a ? a[0] : null
    }, "isValidArrayEnumValue", 0, (e, t) => e.includes(t), "isValidEnumValue", 0, (e, t) => Object.values(e).includes(t)])
}, 745873, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        n = e.i(458451),
        r = e.i(533414),
        i = e.i(157310),
        l = e.i(279149),
        s = e.i(602635),
        o = e.i(814975);
    let d = (0, e.i(272593).createClientConfiguration)("creator-home-api", "bedev2"),
        u = new l.GroupsApi(d),
        c = function() {
            let {
                user: e
            } = (0, o.useAuthentication)();
            return (0, i.useQuery)({
                queryKey: s.getGroupsQueryKey,
                enabled: !!e,
                queryFn: () => {
                    let e;
                    return e = {
                        surface: l.GroupListSurface.CreatorHub
                    }, u.groupsListGroups(e)
                }
            })
        },
        m = (0, a.createContext)(null);
    e.s(["GroupsProvider", 0, e => {
        let {
            children: i
        } = e, {
            user: l
        } = (0, n.useRobloxAuthentication)(), {
            data: s,
            isLoading: o,
            refetch: d
        } = c(), [u, f] = (0, r.useLocalStorage)("creatorHubGroups.".concat(null == l ? void 0 : l.id), null), [p, g] = (0, r.useLocalStorage)("creatorHubGroup.".concat(null == l ? void 0 : l.id), null), [v, h] = (0, r.useLocalStorage)("creatorHubGroupData.".concat(null == l ? void 0 : l.id), {}), b = (0, a.useCallback)(e => {
            g(e);
            let t = null === e ? "user" : e;
            h(e => {
                let a = {
                    lastSelected: Date.now(),
                    priority: 1
                };
                if (e[t]) {
                    let {
                        priority: n,
                        lastSelected: r
                    } = e[t];
                    "number" != typeof n || Number.isNaN(n) || "number" != typeof r || Number.isNaN(r) || (a.priority = n * (1 + Math.log10(1 + 10 / Math.max(Date.now() - r, 864e5))))
                }
                return {
                    ...e,
                    [t]: a
                }
            })
        }, [g, h]), y = (0, a.useMemo)(() => {
            if (null == s ? void 0 : s.groups) return null == s ? void 0 : s.groups;
            if (null === u) return [];
            try {
                return "string" == typeof u ? JSON.parse(u) : u
            } catch (e) {
                return []
            }
        }, [u, null == s ? void 0 : s.groups]), x = (0, a.useMemo)(() => {
            var e;
            return p && null != (e = y.find(e => {
                let {
                    id: t
                } = e;
                return t === p
            })) ? e : null
        }, [p, y]);
        (0, a.useEffect)(() => {
            (null == l ? void 0 : l.id) && (null == s ? void 0 : s.groups) && !o && f(null == s ? void 0 : s.groups)
        }, [null == s ? void 0 : s.groups, y, o, f, null == l ? void 0 : l.id]);
        let E = (0, a.useMemo)(() => ({
            groups: y,
            currentGroup: x,
            groupData: v,
            isFetched: !o && !!(null == l ? void 0 : l.id),
            refreshGroups: d,
            setCurrentGroup: b
        }), [x, v, y, o, d, b, null == l ? void 0 : l.id]);
        return (0, t.jsx)(m.Provider, {
            value: E,
            children: i
        })
    }, "useCurrentGroup", 0, () => {
        let e = (0, a.useContext)(m);
        if (null === e) throw Error("useCurrentGroup must be used within a GroupsProvider");
        return e.currentGroup
    }, "useGroups", 0, () => {
        let e = (0, a.useContext)(m);
        if (null === e) throw Error("useGroups must be used within a GroupsProvider");
        return e
    }], 745873)
}, 169525, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(78892),
        n = e.i(723570),
        r = e => {
            var r, l, s;
            let o, d, {
                    present: u,
                    children: c
                } = e,
                m = function(e) {
                    var a, r;
                    let [l, s] = t.useState(), o = t.useRef(null), d = t.useRef(e), u = t.useRef("none"), [c, m] = (a = e ? "mounted" : "unmounted", r = {
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
                        let a = r[e][t];
                        return null != a ? a : e
                    }, a));
                    return t.useEffect(() => {
                        let e = i(o.current);
                        u.current = "mounted" === c ? e : "none"
                    }, [c]), (0, n.useLayoutEffect)(() => {
                        let t = o.current,
                            a = d.current;
                        if (a !== e) {
                            let n = u.current,
                                r = i(t);
                            e ? m("MOUNT") : "none" === r || (null == t ? void 0 : t.display) === "none" ? m("UNMOUNT") : a && n !== r ? m("ANIMATION_OUT") : m("UNMOUNT"), d.current = e
                        }
                    }, [e, m]), (0, n.useLayoutEffect)(() => {
                        if (l) {
                            var e;
                            let t, a = null != (e = l.ownerDocument.defaultView) ? e : window,
                                n = e => {
                                    let n = i(o.current).includes(CSS.escape(e.animationName));
                                    if (e.target === l && n && (m("ANIMATION_END"), !d.current)) {
                                        let e = l.style.animationFillMode;
                                        l.style.animationFillMode = "forwards", t = a.setTimeout(() => {
                                            "forwards" === l.style.animationFillMode && (l.style.animationFillMode = e)
                                        })
                                    }
                                },
                                r = e => {
                                    e.target === l && (u.current = i(o.current))
                                };
                            return l.addEventListener("animationstart", r), l.addEventListener("animationcancel", n), l.addEventListener("animationend", n), () => {
                                a.clearTimeout(t), l.removeEventListener("animationstart", r), l.removeEventListener("animationcancel", n), l.removeEventListener("animationend", n)
                            }
                        }
                        m("ANIMATION_END")
                    }, [l, m]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(c),
                        ref: t.useCallback(e => {
                            o.current = e ? getComputedStyle(e) : null, s(e)
                        }, [])
                    }
                }(u),
                f = "function" == typeof c ? c({
                    present: m.isPresent
                }) : t.Children.only(c),
                p = (0, a.useComposedRefs)(m.ref, (d = (o = null == (l = Object.getOwnPropertyDescriptor((r = f).props, "ref")) ? void 0 : l.get) && "isReactWarning" in o && o.isReactWarning) ? r.ref : (d = (o = null == (s = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : s.get) && "isReactWarning" in o && o.isReactWarning) ? r.props.ref : r.props.ref || r.ref);
            return "function" == typeof c || m.isPresent ? t.cloneElement(f, {
                ref: p
            }) : null
        };

    function i(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    r.displayName = "Presence", e.s(["Presence", 0, r])
}, 71597, e => {
    "use strict";
    var t = e.i(18046),
        a = e.i(39210),
        n = e.i(197649),
        r = e.i(416340),
        i = e.i(78892),
        l = e.i(608652),
        s = e.i(174617),
        o = e.i(199786),
        d = e.i(300792),
        u = e.i(692166),
        c = e.i(169525),
        m = e.i(600317),
        f = e.i(221628),
        p = "Checkbox",
        [g, v] = (0, l.createContextScope)(p),
        [h, b] = g(p);

    function y(e) {
        let {
            __scopeCheckbox: t,
            checked: a,
            children: n,
            defaultChecked: i,
            disabled: l,
            form: s,
            name: d,
            onCheckedChange: u,
            required: c,
            value: m = "on",
            internal_do_not_use_render: g
        } = e, [v, b] = (0, o.useControllableState)({
            prop: a,
            defaultProp: null != i && i,
            onChange: u,
            caller: p
        }), [y, x] = r.useState(null), [E, w] = r.useState(null), I = r.useRef(!1), S = !y || !!s || !!y.closest("form"), P = {
            checked: v,
            disabled: l,
            setChecked: b,
            control: y,
            setControl: x,
            name: d,
            form: s,
            value: m,
            hasConsumerStoppedPropagationRef: I,
            required: c,
            defaultChecked: !z(i) && i,
            isFormControl: S,
            bubbleInput: E,
            setBubbleInput: w
        };
        return (0, f.jsx)(h, {
            scope: t,
            ...P,
            children: "function" == typeof g ? g(P) : n
        })
    }
    var x = "CheckboxTrigger",
        E = r.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                onKeyDown: n,
                onClick: l,
                ...o
            } = e, {
                control: d,
                value: u,
                disabled: c,
                checked: p,
                required: g,
                setControl: v,
                setChecked: h,
                hasConsumerStoppedPropagationRef: y,
                isFormControl: E,
                bubbleInput: w
            } = b(x, a), I = (0, i.useComposedRefs)(t, v), S = r.useRef(p);
            return r.useEffect(() => {
                let e = null == d ? void 0 : d.form;
                if (e) {
                    let t = () => h(S.current);
                    return e.addEventListener("reset", t), () => e.removeEventListener("reset", t)
                }
            }, [d, h]), (0, f.jsx)(m.Primitive.button, {
                type: "button",
                role: "checkbox",
                "aria-checked": z(p) ? "mixed" : p,
                "aria-required": g,
                "data-state": N(p),
                "data-disabled": c ? "" : void 0,
                disabled: c,
                value: u,
                ...o,
                ref: I,
                onKeyDown: (0, s.composeEventHandlers)(n, e => {
                    "Enter" === e.key && e.preventDefault()
                }),
                onClick: (0, s.composeEventHandlers)(l, e => {
                    h(e => !!z(e) || !e), w && E && (y.current = e.isPropagationStopped(), y.current || e.stopPropagation())
                })
            })
        });
    E.displayName = x;
    var w = r.forwardRef((e, t) => {
        let {
            __scopeCheckbox: a,
            name: n,
            checked: r,
            defaultChecked: i,
            required: l,
            disabled: s,
            value: o,
            onCheckedChange: d,
            form: u,
            ...c
        } = e;
        return (0, f.jsx)(y, {
            __scopeCheckbox: a,
            checked: r,
            defaultChecked: i,
            disabled: s,
            required: l,
            onCheckedChange: d,
            name: n,
            form: u,
            value: o,
            internal_do_not_use_render: e => {
                let {
                    isFormControl: n
                } = e;
                return (0, f.jsxs)(f.Fragment, {
                    children: [(0, f.jsx)(E, {
                        ...c,
                        ref: t,
                        __scopeCheckbox: a
                    }), n && (0, f.jsx)(O, {
                        __scopeCheckbox: a
                    })]
                })
            }
        })
    });
    w.displayName = p;
    var I = "CheckboxIndicator",
        S = r.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                forceMount: n,
                ...r
            } = e, i = b(I, a);
            return (0, f.jsx)(c.Presence, {
                present: n || z(i.checked) || !0 === i.checked,
                children: (0, f.jsx)(m.Primitive.span, {
                    "data-state": N(i.checked),
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
    S.displayName = I;
    var P = "CheckboxBubbleInput",
        O = r.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                ...n
            } = e, {
                control: l,
                hasConsumerStoppedPropagationRef: s,
                checked: o,
                defaultChecked: c,
                required: p,
                disabled: g,
                name: v,
                value: h,
                form: y,
                bubbleInput: x,
                setBubbleInput: E
            } = b(P, a), w = (0, i.useComposedRefs)(t, E), I = (0, d.usePrevious)(o), S = (0, u.useSize)(l);
            r.useEffect(() => {
                if (!x) return;
                let e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                    t = !s.current;
                if (I !== o && e) {
                    let a = new Event("click", {
                        bubbles: t
                    });
                    x.indeterminate = z(o), e.call(x, !z(o) && o), x.dispatchEvent(a)
                }
            }, [x, I, o, s]);
            let O = r.useRef(!z(o) && o);
            return (0, f.jsx)(m.Primitive.input, {
                type: "checkbox",
                "aria-hidden": !0,
                defaultChecked: null != c ? c : O.current,
                required: p,
                disabled: g,
                name: v,
                value: h,
                form: y,
                ...n,
                tabIndex: -1,
                ref: w,
                style: {
                    ...n.style,
                    ...S,
                    position: "absolute",
                    pointerEvents: "none",
                    opacity: 0,
                    margin: 0,
                    transform: "translateX(-100%)"
                }
            })
        });

    function z(e) {
        return "indeterminate" === e
    }

    function N(e) {
        return z(e) ? "indeterminate" : e ? "checked" : "unchecked"
    }
    O.displayName = P;
    let R = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-600"
        },
        C = {
            XSmall: "",
            Small: "",
            Medium: "",
            Large: "padding-y-xxsmall"
        },
        L = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        k = {
            XSmall: "",
            Small: "padding-top-xxsmall",
            Medium: "padding-top-xxsmall",
            Large: "padding-top-xxsmall"
        };
    e.s(["Checkbox", 0, e => {
        let {
            label: i,
            className: l,
            isChecked: s,
            isDisabled: o,
            size: d,
            hint: u,
            placement: c,
            onCheckedChange: m,
            id: f,
            ...p
        } = e, g = (0, a.default)(), v = f || g, h = i && r.default.createElement("label", {
            htmlFor: v,
            className: (0, n.default)("flex flex-col grow-1 gap-xsmall", !o && "cursor-pointer")
        }, r.default.createElement("span", {
            className: (0, n.default)(L[d], k[d], "content-emphasis")
        }, i), u && r.default.createElement("span", {
            className: "text-body-medium content-default"
        }, u));
        return r.default.createElement("div", {
            className: (0, n.default)("foundation-web-checkbox flex gap-medium", o && "opacity-[0.5]", !o && "cursor-pointer", l)
        }, "End" === c && h, r.default.createElement("div", {
            className: (0, n.default)(C[d])
        }, r.default.createElement(w, {
            "data-slot": "checkbox",
            className: (0, n.default)(R[d], t.interactable, !o && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
            id: v,
            checked: s,
            disabled: o,
            onCheckedChange: m,
            "aria-label": i,
            ...p
        }, r.default.createElement(t.StateLayer, null), r.default.createElement(S, {
            "data-slot": "checkbox-indicator",
            className: (0, n.default)(R[d], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
        }))), "Start" === c && h)
    }], 71597)
}, 942625, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340);
    let n = (0, a.forwardRef)((e, n) => {
        let {
            className: r,
            style: i,
            orientation: l = "horizontal",
            variant: s = "Standard",
            ...o
        } = e, d = "vertical" === l, u = {};
        return d || "Inset" !== s ? d || "InsetLeft" !== s ? d || "InsetRight" !== s || (u = {
            marginRight: "var(--padding-xlarge)"
        }) : u = {
            marginLeft: "var(--padding-xlarge)"
        } : u = {
            marginLeft: "var(--padding-xlarge)",
            marginRight: "var(--padding-xlarge)"
        }, a.default.createElement("div", {
            ref: n,
            ...o,
            role: "separator",
            "data-orientation": l,
            "aria-orientation": l,
            style: {
                borderRightWidth: 0,
                borderBottomWidth: 0,
                boxSizing: "border-box",
                borderStyle: "solid",
                ...d ? {
                    height: "100%",
                    width: 0,
                    borderLeftWidth: "var(--stroke-standard)",
                    borderTopWidth: 0
                } : "Thick" === s ? {
                    height: "var(--size-250)",
                    borderTop: "var(--stroke-standard)",
                    borderLeftWidth: 0,
                    background: "var(--color-common-heavydivider, rgba(0, 0, 0, 0.50))"
                } : {
                    height: 0,
                    borderTopWidth: "var(--stroke-standard)",
                    borderLeftWidth: 0
                },
                ...u,
                ...i
            },
            className: (0, t.default)("stroke-default self-stretch", r)
        })
    });
    n.displayName = "Divider", e.s(["Divider", 0, n])
}, 631719, e => {
    "use strict";
    var t = e.i(18046),
        a = e.i(823981),
        n = e.i(197649),
        r = e.i(416340),
        i = e.i(23342);
    let l = {
            Large: "size-1200",
            Medium: "size-1000",
            Small: "size-800",
            XSmall: "size-600"
        },
        s = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-700"
        },
        o = {
            Large: {
                circular: "radius-circle",
                square: "radius-medium"
            },
            Medium: {
                circular: "radius-circle",
                square: "radius-medium"
            },
            Small: {
                circular: "radius-circle",
                square: "radius-medium"
            },
            XSmall: {
                circular: "radius-circle",
                square: "radius-small"
            }
        },
        d = {
            Emphasis: "bg-action-emphasis",
            Standard: "bg-action-standard",
            Alert: "bg-action-alert",
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-0"
        },
        u = {
            Emphasis: "bg-action-standard",
            Standard: "bg-action-standard",
            Alert: "bg-action-standard",
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-0"
        },
        c = {
            Emphasis: "bg-action-emphasis",
            Standard: "bg-action-standard",
            Alert: "bg-action-standard",
            Utility: "bg-shift-300",
            OverMedia: "bg-over-media-0"
        },
        m = {
            Default: {
                Emphasis: "content-action-emphasis",
                Standard: "content-action-standard",
                Alert: "content-action-alert",
                Utility: "content-emphasis",
                OverMedia: "content-emphasis"
            },
            Inverse: {
                Emphasis: "content-inverse-action-emphasis",
                Standard: "content-inverse-action-standard",
                Alert: "content-inverse-action-alert",
                Utility: "content-inverse-emphasis",
                OverMedia: "content-inverse-emphasis"
            }
        },
        f = {
            Default: {
                Emphasis: "content-action-standard",
                Standard: "content-action-standard",
                Alert: "content-action-standard",
                Utility: "content-emphasis",
                OverMedia: "content-emphasis"
            },
            Inverse: {
                Emphasis: "content-inverse-action-standard",
                Standard: "content-inverse-action-standard",
                Alert: "content-inverse-action-standard",
                Utility: "content-inverse-emphasis",
                OverMedia: "content-inverse-emphasis"
            }
        },
        p = (0, r.forwardRef)((e, p) => {
            let g, {
                className: v,
                icon: h,
                ariaLabel: b,
                isDisabled: y = !1,
                isCircular: x = !1,
                isSelected: E = !1,
                size: w = "Large",
                variant: I = "Emphasis",
                iconColor: S = "Default",
                asChild: P,
                children: O,
                ...z
            } = e;
            g = y ? u[I] : E ? c[I] : d[I];
            let N = (0, n.default)("foundation-web-icon-button", y ? a.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", l[w], o[w][x ? "circular" : "square"], g, v),
                R = r.default.createElement(r.default.Fragment, null, r.default.createElement(t.StateLayer, null), r.default.createElement("span", {
                    className: (0, n.default)("icon", h, s[w], y ? f[S][I] : m[S][I])
                }));
            if (P) {
                let {
                    as: e,
                    ...t
                } = z, a = r.default.Children.only(O);
                return r.default.createElement(i.Slot, {
                    ref: p,
                    ...t,
                    className: N,
                    "aria-label": b,
                    "aria-disabled": y || void 0
                }, r.default.cloneElement(a, {}, R))
            }
            if ("a" === z.as) {
                let {
                    as: e,
                    href: t,
                    ...a
                } = z;
                return r.default.createElement("a", {
                    ref: p,
                    ...a,
                    "aria-label": b,
                    "aria-disabled": y,
                    href: y ? void 0 : t,
                    className: N
                }, R)
            }
            let {
                as: C,
                ...L
            } = z;
            return r.default.createElement("button", {
                ref: p,
                type: "button",
                ...L,
                "aria-label": b,
                disabled: y,
                className: N
            }, R)
        });
    e.s(["IconButton", 0, p])
}, 934145, 616892, e => {
    "use strict";
    var t = e.i(18046),
        a = e.i(39210),
        n = e.i(339855),
        r = e.i(908202),
        i = e.i(197649),
        l = e.i(416340),
        s = e.i(563921);
    let o = (0, l.createContext)(null),
        d = {
            XSmall: "size-300",
            Small: "size-400",
            Medium: "size-500",
            Large: "size-600"
        },
        u = {
            XSmall: "padding-x-medium",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-large"
        },
        c = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium",
            Large: "text-title-large"
        },
        m = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        f = {
            XSmall: "gap-xsmall",
            Small: "gap-small",
            Medium: "gap-small",
            Large: "gap-small"
        },
        p = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        g = {
            XSmall: "height-600",
            Small: "height-800",
            Medium: "height-1000",
            Large: "height-1200"
        },
        v = (0, l.forwardRef)((e, v) => {
            let {
                label: h,
                labelTooltip: b,
                ariaLabelledBy: y,
                ariaLabel: x,
                className: E,
                size: w,
                variant: I = "Standard",
                value: S,
                placeholder: P,
                isDisabled: O,
                hasError: z,
                hint: N,
                onValueChange: R,
                onOpenChange: C,
                children: L
            } = e, k = (0, a.default)(), U = (0, l.useMemo)(() => ({
                size: w
            }), [w]), M = h ? l.default.createElement("span", {
                id: k,
                className: (0, i.default)(c[w], "content-emphasis")
            }, h) : null;
            return l.default.createElement(o.Provider, {
                value: U
            }, l.default.createElement("div", {
                className: (0, i.default)("flex flex-col", O && ["opacity-[0.5]", "pointer-events-none"], f[w], E)
            }, M && (b ? l.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, M, l.default.createElement(n.LabelTooltip, b)) : M), l.default.createElement(s.Root, {
                value: S,
                disabled: O,
                onValueChange: R,
                onOpenChange: C
            }, l.default.createElement(s.Trigger, {
                className: (0, i.default)("relative clip group/interactable outline-none", "foundation-web-input flex items-center justify-between width-full cursor-pointer", r.INPUT_BACKGROUND_BY_VARIANT[I], r.INPUT_STROKE_BY_VARIANT[I], p[w], g[w], u[w], m[w], z ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", void 0 === S ? "content-muted" : "content-default"),
                ref: v,
                "aria-labelledby": h ? k : y,
                "aria-label": x
            }, l.default.createElement(t.StateLayer, null), l.default.createElement("div", {
                className: "grow-1 text-truncate-split text-align-x-left"
            }, l.default.createElement(s.Value, {
                placeholder: P
            })), l.default.createElement(s.Icon, {
                className: (0, i.default)(d[w], "icon icon-regular-chevron-large-down content-default")
            })), l.default.createElement(s.Portal, null, l.default.createElement(s.Content, {
                position: "popper",
                className: "padding-y-small foundation-web-portal-zindex",
                style: {
                    maxHeight: "var(--radix-select-content-available-height)"
                }
            }, L))), N && l.default.createElement("span", {
                className: (0, i.default)("text-caption-small", {
                    "content-system-alert": z,
                    "content-default": !z
                })
            }, N)))
        });
    v.displayName = "Dropdown", e.s(["Dropdown", 0, v, "DropdownContext", 0, o], 616892);
    var h = e.i(23342),
        b = e.i(142953);
    let y = {
            XSmall: "radius-medium",
            Small: "radius-large",
            Medium: "radius-large",
            Large: "radius-large"
        },
        x = {
            XSmall: "padding-xsmall",
            Small: "padding-small",
            Medium: "padding-small",
            Large: "padding-small"
        },
        E = {
            XSmall: "padding-x-medium",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-large"
        },
        w = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-small",
            Large: "padding-y-medium"
        },
        I = {
            XSmall: "gap-x-medium",
            Small: "gap-x-medium",
            Medium: "gap-x-medium",
            Large: "gap-x-large"
        },
        S = {
            XSmall: "gap-y-xxsmall",
            Small: "gap-y-xxsmall",
            Medium: "gap-y-xsmall",
            Large: "gap-y-xsmall"
        },
        P = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        O = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        z = (0, l.createContext)(null),
        N = () => {
            let e = (0, l.useContext)(z);
            if (!e) throw Error("Menu components must be used within a Menu");
            return e
        };
    e.s(["Menu", 0, e => {
        var t;
        let {
            children: a,
            className: n,
            size: r
        } = e, d = (0, l.useContext)(o), u = d ? "dropdown" : "standalone", c = null != (t = null != r ? r : null == d ? void 0 : d.size) ? t : "Medium", m = (0, l.useMemo)(() => ({
            size: c,
            mode: u
        }), [c, u]), f = (0, i.default)("foundation-web-menu bg-surface-100 stroke-standard stroke-default shadow-transient-high", y[c], n), p = "standalone" === u ? l.default.createElement(b.Root, {
            asChild: !0,
            orientation: "vertical",
            loop: !0
        }, l.default.createElement("div", {
            role: "menu",
            tabIndex: -1,
            className: f
        }, a)) : l.default.createElement("div", {
            className: f
        }, a);
        return l.default.createElement(z.Provider, {
            value: m
        }, "dropdown" === u ? l.default.createElement(s.Viewport, {
            asChild: !0,
            style: {
                width: "var(--radix-popper-anchor-width)"
            }
        }, p) : p)
    }, "MenuItem", 0, e => {
        let a, {
                value: n,
                leading: r,
                title: o,
                description: d,
                trailing: u,
                disabled: c,
                className: m,
                onSelect: f,
                asChild: p,
                children: g,
                ...v
            } = e,
            {
                size: y,
                mode: x
            } = N(),
            z = (0, i.default)(t.interactable, "foundation-web-menu-item flex items-center content-default text-truncate-split focus-visible:hover:outline-none cursor-pointer stroke-none bg-none text-align-x-left width-full", P[y], E[y], w[y], I[y], O[y], c && "opacity-[0.5]", c && "pointer-events-none", m),
            R = l.default.createElement("span", {
                className: "foundation-web-menu-item-title text-no-wrap text-truncate-split content-emphasis"
            }, o);
        switch (x) {
            case "dropdown":
                R = l.default.createElement(s.ItemText, {
                    asChild: !0
                }, R);
                break;
            case "standalone":
                break;
            default:
                console.error("Invalid menu mode:", x)
        }
        let C = l.default.createElement(l.default.Fragment, null, !c && l.default.createElement(t.StateLayer, null), r, l.default.createElement("div", {
            className: (0, i.default)("grow-1 text-truncate-split flex flex-col", S[y])
        }, R, d && l.default.createElement("div", {
            className: "foundation-web-menu-item-description content-muted"
        }, d)), u);
        if (p) {
            let {
                as: e,
                ...n
            } = v, r = l.default.Children.only(g), i = void 0 === o && r.props.children;
            a = l.default.createElement(h.Slot, {
                ...n,
                role: "standalone" === x ? "menuitem" : void 0,
                "aria-disabled": c || void 0,
                className: z,
                style: {
                    outlineOffset: 0
                },
                onClick: c ? void 0 : f
            }, i ? l.default.cloneElement(r, {}, l.default.createElement(l.default.Fragment, null, !c && l.default.createElement(t.StateLayer, null), r.props.children)) : l.default.cloneElement(r, {}, C))
        } else if ("a" === v.as) {
            let {
                as: e,
                href: t,
                ...n
            } = v;
            a = l.default.createElement("a", {
                ...n,
                role: "standalone" === x ? "menuitem" : void 0,
                "aria-disabled": c,
                href: c ? void 0 : t,
                className: z,
                style: {
                    outlineOffset: 0,
                    textDecoration: "none"
                },
                onClick: c ? void 0 : f
            }, C)
        } else {
            let {
                as: e,
                ...t
            } = v;
            a = l.default.createElement("button", {
                type: "button",
                ...t,
                role: "standalone" === x ? "menuitem" : void 0,
                "aria-disabled": c,
                className: z,
                style: {
                    outlineOffset: 0
                },
                onClick: c ? void 0 : f
            }, C)
        }
        return "dropdown" === x ? l.default.createElement(s.Item, {
            value: n,
            disabled: c,
            asChild: !0
        }, a) : l.default.createElement(b.Item, {
            asChild: !0,
            focusable: !0,
            tabStopId: n
        }, a)
    }, "MenuLabel", 0, e => {
        let {
            title: t,
            description: a,
            leading: n,
            trailing: r,
            disabled: s,
            className: o
        } = e, {
            size: d
        } = N(), u = (0, i.default)("foundation-web-menu-label flex items-center content-default text-truncate-split text-align-x-left width-full", P[d], E[d], w[d], I[d], s && "opacity-[0.5]", o);
        return l.default.createElement("div", {
            role: "none",
            className: u
        }, n, l.default.createElement("div", {
            className: (0, i.default)("grow-1 text-truncate-split flex flex-col", S[d])
        }, l.default.createElement("span", {
            className: "foundation-web-menu-label-title text-no-wrap text-truncate-split content-emphasis"
        }, t), a && l.default.createElement("div", {
            className: "foundation-web-menu-label-description content-muted"
        }, a)), r)
    }, "MenuSection", 0, e => {
        let {
            children: t,
            className: a
        } = e, {
            size: n
        } = N();
        return l.default.createElement("div", {
            role: "group",
            className: (0, i.default)(x[n], a)
        }, t)
    }, "MenuSeparator", 0, e => {
        let {
            className: t
        } = e;
        return l.default.createElement("div", {
            role: "separator",
            className: (0, i.default)("foundation-web-menu-separator", t)
        })
    }], 934145)
}, 538365, e => {
    "use strict";
    var t = e.i(688702),
        a = e.i(52746),
        n = e.i(962192),
        r = e.i(197649),
        i = e.i(416340);
    let l = (0, i.forwardRef)((e, l) => {
        let {
            title: s,
            icon: o,
            actionLabel: d,
            onAction: u,
            actions: c,
            onClose: m,
            closeIconAriaLabel: f = "Dismiss snackbar",
            shouldAutoDismiss: p,
            autoDismissDurationMs: g,
            className: v,
            ...h
        } = e, [b, y] = (0, i.useState)("enter"), x = (0, i.useRef)(void 0), E = (0, i.useRef)(void 0), w = (0, i.useRef)(void 0), I = (0, i.useRef)(null), S = null != c ? c : d && u && i.default.createElement(a.Button, {
            size: "Small",
            variant: "Utility",
            className: "content-inverse-emphasis",
            onClick: u,
            ref: I
        }, d), P = !!S, O = s.length > 80, z = null == p || p, N = 4e3;
        P && (N = O ? 1e4 : 7e3);
        let R = null != g ? g : N,
            C = (0, i.useCallback)(() => {
                "exit" !== b && (y("exit"), void 0 !== E.current && (window.clearTimeout(E.current), E.current = void 0), w.current = window.setTimeout(() => {
                    null == m || m()
                }, 150))
            }, [m, b]);
        (0, i.useEffect)(() => (x.current = window.requestAnimationFrame(() => {
            y("idle")
        }), () => {
            void 0 !== x.current && window.cancelAnimationFrame(x.current)
        }), []), (0, i.useEffect)(() => {
            void 0 !== E.current && (window.clearTimeout(E.current), E.current = void 0), z && "exit" !== b && (E.current = window.setTimeout(() => {
                C()
            }, R))
        }, [R, z, b, C]), (0, i.useEffect)(() => {
            var e;
            P && (null == (e = I.current) || e.focus())
        }, [P]), (0, i.useEffect)(() => () => {
            void 0 !== E.current && window.clearTimeout(E.current), void 0 !== w.current && window.clearTimeout(w.current), void 0 !== x.current && window.cancelAnimationFrame(x.current)
        }, []);
        let L = {
                position: "fixed",
                left: "50%",
                bottom: "max(var(--padding-xxlarge, 32px), env(safe-area-inset-bottom))",
                transform: "translate(-50%, ".concat("idle" === b ? "0" : "120%", ")"),
                zIndex: "var(--foundation-portal-zindex, 9999)"
            },
            k = h.style ? {
                ...L,
                ...h.style
            } : L;
        return i.default.createElement("div", {
            ref: l,
            role: "status",
            "aria-live": "polite",
            className: (0, r.default)("flex items-center gap-xxlarge radius-medium shadow-transient-low bg-inverse-surface-0 padding-x-medium padding-y-medium stroke-standard shrink-0", "max-width-[480px] min-height-[48px]", "min-width-[min(100%-max(2_*_var(--margin-small),env(safe-area-inset-left)+env(safe-area-inset-right)),393px)]", "foundation-web-portal-zindex pointer-events-auto", "exit" === b ? "ease-standard-in" : "ease-standard-out", v),
            style: {
                ...k,
                transitionDuration: "".concat("exit" === b ? 150 : 200, "ms"),
                transitionProperty: "transform"
            },
            ...h
        }, i.default.createElement("div", {
            className: "flex items-center gap-medium grow-1 basis-0 min-h-[40px]"
        }, o && i.default.createElement(t.Icon, {
            name: o,
            size: "Small",
            className: "shrink-0 content-inverse-emphasis"
        }), i.default.createElement("div", {
            className: "grow-1 basis-0 text-caption-large content-inverse-emphasis text-truncate-end"
        }, s)), i.default.createElement("div", {
            className: "flex items-center justify-end gap-small shrink-0"
        }, S, m && i.default.createElement(n.CloseAffordance, {
            variant: "Utility",
            size: "Small",
            isCircular: !0,
            className: "content-inverse-emphasis",
            "aria-label": f,
            onClick: C
        })))
    });
    e.s(["Snackbar", 0, l])
}, 737420, 706386, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340);

    function n(e) {
        let {
            className: n
        } = e;
        return a.default.createElement("svg", {
            xmlns: "http://www.w3.org/2000/svg",
            width: "13",
            height: "6",
            viewBox: "0 0 13 6",
            fill: "none",
            className: (0, t.default)("block", n),
            style: {
                marginTop: -1
            }
        }, a.default.createElement("path", {
            d: "M0.249999 0.666628L4.83579 5.25241C5.61683 6.03346 6.88316 6.03346 7.66421 5.25241L12.25 0.666626L0.249999 0.666628Z",
            fill: "currentColor"
        }))
    }
    e.s(["Beak", 0, n], 706386);
    var r = e.i(989665);
    e.s(["Tooltip", 0, function(e) {
        let {
            position: i,
            hasBeak: l = !0,
            title: s,
            description: o,
            ariaLabel: d,
            delayDurationMs: u = 500,
            children: c,
            open: m,
            onOpenChange: f,
            contentClassName: p
        } = e, [g, v] = i.split("-"), h = null != d ? d : "string" == typeof s && null == o ? s : void 0;
        return a.createElement(r.Provider, {
            delayDuration: u
        }, a.createElement(r.Root, {
            open: m,
            onOpenChange: f
        }, c, a.createElement(r.Portal, null, a.createElement(r.Content, {
            side: g,
            align: v,
            "aria-label": h,
            className: (0, t.default)("foundation-web-portal-zindex bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", p),
            sideOffset: 5
        }, l && a.createElement(r.Arrow, {
            asChild: !0
        }, a.createElement(n, {
            className: "content-[var(--inverse-surface-0)]"
        })), a.createElement("div", {
            className: "flex flex-col text-truncate-split"
        }, a.createElement("div", {
            className: "text-caption-medium content-inverse-default"
        }, s), o && a.createElement("div", {
            className: "text-body-small padding-top-xsmall content-inverse-default max-width-[calc(var(--size-100)*50)]"
        }, o))))))
    }, "TooltipTrigger", 0, function(e) {
        let {
            children: t,
            asChild: n,
            className: i
        } = e;
        return a.createElement(r.Trigger, {
            asChild: n,
            className: i
        }, t)
    }], 737420)
}, 339855, e => {
    "use strict";
    var t = e.i(688702),
        a = e.i(737420),
        n = e.i(416340);
    e.s(["LabelTooltip", 0, e => {
        let {
            title: r,
            description: i,
            position: l = "top-center"
        } = e;
        return n.default.createElement(a.Tooltip, {
            position: l,
            title: r,
            description: i
        }, n.default.createElement(a.TooltipTrigger, {
            asChild: !0
        }, n.default.createElement("span", {
            role: "button",
            tabIndex: 0,
            "aria-label": r,
            className: "flex items-center content-muted",
            "data-testid": "label-tooltip-trigger"
        }, n.default.createElement(t.Icon, {
            name: "icon-regular-circle-i",
            size: "Small"
        }))))
    }])
}, 908202, e => {
    "use strict";
    e.s(["INPUT_BACKGROUND_BY_VARIANT", 0, {
        Standard: "bg-none",
        Contrast: "bg-shift-200",
        Utility: "bg-none"
    }, "INPUT_STROKE_BY_VARIANT", 0, {
        Standard: "stroke-standard",
        Contrast: "stroke-none",
        Utility: "stroke-none"
    }, "INPUT_VARIANTS", 0, ["Standard", "Contrast", "Utility"]])
}, 39210, e => {
    "use strict";
    var t = e.i(416340);
    let a = 0;
    e.s(["default", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "«r",
            n = (0, t.useRef)();
        return n.current || (a += 1, n.current = "".concat(e).concat(a)), n.current
    }])
}, 196945, e => {
    "use strict";
    var t = e.i(865800),
        a = e.i(416340),
        n = e.i(323356);
    e.i(221628), e.i(149285);
    var r = (0, a.createContext)({
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
        var i, l, s, o, d = e.children,
            u = (0, t.a)(e, ["children"]),
            c = (0, a.useRef)(null),
            m = (0, a.useState)(!1),
            f = m[0],
            p = m[1],
            g = (0, a.useState)([]),
            v = g[0],
            h = g[1],
            b = (0, a.useCallback)(function(e, a) {
                void 0 === e && (e = {}), void 0 === a && (a = function() {
                    return !0
                }), h(function(n) {
                    return (0, t.b)((0, t.b)([], n, !0), [{
                        props: e,
                        shouldClose: a
                    }], !1)
                })
            }, [h]),
            y = (0, a.useCallback)(function() {
                p(!1)
            }, [p]);
        (0, a.useEffect)(function() {
            v.length > 0 && p(!0)
        }, [v.length]);
        var x = (0, a.useMemo)(function() {
            return {
                ref: c,
                enqueue: b,
                close: y
            }
        }, [y, b]);
        return a.default.createElement(a.default.Fragment, null, a.default.createElement(r.Provider, {
            value: x
        }, d), a.default.createElement(n.S, (0, t._)({}, (null == (i = v[0]) ? void 0 : i.props) || {}, u, {
            TransitionProps: (0, t._)((0, t._)({}, (null == (s = null == (l = v[0]) ? void 0 : l.props) ? void 0 : s.TransitionProps) || {}), {
                onExited: function(e) {
                    var a, n, r, i;
                    h(function(e) {
                        var a = e.slice(1);
                        return (0, t.b)([], a, !0)
                    }), (null == (n = null == (a = v[0]) ? void 0 : a.props.TransitionProps) ? void 0 : n.onExited) && (null == (i = null == (r = v[0]) ? void 0 : r.props.TransitionProps) || i.onExited(e))
                }
            }),
            onClose: function(e, t) {
                var a, n, r;
                (null == (a = v[0]) ? void 0 : a.shouldClose(t)) && p(!1), (null == (n = v[0]) ? void 0 : n.props.onClose) && (null == (r = v[0]) || r.props.onClose(e, t))
            },
            open: f
        }), null == (o = v[0]) ? void 0 : o.props.children))
    }, "useSnackbar", 0, function() {
        var e = (0, a.useContext)(r);
        return {
            ref: e.ref,
            enqueue: e.enqueue,
            close: e.close
        }
    }])
}, 117437, e => {
    "use strict";
    var t = e.i(711367);

    function a(e, t) {
        let {
            pages: a,
            pageParams: n
        } = t, r = a.length - 1;
        return a.length > 0 ? e.getNextPageParam(a[r], a, n[r], n) : void 0
    }

    function n(e, t) {
        var a;
        let {
            pages: n,
            pageParams: r
        } = t;
        return n.length > 0 ? null == (a = e.getPreviousPageParam) ? void 0 : a.call(e, n[0], n, r[0], r) : void 0
    }
    e.s(["hasNextPage", 0, function(e, t) {
        return !!t && null != a(e, t)
    }, "hasPreviousPage", 0, function(e, t) {
        return !!t && !!e.getPreviousPageParam && null != n(e, t)
    }, "infiniteQueryBehavior", 0, function(e) {
        return {
            onFetch: (r, i) => {
                var l, s, o, d, u;
                let c = r.options,
                    m = null == (o = r.fetchOptions) || null == (s = o.meta) || null == (l = s.fetchMore) ? void 0 : l.direction,
                    f = (null == (d = r.state.data) ? void 0 : d.pages) || [],
                    p = (null == (u = r.state.data) ? void 0 : u.pageParams) || [],
                    g = {
                        pages: [],
                        pageParams: []
                    },
                    v = 0,
                    h = async () => {
                        let i = !1,
                            l = (0, t.ensureQueryFn)(r.options, r.fetchOptions),
                            s = async (e, a, n) => {
                                let s;
                                if (i) return Promise.reject();
                                if (null == a && e.pages.length) return Promise.resolve(e);
                                let o = (Object.defineProperty(s = {
                                        client: r.client,
                                        queryKey: r.queryKey,
                                        pageParam: a,
                                        direction: n ? "backward" : "forward",
                                        meta: r.options.meta
                                    }, "signal", {
                                        enumerable: !0,
                                        get: () => (r.signal.aborted ? i = !0 : r.signal.addEventListener("abort", () => {
                                            i = !0
                                        }), r.signal)
                                    }), s),
                                    d = await l(o),
                                    {
                                        maxPages: u
                                    } = r.options,
                                    c = n ? t.addToStart : t.addToEnd;
                                return {
                                    pages: c(e.pages, d, u),
                                    pageParams: c(e.pageParams, a, u)
                                }
                            };
                        if (m && f.length) {
                            let e = "backward" === m,
                                t = {
                                    pages: f,
                                    pageParams: p
                                },
                                r = (e ? n : a)(c, t);
                            g = await s(t, r, e)
                        } else {
                            let t = null != e ? e : f.length;
                            do {
                                var o;
                                let e = 0 === v ? null != (o = p[0]) ? o : c.initialPageParam : a(c, g);
                                if (v > 0 && null == e) break;
                                g = await s(g, e), v++
                            } while (v < t)
                        }
                        return g
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
}, 550742, e => {
    "use strict";
    let t, a;
    var n, r, i = e.i(416340);
    let l = "u" > typeof Intl,
        s = !l || void 0 === Intl.Locale,
        o = !l || void 0 === Intl.RelativeTimeFormat,
        d = !l || void 0 === Intl.PluralRules,
        u = !l || void 0 === Intl.DisplayNames,
        c = "function" != typeof window.ResizeObserver,
        m = (n = s || o || d || u || c, r = function() {
            return Promise.all([(s ? e.A(361318).then(function(e) {
                return e.p
            }) : Promise.resolve()).then(() => Promise.all([o ? e.A(950511).then(function(e) {
                return e.p
            }).then(() => e.A(874521)) : null, d ? e.A(684498).then(function(e) {
                return e.p
            }).then(() => e.A(104943)) : null, u ? e.A(951862).then(() => e.A(890267)) : null])), c ? e.A(956827) : null])
        }, t = !1, a = n ? r().catch(() => {}).then(() => {
            t = !0
        }) : null, function() {
            let [e, n] = (0, i.useState)(!a || t);
            return (0, i.useEffect)(() => {
                a && !e && a.then(() => n(!0))
            }, [e]), e
        });
    e.s(["usePolyfills", 0, m], 550742)
}, 823062, e => {
    "use strict";
    var t = e.i(416340);
    let a = (0, t.createContext)(null),
        n = [],
        r = ["pageload", "click", "impression", "hover", "webvitals", "apivitals", "formvitals", "error", "session"],
        i = new Set(["TTFB", "FCP", "LCP", "FID", "CLS", "INP"]);
    e.s(["UnifiedLoggerProvider", 0, e => {
        var l;
        let {
            children: s,
            unifiedLogger: o,
            pageLoggerConfig: d,
            path: u
        } = e, c = null != (l = null == d ? void 0 : d.tags) ? l : n, m = null == d ? void 0 : d.rosId, f = (0, t.useMemo)(() => ({
            tags: c,
            rosId: m,
            path: u
        }), [c, m, u]), p = (0, t.useRef)(f), g = (0, t.useRef)(f);
        (0, t.useLayoutEffect)(() => {
            g.current = f, void 0 === p.current.path && void 0 !== f.path && (p.current = {
                ...p.current,
                path: f.path
            })
        }, [f]), (0, t.useLayoutEffect)(() => {
            let e = e => {
                var t;
                let a, n = (a = null == (t = e.parameters) ? void 0 : t.metricName, "webvitals" === e.eventType && void 0 !== a && i.has(a)) ? p.current : g.current;
                void 0 !== n.path && (e.parameters = {
                    ...e.parameters,
                    path: n.path
                }), n.tags.forEach(t => e.addTag(t)), void 0 !== n.rosId && e.addTag("owner: ".concat(n.rosId))
            };
            return r.forEach(t => {
                o.events.on(t, e)
            }), () => {
                r.forEach(t => {
                    o.events.off(t, e)
                })
            }
        }, [o]);
        let v = (0, t.useMemo)(() => ({
            unifiedLogger: o,
            pageContext: f
        }), [o, f]);
        return t.default.createElement(a.Provider, {
            value: v
        }, s)
    }, "useUnifiedLoggerProvider", 0, function() {
        let e = (0, t.useContext)(a);
        if (null === e) throw Error("useUnifiedLoggerProvider must be used within a UnifiedLoggerProvider");
        return e
    }])
}]);

//# debugId=3d3904d6-5d61-9211-8880-010d8d4779dc
//# sourceMappingURL=1zvc2jrzi_ncv.js.map