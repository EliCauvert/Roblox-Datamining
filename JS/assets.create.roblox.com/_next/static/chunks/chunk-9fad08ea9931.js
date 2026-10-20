;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "d060f89b-1db0-2134-cd32-47f1834d0bda")
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
        d = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isMomentsPostCreationEnabled",
            defaultValue: !1
        });
    e.s(["isBadgeDefaultIconEnabled", 0, a, "isMomentsFeedIdEnabled", 0, l, "isMomentsPostCreationEnabled", 0, d, "isMomentsShareLinkEnabled", 0, o, "isMomentsSitetestUrlParsingEnabled", 0, r, "isMomentsUploadEnabled", 0, n, "isMomentsUploadLanguageSelectEnabled", 0, s, "isTextDocumentEnabled", 0, i])
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
        d = e.i(338653);
    let c = (0, a.createContext)({
        isAffiliateProgramLoading: !1,
        requiresActionToJoinProgram: void 0,
        compliantWithAllUserRequirements: void 0,
        creatorMetadata: void 0,
        isCurrentUserGroupOwner: void 0,
        isGroupEligible: void 0
    });
    c.displayName = "AffiliateProgram";
    let u = (0, r.withTranslation)(e => {
        let {
            children: r
        } = e, {
            user: l
        } = (0, i.useAuthentication)(), u = (0, o.useCurrentGroup)(), [m, p] = (0, a.useState)(void 0), [h, f] = (0, a.useState)(), [y, g] = (0, a.useState)(), [v, A] = (0, a.useState)(), [T, b] = (0, a.useState)(), I = (0, a.useMemo)(() => {
            var e;
            return (null != (e = null == u ? void 0 : u.id) ? e : 0) !== 0
        }, [u]), [E, S] = (0, a.useState)(void 0), C = void 0 === m || void 0 === h || void 0 === y && I, x = (0, a.useCallback)(async () => {
            try {
                if (I && (null == u ? void 0 : u.id)) {
                    let e = await (0, d.getGroupCreatorMetadata)(u.id);
                    p(e);
                    return
                }
                if (!I && (null == l ? void 0 : l.id)) {
                    let e = await (0, d.getUserCreatorMetadata)();
                    p(e);
                    return
                }
            } catch (e) {
                return
            }
            p(null)
        }, [null == u ? void 0 : u.id, I, null == l ? void 0 : l.id]), w = (0, a.useCallback)(async () => {
            if (I && E || !I) try {
                let e = await (0, d.getRequirements)();
                f(e.requirements);
                return
            } catch (e) {
                return
            }
            f(null)
        }, [E, I]), k = (0, a.useCallback)(async () => {
            if (I && (null == u ? void 0 : u.id)) try {
                let e = await (0, d.getGroupEligibility)(u.id);
                g(e.isEligible)
            } catch (e) {
                g(!1)
            }
        }, [u, I]);
        (0, a.useEffect)(() => {
            C ? b(void 0) : I && !E ? b(!1) : b(!1 === v)
        }, [I, E, v, C]), (0, a.useEffect)(() => {
            (async () => {
                if (I && (null == u ? void 0 : u.id)) {
                    var e;
                    return null == (e = (await s.default.getGroupInfo(u.id)).owner) ? void 0 : e.userId
                }
            })().then(e => {
                e && l && S(e === l.id)
            })
        }, [null == u ? void 0 : u.id, I, l]), (0, a.useEffect)(() => {
            C || !h || I && !E ? A(void 0) : A((null == h ? void 0 : h.length) === 0 || (null == h ? void 0 : h.length) === 1 && h[0] === n.Requirements.Payable)
        }, [E, I, C, h]), (0, a.useEffect)(() => {
            x()
        }, [x]), (0, a.useEffect)(() => {
            w()
        }, [w]), (0, a.useEffect)(() => {
            k()
        }, [k]);
        let D = (0, a.useMemo)(() => ({
            isAffiliateProgramLoading: C,
            requiresActionToJoinProgram: T,
            compliantWithAllUserRequirements: v,
            creatorMetadata: null != m ? m : void 0,
            requirements: null != h ? h : void 0,
            isCurrentUserGroupOwner: E,
            isGroupEligible: null != y ? y : void 0
        }), [C, T, v, m, h, E, y]);
        return (0, t.jsx)(c.Provider, {
            value: D,
            children: r
        })
    }, [l.TranslationNamespace.Organization]);
    e.s(["default", 0, u, "useAffiliateProgram", 0, function() {
        return (0, a.useContext)(c)
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
        i = e.i(335681),
        s = e.i(367808),
        l = e.i(686762),
        o = e.i(623983),
        d = e.i(748893),
        c = e.i(649114),
        u = e.i(15645),
        m = e.i(358763),
        p = e.i(889311),
        h = e.i(823062),
        f = e.i(881670),
        y = e.i(904969),
        g = e.i(906791);
    let v = (0, e.i(697973).makeStyles)()(e => ({
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
    e.s(["default", 0, v], 540082);
    var A = ((t = {}).Home = "home", t.Creations = "creations", t);
    let T = (0, r.withTranslation)(e => {
        let t, f, A, T, {
                trackingPage: b,
                alertRedesignVariant: I
            } = e,
            {
                isBannerVisible: E,
                isHighPriority: S,
                variant: C,
                dismissBanner: x
            } = (0, g.useAgeVerificationUpsellContext)(),
            {
                classes: w
            } = v(),
            k = (0, n.useRef)(null),
            {
                unifiedLogger: D
            } = (0, h.useUnifiedLoggerProvider)(),
            {
                translate: N
            } = (0, r.useTranslation)(),
            P = (0, n.useCallback)(() => {
                E && D.logImpressionEvent({
                    eventName: p.default.AgeVerificationUpsellBanner,
                    parameters: {
                        page: b,
                        variant: C,
                        ...I && {
                            alertRedesignVariant: I
                        }
                    }
                })
            }, [D, b, C, I, E]);
        (0, m.default)(k, P);
        let L = (0, n.useCallback)(() => {
                D.logClickEvent({
                    eventName: p.default.AgeVerificationUpsellBannerClick,
                    parameters: {
                        page: b,
                        action: "viewDetails",
                        variant: C,
                        ...I && {
                            alertRedesignVariant: I
                        }
                    }
                })
            }, [D, b, C, I]),
            M = (0, n.useCallback)(() => {
                D.logClickEvent({
                    eventName: p.default.AgeVerificationUpsellBannerClick,
                    parameters: {
                        page: b,
                        action: "callToAction",
                        variant: C,
                        ...I && {
                            alertRedesignVariant: I
                        }
                    }
                })
            }, [D, b, C, I]),
            _ = (0, n.useCallback)(() => {
                D.logClickEvent({
                    eventName: p.default.AgeVerificationUpsellBannerClick,
                    parameters: {
                        page: b,
                        action: "dismiss",
                        variant: C,
                        ...I && {
                            alertRedesignVariant: I
                        }
                    }
                }), x()
            }, [D, x, b, C, I]);
        return ("establishTrust" === C ? (t = "Title.EstablishTrustBanner", f = "Label.EstablishTrustBanner2", A = y.ESTABLISH_TRUST_UPSELL_GET_STARTED_URL, T = y.ESTABLISH_TRUST_UPSELL_VIEW_DETAILS_URL) : (t = "Title.AgeVerificationBanner", f = "Label.AgeVerificationBanner", A = y.AGE_VERIFICATION_UPSELL_GET_STARTED_URL, T = y.AGE_VERIFICATION_UPSELL_VIEW_DETAILS_URL), E) ? (0, a.jsx)("div", {
            ref: k,
            children: (0, a.jsxs)(i.Alert, {
                className: w.alertContainer,
                severity: "ageVerification" === C && S ? "warning" : "info",
                variant: "filled",
                action: [(0, a.jsx)(d.Button, {
                    href: A,
                    onClick: M,
                    className: w.getStarted,
                    color: "inherit",
                    size: "small",
                    children: N("Label.AgeVerificationBannerGetStarted")
                }, "getStarted"), (0, a.jsx)(c.IconButton, {
                    color: "inherit",
                    size: "medium",
                    "aria-label": "dismiss",
                    onClick: _,
                    children: (0, a.jsx)(u.CloseIcon, {})
                }, "dismiss")],
                children: [(0, a.jsx)(s.AlertTitle, {
                    children: N(t)
                }), (0, a.jsx)(o.Typography, {
                    variant: "body2",
                    children: N(f)
                }), " ", (0, a.jsx)(l.Link, {
                    className: w.viewDetails,
                    href: T,
                    target: "_blank",
                    color: "inherit",
                    onClick: L,
                    children: N("Label.AgeVerificationBannerViewDetails")
                })]
            })
        }) : null
    }, [f.TranslationNamespace.Home]);
    e.s(["AgeVerificationUpsellBanner", 0, T, "AgeVerificationUpsellPage", () => A], 714039)
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
        d = async () => {
            localStorage.removeItem(o)
        }, c = async () => {
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
                return d(), !1
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
        } = e, [o, d] = (0, a.useState)(!0), [f, y] = (0, a.useState)("doNotShow"), {
            isFetched: g,
            user: v
        } = (0, n.useRobloxAuthentication)(), {
            unifiedLogger: A
        } = (0, i.useUnifiedLoggerProvider)(), {
            isHighPriority: T,
            isEnabled: b
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
            await u(), d(!0)
        }, [d]);
        (0, a.useEffect)(() => {
            b && g && (null == v ? void 0 : v.id) && (async () => {
                let e = !1;
                try {
                    e = await c()
                } catch (e) {
                    A.logErrorEvent({
                        eventName: r.default.AgeVerificationUpsellBannerError,
                        parameters: {
                            branch: "isDismissedToday",
                            error: e instanceof Error ? e.message : String(e)
                        }
                    })
                }
                d(e);
                let t = "doNotShow";
                try {
                    t = await h()
                } catch (e) {
                    A.logErrorEvent({
                        eventName: r.default.AgeVerificationUpsellBannerError,
                        parameters: {
                            branch: "getEligibility",
                            error: e instanceof Error ? e.message : String(e)
                        }
                    })
                }
                y(t)
            })().catch(e => {
                A.logErrorEvent({
                    eventName: r.default.AgeVerificationUpsellBannerError,
                    parameters: {
                        branch: "runAsync",
                        error: e instanceof Error ? e.message : String(e)
                    }
                })
            })
        }, [b, g, v, A]);
        let E = (0, a.useMemo)(() => {
            let e = b && "doNotShow" !== f;
            return {
                isBannerVisible: e && !o,
                isBannerEligible: e,
                isHighPriority: T,
                variant: "doNotShow" !== f ? f : "ageVerification",
                dismissBanner: I
            }
        }, [b, f, o, T, I]);
        return (0, t.jsx)(m.Provider, {
            value: E,
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
        i = e.i(41466),
        s = e.i(197649),
        l = e.i(79187),
        o = e.i(345886),
        d = e.i(29929),
        c = e.i(889311),
        u = e.i(215955),
        m = e.i(227700),
        p = e.i(881670),
        h = e.i(114209),
        f = e.i(373736),
        y = e.i(917852),
        g = e.i(576069),
        v = e.i(663563);
    let A = "".concat("https://assets.create.roblox.com/69d9311ee1fa8cbb9f4517d1f51b70a6b24d0afc/assets", "/home/publish_eligibility_banner.webp"),
        T = (0, l.withTranslation)(e => {
            var T;
            let {
                universeId: b,
                showCallToAction: I = !0
            } = e, E = (0, n.useRouter)(), {
                translateWithNamespace: S
            } = (0, l.useTranslation)(), {
                params: C,
                isFetched: x
            } = (0, m.useIXPParameters)(d.IXPLayers.CreatorHubCreationsPermission), w = C[d.CreatorHubCreationsPermissionParameters.EnableAudienceReachGrowthOpportunitiesBanner], {
                gameDetails: k
            } = (0, h.useCurrentGame)(), D = null == k ? void 0 : k.id, N = null != b ? b : D && D > 0 ? D : void 0, {
                data: P,
                isLoading: L,
                isFetching: M
            } = (0, g.useCreatorEligibility)(), _ = (0, a.useRef)(!1), [U, F] = (0, a.useState)(!1), V = (null == P ? void 0 : P.ageBracket) === r.AgeBracketEnum.Over18, B = (null == P ? void 0 : P.ageBracket) === r.AgeBracketEnum.Between13And18, R = null != (T = null == P ? void 0 : P.creatorEligibility.includes(r.CreatorEligibilityEnum.IdVerified)) && T, O = V || B, j = x && w && !(L || M) && !!P && !R;
            (0, a.useEffect)(() => {
                j && !_.current && (_.current = !0, u.default.logImpressionEvent({
                    eventName: c.default.AudienceReachGrowthOpportunitiesBannerImpression,
                    parameters: {
                        page: "audienceReach",
                        ctaType: O ? "start" : "viewDetails",
                        ctaHidden: String(!I),
                        ...N ? {
                            universeId: String(N)
                        } : {}
                    }
                }))
            }, [j, I, O, N]);
            let G = (0, a.useCallback)(() => {
                if (!j) return;
                let e = O ? "start" : "viewDetails";
                (u.default.logClickEvent({
                    eventName: c.default.AudienceReachGrowthOpportunitiesBannerClick,
                    parameters: {
                        page: "audienceReach",
                        action: e,
                        ...N ? {
                            universeId: String(N)
                        } : {}
                    }
                }), B) ? F(!0): O || E.push("/settings/eligibility/publishing-permissions")
            }, [j, B, E, O, N]);
            return j ? (0, t.jsxs)(o.Grid, {
                item: !0,
                container: !0,
                direction: "row",
                paddingBottom: 4,
                children: [(0, t.jsxs)("div", {
                    className: (0, s.clsx)(v.default.heroBanner, "relative width-full flex items-center bg-surface-200 radius-large"),
                    children: [(0, t.jsx)("img", {
                        src: A,
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
                        className: (0, s.clsx)(v.default.heroTextContent, "dark-theme relative flex flex-col gap-medium padding-[32px]"),
                        children: [(0, t.jsxs)("div", {
                            children: [(0, t.jsxs)("div", {
                                className: "text-heading-medium content-emphasis",
                                children: [S(p.TranslationNamespace.AudienceReach, "Heading.ExpandGrowthOpportunities"), " "]
                            }), (0, t.jsx)("div", {
                                className: "text-body-medium content-emphasis",
                                children: S(p.TranslationNamespace.AudienceReach, "Description.ExpandGrowthOpportunities")
                            })]
                        }), (0, t.jsx)("div", {
                            className: (0, s.clsx)(v.default.buttonRow, "flex gap-small"),
                            children: I ? V ? (0, t.jsx)(i.Button, {
                                as: "a",
                                href: y.idVerificationActionUrl,
                                target: "_blank",
                                rel: "noopener noreferrer",
                                onClick: G,
                                children: (0, t.jsx)("span", {
                                    children: S(p.TranslationNamespace.AudienceReach, O ? "Action.Start" : "Action.ViewDetails")
                                })
                            }) : (0, t.jsx)(i.Button, {
                                onClick: G,
                                children: (0, t.jsx)("span", {
                                    children: S(p.TranslationNamespace.AudienceReach, O ? "Action.Start" : "Action.ViewDetails")
                                })
                            }) : null
                        })]
                    })]
                }), B ? (0, t.jsx)(f.default, {
                    open: U,
                    onOpenChange: F,
                    onContinueWithId: () => {
                        window.open(y.idVerificationActionUrl, "_blank", "noopener,noreferrer"), F(!1)
                    },
                    onAddParent: () => {
                        window.open(y.parentLinkActionUrl, "_blank", "noopener,noreferrer"), F(!1)
                    }
                }) : null]
            }) : null
        }, [p.TranslationNamespace.AudienceReach, p.TranslationNamespace.PublicPublish]);
    e.s(["default", 0, T])
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
        d = e.i(671376),
        c = e.i(117236);
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
                queryFn: c.getAvatarItemsEntryPointAssetTypes,
                enabled: e,
                staleTime: 3e5
            }),
            i = n.data,
            u = (0, t.useMemo)(() => {
                var e, t;
                return {
                    enableMakeupAssets: null != (e = null == i ? void 0 : i.has(d.Asset.EyeMakeup)) && e,
                    enableAvatarBackgrounds: null != (t = null == i ? void 0 : i.has(d.Asset.AvatarBackground)) && t
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
            activeTab: d,
            filterIndex: c
        }] = (0, a.useQueryParams)(["activeTab", "filterIndex"]), {
            l1Options: m,
            categories: p,
            isLoading: h
        } = u(e), f = (0, i.isAllAssetTypesActiveTab)(d) || (0, i.isRecentsActiveTab)(d) || (0, i.isAvatarLooksActiveTab)(d) ? void 0 : null != (s = (0, i.parseTaxonomyActiveTab)(d)) ? s : null == (o = m[0]) ? void 0 : o.taxonomyKey, y = (0, t.useMemo)(() => (0, r.findL1Category)(p, f), [p, f]), g = (0, t.useMemo)(() => (0, r.buildTaxonomyL2Options)(y), [y]), v = parseInt(null != (l = null == c ? void 0 : c.toString()) ? l : "", 10), A = (0, n.isValidIndex)(v, g) ? v : 0, T = (0, t.useMemo)(() => {
            if (y) return g.length > 0 ? g[A] : y.webStableId ? (0, r.categoryToDropdown)(y) : void 0
        }, [y, g, A]);
        return {
            l1Options: m,
            activeL1Key: f,
            activeL1Node: y,
            l2Options: g,
            filterIndex: A,
            selection: T,
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

    function d(e, t) {
        var a;
        return (null != (a = e.assetTypeIds) ? a : []).some(e => t.has(e))
    }

    function c(e) {
        var t;
        return !0 === e.isPublishable || !!d(e, l) || (null != (t = e.bundleTypeIds) ? t : []).some(e => o.has(e))
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
                if (!c(e) || d(e, l) && !t.enableAvatarBackgrounds || !e.webStableId) return;
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
                if (d(e, s)) {
                    t.enableMakeupAssets && (h = !0, p.push(e));
                    return
                }
                if (c(e)) {
                    if (d(e, i)) return void r.push(e);
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
        d = r.Asset.HairAccessory;

    function c(e) {
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
    e.s(["ALL_ASSET_TYPES_L1_KEY", 0, "all", "AVATAR_ITEMS_ACTIVE_TAB", 0, l, "AVATAR_LOOKS_L1_KEY", 0, u, "TAXONOMY_HOST_ASSET", 0, d, "buildTaxonomyActiveTab", 0, function(e) {
        return e ? "".concat(o).concat(e) : l
    }, "isAllAssetTypesActiveTab", 0, function(e) {
        return "all" === c(e)
    }, "isAvatarLooksActiveTab", 0, function(e) {
        return c(e) === u
    }, "isRecentsActiveTab", 0, function(e) {
        return "Recents" === (0, i.readQueryValue)(e) || "recents" === c(e)
    }, "isTaxonomyActiveTab", 0, function(e) {
        var t;
        let a = (0, i.readQueryValue)(e);
        return a === l || null != (t = null == a ? void 0 : a.startsWith(o)) && t
    }, "isTaxonomyEligibleAssetTab", 0, p, "parseTaxonomyActiveTab", 0, c, "shouldOpenTaxonomyView", 0, function(e) {
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
}, 704443, e => {
    "use strict";
    var t = e.i(671376);
    e.s(["getSortForAssetType", 0, function(e, a) {
        return e === t.Asset.UpcomingEvent || e === t.Asset.PastEvent || e === t.Asset.DraftEvent ? a[e] : a[t.Asset.Place]
    }])
}, 211461, e => {
    "use strict";
    var t, a, n = e.i(102211),
        r = e.i(899441),
        i = e.i(361738),
        s = e.i(671376),
        l = ((t = {}).All = "All", t),
        o = ((a = {}).All = "All", a);
    let d = {
            created: {
                ascending: "created_asc",
                descending: "created_desc"
            },
            updated: {
                ascending: "updated_asc",
                descending: "updated_desc"
            }
        },
        c = [r.CreatorInventoryAssetType.Model, r.CreatorInventoryAssetType.Plugin, r.CreatorInventoryAssetType.Audio, r.CreatorInventoryAssetType.Decal, r.CreatorInventoryAssetType.Image, r.CreatorInventoryAssetType.Video, r.CreatorInventoryAssetType.Mesh, r.CreatorInventoryAssetType.MeshPart, r.CreatorInventoryAssetType.Animation],
        u = [...c, r.CreatorInventoryAssetType.TextDocument],
        m = new Set([r.CreatorInventoryAssetType.Audio, r.CreatorInventoryAssetType.Decal, r.CreatorInventoryAssetType.MeshPart, r.CreatorInventoryAssetType.TextDocument, r.CreatorInventoryAssetType.Video]),
        p = new Set([...m, r.CreatorInventoryAssetType.Image]),
        h = new Set(u),
        f = new Set([r.CreatorInventoryAssetType.TextDocument]),
        y = new Set(["All", i.CreatorInventorySourceType.Created, i.CreatorInventorySourceType.Purchased, i.CreatorInventorySourceType.Shared]),
        g = new Set([s.Asset.Animation, s.Asset.Audio, s.Asset.Decal, s.Asset.Image, s.Asset.Mesh, s.Asset.MeshPart, s.Asset.Model, s.Asset.Plugin, s.Asset.Video]),
        v = {
            [r.CreatorInventoryAssetType.Animation]: s.Asset.Animation,
            [r.CreatorInventoryAssetType.Audio]: s.Asset.Audio,
            [r.CreatorInventoryAssetType.Decal]: s.Asset.Decal,
            [r.CreatorInventoryAssetType.Image]: s.Asset.Image,
            [r.CreatorInventoryAssetType.Mesh]: s.Asset.Mesh,
            [r.CreatorInventoryAssetType.MeshPart]: s.Asset.MeshPart,
            [r.CreatorInventoryAssetType.Model]: s.Asset.Model,
            [r.CreatorInventoryAssetType.Plugin]: s.Asset.Plugin,
            [r.CreatorInventoryAssetType.TextDocument]: s.Asset.TextDocument,
            [r.CreatorInventoryAssetType.Video]: s.Asset.Video
        },
        A = {
            [r.CreatorInventoryAssetType.Animation]: n.AssetType.Animation,
            [r.CreatorInventoryAssetType.Audio]: n.AssetType.Audio,
            [r.CreatorInventoryAssetType.Decal]: n.AssetType.Decal,
            [r.CreatorInventoryAssetType.Image]: n.AssetType.Image,
            [r.CreatorInventoryAssetType.Mesh]: n.AssetType.Mesh,
            [r.CreatorInventoryAssetType.MeshPart]: n.AssetType.MeshPart,
            [r.CreatorInventoryAssetType.Model]: n.AssetType.Model,
            [r.CreatorInventoryAssetType.Plugin]: n.AssetType.Plugin,
            [r.CreatorInventoryAssetType.TextDocument]: n.AssetType.TextDocument,
            [r.CreatorInventoryAssetType.Video]: n.AssetType.Video
        },
        T = {
            3: r.CreatorInventoryAssetType.Audio,
            10: r.CreatorInventoryAssetType.Model,
            13: r.CreatorInventoryAssetType.Decal,
            24: r.CreatorInventoryAssetType.Animation,
            38: r.CreatorInventoryAssetType.Plugin,
            40: r.CreatorInventoryAssetType.MeshPart,
            62: r.CreatorInventoryAssetType.Video,
            93: r.CreatorInventoryAssetType.TextDocument,
            ANIMATION: r.CreatorInventoryAssetType.Animation,
            ASSET_TYPE_ANIMATION: r.CreatorInventoryAssetType.Animation,
            ASSET_TYPE_AUDIO: r.CreatorInventoryAssetType.Audio,
            ASSET_TYPE_DECAL: r.CreatorInventoryAssetType.Decal,
            ASSET_TYPE_IMAGE: r.CreatorInventoryAssetType.Image,
            ASSET_TYPE_MESH: r.CreatorInventoryAssetType.Mesh,
            ASSET_TYPE_MESH_PART: r.CreatorInventoryAssetType.MeshPart,
            ASSET_TYPE_MODEL: r.CreatorInventoryAssetType.Model,
            ASSET_TYPE_PLUGIN: r.CreatorInventoryAssetType.Plugin,
            ASSET_TYPE_TEXT_DOCUMENT: r.CreatorInventoryAssetType.TextDocument,
            ASSET_TYPE_VIDEO: r.CreatorInventoryAssetType.Video,
            AUDIO: r.CreatorInventoryAssetType.Audio,
            DECAL: r.CreatorInventoryAssetType.Decal,
            IMAGE: r.CreatorInventoryAssetType.Image,
            MESH: r.CreatorInventoryAssetType.Mesh,
            MESHPART: r.CreatorInventoryAssetType.MeshPart,
            MODEL: r.CreatorInventoryAssetType.Model,
            PLUGIN: r.CreatorInventoryAssetType.Plugin,
            TEXTDOCUMENT: r.CreatorInventoryAssetType.TextDocument,
            VIDEO: r.CreatorInventoryAssetType.Video
        },
        b = {
            createdDetails: i.CreatorInventorySourceType.Created,
            purchasedDetails: i.CreatorInventorySourceType.Purchased,
            sharedDetails: i.CreatorInventorySourceType.Shared
        },
        I = {
            [n.State.Active]: "Active",
            [n.State.Archived]: "Archived"
        },
        E = e => !0 === e ? u : c,
        S = e => {
            if (null == e) return;
            let t = e instanceof Date ? e : new Date(e);
            return Number.isNaN(t.getTime()) ? void 0 : t
        };
    e.s(["DevelopmentItemsAssetTypeFilter", () => o, "DevelopmentItemsSourceFilter", () => l, "buildCreatorInventoryScope", 0, (e, t) => null != t ? {
        type: r.CreatorInventoryScopeType.Group,
        id: t
    } : null != e ? {
        type: r.CreatorInventoryScopeType.User,
        id: e
    } : void 0, "buildCreatorInventorySearchFilter", 0, (e, t, a) => ({
        ...0 === t.length ? {} : {
            assetTypes: t.map(e => A[e])
        },
        ...e.type === r.CreatorInventoryScopeType.Group ? {
            groupIds: [e.id]
        } : {
            userIds: [e.id]
        },
        ..."All" === a ? {} : {
            sources: [a]
        }
    }), "canConfigureDevelopmentItem", 0, e => e.sources.includes(i.CreatorInventorySourceType.Created), "filterDevelopmentItemsByArchivedState", 0, (e, t) => e.filter(e => t ? "Archived" === e.state : "Archived" !== e.state), "getDevelopmentItemsAssetTypes", 0, E, "getDevelopmentItemsColumnSortDirection", 0, (e, t) => e === d[t].ascending ? "ascending" : e === d[t].descending ? "descending" : "none", "getDevelopmentItemsSearchAssetTypes", 0, (e, t) => [e, ...E(t).filter(t => t !== e)], "getLegacyDevelopmentItemsAssetType", 0, e => v[e], "getNextDevelopmentItemsColumnSort", 0, (e, t) => e === d[t].descending ? d[t].ascending : d[t].descending, "hasActiveDevelopmentItemsInventoryFilters", 0, e => {
        let {
            query: t,
            showArchived: a,
            source: n
        } = e;
        return t.trim().length > 0 || a || n !== i.CreatorInventorySourceType.Created
    }, "hasDevelopmentItemCreatorStorePage", 0, e => e !== r.CreatorInventoryAssetType.TextDocument, "hasDevelopmentItemThumbnail", 0, e => e !== r.CreatorInventoryAssetType.TextDocument, "isDevelopmentItemArchivedViewAvailable", 0, e => null != e && p.has(e), "isDevelopmentItemAsset", 0, (e, t) => e === s.Asset.TextDocument ? !0 === t : g.has(e), "isDevelopmentItemDirectlyArchivable", 0, e => null != e && m.has(e), "isDevelopmentItemsAllAssetTypes", 0, e => "All" === e, "isDevelopmentItemsAssetType", 0, (e, t) => null != e && !!h.has(e) && (!f.has(e) || !0 === t), "isDevelopmentItemsSourceSelection", 0, e => null != e && y.has(e), "isDevelopmentItemsView", 0, e => "grid" === e || "list" === e, "mapCreatorInventoryItem", 0, e => {
        var t, a, n, r, i, s, l;
        let o, d = null == (n = e.assetItem) ? void 0 : n.asset;
        if (null == d) return;
        let c = "number" == typeof d.assetId ? d.assetId : Number.parseInt(null != (t = d.assetId) ? t : "", 10);
        if (Number.isNaN(c)) return;
        let u = null == (r = d.displayName) ? void 0 : r.trim();
        return {
            id: null != (a = e.path) ? a : c.toString(),
            assetId: c,
            assetType: (e => {
                if (null != e) return T[e.toString().toUpperCase()]
            })(d.assetType),
            created: S(d.createTime),
            isPackage: (null == (i = e.assetItem) ? void 0 : i.isPackage) === !0,
            name: null == u || 0 === u.length ? c.toString() : u,
            sources: (l = null == (s = e.assetItem) ? void 0 : s.sources, o = new Set, null == l || l.forEach(e => {
                Object.entries(e).forEach(e => {
                    let [t, a] = e;
                    if (null == a) return;
                    let n = b[t];
                    null != n && o.add(n)
                })
            }), [...o]),
            state: null == d.state ? void 0 : I[d.state],
            updated: S(d.updateTime)
        }
    }, "mergeOptimisticArchivedDevelopmentItems", 0, (e, t, a) => {
        let n = new Set(e.map(e => e.assetId));
        return [...e, ...[...t.values()].filter(e => null != e.assetType && (0 === a.length || a.includes(e.assetType)) && !n.has(e.assetId))]
    }])
}, 494601, e => {
    "use strict";
    let t = (0, e.i(697973).makeStyles)()({
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
    var t = e.i(692734),
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
    var t = e.i(692734),
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
    var t = e.i(692734),
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
        r = e.i(842051),
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
            externalLink: d,
            linkLabel: c,
            allowCloseDialog: u,
            onDismiss: m
        } = e, {
            translate: p
        } = (0, i.useTranslation)(), [h, f] = (0, t.useState)(!0);
        if (!h) return null;
        let y = u ? {
            closeLabel: p("Action.Close"),
            onDismiss: () => {
                null == m || m(), f(!1)
            }
        } : {
            hasCloseAffordance: !1
        };
        return (0, n.jsx)(r.Alert, {
            severity: s[o],
            variant: "Feedback",
            className: "width-full",
            primaryActionLabel: c,
            primaryActionHref: d,
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
            children: d,
            accept: c,
            ...u
        } = e, m = (0, a.useRef)(null), p = () => {
            m.current && m.current.click()
        }, h = e => {
            ((e instanceof Event ? e instanceof KeyboardEvent : e.nativeEvent && e.nativeEvent instanceof KeyboardEvent) ? ["Spacebar", " ", "Enter"].includes(e.key) : (console.info("The event passed in is not a keyboard event, are you using the handler in the wrong place?"), !1)) && (e.preventDefault(), p())
        }, f = d ? d(p, h, e => {
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
            children: [f, (0, t.jsx)("input", {
                ...u,
                accept: c,
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
        r = e.i(751846),
        i = e.i(623983),
        s = e.i(345886),
        l = e.i(697973),
        o = e.i(361965),
        d = e.i(686762),
        c = e.i(589418),
        u = e.i(699848),
        m = e.i(257256),
        p = e.i(17829),
        h = e.i(426546);
    let f = {
            compact: 32,
            medium: 48,
            large: 64
        },
        y = {
            compact: 12,
            medium: 16,
            large: 20
        },
        g = {
            compact: 32,
            medium: 48,
            large: 64
        },
        v = {
            compact: 4,
            medium: 6,
            large: 8
        },
        A = (0, l.makeStyles)()((e, t) => {
            let {
                variant: a
            } = t;
            return {
                container: {
                    minWidth: 0,
                    width: "fit-content"
                },
                avatarContainer: {
                    width: f[a],
                    height: f[a],
                    marginRight: y[a]
                },
                userBorderRadius: {
                    borderRadius: g[a]
                },
                nonUserBorderRadius: {
                    borderRadius: v[a]
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
                targetType: g,
                displayNameOverride: v,
                adornment: T,
                label: b,
                disabled: I,
                variant: E = "medium",
                disableLink: S = !1,
                obfuscate: C = !1,
                hideThumbnail: x = !1,
                hideSecondaryLabel: w = !1,
                textVariant: k = "primary",
                labelTooltip: D,
                secondaryLabelClassName: N
            } = e,
            {
                classes: {
                    container: P,
                    avatarContainer: L,
                    thumbnailItemContainer: M,
                    thumbnailBackground: _,
                    userBorderRadius: U,
                    nonUserBorderRadius: F,
                    itemText: V,
                    mutedText: B,
                    disabledThumbnail: R,
                    textContainer: O
                },
                cx: j
            } = A({
                variant: E
            }),
            {
                translate: G
            } = (0, n.useTranslation)(),
            H = (0, a.useMemo)(() => g === p.default.User ? r.ThumbnailTypes.avatarHeadshot : g === p.default.Group ? r.ThumbnailTypes.groupIcon : "Ugc" === g ? r.ThumbnailTypes.assetThumbnail : r.ThumbnailTypes.universeThumbnail, [g]),
            K = (0, a.useMemo)(() => {
                if (!S && y.id && !C) {
                    if (g === p.default.User) return h.www.getUserUrl(y.id);
                    if (g === p.default.Group) return h.www.getGroupUrl(y.id);
                    if ("Experience" === g) {
                        let e = "rootPlaceId" in y ? y.rootPlaceId : void 0;
                        return e ? h.www.getGameDetailsUrl(e) : void 0
                    }
                    if ("Ugc" === g) return h.www.getCatalogUrl(y.id)
                }
            }, [S, y, C, g]);
        v ? l = v : g === p.default.User ? l = "displayName" in y ? y.displayName : void 0 : "Ugc" !== g && (l = "name" in y ? y.name : void 0);
        let q = !v && (g === p.default.User && !("displayName" in y && y.displayName) || "Ugc" === g),
            z = (0, a.useMemo)(() => {
                let e;
                return (0, t.jsxs)(s.Grid, {
                    container: !0,
                    direction: "row",
                    alignItems: "center",
                    wrap: "wrap",
                    children: [q ? (0, t.jsx)(c.Skeleton, {
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
                            variant: "secondary" === k ? "body1" : "compact" === E ? "captionHeader" : "large" === E ? "h2" : "h5",
                            color: I ? "disabled" : "inherit",
                            children: C ? G("Label.Other") : l
                        }), b && b.length > 0 && (0, t.jsx)(m.Tooltip, {
                            arrow: !0,
                            title: D,
                            placement: "right",
                            enterTouchDelay: 0,
                            leaveTouchDelay: 3e3,
                            children: (0, t.jsx)(u.Chip, {
                                color: "secondary",
                                label: b,
                                size: "small",
                                variant: "filled"
                            })
                        })]
                    }), !w && (0, t.jsxs)(t.Fragment, {
                        children: [g === p.default.User && (0, t.jsx)(t.Fragment, {
                            children: "name" in y && !y.name ? (0, t.jsx)(c.Skeleton, {
                                animate: !0,
                                variant: "text",
                                width: 192,
                                height: 20
                            }) : (0, t.jsx)(i.Typography, {
                                variant: "secondary" === k ? "body2" : "captionBody",
                                className: j(O, {
                                    [B]: void 0 === N && ("secondary" === k || "compact" === E)
                                }),
                                color: I ? "disabled" : "inherit",
                                children: (e = C ? G("Label.Other") : "@".concat("name" in y ? y.name : ""), N ? (0, t.jsx)("span", {
                                    className: N,
                                    children: e
                                }) : e)
                            })
                        }), (g === p.default.Group || "Experience" === g) && (0, t.jsx)(i.Typography, {
                            variant: "captionBody",
                            className: j(O, {
                                [B]: void 0 === N && ("secondary" === k || "compact" === E)
                            }),
                            color: I ? "disabled" : "inherit",
                            children: N ? (0, t.jsx)("span", {
                                className: N,
                                children: C ? G("Label.Other") : y.id
                            }) : C ? G("Label.Other") : y.id
                        })]
                    })]
                })
            }, [q, l, g, y, O, I, C, G, b, w, j, B, k, E, D, N]);
        return (0, t.jsx)(s.Grid, {
            container: !0,
            direction: "row",
            alignItems: "center",
            wrap: "nowrap",
            justifyContent: "space-between",
            className: P,
            children: (null == y ? void 0 : y.id) === void 0 ? (0, t.jsx)(c.Skeleton, {
                animate: !0,
                variant: "rectangular",
                width: "100%",
                height: f[E]
            }) : (0, t.jsxs)(t.Fragment, {
                children: [(0, t.jsxs)(s.Grid, {
                    container: !0,
                    wrap: "nowrap",
                    children: [!x && (0, t.jsx)(s.Grid, {
                        item: !0,
                        className: M,
                        children: (0, t.jsx)(o.Avatar, {
                            variant: "rounded",
                            alt: "avatar",
                            className: j(L, {
                                [U]: g === p.default.User,
                                [F]: g !== p.default.User,
                                [R]: I
                            }),
                            children: (0, t.jsx)(r.Thumbnail2d, {
                                targetId: y.id,
                                type: H,
                                imgClassName: _,
                                alt: "thumbnail",
                                returnPolicy: r.ReturnPolicy.PlaceHolder,
                                includeBackground: !1
                            })
                        })
                    }), (0, t.jsx)(s.Grid, {
                        container: !0,
                        direction: "column",
                        className: P,
                        children: (0, t.jsx)(s.Grid, {
                            item: !0,
                            children: S || C ? z : (0, t.jsx)(d.Link, {
                                href: K,
                                className: V,
                                color: "inherit",
                                children: z
                            })
                        })
                    })]
                }), T]
            })
        })
    }])
}, 60373, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(29929);
    let n = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            try {
                let a = window.localStorage.getItem(e);
                return a ? JSON.parse(a) : t
            } catch (e) {
                return t
            }
        },
        r = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            try {
                window.localStorage.setItem(e, JSON.stringify(t))
            } catch (e) {
                console.warn("Unable to write to local storage", e)
            }
        };
    e.s(["default", 0, function(e, i) {
        var s;
        let l = null != (s = null == i ? void 0 : i.cacheOnly) && s,
            [o, d] = (0, t.useState)(() => l ? {
                params: n(e),
                status: "success",
                isFetched: !0
            } : {
                params: (null == i ? void 0 : i.restoreInitialValueFromCache) ? n(e) : {},
                status: "initial",
                isFetched: !1
            });
        return (0, t.useEffect)(() => {
            l || (async () => {
                let t = {};
                try {
                    d(e => ({
                        ...e,
                        status: "loading"
                    })), t = await (0, a.fetchIXPParametersForCurrentUser)(e), d({
                        params: t,
                        isFetched: !0,
                        status: "success"
                    }), r(e, t)
                } catch (e) {
                    d(e => ({
                        ...e,
                        isFetched: !0,
                        status: "error"
                    }))
                }
            })()
        }, []), o
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
        }, [e, n, r]), d = (n + 1) * l >= e.length;
        return (0, t.useEffect)(() => {
            d && i && (null == s || s())
        }, [d, i, s]), {
            currentPage: o
        }
    }], 125677), e.s(["useTablePagination", 0, function(e) {
        let {
            count: a,
            initialRowsPerPage: n = 50,
            resetKey: r
        } = e, [i, s] = (0, t.useState)(0), [l, o] = (0, t.useState)(n), [d, c] = (0, t.useState)(r);
        r !== d && (c(r), s(0));
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
        r = e.i(623983),
        i = e.i(345886),
        s = e.i(697973),
        l = e.i(260782);
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
            items: d,
            icon: c,
            activeKey: u,
            defaultExpanded: m,
            headerAction: p
        } = e, {
            classes: h
        } = o(), {
            ready: f
        } = (0, n.useTranslation)();
        return f ? (0, t.jsxs)(i.Grid, {
            classes: {
                root: h.container
            },
            children: [s && (0, t.jsxs)(t.Fragment, {
                children: [(0, t.jsxs)(i.Grid, {
                    classes: {
                        root: h.headerContainer
                    },
                    children: [c && (0, t.jsx)(i.Grid, {
                        classes: {
                            root: h.icon
                        },
                        children: c
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
            }), d.length > 0 && (0, t.jsx)(a.NavigationTree, {
                selected: u,
                defaultExpanded: m,
                children: d.map(e => {
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
        a = e.i(41466),
        n = e.i(984656),
        r = e.i(79187),
        i = e.i(623983);
    e.s(["default", 0, e => {
        let {
            open: s,
            onOpenChange: l,
            onContinueWithId: o,
            onAddParent: d
        } = e, {
            translate: c
        } = (0, r.useTranslation)();
        return (0, t.jsx)(n.Dialog, {
            open: s,
            onOpenChange: l,
            size: "Small",
            isModal: !0,
            hasCloseAffordance: !0,
            closeLabel: c("Action.Close"),
            children: (0, t.jsxs)(n.DialogContent, {
                children: [(0, t.jsxs)(n.DialogBody, {
                    className: "flex flex-col gap-medium",
                    children: [(0, t.jsx)(n.DialogTitle, {
                        className: "text-heading-medium margin-y-none",
                        children: c("Label.IdVerification")
                    }), (0, t.jsx)(i.Typography, {
                        className: "text-body-medium",
                        children: c("Description.IdVerifiedDialog")
                    }), (0, t.jsx)(i.Typography, {
                        className: "text-body-medium",
                        children: c("Description.IdVerifiedDialogReverify")
                    })]
                }), (0, t.jsxs)(n.DialogFooter, {
                    className: "flex flex-col gap-xsmall",
                    children: [(0, t.jsx)(a.Button, {
                        variant: "Emphasis",
                        className: "fill",
                        onClick: o,
                        children: c("Action.ContinueWithId")
                    }), (0, t.jsx)(a.Button, {
                        variant: "Standard",
                        className: "fill",
                        onClick: d,
                        children: c("Action.AddAParent")
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
        } = (0, a.useAuthentication)(), o = null == l ? void 0 : l.id, d = null != e ? e : o;
        return (0, t.useQuery)({
            queryKey: [...r, null != d ? d : null],
            queryFn: async () => n.default.coreContentGetCreatorEligibility({
                userId: d
            }),
            enabled: i && !!d,
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
        } = e, [i, d] = (0, n.useState)(l), [c, u] = (0, n.useState)(!1), m = (0, n.useCallback)(async e => {
            try {
                let t = await r.default.getFrontendFlagsValues(e),
                    a = Object.assign({}, ...s.map(e => {
                        var a, n;
                        return {
                            [e]: null != (a = null == t || null == (n = t.data) ? void 0 : n[e]) && a
                        }
                    }));
                d(a)
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
            loadingFrontendFlags: c
        }), [i, m, c]);
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
            d = (0, t.useRef)(!1),
            c = (0, t.useRef)(!1),
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
            !d.current && null !== u && s && (d.current = !0, "user" === u.kind ? null !== l && o(null) : m && (null == l ? void 0 : l.id) !== u.id && o(u.id))
        }, [u, s, m, l, o]);
        let p = !e.isReady;
        return p || null === u || (p = "group" === u.kind ? !s || m && (null == l ? void 0 : l.id) !== u.id : !s || null !== l), (0, t.useEffect)(() => {
            if (c.current || !e.isReady || p || void 0 === e.query.groupId && void 0 === e.query.userId) return;
            c.current = !0;
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
}, 842051, e => {
    "use strict";
    var t = e.i(75584),
        a = e.i(41466),
        n = e.i(408832),
        r = e.i(607895),
        i = e.i(225032),
        s = e.i(197649),
        l = e.i(416340);
    let o = {
            Info: "icon-filled-circle-i",
            Warning: "icon-filled-triangle-exclamation",
            Success: "icon-filled-circle-check",
            Error: "icon-filled-circle-x"
        },
        d = {
            Info: "var(--color-system-emphasis)",
            Warning: "var(--color-system-warning)",
            Success: "var(--color-extended-green-700, var(--color-system-success))",
            Error: "var(--color-action-alert-foreground)"
        },
        c = {
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
                severity: f = "Info",
                primaryActionLabel: y,
                primaryActionHref: g,
                primaryActionLinkTarget: v,
                onPrimaryAction: A,
                secondaryActionLabel: T,
                secondaryActionHref: b,
                secondaryActionLinkTarget: I,
                onSecondaryAction: E,
                hasCloseAffordance: S = !0,
                closeLabel: C = "Dismiss alert",
                onDismiss: x,
                className: w,
                style: k,
                ...D
            } = e, N = (0, n.default)("foundation-web-alert-message-"), P = !!y, L = !!T, M = !!(S && x), _ = "Feedback" === h && (P || L || M), U = "Warning" === f || "Error" === f ? "alert" : "status", F = null;
            P && (F = L ? l.default.createElement(m, {
                label: y || "",
                href: g,
                linkTarget: v,
                onAction: A,
                variant: "Standard"
            }) : l.default.createElement(p, {
                label: y || "",
                href: g,
                linkTarget: v,
                onAction: A
            }));
            let V = L ? l.default.createElement(m, {
                label: T || "",
                href: b,
                linkTarget: I,
                onAction: E,
                variant: "Utility"
            }) : null;
            return l.default.createElement("div", {
                ref: a,
                role: _ ? "region" : U,
                "aria-labelledby": _ ? N : void 0,
                className: (0, s.default)("foundation-web-alert relative width-full stroke-standard", "System" === h ? "[border-left-width:0] [border-right-width:0]" : "radius-medium", c[f], w),
                ...D
            }, l.default.createElement("div", {
                "aria-hidden": "true",
                className: (0, s.default)("absolute inset-[0] pointer-events-none", "Feedback" === h && "radius-medium"),
                style: {
                    backgroundColor: u[f]
                }
            }), l.default.createElement("div", {
                className: "relative flex items-start gap-x-medium padding-x-large padding-y-small min-width-0"
            }, l.default.createElement("div", {
                className: "flex items-start padding-y-xsmall self-stretch shrink-0"
            }, l.default.createElement("div", {
                className: "relative flex items-start padding-y-xxsmall"
            }, "Warning" !== f && l.default.createElement("span", {
                "aria-hidden": "true",
                className: "absolute width-[10px] height-[14px] top-[5px]",
                style: {
                    left: "50%",
                    transform: "translateX(-50%)",
                    backgroundColor: "var(--dark-mode-content-emphasis)"
                }
            }), l.default.createElement(t.Icon, {
                "aria-hidden": "true",
                name: o[f],
                size: "Medium",
                className: "relative",
                style: {
                    color: d[f]
                }
            }))), l.default.createElement("div", {
                className: (0, s.default)("flex grow-1 basis-0 min-width-0 items-start gap-x-medium gap-y-small", L ? "flex-col" : "wrap")
            }, l.default.createElement("div", {
                id: _ ? N : void 0,
                role: _ ? U : void 0,
                className: (0, s.default)("flex items-center padding-top-[var(--size-150)] text-body-medium text-wrap content-emphasis [overflow-wrap:anywhere]", L ? "width-full min-width-0" : "grow-1 basis-0 min-width-[min(200px,100%)]")
            }, r), (F || V) && l.default.createElement("div", {
                className: (0, s.default)("flex items-center gap-small wrap shrink-0", !L && "padding-y-[var(--size-150)]")
            }, F, V)), M && l.default.createElement(i.CloseAffordance, {
                variant: "Utility",
                size: "Medium",
                isCircular: !0,
                className: "content-emphasis shrink-0 padding-[var(--size-150)]",
                "aria-label": C,
                onClick: x
            })))
        });
    e.s(["Alert", 0, h])
}, 517359, e => {
    "use strict";
    var t = e.i(659332),
        a = e.i(306607),
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
                overlayClassName: d,
                contentClassName: c,
                onOpenAutoFocus: u,
                onCloseAutoFocus: m,
                onPointerDownOutside: p,
                onEscapeKeyDown: h,
                onInteractOutside: f
            } = e;
            return r.default.createElement(i.Portal, null, r.default.createElement(i.Overlay, {
                "data-testid": "fui-base-sheet-overlay",
                "data-type": t,
                "data-side": "sideSheet" === t ? a : void 0,
                "data-flush": "sideSheet" === t ? s : void 0,
                "data-size": "centerSheet" === t ? l : void 0,
                className: (0, n.default)("fui-base-sheet-overlay", "foundation-web-portal-zindex fixed inset-[0] flex", d)
            }, r.default.createElement(i.Content, {
                "data-testid": "fui-base-sheet-content",
                className: (0, n.default)("fui-base-sheet-content relative bg-surface-100 stroke-muted stroke-standard shadow-transient-high", "flex flex-col clip", c),
                onOpenAutoFocus: u,
                onCloseAutoFocus: m,
                onPointerDownOutside: p,
                onEscapeKeyDown: h,
                onInteractOutside: f
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
        d = e.i(199512);
    let c = (0, r.createContext)(null),
        u = () => {
            let e = (0, r.useContext)(c);
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
                largeScreenVariant: d = "center",
                closeLabel: u,
                className: m,
                mobilePortraitClassName: p,
                mobileLandscapeClassName: h,
                largeScreenClassName: f,
                onOpenAutoFocus: y,
                onCloseAutoFocus: g,
                onPointerDownOutside: v,
                onEscapeKeyDown: A,
                onInteractOutside: T
            } = e,
            b = (0, o.useMediaQuery)("(orientation: portrait) and (max-width: 600px)"),
            I = (0, o.useMediaQuery)("(orientation: landscape) and (max-height: 600px)");
        t = b ? "bottomSheet" : I || "side" === d ? "sideSheet" : "centerSheet";
        let E = (0, r.useMemo)(() => ({
                centerSheetSize: i,
                largeScreenVariant: d,
                closeLabel: u,
                isPortraitMobile: b,
                isLandscapeMobile: I,
                type: t
            }), [i, d, u, b, I, t]),
            S = (0, n.default)(m, b && p, I && h, !b && !I && f);
        return r.default.createElement(c.Provider, {
            value: E
        }, r.default.createElement(s, {
            type: t,
            sideSheetSide: "right",
            isSideSheetFlush: I,
            centerSheetSize: i,
            contentClassName: S,
            onOpenAutoFocus: null != y ? y : l,
            onCloseAutoFocus: g,
            onPointerDownOutside: v,
            onEscapeKeyDown: A,
            onInteractOutside: T
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
            visuallyHideTitleText: c
        } = e, {
            closeLabel: m
        } = u(), p = r.default.createElement(i.Title, {
            className: "text-heading-small margin-none"
        }, s);
        return r.default.createElement("div", {
            className: (0, n.default)(a, l ? "padding-left-medium" : "padding-left-xlarge", "padding-right-small padding-y-small", "flex items-center justify-between")
        }, r.default.createElement("div", {
            className: (0, n.default)("flex items-center", l && "gap-xsmall")
        }, l, c ? r.default.createElement(d.VisuallyHidden, null, p) : p), r.default.createElement("div", {
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
    })], 517359)
}, 986939, e => {
    "use strict";
    var t = e.i(603955),
        a = e.i(408832),
        n = e.i(750615),
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
        d = {
            XSmall: ["text-body-small", "placeholder:text-body-small"],
            Small: ["text-body-small", "placeholder:text-body-small"],
            Medium: ["text-body-medium", "placeholder:text-body-medium"],
            Large: ["text-body-large", "placeholder:text-body-large"]
        },
        c = i.default.forwardRef((e, c) => {
            let {
                size: u,
                variant: m = "Standard",
                label: p,
                value: h,
                defaultValue: f,
                isDisabled: y,
                hasError: g,
                helperText: v,
                className: A,
                style: T,
                textareaClassName: b,
                textareaStyle: I,
                id: E,
                ...S
            } = e, C = (0, a.default)(), x = E || C, w = "".concat(x, "-description"), k = null != u ? u : "Large";
            return i.default.createElement("div", {
                className: (0, r.default)("flex fill flex-col width-full gap-small", {
                    [t.disabledOpacity]: y
                }, A),
                style: T
            }, p && i.default.createElement("label", {
                htmlFor: x,
                className: (0, r.default)(o[k], "content-emphasis")
            }, p), i.default.createElement("textarea", {
                ref: c,
                id: x,
                "data-testid": "text-area-container",
                style: I,
                className: (0, r.default)("foundation-web-text-area foundation-web-input outline-none", "radius-medium content-emphasis placeholder:content-muted", n.INPUT_BACKGROUND_BY_VARIANT[m], n.INPUT_STROKE_BY_VARIANT[m], g ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", d[k], s[k], l[k], b),
                value: h,
                defaultValue: null == h ? f : void 0,
                disabled: y,
                "aria-describedby": v ? w : void 0,
                ...S
            }), v && i.default.createElement("span", {
                id: w,
                className: (0, r.default)("text-caption-small", {
                    "content-system-alert": g,
                    "content-default": !g
                })
            }, v))
        });
    c.displayName = "TextArea", e.s(["TextArea", 0, c])
}, 763833, e => {
    "use strict";
    var t = e.i(29013);
    e.s(["ArrowDownwardIcon", () => t.ArrowDownward])
}, 650642, e => {
    "use strict";
    var t = e.i(29013);
    e.s(["ArrowUpwardIcon", () => t.ArrowUpward])
}]);

//# debugId=d060f89b-1db0-2134-cd32-47f1834d0bda
//# sourceMappingURL=457ifeplhs8w0.js.map