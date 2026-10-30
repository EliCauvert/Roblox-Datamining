;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "e1cd30f1-4719-7cd7-5a81-58a80467ac80")
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
        s = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "enableAvatarCreationTokenCategories",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "enableBulkMakeupTokenCreation",
            defaultValue: !1
        }),
        l = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "isAutoPublishPreferencesEnabled",
            defaultValue: !1
        }),
        i = (0, t.defineFlag)({
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
    e.s(["enableAvatarCreationTokenCategories", 0, s, "enableBulkMakeupTokenCreation", 0, r, "enableCoreContentGatedBanner", 0, o, "enableCreatorShowcases", 0, n, "enableTaxonomyBasedCreatorDashboard", 0, a, "enableTimedOptionsSunsetBanner", 0, c, "isAutoPublishPreferencesEnabled", 0, l, "showTaxonomyOnAvatarItemAnalyticsTab", 0, i])
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
        s = (0, t.defineFlag)({
            namespace: "content-access-and-inventory",
            name: "isModelCustomThumbnailUploadEnabled",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
            namespace: "content-access-and-inventory",
            name: "isAssetDependenciesViewerEnabled",
            defaultValue: !1
        }),
        l = (0, t.defineFlag)({
            namespace: "content-access-and-inventory",
            name: "isCreatorStoreVideoMultipartUploadEnabled",
            defaultValue: !1
        }),
        i = (0, t.defineFlag)({
            namespace: "content-access-and-inventory",
            name: "isPricingEligibilityV2Enabled",
            defaultValue: !1
        }),
        o = (0, t.defineFlag)({
            namespace: "content-access-and-inventory",
            name: "isPublishBeforeExposeEnabled",
            defaultValue: !1
        });
    e.s(["isAssetAccessRequestsEnabled", 0, n, "isAssetDependenciesViewerEnabled", 0, r, "isAssetPrivacyOptOutSurveyEnabled", 0, a, "isCreatorStoreVideoMultipartUploadEnabled", 0, l, "isModelCustomThumbnailUploadEnabled", 0, s, "isPricingEligibilityV2Enabled", 0, i, "isPublishBeforeExposeEnabled", 0, o])
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
        s = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isMomentsSitetestUrlParsingEnabled",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isTextDocumentEnabled",
            defaultValue: !1
        }),
        l = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isMomentsUploadLanguageSelectEnabled",
            defaultValue: !1
        }),
        i = (0, t.defineFlag)({
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
    e.s(["isBadgeDefaultIconEnabled", 0, a, "isMomentsFeedIdEnabled", 0, i, "isMomentsModeratedTabEnabled", 0, d, "isMomentsPostCreationEnabled", 0, c, "isMomentsShareLinkEnabled", 0, o, "isMomentsSitetestUrlParsingEnabled", 0, s, "isMomentsUploadEnabled", 0, n, "isMomentsUploadLanguageSelectEnabled", 0, l, "isTextDocumentEnabled", 0, r])
}, 814984, e => {
    "use strict";
    let t = (0, e.i(650502).getBEDEV2ServiceBasePath)("access-management"),
        a = encodeURIComponent("studio/CollaborationSettings"),
        n = async function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0,
                a = await fetch(e, {
                    credentials: "include"
                }),
                s = a.status % 100 * 100;
            if (!a.ok && 500 === s && t < 2) return await new Promise(e => {
                setTimeout(e, 2 ** (t + 1) * 500)
            }), n(e, t + 1);
            if (500 === s && 2 === t) throw Error("Failed to get feature access after 3 attempts");
            let r = await a.json();
            if ("object" != typeof r || null === r || !("access" in r)) throw Error('"access" not found in response');
            return r.access
        }, s = async () => await n("".concat(t, "/v1/upsell-feature-access?nameSpace=").concat(a, "&featureName=").concat("ShouldShowCreatorHubBanner")) === "Granted";
    e.s(["getAgeVerificationUpsellFeatureAccess", 0, s])
}, 714039, 540082, e => {
    "use strict";
    var t, a = e.i(221628),
        n = e.i(416340),
        s = e.i(79187),
        r = e.i(925997),
        l = e.i(892869),
        i = e.i(253738),
        o = e.i(611043),
        c = e.i(848427),
        d = e.i(401631),
        u = e.i(930669),
        m = e.i(358763),
        p = e.i(889311),
        h = e.i(823062),
        f = e.i(881670),
        g = e.i(904969),
        y = e.i(906791);
    let v = (0, e.i(695763).makeStyles)()(e => ({
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
    var b = ((t = {}).Home = "home", t.Creations = "creations", t);
    let A = (0, s.withTranslation)(e => {
        let t, f, b, A, {
                trackingPage: T,
                alertRedesignVariant: I
            } = e,
            {
                isBannerVisible: S,
                isHighPriority: x,
                variant: C,
                dismissBanner: E
            } = (0, y.useAgeVerificationUpsellContext)(),
            {
                classes: w
            } = v(),
            D = (0, n.useRef)(null),
            {
                unifiedLogger: N
            } = (0, h.useUnifiedLoggerProvider)(),
            {
                translate: k
            } = (0, s.useTranslation)(),
            M = (0, n.useCallback)(() => {
                S && N.logImpressionEvent({
                    eventName: p.default.AgeVerificationUpsellBanner,
                    parameters: {
                        page: T,
                        variant: C,
                        ...I && {
                            alertRedesignVariant: I
                        }
                    }
                })
            }, [N, T, C, I, S]);
        (0, m.default)(D, M);
        let L = (0, n.useCallback)(() => {
                N.logClickEvent({
                    eventName: p.default.AgeVerificationUpsellBannerClick,
                    parameters: {
                        page: T,
                        action: "viewDetails",
                        variant: C,
                        ...I && {
                            alertRedesignVariant: I
                        }
                    }
                })
            }, [N, T, C, I]),
            P = (0, n.useCallback)(() => {
                N.logClickEvent({
                    eventName: p.default.AgeVerificationUpsellBannerClick,
                    parameters: {
                        page: T,
                        action: "callToAction",
                        variant: C,
                        ...I && {
                            alertRedesignVariant: I
                        }
                    }
                })
            }, [N, T, C, I]),
            F = (0, n.useCallback)(() => {
                N.logClickEvent({
                    eventName: p.default.AgeVerificationUpsellBannerClick,
                    parameters: {
                        page: T,
                        action: "dismiss",
                        variant: C,
                        ...I && {
                            alertRedesignVariant: I
                        }
                    }
                }), E()
            }, [N, E, T, C, I]);
        return ("establishTrust" === C ? (t = "Title.EstablishTrustBanner", f = "Label.EstablishTrustBanner2", b = g.ESTABLISH_TRUST_UPSELL_GET_STARTED_URL, A = g.ESTABLISH_TRUST_UPSELL_VIEW_DETAILS_URL) : (t = "Title.AgeVerificationBanner", f = "Label.AgeVerificationBanner", b = g.AGE_VERIFICATION_UPSELL_GET_STARTED_URL, A = g.AGE_VERIFICATION_UPSELL_VIEW_DETAILS_URL), S) ? (0, a.jsx)("div", {
            ref: D,
            children: (0, a.jsxs)(r.Alert, {
                className: w.alertContainer,
                severity: "ageVerification" === C && x ? "warning" : "info",
                variant: "filled",
                action: [(0, a.jsx)(c.Button, {
                    href: b,
                    onClick: P,
                    className: w.getStarted,
                    color: "inherit",
                    size: "small",
                    children: k("Label.AgeVerificationBannerGetStarted")
                }, "getStarted"), (0, a.jsx)(d.IconButton, {
                    color: "inherit",
                    size: "medium",
                    "aria-label": "dismiss",
                    onClick: F,
                    children: (0, a.jsx)(u.CloseIcon, {})
                }, "dismiss")],
                children: [(0, a.jsx)(l.AlertTitle, {
                    children: k(t)
                }), (0, a.jsx)(o.Typography, {
                    variant: "body2",
                    children: k(f)
                }), " ", (0, a.jsx)(i.Link, {
                    className: w.viewDetails,
                    href: A,
                    target: "_blank",
                    color: "inherit",
                    onClick: L,
                    children: k("Label.AgeVerificationBannerViewDetails")
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
        n = e.i(458451),
        s = e.i(889311),
        r = e.i(823062),
        l = e.i(814984),
        i = e.i(904969);
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
        }, h = async () => await (0, l.getAgeVerificationUpsellFeatureAccess)() ? "ageVerification" : "doNotShow";
    e.s(["AgeVerificationUpsellProvider", 0, e => {
        let {
            children: l
        } = e, [o, c] = (0, a.useState)(!0), [f, g] = (0, a.useState)("doNotShow"), {
            isFetched: y,
            user: v
        } = (0, n.useRobloxAuthentication)(), {
            unifiedLogger: b
        } = (0, r.useUnifiedLoggerProvider)(), {
            isHighPriority: A,
            isEnabled: T
        } = (0, a.useMemo)(() => {
            let e = p(i.AGE_VERIFICATION_UPSELL_BANNER_START_DATE),
                t = p(i.AGE_VERIFICATION_UPSELL_BANNER_END_DATE),
                a = p(i.AGE_VERIFICATION_UPSELL_BANNER_HIGH_PRIORITY_DATE),
                n = new Date;
            return {
                isHighPriority: a <= n,
                isEnabled: e <= n && n < t
            }
        }, []), I = (0, a.useCallback)(async () => {
            await u(), c(!0)
        }, [c]);
        (0, a.useEffect)(() => {
            T && y && (null == v ? void 0 : v.id) && (async () => {
                let e = !1;
                try {
                    e = await d()
                } catch (e) {
                    b.logErrorEvent({
                        eventName: s.default.AgeVerificationUpsellBannerError,
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
                        eventName: s.default.AgeVerificationUpsellBannerError,
                        parameters: {
                            branch: "getEligibility",
                            error: e instanceof Error ? e.message : String(e)
                        }
                    })
                }
                g(t)
            })().catch(e => {
                b.logErrorEvent({
                    eventName: s.default.AgeVerificationUpsellBannerError,
                    parameters: {
                        branch: "runAsync",
                        error: e instanceof Error ? e.message : String(e)
                    }
                })
            })
        }, [T, y, v, b]);
        let S = (0, a.useMemo)(() => {
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
            value: S,
            children: l
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
            children: s
        } = e, [r, l] = (0, a.useState)(), i = e => {
            l(e)
        }, o = (0, a.useMemo)(() => ({
            droppedFile: r,
            updateDroppedFile: i
        }), [r]);
        return (0, t.jsx)(n.default.Provider, {
            value: o,
            children: s
        })
    }])
}, 799972, e => {
    "use strict";
    var t = e.i(376618),
        a = e.i(671376);
    let {
        docs: n
    } = e.i(829425).creatorHub, s = {
        [a.Asset.Decal]: t.AssetType.Decal,
        [a.Asset.Audio]: t.AssetType.Audio,
        [a.Asset.Video]: t.AssetType.Video,
        [a.Asset.TShirt]: t.AssetType.Tshirt,
        [a.Asset.Shirt]: t.AssetType.Shirt,
        [a.Asset.Pants]: t.AssetType.Pants,
        [a.Asset.AvatarBackground]: t.AssetType.AvatarBackground,
        [a.Asset.TextDocument]: t.AssetType.TextDocument
    }, r = {
        [a.Asset.Decal]: "Message.DecalResolutionLimits",
        [a.Asset.Audio]: "Message.AudioLimits",
        [a.Asset.AvatarBackground]: "Message.AvatarBackgroundUploadRequirements"
    }, l = [a.Asset.Shirt, a.Asset.Pants, a.Asset.Video, a.Asset.TShirt, a.Asset.AvatarBackground], i = [a.Asset.Audio, a.Asset.Video];
    e.s(["allowedAssetTypeFormats", 0, e => {
        switch (e) {
            case a.Asset.Decal:
            case a.Asset.TShirt:
            case a.Asset.Shirt:
            case a.Asset.Pants:
            case a.Asset.AvatarBackground:
                return ["jpg", "png", "tga", "bmp"];
            case a.Asset.Audio:
                return ["mp3", "ogg", "flac", "wav"];
            case a.Asset.Video:
                return ["mp4", "mov"];
            case a.Asset.TextDocument:
                return ["md", "txt"];
            default:
                return []
        }
    }, "assetTypeInfoTextMessage", 0, r, "dashboardAssetTypeToOpenCloudAssetType", 0, s, "getInfoUrl", 0, e => {
        switch (e) {
            case a.Asset.Decal:
                return n.getDecalReferenceUrl();
            case a.Asset.TShirt:
            case a.Asset.Shirt:
            case a.Asset.Pants:
                return n.getClassicClothingUrl();
            case a.Asset.Audio:
                return n.getAudioAssetsUrl();
            case a.Asset.Video:
                return n.getAssetsUrl();
            case a.Asset.AvatarBackground:
                return n.getAvatarItemsUrl();
            case a.Asset.TextDocument:
                return n.getAssetsUrl();
            default:
                return ""
        }
    }, "is2DAsset", 0, e => {
        switch (e) {
            case a.Asset.TShirt:
            case a.Asset.Shirt:
            case a.Asset.Pants:
                return !0;
            default:
                return !1
        }
    }, "isCreateAssetAvailable", 0, function(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
        switch (e) {
            case a.Asset.Audio:
            case a.Asset.Decal:
            case a.Asset.Video:
            case a.Asset.TShirt:
            case a.Asset.Shirt:
            case a.Asset.Pants:
            case a.Asset.AvatarBackground:
                return !0;
            case a.Asset.TextDocument:
                return t;
            default:
                return !1
        }
    }, "maxDurationInSeconds", 0, e => e === a.Asset.Video ? 300 : null, "maxFileSizeMB", 0, e => {
        switch (e) {
            case a.Asset.Decal:
            case a.Asset.TShirt:
            case a.Asset.Shirt:
            case a.Asset.Pants:
            case a.Asset.Audio:
            case a.Asset.AvatarBackground:
            case a.Asset.TextDocument:
                return 20;
            case a.Asset.Video:
                return 30;
            default:
                return 0
        }
    }, "maxResolution", 0, e => e === a.Asset.Video ? "4096x2160" : null, "purchasableAssetTypes", 0, l, "quotaEnabledAssetTypes", 0, i])
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
        s = e.i(812077),
        r = e.i(968892),
        l = e.i(197649),
        i = e.i(79187),
        o = e.i(537683),
        c = e.i(29929),
        d = e.i(889311),
        u = e.i(215955),
        m = e.i(227700),
        p = e.i(881670),
        h = e.i(114209),
        f = e.i(373736),
        g = e.i(917852),
        y = e.i(576069),
        v = e.i(663563);
    let b = "".concat("https://assets.create.roblox.com/693c51491c6d9e57aaf41dc3340c19dd2f0c145a/assets", "/home/publish_eligibility_banner.webp"),
        A = (0, i.withTranslation)(e => {
            var A;
            let {
                universeId: T,
                showCallToAction: I = !0
            } = e, S = (0, n.useRouter)(), {
                translateWithNamespace: x
            } = (0, i.useTranslation)(), {
                params: C,
                isFetched: E
            } = (0, m.useIXPParameters)(c.IXPLayers.CreatorHubCreationsPermission), w = C[c.CreatorHubCreationsPermissionParameters.EnableAudienceReachGrowthOpportunitiesBanner], {
                gameDetails: D
            } = (0, h.useCurrentGame)(), N = null == D ? void 0 : D.id, k = null != T ? T : N && N > 0 ? N : void 0, {
                data: M,
                isLoading: L,
                isFetching: P
            } = (0, y.useCreatorEligibility)(), F = (0, a.useRef)(!1), [_, R] = (0, a.useState)(!1), V = (null == M ? void 0 : M.ageBracket) === s.AgeBracketEnum.Over18, U = (null == M ? void 0 : M.ageBracket) === s.AgeBracketEnum.Between13And18, B = null != (A = null == M ? void 0 : M.creatorEligibility.includes(s.CreatorEligibilityEnum.IdVerified)) && A, O = V || U, j = E && w && !(L || P) && !!M && !B;
            (0, a.useEffect)(() => {
                j && !F.current && (F.current = !0, u.default.logImpressionEvent({
                    eventName: d.default.AudienceReachGrowthOpportunitiesBannerImpression,
                    parameters: {
                        page: "audienceReach",
                        ctaType: O ? "start" : "viewDetails",
                        ctaHidden: String(!I),
                        ...k ? {
                            universeId: String(k)
                        } : {}
                    }
                }))
            }, [j, I, O, k]);
            let G = (0, a.useCallback)(() => {
                if (!j) return;
                let e = O ? "start" : "viewDetails";
                (u.default.logClickEvent({
                    eventName: d.default.AudienceReachGrowthOpportunitiesBannerClick,
                    parameters: {
                        page: "audienceReach",
                        action: e,
                        ...k ? {
                            universeId: String(k)
                        } : {}
                    }
                }), U) ? R(!0): O || S.push("/settings/eligibility/publishing-permissions")
            }, [j, U, S, O, k]);
            return j ? (0, t.jsxs)(o.Grid, {
                item: !0,
                container: !0,
                direction: "row",
                paddingBottom: 4,
                children: [(0, t.jsxs)("div", {
                    className: (0, l.clsx)(v.default.heroBanner, "relative width-full flex items-center bg-surface-200 radius-large"),
                    children: [(0, t.jsx)("img", {
                        src: b,
                        alt: "",
                        "aria-hidden": !0,
                        className: (0, l.clsx)("block absolute width-full height-full"),
                        style: {
                            top: 0,
                            left: 0
                        },
                        onError: e => {
                            e.currentTarget.style.display = "none"
                        }
                    }), (0, t.jsxs)("div", {
                        className: (0, l.clsx)(v.default.heroTextContent, "color-mode-dark relative flex flex-col gap-medium padding-[32px]"),
                        children: [(0, t.jsxs)("div", {
                            children: [(0, t.jsxs)("div", {
                                className: "text-heading-medium content-emphasis",
                                children: [x(p.TranslationNamespace.AudienceReach, "Heading.ExpandGrowthOpportunities"), " "]
                            }), (0, t.jsx)("div", {
                                className: "text-body-medium content-emphasis",
                                children: x(p.TranslationNamespace.AudienceReach, "Description.ExpandGrowthOpportunities")
                            })]
                        }), (0, t.jsx)("div", {
                            className: (0, l.clsx)(v.default.buttonRow, "flex gap-small"),
                            children: I ? V ? (0, t.jsx)(r.Button, {
                                as: "a",
                                href: g.idVerificationActionUrl,
                                target: "_blank",
                                rel: "noopener noreferrer",
                                onClick: G,
                                children: (0, t.jsx)("span", {
                                    children: x(p.TranslationNamespace.AudienceReach, O ? "Action.Start" : "Action.ViewDetails")
                                })
                            }) : (0, t.jsx)(r.Button, {
                                onClick: G,
                                children: (0, t.jsx)("span", {
                                    children: x(p.TranslationNamespace.AudienceReach, O ? "Action.Start" : "Action.ViewDetails")
                                })
                            }) : null
                        })]
                    })]
                }), U ? (0, t.jsx)(f.default, {
                    open: _,
                    onOpenChange: R,
                    onContinueWithId: () => {
                        window.open(g.idVerificationActionUrl, "_blank", "noopener,noreferrer"), R(!1)
                    },
                    onAddParent: () => {
                        window.open(g.parentLinkActionUrl, "_blank", "noopener,noreferrer"), R(!1)
                    }
                }) : null]
            }) : null
        }, [p.TranslationNamespace.AudienceReach, p.TranslationNamespace.PublicPublish]);
    e.s(["default", 0, A])
}, 899441, e => {
    "use strict";
    var t, a, n = e.i(102211),
        s = e.i(272593),
        r = ((t = {}).Animation = "Animation", t.Audio = "Audio", t.Decal = "Decal", t.Image = "Image", t.Mesh = "Mesh", t.MeshPart = "MeshPart", t.Model = "Model", t.Plugin = "Plugin", t.TextDocument = "TextDocument", t.Video = "Video", t),
        l = ((a = {}).Group = "groups", a.User = "users", a);
    let i = new n.CreatorInventoryApi((0, s.createClientConfiguration)("creator-inventory-api", "bedev2"));
    e.s(["CreatorInventoryAssetType", () => r, "CreatorInventoryScopeType", () => l, "searchCreatorInventoryItems", 0, (e, t, a) => (null == t.isArchived && null == t.orderBy ? i : i.withPreMiddleware(async e => {
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
                let s = e.indexOf("?"),
                    r = -1 === s ? e : e.slice(0, s),
                    l = (-1 === s ? [] : e.slice(s + 1).split("&")).map(e => null != a && e.startsWith("filter=") ? "".concat(e).concat(encodeURIComponent(";isArchived=".concat(a))) : e);
                return null != n && l.push("orderBy=".concat(encodeURIComponent(n))), "".concat(r, "?").concat(l.join("&"))
            })(a, t),
            init: n
        }
    })).creatorInventorySearchCreatorInventoryItems(e, a)])
}, 445550, e => {
    "use strict";
    var t = e.i(721281),
        a = e.i(309999),
        n = e.i(307529),
        s = e.i(272593);
    let r = {
            [n.default.Model]: a.CategoryType.Model,
            [n.default.Plugin]: a.CategoryType.Plugin
        },
        l = {
            3: n.default.Audio,
            10: n.default.Model,
            13: n.default.Decal,
            38: n.default.Plugin,
            40: n.default.MeshPart,
            62: n.default.Video
        },
        i = new class {
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
            async getCreations(e, t, a, n, s, l, i) {
                return a ? this.toolboxApi.toolboxGetCreationAssets({
                    ownerId: a,
                    assetType: r[t],
                    limit: n,
                    cursor: s,
                    separateModelsAndPackages: l,
                    includeSharedAssets: i
                }) : this.toolboxApi.toolboxGetUserCreationAssets({
                    userId: e,
                    assetType: r[t],
                    limit: n,
                    cursor: s
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
                const e = (0, s.createClientConfiguration)("toolbox-service", "bedev2");
                this.frontendFlagsApi = new a.FrontendFlagsApi(e), this.toolboxApi = new a.ToolboxApi(e)
            }
        };
    e.s(["assetTypeIdToAssetType", 0, l, "default", 0, i, "toolboxServiceItemDetailsLimit", 0, 30])
}, 790806, e => {
    "use strict";
    var t = e.i(721281),
        a = e.i(176936),
        n = e.i(272593);
    let s = new class {
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
        r = new a.UsersApi((0, n.createClientConfiguration)("users", "bedev1"));
    e.s(["UsersClient", 0, {
        usersApi: r
    }, "default", 0, s])
}, 131385, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(780880),
        n = e.i(339544),
        s = e.i(643093),
        r = e.i(130778),
        l = e.i(157310),
        i = e.i(913893),
        o = e.i(275574),
        c = e.i(671376),
        d = e.i(117236);
    let u = function() {
        let e = !(arguments.length > 0) || void 0 === arguments[0] || arguments[0],
            a = (0, l.useQuery)({
                queryKey: ["getTaxonomyCategories", o.CategoryDomain.NUMBER_3],
                queryFn: () => i.default.getItemCategories(o.CategoryDomain.NUMBER_3),
                enabled: e,
                staleTime: 3e5
            }),
            n = (0, l.useQuery)({
                queryKey: ["getAvatarItemsEntryPointAssetTypes"],
                queryFn: d.getAvatarItemsEntryPointAssetTypes,
                enabled: e,
                staleTime: 3e5
            }),
            r = n.data,
            u = (0, t.useMemo)(() => {
                var e, t;
                return {
                    enableMakeupAssets: null != (e = null == r ? void 0 : r.has(c.Asset.EyeMakeup)) && e,
                    enableAvatarBackgrounds: null != (t = null == r ? void 0 : r.has(c.Asset.AvatarBackground)) && t
                }
            }, [r]),
            m = (0, t.useMemo)(() => (0, s.transformCreatorDashboardTree)(a.data, u), [a.data, u]),
            p = (0, t.useMemo)(() => (0, s.buildTaxonomyL1Options)(m), [m]);
        return {
            response: a.data,
            categories: m,
            l1Options: p,
            isLoading: a.isLoading || n.isLoading,
            isError: a.isError
        }
    };
    e.s(["default", 0, e => {
        var l, i, o;
        let [{
            activeTab: c,
            filterIndex: d
        }] = (0, a.useQueryParams)(["activeTab", "filterIndex"]), {
            l1Options: m,
            categories: p,
            isLoading: h
        } = u(e), f = (0, r.isAllAssetTypesActiveTab)(c) || (0, r.isRecentsActiveTab)(c) || (0, r.isAvatarLooksActiveTab)(c) ? void 0 : null != (l = (0, r.parseTaxonomyActiveTab)(c)) ? l : null == (o = m[0]) ? void 0 : o.taxonomyKey, g = (0, t.useMemo)(() => (0, s.findL1Category)(p, f), [p, f]), y = (0, t.useMemo)(() => (0, s.buildTaxonomyL2Options)(g), [g]), v = parseInt(null != (i = null == d ? void 0 : d.toString()) ? i : "", 10), b = (0, n.isValidIndex)(v, y) ? v : 0, A = (0, t.useMemo)(() => {
            if (g) return y.length > 0 ? y[b] : g.webStableId ? (0, s.categoryToDropdown)(g) : void 0
        }, [g, y, b]);
        return {
            l1Options: m,
            activeL1Key: f,
            activeL1Node: g,
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
        n = e.i(130778);
    e.s(["default", 0, e => {
        let [{
            activeTab: s
        }] = (0, t.useQueryParams)(["activeTab"]), r = (0, a.default)(), l = r && (0, n.isTaxonomyActiveTab)(s), i = r && (0, n.isAvatarLooksActiveTab)(s);
        return {
            canUseTaxonomy: r && (l || (0, n.isTaxonomyEligibleAssetTab)(e)),
            isTaxonomyMode: l,
            isTaxonomyView: l && !(0, n.isAllAssetTypesActiveTab)(s) && !(0, n.isRecentsActiveTab)(s) && !(0, n.isAvatarLooksActiveTab)(s),
            isAvatarLooksView: i
        }
    }])
}, 339544, 643093, e => {
    "use strict";
    var t = e.i(671376);
    let a = (e, t) => "".concat(e, "_").concat(t);
    e.s(["invertAvatarMenuMap", 0, e => {
        let t = new Map;
        return Object.entries(e).forEach(e => {
            let [n, s] = e;
            s.forEach((e, s) => {
                t.set(a(n, e.nameKey), s)
            })
        }), t
    }, "isOnItemTab", 0, e => e === t.Asset.TShirt, "isValidIndex", 0, (e, t) => void 0 !== t && void 0 !== e && e > 0 && e < t.length, "serializeMenuMapKey", 0, a], 339544);
    var n = e.i(266213),
        s = e.i(418162);
    let r = new Set([2, 11, 12]),
        l = new Set([76, 77, 88, 89, 90]),
        i = new Set([92]),
        o = new Set([4]);

    function c(e, t) {
        var a;
        return (null != (a = e.assetTypeIds) ? a : []).some(e => t.has(e))
    }

    function d(e) {
        var t;
        return !0 === e.isPublishable || !!c(e, i) || (null != (t = e.bundleTypeIds) ? t : []).some(e => o.has(e))
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
        return e.skipTranslation ? (0, s.getTaxonomyDisplayName)(e.nameKey, t) : null != (a = t(e.nameKey)) ? a : e.nameKey
    }, "taxonomyOptionValue", 0, function(e) {
        return void 0 !== e.taxonomy ? e.taxonomy : void 0 !== e.lookType ? "look:".concat(e.lookType) : e.nameKey
    }, "transformCreatorDashboardTree", 0, function(e, t) {
        var a;
        let n = null != (a = null == e ? void 0 : e.categories) ? a : [],
            s = [],
            o = [];
        return n.forEach(e => {
            var a, n, u;
            let m = null != (a = e.children) ? a : [];
            if (0 === m.length) {
                if (!d(e) || c(e, i) && !t.enableAvatarBackgrounds || !e.webStableId) return;
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
                if (c(e, l)) {
                    t.enableMakeupAssets && (h = !0, p.push(e));
                    return
                }
                if (d(e)) {
                    if (c(e, r)) return void s.push(e);
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
        }), s.length > 0 && o.push({
            key: "classics",
            name: "Classics",
            webStableId: void 0,
            children: s
        }), o
    }], 643093)
}, 130778, e => {
    "use strict";
    var t, a, n, s = e.i(671376),
        r = e.i(692587),
        l = e.i(117236);
    let i = "AvatarItems",
        o = "".concat(i, "-"),
        c = s.Asset.HairAccessory;

    function d(e) {
        let t = (0, r.readQueryValue)(e);
        if (void 0 === t || !t.startsWith(o)) return;
        let a = t.slice(o.length);
        return a.length > 0 ? a : void 0
    }
    let u = "looks",
        m = new Set(null != (t = null == (n = l.default.find(e => "Label.AvatarItems" === e.nameKey)) || null == (a = n.submenuItems) ? void 0 : a.map(e => e.type)) ? t : []);

    function p(e) {
        return m.has(e)
    }
    e.s(["ALL_ASSET_TYPES_L1_KEY", 0, "all", "AVATAR_ITEMS_ACTIVE_TAB", 0, i, "AVATAR_LOOKS_L1_KEY", 0, u, "TAXONOMY_HOST_ASSET", 0, c, "buildTaxonomyActiveTab", 0, function(e) {
        return e ? "".concat(o).concat(e) : i
    }, "isAllAssetTypesActiveTab", 0, function(e) {
        return "all" === d(e)
    }, "isAvatarLooksActiveTab", 0, function(e) {
        return d(e) === u
    }, "isRecentsActiveTab", 0, function(e) {
        return "Recents" === (0, r.readQueryValue)(e) || "recents" === d(e)
    }, "isTaxonomyActiveTab", 0, function(e) {
        var t;
        let a = (0, r.readQueryValue)(e);
        return a === i || null != (t = null == a ? void 0 : a.startsWith(o)) && t
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
        s = e.i(252842),
        r = e.i(671376);
    let l = {
            [r.Asset.Place]: a.SearchSortParameter.LastUpdated,
            [r.Asset.UpcomingEvent]: n.EventSortBy.StartUtc,
            [r.Asset.PastEvent]: n.EventSortBy.StartUtc,
            [r.Asset.DraftEvent]: n.EventSortBy.StartUtc
        },
        i = {
            sort: l,
            setSort: () => {
                throw Error("NotImplemented")
            },
            sortOrder: s.SortOrder.Desc,
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
        o = (0, t.createContext)(i);
    o.displayName = "Filters", e.s(["default", 0, o, "defaultAssetsSort", 0, l])
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
        }), s = n[t.CreatorHubPublishingParameters.EnableMultiAssetSearch];
        return {
            isEnabled: !0 === s,
            isReady: e || void 0 !== s
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
    var t, a, n, s, r = e.i(102211),
        l = e.i(899441),
        i = e.i(361738),
        o = e.i(671376),
        c = ((t = {}).All = "All", t),
        d = ((a = {}).All = "All", a),
        u = ((n = {}).Archived = "archived", n),
        m = ((s = {}).CreatedNewest = "created_desc", s.CreatedOldest = "created_asc", s.UpdatedNewest = "updated_desc", s.UpdatedOldest = "updated_asc", s);
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
        g = [l.CreatorInventoryAssetType.Model, l.CreatorInventoryAssetType.Plugin, l.CreatorInventoryAssetType.Audio, l.CreatorInventoryAssetType.Decal, l.CreatorInventoryAssetType.Image, l.CreatorInventoryAssetType.Video, l.CreatorInventoryAssetType.Mesh, l.CreatorInventoryAssetType.MeshPart, l.CreatorInventoryAssetType.Animation],
        y = [...g, l.CreatorInventoryAssetType.TextDocument],
        v = new Set([l.CreatorInventoryAssetType.Audio, l.CreatorInventoryAssetType.Decal, l.CreatorInventoryAssetType.MeshPart, l.CreatorInventoryAssetType.TextDocument, l.CreatorInventoryAssetType.Video]),
        b = new Set([...v, l.CreatorInventoryAssetType.Image]),
        A = new Set(y),
        T = new Set([l.CreatorInventoryAssetType.TextDocument]),
        I = new Set(["All", i.CreatorInventorySourceType.Created, i.CreatorInventorySourceType.Purchased, i.CreatorInventorySourceType.Shared]),
        S = new Set([o.Asset.Animation, o.Asset.Audio, o.Asset.Decal, o.Asset.Image, o.Asset.Mesh, o.Asset.MeshPart, o.Asset.Model, o.Asset.Plugin, o.Asset.Video]),
        x = {
            [l.CreatorInventoryAssetType.Animation]: o.Asset.Animation,
            [l.CreatorInventoryAssetType.Audio]: o.Asset.Audio,
            [l.CreatorInventoryAssetType.Decal]: o.Asset.Decal,
            [l.CreatorInventoryAssetType.Image]: o.Asset.Image,
            [l.CreatorInventoryAssetType.Mesh]: o.Asset.Mesh,
            [l.CreatorInventoryAssetType.MeshPart]: o.Asset.MeshPart,
            [l.CreatorInventoryAssetType.Model]: o.Asset.Model,
            [l.CreatorInventoryAssetType.Plugin]: o.Asset.Plugin,
            [l.CreatorInventoryAssetType.TextDocument]: o.Asset.TextDocument,
            [l.CreatorInventoryAssetType.Video]: o.Asset.Video
        },
        C = {
            [l.CreatorInventoryAssetType.Animation]: r.AssetType.Animation,
            [l.CreatorInventoryAssetType.Audio]: r.AssetType.Audio,
            [l.CreatorInventoryAssetType.Decal]: r.AssetType.Decal,
            [l.CreatorInventoryAssetType.Image]: r.AssetType.Image,
            [l.CreatorInventoryAssetType.Mesh]: r.AssetType.Mesh,
            [l.CreatorInventoryAssetType.MeshPart]: r.AssetType.MeshPart,
            [l.CreatorInventoryAssetType.Model]: r.AssetType.Model,
            [l.CreatorInventoryAssetType.Plugin]: r.AssetType.Plugin,
            [l.CreatorInventoryAssetType.TextDocument]: r.AssetType.TextDocument,
            [l.CreatorInventoryAssetType.Video]: r.AssetType.Video
        },
        E = {
            3: l.CreatorInventoryAssetType.Audio,
            10: l.CreatorInventoryAssetType.Model,
            13: l.CreatorInventoryAssetType.Decal,
            24: l.CreatorInventoryAssetType.Animation,
            38: l.CreatorInventoryAssetType.Plugin,
            40: l.CreatorInventoryAssetType.MeshPart,
            62: l.CreatorInventoryAssetType.Video,
            93: l.CreatorInventoryAssetType.TextDocument,
            ANIMATION: l.CreatorInventoryAssetType.Animation,
            ASSET_TYPE_ANIMATION: l.CreatorInventoryAssetType.Animation,
            ASSET_TYPE_AUDIO: l.CreatorInventoryAssetType.Audio,
            ASSET_TYPE_DECAL: l.CreatorInventoryAssetType.Decal,
            ASSET_TYPE_IMAGE: l.CreatorInventoryAssetType.Image,
            ASSET_TYPE_MESH: l.CreatorInventoryAssetType.Mesh,
            ASSET_TYPE_MESH_PART: l.CreatorInventoryAssetType.MeshPart,
            ASSET_TYPE_MODEL: l.CreatorInventoryAssetType.Model,
            ASSET_TYPE_PLUGIN: l.CreatorInventoryAssetType.Plugin,
            ASSET_TYPE_TEXT_DOCUMENT: l.CreatorInventoryAssetType.TextDocument,
            ASSET_TYPE_VIDEO: l.CreatorInventoryAssetType.Video,
            AUDIO: l.CreatorInventoryAssetType.Audio,
            DECAL: l.CreatorInventoryAssetType.Decal,
            IMAGE: l.CreatorInventoryAssetType.Image,
            MESH: l.CreatorInventoryAssetType.Mesh,
            MESHPART: l.CreatorInventoryAssetType.MeshPart,
            MODEL: l.CreatorInventoryAssetType.Model,
            PLUGIN: l.CreatorInventoryAssetType.Plugin,
            TEXTDOCUMENT: l.CreatorInventoryAssetType.TextDocument,
            VIDEO: l.CreatorInventoryAssetType.Video
        },
        w = {
            createdDetails: i.CreatorInventorySourceType.Created,
            purchasedDetails: i.CreatorInventorySourceType.Purchased,
            sharedDetails: i.CreatorInventorySourceType.Shared
        },
        D = {
            [r.State.Active]: "Active",
            [r.State.Archived]: "Archived"
        },
        N = e => !0 === e ? y : g,
        k = e => null != e && b.has(e),
        M = e => {
            if (null == e) return;
            let t = e instanceof Date ? e : new Date(e);
            return Number.isNaN(t.getTime()) ? void 0 : t
        };
    e.s(["DEFAULT_DEVELOPMENT_ITEMS_SORT", 0, "updated_desc", "DevelopmentItemsAssetTypeFilter", () => d, "DevelopmentItemsSort", () => m, "DevelopmentItemsSourceFilter", () => c, "DevelopmentItemsStatusFilter", () => u, "buildCreatorInventoryScope", 0, (e, t) => null != t ? {
        type: l.CreatorInventoryScopeType.Group,
        id: t
    } : null != e ? {
        type: l.CreatorInventoryScopeType.User,
        id: e
    } : void 0, "buildCreatorInventorySearchFilter", 0, (e, t, a) => ({
        ...0 === t.length ? {} : {
            assetTypes: t.map(e => C[e])
        },
        ...e.type === l.CreatorInventoryScopeType.Group ? {
            groupIds: [e.id]
        } : {
            userIds: [e.id]
        },
        ..."All" === a ? {} : {
            sources: [a]
        }
    }), "canConfigureDevelopmentItem", 0, e => e.sources.includes(i.CreatorInventorySourceType.Created), "developmentItemsSortOptions", 0, p, "filterDevelopmentItemsByArchivedState", 0, (e, t) => e.filter(e => t ? "Archived" === e.state : "Archived" !== e.state), "getCreatorInventoryOrderBy", 0, (e, t) => t.trim().length > 0 ? void 0 : h[e], "getDevelopmentItemsAssetTypes", 0, N, "getDevelopmentItemsColumnSortDirection", 0, (e, t) => e === f[t].ascending ? "ascending" : e === f[t].descending ? "descending" : "none", "getDevelopmentItemsSearchAssetTypes", 0, (e, t) => [e, ...N(t).filter(t => t !== e)], "getLegacyDevelopmentItemsAssetType", 0, e => x[e], "getNextDevelopmentItemsColumnSort", 0, (e, t) => e === f[t].descending ? f[t].ascending : f[t].descending, "hasActiveDevelopmentItemsInventoryFilters", 0, e => {
        let {
            query: t,
            showArchived: a,
            source: n
        } = e;
        return t.trim().length > 0 || a || n !== i.CreatorInventorySourceType.Created
    }, "hasDevelopmentItemCreatorStorePage", 0, e => e !== l.CreatorInventoryAssetType.TextDocument, "hasDevelopmentItemThumbnail", 0, e => e !== l.CreatorInventoryAssetType.TextDocument, "isDevelopmentItemArchivedViewAvailable", 0, k, "isDevelopmentItemAsset", 0, (e, t) => e === o.Asset.TextDocument ? !0 === t : S.has(e), "isDevelopmentItemDirectlyArchivable", 0, e => null != e && v.has(e), "isDevelopmentItemsAllAssetTypes", 0, e => "All" === e, "isDevelopmentItemsArchivedViewAvailable", 0, (e, t) => t || k(1 === e.length ? e[0] : void 0), "isDevelopmentItemsAssetType", 0, (e, t) => null != e && !!A.has(e) && (!T.has(e) || !0 === t), "isDevelopmentItemsSort", 0, e => p.some(t => t === e), "isDevelopmentItemsSourceSelection", 0, e => null != e && I.has(e), "isDevelopmentItemsView", 0, e => "grid" === e || "list" === e, "mapCreatorInventoryItem", 0, e => {
        var t, a, n, s, r, l, i;
        let o, c = null == (n = e.assetItem) ? void 0 : n.asset;
        if (null == c) return;
        let d = "number" == typeof c.assetId ? c.assetId : Number.parseInt(null != (t = c.assetId) ? t : "", 10);
        if (Number.isNaN(d)) return;
        let u = null == (s = c.displayName) ? void 0 : s.trim();
        return {
            id: null != (a = e.path) ? a : d.toString(),
            assetId: d,
            assetType: (e => {
                if (null != e) return E[e.toString().toUpperCase()]
            })(c.assetType),
            created: M(c.createTime),
            isPackage: (null == (r = e.assetItem) ? void 0 : r.isPackage) === !0,
            name: null == u || 0 === u.length ? d.toString() : u,
            sources: (i = null == (l = e.assetItem) ? void 0 : l.sources, o = new Set, null == i || i.forEach(e => {
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
    var L = e.i(416340),
        P = e.i(79187),
        F = e.i(884213),
        _ = e.i(401263),
        R = e.i(730530),
        V = e.i(881670);
    e.s(["default", 0, () => {
        let e = (0, P.useTranslation)(),
            {
                translate: t
            } = e,
            {
                tPendingTranslation: a
            } = (0, _.default)(e),
            n = (0, L.useCallback)((e, t, n, s) => {
                let r = a(e, t, n, s);
                return r.length > 0 ? r : (0, F.default)(e, s)
            }, [a]),
            s = (0, L.useCallback)(e => t("Label.AssetIDWithValue", {
                assetId: e.toString()
            }), [t]),
            r = (0, L.useCallback)(e => n("Clear {filterLabel}", "Accessible label for removing an active Development Items filter chip.", (0, R.translationKey)("Action.DevelopmentItems.ClearFilter", V.TranslationNamespace.Creations), {
                filterLabel: e
            }), [n]),
            l = (0, L.useCallback)(e => n("Source: {source}", "Active filter chip describing the selected Development Items source.", (0, R.translationKey)("Label.DevelopmentItems.InventorySourceFilter", V.TranslationNamespace.Creations), {
                source: e
            }), [n]),
            i = (0, L.useCallback)((e, t) => n("{assetTypes}, +{count} more", "Active filter chip listing the first selected Development Items asset types, then how many more are selected.", (0, R.translationKey)("Label.DevelopmentItems.AssetTypesWithMore", V.TranslationNamespace.Creations), {
                assetTypes: e,
                count: t.toString()
            }), [n]),
            o = (0, L.useCallback)(e => n("{count} types", "Asset type filter text when the creator selects more than one Development Items asset type.", (0, R.translationKey)("Label.DevelopmentItems.AssetTypeCount", V.TranslationNamespace.Creations), {
                count: e.toString()
            }), [n]),
            c = (0, L.useCallback)((e, t) => n("{query} in {assetType}", "Scoped-search suggestion that searches for a query within a Development Items asset type.", (0, R.translationKey)("Label.DevelopmentItems.SearchSuggestion", V.TranslationNamespace.Creations), {
                assetType: t,
                query: e
            }), [n]);
        return {
            actions: n("Actions", "Development Items table column and accessible label for item actions.", (0, R.translationKey)("Label.DevelopmentItems.Actions", V.TranslationNamespace.Creations)),
            acquiredFromStore: t("Label.CreatorStore"),
            allAssetTypes: n("All Types", "Asset type filter text when every Development Items asset type is included.", (0, R.translationKey)("Label.DevelopmentItems.AllAssetTypes", V.TranslationNamespace.Creations)),
            allSources: n("Any", "Source filter option that includes every Development Items source.", (0, R.translationKey)("Label.DevelopmentItems.AllSources", V.TranslationNamespace.Creations)),
            assetId: t("Label.AssetID"),
            assetIdWithValue: s,
            assetTypeCount: o,
            assetTypesWithMore: i,
            assetType: n("Asset type", "Accessible label for the Development Items asset type filter.", (0, R.translationKey)("Label.DevelopmentItems.AssetType", V.TranslationNamespace.Creations)),
            breadcrumbs: n("Breadcrumbs", "Accessible label for the page path shown above the Development Items page.", (0, R.translationKey)("Label.DevelopmentItems.Breadcrumbs", V.TranslationNamespace.Creations)),
            dateCreated: n("Date created", "Development Items table column showing when an asset was created.", (0, R.translationKey)("Label.DevelopmentItems.DateCreated", V.TranslationNamespace.Creations)),
            clearFilter: r,
            clearSearch: n("Clear search", "Accessible label and action for clearing the Development Items search query.", (0, R.translationKey)("Action.DevelopmentItems.ClearSearch", V.TranslationNamespace.Creations)),
            filterBy: t("Label.FilterBy"),
            firstPage: n("First page", "Accessible label for the Development Items pagination first-page button.", (0, R.translationKey)("Action.DevelopmentItems.FirstPage", V.TranslationNamespace.Creations)),
            grid: n("Grid", "Accessible label for the Development Items grid view.", (0, R.translationKey)("Label.DevelopmentItems.GridView", V.TranslationNamespace.Creations)),
            inventorySource: n("Source", "Label for the Development Items source filter and table column.", (0, R.translationKey)("Label.DevelopmentItems.InventorySource", V.TranslationNamespace.Creations)),
            inventorySourceFilter: l,
            lastPage: n("Last page", "Accessible label for the Development Items pagination last-page button.", (0, R.translationKey)("Action.DevelopmentItems.LastPage", V.TranslationNamespace.Creations)),
            lastUpdated: t("Label.LastUpdated"),
            list: n("List", "Accessible label for the Development Items list view.", (0, R.translationKey)("Label.DevelopmentItems.ListView", V.TranslationNamespace.Creations)),
            loading: t("Label.Loading"),
            name: t("Label.Name"),
            nextPage: n("Next page", "Accessible label for the Development Items pagination next-page button.", (0, R.translationKey)("Action.DevelopmentItems.NextPage", V.TranslationNamespace.Creations)),
            noArchivedItemsDescription: n("Items you archive will show up here.", "Guidance shown when the Development Items Archived folder is empty.", (0, R.translationKey)("Description.DevelopmentItems.NoArchivedItems", V.TranslationNamespace.Creations)),
            noArchivedItems: n("No archived items", "Heading shown when the Development Items Archived folder is empty.", (0, R.translationKey)("Heading.DevelopmentItems.NoArchivedItems", V.TranslationNamespace.Creations)),
            noDevelopmentItemsDescription: n("Upload assets to see them here.", "Guidance shown when the creator has no Development Items across all asset types.", (0, R.translationKey)("Description.DevelopmentItems.NoDevelopmentItems", V.TranslationNamespace.Creations)),
            noDevelopmentItems: n("No development items yet", "Heading shown when the creator has no Development Items across all asset types.", (0, R.translationKey)("Heading.DevelopmentItems.NoDevelopmentItems", V.TranslationNamespace.Creations)),
            noItemsDescription: n("Try another search or filter.", "Guidance shown when no Development Items match the current query and filters.", (0, R.translationKey)("Description.DevelopmentItems.NoItemsFound", V.TranslationNamespace.Creations)),
            noItems: n("No items found", "Heading shown when no Development Items match the current query and filters.", (0, R.translationKey)("Heading.DevelopmentItems.NoItemsFound", V.TranslationNamespace.Creations)),
            package: n("Package", "Accessible label for the package indicator on a Development Item thumbnail.", (0, R.translationKey)("Label.DevelopmentItems.Package", V.TranslationNamespace.Creations)),
            previousPage: n("Previous page", "Accessible label for the Development Items pagination previous-page button.", (0, R.translationKey)("Action.DevelopmentItems.PreviousPage", V.TranslationNamespace.Creations)),
            retry: t("Action.Retry"),
            rowsPerPage: t("Label.RowsPerPage"),
            search: t("Label.Search"),
            searchSuggestion: c,
            searchWithinAssetType: n("Search within asset type", "Accessible label for Development Items scoped-search suggestions.", (0, R.translationKey)("Label.DevelopmentItems.SearchWithinAssetType", V.TranslationNamespace.Creations)),
            sortBestMatch: n("Sort by: Best match", "Development Items sort shown while a search query ranks results by relevance.", (0, R.translationKey)("Label.DevelopmentItems.SortByBestMatch", V.TranslationNamespace.Creations)),
            sortBy: n("Sort by", "Accessible label for the Development Items sort selector.", (0, R.translationKey)("Label.DevelopmentItems.SortBy", V.TranslationNamespace.Creations)),
            sortDateAddedAsc: n("Sort by: Date added (Asc)", "Development Items sort option listing the earliest created assets first. Asc is short for ascending.", (0, R.translationKey)("Label.DevelopmentItems.SortByDateAddedAsc", V.TranslationNamespace.Creations)),
            sortDateAddedDesc: n("Sort by: Date added (Desc)", "Development Items sort option listing the most recently created assets first. Desc is short for descending.", (0, R.translationKey)("Label.DevelopmentItems.SortByDateAddedDesc", V.TranslationNamespace.Creations)),
            sortUpdatedAsc: n("Sort by: Updated (Asc)", "Development Items sort option listing the least recently updated assets first. Asc is short for ascending.", (0, R.translationKey)("Label.DevelopmentItems.SortByUpdatedAsc", V.TranslationNamespace.Creations)),
            sortUpdatedDesc: n("Sort by: Updated (Desc)", "Development Items sort option listing the most recently updated assets first. Desc is short for descending.", (0, R.translationKey)("Label.DevelopmentItems.SortByUpdatedDesc", V.TranslationNamespace.Creations)),
            sharedWithMe: n("Shared with me", "Source filter option for Development Items shared with the current creator.", (0, R.translationKey)("Label.DevelopmentItems.SharedWithMe", V.TranslationNamespace.Creations)),
            showHiddenBreadcrumbs: n("Show hidden pages", "Accessible label for the button that expands collapsed pages in the Development Items breadcrumbs.", (0, R.translationKey)("Action.DevelopmentItems.ShowHiddenBreadcrumbs", V.TranslationNamespace.Creations)),
            unavailableDescription: n("Try again in a moment.", "Guidance shown when the Development Items inventory cannot be loaded.", (0, R.translationKey)("Description.DevelopmentItems.InventoryUnavailable", V.TranslationNamespace.Creations)),
            unavailable: n("Inventory is unavailable", "Heading shown when the Development Items inventory cannot be loaded.", (0, R.translationKey)("Heading.DevelopmentItems.InventoryUnavailable", V.TranslationNamespace.Creations)),
            viewSelector: n("Choose grid or list view", "Accessible label for the Development Items view selector.", (0, R.translationKey)("Label.DevelopmentItems.ViewSelector", V.TranslationNamespace.Creations)),
            uploadedByMe: n("Uploaded", "Source filter option for Development Items uploaded by the current creator.", (0, R.translationKey)("Label.DevelopmentItems.UploadedByMe", V.TranslationNamespace.Creations))
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
    var t = e.i(944672),
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
    var t = e.i(944672),
        a = e.i(9436);
    e.s(["default", 0, () => {
        let {
            ready: e,
            value: n
        } = (0, t.useFlag)(a.isTextDocumentEnabled);
        if (e) return n
    }])
}, 427149, e => {
    "use strict";
    var t = e.i(799972),
        a = e.i(671376),
        n = e.i(759283),
        s = e.i(475360),
        r = e.i(949599),
        l = e.i(117236);
    let i = l.default.reduce((e, t) => {
            var a;
            return t.submenuItems || e.set(t.type, {
                menuItem: t
            }), null == (a = t.submenuItems) || a.forEach(a => {
                if (a.submenuItems) {
                    var n;
                    null == (n = a.submenuItems) || n.forEach(n => {
                        e.set(n.type, {
                            menuItem: t,
                            submenuItem: a
                        })
                    })
                } else e.set(a.type, {
                    menuItem: t,
                    submenuItem: a
                })
            }), e
        }, new Map),
        o = {
            menuItem: l.default[0]
        },
        c = a.Asset.EyeMakeup,
        d = a.Asset.AvatarLooks,
        u = a.Asset.AvatarBackground,
        m = a.Asset.Showcase;
    e.s(["default", 0, {
        isMenuItemEnabled(e, n, r, l, i, o, p) {
            var h, f;
            return ((null == e ? void 0 : e.type) !== a.Asset.TextDocument || !!p) && ((null == e ? void 0 : e.type) === a.Asset.AllCatalogAsset || ((null == e ? void 0 : e.type) === a.Asset.SharedExperiences ? null == n : (null == e ? void 0 : e.type) === a.Asset.Moments ? null != i && i : (null == e ? void 0 : e.itemType) === s.Item.Bundle || (null == e ? void 0 : e.type) === d || ((null == e ? void 0 : e.type) === u ? null != (h = null == l ? void 0 : l.has(e.type)) && h : (null == e ? void 0 : e.type) === m ? null != o && o : (null == e ? void 0 : e.type) === c ? null != (f = null == l ? void 0 : l.has(null == e ? void 0 : e.type)) && f : (null == e ? void 0 : e.type) === void 0 || !!(0, t.is2DAsset)(null == e ? void 0 : e.type) || (null == e ? void 0 : e.type) !== void 0 && void 0 === r || null != r && r)))
        },
        getValidMenuState(e, t, a, n, s, r, l, i) {
            var o, d, m, p, h, f;
            let g, y, v = (null == (o = t.submenuItem) ? void 0 : o.type) !== c && (null == (d = t.submenuItem) ? void 0 : d.type) !== u || void 0 !== s;
            if (void 0 === t.menuItem || this.isMenuItemEnabled(t.menuItem, a, n, s, r, l, i)) {
                if (void 0 !== t.submenuItem && v && !this.isMenuItemEnabled(t.submenuItem, a, n, s, r, l, i))
                    if (void 0 !== t.menuItem.submenuItems) {
                        let e = 0,
                            o = 0;
                        for (; o < (null == (p = t.menuItem.submenuItems) ? void 0 : p.length);) {
                            if (this.isMenuItemEnabled(t.menuItem.submenuItems[o], a, n, s, r, l, i)) {
                                e = o;
                                break
                            }
                            o += 1
                        }
                        g = t.menuItem, y = null == (h = t.menuItem.submenuItems) ? void 0 : h[e]
                    } else g = t.menuItem, y = null == (f = t.menuItem.submenuItems) ? void 0 : f[0]
            } else [g] = e, y = null == (m = e[0].submenuItems) ? void 0 : m[0];
            return g ? {
                menuItem: g,
                submenuItem: y
            } : t
        },
        isAssetTypeDirectlyArchivable: e => l.allowedAssetTypesForDirectArchiving.has(e),
        isAssetTypeArchivable(e, t) {
            if (void 0 !== t && r.AvatarMenuMap[e]) {
                let a = r.AvatarMenuMap[e][t],
                    n = null == a ? void 0 : a.assetType;
                return (null == a ? void 0 : a.bundleType) !== void 0 || void 0 !== n && l.allowedAssetTypesForArchiving.has(n)
            }
            return l.allowedAssetTypesForArchiving.has(e)
        },
        isAssetTypeSortable: e => l.allowedAssetTypesForSorting.has(e),
        isItemTypeUploadable: e => l.allowedItemTypesForUploading.has(e),
        getAssetFullNameKey: e => n.assetFullNameKeys[e],
        getItemFullNameKey: e => n.itemFullNameKeys[e],
        getAssetType: e => e.submenuItem ? e.submenuItem.type : e.menuItem.type,
        getItemType(e) {
            return e.submenuItem && e.submenuItem.itemType ? e.submenuItem.itemType : e.menuItem.itemType ? e.menuItem.itemType : n.assetTypeToItemType[this.getAssetType(e)]
        },
        getMenuState(e, t) {
            var a;
            return e && t.includes(e) ? o : e && null != (a = i.get(e)) ? a : o
        }
    }])
}, 100226, e => {
    "use strict";
    var t = e.i(944672),
        a = e.i(239328);
    e.s(["default", 0, () => {
        let {
            ready: e,
            value: n
        } = (0, t.useFlag)(a.enableCreatorShowcases);
        if (e) return n
    }])
}, 418564, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        n = e.i(826246),
        s = e.i(79187);
    let r = {
        info: "Info",
        warning: "Warning",
        error: "Error"
    };
    e.s(["default", 0, e => {
        let {
            alertTitle: l,
            alertDescription: i,
            severity: o,
            externalLink: c,
            linkLabel: d,
            allowCloseDialog: u,
            onDismiss: m
        } = e, {
            translate: p
        } = (0, s.useTranslation)(), [h, f] = (0, a.useState)(!0);
        if (!h) return null;
        let g = u ? {
            closeLabel: p("Action.Close"),
            onDismiss: () => {
                null == m || m(), f(!1)
            }
        } : {
            hasCloseAffordance: !1
        };
        return (0, t.jsx)(n.Alert, {
            severity: r[o],
            variant: "Feedback",
            className: "width-full",
            primaryActionLabel: d,
            primaryActionHref: c,
            ...g,
            children: (0, t.jsxs)("div", {
                className: "flex flex-col gap-xsmall",
                children: [l && (0, t.jsx)("span", {
                    className: "text-label-medium content-emphasis",
                    children: l
                }), (0, t.jsx)("span", {
                    className: "text-body-medium text-truncate-split content-default width-full",
                    children: i
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
        n = [t.Locale.Indonesian, t.Locale.German, t.Locale.English, t.Locale.Spanish, t.Locale.French, t.Locale.Italian, t.Locale.Polish, t.Locale.BrazilPortuguese, t.Locale.Vietnamese, t.Locale.Turkish, t.Locale.Arabic, t.Locale.Thai, t.Locale.SimplifiedChinese, t.Locale.TraditionalChinese, t.Locale.Japanese, t.Locale.Korean];
    e.s(["StringLocaleMap", 0, a, "availableDocsLocales", 0, n])
}, 321211, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340);
    e.s(["default", 0, e => {
        let {
            className: n,
            onChange: s,
            onDragActiveHandler: r,
            onDragLeaveHandler: l,
            size: i,
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
            s && s(t)
        }, e => {
            e.preventDefault(), r && r()
        }, e => {
            e.preventDefault(), l && l()
        }) : null;
        return (0, t.jsxs)("div", {
            className: n,
            children: [f, (0, t.jsx)("input", {
                ...u,
                accept: d,
                multiple: o,
                ref: m,
                type: "file",
                size: i,
                onChange: e => {
                    let {
                        target: t
                    } = e;
                    s && s(t.files), m.current && (m.current.value = "")
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
        s = e.i(958885),
        r = e.i(611043),
        l = e.i(537683),
        i = e.i(695763),
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
        g = {
            compact: 12,
            medium: 16,
            large: 20
        },
        y = {
            compact: 32,
            medium: 48,
            large: 64
        },
        v = {
            compact: 4,
            medium: 6,
            large: 8
        },
        b = (0, i.makeStyles)()((e, t) => {
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
                    marginRight: g[a]
                },
                userBorderRadius: {
                    borderRadius: y[a]
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
        let i, {
                target: g,
                targetType: y,
                displayNameOverride: v,
                adornment: A,
                label: T,
                disabled: I,
                variant: S = "medium",
                disableLink: x = !1,
                obfuscate: C = !1,
                hideThumbnail: E = !1,
                hideSecondaryLabel: w = !1,
                textVariant: D = "primary",
                labelTooltip: N,
                secondaryLabelClassName: k
            } = e,
            {
                classes: {
                    container: M,
                    avatarContainer: L,
                    thumbnailItemContainer: P,
                    thumbnailBackground: F,
                    userBorderRadius: _,
                    nonUserBorderRadius: R,
                    itemText: V,
                    mutedText: U,
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
            H = (0, a.useMemo)(() => y === p.default.User ? s.ThumbnailTypes.avatarHeadshot : y === p.default.Group ? s.ThumbnailTypes.groupIcon : "Ugc" === y ? s.ThumbnailTypes.assetThumbnail : s.ThumbnailTypes.universeThumbnail, [y]),
            K = (0, a.useMemo)(() => {
                if (!x && g.id && !C) {
                    if (y === p.default.User) return h.www.getUserUrl(g.id);
                    if (y === p.default.Group) return h.www.getGroupUrl(g.id);
                    if ("Experience" === y) {
                        let e = "rootPlaceId" in g ? g.rootPlaceId : void 0;
                        return e ? h.www.getGameDetailsUrl(e) : void 0
                    }
                    if ("Ugc" === y) return h.www.getCatalogUrl(g.id)
                }
            }, [x, g, C, y]);
        v ? i = v : y === p.default.User ? i = "displayName" in g ? g.displayName : void 0 : "Ugc" !== y && (i = "name" in g ? g.name : void 0);
        let z = !v && (y === p.default.User && !("displayName" in g && g.displayName) || "Ugc" === y),
            W = (0, a.useMemo)(() => {
                let e;
                return (0, t.jsxs)(l.Grid, {
                    container: !0,
                    direction: "row",
                    alignItems: "center",
                    wrap: "wrap",
                    children: [z ? (0, t.jsx)(d.Skeleton, {
                        animate: !0,
                        variant: "text",
                        width: 192,
                        height: 22
                    }) : (0, t.jsxs)(l.Grid, {
                        container: !0,
                        direction: "row",
                        alignItems: "center",
                        wrap: "wrap",
                        columnGap: 1,
                        children: [(0, t.jsx)(r.Typography, {
                            className: O,
                            variant: "secondary" === D ? "body1" : "compact" === S ? "captionHeader" : "large" === S ? "h2" : "h5",
                            color: I ? "disabled" : "inherit",
                            children: C ? G("Label.Other") : i
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
                        children: [y === p.default.User && (0, t.jsx)(t.Fragment, {
                            children: "name" in g && !g.name ? (0, t.jsx)(d.Skeleton, {
                                animate: !0,
                                variant: "text",
                                width: 192,
                                height: 20
                            }) : (0, t.jsx)(r.Typography, {
                                variant: "secondary" === D ? "body2" : "captionBody",
                                className: j(O, {
                                    [U]: void 0 === k && ("secondary" === D || "compact" === S)
                                }),
                                color: I ? "disabled" : "inherit",
                                children: (e = C ? G("Label.Other") : "@".concat("name" in g ? g.name : ""), k ? (0, t.jsx)("span", {
                                    className: k,
                                    children: e
                                }) : e)
                            })
                        }), (y === p.default.Group || "Experience" === y) && (0, t.jsx)(r.Typography, {
                            variant: "captionBody",
                            className: j(O, {
                                [U]: void 0 === k && ("secondary" === D || "compact" === S)
                            }),
                            color: I ? "disabled" : "inherit",
                            children: k ? (0, t.jsx)("span", {
                                className: k,
                                children: C ? G("Label.Other") : g.id
                            }) : C ? G("Label.Other") : g.id
                        })]
                    })]
                })
            }, [z, i, y, g, O, I, C, G, T, w, j, U, D, S, N, k]);
        return (0, t.jsx)(l.Grid, {
            container: !0,
            direction: "row",
            alignItems: "center",
            wrap: "nowrap",
            justifyContent: "space-between",
            className: M,
            children: (null == g ? void 0 : g.id) === void 0 ? (0, t.jsx)(d.Skeleton, {
                animate: !0,
                variant: "rectangular",
                width: "100%",
                height: f[S]
            }) : (0, t.jsxs)(t.Fragment, {
                children: [(0, t.jsxs)(l.Grid, {
                    container: !0,
                    wrap: "nowrap",
                    children: [!E && (0, t.jsx)(l.Grid, {
                        item: !0,
                        className: P,
                        children: (0, t.jsx)(o.Avatar, {
                            variant: "rounded",
                            alt: "avatar",
                            className: j(L, {
                                [_]: y === p.default.User,
                                [R]: y !== p.default.User,
                                [B]: I
                            }),
                            children: (0, t.jsx)(s.Thumbnail2d, {
                                targetId: g.id,
                                type: H,
                                imgClassName: F,
                                alt: "thumbnail",
                                returnPolicy: s.ReturnPolicy.PlaceHolder,
                                includeBackground: !1
                            })
                        })
                    }), (0, t.jsx)(l.Grid, {
                        container: !0,
                        direction: "column",
                        className: M,
                        children: (0, t.jsx)(l.Grid, {
                            item: !0,
                            children: x || C ? W : (0, t.jsx)(c.Link, {
                                href: K,
                                className: V,
                                color: "inherit",
                                children: W
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
        var t, a, n, s;
        if ((null == e ? void 0 : e.mode) === "standalone") return {
            mode: "standalone",
            shouldUnmountOnClose: null == (s = e.shouldUnmountOnClose) || s
        };
        let r = null != e ? e : {};
        return {
            mode: "content",
            size: null != (t = r.size) ? t : "Medium",
            isModal: null == (a = r.isModal) || a,
            hasCloseAffordance: void 0 !== r.closeLabel,
            closeLabel: r.closeLabel,
            hasMarginTop: r.hasMarginTop,
            hasMarginBottom: r.hasMarginBottom,
            hasDescription: r.hasDescription,
            shouldUnmountOnClose: null == (n = r.shouldUnmountOnClose) || n
        }
    }
    let s = n(),
        r = {
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
    e.s(["DEFAULT_RESOLVED_CONTENT_OPTIONS", 0, s, "dialogStore", 0, r])
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
        s = {
            ...n,
            enqueue: function(e) {
                var t, s;
                let r = n.getSnapshot().current;
                null == r || null == (t = (s = r.props).onClose) || t.call(s), a += 1, n.setState({
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
    e.s(["snackbarStore", 0, s])
}, 125677, 20227, e => {
    "use strict";
    var t = e.i(416340);
    e.s(["useCurrentPage", 0, function(e, a) {
        let {
            page: n,
            rowsPerPage: s,
            hasNextPage: r,
            fetchNextPage: l,
            fetchLimit: i = s
        } = a, o = (0, t.useMemo)(() => {
            let t = n * s;
            return e.slice(t, t + s)
        }, [e, n, s]), c = (n + 1) * i >= e.length;
        return (0, t.useEffect)(() => {
            c && r && (null == l || l())
        }, [c, r, l]), {
            currentPage: o
        }
    }], 125677), e.s(["useTablePagination", 0, function(e) {
        let {
            count: a,
            initialRowsPerPage: n = 50,
            resetKey: s
        } = e, [r, l] = (0, t.useState)(0), [i, o] = (0, t.useState)(n), [c, d] = (0, t.useState)(s);
        s !== c && (d(s), l(0));
        let u = Math.max(0, Math.ceil(a / i) - 1),
            m = Math.min(r, u);
        return {
            page: m,
            rowsPerPage: i,
            onPageChange: (0, t.useCallback)((e, t) => {
                l(Math.max(0, Math.min(t, u)))
            }, [u]),
            onRowsPerPageChange: (0, t.useCallback)(e => {
                o("number" == typeof e ? e : parseInt(e.target.value, 10)), l(0)
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
            disabled: s,
            intervalMs: r = 1e3
        } = e, l = (0, t.useRef)(n);
        l.current = n, (0, t.useEffect)(() => {
            if (!a || s) return;
            l.current();
            let e = setInterval(() => {
                l.current()
            }, r);
            return () => clearInterval(e)
        }, [a, s, r])
    }])
}, 85057, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(602635),
        n = e.i(79187),
        s = e.i(611043),
        r = e.i(537683),
        l = e.i(695763),
        i = e.i(484541);
    let o = (0, l.makeStyles)()(e => ({
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
            header: l,
            items: c,
            icon: d,
            activeKey: u,
            defaultExpanded: m,
            headerAction: p
        } = e, {
            classes: h
        } = o(), {
            ready: f
        } = (0, n.useTranslation)();
        return f ? (0, t.jsxs)(r.Grid, {
            classes: {
                root: h.container
            },
            children: [l && (0, t.jsxs)(t.Fragment, {
                children: [(0, t.jsxs)(r.Grid, {
                    classes: {
                        root: h.headerContainer
                    },
                    children: [d && (0, t.jsx)(r.Grid, {
                        classes: {
                            root: h.icon
                        },
                        children: d
                    }), (0, t.jsx)(s.Typography, {
                        variant: "largeLabel2",
                        classes: {
                            root: h.header
                        },
                        children: (0, t.jsx)("span", {
                            className: h.headerText,
                            children: l
                        })
                    }), p && (0, t.jsx)(r.Grid, {
                        classes: {
                            root: h.headerAction
                        },
                        children: p
                    })]
                }), (0, t.jsx)(i.Divider, {
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
        a = e.i(968892),
        n = e.i(973047),
        s = e.i(79187),
        r = e.i(611043);
    e.s(["default", 0, e => {
        let {
            open: l,
            onOpenChange: i,
            onContinueWithId: o,
            onAddParent: c
        } = e, {
            translate: d
        } = (0, s.useTranslation)();
        return (0, t.jsx)(n.Dialog, {
            open: l,
            onOpenChange: i,
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
                    }), (0, t.jsx)(r.Typography, {
                        className: "text-body-medium",
                        children: d("Description.IdVerifiedDialog")
                    }), (0, t.jsx)(r.Typography, {
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
    let s = ["creatorEligibility"];
    e.s(["creatorEligibilityQueryKeyPrefix", 0, s, "useCreatorEligibility", 0, function() {
        let {
            overrideUserId: e,
            isReady: r = !0,
            refetchInterval: l = !1
        } = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {}, {
            user: i
        } = (0, a.useAuthentication)(), o = null == i ? void 0 : i.id, c = null != e ? e : o;
        return (0, t.useQuery)({
            queryKey: [...s, null != c ? c : null],
            queryFn: async () => n.default.coreContentGetCreatorEligibility({
                userId: c
            }),
            enabled: r && !!c,
            refetchInterval: l,
            refetchIntervalInBackground: !0
        })
    }])
}, 845592, 448005, e => {
    "use strict";
    var t, a = e.i(221628),
        n = e.i(416340),
        s = e.i(445550),
        r = ((t = {}).FrontendFlagEnableNonPluginDistributionRestrictions = "PublicFrontendMDR", t.FrontendFlagEnableModelPricingTransition = "PublicFrontendEMPT", t.FrontendFlagEnableSocialLinkCustomTitles = "PublicFrontendSLCT", t.FrontendFlagEnableAudioWavUpload = "PublicFrontendAWU", t.FrontendFlagEnableAudioFlacUpload = "PublicFrontendAFU", t.FrontendFlagEnableCreatorInsightsPage = "PublicFrontendCIP", t.FrontendFlagEnableTryAssetSocialLink = "PublicFrontendETIR", t.FrontendFlagEnableTryAssetDefaultExperience = "PublicFrontendETADE", t.FrontendFlagEnablePaidModelDependenciesModal = "PublicFrontendPMDM", t.FrontendFlagTaxonomyExperiment = "PublicFrontendTE", t.FrontendFlagUniverseBansManagerLabelUpdate = "PublicFrontendUBMLU", t.FrontendFlagEnableHiddenFromSearchVisibilityAlert = "PublicFrontendHFS", t);
    let l = Object.values(r),
        i = (e => {
            let t = {};
            for (let a of l) t[a] = e(a);
            if (!l.every(e => Object.hasOwn(t, e))) throw Error("Failed to build frontend flags.");
            return t
        })(() => !1);
    e.s(["DEFAULT_FRONTEND_FLAGS", 0, i, "FRONTEND_FLAG_NAMES", 0, l, "FrontendFlagName", () => r], 448005);
    let o = (0, n.createContext)(null);
    e.s(["default", 0, e => {
        let {
            children: t
        } = e, [r, c] = (0, n.useState)(i), [d, u] = (0, n.useState)(!1), m = (0, n.useCallback)(async e => {
            try {
                let t = await s.default.getFrontendFlagsValues(e),
                    a = Object.assign({}, ...l.map(e => {
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
                    flags: [...l]
                };
            return u(!0), (async () => {
                await m(t), e && u(!1)
            })(), () => {
                e = !1
            }
        }, [m]);
        let p = (0, n.useMemo)(() => ({
            frontendFlags: r,
            getFrontendFlags: m,
            loadingFrontendFlags: d
        }), [r, m, d]);
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
    let s = e => {
        let t = Array.isArray(e) ? e[0] : e;
        if (!t) return null;
        let a = Number(t);
        return Number.isInteger(a) && a > 0 ? a : null
    };
    e.s(["default", 0, function() {
        let e = (0, a.useRouter)(),
            {
                groups: r,
                isFetched: l,
                currentGroup: i,
                setCurrentGroup: o
            } = (0, n.useGroups)(),
            c = (0, t.useRef)(!1),
            d = (0, t.useRef)(!1),
            u = (0, t.useMemo)(() => {
                if (!e.isReady) return null;
                let t = s(e.query.groupId),
                    a = s(e.query.userId);
                return null !== t && null !== a ? null : null !== a ? {
                    kind: "user"
                } : null !== t ? {
                    kind: "group",
                    id: t
                } : null
            }, [e.isReady, e.query.groupId, e.query.userId]),
            m = (null == u ? void 0 : u.kind) === "group" && (null != r ? r : []).some(e => {
                let {
                    id: t
                } = e;
                return t === u.id
            });
        (0, t.useEffect)(() => {
            !c.current && null !== u && l && (c.current = !0, "user" === u.kind ? null !== i && o(null) : m && (null == i ? void 0 : i.id) !== u.id && o(u.id))
        }, [u, l, m, i, o]);
        let p = !e.isReady;
        return p || null === u || (p = "group" === u.kind ? !l || m && (null == i ? void 0 : i.id) !== u.id : !l || null !== i), (0, t.useEffect)(() => {
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
        n = e.i(78892),
        s = e.i(608652),
        r = e.i(199786),
        l = e.i(300792),
        i = e.i(692166),
        o = e.i(600317),
        c = e.i(221628),
        d = "Switch",
        [u, m] = (0, s.createContextScope)(d),
        [p, h] = u(d),
        f = t.forwardRef((e, s) => {
            let {
                __scopeSwitch: l,
                name: i,
                checked: u,
                defaultChecked: m,
                required: h,
                disabled: f,
                value: g = "on",
                onCheckedChange: y,
                form: A,
                ...T
            } = e, [I, S] = t.useState(null), x = (0, n.useComposedRefs)(s, e => S(e)), C = t.useRef(!1), E = !I || A || !!I.closest("form"), [w, D] = (0, r.useControllableState)({
                prop: u,
                defaultProp: null != m && m,
                onChange: y,
                caller: d
            });
            return (0, c.jsxs)(p, {
                scope: l,
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
                    value: g,
                    ...T,
                    ref: x,
                    onClick: (0, a.composeEventHandlers)(e.onClick, e => {
                        D(e => !e), E && (C.current = e.isPropagationStopped(), C.current || e.stopPropagation())
                    })
                }), E && (0, c.jsx)(v, {
                    control: I,
                    bubbles: !C.current,
                    name: i,
                    value: g,
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
    var g = "SwitchThumb",
        y = t.forwardRef((e, t) => {
            let {
                __scopeSwitch: a,
                ...n
            } = e, s = h(g, a);
            return (0, c.jsx)(o.Primitive.span, {
                "data-state": b(s.checked),
                "data-disabled": s.disabled ? "" : void 0,
                ...n,
                ref: t
            })
        });
    y.displayName = g;
    var v = t.forwardRef((e, a) => {
        let {
            __scopeSwitch: s,
            control: r,
            checked: o,
            bubbles: d = !0,
            ...u
        } = e, m = t.useRef(null), p = (0, n.useComposedRefs)(m, a), h = (0, l.usePrevious)(o), f = (0, i.useSize)(r);
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
    v.displayName = "SwitchBubbleInput", e.s(["Root", 0, f, "Thumb", 0, y])
}, 275574, e => {
    "use strict";
    var t = e.i(155743);
    e.s(["CategoryDomain", () => t.V1ItemsCategoriesGetCategoryDomainEnum])
}, 826246, e => {
    "use strict";
    var t = e.i(880343),
        a = e.i(968892),
        n = e.i(944821),
        s = e.i(24286),
        r = e.i(247268),
        l = e.i(197649),
        i = e.i(416340);
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
                linkTarget: s,
                onAction: r,
                variant: l
            } = e;
            return s ? i.default.createElement(a.Button, {
                asChild: !0,
                size: "Small",
                variant: l,
                onClick: r
            }, i.default.cloneElement(s, {}, t)) : n ? i.default.createElement(a.Button, {
                as: "a",
                href: n,
                size: "Small",
                variant: l,
                onClick: r
            }, t) : i.default.createElement(a.Button, {
                size: "Small",
                variant: l,
                onClick: r
            }, t)
        },
        p = e => {
            let {
                label: t,
                href: a,
                linkTarget: n,
                onAction: r
            } = e;
            return n ? i.default.createElement(s.Link, {
                asChild: !0,
                onClick: r,
                size: "Medium",
                variant: "Standalone",
                underline: "always"
            }, i.default.cloneElement(n, {}, t)) : a ? i.default.createElement(s.Link, {
                href: a,
                onClick: r,
                size: "Medium",
                variant: "Standalone",
                underline: "always"
            }, t) : i.default.createElement(s.Link, {
                as: "button",
                onClick: r,
                size: "Medium",
                variant: "Standalone",
                underline: "always"
            }, t)
        },
        h = (0, i.forwardRef)((e, a) => {
            let {
                children: s,
                variant: h = "System",
                severity: f = "Info",
                primaryActionLabel: g,
                primaryActionHref: y,
                primaryActionLinkTarget: v,
                onPrimaryAction: b,
                secondaryActionLabel: A,
                secondaryActionHref: T,
                secondaryActionLinkTarget: I,
                onSecondaryAction: S,
                hasCloseAffordance: x = !0,
                closeLabel: C = "Dismiss alert",
                onDismiss: E,
                className: w,
                style: D,
                ...N
            } = e, k = (0, n.default)("foundation-web-alert-message-"), M = !!g, L = !!A, P = !!(x && E), F = "Feedback" === h && (M || L || P), _ = "Warning" === f || "Error" === f ? "alert" : "status", R = null;
            M && (R = L ? i.default.createElement(m, {
                label: g || "",
                href: y,
                linkTarget: v,
                onAction: b,
                variant: "Standard"
            }) : i.default.createElement(p, {
                label: g || "",
                href: y,
                linkTarget: v,
                onAction: b
            }));
            let V = L ? i.default.createElement(m, {
                label: A || "",
                href: T,
                linkTarget: I,
                onAction: S,
                variant: "Utility"
            }) : null;
            return i.default.createElement("div", {
                ref: a,
                role: F ? "region" : _,
                "aria-labelledby": F ? k : void 0,
                className: (0, l.default)("foundation-web-alert relative width-full stroke-standard", "System" === h ? "[border-left-width:0] [border-right-width:0]" : "radius-medium", d[f], w),
                ...N
            }, i.default.createElement("div", {
                "aria-hidden": "true",
                className: (0, l.default)("absolute inset-[0] pointer-events-none", "Feedback" === h && "radius-medium"),
                style: {
                    backgroundColor: u[f]
                }
            }), i.default.createElement("div", {
                className: "relative flex items-start gap-x-medium padding-x-large padding-y-small min-width-0"
            }, i.default.createElement("div", {
                className: "flex items-start padding-y-xsmall self-stretch shrink-0"
            }, i.default.createElement("div", {
                className: "relative flex items-start padding-y-xxsmall"
            }, "Warning" !== f && i.default.createElement("span", {
                "aria-hidden": "true",
                className: "absolute width-[10px] height-[14px] top-[5px]",
                style: {
                    left: "50%",
                    transform: "translateX(-50%)",
                    backgroundColor: "var(--dark-mode-content-emphasis)"
                }
            }), i.default.createElement(t.Icon, {
                "aria-hidden": "true",
                name: o[f],
                size: "Medium",
                className: "relative",
                style: {
                    color: c[f]
                }
            }))), i.default.createElement("div", {
                className: (0, l.default)("flex grow-1 basis-0 min-width-0 items-start gap-x-medium gap-y-small", L ? "flex-col" : "wrap")
            }, i.default.createElement("div", {
                id: F ? k : void 0,
                role: F ? _ : void 0,
                className: (0, l.default)("flex items-center padding-top-[var(--size-150)] text-body-medium text-wrap content-emphasis [overflow-wrap:anywhere]", L ? "width-full min-width-0" : "grow-1 basis-0 min-width-[min(200px,100%)]")
            }, s), (R || V) && i.default.createElement("div", {
                className: (0, l.default)("flex items-center gap-small wrap shrink-0", !L && "padding-y-[var(--size-150)]")
            }, R, V)), P && i.default.createElement(r.CloseAffordance, {
                variant: "Utility",
                size: "Medium",
                isCircular: !0,
                className: "content-emphasis shrink-0 padding-[var(--size-150)]",
                "aria-label": C,
                onClick: E
            })))
        });
    e.s(["Alert", 0, h])
}, 441515, e => {
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
        s = (0, a.forwardRef)((e, s) => {
            let {
                className: r,
                aspectRatio: l = "1:1",
                alt: i,
                containerClassName: o,
                ...c
            } = e;
            return a.default.createElement("div", {
                className: (0, t.default)("foundation-web-media clip", n[l], o)
            }, a.default.createElement("img", {
                ref: s,
                className: (0, t.default)("foundation-web-media-image", r),
                alt: i,
                ...c
            }))
        });
    s.displayName = "Media", e.s(["Media", 0, s])
}, 11763, e => {
    "use strict";
    var t = e.i(494118),
        a = e.i(960916),
        n = e.i(197649),
        s = e.i(416340),
        r = e.i(425353);
    let l = e => {
            let {
                type: t,
                sideSheetSide: a = "right",
                isSideSheetFlush: l = !1,
                centerSheetSize: i = "Medium",
                children: o,
                overlayClassName: c,
                contentClassName: d,
                onOpenAutoFocus: u,
                onCloseAutoFocus: m,
                onPointerDownOutside: p,
                onEscapeKeyDown: h,
                onInteractOutside: f
            } = e;
            return s.default.createElement(r.Portal, null, s.default.createElement(r.Overlay, {
                "data-testid": "fui-base-sheet-overlay",
                "data-type": t,
                "data-side": "sideSheet" === t ? a : void 0,
                "data-flush": "sideSheet" === t ? l : void 0,
                "data-size": "centerSheet" === t ? i : void 0,
                className: (0, n.default)("fui-base-sheet-overlay", "foundation-web-portal-zindex fixed inset-[0] flex", c)
            }, s.default.createElement(r.Content, {
                "data-testid": "fui-base-sheet-content",
                className: (0, n.default)("fui-base-sheet-content relative bg-surface-100 stroke-muted stroke-standard shadow-transient-high", "flex flex-col clip", d),
                onOpenAutoFocus: u,
                onCloseAutoFocus: m,
                onPointerDownOutside: p,
                onEscapeKeyDown: h,
                onInteractOutside: f
            }, o)))
        },
        i = e => {
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
            let s = n.find(e => {
                var t, a;
                return ("function" != typeof(a = t = e.element).checkVisibility || a.checkVisibility()) && !("disabled" in t && t.disabled || "true" === t.getAttribute("aria-disabled"))
            });
            if (s) {
                var r;
                e.preventDefault();
                let t = document.activeElement === s.element;
                s.element.focus(), !t && (r = s.element) instanceof HTMLInputElement && "function" == typeof r.select && r.select()
            }
        };
    var o = e.i(167878),
        c = e.i(199512);
    let d = (0, s.createContext)(null),
        u = () => {
            let e = (0, s.useContext)(d);
            if (!e) throw Error("Sheet components must be used within a Sheet");
            return e
        },
        m = "padding-x-xlarge",
        p = (0, s.forwardRef)((e, t) => {
            let {
                children: a,
                className: r,
                hasPaddingX: l = !0,
                ...i
            } = e, {
                type: o
            } = u();
            return s.default.createElement("div", {
                ref: t,
                className: (0, n.default)("scroll-y", l && m, "sideSheet" === o ? "grow-1" : "", r),
                ...i
            }, a)
        });
    p.displayName = "SheetBody", e.s(["SheetActions", 0, e => {
        let {
            children: t,
            className: r,
            ...l
        } = e;
        return s.default.createElement(s.default.Fragment, null, s.default.createElement(a.Divider, null), s.default.createElement("div", {
            className: (0, n.default)(m, "margin-y-small shrink-0", r),
            ...l
        }, t))
    }, "SheetBody", 0, p, "SheetContent", 0, e => {
        let t, {
                children: a,
                centerSheetSize: r = "Medium",
                largeScreenVariant: c = "center",
                closeLabel: u,
                className: m,
                mobilePortraitClassName: p,
                mobileLandscapeClassName: h,
                largeScreenClassName: f,
                onOpenAutoFocus: g,
                onCloseAutoFocus: y,
                onPointerDownOutside: v,
                onEscapeKeyDown: b,
                onInteractOutside: A
            } = e,
            T = (0, o.useMediaQuery)("(orientation: portrait) and (max-width: 600px)"),
            I = (0, o.useMediaQuery)("(orientation: landscape) and (max-height: 600px)");
        t = T ? "bottomSheet" : I || "side" === c ? "sideSheet" : "centerSheet";
        let S = (0, s.useMemo)(() => ({
                centerSheetSize: r,
                largeScreenVariant: c,
                closeLabel: u,
                isPortraitMobile: T,
                isLandscapeMobile: I,
                type: t
            }), [r, c, u, T, I, t]),
            x = (0, n.default)(m, T && p, I && h, !T && !I && f);
        return s.default.createElement(d.Provider, {
            value: S
        }, s.default.createElement(l, {
            type: t,
            sideSheetSide: "right",
            isSideSheetFlush: I,
            centerSheetSize: r,
            contentClassName: x,
            onOpenAutoFocus: null != g ? g : i,
            onCloseAutoFocus: y,
            onPointerDownOutside: v,
            onEscapeKeyDown: b,
            onInteractOutside: A
        }, a))
    }, "SheetDescription", 0, e => s.default.createElement(r.Description, {
        asChild: !0,
        ...e
    }), "SheetRoot", 0, e => {
        let {
            open: t,
            onOpenChange: a,
            defaultOpen: n,
            children: l
        } = e;
        return s.default.createElement(r.Root, {
            open: t,
            onOpenChange: a,
            defaultOpen: n,
            modal: !0
        }, l)
    }, "SheetTitle", 0, e => {
        let {
            className: a,
            children: l,
            navigation: i,
            utilities: o,
            visuallyHideTitleText: d
        } = e, {
            closeLabel: m
        } = u(), p = s.default.createElement(r.Title, {
            className: "text-heading-small margin-none"
        }, l);
        return s.default.createElement("div", {
            className: (0, n.default)(a, i ? "padding-left-medium" : "padding-left-xlarge", "padding-right-small padding-y-small", "flex items-center justify-between")
        }, s.default.createElement("div", {
            className: (0, n.default)("flex items-center", i && "gap-xsmall")
        }, i, d ? s.default.createElement(c.VisuallyHidden, null, p) : p), s.default.createElement("div", {
            className: (0, n.default)("flex items-center", o && "gap-xxsmall")
        }, o, s.default.createElement("div", {
            className: "fui-sheet-close-affordance-container"
        }, s.default.createElement(r.Close, {
            asChild: !0
        }, s.default.createElement(t.IconButton, {
            variant: "Utility",
            size: "Medium",
            icon: "icon-regular-x",
            ariaLabel: m || "",
            "data-autofocus-priority": "1000"
        })))))
    }, "SheetTrigger", 0, e => s.default.createElement(r.Trigger, {
        asChild: !0,
        ...e
    })], 11763)
}, 278300, e => {
    "use strict";
    var t = e.i(880343),
        a = e.i(737586),
        n = e.i(494118),
        s = e.i(197649),
        r = e.i(416340);
    let l = {
            Small: "XSmall",
            Medium: "Small"
        },
        i = {
            Small: "size-600",
            Medium: "size-800"
        },
        o = {
            Small: "text-label-small",
            Medium: "text-label-medium"
        },
        c = (e, t) => t ? "Page ".concat(e, ", current page") : "Go to page ".concat(e),
        d = (0, r.forwardRef)((e, t) => {
            let {
                currentPage: d,
                totalPages: u,
                onPageChange: m,
                navType: p = "MultiPage",
                size: h = "Medium",
                hasFirstLastButtons: f,
                firstPageLabel: g,
                previousPageLabel: y,
                nextPageLabel: v,
                lastPageLabel: b,
                pageLabel: A = c,
                isAlwaysVisible: T = !1,
                className: I,
                "aria-label": S,
                ...x
            } = e, C = Math.max(0, Math.floor(u)), E = Math.min(Math.max(1, Math.floor(d)), Math.max(1, C)), w = 0 === C || 1 === E, D = 0 === C || E === C;
            if (C <= 1 && !T) return null;
            let N = [];
            if ("MultiPage" === p) N = C <= 7 ? Array.from({
                length: C
            }, (e, t) => t + 1) : E <= 4 ? [1, 2, 3, 4, 5, "trailing-ellipsis", C] : E >= C - 3 ? [1, "leading-ellipsis", C - 4, C - 3, C - 2, C - 1, C] : [1, "leading-ellipsis", E - 1, E, E + 1, "trailing-ellipsis", C];
            else "SinglePage" === p && C > 0 && (N = [E]);
            let k = l[h];
            return r.default.createElement("nav", {
                ref: t,
                "aria-label": S,
                className: (0, s.default)("foundation-web-pagination inline-flex items-center gap-small", I),
                ...x
            }, r.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, f && r.default.createElement(n.IconButton, {
                icon: "icon-regular-double-chevron-large-left",
                ariaLabel: g,
                size: k,
                variant: "Utility",
                isCircular: !0,
                isDisabled: w,
                onClick: () => m(1)
            }), r.default.createElement(n.IconButton, {
                icon: "icon-regular-chevron-small-left",
                ariaLabel: y,
                size: k,
                variant: "Utility",
                isCircular: !0,
                isDisabled: w,
                onClick: () => m(E - 1)
            })), N.length > 0 && r.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, N.map(e => "number" != typeof e ? r.default.createElement("span", {
                key: e,
                "aria-hidden": "true",
                className: (0, s.default)("inline-flex items-center justify-center content-action-utility select-none", i[h], o[h])
            }, "…") : e === E ? r.default.createElement("span", {
                key: e,
                role: "img",
                "aria-current": "page",
                "aria-label": A(e, !0),
                className: (0, s.default)("inline-flex items-center justify-center radius-circle bg-inverse-surface-0 content-inverse-emphasis select-none", i[h], o[h])
            }, e) : r.default.createElement("button", {
                key: e,
                type: "button",
                "aria-label": A(e, !1),
                className: (0, s.default)("relative clip group/interactable focus-visible:outline-focus disabled:outline-none", "relative inline-flex items-center justify-center radius-circle stroke-none bg-none content-action-utility cursor-pointer", i[h], o[h]),
                onClick: () => m(e)
            }, r.default.createElement(a.StateLayer, null), e))), r.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, r.default.createElement(n.IconButton, {
                icon: "icon-regular-chevron-small-right",
                ariaLabel: v,
                size: k,
                variant: "Utility",
                isCircular: !0,
                isDisabled: D,
                onClick: () => m(E + 1)
            }), f && r.default.createElement(n.IconButton, {
                icon: "icon-regular-double-chevron-large-right",
                ariaLabel: b,
                size: k,
                variant: "Utility",
                isCircular: !0,
                isDisabled: D,
                onClick: () => m(C)
            })))
        });
    d.displayName = "Pagination";
    let u = (0, r.createContext)(null),
        m = e => {
            let t = (0, r.useContext)(u);
            if (!t) throw Error("".concat(e, " must be used within a <Table>"));
            return t
        },
        p = {
            XSmall: "height-800",
            Small: "height-1200",
            Medium: "height-1500"
        },
        h = {
            XSmall: "padding-x-medium",
            Small: "padding-x-large",
            Medium: "padding-x-xlarge"
        },
        f = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-medium"
        },
        g = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium"
        },
        y = {
            XSmall: "text-body-small",
            Small: "text-body-medium",
            Medium: "text-body-medium"
        },
        v = {
            start: "text-align-x-start",
            center: "text-align-x-center",
            end: "text-align-x-end"
        },
        b = {
            start: "justify-start",
            center: "justify-center",
            end: "justify-end"
        },
        A = (0, r.forwardRef)((e, t) => {
            let {
                children: a,
                size: n = "Medium",
                variant: l = "Divided",
                className: i,
                ...o
            } = e, c = (0, r.useMemo)(() => ({
                size: n,
                variant: l
            }), [n, l]), d = "Framed" === l;
            return r.default.createElement(u.Provider, {
                value: c
            }, r.default.createElement("div", {
                className: (0, s.default)("width-full bg-surface-100", d && "radius-medium clip stroke-standard stroke-default")
            }, r.default.createElement("table", {
                ref: t,
                className: (0, s.default)("foundation-web-table width-full content-default", i),
                ...o
            }, a)))
        });
    A.displayName = "Table";
    let T = (0, r.forwardRef)((e, t) => {
        let {
            children: a,
            className: n,
            ...l
        } = e;
        return m("TableHeader"), r.default.createElement("thead", {
            ref: t,
            className: (0, s.default)("foundation-web-table-header", n),
            ...l
        }, a)
    });
    T.displayName = "TableHeader";
    let I = (0, r.forwardRef)((e, t) => {
        let {
            children: a,
            className: n,
            ...l
        } = e;
        return m("TableBody"), r.default.createElement("tbody", {
            ref: t,
            className: (0, s.default)("foundation-web-table-body", n),
            ...l
        }, a)
    });
    I.displayName = "TableBody";
    let S = (0, r.forwardRef)((e, t) => {
        let {
            children: a,
            className: n,
            isInteractive: l = !1,
            isHoverable: i = !1,
            isSelected: o = !1,
            isDisabled: c = !1,
            onClick: d,
            onKeyDown: u,
            tabIndex: p,
            role: h,
            ...f
        } = e;
        m("TableRow");
        let g = l ? {
            role: null != h ? h : "row",
            tabIndex: null != p ? p : 0,
            onClick: c ? void 0 : d,
            onKeyDown: e => {
                c || (null == u || u(e), e.defaultPrevented || ("Enter" === e.key || " " === e.key) && (e.preventDefault(), null == d || d(e)))
            }
        } : {
            role: h,
            tabIndex: p,
            onClick: d,
            onKeyDown: u
        };
        return r.default.createElement("tr", {
            ref: t,
            "aria-selected": l ? o : void 0,
            "aria-disabled": !!l && !!c || void 0,
            "data-selected": o || void 0,
            className: (0, s.default)("foundation-web-table-row", (l || i) && "hover:bg-shift-100", l && !c && "cursor-pointer", l && c && "opacity-disabled pointer-events-none", o && "bg-shift-200", n),
            ...g,
            ...f
        }, a)
    });
    S.displayName = "TableRow";
    let x = (0, r.forwardRef)((e, a) => {
        let {
            children: n,
            className: l,
            sortDirection: i,
            onSort: o,
            align: c = "start",
            sortLabel: d,
            scope: u,
            ...p
        } = e, {
            size: y
        } = m("TableHeaderCell"), A = !!o, T = null != i ? i : "none", I = A && "none" !== T && r.default.createElement(t.Icon, {
            name: "ascending" === T ? "icon-regular-arrow-small-up" : "icon-regular-arrow-small-down",
            size: "XSmall",
            className: "shrink-0 content-muted"
        }), S = r.default.createElement("div", {
            className: (0, s.default)("flex items-center gap-xsmall", g[y], "content-muted", b[c])
        }, "end" === c && I, r.default.createElement("span", {
            className: "text-truncate-end"
        }, n), "end" !== c && I), x = "string" == typeof n ? "Sort by ".concat(n) : void 0;
        return r.default.createElement("th", {
            ref: a,
            scope: null != u ? u : "col",
            "aria-sort": A ? T : void 0,
            className: (0, s.default)("foundation-web-table-header-cell foundation-web-table-header-cell-divider", f[y], h[y], v[c], "content-muted", l),
            ...p
        }, A ? r.default.createElement("button", {
            type: "button",
            className: "bg-none stroke-none padding-none margin-none cursor-pointer width-full content-inherit [font:inherit] [text-align:inherit] focus-visible:outline-focus hover:content-default hover:bg-shift-100 radius-small",
            onClick: o,
            "aria-label": null != d ? d : x
        }, S) : S)
    });
    x.displayName = "TableHeaderCell";
    let C = (0, r.forwardRef)((e, t) => {
        let {
            children: a,
            className: n,
            align: l = "start",
            ...i
        } = e, {
            size: o
        } = m("TableCell");
        return r.default.createElement("td", {
            ref: t,
            className: (0, s.default)("foundation-web-table-cell foundation-web-table-row-divider", p[o], h[o], y[o], v[l], "content-default", n),
            ...i
        }, a)
    });
    C.displayName = "TableCell";
    let E = {
            XSmall: "padding-x-small",
            Small: "padding-x-medium",
            Medium: "padding-x-large"
        },
        w = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-medium"
        },
        D = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-small"
        },
        N = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium"
        },
        k = (0, r.forwardRef)((e, t) => {
            let {
                size: a = "Medium",
                page: n,
                rowsPerPage: l,
                totalRows: i,
                rowsPerPageOptions: o = [10, 25, 50],
                onPageChange: c,
                onRowsPerPageChange: u,
                paginationAriaLabel: m,
                rowsPerPageLabel: p = "Rows per page",
                firstPageLabel: h = "First page",
                previousPageLabel: f = "Previous page",
                nextPageLabel: g = "Next page",
                lastPageLabel: y = "Last page",
                rangeLabel: v,
                className: b,
                ...A
            } = e, T = Math.max(1, Math.ceil(i / l)), I = 0 === i ? 0 : n * l + 1, S = Math.min((n + 1) * l, i), x = (0, r.useCallback)(e => {
                let t = Number(e.target.value);
                null == u || u(t), c(0)
            }, [u, c]);
            return r.default.createElement("div", {
                ref: t,
                className: (0, s.default)("flex items-center justify-end", E[a], w[a], b),
                ...A
            }, r.default.createElement("div", {
                className: "flex items-center gap-large"
            }, r.default.createElement("div", {
                className: "flex items-center gap-xlarge"
            }, u && r.default.createElement("div", {
                className: "flex items-center gap-small"
            }, r.default.createElement("span", {
                className: (0, s.default)(D[a], "content-default")
            }, p), r.default.createElement("div", {
                className: "foundation-web-table-pagination-select-wrapper relative"
            }, r.default.createElement("select", {
                className: (0, s.default)("foundation-web-table-pagination-select", D[a], "content-default bg-action-standard radius-small cursor-pointer", "Medium" === a ? "height-800 padding-x-medium" : "height-600 padding-x-small"),
                value: l,
                onChange: x,
                "aria-label": p
            }, o.map(e => r.default.createElement("option", {
                key: e,
                value: e
            }, e))))), r.default.createElement("span", {
                className: (0, s.default)(N[a], "content-default")
            }, v ? v(I, S, i) : "".concat(I, "-").concat(S, " of ").concat(i))), r.default.createElement(d, {
                "aria-label": m,
                currentPage: n + 1,
                totalPages: T,
                navType: "NoPage",
                size: "Medium" === a ? "Medium" : "Small",
                hasFirstLastButtons: !0,
                isAlwaysVisible: !0,
                firstPageLabel: h,
                previousPageLabel: f,
                nextPageLabel: g,
                lastPageLabel: y,
                onPageChange: e => c(e - 1)
            })))
        });
    k.displayName = "TablePagination", e.s(["Table", 0, A, "TableBody", 0, I, "TableCell", 0, C, "TableHeader", 0, T, "TableHeaderCell", 0, x, "TablePagination", 0, k, "TableRow", 0, S], 278300)
}, 622361, e => {
    "use strict";
    var t = e.i(999544),
        a = e.i(944821),
        n = e.i(482076),
        s = e.i(197649),
        r = e.i(416340);
    let l = {
            XSmall: "padding-x-small",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-medium"
        },
        i = {
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
        d = r.default.forwardRef((e, d) => {
            let {
                size: u,
                variant: m = "Standard",
                label: p,
                value: h,
                defaultValue: f,
                isDisabled: g,
                hasError: y,
                helperText: v,
                className: b,
                style: A,
                textareaClassName: T,
                textareaStyle: I,
                id: S,
                ...x
            } = e, C = (0, a.default)(), E = S || C, w = "".concat(E, "-description"), D = null != u ? u : "Large";
            return r.default.createElement("div", {
                className: (0, s.default)("flex fill flex-col width-full gap-small", {
                    [t.disabledOpacity]: g
                }, b),
                style: A
            }, p && r.default.createElement("label", {
                htmlFor: E,
                className: (0, s.default)(o[D], "content-emphasis")
            }, p), r.default.createElement("textarea", {
                ref: d,
                id: E,
                "data-testid": "text-area-container",
                style: I,
                className: (0, s.default)("foundation-web-text-area foundation-web-input outline-none", "radius-medium content-emphasis placeholder:content-muted", n.INPUT_BACKGROUND_BY_VARIANT[m], n.INPUT_STROKE_BY_VARIANT[m], y ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", c[D], l[D], i[D], T),
                value: h,
                defaultValue: null == h ? f : void 0,
                disabled: g,
                "aria-describedby": v ? w : void 0,
                ...x
            }), v && r.default.createElement("span", {
                id: w,
                className: (0, s.default)("text-caption-small", {
                    "content-system-alert": y,
                    "content-default": !y
                })
            }, v))
        });
    d.displayName = "TextArea", e.s(["TextArea", 0, d])
}, 246602, e => {
    "use strict";
    var t = e.i(737586),
        a = e.i(999544),
        n = e.i(197649),
        s = e.i(416340),
        r = e.i(466538);
    let l = {
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
        i = s.default.forwardRef((e, i) => {
            let {
                label: o,
                "aria-label": c,
                "aria-labelledby": d,
                className: u,
                isChecked: m,
                isDisabled: p,
                size: h,
                hint: f,
                placement: g,
                onCheckedChange: y,
                ...v
            } = e, {
                toggleWidth: b,
                toggleHeight: A,
                thumbSize: T,
                textSize: I,
                textPadding: S
            } = l[h];
            return s.default.createElement("label", {
                className: (0, n.default)("foundation-web-toggle flex items-start gap-medium", {
                    [a.disabledOpacity]: p,
                    "cursor-pointer": !p,
                    "flex-row": "Start" === g,
                    "flex-row-reverse": "End" === g
                }, u)
            }, s.default.createElement(r.Root, {
                "data-slot": "toggle",
                ...v,
                ref: i,
                className: (0, n.default)(t.interactable, !p && "cursor-pointer", "grow-0 shrink-0 basis-auto flex items-center padding-xxsmall stroke-none radius-circle transition-colors", b, A, "group/toggle", "data-[state=unchecked]:bg-action-standard", "data-[state=checked]:bg-system-contrast"),
                disabled: p,
                checked: m,
                onCheckedChange: y,
                "aria-label": c,
                "aria-labelledby": d
            }, s.default.createElement(t.StateLayer, null), s.default.createElement("span", {
                className: (0, n.default)("motion-safe:transition-[flex-grow] ease-standard-out duration-300", "group-data-[state=unchecked]/toggle:size-0", "group-data-[state=checked]/toggle:fill")
            }), s.default.createElement(r.Thumb, {
                className: (0, n.default)("transition-colors radius-circle flex justify-center items-center", T, "data-[state=unchecked]:bg-[var(--color-content-emphasis)]", "data-[state=checked]:bg-[var(--inverse-content-emphasis)]")
            }, s.default.createElement("span", {
                className: (0, n.default)("icon icon-filled-check transition-opacity", T, "group-data-[state=unchecked]/toggle:opacity-[0]", "group-data-[state=checked]/toggle:opacity-[1] group-data-[state=checked]/toggle:[transition-delay:50ms]")
            })), s.default.createElement("span", {
                className: (0, n.default)("motion-safe:transition-[flex-grow] ease-standard-out duration-300", "group-data-[state=unchecked]/toggle:fill", "group-data-[state=checked]/toggle:size-0")
            })), o ? s.default.createElement("div", {
                className: (0, n.default)("flex flex-col fill", I)
            }, s.default.createElement("span", {
                className: (0, n.default)("content-emphasis", S)
            }, o), f && s.default.createElement("span", {
                className: "content-default"
            }, f)) : null)
        });
    i.displayName = "Toggle", e.s(["Toggle", 0, i])
}, 893502, e => {
    "use strict";
    var t = e.i(477763),
        a = e.i(169336),
        n = e.i(416340),
        s = e.i(226319),
        r = e.i(928277),
        l = e.i(79888),
        i = e.i(221628),
        o = e.i(506391),
        c = e.i(823079),
        d = e.i(127633),
        u = e.i(929709),
        m = e.i(416408),
        p = e.i(442632);

    function h(e) {
        return (0, a.g)("MuiFormGroup", e)
    }(0, r.g)("MuiFormGroup", ["root", "row", "error"]);
    let f = ["className", "row"],
        g = (0, s.s)("div", {
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
        y = n.forwardRef(function(e, n) {
            let r = (0, p.u)({
                    props: e,
                    name: "MuiFormGroup"
                }),
                {
                    className: l,
                    row: o = !1
                } = r,
                c = (0, a._)(r, f),
                d = (0, u.u)(),
                y = (0, m.f)({
                    props: r,
                    muiFormControl: d,
                    states: ["error"]
                }),
                v = (0, t._)({}, r, {
                    row: o,
                    error: y.error
                }),
                b = (e => {
                    let {
                        classes: t,
                        row: a,
                        error: n
                    } = e;
                    return (0, s.a)({
                        root: ["root", a && "row", n && "error"]
                    }, h, t)
                })(v);
            return (0, i.jsx)(g, (0, t._)({
                className: (0, s.c)(b.root, l),
                ownerState: v,
                ref: n
            }, c))
        });
    var v = e.i(91375),
        b = e.i(588393),
        A = e.i(520091),
        T = e.i(576070);
    e.i(802400);
    var I = e.i(811550);

    function S(e) {
        return (0, a.g)("MuiRadioGroup", e)
    }(0, r.g)("MuiRadioGroup", ["root", "row", "error"]);
    let x = ["actions", "children", "className", "defaultValue", "name", "onChange", "value"],
        C = n.forwardRef(function(e, r) {
            let {
                actions: u,
                children: m,
                className: p,
                defaultValue: h,
                name: f,
                onChange: g,
                value: v
            } = e, b = (0, a._)(e, x), A = n.useRef(null), T = (e => {
                let {
                    classes: t,
                    row: a,
                    error: n
                } = e;
                return (0, s.a)({
                    root: ["root", a && "row", n && "error"]
                }, S, t)
            })(e), [I, C] = (0, o.u)({
                controlled: v,
                default: h,
                name: "RadioGroup"
            });
            n.useImperativeHandle(u, () => ({
                focus: () => {
                    let e = A.current.querySelector("input:not(:disabled):checked");
                    e || (e = A.current.querySelector("input:not(:disabled)")), e && e.focus()
                }
            }), []);
            let E = (0, c.u)(r, A),
                w = (0, d.u)(f),
                D = n.useMemo(() => ({
                    name: w,
                    onChange(e) {
                        C(e.target.value), g && g(e, e.target.value)
                    },
                    value: I
                }), [w, g, C, I]);
            return (0, i.jsx)(l.R.Provider, {
                value: D,
                children: (0, i.jsx)(y, (0, t._)({
                    role: "radiogroup",
                    ref: E,
                    className: (0, s.c)(T.root, p)
                }, b, {
                    children: m
                }))
            })
        });
    var E = (0, b.c)((0, i.jsx)("path", {
            d: "M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"
        }), "Star"),
        w = (0, b.c)((0, i.jsx)("path", {
            d: "M22 9.24l-7.19-.62L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21 12 17.27 18.18 21l-1.63-7.03L22 9.24zM12 15.4l-3.76 2.27 1-4.28-3.32-2.88 4.38-.38L12 6.1l1.71 4.04 4.38.38-3.32 2.88 1 4.28L12 15.4z"
        }), "StarBorder");

    function D(e) {
        return (0, a.g)("MuiRating", e)
    }
    var N = (0, r.g)("MuiRating", ["root", "sizeSmall", "sizeMedium", "sizeLarge", "readOnly", "disabled", "focusVisible", "visuallyHidden", "pristine", "label", "labelEmptyValueActive", "icon", "iconEmpty", "iconFilled", "iconHover", "iconFocus", "iconActive", "decimal"]);
    let k = ["value"],
        M = ["className", "defaultValue", "disabled", "emptyIcon", "emptyLabelText", "getLabelText", "highlightSelectedOnly", "icon", "IconContainerComponent", "max", "name", "onChange", "onChangeActive", "onMouseLeave", "onMouseMove", "precision", "readOnly", "size", "value"];

    function L(e, t) {
        let a;
        return null == e ? e : Number((Math.round(e / t) * t).toFixed((a = t.toString().split(".")[1]) ? a.length : 0))
    }
    let P = (0, s.s)("span", {
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
        F = (0, s.s)("label", {
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
        _ = (0, s.s)("span", {
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
        R = (0, s.s)("span", {
            name: "MuiRating",
            slot: "Decimal",
            shouldForwardProp: e => (0, s.b)(e) && "iconActive" !== e,
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
        let n = (0, a._)(e, k);
        return (0, i.jsx)("span", (0, t._)({}, n))
    }

    function U(e) {
        let {
            classes: a,
            disabled: r,
            emptyIcon: l,
            focus: o,
            getLabelText: c,
            highlightSelectedOnly: u,
            hover: m,
            icon: p,
            IconContainerComponent: h,
            isActive: f,
            itemValue: g,
            labelProps: y,
            name: v,
            onBlur: b,
            onChange: A,
            onClick: T,
            onFocus: I,
            readOnly: S,
            ownerState: x,
            ratingValue: C,
            ratingValueRounded: E
        } = e, w = u ? g === C : g <= C, D = g <= m, N = g <= o, k = g === E, M = (0, d.u)(), L = (0, i.jsx)(_, {
            as: h,
            value: g,
            className: (0, s.c)(a.icon, w ? a.iconFilled : a.iconEmpty, D && a.iconHover, N && a.iconFocus, f && a.iconActive),
            ownerState: (0, t._)({}, x, {
                iconEmpty: !w,
                iconFilled: w,
                iconHover: D,
                iconFocus: N,
                iconActive: f
            }),
            children: l && !w ? l : p
        });
        return S ? (0, i.jsx)("span", (0, t._)({}, y, {
            children: L
        })) : (0, i.jsxs)(n.Fragment, {
            children: [(0, i.jsxs)(F, (0, t._)({
                ownerState: (0, t._)({}, x, {
                    emptyValueFocused: void 0
                }),
                htmlFor: M
            }, y, {
                children: [L, (0, i.jsx)("span", {
                    className: a.visuallyHidden,
                    children: c(g)
                })]
            })), (0, i.jsx)("input", {
                className: a.visuallyHidden,
                onFocus: I,
                onBlur: b,
                onChange: A,
                onClick: T,
                disabled: r,
                value: g,
                id: M,
                type: "radio",
                name: v,
                checked: k
            })]
        })
    }
    let B = (0, i.jsx)(E, {
            fontSize: "inherit"
        }),
        O = (0, i.jsx)(w, {
            fontSize: "inherit"
        });

    function j(e) {
        return "".concat(e, " Star").concat(1 !== e ? "s" : "")
    }
    n.forwardRef(function(e, r) {
        let l = (0, p.u)({
                name: "MuiRating",
                props: e
            }),
            {
                className: u,
                defaultValue: m = null,
                disabled: h = !1,
                emptyIcon: f = O,
                emptyLabelText: g = "Empty",
                getLabelText: y = j,
                highlightSelectedOnly: b = !1,
                icon: A = B,
                IconContainerComponent: S = V,
                max: x = 5,
                name: C,
                onChange: E,
                onChangeActive: w,
                onMouseLeave: N,
                onMouseMove: k,
                precision: _ = 1,
                readOnly: G = !1,
                size: H = "medium",
                value: K
            } = l,
            z = (0, a._)(l, M),
            W = (0, d.u)(C),
            [q, X] = (0, o.u)({
                controlled: K,
                default: m,
                name: "Rating"
            }),
            Y = L(q, _),
            Q = (0, v.u)(),
            [{
                hover: J,
                focus: Z
            }, $] = n.useState({
                hover: -1,
                focus: -1
            }),
            ee = Y; - 1 !== J && (ee = J), -1 !== Z && (ee = Z);
        let {
            isFocusVisibleRef: et,
            onBlur: ea,
            onFocus: en,
            ref: es
        } = (0, T.u)(), [er, el] = n.useState(!1), ei = n.useRef(), eo = (0, c.u)(es, ei, r), ec = e => {
            let t = "" === e.target.value ? null : parseFloat(e.target.value); - 1 !== J && (t = J), X(t), E && E(e, t)
        }, ed = e => {
            0 === e.clientX && 0 === e.clientY || ($({
                hover: -1,
                focus: -1
            }), X(null), E && parseFloat(e.target.value) === Y && E(e, null))
        }, eu = e => {
            en(e), !0 === et.current && el(!0);
            let t = parseFloat(e.target.value);
            $(e => ({
                hover: e.hover,
                focus: t
            }))
        }, em = e => {
            -1 === J && (ea(e), !1 === et.current && el(!1), $(e => ({
                hover: e.hover,
                focus: -1
            })))
        }, [ep, eh] = n.useState(!1), ef = (0, t._)({}, l, {
            defaultValue: m,
            disabled: h,
            emptyIcon: f,
            emptyLabelText: g,
            emptyValueFocused: ep,
            focusVisible: er,
            getLabelText: y,
            icon: A,
            IconContainerComponent: S,
            max: x,
            precision: _,
            readOnly: G,
            size: H
        }), eg = (e => {
            let {
                classes: t,
                size: n,
                readOnly: r,
                disabled: l,
                emptyValueFocused: i,
                focusVisible: o
            } = e, c = {
                root: ["root", "size".concat((0, a.a)(n)), l && "disabled", o && "focusVisible", r && "readOnly"],
                label: ["label", "pristine"],
                labelEmptyValue: [i && "labelEmptyValueActive"],
                icon: ["icon"],
                iconEmpty: ["iconEmpty"],
                iconFilled: ["iconFilled"],
                iconHover: ["iconHover"],
                iconFocus: ["iconFocus"],
                iconActive: ["iconActive"],
                decimal: ["decimal"],
                visuallyHidden: ["visuallyHidden"]
            };
            return (0, s.a)(c, D, t)
        })(ef);
        return (0, i.jsxs)(P, (0, t._)({
            ref: eo,
            onMouseMove: e => {
                k && k(e);
                let {
                    right: t,
                    left: a,
                    width: n
                } = ei.current.getBoundingClientRect(), s = L(x * (Q ? (t - e.clientX) / n : (e.clientX - a) / n) + _ / 2, _);
                s = (0, I.c)(s, _, x), $(e => e.hover === s && e.focus === s ? e : {
                    hover: s,
                    focus: s
                }), el(!1), w && J !== s && w(e, s)
            },
            onMouseLeave: e => {
                N && N(e), $({
                    hover: -1,
                    focus: -1
                }), w && -1 !== J && w(e, -1)
            },
            className: (0, s.c)(eg.root, u, G && "MuiRating-readOnly"),
            ownerState: ef,
            role: G ? "img" : null,
            "aria-label": G ? y(ee) : null
        }, z, {
            children: [Array.from(Array(x)).map((e, a) => {
                let n = a + 1,
                    r = {
                        classes: eg,
                        disabled: h,
                        emptyIcon: f,
                        focus: Z,
                        getLabelText: y,
                        highlightSelectedOnly: b,
                        hover: J,
                        icon: A,
                        IconContainerComponent: S,
                        name: W,
                        onBlur: em,
                        onChange: ec,
                        onClick: ed,
                        onFocus: eu,
                        ratingValue: ee,
                        ratingValueRounded: Y,
                        readOnly: G,
                        ownerState: ef
                    },
                    l = n === Math.ceil(ee) && (-1 !== J || -1 !== Z);
                if (_ < 1) {
                    let e = Array.from(Array(1 / _));
                    return (0, i.jsx)(R, {
                        className: (0, s.c)(eg.decimal, l && eg.iconActive),
                        ownerState: ef,
                        iconActive: l,
                        children: e.map((a, s) => {
                            let l = L(n - 1 + (s + 1) * _, _);
                            return (0, i.jsx)(U, (0, t._)({}, r, {
                                isActive: !1,
                                itemValue: l,
                                labelProps: {
                                    style: e.length - 1 === s ? {} : {
                                        width: l === ee ? (s + 1) * _ * 100 + "%" : "0%",
                                        overflow: "hidden",
                                        position: "absolute"
                                    }
                                }
                            }), l)
                        })
                    }, n)
                }
                return (0, i.jsx)(U, (0, t._)({}, r, {
                    isActive: l,
                    itemValue: n
                }), n)
            }), !G && !h && (0, i.jsxs)(F, {
                className: (0, s.c)(eg.label, eg.labelEmptyValue),
                ownerState: ef,
                children: [(0, i.jsx)("input", {
                    className: eg.visuallyHidden,
                    value: "",
                    id: "".concat(W, "-empty"),
                    type: "radio",
                    name: W,
                    checked: null == Y,
                    onFocus: () => eh(!0),
                    onBlur: () => eh(!1),
                    onChange: ec
                }), (0, i.jsx)("span", {
                    className: eg.visuallyHidden,
                    children: g
                })]
            })]
        }))
    }), e.s(["RadioGroup", 0, C], 893502)
}]);

//# debugId=e1cd30f1-4719-7cd7-5a81-58a80467ac80
//# sourceMappingURL=0l_uiah6j-bx8.js.map