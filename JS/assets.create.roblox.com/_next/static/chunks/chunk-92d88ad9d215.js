;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "140d0dd9-a719-a55e-72e4-63d97505bdc6")
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
            name: "enableExpeditedReview",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerHostedEvents",
            defaultValue: !1
        }),
        i = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportCreatorTicketReroute",
            defaultValue: !1
        });
    e.s(["enableExpeditedReview", 0, n, "enablePlayerHostedEvents", 0, r, "enablePlayerSupport", 0, a, "enablePlayerSupportCreatorTicketReroute", 0, i])
}, 242002, e => {
    "use strict";
    let t = (0, e.i(157700).defineFlag)({
        namespace: "game-discovery-serving",
        name: "isHomeAcquisitionSignalsEnabled",
        defaultValue: !0
    });
    e.s(["isHomeAcquisitionSignalsEnabled", 0, t])
}, 82899, 494192, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.defineFlag)({
        namespace: "leaderboards",
        name: "isLeaderboardConfigsEnabled",
        defaultValue: !1
    });
    e.s(["isLeaderboardConfigsEnabled", 0, a], 82899);
    let n = (0, t.defineFlag)({
        namespace: "preset-chat",
        name: "presetChatEnabled",
        defaultValue: !1
    });
    e.s(["presetChatEnabled", 0, n], 494192)
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
        o = new t.InvitationApi(r),
        s = new t.RoleApi(r),
        l = new t.UserApi(r),
        u = new t.GroupUniversePayoutApi(r);
    e.s(["default", 0, {
        organizationClient: {
            getOrganization: async e => i.v1OrganizationsGet({
                groupId: e
            })
        },
        invitationClient: {
            createInvitation: async (e, t) => o.v1OrganizationsOrganizationIdInvitationsPost({
                organizationId: e,
                createInvitationRequestModel: t
            }),
            getInvitationsByOrganizationId: async (e, t, a) => o.v1OrganizationsOrganizationIdInvitationsGet({
                organizationId: e,
                pageToken: t,
                maxPageSize: a
            }),
            getInvitation: async (e, t) => o.v1OrganizationsOrganizationIdInvitationsInvitationIdGet({
                organizationId: e,
                invitationId: t
            }),
            acceptOrDeclineInvitation: async (e, t, a) => o.v1OrganizationsOrganizationIdInvitationsInvitationIdPatch({
                organizationId: e,
                invitationId: t,
                updateInvitationRequestModel: a
            }),
            deleteInvitationById: async (e, t) => o.v1OrganizationsOrganizationIdInvitationsInvitationIdDelete({
                organizationId: e,
                invitationId: t
            }),
            getRoleIdsByInvitationId: async (e, t) => o.v1OrganizationsOrganizationIdInvitationsInvitationIdRoleIdsGet({
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
            getUsersByOrganization: async (e, t, a) => l.v1OrganizationsOrganizationIdUsersGet({
                organizationId: e,
                pageToken: t,
                maxPageSize: a
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
                    raw: a
                } = await l.v1OrganizationsOrganizationIdUsersUserIdPermissionsGetRaw({
                    organizationId: e,
                    userId: t
                });
                return await a.json()
            },
            getUserRoles: async (e, t, a, n) => l.v1OrganizationsOrganizationIdUsersUserIdRolesGet({
                organizationId: e,
                userId: t,
                pageToken: a,
                maxPageSize: n
            }),
            addUserToOrganization: async (e, t) => l.v1OrganizationsOrganizationIdUsersUserIdPost({
                organizationId: e,
                userId: t
            }),
            addUserToRole: async (e, t, a) => l.v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdPost({
                organizationId: e,
                userId: t,
                roleId: a
            }),
            removeUserFromRole: async (e, t, a) => l.v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdDelete({
                organizationId: e,
                userId: t,
                roleId: a
            })
        },
        groupUniversePayoutClient: {
            getUniversePayouts: async e => u.v1OrganizationsOrganizationIdPayoutsUniverseIdGet(e),
            updateUniversePayouts: async e => u.v1OrganizationsOrganizationIdPayoutsUniverseIdPatch(e),
            findUniversePayouts: async e => u.v1OrganizationsOrganizationIdPayoutsUniversesGet(e),
            getLatestOneTimePayoutForUsers: async (e, t) => {
                let a = {
                    organizationId: e,
                    userIds: t.map(String)
                };
                return u.v1OrganizationsOrganizationIdPayoutsLatestGet(a)
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
                url: a,
                init: n,
                response: r
            } = e, i = new URL(a);
            return "POST" !== n.method && "PATCH" !== n.method || "true" === i.searchParams.get("isSecure") || 403 !== r.status ? Promise.resolve(r) : (i.searchParams.set("isSecure", "true"), t(i.toString(), n))
        }
    }])
}, 533968, e => {
    "use strict";
    var t = e.i(185915);
    e.s(["getResponseFromError", () => t.default])
}, 970494, e => {
    "use strict";
    let t = ["development-items-inventory"],
        a = ["development-item-metadata-overrides"],
        n = e => null != e ? e : "",
        r = e => {
            var t;
            return null != (t = null == e ? void 0 : e.trim()) ? t : ""
        },
        i = (e, t) => {
            e.setQueryData(a, e => {
                if ((null == e ? void 0 : e.has(t)) !== !0) return e;
                let a = new Map(e);
                return a.delete(t), a
            })
        },
        o = (e, t) => {
            var n;
            let r = null == (n = e.getQueryData(a)) ? void 0 : n.get(t);
            return null != r && r.expiresAt <= Date.now() ? void i(e, t) : r
        },
        s = (e, t, n) => {
            e.setQueryData(a, e => {
                let a = null == e ? void 0 : e.get(t);
                if (null == a) return e;
                let r = {
                        ...a,
                        developConfirmed: "develop" === n || a.developConfirmed,
                        inventoryConfirmed: "inventory" === n || a.inventoryConfirmed
                    },
                    i = new Map(e);
                return r.developConfirmed && r.inventoryConfirmed ? i.delete(t) : i.set(t, r), i
            })
        },
        l = (e, t) => r(null == t ? void 0 : t.name) === r(e.name) && n(null == t ? void 0 : t.description) === n(e.description);
    e.s(["DEVELOPMENT_ITEMS_INVENTORY_QUERY_KEY", 0, t, "cacheDevelopmentItemMetadataUpdate", 0, (e, r) => {
        let {
            assetId: s,
            description: l,
            name: u
        } = r, d = new Date, c = {
            assetId: s,
            description: n(l),
            developConfirmed: !1,
            expiresAt: d.getTime() + 3e4,
            inventoryConfirmed: !1,
            name: u,
            updated: d
        };
        e.setQueryData(a, e => {
            let t = new Map(e);
            return t.set(s, c), t
        }), e.setQueriesData({
            queryKey: t
        }, e => {
            let t = null == e ? void 0 : e.items.find(e => e.assetId === s);
            return null == e || null == t ? e : {
                ...e,
                items: [{
                    ...t,
                    name: u,
                    updated: d
                }, ...e.items.filter(e => e.assetId !== s)]
            }
        }), e.invalidateQueries({
            queryKey: t,
            refetchType: "active"
        }), window.setTimeout(() => {
            let a = o(e, s);
            (null == a ? void 0 : a.expiresAt) === c.expiresAt && (i(e, s), e.invalidateQueries({
                queryKey: t,
                refetchType: "active"
            }))
        }, 3e4)
    }, "reconcileDeveloperItemDetailsMetadata", 0, (e, t, a) => {
        let n = o(e, t);
        return null == n ? {
            details: a
        } : l(n, a) ? (s(e, t, "develop"), {
            details: a
        }) : {
            details: {
                ...a,
                description: n.description,
                name: n.name
            },
            expiresAt: n.expiresAt
        }
    }, "reconcileDevelopmentItemsInventoryMetadata", 0, (e, t, a) => {
        let n = [],
            r = [];
        return t.forEach(t => {
            let i = o(e, t.assetId);
            if (null == i) return void r.push(t);
            if (l(i, a.get(t.assetId))) {
                s(e, t.assetId, "inventory"), r.push(t);
                return
            }
            n.push({
                ...t,
                name: i.name,
                updated: i.updated
            })
        }), n.sort((e, t) => {
            var a, n, r, i;
            return (null != (a = null == (r = t.updated) ? void 0 : r.getTime()) ? a : 0) - (null != (n = null == (i = e.updated) ? void 0 : i.getTime()) ? n : 0)
        }), [...n, ...r]
    }])
}, 105098, 995721, e => {
    "use strict";
    var t = e.i(416340);
    let a = (0, t.createContext)({
        isLoadingLook: !1,
        refreshLookDetails: () => {
            throw Error("function is not implemented")
        },
        lookSalesData: void 0,
        lookDetail: void 0
    });
    a.displayName = "LookDetails", e.s(["default", 0, a], 995721), e.s(["default", 0, function() {
        return (0, t.useContext)(a)
    }], 105098)
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
}, 17829, e => {
    "use strict";
    var t, a = ((t = a || {}).User = "User", t.Group = "Group", t);
    e.s(["default", 0, a])
}, 627636, e => {
    "use strict";
    var t = e.i(17829);
    e.s(["CreatorType", () => t.default])
}, 450639, 950473, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        n = e.i(79187),
        r = e.i(540513),
        i = e.i(808377),
        o = e.i(449934),
        s = e.i(169722),
        l = e.i(591403),
        u = e.i(833172);
    e.s(["NotInterestedIcon", () => u.NotInterested], 950473);
    var u = u,
        d = e.i(559956),
        c = e.i(199834),
        p = e.i(706442);
    let v = function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
        return (0, p.makeStyles)()(t => ({
            imageStatusContainer: {
                backgroundColor: e ? t.palette.surface.outline : t.palette.components.input.filled.enableFill,
                color: e ? t.palette.content.inverse : t.palette.content.muted,
                width: "100%",
                height: "100%"
            },
            statusTextContainer: {
                display: "block",
                textAlign: "center",
                whiteSpace: "nowrap",
                color: e ? t.palette.content.inverse : t.palette.content.muted
            },
            imageContainer: {
                width: "100%",
                height: 0,
                paddingTop: "100%",
                position: "relative",
                borderRadius: e ? 4 : 8,
                overflow: "hidden",
                backgroundColor: t.palette.components.input.filled.enableFill
            },
            imageWrapper: {
                position: "absolute",
                bottom: 0,
                left: 0,
                width: "100%",
                height: "100%",
                textAlign: "center"
            },
            image: {
                width: "100%",
                height: "100%",
                position: "absolute",
                left: "0",
                bottom: "0",
                objectFit: "contain"
            },
            bottomRightAdornmentContainer: {
                position: "absolute",
                bottom: 8,
                right: 8,
                padding: 4,
                borderRadius: 4,
                background: t.palette.surface[200],
                display: "flex"
            },
            skeleton: {
                height: "100%"
            }
        }))
    };
    e.s(["default", 0, e => {
        let {
            targetId: p,
            targetType: g,
            returnPolicy: m = r.ReturnPolicy.AutoGenerated,
            isStatusTextShown: f = !1,
            alt: h,
            fontColor: y = "light",
            bottomRightAdornment: b
        } = e, {
            classes: {
                imageStatusContainer: C,
                statusTextContainer: I,
                imageWrapper: R,
                imageContainer: O,
                image: x,
                bottomRightAdornmentContainer: k,
                skeleton: w
            }
        } = v("light" !== y)(), {
            translate: E
        } = (0, n.useTranslation)(), [z, S] = (0, a.useState)(!1), [P, L] = (0, a.useState)(), U = (0, a.useCallback)(async function(e, t, a) {
            let n = arguments.length > 3 && void 0 !== arguments[3] && arguments[3];
            if (t && e) {
                S(!0);
                try {
                    let i = n ? r.ThumbnailClient.reloadThumbnailImage : r.ThumbnailClient.getThumbnailImage,
                        o = await i(e, t, a);
                    L(o)
                } catch (e) {
                    L({
                        state: i.ThumbnailResponseState.TemporarilyUnavailable
                    })
                } finally {
                    S(!1)
                }
            }
        }, []), T = (0, a.useMemo)(() => {
            if (z) return (0, t.jsx)(d.Skeleton, {
                classes: {
                    root: w
                },
                variant: "rectangular",
                animate: !0
            });
            let e = "",
                a = null;
            switch (null == P ? void 0 : P.state) {
                case i.ThumbnailResponseState.InReview:
                    e = E("Label.InReview"), a = (0, t.jsx)(l.HourglassEmptyIcon, {
                        fontSize: "large",
                        color: "dark" === y ? void 0 : "secondary"
                    });
                    break;
                case i.ThumbnailResponseState.Blocked:
                    e = E("Label.Moderated"), a = (0, t.jsx)(u.NotInterested, {
                        fontSize: "large",
                        color: "dark" === y ? void 0 : "secondary"
                    });
                    break;
                case i.ThumbnailResponseState.Error:
                case i.ThumbnailResponseState.TemporarilyUnavailable:
                    e = E("Label.Unavailable"), a = (0, t.jsx)(o.BrokenImageOutlinedIcon, {
                        fontSize: "large",
                        color: "dark" === y ? void 0 : "secondary"
                    });
                    break;
                default:
                    return null
            }
            return (0, t.jsx)(s.Grid, {
                container: !0,
                classes: {
                    root: C
                },
                justifyContent: "center",
                alignItems: "center",
                children: f ? (0, t.jsxs)("div", {
                    children: [a, (0, t.jsx)(c.Typography, {
                        variant: "smallLabel1",
                        classes: {
                            root: I
                        },
                        children: e
                    })]
                }) : a
            })
        }, [z, null == P ? void 0 : P.state, C, f, I, w, E, y]);
        return (0, a.useEffect)(() => {
            U(g, p, m)
        }, [p, g, m, U]), {
            thumbnailImage: (0, t.jsx)(s.Grid, {
                item: !0,
                container: !0,
                XSmall: 12,
                justifyContent: "center",
                alignItems: "center",
                children: (0, t.jsxs)("div", {
                    className: O,
                    children: [(null == P ? void 0 : P.state) === i.ThumbnailResponseState.Completed ? (0, t.jsx)("img", {
                        className: x,
                        src: null == P ? void 0 : P.imageUrl,
                        alt: h
                    }) : (0, t.jsx)("div", {
                        className: R,
                        children: T
                    }), b ? (0, t.jsx)("div", {
                        className: k,
                        children: b
                    }) : null]
                })
            }),
            thumbnailData: P,
            refreshThumbnail: (0, a.useCallback)(async () => U(g, p, m, !0), [U, g, p, m])
        }
    }], 450639)
}, 927868, e => {
    "use strict";
    e.s(["getEnumKeyByValue", 0, (e, t) => {
        let a = Object.entries(e).find(e => {
            let [, a] = e;
            return a === t
        });
        return a ? a[0] : null
    }, "isValidArrayEnumValue", 0, (e, t) => e.includes(t), "isValidEnumValue", 0, (e, t) => Object.values(e).includes(t)])
}, 692587, e => {
    "use strict";
    e.s(["default", 0, function(e) {
        return Object.entries(e).reduce((e, t) => {
            let [a, n] = t;
            return Array.isArray(n) ? e[a] = n.at(0) : e[a] = n, e
        }, {})
    }, "readQueryValue", 0, function(e) {
        if (null != e) return Array.isArray(e) ? e.at(0) : e
    }])
}, 114209, 559227, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        n = e.i(237401),
        r = e.i(773057),
        i = e.i(392782);
    let o = (0, a.createContext)({
        isLoadingGame: !1,
        isErrorLoadingGame: !1,
        canConfigure: !1,
        gameDetails: null,
        refreshGameDetails: () => {
            throw Error("Not implemented")
        }
    });
    o.displayName = "Game", e.s(["default", 0, o], 559227);
    var s = e.i(721281),
        l = e.i(252842),
        u = e.i(533968);
    let d = new class {
        async getGameDetail(e, t) {
            var a, n, r;
            if (!t && this.gameDetailsMap.has(e)) return null != (a = this.gameDetailsMap.get(e)) ? a : null;
            try {
                let t = null != (n = null == (r = (await this.gamesClient.getDetails([e])).data) ? void 0 : r[0]) ? n : null;
                return t && this.gameDetailsMap.set(e, t), t
            } catch (a) {
                let t = (0, u.getResponseFromError)(a);
                if ((null == t ? void 0 : t.status) === l.StatusCodes.BAD_REQUEST) return null;
                throw console.log("Could not fetch game details for universeId ".concat(e)), a
            }
        }
        async getConfiguration(e, t) {
            if (!t && this.gameConfigurationMap.has(e)) {
                var a;
                return null != (a = this.gameConfigurationMap.get(e)) ? a : null
            }
            try {
                return await this.developClient.getUniverseConfiguration(e), this.gameConfigurationMap.set(e, !0), !0
            } catch (a) {
                let t = (0, u.getResponseFromError)(a);
                if ((null == t ? void 0 : t.status) === l.StatusCodes.FORBIDDEN) return this.gameConfigurationMap.set(e, !1), !1;
                return console.warn("Could not fetch game details for universeId ".concat(e)), null
            }
        }
        constructor(e, t) {
            (0, s._)(this, "gamesClient", void 0), (0, s._)(this, "developClient", void 0), (0, s._)(this, "gameDetailsMap", void 0), (0, s._)(this, "gameConfigurationMap", void 0), this.gamesClient = e, this.developClient = t, this.gameDetailsMap = new Map, this.gameConfigurationMap = new Map
        }
    }(i.default, r.default);
    e.s(["default", 0, e => {
        let {
            requestedGameId: r,
            children: i
        } = e, s = (0, n.useRouter)(), [l, u] = (0, a.useState)(!0), [c, p] = (0, a.useState)(null), [v, g] = (0, a.useState)(null), [m, f] = (0, a.useState)(!1), h = (0, a.useRef)(0), y = (0, a.useCallback)(async function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                a = h.current += 1,
                n = d.getConfiguration(e),
                r = d.getGameDetail(e, t),
                [i, o] = await Promise.allSettled([n, r]);
            a === h.current && ("fulfilled" === i.status ? p(i.value) : p(null), "fulfilled" === o.status ? (f(!1), g(o.value)) : ("rejected" === o.status ? f(!0) : f(!1), g(null)), u(!1))
        }, []), b = (0, a.useMemo)(() => {
            let {
                id: e
            } = s.query;
            return r || ("string" == typeof e ? parseInt(e, 10) : void 0)
        }, [r, s.query]), C = (0, a.useCallback)(() => b ? y(b, !0) : Promise.reject(Error("Cannot refresh game details without a game ID")), [b, y]);
        (0, a.useEffect)(() => {
            try {
                if (void 0 !== b && !Number.isNaN(b) && b > 0) return void y(b);
                h.current += 1, p(null), g(null), f(!1), u(!1)
            } catch (e) {
                console.warn("Could not fetch game details for universeId ".concat(b))
            }
        }, [b, y]);
        let I = (0, a.useMemo)(() => ({
            isLoadingGame: l,
            canConfigure: c,
            gameDetails: v,
            isErrorLoadingGame: m,
            refreshGameDetails: C
        }), [l, c, v, m, C]);
        return (0, t.jsx)(o.Provider, {
            value: I,
            children: i
        })
    }, "useCurrentGame", 0, function() {
        let e = (0, a.useContext)(o);
        if (null === e) throw Error("useCurrentGame must be used within a GameProvider");
        return e
    }], 114209)
}, 745873, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        n = e.i(458451),
        r = e.i(533414),
        i = e.i(157310),
        o = e.i(279149),
        s = e.i(602635),
        l = e.i(814975);
    let u = (0, e.i(272593).createClientConfiguration)("creator-home-api", "bedev2"),
        d = new o.GroupsApi(u),
        c = function() {
            let {
                user: e
            } = (0, l.useAuthentication)();
            return (0, i.useQuery)({
                queryKey: s.getGroupsQueryKey,
                enabled: !!e,
                queryFn: () => {
                    let e;
                    return e = {
                        surface: o.GroupListSurface.CreatorHub
                    }, d.groupsListGroups(e)
                }
            })
        },
        p = (0, a.createContext)(null);
    e.s(["GroupsProvider", 0, e => {
        let {
            children: i
        } = e, {
            user: o
        } = (0, n.useRobloxAuthentication)(), {
            data: s,
            isLoading: l,
            refetch: u
        } = c(), [d, v] = (0, r.useLocalStorage)("creatorHubGroups.".concat(null == o ? void 0 : o.id), null), [g, m] = (0, r.useLocalStorage)("creatorHubGroup.".concat(null == o ? void 0 : o.id), null), [f, h] = (0, r.useLocalStorage)("creatorHubGroupData.".concat(null == o ? void 0 : o.id), {}), y = (0, a.useCallback)(e => {
            m(e);
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
        }, [m, h]), b = (0, a.useMemo)(() => {
            if (null == s ? void 0 : s.groups) return null == s ? void 0 : s.groups;
            if (null === d) return [];
            try {
                return "string" == typeof d ? JSON.parse(d) : d
            } catch (e) {
                return []
            }
        }, [d, null == s ? void 0 : s.groups]), C = (0, a.useMemo)(() => {
            var e;
            return g && null != (e = b.find(e => {
                let {
                    id: t
                } = e;
                return t === g
            })) ? e : null
        }, [g, b]);
        (0, a.useEffect)(() => {
            (null == o ? void 0 : o.id) && (null == s ? void 0 : s.groups) && !l && v(null == s ? void 0 : s.groups)
        }, [null == s ? void 0 : s.groups, b, l, v, null == o ? void 0 : o.id]);
        let I = (0, a.useMemo)(() => ({
            groups: b,
            currentGroup: C,
            groupData: f,
            isFetched: !l && !!(null == o ? void 0 : o.id),
            refreshGroups: u,
            setCurrentGroup: y
        }), [C, f, b, l, u, y, null == o ? void 0 : o.id]);
        return (0, t.jsx)(p.Provider, {
            value: I,
            children: i
        })
    }, "useCurrentGroup", 0, () => {
        let e = (0, a.useContext)(p);
        if (null === e) throw Error("useCurrentGroup must be used within a GroupsProvider");
        return e.currentGroup
    }, "useGroups", 0, () => {
        let e = (0, a.useContext)(p);
        if (null === e) throw Error("useGroups must be used within a GroupsProvider");
        return e
    }], 745873)
}, 808377, e => {
    "use strict";
    var t = e.i(620140);
    e.s(["ThumbnailResponseState", () => t.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum])
}, 222563, e => {
    "use strict";
    var t = e.i(443967);
    e.i(511952);
    var a = e.i(422711),
        n = e.i(197649),
        r = e.i(416340),
        i = e.i(840934);
    e.i(149285);
    var o = e.i(221628),
        s = e.i(46079),
        l = e.i(610160),
        u = e.i(183906);
    (0, a.s)(".data-\\[state\\=unchecked\\]\\:stroke-contrast-alpha[data-state=unchecked]{border-color:var(--color-stroke-contrast-alpha)}");
    var d = r.forwardRef((e, t) => {
        let {
            children: a,
            ...n
        } = e, i = r.Children.toArray(a), s = i.find(v);
        if (s) {
            let e = s.props.children,
                a = i.map(t => t === s ? r.Children.count(e) > 1 ? r.Children.only(null) : r.isValidElement(e) ? e.props.children : null : t);
            return (0, o.jsx)(c, {
                ...n,
                ref: t,
                children: r.isValidElement(e) ? r.cloneElement(e, void 0, a) : null
            })
        }
        return (0, o.jsx)(c, {
            ...n,
            ref: t,
            children: a
        })
    });
    d.displayName = "Slot";
    var c = r.forwardRef((e, t) => {
        let {
            children: a,
            ...n
        } = e;
        if (r.isValidElement(a)) {
            var o, s;
            let e, l = (e = null == (o = Object.getOwnPropertyDescriptor(a.props, "ref")) ? void 0 : o.get) && "isReactWarning" in e && e.isReactWarning ? a.ref : (e = null == (s = Object.getOwnPropertyDescriptor(a, "ref")) ? void 0 : s.get) && "isReactWarning" in e && e.isReactWarning ? a.props.ref : a.props.ref || a.ref,
                u = function(e, t) {
                    let a = {
                        ...t
                    };
                    for (let n in t) {
                        let r = e[n],
                            i = t[n];
                        /^on[A-Z]/.test(n) ? r && i ? a[n] = function() {
                            for (var e = arguments.length, t = Array(e), a = 0; a < e; a++) t[a] = arguments[a];
                            i(...t), r(...t)
                        } : r && (a[n] = r) : "style" === n ? a[n] = {
                            ...r,
                            ...i
                        } : "className" === n && (a[n] = [r, i].filter(Boolean).join(" "))
                    }
                    return {
                        ...e,
                        ...a
                    }
                }(n, a.props);
            return a.type !== r.Fragment && (u.ref = t ? (0, i.c)(t, l) : l), r.cloneElement(a, u)
        }
        return r.Children.count(a) > 1 ? r.Children.only(null) : null
    });
    c.displayName = "SlotClone";
    var p = e => {
        let {
            children: t
        } = e;
        return (0, o.jsx)(o.Fragment, {
            children: t
        })
    };

    function v(e) {
        return r.isValidElement(e) && e.type === p
    }
    var g = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((e, t) => {
            let a = r.forwardRef((e, a) => {
                let {
                    asChild: n,
                    ...r
                } = e, i = n ? d : t;
                return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, o.jsx)(i, {
                    ...r,
                    ref: a
                })
            });
            return a.displayName = "Primitive.".concat(t), {
                ...e,
                [t]: a
            }
        }, {}),
        m = "Checkbox",
        [f, h] = (0, i.a)(m),
        [y, b] = f(m),
        C = r.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                name: n,
                checked: s,
                defaultChecked: l,
                required: u,
                disabled: d,
                value: c = "on",
                onCheckedChange: p,
                form: v,
                ...m
            } = e, [f, h] = r.useState(null), b = (0, i.u)(t, e => h(e)), C = r.useRef(!1), I = !f || v || !!f.closest("form"), [R = !1, w] = (0, i.b)({
                prop: s,
                defaultProp: l,
                onChange: p
            }), E = r.useRef(R);
            return r.useEffect(() => {
                let e = null == f ? void 0 : f.form;
                if (e) {
                    let t = () => w(E.current);
                    return e.addEventListener("reset", t), () => e.removeEventListener("reset", t)
                }
            }, [f, w]), (0, o.jsxs)(y, {
                scope: a,
                state: R,
                disabled: d,
                children: [(0, o.jsx)(g.button, {
                    type: "button",
                    role: "checkbox",
                    "aria-checked": x(R) ? "mixed" : R,
                    "aria-required": u,
                    "data-state": k(R),
                    "data-disabled": d ? "" : void 0,
                    disabled: d,
                    value: c,
                    ...m,
                    ref: b,
                    onKeyDown: (0, i.d)(e.onKeyDown, e => {
                        "Enter" === e.key && e.preventDefault()
                    }),
                    onClick: (0, i.d)(e.onClick, e => {
                        w(e => !!x(e) || !e), I && (C.current = e.isPropagationStopped(), C.current || e.stopPropagation())
                    })
                }), I && (0, o.jsx)(O, {
                    control: f,
                    bubbles: !C.current,
                    name: n,
                    value: c,
                    checked: R,
                    required: u,
                    disabled: d,
                    form: v,
                    style: {
                        transform: "translateX(-100%)"
                    },
                    defaultChecked: !x(l) && l
                })]
            })
        });
    C.displayName = m;
    var I = "CheckboxIndicator",
        R = r.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                forceMount: n,
                ...r
            } = e, s = b(I, a);
            return (0, o.jsx)(i.P, {
                present: n || x(s.state) || !0 === s.state,
                children: (0, o.jsx)(g.span, {
                    "data-state": k(s.state),
                    "data-disabled": s.disabled ? "" : void 0,
                    ...r,
                    ref: t,
                    style: {
                        pointerEvents: "none",
                        ...e.style
                    }
                })
            })
        });
    R.displayName = I;
    var O = e => {
        let t, {
                control: a,
                checked: n,
                bubbles: s = !0,
                defaultChecked: l,
                ...u
            } = e,
            d = r.useRef(null),
            c = (t = r.useRef({
                value: n,
                previous: n
            }), r.useMemo(() => (t.current.value !== n && (t.current.previous = t.current.value, t.current.value = n), t.current.previous), [n])),
            p = (0, i.e)(a);
        r.useEffect(() => {
            let e = d.current,
                t = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set;
            if (c !== n && t) {
                let a = new Event("click", {
                    bubbles: s
                });
                e.indeterminate = x(n), t.call(e, !x(n) && n), e.dispatchEvent(a)
            }
        }, [c, n, s]);
        let v = r.useRef(!x(n) && n);
        return (0, o.jsx)("input", {
            type: "checkbox",
            "aria-hidden": !0,
            defaultChecked: null != l ? l : v.current,
            ...u,
            tabIndex: -1,
            ref: d,
            style: {
                ...e.style,
                ...p,
                position: "absolute",
                pointerEvents: "none",
                opacity: 0,
                margin: 0
            }
        })
    };

    function x(e) {
        return "indeterminate" === e
    }

    function k(e) {
        return x(e) ? "indeterminate" : e ? "checked" : "unchecked"
    }
    let w = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-600"
        },
        E = {
            XSmall: "",
            Small: "",
            Medium: "",
            Large: "padding-y-xxsmall"
        },
        z = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        S = {
            XSmall: "",
            Small: "padding-top-xxsmall",
            Medium: "padding-top-xxsmall",
            Large: "padding-top-xxsmall"
        };
    e.s(["Checkbox", 0, e => {
        var {
            label: a,
            className: i,
            isChecked: o,
            isDisabled: d,
            size: c,
            hint: p,
            placement: v,
            onCheckedChange: g,
            id: m
        } = e, f = (0, t._)(e, ["label", "className", "isChecked", "isDisabled", "size", "hint", "placement", "onCheckedChange", "id"]);
        let h = (0, l.default)(),
            y = m || h,
            b = a && r.default.createElement("label", {
                htmlFor: y,
                className: (0, n.default)("flex flex-col grow-1 gap-xsmall", !d && "cursor-pointer")
            }, r.default.createElement("span", {
                className: (0, n.default)(z[c], S[c], "content-emphasis")
            }, a), p && r.default.createElement("span", {
                className: "text-body-medium content-default"
            }, p));
        return r.default.createElement("div", {
            className: (0, n.default)("foundation-web-checkbox flex gap-medium", d && u.disabledOpacity, !d && "cursor-pointer", i)
        }, "End" === v && b, r.default.createElement("div", {
            className: (0, n.default)(E[c])
        }, r.default.createElement(C, Object.assign({
            "data-slot": "checkbox",
            className: (0, n.default)(w[c], s.interactable, !d && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
            id: y,
            checked: o,
            disabled: d,
            onCheckedChange: g,
            "aria-label": a
        }, f), r.default.createElement(s.StateLayer, null), r.default.createElement(R, {
            "data-slot": "checkbox-indicator",
            className: (0, n.default)(w[c], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
        }))), "Start" === v && b)
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
        var i, o, s, l, u = e.children,
            d = (0, t.a)(e, ["children"]),
            c = (0, a.useRef)(null),
            p = (0, a.useState)(!1),
            v = p[0],
            g = p[1],
            m = (0, a.useState)([]),
            f = m[0],
            h = m[1],
            y = (0, a.useCallback)(function(e, a) {
                void 0 === e && (e = {}), void 0 === a && (a = function() {
                    return !0
                }), h(function(n) {
                    return (0, t.b)((0, t.b)([], n, !0), [{
                        props: e,
                        shouldClose: a
                    }], !1)
                })
            }, [h]),
            b = (0, a.useCallback)(function() {
                g(!1)
            }, [g]);
        (0, a.useEffect)(function() {
            f.length > 0 && g(!0)
        }, [f.length]);
        var C = (0, a.useMemo)(function() {
            return {
                ref: c,
                enqueue: y,
                close: b
            }
        }, [b, y]);
        return a.default.createElement(a.default.Fragment, null, a.default.createElement(r.Provider, {
            value: C
        }, u), a.default.createElement(n.S, (0, t._)({}, (null == (i = f[0]) ? void 0 : i.props) || {}, d, {
            TransitionProps: (0, t._)((0, t._)({}, (null == (s = null == (o = f[0]) ? void 0 : o.props) ? void 0 : s.TransitionProps) || {}), {
                onExited: function(e) {
                    var a, n, r, i;
                    h(function(e) {
                        var a = e.slice(1);
                        return (0, t.b)([], a, !0)
                    }), (null == (n = null == (a = f[0]) ? void 0 : a.props.TransitionProps) ? void 0 : n.onExited) && (null == (i = null == (r = f[0]) ? void 0 : r.props.TransitionProps) || i.onExited(e))
                }
            }),
            onClose: function(e, t) {
                var a, n, r;
                (null == (a = f[0]) ? void 0 : a.shouldClose(t)) && g(!1), (null == (n = f[0]) ? void 0 : n.props.onClose) && (null == (r = f[0]) || r.props.onClose(e, t))
            },
            open: v
        }), null == (l = f[0]) ? void 0 : l.props.children))
    }, "useSnackbar", 0, function() {
        var e = (0, a.useContext)(r);
        return {
            ref: e.ref,
            enqueue: e.enqueue,
            close: e.close
        }
    }])
}, 449934, e => {
    "use strict";
    var t = e.i(833172);
    e.s(["BrokenImageOutlinedIcon", () => t.BrokenImageOutlined])
}, 591403, e => {
    "use strict";
    var t = e.i(833172);
    e.s(["HourglassEmptyIcon", () => t.HourglassEmpty])
}, 823062, e => {
    "use strict";
    var t = e.i(416340);
    let a = (0, t.createContext)(null),
        n = [],
        r = ["pageload", "click", "impression", "hover", "webvitals", "apivitals", "formvitals", "error", "session"],
        i = new Set(["TTFB", "FCP", "LCP", "FID", "CLS", "INP"]);
    e.s(["UnifiedLoggerProvider", 0, e => {
        var o;
        let {
            children: s,
            unifiedLogger: l,
            pageLoggerConfig: u,
            path: d
        } = e, c = null != (o = null == u ? void 0 : u.tags) ? o : n, p = null == u ? void 0 : u.rosId, v = (0, t.useMemo)(() => ({
            tags: c,
            rosId: p,
            path: d
        }), [c, p, d]), g = (0, t.useRef)(v), m = (0, t.useRef)(v);
        (0, t.useLayoutEffect)(() => {
            m.current = v, void 0 === g.current.path && void 0 !== v.path && (g.current = {
                ...g.current,
                path: v.path
            })
        }, [v]), (0, t.useLayoutEffect)(() => {
            let e = e => {
                var t;
                let a, n = (a = null == (t = e.parameters) ? void 0 : t.metricName, "webvitals" === e.eventType && void 0 !== a && i.has(a)) ? g.current : m.current;
                void 0 !== n.path && (e.parameters = {
                    ...e.parameters,
                    path: n.path
                }), n.tags.forEach(t => e.addTag(t)), void 0 !== n.rosId && e.addTag("owner: ".concat(n.rosId))
            };
            return r.forEach(t => {
                l.events.on(t, e)
            }), () => {
                r.forEach(t => {
                    l.events.off(t, e)
                })
            }
        }, [l]);
        let f = (0, t.useMemo)(() => ({
            unifiedLogger: l,
            pageContext: v
        }), [l, v]);
        return t.default.createElement(a.Provider, {
            value: f
        }, s)
    }, "useUnifiedLoggerProvider", 0, function() {
        let e = (0, t.useContext)(a);
        if (null === e) throw Error("useUnifiedLoggerProvider must be used within a UnifiedLoggerProvider");
        return e
    }])
}]);

//# debugId=140d0dd9-a719-a55e-72e4-63d97505bdc6
//# sourceMappingURL=3_a47a0z5cmsi.js.map