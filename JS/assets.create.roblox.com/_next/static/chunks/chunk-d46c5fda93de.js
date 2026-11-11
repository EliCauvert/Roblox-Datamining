;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "a429edde-eff9-08c6-1ece-d476e5ce07c9")
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
        r = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "enableCreatorShowcases",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
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
        }),
        c = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "enableTimedOptionsSunsetBanner",
            defaultValue: !1
        });
    e.s(["enableAvatarCreationTokenCategories", 0, n, "enableBulkMakeupTokenCreation", 0, i, "enableCoreContentGatedBanner", 0, o, "enableCreatorShowcases", 0, r, "enableTaxonomyBasedCreatorDashboard", 0, a, "enableTimedOptionsSunsetBanner", 0, c, "isAutoPublishPreferencesEnabled", 0, s, "showTaxonomyOnAvatarItemAnalyticsTab", 0, l])
}, 134731, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.defineFlag)({
            namespace: "content-access-and-inventory",
            name: "isAssetPrivacyOptOutSurveyEnabled",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
            namespace: "content-access-and-inventory",
            name: "isAssetAccessRequestsEnabled",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
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
            name: "isPublishBeforeExposeEnabled",
            defaultValue: !1
        });
    e.s(["isAssetAccessRequestsEnabled", 0, r, "isAssetDependenciesViewerEnabled", 0, i, "isAssetPrivacyOptOutSurveyEnabled", 0, a, "isCreatorStoreVideoMultipartUploadEnabled", 0, s, "isModelCustomThumbnailUploadEnabled", 0, n, "isPublishBeforeExposeEnabled", 0, l])
}, 9436, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isBadgeDefaultIconEnabled",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isMomentsUploadEnabled",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
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
            name: "isMomentsModeratedTabEnabled",
            defaultValue: !1
        });
    e.s(["isBadgeDefaultIconEnabled", 0, a, "isMomentsFeedIdEnabled", 0, l, "isMomentsModeratedTabEnabled", 0, c, "isMomentsShareLinkEnabled", 0, o, "isMomentsSitetestUrlParsingEnabled", 0, n, "isMomentsUploadEnabled", 0, r, "isMomentsUploadLanguageSelectEnabled", 0, s, "isTextDocumentEnabled", 0, i])
}, 203450, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        r = e.i(770651),
        n = e.i(79187),
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
    let u = (0, n.withTranslation)(e => {
        let {
            children: n
        } = e, {
            user: l
        } = (0, i.useAuthentication)(), u = (0, o.useCurrentGroup)(), [m, p] = (0, a.useState)(void 0), [h, f] = (0, a.useState)(), [v, y] = (0, a.useState)(), [g, b] = (0, a.useState)(), [A, T] = (0, a.useState)(), I = (0, a.useMemo)(() => {
            var e;
            return (null != (e = null == u ? void 0 : u.id) ? e : 0) !== 0
        }, [u]), [C, S] = (0, a.useState)(void 0), E = void 0 === m || void 0 === h || void 0 === v && I, x = (0, a.useCallback)(async () => {
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
            if (I && C || !I) try {
                let e = await (0, c.getRequirements)();
                f(e.requirements);
                return
            } catch (e) {
                return
            }
            f(null)
        }, [C, I]), N = (0, a.useCallback)(async () => {
            if (I && (null == u ? void 0 : u.id)) try {
                let e = await (0, c.getGroupEligibility)(u.id);
                y(e.isEligible)
            } catch (e) {
                y(!1)
            }
        }, [u, I]);
        (0, a.useEffect)(() => {
            E ? T(void 0) : I && !C ? T(!1) : T(!1 === g)
        }, [I, C, g, E]), (0, a.useEffect)(() => {
            (async () => {
                if (I && (null == u ? void 0 : u.id)) {
                    var e;
                    return null == (e = (await s.default.getGroupInfo(u.id)).owner) ? void 0 : e.userId
                }
            })().then(e => {
                e && l && S(e === l.id)
            })
        }, [null == u ? void 0 : u.id, I, l]), (0, a.useEffect)(() => {
            E || !h || I && !C ? b(void 0) : b((null == h ? void 0 : h.length) === 0 || (null == h ? void 0 : h.length) === 1 && h[0] === r.Requirements.Payable)
        }, [C, I, E, h]), (0, a.useEffect)(() => {
            x()
        }, [x]), (0, a.useEffect)(() => {
            w()
        }, [w]), (0, a.useEffect)(() => {
            N()
        }, [N]);
        let D = (0, a.useMemo)(() => ({
            isAffiliateProgramLoading: E,
            requiresActionToJoinProgram: A,
            compliantWithAllUserRequirements: g,
            creatorMetadata: null != m ? m : void 0,
            requirements: null != h ? h : void 0,
            isCurrentUserGroupOwner: C,
            isGroupEligible: null != v ? v : void 0
        }), [E, A, g, m, h, C, v]);
        return (0, t.jsx)(d.Provider, {
            value: D,
            children: n
        })
    }, [l.TranslationNamespace.Organization]);
    e.s(["default", 0, u, "useAffiliateProgram", 0, function() {
        return (0, a.useContext)(d)
    }])
}, 814984, e => {
    "use strict";
    let t = (0, e.i(650502).getBEDEV2ServiceBasePath)("access-management"),
        a = encodeURIComponent("studio/CollaborationSettings"),
        r = async function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0,
                a = await fetch(e, {
                    credentials: "include"
                }),
                n = a.status % 100 * 100;
            if (!a.ok && 500 === n && t < 2) return await new Promise(e => {
                setTimeout(e, 2 ** (t + 1) * 500)
            }), r(e, t + 1);
            if (500 === n && 2 === t) throw Error("Failed to get feature access after 3 attempts");
            let i = await a.json();
            if ("object" != typeof i || null === i || !("access" in i)) throw Error('"access" not found in response');
            return i.access
        }, n = async () => await r("".concat(t, "/v1/upsell-feature-access?nameSpace=").concat(a, "&featureName=").concat("ShouldShowCreatorHubBanner")) === "Granted";
    e.s(["getAgeVerificationUpsellFeatureAccess", 0, n])
}, 714039, 540082, e => {
    "use strict";
    var t, a = e.i(221628),
        r = e.i(416340),
        n = e.i(79187),
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
        f = e.i(881670),
        v = e.i(904969),
        y = e.i(906791);
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
    let A = (0, n.withTranslation)(e => {
        let t, f, b, A, {
                trackingPage: T,
                alertRedesignVariant: I
            } = e,
            {
                isBannerVisible: C,
                isHighPriority: S,
                variant: E,
                dismissBanner: x
            } = (0, y.useAgeVerificationUpsellContext)(),
            {
                classes: w
            } = g(),
            N = (0, r.useRef)(null),
            {
                unifiedLogger: D
            } = (0, h.useUnifiedLoggerProvider)(),
            {
                translate: L
            } = (0, n.useTranslation)(),
            k = (0, r.useCallback)(() => {
                C && D.logImpressionEvent({
                    eventName: p.default.AgeVerificationUpsellBanner,
                    parameters: {
                        page: T,
                        variant: E,
                        ...I && {
                            alertRedesignVariant: I
                        }
                    }
                })
            }, [D, T, E, I, C]);
        (0, m.default)(N, k);
        let P = (0, r.useCallback)(() => {
                D.logClickEvent({
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
            }, [D, T, E, I]),
            M = (0, r.useCallback)(() => {
                D.logClickEvent({
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
            }, [D, T, E, I]),
            _ = (0, r.useCallback)(() => {
                D.logClickEvent({
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
            }, [D, x, T, E, I]);
        return ("establishTrust" === E ? (t = "Title.EstablishTrustBanner", f = "Label.EstablishTrustBanner2", b = v.ESTABLISH_TRUST_UPSELL_GET_STARTED_URL, A = v.ESTABLISH_TRUST_UPSELL_VIEW_DETAILS_URL) : (t = "Title.AgeVerificationBanner", f = "Label.AgeVerificationBanner", b = v.AGE_VERIFICATION_UPSELL_GET_STARTED_URL, A = v.AGE_VERIFICATION_UPSELL_VIEW_DETAILS_URL), C) ? (0, a.jsx)("div", {
            ref: N,
            children: (0, a.jsxs)(i.Alert, {
                className: w.alertContainer,
                severity: "ageVerification" === E && S ? "warning" : "info",
                variant: "filled",
                action: [(0, a.jsx)(c.Button, {
                    href: b,
                    onClick: M,
                    className: w.getStarted,
                    color: "inherit",
                    size: "small",
                    children: L("Label.AgeVerificationBannerGetStarted")
                }, "getStarted"), (0, a.jsx)(d.IconButton, {
                    color: "inherit",
                    size: "medium",
                    "aria-label": "dismiss",
                    onClick: _,
                    children: (0, a.jsx)(u.CloseIcon, {})
                }, "dismiss")],
                children: [(0, a.jsx)(s.AlertTitle, {
                    children: L(t)
                }), (0, a.jsx)(o.Typography, {
                    variant: "body2",
                    children: L(f)
                }), " ", (0, a.jsx)(l.Link, {
                    className: w.viewDetails,
                    href: A,
                    target: "_blank",
                    color: "inherit",
                    onClick: P,
                    children: L("Label.AgeVerificationBannerViewDetails")
                })]
            })
        }) : null
    }, [f.TranslationNamespace.Home]);
    e.s(["AgeVerificationUpsellBanner", 0, A, "AgeVerificationUpsellPage", () => b], 714039)
}, 904969, e => {
    "use strict";
    e.s(["AGE_VERIFICATION_UPSELL_BANNER_END_DATE", 0, "2030-01-01T00:00:00.000Z", "AGE_VERIFICATION_UPSELL_BANNER_HIGH_PRIORITY_DATE", 0, "2026-01-21T00:00:00.000Z", "AGE_VERIFICATION_UPSELL_BANNER_START_DATE", 0, "2025-12-03T00:00:00.000Z", "AGE_VERIFICATION_UPSELL_GET_STARTED_URL", 0, "https://www.roblox.com/my/account?creatorCollaboration", "AGE_VERIFICATION_UPSELL_VIEW_DETAILS_URL", 0, "https://devforum.roblox.com/t/age-check-notifications-in-studio-and-creator-hub/4117693", "ESTABLISH_TRUST_UPSELL_GET_STARTED_URL", 0, "https://www.roblox.com/my/account?creatorCollaboration", "ESTABLISH_TRUST_UPSELL_VIEW_DETAILS_URL", 0, "https://devforum.roblox.com/t/age-check-notifications-in-studio-and-creator-hub/4117693"])
}, 906791, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        r = e.i(458451),
        n = e.i(889311),
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
        } = e, [o, c] = (0, a.useState)(!0), [f, v] = (0, a.useState)("doNotShow"), {
            isFetched: y,
            user: g
        } = (0, r.useRobloxAuthentication)(), {
            unifiedLogger: b
        } = (0, i.useUnifiedLoggerProvider)(), {
            isHighPriority: A,
            isEnabled: T
        } = (0, a.useMemo)(() => {
            let e = p(l.AGE_VERIFICATION_UPSELL_BANNER_START_DATE),
                t = p(l.AGE_VERIFICATION_UPSELL_BANNER_END_DATE),
                a = p(l.AGE_VERIFICATION_UPSELL_BANNER_HIGH_PRIORITY_DATE),
                r = new Date;
            return {
                isHighPriority: a <= r,
                isEnabled: e <= r && r < t
            }
        }, []), I = (0, a.useCallback)(async () => {
            await u(), c(!0)
        }, [c]);
        (0, a.useEffect)(() => {
            T && y && (null == g ? void 0 : g.id) && (async () => {
                let e = !1;
                try {
                    e = await d()
                } catch (e) {
                    b.logErrorEvent({
                        eventName: n.default.AgeVerificationUpsellBannerError,
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
                        eventName: n.default.AgeVerificationUpsellBannerError,
                        parameters: {
                            branch: "getEligibility",
                            error: e instanceof Error ? e.message : String(e)
                        }
                    })
                }
                v(t)
            })().catch(e => {
                b.logErrorEvent({
                    eventName: n.default.AgeVerificationUpsellBannerError,
                    parameters: {
                        branch: "runAsync",
                        error: e instanceof Error ? e.message : String(e)
                    }
                })
            })
        }, [T, y, g, b]);
        let C = (0, a.useMemo)(() => {
            let e = T && "doNotShow" !== f;
            return {
                isBannerVisible: e && !o,
                isBannerEligible: e,
                isHighPriority: A,
                variant: "doNotShow" !== f ? f : "ageVerification",
                dismissBanner: I
            }
        }, [T, f, o, A, I]);
        return (0, t.jsx)(m.Provider, {
            value: C,
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
        r = e.i(419652);
    e.s(["default", 0, e => {
        let {
            children: n
        } = e, [i, s] = (0, a.useState)(), l = e => {
            s(e)
        }, o = (0, a.useMemo)(() => ({
            droppedFile: i,
            updateDroppedFile: l
        }), [i]);
        return (0, t.jsx)(r.default.Provider, {
            value: o,
            children: n
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
        r = e.i(589624),
        n = e.i(665591),
        i = e.i(968892),
        s = e.i(197649),
        l = e.i(79187),
        o = e.i(537683),
        c = e.i(29929),
        d = e.i(889311),
        u = e.i(215955),
        m = e.i(227700),
        p = e.i(881670),
        h = e.i(114209),
        f = e.i(373736),
        v = e.i(917852),
        y = e.i(576069),
        g = e.i(663563);
    let b = "".concat("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/assets", "/home/publish_eligibility_banner.webp"),
        A = (0, l.withTranslation)(e => {
            var A;
            let {
                universeId: T,
                showCallToAction: I = !0
            } = e, C = (0, r.useRouter)(), {
                translateWithNamespace: S
            } = (0, l.useTranslation)(), {
                params: E,
                isFetched: x
            } = (0, m.useIXPParameters)(c.IXPLayers.CreatorHubCreationsPermission), w = E[c.CreatorHubCreationsPermissionParameters.EnableAudienceReachGrowthOpportunitiesBanner], {
                gameDetails: N
            } = (0, h.useCurrentGame)(), D = null == N ? void 0 : N.id, L = null != T ? T : D && D > 0 ? D : void 0, {
                data: k,
                isLoading: P,
                isFetching: M
            } = (0, y.useCreatorEligibility)(), _ = (0, a.useRef)(!1), [F, R] = (0, a.useState)(!1), V = (null == k ? void 0 : k.ageBracket) === n.AgeBracketEnum.Over18, U = (null == k ? void 0 : k.ageBracket) === n.AgeBracketEnum.Between13And18, B = null != (A = null == k ? void 0 : k.creatorEligibility.includes(n.CreatorEligibilityEnum.IdVerified)) && A, O = V || U, j = x && w && !(P || M) && !!k && !B;
            (0, a.useEffect)(() => {
                j && !_.current && (_.current = !0, u.default.logImpressionEvent({
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
                }), U) ? R(!0): O || C.push("/settings/eligibility/publishing-permissions")
            }, [j, U, C, O, L]);
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
                                children: [S(p.TranslationNamespace.AudienceReach, "Heading.ExpandGrowthOpportunities"), " "]
                            }), (0, t.jsx)("div", {
                                className: "text-body-medium content-emphasis",
                                children: S(p.TranslationNamespace.AudienceReach, "Description.ExpandGrowthOpportunities")
                            })]
                        }), (0, t.jsx)("div", {
                            className: (0, s.clsx)(g.default.buttonRow, "flex gap-small"),
                            children: I ? V ? (0, t.jsx)(i.Button, {
                                as: "a",
                                href: v.idVerificationActionUrl,
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
                }), U ? (0, t.jsx)(f.default, {
                    open: F,
                    onOpenChange: R,
                    onContinueWithId: () => {
                        window.open(v.idVerificationActionUrl, "_blank", "noopener,noreferrer"), R(!1)
                    },
                    onAddParent: () => {
                        window.open(v.parentLinkActionUrl, "_blank", "noopener,noreferrer"), R(!1)
                    }
                }) : null]
            }) : null
        }, [p.TranslationNamespace.AudienceReach, p.TranslationNamespace.PublicPublish]);
    e.s(["default", 0, A])
}, 358763, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(296380);
    let r = () => {};
    e.s(["default", 0, function(e, n) {
        let {
            debounceDelay: i,
            intersectionObserverThreshold: s,
            resetOncePer: l
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {}, o = (0, t.useRef)(!1), c = (0, t.useCallback)(e => {
            !e || o.current || (o.current = !0, n())
        }, [n]), [d] = (0, a.default)(c, null != i ? i : 250), u = (0, t.useCallback)(e => {
            let [t] = e;
            d(t.isIntersecting)
        }, [d]), m = null != l ? l : "instance";
        (0, t.useMemo)(() => {
            "callback" === m && (o.current = !1)
        }, [n]), (0, t.useEffect)(() => {
            if (!e.current) return r;
            let t = new IntersectionObserver(u, {
                threshold: null != s ? s : .5
            });
            return t.observe(e.current), () => {
                t.disconnect()
            }
        }, [e, s, u])
    }])
}, 899441, e => {
    "use strict";
    var t, a, r = e.i(93232),
        n = e.i(272593),
        i = ((t = {}).Animation = "Animation", t.Audio = "Audio", t.Decal = "Decal", t.Image = "Image", t.Mesh = "Mesh", t.MeshPart = "MeshPart", t.Model = "Model", t.Plugin = "Plugin", t.TextDocument = "TextDocument", t.Video = "Video", t),
        s = ((a = {}).Group = "groups", a.User = "users", a);
    let l = new r.CreatorInventoryApi((0, n.createClientConfiguration)("creator-inventory-api", "bedev2"));
    e.s(["CreatorInventoryAssetType", () => i, "CreatorInventoryScopeType", () => s, "searchCreatorInventoryItems", 0, (e, t, a) => (null == t.isArchived && null == t.orderBy ? l : l.withPreMiddleware(async e => {
        let {
            url: a,
            init: r
        } = e;
        return {
            url: ((e, t) => {
                let {
                    isArchived: a,
                    orderBy: r
                } = t;
                if (null == a && null == r) return e;
                let n = e.indexOf("?"),
                    i = -1 === n ? e : e.slice(0, n),
                    s = (-1 === n ? [] : e.slice(n + 1).split("&")).map(e => null != a && e.startsWith("filter=") ? "".concat(e).concat(encodeURIComponent(";isArchived=".concat(a))) : e);
                return null != r && s.push("orderBy=".concat(encodeURIComponent(r))), "".concat(i, "?").concat(s.join("&"))
            })(a, t),
            init: r
        }
    })).creatorInventorySearchCreatorInventoryItems(e, a)])
}, 445550, e => {
    "use strict";
    var t = e.i(721281),
        a = e.i(781423),
        r = e.i(307529),
        n = e.i(272593);
    let i = {
            [r.default.Model]: a.CategoryType.Model,
            [r.default.Plugin]: a.CategoryType.Plugin
        },
        s = {
            3: r.default.Audio,
            10: r.default.Model,
            13: r.default.Decal,
            38: r.default.Plugin,
            40: r.default.MeshPart,
            62: r.default.Video
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
            async getCreations(e, t, a, r, n, s, l) {
                return a ? this.toolboxApi.toolboxGetCreationAssets({
                    ownerId: a,
                    assetType: i[t],
                    limit: r,
                    cursor: n,
                    separateModelsAndPackages: s,
                    includeSharedAssets: l
                }) : this.toolboxApi.toolboxGetUserCreationAssets({
                    userId: e,
                    assetType: i[t],
                    limit: r,
                    cursor: n
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
                const e = (0, n.createClientConfiguration)("toolbox-service", "bedev2");
                this.frontendFlagsApi = new a.FrontendFlagsApi(e), this.toolboxApi = new a.ToolboxApi(e)
            }
        };
    e.s(["assetTypeIdToAssetType", 0, s, "default", 0, l, "toolboxServiceItemDetailsLimit", 0, 30])
}, 790806, e => {
    "use strict";
    var t = e.i(721281),
        a = e.i(86328),
        r = e.i(272593);
    let n = new class {
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
                const e = (0, r.createClientConfiguration)("users", "bedev1");
                this.displayNameApi = new a.DisplayNamesApi(e), this.usersApi = new a.UsersApi(e), this.userSearchApi = new a.UserSearchApi(e)
            }
        },
        i = new a.UsersApi((0, r.createClientConfiguration)("users", "bedev1"));
    e.s(["UsersClient", 0, {
        usersApi: i
    }, "default", 0, n])
}, 131385, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(780880),
        r = e.i(339544),
        n = e.i(643093),
        i = e.i(130778),
        s = e.i(157310),
        l = e.i(913893),
        o = e.i(311156),
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
            r = (0, s.useQuery)({
                queryKey: ["getAvatarItemsEntryPointAssetTypes"],
                queryFn: d.getAvatarItemsEntryPointAssetTypes,
                enabled: e,
                staleTime: 3e5
            }),
            i = r.data,
            u = (0, t.useMemo)(() => {
                var e, t;
                return {
                    enableMakeupAssets: null != (e = null == i ? void 0 : i.has(c.Asset.EyeMakeup)) && e,
                    enableAvatarBackgrounds: null != (t = null == i ? void 0 : i.has(c.Asset.AvatarBackground)) && t
                }
            }, [i]),
            m = (0, t.useMemo)(() => (0, n.transformCreatorDashboardTree)(a.data, u), [a.data, u]),
            p = (0, t.useMemo)(() => (0, n.buildTaxonomyL1Options)(m), [m]);
        return {
            response: a.data,
            categories: m,
            l1Options: p,
            isLoading: a.isLoading || r.isLoading,
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
        } = u(e), f = (0, i.isAllAssetTypesActiveTab)(c) || (0, i.isRecentsActiveTab)(c) || (0, i.isAvatarLooksActiveTab)(c) ? void 0 : null != (s = (0, i.parseTaxonomyActiveTab)(c)) ? s : null == (o = m[0]) ? void 0 : o.taxonomyKey, v = (0, t.useMemo)(() => (0, n.findL1Category)(p, f), [p, f]), y = (0, t.useMemo)(() => (0, n.buildTaxonomyL2Options)(v), [v]), g = parseInt(null != (l = null == d ? void 0 : d.toString()) ? l : "", 10), b = (0, r.isValidIndex)(g, y) ? g : 0, A = (0, t.useMemo)(() => {
            if (v) return y.length > 0 ? y[b] : v.webStableId ? (0, n.categoryToDropdown)(v) : void 0
        }, [v, y, b]);
        return {
            l1Options: m,
            activeL1Key: f,
            activeL1Node: v,
            l2Options: y,
            filterIndex: b,
            selection: A,
            isLoading: h
        }
    }], 131385)
}, 638016, e => {
    "use strict";
    var t = e.i(780880),
        a = e.i(723538),
        r = e.i(130778);
    e.s(["default", 0, e => {
        let [{
            activeTab: n
        }] = (0, t.useQueryParams)(["activeTab"]), i = (0, a.default)(), s = i && (0, r.isTaxonomyActiveTab)(n), l = i && (0, r.isAvatarLooksActiveTab)(n);
        return {
            canUseTaxonomy: i && (s || (0, r.isTaxonomyEligibleAssetTab)(e)),
            isTaxonomyMode: s,
            isTaxonomyView: s && !(0, r.isAllAssetTypesActiveTab)(n) && !(0, r.isRecentsActiveTab)(n) && !(0, r.isAvatarLooksActiveTab)(n),
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
            let [r, n] = e;
            n.forEach((e, n) => {
                t.set(a(r, e.nameKey), n)
            })
        }), t
    }, "isOnItemTab", 0, e => e === t.Asset.TShirt, "isValidIndex", 0, (e, t) => void 0 !== t && void 0 !== e && e > 0 && e < t.length, "serializeMenuMapKey", 0, a], 339544);
    var r = e.i(266213),
        n = e.i(418162);
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
            lookType: r.default.Makeup,
            nameKey: "Label.Looks"
        }), a
    }, "categoryToDropdown", 0, m, "findL1Category", 0, function(e, t) {
        if (t) return e.find(e => e.key === t)
    }, "taxonomyOptionLabel", 0, function(e, t) {
        var a;
        return e.skipTranslation ? (0, n.getTaxonomyDisplayName)(e.nameKey, t) : null != (a = t(e.nameKey)) ? a : e.nameKey
    }, "taxonomyOptionValue", 0, function(e) {
        return void 0 !== e.taxonomy ? e.taxonomy : void 0 !== e.lookType ? "look:".concat(e.lookType) : e.nameKey
    }, "transformCreatorDashboardTree", 0, function(e, t) {
        var a;
        let r = null != (a = null == e ? void 0 : e.categories) ? a : [],
            n = [],
            o = [];
        return r.forEach(e => {
            var a, r, u;
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
                    if (c(e, i)) return void n.push(e);
                    p.push(e)
                }
            }), 0 !== p.length && e.webStableId && o.push({
                key: e.webStableId,
                name: null != (r = e.name) ? r : "",
                webStableId: e.webStableId,
                assetTypeIds: e.assetTypeIds,
                isMakeup: h,
                children: p
            })
        }), n.length > 0 && o.push({
            key: "classics",
            name: "Classics",
            webStableId: void 0,
            children: n
        }), o
    }], 643093)
}, 130778, e => {
    "use strict";
    var t, a, r, n = e.i(671376),
        i = e.i(692587),
        s = e.i(117236);
    let l = "AvatarItems",
        o = "".concat(l, "-"),
        c = n.Asset.HairAccessory;

    function d(e) {
        let t = (0, i.readQueryValue)(e);
        if (void 0 === t || !t.startsWith(o)) return;
        let a = t.slice(o.length);
        return a.length > 0 ? a : void 0
    }
    let u = "looks",
        m = new Set(null != (t = null == (r = s.default.find(e => "Label.AvatarItems" === e.nameKey)) || null == (a = r.submenuItems) ? void 0 : a.map(e => e.type)) ? t : []);

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
            nextAssetType: r
        } = e;
        return t && a && p(r)
    }])
}, 456810, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(994466),
        r = e.i(144266),
        n = e.i(252842),
        i = e.i(671376);
    let s = {
            [i.Asset.Place]: a.SearchSortParameter.LastUpdated,
            [i.Asset.UpcomingEvent]: r.EventSortBy.StartUtc,
            [i.Asset.PastEvent]: r.EventSortBy.StartUtc,
            [i.Asset.DraftEvent]: r.EventSortBy.StartUtc
        },
        l = {
            sort: s,
            setSort: () => {
                throw Error("NotImplemented")
            },
            sortOrder: n.SortOrder.Desc,
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
            params: r
        } = (0, a.useIXPParameters)(t.IXPLayers.CreatorHubPublishing, {
            restoreInitialValueFromCache: !0
        }), n = r[t.CreatorHubPublishingParameters.EnableMultiAssetSearch];
        return {
            isEnabled: !0 === n,
            isReady: e || void 0 !== n
        }
    }])
}, 704443, e => {
    "use strict";
    var t = e.i(671376);
    e.s(["getSortForAssetType", 0, function(e, a) {
        return e === t.Asset.UpcomingEvent || e === t.Asset.PastEvent || e === t.Asset.DraftEvent ? a[e] : a[t.Asset.Place]
    }])
}, 211461, e => {
    "use strict";
    var t, a, r, n, i = e.i(93232),
        s = e.i(899441),
        l = e.i(515863),
        o = e.i(671376),
        c = ((t = {}).All = "All", t),
        d = ((a = {}).All = "All", a),
        u = ((r = {}).Archived = "archived", r),
        m = ((n = {}).CreatedNewest = "created_desc", n.CreatedOldest = "created_asc", n.UpdatedNewest = "updated_desc", n.UpdatedOldest = "updated_asc", n);
    let p = ["updated_desc", "updated_asc", "created_desc", "created_asc"],
        h = {
            created_desc: "createTime desc",
            created_asc: "createTime",
            updated_desc: "updateTime desc",
            updated_asc: "updateTime"
        },
        f = {
            created: {
                ascending: "created_asc",
                descending: "created_desc"
            },
            updated: {
                ascending: "updated_asc",
                descending: "updated_desc"
            }
        },
        v = [s.CreatorInventoryAssetType.Model, s.CreatorInventoryAssetType.Plugin, s.CreatorInventoryAssetType.Audio, s.CreatorInventoryAssetType.Decal, s.CreatorInventoryAssetType.Image, s.CreatorInventoryAssetType.Video, s.CreatorInventoryAssetType.Mesh, s.CreatorInventoryAssetType.MeshPart, s.CreatorInventoryAssetType.Animation],
        y = [...v, s.CreatorInventoryAssetType.TextDocument],
        g = new Set([s.CreatorInventoryAssetType.Audio, s.CreatorInventoryAssetType.Decal, s.CreatorInventoryAssetType.MeshPart, s.CreatorInventoryAssetType.TextDocument, s.CreatorInventoryAssetType.Video]),
        b = new Set([...g, s.CreatorInventoryAssetType.Image]),
        A = new Set(y),
        T = new Set([s.CreatorInventoryAssetType.TextDocument]),
        I = new Set(["All", l.CreatorInventorySourceType.Created, l.CreatorInventorySourceType.Purchased, l.CreatorInventorySourceType.Shared]),
        C = new Set([o.Asset.Animation, o.Asset.Audio, o.Asset.Decal, o.Asset.Image, o.Asset.Mesh, o.Asset.MeshPart, o.Asset.Model, o.Asset.Plugin, o.Asset.Video]),
        S = {
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
        N = {
            [i.State.Active]: "Active",
            [i.State.Archived]: "Archived"
        },
        D = e => !0 === e ? y : v,
        L = e => null != e && b.has(e),
        k = e => {
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
    }), "canConfigureDevelopmentItem", 0, e => e.sources.includes(l.CreatorInventorySourceType.Created), "filterDevelopmentItemsByArchivedState", 0, (e, t) => e.filter(e => t ? "Archived" === e.state : "Archived" !== e.state), "getCreatorInventoryOrderBy", 0, (e, t) => t.trim().length > 0 ? void 0 : h[e], "getDefaultDevelopmentItemsSource", 0, e => e ? "All" : l.CreatorInventorySourceType.Created, "getDevelopmentItemsAssetTypes", 0, D, "getDevelopmentItemsColumnSortDirection", 0, (e, t) => e === f[t].ascending ? "ascending" : e === f[t].descending ? "descending" : "none", "getDevelopmentItemsSearchAssetTypes", 0, (e, t) => [e, ...D(t).filter(t => t !== e)], "getLegacyDevelopmentItemsAssetType", 0, e => S[e], "getNextDevelopmentItemsColumnSort", 0, (e, t) => e === f[t].descending ? f[t].ascending : f[t].descending, "hasActiveDevelopmentItemsInventoryFilters", 0, e => {
        let {
            defaultSource: t,
            query: a,
            showArchived: r,
            source: n
        } = e;
        return a.trim().length > 0 || r || n !== t
    }, "hasDevelopmentItemCreatorStorePage", 0, e => e !== s.CreatorInventoryAssetType.TextDocument, "hasDevelopmentItemThumbnail", 0, e => e !== s.CreatorInventoryAssetType.TextDocument, "isDevelopmentItemArchivedViewAvailable", 0, L, "isDevelopmentItemAsset", 0, (e, t) => e === o.Asset.TextDocument ? !0 === t : C.has(e), "isDevelopmentItemDirectlyArchivable", 0, e => null != e && g.has(e), "isDevelopmentItemsAllAssetTypes", 0, e => "All" === e, "isDevelopmentItemsArchivedViewAvailable", 0, (e, t) => t || L(1 === e.length ? e[0] : void 0), "isDevelopmentItemsAssetType", 0, (e, t) => null != e && !!A.has(e) && (!T.has(e) || !0 === t), "isDevelopmentItemsSort", 0, e => p.some(t => t === e), "isDevelopmentItemsSourceSelection", 0, e => null != e && I.has(e), "isDevelopmentItemsView", 0, e => "grid" === e || "list" === e, "mapCreatorInventoryItem", 0, e => {
        var t, a, r, n, i, s, l;
        let o, c = null == (r = e.assetItem) ? void 0 : r.asset;
        if (null == c) return;
        let d = "number" == typeof c.assetId ? c.assetId : Number.parseInt(null != (t = c.assetId) ? t : "", 10);
        if (Number.isNaN(d)) return;
        let u = null == (n = c.displayName) ? void 0 : n.trim();
        return {
            id: null != (a = e.path) ? a : d.toString(),
            assetId: d,
            assetType: (e => {
                if (null != e) return x[e.toString().toUpperCase()]
            })(c.assetType),
            created: k(c.createTime),
            isPackage: (null == (i = e.assetItem) ? void 0 : i.isPackage) === !0,
            name: null == u || 0 === u.length ? d.toString() : u,
            sources: (l = null == (s = e.assetItem) ? void 0 : s.sources, o = new Set, null == l || l.forEach(e => {
                Object.entries(e).forEach(e => {
                    let [t, a] = e;
                    if (null == a) return;
                    let r = w[t];
                    null != r && o.add(r)
                })
            }), [...o]),
            state: null == c.state ? void 0 : N[c.state],
            updated: k(c.updateTime)
        }
    }, "mergeOptimisticArchivedDevelopmentItems", 0, (e, t, a) => {
        let r = new Set(e.map(e => e.assetId));
        return [...e, ...[...t.values()].filter(e => null != e.assetType && (0 === a.length || a.includes(e.assetType)) && !r.has(e.assetId))]
    }])
}, 725509, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(79187),
        r = e.i(884213),
        n = e.i(401263),
        i = e.i(730530),
        s = e.i(881670);
    e.s(["default", 0, () => {
        let e = (0, a.useTranslation)(),
            {
                translate: l
            } = e,
            {
                tPendingTranslation: o
            } = (0, n.default)(e),
            c = (0, t.useCallback)((e, t, a, n) => {
                let i = o(e, t, a, n);
                return i.length > 0 ? i : (0, r.default)(e, n)
            }, [o]),
            d = (0, t.useCallback)(e => l("Label.AssetIDWithValue", {
                assetId: e.toString()
            }), [l]),
            u = (0, t.useCallback)(e => c("Clear {filterLabel}", "Accessible label for removing an active Development Items filter chip.", (0, i.translationKey)("Action.DevelopmentItems.ClearFilter", s.TranslationNamespace.Creations), {
                filterLabel: e
            }), [c]),
            m = (0, t.useCallback)(e => c("Source: {source}", "Active filter chip describing the selected Development Items source.", (0, i.translationKey)("Label.DevelopmentItems.InventorySourceFilter", s.TranslationNamespace.Creations), {
                source: e
            }), [c]),
            p = (0, t.useCallback)((e, t) => c("{assetTypes}, +{count} more", "Active filter chip listing the first selected Development Items asset types, then how many more are selected.", (0, i.translationKey)("Label.DevelopmentItems.AssetTypesWithMore", s.TranslationNamespace.Creations), {
                assetTypes: e,
                count: t.toString()
            }), [c]),
            h = (0, t.useCallback)((e, t) => c("{query} in {assetType}", "Scoped-search suggestion that searches for a query within a Development Items asset type.", (0, i.translationKey)("Label.DevelopmentItems.SearchSuggestion", s.TranslationNamespace.Creations), {
                assetType: t,
                query: e
            }), [c]);
        return {
            actions: c("Actions", "Development Items table column and accessible label for item actions.", (0, i.translationKey)("Label.DevelopmentItems.Actions", s.TranslationNamespace.Creations)),
            acquiredFromStore: l("Label.CreatorStore"),
            allAssetTypes: c("All types", "Asset type filter option that includes every Development Items asset type.", (0, i.translationKey)("Label.DevelopmentItems.AllAssetTypes", s.TranslationNamespace.Creations)),
            allSources: c("Any", "Source filter option that includes every Development Items source.", (0, i.translationKey)("Label.DevelopmentItems.AllSources", s.TranslationNamespace.Creations)),
            assetId: l("Label.AssetID"),
            assetIdWithValue: d,
            assetTypesWithMore: p,
            assetType: c("Asset type", "Accessible label for the Development Items asset type filter.", (0, i.translationKey)("Label.DevelopmentItems.AssetType", s.TranslationNamespace.Creations)),
            breadcrumbs: c("Breadcrumbs", "Accessible label for the page path shown above the Development Items page.", (0, i.translationKey)("Label.DevelopmentItems.Breadcrumbs", s.TranslationNamespace.Creations)),
            dateCreated: c("Date created", "Development Items table column showing when an asset was created.", (0, i.translationKey)("Label.DevelopmentItems.DateCreated", s.TranslationNamespace.Creations)),
            clearFilter: u,
            clearSearch: c("Clear search", "Accessible label and action for clearing the Development Items search query.", (0, i.translationKey)("Action.DevelopmentItems.ClearSearch", s.TranslationNamespace.Creations)),
            filterBy: l("Label.FilterBy"),
            firstPage: c("First page", "Accessible label for the Development Items pagination first-page button.", (0, i.translationKey)("Action.DevelopmentItems.FirstPage", s.TranslationNamespace.Creations)),
            grid: c("Grid", "Accessible label for the Development Items grid view.", (0, i.translationKey)("Label.DevelopmentItems.GridView", s.TranslationNamespace.Creations)),
            inventorySource: c("Source", "Label for the Development Items source filter and table column.", (0, i.translationKey)("Label.DevelopmentItems.InventorySource", s.TranslationNamespace.Creations)),
            inventorySourceFilter: m,
            lastPage: c("Last page", "Accessible label for the Development Items pagination last-page button.", (0, i.translationKey)("Action.DevelopmentItems.LastPage", s.TranslationNamespace.Creations)),
            lastUpdated: l("Label.LastUpdated"),
            list: c("List", "Accessible label for the Development Items list view.", (0, i.translationKey)("Label.DevelopmentItems.ListView", s.TranslationNamespace.Creations)),
            loading: l("Label.Loading"),
            name: l("Label.Name"),
            nextPage: c("Next page", "Accessible label for the Development Items pagination next-page button.", (0, i.translationKey)("Action.DevelopmentItems.NextPage", s.TranslationNamespace.Creations)),
            noArchivedItemsDescription: c("Items you archive will show up here.", "Guidance shown when the Development Items Archived folder is empty.", (0, i.translationKey)("Description.DevelopmentItems.NoArchivedItems", s.TranslationNamespace.Creations)),
            noArchivedItems: c("No archived items", "Heading shown when the Development Items Archived folder is empty.", (0, i.translationKey)("Heading.DevelopmentItems.NoArchivedItems", s.TranslationNamespace.Creations)),
            noDevelopmentItemsDescription: c("Upload assets to see them here.", "Guidance shown when the creator has no Development Items across all asset types.", (0, i.translationKey)("Description.DevelopmentItems.NoDevelopmentItems", s.TranslationNamespace.Creations)),
            noDevelopmentItems: c("No development items yet", "Heading shown when the creator has no Development Items across all asset types.", (0, i.translationKey)("Heading.DevelopmentItems.NoDevelopmentItems", s.TranslationNamespace.Creations)),
            noItemsDescription: c("Try another search or filter.", "Guidance shown when no Development Items match the current query and filters.", (0, i.translationKey)("Description.DevelopmentItems.NoItemsFound", s.TranslationNamespace.Creations)),
            noItems: c("No items found", "Heading shown when no Development Items match the current query and filters.", (0, i.translationKey)("Heading.DevelopmentItems.NoItemsFound", s.TranslationNamespace.Creations)),
            package: c("Package", "Accessible label for the package indicator on a Development Item thumbnail.", (0, i.translationKey)("Label.DevelopmentItems.Package", s.TranslationNamespace.Creations)),
            previousPage: c("Previous page", "Accessible label for the Development Items pagination previous-page button.", (0, i.translationKey)("Action.DevelopmentItems.PreviousPage", s.TranslationNamespace.Creations)),
            retry: l("Action.Retry"),
            rowsPerPage: l("Label.RowsPerPage"),
            search: l("Label.Search"),
            searchSuggestion: h,
            searchWithinAssetType: c("Search within asset type", "Accessible label for Development Items scoped-search suggestions.", (0, i.translationKey)("Label.DevelopmentItems.SearchWithinAssetType", s.TranslationNamespace.Creations)),
            sortBestMatch: c("Sort by: Best match", "Development Items sort shown while a search query ranks results by relevance.", (0, i.translationKey)("Label.DevelopmentItems.SortByBestMatch", s.TranslationNamespace.Creations)),
            sortBy: c("Sort by", "Accessible label for the Development Items sort selector.", (0, i.translationKey)("Label.DevelopmentItems.SortBy", s.TranslationNamespace.Creations)),
            sortCreatedNewest: c("Sort by: Created (newest first)", "Development Items sort option listing the most recently created assets first.", (0, i.translationKey)("Label.DevelopmentItems.SortByCreatedNewest", s.TranslationNamespace.Creations)),
            sortCreatedOldest: c("Sort by: Created (oldest first)", "Development Items sort option listing the earliest created assets first.", (0, i.translationKey)("Label.DevelopmentItems.SortByCreatedOldest", s.TranslationNamespace.Creations)),
            sortUpdatedNewest: c("Sort by: Updated (newest first)", "Development Items sort option listing the most recently updated assets first.", (0, i.translationKey)("Label.DevelopmentItems.SortByUpdatedNewest", s.TranslationNamespace.Creations)),
            sortUpdatedOldest: c("Sort by: Updated (oldest first)", "Development Items sort option listing the least recently updated assets first.", (0, i.translationKey)("Label.DevelopmentItems.SortByUpdatedOldest", s.TranslationNamespace.Creations)),
            sharedWithMe: c("Shared with me", "Source filter option for Development Items shared with the current creator.", (0, i.translationKey)("Label.DevelopmentItems.SharedWithMe", s.TranslationNamespace.Creations)),
            showHiddenBreadcrumbs: c("Show hidden pages", "Accessible label for the button that expands collapsed pages in the Development Items breadcrumbs.", (0, i.translationKey)("Action.DevelopmentItems.ShowHiddenBreadcrumbs", s.TranslationNamespace.Creations)),
            unavailableDescription: c("Try again in a moment.", "Guidance shown when the Development Items inventory cannot be loaded.", (0, i.translationKey)("Description.DevelopmentItems.InventoryUnavailable", s.TranslationNamespace.Creations)),
            unavailable: c("Inventory is unavailable", "Heading shown when the Development Items inventory cannot be loaded.", (0, i.translationKey)("Heading.DevelopmentItems.InventoryUnavailable", s.TranslationNamespace.Creations)),
            viewSelector: c("Choose grid or list view", "Accessible label for the Development Items view selector.", (0, i.translationKey)("Label.DevelopmentItems.ViewSelector", s.TranslationNamespace.Creations)),
            uploadedByMe: c("Uploaded", "Source filter option for Development Items uploaded by the current creator.", (0, i.translationKey)("Label.DevelopmentItems.UploadedByMe", s.TranslationNamespace.Creations))
        }
    }])
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
    var t = e.i(500758),
        a = e.i(239328);
    e.s(["default", 0, () => {
        let {
            ready: e,
            value: r
        } = (0, t.useFlag)(a.enableTaxonomyBasedCreatorDashboard);
        return e && null != r && r
    }])
}, 348558, e => {
    "use strict";
    var t = e.i(500758),
        a = e.i(9436);
    e.s(["default", 0, () => {
        let {
            ready: e,
            value: r
        } = (0, t.useFlag)(a.isTextDocumentEnabled);
        if (e) return r
    }])
}, 100226, e => {
    "use strict";
    var t = e.i(500758),
        a = e.i(239328);
    e.s(["default", 0, () => {
        let {
            ready: e,
            value: r
        } = (0, t.useFlag)(a.enableCreatorShowcases);
        if (e) return r
    }])
}, 418564, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        r = e.i(826246),
        n = e.i(79187);
    let i = {
        info: "Info",
        warning: "Warning",
        error: "Error"
    };
    e.s(["default", 0, e => {
        let {
            alertTitle: s,
            alertDescription: l,
            severity: o,
            externalLink: c,
            linkLabel: d,
            allowCloseDialog: u,
            onDismiss: m
        } = e, {
            translate: p
        } = (0, n.useTranslation)(), [h, f] = (0, a.useState)(!0);
        if (!h) return null;
        let v = u ? {
            closeLabel: p("Action.Close"),
            onDismiss: () => {
                null == m || m(), f(!1)
            }
        } : {
            hasCloseAffordance: !1
        };
        return (0, t.jsx)(r.Alert, {
            severity: i[o],
            variant: "Feedback",
            className: "width-full",
            primaryActionLabel: d,
            primaryActionHref: c,
            ...v,
            children: (0, t.jsxs)("div", {
                className: "flex flex-col gap-xsmall",
                children: [s && (0, t.jsx)("span", {
                    className: "text-label-medium content-emphasis",
                    children: s
                }), (0, t.jsx)("span", {
                    className: "text-body-medium text-truncate-split content-default width-full",
                    children: l
                })]
            })
        })
    }])
}, 668091, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(109543);
    e.s(["default", 0, function() {
        return (0, t.useContext)(a.default)
    }])
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
        r = [t.Locale.Indonesian, t.Locale.German, t.Locale.English, t.Locale.Spanish, t.Locale.French, t.Locale.Italian, t.Locale.Polish, t.Locale.BrazilPortuguese, t.Locale.Vietnamese, t.Locale.Turkish, t.Locale.Arabic, t.Locale.Thai, t.Locale.SimplifiedChinese, t.Locale.TraditionalChinese, t.Locale.Japanese, t.Locale.Korean];
    e.s(["StringLocaleMap", 0, a, "availableDocsLocales", 0, r])
}, 321211, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340);
    e.s(["default", 0, e => {
        let {
            className: r,
            onChange: n,
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
        }, f = c ? c(p, h, e => {
            e.preventDefault();
            let {
                dataTransfer: {
                    files: t
                }
            } = e;
            n && n(t)
        }, e => {
            e.preventDefault(), i && i()
        }, e => {
            e.preventDefault(), s && s()
        }) : null;
        return (0, t.jsxs)("div", {
            className: r,
            children: [f, (0, t.jsx)("input", {
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
                    n && n(t.files), m.current && (m.current.value = "")
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
        r = e.i(79187),
        n = e.i(572676),
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
    let f = {
            compact: 32,
            medium: 48,
            large: 64
        },
        v = {
            compact: 12,
            medium: 16,
            large: 20
        },
        y = {
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
                    width: f[a],
                    height: f[a],
                    marginRight: v[a]
                },
                userBorderRadius: {
                    borderRadius: y[a]
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
                target: v,
                targetType: y,
                displayNameOverride: g,
                adornment: A,
                label: T,
                disabled: I,
                variant: C = "medium",
                disableLink: S = !1,
                obfuscate: E = !1,
                hideThumbnail: x = !1,
                hideSecondaryLabel: w = !1,
                textVariant: N = "primary",
                labelTooltip: D,
                secondaryLabelClassName: L
            } = e,
            {
                classes: {
                    container: k,
                    avatarContainer: P,
                    thumbnailItemContainer: M,
                    thumbnailBackground: _,
                    userBorderRadius: F,
                    nonUserBorderRadius: R,
                    itemText: V,
                    mutedText: U,
                    disabledThumbnail: B,
                    textContainer: O
                },
                cx: j
            } = b({
                variant: C
            }),
            {
                translate: G
            } = (0, r.useTranslation)(),
            K = (0, a.useMemo)(() => y === p.default.User ? n.ThumbnailTypes.avatarHeadshot : y === p.default.Group ? n.ThumbnailTypes.groupIcon : "Ugc" === y ? n.ThumbnailTypes.assetThumbnail : n.ThumbnailTypes.universeThumbnail, [y]),
            z = (0, a.useMemo)(() => {
                if (!S && v.id && !E) {
                    if (y === p.default.User) return h.www.getUserUrl(v.id);
                    if (y === p.default.Group) return h.www.getGroupUrl(v.id);
                    if ("Experience" === y) {
                        let e = "rootPlaceId" in v ? v.rootPlaceId : void 0;
                        return e ? h.www.getGameDetailsUrl(e) : void 0
                    }
                    if ("Ugc" === y) return h.www.getCatalogUrl(v.id)
                }
            }, [S, v, E, y]);
        g ? l = g : y === p.default.User ? l = "displayName" in v ? v.displayName : void 0 : "Ugc" !== y && (l = "name" in v ? v.name : void 0);
        let H = !g && (y === p.default.User && !("displayName" in v && v.displayName) || "Ugc" === y),
            q = (0, a.useMemo)(() => {
                let e;
                return (0, t.jsxs)(s.Grid, {
                    container: !0,
                    direction: "row",
                    alignItems: "center",
                    wrap: "wrap",
                    children: [H ? (0, t.jsx)(d.Skeleton, {
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
                            variant: "secondary" === N ? "body1" : "compact" === C ? "captionHeader" : "large" === C ? "h2" : "h5",
                            color: I ? "disabled" : "inherit",
                            children: E ? G("Label.Other") : l
                        }), T && T.length > 0 && (0, t.jsx)(m.Tooltip, {
                            arrow: !0,
                            title: D,
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
                        children: [y === p.default.User && (0, t.jsx)(t.Fragment, {
                            children: "name" in v && !v.name ? (0, t.jsx)(d.Skeleton, {
                                animate: !0,
                                variant: "text",
                                width: 192,
                                height: 20
                            }) : (0, t.jsx)(i.Typography, {
                                variant: "secondary" === N ? "body2" : "captionBody",
                                className: j(O, {
                                    [U]: void 0 === L && ("secondary" === N || "compact" === C)
                                }),
                                color: I ? "disabled" : "inherit",
                                children: (e = E ? G("Label.Other") : "@".concat("name" in v ? v.name : ""), L ? (0, t.jsx)("span", {
                                    className: L,
                                    children: e
                                }) : e)
                            })
                        }), (y === p.default.Group || "Experience" === y) && (0, t.jsx)(i.Typography, {
                            variant: "captionBody",
                            className: j(O, {
                                [U]: void 0 === L && ("secondary" === N || "compact" === C)
                            }),
                            color: I ? "disabled" : "inherit",
                            children: L ? (0, t.jsx)("span", {
                                className: L,
                                children: E ? G("Label.Other") : v.id
                            }) : E ? G("Label.Other") : v.id
                        })]
                    })]
                })
            }, [H, l, y, v, O, I, E, G, T, w, j, U, N, C, D, L]);
        return (0, t.jsx)(s.Grid, {
            container: !0,
            direction: "row",
            alignItems: "center",
            wrap: "nowrap",
            justifyContent: "space-between",
            className: k,
            children: (null == v ? void 0 : v.id) === void 0 ? (0, t.jsx)(d.Skeleton, {
                animate: !0,
                variant: "rectangular",
                width: "100%",
                height: f[C]
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
                            className: j(P, {
                                [F]: y === p.default.User,
                                [R]: y !== p.default.User,
                                [B]: I
                            }),
                            children: (0, t.jsx)(n.Thumbnail2d, {
                                targetId: v.id,
                                type: K,
                                imgClassName: _,
                                alt: "thumbnail",
                                returnPolicy: n.ReturnPolicy.PlaceHolder,
                                includeBackground: !1
                            })
                        })
                    }), (0, t.jsx)(s.Grid, {
                        container: !0,
                        direction: "column",
                        className: k,
                        children: (0, t.jsx)(s.Grid, {
                            item: !0,
                            children: S || E ? q : (0, t.jsx)(c.Link, {
                                href: z,
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
}, 296380, e => {
    "use strict";
    var t = e.i(416340);
    let a = (e, a) => {
        let r = (0, t.useRef)(null),
            n = (0, t.useCallback)(() => {
                null !== r.current && (clearTimeout(r.current), r.current = null)
            }, [r]);
        return [(0, t.useCallback)(function() {
            for (var t = arguments.length, i = Array(t), s = 0; s < t; s++) i[s] = arguments[s];
            n(), r.current = window.setTimeout(() => {
                e(...i), r.current = null
            }, a)
        }, [e, a, n]), n, r]
    };
    e.s(["default", 0, a, "useDebouncedFunction", 0, a])
}, 227700, e => {
    "use strict";
    var t = e.i(60373);
    e.s(["useIXPParameters", () => t.default])
}, 198528, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(589624);
    e.s(["default", 0, (e, r) => {
        let n = (0, a.useRouter)(),
            i = n.query;
        return [(0, t.useMemo)(() => {
            let t = null != i ? i : {},
                a = {};
            for (let r of e) a[r] = t[r];
            return a
        }, [e, i]), (0, t.useCallback)(function(t) {
            var a;
            let i = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {
                    skipHistory: !1
                },
                s = null != (a = n.query) ? a : {},
                l = {
                    ...s
                };
            e.forEach(e => {
                if (!Object.hasOwn(t, e)) return;
                let a = t[e];
                null == a ? delete l[e] : Array.isArray(a) ? l[e] = a.map(e => e.toString()) : l[e] = a.toString()
            }), Array.from(new Set([...Object.keys(s), ...Object.keys(l)])).every(e => ((e, t) => {
                if (null == e && null == t) return !0;
                if (null == e || null == t) return !1;
                let a = Array.isArray(e) ? e : [e],
                    r = Array.isArray(t) ? t : [t];
                return a.length === r.length && a.every((e, t) => e === r[t])
            })(s[e], l[e])) || (i.skipHistory ? n.replace({
                pathname: n.pathname,
                query: l
            }) : n.push({
                pathname: n.pathname,
                query: l
            }, void 0, r))
        }, [n, e, r])]
    }, "normalizeSingleQueryParam", 0, e => {
        let t = Array.isArray(e) ? e[0] : e;
        return "" === t || null == t ? void 0 : t
    }])
}, 780880, e => {
    "use strict";
    var t = e.i(198528);
    e.s(["useQueryParams", () => t.default])
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

    function r(e) {
        var t, a, r, n;
        if ((null == e ? void 0 : e.mode) === "standalone") return {
            mode: "standalone",
            shouldUnmountOnClose: null == (n = e.shouldUnmountOnClose) || n
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
            shouldUnmountOnClose: null == (r = i.shouldUnmountOnClose) || r
        }
    }
    let n = r(),
        i = {
            ...t = (0, a.createStore)({
                render: null,
                options: null,
                isOpen: !1
            }),
            open: (e, a) => {
                t.setState({
                    render: e,
                    options: r(a),
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
    e.s(["DEFAULT_RESOLVED_CONTENT_OPTIONS", 0, n, "dialogStore", 0, i])
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
                let r = a;
                a = {
                    ...a,
                    ...e
                }, t.forEach(e => e(a, r))
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
        r = (0, t.createStore)({
            current: null
        }),
        n = {
            ...r,
            enqueue: function(e) {
                var t, n;
                let i = r.getSnapshot().current;
                null == i || null == (t = (n = i.props).onClose) || t.call(n), a += 1, r.setState({
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
                } = r.getSnapshot();
                a && (null == (e = (t = a.props).onClose) || e.call(t), r.setState({
                    current: null
                }))
            }
        };
    e.s(["snackbarStore", 0, n])
}, 125677, 20227, e => {
    "use strict";
    var t = e.i(416340);
    e.s(["useCurrentPage", 0, function(e, a) {
        let {
            page: r,
            rowsPerPage: n,
            hasNextPage: i,
            fetchNextPage: s,
            fetchLimit: l = n
        } = a, o = (0, t.useMemo)(() => {
            let t = r * n;
            return e.slice(t, t + n)
        }, [e, r, n]), c = (r + 1) * l >= e.length;
        return (0, t.useEffect)(() => {
            c && i && (null == s || s())
        }, [c, i, s]), {
            currentPage: o
        }
    }], 125677), e.s(["useTablePagination", 0, function(e) {
        let {
            count: a,
            initialRowsPerPage: r = 50,
            resetKey: n
        } = e, [i, s] = (0, t.useState)(0), [l, o] = (0, t.useState)(r), [c, d] = (0, t.useState)(n);
        n !== c && (d(n), s(0));
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
            fetchNextPage: r,
            disabled: n,
            intervalMs: i = 1e3
        } = e, s = (0, t.useRef)(r);
        s.current = r, (0, t.useEffect)(() => {
            if (!a || n) return;
            s.current();
            let e = setInterval(() => {
                s.current()
            }, i);
            return () => clearInterval(e)
        }, [a, n, i])
    }])
}, 85057, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(602635),
        r = e.i(79187),
        n = e.i(611043),
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
        })),
        c = e => {
            var r;
            let {
                item: n,
                isTopLevel: i = !1
            } = e;
            return (0, t.jsx)(a.NavigationTreeItem, {
                label: n.label,
                nodeId: n.key,
                href: n.href,
                adornment: n.adornment,
                variant: i ? "smallLabel2" : "smallLabel1",
                onClick: n.onClick,
                children: null == (r = n.subItems) ? void 0 : r.map(e => (0, t.jsx)(c, {
                    item: e
                }, e.key))
            })
        };
    e.s(["default", 0, e => {
        let {
            header: s,
            items: d,
            icon: u,
            activeKey: m,
            defaultExpanded: p,
            headerAction: h
        } = e, {
            classes: f
        } = o(), {
            ready: v
        } = (0, r.useTranslation)();
        return v ? (0, t.jsxs)(i.Grid, {
            classes: {
                root: f.container
            },
            children: [s && (0, t.jsxs)(t.Fragment, {
                children: [(0, t.jsxs)(i.Grid, {
                    classes: {
                        root: f.headerContainer
                    },
                    children: [u && (0, t.jsx)(i.Grid, {
                        classes: {
                            root: f.icon
                        },
                        children: u
                    }), (0, t.jsx)(n.Typography, {
                        variant: "largeLabel2",
                        classes: {
                            root: f.header
                        },
                        children: (0, t.jsx)("span", {
                            className: f.headerText,
                            children: s
                        })
                    }), h && (0, t.jsx)(i.Grid, {
                        classes: {
                            root: f.headerAction
                        },
                        children: h
                    })]
                }), (0, t.jsx)(l.Divider, {
                    classes: {
                        root: f.divider
                    }
                })]
            }), d.length > 0 && (0, t.jsx)(a.NavigationTree, {
                selected: m,
                defaultExpanded: p,
                children: d.map(e => (0, t.jsx)(c, {
                    item: e,
                    isTopLevel: !0
                }, e.key))
            })]
        }) : null
    }])
}, 373736, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(968892),
        r = e.i(973047),
        n = e.i(79187),
        i = e.i(611043);
    e.s(["default", 0, e => {
        let {
            open: s,
            onOpenChange: l,
            onContinueWithId: o,
            onAddParent: c
        } = e, {
            translate: d
        } = (0, n.useTranslation)();
        return (0, t.jsx)(r.Dialog, {
            open: s,
            onOpenChange: l,
            size: "Small",
            isModal: !0,
            hasCloseAffordance: !0,
            closeLabel: d("Action.Close"),
            children: (0, t.jsxs)(r.DialogContent, {
                children: [(0, t.jsxs)(r.DialogBody, {
                    className: "flex flex-col gap-medium",
                    children: [(0, t.jsx)(r.DialogTitle, {
                        className: "text-heading-medium margin-y-none",
                        children: d("Label.IdVerification")
                    }), (0, t.jsx)(i.Typography, {
                        className: "text-body-medium",
                        children: d("Description.IdVerifiedDialog")
                    }), (0, t.jsx)(i.Typography, {
                        className: "text-body-medium",
                        children: d("Description.IdVerifiedDialogReverify")
                    })]
                }), (0, t.jsxs)(r.DialogFooter, {
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
        r = e.i(605050);
    let n = ["creatorEligibility"];
    e.s(["creatorEligibilityQueryKeyPrefix", 0, n, "useCreatorEligibility", 0, function() {
        let {
            overrideUserId: e,
            isReady: i = !0,
            refetchInterval: s = !1
        } = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {}, {
            user: l
        } = (0, a.useAuthentication)(), o = null == l ? void 0 : l.id, c = null != e ? e : o;
        return (0, t.useQuery)({
            queryKey: [...n, null != c ? c : null],
            queryFn: async () => r.default.coreContentGetCreatorEligibility({
                userId: c
            }),
            enabled: i && !!c,
            refetchInterval: s,
            refetchIntervalInBackground: !0
        })
    }])
}, 868505, e => {
    "use strict";
    var t = e.i(157310),
        a = e.i(814975),
        r = e.i(605050);
    e.s(["usePublishPermissions", 0, function() {
        let {
            overrideUserId: e,
            isReady: n = !0
        } = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {}, {
            user: i
        } = (0, a.useAuthentication)(), s = null == i ? void 0 : i.id, l = null != e ? e : s;
        return (0, t.useQuery)({
            queryKey: ["publishPermissions", null != l ? l : null],
            queryFn: async () => r.default.coreContentGetCreatorPublishPermissions({
                userId: l
            }),
            enabled: n && !!l
        })
    }])
}, 561098, e => {
    "use strict";
    var t = e.i(665591),
        a = e.i(917852);
    let r = {
            [t.CreatorTierEnum.Private]: "Label.TierStarter",
            [t.CreatorTierEnum.Trusted]: "Label.TierCommunity",
            [t.CreatorTierEnum.Everyone]: "Label.TierProfessional"
        },
        n = {
            [t.CreatorTierEnum.Private]: "Description.TierStarter",
            [t.CreatorTierEnum.Trusted]: "Description.TierCommunity",
            [t.CreatorTierEnum.Everyone]: "Description.TierProfessional"
        },
        i = {
            [t.CreatorTierEnum.Private]: "Label.TierVietnamLocal",
            [t.CreatorTierEnum.Trusted]: "Label.TierWorldwideTrusted",
            [t.CreatorTierEnum.Everyone]: "Label.TierWorldwideAllAges"
        },
        s = {
            [t.CreatorTierEnum.Private]: "Description.TierContentMaturity",
            [t.CreatorTierEnum.Trusted]: "Description.TierContentMaturity",
            [t.CreatorTierEnum.Everyone]: "Description.TierContentMaturity"
        },
        l = {
            [t.CreatorTierEnum.Trusted]: "Message.ApprovedForTrustedFriends",
            [t.CreatorTierEnum.Everyone]: "Message.ApprovedForAllAges"
        },
        o = e => e === t.CreatorTierEnum.Private || e === t.CreatorTierEnum.Trusted || e === t.CreatorTierEnum.Everyone;
    e.s(["isRequiredForTier", 0, (e, t) => e.tierRequirements.some(e => e.tier === t && e.isRequired), "mapPublishPermissionsToView", 0, e => {
        let c = "VN" === e.countryCode,
            d = new Set(e.notices.map(e => e.key)),
            u = d.has(t.CreatorNoticeKeyEnum.CurrentTierAllowlisted),
            m = e.requirements.flatMap(r => {
                let n = ((e, r, n) => {
                    if ("VN" === n) {
                        if (e === t.CreatorEligibilityEnum.PhoneVerified) return {
                            labelKey: "Label.PhoneVerification",
                            descriptionKey: "Description.PhoneVerification",
                            actionUrl: a.phoneVerificationActionUrl
                        };
                        if (e === t.CreatorEligibilityEnum.IdVerified) return {
                            labelKey: "Label.IdVerification",
                            descriptionKey: "Description.IdVerificationGovtIdOrParental",
                            actionUrl: a.idVerificationActionUrl
                        }
                    }
                    return e === t.CreatorEligibilityEnum.ModerationStatusOk ? {
                        labelKey: "Label.AccountInGoodStanding",
                        descriptionKey: "Description.AccountInGoodStanding"
                    } : e === t.CreatorEligibilityEnum.IdVerified ? r === t.AgeBracketEnum.Under13 ? {
                        labelKey: "Label.U13IdVerification",
                        descriptionKey: "Description.U13IdVerification",
                        actionUrl: a.parentLinkActionUrl
                    } : r === t.AgeBracketEnum.Between13And18 ? {
                        labelKey: "Label.IdVerification",
                        descriptionKey: "Description.B13To18IdVerification"
                    } : {
                        labelKey: "Label.IdVerification",
                        descriptionKey: "Description.IdVerification",
                        actionUrl: a.idVerificationActionUrl
                    } : e === t.CreatorEligibilityEnum.AgeEstimationVerified ? {
                        labelKey: "Label.AgeCheck",
                        descriptionKey: "Description.AgeCheck",
                        actionUrl: a.ageVerificationActionUrl
                    } : e === t.CreatorEligibilityEnum.Has2SvEnabled ? {
                        labelKey: "Label.TwoStepVerification",
                        descriptionKey: "Description.TwoStepVerification",
                        actionUrl: a.twoStepVerificationActionUrl
                    } : void 0
                })(r.id, e.ageBracket, e.countryCode);
                return n ? [{
                    ...r,
                    labelKey: n.labelKey,
                    descriptionKey: n.descriptionKey,
                    actionUrl: n.actionUrl
                }] : []
            });
        return {
            currentTier: e.currentTier,
            ageBracket: e.ageBracket,
            tierOrder: e.tierOrder.filter(o),
            tierLabelKeys: c ? i : r,
            tierDescriptionKeys: c ? s : n,
            requirements: m,
            approvalBannerKey: u ? l[e.currentTier] : void 0,
            showPlusEligibilityBanner: d.has(t.CreatorNoticeKeyEnum.PlusEligibility),
            showParentLinkExpirationBanner: d.has(t.CreatorNoticeKeyEnum.ParentLinkExpiration),
            noticeKeys: d
        }
    }], 561098)
}, 57798, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        r = e.i(665591),
        n = e.i(826246),
        i = e.i(79187),
        s = e.i(533414),
        l = e.i(814975),
        o = e.i(881670),
        c = e.i(868505),
        d = e.i(561098);
    let u = e => e === r.CreatorNoticeKeyEnum.PlusGrantEndingSoon || e === r.CreatorNoticeKeyEnum.PlusGrantGracePeriod || e === r.CreatorNoticeKeyEnum.PlusGrantExpired,
        m = e => {
            let {
                phase: a,
                onDismiss: s
            } = e, {
                translateWithNamespace: l
            } = (0, i.useTranslation)(), c = {
                [r.CreatorNoticeKeyEnum.PlusGrantEndingSoon]: l(o.TranslationNamespace.Home, "Description.PlusGrantLapseEnds"),
                [r.CreatorNoticeKeyEnum.PlusGrantGracePeriod]: l(o.TranslationNamespace.Home, "Description.PlusGrantLapseGrace"),
                [r.CreatorNoticeKeyEnum.PlusGrantExpired]: l(o.TranslationNamespace.Home, "Description.PlusGrantLapseEnded")
            } [a];
            return (0, t.jsx)(n.Alert, {
                variant: "Feedback",
                severity: a === r.CreatorNoticeKeyEnum.PlusGrantExpired ? "Warning" : "Info",
                primaryActionLabel: l(o.TranslationNamespace.Home, "Action.GetPlus"),
                primaryActionHref: a === r.CreatorNoticeKeyEnum.PlusGrantEndingSoon ? "https://devforum.roblox.com/t/introducing-roblox-plus/4567894" : "https://".concat("roblox.com", "/plus"),
                closeLabel: l(o.TranslationNamespace.Creations, "Action.Dismiss"),
                onDismiss: s,
                children: (0, t.jsx)("span", {
                    children: c
                })
            })
        },
        p = e => {
            var r;
            let {
                phase: n
            } = e, {
                user: i
            } = (0, l.useAuthentication)(), [o, c] = (0, s.useLocalStorage)("plusGrantLapseBanner.".concat(n, ".").concat(null != (r = null == i ? void 0 : i.id) ? r : "anonymous"), !1), d = (0, a.useCallback)(() => c(!0), [c]);
            return o ? null : (0, t.jsx)("div", {
                className: "margin-bottom-[var(--gap-large)]",
                children: (0, t.jsx)(m, {
                    phase: n,
                    onDismiss: d
                })
            })
        },
        h = (0, i.withTranslation)(() => {
            let {
                data: e,
                isPending: a,
                isError: r
            } = (0, c.usePublishPermissions)();
            if (a || r || !e) return null;
            let {
                noticeKeys: n
            } = (0, d.mapPublishPermissionsToView)(e), i = [...n].find(u);
            return i ? (0, t.jsx)(p, {
                phase: i
            }, i) : null
        }, [o.TranslationNamespace.Home, o.TranslationNamespace.Creations]);
    e.s(["default", 0, h])
}, 845592, 448005, e => {
    "use strict";
    var t, a = e.i(221628),
        r = e.i(416340),
        n = e.i(445550),
        i = ((t = {}).FrontendFlagEnableNonPluginDistributionRestrictions = "PublicFrontendMDR", t.FrontendFlagEnableModelPricingTransition = "PublicFrontendEMPT", t.FrontendFlagEnableSocialLinkCustomTitles = "PublicFrontendSLCT", t.FrontendFlagEnableAudioWavUpload = "PublicFrontendAWU", t.FrontendFlagEnableAudioFlacUpload = "PublicFrontendAFU", t.FrontendFlagEnableCreatorInsightsPage = "PublicFrontendCIP", t.FrontendFlagEnableTryAssetSocialLink = "PublicFrontendETIR", t.FrontendFlagEnableTryAssetDefaultExperience = "PublicFrontendETADE", t.FrontendFlagEnablePaidModelDependenciesModal = "PublicFrontendPMDM", t.FrontendFlagTaxonomyExperiment = "PublicFrontendTE", t.FrontendFlagUniverseBansManagerLabelUpdate = "PublicFrontendUBMLU", t.FrontendFlagEnableHiddenFromSearchVisibilityAlert = "PublicFrontendHFS", t);
    let s = Object.values(i),
        l = (e => {
            let t = {};
            for (let a of s) t[a] = e(a);
            if (!s.every(e => Object.hasOwn(t, e))) throw Error("Failed to build frontend flags.");
            return t
        })(() => !1);
    e.s(["DEFAULT_FRONTEND_FLAGS", 0, l, "FRONTEND_FLAG_NAMES", 0, s, "FrontendFlagName", () => i], 448005);
    let o = (0, r.createContext)(null);
    e.s(["default", 0, e => {
        let {
            children: t
        } = e, [i, c] = (0, r.useState)(l), [d, u] = (0, r.useState)(!1), m = (0, r.useCallback)(async e => {
            try {
                let t = await n.default.getFrontendFlagsValues(e),
                    a = Object.assign({}, ...s.map(e => {
                        var a, r;
                        return {
                            [e]: null != (a = null == t || null == (r = t.data) ? void 0 : r[e]) && a
                        }
                    }));
                c(a)
            } catch (e) {}
        }, []);
        (0, r.useEffect)(() => {
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
        let p = (0, r.useMemo)(() => ({
            frontendFlags: i,
            getFrontendFlags: m,
            loadingFrontendFlags: d
        }), [i, m, d]);
        return (0, a.jsx)(o.Provider, {
            value: p,
            children: t
        })
    }, "useToolboxServiceApiProvider", 0, function() {
        let e = (0, r.useContext)(o);
        if (null === e) throw Error("useToolboxServiceApiProvider must be used within a ToolboxServiceApiProvider");
        return e
    }], 845592)
}, 796266, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(589624),
        r = e.i(745873);
    let n = e => {
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
            } = (0, r.useGroups)(),
            c = (0, t.useRef)(!1),
            d = (0, t.useRef)(!1),
            u = (0, t.useMemo)(() => {
                if (!e.isReady) return null;
                let t = n(e.query.groupId),
                    a = n(e.query.userId);
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
}, 466538, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(174617),
        r = e.i(78892),
        n = e.i(608652),
        i = e.i(199786),
        s = e.i(300792),
        l = e.i(692166),
        o = e.i(600317),
        c = e.i(221628),
        d = "Switch",
        [u, m] = (0, n.createContextScope)(d),
        [p, h] = u(d),
        f = t.forwardRef((e, n) => {
            let {
                __scopeSwitch: s,
                name: l,
                checked: u,
                defaultChecked: m,
                required: h,
                disabled: f,
                value: v = "on",
                onCheckedChange: y,
                form: A,
                ...T
            } = e, [I, C] = t.useState(null), S = (0, r.useComposedRefs)(n, e => C(e)), E = t.useRef(!1), x = !I || A || !!I.closest("form"), [w, N] = (0, i.useControllableState)({
                prop: u,
                defaultProp: null != m && m,
                onChange: y,
                caller: d
            });
            return (0, c.jsxs)(p, {
                scope: s,
                checked: w,
                disabled: f,
                children: [(0, c.jsx)(o.Primitive.button, {
                    type: "button",
                    role: "switch",
                    "aria-checked": w,
                    "aria-required": h,
                    "data-state": b(w),
                    "data-disabled": f ? "" : void 0,
                    disabled: f,
                    value: v,
                    ...T,
                    ref: S,
                    onClick: (0, a.composeEventHandlers)(e.onClick, e => {
                        N(e => !e), x && (E.current = e.isPropagationStopped(), E.current || e.stopPropagation())
                    })
                }), x && (0, c.jsx)(g, {
                    control: I,
                    bubbles: !E.current,
                    name: l,
                    value: v,
                    checked: w,
                    required: h,
                    disabled: f,
                    form: A,
                    style: {
                        transform: "translateX(-100%)"
                    }
                })]
            })
        });
    f.displayName = d;
    var v = "SwitchThumb",
        y = t.forwardRef((e, t) => {
            let {
                __scopeSwitch: a,
                ...r
            } = e, n = h(v, a);
            return (0, c.jsx)(o.Primitive.span, {
                "data-state": b(n.checked),
                "data-disabled": n.disabled ? "" : void 0,
                ...r,
                ref: t
            })
        });
    y.displayName = v;
    var g = t.forwardRef((e, a) => {
        let {
            __scopeSwitch: n,
            control: i,
            checked: o,
            bubbles: d = !0,
            ...u
        } = e, m = t.useRef(null), p = (0, r.useComposedRefs)(m, a), h = (0, s.usePrevious)(o), f = (0, l.useSize)(i);
        return t.useEffect(() => {
            let e = m.current;
            if (!e) return;
            let t = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set;
            if (h !== o && t) {
                let a = new Event("click", {
                    bubbles: d
                });
                t.call(e, o), e.dispatchEvent(a)
            }
        }, [h, o, d]), (0, c.jsx)("input", {
            type: "checkbox",
            "aria-hidden": !0,
            defaultChecked: o,
            ...u,
            tabIndex: -1,
            ref: p,
            style: {
                ...u.style,
                ...f,
                position: "absolute",
                pointerEvents: "none",
                opacity: 0,
                margin: 0
            }
        })
    });

    function b(e) {
        return e ? "checked" : "unchecked"
    }
    g.displayName = "SwitchBubbleInput", e.s(["Root", 0, f, "Thumb", 0, y])
}, 311156, e => {
    "use strict";
    var t = e.i(676089);
    e.s(["CategoryDomain", () => t.V1ItemsCategoriesGetCategoryDomainEnum])
}, 826246, e => {
    "use strict";
    var t = e.i(880343),
        a = e.i(968892),
        r = e.i(944821),
        n = e.i(24286),
        i = e.i(247268),
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
                href: r,
                linkTarget: n,
                onAction: i,
                variant: s
            } = e;
            return n ? l.default.createElement(a.Button, {
                asChild: !0,
                size: "Small",
                variant: s,
                onClick: i
            }, l.default.cloneElement(n, {}, t)) : r ? l.default.createElement(a.Button, {
                as: "a",
                href: r,
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
                linkTarget: r,
                onAction: i
            } = e;
            return r ? l.default.createElement(n.Link, {
                asChild: !0,
                onClick: i,
                size: "Medium",
                variant: "Standalone",
                underline: "always"
            }, l.default.cloneElement(r, {}, t)) : a ? l.default.createElement(n.Link, {
                href: a,
                onClick: i,
                size: "Medium",
                variant: "Standalone",
                underline: "always"
            }, t) : l.default.createElement(n.Link, {
                as: "button",
                onClick: i,
                size: "Medium",
                variant: "Standalone",
                underline: "always"
            }, t)
        },
        h = (0, l.forwardRef)((e, a) => {
            let {
                children: n,
                variant: h = "System",
                severity: f = "Info",
                primaryActionLabel: v,
                primaryActionHref: y,
                primaryActionLinkTarget: g,
                onPrimaryAction: b,
                secondaryActionLabel: A,
                secondaryActionHref: T,
                secondaryActionLinkTarget: I,
                onSecondaryAction: C,
                hasCloseAffordance: S = !0,
                closeLabel: E = "Dismiss alert",
                onDismiss: x,
                className: w,
                style: N,
                ...D
            } = e, L = (0, r.default)("foundation-web-alert-message-"), k = !!v, P = !!A, M = !!(S && x), _ = "Feedback" === h && (k || P || M), F = "Warning" === f || "Error" === f ? "alert" : "status", R = null;
            k && (R = P ? l.default.createElement(m, {
                label: v || "",
                href: y,
                linkTarget: g,
                onAction: b,
                variant: "Standard"
            }) : l.default.createElement(p, {
                label: v || "",
                href: y,
                linkTarget: g,
                onAction: b
            }));
            let V = P ? l.default.createElement(m, {
                label: A || "",
                href: T,
                linkTarget: I,
                onAction: C,
                variant: "Utility"
            }) : null;
            return l.default.createElement("div", {
                ref: a,
                role: _ ? "region" : F,
                "aria-labelledby": _ ? L : void 0,
                className: (0, s.default)("foundation-web-alert relative width-full stroke-standard", "System" === h ? "[border-left-width:0] [border-right-width:0]" : "radius-medium", d[f], w),
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
                    color: c[f]
                }
            }))), l.default.createElement("div", {
                className: (0, s.default)("flex grow-1 basis-0 min-width-0 items-start gap-x-medium gap-y-small", P ? "flex-col" : "wrap")
            }, l.default.createElement("div", {
                id: _ ? L : void 0,
                role: _ ? F : void 0,
                className: (0, s.default)("flex items-center padding-top-[var(--size-150)] text-body-medium text-wrap content-emphasis [overflow-wrap:anywhere]", P ? "width-full min-width-0" : "grow-1 basis-0 min-width-[min(200px,100%)]")
            }, n), (R || V) && l.default.createElement("div", {
                className: (0, s.default)("flex items-center gap-small wrap shrink-0", !P && "padding-y-[var(--size-150)]")
            }, R, V)), M && l.default.createElement(i.CloseAffordance, {
                variant: "Utility",
                size: "Medium",
                isCircular: !0,
                className: "content-emphasis shrink-0 padding-[var(--size-150)]",
                "aria-label": E,
                onClick: x
            })))
        });
    e.s(["Alert", 0, h])
}, 420028, e => {
    "use strict";
    var t = e.i(737586),
        a = e.i(999544),
        r = e.i(880343),
        n = e.i(197649),
        i = e.i(416340);
    let s = {
            Small: "XSmall",
            Medium: "Small",
            Large: "Medium"
        },
        l = {
            Small: ["height-600", "text-label-small"],
            Medium: ["height-800", "text-label-medium"],
            Large: ["height-1000", "text-label-medium"]
        },
        o = {
            Small: "padding-left-small",
            Medium: "padding-left-medium",
            Large: "padding-left-large"
        },
        c = {
            Small: "padding-left-small",
            Medium: "padding-left-medium",
            Large: "padding-left-medium"
        },
        d = {
            Small: "padding-right-small",
            Medium: "padding-right-medium",
            Large: "padding-right-large"
        },
        u = {
            Small: "padding-right-small",
            Medium: "padding-right-medium",
            Large: "padding-right-medium"
        },
        m = {
            Small: "padding-left-xsmall",
            Medium: "padding-left-[var(--size-150)]",
            Large: "padding-left-small"
        },
        p = {
            Small: "padding-right-[var(--size-150)]",
            Medium: "padding-right-small",
            Large: "padding-right-[var(--size-250)]"
        },
        h = {
            Standard: "bg-shift-300",
            Utility: "bg-none"
        },
        f = {
            Small: "size-[var(--icon-size-xsmall)]",
            Medium: "size-[var(--icon-size-small)]",
            Large: "size-[var(--icon-size-medium)]"
        },
        v = e => {
            let {
                iconName: t,
                node: a,
                size: l
            } = e;
            return null != t ? i.default.createElement(r.Icon, {
                name: t,
                size: s[l]
            }) : null != a ? i.default.createElement("span", {
                className: (0, n.default)("inline-flex items-center justify-center shrink-0", f[l])
            }, a) : null
        },
        y = (0, i.forwardRef)((e, r) => {
            let {
                className: s,
                style: f,
                text: y,
                isDisabled: g = !1,
                size: b = "Medium",
                variant: A = "Standard",
                leadingIconName: T,
                leadingIconNode: I,
                trailingIconName: C,
                trailingIconNode: S,
                ...E
            } = e, x = null != T || null != I, w = null != C || null != S, N = (0, n.default)(g ? a.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex justify-center items-center radius-circle stroke-none", x ? c[b] : o[b], w ? u[b] : d[b], l[b], s), D = i.default.createElement(i.default.Fragment, null, i.default.createElement(t.StateLayer, null), i.default.createElement(v, {
                iconName: T,
                node: I,
                size: b
            }), i.default.createElement("span", {
                className: (0, n.default)("padding-y-xsmall text-no-wrap text-truncate-end", x && m[b], w && p[b])
            }, y), i.default.createElement(v, {
                iconName: C,
                node: S,
                size: b
            })), L = {
                textDecoration: "none",
                ...f
            };
            if ("a" === E.as) {
                let {
                    as: e,
                    href: t,
                    ...a
                } = E;
                return i.default.createElement("a", {
                    ref: r,
                    ...a,
                    "aria-disabled": g,
                    href: g ? void 0 : t,
                    className: (0, n.default)(N, h[A], "content-action-utility"),
                    style: L
                }, D)
            }
            let {
                as: k,
                isChecked: P,
                onCheckedChange: M,
                ..._
            } = E;
            return i.default.createElement("button", {
                ref: r,
                type: "button",
                ..._,
                className: (0, n.default)(P ? "bg-inverse-surface-0" : h[A], P ? "content-inverse-emphasis" : "content-action-utility", N),
                style: L,
                "aria-pressed": P,
                disabled: g,
                onClick: null == M ? void 0 : () => M(!P)
            }, D)
        });
    e.s(["Chip", 0, y])
}, 441515, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340);
    let r = {
            "1:1": "aspect-1-1",
            "5:4": "aspect-5-4",
            "4:5": "aspect-4-5",
            "4:3": "aspect-4-3",
            "16:9": "aspect-16-9",
            "2:1": "aspect-2-1"
        },
        n = (0, a.forwardRef)((e, n) => {
            let {
                className: i,
                aspectRatio: s = "1:1",
                alt: l,
                containerClassName: o,
                ...c
            } = e;
            return a.default.createElement("div", {
                className: (0, t.default)("foundation-web-media clip", r[s], o)
            }, a.default.createElement("img", {
                ref: n,
                className: (0, t.default)("foundation-web-media-image", i),
                alt: l,
                ...c
            }))
        });
    n.displayName = "Media", e.s(["Media", 0, n])
}, 11763, e => {
    "use strict";
    var t = e.i(494118),
        a = e.i(960916),
        r = e.i(197649),
        n = e.i(416340),
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
                onInteractOutside: f
            } = e;
            return n.default.createElement(i.Portal, null, n.default.createElement(i.Overlay, {
                "data-testid": "fui-base-sheet-overlay",
                "data-type": t,
                "data-side": "sideSheet" === t ? a : void 0,
                "data-flush": "sideSheet" === t ? s : void 0,
                "data-size": "centerSheet" === t ? l : void 0,
                className: (0, r.default)("fui-base-sheet-overlay", "foundation-web-portal-zindex fixed inset-[0] flex", c)
            }, n.default.createElement(i.Content, {
                "data-testid": "fui-base-sheet-content",
                className: (0, r.default)("fui-base-sheet-content relative bg-surface-100 stroke-muted stroke-standard shadow-transient-high", "flex flex-col clip", d),
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
            let r = [];
            a.forEach(e => {
                let t = parseInt(e.getAttribute("data-autofocus-priority") || "", 10);
                !Number.isNaN(t) && e instanceof HTMLElement && r.push({
                    element: e,
                    priority: t
                })
            }), r.sort((e, t) => e.priority - t.priority);
            let n = r.find(e => {
                var t, a;
                return ("function" != typeof(a = t = e.element).checkVisibility || a.checkVisibility()) && !("disabled" in t && t.disabled || "true" === t.getAttribute("aria-disabled"))
            });
            if (n) {
                var i;
                e.preventDefault();
                let t = document.activeElement === n.element;
                n.element.focus(), !t && (i = n.element) instanceof HTMLInputElement && "function" == typeof i.select && i.select()
            }
        };
    var o = e.i(167878),
        c = e.i(199512);
    let d = (0, n.createContext)(null),
        u = () => {
            let e = (0, n.useContext)(d);
            if (!e) throw Error("Sheet components must be used within a Sheet");
            return e
        },
        m = "padding-x-xlarge",
        p = (0, n.forwardRef)((e, t) => {
            let {
                children: a,
                className: i,
                hasPaddingX: s = !0,
                ...l
            } = e, {
                type: o
            } = u();
            return n.default.createElement("div", {
                ref: t,
                className: (0, r.default)("scroll-y", s && m, "sideSheet" === o ? "grow-1" : "", i),
                ...l
            }, a)
        });
    p.displayName = "SheetBody", e.s(["SheetActions", 0, e => {
        let {
            children: t,
            className: i,
            ...s
        } = e;
        return n.default.createElement(n.default.Fragment, null, n.default.createElement(a.Divider, null), n.default.createElement("div", {
            className: (0, r.default)(m, "margin-y-small shrink-0", i),
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
                largeScreenClassName: f,
                onOpenAutoFocus: v,
                onCloseAutoFocus: y,
                onPointerDownOutside: g,
                onEscapeKeyDown: b,
                onInteractOutside: A
            } = e,
            T = (0, o.useMediaQuery)("(orientation: portrait) and (max-width: 600px)"),
            I = (0, o.useMediaQuery)("(orientation: landscape) and (max-height: 600px)");
        t = T ? "bottomSheet" : I || "side" === c ? "sideSheet" : "centerSheet";
        let C = (0, n.useMemo)(() => ({
                centerSheetSize: i,
                largeScreenVariant: c,
                closeLabel: u,
                isPortraitMobile: T,
                isLandscapeMobile: I,
                type: t
            }), [i, c, u, T, I, t]),
            S = (0, r.default)(m, T && p, I && h, !T && !I && f);
        return n.default.createElement(d.Provider, {
            value: C
        }, n.default.createElement(s, {
            type: t,
            sideSheetSide: "right",
            isSideSheetFlush: I,
            centerSheetSize: i,
            contentClassName: S,
            onOpenAutoFocus: null != v ? v : l,
            onCloseAutoFocus: y,
            onPointerDownOutside: g,
            onEscapeKeyDown: b,
            onInteractOutside: A
        }, a))
    }, "SheetDescription", 0, e => n.default.createElement(i.Description, {
        asChild: !0,
        ...e
    }), "SheetRoot", 0, e => {
        let {
            open: t,
            onOpenChange: a,
            defaultOpen: r,
            children: s
        } = e;
        return n.default.createElement(i.Root, {
            open: t,
            onOpenChange: a,
            defaultOpen: r,
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
        } = u(), p = n.default.createElement(i.Title, {
            className: "text-heading-small margin-none"
        }, s);
        return n.default.createElement("div", {
            className: (0, r.default)(a, l ? "padding-left-medium" : "padding-left-xlarge", "padding-right-small padding-y-small", "flex items-center justify-between")
        }, n.default.createElement("div", {
            className: (0, r.default)("flex items-center", l && "gap-xsmall")
        }, l, d ? n.default.createElement(c.VisuallyHidden, null, p) : p), n.default.createElement("div", {
            className: (0, r.default)("flex items-center", o && "gap-xxsmall")
        }, o, n.default.createElement("div", {
            className: "fui-sheet-close-affordance-container"
        }, n.default.createElement(i.Close, {
            asChild: !0
        }, n.default.createElement(t.IconButton, {
            variant: "Utility",
            size: "Medium",
            icon: "icon-regular-x",
            ariaLabel: m || "",
            "data-autofocus-priority": "1000"
        })))))
    }, "SheetTrigger", 0, e => n.default.createElement(i.Trigger, {
        asChild: !0,
        ...e
    })], 11763)
}, 622361, e => {
    "use strict";
    var t = e.i(999544),
        a = e.i(944821),
        r = e.i(482076),
        n = e.i(197649),
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
                defaultValue: f,
                isDisabled: v,
                hasError: y,
                helperText: g,
                className: b,
                style: A,
                textareaClassName: T,
                textareaStyle: I,
                id: C,
                ...S
            } = e, E = (0, a.default)(), x = C || E, w = "".concat(x, "-description"), N = null != u ? u : "Large";
            return i.default.createElement("div", {
                className: (0, n.default)("flex fill flex-col width-full gap-small", {
                    [t.disabledOpacity]: v
                }, b),
                style: A
            }, p && i.default.createElement("label", {
                htmlFor: x,
                className: (0, n.default)(o[N], "content-emphasis")
            }, p), i.default.createElement("textarea", {
                ref: d,
                id: x,
                "data-testid": "text-area-container",
                style: I,
                className: (0, n.default)("foundation-web-text-area foundation-web-input outline-none", "radius-medium content-emphasis placeholder:content-muted", r.INPUT_BACKGROUND_BY_VARIANT[m], r.INPUT_STROKE_BY_VARIANT[m], y ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", c[N], s[N], l[N], T),
                value: h,
                defaultValue: null == h ? f : void 0,
                disabled: v,
                "aria-describedby": g ? w : void 0,
                ...S
            }), g && i.default.createElement("span", {
                id: w,
                className: (0, n.default)("text-caption-small", {
                    "content-system-alert": y,
                    "content-default": !y
                })
            }, g))
        });
    d.displayName = "TextArea", e.s(["TextArea", 0, d])
}, 246602, e => {
    "use strict";
    var t = e.i(737586),
        a = e.i(999544),
        r = e.i(197649),
        n = e.i(416340),
        i = e.i(466538);
    let s = {
            XSmall: {
                toggleWidth: "width-700",
                toggleHeight: "height-400",
                thumbSize: "size-300",
                textSize: "text-body-small",
                textPadding: null
            },
            Small: {
                toggleWidth: "width-800",
                toggleHeight: "height-500",
                thumbSize: "size-400",
                textSize: "text-body-small",
                textPadding: "padding-top-xxsmall"
            },
            Medium: {
                toggleWidth: "width-1000",
                toggleHeight: "height-600",
                thumbSize: "size-500",
                textSize: "text-body-medium",
                textPadding: "padding-top-xxsmall"
            },
            Large: {
                toggleWidth: "width-1100",
                toggleHeight: "height-600",
                thumbSize: "size-500",
                textSize: "text-body-large",
                textPadding: "padding-top-xxsmall"
            }
        },
        l = n.default.forwardRef((e, l) => {
            let {
                label: o,
                "aria-label": c,
                "aria-labelledby": d,
                className: u,
                isChecked: m,
                isDisabled: p,
                size: h,
                hint: f,
                placement: v,
                onCheckedChange: y,
                ...g
            } = e, {
                toggleWidth: b,
                toggleHeight: A,
                thumbSize: T,
                textSize: I,
                textPadding: C
            } = s[h];
            return n.default.createElement("label", {
                className: (0, r.default)("foundation-web-toggle flex items-start gap-medium", {
                    [a.disabledOpacity]: p,
                    "cursor-pointer": !p,
                    "flex-row": "Start" === v,
                    "flex-row-reverse": "End" === v
                }, u)
            }, n.default.createElement(i.Root, {
                "data-slot": "toggle",
                ...g,
                ref: l,
                className: (0, r.default)(t.interactable, !p && "cursor-pointer", "grow-0 shrink-0 basis-auto flex items-center padding-xxsmall stroke-none radius-circle transition-colors", b, A, "group/toggle", "data-[state=unchecked]:bg-action-standard", "data-[state=checked]:bg-system-contrast"),
                disabled: p,
                checked: m,
                onCheckedChange: y,
                "aria-label": c,
                "aria-labelledby": d
            }, n.default.createElement(t.StateLayer, null), n.default.createElement("span", {
                className: (0, r.default)("motion-safe:transition-[flex-grow] ease-standard-out duration-300", "group-data-[state=unchecked]/toggle:size-0", "group-data-[state=checked]/toggle:fill")
            }), n.default.createElement(i.Thumb, {
                className: (0, r.default)("transition-colors radius-circle flex justify-center items-center", T, "data-[state=unchecked]:bg-[var(--color-content-emphasis)]", "data-[state=checked]:bg-[var(--inverse-content-emphasis)]")
            }, n.default.createElement("span", {
                className: (0, r.default)("icon icon-filled-check transition-opacity", T, "group-data-[state=unchecked]/toggle:opacity-[0]", "group-data-[state=checked]/toggle:opacity-[1] group-data-[state=checked]/toggle:[transition-delay:50ms]")
            })), n.default.createElement("span", {
                className: (0, r.default)("motion-safe:transition-[flex-grow] ease-standard-out duration-300", "group-data-[state=unchecked]/toggle:fill", "group-data-[state=checked]/toggle:size-0")
            })), o ? n.default.createElement("div", {
                className: (0, r.default)("flex flex-col fill", I)
            }, n.default.createElement("span", {
                className: (0, r.default)("content-emphasis", C)
            }, o), f && n.default.createElement("span", {
                className: "content-default"
            }, f)) : null)
        });
    l.displayName = "Toggle", e.s(["Toggle", 0, l])
}, 892869, e => {
    "use strict";
    var t = e.i(30941),
        a = e.i(416340),
        r = e.i(936993),
        n = e.i(129210),
        i = e.i(477763),
        s = e.i(169336),
        l = e.i(226319),
        o = e.i(928277),
        c = e.i(221628),
        d = e.i(636042),
        u = e.i(442632);

    function m(e) {
        return (0, s.g)("MuiAlertTitle", e)
    }(0, o.g)("MuiAlertTitle", ["root"]);
    let p = ["className"],
        h = (0, l.s)(d.T, {
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
                    className: r
                } = a,
                n = (0, s._)(a, p),
                o = (e => {
                    let {
                        classes: t
                    } = e;
                    return (0, l.a)({
                        root: ["root"]
                    }, m, t)
                })(a);
            return (0, c.jsx)(h, (0, i._)({
                gutterBottom: !0,
                component: "div",
                ownerState: a,
                ref: t,
                className: (0, l.c)(o.root, r)
            }, n))
        });
    var v = (0, r.default)({
            name: "AlertTitle"
        })(function(e) {
            return {
                root: (0, t._)((0, t._)({}, e.typography.alertTitle), {
                    margin: "-1px 0"
                })
            }
        }),
        y = (0, a.forwardRef)(function(e, r) {
            var i = e.classes,
                s = e.className,
                l = (0, t.a)(e, ["classes", "className"]),
                o = v(void 0, {
                    props: {
                        classes: (0, n.default)(i, s)
                    }
                });
            return a.default.createElement(f, (0, t._)({}, l, {
                classes: o.classes,
                ref: r
            }))
        });
    e.s(["AlertTitle", 0, y], 892869)
}, 893502, e => {
    "use strict";
    var t = e.i(477763),
        a = e.i(169336),
        r = e.i(416340),
        n = e.i(226319),
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
    let f = ["className", "row"],
        v = (0, n.s)("div", {
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
        y = r.forwardRef(function(e, r) {
            let i = (0, p.u)({
                    props: e,
                    name: "MuiFormGroup"
                }),
                {
                    className: s,
                    row: o = !1
                } = i,
                c = (0, a._)(i, f),
                d = (0, u.u)(),
                y = (0, m.f)({
                    props: i,
                    muiFormControl: d,
                    states: ["error"]
                }),
                g = (0, t._)({}, i, {
                    row: o,
                    error: y.error
                }),
                b = (e => {
                    let {
                        classes: t,
                        row: a,
                        error: r
                    } = e;
                    return (0, n.a)({
                        root: ["root", a && "row", r && "error"]
                    }, h, t)
                })(g);
            return (0, l.jsx)(v, (0, t._)({
                className: (0, n.c)(b.root, s),
                ownerState: g,
                ref: r
            }, c))
        });
    var g = e.i(91375),
        b = e.i(588393),
        A = e.i(520091),
        T = e.i(576070);
    e.i(802400);
    var I = e.i(811550);

    function C(e) {
        return (0, a.g)("MuiRadioGroup", e)
    }(0, i.g)("MuiRadioGroup", ["root", "row", "error"]);
    let S = ["actions", "children", "className", "defaultValue", "name", "onChange", "value"],
        E = r.forwardRef(function(e, i) {
            let {
                actions: u,
                children: m,
                className: p,
                defaultValue: h,
                name: f,
                onChange: v,
                value: g
            } = e, b = (0, a._)(e, S), A = r.useRef(null), T = (e => {
                let {
                    classes: t,
                    row: a,
                    error: r
                } = e;
                return (0, n.a)({
                    root: ["root", a && "row", r && "error"]
                }, C, t)
            })(e), [I, E] = (0, o.u)({
                controlled: g,
                default: h,
                name: "RadioGroup"
            });
            r.useImperativeHandle(u, () => ({
                focus: () => {
                    let e = A.current.querySelector("input:not(:disabled):checked");
                    e || (e = A.current.querySelector("input:not(:disabled)")), e && e.focus()
                }
            }), []);
            let x = (0, c.u)(i, A),
                w = (0, d.u)(f),
                N = r.useMemo(() => ({
                    name: w,
                    onChange(e) {
                        E(e.target.value), v && v(e, e.target.value)
                    },
                    value: I
                }), [w, v, E, I]);
            return (0, l.jsx)(s.R.Provider, {
                value: N,
                children: (0, l.jsx)(y, (0, t._)({
                    role: "radiogroup",
                    ref: x,
                    className: (0, n.c)(T.root, p)
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

    function N(e) {
        return (0, a.g)("MuiRating", e)
    }
    var D = (0, i.g)("MuiRating", ["root", "sizeSmall", "sizeMedium", "sizeLarge", "readOnly", "disabled", "focusVisible", "visuallyHidden", "pristine", "label", "labelEmptyValueActive", "icon", "iconEmpty", "iconFilled", "iconHover", "iconFocus", "iconActive", "decimal"]);
    let L = ["value"],
        k = ["className", "defaultValue", "disabled", "emptyIcon", "emptyLabelText", "getLabelText", "highlightSelectedOnly", "icon", "IconContainerComponent", "max", "name", "onChange", "onChangeActive", "onMouseLeave", "onMouseMove", "precision", "readOnly", "size", "value"];

    function P(e, t) {
        let a;
        return null == e ? e : Number((Math.round(e / t) * t).toFixed((a = t.toString().split(".")[1]) ? a.length : 0))
    }
    let M = (0, n.s)("span", {
            name: "MuiRating",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: r
                } = e;
                return [{
                    ["& .".concat(D.visuallyHidden)]: t.visuallyHidden
                }, t.root, t["size".concat((0, a.a)(r.size))], r.readOnly && t.readOnly]
            }
        })(e => {
            let {
                theme: a,
                ownerState: r
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
                ["&.".concat(D.disabled)]: {
                    opacity: (a.vars || a).palette.action.disabledOpacity,
                    pointerEvents: "none"
                },
                ["&.".concat(D.focusVisible, " .").concat(D.iconActive)]: {
                    outline: "1px solid #999"
                },
                ["& .".concat(D.visuallyHidden)]: A.v
            }, "small" === r.size && {
                fontSize: a.typography.pxToRem(18)
            }, "large" === r.size && {
                fontSize: a.typography.pxToRem(30)
            }, r.readOnly && {
                pointerEvents: "none"
            })
        }),
        _ = (0, n.s)("label", {
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
        F = (0, n.s)("span", {
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
                ownerState: r
            } = e;
            return (0, t._)({
                display: "flex",
                transition: a.transitions.create("transform", {
                    duration: a.transitions.duration.shortest
                }),
                pointerEvents: "none"
            }, r.iconActive && {
                transform: "scale(1.2)"
            }, r.iconEmpty && {
                color: (a.vars || a).palette.action.disabled
            })
        }),
        R = (0, n.s)("span", {
            name: "MuiRating",
            slot: "Decimal",
            shouldForwardProp: e => (0, n.b)(e) && "iconActive" !== e,
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
        let r = (0, a._)(e, L);
        return (0, l.jsx)("span", (0, t._)({}, r))
    }

    function U(e) {
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
            isActive: f,
            itemValue: v,
            labelProps: y,
            name: g,
            onBlur: b,
            onChange: A,
            onClick: T,
            onFocus: I,
            readOnly: C,
            ownerState: S,
            ratingValue: E,
            ratingValueRounded: x
        } = e, w = u ? v === E : v <= E, N = v <= m, D = v <= o, L = v === x, k = (0, d.u)(), P = (0, l.jsx)(F, {
            as: h,
            value: v,
            className: (0, n.c)(a.icon, w ? a.iconFilled : a.iconEmpty, N && a.iconHover, D && a.iconFocus, f && a.iconActive),
            ownerState: (0, t._)({}, S, {
                iconEmpty: !w,
                iconFilled: w,
                iconHover: N,
                iconFocus: D,
                iconActive: f
            }),
            children: s && !w ? s : p
        });
        return C ? (0, l.jsx)("span", (0, t._)({}, y, {
            children: P
        })) : (0, l.jsxs)(r.Fragment, {
            children: [(0, l.jsxs)(_, (0, t._)({
                ownerState: (0, t._)({}, S, {
                    emptyValueFocused: void 0
                }),
                htmlFor: k
            }, y, {
                children: [P, (0, l.jsx)("span", {
                    className: a.visuallyHidden,
                    children: c(v)
                })]
            })), (0, l.jsx)("input", {
                className: a.visuallyHidden,
                onFocus: I,
                onBlur: b,
                onChange: A,
                onClick: T,
                disabled: i,
                value: v,
                id: k,
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
    r.forwardRef(function(e, i) {
        let s = (0, p.u)({
                name: "MuiRating",
                props: e
            }),
            {
                className: u,
                defaultValue: m = null,
                disabled: h = !1,
                emptyIcon: f = O,
                emptyLabelText: v = "Empty",
                getLabelText: y = j,
                highlightSelectedOnly: b = !1,
                icon: A = B,
                IconContainerComponent: C = V,
                max: S = 5,
                name: E,
                onChange: x,
                onChangeActive: w,
                onMouseLeave: D,
                onMouseMove: L,
                precision: F = 1,
                readOnly: G = !1,
                size: K = "medium",
                value: z
            } = s,
            H = (0, a._)(s, k),
            q = (0, d.u)(E),
            [W, Y] = (0, o.u)({
                controlled: z,
                default: m,
                name: "Rating"
            }),
            X = P(W, F),
            Q = (0, g.u)(),
            [{
                hover: J,
                focus: Z
            }, $] = r.useState({
                hover: -1,
                focus: -1
            }),
            ee = X; - 1 !== J && (ee = J), -1 !== Z && (ee = Z);
        let {
            isFocusVisibleRef: et,
            onBlur: ea,
            onFocus: er,
            ref: en
        } = (0, T.u)(), [ei, es] = r.useState(!1), el = r.useRef(), eo = (0, c.u)(en, el, i), ec = e => {
            let t = "" === e.target.value ? null : parseFloat(e.target.value); - 1 !== J && (t = J), Y(t), x && x(e, t)
        }, ed = e => {
            0 === e.clientX && 0 === e.clientY || ($({
                hover: -1,
                focus: -1
            }), Y(null), x && parseFloat(e.target.value) === X && x(e, null))
        }, eu = e => {
            er(e), !0 === et.current && es(!0);
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
        }, [ep, eh] = r.useState(!1), ef = (0, t._)({}, s, {
            defaultValue: m,
            disabled: h,
            emptyIcon: f,
            emptyLabelText: v,
            emptyValueFocused: ep,
            focusVisible: ei,
            getLabelText: y,
            icon: A,
            IconContainerComponent: C,
            max: S,
            precision: F,
            readOnly: G,
            size: K
        }), ev = (e => {
            let {
                classes: t,
                size: r,
                readOnly: i,
                disabled: s,
                emptyValueFocused: l,
                focusVisible: o
            } = e, c = {
                root: ["root", "size".concat((0, a.a)(r)), s && "disabled", o && "focusVisible", i && "readOnly"],
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
            return (0, n.a)(c, N, t)
        })(ef);
        return (0, l.jsxs)(M, (0, t._)({
            ref: eo,
            onMouseMove: e => {
                L && L(e);
                let {
                    right: t,
                    left: a,
                    width: r
                } = el.current.getBoundingClientRect(), n = P(S * (Q ? (t - e.clientX) / r : (e.clientX - a) / r) + F / 2, F);
                n = (0, I.c)(n, F, S), $(e => e.hover === n && e.focus === n ? e : {
                    hover: n,
                    focus: n
                }), es(!1), w && J !== n && w(e, n)
            },
            onMouseLeave: e => {
                D && D(e), $({
                    hover: -1,
                    focus: -1
                }), w && -1 !== J && w(e, -1)
            },
            className: (0, n.c)(ev.root, u, G && "MuiRating-readOnly"),
            ownerState: ef,
            role: G ? "img" : null,
            "aria-label": G ? y(ee) : null
        }, H, {
            children: [Array.from(Array(S)).map((e, a) => {
                let r = a + 1,
                    i = {
                        classes: ev,
                        disabled: h,
                        emptyIcon: f,
                        focus: Z,
                        getLabelText: y,
                        highlightSelectedOnly: b,
                        hover: J,
                        icon: A,
                        IconContainerComponent: C,
                        name: q,
                        onBlur: em,
                        onChange: ec,
                        onClick: ed,
                        onFocus: eu,
                        ratingValue: ee,
                        ratingValueRounded: X,
                        readOnly: G,
                        ownerState: ef
                    },
                    s = r === Math.ceil(ee) && (-1 !== J || -1 !== Z);
                if (F < 1) {
                    let e = Array.from(Array(1 / F));
                    return (0, l.jsx)(R, {
                        className: (0, n.c)(ev.decimal, s && ev.iconActive),
                        ownerState: ef,
                        iconActive: s,
                        children: e.map((a, n) => {
                            let s = P(r - 1 + (n + 1) * F, F);
                            return (0, l.jsx)(U, (0, t._)({}, i, {
                                isActive: !1,
                                itemValue: s,
                                labelProps: {
                                    style: e.length - 1 === n ? {} : {
                                        width: s === ee ? (n + 1) * F * 100 + "%" : "0%",
                                        overflow: "hidden",
                                        position: "absolute"
                                    }
                                }
                            }), s)
                        })
                    }, r)
                }
                return (0, l.jsx)(U, (0, t._)({}, i, {
                    isActive: s,
                    itemValue: r
                }), r)
            }), !G && !h && (0, l.jsxs)(_, {
                className: (0, n.c)(ev.label, ev.labelEmptyValue),
                ownerState: ef,
                children: [(0, l.jsx)("input", {
                    className: ev.visuallyHidden,
                    value: "",
                    id: "".concat(q, "-empty"),
                    type: "radio",
                    name: q,
                    checked: null == X,
                    onFocus: () => eh(!0),
                    onBlur: () => eh(!1),
                    onChange: ec
                }), (0, l.jsx)("span", {
                    className: ev.visuallyHidden,
                    children: v
                })]
            })]
        }))
    }), e.s(["RadioGroup", 0, E], 893502)
}, 525861, e => {
    "use strict";
    var t = e.i(30941),
        a = e.i(416340),
        r = e.i(936993),
        n = e.i(129210),
        i = e.i(928277),
        s = e.i(169336),
        l = e.i(477763),
        o = e.i(226319),
        c = e.i(425935),
        d = e.i(588393),
        u = e.i(221628),
        m = e.i(79888),
        p = e.i(442632),
        h = e.i(980514);
    e.i(333032);
    var f = (0, d.c)((0, u.jsx)("path", {
            d: "M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8z"
        }), "RadioButtonUnchecked"),
        v = (0, d.c)((0, u.jsx)("path", {
            d: "M8.465 8.465C9.37 7.56 10.62 7 12 7C14.76 7 17 9.24 17 12C17 13.38 16.44 14.63 15.535 15.535C14.63 16.44 13.38 17 12 17C9.24 17 7 14.76 7 12C7 10.62 7.56 9.37 8.465 8.465Z"
        }), "RadioButtonChecked");
    let y = (0, o.s)("span", {
            name: "MuiRadioButtonIcon",
            shouldForwardProp: o.r
        })({
            position: "relative",
            display: "flex"
        }),
        g = (0, o.s)(f, {
            name: "MuiRadioButtonIcon"
        })({
            transform: "scale(1)"
        }),
        b = (0, o.s)(v, {
            name: "MuiRadioButtonIcon"
        })(e => {
            let {
                theme: t,
                ownerState: a
            } = e;
            return (0, l._)({
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

    function A(e) {
        let {
            checked: t = !1,
            classes: a = {},
            fontSize: r
        } = e, n = (0, l._)({}, e, {
            checked: t
        });
        return (0, u.jsxs)(y, {
            className: a.root,
            ownerState: n,
            children: [(0, u.jsx)(g, {
                fontSize: r,
                className: a.background,
                ownerState: n
            }), (0, u.jsx)(b, {
                fontSize: r,
                className: a.dot,
                ownerState: n
            })]
        })
    }

    function T(e) {
        return (0, s.g)("MuiRadio", e)
    }
    var I = (0, i.g)("MuiRadio", ["root", "checked", "disabled", "colorPrimary", "colorSecondary", "sizeSmall"]);
    let C = ["checked", "checkedIcon", "color", "icon", "name", "onChange", "size", "className"],
        S = (0, o.s)(c.S, {
            shouldForwardProp: e => (0, o.r)(e) || "classes" === e,
            name: "MuiRadio",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: a
                } = e;
                return [t.root, "medium" !== a.size && t["size".concat((0, s.a)(a.size))], t["color".concat((0, s.a)(a.color))]]
            }
        })(e => {
            let {
                theme: t,
                ownerState: a
            } = e;
            return (0, l._)({
                color: (t.vars || t).palette.text.secondary
            }, !a.disableRipple && {
                "&:hover": {
                    backgroundColor: t.vars ? "rgba(".concat("default" === a.color ? t.vars.palette.action.activeChannel : t.vars.palette[a.color].mainChannel, " / ").concat(t.vars.palette.action.hoverOpacity, ")") : (0, s.b)("default" === a.color ? t.palette.action.active : t.palette[a.color].main, t.palette.action.hoverOpacity),
                    "@media (hover: none)": {
                        backgroundColor: "transparent"
                    }
                }
            }, "default" !== a.color && {
                ["&.".concat(I.checked)]: {
                    color: (t.vars || t).palette[a.color].main
                }
            }, {
                ["&.".concat(I.disabled)]: {
                    color: (t.vars || t).palette.action.disabled
                }
            })
        }),
        E = (0, u.jsx)(A, {
            checked: !0
        }),
        x = (0, u.jsx)(A, {}),
        w = a.forwardRef(function(e, t) {
            var r, n, i, c;
            let d = (0, p.u)({
                    props: e,
                    name: "MuiRadio"
                }),
                {
                    checked: f,
                    checkedIcon: v = E,
                    color: y = "primary",
                    icon: g = x,
                    name: b,
                    onChange: A,
                    size: I = "medium",
                    className: w
                } = d,
                N = (0, s._)(d, C),
                D = (0, l._)({}, d, {
                    color: y,
                    size: I
                }),
                L = (e => {
                    let {
                        classes: t,
                        color: a,
                        size: r
                    } = e, n = {
                        root: ["root", "color".concat((0, s.a)(a)), "medium" !== r && "size".concat((0, s.a)(r))]
                    };
                    return (0, l._)({}, t, (0, o.a)(n, T, t))
                })(D),
                k = a.useContext(m.R),
                P = f,
                M = (0, h.c)(A, k && k.onChange),
                _ = b;
            return k && (void 0 === P && (i = k.value, P = "object" == typeof(c = d.value) && null !== c ? i === c : String(i) === String(c)), void 0 === _ && (_ = k.name)), (0, u.jsx)(S, (0, l._)({
                type: "radio",
                icon: a.cloneElement(g, {
                    fontSize: null != (r = x.props.fontSize) ? r : I
                }),
                checkedIcon: a.cloneElement(v, {
                    fontSize: null != (n = E.props.fontSize) ? n : I
                }),
                ownerState: D,
                classes: L,
                name: _,
                checked: P,
                onChange: M,
                ref: t,
                className: (0, o.c)(L.root, w)
            }, N))
        });
    var N = (0, r.default)({
            name: "Radio"
        })(function(e) {
            var t, a;
            return {
                root: {
                    color: e.palette.states.active
                },
                colorPrimary: ((t = {
                    color: e.palette.content.muted
                })["&.".concat(I.checked)] = {
                    color: e.palette.actionV2.primaryBrand.fill
                }, t),
                colorSecondary: {
                    color: e.palette.actionV2.primary.fill
                },
                disabled: ((a = {
                    color: e.palette.states.disabled
                })["&.".concat(I.colorPrimary, ".").concat(I.checked)] = {
                    color: e.palette.states.disabled
                }, a)
            }
        }),
        D = (0, a.forwardRef)(function(e, r) {
            var i = e.classes,
                s = e.color,
                l = e.inputProps,
                o = e["aria-label"],
                c = e.className,
                d = (0, t.a)(e, ["classes", "color", "inputProps", "aria-label", "className"]),
                u = N(void 0, {
                    props: {
                        classes: (0, n.default)(i, c)
                    }
                });
            return a.default.createElement(w, (0, t._)({}, d, {
                classes: u.classes,
                color: void 0 === s ? "primary" : s,
                ref: r,
                inputProps: (0, t._)({
                    "aria-label": o
                }, l)
            }))
        });
    e.s(["Radio", 0, D], 525861)
}, 79888, e => {
    "use strict";
    let t = e.i(416340).createContext(void 0);
    e.s(["R", 0, t])
}, 520091, e => {
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
}]);

//# debugId=a429edde-eff9-08c6-1ece-d476e5ce07c9
//# sourceMappingURL=3rljhh3f6jset.js.map