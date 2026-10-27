;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "8dc475ed-bae0-8ee2-86f7-111aad6e9dca")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 239328, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "enableTaxonomyBasedCreatorDashboard",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "enableCreatorShowcases",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "enableAvatarCreationTokenCategories",
            defaultValue: !1
        }),
        i = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "enableBulkMakeupTokenCreation",
            defaultValue: !1
        }),
        s = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "isAutoPublishPreferencesEnabled",
            defaultValue: !1
        }),
        l = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "showTaxonomyOnAvatarItemAnalyticsTab",
            defaultValue: !1
        }),
        o = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "enableCoreContentGatedBanner",
            defaultValue: !1
        });
    e.s(["enableAvatarCreationTokenCategories", 0, r, "enableBulkMakeupTokenCreation", 0, i, "enableCoreContentGatedBanner", 0, o, "enableCreatorShowcases", 0, n, "enableTaxonomyBasedCreatorDashboard", 0, a, "isAutoPublishPreferencesEnabled", 0, s, "showTaxonomyOnAvatarItemAnalyticsTab", 0, l])
}, 134731, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.defineFlag)({
            namespace: "content-access-and-inventory",
            name: "isAssetPrivacyOptOutSurveyEnabled",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
            namespace: "content-access-and-inventory",
            name: "isAssetAccessRequestsEnabled",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
            namespace: "content-access-and-inventory",
            name: "isModelCustomThumbnailUploadEnabled",
            defaultValue: !1
        }),
        i = (0, t.defineFlag)({
            namespace: "content-access-and-inventory",
            name: "isAssetDependenciesViewerEnabled",
            defaultValue: !1
        }),
        s = (0, t.defineFlag)({
            namespace: "content-access-and-inventory",
            name: "isCreatorStoreVideoMultipartUploadEnabled",
            defaultValue: !1
        }),
        l = (0, t.defineFlag)({
            namespace: "content-access-and-inventory",
            name: "isPricingEligibilityV2Enabled",
            defaultValue: !1
        }),
        o = (0, t.defineFlag)({
            namespace: "content-access-and-inventory",
            name: "isPublishBeforeExposeEnabled",
            defaultValue: !1
        });
    e.s(["isAssetAccessRequestsEnabled", 0, n, "isAssetDependenciesViewerEnabled", 0, i, "isAssetPrivacyOptOutSurveyEnabled", 0, a, "isCreatorStoreVideoMultipartUploadEnabled", 0, s, "isModelCustomThumbnailUploadEnabled", 0, r, "isPricingEligibilityV2Enabled", 0, l, "isPublishBeforeExposeEnabled", 0, o])
}, 9436, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isBadgeDefaultIconEnabled",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isMomentsUploadEnabled",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isMomentsSitetestUrlParsingEnabled",
            defaultValue: !1
        }),
        i = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isTextDocumentEnabled",
            defaultValue: !1
        }),
        s = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isMomentsUploadLanguageSelectEnabled",
            defaultValue: !1
        }),
        l = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isMomentsFeedIdEnabled",
            defaultValue: !1
        }),
        o = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isMomentsShareLinkEnabled",
            defaultValue: !1
        }),
        c = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isMomentsPostCreationEnabled",
            defaultValue: !1
        }),
        d = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isMomentsModeratedTabEnabled",
            defaultValue: !1
        });
    e.s(["isBadgeDefaultIconEnabled", 0, a, "isMomentsFeedIdEnabled", 0, l, "isMomentsModeratedTabEnabled", 0, d, "isMomentsPostCreationEnabled", 0, c, "isMomentsShareLinkEnabled", 0, o, "isMomentsSitetestUrlParsingEnabled", 0, r, "isMomentsUploadEnabled", 0, n, "isMomentsUploadLanguageSelectEnabled", 0, s, "isTextDocumentEnabled", 0, i])
}, 203450, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        n = e.i(540459),
        r = e.i(79187),
        i = e.i(814975),
        s = e.i(156071),
        l = e.i(881670),
        o = e.i(745873),
        c = e.i(338653);
    let d = (0, a.createContext)({
        isAffiliateProgramLoading: !1,
        requiresActionToJoinProgram: void 0,
        compliantWithAllUserRequirements: void 0,
        creatorMetadata: void 0,
        isCurrentUserGroupOwner: void 0,
        isGroupEligible: void 0
    });
    d.displayName = "AffiliateProgram";
    let u = (0, r.withTranslation)(e => {
        let {
            children: r
        } = e, {
            user: l
        } = (0, i.useAuthentication)(), u = (0, o.useCurrentGroup)(), [m, p] = (0, a.useState)(void 0), [h, v] = (0, a.useState)(), [y, f] = (0, a.useState)(), [g, b] = (0, a.useState)(), [A, T] = (0, a.useState)(), I = (0, a.useMemo)(() => {
            var e;
            return (null != (e = null == u ? void 0 : u.id) ? e : 0) !== 0
        }, [u]), [S, C] = (0, a.useState)(void 0), E = void 0 === m || void 0 === h || void 0 === y && I, x = (0, a.useCallback)(async () => {
            try {
                if (I && (null == u ? void 0 : u.id)) {
                    let e = await (0, c.getGroupCreatorMetadata)(u.id);
                    p(e);
                    return
                }
                if (!I && (null == l ? void 0 : l.id)) {
                    let e = await (0, c.getUserCreatorMetadata)();
                    p(e);
                    return
                }
            } catch (e) {
                return
            }
            p(null)
        }, [null == u ? void 0 : u.id, I, null == l ? void 0 : l.id]), w = (0, a.useCallback)(async () => {
            if (I && S || !I) try {
                let e = await (0, c.getRequirements)();
                v(e.requirements);
                return
            } catch (e) {
                return
            }
            v(null)
        }, [S, I]), D = (0, a.useCallback)(async () => {
            if (I && (null == u ? void 0 : u.id)) try {
                let e = await (0, c.getGroupEligibility)(u.id);
                f(e.isEligible)
            } catch (e) {
                f(!1)
            }
        }, [u, I]);
        (0, a.useEffect)(() => {
            E ? T(void 0) : I && !S ? T(!1) : T(!1 === g)
        }, [I, S, g, E]), (0, a.useEffect)(() => {
            (async () => {
                if (I && (null == u ? void 0 : u.id)) {
                    var e;
                    return null == (e = (await s.default.getGroupInfo(u.id)).owner) ? void 0 : e.userId
                }
            })().then(e => {
                e && l && C(e === l.id)
            })
        }, [null == u ? void 0 : u.id, I, l]), (0, a.useEffect)(() => {
            E || !h || I && !S ? b(void 0) : b((null == h ? void 0 : h.length) === 0 || (null == h ? void 0 : h.length) === 1 && h[0] === n.Requirements.Payable)
        }, [S, I, E, h]), (0, a.useEffect)(() => {
            x()
        }, [x]), (0, a.useEffect)(() => {
            w()
        }, [w]), (0, a.useEffect)(() => {
            D()
        }, [D]);
        let N = (0, a.useMemo)(() => ({
            isAffiliateProgramLoading: E,
            requiresActionToJoinProgram: A,
            compliantWithAllUserRequirements: g,
            creatorMetadata: null != m ? m : void 0,
            requirements: null != h ? h : void 0,
            isCurrentUserGroupOwner: S,
            isGroupEligible: null != y ? y : void 0
        }), [E, A, g, m, h, S, y]);
        return (0, t.jsx)(d.Provider, {
            value: N,
            children: r
        })
    }, [l.TranslationNamespace.Organization]);
    e.s(["default", 0, u, "useAffiliateProgram", 0, function() {
        return (0, a.useContext)(d)
    }])
}, 814984, e => {
    "use strict";
    let t = (0, e.i(650502).getBEDEV2ServiceBasePath)("access-management"),
        a = encodeURIComponent("studio/CollaborationSettings"),
        n = async function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0,
                a = await fetch(e, {
                    credentials: "include"
                }),
                r = a.status % 100 * 100;
            if (!a.ok && 500 === r && t < 2) return await new Promise(e => {
                setTimeout(e, 2 ** (t + 1) * 500)
            }), n(e, t + 1);
            if (500 === r && 2 === t) throw Error("Failed to get feature access after 3 attempts");
            let i = await a.json();
            if ("object" != typeof i || null === i || !("access" in i)) throw Error('"access" not found in response');
            return i.access
        }, r = async () => await n("".concat(t, "/v1/upsell-feature-access?nameSpace=").concat(a, "&featureName=").concat("ShouldShowCreatorHubBanner")) === "Granted";
    e.s(["getAgeVerificationUpsellFeatureAccess", 0, r])
}, 714039, 540082, e => {
    "use strict";
    var t, a = e.i(221628),
        n = e.i(416340),
        r = e.i(79187),
        i = e.i(925997),
        s = e.i(892869),
        l = e.i(253738),
        o = e.i(611043),
        c = e.i(848427),
        d = e.i(401631),
        u = e.i(930669),
        m = e.i(358763),
        p = e.i(889311),
        h = e.i(823062),
        v = e.i(881670),
        y = e.i(904969),
        f = e.i(906791);
    let g = (0, e.i(695763).makeStyles)()(e => ({
        alertContainer: {
            marginBottom: "16px",
            [e.breakpoints.down("Medium")]: {
                flexWrap: "wrap"
            },
            "& .MuiAlert-icon": {
                [e.breakpoints.down("Medium")]: {
                    flexBasis: "10%",
                    marginRight: 0
                }
            },
            "& .MuiAlert-message": {
                [e.breakpoints.down("Medium")]: {
                    flexBasis: "90%"
                }
            },
            "& .MuiAlert-action": {
                padding: "8px 0",
                columnGap: "0.5rem",
                paddingLeft: "0.5rem",
                flexShrink: 0,
                [e.breakpoints.down("Medium")]: {
                    flexBasis: "100%",
                    justifyContent: "end"
                }
            }
        },
        viewDetails: {
            textDecoration: "underline",
            whiteSpace: "nowrap"
        },
        getStarted: {
            backgroundColor: "rgba(255, 255, 255, 0.1)"
        }
    }));
    e.s(["default", 0, g], 540082);
    var b = ((t = {}).Home = "home", t.Creations = "creations", t);
    let A = (0, r.withTranslation)(e => {
        let t, v, b, A, {
                trackingPage: T,
                alertRedesignVariant: I
            } = e,
            {
                isBannerVisible: S,
                isHighPriority: C,
                variant: E,
                dismissBanner: x
            } = (0, f.useAgeVerificationUpsellContext)(),
            {
                classes: w
            } = g(),
            D = (0, n.useRef)(null),
            {
                unifiedLogger: N
            } = (0, h.useUnifiedLoggerProvider)(),
            {
                translate: L
            } = (0, r.useTranslation)(),
            M = (0, n.useCallback)(() => {
                S && N.logImpressionEvent({
                    eventName: p.default.AgeVerificationUpsellBanner,
                    parameters: {
                        page: T,
                        variant: E,
                        ...I && {
                            alertRedesignVariant: I
                        }
                    }
                })
            }, [N, T, E, I, S]);
        (0, m.default)(D, M);
        let k = (0, n.useCallback)(() => {
                N.logClickEvent({
                    eventName: p.default.AgeVerificationUpsellBannerClick,
                    parameters: {
                        page: T,
                        action: "viewDetails",
                        variant: E,
                        ...I && {
                            alertRedesignVariant: I
                        }
                    }
                })
            }, [N, T, E, I]),
            P = (0, n.useCallback)(() => {
                N.logClickEvent({
                    eventName: p.default.AgeVerificationUpsellBannerClick,
                    parameters: {
                        page: T,
                        action: "callToAction",
                        variant: E,
                        ...I && {
                            alertRedesignVariant: I
                        }
                    }
                })
            }, [N, T, E, I]),
            F = (0, n.useCallback)(() => {
                N.logClickEvent({
                    eventName: p.default.AgeVerificationUpsellBannerClick,
                    parameters: {
                        page: T,
                        action: "dismiss",
                        variant: E,
                        ...I && {
                            alertRedesignVariant: I
                        }
                    }
                }), x()
            }, [N, x, T, E, I]);
        return ("establishTrust" === E ? (t = "Title.EstablishTrustBanner", v = "Label.EstablishTrustBanner2", b = y.ESTABLISH_TRUST_UPSELL_GET_STARTED_URL, A = y.ESTABLISH_TRUST_UPSELL_VIEW_DETAILS_URL) : (t = "Title.AgeVerificationBanner", v = "Label.AgeVerificationBanner", b = y.AGE_VERIFICATION_UPSELL_GET_STARTED_URL, A = y.AGE_VERIFICATION_UPSELL_VIEW_DETAILS_URL), S) ? (0, a.jsx)("div", {
            ref: D,
            children: (0, a.jsxs)(i.Alert, {
                className: w.alertContainer,
                severity: "ageVerification" === E && C ? "warning" : "info",
                variant: "filled",
                action: [(0, a.jsx)(c.Button, {
                    href: b,
                    onClick: P,
                    className: w.getStarted,
                    color: "inherit",
                    size: "small",
                    children: L("Label.AgeVerificationBannerGetStarted")
                }, "getStarted"), (0, a.jsx)(d.IconButton, {
                    color: "inherit",
                    size: "medium",
                    "aria-label": "dismiss",
                    onClick: F,
                    children: (0, a.jsx)(u.CloseIcon, {})
                }, "dismiss")],
                children: [(0, a.jsx)(s.AlertTitle, {
                    children: L(t)
                }), (0, a.jsx)(o.Typography, {
                    variant: "body2",
                    children: L(v)
                }), " ", (0, a.jsx)(l.Link, {
                    className: w.viewDetails,
                    href: A,
                    target: "_blank",
                    color: "inherit",
                    onClick: k,
                    children: L("Label.AgeVerificationBannerViewDetails")
                })]
            })
        }) : null
    }, [v.TranslationNamespace.Home]);
    e.s(["AgeVerificationUpsellBanner", 0, A, "AgeVerificationUpsellPage", () => b], 714039)
}, 904969, e => {
    "use strict";
    e.s(["AGE_VERIFICATION_UPSELL_BANNER_END_DATE", 0, "2030-01-01T00:00:00.000Z", "AGE_VERIFICATION_UPSELL_BANNER_HIGH_PRIORITY_DATE", 0, "2026-01-21T00:00:00.000Z", "AGE_VERIFICATION_UPSELL_BANNER_START_DATE", 0, "2025-12-03T00:00:00.000Z", "AGE_VERIFICATION_UPSELL_GET_STARTED_URL", 0, "https://www.roblox.com/my/account?creatorCollaboration", "AGE_VERIFICATION_UPSELL_VIEW_DETAILS_URL", 0, "https://devforum.roblox.com/t/age-check-notifications-in-studio-and-creator-hub/4117693", "ESTABLISH_TRUST_UPSELL_GET_STARTED_URL", 0, "https://www.roblox.com/my/account?creatorCollaboration", "ESTABLISH_TRUST_UPSELL_VIEW_DETAILS_URL", 0, "https://devforum.roblox.com/t/age-check-notifications-in-studio-and-creator-hub/4117693"])
}, 906791, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        n = e.i(458451),
        r = e.i(889311),
        i = e.i(823062),
        s = e.i(814984),
        l = e.i(904969);
    let o = "CreatorHub.AgeVerificationBannerSettings",
        c = async () => {
            localStorage.removeItem(o)
        }, d = async () => {
            let e, t = localStorage.getItem(o);
            if (!t) return !1;
            try {
                let {
                    dismissedAt: a
                } = (e => {
                    let t = JSON.parse(e);
                    if (!(null == t ? void 0 : t.dismissedAt)) throw Error("Dismissed date must be set");
                    let a = new Date(t.dismissedAt);
                    if (Number.isNaN(a.getTime())) throw TypeError("Dismissed date string is not a valid date string");
                    if (a.getTime() > Date.now()) throw Error("Dismissed date cannot be in the future");
                    return {
                        dismissedAt: a
                    }
                })(t);
                e = a
            } catch (e) {
                return c(), !1
            }
            let a = new Date;
            return e.getFullYear() === a.getFullYear() && e.getMonth() === a.getMonth() && e.getDate() === a.getDate()
        }, u = async () => {
            localStorage.setItem(o, JSON.stringify({
                dismissedAt: new Date().toISOString()
            }))
        }, m = (0, a.createContext)({
            isBannerVisible: !1,
            isBannerEligible: !1,
            isHighPriority: !1,
            dismissBanner: () => Promise.reject(Error("dismissBanner not implemented")),
            variant: "ageVerification"
        }), p = e => {
            let t = new Date(e);
            return new Date(t.getUTCFullYear(), t.getUTCMonth(), t.getUTCDate())
        }, h = async () => await (0, s.getAgeVerificationUpsellFeatureAccess)() ? "ageVerification" : "doNotShow";
    e.s(["AgeVerificationUpsellProvider", 0, e => {
        let {
            children: s
        } = e, [o, c] = (0, a.useState)(!0), [v, y] = (0, a.useState)("doNotShow"), {
            isFetched: f,
            user: g
        } = (0, n.useRobloxAuthentication)(), {
            unifiedLogger: b
        } = (0, i.useUnifiedLoggerProvider)(), {
            isHighPriority: A,
            isEnabled: T
        } = (0, a.useMemo)(() => {
            let e = p(l.AGE_VERIFICATION_UPSELL_BANNER_START_DATE),
                t = p(l.AGE_VERIFICATION_UPSELL_BANNER_END_DATE),
                a = p(l.AGE_VERIFICATION_UPSELL_BANNER_HIGH_PRIORITY_DATE),
                n = new Date;
            return {
                isHighPriority: a <= n,
                isEnabled: e <= n && n < t
            }
        }, []), I = (0, a.useCallback)(async () => {
            await u(), c(!0)
        }, [c]);
        (0, a.useEffect)(() => {
            T && f && (null == g ? void 0 : g.id) && (async () => {
                let e = !1;
                try {
                    e = await d()
                } catch (e) {
                    b.logErrorEvent({
                        eventName: r.default.AgeVerificationUpsellBannerError,
                        parameters: {
                            branch: "isDismissedToday",
                            error: e instanceof Error ? e.message : String(e)
                        }
                    })
                }
                c(e);
                let t = "doNotShow";
                try {
                    t = await h()
                } catch (e) {
                    b.logErrorEvent({
                        eventName: r.default.AgeVerificationUpsellBannerError,
                        parameters: {
                            branch: "getEligibility",
                            error: e instanceof Error ? e.message : String(e)
                        }
                    })
                }
                y(t)
            })().catch(e => {
                b.logErrorEvent({
                    eventName: r.default.AgeVerificationUpsellBannerError,
                    parameters: {
                        branch: "runAsync",
                        error: e instanceof Error ? e.message : String(e)
                    }
                })
            })
        }, [T, f, g, b]);
        let S = (0, a.useMemo)(() => {
            let e = T && "doNotShow" !== v;
            return {
                isBannerVisible: e && !o,
                isBannerEligible: e,
                isHighPriority: A,
                variant: "doNotShow" !== v ? v : "ageVerification",
                dismissBanner: I
            }
        }, [T, v, o, A, I]);
        return (0, t.jsx)(m.Provider, {
            value: S,
            children: s
        })
    }, "useAgeVerificationUpsellContext", 0, () => (0, a.useContext)(m)], 906791)
}, 419652, e => {
    "use strict";
    let t = (0, e.i(416340).createContext)({
        droppedFile: void 0,
        updateDroppedFile: () => {}
    });
    t.displayName = "CreateAssetForm", e.s(["default", 0, t])
}, 384621, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        n = e.i(419652);
    e.s(["default", 0, e => {
        let {
            children: r
        } = e, [i, s] = (0, a.useState)(), l = e => {
            s(e)
        }, o = (0, a.useMemo)(() => ({
            droppedFile: i,
            updateDroppedFile: l
        }), [i]);
        return (0, t.jsx)(n.default.Provider, {
            value: o,
            children: r
        })
    }])
}, 663563, e => {
    e.v({
        buttonRow: "AudienceReachGrowthOpportunitiesBanner-module__vYyLma__buttonRow",
        heroBanner: "AudienceReachGrowthOpportunitiesBanner-module__vYyLma__heroBanner",
        heroCoverImage: "AudienceReachGrowthOpportunitiesBanner-module__vYyLma__heroCoverImage",
        heroTextContent: "AudienceReachGrowthOpportunitiesBanner-module__vYyLma__heroTextContent"
    })
}, 896852, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        n = e.i(589624),
        r = e.i(812077),
        i = e.i(278862),
        s = e.i(197649),
        l = e.i(79187),
        o = e.i(537683),
        c = e.i(29929),
        d = e.i(889311),
        u = e.i(215955),
        m = e.i(227700),
        p = e.i(881670),
        h = e.i(114209),
        v = e.i(373736),
        y = e.i(917852),
        f = e.i(576069),
        g = e.i(663563);
    let b = "".concat("https://assets.create.roblox.com/4c911cd452dcbbc3cd49c7458128a242d2a87e28/assets", "/home/publish_eligibility_banner.webp"),
        A = (0, l.withTranslation)(e => {
            var A;
            let {
                universeId: T,
                showCallToAction: I = !0
            } = e, S = (0, n.useRouter)(), {
                translateWithNamespace: C
            } = (0, l.useTranslation)(), {
                params: E,
                isFetched: x
            } = (0, m.useIXPParameters)(c.IXPLayers.CreatorHubCreationsPermission), w = E[c.CreatorHubCreationsPermissionParameters.EnableAudienceReachGrowthOpportunitiesBanner], {
                gameDetails: D
            } = (0, h.useCurrentGame)(), N = null == D ? void 0 : D.id, L = null != T ? T : N && N > 0 ? N : void 0, {
                data: M,
                isLoading: k,
                isFetching: P
            } = (0, f.useCreatorEligibility)(), F = (0, a.useRef)(!1), [_, U] = (0, a.useState)(!1), V = (null == M ? void 0 : M.ageBracket) === r.AgeBracketEnum.Over18, R = (null == M ? void 0 : M.ageBracket) === r.AgeBracketEnum.Between13And18, B = null != (A = null == M ? void 0 : M.creatorEligibility.includes(r.CreatorEligibilityEnum.IdVerified)) && A, O = V || R, j = x && w && !(k || P) && !!M && !B;
            (0, a.useEffect)(() => {
                j && !F.current && (F.current = !0, u.default.logImpressionEvent({
                    eventName: d.default.AudienceReachGrowthOpportunitiesBannerImpression,
                    parameters: {
                        page: "audienceReach",
                        ctaType: O ? "start" : "viewDetails",
                        ctaHidden: String(!I),
                        ...L ? {
                            universeId: String(L)
                        } : {}
                    }
                }))
            }, [j, I, O, L]);
            let G = (0, a.useCallback)(() => {
                if (!j) return;
                let e = O ? "start" : "viewDetails";
                (u.default.logClickEvent({
                    eventName: d.default.AudienceReachGrowthOpportunitiesBannerClick,
                    parameters: {
                        page: "audienceReach",
                        action: e,
                        ...L ? {
                            universeId: String(L)
                        } : {}
                    }
                }), R) ? U(!0): O || S.push("/settings/eligibility/publishing-permissions")
            }, [j, R, S, O, L]);
            return j ? (0, t.jsxs)(o.Grid, {
                item: !0,
                container: !0,
                direction: "row",
                paddingBottom: 4,
                children: [(0, t.jsxs)("div", {
                    className: (0, s.clsx)(g.default.heroBanner, "relative width-full flex items-center bg-surface-200 radius-large"),
                    children: [(0, t.jsx)("img", {
                        src: b,
                        alt: "",
                        "aria-hidden": !0,
                        className: (0, s.clsx)("block absolute width-full height-full"),
                        style: {
                            top: 0,
                            left: 0
                        },
                        onError: e => {
                            e.currentTarget.style.display = "none"
                        }
                    }), (0, t.jsxs)("div", {
                        className: (0, s.clsx)(g.default.heroTextContent, "color-mode-dark relative flex flex-col gap-medium padding-[32px]"),
                        children: [(0, t.jsxs)("div", {
                            children: [(0, t.jsxs)("div", {
                                className: "text-heading-medium content-emphasis",
                                children: [C(p.TranslationNamespace.AudienceReach, "Heading.ExpandGrowthOpportunities"), " "]
                            }), (0, t.jsx)("div", {
                                className: "text-body-medium content-emphasis",
                                children: C(p.TranslationNamespace.AudienceReach, "Description.ExpandGrowthOpportunities")
                            })]
                        }), (0, t.jsx)("div", {
                            className: (0, s.clsx)(g.default.buttonRow, "flex gap-small"),
                            children: I ? V ? (0, t.jsx)(i.Button, {
                                as: "a",
                                href: y.idVerificationActionUrl,
                                target: "_blank",
                                rel: "noopener noreferrer",
                                onClick: G,
                                children: (0, t.jsx)("span", {
                                    children: C(p.TranslationNamespace.AudienceReach, O ? "Action.Start" : "Action.ViewDetails")
                                })
                            }) : (0, t.jsx)(i.Button, {
                                onClick: G,
                                children: (0, t.jsx)("span", {
                                    children: C(p.TranslationNamespace.AudienceReach, O ? "Action.Start" : "Action.ViewDetails")
                                })
                            }) : null
                        })]
                    })]
                }), R ? (0, t.jsx)(v.default, {
                    open: _,
                    onOpenChange: U,
                    onContinueWithId: () => {
                        window.open(y.idVerificationActionUrl, "_blank", "noopener,noreferrer"), U(!1)
                    },
                    onAddParent: () => {
                        window.open(y.parentLinkActionUrl, "_blank", "noopener,noreferrer"), U(!1)
                    }
                }) : null]
            }) : null
        }, [p.TranslationNamespace.AudienceReach, p.TranslationNamespace.PublicPublish]);
    e.s(["default", 0, A])
}, 899441, e => {
    "use strict";
    var t, a, n = e.i(102211),
        r = e.i(272593),
        i = ((t = {}).Animation = "Animation", t.Audio = "Audio", t.Decal = "Decal", t.Image = "Image", t.Mesh = "Mesh", t.MeshPart = "MeshPart", t.Model = "Model", t.Plugin = "Plugin", t.TextDocument = "TextDocument", t.Video = "Video", t),
        s = ((a = {}).Group = "groups", a.User = "users", a);
    let l = new n.CreatorInventoryApi((0, r.createClientConfiguration)("creator-inventory-api", "bedev2"));
    e.s(["CreatorInventoryAssetType", () => i, "CreatorInventoryScopeType", () => s, "searchCreatorInventoryItems", 0, (e, t, a) => (null == t.isArchived && null == t.orderBy ? l : l.withPreMiddleware(async e => {
        let {
            url: a,
            init: n
        } = e;
        return {
            url: ((e, t) => {
                let {
                    isArchived: a,
                    orderBy: n
                } = t;
                if (null == a && null == n) return e;
                let r = e.indexOf("?"),
                    i = -1 === r ? e : e.slice(0, r),
                    s = (-1 === r ? [] : e.slice(r + 1).split("&")).map(e => null != a && e.startsWith("filter=") ? "".concat(e).concat(encodeURIComponent(";isArchived=".concat(a))) : e);
                return null != n && s.push("orderBy=".concat(encodeURIComponent(n))), "".concat(i, "?").concat(s.join("&"))
            })(a, t),
            init: n
        }
    })).creatorInventorySearchCreatorInventoryItems(e, a)])
}, 445550, e => {
    "use strict";
    var t = e.i(721281),
        a = e.i(309999),
        n = e.i(307529),
        r = e.i(272593);
    let i = {
            [n.default.Model]: a.CategoryType.Model,
            [n.default.Plugin]: a.CategoryType.Plugin
        },
        s = {
            3: n.default.Audio,
            10: n.default.Model,
            13: n.default.Decal,
            38: n.default.Plugin,
            40: n.default.MeshPart,
            62: n.default.Video
        },
        l = new class {
            async getUserSettingsFeatureKey(e) {
                let t = await this.frontendFlagsApi.frontendFlagsGetUserSetting({
                    featureKey: e
                });
                return !!(null == t ? void 0 : t.value)
            }
            async setUserSettingsFeatureKey(e, t) {
                await this.frontendFlagsApi.frontendFlagsSetUserSetting({
                    featureKey: e,
                    updateUserSettingRequest: {
                        value: String(t)
                    }
                })
            }
            async getItemDetails(e) {
                var t;
                return {
                    items: null != (t = (await this.toolboxApi.toolboxGetItemsDetails({
                        assetIds: e.join(",")
                    })).data) ? t : []
                }
            }
            async getCreatorInsightTable(e) {
                return this.toolboxApi.toolboxGetCreatorInsights({
                    assetType: e
                })
            }
            async getCreations(e, t, a, n, r, s, l) {
                return a ? this.toolboxApi.toolboxGetCreationAssets({
                    ownerId: a,
                    assetType: i[t],
                    limit: n,
                    cursor: r,
                    separateModelsAndPackages: s,
                    includeSharedAssets: l
                }) : this.toolboxApi.toolboxGetUserCreationAssets({
                    userId: e,
                    assetType: i[t],
                    limit: n,
                    cursor: r
                })
            }
            async getMarketplaceAssets(e) {
                return this.toolboxApi.toolboxGetMarketplaceAssets(e)
            }
            getFrontendFlagsValues(e) {
                return this.frontendFlagsApi.frontendFlagsGetValues(e)
            }
            constructor() {
                (0, t._)(this, "frontendFlagsApi", void 0), (0, t._)(this, "toolboxApi", void 0);
                const e = (0, r.createClientConfiguration)("toolbox-service", "bedev2");
                this.frontendFlagsApi = new a.FrontendFlagsApi(e), this.toolboxApi = new a.ToolboxApi(e)
            }
        };
    e.s(["assetTypeIdToAssetType", 0, s, "default", 0, l, "toolboxServiceItemDetailsLimit", 0, 30])
}, 790806, e => {
    "use strict";
    var t = e.i(721281),
        a = e.i(176936),
        n = e.i(272593);
    let r = new class {
            getAgeBracket() {
                return this.usersApi.v1UsersAuthenticatedAgeBracketGet()
            }
            getAuthenticatedUser() {
                return this.usersApi.v1UsersAuthenticatedGet()
            }
            async validateDisplayName(e) {
                await this.displayNameApi.v1DisplayNamesValidateGet(e)
            }
            searchUsers(e, t, a) {
                return this.userSearchApi.v1UsersSearchGet({
                    keyword: e,
                    limit: t,
                    cursor: a
                })
            }
            getUserById(e) {
                return this.usersApi.v1UsersUserIdGet({
                    userId: e
                })
            }
            getUsersByIds(e) {
                return this.usersApi.v1UsersPost({
                    request: {
                        userIds: e
                    }
                })
            }
            constructor() {
                (0, t._)(this, "displayNameApi", void 0), (0, t._)(this, "usersApi", void 0), (0, t._)(this, "userSearchApi", void 0);
                const e = (0, n.createClientConfiguration)("users", "bedev1");
                this.displayNameApi = new a.DisplayNamesApi(e), this.usersApi = new a.UsersApi(e), this.userSearchApi = new a.UserSearchApi(e)
            }
        },
        i = new a.UsersApi((0, n.createClientConfiguration)("users", "bedev1"));
    e.s(["UsersClient", 0, {
        usersApi: i
    }, "default", 0, r])
}, 131385, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(780880),
        n = e.i(339544),
        r = e.i(643093),
        i = e.i(130778),
        s = e.i(157310),
        l = e.i(913893),
        o = e.i(275574),
        c = e.i(671376),
        d = e.i(117236);
    let u = function() {
        let e = !(arguments.length > 0) || void 0 === arguments[0] || arguments[0],
            a = (0, s.useQuery)({
                queryKey: ["getTaxonomyCategories", o.CategoryDomain.NUMBER_3],
                queryFn: () => l.default.getItemCategories(o.CategoryDomain.NUMBER_3),
                enabled: e,
                staleTime: 3e5
            }),
            n = (0, s.useQuery)({
                queryKey: ["getAvatarItemsEntryPointAssetTypes"],
                queryFn: d.getAvatarItemsEntryPointAssetTypes,
                enabled: e,
                staleTime: 3e5
            }),
            i = n.data,
            u = (0, t.useMemo)(() => {
                var e, t;
                return {
                    enableMakeupAssets: null != (e = null == i ? void 0 : i.has(c.Asset.EyeMakeup)) && e,
                    enableAvatarBackgrounds: null != (t = null == i ? void 0 : i.has(c.Asset.AvatarBackground)) && t
                }
            }, [i]),
            m = (0, t.useMemo)(() => (0, r.transformCreatorDashboardTree)(a.data, u), [a.data, u]),
            p = (0, t.useMemo)(() => (0, r.buildTaxonomyL1Options)(m), [m]);
        return {
            response: a.data,
            categories: m,
            l1Options: p,
            isLoading: a.isLoading || n.isLoading,
            isError: a.isError
        }
    };
    e.s(["default", 0, e => {
        var s, l, o;
        let [{
            activeTab: c,
            filterIndex: d
        }] = (0, a.useQueryParams)(["activeTab", "filterIndex"]), {
            l1Options: m,
            categories: p,
            isLoading: h
        } = u(e), v = (0, i.isAllAssetTypesActiveTab)(c) || (0, i.isRecentsActiveTab)(c) || (0, i.isAvatarLooksActiveTab)(c) ? void 0 : null != (s = (0, i.parseTaxonomyActiveTab)(c)) ? s : null == (o = m[0]) ? void 0 : o.taxonomyKey, y = (0, t.useMemo)(() => (0, r.findL1Category)(p, v), [p, v]), f = (0, t.useMemo)(() => (0, r.buildTaxonomyL2Options)(y), [y]), g = parseInt(null != (l = null == d ? void 0 : d.toString()) ? l : "", 10), b = (0, n.isValidIndex)(g, f) ? g : 0, A = (0, t.useMemo)(() => {
            if (y) return f.length > 0 ? f[b] : y.webStableId ? (0, r.categoryToDropdown)(y) : void 0
        }, [y, f, b]);
        return {
            l1Options: m,
            activeL1Key: v,
            activeL1Node: y,
            l2Options: f,
            filterIndex: b,
            selection: A,
            isLoading: h
        }
    }], 131385)
}, 638016, e => {
    "use strict";
    var t = e.i(780880),
        a = e.i(723538),
        n = e.i(130778);
    e.s(["default", 0, e => {
        let [{
            activeTab: r
        }] = (0, t.useQueryParams)(["activeTab"]), i = (0, a.default)(), s = i && (0, n.isTaxonomyActiveTab)(r), l = i && (0, n.isAvatarLooksActiveTab)(r);
        return {
            canUseTaxonomy: i && (s || (0, n.isTaxonomyEligibleAssetTab)(e)),
            isTaxonomyMode: s,
            isTaxonomyView: s && !(0, n.isAllAssetTypesActiveTab)(r) && !(0, n.isRecentsActiveTab)(r) && !(0, n.isAvatarLooksActiveTab)(r),
            isAvatarLooksView: l
        }
    }])
}, 339544, 643093, e => {
    "use strict";
    var t = e.i(671376);
    let a = (e, t) => "".concat(e, "_").concat(t);
    e.s(["invertAvatarMenuMap", 0, e => {
        let t = new Map;
        return Object.entries(e).forEach(e => {
            let [n, r] = e;
            r.forEach((e, r) => {
                t.set(a(n, e.nameKey), r)
            })
        }), t
    }, "isOnItemTab", 0, e => e === t.Asset.TShirt, "isValidIndex", 0, (e, t) => void 0 !== t && void 0 !== e && e > 0 && e < t.length, "serializeMenuMapKey", 0, a], 339544);
    var n = e.i(266213),
        r = e.i(418162);
    let i = new Set([2, 11, 12]),
        s = new Set([76, 77, 88, 89, 90]),
        l = new Set([92]),
        o = new Set([4]);

    function c(e, t) {
        var a;
        return (null != (a = e.assetTypeIds) ? a : []).some(e => t.has(e))
    }

    function d(e) {
        var t;
        return !0 === e.isPublishable || !!c(e, l) || (null != (t = e.bundleTypeIds) ? t : []).some(e => o.has(e))
    }

    function u(e) {
        var t;
        return {
            nameKey: null != (t = e.name) ? t : "",
            taxonomy: e.webStableId,
            taxonomyAssetTypeIds: e.assetTypeIds,
            skipTranslation: !0
        }
    }

    function m(e) {
        return {
            nameKey: e.name,
            taxonomy: e.webStableId,
            taxonomyKey: e.key,
            taxonomyAssetTypeIds: e.assetTypeIds,
            skipTranslation: !0
        }
    }
    e.s(["buildTaxonomyL1Options", 0, function(e) {
        return e.map(m)
    }, "buildTaxonomyL2Options", 0, function(e) {
        var t;
        let a = (null != (t = null == e ? void 0 : e.children) ? t : []).filter(e => e.webStableId).map(u);
        return (null == e ? void 0 : e.isMakeup) && a.push({
            lookType: n.default.Makeup,
            nameKey: "Label.Looks"
        }), a
    }, "categoryToDropdown", 0, m, "findL1Category", 0, function(e, t) {
        if (t) return e.find(e => e.key === t)
    }, "taxonomyOptionLabel", 0, function(e, t) {
        var a;
        return e.skipTranslation ? (0, r.getTaxonomyDisplayName)(e.nameKey, t) : null != (a = t(e.nameKey)) ? a : e.nameKey
    }, "taxonomyOptionValue", 0, function(e) {
        return void 0 !== e.taxonomy ? e.taxonomy : void 0 !== e.lookType ? "look:".concat(e.lookType) : e.nameKey
    }, "transformCreatorDashboardTree", 0, function(e, t) {
        var a;
        let n = null != (a = null == e ? void 0 : e.categories) ? a : [],
            r = [],
            o = [];
        return n.forEach(e => {
            var a, n, u;
            let m = null != (a = e.children) ? a : [];
            if (0 === m.length) {
                if (!d(e) || c(e, l) && !t.enableAvatarBackgrounds || !e.webStableId) return;
                o.push({
                    key: e.webStableId,
                    name: null != (u = e.name) ? u : "",
                    webStableId: e.webStableId,
                    assetTypeIds: e.assetTypeIds,
                    children: []
                });
                return
            }
            let p = [],
                h = !1;
            m.forEach(e => {
                if (c(e, s)) {
                    t.enableMakeupAssets && (h = !0, p.push(e));
                    return
                }
                if (d(e)) {
                    if (c(e, i)) return void r.push(e);
                    p.push(e)
                }
            }), 0 !== p.length && e.webStableId && o.push({
                key: e.webStableId,
                name: null != (n = e.name) ? n : "",
                webStableId: e.webStableId,
                assetTypeIds: e.assetTypeIds,
                isMakeup: h,
                children: p
            })
        }), r.length > 0 && o.push({
            key: "classics",
            name: "Classics",
            webStableId: void 0,
            children: r
        }), o
    }], 643093)
}, 130778, e => {
    "use strict";
    var t, a, n, r = e.i(671376),
        i = e.i(692587),
        s = e.i(117236);
    let l = "AvatarItems",
        o = "".concat(l, "-"),
        c = r.Asset.HairAccessory;

    function d(e) {
        let t = (0, i.readQueryValue)(e);
        if (void 0 === t || !t.startsWith(o)) return;
        let a = t.slice(o.length);
        return a.length > 0 ? a : void 0
    }
    let u = "looks",
        m = new Set(null != (t = null == (n = s.default.find(e => "Label.AvatarItems" === e.nameKey)) || null == (a = n.submenuItems) ? void 0 : a.map(e => e.type)) ? t : []);

    function p(e) {
        return m.has(e)
    }
    e.s(["ALL_ASSET_TYPES_L1_KEY", 0, "all", "AVATAR_ITEMS_ACTIVE_TAB", 0, l, "AVATAR_LOOKS_L1_KEY", 0, u, "TAXONOMY_HOST_ASSET", 0, c, "buildTaxonomyActiveTab", 0, function(e) {
        return e ? "".concat(o).concat(e) : l
    }, "isAllAssetTypesActiveTab", 0, function(e) {
        return "all" === d(e)
    }, "isAvatarLooksActiveTab", 0, function(e) {
        return d(e) === u
    }, "isRecentsActiveTab", 0, function(e) {
        return "Recents" === (0, i.readQueryValue)(e) || "recents" === d(e)
    }, "isTaxonomyActiveTab", 0, function(e) {
        var t;
        let a = (0, i.readQueryValue)(e);
        return a === l || null != (t = null == a ? void 0 : a.startsWith(o)) && t
    }, "isTaxonomyEligibleAssetTab", 0, p, "parseTaxonomyActiveTab", 0, d, "shouldOpenTaxonomyView", 0, function(e) {
        let {
            isTaxonomyEnabled: t,
            isChangingSection: a,
            nextAssetType: n
        } = e;
        return t && a && p(n)
    }])
}, 456810, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(9618),
        n = e.i(54842),
        r = e.i(252842),
        i = e.i(671376);
    let s = {
            [i.Asset.Place]: a.SearchSortParameter.LastUpdated,
            [i.Asset.UpcomingEvent]: n.EventSortBy.StartUtc,
            [i.Asset.PastEvent]: n.EventSortBy.StartUtc,
            [i.Asset.DraftEvent]: n.EventSortBy.StartUtc
        },
        l = {
            sort: s,
            setSort: () => {
                throw Error("NotImplemented")
            },
            sortOrder: r.SortOrder.Desc,
            setSortOrder: () => {
                throw Error("NotImplemented")
            },
            isArchived: !1,
            setIsArchived: () => {
                throw Error("NotImplemented")
            },
            isAgeRestrictedCollaboration: !1,
            setIsAgeRestrictedCollaboration: () => {
                throw Error("NotImplemented")
            },
            isPublicOnly: !1,
            setIsPublicOnly: () => {
                throw Error("NotImplemented")
            },
            isOnMarketplace: !1,
            setIsOnMarketplace: () => {
                throw Error("NotImplemented")
            },
            resetAllFilters: () => {
                throw Error("NotImplemented")
            }
        },
        o = (0, t.createContext)(l);
    o.displayName = "Filters", e.s(["default", 0, o, "defaultAssetsSort", 0, s])
}, 475642, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(456810);
    e.s(["default", 0, () => (0, t.useContext)(a.default)])
}, 376204, e => {
    "use strict";
    var t = e.i(29929),
        a = e.i(227700);
    e.s(["default", 0, () => {
        let {
            isFetched: e,
            params: n
        } = (0, a.useIXPParameters)(t.IXPLayers.CreatorHubPublishing, {
            restoreInitialValueFromCache: !0
        }), r = n[t.CreatorHubPublishingParameters.EnableMultiAssetSearch];
        return {
            isEnabled: !0 === r,
            isReady: e || void 0 !== r
        }
    }])
}, 704443, e => {
    "use strict";
    var t = e.i(671376);
    e.s(["getSortForAssetType", 0, function(e, a) {
        return e === t.Asset.UpcomingEvent || e === t.Asset.PastEvent || e === t.Asset.DraftEvent ? a[e] : a[t.Asset.Place]
    }])
}, 211461, 725509, e => {
    "use strict";
    var t, a, n, r, i = e.i(102211),
        s = e.i(899441),
        l = e.i(361738),
        o = e.i(671376),
        c = ((t = {}).All = "All", t),
        d = ((a = {}).All = "All", a),
        u = ((n = {}).Archived = "archived", n),
        m = ((r = {}).CreatedNewest = "created_desc", r.CreatedOldest = "created_asc", r.UpdatedNewest = "updated_desc", r.UpdatedOldest = "updated_asc", r);
    let p = ["updated_desc", "updated_asc", "created_desc", "created_asc"],
        h = {
            created_desc: "createTime desc",
            created_asc: "createTime",
            updated_desc: "updateTime desc",
            updated_asc: "updateTime"
        },
        v = {
            created: {
                ascending: "created_asc",
                descending: "created_desc"
            },
            updated: {
                ascending: "updated_asc",
                descending: "updated_desc"
            }
        },
        y = [s.CreatorInventoryAssetType.Model, s.CreatorInventoryAssetType.Plugin, s.CreatorInventoryAssetType.Audio, s.CreatorInventoryAssetType.Decal, s.CreatorInventoryAssetType.Image, s.CreatorInventoryAssetType.Video, s.CreatorInventoryAssetType.Mesh, s.CreatorInventoryAssetType.MeshPart, s.CreatorInventoryAssetType.Animation],
        f = [...y, s.CreatorInventoryAssetType.TextDocument],
        g = new Set([s.CreatorInventoryAssetType.Audio, s.CreatorInventoryAssetType.Decal, s.CreatorInventoryAssetType.MeshPart, s.CreatorInventoryAssetType.TextDocument, s.CreatorInventoryAssetType.Video]),
        b = new Set([...g, s.CreatorInventoryAssetType.Image]),
        A = new Set(f),
        T = new Set([s.CreatorInventoryAssetType.TextDocument]),
        I = new Set(["All", l.CreatorInventorySourceType.Created, l.CreatorInventorySourceType.Purchased, l.CreatorInventorySourceType.Shared]),
        S = new Set([o.Asset.Animation, o.Asset.Audio, o.Asset.Decal, o.Asset.Image, o.Asset.Mesh, o.Asset.MeshPart, o.Asset.Model, o.Asset.Plugin, o.Asset.Video]),
        C = {
            [s.CreatorInventoryAssetType.Animation]: o.Asset.Animation,
            [s.CreatorInventoryAssetType.Audio]: o.Asset.Audio,
            [s.CreatorInventoryAssetType.Decal]: o.Asset.Decal,
            [s.CreatorInventoryAssetType.Image]: o.Asset.Image,
            [s.CreatorInventoryAssetType.Mesh]: o.Asset.Mesh,
            [s.CreatorInventoryAssetType.MeshPart]: o.Asset.MeshPart,
            [s.CreatorInventoryAssetType.Model]: o.Asset.Model,
            [s.CreatorInventoryAssetType.Plugin]: o.Asset.Plugin,
            [s.CreatorInventoryAssetType.TextDocument]: o.Asset.TextDocument,
            [s.CreatorInventoryAssetType.Video]: o.Asset.Video
        },
        E = {
            [s.CreatorInventoryAssetType.Animation]: i.AssetType.Animation,
            [s.CreatorInventoryAssetType.Audio]: i.AssetType.Audio,
            [s.CreatorInventoryAssetType.Decal]: i.AssetType.Decal,
            [s.CreatorInventoryAssetType.Image]: i.AssetType.Image,
            [s.CreatorInventoryAssetType.Mesh]: i.AssetType.Mesh,
            [s.CreatorInventoryAssetType.MeshPart]: i.AssetType.MeshPart,
            [s.CreatorInventoryAssetType.Model]: i.AssetType.Model,
            [s.CreatorInventoryAssetType.Plugin]: i.AssetType.Plugin,
            [s.CreatorInventoryAssetType.TextDocument]: i.AssetType.TextDocument,
            [s.CreatorInventoryAssetType.Video]: i.AssetType.Video
        },
        x = {
            3: s.CreatorInventoryAssetType.Audio,
            10: s.CreatorInventoryAssetType.Model,
            13: s.CreatorInventoryAssetType.Decal,
            24: s.CreatorInventoryAssetType.Animation,
            38: s.CreatorInventoryAssetType.Plugin,
            40: s.CreatorInventoryAssetType.MeshPart,
            62: s.CreatorInventoryAssetType.Video,
            93: s.CreatorInventoryAssetType.TextDocument,
            ANIMATION: s.CreatorInventoryAssetType.Animation,
            ASSET_TYPE_ANIMATION: s.CreatorInventoryAssetType.Animation,
            ASSET_TYPE_AUDIO: s.CreatorInventoryAssetType.Audio,
            ASSET_TYPE_DECAL: s.CreatorInventoryAssetType.Decal,
            ASSET_TYPE_IMAGE: s.CreatorInventoryAssetType.Image,
            ASSET_TYPE_MESH: s.CreatorInventoryAssetType.Mesh,
            ASSET_TYPE_MESH_PART: s.CreatorInventoryAssetType.MeshPart,
            ASSET_TYPE_MODEL: s.CreatorInventoryAssetType.Model,
            ASSET_TYPE_PLUGIN: s.CreatorInventoryAssetType.Plugin,
            ASSET_TYPE_TEXT_DOCUMENT: s.CreatorInventoryAssetType.TextDocument,
            ASSET_TYPE_VIDEO: s.CreatorInventoryAssetType.Video,
            AUDIO: s.CreatorInventoryAssetType.Audio,
            DECAL: s.CreatorInventoryAssetType.Decal,
            IMAGE: s.CreatorInventoryAssetType.Image,
            MESH: s.CreatorInventoryAssetType.Mesh,
            MESHPART: s.CreatorInventoryAssetType.MeshPart,
            MODEL: s.CreatorInventoryAssetType.Model,
            PLUGIN: s.CreatorInventoryAssetType.Plugin,
            TEXTDOCUMENT: s.CreatorInventoryAssetType.TextDocument,
            VIDEO: s.CreatorInventoryAssetType.Video
        },
        w = {
            createdDetails: l.CreatorInventorySourceType.Created,
            purchasedDetails: l.CreatorInventorySourceType.Purchased,
            sharedDetails: l.CreatorInventorySourceType.Shared
        },
        D = {
            [i.State.Active]: "Active",
            [i.State.Archived]: "Archived"
        },
        N = e => !0 === e ? f : y,
        L = e => null != e && b.has(e),
        M = e => {
            if (null == e) return;
            let t = e instanceof Date ? e : new Date(e);
            return Number.isNaN(t.getTime()) ? void 0 : t
        };
    e.s(["DEFAULT_DEVELOPMENT_ITEMS_SORT", 0, "updated_desc", "DevelopmentItemsAssetTypeFilter", () => d, "DevelopmentItemsSort", () => m, "DevelopmentItemsSourceFilter", () => c, "DevelopmentItemsStatusFilter", () => u, "buildCreatorInventoryScope", 0, (e, t) => null != t ? {
        type: s.CreatorInventoryScopeType.Group,
        id: t
    } : null != e ? {
        type: s.CreatorInventoryScopeType.User,
        id: e
    } : void 0, "buildCreatorInventorySearchFilter", 0, (e, t, a) => ({
        ...0 === t.length ? {} : {
            assetTypes: t.map(e => E[e])
        },
        ...e.type === s.CreatorInventoryScopeType.Group ? {
            groupIds: [e.id]
        } : {
            userIds: [e.id]
        },
        ..."All" === a ? {} : {
            sources: [a]
        }
    }), "canConfigureDevelopmentItem", 0, e => e.sources.includes(l.CreatorInventorySourceType.Created), "developmentItemsSortOptions", 0, p, "filterDevelopmentItemsByArchivedState", 0, (e, t) => e.filter(e => t ? "Archived" === e.state : "Archived" !== e.state), "getCreatorInventoryOrderBy", 0, (e, t) => t.trim().length > 0 ? void 0 : h[e], "getDevelopmentItemsAssetTypes", 0, N, "getDevelopmentItemsColumnSortDirection", 0, (e, t) => e === v[t].ascending ? "ascending" : e === v[t].descending ? "descending" : "none", "getDevelopmentItemsSearchAssetTypes", 0, (e, t) => [e, ...N(t).filter(t => t !== e)], "getLegacyDevelopmentItemsAssetType", 0, e => C[e], "getNextDevelopmentItemsColumnSort", 0, (e, t) => e === v[t].descending ? v[t].ascending : v[t].descending, "hasActiveDevelopmentItemsInventoryFilters", 0, e => {
        let {
            query: t,
            showArchived: a,
            source: n
        } = e;
        return t.trim().length > 0 || a || n !== l.CreatorInventorySourceType.Created
    }, "hasDevelopmentItemCreatorStorePage", 0, e => e !== s.CreatorInventoryAssetType.TextDocument, "hasDevelopmentItemThumbnail", 0, e => e !== s.CreatorInventoryAssetType.TextDocument, "isDevelopmentItemArchivedViewAvailable", 0, L, "isDevelopmentItemAsset", 0, (e, t) => e === o.Asset.TextDocument ? !0 === t : S.has(e), "isDevelopmentItemDirectlyArchivable", 0, e => null != e && g.has(e), "isDevelopmentItemsAllAssetTypes", 0, e => "All" === e, "isDevelopmentItemsArchivedViewAvailable", 0, (e, t) => t || L(1 === e.length ? e[0] : void 0), "isDevelopmentItemsAssetType", 0, (e, t) => null != e && !!A.has(e) && (!T.has(e) || !0 === t), "isDevelopmentItemsSort", 0, e => p.some(t => t === e), "isDevelopmentItemsSourceSelection", 0, e => null != e && I.has(e), "isDevelopmentItemsView", 0, e => "grid" === e || "list" === e, "mapCreatorInventoryItem", 0, e => {
        var t, a, n, r, i, s, l;
        let o, c = null == (n = e.assetItem) ? void 0 : n.asset;
        if (null == c) return;
        let d = "number" == typeof c.assetId ? c.assetId : Number.parseInt(null != (t = c.assetId) ? t : "", 10);
        if (Number.isNaN(d)) return;
        let u = null == (r = c.displayName) ? void 0 : r.trim();
        return {
            id: null != (a = e.path) ? a : d.toString(),
            assetId: d,
            assetType: (e => {
                if (null != e) return x[e.toString().toUpperCase()]
            })(c.assetType),
            created: M(c.createTime),
            isPackage: (null == (i = e.assetItem) ? void 0 : i.isPackage) === !0,
            name: null == u || 0 === u.length ? d.toString() : u,
            sources: (l = null == (s = e.assetItem) ? void 0 : s.sources, o = new Set, null == l || l.forEach(e => {
                Object.entries(e).forEach(e => {
                    let [t, a] = e;
                    if (null == a) return;
                    let n = w[t];
                    null != n && o.add(n)
                })
            }), [...o]),
            state: null == c.state ? void 0 : D[c.state],
            updated: M(c.updateTime)
        }
    }, "mergeOptimisticArchivedDevelopmentItems", 0, (e, t, a) => {
        let n = new Set(e.map(e => e.assetId));
        return [...e, ...[...t.values()].filter(e => null != e.assetType && (0 === a.length || a.includes(e.assetType)) && !n.has(e.assetId))]
    }], 211461);
    var k = e.i(416340),
        P = e.i(79187),
        F = e.i(884213),
        _ = e.i(401263),
        U = e.i(730530),
        V = e.i(881670);
    e.s(["default", 0, () => {
        let e = (0, P.useTranslation)(),
            {
                translate: t
            } = e,
            {
                tPendingTranslation: a
            } = (0, _.default)(e),
            n = (0, k.useCallback)((e, t, n, r) => {
                let i = a(e, t, n, r);
                return i.length > 0 ? i : (0, F.default)(e, r)
            }, [a]),
            r = (0, k.useCallback)(e => t("Label.AssetIDWithValue", {
                assetId: e.toString()
            }), [t]),
            i = (0, k.useCallback)(e => n("Clear {filterLabel}", "Accessible label for removing an active Development Items filter chip.", (0, U.translationKey)("Action.DevelopmentItems.ClearFilter", V.TranslationNamespace.Creations), {
                filterLabel: e
            }), [n]),
            s = (0, k.useCallback)(e => n("Source: {source}", "Active filter chip describing the selected Development Items source.", (0, U.translationKey)("Label.DevelopmentItems.InventorySourceFilter", V.TranslationNamespace.Creations), {
                source: e
            }), [n]),
            l = (0, k.useCallback)((e, t) => n("{assetTypes}, +{count} more", "Active filter chip listing the first selected Development Items asset types, then how many more are selected.", (0, U.translationKey)("Label.DevelopmentItems.AssetTypesWithMore", V.TranslationNamespace.Creations), {
                assetTypes: e,
                count: t.toString()
            }), [n]),
            o = (0, k.useCallback)(e => n("{count} types", "Asset type filter text when the creator selects more than one Development Items asset type.", (0, U.translationKey)("Label.DevelopmentItems.AssetTypeCount", V.TranslationNamespace.Creations), {
                count: e.toString()
            }), [n]),
            c = (0, k.useCallback)((e, t) => n("{query} in {assetType}", "Scoped-search suggestion that searches for a query within a Development Items asset type.", (0, U.translationKey)("Label.DevelopmentItems.SearchSuggestion", V.TranslationNamespace.Creations), {
                assetType: t,
                query: e
            }), [n]);
        return {
            actions: n("Actions", "Development Items table column and accessible label for item actions.", (0, U.translationKey)("Label.DevelopmentItems.Actions", V.TranslationNamespace.Creations)),
            acquiredFromStore: t("Label.CreatorStore"),
            allAssetTypes: n("All Types", "Asset type filter text when every Development Items asset type is included.", (0, U.translationKey)("Label.DevelopmentItems.AllAssetTypes", V.TranslationNamespace.Creations)),
            allSources: n("Any", "Source filter option that includes every Development Items source.", (0, U.translationKey)("Label.DevelopmentItems.AllSources", V.TranslationNamespace.Creations)),
            assetId: t("Label.AssetID"),
            assetIdWithValue: r,
            assetTypeCount: o,
            assetTypesWithMore: l,
            assetType: n("Asset type", "Accessible label for the Development Items asset type filter.", (0, U.translationKey)("Label.DevelopmentItems.AssetType", V.TranslationNamespace.Creations)),
            breadcrumbs: n("Breadcrumbs", "Accessible label for the page path shown above the Development Items page.", (0, U.translationKey)("Label.DevelopmentItems.Breadcrumbs", V.TranslationNamespace.Creations)),
            dateCreated: n("Date created", "Development Items table column showing when an asset was created.", (0, U.translationKey)("Label.DevelopmentItems.DateCreated", V.TranslationNamespace.Creations)),
            clearFilter: i,
            clearSearch: n("Clear search", "Accessible label and action for clearing the Development Items search query.", (0, U.translationKey)("Action.DevelopmentItems.ClearSearch", V.TranslationNamespace.Creations)),
            filterBy: t("Label.FilterBy"),
            firstPage: n("First page", "Accessible label for the Development Items pagination first-page button.", (0, U.translationKey)("Action.DevelopmentItems.FirstPage", V.TranslationNamespace.Creations)),
            grid: n("Grid", "Accessible label for the Development Items grid view.", (0, U.translationKey)("Label.DevelopmentItems.GridView", V.TranslationNamespace.Creations)),
            inventorySource: n("Source", "Label for the Development Items source filter and table column.", (0, U.translationKey)("Label.DevelopmentItems.InventorySource", V.TranslationNamespace.Creations)),
            inventorySourceFilter: s,
            lastPage: n("Last page", "Accessible label for the Development Items pagination last-page button.", (0, U.translationKey)("Action.DevelopmentItems.LastPage", V.TranslationNamespace.Creations)),
            lastUpdated: t("Label.LastUpdated"),
            list: n("List", "Accessible label for the Development Items list view.", (0, U.translationKey)("Label.DevelopmentItems.ListView", V.TranslationNamespace.Creations)),
            loading: t("Label.Loading"),
            name: t("Label.Name"),
            nextPage: n("Next page", "Accessible label for the Development Items pagination next-page button.", (0, U.translationKey)("Action.DevelopmentItems.NextPage", V.TranslationNamespace.Creations)),
            noArchivedItemsDescription: n("Items you archive will show up here.", "Guidance shown when the Development Items Archived folder is empty.", (0, U.translationKey)("Description.DevelopmentItems.NoArchivedItems", V.TranslationNamespace.Creations)),
            noArchivedItems: n("No archived items", "Heading shown when the Development Items Archived folder is empty.", (0, U.translationKey)("Heading.DevelopmentItems.NoArchivedItems", V.TranslationNamespace.Creations)),
            noDevelopmentItemsDescription: n("Upload assets to see them here.", "Guidance shown when the creator has no Development Items across all asset types.", (0, U.translationKey)("Description.DevelopmentItems.NoDevelopmentItems", V.TranslationNamespace.Creations)),
            noDevelopmentItems: n("No development items yet", "Heading shown when the creator has no Development Items across all asset types.", (0, U.translationKey)("Heading.DevelopmentItems.NoDevelopmentItems", V.TranslationNamespace.Creations)),
            noItemsDescription: n("Try another search or filter.", "Guidance shown when no Development Items match the current query and filters.", (0, U.translationKey)("Description.DevelopmentItems.NoItemsFound", V.TranslationNamespace.Creations)),
            noItems: n("No items found", "Heading shown when no Development Items match the current query and filters.", (0, U.translationKey)("Heading.DevelopmentItems.NoItemsFound", V.TranslationNamespace.Creations)),
            package: n("Package", "Accessible label for the package indicator on a Development Item thumbnail.", (0, U.translationKey)("Label.DevelopmentItems.Package", V.TranslationNamespace.Creations)),
            previousPage: n("Previous page", "Accessible label for the Development Items pagination previous-page button.", (0, U.translationKey)("Action.DevelopmentItems.PreviousPage", V.TranslationNamespace.Creations)),
            retry: t("Action.Retry"),
            rowsPerPage: t("Label.RowsPerPage"),
            search: t("Label.Search"),
            searchSuggestion: c,
            searchWithinAssetType: n("Search within asset type", "Accessible label for Development Items scoped-search suggestions.", (0, U.translationKey)("Label.DevelopmentItems.SearchWithinAssetType", V.TranslationNamespace.Creations)),
            sortBestMatch: n("Sort by: Best match", "Development Items sort shown while a search query ranks results by relevance.", (0, U.translationKey)("Label.DevelopmentItems.SortByBestMatch", V.TranslationNamespace.Creations)),
            sortBy: n("Sort by", "Accessible label for the Development Items sort selector.", (0, U.translationKey)("Label.DevelopmentItems.SortBy", V.TranslationNamespace.Creations)),
            sortDateAddedAsc: n("Sort by: Date added (Asc)", "Development Items sort option listing the earliest created assets first. Asc is short for ascending.", (0, U.translationKey)("Label.DevelopmentItems.SortByDateAddedAsc", V.TranslationNamespace.Creations)),
            sortDateAddedDesc: n("Sort by: Date added (Desc)", "Development Items sort option listing the most recently created assets first. Desc is short for descending.", (0, U.translationKey)("Label.DevelopmentItems.SortByDateAddedDesc", V.TranslationNamespace.Creations)),
            sortUpdatedAsc: n("Sort by: Updated (Asc)", "Development Items sort option listing the least recently updated assets first. Asc is short for ascending.", (0, U.translationKey)("Label.DevelopmentItems.SortByUpdatedAsc", V.TranslationNamespace.Creations)),
            sortUpdatedDesc: n("Sort by: Updated (Desc)", "Development Items sort option listing the most recently updated assets first. Desc is short for descending.", (0, U.translationKey)("Label.DevelopmentItems.SortByUpdatedDesc", V.TranslationNamespace.Creations)),
            sharedWithMe: n("Shared with me", "Source filter option for Development Items shared with the current creator.", (0, U.translationKey)("Label.DevelopmentItems.SharedWithMe", V.TranslationNamespace.Creations)),
            showHiddenBreadcrumbs: n("Show hidden pages", "Accessible label for the button that expands collapsed pages in the Development Items breadcrumbs.", (0, U.translationKey)("Action.DevelopmentItems.ShowHiddenBreadcrumbs", V.TranslationNamespace.Creations)),
            unavailableDescription: n("Try again in a moment.", "Guidance shown when the Development Items inventory cannot be loaded.", (0, U.translationKey)("Description.DevelopmentItems.InventoryUnavailable", V.TranslationNamespace.Creations)),
            unavailable: n("Inventory is unavailable", "Heading shown when the Development Items inventory cannot be loaded.", (0, U.translationKey)("Heading.DevelopmentItems.InventoryUnavailable", V.TranslationNamespace.Creations)),
            viewSelector: n("Choose grid or list view", "Accessible label for the Development Items view selector.", (0, U.translationKey)("Label.DevelopmentItems.ViewSelector", V.TranslationNamespace.Creations)),
            uploadedByMe: n("Uploaded", "Source filter option for Development Items uploaded by the current creator.", (0, U.translationKey)("Label.DevelopmentItems.UploadedByMe", V.TranslationNamespace.Creations))
        }
    }], 725509)
}, 494601, e => {
    "use strict";
    let t = (0, e.i(695763).makeStyles)()({
        gridContainer: {
            "& > *": {
                marginTop: 24,
                marginBottom: 24
            }
        },
        createButtonContainer: {
            width: "100%",
            marginTop: 0
        },
        folderActionContainer: {
            width: "100%",
            marginTop: 0
        }
    });
    e.s(["default", 0, t])
}, 723538, e => {
    "use strict";
    var t = e.i(629450),
        a = e.i(239328);
    e.s(["default", 0, () => {
        let {
            ready: e,
            value: n
        } = (0, t.useFlag)(a.enableTaxonomyBasedCreatorDashboard);
        return e && null != n && n
    }])
}, 348558, e => {
    "use strict";
    var t = e.i(629450),
        a = e.i(9436);
    e.s(["default", 0, () => {
        let {
            ready: e,
            value: n
        } = (0, t.useFlag)(a.isTextDocumentEnabled);
        if (e) return n
    }])
}, 100226, e => {
    "use strict";
    var t = e.i(629450),
        a = e.i(239328);
    e.s(["default", 0, () => {
        let {
            ready: e,
            value: n
        } = (0, t.useFlag)(a.enableCreatorShowcases);
        if (e) return n
    }])
}, 668091, 418564, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(109543);
    e.s(["default", 0, function() {
        return (0, t.useContext)(a.default)
    }], 668091);
    var n = e.i(221628),
        r = e.i(711950),
        i = e.i(79187);
    let s = {
        info: "Info",
        warning: "Warning",
        error: "Error"
    };
    e.s(["default", 0, e => {
        let {
            alertTitle: a,
            alertDescription: l,
            severity: o,
            externalLink: c,
            linkLabel: d,
            allowCloseDialog: u,
            onDismiss: m
        } = e, {
            translate: p
        } = (0, i.useTranslation)(), [h, v] = (0, t.useState)(!0);
        if (!h) return null;
        let y = u ? {
            closeLabel: p("Action.Close"),
            onDismiss: () => {
                null == m || m(), v(!1)
            }
        } : {
            hasCloseAffordance: !1
        };
        return (0, n.jsx)(r.Alert, {
            severity: s[o],
            variant: "Feedback",
            className: "width-full",
            primaryActionLabel: d,
            primaryActionHref: c,
            ...y,
            children: (0, n.jsxs)("div", {
                className: "flex flex-col gap-xsmall",
                children: [a && (0, n.jsx)("span", {
                    className: "text-label-medium content-emphasis",
                    children: a
                }), (0, n.jsx)("span", {
                    className: "text-body-medium text-truncate-split content-default width-full",
                    children: l
                })]
            })
        })
    }], 418564)
}, 773595, e => {
    "use strict";
    var t = e.i(79187);
    let a = new Map([
            ["id-id", t.Locale.Indonesian],
            ["de-de", t.Locale.German],
            ["en-us", t.Locale.English],
            ["es-es", t.Locale.Spanish],
            ["fr-fr", t.Locale.French],
            ["it-it", t.Locale.Italian],
            ["pl-pl", t.Locale.Polish],
            ["pt-br", t.Locale.BrazilPortuguese],
            ["vi-vn", t.Locale.Vietnamese],
            ["tr-tr", t.Locale.Turkish],
            ["ar-001", t.Locale.Arabic],
            ["th-th", t.Locale.Thai],
            ["zh-cn", t.Locale.SimplifiedChinese],
            ["zh-tw", t.Locale.TraditionalChinese],
            ["ja-jp", t.Locale.Japanese],
            ["ko-kr", t.Locale.Korean]
        ]),
        n = [t.Locale.Indonesian, t.Locale.German, t.Locale.English, t.Locale.Spanish, t.Locale.French, t.Locale.Italian, t.Locale.Polish, t.Locale.BrazilPortuguese, t.Locale.Vietnamese, t.Locale.Turkish, t.Locale.Arabic, t.Locale.Thai, t.Locale.SimplifiedChinese, t.Locale.TraditionalChinese, t.Locale.Japanese, t.Locale.Korean];
    e.s(["StringLocaleMap", 0, a, "availableDocsLocales", 0, n])
}, 321211, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340);
    e.s(["default", 0, e => {
        let {
            className: n,
            onChange: r,
            onDragActiveHandler: i,
            onDragLeaveHandler: s,
            size: l,
            multiple: o,
            children: c,
            accept: d,
            ...u
        } = e, m = (0, a.useRef)(null), p = () => {
            m.current && m.current.click()
        }, h = e => {
            ((e instanceof Event ? e instanceof KeyboardEvent : e.nativeEvent && e.nativeEvent instanceof KeyboardEvent) ? ["Spacebar", " ", "Enter"].includes(e.key) : (console.info("The event passed in is not a keyboard event, are you using the handler in the wrong place?"), !1)) && (e.preventDefault(), p())
        }, v = c ? c(p, h, e => {
            e.preventDefault();
            let {
                dataTransfer: {
                    files: t
                }
            } = e;
            r && r(t)
        }, e => {
            e.preventDefault(), i && i()
        }, e => {
            e.preventDefault(), s && s()
        }) : null;
        return (0, t.jsxs)("div", {
            className: n,
            children: [v, (0, t.jsx)("input", {
                ...u,
                accept: d,
                multiple: o,
                ref: m,
                type: "file",
                size: l,
                onChange: e => {
                    let {
                        target: t
                    } = e;
                    r && r(t.files), m.current && (m.current.value = "")
                },
                style: {
                    display: "none"
                }
            })]
        })
    }], 321211)
}, 137785, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        n = e.i(79187),
        r = e.i(958885),
        i = e.i(611043),
        s = e.i(537683),
        l = e.i(695763),
        o = e.i(334791),
        c = e.i(253738),
        d = e.i(338078),
        u = e.i(416504),
        m = e.i(46591),
        p = e.i(17829),
        h = e.i(426546);
    let v = {
            compact: 32,
            medium: 48,
            large: 64
        },
        y = {
            compact: 12,
            medium: 16,
            large: 20
        },
        f = {
            compact: 32,
            medium: 48,
            large: 64
        },
        g = {
            compact: 4,
            medium: 6,
            large: 8
        },
        b = (0, l.makeStyles)()((e, t) => {
            let {
                variant: a
            } = t;
            return {
                container: {
                    minWidth: 0,
                    width: "fit-content"
                },
                avatarContainer: {
                    width: v[a],
                    height: v[a],
                    marginRight: y[a]
                },
                userBorderRadius: {
                    borderRadius: f[a]
                },
                nonUserBorderRadius: {
                    borderRadius: g[a]
                },
                thumbnailItemContainer: {
                    display: "flex",
                    alignItems: "center"
                },
                thumbnailBackground: {
                    background: e.palette.surface[200]
                },
                itemText: {
                    whiteSpace: "nowrap",
                    "& > *:not(:last-child)": {
                        paddingBottom: 4
                    }
                },
                mutedText: {
                    color: e.palette.content.muted
                },
                disabledThumbnail: {
                    filter: "grayscale(100%)"
                },
                textContainer: {
                    display: "block",
                    whiteSpace: "nowrap",
                    overflow: "hidden",
                    textOverflow: "ellipsis",
                    "& > *:not(:first-child)": {
                        display: "block",
                        whiteSpace: "nowrap",
                        overflow: "hidden",
                        textOverflow: "ellipsis"
                    }
                }
            }
        });
    e.s(["default", 0, e => {
        let l, {
                target: y,
                targetType: f,
                displayNameOverride: g,
                adornment: A,
                label: T,
                disabled: I,
                variant: S = "medium",
                disableLink: C = !1,
                obfuscate: E = !1,
                hideThumbnail: x = !1,
                hideSecondaryLabel: w = !1,
                textVariant: D = "primary",
                labelTooltip: N,
                secondaryLabelClassName: L
            } = e,
            {
                classes: {
                    container: M,
                    avatarContainer: k,
                    thumbnailItemContainer: P,
                    thumbnailBackground: F,
                    userBorderRadius: _,
                    nonUserBorderRadius: U,
                    itemText: V,
                    mutedText: R,
                    disabledThumbnail: B,
                    textContainer: O
                },
                cx: j
            } = b({
                variant: S
            }),
            {
                translate: G
            } = (0, n.useTranslation)(),
            K = (0, a.useMemo)(() => f === p.default.User ? r.ThumbnailTypes.avatarHeadshot : f === p.default.Group ? r.ThumbnailTypes.groupIcon : "Ugc" === f ? r.ThumbnailTypes.assetThumbnail : r.ThumbnailTypes.universeThumbnail, [f]),
            H = (0, a.useMemo)(() => {
                if (!C && y.id && !E) {
                    if (f === p.default.User) return h.www.getUserUrl(y.id);
                    if (f === p.default.Group) return h.www.getGroupUrl(y.id);
                    if ("Experience" === f) {
                        let e = "rootPlaceId" in y ? y.rootPlaceId : void 0;
                        return e ? h.www.getGameDetailsUrl(e) : void 0
                    }
                    if ("Ugc" === f) return h.www.getCatalogUrl(y.id)
                }
            }, [C, y, E, f]);
        g ? l = g : f === p.default.User ? l = "displayName" in y ? y.displayName : void 0 : "Ugc" !== f && (l = "name" in y ? y.name : void 0);
        let z = !g && (f === p.default.User && !("displayName" in y && y.displayName) || "Ugc" === f),
            q = (0, a.useMemo)(() => {
                let e;
                return (0, t.jsxs)(s.Grid, {
                    container: !0,
                    direction: "row",
                    alignItems: "center",
                    wrap: "wrap",
                    children: [z ? (0, t.jsx)(d.Skeleton, {
                        animate: !0,
                        variant: "text",
                        width: 192,
                        height: 22
                    }) : (0, t.jsxs)(s.Grid, {
                        container: !0,
                        direction: "row",
                        alignItems: "center",
                        wrap: "wrap",
                        columnGap: 1,
                        children: [(0, t.jsx)(i.Typography, {
                            className: O,
                            variant: "secondary" === D ? "body1" : "compact" === S ? "captionHeader" : "large" === S ? "h2" : "h5",
                            color: I ? "disabled" : "inherit",
                            children: E ? G("Label.Other") : l
                        }), T && T.length > 0 && (0, t.jsx)(m.Tooltip, {
                            arrow: !0,
                            title: N,
                            placement: "right",
                            enterTouchDelay: 0,
                            leaveTouchDelay: 3e3,
                            children: (0, t.jsx)(u.Chip, {
                                color: "secondary",
                                label: T,
                                size: "small",
                                variant: "filled"
                            })
                        })]
                    }), !w && (0, t.jsxs)(t.Fragment, {
                        children: [f === p.default.User && (0, t.jsx)(t.Fragment, {
                            children: "name" in y && !y.name ? (0, t.jsx)(d.Skeleton, {
                                animate: !0,
                                variant: "text",
                                width: 192,
                                height: 20
                            }) : (0, t.jsx)(i.Typography, {
                                variant: "secondary" === D ? "body2" : "captionBody",
                                className: j(O, {
                                    [R]: void 0 === L && ("secondary" === D || "compact" === S)
                                }),
                                color: I ? "disabled" : "inherit",
                                children: (e = E ? G("Label.Other") : "@".concat("name" in y ? y.name : ""), L ? (0, t.jsx)("span", {
                                    className: L,
                                    children: e
                                }) : e)
                            })
                        }), (f === p.default.Group || "Experience" === f) && (0, t.jsx)(i.Typography, {
                            variant: "captionBody",
                            className: j(O, {
                                [R]: void 0 === L && ("secondary" === D || "compact" === S)
                            }),
                            color: I ? "disabled" : "inherit",
                            children: L ? (0, t.jsx)("span", {
                                className: L,
                                children: E ? G("Label.Other") : y.id
                            }) : E ? G("Label.Other") : y.id
                        })]
                    })]
                })
            }, [z, l, f, y, O, I, E, G, T, w, j, R, D, S, N, L]);
        return (0, t.jsx)(s.Grid, {
            container: !0,
            direction: "row",
            alignItems: "center",
            wrap: "nowrap",
            justifyContent: "space-between",
            className: M,
            children: (null == y ? void 0 : y.id) === void 0 ? (0, t.jsx)(d.Skeleton, {
                animate: !0,
                variant: "rectangular",
                width: "100%",
                height: v[S]
            }) : (0, t.jsxs)(t.Fragment, {
                children: [(0, t.jsxs)(s.Grid, {
                    container: !0,
                    wrap: "nowrap",
                    children: [!x && (0, t.jsx)(s.Grid, {
                        item: !0,
                        className: P,
                        children: (0, t.jsx)(o.Avatar, {
                            variant: "rounded",
                            alt: "avatar",
                            className: j(k, {
                                [_]: f === p.default.User,
                                [U]: f !== p.default.User,
                                [B]: I
                            }),
                            children: (0, t.jsx)(r.Thumbnail2d, {
                                targetId: y.id,
                                type: K,
                                imgClassName: F,
                                alt: "thumbnail",
                                returnPolicy: r.ReturnPolicy.PlaceHolder,
                                includeBackground: !1
                            })
                        })
                    }), (0, t.jsx)(s.Grid, {
                        container: !0,
                        direction: "column",
                        className: M,
                        children: (0, t.jsx)(s.Grid, {
                            item: !0,
                            children: C || E ? q : (0, t.jsx)(c.Link, {
                                href: H,
                                className: V,
                                color: "inherit",
                                children: q
                            })
                        })
                    })]
                }), A]
            })
        })
    }])
}, 227700, e => {
    "use strict";
    var t = e.i(60373);
    e.s(["useIXPParameters", () => t.default])
}, 211388, e => {
    "use strict";
    var t = e.i(336964);
    let a = t.dialogStore.close;
    e.s(["closeDialog", 0, a, "openDialog", 0, e => {
        if ("content" in e) t.dialogStore.open(e.content, e.options);
        else {
            var a;
            t.dialogStore.open({
                Component: e.component,
                props: null != (a = e.props) ? a : {}
            }, e.options)
        }
    }])
}, 336964, e => {
    "use strict";
    let t;
    var a = e.i(798280);

    function n(e) {
        var t, a, n, r;
        if ((null == e ? void 0 : e.mode) === "standalone") return {
            mode: "standalone",
            shouldUnmountOnClose: null == (r = e.shouldUnmountOnClose) || r
        };
        let i = null != e ? e : {};
        return {
            mode: "content",
            size: null != (t = i.size) ? t : "Medium",
            isModal: null == (a = i.isModal) || a,
            hasCloseAffordance: void 0 !== i.closeLabel,
            closeLabel: i.closeLabel,
            hasMarginTop: i.hasMarginTop,
            hasMarginBottom: i.hasMarginBottom,
            hasDescription: i.hasDescription,
            shouldUnmountOnClose: null == (n = i.shouldUnmountOnClose) || n
        }
    }
    let r = n(),
        i = {
            ...t = (0, a.createStore)({
                render: null,
                options: null,
                isOpen: !1
            }),
            open: (e, a) => {
                t.setState({
                    render: e,
                    options: n(a),
                    isOpen: !0
                })
            },
            close: () => {
                t.getSnapshot().isOpen && t.setState({
                    isOpen: !1
                })
            },
            clearContent: () => {
                t.getSnapshot().isOpen || t.setState({
                    render: null,
                    options: null
                })
            }
        };
    e.s(["DEFAULT_RESOLVED_CONTENT_OPTIONS", 0, r, "dialogStore", 0, i])
}, 798280, e => {
    "use strict";
    e.s(["createStore", 0, e => {
        let t = new Set,
            a = e;
        return {
            getSnapshot: function() {
                return a
            },
            setState: function(e) {
                let n = a;
                a = {
                    ...a,
                    ...e
                }, t.forEach(e => e(a, n))
            },
            subscribe: function(e) {
                return t.add(e), () => {
                    t.delete(e)
                }
            }
        }
    }])
}, 83560, e => {
    "use strict";
    var t = e.i(209534);
    let a = t.snackbarStore.enqueue;
    e.s(["toast", 0, a, "useSnackbar", 0, function() {
        return {
            enqueue: t.snackbarStore.enqueue
        }
    }])
}, 209534, e => {
    "use strict";
    var t = e.i(798280);
    let a = 0,
        n = (0, t.createStore)({
            current: null
        }),
        r = {
            ...n,
            enqueue: function(e) {
                var t, r;
                let i = n.getSnapshot().current;
                null == i || null == (t = (r = i.props).onClose) || t.call(r), a += 1, n.setState({
                    current: {
                        id: "snackbar-".concat(a),
                        props: e
                    }
                })
            },
            dismiss: function() {
                var e, t;
                let {
                    current: a
                } = n.getSnapshot();
                a && (null == (e = (t = a.props).onClose) || e.call(t), n.setState({
                    current: null
                }))
            }
        };
    e.s(["snackbarStore", 0, r])
}, 125677, 20227, e => {
    "use strict";
    var t = e.i(416340);
    e.s(["useCurrentPage", 0, function(e, a) {
        let {
            page: n,
            rowsPerPage: r,
            hasNextPage: i,
            fetchNextPage: s,
            fetchLimit: l = r
        } = a, o = (0, t.useMemo)(() => {
            let t = n * r;
            return e.slice(t, t + r)
        }, [e, n, r]), c = (n + 1) * l >= e.length;
        return (0, t.useEffect)(() => {
            c && i && (null == s || s())
        }, [c, i, s]), {
            currentPage: o
        }
    }], 125677), e.s(["useTablePagination", 0, function(e) {
        let {
            count: a,
            initialRowsPerPage: n = 50,
            resetKey: r
        } = e, [i, s] = (0, t.useState)(0), [l, o] = (0, t.useState)(n), [c, d] = (0, t.useState)(r);
        r !== c && (d(r), s(0));
        let u = Math.max(0, Math.ceil(a / l) - 1),
            m = Math.min(i, u);
        return {
            page: m,
            rowsPerPage: l,
            onPageChange: (0, t.useCallback)((e, t) => {
                s(Math.max(0, Math.min(t, u)))
            }, [u]),
            onRowsPerPageChange: (0, t.useCallback)(e => {
                o("number" == typeof e ? e : parseInt(e.target.value, 10)), s(0)
            }, [])
        }
    }], 20227)
}, 134817, e => {
    "use strict";
    var t = e.i(416340);
    e.s(["useBackgroundPageLoader", 0, function(e) {
        let {
            hasNextPage: a,
            fetchNextPage: n,
            disabled: r,
            intervalMs: i = 1e3
        } = e, s = (0, t.useRef)(n);
        s.current = n, (0, t.useEffect)(() => {
            if (!a || r) return;
            s.current();
            let e = setInterval(() => {
                s.current()
            }, i);
            return () => clearInterval(e)
        }, [a, r, i])
    }])
}, 85057, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(602635),
        n = e.i(79187),
        r = e.i(611043),
        i = e.i(537683),
        s = e.i(695763),
        l = e.i(484541);
    let o = (0, s.makeStyles)()(e => ({
        container: {
            display: "flex",
            flexDirection: "column",
            gap: 8
        },
        headerContainer: {
            display: "flex",
            flexDirection: "row",
            alignItems: "center",
            minWidth: 0
        },
        header: {
            display: "flex",
            alignItems: "center",
            flex: "1 1 auto",
            height: 40,
            minHeight: 40,
            paddingLeft: 12,
            minWidth: 0,
            overflow: "hidden",
            color: "var(--color-content-emphasis)",
            textOverflow: "ellipsis",
            whiteSpace: "nowrap",
            fontFamily: 'var(--Config-Text-Font, "Builder Sans")',
            fontSize: 16,
            fontStyle: "normal",
            fontWeight: 700,
            lineHeight: "140%"
        },
        headerText: {
            overflow: "hidden",
            textOverflow: "ellipsis",
            whiteSpace: "nowrap"
        },
        headerAction: {
            display: "flex",
            flexShrink: 0,
            alignItems: "center",
            marginLeft: "auto"
        },
        divider: {
            borderColor: e.palette.components.divider
        },
        icon: {
            height: 32,
            width: 32,
            minWidth: 32,
            minHeight: 32,
            flexShrink: 0,
            overflow: "hidden",
            borderRadius: 8,
            color: "var(--color-content-emphasis)",
            "& img, & canvas, & > *": {
                width: "100%",
                height: "100%",
                maxWidth: "100%",
                maxHeight: "100%",
                objectFit: "cover",
                display: "block"
            }
        }
    }));
    e.s(["default", 0, e => {
        let {
            header: s,
            items: c,
            icon: d,
            activeKey: u,
            defaultExpanded: m,
            headerAction: p
        } = e, {
            classes: h
        } = o(), {
            ready: v
        } = (0, n.useTranslation)();
        return v ? (0, t.jsxs)(i.Grid, {
            classes: {
                root: h.container
            },
            children: [s && (0, t.jsxs)(t.Fragment, {
                children: [(0, t.jsxs)(i.Grid, {
                    classes: {
                        root: h.headerContainer
                    },
                    children: [d && (0, t.jsx)(i.Grid, {
                        classes: {
                            root: h.icon
                        },
                        children: d
                    }), (0, t.jsx)(r.Typography, {
                        variant: "largeLabel2",
                        classes: {
                            root: h.header
                        },
                        children: (0, t.jsx)("span", {
                            className: h.headerText,
                            children: s
                        })
                    }), p && (0, t.jsx)(i.Grid, {
                        classes: {
                            root: h.headerAction
                        },
                        children: p
                    })]
                }), (0, t.jsx)(l.Divider, {
                    classes: {
                        root: h.divider
                    }
                })]
            }), c.length > 0 && (0, t.jsx)(a.NavigationTree, {
                selected: u,
                defaultExpanded: m,
                children: c.map(e => {
                    var n;
                    return (0, t.jsx)(a.NavigationTreeItem, {
                        label: e.label,
                        nodeId: e.key,
                        href: e.href,
                        adornment: e.adornment,
                        variant: "smallLabel2",
                        onClick: e.onClick,
                        children: null == (n = e.subItems) ? void 0 : n.map(n => (0, t.jsx)(a.NavigationTreeItem, {
                            label: n.label,
                            nodeId: n.key,
                            onClick: n.onClick,
                            href: n.href,
                            adornment: n.adornment
                        }, "".concat(e.key, "-").concat(n.key)))
                    }, e.key)
                })
            })]
        }) : null
    }])
}, 373736, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(278862),
        n = e.i(643992),
        r = e.i(79187),
        i = e.i(611043);
    e.s(["default", 0, e => {
        let {
            open: s,
            onOpenChange: l,
            onContinueWithId: o,
            onAddParent: c
        } = e, {
            translate: d
        } = (0, r.useTranslation)();
        return (0, t.jsx)(n.Dialog, {
            open: s,
            onOpenChange: l,
            size: "Small",
            isModal: !0,
            hasCloseAffordance: !0,
            closeLabel: d("Action.Close"),
            children: (0, t.jsxs)(n.DialogContent, {
                children: [(0, t.jsxs)(n.DialogBody, {
                    className: "flex flex-col gap-medium",
                    children: [(0, t.jsx)(n.DialogTitle, {
                        className: "text-heading-medium margin-y-none",
                        children: d("Label.IdVerification")
                    }), (0, t.jsx)(i.Typography, {
                        className: "text-body-medium",
                        children: d("Description.IdVerifiedDialog")
                    }), (0, t.jsx)(i.Typography, {
                        className: "text-body-medium",
                        children: d("Description.IdVerifiedDialogReverify")
                    })]
                }), (0, t.jsxs)(n.DialogFooter, {
                    className: "flex flex-col gap-xsmall",
                    children: [(0, t.jsx)(a.Button, {
                        variant: "Emphasis",
                        className: "fill",
                        onClick: o,
                        children: d("Action.ContinueWithId")
                    }), (0, t.jsx)(a.Button, {
                        variant: "Standard",
                        className: "fill",
                        onClick: c,
                        children: d("Action.AddAParent")
                    })]
                })]
            })
        })
    }])
}, 917852, e => {
    "use strict";
    e.s(["ageVerificationActionUrl", 0, "https://".concat("roblox.com", "/my/account?ageVerification#!/info"), "idVerificationActionUrl", 0, "https://".concat("roblox.com", "/my/account?idVerification#!/info"), "parentLinkActionUrl", 0, "https://".concat("roblox.com", "/my/account?addParent#!/parental-controls"), "phoneVerificationActionUrl", 0, "https://".concat("roblox.com", "/my/account#!/info"), "twoStepVerificationActionUrl", 0, "https://".concat("roblox.com", "/my/account#!/security")])
}, 576069, e => {
    "use strict";
    var t = e.i(157310),
        a = e.i(814975),
        n = e.i(605050);
    let r = ["creatorEligibility"];
    e.s(["creatorEligibilityQueryKeyPrefix", 0, r, "useCreatorEligibility", 0, function() {
        let {
            overrideUserId: e,
            isReady: i = !0,
            refetchInterval: s = !1
        } = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {}, {
            user: l
        } = (0, a.useAuthentication)(), o = null == l ? void 0 : l.id, c = null != e ? e : o;
        return (0, t.useQuery)({
            queryKey: [...r, null != c ? c : null],
            queryFn: async () => n.default.coreContentGetCreatorEligibility({
                userId: c
            }),
            enabled: i && !!c,
            refetchInterval: s,
            refetchIntervalInBackground: !0
        })
    }])
}, 845592, 448005, e => {
    "use strict";
    var t, a = e.i(221628),
        n = e.i(416340),
        r = e.i(445550),
        i = ((t = {}).FrontendFlagEnableNonPluginDistributionRestrictions = "PublicFrontendMDR", t.FrontendFlagEnableModelPricingTransition = "PublicFrontendEMPT", t.FrontendFlagEnableSocialLinkCustomTitles = "PublicFrontendSLCT", t.FrontendFlagEnableAudioWavUpload = "PublicFrontendAWU", t.FrontendFlagEnableAudioFlacUpload = "PublicFrontendAFU", t.FrontendFlagEnableCreatorInsightsPage = "PublicFrontendCIP", t.FrontendFlagEnableTryAssetSocialLink = "PublicFrontendETIR", t.FrontendFlagEnableTryAssetDefaultExperience = "PublicFrontendETADE", t.FrontendFlagEnablePaidModelDependenciesModal = "PublicFrontendPMDM", t.FrontendFlagTaxonomyExperiment = "PublicFrontendTE", t.FrontendFlagUniverseBansManagerLabelUpdate = "PublicFrontendUBMLU", t.FrontendFlagEnableHiddenFromSearchVisibilityAlert = "PublicFrontendHFS", t);
    let s = Object.values(i),
        l = (e => {
            let t = {};
            for (let a of s) t[a] = e(a);
            if (!s.every(e => Object.hasOwn(t, e))) throw Error("Failed to build frontend flags.");
            return t
        })(() => !1);
    e.s(["DEFAULT_FRONTEND_FLAGS", 0, l, "FRONTEND_FLAG_NAMES", 0, s, "FrontendFlagName", () => i], 448005);
    let o = (0, n.createContext)(null);
    e.s(["default", 0, e => {
        let {
            children: t
        } = e, [i, c] = (0, n.useState)(l), [d, u] = (0, n.useState)(!1), m = (0, n.useCallback)(async e => {
            try {
                let t = await r.default.getFrontendFlagsValues(e),
                    a = Object.assign({}, ...s.map(e => {
                        var a, n;
                        return {
                            [e]: null != (a = null == t || null == (n = t.data) ? void 0 : n[e]) && a
                        }
                    }));
                c(a)
            } catch (e) {}
        }, []);
        (0, n.useEffect)(() => {
            let e = !0,
                t = {
                    flags: [...s]
                };
            return u(!0), (async () => {
                await m(t), e && u(!1)
            })(), () => {
                e = !1
            }
        }, [m]);
        let p = (0, n.useMemo)(() => ({
            frontendFlags: i,
            getFrontendFlags: m,
            loadingFrontendFlags: d
        }), [i, m, d]);
        return (0, a.jsx)(o.Provider, {
            value: p,
            children: t
        })
    }, "useToolboxServiceApiProvider", 0, function() {
        let e = (0, n.useContext)(o);
        if (null === e) throw Error("useToolboxServiceApiProvider must be used within a ToolboxServiceApiProvider");
        return e
    }], 845592)
}, 796266, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(589624),
        n = e.i(745873);
    let r = e => {
        let t = Array.isArray(e) ? e[0] : e;
        if (!t) return null;
        let a = Number(t);
        return Number.isInteger(a) && a > 0 ? a : null
    };
    e.s(["default", 0, function() {
        let e = (0, a.useRouter)(),
            {
                groups: i,
                isFetched: s,
                currentGroup: l,
                setCurrentGroup: o
            } = (0, n.useGroups)(),
            c = (0, t.useRef)(!1),
            d = (0, t.useRef)(!1),
            u = (0, t.useMemo)(() => {
                if (!e.isReady) return null;
                let t = r(e.query.groupId),
                    a = r(e.query.userId);
                return null !== t && null !== a ? null : null !== a ? {
                    kind: "user"
                } : null !== t ? {
                    kind: "group",
                    id: t
                } : null
            }, [e.isReady, e.query.groupId, e.query.userId]),
            m = (null == u ? void 0 : u.kind) === "group" && (null != i ? i : []).some(e => {
                let {
                    id: t
                } = e;
                return t === u.id
            });
        (0, t.useEffect)(() => {
            !c.current && null !== u && s && (c.current = !0, "user" === u.kind ? null !== l && o(null) : m && (null == l ? void 0 : l.id) !== u.id && o(u.id))
        }, [u, s, m, l, o]);
        let p = !e.isReady;
        return p || null === u || (p = "group" === u.kind ? !s || m && (null == l ? void 0 : l.id) !== u.id : !s || null !== l), (0, t.useEffect)(() => {
            if (d.current || !e.isReady || p || void 0 === e.query.groupId && void 0 === e.query.userId) return;
            d.current = !0;
            let t = {
                ...e.query
            };
            delete t.groupId, delete t.userId, e.replace({
                query: t
            }, void 0, {
                shallow: !0
            })
        }, [e, p]), {
            isResolving: p
        }
    }])
}, 275574, e => {
    "use strict";
    var t = e.i(155743);
    e.s(["CategoryDomain", () => t.V1ItemsCategoriesGetCategoryDomainEnum])
}, 711950, e => {
    "use strict";
    var t = e.i(562991),
        a = e.i(278862),
        n = e.i(641659),
        r = e.i(927072),
        i = e.i(805476),
        s = e.i(197649),
        l = e.i(416340);
    let o = {
            Info: "icon-filled-circle-i",
            Warning: "icon-filled-triangle-exclamation",
            Success: "icon-filled-circle-check",
            Error: "icon-filled-circle-x"
        },
        c = {
            Info: "var(--color-system-emphasis)",
            Warning: "var(--color-system-warning)",
            Success: "var(--color-extended-green-700, var(--color-system-success))",
            Error: "var(--color-action-alert-foreground)"
        },
        d = {
            Info: "stroke-emphasis",
            Warning: "stroke-system-warning",
            Success: "stroke-emphasis",
            Error: "stroke-system-alert"
        },
        u = {
            Info: "rgb(from var(--color-system-neutral) r g b / 0.1)",
            Warning: "rgb(from var(--color-system-warning) r g b / 0.16)",
            Success: "rgb(from var(--color-system-success) r g b / 0.1)",
            Error: "rgb(from var(--color-system-alert) r g b / 0.16)"
        },
        m = e => {
            let {
                label: t,
                href: n,
                linkTarget: r,
                onAction: i,
                variant: s
            } = e;
            return r ? l.default.createElement(a.Button, {
                asChild: !0,
                size: "Small",
                variant: s,
                onClick: i
            }, l.default.cloneElement(r, {}, t)) : n ? l.default.createElement(a.Button, {
                as: "a",
                href: n,
                size: "Small",
                variant: s,
                onClick: i
            }, t) : l.default.createElement(a.Button, {
                size: "Small",
                variant: s,
                onClick: i
            }, t)
        },
        p = e => {
            let {
                label: t,
                href: a,
                linkTarget: n,
                onAction: i
            } = e;
            return n ? l.default.createElement(r.Link, {
                asChild: !0,
                onClick: i,
                size: "Medium",
                variant: "Standalone",
                underline: "always"
            }, l.default.cloneElement(n, {}, t)) : a ? l.default.createElement(r.Link, {
                href: a,
                onClick: i,
                size: "Medium",
                variant: "Standalone",
                underline: "always"
            }, t) : l.default.createElement(r.Link, {
                as: "button",
                onClick: i,
                size: "Medium",
                variant: "Standalone",
                underline: "always"
            }, t)
        },
        h = (0, l.forwardRef)((e, a) => {
            let {
                children: r,
                variant: h = "System",
                severity: v = "Info",
                primaryActionLabel: y,
                primaryActionHref: f,
                primaryActionLinkTarget: g,
                onPrimaryAction: b,
                secondaryActionLabel: A,
                secondaryActionHref: T,
                secondaryActionLinkTarget: I,
                onSecondaryAction: S,
                hasCloseAffordance: C = !0,
                closeLabel: E = "Dismiss alert",
                onDismiss: x,
                className: w,
                style: D,
                ...N
            } = e, L = (0, n.default)("foundation-web-alert-message-"), M = !!y, k = !!A, P = !!(C && x), F = "Feedback" === h && (M || k || P), _ = "Warning" === v || "Error" === v ? "alert" : "status", U = null;
            M && (U = k ? l.default.createElement(m, {
                label: y || "",
                href: f,
                linkTarget: g,
                onAction: b,
                variant: "Standard"
            }) : l.default.createElement(p, {
                label: y || "",
                href: f,
                linkTarget: g,
                onAction: b
            }));
            let V = k ? l.default.createElement(m, {
                label: A || "",
                href: T,
                linkTarget: I,
                onAction: S,
                variant: "Utility"
            }) : null;
            return l.default.createElement("div", {
                ref: a,
                role: F ? "region" : _,
                "aria-labelledby": F ? L : void 0,
                className: (0, s.default)("foundation-web-alert relative width-full stroke-standard", "System" === h ? "[border-left-width:0] [border-right-width:0]" : "radius-medium", d[v], w),
                ...N
            }, l.default.createElement("div", {
                "aria-hidden": "true",
                className: (0, s.default)("absolute inset-[0] pointer-events-none", "Feedback" === h && "radius-medium"),
                style: {
                    backgroundColor: u[v]
                }
            }), l.default.createElement("div", {
                className: "relative flex items-start gap-x-medium padding-x-large padding-y-small min-width-0"
            }, l.default.createElement("div", {
                className: "flex items-start padding-y-xsmall self-stretch shrink-0"
            }, l.default.createElement("div", {
                className: "relative flex items-start padding-y-xxsmall"
            }, "Warning" !== v && l.default.createElement("span", {
                "aria-hidden": "true",
                className: "absolute width-[10px] height-[14px] top-[5px]",
                style: {
                    left: "50%",
                    transform: "translateX(-50%)",
                    backgroundColor: "var(--dark-mode-content-emphasis)"
                }
            }), l.default.createElement(t.Icon, {
                "aria-hidden": "true",
                name: o[v],
                size: "Medium",
                className: "relative",
                style: {
                    color: c[v]
                }
            }))), l.default.createElement("div", {
                className: (0, s.default)("flex grow-1 basis-0 min-width-0 items-start gap-x-medium gap-y-small", k ? "flex-col" : "wrap")
            }, l.default.createElement("div", {
                id: F ? L : void 0,
                role: F ? _ : void 0,
                className: (0, s.default)("flex items-center padding-top-[var(--size-150)] text-body-medium text-wrap content-emphasis [overflow-wrap:anywhere]", k ? "width-full min-width-0" : "grow-1 basis-0 min-width-[min(200px,100%)]")
            }, r), (U || V) && l.default.createElement("div", {
                className: (0, s.default)("flex items-center gap-small wrap shrink-0", !k && "padding-y-[var(--size-150)]")
            }, U, V)), P && l.default.createElement(i.CloseAffordance, {
                variant: "Utility",
                size: "Medium",
                isCircular: !0,
                className: "content-emphasis shrink-0 padding-[var(--size-150)]",
                "aria-label": E,
                onClick: x
            })))
        });
    e.s(["Alert", 0, h])
}, 36482, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340);
    let n = {
            "1:1": "aspect-1-1",
            "5:4": "aspect-5-4",
            "4:5": "aspect-4-5",
            "4:3": "aspect-4-3",
            "16:9": "aspect-16-9",
            "2:1": "aspect-2-1"
        },
        r = (0, a.forwardRef)((e, r) => {
            let {
                className: i,
                aspectRatio: s = "1:1",
                alt: l,
                containerClassName: o,
                ...c
            } = e;
            return a.default.createElement("div", {
                className: (0, t.default)("foundation-web-media clip", n[s], o)
            }, a.default.createElement("img", {
                ref: r,
                className: (0, t.default)("foundation-web-media-image", i),
                alt: l,
                ...c
            }))
        });
    r.displayName = "Media", e.s(["Media", 0, r])
}, 130058, e => {
    "use strict";
    var t = e.i(489098),
        a = e.i(262069),
        n = e.i(197649),
        r = e.i(416340),
        i = e.i(425353);
    let s = e => {
            let {
                type: t,
                sideSheetSide: a = "right",
                isSideSheetFlush: s = !1,
                centerSheetSize: l = "Medium",
                children: o,
                overlayClassName: c,
                contentClassName: d,
                onOpenAutoFocus: u,
                onCloseAutoFocus: m,
                onPointerDownOutside: p,
                onEscapeKeyDown: h,
                onInteractOutside: v
            } = e;
            return r.default.createElement(i.Portal, null, r.default.createElement(i.Overlay, {
                "data-testid": "fui-base-sheet-overlay",
                "data-type": t,
                "data-side": "sideSheet" === t ? a : void 0,
                "data-flush": "sideSheet" === t ? s : void 0,
                "data-size": "centerSheet" === t ? l : void 0,
                className: (0, n.default)("fui-base-sheet-overlay", "foundation-web-portal-zindex fixed inset-[0] flex", c)
            }, r.default.createElement(i.Content, {
                "data-testid": "fui-base-sheet-content",
                className: (0, n.default)("fui-base-sheet-content relative bg-surface-100 stroke-muted stroke-standard shadow-transient-high", "flex flex-col clip", d),
                onOpenAutoFocus: u,
                onCloseAutoFocus: m,
                onPointerDownOutside: p,
                onEscapeKeyDown: h,
                onInteractOutside: v
            }, o)))
        },
        l = e => {
            let t = e.currentTarget;
            if (!t) return;
            let a = t.querySelectorAll("[data-autofocus-priority]");
            if (0 === a.length) return;
            let n = [];
            a.forEach(e => {
                let t = parseInt(e.getAttribute("data-autofocus-priority") || "", 10);
                !Number.isNaN(t) && e instanceof HTMLElement && n.push({
                    element: e,
                    priority: t
                })
            }), n.sort((e, t) => e.priority - t.priority);
            let r = n.find(e => {
                var t, a;
                return ("function" != typeof(a = t = e.element).checkVisibility || a.checkVisibility()) && !("disabled" in t && t.disabled || "true" === t.getAttribute("aria-disabled"))
            });
            if (r) {
                var i;
                e.preventDefault();
                let t = document.activeElement === r.element;
                r.element.focus(), !t && (i = r.element) instanceof HTMLInputElement && "function" == typeof i.select && i.select()
            }
        };
    var o = e.i(167878),
        c = e.i(199512);
    let d = (0, r.createContext)(null),
        u = () => {
            let e = (0, r.useContext)(d);
            if (!e) throw Error("Sheet components must be used within a Sheet");
            return e
        },
        m = "padding-x-xlarge",
        p = (0, r.forwardRef)((e, t) => {
            let {
                children: a,
                className: i,
                hasPaddingX: s = !0,
                ...l
            } = e, {
                type: o
            } = u();
            return r.default.createElement("div", {
                ref: t,
                className: (0, n.default)("scroll-y", s && m, "sideSheet" === o ? "grow-1" : "", i),
                ...l
            }, a)
        });
    p.displayName = "SheetBody", e.s(["SheetActions", 0, e => {
        let {
            children: t,
            className: i,
            ...s
        } = e;
        return r.default.createElement(r.default.Fragment, null, r.default.createElement(a.Divider, null), r.default.createElement("div", {
            className: (0, n.default)(m, "margin-y-small shrink-0", i),
            ...s
        }, t))
    }, "SheetBody", 0, p, "SheetContent", 0, e => {
        let t, {
                children: a,
                centerSheetSize: i = "Medium",
                largeScreenVariant: c = "center",
                closeLabel: u,
                className: m,
                mobilePortraitClassName: p,
                mobileLandscapeClassName: h,
                largeScreenClassName: v,
                onOpenAutoFocus: y,
                onCloseAutoFocus: f,
                onPointerDownOutside: g,
                onEscapeKeyDown: b,
                onInteractOutside: A
            } = e,
            T = (0, o.useMediaQuery)("(orientation: portrait) and (max-width: 600px)"),
            I = (0, o.useMediaQuery)("(orientation: landscape) and (max-height: 600px)");
        t = T ? "bottomSheet" : I || "side" === c ? "sideSheet" : "centerSheet";
        let S = (0, r.useMemo)(() => ({
                centerSheetSize: i,
                largeScreenVariant: c,
                closeLabel: u,
                isPortraitMobile: T,
                isLandscapeMobile: I,
                type: t
            }), [i, c, u, T, I, t]),
            C = (0, n.default)(m, T && p, I && h, !T && !I && v);
        return r.default.createElement(d.Provider, {
            value: S
        }, r.default.createElement(s, {
            type: t,
            sideSheetSide: "right",
            isSideSheetFlush: I,
            centerSheetSize: i,
            contentClassName: C,
            onOpenAutoFocus: null != y ? y : l,
            onCloseAutoFocus: f,
            onPointerDownOutside: g,
            onEscapeKeyDown: b,
            onInteractOutside: A
        }, a))
    }, "SheetDescription", 0, e => r.default.createElement(i.Description, {
        asChild: !0,
        ...e
    }), "SheetRoot", 0, e => {
        let {
            open: t,
            onOpenChange: a,
            defaultOpen: n,
            children: s
        } = e;
        return r.default.createElement(i.Root, {
            open: t,
            onOpenChange: a,
            defaultOpen: n,
            modal: !0
        }, s)
    }, "SheetTitle", 0, e => {
        let {
            className: a,
            children: s,
            navigation: l,
            utilities: o,
            visuallyHideTitleText: d
        } = e, {
            closeLabel: m
        } = u(), p = r.default.createElement(i.Title, {
            className: "text-heading-small margin-none"
        }, s);
        return r.default.createElement("div", {
            className: (0, n.default)(a, l ? "padding-left-medium" : "padding-left-xlarge", "padding-right-small padding-y-small", "flex items-center justify-between")
        }, r.default.createElement("div", {
            className: (0, n.default)("flex items-center", l && "gap-xsmall")
        }, l, d ? r.default.createElement(c.VisuallyHidden, null, p) : p), r.default.createElement("div", {
            className: (0, n.default)("flex items-center", o && "gap-xxsmall")
        }, o, r.default.createElement("div", {
            className: "fui-sheet-close-affordance-container"
        }, r.default.createElement(i.Close, {
            asChild: !0
        }, r.default.createElement(t.IconButton, {
            variant: "Utility",
            size: "Medium",
            icon: "icon-regular-x",
            ariaLabel: m || "",
            "data-autofocus-priority": "1000"
        })))))
    }, "SheetTrigger", 0, e => r.default.createElement(i.Trigger, {
        asChild: !0,
        ...e
    })], 130058)
}, 921378, e => {
    "use strict";
    var t = e.i(640409),
        a = e.i(641659),
        n = e.i(753534),
        r = e.i(197649),
        i = e.i(416340);
    let s = {
            XSmall: "padding-x-small",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-medium"
        },
        l = {
            XSmall: "padding-y-small",
            Small: "padding-y-small",
            Medium: "padding-y-small",
            Large: "padding-y-small"
        },
        o = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium",
            Large: "text-title-large"
        },
        c = {
            XSmall: ["text-body-small", "placeholder:text-body-small"],
            Small: ["text-body-small", "placeholder:text-body-small"],
            Medium: ["text-body-medium", "placeholder:text-body-medium"],
            Large: ["text-body-large", "placeholder:text-body-large"]
        },
        d = i.default.forwardRef((e, d) => {
            let {
                size: u,
                variant: m = "Standard",
                label: p,
                value: h,
                defaultValue: v,
                isDisabled: y,
                hasError: f,
                helperText: g,
                className: b,
                style: A,
                textareaClassName: T,
                textareaStyle: I,
                id: S,
                ...C
            } = e, E = (0, a.default)(), x = S || E, w = "".concat(x, "-description"), D = null != u ? u : "Large";
            return i.default.createElement("div", {
                className: (0, r.default)("flex fill flex-col width-full gap-small", {
                    [t.disabledOpacity]: y
                }, b),
                style: A
            }, p && i.default.createElement("label", {
                htmlFor: x,
                className: (0, r.default)(o[D], "content-emphasis")
            }, p), i.default.createElement("textarea", {
                ref: d,
                id: x,
                "data-testid": "text-area-container",
                style: I,
                className: (0, r.default)("foundation-web-text-area foundation-web-input outline-none", "radius-medium content-emphasis placeholder:content-muted", n.INPUT_BACKGROUND_BY_VARIANT[m], n.INPUT_STROKE_BY_VARIANT[m], f ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", c[D], s[D], l[D], T),
                value: h,
                defaultValue: null == h ? v : void 0,
                disabled: y,
                "aria-describedby": g ? w : void 0,
                ...C
            }), g && i.default.createElement("span", {
                id: w,
                className: (0, r.default)("text-caption-small", {
                    "content-system-alert": f,
                    "content-default": !f
                })
            }, g))
        });
    d.displayName = "TextArea", e.s(["TextArea", 0, d])
}, 893502, e => {
    "use strict";
    var t = e.i(477763),
        a = e.i(169336),
        n = e.i(416340),
        r = e.i(226319),
        i = e.i(928277),
        s = e.i(79888),
        l = e.i(221628),
        o = e.i(506391),
        c = e.i(823079),
        d = e.i(127633),
        u = e.i(929709),
        m = e.i(416408),
        p = e.i(442632);

    function h(e) {
        return (0, a.g)("MuiFormGroup", e)
    }(0, i.g)("MuiFormGroup", ["root", "row", "error"]);
    let v = ["className", "row"],
        y = (0, r.s)("div", {
            name: "MuiFormGroup",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: a
                } = e;
                return [t.root, a.row && t.row]
            }
        })(e => {
            let {
                ownerState: a
            } = e;
            return (0, t._)({
                display: "flex",
                flexDirection: "column",
                flexWrap: "wrap"
            }, a.row && {
                flexDirection: "row"
            })
        }),
        f = n.forwardRef(function(e, n) {
            let i = (0, p.u)({
                    props: e,
                    name: "MuiFormGroup"
                }),
                {
                    className: s,
                    row: o = !1
                } = i,
                c = (0, a._)(i, v),
                d = (0, u.u)(),
                f = (0, m.f)({
                    props: i,
                    muiFormControl: d,
                    states: ["error"]
                }),
                g = (0, t._)({}, i, {
                    row: o,
                    error: f.error
                }),
                b = (e => {
                    let {
                        classes: t,
                        row: a,
                        error: n
                    } = e;
                    return (0, r.a)({
                        root: ["root", a && "row", n && "error"]
                    }, h, t)
                })(g);
            return (0, l.jsx)(y, (0, t._)({
                className: (0, r.c)(b.root, s),
                ownerState: g,
                ref: n
            }, c))
        });
    var g = e.i(91375),
        b = e.i(588393),
        A = e.i(520091),
        T = e.i(576070);
    e.i(802400);
    var I = e.i(811550);

    function S(e) {
        return (0, a.g)("MuiRadioGroup", e)
    }(0, i.g)("MuiRadioGroup", ["root", "row", "error"]);
    let C = ["actions", "children", "className", "defaultValue", "name", "onChange", "value"],
        E = n.forwardRef(function(e, i) {
            let {
                actions: u,
                children: m,
                className: p,
                defaultValue: h,
                name: v,
                onChange: y,
                value: g
            } = e, b = (0, a._)(e, C), A = n.useRef(null), T = (e => {
                let {
                    classes: t,
                    row: a,
                    error: n
                } = e;
                return (0, r.a)({
                    root: ["root", a && "row", n && "error"]
                }, S, t)
            })(e), [I, E] = (0, o.u)({
                controlled: g,
                default: h,
                name: "RadioGroup"
            });
            n.useImperativeHandle(u, () => ({
                focus: () => {
                    let e = A.current.querySelector("input:not(:disabled):checked");
                    e || (e = A.current.querySelector("input:not(:disabled)")), e && e.focus()
                }
            }), []);
            let x = (0, c.u)(i, A),
                w = (0, d.u)(v),
                D = n.useMemo(() => ({
                    name: w,
                    onChange(e) {
                        E(e.target.value), y && y(e, e.target.value)
                    },
                    value: I
                }), [w, y, E, I]);
            return (0, l.jsx)(s.R.Provider, {
                value: D,
                children: (0, l.jsx)(f, (0, t._)({
                    role: "radiogroup",
                    ref: x,
                    className: (0, r.c)(T.root, p)
                }, b, {
                    children: m
                }))
            })
        });
    var x = (0, b.c)((0, l.jsx)("path", {
            d: "M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"
        }), "Star"),
        w = (0, b.c)((0, l.jsx)("path", {
            d: "M22 9.24l-7.19-.62L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21 12 17.27 18.18 21l-1.63-7.03L22 9.24zM12 15.4l-3.76 2.27 1-4.28-3.32-2.88 4.38-.38L12 6.1l1.71 4.04 4.38.38-3.32 2.88 1 4.28L12 15.4z"
        }), "StarBorder");

    function D(e) {
        return (0, a.g)("MuiRating", e)
    }
    var N = (0, i.g)("MuiRating", ["root", "sizeSmall", "sizeMedium", "sizeLarge", "readOnly", "disabled", "focusVisible", "visuallyHidden", "pristine", "label", "labelEmptyValueActive", "icon", "iconEmpty", "iconFilled", "iconHover", "iconFocus", "iconActive", "decimal"]);
    let L = ["value"],
        M = ["className", "defaultValue", "disabled", "emptyIcon", "emptyLabelText", "getLabelText", "highlightSelectedOnly", "icon", "IconContainerComponent", "max", "name", "onChange", "onChangeActive", "onMouseLeave", "onMouseMove", "precision", "readOnly", "size", "value"];

    function k(e, t) {
        let a;
        return null == e ? e : Number((Math.round(e / t) * t).toFixed((a = t.toString().split(".")[1]) ? a.length : 0))
    }
    let P = (0, r.s)("span", {
            name: "MuiRating",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: n
                } = e;
                return [{
                    ["& .".concat(N.visuallyHidden)]: t.visuallyHidden
                }, t.root, t["size".concat((0, a.a)(n.size))], n.readOnly && t.readOnly]
            }
        })(e => {
            let {
                theme: a,
                ownerState: n
            } = e;
            return (0, t._)({
                display: "inline-flex",
                position: "relative",
                fontSize: a.typography.pxToRem(24),
                color: "#faaf00",
                cursor: "pointer",
                textAlign: "left",
                width: "min-content",
                WebkitTapHighlightColor: "transparent",
                ["&.".concat(N.disabled)]: {
                    opacity: (a.vars || a).palette.action.disabledOpacity,
                    pointerEvents: "none"
                },
                ["&.".concat(N.focusVisible, " .").concat(N.iconActive)]: {
                    outline: "1px solid #999"
                },
                ["& .".concat(N.visuallyHidden)]: A.v
            }, "small" === n.size && {
                fontSize: a.typography.pxToRem(18)
            }, "large" === n.size && {
                fontSize: a.typography.pxToRem(30)
            }, n.readOnly && {
                pointerEvents: "none"
            })
        }),
        F = (0, r.s)("label", {
            name: "MuiRating",
            slot: "Label",
            overridesResolver: (e, t) => {
                let {
                    ownerState: a
                } = e;
                return [t.label, a.emptyValueFocused && t.labelEmptyValueActive]
            }
        })(e => {
            let {
                ownerState: a
            } = e;
            return (0, t._)({
                cursor: "inherit"
            }, a.emptyValueFocused && {
                top: 0,
                bottom: 0,
                position: "absolute",
                outline: "1px solid #999",
                width: "100%"
            })
        }),
        _ = (0, r.s)("span", {
            name: "MuiRating",
            slot: "Icon",
            overridesResolver: (e, t) => {
                let {
                    ownerState: a
                } = e;
                return [t.icon, a.iconEmpty && t.iconEmpty, a.iconFilled && t.iconFilled, a.iconHover && t.iconHover, a.iconFocus && t.iconFocus, a.iconActive && t.iconActive]
            }
        })(e => {
            let {
                theme: a,
                ownerState: n
            } = e;
            return (0, t._)({
                display: "flex",
                transition: a.transitions.create("transform", {
                    duration: a.transitions.duration.shortest
                }),
                pointerEvents: "none"
            }, n.iconActive && {
                transform: "scale(1.2)"
            }, n.iconEmpty && {
                color: (a.vars || a).palette.action.disabled
            })
        }),
        U = (0, r.s)("span", {
            name: "MuiRating",
            slot: "Decimal",
            shouldForwardProp: e => (0, r.b)(e) && "iconActive" !== e,
            overridesResolver: (e, t) => {
                let {
                    iconActive: a
                } = e;
                return [t.decimal, a && t.iconActive]
            }
        })(e => {
            let {
                iconActive: a
            } = e;
            return (0, t._)({
                position: "relative"
            }, a && {
                transform: "scale(1.2)"
            })
        });

    function V(e) {
        let n = (0, a._)(e, L);
        return (0, l.jsx)("span", (0, t._)({}, n))
    }

    function R(e) {
        let {
            classes: a,
            disabled: i,
            emptyIcon: s,
            focus: o,
            getLabelText: c,
            highlightSelectedOnly: u,
            hover: m,
            icon: p,
            IconContainerComponent: h,
            isActive: v,
            itemValue: y,
            labelProps: f,
            name: g,
            onBlur: b,
            onChange: A,
            onClick: T,
            onFocus: I,
            readOnly: S,
            ownerState: C,
            ratingValue: E,
            ratingValueRounded: x
        } = e, w = u ? y === E : y <= E, D = y <= m, N = y <= o, L = y === x, M = (0, d.u)(), k = (0, l.jsx)(_, {
            as: h,
            value: y,
            className: (0, r.c)(a.icon, w ? a.iconFilled : a.iconEmpty, D && a.iconHover, N && a.iconFocus, v && a.iconActive),
            ownerState: (0, t._)({}, C, {
                iconEmpty: !w,
                iconFilled: w,
                iconHover: D,
                iconFocus: N,
                iconActive: v
            }),
            children: s && !w ? s : p
        });
        return S ? (0, l.jsx)("span", (0, t._)({}, f, {
            children: k
        })) : (0, l.jsxs)(n.Fragment, {
            children: [(0, l.jsxs)(F, (0, t._)({
                ownerState: (0, t._)({}, C, {
                    emptyValueFocused: void 0
                }),
                htmlFor: M
            }, f, {
                children: [k, (0, l.jsx)("span", {
                    className: a.visuallyHidden,
                    children: c(y)
                })]
            })), (0, l.jsx)("input", {
                className: a.visuallyHidden,
                onFocus: I,
                onBlur: b,
                onChange: A,
                onClick: T,
                disabled: i,
                value: y,
                id: M,
                type: "radio",
                name: g,
                checked: L
            })]
        })
    }
    let B = (0, l.jsx)(x, {
            fontSize: "inherit"
        }),
        O = (0, l.jsx)(w, {
            fontSize: "inherit"
        });

    function j(e) {
        return "".concat(e, " Star").concat(1 !== e ? "s" : "")
    }
    n.forwardRef(function(e, i) {
        let s = (0, p.u)({
                name: "MuiRating",
                props: e
            }),
            {
                className: u,
                defaultValue: m = null,
                disabled: h = !1,
                emptyIcon: v = O,
                emptyLabelText: y = "Empty",
                getLabelText: f = j,
                highlightSelectedOnly: b = !1,
                icon: A = B,
                IconContainerComponent: S = V,
                max: C = 5,
                name: E,
                onChange: x,
                onChangeActive: w,
                onMouseLeave: N,
                onMouseMove: L,
                precision: _ = 1,
                readOnly: G = !1,
                size: K = "medium",
                value: H
            } = s,
            z = (0, a._)(s, M),
            q = (0, d.u)(E),
            [W, Y] = (0, o.u)({
                controlled: H,
                default: m,
                name: "Rating"
            }),
            X = k(W, _),
            Q = (0, g.u)(),
            [{
                hover: J,
                focus: Z
            }, $] = n.useState({
                hover: -1,
                focus: -1
            }),
            ee = X; - 1 !== J && (ee = J), -1 !== Z && (ee = Z);
        let {
            isFocusVisibleRef: et,
            onBlur: ea,
            onFocus: en,
            ref: er
        } = (0, T.u)(), [ei, es] = n.useState(!1), el = n.useRef(), eo = (0, c.u)(er, el, i), ec = e => {
            let t = "" === e.target.value ? null : parseFloat(e.target.value); - 1 !== J && (t = J), Y(t), x && x(e, t)
        }, ed = e => {
            0 === e.clientX && 0 === e.clientY || ($({
                hover: -1,
                focus: -1
            }), Y(null), x && parseFloat(e.target.value) === X && x(e, null))
        }, eu = e => {
            en(e), !0 === et.current && es(!0);
            let t = parseFloat(e.target.value);
            $(e => ({
                hover: e.hover,
                focus: t
            }))
        }, em = e => {
            -1 === J && (ea(e), !1 === et.current && es(!1), $(e => ({
                hover: e.hover,
                focus: -1
            })))
        }, [ep, eh] = n.useState(!1), ev = (0, t._)({}, s, {
            defaultValue: m,
            disabled: h,
            emptyIcon: v,
            emptyLabelText: y,
            emptyValueFocused: ep,
            focusVisible: ei,
            getLabelText: f,
            icon: A,
            IconContainerComponent: S,
            max: C,
            precision: _,
            readOnly: G,
            size: K
        }), ey = (e => {
            let {
                classes: t,
                size: n,
                readOnly: i,
                disabled: s,
                emptyValueFocused: l,
                focusVisible: o
            } = e, c = {
                root: ["root", "size".concat((0, a.a)(n)), s && "disabled", o && "focusVisible", i && "readOnly"],
                label: ["label", "pristine"],
                labelEmptyValue: [l && "labelEmptyValueActive"],
                icon: ["icon"],
                iconEmpty: ["iconEmpty"],
                iconFilled: ["iconFilled"],
                iconHover: ["iconHover"],
                iconFocus: ["iconFocus"],
                iconActive: ["iconActive"],
                decimal: ["decimal"],
                visuallyHidden: ["visuallyHidden"]
            };
            return (0, r.a)(c, D, t)
        })(ev);
        return (0, l.jsxs)(P, (0, t._)({
            ref: eo,
            onMouseMove: e => {
                L && L(e);
                let {
                    right: t,
                    left: a,
                    width: n
                } = el.current.getBoundingClientRect(), r = k(C * (Q ? (t - e.clientX) / n : (e.clientX - a) / n) + _ / 2, _);
                r = (0, I.c)(r, _, C), $(e => e.hover === r && e.focus === r ? e : {
                    hover: r,
                    focus: r
                }), es(!1), w && J !== r && w(e, r)
            },
            onMouseLeave: e => {
                N && N(e), $({
                    hover: -1,
                    focus: -1
                }), w && -1 !== J && w(e, -1)
            },
            className: (0, r.c)(ey.root, u, G && "MuiRating-readOnly"),
            ownerState: ev,
            role: G ? "img" : null,
            "aria-label": G ? f(ee) : null
        }, z, {
            children: [Array.from(Array(C)).map((e, a) => {
                let n = a + 1,
                    i = {
                        classes: ey,
                        disabled: h,
                        emptyIcon: v,
                        focus: Z,
                        getLabelText: f,
                        highlightSelectedOnly: b,
                        hover: J,
                        icon: A,
                        IconContainerComponent: S,
                        name: q,
                        onBlur: em,
                        onChange: ec,
                        onClick: ed,
                        onFocus: eu,
                        ratingValue: ee,
                        ratingValueRounded: X,
                        readOnly: G,
                        ownerState: ev
                    },
                    s = n === Math.ceil(ee) && (-1 !== J || -1 !== Z);
                if (_ < 1) {
                    let e = Array.from(Array(1 / _));
                    return (0, l.jsx)(U, {
                        className: (0, r.c)(ey.decimal, s && ey.iconActive),
                        ownerState: ev,
                        iconActive: s,
                        children: e.map((a, r) => {
                            let s = k(n - 1 + (r + 1) * _, _);
                            return (0, l.jsx)(R, (0, t._)({}, i, {
                                isActive: !1,
                                itemValue: s,
                                labelProps: {
                                    style: e.length - 1 === r ? {} : {
                                        width: s === ee ? (r + 1) * _ * 100 + "%" : "0%",
                                        overflow: "hidden",
                                        position: "absolute"
                                    }
                                }
                            }), s)
                        })
                    }, n)
                }
                return (0, l.jsx)(R, (0, t._)({}, i, {
                    isActive: s,
                    itemValue: n
                }), n)
            }), !G && !h && (0, l.jsxs)(F, {
                className: (0, r.c)(ey.label, ey.labelEmptyValue),
                ownerState: ev,
                children: [(0, l.jsx)("input", {
                    className: ey.visuallyHidden,
                    value: "",
                    id: "".concat(q, "-empty"),
                    type: "radio",
                    name: q,
                    checked: null == X,
                    onFocus: () => eh(!0),
                    onBlur: () => eh(!1),
                    onChange: ec
                }), (0, l.jsx)("span", {
                    className: ey.visuallyHidden,
                    children: y
                })]
            })]
        }))
    }), e.s(["RadioGroup", 0, E], 893502)
}, 801913, e => {
    "use strict";
    var t = e.i(484613);
    e.s(["ArrowDownwardIcon", () => t.ArrowDownward])
}, 699297, e => {
    "use strict";
    var t = e.i(484613);
    e.s(["ArrowUpwardIcon", () => t.ArrowUpward])
}]);

//# debugId=8dc475ed-bae0-8ee2-86f7-111aad6e9dca
//# sourceMappingURL=0w44k_lqv6mp-.js.map