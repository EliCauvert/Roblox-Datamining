;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "be3f563e-dab8-13d9-9392-e7c80a6f2a83")
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
        o = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerHostedEvents",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportCreatorTicketReroute",
            defaultValue: !1
        }),
        i = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enableAudienceReachV2",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportArchive",
            defaultValue: !1
        });
    e.s(["enableAudienceReachV2", 0, i, "enablePlayerHostedEvents", 0, o, "enablePlayerSupport", 0, a, "enablePlayerSupportArchive", 0, r, "enablePlayerSupportCreatorTicketReroute", 0, n])
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
        o = e.i(272593);
    let n = new class {
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
            (0, t._)(this, "localeApi", void 0), this.localeApi = new a.LocaleApi((0, o.createClientConfiguration)("locale", "bedev1"))
        }
    };
    e.s(["default", 0, n])
}, 607204, e => {
    "use strict";
    var t = e.i(581548),
        a = e.i(272593),
        o = e.i(127403);
    let n = (0, a.createClientConfiguration)("orgs", "bedev2", {
            middleware: [new o.default]
        }),
        i = new t.OrganizationApi(n),
        r = new t.InvitationApi(n),
        s = new t.RoleApi(n),
        l = new t.UserApi(n),
        c = new t.GroupUniversePayoutApi(n);
    e.s(["default", 0, {
        organizationClient: {
            getOrganization: async e => i.v1OrganizationsGet({
                groupId: e
            })
        },
        invitationClient: {
            createInvitation: async (e, t) => r.v1OrganizationsOrganizationIdInvitationsPost({
                organizationId: e,
                createInvitationRequestModel: t
            }),
            getInvitationsByOrganizationId: async (e, t, a) => r.v1OrganizationsOrganizationIdInvitationsGet({
                organizationId: e,
                pageToken: t,
                maxPageSize: a
            }),
            getInvitation: async (e, t) => r.v1OrganizationsOrganizationIdInvitationsInvitationIdGet({
                organizationId: e,
                invitationId: t
            }),
            acceptOrDeclineInvitation: async (e, t, a) => r.v1OrganizationsOrganizationIdInvitationsInvitationIdPatch({
                organizationId: e,
                invitationId: t,
                updateInvitationRequestModel: a
            }),
            deleteInvitationById: async (e, t) => r.v1OrganizationsOrganizationIdInvitationsInvitationIdDelete({
                organizationId: e,
                invitationId: t
            }),
            getRoleIdsByInvitationId: async (e, t) => r.v1OrganizationsOrganizationIdInvitationsInvitationIdRoleIdsGet({
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
            getUsersWithRole: async (e, t, a, o, n) => s.v1OrganizationsOrganizationIdRolesRoleIdUsersGet({
                organizationId: e,
                roleId: t,
                pageToken: a,
                maxPageSize: o,
                isDefault: n
            }),
            deleteRole: async (e, t) => s.v1OrganizationsOrganizationIdRolesRoleIdDelete({
                organizationId: e,
                roleId: t
            }),
            getInvitationsWithRole: async (e, t, a, o) => s.v1OrganizationsOrganizationIdRolesRoleIdInvitationsGet({
                organizationId: e,
                roleId: t,
                pageToken: a,
                maxPageSize: o
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
            getUserRoles: async (e, t, a, o) => l.v1OrganizationsOrganizationIdUsersUserIdRolesGet({
                organizationId: e,
                userId: t,
                pageToken: a,
                maxPageSize: o
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
            getUniversePayouts: async e => c.v1OrganizationsOrganizationIdPayoutsUniverseIdGet(e),
            updateUniversePayouts: async e => c.v1OrganizationsOrganizationIdPayoutsUniverseIdPatch(e),
            findUniversePayouts: async e => c.v1OrganizationsOrganizationIdPayoutsUniversesGet(e),
            getLatestOneTimePayoutForUsers: async (e, t) => {
                let a = {
                    organizationId: e,
                    userIds: t.map(String)
                };
                return c.v1OrganizationsOrganizationIdPayoutsLatestGet(a)
            },
            getSuggestedPayouts: async e => c.v1OrganizationsOrganizationIdPayoutsSuggestedGet({
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
                init: o,
                response: n
            } = e, i = new URL(a);
            return "POST" !== o.method && "PATCH" !== o.method || "true" === i.searchParams.get("isSecure") || 403 !== n.status ? Promise.resolve(n) : (i.searchParams.set("isSecure", "true"), t(i.toString(), o))
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
}, 514455, e => {
    "use strict";
    var t = e.i(865800),
        a = e.i(416340),
        o = e.i(614515),
        n = e.i(993807),
        i = e.i(962560),
        r = e.i(273589),
        s = e.i(42569),
        l = e.i(696180),
        c = e.i(221628),
        d = e.i(972455),
        u = e.i(963320);

    function g(e) {
        return (0, r.g)("MuiAlertTitle", e)
    }(0, l.g)("MuiAlertTitle", ["root"]);
    let p = ["className"],
        v = (0, s.s)(d.T, {
            name: "MuiAlertTitle",
            slot: "Root",
            overridesResolver: (e, t) => t.root
        })(e => {
            let {
                theme: t
            } = e;
            return {
                fontWeight: t.typography.fontWeightMedium,
                marginTop: -2
            }
        }),
        f = a.forwardRef(function(e, t) {
            let a = (0, u.u)({
                    props: e,
                    name: "MuiAlertTitle"
                }),
                {
                    className: o
                } = a,
                n = (0, r._)(a, p),
                l = (e => {
                    let {
                        classes: t
                    } = e;
                    return (0, s.a)({
                        root: ["root"]
                    }, g, t)
                })(a);
            return (0, c.jsx)(v, (0, i._)({
                gutterBottom: !0,
                component: "div",
                ownerState: a,
                ref: t,
                className: (0, s.c)(l.root, o)
            }, n))
        });
    var m = (0, o.default)({
            name: "AlertTitle"
        })(function(e) {
            return {
                root: (0, t._)((0, t._)({}, e.typography.alertTitle), {
                    margin: "-1px 0"
                })
            }
        }),
        y = (0, a.forwardRef)(function(e, o) {
            var i = e.classes,
                r = e.className,
                s = (0, t.a)(e, ["classes", "className"]),
                l = m(void 0, {
                    props: {
                        classes: (0, n.default)(i, r)
                    }
                });
            return a.default.createElement(f, (0, t._)({}, s, {
                classes: l.classes,
                ref: o
            }))
        });
    e.s(["AlertTitle", 0, y], 514455)
}, 854705, e => {
    "use strict";
    var t = e.i(865800),
        a = e.i(416340),
        o = e.i(614515),
        n = e.i(993807),
        i = e.i(696180),
        r = e.i(273589),
        s = e.i(962560),
        l = e.i(42569),
        c = e.i(576881),
        d = e.i(751498),
        u = e.i(221628),
        g = e.i(219224),
        p = e.i(963320),
        v = e.i(275966);
    e.i(197094);
    var f = (0, d.c)((0, u.jsx)("path", {
            d: "M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8z"
        }), "RadioButtonUnchecked"),
        m = (0, d.c)((0, u.jsx)("path", {
            d: "M8.465 8.465C9.37 7.56 10.62 7 12 7C14.76 7 17 9.24 17 12C17 13.38 16.44 14.63 15.535 15.535C14.63 16.44 13.38 17 12 17C9.24 17 7 14.76 7 12C7 10.62 7.56 9.37 8.465 8.465Z"
        }), "RadioButtonChecked");
    let y = (0, l.s)("span", {
            name: "MuiRadioButtonIcon",
            shouldForwardProp: l.r
        })({
            position: "relative",
            display: "flex"
        }),
        z = (0, l.s)(f, {
            name: "MuiRadioButtonIcon"
        })({
            transform: "scale(1)"
        }),
        h = (0, l.s)(m, {
            name: "MuiRadioButtonIcon"
        })(e => {
            let {
                theme: t,
                ownerState: a
            } = e;
            return (0, s._)({
                left: 0,
                position: "absolute",
                transform: "scale(0)",
                transition: t.transitions.create("transform", {
                    easing: t.transitions.easing.easeIn,
                    duration: t.transitions.duration.shortest
                })
            }, a.checked && {
                transform: "scale(1)",
                transition: t.transitions.create("transform", {
                    easing: t.transitions.easing.easeOut,
                    duration: t.transitions.duration.shortest
                })
            })
        });

    function I(e) {
        let {
            checked: t = !1,
            classes: a = {},
            fontSize: o
        } = e, n = (0, s._)({}, e, {
            checked: t
        });
        return (0, u.jsxs)(y, {
            className: a.root,
            ownerState: n,
            children: [(0, u.jsx)(z, {
                fontSize: o,
                className: a.background,
                ownerState: n
            }), (0, u.jsx)(h, {
                fontSize: o,
                className: a.dot,
                ownerState: n
            })]
        })
    }

    function O(e) {
        return (0, r.g)("MuiRadio", e)
    }
    var R = (0, i.g)("MuiRadio", ["root", "checked", "disabled", "colorPrimary", "colorSecondary", "sizeSmall"]);
    let b = ["checked", "checkedIcon", "color", "icon", "name", "onChange", "size", "className"],
        P = (0, l.s)(c.S, {
            shouldForwardProp: e => (0, l.r)(e) || "classes" === e,
            name: "MuiRadio",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: a
                } = e;
                return [t.root, "medium" !== a.size && t["size".concat((0, r.a)(a.size))], t["color".concat((0, r.a)(a.color))]]
            }
        })(e => {
            let {
                theme: t,
                ownerState: a
            } = e;
            return (0, s._)({
                color: (t.vars || t).palette.text.secondary
            }, !a.disableRipple && {
                "&:hover": {
                    backgroundColor: t.vars ? "rgba(".concat("default" === a.color ? t.vars.palette.action.activeChannel : t.vars.palette[a.color].mainChannel, " / ").concat(t.vars.palette.action.hoverOpacity, ")") : (0, r.b)("default" === a.color ? t.palette.action.active : t.palette[a.color].main, t.palette.action.hoverOpacity),
                    "@media (hover: none)": {
                        backgroundColor: "transparent"
                    }
                }
            }, "default" !== a.color && {
                ["&.".concat(R.checked)]: {
                    color: (t.vars || t).palette[a.color].main
                }
            }, {
                ["&.".concat(R.disabled)]: {
                    color: (t.vars || t).palette.action.disabled
                }
            })
        }),
        S = (0, u.jsx)(I, {
            checked: !0
        }),
        U = (0, u.jsx)(I, {}),
        w = a.forwardRef(function(e, t) {
            var o, n, i, c;
            let d = (0, p.u)({
                    props: e,
                    name: "MuiRadio"
                }),
                {
                    checked: f,
                    checkedIcon: m = S,
                    color: y = "primary",
                    icon: z = U,
                    name: h,
                    onChange: I,
                    size: R = "medium",
                    className: w
                } = d,
                C = (0, r._)(d, b),
                L = (0, s._)({}, d, {
                    color: y,
                    size: R
                }),
                M = (e => {
                    let {
                        classes: t,
                        color: a,
                        size: o
                    } = e, n = {
                        root: ["root", "color".concat((0, r.a)(a)), "medium" !== o && "size".concat((0, r.a)(o))]
                    };
                    return (0, s._)({}, t, (0, l.a)(n, O, t))
                })(L),
                T = a.useContext(g.R),
                x = f,
                A = (0, v.c)(I, T && T.onChange),
                F = h;
            return T && (void 0 === x && (i = T.value, x = "object" == typeof(c = d.value) && null !== c ? i === c : String(i) === String(c)), void 0 === F && (F = T.name)), (0, u.jsx)(P, (0, s._)({
                type: "radio",
                icon: a.cloneElement(z, {
                    fontSize: null != (o = U.props.fontSize) ? o : R
                }),
                checkedIcon: a.cloneElement(m, {
                    fontSize: null != (n = S.props.fontSize) ? n : R
                }),
                ownerState: L,
                classes: M,
                name: F,
                checked: x,
                onChange: A,
                ref: t,
                className: (0, l.c)(M.root, w)
            }, C))
        });
    var C = (0, o.default)({
            name: "Radio"
        })(function(e) {
            var t, a;
            return {
                root: {
                    color: e.palette.states.active
                },
                colorPrimary: ((t = {
                    color: e.palette.content.muted
                })["&.".concat(R.checked)] = {
                    color: e.palette.actionV2.primaryBrand.fill
                }, t),
                colorSecondary: {
                    color: e.palette.actionV2.primary.fill
                },
                disabled: ((a = {
                    color: e.palette.states.disabled
                })["&.".concat(R.colorPrimary, ".").concat(R.checked)] = {
                    color: e.palette.states.disabled
                }, a)
            }
        }),
        L = (0, a.forwardRef)(function(e, o) {
            var i = e.classes,
                r = e.color,
                s = e.inputProps,
                l = e["aria-label"],
                c = e.className,
                d = (0, t.a)(e, ["classes", "color", "inputProps", "aria-label", "className"]),
                u = C(void 0, {
                    props: {
                        classes: (0, n.default)(i, c)
                    }
                });
            return a.default.createElement(w, (0, t._)({}, d, {
                classes: u.classes,
                color: void 0 === r ? "primary" : r,
                ref: o,
                inputProps: (0, t._)({
                    "aria-label": l
                }, s)
            }))
        });
    e.s(["Radio", 0, L], 854705)
}, 219224, e => {
    "use strict";
    let t = e.i(416340).createContext(void 0);
    e.s(["R", 0, t])
}, 169923, e => {
    "use strict";
    e.s(["v", 0, {
        border: 0,
        clip: "rect(0 0 0 0)",
        height: "1px",
        margin: "-1px",
        overflow: "hidden",
        padding: 0,
        position: "absolute",
        whiteSpace: "nowrap",
        width: "1px"
    }])
}, 223808, (e, t, a) => {
    var o = 0 / 0,
        n = /^\s+|\s+$/g,
        i = /^[-+]0x[0-9a-f]+$/i,
        r = /^0b[01]+$/i,
        s = /^0o[0-7]+$/i,
        l = parseInt,
        c = e.g && e.g.Object === Object && e.g,
        d = "object" == typeof self && self && self.Object === Object && self,
        u = c || d || Function("return this")(),
        g = Object.prototype.toString,
        p = Math.max,
        v = Math.min,
        f = function() {
            return u.Date.now()
        };

    function m(e) {
        var t = typeof e;
        return !!e && ("object" == t || "function" == t)
    }

    function y(e) {
        if ("number" == typeof e) return e;
        if ("symbol" == typeof(t = e) || t && "object" == typeof t && "[object Symbol]" == g.call(t)) return o;
        if (m(e)) {
            var t, a = "function" == typeof e.valueOf ? e.valueOf() : e;
            e = m(a) ? a + "" : a
        }
        if ("string" != typeof e) return 0 === e ? e : +e;
        e = e.replace(n, "");
        var c = r.test(e);
        return c || s.test(e) ? l(e.slice(2), c ? 2 : 8) : i.test(e) ? o : +e
    }
    t.exports = function(e, t, a) {
        var o, n, i, r, s, l, c = 0,
            d = !1,
            u = !1,
            g = !0;
        if ("function" != typeof e) throw TypeError("Expected a function");

        function z(t) {
            var a = o,
                i = n;
            return o = n = void 0, c = t, r = e.apply(i, a)
        }

        function h(e) {
            var a = e - l,
                o = e - c;
            return void 0 === l || a >= t || a < 0 || u && o >= i
        }

        function I() {
            var e, a, o, n = f();
            if (h(n)) return O(n);
            s = setTimeout(I, (e = n - l, a = n - c, o = t - e, u ? v(o, i - a) : o))
        }

        function O(e) {
            return (s = void 0, g && o) ? z(e) : (o = n = void 0, r)
        }

        function R() {
            var e, a = f(),
                i = h(a);
            if (o = arguments, n = this, l = a, i) {
                if (void 0 === s) return c = e = l, s = setTimeout(I, t), d ? z(e) : r;
                if (u) return s = setTimeout(I, t), z(l)
            }
            return void 0 === s && (s = setTimeout(I, t)), r
        }
        return t = y(t) || 0, m(a) && (d = !!a.leading, i = (u = "maxWait" in a) ? p(y(a.maxWait) || 0, t) : i, g = "trailing" in a ? !!a.trailing : g), R.cancel = function() {
            void 0 !== s && clearTimeout(s), c = 0, o = l = n = s = void 0
        }, R.flush = function() {
            return void 0 === s ? r : O(f())
        }, R
    }
}, 167878, e => {
    "use strict";
    var t = e.i(416340);
    e.i(223808);
    var a = "u" > typeof window ? t.useLayoutEffect : t.useEffect,
        o = "u" < typeof window;
    e.s(["useMediaQuery", 0, function(e) {
        let {
            defaultValue: n = !1,
            initializeWithValue: i = !0
        } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, r = e => o ? n : window.matchMedia(e).matches, [s, l] = (0, t.useState)(() => i ? r(e) : n);

        function c() {
            l(r(e))
        }
        return a(() => {
            let t = window.matchMedia(e);
            return c(), t.addListener ? t.addListener(c) : t.addEventListener("change", c), () => {
                t.removeListener ? t.removeListener(c) : t.removeEventListener("change", c)
            }
        }, [e]), s
    }])
}]);

//# debugId=be3f563e-dab8-13d9-9392-e7c80a6f2a83
//# sourceMappingURL=0k-zl0wjsaxtg.js.map